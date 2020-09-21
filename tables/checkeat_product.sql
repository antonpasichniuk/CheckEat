-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: checkeat
-- ------------------------------------------------------
-- Server version	8.0.19

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
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `amount` int NOT NULL,
  `price` decimal(7,2) NOT NULL,
  `min_price` decimal(7,2) DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  `category_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_category_idx` (`category_id`),
  CONSTRAINT `fk_category` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'white bread',15,15.00,NULL,'img/products/backery/white_bread.jpg',1),(2,'toast bread',30,19.00,NULL,'img/products/backery/toast_bread.jpg',1),(3,'baton',20,13.00,NULL,'img/products/backery/baton.jpg',1),(4,'borodinskiy',15,16.00,NULL,'img/products/backery/borodinskiy.jpg',1),(5,'selianskiy',10,10.00,NULL,'img/products/backery/selianskiy.jpg',1),(6,'straws',50,7.00,NULL,'img/products/backery/straws.jpg',1),(7,'gingerbread',30,19.00,NULL,'img/products/backery/gingerbread.jpg',1),(8,'cookies',500,80.00,NULL,'img/products/backery/cookies.jpg',1),(9,'cinnabon',25,29.00,NULL,'img/products/backery/cinnabon.jpg',1),(10,'pizza',40,80.00,NULL,'img/products/backery/pizza.jpg',1),(11,'snickers',100,18.00,NULL,'img/products/sweets/snickers.jpg',2),(12,'bounty',100,15.00,NULL,'img/products/sweets/bounty.jpg',2),(13,'twix',100,17.00,NULL,'img/products/sweets/twix.jpg',2),(14,'mars',100,14.00,NULL,'img/products/sweets/mars.jpg',2),(15,'lollipops',200,10.00,NULL,'img/products/sweets/lollipops.jpg',2),(16,'cake',20,200.00,NULL,'img/products/sweets/cake.jpg',2),(17,'kinder',320,29.99,NULL,'img/products/sweets/kinder.png',2),(18,'milka chocolate',100,28.50,NULL,'img/products/sweets/milka_chocolate.jpg',2),(19,'roshen chocolate',100,25.60,NULL,'img/products/sweets/roshen_chocolate.jpg',2),(20,'jeleiki',300,30.50,NULL,'img/products/sweets/jeleiki.jpg',2),(21,'tomato',70,40.00,NULL,'img/products/vegetables/tomato.jpg',3),(22,'cucumber',100,30.00,NULL,'img/products/vegetables/cucumber.jpg',3),(23,'potato',200,15.50,NULL,'img/products/vegetables/potato.jpg',3),(24,'onoin',100,14.65,NULL,'img/products/vegetables/onion.jpg',3),(25,'cabage',100,9.50,NULL,'img/products/vegetables/cabage.jpg',3),(26,'eggplant',20,29.99,NULL,'img/products/vegetables/eggplant.jpg',3),(27,'avocado',20,37.85,NULL,'img/products/vegetables/avocado.jpeg',3),(28,'green',15,8.99,NULL,'img/products/vegetables/green.jpg',3),(29,'carrot',100,13.45,NULL,'img/products/vegetables/carrot.jpg',3),(30,'beet',20,5.65,NULL,'img/products/vegetables/beet.jpg',3),(31,'apple',50,25.55,NULL,'img/products/fruit/apple.jpg',4),(32,'banana',50,29.50,NULL,'img/products/fruit/banana.jpg',4),(33,'pineapple',30,149.99,NULL,'img/products/fruit/pineapple.jpg',4),(34,'pear',20,25.95,NULL,'img/products/fruit/pear.jpeg',4),(35,'plump',20,31.25,NULL,'img/products/fruit/plump.jpg',4),(36,'watermelon',100,15.00,NULL,'img/products/fruit/watermelon.jpg',4),(37,'peach',25,25.50,NULL,'img/products/fruit/peach.jpg',4),(38,'grapes',30,30.00,NULL,'img/products/fruit/grapes.jpg',4),(39,'stawberry',50,55.50,NULL,'img/products/fruit/strawberry.jpg',4),(40,'raspberry',50,60.00,NULL,'img/products/fruit/raspberry.jpg',4),(41,'pasta',100,30.50,NULL,'img/products/grocery/pasta.jpg',5),(42,'macaroni',100,26.40,NULL,'img/products/grocery/macaroni.jpg',5),(43,'sun flower oil',80,27.05,NULL,'img/products/grocery/sun_flower_oil.jpg',5),(44,'olives',65,32.35,NULL,'img/products/grocery/olives.jpeg',5),(45,'farfalle',50,36.70,NULL,'img/products/grocery/farfalle.jpg',5),(46,'flour',200,15.00,NULL,'img/products/grocery/flour.jpg',5),(47,'rice',100,13.00,NULL,'img/products/grocery/rice.jpg',5),(48,'buckwheat',150,20.00,NULL,'img/products/grocery/buckwheat.jpeg',5),(49,'bulgur4ik',1000,1000.00,NULL,'img/products/grocery/bulgur.jpg',5),(50,'olive oil',30,85.99,NULL,'img/products/grocery/olive_oil.jpg',5),(51,'milk',30,35.10,NULL,'img/products/dairy/milk.jpg',6),(52,'kefir',20,32.40,NULL,'img/products/dairy/kefir.jpg',6),(53,'riagenka',20,37.75,NULL,'img/products/dairy/riagenka.jpg',6),(54,'cottage cheese',30,41.89,NULL,'img/products/dairy/cottage_cheese.jpg',6),(55,'cheese',40,151.20,NULL,'img/products/dairy/cheese.jpg',6),(56,'mozzarella',25,59.00,NULL,'img/products/dairy/mozzarella.jpg',6),(57,'yogurt',40,26.50,NULL,'img/products/dairy/yogurt.jpg',6),(58,'butter',100,83.50,NULL,'img/products/dairy/butter.jpg',6),(59,'margarin',80,39.00,NULL,'img/products/dairy/margarin.jpg',6),(60,'sour cream',45,25.50,NULL,'img/products/dairy/sour_cream.jpg',6),(61,'chicken',100,30.35,NULL,'img/products/butchers/chicken.jpg',7),(62,'pork',150,40.50,NULL,'img/products/butchers/pork.jpg',7),(63,'sausage',100,21.25,NULL,'img/products/butchers/sausage.jpg',7),(64,'veal',140,49.90,NULL,'img/products/butchers/veal.png',7),(65,'trout',100,39.50,NULL,'img/products/seafood/trout.jpg',8),(66,'octopus',10,756.25,NULL,'img/products/seafood/octopus.jpg',8),(67,'shrimp',100,150.95,NULL,'img/products/seafood/shrimp.jpeg',8),(68,'salmon',120,180.00,NULL,'img/products/seafood/salmon.jpg',8),(69,'lays',100,35.50,NULL,'img/products/snacks/lays.jpg',9),(70,'flint',50,17.25,NULL,'img/products/snacks/flint.jpg',9),(71,'lyks',40,29.99,NULL,'img/products/snacks/lyks.jpg',9),(72,'cheetos',100,50.00,NULL,'img/products/snacks/cheetos.jpg',9),(73,'ice cream',80,20.10,NULL,'img/products/frozen/ice_cream.jpg',10),(74,'pelmeni',50,44.35,NULL,'img/products/frozen/pelmeni.jpg',10),(75,'vareniki',50,51.40,NULL,'img/products/frozen/vareniki.png',10),(76,'frozen vegetables',50,32.90,NULL,'img/products/frozen/frozen_vegetables.jpg',10),(77,'beer',150,29.90,NULL,'img/products/alcohol/beer.jpg',11),(78,'viskie',40,150.00,125.00,'img/products/alcohol/viskie.jpg',11),(79,'rum',30,120.00,125.00,'img/products/alcohol/rum.jpg',11),(80,'vodka',100,59.00,70.00,'img/products/alcohol/vodka.jpg',11),(81,'morshinska',200,15.50,NULL,'img/products/water_juice/morshinska.jpg',12),(82,'sadochok',100,32.50,NULL,'img/products/water_juice/sadochok.jpg',12),(83,'coca-cola',150,25.65,NULL,'img/products/water_juice/coca-cola.jpg',12),(84,'fanta',150,23.40,NULL,'img/products/water_juice/fanta.png',12),(85,'winston',400,40.50,NULL,'img/products/cigarretes/winston.jpg',13),(86,'camel',400,39.50,NULL,'img/products/cigarretes/camel.jpg',13),(87,'ld',350,35.50,NULL,'img/products/cigarretes/ld.jpg',13),(88,'heets',500,41.50,NULL,'img/products/cigarretes/heets.png',13);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-06-05  3:37:19
