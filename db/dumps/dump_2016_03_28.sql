-- MySQL dump 10.13  Distrib 5.5.41, for CYGWIN (x86_64)
--
-- Host: eorlbruder.de    Database: sopro
-- ------------------------------------------------------
-- Server version	5.5.5-10.0.22-MariaDB-log

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
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `status` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `settings` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'Max','Mustermann','blub@blub.com',2,'mmuster','sdfsadf','','2014-11-06 17:26:38','2014-11-06 17:26:38'),(2,'Bla','Hansen','bla@blub.com',2,'kmuster','sdfsadf','','2014-11-06 17:26:38','2014-11-06 17:26:38'),(3,'Joerg','Boll','blech@blub.com',2,'jmuster','sdfsadf','','2014-11-06 17:26:38','2014-11-06 17:26:38'),(4,'JÃ¼rgen','Iplahub','ping@pong.com',2,'tmuster','sdfsadf','','2014-11-06 17:26:38','2014-11-06 17:26:38'),(5,'Thorsten','MÃ¼ller','thorsten@blub.com',2,'xmuster','sdfsadf','','2014-11-06 17:26:38','2014-11-06 17:26:38'),(6,'Tom','Schmidt','XxxKillor2002@blub.com',2,'bmuster','sdfsadf','','2014-11-06 17:26:38','2014-11-06 17:26:38'),(7,'Otto','Mustermann','idaho@blub.com',2,'amuster','passwort','','2014-11-06 17:26:38','2014-11-06 17:26:38'),(8,'So','Pro','a@b.c',2,'sopro','123','','0000-00-00 00:00:00',NULL);
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `has_favorite`
--

DROP TABLE IF EXISTS `has_favorite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `has_favorite` (
  `customer_id` int(11) NOT NULL,
  `recipe_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `has_favorite`
--

