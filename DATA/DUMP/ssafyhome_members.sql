-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: ssafyhome
-- ------------------------------------------------------
-- Server version	8.0.35

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `members`
--

DROP TABLE IF EXISTS `members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `members` (
  `user_id` varchar(20) NOT NULL,
  `user_password` varchar(300) NOT NULL,
  `user_email` varchar(45) DEFAULT NULL,
  `user_name` varchar(20) NOT NULL,
  `user_mobile` varchar(11) NOT NULL,
  `user_address` varchar(50) NOT NULL,
  `join_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `role` varchar(10) DEFAULT 'user',
  `token` varchar(1000) DEFAULT NULL,
  `reset_token` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `members`
--

LOCK TABLES `members` WRITE;
/*!40000 ALTER TABLE `members` DISABLE KEYS */;
INSERT INTO `members` VALUES ('admin','03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4','admin@gmail.com','관리자','01024683579','멀티캠퍼스 역삼','2024-05-23 06:44:02','admin',NULL,NULL),('BookWormBuddy','03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4','BookWormBuddy@gmail.com','꿈꾸는나비','01023456786','광주 광산구 하남산단3번로 57','2024-05-23 08:24:30','user',NULL,NULL),('EcoWarrior2024','03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4','EcoWarrior2024@gmail.com','은하수여행자','01023436789','광주 광산구 하남산단2번로 57','2024-05-23 08:24:30','user',NULL,NULL),('HobbyistCoder','03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4','HobbyistCoder@gmail.com','별빛속으로','01023456788','광주 광산구 하남산단5번로 57','2024-05-23 08:24:30','user',NULL,NULL),('MindfulMuse','03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4','MindfulMuse@gmail.com','푸른바다','01032456789','광주 광산구 하남산단7번로 57','2024-05-23 08:24:30','user',NULL,NULL),('ssafy','03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4','ssafy@gmail.com','싸피','01023456789','광주 광산구 하남산단6번로 57','2024-05-23 06:44:02','user',NULL,NULL),('TechTrendz','03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4','TechTrendz@gmail.com','달빛요정','01023466789','광주 광산구 하남산단1번로 57','2024-05-23 08:24:30','user',NULL,NULL),('test','03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4','supermmkpk@gmail.com','봉균','01023456789','삼성전자 광주캠퍼스','2024-05-23 06:44:02','user',NULL,NULL),('TravelSphere','03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4','TravelSphere@gmail.com','하늘사랑','01023456787','광주 광산구 하남산단4번로 57','2024-05-23 08:24:30','user',NULL,NULL);
/*!40000 ALTER TABLE `members` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-23 17:54:16
