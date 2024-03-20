-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: timesheet_entry_system_db
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account` (
  `account_id` int NOT NULL AUTO_INCREMENT,
  `account_name` varchar(255) DEFAULT NULL,
  `owner_id` int DEFAULT NULL,
  `relationship_manager_id` int DEFAULT NULL,
  `business_development_manager_id` int DEFAULT NULL,
  `parent_account_id` int DEFAULT NULL,
  `account_bu_id` int DEFAULT NULL,
  `planned_start_date` timestamp NULL DEFAULT NULL,
  `planned_end_date` timestamp NULL DEFAULT NULL,
  `actual_start_date` timestamp NULL DEFAULT NULL,
  `actual_end_date` timestamp NULL DEFAULT NULL,
  `address` text,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `zipcode` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `is_red` tinyint(1) DEFAULT NULL,
  `account_status` bigint DEFAULT NULL,
  `comments` text,
  `is_deleted` tinyint(1) DEFAULT NULL,
  `uuid` varchar(36) DEFAULT (uuid()),
  `created_by` varchar(255) DEFAULT NULL,
  `created_on` timestamp NULL DEFAULT NULL,
  `modified_by` varchar(255) DEFAULT NULL,
  `modified_on` timestamp NULL DEFAULT NULL,
  `account_aid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`account_id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `owner_id_idx` (`owner_id`),
  KEY `relationship_manager_id_idx` (`relationship_manager_id`),
  KEY `business_development_manager_id_idx` (`business_development_manager_id`),
  KEY `parent_account_id_idx` (`parent_account_id`),
  KEY `account_bu_id_idx` (`account_bu_id`),
  CONSTRAINT `account_bu_id` FOREIGN KEY (`account_bu_id`) REFERENCES `common_reference_details` (`reference_details_id`),
  CONSTRAINT `business_development_manager_id` FOREIGN KEY (`business_development_manager_id`) REFERENCES `employee` (`employee_id`),
  CONSTRAINT `owner_id` FOREIGN KEY (`owner_id`) REFERENCES `employee` (`employee_id`),
  CONSTRAINT `parent_account_id` FOREIGN KEY (`parent_account_id`) REFERENCES `account` (`account_id`),
  CONSTRAINT `relationship_manager_id` FOREIGN KEY (`relationship_manager_id`) REFERENCES `employee` (`employee_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES (2,'Sample Account',106,106,106,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'72ea3d8c-ccdb-11ee-bf21-bce92fedfbf5',NULL,NULL,NULL,NULL,NULL),(3,'Sample Account 1',107,107,107,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'848a0ff2-ccdb-11ee-bf21-bce92fedfbf5',NULL,NULL,NULL,NULL,NULL),(4,'Sample Account 2',107,107,107,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'88d7d129-ccdb-11ee-bf21-bce92fedfbf5',NULL,NULL,NULL,NULL,NULL),(5,'Sample Account 3',106,106,106,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'928bb893-ccdb-11ee-bf21-bce92fedfbf5',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_project_task`
--

DROP TABLE IF EXISTS `account_project_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_project_task` (
  `task_id` int NOT NULL AUTO_INCREMENT,
  `tasktype_id` int DEFAULT NULL,
  `task` varchar(255) DEFAULT NULL,
  `task_description` varchar(255) DEFAULT NULL,
  `is_active` bit(1) DEFAULT NULL,
  `is_deleted` bit(1) DEFAULT NULL,
  `uuid` varchar(36) DEFAULT (uuid()),
  `created_by` varchar(255) DEFAULT NULL,
  `created_on` timestamp NULL DEFAULT NULL,
  `modified_by` varchar(255) DEFAULT NULL,
  `modified_on` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`task_id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `tasktype_id` (`tasktype_id`),
  CONSTRAINT `account_project_task_ibfk_1` FOREIGN KEY (`tasktype_id`) REFERENCES `account_project_tasktype` (`tasktype_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10010 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_project_task`
--

LOCK TABLES `account_project_task` WRITE;
/*!40000 ALTER TABLE `account_project_task` DISABLE KEYS */;
INSERT INTO `account_project_task` VALUES (10001,1001,'UItask1',NULL,NULL,NULL,'8dba9bcc-cce9-11ee-bf21-bce92fedfbf5',NULL,NULL,NULL,NULL),(10002,1001,'UItask2',NULL,NULL,NULL,'8dbae936-cce9-11ee-bf21-bce92fedfbf5',NULL,NULL,NULL,NULL),(10003,1001,'UItask3',NULL,NULL,NULL,'8dbafdea-cce9-11ee-bf21-bce92fedfbf5',NULL,NULL,NULL,NULL),(10004,1002,'java task1',NULL,NULL,NULL,'8dbb1f00-cce9-11ee-bf21-bce92fedfbf5',NULL,NULL,NULL,NULL),(10005,1002,'java task2',NULL,NULL,NULL,'8dbb345d-cce9-11ee-bf21-bce92fedfbf5',NULL,NULL,NULL,NULL),(10006,1002,'java task3',NULL,NULL,NULL,'8dbb4466-cce9-11ee-bf21-bce92fedfbf5',NULL,NULL,NULL,NULL),(10007,1003,'db task1',NULL,NULL,NULL,'8dbb5b0c-cce9-11ee-bf21-bce92fedfbf5',NULL,NULL,NULL,NULL),(10008,1003,'db task2',NULL,NULL,NULL,'8dbb6d76-cce9-11ee-bf21-bce92fedfbf5',NULL,NULL,NULL,NULL),(10009,3,'db task3',NULL,NULL,NULL,'8dbb80b4-cce9-11ee-bf21-bce92fedfbf5',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `account_project_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_project_tasktype`
--

DROP TABLE IF EXISTS `account_project_tasktype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_project_tasktype` (
  `tasktype_id` int NOT NULL AUTO_INCREMENT,
  `account_id` int DEFAULT NULL,
  `account_project_id` int DEFAULT NULL,
  `task_type` varchar(255) DEFAULT NULL,
  `task_type_description` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT NULL,
  `uuid` varchar(36) DEFAULT (uuid()),
  `created_by` varchar(255) DEFAULT NULL,
  `created_on` timestamp NULL DEFAULT NULL,
  `modified_by` varchar(255) DEFAULT NULL,
  `modified_on` timestamp NULL DEFAULT NULL,
  `reference_type_id` bigint DEFAULT NULL,
  `reference_type_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`tasktype_id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `account_id` (`account_id`),
  KEY `account_project_id` (`account_project_id`),
  CONSTRAINT `account_project_tasktype_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `account` (`account_id`),
  CONSTRAINT `account_project_tasktype_ibfk_2` FOREIGN KEY (`account_project_id`) REFERENCES `account_projects` (`account_project_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1012 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_project_tasktype`
--

LOCK TABLES `account_project_tasktype` WRITE;
/*!40000 ALTER TABLE `account_project_tasktype` DISABLE KEYS */;
INSERT INTO `account_project_tasktype` VALUES (1001,2,112,'UI','creating ui page',NULL,NULL,'f26f64b0-cce8-11ee-bf21-bce92fedfbf5',NULL,NULL,NULL,NULL,NULL,NULL),(1002,2,112,'java','crud opn',NULL,NULL,'f26fa7bd-cce8-11ee-bf21-bce92fedfbf5',NULL,NULL,NULL,NULL,NULL,NULL),(1003,2,112,'db opn','creating table',NULL,NULL,'f26fbc0e-cce8-11ee-bf21-bce92fedfbf5',NULL,NULL,NULL,NULL,NULL,NULL),(1004,3,113,'UI','creating ui page',NULL,NULL,'2b933ef6-cce9-11ee-bf21-bce92fedfbf5',NULL,NULL,NULL,NULL,NULL,NULL),(1005,3,113,'java','crud opn',NULL,NULL,'2b947291-cce9-11ee-bf21-bce92fedfbf5',NULL,NULL,NULL,NULL,NULL,NULL),(1006,NULL,113,'db opn','creating table',NULL,NULL,'2b94846a-cce9-11ee-bf21-bce92fedfbf5',NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `account_project_tasktype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_projects`
--

DROP TABLE IF EXISTS `account_projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_projects` (
  `account_project_id` int NOT NULL AUTO_INCREMENT,
  `project_aid` varchar(255) DEFAULT NULL,
  `project_name` varchar(255) DEFAULT NULL,
  `account_id` int DEFAULT NULL,
  `priority` int DEFAULT NULL,
  `projectmanager_id` int DEFAULT NULL,
  `no_of_billing_hours` decimal(10,0) DEFAULT NULL,
  `planned_start_date` timestamp NULL DEFAULT NULL,
  `planned_end_date` timestamp NULL DEFAULT NULL,
  `actual_start_date` timestamp NULL DEFAULT NULL,
  `actual_end_date` timestamp NULL DEFAULT NULL,
  `project_status` int DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `is_red` tinyint(1) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT NULL,
  `uuid` varchar(36) DEFAULT (uuid()),
  `created_by` varchar(255) DEFAULT NULL,
  `created_on` timestamp NULL DEFAULT NULL,
  `modified_by` varchar(255) DEFAULT NULL,
  `modified_on` timestamp NULL DEFAULT NULL,
  `project_pid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`account_project_id`),
  KEY `account_id` (`account_id`),
  KEY `priority_idx` (`priority`),
  KEY `project_manager_id_idx` (`projectmanager_id`),
  KEY `project_status_idx` (`project_status`),
  CONSTRAINT `account_projects_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `account` (`account_id`),
  CONSTRAINT `priority` FOREIGN KEY (`priority`) REFERENCES `common_reference_details` (`reference_details_id`),
  CONSTRAINT `project_status` FOREIGN KEY (`project_status`) REFERENCES `common_reference_details` (`reference_details_id`),
  CONSTRAINT `projectmanager_id` FOREIGN KEY (`projectmanager_id`) REFERENCES `employee` (`employee_id`)
) ENGINE=InnoDB AUTO_INCREMENT=116 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_projects`
--

LOCK TABLES `account_projects` WRITE;
/*!40000 ALTER TABLE `account_projects` DISABLE KEYS */;
INSERT INTO `account_projects` VALUES (112,'ProjectAID123','Project Name 1',2,49,107,450,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',52,NULL,NULL,NULL,'71026617-cce7-11ee-bf21-bce92fedfbf5',NULL,NULL,NULL,NULL,NULL),(113,'ProjectAID1124','Project Name 2',3,49,106,450,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',52,NULL,NULL,NULL,'9a768332-cce7-11ee-bf21-bce92fedfbf5',NULL,NULL,NULL,NULL,NULL),(114,'ProjectAID1125','Project Name 3',3,49,106,450,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',52,NULL,NULL,NULL,'acae99db-cce7-11ee-bf21-bce92fedfbf5',NULL,NULL,NULL,NULL,NULL),(115,'ProjectAID1126','Project Name 4',3,49,107,450,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',52,NULL,NULL,NULL,'b77d213f-cce7-11ee-bf21-bce92fedfbf5',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `account_projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_resource_mapping`
--

DROP TABLE IF EXISTS `account_resource_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_resource_mapping` (
  `mapping_id` int NOT NULL AUTO_INCREMENT,
  `account_project_id` int DEFAULT NULL,
  `account_id` int DEFAULT NULL,
  `employee_id` int DEFAULT NULL,
  `employee_status` int DEFAULT NULL,
  `allocation_start_date` timestamp NULL DEFAULT NULL,
  `allocation_end_date` timestamp NULL DEFAULT NULL,
  `allocation_status` int DEFAULT NULL,
  `allocation_percentage` decimal(38,2) DEFAULT NULL,
  `billing_type_id` int DEFAULT NULL,
  `billing_id` int DEFAULT NULL,
  `buffer_type` int DEFAULT NULL,
  `alias` varchar(255) DEFAULT NULL,
  `location` int DEFAULT NULL,
  `comments` text,
  `isdeleted` tinyint(1) DEFAULT NULL,
  `uuid` varchar(36) DEFAULT (uuid()),
  `created_by` varchar(255) DEFAULT NULL,
  `created_on` timestamp NULL DEFAULT NULL,
  `modified_by` varchar(255) DEFAULT NULL,
  `modified_on` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`mapping_id`),
  KEY `account_project_id` (`account_project_id`),
  KEY `account_id` (`account_id`),
  KEY `employee_id` (`employee_id`),
  KEY `buffer_type` (`buffer_type`),
  KEY `billing_type_id` (`billing_type_id`),
  KEY `location` (`location`),
  KEY `allocation_status` (`allocation_status`),
  KEY `employee_status` (`employee_status`),
  CONSTRAINT `account_resource_mapping_ibfk_1` FOREIGN KEY (`account_project_id`) REFERENCES `account_projects` (`account_project_id`),
  CONSTRAINT `account_resource_mapping_ibfk_2` FOREIGN KEY (`account_id`) REFERENCES `account` (`account_id`),
  CONSTRAINT `account_resource_mapping_ibfk_3` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`),
  CONSTRAINT `account_resource_mapping_ibfk_4` FOREIGN KEY (`buffer_type`) REFERENCES `employee` (`employee_id`),
  CONSTRAINT `account_resource_mapping_ibfk_5` FOREIGN KEY (`billing_type_id`) REFERENCES `common_reference_details` (`reference_details_id`),
  CONSTRAINT `account_resource_mapping_ibfk_6` FOREIGN KEY (`location`) REFERENCES `common_reference_details` (`reference_details_id`),
  CONSTRAINT `account_resource_mapping_ibfk_7` FOREIGN KEY (`allocation_status`) REFERENCES `common_reference_details` (`reference_details_id`),
  CONSTRAINT `account_resource_mapping_ibfk_8` FOREIGN KEY (`employee_status`) REFERENCES `common_reference_details` (`reference_details_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_resource_mapping`
--

LOCK TABLES `account_resource_mapping` WRITE;
/*!40000 ALTER TABLE `account_resource_mapping` DISABLE KEYS */;
INSERT INTO `account_resource_mapping` VALUES (1,112,2,105,6,NULL,NULL,NULL,NULL,53,NULL,NULL,NULL,NULL,NULL,NULL,'4a0bec66-cce8-11ee-bf21-bce92fedfbf5',NULL,NULL,NULL,NULL),(2,113,3,108,6,NULL,NULL,NULL,NULL,53,NULL,NULL,NULL,NULL,NULL,NULL,'69aba3c6-cce8-11ee-bf21-bce92fedfbf5',NULL,NULL,NULL,NULL),(3,112,2,108,6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1a159a9d-cced-11ee-bf21-bce92fedfbf5',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `account_resource_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `common_reference_details`
--

DROP TABLE IF EXISTS `common_reference_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `common_reference_details` (
  `reference_details_id` int NOT NULL AUTO_INCREMENT,
  `reference_details_values` varchar(45) DEFAULT NULL,
  `reference_type_id` int DEFAULT NULL,
  `uuid` varchar(36) DEFAULT (uuid()),
  `is_deleted` bit(1) DEFAULT NULL,
  `created_by` varchar(45) DEFAULT NULL,
  `created_on` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` varchar(45) DEFAULT NULL,
  `modified_on` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`reference_details_id`),
  KEY `reference_type_id_idx` (`reference_type_id`),
  CONSTRAINT `reference_type_id` FOREIGN KEY (`reference_type_id`) REFERENCES `common_reference_type` (`reference_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `common_reference_details`
--

LOCK TABLES `common_reference_details` WRITE;
/*!40000 ALTER TABLE `common_reference_details` DISABLE KEYS */;
INSERT INTO `common_reference_details` VALUES (1,'Male',1,'\0',NULL,NULL,'2024-03-11 08:56:34',NULL,'2024-03-11 08:56:34'),(2,'Female',1,NULL,NULL,NULL,'2024-03-11 08:56:34',NULL,'2024-03-11 08:56:34'),(3,'Permanent',2,NULL,NULL,NULL,'2024-03-11 08:56:34',NULL,'2024-03-11 08:56:34'),(4,'Contract',2,NULL,NULL,NULL,'2024-03-11 08:56:34',NULL,'2024-03-11 08:56:34'),(5,'Intrenship',2,NULL,NULL,NULL,'2024-03-11 08:56:34',NULL,'2024-03-11 08:56:34'),(6,'Active',3,NULL,NULL,NULL,'2024-03-11 08:56:34',NULL,'2024-03-11 08:56:34'),(7,'Inactive',3,NULL,NULL,NULL,'2024-03-11 08:56:34',NULL,'2024-03-11 08:56:34'),(8,'Maternity leave',3,NULL,NULL,NULL,'2024-03-11 08:56:34',NULL,'2024-03-11 08:56:34'),(9,'Sabbatical leave',3,NULL,NULL,NULL,'2024-03-11 08:56:34',NULL,'2024-03-11 08:56:34'),(10,'Data and Insights',4,NULL,NULL,NULL,'2024-03-11 08:56:34',NULL,'2024-03-11 08:56:34'),(11,'Cloud',4,NULL,NULL,NULL,'2024-03-11 08:56:34',NULL,'2024-03-11 08:56:34'),(12,'Cyber Security',4,NULL,NULL,NULL,'2024-03-11 08:56:34',NULL,'2024-03-11 08:56:34'),(13,'Finance',4,NULL,NULL,NULL,'2024-03-11 08:56:34',NULL,'2024-03-11 08:56:34'),(14,'HR',4,NULL,NULL,NULL,'2024-03-11 08:56:34',NULL,'2024-03-11 08:56:34'),(15,'Internal IT',4,NULL,NULL,NULL,'2024-03-11 08:56:34',NULL,'2024-03-11 08:56:34'),(16,'Low Code',4,NULL,NULL,NULL,'2024-03-11 08:56:34',NULL,'2024-03-11 08:56:34'),(17,'Executive Management',4,NULL,NULL,NULL,'2024-03-11 08:56:34',NULL,'2024-03-11 08:56:34'),(18,'Marketing',4,NULL,NULL,NULL,'2024-03-11 08:56:34',NULL,'2024-03-11 08:56:34'),(19,'No Skill',5,NULL,NULL,NULL,'2024-03-11 08:56:34',NULL,'2024-03-11 08:56:34'),(20,'Beginner',5,NULL,NULL,NULL,'2024-03-11 08:56:34',NULL,'2024-03-11 08:56:34'),(21,'Intermediate',5,NULL,NULL,NULL,'2024-03-11 08:56:34',NULL,'2024-03-11 08:56:34'),(22,'Expert',5,NULL,NULL,NULL,'2024-03-11 08:56:34',NULL,'2024-03-11 08:56:34'),(23,'Primary',6,NULL,NULL,NULL,'2024-03-11 08:56:34',NULL,'2024-03-11 08:56:34'),(24,'Secondary',6,NULL,NULL,NULL,'2024-03-11 08:56:34',NULL,'2024-03-11 08:56:34'),(25,'Technical Skill',7,NULL,NULL,NULL,'2024-03-11 08:56:34',NULL,'2024-03-11 08:56:34'),(26,'Soft Skill',7,NULL,NULL,NULL,'2024-03-11 08:56:34',NULL,'2024-03-11 08:56:34'),(27,'Business Skill',7,NULL,NULL,NULL,'2024-03-11 08:56:34',NULL,'2024-03-11 08:56:34'),(28,'Behavioural Skill',7,NULL,NULL,NULL,'2024-03-11 08:56:34',NULL,'2024-03-11 08:56:34'),(29,'Python FullStack',8,NULL,NULL,NULL,'2024-03-11 08:56:34',NULL,'2024-03-11 08:56:34'),(30,'Java FullStack',8,NULL,NULL,NULL,'2024-03-11 08:56:34',NULL,'2024-03-11 08:56:34'),(31,'Mern FullStack',8,NULL,NULL,NULL,'2024-03-11 08:56:34',NULL,'2024-03-11 08:56:34'),(32,'Data And Insights',9,NULL,NULL,NULL,'2024-03-11 08:56:34',NULL,'2024-03-11 08:56:34'),(33,'Cloud',9,NULL,NULL,NULL,'2024-03-11 08:56:34',NULL,'2024-03-11 08:56:34'),(34,'Cyber Security',9,NULL,NULL,NULL,'2024-03-11 08:56:34',NULL,'2024-03-11 08:56:34'),(35,'Finance',9,NULL,NULL,NULL,'2024-03-11 08:56:34',NULL,'2024-03-11 08:56:34'),(36,'HR',9,NULL,NULL,NULL,'2024-03-11 08:56:34',NULL,'2024-03-11 08:56:34'),(37,'Internal IT',9,NULL,NULL,NULL,'2024-03-11 08:56:34',NULL,'2024-03-11 08:56:34'),(38,'Low Code',9,NULL,NULL,NULL,'2024-03-11 08:56:34',NULL,'2024-03-11 08:56:34'),(39,'Executive Management',9,NULL,NULL,NULL,'2024-03-11 08:56:34',NULL,'2024-03-11 08:56:34'),(40,'Marketing',9,NULL,NULL,NULL,'2024-03-11 08:56:34',NULL,'2024-03-11 08:56:34'),(41,'Facilities',9,NULL,NULL,NULL,'2024-03-11 08:56:34',NULL,'2024-03-11 08:56:34'),(42,'PMO',9,NULL,NULL,NULL,'2024-03-11 08:56:34',NULL,'2024-03-11 08:56:34'),(43,'Product Engineering',9,NULL,NULL,NULL,'2024-03-11 08:56:34',NULL,'2024-03-11 08:56:34'),(44,'Admin',9,NULL,NULL,NULL,'2024-03-11 08:56:34',NULL,'2024-03-11 08:56:34'),(45,'Quality Engineering',9,NULL,NULL,NULL,'2024-03-11 08:56:34',NULL,'2024-03-11 08:56:34'),(46,'Sales',9,NULL,NULL,NULL,'2024-03-11 08:56:34',NULL,'2024-03-11 08:56:34'),(47,'Staffing',9,NULL,NULL,NULL,'2024-03-11 08:56:34',NULL,'2024-03-11 08:56:34'),(48,'Talent Acquisition',9,NULL,NULL,NULL,'2024-03-11 08:56:34',NULL,'2024-03-11 08:56:34'),(49,'High',11,NULL,_binary '',NULL,'2024-03-11 08:56:34',NULL,'2024-03-11 08:56:34'),(50,'Low',11,NULL,_binary '',NULL,'2024-03-11 08:56:34',NULL,'2024-03-11 08:56:34'),(51,'Active',12,NULL,_binary '',NULL,'2024-03-11 08:56:34',NULL,'2024-03-11 08:56:34'),(52,'InActive',12,NULL,_binary '',NULL,'2024-03-11 08:56:34',NULL,'2024-03-11 08:56:34'),(53,'Billing',13,NULL,_binary '',NULL,'2024-03-11 08:56:34',NULL,'2024-03-11 08:56:34'),(54,'Non billing',13,NULL,_binary '',NULL,'2024-03-11 08:56:34',NULL,'2024-03-11 08:56:34'),(55,'Communication Skills',17,'a43febe0-d269-11ee-b8ee-d8bbc124b56a',NULL,NULL,'2024-03-11 08:56:34',NULL,'2024-03-11 08:56:34'),(56,'Problem-Solving Skills',17,'a43ffb51-d269-11ee-b8ee-d8bbc124b56a',NULL,NULL,'2024-03-11 08:56:34',NULL,'2024-03-11 08:56:34'),(57,'Presentation Skills',17,'a44004c0-d269-11ee-b8ee-d8bbc124b56a',NULL,NULL,'2024-03-11 08:56:34',NULL,'2024-03-11 08:56:34'),(58,'Analytical Skills',18,'a4400e2e-d269-11ee-b8ee-d8bbc124b56a',NULL,NULL,'2024-03-11 08:56:34',NULL,'2024-03-11 08:56:34'),(59,'Project Management',18,'a4401716-d269-11ee-b8ee-d8bbc124b56a',NULL,NULL,'2024-03-11 08:56:34',NULL,'2024-03-11 08:56:34'),(60,'Financial Literacy',18,'a4401ddd-d269-11ee-b8ee-d8bbc124b56a',NULL,NULL,'2024-03-11 08:56:34',NULL,'2024-03-11 08:56:34'),(61,'Open-Mindedness',19,'a4402435-d269-11ee-b8ee-d8bbc124b56a',NULL,NULL,'2024-03-11 08:56:34',NULL,'2024-03-11 08:56:34'),(62,'Stress Management',19,'a4402a3a-d269-11ee-b8ee-d8bbc124b56a',NULL,NULL,'2024-03-11 08:56:34',NULL,'2024-03-11 08:56:34'),(63,'Customer Service',19,'a44034ce-d269-11ee-b8ee-d8bbc124b56a',NULL,NULL,'2024-03-11 08:56:34',NULL,'2024-03-11 08:56:34'),(65,'.net FullStackDeveloper',8,'42ca637a-df85-11ee-8f7e-d8bbc124b56a',_binary '\0','bharathi','2024-03-11 08:56:34','bharathi','2024-03-11 08:56:34'),(66,'C# FullStackDeveloper',8,'fba815be-df85-11ee-8f7e-d8bbc124b56a',_binary '\0','bharathi','2024-03-11 09:01:44','bharathi','2024-03-11 09:01:44');
/*!40000 ALTER TABLE `common_reference_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `common_reference_type`
--

DROP TABLE IF EXISTS `common_reference_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `common_reference_type` (
  `reference_type_id` int NOT NULL AUTO_INCREMENT,
  `reference_type_name` varchar(45) DEFAULT NULL,
  `uuid` varchar(36) DEFAULT (uuid()),
  `is_deleted` bit(1) DEFAULT NULL,
  `created_by` varchar(45) DEFAULT NULL,
  `created_on` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` varchar(45) DEFAULT NULL,
  `modified_on` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`reference_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `common_reference_type`
--

LOCK TABLES `common_reference_type` WRITE;
/*!40000 ALTER TABLE `common_reference_type` DISABLE KEYS */;
INSERT INTO `common_reference_type` VALUES (1,'Gender','0',_binary '\0','bharathi','0000-00-00 00:00:00','bharathi','0000-00-00 00:00:00'),(2,'Employee Type','0',_binary '\0','bharathi','0000-00-00 00:00:00','bharathi','0000-00-00 00:00:00'),(3,'Employee Status','0',_binary '\0','bharathi','0000-00-00 00:00:00','bharathi','0000-00-00 00:00:00'),(4,'Delivery Unit','0',_binary '\0','bharathi','0000-00-00 00:00:00','bharathi','0000-00-00 00:00:00'),(5,'Skill Competency','0',_binary '\0','','0000-00-00 00:00:00','','0000-00-00 00:00:00'),(6,'Skill Type','0',_binary '\0','','0000-00-00 00:00:00','','0000-00-00 00:00:00'),(7,'Skill Category','0',_binary '\0','','0000-00-00 00:00:00','','0000-00-00 00:00:00'),(8,'Technical Skill','0',_binary '\0','','0000-00-00 00:00:00','','0000-00-00 00:00:00'),(9,'Business Unit','0',_binary '\0','','0000-00-00 00:00:00','','0000-00-00 00:00:00'),(10,'Account Status',NULL,NULL,NULL,NULL,NULL,NULL),(11,'Account Project Priority',NULL,NULL,NULL,NULL,NULL,NULL),(12,'Account Project Status',NULL,NULL,NULL,NULL,NULL,NULL),(13,'Billing Type',NULL,NULL,NULL,NULL,NULL,NULL),(14,'Location',NULL,NULL,NULL,NULL,NULL,NULL),(15,'Week Number',NULL,NULL,NULL,NULL,NULL,NULL),(16,'Attendance Type',NULL,NULL,NULL,NULL,NULL,NULL),(17,'Soft Skill','42cf45f4-d267-11ee-b8ee-d8bbc124b56a',NULL,NULL,'2024-02-29 16:18:49',NULL,'2024-02-29 16:18:49'),(18,'Business Skill','42cf951a-d267-11ee-b8ee-d8bbc124b56a',NULL,NULL,'2024-02-29 16:18:49',NULL,'2024-02-29 16:18:49'),(19,'Behavioural Skill','42cf9b66-d267-11ee-b8ee-d8bbc124b56a',NULL,NULL,'2024-02-29 16:18:49',NULL,'2024-02-29 16:18:49'),(20,'Marketing Skill','2d2d9863-dec6-11ee-a156-e4e74967a77d',NULL,'Rakhi','2024-02-29 16:18:49','Rakhi','2024-02-29 16:18:49');
/*!40000 ALTER TABLE `common_reference_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `employee_id` int NOT NULL AUTO_INCREMENT,
  `employee_code` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `middle_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `designation` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `gender` int DEFAULT NULL,
  `date_of_joining` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `reporting_manager_id` int DEFAULT NULL,
  `employment_type` int DEFAULT NULL,
  `employee_status` int DEFAULT NULL,
  `delivery_unit_id` int DEFAULT NULL,
  `business_unit_id` int DEFAULT NULL,
  `exit_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `exit_remarks` varchar(255) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT NULL,
  `uuid` varchar(36) DEFAULT (uuid()),
  `created_by` varchar(255) DEFAULT NULL,
  `created_on` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` varchar(255) DEFAULT NULL,
  `modified_on` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int DEFAULT NULL,
  PRIMARY KEY (`employee_id`),
  UNIQUE KEY `uuid` (`uuid`),
  UNIQUE KEY `employee_code` (`employee_code`),
  KEY `gender_idx` (`gender`),
  KEY `employment_type_idx` (`employment_type`),
  KEY `reporting_manager_id_idx` (`reporting_manager_id`),
  KEY `employee_status_idx` (`employee_status`),
  KEY `delivery_unit_id_idx` (`delivery_unit_id`),
  KEY `business_unit_id_idx` (`business_unit_id`),
  CONSTRAINT `business_unit_id` FOREIGN KEY (`business_unit_id`) REFERENCES `common_reference_details` (`reference_details_id`),
  CONSTRAINT `delivery_unit_id` FOREIGN KEY (`delivery_unit_id`) REFERENCES `common_reference_details` (`reference_details_id`),
  CONSTRAINT `employee_status` FOREIGN KEY (`employee_status`) REFERENCES `common_reference_details` (`reference_details_id`),
  CONSTRAINT `employment_type` FOREIGN KEY (`employment_type`) REFERENCES `common_reference_details` (`reference_details_id`),
  CONSTRAINT `gender` FOREIGN KEY (`gender`) REFERENCES `common_reference_details` (`reference_details_id`),
  CONSTRAINT `reporting_manager_id` FOREIGN KEY (`reporting_manager_id`) REFERENCES `employee` (`employee_id`)
) ENGINE=InnoDB AUTO_INCREMENT=126 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (105,'EMP001','John','Doe','Smith','john_doe.jpg','Software Engineer','john.doe@gmail.com',1,'2024-02-16 00:00:00',0,3,6,11,NULL,NULL,NULL,NULL,'20c1a298-ccda-11ee-bf21-bce92fedfbf5',NULL,NULL,NULL,NULL,NULL),(106,'EMP002','Jok','eod','Smith',NULL,'Manager','jok.eod@gmail.com',1,'2024-02-16 00:00:00',0,3,6,11,NULL,NULL,NULL,NULL,'4802a988-ccda-11ee-bf21-bce92fedfbf5',NULL,NULL,NULL,NULL,NULL),(107,'EMP003','Jessy','Doe','oke',NULL,'Project Manager','jessy.do@example.com',1,'2024-02-12 00:00:00',0,3,6,11,NULL,NULL,NULL,NULL,'7421cfb7-ccda-11ee-bf21-bce92fedfbf5',NULL,NULL,NULL,NULL,NULL),(108,'EMP004','komal','Dasari','Kota',NULL,'Software Engineer','komal.aa@example.com',2,'2024-02-12 00:00:00',0,3,6,11,NULL,NULL,NULL,NULL,'958bcff0-ccda-11ee-bf21-bce92fedfbf5',NULL,NULL,NULL,NULL,NULL),(109,'EMP005','Bharathi','Kumari','Paricharla',NULL,'Software Engineer','bharathiparicharla@gmail.com',2,NULL,NULL,3,6,11,NULL,NULL,NULL,NULL,'2aa116ba-d218-11ee-b8ee-d8bbc124b56a','bharathi',NULL,'bharathi',NULL,NULL),(110,'EMP006','Laila','Parigi','vangipuri',NULL,'HR','laila@gmail.com',2,NULL,NULL,3,6,6,NULL,'2024-02-23 12:03:22',NULL,NULL,'8ab29c95-d243-11ee-b8ee-d8bbc124b56a','Bharathi','2024-02-23 12:03:22','laila','2024-02-23 12:03:22',NULL),(111,'EMP007','Myna','Parigi','goripati',NULL,'Software Engineer','maina@gmail.com',2,'2024-02-23 12:10:33',NULL,NULL,NULL,NULL,NULL,'2024-02-23 12:10:33',NULL,NULL,'8b4ed3bb-d244-11ee-b8ee-d8bbc124b56a','maina','2024-02-23 12:10:33','maina','2024-02-23 12:10:33',NULL),(112,'EMP008','Jyothi','Parigi','eadiga',NULL,'Software Engineer','jyothi@gmail.com',2,'2024-02-23 18:53:52',NULL,NULL,NULL,NULL,NULL,'2024-02-23 18:53:52',NULL,NULL,'e32d71b9-d27c-11ee-b8ee-d8bbc124b56a',NULL,'2024-02-23 18:53:52',NULL,'2024-02-23 18:53:52',NULL),(113,'EMP009','Bhargavi','Parigi','paricharla',NULL,'Manager','bhargai@gmail.com',2,'2024-02-23 18:53:52',NULL,NULL,NULL,NULL,NULL,'2024-02-23 18:53:52',NULL,NULL,'e32dd964-d27c-11ee-b8ee-d8bbc124b56a',NULL,'2024-02-23 18:53:52',NULL,'2024-02-23 18:53:52',NULL),(114,'EMP010','Raju','Parigi','dasari',NULL,'Software Engineer','raju@gmail.com',1,'2024-02-23 18:53:52',NULL,NULL,NULL,NULL,NULL,'2024-02-23 18:53:52',NULL,NULL,'e32de374-d27c-11ee-b8ee-d8bbc124b56a',NULL,'2024-02-23 18:53:52',NULL,'2024-02-23 18:53:52',NULL),(115,'EMP011','Rani','Parigi','prince',NULL,'Manager','rani@gmail.com',2,'2024-02-23 18:53:52',NULL,NULL,NULL,NULL,NULL,'2024-02-23 18:53:52',NULL,NULL,'e32deb84-d27c-11ee-b8ee-d8bbc124b56a',NULL,'2024-02-23 18:53:52',NULL,'2024-02-23 18:53:52',NULL),(116,'EMP012','Ramu','Parigi','eadiga',NULL,'HR','ramu@gmail.com',1,'2024-02-23 18:53:52',NULL,NULL,NULL,NULL,NULL,'2024-02-23 18:53:52',NULL,NULL,'e32e046f-d27c-11ee-b8ee-d8bbc124b56a',NULL,'2024-02-23 18:53:52',NULL,'2024-02-23 18:53:52',NULL),(117,'EMP013','Rakhi','Parigi','mandal',NULL,'Software Engineer','rakhi@gmail.com',2,'2024-02-23 18:53:52',NULL,NULL,NULL,NULL,NULL,'2024-02-23 18:53:52',NULL,NULL,'e32e0bf6-d27c-11ee-b8ee-d8bbc124b56a',NULL,'2024-02-23 18:53:52',NULL,'2024-02-23 18:53:52',NULL),(118,'EMP014','Nikhil','chinna','goripati',NULL,'HR','nikhil@gmail.com',1,'2024-02-23 18:53:52',NULL,NULL,NULL,NULL,NULL,'2024-02-23 18:53:52',NULL,NULL,'e32e13a2-d27c-11ee-b8ee-d8bbc124b56a',NULL,'2024-02-23 18:53:52',NULL,'2024-02-23 18:53:52',NULL),(119,'EMP015','Ashok','Vamshi','meesala',NULL,'Software Engineer','ashok@gmail.com',1,'2024-02-23 18:53:52',NULL,NULL,NULL,NULL,NULL,'2024-02-23 18:53:52',NULL,NULL,'e32e1b88-d27c-11ee-b8ee-d8bbc124b56a',NULL,'2024-02-23 18:53:52',NULL,'2024-02-23 18:53:52',NULL),(120,'EMP016','Aparna','kumari','meesala',NULL,'Software Engineer','aparna@gmail.com',2,'2024-02-23 18:53:52',NULL,NULL,NULL,NULL,NULL,'2024-02-23 18:53:52',NULL,NULL,'e32e22fe-d27c-11ee-b8ee-d8bbc124b56a',NULL,'2024-02-23 18:53:52',NULL,'2024-02-23 18:53:52',NULL),(121,'EMP017','Bharath','Raju','kumar',NULL,'HR','bharath@gmail.com',1,'2024-02-23 18:53:52',NULL,NULL,NULL,NULL,NULL,'2024-02-23 18:53:52',NULL,NULL,'e32e2a33-d27c-11ee-b8ee-d8bbc124b56a',NULL,'2024-02-23 18:53:52',NULL,'2024-02-23 18:53:52',NULL),(122,'EMP018','Madhu','mohan','mathi',NULL,'Software Engineer','madhu@gmail.com',2,'2024-02-23 18:53:52',NULL,NULL,NULL,NULL,NULL,'2024-02-23 18:53:52',NULL,NULL,'e32e3173-d27c-11ee-b8ee-d8bbc124b56a',NULL,'2024-02-23 18:53:52',NULL,'2024-02-23 18:53:52',NULL),(123,'EMP019','Madhuri','Parigi','goripati',NULL,'Manager','madhuri@gmail.com',2,'2024-02-23 18:53:52',NULL,NULL,NULL,NULL,NULL,'2024-02-23 18:53:52',NULL,NULL,'e32e3981-d27c-11ee-b8ee-d8bbc124b56a',NULL,'2024-02-23 18:53:52',NULL,'2024-02-23 18:53:52',NULL),(124,'EMP020','Manasa','Parigi','goripati',NULL,'Manager','manasa@gmail.com',2,'2024-02-23 18:53:52',NULL,NULL,NULL,NULL,NULL,'2024-02-23 18:53:52',NULL,NULL,'e32e4370-d27c-11ee-b8ee-d8bbc124b56a',NULL,'2024-02-23 18:53:52',NULL,'2024-02-23 18:53:52',NULL),(125,'EMP021','Shruthi','Parigi','Reddy',NULL,'Software Enginerr','sruthi@gmail.com',2,'2024-03-05 07:10:23',NULL,NULL,NULL,NULL,NULL,'2024-03-05 07:10:23',NULL,NULL,'6ef38c7b-dabf-11ee-8f7e-d8bbc124b56a',NULL,'2024-03-05 07:10:23',NULL,'2024-03-05 07:10:23',NULL);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_skills`
--

DROP TABLE IF EXISTS `employee_skills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee_skills` (
  `employee_skill_id` bigint NOT NULL AUTO_INCREMENT,
  `employee_id` int DEFAULT NULL,
  `employee_code` varchar(45) NOT NULL,
  `skill_id` int NOT NULL,
  `competency_level_id` int NOT NULL,
  `skill_type_id` int NOT NULL,
  `years_of_experiance` int DEFAULT NULL,
  `certification` tinyint DEFAULT NULL,
  `description` text,
  `comments` text,
  `is_deleted` tinyint NOT NULL,
  `uuid` varchar(36) DEFAULT (uuid()),
  `created_by` varchar(45) NOT NULL,
  `created_on` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` varchar(45) NOT NULL,
  `modified_on` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`employee_skill_id`),
  KEY `employee_id` (`employee_id`),
  KEY `skill_id` (`skill_id`),
  KEY `skill_type_id` (`skill_type_id`),
  KEY `competency_level_id` (`competency_level_id`),
  CONSTRAINT `competency_level_id` FOREIGN KEY (`competency_level_id`) REFERENCES `common_reference_details` (`reference_details_id`),
  CONSTRAINT `employee_id` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`),
  CONSTRAINT `skill_id` FOREIGN KEY (`skill_id`) REFERENCES `skills` (`skill_id`),
  CONSTRAINT `skill_type_id` FOREIGN KEY (`skill_type_id`) REFERENCES `common_reference_details` (`reference_details_id`)
) ENGINE=InnoDB AUTO_INCREMENT=343 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_skills`
--

LOCK TABLES `employee_skills` WRITE;
/*!40000 ALTER TABLE `employee_skills` DISABLE KEYS */;
INSERT INTO `employee_skills` VALUES (1,105,'EMP001',2,20,23,1,0,'good','good',1,'e6c09b15-dabf-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 07:13:44','bharathi','2024-03-05 07:13:44'),(2,105,'EMP001',3,22,23,1,0,'good','good',1,'5d491aa9-dac0-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 07:17:02','bharathi','2024-03-05 07:17:02'),(3,105,'EMP001',25,22,24,1,0,'good','good',1,'5d492ad3-dac0-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 07:17:02','bharathi','2024-03-12 09:28:49'),(4,105,'EMP001',28,21,23,1,0,'good','good',1,'79a69ff5-dac0-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 07:17:50','bharathi','2024-03-05 07:17:50'),(5,105,'EMP001',32,22,24,1,0,'good','good',1,'9d9b7a61-dac0-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 07:18:50','bharathi','2024-03-05 07:18:50'),(6,105,'EMP001',39,20,23,1,0,'good','good',1,'d4b3540d-dac0-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 07:20:23','bharathi','2024-03-05 07:20:23'),(7,105,'EMP001',33,20,24,10,0,'iii','fdfjd',1,'f147dd56-dac0-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 07:21:11','bharathi','2024-03-13 08:49:13'),(8,105,'EMP001',34,21,23,31,1,'dsdgoodfa3','godfe4rfafdd',1,'fae0138c-dac0-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 07:21:27','bharathi','2024-03-13 13:14:00'),(9,105,'EMP001',35,21,23,1,0,'good','good',1,'02ed62bf-dac1-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 07:21:40','bharathi','2024-03-05 07:21:40'),(10,105,'EMP001',38,20,24,1,0,'good','good',1,'0d6e415c-dac1-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 07:21:58','bharathi','2024-03-13 14:49:45'),(11,105,'EMP001',23,21,24,1,1,'goodhhfdjjjjjjjjjjjjjjjfaee rfndhddafndfdnfndbfbefnfenfenjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjj','gooafndescfej ndanfhehfieqfdjfuefuefnkmfeihewhfriptionenfd',1,'1b282059-dac1-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 07:22:21','bharathi','2024-03-13 17:22:56'),(12,105,'EMP001',24,21,24,1,0,'good','good',1,'25f55bcb-dac1-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 07:22:39','bharathi','2024-03-05 07:22:39'),(13,105,'EMP001',27,20,24,1,0,'good','good',1,'31ab4290-dac1-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 07:22:59','bharathi','2024-03-05 07:22:59'),(14,105,'EMP001',30,21,24,1,0,'good','good',1,'3babe60f-dac1-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 07:23:15','bharathi','2024-03-05 07:23:15'),(15,105,'EMP001',31,21,24,3,0,'Hands on experience in Python programming','Used to build web applications',1,'46949f0a-dac1-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 07:23:34','bharathi','2024-03-14 06:41:23'),(16,105,'EMP001',40,20,24,1,0,'Better idea in basics of Django',' it provides powerful form library',0,'56e3f49f-dac1-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 07:24:01','bharathi','2024-03-15 08:59:24'),(17,105,'EMP001',41,20,24,1,0,'good','good',1,'5e3e6845-dac1-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 07:24:13','bharathi','2024-03-05 07:24:13'),(18,105,'EMP001',42,22,24,1,0,'good','good',1,'66015508-dac1-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 07:24:26','bharathi','2024-03-05 07:24:26'),(19,105,'EMP001',1,22,24,1,0,'good','good',1,'6fd8f8f9-dac1-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 07:24:43','bharathi','2024-03-05 07:24:43'),(20,105,'EMP001',4,20,24,1,0,'good','good',1,'97e75595-dac1-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 07:25:50','bharathi','2024-03-05 07:25:50'),(22,105,'EMP001',26,21,23,1,0,'good','good',1,'a1c5794a-dac1-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 07:26:07','bharathi','2024-03-05 07:26:07'),(23,105,'EMP001',29,20,24,1,0,'good','good',1,'b00064e0-dac1-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 07:26:31','bharathi','2024-03-05 07:26:31'),(24,105,'EMP001',36,21,24,1,0,'Good in core concepts','Redux is Javascript library',0,'b8af2d5d-dac1-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 07:26:45','bharathi','2024-03-14 04:43:19'),(25,105,'EMP001',37,21,24,1,0,'Good idea in resolving rules','webpack can read Json files only',0,'bef3ef49-dac1-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 07:26:56','bharathi','2024-03-14 04:43:29'),(26,105,'EMP001',43,22,24,1,0,'good','good',1,'cdb777f0-dac1-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 07:27:20','bharathi','2024-03-05 07:27:20'),(27,105,'EMP001',44,20,24,1,0,'good','good',1,'d72169a9-dac1-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 07:27:36','bharathi','2024-03-05 07:27:36'),(28,106,'EMP002',2,22,24,1,0,'good','good',0,'e37866c8-dac1-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 07:27:57','bharathi','2024-03-05 07:27:57'),(29,106,'EMP002',3,22,24,1,0,'good','good',0,'ecc2dc13-dac1-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 07:28:13','bharathi','2024-03-05 07:28:13'),(30,106,'EMP002',28,22,24,1,0,'good','good',0,'f4a4b107-dac1-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 07:28:26','bharathi','2024-03-05 07:28:26'),(31,106,'EMP002',39,22,24,1,0,'good','good',0,'011855bd-dac2-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 07:28:47','bharathi','2024-03-05 07:28:47'),(33,106,'EMP002',38,22,24,1,0,'good','good',0,'1624f5ab-dac2-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 07:29:22','bharathi','2024-03-05 07:29:22'),(34,106,'EMP002',30,22,24,1,0,'good','good',0,'1e3cf9c9-dac2-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 07:29:36','bharathi','2024-03-05 07:29:36'),(35,106,'EMP002',23,22,24,1,0,'good','good',0,'25b234a2-dac2-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 07:29:48','bharathi','2024-03-05 07:29:48'),(36,106,'EMP002',24,22,24,1,0,'good','good',0,'2b855ca1-dac2-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 07:29:58','bharathi','2024-03-05 07:29:58'),(39,106,'EMP002',31,22,24,1,0,'good','good',0,'4b41ee25-dac2-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 07:30:51','bharathi','2024-03-05 07:30:51'),(40,106,'EMP002',40,22,24,1,0,'good','good',0,'66f7db4f-dac2-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 07:31:38','bharathi','2024-03-05 07:31:38'),(41,106,'EMP002',41,22,24,1,0,'good','good',0,'6dfb9c52-dac2-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 07:31:49','bharathi','2024-03-05 07:31:49'),(42,106,'EMP002',42,22,24,1,0,'good','good',0,'7497a699-dac2-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 07:32:00','bharathi','2024-03-05 07:32:00'),(43,106,'EMP002',43,22,24,1,0,'good','good',0,'80b4e2e6-dac2-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 07:32:21','bharathi','2024-03-05 07:32:21'),(44,106,'EMP002',44,22,24,1,0,'good','good',0,'866cd671-dac2-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 07:32:30','bharathi','2024-03-05 07:32:30'),(45,106,'EMP002',37,22,24,1,0,'good','good',0,'8f2fa2e4-dac2-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 07:32:45','bharathi','2024-03-05 07:32:45'),(46,106,'EMP002',36,22,24,1,0,'good','good',0,'990746bc-dac2-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 07:33:02','bharathi','2024-03-05 07:33:02'),(47,107,'EMP003',36,22,24,1,0,'good','good',0,'a74e7ad6-dac2-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 07:33:26','bharathi','2024-03-05 07:33:26'),(48,107,'EMP003',37,22,24,1,0,'good','good',0,'ae2eb089-dac2-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 07:33:37','bharathi','2024-03-05 07:33:37'),(49,107,'EMP003',43,22,24,1,0,'good','good',0,'b5273215-dac2-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 07:33:49','bharathi','2024-03-05 07:33:49'),(50,107,'EMP003',44,22,24,1,0,'good','good',0,'bc3026fd-dac2-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 07:34:01','bharathi','2024-03-05 07:34:01'),(51,107,'EMP003',4,22,24,1,0,'good','good',0,'c4eb5727-dac2-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 07:34:15','bharathi','2024-03-05 07:34:15'),(52,107,'EMP003',1,22,24,1,0,'good','good',0,'cae57279-dac2-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 07:34:25','bharathi','2024-03-05 07:34:25'),(53,107,'EMP003',26,22,24,1,0,'good','good',0,'d511cc12-dac2-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 07:34:42','bharathi','2024-03-05 07:34:42'),(54,108,'EMP004',2,22,24,1,0,'good','good',0,'ecaedb7a-dac2-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 07:35:22','bharathi','2024-03-05 07:35:22'),(55,108,'EMP004',3,22,24,1,0,'good','good',0,'f6767b20-dac2-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 07:35:38','bharathi','2024-03-05 07:35:38'),(56,109,'EMP005',3,22,24,1,0,'good','good',0,'fdb75e9f-dac2-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 07:35:51','bharathi','2024-03-05 07:35:51'),(57,110,'EMP006',3,22,24,1,0,'good','good',0,'099ef9b5-dac3-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 07:36:10','bharathi','2024-03-05 07:36:10'),(58,111,'EMP007',3,22,24,1,0,'good','good',0,'10d26e9b-dac3-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 07:36:23','bharathi','2024-03-05 07:36:23'),(59,112,'EMP008',3,22,24,1,0,'good','good',0,'18ab69c3-dac3-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 07:36:36','bharathi','2024-03-05 07:36:36'),(60,113,'EMP009',3,22,24,1,0,'good','good',0,'21247e04-dac3-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 07:36:50','bharathi','2024-03-05 07:36:50'),(62,115,'EMP011',3,22,24,1,0,'good','good',0,'375d6b08-dac3-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 07:37:27','bharathi','2024-03-05 07:37:27'),(63,116,'EMP012',3,22,24,1,0,'good','good',0,'40642e04-dac3-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 07:37:42','bharathi','2024-03-05 07:37:42'),(64,117,'EMP013',3,22,24,1,0,'good','good',0,'485695ad-dac3-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 07:37:56','bharathi','2024-03-05 07:37:56'),(65,118,'EMP014',3,21,24,1,0,'good','good',0,'519ba095-dac3-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 07:38:11','bharathi','2024-03-05 07:38:11'),(66,119,'EMP015',3,20,24,1,0,'good','good',0,'59d23035-dac3-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 07:38:25','bharathi','2024-03-05 07:38:25'),(67,120,'EMP016',3,19,24,1,0,'good','good',0,'63106275-dac3-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 07:38:41','bharathi','2024-03-05 07:38:41'),(68,121,'EMP017',3,20,24,1,0,'good','good',0,'7da5506b-dac3-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 07:39:25','bharathi','2024-03-05 07:39:25'),(69,122,'EMP018',3,21,24,1,0,'good','good',0,'858cb217-dac3-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 07:39:38','bharathi','2024-03-05 07:39:38'),(70,123,'EMP019',3,20,24,1,0,'good','good',0,'8d7bb757-dac3-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 07:39:52','bharathi','2024-03-05 07:39:52'),(71,124,'EMP020',3,19,24,1,0,'good','good',0,'962d8338-dac3-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 07:40:06','bharathi','2024-03-05 07:40:06'),(72,125,'EMP021',3,20,24,1,0,'good','good',0,'a06afa39-dac3-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 07:40:23','bharathi','2024-03-05 07:40:23'),(73,107,'EMP003',38,19,23,1,0,'good','good',0,'352a6224-dad9-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 10:14:52','bharathi','2024-03-05 10:14:52'),(74,107,'EMP003',39,19,23,1,0,'good','good',0,'5024bb30-dae0-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 11:05:44','bharathi','2024-03-05 11:05:44'),(75,108,'EMP004',28,19,23,1,0,'good','good',0,'733c9b4e-dae0-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 11:06:43','bharathi','2024-03-05 11:06:43'),(76,108,'EMP004',25,21,23,1,0,'good','good',0,'8ecc4a97-dae0-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 11:07:29','bharathi','2024-03-05 11:07:29'),(77,109,'EMP005',28,22,23,1,0,'good','good',0,'aa729695-dae0-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 11:08:16','bharathi','2024-03-05 11:08:16'),(78,110,'EMP006',39,20,23,1,0,'good','good',0,'ef339b68-dae0-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 11:10:11','bharathi','2024-03-05 11:10:11'),(79,111,'EMP007',32,20,23,1,0,'good','good',0,'ef33ad44-dae0-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 11:10:11','bharathi','2024-03-05 11:10:11'),(80,112,'EMP008',25,19,23,1,0,'good','good',0,'1fe2e0d6-dae1-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 11:11:33','bharathi','2024-03-05 11:11:33'),(81,113,'EMP009',39,19,23,1,0,'good','good',0,'1fe2ed94-dae1-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 11:11:33','bharathi','2024-03-05 11:11:33'),(82,114,'EMP010',28,20,23,1,0,'good','good',0,'53f68863-dae1-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 11:13:00','bharathi','2024-03-05 11:13:00'),(83,115,'EMP011',32,20,23,1,0,'good','good',0,'53f6a2b8-dae1-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 11:13:00','bharathi','2024-03-05 11:13:00'),(84,116,'EMP012',25,20,24,1,0,'good','good',0,'72f91b25-dae1-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 11:13:52','bharathi','2024-03-05 11:13:52'),(85,117,'EMP013',39,20,24,1,0,'good','good',0,'b4a0f5f0-dae1-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 11:15:42','bharathi','2024-03-05 11:15:42'),(86,118,'EMP014',32,19,23,1,0,'good','good',0,'b4a14220-dae1-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 11:15:42','bharathi','2024-03-05 11:15:42'),(87,119,'EMP015',25,19,24,1,0,'good','good',0,'b4a14a05-dae1-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 11:15:42','bharathi','2024-03-05 11:15:42'),(88,120,'EMP016',28,20,23,1,0,'good','good',0,'cb71e6d6-dae1-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 11:16:21','bharathi','2024-03-05 11:16:21'),(89,121,'EMP017',25,22,23,1,0,'good','good',0,'2a5b2a08-dae2-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 11:19:00','bharathi','2024-03-05 11:19:00'),(90,122,'EMP018',39,20,23,1,0,'good','good',0,'2a5b4060-dae2-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 11:19:00','bharathi','2024-03-05 11:19:00'),(91,123,'EMP019',32,19,23,1,0,'good','good',0,'2a5b4bf8-dae2-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 11:19:00','bharathi','2024-03-05 11:19:00'),(92,124,'EMP020',28,19,23,1,0,'good','good',0,'5835b0f7-dae2-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 11:20:17','bharathi','2024-03-05 11:20:17'),(93,107,'EMP003',30,20,24,1,0,'good','good',0,'e8be8322-dae2-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 11:24:19','bharathi','2024-03-05 11:24:19'),(94,108,'EMP004',40,20,24,1,0,'good','good',0,'3fd1d384-dae3-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 11:26:45','bharathi','2024-03-05 11:26:45'),(95,109,'EMP005',31,19,24,1,0,'good','good',0,'3fd1e247-dae3-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 11:26:45','bharathi','2024-03-05 11:26:45'),(96,109,'EMP005',30,19,23,1,0,'good','good',0,'3fd1eab9-dae3-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 11:26:45','bharathi','2024-03-05 11:26:45'),(97,110,'EMP006',30,20,24,1,0,'good','good',0,'3fd1f15c-dae3-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 11:26:45','bharathi','2024-03-05 11:26:45'),(98,111,'EMP007',40,20,23,1,0,'good','good',0,'58ff595f-dae3-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 11:27:28','bharathi','2024-03-05 11:27:28'),(99,112,'EMP008',30,20,23,1,0,'good','good',0,'99686430-dae3-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 11:29:16','bharathi','2024-03-05 11:29:16'),(100,113,'EMP009',31,20,23,1,0,'good','good',0,'9968b491-dae3-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 11:29:16','bharathi','2024-03-05 11:29:16'),(101,114,'EMP010',23,19,23,1,0,'good','good',0,'9968bd8b-dae3-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 11:29:16','bharathi','2024-03-05 11:29:16'),(102,115,'EMP011',40,20,23,1,0,'good','good',0,'d1095ba9-dae3-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 11:30:49','bharathi','2024-03-05 11:30:49'),(103,116,'EMP012',23,20,23,1,0,'good','good',0,'d1096a92-dae3-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 11:30:49','bharathi','2024-03-05 11:30:49'),(104,117,'EMP013',40,22,24,1,0,'good','good',0,'d109738d-dae3-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 11:30:49','bharathi','2024-03-05 11:30:49'),(105,118,'EMP014',31,21,24,1,0,'good','good',0,'fe1c5eff-dae3-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 11:32:05','bharathi','2024-03-05 11:32:05'),(106,119,'EMP015',30,21,24,1,0,'good','good',0,'fe1c6d0f-dae3-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 11:32:05','bharathi','2024-03-05 11:32:05'),(107,120,'EMP016',40,19,23,1,0,'good','good',0,'37c8f4d3-dae4-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 11:33:41','bharathi','2024-03-05 11:33:41'),(108,121,'EMP017',31,20,23,1,0,'good','good',0,'37c906c4-dae4-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 11:33:41','bharathi','2024-03-05 11:33:41'),(109,122,'EMP018',40,20,23,1,0,'good','good',0,'37c90f28-dae4-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 11:33:41','bharathi','2024-03-05 11:33:41'),(110,123,'EMP019',23,21,23,1,0,'good','good',0,'526b46a7-dae4-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 11:34:26','bharathi','2024-03-05 11:34:26'),(111,124,'EMP020',40,20,23,1,0,'good','good',0,'6dfb41ac-dae4-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 11:35:12','bharathi','2024-03-05 11:35:12'),(112,107,'EMP003',24,19,24,1,0,'good','good',0,'2f0ed5ac-dae5-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 11:40:36','bharathi','2024-03-05 11:40:36'),(113,108,'EMP004',42,20,23,1,0,'good','good',0,'2f0ee539-dae5-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 11:40:36','bharathi','2024-03-05 11:40:36'),(114,109,'EMP005',41,20,23,1,0,'good','good',0,'2f0ef103-dae5-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 11:40:36','bharathi','2024-03-05 11:40:36'),(115,110,'EMP006',27,20,23,1,0,'good','good',0,'2f0efb1e-dae5-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 11:40:36','bharathi','2024-03-05 11:40:36'),(116,111,'EMP007',42,19,23,1,0,'good','good',0,'2f0f0678-dae5-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 11:40:36','bharathi','2024-03-05 11:40:36'),(117,112,'EMP008',27,20,24,1,0,'good','good',0,'2f0f1004-dae5-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 11:40:36','bharathi','2024-03-05 11:40:36'),(118,113,'EMP009',41,20,23,3,0,'good','good',0,'2f0f18d9-dae5-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 11:40:36','bharathi','2024-03-05 11:40:36'),(119,114,'EMP010',42,19,24,1,0,'good','good',0,'8cf79fc5-dae5-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 11:43:14','bharathi','2024-03-05 11:43:14'),(120,115,'EMP011',24,20,23,1,0,'good','good',0,'8cf7ae4f-dae5-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 11:43:14','bharathi','2024-03-05 11:43:14'),(121,116,'EMP012',27,20,23,1,0,'good','good',0,'8cf8f321-dae5-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 11:43:14','bharathi','2024-03-05 11:43:14'),(122,117,'EMP013',24,20,24,1,0,'good','good',0,'13e0f2c8-dae6-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 11:47:00','bharathi','2024-03-05 11:47:00'),(123,118,'EMP014',42,20,23,1,0,'good','good',0,'62cea192-dae6-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 11:49:13','bharathi','2024-03-05 11:49:13'),(124,119,'EMP015',41,19,24,1,0,'good','good',0,'62ceb2a3-dae6-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 11:49:13','bharathi','2024-03-05 11:49:13'),(125,120,'EMP016',24,22,23,1,0,'good','good',0,'eac9027c-dae6-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 11:53:01','bharathi','2024-03-05 11:53:01'),(126,121,'EMP017',27,21,24,1,0,'good','good',0,'eac91427-dae6-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 11:53:01','bharathi','2024-03-05 11:53:01'),(127,122,'EMP018',42,20,23,1,0,'good','good',0,'eac91ffa-dae6-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 11:53:01','bharathi','2024-03-05 11:53:01'),(128,123,'EMP019',41,22,23,1,0,'good','good',0,'eac92990-dae6-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 11:53:01','bharathi','2024-03-05 11:53:01'),(129,124,'EMP020',27,20,24,1,0,'good','good',0,'eac9331c-dae6-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 11:53:01','bharathi','2024-03-05 11:53:01'),(130,108,'EMP004',37,19,23,1,0,'good','good',0,'ba36af00-dae7-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 11:58:49','bharathi','2024-03-05 11:58:49'),(131,109,'EMP005',1,20,24,1,0,'good','good',0,'ba36c0b4-dae7-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 11:58:49','bharathi','2024-03-05 11:58:49'),(132,110,'EMP006',4,21,23,1,0,'good','good',0,'ba36cb8a-dae7-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 11:58:49','bharathi','2024-03-05 11:58:49'),(133,111,'EMP007',37,22,23,1,0,'good','good',0,'ba36d41d-dae7-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 11:58:49','bharathi','2024-03-05 11:58:49'),(134,112,'EMP008',36,20,24,1,0,'good','good',0,'ba36de02-dae7-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 11:58:49','bharathi','2024-03-05 11:58:49'),(135,113,'EMP009',4,20,23,1,0,'good','good',0,'ba36e819-dae7-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 11:58:49','bharathi','2024-03-05 11:58:49'),(136,114,'EMP010',36,20,23,1,0,'good','good',0,'ba36efd1-dae7-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 11:58:49','bharathi','2024-03-05 11:58:49'),(137,115,'EMP011',37,20,23,1,0,'good','good',0,'0c836580-dae8-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 12:01:07','bharathi','2024-03-05 12:01:07'),(138,116,'EMP012',4,20,23,1,0,'good','good',0,'0c8374f5-dae8-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 12:01:07','bharathi','2024-03-05 12:01:07'),(139,117,'EMP013',1,20,23,1,0,'good','good',0,'0c837ddc-dae8-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 12:01:07','bharathi','2024-03-05 12:01:07'),(140,118,'EMP014',37,20,24,2,0,'good','good',0,'0c838577-dae8-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 12:01:07','bharathi','2024-03-05 12:01:07'),(142,119,'EMP015',36,22,23,3,0,'good','good',0,'773c36a0-dae8-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 12:04:06','bharathi','2024-03-05 12:04:06'),(143,120,'EMP016',1,21,23,1,0,'good','good',0,'773c45b1-dae8-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 12:04:06','bharathi','2024-03-05 12:04:06'),(144,121,'EMP017',37,21,24,1,0,'good','good',0,'773c4ef7-dae8-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 12:04:06','bharathi','2024-03-05 12:04:06'),(145,122,'EMP018',4,22,24,1,0,'good','good',0,'773c5829-dae8-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 12:04:06','bharathi','2024-03-05 12:04:06'),(146,123,'EMP019',36,21,23,1,0,'good','good',0,'773c61a8-dae8-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 12:04:06','bharathi','2024-03-05 12:04:06'),(147,124,'EMP020',37,22,23,1,0,'good','good',0,'8d978445-dae8-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 12:04:43','bharathi','2024-03-05 12:04:43'),(148,108,'EMP004',26,20,24,1,0,'good','good',0,'1080ca27-daea-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 12:15:32','bharathi','2024-03-05 12:15:32'),(149,109,'EMP005',44,19,23,1,0,'good','good',0,'1080df6f-daea-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 12:15:32','bharathi','2024-03-05 12:15:32'),(150,110,'EMP006',43,20,23,1,0,'good','good',0,'1080ed46-daea-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 12:15:32','bharathi','2024-03-05 12:15:32'),(151,111,'EMP007',26,22,23,1,0,'good','good',0,'1080fa17-daea-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 12:15:32','bharathi','2024-03-05 12:15:32'),(152,112,'EMP008',29,21,24,1,0,'good','good',0,'108101f8-daea-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 12:15:32','bharathi','2024-03-05 12:15:32'),(153,113,'EMP009',26,22,24,1,0,'good','good',0,'108108e9-daea-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 12:15:32','bharathi','2024-03-05 12:15:32'),(154,114,'EMP010',44,20,24,1,0,'good','good',0,'10810f51-daea-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 12:15:32','bharathi','2024-03-05 12:15:32'),(155,115,'EMP011',43,20,23,1,0,'good','good',0,'108115f5-daea-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 12:15:32','bharathi','2024-03-05 12:15:32'),(156,116,'EMP012',29,22,24,1,0,'good','good',0,'10811c77-daea-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 12:15:32','bharathi','2024-03-05 12:15:32'),(157,117,'EMP013',44,20,23,1,0,'goood','good',0,'108122e6-daea-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 12:15:32','bharathi','2024-03-05 12:15:32'),(158,118,'EMP014',26,22,24,1,0,'good','good',0,'1081292e-daea-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 12:15:32','bharathi','2024-03-05 12:15:32'),(159,119,'EMP015',43,21,23,1,0,'good','good',0,'10812ff5-daea-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 12:15:32','bharathi','2024-03-05 12:15:32'),(160,120,'EMP016',29,22,23,1,0,'good','good',0,'10813682-daea-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 12:15:32','bharathi','2024-03-05 12:15:32'),(161,121,'EMP017',44,21,24,1,0,'good','good',0,'10813d37-daea-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 12:15:32','bharathi','2024-03-05 12:15:32'),(162,122,'EMP018',29,22,23,2,0,'good','good',0,'108143ad-daea-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 12:15:32','bharathi','2024-03-05 12:15:32'),(163,123,'EMP019',43,21,23,3,0,'good','good',0,'108149f1-daea-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 12:15:32','bharathi','2024-03-05 12:15:32'),(164,124,'EMP020',26,22,24,4,0,'good','good',0,'10815040-daea-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 12:15:32','bharathi','2024-03-05 12:15:32'),(165,105,'EMP001',5,20,23,2,0,'good','good',1,'0c59e585-db14-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 17:16:04','bharathi','2024-03-05 17:16:04'),(166,106,'EMP002',6,19,24,2,0,'good','good',0,'83f05040-db14-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 17:19:25','bharathi','2024-03-05 17:19:25'),(167,105,'EMP001',6,20,23,1,0,'good','good',1,'d38b2880-db1a-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 18:04:35','bharathi','2024-03-05 18:04:35'),(168,106,'EMP002',5,21,23,1,0,'good','good',0,'6a2627cc-db1b-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 18:08:48','bharathi','2024-03-05 18:08:48'),(169,105,'EMP001',46,20,23,3,0,'I am good in verbal communication','Used to communicate with others',0,'ecdd58a8-db1b-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 18:12:27','bharathi','2024-03-14 04:44:10'),(170,105,'EMP001',47,19,24,1,0,'good','good',1,'ecdd6a81-db1b-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 18:12:27','bharathi','2024-03-05 18:12:27'),(171,106,'EMP002',46,20,23,1,0,'good','good',0,'ecdd7509-db1b-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 18:12:27','bharthi','2024-03-05 18:12:27'),(172,106,'EMP002',47,20,23,1,0,'good','good',0,'ecdd7ed2-db1b-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 18:12:27','bharathi','2024-03-05 18:12:27'),(173,107,'EMP003',5,20,23,1,0,'good','good',0,'358a24d6-db1c-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 18:14:29','bharathi','2024-03-05 18:14:29'),(174,108,'EMP004',46,19,24,1,0,'good','good',0,'358a7def-db1c-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 18:14:29','bharathi','2024-03-05 18:14:29'),(175,107,'EMP003',47,20,23,1,0,'good','good',0,'6485282d-db1c-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 18:15:48','bharathi','2024-03-05 18:15:48'),(176,108,'EMP004',47,20,23,1,0,'good','good',0,'849061cd-db1c-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 18:16:42','bharathi','2024-03-05 18:16:42'),(177,107,'EMP003',46,20,23,1,0,'good','good',0,'c5fbd4cd-db1c-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 18:18:32','bharathi','2024-03-05 18:18:32'),(178,109,'EMP005',6,19,24,1,0,'good','good',0,'fbc06875-db1c-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 18:20:02','bharathi','2024-03-05 18:20:02'),(179,110,'EMP006',46,20,23,1,0,'good','good',0,'fbc17aff-db1c-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 18:20:02','bharathi','2024-03-05 18:20:02'),(180,111,'EMP007',6,20,23,1,0,'good','good',0,'319925b2-db1d-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 18:21:32','bharathi','2024-03-05 18:21:32'),(181,112,'EMP008',46,20,23,1,0,'good','good',0,'31993579-db1d-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 18:21:32','bharathi','2024-03-05 18:21:32'),(182,113,'EMP009',6,22,23,1,0,'good','goood',0,'5f131950-db1d-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 18:22:49','bharathi','2024-03-05 18:22:49'),(183,114,'EMP010',46,21,24,1,0,'good','good',0,'5f1326ae-db1d-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 18:22:49','bharathi','2024-03-05 18:22:49'),(184,115,'EMP011',6,22,23,1,0,'good','good',0,'89f4249d-db1e-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 18:31:10','bharathi','2024-03-05 18:31:10'),(185,116,'EMP012',46,20,24,1,0,'good','good',0,'89f47293-db1e-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 18:31:10','bharathi','2024-03-05 18:31:10'),(186,117,'EMP013',6,20,23,1,0,'good','good',0,'89f479fe-db1e-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 18:31:10','bharathi','2024-03-05 18:31:10'),(187,118,'EMP014',46,19,23,1,0,'good','good',0,'89f482c6-db1e-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 18:31:10','bharathi','2024-03-05 18:31:10'),(188,119,'EMP015',6,20,23,1,0,'good','good',0,'89f48a5f-db1e-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 18:31:10','bharathi','2024-03-05 18:31:10'),(189,120,'EMP016',46,21,23,1,0,'good','good',0,'aefc753c-db1e-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 18:32:12','bharathi','2024-03-05 18:32:12'),(190,121,'EMP017',6,22,23,1,0,'good','good',0,'89f49124-db1e-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 18:31:10','bharathi','2024-03-05 18:31:10'),(191,122,'EMP018',46,20,23,1,0,'good','good',0,'89f497b3-db1e-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 18:31:10','bharathi','2024-03-05 18:31:10'),(192,123,'EMP019',6,20,23,1,0,'good','good',0,'89f49e2a-db1e-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 18:31:10','bharathi','2024-03-05 18:31:10'),(193,124,'EMP020',46,20,24,1,0,'good','good',0,'cffdb477-db1e-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 18:33:08','bharathi','2024-03-05 18:33:08'),(194,109,'EMP005',5,22,23,1,0,'good','good',0,'6e574170-db20-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 18:44:43','bharathi','2024-03-05 18:44:43'),(195,110,'EMP006',47,21,24,1,0,'good','good',0,'6e575294-db20-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 18:44:43','bharathi','2024-03-05 18:44:43'),(196,111,'EMP007',5,22,23,1,0,'good','good',0,'6e575d2d-db20-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 18:44:43','bharathi','2024-03-05 18:44:43'),(197,112,'EMP008',47,20,24,1,0,'good','good',0,'6e576718-db20-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 18:44:43','bharathi','2024-03-05 18:44:43'),(198,113,'EMP019',5,21,23,1,0,'good','good',0,'6e5770c3-db20-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 18:44:43','bharathi','2024-03-05 18:44:43'),(199,114,'EMP010',47,19,23,1,0,'goood','good',0,'6e577958-db20-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 18:44:43','bharathi','2024-03-05 18:44:43'),(200,115,'EMP011',5,20,23,1,0,'good','good',0,'6e57824f-db20-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 18:44:43','bharathi','2024-03-05 18:44:43'),(201,116,'EMP012',47,22,23,1,0,'good','good',0,'6e57891d-db20-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 18:44:43','bharathi','2024-03-05 18:44:43'),(202,117,'EMP013',5,19,23,1,0,'good','good',0,'6e578fb0-db20-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 18:44:43','bharathi','2024-03-05 18:44:43'),(203,118,'EMP014',47,20,24,1,0,'good','good',0,'6e579938-db20-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 18:44:43','bharathi','2024-03-05 18:44:43'),(204,119,'EMP015',5,22,23,1,0,'good','good',0,'6e57a3b0-db20-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 18:44:43','bharathi','2024-03-05 18:44:43'),(205,120,'EMP016',47,20,24,1,0,'good','good',0,'6e57ab36-db20-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 18:44:43','bharathi','2024-03-05 18:44:43'),(206,121,'EMP017',5,22,23,1,0,'good','good',0,'6e57b1d0-db20-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 18:44:43','bharathi','2024-03-05 18:44:43'),(207,122,'EMP018',47,21,23,1,0,'good','good',0,'6e57b853-db20-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 18:44:43','bharathi','2024-03-05 18:44:43'),(208,123,'EMP019',5,22,23,1,0,'good','good',0,'6e57bed6-db20-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 18:44:43','bharathi','2024-03-05 18:44:43'),(209,124,'EMP020',47,22,23,1,0,'good','good',0,'6e57c532-db20-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 18:44:43','bharathi','2024-03-05 18:44:43'),(210,105,'EMP001',7,20,23,1,0,'good','good',1,'efa5fb3e-db20-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 18:48:20','bharathi','2024-03-05 18:48:20'),(211,106,'EMP002',50,21,23,1,0,'good','good',0,'efa61873-db20-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 18:48:20','bharathi','2024-03-05 18:48:20'),(212,107,'EMP003',7,20,23,1,0,'good','good',0,'28b5a9c5-db22-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 18:57:05','bharathi','2024-03-05 18:57:05'),(213,108,'EMP004',50,22,23,1,0,'good','good',0,'28b5f302-db22-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 18:57:05','bharathi','2024-03-05 18:57:05'),(214,109,'EMP005',7,19,24,1,0,'good','good',0,'28b5fe93-db22-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 18:57:05','bharathi','2024-03-05 18:57:05'),(215,110,'EMP006',50,22,23,1,0,'good','good',0,'28b6065b-db22-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 18:57:05','bharathi','2024-03-05 18:57:05'),(216,111,'EMP007',7,21,23,1,0,'good','good',0,'28b60e26-db22-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 18:57:05','bharathi','2024-03-05 18:57:05'),(217,112,'EMP008',50,22,23,1,0,'good','good',0,'28b6159b-db22-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 18:57:05','bharathi','2024-03-05 18:57:05'),(218,113,'EMP009',7,19,23,1,0,'good','good',0,'28b61d0c-db22-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 18:57:05','bharathi','2024-03-05 18:57:05'),(219,114,'EMP010',50,20,23,2,0,'good','good',0,'28b626a8-db22-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 18:57:05','bharathi','2024-03-05 18:57:05'),(220,115,'EMP011',7,22,23,1,0,'good','good',0,'28b62ea4-db22-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 18:57:05','bharathi','2024-03-05 18:57:05'),(221,116,'EMP012',50,21,23,1,0,'good','good',0,'28b6382d-db22-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 18:57:05','bharathi','2024-03-05 18:57:05'),(223,117,'EMP013',7,22,23,1,0,'good','good',0,'28b64542-db22-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 18:57:05','bharathi','2024-03-05 18:57:05'),(224,118,'EMP014',50,19,23,1,0,'good','good',0,'28b64f86-db22-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 18:57:05','bharathi','2024-03-05 18:57:05'),(225,119,'EMP015',7,20,23,1,0,'god','good',0,'28b656fa-db22-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 18:57:05','bharathi','2024-03-05 18:57:05'),(226,120,'EMP016',50,22,23,1,0,'good','good',0,'28b65e3a-db22-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 18:57:05','bharathi','2024-03-05 18:57:05'),(227,121,'EMP017',7,22,23,1,0,'good','good',0,'28b664fa-db22-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 18:57:05','bharathi','2024-03-05 18:57:05'),(228,122,'EMP018',50,21,23,1,0,'good','good',0,'28b66d33-db22-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 18:57:05','bharathi','2024-03-05 18:57:05'),(229,123,'EMP019',7,21,23,1,0,'good','good',0,'28b6742f-db22-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 18:57:05','bharathi','2024-03-05 18:57:05'),(230,124,'EMP020',50,22,23,1,0,'good','good',0,'28b67a8c-db22-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 18:57:05','bharathi','2024-03-05 18:57:05'),(231,105,'EMP001',8,20,23,1,0,'I have good idea in visual communications','Good to have this skills',0,'bac4c17e-db23-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 19:08:19','bharathi','2024-03-14 04:32:12'),(232,106,'EMP002',49,20,23,1,0,'good','good',0,'bac4d064-db23-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 19:08:19','bharathi','2024-03-05 19:08:19'),(233,107,'EMP003',8,21,23,1,0,'good','good',0,'bac4da5b-db23-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 19:08:19','bharathi','2024-03-05 19:08:19'),(234,108,'EMP004',49,22,23,1,0,'good','good',0,'bac4e34f-db23-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 19:08:19','bharathi','2024-03-05 19:08:19'),(235,109,'EMP005',8,19,23,1,0,'good','good',0,'bac4ec1d-db23-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 19:08:19','bharathi','2024-03-05 19:08:19'),(236,110,'EMP006',49,20,24,1,0,'good','good',0,'bac4f367-db23-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 19:08:19','bharathi','2024-03-05 19:08:19'),(237,111,'EMP007',8,21,23,1,0,'good','good',0,'bac4fa1f-db23-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 19:08:19','bharathi','2024-03-05 19:08:19'),(238,112,'EMP008',49,22,23,1,0,'good','good',0,'bac500ac-db23-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 19:08:19','bharathi','2024-03-05 19:08:19'),(239,113,'EMP009',8,19,23,1,0,'good','good',0,'bac50836-db23-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 19:08:19','bharathi','2024-03-05 19:08:19'),(240,114,'EMP010',49,20,23,1,0,'good','good',0,'bac59fac-db23-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 19:08:19','bharathi','2024-03-05 19:08:19'),(241,115,'EMP011',8,21,23,1,0,'good','good',0,'bac5a64e-db23-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 19:08:19','bharathi','2024-03-05 19:08:19'),(242,116,'EMP012',49,22,23,1,0,'good','good',0,'bac5ad03-db23-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 19:08:19','bharathi','2024-03-05 19:08:19'),(243,117,'EMP013',8,19,23,1,0,'good','good',0,'bac5b372-db23-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 19:08:19','bharathi','2024-03-05 19:08:19'),(244,118,'EMP014',49,20,23,1,0,'good','good',0,'bac5b9cc-db23-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 19:08:19','bharathi','2024-03-05 19:08:19'),(245,119,'EMP015',8,21,23,1,0,'good','good',0,'bac5c00f-db23-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 19:08:19','bharathi','2024-03-05 19:08:19'),(246,120,'EMP016',49,22,23,1,0,'good','good',0,'bac5c68c-db23-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 19:08:19','bharathi','2024-03-05 19:08:19'),(247,121,'EMP017',8,19,23,1,0,'good','good',0,'bac5cdc4-db23-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 19:08:19','bharathi','2024-03-05 19:08:19'),(248,122,'EMP018',49,20,23,1,0,'good','good',0,'bac5d490-db23-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 19:08:19','bharathi','2024-03-05 19:08:19'),(249,123,'EMP019',8,21,23,1,0,'good','good',0,'bac5db06-db23-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 19:08:19','bharathi','2024-03-05 19:08:19'),(250,124,'EMP020',49,22,23,1,0,'good','good',0,'bac5e339-db23-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 19:08:19','bharathi','2024-03-05 19:08:19'),(251,105,'EMP001',55,19,23,1,0,'good','good',1,'01f6fc59-db24-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 19:10:19','bharathi','2024-03-05 19:10:19'),(252,106,'EMP002',55,19,23,1,0,'good','good',0,'184559f1-db24-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 19:10:56','bharathi','2024-03-05 19:10:56'),(253,107,'EMP003',55,20,23,1,0,'good','good',0,'228bb838-db24-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 19:11:13','bharathi','2024-03-05 19:11:13'),(254,108,'EMP004',55,20,23,1,0,'good','good',0,'29ac89e9-db24-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 19:11:25','bharathi','2024-03-05 19:11:25'),(255,109,'EMP005',55,20,23,1,0,'good','good',0,'3262575b-db24-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 19:11:40','bharathi','2024-03-05 19:11:40'),(256,110,'EMP006',55,20,23,1,0,'good','good',0,'3a9cafa6-db24-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 19:11:54','bharathi','2024-03-05 19:11:54'),(257,111,'EMP007',55,20,23,1,0,'good','good',0,'428264cf-db24-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 19:12:07','bharathi','2024-03-05 19:12:07'),(258,112,'EMP008',55,20,23,1,0,'good','good',0,'4adf14f7-db24-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 19:12:21','bharathi','2024-03-05 19:12:21'),(259,113,'EMP009',55,22,23,1,0,'good','good',0,'55ed6456-db24-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 19:12:40','bharathi','2024-03-05 19:12:40'),(260,114,'EMP010',55,22,23,1,0,'good','good',0,'5e4a3773-db24-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 19:12:54','bharathi','2024-03-05 19:12:54'),(261,115,'EMP011',55,22,23,1,0,'good','good',0,'6553ef27-db24-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 19:13:06','bharathi','2024-03-05 19:13:06'),(262,116,'EMP012',55,22,23,1,0,'good','good',0,'6c728194-db24-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 19:13:17','bharathi','2024-03-05 19:13:17'),(263,117,'EMP013',55,22,23,1,0,'good','good',0,'738a4402-db24-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 19:13:29','bharathi','2024-03-05 19:13:29'),(264,118,'EMP014',55,22,23,1,0,'good','good',0,'7afea95c-db24-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 19:13:42','bharathi','2024-03-05 19:13:42'),(265,119,'EMP015',55,22,23,1,0,'good','good',0,'8296e5af-db24-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 19:13:55','bharathi','2024-03-05 19:13:55'),(266,120,'EMP016',55,22,23,1,0,'good','good',0,'8a14cfe7-db24-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 19:14:07','bharathi','2024-03-05 19:14:07'),(267,121,'EMP017',55,22,23,1,0,'good','good',0,'97052dfd-db24-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 19:14:29','bharathi','2024-03-05 19:14:29'),(268,122,'EMP018',55,22,23,1,0,'good','good',0,'9e4ca985-db24-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 19:14:41','bharathi','2024-03-05 19:14:41'),(269,123,'EMP019',55,22,23,1,0,'good','good',0,'a8b45c5b-db24-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 19:14:59','bharathi','2024-03-05 19:14:59'),(270,124,'EMP020',55,22,23,1,0,'good','good',0,'b11a4a42-db24-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 19:15:13','bharathi','2024-03-05 19:15:13'),(271,105,'EMP001',12,20,23,1,0,'good','good',1,'12da44dc-db75-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-06 04:50:36','bharathi','2024-03-06 04:50:36'),(272,106,'EMP002',61,19,23,1,0,'good','good',0,'12da58fb-db75-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-06 04:50:36','bharathi','2024-03-06 04:50:36'),(273,107,'EMP003',12,20,23,1,0,'good','good',0,'383f50ef-db76-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-06 04:58:49','bharathi','2024-03-06 04:58:49'),(274,108,'EMP004',61,20,23,1,0,'good','good',0,'383f64f0-db76-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-06 04:58:49','bharathi','2024-03-06 04:58:49'),(275,109,'EMP005',12,22,23,1,0,'good','good',0,'383f6f6f-db76-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-06 04:58:49','bharathi','2024-03-06 04:58:49'),(276,110,'EMP006',61,21,23,1,0,'good','good',0,'383f7b97-db76-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-06 04:58:49','bharathi','2024-03-06 04:58:49'),(277,111,'EMP007',12,21,23,1,0,'good','good',0,'383f8892-db76-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-06 04:58:49','bharathi','2024-03-06 04:58:49'),(278,112,'EMP008',61,21,23,1,0,'good','good',0,'383f90f4-db76-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-06 04:58:49','bharathi','2024-03-06 04:58:49'),(279,113,'EMP009',12,22,23,1,0,'good','good',0,'383f97d7-db76-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-06 04:58:49','bharathi','2024-03-06 04:58:49'),(280,114,'EMP010',61,22,23,1,0,'good','good',0,'383fa0ae-db76-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-06 04:58:49','bharthi','2024-03-06 04:58:49'),(281,115,'EMP011',12,22,23,1,0,'good','good',0,'383fa812-db76-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-06 04:58:49','bharathi','2024-03-06 04:58:49'),(282,116,'EMP012',61,22,23,1,0,'good','good',0,'383fae7f-db76-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-06 04:58:49','bharathi','2024-03-06 04:58:49'),(283,117,'EMP013',12,20,23,1,0,'good','good',0,'383fb4d3-db76-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-06 04:58:49','bharathi','2024-03-06 04:58:49'),(284,118,'EMP014',61,21,23,1,0,'good','good',0,'383fbb34-db76-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-06 04:58:49','bharathi','2024-03-06 04:58:49'),(285,119,'EMP015',12,22,24,1,0,'good','good',0,'383fc180-db76-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-06 04:58:49','bharathi','2024-03-06 04:58:49'),(286,120,'EMP016',61,22,23,1,0,'good','good',0,'383fc7d6-db76-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-06 04:58:49','bharathi','2024-03-06 04:58:49'),(287,121,'EMP017',12,21,23,1,0,'good','good',0,'383fce61-db76-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-06 04:58:49','bharathi','2024-03-06 04:58:49'),(288,122,'EMP018',61,20,23,1,0,'good','good',0,'383fd4c7-db76-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-06 04:58:49','bharathi','2024-03-06 04:58:49'),(289,123,'EMP019',12,20,23,1,0,'good','good',0,'383fdb1f-db76-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-06 04:58:49','bharathi','2024-03-06 04:58:49'),(290,124,'EMP020',61,20,23,1,0,'good','good',0,'383fe19f-db76-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-06 04:58:49','bharathi','2024-03-06 04:58:49'),(291,105,'EMP001',11,20,23,1,1,'good','good',1,'cdb18318-db77-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-06 05:10:09','bharathi','2024-03-13 06:49:26'),(292,106,'EMP002',62,20,23,1,0,'good','good',0,'cdb26974-db77-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-06 05:10:09','bharathi','2024-03-06 05:10:09'),(293,107,'EMP003',11,20,23,1,0,'good','good',0,'96958af5-db77-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-06 05:08:36','bharathi','2024-03-06 05:08:36'),(294,108,'EMP004',62,20,23,1,0,'good','good',0,'969671b3-db77-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-06 05:08:36','bharathi','2024-03-06 05:08:36'),(295,109,'EMP005',11,22,23,1,0,'good','good',0,'9697480b-db77-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-06 05:08:36','bharathi','2024-03-06 05:08:36'),(296,110,'EMP006',62,21,23,1,0,'good','good',0,'9697f18c-db77-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-06 05:08:36','bharathi','2024-03-06 05:08:36'),(297,111,'EMP007',11,21,23,1,0,'good','good',0,'96989069-db77-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-06 05:08:36','bharathi','2024-03-06 05:08:36'),(298,112,'EMP008',62,21,23,3,0,'good','good',0,'96991ef7-db77-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-06 05:08:36','bharathi','2024-03-06 05:08:36'),(299,113,'EMP009',11,22,23,2,0,'good','good',0,'9699a0d7-db77-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-06 05:08:36','bharathi','2024-03-06 05:08:36'),(300,114,'EMP010',62,22,23,3,0,'good','good',0,'969a2970-db77-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-06 05:08:36','bharthi','2024-03-06 05:08:36'),(301,115,'EMP011',11,22,23,4,0,'good','good',0,'969acca8-db77-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-06 05:08:36','bharathi','2024-03-06 05:08:36'),(302,116,'EMP012',62,22,23,4,0,'good','good',0,'969b75e4-db77-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-06 05:08:36','bharathi','2024-03-06 05:08:36'),(303,117,'EMP013',11,20,23,5,0,'good','good',0,'969c5a3d-db77-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-06 05:08:36','bharathi','2024-03-06 05:08:36'),(304,118,'EMP014',62,21,23,5,0,'good','good',0,'969d402f-db77-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-06 05:08:36','bharathi','2024-03-06 05:08:36'),(305,119,'EMP015',11,22,24,9,0,'good','good',0,'969de3a9-db77-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-06 05:08:36','bharathi','2024-03-06 05:08:36'),(306,120,'EMP016',62,22,23,2,0,'good','good',0,'969e6865-db77-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-06 05:08:36','bharathi','2024-03-06 05:08:36'),(307,121,'EMP017',11,21,23,5,0,'good','good',0,'969ef7a9-db77-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-06 05:08:36','bharathi','2024-03-06 05:08:36'),(308,122,'EMP018',62,20,23,4,0,'good','good',0,'969f9eca-db77-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-06 05:08:36','bharathi','2024-03-06 05:08:36'),(309,123,'EMP019',11,20,23,3,0,'good','good',0,'96a031c8-db77-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-06 05:08:36','bharathi','2024-03-06 05:08:36'),(310,124,'EMP020',62,20,23,6,0,'good','good',0,'7a1cbc3f-db77-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-06 05:07:49','bharathi','2024-03-06 05:07:49'),(312,121,'EMP017',19,21,24,1,0,'good','good',0,'eac91427-dae6-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 11:53:01','bharathi','2024-03-05 11:53:01'),(313,121,'EMP017',20,21,24,3,1,'good','good',0,'f44d2be3-dfb5-11ee-b694-54e1adde2cb1','bharathi','2024-03-11 14:45:07','bharathi','2024-03-11 14:45:07'),(314,121,'EMP017',67,20,23,2,0,'good','good',0,'f44d70b0-dfb5-11ee-b694-54e1adde2cb1','bharathi','2024-03-11 14:45:07','bharathi','2024-03-11 14:45:07'),(315,115,'EMP011',20,22,23,4,0,'good','good',0,'969acca8-db77-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-06 05:08:36','bharathi','2024-03-06 05:08:36'),(316,113,'EMP009',20,22,23,2,0,'good','good',0,'9699a0d7-db77-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-06 05:08:36','bharathi','2024-03-06 05:08:36'),(320,105,'EMP001',2,20,24,2,1,'good','d',1,'fe23ddf1-e10c-11ee-b694-54e1adde2cb1','John Doe Smith','2024-03-13 07:40:41','John Doe Smith','2024-03-13 07:40:41'),(321,105,'EMP001',2,22,23,4,1,'fefe','ef',1,'96c52f6a-e11d-11ee-b694-54e1adde2cb1','John Doe Smith','2024-03-13 09:39:29','John Doe Smith','2024-03-13 09:39:29'),(322,105,'EMP001',11,19,23,2,1,'involves analyzing and evaluating information','It is foundational to learn and intellectual growth ',0,'105bd754-e11e-11ee-b694-54e1adde2cb1','John Doe Smith','2024-03-13 09:42:53','John Doe Smith','2024-03-14 04:09:24'),(323,105,'EMP001',30,19,23,34,1,'fdehrhhr','afd',1,'af95c1c9-e125-11ee-b694-54e1adde2cb1','John Doe Smith','2024-03-13 10:37:27','John Doe Smith','2024-03-13 10:37:44'),(324,105,'EMP001',30,20,24,1,1,'sds','dwd',1,'9ff677dc-e126-11ee-b694-54e1adde2cb1','John Doe Smith','2024-03-13 10:44:10','John Doe Smith','2024-03-13 12:00:31'),(325,105,'EMP001',17,20,23,1,1,'ytge','ethr',1,'6c6d5b9f-e139-11ee-b694-54e1adde2cb1','John Doe Smith','2024-03-13 12:58:44','John Doe Smith','2024-03-13 12:58:44'),(326,105,'EMP001',12,20,23,3,1,'It encompass the ability to collect','Proficiency in using data analysis tools ',0,'9eac4d56-e13b-11ee-b694-54e1adde2cb1','John Doe Smith','2024-03-13 13:14:28','John Doe Smith','2024-03-14 04:07:25'),(328,105,'EMP001',2,21,23,5,1,'as','df',1,'57eecc46-e13e-11ee-b694-54e1adde2cb1','John Doe Smith','2024-03-13 13:33:57','John Doe Smith','2024-03-13 13:33:57'),(329,105,'EMP001',33,20,23,5,1,'d','e',1,'16785f43-e142-11ee-b694-54e1adde2cb1','John Doe Smith','2024-03-13 14:00:46','John Doe Smith','2024-03-13 14:00:46'),(330,105,'EMP001',34,20,23,9,1,'yf','sdgf',1,'e4022713-e143-11ee-b694-54e1adde2cb1','John Doe Smith','2024-03-13 14:13:40','John Doe Smith','2024-03-13 14:13:40'),(331,105,'EMP001',35,20,23,4,1,'f','e',1,'34c72038-e149-11ee-b694-54e1adde2cb1','John Doe Smith','2024-03-13 14:51:43','John Doe Smith','2024-03-13 14:51:43'),(332,105,'EMP001',38,21,23,9,0,'fdfer','ae',1,'497c87e4-e159-11ee-b694-54e1adde2cb1','John Doe Smith','2024-03-13 16:46:50','John Doe Smith','2024-03-13 16:47:06'),(333,105,'EMP001',17,20,23,1,1,'Capable to accept any situation ','Nothing to describe more',0,'b7d55864-e159-11ee-b694-54e1adde2cb1','John Doe Smith','2024-03-13 16:49:55','John Doe Smith','2024-03-13 20:10:44'),(334,105,'EMP001',38,20,23,5,1,'ggf','dd',1,'92f99026-e15b-11ee-b694-54e1adde2cb1','John Doe Smith','2024-03-13 17:03:12','John Doe Smith','2024-03-13 17:03:12'),(335,105,'EMP001',23,20,24,3,1,'Grip on DDL,DML,TCL topics','still learning more',0,'88486b36-e175-11ee-b694-54e1adde2cb1','John Doe Smith','2024-03-13 20:09:01','John Doe Smith','2024-03-14 06:26:01'),(336,105,'EMP001',2,21,24,1,0,'fh','fedf',1,'b0a8cdef-e1d7-11ee-a694-54e1adde2cb1','John Doe Smith','2024-03-14 07:51:39','John Doe Smith','2024-03-14 07:51:55'),(337,105,'EMP001',2,20,23,2,0,'some ','some text',1,'d88fe6f9-e1e1-11ee-95e8-54e1adde2cb1','John Doe Smith','2024-03-14 09:04:21','John Doe Smith','2024-03-14 09:04:44'),(338,105,'EMP001',2,21,23,1,1,'some','some comments',0,'d7e52f92-e1e7-11ee-95e8-54e1adde2cb1','John Doe Smith','2024-03-14 09:47:17','John Doe Smith','2024-03-14 09:47:17'),(339,105,'EMP001',25,20,23,2,1,'ee','dfad',1,'f9815b6d-e1e7-11ee-95e8-54e1adde2cb1','John Doe Smith','2024-03-14 09:48:13','John Doe Smith','2024-03-14 09:48:13'),(340,105,'EMP001',6,20,23,3,0,'wee','afd',1,'f9823ebd-e1e7-11ee-95e8-54e1adde2cb1','John Doe Smith','2024-03-14 09:48:13','John Doe Smith','2024-03-14 09:48:13'),(341,105,'EMP001',31,22,24,3,1,'python','good in this skill',1,'392cb7b0-e1e9-11ee-95e8-54e1adde2cb1','John Doe Smith','2024-03-14 09:57:10','John Doe Smith','2024-03-14 09:58:16'),(342,105,'EMP001',35,20,23,5,1,'fd','d',1,'94a895bf-e2aa-11ee-95e8-54e1adde2cb1','John Doe Smith','2024-03-15 09:01:16','John Doe Smith','2024-03-15 09:01:16');
/*!40000 ALTER TABLE `employee_skills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `holiday`
--

DROP TABLE IF EXISTS `holiday`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `holiday` (
  `holiday_id` bigint NOT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `created_on` datetime(6) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `holiday_date` datetime(6) DEFAULT NULL,
  `holiday_day` varchar(255) DEFAULT NULL,
  `holiday_name` varchar(255) DEFAULT NULL,
  `is_deleted` bit(1) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `modified_by` varchar(255) DEFAULT NULL,
  `modified_on` datetime(6) DEFAULT NULL,
  `uuid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`holiday_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `holiday`
--

LOCK TABLES `holiday` WRITE;
/*!40000 ALTER TABLE `holiday` DISABLE KEYS */;
/*!40000 ALTER TABLE `holiday` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_day_timesheet`
--

DROP TABLE IF EXISTS `project_day_timesheet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project_day_timesheet` (
  `timesheet_day_id` int NOT NULL AUTO_INCREMENT,
  `timesheet_week_id` int DEFAULT NULL,
  `attendance_type` int DEFAULT NULL,
  `task_id` int DEFAULT NULL,
  `date` timestamp NULL DEFAULT NULL,
  `no_of_hours` int DEFAULT NULL,
  `is_active` tinyint DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT NULL,
  `uuid` varchar(36) DEFAULT (uuid()),
  `created_by` varchar(255) DEFAULT NULL,
  `created_on` timestamp NULL DEFAULT NULL,
  `modified_by` varchar(255) DEFAULT NULL,
  `modified_on` timestamp NULL DEFAULT NULL,
  `isdeleted` tinyint DEFAULT NULL,
  PRIMARY KEY (`timesheet_day_id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `timesheet_week_id` (`timesheet_week_id`),
  KEY `task_id` (`task_id`),
  KEY `attendance_type_idx` (`attendance_type`),
  CONSTRAINT `attendance_type` FOREIGN KEY (`attendance_type`) REFERENCES `common_reference_details` (`reference_details_id`),
  CONSTRAINT `project_day_timesheet_ibfk_1` FOREIGN KEY (`timesheet_week_id`) REFERENCES `project_week_timesheet` (`timesheet_week_id`),
  CONSTRAINT `project_day_timesheet_ibfk_2` FOREIGN KEY (`task_id`) REFERENCES `account_project_task` (`task_id`)
) ENGINE=InnoDB AUTO_INCREMENT=360 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_day_timesheet`
--

LOCK TABLES `project_day_timesheet` WRITE;
/*!40000 ALTER TABLE `project_day_timesheet` DISABLE KEYS */;
INSERT INTO `project_day_timesheet` VALUES (331,1,53,10001,'2024-02-26 00:00:00',7,0,NULL,'53c6c459-d60e-11ee-a710-bce92fedfbf5','komal','2024-02-28 07:52:32','komal','2024-02-28 07:52:32',0),(332,1,53,10001,'2024-02-27 00:00:00',5,0,NULL,'53d36da8-d60e-11ee-a710-bce92fedfbf5','komal','2024-02-28 07:52:32','komal','2024-02-28 07:52:32',0),(333,1,54,10002,'2024-02-26 00:00:00',1,0,NULL,'53db82f0-d60e-11ee-a710-bce92fedfbf5','komal','2024-02-28 07:52:32','komal','2024-02-28 07:52:32',0),(334,1,54,10002,'2024-02-27 00:00:00',4,0,NULL,'53e24f7f-d60e-11ee-a710-bce92fedfbf5','komal','2024-02-28 07:52:32','komal','2024-02-28 07:52:32',0),(355,252,53,10010,'2024-02-26 00:00:00',7,0,NULL,'96ebb2fa-d61c-11ee-a710-bce92fedfbf5','komal','2024-02-28 09:34:37','komal','2024-02-28 09:34:37',0),(356,252,53,10010,'2024-02-27 00:00:00',7,0,NULL,'96f2b702-d61c-11ee-a710-bce92fedfbf5','komal','2024-02-28 09:34:37','komal','2024-02-28 09:34:37',0),(357,252,54,10013,'2024-02-26 00:00:00',2,0,NULL,'9701c215-d61c-11ee-a710-bce92fedfbf5','komal','2024-02-28 09:34:38','komal','2024-02-28 09:34:38',0),(358,252,54,10013,'2024-02-27 00:00:00',2,0,NULL,'970c4a38-d61c-11ee-a710-bce92fedfbf5','komal','2024-02-28 09:34:38','komal','2024-02-28 09:34:38',0),(359,2,54,10010,'2024-02-26 18:30:00',8,0,NULL,'6d8005ce-d62c-11ee-a2f2-7b2132996a49','John','2024-02-27 18:30:00','John','2024-02-27 18:30:00',0);
/*!40000 ALTER TABLE `project_day_timesheet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_week_timesheet`
--

DROP TABLE IF EXISTS `project_week_timesheet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project_week_timesheet` (
  `timesheet_week_id` int NOT NULL AUTO_INCREMENT,
  `account_id` int DEFAULT NULL,
  `account_project_id` int DEFAULT NULL,
  `employee_id` int DEFAULT NULL,
  `week_number` int DEFAULT NULL,
  `week_start_date` timestamp NULL DEFAULT NULL,
  `week_end_date` timestamp NULL DEFAULT NULL,
  `comments` varchar(255) DEFAULT NULL,
  `timesheet_status` int DEFAULT NULL,
  `approved_by` int DEFAULT NULL,
  `is_active` tinyint DEFAULT NULL,
  `is_deleted` tinyint DEFAULT NULL,
  `uuid` varchar(36) DEFAULT (uuid()),
  `created_by` varchar(255) DEFAULT NULL,
  `created_on` timestamp NULL DEFAULT NULL,
  `modified_by` varchar(255) DEFAULT NULL,
  `modified_on` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`timesheet_week_id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `account_id` (`account_id`),
  KEY `account_project_id` (`account_project_id`),
  KEY `employee_id` (`employee_id`),
  KEY `approved_by` (`approved_by`),
  KEY `timesheet_status_idx` (`timesheet_status`),
  CONSTRAINT `project_week_timesheet_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `account` (`account_id`),
  CONSTRAINT `project_week_timesheet_ibfk_2` FOREIGN KEY (`account_project_id`) REFERENCES `account_projects` (`account_project_id`),
  CONSTRAINT `project_week_timesheet_ibfk_3` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`),
  CONSTRAINT `project_week_timesheet_ibfk_4` FOREIGN KEY (`approved_by`) REFERENCES `employee` (`employee_id`),
  CONSTRAINT `timesheet_status` FOREIGN KEY (`timesheet_status`) REFERENCES `common_reference_details` (`reference_details_id`)
) ENGINE=InnoDB AUTO_INCREMENT=253 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_week_timesheet`
--

LOCK TABLES `project_week_timesheet` WRITE;
/*!40000 ALTER TABLE `project_week_timesheet` DISABLE KEYS */;
INSERT INTO `project_week_timesheet` VALUES (1,2,112,108,8,'2024-02-26 00:00:00','2024-03-03 00:00:00',NULL,59,107,0,0,'68bff90e-d60b-11ee-a710-bce92fedfbf5','komal','2024-02-28 07:31:38','komal','2024-02-28 07:31:38'),(2,2,112,105,8,'2024-02-25 18:30:00','2024-03-02 18:30:00',NULL,58,107,0,0,'269282c2-d62c-11ee-a2f2-7b2132996a49','John','2024-02-27 18:30:00','John','2024-02-27 18:30:00'),(252,3,113,108,8,'2024-02-26 00:00:00','2024-03-03 00:00:00',NULL,58,107,0,0,'96e5bef1-d61c-11ee-a710-bce92fedfbf5','komal','2024-02-28 09:34:37','komal','2024-02-28 09:34:37');
/*!40000 ALTER TABLE `project_week_timesheet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skill_competency`
--

DROP TABLE IF EXISTS `skill_competency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `skill_competency` (
  `role_id` bigint NOT NULL AUTO_INCREMENT,
  `role_name` varchar(45) NOT NULL,
  `skill_id` int NOT NULL,
  `skill_type_id` int NOT NULL,
  `competency_level_id` int NOT NULL,
  `years_of_experiance` int DEFAULT NULL,
  `certification` tinyint DEFAULT NULL,
  `description` text,
  `comments` text,
  `is_deleted` tinyint DEFAULT NULL,
  `created_by` varchar(45) NOT NULL,
  `created_on` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` varchar(45) NOT NULL,
  `modified_on` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `uuid` varchar(36) DEFAULT (uuid()),
  PRIMARY KEY (`role_id`),
  KEY `skill_type_id` (`skill_type_id`),
  KEY `competency_level_id` (`competency_level_id`),
  KEY `skill_id` (`skill_id`),
  CONSTRAINT `skill_competency_ibfk_1` FOREIGN KEY (`skill_type_id`) REFERENCES `common_reference_details` (`reference_details_id`),
  CONSTRAINT `skill_competency_ibfk_2` FOREIGN KEY (`competency_level_id`) REFERENCES `common_reference_details` (`reference_details_id`),
  CONSTRAINT `skill_competency_ibfk_3` FOREIGN KEY (`skill_id`) REFERENCES `skills` (`skill_id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skill_competency`
--

LOCK TABLES `skill_competency` WRITE;
/*!40000 ALTER TABLE `skill_competency` DISABLE KEYS */;
INSERT INTO `skill_competency` VALUES (1,'Java BackEnd Developer',2,23,22,1,0,'good','good',0,'bharathi','2024-02-29 16:18:49','bharathi','2024-02-29 16:18:49','38f5fa2b-d71e-11ee-9b0c-d8bbc124b56a'),(2,'Java BackEnd Developer',3,23,22,1,0,'good','good',0,'bharathi','2024-02-29 16:20:22','bharathi','2024-02-29 16:20:22','701d7087-d71e-11ee-9b0c-d8bbc124b56a'),(3,'Java BackEnd Developer',33,24,20,1,0,'good','good',0,'bharthi','2024-02-29 16:20:22','bharathi','2024-02-29 16:20:22','701d8543-d71e-11ee-9b0c-d8bbc124b56a'),(4,'Java BackEnd Developer',34,23,19,1,0,'good','good',0,'bharathi','2024-02-29 16:22:32','bharathi','2024-02-29 16:22:32','bd92b868-d71e-11ee-9b0c-d8bbc124b56a'),(5,'Java BackEnd Developer',35,24,21,1,0,'good','good',0,'bharathi','2024-02-29 16:22:32','bharahi','2024-02-29 16:22:32','bd92c9d5-d71e-11ee-9b0c-d8bbc124b56a'),(6,'FrontEnd Developer',25,24,20,1,0,'good','good',0,'bharathi','2024-02-29 16:22:32','bharathi','2024-02-29 16:22:32','bd92d90c-d71e-11ee-9b0c-d8bbc124b56a'),(7,'FrontEnd Developer',28,24,21,1,0,'good','good',0,'bharathi','2024-02-29 16:22:32','bharathi','2024-02-29 16:22:32','bd92e144-d71e-11ee-9b0c-d8bbc124b56a'),(8,'Backend Developer',30,24,21,1,0,'good','good',0,'bharathi','2024-02-29 16:30:32','bharathi','2024-02-29 16:30:32','db7f32e3-d71f-11ee-9b0c-d8bbc124b56a'),(9,'Backend Developer',31,24,21,1,0,'good','good',0,'bharathi','2024-02-29 16:30:32','bharathi','2024-02-29 16:30:32','db7f8ef4-d71f-11ee-9b0c-d8bbc124b56a'),(10,'Backend Developer',23,24,22,1,0,'good','good',0,'bharathi','2024-02-29 16:30:32','bharathi','2024-02-29 16:30:32','db7f9fae-d71f-11ee-9b0c-d8bbc124b56a'),(11,'Frontend Developer',24,24,19,1,0,'good','good',0,'bharathi','2024-02-29 16:30:32','bharathi','2024-02-29 16:30:32','db7fa83b-d71f-11ee-9b0c-d8bbc124b56a'),(13,'MERN Web Developer',26,24,22,1,0,'good','good',0,'bharathi','2024-02-29 16:36:19','bharathi','2024-02-29 16:36:19','aa46e121-d720-11ee-9b0c-d8bbc124b56a'),(14,'MERN Web Developer',29,24,20,1,0,'good','good',0,'bharathi','2024-02-29 16:36:19','bharathi','2024-02-29 16:36:19','aa470128-d720-11ee-9b0c-d8bbc124b56a'),(15,'MERN Developer',36,24,22,1,0,'good','good',0,'bharathi','2024-02-29 16:36:19','bharathi','2024-02-29 16:36:19','aa470caa-d720-11ee-9b0c-d8bbc124b56a'),(16,'MERN Developer',37,24,22,1,0,'good','good',0,'bharathi','2024-02-29 16:36:19','bharathi','2024-02-29 16:36:19','aa4715c7-d720-11ee-9b0c-d8bbc124b56a'),(17,'MERN Developer',1,24,22,1,0,'good','good',0,'bharathi','2024-02-29 16:36:19','bharathi','2024-02-29 16:36:19','aa471e4f-d720-11ee-9b0c-d8bbc124b56a'),(18,'MERN Developer',4,24,20,1,0,'good','good',0,'bharathi','2024-02-29 16:36:19','bharathi','2024-02-29 16:36:19','aa47299c-d720-11ee-9b0c-d8bbc124b56a'),(19,'Java BackEnd Developer',38,24,21,1,0,'good','good',0,'bharathi','2024-03-05 06:52:33','bharathi','2024-03-05 06:52:33','f14d9b7b-dabc-11ee-8f7e-d8bbc124b56a'),(20,'FrontEnd Developer',32,23,20,1,0,'good','good',0,'bharathi','2024-03-05 06:56:07','bharathi','2024-03-05 06:56:07','7129c187-dabd-11ee-8f7e-d8bbc124b56a'),(21,'FrontEnd Developer',39,23,19,1,0,'good','good',0,'bharathi','2024-03-05 06:56:46','bharathi','2024-03-05 06:56:46','883d23dd-dabd-11ee-8f7e-d8bbc124b56a'),(22,'Backend Developer',40,23,22,1,0,'good','good',0,'bharathi','2024-03-05 07:00:28','bharathi','2024-03-05 07:00:28','0c878b5a-dabe-11ee-8f7e-d8bbc124b56a'),(23,'Frontend Developer',41,23,20,1,0,'good','good',0,'bharathi','2024-03-05 07:03:23','bharathi','2024-03-05 07:03:23','749de7d2-dabe-11ee-8f7e-d8bbc124b56a'),(24,'Frontend Developer',42,24,19,1,0,'good','good',0,'bharathi','2024-03-05 07:03:23','bharathi','2024-03-05 07:03:23','749e16f3-dabe-11ee-8f7e-d8bbc124b56a'),(25,'MERN Web Developer',43,24,20,1,0,'good','good',0,'bharathi','2024-03-05 07:08:19','bharathi','2024-03-05 07:08:19','257de272-dabf-11ee-8f7e-d8bbc124b56a'),(26,'MERN Web Developer',44,23,20,1,0,'good','good',0,'bharathi','2024-03-05 07:08:19','bharathi','2024-03-05 07:08:19','257decd5-dabf-11ee-8f7e-d8bbc124b56a'),(27,'HR',5,23,22,1,0,'good','good',0,'bharathi','2024-03-05 16:02:57','bharathi','2024-03-05 16:02:57','d5541179-db09-11ee-8f7e-d8bbc124b56a'),(28,'TeamLead',7,23,20,1,0,'good','good',0,'bharathi','2024-03-05 16:06:46','bharathi','2024-03-05 16:06:46','5dc91100-db0a-11ee-8f7e-d8bbc124b56a'),(29,'Manager',8,23,20,1,0,'good','good',0,'bharathi','2024-03-05 16:06:46','bharathi','2024-03-05 16:06:46','5dc94c78-db0a-11ee-8f7e-d8bbc124b56a'),(30,'Manager',6,23,20,1,0,'good','good',0,'bharathi','2024-03-05 16:18:12','bharathi','2024-03-05 16:18:12','f6b515e9-db0b-11ee-8f7e-d8bbc124b56a'),(31,'Manager',46,23,21,1,0,'good','good',0,'bharathi','2024-03-05 16:26:44','bharathi','2024-03-05 16:26:44','27fea7b5-db0d-11ee-8f7e-d8bbc124b56a'),(32,'HR',47,23,22,1,0,'good','good',0,'bharathi','2024-03-05 16:29:05','bharathi','2024-03-05 16:29:05','7be36dfc-db0d-11ee-8f7e-d8bbc124b56a'),(33,'Manager',49,24,20,1,0,'good','good',0,'bharathi','2024-03-05 16:41:35','bharathi','2024-03-05 16:41:35','3b04f1fa-db0f-11ee-8f7e-d8bbc124b56a'),(34,'TeamLead',50,23,20,1,0,'good','good',0,'bharathi','2024-03-05 16:41:35','bharathi','2024-03-05 16:41:35','3b04f87f-db0f-11ee-8f7e-d8bbc124b56a'),(36,'Developer',55,23,21,4,0,'good','good',0,'bharathi','2024-03-05 16:50:56','bharathi','2024-03-05 16:50:56','893071b4-db10-11ee-8f7e-d8bbc124b56a'),(37,'HR',56,24,21,5,0,'good','good',0,'bharathi','2024-03-05 17:06:06','bharathi','2024-03-05 17:06:06','a7d2f721-db12-11ee-8f7e-d8bbc124b56a'),(38,'Manager',57,23,22,2,0,'good','good',0,'bharathi','2024-03-05 17:06:06','bharathi','2024-03-05 17:06:06','a7d304aa-db12-11ee-8f7e-d8bbc124b56a'),(39,'HR',58,23,22,3,0,'good','good',0,'bharathi','2024-03-05 17:09:25','bharathi','2024-03-05 17:09:25','1e87ebc3-db13-11ee-8f7e-d8bbc124b56a'),(40,'Manager',59,24,20,10,0,'good','good',0,'bharathi','2024-03-05 17:09:25','bharathi','2024-03-05 17:09:25','1e87f8d0-db13-11ee-8f7e-d8bbc124b56a'),(42,'HR',12,24,20,8,0,'good','good',0,'bharathi','2024-03-06 04:45:13','bhaarthi','2024-03-06 04:45:13','51d62cd6-db74-11ee-8f7e-d8bbc124b56a'),(43,'TeamLead',11,23,21,2,0,'good','good',0,'bharathi','2024-03-06 04:45:13','bharathi','2024-03-06 04:45:13','51d63fe7-db74-11ee-8f7e-d8bbc124b56a'),(44,'HR',61,23,22,4,0,'good','good',0,'bharathi','2024-03-06 04:47:47','bharathi','2024-03-06 04:47:47','adb7b602-db74-11ee-8f7e-d8bbc124b56a'),(45,'TeamLead',62,24,20,5,0,'good','good',0,'bhaarthi','2024-03-06 04:47:47','bharathi','2024-03-06 04:47:47','adb80268-db74-11ee-8f7e-d8bbc124b56a'),(46,'HR',66,23,21,7,0,'good','good',0,'bharathi','2024-03-06 05:24:09','bharathi','2024-03-06 05:24:09','c27b971e-db79-11ee-8f7e-d8bbc124b56a'),(47,'HR',64,24,21,7,0,'good','good',0,'bharathi','2024-03-06 05:24:09','bharathi','2024-03-06 05:24:09','c27ba540-db79-11ee-8f7e-d8bbc124b56a'),(48,'Manager',14,23,21,8,0,'good','good',0,'bharathi','2024-03-06 05:24:09','bharathi','2024-03-06 05:24:09','c27baf25-db79-11ee-8f7e-d8bbc124b56a'),(49,'Manager',66,24,21,2,0,'good','good',0,'bharathi','2024-03-06 05:24:09','bharathi','2024-03-06 05:24:09','c27bb9e2-db79-11ee-8f7e-d8bbc124b56a'),(53,'HR',67,23,22,8,1,'Good','Good',0,'Bharathi','2024-03-11 14:39:36','Bharathi','2024-03-11 14:39:36','2f0d1191-dfb5-11ee-b694-54e1adde2cb1'),(54,'HR',19,23,21,7,0,'good','good',0,'bharathi','2024-03-06 05:24:09','bharathi','2024-03-06 05:24:09','c27b971e-db79-11ee-8f7e-d8bbc124b56a'),(55,'Manager',20,23,21,7,0,'good','good',0,'bharathi','2024-03-06 05:24:09','bharathi','2024-03-06 05:24:09','c27b971e-db79-11ee-8f7e-d8bbc124b56a'),(56,'Team Lead',27,23,21,7,0,'good','good',0,'bharathi','2024-03-11 14:50:04','bharathi','2024-03-11 14:50:04','a5383887-dfb6-11ee-b694-54e1adde2cb1');
/*!40000 ALTER TABLE `skill_competency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skills`
--

DROP TABLE IF EXISTS `skills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `skills` (
  `skill_id` int NOT NULL AUTO_INCREMENT,
  `skill_name` varchar(45) NOT NULL,
  `techinical_category_id` int NOT NULL,
  `skill_category_id` int NOT NULL,
  `description` text,
  `is_deleted` tinyint DEFAULT NULL,
  `uuid` varchar(36) DEFAULT (uuid()),
  `created_by` varchar(45) NOT NULL,
  `created_on` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` varchar(45) NOT NULL,
  `modified_on` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `status` tinyint DEFAULT NULL,
  PRIMARY KEY (`skill_id`),
  KEY `techinical_category_id` (`techinical_category_id`),
  KEY `skill_category_id` (`skill_category_id`),
  CONSTRAINT `skill_category_id` FOREIGN KEY (`skill_category_id`) REFERENCES `common_reference_details` (`reference_details_id`),
  CONSTRAINT `techinical_category_id` FOREIGN KEY (`techinical_category_id`) REFERENCES `common_reference_details` (`reference_details_id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skills`
--

LOCK TABLES `skills` WRITE;
/*!40000 ALTER TABLE `skills` DISABLE KEYS */;
INSERT INTO `skills` VALUES (1,'Mongo DB',31,25,'Basic web styling',1,'c6e38761-cfc4-11ee-b694-54e1adde2cb1','Rakhi','2024-02-20 07:50:55','Rakhi','2024-02-20 07:50:55',1),(2,'Java',30,25,'Basic java ',1,'647b5a27-cfc5-11ee-b694-54e1adde2cb1','Rakhi','2024-02-20 07:55:20','Rakhi','2024-02-20 07:55:20',1),(3,'Sql',30,25,'Basic sql  in java',1,'6482b861-cfcd-11ee-b694-54e1adde2cb1','Rakhi','2024-02-20 08:52:36','Rakhi','2024-02-20 08:52:36',1),(4,'Express Js',31,25,'basic express js',0,'82427ce0-d26f-11ee-b8ee-d8bbc124b56a','bharathi','2024-02-23 17:18:06','bharathi','2024-02-23 17:18:06',1),(5,'Verbal Communication',55,26,'communication Skills',0,'8242cfb3-d26f-11ee-b8ee-d8bbc124b56a','jyothi','2024-02-23 17:18:06','jyothi','2024-02-23 17:18:06',1),(6,'Written Communication',55,26,'writting skils',0,'8242d7a2-d26f-11ee-b8ee-d8bbc124b56a','laila','2024-02-23 17:18:06','laila','2024-02-23 17:18:06',1),(7,'Public Speaking',56,26,'speaking skills',0,'8242de11-d26f-11ee-b8ee-d8bbc124b56a','myna','2024-02-23 17:18:06','myna','2024-02-23 17:18:06',1),(8,'Visual Communication',56,26,'Obesrving skills',0,'8242e4bc-d26f-11ee-b8ee-d8bbc124b56a','handhana','2024-02-23 17:18:06','chandhana','2024-02-23 17:18:06',1),(9,'Analytical Thinking',57,26,'problem solving skills',0,'8242eae4-d26f-11ee-b8ee-d8bbc124b56a','baharthi','2024-02-23 17:18:06','bharathi','2024-02-23 17:18:06',1),(10,'Creativity',57,26,'creativity',0,'8242f103-d26f-11ee-b8ee-d8bbc124b56a','Ram','2024-02-23 17:18:06','Ram','2024-02-23 17:18:06',1),(11,'Critical Thinking',58,27,'critical thinking',0,'8242f793-d26f-11ee-b8ee-d8bbc124b56a','Setha','2024-02-23 17:18:06','Setha','2024-02-23 17:18:06',1),(12,'Data Analysis',58,27,'data analyst in HR',0,'8242fdc5-d26f-11ee-b8ee-d8bbc124b56a','Raju','2024-02-23 17:18:06','Raju','2024-02-23 17:18:06',1),(14,'Time Management',59,27,'In Manager',0,'82430e2c-d26f-11ee-b8ee-d8bbc124b56a','latha','2024-02-23 17:18:06','latha','2024-02-23 17:18:06',1),(15,'Budgeting',60,27,'budget',0,'824315c1-d26f-11ee-b8ee-d8bbc124b56a','kavitha','2024-02-23 17:18:06','kavitha','2024-02-23 17:18:06',1),(16,'Financial Analysis',60,27,'finace',0,'82431d62-d26f-11ee-b8ee-d8bbc124b56a','rakhi','2024-02-23 17:18:06','rakhi','2024-02-23 17:18:06',1),(17,'Acceptance of Feedback',61,28,'acceptance',0,'824323bd-d26f-11ee-b8ee-d8bbc124b56a','bhargavi','2024-02-23 17:18:06','bhargavi','2024-02-23 17:18:06',1),(18,'Cultural Sensitivity',61,28,'cultural',0,'824329bc-d26f-11ee-b8ee-d8bbc124b56a','myna','2024-02-23 17:18:06','myna','2024-02-23 17:18:06',1),(19,'Coping Strategies',62,28,'coping',0,'82432fdc-d26f-11ee-b8ee-d8bbc124b56a','Bharath','2024-02-23 17:18:06','Bharath','2024-02-23 17:18:06',1),(20,'Work-Life Balance',62,28,'work-life',0,'82433639-d26f-11ee-b8ee-d8bbc124b56a','raju','2024-02-23 17:18:06','raju','2024-02-23 17:18:06',1),(21,' Empathy',63,28,'empathy',0,'82433c37-d26f-11ee-b8ee-d8bbc124b56a','rani','2024-02-23 17:18:06','rani','2024-02-23 17:18:06',1),(22,'Patience',63,28,'patience',0,'82434230-d26f-11ee-b8ee-d8bbc124b56a','bharathi','2024-02-23 17:18:06','bharathi','2024-02-23 17:18:06',1),(23,'Sql',29,25,'sql in python',0,'8415eae6-d274-11ee-b8ee-d8bbc124b56a','vijaya','2024-02-23 17:53:56','vijaya','2024-02-23 17:53:56',1),(24,'Html',29,25,'html in python',0,'841697d4-d274-11ee-b8ee-d8bbc124b56a','vennela','2024-02-23 17:53:56','vennela','2024-02-23 17:53:56',0),(25,'Html',30,25,'html in java',0,'8416a05b-d274-11ee-b8ee-d8bbc124b56a','srilakshmi','2024-02-23 17:53:56','srilakshmi','2024-02-23 17:53:56',1),(26,'Html',31,25,'html in mern',0,'8416a702-d274-11ee-b8ee-d8bbc124b56a','bharathi','2024-02-23 17:53:56','bharathi','2024-02-23 17:53:56',1),(27,'Javascript',29,25,'javascript in python',0,'8416af55-d274-11ee-b8ee-d8bbc124b56a','bharathi','2024-02-23 17:53:56','bharathi','2024-02-23 17:53:56',1),(28,'Javascript',30,25,'javascript in java',0,'8416b61a-d274-11ee-b8ee-d8bbc124b56a','bharathi','2024-02-23 17:53:56','bharathi','2024-02-23 17:53:56',1),(29,'Javascript',31,25,'javascript in mern',0,'8416bc81-d274-11ee-b8ee-d8bbc124b56a','bharathi','2024-02-23 17:53:56','bharathi','2024-02-23 17:53:56',1),(30,'WebFrameworks',29,25,'python fullstack',0,'8416c2f9-d274-11ee-b8ee-d8bbc124b56a','bharathi','2024-02-23 17:53:56','bharathi','2024-02-23 17:53:56',1),(31,'Python',29,25,'python fullstack',0,'8416c907-d274-11ee-b8ee-d8bbc124b56a','bharathi','2024-02-23 17:53:56','bharathi','2024-02-23 17:53:56',1),(32,'Bootstrap',30,25,'javafullstack',0,'8416cf3a-d274-11ee-b8ee-d8bbc124b56a','bharathi','2024-02-23 17:53:56','bharathi','2024-02-23 17:53:56',1),(33,'SpringBoot',30,25,'javafullstack',0,'8416d56f-d274-11ee-b8ee-d8bbc124b56a','bharathi','2024-02-23 17:53:56','bharathi','2024-02-23 17:53:56',1),(34,'Servlet',30,25,'javafullstack',0,'8416dc02-d274-11ee-b8ee-d8bbc124b56a','bharathi','2024-02-23 17:53:56','bharathi','2024-02-23 17:53:56',1),(35,'Hibernate and Spring',30,25,'javafullstack',0,'8416e2bb-d274-11ee-b8ee-d8bbc124b56a','bharathi','2024-02-23 17:53:56','bharathi','2024-02-23 17:53:56',1),(36,'Redux',31,25,'mernfullstack',0,'8416eade-d274-11ee-b8ee-d8bbc124b56a','bharathi','2024-02-23 17:53:56','bharathi','2024-02-23 17:53:56',1),(37,'Webpack',31,25,'mernfullsatck',0,'8416f1d1-d274-11ee-b8ee-d8bbc124b56a','bharathi','2024-02-23 17:53:56','bharathi','2024-02-23 17:53:56',1),(38,'Jdbc',30,25,'java',0,'b4b62e1f-d71b-11ee-9b0c-d8bbc124b56a','bharathi','2024-02-29 16:00:49','bharathi','2024-02-29 16:00:49',1),(39,'Angular',30,25,'angular in javafullstack',0,'e5757750-daba-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 06:37:54','bharathi','2024-03-05 06:37:54',1),(40,'DJango',29,25,'DJango in python fullstack',0,'6e01742a-dabb-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 06:41:43','bharathi','2024-03-05 06:41:43',1),(41,'Bootstrap',29,25,'Bootstrap in python fullstack',0,'8fb16913-dabb-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 06:42:39','bharathi','2024-03-05 06:42:39',1),(42,'Angular',29,25,'Angular in python fullstack',0,'707084a5-dabc-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 06:48:57','bharathi','2024-03-05 06:48:57',1),(43,'Bootstrap',31,25,'bootstrap in mern fullstack',0,'7070bca9-dabc-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 06:48:57','bharathi','2024-03-05 06:48:57',1),(44,'ReactJS',31,25,'React in mern fullstack',0,'7070c35d-dabc-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 06:48:57','bharathi','2024-03-05 06:48:57',1),(46,'Verbal Communication',55,26,'In HR',0,'0972dba8-db0d-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 16:25:53','bharathi','2024-03-05 16:25:53',1),(47,'Written Communication',55,26,'In Manager',0,'5af43889-db0d-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 16:28:10','bharathi','2024-03-05 16:28:10',1),(48,'Public Speaking',56,26,'In teamLead',0,'0c675478-db0e-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 16:33:07','bharathi','2024-03-05 16:33:07',1),(49,'Public Speaking',56,26,'In Manager',0,'0c675ff7-db0e-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 16:33:07','bharathi','2024-03-05 16:33:07',1),(50,'Visual Communication',56,26,'In teamlead',0,'8b42ede5-db0e-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 16:36:40','bharathi','2024-03-05 16:36:40',1),(51,'Visual Communication',56,26,'In Manager',0,'8b434af3-db0e-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 16:36:40','bharathi','2024-03-05 16:36:40',1),(52,'Analytical Thinking',57,26,'In HR',0,'8b43520e-db0e-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 16:36:40','bharathi','2024-03-05 16:36:40',1),(53,'Analytical Thinking',57,26,'In Manager',0,'8b4371b6-db0e-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 16:36:40','bharathi','2024-03-05 16:36:40',1),(54,'Analytical Thinking',57,26,'In Development',0,'f1a5b436-db0f-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 16:46:42','bharathi','2024-03-05 16:46:42',1),(55,'Visual Communication',56,26,'In Development',0,'6e0163f4-db10-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 16:50:10','bharathi','2024-03-05 16:50:10',1),(56,'Analytical Thinking',57,26,'in hr',0,'6c8cfc59-db12-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 17:04:27','bharathi','2024-03-05 17:04:27',1),(57,'Analytical Thinking',57,26,'in manager',0,'6c8d08d3-db12-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 17:04:27','bharathi','2024-03-05 17:04:27',1),(58,'Creativity',57,26,'In HR',0,'f2566b49-db12-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 17:08:11','bharathi','2024-03-05 17:08:11',1),(59,'Creativity',57,26,'In Manager',0,'f256852c-db12-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 17:08:11','bharathi','2024-03-05 17:08:11',1),(60,'Creativity',57,26,'In developer',0,'48a2aec0-db13-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-05 17:10:36','bharathi','2024-03-05 17:10:36',1),(61,'Critical Thinking',58,27,'In HR',0,'0c8d769a-db74-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-06 04:43:16','bharathi','2024-03-06 04:43:16',1),(62,'Data Analysis',58,27,'In TeamLead',0,'0c8d8a50-db74-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-06 04:43:16','bharathi','2024-03-06 04:43:16',1),(64,'Time Management',59,27,'In HR',0,'32938f15-db79-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-06 05:20:08','bharathi','2024-03-06 05:20:08',1),(66,'Planning and Organization',59,27,'In Manager',0,'32939c3c-db79-11ee-8f7e-d8bbc124b56a','bharathi','2024-03-06 05:20:08','bharathi','2024-03-06 05:20:08',1),(67,'Open-mindness',62,28,'open mindness class',0,'f546c0f6-dfb4-11ee-b694-54e1adde2cb1','bharathi','2024-03-11 14:37:59','bharathi','2024-03-11 14:37:59',1);
/*!40000 ALTER TABLE `skills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `timesheet_entry_system`
--

DROP TABLE IF EXISTS `timesheet_entry_system`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `timesheet_entry_system` (
  `reference_type_id` int NOT NULL AUTO_INCREMENT,
  `created_by` varchar(255) DEFAULT NULL,
  `created_on` datetime(6) DEFAULT NULL,
  `is_deleted` bit(1) DEFAULT NULL,
  `modified_by` varchar(255) DEFAULT NULL,
  `modified_on` datetime(6) DEFAULT NULL,
  `reference_type_name` varchar(255) DEFAULT NULL,
  `uuid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`reference_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timesheet_entry_system`
--

LOCK TABLES `timesheet_entry_system` WRITE;
/*!40000 ALTER TABLE `timesheet_entry_system` DISABLE KEYS */;
/*!40000 ALTER TABLE `timesheet_entry_system` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_details`
--

DROP TABLE IF EXISTS `user_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_details` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `user_emp_id` int DEFAULT NULL,
  `user_name` varchar(45) DEFAULT NULL,
  `user_password` varchar(45) DEFAULT NULL,
  `designation` varchar(45) DEFAULT NULL,
  `user_email` varchar(45) DEFAULT NULL,
  `employee_status` varchar(45) DEFAULT NULL,
  `is_internal` tinyint(1) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT NULL,
  `uuid` varchar(36) DEFAULT (uuid()),
  `created_by` varchar(45) DEFAULT NULL,
  `created_on` varchar(255) DEFAULT NULL,
  `modified_by` varchar(45) DEFAULT NULL,
  `modified_on` datetime(6) DEFAULT NULL,
  `flag` bit(1) DEFAULT NULL,
  `reset_token` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `user_emp_id_idx` (`user_emp_id`),
  CONSTRAINT `user_emp_id` FOREIGN KEY (`user_emp_id`) REFERENCES `employee` (`employee_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_details`
--

LOCK TABLES `user_details` WRITE;
/*!40000 ALTER TABLE `user_details` DISABLE KEYS */;
INSERT INTO `user_details` VALUES (1,105,'John','abc123','Software Engineer','john.doe@gmail.com',NULL,1,1,'76bf3640-cfb4-11ee-bb18-c8d9d2d85b69',NULL,NULL,NULL,NULL,_binary '',NULL),(2,106,'Jok Eod','abc1234','Manager','jok.eod@gmail.com',NULL,1,1,'e3b3b6e7-cfe6-11ee-bb18-c8d9d2d85b69',NULL,NULL,NULL,NULL,_binary '',NULL),(3,109,'Anisha','admin123','Admin','anisha@example.com',NULL,1,1,'e3b5ebd5-cfe6-11ee-bb18-c8d9d2d85b69',NULL,NULL,NULL,NULL,_binary '',NULL),(4,110,'Madhura','pmo123','PMO','madhura@example.com',NULL,1,1,'e3b62517-cfe6-11ee-bb18-c8d9d2d85b69',NULL,NULL,NULL,NULL,_binary '',NULL),(5,117,'Rakhi','rakhi123','Software Engineer','rakhi@gmail.com',NULL,1,1,'99b6857f-e1d4-11ee-a694-54e1adde2cb1',NULL,NULL,NULL,NULL,_binary '',NULL);
/*!40000 ALTER TABLE `user_details` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-03-20 15:13:05
