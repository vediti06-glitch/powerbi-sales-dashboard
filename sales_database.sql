CREATE DATABASE  IF NOT EXISTS `bi_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `bi_db`;
-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: localhost    Database: bi_db
-- ------------------------------------------------------
-- Server version	8.0.44

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
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `customer_id` int NOT NULL AUTO_INCREMENT,
  `customer_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `city` varchar(50) DEFAULT NULL,
  `signup_date` date DEFAULT NULL,
  PRIMARY KEY (`customer_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'Aarav Sharma','aarav@gmail.com','Mumbai','2025-01-10'),(2,'Riya Patil','riya@gmail.com','Pune','2025-01-15'),(3,'Neha Joshi','neha@gmail.com','Navi Mumbai','2025-01-22'),(4,'Karan Mehta','karan@gmail.com','Thane','2025-02-01'),(5,'Sneha Desai','sneha@gmail.com','Panvel','2025-02-11'),(6,'Aditya More','aditya@gmail.com','Mumbai','2025-02-20'),(7,'Pooja Kale','pooja@gmail.com','Pune','2025-03-02'),(8,'Rahul Patil','rahul@gmail.com','Nashik','2025-03-14'),(9,'Priya Shah','priya@gmail.com','Mumbai','2025-03-28'),(10,'Rohan Kulkarni','rohan@gmail.com','Pune','2025-03-29'),(11,'Simran Kaur','simran@gmail.com','Nashik','2025-03-30'),(12,'Vikas Patil','vikas@gmail.com','Thane','2025-04-01'),(13,'Anjali Verma','anjali@gmail.com','Panvel','2025-04-02'),(14,'Kunal Mehta','kunal@gmail.com','Mumbai','2025-04-03'),(15,'Snehal Joshi','snehal@gmail.com','Pune','2025-04-04'),(16,'Raj Malhotra','raj@gmail.com','Mumbai','2025-04-05'),(17,'Isha Nair','isha@gmail.com','Navi Mumbai','2025-04-06'),(18,'Yash Patil','yash@gmail.com','Thane','2025-04-07'),(19,'Tanvi Shah','tanvi@gmail.com','Mumbai','2025-04-08'),(20,'Aman Verma','aman@gmail.com','Pune','2025-04-09');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_items` (
  `order_item_id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `product_id` int NOT NULL,
  `quantity` int NOT NULL,
  `subtotal` decimal(10,2) NOT NULL,
  PRIMARY KEY (`order_item_id`),
  KEY `order_id` (`order_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
INSERT INTO `order_items` VALUES (1,1,1,1,1499.00),(2,1,2,1,799.00),(3,2,3,1,999.00),(4,3,4,1,1699.00),(5,4,5,1,1899.00),(6,5,6,1,2199.00),(7,6,1,1,1499.00),(8,7,7,1,2499.00),(9,8,2,1,799.00),(10,8,3,1,999.00),(11,9,8,1,1199.00),(12,10,4,1,1699.00),(13,10,5,1,1899.00),(14,11,5,1,2499.00),(15,12,3,1,1799.00),(16,13,7,1,3299.00),(17,14,1,1,1499.00),(18,15,6,1,2899.00),(19,16,4,2,3999.00),(20,17,2,2,2199.00),(21,18,5,1,1999.00),(22,19,7,1,2599.00),(23,20,8,1,1499.00);
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int NOT NULL,
  `order_date` date DEFAULT NULL,
  `total_amount` decimal(10,2) DEFAULT NULL,
  `order_status` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,1,'2025-03-05',2298.00,'Delivered'),(2,2,'2025-03-06',999.00,'Delivered'),(3,3,'2025-03-08',1699.00,'Pending'),(4,1,'2025-03-10',1899.00,'Delivered'),(5,4,'2025-03-12',2199.00,'Delivered'),(6,5,'2025-03-15',1499.00,'Cancelled'),(7,6,'2025-03-18',2499.00,'Delivered'),(8,7,'2025-03-20',1798.00,'Delivered'),(9,8,'2025-03-22',1199.00,'Pending'),(10,2,'2025-03-25',3598.00,'Delivered'),(11,9,'2025-04-01',2499.00,'Delivered'),(12,10,'2025-04-02',1799.00,'Pending'),(13,11,'2025-04-03',3299.00,'Delivered'),(14,12,'2025-04-04',1499.00,'Cancelled'),(15,13,'2025-04-05',2899.00,'Delivered'),(16,14,'2025-04-06',3999.00,'Delivered'),(17,15,'2025-04-07',2199.00,'Pending'),(18,16,'2025-04-08',1999.00,'Delivered'),(19,17,'2025-04-09',2599.00,'Delivered'),(20,18,'2025-04-10',1499.00,'Pending');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `payment_id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `payment_method` varchar(30) DEFAULT NULL,
  `payment_status` varchar(30) DEFAULT NULL,
  `paid_amount` decimal(10,2) DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  PRIMARY KEY (`payment_id`),
  KEY `order_id` (`order_id`),
  CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
INSERT INTO `payments` VALUES (1,1,'UPI','Paid',2298.00,'2025-03-05'),(2,2,'COD','Paid',999.00,'2025-03-06'),(3,3,'Card','Pending',1699.00,'2025-03-08'),(4,4,'UPI','Paid',1899.00,'2025-03-10'),(5,5,'Card','Paid',2199.00,'2025-03-12'),(6,6,'COD','Refunded',1499.00,'2025-03-15'),(7,7,'UPI','Paid',2499.00,'2025-03-18'),(8,8,'Card','Paid',1798.00,'2025-03-20'),(9,9,'UPI','Pending',1199.00,'2025-03-22'),(10,10,'Card','Paid',3598.00,'2025-03-25'),(11,11,'UPI','Paid',2499.00,'2025-04-01'),(12,12,'Card','Pending',1799.00,'2025-04-02'),(13,13,'UPI','Paid',3299.00,'2025-04-03'),(14,14,'COD','Cancelled',1499.00,'2025-04-04'),(15,15,'Card','Paid',2899.00,'2025-04-05'),(16,16,'UPI','Paid',3999.00,'2025-04-06'),(17,17,'Net Banking','Pending',2199.00,'2025-04-07'),(18,18,'UPI','Paid',1999.00,'2025-04-08'),(19,19,'Card','Paid',2599.00,'2025-04-09'),(20,20,'COD','Pending',1499.00,'2025-04-10');
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `product_name` varchar(100) NOT NULL,
  `category` varchar(50) DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `stock` int DEFAULT '0',
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Formal Shirt','Men',1499.00,50),(2,'Casual T-Shirt','Men',799.00,80),(3,'Women Kurti','Women',999.00,60),(4,'Jeans','Bottomwear',1699.00,40),(5,'Hoodie','Winterwear',1899.00,35),(6,'Dress','Women',2199.00,25),(7,'Jacket','Winterwear',2499.00,20),(8,'Track Pants','Bottomwear',1199.00,45);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-05-21 13:27:05
