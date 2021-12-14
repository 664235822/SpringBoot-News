-- MySQL dump 10.13  Distrib 8.0.27, for Linux (x86_64)
--
-- Host: localhost    Database: News
-- ------------------------------------------------------
-- Server version	8.0.27-0ubuntu0.20.04.1

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
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `news` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `author` varchar(255) NOT NULL,
  `content` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `titlle_UNIQUE` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news`
--

LOCK TABLES `news` WRITE;
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
INSERT INTO `news` VALUES (1,'英雄联盟','admin\n            ','我是 Riot Rovient，从 12 月 10 日的执事(2021)事件开始，我们将对《英雄联盟》的任务积分系统进行调整。这次调整会尽量贴近现有系统，不会对大家的体验有很大影响。此外，有具体目标的任务(如“击杀 600 个小兵”)也不会改动。\n\n那么，到底哪里变了呢?\n\n今后所有《英雄联盟》事件中，积分奖励将根据你的游戏时长，而非游戏局数来发放。根据召唤师峡谷一局 PvP 比赛的平均时长，对部分任务的目标进行了调整。\n\n  ●  每周胜场任务：获得 40 积分，胜场 = 5 分 | 负场 = 2 分 —> 通过参加和赢得比赛获取 1650 分。每玩 1 分钟可获得 4 分，胜场每玩 1 分钟可获得 6 分(奖励 250 枚事件币)\n\n  ●  法球任务：进行 30 场对局 —> 获取 4500 分(奖励 1 个事件法球 + 40 枚事件币)\n\n  ●  通行证代币储存任务：进行一场对局(根据游戏模式和胜负，奖励 2-10 枚事件币) —> 获取 400 分(奖励 20 枚事件币)\n\n以下调整也将同时生效：\n\n  ●  极地大乱斗和限时游戏模式每玩 1 分钟可获得 4 分，胜场每玩 1 分钟可获得 6 分。此调整涵盖无限火力、克隆大作战、终极魔典等游戏模式。也就是说，这些模式的积分与 PvP 召唤师峡谷对局相同。\n\n  ●  《云顶之弈》每玩 1 分钟可获得 2 分，最终排名 1-4 位的对局每玩 1 分钟可获得 3 分。同时还加入了《云顶之弈》挂机检测功能。\n\n  ●  《云顶之弈》狂暴模式和双人作战也可积累《英雄联盟》任务进度了!\n\n  ●  人机对战游戏每玩 1 分钟可获得 1 分，胜场每玩 1 分钟可获得 2 分，积分速度是召唤师峡谷 PvP 对局的 33%。此模式仍不计入通行证代币储存任务。'),(2,'魔兽世界','admin\n            ','和最初发布《魔兽世界》经典怀旧服时一样，我们计划了六个内容发布阶段。但在旧世赛季服中，阶段解锁的速度将会加快。我们计划的周期为12个月，大约每隔一两个月都会解锁新的阶段。以下是目前的六个阶段的概要：\n\n第1阶段（《魔兽世界》旧世赛季服上线）\n\n熔火之心\n奥妮克希亚的巢穴\n玛拉顿\nPvP荣誉系统和战场（从第3和第4阶段提前）\n厄运之槌\n第2阶段\n\n艾索雷苟斯\n卡扎克\n第3阶段\n\n黑翼之巢\n暗月马戏团\n开始掉落暗月套牌\n第4阶段\n\n祖尔格拉布\n梦魇之龙\n第5阶段\n\n安其拉战争捐献开始\n安其拉团队副本随战争捐献进度开启\n第6阶段\n\n纳克萨玛斯\n天灾入侵\n补丁说明\n你可以在这里了解《魔兽世界》旧世赛季服的补丁说明。'),(3,'Dota2','admin\n            ','Dota职业巡回赛（DPC）2021/2022赛季的比赛即将打响，在新的赛季中，将有三次巡回赛，每次巡回包含2个联赛：1届地区联赛（DPC联赛）和1届甲级联赛（MAJOR）。而新赛季的DPC积分分配也有所调整，随着举办时间的推移，越靠近国际邀请赛（TI）的巡回赛，所提供的DPC积分也会随之增多，详细的DPC积分分配可以在下文中查看。\n在2020-2021赛季，完美世界电竞承办了DPC中国联赛全部两个赛季的比赛，并制作了两次甲级联赛（MAJOR）及国际邀请赛的中文信号流，在新的赛季中，完美世界电竞将继续承办2022 DPC中国联赛，致力于为玩家带来优秀的DOTA2赛事制作和直播。作为新赛季首个官方赛事，2022 DPC中国联赛 第一赛季将以“力量”为主题。让我们一起拭目以待，来看看转会期之后，哪些战队能够在新的赛季中脱颖而出。');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','123456');
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

-- Dump completed on 2021-12-14 16:42:43
