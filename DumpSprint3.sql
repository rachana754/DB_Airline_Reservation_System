CREATE DATABASE  IF NOT EXISTS `domestic_airline_reservation_system` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `domestic_airline_reservation_system`;
-- MySQL dump 10.13  Distrib 5.7.23, for Win64 (x86_64)
--
-- Host: fall2018dbhansoti.cumowilylcwv.us-east-2.rds.amazonaws.com    Database: domestic_airline_reservation_system
-- ------------------------------------------------------
-- Server version	5.7.23-log

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
-- Table structure for table `Administrator`
--

DROP TABLE IF EXISTS `Administrator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Administrator` (
  `admin_id` varchar(20) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Administrator`
--

LOCK TABLES `Administrator` WRITE;
/*!40000 ALTER TABLE `Administrator` DISABLE KEYS */;
INSERT INTO `Administrator` VALUES ('1','admin','admin'),('2','admin02','admin02'),('3','admin03','admin03');
/*!40000 ALTER TABLE `Administrator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Airline`
--

DROP TABLE IF EXISTS `Airline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Airline` (
  `airline_code` varchar(2) NOT NULL,
  `airline_name` varchar(30) NOT NULL,
  PRIMARY KEY (`airline_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Airline`
--

LOCK TABLES `Airline` WRITE;
/*!40000 ALTER TABLE `Airline` DISABLE KEYS */;
INSERT INTO `Airline` VALUES ('AA','American Airlines Inc.'),('AS','Alaska Airlines Inc.'),('B6','JetBlue Airways'),('DL','Delta Air Lines Inc.'),('F9','Frontier Airlines Inc.'),('NK','Spirit Air Lines'),('OO','JetBlue Airways'),('UA','United Air Lines Inc.'),('US','US Airways Inc.'),('VX','Virgin America'),('WN','Southwest Airlines Co.');
/*!40000 ALTER TABLE `Airline` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Card_Details`
--

DROP TABLE IF EXISTS `Card_Details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Card_Details` (
  `cc_num` varchar(25) NOT NULL,
  `cc_name` varchar(80) NOT NULL,
  `cc_expiry` varchar(6) NOT NULL,
  `cc_cvv` char(4) NOT NULL,
  `user_name` varchar(20) NOT NULL,
  PRIMARY KEY (`cc_num`),
  KEY `card_details_fk_registered_user` (`user_name`),
  CONSTRAINT `card_details_fk_registered_user` FOREIGN KEY (`user_name`) REFERENCES `Registered_User` (`user_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Card_Details`
--

LOCK TABLES `Card_Details` WRITE;
/*!40000 ALTER TABLE `Card_Details` DISABLE KEYS */;
INSERT INTO `Card_Details` VALUES ('4762-484634-48749','kiran k','09/22','371','kirankorey'),('5756-5735-8987-5345','keyur m hansoti','08/23','321','keyurhansoti'),('5925-5738-9374-3524','prashant r desai','06/23','639','prashantdesai');
/*!40000 ALTER TABLE `Card_Details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Flight`
--

DROP TABLE IF EXISTS `Flight`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Flight` (
  `flight_id` int(5) NOT NULL AUTO_INCREMENT,
  `flight_number` int(4) NOT NULL,
  `flight_status` varchar(15) NOT NULL,
  `flight_origin` varchar(30) NOT NULL,
  `flight_destination` varchar(30) NOT NULL,
  `arrival_time` varchar(15) NOT NULL,
  `departure_time` varchar(15) NOT NULL,
  `actual_arrival_time` varchar(15) DEFAULT NULL,
  `actual_departure_time` varchar(15) DEFAULT NULL,
  `flight_date` date NOT NULL,
  `airline_code` varchar(2) NOT NULL,
  `admin_id` varchar(20) NOT NULL,
  PRIMARY KEY (`flight_id`),
  KEY `flight_fk_airline_code` (`airline_code`),
  KEY `flight_fk_administrator` (`admin_id`),
  KEY `flightOriginIndex` (`flight_origin`),
  KEY `flightDestinationIndex` (`flight_destination`),
  CONSTRAINT `flight_fk_administrator` FOREIGN KEY (`admin_id`) REFERENCES `Administrator` (`admin_id`),
  CONSTRAINT `flight_fk_airline_code` FOREIGN KEY (`airline_code`) REFERENCES `Airline` (`airline_code`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Flight`
--

LOCK TABLES `Flight` WRITE;
/*!40000 ALTER TABLE `Flight` DISABLE KEYS */;
INSERT INTO `Flight` VALUES (1,2013,'OnTime','LAX','CLT','10:30:00','14:30:00',NULL,NULL,'2018-10-22','US','1'),(2,1173,'OnTime','LAS','ATL','6:30:00','14:00:00',NULL,NULL,'2018-10-24','DL','2'),(3,840,'Cancelled','SFO','CLT','8:00:00','15:00:00',NULL,NULL,'2018-10-23','US','1'),(4,115,'OnTime','LAX','MIA','15:00:00','13:30:00',NULL,NULL,'2018-10-29','AA','2'),(5,2392,'OnTime','DEN','MIA','8:00:00','15:00:00',NULL,NULL,'2018-10-28','AA','3'),(6,252,'OnTime','CLT','SFO','3:00:00','12:00:00',NULL,NULL,'2018-11-01','AA','3'),(7,2352,'OnTime','MIA','DEN','2:00:00','6:00:00',NULL,NULL,'2018-08-12','AA','2'),(8,1023,'OnTime','CLT','DEN','1:00:00','09:00:00',NULL,NULL,'2018-06-15','DL','2'),(9,523,'OnTime','CLT','LAX','12:00:00','17:50:00',NULL,NULL,'2018-06-20','DL','1');
/*!40000 ALTER TABLE `Flight` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Flight_Class`
--

DROP TABLE IF EXISTS `Flight_Class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Flight_Class` (
  `class_id` int(5) NOT NULL AUTO_INCREMENT,
  `class_type` varchar(20) NOT NULL,
  PRIMARY KEY (`class_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Flight_Class`
--

LOCK TABLES `Flight_Class` WRITE;
/*!40000 ALTER TABLE `Flight_Class` DISABLE KEYS */;
INSERT INTO `Flight_Class` VALUES (1,'Economy'),(2,'Business');
/*!40000 ALTER TABLE `Flight_Class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Flight_Seating`
--

DROP TABLE IF EXISTS `Flight_Seating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Flight_Seating` (
  `flight_id` int(5) NOT NULL,
  `class_id` int(5) NOT NULL,
  `flight_fare` varchar(6) NOT NULL,
  `no_of_seats` int(3) NOT NULL,
  PRIMARY KEY (`flight_id`,`class_id`),
  KEY `flight_seating_fk_flight` (`class_id`),
  CONSTRAINT `flight_seating_fk_class` FOREIGN KEY (`class_id`) REFERENCES `Flight_Class` (`class_id`),
  CONSTRAINT `flight_seating_fk_flight` FOREIGN KEY (`flight_id`) REFERENCES `Flight` (`flight_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Flight_Seating`
--

LOCK TABLES `Flight_Seating` WRITE;
/*!40000 ALTER TABLE `Flight_Seating` DISABLE KEYS */;
INSERT INTO `Flight_Seating` VALUES (1,1,'640$',100),(1,2,'900$',30),(2,1,'320$',250),(3,1,'550$',150),(3,2,'700$',50),(4,1,'450$',80),(5,1,'720$',120),(5,2,'850$',25),(6,2,'500$',50),(7,1,'280$',180),(8,2,'480$',90),(9,1,'730$',250);
/*!40000 ALTER TABLE `Flight_Seating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Registered_User`
--

DROP TABLE IF EXISTS `Registered_User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Registered_User` (
  `user_name` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `first_name` varchar(20) NOT NULL,
  `last_name` varchar(20) NOT NULL,
  `email` varchar(35) NOT NULL,
  `address_line_1` varchar(50) NOT NULL,
  `address_line_2` varchar(50) DEFAULT NULL,
  `phone_number_primary` varchar(15) NOT NULL,
  `phone_number_secondary` varchar(15) DEFAULT NULL,
  `zip_code` int(6) NOT NULL,
  PRIMARY KEY (`user_name`),
  KEY `registered_user_fk_zip_codes` (`zip_code`),
  CONSTRAINT `registered_user_fk_zip_codes` FOREIGN KEY (`zip_code`) REFERENCES `Zip_Codes` (`zip_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Registered_User`
--

LOCK TABLES `Registered_User` WRITE;
/*!40000 ALTER TABLE `Registered_User` DISABLE KEYS */;
INSERT INTO `Registered_User` VALUES ('keyurhansoti','password123','keyur','hansoti','keyurhansoti@gmail.com','District 7 100','S. Main Street','2131234567','2139893243',90001),('kirankorey','kkorey123','kiran','korey','bvbmail2015@gmail.com','1730','Blake st','3033456843','7204379856',80014),('prashantdesai','prash321','prashant','desai','prashantgre93@gmail.com','Alemany Boulevard.','Apt G','7023243567','7029098754',88901),('renjurobin','renju123','renju','robin','renju@gmail.com','University Boulevard.','Apt G','704768527',NULL,88901),('revurirachana','rrevuri12','rachana','revuri','rrevuri@gmail.com','Apt 1650','9621 Grove side lane','9875754236',NULL,28262);
/*!40000 ALTER TABLE `Registered_User` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `SearchForFlight`
--

DROP TABLE IF EXISTS `SearchForFlight`;
/*!50001 DROP VIEW IF EXISTS `SearchForFlight`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `SearchForFlight` AS SELECT 
 1 AS `airline_name`,
 1 AS `flight_number`,
 1 AS `flight_origin`,
 1 AS `flight_destination`,
 1 AS `arrival_time`,
 1 AS `departure_time`,
 1 AS `flight_date`,
 1 AS `flight_fare`,
 1 AS `class_type`,
 1 AS `no_of_seats`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `UserBookFlight`
--

DROP TABLE IF EXISTS `UserBookFlight`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UserBookFlight` (
  `user_name` varchar(20) NOT NULL,
  `flight_id` int(5) NOT NULL,
  `no_of_passengers` int(2) NOT NULL,
  `travel_type` varchar(20) NOT NULL,
  PRIMARY KEY (`user_name`,`flight_id`),
  KEY `user_book_flight_fk_flight_id` (`flight_id`),
  CONSTRAINT `user_book_flight_fk_flight_id` FOREIGN KEY (`flight_id`) REFERENCES `Flight` (`flight_id`),
  CONSTRAINT `user_book_flight_fk_user_id` FOREIGN KEY (`user_name`) REFERENCES `Registered_User` (`user_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UserBookFlight`
--

LOCK TABLES `UserBookFlight` WRITE;
/*!40000 ALTER TABLE `UserBookFlight` DISABLE KEYS */;
INSERT INTO `UserBookFlight` VALUES ('keyurhansoti',1,3,'One Way'),('kirankorey',2,5,'One Way'),('kirankorey',5,2,'Round Trip'),('kirankorey',6,1,'Round Trip'),('prashantdesai',1,2,'One Way'),('prashantdesai',2,5,'One Way'),('prashantdesai',3,3,'One Way'),('renjurobin',1,2,'One Way'),('renjurobin',4,2,'One Way'),('revurirachana',4,3,'One Way'),('revurirachana',5,3,'One Way');
/*!40000 ALTER TABLE `UserBookFlight` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UserFeedback`
--

DROP TABLE IF EXISTS `UserFeedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UserFeedback` (
  `user_name` varchar(20) NOT NULL,
  `flight_id` int(5) NOT NULL,
  `comments` varchar(2000) NOT NULL,
  PRIMARY KEY (`user_name`,`flight_id`),
  KEY `user_feedback_fk_flight_id` (`flight_id`),
  CONSTRAINT `user_feedback_fk_flight_id` FOREIGN KEY (`flight_id`) REFERENCES `Flight` (`flight_id`),
  CONSTRAINT `user_feedback_fk_user_id` FOREIGN KEY (`user_name`) REFERENCES `Registered_User` (`user_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UserFeedback`
--

LOCK TABLES `UserFeedback` WRITE;
/*!40000 ALTER TABLE `UserFeedback` DISABLE KEYS */;
INSERT INTO `UserFeedback` VALUES ('kirankorey',2,'Very clean and good seats. Nice weather assisted to perform such a lovely flight'),('prashantdesai',1,'Airline service was satisfactory'),('prashantdesai',3,'Airline did not inform about the delay in advance'),('renjurobin',1,'The lounge in Athens Airport had really good food and a selection of Greek wines.'),('revurirachana',4,'No headphones provided for in-flight entertainment');
/*!40000 ALTER TABLE `UserFeedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `UserFeedbackView`
--

DROP TABLE IF EXISTS `UserFeedbackView`;
/*!50001 DROP VIEW IF EXISTS `UserFeedbackView`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `UserFeedbackView` AS SELECT 
 1 AS `user_name`,
 1 AS `flight_id`,
 1 AS `comments`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `Zip_Codes`
--

DROP TABLE IF EXISTS `Zip_Codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Zip_Codes` (
  `zip_code` int(6) NOT NULL,
  `city` varchar(30) NOT NULL,
  `state` varchar(20) NOT NULL,
  PRIMARY KEY (`zip_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Zip_Codes`
--

LOCK TABLES `Zip_Codes` WRITE;
/*!40000 ALTER TABLE `Zip_Codes` DISABLE KEYS */;
INSERT INTO `Zip_Codes` VALUES (27513,'Raleigh','North Carolina'),(27602,'Raleigh','North Carolina'),(28201,'Charlotte','North Caorlina'),(28262,'Charlotte','North Carolina'),(80014,'Denver','Colorado'),(88901,'Las Vegas','California'),(89104,'Las Vegas','California'),(90001,'Los Angeles','California');
/*!40000 ALTER TABLE `Zip_Codes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `customerInfo`
--

DROP TABLE IF EXISTS `customerInfo`;
/*!50001 DROP VIEW IF EXISTS `customerInfo`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `customerInfo` AS SELECT 
 1 AS `first_name`,
 1 AS `last_name`,
 1 AS `email`,
 1 AS `address_line_1`,
 1 AS `address_line_2`,
 1 AS `phone_number_primary`,
 1 AS `zip_code`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'domestic_airline_reservation_system'
--

--
-- Dumping routines for database 'domestic_airline_reservation_system'
--
/*!50003 DROP PROCEDURE IF EXISTS `AdminaddsFlight` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `AdminaddsFlight`(IN flightno int(4),IN flightstatus varchar(15)
,IN flightorigin varchar(30),IN flightdest varchar(30),IN arrtime varchar(15),
IN deptime varchar(15),IN actarr_time varchar(15),IN actdep_time
varchar(15),IN flightdate date,IN airlinecode varchar(6),IN adminid varchar(20),
classid int(5),fare varchar(6),seats int(3),classid1 int(5), fare1 varchar(6),seats1 int(3))
BEGIN
declare a int ;
insert into Flight(flight_number,flight_status,flight_origin,flight_destination,arrival_time,
departure_time,actual_arrival_time,actual_departure_time,flight_date,airline_code,admin_id) 
values (flightno, flightstatus, flightorigin, flightdest, arrtime, deptime, 
actarr_time,actdep_time,flightdate,airlinecode,adminid);

select flight_id into a from Flight where flight_number=flightno and flight_date=flightdate
and airline_code=airlinecode;

insert into Flight_Seating(flight_id,class_id,flight_fare,no_of_seats)
values(a,classid,fare,seats);

insert into Flight_Seating(flight_id,class_id,flight_fare,no_of_seats)
values(a,classid1,fare1,seats1);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `updateFlightStatus` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `updateFlightStatus`(IN flightId int,flightStatus varchar(15),newArrivalTime varchar(15),newDepartureTime varchar(15))
BEGIN

update Flight set flight_status = flightStatus,
actual_arrival_time = newArrivalTime,
actual_Departure_time = newDepartureTime
where flight_id = flightId;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `userBookFlightProc` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `userBookFlightProc`(IN userName varchar(20),IN flightId int(5), IN numOfPassengers int(2), 
IN travelType varchar(20))
BEGIN

insert into UserBookFlight(user_name, flight_id,no_of_passengers,travel_type) 
values (userName, flightId, numOfPassengers,travelType);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `userFeedback` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `userFeedback`(IN userName varchar(20),IN flightId int(5),IN commentsUser varchar(2000))
BEGIN

insert into UserFeedback(user_name,flight_id,comments) values (userName,flightId,commentsUser);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `userRegistrationProc` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `userRegistrationProc`(IN userName varchar(20),IN pwd varchar(20), IN firstName varchar(20), 
IN lastName varchar(20), IN Email varchar(35), In addressLine1 varchar(50), In addressLine2 varchar(50),
IN primaryNumber varchar(15), secondaryNumber varchar(15), IN zipCode int(6))
BEGIN

insert into Registered_User(user_name, password, first_name, last_name, email, address_line_1, address_line_2,
phone_number_primary, phone_number_secondary,zip_code) 
values (userName, pwd, firstName, lastName, Email, addressLine1, addressLine2, primaryNumber, secondaryNumber, zipCode);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `SearchForFlight`
--

/*!50001 DROP VIEW IF EXISTS `SearchForFlight`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE */
/*!50001 VIEW `SearchForFlight` AS select `a`.`airline_name` AS `airline_name`,`f`.`flight_number` AS `flight_number`,`f`.`flight_origin` AS `flight_origin`,`f`.`flight_destination` AS `flight_destination`,`f`.`arrival_time` AS `arrival_time`,`f`.`departure_time` AS `departure_time`,`f`.`flight_date` AS `flight_date`,`fs`.`flight_fare` AS `flight_fare`,`fc`.`class_type` AS `class_type`,`fs`.`no_of_seats` AS `no_of_seats` from (((`Flight` `f` join `Airline` `a` on((`a`.`airline_code` = `f`.`airline_code`))) join `Flight_Seating` `fs` on((`fs`.`flight_id` = `f`.`flight_id`))) join `Flight_Class` `fc` on((`fc`.`class_id` = `fs`.`class_id`))) order by `a`.`airline_name` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `UserFeedbackView`
--

/*!50001 DROP VIEW IF EXISTS `UserFeedbackView`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE */
/*!50001 VIEW `UserFeedbackView` AS select `UserFeedback`.`user_name` AS `user_name`,`UserFeedback`.`flight_id` AS `flight_id`,`UserFeedback`.`comments` AS `comments` from `UserFeedback` order by `UserFeedback`.`flight_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `customerInfo`
--

/*!50001 DROP VIEW IF EXISTS `customerInfo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE */
/*!50001 VIEW `customerInfo` AS select `Registered_User`.`first_name` AS `first_name`,`Registered_User`.`last_name` AS `last_name`,`Registered_User`.`email` AS `email`,`Registered_User`.`address_line_1` AS `address_line_1`,`Registered_User`.`address_line_2` AS `address_line_2`,`Registered_User`.`phone_number_primary` AS `phone_number_primary`,`Registered_User`.`zip_code` AS `zip_code` from `Registered_User` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-12-02 15:43:39
