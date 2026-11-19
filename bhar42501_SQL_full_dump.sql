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
) ENGINE=MyISAM AUTO_INCREMENT=43 DEFAULT CHARSET=latin1 COMMENT='5D lottery 10-min: period/round registry';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fived_periods_10min`
--

LOCK TABLES `fived_periods_10min` WRITE;
/*!40000 ALTER TABLE `fived_periods_10min` DISABLE KEYS */;
INSERT INTO `fived_periods_10min` VALUES (2,'20261119102040078','2026-11-19 12:50:00'),(3,'20261119102040079','2026-11-19 13:00:01'),(4,'20261119102040080','2026-11-19 13:10:00'),(5,'20261119102040081','2026-11-19 13:20:01'),(6,'20261119102040082','2026-11-19 13:30:01'),(7,'20261119102040083','2026-11-19 13:40:01'),(8,'20261119102040084','2026-11-19 13:50:01'),(9,'20261119102040085','2026-11-19 14:00:02'),(10,'20261119102040086','2026-11-19 14:10:00'),(11,'20261119102040087','2026-11-19 14:20:01'),(12,'20261119102040088','2026-11-19 14:40:00'),(13,'20261119102040089','2026-11-19 14:50:00'),(14,'20261119102040090','2026-11-19 15:00:01'),(15,'20261119102040091','2026-11-19 15:10:00'),(16,'20261119102040092','2026-11-19 15:20:01'),(17,'20261119102040093','2026-11-19 15:30:02'),(18,'20261119102040094','2026-11-19 17:50:21'),(19,'20261119102040095','2026-11-19 18:00:17'),(20,'20261119102040096','2026-11-19 18:10:11'),(21,'20261119102040097','2026-11-19 18:10:57'),(22,'20261119102040098','2026-11-19 18:20:07'),(23,'20261119102040099','2026-11-19 18:20:53'),(24,'20261119102040100','2026-11-19 18:30:03'),(25,'20261119102040101','2026-11-19 18:30:49'),(26,'20261119102040102','2026-11-19 18:40:44'),(27,'20261119102040103','2026-11-19 18:50:39'),(28,'20261119102040104','2026-11-19 19:00:35'),(29,'20261119102040105','2026-11-19 19:10:29'),(30,'20261119102040106','2026-11-19 19:30:13'),(31,'20261119102040107','2026-11-19 19:30:41'),(32,'20261119102040108','2026-11-19 19:40:21'),(33,'20261119102040109','2026-11-19 19:40:48'),(34,'20261119102040110','2026-11-19 19:50:36'),(35,'20261119102040111','2026-11-19 19:51:04'),(36,'20261119102040112','2026-11-19 20:00:22'),(37,'20261119102040113','2026-11-19 20:00:52'),(38,'20261119102040114','2026-11-19 20:10:21'),(39,'20261119102040115','2026-11-19 20:10:49'),(40,'20261119102040116','2026-11-19 20:20:09'),(41,'20261119102040117','2026-11-19 20:21:04'),(42,'20261119102040118','2026-11-19 20:32:50');
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
) ENGINE=MyISAM AUTO_INCREMENT=457 DEFAULT CHARSET=latin1 COMMENT='5D lottery 1-min: period/round registry';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fived_periods_1min`
--

LOCK TABLES `fived_periods_1min` WRITE;
/*!40000 ALTER TABLE `fived_periods_1min` DISABLE KEYS */;
INSERT INTO `fived_periods_1min` VALUES (12,'20261119102010752','2026-11-19 12:31:12'),(13,'20261119102010753','2026-11-19 12:33:08'),(14,'20261119102010754','2026-11-19 12:34:23'),(15,'20261119102010755','2026-11-19 12:34:55'),(16,'20261119102010756','2026-11-19 12:44:01'),(17,'20261119102010757','2026-11-19 12:45:00'),(18,'20261119102010758','2026-11-19 12:46:00'),(19,'20261119102010759','2026-11-19 12:47:00'),(20,'20261119102010760','2026-11-19 12:48:00'),(21,'20261119102010761','2026-11-19 12:49:00'),(22,'20261119102010762','2026-11-19 12:50:00'),(23,'20261119102010763','2026-11-19 12:51:00'),(24,'20261119102010764','2026-11-19 12:52:00'),(25,'20261119102010765','2026-11-19 12:53:00'),(26,'20261119102010766','2026-11-19 12:54:00'),(27,'20261119102010767','2026-11-19 12:55:00'),(28,'20261119102010768','2026-11-19 12:56:00'),(29,'20261119102010769','2026-11-19 12:57:00'),(30,'20261119102010770','2026-11-19 12:58:00'),(31,'20261119102010771','2026-11-19 12:59:00'),(32,'20261119102010772','2026-11-19 13:00:00'),(33,'20261119102010773','2026-11-19 13:01:00'),(34,'20261119102010774','2026-11-19 13:02:00'),(35,'20261119102010775','2026-11-19 13:03:00'),(36,'20261119102010776','2026-11-19 13:04:00'),(37,'20261119102010777','2026-11-19 13:05:00'),(38,'20261119102010778','2026-11-19 13:06:00'),(39,'20261119102010779','2026-11-19 13:07:00'),(40,'20261119102010780','2026-11-19 13:08:00'),(41,'20261119102010781','2026-11-19 13:09:00'),(42,'20261119102010782','2026-11-19 13:10:00'),(43,'20261119102010783','2026-11-19 13:11:00'),(44,'20261119102010784','2026-11-19 13:12:00'),(45,'20261119102010785','2026-11-19 13:13:00'),(46,'20261119102010786','2026-11-19 13:14:00'),(47,'20261119102010787','2026-11-19 13:15:00'),(48,'20261119102010788','2026-11-19 13:16:00'),(49,'20261119102010789','2026-11-19 13:17:00'),(50,'20261119102010790','2026-11-19 13:18:00'),(51,'20261119102010791','2026-11-19 13:19:00'),(52,'20261119102010792','2026-11-19 13:20:00'),(53,'20261119102010793','2026-11-19 13:21:00'),(54,'20261119102010794','2026-11-19 13:22:00'),(55,'20261119102010795','2026-11-19 13:23:00'),(56,'20261119102010796','2026-11-19 13:24:00'),(57,'20261119102010797','2026-11-19 13:25:00'),(58,'20261119102010798','2026-11-19 13:26:00'),(59,'20261119102010799','2026-11-19 13:27:00'),(60,'20261119102010800','2026-11-19 13:28:00'),(61,'20261119102010801','2026-11-19 13:29:00'),(62,'20261119102010802','2026-11-19 13:30:00'),(63,'20261119102010803','2026-11-19 13:31:00'),(64,'20261119102010804','2026-11-19 13:32:00'),(65,'20261119102010805','2026-11-19 13:33:00'),(66,'20261119102010806','2026-11-19 13:34:00'),(67,'20261119102010807','2026-11-19 13:35:00'),(68,'20261119102010808','2026-11-19 13:36:00'),(69,'20261119102010809','2026-11-19 13:37:00'),(70,'20261119102010810','2026-11-19 13:38:00'),(71,'20261119102010811','2026-11-19 13:39:00'),(72,'20261119102010812','2026-11-19 13:40:00'),(73,'20261119102010813','2026-11-19 13:41:00'),(74,'20261119102010814','2026-11-19 13:42:00'),(75,'20261119102010815','2026-11-19 13:43:00'),(76,'20261119102010816','2026-11-19 13:44:00'),(77,'20261119102010817','2026-11-19 13:45:00'),(78,'20261119102010818','2026-11-19 13:46:00'),(79,'20261119102010819','2026-11-19 13:47:00'),(80,'20261119102010820','2026-11-19 13:48:00'),(81,'20261119102010821','2026-11-19 13:49:00'),(82,'20261119102010822','2026-11-19 13:50:00'),(83,'20261119102010823','2026-11-19 13:51:00'),(84,'20261119102010824','2026-11-19 13:52:00'),(85,'20261119102010825','2026-11-19 13:53:00'),(86,'20261119102010826','2026-11-19 13:54:00'),(87,'20261119102010827','2026-11-19 13:55:00'),(88,'20261119102010828','2026-11-19 13:56:00'),(89,'20261119102010829','2026-11-19 13:57:00'),(90,'20261119102010830','2026-11-19 13:58:00'),(91,'20261119102010831','2026-11-19 13:59:00'),(92,'20261119102010832','2026-11-19 14:00:00'),(93,'20261119102010833','2026-11-19 14:01:00'),(94,'20261119102010834','2026-11-19 14:02:00'),(95,'20261119102010835','2026-11-19 14:03:00'),(96,'20261119102010836','2026-11-19 14:04:00'),(97,'20261119102010837','2026-11-19 14:05:00'),(98,'20261119102010838','2026-11-19 14:06:00'),(99,'20261119102010839','2026-11-19 14:07:00'),(100,'20261119102010840','2026-11-19 14:08:00'),(101,'20261119102010841','2026-11-19 14:09:00'),(102,'20261119102010842','2026-11-19 14:10:00'),(103,'20261119102010843','2026-11-19 14:11:00'),(104,'20261119102010844','2026-11-19 14:12:00'),(105,'20261119102010845','2026-11-19 14:13:00'),(106,'20261119102010846','2026-11-19 14:14:00'),(107,'20261119102010847','2026-11-19 14:15:00'),(108,'20261119102010848','2026-11-19 14:16:00'),(109,'20261119102010849','2026-11-19 14:17:00'),(110,'20261119102010850','2026-11-19 14:18:00'),(111,'20261119102010851','2026-11-19 14:19:00'),(112,'20261119102010852','2026-11-19 14:20:00'),(113,'20261119102010853','2026-11-19 14:21:00'),(114,'20261119102010854','2026-11-19 14:22:00'),(115,'20261119102010855','2026-11-19 14:23:00'),(116,'20261119102010856','2026-11-19 14:24:00'),(117,'20261119102010857','2026-11-19 14:25:00'),(118,'20261119102010858','2026-11-19 14:26:00'),(119,'20261119102010859','2026-11-19 14:27:00'),(120,'20261119102010860','2026-11-19 14:28:00'),(121,'20261119102010861','2026-11-19 14:29:00'),(122,'20261119102010862','2026-11-19 14:29:04'),(123,'20261119102010863','2026-11-19 14:29:11'),(124,'20261119102010864','2026-11-19 14:29:23'),(125,'20261119102010865','2026-11-19 14:30:00'),(126,'20261119102010866','2026-11-19 14:31:00'),(127,'20261119102010867','2026-11-19 14:32:00'),(128,'20261119102010868','2026-11-19 14:33:00'),(129,'20261119102010869','2026-11-19 14:34:00'),(130,'20261119102010870','2026-11-19 14:35:00'),(131,'20261119102010871','2026-11-19 14:36:00'),(132,'20261119102010872','2026-11-19 14:37:00'),(133,'20261119102010873','2026-11-19 14:38:00'),(134,'20261119102010874','2026-11-19 14:39:00'),(135,'20261119102010875','2026-11-19 14:40:00'),(136,'20261119102010876','2026-11-19 14:41:00'),(137,'20261119102010877','2026-11-19 14:42:00'),(138,'20261119102010878','2026-11-19 14:43:00'),(139,'20261119102010879','2026-11-19 14:44:00'),(140,'20261119102010880','2026-11-19 14:45:00'),(141,'20261119102010881','2026-11-19 14:46:00'),(142,'20261119102010882','2026-11-19 14:47:00'),(143,'20261119102010883','2026-11-19 14:48:00'),(144,'20261119102010884','2026-11-19 14:49:00'),(145,'20261119102010885','2026-11-19 14:50:00'),(146,'20261119102010886','2026-11-19 14:51:00'),(147,'20261119102010887','2026-11-19 14:52:00'),(148,'20261119102010888','2026-11-19 14:53:01'),(149,'20261119102010889','2026-11-19 14:54:00'),(150,'20261119102010890','2026-11-19 14:55:00'),(151,'20261119102010891','2026-11-19 14:56:00'),(152,'20261119102010892','2026-11-19 14:57:00'),(153,'20261119102010893','2026-11-19 14:58:00'),(154,'20261119102010894','2026-11-19 14:59:00'),(155,'20261119102010895','2026-11-19 15:00:00'),(156,'20261119102010896','2026-11-19 15:01:00'),(157,'20261119102010897','2026-11-19 15:02:00'),(158,'20261119102010898','2026-11-19 15:03:00'),(159,'20261119102010899','2026-11-19 15:04:00'),(160,'20261119102010900','2026-11-19 15:05:00'),(161,'20261119102010901','2026-11-19 15:06:00'),(162,'20261119102010902','2026-11-19 15:07:00'),(163,'20261119102010903','2026-11-19 15:08:01'),(164,'20261119102010904','2026-11-19 15:09:00'),(165,'20261119102010905','2026-11-19 15:10:00'),(166,'20261119102010906','2026-11-19 15:11:00'),(167,'20261119102010907','2026-11-19 15:12:00'),(168,'20261119102010908','2026-11-19 15:13:00'),(169,'20261119102010909','2026-11-19 15:14:00'),(170,'20261119102010910','2026-11-19 15:15:00'),(171,'20261119102010911','2026-11-19 15:16:00'),(172,'20261119102010912','2026-11-19 15:17:00'),(173,'20261119102010913','2026-11-19 15:18:00'),(174,'20261119102010914','2026-11-19 15:19:00'),(175,'20261119102010915','2026-11-19 15:20:00'),(176,'20261119102010916','2026-11-19 15:21:00'),(177,'20261119102010917','2026-11-19 15:22:00'),(178,'20261119102010918','2026-11-19 15:23:00'),(179,'20261119102010919','2026-11-19 15:24:00'),(180,'20261119102010920','2026-11-19 15:25:00'),(181,'20261119102010921','2026-11-19 15:26:00'),(182,'20261119102010922','2026-11-19 15:27:00'),(183,'20261119102010923','2026-11-19 15:28:00'),(184,'20261119102010924','2026-11-19 15:29:00'),(185,'20261119102010925','2026-11-19 15:30:00'),(186,'20261119102010926','2026-11-19 15:31:00'),(187,'20261119102010927','2026-11-19 15:32:00'),(188,'20261119102010928','2026-11-19 15:33:00'),(189,'20261119102010929','2026-11-19 15:34:00'),(190,'20261119102010930','2026-11-19 15:35:00'),(191,'20261119102010931','2026-11-19 15:35:03'),(192,'20261119102010932','2026-11-19 15:35:21'),(193,'20261119102010933','2026-11-19 15:35:48'),(194,'20261119102010934','2026-11-19 15:36:00'),(195,'20261119102010935','2026-11-19 15:37:00'),(196,'20261119102010936','2026-11-19 15:38:00'),(197,'20261119102010937','2026-11-19 15:38:51'),(198,'20261119102010938','2026-11-19 15:39:00'),(199,'20261119102010939','2026-11-19 17:44:13'),(200,'20261119102010940','2026-11-19 17:44:59'),(201,'20261119102010941','2026-11-19 17:45:45'),(202,'20261119102010942','2026-11-19 17:46:31'),(203,'20261119102010943','2026-11-19 17:47:17'),(204,'20261119102010944','2026-11-19 17:48:03'),(205,'20261119102010945','2026-11-19 17:48:49'),(206,'20261119102010946','2026-11-19 17:49:35'),(207,'20261119102010947','2026-11-19 17:50:20'),(208,'20261119102010948','2026-11-19 17:51:06'),(209,'20261119102010949','2026-11-19 17:51:52'),(210,'20261119102010950','2026-11-19 17:52:38'),(211,'20261119102010951','2026-11-19 17:53:24'),(212,'20261119102010952','2026-11-19 17:54:10'),(213,'20261119102010953','2026-11-19 17:54:55'),(214,'20261119102010954','2026-11-19 17:55:41'),(215,'20261119102010955','2026-11-19 17:56:27'),(216,'20261119102010956','2026-11-19 17:57:13'),(217,'20261119102010957','2026-11-19 17:57:59'),(218,'20261119102010958','2026-11-19 17:58:45'),(219,'20261119102010959','2026-11-19 17:59:30'),(220,'20261119102010960','2026-11-19 18:00:16'),(221,'20261119102010961','2026-11-19 18:01:01'),(222,'20261119102010962','2026-11-19 18:01:47'),(223,'20261119102010963','2026-11-19 18:02:33'),(224,'20261119102010964','2026-11-19 18:03:19'),(225,'20261119102010965','2026-11-19 18:04:04'),(226,'20261119102010966','2026-11-19 18:04:50'),(227,'20261119102010967','2026-11-19 18:05:36'),(228,'20261119102010968','2026-11-19 18:06:22'),(229,'20261119102010969','2026-11-19 18:07:08'),(230,'20261119102010970','2026-11-19 18:07:53'),(231,'20261119102010971','2026-11-19 18:08:39'),(232,'20261119102010972','2026-11-19 18:09:25'),(233,'20261119102010973','2026-11-19 18:10:10'),(234,'20261119102010974','2026-11-19 18:10:57'),(235,'20261119102010975','2026-11-19 18:11:43'),(236,'20261119102010976','2026-11-19 18:12:29'),(237,'20261119102010977','2026-11-19 18:13:15'),(238,'20261119102010978','2026-11-19 18:14:00'),(239,'20261119102010979','2026-11-19 18:14:46'),(240,'20261119102010980','2026-11-19 18:15:31'),(241,'20261119102010981','2026-11-19 18:16:18'),(242,'20261119102010982','2026-11-19 18:17:04'),(243,'20261119102010983','2026-11-19 18:17:49'),(244,'20261119102010984','2026-11-19 18:18:35'),(245,'20261119102010985','2026-11-19 18:19:21'),(246,'20261119102010986','2026-11-19 18:20:06'),(247,'20261119102010987','2026-11-19 18:20:53'),(248,'20261119102010988','2026-11-19 18:21:39'),(249,'20261119102010989','2026-11-19 18:22:25'),(250,'20261119102010990','2026-11-19 18:23:10'),(251,'20261119102010991','2026-11-19 18:23:56'),(252,'20261119102010992','2026-11-19 18:24:42'),(253,'20261119102010993','2026-11-19 18:25:28'),(254,'20261119102010994','2026-11-19 18:26:14'),(255,'20261119102010995','2026-11-19 18:26:59'),(256,'20261119102010996','2026-11-19 18:27:45'),(257,'20261119102010997','2026-11-19 18:28:31'),(258,'20261119102010998','2026-11-19 18:29:17'),(259,'20261119102010999','2026-11-19 18:30:02'),(260,'20261119102011000','2026-11-19 18:30:48'),(261,'20261119102011001','2026-11-19 18:31:33'),(262,'20261119102011002','2026-11-19 18:32:19'),(263,'20261119102011003','2026-11-19 18:33:05'),(264,'20261119102011004','2026-11-19 18:33:51'),(265,'20261119102011005','2026-11-19 18:34:36'),(266,'20261119102011006','2026-11-19 18:35:22'),(267,'20261119102011007','2026-11-19 18:36:08'),(268,'20261119102011008','2026-11-19 18:36:54'),(269,'20261119102011009','2026-11-19 18:37:40'),(270,'20261119102011010','2026-11-19 18:38:26'),(271,'20261119102011011','2026-11-19 18:39:11'),(272,'20261119102011012','2026-11-19 18:39:57'),(273,'20261119102011013','2026-11-19 18:40:43'),(274,'20261119102011014','2026-11-19 18:41:29'),(275,'20261119102011015','2026-11-19 18:42:15'),(276,'20261119102011016','2026-11-19 18:43:01'),(277,'20261119102011017','2026-11-19 18:43:46'),(278,'20261119102011018','2026-11-19 18:44:32'),(279,'20261119102011019','2026-11-19 18:45:18'),(280,'20261119102011020','2026-11-19 18:46:04'),(281,'20261119102011021','2026-11-19 18:46:50'),(282,'20261119102011022','2026-11-19 18:47:35'),(283,'20261119102011023','2026-11-19 18:48:21'),(284,'20261119102011024','2026-11-19 18:49:07'),(285,'20261119102011025','2026-11-19 18:49:53'),(286,'20261119102011026','2026-11-19 18:50:38'),(287,'20261119102011027','2026-11-19 18:51:25'),(288,'20261119102011028','2026-11-19 18:52:10'),(289,'20261119102011029','2026-11-19 18:52:56'),(290,'20261119102011030','2026-11-19 18:53:42'),(291,'20261119102011031','2026-11-19 18:54:27'),(292,'20261119102011032','2026-11-19 18:55:13'),(293,'20261119102011033','2026-11-19 18:55:59'),(294,'20261119102011034','2026-11-19 18:56:45'),(295,'20261119102011035','2026-11-19 18:57:31'),(296,'20261119102011036','2026-11-19 18:58:17'),(297,'20261119102011037','2026-11-19 18:59:02'),(298,'20261119102011038','2026-11-19 18:59:48'),(299,'20261119102011039','2026-11-19 19:00:34'),(300,'20261119102011040','2026-11-19 19:01:19'),(301,'20261119102011041','2026-11-19 19:02:05'),(302,'20261119102011042','2026-11-19 19:02:50'),(303,'20261119102011043','2026-11-19 19:03:36'),(304,'20261119102011044','2026-11-19 19:04:22'),(305,'20261119102011045','2026-11-19 19:05:08'),(306,'20261119102011046','2026-11-19 19:05:54'),(307,'20261119102011047','2026-11-19 19:06:40'),(308,'20261119102011048','2026-11-19 19:07:25'),(309,'20261119102011049','2026-11-19 19:08:11'),(310,'20261119102011050','2026-11-19 19:08:57'),(311,'20261119102011051','2026-11-19 19:09:42'),(312,'20261119102011052','2026-11-19 19:10:28'),(313,'20261119102011053','2026-11-19 19:11:14'),(314,'20261119102011054','2026-11-19 19:12:00'),(315,'20261119102011055','2026-11-19 19:12:46'),(316,'20261119102011056','2026-11-19 19:13:31'),(317,'20261119102011057','2026-11-19 19:14:17'),(318,'20261119102011058','2026-11-19 19:15:03'),(319,'20261119102011059','2026-11-19 19:15:49'),(320,'20261119102011060','2026-11-19 19:16:35'),(321,'20261119102011061','2026-11-19 19:17:21'),(322,'20261119102011062','2026-11-19 19:17:52'),(323,'20261119102011063','2026-11-19 19:18:22'),(324,'20261119102011064','2026-11-19 19:18:55'),(325,'20261119102011065','2026-11-19 19:22:58'),(326,'20261119102011066','2026-11-19 19:25:35'),(327,'20261119102011067','2026-11-19 19:26:03'),(328,'20261119102011068','2026-11-19 19:26:31'),(329,'20261119102011069','2026-11-19 19:26:58'),(330,'20261119102011070','2026-11-19 19:27:26'),(331,'20261119102011071','2026-11-19 19:27:54'),(332,'20261119102011072','2026-11-19 19:28:22'),(333,'20261119102011073','2026-11-19 19:28:50'),(334,'20261119102011074','2026-11-19 19:29:17'),(335,'20261119102011075','2026-11-19 19:29:45'),(336,'20261119102011076','2026-11-19 19:30:13'),(337,'20261119102011077','2026-11-19 19:30:40'),(338,'20261119102011078','2026-11-19 19:31:25'),(339,'20261119102011079','2026-11-19 19:31:52'),(340,'20261119102011080','2026-11-19 19:32:17'),(341,'20261119102011081','2026-11-19 19:32:45'),(342,'20261119102011082','2026-11-19 19:33:13'),(343,'20261119102011083','2026-11-19 19:33:41'),(344,'20261119102011084','2026-11-19 19:34:08'),(345,'20261119102011085','2026-11-19 19:34:36'),(346,'20261119102011086','2026-11-19 19:35:08'),(347,'20261119102011087','2026-11-19 19:35:36'),(348,'20261119102011088','2026-11-19 19:36:03'),(349,'20261119102011089','2026-11-19 19:36:32'),(350,'20261119102011090','2026-11-19 19:36:59'),(351,'20261119102011091','2026-11-19 19:37:27'),(352,'20261119102011092','2026-11-19 19:37:55'),(353,'20261119102011093','2026-11-19 19:38:23'),(354,'20261119102011094','2026-11-19 19:38:50'),(355,'20261119102011095','2026-11-19 19:39:18'),(356,'20261119102011096','2026-11-19 19:39:46'),(357,'20261119102011097','2026-11-19 19:40:13'),(358,'20261119102011098','2026-11-19 19:40:41'),(359,'20261119102011099','2026-11-19 19:41:09'),(360,'20261119102011100','2026-11-19 19:41:37'),(361,'20261119102011101','2026-11-19 19:42:04'),(362,'20261119102011102','2026-11-19 19:42:33'),(363,'20261119102011103','2026-11-19 19:43:01'),(364,'20261119102011104','2026-11-19 19:43:29'),(365,'20261119102011105','2026-11-19 19:43:57'),(366,'20261119102011106','2026-11-19 19:44:25'),(367,'20261119102011107','2026-11-19 19:44:53'),(368,'20261119102011108','2026-11-19 19:45:21'),(369,'20261119102011109','2026-11-19 19:45:49'),(370,'20261119102011110','2026-11-19 19:46:18'),(371,'20261119102011111','2026-11-19 19:46:45'),(372,'20261119102011112','2026-11-19 19:47:13'),(373,'20261119102011113','2026-11-19 19:47:41'),(374,'20261119102011114','2026-11-19 19:48:09'),(375,'20261119102011115','2026-11-19 19:48:37'),(376,'20261119102011116','2026-11-19 19:49:05'),(377,'20261119102011117','2026-11-19 19:49:32'),(378,'20261119102011118','2026-11-19 19:50:00'),(379,'20261119102011119','2026-11-19 19:50:28'),(380,'20261119102011120','2026-11-19 19:50:56'),(381,'20261119102011121','2026-11-19 19:51:24'),(382,'20261119102011122','2026-11-19 19:51:52'),(383,'20261119102011123','2026-11-19 19:52:19'),(384,'20261119102011124','2026-11-19 19:52:47'),(385,'20261119102011125','2026-11-19 19:53:15'),(386,'20261119102011126','2026-11-19 19:53:43'),(387,'20261119102011127','2026-11-19 19:54:11'),(388,'20261119102011128','2026-11-19 19:54:39'),(389,'20261119102011129','2026-11-19 19:55:07'),(390,'20261119102011130','2026-11-19 19:55:34'),(391,'20261119102011131','2026-11-19 19:56:03'),(392,'20261119102011132','2026-11-19 19:56:30'),(393,'20261119102011133','2026-11-19 19:56:58'),(394,'20261119102011134','2026-11-19 19:57:26'),(395,'20261119102011135','2026-11-19 19:57:53'),(396,'20261119102011136','2026-11-19 19:58:21'),(397,'20261119102011137','2026-11-19 19:58:49'),(398,'20261119102011138','2026-11-19 19:59:16'),(399,'20261119102011139','2026-11-19 19:59:44'),(400,'20261119102011140','2026-11-19 20:00:12'),(401,'20261119102011141','2026-11-19 20:00:40'),(402,'20261119102011142','2026-11-19 20:01:09'),(403,'20261119102011143','2026-11-19 20:01:37'),(404,'20261119102011144','2026-11-19 20:02:04'),(405,'20261119102011145','2026-11-19 20:02:33'),(406,'20261119102011146','2026-11-19 20:03:00'),(407,'20261119102011147','2026-11-19 20:03:28'),(408,'20261119102011148','2026-11-19 20:03:56'),(409,'20261119102011149','2026-11-19 20:04:20'),(410,'20261119102011150','2026-11-19 20:04:48'),(411,'20261119102011151','2026-11-19 20:05:15'),(412,'20261119102011152','2026-11-19 20:05:43'),(413,'20261119102011153','2026-11-19 20:06:11'),(414,'20261119102011154','2026-11-19 20:06:39'),(415,'20261119102011155','2026-11-19 20:07:07'),(416,'20261119102011156','2026-11-19 20:07:53'),(417,'20261119102011157','2026-11-19 20:08:21'),(418,'20261119102011158','2026-11-19 20:09:06'),(419,'20261119102011159','2026-11-19 20:09:40'),(420,'20261119102011160','2026-11-19 20:09:52'),(421,'20261119102011161','2026-11-19 20:10:20'),(422,'20261119102011162','2026-11-19 20:10:49'),(423,'20261119102011163','2026-11-19 20:11:17'),(424,'20261119102011164','2026-11-19 20:11:45'),(425,'20261119102011165','2026-11-19 20:12:12'),(426,'20261119102011166','2026-11-19 20:12:40'),(427,'20261119102011167','2026-11-19 20:13:08'),(428,'20261119102011168','2026-11-19 20:13:36'),(429,'20261119102011169','2026-11-19 20:14:03'),(430,'20261119102011170','2026-11-19 20:14:31'),(431,'20261119102011171','2026-11-19 20:14:59'),(432,'20261119102011172','2026-11-19 20:15:26'),(433,'20261119102011173','2026-11-19 20:16:13'),(434,'20261119102011174','2026-11-19 20:16:59'),(435,'20261119102011175','2026-11-19 20:17:45'),(436,'20261119102011176','2026-11-19 20:18:31'),(437,'20261119102011177','2026-11-19 20:19:17'),(438,'20261119102011178','2026-11-19 20:20:03'),(439,'20261119102011179','2026-11-19 20:20:31'),(440,'20261119102011180','2026-11-19 20:21:17'),(441,'20261119102011181','2026-11-19 20:22:03'),(442,'20261119102011182','2026-11-19 20:22:49'),(443,'20261119102011183','2026-11-19 20:23:34'),(444,'20261119102011184','2026-11-19 20:24:20'),(445,'20261119102011185','2026-11-19 20:24:49'),(446,'20261119102011186','2026-11-19 20:25:35'),(447,'20261119102011187','2026-11-19 20:26:21'),(448,'20261119102011188','2026-11-19 20:27:22'),(449,'20261119102011189','2026-11-19 20:28:41'),(450,'20261119102011190','2026-11-19 20:29:50'),(451,'20261119102011191','2026-11-19 20:31:09'),(452,'20261119102011192','2026-11-19 20:33:36'),(453,'20261119102011193','2026-11-19 20:35:30'),(454,'20261119102011194','2026-11-19 20:36:49'),(455,'20261119102011195','2026-11-19 20:38:25'),(456,'20261119102011196','2026-11-19 20:39:36');
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
) ENGINE=MyISAM AUTO_INCREMENT=149 DEFAULT CHARSET=latin1 COMMENT='5D lottery 3-min: period/round registry';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fived_periods_3min`
--

LOCK TABLES `fived_periods_3min` WRITE;
/*!40000 ALTER TABLE `fived_periods_3min` DISABLE KEYS */;
INSERT INTO `fived_periods_3min` VALUES (7,'20261119102020252','2026-11-19 12:33:09'),(8,'20261119102020253','2026-11-19 12:45:00'),(9,'20261119102020254','2026-11-19 12:48:01'),(10,'20261119102020255','2026-11-19 12:51:01'),(11,'20261119102020256','2026-11-19 12:54:00'),(12,'20261119102020257','2026-11-19 12:57:00'),(13,'20261119102020258','2026-11-19 13:00:00'),(14,'20261119102020259','2026-11-19 13:03:00'),(15,'20261119102020260','2026-11-19 13:06:00'),(16,'20261119102020261','2026-11-19 13:09:00'),(17,'20261119102020262','2026-11-19 13:12:00'),(18,'20261119102020263','2026-11-19 13:15:01'),(19,'20261119102020264','2026-11-19 13:18:00'),(20,'20261119102020265','2026-11-19 13:21:01'),(21,'20261119102020266','2026-11-19 13:24:00'),(22,'20261119102020267','2026-11-19 13:27:01'),(23,'20261119102020268','2026-11-19 13:30:00'),(24,'20261119102020269','2026-11-19 13:33:00'),(25,'20261119102020270','2026-11-19 13:36:01'),(26,'20261119102020271','2026-11-19 13:39:00'),(27,'20261119102020272','2026-11-19 13:42:00'),(28,'20261119102020273','2026-11-19 13:45:00'),(29,'20261119102020274','2026-11-19 13:48:00'),(30,'20261119102020275','2026-11-19 13:51:01'),(31,'20261119102020276','2026-11-19 13:54:00'),(32,'20261119102020277','2026-11-19 13:57:01'),(33,'20261119102020278','2026-11-19 14:00:01'),(34,'20261119102020279','2026-11-19 14:03:00'),(35,'20261119102020280','2026-11-19 14:06:01'),(36,'20261119102020281','2026-11-19 14:09:00'),(37,'20261119102020282','2026-11-19 14:12:01'),(38,'20261119102020283','2026-11-19 14:15:00'),(39,'20261119102020284','2026-11-19 14:18:01'),(40,'20261119102020285','2026-11-19 14:21:01'),(41,'20261119102020286','2026-11-19 14:24:00'),(42,'20261119102020287','2026-11-19 14:27:01'),(43,'20261119102020288','2026-11-19 14:33:00'),(44,'20261119102020289','2026-11-19 14:36:01'),(45,'20261119102020290','2026-11-19 14:39:00'),(46,'20261119102020291','2026-11-19 14:42:00'),(47,'20261119102020292','2026-11-19 14:45:01'),(48,'20261119102020293','2026-11-19 14:48:00'),(49,'20261119102020294','2026-11-19 14:51:00'),(50,'20261119102020295','2026-11-19 14:54:00'),(51,'20261119102020296','2026-11-19 14:57:01'),(52,'20261119102020297','2026-11-19 15:00:00'),(53,'20261119102020298','2026-11-19 15:03:00'),(54,'20261119102020299','2026-11-19 15:06:00'),(55,'20261119102020300','2026-11-19 15:09:01'),(56,'20261119102020301','2026-11-19 15:12:00'),(57,'20261119102020302','2026-11-19 15:15:01'),(58,'20261119102020303','2026-11-19 15:18:01'),(59,'20261119102020304','2026-11-19 15:21:01'),(60,'20261119102020305','2026-11-19 15:24:01'),(61,'20261119102020306','2026-11-19 15:27:00'),(62,'20261119102020307','2026-11-19 15:30:01'),(63,'20261119102020308','2026-11-19 15:33:00'),(64,'20261119102020309','2026-11-19 17:45:45'),(65,'20261119102020310','2026-11-19 17:48:03'),(66,'20261119102020311','2026-11-19 17:48:49'),(67,'20261119102020312','2026-11-19 17:51:07'),(68,'20261119102020313','2026-11-19 17:51:53'),(69,'20261119102020314','2026-11-19 17:54:10'),(70,'20261119102020315','2026-11-19 17:54:56'),(71,'20261119102020316','2026-11-19 17:57:13'),(72,'20261119102020317','2026-11-19 17:57:59'),(73,'20261119102020318','2026-11-19 18:00:16'),(74,'20261119102020319','2026-11-19 18:03:19'),(75,'20261119102020320','2026-11-19 18:06:22'),(76,'20261119102020321','2026-11-19 18:09:25'),(77,'20261119102020322','2026-11-19 18:12:29'),(78,'20261119102020323','2026-11-19 18:15:32'),(79,'20261119102020324','2026-11-19 18:18:35'),(80,'20261119102020325','2026-11-19 18:21:39'),(81,'20261119102020326','2026-11-19 18:24:42'),(82,'20261119102020327','2026-11-19 18:27:45'),(83,'20261119102020328','2026-11-19 18:30:03'),(84,'20261119102020329','2026-11-19 18:30:48'),(85,'20261119102020330','2026-11-19 18:33:05'),(86,'20261119102020331','2026-11-19 18:33:51'),(87,'20261119102020332','2026-11-19 18:36:08'),(88,'20261119102020333','2026-11-19 18:36:54'),(89,'20261119102020334','2026-11-19 18:39:11'),(90,'20261119102020335','2026-11-19 18:39:57'),(91,'20261119102020336','2026-11-19 18:42:15'),(92,'20261119102020337','2026-11-19 18:45:18'),(93,'20261119102020338','2026-11-19 18:48:21'),(94,'20261119102020339','2026-11-19 18:51:25'),(95,'20261119102020340','2026-11-19 18:54:28'),(96,'20261119102020341','2026-11-19 18:57:31'),(97,'20261119102020342','2026-11-19 19:00:34'),(98,'20261119102020343','2026-11-19 19:03:36'),(99,'20261119102020344','2026-11-19 19:06:40'),(100,'20261119102020345','2026-11-19 19:09:43'),(101,'20261119102020346','2026-11-19 19:12:00'),(102,'20261119102020347','2026-11-19 19:12:46'),(103,'20261119102020348','2026-11-19 19:15:03'),(104,'20261119102020349','2026-11-19 19:15:49'),(105,'20261119102020350','2026-11-19 19:18:22'),(106,'20261119102020351','2026-11-19 19:18:55'),(107,'20261119102020352','2026-11-19 19:27:26'),(108,'20261119102020353','2026-11-19 19:27:54'),(109,'20261119102020354','2026-11-19 19:30:13'),(110,'20261119102020355','2026-11-19 19:30:40'),(111,'20261119102020356','2026-11-19 19:33:13'),(112,'20261119102020357','2026-11-19 19:33:41'),(113,'20261119102020358','2026-11-19 19:36:42'),(114,'20261119102020359','2026-11-19 19:37:08'),(115,'20261119102020360','2026-11-19 19:39:25'),(116,'20261119102020361','2026-11-19 19:39:52'),(117,'20261119102020362','2026-11-19 19:42:11'),(118,'20261119102020363','2026-11-19 19:42:39'),(119,'20261119102020364','2026-11-19 19:43:09'),(120,'20261119102020365','2026-11-19 19:45:27'),(121,'20261119102020366','2026-11-19 19:45:56'),(122,'20261119102020367','2026-11-19 19:48:16'),(123,'20261119102020368','2026-11-19 19:48:45'),(124,'20261119102020369','2026-11-19 19:51:32'),(125,'20261119102020370','2026-11-19 19:51:59'),(126,'20261119102020371','2026-11-19 19:54:19'),(127,'20261119102020372','2026-11-19 19:54:47'),(128,'20261119102020373','2026-11-19 19:57:33'),(129,'20261119102020374','2026-11-19 19:58:01'),(130,'20261119102020375','2026-11-19 20:00:19'),(131,'20261119102020376','2026-11-19 20:00:48'),(132,'20261119102020377','2026-11-19 20:03:35'),(133,'20261119102020378','2026-11-19 20:04:03'),(134,'20261119102020379','2026-11-19 20:06:12'),(135,'20261119102020380','2026-11-19 20:06:39'),(136,'20261119102020381','2026-11-19 20:09:40'),(137,'20261119102020382','2026-11-19 20:09:41'),(138,'20261119102020383','2026-11-19 20:09:53'),(139,'20261119102020384','2026-11-19 20:12:12'),(140,'20261119102020385','2026-11-19 20:12:40'),(141,'20261119102020386','2026-11-19 20:16:00'),(142,'20261119102020387','2026-11-19 20:19:04'),(143,'20261119102020388','2026-11-19 20:21:50'),(144,'20261119102020389','2026-11-19 20:24:36'),(145,'20261119102020390','2026-11-19 20:25:23'),(146,'20261119102020391','2026-11-19 20:32:16'),(147,'20261119102020392','2026-11-19 20:34:44'),(148,'20261119102020393','2026-11-19 20:37:38');
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
) ENGINE=MyISAM AUTO_INCREMENT=90 DEFAULT CHARSET=latin1 COMMENT='5D lottery 5-min: period/round registry';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fived_periods_5min`
--

LOCK TABLES `fived_periods_5min` WRITE;
/*!40000 ALTER TABLE `fived_periods_5min` DISABLE KEYS */;
INSERT INTO `fived_periods_5min` VALUES (3,'20261119102030154','2026-11-19 12:45:00'),(4,'20261119102030155','2026-11-19 12:50:00'),(5,'20261119102030156','2026-11-19 12:55:00'),(6,'20261119102030157','2026-11-19 13:00:01'),(7,'20261119102030158','2026-11-19 13:05:00'),(8,'20261119102030159','2026-11-19 13:10:00'),(9,'20261119102030160','2026-11-19 13:15:01'),(10,'20261119102030161','2026-11-19 13:20:00'),(11,'20261119102030162','2026-11-19 13:25:01'),(12,'20261119102030163','2026-11-19 13:30:00'),(13,'20261119102030164','2026-11-19 13:35:00'),(14,'20261119102030165','2026-11-19 13:40:01'),(15,'20261119102030166','2026-11-19 13:45:01'),(16,'20261119102030167','2026-11-19 13:50:01'),(17,'20261119102030168','2026-11-19 13:55:01'),(18,'20261119102030169','2026-11-19 14:00:02'),(19,'20261119102030170','2026-11-19 14:05:00'),(20,'20261119102030171','2026-11-19 14:10:00'),(21,'20261119102030172','2026-11-19 14:15:00'),(22,'20261119102030173','2026-11-19 14:20:01'),(23,'20261119102030174','2026-11-19 14:25:01'),(24,'20261119102030175','2026-11-19 14:35:00'),(25,'20261119102030176','2026-11-19 14:40:00'),(26,'20261119102030177','2026-11-19 14:45:01'),(27,'20261119102030178','2026-11-19 14:50:00'),(28,'20261119102030179','2026-11-19 14:55:01'),(29,'20261119102030180','2026-11-19 15:00:00'),(30,'20261119102030181','2026-11-19 15:05:00'),(31,'20261119102030182','2026-11-19 15:10:00'),(32,'20261119102030183','2026-11-19 15:15:01'),(33,'20261119102030184','2026-11-19 15:20:01'),(34,'20261119102030185','2026-11-19 15:25:00'),(35,'20261119102030186','2026-11-19 15:30:01'),(36,'20261119102030187','2026-11-19 15:35:00'),(37,'20261119102030188','2026-11-19 15:35:21'),(38,'20261119102030189','2026-11-19 15:35:48'),(39,'20261119102030190','2026-11-19 17:45:45'),(40,'20261119102030191','2026-11-19 17:50:20'),(41,'20261119102030192','2026-11-19 17:55:42'),(42,'20261119102030193','2026-11-19 18:00:17'),(43,'20261119102030194','2026-11-19 18:05:36'),(44,'20261119102030195','2026-11-19 18:10:11'),(45,'20261119102030196','2026-11-19 18:10:57'),(46,'20261119102030197','2026-11-19 18:15:32'),(47,'20261119102030198','2026-11-19 18:20:07'),(48,'20261119102030199','2026-11-19 18:20:53'),(49,'20261119102030200','2026-11-19 18:25:28'),(50,'20261119102030201','2026-11-19 18:30:03'),(51,'20261119102030202','2026-11-19 18:30:48'),(52,'20261119102030203','2026-11-19 18:35:22'),(53,'20261119102030204','2026-11-19 18:40:43'),(54,'20261119102030205','2026-11-19 18:45:18'),(55,'20261119102030206','2026-11-19 18:50:39'),(56,'20261119102030207','2026-11-19 18:55:14'),(57,'20261119102030208','2026-11-19 18:56:01'),(58,'20261119102030209','2026-11-19 19:00:34'),(59,'20261119102030210','2026-11-19 19:05:08'),(60,'20261119102030211','2026-11-19 19:05:54'),(61,'20261119102030212','2026-11-19 19:10:29'),(62,'20261119102030213','2026-11-19 19:15:03'),(63,'20261119102030214','2026-11-19 19:15:49'),(64,'20261119102030215','2026-11-19 19:25:35'),(65,'20261119102030216','2026-11-19 19:30:13'),(66,'20261119102030217','2026-11-19 19:30:41'),(67,'20261119102030218','2026-11-19 19:35:15'),(68,'20261119102030219','2026-11-19 19:35:46'),(69,'20261119102030220','2026-11-19 19:36:10'),(70,'20261119102030221','2026-11-19 19:40:21'),(71,'20261119102030222','2026-11-19 19:40:48'),(72,'20261119102030223','2026-11-19 19:45:31'),(73,'20261119102030224','2026-11-19 19:46:01'),(74,'20261119102030225','2026-11-19 19:50:35'),(75,'20261119102030226','2026-11-19 19:51:03'),(76,'20261119102030227','2026-11-19 19:55:14'),(77,'20261119102030228','2026-11-19 19:55:42'),(78,'20261119102030229','2026-11-19 19:56:10'),(79,'20261119102030230','2026-11-19 20:00:22'),(80,'20261119102030231','2026-11-19 20:00:52'),(81,'20261119102030232','2026-11-19 20:05:16'),(82,'20261119102030233','2026-11-19 20:05:44'),(83,'20261119102030234','2026-11-19 20:10:21'),(84,'20261119102030235','2026-11-19 20:10:49'),(85,'20261119102030236','2026-11-19 20:16:00'),(86,'20261119102030237','2026-11-19 20:20:09'),(87,'20261119102030238','2026-11-19 20:21:04'),(88,'20261119102030239','2026-11-19 20:26:09'),(89,'20261119102030240','2026-11-19 20:32:50');
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
) ENGINE=MyISAM AUTO_INCREMENT=41 DEFAULT CHARSET=latin1 COMMENT='5D lottery 10-min: published draw results';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fived_results_10min`
--

LOCK TABLES `fived_results_10min` WRITE;
/*!40000 ALTER TABLE `fived_results_10min` DISABLE KEYS */;
INSERT INTO `fived_results_10min` VALUES (1,'20261119102040078','77757',33,'shonu','2026-11-19 13:00:01'),(2,'20261119102040079','55933',25,'shonu','2026-11-19 13:10:00'),(3,'20261119102040080','34969',31,'shonu','2026-11-19 13:20:01'),(4,'20261119102040081','32219',17,'shonu','2026-11-19 13:30:01'),(5,'20261119102040082','81801',18,'shonu','2026-11-19 13:40:01'),(6,'20261119102040083','00673',16,'shonu','2026-11-19 13:50:01'),(7,'20261119102040084','26907',24,'shonu','2026-11-19 14:00:02'),(8,'20261119102040085','34283',20,'shonu','2026-11-19 14:10:00'),(9,'20261119102040086','39091',22,'shonu','2026-11-19 14:20:01'),(10,'20261119102040087','29915',26,'shonu','2026-11-19 14:40:00'),(11,'20261119102040088','70839',27,'shonu','2026-11-19 14:50:00'),(12,'20261119102040089','69365',29,'shonu','2026-11-19 15:00:01'),(13,'20261119102040090','61038',18,'shonu','2026-11-19 15:10:00'),(14,'20261119102040091','73746',27,'shonu','2026-11-19 15:20:01'),(15,'20261119102040092','35236',19,'shonu','2026-11-19 15:30:02'),(16,'20261119102040093','74295',27,'shonu','2026-11-19 17:50:21'),(17,'20261119102040094','60346',19,'shonu','2026-11-19 18:00:17'),(18,'20261119102040095','28294',25,'shonu','2026-11-19 18:10:11'),(19,'20261119102040096','40871',20,'shonu','2026-11-19 18:10:57'),(20,'20261119102040097','81381',21,'shonu','2026-11-19 18:20:07'),(21,'20261119102040098','59024',20,'shonu','2026-11-19 18:20:53'),(22,'20261119102040099','12495',21,'shonu','2026-11-19 18:30:03'),(23,'20261119102040100','34722',18,'shonu','2026-11-19 18:30:49'),(24,'20261119102040101','36909',27,'shonu','2026-11-19 18:40:44'),(25,'20261119102040102','89021',20,'shonu','2026-11-19 18:50:39'),(26,'20261119102040103','84773',29,'shonu','2026-11-19 19:00:35'),(27,'20261119102040104','73442',20,'shonu','2026-11-19 19:10:29'),(28,'20261119102040105','98980',34,'shonu','2026-11-19 19:30:13'),(29,'20261119102040106','28627',25,'shonu','2026-11-19 19:30:41'),(30,'20261119102040107','41681',20,'shonu','2026-11-19 19:40:21'),(31,'20261119102040108','36713',20,'shonu','2026-11-19 19:40:48'),(32,'20261119102040109','28063',19,'shonu','2026-11-19 19:50:36'),(33,'20261119102040110','36554',23,'shonu','2026-11-19 19:51:04'),(34,'20261119102040111','23536',19,'shonu','2026-11-19 20:00:22'),(35,'20261119102040112','57925',28,'shonu','2026-11-19 20:00:52'),(36,'20261119102040113','16496',26,'shonu','2026-11-19 20:10:21'),(37,'20261119102040114','20673',18,'shonu','2026-11-19 20:10:49'),(38,'20261119102040115','59441',23,'shonu','2026-11-19 20:20:09'),(39,'20261119102040116','41363',17,'shonu','2026-11-19 20:21:04'),(40,'20261119102040117','49145',23,'shonu','2026-11-19 20:32:50');
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
) ENGINE=MyISAM AUTO_INCREMENT=455 DEFAULT CHARSET=latin1 COMMENT='5D lottery 1-min: published 5-digit draw results per period';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fived_results_1min`
--

LOCK TABLES `fived_results_1min` WRITE;
/*!40000 ALTER TABLE `fived_results_1min` DISABLE KEYS */;
INSERT INTO `fived_results_1min` VALUES (11,'20261119102010752','21875',23,'shonu','2026-11-19 12:33:08'),(12,'20261119102010753','64296',27,'shonu','2026-11-19 12:34:23'),(13,'20261119102010754','91473',24,'shonu','2026-11-19 12:34:55'),(14,'20261119102010755','48997',37,'shonu','2026-11-19 12:44:01'),(15,'20261119102010756','82411',16,'shonu','2026-11-19 12:45:00'),(16,'20261119102010757','42516',18,'shonu','2026-11-19 12:46:00'),(17,'20261119102010758','56485',28,'shonu','2026-11-19 12:47:00'),(18,'20261119102010759','25523',17,'shonu','2026-11-19 12:48:00'),(19,'20261119102010760','11329',16,'shonu','2026-11-19 12:49:00'),(20,'20261119102010761','79073',26,'shonu','2026-11-19 12:50:00'),(21,'20261119102010762','65237',23,'shonu','2026-11-19 12:51:00'),(22,'20261119102010763','10667',20,'shonu','2026-11-19 12:52:00'),(23,'20261119102010764','69307',25,'shonu','2026-11-19 12:53:00'),(24,'20261119102010765','38197',28,'shonu','2026-11-19 12:54:00'),(25,'20261119102010766','38359',28,'shonu','2026-11-19 12:55:00'),(26,'20261119102010767','28106',17,'shonu','2026-11-19 12:56:00'),(27,'20261119102010768','95801',23,'shonu','2026-11-19 12:57:00'),(28,'20261119102010769','83387',29,'shonu','2026-11-19 12:58:00'),(29,'20261119102010770','39226',22,'shonu','2026-11-19 12:59:00'),(30,'20261119102010771','66211',16,'shonu','2026-11-19 13:00:00'),(31,'20261119102010772','76411',19,'shonu','2026-11-19 13:01:00'),(32,'20261119102010773','54094',22,'shonu','2026-11-19 13:02:00'),(33,'20261119102010774','56894',32,'shonu','2026-11-19 13:03:00'),(34,'20261119102010775','71961',24,'shonu','2026-11-19 13:04:00'),(35,'20261119102010776','70625',20,'shonu','2026-11-19 13:05:00'),(36,'20261119102010777','76148',26,'shonu','2026-11-19 13:06:00'),(37,'20261119102010778','84921',24,'shonu','2026-11-19 13:07:00'),(38,'20261119102010779','86391',27,'shonu','2026-11-19 13:08:00'),(39,'20261119102010780','33920',17,'shonu','2026-11-19 13:09:00'),(40,'20261119102010781','12051',9,'shonu','2026-11-19 13:10:00'),(41,'20261119102010782','05750',17,'shonu','2026-11-19 13:11:00'),(42,'20261119102010783','05357',20,'shonu','2026-11-19 13:12:00'),(43,'20261119102010784','89288',35,'shonu','2026-11-19 13:13:00'),(44,'20261119102010785','40305',12,'shonu','2026-11-19 13:14:00'),(45,'20261119102010786','21972',21,'shonu','2026-11-19 13:15:00'),(46,'20261119102010787','28503',18,'shonu','2026-11-19 13:16:00'),(47,'20261119102010788','89776',37,'shonu','2026-11-19 13:17:00'),(48,'20261119102010789','29050',16,'shonu','2026-11-19 13:18:00'),(49,'20261119102010790','95524',25,'shonu','2026-11-19 13:19:00'),(50,'20261119102010791','11729',20,'shonu','2026-11-19 13:20:00'),(51,'20261119102010792','14284',19,'shonu','2026-11-19 13:21:00'),(52,'20261119102010793','43094',20,'shonu','2026-11-19 13:22:00'),(53,'20261119102010794','43155',18,'shonu','2026-11-19 13:23:00'),(54,'20261119102010795','75161',20,'shonu','2026-11-19 13:24:00'),(55,'20261119102010796','17754',24,'shonu','2026-11-19 13:25:00'),(56,'20261119102010797','52847',26,'shonu','2026-11-19 13:26:00'),(57,'20261119102010798','55535',23,'shonu','2026-11-19 13:27:00'),(58,'20261119102010799','08508',21,'shonu','2026-11-19 13:28:00'),(59,'20261119102010800','18410',14,'shonu','2026-11-19 13:29:00'),(60,'20261119102010801','57788',35,'shonu','2026-11-19 13:30:00'),(61,'20261119102010802','85885',34,'shonu','2026-11-19 13:31:00'),(62,'20261119102010803','23533',16,'shonu','2026-11-19 13:32:00'),(63,'20261119102010804','63864',27,'shonu','2026-11-19 13:33:00'),(64,'20261119102010805','09955',28,'shonu','2026-11-19 13:34:00'),(65,'20261119102010806','40594',22,'shonu','2026-11-19 13:35:00'),(66,'20261119102010807','28139',23,'shonu','2026-11-19 13:36:00'),(67,'20261119102010808','37301',14,'shonu','2026-11-19 13:37:00'),(68,'20261119102010809','49635',27,'shonu','2026-11-19 13:38:00'),(69,'20261119102010810','20137',13,'shonu','2026-11-19 13:39:00'),(70,'20261119102010811','53849',29,'shonu','2026-11-19 13:40:00'),(71,'20261119102010812','23859',27,'shonu','2026-11-19 13:41:00'),(72,'20261119102010813','05416',16,'shonu','2026-11-19 13:42:00'),(73,'20261119102010814','10640',11,'shonu','2026-11-19 13:43:00'),(74,'20261119102010815','07076',20,'shonu','2026-11-19 13:44:00'),(75,'20261119102010816','08273',20,'shonu','2026-11-19 13:45:00'),(76,'20261119102010817','58066',25,'shonu','2026-11-19 13:46:00'),(77,'20261119102010818','74779',34,'shonu','2026-11-19 13:47:00'),(78,'20261119102010819','34337',20,'shonu','2026-11-19 13:48:00'),(79,'20261119102010820','70462',19,'shonu','2026-11-19 13:49:00'),(80,'20261119102010821','10793',20,'shonu','2026-11-19 13:50:00'),(81,'20261119102010822','51551',17,'shonu','2026-11-19 13:51:00'),(82,'20261119102010823','79931',29,'shonu','2026-11-19 13:52:00'),(83,'20261119102010824','73810',19,'shonu','2026-11-19 13:53:00'),(84,'20261119102010825','30202',7,'shonu','2026-11-19 13:54:00'),(85,'20261119102010826','88665',33,'shonu','2026-11-19 13:55:00'),(86,'20261119102010827','59592',30,'shonu','2026-11-19 13:56:00'),(87,'20261119102010828','82506',21,'shonu','2026-11-19 13:57:00'),(88,'20261119102010829','71383',22,'shonu','2026-11-19 13:58:00'),(89,'20261119102010830','69017',23,'shonu','2026-11-19 13:59:00'),(90,'20261119102010831','64251',18,'shonu','2026-11-19 14:00:00'),(91,'20261119102010832','83058',24,'shonu','2026-11-19 14:01:00'),(92,'20261119102010833','01070',8,'shonu','2026-11-19 14:02:00'),(93,'20261119102010834','92524',22,'shonu','2026-11-19 14:03:00'),(94,'20261119102010835','57670',25,'shonu','2026-11-19 14:04:00'),(95,'20261119102010836','41510',11,'shonu','2026-11-19 14:05:00'),(96,'20261119102010837','40012',7,'shonu','2026-11-19 14:06:00'),(97,'20261119102010838','52296',24,'shonu','2026-11-19 14:07:00'),(98,'20261119102010839','86280',24,'shonu','2026-11-19 14:08:00'),(99,'20261119102010840','51145',16,'shonu','2026-11-19 14:09:00'),(100,'20261119102010841','40787',26,'shonu','2026-11-19 14:10:00'),(101,'20261119102010842','70223',14,'shonu','2026-11-19 14:11:00'),(102,'20261119102010843','42226',16,'shonu','2026-11-19 14:12:00'),(103,'20261119102010844','70658',26,'shonu','2026-11-19 14:13:00'),(104,'20261119102010845','48756',30,'shonu','2026-11-19 14:14:00'),(105,'20261119102010846','89335',28,'shonu','2026-11-19 14:15:00'),(106,'20261119102010847','49008',21,'shonu','2026-11-19 14:16:00'),(107,'20261119102010848','82393',25,'shonu','2026-11-19 14:17:00'),(108,'20261119102010849','89542',28,'shonu','2026-11-19 14:18:00'),(109,'20261119102010850','61398',27,'shonu','2026-11-19 14:19:00'),(110,'20261119102010851','22766',23,'shonu','2026-11-19 14:20:00'),(111,'20261119102010852','83822',23,'shonu','2026-11-19 14:21:00'),(112,'20261119102010853','32257',19,'shonu','2026-11-19 14:22:00'),(113,'20261119102010854','93807',27,'shonu','2026-11-19 14:23:00'),(114,'20261119102010855','72751',22,'shonu','2026-11-19 14:24:00'),(115,'20261119102010856','53981',26,'shonu','2026-11-19 14:25:00'),(116,'20261119102010857','75568',31,'shonu','2026-11-19 14:26:00'),(117,'20261119102010858','08533',19,'shonu','2026-11-19 14:27:00'),(118,'20261119102010859','48798',36,'shonu','2026-11-19 14:28:00'),(119,'20261119102010860','07011',9,'shonu','2026-11-19 14:29:00'),(120,'20261119102010861','85141',19,'shonu','2026-11-19 14:29:04'),(121,'20261119102010862','52191',18,'shonu','2026-11-19 14:29:11'),(122,'20261119102010863','39774',30,'shonu','2026-11-19 14:29:23'),(123,'20261119102010864','14498',26,'shonu','2026-11-19 14:30:00'),(124,'20261119102010865','82727',26,'shonu','2026-11-19 14:31:00'),(125,'20261119102010866','89657',35,'shonu','2026-11-19 14:32:00'),(126,'20261119102010867','89109',27,'shonu','2026-11-19 14:33:00'),(127,'20261119102010868','61540',16,'shonu','2026-11-19 14:34:00'),(128,'20261119102010869','71780',23,'shonu','2026-11-19 14:35:00'),(129,'20261119102010870','57448',28,'shonu','2026-11-19 14:36:00'),(130,'20261119102010871','42914',20,'shonu','2026-11-19 14:37:00'),(131,'20261119102010872','65185',25,'shonu','2026-11-19 14:38:00'),(132,'20261119102010873','51505',16,'shonu','2026-11-19 14:39:00'),(133,'20261119102010874','68927',32,'shonu','2026-11-19 14:40:00'),(134,'20261119102010875','56998',37,'shonu','2026-11-19 14:41:00'),(135,'20261119102010876','51583',22,'shonu','2026-11-19 14:42:00'),(136,'20261119102010877','74566',28,'shonu','2026-11-19 14:43:00'),(137,'20261119102010878','28833',24,'shonu','2026-11-19 14:44:00'),(138,'20261119102010879','40648',22,'shonu','2026-11-19 14:45:00'),(139,'20261119102010880','16477',25,'shonu','2026-11-19 14:46:00'),(140,'20261119102010881','85278',30,'shonu','2026-11-19 14:47:00'),(141,'20261119102010882','01840',13,'shonu','2026-11-19 14:48:00'),(142,'20261119102010883','75856',31,'shonu','2026-11-19 14:49:00'),(143,'20261119102010884','57698',35,'shonu','2026-11-19 14:50:00'),(144,'20261119102010885','09891',27,'shonu','2026-11-19 14:51:00'),(145,'20261119102010886','00759',21,'shonu','2026-11-19 14:52:00'),(146,'20261119102010887','42175',19,'shonu','2026-11-19 14:53:01'),(147,'20261119102010888','13978',28,'shonu','2026-11-19 14:54:00'),(148,'20261119102010889','76780',28,'shonu','2026-11-19 14:55:00'),(149,'20261119102010890','78346',28,'shonu','2026-11-19 14:56:00'),(150,'20261119102010891','79686',36,'shonu','2026-11-19 14:57:00'),(151,'20261119102010892','75120',15,'shonu','2026-11-19 14:58:00'),(152,'20261119102010893','10674',18,'shonu','2026-11-19 14:59:00'),(153,'20261119102010894','60805',19,'shonu','2026-11-19 15:00:00'),(154,'20261119102010895','75802',22,'shonu','2026-11-19 15:01:00'),(155,'20261119102010896','22852',19,'shonu','2026-11-19 15:02:00'),(156,'20261119102010897','89167',31,'shonu','2026-11-19 15:03:00'),(157,'20261119102010898','68050',19,'shonu','2026-11-19 15:04:00'),(158,'20261119102010899','35840',20,'shonu','2026-11-19 15:05:00'),(159,'20261119102010900','50065',16,'shonu','2026-11-19 15:06:00'),(160,'20261119102010901','29211',15,'shonu','2026-11-19 15:07:00'),(161,'20261119102010902','52566',24,'shonu','2026-11-19 15:08:01'),(162,'20261119102010903','75669',33,'shonu','2026-11-19 15:09:00'),(163,'20261119102010904','93081',21,'shonu','2026-11-19 15:10:00'),(164,'20261119102010905','03058',16,'shonu','2026-11-19 15:11:00'),(165,'20261119102010906','63210',12,'shonu','2026-11-19 15:12:00'),(166,'20261119102010907','03780',18,'shonu','2026-11-19 15:13:00'),(167,'20261119102010908','11518',16,'shonu','2026-11-19 15:14:00'),(168,'20261119102010909','48234',21,'shonu','2026-11-19 15:15:00'),(169,'20261119102010910','86766',33,'shonu','2026-11-19 15:16:00'),(170,'20261119102010911','69275',29,'shonu','2026-11-19 15:17:00'),(171,'20261119102010912','09430',16,'shonu','2026-11-19 15:18:00'),(172,'20261119102010913','81204',15,'shonu','2026-11-19 15:19:00'),(173,'20261119102010914','35745',24,'shonu','2026-11-19 15:20:00'),(174,'20261119102010915','66570',24,'shonu','2026-11-19 15:21:00'),(175,'20261119102010916','08997',33,'shonu','2026-11-19 15:22:00'),(176,'20261119102010917','56555',26,'shonu','2026-11-19 15:23:00'),(177,'20261119102010918','23253',15,'shonu','2026-11-19 15:24:00'),(178,'20261119102010919','60924',21,'shonu','2026-11-19 15:25:00'),(179,'20261119102010920','83091',21,'shonu','2026-11-19 15:26:00'),(180,'20261119102010921','54128',20,'shonu','2026-11-19 15:27:00'),(181,'20261119102010922','75036',21,'shonu','2026-11-19 15:28:00'),(182,'20261119102010923','70554',21,'shonu','2026-11-19 15:29:00'),(183,'20261119102010924','24792',24,'shonu','2026-11-19 15:30:00'),(184,'20261119102010925','58956',33,'shonu','2026-11-19 15:31:00'),(185,'20261119102010926','02113',7,'shonu','2026-11-19 15:32:00'),(186,'20261119102010927','29155',22,'shonu','2026-11-19 15:33:00'),(187,'20261119102010928','12917',20,'shonu','2026-11-19 15:34:00'),(188,'20261119102010929','38925',27,'shonu','2026-11-19 15:35:00'),(189,'20261119102010930','65451',21,'shonu','2026-11-19 15:35:03'),(190,'20261119102010931','04419',18,'shonu','2026-11-19 15:35:21'),(191,'20261119102010932','16967',29,'shonu','2026-11-19 15:35:48'),(192,'20261119102010933','33136',16,'shonu','2026-11-19 15:36:00'),(193,'20261119102010934','53640',18,'shonu','2026-11-19 15:37:00'),(194,'20261119102010935','77653',28,'shonu','2026-11-19 15:38:00'),(195,'20261119102010936','57150',18,'shonu','2026-11-19 15:38:51'),(196,'20261119102010937','09400',13,'shonu','2026-11-19 15:39:00'),(197,'20261119102010938','09613',19,'shonu','2026-11-19 17:44:13'),(198,'20261119102010939','38049',24,'shonu','2026-11-19 17:44:59'),(199,'20261119102010940','82886',32,'shonu','2026-11-19 17:45:45'),(200,'20261119102010941','02543',14,'shonu','2026-11-19 17:46:31'),(201,'20261119102010942','93084',24,'shonu','2026-11-19 17:47:17'),(202,'20261119102010943','31984',25,'shonu','2026-11-19 17:48:03'),(203,'20261119102010944','52906',22,'shonu','2026-11-19 17:48:49'),(204,'20261119102010945','76065',24,'shonu','2026-11-19 17:49:35'),(205,'20261119102010946','06394',22,'shonu','2026-11-19 17:50:20'),(206,'20261119102010947','85004',17,'shonu','2026-11-19 17:51:06'),(207,'20261119102010948','41709',21,'shonu','2026-11-19 17:51:52'),(208,'20261119102010949','17886',30,'shonu','2026-11-19 17:52:38'),(209,'20261119102010950','33842',20,'shonu','2026-11-19 17:53:24'),(210,'20261119102010951','81742',22,'shonu','2026-11-19 17:54:10'),(211,'20261119102010952','33694',25,'shonu','2026-11-19 17:54:55'),(212,'20261119102010953','06306',15,'shonu','2026-11-19 17:55:41'),(213,'20261119102010954','07048',19,'shonu','2026-11-19 17:56:27'),(214,'20261119102010955','75450',21,'shonu','2026-11-19 17:57:13'),(215,'20261119102010956','42975',27,'shonu','2026-11-19 17:57:59'),(216,'20261119102010957','03600',9,'shonu','2026-11-19 17:58:45'),(217,'20261119102010958','44979',33,'shonu','2026-11-19 17:59:30'),(218,'20261119102010959','17871',24,'shonu','2026-11-19 18:00:16'),(219,'20261119102010960','37150',16,'shonu','2026-11-19 18:01:01'),(220,'20261119102010961','57026',20,'shonu','2026-11-19 18:01:47'),(221,'20261119102010962','82566',27,'shonu','2026-11-19 18:02:33'),(222,'20261119102010963','41881',22,'shonu','2026-11-19 18:03:19'),(223,'20261119102010964','56892',30,'shonu','2026-11-19 18:04:04'),(224,'20261119102010965','04547',20,'shonu','2026-11-19 18:04:50'),(225,'20261119102010966','86148',27,'shonu','2026-11-19 18:05:36'),(226,'20261119102010967','12688',25,'shonu','2026-11-19 18:06:22'),(227,'20261119102010968','11184',15,'shonu','2026-11-19 18:07:08'),(228,'20261119102010969','36556',25,'shonu','2026-11-19 18:07:53'),(229,'20261119102010970','96582',30,'shonu','2026-11-19 18:08:39'),(230,'20261119102010971','61560',18,'shonu','2026-11-19 18:09:25'),(231,'20261119102010972','66119',23,'shonu','2026-11-19 18:10:10'),(232,'20261119102010973','60047',17,'shonu','2026-11-19 18:10:57'),(233,'20261119102010974','89192',29,'shonu','2026-11-19 18:11:43'),(234,'20261119102010975','95173',25,'shonu','2026-11-19 18:12:29'),(235,'20261119102010976','20716',16,'shonu','2026-11-19 18:13:15'),(236,'20261119102010977','80297',26,'shonu','2026-11-19 18:14:00'),(237,'20261119102010978','77420',20,'shonu','2026-11-19 18:14:46'),(238,'20261119102010979','53090',17,'shonu','2026-11-19 18:15:31'),(239,'20261119102010980','96399',36,'shonu','2026-11-19 18:16:18'),(240,'20261119102010981','86169',30,'shonu','2026-11-19 18:17:04'),(241,'20261119102010982','41496',24,'shonu','2026-11-19 18:17:49'),(242,'20261119102010983','67762',28,'shonu','2026-11-19 18:18:35'),(243,'20261119102010984','11034',9,'shonu','2026-11-19 18:19:21'),(244,'20261119102010985','09398',29,'shonu','2026-11-19 18:20:06'),(245,'20261119102010986','30676',22,'shonu','2026-11-19 18:20:53'),(246,'20261119102010987','77944',31,'shonu','2026-11-19 18:21:39'),(247,'20261119102010988','54902',20,'shonu','2026-11-19 18:22:25'),(248,'20261119102010989','25429',22,'shonu','2026-11-19 18:23:10'),(249,'20261119102010990','46023',15,'shonu','2026-11-19 18:23:56'),(250,'20261119102010991','91449',27,'shonu','2026-11-19 18:24:42'),(251,'20261119102010992','53048',20,'shonu','2026-11-19 18:25:28'),(252,'20261119102010993','87438',30,'shonu','2026-11-19 18:26:14'),(253,'20261119102010994','24008',14,'shonu','2026-11-19 18:26:59'),(254,'20261119102010995','12284',17,'shonu','2026-11-19 18:27:45'),(255,'20261119102010996','20574',18,'shonu','2026-11-19 18:28:31'),(256,'20261119102010997','85634',26,'shonu','2026-11-19 18:29:17'),(257,'20261119102010998','27410',14,'shonu','2026-11-19 18:30:02'),(258,'20261119102010999','92626',25,'shonu','2026-11-19 18:30:48'),(259,'20261119102011000','21115',10,'shonu','2026-11-19 18:31:33'),(260,'20261119102011001','54973',28,'shonu','2026-11-19 18:32:19'),(261,'20261119102011002','41652',18,'shonu','2026-11-19 18:33:05'),(262,'20261119102011003','91776',30,'shonu','2026-11-19 18:33:51'),(263,'20261119102011004','91112',14,'shonu','2026-11-19 18:34:36'),(264,'20261119102011005','25713',18,'shonu','2026-11-19 18:35:22'),(265,'20261119102011006','66485',29,'shonu','2026-11-19 18:36:08'),(266,'20261119102011007','74938',31,'shonu','2026-11-19 18:36:54'),(267,'20261119102011008','60775',25,'shonu','2026-11-19 18:37:40'),(268,'20261119102011009','93655',28,'shonu','2026-11-19 18:38:26'),(269,'20261119102011010','16352',17,'shonu','2026-11-19 18:39:11'),(270,'20261119102011011','53277',24,'shonu','2026-11-19 18:39:57'),(271,'20261119102011012','68113',19,'shonu','2026-11-19 18:40:43'),(272,'20261119102011013','66764',29,'shonu','2026-11-19 18:41:29'),(273,'20261119102011014','46845',27,'shonu','2026-11-19 18:42:15'),(274,'20261119102011015','16849',28,'shonu','2026-11-19 18:43:01'),(275,'20261119102011016','36451',19,'shonu','2026-11-19 18:43:46'),(276,'20261119102011017','03116',11,'shonu','2026-11-19 18:44:32'),(277,'20261119102011018','26849',29,'shonu','2026-11-19 18:45:18'),(278,'20261119102011019','77204',20,'shonu','2026-11-19 18:46:04'),(279,'20261119102011020','68348',29,'shonu','2026-11-19 18:46:50'),(280,'20261119102011021','35761',22,'shonu','2026-11-19 18:47:35'),(281,'20261119102011022','69361',25,'shonu','2026-11-19 18:48:21'),(282,'20261119102011023','59431',22,'shonu','2026-11-19 18:49:07'),(283,'20261119102011024','75093',24,'shonu','2026-11-19 18:49:53'),(284,'20261119102011025','68689',37,'shonu','2026-11-19 18:50:38'),(285,'20261119102011026','84369',30,'shonu','2026-11-19 18:51:25'),(286,'20261119102011027','34528',22,'shonu','2026-11-19 18:52:10'),(287,'20261119102011028','71738',26,'shonu','2026-11-19 18:52:56'),(288,'20261119102011029','88746',33,'shonu','2026-11-19 18:53:42'),(289,'20261119102011030','73092',21,'shonu','2026-11-19 18:54:27'),(290,'20261119102011031','84639',30,'shonu','2026-11-19 18:55:13'),(291,'20261119102011032','23812',16,'shonu','2026-11-19 18:55:59'),(292,'20261119102011033','63239',23,'shonu','2026-11-19 18:56:45'),(293,'20261119102011034','40066',16,'shonu','2026-11-19 18:57:31'),(294,'20261119102011035','38560',22,'shonu','2026-11-19 18:58:17'),(295,'20261119102011036','46112',14,'shonu','2026-11-19 18:59:02'),(296,'20261119102011037','08369',26,'shonu','2026-11-19 18:59:48'),(297,'20261119102011038','34007',14,'shonu','2026-11-19 19:00:34'),(298,'20261119102011039','86245',25,'shonu','2026-11-19 19:01:19'),(299,'20261119102011040','84390',24,'shonu','2026-11-19 19:02:05'),(300,'20261119102011041','74993',32,'shonu','2026-11-19 19:02:50'),(301,'20261119102011042','44558',26,'shonu','2026-11-19 19:03:36'),(302,'20261119102011043','32702',14,'shonu','2026-11-19 19:04:22'),(303,'20261119102011044','58603',22,'shonu','2026-11-19 19:05:08'),(304,'20261119102011045','46676',29,'shonu','2026-11-19 19:05:54'),(305,'20261119102011046','60022',10,'shonu','2026-11-19 19:06:40'),(306,'20261119102011047','33640',16,'shonu','2026-11-19 19:07:25'),(307,'20261119102011048','98169',33,'shonu','2026-11-19 19:08:11'),(308,'20261119102011049','00128',11,'shonu','2026-11-19 19:08:57'),(309,'20261119102011050','40596',24,'shonu','2026-11-19 19:09:42'),(310,'20261119102011051','34956',27,'shonu','2026-11-19 19:10:28'),(311,'20261119102011052','63584',26,'shonu','2026-11-19 19:11:14'),(312,'20261119102011053','33877',28,'shonu','2026-11-19 19:12:00'),(313,'20261119102011054','31276',19,'shonu','2026-11-19 19:12:46'),(314,'20261119102011055','65380',22,'shonu','2026-11-19 19:13:31'),(315,'20261119102011056','08533',19,'shonu','2026-11-19 19:14:17'),(316,'20261119102011057','73916',26,'shonu','2026-11-19 19:15:03'),(317,'20261119102011058','53299',28,'shonu','2026-11-19 19:15:49'),(318,'20261119102011059','71551',19,'shonu','2026-11-19 19:16:35'),(319,'20261119102011060','14224',13,'shonu','2026-11-19 19:17:21'),(320,'20261119102011061','63165',21,'shonu','2026-11-19 19:17:52'),(321,'20261119102011062','37562',23,'shonu','2026-11-19 19:18:22'),(322,'20261119102011063','33551',17,'shonu','2026-11-19 19:18:55'),(323,'20261119102011064','01654',16,'shonu','2026-11-19 19:22:58'),(324,'20261119102011065','13941',18,'shonu','2026-11-19 19:25:35'),(325,'20261119102011066','47506',22,'shonu','2026-11-19 19:26:03'),(326,'20261119102011067','11416',13,'shonu','2026-11-19 19:26:31'),(327,'20261119102011068','98775',36,'shonu','2026-11-19 19:26:58'),(328,'20261119102011069','70984',28,'shonu','2026-11-19 19:27:26'),(329,'20261119102011070','63701',17,'shonu','2026-11-19 19:27:54'),(330,'20261119102011071','21972',21,'shonu','2026-11-19 19:28:22'),(331,'20261119102011072','94061',20,'shonu','2026-11-19 19:28:50'),(332,'20261119102011073','69657',33,'shonu','2026-11-19 19:29:17'),(333,'20261119102011074','01783',19,'shonu','2026-11-19 19:29:45'),(334,'20261119102011075','55278',27,'shonu','2026-11-19 19:30:13'),(335,'20261119102011076','14850',18,'shonu','2026-11-19 19:30:40'),(336,'20261119102011077','55980',27,'shonu','2026-11-19 19:31:25'),(337,'20261119102011078','59881',31,'shonu','2026-11-19 19:31:52'),(338,'20261119102011079','00023',5,'shonu','2026-11-19 19:32:17'),(339,'20261119102011080','24283',19,'shonu','2026-11-19 19:32:45'),(340,'20261119102011081','97112',20,'shonu','2026-11-19 19:33:13'),(341,'20261119102011082','59547',30,'shonu','2026-11-19 19:33:41'),(342,'20261119102011083','64138',22,'shonu','2026-11-19 19:34:08'),(343,'20261119102011084','77081',23,'shonu','2026-11-19 19:34:36'),(344,'20261119102011085','69029',26,'shonu','2026-11-19 19:35:08'),(345,'20261119102011086','25556',23,'shonu','2026-11-19 19:35:36'),(346,'20261119102011087','52337',20,'shonu','2026-11-19 19:36:03'),(347,'20261119102011088','19613',20,'shonu','2026-11-19 19:36:32'),(348,'20261119102011089','92247',24,'shonu','2026-11-19 19:36:59'),(349,'20261119102011090','45360',18,'shonu','2026-11-19 19:37:27'),(350,'20261119102011091','07315',16,'shonu','2026-11-19 19:37:55'),(351,'20261119102011092','07920',18,'shonu','2026-11-19 19:38:23'),(352,'20261119102011093','61978',31,'shonu','2026-11-19 19:38:50'),(353,'20261119102011094','87310',19,'shonu','2026-11-19 19:39:18'),(354,'20261119102011095','08278',25,'shonu','2026-11-19 19:39:46'),(355,'20261119102011096','11653',16,'shonu','2026-11-19 19:40:13'),(356,'20261119102011097','31573',19,'shonu','2026-11-19 19:40:41'),(357,'20261119102011098','68445',27,'shonu','2026-11-19 19:41:09'),(358,'20261119102011099','54812',20,'shonu','2026-11-19 19:41:37'),(359,'20261119102011100','31073',14,'shonu','2026-11-19 19:42:04'),(360,'20261119102011101','35925',24,'shonu','2026-11-19 19:42:33'),(361,'20261119102011102','24520',13,'shonu','2026-11-19 19:43:01'),(362,'20261119102011103','54521',17,'shonu','2026-11-19 19:43:29'),(363,'20261119102011104','16220',11,'shonu','2026-11-19 19:43:57'),(364,'20261119102011105','72722',20,'shonu','2026-11-19 19:44:25'),(365,'20261119102011106','34911',18,'shonu','2026-11-19 19:44:53'),(366,'20261119102011107','19747',28,'shonu','2026-11-19 19:45:21'),(367,'20261119102011108','72493',25,'shonu','2026-11-19 19:45:49'),(368,'20261119102011109','00329',14,'shonu','2026-11-19 19:46:18'),(369,'20261119102011110','39199',31,'shonu','2026-11-19 19:46:45'),(370,'20261119102011111','12056',14,'shonu','2026-11-19 19:47:13'),(371,'20261119102011112','99343',28,'shonu','2026-11-19 19:47:41'),(372,'20261119102011113','86197',31,'shonu','2026-11-19 19:48:09'),(373,'20261119102011114','44175',21,'shonu','2026-11-19 19:48:37'),(374,'20261119102011115','20810',11,'shonu','2026-11-19 19:49:05'),(375,'20261119102011116','80562',21,'shonu','2026-11-19 19:49:32'),(376,'20261119102011117','70498',28,'shonu','2026-11-19 19:50:00'),(377,'20261119102011118','64864',28,'shonu','2026-11-19 19:50:28'),(378,'20261119102011119','02920',13,'shonu','2026-11-19 19:50:56'),(379,'20261119102011120','70096',22,'shonu','2026-11-19 19:51:24'),(380,'20261119102011121','36537',24,'shonu','2026-11-19 19:51:52'),(381,'20261119102011122','91023',15,'shonu','2026-11-19 19:52:19'),(382,'20261119102011123','81996',33,'shonu','2026-11-19 19:52:47'),(383,'20261119102011124','51326',17,'shonu','2026-11-19 19:53:15'),(384,'20261119102011125','05113',10,'shonu','2026-11-19 19:53:43'),(385,'20261119102011126','17344',19,'shonu','2026-11-19 19:54:11'),(386,'20261119102011127','51435',18,'shonu','2026-11-19 19:54:39'),(387,'20261119102011128','80132',14,'shonu','2026-11-19 19:55:07'),(388,'20261119102011129','81569',29,'shonu','2026-11-19 19:55:34'),(389,'20261119102011130','91357',25,'shonu','2026-11-19 19:56:03'),(390,'20261119102011131','40890',21,'shonu','2026-11-19 19:56:30'),(391,'20261119102011132','30122',8,'shonu','2026-11-19 19:56:58'),(392,'20261119102011133','11342',11,'shonu','2026-11-19 19:57:26'),(393,'20261119102011134','11407',13,'shonu','2026-11-19 19:57:53'),(394,'20261119102011135','52440',15,'shonu','2026-11-19 19:58:21'),(395,'20261119102011136','67987',37,'shonu','2026-11-19 19:58:49'),(396,'20261119102011137','62725',22,'shonu','2026-11-19 19:59:16'),(397,'20261119102011138','24431',14,'shonu','2026-11-19 19:59:44'),(398,'20261119102011139','32052',12,'shonu','2026-11-19 20:00:12'),(399,'20261119102011140','87069',30,'shonu','2026-11-19 20:00:40'),(400,'20261119102011141','84827',29,'shonu','2026-11-19 20:01:09'),(401,'20261119102011142','82735',25,'shonu','2026-11-19 20:01:37'),(402,'20261119102011143','74466',27,'shonu','2026-11-19 20:02:04'),(403,'20261119102011144','62240',14,'shonu','2026-11-19 20:02:33'),(404,'20261119102011145','54414',18,'shonu','2026-11-19 20:03:00'),(405,'20261119102011146','40548',21,'shonu','2026-11-19 20:03:28'),(406,'20261119102011147','14509',19,'shonu','2026-11-19 20:03:56'),(407,'20261119102011148','14998',31,'shonu','2026-11-19 20:04:20'),(408,'20261119102011149','29815',25,'shonu','2026-11-19 20:04:48'),(409,'20261119102011150','36695',29,'shonu','2026-11-19 20:05:15'),(410,'20261119102011151','08912',20,'shonu','2026-11-19 20:05:43'),(411,'20261119102011152','69261',24,'shonu','2026-11-19 20:06:11'),(412,'20261119102011153','69352',25,'shonu','2026-11-19 20:06:39'),(413,'20261119102011154','84186',27,'shonu','2026-11-19 20:07:07'),(414,'20261119102011155','15105',12,'shonu','2026-11-19 20:07:53'),(415,'20261119102011156','40007',11,'shonu','2026-11-19 20:08:21'),(416,'20261119102011157','56327',23,'shonu','2026-11-19 20:09:06'),(417,'20261119102011158','47289',30,'shonu','2026-11-19 20:09:40'),(418,'20261119102011159','27781',25,'shonu','2026-11-19 20:09:52'),(419,'20261119102011160','86050',19,'shonu','2026-11-19 20:10:20'),(420,'20261119102011161','78928',34,'shonu','2026-11-19 20:10:49'),(421,'20261119102011162','36492',24,'shonu','2026-11-19 20:11:17'),(422,'20261119102011163','96956',35,'shonu','2026-11-19 20:11:45'),(423,'20261119102011164','00818',17,'shonu','2026-11-19 20:12:12'),(424,'20261119102011165','39768',33,'shonu','2026-11-19 20:12:40'),(425,'20261119102011166','80075',20,'shonu','2026-11-19 20:13:08'),(426,'20261119102011167','71355',21,'shonu','2026-11-19 20:13:36'),(427,'20261119102011168','28173',21,'shonu','2026-11-19 20:14:03'),(428,'20261119102011169','53289',27,'shonu','2026-11-19 20:14:31'),(429,'20261119102011170','57458',29,'shonu','2026-11-19 20:14:59'),(430,'20261119102011171','66972',30,'shonu','2026-11-19 20:15:26'),(431,'20261119102011172','87290',26,'shonu','2026-11-19 20:16:13'),(432,'20261119102011173','78664',31,'shonu','2026-11-19 20:16:59'),(433,'20261119102011174','61768',28,'shonu','2026-11-19 20:17:45'),(434,'20261119102011175','38690',26,'shonu','2026-11-19 20:18:31'),(435,'20261119102011176','57815',26,'shonu','2026-11-19 20:19:17'),(436,'20261119102011177','19589',32,'shonu','2026-11-19 20:20:03'),(437,'20261119102011178','99467',35,'shonu','2026-11-19 20:20:31'),(438,'20261119102011179','42244',16,'shonu','2026-11-19 20:21:17'),(439,'20261119102011180','02685',21,'shonu','2026-11-19 20:22:03'),(440,'20261119102011181','50106',12,'shonu','2026-11-19 20:22:49'),(441,'20261119102011182','31536',18,'shonu','2026-11-19 20:23:34'),(442,'20261119102011183','34531',16,'shonu','2026-11-19 20:24:20'),(443,'20261119102011184','84362',23,'shonu','2026-11-19 20:24:49'),(444,'20261119102011185','22014',9,'shonu','2026-11-19 20:25:35'),(445,'20261119102011186','41879',29,'shonu','2026-11-19 20:26:21'),(446,'20261119102011187','30614',14,'shonu','2026-11-19 20:27:22'),(447,'20261119102011188','93238',25,'shonu','2026-11-19 20:28:41'),(448,'20261119102011189','06247',19,'shonu','2026-11-19 20:29:50'),(449,'20261119102011190','22345',16,'shonu','2026-11-19 20:31:09'),(450,'20261119102011191','11782',19,'shonu','2026-11-19 20:33:36'),(451,'20261119102011192','10065',12,'shonu','2026-11-19 20:35:30'),(452,'20261119102011193','37095',24,'shonu','2026-11-19 20:36:49'),(453,'20261119102011194','76285',28,'shonu','2026-11-19 20:38:25'),(454,'20261119102011195','96819',33,'shonu','2026-11-19 20:39:36');
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
) ENGINE=MyISAM AUTO_INCREMENT=147 DEFAULT CHARSET=latin1 COMMENT='5D lottery 3-min: published draw results';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fived_results_3min`
--

LOCK TABLES `fived_results_3min` WRITE;
/*!40000 ALTER TABLE `fived_results_3min` DISABLE KEYS */;
INSERT INTO `fived_results_3min` VALUES (6,'20261119102020252','15838',25,'shonu','2026-11-19 12:45:00'),(7,'20261119102020253','87267',30,'shonu','2026-11-19 12:48:01'),(8,'20261119102020254','53897',32,'shonu','2026-11-19 12:51:01'),(9,'20261119102020255','98672',32,'shonu','2026-11-19 12:54:00'),(10,'20261119102020256','78415',25,'shonu','2026-11-19 12:57:00'),(11,'20261119102020257','59727',30,'shonu','2026-11-19 13:00:00'),(12,'20261119102020258','32991',24,'shonu','2026-11-19 13:03:00'),(13,'20261119102020259','95320',19,'shonu','2026-11-19 13:06:00'),(14,'20261119102020260','22931',17,'shonu','2026-11-19 13:09:00'),(15,'20261119102020261','54164',20,'shonu','2026-11-19 13:12:00'),(16,'20261119102020262','79300',19,'shonu','2026-11-19 13:15:01'),(17,'20261119102020263','88356',30,'shonu','2026-11-19 13:18:00'),(18,'20261119102020264','38710',19,'shonu','2026-11-19 13:21:01'),(19,'20261119102020265','54155',20,'shonu','2026-11-19 13:24:00'),(20,'20261119102020266','50864',23,'shonu','2026-11-19 13:27:01'),(21,'20261119102020267','46799',35,'shonu','2026-11-19 13:30:00'),(22,'20261119102020268','29877',33,'shonu','2026-11-19 13:33:00'),(23,'20261119102020269','83871',27,'shonu','2026-11-19 13:36:01'),(24,'20261119102020270','23745',21,'shonu','2026-11-19 13:39:00'),(25,'20261119102020271','73577',29,'shonu','2026-11-19 13:42:00'),(26,'20261119102020272','10275',15,'shonu','2026-11-19 13:45:00'),(27,'20261119102020273','54920',20,'shonu','2026-11-19 13:48:00'),(28,'20261119102020274','44599',31,'shonu','2026-11-19 13:51:01'),(29,'20261119102020275','19113',15,'shonu','2026-11-19 13:54:00'),(30,'20261119102020276','91051',16,'shonu','2026-11-19 13:57:01'),(31,'20261119102020277','88606',28,'shonu','2026-11-19 14:00:01'),(32,'20261119102020278','86636',29,'shonu','2026-11-19 14:03:00'),(33,'20261119102020279','66206',20,'shonu','2026-11-19 14:06:01'),(34,'20261119102020280','59269',31,'shonu','2026-11-19 14:09:00'),(35,'20261119102020281','06839',26,'shonu','2026-11-19 14:12:01'),(36,'20261119102020282','98338',31,'shonu','2026-11-19 14:15:00'),(37,'20261119102020283','51049',19,'shonu','2026-11-19 14:18:01'),(38,'20261119102020284','79619',32,'shonu','2026-11-19 14:21:01'),(39,'20261119102020285','76534',25,'shonu','2026-11-19 14:24:00'),(40,'20261119102020286','26545',22,'shonu','2026-11-19 14:27:01'),(41,'20261119102020287','59891',32,'shonu','2026-11-19 14:33:00'),(42,'20261119102020288','70320',12,'shonu','2026-11-19 14:36:01'),(43,'20261119102020289','44442',18,'shonu','2026-11-19 14:39:00'),(44,'20261119102020290','71412',15,'shonu','2026-11-19 14:42:00'),(45,'20261119102020291','08100',9,'shonu','2026-11-19 14:45:01'),(46,'20261119102020292','03118',13,'shonu','2026-11-19 14:48:00'),(47,'20261119102020293','32296',22,'shonu','2026-11-19 14:51:00'),(48,'20261119102020294','74744',26,'shonu','2026-11-19 14:54:00'),(49,'20261119102020295','73326',21,'shonu','2026-11-19 14:57:01'),(50,'20261119102020296','26027',17,'shonu','2026-11-19 15:00:00'),(51,'20261119102020297','18128',20,'shonu','2026-11-19 15:03:00'),(52,'20261119102020298','14243',14,'shonu','2026-11-19 15:06:00'),(53,'20261119102020299','44388',27,'shonu','2026-11-19 15:09:01'),(54,'20261119102020300','48395',29,'shonu','2026-11-19 15:12:00'),(55,'20261119102020301','96298',34,'shonu','2026-11-19 15:15:01'),(56,'20261119102020302','95844',30,'shonu','2026-11-19 15:18:01'),(57,'20261119102020303','01299',21,'shonu','2026-11-19 15:21:01'),(58,'20261119102020304','81241',16,'shonu','2026-11-19 15:24:01'),(59,'20261119102020305','92405',20,'shonu','2026-11-19 15:27:00'),(60,'20261119102020306','78214',22,'shonu','2026-11-19 15:30:01'),(61,'20261119102020307','86556',30,'shonu','2026-11-19 15:33:00'),(62,'20261119102020308','91248',24,'shonu','2026-11-19 17:45:45'),(63,'20261119102020309','46883',29,'shonu','2026-11-19 17:48:03'),(64,'20261119102020310','28744',25,'shonu','2026-11-19 17:48:49'),(65,'20261119102020311','59053',22,'shonu','2026-11-19 17:51:07'),(66,'20261119102020312','29836',28,'shonu','2026-11-19 17:51:53'),(67,'20261119102020313','43437',21,'shonu','2026-11-19 17:54:10'),(68,'20261119102020314','72054',18,'shonu','2026-11-19 17:54:56'),(69,'20261119102020315','75916',28,'shonu','2026-11-19 17:57:13'),(70,'20261119102020316','16284',21,'shonu','2026-11-19 17:57:59'),(71,'20261119102020317','84808',28,'shonu','2026-11-19 18:00:16'),(72,'20261119102020318','82155',21,'shonu','2026-11-19 18:03:19'),(73,'20261119102020319','93381',24,'shonu','2026-11-19 18:06:22'),(74,'20261119102020320','11092',13,'shonu','2026-11-19 18:09:25'),(75,'20261119102020321','59703',24,'shonu','2026-11-19 18:12:29'),(76,'20261119102020322','23332',13,'shonu','2026-11-19 18:15:32'),(77,'20261119102020323','36721',19,'shonu','2026-11-19 18:18:35'),(78,'20261119102020324','29177',26,'shonu','2026-11-19 18:21:39'),(79,'20261119102020325','65078',26,'shonu','2026-11-19 18:24:42'),(80,'20261119102020326','69563',29,'shonu','2026-11-19 18:27:45'),(81,'20261119102020327','16792',25,'shonu','2026-11-19 18:30:03'),(82,'20261119102020328','43324',16,'shonu','2026-11-19 18:30:48'),(83,'20261119102020329','57403',19,'shonu','2026-11-19 18:33:05'),(84,'20261119102020330','92283',24,'shonu','2026-11-19 18:33:51'),(85,'20261119102020331','38760',24,'shonu','2026-11-19 18:36:08'),(86,'20261119102020332','51719',23,'shonu','2026-11-19 18:36:54'),(87,'20261119102020333','68789',38,'shonu','2026-11-19 18:39:11'),(88,'20261119102020334','88543',28,'shonu','2026-11-19 18:39:57'),(89,'20261119102020335','54797',32,'shonu','2026-11-19 18:42:15'),(90,'20261119102020336','41333',14,'shonu','2026-11-19 18:45:18'),(91,'20261119102020337','02766',21,'shonu','2026-11-19 18:48:21'),(92,'20261119102020338','94191',24,'shonu','2026-11-19 18:51:25'),(93,'20261119102020339','32609',20,'shonu','2026-11-19 18:54:28'),(94,'20261119102020340','07765',25,'shonu','2026-11-19 18:57:31'),(95,'20261119102020341','03495',21,'shonu','2026-11-19 19:00:34'),(96,'20261119102020342','74294',26,'shonu','2026-11-19 19:03:36'),(97,'20261119102020343','18442',19,'shonu','2026-11-19 19:06:40'),(98,'20261119102020344','15150',12,'shonu','2026-11-19 19:09:43'),(99,'20261119102020345','59793',33,'shonu','2026-11-19 19:12:00'),(100,'20261119102020346','22580',17,'shonu','2026-11-19 19:12:46'),(101,'20261119102020347','03614',14,'shonu','2026-11-19 19:15:03'),(102,'20261119102020348','51587',26,'shonu','2026-11-19 19:15:49'),(103,'20261119102020349','96858',36,'shonu','2026-11-19 19:18:22'),(104,'20261119102020350','29762',26,'shonu','2026-11-19 19:18:55'),(105,'20261119102020351','89120',20,'shonu','2026-11-19 19:27:26'),(106,'20261119102020352','69111',18,'shonu','2026-11-19 19:27:54'),(107,'20261119102020353','02605',13,'shonu','2026-11-19 19:30:13'),(108,'20261119102020354','01626',15,'shonu','2026-11-19 19:30:40'),(109,'20261119102020355','67468',31,'shonu','2026-11-19 19:33:13'),(110,'20261119102020356','27378',27,'shonu','2026-11-19 19:33:41'),(111,'20261119102020357','23143',13,'shonu','2026-11-19 19:36:42'),(112,'20261119102020358','34511',14,'shonu','2026-11-19 19:37:08'),(113,'20261119102020359','85731',24,'shonu','2026-11-19 19:39:25'),(114,'20261119102020360','74120',14,'shonu','2026-11-19 19:39:52'),(115,'20261119102020361','95531',23,'shonu','2026-11-19 19:42:11'),(116,'20261119102020362','60617',20,'shonu','2026-11-19 19:42:39'),(117,'20261119102020363','67369',31,'shonu','2026-11-19 19:43:09'),(118,'20261119102020364','38932',25,'shonu','2026-11-19 19:45:27'),(119,'20261119102020365','91632',21,'shonu','2026-11-19 19:45:56'),(120,'20261119102020366','27376',25,'shonu','2026-11-19 19:48:16'),(121,'20261119102020367','39244',22,'shonu','2026-11-19 19:48:45'),(122,'20261119102020368','74153',20,'shonu','2026-11-19 19:51:32'),(123,'20261119102020369','43940',20,'shonu','2026-11-19 19:51:59'),(124,'20261119102020370','38358',27,'shonu','2026-11-19 19:54:19'),(125,'20261119102020371','40098',21,'shonu','2026-11-19 19:54:47'),(126,'20261119102020372','76777',34,'shonu','2026-11-19 19:57:33'),(127,'20261119102020373','35481',21,'shonu','2026-11-19 19:58:01'),(128,'20261119102020374','49609',28,'shonu','2026-11-19 20:00:19'),(129,'20261119102020375','75918',30,'shonu','2026-11-19 20:00:48'),(130,'20261119102020376','84045',21,'shonu','2026-11-19 20:03:35'),(131,'20261119102020377','87666',33,'shonu','2026-11-19 20:04:03'),(132,'20261119102020378','77380',25,'shonu','2026-11-19 20:06:12'),(133,'20261119102020379','62007',15,'shonu','2026-11-19 20:06:39'),(134,'20261119102020380','24238',19,'shonu','2026-11-19 20:09:40'),(135,'20261119102020381','14401',10,'shonu','2026-11-19 20:09:41'),(136,'20261119102020382','85643',26,'shonu','2026-11-19 20:09:53'),(137,'20261119102020383','33635',20,'shonu','2026-11-19 20:12:12'),(138,'20261119102020384','06776',26,'shonu','2026-11-19 20:12:40'),(139,'20261119102020385','51346',19,'shonu','2026-11-19 20:16:00'),(140,'20261119102020386','19946',29,'shonu','2026-11-19 20:19:04'),(141,'20261119102020387','85336',25,'shonu','2026-11-19 20:21:50'),(142,'20261119102020388','82269',27,'shonu','2026-11-19 20:24:36'),(143,'20261119102020389','10080',9,'shonu','2026-11-19 20:25:23'),(144,'20261119102020390','91716',24,'shonu','2026-11-19 20:32:16'),(145,'20261119102020391','52208',17,'shonu','2026-11-19 20:34:44'),(146,'20261119102020392','44803',19,'shonu','2026-11-19 20:37:38');
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
) ENGINE=MyISAM AUTO_INCREMENT=88 DEFAULT CHARSET=latin1 COMMENT='5D lottery 5-min: published draw results';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fived_results_5min`
--

LOCK TABLES `fived_results_5min` WRITE;
/*!40000 ALTER TABLE `fived_results_5min` DISABLE KEYS */;
INSERT INTO `fived_results_5min` VALUES (2,'20261119102030154','41662',19,'shonu','2026-11-19 12:50:00'),(3,'20261119102030155','72087',24,'shonu','2026-11-19 12:55:00'),(4,'20261119102030156','06733',19,'shonu','2026-11-19 13:00:01'),(5,'20261119102030157','17120',11,'shonu','2026-11-19 13:05:00'),(6,'20261119102030158','37932',24,'shonu','2026-11-19 13:10:00'),(7,'20261119102030159','08598',30,'shonu','2026-11-19 13:15:01'),(8,'20261119102030160','27107',17,'shonu','2026-11-19 13:20:00'),(9,'20261119102030161','27705',21,'shonu','2026-11-19 13:25:01'),(10,'20261119102030162','84353',23,'shonu','2026-11-19 13:30:00'),(11,'20261119102030163','87745',31,'shonu','2026-11-19 13:35:00'),(12,'20261119102030164','47255',23,'shonu','2026-11-19 13:40:01'),(13,'20261119102030165','54776',29,'shonu','2026-11-19 13:45:01'),(14,'20261119102030166','26026',16,'shonu','2026-11-19 13:50:01'),(15,'20261119102030167','67379',32,'shonu','2026-11-19 13:55:01'),(16,'20261119102030168','25617',21,'shonu','2026-11-19 14:00:02'),(17,'20261119102030169','62149',22,'shonu','2026-11-19 14:05:00'),(18,'20261119102030170','16104',12,'shonu','2026-11-19 14:10:00'),(19,'20261119102030171','24538',22,'shonu','2026-11-19 14:15:00'),(20,'20261119102030172','94614',24,'shonu','2026-11-19 14:20:01'),(21,'20261119102030173','65558',29,'shonu','2026-11-19 14:25:01'),(22,'20261119102030174','40716',18,'shonu','2026-11-19 14:35:00'),(23,'20261119102030175','85581',27,'shonu','2026-11-19 14:40:00'),(24,'20261119102030176','90823',22,'shonu','2026-11-19 14:45:01'),(25,'20261119102030177','20718',18,'shonu','2026-11-19 14:50:00'),(26,'20261119102030178','16339',22,'shonu','2026-11-19 14:55:01'),(27,'20261119102030179','90715',22,'shonu','2026-11-19 15:00:00'),(28,'20261119102030180','04706',17,'shonu','2026-11-19 15:05:00'),(29,'20261119102030181','52674',24,'shonu','2026-11-19 15:10:00'),(30,'20261119102030182','76217',23,'shonu','2026-11-19 15:15:01'),(31,'20261119102030183','18741',21,'shonu','2026-11-19 15:20:01'),(32,'20261119102030184','21116',11,'shonu','2026-11-19 15:25:00'),(33,'20261119102030185','70332',15,'shonu','2026-11-19 15:30:01'),(34,'20261119102030186','54532',19,'shonu','2026-11-19 15:35:00'),(35,'20261119102030187','64276',25,'shonu','2026-11-19 15:35:21'),(36,'20261119102030188','51754',22,'shonu','2026-11-19 15:35:48'),(37,'20261119102030189','43664',23,'shonu','2026-11-19 17:45:45'),(38,'20261119102030190','46828',28,'shonu','2026-11-19 17:50:20'),(39,'20261119102030191','77812',25,'shonu','2026-11-19 17:55:42'),(40,'20261119102030192','86306',23,'shonu','2026-11-19 18:00:17'),(41,'20261119102030193','83842',25,'shonu','2026-11-19 18:05:36'),(42,'20261119102030194','01511',8,'shonu','2026-11-19 18:10:11'),(43,'20261119102030195','43358',23,'shonu','2026-11-19 18:10:57'),(44,'20261119102030196','77052',21,'shonu','2026-11-19 18:15:32'),(45,'20261119102030197','49349',29,'shonu','2026-11-19 18:20:07'),(46,'20261119102030198','56595',30,'shonu','2026-11-19 18:20:53'),(47,'20261119102030199','73172',20,'shonu','2026-11-19 18:25:28'),(48,'20261119102030200','28045',19,'shonu','2026-11-19 18:30:03'),(49,'20261119102030201','98752',31,'shonu','2026-11-19 18:30:48'),(50,'20261119102030202','16486',25,'shonu','2026-11-19 18:35:22'),(51,'20261119102030203','61739',26,'shonu','2026-11-19 18:40:43'),(52,'20261119102030204','17966',29,'shonu','2026-11-19 18:45:18'),(53,'20261119102030205','40228',16,'shonu','2026-11-19 18:50:39'),(54,'20261119102030206','07871',23,'shonu','2026-11-19 18:55:14'),(55,'20261119102030207','52599',30,'shonu','2026-11-19 18:56:01'),(56,'20261119102030208','54545',23,'shonu','2026-11-19 19:00:34'),(57,'20261119102030209','16366',22,'shonu','2026-11-19 19:05:08'),(58,'20261119102030210','79216',25,'shonu','2026-11-19 19:05:54'),(59,'20261119102030211','48363',24,'shonu','2026-11-19 19:10:29'),(60,'20261119102030212','30910',13,'shonu','2026-11-19 19:15:03'),(61,'20261119102030213','51665',23,'shonu','2026-11-19 19:15:49'),(62,'20261119102030214','96716',29,'shonu','2026-11-19 19:25:35'),(63,'20261119102030215','07269',24,'shonu','2026-11-19 19:30:13'),(64,'20261119102030216','08799',33,'shonu','2026-11-19 19:30:41'),(65,'20261119102030217','00744',15,'shonu','2026-11-19 19:35:15'),(66,'20261119102030218','08163',18,'shonu','2026-11-19 19:35:46'),(67,'20261119102030219','36430',16,'shonu','2026-11-19 19:36:10'),(68,'20261119102030220','66702',21,'shonu','2026-11-19 19:40:21'),(69,'20261119102030221','00407',11,'shonu','2026-11-19 19:40:48'),(70,'20261119102030222','78082',25,'shonu','2026-11-19 19:45:31'),(71,'20261119102030223','66304',19,'shonu','2026-11-19 19:46:01'),(72,'20261119102030224','30746',20,'shonu','2026-11-19 19:50:35'),(73,'20261119102030225','68676',33,'shonu','2026-11-19 19:51:03'),(74,'20261119102030226','78485',32,'shonu','2026-11-19 19:55:14'),(75,'20261119102030227','13862',20,'shonu','2026-11-19 19:55:42'),(76,'20261119102030228','90643',22,'shonu','2026-11-19 19:56:10'),(77,'20261119102030229','52030',10,'shonu','2026-11-19 20:00:22'),(78,'20261119102030230','71156',20,'shonu','2026-11-19 20:00:52'),(79,'20261119102030231','62293',22,'shonu','2026-11-19 20:05:16'),(80,'20261119102030232','26058',21,'shonu','2026-11-19 20:05:44'),(81,'20261119102030233','07884',27,'shonu','2026-11-19 20:10:21'),(82,'20261119102030234','78503',23,'shonu','2026-11-19 20:10:49'),(83,'20261119102030235','04446',18,'shonu','2026-11-19 20:16:00'),(84,'20261119102030236','23850',18,'shonu','2026-11-19 20:20:09'),(85,'20261119102030237','62299',28,'shonu','2026-11-19 20:21:04'),(86,'20261119102030238','34706',20,'shonu','2026-11-19 20:26:09'),(87,'20261119102030239','18776',29,'shonu','2026-11-19 20:32:50');
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
) ENGINE=MyISAM AUTO_INCREMENT=43 DEFAULT CHARSET=latin1 COMMENT='K3 dice 10-min: period/round registry';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `k3_periods_10min`
--

LOCK TABLES `k3_periods_10min` WRITE;
/*!40000 ALTER TABLE `k3_periods_10min` DISABLE KEYS */;
INSERT INTO `k3_periods_10min` VALUES (2,'20261119101040078','2026-11-19 12:50:00'),(3,'20261119101040079','2026-11-19 13:00:01'),(4,'20261119101040080','2026-11-19 13:10:00'),(5,'20261119101040081','2026-11-19 13:20:01'),(6,'20261119101040082','2026-11-19 13:30:01'),(7,'20261119101040083','2026-11-19 13:40:01'),(8,'20261119101040084','2026-11-19 13:50:01'),(9,'20261119101040085','2026-11-19 14:00:02'),(10,'20261119101040086','2026-11-19 14:10:00'),(11,'20261119101040087','2026-11-19 14:20:01'),(12,'20261119101040088','2026-11-19 14:40:00'),(13,'20261119101040089','2026-11-19 14:50:00'),(14,'20261119101040090','2026-11-19 15:00:01'),(15,'20261119101040091','2026-11-19 15:10:00'),(16,'20261119101040092','2026-11-19 15:20:01'),(17,'20261119101040093','2026-11-19 15:30:02'),(18,'20261119101040094','2026-11-19 17:50:21'),(19,'20261119101040095','2026-11-19 18:00:17'),(20,'20261119101040096','2026-11-19 18:10:11'),(21,'20261119101040097','2026-11-19 18:10:57'),(22,'20261119101040098','2026-11-19 18:20:07'),(23,'20261119101040099','2026-11-19 18:20:53'),(24,'20261119101040100','2026-11-19 18:30:03'),(25,'20261119101040101','2026-11-19 18:30:49'),(26,'20261119101040102','2026-11-19 18:40:44'),(27,'20261119101040103','2026-11-19 18:50:39'),(28,'20261119101040104','2026-11-19 19:00:35'),(29,'20261119101040105','2026-11-19 19:10:29'),(30,'20261119101040106','2026-11-19 19:30:13'),(31,'20261119101040107','2026-11-19 19:30:41'),(32,'20261119101040108','2026-11-19 19:40:21'),(33,'20261119101040109','2026-11-19 19:40:48'),(34,'20261119101040110','2026-11-19 19:50:36'),(35,'20261119101040111','2026-11-19 19:51:04'),(36,'20261119101040112','2026-11-19 20:00:22'),(37,'20261119101040113','2026-11-19 20:00:52'),(38,'20261119101040114','2026-11-19 20:10:21'),(39,'20261119101040115','2026-11-19 20:10:49'),(40,'20261119101040116','2026-11-19 20:20:09'),(41,'20261119101040117','2026-11-19 20:21:04'),(42,'20261119101040118','2026-11-19 20:32:50');
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
) ENGINE=MyISAM AUTO_INCREMENT=457 DEFAULT CHARSET=latin1 COMMENT='K3 dice 1-min: period/round registry';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `k3_periods_1min`
--

LOCK TABLES `k3_periods_1min` WRITE;
/*!40000 ALTER TABLE `k3_periods_1min` DISABLE KEYS */;
INSERT INTO `k3_periods_1min` VALUES (12,'20261119101010752','2026-11-19 12:31:12'),(13,'20261119101010753','2026-11-19 12:33:08'),(14,'20261119101010754','2026-11-19 12:34:23'),(15,'20261119101010755','2026-11-19 12:34:55'),(16,'20261119101010756','2026-11-19 12:44:01'),(17,'20261119101010757','2026-11-19 12:45:00'),(18,'20261119101010758','2026-11-19 12:46:00'),(19,'20261119101010759','2026-11-19 12:47:00'),(20,'20261119101010760','2026-11-19 12:48:00'),(21,'20261119101010761','2026-11-19 12:49:00'),(22,'20261119101010762','2026-11-19 12:50:00'),(23,'20261119101010763','2026-11-19 12:51:00'),(24,'20261119101010764','2026-11-19 12:52:00'),(25,'20261119101010765','2026-11-19 12:53:00'),(26,'20261119101010766','2026-11-19 12:54:00'),(27,'20261119101010767','2026-11-19 12:55:00'),(28,'20261119101010768','2026-11-19 12:56:00'),(29,'20261119101010769','2026-11-19 12:57:00'),(30,'20261119101010770','2026-11-19 12:58:00'),(31,'20261119101010771','2026-11-19 12:59:00'),(32,'20261119101010772','2026-11-19 13:00:00'),(33,'20261119101010773','2026-11-19 13:01:00'),(34,'20261119101010774','2026-11-19 13:02:00'),(35,'20261119101010775','2026-11-19 13:03:00'),(36,'20261119101010776','2026-11-19 13:04:00'),(37,'20261119101010777','2026-11-19 13:05:00'),(38,'20261119101010778','2026-11-19 13:06:00'),(39,'20261119101010779','2026-11-19 13:07:00'),(40,'20261119101010780','2026-11-19 13:08:00'),(41,'20261119101010781','2026-11-19 13:09:00'),(42,'20261119101010782','2026-11-19 13:10:00'),(43,'20261119101010783','2026-11-19 13:11:00'),(44,'20261119101010784','2026-11-19 13:12:00'),(45,'20261119101010785','2026-11-19 13:13:00'),(46,'20261119101010786','2026-11-19 13:14:00'),(47,'20261119101010787','2026-11-19 13:15:00'),(48,'20261119101010788','2026-11-19 13:16:00'),(49,'20261119101010789','2026-11-19 13:17:00'),(50,'20261119101010790','2026-11-19 13:18:00'),(51,'20261119101010791','2026-11-19 13:19:00'),(52,'20261119101010792','2026-11-19 13:20:00'),(53,'20261119101010793','2026-11-19 13:21:00'),(54,'20261119101010794','2026-11-19 13:22:00'),(55,'20261119101010795','2026-11-19 13:23:00'),(56,'20261119101010796','2026-11-19 13:24:00'),(57,'20261119101010797','2026-11-19 13:25:00'),(58,'20261119101010798','2026-11-19 13:26:00'),(59,'20261119101010799','2026-11-19 13:27:00'),(60,'20261119101010800','2026-11-19 13:28:00'),(61,'20261119101010801','2026-11-19 13:29:00'),(62,'20261119101010802','2026-11-19 13:30:00'),(63,'20261119101010803','2026-11-19 13:31:00'),(64,'20261119101010804','2026-11-19 13:32:00'),(65,'20261119101010805','2026-11-19 13:33:00'),(66,'20261119101010806','2026-11-19 13:34:00'),(67,'20261119101010807','2026-11-19 13:35:00'),(68,'20261119101010808','2026-11-19 13:36:00'),(69,'20261119101010809','2026-11-19 13:37:00'),(70,'20261119101010810','2026-11-19 13:38:00'),(71,'20261119101010811','2026-11-19 13:39:00'),(72,'20261119101010812','2026-11-19 13:40:00'),(73,'20261119101010813','2026-11-19 13:41:00'),(74,'20261119101010814','2026-11-19 13:42:00'),(75,'20261119101010815','2026-11-19 13:43:00'),(76,'20261119101010816','2026-11-19 13:44:00'),(77,'20261119101010817','2026-11-19 13:45:00'),(78,'20261119101010818','2026-11-19 13:46:00'),(79,'20261119101010819','2026-11-19 13:47:00'),(80,'20261119101010820','2026-11-19 13:48:00'),(81,'20261119101010821','2026-11-19 13:49:00'),(82,'20261119101010822','2026-11-19 13:50:01'),(83,'20261119101010823','2026-11-19 13:51:00'),(84,'20261119101010824','2026-11-19 13:52:00'),(85,'20261119101010825','2026-11-19 13:53:00'),(86,'20261119101010826','2026-11-19 13:54:00'),(87,'20261119101010827','2026-11-19 13:55:00'),(88,'20261119101010828','2026-11-19 13:56:00'),(89,'20261119101010829','2026-11-19 13:57:00'),(90,'20261119101010830','2026-11-19 13:58:00'),(91,'20261119101010831','2026-11-19 13:59:00'),(92,'20261119101010832','2026-11-19 14:00:00'),(93,'20261119101010833','2026-11-19 14:01:00'),(94,'20261119101010834','2026-11-19 14:02:00'),(95,'20261119101010835','2026-11-19 14:03:00'),(96,'20261119101010836','2026-11-19 14:04:00'),(97,'20261119101010837','2026-11-19 14:05:00'),(98,'20261119101010838','2026-11-19 14:06:00'),(99,'20261119101010839','2026-11-19 14:07:00'),(100,'20261119101010840','2026-11-19 14:08:00'),(101,'20261119101010841','2026-11-19 14:09:00'),(102,'20261119101010842','2026-11-19 14:10:00'),(103,'20261119101010843','2026-11-19 14:11:00'),(104,'20261119101010844','2026-11-19 14:12:00'),(105,'20261119101010845','2026-11-19 14:13:00'),(106,'20261119101010846','2026-11-19 14:14:00'),(107,'20261119101010847','2026-11-19 14:15:00'),(108,'20261119101010848','2026-11-19 14:16:00'),(109,'20261119101010849','2026-11-19 14:17:00'),(110,'20261119101010850','2026-11-19 14:18:00'),(111,'20261119101010851','2026-11-19 14:19:00'),(112,'20261119101010852','2026-11-19 14:20:00'),(113,'20261119101010853','2026-11-19 14:21:00'),(114,'20261119101010854','2026-11-19 14:22:00'),(115,'20261119101010855','2026-11-19 14:23:00'),(116,'20261119101010856','2026-11-19 14:24:00'),(117,'20261119101010857','2026-11-19 14:25:00'),(118,'20261119101010858','2026-11-19 14:26:00'),(119,'20261119101010859','2026-11-19 14:27:00'),(120,'20261119101010860','2026-11-19 14:28:00'),(121,'20261119101010861','2026-11-19 14:29:00'),(122,'20261119101010862','2026-11-19 14:29:04'),(123,'20261119101010863','2026-11-19 14:29:11'),(124,'20261119101010864','2026-11-19 14:29:23'),(125,'20261119101010865','2026-11-19 14:30:00'),(126,'20261119101010866','2026-11-19 14:31:00'),(127,'20261119101010867','2026-11-19 14:32:00'),(128,'20261119101010868','2026-11-19 14:33:00'),(129,'20261119101010869','2026-11-19 14:34:00'),(130,'20261119101010870','2026-11-19 14:35:00'),(131,'20261119101010871','2026-11-19 14:36:00'),(132,'20261119101010872','2026-11-19 14:37:00'),(133,'20261119101010873','2026-11-19 14:38:00'),(134,'20261119101010874','2026-11-19 14:39:00'),(135,'20261119101010875','2026-11-19 14:40:00'),(136,'20261119101010876','2026-11-19 14:41:00'),(137,'20261119101010877','2026-11-19 14:42:00'),(138,'20261119101010878','2026-11-19 14:43:00'),(139,'20261119101010879','2026-11-19 14:44:00'),(140,'20261119101010880','2026-11-19 14:45:00'),(141,'20261119101010881','2026-11-19 14:46:00'),(142,'20261119101010882','2026-11-19 14:47:00'),(143,'20261119101010883','2026-11-19 14:48:00'),(144,'20261119101010884','2026-11-19 14:49:00'),(145,'20261119101010885','2026-11-19 14:50:00'),(146,'20261119101010886','2026-11-19 14:51:00'),(147,'20261119101010887','2026-11-19 14:52:00'),(148,'20261119101010888','2026-11-19 14:53:01'),(149,'20261119101010889','2026-11-19 14:54:00'),(150,'20261119101010890','2026-11-19 14:55:00'),(151,'20261119101010891','2026-11-19 14:56:00'),(152,'20261119101010892','2026-11-19 14:57:00'),(153,'20261119101010893','2026-11-19 14:58:00'),(154,'20261119101010894','2026-11-19 14:59:00'),(155,'20261119101010895','2026-11-19 15:00:00'),(156,'20261119101010896','2026-11-19 15:01:00'),(157,'20261119101010897','2026-11-19 15:02:00'),(158,'20261119101010898','2026-11-19 15:03:00'),(159,'20261119101010899','2026-11-19 15:04:00'),(160,'20261119101010900','2026-11-19 15:05:00'),(161,'20261119101010901','2026-11-19 15:06:00'),(162,'20261119101010902','2026-11-19 15:07:00'),(163,'20261119101010903','2026-11-19 15:08:01'),(164,'20261119101010904','2026-11-19 15:09:00'),(165,'20261119101010905','2026-11-19 15:10:00'),(166,'20261119101010906','2026-11-19 15:11:00'),(167,'20261119101010907','2026-11-19 15:12:00'),(168,'20261119101010908','2026-11-19 15:13:00'),(169,'20261119101010909','2026-11-19 15:14:00'),(170,'20261119101010910','2026-11-19 15:15:00'),(171,'20261119101010911','2026-11-19 15:16:00'),(172,'20261119101010912','2026-11-19 15:17:00'),(173,'20261119101010913','2026-11-19 15:18:00'),(174,'20261119101010914','2026-11-19 15:19:00'),(175,'20261119101010915','2026-11-19 15:20:00'),(176,'20261119101010916','2026-11-19 15:21:00'),(177,'20261119101010917','2026-11-19 15:22:00'),(178,'20261119101010918','2026-11-19 15:23:00'),(179,'20261119101010919','2026-11-19 15:24:00'),(180,'20261119101010920','2026-11-19 15:25:00'),(181,'20261119101010921','2026-11-19 15:26:00'),(182,'20261119101010922','2026-11-19 15:27:00'),(183,'20261119101010923','2026-11-19 15:28:00'),(184,'20261119101010924','2026-11-19 15:29:00'),(185,'20261119101010925','2026-11-19 15:30:00'),(186,'20261119101010926','2026-11-19 15:31:00'),(187,'20261119101010927','2026-11-19 15:32:00'),(188,'20261119101010928','2026-11-19 15:33:00'),(189,'20261119101010929','2026-11-19 15:34:00'),(190,'20261119101010930','2026-11-19 15:35:00'),(191,'20261119101010931','2026-11-19 15:35:03'),(192,'20261119101010932','2026-11-19 15:35:21'),(193,'20261119101010933','2026-11-19 15:35:48'),(194,'20261119101010934','2026-11-19 15:36:00'),(195,'20261119101010935','2026-11-19 15:37:00'),(196,'20261119101010936','2026-11-19 15:38:00'),(197,'20261119101010937','2026-11-19 15:38:51'),(198,'20261119101010938','2026-11-19 15:39:00'),(199,'20261119101010939','2026-11-19 17:44:13'),(200,'20261119101010940','2026-11-19 17:44:59'),(201,'20261119101010941','2026-11-19 17:45:45'),(202,'20261119101010942','2026-11-19 17:46:31'),(203,'20261119101010943','2026-11-19 17:47:17'),(204,'20261119101010944','2026-11-19 17:48:03'),(205,'20261119101010945','2026-11-19 17:48:49'),(206,'20261119101010946','2026-11-19 17:49:35'),(207,'20261119101010947','2026-11-19 17:50:20'),(208,'20261119101010948','2026-11-19 17:51:06'),(209,'20261119101010949','2026-11-19 17:51:52'),(210,'20261119101010950','2026-11-19 17:52:38'),(211,'20261119101010951','2026-11-19 17:53:24'),(212,'20261119101010952','2026-11-19 17:54:10'),(213,'20261119101010953','2026-11-19 17:54:55'),(214,'20261119101010954','2026-11-19 17:55:41'),(215,'20261119101010955','2026-11-19 17:56:27'),(216,'20261119101010956','2026-11-19 17:57:13'),(217,'20261119101010957','2026-11-19 17:57:59'),(218,'20261119101010958','2026-11-19 17:58:45'),(219,'20261119101010959','2026-11-19 17:59:30'),(220,'20261119101010960','2026-11-19 18:00:16'),(221,'20261119101010961','2026-11-19 18:01:01'),(222,'20261119101010962','2026-11-19 18:01:47'),(223,'20261119101010963','2026-11-19 18:02:33'),(224,'20261119101010964','2026-11-19 18:03:19'),(225,'20261119101010965','2026-11-19 18:04:04'),(226,'20261119101010966','2026-11-19 18:04:50'),(227,'20261119101010967','2026-11-19 18:05:36'),(228,'20261119101010968','2026-11-19 18:06:22'),(229,'20261119101010969','2026-11-19 18:07:08'),(230,'20261119101010970','2026-11-19 18:07:53'),(231,'20261119101010971','2026-11-19 18:08:39'),(232,'20261119101010972','2026-11-19 18:09:25'),(233,'20261119101010973','2026-11-19 18:10:10'),(234,'20261119101010974','2026-11-19 18:10:57'),(235,'20261119101010975','2026-11-19 18:11:43'),(236,'20261119101010976','2026-11-19 18:12:29'),(237,'20261119101010977','2026-11-19 18:13:15'),(238,'20261119101010978','2026-11-19 18:14:00'),(239,'20261119101010979','2026-11-19 18:14:46'),(240,'20261119101010980','2026-11-19 18:15:31'),(241,'20261119101010981','2026-11-19 18:16:18'),(242,'20261119101010982','2026-11-19 18:17:04'),(243,'20261119101010983','2026-11-19 18:17:49'),(244,'20261119101010984','2026-11-19 18:18:35'),(245,'20261119101010985','2026-11-19 18:19:21'),(246,'20261119101010986','2026-11-19 18:20:07'),(247,'20261119101010987','2026-11-19 18:20:53'),(248,'20261119101010988','2026-11-19 18:21:39'),(249,'20261119101010989','2026-11-19 18:22:25'),(250,'20261119101010990','2026-11-19 18:23:10'),(251,'20261119101010991','2026-11-19 18:23:56'),(252,'20261119101010992','2026-11-19 18:24:42'),(253,'20261119101010993','2026-11-19 18:25:28'),(254,'20261119101010994','2026-11-19 18:26:14'),(255,'20261119101010995','2026-11-19 18:26:59'),(256,'20261119101010996','2026-11-19 18:27:45'),(257,'20261119101010997','2026-11-19 18:28:31'),(258,'20261119101010998','2026-11-19 18:29:17'),(259,'20261119101010999','2026-11-19 18:30:02'),(260,'20261119101011000','2026-11-19 18:30:48'),(261,'20261119101011001','2026-11-19 18:31:33'),(262,'20261119101011002','2026-11-19 18:32:19'),(263,'20261119101011003','2026-11-19 18:33:05'),(264,'20261119101011004','2026-11-19 18:33:51'),(265,'20261119101011005','2026-11-19 18:34:36'),(266,'20261119101011006','2026-11-19 18:35:22'),(267,'20261119101011007','2026-11-19 18:36:08'),(268,'20261119101011008','2026-11-19 18:36:54'),(269,'20261119101011009','2026-11-19 18:37:40'),(270,'20261119101011010','2026-11-19 18:38:26'),(271,'20261119101011011','2026-11-19 18:39:11'),(272,'20261119101011012','2026-11-19 18:39:57'),(273,'20261119101011013','2026-11-19 18:40:43'),(274,'20261119101011014','2026-11-19 18:41:29'),(275,'20261119101011015','2026-11-19 18:42:15'),(276,'20261119101011016','2026-11-19 18:43:01'),(277,'20261119101011017','2026-11-19 18:43:46'),(278,'20261119101011018','2026-11-19 18:44:32'),(279,'20261119101011019','2026-11-19 18:45:18'),(280,'20261119101011020','2026-11-19 18:46:04'),(281,'20261119101011021','2026-11-19 18:46:50'),(282,'20261119101011022','2026-11-19 18:47:35'),(283,'20261119101011023','2026-11-19 18:48:21'),(284,'20261119101011024','2026-11-19 18:49:07'),(285,'20261119101011025','2026-11-19 18:49:53'),(286,'20261119101011026','2026-11-19 18:50:38'),(287,'20261119101011027','2026-11-19 18:51:25'),(288,'20261119101011028','2026-11-19 18:52:10'),(289,'20261119101011029','2026-11-19 18:52:56'),(290,'20261119101011030','2026-11-19 18:53:42'),(291,'20261119101011031','2026-11-19 18:54:27'),(292,'20261119101011032','2026-11-19 18:55:13'),(293,'20261119101011033','2026-11-19 18:55:59'),(294,'20261119101011034','2026-11-19 18:56:45'),(295,'20261119101011035','2026-11-19 18:57:31'),(296,'20261119101011036','2026-11-19 18:58:17'),(297,'20261119101011037','2026-11-19 18:59:02'),(298,'20261119101011038','2026-11-19 18:59:48'),(299,'20261119101011039','2026-11-19 19:00:34'),(300,'20261119101011040','2026-11-19 19:01:19'),(301,'20261119101011041','2026-11-19 19:02:05'),(302,'20261119101011042','2026-11-19 19:02:50'),(303,'20261119101011043','2026-11-19 19:03:36'),(304,'20261119101011044','2026-11-19 19:04:22'),(305,'20261119101011045','2026-11-19 19:05:08'),(306,'20261119101011046','2026-11-19 19:05:54'),(307,'20261119101011047','2026-11-19 19:06:40'),(308,'20261119101011048','2026-11-19 19:07:25'),(309,'20261119101011049','2026-11-19 19:08:11'),(310,'20261119101011050','2026-11-19 19:08:57'),(311,'20261119101011051','2026-11-19 19:09:42'),(312,'20261119101011052','2026-11-19 19:10:28'),(313,'20261119101011053','2026-11-19 19:11:14'),(314,'20261119101011054','2026-11-19 19:12:00'),(315,'20261119101011055','2026-11-19 19:12:46'),(316,'20261119101011056','2026-11-19 19:13:31'),(317,'20261119101011057','2026-11-19 19:14:17'),(318,'20261119101011058','2026-11-19 19:15:03'),(319,'20261119101011059','2026-11-19 19:15:49'),(320,'20261119101011060','2026-11-19 19:16:35'),(321,'20261119101011061','2026-11-19 19:17:21'),(322,'20261119101011062','2026-11-19 19:17:52'),(323,'20261119101011063','2026-11-19 19:18:22'),(324,'20261119101011064','2026-11-19 19:18:55'),(325,'20261119101011065','2026-11-19 19:22:58'),(326,'20261119101011066','2026-11-19 19:25:35'),(327,'20261119101011067','2026-11-19 19:26:03'),(328,'20261119101011068','2026-11-19 19:26:31'),(329,'20261119101011069','2026-11-19 19:26:58'),(330,'20261119101011070','2026-11-19 19:27:26'),(331,'20261119101011071','2026-11-19 19:27:54'),(332,'20261119101011072','2026-11-19 19:28:22'),(333,'20261119101011073','2026-11-19 19:28:50'),(334,'20261119101011074','2026-11-19 19:29:17'),(335,'20261119101011075','2026-11-19 19:29:45'),(336,'20261119101011076','2026-11-19 19:30:13'),(337,'20261119101011077','2026-11-19 19:30:40'),(338,'20261119101011078','2026-11-19 19:31:26'),(339,'20261119101011079','2026-11-19 19:31:52'),(340,'20261119101011080','2026-11-19 19:32:17'),(341,'20261119101011081','2026-11-19 19:32:45'),(342,'20261119101011082','2026-11-19 19:33:13'),(343,'20261119101011083','2026-11-19 19:33:41'),(344,'20261119101011084','2026-11-19 19:34:08'),(345,'20261119101011085','2026-11-19 19:34:36'),(346,'20261119101011086','2026-11-19 19:35:08'),(347,'20261119101011087','2026-11-19 19:35:36'),(348,'20261119101011088','2026-11-19 19:36:03'),(349,'20261119101011089','2026-11-19 19:36:32'),(350,'20261119101011090','2026-11-19 19:36:59'),(351,'20261119101011091','2026-11-19 19:37:27'),(352,'20261119101011092','2026-11-19 19:37:55'),(353,'20261119101011093','2026-11-19 19:38:23'),(354,'20261119101011094','2026-11-19 19:38:50'),(355,'20261119101011095','2026-11-19 19:39:18'),(356,'20261119101011096','2026-11-19 19:39:46'),(357,'20261119101011097','2026-11-19 19:40:13'),(358,'20261119101011098','2026-11-19 19:40:41'),(359,'20261119101011099','2026-11-19 19:41:09'),(360,'20261119101011100','2026-11-19 19:41:37'),(361,'20261119101011101','2026-11-19 19:42:04'),(362,'20261119101011102','2026-11-19 19:42:33'),(363,'20261119101011103','2026-11-19 19:43:01'),(364,'20261119101011104','2026-11-19 19:43:29'),(365,'20261119101011105','2026-11-19 19:43:57'),(366,'20261119101011106','2026-11-19 19:44:25'),(367,'20261119101011107','2026-11-19 19:44:53'),(368,'20261119101011108','2026-11-19 19:45:21'),(369,'20261119101011109','2026-11-19 19:45:49'),(370,'20261119101011110','2026-11-19 19:46:18'),(371,'20261119101011111','2026-11-19 19:46:45'),(372,'20261119101011112','2026-11-19 19:47:13'),(373,'20261119101011113','2026-11-19 19:47:41'),(374,'20261119101011114','2026-11-19 19:48:09'),(375,'20261119101011115','2026-11-19 19:48:37'),(376,'20261119101011116','2026-11-19 19:49:05'),(377,'20261119101011117','2026-11-19 19:49:32'),(378,'20261119101011118','2026-11-19 19:50:00'),(379,'20261119101011119','2026-11-19 19:50:28'),(380,'20261119101011120','2026-11-19 19:50:56'),(381,'20261119101011121','2026-11-19 19:51:24'),(382,'20261119101011122','2026-11-19 19:51:52'),(383,'20261119101011123','2026-11-19 19:52:19'),(384,'20261119101011124','2026-11-19 19:52:47'),(385,'20261119101011125','2026-11-19 19:53:15'),(386,'20261119101011126','2026-11-19 19:53:43'),(387,'20261119101011127','2026-11-19 19:54:11'),(388,'20261119101011128','2026-11-19 19:54:39'),(389,'20261119101011129','2026-11-19 19:55:07'),(390,'20261119101011130','2026-11-19 19:55:34'),(391,'20261119101011131','2026-11-19 19:56:03'),(392,'20261119101011132','2026-11-19 19:56:30'),(393,'20261119101011133','2026-11-19 19:56:58'),(394,'20261119101011134','2026-11-19 19:57:26'),(395,'20261119101011135','2026-11-19 19:57:53'),(396,'20261119101011136','2026-11-19 19:58:21'),(397,'20261119101011137','2026-11-19 19:58:49'),(398,'20261119101011138','2026-11-19 19:59:16'),(399,'20261119101011139','2026-11-19 19:59:44'),(400,'20261119101011140','2026-11-19 20:00:12'),(401,'20261119101011141','2026-11-19 20:00:40'),(402,'20261119101011142','2026-11-19 20:01:09'),(403,'20261119101011143','2026-11-19 20:01:37'),(404,'20261119101011144','2026-11-19 20:02:04'),(405,'20261119101011145','2026-11-19 20:02:33'),(406,'20261119101011146','2026-11-19 20:03:00'),(407,'20261119101011147','2026-11-19 20:03:28'),(408,'20261119101011148','2026-11-19 20:03:56'),(409,'20261119101011149','2026-11-19 20:04:20'),(410,'20261119101011150','2026-11-19 20:04:48'),(411,'20261119101011151','2026-11-19 20:05:15'),(412,'20261119101011152','2026-11-19 20:05:43'),(413,'20261119101011153','2026-11-19 20:06:11'),(414,'20261119101011154','2026-11-19 20:06:39'),(415,'20261119101011155','2026-11-19 20:07:07'),(416,'20261119101011156','2026-11-19 20:07:53'),(417,'20261119101011157','2026-11-19 20:08:21'),(418,'20261119101011158','2026-11-19 20:09:06'),(419,'20261119101011159','2026-11-19 20:09:40'),(420,'20261119101011160','2026-11-19 20:09:52'),(421,'20261119101011161','2026-11-19 20:10:20'),(422,'20261119101011162','2026-11-19 20:10:49'),(423,'20261119101011163','2026-11-19 20:11:17'),(424,'20261119101011164','2026-11-19 20:11:45'),(425,'20261119101011165','2026-11-19 20:12:12'),(426,'20261119101011166','2026-11-19 20:12:40'),(427,'20261119101011167','2026-11-19 20:13:08'),(428,'20261119101011168','2026-11-19 20:13:36'),(429,'20261119101011169','2026-11-19 20:14:03'),(430,'20261119101011170','2026-11-19 20:14:31'),(431,'20261119101011171','2026-11-19 20:14:59'),(432,'20261119101011172','2026-11-19 20:15:26'),(433,'20261119101011173','2026-11-19 20:16:13'),(434,'20261119101011174','2026-11-19 20:16:59'),(435,'20261119101011175','2026-11-19 20:17:45'),(436,'20261119101011176','2026-11-19 20:18:31'),(437,'20261119101011177','2026-11-19 20:19:17'),(438,'20261119101011178','2026-11-19 20:20:03'),(439,'20261119101011179','2026-11-19 20:20:31'),(440,'20261119101011180','2026-11-19 20:21:17'),(441,'20261119101011181','2026-11-19 20:22:03'),(442,'20261119101011182','2026-11-19 20:22:49'),(443,'20261119101011183','2026-11-19 20:23:34'),(444,'20261119101011184','2026-11-19 20:24:20'),(445,'20261119101011185','2026-11-19 20:24:49'),(446,'20261119101011186','2026-11-19 20:25:35'),(447,'20261119101011187','2026-11-19 20:26:21'),(448,'20261119101011188','2026-11-19 20:27:22'),(449,'20261119101011189','2026-11-19 20:28:41'),(450,'20261119101011190','2026-11-19 20:29:50'),(451,'20261119101011191','2026-11-19 20:31:09'),(452,'20261119101011192','2026-11-19 20:33:36'),(453,'20261119101011193','2026-11-19 20:35:30'),(454,'20261119101011194','2026-11-19 20:36:49'),(455,'20261119101011195','2026-11-19 20:38:25'),(456,'20261119101011196','2026-11-19 20:39:36');
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
) ENGINE=MyISAM AUTO_INCREMENT=149 DEFAULT CHARSET=latin1 COMMENT='K3 dice 3-min: period/round registry';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `k3_periods_3min`
--

LOCK TABLES `k3_periods_3min` WRITE;
/*!40000 ALTER TABLE `k3_periods_3min` DISABLE KEYS */;
INSERT INTO `k3_periods_3min` VALUES (7,'20261119101020252','2026-11-19 12:33:09'),(8,'20261119101020253','2026-11-19 12:45:00'),(9,'20261119101020254','2026-11-19 12:48:01'),(10,'20261119101020255','2026-11-19 12:51:01'),(11,'20261119101020256','2026-11-19 12:54:00'),(12,'20261119101020257','2026-11-19 12:57:00'),(13,'20261119101020258','2026-11-19 13:00:00'),(14,'20261119101020259','2026-11-19 13:03:00'),(15,'20261119101020260','2026-11-19 13:06:00'),(16,'20261119101020261','2026-11-19 13:09:00'),(17,'20261119101020262','2026-11-19 13:12:00'),(18,'20261119101020263','2026-11-19 13:15:01'),(19,'20261119101020264','2026-11-19 13:18:00'),(20,'20261119101020265','2026-11-19 13:21:01'),(21,'20261119101020266','2026-11-19 13:24:00'),(22,'20261119101020267','2026-11-19 13:27:01'),(23,'20261119101020268','2026-11-19 13:30:00'),(24,'20261119101020269','2026-11-19 13:33:00'),(25,'20261119101020270','2026-11-19 13:36:01'),(26,'20261119101020271','2026-11-19 13:39:00'),(27,'20261119101020272','2026-11-19 13:42:00'),(28,'20261119101020273','2026-11-19 13:45:00'),(29,'20261119101020274','2026-11-19 13:48:00'),(30,'20261119101020275','2026-11-19 13:51:01'),(31,'20261119101020276','2026-11-19 13:54:00'),(32,'20261119101020277','2026-11-19 13:57:01'),(33,'20261119101020278','2026-11-19 14:00:01'),(34,'20261119101020279','2026-11-19 14:03:00'),(35,'20261119101020280','2026-11-19 14:06:01'),(36,'20261119101020281','2026-11-19 14:09:00'),(37,'20261119101020282','2026-11-19 14:12:01'),(38,'20261119101020283','2026-11-19 14:15:00'),(39,'20261119101020284','2026-11-19 14:18:01'),(40,'20261119101020285','2026-11-19 14:21:01'),(41,'20261119101020286','2026-11-19 14:24:00'),(42,'20261119101020287','2026-11-19 14:27:01'),(43,'20261119101020288','2026-11-19 14:33:00'),(44,'20261119101020289','2026-11-19 14:36:01'),(45,'20261119101020290','2026-11-19 14:39:00'),(46,'20261119101020291','2026-11-19 14:42:00'),(47,'20261119101020292','2026-11-19 14:45:01'),(48,'20261119101020293','2026-11-19 14:48:00'),(49,'20261119101020294','2026-11-19 14:51:00'),(50,'20261119101020295','2026-11-19 14:54:00'),(51,'20261119101020296','2026-11-19 14:57:01'),(52,'20261119101020297','2026-11-19 15:00:00'),(53,'20261119101020298','2026-11-19 15:03:00'),(54,'20261119101020299','2026-11-19 15:06:00'),(55,'20261119101020300','2026-11-19 15:09:01'),(56,'20261119101020301','2026-11-19 15:12:00'),(57,'20261119101020302','2026-11-19 15:15:01'),(58,'20261119101020303','2026-11-19 15:18:01'),(59,'20261119101020304','2026-11-19 15:21:01'),(60,'20261119101020305','2026-11-19 15:24:01'),(61,'20261119101020306','2026-11-19 15:27:00'),(62,'20261119101020307','2026-11-19 15:30:01'),(63,'20261119101020308','2026-11-19 15:33:00'),(64,'20261119101020309','2026-11-19 17:45:45'),(65,'20261119101020310','2026-11-19 17:48:03'),(66,'20261119101020311','2026-11-19 17:48:49'),(67,'20261119101020312','2026-11-19 17:51:07'),(68,'20261119101020313','2026-11-19 17:51:53'),(69,'20261119101020314','2026-11-19 17:54:10'),(70,'20261119101020315','2026-11-19 17:54:56'),(71,'20261119101020316','2026-11-19 17:57:13'),(72,'20261119101020317','2026-11-19 17:57:59'),(73,'20261119101020318','2026-11-19 18:00:16'),(74,'20261119101020319','2026-11-19 18:03:19'),(75,'20261119101020320','2026-11-19 18:06:22'),(76,'20261119101020321','2026-11-19 18:09:25'),(77,'20261119101020322','2026-11-19 18:12:29'),(78,'20261119101020323','2026-11-19 18:15:32'),(79,'20261119101020324','2026-11-19 18:18:35'),(80,'20261119101020325','2026-11-19 18:21:39'),(81,'20261119101020326','2026-11-19 18:24:42'),(82,'20261119101020327','2026-11-19 18:27:45'),(83,'20261119101020328','2026-11-19 18:30:03'),(84,'20261119101020329','2026-11-19 18:30:48'),(85,'20261119101020330','2026-11-19 18:33:05'),(86,'20261119101020331','2026-11-19 18:33:51'),(87,'20261119101020332','2026-11-19 18:36:08'),(88,'20261119101020333','2026-11-19 18:36:54'),(89,'20261119101020334','2026-11-19 18:39:11'),(90,'20261119101020335','2026-11-19 18:39:57'),(91,'20261119101020336','2026-11-19 18:42:15'),(92,'20261119101020337','2026-11-19 18:45:18'),(93,'20261119101020338','2026-11-19 18:48:21'),(94,'20261119101020339','2026-11-19 18:51:25'),(95,'20261119101020340','2026-11-19 18:54:28'),(96,'20261119101020341','2026-11-19 18:57:31'),(97,'20261119101020342','2026-11-19 19:00:34'),(98,'20261119101020343','2026-11-19 19:03:36'),(99,'20261119101020344','2026-11-19 19:06:40'),(100,'20261119101020345','2026-11-19 19:09:43'),(101,'20261119101020346','2026-11-19 19:12:00'),(102,'20261119101020347','2026-11-19 19:12:46'),(103,'20261119101020348','2026-11-19 19:15:03'),(104,'20261119101020349','2026-11-19 19:15:49'),(105,'20261119101020350','2026-11-19 19:18:22'),(106,'20261119101020351','2026-11-19 19:18:55'),(107,'20261119101020352','2026-11-19 19:27:26'),(108,'20261119101020353','2026-11-19 19:27:54'),(109,'20261119101020354','2026-11-19 19:30:13'),(110,'20261119101020355','2026-11-19 19:30:40'),(111,'20261119101020356','2026-11-19 19:33:13'),(112,'20261119101020357','2026-11-19 19:33:41'),(113,'20261119101020358','2026-11-19 19:36:42'),(114,'20261119101020359','2026-11-19 19:37:08'),(115,'20261119101020360','2026-11-19 19:39:25'),(116,'20261119101020361','2026-11-19 19:39:52'),(117,'20261119101020362','2026-11-19 19:42:11'),(118,'20261119101020363','2026-11-19 19:42:39'),(119,'20261119101020364','2026-11-19 19:43:09'),(120,'20261119101020365','2026-11-19 19:45:27'),(121,'20261119101020366','2026-11-19 19:45:56'),(122,'20261119101020367','2026-11-19 19:48:16'),(123,'20261119101020368','2026-11-19 19:48:45'),(124,'20261119101020369','2026-11-19 19:51:32'),(125,'20261119101020370','2026-11-19 19:51:59'),(126,'20261119101020371','2026-11-19 19:54:19'),(127,'20261119101020372','2026-11-19 19:54:47'),(128,'20261119101020373','2026-11-19 19:57:33'),(129,'20261119101020374','2026-11-19 19:58:01'),(130,'20261119101020375','2026-11-19 20:00:19'),(131,'20261119101020376','2026-11-19 20:00:48'),(132,'20261119101020377','2026-11-19 20:03:35'),(133,'20261119101020378','2026-11-19 20:04:03'),(134,'20261119101020379','2026-11-19 20:06:12'),(135,'20261119101020380','2026-11-19 20:06:39'),(136,'20261119101020381','2026-11-19 20:09:40'),(137,'20261119101020382','2026-11-19 20:09:41'),(138,'20261119101020383','2026-11-19 20:09:53'),(139,'20261119101020384','2026-11-19 20:12:12'),(140,'20261119101020385','2026-11-19 20:12:40'),(141,'20261119101020386','2026-11-19 20:16:00'),(142,'20261119101020387','2026-11-19 20:19:04'),(143,'20261119101020388','2026-11-19 20:21:50'),(144,'20261119101020389','2026-11-19 20:24:36'),(145,'20261119101020390','2026-11-19 20:25:23'),(146,'20261119101020391','2026-11-19 20:32:16'),(147,'20261119101020392','2026-11-19 20:34:44'),(148,'20261119101020393','2026-11-19 20:37:38');
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
) ENGINE=MyISAM AUTO_INCREMENT=90 DEFAULT CHARSET=latin1 COMMENT='K3 dice 5-min: period/round registry';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `k3_periods_5min`
--

LOCK TABLES `k3_periods_5min` WRITE;
/*!40000 ALTER TABLE `k3_periods_5min` DISABLE KEYS */;
INSERT INTO `k3_periods_5min` VALUES (3,'20261119101030154','2026-11-19 12:45:00'),(4,'20261119101030155','2026-11-19 12:50:00'),(5,'20261119101030156','2026-11-19 12:55:00'),(6,'20261119101030157','2026-11-19 13:00:01'),(7,'20261119101030158','2026-11-19 13:05:00'),(8,'20261119101030159','2026-11-19 13:10:00'),(9,'20261119101030160','2026-11-19 13:15:01'),(10,'20261119101030161','2026-11-19 13:20:00'),(11,'20261119101030162','2026-11-19 13:25:01'),(12,'20261119101030163','2026-11-19 13:30:00'),(13,'20261119101030164','2026-11-19 13:35:00'),(14,'20261119101030165','2026-11-19 13:40:01'),(15,'20261119101030166','2026-11-19 13:45:01'),(16,'20261119101030167','2026-11-19 13:50:01'),(17,'20261119101030168','2026-11-19 13:55:01'),(18,'20261119101030169','2026-11-19 14:00:02'),(19,'20261119101030170','2026-11-19 14:05:00'),(20,'20261119101030171','2026-11-19 14:10:00'),(21,'20261119101030172','2026-11-19 14:15:00'),(22,'20261119101030173','2026-11-19 14:20:01'),(23,'20261119101030174','2026-11-19 14:25:01'),(24,'20261119101030175','2026-11-19 14:35:00'),(25,'20261119101030176','2026-11-19 14:40:00'),(26,'20261119101030177','2026-11-19 14:45:01'),(27,'20261119101030178','2026-11-19 14:50:00'),(28,'20261119101030179','2026-11-19 14:55:01'),(29,'20261119101030180','2026-11-19 15:00:00'),(30,'20261119101030181','2026-11-19 15:05:00'),(31,'20261119101030182','2026-11-19 15:10:00'),(32,'20261119101030183','2026-11-19 15:15:01'),(33,'20261119101030184','2026-11-19 15:20:01'),(34,'20261119101030185','2026-11-19 15:25:00'),(35,'20261119101030186','2026-11-19 15:30:01'),(36,'20261119101030187','2026-11-19 15:35:00'),(37,'20261119101030188','2026-11-19 15:35:21'),(38,'20261119101030189','2026-11-19 15:35:48'),(39,'20261119101030190','2026-11-19 17:45:45'),(40,'20261119101030191','2026-11-19 17:50:20'),(41,'20261119101030192','2026-11-19 17:55:42'),(42,'20261119101030193','2026-11-19 18:00:17'),(43,'20261119101030194','2026-11-19 18:05:36'),(44,'20261119101030195','2026-11-19 18:10:11'),(45,'20261119101030196','2026-11-19 18:10:57'),(46,'20261119101030197','2026-11-19 18:15:32'),(47,'20261119101030198','2026-11-19 18:20:07'),(48,'20261119101030199','2026-11-19 18:20:53'),(49,'20261119101030200','2026-11-19 18:25:28'),(50,'20261119101030201','2026-11-19 18:30:03'),(51,'20261119101030202','2026-11-19 18:30:48'),(52,'20261119101030203','2026-11-19 18:35:22'),(53,'20261119101030204','2026-11-19 18:40:43'),(54,'20261119101030205','2026-11-19 18:45:18'),(55,'20261119101030206','2026-11-19 18:50:39'),(56,'20261119101030207','2026-11-19 18:55:14'),(57,'20261119101030208','2026-11-19 18:56:01'),(58,'20261119101030209','2026-11-19 19:00:34'),(59,'20261119101030210','2026-11-19 19:05:08'),(60,'20261119101030211','2026-11-19 19:05:54'),(61,'20261119101030212','2026-11-19 19:10:29'),(62,'20261119101030213','2026-11-19 19:15:03'),(63,'20261119101030214','2026-11-19 19:15:49'),(64,'20261119101030215','2026-11-19 19:25:35'),(65,'20261119101030216','2026-11-19 19:30:13'),(66,'20261119101030217','2026-11-19 19:30:41'),(67,'20261119101030218','2026-11-19 19:35:15'),(68,'20261119101030219','2026-11-19 19:35:46'),(69,'20261119101030220','2026-11-19 19:36:10'),(70,'20261119101030221','2026-11-19 19:40:21'),(71,'20261119101030222','2026-11-19 19:40:48'),(72,'20261119101030223','2026-11-19 19:45:31'),(73,'20261119101030224','2026-11-19 19:46:01'),(74,'20261119101030225','2026-11-19 19:50:35'),(75,'20261119101030226','2026-11-19 19:51:03'),(76,'20261119101030227','2026-11-19 19:55:14'),(77,'20261119101030228','2026-11-19 19:55:42'),(78,'20261119101030229','2026-11-19 19:56:10'),(79,'20261119101030230','2026-11-19 20:00:22'),(80,'20261119101030231','2026-11-19 20:00:52'),(81,'20261119101030232','2026-11-19 20:05:16'),(82,'20261119101030233','2026-11-19 20:05:44'),(83,'20261119101030234','2026-11-19 20:10:21'),(84,'20261119101030235','2026-11-19 20:10:49'),(85,'20261119101030236','2026-11-19 20:16:00'),(86,'20261119101030237','2026-11-19 20:20:09'),(87,'20261119101030238','2026-11-19 20:21:04'),(88,'20261119101030239','2026-11-19 20:26:09'),(89,'20261119101030240','2026-11-19 20:32:50');
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
) ENGINE=MyISAM AUTO_INCREMENT=41 DEFAULT CHARSET=latin1 COMMENT='K3 dice 10-min: published results';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `k3_results_10min`
--

LOCK TABLES `k3_results_10min` WRITE;
/*!40000 ALTER TABLE `k3_results_10min` DISABLE KEYS */;
INSERT INTO `k3_results_10min` VALUES (1,'20261119101040078',422,8,'shonu','2026-11-19 13:00:01'),(2,'20261119101040079',126,9,'shonu','2026-11-19 13:10:00'),(3,'20261119101040080',223,7,'shonu','2026-11-19 13:20:01'),(4,'20261119101040081',133,7,'shonu','2026-11-19 13:30:01'),(5,'20261119101040082',162,9,'shonu','2026-11-19 13:40:01'),(6,'20261119101040083',666,18,'shonu','2026-11-19 13:50:01'),(7,'20261119101040084',461,11,'shonu','2026-11-19 14:00:02'),(8,'20261119101040085',366,15,'shonu','2026-11-19 14:10:00'),(9,'20261119101040086',512,8,'shonu','2026-11-19 14:20:01'),(10,'20261119101040087',432,9,'shonu','2026-11-19 14:40:00'),(11,'20261119101040088',316,10,'shonu','2026-11-19 14:50:00'),(12,'20261119101040089',645,15,'shonu','2026-11-19 15:00:01'),(13,'20261119101040090',233,8,'shonu','2026-11-19 15:10:00'),(14,'20261119101040091',442,10,'shonu','2026-11-19 15:20:01'),(15,'20261119101040092',231,6,'shonu','2026-11-19 15:30:02'),(16,'20261119101040093',664,16,'shonu','2026-11-19 17:50:21'),(17,'20261119101040094',424,10,'shonu','2026-11-19 18:00:17'),(18,'20261119101040095',344,11,'shonu','2026-11-19 18:10:11'),(19,'20261119101040096',443,11,'shonu','2026-11-19 18:10:57'),(20,'20261119101040097',552,12,'shonu','2026-11-19 18:20:07'),(21,'20261119101040098',412,7,'shonu','2026-11-19 18:20:53'),(22,'20261119101040099',315,9,'shonu','2026-11-19 18:30:03'),(23,'20261119101040100',366,15,'shonu','2026-11-19 18:30:49'),(24,'20261119101040101',311,5,'shonu','2026-11-19 18:40:44'),(25,'20261119101040102',433,10,'shonu','2026-11-19 18:50:39'),(26,'20261119101040103',344,11,'shonu','2026-11-19 19:00:35'),(27,'20261119101040104',231,6,'shonu','2026-11-19 19:10:29'),(28,'20261119101040105',234,9,'shonu','2026-11-19 19:30:13'),(29,'20261119101040106',446,14,'shonu','2026-11-19 19:30:41'),(30,'20261119101040107',536,14,'shonu','2026-11-19 19:40:21'),(31,'20261119101040108',611,8,'shonu','2026-11-19 19:40:48'),(32,'20261119101040109',266,14,'shonu','2026-11-19 19:50:36'),(33,'20261119101040110',252,9,'shonu','2026-11-19 19:51:04'),(34,'20261119101040111',535,13,'shonu','2026-11-19 20:00:22'),(35,'20261119101040112',655,16,'shonu','2026-11-19 20:00:52'),(36,'20261119101040113',244,10,'shonu','2026-11-19 20:10:21'),(37,'20261119101040114',146,11,'shonu','2026-11-19 20:10:49'),(38,'20261119101040115',343,10,'shonu','2026-11-19 20:20:09'),(39,'20261119101040116',116,8,'shonu','2026-11-19 20:21:04'),(40,'20261119101040117',324,9,'shonu','2026-11-19 20:32:50');
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
) ENGINE=MyISAM AUTO_INCREMENT=455 DEFAULT CHARSET=latin1 COMMENT='K3 dice 1-min: published results per period (3 dice, sum)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `k3_results_1min`
--

LOCK TABLES `k3_results_1min` WRITE;
/*!40000 ALTER TABLE `k3_results_1min` DISABLE KEYS */;
INSERT INTO `k3_results_1min` VALUES (11,'20261119101010752',511,7,'shonu','2026-11-19 12:33:08'),(12,'20261119101010753',114,6,'shonu','2026-11-19 12:34:23'),(13,'20261119101010754',312,6,'shonu','2026-11-19 12:34:55'),(14,'20261119101010755',222,6,'shonu','2026-11-19 12:44:01'),(15,'20261119101010756',141,6,'shonu','2026-11-19 12:45:00'),(16,'20261119101010757',461,11,'shonu','2026-11-19 12:46:00'),(17,'20261119101010758',226,10,'shonu','2026-11-19 12:47:00'),(18,'20261119101010759',141,6,'shonu','2026-11-19 12:48:00'),(19,'20261119101010760',134,8,'shonu','2026-11-19 12:49:00'),(20,'20261119101010761',545,14,'shonu','2026-11-19 12:50:00'),(21,'20261119101010762',256,13,'shonu','2026-11-19 12:51:00'),(22,'20261119101010763',362,11,'shonu','2026-11-19 12:52:00'),(23,'20261119101010764',246,12,'shonu','2026-11-19 12:53:00'),(24,'20261119101010765',235,10,'shonu','2026-11-19 12:54:00'),(25,'20261119101010766',366,15,'shonu','2026-11-19 12:55:00'),(26,'20261119101010767',113,5,'shonu','2026-11-19 12:56:00'),(27,'20261119101010768',534,12,'shonu','2026-11-19 12:57:00'),(28,'20261119101010769',245,11,'shonu','2026-11-19 12:58:00'),(29,'20261119101010770',655,16,'shonu','2026-11-19 12:59:00'),(30,'20261119101010771',653,14,'shonu','2026-11-19 13:00:00'),(31,'20261119101010772',526,13,'shonu','2026-11-19 13:01:00'),(32,'20261119101010773',646,16,'shonu','2026-11-19 13:02:00'),(33,'20261119101010774',636,15,'shonu','2026-11-19 13:03:00'),(34,'20261119101010775',556,16,'shonu','2026-11-19 13:04:00'),(35,'20261119101010776',235,10,'shonu','2026-11-19 13:05:00'),(36,'20261119101010777',143,8,'shonu','2026-11-19 13:06:00'),(37,'20261119101010778',146,11,'shonu','2026-11-19 13:07:00'),(38,'20261119101010779',331,7,'shonu','2026-11-19 13:08:00'),(39,'20261119101010780',223,7,'shonu','2026-11-19 13:09:00'),(40,'20261119101010781',222,6,'shonu','2026-11-19 13:10:00'),(41,'20261119101010782',153,9,'shonu','2026-11-19 13:11:00'),(42,'20261119101010783',242,8,'shonu','2026-11-19 13:12:00'),(43,'20261119101010784',631,10,'shonu','2026-11-19 13:13:00'),(44,'20261119101010785',514,10,'shonu','2026-11-19 13:14:00'),(45,'20261119101010786',642,12,'shonu','2026-11-19 13:15:00'),(46,'20261119101010787',122,5,'shonu','2026-11-19 13:16:00'),(47,'20261119101010788',613,10,'shonu','2026-11-19 13:17:00'),(48,'20261119101010789',631,10,'shonu','2026-11-19 13:18:00'),(49,'20261119101010790',111,3,'shonu','2026-11-19 13:19:00'),(50,'20261119101010791',644,14,'shonu','2026-11-19 13:20:00'),(51,'20261119101010792',343,10,'shonu','2026-11-19 13:21:00'),(52,'20261119101010793',532,10,'shonu','2026-11-19 13:22:00'),(53,'20261119101010794',442,10,'shonu','2026-11-19 13:23:00'),(54,'20261119101010795',155,11,'shonu','2026-11-19 13:24:00'),(55,'20261119101010796',622,10,'shonu','2026-11-19 13:25:00'),(56,'20261119101010797',543,12,'shonu','2026-11-19 13:26:00'),(57,'20261119101010798',136,10,'shonu','2026-11-19 13:27:00'),(58,'20261119101010799',452,11,'shonu','2026-11-19 13:28:00'),(59,'20261119101010800',543,12,'shonu','2026-11-19 13:29:00'),(60,'20261119101010801',225,9,'shonu','2026-11-19 13:30:00'),(61,'20261119101010802',665,17,'shonu','2026-11-19 13:31:00'),(62,'20261119101010803',445,13,'shonu','2026-11-19 13:32:00'),(63,'20261119101010804',363,12,'shonu','2026-11-19 13:33:00'),(64,'20261119101010805',641,11,'shonu','2026-11-19 13:34:00'),(65,'20261119101010806',415,10,'shonu','2026-11-19 13:35:00'),(66,'20261119101010807',624,12,'shonu','2026-11-19 13:36:00'),(67,'20261119101010808',236,11,'shonu','2026-11-19 13:37:00'),(68,'20261119101010809',633,12,'shonu','2026-11-19 13:38:00'),(69,'20261119101010810',335,11,'shonu','2026-11-19 13:39:00'),(70,'20261119101010811',623,11,'shonu','2026-11-19 13:40:00'),(71,'20261119101010812',163,10,'shonu','2026-11-19 13:41:00'),(72,'20261119101010813',533,11,'shonu','2026-11-19 13:42:00'),(73,'20261119101010814',344,11,'shonu','2026-11-19 13:43:00'),(74,'20261119101010815',462,12,'shonu','2026-11-19 13:44:00'),(75,'20261119101010816',426,12,'shonu','2026-11-19 13:45:00'),(76,'20261119101010817',524,11,'shonu','2026-11-19 13:46:00'),(77,'20261119101010818',423,9,'shonu','2026-11-19 13:47:00'),(78,'20261119101010819',432,9,'shonu','2026-11-19 13:48:00'),(79,'20261119101010820',466,16,'shonu','2026-11-19 13:49:00'),(80,'20261119101010821',644,14,'shonu','2026-11-19 13:50:00'),(81,'20261119101010822',656,17,'shonu','2026-11-19 13:51:00'),(82,'20261119101010823',564,15,'shonu','2026-11-19 13:52:00'),(83,'20261119101010824',231,6,'shonu','2026-11-19 13:53:00'),(84,'20261119101010825',244,10,'shonu','2026-11-19 13:54:00'),(85,'20261119101010826',333,9,'shonu','2026-11-19 13:55:00'),(86,'20261119101010827',663,15,'shonu','2026-11-19 13:56:00'),(87,'20261119101010828',621,9,'shonu','2026-11-19 13:57:00'),(88,'20261119101010829',643,13,'shonu','2026-11-19 13:58:00'),(89,'20261119101010830',512,8,'shonu','2026-11-19 13:59:00'),(90,'20261119101010831',512,8,'shonu','2026-11-19 14:00:00'),(91,'20261119101010832',411,6,'shonu','2026-11-19 14:01:00'),(92,'20261119101010833',654,15,'shonu','2026-11-19 14:02:00'),(93,'20261119101010834',236,11,'shonu','2026-11-19 14:03:00'),(94,'20261119101010835',414,9,'shonu','2026-11-19 14:04:00'),(95,'20261119101010836',233,8,'shonu','2026-11-19 14:05:00'),(96,'20261119101010837',333,9,'shonu','2026-11-19 14:06:00'),(97,'20261119101010838',311,5,'shonu','2026-11-19 14:07:00'),(98,'20261119101010839',513,9,'shonu','2026-11-19 14:08:00'),(99,'20261119101010840',663,15,'shonu','2026-11-19 14:09:00'),(100,'20261119101010841',355,13,'shonu','2026-11-19 14:10:00'),(101,'20261119101010842',243,9,'shonu','2026-11-19 14:11:00'),(102,'20261119101010843',561,12,'shonu','2026-11-19 14:12:00'),(103,'20261119101010844',216,9,'shonu','2026-11-19 14:13:00'),(104,'20261119101010845',215,8,'shonu','2026-11-19 14:14:00'),(105,'20261119101010846',344,11,'shonu','2026-11-19 14:15:00'),(106,'20261119101010847',535,13,'shonu','2026-11-19 14:16:00'),(107,'20261119101010848',546,15,'shonu','2026-11-19 14:17:00'),(108,'20261119101010849',634,13,'shonu','2026-11-19 14:18:00'),(109,'20261119101010850',535,13,'shonu','2026-11-19 14:19:00'),(110,'20261119101010851',225,9,'shonu','2026-11-19 14:20:00'),(111,'20261119101010852',316,10,'shonu','2026-11-19 14:21:00'),(112,'20261119101010853',246,12,'shonu','2026-11-19 14:22:00'),(113,'20261119101010854',632,11,'shonu','2026-11-19 14:23:00'),(114,'20261119101010855',531,9,'shonu','2026-11-19 14:24:00'),(115,'20261119101010856',452,11,'shonu','2026-11-19 14:25:00'),(116,'20261119101010857',331,7,'shonu','2026-11-19 14:26:00'),(117,'20261119101010858',523,10,'shonu','2026-11-19 14:27:00'),(118,'20261119101010859',354,12,'shonu','2026-11-19 14:28:00'),(119,'20261119101010860',435,12,'shonu','2026-11-19 14:29:00'),(120,'20261119101010861',341,8,'shonu','2026-11-19 14:29:04'),(121,'20261119101010862',332,8,'shonu','2026-11-19 14:29:11'),(122,'20261119101010863',162,9,'shonu','2026-11-19 14:29:23'),(123,'20261119101010864',653,14,'shonu','2026-11-19 14:30:00'),(124,'20261119101010865',515,11,'shonu','2026-11-19 14:31:00'),(125,'20261119101010866',524,11,'shonu','2026-11-19 14:32:00'),(126,'20261119101010867',623,11,'shonu','2026-11-19 14:33:00'),(127,'20261119101010868',165,12,'shonu','2026-11-19 14:34:00'),(128,'20261119101010869',346,13,'shonu','2026-11-19 14:35:00'),(129,'20261119101010870',436,13,'shonu','2026-11-19 14:36:00'),(130,'20261119101010871',662,14,'shonu','2026-11-19 14:37:00'),(131,'20261119101010872',142,7,'shonu','2026-11-19 14:38:00'),(132,'20261119101010873',356,14,'shonu','2026-11-19 14:39:00'),(133,'20261119101010874',154,10,'shonu','2026-11-19 14:40:00'),(134,'20261119101010875',556,16,'shonu','2026-11-19 14:41:00'),(135,'20261119101010876',643,13,'shonu','2026-11-19 14:42:00'),(136,'20261119101010877',541,10,'shonu','2026-11-19 14:43:00'),(137,'20261119101010878',431,8,'shonu','2026-11-19 14:44:00'),(138,'20261119101010879',152,8,'shonu','2026-11-19 14:45:00'),(139,'20261119101010880',156,12,'shonu','2026-11-19 14:46:00'),(140,'20261119101010881',335,11,'shonu','2026-11-19 14:47:00'),(141,'20261119101010882',363,12,'shonu','2026-11-19 14:48:00'),(142,'20261119101010883',345,12,'shonu','2026-11-19 14:49:00'),(143,'20261119101010884',532,10,'shonu','2026-11-19 14:50:00'),(144,'20261119101010885',362,11,'shonu','2026-11-19 14:51:00'),(145,'20261119101010886',256,13,'shonu','2026-11-19 14:52:00'),(146,'20261119101010887',243,9,'shonu','2026-11-19 14:53:01'),(147,'20261119101010888',414,9,'shonu','2026-11-19 14:54:00'),(148,'20261119101010889',555,15,'shonu','2026-11-19 14:55:00'),(149,'20261119101010890',345,12,'shonu','2026-11-19 14:56:00'),(150,'20261119101010891',453,12,'shonu','2026-11-19 14:57:00'),(151,'20261119101010892',124,7,'shonu','2026-11-19 14:58:00'),(152,'20261119101010893',111,3,'shonu','2026-11-19 14:59:00'),(153,'20261119101010894',565,16,'shonu','2026-11-19 15:00:00'),(154,'20261119101010895',321,6,'shonu','2026-11-19 15:01:00'),(155,'20261119101010896',535,13,'shonu','2026-11-19 15:02:00'),(156,'20261119101010897',544,13,'shonu','2026-11-19 15:03:00'),(157,'20261119101010898',362,11,'shonu','2026-11-19 15:04:00'),(158,'20261119101010899',554,14,'shonu','2026-11-19 15:05:00'),(159,'20261119101010900',511,7,'shonu','2026-11-19 15:06:00'),(160,'20261119101010901',412,7,'shonu','2026-11-19 15:07:00'),(161,'20261119101010902',541,10,'shonu','2026-11-19 15:08:01'),(162,'20261119101010903',121,4,'shonu','2026-11-19 15:09:00'),(163,'20261119101010904',316,10,'shonu','2026-11-19 15:10:00'),(164,'20261119101010905',566,17,'shonu','2026-11-19 15:11:00'),(165,'20261119101010906',255,12,'shonu','2026-11-19 15:12:00'),(166,'20261119101010907',352,10,'shonu','2026-11-19 15:13:00'),(167,'20261119101010908',443,11,'shonu','2026-11-19 15:14:00'),(168,'20261119101010909',346,13,'shonu','2026-11-19 15:15:00'),(169,'20261119101010910',415,10,'shonu','2026-11-19 15:16:00'),(170,'20261119101010911',344,11,'shonu','2026-11-19 15:17:00'),(171,'20261119101010912',532,10,'shonu','2026-11-19 15:18:00'),(172,'20261119101010913',644,14,'shonu','2026-11-19 15:19:00'),(173,'20261119101010914',443,11,'shonu','2026-11-19 15:20:00'),(174,'20261119101010915',363,12,'shonu','2026-11-19 15:21:00'),(175,'20261119101010916',321,6,'shonu','2026-11-19 15:22:00'),(176,'20261119101010917',215,8,'shonu','2026-11-19 15:23:00'),(177,'20261119101010918',342,9,'shonu','2026-11-19 15:24:00'),(178,'20261119101010919',245,11,'shonu','2026-11-19 15:25:00'),(179,'20261119101010920',345,12,'shonu','2026-11-19 15:26:00'),(180,'20261119101010921',154,10,'shonu','2026-11-19 15:27:00'),(181,'20261119101010922',146,11,'shonu','2026-11-19 15:28:00'),(182,'20261119101010923',156,12,'shonu','2026-11-19 15:29:00'),(183,'20261119101010924',136,10,'shonu','2026-11-19 15:30:00'),(184,'20261119101010925',544,13,'shonu','2026-11-19 15:31:00'),(185,'20261119101010926',112,4,'shonu','2026-11-19 15:32:00'),(186,'20261119101010927',321,6,'shonu','2026-11-19 15:33:00'),(187,'20261119101010928',525,12,'shonu','2026-11-19 15:34:00'),(188,'20261119101010929',421,7,'shonu','2026-11-19 15:35:00'),(189,'20261119101010930',566,17,'shonu','2026-11-19 15:35:03'),(190,'20261119101010931',536,14,'shonu','2026-11-19 15:35:21'),(191,'20261119101010932',534,12,'shonu','2026-11-19 15:35:48'),(192,'20261119101010933',221,5,'shonu','2026-11-19 15:36:00'),(193,'20261119101010934',265,13,'shonu','2026-11-19 15:37:00'),(194,'20261119101010935',331,7,'shonu','2026-11-19 15:38:00'),(195,'20261119101010936',646,16,'shonu','2026-11-19 15:38:51'),(196,'20261119101010937',121,4,'shonu','2026-11-19 15:39:00'),(197,'20261119101010938',324,9,'shonu','2026-11-19 17:44:13'),(198,'20261119101010939',541,10,'shonu','2026-11-19 17:44:59'),(199,'20261119101010940',212,5,'shonu','2026-11-19 17:45:45'),(200,'20261119101010941',353,11,'shonu','2026-11-19 17:46:31'),(201,'20261119101010942',342,9,'shonu','2026-11-19 17:47:17'),(202,'20261119101010943',145,10,'shonu','2026-11-19 17:48:03'),(203,'20261119101010944',645,15,'shonu','2026-11-19 17:48:49'),(204,'20261119101010945',233,8,'shonu','2026-11-19 17:49:35'),(205,'20261119101010946',534,12,'shonu','2026-11-19 17:50:20'),(206,'20261119101010947',162,9,'shonu','2026-11-19 17:51:06'),(207,'20261119101010948',346,13,'shonu','2026-11-19 17:51:52'),(208,'20261119101010949',146,11,'shonu','2026-11-19 17:52:38'),(209,'20261119101010950',252,9,'shonu','2026-11-19 17:53:24'),(210,'20261119101010951',563,14,'shonu','2026-11-19 17:54:10'),(211,'20261119101010952',433,10,'shonu','2026-11-19 17:54:55'),(212,'20261119101010953',323,8,'shonu','2026-11-19 17:55:41'),(213,'20261119101010954',531,9,'shonu','2026-11-19 17:56:27'),(214,'20261119101010955',523,10,'shonu','2026-11-19 17:57:13'),(215,'20261119101010956',543,12,'shonu','2026-11-19 17:57:59'),(216,'20261119101010957',224,8,'shonu','2026-11-19 17:58:45'),(217,'20261119101010958',452,11,'shonu','2026-11-19 17:59:30'),(218,'20261119101010959',522,9,'shonu','2026-11-19 18:00:16'),(219,'20261119101010960',122,5,'shonu','2026-11-19 18:01:01'),(220,'20261119101010961',255,12,'shonu','2026-11-19 18:01:47'),(221,'20261119101010962',165,12,'shonu','2026-11-19 18:02:33'),(222,'20261119101010963',411,6,'shonu','2026-11-19 18:03:19'),(223,'20261119101010964',145,10,'shonu','2026-11-19 18:04:04'),(224,'20261119101010965',362,11,'shonu','2026-11-19 18:04:50'),(225,'20261119101010966',212,5,'shonu','2026-11-19 18:05:36'),(226,'20261119101010967',624,12,'shonu','2026-11-19 18:06:22'),(227,'20261119101010968',465,15,'shonu','2026-11-19 18:07:08'),(228,'20261119101010969',412,7,'shonu','2026-11-19 18:07:53'),(229,'20261119101010970',136,10,'shonu','2026-11-19 18:08:39'),(230,'20261119101010971',462,12,'shonu','2026-11-19 18:09:25'),(231,'20261119101010972',455,14,'shonu','2026-11-19 18:10:10'),(232,'20261119101010973',454,13,'shonu','2026-11-19 18:10:57'),(233,'20261119101010974',335,11,'shonu','2026-11-19 18:11:43'),(234,'20261119101010975',336,12,'shonu','2026-11-19 18:12:29'),(235,'20261119101010976',452,11,'shonu','2026-11-19 18:13:15'),(236,'20261119101010977',335,11,'shonu','2026-11-19 18:14:00'),(237,'20261119101010978',364,13,'shonu','2026-11-19 18:14:46'),(238,'20261119101010979',652,13,'shonu','2026-11-19 18:15:31'),(239,'20261119101010980',146,11,'shonu','2026-11-19 18:16:18'),(240,'20261119101010981',346,13,'shonu','2026-11-19 18:17:04'),(241,'20261119101010982',111,3,'shonu','2026-11-19 18:17:49'),(242,'20261119101010983',436,13,'shonu','2026-11-19 18:18:35'),(243,'20261119101010984',666,18,'shonu','2026-11-19 18:19:21'),(244,'20261119101010985',464,14,'shonu','2026-11-19 18:20:07'),(245,'20261119101010986',325,10,'shonu','2026-11-19 18:20:53'),(246,'20261119101010987',344,11,'shonu','2026-11-19 18:21:39'),(247,'20261119101010988',532,10,'shonu','2026-11-19 18:22:25'),(248,'20261119101010989',635,14,'shonu','2026-11-19 18:23:10'),(249,'20261119101010990',344,11,'shonu','2026-11-19 18:23:56'),(250,'20261119101010991',163,10,'shonu','2026-11-19 18:24:42'),(251,'20261119101010992',146,11,'shonu','2026-11-19 18:25:28'),(252,'20261119101010993',341,8,'shonu','2026-11-19 18:26:14'),(253,'20261119101010994',236,11,'shonu','2026-11-19 18:26:59'),(254,'20261119101010995',335,11,'shonu','2026-11-19 18:27:45'),(255,'20261119101010996',232,7,'shonu','2026-11-19 18:28:31'),(256,'20261119101010997',632,11,'shonu','2026-11-19 18:29:17'),(257,'20261119101010998',241,7,'shonu','2026-11-19 18:30:02'),(258,'20261119101010999',154,10,'shonu','2026-11-19 18:30:48'),(259,'20261119101011000',613,10,'shonu','2026-11-19 18:31:33'),(260,'20261119101011001',133,7,'shonu','2026-11-19 18:32:19'),(261,'20261119101011002',262,10,'shonu','2026-11-19 18:33:05'),(262,'20261119101011003',125,8,'shonu','2026-11-19 18:33:51'),(263,'20261119101011004',466,16,'shonu','2026-11-19 18:34:36'),(264,'20261119101011005',213,6,'shonu','2026-11-19 18:35:22'),(265,'20261119101011006',524,11,'shonu','2026-11-19 18:36:08'),(266,'20261119101011007',244,10,'shonu','2026-11-19 18:36:54'),(267,'20261119101011008',661,13,'shonu','2026-11-19 18:37:40'),(268,'20261119101011009',112,4,'shonu','2026-11-19 18:38:26'),(269,'20261119101011010',342,9,'shonu','2026-11-19 18:39:11'),(270,'20261119101011011',345,12,'shonu','2026-11-19 18:39:57'),(271,'20261119101011012',425,11,'shonu','2026-11-19 18:40:43'),(272,'20261119101011013',252,9,'shonu','2026-11-19 18:41:29'),(273,'20261119101011014',145,10,'shonu','2026-11-19 18:42:15'),(274,'20261119101011015',361,10,'shonu','2026-11-19 18:43:01'),(275,'20261119101011016',534,12,'shonu','2026-11-19 18:43:46'),(276,'20261119101011017',332,8,'shonu','2026-11-19 18:44:32'),(277,'20261119101011018',443,11,'shonu','2026-11-19 18:45:18'),(278,'20261119101011019',535,13,'shonu','2026-11-19 18:46:04'),(279,'20261119101011020',245,11,'shonu','2026-11-19 18:46:50'),(280,'20261119101011021',436,13,'shonu','2026-11-19 18:47:35'),(281,'20261119101011022',232,7,'shonu','2026-11-19 18:48:21'),(282,'20261119101011023',626,14,'shonu','2026-11-19 18:49:07'),(283,'20261119101011024',142,7,'shonu','2026-11-19 18:49:53'),(284,'20261119101011025',433,10,'shonu','2026-11-19 18:50:38'),(285,'20261119101011026',431,8,'shonu','2026-11-19 18:51:25'),(286,'20261119101011027',145,10,'shonu','2026-11-19 18:52:10'),(287,'20261119101011028',232,7,'shonu','2026-11-19 18:52:56'),(288,'20261119101011029',614,11,'shonu','2026-11-19 18:53:42'),(289,'20261119101011030',653,14,'shonu','2026-11-19 18:54:27'),(290,'20261119101011031',525,12,'shonu','2026-11-19 18:55:13'),(291,'20261119101011032',516,12,'shonu','2026-11-19 18:55:59'),(292,'20261119101011033',334,10,'shonu','2026-11-19 18:56:45'),(293,'20261119101011034',646,16,'shonu','2026-11-19 18:57:31'),(294,'20261119101011035',354,12,'shonu','2026-11-19 18:58:17'),(295,'20261119101011036',654,15,'shonu','2026-11-19 18:59:02'),(296,'20261119101011037',524,11,'shonu','2026-11-19 18:59:48'),(297,'20261119101011038',544,13,'shonu','2026-11-19 19:00:34'),(298,'20261119101011039',444,12,'shonu','2026-11-19 19:01:19'),(299,'20261119101011040',552,12,'shonu','2026-11-19 19:02:05'),(300,'20261119101011041',624,12,'shonu','2026-11-19 19:02:50'),(301,'20261119101011042',251,8,'shonu','2026-11-19 19:03:36'),(302,'20261119101011043',234,9,'shonu','2026-11-19 19:04:22'),(303,'20261119101011044',216,9,'shonu','2026-11-19 19:05:08'),(304,'20261119101011045',133,7,'shonu','2026-11-19 19:05:54'),(305,'20261119101011046',162,9,'shonu','2026-11-19 19:06:40'),(306,'20261119101011047',232,7,'shonu','2026-11-19 19:07:25'),(307,'20261119101011048',165,12,'shonu','2026-11-19 19:08:11'),(308,'20261119101011049',321,6,'shonu','2026-11-19 19:08:57'),(309,'20261119101011050',646,16,'shonu','2026-11-19 19:09:42'),(310,'20261119101011051',445,13,'shonu','2026-11-19 19:10:28'),(311,'20261119101011052',144,9,'shonu','2026-11-19 19:11:14'),(312,'20261119101011053',254,11,'shonu','2026-11-19 19:12:00'),(313,'20261119101011054',636,15,'shonu','2026-11-19 19:12:46'),(314,'20261119101011055',531,9,'shonu','2026-11-19 19:13:31'),(315,'20261119101011056',262,10,'shonu','2026-11-19 19:14:17'),(316,'20261119101011057',543,12,'shonu','2026-11-19 19:15:03'),(317,'20261119101011058',462,12,'shonu','2026-11-19 19:15:49'),(318,'20261119101011059',255,12,'shonu','2026-11-19 19:16:35'),(319,'20261119101011060',314,8,'shonu','2026-11-19 19:17:21'),(320,'20261119101011061',634,13,'shonu','2026-11-19 19:17:52'),(321,'20261119101011062',412,7,'shonu','2026-11-19 19:18:22'),(322,'20261119101011063',643,13,'shonu','2026-11-19 19:18:55'),(323,'20261119101011064',151,7,'shonu','2026-11-19 19:22:58'),(324,'20261119101011065',435,12,'shonu','2026-11-19 19:25:35'),(325,'20261119101011066',133,7,'shonu','2026-11-19 19:26:03'),(326,'20261119101011067',516,12,'shonu','2026-11-19 19:26:31'),(327,'20261119101011068',665,17,'shonu','2026-11-19 19:26:58'),(328,'20261119101011069',612,9,'shonu','2026-11-19 19:27:26'),(329,'20261119101011070',263,11,'shonu','2026-11-19 19:27:54'),(330,'20261119101011071',263,11,'shonu','2026-11-19 19:28:22'),(331,'20261119101011072',532,10,'shonu','2026-11-19 19:28:50'),(332,'20261119101011073',355,13,'shonu','2026-11-19 19:29:17'),(333,'20261119101011074',153,9,'shonu','2026-11-19 19:29:45'),(334,'20261119101011075',251,8,'shonu','2026-11-19 19:30:13'),(335,'20261119101011076',261,9,'shonu','2026-11-19 19:30:40'),(336,'20261119101011077',545,14,'shonu','2026-11-19 19:31:26'),(337,'20261119101011078',463,13,'shonu','2026-11-19 19:31:52'),(338,'20261119101011079',463,13,'shonu','2026-11-19 19:32:17'),(339,'20261119101011080',332,8,'shonu','2026-11-19 19:32:45'),(340,'20261119101011081',264,12,'shonu','2026-11-19 19:33:13'),(341,'20261119101011082',436,13,'shonu','2026-11-19 19:33:41'),(342,'20261119101011083',323,8,'shonu','2026-11-19 19:34:08'),(343,'20261119101011084',663,15,'shonu','2026-11-19 19:34:36'),(344,'20261119101011085',311,5,'shonu','2026-11-19 19:35:08'),(345,'20261119101011086',163,10,'shonu','2026-11-19 19:35:36'),(346,'20261119101011087',224,8,'shonu','2026-11-19 19:36:03'),(347,'20261119101011088',531,9,'shonu','2026-11-19 19:36:32'),(348,'20261119101011089',125,8,'shonu','2026-11-19 19:36:59'),(349,'20261119101011090',654,15,'shonu','2026-11-19 19:37:27'),(350,'20261119101011091',651,12,'shonu','2026-11-19 19:37:55'),(351,'20261119101011092',522,9,'shonu','2026-11-19 19:38:23'),(352,'20261119101011093',636,15,'shonu','2026-11-19 19:38:50'),(353,'20261119101011094',233,8,'shonu','2026-11-19 19:39:18'),(354,'20261119101011095',563,14,'shonu','2026-11-19 19:39:46'),(355,'20261119101011096',156,12,'shonu','2026-11-19 19:40:13'),(356,'20261119101011097',425,11,'shonu','2026-11-19 19:40:41'),(357,'20261119101011098',512,8,'shonu','2026-11-19 19:41:09'),(358,'20261119101011099',424,10,'shonu','2026-11-19 19:41:37'),(359,'20261119101011100',326,11,'shonu','2026-11-19 19:42:04'),(360,'20261119101011101',524,11,'shonu','2026-11-19 19:42:33'),(361,'20261119101011102',435,12,'shonu','2026-11-19 19:43:01'),(362,'20261119101011103',163,10,'shonu','2026-11-19 19:43:29'),(363,'20261119101011104',132,6,'shonu','2026-11-19 19:43:57'),(364,'20261119101011105',365,14,'shonu','2026-11-19 19:44:25'),(365,'20261119101011106',646,16,'shonu','2026-11-19 19:44:53'),(366,'20261119101011107',565,16,'shonu','2026-11-19 19:45:21'),(367,'20261119101011108',161,8,'shonu','2026-11-19 19:45:49'),(368,'20261119101011109',432,9,'shonu','2026-11-19 19:46:18'),(369,'20261119101011110',631,10,'shonu','2026-11-19 19:46:45'),(370,'20261119101011111',654,15,'shonu','2026-11-19 19:47:13'),(371,'20261119101011112',514,10,'shonu','2026-11-19 19:47:41'),(372,'20261119101011113',142,7,'shonu','2026-11-19 19:48:09'),(373,'20261119101011114',316,10,'shonu','2026-11-19 19:48:37'),(374,'20261119101011115',114,6,'shonu','2026-11-19 19:49:05'),(375,'20261119101011116',624,12,'shonu','2026-11-19 19:49:32'),(376,'20261119101011117',314,8,'shonu','2026-11-19 19:50:00'),(377,'20261119101011118',244,10,'shonu','2026-11-19 19:50:28'),(378,'20261119101011119',223,7,'shonu','2026-11-19 19:50:56'),(379,'20261119101011120',235,10,'shonu','2026-11-19 19:51:24'),(380,'20261119101011121',222,6,'shonu','2026-11-19 19:51:52'),(381,'20261119101011122',354,12,'shonu','2026-11-19 19:52:19'),(382,'20261119101011123',112,4,'shonu','2026-11-19 19:52:47'),(383,'20261119101011124',332,8,'shonu','2026-11-19 19:53:15'),(384,'20261119101011125',411,6,'shonu','2026-11-19 19:53:43'),(385,'20261119101011126',421,7,'shonu','2026-11-19 19:54:11'),(386,'20261119101011127',243,9,'shonu','2026-11-19 19:54:39'),(387,'20261119101011128',145,10,'shonu','2026-11-19 19:55:07'),(388,'20261119101011129',325,10,'shonu','2026-11-19 19:55:34'),(389,'20261119101011130',156,12,'shonu','2026-11-19 19:56:03'),(390,'20261119101011131',115,7,'shonu','2026-11-19 19:56:30'),(391,'20261119101011132',633,12,'shonu','2026-11-19 19:56:58'),(392,'20261119101011133',613,10,'shonu','2026-11-19 19:57:26'),(393,'20261119101011134',232,7,'shonu','2026-11-19 19:57:53'),(394,'20261119101011135',123,6,'shonu','2026-11-19 19:58:21'),(395,'20261119101011136',423,9,'shonu','2026-11-19 19:58:49'),(396,'20261119101011137',551,11,'shonu','2026-11-19 19:59:16'),(397,'20261119101011138',246,12,'shonu','2026-11-19 19:59:44'),(398,'20261119101011139',556,16,'shonu','2026-11-19 20:00:12'),(399,'20261119101011140',664,16,'shonu','2026-11-19 20:00:40'),(400,'20261119101011141',415,10,'shonu','2026-11-19 20:01:09'),(401,'20261119101011142',211,4,'shonu','2026-11-19 20:01:37'),(402,'20261119101011143',254,11,'shonu','2026-11-19 20:02:04'),(403,'20261119101011144',355,13,'shonu','2026-11-19 20:02:33'),(404,'20261119101011145',126,9,'shonu','2026-11-19 20:03:00'),(405,'20261119101011146',112,4,'shonu','2026-11-19 20:03:28'),(406,'20261119101011147',454,13,'shonu','2026-11-19 20:03:56'),(407,'20261119101011148',655,16,'shonu','2026-11-19 20:04:20'),(408,'20261119101011149',126,9,'shonu','2026-11-19 20:04:48'),(409,'20261119101011150',236,11,'shonu','2026-11-19 20:05:15'),(410,'20261119101011151',633,12,'shonu','2026-11-19 20:05:43'),(411,'20261119101011152',131,5,'shonu','2026-11-19 20:06:11'),(412,'20261119101011153',362,11,'shonu','2026-11-19 20:06:39'),(413,'20261119101011154',561,12,'shonu','2026-11-19 20:07:07'),(414,'20261119101011155',531,9,'shonu','2026-11-19 20:07:53'),(415,'20261119101011156',532,10,'shonu','2026-11-19 20:08:21'),(416,'20261119101011157',615,12,'shonu','2026-11-19 20:09:06'),(417,'20261119101011158',542,11,'shonu','2026-11-19 20:09:40'),(418,'20261119101011159',633,12,'shonu','2026-11-19 20:09:52'),(419,'20261119101011160',634,13,'shonu','2026-11-19 20:10:20'),(420,'20261119101011161',441,9,'shonu','2026-11-19 20:10:49'),(421,'20261119101011162',426,12,'shonu','2026-11-19 20:11:17'),(422,'20261119101011163',545,14,'shonu','2026-11-19 20:11:45'),(423,'20261119101011164',235,10,'shonu','2026-11-19 20:12:12'),(424,'20261119101011165',463,13,'shonu','2026-11-19 20:12:40'),(425,'20261119101011166',413,8,'shonu','2026-11-19 20:13:08'),(426,'20261119101011167',651,12,'shonu','2026-11-19 20:13:36'),(427,'20261119101011168',452,11,'shonu','2026-11-19 20:14:03'),(428,'20261119101011169',345,12,'shonu','2026-11-19 20:14:31'),(429,'20261119101011170',341,8,'shonu','2026-11-19 20:14:59'),(430,'20261119101011171',624,12,'shonu','2026-11-19 20:15:26'),(431,'20261119101011172',423,9,'shonu','2026-11-19 20:16:13'),(432,'20261119101011173',123,6,'shonu','2026-11-19 20:16:59'),(433,'20261119101011174',623,11,'shonu','2026-11-19 20:17:45'),(434,'20261119101011175',113,5,'shonu','2026-11-19 20:18:31'),(435,'20261119101011176',465,15,'shonu','2026-11-19 20:19:17'),(436,'20261119101011177',533,11,'shonu','2026-11-19 20:20:03'),(437,'20261119101011178',534,12,'shonu','2026-11-19 20:20:31'),(438,'20261119101011179',421,7,'shonu','2026-11-19 20:21:17'),(439,'20261119101011180',665,17,'shonu','2026-11-19 20:22:03'),(440,'20261119101011181',366,15,'shonu','2026-11-19 20:22:49'),(441,'20261119101011182',145,10,'shonu','2026-11-19 20:23:34'),(442,'20261119101011183',263,11,'shonu','2026-11-19 20:24:20'),(443,'20261119101011184',654,15,'shonu','2026-11-19 20:24:49'),(444,'20261119101011185',125,8,'shonu','2026-11-19 20:25:35'),(445,'20261119101011186',135,9,'shonu','2026-11-19 20:26:21'),(446,'20261119101011187',163,10,'shonu','2026-11-19 20:27:22'),(447,'20261119101011188',443,11,'shonu','2026-11-19 20:28:41'),(448,'20261119101011189',332,8,'shonu','2026-11-19 20:29:50'),(449,'20261119101011190',431,8,'shonu','2026-11-19 20:31:09'),(450,'20261119101011191',135,9,'shonu','2026-11-19 20:33:36'),(451,'20261119101011192',223,7,'shonu','2026-11-19 20:35:30'),(452,'20261119101011193',335,11,'shonu','2026-11-19 20:36:49'),(453,'20261119101011194',561,12,'shonu','2026-11-19 20:38:25'),(454,'20261119101011195',263,11,'shonu','2026-11-19 20:39:36');
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
) ENGINE=MyISAM AUTO_INCREMENT=147 DEFAULT CHARSET=latin1 COMMENT='K3 dice 3-min: published results';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `k3_results_3min`
--

LOCK TABLES `k3_results_3min` WRITE;
/*!40000 ALTER TABLE `k3_results_3min` DISABLE KEYS */;
INSERT INTO `k3_results_3min` VALUES (6,'20261119101020252',446,14,'shonu','2026-11-19 12:45:00'),(7,'20261119101020253',435,12,'shonu','2026-11-19 12:48:01'),(8,'20261119101020254',324,9,'shonu','2026-11-19 12:51:01'),(9,'20261119101020255',153,9,'shonu','2026-11-19 12:54:00'),(10,'20261119101020256',436,13,'shonu','2026-11-19 12:57:00'),(11,'20261119101020257',144,9,'shonu','2026-11-19 13:00:00'),(12,'20261119101020258',546,15,'shonu','2026-11-19 13:03:00'),(13,'20261119101020259',461,11,'shonu','2026-11-19 13:06:00'),(14,'20261119101020260',262,10,'shonu','2026-11-19 13:09:00'),(15,'20261119101020261',242,8,'shonu','2026-11-19 13:12:00'),(16,'20261119101020262',646,16,'shonu','2026-11-19 13:15:01'),(17,'20261119101020263',261,9,'shonu','2026-11-19 13:18:00'),(18,'20261119101020264',124,7,'shonu','2026-11-19 13:21:01'),(19,'20261119101020265',544,13,'shonu','2026-11-19 13:24:00'),(20,'20261119101020266',654,15,'shonu','2026-11-19 13:27:01'),(21,'20261119101020267',526,13,'shonu','2026-11-19 13:30:00'),(22,'20261119101020268',515,11,'shonu','2026-11-19 13:33:00'),(23,'20261119101020269',651,12,'shonu','2026-11-19 13:36:01'),(24,'20261119101020270',514,10,'shonu','2026-11-19 13:39:00'),(25,'20261119101020271',132,6,'shonu','2026-11-19 13:42:00'),(26,'20261119101020272',345,12,'shonu','2026-11-19 13:45:00'),(27,'20261119101020273',236,11,'shonu','2026-11-19 13:48:00'),(28,'20261119101020274',642,12,'shonu','2026-11-19 13:51:01'),(29,'20261119101020275',463,13,'shonu','2026-11-19 13:54:00'),(30,'20261119101020276',556,16,'shonu','2026-11-19 13:57:01'),(31,'20261119101020277',151,7,'shonu','2026-11-19 14:00:01'),(32,'20261119101020278',162,9,'shonu','2026-11-19 14:03:00'),(33,'20261119101020279',554,14,'shonu','2026-11-19 14:06:01'),(34,'20261119101020280',512,8,'shonu','2026-11-19 14:09:00'),(35,'20261119101020281',245,11,'shonu','2026-11-19 14:12:01'),(36,'20261119101020282',324,9,'shonu','2026-11-19 14:15:00'),(37,'20261119101020283',165,12,'shonu','2026-11-19 14:18:01'),(38,'20261119101020284',155,11,'shonu','2026-11-19 14:21:01'),(39,'20261119101020285',161,8,'shonu','2026-11-19 14:24:00'),(40,'20261119101020286',466,16,'shonu','2026-11-19 14:27:01'),(41,'20261119101020287',163,10,'shonu','2026-11-19 14:33:00'),(42,'20261119101020288',545,14,'shonu','2026-11-19 14:36:01'),(43,'20261119101020289',415,10,'shonu','2026-11-19 14:39:00'),(44,'20261119101020290',154,10,'shonu','2026-11-19 14:42:00'),(45,'20261119101020291',244,10,'shonu','2026-11-19 14:45:01'),(46,'20261119101020292',454,13,'shonu','2026-11-19 14:48:00'),(47,'20261119101020293',141,6,'shonu','2026-11-19 14:51:00'),(48,'20261119101020294',363,12,'shonu','2026-11-19 14:54:00'),(49,'20261119101020295',236,11,'shonu','2026-11-19 14:57:01'),(50,'20261119101020296',564,15,'shonu','2026-11-19 15:00:00'),(51,'20261119101020297',166,13,'shonu','2026-11-19 15:03:00'),(52,'20261119101020298',313,7,'shonu','2026-11-19 15:06:00'),(53,'20261119101020299',443,11,'shonu','2026-11-19 15:09:01'),(54,'20261119101020300',236,11,'shonu','2026-11-19 15:12:00'),(55,'20261119101020301',422,8,'shonu','2026-11-19 15:15:01'),(56,'20261119101020302',252,9,'shonu','2026-11-19 15:18:01'),(57,'20261119101020303',123,6,'shonu','2026-11-19 15:21:01'),(58,'20261119101020304',145,10,'shonu','2026-11-19 15:24:01'),(59,'20261119101020305',665,17,'shonu','2026-11-19 15:27:00'),(60,'20261119101020306',612,9,'shonu','2026-11-19 15:30:01'),(61,'20261119101020307',346,13,'shonu','2026-11-19 15:33:00'),(62,'20261119101020308',554,14,'shonu','2026-11-19 17:45:45'),(63,'20261119101020309',561,12,'shonu','2026-11-19 17:48:03'),(64,'20261119101020310',626,14,'shonu','2026-11-19 17:48:49'),(65,'20261119101020311',535,13,'shonu','2026-11-19 17:51:07'),(66,'20261119101020312',442,10,'shonu','2026-11-19 17:51:53'),(67,'20261119101020313',122,5,'shonu','2026-11-19 17:54:10'),(68,'20261119101020314',242,8,'shonu','2026-11-19 17:54:56'),(69,'20261119101020315',633,12,'shonu','2026-11-19 17:57:13'),(70,'20261119101020316',253,10,'shonu','2026-11-19 17:57:59'),(71,'20261119101020317',446,14,'shonu','2026-11-19 18:00:16'),(72,'20261119101020318',436,13,'shonu','2026-11-19 18:03:19'),(73,'20261119101020319',356,14,'shonu','2026-11-19 18:06:22'),(74,'20261119101020320',654,15,'shonu','2026-11-19 18:09:25'),(75,'20261119101020321',634,13,'shonu','2026-11-19 18:12:29'),(76,'20261119101020322',445,13,'shonu','2026-11-19 18:15:32'),(77,'20261119101020323',615,12,'shonu','2026-11-19 18:18:35'),(78,'20261119101020324',565,16,'shonu','2026-11-19 18:21:39'),(79,'20261119101020325',146,11,'shonu','2026-11-19 18:24:42'),(80,'20261119101020326',263,11,'shonu','2026-11-19 18:27:45'),(81,'20261119101020327',645,15,'shonu','2026-11-19 18:30:03'),(82,'20261119101020328',625,13,'shonu','2026-11-19 18:30:48'),(83,'20261119101020329',663,15,'shonu','2026-11-19 18:33:05'),(84,'20261119101020330',512,8,'shonu','2026-11-19 18:33:51'),(85,'20261119101020331',461,11,'shonu','2026-11-19 18:36:08'),(86,'20261119101020332',325,10,'shonu','2026-11-19 18:36:54'),(87,'20261119101020333',312,6,'shonu','2026-11-19 18:39:11'),(88,'20261119101020334',262,10,'shonu','2026-11-19 18:39:57'),(89,'20261119101020335',236,11,'shonu','2026-11-19 18:42:15'),(90,'20261119101020336',235,10,'shonu','2026-11-19 18:45:18'),(91,'20261119101020337',445,13,'shonu','2026-11-19 18:48:21'),(92,'20261119101020338',662,14,'shonu','2026-11-19 18:51:25'),(93,'20261119101020339',442,10,'shonu','2026-11-19 18:54:28'),(94,'20261119101020340',314,8,'shonu','2026-11-19 18:57:31'),(95,'20261119101020341',414,9,'shonu','2026-11-19 19:00:34'),(96,'20261119101020342',411,6,'shonu','2026-11-19 19:03:36'),(97,'20261119101020343',135,9,'shonu','2026-11-19 19:06:40'),(98,'20261119101020344',236,11,'shonu','2026-11-19 19:09:43'),(99,'20261119101020345',121,4,'shonu','2026-11-19 19:12:00'),(100,'20261119101020346',222,6,'shonu','2026-11-19 19:12:46'),(101,'20261119101020347',553,13,'shonu','2026-11-19 19:15:03'),(102,'20261119101020348',144,9,'shonu','2026-11-19 19:15:49'),(103,'20261119101020349',213,6,'shonu','2026-11-19 19:18:22'),(104,'20261119101020350',112,4,'shonu','2026-11-19 19:18:55'),(105,'20261119101020351',242,8,'shonu','2026-11-19 19:27:26'),(106,'20261119101020352',653,14,'shonu','2026-11-19 19:27:54'),(107,'20261119101020353',211,4,'shonu','2026-11-19 19:30:13'),(108,'20261119101020354',641,11,'shonu','2026-11-19 19:30:40'),(109,'20261119101020355',241,7,'shonu','2026-11-19 19:33:13'),(110,'20261119101020356',345,12,'shonu','2026-11-19 19:33:41'),(111,'20261119101020357',421,7,'shonu','2026-11-19 19:36:42'),(112,'20261119101020358',321,6,'shonu','2026-11-19 19:37:08'),(113,'20261119101020359',561,12,'shonu','2026-11-19 19:39:25'),(114,'20261119101020360',253,10,'shonu','2026-11-19 19:39:52'),(115,'20261119101020361',532,10,'shonu','2026-11-19 19:42:11'),(116,'20261119101020362',566,17,'shonu','2026-11-19 19:42:39'),(117,'20261119101020363',556,16,'shonu','2026-11-19 19:43:09'),(118,'20261119101020364',333,9,'shonu','2026-11-19 19:45:27'),(119,'20261119101020365',353,11,'shonu','2026-11-19 19:45:56'),(120,'20261119101020366',156,12,'shonu','2026-11-19 19:48:16'),(121,'20261119101020367',434,11,'shonu','2026-11-19 19:48:45'),(122,'20261119101020368',426,12,'shonu','2026-11-19 19:51:32'),(123,'20261119101020369',556,16,'shonu','2026-11-19 19:51:59'),(124,'20261119101020370',424,10,'shonu','2026-11-19 19:54:19'),(125,'20261119101020371',624,12,'shonu','2026-11-19 19:54:47'),(126,'20261119101020372',556,16,'shonu','2026-11-19 19:57:33'),(127,'20261119101020373',535,13,'shonu','2026-11-19 19:58:01'),(128,'20261119101020374',554,14,'shonu','2026-11-19 20:00:19'),(129,'20261119101020375',426,12,'shonu','2026-11-19 20:00:48'),(130,'20261119101020376',511,7,'shonu','2026-11-19 20:03:35'),(131,'20261119101020377',345,12,'shonu','2026-11-19 20:04:03'),(132,'20261119101020378',156,12,'shonu','2026-11-19 20:06:12'),(133,'20261119101020379',662,14,'shonu','2026-11-19 20:06:39'),(134,'20261119101020380',415,10,'shonu','2026-11-19 20:09:40'),(135,'20261119101020381',542,11,'shonu','2026-11-19 20:09:41'),(136,'20261119101020382',256,13,'shonu','2026-11-19 20:09:53'),(137,'20261119101020383',354,12,'shonu','2026-11-19 20:12:12'),(138,'20261119101020384',355,13,'shonu','2026-11-19 20:12:40'),(139,'20261119101020385',442,10,'shonu','2026-11-19 20:16:00'),(140,'20261119101020386',332,8,'shonu','2026-11-19 20:19:04'),(141,'20261119101020387',421,7,'shonu','2026-11-19 20:21:50'),(142,'20261119101020388',622,10,'shonu','2026-11-19 20:24:36'),(143,'20261119101020389',313,7,'shonu','2026-11-19 20:25:23'),(144,'20261119101020390',311,5,'shonu','2026-11-19 20:32:16'),(145,'20261119101020391',245,11,'shonu','2026-11-19 20:34:44'),(146,'20261119101020392',122,5,'shonu','2026-11-19 20:37:38');
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
) ENGINE=MyISAM AUTO_INCREMENT=88 DEFAULT CHARSET=latin1 COMMENT='K3 dice 5-min: published results';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `k3_results_5min`
--

LOCK TABLES `k3_results_5min` WRITE;
/*!40000 ALTER TABLE `k3_results_5min` DISABLE KEYS */;
INSERT INTO `k3_results_5min` VALUES (2,'20261119101030154',622,10,'shonu','2026-11-19 12:50:00'),(3,'20261119101030155',111,3,'shonu','2026-11-19 12:55:00'),(4,'20261119101030156',544,13,'shonu','2026-11-19 13:00:01'),(5,'20261119101030157',166,13,'shonu','2026-11-19 13:05:00'),(6,'20261119101030158',611,8,'shonu','2026-11-19 13:10:00'),(7,'20261119101030159',363,12,'shonu','2026-11-19 13:15:01'),(8,'20261119101030160',155,11,'shonu','2026-11-19 13:20:00'),(9,'20261119101030161',634,13,'shonu','2026-11-19 13:25:01'),(10,'20261119101030162',152,8,'shonu','2026-11-19 13:30:00'),(11,'20261119101030163',626,14,'shonu','2026-11-19 13:35:00'),(12,'20261119101030164',166,13,'shonu','2026-11-19 13:40:01'),(13,'20261119101030165',166,13,'shonu','2026-11-19 13:45:01'),(14,'20261119101030166',153,9,'shonu','2026-11-19 13:50:01'),(15,'20261119101030167',466,16,'shonu','2026-11-19 13:55:01'),(16,'20261119101030168',145,10,'shonu','2026-11-19 14:00:02'),(17,'20261119101030169',143,8,'shonu','2026-11-19 14:05:00'),(18,'20261119101030170',433,10,'shonu','2026-11-19 14:10:00'),(19,'20261119101030171',342,9,'shonu','2026-11-19 14:15:00'),(20,'20261119101030172',453,12,'shonu','2026-11-19 14:20:01'),(21,'20261119101030173',441,9,'shonu','2026-11-19 14:25:01'),(22,'20261119101030174',463,13,'shonu','2026-11-19 14:35:00'),(23,'20261119101030175',333,9,'shonu','2026-11-19 14:40:00'),(24,'20261119101030176',543,12,'shonu','2026-11-19 14:45:01'),(25,'20261119101030177',253,10,'shonu','2026-11-19 14:50:00'),(26,'20261119101030178',656,17,'shonu','2026-11-19 14:55:01'),(27,'20261119101030179',444,12,'shonu','2026-11-19 15:00:00'),(28,'20261119101030180',324,9,'shonu','2026-11-19 15:05:00'),(29,'20261119101030181',162,9,'shonu','2026-11-19 15:10:00'),(30,'20261119101030182',342,9,'shonu','2026-11-19 15:15:01'),(31,'20261119101030183',424,10,'shonu','2026-11-19 15:20:01'),(32,'20261119101030184',541,10,'shonu','2026-11-19 15:25:00'),(33,'20261119101030185',651,12,'shonu','2026-11-19 15:30:01'),(34,'20261119101030186',226,10,'shonu','2026-11-19 15:35:00'),(35,'20261119101030187',164,11,'shonu','2026-11-19 15:35:21'),(36,'20261119101030188',522,9,'shonu','2026-11-19 15:35:48'),(37,'20261119101030189',134,8,'shonu','2026-11-19 17:45:45'),(38,'20261119101030190',562,13,'shonu','2026-11-19 17:50:20'),(39,'20261119101030191',442,10,'shonu','2026-11-19 17:55:42'),(40,'20261119101030192',242,8,'shonu','2026-11-19 18:00:17'),(41,'20261119101030193',456,15,'shonu','2026-11-19 18:05:36'),(42,'20261119101030194',251,8,'shonu','2026-11-19 18:10:11'),(43,'20261119101030195',411,6,'shonu','2026-11-19 18:10:57'),(44,'20261119101030196',512,8,'shonu','2026-11-19 18:15:32'),(45,'20261119101030197',134,8,'shonu','2026-11-19 18:20:07'),(46,'20261119101030198',134,8,'shonu','2026-11-19 18:20:53'),(47,'20261119101030199',151,7,'shonu','2026-11-19 18:25:28'),(48,'20261119101030200',115,7,'shonu','2026-11-19 18:30:03'),(49,'20261119101030201',421,7,'shonu','2026-11-19 18:30:48'),(50,'20261119101030202',416,11,'shonu','2026-11-19 18:35:22'),(51,'20261119101030203',155,11,'shonu','2026-11-19 18:40:43'),(52,'20261119101030204',646,16,'shonu','2026-11-19 18:45:18'),(53,'20261119101030205',411,6,'shonu','2026-11-19 18:50:39'),(54,'20261119101030206',415,10,'shonu','2026-11-19 18:55:14'),(55,'20261119101030207',233,8,'shonu','2026-11-19 18:56:01'),(56,'20261119101030208',614,11,'shonu','2026-11-19 19:00:34'),(57,'20261119101030209',366,15,'shonu','2026-11-19 19:05:08'),(58,'20261119101030210',516,12,'shonu','2026-11-19 19:05:54'),(59,'20261119101030211',345,12,'shonu','2026-11-19 19:10:29'),(60,'20261119101030212',116,8,'shonu','2026-11-19 19:15:03'),(61,'20261119101030213',211,4,'shonu','2026-11-19 19:15:49'),(62,'20261119101030214',156,12,'shonu','2026-11-19 19:25:35'),(63,'20261119101030215',545,14,'shonu','2026-11-19 19:30:13'),(64,'20261119101030216',414,9,'shonu','2026-11-19 19:30:41'),(65,'20261119101030217',453,12,'shonu','2026-11-19 19:35:15'),(66,'20261119101030218',566,17,'shonu','2026-11-19 19:35:46'),(67,'20261119101030219',653,14,'shonu','2026-11-19 19:36:10'),(68,'20261119101030220',355,13,'shonu','2026-11-19 19:40:21'),(69,'20261119101030221',356,14,'shonu','2026-11-19 19:40:48'),(70,'20261119101030222',132,6,'shonu','2026-11-19 19:45:31'),(71,'20261119101030223',641,11,'shonu','2026-11-19 19:46:01'),(72,'20261119101030224',565,16,'shonu','2026-11-19 19:50:35'),(73,'20261119101030225',213,6,'shonu','2026-11-19 19:51:03'),(74,'20261119101030226',656,17,'shonu','2026-11-19 19:55:14'),(75,'20261119101030227',351,9,'shonu','2026-11-19 19:55:42'),(76,'20261119101030228',653,14,'shonu','2026-11-19 19:56:10'),(77,'20261119101030229',325,10,'shonu','2026-11-19 20:00:22'),(78,'20261119101030230',364,13,'shonu','2026-11-19 20:00:52'),(79,'20261119101030231',544,13,'shonu','2026-11-19 20:05:16'),(80,'20261119101030232',345,12,'shonu','2026-11-19 20:05:44'),(81,'20261119101030233',441,9,'shonu','2026-11-19 20:10:21'),(82,'20261119101030234',224,8,'shonu','2026-11-19 20:10:49'),(83,'20261119101030235',246,12,'shonu','2026-11-19 20:16:00'),(84,'20261119101030236',412,7,'shonu','2026-11-19 20:20:09'),(85,'20261119101030237',353,11,'shonu','2026-11-19 20:21:04'),(86,'20261119101030238',135,9,'shonu','2026-11-19 20:26:09'),(87,'20261119101030239',452,11,'shonu','2026-11-19 20:32:50');
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
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=latin1 COMMENT='TRX WinGo 10-min: period/round registry';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trx_wingo_periods_10min`
--

LOCK TABLES `trx_wingo_periods_10min` WRITE;
/*!40000 ALTER TABLE `trx_wingo_periods_10min` DISABLE KEYS */;
INSERT INTO `trx_wingo_periods_10min` VALUES (1,'20261119103040077','2026-11-19 18:10:11'),(2,'20261119103040078','2026-11-19 18:10:57'),(3,'20261119103040079','2026-11-19 18:20:07'),(4,'20261119103040080','2026-11-19 18:20:54'),(5,'20261119103040081','2026-11-19 18:30:03'),(6,'20261119103040082','2026-11-19 18:30:49'),(7,'20261119103040083','2026-11-19 18:40:44'),(8,'20261119103040084','2026-11-19 18:50:39'),(9,'20261119103040085','2026-11-19 19:00:35'),(10,'20261119103040086','2026-11-19 19:10:29'),(11,'20261119103040087','2026-11-19 19:30:14'),(12,'20261119103040088','2026-11-19 19:30:41'),(13,'20261119103040089','2026-11-19 19:40:22'),(14,'20261119103040090','2026-11-19 19:40:48'),(15,'20261119103040091','2026-11-19 19:50:36'),(16,'20261119103040092','2026-11-19 19:51:04'),(17,'20261119103040093','2026-11-19 20:00:23'),(18,'20261119103040094','2026-11-19 20:00:52'),(19,'20261119103040095','2026-11-19 20:10:21'),(20,'20261119103040096','2026-11-19 20:10:49'),(21,'20261119103040097','2026-11-19 20:20:09'),(22,'20261119103040098','2026-11-19 20:21:05'),(23,'20261119103040099','2026-11-19 20:32:50');
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
) ENGINE=MyISAM AUTO_INCREMENT=259 DEFAULT CHARSET=latin1 COMMENT='TRX WinGo 1-min: period/round registry';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trx_wingo_periods_1min`
--

LOCK TABLES `trx_wingo_periods_1min` WRITE;
/*!40000 ALTER TABLE `trx_wingo_periods_1min` DISABLE KEYS */;
INSERT INTO `trx_wingo_periods_1min` VALUES (1,'20261119103010735','2026-11-19 17:44:14'),(2,'20261119103010736','2026-11-19 17:44:59'),(3,'20261119103010737','2026-11-19 17:45:45'),(4,'20261119103010738','2026-11-19 17:46:31'),(5,'20261119103010739','2026-11-19 17:47:17'),(6,'20261119103010740','2026-11-19 17:48:03'),(7,'20261119103010741','2026-11-19 17:48:49'),(8,'20261119103010742','2026-11-19 17:49:35'),(9,'20261119103010743','2026-11-19 17:50:20'),(10,'20261119103010744','2026-11-19 17:51:07'),(11,'20261119103010745','2026-11-19 17:51:53'),(12,'20261119103010746','2026-11-19 17:52:39'),(13,'20261119103010747','2026-11-19 17:53:24'),(14,'20261119103010748','2026-11-19 17:54:10'),(15,'20261119103010749','2026-11-19 17:54:56'),(16,'20261119103010750','2026-11-19 17:55:42'),(17,'20261119103010751','2026-11-19 17:56:28'),(18,'20261119103010752','2026-11-19 17:57:13'),(19,'20261119103010753','2026-11-19 17:57:59'),(20,'20261119103010754','2026-11-19 17:58:45'),(21,'20261119103010755','2026-11-19 17:59:31'),(22,'20261119103010756','2026-11-19 18:00:16'),(23,'20261119103010757','2026-11-19 18:01:02'),(24,'20261119103010758','2026-11-19 18:01:47'),(25,'20261119103010759','2026-11-19 18:02:33'),(26,'20261119103010760','2026-11-19 18:03:19'),(27,'20261119103010761','2026-11-19 18:04:05'),(28,'20261119103010762','2026-11-19 18:04:50'),(29,'20261119103010763','2026-11-19 18:05:36'),(30,'20261119103010764','2026-11-19 18:06:22'),(31,'20261119103010765','2026-11-19 18:07:08'),(32,'20261119103010766','2026-11-19 18:07:53'),(33,'20261119103010767','2026-11-19 18:08:39'),(34,'20261119103010768','2026-11-19 18:09:25'),(35,'20261119103010769','2026-11-19 18:10:11'),(36,'20261119103010770','2026-11-19 18:10:57'),(37,'20261119103010771','2026-11-19 18:11:43'),(38,'20261119103010772','2026-11-19 18:12:29'),(39,'20261119103010773','2026-11-19 18:13:15'),(40,'20261119103010774','2026-11-19 18:14:00'),(41,'20261119103010775','2026-11-19 18:14:46'),(42,'20261119103010776','2026-11-19 18:15:32'),(43,'20261119103010777','2026-11-19 18:16:18'),(44,'20261119103010778','2026-11-19 18:17:04'),(45,'20261119103010779','2026-11-19 18:17:50'),(46,'20261119103010780','2026-11-19 18:18:35'),(47,'20261119103010781','2026-11-19 18:19:21'),(48,'20261119103010782','2026-11-19 18:20:07'),(49,'20261119103010783','2026-11-19 18:20:53'),(50,'20261119103010784','2026-11-19 18:21:39'),(51,'20261119103010785','2026-11-19 18:22:25'),(52,'20261119103010786','2026-11-19 18:23:11'),(53,'20261119103010787','2026-11-19 18:23:56'),(54,'20261119103010788','2026-11-19 18:24:42'),(55,'20261119103010789','2026-11-19 18:25:28'),(56,'20261119103010790','2026-11-19 18:26:14'),(57,'20261119103010791','2026-11-19 18:27:00'),(58,'20261119103010792','2026-11-19 18:27:45'),(59,'20261119103010793','2026-11-19 18:28:31'),(60,'20261119103010794','2026-11-19 18:29:17'),(61,'20261119103010795','2026-11-19 18:30:03'),(62,'20261119103010796','2026-11-19 18:30:48'),(63,'20261119103010797','2026-11-19 18:31:34'),(64,'20261119103010798','2026-11-19 18:32:19'),(65,'20261119103010799','2026-11-19 18:33:05'),(66,'20261119103010800','2026-11-19 18:33:51'),(67,'20261119103010801','2026-11-19 18:34:37'),(68,'20261119103010802','2026-11-19 18:35:22'),(69,'20261119103010803','2026-11-19 18:36:08'),(70,'20261119103010804','2026-11-19 18:36:54'),(71,'20261119103010805','2026-11-19 18:37:40'),(72,'20261119103010806','2026-11-19 18:38:26'),(73,'20261119103010807','2026-11-19 18:39:11'),(74,'20261119103010808','2026-11-19 18:39:57'),(75,'20261119103010809','2026-11-19 18:40:43'),(76,'20261119103010810','2026-11-19 18:41:30'),(77,'20261119103010811','2026-11-19 18:42:15'),(78,'20261119103010812','2026-11-19 18:43:01'),(79,'20261119103010813','2026-11-19 18:43:47'),(80,'20261119103010814','2026-11-19 18:44:32'),(81,'20261119103010815','2026-11-19 18:45:18'),(82,'20261119103010816','2026-11-19 18:46:04'),(83,'20261119103010817','2026-11-19 18:46:50'),(84,'20261119103010818','2026-11-19 18:47:36'),(85,'20261119103010819','2026-11-19 18:48:21'),(86,'20261119103010820','2026-11-19 18:49:07'),(87,'20261119103010821','2026-11-19 18:49:53'),(88,'20261119103010822','2026-11-19 18:50:39'),(89,'20261119103010823','2026-11-19 18:51:25'),(90,'20261119103010824','2026-11-19 18:52:11'),(91,'20261119103010825','2026-11-19 18:52:56'),(92,'20261119103010826','2026-11-19 18:53:42'),(93,'20261119103010827','2026-11-19 18:54:28'),(94,'20261119103010828','2026-11-19 18:55:14'),(95,'20261119103010829','2026-11-19 18:56:01'),(96,'20261119103010830','2026-11-19 18:56:45'),(97,'20261119103010831','2026-11-19 18:57:31'),(98,'20261119103010832','2026-11-19 18:58:17'),(99,'20261119103010833','2026-11-19 18:59:03'),(100,'20261119103010834','2026-11-19 18:59:48'),(101,'20261119103010835','2026-11-19 19:00:34'),(102,'20261119103010836','2026-11-19 19:01:19'),(103,'20261119103010837','2026-11-19 19:02:05'),(104,'20261119103010838','2026-11-19 19:02:51'),(105,'20261119103010839','2026-11-19 19:03:36'),(106,'20261119103010840','2026-11-19 19:04:22'),(107,'20261119103010841','2026-11-19 19:05:08'),(108,'20261119103010842','2026-11-19 19:05:54'),(109,'20261119103010843','2026-11-19 19:06:40'),(110,'20261119103010844','2026-11-19 19:07:26'),(111,'20261119103010845','2026-11-19 19:08:11'),(112,'20261119103010846','2026-11-19 19:08:57'),(113,'20261119103010847','2026-11-19 19:09:43'),(114,'20261119103010848','2026-11-19 19:10:29'),(115,'20261119103010849','2026-11-19 19:11:15'),(116,'20261119103010850','2026-11-19 19:12:00'),(117,'20261119103010851','2026-11-19 19:12:46'),(118,'20261119103010852','2026-11-19 19:13:32'),(119,'20261119103010853','2026-11-19 19:14:17'),(120,'20261119103010854','2026-11-19 19:15:03'),(121,'20261119103010855','2026-11-19 19:15:49'),(122,'20261119103010856','2026-11-19 19:16:35'),(123,'20261119103010857','2026-11-19 19:17:21'),(124,'20261119103010858','2026-11-19 19:17:52'),(125,'20261119103010859','2026-11-19 19:18:22'),(126,'20261119103010860','2026-11-19 19:18:55'),(127,'20261119103010861','2026-11-19 19:22:58'),(128,'20261119103010862','2026-11-19 19:25:35'),(129,'20261119103010863','2026-11-19 19:26:03'),(130,'20261119103010864','2026-11-19 19:26:31'),(131,'20261119103010865','2026-11-19 19:26:59'),(132,'20261119103010866','2026-11-19 19:27:26'),(133,'20261119103010867','2026-11-19 19:27:54'),(134,'20261119103010868','2026-11-19 19:28:22'),(135,'20261119103010869','2026-11-19 19:28:50'),(136,'20261119103010870','2026-11-19 19:29:17'),(137,'20261119103010871','2026-11-19 19:29:45'),(138,'20261119103010872','2026-11-19 19:30:13'),(139,'20261119103010873','2026-11-19 19:30:40'),(140,'20261119103010874','2026-11-19 19:31:26'),(141,'20261119103010875','2026-11-19 19:31:52'),(142,'20261119103010876','2026-11-19 19:32:18'),(143,'20261119103010877','2026-11-19 19:32:45'),(144,'20261119103010878','2026-11-19 19:33:13'),(145,'20261119103010879','2026-11-19 19:33:41'),(146,'20261119103010880','2026-11-19 19:34:09'),(147,'20261119103010881','2026-11-19 19:34:36'),(148,'20261119103010882','2026-11-19 19:35:09'),(149,'20261119103010883','2026-11-19 19:35:36'),(150,'20261119103010884','2026-11-19 19:36:04'),(151,'20261119103010885','2026-11-19 19:36:32'),(152,'20261119103010886','2026-11-19 19:36:59'),(153,'20261119103010887','2026-11-19 19:37:27'),(154,'20261119103010888','2026-11-19 19:37:55'),(155,'20261119103010889','2026-11-19 19:38:23'),(156,'20261119103010890','2026-11-19 19:38:51'),(157,'20261119103010891','2026-11-19 19:39:19'),(158,'20261119103010892','2026-11-19 19:39:46'),(159,'20261119103010893','2026-11-19 19:40:13'),(160,'20261119103010894','2026-11-19 19:40:41'),(161,'20261119103010895','2026-11-19 19:41:09'),(162,'20261119103010896','2026-11-19 19:41:37'),(163,'20261119103010897','2026-11-19 19:42:04'),(164,'20261119103010898','2026-11-19 19:42:33'),(165,'20261119103010899','2026-11-19 19:43:01'),(166,'20261119103010900','2026-11-19 19:43:30'),(167,'20261119103010901','2026-11-19 19:43:57'),(168,'20261119103010902','2026-11-19 19:44:25'),(169,'20261119103010903','2026-11-19 19:44:53'),(170,'20261119103010904','2026-11-19 19:45:21'),(171,'20261119103010905','2026-11-19 19:45:49'),(172,'20261119103010906','2026-11-19 19:46:18'),(173,'20261119103010907','2026-11-19 19:46:46'),(174,'20261119103010908','2026-11-19 19:47:13'),(175,'20261119103010909','2026-11-19 19:47:41'),(176,'20261119103010910','2026-11-19 19:48:09'),(177,'20261119103010911','2026-11-19 19:48:38'),(178,'20261119103010912','2026-11-19 19:49:05'),(179,'20261119103010913','2026-11-19 19:49:32'),(180,'20261119103010914','2026-11-19 19:50:00'),(181,'20261119103010915','2026-11-19 19:50:28'),(182,'20261119103010916','2026-11-19 19:50:57'),(183,'20261119103010917','2026-11-19 19:51:25'),(184,'20261119103010918','2026-11-19 19:51:52'),(185,'20261119103010919','2026-11-19 19:52:20'),(186,'20261119103010920','2026-11-19 19:52:47'),(187,'20261119103010921','2026-11-19 19:53:15'),(188,'20261119103010922','2026-11-19 19:53:43'),(189,'20261119103010923','2026-11-19 19:54:11'),(190,'20261119103010924','2026-11-19 19:54:39'),(191,'20261119103010925','2026-11-19 19:55:07'),(192,'20261119103010926','2026-11-19 19:55:34'),(193,'20261119103010927','2026-11-19 19:56:03'),(194,'20261119103010928','2026-11-19 19:56:31'),(195,'20261119103010929','2026-11-19 19:56:59'),(196,'20261119103010930','2026-11-19 19:57:26'),(197,'20261119103010931','2026-11-19 19:57:53'),(198,'20261119103010932','2026-11-19 19:58:21'),(199,'20261119103010933','2026-11-19 19:58:49'),(200,'20261119103010934','2026-11-19 19:59:17'),(201,'20261119103010935','2026-11-19 19:59:44'),(202,'20261119103010936','2026-11-19 20:00:12'),(203,'20261119103010937','2026-11-19 20:00:40'),(204,'20261119103010938','2026-11-19 20:01:09'),(205,'20261119103010939','2026-11-19 20:01:37'),(206,'20261119103010940','2026-11-19 20:02:04'),(207,'20261119103010941','2026-11-19 20:02:33'),(208,'20261119103010942','2026-11-19 20:03:01'),(209,'20261119103010943','2026-11-19 20:03:28'),(210,'20261119103010944','2026-11-19 20:03:56'),(211,'20261119103010945','2026-11-19 20:04:20'),(212,'20261119103010946','2026-11-19 20:04:48'),(213,'20261119103010947','2026-11-19 20:05:16'),(214,'20261119103010948','2026-11-19 20:05:44'),(215,'20261119103010949','2026-11-19 20:06:12'),(216,'20261119103010950','2026-11-19 20:06:39'),(217,'20261119103010951','2026-11-19 20:07:07'),(218,'20261119103010952','2026-11-19 20:07:53'),(219,'20261119103010953','2026-11-19 20:08:21'),(220,'20261119103010954','2026-11-19 20:09:07'),(221,'20261119103010955','2026-11-19 20:09:41'),(222,'20261119103010956','2026-11-19 20:09:53'),(223,'20261119103010957','2026-11-19 20:10:21'),(224,'20261119103010958','2026-11-19 20:10:49'),(225,'20261119103010959','2026-11-19 20:11:17'),(226,'20261119103010960','2026-11-19 20:11:45'),(227,'20261119103010961','2026-11-19 20:12:12'),(228,'20261119103010962','2026-11-19 20:12:40'),(229,'20261119103010963','2026-11-19 20:13:08'),(230,'20261119103010964','2026-11-19 20:13:36'),(231,'20261119103010965','2026-11-19 20:14:04'),(232,'20261119103010966','2026-11-19 20:14:31'),(233,'20261119103010967','2026-11-19 20:14:59'),(234,'20261119103010968','2026-11-19 20:15:27'),(235,'20261119103010969','2026-11-19 20:16:13'),(236,'20261119103010970','2026-11-19 20:16:59'),(237,'20261119103010971','2026-11-19 20:17:45'),(238,'20261119103010972','2026-11-19 20:18:31'),(239,'20261119103010973','2026-11-19 20:19:17'),(240,'20261119103010974','2026-11-19 20:20:03'),(241,'20261119103010975','2026-11-19 20:20:31'),(242,'20261119103010976','2026-11-19 20:21:17'),(243,'20261119103010977','2026-11-19 20:22:03'),(244,'20261119103010978','2026-11-19 20:22:49'),(245,'20261119103010979','2026-11-19 20:23:35'),(246,'20261119103010980','2026-11-19 20:24:21'),(247,'20261119103010981','2026-11-19 20:24:49'),(248,'20261119103010982','2026-11-19 20:25:35'),(249,'20261119103010983','2026-11-19 20:26:22'),(250,'20261119103010984','2026-11-19 20:27:23'),(251,'20261119103010985','2026-11-19 20:28:42'),(252,'20261119103010986','2026-11-19 20:29:51'),(253,'20261119103010987','2026-11-19 20:31:10'),(254,'20261119103010988','2026-11-19 20:33:36'),(255,'20261119103010989','2026-11-19 20:35:30'),(256,'20261119103010990','2026-11-19 20:36:49'),(257,'20261119103010991','2026-11-19 20:38:25'),(258,'20261119103010992','2026-11-19 20:39:37');
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
) ENGINE=MyISAM AUTO_INCREMENT=85 DEFAULT CHARSET=latin1 COMMENT='TRX WinGo 3-min: period/round registry';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trx_wingo_periods_3min`
--

LOCK TABLES `trx_wingo_periods_3min` WRITE;
/*!40000 ALTER TABLE `trx_wingo_periods_3min` DISABLE KEYS */;
INSERT INTO `trx_wingo_periods_3min` VALUES (1,'20261119103020247','2026-11-19 17:48:03'),(2,'20261119103020248','2026-11-19 17:48:49'),(3,'20261119103020249','2026-11-19 17:51:07'),(4,'20261119103020250','2026-11-19 17:51:53'),(5,'20261119103020251','2026-11-19 17:54:10'),(6,'20261119103020252','2026-11-19 17:54:56'),(7,'20261119103020253','2026-11-19 17:57:13'),(8,'20261119103020254','2026-11-19 17:57:59'),(9,'20261119103020255','2026-11-19 18:00:17'),(10,'20261119103020256','2026-11-19 18:03:19'),(11,'20261119103020257','2026-11-19 18:06:22'),(12,'20261119103020258','2026-11-19 18:09:25'),(13,'20261119103020259','2026-11-19 18:12:29'),(14,'20261119103020260','2026-11-19 18:15:32'),(15,'20261119103020261','2026-11-19 18:18:35'),(16,'20261119103020262','2026-11-19 18:21:39'),(17,'20261119103020263','2026-11-19 18:24:42'),(18,'20261119103020264','2026-11-19 18:27:46'),(19,'20261119103020265','2026-11-19 18:30:03'),(20,'20261119103020266','2026-11-19 18:30:48'),(21,'20261119103020267','2026-11-19 18:33:05'),(22,'20261119103020268','2026-11-19 18:33:51'),(23,'20261119103020269','2026-11-19 18:36:09'),(24,'20261119103020270','2026-11-19 18:36:55'),(25,'20261119103020271','2026-11-19 18:39:12'),(26,'20261119103020272','2026-11-19 18:39:58'),(27,'20261119103020273','2026-11-19 18:42:15'),(28,'20261119103020274','2026-11-19 18:45:18'),(29,'20261119103020275','2026-11-19 18:48:22'),(30,'20261119103020276','2026-11-19 18:51:25'),(31,'20261119103020277','2026-11-19 18:54:28'),(32,'20261119103020278','2026-11-19 18:57:31'),(33,'20261119103020279','2026-11-19 19:00:34'),(34,'20261119103020280','2026-11-19 19:03:37'),(35,'20261119103020281','2026-11-19 19:06:40'),(36,'20261119103020282','2026-11-19 19:09:43'),(37,'20261119103020283','2026-11-19 19:12:01'),(38,'20261119103020284','2026-11-19 19:12:46'),(39,'20261119103020285','2026-11-19 19:15:03'),(40,'20261119103020286','2026-11-19 19:15:49'),(41,'20261119103020287','2026-11-19 19:18:23'),(42,'20261119103020288','2026-11-19 19:18:55'),(43,'20261119103020289','2026-11-19 19:27:27'),(44,'20261119103020290','2026-11-19 19:27:55'),(45,'20261119103020291','2026-11-19 19:30:13'),(46,'20261119103020292','2026-11-19 19:30:41'),(47,'20261119103020293','2026-11-19 19:33:13'),(48,'20261119103020294','2026-11-19 19:33:41'),(49,'20261119103020295','2026-11-19 19:36:43'),(50,'20261119103020296','2026-11-19 19:37:08'),(51,'20261119103020297','2026-11-19 19:39:25'),(52,'20261119103020298','2026-11-19 19:39:52'),(53,'20261119103020299','2026-11-19 19:42:11'),(54,'20261119103020300','2026-11-19 19:42:40'),(55,'20261119103020301','2026-11-19 19:43:09'),(56,'20261119103020302','2026-11-19 19:45:27'),(57,'20261119103020303','2026-11-19 19:45:57'),(58,'20261119103020304','2026-11-19 19:48:17'),(59,'20261119103020305','2026-11-19 19:48:45'),(60,'20261119103020306','2026-11-19 19:51:33'),(61,'20261119103020307','2026-11-19 19:51:59'),(62,'20261119103020308','2026-11-19 19:54:20'),(63,'20261119103020309','2026-11-19 19:54:47'),(64,'20261119103020310','2026-11-19 19:57:33'),(65,'20261119103020311','2026-11-19 19:58:01'),(66,'20261119103020312','2026-11-19 20:00:19'),(67,'20261119103020313','2026-11-19 20:00:48'),(68,'20261119103020314','2026-11-19 20:03:35'),(69,'20261119103020315','2026-11-19 20:04:04'),(70,'20261119103020316','2026-11-19 20:06:12'),(71,'20261119103020317','2026-11-19 20:06:40'),(72,'20261119103020318','2026-11-19 20:09:40'),(73,'20261119103020319','2026-11-19 20:09:41'),(74,'20261119103020320','2026-11-19 20:09:53'),(75,'20261119103020321','2026-11-19 20:12:13'),(76,'20261119103020322','2026-11-19 20:12:41'),(77,'20261119103020323','2026-11-19 20:16:00'),(78,'20261119103020324','2026-11-19 20:19:04'),(79,'20261119103020325','2026-11-19 20:21:51'),(80,'20261119103020326','2026-11-19 20:24:37'),(81,'20261119103020327','2026-11-19 20:25:23'),(82,'20261119103020328','2026-11-19 20:32:16'),(83,'20261119103020329','2026-11-19 20:34:44'),(84,'20261119103020330','2026-11-19 20:37:38');
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
) ENGINE=MyISAM AUTO_INCREMENT=47 DEFAULT CHARSET=latin1 COMMENT='TRX WinGo 5-min: period/round registry';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trx_wingo_periods_5min`
--

LOCK TABLES `trx_wingo_periods_5min` WRITE;
/*!40000 ALTER TABLE `trx_wingo_periods_5min` DISABLE KEYS */;
INSERT INTO `trx_wingo_periods_5min` VALUES (1,'20261119103030153','2026-11-19 18:10:11'),(2,'20261119103030154','2026-11-19 18:10:57'),(3,'20261119103030155','2026-11-19 18:15:32'),(4,'20261119103030156','2026-11-19 18:20:07'),(5,'20261119103030157','2026-11-19 18:20:53'),(6,'20261119103030158','2026-11-19 18:25:28'),(7,'20261119103030159','2026-11-19 18:30:03'),(8,'20261119103030160','2026-11-19 18:30:49'),(9,'20261119103030161','2026-11-19 18:35:23'),(10,'20261119103030162','2026-11-19 18:40:44'),(11,'20261119103030163','2026-11-19 18:45:19'),(12,'20261119103030164','2026-11-19 18:50:39'),(13,'20261119103030165','2026-11-19 18:55:14'),(14,'20261119103030166','2026-11-19 18:56:02'),(15,'20261119103030167','2026-11-19 19:00:35'),(16,'20261119103030168','2026-11-19 19:05:08'),(17,'20261119103030169','2026-11-19 19:05:54'),(18,'20261119103030170','2026-11-19 19:10:29'),(19,'20261119103030171','2026-11-19 19:15:04'),(20,'20261119103030172','2026-11-19 19:15:50'),(21,'20261119103030173','2026-11-19 19:25:35'),(22,'20261119103030174','2026-11-19 19:30:13'),(23,'20261119103030175','2026-11-19 19:30:41'),(24,'20261119103030176','2026-11-19 19:35:16'),(25,'20261119103030177','2026-11-19 19:35:46'),(26,'20261119103030178','2026-11-19 19:36:10'),(27,'20261119103030179','2026-11-19 19:40:21'),(28,'20261119103030180','2026-11-19 19:40:48'),(29,'20261119103030181','2026-11-19 19:45:31'),(30,'20261119103030182','2026-11-19 19:46:01'),(31,'20261119103030183','2026-11-19 19:50:36'),(32,'20261119103030184','2026-11-19 19:51:04'),(33,'20261119103030185','2026-11-19 19:55:14'),(34,'20261119103030186','2026-11-19 19:55:42'),(35,'20261119103030187','2026-11-19 19:56:10'),(36,'20261119103030188','2026-11-19 20:00:22'),(37,'20261119103030189','2026-11-19 20:00:52'),(38,'20261119103030190','2026-11-19 20:05:16'),(39,'20261119103030191','2026-11-19 20:05:44'),(40,'20261119103030192','2026-11-19 20:10:21'),(41,'20261119103030193','2026-11-19 20:10:49'),(42,'20261119103030194','2026-11-19 20:16:01'),(43,'20261119103030195','2026-11-19 20:20:09'),(44,'20261119103030196','2026-11-19 20:21:04'),(45,'20261119103030197','2026-11-19 20:26:09'),(46,'20261119103030198','2026-11-19 20:32:50');
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
) ENGINE=MyISAM AUTO_INCREMENT=41 DEFAULT CHARSET=latin1 COMMENT='TRX WinGo 10-min: published results';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trx_wingo_results_10min`
--

LOCK TABLES `trx_wingo_results_10min` WRITE;
/*!40000 ALTER TABLE `trx_wingo_results_10min` DISABLE KEYS */;
INSERT INTO `trx_wingo_results_10min` VALUES (1,'20261119103040045',0,0,'red,violet','0','00000000040b4803aa3329f9f4eb4e784e5eb8c736e9c3c8645ad05899ab040e','uncensored','2026-11-19 13:00:01'),(2,'20261119103040046',7,7,'green','0','00000000040b48035fb4d292134b3364cc148ff9db4f586a6e177e9caca5bd7f','uncensored','2026-11-19 13:10:01'),(3,'20261119103040047',2,2,'red','0','00000000040b48035cce62ff74167e318a4f1356213e6d22ad5fdf28c49ba22b','uncensored','2026-11-19 13:20:01'),(4,'20261119103040048',7,7,'green','0','00000000040b480339997e0422c5d003991fc579e254df345d52b558c7a61e67','uncensored','2026-11-19 13:30:01'),(5,'20261119103040049',0,0,'red,violet','0','00000000040b4803d8661fa191b7729d979972ce685af096877931f4b78c0cbf','uncensored','2026-11-19 13:40:01'),(6,'20261119103040050',3,3,'green','0','00000000040b4803f5c385556e55547eae3e0f226c2f7ee24b3543f211035963','uncensored','2026-11-19 13:50:01'),(7,'20261119103040051',9,9,'green','0','00000000040b4803a7032299311bf2a7e01d0d20e6c361ceea1311504e210d69','uncensored','2026-11-19 14:00:02'),(8,'20261119103040052',2,2,'red','0','00000000040b4803f93435021baa2c17a14b747e81ee30047e2a5427692052ca','uncensored','2026-11-19 14:10:01'),(9,'20261119103040053',9,9,'green','0','00000000040b480352bf36326fd4d815ce1a8b6ee6c0a741cba946627fee779e','uncensored','2026-11-19 14:20:01'),(10,'20261119103040054',0,0,'red,violet','0','00000000040b480372134677cff664dbea5a7b2785087f81b8d1a4a8b93140bc','uncensored','2026-11-19 14:40:01'),(11,'20261119103040056',7,7,'green','0','00000000040b4803b6db31d9f307e08ef96e6035f80b27ddaeab81d4f8bdcc57','uncensored','2026-11-19 14:50:01'),(12,'20261119103040057',5,5,'green,violet','0','00000000040b4803456488942a4f98e2cd482a4553f78c3e5ac66bf8b7151765','uncensored','2026-11-19 15:00:01'),(13,'20261119103040058',0,0,'red,violet','0','00000000040b4803dfffd3d1a4a6085e35f38106c4966b5b0089c3db0d06d80d','uncensored','2026-11-19 15:10:01'),(14,'20261119103040059',8,8,'red','0','00000000040b4803524cdc92554155409778837a697ccefd19344cafbaa5e9c8','uncensored','2026-11-19 15:20:01'),(15,'20261119103040060',2,2,'red','0','00000000040b4803c80e91fcaf906ed1d6961583647157ee80715282a1a26802','uncensored','2026-11-19 15:30:02'),(16,'20261119103040061',1,1,'green','0','00000000040b4803d7f0bae0126debf7159f2c97d1c7a6a00d777ae45020afd1','uncensored','2026-11-19 17:50:21'),(17,'20261119103040075',6,6,'red','0','00000000040b480358896ac977bc3612cdc159e523af8d2ac50ea0b5982cab76','uncensored','2026-11-19 18:00:17'),(18,'20261119103040076',9,9,'green','0','00000000040b48034deee7a00e28b8b6dd713817a970a416c34085cb9584479e','uncensored','2026-11-19 18:10:11'),(19,'20261119103040077',2,2,'red','0','00000000040b4803baba9800be3379a3eadad0f8d90858aa8110faaaf8f3842a','uncensored','2026-11-19 18:10:57'),(20,'20261119103040078',2,2,'red','0','00000000040b4803c0b5c57d62e3d4b5af5d2485a4a0d3fde72f716538ca32d2','uncensored','2026-11-19 18:20:07'),(21,'20261119103040079',4,4,'red','0','00000000040b4803ea074b2a0d44e54dd5d298153cb3129c83c1083c102d6a74','uncensored','2026-11-19 18:20:54'),(22,'20261119103040080',7,7,'green','0','00000000040b48039d7d517b80e5b092ebedc4e81049560b7033305439088c7e','uncensored','2026-11-19 18:30:03'),(23,'20261119103040081',5,5,'green,violet','0','00000000040b4803182ae34a0df85a49f3260d367b7c76178865ba871ea9b6f5','uncensored','2026-11-19 18:30:49'),(24,'20261119103040082',8,8,'red','0','00000000040b48037504a8c46843ff80192756e33ac52a0d38004bc8735898be','uncensored','2026-11-19 18:40:44'),(25,'20261119103040083',7,7,'green','0','00000000040b4803ecd33527f9235c53d9b02abeaee0bcdce9c3698ad67c0997','uncensored','2026-11-19 18:50:39'),(26,'20261119103040084',6,6,'red','0','00000000040b4803bbe609b4dd7ec99134a759360842f3d0c8b5bdc30cb98506','uncensored','2026-11-19 19:00:35'),(27,'20261119103040085',8,8,'red','0','00000000040b4803972b16bce1be84d946e244edf021003418ab66188cd18808','uncensored','2026-11-19 19:10:29'),(28,'20261119103040086',4,4,'red','0','00000000040b480316ad0d87d051170a4e4a600eff6b64c18e8f338168348f74','uncensored','2026-11-19 19:30:14'),(29,'20261119103040087',7,7,'green','0','00000000040b48035e44050d199f7821bd8f738a7cab642139611a4a377d97d7','uncensored','2026-11-19 19:30:41'),(30,'20261119103040088',6,6,'red','0','00000000040b4803d6d516e091bbbf5d4be3d7b17f983fc2f0a09acee006686d','uncensored','2026-11-19 19:40:22'),(31,'20261119103040089',5,5,'green,violet','0','00000000040b4803caa56fa79442411fba92f02fe39b463270cce5870c65a05c','uncensored','2026-11-19 19:40:48'),(32,'20261119103040090',7,7,'green','0','00000000040b4803db771996b09c95f4d955a295a34fa090ee0c44b5b6edeb07','uncensored','2026-11-19 19:50:36'),(33,'20261119103040091',6,6,'red','0','00000000040b4803a41db46c1c99a2f8930ff28de2512784c3a8a836e32bf596','uncensored','2026-11-19 19:51:04'),(34,'20261119103040092',8,8,'red','0','00000000040b48039fc0409cd4051d7ed9d67247a6b530899b0898603ed01918','uncensored','2026-11-19 20:00:23'),(35,'20261119103040093',5,5,'green,violet','0','00000000040b480395bfef21275887d7be9e64f4db68fad0f20dabf13e757665','uncensored','2026-11-19 20:00:52'),(36,'20261119103040094',2,2,'red','0','00000000040b480362a3bfb676affbdbe6e2ff2c269de9ca0dd0c8a8225b92e2','uncensored','2026-11-19 20:10:21'),(37,'20261119103040095',5,5,'green,violet','0','00000000040b48033f458f0d9f15da9337bf9a53c4de32b44fce7ea9154bf25e','uncensored','2026-11-19 20:10:49'),(38,'20261119103040096',7,7,'green','0','00000000040b480343069fea8bfad283e0749285fe63c4df21142b1d7233f917','uncensored','2026-11-19 20:20:09'),(39,'20261119103040097',8,8,'red','0','00000000040b4803bf54f9453f3530cbce9dacddaad4d5ae280b50ad56671228','uncensored','2026-11-19 20:21:05'),(40,'20261119103040098',1,1,'green','88142165','000000000540f15548ec1ff38a4e33cbd99202ecab25a89395033d63acd6be1b','uncensored','2026-11-19 20:32:48');
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
) ENGINE=MyISAM AUTO_INCREMENT=455 DEFAULT CHARSET=latin1 COMMENT='TRX WinGo 1-min: published results (number+color+TRON block hash)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trx_wingo_results_1min`
--

LOCK TABLES `trx_wingo_results_1min` WRITE;
/*!40000 ALTER TABLE `trx_wingo_results_1min` DISABLE KEYS */;
INSERT INTO `trx_wingo_results_1min` VALUES (11,'20261119103010422',7,7,'green','0','00000000040b48036433778fca2058430cf4ff6c4a6bf8e1a08739a25f696647','uncensored','2026-11-19 12:33:09'),(12,'20261119103010424',8,8,'red','0','00000000040b480335a985ee14d10bb9567aefc3032b7dd5538c5aa1477268da','uncensored','2026-11-19 12:34:24'),(13,'20261119103010425',1,1,'green','0','00000000040b480338ae74e2738291e0af143620a106207254e881bcd6ab7841','uncensored','2026-11-19 12:34:55'),(14,'20261119103010426',8,8,'red','0','00000000040b4803dcebeecc2bf078726a27a298a2d51de76a1a11d016c4578a','uncensored','2026-11-19 12:44:01'),(15,'20261119103010435',4,4,'red','0','00000000040b4803066e0af4f6d909d178bdcaa8573eae3d131a05ea0b3c8f54','uncensored','2026-11-19 12:45:00'),(16,'20261119103010436',9,9,'green','0','00000000040b480334c07db23eec325e09261ea75b8845e8c95bd8f187ab8d19','uncensored','2026-11-19 12:46:01'),(17,'20261119103010437',9,9,'green','0','00000000040b4803809643431c43160e390ece2dbaa98892f4ccbb6274909ddc','uncensored','2026-11-19 12:47:00'),(18,'20261119103010438',6,6,'red','0','00000000040b4803206c78a89d2a9386316208669a2c641ba882d370512f6ddf','uncensored','2026-11-19 12:48:01'),(19,'20261119103010439',0,0,'red,violet','0','00000000040b480335f06ee7cb6ef84d82841d884373b976b89a38b1c4bc8000','uncensored','2026-11-19 12:49:00'),(20,'20261119103010440',0,0,'red,violet','88132910','000000000540cd2ec5d248f68e021dff8b02a043875438c16b1128429dd53e0e','uncensored','2026-11-19 12:49:57'),(21,'20261119103010441',7,7,'green','0','00000000040b4803c64148540866166a3fbc84da1bdb35c7412f76000818707f','uncensored','2026-11-19 12:51:01'),(22,'20261119103010442',2,2,'red','0','00000000040b4803de530403c2ef0e588421d257d51037f976a764915544cfa2','uncensored','2026-11-19 12:52:00'),(23,'20261119103010443',8,8,'red','0','00000000040b48030a9befbc4b7a5a28dd2a597b57c03a20c43b5041f1f88b8d','uncensored','2026-11-19 12:53:01'),(24,'20261119103010444',4,4,'red','0','00000000040b48037d5421878d19ee9aef9221b95a334e0631e7a71d0c945e04','uncensored','2026-11-19 12:54:00'),(25,'20261119103010445',0,0,'red,violet','0','00000000040b4803a246c9cb4481bbc77830a701315ca8b47000cbebf41f680a','uncensored','2026-11-19 12:55:00'),(26,'20261119103010446',5,5,'green,violet','0','00000000040b48036b27d435bd678154ceefe818bbe9dce0e424e35c9f2a0c55','uncensored','2026-11-19 12:56:01'),(27,'20261119103010447',1,1,'green','88133050','000000000540cdba94683fb0536d7a207f75c67741cd6b65f80911ffe0284631','uncensored','2026-11-19 12:56:57'),(28,'20261119103010448',2,2,'red','0','00000000040b4803bc47d71b2e00e0c96117ae73ae2b8fba0159b52926e290a2','uncensored','2026-11-19 12:58:01'),(29,'20261119103010449',5,5,'green,violet','0','00000000040b4803b194d600ff4bc79b7ffe631c6555878195da4899306b5c25','uncensored','2026-11-19 12:59:00'),(30,'20261119103010450',0,0,'red,violet','0','00000000040b4803650e9e0c30099fa162b335935e15bd0df2b0a3d2530e4eb0','uncensored','2026-11-19 13:00:00'),(31,'20261119103010451',9,9,'green','0','00000000040b48032932d45b1621d1147928b2cf62d5bfc6520577b558f9cacb','uncensored','2026-11-19 13:01:01'),(32,'20261119103010452',0,0,'red,violet','88133150','000000000540ce1eeb43cce7d2ec67bb4c0fd0bb37658b21ae94546c6c70baca','uncensored','2026-11-19 13:01:57'),(33,'20261119103010453',8,8,'red','0','00000000040b4803c00e9c4a0dd4d7360089596afe3db7852996ec677eb4728d','uncensored','2026-11-19 13:03:00'),(34,'20261119103010454',6,6,'red','0','00000000040b4803b52a9d766a121bed2a286bb5d78d2bafe5f803bcbe41b3d6','uncensored','2026-11-19 13:04:00'),(35,'20261119103010455',6,6,'red','0','00000000040b48037cd4d31faaa58edfbc85685a5f0385158397b0031d2062b6','uncensored','2026-11-19 13:05:00'),(36,'20261119103010456',3,3,'green','0','00000000040b480300f18df5df0050f135399c566de459b965bd62b08598a5b3','uncensored','2026-11-19 13:06:00'),(37,'20261119103010457',8,8,'red','0','00000000040b48034046fe4a233bcd3cf30d142c82df6ba3389854843b3b2c38','uncensored','2026-11-19 13:07:01'),(38,'20261119103010458',0,0,'red,violet','0','00000000040b4803d2fe32508a667e9165415bda2133564a8c552d7c001f9520','uncensored','2026-11-19 13:08:00'),(39,'20261119103010459',6,6,'red','0','00000000040b48035113b678e3487f46a1c8270eab1689875aa4fc8d5f9c96ad','uncensored','2026-11-19 13:09:00'),(40,'20261119103010460',9,9,'green','0','00000000040b48034b3762b14ed60cb3630c423d83b47ab0e365e84136ccde69','uncensored','2026-11-19 13:10:00'),(41,'20261119103010461',2,2,'red','0','00000000040b4803fc1f46afc45cbc8cc367ed2d1ac6ea6f8d409d864346ecb2','uncensored','2026-11-19 13:11:00'),(42,'20261119103010462',1,1,'green','88133350','000000000540cee65a258546f6d51592dfaa20969b89d611c5db9e873d0fae81','uncensored','2026-11-19 13:11:57'),(43,'20261119103010463',9,9,'green','0','00000000040b48039576b5ecc7224a23e96df6f5a024382b70d2862db9dbb589','uncensored','2026-11-19 13:13:01'),(44,'20261119103010464',9,9,'green','0','00000000040b480339e1d592ac77f950362964b0844171ba70d6eca80b54fb29','uncensored','2026-11-19 13:14:00'),(45,'20261119103010465',2,2,'red','0','00000000040b4803cb5dfad9598e9349e3aaaee7c7d6a74e3a9afb05712662ee','uncensored','2026-11-19 13:15:01'),(46,'20261119103010466',5,5,'green,violet','0','00000000040b480326c8898af177d2ea12e4e440a324963e280a5d3b4c6c1be5','uncensored','2026-11-19 13:16:00'),(47,'20261119103010467',4,4,'red','0','00000000040b4803dd6ff50d86ffb46b59d969a1adb6b7503bb3984ebe01d0f4','uncensored','2026-11-19 13:17:00'),(48,'20261119103010468',6,6,'red','0','00000000040b4803b9d5feddb5426611df95453b1099230525577dc60ace6f66','uncensored','2026-11-19 13:18:00'),(49,'20261119103010469',3,3,'green','0','00000000040b48037a98e184944acfc6e08cf6a106ae96206938e23f8b6bde03','uncensored','2026-11-19 13:19:00'),(50,'20261119103010470',9,9,'green','0','00000000040b48033ca4f214af1642c49322aae64ab206f13b1d235e2756c959','uncensored','2026-11-19 13:20:00'),(51,'20261119103010471',7,7,'green','0','00000000040b48031875c89864516c5cf362e5d2dcbc98797d53c7d750d5cf27','uncensored','2026-11-19 13:21:01'),(52,'20261119103010472',7,7,'green','0','00000000040b4803224699143bac0b2f4bc4518f3047b608541aa29e1667cffe','uncensored','2026-11-19 13:22:00'),(53,'20261119103010473',0,0,'red,violet','0','00000000040b4803c993bde4b551865d7ed90be73cb92e0b0404a13809b0b8b0','uncensored','2026-11-19 13:23:01'),(54,'20261119103010474',3,3,'green','88133590','000000000540cfd6ba366df4e2ab162039515d844575760611842f3bb12fa753','uncensored','2026-11-19 13:23:57'),(55,'20261119103010475',7,7,'green','0','00000000040b4803075f3383d3f7b3fc09e15614d7056771b4db3aeca6e67d7e','uncensored','2026-11-19 13:25:01'),(56,'20261119103010476',9,9,'green','0','00000000040b4803a8e79c57b8e11cc3487bedfd2816060e8d63bde659f8489f','uncensored','2026-11-19 13:26:00'),(57,'20261119103010477',3,3,'green','0','00000000040b48038f373aad703f658c17b56e068bde42ff42f26c89a303cd53','uncensored','2026-11-19 13:27:01'),(58,'20261119103010478',9,9,'green','0','00000000040b4803bc3f96cffca284ab7d32ccb536ed5920b23746aab2d6e6b9','uncensored','2026-11-19 13:28:00'),(59,'20261119103010479',7,7,'green','0','00000000040b480351d9a85dff7683a07109fcc1904bbf841543829e70a5547e','uncensored','2026-11-19 13:29:01'),(60,'20261119103010480',9,9,'green','0','00000000040b480360867daffda6e126455e01842cbbfc67946f34eb11628ca9','uncensored','2026-11-19 13:30:00'),(61,'20261119103010481',6,6,'red','0','00000000040b480358ab6229bb63417f5cd1f050fbcfe621767b8c8a5ebf9c36','uncensored','2026-11-19 13:31:01'),(62,'20261119103010482',8,8,'red','88133750','000000000540d076d8269a83cf808014678d251240afe901af09dbe1288b0768','uncensored','2026-11-19 13:31:57'),(63,'20261119103010483',1,1,'green','0','00000000040b48037ca494a7734a99854cc4ae72e3596b835d8694ff86a46401','uncensored','2026-11-19 13:33:00'),(64,'20261119103010484',9,9,'green','88133790','000000000540d09e43ff4f63138a2cfdd4cf4203354505826984d998892ecd9c','uncensored','2026-11-19 13:33:57'),(65,'20261119103010485',1,1,'green','88133810','000000000540d0b299347b391340e8b8644d520f2eadd63f8109f77eba9401dd','uncensored','2026-11-19 13:34:57'),(66,'20261119103010486',0,0,'red,violet','0','00000000040b48036615ce23da1235bcdfb4f25ea7f66b99d692c105631a0da0','uncensored','2026-11-19 13:36:01'),(67,'20261119103010487',5,5,'green,violet','0','00000000040b4803a317e435e244a70454e8133f685860280ea8c8826c0e155c','uncensored','2026-11-19 13:37:00'),(68,'20261119103010488',9,9,'green','0','00000000040b4803dea7f014e01b3625330359860e139d7cbc89dfac1962a0c9','uncensored','2026-11-19 13:38:01'),(69,'20261119103010489',1,1,'green','0','00000000040b48035917dc9cb1e39b56cbf96091dd4895468bc4032110d36871','uncensored','2026-11-19 13:39:00'),(70,'20261119103010490',5,5,'green,violet','0','00000000040b4803960ca5c4078e95fdb5735fb33e3814db181dddfcc958d8f5','uncensored','2026-11-19 13:40:01'),(71,'20261119103010491',8,8,'red','0','00000000040b480398acae22c9235c6a3bb0f35e52c82b48029f1757c42b8aaa','uncensored','2026-11-19 13:41:01'),(72,'20261119103010492',4,4,'red','88133950','000000000540d13e3190f14f98c4fe08a4df7838a1357cf28f4b3ef6f0cf204f','uncensored','2026-11-19 13:41:57'),(73,'20261119103010493',2,2,'red','0','00000000040b4803e85a5ee966ee01c6a6625ea7b07e4a0f40630f5f690d3ec2','uncensored','2026-11-19 13:43:01'),(74,'20261119103010494',4,4,'red','88133990','000000000540d166251177eaedb2304046517c1967816c784f3e6a7f0a9c8ed4','uncensored','2026-11-19 13:43:57'),(75,'20261119103010495',5,5,'green,violet','0','00000000040b4803a9076c60c0caed2a3c4123bff7986d67b0484b5fbae7f95d','uncensored','2026-11-19 13:45:00'),(76,'20261119103010496',9,9,'green','0','00000000040b48038eb20d3e9cc2ad6f5d725ded6192e123a0cec0b6a803b9fa','uncensored','2026-11-19 13:46:00'),(77,'20261119103010497',6,6,'red','0','00000000040b480309b492cf58e334c6d0bb972381fa2f34c8080a6c976e0d76','uncensored','2026-11-19 13:47:01'),(78,'20261119103010498',1,1,'green','0','00000000040b48034677a19474c8d379b0bc819093a261cf8c48622a0348a641','uncensored','2026-11-19 13:48:00'),(79,'20261119103010499',0,0,'red,violet','0','00000000040b480363d893eff2ec52a5b438bd073e414c4c6a0b2d1ba585c110','uncensored','2026-11-19 13:49:00'),(80,'20261119103010500',2,2,'red','0','00000000040b48037badb9bf6050923d1109d3b8e03b76ee5708b2a100634732','uncensored','2026-11-19 13:50:01'),(81,'20261119103010501',4,4,'red','0','00000000040b4803f10172314cd895cd7e0931c798aad2dc31433d5d5fcd01c4','uncensored','2026-11-19 13:51:01'),(82,'20261119103010502',4,4,'red','0','00000000040b4803a6b477a5c0b702d6a2cc3c42ffde890fc5360dc173dedc4c','uncensored','2026-11-19 13:52:00'),(83,'20261119103010503',5,5,'green,violet','0','00000000040b4803799f12f91cdc675487cd4f329d8704fc48c3b4a425239d25','uncensored','2026-11-19 13:53:01'),(84,'20261119103010504',9,9,'green','0','00000000040b48036395240ab133948c2f5ec52d01963278ba668c492994d609','uncensored','2026-11-19 13:54:00'),(85,'20261119103010505',3,3,'green','0','00000000040b4803c21890ad97ca331e5443858dd0cfc5a6db6c5500cc7a6733','uncensored','2026-11-19 13:55:01'),(86,'20261119103010506',2,2,'red','0','00000000040b48031b2c25265c2add3bb296ac3536721044f3dcacf0ba03b282','uncensored','2026-11-19 13:56:00'),(87,'20261119103010507',1,1,'green','0','00000000040b4803ac35e58dd63049e203c4e975d495ee37614186b8c5b5fc01','uncensored','2026-11-19 13:57:01'),(88,'20261119103010508',1,1,'green','0','00000000040b4803de89a7a888077a305ee68031ee4c63cafdcb8c7c5a324051','uncensored','2026-11-19 13:58:00'),(89,'20261119103010509',8,8,'red','0','00000000040b48034c0f91e2ed2efe29fb7502c34e88428be58b8867ecd9bc58','uncensored','2026-11-19 13:59:00'),(90,'20261119103010510',2,2,'red','0','00000000040b480326f500ec34fb55e94a4deca199b0d17f5bfceb9ffa65f12d','uncensored','2026-11-19 14:00:01'),(91,'20261119103010511',0,0,'red,violet','0','00000000040b4803402f85400e3fd66cf5e4703c8ff9b428406a1784538f70db','uncensored','2026-11-19 14:01:00'),(92,'20261119103010512',5,5,'green,violet','0','00000000040b480367d47a0aa8e31a56ee3b35c1c51ba2568c5f6565aac179f5','uncensored','2026-11-19 14:02:00'),(93,'20261119103010513',8,8,'red','0','00000000040b480334e145b82978ca644af3fac4e977ec51fc727d1045202f48','uncensored','2026-11-19 14:03:00'),(94,'20261119103010514',4,4,'red','88134390','000000000540d2f6167af97848f3291ca3e72a9b7fd4853a33f42917b68d0e84','uncensored','2026-11-19 14:03:57'),(95,'20261119103010515',6,6,'red','0','00000000040b480319ffa42b74e26ade0e5b2c6c4f63dec292c03069d8e104c6','uncensored','2026-11-19 14:05:00'),(96,'20261119103010516',8,8,'red','0','00000000040b48030b03a7896461880be77d1ea562053d08d3b5c3a5ac662f98','uncensored','2026-11-19 14:06:01'),(97,'20261119103010517',5,5,'green,violet','0','00000000040b48038828bcd49160b4aed9187525bd13d5dca3640c4fd330a65b','uncensored','2026-11-19 14:07:01'),(98,'20261119103010518',9,9,'green','0','00000000040b48034505d0424a5a4d3cde38ea1aad403bbee3d9eb0bdf9d6f9c','uncensored','2026-11-19 14:08:00'),(99,'20261119103010519',5,5,'green,violet','0','00000000040b48033183044e7ee759ba4ff567b5f0c59308fb797b8570bae95c','uncensored','2026-11-19 14:09:00'),(100,'20261119103010520',4,4,'red','0','00000000040b4803dcfd3fb2f153ac5a56a5677fa6ce605389b4c02d37b67c84','uncensored','2026-11-19 14:10:00'),(101,'20261119103010521',7,7,'green','0','00000000040b4803ec3559476a52cb5b5a740d3039b487485e3f83f7ddc9a37b','uncensored','2026-11-19 14:11:00'),(102,'20261119103010522',2,2,'red','0','00000000040b480371ae657c1734237359679e95b56dc30b32424fbd5a3d1a62','uncensored','2026-11-19 14:12:01'),(103,'20261119103010523',5,5,'green,violet','0','00000000040b4803b6f810e60ae358f9ab96183b73e14efc67954d1c62fd0e5d','uncensored','2026-11-19 14:13:01'),(104,'20261119103010524',0,0,'red,violet','0','00000000040b480374c8815994b6f7959760c87ef6bd9549fa7b351ef5b82c90','uncensored','2026-11-19 14:14:00'),(105,'20261119103010525',3,3,'green','0','00000000040b4803049366e3ac6d26a22943464b28a277be3202e1d99c0a36f3','uncensored','2026-11-19 14:15:00'),(106,'20261119103010526',9,9,'green','0','00000000040b4803a40fff2d036efc21529415f5dfb673f929455cec1796afc9','uncensored','2026-11-19 14:16:00'),(107,'20261119103010527',4,4,'red','0','00000000040b480374a72747f0b0d9c3363d334f7bb73eae180a497b6bef04be','uncensored','2026-11-19 14:17:00'),(108,'20261119103010528',8,8,'red','0','00000000040b480375adb6a68974731a34f4cbdd05640b58599509001195978a','uncensored','2026-11-19 14:18:01'),(109,'20261119103010529',2,2,'red','0','00000000040b4803ad11b60de16eb01aed88285991e7777d5aa3a1b61838a4f2','uncensored','2026-11-19 14:19:00'),(110,'20261119103010530',7,7,'green','0','00000000040b48031cf41bda78adbcfe312d8838843215b575866bbdf2153b7c','uncensored','2026-11-19 14:20:01'),(111,'20261119103010531',4,4,'red','0','00000000040b4803d331c3b1c5a0b700d9e25e1dc2489b31a95cd8dee20b6154','uncensored','2026-11-19 14:21:01'),(112,'20261119103010532',0,0,'red,violet','0','00000000040b48039a32f84bad85f9a9fbda840f7e311ba1ebf7afe173ecadc0','uncensored','2026-11-19 14:22:00'),(113,'20261119103010533',7,7,'green','0','00000000040b48034b491a130b59beb4610201a97fbb5b738f521fa666ff8547','uncensored','2026-11-19 14:23:01'),(114,'20261119103010534',5,5,'green,violet','0','00000000040b4803b70f241d160d9e2d966f095a3e3c89ecdaf121465e2cccb5','uncensored','2026-11-19 14:24:00'),(115,'20261119103010535',1,1,'green','0','00000000040b4803908ac7c9691a9cb28a92fcc45566e97c0013781f3a516da1','uncensored','2026-11-19 14:25:01'),(116,'20261119103010536',7,7,'green','88134830','000000000540d4ae85784ca57636c46f4437a59b24af31608abe876d807dddab','uncensored','2026-11-19 14:25:57'),(117,'20261119103010537',3,3,'green','0','00000000040b48038b4f6e66269a3a61dae11ed6f15a2cc8ca2176cd7491ae73','uncensored','2026-11-19 14:27:01'),(118,'20261119103010538',7,7,'green','0','00000000040b4803101b0ea20cfa55770c6bbeb4c015710a92866c3ae7ceb4b7','uncensored','2026-11-19 14:28:00'),(119,'20261119103010539',9,9,'green','0','00000000040b480317119a86a6660c654065d9359947e046c78540701de3c39a','uncensored','2026-11-19 14:29:01'),(120,'20261119103010540',4,4,'red','0','00000000040b48038bfc04229abbaed939609f7e416b61444693bbfc7f7c0df4','uncensored','2026-11-19 14:29:04'),(121,'20261119103010541',0,0,'red,violet','0','00000000040b48038b10912096146144a35160435fdebdc06d26caf6bb5d0610','uncensored','2026-11-19 14:29:11'),(122,'20261119103010542',8,8,'red','0','00000000040b480362bee47cdbc3cdfb4083b35fdd2ae21eeee29c61ef8a8e78','uncensored','2026-11-19 14:29:24'),(123,'20261119103010543',1,1,'green','0','00000000040b4803423c428bc58702b9057a8e547e9c61232e76895653aeda1a','uncensored','2026-11-19 14:30:00'),(124,'20261119103010544',6,6,'red','0','00000000040b4803dc9aa49546b280b6eda0444a6576b3e08e889d46ca68066b','uncensored','2026-11-19 14:31:00'),(125,'20261119103010545',0,0,'red,violet','0','00000000040b4803dffbe9ebc723b276b4bb06fb4851904ee1bd9aa2c7947d20','uncensored','2026-11-19 14:32:01'),(126,'20261119103010546',0,0,'red,violet','0','00000000040b48031a356b2861239679307f49f73278bfec98e598e883f5490a','uncensored','2026-11-19 14:33:00'),(127,'20261119103010547',6,6,'red','0','00000000040b48033be2214b44c77bd409427eb6b84bc788939a094f5e556c56','uncensored','2026-11-19 14:34:00'),(128,'20261119103010548',9,9,'green','0','00000000040b4803da6e1d0f5ddc12743c1336f76becf007470935df999fc9cc','uncensored','2026-11-19 14:35:00'),(129,'20261119103010549',7,7,'green','0','00000000040b4803cafe11336a85818d7b71443e164d22f0baf0f2379ba6bf17','uncensored','2026-11-19 14:36:01'),(130,'20261119103010550',2,2,'red','0','00000000040b4803cc6c265596510b5f5396c2a02368f4b7e5a6b09acfa483c2','uncensored','2026-11-19 14:37:00'),(131,'20261119103010551',5,5,'green,violet','0','00000000040b48038975a5e9aa3e19faf92024ef56edeec6b690a8eef0d2b15a','uncensored','2026-11-19 14:38:01'),(132,'20261119103010552',2,2,'red','0','00000000040b4803e6c7af2a641326ddd42745908d27c14e97032fa79dfd492d','uncensored','2026-11-19 14:39:00'),(133,'20261119103010553',3,3,'green','0','00000000040b48035860256d8ed23cb1543ad47474357c5bbae5d6bb6b45d763','uncensored','2026-11-19 14:40:00'),(134,'20261119103010554',6,6,'red','0','00000000040b4803224af49d075f3f5b92cec93497da9159424fb6e0044b5fa6','uncensored','2026-11-19 14:41:00'),(135,'20261119103010555',4,4,'red','0','00000000040b480392a88f1ea48e176cdfbdb5fdbc293bc5d8d2f8cd31694eae','uncensored','2026-11-19 14:42:00'),(136,'20261119103010556',9,9,'green','0','00000000040b480373a027d398faae86bd1975a4342250558dcbef822a38d5c9','uncensored','2026-11-19 14:43:00'),(137,'20261119103010557',5,5,'green,violet','0','00000000040b4803699e8c0bfa41bbbdc842c1f2429a19c1d5d632f404c05a55','uncensored','2026-11-19 14:44:00'),(138,'20261119103010558',1,1,'green','0','00000000040b480388d2fae7b05316f40f596c457f34e4e3dd9ba38b00e62a1b','uncensored','2026-11-19 14:45:01'),(139,'20261119103010559',6,6,'red','0','00000000040b4803b851458f42f307bb4fbcb3edff5510fe0e32b4595a7309a6','uncensored','2026-11-19 14:46:00'),(140,'20261119103010560',4,4,'red','0','00000000040b48031d87828844aba874f8ca4ce1cd030c61e40f2399f958b3f4','uncensored','2026-11-19 14:47:01'),(141,'20261119103010561',3,3,'green','0','00000000040b48031855c8c4e3488d0b7e73ffb5542515d2b190458a42e75053','uncensored','2026-11-19 14:48:00'),(142,'20261119103010562',2,2,'red','0','00000000040b4803a7bf64ed001c4a41a273725f80164b4c9f58cad3510314b2','uncensored','2026-11-19 14:49:01'),(143,'20261119103010563',9,9,'green','0','00000000040b480329b29285d693c682322a80588c9c9d61e4c100f5d705d99d','uncensored','2026-11-19 14:50:00'),(144,'20261119103010564',6,6,'red','0','00000000040b480370fe6203eea0f6ac427af13926623e13f1ca47051473176c','uncensored','2026-11-19 14:51:00'),(145,'20261119103010565',2,2,'red','0','00000000040b480362dbcd92d5c452ee8c57f4790897bd2d967dad88709d4c2c','uncensored','2026-11-19 14:52:00'),(146,'20261119103010566',7,7,'green','0','00000000040b48036cdfc8daa1cff7993329e968424ea5d74b58cd3556c69be7','uncensored','2026-11-19 14:53:01'),(147,'20261119103010567',7,7,'green','0','00000000040b48032ed608f2cc76ab6050fd7b0860201814061b19e039515137','uncensored','2026-11-19 14:54:00'),(148,'20261119103010568',5,5,'green,violet','0','00000000040b48035b9c54f91a3052a85d43b376d6e899f255a2267fd5d84bb5','uncensored','2026-11-19 14:55:01'),(149,'20261119103010569',4,4,'red','0','00000000040b4803049f80347be955224d7e556af820d3bee1eebac0b187f034','uncensored','2026-11-19 14:56:00'),(150,'20261119103010570',6,6,'red','0','00000000040b4803ae5cf1652c8089ca22ace45b53b93a3a566b7fb036f99a6a','uncensored','2026-11-19 14:57:01'),(151,'20261119103010571',9,9,'green','88135470','000000000540d72e240981e14a5a82202957227115498f3061616168cb715b29','uncensored','2026-11-19 14:57:57'),(152,'20261119103010572',2,2,'red','0','00000000040b4803da3ddcebd3a7a8e6e0192b0c138119a2c470429883634592','uncensored','2026-11-19 14:59:01'),(153,'20261119103010573',0,0,'red,violet','0','00000000040b48037cd37c4056b3351761fc56e1b26b510897b57ec40e98f010','uncensored','2026-11-19 15:00:00'),(154,'20261119103010574',1,1,'green','0','00000000040b48037e84f7b371d8dce584f2722a083ddddbedac94fd3113421c','uncensored','2026-11-19 15:01:01'),(155,'20261119103010575',0,0,'red,violet','0','00000000040b480346fead8bae049a1802ba3fe61693da6010432a7a14a8b290','uncensored','2026-11-19 15:02:00'),(156,'20261119103010576',1,1,'green','0','00000000040b48034ce34405d2cd6f525ab10843a02e93552e90ec557f66331e','uncensored','2026-11-19 15:03:00'),(157,'20261119103010577',7,7,'green','0','00000000040b48031e25d409cb2186e6787475fb578e8279638b181fde97eb17','uncensored','2026-11-19 15:04:00'),(158,'20261119103010578',6,6,'red','0','00000000040b48033ce58d5e877583c9f42f29fd30c0920bd99714add2877e6d','uncensored','2026-11-19 15:05:00'),(159,'20261119103010579',0,0,'red,violet','0','00000000040b48030870c9274c1e932e5e50208162907d2012c780cbfb268c40','uncensored','2026-11-19 15:06:00'),(160,'20261119103010580',8,8,'red','0','00000000040b4803be5106033baa40eb6235e984508f8a74c59c0d5a93538088','uncensored','2026-11-19 15:07:00'),(161,'20261119103010581',1,1,'green','0','00000000040b48035575c509dbb2e53a27b503f3be97361f40153fe4e94c7c41','uncensored','2026-11-19 15:08:01'),(162,'20261119103010582',7,7,'green','0','00000000040b4803225eb115f0b0aa1e6d858b1f15febf1696b17ea9e96867fe','uncensored','2026-11-19 15:09:01'),(163,'20261119103010583',8,8,'red','0','00000000040b48037baee8b67a705e2605ffae3473a9dd631a8ba6d91f97b4e8','uncensored','2026-11-19 15:10:00'),(164,'20261119103010584',6,6,'red','0','00000000040b48037bc716e3500cab8e84dce4600e6f8509b102fdf787bc46fc','uncensored','2026-11-19 15:11:00'),(165,'20261119103010585',3,3,'green','0','00000000040b48039127b208b7fced6a3330bad92c6d9535defd48f43913fdfa','uncensored','2026-11-19 15:12:00'),(166,'20261119103010586',5,5,'green,violet','0','00000000040b4803708ddba673bd2ee11f18d08b53d990824efe2190a8032d5b','uncensored','2026-11-19 15:13:00'),(167,'20261119103010587',2,2,'red','0','00000000040b480327623fcfe00e6f87e2fef9f481eea3980317b8adce24922f','uncensored','2026-11-19 15:14:00'),(168,'20261119103010588',0,0,'red,violet','0','00000000040b480306a6c4bcf82c8b57dacfd1aae0df9227445636289b5f60f0','uncensored','2026-11-19 15:15:01'),(169,'20261119103010589',6,6,'red','0','00000000040b48033878aebc0d7845f454ae16ec22bfd90686114d87c8babf6e','uncensored','2026-11-19 15:16:01'),(170,'20261119103010590',0,0,'red,violet','0','00000000040b480347a607b0d835a58f751f37ae866bf3fdcb0c9a31fbc18d10','uncensored','2026-11-19 15:17:00'),(171,'20261119103010591',6,6,'red','0','00000000040b48031f6d78fd0503e378b47189fab5f22ad12729d46fdecb706c','uncensored','2026-11-19 15:18:01'),(172,'20261119103010592',2,2,'red','0','00000000040b48030b6937d022a179aef3f85390a1a11c027eedbbb5e1e61a52','uncensored','2026-11-19 15:19:00'),(173,'20261119103010593',1,1,'green','0','00000000040b480316dc60420b1e9b0b3b09949635d6077c624fe76de05c8341','uncensored','2026-11-19 15:20:01'),(174,'20261119103010594',1,1,'green','0','00000000040b4803c11175f6885a7c21a95d1096d0c3ad789a27d9d36469fa81','uncensored','2026-11-19 15:21:01'),(175,'20261119103010595',0,0,'red,violet','0','00000000040b4803307aaf82d9bf47b62b2852ce9cf6fb09ab58baa0646120cb','uncensored','2026-11-19 15:22:00'),(176,'20261119103010596',7,7,'green','0','00000000040b48034b7565a4beecc0a5fc6dc750bbefc8c8b83403a8d6fe0427','uncensored','2026-11-19 15:23:00'),(177,'20261119103010597',0,0,'red,violet','0','00000000040b48030f8b6b14a8a07ed65c78ac88609ed28e0fb2f392aff65c0f','uncensored','2026-11-19 15:24:01'),(178,'20261119103010598',3,3,'green','0','00000000040b4803736c213b3ab004ef6fe11cc6fb40229ac4e597d783340903','uncensored','2026-11-19 15:25:00'),(179,'20261119103010599',9,9,'green','0','00000000040b4803f16fba5a0818ad63b690daa3f916e9f7e94269294fb5df9e','uncensored','2026-11-19 15:26:00'),(180,'20261119103010600',9,9,'green','0','00000000040b48032d11300b4c2166a5b8ebc3d5275f043629d220d450396e9a','uncensored','2026-11-19 15:27:00'),(181,'20261119103010601',6,6,'red','0','00000000040b4803c94b63085e5c6bd08b713415dca5c830399a831f61cca9c6','uncensored','2026-11-19 15:28:00'),(182,'20261119103010602',1,1,'green','0','00000000040b4803f1c362f4f947211024f2730c394d5b98f2e6f99e2eddb11f','uncensored','2026-11-19 15:29:00'),(183,'20261119103010603',8,8,'red','0','00000000040b480359b8a5dac87b8947773a23c6a14a700ef9ae9c57c0c454f8','uncensored','2026-11-19 15:30:01'),(184,'20261119103010604',7,7,'green','0','00000000040b48030ce6d04eaf16502d386aa6110bb2410537e1171a247feaac','uncensored','2026-11-19 15:31:00'),(185,'20261119103010605',2,2,'red','0','00000000040b4803d38ee846eae2ccca1ef51587bb45a9ba9cda9217a8973202','uncensored','2026-11-19 15:32:01'),(186,'20261119103010606',9,9,'green','0','00000000040b48035cdb6393f8b3c4fbf08044d90e7ab7459fe9a1779c0ca329','uncensored','2026-11-19 15:33:00'),(187,'20261119103010607',6,6,'red','0','00000000040b4803e5c101889b9566f0d5a488b738efc56c254d68870082126c','uncensored','2026-11-19 15:34:01'),(188,'20261119103010608',7,7,'green','0','00000000040b48034d61348d8f26b79f851e28962eb2fe0fd037d9a85a0de5c7','uncensored','2026-11-19 15:35:00'),(189,'20261119103010609',6,6,'red','0','00000000040b4803364c1749cbc7e9c1e8bd093d14b9624bf917e3e805312d86','uncensored','2026-11-19 15:35:03'),(190,'20261119103010610',0,0,'red,violet','0','00000000040b4803cb8b0ca08059f7fb9d4cc40848fecedbf5febe7e4587dd0f','uncensored','2026-11-19 15:35:21'),(191,'20261119103010611',6,6,'red','0','00000000040b4803e283f3a4085e66f9325aedbb4e633e82a4728fea490233f6','uncensored','2026-11-19 15:35:48'),(192,'20261119103010612',4,4,'red','0','00000000040b4803acf8d0ed9b112fc9065e629592e5d1779de3a72506c41b44','uncensored','2026-11-19 15:36:00'),(193,'20261119103010613',7,7,'green','0','00000000040b480352ae0ed55f996e3f54c858a5b5070e9634640e3e59d2917a','uncensored','2026-11-19 15:37:01'),(194,'20261119103010614',0,0,'red,violet','0','00000000040b480380f6c3010f0a723acc603adab429fb6e992c75f719b662c0','uncensored','2026-11-19 15:38:00'),(195,'20261119103010615',9,9,'green','0','00000000040b480386ed274e78c105dc6392bab88016f6e8fdaca666b9a9ebbf','uncensored','2026-11-19 15:38:52'),(196,'20261119103010616',0,0,'red,violet','0','00000000040b480317873f6272deccc7593d28425cf26f47d6317c8b32b4ea40','uncensored','2026-11-19 15:39:00'),(197,'20261119103010617',0,0,'red,violet','0','00000000040b480326c55d3b81b319895952580272c2151ad34c842d993e80de','uncensored','2026-11-19 17:44:14'),(198,'20261119103010735',2,2,'red','0','00000000040b4803204bb1f7511615bbaa869a58c8b67faac10c535ec3a07e82','uncensored','2026-11-19 17:44:59'),(199,'20261119103010736',8,8,'red','0','00000000040b4803950d45d1e3e6a8055e35651be7775719dd3df38be96d38a8','uncensored','2026-11-19 17:45:45'),(200,'20261119103010737',8,8,'red','0','00000000040b48031f4a82b7a354afdfcaf8536b205fc0a4573631479392e2f8','uncensored','2026-11-19 17:46:31'),(201,'20261119103010738',4,4,'red','0','00000000040b48031c464dd667cbd87c0af2c7192a2c3463240b42d860d7294c','uncensored','2026-11-19 17:47:17'),(202,'20261119103010739',3,3,'green','0','00000000040b480303c490ba93f0556175c5dc4639813482224cd8713259a53c','uncensored','2026-11-19 17:48:03'),(203,'20261119103010740',2,2,'red','0','00000000040b4803e5d2e5dcaa5023be5425320e4902857a5dfff9428c99782d','uncensored','2026-11-19 17:48:49'),(204,'20261119103010741',1,1,'green','0','00000000040b4803eb4d1e874acdf159b63d5de412c1f9c4b554dd95a971dd81','uncensored','2026-11-19 17:49:35'),(205,'20261119103010742',0,0,'red,violet','0','00000000040b48039d06740ad0dd7e8089ce62196ecd414f1434576578d575f0','uncensored','2026-11-19 17:50:20'),(206,'20261119103010743',2,2,'red','0','00000000040b4803591c6f972c3c42eac3734a291599160942cc0f913f14d2ee','uncensored','2026-11-19 17:51:07'),(207,'20261119103010744',2,2,'red','0','00000000040b4803080861e1a0cafdd5c7b818cd9e68c3b6a635f21d50ddfe72','uncensored','2026-11-19 17:51:53'),(208,'20261119103010745',3,3,'green','0','00000000040b4803266de6aea9eb6a1250aa4b8ff6bf260e88e6b3db65ce403e','uncensored','2026-11-19 17:52:39'),(209,'20261119103010746',0,0,'red,violet','0','00000000040b4803e99aaad416a88be92a140ee19c9d2ffebd6c9546c232130b','uncensored','2026-11-19 17:53:24'),(210,'20261119103010747',8,8,'red','0','00000000040b48035cec28faca68e331ccf0f6c4cbdb52f94083f8b7c0ac57f8','uncensored','2026-11-19 17:54:10'),(211,'20261119103010748',3,3,'green','0','00000000040b480308a32384561444ffa1161ffa482fbfa01df94475a07513b3','uncensored','2026-11-19 17:54:56'),(212,'20261119103010749',2,2,'red','0','00000000040b4803f41b576d8631350753ae105f13c21cd379273156f05fa92f','uncensored','2026-11-19 17:55:42'),(213,'20261119103010750',0,0,'red,violet','0','00000000040b48033554d180b4bac598c8f7e88fa161a26cd488f31587f9f0cb','uncensored','2026-11-19 17:56:28'),(214,'20261119103010751',6,6,'red','0','00000000040b48035becd6b9903c74f5e3158322bb2d9216cec172c11a2814a6','uncensored','2026-11-19 17:57:13'),(215,'20261119103010752',6,6,'red','0','00000000040b4803c5e9fcef5473b95fd1ac12152d13da45bfa9900dded05826','uncensored','2026-11-19 17:57:59'),(216,'20261119103010753',0,0,'red,violet','0','00000000040b4803c60ced27947581caa5b4f32515bde18e13fda3596f31d30f','uncensored','2026-11-19 17:58:45'),(217,'20261119103010754',2,2,'red','0','00000000040b48039b1ff1b846dd9dd07147e671da9fcb14656a12abf3690132','uncensored','2026-11-19 17:59:31'),(218,'20261119103010755',6,6,'red','0','00000000040b4803b34dc0f35d54678cc02d40c71de2033579472cb089044126','uncensored','2026-11-19 18:00:16'),(219,'20261119103010756',1,1,'green','0','00000000040b48035c7e8e2f876bd8f8a78456366bf488a9e1c5359ef7a75a71','uncensored','2026-11-19 18:01:02'),(220,'20261119103010757',7,7,'green','0','00000000040b4803ace8355379ffbd10db70fc516855cdae7b6c58f7c19f0927','uncensored','2026-11-19 18:01:47'),(221,'20261119103010758',4,4,'red','0','00000000040b480377b4abf76a9d25014d0e1ee8e2dd257c8cfc5f1ab99a624f','uncensored','2026-11-19 18:02:33'),(222,'20261119103010759',0,0,'red,violet','0','00000000040b480362755d1da0dd646e27833d9155fbfaac2f8240dec04d6e90','uncensored','2026-11-19 18:03:19'),(223,'20261119103010760',2,2,'red','0','00000000040b48031cd7b328b31ebcaac77d824ceb3954b8b8484d0085832972','uncensored','2026-11-19 18:04:05'),(224,'20261119103010761',6,6,'red','0','00000000040b48034e256ce4006a48d0a9ecb6bcb0f2b7acc19b60165e6f5ef6','uncensored','2026-11-19 18:04:50'),(225,'20261119103010762',1,1,'green','0','00000000040b4803bcae84f37ce9bde3369500efb8321f2b272d717893853f1d','uncensored','2026-11-19 18:05:36'),(226,'20261119103010763',0,0,'red,violet','0','00000000040b4803dfd0aa42317d626bed35d934dae9d87cae4c79b0d0a3ee40','uncensored','2026-11-19 18:06:22'),(227,'20261119103010764',8,8,'red','0','00000000040b48033ae2930556ccfe2dbea388c79054f76130053bfe323b3998','uncensored','2026-11-19 18:07:08'),(228,'20261119103010765',6,6,'red','0','00000000040b4803992ef84c0597566eb70ca7222bd62ab9faa4506ad6aee9f6','uncensored','2026-11-19 18:07:53'),(229,'20261119103010766',0,0,'red,violet','0','00000000040b48032ef2721998dab4e6183c1dbf2a7f9c7b4a2af65d9e769b80','uncensored','2026-11-19 18:08:39'),(230,'20261119103010767',6,6,'red','0','00000000040b4803e739cdf6c1402235e00e1bc9b45665cbbe0a332b98b74c26','uncensored','2026-11-19 18:09:25'),(231,'20261119103010768',4,4,'red','0','00000000040b4803f1f9553b5fd28c13a475c9090019e782f9ca83d1c3185f74','uncensored','2026-11-19 18:10:11'),(232,'20261119103010769',4,4,'red','0','00000000040b4803bd5e29eae0d01dd263c9a78c0f9c5184b13a4100d17a94c4','uncensored','2026-11-19 18:10:57'),(233,'20261119103010770',9,9,'green','0','00000000040b4803f4e3c00d94fccb545aa6b23d482da1c6f47e8f701524eb9d','uncensored','2026-11-19 18:11:43'),(234,'20261119103010771',3,3,'green','0','00000000040b4803529eab33a8874acc4488423b7902089e68c7fa25b5550f63','uncensored','2026-11-19 18:12:29'),(235,'20261119103010772',7,7,'green','0','00000000040b4803b8e7688f6e0fb9ff0fc272b46831d8e52bad70082f319bf7','uncensored','2026-11-19 18:13:15'),(236,'20261119103010773',1,1,'green','0','00000000040b48037bdc96fc948657d5c8b51313c224e45813a03d337ceed81c','uncensored','2026-11-19 18:14:00'),(237,'20261119103010774',6,6,'red','0','00000000040b4803b8ce1e8716899e9af579e3d480d795308f0c9a63d93447e6','uncensored','2026-11-19 18:14:46'),(238,'20261119103010775',5,5,'green,violet','0','00000000040b4803d030661808174e3b99d7b5dcddae36410b28e755f2ae5b45','uncensored','2026-11-19 18:15:32'),(239,'20261119103010776',3,3,'green','0','00000000040b4803f71c4440747822d267de0ecdb8f924fe07b9ea05cdc66563','uncensored','2026-11-19 18:16:18'),(240,'20261119103010777',0,0,'red,violet','0','00000000040b4803396a66bacf78037aadffd81d0d43d646d41fdc699fa53c30','uncensored','2026-11-19 18:17:04'),(241,'20261119103010778',9,9,'green','0','00000000040b4803dba53c1ff836cd8cbc6bd1a1e52f2c296426fd48a737dfd9','uncensored','2026-11-19 18:17:50'),(242,'20261119103010779',0,0,'red,violet','0','00000000040b4803d93a8e1a6f78c7a0e426f1e29c37017f2fd1bd096d4cf040','uncensored','2026-11-19 18:18:35'),(243,'20261119103010780',5,5,'green,violet','0','00000000040b4803b835ff08b92efbee78b6133023655a3fd991e8ba00c6a5ff','uncensored','2026-11-19 18:19:21'),(244,'20261119103010781',2,2,'red','0','00000000040b4803cfc0b5f18eeba932aad172d8f2ab113f151118274a392acd','uncensored','2026-11-19 18:20:07'),(245,'20261119103010782',4,4,'red','0','00000000040b48030bd9d55d29994558af1d893dc2f91d7c6bfb1e06249f214a','uncensored','2026-11-19 18:20:53'),(246,'20261119103010783',7,7,'green','0','00000000040b4803bc3b0cdccd1b96c7e693ac100d2ca1b511155c1c473e9bc7','uncensored','2026-11-19 18:21:39'),(247,'20261119103010784',8,8,'red','0','00000000040b48039bf40151ccdb1f40f3036fb15f79452f433edd7891fb3938','uncensored','2026-11-19 18:22:25'),(248,'20261119103010785',9,9,'green','0','00000000040b48030a6362329d6012976a2c07db64dc47d173758172aa81fb9a','uncensored','2026-11-19 18:23:11'),(249,'20261119103010786',5,5,'green,violet','0','00000000040b480315a9ea1be07057f41301e1de7dc5f22944cac4c1d402d455','uncensored','2026-11-19 18:23:56'),(250,'20261119103010787',9,9,'green','0','00000000040b4803f074a154f4e7b2bdb230530209c1b0057f2d8c6ed54f959c','uncensored','2026-11-19 18:24:42'),(251,'20261119103010788',3,3,'green','0','00000000040b4803fdeb7e81d9c1b240f8e26c7e47b0c4b434f196607ee66e3c','uncensored','2026-11-19 18:25:28'),(252,'20261119103010789',7,7,'green','0','00000000040b4803bf6468543a92bdaf48a4aa37491b44b7b6b76df762bfa7ec','uncensored','2026-11-19 18:26:14'),(253,'20261119103010790',7,7,'green','0','00000000040b480326d9e293fea0a3662d270b1f3d8c33ef88168be43927aaaf','uncensored','2026-11-19 18:27:00'),(254,'20261119103010791',5,5,'green,violet','0','00000000040b4803a99019f020842283980804c452d7cdf9bb5b215e878e435c','uncensored','2026-11-19 18:27:45'),(255,'20261119103010792',5,5,'green,violet','0','00000000040b48035be32fc0304882348b00ed29f4951e6fcc0b296b7dc99ff5','uncensored','2026-11-19 18:28:31'),(256,'20261119103010793',0,0,'red,violet','0','00000000040b480324a05fdce5fcf9e097b5947c9ea04750ad835d8dcf3fe810','uncensored','2026-11-19 18:29:17'),(257,'20261119103010794',2,2,'red','0','00000000040b4803615cb3dbe56a3d52b1f6a3319205828aed893a1e7fd0cf92','uncensored','2026-11-19 18:30:03'),(258,'20261119103010795',8,8,'red','0','00000000040b4803bf94c0c5423dfd90d70c934213ae99c8f6d35f38cf88d8dd','uncensored','2026-11-19 18:30:48'),(259,'20261119103010796',0,0,'red,violet','0','00000000040b4803de4779abb96af150db84bd6e779f01ebebc18f2214e60960','uncensored','2026-11-19 18:31:34'),(260,'20261119103010797',6,6,'red','0','00000000040b48034411096f190021ece8fd0022ab90d07112e9cd944662e426','uncensored','2026-11-19 18:32:19'),(261,'20261119103010798',5,5,'green,violet','0','00000000040b4803d884c72dfc95eebc16e939ec93eb6d6cd9aa6addcb12655c','uncensored','2026-11-19 18:33:05'),(262,'20261119103010799',1,1,'green','0','00000000040b48030e47dd528fb6a3e5b5c07a2ecc0b63f7f86624193de080a1','uncensored','2026-11-19 18:33:51'),(263,'20261119103010800',9,9,'green','0','00000000040b4803ccd0978b2465487cf2e78bb67ee49f254a9479f266f15f9e','uncensored','2026-11-19 18:34:37'),(264,'20261119103010801',5,5,'green,violet','0','00000000040b4803ad44d106bc7496d5b38a7cd9b6934fa32785914224d96a5b','uncensored','2026-11-19 18:35:22'),(265,'20261119103010802',0,0,'red,violet','0','00000000040b4803b5267f9ad09fb7cc9bf2cb0dab16fcb1e44da96206bc4ff0','uncensored','2026-11-19 18:36:08'),(266,'20261119103010803',8,8,'red','0','00000000040b4803c63334146ad4621b00112b2e7446fdb3522ea5cccfc12a48','uncensored','2026-11-19 18:36:54'),(267,'20261119103010804',9,9,'green','0','00000000040b480339e206ac1b64f8e820488731b150bfd1e69115442811be09','uncensored','2026-11-19 18:37:40'),(268,'20261119103010805',5,5,'green,violet','0','00000000040b4803a089faf0eb2201ca07e47b1fd312295f18dff68ba5ec565a','uncensored','2026-11-19 18:38:26'),(269,'20261119103010806',5,5,'green,violet','0','00000000040b4803ce4e156cf948aa19eab6d26d8191a723ec081e26966a93e5','uncensored','2026-11-19 18:39:11'),(270,'20261119103010807',9,9,'green','0','00000000040b4803f00e863ac009f575337d0fc49a0693bab6b2e66e70d04ec9','uncensored','2026-11-19 18:39:57'),(271,'20261119103010808',5,5,'green,violet','0','00000000040b4803148d56cbb8bcf354f90f8ee8b37aabc807dba96c1f5142b5','uncensored','2026-11-19 18:40:43'),(272,'20261119103010809',1,1,'green','0','00000000040b480372c1c3857f91f68855b5f9eda44a14cf727ac096e09e0d1c','uncensored','2026-11-19 18:41:30'),(273,'20261119103010810',8,8,'red','0','00000000040b48038a65fc51cbbc76851dcf089ad2c6acea7bf304df7a5ccb38','uncensored','2026-11-19 18:42:15'),(274,'20261119103010811',4,4,'red','0','00000000040b4803e7c6adcbeac641e1a509cf44b13921a8bbaa0590562765c4','uncensored','2026-11-19 18:43:01'),(275,'20261119103010812',5,5,'green,violet','0','00000000040b480331b4611d603aeb4a282d447d69e71ae04773b06254ae42e5','uncensored','2026-11-19 18:43:47'),(276,'20261119103010813',7,7,'green','0','00000000040b480393d43954b135049c40eee4d440abd67bfbfecb1f96585f87','uncensored','2026-11-19 18:44:32'),(277,'20261119103010814',7,7,'green','0','00000000040b48031cd72f97396ff068e95c14ad9c4c44989ddb5ca3b3e19497','uncensored','2026-11-19 18:45:18'),(278,'20261119103010815',3,3,'green','0','00000000040b4803e4a31f54679596f408ff7a153b74856a00852127a97c0593','uncensored','2026-11-19 18:46:04'),(279,'20261119103010816',8,8,'red','0','00000000040b48036f1c9f589c0a8047f045ac330ee34e6e56e863cb3970018d','uncensored','2026-11-19 18:46:50'),(280,'20261119103010817',7,7,'green','0','00000000040b4803d6ded6872d4566cd34006385b8aad06989df2d6838e8647d','uncensored','2026-11-19 18:47:36'),(281,'20261119103010818',7,7,'green','0','00000000040b48038aa478dc374686ca6984338dce76fd6589b120a0ec623d17','uncensored','2026-11-19 18:48:21'),(282,'20261119103010819',7,7,'green','0','00000000040b48035b9d97a3b07ac734e177746a9837b94020437c4f1b23717a','uncensored','2026-11-19 18:49:07'),(283,'20261119103010820',0,0,'red,violet','0','00000000040b4803f68ef2ccb4c00be290368f9344f32de1194a736e97f4d10a','uncensored','2026-11-19 18:49:53'),(284,'20261119103010821',3,3,'green','0','00000000040b4803bd2cda33f52347f9d8a103329e492b4705a55ba9b2a7f6e3','uncensored','2026-11-19 18:50:39'),(285,'20261119103010822',6,6,'red','0','00000000040b4803f2613ffa980a8489e436acbe29f6ef1e01ca09f5ad89e6cb','uncensored','2026-11-19 18:51:25'),(286,'20261119103010823',2,2,'red','0','00000000040b4803f162f3e6ae6976b55354e966de2d1247b739279b7f452ecf','uncensored','2026-11-19 18:52:11'),(287,'20261119103010824',8,8,'red','0','00000000040b4803869f49715c6da9937dc0d849b92718fe4eb5765aba1408bc','uncensored','2026-11-19 18:52:56'),(288,'20261119103010825',7,7,'green','0','00000000040b48033328a9f4b6766d9e8b52079f661088756e74977bf20b3f97','uncensored','2026-11-19 18:53:42'),(289,'20261119103010826',8,8,'red','0','00000000040b4803bffd93fe1891529d6c88bfead30c4e363b24e861bf4a2cd8','uncensored','2026-11-19 18:54:28'),(290,'20261119103010827',9,9,'green','0','00000000040b4803dacbbcaa89c3aa07719d02bc6ecff3324730d0834ec67b89','uncensored','2026-11-19 18:55:14'),(291,'20261119103010828',2,2,'red','0','00000000040b48031a256b55722c30f5145fa4f10bbf8effad6822272fd441c2','uncensored','2026-11-19 18:56:01'),(292,'20261119103010829',9,9,'green','0','00000000040b480359791cfa0611efa75e82f4e7718f36eae93331a7e6d50439','uncensored','2026-11-19 18:56:45'),(293,'20261119103010830',9,9,'green','0','00000000040b4803b17c99daf06e97eec2f362c21b140bad2a4203b4faf149fc','uncensored','2026-11-19 18:57:31'),(294,'20261119103010831',5,5,'green,violet','0','00000000040b48037586bff3ff54be6e7d628ff10c7f6361139e3040cf16ec5c','uncensored','2026-11-19 18:58:17'),(295,'20261119103010832',6,6,'red','0','00000000040b4803a18aa432287ecd4071c1bb6ce8da3b6e3656460b561eb66b','uncensored','2026-11-19 18:59:03'),(296,'20261119103010833',9,9,'green','0','00000000040b48038ae84aa74a7eae9dc730244ea911ffb95e92b4f115a012a9','uncensored','2026-11-19 18:59:48'),(297,'20261119103010834',8,8,'red','0','00000000040b4803883f40bfb999f31247193ce14a30f8ee6d7d925f2fcb058f','uncensored','2026-11-19 19:00:34'),(298,'20261119103010835',5,5,'green,violet','0','00000000040b4803782383aae63ebdbd2af53895dc4a81ad1603d27e813ef695','uncensored','2026-11-19 19:01:19'),(299,'20261119103010836',1,1,'green','0','00000000040b480326ba253abc1d2f8d976015eecde62189fff79d04be2e761c','uncensored','2026-11-19 19:02:05'),(300,'20261119103010837',6,6,'red','0','00000000040b480311458d23e7c7fa268cdfd79560246f7c0e99da433cfae686','uncensored','2026-11-19 19:02:51'),(301,'20261119103010838',4,4,'red','0','00000000040b4803ca7c2c8f724a22f1ad819f06fd265527a2dcb1bfa7f3ad4d','uncensored','2026-11-19 19:03:36'),(302,'20261119103010839',6,6,'red','0','00000000040b4803bc029340bba7dd7396c2de4809127bdacd017aa9cd28b16f','uncensored','2026-11-19 19:04:22'),(303,'20261119103010840',3,3,'green','0','00000000040b480301f0631dafc0eeb423dc5702803198f0b231d728081a4923','uncensored','2026-11-19 19:05:08'),(304,'20261119103010841',4,4,'red','0','00000000040b4803c5edf696f7f72d43a5daaf63338f11d2959f3886927952b4','uncensored','2026-11-19 19:05:54'),(305,'20261119103010842',0,0,'red,violet','0','00000000040b4803b0910373d3d1909a94bf302d041eb6b6cd99f37d46030ece','uncensored','2026-11-19 19:06:40'),(306,'20261119103010843',6,6,'red','0','00000000040b4803d5520a470a662f363687998daa21699bc75b968e555bd906','uncensored','2026-11-19 19:07:26'),(307,'20261119103010844',5,5,'green,violet','0','00000000040b4803ee1d1909289ecff8878c787c5c8bf6db65e98408733c995c','uncensored','2026-11-19 19:08:11'),(308,'20261119103010845',5,5,'green,violet','0','00000000040b4803e2bfff1a9a4071cd4bd465c74b162bb7784a50c2ad07e25c','uncensored','2026-11-19 19:08:57'),(309,'20261119103010846',0,0,'red,violet','0','00000000040b4803296f0033d9d4b037fe27f8ec787e98340da5e6d1583af50d','uncensored','2026-11-19 19:09:43'),(310,'20261119103010847',9,9,'green','0','00000000040b48034e2b7df0582c77bd4d62dc7c88bee3882fcf1d103430309e','uncensored','2026-11-19 19:10:29'),(311,'20261119103010848',4,4,'red','0','00000000040b480313b948f329b2a08b094f694441d90bfa5d2a6cec8bc9a94e','uncensored','2026-11-19 19:11:15'),(312,'20261119103010849',0,0,'red,violet','0','00000000040b48031d7a1e3396ff7dd9de993ae368c5542ebd019f9bde895c90','uncensored','2026-11-19 19:12:00'),(313,'20261119103010850',8,8,'red','0','00000000040b4803b4c8313934225d744f22aa31e62c9fd59264df189d3c088f','uncensored','2026-11-19 19:12:46'),(314,'20261119103010851',4,4,'red','0','00000000040b4803c9f9ef02cc211f740da2a4bb61840481bd4597d27e4b54eb','uncensored','2026-11-19 19:13:32'),(315,'20261119103010852',5,5,'green,violet','0','00000000040b480303a2d0a0c27f67c405bd7e87f59704f0759b97a8a25b55ab','uncensored','2026-11-19 19:14:17'),(316,'20261119103010853',6,6,'red','0','00000000040b4803f289a3355b80841c565f973162c2cc959aa5327fba1f96aa','uncensored','2026-11-19 19:15:03'),(317,'20261119103010854',8,8,'red','0','00000000040b48031d1ce3969952339e5054b1fb909ff4893f4e0e58ff01fc78','uncensored','2026-11-19 19:15:49'),(318,'20261119103010855',0,0,'red,violet','0','00000000040b4803247396cdb8ca0bac9ffcc9c32e3ffe2aba643c5c0a1cdf90','uncensored','2026-11-19 19:16:35'),(319,'20261119103010856',7,7,'green','0','00000000040b48033586c86b0d363803655f61ef07046c742ee9745376f667d7','uncensored','2026-11-19 19:17:21'),(320,'20261119103010857',9,9,'green','0','00000000040b480322120208c5ee938ad1188b522841115209445e186eb9eeab','uncensored','2026-11-19 19:17:52'),(321,'20261119103010858',8,8,'red','0','00000000040b4803e5a9201c103acc8ddc88cd3cfcbecfea7566ba2de1e36318','uncensored','2026-11-19 19:18:22'),(322,'20261119103010859',8,8,'red','0','00000000040b4803d4c2acd8d28a5ac7b71516f73c2c508f88033799b90dce08','uncensored','2026-11-19 19:18:55'),(323,'20261119103010860',6,6,'red','88140724','000000000540ebb4f49d682756e858272dc16f2e5093ec478492747993b0496e','uncensored','2026-11-19 19:20:45'),(324,'20261119103010861',8,8,'red','0','00000000040b4803768de124593f595a090f3ce98693d96a5d921888d275328f','uncensored','2026-11-19 19:25:35'),(325,'20261119103010862',2,2,'red','0','00000000040b48032707d57c6d158d46485858d8b955dcb648666d90336eb052','uncensored','2026-11-19 19:26:03'),(326,'20261119103010863',4,4,'red','0','00000000040b48034baa42040037634ec3f49990640d421745daaeb87cf8bd4c','uncensored','2026-11-19 19:26:31'),(327,'20261119103010864',2,2,'red','0','00000000040b4803b21350fc0c8b1f3c80183063b5aea93cedc61055cd396752','uncensored','2026-11-19 19:26:59'),(328,'20261119103010865',9,9,'green','0','00000000040b480380cd54fcf05fbd6fcba7ce0a21d0d92addce7804851ae9ee','uncensored','2026-11-19 19:27:26'),(329,'20261119103010866',8,8,'red','0','00000000040b4803d973855f358150a380c2db37011ab8d97fb918ace796ca78','uncensored','2026-11-19 19:27:54'),(330,'20261119103010867',8,8,'red','0','00000000040b48030a44dff9fa5ce948a29e5967b431a4b8b427c5af2ccdb588','uncensored','2026-11-19 19:28:22'),(331,'20261119103010868',6,6,'red','0','00000000040b480365743b277c33127139b217a34373eb7a6f06888b212c9536','uncensored','2026-11-19 19:28:50'),(332,'20261119103010869',6,6,'red','0','00000000040b4803d0bbbb8f7a34d729c841832e6ca654cbaf753f9b897eacc6','uncensored','2026-11-19 19:29:17'),(333,'20261119103010870',0,0,'red,violet','0','00000000040b4803b2c8e49082a9b603af8e7859f8e7304b4e9ff199421dfa0d','uncensored','2026-11-19 19:29:45'),(334,'20261119103010871',2,2,'red','0','00000000040b48033cee5c277de095ee6796168b058fcecf4fbea73f49bba92f','uncensored','2026-11-19 19:30:13'),(335,'20261119103010872',9,9,'green','0','00000000040b4803e67d350fe68a4761605e336a712915172fbe4cb06bbe299c','uncensored','2026-11-19 19:30:40'),(336,'20261119103010873',2,2,'red','0','00000000040b4803a0ebdc473c76e7bea3f0c95771c69905c9ca1375a77d982f','uncensored','2026-11-19 19:31:26'),(337,'20261119103010874',6,6,'red','0','00000000040b480373c81063b6dff2cf4ca5b98ccf7202883f728dfb134cc846','uncensored','2026-11-19 19:31:52'),(338,'20261119103010875',9,9,'green','0','00000000040b4803982f0ca7d7e76eb1d0accdbe6f30e87b1594b3c38da2ec69','uncensored','2026-11-19 19:32:18'),(339,'20261119103010876',3,3,'green','0','00000000040b48032cf6a1c3f0b8e64ab203641adf30c3f563cab3e7f376f903','uncensored','2026-11-19 19:32:45'),(340,'20261119103010877',4,4,'red','0','00000000040b48033755cf74c6354275b1e77c8ccd9c74fde27d972573ac6a4c','uncensored','2026-11-19 19:33:13'),(341,'20261119103010878',8,8,'red','0','00000000040b48037cf8c57ed1cd974e0efed1f839e4d645d2ce97ce2be64f78','uncensored','2026-11-19 19:33:41'),(342,'20261119103010879',1,1,'green','0','00000000040b4803e43d61a677783b6a01bf6fc22411601b8d50259521db0051','uncensored','2026-11-19 19:34:09'),(343,'20261119103010880',8,8,'red','0','00000000040b480355f9f40ca814c450a31738f1bcc87220a24114e92d9708ce','uncensored','2026-11-19 19:34:36'),(344,'20261119103010881',8,8,'red','0','00000000040b48030e914b40a57eda890a0135bd876187d2f3918c66190eb68d','uncensored','2026-11-19 19:35:09'),(345,'20261119103010882',6,6,'red','0','00000000040b48031772cb063adf9e39491b3ee2c6a584d3c55a325c2a49e66f','uncensored','2026-11-19 19:35:36'),(346,'20261119103010883',7,7,'green','0','00000000040b48032f9281a67f69c8c2cf3d03f35051491797fd5fc9a7aceea7','uncensored','2026-11-19 19:36:04'),(347,'20261119103010884',5,5,'green,violet','0','00000000040b480340992ecf172d86c55480b0e6a6f3ad55ddb1dbd04390e25b','uncensored','2026-11-19 19:36:32'),(348,'20261119103010885',2,2,'red','0','00000000040b48030c2fd9ec766faf1b15bbb4879c8755fb02aaf04da5cc9682','uncensored','2026-11-19 19:36:59'),(349,'20261119103010886',4,4,'red','0','00000000040b4803c60f4fdf8dbe2201a72384944fc3a50da2b5b6441251c694','uncensored','2026-11-19 19:37:27'),(350,'20261119103010887',5,5,'green,violet','0','00000000040b4803c170677d64119ec8da9abafdc5fac14a4e5c26db91cdcf5a','uncensored','2026-11-19 19:37:55'),(351,'20261119103010888',5,5,'green,violet','0','00000000040b480370b4c81d05cdebfbd062b0637f4300fdd8ec7e994a6dca05','uncensored','2026-11-19 19:38:23'),(352,'20261119103010889',0,0,'red,violet','0','00000000040b48035ec39d36daaa8a2e0e535b997a180038b2570f4c759710ce','uncensored','2026-11-19 19:38:51'),(353,'20261119103010890',4,4,'red','0','00000000040b4803986271db9d030bc4c71c0855e1565561974e112c9cb134e4','uncensored','2026-11-19 19:39:19'),(354,'20261119103010891',3,3,'green','0','00000000040b48032decffa74d593a23ab92ed06c13323f3445a59511fac963d','uncensored','2026-11-19 19:39:46'),(355,'20261119103010892',9,9,'green','0','00000000040b4803c5cad87bdc06f8d0c5f5edf34c3541a072b0e9de4ae118d9','uncensored','2026-11-19 19:40:13'),(356,'20261119103010893',2,2,'red','0','00000000040b48036dffa8be66e2bc8ae77b90fbd3b9f8959a0dd6003caf7142','uncensored','2026-11-19 19:40:41'),(357,'20261119103010894',4,4,'red','0','00000000040b4803f78ed364a06642d13e7134f94fb7ddc9516886fe1067e2b4','uncensored','2026-11-19 19:41:09'),(358,'20261119103010895',2,2,'red','0','00000000040b480386f18f1d4eab7d80732bfdeb88b7c286b1114f77a5922bbd','uncensored','2026-11-19 19:41:37'),(359,'20261119103010896',0,0,'red,violet','0','00000000040b4803f4049b048f4ef9d1db9e9931a44cc658e756db141c2ae550','uncensored','2026-11-19 19:42:04'),(360,'20261119103010897',5,5,'green,violet','0','00000000040b48038c059df0bed732ecb15354ad0f58c5a6997d518917faaaa5','uncensored','2026-11-19 19:42:33'),(361,'20261119103010898',6,6,'red','0','00000000040b4803aa5f679ce4b130e3fbdec861da4a204652813032495594e6','uncensored','2026-11-19 19:43:01'),(362,'20261119103010899',2,2,'red','0','00000000040b4803e2e2345443b1ae6bfcf8af4631afed320e4a6d92c82692ec','uncensored','2026-11-19 19:43:30'),(363,'20261119103010900',7,7,'green','0','00000000040b4803362c5f454307f5123a369363fbeefb54f56748726c9fb277','uncensored','2026-11-19 19:43:57'),(364,'20261119103010901',1,1,'green','0','00000000040b4803693b880d4472431dfec3346dfec7fec581ca013f71ab4e1d','uncensored','2026-11-19 19:44:25'),(365,'20261119103010902',6,6,'red','0','00000000040b4803c899461f7330181762a977c211e4bc00dedde29d93dd8736','uncensored','2026-11-19 19:44:53'),(366,'20261119103010903',0,0,'red,violet','0','00000000040b48036c330f00abc336017c2df9e7eff3ff91a6ea7cdc3bb3bab0','uncensored','2026-11-19 19:45:21'),(367,'20261119103010904',5,5,'green,violet','0','00000000040b48030d8f3424e8025f90e557d7e61e4dcd8879f05f12efcd755d','uncensored','2026-11-19 19:45:49'),(368,'20261119103010905',5,5,'green,violet','0','00000000040b480348104bfbea4d4185a475252279ea3854839d5f51c521fe75','uncensored','2026-11-19 19:46:18'),(369,'20261119103010906',7,7,'green','0','00000000040b4803689297c707c16598276e1596feca3363f414cb3d1b81c17b','uncensored','2026-11-19 19:46:46'),(370,'20261119103010907',5,5,'green,violet','0','00000000040b480370e3b173129f467c785668506e2f8f1618eab2e841b10f25','uncensored','2026-11-19 19:47:13'),(371,'20261119103010908',2,2,'red','0','00000000040b48034486a198616222693461c91e37ddd4a74af6d896bf3cfc12','uncensored','2026-11-19 19:47:41'),(372,'20261119103010909',6,6,'red','0','00000000040b4803a0711e3dcb30a507ab82e3445ea6bc511b728de66796d56c','uncensored','2026-11-19 19:48:09'),(373,'20261119103010910',6,6,'red','0','00000000040b48032e847f7cf49508f39a921e3515c4f1d7217df690fc8b4a86','uncensored','2026-11-19 19:48:38'),(374,'20261119103010911',3,3,'green','0','00000000040b4803918634118263ebaa348fc3917490625581aa18eef1a3cc73','uncensored','2026-11-19 19:49:05'),(375,'20261119103010912',6,6,'red','0','00000000040b4803342a3805c42c78761961ac3ba84221735b262385f443276c','uncensored','2026-11-19 19:49:32'),(376,'20261119103010913',1,1,'green','0','00000000040b480349902d6134327df0bcea6e72fd51ffb8428c0cc730f467a1','uncensored','2026-11-19 19:50:00'),(377,'20261119103010914',1,1,'green','0','00000000040b4803a87e13bbecad2cb371bc69aa64d0da577ba66fb718971c31','uncensored','2026-11-19 19:50:28'),(378,'20261119103010915',3,3,'green','0','00000000040b480311335441f3fa9acf66a739f7dde18bc9c34e23c65072d3bc','uncensored','2026-11-19 19:50:57'),(379,'20261119103010916',5,5,'green,violet','0','00000000040b4803d87abff5d73e09b62eb7ceab2f4c62ce214bfcb2ff883c65','uncensored','2026-11-19 19:51:25'),(380,'20261119103010917',9,9,'green','0','00000000040b48039e1d13ed2c6eb0bc5cf382c013648823682e6678b8c37729','uncensored','2026-11-19 19:51:52'),(381,'20261119103010918',5,5,'green,violet','0','00000000040b48032f5b2529adfa4b42fd111783174829ab2c01e26c1f9918b5','uncensored','2026-11-19 19:52:20'),(382,'20261119103010919',9,9,'green','0','00000000040b48033c3c0c1f9ebbc05d514e3eb644c45d146ac6c05bdea1f49d','uncensored','2026-11-19 19:52:47'),(383,'20261119103010920',5,5,'green,violet','0','00000000040b480394d281f39831c053fa20694f3ff820b35395b49ee7c1ac35','uncensored','2026-11-19 19:53:15'),(384,'20261119103010921',5,5,'green,violet','0','00000000040b480359687b87f102bbc192ef08759c8d55d3985e0de67a042f5d','uncensored','2026-11-19 19:53:43'),(385,'20261119103010922',0,0,'red,violet','0','00000000040b48037b6d64758884e7f6a982b99ef85dd92c30e1a1c708403200','uncensored','2026-11-19 19:54:11'),(386,'20261119103010923',0,0,'red,violet','0','00000000040b4803f65f377945ac4323528310211351e92497a2f9e4220aa8d0','uncensored','2026-11-19 19:54:39'),(387,'20261119103010924',0,0,'red,violet','0','00000000040b4803bbbfe02669c413e07d33e8c5cb51b82495cde7dfcb17380b','uncensored','2026-11-19 19:55:07'),(388,'20261119103010925',3,3,'green','0','00000000040b48037925d33feb3c46cd43a6cb216ed55054d0d08285a3f1b3b3','uncensored','2026-11-19 19:55:34'),(389,'20261119103010926',3,3,'green','0','00000000040b480384dc03b4b7582fa0218bf17b2ae0687895630eedff3bfdfc','uncensored','2026-11-19 19:56:03'),(390,'20261119103010927',4,4,'red','0','00000000040b48035f506125b76b0c3c4adef5887baa6dbe143da1bfeab39a4c','uncensored','2026-11-19 19:56:31'),(391,'20261119103010928',4,4,'red','0','00000000040b4803f354fa6f63b15f07daa8a130d546ded4881470d3b501db4b','uncensored','2026-11-19 19:56:59'),(392,'20261119103010929',4,4,'red','0','00000000040b48033c9052d10fd22a9498318c5d1fe2f0d6d0852433affc3e44','uncensored','2026-11-19 19:57:26'),(393,'20261119103010930',4,4,'red','0','00000000040b48039240191a3528e43340806f0231f0d080fab04ef46c1e14ca','uncensored','2026-11-19 19:57:53'),(394,'20261119103010931',6,6,'red','0','00000000040b4803fcf7179c81f25c97477dae8edcee22988f360c2ce985ac6f','uncensored','2026-11-19 19:58:21'),(395,'20261119103010932',6,6,'red','0','00000000040b48032e1cf16d3b4a23f99161797c9a70ac60da7149459a1a66dc','uncensored','2026-11-19 19:58:49'),(396,'20261119103010933',6,6,'red','0','00000000040b48039c8fb94ef9242107fc73324535f79483a99c9914cc139a6c','uncensored','2026-11-19 19:59:17'),(397,'20261119103010934',1,1,'green','0','00000000040b4803d4110f9f897858e4deabfa5d21cff5baa9e089cfc55d01ea','uncensored','2026-11-19 19:59:44'),(398,'20261119103010935',9,9,'green','0','00000000040b4803039b60a0923a04d7138733767ed11ad98ac983a31bd43849','uncensored','2026-11-19 20:00:12'),(399,'20261119103010936',2,2,'red','0','00000000040b480381983bd27291f54b65a23a8b6853b44da3a321c244322ced','uncensored','2026-11-19 20:00:40'),(400,'20261119103010937',7,7,'green','0','00000000040b4803043936a720ae348c1505319c6f87ccea1e593bb60819987a','uncensored','2026-11-19 20:01:09'),(401,'20261119103010938',5,5,'green,violet','0','00000000040b480386014f773ea008fc91d115dfc73426b53a0b46b6d13898f5','uncensored','2026-11-19 20:01:37'),(402,'20261119103010939',2,2,'red','0','00000000040b48031a24377fb77f931df08a0170ce89bb5da89738f37e8bf1a2','uncensored','2026-11-19 20:02:04'),(403,'20261119103010940',5,5,'green,violet','0','00000000040b4803092be5fa746402f7456bf3db63d9dddd52fa87cf0192b25f','uncensored','2026-11-19 20:02:33'),(404,'20261119103010941',8,8,'red','0','00000000040b48032db007f67ca10f8f4d7f5bfc76250be7e5af7a6d78d47ed8','uncensored','2026-11-19 20:03:01'),(405,'20261119103010942',3,3,'green','0','00000000040b48038f42c42015ca77cbf3c8ae53720a53bc9cff3e1f56a4a33f','uncensored','2026-11-19 20:03:28'),(406,'20261119103010943',5,5,'green,violet','0','00000000040b48035a7c64ef76fb6706b25fac0549d2a0c4dd85e502671bd025','uncensored','2026-11-19 20:03:56'),(407,'20261119103010944',9,9,'green','0','00000000040b48032710c118b7b7a14e91e852f01878743435ae68e6e6ce26a9','uncensored','2026-11-19 20:04:20'),(408,'20261119103010945',5,5,'green,violet','0','00000000040b4803b40aa12adcd6610e53850a4311987682624f80c46cda32f5','uncensored','2026-11-19 20:04:48'),(409,'20261119103010946',3,3,'green','0','00000000040b48035c096189b489030417c327a2d2afac84058ad19bf34de343','uncensored','2026-11-19 20:05:16'),(410,'20261119103010947',5,5,'green,violet','0','00000000040b4803c50327c2b9e4f392c8484cb33d5b8f9fc0e4cf28732335cf','uncensored','2026-11-19 20:05:44'),(411,'20261119103010948',2,2,'red','0','00000000040b480366309e3e5fca39dc15fc2864952c7745a633616a87a5da42','uncensored','2026-11-19 20:06:12'),(412,'20261119103010949',1,1,'green','0','00000000040b4803cf2dceec5f9f0b2ddb5d9a6f637a24cc5af8da50d7a041ec','uncensored','2026-11-19 20:06:39'),(413,'20261119103010950',3,3,'green','0','00000000040b48032b90c8777e1e39581b23f15cb1e66a67f5f6a07e44e2c233','uncensored','2026-11-19 20:07:07'),(414,'20261119103010951',3,3,'green','0','00000000040b4803fdb55adf2a2cdc9fb32ab482dfce222ed242cde9fe5acf3f','uncensored','2026-11-19 20:07:53'),(415,'20261119103010952',4,4,'red','0','00000000040b4803fa04bb166e301ef91b253b8b8127390dda8df3629c21aa4a','uncensored','2026-11-19 20:08:21'),(416,'20261119103010953',9,9,'green','0','00000000040b48035b4ab8fd19a1613489541b193785eb8ed415cf316dace0d9','uncensored','2026-11-19 20:09:07'),(417,'20261119103010954',7,7,'green','0','00000000040b4803f8a40cc8d2d4683ea3cac5650baf141f3d4dc705e62b7717','uncensored','2026-11-19 20:09:41'),(418,'20261119103010955',6,6,'red','0','00000000040b4803ad5af6b595b16f69a1cf630573b3a6efa424159174ce66ae','uncensored','2026-11-19 20:09:53'),(419,'20261119103010956',3,3,'green','0','00000000040b4803eb78e29dc581d7dedd2993cb91499916ea5055d3601bc3dc','uncensored','2026-11-19 20:10:21'),(420,'20261119103010957',8,8,'red','0','00000000040b4803b64d9c4d0e85591cd20e0047c439c4b256057729f2ca5f48','uncensored','2026-11-19 20:10:49'),(421,'20261119103010958',6,6,'red','0','00000000040b4803e7002769c15d796cd0cd44d7131a00c478b39cb92769ca6f','uncensored','2026-11-19 20:11:17'),(422,'20261119103010959',1,1,'green','0','00000000040b4803cff38e1af10405a2925f88aa080fa87fbaff2b7dde77a31c','uncensored','2026-11-19 20:11:45'),(423,'20261119103010960',0,0,'red,violet','0','00000000040b48030bf67f74b862980e398d4647dc005cc79a2fcbe6c68ca0bf','uncensored','2026-11-19 20:12:12'),(424,'20261119103010961',6,6,'red','0','00000000040b4803fed2e1eeef7830e8db08294ff67a28cdf0c7928a688606de','uncensored','2026-11-19 20:12:40'),(425,'20261119103010962',5,5,'green,violet','0','00000000040b4803077decf3a137371c58706677824a0307c0ff303fe92525dc','uncensored','2026-11-19 20:13:08'),(426,'20261119103010963',8,8,'red','0','00000000040b48033e9cd51029bea55b6022332baa33dc078dc74c857ec12678','uncensored','2026-11-19 20:13:36'),(427,'20261119103010964',8,8,'red','0','00000000040b4803cd3049dc2f1cf72b4ae3273512c692819952006648363e88','uncensored','2026-11-19 20:14:04'),(428,'20261119103010965',5,5,'green,violet','0','00000000040b4803ec6d7b337b2eff7b78e078dd7522a6d02d7df53fa9c3b5cd','uncensored','2026-11-19 20:14:31'),(429,'20261119103010966',3,3,'green','0','00000000040b48034619e61f38c585f9907d418ef372e2c7838c35ea4e3074f3','uncensored','2026-11-19 20:14:59'),(430,'20261119103010967',0,0,'red,violet','0','00000000040b480359a6313ae5f60d1a1254324039080ba8d3a1c6ff8818bfb0','uncensored','2026-11-19 20:15:27'),(431,'20261119103010968',4,4,'red','0','00000000040b48036b57756c159043a1e652d4deef2e72f57b813088c07c7c24','uncensored','2026-11-19 20:16:13'),(432,'20261119103010969',5,5,'green,violet','0','00000000040b48032a7f3e9d445eb137f2cc3c817614f1cb3e936ce45a107a65','uncensored','2026-11-19 20:16:59'),(433,'20261119103010970',5,5,'green,violet','0','00000000040b4803559cd17ba8da847292d47c485f30538135666a032e4b0745','uncensored','2026-11-19 20:17:45'),(434,'20261119103010971',6,6,'red','0','00000000040b4803df1934e116917e79a0abbef1ba20b23d3ffa2e6da1d83ca6','uncensored','2026-11-19 20:18:31'),(435,'20261119103010972',2,2,'red','0','00000000040b4803f2a0ecf20f4e00a02f8ec476eb7a013def2c48fb264eec2d','uncensored','2026-11-19 20:19:17'),(436,'20261119103010973',1,1,'green','0','00000000040b4803b8070d6d5c82c70249ae67a4fa27952d507b0a831f9f0c1e','uncensored','2026-11-19 20:20:03'),(437,'20261119103010974',1,1,'green','0','00000000040b4803a79e7a8820537f5ef91006093b068e57b14db664485861ff','uncensored','2026-11-19 20:20:31'),(438,'20261119103010975',0,0,'red,violet','0','00000000040b48037d4fab0e8255d3990e93aa5cd95613baa8ee9f00cc8eee50','uncensored','2026-11-19 20:21:17'),(439,'20261119103010976',4,4,'red','0','00000000040b4803bf4f56eee64004a096f26db6c6940159a54ccbff2bb08944','uncensored','2026-11-19 20:22:03'),(440,'20261119103010977',5,5,'green,violet','0','00000000040b48034300845045f3f8f434a632e9ada578bb0cbc9f0990123e45','uncensored','2026-11-19 20:22:49'),(441,'20261119103010978',2,2,'red','0','00000000040b480369f3d84ef2b2bd010626261792a909f869b8e952c164bcf2','uncensored','2026-11-19 20:23:35'),(442,'20261119103010979',3,3,'green','0','00000000040b4803d3acb2c6167dccb54e3c7d315443f35113d33430e1a2f603','uncensored','2026-11-19 20:24:21'),(443,'20261119103010980',6,6,'red','0','00000000040b480320f857f6459c2cbb024c182f800a56fe7dbb4003204cb856','uncensored','2026-11-19 20:24:49'),(444,'20261119103010981',8,8,'red','0','00000000040b480359cae33e535985d8f7aa908d78de1092af473ac599a90028','uncensored','2026-11-19 20:25:35'),(445,'20261119103010982',7,7,'green','0','00000000040b4803bda9c678e346c4609395a2a626fe99de229f877710ad9c97','uncensored','2026-11-19 20:26:22'),(446,'20261119103010983',3,3,'green','0','00000000040b4803ff7997751cd4a785f8a969d83e41ca2c89627b9f078697f3','uncensored','2026-11-19 20:27:23'),(447,'20261119103010984',4,4,'red','0','00000000040b4803dbc3b213ccedbccd5c19565cd15c0d26c0d42e299e0534bb','uncensored','2026-11-19 20:28:42'),(448,'20261119103010985',3,3,'green','0','00000000040b48035477bce50400eda580f20e679861f565fac9a5fc98ad9183','uncensored','2026-11-19 20:29:51'),(449,'20261119103010986',7,7,'green','0','00000000040b48032da3910b9d294282c8e2e7a9b29da536fc2191523afbb287','uncensored','2026-11-19 20:31:10'),(450,'20261119103010987',1,1,'green','0','00000000040b4803250e8a7871ca33bf1435821f40297949a4e17d41d277f21b','uncensored','2026-11-19 20:33:36'),(451,'20261119103010988',0,0,'red,violet','0','00000000040b4803488a28c0451696c48c588d77e92b6939c570086a9e5030ee','uncensored','2026-11-19 20:35:30'),(452,'20261119103010989',7,7,'green','88142244','000000000540f1a44e65055ffc5e902742f65bad20f7ad3012c97bdc4d125a97','uncensored','2026-11-19 20:36:45'),(453,'20261119103010990',9,9,'green','0','00000000040b480328ae649bfe07fbdcf8507589556424015c096faa189dc69b','uncensored','2026-11-19 20:38:25'),(454,'20261119103010991',9,9,'green','0','00000000040b480318baf04e0cb29d8bcd9ecffa0c3a5131945889229f322d79','uncensored','2026-11-19 20:39:37');
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
) ENGINE=MyISAM AUTO_INCREMENT=147 DEFAULT CHARSET=latin1 COMMENT='TRX WinGo 3-min: published results';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trx_wingo_results_3min`
--

LOCK TABLES `trx_wingo_results_3min` WRITE;
/*!40000 ALTER TABLE `trx_wingo_results_3min` DISABLE KEYS */;
INSERT INTO `trx_wingo_results_3min` VALUES (6,'20261119103020142',6,6,'red','0','00000000040b4803d7032af30701202fff1cc324bdf14832895875c55bcf6626','uncensored','2026-11-19 12:45:00'),(7,'20261119103020146',4,4,'red','0','00000000040b4803c1f4b939f3df1b95d8584cfa098e8b39dd69efed887451a4','uncensored','2026-11-19 12:48:01'),(8,'20261119103020147',9,9,'green','0','00000000040b4803ead4324152f24a923c30330dc914dcc4b0074604a97d99ac','uncensored','2026-11-19 12:51:01'),(9,'20261119103020148',5,5,'green,violet','88132990','000000000540cd7ecb8a2bf21034ffd842d5ef461ca3e445166e332611cc5efa','uncensored','2026-11-19 12:53:57'),(10,'20261119103020149',5,5,'green,violet','0','00000000040b4803a359812bb0d69dbde2ee4d19228f4b4a9fe1f238f077c85b','uncensored','2026-11-19 12:57:00'),(11,'20261119103020150',2,2,'red','0','00000000040b480381982a2fd280729ff7f900baf5225a1b38c2e00565a77fa2','uncensored','2026-11-19 13:00:01'),(12,'20261119103020151',1,1,'green','0','00000000040b4803263b9ba4495248fe6e1bd98e3f82cc52d5ec62a8d748b51a','uncensored','2026-11-19 13:03:01'),(13,'20261119103020152',4,4,'red','0','00000000040b480390d98c36fbb95b46f61bb9651260f36b73f8bb602a37a284','uncensored','2026-11-19 13:06:00'),(14,'20261119103020153',8,8,'red','0','00000000040b4803337bdb98b56ac45996ebe5813f53cf3ea0ba7bab8303488c','uncensored','2026-11-19 13:09:01'),(15,'20261119103020154',6,6,'red','0','00000000040b480329257ce68d7fde72fc13f679022e3ed9cf83c71e8318686d','uncensored','2026-11-19 13:12:00'),(16,'20261119103020155',6,6,'red','0','00000000040b480394c53a0e7995e3a0dcbaa31ee7dbfa833e4b7a1986426b6d','uncensored','2026-11-19 13:15:01'),(17,'20261119103020156',8,8,'red','0','00000000040b4803c8065bc4305ba596b6fc60c6750857c69475fb96023a78ab','uncensored','2026-11-19 13:18:01'),(18,'20261119103020157',5,5,'green,violet','0','00000000040b4803e4a5712718ff85bf274eb52516df9304052f94a72a17c235','uncensored','2026-11-19 13:21:01'),(19,'20261119103020158',3,3,'green','0','00000000040b4803366a7197c666e5db4db9fe00ff3536d7e344b681668b54a3','uncensored','2026-11-19 13:24:00'),(20,'20261119103020159',3,3,'green','0','00000000040b48032a51ea7beae52c785199ec1d7419ab1c265c73926e142943','uncensored','2026-11-19 13:27:01'),(21,'20261119103020160',9,9,'green','88133710','000000000540d04efcec09b83367aef2b47e2ad78fda66739274981399b6fdc9','uncensored','2026-11-19 13:29:57'),(22,'20261119103020161',7,7,'green','0','00000000040b48037aa78643465eed4310c994811f0da1e0692fa53da9f83677','uncensored','2026-11-19 13:33:01'),(23,'20261119103020162',8,8,'red','0','00000000040b4803638c0ad0e917526381bc395fb2f2b50165bf0fc5c594d838','uncensored','2026-11-19 13:36:01'),(24,'20261119103020163',1,1,'green','0','00000000040b48039be69dfab5511127cf0ec460a7f3d65e9c6031e71886ac1e','uncensored','2026-11-19 13:39:00'),(25,'20261119103020164',5,5,'green,violet','0','00000000040b48037720c02e32a3de1f4b5c04046d1d65e40794a66ce580f105','uncensored','2026-11-19 13:42:00'),(26,'20261119103020165',3,3,'green','0','00000000040b48033021b2747ef5170e0cd81ef2c1805ee8dbb39d4ef85015a3','uncensored','2026-11-19 13:45:01'),(27,'20261119103020166',0,0,'red,violet','88134070','000000000540d1b6c4a93ba9b7c17a7138902ca3c0a5b4557628d5abc932c840','uncensored','2026-11-19 13:47:57'),(28,'20261119103020167',3,3,'green','0','00000000040b4803ff991c76bea7ce510066048f0b33382b20a66da12f25e063','uncensored','2026-11-19 13:51:01'),(29,'20261119103020168',3,3,'green','0','00000000040b48039164bfa6e2b55cf8494aeb119ba77c3d7b6ea4ef641c873d','uncensored','2026-11-19 13:54:00'),(30,'20261119103020169',4,4,'red','0','00000000040b480380e20aa78cc810313fad7c788372353b1f813c58770bf04f','uncensored','2026-11-19 13:57:01'),(31,'20261119103020170',1,1,'green','0','00000000040b4803d76985f531ee971e11ebf9abe00162af5dd620d1e48397e1','uncensored','2026-11-19 14:00:02'),(32,'20261119103020171',5,5,'green,violet','0','00000000040b480393d346e1ef0721280073f794f245c80e8ea7da426d88caa5','uncensored','2026-11-19 14:03:00'),(33,'20261119103020172',6,6,'red','0','00000000040b480321969b233173b422c4a5aa6abd9cdda83d8a08820e9b1a6b','uncensored','2026-11-19 14:06:01'),(34,'20261119103020173',8,8,'red','0','00000000040b4803c3a3c39144a4bce102843b0a1c3db45961b21d81676cb218','uncensored','2026-11-19 14:09:01'),(35,'20261119103020174',8,8,'red','0','00000000040b48036baa46631bc82c5968cadbb6b5f880128c0d676b666f2d8b','uncensored','2026-11-19 14:12:01'),(36,'20261119103020175',9,9,'green','0','00000000040b4803fd42c9944cfb5d51f34ee810c882bc2bba4a98e1658c449b','uncensored','2026-11-19 14:15:00'),(37,'20261119103020176',5,5,'green,violet','0','00000000040b480379346a8a8ce750fb9c5d1eeef1f3eda405b0f1f2f83043b5','uncensored','2026-11-19 14:18:01'),(38,'20261119103020177',8,8,'red','0','00000000040b4803420b6249a12799cf72f3acc6948a1e5c53c4f4cc6090a38b','uncensored','2026-11-19 14:21:01'),(39,'20261119103020178',7,7,'green','0','00000000040b4803f2c24a8c8f70fc76857658b4b38006cd4c8fca93cdb60ec7','uncensored','2026-11-19 14:24:00'),(40,'20261119103020179',3,3,'green','0','00000000040b4803a940e6a790295299ea8eeb203a4134612bd89bf9e9125cb3','uncensored','2026-11-19 14:27:01'),(41,'20261119103020180',1,1,'green','0','00000000040b48031a7239b4e8d3fddac1318416f996844958b88629e07ae81f','uncensored','2026-11-19 14:33:00'),(42,'20261119103020182',1,1,'green','0','00000000040b4803c760e8a2b6e93cd6a77f2367fa276e4e8e972aaa2db719c1','uncensored','2026-11-19 14:36:01'),(43,'20261119103020183',6,6,'red','0','00000000040b4803bdaaec5b26e69fc1e3d55f44b6cc467db5e1479f2959b96c','uncensored','2026-11-19 14:39:01'),(44,'20261119103020184',1,1,'green','0','00000000040b4803823536a169d05cc7643ce6ef7534799149c549e374fb02e1','uncensored','2026-11-19 14:42:01'),(45,'20261119103020185',9,9,'green','0','00000000040b480383307c4dcca5cedf1a01aeed7ea8118c76d78f67990af329','uncensored','2026-11-19 14:45:01'),(46,'20261119103020186',4,4,'red','0','00000000040b480331650573ce8c1f6f26acd21724d7fe33e160940522b5bb64','uncensored','2026-11-19 14:48:00'),(47,'20261119103020187',0,0,'red,violet','0','00000000040b4803b3059cb2c83a333f3738b05ffbec93e3dad4e8813585b240','uncensored','2026-11-19 14:51:00'),(48,'20261119103020188',0,0,'red,violet','0','00000000040b48035f534124fd360064639a7d0783e15bb29e51936d3339060d','uncensored','2026-11-19 14:54:00'),(49,'20261119103020189',9,9,'green','0','00000000040b48032c755c9ffc78c86f4df5c5345a9ce935f54cc5e3ce6f7c59','uncensored','2026-11-19 14:57:01'),(50,'20261119103020190',8,8,'red','88135510','000000000540d7563d78f890a12fea4c1a2b6dde7efa0f34c611f178c8acedc8','uncensored','2026-11-19 14:59:57'),(51,'20261119103020191',1,1,'green','0','00000000040b480393da19b5e0b22ac7ec46015a43ed202958edbee4e426611f','uncensored','2026-11-19 15:03:01'),(52,'20261119103020192',2,2,'red','88135630','000000000540d7ce09154e701a6ccfbc6fc7b5f3ec4a0850053023eadfbec2ac','uncensored','2026-11-19 15:05:57'),(53,'20261119103020193',5,5,'green,violet','0','00000000040b48036fcb32fb80b5f53958043d6c57ea20b424692f2b1cc696e5','uncensored','2026-11-19 15:09:01'),(54,'20261119103020194',5,5,'green,violet','0','00000000040b480314aa91bc1bf563cdeac9e89a8bb6e2fc07c0d023961e5cfd','uncensored','2026-11-19 15:12:01'),(55,'20261119103020195',7,7,'green','0','00000000040b48034346fcf0aee7288221ac3bddd79d9ecbd4ddafeac872427a','uncensored','2026-11-19 15:15:01'),(56,'20261119103020196',9,9,'green','0','00000000040b4803c0378cb4502ec7d625aca9d2e9bda2d8781b397d805b1a9a','uncensored','2026-11-19 15:18:01'),(57,'20261119103020197',1,1,'green','0','00000000040b4803f2b73add0c3f98e2c97e43be39e37e3b805119a6b21f61ca','uncensored','2026-11-19 15:21:01'),(58,'20261119103020198',3,3,'green','0','00000000040b4803cd946503080ac3c72415edf0874cea4a47dd293746e9ded3','uncensored','2026-11-19 15:24:01'),(59,'20261119103020199',1,1,'green','0','00000000040b4803809e1c4aba506dc58a6b4c02b8db7bc3226aadd95381baa1','uncensored','2026-11-19 15:27:01'),(60,'20261119103020200',6,6,'red','0','00000000040b480319dcfd036a24cad2eff14d1610d6390d4f18ddb411f16e6e','uncensored','2026-11-19 15:30:01'),(61,'20261119103020201',1,1,'green','0','00000000040b48035f38ce9ee871ec13c6afce6da98864a8ef245f62195e8681','uncensored','2026-11-19 15:33:00'),(62,'20261119103020202',9,9,'green','0','00000000040b480352bd2828d3dace56dc9d6e7170fc620ef2ff745bad9f2b9c','uncensored','2026-11-19 17:45:45'),(63,'20261119103020246',0,0,'red,violet','0','00000000040b480387db613f06b13dd30b9932b56a5854cb329c73947354300a','uncensored','2026-11-19 17:48:03'),(64,'20261119103020247',1,1,'green','0','00000000040b4803970903911d682d1509ab4f09afb90fb999091b15f57b9401','uncensored','2026-11-19 17:48:49'),(65,'20261119103020248',4,4,'red','0','00000000040b48034b7f8f6511e49ab37bece4ad19d06a38161edf4bd1220e4e','uncensored','2026-11-19 17:51:07'),(66,'20261119103020249',1,1,'green','0','00000000040b480377b01a1c089703d91f6ad9408f1392cd2050ad39ce67b431','uncensored','2026-11-19 17:51:53'),(67,'20261119103020250',3,3,'green','0','00000000040b4803ebfc2dfae962dec557d610a3962803f46c01d316925a5dd3','uncensored','2026-11-19 17:54:10'),(68,'20261119103020251',9,9,'green','0','00000000040b4803b20fb031b3d472daa4f133857b1ac55409f6a6db7c1317c9','uncensored','2026-11-19 17:54:56'),(69,'20261119103020252',7,7,'green','0','00000000040b480336714d45003fce18dff85675810109ecd939dd7606b3b27e','uncensored','2026-11-19 17:57:13'),(70,'20261119103020253',6,6,'red','0','00000000040b480301e373dd3c0397b7daa6ac558b5fe98145930199bf9906cd','uncensored','2026-11-19 17:57:59'),(71,'20261119103020254',5,5,'green,violet','0','00000000040b4803e1e54a7f2108da641f1291b496ad0482ae35a9359552f5ae','uncensored','2026-11-19 18:00:17'),(72,'20261119103020255',0,0,'red,violet','0','00000000040b4803bf669ebbb5833e69840e873bc9524e1723026d958497960d','uncensored','2026-11-19 18:03:19'),(73,'20261119103020256',7,7,'green','0','00000000040b48033bfc7ec235536427efd15267fedbb3864b35bf7364808257','uncensored','2026-11-19 18:06:22'),(74,'20261119103020257',2,2,'red','0','00000000040b4803947aa56b1b99ad88da5bf9d17a6ff7257f95e0d78b3d97f2','uncensored','2026-11-19 18:09:25'),(75,'20261119103020258',0,0,'red,violet','0','00000000040b4803252ff73e5c183620341c25953eabf63776e095997de3250e','uncensored','2026-11-19 18:12:29'),(76,'20261119103020259',3,3,'green','0','00000000040b48037519a3a11869ae32cfdc99f17bd280a37554cc3d9b0b53ba','uncensored','2026-11-19 18:15:32'),(77,'20261119103020260',2,2,'red','0','00000000040b4803839eb3600474e09605f1bcbf5d89953434e028f95e92a02f','uncensored','2026-11-19 18:18:35'),(78,'20261119103020261',8,8,'red','0','00000000040b4803bcc5e5f55f36a835d7cf40b77b266d6b7962551170e2c7d8','uncensored','2026-11-19 18:21:39'),(79,'20261119103020262',7,7,'green','0','00000000040b4803deac80839e500c9c5d9827c2fb4f35ffbaf4076e4736d377','uncensored','2026-11-19 18:24:42'),(80,'20261119103020263',5,5,'green,violet','0','00000000040b480364cc31739bb5a39f38e66e5d363337b33d985c820685aa45','uncensored','2026-11-19 18:27:46'),(81,'20261119103020264',6,6,'red','0','00000000040b48033690797edd2bd3bd9a0e7647267df0bdf013d77ccbff2df6','uncensored','2026-11-19 18:30:03'),(82,'20261119103020265',0,0,'red,violet','0','00000000040b4803956c6552d66a1bd7d9a6079272a6a5dee0e78570968cd220','uncensored','2026-11-19 18:30:48'),(83,'20261119103020266',6,6,'red','0','00000000040b4803ecd32a7b6b7a47f04f9fe506913140704a0018af45ca97e6','uncensored','2026-11-19 18:33:05'),(84,'20261119103020267',5,5,'green,violet','0','00000000040b480313b6a6cbd470a96b6c68f122f9d34e12a256b9e465693ae5','uncensored','2026-11-19 18:33:51'),(85,'20261119103020268',7,7,'green','0','00000000040b4803560a2007d5104bd2c47076a731156d5edcde41963f471e77','uncensored','2026-11-19 18:36:09'),(86,'20261119103020269',3,3,'green','0','00000000040b4803b3e0d22711ff07700e94c129743e051c9a3e67b8895528d3','uncensored','2026-11-19 18:36:55'),(87,'20261119103020270',1,1,'green','0','00000000040b480368f721010539c738a508b1876e0d8bebb74881dbddfa961e','uncensored','2026-11-19 18:39:12'),(88,'20261119103020271',8,8,'red','0','00000000040b4803cbeae9a2948c02f25b8a6e2442408afa766df77a6d8fdfcc','uncensored','2026-11-19 18:39:58'),(89,'20261119103020272',6,6,'red','0','00000000040b480328197ab84d3e65a0fc3a4a487caf75c1f79f93253f396d6c','uncensored','2026-11-19 18:42:15'),(90,'20261119103020273',4,4,'red','0','00000000040b4803162d5a7eca49982508cb27da6ed9009ca849dc5899bd9694','uncensored','2026-11-19 18:45:18'),(91,'20261119103020274',0,0,'red,violet','0','00000000040b4803702f317c610b83ef35806e0ec99ac660f1550eea02d208d0','uncensored','2026-11-19 18:48:22'),(92,'20261119103020275',3,3,'green','0','00000000040b4803b4e8108035e1304d694cf67d7c0f826aff23ed705408e43e','uncensored','2026-11-19 18:51:25'),(93,'20261119103020276',3,3,'green','0','00000000040b48036047309e81931505245c199df012225fb9784a0161bb9b53','uncensored','2026-11-19 18:54:28'),(94,'20261119103020277',0,0,'red,violet','88140259','000000000540e9e388af1c0b1714eb9a5eeb5c3d039ded7055dc23e56cee10be','uncensored','2026-11-19 18:57:30'),(95,'20261119103020278',4,4,'red','0','00000000040b480334c147b417d9045a952ff503cb4378959d4d59967ce09314','uncensored','2026-11-19 19:00:34'),(96,'20261119103020279',1,1,'green','0','00000000040b4803edecb8ce9763e39368db54b84f6b1a5d5683ef8843e21ddf','uncensored','2026-11-19 19:03:37'),(97,'20261119103020280',7,7,'green','0','00000000040b4803125ef343c6d232d89fdcb0aac214e515106ca34b5d0b63f7','uncensored','2026-11-19 19:06:40'),(98,'20261119103020281',9,9,'green','0','00000000040b4803b2c92318437b017e301dc1badabd23e690ceb41222409ade','uncensored','2026-11-19 19:09:43'),(99,'20261119103020282',4,4,'red','0','00000000040b480341427e055d82089b2a9dd5576118157873229ef72598ae94','uncensored','2026-11-19 19:12:01'),(100,'20261119103020283',8,8,'red','0','00000000040b4803ddec6cb62d4ae986cd87240a64730ae4b4d16795b1ba2fd8','uncensored','2026-11-19 19:12:46'),(101,'20261119103020284',1,1,'green','0','00000000040b48031af9bc19e7fddad4cf7da5eeffd556e8d43b2a0389fd6321','uncensored','2026-11-19 19:15:03'),(102,'20261119103020285',3,3,'green','0','00000000040b48034d7373fcae5300517b527e58fbc0dcfea8a06aa55dabce3c','uncensored','2026-11-19 19:15:49'),(103,'20261119103020286',0,0,'red,violet','0','00000000040b480388a121e56195db8a3cbb6c64b09acb451fb8594f4cc36760','uncensored','2026-11-19 19:18:23'),(104,'20261119103020287',9,9,'green','0','00000000040b48034e498941d0ff1d01496f4c593c095b909d36cc1e1c2f5719','uncensored','2026-11-19 19:18:55'),(105,'20261119103020288',2,2,'red','0','00000000040b4803dce4940f852622cf238c13a896dc575c747d0056cf7392fa','uncensored','2026-11-19 19:27:27'),(106,'20261119103020289',0,0,'red,violet','0','00000000040b4803bf85a6fb2d6a6fcbb8a10b92e875f2df5a4fdec87e4b77d0','uncensored','2026-11-19 19:27:55'),(107,'20261119103020290',1,1,'green','0','00000000040b48030e974e9074cbcd3aa51b6409ee4cb888cfdec8b560b8081d','uncensored','2026-11-19 19:30:13'),(108,'20261119103020291',0,0,'red,violet','0','00000000040b4803118b502673b5538e8d84252d3c54340e0ab4b4389e70fafd','uncensored','2026-11-19 19:30:41'),(109,'20261119103020292',6,6,'red','0','00000000040b48039e75654c9bc97bc4e4e55bd3907369c9e220f32c61e09bf6','uncensored','2026-11-19 19:33:13'),(110,'20261119103020293',0,0,'red,violet','0','00000000040b480366759bf22814bb1b2e6682029bd7bbbe02e07692418260fa','uncensored','2026-11-19 19:33:41'),(111,'20261119103020294',2,2,'red','0','00000000040b4803f82b67a4ce2fd8d94ad5fbea88c13147bfa852301f92912f','uncensored','2026-11-19 19:36:43'),(112,'20261119103020295',4,4,'red','0','00000000040b4803f2f2dfc09f32c3213734c78e0529bc4154530935524b504b','uncensored','2026-11-19 19:37:08'),(113,'20261119103020296',7,7,'green','0','00000000040b4803e31a5f0ad0d54eb4f26b4a6abc12072f42476180972e5da7','uncensored','2026-11-19 19:39:25'),(114,'20261119103020297',3,3,'green','0','00000000040b48030f52ae819a4652e901ad81440f8d428a52d570d48e0de03a','uncensored','2026-11-19 19:39:52'),(115,'20261119103020298',2,2,'red','0','00000000040b48035f91b0385e98a5a1c9372480eb5eb3883636c2bead2edd62','uncensored','2026-11-19 19:42:11'),(116,'20261119103020299',1,1,'green','0','00000000040b4803960e2b6cc6afa86a9e123209dc6dcf4469977fc34f29a1bd','uncensored','2026-11-19 19:42:40'),(117,'20261119103020300',9,9,'green','0','00000000040b48037441c3f3d3eb674981bfcdb3f7411908cbf61e89da6a51d9','uncensored','2026-11-19 19:43:09'),(118,'20261119103020301',0,0,'red,violet','0','00000000040b4803d96851d8d10df2cec3a943bb725e265c14d39d8861d588f0','uncensored','2026-11-19 19:45:27'),(119,'20261119103020302',5,5,'green,violet','0','00000000040b48033d48c132c4b58c4ca7093c62e29eb1c3e6184d083722235b','uncensored','2026-11-19 19:45:57'),(120,'20261119103020303',5,5,'green,violet','0','00000000040b48035fdf3d19413ef086db3a50409d6105c11b2e7da39364085a','uncensored','2026-11-19 19:48:17'),(121,'20261119103020304',8,8,'red','0','00000000040b4803b6e65e4f98c865e8460d552a035625d80db2b9a8afabebbb','uncensored','2026-11-19 19:48:45'),(122,'20261119103020305',7,7,'green','0','00000000040b480348cd37228de59a0efd02e04fb6b9494b04aaa2554522527f','uncensored','2026-11-19 19:51:33'),(123,'20261119103020306',3,3,'green','0','00000000040b480347e3dca111d4c94528c9bc708b282607eff618cc75c21cc3','uncensored','2026-11-19 19:51:59'),(124,'20261119103020307',6,6,'red','0','00000000040b480301640d2df8997841eaa6a68108fb25a63920b2f2a6f39696','uncensored','2026-11-19 19:54:20'),(125,'20261119103020308',6,6,'red','0','00000000040b48030172c331e05190b659eb0f193cd9c6665aaadbd034f0b16f','uncensored','2026-11-19 19:54:47'),(126,'20261119103020309',5,5,'green,violet','0','00000000040b4803cfc41fae8826155e329710ec8d6e55391122831e847f725f','uncensored','2026-11-19 19:57:33'),(127,'20261119103020310',2,2,'red','0','00000000040b4803717aca71337425ce1ce7c07ed2d831245da66f9b6452eacc','uncensored','2026-11-19 19:58:01'),(128,'20261119103020311',6,6,'red','0','00000000040b4803a8c981335d562d32754b79bfff3ea0f96efea24382735ed6','uncensored','2026-11-19 20:00:19'),(129,'20261119103020312',4,4,'red','0','00000000040b480359240f20ba79c57c26196f64fcf88ef43db08fd954e1c1a4','uncensored','2026-11-19 20:00:48'),(130,'20261119103020313',3,3,'green','0','00000000040b4803862b4be99288a87ec8b29745d352efbc1cb36c021f4685a3','uncensored','2026-11-19 20:03:35'),(131,'20261119103020314',5,5,'green,violet','0','00000000040b48038a10f5f4c5460eefe8330fc53a5132991839d11889b0dc95','uncensored','2026-11-19 20:04:04'),(132,'20261119103020315',5,5,'green,violet','0','00000000040b480358dc1abdb2df8da0f7dee3ef7283e9f6a66ad1f873395ab5','uncensored','2026-11-19 20:06:12'),(133,'20261119103020316',0,0,'red,violet','0','00000000040b48031bfb2f7c68475044916a0bfc137b3f6af4c7b8748c049260','uncensored','2026-11-19 20:06:40'),(134,'20261119103020317',9,9,'green','0','00000000040b48034888205e45cfd84a9d79af60cf628838997c270e5ad462f9','uncensored','2026-11-19 20:09:40'),(135,'20261119103020318',8,8,'red','0','00000000040b48037372f601082b3012ef44e0436c8cf7eec07b67a4f1d1ba48','uncensored','2026-11-19 20:09:41'),(136,'20261119103020319',4,4,'red','0','00000000040b48033c70265d3a59ac9362967947a5cc48be135307ac0187cc4f','uncensored','2026-11-19 20:09:53'),(137,'20261119103020320',6,6,'red','0','00000000040b4803a24f7f37f4037233b116c090ff5e803ba5b8e084735c9d6a','uncensored','2026-11-19 20:12:13'),(138,'20261119103020321',4,4,'red','0','00000000040b48036fc8638b5946fc2c31c4bd02bd51480dd398f7e36dc09274','uncensored','2026-11-19 20:12:41'),(139,'20261119103020322',4,4,'red','0','00000000040b48038ddf0aba642b2154f210abc00e729772c0d797d178424e54','uncensored','2026-11-19 20:16:00'),(140,'20261119103020323',1,1,'green','88141889','000000000540f0419f55c46a377f69ef364defba3f21c880a0e119aafca16a11','uncensored','2026-11-19 20:19:00'),(141,'20261119103020324',2,2,'red','0','00000000040b480315cfc1cc9e3900b3e5557227b667af1f5e501b1df2947c72','uncensored','2026-11-19 20:21:51'),(142,'20261119103020325',2,2,'red','0','00000000040b4803c694ba086d6721aecdbdc8839bbaeb9003db1085120ea12b','uncensored','2026-11-19 20:24:37'),(143,'20261119103020326',0,0,'red,violet','0','00000000040b4803c6b182900e2c45b04adb0d73b1c351ebfc471f7735ad9c20','uncensored','2026-11-19 20:25:23'),(144,'20261119103020327',7,7,'green','88142133','000000000540f135f11ba9665e7efc7a5a27793ffa7d9c144d4b97cda577f397','uncensored','2026-11-19 20:31:12'),(145,'20261119103020328',8,8,'red','0','00000000040b4803ddaf464bcb0fe8b8a776aaf4d48af20cb6a2a41d6ef72e98','uncensored','2026-11-19 20:34:44'),(146,'20261119103020329',1,1,'green','0','00000000040b48039f9857a157731b3e63e799be813e81af877f47bd4c961d1c','uncensored','2026-11-19 20:37:38');
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
) ENGINE=MyISAM AUTO_INCREMENT=88 DEFAULT CHARSET=latin1 COMMENT='TRX WinGo 5-min: published results';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trx_wingo_results_5min`
--

LOCK TABLES `trx_wingo_results_5min` WRITE;
/*!40000 ALTER TABLE `trx_wingo_results_5min` DISABLE KEYS */;
INSERT INTO `trx_wingo_results_5min` VALUES (2,'20261119103030088',0,0,'red,violet','88132910','000000000540cd2ec5d248f68e021dff8b02a043875438c16b1128429dd53e0e','uncensored','2026-11-19 12:49:57'),(3,'20261119103030089',9,9,'green','0','00000000040b4803ed17b0f6f280acaf84653d0e9a24ea75a58488b2786b3cd9','uncensored','2026-11-19 12:55:00'),(4,'20261119103030090',5,5,'green,violet','0','00000000040b4803ec1e115619fe47e1e28c714337c72196266fed4d8886465e','uncensored','2026-11-19 13:00:01'),(5,'20261119103030091',8,8,'red','0','00000000040b4803c577f6ecdf6de6adfc067e081e53f423c0fe64f2d39e878d','uncensored','2026-11-19 13:05:01'),(6,'20261119103030092',4,4,'red','88133310','000000000540cebed5b2ac94ce0f0514e21de6188769ad2006ad9322de2d6184','uncensored','2026-11-19 13:09:57'),(7,'20261119103030093',1,1,'green','0','00000000040b4803a7d7b3c33c71b2053e5c9d12310b8330687a442ff4b893f1','uncensored','2026-11-19 13:15:01'),(8,'20261119103030094',1,1,'green','0','00000000040b4803a925cf3c0237c657165708cee49434f35a4c7ddd1a43ea81','uncensored','2026-11-19 13:20:01'),(9,'20261119103030095',4,4,'red','0','00000000040b4803105a6366a96d3117c68644bf7c86ee4c16bf61a2ddfa2744','uncensored','2026-11-19 13:25:01'),(10,'20261119103030096',7,7,'green','0','00000000040b4803a8169f5d364db88cee0a8aaab50b935773d2590cf778b457','uncensored','2026-11-19 13:30:01'),(11,'20261119103030097',1,1,'green','0','00000000040b4803403ccba5b397111b18230cabc72aee42dacf71127eb1c21e','uncensored','2026-11-19 13:35:00'),(12,'20261119103030098',4,4,'red','0','00000000040b48035fe5bf4e60e2c30b18dc50f58048f674b5c4f6c3d15ee44a','uncensored','2026-11-19 13:40:01'),(13,'20261119103030099',3,3,'green','0','00000000040b4803dddeec8498b8f74bf18a4f54a2bc883cfbddc86a09e6fab3','uncensored','2026-11-19 13:45:01'),(14,'20261119103030100',4,4,'red','0','00000000040b4803cfe4457f44a2826a175dc67f4295b5938b9f452d7a5d0034','uncensored','2026-11-19 13:50:01'),(15,'20261119103030101',9,9,'green','0','00000000040b4803e70777758522c7ecc0d3ac7556421adf278d00fa57107a9d','uncensored','2026-11-19 13:55:01'),(16,'20261119103030102',9,9,'green','0','00000000040b4803cd4eff8b038892c921fbd067b274db305539c25f4cbad3c9','uncensored','2026-11-19 14:00:02'),(17,'20261119103030103',9,9,'green','0','00000000040b480395ddc3f3fedeae08aa6cdb29f199c8c72f0893442e9049bc','uncensored','2026-11-19 14:05:00'),(18,'20261119103030104',5,5,'green,violet','0','00000000040b480307ee63e4bcf3e60eb091b528310412e4bfe4da108dc575db','uncensored','2026-11-19 14:10:00'),(19,'20261119103030105',0,0,'red,violet','0','00000000040b4803404947a4f15846c09093f24acf437c9ae74786cd54f0c0b0','uncensored','2026-11-19 14:15:01'),(20,'20261119103030106',6,6,'red','0','00000000040b48031e586480426edeb10046f7515ad05abfb9c3ebe6e28606cf','uncensored','2026-11-19 14:20:01'),(21,'20261119103030107',7,7,'green','0','00000000040b48037af92cda035b88176443757683fd9620e30bc62ae3e21997','uncensored','2026-11-19 14:25:01'),(22,'20261119103030108',7,7,'green','88135008','000000000540d560f4a24dda545aaa95ad620a9b4aa7bcba0668c81c0c942d57','uncensored','2026-11-19 14:34:51'),(23,'20261119103030110',7,7,'green','0','00000000040b48038ef4a668ff0e37f9d6d992d2437c067445b0acc667f0057e','uncensored','2026-11-19 14:40:00'),(24,'20261119103030111',0,0,'red,violet','0','00000000040b48037ee2363bea70a998cfeb39a4465579ad2e67112c2cff120e','uncensored','2026-11-19 14:45:01'),(25,'20261119103030112',3,3,'green','0','00000000040b48037401b0a300e01288b5b69d9519f5e26cb4a3f5ac4d822a3d','uncensored','2026-11-19 14:50:00'),(26,'20261119103030113',6,6,'red','0','00000000040b4803223c5b51a53edf221d1839caa2c4739f268e53ccb69a376d','uncensored','2026-11-19 14:55:01'),(27,'20261119103030114',0,0,'red,violet','0','00000000040b480346832975fc1ce80ac57a4bf53645982cc2c42306187570de','uncensored','2026-11-19 15:00:01'),(28,'20261119103030115',3,3,'green','0','00000000040b48032dd03b55507714c1477dadb066bef301ed9b75a3bfa45643','uncensored','2026-11-19 15:05:01'),(29,'20261119103030116',4,4,'red','0','00000000040b480345f9fa3ab7b32f08cf0d2fdee613744aaf87e8e0ff72d34e','uncensored','2026-11-19 15:10:00'),(30,'20261119103030117',9,9,'green','0','00000000040b48034ef18046b6596830bdc4b557a2f8babd0fa627676619badf','uncensored','2026-11-19 15:15:01'),(31,'20261119103030118',8,8,'red','0','00000000040b4803d5f1bc767dfb65b4ad85487041f1151997fa6b094ee1d8b8','uncensored','2026-11-19 15:20:01'),(32,'20261119103030119',3,3,'green','0','00000000040b48037135837c861a5c22c46a7c31878a7c9cee57ad1275352e73','uncensored','2026-11-19 15:25:01'),(33,'20261119103030120',5,5,'green,violet','0','00000000040b4803259683cd2895eecdaeba213ca326fa823b7d0c89d6078155','uncensored','2026-11-19 15:30:02'),(34,'20261119103030121',8,8,'red','88136210','000000000540da12e035129aedeeff9de978e8f8e4bd065db4b4e978a0ef1158','uncensored','2026-11-19 15:34:57'),(35,'20261119103030122',4,4,'red','0','00000000040b48036a73561d2053f19e9d2d17fed1fd4bff1f669b210e194194','uncensored','2026-11-19 15:35:21'),(36,'20261119103030123',8,8,'red','0','00000000040b4803d01079863c8eaa5c761220561b3e6f4bb18ade13947e8ced','uncensored','2026-11-19 15:35:49'),(37,'20261119103030124',8,8,'red','0','00000000040b48031c52bcacf88cf778adb52397b9fafb4a4392ff32a3eff828','uncensored','2026-11-19 17:45:46'),(38,'20261119103030148',2,2,'red','0','00000000040b4803fc246924a22ff430814413b5407cf210d7e62464a4eee662','uncensored','2026-11-19 17:50:21'),(39,'20261119103030149',7,7,'green','0','00000000040b48034804fd764c0607f1e6e7e400534244fbcdb2696186bfd627','uncensored','2026-11-19 17:55:42'),(40,'20261119103030150',4,4,'red','0','00000000040b4803c32be1a5f232f01ad3df1a04bad7eac3260de4e0f69764fb','uncensored','2026-11-19 18:00:17'),(41,'20261119103030151',3,3,'green','0','00000000040b48036169653ff49a3f0638b0d87b922a9734437627e4bb67763a','uncensored','2026-11-19 18:05:36'),(42,'20261119103030152',4,4,'red','0','00000000040b480379abe4f8663709679d84595d9405166d0c3ba7f57caf43c4','uncensored','2026-11-19 18:10:11'),(43,'20261119103030153',2,2,'red','0','00000000040b4803678cab91830e992e42c2277466050693697c95847edac4f2','uncensored','2026-11-19 18:10:57'),(44,'20261119103030154',9,9,'green','0','00000000040b48032f49e80edd65ec31821399f7e6eca6c3f72c9b3fe8b28789','uncensored','2026-11-19 18:15:32'),(45,'20261119103030155',8,8,'red','0','00000000040b48039b46c3e9d8dc8449acb2016adaafe1d93ea2530e4e1de538','uncensored','2026-11-19 18:20:07'),(46,'20261119103030156',5,5,'green,violet','0','00000000040b4803e0a35575ab52e337feb8c244435814aa9a54895d4a554f5c','uncensored','2026-11-19 18:20:53'),(47,'20261119103030157',8,8,'red','0','00000000040b48035abf0edf02b6cb0956e2fa881fdb63a598316e8e65d4e748','uncensored','2026-11-19 18:25:28'),(48,'20261119103030158',6,6,'red','0','00000000040b48031caac98b7a8edb1b19eb16cce7eaef4d239087a19d6becfe','uncensored','2026-11-19 18:30:03'),(49,'20261119103030159',1,1,'green','0','00000000040b4803c3bf2aa92d4210964f3bdcdf9544b49b34f9b581afe8311d','uncensored','2026-11-19 18:30:49'),(50,'20261119103030160',7,7,'green','0','00000000040b4803f164ba4fae8e4c7c07d29e8591f911b5e06c5be834910197','uncensored','2026-11-19 18:35:23'),(51,'20261119103030161',5,5,'green,violet','0','00000000040b48032bc58e0ffc05b17b96392f9dcda17585b5975a68097fd5bb','uncensored','2026-11-19 18:40:44'),(52,'20261119103030162',4,4,'red','0','00000000040b4803cd22f3368fec0f3739dde0702a5142fcaf937eb8aa6db4bd','uncensored','2026-11-19 18:45:19'),(53,'20261119103030163',4,4,'red','0','00000000040b48037bf001328a9d4ca4efeff00254cabe785b72f80879b363d4','uncensored','2026-11-19 18:50:39'),(54,'20261119103030164',1,1,'green','0','00000000040b48037ecd9eabb4fad7110639818869b21bcd979fd7952071bdc1','uncensored','2026-11-19 18:55:14'),(55,'20261119103030165',6,6,'red','0','00000000040b48037a3ba99dc3d75e8f65fb6ba61067ab96321342294e4c96c6','uncensored','2026-11-19 18:56:02'),(56,'20261119103030166',7,7,'green','0','00000000040b48031446a1be6d6f28345268334cfea91b4e045e4e2f7e7fad57','uncensored','2026-11-19 19:00:35'),(57,'20261119103030167',4,4,'red','0','00000000040b48039369a88e7660be316937f77afe77b07e5653e5056edb7684','uncensored','2026-11-19 19:05:08'),(58,'20261119103030168',7,7,'green','0','00000000040b48034feafbb681816fa05991895d3ec9b2b96481ca3f30b0a67e','uncensored','2026-11-19 19:05:54'),(59,'20261119103030169',7,7,'green','0','00000000040b4803c6a33d7bdac030b4b8a48a007086e98eff73a8851f11037f','uncensored','2026-11-19 19:10:29'),(60,'20261119103030170',5,5,'green,violet','0','00000000040b4803c6c4a9e5de72da21a44491b0ce436c0fbfed819c04f94705','uncensored','2026-11-19 19:15:04'),(61,'20261119103030171',8,8,'red','0','00000000040b480340b8b3fbd2733d6995effca1b73671da5160ca00bec55078','uncensored','2026-11-19 19:15:50'),(62,'20261119103030172',2,2,'red','0','00000000040b480368928ebd0363be64a23d3746ae767e0a28c2de4f52262daa','uncensored','2026-11-19 19:25:35'),(63,'20261119103030173',7,7,'green','0','00000000040b4803b899dfdf40582372b75de620ba8628081b3f33d8e446e6c7','uncensored','2026-11-19 19:30:13'),(64,'20261119103030174',9,9,'green','0','00000000040b4803965f84aaf5d6899ace7a5058dc21ac025ec07218967ff4e9','uncensored','2026-11-19 19:30:41'),(65,'20261119103030175',5,5,'green,violet','0','00000000040b4803b05f4bbdb9ffcb58ab6caee8ceb622972552678eaf93d8c5','uncensored','2026-11-19 19:35:16'),(66,'20261119103030176',8,8,'red','0','00000000040b48039de053f6a6eb55700398b3100bafe05fd5d10f656712b828','uncensored','2026-11-19 19:35:46'),(67,'20261119103030177',3,3,'green','0','00000000040b48031e517394c17803f78b249952a83189ef6a1c6779e90edd3a','uncensored','2026-11-19 19:36:10'),(68,'20261119103030178',6,6,'red','0','00000000040b4803da23ec2984a48b8d438c1874b4ba7afbc127176f0810f956','uncensored','2026-11-19 19:40:21'),(69,'20261119103030179',4,4,'red','0','00000000040b48033f65c7b32e8bf01d192795ea6f844f731825e0655a10c4c4','uncensored','2026-11-19 19:40:48'),(70,'20261119103030180',9,9,'green','0','00000000040b48037229564452ec5bb8fa16d39ad0cc5f3a5ed8e81b165c839c','uncensored','2026-11-19 19:45:31'),(71,'20261119103030181',7,7,'green','0','00000000040b48037550f5d17c22d222191341832c290c8b92ed814f05479647','uncensored','2026-11-19 19:46:01'),(72,'20261119103030182',2,2,'red','0','00000000040b48038e6eda0624fe29cc2310189b3c23b69602c3d4b50f2b92b2','uncensored','2026-11-19 19:50:36'),(73,'20261119103030183',4,4,'red','0','00000000040b480391e11353e393b696410fb8bdde646dd194ba87d6a9993dc4','uncensored','2026-11-19 19:51:04'),(74,'20261119103030184',4,4,'red','0','00000000040b48037bf0504fc2418e1b0d75e35a55499e048274c08a0f3cb974','uncensored','2026-11-19 19:55:14'),(75,'20261119103030185',7,7,'green','0','00000000040b4803f1f2c881beff2932af92673ea18bcac4b9ab2a38091907cc','uncensored','2026-11-19 19:55:42'),(76,'20261119103030186',0,0,'red,violet','0','00000000040b4803e43de4699a7f5c1213e10b903085f052ad501576dff450fb','uncensored','2026-11-19 19:56:10'),(77,'20261119103030187',1,1,'green','0','00000000040b4803fb59c9dec9a299c5fbf3eb097839ba17a4020e25f4653531','uncensored','2026-11-19 20:00:22'),(78,'20261119103030188',5,5,'green,violet','0','00000000040b48038a9e27f41f3b18346cc871b4a37cb9c8b7acaa65e08775ec','uncensored','2026-11-19 20:00:52'),(79,'20261119103030189',7,7,'green','0','00000000040b48034c6333af7b87788cf8cd5fc662872a77773796c081c4f37c','uncensored','2026-11-19 20:05:16'),(80,'20261119103030190',1,1,'green','0','00000000040b4803bb8bdb422fe25a270fd87ede1d5d09eb9588f7410f96a1cb','uncensored','2026-11-19 20:05:44'),(81,'20261119103030191',2,2,'red','0','00000000040b4803e61b29291fb1dc9a8edfa107ae19ef2f652b4c94a97ff72e','uncensored','2026-11-19 20:10:21'),(82,'20261119103030192',2,2,'red','0','00000000040b4803f3497f5e6d1a96798a206db2897a69bb0fc3fdda18e7e92f','uncensored','2026-11-19 20:10:49'),(83,'20261119103030193',7,7,'green','0','00000000040b4803eea2934aca15dd4bf4762c111ed16d586607724b8b79f567','uncensored','2026-11-19 20:16:01'),(84,'20261119103030194',5,5,'green,violet','0','00000000040b4803c9acb7aa76eb02f4949155bf313636146eb3bcc65170fa95','uncensored','2026-11-19 20:20:09'),(85,'20261119103030195',4,4,'red','0','00000000040b480311c2ca40dfc68be70dabd64991f1630d65e92ffd71e4beab','uncensored','2026-11-19 20:21:04'),(86,'20261119103030196',1,1,'green','88142031','000000000540f0cf36282ffefcc6f64ffa7eb64da4d0f909745ace2a96e1a1cb','uncensored','2026-11-19 20:26:06'),(87,'20261119103030197',1,1,'green','88142165','000000000540f15548ec1ff38a4e33cbd99202ecab25a89395033d63acd6be1b','uncensored','2026-11-19 20:32:48');
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
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Per-user notification messages (payment callbacks, announcements)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_notifications`
--

LOCK TABLES `user_notifications` WRITE;
/*!40000 ALTER TABLE `user_notifications` DISABLE KEYS */;
INSERT INTO `user_notifications` VALUES (2,3,'Login Notification',0,'2026-11-19 12:28:29'),(3,4,'Login Notification',0,'2026-11-19 12:28:29'),(4,3,'Login Notification',0,'2026-11-19 12:29:30'),(5,4,'Login Notification',0,'2026-11-19 12:29:30'),(6,3,'Login Notification',0,'2026-11-19 12:30:05'),(7,5,'Login Notification',0,'2026-11-19 12:30:05'),(8,3,'Login Notification',0,'2026-11-19 12:30:28'),(9,7,'Login Notification',0,'2026-11-19 12:30:28'),(10,3,'Login Notification',0,'2026-11-19 12:31:07'),(11,9,'Login Notification',0,'2026-11-19 12:31:08'),(12,3,'Login Notification',0,'2026-11-19 12:33:08'),(13,3,'Login Notification',0,'2026-11-19 12:34:23'),(14,3,'Login Notification',0,'2026-11-19 12:34:55'),(15,3,'Login Notification',0,'2026-11-19 12:38:12'),(16,3,'Login Notification',0,'2026-11-19 12:43:03'),(17,3,'Login Notification',0,'2026-11-19 12:45:33'),(18,3,'Login Notification',0,'2026-11-19 12:58:29'),(19,10,'Login Notification',0,'2026-11-19 12:58:29'),(20,11,'Login Notification',0,'2026-11-19 13:03:41'),(21,3,'Login Notification',0,'2026-11-19 13:05:25'),(22,12,'Login Notification',0,'2026-11-19 13:05:25'),(23,3,'Login Notification',0,'2026-11-19 13:13:16'),(34,3,'Login Notification',0,'2026-11-19 14:22:18'),(35,3,'Support Chat',0,'2026-11-19 14:22:49'),(36,3,'Support Chat',0,'2026-11-19 14:22:54'),(37,3,'Login Notification',0,'2026-11-19 14:23:22'),(38,3,'Login Notification',0,'2026-11-19 14:24:10'),(39,3,'Support Chat',0,'2026-11-19 14:26:40'),(46,3,'Login Notification',0,'2026-11-19 15:34:59'),(47,24,'Login Notification',0,'2026-11-19 15:34:59'),(48,3,'Login Notification',0,'2026-11-19 15:35:03'),(49,11,'Login Notification',0,'2026-11-19 15:35:11'),(50,3,'Login Notification',0,'2026-11-19 15:35:21'),(51,3,'Login Notification',0,'2026-11-19 15:35:48'),(55,3,'Login Notification',0,'2026-11-19 15:36:34'),(56,3,'Login Notification',0,'2026-11-19 15:36:50'),(57,28,'Login Notification',0,'2026-11-19 15:36:50'),(58,3,'Login Notification',0,'2026-11-19 15:36:50'),(59,3,'Login Notification',0,'2026-11-19 15:38:14'),(60,29,'Login Notification',0,'2026-11-19 17:50:29'),(61,29,'Login Notification',0,'2026-11-19 18:10:01'),(62,29,'Login Notification',0,'2026-11-19 18:16:17'),(63,29,'Login Notification',0,'2026-11-19 18:26:13'),(65,29,'Login Notification',0,'2026-11-19 18:27:10'),(66,29,'Login Notification',0,'2026-11-19 18:44:43'),(67,30,'Login Notification',0,'2026-11-19 18:44:43'),(68,29,'Recharge Arrival',0,'2026-11-19 18:44:43'),(69,30,'Recharge Arrival',0,'2026-11-19 18:44:43'),(70,29,'Login Notification',0,'2026-11-19 18:45:20'),(71,31,'Login Notification',0,'2026-11-19 18:45:20'),(72,29,'Recharge Arrival',0,'2026-11-19 18:45:20'),(73,31,'Recharge Arrival',0,'2026-11-19 18:45:20'),(74,29,'Login Notification',0,'2026-11-19 18:45:28'),(75,29,'Login Notification',0,'2026-11-19 18:45:39'),(76,29,'Login Notification',0,'2026-11-19 18:47:14'),(77,32,'Login Notification',0,'2026-11-19 18:47:14'),(78,29,'Recharge Arrival',0,'2026-11-19 18:47:14'),(79,32,'Recharge Arrival',0,'2026-11-19 18:47:14'),(80,29,'Login Notification',0,'2026-11-19 18:49:37'),(81,33,'Login Notification',0,'2026-11-19 18:49:37'),(82,29,'Recharge Arrival',0,'2026-11-19 18:49:37'),(83,33,'Recharge Arrival',0,'2026-11-19 18:49:37'),(84,29,'Login Notification',0,'2026-11-19 18:50:34'),(85,29,'Login Notification',0,'2026-11-19 19:32:27');
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
INSERT INTO `user_wallets` VALUES (3,3,'2391.06','61',0,'33','2026-11-19 13:19:37'),(4,4,'33','0',0,'33','2026-11-19 12:28:29'),(5,5,'33','0',0,'33','2026-11-19 12:30:05'),(6,6,'33','0',0,'33','2026-11-19 12:30:15'),(7,7,'33','0',0,'33','2026-11-19 12:30:28'),(8,8,'33','0',0,'33','2026-11-19 12:30:46'),(9,9,'33','0',0,'33','2026-11-19 12:31:08'),(10,10,'33','0',0,'33','2026-11-19 12:58:29'),(11,11,'23','0',0,'33','2026-11-19 07:33:41'),(12,12,'33','0',0,'33','2026-11-19 13:05:25'),(29,28,'33','0',0,'33','2026-11-19 15:36:50'),(25,24,'33','0',0,'33','2026-11-19 15:34:59'),(28,27,'33','0',0,'33','2026-11-19 15:36:34'),(30,29,'3997','0',0,'33','2026-11-19 13:59:45'),(31,30,'233','0',0,'33','2026-11-19 13:14:43'),(32,31,'223','10',0,'33','2026-11-19 13:15:20'),(33,32,'223','10',0,'33','2026-11-19 13:17:14'),(34,33,'103','10',0,'33','2026-11-19 13:19:37');
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
INSERT INTO `users` VALUES (3,'9000000001','','181609b02b28507502a3afeb2a802525','',NULL,NULL,NULL,NULL,NULL,'SEED01','on',1,'2026-11-19 06:56:50',NULL,'127.0.0.1',NULL,'2026-11-19 15:38:14',0,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjMiLCJtb2JpbGUiOiI5MDAwMDAwMDAxIiwic3RhdHVzIjoiMSIsImV4cGlyZSI6MTc5NTE2OTI5NCwiaXNob251cCI6IjEyNy4wLjAuMSIsImNvZGVjaG9ya2FtdWthbGEiOiJNZW1iZXJST09UMDAxIn0.Uib8ydtxWvlSGKhZYWMmnHfgMw0gkuvB1uRGJNF7kr8','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/158.0.0.0 Safari/537.36','MemberROOT001',0,0,0,'2026-11-19 06:56:50'),(4,'9000000002','','52b19d638e8eb9872e3c147af9fb0eb8','SEED01','','','','','','785051000004','on',1,'2026-11-19 12:28:29','127.0.0.1','127.0.0.1','Test@2026','2026-11-19 12:29:30',0,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjQiLCJtb2JpbGUiOiI5MDAwMDAwMDAyIiwic3RhdHVzIjoiMSIsImV4cGlyZSI6MTc5NTE1Nzk3MCwiaXNob251cCI6IjEyNy4wLjAuMSIsImNvZGVjaG9ya2FtdWthbGEiOiJNZW1iZXJRMVMzTVlMQSJ9.FPlFdmC4uVD7GEtK-oYaRnU3_gd7cQF9mLg8p7RXLw4','','MemberQ1S3MYLA',0,0,0,'2026-11-19 06:58:29'),(5,'9000012526','','52b19d638e8eb9872e3c147af9fb0eb8','SEED01','','','','','','030858000005','on',1,'2026-11-19 12:30:05','127.0.0.1','127.0.0.1','Test@2026','2026-11-19 12:30:05',0,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjUiLCJtb2JpbGUiOiI5MDAwMDEyNTI2Iiwic3RhdHVzIjoiMSIsImV4cGlyZSI6MTc5NTE1ODAwNSwiaXNob251cCI6IjEyNy4wLjAuMSIsImNvZGVjaG9ya2FtdWthbGEiOiJNZW1iZXJDUjlTQTZKTyJ9.XJx2nhGW_wEWUdPBWKywl7CGqUyvhigXkCb-msyYU74','','MemberCR9SA6JO',0,0,0,'2026-11-19 07:00:05'),(6,'9000028510','','52b19d638e8eb9872e3c147af9fb0eb8','SEED01','','','','','','138097000006','on',1,'2026-11-19 12:30:15','127.0.0.1','127.0.0.1','Test@2026','2026-11-19 12:30:15',0,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NiwibW9iaWxlIjoiOTAwMDAyODUxMCIsInN0YXR1cyI6MSwiZXhwaXJlIjoxNzk1MTU4MDE1LCJpc2hvbnVwIjoiMTI3LjAuMC4xIiwiY29kZWNob3JrYW11a2FsYSI6Ik1lbWJlckNSTjg2QUVNIn0.QhWIWjVEqyOQK6iQGAO9LbGoUWIFZ4hHxDt4ehFlVps','curl/8.14.1','MemberCRN86AEM',0,0,0,'2026-11-19 07:00:15'),(7,'9000019265','','52b19d638e8eb9872e3c147af9fb0eb8','SEED01','','','','','','157320000007','on',1,'2026-11-19 12:30:28','127.0.0.1','127.0.0.1','Test@2026','2026-11-19 12:30:28',0,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjciLCJtb2JpbGUiOiI5MDAwMDE5MjY1Iiwic3RhdHVzIjoiMSIsImV4cGlyZSI6MTc5NTE1ODAyOCwiaXNob251cCI6IjEyNy4wLjAuMSIsImNvZGVjaG9ya2FtdWthbGEiOiJNZW1iZXJEQ0ozS0xHNSJ9.lr4P7bOhI82f1bUsZW21P2kmg3JPCVXTh2dY5Y5Hdto','','MemberDCJ3KLG5',0,0,0,'2026-11-19 07:00:28'),(8,'9000013128','','52b19d638e8eb9872e3c147af9fb0eb8','SEED01','','','','','','297529000008','on',1,'2026-11-19 12:30:46','127.0.0.1','127.0.0.1','Test@2026','2026-11-19 12:30:46',0,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6OCwibW9iaWxlIjoiOTAwMDAxMzEyOCIsInN0YXR1cyI6MSwiZXhwaXJlIjoxNzk1MTU4MDQ2LCJpc2hvbnVwIjoiMTI3LjAuMC4xIiwiY29kZWNob3JrYW11a2FsYSI6Ik1lbWJlcjdYRllIQzFFIn0.uwwaJIsOqQEPWlwrzstlAnErmR8aUeWA7U2PjDRLFtU','','Member7XFYHC1E',0,0,0,'2026-11-19 07:00:46'),(9,'9000011654','','52b19d638e8eb9872e3c147af9fb0eb8','SEED01','','','','','','743733000009','on',1,'2026-11-19 12:31:08','127.0.0.1','127.0.0.1','Test@2026','2026-11-19 12:31:08',0,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjkiLCJtb2JpbGUiOiI5MDAwMDExNjU0Iiwic3RhdHVzIjoiMSIsImV4cGlyZSI6MTc5NTE1ODA2OCwiaXNob251cCI6IjEyNy4wLjAuMSIsImNvZGVjaG9ya2FtdWthbGEiOiJNZW1iZXJUTFc2MElWTiJ9.Ac8mUIPFHkASCBWfRLTOiiVce12tfILHFOLzrDudwMA','','MemberTLW60IVN',0,0,0,'2026-11-19 07:01:08'),(10,'9000015143','','52b19d638e8eb9872e3c147af9fb0eb8','SEED01','','','','','','436138000010','on',1,'2026-11-19 12:58:29','127.0.0.1','127.0.0.1','Test@2026','2026-11-19 12:58:29',0,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjEwIiwibW9iaWxlIjoiOTAwMDAxNTE0MyIsInN0YXR1cyI6IjEiLCJleHBpcmUiOjE3OTUxNTk3MDksImlzaG9udXAiOiIxMjcuMC4wLjEiLCJjb2RlY2hvcmthbXVrYWxhIjoiTWVtYmVyMkNCRFM3WlkifQ.l0tuVhAgYH4qyZOfMg2mBfioddmLIbu9Gg0Ic-z_aHo','','Member2CBDS7ZY',0,0,0,'2026-11-19 07:28:29'),(11,'9000000007','','d431c238300ff37beb433ce7e1ba8ebb','SEED01','','','','','','100416000011','on',1,'2026-11-19 12:58:37','127.0.0.1','127.0.0.1','User2026x','2026-11-19 15:35:11',0,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjExIiwibW9iaWxlIjoiOTAwMDAwMDAwNyIsInN0YXR1cyI6IjEiLCJleHBpcmUiOjE3OTUxNjkxMTEsImlzaG9udXAiOiIxMjcuMC4wLjEiLCJjb2RlY2hvcmthbXVrYWxhIjoiTWVtYmVyMVRVWEdMN1kifQ.jcxHC1ZufA-j403pRteiHb6Xm07stizTSis9XyRcsaw','','Member1TUXGL7Y',0,0,0,'2026-11-19 07:28:37'),(12,'9000010086','','52b19d638e8eb9872e3c147af9fb0eb8','SEED01','','','','','','014944000012','on',1,'2026-11-19 13:05:25','127.0.0.1','127.0.0.1','Test@2026','2026-11-19 13:05:25',0,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjEyIiwibW9iaWxlIjoiOTAwMDAxMDA4NiIsInN0YXR1cyI6IjEiLCJleHBpcmUiOjE3OTUxNjAxMjUsImlzaG9udXAiOiIxMjcuMC4wLjEiLCJjb2RlY2hvcmthbXVrYWxhIjoiTWVtYmVyTzJNRzZVVEQifQ.Wsnj_heiB6rV-i6wbhWEZYuckQKgZgXMnfQ4u24Opb0','','MemberO2MG6UTD',0,0,0,'2026-11-19 07:35:25'),(24,'9000015627','','52b19d638e8eb9872e3c147af9fb0eb8','SEED01','','','','','','106182000013','on',1,'2026-11-19 15:34:59','127.0.0.1','127.0.0.1','Test@2026','2026-11-19 15:34:59',0,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjI0IiwibW9iaWxlIjoiOTAwMDAxNTYyNyIsInN0YXR1cyI6IjEiLCJleHBpcmUiOjE3OTUxNjkwOTksImlzaG9udXAiOiIxMjcuMC4wLjEiLCJjb2RlY2hvcmthbXVrYWxhIjoiTWVtYmVyNjhXTUNSR1MifQ.benyvkz2TO85UCeYTMHbqv07oqvnTSU7wGI6byaS-ZY','','Member68WMCRGS',0,0,0,'2026-11-19 10:04:59'),(28,'9000014538','','52b19d638e8eb9872e3c147af9fb0eb8','SEED01','','','','','','855092000028','on',1,'2026-11-19 15:36:50','127.0.0.1','127.0.0.1','Test@2026','2026-11-19 15:36:50',0,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjI4IiwibW9iaWxlIjoiOTAwMDAxNDUzOCIsInN0YXR1cyI6IjEiLCJleHBpcmUiOjE3OTUxNjkyMTAsImlzaG9udXAiOiIxMjcuMC4wLjEiLCJjb2RlY2hvcmthbXVrYWxhIjoiTWVtYmVyMEhDRE02S1MifQ.TZxnBz_hBiAsFzZKcHfU6yqSyn2KBoQtXv2Lj-_k1ZE','','Member0HCDM6KS',0,0,0,'2026-11-19 10:06:50'),(27,'9000013497','','52b19d638e8eb9872e3c147af9fb0eb8','SEED01','','','','','','508190000025','on',1,'2026-11-19 15:36:34','127.0.0.1','127.0.0.1','Test@2026','2026-11-19 15:36:34',0,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjcsIm1vYmlsZSI6IjkwMDAwMTM0OTciLCJzdGF0dXMiOjEsImV4cGlyZSI6MTc5NTE2OTE5NCwiaXNob251cCI6IjEyNy4wLjAuMSIsImNvZGVjaG9ya2FtdWthbGEiOiJNZW1iZXJMQ1oyRjFHTSJ9.WYM1y2DStnj1-MXdU8bVYEiqLBJ4ny6ftpGRyut2lzw','','MemberLCZ2F1GM',0,0,0,'2026-11-19 10:06:34'),(29,'9990012345','','662af1cd1976f09a9f8cecc868ccc0a2','SEED01','','','','','','379747000029','on',1,'2026-11-19 17:46:43','127.0.0.1','127.0.0.1','Test12345','2026-11-19 19:32:27',0,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjI5IiwibW9iaWxlIjoiOTk5MDAxMjM0NSIsInN0YXR1cyI6IjEiLCJleHBpcmUiOjE3OTUxODMzNDcsImlzaG9udXAiOiIxMjcuMC4wLjEiLCJjb2RlY2hvcmthbXVrYWxhIjoiTWVtYmVyWVhSNjFDSk0ifQ.gHW8yTDi8rujPSGuOujgB95vjD3UmSQGcFuU0tEXS4k','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/158.0.0.0 Safari/537.36','MemberYXR61CJM',0,0,0,'2026-11-19 12:16:43'),(30,'9990063743','','662af1cd1976f09a9f8cecc868ccc0a2','379747000029','SEED01','','','','','959940000030','on',1,'2026-11-19 18:44:43','127.0.0.1','127.0.0.1','Test12345','2026-11-19 18:44:43',1,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjMwIiwibW9iaWxlIjoiOTk5MDA2Mzc0MyIsInN0YXR1cyI6IjEiLCJleHBpcmUiOjE3OTUxODA0ODMsImlzaG9udXAiOiIxMjcuMC4wLjEiLCJjb2RlY2hvcmthbXVrYWxhIjoiTWVtYmVyWk5TSjZYN0sifQ.E8JdTDJ2Dc5Gje7u8GBPiXXIpTzMIqdxiJpupgWibAA','','MemberZNSJ6X7K',0,0,0,'2026-11-19 13:14:43'),(31,'9990042593','','662af1cd1976f09a9f8cecc868ccc0a2','379747000029','SEED01','','','','','137535000031','on',1,'2026-11-19 18:45:20','127.0.0.1','127.0.0.1','Test12345','2026-11-19 18:45:20',1,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjMxIiwibW9iaWxlIjoiOTk5MDA0MjU5MyIsInN0YXR1cyI6IjEiLCJleHBpcmUiOjE3OTUxODA1MjAsImlzaG9udXAiOiIxMjcuMC4wLjEiLCJjb2RlY2hvcmthbXVrYWxhIjoiTWVtYmVyTEY3WjJUVk0ifQ.etWt5tRCGXxv7xJnZPXcoRESO-e_fST37vUMDiYV-ho','','MemberLF7Z2TVM',0,0,0,'2026-11-19 13:15:20'),(32,'9990069609','','662af1cd1976f09a9f8cecc868ccc0a2','379747000029','SEED01','','','','','923617000032','on',1,'2026-11-19 18:47:14','127.0.0.1','127.0.0.1','Test12345','2026-11-19 18:47:14',1,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjMyIiwibW9iaWxlIjoiOTk5MDA2OTYwOSIsInN0YXR1cyI6IjEiLCJleHBpcmUiOjE3OTUxODA2MzQsImlzaG9udXAiOiIxMjcuMC4wLjEiLCJjb2RlY2hvcmthbXVrYWxhIjoiTWVtYmVyRDFHSVRGSzYifQ.yLcUjXVJRWR00dTfCu_yDTsHxRqajq_fQB-s8kp77tI','','MemberD1GITFK6',0,0,0,'2026-11-19 13:17:14'),(33,'9990052785','','662af1cd1976f09a9f8cecc868ccc0a2','379747000029','SEED01','','','','','806446000033','on',1,'2026-11-19 18:49:37','127.0.0.1','127.0.0.1','Test12345','2026-11-19 18:49:37',1,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjMzIiwibW9iaWxlIjoiOTk5MDA1Mjc4NSIsInN0YXR1cyI6IjEiLCJleHBpcmUiOjE3OTUxODA3NzcsImlzaG9udXAiOiIxMjcuMC4wLjEiLCJjb2RlY2hvcmthbXVrYWxhIjoiTWVtYmVyNU9SMlhBUUcifQ.ki5ITJjekB5J4XRqqgPqiqvjaycMBrEnpaJaPCDUsEU','','Member5OR2XAQG',0,0,0,'2026-11-19 13:19:37');
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
-- Table structure for table `wingo_api_config`
--

DROP TABLE IF EXISTS `wingo_api_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wingo_api_config` (
  `id` tinyint NOT NULL DEFAULT '1',
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `api_base` varchar(300) NOT NULL DEFAULT 'https://wingo.voterx.xyz/index.php',
  `api_key` varchar(200) NOT NULL DEFAULT 'key122842685683',
  `timeout_sec` tinyint NOT NULL DEFAULT '8',
  `en_30s` tinyint(1) NOT NULL DEFAULT '1',
  `en_1m` tinyint(1) NOT NULL DEFAULT '1',
  `en_3m` tinyint(1) NOT NULL DEFAULT '1',
  `en_5m` tinyint(1) NOT NULL DEFAULT '1',
  `en_10m` tinyint(1) NOT NULL DEFAULT '1',
  `param_30s` varchar(10) NOT NULL DEFAULT '30S',
  `param_1m` varchar(10) NOT NULL DEFAULT '1M',
  `param_3m` varchar(10) NOT NULL DEFAULT '3M',
  `param_5m` varchar(10) NOT NULL DEFAULT '5M',
  `param_10m` varchar(10) NOT NULL DEFAULT '10M',
  `proxy_tpls` text,
  `last_good_path` tinyint NOT NULL DEFAULT '0',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wingo_api_config`
--

LOCK TABLES `wingo_api_config` WRITE;
/*!40000 ALTER TABLE `wingo_api_config` DISABLE KEYS */;
INSERT INTO `wingo_api_config` VALUES (1,1,'https://wingo.voterx.xyz/index.php','key122842685683',8,1,1,1,1,0,'30S','1M','3M','5M','10M','https://api.allorigins.win/raw?url={URL_ENC}\nhttps://api.codetabs.com/v1/proxy?quest={URL_ENC}\nhttps://corsproxy.io/?url={URL_ENC}\nhttps://cors.eu.org/{URL}',1,'2026-11-19 14:50:09');
/*!40000 ALTER TABLE `wingo_api_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wingo_api_log`
--

DROP TABLE IF EXISTS `wingo_api_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wingo_api_log` (
  `log_id` bigint NOT NULL AUTO_INCREMENT,
  `game_key` varchar(10) NOT NULL,
  `local_period` varchar(30) NOT NULL,
  `api_period` varchar(30) DEFAULT NULL,
  `api_number` int DEFAULT NULL,
  `api_colour` varchar(60) DEFAULT NULL,
  `status` varchar(20) NOT NULL,
  `message` varchar(500) DEFAULT NULL,
  `latency_ms` int DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`log_id`),
  KEY `idx_created` (`created_at`),
  KEY `idx_game` (`game_key`)
) ENGINE=InnoDB AUTO_INCREMENT=250 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wingo_api_log`
--

LOCK TABLES `wingo_api_log` WRITE;
/*!40000 ALTER TABLE `wingo_api_log` DISABLE KEYS */;
INSERT INTO `wingo_api_log` VALUES (1,'30s','20261119100042316','20261119100042316',9,'green','used','API result applied (exact period match)',1,'2026-11-19 13:49:58'),(2,'1m','20261119100011159','20261119100011159',8,'red','used','API result applied (exact period match)',1,'2026-11-19 13:52:58'),(3,'30s','20261119100042318','20261119100042318',5,'green,violet','used','API result applied (exact period match)',1,'2026-11-19 13:52:58'),(4,'1m','20261119100011163','20261119100011163',0,'red,violet','used','API result applied (exact period match)',1,'2026-11-19 13:55:35'),(5,'30s','20261119100042326','20261119100042326',9,'green','used','API result applied (exact period match)',1,'2026-11-19 13:55:35'),(6,'5m','20261119100030232','20261119100030232',7,'green','used','API result applied (exact period match)',1,'2026-11-19 13:55:35'),(7,'1m','20261119100011166','20261119100011166',9,'green','used','API result applied (exact period match)',1,'2026-11-19 13:56:03'),(8,'30s','20261119100042332','20261119100042332',7,'green','used','API result applied (exact period match)',1,'2026-11-19 13:56:03'),(9,'30s','20261119100042333','20261119100042333',0,'red,violet','used','API result applied (exact period match)',1,'2026-11-19 13:56:31'),(10,'1m','20261119100011167','20261119100011167',2,'red','used','API result applied (exact period match)',1,'2026-11-19 13:57:26'),(11,'30s','20261119100042334','20261119100042334',3,'green','used','API result applied (exact period match)',1,'2026-11-19 13:57:26'),(12,'3m','20261119100020387','20261119100020387',2,'red','used','API result applied (exact period match)',1,'2026-11-19 13:57:26'),(13,'30s','20261119100042335','20261119100042335',6,'red','used','API result applied (exact period match)',1,'2026-11-19 13:57:54'),(14,'1m','20261119100011168',NULL,3,NULL,'manual','Admin prediction applied (no bets)',NULL,'2026-11-19 13:58:22'),(15,'30s','20261119100042336','20261119100042336',9,'green','used','API result applied (exact period match)',1,'2026-11-19 13:58:22'),(16,'30s','20261119100042337','20261119100042337',2,'red','used','API result applied (exact period match)',1,'2026-11-19 13:58:50'),(17,'1m','20261119100011169','20261119100011169',8,'red','used','API result applied (exact period match)',1,'2026-11-19 13:59:17'),(18,'30s','20261119100042338','20261119100042338',5,'green,violet','used','API result applied (exact period match)',1,'2026-11-19 13:59:18'),(19,'30s','20261119100042339','20261119100042339',8,'red','used','API result applied (exact period match)',1,'2026-11-19 13:59:45'),(20,'1m','20261119100011170','20261119100011170',1,'green','used','API result applied (exact period match)',1,'2026-11-19 14:00:13'),(21,'30s','20261119100042340','20261119100042340',1,'green','used','API result applied (exact period match)',1,'2026-11-19 14:00:13'),(22,'3m','20261119100020390','20261119100020390',1,'green','used','API result applied (exact period match)',1,'2026-11-19 14:00:13'),(23,'5m','20261119100030234','20261119100030234',3,'green','used','API result applied (exact period match)',1,'2026-11-19 14:00:13'),(24,'30s','20261119100042341','20261119100042341',4,'red','used','API result applied (exact period match)',1,'2026-11-19 14:00:40'),(25,'1m','20261119100011171',NULL,NULL,NULL,'error','API fetch failed: HTTP 0 curl#28 Operation timed out after 8002 milliseconds with 0 bytes received',18006,'2026-11-19 14:01:25'),(26,'30s','20261119100042342','20261119100042342',7,'green','used','API result applied (exact period match)',11424,'2026-11-19 14:01:37'),(27,'1m','20261119100011171',NULL,NULL,NULL,'error','API fetch failed: HTTP 0 curl#7 Failed to connect to 127.0.0.1 port 3001 after 0 ms: Could not connect to server',2001,'2026-11-19 14:01:52'),(28,'1m','20261119100011171','20261119100011171',4,'red','used','API result applied (exact period match)',1,'2026-11-19 14:02:17'),(29,'30s','20261119100042344','20261119100042344',3,'green','used','API result applied (exact period match)',1,'2026-11-19 14:02:18'),(30,'30s','20261119100042345','20261119100042345',6,'red','used','API result applied (exact period match)',1,'2026-11-19 14:02:45'),(31,'1m','20261119100011173','20261119100011173',0,'red,violet','used','API result applied (exact period match)',1,'2026-11-19 14:03:13'),(32,'30s','20261119100042346','20261119100042346',9,'green','used','API result applied (exact period match)',1,'2026-11-19 14:03:13'),(33,'3m','20261119100020391','20261119100020391',4,'red','used','API result applied (exact period match)',1,'2026-11-19 14:03:13'),(34,'30s','20261119100042347','20261119100042347',2,'red','used','API result applied (exact period match)',1,'2026-11-19 14:03:41'),(35,'1m','20261119100011174','20261119100011174',3,'green','used','API result applied (exact period match)',1,'2026-11-19 14:04:08'),(36,'30s','20261119100042348','20261119100042348',5,'green,violet','used','API result applied (exact period match)',1,'2026-11-19 14:04:09'),(37,'30s','20261119100042349','20261119100042349',8,'red','used','API result applied (exact period match)',1,'2026-11-19 14:04:36'),(38,'1m','20261119100011175',NULL,NULL,NULL,'error','API fetch failed: HTTP 403',4643,'2026-11-19 14:05:08'),(39,'30s','20261119100042350',NULL,NULL,NULL,'error','API fetch failed: HTTP 403',3325,'2026-11-19 14:05:12'),(40,'5m','20261119100030235',NULL,NULL,NULL,'error','API fetch failed: HTTP 403',3251,'2026-11-19 14:05:15'),(41,'1m','20261119100011175',NULL,NULL,NULL,'error','API fetch failed: HTTP 403',4245,'2026-11-19 14:05:36'),(42,'30s','20261119100042350',NULL,NULL,NULL,'error','API fetch failed: HTTP 403',5224,'2026-11-19 14:05:42'),(43,'5m','20261119100030235',NULL,NULL,NULL,'error','API fetch failed: HTTP 403',4115,'2026-11-19 14:05:46'),(44,'1m','20261119100011175',NULL,NULL,NULL,'error','API fetch failed: HTTP 403',3960,'2026-11-19 14:06:03'),(45,'30s','20261119100042350',NULL,NULL,NULL,'error','API fetch failed: HTTP 403',2610,'2026-11-19 14:06:06'),(46,'5m','20261119100030235',NULL,NULL,NULL,'error','API fetch failed: HTTP 403',3294,'2026-11-19 14:06:10'),(47,'1m','20261119100011175',NULL,NULL,NULL,'error','API fetch failed: HTTP 403',4296,'2026-11-19 14:06:32'),(48,'30s','20261119100042350',NULL,NULL,NULL,'error','API fetch failed: HTTP 403',6032,'2026-11-19 14:06:38'),(49,'3m','20261119100020392',NULL,NULL,NULL,'error','API fetch failed: HTTP 403',4328,'2026-11-19 14:06:42'),(50,'1m','20261119100011175',NULL,NULL,NULL,'error','API fetch failed: HTTP 403',3924,'2026-11-19 14:06:59'),(51,'30s','20261119100042350',NULL,NULL,NULL,'error','API fetch failed: HTTP 403',4359,'2026-11-19 14:07:03'),(52,'3m','20261119100020392',NULL,NULL,NULL,'error','API fetch failed: HTTP 403',4051,'2026-11-19 14:07:08'),(53,'1m','20261119100011175',NULL,NULL,NULL,'error','API fetch failed: HTTP 403',4033,'2026-11-19 14:07:27'),(54,'30s','20261119100042350',NULL,NULL,NULL,'error','API fetch failed: HTTP 403',3988,'2026-11-19 14:07:31'),(55,'1m','20261119100011175',NULL,NULL,NULL,'error','API fetch failed: HTTP 403',3895,'2026-11-19 14:07:55'),(56,'30s','20261119100042350',NULL,NULL,NULL,'error','API fetch failed: HTTP 403',3233,'2026-11-19 14:07:58'),(57,'1m','20261119100011175',NULL,NULL,NULL,'error','API fetch failed: HTTP 403',3903,'2026-11-19 14:08:23'),(58,'30s','20261119100042350',NULL,NULL,NULL,'error','API fetch failed: HTTP 403',3303,'2026-11-19 14:08:26'),(59,'1m','20261119100011175',NULL,NULL,NULL,'error','API fetch failed: HTTP 403',3923,'2026-11-19 14:08:50'),(60,'30s','20261119100042350',NULL,NULL,NULL,'error','API fetch failed: HTTP 403',3236,'2026-11-19 14:08:54'),(61,'1m','20261119100011175',NULL,NULL,NULL,'error','API fetch failed: HTTP 403',3987,'2026-11-19 14:09:18'),(62,'30s','20261119100042350',NULL,NULL,NULL,'error','API fetch failed: HTTP 403',3264,'2026-11-19 14:09:22'),(63,'3m','20261119100020392',NULL,NULL,NULL,'error','API fetch failed: HTTP 403',3228,'2026-11-19 14:09:25'),(64,'1m','20261119100011175',NULL,NULL,NULL,'error','API fetch failed: HTTP 403',3918,'2026-11-19 14:09:46'),(65,'30s','20261119100042350',NULL,NULL,NULL,'error','API fetch failed: HTTP 403',3232,'2026-11-19 14:09:49'),(66,'3m','20261119100020392',NULL,NULL,NULL,'error','API fetch failed: HTTP 403',2598,'2026-11-19 14:09:52'),(67,'1m','20261119100011175',NULL,NULL,NULL,'error','API fetch failed: HTTP 403',3290,'2026-11-19 14:10:13'),(68,'30s','20261119100042350',NULL,NULL,NULL,'error','API fetch failed: HTTP 403',3894,'2026-11-19 14:10:17'),(69,'5m','20261119100030235',NULL,NULL,NULL,'error','API fetch failed: HTTP 403',3983,'2026-11-19 14:10:21'),(70,'1m','20261119100011175',NULL,NULL,NULL,'error','API fetch failed: HTTP 403',3986,'2026-11-19 14:10:41'),(71,'30s','20261119100042350',NULL,NULL,NULL,'error','API fetch failed: HTTP 403',3435,'2026-11-19 14:10:45'),(72,'5m','20261119100030235',NULL,NULL,NULL,'error','API fetch failed: HTTP 403',3278,'2026-11-19 14:10:48'),(73,'1m','20261119100011175',NULL,NULL,NULL,'error','API fetch failed: HTTP 403',4115,'2026-11-19 14:11:09'),(74,'30s','20261119100042350',NULL,NULL,NULL,'error','API fetch failed: HTTP 403',3990,'2026-11-19 14:11:13'),(75,'1m','20261119100011175',NULL,NULL,NULL,'error','API fetch failed: HTTP 403',4057,'2026-11-19 14:11:37'),(76,'30s','20261119100042350',NULL,NULL,NULL,'error','API fetch failed: HTTP 403',4077,'2026-11-19 14:11:41'),(77,'1m','20261119100011175',NULL,NULL,NULL,'error','API fetch failed: HTTP 403',3261,'2026-11-19 14:12:04'),(78,'30s','20261119100042350',NULL,NULL,NULL,'error','API fetch failed: HTTP 403',3891,'2026-11-19 14:12:08'),(79,'3m','20261119100020392',NULL,NULL,NULL,'error','API fetch failed: HTTP 403',3245,'2026-11-19 14:12:11'),(80,'1m','20261119100011175',NULL,NULL,NULL,'error','API fetch failed: HTTP 403',3891,'2026-11-19 14:12:33'),(81,'30s','20261119100042350',NULL,NULL,NULL,'error','API fetch failed: HTTP 403',3222,'2026-11-19 14:12:36'),(82,'3m','20261119100020392',NULL,NULL,NULL,'error','API fetch failed: HTTP 403',3226,'2026-11-19 14:12:39'),(83,'1m','20261119100011175',NULL,NULL,NULL,'error','API fetch failed: HTTP 403',3922,'2026-11-19 14:13:01'),(84,'30s','20261119100042350',NULL,NULL,NULL,'error','API fetch failed: HTTP 403',3308,'2026-11-19 14:13:04'),(85,'3m','20261119100020392',NULL,NULL,NULL,'error','API fetch failed: HTTP 403',4103,'2026-11-19 14:13:09'),(86,'1m','20261119100011175',NULL,NULL,NULL,'error','API fetch failed: HTTP 403',3983,'2026-11-19 14:13:29'),(87,'30s','20261119100042350',NULL,NULL,NULL,'error','API fetch failed: HTTP 403',3284,'2026-11-19 14:13:33'),(88,'1m','20261119100011175',NULL,NULL,NULL,'error','API fetch failed: HTTP 403',3331,'2026-11-19 14:13:57'),(89,'30s','20261119100042350',NULL,NULL,NULL,'error','API fetch failed: HTTP 403',4311,'2026-11-19 14:14:01'),(90,'1m','20261119100011175',NULL,NULL,NULL,'error','API fetch failed: HTTP 403',3317,'2026-11-19 14:14:25'),(91,'30s','20261119100042350',NULL,NULL,NULL,'error','API fetch failed: HTTP 403',3910,'2026-11-19 14:14:29'),(92,'1m','20261119100011175',NULL,NULL,NULL,'error','API fetch failed: HTTP 403',3266,'2026-11-19 14:14:53'),(93,'30s','20261119100042350',NULL,NULL,NULL,'error','API fetch failed: HTTP 403',3944,'2026-11-19 14:14:57'),(94,'1m','20261119100011175',NULL,NULL,NULL,'error','API fetch failed: HTTP 403',3290,'2026-11-19 14:15:21'),(95,'30s','20261119100042350',NULL,NULL,NULL,'error','API fetch failed: HTTP 403',2607,'2026-11-19 14:15:23'),(96,'3m','20261119100020392',NULL,NULL,NULL,'error','API fetch failed: HTTP 403',3365,'2026-11-19 14:15:27'),(97,'5m','20261119100030235',NULL,NULL,NULL,'error','API fetch failed: HTTP 403',4031,'2026-11-19 14:15:31'),(98,'1m','20261119100011175',NULL,NULL,NULL,'error','API fetch failed: HTTP 403',3933,'2026-11-19 14:15:49'),(99,'30s','20261119100042350',NULL,NULL,NULL,'error','API fetch failed: HTTP 403',3897,'2026-11-19 14:15:53'),(100,'3m','20261119100020392',NULL,NULL,NULL,'error','API fetch failed: HTTP 403',3259,'2026-11-19 14:15:56'),(101,'5m','20261119100030235',NULL,NULL,NULL,'error','API fetch failed: HTTP 403',4019,'2026-11-19 14:16:01'),(102,'1m','20261119100011175',NULL,NULL,NULL,'error','API fetch failed: HTTP 403',3970,'2026-11-19 14:16:18'),(103,'30s','20261119100042350',NULL,NULL,NULL,'error','API fetch failed: HTTP 403',3992,'2026-11-19 14:16:22'),(104,'1m','20261119100011175',NULL,NULL,NULL,'error','API fetch failed: HTTP 403',4007,'2026-11-19 14:16:45'),(105,'30s','20261119100042350',NULL,NULL,NULL,'error','API fetch failed: HTTP 403',3904,'2026-11-19 14:16:50'),(106,'1m','20261119100011175',NULL,NULL,NULL,'error','API fetch failed: HTTP 403',3943,'2026-11-19 14:17:13'),(107,'30s','20261119100042350',NULL,NULL,NULL,'error','API fetch failed: HTTP 403',3262,'2026-11-19 14:17:17'),(108,'1m','20261119100011175',NULL,NULL,NULL,'error','API fetch failed: HTTP 403',3495,'2026-11-19 14:17:41'),(109,'30s','20261119100042350',NULL,NULL,NULL,'error','API fetch failed: HTTP 403',2711,'2026-11-19 14:17:44'),(110,'1m','20261119100011175',NULL,NULL,NULL,'error','API fetch failed: HTTP 403',3960,'2026-11-19 14:18:09'),(111,'30s','20261119100042350',NULL,NULL,NULL,'error','API fetch failed: HTTP 403',3276,'2026-11-19 14:18:12'),(112,'3m','20261119100020392',NULL,NULL,NULL,'error','API fetch failed: HTTP 403',3917,'2026-11-19 14:18:16'),(113,'1m','20261119100011175',NULL,NULL,NULL,'error','API fetch failed: HTTP 403',4267,'2026-11-19 14:18:37'),(114,'30s','20261119100042350',NULL,NULL,NULL,'error','API fetch failed: HTTP 403',3929,'2026-11-19 14:18:42'),(115,'3m','20261119100020392',NULL,NULL,NULL,'error','API fetch failed: HTTP 403',3330,'2026-11-19 14:18:45'),(116,'1m','20261119100011175',NULL,NULL,NULL,'error','API fetch failed: HTTP 403',3983,'2026-11-19 14:19:05'),(117,'30s','20261119100042350',NULL,NULL,NULL,'error','API fetch failed: HTTP 403',4110,'2026-11-19 14:19:09'),(118,'1m','20261119100011175',NULL,NULL,NULL,'error','API fetch failed: HTTP 403',3889,'2026-11-19 14:19:32'),(119,'30s','20261119100042350',NULL,NULL,NULL,'error','API fetch failed: HTTP 403',3262,'2026-11-19 14:19:36'),(120,'1m','20261119100011175',NULL,NULL,NULL,'error','API fetch failed: HTTP 403',3962,'2026-11-19 14:20:00'),(121,'30s','20261119100042350',NULL,NULL,NULL,'error','API fetch failed: HTTP 403',4303,'2026-11-19 14:20:05'),(122,'1m','20261119100011175',NULL,NULL,NULL,'error','API fetch failed: HTTP 403',3923,'2026-11-19 14:20:28'),(123,'30s','20261119100042350',NULL,NULL,NULL,'error','API fetch failed: HTTP 403',3212,'2026-11-19 14:20:32'),(124,'5m','20261119100030235',NULL,NULL,NULL,'error','API fetch failed: HTTP 403',3934,'2026-11-19 14:20:35'),(125,'1m','20261119100011175',NULL,NULL,NULL,'error','API fetch failed: HTTP 403',3983,'2026-11-19 14:20:56'),(126,'30s','20261119100042350',NULL,NULL,NULL,'error','API fetch failed: HTTP 403',3326,'2026-11-19 14:21:00'),(127,'5m','20261119100030235',NULL,NULL,NULL,'error','API fetch failed: HTTP 403',3423,'2026-11-19 14:21:03'),(128,'1m','20261119100011175',NULL,NULL,NULL,'error','API fetch failed: HTTP 403',3907,'2026-11-19 14:21:24'),(129,'30s','20261119100042350',NULL,NULL,NULL,'error','API fetch failed: HTTP 403',3953,'2026-11-19 14:21:28'),(130,'3m','20261119100020392',NULL,NULL,NULL,'error','API fetch failed: HTTP 403',3937,'2026-11-19 14:21:32'),(131,'1m','20261119100011175',NULL,NULL,NULL,'error','API fetch failed: HTTP 403',3944,'2026-11-19 14:21:52'),(132,'30s','20261119100042350',NULL,NULL,NULL,'error','API fetch failed: HTTP 403',3237,'2026-11-19 14:21:56'),(133,'3m','20261119100020392',NULL,NULL,NULL,'error','API fetch failed: HTTP 403',3295,'2026-11-19 14:21:59'),(134,'1m','20261119100011175',NULL,NULL,NULL,'error','API fetch failed: HTTP 403',3940,'2026-11-19 14:22:19'),(135,'30s','20261119100042350',NULL,NULL,NULL,'error','API fetch failed: HTTP 403',3960,'2026-11-19 14:22:24'),(136,'1m','20261119100011175',NULL,NULL,NULL,'error','API fetch failed: HTTP 403',3985,'2026-11-19 14:22:47'),(137,'30s','20261119100042350',NULL,NULL,NULL,'error','API fetch failed: HTTP 403',2578,'2026-11-19 14:22:50'),(138,'1m','20261119100011175',NULL,NULL,NULL,'error','API fetch failed: HTTP 403',3905,'2026-11-19 14:23:15'),(139,'30s','20261119100042350',NULL,NULL,NULL,'error','API fetch failed: HTTP 403',3226,'2026-11-19 14:23:19'),(140,'1m','20261119100011175',NULL,NULL,NULL,'error','API fetch failed: HTTP 403',4062,'2026-11-19 14:23:43'),(141,'30s','20261119100042350',NULL,NULL,NULL,'error','API fetch failed: HTTP 403',4016,'2026-11-19 14:23:47'),(142,'1m','20261119100011175',NULL,NULL,NULL,'error','API fetch failed: HTTP 403',4183,'2026-11-19 14:24:11'),(143,'30s','20261119100042350',NULL,NULL,NULL,'error','API fetch failed: HTTP 403',4051,'2026-11-19 14:24:15'),(144,'3m','20261119100020392',NULL,NULL,NULL,'error','API fetch failed: HTTP 403',4108,'2026-11-19 14:24:19'),(145,'1m','20261119100011175',NULL,NULL,NULL,'error','API fetch failed: HTTP 403',4131,'2026-11-19 14:24:39'),(146,'30s','20261119100042350',NULL,NULL,NULL,'error','API fetch failed: HTTP 403',4093,'2026-11-19 14:24:44'),(147,'3m','20261119100020392',NULL,NULL,NULL,'error','API fetch failed: HTTP 403',3387,'2026-11-19 14:24:47'),(148,'1m','20261119100011175',NULL,NULL,NULL,'error','API fetch failed: HTTP 403',3964,'2026-11-19 14:25:07'),(149,'30s','20261119100042350',NULL,NULL,NULL,'error','API fetch failed: HTTP 403',3441,'2026-11-19 14:25:10'),(150,'5m','20261119100030235',NULL,NULL,NULL,'error','API fetch failed: HTTP 403',3246,'2026-11-19 14:25:14'),(151,'1m','20261119100011175',NULL,NULL,NULL,'error','API fetch failed: HTTP 403',3437,'2026-11-19 14:25:34'),(152,'30s','20261119100042350',NULL,NULL,NULL,'error','API fetch failed: HTTP 403',4025,'2026-11-19 14:25:38'),(153,'5m','20261119100030235',NULL,NULL,NULL,'error','API fetch failed: HTTP 403',3903,'2026-11-19 14:25:42'),(154,'1m','20261119100011175',NULL,NULL,NULL,'error','API fetch failed: HTTP 403',4196,'2026-11-19 14:26:03'),(155,'30s','20261119100042350',NULL,NULL,NULL,'error','API fetch failed: HTTP 403',3285,'2026-11-19 14:26:06'),(156,'5m','20261119100030235',NULL,NULL,NULL,'error','API fetch failed: HTTP 403',3454,'2026-11-19 14:26:10'),(157,'1m','20261119100011175',NULL,NULL,NULL,'error','API fetch failed: HTTP 403',3950,'2026-11-19 14:26:30'),(158,'30s','20261119100042350',NULL,NULL,NULL,'error','API fetch failed: HTTP 403',3255,'2026-11-19 14:26:34'),(159,'1m','20261119100011175',NULL,NULL,NULL,'error','API fetch failed: HTTP 403',3950,'2026-11-19 14:26:58'),(160,'30s','20261119100042350',NULL,NULL,NULL,'error','API fetch failed: HTTP 403',3268,'2026-11-19 14:27:02'),(161,'1m','20261119100011175',NULL,NULL,NULL,'error','API fetch failed: HTTP 403',3955,'2026-11-19 14:27:26'),(162,'30s','20261119100042350',NULL,NULL,NULL,'error','API fetch failed: HTTP 403',3246,'2026-11-19 14:27:30'),(163,'3m','20261119100020392',NULL,NULL,NULL,'error','API fetch failed: HTTP 403',3267,'2026-11-19 14:27:33'),(164,'1m','20261119100011175',NULL,NULL,NULL,'error','API fetch failed: HTTP 403',3424,'2026-11-19 14:27:53'),(165,'30s','20261119100042350',NULL,NULL,NULL,'error','API fetch failed: HTTP 403',3964,'2026-11-19 14:27:57'),(166,'3m','20261119100020392',NULL,NULL,NULL,'error','API fetch failed: HTTP 403',3272,'2026-11-19 14:28:01'),(167,'1m','20261119100011175',NULL,NULL,NULL,'error','API fetch failed: HTTP 403',3911,'2026-11-19 14:28:21'),(168,'30s','20261119100042350',NULL,NULL,NULL,'error','API fetch failed: HTTP 403',3974,'2026-11-19 14:28:25'),(169,'1m','20261119100011175',NULL,NULL,NULL,'error','API fetch failed: HTTP 403',4110,'2026-11-19 14:28:49'),(170,'30s','20261119100042350',NULL,NULL,NULL,'error','API fetch failed: HTTP 403',3898,'2026-11-19 14:28:53'),(171,'1m','20261119100011175',NULL,NULL,NULL,'error','API fetch failed: HTTP 403',3911,'2026-11-19 14:29:16'),(172,'30s','20261119100042350',NULL,NULL,NULL,'error','API fetch failed: HTTP 403',3248,'2026-11-19 14:29:20'),(173,'1m','20261119100011175',NULL,NULL,NULL,'error','API fetch failed: HTTP 403',3296,'2026-11-19 14:29:44'),(174,'30s','20261119100042350',NULL,NULL,NULL,'error','API fetch failed: HTTP 403',3209,'2026-11-19 14:29:47'),(175,'1m','20261119100011175',NULL,NULL,NULL,'error','API fetch failed: HTTP 403',3229,'2026-11-19 14:30:12'),(176,'30s','20261119100042350',NULL,NULL,NULL,'error','API fetch failed: HTTP 403',3267,'2026-11-19 14:30:15'),(177,'3m','20261119100020392',NULL,NULL,NULL,'error','API fetch failed: HTTP 403',3266,'2026-11-19 14:30:19'),(178,'5m','20261119100030235',NULL,NULL,NULL,'error','API fetch failed: HTTP 403',3312,'2026-11-19 14:30:22'),(179,'1m','20261119100011175',NULL,NULL,NULL,'error','API fetch failed: HTTP 403',3963,'2026-11-19 14:30:40'),(180,'30s','20261119100042350',NULL,NULL,NULL,'error','API fetch failed: HTTP 403',3267,'2026-11-19 14:30:44'),(181,'3m','20261119100020392',NULL,NULL,NULL,'error','API fetch failed: HTTP 403',3933,'2026-11-19 14:30:48'),(182,'5m','20261119100030235',NULL,NULL,NULL,'error','API fetch failed: HTTP 403',4113,'2026-11-19 14:30:52'),(183,'1m','20261119100011175',NULL,NULL,NULL,'error','API fetch failed: HTTP 403',3923,'2026-11-19 14:31:09'),(184,'30s','20261119100042350',NULL,NULL,NULL,'error','API fetch failed: HTTP 403',3247,'2026-11-19 14:31:12'),(185,'1m','20261119100011175',NULL,NULL,NULL,'error','API fetch failed: HTTP 403',4044,'2026-11-19 14:31:37'),(186,'30s','20261119100042350',NULL,NULL,NULL,'error','API fetch failed: HTTP 403',3970,'2026-11-19 14:31:41'),(187,'1m','20261119100011175',NULL,NULL,NULL,'error','API fetch failed: HTTP 403',3308,'2026-11-19 14:32:04'),(188,'30s','20261119100042350',NULL,NULL,NULL,'error','API fetch failed: HTTP 403',3249,'2026-11-19 14:32:07'),(189,'1m','20261119100011175',NULL,NULL,NULL,'error','API fetch failed: HTTP 403',3928,'2026-11-19 14:32:33'),(190,'30s','20261119100042350',NULL,NULL,NULL,'error','API fetch failed: HTTP 403',3254,'2026-11-19 14:32:36'),(191,'1m','20261119100011175',NULL,NULL,NULL,'error','API fetch failed: HTTP 403',3950,'2026-11-19 14:33:00'),(192,'30s','20261119100042350',NULL,NULL,NULL,'error','API fetch failed: HTTP 403',3453,'2026-11-19 14:33:04'),(193,'1m','20261119100011175',NULL,NULL,NULL,'error','API fetch failed: HTTP 403',3301,'2026-11-19 14:33:28'),(194,'30s','20261119100042350',NULL,NULL,NULL,'error','API fetch failed: HTTP 403',3349,'2026-11-19 14:33:31'),(195,'3m','20261119100020392',NULL,NULL,NULL,'error','API fetch failed: HTTP 403',3235,'2026-11-19 14:33:35'),(196,'1m','20261119100011175',NULL,NULL,NULL,'error','API fetch failed: HTTP 403',3875,'2026-11-19 14:33:56'),(197,'30s','20261119100042350',NULL,NULL,NULL,'error','API fetch failed: HTTP 403',3911,'2026-11-19 14:34:00'),(198,'3m','20261119100020392',NULL,NULL,NULL,'error','API fetch failed: HTTP 403',2552,'2026-11-19 14:34:03'),(199,'30s','20261119100051754',NULL,NULL,NULL,'fallback','API issueNumber not found for period 20261119100051754 (feed failed: all paths failed: #0(direct) HTTP 403 | #1(proxy) HTTP 0 curl#28 | #1(proxy) HTTP 0 curl#28 | #2(proxy) HTTP 0 curl#28 | #2(proxy) HTTP 0 curl#28 | #3(proxy) HTTP 401); auto algorithm used',33123,'2026-11-19 14:37:41'),(200,'30s','20261119100051756',NULL,NULL,NULL,'fallback','API issueNumber not found for period 20261119100051756 (feed failed: all paths failed: #0(direct) HTTP 403 | #1(proxy) HTTP 0 curl#28 | #1(proxy) HTTP 0 curl#28 | #2(proxy) HTTP 0 curl#28 | #2(proxy) HTTP 0 curl#28 | #3(proxy) HTTP 401); auto algorithm used',33181,'2026-11-19 14:38:54'),(201,'30s','20261119100051757',NULL,NULL,NULL,'fallback','API issueNumber not found for period 20261119100051757 (feed failed: all paths failed: #0(direct) HTTP 403 | #1(proxy) HTTP 0 curl#28 | #1(proxy) HTTP 0 curl#28 | #2(proxy) HTTP 0 curl#28 | #2(proxy) HTTP 0 curl#28 | #3(proxy) HTTP 401); auto algorithm used',33082,'2026-11-19 14:39:40'),(202,'30s','20261119100051758','20261119100051758',5,'green,violet','used','API result applied (exact issueNumber match, path #0)',1,'2026-11-19 14:39:41'),(203,'30s','20261119100051760','20261119100051760',1,'green','used','API result applied (exact issueNumber match, path #0)',1,'2026-11-19 14:40:08'),(204,'30s','20261119100051761','20261119100051761',4,'red','used','API result applied (exact issueNumber match, path #0)',1,'2026-11-19 14:40:49'),(205,'30s','20261119100051762','20261119100051762',7,'green','used','API result applied (exact issueNumber match, path #0)',1,'2026-11-19 14:41:17'),(206,'30s','20261119100051763','20261119100051763',0,'red,violet','used','API result applied (exact issueNumber match, path #0)',1,'2026-11-19 14:41:45'),(207,'30s','20261119100051764','20261119100051764',3,'green','used','API result applied (exact issueNumber match, path #0)',1,'2026-11-19 14:42:12'),(208,'30s','20261119100051765','20261119100051765',6,'red','used','API result applied (exact issueNumber match, path #0)',1,'2026-11-19 14:42:40'),(209,'30s','20261119100051766','20261119100051766',9,'green','used','API result applied (exact issueNumber match, path #0)',1,'2026-11-19 14:43:08'),(210,'30s','20261119100051767','20261119100051767',2,'red','used','API result applied (exact issueNumber match, path #0)',1,'2026-11-19 14:43:36'),(211,'30s','20261119100051768','20261119100051768',5,'green,violet','used','API result applied (exact issueNumber match, path #0)',1,'2026-11-19 14:44:04'),(212,'30s','20261119100051769','20261119100051769',8,'red','used','API result applied (exact issueNumber match, path #0)',1,'2026-11-19 14:44:31'),(213,'30s','20261119100051770',NULL,NULL,NULL,'fallback','API issueNumber not found for period 20261119100051770 (feed failed: all paths failed: #0(direct) HTTP 403 | #1(proxy) HTTP 0 curl#28 | #1(proxy) HTTP 0 curl#28 | #2(proxy) HTTP 0 curl#28 | #2(proxy) HTTP 0 curl#28 | #3(proxy) HTTP 401); auto algorithm used',33109,'2026-11-19 14:46:00'),(214,'30s','20261119100051771',NULL,NULL,NULL,'fallback','API issueNumber not found for period 20261119100051771 (feed failed: all paths failed: #0(direct) HTTP 403 | #1(proxy) HTTP 0 curl#28 | #1(proxy) HTTP 0 curl#28 | #2(proxy) HTTP 0 curl#28 | #2(proxy) HTTP 0 curl#28 | #3(proxy) HTTP 401); auto algorithm used',33176,'2026-11-19 14:46:46'),(215,'30s','20261119100051773',NULL,NULL,NULL,'fallback','API issueNumber not found for period 20261119100051773 (feed failed: all paths failed: #0(direct) HTTP 403 | #1(proxy) HTTP 0 curl#28 | #1(proxy) HTTP 0 curl#28 | #2(proxy) HTTP 0 curl#28 | #2(proxy) HTTP 0 curl#28 | #3(proxy) HTTP 401); auto algorithm used',33355,'2026-11-19 14:47:32'),(216,'30s','20261119100051774',NULL,NULL,NULL,'fallback','API issueNumber not found for period 20261119100051774 (feed failed: all paths failed: #0(direct) HTTP 403 | #1(proxy) HTTP 0 curl#28 | #1(proxy) HTTP 0 curl#28 | #2(proxy) HTTP 0 curl#28 | #2(proxy) HTTP 0 curl#28 | #3(proxy) HTTP 401); auto algorithm used',33090,'2026-11-19 14:48:18'),(217,'30s','20261119100051776',NULL,NULL,NULL,'fallback','API issueNumber not found for period 20261119100051776 (feed failed: all paths failed: #0(direct) HTTP 403 | #1(proxy) HTTP 0 curl#28 | #1(proxy) HTTP 0 curl#28 | #2(proxy) HTTP 0 curl#28 | #2(proxy) HTTP 0 curl#28 | #3(proxy) HTTP 401); auto algorithm used',33085,'2026-11-19 14:49:04'),(218,'30s','20261119100051777',NULL,NULL,NULL,'fallback','API issueNumber not found for period 20261119100051777 (feed failed: all paths failed: #0(direct) HTTP 403 | #1(proxy) HTTP 0 curl#28 | #1(proxy) HTTP 0 curl#28 | #2(proxy) HTTP 0 curl#28 | #2(proxy) HTTP 0 curl#28 | #3(proxy) HTTP 401); auto algorithm used',33079,'2026-11-19 14:49:50'),(219,'30s','20261119100051779','20261119100051779',1,'green','used','API result applied (exact issueNumber match, path #1)',5887,'2026-11-19 14:50:09'),(220,'30s','20261119100051780',NULL,NULL,NULL,'fallback','API issueNumber not found for period 20261119100051780 (feed failed: all paths failed: #1(proxy) HTTP 0 curl#28 | #1(proxy) HTTP 0 curl#28 | #0(direct) HTTP 403 | #2(proxy) HTTP 0 curl#28 | #2(proxy) HTTP 0 curl#28 | #3(proxy) HTTP 401); auto algorithm used',33076,'2026-11-19 14:51:04'),(221,'30s','20261119100051781',NULL,NULL,NULL,'fallback','API issueNumber not found for period 20261119100051781 (feed failed: all paths failed: #1(proxy) HTTP 0 curl#28 | #1(proxy) HTTP 0 curl#28 | #0(direct) HTTP 403 | #2(proxy) HTTP 0 curl#28 | #2(proxy) HTTP 0 curl#28 | #3(proxy) HTTP 401); auto algorithm used',33052,'2026-11-19 14:51:50'),(222,'30s','20261119100051783',NULL,NULL,NULL,'fallback','API issueNumber not found for period 20261119100051783 (feed failed: all paths failed: #1(proxy) HTTP 0 curl#28 | #1(proxy) HTTP 0 curl#28 | #0(direct) HTTP 403 | #2(proxy) HTTP 0 curl#28 | #2(proxy) HTTP 0 curl#28 | #3(proxy) HTTP 401); auto algorithm used',33100,'2026-11-19 14:52:36'),(223,'30s','20261119100051784',NULL,NULL,NULL,'fallback','API issueNumber not found for period 20261119100051784 (feed failed: all paths failed: #1(proxy) HTTP 0 curl#28 | #1(proxy) HTTP 0 curl#28 | #0(direct) HTTP 403 | #2(proxy) HTTP 0 curl#28 | #2(proxy) HTTP 0 curl#28 | #3(proxy) HTTP 401); auto algorithm used',33077,'2026-11-19 14:53:22'),(224,'30s','20261119100051786',NULL,NULL,NULL,'fallback','API issueNumber not found for period 20261119100051786 (feed failed: all paths failed: #1(proxy) HTTP 0 curl#28 | #1(proxy) HTTP 0 curl#28 | #0(direct) HTTP 403 | #2(proxy) HTTP 0 curl#28 | #2(proxy) HTTP 0 curl#28 | #3(proxy) HTTP 401); auto algorithm used',33194,'2026-11-19 14:54:08'),(225,'30s','20261119100051787','20261119100051787',5,'green,violet','used','API result applied (exact issueNumber match, path #1)',15697,'2026-11-19 14:54:36'),(226,'30s','20261119100051789',NULL,NULL,NULL,'fallback','API issueNumber not found for period 20261119100051789 (feed failed: all paths failed: #1(proxy) HTTP 0 curl#28 | #1(proxy) HTTP 0 curl#28 | #0(direct) HTTP 403 | #2(proxy) HTTP 0 curl#28 | #2(proxy) HTTP 0 curl#28 | #3(proxy) HTTP 401); auto algorithm used',33229,'2026-11-19 14:55:23'),(227,'30s','20261119100051790',NULL,NULL,NULL,'fallback','API issueNumber not found for period 20261119100051790 (feed failed: all paths failed: #1(proxy) HTTP 0 curl#28 | #1(proxy) HTTP 0 curl#28 | #0(direct) HTTP 403 | #2(proxy) HTTP 0 curl#28 | #2(proxy) HTTP 0 curl#28 | #3(proxy) HTTP 401); auto algorithm used',33043,'2026-11-19 14:56:09'),(228,'30s','20261119100051791','20261119100051791',5,'green,violet','used','API result applied (exact issueNumber match, path #1)',11174,'2026-11-19 14:56:33'),(229,'1m','20261119100010877',NULL,NULL,NULL,'fallback','API issueNumber not found for period 20261119100010877 (feed failed: all paths failed: #1(proxy) HTTP 0 curl#28 | #1(proxy) HTTP 0 curl#28 | #0(direct) HTTP 403 | #2(proxy) HTTP 0 curl#28 | #2(proxy) HTTP 0 curl#28 | #3(proxy) HTTP 401); auto algorithm used',33061,'2026-11-19 14:57:22'),(230,'30s','20261119100051793',NULL,NULL,NULL,'fallback','API issueNumber not found for period 20261119100051793 (feed failed: all paths failed: #1(proxy) HTTP 0 curl#28 | #1(proxy) HTTP 0 curl#28 | #0(direct) HTTP 403 | #2(proxy) HTTP 0 curl#28 | #2(proxy) HTTP 0 curl#28 | #3(proxy) HTTP 401); auto algorithm used',33105,'2026-11-19 14:57:56'),(231,'1m','20261119100010878',NULL,NULL,NULL,'fallback','API issueNumber not found for period 20261119100010878 (feed failed: all paths failed: #1(proxy) HTTP 0 curl#28 | #1(proxy) HTTP 0 curl#28 | #0(direct) HTTP 403 | #2(proxy) HTTP 0 curl#28 | #2(proxy) HTTP 0 curl#28 | #3(proxy) HTTP 401); auto algorithm used',33223,'2026-11-19 14:58:41'),(232,'30s','20261119100051794',NULL,NULL,NULL,'fallback','API issueNumber not found for period 20261119100051794 (feed failed: all paths failed: #1(proxy) HTTP 408 | #0(direct) HTTP 403 | #2(proxy) HTTP 0 curl#28 | #2(proxy) HTTP 0 curl#28 | #3(proxy) HTTP 401 | #4(proxy) HTTP 429); auto algorithm used',23415,'2026-11-19 14:59:05'),(233,'1m','20261119100010879',NULL,NULL,NULL,'fallback','API issueNumber not found for period 20261119100010879 (feed failed: all paths failed: #1(proxy) HTTP 0 curl#28 | #1(proxy) HTTP 0 curl#28 | #0(direct) HTTP 403 | #2(proxy) HTTP 0 curl#28 | #2(proxy) HTTP 0 curl#28 | #3(proxy) HTTP 401); auto algorithm used',33122,'2026-11-19 14:59:50'),(234,'30s','20261119100051796',NULL,NULL,NULL,'fallback','API issueNumber not found for period 20261119100051796 (feed failed: all paths failed: #1(proxy) HTTP 0 curl#28 | #1(proxy) HTTP 0 curl#28 | #0(direct) HTTP 403 | #2(proxy) HTTP 0 curl#28 | #2(proxy) HTTP 0 curl#28 | #3(proxy) HTTP 401); auto algorithm used',33106,'2026-11-19 15:00:24'),(235,'1m','20261119100010880',NULL,NULL,NULL,'fallback','API issueNumber not found for period 20261119100010880 (feed failed: all paths failed: #1(proxy) HTTP 0 curl#28 | #1(proxy) HTTP 0 curl#28 | #0(direct) HTTP 403 | #2(proxy) HTTP 0 curl#28 | #2(proxy) HTTP 0 curl#28 | #3(proxy) HTTP 401); auto algorithm used',33129,'2026-11-19 15:01:09'),(236,'30s','20261119100051799',NULL,NULL,NULL,'fallback','API issueNumber not found for period 20261119100051799 (feed failed: all paths failed: #1(proxy) HTTP 0 curl#28 | #1(proxy) HTTP 0 curl#28 | #0(direct) HTTP 403 | #2(proxy) HTTP 0 curl#28 | #2(proxy) HTTP 0 curl#28 | #3(proxy) HTTP 401); auto algorithm used',33095,'2026-11-19 15:01:43'),(237,'3m','20261119100020293',NULL,NULL,NULL,'fallback','API issueNumber not found for period 20261119100020293 (feed failed: all paths failed: #1(proxy) HTTP 0 curl#28 | #1(proxy) HTTP 0 curl#28 | #0(direct) HTTP 403 | #2(proxy) HTTP 0 curl#28 | #2(proxy) HTTP 0 curl#28 | #3(proxy) HTTP 401); auto algorithm used',33249,'2026-11-19 15:02:16'),(238,'5m','20261119100030177',NULL,NULL,NULL,'fallback','API issueNumber not found for period 20261119100030177 (feed failed: all paths failed: #1(proxy) HTTP 0 curl#28 | #1(proxy) HTTP 0 curl#28 | #0(direct) HTTP 403 | #2(proxy) HTTP 0 curl#28 | #2(proxy) HTTP 0 curl#28 | #3(proxy) HTTP 401); auto algorithm used',33116,'2026-11-19 15:02:50'),(239,'1m','20261119100010881',NULL,NULL,NULL,'fallback','API issueNumber not found for period 20261119100010881 (feed failed: all paths failed: #1(proxy) HTTP 0 curl#28 | #1(proxy) HTTP 0 curl#28 | #0(direct) HTTP 403 | #2(proxy) HTTP 0 curl#28 | #2(proxy) HTTP 0 curl#28 | #3(proxy) HTTP 401); auto algorithm used',33179,'2026-11-19 15:03:36'),(240,'30s','20261119100051801',NULL,NULL,NULL,'fallback','API issueNumber not found for period 20261119100051801 (feed failed: all paths failed: #1(proxy) HTTP 0 curl#28 | #1(proxy) HTTP 0 curl#28 | #0(direct) HTTP 403 | #2(proxy) HTTP 0 curl#28 | #2(proxy) HTTP 0 curl#28 | #3(proxy) HTTP 401); auto algorithm used',33158,'2026-11-19 15:04:09'),(241,'3m','20261119100020294',NULL,NULL,NULL,'fallback','API issueNumber not found for period 20261119100020294 (feed failed: all paths failed: #1(proxy) HTTP 0 curl#28 | #1(proxy) HTTP 0 curl#28 | #0(direct) HTTP 403 | #2(proxy) HTTP 0 curl#28 | #2(proxy) HTTP 0 curl#28 | #3(proxy) HTTP 401); auto algorithm used',34697,'2026-11-19 15:04:44'),(242,'1m','20261119100010882',NULL,NULL,NULL,'fallback','API issueNumber not found for period 20261119100010882 (feed failed: all paths failed: #1(proxy) HTTP 0 curl#28 | #1(proxy) HTTP 0 curl#28 | #0(direct) HTTP 403 | #2(proxy) HTTP 0 curl#28 | #2(proxy) HTTP 0 curl#28 | #3(proxy) HTTP 401); auto algorithm used',33137,'2026-11-19 15:05:30'),(243,'30s','20261119100051804',NULL,NULL,NULL,'fallback','API issueNumber not found for period 20261119100051804 (feed failed: all paths failed: #1(proxy) HTTP 0 curl#28 | #1(proxy) HTTP 0 curl#28 | #0(direct) HTTP 403 | #2(proxy) HTTP 0 curl#28 | #2(proxy) HTTP 0 curl#28 | #3(proxy) HTTP 401); auto algorithm used',33131,'2026-11-19 15:06:03'),(244,'1m','20261119100010883',NULL,NULL,NULL,'fallback','API issueNumber not found for period 20261119100010883 (feed failed: all paths failed: #1(proxy) HTTP 0 curl#28 | #1(proxy) HTTP 0 curl#28 | #0(direct) HTTP 403 | #2(proxy) HTTP 0 curl#28 | #2(proxy) HTTP 0 curl#28 | #3(proxy) HTTP 401); auto algorithm used',33132,'2026-11-19 15:06:49'),(245,'30s','20261119100051809','20261119100051809',3,'green','used','API result applied (exact issueNumber match, path #1)',15568,'2026-11-19 15:07:05'),(246,'3m','20261119100020295',NULL,NULL,NULL,'fallback','API issueNumber not found for period 20261119100020295 (feed failed: all paths failed: #1(proxy) HTTP 0 curl#28 | #1(proxy) HTTP 0 curl#28 | #0(direct) HTTP 403 | #2(proxy) HTTP 0 curl#28 | #2(proxy) HTTP 0 curl#28 | #3(proxy) HTTP 401); auto algorithm used',33128,'2026-11-19 15:07:38'),(247,'1m','20261119100010884',NULL,NULL,NULL,'fallback','API issueNumber not found for period 20261119100010884 (feed ok); auto algorithm used',15049,'2026-11-19 15:08:25'),(248,'30s','20261119100051813',NULL,NULL,NULL,'fallback','API issueNumber not found for period 20261119100051813 (feed failed: all paths failed: #1(proxy) HTTP 0 curl#28 | #1(proxy) HTTP 0 curl#28 | #0(direct) HTTP 403 | #2(proxy) HTTP 0 curl#28 | #2(proxy) HTTP 0 curl#28 | #3(proxy) HTTP 401); auto algorithm used',33110,'2026-11-19 15:08:58'),(249,'1m','20261119100010885',NULL,NULL,NULL,'fallback','API issueNumber not found for period 20261119100010885 (feed ok); auto algorithm used',4920,'2026-11-19 15:09:36');
/*!40000 ALTER TABLE `wingo_api_log` ENABLE KEYS */;
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
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1 COMMENT='WinGo 30-second game: individual user bets';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wingo_bets_30sec`
--

LOCK TABLES `wingo_bets_30sec` WRITE;
/*!40000 ALTER TABLE `wingo_bets_30sec` DISABLE KEYS */;
INSERT INTO `wingo_bets_30sec` VALUES (2,3,'20261119100041534','0','11','1','1',1,'perte',0.98,0,63530,'2026-11-19 12:47:00'),(3,31,'20261119100042254','1','0','10','1',10,'perte',9.8,1,13691,'2026-11-19 18:45:49'),(4,32,'20261119100042258','1','0','10','1',10,'perte',9.8,1,57531,'2026-11-19 18:47:20'),(5,33,'20261119100042259','1','0','10','1',10,'perte',9.8,NULL,NULL,'2026-11-19 18:49:37'),(6,29,'20261119100042339','1','8','10','1',100,'gagner',882,8,32898,'2026-11-19 19:29:45'),(7,29,'20261119100042339','1','8','10','1',100,'gagner',882,8,32898,'2026-11-19 19:29:45');
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
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=latin1 COMMENT='WinGo 10-min: admin-forced result override';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wingo_manual_result_10min`
--

LOCK TABLES `wingo_manual_result_10min` WRITE;
/*!40000 ALTER TABLE `wingo_manual_result_10min` DISABLE KEYS */;
INSERT INTO `wingo_manual_result_10min` VALUES (4,'green','x',1,0,'2026-11-19 13:57:43'),(3,'red,violet','x',0,0,'2026-11-19 13:57:43'),(5,'red','x',2,0,'2026-11-19 13:57:43'),(6,'green','x',3,0,'2026-11-19 13:57:43'),(7,'red','x',4,0,'2026-11-19 13:57:43'),(8,'green,violet','x',5,0,'2026-11-19 13:57:43'),(9,'red','x',6,0,'2026-11-19 13:57:43'),(10,'green','x',7,0,'2026-11-19 13:57:43'),(11,'red','x',8,0,'2026-11-19 13:57:43'),(12,'green','x',9,0,'2026-11-19 13:57:43');
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
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=latin1 COMMENT='WinGo 1-min: admin-forced result override (sthiti=1 forces winning number)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wingo_manual_result_1min`
--

LOCK TABLES `wingo_manual_result_1min` WRITE;
/*!40000 ALTER TABLE `wingo_manual_result_1min` DISABLE KEYS */;
INSERT INTO `wingo_manual_result_1min` VALUES (4,'green','x',1,0,'2026-11-19 13:57:43'),(3,'red,violet','x',0,0,'2026-11-19 13:57:43'),(5,'red','x',2,0,'2026-11-19 13:57:43'),(6,'green','x',3,0,'2026-11-19 13:57:43'),(7,'red','x',4,0,'2026-11-19 13:57:43'),(8,'green,violet','x',5,0,'2026-11-19 13:57:43'),(9,'red','x',6,0,'2026-11-19 13:57:43'),(10,'green','x',7,0,'2026-11-19 13:57:43'),(11,'red','x',8,0,'2026-11-19 13:57:43'),(12,'green','x',9,0,'2026-11-19 13:57:43'),(13,'green','x',7,0,'2026-11-19 14:40:45');
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
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=latin1 COMMENT='WinGo 30-sec: admin-forced result override';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wingo_manual_result_30sec`
--

LOCK TABLES `wingo_manual_result_30sec` WRITE;
/*!40000 ALTER TABLE `wingo_manual_result_30sec` DISABLE KEYS */;
INSERT INTO `wingo_manual_result_30sec` VALUES (4,'green','x',1,0,'2026-11-19 13:57:43'),(3,'red,violet','x',0,0,'2026-11-19 13:57:43'),(5,'red','x',2,0,'2026-11-19 13:57:43'),(6,'green','x',3,0,'2026-11-19 13:57:43'),(7,'red','x',4,0,'2026-11-19 13:57:43'),(8,'green,violet','x',5,0,'2026-11-19 13:57:43'),(9,'red','x',6,0,'2026-11-19 13:57:43'),(10,'green','x',7,0,'2026-11-19 13:57:43'),(11,'red','x',8,0,'2026-11-19 13:57:43'),(12,'green','x',9,0,'2026-11-19 13:57:43');
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
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=latin1 COMMENT='WinGo 3-min: admin-forced result override';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wingo_manual_result_3min`
--

LOCK TABLES `wingo_manual_result_3min` WRITE;
/*!40000 ALTER TABLE `wingo_manual_result_3min` DISABLE KEYS */;
INSERT INTO `wingo_manual_result_3min` VALUES (4,'green','x',1,0,'2026-11-19 13:57:43'),(3,'red,violet','x',0,0,'2026-11-19 13:57:43'),(5,'red','x',2,0,'2026-11-19 13:57:43'),(6,'green','x',3,0,'2026-11-19 13:57:43'),(7,'red','x',4,0,'2026-11-19 13:57:43'),(8,'green,violet','x',5,0,'2026-11-19 13:57:43'),(9,'red','x',6,0,'2026-11-19 13:57:43'),(10,'green','x',7,0,'2026-11-19 13:57:43'),(11,'red','x',8,0,'2026-11-19 13:57:43'),(12,'green','x',9,0,'2026-11-19 13:57:43');
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
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=latin1 COMMENT='WinGo 5-min: admin-forced result override';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wingo_manual_result_5min`
--

LOCK TABLES `wingo_manual_result_5min` WRITE;
/*!40000 ALTER TABLE `wingo_manual_result_5min` DISABLE KEYS */;
INSERT INTO `wingo_manual_result_5min` VALUES (4,'green','x',1,0,'2026-11-19 13:57:43'),(3,'red,violet','x',0,0,'2026-11-19 13:57:43'),(5,'red','x',2,0,'2026-11-19 13:57:43'),(6,'green','x',3,0,'2026-11-19 13:57:43'),(7,'red','x',4,0,'2026-11-19 13:57:43'),(8,'green,violet','x',5,0,'2026-11-19 13:57:43'),(9,'red','x',6,0,'2026-11-19 13:57:43'),(10,'green','x',7,0,'2026-11-19 13:57:43'),(11,'red','x',8,0,'2026-11-19 13:57:43'),(12,'green','x',9,0,'2026-11-19 13:57:43');
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
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COMMENT='WinGo 10-min: period/round registry';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wingo_periods_10min`
--

LOCK TABLES `wingo_periods_10min` WRITE;
/*!40000 ALTER TABLE `wingo_periods_10min` DISABLE KEYS */;
INSERT INTO `wingo_periods_10min` VALUES (1,'20261119100040122','2026-11-19 20:10:21'),(2,'20261119100040123','2026-11-19 20:20:09'),(3,'20261119100040124','2026-11-19 20:32:50');
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
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=latin1 COMMENT='WinGo 1-min: period/round registry (one row per round, regenerated daily by cron)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wingo_periods_1min`
--

LOCK TABLES `wingo_periods_1min` WRITE;
/*!40000 ALTER TABLE `wingo_periods_1min` DISABLE KEYS */;
INSERT INTO `wingo_periods_1min` VALUES (1,'20261119100010877','2026-11-19 20:06:39'),(2,'20261119100010878','2026-11-19 20:07:07'),(3,'20261119100010879','2026-11-19 20:08:21'),(4,'20261119100010880','2026-11-19 20:09:06'),(5,'20261119100010881','2026-11-19 20:10:20'),(6,'20261119100010882','2026-11-19 20:11:17'),(7,'20261119100010883','2026-11-19 20:12:12'),(8,'20261119100010884','2026-11-19 20:13:08'),(9,'20261119100010885','2026-11-19 20:14:03'),(10,'20261119100010886','2026-11-19 20:15:26'),(11,'20261119100010887','2026-11-19 20:16:13'),(12,'20261119100010888','2026-11-19 20:17:45'),(13,'20261119100010889','2026-11-19 20:18:31'),(14,'20261119100010890','2026-11-19 20:19:17'),(15,'20261119100010891','2026-11-19 20:20:03'),(16,'20261119100010892','2026-11-19 20:21:17'),(17,'20261119100010893','2026-11-19 20:22:03'),(18,'20261119100010894','2026-11-19 20:23:34'),(19,'20261119100010895','2026-11-19 20:24:20'),(20,'20261119100010896','2026-11-19 20:25:35'),(21,'20261119100010897','2026-11-19 20:26:21'),(22,'20261119100010898','2026-11-19 20:27:22'),(23,'20261119100010899','2026-11-19 20:28:41'),(24,'20261119100010900','2026-11-19 20:29:50'),(25,'20261119100010902','2026-11-19 20:31:09'),(26,'20261119100010904','2026-11-19 20:33:36'),(27,'20261119100010906','2026-11-19 20:35:30'),(28,'20261119100010907','2026-11-19 20:36:49'),(29,'20261119100010909','2026-11-19 20:38:25'),(30,'20261119100010910','2026-11-19 20:39:36');
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
) ENGINE=MyISAM AUTO_INCREMENT=41 DEFAULT CHARSET=latin1 COMMENT='WinGo 30-sec: period/round registry';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wingo_periods_30sec`
--

LOCK TABLES `wingo_periods_30sec` WRITE;
/*!40000 ALTER TABLE `wingo_periods_30sec` DISABLE KEYS */;
INSERT INTO `wingo_periods_30sec` VALUES (1,'20261119100051754','2026-11-19 20:06:39'),(2,'20261119100051756','2026-11-19 20:07:41'),(3,'20261119100051757','2026-11-19 20:08:08'),(4,'20261119100051758','2026-11-19 20:08:54'),(5,'20261119100051760','2026-11-19 20:09:40'),(6,'20261119100051761','2026-11-19 20:10:08'),(7,'20261119100051762','2026-11-19 20:10:36'),(8,'20261119100051763','2026-11-19 20:11:04'),(9,'20261119100051764','2026-11-19 20:11:32'),(10,'20261119100051765','2026-11-19 20:12:00'),(11,'20261119100051766','2026-11-19 20:12:40'),(12,'20261119100051767','2026-11-19 20:13:08'),(13,'20261119100051768','2026-11-19 20:13:36'),(14,'20261119100051769','2026-11-19 20:14:04'),(15,'20261119100051770','2026-11-19 20:14:31'),(16,'20261119100051771','2026-11-19 20:15:14'),(17,'20261119100051773','2026-11-19 20:16:00'),(18,'20261119100051774','2026-11-19 20:16:46'),(19,'20261119100051776','2026-11-19 20:17:32'),(20,'20261119100051777','2026-11-19 20:18:18'),(21,'20261119100051779','2026-11-19 20:19:04'),(22,'20261119100051780','2026-11-19 20:19:50'),(23,'20261119100051781','2026-11-19 20:20:09'),(24,'20261119100051783','2026-11-19 20:21:04'),(25,'20261119100051784','2026-11-19 20:21:50'),(26,'20261119100051786','2026-11-19 20:22:36'),(27,'20261119100051787','2026-11-19 20:23:22'),(28,'20261119100051789','2026-11-19 20:24:08'),(29,'20261119100051790','2026-11-19 20:24:36'),(30,'20261119100051791','2026-11-19 20:25:23'),(31,'20261119100051793','2026-11-19 20:26:09'),(32,'20261119100051794','2026-11-19 20:26:33'),(33,'20261119100051796','2026-11-19 20:27:56'),(34,'20261119100051799','2026-11-19 20:29:05'),(35,'20261119100051801','2026-11-19 20:30:24'),(36,'20261119100051804','2026-11-19 20:31:43'),(37,'20261119100051809','2026-11-19 20:34:09'),(38,'20261119100051813','2026-11-19 20:36:03'),(39,'20261119100051815','2026-11-19 20:37:05'),(40,'20261119100051818','2026-11-19 20:38:58');
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
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1 COMMENT='WinGo 3-min: period/round registry';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wingo_periods_3min`
--

LOCK TABLES `wingo_periods_3min` WRITE;
/*!40000 ALTER TABLE `wingo_periods_3min` DISABLE KEYS */;
INSERT INTO `wingo_periods_3min` VALUES (1,'20261119100020293','2026-11-19 20:06:39'),(2,'20261119100020294','2026-11-19 20:09:40'),(3,'20261119100020295','2026-11-19 20:12:12'),(4,'20261119100020296','2026-11-19 20:16:00'),(5,'20261119100020297','2026-11-19 20:19:04'),(6,'20261119100020298','2026-11-19 20:21:50'),(7,'20261119100020299','2026-11-19 20:24:07'),(8,'20261119100020301','2026-11-19 20:32:16'),(9,'20261119100020302','2026-11-19 20:34:44'),(10,'20261119100020303','2026-11-19 20:37:38');
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
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COMMENT='WinGo 5-min: period/round registry';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wingo_periods_5min`
--

LOCK TABLES `wingo_periods_5min` WRITE;
/*!40000 ALTER TABLE `wingo_periods_5min` DISABLE KEYS */;
INSERT INTO `wingo_periods_5min` VALUES (1,'20261119100030177','2026-11-19 20:10:21'),(2,'20261119100030178','2026-11-19 20:16:00'),(3,'20261119100030179','2026-11-19 20:20:09'),(4,'20261119100030180','2026-11-19 20:26:09'),(5,'20261119100030181','2026-11-19 20:32:50');
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
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=latin1 COMMENT='WinGo 10-min: published results per period';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wingo_results_10min`
--

LOCK TABLES `wingo_results_10min` WRITE;
/*!40000 ALTER TABLE `wingo_results_10min` DISABLE KEYS */;
INSERT INTO `wingo_results_10min` VALUES (1,'20261119100051540',32825,5,'green,violet','shonu','2026-11-19 13:00:01'),(2,'20261119100051541',86373,3,'green','shonu','2026-11-19 13:10:00'),(3,'20261119100051542',88933,3,'green','shonu','2026-11-19 13:20:01'),(4,'20261119100051543',68883,3,'green','shonu','2026-11-19 13:30:01'),(5,'20261119100051544',27916,6,'red','shonu','2026-11-19 13:40:01'),(6,'20261119100051545',17959,9,'green','shonu','2026-11-19 13:50:01'),(7,'20261119100051546',33494,4,'red','shonu','2026-11-19 14:00:02'),(8,'20261119100051547',34885,5,'green,violet','shonu','2026-11-19 14:10:00'),(9,'20261119100051548',55739,9,'green','shonu','2026-11-19 14:20:01'),(10,'20261119100051549',17321,1,'green','shonu','2026-11-19 14:40:00'),(11,'20261119100051550',99932,2,'red','shonu','2026-11-19 14:50:00'),(12,'20261119100051551',17849,9,'green','shonu','2026-11-19 15:00:01'),(13,'20261119100051552',85246,6,'red','shonu','2026-11-19 15:10:00'),(14,'20261119100051553',47581,1,'green','shonu','2026-11-19 15:20:01'),(15,'20261119100051554',99937,7,'green','shonu','2026-11-19 15:30:02'),(16,'20261119100051555',19334,4,'red','shonu','2026-11-19 17:50:21'),(17,'20261119100051556',56725,5,'green,violet','shonu','2026-11-19 18:00:17'),(18,'20261119100051557',61486,6,'red','shonu','2026-11-19 18:10:11'),(19,'20261119100051558',26839,9,'green','shonu','2026-11-19 18:10:57'),(20,'20261119100051559',34232,2,'red','shonu','2026-11-19 18:20:07'),(21,'20261119100051560',44947,7,'green','shonu','2026-11-19 18:20:53'),(22,'20261119100051561',14975,5,'green,violet','shonu','2026-11-19 18:30:03'),(23,'20261119100051562',16510,0,'red,violet','shonu','2026-11-19 18:30:49'),(24,'20261119100051563',69369,9,'green','shonu','2026-11-19 18:40:44'),(25,'20261119100051564',43479,9,'green','shonu','2026-11-19 18:50:39'),(26,'20261119100051565',83611,1,'green','shonu','2026-11-19 19:00:35'),(27,'20261119100051566',44337,7,'green','shonu','2026-11-19 19:10:29'),(28,'20261119100040122',62141,1,'green','shonu','2026-11-19 20:36:59');
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
) ENGINE=MyISAM AUTO_INCREMENT=340 DEFAULT CHARSET=latin1 COMMENT='WinGo 1-min: published results per period (winning number + color)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wingo_results_1min`
--

LOCK TABLES `wingo_results_1min` WRITE;
/*!40000 ALTER TABLE `wingo_results_1min` DISABLE KEYS */;
INSERT INTO `wingo_results_1min` VALUES (339,'20261119100010885',82680,0,'red,violet','shonu','2026-11-19 20:39:36'),(338,'20261119100010884',68286,6,'red','shonu','2026-11-19 20:38:25'),(337,'20261119100010883',46591,1,'green','shonu','2026-11-19 20:36:49'),(336,'20261119100010882',88311,1,'green','shonu','2026-11-19 20:35:30'),(335,'20261119100010881',39774,4,'red','shonu','2026-11-19 20:33:36'),(334,'20261119100010880',45853,3,'green','shonu','2026-11-19 20:31:09'),(333,'20261119100010879',86974,4,'red','shonu','2026-11-19 20:29:50'),(331,'20261119100010877',73443,3,'green','shonu','2026-11-19 20:27:22'),(332,'20261119100010878',93260,0,'red,violet','shonu','2026-11-19 20:28:41');
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
) ENGINE=MyISAM AUTO_INCREMENT=625 DEFAULT CHARSET=latin1 COMMENT='WinGo 30-sec: published results per period';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wingo_results_30sec`
--

LOCK TABLES `wingo_results_30sec` WRITE;
/*!40000 ALTER TABLE `wingo_results_30sec` DISABLE KEYS */;
INSERT INTO `wingo_results_30sec` VALUES (22,'20261119100041503',52471,1,'green','shonu','2026-11-19 12:31:42'),(23,'20261119100041504',45938,8,'red','shonu','2026-11-19 12:33:09'),(24,'20261119100041505',67354,4,'red','shonu','2026-11-19 12:33:39'),(25,'20261119100041506',44889,9,'green','shonu','2026-11-19 12:34:24'),(26,'20261119100041507',86871,1,'green','shonu','2026-11-19 12:34:54'),(27,'20261119100041508',75230,0,'red,violet','shonu','2026-11-19 12:34:55'),(28,'20261119100041529',59740,0,'red,violet','shonu','2026-11-19 12:44:31'),(29,'20261119100041530',31786,6,'red','shonu','2026-11-19 12:45:00'),(30,'20261119100041531',23635,5,'green,violet','shonu','2026-11-19 12:45:30'),(31,'20261119100041532',17340,0,'red,violet','shonu','2026-11-19 12:46:01'),(32,'20261119100041533',62310,0,'red,violet','shonu','2026-11-19 12:46:31'),(33,'20261119100041534',63530,0,'red,violet','uncensored','2026-11-19 12:47:00'),(34,'20261119100041535',72251,1,'green','shonu','2026-11-19 12:47:30'),(35,'20261119100041536',46858,8,'red','shonu','2026-11-19 12:47:42'),(36,'20261119100041537',71454,4,'red','shonu','2026-11-19 12:48:30'),(37,'20261119100041538',42728,8,'red','shonu','2026-11-19 12:49:00'),(38,'20261119100041539',93789,9,'green','shonu','2026-11-19 12:49:30'),(39,'20261119100041540',35169,9,'green','shonu','2026-11-19 12:50:00'),(40,'20261119100041541',81359,9,'green','shonu','2026-11-19 12:50:30'),(41,'20261119100041542',39662,2,'red','shonu','2026-11-19 12:51:01'),(42,'20261119100041543',75639,9,'green','shonu','2026-11-19 12:51:31'),(43,'20261119100041544',26680,0,'red,violet','shonu','2026-11-19 12:52:00'),(44,'20261119100041545',46522,2,'red','shonu','2026-11-19 12:52:30'),(45,'20261119100041546',91670,0,'red,violet','shonu','2026-11-19 12:53:01'),(46,'20261119100041547',21769,9,'green','shonu','2026-11-19 12:53:31'),(47,'20261119100041548',92375,5,'green,violet','shonu','2026-11-19 12:54:00'),(48,'20261119100041549',38283,3,'green','shonu','2026-11-19 12:54:31'),(49,'20261119100041550',48793,3,'green','shonu','2026-11-19 12:55:00'),(50,'20261119100041551',77795,5,'green,violet','shonu','2026-11-19 12:55:30'),(51,'20261119100041552',79472,2,'red','shonu','2026-11-19 12:56:01'),(52,'20261119100041553',11451,1,'green','shonu','2026-11-19 12:56:31'),(53,'20261119100041554',54674,4,'red','shonu','2026-11-19 12:57:00'),(54,'20261119100041555',66840,0,'red,violet','shonu','2026-11-19 12:57:30'),(55,'20261119100041556',97389,9,'green','shonu','2026-11-19 12:58:01'),(56,'20261119100041557',74152,2,'red','shonu','2026-11-19 12:58:31'),(57,'20261119100041558',97984,4,'red','shonu','2026-11-19 12:59:00'),(58,'20261119100041559',37234,4,'red','shonu','2026-11-19 12:59:30'),(59,'20261119100041560',92667,7,'green','shonu','2026-11-19 13:00:00'),(60,'20261119100041561',35991,1,'green','shonu','2026-11-19 13:00:30'),(61,'20261119100041562',32349,9,'green','shonu','2026-11-19 13:01:01'),(62,'20261119100041563',46480,0,'red,violet','shonu','2026-11-19 13:01:31'),(63,'20261119100041564',77693,3,'green','shonu','2026-11-19 13:02:00'),(64,'20261119100041565',16415,5,'green,violet','shonu','2026-11-19 13:02:30'),(65,'20261119100041566',25746,6,'red','shonu','2026-11-19 13:03:00'),(66,'20261119100041567',92697,7,'green','shonu','2026-11-19 13:03:31'),(67,'20261119100041568',94767,7,'green','shonu','2026-11-19 13:04:00'),(68,'20261119100041569',45180,0,'red,violet','shonu','2026-11-19 13:04:30'),(69,'20261119100041570',43213,3,'green','shonu','2026-11-19 13:05:00'),(70,'20261119100041571',56474,4,'red','shonu','2026-11-19 13:05:31'),(71,'20261119100041572',82875,5,'green,violet','shonu','2026-11-19 13:06:00'),(72,'20261119100041573',93885,5,'green,violet','shonu','2026-11-19 13:06:30'),(73,'20261119100041574',49622,2,'red','shonu','2026-11-19 13:07:01'),(74,'20261119100041575',39215,5,'green,violet','shonu','2026-11-19 13:07:31'),(75,'20261119100041576',78183,3,'green','shonu','2026-11-19 13:08:00'),(76,'20261119100041577',86296,6,'red','shonu','2026-11-19 13:08:30'),(77,'20261119100041578',23133,3,'green','shonu','2026-11-19 13:09:00'),(78,'20261119100041579',26966,6,'red','shonu','2026-11-19 13:09:31'),(79,'20261119100041580',49276,6,'red','shonu','2026-11-19 13:10:00'),(80,'20261119100041581',56843,3,'green','shonu','2026-11-19 13:10:30'),(81,'20261119100041582',35171,1,'green','shonu','2026-11-19 13:11:01'),(82,'20261119100041583',39682,2,'red','shonu','2026-11-19 13:11:31'),(83,'20261119100041584',42539,9,'green','shonu','2026-11-19 13:12:00'),(84,'20261119100041585',65811,1,'green','shonu','2026-11-19 13:12:30'),(85,'20261119100041586',49150,0,'red,violet','shonu','2026-11-19 13:13:01'),(86,'20261119100041587',55921,1,'green','shonu','2026-11-19 13:13:31'),(87,'20261119100041588',63115,5,'green,violet','shonu','2026-11-19 13:14:00'),(88,'20261119100041589',29611,1,'green','shonu','2026-11-19 13:14:30'),(89,'20261119100041590',92641,1,'green','shonu','2026-11-19 13:15:01'),(90,'20261119100041591',78477,7,'green','shonu','2026-11-19 13:15:31'),(91,'20261119100041592',91146,6,'red','shonu','2026-11-19 13:16:01'),(92,'20261119100041593',54454,4,'red','shonu','2026-11-19 13:16:31'),(93,'20261119100041594',31329,9,'green','shonu','2026-11-19 13:17:00'),(94,'20261119100041595',23545,5,'green,violet','shonu','2026-11-19 13:17:30'),(95,'20261119100041596',13517,7,'green','shonu','2026-11-19 13:18:00'),(96,'20261119100041597',32482,2,'red','shonu','2026-11-19 13:18:31'),(97,'20261119100041598',83376,6,'red','shonu','2026-11-19 13:19:00'),(98,'20261119100041599',33567,7,'green','shonu','2026-11-19 13:19:30'),(99,'20261119100041600',59551,1,'green','shonu','2026-11-19 13:20:00'),(100,'20261119100041601',33467,7,'green','shonu','2026-11-19 13:20:30'),(101,'20261119100041602',23897,7,'green','shonu','2026-11-19 13:21:01'),(102,'20261119100041603',86817,7,'green','shonu','2026-11-19 13:21:31'),(103,'20261119100041604',39416,6,'red','shonu','2026-11-19 13:22:00'),(104,'20261119100041605',38260,0,'red,violet','shonu','2026-11-19 13:22:30'),(105,'20261119100041606',66871,1,'green','shonu','2026-11-19 13:23:01'),(106,'20261119100041607',68637,7,'green','shonu','2026-11-19 13:23:31'),(107,'20261119100041608',78771,1,'green','shonu','2026-11-19 13:24:00'),(108,'20261119100041609',92768,8,'red','shonu','2026-11-19 13:24:30'),(109,'20261119100041610',44171,1,'green','shonu','2026-11-19 13:25:01'),(110,'20261119100041611',43625,5,'green,violet','shonu','2026-11-19 13:25:31'),(111,'20261119100041612',19257,7,'green','shonu','2026-11-19 13:26:00'),(112,'20261119100041613',64474,4,'red','shonu','2026-11-19 13:26:30'),(113,'20261119100041614',63180,0,'red,violet','shonu','2026-11-19 13:27:01'),(114,'20261119100041615',27988,8,'red','shonu','2026-11-19 13:27:31'),(115,'20261119100041616',18311,1,'green','shonu','2026-11-19 13:28:00'),(116,'20261119100041617',21921,1,'green','shonu','2026-11-19 13:28:30'),(117,'20261119100041618',87831,1,'green','shonu','2026-11-19 13:29:01'),(118,'20261119100041619',52826,6,'red','shonu','2026-11-19 13:29:31'),(119,'20261119100041620',75236,6,'red','shonu','2026-11-19 13:30:00'),(120,'20261119100041621',78895,5,'green,violet','shonu','2026-11-19 13:30:30'),(121,'20261119100041622',37384,4,'red','shonu','2026-11-19 13:31:01'),(122,'20261119100041623',38632,2,'red','shonu','2026-11-19 13:31:31'),(123,'20261119100041624',55178,8,'red','shonu','2026-11-19 13:32:00'),(124,'20261119100041625',43143,3,'green','shonu','2026-11-19 13:32:30'),(125,'20261119100041626',99829,9,'green','shonu','2026-11-19 13:33:00'),(126,'20261119100041627',61525,5,'green,violet','shonu','2026-11-19 13:33:31'),(127,'20261119100041628',29267,7,'green','shonu','2026-11-19 13:34:00'),(128,'20261119100041629',17977,7,'green','shonu','2026-11-19 13:34:30'),(129,'20261119100041630',65852,2,'red','shonu','2026-11-19 13:35:00'),(130,'20261119100041631',18166,6,'red','shonu','2026-11-19 13:35:30'),(131,'20261119100041632',73174,4,'red','shonu','2026-11-19 13:36:01'),(132,'20261119100041633',53290,0,'red,violet','shonu','2026-11-19 13:36:31'),(133,'20261119100041634',84530,0,'red,violet','shonu','2026-11-19 13:37:00'),(134,'20261119100041635',92635,5,'green,violet','shonu','2026-11-19 13:37:30'),(135,'20261119100041636',22249,9,'green','shonu','2026-11-19 13:38:01'),(136,'20261119100041637',47888,8,'red','shonu','2026-11-19 13:38:31'),(137,'20261119100041638',75281,1,'green','shonu','2026-11-19 13:39:00'),(138,'20261119100041639',25122,2,'red','shonu','2026-11-19 13:39:30'),(139,'20261119100041640',37693,3,'green','shonu','2026-11-19 13:40:01'),(140,'20261119100041641',34624,4,'red','shonu','2026-11-19 13:40:31'),(141,'20261119100041642',22956,6,'red','shonu','2026-11-19 13:41:01'),(142,'20261119100041643',15420,0,'red,violet','shonu','2026-11-19 13:41:31'),(143,'20261119100041644',44650,0,'red,violet','shonu','2026-11-19 13:42:00'),(144,'20261119100041645',38237,7,'green','shonu','2026-11-19 13:42:30'),(145,'20261119100041646',72868,8,'red','shonu','2026-11-19 13:43:01'),(146,'20261119100041647',59139,9,'green','shonu','2026-11-19 13:43:31'),(147,'20261119100041648',92996,6,'red','shonu','2026-11-19 13:44:00'),(148,'20261119100041649',95384,4,'red','shonu','2026-11-19 13:44:30'),(149,'20261119100041650',98686,6,'red','shonu','2026-11-19 13:45:00'),(150,'20261119100041651',49190,0,'red,violet','shonu','2026-11-19 13:45:31'),(151,'20261119100041652',13912,2,'red','shonu','2026-11-19 13:46:00'),(152,'20261119100041653',26624,4,'red','shonu','2026-11-19 13:46:30'),(153,'20261119100041654',76123,3,'green','shonu','2026-11-19 13:47:01'),(154,'20261119100041655',39726,6,'red','shonu','2026-11-19 13:47:31'),(155,'20261119100041656',99721,1,'green','shonu','2026-11-19 13:48:00'),(156,'20261119100041657',91166,6,'red','shonu','2026-11-19 13:48:30'),(157,'20261119100041658',79956,6,'red','shonu','2026-11-19 13:49:00'),(158,'20261119100041659',11544,4,'red','shonu','2026-11-19 13:49:30'),(159,'20261119100041660',89658,8,'red','shonu','2026-11-19 13:50:01'),(160,'20261119100041661',67842,2,'red','shonu','2026-11-19 13:50:31'),(161,'20261119100041662',77299,9,'green','shonu','2026-11-19 13:51:01'),(162,'20261119100041663',42581,1,'green','shonu','2026-11-19 13:51:31'),(163,'20261119100041664',62410,0,'red,violet','shonu','2026-11-19 13:52:00'),(164,'20261119100041665',47287,7,'green','shonu','2026-11-19 13:52:30'),(165,'20261119100041666',16698,8,'red','shonu','2026-11-19 13:53:01'),(166,'20261119100041667',87486,6,'red','shonu','2026-11-19 13:53:31'),(167,'20261119100041668',45493,3,'green','shonu','2026-11-19 13:54:00'),(168,'20261119100041669',96722,2,'red','shonu','2026-11-19 13:54:30'),(169,'20261119100041670',75565,5,'green,violet','shonu','2026-11-19 13:55:01'),(170,'20261119100041671',81296,6,'red','shonu','2026-11-19 13:55:31'),(171,'20261119100041672',12146,6,'red','shonu','2026-11-19 13:56:00'),(172,'20261119100041673',12726,6,'red','shonu','2026-11-19 13:56:30'),(173,'20261119100041674',13190,0,'red,violet','shonu','2026-11-19 13:57:01'),(174,'20261119100041675',18961,1,'green','shonu','2026-11-19 13:57:31'),(175,'20261119100041676',56279,9,'green','shonu','2026-11-19 13:58:00'),(176,'20261119100041677',26348,8,'red','shonu','2026-11-19 13:58:30'),(177,'20261119100041678',49753,3,'green','shonu','2026-11-19 13:59:00'),(178,'20261119100041679',81165,5,'green,violet','shonu','2026-11-19 13:59:30'),(179,'20261119100041680',49443,3,'green','shonu','2026-11-19 14:00:01'),(180,'20261119100041681',85959,9,'green','shonu','2026-11-19 14:00:31'),(181,'20261119100041682',53518,8,'red','shonu','2026-11-19 14:01:00'),(182,'20261119100041683',44195,5,'green,violet','shonu','2026-11-19 14:01:31'),(183,'20261119100041684',48431,1,'green','shonu','2026-11-19 14:02:00'),(184,'20261119100041685',18831,1,'green','shonu','2026-11-19 14:02:30'),(185,'20261119100041686',97170,0,'red,violet','shonu','2026-11-19 14:03:00'),(186,'20261119100041687',14984,4,'red','shonu','2026-11-19 14:03:30'),(187,'20261119100041688',67237,7,'green','shonu','2026-11-19 14:04:01'),(188,'20261119100041689',26312,2,'red','shonu','2026-11-19 14:04:31'),(189,'20261119100041690',79445,5,'green,violet','shonu','2026-11-19 14:05:00'),(190,'20261119100041691',99716,6,'red','shonu','2026-11-19 14:05:30'),(191,'20261119100041692',64625,5,'green,violet','shonu','2026-11-19 14:06:01'),(192,'20261119100041693',22223,3,'green','shonu','2026-11-19 14:06:30'),(193,'20261119100041694',32347,7,'green','shonu','2026-11-19 14:07:01'),(194,'20261119100041695',88957,7,'green','shonu','2026-11-19 14:07:31'),(195,'20261119100041696',19945,5,'green,violet','shonu','2026-11-19 14:08:00'),(196,'20261119100041697',71393,3,'green','shonu','2026-11-19 14:08:30'),(197,'20261119100041698',63486,6,'red','shonu','2026-11-19 14:09:00'),(198,'20261119100041699',12311,1,'green','shonu','2026-11-19 14:09:31'),(199,'20261119100041700',31164,4,'red','shonu','2026-11-19 14:10:00'),(200,'20261119100041701',94819,9,'green','shonu','2026-11-19 14:10:31'),(201,'20261119100041702',55488,8,'red','shonu','2026-11-19 14:11:00'),(202,'20261119100041703',81123,3,'green','shonu','2026-11-19 14:11:30'),(203,'20261119100041704',64865,5,'green,violet','shonu','2026-11-19 14:12:01'),(204,'20261119100041705',16130,0,'red,violet','shonu','2026-11-19 14:12:30'),(205,'20261119100041706',99469,9,'green','shonu','2026-11-19 14:13:01'),(206,'20261119100041707',21781,1,'green','shonu','2026-11-19 14:13:31'),(207,'20261119100041708',54650,0,'red,violet','shonu','2026-11-19 14:14:00'),(208,'20261119100041709',84663,3,'green','shonu','2026-11-19 14:14:30'),(209,'20261119100041710',17628,8,'red','shonu','2026-11-19 14:15:00'),(210,'20261119100041711',97712,2,'red','shonu','2026-11-19 14:15:31'),(211,'20261119100041712',44293,3,'green','shonu','2026-11-19 14:16:00'),(212,'20261119100041713',74869,9,'green','shonu','2026-11-19 14:16:30'),(213,'20261119100041714',92662,2,'red','shonu','2026-11-19 14:17:00'),(214,'20261119100041715',35630,0,'red,violet','shonu','2026-11-19 14:17:30'),(215,'20261119100041716',31915,5,'green,violet','shonu','2026-11-19 14:18:01'),(216,'20261119100041717',97142,2,'red','shonu','2026-11-19 14:18:31'),(217,'20261119100041718',12217,7,'green','shonu','2026-11-19 14:19:00'),(218,'20261119100041719',98116,6,'red','shonu','2026-11-19 14:19:30'),(219,'20261119100041720',33429,9,'green','shonu','2026-11-19 14:20:01'),(220,'20261119100041721',41912,2,'red','shonu','2026-11-19 14:20:31'),(221,'20261119100041722',27944,4,'red','shonu','2026-11-19 14:21:01'),(222,'20261119100041723',81118,8,'red','shonu','2026-11-19 14:21:31'),(223,'20261119100041724',21774,4,'red','shonu','2026-11-19 14:22:00'),(224,'20261119100041725',85410,0,'red,violet','shonu','2026-11-19 14:22:30'),(225,'20261119100041726',62674,4,'red','shonu','2026-11-19 14:23:01'),(226,'20261119100041727',34511,1,'green','shonu','2026-11-19 14:23:31'),(227,'20261119100041728',37716,6,'red','shonu','2026-11-19 14:24:00'),(228,'20261119100041729',29813,3,'green','shonu','2026-11-19 14:24:30'),(229,'20261119100041730',77170,0,'red,violet','shonu','2026-11-19 14:25:01'),(230,'20261119100041731',28449,9,'green','shonu','2026-11-19 14:25:31'),(231,'20261119100041732',76490,0,'red,violet','shonu','2026-11-19 14:26:00'),(232,'20261119100041733',37892,2,'red','shonu','2026-11-19 14:26:30'),(233,'20261119100041734',59270,0,'red,violet','shonu','2026-11-19 14:27:01'),(234,'20261119100041735',39148,8,'red','shonu','2026-11-19 14:27:31'),(235,'20261119100041736',66981,1,'green','shonu','2026-11-19 14:28:00'),(236,'20261119100041737',81347,7,'green','shonu','2026-11-19 14:28:30'),(237,'20261119100041738',18864,4,'red','shonu','2026-11-19 14:29:01'),(238,'20261119100041739',68285,5,'green,violet','shonu','2026-11-19 14:29:04'),(239,'20261119100041740',91311,1,'green','shonu','2026-11-19 14:29:31'),(240,'20261119100041741',82598,8,'red','shonu','2026-11-19 14:30:00'),(241,'20261119100041742',14971,1,'green','shonu','2026-11-19 14:31:30'),(242,'20261119100041743',11333,3,'green','shonu','2026-11-19 14:32:01'),(243,'20261119100041744',26538,8,'red','shonu','2026-11-19 14:32:31'),(244,'20261119100041745',83928,8,'red','shonu','2026-11-19 14:33:00'),(245,'20261119100041746',35156,6,'red','shonu','2026-11-19 14:33:30'),(246,'20261119100041747',51927,7,'green','shonu','2026-11-19 14:34:00'),(247,'20261119100041748',74572,2,'red','shonu','2026-11-19 14:34:30'),(248,'20261119100041749',75944,4,'red','shonu','2026-11-19 14:35:00'),(249,'20261119100041750',35433,3,'green','shonu','2026-11-19 14:35:30'),(250,'20261119100041751',25955,5,'green,violet','shonu','2026-11-19 14:36:01'),(251,'20261119100041752',36334,4,'red','shonu','2026-11-19 14:36:31'),(252,'20261119100041753',37848,8,'red','shonu','2026-11-19 14:37:00'),(253,'20261119100041754',79770,0,'red,violet','shonu','2026-11-19 14:37:30'),(254,'20261119100041755',83514,4,'red','shonu','2026-11-19 14:38:01'),(255,'20261119100041756',42512,2,'red','shonu','2026-11-19 14:38:31'),(256,'20261119100041757',68229,9,'green','shonu','2026-11-19 14:39:00'),(257,'20261119100041758',41550,0,'red,violet','shonu','2026-11-19 14:39:31'),(258,'20261119100041759',22397,7,'green','shonu','2026-11-19 14:40:00'),(259,'20261119100041760',56444,4,'red','shonu','2026-11-19 14:40:31'),(260,'20261119100041761',47743,3,'green','shonu','2026-11-19 14:41:00'),(261,'20261119100041762',82127,7,'green','shonu','2026-11-19 14:41:30'),(262,'20261119100041763',97224,4,'red','shonu','2026-11-19 14:42:00'),(263,'20261119100041764',55244,4,'red','shonu','2026-11-19 14:42:31'),(264,'20261119100041765',82160,0,'red,violet','shonu','2026-11-19 14:43:00'),(265,'20261119100041766',47425,5,'green,violet','shonu','2026-11-19 14:43:30'),(266,'20261119100041767',51581,1,'green','shonu','2026-11-19 14:44:00'),(267,'20261119100041768',77670,0,'red,violet','shonu','2026-11-19 14:44:30'),(268,'20261119100041769',17222,2,'red','shonu','2026-11-19 14:45:01'),(269,'20261119100041770',52854,4,'red','shonu','2026-11-19 14:45:31'),(270,'20261119100041771',33965,5,'green,violet','shonu','2026-11-19 14:46:00'),(271,'20261119100041772',52357,7,'green','shonu','2026-11-19 14:46:30'),(272,'20261119100041773',17670,0,'red,violet','shonu','2026-11-19 14:47:01'),(273,'20261119100041774',32546,6,'red','shonu','2026-11-19 14:47:31'),(274,'20261119100041775',25274,4,'red','shonu','2026-11-19 14:48:00'),(275,'20261119100041776',23841,1,'green','shonu','2026-11-19 14:48:30'),(276,'20261119100041777',98691,1,'green','shonu','2026-11-19 14:49:01'),(277,'20261119100041778',69670,0,'red,violet','shonu','2026-11-19 14:49:31'),(278,'20261119100041779',91629,9,'green','shonu','2026-11-19 14:50:00'),(279,'20261119100041780',24141,1,'green','shonu','2026-11-19 14:50:31'),(280,'20261119100041781',56818,8,'red','shonu','2026-11-19 14:51:00'),(281,'20261119100041782',91873,3,'green','shonu','2026-11-19 14:51:30'),(282,'20261119100041783',93123,3,'green','shonu','2026-11-19 14:52:00'),(283,'20261119100041784',92543,3,'green','shonu','2026-11-19 14:52:30'),(284,'20261119100041785',83536,6,'red','shonu','2026-11-19 14:53:01'),(285,'20261119100041786',76921,1,'green','shonu','2026-11-19 14:53:31'),(286,'20261119100041787',31162,2,'red','shonu','2026-11-19 14:54:00'),(287,'20261119100041788',56428,8,'red','shonu','2026-11-19 14:54:30'),(288,'20261119100041789',87423,3,'green','shonu','2026-11-19 14:55:01'),(289,'20261119100041790',41576,6,'red','shonu','2026-11-19 14:55:31'),(290,'20261119100041791',65990,0,'red,violet','shonu','2026-11-19 14:56:00'),(291,'20261119100041792',44468,8,'red','shonu','2026-11-19 14:56:30'),(292,'20261119100041793',62722,2,'red','shonu','2026-11-19 14:57:01'),(293,'20261119100041794',26354,4,'red','shonu','2026-11-19 14:57:31'),(294,'20261119100041795',68319,9,'green','shonu','2026-11-19 14:58:00'),(295,'20261119100041796',92365,5,'green,violet','shonu','2026-11-19 14:58:30'),(296,'20261119100041797',75633,3,'green','shonu','2026-11-19 14:59:01'),(297,'20261119100041798',28912,2,'red','shonu','2026-11-19 14:59:31'),(298,'20261119100041799',85143,3,'green','shonu','2026-11-19 15:00:00'),(299,'20261119100041800',95325,5,'green,violet','shonu','2026-11-19 15:00:30'),(300,'20261119100041801',43897,7,'green','shonu','2026-11-19 15:01:01'),(301,'20261119100041802',42938,8,'red','shonu','2026-11-19 15:01:31'),(302,'20261119100041803',46858,8,'red','shonu','2026-11-19 15:02:00'),(303,'20261119100041804',86879,9,'green','shonu','2026-11-19 15:02:30'),(304,'20261119100041805',54423,3,'green','shonu','2026-11-19 15:03:00'),(305,'20261119100041806',55596,6,'red','shonu','2026-11-19 15:03:31'),(306,'20261119100041807',31467,7,'green','shonu','2026-11-19 15:04:00'),(307,'20261119100041808',84582,2,'red','shonu','2026-11-19 15:04:30'),(308,'20261119100041809',95558,8,'red','shonu','2026-11-19 15:05:00'),(309,'20261119100041810',22181,1,'green','shonu','2026-11-19 15:05:31'),(310,'20261119100041811',17290,0,'red,violet','shonu','2026-11-19 15:06:00'),(311,'20261119100041812',86880,0,'red,violet','shonu','2026-11-19 15:06:30'),(312,'20261119100041813',77378,8,'red','shonu','2026-11-19 15:07:00'),(313,'20261119100041814',47677,7,'green','shonu','2026-11-19 15:07:30'),(314,'20261119100041815',34150,0,'red,violet','shonu','2026-11-19 15:08:01'),(315,'20261119100041816',42729,9,'green','shonu','2026-11-19 15:08:31'),(316,'20261119100041817',55856,6,'red','shonu','2026-11-19 15:09:01'),(317,'20261119100041818',79881,1,'green','shonu','2026-11-19 15:09:31'),(318,'20261119100041819',17857,7,'green','shonu','2026-11-19 15:10:00'),(319,'20261119100041820',47791,1,'green','shonu','2026-11-19 15:10:31'),(320,'20261119100041821',72147,7,'green','shonu','2026-11-19 15:11:00'),(321,'20261119100041822',97359,9,'green','shonu','2026-11-19 15:11:30'),(322,'20261119100041823',73115,5,'green,violet','shonu','2026-11-19 15:12:00'),(323,'20261119100041824',33924,4,'red','shonu','2026-11-19 15:12:31'),(324,'20261119100041825',47327,7,'green','shonu','2026-11-19 15:13:00'),(325,'20261119100041826',62613,3,'green','shonu','2026-11-19 15:13:30'),(326,'20261119100041827',88794,4,'red','shonu','2026-11-19 15:14:00'),(327,'20261119100041828',62650,0,'red,violet','shonu','2026-11-19 15:14:30'),(328,'20261119100041829',77256,6,'red','shonu','2026-11-19 15:15:01'),(329,'20261119100041830',21828,8,'red','shonu','2026-11-19 15:15:31'),(330,'20261119100041831',63134,4,'red','shonu','2026-11-19 15:16:01'),(331,'20261119100041832',55967,7,'green','shonu','2026-11-19 15:16:31'),(332,'20261119100041833',91234,4,'red','shonu','2026-11-19 15:17:00'),(333,'20261119100041834',93391,1,'green','shonu','2026-11-19 15:17:30'),(334,'20261119100041835',54780,0,'red,violet','shonu','2026-11-19 15:18:01'),(335,'20261119100041836',88120,0,'red,violet','shonu','2026-11-19 15:18:31'),(336,'20261119100041837',36384,4,'red','shonu','2026-11-19 15:19:00'),(337,'20261119100041838',41248,8,'red','shonu','2026-11-19 15:19:30'),(338,'20261119100041839',61961,1,'green','shonu','2026-11-19 15:20:01'),(339,'20261119100041840',18848,8,'red','shonu','2026-11-19 15:20:31'),(340,'20261119100041841',44863,3,'green','shonu','2026-11-19 15:21:01'),(341,'20261119100041842',41541,1,'green','shonu','2026-11-19 15:21:31'),(342,'20261119100041843',69974,4,'red','shonu','2026-11-19 15:22:00'),(343,'20261119100041844',56983,3,'green','shonu','2026-11-19 15:22:30'),(344,'20261119100041845',52884,4,'red','shonu','2026-11-19 15:23:00'),(345,'20261119100041846',56684,4,'red','shonu','2026-11-19 15:23:30'),(346,'20261119100041847',47723,3,'green','shonu','2026-11-19 15:24:01'),(347,'20261119100041848',27365,5,'green,violet','shonu','2026-11-19 15:24:31'),(348,'20261119100041849',75977,7,'green','shonu','2026-11-19 15:25:00'),(349,'20261119100041850',61561,1,'green','shonu','2026-11-19 15:25:31'),(350,'20261119100041851',79899,9,'green','shonu','2026-11-19 15:26:00'),(351,'20261119100041852',99897,7,'green','shonu','2026-11-19 15:26:30'),(352,'20261119100041853',65656,6,'red','shonu','2026-11-19 15:27:00'),(353,'20261119100041854',35867,7,'green','shonu','2026-11-19 15:27:31'),(354,'20261119100041855',56840,0,'red,violet','shonu','2026-11-19 15:28:00'),(355,'20261119100041856',94226,6,'red','shonu','2026-11-19 15:28:30'),(356,'20261119100041857',19324,4,'red','shonu','2026-11-19 15:29:00'),(357,'20261119100041858',57334,4,'red','shonu','2026-11-19 15:29:30'),(358,'20261119100041859',18846,6,'red','shonu','2026-11-19 15:30:01'),(359,'20261119100041860',75918,8,'red','shonu','2026-11-19 15:30:31'),(360,'20261119100041861',24611,1,'green','shonu','2026-11-19 15:31:00'),(361,'20261119100041862',82632,2,'red','shonu','2026-11-19 15:31:30'),(362,'20261119100041863',43753,3,'green','shonu','2026-11-19 15:32:01'),(363,'20261119100041864',73371,1,'green','shonu','2026-11-19 15:32:31'),(364,'20261119100041865',53536,6,'red','shonu','2026-11-19 15:33:00'),(365,'20261119100041866',41824,4,'red','shonu','2026-11-19 15:33:30'),(366,'20261119100041867',15712,2,'red','shonu','2026-11-19 15:34:01'),(367,'20261119100041868',18746,6,'red','shonu','2026-11-19 15:34:31'),(368,'20261119100041869',72570,0,'red,violet','shonu','2026-11-19 15:35:00'),(369,'20261119100041870',96587,7,'green','shonu','2026-11-19 15:35:03'),(370,'20261119100041871',32475,5,'green,violet','shonu','2026-11-19 15:35:30'),(371,'20261119100041872',67487,7,'green','shonu','2026-11-19 15:35:51'),(372,'20261119100041873',84929,9,'green','shonu','2026-11-19 15:37:01'),(373,'20261119100041874',91712,2,'red','shonu','2026-11-19 15:37:31'),(374,'20261119100041875',77159,9,'green','shonu','2026-11-19 15:38:00'),(375,'20261119100041876',71914,4,'red','shonu','2026-11-19 15:38:30'),(376,'20261119100041877',25814,4,'red','shonu','2026-11-19 15:38:52'),(377,'20261119100041878',51113,3,'green','shonu','2026-11-19 15:39:00'),(378,'20261119100041879',91773,3,'green','shonu','2026-11-19 17:44:14'),(379,'20261119100042129',58347,7,'green','shonu','2026-11-19 17:44:44'),(380,'20261119100042130',82887,7,'green','shonu','2026-11-19 17:44:59'),(381,'20261119100042131',83435,5,'green,violet','shonu','2026-11-19 17:45:29'),(382,'20261119100042132',41568,8,'red','shonu','2026-11-19 17:45:45'),(383,'20261119100042133',38158,8,'red','shonu','2026-11-19 17:46:16'),(384,'20261119100042134',84190,0,'red,violet','shonu','2026-11-19 17:46:31'),(385,'20261119100042135',64964,4,'red','shonu','2026-11-19 17:47:01'),(386,'20261119100042136',29861,1,'green','shonu','2026-11-19 17:47:17'),(387,'20261119100042137',56359,9,'green','shonu','2026-11-19 17:47:47'),(388,'20261119100042138',36442,2,'red','shonu','2026-11-19 17:48:03'),(389,'20261119100042139',62152,2,'red','shonu','2026-11-19 17:48:33'),(390,'20261119100042140',64993,3,'green','shonu','2026-11-19 17:48:49'),(391,'20261119100042141',32573,3,'green','shonu','2026-11-19 17:49:19'),(392,'20261119100042142',81416,6,'red','shonu','2026-11-19 17:49:35'),(393,'20261119100042143',88793,3,'green','shonu','2026-11-19 17:50:05'),(394,'20261119100042144',95957,7,'green','shonu','2026-11-19 17:50:20'),(395,'20261119100042145',16821,1,'green','shonu','2026-11-19 17:50:51'),(396,'20261119100042146',52825,5,'green,violet','shonu','2026-11-19 17:51:07'),(397,'20261119100042147',12289,9,'green','shonu','2026-11-19 17:51:37'),(398,'20261119100042148',16972,2,'red','shonu','2026-11-19 17:51:53'),(399,'20261119100042149',64514,4,'red','shonu','2026-11-19 17:54:10'),(400,'20261119100042150',15114,4,'red','shonu','2026-11-19 17:54:40'),(401,'20261119100042151',69438,8,'red','shonu','2026-11-19 17:54:56'),(402,'20261119100042152',29654,4,'red','shonu','2026-11-19 17:55:26'),(403,'20261119100042153',12411,1,'green','shonu','2026-11-19 17:55:42'),(404,'20261119100042154',25838,8,'red','shonu','2026-11-19 17:56:12'),(405,'20261119100042155',27782,2,'red','shonu','2026-11-19 17:56:28'),(406,'20261119100042156',33911,1,'green','shonu','2026-11-19 17:56:58'),(407,'20261119100042157',83963,3,'green','shonu','2026-11-19 17:57:13'),(408,'20261119100042158',78285,5,'green,violet','shonu','2026-11-19 17:57:43'),(409,'20261119100042159',14233,3,'green','shonu','2026-11-19 17:57:59'),(410,'20261119100042160',63233,3,'green','shonu','2026-11-19 17:58:29'),(411,'20261119100042161',71973,3,'green','shonu','2026-11-19 17:58:45'),(412,'20261119100042162',65643,3,'green','shonu','2026-11-19 17:59:15'),(413,'20261119100042163',42584,4,'red','shonu','2026-11-19 17:59:31'),(414,'20261119100042164',99329,9,'green','shonu','2026-11-19 18:00:01'),(415,'20261119100042165',54651,1,'green','shonu','2026-11-19 18:00:16'),(416,'20261119100042166',89938,8,'red','shonu','2026-11-19 18:02:33'),(417,'20261119100042167',51533,3,'green','shonu','2026-11-19 18:03:03'),(418,'20261119100042168',54751,1,'green','shonu','2026-11-19 18:03:19'),(419,'20261119100042169',11564,4,'red','shonu','2026-11-19 18:03:49'),(420,'20261119100042170',83998,8,'red','shonu','2026-11-19 18:04:05'),(421,'20261119100042171',14526,6,'red','shonu','2026-11-19 18:04:35'),(422,'20261119100042172',11519,9,'green','shonu','2026-11-19 18:04:50'),(423,'20261119100042173',86940,0,'red,violet','shonu','2026-11-19 18:05:20'),(424,'20261119100042174',14287,7,'green','shonu','2026-11-19 18:05:36'),(425,'20261119100042175',51751,1,'green','shonu','2026-11-19 18:06:06'),(426,'20261119100042176',32862,2,'red','shonu','2026-11-19 18:06:22'),(427,'20261119100042177',11338,8,'red','shonu','2026-11-19 18:06:52'),(428,'20261119100042178',12254,4,'red','shonu','2026-11-19 18:07:08'),(429,'20261119100042179',19864,4,'red','shonu','2026-11-19 18:07:38'),(430,'20261119100042180',89971,1,'green','shonu','2026-11-19 18:07:53'),(431,'20261119100042181',42479,9,'green','shonu','2026-11-19 18:10:11'),(432,'20261119100042182',34839,9,'green','shonu','2026-11-19 18:10:41'),(433,'20261119100042183',99891,1,'green','shonu','2026-11-19 18:10:57'),(434,'20261119100042184',43878,8,'red','shonu','2026-11-19 18:11:27'),(435,'20261119100042185',89393,3,'green','shonu','2026-11-19 18:11:43'),(436,'20261119100042186',58227,7,'green','shonu','2026-11-19 18:12:13'),(437,'20261119100042187',12479,9,'green','shonu','2026-11-19 18:12:29'),(438,'20261119100042188',32194,4,'red','shonu','2026-11-19 18:12:59'),(439,'20261119100042189',16227,7,'green','shonu','2026-11-19 18:13:15'),(440,'20261119100042190',32927,7,'green','shonu','2026-11-19 18:13:45'),(441,'20261119100042191',57496,6,'red','shonu','2026-11-19 18:14:00'),(442,'20261119100042192',33974,4,'red','shonu','2026-11-19 18:14:30'),(443,'20261119100042193',74262,2,'red','shonu','2026-11-19 18:14:46'),(444,'20261119100042194',93755,5,'green,violet','shonu','2026-11-19 18:15:16'),(445,'20261119100042195',71847,7,'green','shonu','2026-11-19 18:15:32'),(446,'20261119100042196',75280,0,'red,violet','shonu','2026-11-19 18:16:02'),(447,'20261119100042197',28275,5,'green,violet','shonu','2026-11-19 18:16:18'),(448,'20261119100042198',16886,6,'red','shonu','2026-11-19 18:18:35'),(449,'20261119100042199',97166,6,'red','shonu','2026-11-19 18:19:05'),(450,'20261119100042200',63793,3,'green','shonu','2026-11-19 18:19:21'),(451,'20261119100042201',66455,5,'green,violet','shonu','2026-11-19 18:19:51'),(452,'20261119100042202',98669,9,'green','shonu','2026-11-19 18:20:07'),(453,'20261119100042203',49879,9,'green','shonu','2026-11-19 18:20:37'),(454,'20261119100042204',99993,3,'green','shonu','2026-11-19 18:20:53'),(455,'20261119100042205',71594,4,'red','shonu','2026-11-19 18:21:24'),(456,'20261119100042206',53394,4,'red','shonu','2026-11-19 18:21:39'),(457,'20261119100042207',66418,8,'red','shonu','2026-11-19 18:22:09'),(458,'20261119100042208',59542,2,'red','shonu','2026-11-19 18:22:25'),(459,'20261119100042209',65541,1,'green','shonu','2026-11-19 18:22:55'),(460,'20261119100042210',59266,6,'red','shonu','2026-11-19 18:23:11'),(461,'20261119100042211',71659,9,'green','shonu','2026-11-19 18:23:41'),(462,'20261119100042212',51817,7,'green','shonu','2026-11-19 18:23:56'),(463,'20261119100042213',63898,8,'red','shonu','2026-11-19 18:26:14'),(464,'20261119100042214',78832,2,'red','shonu','2026-11-19 18:26:44'),(465,'20261119100042215',95874,4,'red','shonu','2026-11-19 18:27:00'),(466,'20261119100042216',75134,4,'red','shonu','2026-11-19 18:27:30'),(467,'20261119100042217',31153,3,'green','shonu','2026-11-19 18:27:45'),(468,'20261119100042218',65644,4,'red','shonu','2026-11-19 18:28:16'),(469,'20261119100042219',46960,0,'red,violet','shonu','2026-11-19 18:28:31'),(470,'20261119100042220',16924,4,'red','shonu','2026-11-19 18:29:01'),(471,'20261119100042221',15866,6,'red','shonu','2026-11-19 18:29:17'),(472,'20261119100042222',64386,6,'red','shonu','2026-11-19 18:29:47'),(473,'20261119100042223',54416,6,'red','shonu','2026-11-19 18:30:03'),(474,'20261119100042224',16610,0,'red,violet','shonu','2026-11-19 18:30:32'),(475,'20261119100042225',33110,0,'red,violet','shonu','2026-11-19 18:30:48'),(476,'20261119100042226',45877,7,'green','shonu','2026-11-19 18:31:18'),(477,'20261119100042227',46236,6,'red','shonu','2026-11-19 18:31:34'),(478,'20261119100042228',72764,4,'red','shonu','2026-11-19 18:32:04'),(479,'20261119100042229',81360,0,'red,violet','shonu','2026-11-19 18:32:19'),(480,'20261119100042230',29192,2,'red','shonu','2026-11-19 18:34:37'),(481,'20261119100042231',98168,8,'red','shonu','2026-11-19 18:35:07'),(482,'20261119100042232',14169,9,'green','shonu','2026-11-19 18:35:22'),(483,'20261119100042233',71476,6,'red','shonu','2026-11-19 18:35:53'),(484,'20261119100042234',69737,7,'green','shonu','2026-11-19 18:36:08'),(485,'20261119100042235',89370,0,'red,violet','shonu','2026-11-19 18:36:39'),(486,'20261119100042236',58561,1,'green','shonu','2026-11-19 18:36:54'),(487,'20261119100042237',14226,6,'red','shonu','2026-11-19 18:37:25'),(488,'20261119100042238',28514,4,'red','shonu','2026-11-19 18:37:40'),(489,'20261119100042239',87696,6,'red','shonu','2026-11-19 18:38:10'),(490,'20261119100042240',44143,3,'green','shonu','2026-11-19 18:38:26'),(491,'20261119100042241',11621,1,'green','shonu','2026-11-19 18:38:56'),(492,'20261119100042242',53719,9,'green','shonu','2026-11-19 18:39:11'),(493,'20261119100042243',77498,8,'red','shonu','2026-11-19 18:39:42'),(494,'20261119100042244',73463,3,'green','shonu','2026-11-19 18:39:57'),(495,'20261119100042245',57875,5,'green,violet','shonu','2026-11-19 18:42:15'),(496,'20261119100042246',85287,7,'green','shonu','2026-11-19 18:42:45'),(497,'20261119100042247',73477,7,'green','shonu','2026-11-19 18:43:01'),(498,'20261119100042248',29438,8,'red','shonu','2026-11-19 18:43:31'),(499,'20261119100042249',76775,5,'green,violet','shonu','2026-11-19 18:43:47'),(500,'20261119100042250',65866,6,'red','shonu','2026-11-19 18:44:17'),(501,'20261119100042251',87461,1,'green','shonu','2026-11-19 18:44:32'),(502,'20261119100042252',69932,2,'red','shonu','2026-11-19 18:45:02'),(503,'20261119100042253',41558,8,'red','shonu','2026-11-19 18:45:18'),(504,'20261119100042254',13691,1,'green','uncensored','2026-11-19 18:45:49'),(505,'20261119100042255',28371,1,'green','uncensored','2026-11-19 18:46:04'),(506,'20261119100042256',47911,1,'green','uncensored','2026-11-19 18:46:34'),(507,'20261119100042257',69741,1,'green','uncensored','2026-11-19 18:46:50'),(508,'20261119100042258',57531,1,'green','uncensored','2026-11-19 18:47:20'),(509,'20261119100042259',55575,5,'green,violet','shonu','2026-11-19 18:47:36'),(510,'20261119100042260',83626,6,'red','shonu','2026-11-19 18:48:06'),(511,'20261119100042261',29779,9,'green','shonu','2026-11-19 18:48:21'),(512,'20261119100042262',72489,9,'green','shonu','2026-11-19 18:50:39'),(513,'20261119100042263',43837,7,'green','shonu','2026-11-19 18:51:09'),(514,'20261119100042264',87962,2,'red','shonu','2026-11-19 18:51:25'),(515,'20261119100042265',75582,2,'red','shonu','2026-11-19 18:51:55'),(516,'20261119100042266',68976,6,'red','shonu','2026-11-19 18:52:11'),(517,'20261119100042267',87576,6,'red','shonu','2026-11-19 18:52:41'),(518,'20261119100042268',21444,4,'red','shonu','2026-11-19 18:52:56'),(519,'20261119100042269',71633,3,'green','shonu','2026-11-19 18:53:26'),(520,'20261119100042270',58633,3,'green','shonu','2026-11-19 18:53:42'),(521,'20261119100042271',58195,5,'green,violet','shonu','2026-11-19 18:54:12'),(522,'20261119100042272',65890,0,'red,violet','shonu','2026-11-19 18:54:28'),(523,'20261119100042273',86698,8,'red','shonu','2026-11-19 18:54:58'),(524,'20261119100042274',71196,6,'red','shonu','2026-11-19 18:55:14'),(525,'20261119100042275',48442,2,'red','shonu','2026-11-19 18:55:44'),(526,'20261119100042276',41796,6,'red','shonu','2026-11-19 18:56:01'),(527,'20261119100042277',43166,6,'red','shonu','2026-11-19 18:56:30'),(528,'20261119100042278',89663,3,'green','shonu','2026-11-19 18:56:45'),(529,'20261119100042279',57687,7,'green','shonu','2026-11-19 18:59:03'),(530,'20261119100042280',41142,2,'red','shonu','2026-11-19 18:59:33'),(531,'20261119100042281',18354,4,'red','shonu','2026-11-19 18:59:48'),(532,'20261119100042282',11860,0,'red,violet','shonu','2026-11-19 19:00:18'),(533,'20261119100042283',65572,2,'red','shonu','2026-11-19 19:00:34'),(534,'20261119100042284',73574,4,'red','shonu','2026-11-19 19:01:04'),(535,'20261119100042285',86515,5,'green,violet','shonu','2026-11-19 19:01:19'),(536,'20261119100042286',46529,9,'green','shonu','2026-11-19 19:01:49'),(537,'20261119100042287',75173,3,'green','shonu','2026-11-19 19:02:05'),(538,'20261119100042288',47144,4,'red','shonu','2026-11-19 19:02:35'),(539,'20261119100042289',86245,5,'green,violet','shonu','2026-11-19 19:02:51'),(540,'20261119100042290',18196,6,'red','shonu','2026-11-19 19:03:21'),(541,'20261119100042291',12360,0,'red,violet','shonu','2026-11-19 19:03:36'),(542,'20261119100042292',49961,1,'green','shonu','2026-11-19 19:04:07'),(543,'20261119100042293',21142,2,'red','shonu','2026-11-19 19:04:22'),(544,'20261119100042294',28745,5,'green,violet','shonu','2026-11-19 19:06:40'),(545,'20261119100042295',32581,1,'green','shonu','2026-11-19 19:07:10'),(546,'20261119100042296',11521,1,'green','shonu','2026-11-19 19:07:26'),(547,'20261119100042297',13420,0,'red,violet','shonu','2026-11-19 19:07:56'),(548,'20261119100042298',35590,0,'red,violet','shonu','2026-11-19 19:08:11'),(549,'20261119100042299',86550,0,'red,violet','shonu','2026-11-19 19:08:41'),(550,'20261119100042300',42512,2,'red','shonu','2026-11-19 19:08:57'),(551,'20261119100042301',93624,4,'red','shonu','2026-11-19 19:09:27'),(552,'20261119100042302',47719,9,'green','shonu','2026-11-19 19:09:43'),(553,'20261119100042303',47251,1,'green','shonu','2026-11-19 19:10:13'),(554,'20261119100042304',51369,9,'green','shonu','2026-11-19 19:10:29'),(555,'20261119100042305',63535,5,'green,violet','shonu','2026-11-19 19:10:59'),(556,'20261119100042306',34672,2,'red','shonu','2026-11-19 19:11:15'),(557,'20261119100042307',82453,3,'green','shonu','2026-11-19 19:11:45'),(558,'20261119100042308',49437,7,'green','shonu','2026-11-19 19:12:00'),(559,'20261119100042309',26825,5,'green,violet','shonu','2026-11-19 19:12:30'),(560,'20261119100042310',11199,9,'green','shonu','2026-11-19 19:12:46'),(561,'20261119100042311',41173,3,'green','shonu','2026-11-19 19:15:03'),(562,'20261119100042312',79678,8,'red','shonu','2026-11-19 19:15:34'),(563,'20261119100042313',95230,0,'red,violet','shonu','2026-11-19 19:16:35'),(564,'20261119100042314',27866,6,'red','shonu','2026-11-19 19:17:21'),(565,'20261119100042315',78631,1,'green','shonu','2026-11-19 19:17:52'),(566,'20261119100042316',36190,0,'red,violet','shonu','2026-11-19 19:18:22'),(567,'20261119100042317',64179,9,'green','shonu','2026-11-19 19:18:55'),(568,'20261119100042318',75215,5,'green,violet','shonu','2026-11-19 19:22:58'),(569,'20261119100042326',32249,9,'green','shonu','2026-11-19 19:25:35'),(570,'20261119100042332',52647,7,'green','shonu','2026-11-19 19:26:03'),(571,'20261119100042333',31680,0,'red,violet','shonu','2026-11-19 19:26:31'),(572,'20261119100042334',78713,3,'green','shonu','2026-11-19 19:27:26'),(573,'20261119100042335',97416,6,'red','shonu','2026-11-19 19:27:54'),(574,'20261119100042336',38629,9,'green','shonu','2026-11-19 19:28:22'),(575,'20261119100042337',77172,2,'red','shonu','2026-11-19 19:28:50'),(576,'20261119100042338',11535,5,'green,violet','shonu','2026-11-19 19:29:18'),(577,'20261119100042339',32898,8,'red','uncensored','2026-11-19 19:29:45'),(578,'20261119100042340',76971,1,'green','uncensored','2026-11-19 19:30:13'),(579,'20261119100042341',95544,4,'red','uncensored','2026-11-19 19:30:40'),(580,'20261119100042342',13537,7,'green','shonu','2026-11-19 19:31:37'),(581,'20261119100042344',12583,3,'green','shonu','2026-11-19 19:32:18'),(582,'20261119100042345',93656,6,'red','shonu','2026-11-19 19:32:45'),(583,'20261119100042346',67919,9,'green','shonu','2026-11-19 19:33:13'),(584,'20261119100042347',51642,2,'red','shonu','2026-11-19 19:33:41'),(585,'20261119100042348',45135,5,'green,violet','shonu','2026-11-19 19:34:09'),(586,'20261119100042349',72478,8,'red','shonu','2026-11-19 19:34:36'),(587,'20261119100051754',48585,5,'green,violet','shonu','2026-11-19 20:07:41'),(588,'20261119100051756',98594,4,'red','shonu','2026-11-19 20:08:54'),(589,'20261119100051757',66389,9,'green','shonu','2026-11-19 20:09:40'),(590,'20261119100051758',53775,5,'green,violet','shonu','2026-11-19 20:09:41'),(591,'20261119100051760',66751,1,'green','shonu','2026-11-19 20:10:08'),(592,'20261119100051761',32934,4,'red','shonu','2026-11-19 20:10:49'),(593,'20261119100051762',41417,7,'green','shonu','2026-11-19 20:11:17'),(594,'20261119100051763',62330,0,'red,violet','shonu','2026-11-19 20:11:45'),(595,'20261119100051764',77523,3,'green','shonu','2026-11-19 20:12:12'),(596,'20261119100051765',79176,6,'red','shonu','2026-11-19 20:12:40'),(597,'20261119100051766',69489,9,'green','shonu','2026-11-19 20:13:08'),(598,'20261119100051767',78382,2,'red','shonu','2026-11-19 20:13:36'),(599,'20261119100051768',62995,5,'green,violet','shonu','2026-11-19 20:14:04'),(600,'20261119100051769',41488,8,'red','shonu','2026-11-19 20:14:31'),(601,'20261119100051770',78163,3,'green','shonu','2026-11-19 20:16:00'),(602,'20261119100051771',69157,7,'green','shonu','2026-11-19 20:16:46'),(603,'20261119100051773',19973,3,'green','shonu','2026-11-19 20:17:32'),(604,'20261119100051774',46929,9,'green','shonu','2026-11-19 20:18:18'),(605,'20261119100051776',27186,6,'red','shonu','2026-11-19 20:19:04'),(606,'20261119100051777',14683,3,'green','shonu','2026-11-19 20:19:50'),(607,'20261119100051779',19351,1,'green','shonu','2026-11-19 20:20:09'),(608,'20261119100051780',34249,9,'green','shonu','2026-11-19 20:21:04'),(609,'20261119100051781',67154,4,'red','shonu','2026-11-19 20:21:50'),(610,'20261119100051783',33461,1,'green','shonu','2026-11-19 20:22:36'),(611,'20261119100051784',23512,2,'red','shonu','2026-11-19 20:23:22'),(612,'20261119100051786',69759,9,'green','shonu','2026-11-19 20:24:08'),(613,'20261119100051787',39955,5,'green,violet','shonu','2026-11-19 20:24:36'),(614,'20261119100051789',54311,1,'green','shonu','2026-11-19 20:25:23'),(615,'20261119100051790',15742,2,'red','shonu','2026-11-19 20:26:09'),(616,'20261119100051791',79545,5,'green,violet','shonu','2026-11-19 20:26:33'),(617,'20261119100051793',11532,2,'red','shonu','2026-11-19 20:27:56'),(618,'20261119100051794',11135,5,'green,violet','shonu','2026-11-19 20:29:05'),(619,'20261119100051796',35975,5,'green,violet','shonu','2026-11-19 20:30:24'),(620,'20261119100051799',91338,8,'red','shonu','2026-11-19 20:31:43'),(621,'20261119100051801',62839,9,'green','shonu','2026-11-19 20:34:09'),(622,'20261119100051804',55569,9,'green','shonu','2026-11-19 20:36:03'),(623,'20261119100051809',28513,3,'green','shonu','2026-11-19 20:37:05'),(624,'20261119100051813',16976,6,'red','shonu','2026-11-19 20:38:58');
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
) ENGINE=MyISAM AUTO_INCREMENT=110 DEFAULT CHARSET=latin1 COMMENT='WinGo 3-min: published results per period';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wingo_results_3min`
--

LOCK TABLES `wingo_results_3min` WRITE;
/*!40000 ALTER TABLE `wingo_results_3min` DISABLE KEYS */;
INSERT INTO `wingo_results_3min` VALUES (109,'20261119100020295',72995,5,'green,violet','shonu','2026-11-19 20:37:38'),(108,'20261119100020294',48969,9,'green','shonu','2026-11-19 20:34:44'),(107,'20261119100020293',74546,6,'red','shonu','2026-11-19 20:32:16');
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
) ENGINE=MyISAM AUTO_INCREMENT=65 DEFAULT CHARSET=latin1 COMMENT='WinGo 5-min: published results per period';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wingo_results_5min`
--

LOCK TABLES `wingo_results_5min` WRITE;
/*!40000 ALTER TABLE `wingo_results_5min` DISABLE KEYS */;
INSERT INTO `wingo_results_5min` VALUES (64,'20261119100030177',92725,5,'green,violet','shonu','2026-11-19 20:32:50');
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

-- Dump completed on 2026-11-19 15:10:07