LOCK TABLES `has_favorite` WRITE;
/*!40000 ALTER TABLE `has_favorite` DISABLE KEYS */;
INSERT INTO `has_favorite` VALUES (8,2);
/*!40000 ALTER TABLE `has_favorite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `has_ingredient_in_fridge`
--

DROP TABLE IF EXISTS `has_ingredient_in_fridge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `has_ingredient_in_fridge` (
  `customer_id` int(11) NOT NULL,
  `ingredient_id` int(11) NOT NULL,
  `unit_id` int(11) NOT NULL,
  `expiration_date` datetime NOT NULL,
  `amount` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `has_ingredient_in_fridge`
--

LOCK TABLES `has_ingredient_in_fridge` WRITE;
/*!40000 ALTER TABLE `has_ingredient_in_fridge` DISABLE KEYS */;
/*!40000 ALTER TABLE `has_ingredient_in_fridge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `has_picture`
--

DROP TABLE IF EXISTS `has_picture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `has_picture` (
  `customer_id` int(11) NOT NULL,
  `picture_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `has_picture`
--

LOCK TABLES `has_picture` WRITE;
/*!40000 ALTER TABLE `has_picture` DISABLE KEYS */;
/*!40000 ALTER TABLE `has_picture` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `has_recipe`
--

DROP TABLE IF EXISTS `has_recipe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `has_recipe` (
  `customer_id` int(11) NOT NULL,
  `recipe_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `has_recipe`
--

LOCK TABLES `has_recipe` WRITE;
/*!40000 ALTER TABLE `has_recipe` DISABLE KEYS */;
/*!40000 ALTER TABLE `has_recipe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingredient_has_picture`
--

DROP TABLE IF EXISTS `ingredient_has_picture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ingredient_has_picture` (
  `ingredient_id` int(11) NOT NULL,
  `picture_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingredient_has_picture`
--

LOCK TABLES `ingredient_has_picture` WRITE;
/*!40000 ALTER TABLE `ingredient_has_picture` DISABLE KEYS */;
/*!40000 ALTER TABLE `ingredient_has_picture` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingredient_packages`
--

DROP TABLE IF EXISTS `ingredient_packages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ingredient_packages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ingredient_id` int(11) NOT NULL,
  `recipe_id` int(11) NOT NULL,
  `unit_id` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingredient_packages`
--

LOCK TABLES `ingredient_packages` WRITE;
/*!40000 ALTER TABLE `ingredient_packages` DISABLE KEYS */;
INSERT INTO `ingredient_packages` VALUES (1,1,1,1,5,'2014-11-06 17:26:38','2014-11-06 17:26:38'),(2,2,2,2,2,'2014-11-06 17:26:38','2014-11-06 17:26:38'),(3,2,3,2,3,'2014-11-06 17:26:38','2014-11-06 17:26:38'),(4,5,1,2,5,'2014-11-06 17:26:38','2014-11-06 17:26:38'),(5,6,3,1,1,'2014-11-06 17:26:38','2014-11-06 17:26:38');
/*!40000 ALTER TABLE `ingredient_packages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingredients`
--

DROP TABLE IF EXISTS `ingredients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ingredients` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text,
  `storage` text,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_ingredients_on_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingredients`
--

LOCK TABLES `ingredients` WRITE;
/*!40000 ALTER TABLE `ingredients` DISABLE KEYS */;
INSERT INTO `ingredients` VALUES (1,'Reis','WeiÃŸe KÃ¶rner, die toll schmecken kÃ¶nnen','In der TÃ¼te','2014-11-06 17:26:37','2014-11-06 17:26:37'),(2,'Nudeln','Schmecken immer super','In der TÃ¼te','2014-11-06 17:26:37','2014-11-06 17:26:37'),(3,'Fleisch','Nomnomnom','Im KÃ¼hlschrank','2014-11-06 17:26:37','2014-11-06 17:26:37'),(4,'Sahne','Macht bestimmt nicht fett','Im KÃ¼hlschrank','2014-11-06 17:26:37','2014-11-06 17:26:37'),(5,'Kartoffeln','Machen satt','Im dunklen Schrank','2014-11-06 17:26:38','2014-11-06 17:26:38'),(6,'Lady','Besonders für Chinesen','In der Wohnung bis fett genug','2014-11-06 17:26:38','2014-11-06 17:26:38'),(7,'Milch','Aber nur Bio Rohmilch','Im KÃ¼hlschrank','2014-11-06 17:26:38','2014-11-06 17:26:38');
/*!40000 ALTER TABLE `ingredients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `join_recipe_ingredients_units_tables`
--

DROP TABLE IF EXISTS `join_recipe_ingredients_units_tables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `join_recipe_ingredients_units_tables` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `amount` decimal(10,0) NOT NULL,
  `recipe_id` int(11) NOT NULL,
  `ingredient_id` int(11) NOT NULL,
  `unit_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `join_recipe_ingredients_units_tables`
--

LOCK TABLES `join_recipe_ingredients_units_tables` WRITE;
/*!40000 ALTER TABLE `join_recipe_ingredients_units_tables` DISABLE KEYS */;
/*!40000 ALTER TABLE `join_recipe_ingredients_units_tables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pictures`
--

DROP TABLE IF EXISTS `pictures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pictures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `picture` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `customer_id` int(11) NOT NULL,
  `recipe_id` int(11) DEFAULT NULL,
  `ingredient_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pictures`
--

LOCK TABLES `pictures` WRITE;
/*!40000 ALTER TABLE `pictures` DISABLE KEYS */;
INSERT INTO `pictures` VALUES (1,'/pfad/zu/bild','2014-11-06 17:26:38','2014-11-06 17:26:38',1,1,NULL),(2,'/pfad/zu/bild2','2014-11-06 17:26:38','2014-11-06 17:26:38',2,NULL,3);
/*!40000 ALTER TABLE `pictures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recipe_has_picture`
--

DROP TABLE IF EXISTS `recipe_has_picture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recipe_has_picture` (
  `recipe_id` int(11) NOT NULL,
  `picture_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipe_has_picture`
--

LOCK TABLES `recipe_has_picture` WRITE;
/*!40000 ALTER TABLE `recipe_has_picture` DISABLE KEYS */;
/*!40000 ALTER TABLE `recipe_has_picture` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recipes`
--

DROP TABLE IF EXISTS `recipes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recipes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `time` int(11) DEFAULT NULL,
  `description` text,
  `howto` text NOT NULL,
  `difficulty` int(11) NOT NULL,
  `tools` text,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `customer_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipes`
--

LOCK TABLES `recipes` WRITE;
/*!40000 ALTER TABLE `recipes` DISABLE KEYS */;
INSERT INTO `recipes` VALUES (1,'Lasagne',2,'NomNom','Nudeln zusammenwerfen',5,'Axt','2014-11-06 17:26:38','2014-11-06 17:26:38',1),(2,'Steak',5,'NomNomNom','Fleisch in die Pfanne hauen',1,'Messer','2014-11-06 17:26:38','2014-11-06 17:26:38',2),(3,'Lady am Spieß',4,'NomNomNomNom','Hund in die Pfanne hauen',1,'Spieß','2014-11-06 17:26:38','2014-11-06 17:26:38',3);
/*!40000 ALTER TABLE `recipes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20140418104954'),('20140418105302'),('20140418105325'),('20140418105359'),('20140418105424'),('20140418110343'),('20140418110835'),('20140519144938'),('20140918171010');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `units`
--

DROP TABLE IF EXISTS `units`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `units` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_units_on_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `units`
--

LOCK TABLES `units` WRITE;
/*!40000 ALTER TABLE `units` DISABLE KEYS */;
INSERT INTO `units` VALUES (1,'Meter','Perfekte MaÃŸeinheit, fÃ¼r Rezepte relativ sinnlos','2014-11-06 17:26:38','2014-11-06 17:26:38'),(2,'Kilogramm','Schon besser','2014-11-06 17:26:38','2014-11-06 17:26:38');
/*!40000 ALTER TABLE `units` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'sopro'
--
/*!50003 DROP PROCEDURE IF EXISTS `findIngredientByID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`sopro`@`%` PROCEDURE `findIngredientByID`(IN queryID int)
BEGIN
	SELECT * FROM `ingredients` as i
    WHERE i.id = queryID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `findIngredientByName` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`sopro`@`%` PROCEDURE `findIngredientByName`(IN queryName VARCHAR(255))
BEGIN
	SELECT * FROM `ingredients` as i
    WHERE i.name LIKE queryName;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `findRecipeByID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`sopro`@`%` PROCEDURE `findRecipeByID`(IN queryID int)
BEGIN
	SELECT * FROM `recipes` as r
    WHERE r.id = queryID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `findRecipeByName` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`sopro`@`%` PROCEDURE `findRecipeByName`(IN queryName VARCHAR(255))
BEGIN
SELECT * FROM recipes WHERE name like queryName;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getCustomerByMail` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`sopro`@`%` PROCEDURE `getCustomerByMail`(IN queryMail VARCHAR(255))
BEGIN
	SELECT * FROM `customers` as c
    WHERE c.email = queryMail;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getCustomerByUsername` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`sopro`@`%` PROCEDURE `getCustomerByUsername`(IN queryName VARCHAR(255))
BEGIN
	SELECT * FROM `customers` as c
    WHERE c.username = queryName;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getFavoritesForCustomer` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`sopro`@`%` PROCEDURE `getFavoritesForCustomer`(IN input_id varchar(100))
Select rec.* from customers cust join has_favorite fav on cust.id = fav.customer_id join recipes rec on rec.id = fav.recipe_id where cust.id=input_id; ;;
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

-- Dump completed on 2016-03-28 13:59:14
