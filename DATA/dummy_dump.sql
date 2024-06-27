-- MySQL dump 10.13  Distrib 8.0.36, for macos14 (arm64)
--
-- Host: 127.0.0.1    Database: ssafyhome
-- ------------------------------------------------------
-- Server version	8.3.0

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
-- DUMMY DUMP START
--
SET FOREIGN_KEY_CHECKS = 0;


--
-- Table structure for table `board`
--
DROP TABLE IF EXISTS `board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `board` (
  `board_id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `contents` varchar(10000) DEFAULT NULL,
  `user_id` varchar(20) DEFAULT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `viewCnt` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`board_id`),
  KEY `board_ibfk_1` (`user_id`),
  CONSTRAINT `board_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `members` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `board`
--

LOCK TABLES `board` WRITE;
/*!40000 ALTER TABLE `board` DISABLE KEYS */;
INSERT INTO `board` VALUES (3,'의정부 아파트 신규분양 현장들이 정말 폭탄급이네요','<p><span style=\"color: rgb(10, 46, 79);\">작년부터 시작된 의정부 신규 분양 현장들이 의정부역 더샵링크시티를 제외한 나머지들은 전부 미분양이라 분양상담사 대거 투입해 분양중입니다. 이번에도 신곡동 이편한세상도 미분양중인데 역시나 분양가가 평당1800만원~2천만원초반에 중도금 이자후불제,확장비,옵션비 포함시 평당 2천~2천2백정도 계산이 나오는데 의정부 신규아파트 분양가가 미분양이 발생되는데도 계속 고분양가 행진입니다. 건축비 요인도 있겠지만 일단 터트려놓구 어차피 언젠간 나갈거란거로 밀고 나가는거 같아요 앞으로 롯데등 7개 이상 새로 오픈할 신규단지들이 나오는데 정말 의정부 부동산시장이 걱정됩니다. 대구를 연상시키네요 입주시점에 입주폭찬에다 마이너스 매물 속출등등 예상이 됩니다. 한동안 의정부,포천,양주,동두천등 수도권 북부쪽은 투자로는 조심하시는게 낳을듯 합니다.</span></p>','HobbyistCoder','2024-05-23 08:32:26',4),(4,'2024년 2월 월간 아파트 시장동향에 대한 추가 해석','<p>아파트 시장동향 보고서에 대해 간략하게 풀이를 하겠습니다.</p><p>1. 매수우위지수와 전세수급지수</p><p><br></p><p>해당 자료는 KB에서 협력 중개업소를 통해 수집되는 정보를 통해 만들어집니다.</p><p><br></p><p>지수가 100을 넘어가면 매수 우위 혹은 전세 수급 우위라고 보시면 됩니다.</p><p><br></p><p>전체적으로 매수우위지수에서 50을 넘기는 지역이 없습니다.</p><p><br></p><p>즉 매수자가 많지 않은 상황이라고 보시면 됩니다.</p><p><br></p><p><img src=\"http://localhost:8080/myhome/file/display/21cdd553-1aa0-4d2f-a80f-c3d3461feef3_다운로드1.png\"></p><p><br></p><p><br></p><p>반면 전세수급지수는 높은 지역들이 있습니다.</p><p><br></p><p>충북, 강원, 전남의 전세 수급지수는 100을 넘었으며 절반 이상의 지역에서 전세수급지수는 100을 초과한 상태입니다.</p><p><br></p><p>전세의 경우는 전국적으로 강세를 보이고 있습니다.</p><p><br></p><p>&nbsp;</p><p><br></p><p>2. 전국 미분양 증감</p><p><br></p><p>전월에 미분양이 증가했던 아산시에서 대량의 미분양 해소가 있었습니다.</p><p><br></p><p>그 외 거제 지역과 원주 지역에서 상당히 많은 세대의 미분양 물량이 해소된 것으로 나타났습니다.</p><p><br></p><p><img src=\"http://localhost:8080/myhome/file/display/fc78e24c-5c08-48e9-8af6-69b11a4cf1dd_다운로드2.png\"></p><p><br></p><p><br></p><p>반면 미분양이 증가한 지역도 있습니다.</p><p><br></p><p>경상북도 구미시, 인천광역시 서구, 경기도 의정부시의 경우에는 미분양이 대량 증가했습니다.</p><p><br></p><p>특히 구미시에서는 기록적인 숫자의 미분양이 발생했습니다.</p><p><br></p><p><img src=\"http://localhost:8080/myhome/file/display/cce89ddf-4f03-47de-8d43-52444ee68c47_다운로드3.png\"></p>','TravelSphere','2024-05-23 08:36:48',11),(5,'올해 부동산 전망은 밝아보입니다.','<p>상반기 중반기까지는 바닥을 다지고 하반기부터 점차 실수요자와 투자자 위주로 급매물이 소화되면서 정부 세제개편이 양도세,취득세 한시적 면제같은 부동산대책이 나오면서 시장이 점차 활성화되지 않을까 극히 주관적인 생각을 해봅니다.</p><p><br></p>','BookWormBuddy','2024-05-23 08:38:28',4),(6,'부동산 투자 어떻게 할까? 정민하 대표님 특강 후기','<p>부동산 투자 어떻게 할까? 정민하 대표님 특강 잘들었습니다.</p><p><br></p><p>과거 데이터를 바탕으로 현재의 상황을 이해하기 쉽게 잘 설명해주셔서 감사합니다.^^</p>','BookWormBuddy','2024-05-23 08:39:08',2),(7,'좋은 부동산자리소개','<p>분당,죽전 부동산자리 매물 다량 확보하고 있습니다. 방문해 주시면 성심껏 도와드리겠습니다. 분당 미금역 1번출구에 위치하고있습니다.</p><p><br></p><p>미금역 삼성부동산 031-717-7070, 017-238-7303</p><p><br></p><p>죽전동 6평 500- 250-1000 아파트,상가취급 전문요지</p><p>죽전동 15평 1000-100-2000 10년된자리,원룸,상가,토지</p><p>죽전동 8평 4000-110-3000 단지내</p><p>정자동 14평 3000-150-2000 오피스텔,주상복합,상가</p><p>정자동 6평 2000- 80-3000 아파트 단지내</p><p>구미동 6평 2000-100-3000 오피스텔단지내,미금역세권</p><p>금곡동 8평 3000-150-9000 10년회원자리,역세권</p><p>금곡동 8평 3000-160-6000 10년회원자리,역세권,급매</p>','EcoWarrior2024','2024-05-23 08:43:02',6),(8,'본격적인 이사철을 맞이하는 부동산 시장의 동향 및 전망!','<p>아파트 가격 하락으로 매매관망세가 전세수요로 전환되면서 서울 아파트 전셋값은 42주 연속 오르고 있습니다. 아파트 입주 물량의 감소와 전세 사기 여파로 비아파트 수요까지 몰려와 아파트 전셋값 상승을 부추기고 있습니다. 특히 서울의 상승률은 경기,인천 지역의 상승률을 상회하고 있습니다. 최근 아파트 값이 약세로 돌아서자 집을 구입하는 대신 임대로 머무는 수요가 늘면서 전세 값이 강세를 보이고 있다고 볼 수 있습니다.</p><p><br></p><p>서울 아파트 전세값이 오른 반면 매매 가격은 14주째 하락해 엇갈린 행보를 보이고 있습니다. 고금리 지속과 부동산 경기 침체 속에 매매보다 전세수요가 강하기 때문이라는 분석입니다. 학군지 등 주거선호지역으로 몰리는 전세수요가 꾸준할 것으로 보이며 매맷값은 올해 꾸준하게 약보합세가 이뤄진다고 하면 전세수요가 늘어나니까 전셋값은 꾸준히 오를 것이라고 의견이 많은 편입니다. 서울 아파트 전세 오름세는 연내까지 지속될 가능성이 높으며 상반기까지는 금리 인하가 단행되지 않을 것으로 예상되어 매매를 관망할 것이고 그러면 결국 실수요자들은 전,월세로 움직여야 하는데 아파트의 경우 월세 보단 전세 수요가 높기 때문입니다.</p><p><br></p><p>다만 국지적으로는 일부 지역에서 전세수요가 매수로 이어지는 현상이 나타날 수 있다고 전망하고 있습니다. 젊은 세대 위주로 갭투자 가능한 중저가 지역으로 GTX 호재 지역인 인덕원,동탄,화성지역 등은 매수가 이어져 매맷값 상승이 나타날 수도 있습니다. 전반적으로는 선호단지 급매물 매수 문의는 있지만 매도 희망가격을 낮추기가 쉽지 않아 관망세가 지속하는 모습으로 지역별,단지별로는 상승과 하락이 혼조해 있지만 급매물위주로 거래되는 상황이어서 소폭 하락세는 지속하는 있는 모습입니다.</p><p><br></p><p>전셋값이 오르면 집값이 연동 돼 오르는 것은 거스를 수 없다는 의견도 있어 전세 수요가 매매로 이전될 가능성이 있습니다. 최근 거래량도 늘어나고 있고 전세,매매가격이 오르면서 갭 차이가 좁혀지고 있기 때문이며 매매 가격도 계속 빠질 수는 없기 때문에 전세 수요가 매매 수요로 이전되면서 거래량은 다소 회복될 수도 있을 것으로 예상하고 있습니다.</p><p><br></p><p>글 쓴 이 : 천천래미안공인중개사사무소 (대표 김인수)</p>','TechTrendz','2024-05-23 08:44:53',3),(9,'신곡주공푸르미 산지 1년째 후기','<p>여기 1년째 사는 사람입니다.&nbsp;</p><p>아침에 일어나면 눈이 뻑뻑하고, 이상하게 여기서는 악몽을 꿉니다.</p><p>여기와서 몸이 안좋아져서, 퇴사를 했습니다.</p><p>조용히 앉아있을라하면, 몸이 축 처지면서도 정신이 산만해져서 집중이 안되는 집이지요/</p><p><br></p><p>계속 앉아있으면 팔다리가 1분 이내에 저리고요,&nbsp;</p><p><br></p><p>집주인도 역전세라고 전세자금 돈 못돌려준다고하고.</p><p><br></p><p>악재가 겹치네요.</p><p>무슨 해결방법이 있을까요?</p>','MindfulMuse','2024-05-23 08:47:01',7);
/*!40000 ALTER TABLE `board` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-23 21:29:09


-- MySQL dump 10.13  Distrib 8.0.36, for macos14 (arm64)
--
-- Host: 127.0.0.1    Database: ssafyhome
-- ------------------------------------------------------
-- Server version	8.3.0

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
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` varchar(2000) DEFAULT NULL,
  `board_id` int DEFAULT NULL,
  `user_id` varchar(20) DEFAULT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `comment_ibfk_1` (`user_id`),
  KEY `comment_ibfk_2` (`board_id`),
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `members` (`user_id`) ON DELETE CASCADE,
  CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`board_id`) REFERENCES `board` (`board_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (1,'<p>너무 힘드시겠네요... 힘내세요!!</p>',9,'test1234','2024-05-23 10:38:10'),(2,'<p>매물의 위치는 어디인가요? 주변 환경이 궁금합니다.</p>',5,'supermmkpk1203','2024-05-23 12:22:07'),(4,'<p>근처에 학교와 마트가 있나요? 생활 편의성이 궁금합니다</p>',8,'TravelSphere','2024-05-23 12:23:17'),(5,'<p>주차 공간은 충분한가요? 주차 문제는 없는지 알고 싶습니다.</p>',7,'TravelSphere','2024-05-23 12:23:49'),(6,'<p>이 지역의 평균 시세와 비교했을 때 가격이 어떤가요?</p>',7,'BookWormBuddy','2024-05-23 12:24:30'),(7,'<p>이 지역의 평균 시세와 비교했을 때 가격이 어떤가요?</p>',8,'BookWormBuddy','2024-05-23 12:24:48'),(8,'<p>장기적인 투자 가치에 대해 어떻게 생각하시나요?</p>',3,'BookWormBuddy','2024-05-23 12:26:11'),(9,'<p>너무 좋은 정보네요~~ 분석 감사합니다! 잘 보고가요!!!</p>',4,'BookWormBuddy','2024-05-23 12:27:01');
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-23 21:29:09



-- MySQL dump 10.13  Distrib 8.0.36, for macos14 (arm64)
--
-- Host: 127.0.0.1    Database: ssafyhome
-- ------------------------------------------------------
-- Server version	8.3.0

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
-- Table structure for table `home_likes`
--

DROP TABLE IF EXISTS `home_likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `home_likes` (
  `like_id` int NOT NULL AUTO_INCREMENT,
  `user_id` varchar(20) NOT NULL,
  `aptCode` bigint NOT NULL,
  PRIMARY KEY (`like_id`),
  KEY `home_likes_ibfk_1` (`user_id`),
  KEY `home_likes_ibfk_2_idx` (`aptCode`),
  CONSTRAINT `home_likes_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `members` (`user_id`) ON DELETE CASCADE,
  CONSTRAINT `home_likes_ibfk_2` FOREIGN KEY (`aptCode`) REFERENCES `houseinfo` (`aptCode`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `home_likes`
--

LOCK TABLES `home_likes` WRITE;
/*!40000 ALTER TABLE `home_likes` DISABLE KEYS */;
INSERT INTO `home_likes` VALUES (3,'supermmkpk1203',11650000000118);
/*!40000 ALTER TABLE `home_likes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-23 21:29:09



-- MySQL dump 10.13  Distrib 8.0.36, for macos14 (arm64)
--
-- Host: 127.0.0.1    Database: ssafyhome
-- ------------------------------------------------------
-- Server version	8.3.0

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
INSERT INTO `members` VALUES ('','e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855','','','','','2024-05-23 12:14:13','user',NULL,NULL),('admin','03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4','admin@gmail.com','관리자','01024683579','멀티캠퍼스 역삼','2024-05-23 06:44:02','admin',NULL,NULL),('BookWormBuddy','03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4','BookWormBuddy@gmail.com','꿈꾸는나비','01023456786','광주 광산구 하남산단3번로 57','2024-05-23 08:24:30','user',NULL,NULL),('EcoWarrior2024','03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4','EcoWarrior2024@gmail.com','은하수여행자','01023436789','광주 광산구 하남산단2번로 57','2024-05-23 08:24:30','user',NULL,NULL),('HobbyistCoder','03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4','HobbyistCoder@gmail.com','별빛속으로','01023456788','광주 광산구 하남산단5번로 57','2024-05-23 08:24:30','user',NULL,NULL),('MindfulMuse','03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4','MindfulMuse@gmail.com','푸른바다','01032456789','광주 광산구 하남산단7번로 57','2024-05-23 08:24:30','user',NULL,NULL),('ssafy','03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4','ssafy@gmail.com','싸피','01023456789','광주 광산구 하남산단6번로 57','2024-05-23 06:44:02','user',NULL,NULL),('supermmkpk1203','cd698d9746e68ac11a2a7b1f734b741f2272c831a8dfdae8d5755858bf8373b4','supermmkpk@gmail.com','박봉균','01033782998','서울 강남구 삼성로 14','2024-05-23 11:21:45','user',NULL,NULL),('TechTrendz','03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4','TechTrendz@gmail.com','달빛요정','01023466789','광주 광산구 하남산단1번로 57','2024-05-23 08:24:30','user',NULL,NULL),('test1234','3ff55e3773cdca58b8766b05bb9481b1755b576d1176449a9e3154db9caf5f85','super@naver.com','슈퍼퍼','01087672615','서울 강남구 강남대로 476','2024-05-23 10:35:39','user',NULL,NULL),('TravelSphere','03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4','TravelSphere@gmail.com','하늘사랑','01023456787','광주 광산구 하남산단4번로 57','2024-05-23 08:24:30','user',NULL,NULL);
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

-- Dump completed on 2024-05-23 21:29:09



-- MySQL dump 10.13  Distrib 8.0.36, for macos14 (arm64)
--
-- Host: 127.0.0.1    Database: ssafyhome
-- ------------------------------------------------------
-- Server version	8.3.0

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
-- Table structure for table `notices`
--

DROP TABLE IF EXISTS `notices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notices` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `contents` varchar(10000) DEFAULT NULL,
  `reg_id` varchar(20) NOT NULL,
  `reg_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `notices_ibfk_1` (`reg_id`),
  CONSTRAINT `notices_ibfk_1` FOREIGN KEY (`reg_id`) REFERENCES `members` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notices`
--

LOCK TABLES `notices` WRITE;
/*!40000 ALTER TABLE `notices` DISABLE KEYS */;
INSERT INTO `notices` VALUES (3,' [공지] [완료]시스템 업데이트 및 서버작업 안내','<p><span style=\"color: rgb(34, 34, 34);\">Homescanner에서 알려드립니다.</span></p><p><br></p><p><span style=\"color: rgb(34, 34, 34);\">보다 나은서비스를 제공해 드리기 위해 서비스 점검 작업이 진행될 예정입니다.</span></p><p><span style=\"color: rgb(34, 34, 34);\">작업 시간 중에는 이용에 불편이 있을수 있사오니,&nbsp;</span></p><p><span style=\"color: rgb(34, 34, 34);\">아래 점검 시간을 반드시 확인 후 이용해 주시기 바랍니다.</span></p><p><br></p><p><span style=\"color: rgb(34, 34, 34);\">● 일시 : 2024년 01월 18일 목요일 00:00 ~ 06:00분 (약 6시간)</span></p><p><span style=\"color: rgb(34, 34, 34);\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(작업시간은 점검 내용에 따라 변경될 수 있습니다.)</span></p><p><br></p><p><span style=\"color: rgb(34, 34, 34);\">● 사유 : 시스템 정기 업데이트 작업 및 점검</span></p><p><br></p><p><span style=\"color: rgb(34, 34, 34);\">● 영향 : 일부 서비스</span></p><p><br></p><p><span style=\"color: rgb(34, 34, 34);\">이용에 불편을 드려 죄송합니다.</span></p><p><br></p><p><span style=\"color: rgb(34, 34, 34);\">더 나은 서비스를 이용하실 수 있도록 최선의 노력을 다하겠습니다.</span></p><p><br></p><p><span style=\"color: rgb(34, 34, 34);\">감사합니다.</span></p>','admin','2024-05-12 11:27:18'),(4,'[공지] 실거래 데이터 05월 15일자 기준 업데이트 안내','<p><span style=\"color: rgb(34, 34, 34);\">안녕하세요.&nbsp;</span></p><p><span style=\"color: rgb(34, 34, 34);\">&nbsp;</span></p><p><span style=\"color: rgb(34, 34, 34);\">부동산 거래의 시작과 끝.</span></p><p><span style=\"color: rgb(34, 34, 34);\">\'Homescanner\'입니다.</span></p><p><br></p><p><span style=\"color: rgb(34, 34, 34);\">언제 어디서든 전국 토지·건물 실거래가와 매물을</span></p><p><span style=\"color: rgb(34, 34, 34);\">한 번에 확인할 수 있는&nbsp;</span><strong style=\"color: rgb(34, 34, 34);\">\'실거래가 조회\' 서비스의</strong></p><p><strong>실거래 데이터가 2024년 05월 15일자(국토교통부 데이터 공개일자) 기준으로&nbsp;</strong></p><p><span style=\"color: rgb(34, 34, 34);\">반영되었습니다.</span></p><p><br></p><p><span style=\"color: rgb(34, 34, 34);\">Homescanner에서는 만족스러운 부동산 거래의</span></p><p><span style=\"color: rgb(34, 34, 34);\">종합 정보를&nbsp;제공해 드리기 위해 기능 및 데이터</span></p><p><span style=\"color: rgb(34, 34, 34);\">업데이트를 지속적으로 진행할&nbsp;예정이오니</span></p><p><span style=\"color: rgb(34, 34, 34);\">\'실거래가 조회\'서비스에 대한&nbsp;많은 이용과 관심을</span></p><p><span style=\"color: rgb(34, 34, 34);\">부탁드립니다.</span></p><p><br></p><p><span style=\"color: rgb(34, 34, 34);\">항상 만족스러운 서비스 제공을 위해 최선을 다하겠습니다.</span></p><p><span style=\"color: rgb(34, 34, 34);\">감사합니다.</span></p>','admin','2024-05-15 08:28:20'),(5,'[공지] Homescanner \'아파트 검색\' 페이지 통합 및 디자인 변경 안내','<p><span style=\"color: rgb(34, 34, 34);\">안녕하세요.</span></p><p><br></p><p><span style=\"color: rgb(34, 34, 34);\">부동산 거래의 시작과 끝.</span></p><p><span style=\"color: rgb(34, 34, 34);\">\'Homescanner\'입니다.</span></p><p><br></p><p><strong style=\"color: rgb(0, 0, 0);\">매물 페이지의 디자인이 일부 변경되어 안내드립니다.</strong></p><p><span style=\"color: rgb(34, 34, 34);\">아래 내용은&nbsp;중개회원 지도홈에도 동일하게 적용됩니다.</span></p><p><br></p><p><strong style=\"color: rgb(34, 34, 34);\">1. 주거용 매물과 상업용 매물 메뉴가 \'매물\' 로 통합되었습니다.</strong></p><p><br></p><p><strong style=\"color: rgb(34, 34, 34);\">2. 텍스트 가독성 향상을 위해 자간 간격을 변경하였습니다.</strong></p><p><br></p><p><strong style=\"color: rgb(34, 34, 34);\">3. 검색 필터 설정 시에도 페이지 화면을 밝게 볼 수 있습니다.</strong></p><p><br></p><p><br></p><p><span style=\"color: rgb(34, 34, 34);\">더 나은 서비스를 이용하실 수 있도록 최선의 노력을 다하겠습니다.</span></p><p><span style=\"color: rgb(34, 34, 34);\">감사합니다.</span></p>','admin','2024-05-22 11:33:54'),(6,'[공지] [완료] 데이터센터 클라우드 네트워크 점검 안내','<p><span style=\"color: rgb(34, 34, 34);\">안녕하세요?</span></p><p><br></p><p><span style=\"color: rgb(34, 34, 34);\">부동산 거래의 시작과 끝.</span></p><p><span style=\"color: rgb(34, 34, 34);\">\'Homescanner\'입니다.</span></p><p><br></p><p><span style=\"color: rgb(34, 34, 34);\">아래와 같이 데이터센터의 클라우드 네트워크장비 교체 및 점검 일정을 안내드립니다.</span></p><p><br></p><p><br></p><p><span style=\"color: rgb(34, 34, 34);\">- 아&nbsp;&nbsp;래 -&nbsp;</span></p><p><br></p><p><span style=\"color: rgb(34, 34, 34);\">1. 작업일시 : 2023년 08월 23일(수) 02시~06시 사이 (최대 1분)</span></p><p><span style=\"color: rgb(34, 34, 34);\">2. 작업내용 : 데이터센터 클라우드 네트워크 장비 교체</span></p><p><span style=\"color: rgb(34, 34, 34);\">3. 작업영향 : 전체서비스 접속영향 (최대 1분)</span></p><p><br></p><p><span style=\"color: rgb(34, 34, 34);\">별도의 변경사항은 공지를 통해 안내드리도록 하겠습니다.</span></p><p><br></p><p><span style=\"color: rgb(34, 34, 34);\">서비스 이용에 불편을 드린점 사과드립니다.</span></p><p><span style=\"color: rgb(34, 34, 34);\">더 나은 서비스를 이용하실 수 있도록 최선의 노력을 다하겠습니다.</span></p><p><br></p><p><span style=\"color: rgb(34, 34, 34);\">감사합니다.</span></p>','admin','2024-04-23 11:32:12'),(7,'[공지] [완료] 네트워크 접속 장애 관련 안내','<p><span style=\"color: rgb(34, 34, 34);\">안녕하세요.</span></p><p><br></p><p><span style=\"color: rgb(34, 34, 34);\">부동산 거래의 시작과 끝,</span></p><p><span style=\"color: rgb(34, 34, 34);\">\'Homescanner\'입니다.</span></p><p><br></p><p><span style=\"color: rgb(34, 34, 34);\">일부 서버에 한하여 접속 장애가 발생하였습니다.</span></p><p><strong style=\"color: rgb(34, 34, 34);\">현재는 조치 완료하여 정상적으로 서비스 이용이 가능합니다.</strong></p><p><br></p><p><span style=\"color: rgb(34, 34, 34);\">ㆍ일시: 2023-12-16 20:50~21:28</span></p><p><span style=\"color: rgb(34, 34, 34);\">ㆍ내용: IDC 센터 내 네트워크 장비 공격으로 인한 일부 서버 접속 장애</span></p><p><br></p><p><span style=\"color: rgb(34, 34, 34);\">서비스 이용에 불편을 드린 점 사과드리며,</span></p><p><span style=\"color: rgb(34, 34, 34);\">항상 만족스러운 서비스 제공을 위해 최선을 다하겠습니다.</span></p><p><br></p><p><span style=\"color: rgb(34, 34, 34);\">감사합니다.</span></p>','admin','2024-02-13 14:33:14'),(8,'[공지] 실거래 데이터 업데이트 지연 안내','<p><span style=\"color: rgb(34, 34, 34);\">안녕하세요.</span></p><p><span style=\"color: rgb(34, 34, 34);\">&nbsp;</span></p><p><span style=\"color: rgb(34, 34, 34);\">부동산 거래의 시작과 끝,</span></p><p><span style=\"color: rgb(34, 34, 34);\">\'Homescanner\'입니다.</span></p><p><br></p><p><span style=\"color: rgb(34, 34, 34);\">2024년 2월 15일자 기준 실거래 데이터 업데이트가</span></p><p><span style=\"color: rgb(34, 34, 34);\">국토교통부 실거래가 공개시스템 개편으로 인해 지연되었음을 안내드립니다.</span></p><p><br></p><p><span style=\"color: rgb(34, 34, 34);\">이에 따라 실거래 데이터 업데이트 및 앱 푸시 알림 발송은</span></p><p><span style=\"color: rgb(34, 34, 34);\">아래 일정에 따라 진행될 예정입니다.</span></p><p><span style=\"color: rgb(34, 34, 34);\">해당 일정은 변경될 수 있는 점 고객님의 양해를 부탁드립니다.</span></p><p><br></p><p><span style=\"color: rgb(34, 34, 34);\">------------------------------------------------------</span></p><p><strong style=\"color: rgb(0, 0, 255);\">▶ 2월 26일(월)</strong></p><p><strong style=\"color: rgb(34, 34, 34);\">&nbsp;- 실거래 데이터(02월 22일자 기준) 업데이트</strong></p><p><br></p><p><strong style=\"color: rgb(0, 0, 255);\">▶&nbsp;3월 5일(화)</strong></p><p><strong style=\"color: rgb(34, 34, 34);\">&nbsp;- 앱 푸시 발송</strong></p><p><span style=\"color: rgb(34, 34, 34);\">------------------------------------------------------</span></p><p><br></p><p><span style=\"color: rgb(34, 34, 34);\">위 내용에 대한 문의사항이 있으실 경우 1:1문의 게시판 또는&nbsp;</span></p><p><span style=\"color: rgb(34, 34, 34);\">고객센터(1661-0903)로 문의주시기 바랍니다.</span></p><p><br></p><p><span style=\"color: rgb(34, 34, 34);\">감사합니다.</span></p>','admin','2024-05-11 11:33:54'),(9,'[공지] Gmail 계정에 대한 간추린뉴스 발송 관련 안내','<p><span style=\"color: rgb(34, 34, 34);\">안녕하세요.</span></p><p><span style=\"color: rgb(34, 34, 34);\">&nbsp;</span></p><p><span style=\"color: rgb(34, 34, 34);\">부동산 거래의 시작과 끝,</span></p><p><span style=\"color: rgb(34, 34, 34);\">\'Homescanner\'입니다.</span></p><p><br></p><p><span style=\"color: rgb(34, 34, 34);\">Gmail 계정의 뉴스레터 구독자에 한하여</span></p><p><span style=\"color: rgb(34, 34, 34);\">현재 간추린 뉴스 발송이 일시 중단되었습니다.</span></p><p><span style=\"color: rgb(34, 34, 34);\">해당 문제는 Gmail 관련 보안 강화로 인해</span></p><p><span style=\"color: rgb(34, 34, 34);\">발생하는 것으로 확인되었습니다.</span></p><p><br></p><p><span style=\"color: rgb(34, 34, 34);\">정상 발송을 위해 현재 작업 중에 있으며,</span></p><p><strong style=\"color: rgb(0, 0, 255);\">2024년 2월 26일(월)부터 재발송될 예정입니다.</strong></p><p><span style=\"color: rgb(34, 34, 34);\">정상적인 메일 발송을 위해 최선을 다하도록 하겠습니다.</span></p><p><br></p><p><span style=\"color: rgb(34, 34, 34);\">사이트 상단 [인사이드] 메뉴 → \'간추린뉴스\' 페이지에서도</span></p><p><span style=\"color: rgb(34, 34, 34);\">간추린뉴스 확인이 가능하오니</span></p><p><span style=\"color: rgb(34, 34, 34);\">서비스 이용에 참고해 주시면 감사드리겠습니다.</span></p><p><br></p><p><span style=\"color: rgb(34, 34, 34);\">------------------------------------------------------</span></p><p><strong style=\"color: rgb(0, 0, 0);\">ㆍ일시 :&nbsp;</strong><strong style=\"color: rgb(255, 0, 0);\">2024년 2월 23일(금) 까지</strong></p><p><strong style=\"color: rgb(0, 0, 0);\">ㆍ내용 :&nbsp;</strong><strong style=\"color: rgb(34, 34, 34);\">Gmail 계정에 대한 간추린뉴스 발송 일시 중단</strong></p><p><span style=\"color: rgb(34, 34, 34);\">------------------------------------------------------</span></p><p><br></p><p><span style=\"color: rgb(34, 34, 34);\">위 내용에 대한 문의사항이 있으실 경우 1:1문의 게시판 또는&nbsp;</span></p><p><span style=\"color: rgb(34, 34, 34);\">고객센터(1661-0903)로 문의주시기 바랍니다.</span></p><p><br></p><p><span style=\"color: rgb(34, 34, 34);\">감사합니다.</span></p>','admin','2024-04-28 23:34:37'),(10,'[공지] 전국 아파트 및 빌라 동·호수별 AI 추정가 출시 예정 안내','<p><span style=\"color: rgb(34, 34, 34);\">안녕하세요.</span></p><p><br></p><p><span style=\"color: rgb(34, 34, 34);\">부동산 거래의 시작과 끝,</span></p><p><span style=\"color: rgb(34, 34, 34);\">\'Homescanner\'입니다.</span></p><p><br></p><p><span style=\"color: rgb(34, 34, 34);\">부동산플래닛은 빅데이터와 AI 기술을 활용하여 정확하고 신뢰할 수 있는 부동산 정보 서비스를 제공하기 위해 노력하고 있습니다.</span></p><p><span style=\"color: rgb(34, 34, 34);\">이번에 새롭게 선보이는&nbsp;</span><strong style=\"color: rgb(0, 0, 128);\">&lt;전국 아파트 및 빌라 동·호수별 AI 추정가 및 공동주택 공시가격 서비스&gt;</strong><span style=\"color: rgb(34, 34, 34);\">를 통해 더욱 가치 있는 정보를 전달하고자 합니다.</span></p><p><br></p><p><strong style=\"color: rgb(0, 0, 0);\">1. 출시 일정</strong></p><p><span style=\"color: rgb(34, 34, 34);\">ㆍ2024년 5월 15일(월) - 베타서비스 오픈</span></p><p><br></p><p><strong style=\"color: rgb(0, 0, 0);\">2. 서비스 내용</strong></p><p><strong style=\"color: rgb(0, 0, 205);\">ㆍ전국 아파트 및 빌라(연립/다세대) 동·호수별 AI 추정가 제공</strong></p><p><span style=\"color: rgb(34, 34, 34);\">&nbsp;- 실거래가, 매물, 공시가격, 시장상황, 유사거래 사례 등 다양한 데이터 활용</span></p><p><span style=\"color: rgb(34, 34, 34);\">&nbsp;- 빅데이터 분석과 머신러닝 알고리즘을 통한 추정가 산출</span></p><p><span style=\"color: rgb(34, 34, 34);\">&nbsp;- 정보가 부족한 일부 단지 제외</span></p><p><span style=\"color: rgb(34, 34, 34);\"><img src=\"https://www.bdsplanet.com/resources/upload/notice/1712902532609_1.png\"></span></p><p><br></p><p><strong style=\"color: rgb(0, 0, 205);\">ㆍ공동주택 공시가격 정보 제공</strong></p><p><span style=\"color: rgb(34, 34, 34);\">&nbsp;- AI 추정가와 함께 공시가격 정보를 한눈에 확인</span></p><p><span style=\"color: rgb(34, 34, 34);\"><img src=\"https://www.bdsplanet.com/resources/upload/notice/1712902547400_2.png\"></span></p><p><br></p><p><strong style=\"color: rgb(0, 0, 0);\">3. 이용 방법</strong></p><p><strong style=\"color: rgb(34, 34, 34);\">ㆍ부동산플래닛 웹 또는 모바일 애플리케이션 접속</strong></p><p><strong style=\"color: rgb(34, 34, 34);\">ㆍ회원가입 또는 로그인</strong></p><p><strong style=\"color: rgb(34, 34, 34);\">ㆍ실거래가조회 페이지에서 조회하려는 부동산 검색</strong></p><p><span style=\"color: rgb(34, 34, 34);\">&nbsp;- 검색창에서 주소 또는 단지명 입력</span></p><p><span style=\"color: rgb(34, 34, 34);\">&nbsp;- 지도 확대/축소, 이동을 통해 관심 지역으로 이동</span></p><p><span style=\"color: rgb(34, 34, 34);\">&nbsp;- 지도 위에 표시된 아파트 또는 빌라(연립/다세대) 마커 또는 지도 클릭</span></p><p><strong style=\"color: rgb(34, 34, 34);\">ㆍ해당 부동산의 상세정보에서 동·호수별 AI 추정가 및 공시가격 확인</strong></p><p><br></p><p><span style=\"color: rgb(34, 34, 34);\">AI 추정가는 다양한 데이터를 기반으로 산출되고 있으나 실제 가격과는 차이가 있을 수 있습니다.</span></p><p><span style=\"color: rgb(34, 34, 34);\">해당 정보는 시세 판단에 도움을 주는 참고 자료로만 사용하시기를 안내드리며, 실제 거래 시에는 전문가와 상담하시기를 권유드립니다.</span></p><p><br></p><p><span style=\"color: rgb(34, 34, 34);\">이번 신규 서비스 출시와 함께 임장 중복 저장, 부동산상세정보 UI/UX 등도 함께 업데이트되었으니 새로운 서비스에 대한 많은 이용을 부탁드립니다.</span></p><p><br></p><p><span style=\"color: rgb(34, 34, 34);\">부동산플래닛은 앞으로도 꾸준한 연구와 개발을 통해 더욱 정확하고 유용한 정보를 제공할 수 있도록 최선을 다하겠습니다.</span></p><p><br></p><p><span style=\"color: rgb(34, 34, 34);\">감사합니다.</span></p>','admin','2024-05-23 11:35:15');
/*!40000 ALTER TABLE `notices` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-23 21:29:09



-- MySQL dump 10.13  Distrib 8.0.36, for macos14 (arm64)
--
-- Host: 127.0.0.1    Database: ssafyhome
-- ------------------------------------------------------
-- Server version	8.3.0

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
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review` (
  `reviewCode` int NOT NULL AUTO_INCREMENT,
  `aptCode` bigint NOT NULL,
  `reviewText` varchar(1000) NOT NULL,
  `user_id` varchar(30) NOT NULL,
  `time` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`reviewCode`),
  KEY `aptCode` (`aptCode`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `aptCode` FOREIGN KEY (`aptCode`) REFERENCES `houseinfo` (`aptCode`),
  CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `members` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
INSERT INTO `review` VALUES (1,50110000000179,'<p>여기 좋아요!!!!</p>','test1234','2024-05-23 19:43:30');
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-23 21:29:09



SET FOREIGN_KEY_CHECKS = 1;
--
-- DUMMY DUMP COMPLETE
--