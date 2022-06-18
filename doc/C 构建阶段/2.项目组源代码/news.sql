-- MySQL dump 10.13  Distrib 8.0.29, for Linux (x86_64)
--
-- Host: localhost    Database: News
-- ------------------------------------------------------
-- Server version	8.0.29-0ubuntu0.20.04.3

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
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `newsId` int NOT NULL,
  `username` varchar(255) NOT NULL,
  `content` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (1,8,'登录','123'),(2,8,'登录','123'),(3,8,'登录','123');
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likes`
--

DROP TABLE IF EXISTS `likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `likes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `newsId` int NOT NULL,
  `username` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likes`
--

LOCK TABLES `likes` WRITE;
/*!40000 ALTER TABLE `likes` DISABLE KEYS */;
/*!40000 ALTER TABLE `likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `news` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `content` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `titlle_UNIQUE` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news`
--

LOCK TABLES `news` WRITE;
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
INSERT INTO `news` VALUES (8,'韩国总统文在寅已受邀来华出席北京冬奥会？外交部回应','admin\n            ','12月21日，外交部发言人赵立坚主持例行记者会。有记者提问，有报道称中方已经邀请了韩国总统文在寅来华出席北京冬奥会，中方能否确认相关消息？\n<br>\n赵立坚表示，我们欢迎国际社会和各界人士以各种方式来华参加和支持2022年北京冬奥会。\n<br>\n我们愿同各方一道，践行“更团结”的奥林匹克精神，向世界呈现一届简约、安全、精彩的奥运盛会，同时也促进相互间的友好与合作。\n<img src=\"https://assets.ubuntu.com/v1/a70bfab2-Managed-apps_wht.svg\"/>\n'),(9,'辽宁大连“11·03”疫情问责：批捕多人、追责40余人','admin\n            ','中新社大连12月20日电 (记者 杨毅)辽宁省大连市新冠肺炎疫情防控工作会议20日召开，听取“11·03”疫情溯源溯责溯罪工作进展情况汇报。根据会议通报，已有多人被检察机关依法批准逮捕，大连市纪委监委对42人追究党纪政务责任。\n<br>\n会议指出，“11·03”疫情是一起首站定点冷库、冷链食品加工企业和核酸检测、消杀第三方公司等进口冷链关联企业，为谋取不当利益藐视国家法律、置人民生命安全于不顾，勾结形成非法利益共同体，全链条违法犯罪，加之监管严重失职渎职而引发的重大事件。目前，警方已查实涉事企业及责任人员涉嫌妨害传染病防治、非国家工作人员行贿受贿、职务侵占等犯罪事实。\n<br>\n会议称，大连科强食品有限公司作为首站定点冷库，企业负责人、管理人员依法经营意识缺失，严重违反《大连市冷库疫情防控管理标准》等规定，造成新冠疫情暴发，涉嫌妨害传染病防治罪，警方已对公司法人代表、业务经理、业务员共5人采取刑事强制措施，其中2人已被检方依法批准逮捕。\n<br>\n此外，大连海青水产有限公司未落实有关防疫规定导致公司内部出现聚集性疫情，警方已对公司法人代表、工厂部总经理2人采取刑事强制措施。大连阳光金服综合门诊有限公司、大连连检熏蒸消毒有限公司、大连达亿检疫处理技术有限公司等以少采、空采等手段弄虚作假，造成新冠疫情传播的重大风险，上述3家公司共计8人被采取刑事强制措施，其中5人已被批准逮捕。\n<br>\n会议指出，大连市纪委监委对涉嫌失职渎职犯罪的庄河市首站定点冷库专班2名主要责任人员采取留置措施，将依法追究刑事责任。对庄河市委市政府分管领导和首站定点冷库专班、科强工作组以及有关职能部门、属地街道的责任人员，对大连市行业监管部门的责任人员等，共计42人追究党纪政务责任。同时，按干部管理权限报请辽宁省委省纪委对大连市政府分管领导，庄河市委市政府党政主要领导追责问责。(完)'),(10,'赵立坚宣布：中方决定对美方4名人员进行对等反制','admin\n            ','【环球时报-环球网报道 记者 乌元春】在12月21日的外交部例行记者会上，有记者提问：12月10日，美国国务院和财政部宣布，根据美国内法对所谓在新疆“侵犯人权”的4名中方官员实施制裁。中方对此有何回应？\n<br>\n发言人赵立坚对此表示，美方依据国内法、借口所谓新疆“人权”问题，对中方官员进行非法制裁，有关行径严重干涉中国内政，严重违反国际关系基本准则，严重损害中美关系。中方对此坚决反对，强烈谴责。\n<br>\n赵立坚宣布，针对美方上述错误行径，中方决定依据中国《反外国制裁法》进行对等反制。从即日起，对美国国际宗教自由委员会主席马恩扎、副主席特克尔、委员巴尔加瓦、委员卡尔实施相应反制措施，包括禁止上述人员入境中国，包括内地和香港澳门，冻结其在华财产，禁止中国公民和机构同其交易。\n<br>\n赵立坚指出，新疆事务纯属中国内政，美方没有权利没有资格横加干涉，美方应撤销所谓制裁，停止干涉新疆事务和中国内政，中方将视形势发展作出进一步反应。'),(11,'上海震旦职业学院教师被开除后续，南京大学教授朋友圈嘲讽举报者','admin\n            ','“学高为师，身正为范。”\n<br>\n这是对师范最好的诠释，同时也是对广大教师从业者最基本的要求。\n<br>\n教师在学生心目中的地位毋庸置疑，学生们大都会选择无条件地信任老师，所以这就要求教师们应当以身作则、树立表率，从思想上、行动上、作风上给学生们树立一个好的榜样。\n<br>\n相反，如果教师们发布了一些错误言论，传播一种错误的价值观，那将是对学生最大的误导和伤害。\n<br>\n上海震旦职业学院教师宋庚一就是发生在我们身边最典型的例子，作为一名高校教师，却公然在课堂上发表一些错误言论，质疑南京大屠杀遇难者人数，甚至还称应当让我们不要去恨，而应当反思战争是怎么来的。\n<br>\n上海震旦职业学院教师被开除后续，南京大学教授朋友圈嘲讽举报者\n这样的观点和言论着实让人感觉毁三观，也正是因为如此，才会有部分学生难以忍受，也不愿再让如此失德之人继续站在讲台之上。所以便通过手机拍摄了相关视频，后来该视频被上传至网络后引发了广泛讨论。');
/*!40000 ALTER TABLE `news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','123456'),(2,'664235822@qq.com','156318aq');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-13  9:10:58
