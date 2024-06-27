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
INSERT INTO `board` VALUES (3,'의정부 아파트 신규분양 현장들이 정말 폭탄급이네요','<p><span style=\"color: rgb(10, 46, 79);\">작년부터 시작된 의정부 신규 분양 현장들이 의정부역 더샵링크시티를 제외한 나머지들은 전부 미분양이라 분양상담사 대거 투입해 분양중입니다. 이번에도 신곡동 이편한세상도 미분양중인데 역시나 분양가가 평당1800만원~2천만원초반에 중도금 이자후불제,확장비,옵션비 포함시 평당 2천~2천2백정도 계산이 나오는데 의정부 신규아파트 분양가가 미분양이 발생되는데도 계속 고분양가 행진입니다. 건축비 요인도 있겠지만 일단 터트려놓구 어차피 언젠간 나갈거란거로 밀고 나가는거 같아요 앞으로 롯데등 7개 이상 새로 오픈할 신규단지들이 나오는데 정말 의정부 부동산시장이 걱정됩니다. 대구를 연상시키네요 입주시점에 입주폭찬에다 마이너스 매물 속출등등 예상이 됩니다. 한동안 의정부,포천,양주,동두천등 수도권 북부쪽은 투자로는 조심하시는게 낳을듯 합니다.</span></p>','HobbyistCoder','2024-05-23 08:32:26',1),(4,'2024년 2월 월간 아파트 시장동향에 대한 추가 해석','<p>아파트 시장동향 보고서에 대해 간략하게 풀이를 하겠습니다.</p><p>1. 매수우위지수와 전세수급지수</p><p><br></p><p>해당 자료는 KB에서 협력 중개업소를 통해 수집되는 정보를 통해 만들어집니다.</p><p><br></p><p>지수가 100을 넘어가면 매수 우위 혹은 전세 수급 우위라고 보시면 됩니다.</p><p><br></p><p>전체적으로 매수우위지수에서 50을 넘기는 지역이 없습니다.</p><p><br></p><p>즉 매수자가 많지 않은 상황이라고 보시면 됩니다.</p><p><br></p><p><img src=\"http://localhost:8080/myhome/file/display/21cdd553-1aa0-4d2f-a80f-c3d3461feef3_다운로드1.png\"></p><p><br></p><p><br></p><p>반면 전세수급지수는 높은 지역들이 있습니다.</p><p><br></p><p>충북, 강원, 전남의 전세 수급지수는 100을 넘었으며 절반 이상의 지역에서 전세수급지수는 100을 초과한 상태입니다.</p><p><br></p><p>전세의 경우는 전국적으로 강세를 보이고 있습니다.</p><p><br></p><p>&nbsp;</p><p><br></p><p>2. 전국 미분양 증감</p><p><br></p><p>전월에 미분양이 증가했던 아산시에서 대량의 미분양 해소가 있었습니다.</p><p><br></p><p>그 외 거제 지역과 원주 지역에서 상당히 많은 세대의 미분양 물량이 해소된 것으로 나타났습니다.</p><p><br></p><p><img src=\"http://localhost:8080/myhome/file/display/fc78e24c-5c08-48e9-8af6-69b11a4cf1dd_다운로드2.png\"></p><p><br></p><p><br></p><p>반면 미분양이 증가한 지역도 있습니다.</p><p><br></p><p>경상북도 구미시, 인천광역시 서구, 경기도 의정부시의 경우에는 미분양이 대량 증가했습니다.</p><p><br></p><p>특히 구미시에서는 기록적인 숫자의 미분양이 발생했습니다.</p><p><br></p><p><img src=\"http://localhost:8080/myhome/file/display/cce89ddf-4f03-47de-8d43-52444ee68c47_다운로드3.png\"></p>','TravelSphere','2024-05-23 08:36:48',1),(5,'올해 부동산 전망은 밝아보입니다.','<p>상반기 중반기까지는 바닥을 다지고 하반기부터 점차 실수요자와 투자자 위주로 급매물이 소화되면서 정부 세제개편이 양도세,취득세 한시적 면제같은 부동산대책이 나오면서 시장이 점차 활성화되지 않을까 극히 주관적인 생각을 해봅니다.</p><p><br></p>','BookWormBuddy','2024-05-23 08:38:28',0),(6,'부동산 투자 어떻게 할까? 정민하 대표님 특강 후기','<p>부동산 투자 어떻게 할까? 정민하 대표님 특강 잘들었습니다.</p><p><br></p><p>과거 데이터를 바탕으로 현재의 상황을 이해하기 쉽게 잘 설명해주셔서 감사합니다.^^</p>','BookWormBuddy','2024-05-23 08:39:08',1),(7,'좋은 부동산자리소개','<p>분당,죽전 부동산자리 매물 다량 확보하고 있습니다. 방문해 주시면 성심껏 도와드리겠습니다. 분당 미금역 1번출구에 위치하고있습니다.</p><p><br></p><p>미금역 삼성부동산 031-717-7070, 017-238-7303</p><p><br></p><p>죽전동 6평 500- 250-1000 아파트,상가취급 전문요지</p><p>죽전동 15평 1000-100-2000 10년된자리,원룸,상가,토지</p><p>죽전동 8평 4000-110-3000 단지내</p><p>정자동 14평 3000-150-2000 오피스텔,주상복합,상가</p><p>정자동 6평 2000- 80-3000 아파트 단지내</p><p>구미동 6평 2000-100-3000 오피스텔단지내,미금역세권</p><p>금곡동 8평 3000-150-9000 10년회원자리,역세권</p><p>금곡동 8평 3000-160-6000 10년회원자리,역세권,급매</p>','EcoWarrior2024','2024-05-23 08:43:02',0),(8,'본격적인 이사철을 맞이하는 부동산 시장의 동향 및 전망!','<p>아파트 가격 하락으로 매매관망세가 전세수요로 전환되면서 서울 아파트 전셋값은 42주 연속 오르고 있습니다. 아파트 입주 물량의 감소와 전세 사기 여파로 비아파트 수요까지 몰려와 아파트 전셋값 상승을 부추기고 있습니다. 특히 서울의 상승률은 경기,인천 지역의 상승률을 상회하고 있습니다. 최근 아파트 값이 약세로 돌아서자 집을 구입하는 대신 임대로 머무는 수요가 늘면서 전세 값이 강세를 보이고 있다고 볼 수 있습니다.</p><p><br></p><p>서울 아파트 전세값이 오른 반면 매매 가격은 14주째 하락해 엇갈린 행보를 보이고 있습니다. 고금리 지속과 부동산 경기 침체 속에 매매보다 전세수요가 강하기 때문이라는 분석입니다. 학군지 등 주거선호지역으로 몰리는 전세수요가 꾸준할 것으로 보이며 매맷값은 올해 꾸준하게 약보합세가 이뤄진다고 하면 전세수요가 늘어나니까 전셋값은 꾸준히 오를 것이라고 의견이 많은 편입니다. 서울 아파트 전세 오름세는 연내까지 지속될 가능성이 높으며 상반기까지는 금리 인하가 단행되지 않을 것으로 예상되어 매매를 관망할 것이고 그러면 결국 실수요자들은 전,월세로 움직여야 하는데 아파트의 경우 월세 보단 전세 수요가 높기 때문입니다.</p><p><br></p><p>다만 국지적으로는 일부 지역에서 전세수요가 매수로 이어지는 현상이 나타날 수 있다고 전망하고 있습니다. 젊은 세대 위주로 갭투자 가능한 중저가 지역으로 GTX 호재 지역인 인덕원,동탄,화성지역 등은 매수가 이어져 매맷값 상승이 나타날 수도 있습니다. 전반적으로는 선호단지 급매물 매수 문의는 있지만 매도 희망가격을 낮추기가 쉽지 않아 관망세가 지속하는 모습으로 지역별,단지별로는 상승과 하락이 혼조해 있지만 급매물위주로 거래되는 상황이어서 소폭 하락세는 지속하는 있는 모습입니다.</p><p><br></p><p>전셋값이 오르면 집값이 연동 돼 오르는 것은 거스를 수 없다는 의견도 있어 전세 수요가 매매로 이전될 가능성이 있습니다. 최근 거래량도 늘어나고 있고 전세,매매가격이 오르면서 갭 차이가 좁혀지고 있기 때문이며 매매 가격도 계속 빠질 수는 없기 때문에 전세 수요가 매매 수요로 이전되면서 거래량은 다소 회복될 수도 있을 것으로 예상하고 있습니다.</p><p><br></p><p>글 쓴 이 : 천천래미안공인중개사사무소 (대표 김인수)</p>','TechTrendz','2024-05-23 08:44:53',1),(9,'신곡주공푸르미 산지 1년째 후기','<p>여기 1년째 사는 사람입니다.&nbsp;</p><p>아침에 일어나면 눈이 뻑뻑하고, 이상하게 여기서는 악몽을 꿉니다.</p><p>여기와서 몸이 안좋아져서, 퇴사를 했습니다.</p><p>조용히 앉아있을라하면, 몸이 축 처지면서도 정신이 산만해져서 집중이 안되는 집이지요/</p><p><br></p><p>계속 앉아있으면 팔다리가 1분 이내에 저리고요,&nbsp;</p><p><br></p><p>집주인도 역전세라고 전세자금 돈 못돌려준다고하고.</p><p><br></p><p>악재가 겹치네요.</p><p>무슨 해결방법이 있을까요?</p>','MindfulMuse','2024-05-23 08:47:01',0);
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

-- Dump completed on 2024-05-23 17:54:16
