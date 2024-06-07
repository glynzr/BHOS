-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: azerbaijandb
-- ------------------------------------------------------
-- Server version	8.0.22

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
-- Table structure for table `administrative_divisions`
--

DROP TABLE IF EXISTS `administrative_divisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `administrative_divisions` (
  `division_id` int NOT NULL AUTO_INCREMENT,
  `division_name` varchar(40) NOT NULL,
  `capital` varchar(40) DEFAULT NULL,
  `area` float(10,2) NOT NULL,
  `population` int NOT NULL,
  `region` varchar(40) NOT NULL,
  PRIMARY KEY (`division_id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrative_divisions`
--

LOCK TABLES `administrative_divisions` WRITE;
/*!40000 ALTER TABLE `administrative_divisions` DISABLE KEYS */;
INSERT INTO `administrative_divisions` VALUES (1,'Absheron District','Xirdalan',1360.00,192900,'Absheron'),(2,'Aghjabadi District','Aghjabadi',1760.00,124000,'Aran'),(3,'Agdam District','Alibeyli',1150.00,180600,'Yukhari-Karabakh'),(4,'Agdash District','Agdash',1050.00,100600,'Aran'),(5,'Agstafa District','Agstafa',1500.00,81400,'Ganja-Qazakh'),(6,'Agsu District','Agsu',1020.00,72100,'Daglig-Shirvan'),(7,'Shirvan (city)',NULL,30.00,78700,'Aran'),(8,'Astara District','Astara',620.00,98300,'Lankaran'),(9,'Baku (city)',NULL,2130.00,2092400,'Absheron'),(10,'Balakan District','Balakan',920.00,91100,'Shaki-Zaqatala'),(11,'Barda District','Barda',960.00,143900,'Aran'),(12,'Beylagan District','Beylagan',1130.00,87900,'Aran'),(13,'Bilasuvar District','Bilasuvar',1400.00,90300,'Aran'),(14,'Jabrayil District','Jabrayil',1050.00,72700,'Yukhari-Karabakh'),(15,'Jalilabad District','Jalilabad',1440.00,196500,'Lankaran'),(16,'Dashkasan District','Dashkasan',1050.00,33200,'Ganja-Qazakh'),(17,'Shabran District','Shabran',1090.00,53000,'Quba-Khachmaz'),(18,'Fuzuli District','Fuzuli',1390.00,118900,'Yukhari-Karabakh'),(19,'Gadabay District','Gadabay',1290.00,95000,'Ganja-Qazakh'),(20,'Ganja (city)',NULL,110.00,316300,'Ganja-Qazakh'),(21,'Goranboy District','Goranboy',1760.00,96200,'Ganja-Qazakh'),(22,'Goychay District','Goychay',740.00,111100,'Aran'),(23,'Hajigabul District','Hajiqabul',1640.00,67300,'Aran'),(24,'Imishli District','Imishli',1820.00,116600,'Aran'),(25,'Ismailli District','Ismailli',2060.00,80900,'Daglig-Shirvan'),(26,'Kalbajar District','Kalbajar',3050.00,83200,'Kalbajar-Lachin'),(27,'Kurdamir District','Kurdamir',1630.00,105700,'Aran'),(28,'Lachin District','Lachin',1840.00,70900,'Kalbajar-Lachin'),(29,'Lankaran District','Lankaran',1540.00,209900,'Lankaran'),(30,'Lankaran (city)',NULL,70.00,83300,'Lankaran'),(31,'Lerik District','Lerik',1080.00,76400,'Lankaran'),(32,'Masally District','Masally',720.00,202500,'Lankaran'),(33,'Mingachevir (city)',NULL,130.00,97800,'Aran'),(34,'Naftalan (city)',NULL,30.00,9100,'Ganja-Qazakh'),(35,'Neftchala District','Neftchala',1450.00,81300,'Aran'),(36,'Oghuz District','Oghuz',1220.00,40900,'Shaki-Zaqatala'),(37,'Qabala District','Qabala',1550.00,95600,'Shaki-Zaqatala'),(38,'Qakh District','Qakh',1490.00,53900,'Shaki-Zaqatala'),(39,'Qazakh District','Qazakh',700.00,90800,'Ganja-Qazakh'),(40,'Gobustan District','Gobustan',1370.00,41100,'Daglig-Shirvan'),(41,'Quba District','Quba',2580.00,155600,'Quba-Khachmaz'),(42,'Qubadli District','Qubadli',800.00,36700,'Kalbajar-Lachin'),(43,'Qusar District','Qusar',1540.00,89300,'Quba-Khachmaz'),(44,'Saatly District','Saatly',1180.00,95100,'Aran'),(45,'Sabirabad District','Sabirabad',1470.00,155400,'Aran'),(46,'Shaki District','Shaki',2430.00,173500,'Shaki-Zaqatala'),(47,'Shaki (city)',NULL,9.00,63700,'Shaki-Zaqatala'),(48,'Salyan District','Salyan',1790.00,124900,'Aran'),(49,'Shamakhi District','Shamakhi',1610.00,93700,'Daglig-Shirvan'),(50,'Shamkir District','Shamkir',1660.00,196100,'Ganja-Qazakh'),(51,'Samukh District','Nebiagali',1450.00,54600,'Ganja-Qazakh'),(52,'Siazan District','Siazan',700.00,38400,'Quba-Khachmaz'),(53,'Sumqayit(city)',NULL,80.00,314800,'Absheron'),(54,'Shusha District','Shusha',290.00,29700,'Yukhari-Karabakh'),(55,'Shusha (city)',NULL,5.50,4100,'Yukhari-Karabakh'),(56,'Tartar District','Tartar',960.00,98400,'Yukhari-Karabakh'),(57,'Tovuz District','Tovuz',1900.00,160700,'Ganja-Qazakh'),(58,'Ujar District','Ujar',850.00,79800,'Aran'),(59,'Khachmaz District','Khachmaz',1050.00,162100,'Quba-Khachmaz'),(60,'Khankendi í(city)',NULL,8.00,55200,'Yukhari-Karabakh'),(61,'Goygol District','Goygol',1030.00,58300,'Ganja-Qazakh'),(62,'Khizi District','Khizi',1850.00,14700,'Absheron'),(63,'Khojaly District','Khojali',940.00,26500,'Yukhari-Karabakh'),(64,'Khojavend District','Khojavend',1460.00,42100,'Yukhari-Karabakh'),(65,'Yardymli District','Yardymli',670.00,59600,'Lankaran'),(66,'Yevlakh District','Yevlakh',1540.00,119600,'Aran'),(67,'Yevlakh (city)',NULL,95.00,59036,'Aran'),(68,'Zangilan District','Zangilan',710.00,40500,'Kalbajar-Lachin'),(69,'Zaqatala District','Zaqatala',1350.00,120300,'Shaki-Zaqatala'),(70,'Zardab District','Zardab',860.00,54000,'Aran');
/*!40000 ALTER TABLE `administrative_divisions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `regionlar`
--

DROP TABLE IF EXISTS `regionlar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `regionlar` (
  `region_id` int NOT NULL AUTO_INCREMENT,
  `region_name` varchar(50) NOT NULL,
  `area` float(10,2) NOT NULL,
  `population` int NOT NULL,
  PRIMARY KEY (`region_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `regionlar`
--

LOCK TABLES `regionlar` WRITE;
/*!40000 ALTER TABLE `regionlar` DISABLE KEYS */;
INSERT INTO `regionlar` VALUES (1,'Absheron',5420.00,2613300),(2,'Ganja-Qazakh',12480.00,1191700),(3,'Shaki-Zaqatala',8969.00,543400),(4,'Lankaran',6140.00,926500),(5,'Guba-Khachmaz',6960.00,498400),(6,'Aran',23375.00,1893036),(7,'Upper-Kharabakh',7253.50,628200),(8,'Kalbajar-Lachin',6400.00,231300),(9,'Mountainos Shirvan',6060.00,287800),(10,'Nakhchivan',5550.00,414900);
/*!40000 ALTER TABLE `regionlar` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-29 23:52:19
