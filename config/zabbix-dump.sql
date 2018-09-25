-- MySQL dump 10.13  Distrib 5.6.40, for Linux (x86_64)
--
-- Host: localhost    Database: zabbix
-- ------------------------------------------------------
-- Server version	5.6.40

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
-- Table structure for table `acknowledges`
--

DROP TABLE IF EXISTS `acknowledges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acknowledges` (
  `acknowledgeid` bigint(20) unsigned NOT NULL,
  `userid` bigint(20) unsigned NOT NULL,
  `eventid` bigint(20) unsigned NOT NULL,
  `clock` int(11) NOT NULL DEFAULT '0',
  `message` varchar(255) NOT NULL DEFAULT '',
  `action` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`acknowledgeid`),
  KEY `acknowledges_1` (`userid`),
  KEY `acknowledges_2` (`eventid`),
  KEY `acknowledges_3` (`clock`),
  CONSTRAINT `c_acknowledges_1` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`) ON DELETE CASCADE,
  CONSTRAINT `c_acknowledges_2` FOREIGN KEY (`eventid`) REFERENCES `events` (`eventid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acknowledges`
--

LOCK TABLES `acknowledges` WRITE;
/*!40000 ALTER TABLE `acknowledges` DISABLE KEYS */;
INSERT INTO `acknowledges` VALUES (1,1,817,1534732303,'2131',0),(2,1,909,1536826899,'我知道了',0);
/*!40000 ALTER TABLE `acknowledges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `actions`
--

DROP TABLE IF EXISTS `actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `actions` (
  `actionid` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `eventsource` int(11) NOT NULL DEFAULT '0',
  `evaltype` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0',
  `esc_period` varchar(255) NOT NULL DEFAULT '1h',
  `def_shortdata` varchar(255) NOT NULL DEFAULT '',
  `def_longdata` text NOT NULL,
  `r_shortdata` varchar(255) NOT NULL DEFAULT '',
  `r_longdata` text NOT NULL,
  `formula` varchar(255) NOT NULL DEFAULT '',
  `maintenance_mode` int(11) NOT NULL DEFAULT '1',
  `ack_shortdata` varchar(255) NOT NULL DEFAULT '',
  `ack_longdata` text NOT NULL,
  PRIMARY KEY (`actionid`),
  UNIQUE KEY `actions_2` (`name`),
  KEY `actions_1` (`eventsource`,`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actions`
--

LOCK TABLES `actions` WRITE;
/*!40000 ALTER TABLE `actions` DISABLE KEYS */;
INSERT INTO `actions` VALUES (2,'Auto discovery. Linux servers.',1,0,1,'0','','','','','',1,'',''),(3,'Report problems to Zabbix administrators',0,0,1,'1h','Problem: {TRIGGER.NAME}','Problem started at {EVENT.TIME} on {EVENT.DATE}\r\nProblem name: {TRIGGER.NAME}\r\nHost: {HOST.NAME}\r\nSeverity: {TRIGGER.SEVERITY}\r\n\r\nOriginal problem ID: {EVENT.ID}\r\n{TRIGGER.URL}','Resolved: {TRIGGER.NAME}','Problem has been resolved at {EVENT.RECOVERY.TIME} on {EVENT.RECOVERY.DATE}\r\nProblem name: {TRIGGER.NAME}\r\nHost: {HOST.NAME}\r\nSeverity: {TRIGGER.SEVERITY}\r\n\r\nOriginal problem ID: {EVENT.ID}\r\n{TRIGGER.URL}','',1,'Acknowledged: {TRIGGER.NAME}','{USER.FULLNAME} acknowledged problem at {ACK.DATE} {ACK.TIME} with the following message:\r\n{ACK.MESSAGE}\r\n\r\nCurrent problem status is {EVENT.STATUS}'),(4,'Report not supported items',3,0,1,'1h','{ITEM.STATE}: {HOST.NAME}:{ITEM.NAME}','Host: {HOST.NAME}\r\nItem: {ITEM.NAME}\r\nKey: {ITEM.KEY}\r\nState: {ITEM.STATE}','{ITEM.STATE}: {HOST.NAME}:{ITEM.NAME}','Host: {HOST.NAME}\r\nItem: {ITEM.NAME}\r\nKey: {ITEM.KEY}\r\nState: {ITEM.STATE}','',1,'',''),(5,'Report not supported low level discovery rules',3,0,1,'1h','{LLDRULE.STATE}: {HOST.NAME}:{LLDRULE.NAME}','Host: {HOST.NAME}\r\nLow level discovery rule: {LLDRULE.NAME}\r\nKey: {LLDRULE.KEY}\r\nState: {LLDRULE.STATE}','{LLDRULE.STATE}: {HOST.NAME}:{LLDRULE.NAME}','Host: {HOST.NAME}\r\nLow level discovery rule: {LLDRULE.NAME}\r\nKey: {LLDRULE.KEY}\r\nState: {LLDRULE.STATE}','',1,'',''),(6,'Report unknown triggers',3,0,1,'1h','{TRIGGER.STATE}: {TRIGGER.NAME}','Trigger name: {TRIGGER.NAME}\r\nExpression: {TRIGGER.EXPRESSION}\r\nState: {TRIGGER.STATE}','{TRIGGER.STATE}: {TRIGGER.NAME}','Trigger name: {TRIGGER.NAME}\r\nExpression: {TRIGGER.EXPRESSION}\r\nState: {TRIGGER.STATE}','',1,'',''),(7,'用户锁定及发送邮件',0,0,0,'1h','Problem: {TRIGGER.NAME}','Problem started at {EVENT.TIME} on {EVENT.DATE}\r\nProblem name: {TRIGGER.NAME}\r\nHost: {HOST.NAME}\r\nSeverity: {TRIGGER.SEVERITY}\r\n\r\nOriginal problem ID: {EVENT.ID}\r\n{TRIGGER.URL}','Resolved: {TRIGGER.NAME}','Problem has been resolved at {EVENT.RECOVERY.TIME} on {EVENT.RECOVERY.DATE}\r\nProblem name: {TRIGGER.NAME}\r\nHost: {HOST.NAME}\r\nSeverity: {TRIGGER.SEVERITY}\r\n\r\nOriginal problem ID: {EVENT.ID}\r\n{TRIGGER.URL}','',1,'Acknowledged: {TRIGGER.NAME}','{USER.FULLNAME} acknowledged problem at {ACK.DATE} {ACK.TIME} with the following message:\r\n{ACK.MESSAGE}\r\n\r\nCurrent problem status is {EVENT.STATUS}'),(8,'Action Test',0,0,1,'1h','Problem: {TRIGGER.NAME}','Problem started at {EVENT.TIME} on {EVENT.DATE}\r\nProblem name: {TRIGGER.NAME}\r\nHost: {HOST.NAME}\r\nSeverity: {TRIGGER.SEVERITY}\r\n\r\nOriginal problem ID: {EVENT.ID}\r\n{TRIGGER.URL}','Resolved: {TRIGGER.NAME}','Problem has been resolved at {EVENT.RECOVERY.TIME} on {EVENT.RECOVERY.DATE}\r\nProblem name: {TRIGGER.NAME}\r\nHost: {HOST.NAME}\r\nSeverity: {TRIGGER.SEVERITY}\r\n\r\nOriginal problem ID: {EVENT.ID}\r\n{TRIGGER.URL}','',1,'Acknowledged: {TRIGGER.NAME}','{USER.FULLNAME} acknowledged problem at {ACK.DATE} {ACK.TIME} with the following message:\r\n{ACK.MESSAGE}\r\n\r\nCurrent problem status is {EVENT.STATUS}');
/*!40000 ALTER TABLE `actions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alerts`
--

DROP TABLE IF EXISTS `alerts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alerts` (
  `alertid` bigint(20) unsigned NOT NULL,
  `actionid` bigint(20) unsigned NOT NULL,
  `eventid` bigint(20) unsigned NOT NULL,
  `userid` bigint(20) unsigned DEFAULT NULL,
  `clock` int(11) NOT NULL DEFAULT '0',
  `mediatypeid` bigint(20) unsigned DEFAULT NULL,
  `sendto` varchar(100) NOT NULL DEFAULT '',
  `subject` varchar(255) NOT NULL DEFAULT '',
  `message` text NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `retries` int(11) NOT NULL DEFAULT '0',
  `error` varchar(2048) NOT NULL DEFAULT '',
  `esc_step` int(11) NOT NULL DEFAULT '0',
  `alerttype` int(11) NOT NULL DEFAULT '0',
  `p_eventid` bigint(20) unsigned DEFAULT NULL,
  `acknowledgeid` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`alertid`),
  KEY `alerts_1` (`actionid`),
  KEY `alerts_2` (`clock`),
  KEY `alerts_3` (`eventid`),
  KEY `alerts_4` (`status`),
  KEY `alerts_5` (`mediatypeid`),
  KEY `alerts_6` (`userid`),
  KEY `alerts_7` (`p_eventid`),
  KEY `c_alerts_6` (`acknowledgeid`),
  CONSTRAINT `c_alerts_1` FOREIGN KEY (`actionid`) REFERENCES `actions` (`actionid`) ON DELETE CASCADE,
  CONSTRAINT `c_alerts_2` FOREIGN KEY (`eventid`) REFERENCES `events` (`eventid`) ON DELETE CASCADE,
  CONSTRAINT `c_alerts_3` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`) ON DELETE CASCADE,
  CONSTRAINT `c_alerts_4` FOREIGN KEY (`mediatypeid`) REFERENCES `media_type` (`mediatypeid`) ON DELETE CASCADE,
  CONSTRAINT `c_alerts_5` FOREIGN KEY (`p_eventid`) REFERENCES `events` (`eventid`) ON DELETE CASCADE,
  CONSTRAINT `c_alerts_6` FOREIGN KEY (`acknowledgeid`) REFERENCES `acknowledges` (`acknowledgeid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alerts`
--

LOCK TABLES `alerts` WRITE;
/*!40000 ALTER TABLE `alerts` DISABLE KEYS */;
INSERT INTO `alerts` VALUES (1,8,631,NULL,1533200212,NULL,'','','portal:/usr/local/env/env2/bin/python2 /etc/zabbix/scripts/UserParameter/ActionTest.py',1,0,'',1,1,NULL,NULL),(2,8,645,NULL,1533200408,NULL,'','','portal:/usr/local/env/env2/bin/python2 /etc/zabbix/scripts/UserParameter/ActionTest.py',1,0,'',1,1,NULL,NULL),(3,8,640,NULL,1533200408,NULL,'','','portal:/usr/local/env/env2/bin/python2 /etc/zabbix/scripts/UserParameter/ActionTest.py',1,0,'',1,1,NULL,NULL),(4,8,661,NULL,1533218407,NULL,'','','portal:/usr/local/env/env2/bin/python2 /etc/zabbix/scripts/UserParameter/ActionTest.py',1,0,'',1,1,NULL,NULL),(5,8,663,NULL,1533250809,NULL,'','','portal:/usr/local/env/env2/bin/python2 /etc/zabbix/scripts/UserParameter/ActionTest.py',1,0,'',1,1,NULL,NULL),(6,8,666,NULL,1533267500,NULL,'','','server:/usr/local/env/env2/bin/python2 /etc/zabbix/scripts/UserParameter/ActionTest.py',1,0,'',1,1,NULL,NULL),(7,8,667,NULL,1533268809,NULL,'','','portal:/usr/local/env/env2/bin/python2 /etc/zabbix/scripts/UserParameter/ActionTest.py',1,0,'',1,1,NULL,NULL),(8,8,708,NULL,1533283208,NULL,'','','portal:/usr/local/env/env2/bin/python2 /etc/zabbix/scripts/UserParameter/ActionTest.py',1,0,'',1,1,NULL,NULL),(9,8,710,NULL,1533308408,NULL,'','','portal:/usr/local/env/env2/bin/python2 /etc/zabbix/scripts/UserParameter/ActionTest.py',1,0,'',1,1,NULL,NULL),(10,8,712,NULL,1533340808,NULL,'','','portal:/usr/local/env/env2/bin/python2 /etc/zabbix/scripts/UserParameter/ActionTest.py',1,0,'',1,1,NULL,NULL),(11,8,714,NULL,1533369609,NULL,'','','portal:/usr/local/env/env2/bin/python2 /etc/zabbix/scripts/UserParameter/ActionTest.py',1,0,'',1,1,NULL,NULL),(12,8,716,NULL,1533402006,NULL,'','','portal:/usr/local/env/env2/bin/python2 /etc/zabbix/scripts/UserParameter/ActionTest.py',1,0,'',1,1,NULL,NULL),(13,8,718,NULL,1533430807,NULL,'','','portal:/usr/local/env/env2/bin/python2 /etc/zabbix/scripts/UserParameter/ActionTest.py',1,0,'',1,1,NULL,NULL),(14,8,720,NULL,1533459607,NULL,'','','portal:/usr/local/env/env2/bin/python2 /etc/zabbix/scripts/UserParameter/ActionTest.py',1,0,'',1,1,NULL,NULL),(15,8,722,NULL,1533488406,NULL,'','','portal:/usr/local/env/env2/bin/python2 /etc/zabbix/scripts/UserParameter/ActionTest.py',1,0,'',1,1,NULL,NULL),(16,8,724,NULL,1533517209,NULL,'','','portal:/usr/local/env/env2/bin/python2 /etc/zabbix/scripts/UserParameter/ActionTest.py',1,0,'',1,1,NULL,NULL),(17,8,726,NULL,1533538807,NULL,'','','portal:/usr/local/env/env2/bin/python2 /etc/zabbix/scripts/UserParameter/ActionTest.py',1,0,'',1,1,NULL,NULL),(18,8,728,NULL,1533564009,NULL,'','','portal:/usr/local/env/env2/bin/python2 /etc/zabbix/scripts/UserParameter/ActionTest.py',1,0,'',1,1,NULL,NULL),(19,8,730,NULL,1533596408,NULL,'','','portal:/usr/local/env/env2/bin/python2 /etc/zabbix/scripts/UserParameter/ActionTest.py',1,0,'',1,1,NULL,NULL),(20,8,732,NULL,1533621608,NULL,'','','portal:/usr/local/env/env2/bin/python2 /etc/zabbix/scripts/UserParameter/ActionTest.py',1,0,'',1,1,NULL,NULL),(21,8,734,NULL,1533679206,NULL,'','','portal:/usr/local/env/env2/bin/python2 /etc/zabbix/scripts/UserParameter/ActionTest.py',1,0,'',1,1,NULL,NULL),(22,8,736,NULL,1533718810,NULL,'','','portal:/usr/local/env/env2/bin/python2 /etc/zabbix/scripts/UserParameter/ActionTest.py',1,0,'',1,1,NULL,NULL),(23,8,738,NULL,1533776409,NULL,'','','portal:/usr/local/env/env2/bin/python2 /etc/zabbix/scripts/UserParameter/ActionTest.py',1,0,'',1,1,NULL,NULL),(24,8,740,NULL,1533805207,NULL,'','','portal:/usr/local/env/env2/bin/python2 /etc/zabbix/scripts/UserParameter/ActionTest.py',1,0,'',1,1,NULL,NULL),(25,8,742,NULL,1533830407,NULL,'','','portal:/usr/local/env/env2/bin/python2 /etc/zabbix/scripts/UserParameter/ActionTest.py',1,0,'',1,1,NULL,NULL),(26,8,744,NULL,1533859209,NULL,'','','portal:/usr/local/env/env2/bin/python2 /etc/zabbix/scripts/UserParameter/ActionTest.py',1,0,'',1,1,NULL,NULL),(27,8,746,NULL,1533884408,NULL,'','','portal:/usr/local/env/env2/bin/python2 /etc/zabbix/scripts/UserParameter/ActionTest.py',1,0,'',1,1,NULL,NULL),(28,8,748,NULL,1533913207,NULL,'','','portal:/usr/local/env/env2/bin/python2 /etc/zabbix/scripts/UserParameter/ActionTest.py',1,0,'',1,1,NULL,NULL),(29,8,750,NULL,1533942008,NULL,'','','portal:/usr/local/env/env2/bin/python2 /etc/zabbix/scripts/UserParameter/ActionTest.py',1,0,'',1,1,NULL,NULL),(30,8,752,NULL,1533970809,NULL,'','','portal:/usr/local/env/env2/bin/python2 /etc/zabbix/scripts/UserParameter/ActionTest.py',1,0,'',1,1,NULL,NULL),(31,8,754,NULL,1533996007,NULL,'','','portal:/usr/local/env/env2/bin/python2 /etc/zabbix/scripts/UserParameter/ActionTest.py',1,0,'',1,1,NULL,NULL),(32,8,756,NULL,1534024807,NULL,'','','portal:/usr/local/env/env2/bin/python2 /etc/zabbix/scripts/UserParameter/ActionTest.py',1,0,'',1,1,NULL,NULL),(33,8,758,NULL,1534050009,NULL,'','','portal:/usr/local/env/env2/bin/python2 /etc/zabbix/scripts/UserParameter/ActionTest.py',1,0,'',1,1,NULL,NULL),(34,8,760,NULL,1534075209,NULL,'','','portal:/usr/local/env/env2/bin/python2 /etc/zabbix/scripts/UserParameter/ActionTest.py',1,0,'',1,1,NULL,NULL),(35,8,762,NULL,1534100408,NULL,'','','portal:/usr/local/env/env2/bin/python2 /etc/zabbix/scripts/UserParameter/ActionTest.py',1,0,'',1,1,NULL,NULL),(36,8,764,NULL,1534125607,NULL,'','','portal:/usr/local/env/env2/bin/python2 /etc/zabbix/scripts/UserParameter/ActionTest.py',1,0,'',1,1,NULL,NULL),(37,8,766,NULL,1534143607,NULL,'','','portal:/usr/local/env/env2/bin/python2 /etc/zabbix/scripts/UserParameter/ActionTest.py',1,0,'',1,1,NULL,NULL),(38,8,768,NULL,1534158006,NULL,'','','portal:/usr/local/env/env2/bin/python2 /etc/zabbix/scripts/UserParameter/ActionTest.py',1,0,'',1,1,NULL,NULL),(39,8,770,NULL,1534186807,NULL,'','','portal:/usr/local/env/env2/bin/python2 /etc/zabbix/scripts/UserParameter/ActionTest.py',1,0,'',1,1,NULL,NULL),(40,8,772,NULL,1534215607,NULL,'','','portal:/usr/local/env/env2/bin/python2 /etc/zabbix/scripts/UserParameter/ActionTest.py',1,0,'',1,1,NULL,NULL),(41,8,774,NULL,1534237209,NULL,'','','portal:/usr/local/env/env2/bin/python2 /etc/zabbix/scripts/UserParameter/ActionTest.py',1,0,'',1,1,NULL,NULL),(42,8,776,NULL,1534266006,NULL,'','','portal:/usr/local/env/env2/bin/python2 /etc/zabbix/scripts/UserParameter/ActionTest.py',1,0,'',1,1,NULL,NULL),(43,8,778,NULL,1534298410,NULL,'','','portal:/usr/local/env/env2/bin/python2 /etc/zabbix/scripts/UserParameter/ActionTest.py',1,0,'',1,1,NULL,NULL),(44,8,780,NULL,1534323610,NULL,'','','portal:/usr/local/env/env2/bin/python2 /etc/zabbix/scripts/UserParameter/ActionTest.py',1,0,'',1,1,NULL,NULL),(45,8,782,NULL,1534348808,NULL,'','','portal:/usr/local/env/env2/bin/python2 /etc/zabbix/scripts/UserParameter/ActionTest.py',1,0,'',1,1,NULL,NULL),(46,8,784,NULL,1534381208,NULL,'','','portal:/usr/local/env/env2/bin/python2 /etc/zabbix/scripts/UserParameter/ActionTest.py',1,0,'',1,1,NULL,NULL),(47,8,787,NULL,1534387329,NULL,'','','portal:/usr/local/env/env2/bin/python2 /etc/zabbix/scripts/UserParameter/ActionTest.py',1,0,'',1,1,NULL,NULL),(48,8,789,NULL,1534388409,NULL,'','','portal:/usr/local/env/env2/bin/python2 /etc/zabbix/scripts/UserParameter/ActionTest.py',1,0,'',1,1,NULL,NULL),(49,8,791,NULL,1534431607,NULL,'','','portal:/usr/local/env/env2/bin/python2 /etc/zabbix/scripts/UserParameter/ActionTest.py',1,0,'',1,1,NULL,NULL),(50,8,793,NULL,1534464007,NULL,'','','portal:/usr/local/env/env2/bin/python2 /etc/zabbix/scripts/UserParameter/ActionTest.py',1,0,'',1,1,NULL,NULL),(51,8,799,NULL,1534489208,NULL,'','','portal:/usr/local/env/env2/bin/python2 /etc/zabbix/scripts/UserParameter/ActionTest.py',1,0,'',1,1,NULL,NULL),(52,8,801,NULL,1534507207,NULL,'','','portal:/usr/local/env/env2/bin/python2 /etc/zabbix/scripts/UserParameter/ActionTest.py',1,0,'',1,1,NULL,NULL),(53,8,803,NULL,1534536008,NULL,'','','portal:/usr/local/env/env2/bin/python2 /etc/zabbix/scripts/UserParameter/ActionTest.py',1,0,'',1,1,NULL,NULL),(54,8,805,NULL,1534568408,NULL,'','','portal:/usr/local/env/env2/bin/python2 /etc/zabbix/scripts/UserParameter/ActionTest.py',1,0,'',1,1,NULL,NULL),(55,8,807,NULL,1534597206,NULL,'','','portal:/usr/local/env/env2/bin/python2 /etc/zabbix/scripts/UserParameter/ActionTest.py',1,0,'',1,1,NULL,NULL),(56,8,809,NULL,1534626007,NULL,'','','portal:/usr/local/env/env2/bin/python2 /etc/zabbix/scripts/UserParameter/ActionTest.py',1,0,'',1,1,NULL,NULL),(57,8,811,NULL,1534654810,NULL,'','','portal:/usr/local/env/env2/bin/python2 /etc/zabbix/scripts/UserParameter/ActionTest.py',1,0,'',1,1,NULL,NULL),(58,8,813,NULL,1534683607,NULL,'','','portal:/usr/local/env/env2/bin/python2 /etc/zabbix/scripts/UserParameter/ActionTest.py',1,0,'',1,1,NULL,NULL),(59,8,815,NULL,1534712407,NULL,'','','portal:/usr/local/env/env2/bin/python2 /etc/zabbix/scripts/UserParameter/ActionTest.py',1,0,'',1,1,NULL,NULL),(60,8,817,NULL,1534731593,NULL,'','','portal:/usr/local/env/env2/bin/python2 /etc/zabbix/scripts/UserParameter/ActionTest.py',1,0,'',1,1,NULL,NULL),(61,8,819,NULL,1534734008,NULL,'','','portal:/usr/local/env/env2/bin/python2 /etc/zabbix/scripts/UserParameter/ActionTest.py',1,0,'',1,1,NULL,NULL),(62,8,820,NULL,1534734830,NULL,'','','portal:/usr/local/env/env2/bin/python2 /etc/zabbix/scripts/UserParameter/ActionTest.py',1,0,'',1,1,NULL,NULL),(63,8,822,NULL,1534752008,NULL,'','','portal:/usr/local/env/env2/bin/python2 /etc/zabbix/scripts/UserParameter/ActionTest.py',1,0,'',1,1,NULL,NULL),(64,8,833,NULL,1534766407,NULL,'','','portal:/usr/local/env/env2/bin/python2 /etc/zabbix/scripts/UserParameter/ActionTest.py',1,0,'',1,1,NULL,NULL),(65,8,835,NULL,1534795208,NULL,'','','portal:/usr/local/env/env2/bin/python2 /etc/zabbix/scripts/UserParameter/ActionTest.py',1,0,'',1,1,NULL,NULL),(66,8,837,NULL,1534820408,NULL,'','','portal:/usr/local/env/env2/bin/python2 /etc/zabbix/scripts/UserParameter/ActionTest.py',1,0,'',1,1,NULL,NULL),(67,8,839,NULL,1534824009,NULL,'','','portal:/usr/local/env/env2/bin/python2 /etc/zabbix/scripts/UserParameter/ActionTest.py',1,0,'',1,1,NULL,NULL),(68,8,852,NULL,1535606818,NULL,'','','Zabbix server:/usr/local/env/env2/bin/python2 /etc/zabbix/scripts/UserParameter/ActionTest.py',1,0,'',1,1,NULL,NULL),(69,8,864,NULL,1536044579,NULL,'','','Zabbix server:/usr/local/env/env2/bin/python2 /etc/zabbix/scripts/UserParameter/ActionTest.py',1,0,'',1,1,NULL,NULL),(70,8,866,NULL,1536054262,NULL,'','','server:/usr/local/env/env2/bin/python2 /etc/zabbix/scripts/UserParameter/ActionTest.py',1,0,'',1,1,NULL,NULL),(71,8,869,NULL,1536125877,NULL,'','','Zabbix server:/usr/local/env/env2/bin/python2 /etc/zabbix/scripts/UserParameter/ActionTest.py',1,0,'',1,1,NULL,NULL),(72,8,870,NULL,1536125901,NULL,'','','server:/usr/local/env/env2/bin/python2 /etc/zabbix/scripts/UserParameter/ActionTest.py',1,0,'',1,1,NULL,NULL),(73,8,873,NULL,1536142160,NULL,'','','server:/usr/local/env/env2/bin/python2 /etc/zabbix/scripts/UserParameter/ActionTest.py',1,0,'',1,1,NULL,NULL),(74,8,874,NULL,1536142196,NULL,'','','Zabbix server:/usr/local/env/env2/bin/python2 /etc/zabbix/scripts/UserParameter/ActionTest.py',1,0,'',1,1,NULL,NULL),(75,8,875,NULL,1536144890,NULL,'','','Zabbix server:/usr/local/env/env2/bin/python2 /etc/zabbix/scripts/UserParameter/ActionTest.py',1,0,'',1,1,NULL,NULL),(76,8,876,NULL,1536144914,NULL,'','','server:/usr/local/env/env2/bin/python2 /etc/zabbix/scripts/UserParameter/ActionTest.py',1,0,'',1,1,NULL,NULL),(77,8,879,NULL,1536145250,NULL,'','','Zabbix server:/usr/local/env/env2/bin/python2 /etc/zabbix/scripts/UserParameter/ActionTest.py',1,0,'',1,1,NULL,NULL),(78,8,880,NULL,1536145271,NULL,'','','server:/usr/local/env/env2/bin/python2 /etc/zabbix/scripts/UserParameter/ActionTest.py',1,0,'',1,1,NULL,NULL),(79,8,882,NULL,1536145370,NULL,'','','Zabbix server:/usr/local/env/env2/bin/python2 /etc/zabbix/scripts/UserParameter/ActionTest.py',1,0,'',1,1,NULL,NULL),(80,8,885,NULL,1536201013,NULL,'','','server:/usr/local/env/env2/bin/python2 /etc/zabbix/scripts/UserParameter/ActionTest.py',1,0,'',1,1,NULL,NULL),(81,8,886,NULL,1536201022,NULL,'','','server:/usr/local/env/env2/bin/python2 /etc/zabbix/scripts/UserParameter/ActionTest.py',1,0,'',1,1,NULL,NULL),(82,8,888,NULL,1536201493,NULL,'','','server:/usr/local/env/env2/bin/python2 /etc/zabbix/scripts/UserParameter/ActionTest.py',1,0,'',1,1,NULL,NULL),(83,8,892,NULL,1536202403,NULL,'','','server:/usr/local/env/env2/bin/python2 /etc/zabbix/scripts/UserParameter/ActionTest.py',1,0,'',1,1,NULL,NULL),(84,8,894,NULL,1536202978,NULL,'','','Zabbix server:/usr/local/env/env2/bin/python2 /etc/zabbix/scripts/UserParameter/ActionTest.py',1,0,'',1,1,NULL,NULL),(85,8,897,NULL,1536203278,NULL,'','','Zabbix server:/usr/local/env/env2/bin/python2 /etc/zabbix/scripts/UserParameter/ActionTest.py',1,0,'',1,1,NULL,NULL),(86,8,898,NULL,1536203299,NULL,'','','server:/usr/local/env/env2/bin/python2 /etc/zabbix/scripts/UserParameter/ActionTest.py',1,0,'',1,1,NULL,NULL),(87,8,909,NULL,1536746361,NULL,'','','data-handler:/usr/local/env/env2/bin/python2 /etc/zabbix/scripts/UserParameter/ActionTest.py',2,0,'Remote commands are not enabled.',1,1,NULL,NULL),(88,8,926,NULL,1536822102,NULL,'','','data-handler:/usr/local/env/env2/bin/python2 /etc/zabbix/scripts/UserParameter/ActionTest.py',2,0,'Remote commands are not enabled.',1,1,NULL,NULL),(89,8,928,NULL,1536822624,NULL,'','','portal:/usr/local/env/env2/bin/python2 /etc/zabbix/scripts/UserParameter/ActionTest.py',1,0,'',1,1,NULL,NULL),(90,8,929,NULL,1536822639,NULL,'','','portal:/usr/local/env/env2/bin/python2 /etc/zabbix/scripts/UserParameter/ActionTest.py',1,0,'',1,1,NULL,NULL);
/*!40000 ALTER TABLE `alerts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `application_discovery`
--

DROP TABLE IF EXISTS `application_discovery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `application_discovery` (
  `application_discoveryid` bigint(20) unsigned NOT NULL,
  `applicationid` bigint(20) unsigned NOT NULL,
  `application_prototypeid` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `lastcheck` int(11) NOT NULL DEFAULT '0',
  `ts_delete` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`application_discoveryid`),
  KEY `application_discovery_1` (`applicationid`),
  KEY `application_discovery_2` (`application_prototypeid`),
  CONSTRAINT `c_application_discovery_1` FOREIGN KEY (`applicationid`) REFERENCES `applications` (`applicationid`) ON DELETE CASCADE,
  CONSTRAINT `c_application_discovery_2` FOREIGN KEY (`application_prototypeid`) REFERENCES `application_prototype` (`application_prototypeid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `application_discovery`
--

LOCK TABLES `application_discovery` WRITE;
/*!40000 ALTER TABLE `application_discovery` DISABLE KEYS */;
/*!40000 ALTER TABLE `application_discovery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `application_prototype`
--

DROP TABLE IF EXISTS `application_prototype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `application_prototype` (
  `application_prototypeid` bigint(20) unsigned NOT NULL,
  `itemid` bigint(20) unsigned NOT NULL,
  `templateid` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`application_prototypeid`),
  KEY `application_prototype_1` (`itemid`),
  KEY `application_prototype_2` (`templateid`),
  CONSTRAINT `c_application_prototype_1` FOREIGN KEY (`itemid`) REFERENCES `items` (`itemid`) ON DELETE CASCADE,
  CONSTRAINT `c_application_prototype_2` FOREIGN KEY (`templateid`) REFERENCES `application_prototype` (`application_prototypeid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `application_prototype`
--

LOCK TABLES `application_prototype` WRITE;
/*!40000 ALTER TABLE `application_prototype` DISABLE KEYS */;
INSERT INTO `application_prototype` VALUES (1,23665,NULL,'Startup {#SERVICE.STARTUPNAME} services');
/*!40000 ALTER TABLE `application_prototype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `application_template`
--

DROP TABLE IF EXISTS `application_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `application_template` (
  `application_templateid` bigint(20) unsigned NOT NULL,
  `applicationid` bigint(20) unsigned NOT NULL,
  `templateid` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`application_templateid`),
  UNIQUE KEY `application_template_1` (`applicationid`,`templateid`),
  KEY `application_template_2` (`templateid`),
  CONSTRAINT `c_application_template_1` FOREIGN KEY (`applicationid`) REFERENCES `applications` (`applicationid`) ON DELETE CASCADE,
  CONSTRAINT `c_application_template_2` FOREIGN KEY (`templateid`) REFERENCES `applications` (`applicationid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `application_template`
--

LOCK TABLES `application_template` WRITE;
/*!40000 ALTER TABLE `application_template` DISABLE KEYS */;
INSERT INTO `application_template` VALUES (1,207,206),(12,252,206),(13,262,206),(14,272,206),(15,282,206),(16,292,206),(17,302,206),(18,329,206),(19,345,179),(20,346,13),(21,347,5),(22,348,21),(23,349,15),(24,350,7),(25,351,1),(26,352,17),(27,353,9),(28,354,23),(29,355,207),(165,797,780),(166,799,780),(168,803,771),(167,803,784),(169,804,800),(170,805,799),(171,811,784),(172,812,800),(173,813,799),(174,820,784),(175,821,800),(176,822,799),(177,823,784),(178,824,800),(179,825,799),(180,836,826),(181,837,827),(182,838,826),(183,839,827),(185,840,771),(184,840,784),(186,841,800),(187,842,799),(191,846,800),(192,847,799),(193,856,848),(194,857,849),(195,858,852),(196,859,853),(197,860,854),(198,861,855),(205,868,848),(206,869,851),(207,870,852),(208,871,853),(209,872,854),(210,873,855),(212,874,771),(211,874,784),(213,875,800),(214,876,799),(215,883,784),(216,884,800),(217,885,799),(219,892,771),(218,892,784),(220,893,800),(221,894,799),(223,901,771),(222,901,784),(224,902,800),(225,903,799),(227,910,770),(226,910,781),(228,911,798),(229,912,797),(231,913,771),(230,913,782),(232,914,800),(233,915,799),(235,916,771),(234,916,784),(236,917,800),(237,918,799),(244,934,771),(243,934,784),(245,935,800),(246,936,799),(247,942,784),(248,943,800),(249,944,799),(251,949,771),(250,949,784),(252,950,800),(253,951,799),(263,969,784),(264,970,800),(265,971,799),(266,977,784),(267,978,800),(268,979,799),(270,986,771),(269,986,784),(271,987,800),(272,988,799),(273,992,782),(274,993,800),(275,994,799),(276,998,781),(277,999,798),(278,1000,797),(279,1014,779),(280,1015,776),(281,1016,777),(282,1017,778),(284,1018,771),(283,1018,784),(285,1019,800),(286,1020,799),(287,1021,779),(288,1022,776),(289,1023,777),(290,1024,778),(291,1025,786),(292,1026,800),(293,1027,799),(295,1028,771),(294,1028,784),(296,1029,800),(297,1030,799),(298,1037,779),(299,1038,776),(300,1039,777),(301,1040,778),(302,1041,784),(303,1042,800),(304,1043,799),(305,1048,852),(306,1049,855),(307,1050,854),(308,1051,853),(309,1052,848),(310,1053,784),(311,1054,800),(312,1055,799),(313,1057,1056),(352,1096,740);
/*!40000 ALTER TABLE `application_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `applications`
--

DROP TABLE IF EXISTS `applications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `applications` (
  `applicationid` bigint(20) unsigned NOT NULL,
  `hostid` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `flags` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`applicationid`),
  UNIQUE KEY `applications_2` (`hostid`,`name`),
  CONSTRAINT `c_applications_1` FOREIGN KEY (`hostid`) REFERENCES `hosts` (`hostid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `applications`
--

LOCK TABLES `applications` WRITE;
/*!40000 ALTER TABLE `applications` DISABLE KEYS */;
INSERT INTO `applications` VALUES (1,10001,'OS',0),(5,10001,'Filesystems',0),(7,10001,'Network interfaces',0),(9,10001,'Processes',0),(13,10001,'CPU',0),(15,10001,'Memory',0),(17,10001,'Performance',0),(21,10001,'General',0),(23,10001,'Security',0),(179,10047,'Zabbix server',0),(206,10050,'Zabbix agent',0),(207,10001,'Zabbix agent',0),(252,10074,'Zabbix agent',0),(253,10074,'CPU',0),(254,10074,'Filesystems',0),(255,10074,'General',0),(256,10074,'Memory',0),(257,10074,'Network interfaces',0),(258,10074,'OS',0),(259,10074,'Performance',0),(260,10074,'Processes',0),(261,10074,'Security',0),(262,10075,'Zabbix agent',0),(263,10075,'CPU',0),(264,10075,'Filesystems',0),(265,10075,'General',0),(266,10075,'Memory',0),(267,10075,'Network interfaces',0),(268,10075,'OS',0),(269,10075,'Performance',0),(270,10075,'Processes',0),(271,10075,'Security',0),(272,10076,'Zabbix agent',0),(273,10076,'CPU',0),(274,10076,'Filesystems',0),(275,10076,'General',0),(276,10076,'Memory',0),(277,10076,'Network interfaces',0),(278,10076,'OS',0),(279,10076,'Performance',0),(280,10076,'Processes',0),(281,10076,'Security',0),(282,10077,'Zabbix agent',0),(283,10077,'CPU',0),(284,10077,'Filesystems',0),(285,10077,'General',0),(286,10077,'Memory',0),(287,10077,'Network interfaces',0),(288,10077,'OS',0),(289,10077,'Performance',0),(290,10077,'Processes',0),(291,10077,'Security',0),(292,10078,'Zabbix agent',0),(293,10078,'CPU',0),(294,10078,'Filesystems',0),(295,10078,'General',0),(296,10078,'Memory',0),(297,10078,'Network interfaces',0),(298,10078,'OS',0),(299,10078,'Performance',0),(300,10078,'Processes',0),(301,10078,'Security',0),(302,10079,'Zabbix agent',0),(303,10079,'CPU',0),(304,10079,'Filesystems',0),(305,10079,'General',0),(306,10079,'Memory',0),(307,10079,'Network interfaces',0),(308,10079,'OS',0),(309,10079,'Performance',0),(310,10079,'Processes',0),(311,10079,'Security',0),(319,10081,'General',0),(320,10081,'Performance',0),(321,10081,'Services',0),(322,10081,'Filesystems',0),(323,10081,'OS',0),(324,10081,'Processes',0),(325,10081,'CPU',0),(328,10081,'Memory',0),(329,10081,'Zabbix agent',0),(330,10081,'Network interfaces',0),(331,10076,'Logical partitions',0),(345,10084,'Zabbix server',0),(346,10084,'CPU',0),(347,10084,'Filesystems',0),(348,10084,'General',0),(349,10084,'Memory',0),(350,10084,'Network interfaces',0),(351,10084,'OS',0),(352,10084,'Performance',0),(353,10084,'Processes',0),(354,10084,'Security',0),(355,10084,'Zabbix agent',0),(356,10048,'Zabbix proxy',0),(446,10093,'FTP service',0),(447,10094,'HTTP service',0),(448,10095,'HTTPS service',0),(449,10096,'IMAP service',0),(450,10097,'LDAP service',0),(451,10098,'NNTP service',0),(452,10099,'NTP service',0),(453,10100,'POP service',0),(454,10101,'SMTP service',0),(455,10102,'SSH service',0),(456,10103,'Telnet service',0),(727,10168,'http-8080',0),(728,10168,'http-8443',0),(729,10168,'jk-8009',0),(730,10168,'Sessions',0),(731,10168,'Tomcat',0),(732,10169,'Classes',0),(733,10169,'Compilation',0),(734,10169,'Garbage Collector',0),(735,10169,'Memory',0),(736,10169,'Memory Pool',0),(737,10169,'Operating System',0),(738,10169,'Runtime',0),(739,10169,'Threads',0),(740,10170,'MySQL',0),(741,10171,'Fans',0),(742,10171,'Temperature',0),(743,10171,'Voltage',0),(744,10172,'Fans',0),(745,10172,'Temperature',0),(746,10172,'Voltage',0),(747,10173,'Clusters',0),(748,10173,'General',0),(749,10173,'Log',0),(750,10174,'CPU',0),(751,10174,'Disks',0),(752,10174,'Filesystems',0),(753,10174,'General',0),(754,10174,'Interfaces',0),(755,10174,'Memory',0),(756,10174,'Network',0),(757,10174,'Storage',0),(758,10175,'CPU',0),(759,10175,'Datastore',0),(760,10175,'General',0),(761,10175,'Hardware',0),(762,10175,'Memory',0),(763,10175,'Network',0),(770,10182,'Network Interfaces',0),(771,10183,'Network Interfaces',0),(772,10184,'Internal Items',0),(773,10184,'Memory',0),(774,10184,'Storage',0),(775,10184,'CPU',0),(776,10185,'Internal Items',0),(777,10185,'Memory',0),(778,10185,'Storage',0),(779,10185,'CPU',0),(780,10186,'Status',0),(781,10187,'Network Interfaces',0),(782,10188,'Network Interfaces',0),(783,10189,'Network Interfaces',0),(784,10190,'Network Interfaces',0),(786,10192,'Network Interfaces',0),(797,10203,'Status',0),(798,10203,'General',0),(799,10204,'Status',0),(800,10204,'General',0),(803,10207,'Network Interfaces',0),(804,10207,'General',0),(805,10207,'Status',0),(806,10207,'CPU',0),(807,10207,'Memory',0),(808,10207,'Temperature',0),(809,10207,'Fans',0),(810,10207,'Inventory',0),(811,10208,'Network Interfaces',0),(812,10208,'General',0),(813,10208,'Status',0),(814,10208,'CPU',0),(815,10208,'Memory',0),(816,10208,'Temperature',0),(817,10208,'Power Supply',0),(818,10208,'Fans',0),(819,10208,'Inventory',0),(820,10210,'Network Interfaces',0),(821,10210,'General',0),(822,10210,'Status',0),(823,10211,'Network Interfaces',0),(824,10211,'General',0),(825,10211,'Status',0),(826,10209,'CPU',0),(827,10209,'Memory',0),(828,10210,'Temperature',0),(829,10210,'Power Supply',0),(830,10210,'Fans',0),(831,10210,'Inventory',0),(832,10211,'Temperature',0),(833,10211,'Power Supply',0),(834,10211,'Fans',0),(835,10211,'Inventory',0),(836,10210,'CPU',0),(837,10210,'Memory',0),(838,10211,'CPU',0),(839,10211,'Memory',0),(840,10218,'Network Interfaces',0),(841,10218,'General',0),(842,10218,'Status',0),(846,10220,'General',0),(847,10220,'Status',0),(848,10212,'Memory',0),(849,10213,'CPU',0),(851,10215,'CPU',0),(852,10216,'Inventory',0),(853,10217,'Temperature',0),(854,10217,'Power Supply',0),(855,10217,'Fans',0),(856,10218,'Memory',0),(857,10218,'CPU',0),(858,10218,'Inventory',0),(859,10218,'Temperature',0),(860,10218,'Power Supply',0),(861,10218,'Fans',0),(868,10220,'Memory',0),(869,10220,'CPU',0),(870,10220,'Inventory',0),(871,10220,'Temperature',0),(872,10220,'Power Supply',0),(873,10220,'Fans',0),(874,10221,'Network Interfaces',0),(875,10221,'General',0),(876,10221,'Status',0),(877,10221,'CPU',0),(878,10221,'Memory',0),(879,10221,'Temperature',0),(880,10221,'Power Supply',0),(881,10221,'Fans',0),(882,10221,'Inventory',0),(883,10222,'Network Interfaces',0),(884,10222,'General',0),(885,10222,'Status',0),(886,10222,'CPU',0),(887,10222,'Memory',0),(888,10222,'Temperature',0),(889,10222,'Fans',0),(890,10222,'Power Supply',0),(891,10222,'Inventory',0),(892,10223,'Network Interfaces',0),(893,10223,'General',0),(894,10223,'Status',0),(895,10223,'CPU',0),(896,10223,'Memory',0),(897,10223,'Temperature',0),(898,10223,'Fans',0),(899,10223,'Power Supply',0),(900,10223,'Inventory',0),(901,10224,'Network Interfaces',0),(902,10224,'General',0),(903,10224,'Status',0),(904,10224,'CPU',0),(905,10224,'Memory',0),(906,10224,'Temperature',0),(907,10224,'Power Supply',0),(908,10224,'Fans',0),(909,10224,'Inventory',0),(910,10225,'Network Interfaces',0),(911,10225,'General',0),(912,10225,'Status',0),(913,10226,'Network Interfaces',0),(914,10226,'General',0),(915,10226,'Status',0),(916,10227,'Network Interfaces',0),(917,10227,'General',0),(918,10227,'Status',0),(919,10227,'CPU',0),(920,10227,'Memory',0),(921,10227,'Temperature',0),(922,10227,'Fans',0),(923,10227,'Power Supply',0),(924,10227,'Inventory',0),(934,10229,'Network Interfaces',0),(935,10229,'General',0),(936,10229,'Status',0),(937,10229,'CPU',0),(938,10229,'Memory',0),(939,10229,'Temperature',0),(940,10229,'Fans',0),(941,10229,'Inventory',0),(942,10230,'Network Interfaces',0),(943,10230,'General',0),(944,10230,'Status',0),(945,10230,'Temperature',0),(946,10230,'Power Supply',0),(947,10230,'Fans',0),(948,10230,'Inventory',0),(949,10231,'Network Interfaces',0),(950,10231,'General',0),(951,10231,'Status',0),(952,10231,'CPU',0),(953,10231,'Memory',0),(954,10231,'Temperature',0),(955,10231,'Power Supply',0),(956,10231,'Fans',0),(957,10231,'Inventory',0),(969,10233,'Network Interfaces',0),(970,10233,'General',0),(971,10233,'Status',0),(972,10233,'CPU',0),(973,10233,'Memory',0),(974,10233,'Temperature',0),(975,10233,'Storage',0),(976,10233,'Inventory',0),(977,10234,'Network Interfaces',0),(978,10234,'General',0),(979,10234,'Status',0),(980,10234,'CPU',0),(981,10234,'Memory',0),(982,10234,'Temperature',0),(983,10234,'Power Supply',0),(984,10234,'Fans',0),(985,10234,'Inventory',0),(986,10235,'Network Interfaces',0),(987,10235,'General',0),(988,10235,'Status',0),(989,10235,'CPU',0),(990,10235,'Memory',0),(991,10235,'Inventory',0),(992,10236,'Network Interfaces',0),(993,10236,'General',0),(994,10236,'Status',0),(995,10236,'CPU',0),(996,10236,'Memory',0),(997,10236,'Inventory',0),(998,10237,'Network Interfaces',0),(999,10237,'General',0),(1000,10237,'Status',0),(1001,10237,'CPU',0),(1002,10237,'Memory',0),(1003,10237,'Inventory',0),(1014,10248,'CPU',0),(1015,10248,'Internal Items',0),(1016,10248,'Memory',0),(1017,10248,'Storage',0),(1018,10248,'Network Interfaces',0),(1019,10248,'General',0),(1020,10248,'Status',0),(1021,10249,'CPU',0),(1022,10249,'Internal Items',0),(1023,10249,'Memory',0),(1024,10249,'Storage',0),(1025,10249,'Network Interfaces',0),(1026,10249,'General',0),(1027,10249,'Status',0),(1028,10250,'Network Interfaces',0),(1029,10250,'General',0),(1030,10250,'Status',0),(1031,10250,'CPU',0),(1032,10250,'Memory',0),(1033,10250,'Temperature',0),(1034,10250,'Fans',0),(1035,10250,'Power Supply',0),(1036,10250,'Inventory',0),(1037,10251,'CPU',0),(1038,10251,'Internal Items',0),(1039,10251,'Memory',0),(1040,10251,'Storage',0),(1041,10251,'Network Interfaces',0),(1042,10251,'General',0),(1043,10251,'Status',0),(1044,10251,'Temperature',0),(1045,10251,'Fans',0),(1046,10251,'Power Supply',0),(1047,10251,'Inventory',0),(1048,10253,'Inventory',0),(1049,10253,'Fans',0),(1050,10253,'Power Supply',0),(1051,10253,'Temperature',0),(1052,10253,'Memory',0),(1053,10253,'Network Interfaces',0),(1054,10253,'General',0),(1055,10253,'Status',0),(1056,10252,'CPU',0),(1057,10253,'CPU',0),(1096,10254,'MySQL',0),(1106,10257,'门户系统中各ip当前登录人数监控',0),(1107,10254,'门户系统中各ip当前登录人数监控',0),(1108,10257,'门户系统中各用户当前登录次数监控',0),(1109,10254,'门户系统中各用户当前登录次数监控',0),(1110,10257,'门户系统中各系统当前登录人数监控',0),(1111,10254,'门户系统中各系统当前登录人数监控',0),(1112,10257,'门户系统中各部门当前登录人数监控',0),(1113,10254,'门户系统中各部门当前登录人数监控',0),(1114,10257,'数据质量监控',0),(1115,10254,'数据质量监控',0),(1116,10257,'信息统计',0),(1117,10254,'信息统计',0),(1118,10257,'日志监控',0),(1119,10254,'日志监控',0),(1120,10254,'容器状态',0),(1121,10254,'系统性能',0),(1122,10254,'数据库服务监控',0),(1123,10257,'ETL监控',0),(1124,10254,'ETL监控',0),(1125,10257,'数据审计',0),(1126,10254,'数据审计',0),(1166,10258,'ETL监控',0),(1167,10258,'信息统计',0),(1168,10258,'数据审计',0),(1169,10258,'数据质量监控',0),(1170,10258,'日志监控',0),(1171,10258,'门户系统中各ip当前登录人数监控',0),(1172,10258,'门户系统中各用户当前登录次数监控',0),(1173,10258,'门户系统中各系统当前登录人数监控',0),(1174,10258,'门户系统中各部门当前登录人数监控',0);
/*!40000 ALTER TABLE `applications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auditlog`
--

DROP TABLE IF EXISTS `auditlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auditlog` (
  `auditid` bigint(20) unsigned NOT NULL,
  `userid` bigint(20) unsigned NOT NULL,
  `clock` int(11) NOT NULL DEFAULT '0',
  `action` int(11) NOT NULL DEFAULT '0',
  `resourcetype` int(11) NOT NULL DEFAULT '0',
  `details` varchar(128) NOT NULL DEFAULT '0',
  `ip` varchar(39) NOT NULL DEFAULT '',
  `resourceid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `resourcename` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`auditid`),
  KEY `auditlog_1` (`userid`,`clock`),
  KEY `auditlog_2` (`clock`),
  CONSTRAINT `c_auditlog_1` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auditlog`
--

LOCK TABLES `auditlog` WRITE;
/*!40000 ALTER TABLE `auditlog` DISABLE KEYS */;
INSERT INTO `auditlog` VALUES (1,2,1529989909,3,0,'','10.10.10.27',0,''),(2,1,1529989918,3,0,'','10.10.10.27',0,''),(3,2,1530001043,3,0,'','10.10.10.151',0,''),(4,2,1530001043,3,0,'','10.10.10.151',0,''),(5,1,1530001052,3,0,'Login failed.','10.10.10.151',0,''),(6,2,1530001052,3,0,'','10.10.10.151',0,''),(7,1,1530002582,3,0,'','10.10.10.27',0,''),(8,2,1530002596,3,0,'','10.10.10.42',0,''),(9,1,1530002792,3,0,'','10.10.10.27',0,''),(10,2,1530002851,3,0,'','10.10.10.27',0,''),(11,2,1530002863,3,0,'','10.10.10.27',0,''),(12,2,1530002863,3,0,'','10.10.10.27',0,''),(13,1,1530002863,3,0,'','10.10.10.27',0,''),(14,1,1530003511,1,0,'0','10.10.10.27',1,'Admin'),(15,1,1530003747,0,13,'0','10.10.10.27',15640,'Zabbix alert manager processes more than 75% busy'),(16,1,1530003747,0,13,'0','10.10.10.27',15641,'Zabbix alerter processes more than 75% busy'),(17,1,1530003747,0,13,'0','10.10.10.27',15642,'Zabbix configuration syncer processes more than 75% busy'),(18,1,1530003747,0,13,'0','10.10.10.27',15643,'Zabbix discoverer processes more than 75% busy'),(19,1,1530003747,0,13,'0','10.10.10.27',15644,'Zabbix escalator processes more than 75% busy'),(20,1,1530003747,0,13,'0','10.10.10.27',15645,'Zabbix history syncer processes more than 75% busy'),(21,1,1530003747,0,13,'0','10.10.10.27',15646,'Zabbix housekeeper processes more than 75% busy'),(22,1,1530003747,0,13,'0','10.10.10.27',15647,'Zabbix http poller processes more than 75% busy'),(23,1,1530003747,0,13,'0','10.10.10.27',15648,'Zabbix icmp pinger processes more than 75% busy'),(24,1,1530003747,0,13,'0','10.10.10.27',15649,'Zabbix ipmi manager processes more than 75% busy'),(25,1,1530003747,0,13,'0','10.10.10.27',15650,'Zabbix ipmi poller processes more than 75% busy'),(26,1,1530003747,0,13,'0','10.10.10.27',15651,'Zabbix java poller processes more than 75% busy'),(27,1,1530003747,0,13,'0','10.10.10.27',15652,'Zabbix poller processes more than 75% busy'),(28,1,1530003747,0,13,'0','10.10.10.27',15653,'Zabbix preprocessing manager processes more than 75% busy'),(29,1,1530003747,0,13,'0','10.10.10.27',15654,'Zabbix preprocessing worker processes more than 75% busy'),(30,1,1530003747,0,13,'0','10.10.10.27',15655,'Zabbix proxy poller processes more than 75% busy'),(31,1,1530003747,0,13,'0','10.10.10.27',15656,'Zabbix self-monitoring processes more than 75% busy'),(32,1,1530003747,0,13,'0','10.10.10.27',15657,'Zabbix snmp trapper processes more than 75% busy'),(33,1,1530003747,0,13,'0','10.10.10.27',15658,'Zabbix task manager processes more than 75% busy'),(34,1,1530003747,0,13,'0','10.10.10.27',15659,'Zabbix timer processes more than 75% busy'),(35,1,1530003747,0,13,'0','10.10.10.27',15660,'Zabbix trapper processes more than 75% busy'),(36,1,1530003747,0,13,'0','10.10.10.27',15661,'Zabbix unreachable poller processes more than 75% busy'),(37,1,1530003747,0,13,'0','10.10.10.27',15662,'Zabbix vmware collector processes more than 75% busy'),(38,1,1530003747,0,13,'0','10.10.10.27',15663,'More than 100 items having missing data for more than 10 minutes'),(39,1,1530003747,0,13,'0','10.10.10.27',15664,'Less than 25% free in the configuration cache'),(40,1,1530003747,0,13,'0','10.10.10.27',15665,'Less than 5% free in the value cache'),(41,1,1530003747,0,13,'0','10.10.10.27',15666,'Zabbix value cache working in low memory mode'),(42,1,1530003747,0,13,'0','10.10.10.27',15667,'Less than 25% free in the vmware cache'),(43,1,1530003747,0,13,'0','10.10.10.27',15668,'Less than 25% free in the history cache'),(44,1,1530003748,0,13,'0','10.10.10.27',15669,'Less than 25% free in the history index cache'),(45,1,1530003748,0,13,'0','10.10.10.27',15670,'Less than 25% free in the trends cache'),(46,1,1530003748,0,13,'0','10.10.10.27',15671,'Host name of zabbix_agentd was changed on {HOST.NAME}'),(47,1,1530003748,0,13,'0','10.10.10.27',15672,'Zabbix agent on {HOST.NAME} is unreachable for 5 minutes'),(48,1,1530003748,0,13,'0','10.10.10.27',15673,'Version of zabbix_agent(d) was changed on {HOST.NAME}'),(49,1,1530003748,0,13,'0','10.10.10.27',15674,'Configured max number of opened files is too low on {HOST.NAME}'),(50,1,1530003748,0,13,'0','10.10.10.27',15675,'Configured max number of processes is too low on {HOST.NAME}'),(51,1,1530003748,0,13,'0','10.10.10.27',15676,'Too many processes running on {HOST.NAME}'),(52,1,1530003748,0,13,'0','10.10.10.27',15677,'Too many processes on {HOST.NAME}'),(53,1,1530003748,0,13,'0','10.10.10.27',15678,'Processor load is too high on {HOST.NAME}'),(54,1,1530003748,0,13,'0','10.10.10.27',15679,'Disk I/O is overloaded on {HOST.NAME}'),(55,1,1530003748,0,13,'0','10.10.10.27',15680,'Hostname was changed on {HOST.NAME}'),(56,1,1530003748,0,13,'0','10.10.10.27',15681,'Lack of free swap space on {HOST.NAME}'),(57,1,1530003748,0,13,'0','10.10.10.27',15682,'Host information was changed on {HOST.NAME}'),(58,1,1530003748,0,13,'0','10.10.10.27',15683,'{HOST.NAME} has just been restarted'),(59,1,1530003748,0,13,'0','10.10.10.27',15684,'/etc/passwd has been changed on {HOST.NAME}'),(60,1,1530003748,0,13,'0','10.10.10.27',15685,'Lack of available memory on server {HOST.NAME}'),(61,1,1530003748,0,31,'0','10.10.10.27',15686,'Free inodes is less than 20% on volume {#FSNAME}'),(62,1,1530003748,0,31,'0','10.10.10.27',15687,'Free disk space is less than 20% on volume {#FSNAME}'),(63,1,1530003748,0,4,'0','10.10.10.27',10254,'data-handler'),(64,1,1530004151,1,4,'0','10.10.10.27',10254,'portal'),(65,1,1530004181,0,13,'0','10.10.10.27',15688,'Zabbix alert manager processes more than 75% busy'),(66,1,1530004181,0,13,'0','10.10.10.27',15689,'Zabbix alerter processes more than 75% busy'),(67,1,1530004181,0,13,'0','10.10.10.27',15690,'Zabbix configuration syncer processes more than 75% busy'),(68,1,1530004181,0,13,'0','10.10.10.27',15691,'Zabbix discoverer processes more than 75% busy'),(69,1,1530004181,0,13,'0','10.10.10.27',15692,'Zabbix escalator processes more than 75% busy'),(70,1,1530004181,0,13,'0','10.10.10.27',15693,'Zabbix history syncer processes more than 75% busy'),(71,1,1530004181,0,13,'0','10.10.10.27',15694,'Zabbix housekeeper processes more than 75% busy'),(72,1,1530004181,0,13,'0','10.10.10.27',15695,'Zabbix http poller processes more than 75% busy'),(73,1,1530004181,0,13,'0','10.10.10.27',15696,'Zabbix icmp pinger processes more than 75% busy'),(74,1,1530004181,0,13,'0','10.10.10.27',15697,'Zabbix ipmi manager processes more than 75% busy'),(75,1,1530004181,0,13,'0','10.10.10.27',15698,'Zabbix ipmi poller processes more than 75% busy'),(76,1,1530004181,0,13,'0','10.10.10.27',15699,'Zabbix java poller processes more than 75% busy'),(77,1,1530004181,0,13,'0','10.10.10.27',15700,'Zabbix poller processes more than 75% busy'),(78,1,1530004181,0,13,'0','10.10.10.27',15701,'Zabbix preprocessing manager processes more than 75% busy'),(79,1,1530004181,0,13,'0','10.10.10.27',15702,'Zabbix preprocessing worker processes more than 75% busy'),(80,1,1530004181,0,13,'0','10.10.10.27',15703,'Zabbix proxy poller processes more than 75% busy'),(81,1,1530004181,0,13,'0','10.10.10.27',15704,'Zabbix self-monitoring processes more than 75% busy'),(82,1,1530004181,0,13,'0','10.10.10.27',15705,'Zabbix snmp trapper processes more than 75% busy'),(83,1,1530004181,0,13,'0','10.10.10.27',15706,'Zabbix task manager processes more than 75% busy'),(84,1,1530004181,0,13,'0','10.10.10.27',15707,'Zabbix timer processes more than 75% busy'),(85,1,1530004181,0,13,'0','10.10.10.27',15708,'Zabbix trapper processes more than 75% busy'),(86,1,1530004181,0,13,'0','10.10.10.27',15709,'Zabbix unreachable poller processes more than 75% busy'),(87,1,1530004181,0,13,'0','10.10.10.27',15710,'Zabbix vmware collector processes more than 75% busy'),(88,1,1530004181,0,13,'0','10.10.10.27',15711,'More than 100 items having missing data for more than 10 minutes'),(89,1,1530004181,0,13,'0','10.10.10.27',15712,'Less than 25% free in the configuration cache'),(90,1,1530004181,0,13,'0','10.10.10.27',15713,'Less than 5% free in the value cache'),(91,1,1530004181,0,13,'0','10.10.10.27',15714,'Zabbix value cache working in low memory mode'),(92,1,1530004181,0,13,'0','10.10.10.27',15715,'Less than 25% free in the vmware cache'),(93,1,1530004181,0,13,'0','10.10.10.27',15716,'Less than 25% free in the history cache'),(94,1,1530004181,0,13,'0','10.10.10.27',15717,'Less than 25% free in the history index cache'),(95,1,1530004181,0,13,'0','10.10.10.27',15718,'Less than 25% free in the trends cache'),(96,1,1530004181,0,13,'0','10.10.10.27',15719,'Host name of zabbix_agentd was changed on {HOST.NAME}'),(97,1,1530004181,0,13,'0','10.10.10.27',15720,'Zabbix agent on {HOST.NAME} is unreachable for 5 minutes'),(98,1,1530004181,0,13,'0','10.10.10.27',15721,'Version of zabbix_agent(d) was changed on {HOST.NAME}'),(99,1,1530004181,0,13,'0','10.10.10.27',15722,'Configured max number of opened files is too low on {HOST.NAME}'),(100,1,1530004181,0,13,'0','10.10.10.27',15723,'Configured max number of processes is too low on {HOST.NAME}'),(101,1,1530004181,0,13,'0','10.10.10.27',15724,'Too many processes running on {HOST.NAME}'),(102,1,1530004181,0,13,'0','10.10.10.27',15725,'Too many processes on {HOST.NAME}'),(103,1,1530004181,0,13,'0','10.10.10.27',15726,'Processor load is too high on {HOST.NAME}'),(104,1,1530004181,0,13,'0','10.10.10.27',15727,'Disk I/O is overloaded on {HOST.NAME}'),(105,1,1530004181,0,13,'0','10.10.10.27',15728,'Hostname was changed on {HOST.NAME}'),(106,1,1530004181,0,13,'0','10.10.10.27',15729,'Lack of free swap space on {HOST.NAME}'),(107,1,1530004181,0,13,'0','10.10.10.27',15730,'Host information was changed on {HOST.NAME}'),(108,1,1530004181,0,13,'0','10.10.10.27',15731,'{HOST.NAME} has just been restarted'),(109,1,1530004181,0,13,'0','10.10.10.27',15732,'/etc/passwd has been changed on {HOST.NAME}'),(110,1,1530004181,0,13,'0','10.10.10.27',15733,'Lack of available memory on server {HOST.NAME}'),(111,1,1530004181,0,31,'0','10.10.10.27',15734,'Free inodes is less than 20% on volume {#FSNAME}'),(112,1,1530004181,0,31,'0','10.10.10.27',15735,'Free disk space is less than 20% on volume {#FSNAME}'),(113,1,1530004181,0,4,'0','10.10.10.27',10255,'data-handler'),(114,1,1530004191,1,4,'0','10.10.10.27',10254,'portal'),(115,1,1530004193,1,4,'0','10.10.10.27',10255,'data-handler'),(116,1,1530004377,1,4,'0','10.10.10.27',10255,'data-handler'),(117,1,1530004383,1,4,'0','10.10.10.27',10255,'data-handler'),(118,1,1530004445,0,14,'0','10.10.10.27',15,'大数据治理平台'),(119,1,1530004543,0,14,'0','10.10.10.27',16,'数据分析'),(120,1,1530004554,1,14,'0','10.10.10.27',15,'大数据治理平台'),(121,1,1530004574,0,14,'0','10.10.10.27',17,'数据可视化'),(122,1,1530004599,0,14,'0','10.10.10.27',18,'数据接入'),(123,1,1530004611,0,14,'0','10.10.10.27',19,'数据管理'),(124,1,1530005958,1,4,'0','10.10.10.27',10084,'Zabbix server'),(125,1,1530006107,0,13,'0','10.10.10.27',15736,'Zabbix alert manager processes more than 75% busy'),(126,1,1530006107,0,13,'0','10.10.10.27',15737,'Zabbix alerter processes more than 75% busy'),(127,1,1530006107,0,13,'0','10.10.10.27',15738,'Zabbix configuration syncer processes more than 75% busy'),(128,1,1530006107,0,13,'0','10.10.10.27',15739,'Zabbix discoverer processes more than 75% busy'),(129,1,1530006107,0,13,'0','10.10.10.27',15740,'Zabbix escalator processes more than 75% busy'),(130,1,1530006107,0,13,'0','10.10.10.27',15741,'Zabbix history syncer processes more than 75% busy'),(131,1,1530006107,0,13,'0','10.10.10.27',15742,'Zabbix housekeeper processes more than 75% busy'),(132,1,1530006107,0,13,'0','10.10.10.27',15743,'Zabbix http poller processes more than 75% busy'),(133,1,1530006107,0,13,'0','10.10.10.27',15744,'Zabbix icmp pinger processes more than 75% busy'),(134,1,1530006107,0,13,'0','10.10.10.27',15745,'Zabbix ipmi manager processes more than 75% busy'),(135,1,1530006107,0,13,'0','10.10.10.27',15746,'Zabbix ipmi poller processes more than 75% busy'),(136,1,1530006107,0,13,'0','10.10.10.27',15747,'Zabbix java poller processes more than 75% busy'),(137,1,1530006107,0,13,'0','10.10.10.27',15748,'Zabbix poller processes more than 75% busy'),(138,1,1530006107,0,13,'0','10.10.10.27',15749,'Zabbix preprocessing manager processes more than 75% busy'),(139,1,1530006107,0,13,'0','10.10.10.27',15750,'Zabbix preprocessing worker processes more than 75% busy'),(140,1,1530006107,0,13,'0','10.10.10.27',15751,'Zabbix proxy poller processes more than 75% busy'),(141,1,1530006107,0,13,'0','10.10.10.27',15752,'Zabbix self-monitoring processes more than 75% busy'),(142,1,1530006107,0,13,'0','10.10.10.27',15753,'Zabbix snmp trapper processes more than 75% busy'),(143,1,1530006107,0,13,'0','10.10.10.27',15754,'Zabbix task manager processes more than 75% busy'),(144,1,1530006107,0,13,'0','10.10.10.27',15755,'Zabbix timer processes more than 75% busy'),(145,1,1530006107,0,13,'0','10.10.10.27',15756,'Zabbix trapper processes more than 75% busy'),(146,1,1530006107,0,13,'0','10.10.10.27',15757,'Zabbix unreachable poller processes more than 75% busy'),(147,1,1530006107,0,13,'0','10.10.10.27',15758,'Zabbix vmware collector processes more than 75% busy'),(148,1,1530006107,0,13,'0','10.10.10.27',15759,'More than 100 items having missing data for more than 10 minutes'),(149,1,1530006107,0,13,'0','10.10.10.27',15760,'Less than 25% free in the configuration cache'),(150,1,1530006107,0,13,'0','10.10.10.27',15761,'Less than 5% free in the value cache'),(151,1,1530006107,0,13,'0','10.10.10.27',15762,'Zabbix value cache working in low memory mode'),(152,1,1530006107,0,13,'0','10.10.10.27',15763,'Less than 25% free in the vmware cache'),(153,1,1530006107,0,13,'0','10.10.10.27',15764,'Less than 25% free in the history cache'),(154,1,1530006107,0,13,'0','10.10.10.27',15765,'Less than 25% free in the history index cache'),(155,1,1530006107,0,13,'0','10.10.10.27',15766,'Less than 25% free in the trends cache'),(156,1,1530006107,0,13,'0','10.10.10.27',15767,'Host name of zabbix_agentd was changed on {HOST.NAME}'),(157,1,1530006107,0,13,'0','10.10.10.27',15768,'Zabbix agent on {HOST.NAME} is unreachable for 5 minutes'),(158,1,1530006107,0,13,'0','10.10.10.27',15769,'Version of zabbix_agent(d) was changed on {HOST.NAME}'),(159,1,1530006107,0,13,'0','10.10.10.27',15770,'Configured max number of opened files is too low on {HOST.NAME}'),(160,1,1530006107,0,13,'0','10.10.10.27',15771,'Configured max number of processes is too low on {HOST.NAME}'),(161,1,1530006107,0,13,'0','10.10.10.27',15772,'Too many processes running on {HOST.NAME}'),(162,1,1530006107,0,13,'0','10.10.10.27',15773,'Too many processes on {HOST.NAME}'),(163,1,1530006107,0,13,'0','10.10.10.27',15774,'Processor load is too high on {HOST.NAME}'),(164,1,1530006107,0,13,'0','10.10.10.27',15775,'Disk I/O is overloaded on {HOST.NAME}'),(165,1,1530006107,0,13,'0','10.10.10.27',15776,'Hostname was changed on {HOST.NAME}'),(166,1,1530006107,0,13,'0','10.10.10.27',15777,'Lack of free swap space on {HOST.NAME}'),(167,1,1530006107,0,13,'0','10.10.10.27',15778,'Host information was changed on {HOST.NAME}'),(168,1,1530006107,0,13,'0','10.10.10.27',15779,'{HOST.NAME} has just been restarted'),(169,1,1530006107,0,13,'0','10.10.10.27',15780,'/etc/passwd has been changed on {HOST.NAME}'),(170,1,1530006107,0,13,'0','10.10.10.27',15781,'Lack of available memory on server {HOST.NAME}'),(171,1,1530006107,0,31,'0','10.10.10.27',15782,'Free inodes is less than 20% on volume {#FSNAME}'),(172,1,1530006107,0,31,'0','10.10.10.27',15783,'Free disk space is less than 20% on volume {#FSNAME}'),(173,1,1530006108,0,4,'0','10.10.10.27',10256,'server'),(174,2,1530010098,3,0,'','10.10.10.42',0,''),(175,2,1530010098,3,0,'','10.10.10.42',0,''),(176,1,1530061611,3,0,'','10.10.10.27',0,''),(177,1,1530063505,3,0,'','10.10.10.27',0,''),(178,2,1530066305,3,0,'','10.10.10.151',0,''),(179,2,1530066305,3,0,'','10.10.10.151',0,''),(180,2,1530066305,3,0,'','10.10.10.151',0,''),(181,1,1530066305,3,0,'','10.10.10.151',0,''),(182,1,1530066402,3,0,'','10.10.10.151',0,''),(183,1,1530066408,3,0,'','10.10.10.151',0,''),(184,1,1530066617,3,0,'','10.10.10.151',0,''),(185,2,1530066932,3,0,'','10.10.10.42',0,''),(186,2,1530067225,3,0,'','10.10.10.151',0,''),(187,2,1530067225,3,0,'','10.10.10.151',0,''),(188,2,1530067225,3,0,'','10.10.10.151',0,''),(189,1,1530067225,3,0,'','10.10.10.151',0,''),(190,2,1530067745,3,0,'','10.10.10.151',0,''),(191,2,1530067746,3,0,'','10.10.10.151',0,''),(192,2,1530067746,3,0,'','10.10.10.151',0,''),(193,1,1530067746,3,0,'','10.10.10.151',0,''),(194,1,1530068183,3,0,'','10.10.10.151',0,''),(195,2,1530068898,3,0,'','10.10.10.42',0,''),(196,2,1530069384,3,0,'','10.10.10.151',0,''),(197,2,1530069384,3,0,'','10.10.10.151',0,''),(198,2,1530069384,3,0,'','10.10.10.151',0,''),(199,1,1530069384,3,0,'','10.10.10.151',0,''),(200,2,1530070067,3,0,'','10.10.10.27',0,''),(201,2,1530070067,3,0,'','10.10.10.27',0,''),(202,2,1530070068,3,0,'','10.10.10.27',0,''),(203,1,1530070068,3,0,'','10.10.10.27',0,''),(204,1,1530070241,3,0,'','10.10.10.151',0,''),(205,2,1530070410,3,0,'','10.10.10.42',0,''),(206,2,1530074538,3,0,'','10.10.10.42',0,''),(207,2,1530075018,3,0,'','10.10.10.42',0,''),(208,2,1530077298,3,0,'','10.10.10.42',0,''),(209,2,1530077538,3,0,'','10.10.10.42',0,''),(210,2,1530080410,3,0,'','10.10.10.151',0,''),(211,2,1530080410,3,0,'','10.10.10.151',0,''),(212,2,1530080410,3,0,'','10.10.10.151',0,''),(213,1,1530080410,3,0,'','10.10.10.151',0,''),(214,2,1530081872,3,0,'','10.10.10.42',0,''),(215,2,1530082751,3,0,'','10.10.10.151',0,''),(216,2,1530082752,3,0,'','10.10.10.151',0,''),(217,2,1530082752,3,0,'','10.10.10.151',0,''),(218,1,1530082752,3,0,'','10.10.10.151',0,''),(219,1,1530082839,3,0,'','10.10.10.151',0,''),(220,2,1530082920,3,0,'','10.10.10.151',0,''),(221,2,1530082923,3,0,'','10.10.10.151',0,''),(222,2,1530083160,3,0,'','10.10.10.42',0,''),(223,2,1530090498,3,0,'','10.10.10.42',0,''),(224,2,1530152361,3,0,'','10.10.10.111',0,''),(225,2,1530152362,3,0,'','10.10.10.111',0,''),(226,2,1530152362,3,0,'','10.10.10.111',0,''),(227,1,1530152362,3,0,'','10.10.10.111',0,''),(228,1,1530152577,3,0,'','10.10.10.111',0,''),(229,1,1530154543,3,0,'','10.10.10.111',0,''),(230,2,1530162258,3,0,'','10.10.10.42',0,''),(231,1,1530171895,3,0,'','10.10.10.111',0,''),(232,2,1530172036,3,0,'','10.10.10.111',0,''),(233,2,1530172036,3,0,'','10.10.10.111',0,''),(234,2,1530172036,3,0,'','10.10.10.111',0,''),(235,1,1530172036,3,0,'','10.10.10.111',0,''),(236,2,1530172044,3,0,'','10.10.10.111',0,''),(237,2,1530172044,3,0,'','10.10.10.111',0,''),(238,2,1530172044,3,0,'','10.10.10.111',0,''),(239,1,1530172044,3,0,'','10.10.10.111',0,''),(240,1,1530172060,3,0,'','10.10.10.111',0,''),(241,1,1530172191,3,0,'','10.10.10.111',0,''),(242,1,1530172537,3,0,'','10.10.10.111',0,''),(243,2,1530173583,3,0,'','10.10.10.111',0,''),(244,2,1530173583,3,0,'','10.10.10.111',0,''),(245,1,1530173936,3,0,'','10.10.10.111',0,''),(246,2,1530179298,3,0,'','10.10.10.42',0,''),(247,2,1530179418,3,0,'','10.10.10.42',0,''),(248,2,1530180738,3,0,'','10.10.10.42',0,''),(249,2,1530187218,3,0,'','10.10.10.42',0,''),(250,2,1530242486,3,0,'','10.10.10.111',0,''),(251,2,1530242486,3,0,'','10.10.10.111',0,''),(252,2,1530242486,3,0,'','10.10.10.111',0,''),(253,1,1530242486,3,0,'','10.10.10.111',0,''),(254,1,1530242545,3,0,'','10.10.10.111',0,''),(255,2,1530249738,3,0,'','10.10.10.42',0,''),(256,2,1530689143,3,0,'','10.10.10.111',0,''),(257,2,1530689144,3,0,'','10.10.10.111',0,''),(258,2,1530689144,3,0,'','10.10.10.111',0,''),(259,1,1530689144,3,0,'','10.10.10.111',0,''),(260,2,1530696389,3,0,'','10.10.10.42',0,''),(261,2,1530760911,3,0,'','10.10.10.111',0,''),(262,2,1530760911,3,0,'','10.10.10.111',0,''),(263,2,1530760911,3,0,'','10.10.10.111',0,''),(264,1,1530760911,3,0,'','10.10.10.111',0,''),(265,2,1530768509,3,0,'','10.10.10.42',0,''),(266,2,1530790871,3,0,'','10.10.10.111',0,''),(267,2,1530790871,3,0,'','10.10.10.111',0,''),(268,2,1530790872,3,0,'','10.10.10.111',0,''),(269,1,1530790872,3,0,'','10.10.10.111',0,''),(270,1,1530791038,3,0,'','10.10.10.111',0,''),(271,1,1530791369,3,0,'','10.10.10.111',0,''),(272,1,1530791386,3,0,'','10.10.10.111',0,''),(273,1,1530792103,3,0,'','10.10.10.111',0,''),(274,1,1530792328,3,0,'','10.10.10.111',0,''),(275,1,1530795136,3,0,'','10.10.10.111',0,''),(276,2,1530802349,3,0,'','10.10.10.42',0,''),(277,1,1531102121,3,0,'','10.10.10.111',0,''),(278,1,1531102213,3,0,'','10.10.10.111',0,''),(279,2,1531109429,3,0,'','10.10.10.42',0,''),(280,2,1531125097,3,0,'','10.10.10.111',0,''),(281,2,1531125097,3,0,'','10.10.10.111',0,''),(282,2,1531125097,3,0,'','10.10.10.111',0,''),(283,1,1531125097,3,0,'','10.10.10.111',0,''),(284,2,1531125933,3,0,'','10.10.10.111',0,''),(285,2,1531125933,3,0,'','10.10.10.111',0,''),(286,2,1531125933,3,0,'','10.10.10.111',0,''),(287,1,1531125933,3,0,'','10.10.10.111',0,''),(288,2,1531128636,3,0,'','10.10.10.111',0,''),(289,2,1531128647,3,0,'','10.10.10.111',0,''),(290,2,1531128647,3,0,'','10.10.10.111',0,''),(291,1,1531128647,3,0,'','10.10.10.111',0,''),(292,2,1531134509,3,0,'','10.10.10.42',0,''),(293,2,1531135215,3,0,'','10.10.10.42',0,''),(294,2,1531135949,3,0,'','10.10.10.42',0,''),(295,2,1531187491,3,0,'','10.10.10.111',0,''),(296,2,1531187492,3,0,'','10.10.10.111',0,''),(297,2,1531187492,3,0,'','10.10.10.111',0,''),(298,1,1531187492,3,0,'','10.10.10.111',0,''),(299,1,1531188000,3,0,'','10.10.10.111',0,''),(300,2,1531189589,3,0,'','10.10.10.111',0,''),(301,2,1531189589,3,0,'','10.10.10.111',0,''),(302,2,1531189589,3,0,'','10.10.10.111',0,''),(303,1,1531189589,3,0,'','10.10.10.111',0,''),(304,2,1531191702,3,0,'','10.10.10.42',0,''),(305,2,1531194749,3,0,'','10.10.10.42',0,''),(306,2,1531196309,3,0,'','10.10.10.42',0,''),(307,2,1531206573,3,0,'','10.10.10.27',0,''),(308,2,1531206581,3,0,'','10.10.10.27',0,''),(309,2,1531206581,3,0,'','10.10.10.27',0,''),(310,1,1531206581,3,0,'','10.10.10.27',0,''),(311,2,1531206833,3,0,'','10.10.10.111',0,''),(312,2,1531206833,3,0,'','10.10.10.111',0,''),(313,2,1531206833,3,0,'','10.10.10.111',0,''),(314,1,1531206833,3,0,'','10.10.10.111',0,''),(315,1,1531207598,3,0,'','10.10.10.111',0,''),(316,1,1531209431,3,0,'','10.10.10.111',0,''),(317,2,1531213829,3,0,'','10.10.10.42',0,''),(318,1,1531216953,3,0,'','10.10.10.111',0,''),(319,2,1531224629,3,0,'','10.10.10.42',0,''),(320,2,1531272959,3,0,'','10.10.10.111',0,''),(321,2,1531272966,3,0,'','10.10.10.111',0,''),(322,2,1531272973,3,0,'','10.10.10.111',0,''),(323,2,1531273342,3,0,'','10.10.10.111',0,''),(324,2,1531273342,3,0,'','10.10.10.111',0,''),(325,2,1531273343,3,0,'','10.10.10.111',0,''),(326,1,1531273343,3,0,'','10.10.10.111',0,''),(327,2,1531276097,3,0,'','10.10.10.111',0,''),(328,2,1531276098,3,0,'','10.10.10.111',0,''),(329,2,1531276099,3,0,'','10.10.10.111',0,''),(330,1,1531276099,3,0,'','10.10.10.111',0,''),(331,2,1531281140,3,0,'','10.10.10.111',0,''),(332,2,1531281140,3,0,'','10.10.10.111',0,''),(333,2,1531281141,3,0,'','10.10.10.111',0,''),(334,1,1531281141,3,0,'','10.10.10.111',0,''),(335,2,1531283309,3,0,'','10.10.10.42',0,''),(336,2,1531284029,3,0,'','10.10.10.42',0,''),(337,2,1531288349,3,0,'','10.10.10.42',0,''),(338,2,1531290964,3,0,'','10.10.10.111',0,''),(339,2,1531290970,3,0,'','10.10.10.111',0,''),(340,2,1531290970,3,0,'','10.10.10.111',0,''),(341,1,1531290971,3,0,'','10.10.10.111',0,''),(342,1,1531294452,3,0,'','10.10.10.111',0,''),(343,2,1531297589,3,0,'','10.10.10.111',0,''),(344,2,1531297590,3,0,'','10.10.10.111',0,''),(345,2,1531297590,3,0,'','10.10.10.111',0,''),(346,1,1531297590,3,0,'','10.10.10.111',0,''),(347,2,1531297745,3,0,'','10.10.10.111',0,''),(348,2,1531297745,3,0,'','10.10.10.111',0,''),(349,2,1531297745,3,0,'','10.10.10.111',0,''),(350,1,1531297745,3,0,'','10.10.10.111',0,''),(351,2,1531297930,3,0,'','10.10.10.42',0,''),(352,2,1531298189,3,0,'','10.10.10.42',0,''),(353,2,1531301669,3,0,'','10.10.10.42',0,''),(354,2,1531304531,3,0,'','10.10.10.111',0,''),(355,2,1531304532,3,0,'','10.10.10.111',0,''),(356,2,1531304532,3,0,'','10.10.10.111',0,''),(357,1,1531304532,3,0,'','10.10.10.111',0,''),(358,1,1531304714,3,0,'','10.10.10.111',0,''),(359,1,1531306600,3,0,'','10.10.10.111',0,''),(360,2,1531310669,3,0,'','10.10.10.42',0,''),(361,2,1531311749,3,0,'','10.10.10.42',0,''),(362,2,1531313909,3,0,'','10.10.10.42',0,''),(363,2,1531371869,3,0,'','10.10.10.42',0,''),(364,1,1531376133,3,0,'','10.10.10.27',0,''),(365,1,1531376348,3,0,'','10.10.10.27',0,''),(366,1,1531377951,3,0,'','10.10.10.111',0,''),(367,2,1531377989,3,0,'','10.10.10.111',0,''),(368,2,1531377989,3,0,'','10.10.10.111',0,''),(369,2,1531377989,3,0,'','10.10.10.111',0,''),(370,1,1531377989,3,0,'','10.10.10.111',0,''),(371,1,1531380561,3,0,'','10.10.10.111',0,''),(372,2,1531383389,3,0,'','10.10.10.42',0,''),(373,2,1531385309,3,0,'','10.10.10.42',0,''),(374,2,1531390589,3,0,'','10.10.10.42',0,''),(375,1,1531445295,3,0,'','10.10.10.111',0,''),(376,2,1531448702,3,0,'','10.10.10.111',0,''),(377,2,1531448702,3,0,'','10.10.10.111',0,''),(378,2,1531448702,3,0,'','10.10.10.111',0,''),(379,1,1531448702,3,0,'','10.10.10.111',0,''),(380,1,1531450195,3,0,'','10.10.10.111',0,''),(381,1,1531451210,3,0,'','10.10.10.111',0,''),(382,2,1531452509,3,0,'','10.10.10.42',0,''),(383,2,1531455989,3,0,'','10.10.10.42',0,''),(384,2,1531458509,3,0,'','10.10.10.42',0,''),(385,2,1531460487,3,0,'','10.10.10.42',0,''),(386,1,1531460640,3,0,'','10.10.10.111',0,''),(387,2,1531460702,3,0,'','10.10.10.42',0,''),(388,1,1531462636,3,0,'','10.10.10.111',0,''),(389,2,1531462752,3,0,'','10.10.10.111',0,''),(390,2,1531462753,3,0,'','10.10.10.111',0,''),(391,2,1531462753,3,0,'','10.10.10.111',0,''),(392,1,1531462753,3,0,'','10.10.10.111',0,''),(393,1,1531462769,3,0,'','10.10.10.111',0,''),(394,2,1531470029,3,0,'','10.10.10.42',0,''),(395,2,1531470389,3,0,'','10.10.10.42',0,''),(396,1,1531471009,3,0,'','10.10.10.111',0,''),(397,2,1531471200,3,0,'','10.10.10.111',0,''),(398,2,1531471200,3,0,'','10.10.10.111',0,''),(399,2,1531471200,3,0,'','10.10.10.111',0,''),(400,1,1531471200,3,0,'','10.10.10.111',0,''),(401,1,1531471531,3,0,'','10.10.10.111',0,''),(402,1,1531473413,3,0,'','10.10.10.111',0,''),(403,1,1531473560,3,0,'','10.10.10.111',0,''),(404,2,1531478429,3,0,'','10.10.10.42',0,''),(405,2,1531480709,3,0,'','10.10.10.42',0,''),(406,2,1531481343,3,0,'','10.10.10.42',0,''),(407,2,1531488149,3,0,'','10.10.10.42',0,''),(408,1,1531707211,3,0,'','10.10.10.111',0,''),(409,1,1531708603,3,0,'','10.10.10.111',0,''),(410,2,1531708903,3,0,'','10.10.10.111',0,''),(411,1,1531708986,3,0,'','10.10.10.111',0,''),(412,2,1531709731,3,0,'','10.10.10.111',0,''),(413,2,1531709731,3,0,'','10.10.10.111',0,''),(414,2,1531710377,3,0,'','10.10.10.111',0,''),(415,2,1531710377,3,0,'','10.10.10.111',0,''),(416,2,1531710378,3,0,'','10.10.10.111',0,''),(417,1,1531710378,3,0,'','10.10.10.111',0,''),(418,2,1531711831,3,0,'','10.10.10.111',0,''),(419,2,1531711831,3,0,'','10.10.10.111',0,''),(420,2,1531711831,3,0,'','10.10.10.111',0,''),(421,2,1531711831,3,0,'','10.10.10.111',0,''),(422,2,1531711831,3,0,'','10.10.10.111',0,''),(423,2,1531711831,3,0,'','10.10.10.111',0,''),(424,2,1531711831,3,0,'','10.10.10.111',0,''),(425,2,1531711832,3,0,'','10.10.10.111',0,''),(426,2,1531711832,3,0,'','10.10.10.111',0,''),(427,2,1531711832,3,0,'','10.10.10.111',0,''),(428,2,1531712431,3,0,'','10.10.10.111',0,''),(429,2,1531712432,3,0,'','10.10.10.111',0,''),(430,2,1531715549,3,0,'','10.10.10.42',0,''),(431,2,1531715909,3,0,'','10.10.10.42',0,''),(432,2,1531716269,3,0,'','10.10.10.42',0,''),(433,2,1531717589,3,0,'','10.10.10.42',0,''),(434,1,1531722132,3,0,'','10.10.10.111',0,''),(435,1,1531723090,3,0,'','10.10.10.111',0,''),(436,1,1531724313,3,0,'','10.10.10.111',0,''),(437,2,1531729349,3,0,'','10.10.10.42',0,''),(438,2,1531733549,3,0,'','10.10.10.42',0,''),(439,1,1531792851,3,0,'','10.10.10.111',0,''),(440,2,1531796844,3,0,'','10.10.10.42',0,''),(441,2,1531798536,3,0,'','10.10.10.111',0,''),(442,2,1531798536,3,0,'','10.10.10.111',0,''),(443,2,1531798536,3,0,'','10.10.10.111',0,''),(444,1,1531798536,3,0,'','10.10.10.111',0,''),(445,2,1531810949,3,0,'','10.10.10.42',0,''),(446,1,1531812587,3,0,'','10.10.10.111',0,''),(447,2,1531816024,3,0,'','10.10.10.42',0,''),(448,2,1531900517,3,0,'','10.10.10.111',0,''),(449,2,1531900517,3,0,'','10.10.10.111',0,''),(450,2,1531900518,3,0,'','10.10.10.111',0,''),(451,1,1531900518,3,0,'','10.10.10.111',0,''),(452,2,1531907804,3,0,'','10.10.10.42',0,''),(453,2,1531962888,3,0,'','10.10.10.111',0,''),(454,2,1531962888,3,0,'','10.10.10.111',0,''),(455,2,1531962888,3,0,'','10.10.10.111',0,''),(456,1,1531962888,3,0,'','10.10.10.111',0,''),(457,1,1531963196,3,0,'','10.10.10.111',0,''),(458,2,1531963379,3,0,'','10.10.10.111',0,''),(459,2,1531963379,3,0,'','10.10.10.111',0,''),(460,2,1531963379,3,0,'','10.10.10.111',0,''),(461,1,1531963379,3,0,'','10.10.10.111',0,''),(462,2,1531968162,3,0,'','10.10.10.42',0,''),(463,2,1531970461,3,0,'','10.10.10.111',0,''),(464,2,1531970461,3,0,'','10.10.10.111',0,''),(465,2,1531970461,3,0,'','10.10.10.111',0,''),(466,1,1531970461,3,0,'','10.10.10.111',0,''),(467,2,1531975365,3,0,'','10.10.10.42',0,''),(468,2,1531978005,3,0,'','10.10.10.42',0,''),(469,1,1531987188,3,0,'','10.10.10.111',0,''),(470,2,1531998285,3,0,'','10.10.10.42',0,''),(471,1,1532055480,3,0,'','10.10.10.111',0,''),(472,2,1532055552,3,0,'','10.10.10.111',0,''),(473,2,1532055552,3,0,'','10.10.10.111',0,''),(474,2,1532055552,3,0,'','10.10.10.111',0,''),(475,1,1532055552,3,0,'','10.10.10.111',0,''),(476,2,1532062845,3,0,'','10.10.10.42',0,''),(477,2,1532064645,3,0,'','10.10.10.42',0,''),(478,2,1532309456,3,0,'','10.10.10.111',0,''),(479,2,1532309456,3,0,'','10.10.10.111',0,''),(480,2,1532309456,3,0,'','10.10.10.111',0,''),(481,1,1532309456,3,0,'','10.10.10.111',0,''),(482,2,1532310599,3,0,'','10.10.10.111',0,''),(483,2,1532310600,3,0,'','10.10.10.111',0,''),(484,2,1532310600,3,0,'','10.10.10.111',0,''),(485,1,1532310600,3,0,'','10.10.10.111',0,''),(486,2,1532317605,3,0,'','10.10.10.42',0,''),(487,2,1532317845,3,0,'','10.10.10.42',0,''),(488,2,1532338782,3,0,'','10.10.10.111',0,''),(489,2,1532338783,3,0,'','10.10.10.111',0,''),(490,2,1532338783,3,0,'','10.10.10.111',0,''),(491,1,1532338783,3,0,'','10.10.10.111',0,''),(492,2,1532347725,3,0,'','10.10.10.42',0,''),(493,1,1532397211,3,0,'','10.10.10.111',0,''),(494,2,1532404485,3,0,'','10.10.10.42',0,''),(495,1,1532484489,3,0,'','10.10.10.111',0,''),(496,2,1532491726,3,0,'','10.10.10.42',0,''),(497,1,1532932180,3,0,'','10.10.10.111',0,''),(498,2,1532938421,3,0,'','10.10.10.111',0,''),(499,2,1532938421,3,0,'','10.10.10.111',0,''),(500,2,1532938421,3,0,'','10.10.10.111',0,''),(501,1,1532938421,3,0,'','10.10.10.111',0,''),(502,2,1532939446,3,0,'','10.10.10.42',0,''),(503,1,1532944431,3,0,'','10.10.10.111',0,''),(504,2,1532951686,3,0,'','10.10.10.42',0,''),(505,2,1532999499,3,0,'','10.10.10.111',0,''),(506,2,1532999788,3,0,'','10.10.10.111',0,''),(507,2,1532999800,3,0,'','10.10.10.111',0,''),(508,2,1532999800,3,0,'','10.10.10.111',0,''),(509,1,1532999800,3,0,'','10.10.10.111',0,''),(510,1,1533001616,3,0,'','10.10.10.111',0,''),(511,1,1533001642,4,0,'','10.10.10.111',0,''),(512,2,1533001650,3,0,'','10.10.10.111',0,''),(513,1,1533001650,3,0,'','10.10.10.111',0,''),(514,1,1533003626,3,0,'','10.10.10.111',0,''),(515,1,1533003626,1,0,'0','10.10.10.111',1,'Admin'),(516,1,1533003628,4,0,'','10.10.10.111',0,''),(517,2,1533004335,3,0,'','10.10.10.111',0,''),(518,2,1533004427,3,0,'','10.10.10.111',0,''),(519,1,1533004427,3,0,'','10.10.10.111',0,''),(520,1,1533004452,0,31,'0','10.10.10.111',15816,'登录次数触发器'),(521,2,1533005974,3,0,'','10.10.10.111',0,''),(522,1,1533005974,3,0,'','10.10.10.111',0,''),(523,2,1533006268,3,0,'','10.10.10.111',0,''),(524,1,1533006268,3,0,'','10.10.10.111',0,''),(525,2,1533020468,3,0,'','10.10.10.27',0,''),(526,1,1533020468,3,0,'','10.10.10.27',0,''),(527,1,1533023382,3,0,'','10.10.10.111',0,''),(528,1,1533026942,3,0,'','10.10.10.111',0,''),(529,1,1533026992,3,0,'','10.10.10.111',0,''),(530,1,1533028141,3,0,'','10.10.10.111',0,''),(531,2,1533103671,3,0,'','10.10.10.111',0,''),(532,1,1533103671,3,0,'','10.10.10.111',0,''),(533,2,1533104008,3,0,'','10.10.10.111',0,''),(534,2,1533104008,3,0,'','10.10.10.111',0,''),(535,2,1533104009,3,0,'','10.10.10.111',0,''),(536,1,1533109526,3,0,'','10.10.10.111',0,''),(537,1,1533114397,3,0,'','10.10.10.27',0,''),(538,1,1533171773,3,0,'','10.10.10.111',0,''),(539,1,1533172003,0,31,'0','10.10.10.111',15817,'登录次数触发器'),(540,1,1533172037,3,0,'','10.10.10.111',0,''),(541,1,1533172042,4,0,'','10.10.10.111',0,''),(542,2,1533172231,3,0,'','10.10.10.111',0,''),(543,1,1533172232,3,0,'','10.10.10.111',0,''),(544,2,1533176952,3,0,'','10.10.10.111',0,''),(545,1,1533176952,3,0,'','10.10.10.111',0,''),(546,1,1533178103,3,0,'','10.10.10.111',0,''),(547,1,1533180829,0,5,'名称: 用户锁定及发送邮件','10.10.10.111',0,''),(548,1,1533181872,3,0,'','10.10.10.111',0,''),(549,2,1533185090,3,0,'','10.10.10.111',0,''),(550,1,1533185090,3,0,'','10.10.10.111',0,''),(551,1,1533188229,3,0,'','10.10.10.111',0,''),(552,1,1533188496,3,0,'','10.10.10.111',0,''),(553,1,1533189060,3,0,'','10.10.10.111',0,''),(554,1,1533189145,0,13,'0','10.10.10.111',15825,'gzip compression is off for connector http-8080 on {HOST.NAME}'),(555,1,1533189145,0,13,'0','10.10.10.111',15826,'gzip compression is off for connector http-8443 on {HOST.NAME}'),(556,1,1533189145,0,13,'0','10.10.10.111',15827,'70% http-8080 worker threads busy on {HOST.NAME}'),(557,1,1533189145,0,13,'0','10.10.10.111',15828,'70% http-8443 worker threads busy on {HOST.NAME}'),(558,1,1533189145,0,13,'0','10.10.10.111',15829,'70% jk-8009 worker threads busy on {HOST.NAME}'),(559,1,1533191594,3,0,'','10.10.10.111',0,''),(560,2,1533191594,3,0,'','10.10.10.111',0,''),(561,1,1533191594,3,0,'','10.10.10.111',0,''),(562,1,1533191635,0,13,'0','10.10.10.111',15830,'MySQL is down'),(563,1,1533196822,3,0,'','10.10.10.111',0,''),(564,1,1533196823,3,0,'','10.10.10.111',0,''),(565,1,1533197174,0,5,'名称: Action Test','10.10.10.111',0,''),(566,1,1533197653,3,0,'','10.10.10.111',0,''),(567,1,1533197654,3,0,'','10.10.10.111',0,''),(568,1,1533198021,3,0,'','10.10.10.111',0,''),(569,1,1533198022,3,0,'','10.10.10.111',0,''),(570,1,1533198306,0,31,'0','10.10.10.111',15831,'TestAction'),(571,1,1533198311,1,31,'0','10.10.10.111',15831,'TestAction'),(572,1,1533198358,1,5,'名称: Action Test','10.10.10.111',0,''),(573,1,1533198379,1,31,'0','10.10.10.111',15831,'TestAction'),(574,1,1533198442,0,13,'0','10.10.10.111',15839,'{HOST.NAME} uses suboptimal JIT compiler'),(575,1,1533198442,0,13,'0','10.10.10.111',15840,'gc Concurrent Mark Sweep in fire fighting mode on {HOST.NAME}'),(576,1,1533198442,0,13,'0','10.10.10.111',15841,'gc Mark Sweep Compact in fire fighting mode on {HOST.NAME}'),(577,1,1533198442,0,13,'0','10.10.10.111',15842,'gc PS Mark Sweep in fire fighting mode on {HOST.NAME}'),(578,1,1533198442,0,13,'0','10.10.10.111',15843,'mem Heap Memory fully committed on {HOST.NAME}'),(579,1,1533198442,0,13,'0','10.10.10.111',15844,'70% mem Heap Memory used on {HOST.NAME}'),(580,1,1533198442,0,13,'0','10.10.10.111',15845,'mem Non-Heap Memory fully committed on {HOST.NAME}'),(581,1,1533198442,0,13,'0','10.10.10.111',15846,'70% mem Non-Heap Memory used on {HOST.NAME}'),(582,1,1533198442,0,13,'0','10.10.10.111',15847,'mp CMS Old Gen fully committed on {HOST.NAME}'),(583,1,1533198442,0,13,'0','10.10.10.111',15848,'70% mp CMS Old Gen used on {HOST.NAME}'),(584,1,1533198442,0,13,'0','10.10.10.111',15849,'mp CMS Perm Gen fully committed on {HOST.NAME}'),(585,1,1533198442,0,13,'0','10.10.10.111',15850,'70% mp CMS Perm Gen used on {HOST.NAME}'),(586,1,1533198442,0,13,'0','10.10.10.111',15851,'mp Code Cache fully committed on {HOST.NAME}'),(587,1,1533198442,0,13,'0','10.10.10.111',15852,'70% mp Code Cache used on {HOST.NAME}'),(588,1,1533198442,0,13,'0','10.10.10.111',15853,'mp Perm Gen fully committed on {HOST.NAME}'),(589,1,1533198442,0,13,'0','10.10.10.111',15854,'70% mp Perm Gen used on {HOST.NAME}'),(590,1,1533198442,0,13,'0','10.10.10.111',15855,'mp PS Old Gen fully committed on {HOST.NAME}'),(591,1,1533198442,0,13,'0','10.10.10.111',15856,'70% mp PS Old Gen used on {HOST.NAME}'),(592,1,1533198442,0,13,'0','10.10.10.111',15857,'mp PS Perm Gen fully committed on {HOST.NAME}'),(593,1,1533198442,0,13,'0','10.10.10.111',15858,'70% mp PS Perm Gen used on {HOST.NAME}'),(594,1,1533198442,0,13,'0','10.10.10.111',15859,'mp Tenured Gen fully committed on {HOST.NAME}'),(595,1,1533198442,0,13,'0','10.10.10.111',15860,'70% mp Tenured Gen used on {HOST.NAME}'),(596,1,1533198442,0,13,'0','10.10.10.111',15861,'70% os Opened File Descriptor Count used on {HOST.NAME}'),(597,1,1533198442,0,13,'0','10.10.10.111',15862,'70% os Process CPU Load on {HOST.NAME}'),(598,1,1533198442,0,13,'0','10.10.10.111',15863,'{HOST.NAME} is not reachable'),(599,1,1533198442,0,13,'0','10.10.10.111',15864,'{HOST.NAME} runs suboptimal VM type'),(600,1,1533200004,3,0,'','10.10.10.111',0,''),(601,1,1533200005,3,0,'','10.10.10.111',0,''),(602,1,1533200200,1,13,'0','10.10.10.111',15832,'TestAction'),(603,1,1533200285,1,31,'0','10.10.10.111',15831,'TestAction'),(604,1,1533200325,1,13,'0','10.10.10.111',15832,'TestAction'),(605,2,1533283328,3,0,'','10.10.10.111',0,''),(606,1,1533283328,3,0,'','10.10.10.111',0,''),(607,1,1533284800,3,0,'','10.10.10.111',0,''),(608,2,1533521430,3,0,'','10.10.10.111',0,''),(609,1,1533521430,3,0,'','10.10.10.111',0,''),(610,2,1533525698,3,0,'','10.10.10.111',0,''),(611,1,1533525698,3,0,'','10.10.10.111',0,''),(612,2,1533715670,3,0,'','10.10.10.222',0,''),(613,1,1533715670,3,0,'','10.10.10.222',0,''),(614,2,1533874563,3,0,'','10.10.10.27',0,''),(615,1,1533874563,3,0,'','10.10.10.27',0,''),(616,1,1533874930,4,0,'','10.10.10.27',0,''),(617,1,1534131614,3,0,'','10.10.10.100',0,''),(618,2,1534132166,3,0,'','10.10.10.100',0,''),(619,2,1534145533,3,0,'','10.10.10.27',0,''),(620,1,1534145533,3,0,'','10.10.10.27',0,''),(621,2,1534215625,3,0,'','10.10.10.111',0,''),(622,1,1534215625,3,0,'','10.10.10.111',0,''),(623,2,1534381379,3,0,'','10.10.10.27',0,''),(624,1,1534381379,3,0,'','10.10.10.27',0,''),(625,2,1534387189,3,0,'','10.10.10.111',0,''),(626,2,1534387189,3,0,'','10.10.10.111',0,''),(627,2,1534498399,3,0,'','10.10.10.111',0,''),(628,1,1534498399,3,0,'','10.10.10.111',0,''),(629,2,1534729933,3,0,'','10.10.10.111',0,''),(630,1,1534729933,3,0,'','10.10.10.111',0,''),(631,1,1534731335,1,13,'0','10.10.10.111',15832,'TestAction'),(632,1,1534731335,1,13,'0','10.10.10.111',15833,'TestAction'),(633,1,1534731335,1,13,'0','10.10.10.111',15834,'TestAction'),(634,1,1534731335,1,13,'0','10.10.10.111',15835,'TestAction'),(635,1,1534731335,1,13,'0','10.10.10.111',15836,'TestAction'),(636,1,1534731335,1,13,'0','10.10.10.111',15837,'TestAction'),(637,1,1534731335,1,13,'0','10.10.10.111',15838,'TestAction'),(638,1,1534731335,1,13,'0','10.10.10.111',15866,'TestAction'),(639,1,1534731335,1,13,'0','10.10.10.111',15868,'TestAction'),(640,1,1534731335,1,13,'0','10.10.10.111',15870,'TestAction'),(641,1,1534731500,1,5,'名称: Action Test','10.10.10.111',0,''),(642,1,1534731684,1,31,'0','10.10.10.111',15831,'TestAction'),(643,1,1534747340,3,0,'','10.10.10.111',0,''),(644,1,1534747397,1,31,'0','10.10.10.111',15831,'TestAction'),(645,1,1534747441,1,13,'0','10.10.10.111',15832,'TestAction'),(646,1,1534747441,1,13,'0','10.10.10.111',15833,'TestAction'),(647,1,1534747441,1,13,'0','10.10.10.111',15834,'TestAction'),(648,1,1534747441,1,13,'0','10.10.10.111',15835,'TestAction'),(649,1,1534747441,1,13,'0','10.10.10.111',15836,'TestAction'),(650,1,1534747441,1,13,'0','10.10.10.111',15837,'TestAction'),(651,1,1534747441,1,13,'0','10.10.10.111',15838,'TestAction'),(652,1,1534747441,1,13,'0','10.10.10.111',15866,'TestAction'),(653,1,1534747441,1,13,'0','10.10.10.111',15868,'TestAction'),(654,1,1534747441,1,13,'0','10.10.10.111',15870,'TestAction'),(655,1,1534747867,0,12,'0','10.10.10.111',1104,'用户监控'),(656,1,1534747902,2,12,'0','10.10.10.111',1104,'用户监控'),(657,1,1534747943,0,12,'0','10.10.10.111',1106,'用户的ip监控'),(658,1,1534747994,0,12,'0','10.10.10.111',1108,'用户监控'),(659,1,1534748153,0,12,'0','10.10.10.111',1110,'系统监控'),(660,1,1534748175,0,12,'0','10.10.10.111',1112,'部门监控'),(661,2,1534754648,3,0,'','10.10.10.234',0,''),(662,1,1534754648,3,0,'','10.10.10.234',0,''),(663,2,1534811008,3,0,'','10.10.10.27',0,''),(664,1,1534811008,3,0,'','10.10.10.27',0,''),(665,2,1534820055,3,0,'','10.10.10.111',0,''),(666,1,1534820055,3,0,'','10.10.10.111',0,''),(667,1,1534820736,3,0,'','10.10.10.111',0,''),(668,1,1534820803,3,0,'','10.10.10.111',0,''),(669,1,1534823140,3,0,'','10.10.10.111',0,''),(670,1,1534833490,3,0,'','10.10.10.27',0,''),(671,1,1534833527,1,33,'0','10.10.10.27',1,'Dashboard'),(672,1,1534835179,0,12,'0','10.10.10.27',1114,'数据质量监控'),(673,1,1534835227,0,12,'0','10.10.10.27',1116,'信息统计'),(674,1,1534835427,0,12,'0','10.10.10.27',1118,'日志监控'),(675,1,1534898926,0,12,'0','10.10.10.27',1120,'容器状态'),(676,1,1534899634,0,12,'0','10.10.10.27',1121,'系统性能'),(677,1,1534899674,0,12,'0','10.10.10.27',1122,'数据库服务监控'),(678,2,1534901636,3,0,'','10.10.10.111',0,''),(679,1,1534901636,3,0,'','10.10.10.111',0,''),(680,2,1534915080,3,0,'','10.10.10.27',0,''),(681,1,1534915080,3,0,'','10.10.10.27',0,''),(682,1,1534915198,3,0,'','10.10.10.27',0,''),(683,2,1535004028,3,0,'','10.10.10.111',0,''),(684,1,1535004028,3,0,'','10.10.10.111',0,''),(685,2,1535019433,3,0,'','10.10.10.111',0,''),(686,1,1535019433,3,0,'','10.10.10.111',0,''),(687,2,1535022251,3,0,'','10.10.10.111',0,''),(688,1,1535022251,3,0,'','10.10.10.111',0,''),(689,1,1535075136,0,12,'0','10.10.10.27',1123,'ETL监控'),(690,2,1535076042,3,0,'','10.10.10.111',0,''),(691,1,1535076042,3,0,'','10.10.10.111',0,''),(692,1,1535076055,3,0,'','10.10.10.111',0,''),(693,1,1535077375,3,0,'','10.10.10.27',0,''),(694,2,1535080464,3,0,'','10.10.10.111',0,''),(695,1,1535080464,3,0,'','10.10.10.111',0,''),(696,1,1535088853,3,0,'','10.10.10.27',0,''),(697,1,1535263186,3,0,'','10.10.10.111',0,''),(698,1,1535278304,3,0,'','10.10.10.111',0,''),(699,2,1535369677,3,0,'','10.10.10.111',0,''),(700,1,1535369677,3,0,'','10.10.10.111',0,''),(701,1,1535461004,3,0,'','10.10.10.27',0,''),(702,2,1535506658,3,0,'','10.10.10.27',0,''),(703,1,1535506658,3,0,'','10.10.10.27',0,''),(704,1,1535508392,3,0,'','10.10.10.27',0,''),(705,2,1535510321,3,0,'','10.10.10.111',0,''),(706,1,1535510321,3,0,'','10.10.10.111',0,''),(707,2,1535511720,3,0,'','10.10.10.111',0,''),(708,1,1535511720,3,0,'','10.10.10.111',0,''),(709,2,1535530713,3,0,'','10.10.10.111',0,''),(710,1,1535530713,3,0,'','10.10.10.111',0,''),(711,1,1535531020,3,0,'','10.10.10.111',0,''),(712,2,1535544423,3,0,'','10.10.10.111',0,''),(713,1,1535544423,3,0,'','10.10.10.111',0,''),(714,2,1535551500,3,0,'','10.10.10.111',0,''),(715,1,1535551500,3,0,'','10.10.10.111',0,''),(716,2,1535593916,3,0,'','10.10.10.111',0,''),(717,1,1535593916,3,0,'','10.10.10.111',0,''),(718,2,1535594057,3,0,'','10.10.10.111',0,''),(719,1,1535594057,3,0,'','10.10.10.111',0,''),(720,2,1535595075,3,0,'','10.10.10.111',0,''),(721,1,1535595075,3,0,'','10.10.10.111',0,''),(722,2,1535595266,3,0,'','10.10.10.27',0,''),(723,2,1535609864,3,0,'','10.10.10.111',0,''),(724,1,1535609864,3,0,'','10.10.10.111',0,''),(725,2,1535611388,3,0,'','10.10.10.111',0,''),(726,2,1535616309,3,0,'','10.10.10.27',0,''),(727,2,1535618902,3,0,'','10.10.10.111',0,''),(728,1,1535618902,3,0,'','10.10.10.111',0,''),(729,2,1535639629,3,0,'','10.10.10.27',0,''),(730,2,1535679024,3,0,'','10.10.10.111',0,''),(731,1,1535679024,3,0,'','10.10.10.111',0,''),(732,1,1535679566,3,0,'','10.10.10.111',0,''),(733,2,1535681745,3,0,'','10.10.10.111',0,''),(734,1,1535681745,3,0,'','10.10.10.111',0,''),(735,2,1535682766,3,0,'','10.10.10.111',0,''),(736,1,1535682766,3,0,'','10.10.10.111',0,''),(737,1,1535686184,3,0,'','10.10.10.111',0,''),(738,2,1535709380,3,0,'','10.10.10.27',0,''),(739,2,1535710480,3,0,'','10.10.10.111',0,''),(740,2,1535710480,3,0,'','10.10.10.111',0,''),(741,2,1535782102,3,0,'','10.10.10.27',0,''),(742,2,1535911658,3,0,'','10.10.10.27',0,''),(743,1,1535911658,3,0,'','10.10.10.27',0,''),(744,1,1535936834,3,0,'','10.10.10.27',0,''),(745,2,1535940871,3,0,'','10.10.10.111',0,''),(746,1,1535940871,3,0,'','10.10.10.111',0,''),(747,1,1535941648,3,0,'','10.10.10.27',0,''),(748,2,1535941670,3,0,'','10.10.10.27',0,''),(749,1,1535941705,3,0,'','10.10.10.27',0,''),(750,2,1535943466,3,0,'','10.10.10.111',0,''),(751,2,1535943659,3,0,'','10.10.10.111',0,''),(752,1,1535960454,3,0,'','10.10.10.27',0,''),(753,1,1535960557,0,12,'0','10.10.10.27',1125,'指标日志审计'),(754,2,1536024245,3,0,'','10.10.10.111',0,''),(755,1,1536024245,3,0,'','10.10.10.111',0,''),(756,2,1536025003,3,0,'','10.10.10.111',0,''),(757,2,1536025003,3,0,'','10.10.10.111',0,''),(758,2,1536025004,3,0,'','10.10.10.111',0,''),(759,2,1536025004,3,0,'','10.10.10.111',0,''),(760,2,1536025004,3,0,'','10.10.10.111',0,''),(761,2,1536025004,3,0,'','10.10.10.111',0,''),(762,2,1536025004,3,0,'','10.10.10.111',0,''),(763,2,1536025004,3,0,'','10.10.10.111',0,''),(764,2,1536025004,3,0,'','10.10.10.111',0,''),(765,2,1536025004,3,0,'','10.10.10.111',0,''),(766,2,1536027814,3,0,'','10.10.10.111',0,''),(767,1,1536028755,3,0,'','10.10.10.111',0,''),(768,2,1536032162,3,0,'','10.10.10.111',0,''),(769,2,1536040100,3,0,'','10.10.10.111',0,''),(770,2,1536040102,3,0,'','10.10.10.111',0,''),(771,2,1536042246,3,0,'','10.10.10.111',0,''),(772,2,1536042246,3,0,'','10.10.10.111',0,''),(773,2,1536042280,3,0,'','10.10.10.111',0,''),(774,1,1536043228,3,0,'','10.10.10.111',0,''),(775,2,1536043703,3,0,'','10.10.10.111',0,''),(776,2,1536046637,3,0,'','10.10.10.111',0,''),(777,1,1536046637,3,0,'','10.10.10.111',0,''),(778,2,1536046643,3,0,'','10.10.10.111',0,''),(779,1,1536046643,3,0,'','10.10.10.111',0,''),(780,1,1536049826,3,0,'','10.10.10.111',0,''),(781,1,1536050867,3,0,'','10.10.10.111',0,''),(782,2,1536050896,3,0,'','10.10.10.111',0,''),(783,1,1536050896,3,0,'','10.10.10.111',0,''),(784,2,1536056797,3,0,'','10.10.10.111',0,''),(785,1,1536056797,3,0,'','10.10.10.111',0,''),(786,1,1536057371,4,0,'','10.10.10.111',0,''),(787,2,1536057377,3,0,'','10.10.10.111',0,''),(788,2,1536057378,3,0,'','10.10.10.111',0,''),(789,2,1536061207,3,0,'','10.10.10.27',0,''),(790,1,1536061207,3,0,'','10.10.10.27',0,''),(791,2,1536106603,3,0,'','10.10.10.27',0,''),(792,1,1536106603,3,0,'','10.10.10.27',0,''),(793,2,1536112199,3,0,'','10.10.10.111',0,''),(794,1,1536112199,3,0,'','10.10.10.111',0,''),(795,2,1536153818,3,0,'','10.10.10.111',0,''),(796,1,1536153818,3,0,'','10.10.10.111',0,''),(797,2,1536198075,3,0,'','10.10.10.111',0,''),(798,1,1536198075,3,0,'','10.10.10.111',0,''),(799,2,1536201239,3,0,'','10.10.10.111',0,''),(800,2,1536204752,3,0,'','10.10.10.27',0,''),(801,1,1536204752,3,0,'','10.10.10.27',0,''),(802,2,1536204916,3,0,'','10.10.10.111',0,''),(803,1,1536204916,3,0,'','10.10.10.111',0,''),(804,2,1536214603,3,0,'','10.10.10.27',0,''),(805,1,1536214603,3,0,'','10.10.10.27',0,''),(806,2,1536230177,3,0,'','10.10.10.111',0,''),(807,1,1536230177,3,0,'','10.10.10.111',0,''),(808,1,1536241810,3,0,'','10.10.10.111',0,''),(809,2,1536283096,3,0,'','10.10.10.111',0,''),(810,1,1536283096,3,0,'','10.10.10.111',0,''),(811,2,1536558464,3,0,'','10.10.10.111',0,''),(812,1,1536558464,3,0,'','10.10.10.111',0,''),(813,2,1536560091,3,0,'','10.10.10.111',0,''),(814,1,1536560091,3,0,'','10.10.10.111',0,''),(815,1,1536640595,3,0,'','10.10.10.111',0,''),(816,1,1536640796,3,0,'','10.10.10.111',0,''),(817,1,1536640819,4,0,'','10.10.10.111',0,''),(818,2,1536640819,3,0,'','10.10.10.111',0,''),(819,2,1536640828,3,0,'','10.10.10.111',0,''),(820,1,1536640828,3,0,'','10.10.10.111',0,''),(821,1,1536640834,3,0,'','10.10.10.111',0,''),(822,1,1536640837,3,0,'','10.10.10.111',0,''),(823,2,1536657618,3,0,'','10.10.10.108',0,''),(824,1,1536657618,3,0,'','10.10.10.108',0,''),(825,2,1536714174,3,0,'','10.10.10.111',0,''),(826,1,1536714174,3,0,'','10.10.10.111',0,''),(827,1,1536715651,3,0,'','10.10.10.111',0,''),(828,2,1536715866,3,0,'','10.10.10.111',0,''),(829,1,1536715866,3,0,'','10.10.10.111',0,''),(830,2,1536721645,3,0,'','10.10.10.111',0,''),(831,1,1536721645,3,0,'','10.10.10.111',0,''),(832,2,1536723968,3,0,'','10.10.10.111',0,''),(833,1,1536723991,3,0,'','10.10.10.111',0,''),(834,1,1536728472,3,0,'','10.10.10.111',0,''),(835,1,1536730306,2,13,'0','10.10.10.111',15688,'Zabbix alert manager processes more than 75% busy'),(836,1,1536730306,2,13,'0','10.10.10.111',15689,'Zabbix alerter processes more than 75% busy'),(837,1,1536730306,2,13,'0','10.10.10.111',15690,'Zabbix configuration syncer processes more than 75% busy'),(838,1,1536730306,2,13,'0','10.10.10.111',15691,'Zabbix discoverer processes more than 75% busy'),(839,1,1536730306,2,13,'0','10.10.10.111',15692,'Zabbix escalator processes more than 75% busy'),(840,1,1536730306,2,13,'0','10.10.10.111',15693,'Zabbix history syncer processes more than 75% busy'),(841,1,1536730306,2,13,'0','10.10.10.111',15694,'Zabbix housekeeper processes more than 75% busy'),(842,1,1536730306,2,13,'0','10.10.10.111',15695,'Zabbix http poller processes more than 75% busy'),(843,1,1536730306,2,13,'0','10.10.10.111',15696,'Zabbix icmp pinger processes more than 75% busy'),(844,1,1536730306,2,13,'0','10.10.10.111',15697,'Zabbix ipmi manager processes more than 75% busy'),(845,1,1536730306,2,13,'0','10.10.10.111',15698,'Zabbix ipmi poller processes more than 75% busy'),(846,1,1536730306,2,13,'0','10.10.10.111',15699,'Zabbix java poller processes more than 75% busy'),(847,1,1536730306,2,13,'0','10.10.10.111',15700,'Zabbix poller processes more than 75% busy'),(848,1,1536730306,2,13,'0','10.10.10.111',15701,'Zabbix preprocessing manager processes more than 75% busy'),(849,1,1536730306,2,13,'0','10.10.10.111',15702,'Zabbix preprocessing worker processes more than 75% busy'),(850,1,1536730306,2,13,'0','10.10.10.111',15703,'Zabbix proxy poller processes more than 75% busy'),(851,1,1536730306,2,13,'0','10.10.10.111',15704,'Zabbix self-monitoring processes more than 75% busy'),(852,1,1536730306,2,13,'0','10.10.10.111',15705,'Zabbix snmp trapper processes more than 75% busy'),(853,1,1536730306,2,13,'0','10.10.10.111',15706,'Zabbix task manager processes more than 75% busy'),(854,1,1536730306,2,13,'0','10.10.10.111',15707,'Zabbix timer processes more than 75% busy'),(855,1,1536730306,2,13,'0','10.10.10.111',15708,'Zabbix trapper processes more than 75% busy'),(856,1,1536730306,2,13,'0','10.10.10.111',15709,'Zabbix unreachable poller processes more than 75% busy'),(857,1,1536730306,2,13,'0','10.10.10.111',15710,'Zabbix vmware collector processes more than 75% busy'),(858,1,1536730306,2,13,'0','10.10.10.111',15711,'More than 100 items having missing data for more than 10 minutes'),(859,1,1536730306,2,13,'0','10.10.10.111',15712,'Less than 25% free in the configuration cache'),(860,1,1536730306,2,13,'0','10.10.10.111',15713,'Less than 5% free in the value cache'),(861,1,1536730306,2,13,'0','10.10.10.111',15714,'Zabbix value cache working in low memory mode'),(862,1,1536730306,2,13,'0','10.10.10.111',15715,'Less than 25% free in the vmware cache'),(863,1,1536730306,2,13,'0','10.10.10.111',15716,'Less than 25% free in the history cache'),(864,1,1536730306,2,13,'0','10.10.10.111',15717,'Less than 25% free in the history index cache'),(865,1,1536730306,2,13,'0','10.10.10.111',15718,'Less than 25% free in the trends cache'),(866,1,1536730306,2,13,'0','10.10.10.111',15719,'Host name of zabbix_agentd was changed on {HOST.NAME}'),(867,1,1536730306,2,13,'0','10.10.10.111',15720,'Zabbix agent on {HOST.NAME} is unreachable for 5 minutes'),(868,1,1536730306,2,13,'0','10.10.10.111',15721,'Version of zabbix_agent(d) was changed on {HOST.NAME}'),(869,1,1536730306,2,13,'0','10.10.10.111',15722,'Configured max number of opened files is too low on {HOST.NAME}'),(870,1,1536730306,2,13,'0','10.10.10.111',15723,'Configured max number of processes is too low on {HOST.NAME}'),(871,1,1536730306,2,13,'0','10.10.10.111',15724,'Too many processes running on {HOST.NAME}'),(872,1,1536730306,2,13,'0','10.10.10.111',15725,'Too many processes on {HOST.NAME}'),(873,1,1536730306,2,13,'0','10.10.10.111',15726,'Processor load is too high on {HOST.NAME}'),(874,1,1536730306,2,13,'0','10.10.10.111',15727,'Disk I/O is overloaded on {HOST.NAME}'),(875,1,1536730306,2,13,'0','10.10.10.111',15728,'Hostname was changed on {HOST.NAME}'),(876,1,1536730306,2,13,'0','10.10.10.111',15729,'Lack of free swap space on {HOST.NAME}'),(877,1,1536730306,2,13,'0','10.10.10.111',15730,'Host information was changed on {HOST.NAME}'),(878,1,1536730306,2,13,'0','10.10.10.111',15731,'{HOST.NAME} has just been restarted'),(879,1,1536730306,2,13,'0','10.10.10.111',15732,'/etc/passwd has been changed on {HOST.NAME}'),(880,1,1536730306,2,13,'0','10.10.10.111',15733,'Lack of available memory on server {HOST.NAME}'),(881,1,1536730307,2,13,'0','10.10.10.111',15792,'Free inodes is less than 20% on volume /'),(882,1,1536730307,2,13,'0','10.10.10.111',15793,'Free inodes is less than 20% on volume /data'),(883,1,1536730307,2,13,'0','10.10.10.111',15794,'Free inodes is less than 20% on volume /boot'),(884,1,1536730307,2,13,'0','10.10.10.111',15795,'Free inodes is less than 20% on volume /home'),(885,1,1536730307,2,13,'0','10.10.10.111',15796,'Free disk space is less than 20% on volume /'),(886,1,1536730307,2,13,'0','10.10.10.111',15797,'Free disk space is less than 20% on volume /data'),(887,1,1536730307,2,13,'0','10.10.10.111',15798,'Free disk space is less than 20% on volume /boot'),(888,1,1536730307,2,13,'0','10.10.10.111',15799,'Free disk space is less than 20% on volume /home'),(889,1,1536730307,2,31,'0','10.10.10.111',15734,'Free inodes is less than 20% on volume {#FSNAME}:{17811}<20'),(890,1,1536730307,2,31,'0','10.10.10.111',15735,'Free disk space is less than 20% on volume {#FSNAME}:{17812}<20'),(891,1,1536730307,2,12,'0','10.10.10.111',1069,'Zabbix server'),(892,1,1536730307,2,12,'0','10.10.10.111',1070,'CPU'),(893,1,1536730307,2,12,'0','10.10.10.111',1071,'Filesystems'),(894,1,1536730307,2,12,'0','10.10.10.111',1072,'General'),(895,1,1536730307,2,12,'0','10.10.10.111',1073,'Memory'),(896,1,1536730307,2,12,'0','10.10.10.111',1074,'Network interfaces'),(897,1,1536730307,2,12,'0','10.10.10.111',1075,'OS'),(898,1,1536730307,2,12,'0','10.10.10.111',1076,'Performance'),(899,1,1536730307,2,12,'0','10.10.10.111',1077,'Processes'),(900,1,1536730307,2,12,'0','10.10.10.111',1078,'Security'),(901,1,1536730307,2,12,'0','10.10.10.111',1079,'Zabbix agent'),(902,1,1536730364,0,31,'0','10.10.10.111',15885,'登录次数触发器'),(903,1,1536732451,3,0,'','10.10.10.111',0,''),(904,1,1536732994,3,0,'','10.10.10.111',0,''),(905,1,1536733202,3,0,'','10.10.10.111',0,''),(906,1,1536734044,1,0,'0','10.10.10.111',1,'Admin'),(907,1,1536734191,1,0,'0','10.10.10.111',1,'Admin'),(908,1,1536734426,1,20,'列已添加','10.10.10.111',16,'Zabbix server'),(909,1,1536734501,3,0,'','10.10.10.111',0,''),(910,1,1536735437,3,0,'','10.10.10.111',0,''),(911,2,1536735437,3,0,'','10.10.10.111',0,''),(912,1,1536735448,3,0,'','10.10.10.111',0,''),(913,2,1536735448,3,0,'','10.10.10.111',0,''),(914,2,1536740221,3,0,'','10.10.10.111',0,''),(915,1,1536740221,3,0,'','10.10.10.111',0,''),(916,1,1536741787,1,0,'0','10.10.10.111',1,'Admin'),(917,1,1536741870,1,0,'0','10.10.10.111',1,'Admin'),(918,1,1536744225,1,0,'Unblocked user alias [guest] name [] surname []','10.10.10.111',0,''),(919,1,1536744234,1,0,'Unblocked user alias [guest] name [] surname []','10.10.10.111',0,''),(920,1,1536744272,1,0,'0','10.10.10.111',2,'guest'),(921,2,1536744767,3,0,'','10.10.10.111',0,''),(922,1,1536744767,3,0,'','10.10.10.111',0,''),(923,1,1536744849,1,11,'0','10.10.10.111',8,'Guests'),(924,1,1536746267,0,13,'0','10.10.10.111',15886,'Host name of zabbix_agentd was changed on {HOST.NAME}'),(925,1,1536746267,0,13,'0','10.10.10.111',15887,'Zabbix agent on {HOST.NAME} is unreachable for 5 minutes'),(926,1,1536746267,0,13,'0','10.10.10.111',15888,'Version of zabbix_agent(d) was changed on {HOST.NAME}'),(927,1,1536746267,0,13,'0','10.10.10.111',15889,'Configured max number of opened files is too low on {HOST.NAME}'),(928,1,1536746267,0,13,'0','10.10.10.111',15890,'Configured max number of processes is too low on {HOST.NAME}'),(929,1,1536746267,0,13,'0','10.10.10.111',15891,'Too many processes running on {HOST.NAME}'),(930,1,1536746267,0,13,'0','10.10.10.111',15892,'Too many processes on {HOST.NAME}'),(931,1,1536746267,0,13,'0','10.10.10.111',15893,'Processor load is too high on {HOST.NAME}'),(932,1,1536746267,0,13,'0','10.10.10.111',15894,'Disk I/O is overloaded on {HOST.NAME}'),(933,1,1536746267,0,13,'0','10.10.10.111',15895,'Hostname was changed on {HOST.NAME}'),(934,1,1536746267,0,13,'0','10.10.10.111',15896,'Lack of free swap space on {HOST.NAME}'),(935,1,1536746267,0,13,'0','10.10.10.111',15897,'Host information was changed on {HOST.NAME}'),(936,1,1536746267,0,13,'0','10.10.10.111',15898,'{HOST.NAME} has just been restarted'),(937,1,1536746267,0,13,'0','10.10.10.111',15899,'/etc/passwd has been changed on {HOST.NAME}'),(938,1,1536746267,0,13,'0','10.10.10.111',15900,'Lack of available memory on server {HOST.NAME}'),(939,1,1536746267,0,31,'0','10.10.10.111',15901,'Free inodes is less than 20% on volume {#FSNAME}'),(940,1,1536746267,0,31,'0','10.10.10.111',15902,'Free disk space is less than 20% on volume {#FSNAME}'),(941,2,1536800310,3,0,'','10.10.10.111',0,''),(942,1,1536800310,3,0,'','10.10.10.111',0,''),(943,2,1536801956,3,0,'','10.10.10.111',0,''),(944,1,1536801956,3,0,'','10.10.10.111',0,''),(945,1,1536821633,3,0,'','10.10.10.111',0,''),(946,1,1536821762,4,0,'','10.10.10.111',0,''),(947,2,1536821768,3,0,'','10.10.10.111',0,''),(948,1,1536821768,3,0,'','10.10.10.111',0,''),(949,1,1536822262,3,0,'','10.10.10.111',0,''),(950,1,1536822479,1,5,'名称: Action Test','10.10.10.111',0,''),(951,1,1536822502,1,31,'0','10.10.10.111',15831,'TestAction'),(952,1,1536822567,1,13,'0','10.10.10.111',15832,'TestAction'),(953,1,1536822567,1,13,'0','10.10.10.111',15833,'TestAction'),(954,1,1536822567,1,13,'0','10.10.10.111',15834,'TestAction'),(955,1,1536822567,1,13,'0','10.10.10.111',15835,'TestAction'),(956,1,1536822567,1,13,'0','10.10.10.111',15836,'TestAction'),(957,1,1536822567,1,13,'0','10.10.10.111',15837,'TestAction'),(958,1,1536822567,1,13,'0','10.10.10.111',15838,'TestAction'),(959,1,1536822567,1,13,'0','10.10.10.111',15866,'TestAction'),(960,1,1536822567,1,13,'0','10.10.10.111',15868,'TestAction'),(961,1,1536822567,1,13,'0','10.10.10.111',15870,'TestAction'),(962,1,1536822567,1,13,'0','10.10.10.111',15872,'TestAction'),(963,1,1536822567,1,13,'0','10.10.10.111',15874,'TestAction'),(964,1,1536822567,1,13,'0','10.10.10.111',15876,'TestAction'),(965,1,1536822567,1,13,'0','10.10.10.111',15878,'TestAction'),(966,1,1536822567,1,13,'0','10.10.10.111',15880,'TestAction'),(967,1,1536822567,1,13,'0','10.10.10.111',15882,'TestAction'),(968,1,1536822567,1,13,'0','10.10.10.111',15884,'TestAction'),(969,1,1536822820,1,13,'0','10.10.10.111',15832,'TestAction'),(970,1,1536822820,1,13,'0','10.10.10.111',15833,'TestAction'),(971,1,1536822820,1,13,'0','10.10.10.111',15834,'TestAction'),(972,1,1536822820,1,13,'0','10.10.10.111',15835,'TestAction'),(973,1,1536822820,1,13,'0','10.10.10.111',15836,'TestAction'),(974,1,1536822820,1,13,'0','10.10.10.111',15837,'TestAction'),(975,1,1536822820,1,13,'0','10.10.10.111',15838,'TestAction'),(976,1,1536822820,1,13,'0','10.10.10.111',15866,'TestAction'),(977,1,1536822820,1,13,'0','10.10.10.111',15868,'TestAction'),(978,1,1536822820,1,13,'0','10.10.10.111',15870,'TestAction'),(979,1,1536822820,1,13,'0','10.10.10.111',15872,'TestAction'),(980,1,1536822820,1,13,'0','10.10.10.111',15874,'TestAction'),(981,1,1536822820,1,13,'0','10.10.10.111',15876,'TestAction'),(982,1,1536822820,1,13,'0','10.10.10.111',15878,'TestAction'),(983,1,1536822820,1,13,'0','10.10.10.111',15880,'TestAction'),(984,1,1536822820,1,13,'0','10.10.10.111',15882,'TestAction'),(985,1,1536822820,1,13,'0','10.10.10.111',15884,'TestAction'),(986,1,1536822858,1,5,'名称: Action Test','10.10.10.111',0,''),(987,1,1536822860,1,5,' Actions [8] disabled','10.10.10.111',0,''),(988,2,1536825348,3,0,'','10.10.10.111',0,''),(989,1,1536825348,3,0,'','10.10.10.111',0,''),(990,1,1536825968,1,0,'0','10.10.10.222',1,'Admin'),(991,1,1536825988,1,0,'0','10.10.10.222',1,'Admin'),(992,1,1536827481,1,0,'0','10.10.10.222',1,'Admin'),(993,1,1536827509,1,0,'0','10.10.10.222',1,'Admin'),(994,2,1536886372,3,0,'','10.10.10.111',0,''),(995,1,1536886372,3,0,'','10.10.10.111',0,''),(996,1,1536887389,1,0,'0','10.10.10.111',1,'Admin'),(997,1,1536887481,1,0,'0','10.10.10.111',1,'Admin'),(998,1,1536887773,0,14,'0','10.10.10.111',20,'大数据存储与计算'),(999,1,1536887797,0,14,'0','10.10.10.111',21,'数据展现'),(1000,1,1536887924,0,4,'0','10.10.10.111',10258,'data-quality'),(1001,1,1536888036,0,4,'0','10.10.10.111',10259,'metedata'),(1002,1,1536888081,0,4,'0','10.10.10.111',10260,'data-standard'),(1003,1,1536888171,0,4,'0','10.10.10.111',10261,'measure-management'),(1004,1,1536888235,0,4,'0','10.10.10.111',10262,'batch-data'),(1005,1,1536888302,0,4,'0','10.10.10.111',10263,'real-time-data'),(1006,1,1536888415,0,4,'0','10.10.10.111',10264,'data-catalog'),(1007,1,1536888490,0,4,'0','10.10.10.111',10265,'bigdata-management'),(1008,1,1536888553,0,4,'0','10.10.10.111',10266,'bigdata-security'),(1009,1,1536888575,0,4,'0','10.10.10.111',10267,'bigdata-user'),(1010,1,1536888659,0,4,'0','10.10.10.111',10268,'distributed-excavate'),(1011,1,1536888705,0,4,'0','10.10.10.111',10269,'High-dimensional-model'),(1012,1,1536888843,0,4,'0','10.10.10.111',10270,'bigdata-retrieval'),(1013,1,1536888882,0,4,'0','10.10.10.111',10271,'batch-log'),(1014,1,1536889981,0,13,'0','10.10.10.111',15911,'Host name of zabbix_agentd was changed on {HOST.NAME}'),(1015,1,1536889981,0,13,'0','10.10.10.111',15912,'Zabbix agent on {HOST.NAME} is unreachable for 5 minutes'),(1016,1,1536889981,0,13,'0','10.10.10.111',15913,'Version of zabbix_agent(d) was changed on {HOST.NAME}'),(1017,1,1536889981,0,13,'0','10.10.10.111',15914,'Configured max number of opened files is too low on {HOST.NAME}'),(1018,1,1536889981,0,13,'0','10.10.10.111',15915,'Configured max number of processes is too low on {HOST.NAME}'),(1019,1,1536889981,0,13,'0','10.10.10.111',15916,'Too many processes running on {HOST.NAME}'),(1020,1,1536889981,0,13,'0','10.10.10.111',15917,'Too many processes on {HOST.NAME}'),(1021,1,1536889982,0,13,'0','10.10.10.111',15918,'Processor load is too high on {HOST.NAME}'),(1022,1,1536889982,0,13,'0','10.10.10.111',15919,'Disk I/O is overloaded on {HOST.NAME}'),(1023,1,1536889982,0,13,'0','10.10.10.111',15920,'Hostname was changed on {HOST.NAME}'),(1024,1,1536889982,0,13,'0','10.10.10.111',15921,'Lack of free swap space on {HOST.NAME}'),(1025,1,1536889982,0,13,'0','10.10.10.111',15922,'Host information was changed on {HOST.NAME}'),(1026,1,1536889982,0,13,'0','10.10.10.111',15923,'{HOST.NAME} has just been restarted'),(1027,1,1536889982,0,13,'0','10.10.10.111',15924,'/etc/passwd has been changed on {HOST.NAME}'),(1028,1,1536889982,0,13,'0','10.10.10.111',15925,'Lack of available memory on server {HOST.NAME}'),(1029,1,1536889982,0,31,'0','10.10.10.111',15926,'Free inodes is less than 20% on volume {#FSNAME}'),(1030,1,1536889982,0,31,'0','10.10.10.111',15927,'Free disk space is less than 20% on volume {#FSNAME}'),(1031,1,1536890016,0,13,'0','10.10.10.111',15928,'Host name of zabbix_agentd was changed on {HOST.NAME}'),(1032,1,1536890016,0,13,'0','10.10.10.111',15929,'Zabbix agent on {HOST.NAME} is unreachable for 5 minutes'),(1033,1,1536890016,0,13,'0','10.10.10.111',15930,'Version of zabbix_agent(d) was changed on {HOST.NAME}'),(1034,1,1536890016,0,13,'0','10.10.10.111',15931,'Configured max number of opened files is too low on {HOST.NAME}'),(1035,1,1536890016,0,13,'0','10.10.10.111',15932,'Configured max number of processes is too low on {HOST.NAME}'),(1036,1,1536890016,0,13,'0','10.10.10.111',15933,'Too many processes running on {HOST.NAME}'),(1037,1,1536890016,0,13,'0','10.10.10.111',15934,'Too many processes on {HOST.NAME}'),(1038,1,1536890016,0,13,'0','10.10.10.111',15935,'Processor load is too high on {HOST.NAME}'),(1039,1,1536890016,0,13,'0','10.10.10.111',15936,'Disk I/O is overloaded on {HOST.NAME}'),(1040,1,1536890016,0,13,'0','10.10.10.111',15937,'Hostname was changed on {HOST.NAME}'),(1041,1,1536890016,0,13,'0','10.10.10.111',15938,'Lack of free swap space on {HOST.NAME}'),(1042,1,1536890016,0,13,'0','10.10.10.111',15939,'Host information was changed on {HOST.NAME}'),(1043,1,1536890016,0,13,'0','10.10.10.111',15940,'{HOST.NAME} has just been restarted'),(1044,1,1536890016,0,13,'0','10.10.10.111',15941,'/etc/passwd has been changed on {HOST.NAME}'),(1045,1,1536890016,0,13,'0','10.10.10.111',15942,'Lack of available memory on server {HOST.NAME}'),(1046,1,1536890016,0,31,'0','10.10.10.111',15943,'Free inodes is less than 20% on volume {#FSNAME}'),(1047,1,1536890016,0,31,'0','10.10.10.111',15944,'Free disk space is less than 20% on volume {#FSNAME}'),(1048,1,1536894195,2,13,'0','10.10.10.111',15911,'Host name of zabbix_agentd was changed on {HOST.NAME}'),(1049,1,1536894195,2,13,'0','10.10.10.111',15912,'Zabbix agent on {HOST.NAME} is unreachable for 5 minutes'),(1050,1,1536894195,2,13,'0','10.10.10.111',15913,'Version of zabbix_agent(d) was changed on {HOST.NAME}'),(1051,1,1536894195,2,13,'0','10.10.10.111',15914,'Configured max number of opened files is too low on {HOST.NAME}'),(1052,1,1536894195,2,13,'0','10.10.10.111',15915,'Configured max number of processes is too low on {HOST.NAME}'),(1053,1,1536894195,2,13,'0','10.10.10.111',15916,'Too many processes running on {HOST.NAME}'),(1054,1,1536894195,2,13,'0','10.10.10.111',15917,'Too many processes on {HOST.NAME}'),(1055,1,1536894195,2,13,'0','10.10.10.111',15918,'Processor load is too high on {HOST.NAME}'),(1056,1,1536894195,2,13,'0','10.10.10.111',15919,'Disk I/O is overloaded on {HOST.NAME}'),(1057,1,1536894195,2,13,'0','10.10.10.111',15920,'Hostname was changed on {HOST.NAME}'),(1058,1,1536894195,2,13,'0','10.10.10.111',15921,'Lack of free swap space on {HOST.NAME}'),(1059,1,1536894195,2,13,'0','10.10.10.111',15922,'Host information was changed on {HOST.NAME}'),(1060,1,1536894195,2,13,'0','10.10.10.111',15923,'{HOST.NAME} has just been restarted'),(1061,1,1536894195,2,13,'0','10.10.10.111',15924,'/etc/passwd has been changed on {HOST.NAME}'),(1062,1,1536894195,2,13,'0','10.10.10.111',15925,'Lack of available memory on server {HOST.NAME}'),(1063,1,1536894195,2,13,'0','10.10.10.111',15945,'Free inodes is less than 20% on volume /'),(1064,1,1536894195,2,13,'0','10.10.10.111',15946,'Free inodes is less than 20% on volume /data'),(1065,1,1536894195,2,13,'0','10.10.10.111',15947,'Free inodes is less than 20% on volume /boot'),(1066,1,1536894195,2,13,'0','10.10.10.111',15948,'Free inodes is less than 20% on volume /home'),(1067,1,1536894195,2,13,'0','10.10.10.111',15949,'Free disk space is less than 20% on volume /'),(1068,1,1536894195,2,13,'0','10.10.10.111',15950,'Free disk space is less than 20% on volume /data'),(1069,1,1536894195,2,13,'0','10.10.10.111',15951,'Free disk space is less than 20% on volume /boot'),(1070,1,1536894195,2,13,'0','10.10.10.111',15952,'Free disk space is less than 20% on volume /home'),(1071,1,1536894195,2,31,'0','10.10.10.111',15926,'Free inodes is less than 20% on volume {#FSNAME}:{18028}<20'),(1072,1,1536894195,2,31,'0','10.10.10.111',15927,'Free disk space is less than 20% on volume {#FSNAME}:{18029}<20'),(1073,1,1536894195,2,12,'0','10.10.10.111',1146,'CPU'),(1074,1,1536894195,2,12,'0','10.10.10.111',1147,'Filesystems'),(1075,1,1536894195,2,12,'0','10.10.10.111',1148,'General'),(1076,1,1536894195,2,12,'0','10.10.10.111',1149,'Memory'),(1077,1,1536894195,2,12,'0','10.10.10.111',1150,'Network interfaces'),(1078,1,1536894195,2,12,'0','10.10.10.111',1151,'OS'),(1079,1,1536894195,2,12,'0','10.10.10.111',1152,'Performance'),(1080,1,1536894195,2,12,'0','10.10.10.111',1153,'Processes'),(1081,1,1536894195,2,12,'0','10.10.10.111',1154,'Security'),(1082,1,1536894195,2,12,'0','10.10.10.111',1155,'Zabbix agent'),(1083,1,1536894414,2,13,'0','10.10.10.111',15928,'Host name of zabbix_agentd was changed on {HOST.NAME}'),(1084,1,1536894414,2,13,'0','10.10.10.111',15929,'Zabbix agent on {HOST.NAME} is unreachable for 5 minutes'),(1085,1,1536894414,2,13,'0','10.10.10.111',15930,'Version of zabbix_agent(d) was changed on {HOST.NAME}'),(1086,1,1536894414,2,13,'0','10.10.10.111',15931,'Configured max number of opened files is too low on {HOST.NAME}'),(1087,1,1536894414,2,13,'0','10.10.10.111',15932,'Configured max number of processes is too low on {HOST.NAME}'),(1088,1,1536894414,2,13,'0','10.10.10.111',15933,'Too many processes running on {HOST.NAME}'),(1089,1,1536894414,2,13,'0','10.10.10.111',15934,'Too many processes on {HOST.NAME}'),(1090,1,1536894414,2,13,'0','10.10.10.111',15935,'Processor load is too high on {HOST.NAME}'),(1091,1,1536894414,2,13,'0','10.10.10.111',15936,'Disk I/O is overloaded on {HOST.NAME}'),(1092,1,1536894414,2,13,'0','10.10.10.111',15937,'Hostname was changed on {HOST.NAME}'),(1093,1,1536894414,2,13,'0','10.10.10.111',15938,'Lack of free swap space on {HOST.NAME}'),(1094,1,1536894414,2,13,'0','10.10.10.111',15939,'Host information was changed on {HOST.NAME}'),(1095,1,1536894414,2,13,'0','10.10.10.111',15940,'{HOST.NAME} has just been restarted'),(1096,1,1536894414,2,13,'0','10.10.10.111',15941,'/etc/passwd has been changed on {HOST.NAME}'),(1097,1,1536894414,2,13,'0','10.10.10.111',15942,'Lack of available memory on server {HOST.NAME}'),(1098,1,1536894414,2,13,'0','10.10.10.111',15953,'Free inodes is less than 20% on volume /'),(1099,1,1536894414,2,13,'0','10.10.10.111',15954,'Free inodes is less than 20% on volume /data'),(1100,1,1536894414,2,13,'0','10.10.10.111',15955,'Free inodes is less than 20% on volume /boot'),(1101,1,1536894414,2,13,'0','10.10.10.111',15956,'Free inodes is less than 20% on volume /home'),(1102,1,1536894414,2,13,'0','10.10.10.111',15957,'Free disk space is less than 20% on volume /'),(1103,1,1536894414,2,13,'0','10.10.10.111',15958,'Free disk space is less than 20% on volume /data'),(1104,1,1536894414,2,13,'0','10.10.10.111',15959,'Free disk space is less than 20% on volume /boot'),(1105,1,1536894414,2,13,'0','10.10.10.111',15960,'Free disk space is less than 20% on volume /home'),(1106,1,1536894414,2,31,'0','10.10.10.111',15943,'Free inodes is less than 20% on volume {#FSNAME}:{18045}<20'),(1107,1,1536894414,2,31,'0','10.10.10.111',15944,'Free disk space is less than 20% on volume {#FSNAME}:{18046}<20'),(1108,1,1536894414,2,12,'0','10.10.10.111',1156,'CPU'),(1109,1,1536894414,2,12,'0','10.10.10.111',1157,'Filesystems'),(1110,1,1536894414,2,12,'0','10.10.10.111',1158,'General'),(1111,1,1536894414,2,12,'0','10.10.10.111',1159,'Memory'),(1112,1,1536894414,2,12,'0','10.10.10.111',1160,'Network interfaces'),(1113,1,1536894414,2,12,'0','10.10.10.111',1161,'OS'),(1114,1,1536894414,2,12,'0','10.10.10.111',1162,'Performance'),(1115,1,1536894414,2,12,'0','10.10.10.111',1163,'Processes'),(1116,1,1536894414,2,12,'0','10.10.10.111',1164,'Security'),(1117,1,1536894414,2,12,'0','10.10.10.111',1165,'Zabbix agent'),(1118,1,1536896211,3,0,'','10.10.10.111',0,''),(1119,1,1536896714,3,0,'','10.10.10.111',0,''),(1120,1,1536898861,0,13,'0','10.10.10.111',15961,'大数据安全管理系统失去响应'),(1121,1,1536898936,0,13,'0','10.10.10.111',15962,'大数据管理系统失去响应'),(1122,1,1536901247,0,13,'0','10.10.10.111',15963,'大数据使用系统失去响应'),(1123,1,1536901301,0,13,'0','10.10.10.111',15964,'分布式挖掘系统失去响应'),(1124,1,1536901596,0,13,'0','10.10.10.111',15965,'批量日志分析系统失去响应'),(1125,1,1536901735,0,14,'0','10.10.10.111',22,'自定义模板组'),(1126,1,1536901735,0,30,'0','10.10.10.111',10272,'template-custom-group'),(1127,1,1536901766,3,0,'','10.10.10.111',0,''),(1128,1,1536902245,0,13,'0','10.10.10.111',15966,'大数据检索系统'),(1129,1,1536902292,0,13,'0','10.10.10.111',15967,'高维模型分析系统失去响应'),(1130,1,1536902433,0,13,'0','10.10.10.111',15968,'实时数据处理监控系统失去响应'),(1131,1,1536902523,0,13,'0','10.10.10.111',15969,'批量数据处理系统失去响应'),(1132,2,1536903715,3,0,'','10.10.10.111',0,''),(1133,1,1536903715,3,0,'','10.10.10.111',0,''),(1134,1,1536903814,5,23,'[2] Local network','10.10.10.111',0,''),(1135,1,1536903892,1,23,'[2] Local network','10.10.10.111',0,''),(1136,1,1536904127,1,14,'0','10.10.10.111',4,'Zabbix servers'),(1137,1,1536904281,1,4,'0','10.10.10.111',10084,'zabbix-servser'),(1138,1,1536904327,1,4,'0','10.10.10.111',10256,'server'),(1139,1,1536904365,2,13,'0','10.10.10.111',15800,'Free inodes is less than 20% on volume /'),(1140,1,1536904365,2,13,'0','10.10.10.111',15801,'Free inodes is less than 20% on volume /data'),(1141,1,1536904365,2,13,'0','10.10.10.111',15802,'Free inodes is less than 20% on volume /home'),(1142,1,1536904365,2,13,'0','10.10.10.111',15803,'Free inodes is less than 20% on volume /boot'),(1143,1,1536904365,2,13,'0','10.10.10.111',15804,'Free disk space is less than 20% on volume /'),(1144,1,1536904365,2,13,'0','10.10.10.111',15805,'Free disk space is less than 20% on volume /data'),(1145,1,1536904365,2,13,'0','10.10.10.111',15806,'Free disk space is less than 20% on volume /home'),(1146,1,1536904365,2,13,'0','10.10.10.111',15807,'Free disk space is less than 20% on volume /boot'),(1147,1,1536904365,2,31,'0','10.10.10.111',15782,'Free inodes is less than 20% on volume {#FSNAME}:{17859}<20'),(1148,1,1536904365,2,31,'0','10.10.10.111',15783,'Free disk space is less than 20% on volume {#FSNAME}:{17860}<20'),(1149,1,1536904365,2,13,'0','10.10.10.111',15736,'Zabbix alert manager processes more than 75% busy'),(1150,1,1536904365,2,13,'0','10.10.10.111',15737,'Zabbix alerter processes more than 75% busy'),(1151,1,1536904365,2,13,'0','10.10.10.111',15738,'Zabbix configuration syncer processes more than 75% busy'),(1152,1,1536904365,2,13,'0','10.10.10.111',15739,'Zabbix discoverer processes more than 75% busy'),(1153,1,1536904365,2,13,'0','10.10.10.111',15740,'Zabbix escalator processes more than 75% busy'),(1154,1,1536904365,2,13,'0','10.10.10.111',15741,'Zabbix history syncer processes more than 75% busy'),(1155,1,1536904365,2,13,'0','10.10.10.111',15742,'Zabbix housekeeper processes more than 75% busy'),(1156,1,1536904365,2,13,'0','10.10.10.111',15743,'Zabbix http poller processes more than 75% busy'),(1157,1,1536904365,2,13,'0','10.10.10.111',15744,'Zabbix icmp pinger processes more than 75% busy'),(1158,1,1536904365,2,13,'0','10.10.10.111',15745,'Zabbix ipmi manager processes more than 75% busy'),(1159,1,1536904365,2,13,'0','10.10.10.111',15746,'Zabbix ipmi poller processes more than 75% busy'),(1160,1,1536904365,2,13,'0','10.10.10.111',15747,'Zabbix java poller processes more than 75% busy'),(1161,1,1536904365,2,13,'0','10.10.10.111',15748,'Zabbix poller processes more than 75% busy'),(1162,1,1536904365,2,13,'0','10.10.10.111',15749,'Zabbix preprocessing manager processes more than 75% busy'),(1163,1,1536904365,2,13,'0','10.10.10.111',15750,'Zabbix preprocessing worker processes more than 75% busy'),(1164,1,1536904365,2,13,'0','10.10.10.111',15751,'Zabbix proxy poller processes more than 75% busy'),(1165,1,1536904365,2,13,'0','10.10.10.111',15752,'Zabbix self-monitoring processes more than 75% busy'),(1166,1,1536904365,2,13,'0','10.10.10.111',15753,'Zabbix snmp trapper processes more than 75% busy'),(1167,1,1536904365,2,13,'0','10.10.10.111',15754,'Zabbix task manager processes more than 75% busy'),(1168,1,1536904365,2,13,'0','10.10.10.111',15755,'Zabbix timer processes more than 75% busy'),(1169,1,1536904365,2,13,'0','10.10.10.111',15756,'Zabbix trapper processes more than 75% busy'),(1170,1,1536904365,2,13,'0','10.10.10.111',15757,'Zabbix unreachable poller processes more than 75% busy'),(1171,1,1536904365,2,13,'0','10.10.10.111',15758,'Zabbix vmware collector processes more than 75% busy'),(1172,1,1536904365,2,13,'0','10.10.10.111',15759,'More than 100 items having missing data for more than 10 minutes'),(1173,1,1536904365,2,13,'0','10.10.10.111',15760,'Less than 25% free in the configuration cache'),(1174,1,1536904365,2,13,'0','10.10.10.111',15761,'Less than 5% free in the value cache'),(1175,1,1536904365,2,13,'0','10.10.10.111',15762,'Zabbix value cache working in low memory mode'),(1176,1,1536904365,2,13,'0','10.10.10.111',15763,'Less than 25% free in the vmware cache'),(1177,1,1536904365,2,13,'0','10.10.10.111',15764,'Less than 25% free in the history cache'),(1178,1,1536904365,2,13,'0','10.10.10.111',15765,'Less than 25% free in the history index cache'),(1179,1,1536904365,2,13,'0','10.10.10.111',15766,'Less than 25% free in the trends cache'),(1180,1,1536904365,2,13,'0','10.10.10.111',15767,'Host name of zabbix_agentd was changed on {HOST.NAME}'),(1181,1,1536904365,2,13,'0','10.10.10.111',15768,'Zabbix agent on {HOST.NAME} is unreachable for 5 minutes'),(1182,1,1536904365,2,13,'0','10.10.10.111',15769,'Version of zabbix_agent(d) was changed on {HOST.NAME}'),(1183,1,1536904365,2,13,'0','10.10.10.111',15770,'Configured max number of opened files is too low on {HOST.NAME}'),(1184,1,1536904365,2,13,'0','10.10.10.111',15771,'Configured max number of processes is too low on {HOST.NAME}'),(1185,1,1536904365,2,13,'0','10.10.10.111',15772,'Too many processes running on {HOST.NAME}'),(1186,1,1536904365,2,13,'0','10.10.10.111',15773,'Too many processes on {HOST.NAME}'),(1187,1,1536904365,2,13,'0','10.10.10.111',15774,'Processor load is too high on {HOST.NAME}'),(1188,1,1536904365,2,13,'0','10.10.10.111',15775,'Disk I/O is overloaded on {HOST.NAME}'),(1189,1,1536904365,2,13,'0','10.10.10.111',15776,'Hostname was changed on {HOST.NAME}'),(1190,1,1536904365,2,13,'0','10.10.10.111',15777,'Lack of free swap space on {HOST.NAME}'),(1191,1,1536904365,2,13,'0','10.10.10.111',15778,'Host information was changed on {HOST.NAME}'),(1192,1,1536904365,2,13,'0','10.10.10.111',15779,'{HOST.NAME} has just been restarted'),(1193,1,1536904365,2,13,'0','10.10.10.111',15780,'/etc/passwd has been changed on {HOST.NAME}'),(1194,1,1536904365,2,13,'0','10.10.10.111',15781,'Lack of available memory on server {HOST.NAME}'),(1195,1,1536904366,2,4,'0','10.10.10.111',10256,'server'),(1196,1,1536907857,0,4,'0','10.10.10.111',10273,'web-spider'),(1197,1,1536907926,0,4,'0','10.10.10.111',10274,'collect-package'),(1198,1,1536908012,0,4,'0','10.10.10.111',10275,'comprehensive-collect'),(1199,2,1536911165,3,0,'','10.10.10.111',0,''),(1200,1,1536911165,3,0,'','10.10.10.111',0,''),(1201,1,1536913855,2,13,'0','10.10.10.111',15640,'Zabbix alert manager processes more than 75% busy'),(1202,1,1536913855,2,13,'0','10.10.10.111',15641,'Zabbix alerter processes more than 75% busy'),(1203,1,1536913855,2,13,'0','10.10.10.111',15642,'Zabbix configuration syncer processes more than 75% busy'),(1204,1,1536913855,2,13,'0','10.10.10.111',15643,'Zabbix discoverer processes more than 75% busy'),(1205,1,1536913855,2,13,'0','10.10.10.111',15644,'Zabbix escalator processes more than 75% busy'),(1206,1,1536913855,2,13,'0','10.10.10.111',15645,'Zabbix history syncer processes more than 75% busy'),(1207,1,1536913855,2,13,'0','10.10.10.111',15646,'Zabbix housekeeper processes more than 75% busy'),(1208,1,1536913855,2,13,'0','10.10.10.111',15647,'Zabbix http poller processes more than 75% busy'),(1209,1,1536913855,2,13,'0','10.10.10.111',15648,'Zabbix icmp pinger processes more than 75% busy'),(1210,1,1536913855,2,13,'0','10.10.10.111',15649,'Zabbix ipmi manager processes more than 75% busy'),(1211,1,1536913855,2,13,'0','10.10.10.111',15650,'Zabbix ipmi poller processes more than 75% busy'),(1212,1,1536913855,2,13,'0','10.10.10.111',15651,'Zabbix java poller processes more than 75% busy'),(1213,1,1536913855,2,13,'0','10.10.10.111',15652,'Zabbix poller processes more than 75% busy'),(1214,1,1536913855,2,13,'0','10.10.10.111',15653,'Zabbix preprocessing manager processes more than 75% busy'),(1215,1,1536913855,2,13,'0','10.10.10.111',15654,'Zabbix preprocessing worker processes more than 75% busy'),(1216,1,1536913855,2,13,'0','10.10.10.111',15655,'Zabbix proxy poller processes more than 75% busy'),(1217,1,1536913855,2,13,'0','10.10.10.111',15656,'Zabbix self-monitoring processes more than 75% busy'),(1218,1,1536913855,2,13,'0','10.10.10.111',15657,'Zabbix snmp trapper processes more than 75% busy'),(1219,1,1536913855,2,13,'0','10.10.10.111',15658,'Zabbix task manager processes more than 75% busy'),(1220,1,1536913855,2,13,'0','10.10.10.111',15659,'Zabbix timer processes more than 75% busy'),(1221,1,1536913855,2,13,'0','10.10.10.111',15660,'Zabbix trapper processes more than 75% busy'),(1222,1,1536913855,2,13,'0','10.10.10.111',15661,'Zabbix unreachable poller processes more than 75% busy'),(1223,1,1536913855,2,13,'0','10.10.10.111',15662,'Zabbix vmware collector processes more than 75% busy'),(1224,1,1536913855,2,13,'0','10.10.10.111',15663,'More than 100 items having missing data for more than 10 minutes'),(1225,1,1536913855,2,13,'0','10.10.10.111',15664,'Less than 25% free in the configuration cache'),(1226,1,1536913855,2,13,'0','10.10.10.111',15665,'Less than 5% free in the value cache'),(1227,1,1536913855,2,13,'0','10.10.10.111',15666,'Zabbix value cache working in low memory mode'),(1228,1,1536913855,2,13,'0','10.10.10.111',15667,'Less than 25% free in the vmware cache'),(1229,1,1536913855,2,13,'0','10.10.10.111',15668,'Less than 25% free in the history cache'),(1230,1,1536913855,2,13,'0','10.10.10.111',15669,'Less than 25% free in the history index cache'),(1231,1,1536913855,2,13,'0','10.10.10.111',15670,'Less than 25% free in the trends cache'),(1232,1,1536913855,2,13,'0','10.10.10.111',15671,'Host name of zabbix_agentd was changed on {HOST.NAME}'),(1233,1,1536913855,2,13,'0','10.10.10.111',15672,'Zabbix agent on {HOST.NAME} is unreachable for 5 minutes'),(1234,1,1536913855,2,13,'0','10.10.10.111',15673,'Version of zabbix_agent(d) was changed on {HOST.NAME}'),(1235,1,1536913855,2,13,'0','10.10.10.111',15674,'Configured max number of opened files is too low on {HOST.NAME}'),(1236,1,1536913855,2,13,'0','10.10.10.111',15675,'Configured max number of processes is too low on {HOST.NAME}'),(1237,1,1536913855,2,13,'0','10.10.10.111',15676,'Too many processes running on {HOST.NAME}'),(1238,1,1536913855,2,13,'0','10.10.10.111',15677,'Too many processes on {HOST.NAME}'),(1239,1,1536913855,2,13,'0','10.10.10.111',15678,'Processor load is too high on {HOST.NAME}'),(1240,1,1536913855,2,13,'0','10.10.10.111',15679,'Disk I/O is overloaded on {HOST.NAME}'),(1241,1,1536913855,2,13,'0','10.10.10.111',15680,'Hostname was changed on {HOST.NAME}'),(1242,1,1536913855,2,13,'0','10.10.10.111',15681,'Lack of free swap space on {HOST.NAME}'),(1243,1,1536913855,2,13,'0','10.10.10.111',15682,'Host information was changed on {HOST.NAME}'),(1244,1,1536913855,2,13,'0','10.10.10.111',15683,'{HOST.NAME} has just been restarted'),(1245,1,1536913855,2,13,'0','10.10.10.111',15684,'/etc/passwd has been changed on {HOST.NAME}'),(1246,1,1536913855,2,13,'0','10.10.10.111',15685,'Lack of available memory on server {HOST.NAME}'),(1247,1,1536913855,2,13,'0','10.10.10.111',15825,'gzip compression is off for connector http-8080 on {HOST.NAME}'),(1248,1,1536913855,2,13,'0','10.10.10.111',15826,'gzip compression is off for connector http-8443 on {HOST.NAME}'),(1249,1,1536913855,2,13,'0','10.10.10.111',15827,'70% http-8080 worker threads busy on {HOST.NAME}'),(1250,1,1536913855,2,13,'0','10.10.10.111',15828,'70% http-8443 worker threads busy on {HOST.NAME}'),(1251,1,1536913855,2,13,'0','10.10.10.111',15829,'70% jk-8009 worker threads busy on {HOST.NAME}'),(1252,1,1536913855,2,13,'0','10.10.10.111',15839,'{HOST.NAME} uses suboptimal JIT compiler'),(1253,1,1536913855,2,13,'0','10.10.10.111',15840,'gc Concurrent Mark Sweep in fire fighting mode on {HOST.NAME}'),(1254,1,1536913855,2,13,'0','10.10.10.111',15841,'gc Mark Sweep Compact in fire fighting mode on {HOST.NAME}'),(1255,1,1536913855,2,13,'0','10.10.10.111',15842,'gc PS Mark Sweep in fire fighting mode on {HOST.NAME}'),(1256,1,1536913855,2,13,'0','10.10.10.111',15843,'mem Heap Memory fully committed on {HOST.NAME}'),(1257,1,1536913855,2,13,'0','10.10.10.111',15844,'70% mem Heap Memory used on {HOST.NAME}'),(1258,1,1536913855,2,13,'0','10.10.10.111',15845,'mem Non-Heap Memory fully committed on {HOST.NAME}'),(1259,1,1536913855,2,13,'0','10.10.10.111',15846,'70% mem Non-Heap Memory used on {HOST.NAME}'),(1260,1,1536913855,2,13,'0','10.10.10.111',15847,'mp CMS Old Gen fully committed on {HOST.NAME}'),(1261,1,1536913855,2,13,'0','10.10.10.111',15848,'70% mp CMS Old Gen used on {HOST.NAME}'),(1262,1,1536913855,2,13,'0','10.10.10.111',15849,'mp CMS Perm Gen fully committed on {HOST.NAME}'),(1263,1,1536913855,2,13,'0','10.10.10.111',15850,'70% mp CMS Perm Gen used on {HOST.NAME}'),(1264,1,1536913855,2,13,'0','10.10.10.111',15851,'mp Code Cache fully committed on {HOST.NAME}'),(1265,1,1536913855,2,13,'0','10.10.10.111',15852,'70% mp Code Cache used on {HOST.NAME}'),(1266,1,1536913855,2,13,'0','10.10.10.111',15853,'mp Perm Gen fully committed on {HOST.NAME}'),(1267,1,1536913855,2,13,'0','10.10.10.111',15854,'70% mp Perm Gen used on {HOST.NAME}'),(1268,1,1536913855,2,13,'0','10.10.10.111',15855,'mp PS Old Gen fully committed on {HOST.NAME}'),(1269,1,1536913855,2,13,'0','10.10.10.111',15856,'70% mp PS Old Gen used on {HOST.NAME}'),(1270,1,1536913855,2,13,'0','10.10.10.111',15857,'mp PS Perm Gen fully committed on {HOST.NAME}'),(1271,1,1536913855,2,13,'0','10.10.10.111',15858,'70% mp PS Perm Gen used on {HOST.NAME}'),(1272,1,1536913855,2,13,'0','10.10.10.111',15859,'mp Tenured Gen fully committed on {HOST.NAME}'),(1273,1,1536913855,2,13,'0','10.10.10.111',15860,'70% mp Tenured Gen used on {HOST.NAME}'),(1274,1,1536913855,2,13,'0','10.10.10.111',15861,'70% os Opened File Descriptor Count used on {HOST.NAME}'),(1275,1,1536913855,2,13,'0','10.10.10.111',15862,'70% os Process CPU Load on {HOST.NAME}'),(1276,1,1536913855,2,13,'0','10.10.10.111',15863,'{HOST.NAME} is not reachable'),(1277,1,1536913855,2,13,'0','10.10.10.111',15864,'{HOST.NAME} runs suboptimal VM type'),(1278,1,1536913855,2,13,'0','10.10.10.111',15784,'Free inodes is less than 20% on volume /'),(1279,1,1536913855,2,13,'0','10.10.10.111',15785,'Free inodes is less than 20% on volume /data'),(1280,1,1536913855,2,13,'0','10.10.10.111',15786,'Free inodes is less than 20% on volume /home'),(1281,1,1536913855,2,13,'0','10.10.10.111',15787,'Free inodes is less than 20% on volume /boot'),(1282,1,1536913855,2,13,'0','10.10.10.111',15788,'Free disk space is less than 20% on volume /'),(1283,1,1536913855,2,13,'0','10.10.10.111',15789,'Free disk space is less than 20% on volume /data'),(1284,1,1536913855,2,13,'0','10.10.10.111',15790,'Free disk space is less than 20% on volume /home'),(1285,1,1536913855,2,13,'0','10.10.10.111',15791,'Free disk space is less than 20% on volume /boot'),(1286,1,1536913855,2,31,'0','10.10.10.111',15686,'Free inodes is less than 20% on volume {#FSNAME}:{17763}<20'),(1287,1,1536913855,2,31,'0','10.10.10.111',15687,'Free disk space is less than 20% on volume {#FSNAME}:{17764}<20'),(1288,1,1536913855,2,12,'0','10.10.10.111',1058,'Zabbix server'),(1289,1,1536913855,2,12,'0','10.10.10.111',1059,'CPU'),(1290,1,1536913855,2,12,'0','10.10.10.111',1060,'Filesystems'),(1291,1,1536913855,2,12,'0','10.10.10.111',1061,'General'),(1292,1,1536913855,2,12,'0','10.10.10.111',1062,'Memory'),(1293,1,1536913855,2,12,'0','10.10.10.111',1063,'Network interfaces'),(1294,1,1536913855,2,12,'0','10.10.10.111',1064,'OS'),(1295,1,1536913855,2,12,'0','10.10.10.111',1065,'Performance'),(1296,1,1536913855,2,12,'0','10.10.10.111',1066,'Processes'),(1297,1,1536913855,2,12,'0','10.10.10.111',1067,'Security'),(1298,1,1536913855,2,12,'0','10.10.10.111',1068,'Zabbix agent'),(1299,1,1536913855,2,12,'0','10.10.10.111',1091,'http-8080'),(1300,1,1536913855,2,12,'0','10.10.10.111',1092,'http-8443'),(1301,1,1536913855,2,12,'0','10.10.10.111',1093,'jk-8009'),(1302,1,1536913855,2,12,'0','10.10.10.111',1094,'Sessions'),(1303,1,1536913855,2,12,'0','10.10.10.111',1095,'Tomcat'),(1304,1,1536913855,2,12,'0','10.10.10.111',1097,'Classes'),(1305,1,1536913855,2,12,'0','10.10.10.111',1098,'Compilation'),(1306,1,1536913855,2,12,'0','10.10.10.111',1099,'Garbage Collector'),(1307,1,1536913855,2,12,'0','10.10.10.111',1100,'Memory Pool'),(1308,1,1536913855,2,12,'0','10.10.10.111',1101,'Operating System'),(1309,1,1536913855,2,12,'0','10.10.10.111',1102,'Runtime'),(1310,1,1536913855,2,12,'0','10.10.10.111',1103,'Threads'),(1311,1,1536914248,3,0,'','10.10.10.111',0,''),(1312,1,1536916399,2,14,'0','10.10.10.111',15,'大数据平台'),(1313,1,1536916458,1,20,'0','10.10.10.111',16,'统一监控系统'),(1314,1,1536916495,1,19,'Name [本地拓扑图]','10.10.10.111',0,''),(1315,1,1536916829,0,13,'0','10.10.10.111',15970,'指标管理系统失去响应'),(1316,1,1536917008,0,13,'0','10.10.10.111',15971,'数据标准管理系统失去响应'),(1317,1,1536917054,0,13,'0','10.10.10.111',15972,'元数据管理系统失去响应'),(1318,1,1536917104,0,13,'0','10.10.10.111',15973,'数据质量管理系统失去响应'),(1319,1,1536917154,0,13,'0','10.10.10.111',15974,'数据编目管理系统失去响应'),(1320,1,1536917238,0,13,'0','10.10.10.111',15975,'深网爬虫系统展示层失去响应'),(1321,1,1536917286,0,13,'0','10.10.10.111',15976,'深网爬虫系统服务层失去响应'),(1322,1,1536917330,0,13,'0','10.10.10.111',15977,'众包采集系统失去响应'),(1323,1,1536917371,0,13,'0','10.10.10.111',15978,'综合采集系统失去响应'),(1324,1,1536917419,1,13,'0','10.10.10.111',15970,'指标管理系统失去响应'),(1325,1,1536917447,1,13,'0','10.10.10.111',15972,'元数据管理系统失去响应'),(1326,1,1536917685,0,13,'0','10.10.10.111',15979,'领导驾驶舱失去响应'),(1327,1,1536917773,2,13,'0','10.10.10.111',15903,'Free inodes is less than 20% on volume /'),(1328,1,1536917773,2,13,'0','10.10.10.111',15904,'Free inodes is less than 20% on volume /data'),(1329,1,1536917773,2,13,'0','10.10.10.111',15905,'Free inodes is less than 20% on volume /home'),(1330,1,1536917773,2,13,'0','10.10.10.111',15906,'Free inodes is less than 20% on volume /boot'),(1331,1,1536917773,2,13,'0','10.10.10.111',15907,'Free disk space is less than 20% on volume /'),(1332,1,1536917773,2,13,'0','10.10.10.111',15908,'Free disk space is less than 20% on volume /data'),(1333,1,1536917773,2,13,'0','10.10.10.111',15909,'Free disk space is less than 20% on volume /home'),(1334,1,1536917773,2,13,'0','10.10.10.111',15910,'Free disk space is less than 20% on volume /boot'),(1335,1,1536917773,2,31,'0','10.10.10.111',15885,'登录次数触发器:{17987}>100'),(1336,1,1536917773,2,31,'0','10.10.10.111',15901,'Free inodes is less than 20% on volume {#FSNAME}:{18003}<20'),(1337,1,1536917773,2,31,'0','10.10.10.111',15902,'Free disk space is less than 20% on volume {#FSNAME}:{18004}<20'),(1338,1,1536917773,2,13,'0','10.10.10.111',15886,'Host name of zabbix_agentd was changed on {HOST.NAME}'),(1339,1,1536917773,2,13,'0','10.10.10.111',15887,'Zabbix agent on {HOST.NAME} is unreachable for 5 minutes'),(1340,1,1536917773,2,13,'0','10.10.10.111',15888,'Version of zabbix_agent(d) was changed on {HOST.NAME}'),(1341,1,1536917773,2,13,'0','10.10.10.111',15889,'Configured max number of opened files is too low on {HOST.NAME}'),(1342,1,1536917773,2,13,'0','10.10.10.111',15890,'Configured max number of processes is too low on {HOST.NAME}'),(1343,1,1536917773,2,13,'0','10.10.10.111',15891,'Too many processes running on {HOST.NAME}'),(1344,1,1536917773,2,13,'0','10.10.10.111',15892,'Too many processes on {HOST.NAME}'),(1345,1,1536917773,2,13,'0','10.10.10.111',15893,'Processor load is too high on {HOST.NAME}'),(1346,1,1536917773,2,13,'0','10.10.10.111',15894,'Disk I/O is overloaded on {HOST.NAME}'),(1347,1,1536917773,2,13,'0','10.10.10.111',15895,'Hostname was changed on {HOST.NAME}'),(1348,1,1536917773,2,13,'0','10.10.10.111',15896,'Lack of free swap space on {HOST.NAME}'),(1349,1,1536917773,2,13,'0','10.10.10.111',15897,'Host information was changed on {HOST.NAME}'),(1350,1,1536917773,2,13,'0','10.10.10.111',15898,'{HOST.NAME} has just been restarted'),(1351,1,1536917773,2,13,'0','10.10.10.111',15899,'/etc/passwd has been changed on {HOST.NAME}'),(1352,1,1536917773,2,13,'0','10.10.10.111',15900,'Lack of available memory on server {HOST.NAME}'),(1353,1,1536917773,2,4,'0','10.10.10.111',10255,'大数据治理平台'),(1354,2,1536929459,3,0,'','10.10.10.27',0,''),(1355,1,1536929459,3,0,'','10.10.10.27',0,''),(1356,1,1536930572,0,20,'0','10.10.10.27',21,'常用图形'),(1357,1,1536930588,1,20,'行已经添加','10.10.10.27',21,'常用图形'),(1358,1,1536930594,1,20,'列已添加','10.10.10.27',21,'常用图形'),(1359,1,1536932582,0,20,'0','10.10.10.27',22,'统一监控系统系统指标'),(1360,1,1536932653,1,20,'行已经删除','10.10.10.27',22,'统一监控系统系统指标'),(1361,1,1536932681,1,20,'Cell changed screen itemid \"130\" resource type \"0\"','10.10.10.27',22,'统一监控系统系统指标'),(1362,1,1536964355,3,0,'','10.10.10.27',0,''),(1363,1,1536965010,1,12,'0','10.10.10.27',1106,'用户的ip监控'),(1364,1,1536965046,1,12,'0','10.10.10.27',1108,'用户监控'),(1365,1,1536965083,1,12,'0','10.10.10.27',1110,'系统监控'),(1366,1,1536965152,1,12,'0','10.10.10.27',1112,'部门监控'),(1367,1,1536965171,1,12,'0','10.10.10.27',1110,'根据系统监控系统当前登录人数'),(1368,1,1536965204,1,12,'0','10.10.10.27',1108,'根据用户名监控用户登录次数'),(1369,1,1536965216,1,12,'0','10.10.10.27',1106,'根据用户ip监控监控用户登录次数'),(1370,1,1536965250,1,12,'0','10.10.10.27',1125,'指标日志审计'),(1371,1,1536965808,0,31,'0','10.10.10.27',15980,'登录次数触发器'),(1372,2,1536985617,3,0,'','10.10.10.27',0,''),(1373,1,1536985617,3,0,'','10.10.10.27',0,''),(1374,2,1537068442,3,0,'','10.10.10.27',0,''),(1375,1,1537068442,3,0,'','10.10.10.27',0,''),(1376,1,1537068510,4,0,'','10.10.10.27',0,''),(1377,2,1537068592,3,0,'','10.10.10.27',0,''),(1378,1,1537068592,3,0,'','10.10.10.27',0,''),(1379,2,1537068900,3,0,'','10.10.10.27',0,''),(1380,1,1537068900,3,0,'','10.10.10.27',0,''),(1381,1,1537071897,0,6,'Graph [统计当天同步任务数据量]','10.10.10.27',0,''),(1382,1,1537108459,3,0,'','10.10.10.27',0,''),(1383,2,1537145167,3,0,'','10.10.10.111',0,''),(1384,1,1537145167,3,0,'','10.10.10.111',0,''),(1385,2,1537147326,3,0,'','10.10.10.27',0,''),(1386,1,1537147326,3,0,'','10.10.10.27',0,''),(1387,1,1537147371,0,14,'0','10.10.10.111',23,'Zabbix servers'),(1388,1,1537147413,1,30,'0','10.10.10.111',10257,'items-user'),(1389,1,1537147431,2,14,'0','10.10.10.111',23,'Zabbix servers'),(1390,1,1537147824,3,0,'','10.10.10.111',0,''),(1391,1,1537147829,3,0,'','10.10.10.111',0,''),(1392,2,1537148596,3,0,'','10.10.10.111',0,''),(1393,1,1537148596,3,0,'','10.10.10.111',0,''),(1394,2,1537148817,3,0,'','10.10.10.111',0,''),(1395,1,1537148817,3,0,'','10.10.10.111',0,''),(1396,1,1537149433,2,15,'监控项 [mea.countTaskNumByTimes] [29135] Host [数据质量管理系统]','10.10.10.111',0,''),(1397,1,1537149433,2,15,'监控项 [mea.log] [29137] Host [数据质量管理系统]','10.10.10.111',0,''),(1398,1,1537149433,2,15,'监控项 [mea.person] [29138] Host [数据质量管理系统]','10.10.10.111',0,''),(1399,1,1537149433,2,15,'监控项 [mea.statisticsDataMeta] [29139] Host [数据质量管理系统]','10.10.10.111',0,''),(1400,1,1537149433,2,15,'监控项 [RegionServers] [29277] Host [数据质量管理系统]','10.10.10.111',0,''),(1401,1,1537149433,2,15,'监控项 [regions] [29278] Host [数据质量管理系统]','10.10.10.111',0,''),(1402,1,1537149433,2,15,'监控项 [reservedContainers] [29280] Host [数据质量管理系统]','10.10.10.111',0,''),(1403,1,1537149433,2,15,'监控项 [rpcProcessingTime] [29281] Host [数据质量管理系统]','10.10.10.111',0,''),(1404,1,1537149433,2,15,'监控项 [ServiceComponentInfo] [29282] Host [数据质量管理系统]','10.10.10.111',0,''),(1405,1,1537149433,2,15,'监控项 [rpcQueueTime] [29283] Host [数据质量管理系统]','10.10.10.111',0,''),(1406,1,1537149433,2,15,'监控项 [NodeManager] [29286] Host [数据质量管理系统]','10.10.10.111',0,''),(1407,1,1537149433,2,15,'监控项 [numOpenConnections] [29289] Host [数据质量管理系统]','10.10.10.111',0,''),(1408,1,1537149433,2,15,'监控项 [pendingContainers] [29291] Host [数据质量管理系统]','10.10.10.111',0,''),(1409,1,1537149433,2,15,'监控项 [SNameNodeState] [29292] Host [数据质量管理系统]','10.10.10.111',0,''),(1410,1,1537149433,2,15,'监控项 [StandbyHBaseMaster] [29302] Host [数据质量管理系统]','10.10.10.111',0,''),(1411,1,1537149433,2,15,'监控项 [storefiles] [29304] Host [数据质量管理系统]','10.10.10.111',0,''),(1412,1,1537149433,2,15,'监控项 [STORMUISERVER] [29305] Host [数据质量管理系统]','10.10.10.111',0,''),(1413,1,1537149433,2,15,'监控项 [SUPERVISOR] [29307] Host [数据质量管理系统]','10.10.10.111',0,''),(1414,1,1537149433,2,15,'监控项 [MUse] [29308] Host [数据质量管理系统]','10.10.10.111',0,''),(1415,1,1537149433,2,15,'监控项 [MTotal] [29309] Host [数据质量管理系统]','10.10.10.111',0,''),(1416,1,1537149433,2,15,'监控项 [DRPCSERVER] [29314] Host [数据质量管理系统]','10.10.10.111',0,''),(1417,1,1537149433,2,15,'监控项 [allocatedContainers] [29319] Host [数据质量管理系统]','10.10.10.111',0,''),(1418,1,1537149433,2,15,'监控项 [AppTimelineServer] [29322] Host [数据质量管理系统]','10.10.10.111',0,''),(1419,1,1537149433,2,15,'监控项 [HDFSDataNodeState] [29325] Host [数据质量管理系统]','10.10.10.111',0,''),(1420,1,1537149433,2,15,'监控项 [HDFSnameNodeState] [29326] Host [数据质量管理系统]','10.10.10.111',0,''),(1421,1,1537149433,2,15,'监控项 [memHeapCommittedM] [29327] Host [数据质量管理系统]','10.10.10.111',0,''),(1422,1,1537149433,2,15,'监控项 [Mcache] [29328] Host [数据质量管理系统]','10.10.10.111',0,''),(1423,1,1537149433,2,15,'监控项 [memHeapUsedM] [29329] Host [数据质量管理系统]','10.10.10.111',0,''),(1424,1,1537149433,2,15,'监控项 [MSwap] [29331] Host [数据质量管理系统]','10.10.10.111',0,''),(1425,1,1537149433,2,15,'监控项 [MShare] [29332] Host [数据质量管理系统]','10.10.10.111',0,''),(1426,1,1537149433,2,15,'监控项 [HistoryServer] [29335] Host [数据质量管理系统]','10.10.10.111',0,''),(1427,1,1537149433,2,15,'监控项 [HiveMetastore] [29337] Host [数据质量管理系统]','10.10.10.111',0,''),(1428,1,1537149433,2,15,'监控项 [HiveServer2] [29338] Host [数据质量管理系统]','10.10.10.111',0,''),(1429,1,1537149433,2,15,'监控项 [KAFKABROKER] [29340] Host [数据质量管理系统]','10.10.10.111',0,''),(1430,1,1537149433,2,15,'监控项 [ActiveHBaseMaster] [29341] Host [数据质量管理系统]','10.10.10.111',0,''),(1431,1,1537149442,2,15,'监控项 [RANGER] [29279] Host [数据质量管理系统]','10.10.10.111',0,''),(1432,1,1537149442,2,15,'监控项 [QQZIE] [29284] Host [数据质量管理系统]','10.10.10.111',0,''),(1433,1,1537149442,2,15,'监控项 [PIG] [29290] Host [数据质量管理系统]','10.10.10.111',0,''),(1434,1,1537149442,2,15,'监控项 [SPARK] [29293] Host [数据质量管理系统]','10.10.10.111',0,''),(1435,1,1537149442,2,15,'监控项 [VHive] [29294] Host [数据质量管理系统]','10.10.10.111',0,''),(1436,1,1537149442,2,15,'监控项 [VHbase] [29295] Host [数据质量管理系统]','10.10.10.111',0,''),(1437,1,1537149442,2,15,'监控项 [ZooKeeper] [29298] Host [数据质量管理系统]','10.10.10.111',0,''),(1438,1,1537149442,2,15,'监控项 [YARN] [29299] Host [数据质量管理系统]','10.10.10.111',0,''),(1439,1,1537149442,2,15,'监控项 [SQOOP] [29303] Host [数据质量管理系统]','10.10.10.111',0,''),(1440,1,1537149442,2,15,'监控项 [TEZ] [29306] Host [数据质量管理系统]','10.10.10.111',0,''),(1441,1,1537149442,2,15,'监控项 [HDFS] [29315] Host [数据质量管理系统]','10.10.10.111',0,''),(1442,1,1537149442,2,15,'监控项 [hadoopVersion] [29316] Host [数据质量管理系统]','10.10.10.111',0,''),(1443,1,1537149442,2,15,'监控项 [Ambari] [29321] Host [数据质量管理系统]','10.10.10.111',0,''),(1444,1,1537149442,2,15,'监控项 [MAPREDUCE2] [29334] Host [数据质量管理系统]','10.10.10.111',0,''),(1445,1,1537149450,2,15,'监控项 [Procs] [29285] Host [数据质量管理系统]','10.10.10.111',0,''),(1446,1,1537149450,2,15,'监控项 [nameNodeState] [29287] Host [数据质量管理系统]','10.10.10.111',0,''),(1447,1,1537149450,2,15,'监控项 [Nodes] [29288] Host [数据质量管理系统]','10.10.10.111',0,''),(1448,1,1537149450,2,15,'监控项 [warningAlertDetails] [29296] Host [数据质量管理系统]','10.10.10.111',0,''),(1449,1,1537149450,2,15,'监控项 [warningAlertNum] [29297] Host [数据质量管理系统]','10.10.10.111',0,''),(1450,1,1537149450,2,15,'监控项 [unknownHostNum] [29300] Host [数据质量管理系统]','10.10.10.111',0,''),(1451,1,1537149450,2,15,'监控项 [unhealthyHostNum] [29301] Host [数据质量管理系统]','10.10.10.111',0,''),(1452,1,1537149450,2,15,'监控项 [CUser] [29310] Host [数据质量管理系统]','10.10.10.111',0,''),(1453,1,1537149450,2,15,'监控项 [CSystem] [29311] Host [数据质量管理系统]','10.10.10.111',0,''),(1454,1,1537149450,2,15,'监控项 [criticalAlertNum] [29312] Host [数据质量管理系统]','10.10.10.111',0,''),(1455,1,1537149450,2,15,'监控项 [diskUsagePercent] [29313] Host [数据质量管理系统]','10.10.10.111',0,''),(1456,1,1537149450,2,15,'监控项 [criticalAlertDetails] [29317] Host [数据质量管理系统]','10.10.10.111',0,''),(1457,1,1537149450,2,15,'监控项 [CPUs] [29318] Host [数据质量管理系统]','10.10.10.111',0,''),(1458,1,1537149450,2,15,'监控项 [alertHostNum] [29320] Host [数据质量管理系统]','10.10.10.111',0,''),(1459,1,1537149450,2,15,'监控项 [CNice] [29323] Host [数据质量管理系统]','10.10.10.111',0,''),(1460,1,1537149450,2,15,'监控项 [CIdle] [29324] Host [数据质量管理系统]','10.10.10.111',0,''),(1461,1,1537149450,2,15,'监控项 [min] [29330] Host [数据质量管理系统]','10.10.10.111',0,''),(1462,1,1537149450,2,15,'监控项 [Mbuffer] [29333] Host [数据质量管理系统]','10.10.10.111',0,''),(1463,1,1537149450,2,15,'监控项 [healthyHostNum] [29336] Host [数据质量管理系统]','10.10.10.111',0,''),(1464,1,1537149450,2,15,'监控项 [lostHostNum] [29339] Host [数据质量管理系统]','10.10.10.111',0,''),(1465,1,1537149494,2,15,'监控项 [warningAlertDetails] [29231] Host [领导驾驶舱]','10.10.10.111',0,''),(1466,1,1537149494,2,15,'监控项 [ZooKeeper] [29233] Host [领导驾驶舱]','10.10.10.111',0,''),(1467,1,1537149494,2,15,'监控项 [YARN] [29234] Host [领导驾驶舱]','10.10.10.111',0,''),(1468,1,1537149494,2,15,'监控项 [unknownHostNum] [29235] Host [领导驾驶舱]','10.10.10.111',0,''),(1469,1,1537149494,2,15,'监控项 [unhealthyHostNum] [29236] Host [领导驾驶舱]','10.10.10.111',0,''),(1470,1,1537149494,2,15,'监控项 [StandbyHBaseMaster] [29237] Host [领导驾驶舱]','10.10.10.111',0,''),(1471,1,1537149494,2,15,'监控项 [MUse] [29243] Host [领导驾驶舱]','10.10.10.111',0,''),(1472,1,1537149494,2,15,'监控项 [MTotal] [29244] Host [领导驾驶舱]','10.10.10.111',0,''),(1473,1,1537149494,2,15,'监控项 [CUser] [29245] Host [领导驾驶舱]','10.10.10.111',0,''),(1474,1,1537149494,2,15,'监控项 [CSystem] [29246] Host [领导驾驶舱]','10.10.10.111',0,''),(1475,1,1537149494,2,15,'监控项 [criticalAlertNum] [29247] Host [领导驾驶舱]','10.10.10.111',0,''),(1476,1,1537149494,2,15,'监控项 [diskUsagePercent] [29248] Host [领导驾驶舱]','10.10.10.111',0,''),(1477,1,1537149494,2,15,'监控项 [DRPCSERVER] [29249] Host [领导驾驶舱]','10.10.10.111',0,''),(1478,1,1537149494,2,15,'监控项 [HDFS] [29250] Host [领导驾驶舱]','10.10.10.111',0,''),(1479,1,1537149494,2,15,'监控项 [hadoopVersion] [29251] Host [领导驾驶舱]','10.10.10.111',0,''),(1480,1,1537149494,2,15,'监控项 [criticalAlertDetails] [29252] Host [领导驾驶舱]','10.10.10.111',0,''),(1481,1,1537149494,2,15,'监控项 [CPUs] [29253] Host [领导驾驶舱]','10.10.10.111',0,''),(1482,1,1537149494,2,15,'监控项 [Mcache] [29263] Host [领导驾驶舱]','10.10.10.111',0,''),(1483,1,1537149494,2,15,'监控项 [ActiveHBaseMaster] [29276] Host [领导驾驶舱]','10.10.10.111',0,''),(1484,1,1537149507,2,15,'监控项 [RegionServers] [29212] Host [领导驾驶舱]','10.10.10.111',0,''),(1485,1,1537149507,2,15,'监控项 [regions] [29213] Host [领导驾驶舱]','10.10.10.111',0,''),(1486,1,1537149507,2,15,'监控项 [RANGER] [29214] Host [领导驾驶舱]','10.10.10.111',0,''),(1487,1,1537149507,2,15,'监控项 [reservedContainers] [29215] Host [领导驾驶舱]','10.10.10.111',0,''),(1488,1,1537149507,2,15,'监控项 [rpcProcessingTime] [29216] Host [领导驾驶舱]','10.10.10.111',0,''),(1489,1,1537149507,2,15,'监控项 [ServiceComponentInfo] [29217] Host [领导驾驶舱]','10.10.10.111',0,''),(1490,1,1537149507,2,15,'监控项 [rpcQueueTime] [29218] Host [领导驾驶舱]','10.10.10.111',0,''),(1491,1,1537149507,2,15,'监控项 [QQZIE] [29219] Host [领导驾驶舱]','10.10.10.111',0,''),(1492,1,1537149507,2,15,'监控项 [Procs] [29220] Host [领导驾驶舱]','10.10.10.111',0,''),(1493,1,1537149507,2,15,'监控项 [NodeManager] [29221] Host [领导驾驶舱]','10.10.10.111',0,''),(1494,1,1537149507,2,15,'监控项 [nameNodeState] [29222] Host [领导驾驶舱]','10.10.10.111',0,''),(1495,1,1537149507,2,15,'监控项 [Nodes] [29223] Host [领导驾驶舱]','10.10.10.111',0,''),(1496,1,1537149507,2,15,'监控项 [numOpenConnections] [29224] Host [领导驾驶舱]','10.10.10.111',0,''),(1497,1,1537149507,2,15,'监控项 [PIG] [29225] Host [领导驾驶舱]','10.10.10.111',0,''),(1498,1,1537149507,2,15,'监控项 [pendingContainers] [29226] Host [领导驾驶舱]','10.10.10.111',0,''),(1499,1,1537149507,2,15,'监控项 [SNameNodeState] [29227] Host [领导驾驶舱]','10.10.10.111',0,''),(1500,1,1537149507,2,15,'监控项 [SPARK] [29228] Host [领导驾驶舱]','10.10.10.111',0,''),(1501,1,1537149507,2,15,'监控项 [VHive] [29229] Host [领导驾驶舱]','10.10.10.111',0,''),(1502,1,1537149507,2,15,'监控项 [VHbase] [29230] Host [领导驾驶舱]','10.10.10.111',0,''),(1503,1,1537149507,2,15,'监控项 [warningAlertNum] [29232] Host [领导驾驶舱]','10.10.10.111',0,''),(1504,1,1537149507,2,15,'监控项 [SQOOP] [29238] Host [领导驾驶舱]','10.10.10.111',0,''),(1505,1,1537149507,2,15,'监控项 [storefiles] [29239] Host [领导驾驶舱]','10.10.10.111',0,''),(1506,1,1537149507,2,15,'监控项 [STORMUISERVER] [29240] Host [领导驾驶舱]','10.10.10.111',0,''),(1507,1,1537149507,2,15,'监控项 [TEZ] [29241] Host [领导驾驶舱]','10.10.10.111',0,''),(1508,1,1537149507,2,15,'监控项 [SUPERVISOR] [29242] Host [领导驾驶舱]','10.10.10.111',0,''),(1509,1,1537149507,2,15,'监控项 [allocatedContainers] [29254] Host [领导驾驶舱]','10.10.10.111',0,''),(1510,1,1537149507,2,15,'监控项 [alertHostNum] [29255] Host [领导驾驶舱]','10.10.10.111',0,''),(1511,1,1537149507,2,15,'监控项 [Ambari] [29256] Host [领导驾驶舱]','10.10.10.111',0,''),(1512,1,1537149507,2,15,'监控项 [AppTimelineServer] [29257] Host [领导驾驶舱]','10.10.10.111',0,''),(1513,1,1537149507,2,15,'监控项 [CNice] [29258] Host [领导驾驶舱]','10.10.10.111',0,''),(1514,1,1537149507,2,15,'监控项 [CIdle] [29259] Host [领导驾驶舱]','10.10.10.111',0,''),(1515,1,1537149507,2,15,'监控项 [HDFSDataNodeState] [29260] Host [领导驾驶舱]','10.10.10.111',0,''),(1516,1,1537149507,2,15,'监控项 [HDFSnameNodeState] [29261] Host [领导驾驶舱]','10.10.10.111',0,''),(1517,1,1537149507,2,15,'监控项 [memHeapCommittedM] [29262] Host [领导驾驶舱]','10.10.10.111',0,''),(1518,1,1537149507,2,15,'监控项 [memHeapUsedM] [29264] Host [领导驾驶舱]','10.10.10.111',0,''),(1519,1,1537149507,2,15,'监控项 [min] [29265] Host [领导驾驶舱]','10.10.10.111',0,''),(1520,1,1537149507,2,15,'监控项 [MSwap] [29266] Host [领导驾驶舱]','10.10.10.111',0,''),(1521,1,1537149507,2,15,'监控项 [MShare] [29267] Host [领导驾驶舱]','10.10.10.111',0,''),(1522,1,1537149507,2,15,'监控项 [Mbuffer] [29268] Host [领导驾驶舱]','10.10.10.111',0,''),(1523,1,1537149507,2,15,'监控项 [MAPREDUCE2] [29269] Host [领导驾驶舱]','10.10.10.111',0,''),(1524,1,1537149507,2,15,'监控项 [HistoryServer] [29270] Host [领导驾驶舱]','10.10.10.111',0,''),(1525,1,1537149507,2,15,'监控项 [healthyHostNum] [29271] Host [领导驾驶舱]','10.10.10.111',0,''),(1526,1,1537149507,2,15,'监控项 [HiveMetastore] [29272] Host [领导驾驶舱]','10.10.10.111',0,''),(1527,1,1537149507,2,15,'监控项 [HiveServer2] [29273] Host [领导驾驶舱]','10.10.10.111',0,''),(1528,1,1537149507,2,15,'监控项 [lostHostNum] [29274] Host [领导驾驶舱]','10.10.10.111',0,''),(1529,1,1537149507,2,15,'监控项 [KAFKABROKER] [29275] Host [领导驾驶舱]','10.10.10.111',0,''),(1530,1,1537149705,3,0,'','10.10.10.111',0,''),(1531,1,1537151677,1,19,'Name [本地拓扑图]','10.10.10.111',0,''),(1532,1,1537151774,1,19,'Name [本地拓扑图]','10.10.10.111',0,''),(1533,1,1537151815,3,0,'','10.10.10.111',0,''),(1534,2,1537151815,3,0,'','10.10.10.111',0,''),(1535,1,1537151815,3,0,'','10.10.10.111',0,''),(1536,1,1537154500,2,13,'0','10.10.10.111',15962,'大数据管理系统失去响应'),(1537,1,1537154500,2,15,'监控项 [sbd.smcs.status] [29096] Host [大数据管理系统]','10.10.10.111',0,''),(1538,1,1537154501,2,15,'监控项 [MTotal] [29343] Host [大数据管理系统]','10.10.10.111',0,''),(1539,1,1537154501,2,15,'监控项 [MUse] [29344] Host [大数据管理系统]','10.10.10.111',0,''),(1540,1,1537154501,2,15,'监控项 [CUser] [29345] Host [大数据管理系统]','10.10.10.111',0,''),(1541,1,1537154501,2,15,'监控项 [CSystem] [29346] Host [大数据管理系统]','10.10.10.111',0,''),(1542,1,1537154501,2,15,'监控项 [criticalAlertNum] [29347] Host [大数据管理系统]','10.10.10.111',0,''),(1543,1,1537154501,2,15,'监控项 [TEZ] [29349] Host [大数据管理系统]','10.10.10.111',0,''),(1544,1,1537154501,2,15,'监控项 [StandbyHBaseMaster] [29350] Host [大数据管理系统]','10.10.10.111',0,''),(1545,1,1537154501,2,15,'监控项 [SQOOP] [29351] Host [大数据管理系统]','10.10.10.111',0,''),(1546,1,1537154501,2,15,'监控项 [storefiles] [29352] Host [大数据管理系统]','10.10.10.111',0,''),(1547,1,1537154501,2,15,'监控项 [STORMUISERVER] [29353] Host [大数据管理系统]','10.10.10.111',0,''),(1548,1,1537154501,2,15,'监控项 [diskUsagePercent] [29354] Host [大数据管理系统]','10.10.10.111',0,''),(1549,1,1537154501,2,15,'监控项 [criticalAlertDetails] [29355] Host [大数据管理系统]','10.10.10.111',0,''),(1550,1,1537154501,2,15,'监控项 [Mcache] [29356] Host [大数据管理系统]','10.10.10.111',0,''),(1551,1,1537154501,2,15,'监控项 [memHeapUsedM] [29357] Host [大数据管理系统]','10.10.10.111',0,''),(1552,1,1537154501,2,15,'监控项 [min] [29358] Host [大数据管理系统]','10.10.10.111',0,''),(1553,1,1537154501,2,15,'监控项 [rpcProcessingTime] [29374] Host [大数据管理系统]','10.10.10.111',0,''),(1554,1,1537154501,2,15,'监控项 [RegionServers] [29375] Host [大数据管理系统]','10.10.10.111',0,''),(1555,1,1537154501,2,15,'监控项 [regions] [29376] Host [大数据管理系统]','10.10.10.111',0,''),(1556,1,1537154501,2,15,'监控项 [RANGER] [29377] Host [大数据管理系统]','10.10.10.111',0,''),(1557,1,1537154501,2,15,'监控项 [reservedContainers] [29378] Host [大数据管理系统]','10.10.10.111',0,''),(1558,1,1537154501,2,15,'监控项 [Nodes] [29379] Host [大数据管理系统]','10.10.10.111',0,''),(1559,1,1537154501,2,15,'监控项 [numOpenConnections] [29380] Host [大数据管理系统]','10.10.10.111',0,''),(1560,1,1537154501,2,15,'监控项 [warningAlertDetails] [29381] Host [大数据管理系统]','10.10.10.111',0,''),(1561,1,1537154501,2,15,'监控项 [warningAlertNum] [29382] Host [大数据管理系统]','10.10.10.111',0,''),(1562,1,1537154501,2,15,'监控项 [ZooKeeper] [29383] Host [大数据管理系统]','10.10.10.111',0,''),(1563,1,1537154501,2,15,'监控项 [YARN] [29384] Host [大数据管理系统]','10.10.10.111',0,''),(1564,1,1537154501,2,15,'监控项 [VHbase] [29385] Host [大数据管理系统]','10.10.10.111',0,''),(1565,1,1537154501,2,15,'监控项 [VHive] [29386] Host [大数据管理系统]','10.10.10.111',0,''),(1566,1,1537154501,2,15,'监控项 [PIG] [29387] Host [大数据管理系统]','10.10.10.111',0,''),(1567,1,1537154501,2,15,'监控项 [pendingContainers] [29388] Host [大数据管理系统]','10.10.10.111',0,''),(1568,1,1537154501,2,15,'监控项 [SNameNodeState] [29389] Host [大数据管理系统]','10.10.10.111',0,''),(1569,1,1537154501,2,15,'监控项 [SPARK] [29390] Host [大数据管理系统]','10.10.10.111',0,''),(1570,1,1537154501,2,15,'监控项 [sbd.measure.status] [29391] Host [大数据管理系统]','10.10.10.111',0,''),(1571,1,1537154501,2,15,'监控项 [HiveMetastore] [29392] Host [大数据管理系统]','10.10.10.111',0,''),(1572,1,1537154501,2,15,'监控项 [healthyHostNum] [29393] Host [大数据管理系统]','10.10.10.111',0,''),(1573,1,1537154501,2,15,'监控项 [HistoryServer] [29394] Host [大数据管理系统]','10.10.10.111',0,''),(1574,1,1537154501,2,15,'监控项 [HiveServer2] [29395] Host [大数据管理系统]','10.10.10.111',0,''),(1575,1,1537154501,2,15,'监控项 [lostHostNum] [29396] Host [大数据管理系统]','10.10.10.111',0,''),(1576,1,1537154501,2,15,'监控项 [ActiveHBaseMaster] [29397] Host [大数据管理系统]','10.10.10.111',0,''),(1577,1,1537154501,2,15,'监控项 [KAFKABROKER] [29398] Host [大数据管理系统]','10.10.10.111',0,''),(1578,1,1537154501,2,15,'监控项 [MAPREDUCE2] [29399] Host [大数据管理系统]','10.10.10.111',0,''),(1579,1,1537154501,2,15,'监控项 [Mbuffer] [29400] Host [大数据管理系统]','10.10.10.111',0,''),(1580,1,1537154501,2,15,'监控项 [CPUs] [29401] Host [大数据管理系统]','10.10.10.111',0,''),(1581,1,1537154501,2,15,'监控项 [hadoopVersion] [29402] Host [大数据管理系统]','10.10.10.111',0,''),(1582,1,1537154501,2,15,'监控项 [HDFS] [29403] Host [大数据管理系统]','10.10.10.111',0,''),(1583,1,1537154501,2,15,'监控项 [allocatedContainers] [29404] Host [大数据管理系统]','10.10.10.111',0,''),(1584,1,1537154501,2,15,'监控项 [alertHostNum] [29405] Host [大数据管理系统]','10.10.10.111',0,''),(1585,1,1537154501,2,15,'监控项 [MShare] [29406] Host [大数据管理系统]','10.10.10.111',0,''),(1586,1,1537154501,2,15,'监控项 [Ambari] [29407] Host [大数据管理系统]','10.10.10.111',0,''),(1587,1,1537154501,2,15,'监控项 [DRPCSERVER] [29408] Host [大数据管理系统]','10.10.10.111',0,''),(1588,1,1537154595,2,15,'监控项 [SUPERVISOR] [29348] Host [大数据管理系统]','10.10.10.111',0,''),(1589,1,1537154595,2,15,'监控项 [MSwap] [29359] Host [大数据管理系统]','10.10.10.111',0,''),(1590,1,1537154595,2,15,'监控项 [memHeapCommittedM] [29360] Host [大数据管理系统]','10.10.10.111',0,''),(1591,1,1537154595,2,15,'监控项 [HDFSnameNodeState] [29361] Host [大数据管理系统]','10.10.10.111',0,''),(1592,1,1537154595,2,15,'监控项 [AppTimelineServer] [29362] Host [大数据管理系统]','10.10.10.111',0,''),(1593,1,1537154595,2,15,'监控项 [CNice] [29363] Host [大数据管理系统]','10.10.10.111',0,''),(1594,1,1537154595,2,15,'监控项 [CIdle] [29364] Host [大数据管理系统]','10.10.10.111',0,''),(1595,1,1537154595,2,15,'监控项 [HDFSDataNodeState] [29365] Host [大数据管理系统]','10.10.10.111',0,''),(1596,1,1537154595,2,15,'监控项 [unhealthyHostNum] [29366] Host [大数据管理系统]','10.10.10.111',0,''),(1597,1,1537154595,2,15,'监控项 [unknownHostNum] [29367] Host [大数据管理系统]','10.10.10.111',0,''),(1598,1,1537154595,2,15,'监控项 [QQZIE] [29368] Host [大数据管理系统]','10.10.10.111',0,''),(1599,1,1537154595,2,15,'监控项 [rpcQueueTime] [29369] Host [大数据管理系统]','10.10.10.111',0,''),(1600,1,1537154595,2,15,'监控项 [Procs] [29370] Host [大数据管理系统]','10.10.10.111',0,''),(1601,1,1537154595,2,15,'监控项 [NodeManager] [29371] Host [大数据管理系统]','10.10.10.111',0,''),(1602,1,1537154595,2,15,'监控项 [nameNodeState] [29372] Host [大数据管理系统]','10.10.10.111',0,''),(1603,1,1537154595,2,15,'监控项 [ServiceComponentInfo] [29373] Host [大数据管理系统]','10.10.10.111',0,''),(1604,1,1537154698,2,15,'监控项 [sbd.measure.status] [29457] Host [大数据管理系统]','10.10.10.111',0,''),(1605,2,1537155879,3,0,'','10.10.10.111',0,''),(1606,1,1537155879,3,0,'','10.10.10.111',0,''),(1607,1,1537158256,3,0,'','10.10.10.111',0,''),(1608,1,1537159670,0,30,'0','10.10.10.111',10276,'big-manage-template'),(1609,1,1537159707,1,30,'0','10.10.10.111',10257,'items-user'),(1610,1,1537160656,1,15,'监控项 [TEZ] [29415] Host [大数据管理系统] 历史已清除','10.10.10.111',0,''),(1611,1,1537160656,1,15,'监控项 [SQOOP] [29417] Host [大数据管理系统] 历史已清除','10.10.10.111',0,''),(1612,1,1537160656,1,15,'监控项 [QQZIE] [29434] Host [大数据管理系统] 历史已清除','10.10.10.111',0,''),(1613,1,1537160656,1,15,'监控项 [RANGER] [29443] Host [大数据管理系统] 历史已清除','10.10.10.111',0,''),(1614,1,1537160656,1,15,'监控项 [ZooKeeper] [29449] Host [大数据管理系统] 历史已清除','10.10.10.111',0,''),(1615,1,1537160656,1,15,'监控项 [YARN] [29450] Host [大数据管理系统] 历史已清除','10.10.10.111',0,''),(1616,1,1537160656,1,15,'监控项 [VHbase] [29451] Host [大数据管理系统] 历史已清除','10.10.10.111',0,''),(1617,1,1537160656,1,15,'监控项 [VHive] [29452] Host [大数据管理系统] 历史已清除','10.10.10.111',0,''),(1618,1,1537160656,1,15,'监控项 [PIG] [29453] Host [大数据管理系统] 历史已清除','10.10.10.111',0,''),(1619,1,1537160656,1,15,'监控项 [SPARK] [29456] Host [大数据管理系统] 历史已清除','10.10.10.111',0,''),(1620,1,1537160656,1,15,'监控项 [MAPREDUCE2] [29465] Host [大数据管理系统] 历史已清除','10.10.10.111',0,''),(1621,1,1537160656,1,15,'监控项 [hadoopVersion] [29468] Host [大数据管理系统] 历史已清除','10.10.10.111',0,''),(1622,1,1537160656,1,15,'监控项 [HDFS] [29469] Host [大数据管理系统] 历史已清除','10.10.10.111',0,''),(1623,1,1537160656,1,15,'监控项 [Ambari] [29473] Host [大数据管理系统] 历史已清除','10.10.10.111',0,''),(1624,1,1537160990,0,13,'0','10.10.10.111',15981,'大数据管理系统失去响应'),(1625,2,1537161938,3,0,'','10.10.10.27',0,''),(1626,1,1537161938,3,0,'','10.10.10.27',0,''),(1627,1,1537161975,1,15,'监控项 [TEZ] [29415] Host [大数据管理系统] 历史已清除','10.10.10.111',0,''),(1628,1,1537161975,1,15,'监控项 [SQOOP] [29417] Host [大数据管理系统] 历史已清除','10.10.10.111',0,''),(1629,1,1537161975,1,15,'监控项 [QQZIE] [29434] Host [大数据管理系统] 历史已清除','10.10.10.111',0,''),(1630,1,1537161975,1,15,'监控项 [RANGER] [29443] Host [大数据管理系统] 历史已清除','10.10.10.111',0,''),(1631,1,1537161975,1,15,'监控项 [ZooKeeper] [29449] Host [大数据管理系统] 历史已清除','10.10.10.111',0,''),(1632,1,1537161975,1,15,'监控项 [YARN] [29450] Host [大数据管理系统] 历史已清除','10.10.10.111',0,''),(1633,1,1537161975,1,15,'监控项 [VHbase] [29451] Host [大数据管理系统] 历史已清除','10.10.10.111',0,''),(1634,1,1537161975,1,15,'监控项 [VHive] [29452] Host [大数据管理系统] 历史已清除','10.10.10.111',0,''),(1635,1,1537161975,1,15,'监控项 [PIG] [29453] Host [大数据管理系统] 历史已清除','10.10.10.111',0,''),(1636,1,1537161975,1,15,'监控项 [SPARK] [29456] Host [大数据管理系统] 历史已清除','10.10.10.111',0,''),(1637,1,1537161975,1,15,'监控项 [MAPREDUCE2] [29465] Host [大数据管理系统] 历史已清除','10.10.10.111',0,''),(1638,1,1537161975,1,15,'监控项 [hadoopVersion] [29468] Host [大数据管理系统] 历史已清除','10.10.10.111',0,''),(1639,1,1537161975,1,15,'监控项 [HDFS] [29469] Host [大数据管理系统] 历史已清除','10.10.10.111',0,''),(1640,1,1537161975,1,15,'监控项 [Ambari] [29473] Host [大数据管理系统] 历史已清除','10.10.10.111',0,''),(1641,2,1537163182,3,0,'','10.10.10.111',0,''),(1642,1,1537163182,3,0,'','10.10.10.111',0,''),(1643,1,1537164107,3,0,'','10.10.10.111',0,''),(1644,1,1537166301,3,0,'','10.10.10.111',0,''),(1645,1,1537166317,3,0,'','10.10.10.111',0,''),(1646,2,1537168826,3,0,'','10.10.10.111',0,''),(1647,1,1537168826,3,0,'','10.10.10.111',0,''),(1648,2,1537169125,3,0,'','10.10.10.108',0,''),(1649,1,1537169125,3,0,'','10.10.10.108',0,''),(1650,2,1537169399,3,0,'','10.10.10.111',0,''),(1651,2,1537169399,3,0,'','10.10.10.111',0,''),(1652,2,1537169399,3,0,'','10.10.10.111',0,''),(1653,2,1537169399,3,0,'','10.10.10.111',0,''),(1654,2,1537169399,3,0,'','10.10.10.111',0,''),(1655,2,1537169399,3,0,'','10.10.10.111',0,''),(1656,2,1537169399,3,0,'','10.10.10.111',0,''),(1657,2,1537169399,3,0,'','10.10.10.111',0,''),(1658,2,1537169400,3,0,'','10.10.10.111',0,''),(1659,2,1537169400,3,0,'','10.10.10.111',0,''),(1660,2,1537169400,3,0,'','10.10.10.111',0,''),(1661,2,1537169400,3,0,'','10.10.10.111',0,''),(1662,2,1537169400,3,0,'','10.10.10.111',0,''),(1663,2,1537169400,3,0,'','10.10.10.111',0,''),(1664,2,1537169400,3,0,'','10.10.10.111',0,''),(1665,2,1537169400,3,0,'','10.10.10.111',0,''),(1666,2,1537169400,3,0,'','10.10.10.111',0,''),(1667,2,1537169400,3,0,'','10.10.10.111',0,''),(1668,2,1537169400,3,0,'','10.10.10.111',0,''),(1669,2,1537169400,3,0,'','10.10.10.111',0,''),(1670,2,1537169400,3,0,'','10.10.10.111',0,''),(1671,2,1537169400,3,0,'','10.10.10.111',0,''),(1672,2,1537169400,3,0,'','10.10.10.111',0,''),(1673,2,1537169400,3,0,'','10.10.10.111',0,''),(1674,2,1537169401,3,0,'','10.10.10.111',0,''),(1675,2,1537169401,3,0,'','10.10.10.111',0,''),(1676,2,1537169401,3,0,'','10.10.10.111',0,''),(1677,2,1537169401,3,0,'','10.10.10.111',0,''),(1678,2,1537169401,3,0,'','10.10.10.111',0,''),(1679,2,1537169401,3,0,'','10.10.10.111',0,''),(1680,2,1537169401,3,0,'','10.10.10.111',0,''),(1681,2,1537169401,3,0,'','10.10.10.111',0,''),(1682,2,1537169401,3,0,'','10.10.10.111',0,''),(1683,2,1537169401,3,0,'','10.10.10.111',0,''),(1684,2,1537169401,3,0,'','10.10.10.111',0,''),(1685,2,1537169401,3,0,'','10.10.10.111',0,''),(1686,2,1537169401,3,0,'','10.10.10.111',0,''),(1687,2,1537169401,3,0,'','10.10.10.111',0,''),(1688,2,1537169402,3,0,'','10.10.10.111',0,''),(1689,2,1537169402,3,0,'','10.10.10.111',0,''),(1690,2,1537169402,3,0,'','10.10.10.111',0,''),(1691,2,1537169402,3,0,'','10.10.10.111',0,''),(1692,2,1537169402,3,0,'','10.10.10.111',0,''),(1693,2,1537169402,3,0,'','10.10.10.111',0,''),(1694,2,1537169402,3,0,'','10.10.10.111',0,''),(1695,2,1537169402,3,0,'','10.10.10.111',0,''),(1696,2,1537169402,3,0,'','10.10.10.111',0,''),(1697,2,1537169402,3,0,'','10.10.10.111',0,''),(1698,2,1537169402,3,0,'','10.10.10.111',0,''),(1699,2,1537169402,3,0,'','10.10.10.111',0,''),(1700,2,1537169402,3,0,'','10.10.10.111',0,''),(1701,2,1537169402,3,0,'','10.10.10.111',0,''),(1702,2,1537169403,3,0,'','10.10.10.111',0,''),(1703,2,1537169403,3,0,'','10.10.10.111',0,''),(1704,2,1537169403,3,0,'','10.10.10.111',0,''),(1705,2,1537169403,3,0,'','10.10.10.111',0,''),(1706,2,1537169403,3,0,'','10.10.10.111',0,''),(1707,2,1537169403,3,0,'','10.10.10.111',0,''),(1708,2,1537169403,3,0,'','10.10.10.111',0,''),(1709,2,1537169403,3,0,'','10.10.10.111',0,''),(1710,2,1537169403,3,0,'','10.10.10.111',0,''),(1711,2,1537169403,3,0,'','10.10.10.111',0,''),(1712,2,1537169403,3,0,'','10.10.10.111',0,''),(1713,2,1537169403,3,0,'','10.10.10.111',0,''),(1714,2,1537169403,3,0,'','10.10.10.111',0,''),(1715,2,1537169403,3,0,'','10.10.10.111',0,''),(1716,2,1537169404,3,0,'','10.10.10.111',0,''),(1717,2,1537169404,3,0,'','10.10.10.111',0,''),(1718,2,1537169404,3,0,'','10.10.10.111',0,''),(1719,2,1537169404,3,0,'','10.10.10.111',0,''),(1720,2,1537169404,3,0,'','10.10.10.111',0,''),(1721,2,1537169404,3,0,'','10.10.10.111',0,''),(1722,2,1537169404,3,0,'','10.10.10.111',0,''),(1723,2,1537169404,3,0,'','10.10.10.111',0,''),(1724,2,1537169404,3,0,'','10.10.10.111',0,''),(1725,2,1537169404,3,0,'','10.10.10.111',0,''),(1726,2,1537169409,3,0,'','10.10.10.111',0,''),(1727,2,1537169409,3,0,'','10.10.10.111',0,''),(1728,2,1537169409,3,0,'','10.10.10.111',0,''),(1729,2,1537169409,3,0,'','10.10.10.111',0,''),(1730,2,1537169410,3,0,'','10.10.10.111',0,''),(1731,2,1537169410,3,0,'','10.10.10.111',0,''),(1732,2,1537169410,3,0,'','10.10.10.111',0,''),(1733,2,1537169410,3,0,'','10.10.10.111',0,''),(1734,2,1537169410,3,0,'','10.10.10.111',0,''),(1735,2,1537169410,3,0,'','10.10.10.111',0,''),(1736,2,1537169410,3,0,'','10.10.10.111',0,''),(1737,2,1537169410,3,0,'','10.10.10.111',0,''),(1738,2,1537169410,3,0,'','10.10.10.111',0,''),(1739,2,1537169410,3,0,'','10.10.10.111',0,''),(1740,2,1537169410,3,0,'','10.10.10.111',0,''),(1741,2,1537169410,3,0,'','10.10.10.111',0,''),(1742,2,1537169410,3,0,'','10.10.10.111',0,''),(1743,2,1537169410,3,0,'','10.10.10.111',0,''),(1744,2,1537169410,3,0,'','10.10.10.111',0,''),(1745,2,1537169410,3,0,'','10.10.10.111',0,''),(1746,2,1537169411,3,0,'','10.10.10.111',0,''),(1747,2,1537169411,3,0,'','10.10.10.111',0,''),(1748,2,1537169411,3,0,'','10.10.10.111',0,''),(1749,2,1537169411,3,0,'','10.10.10.111',0,''),(1750,2,1537169411,3,0,'','10.10.10.111',0,''),(1751,2,1537169411,3,0,'','10.10.10.111',0,''),(1752,2,1537169411,3,0,'','10.10.10.111',0,''),(1753,2,1537169411,3,0,'','10.10.10.111',0,''),(1754,2,1537169411,3,0,'','10.10.10.111',0,''),(1755,2,1537169411,3,0,'','10.10.10.111',0,''),(1756,2,1537169411,3,0,'','10.10.10.111',0,''),(1757,2,1537169411,3,0,'','10.10.10.111',0,''),(1758,2,1537169411,3,0,'','10.10.10.111',0,''),(1759,2,1537169411,3,0,'','10.10.10.111',0,''),(1760,2,1537169411,3,0,'','10.10.10.111',0,''),(1761,2,1537169411,3,0,'','10.10.10.111',0,''),(1762,2,1537169412,3,0,'','10.10.10.111',0,''),(1763,2,1537169412,3,0,'','10.10.10.111',0,''),(1764,2,1537169412,3,0,'','10.10.10.111',0,''),(1765,2,1537169412,3,0,'','10.10.10.111',0,''),(1766,2,1537169412,3,0,'','10.10.10.111',0,''),(1767,2,1537169412,3,0,'','10.10.10.111',0,''),(1768,1,1537169857,3,0,'','10.10.10.108',0,''),(1769,1,1537170215,3,0,'','10.10.10.108',0,''),(1770,1,1537178350,3,0,'','10.10.10.111',0,''),(1771,1,1537178578,0,6,'Graph [按时间统计同步任务数据量]','10.10.10.111',0,''),(1772,1,1537178683,0,6,'Graph [集群健康节点个数]','10.10.10.111',0,''),(1773,1,1537178723,0,6,'Graph [集群磁盘使用率]','10.10.10.111',0,''),(1774,1,1537178829,0,20,'0','10.10.10.111',23,'集群状态'),(1775,1,1537178845,1,20,'Cell changed  coordinates \"0,0\" resource type \"0\"','10.10.10.111',23,'集群状态'),(1776,1,1537178877,0,6,'Graph [集群一般告警个数]','10.10.10.111',0,''),(1777,1,1537178897,0,6,'Graph [集群严重告警个数]','10.10.10.111',0,''),(1778,1,1537178911,0,6,'Graph [集群告警节点个数]','10.10.10.111',0,''),(1779,1,1537178924,0,6,'Graph [集群失联节点个数]','10.10.10.111',0,''),(1780,1,1537178963,0,6,'Graph [HDFS分区数量]','10.10.10.111',0,''),(1781,1,1537179073,0,6,'Graph [集群状态]','10.10.10.111',0,''),(1782,1,1537179120,0,6,'Graph [HDFS文件存储数量]','10.10.10.111',0,''),(1783,1,1537179144,0,6,'Graph [Yarn保留容器个数]','10.10.10.111',0,''),(1784,1,1537179156,0,6,'Graph [Yarn分配容器个数]','10.10.10.111',0,''),(1785,1,1537179168,0,6,'Graph [Yarn等待调度容器个数]','10.10.10.111',0,''),(1786,1,1537179279,0,6,'Graph [集群非健康节点个数]','10.10.10.111',0,''),(1787,1,1537179304,1,20,'Cell changed  coordinates \"1,0\" resource type \"0\"','10.10.10.111',23,'集群状态'),(1788,2,1537179336,3,0,'','10.10.10.111',0,''),(1789,1,1537179336,3,0,'','10.10.10.111',0,''),(1790,1,1537179364,0,20,'0','10.10.10.111',24,'HDFS状态'),(1791,1,1537179375,1,20,'列已添加','10.10.10.111',24,'HDFS状态'),(1792,1,1537179385,1,20,'Cell changed  coordinates \"0,0\" resource type \"0\"','10.10.10.111',24,'HDFS状态'),(1793,1,1537179398,1,20,'Cell changed  coordinates \"1,0\" resource type \"0\"','10.10.10.111',24,'HDFS状态'),(1794,1,1537179426,1,20,'0','10.10.10.111',24,'HDFS分区状态'),(1795,1,1537179457,1,20,'0','10.10.10.111',23,'大数据管理系统集群状态'),(1796,1,1537180082,3,0,'','10.10.10.111',0,''),(1797,1,1537180133,0,20,'0','10.10.10.111',25,'Yarn容器状态'),(1798,1,1537180140,1,20,'列已添加','10.10.10.111',25,'Yarn容器状态'),(1799,1,1537180143,1,20,'行已经添加','10.10.10.111',25,'Yarn容器状态'),(1800,1,1537180145,1,20,'列已删除','10.10.10.111',25,'Yarn容器状态'),(1801,1,1537180149,1,20,'行已经删除','10.10.10.111',25,'Yarn容器状态'),(1802,1,1537180151,1,20,'列已添加','10.10.10.111',25,'Yarn容器状态'),(1803,1,1537180154,1,20,'列已添加','10.10.10.111',25,'Yarn容器状态'),(1804,1,1537180169,1,20,'Cell changed  coordinates \"0,0\" resource type \"0\"','10.10.10.111',25,'Yarn容器状态'),(1805,1,1537180180,1,20,'Cell changed  coordinates \"1,0\" resource type \"0\"','10.10.10.111',25,'Yarn容器状态'),(1806,1,1537180187,1,20,'行已经添加','10.10.10.111',25,'Yarn容器状态'),(1807,1,1537180190,1,20,'列已删除','10.10.10.111',25,'Yarn容器状态'),(1808,1,1537180193,1,20,'列已删除','10.10.10.111',25,'Yarn容器状态'),(1809,1,1537180197,1,20,'行已经删除','10.10.10.111',25,'Yarn容器状态'),(1810,1,1537180198,1,20,'列已添加','10.10.10.111',25,'Yarn容器状态'),(1811,1,1537180202,1,20,'行已经添加','10.10.10.111',25,'Yarn容器状态'),(1812,1,1537180213,1,20,'Cell changed  coordinates \"0,1\" resource type \"0\"','10.10.10.111',25,'Yarn容器状态'),(1813,1,1537180223,1,20,'Cell changed  coordinates \"1,1\" resource type \"0\"','10.10.10.111',25,'Yarn容器状态'),(1814,1,1537180235,1,20,'Cell changed screen itemid \"135\" resource type \"0\"','10.10.10.111',25,'Yarn容器状态'),(1815,1,1537180271,1,20,'Cell changed  coordinates \"0,0\" resource type \"0\"','10.10.10.111',25,'Yarn容器状态'),(1816,1,1537180275,1,20,'Screen items switched','10.10.10.111',25,'Yarn容器状态'),(1817,1,1537180281,2,20,'Screen itemid \"138\"','10.10.10.111',25,'Yarn容器状态'),(1818,1,1537180931,1,4,'0','10.10.10.111',10270,'bigdata-retrieval'),(1819,2,1537181325,3,0,'','10.10.10.111',0,''),(1820,1,1537181325,3,0,'','10.10.10.111',0,''),(1821,1,1537181645,0,4,'0','10.10.10.111',10277,'bigdata-retrieval1'),(1822,1,1537181645,0,13,'0','10.10.10.111',15982,'大数据检索系统'),(1823,1,1537181661,1,4,'0','10.10.10.111',10270,'bigdata-retrieval'),(1824,1,1537181668,1,4,'0','10.10.10.111',10277,'bigdata-retrieval1'),(1825,1,1537181773,1,13,'0','10.10.10.111',15966,'大数据检索系统'),(1826,1,1537181825,1,13,'0','10.10.10.111',15982,'大数据检索系统'),(1827,1,1537182004,0,4,'0','10.10.10.111',10278,'semantic-analysis'),(1828,1,1537182114,3,0,'','10.10.10.111',0,''),(1829,1,1537182141,3,0,'','10.10.10.111',0,''),(1830,1,1537182479,0,13,'0','10.10.10.111',15983,'语义分析系统运行失去响应'),(1831,1,1537182528,0,13,'0','10.10.10.111',15984,'语义分析系统运行失去响应'),(1832,1,1537184132,3,0,'','10.10.10.111',0,''),(1833,1,1537185192,3,0,'','10.10.10.111',0,''),(1834,1,1537186910,3,0,'','10.10.10.111',0,''),(1835,1,1537235601,3,0,'','10.10.10.111',0,''),(1836,1,1537235649,3,0,'','10.10.10.111',0,''),(1837,1,1537235788,0,4,'0','10.10.10.111',10279,'Image-recognition'),(1838,1,1537235864,0,4,'0','10.10.10.111',10280,'data-visualization'),(1839,1,1537235903,0,4,'0','10.10.10.111',10281,'3D-GIS-Service'),(1840,1,1537241315,0,13,'0','10.10.10.111',15985,'数据可视化系统运行状态'),(1841,1,1537242196,2,14,'0','10.10.10.111',17,'数据可视化'),(1842,1,1537242358,1,13,'0','10.10.10.111',15987,'TestAction'),(1843,1,1537242380,1,31,'0','10.10.10.111',15831,'TestAction'),(1844,2,1537252789,3,0,'','10.10.10.111',0,''),(1845,1,1537252789,3,0,'','10.10.10.111',0,''),(1846,1,1537252891,3,0,'','10.10.10.111',0,''),(1847,1,1537253038,3,0,'','10.10.10.111',0,''),(1848,2,1537267800,3,0,'','10.10.10.111',0,''),(1849,1,1537267800,3,0,'','10.10.10.111',0,''),(1850,1,1537326750,3,0,'','10.10.10.111',0,''),(1851,1,1537326770,3,0,'','10.10.10.111',0,''),(1852,2,1537327020,3,0,'','10.10.10.111',0,''),(1853,1,1537327020,3,0,'','10.10.10.111',0,''),(1854,1,1537327101,3,0,'','10.10.10.111',0,''),(1855,1,1537327131,3,0,'','10.10.10.111',0,''),(1856,1,1537327194,3,0,'','10.10.10.111',0,''),(1857,2,1537327902,3,0,'','10.10.10.108',0,''),(1858,1,1537327902,3,0,'','10.10.10.108',0,''),(1859,2,1537329418,3,0,'','10.10.10.108',0,''),(1860,1,1537329418,3,0,'','10.10.10.108',0,''),(1861,1,1537329439,3,0,'','10.10.10.108',0,''),(1862,2,1537330848,3,0,'','10.10.10.108',0,''),(1863,1,1537330848,3,0,'','10.10.10.108',0,''),(1864,1,1537330857,3,0,'','10.10.10.108',0,''),(1865,2,1537335111,3,0,'','10.10.10.111',0,''),(1866,1,1537335111,3,0,'','10.10.10.111',0,''),(1867,1,1537335126,3,0,'','10.10.10.111',0,''),(1868,2,1537335804,3,0,'','10.10.10.111',0,''),(1869,1,1537335805,3,0,'','10.10.10.111',0,''),(1870,2,1537341526,3,0,'','10.10.10.111',0,''),(1871,1,1537341527,3,0,'','10.10.10.111',0,''),(1872,1,1537341679,3,0,'','10.10.10.111',0,''),(1873,2,1537342029,3,0,'','10.10.10.111',0,''),(1874,1,1537342029,3,0,'','10.10.10.111',0,''),(1875,2,1537345582,3,0,'','10.10.10.108',0,''),(1876,1,1537345582,3,0,'','10.10.10.108',0,''),(1877,2,1537346089,3,0,'','10.10.10.108',0,''),(1878,1,1537346089,3,0,'','10.10.10.108',0,''),(1879,2,1537346485,3,0,'','10.10.10.108',0,''),(1880,1,1537346485,3,0,'','10.10.10.108',0,''),(1881,1,1537346498,3,0,'','10.10.10.108',0,''),(1882,2,1537421246,3,0,'','10.10.10.108',0,''),(1883,1,1537421246,3,0,'','10.10.10.108',0,''),(1884,2,1537421599,3,0,'','10.10.10.108',0,''),(1885,1,1537421599,3,0,'','10.10.10.108',0,''),(1886,2,1537422127,3,0,'','10.10.10.108',0,''),(1887,1,1537422127,3,0,'','10.10.10.108',0,''),(1888,1,1537422380,3,0,'','10.10.10.111',0,''),(1889,2,1537422727,3,0,'','10.10.10.111',0,''),(1890,1,1537422727,3,0,'','10.10.10.111',0,''),(1891,1,1537424303,1,20,'列已添加','10.10.10.111',23,'大数据管理系统集群状态'),(1892,1,1537424312,1,20,'行已经添加','10.10.10.111',23,'大数据管理系统集群状态'),(1893,1,1537424315,1,20,'行已经添加','10.10.10.111',23,'大数据管理系统集群状态'),(1894,1,1537424344,1,20,'行已经添加','10.10.10.111',23,'大数据管理系统集群状态'),(1895,1,1537424351,1,20,'列已添加','10.10.10.111',23,'大数据管理系统集群状态'),(1896,1,1537424354,1,20,'列已添加','10.10.10.111',23,'大数据管理系统集群状态'),(1897,1,1537424410,3,0,'','10.10.10.111',0,''),(1898,2,1537449914,3,0,'','10.10.10.27',0,''),(1899,1,1537449914,3,0,'','10.10.10.27',0,''),(1900,1,1537452233,1,0,'0','10.10.10.27',1,'Admin'),(1901,1,1537452475,1,0,'0','10.10.10.27',1,'Admin'),(1902,1,1537454110,1,0,'0','10.10.10.27',1,'Admin'),(1903,2,1537495590,3,0,'','10.10.10.111',0,''),(1904,1,1537495590,3,0,'','10.10.10.111',0,''),(1905,2,1537496790,3,0,'','10.10.10.111',0,''),(1906,1,1537496790,3,0,'','10.10.10.111',0,''),(1907,1,1537497014,1,0,'0','10.10.10.111',1,'Admin'),(1908,1,1537498786,1,0,'0','10.10.10.111',1,'Admin'),(1909,1,1537502043,3,0,'','10.10.10.111',0,''),(1910,1,1537502049,1,0,'0','10.10.10.111',1,'Admin'),(1911,2,1537502160,3,0,'','10.10.10.111',0,''),(1912,2,1537502164,3,0,'','10.10.10.111',0,''),(1913,1,1537502164,3,0,'','10.10.10.111',0,''),(1914,1,1537502403,3,0,'','10.10.10.111',0,''),(1915,1,1537512056,1,0,'0','10.10.10.111',1,'Admin'),(1916,1,1537512310,1,0,'0','10.10.10.111',1,'Admin'),(1917,1,1537512788,1,0,'0','10.10.10.111',1,'Admin'),(1918,1,1537512886,1,0,'0','10.10.10.111',1,'Admin'),(1919,1,1537513607,1,0,'0','10.10.10.111',1,'Admin'),(1920,1,1537513626,1,0,'0','10.10.10.111',1,'Admin'),(1921,1,1537513749,1,0,'0','10.10.10.111',1,'Admin'),(1922,1,1537513767,1,0,'0','10.10.10.111',1,'Admin'),(1923,1,1537521733,3,0,'','10.10.10.111',0,''),(1924,1,1537521860,1,0,'0','10.10.10.111',1,'Admin'),(1925,1,1537521956,1,0,'0','10.10.10.111',1,'Admin'),(1926,1,1537522002,3,0,'','10.10.10.111',0,''),(1927,1,1537522044,3,0,'','10.10.10.111',0,''),(1928,2,1537801330,3,0,'','10.10.10.27',0,''),(1929,1,1537801330,3,0,'','10.10.10.27',0,''),(1930,2,1537838563,3,0,'','10.10.10.27',0,''),(1931,1,1537838563,3,0,'','10.10.10.27',0,'');
/*!40000 ALTER TABLE `auditlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auditlog_details`
--

DROP TABLE IF EXISTS `auditlog_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auditlog_details` (
  `auditdetailid` bigint(20) unsigned NOT NULL,
  `auditid` bigint(20) unsigned NOT NULL,
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `field_name` varchar(64) NOT NULL DEFAULT '',
  `oldvalue` text NOT NULL,
  `newvalue` text NOT NULL,
  PRIMARY KEY (`auditdetailid`),
  KEY `auditlog_details_1` (`auditid`),
  CONSTRAINT `c_auditlog_details_1` FOREIGN KEY (`auditid`) REFERENCES `auditlog` (`auditid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auditlog_details`
--

LOCK TABLES `auditlog_details` WRITE;
/*!40000 ALTER TABLE `auditlog_details` DISABLE KEYS */;
INSERT INTO `auditlog_details` VALUES (1,14,'users','lang','en_GB','zh_CN'),(2,64,'hosts','host','data-handler','portal'),(3,114,'hosts','status','1','0'),(4,115,'hosts','status','1','0'),(5,116,'hosts','status','0','1'),(6,117,'hosts','status','1','0'),(7,120,'groups','name','大数据治理平台','大数据平台'),(8,124,'hosts','status','1','0'),(9,515,'users','autologin','1','0'),(10,571,'','status','0','1'),(11,573,'','status','1','0'),(12,602,'','status','1','0'),(13,603,'','status','0','1'),(14,604,'','status','0','1'),(15,631,'','status','1','0'),(16,632,'','status','1','0'),(17,633,'','status','1','0'),(18,634,'','status','1','0'),(19,635,'','status','1','0'),(20,636,'','status','1','0'),(21,637,'','status','1','0'),(22,638,'','status','1','0'),(23,639,'','status','1','0'),(24,640,'','status','1','0'),(25,642,'','status','1','0'),(26,644,'','status','0','1'),(27,645,'','status','0','1'),(28,646,'','status','0','1'),(29,647,'','status','0','1'),(30,648,'','status','0','1'),(31,649,'','status','0','1'),(32,650,'','status','0','1'),(33,651,'','status','0','1'),(34,652,'','status','0','1'),(35,653,'','status','0','1'),(36,654,'','status','0','1'),(37,671,'dashboard','name','Dashboard','仪表盘'),(38,906,'users','lang','zh_CN','en_GB'),(39,907,'users','lang','en_GB','zh_CN'),(40,916,'users','lang','zh_CN','en_US'),(41,917,'users','lang','en_US','zh_CN'),(42,920,'users','autologout','15m','0'),(43,923,'usrgrp','gui_access','0','2'),(44,951,'','status','1','0'),(45,952,'','status','1','0'),(46,953,'','status','1','0'),(47,954,'','status','1','0'),(48,955,'','status','1','0'),(49,956,'','status','1','0'),(50,957,'','status','1','0'),(51,958,'','status','1','0'),(52,959,'','status','1','0'),(53,960,'','status','1','0'),(54,961,'','status','1','0'),(55,962,'','status','1','0'),(56,963,'','status','1','0'),(57,964,'','status','1','0'),(58,965,'','status','1','0'),(59,966,'','status','1','0'),(60,967,'','status','1','0'),(61,968,'','status','1','0'),(62,969,'','status','0','1'),(63,970,'','status','0','1'),(64,971,'','status','0','1'),(65,972,'','status','0','1'),(66,973,'','status','0','1'),(67,974,'','status','0','1'),(68,975,'','status','0','1'),(69,976,'','status','0','1'),(70,977,'','status','0','1'),(71,978,'','status','0','1'),(72,979,'','status','0','1'),(73,980,'','status','0','1'),(74,981,'','status','0','1'),(75,982,'','status','0','1'),(76,983,'','status','0','1'),(77,984,'','status','0','1'),(78,985,'','status','0','1'),(79,990,'users','lang','zh_CN','en_US'),(80,991,'users','lang','en_US','zh_CN'),(81,992,'users','lang','zh_CN','en_US'),(82,993,'users','lang','en_US','zh_CN'),(83,996,'users','lang','zh_CN','en_US'),(84,997,'users','lang','en_US','zh_CN'),(85,1136,'groups','name','Zabbix servers','门户与监控'),(86,1137,'hosts','host','Zabbix server','zabbix-servser'),(87,1137,'hosts','name','Zabbix server','统一监控系统'),(88,1138,'hosts','status','0','1'),(89,1313,'screens','name','Zabbix server','统一监控系统'),(90,1324,'','priority','0','4'),(91,1325,'','priority','0','4'),(92,1363,'applications','name','用户的ip监控','根据用户ip监控监控用户登录次数'),(93,1364,'applications','name','用户监控','根据用户名监控用户登录次数'),(94,1365,'applications','name','系统监控','根据系统监控系统当前登录人数'),(95,1366,'applications','name','部门监控','门户系统中各部门当前登录人数监控'),(96,1367,'applications','name','根据系统监控系统当前登录人数','门户系统中各系统当前登录人数监控'),(97,1368,'applications','name','根据用户名监控用户登录次数','门户系统中各用户当前登录次数监控'),(98,1369,'applications','name','根据用户ip监控监控用户登录次数','门户系统中各ip当前登录人数监控'),(99,1370,'applications','name','指标日志审计','数据审计'),(100,1794,'screens','name','HDFS状态','HDFS分区状态'),(101,1795,'screens','name','集群状态','大数据管理系统集群状态'),(102,1818,'hosts','name','大数据检索系统','大数据检索系统2'),(103,1823,'hosts','name','大数据检索系统2','大数据检索系统2号'),(104,1824,'hosts','name','大数据检索1号系统','大数据检索系统1号'),(105,1825,'','description','大数据检索系统','大数据检索系统2号运行状态'),(106,1825,'','comments','大数据检索系统失去响应，请查看大数据检索系统运行状态','大数据检索系统2号失去响应，请查看大数据检索系统2号运行状态'),(107,1826,'','description','大数据检索系统','大数据检索系统1号运行状态'),(108,1826,'','comments','大数据检索系统失去响应，请查看大数据检索系统运行状态','大数据检索系统1号失去响应，请查看大数据检索系统1号运行状态'),(109,1842,'','status','0','1'),(110,1843,'','status','0','1'),(111,1900,'users','lang','zh_CN','en_US'),(112,1901,'users','lang','en_US','zh_CN'),(113,1902,'users','lang','zh_CN','en_US'),(114,1907,'users','lang','en_US','zh_CN'),(115,1908,'users','lang','zh_CN','en_GB'),(116,1910,'users','lang','en_GB','zh_CN'),(117,1915,'users','lang','zh_CN','en_GB'),(118,1916,'users','lang','en_GB','zh_CN'),(119,1917,'users','lang','zh_CN','en_GB'),(120,1918,'users','lang','en_GB','zh_CN'),(121,1919,'users','lang','zh_CN','en_US'),(122,1920,'users','lang','en_US','zh_CN'),(123,1921,'users','lang','zh_CN','en_US'),(124,1922,'users','lang','en_US','zh_CN'),(125,1924,'users','lang','zh_CN','en_US'),(126,1925,'users','lang','en_US','zh_CN');
/*!40000 ALTER TABLE `auditlog_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `autoreg_host`
--

DROP TABLE IF EXISTS `autoreg_host`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `autoreg_host` (
  `autoreg_hostid` bigint(20) unsigned NOT NULL,
  `proxy_hostid` bigint(20) unsigned DEFAULT NULL,
  `host` varchar(64) NOT NULL DEFAULT '',
  `listen_ip` varchar(39) NOT NULL DEFAULT '',
  `listen_port` int(11) NOT NULL DEFAULT '0',
  `listen_dns` varchar(64) NOT NULL DEFAULT '',
  `host_metadata` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`autoreg_hostid`),
  KEY `autoreg_host_1` (`proxy_hostid`,`host`),
  CONSTRAINT `c_autoreg_host_1` FOREIGN KEY (`proxy_hostid`) REFERENCES `hosts` (`hostid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autoreg_host`
--

LOCK TABLES `autoreg_host` WRITE;
/*!40000 ALTER TABLE `autoreg_host` DISABLE KEYS */;
/*!40000 ALTER TABLE `autoreg_host` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conditions`
--

DROP TABLE IF EXISTS `conditions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `conditions` (
  `conditionid` bigint(20) unsigned NOT NULL,
  `actionid` bigint(20) unsigned NOT NULL,
  `conditiontype` int(11) NOT NULL DEFAULT '0',
  `operator` int(11) NOT NULL DEFAULT '0',
  `value` varchar(255) NOT NULL DEFAULT '',
  `value2` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`conditionid`),
  KEY `conditions_1` (`actionid`),
  CONSTRAINT `c_conditions_1` FOREIGN KEY (`actionid`) REFERENCES `actions` (`actionid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conditions`
--

LOCK TABLES `conditions` WRITE;
/*!40000 ALTER TABLE `conditions` DISABLE KEYS */;
INSERT INTO `conditions` VALUES (2,2,10,0,'0',''),(3,2,8,0,'9',''),(4,2,12,2,'Linux',''),(6,4,23,0,'0',''),(7,5,23,0,'2',''),(8,6,23,0,'4',''),(9,7,3,2,'登录次数触发器','');
/*!40000 ALTER TABLE `conditions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `config`
--

DROP TABLE IF EXISTS `config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `config` (
  `configid` bigint(20) unsigned NOT NULL,
  `refresh_unsupported` varchar(32) NOT NULL DEFAULT '10m',
  `work_period` varchar(255) NOT NULL DEFAULT '1-5,09:00-18:00',
  `alert_usrgrpid` bigint(20) unsigned DEFAULT NULL,
  `event_ack_enable` int(11) NOT NULL DEFAULT '1',
  `event_expire` varchar(32) NOT NULL DEFAULT '1w',
  `event_show_max` int(11) NOT NULL DEFAULT '100',
  `default_theme` varchar(128) NOT NULL DEFAULT 'blue-theme',
  `authentication_type` int(11) NOT NULL DEFAULT '0',
  `ldap_host` varchar(255) NOT NULL DEFAULT '',
  `ldap_port` int(11) NOT NULL DEFAULT '389',
  `ldap_base_dn` varchar(255) NOT NULL DEFAULT '',
  `ldap_bind_dn` varchar(255) NOT NULL DEFAULT '',
  `ldap_bind_password` varchar(128) NOT NULL DEFAULT '',
  `ldap_search_attribute` varchar(128) NOT NULL DEFAULT '',
  `dropdown_first_entry` int(11) NOT NULL DEFAULT '1',
  `dropdown_first_remember` int(11) NOT NULL DEFAULT '1',
  `discovery_groupid` bigint(20) unsigned NOT NULL,
  `max_in_table` int(11) NOT NULL DEFAULT '50',
  `search_limit` int(11) NOT NULL DEFAULT '1000',
  `severity_color_0` varchar(6) NOT NULL DEFAULT '97AAB3',
  `severity_color_1` varchar(6) NOT NULL DEFAULT '7499FF',
  `severity_color_2` varchar(6) NOT NULL DEFAULT 'FFC859',
  `severity_color_3` varchar(6) NOT NULL DEFAULT 'FFA059',
  `severity_color_4` varchar(6) NOT NULL DEFAULT 'E97659',
  `severity_color_5` varchar(6) NOT NULL DEFAULT 'E45959',
  `severity_name_0` varchar(32) NOT NULL DEFAULT 'Not classified',
  `severity_name_1` varchar(32) NOT NULL DEFAULT 'Information',
  `severity_name_2` varchar(32) NOT NULL DEFAULT 'Warning',
  `severity_name_3` varchar(32) NOT NULL DEFAULT 'Average',
  `severity_name_4` varchar(32) NOT NULL DEFAULT 'High',
  `severity_name_5` varchar(32) NOT NULL DEFAULT 'Disaster',
  `ok_period` varchar(32) NOT NULL DEFAULT '30m',
  `blink_period` varchar(32) NOT NULL DEFAULT '30m',
  `problem_unack_color` varchar(6) NOT NULL DEFAULT 'DC0000',
  `problem_ack_color` varchar(6) NOT NULL DEFAULT 'DC0000',
  `ok_unack_color` varchar(6) NOT NULL DEFAULT '00AA00',
  `ok_ack_color` varchar(6) NOT NULL DEFAULT '00AA00',
  `problem_unack_style` int(11) NOT NULL DEFAULT '1',
  `problem_ack_style` int(11) NOT NULL DEFAULT '1',
  `ok_unack_style` int(11) NOT NULL DEFAULT '1',
  `ok_ack_style` int(11) NOT NULL DEFAULT '1',
  `snmptrap_logging` int(11) NOT NULL DEFAULT '1',
  `server_check_interval` int(11) NOT NULL DEFAULT '10',
  `hk_events_mode` int(11) NOT NULL DEFAULT '1',
  `hk_events_trigger` varchar(32) NOT NULL DEFAULT '365d',
  `hk_events_internal` varchar(32) NOT NULL DEFAULT '1d',
  `hk_events_discovery` varchar(32) NOT NULL DEFAULT '1d',
  `hk_events_autoreg` varchar(32) NOT NULL DEFAULT '1d',
  `hk_services_mode` int(11) NOT NULL DEFAULT '1',
  `hk_services` varchar(32) NOT NULL DEFAULT '365d',
  `hk_audit_mode` int(11) NOT NULL DEFAULT '1',
  `hk_audit` varchar(32) NOT NULL DEFAULT '365d',
  `hk_sessions_mode` int(11) NOT NULL DEFAULT '1',
  `hk_sessions` varchar(32) NOT NULL DEFAULT '365d',
  `hk_history_mode` int(11) NOT NULL DEFAULT '1',
  `hk_history_global` int(11) NOT NULL DEFAULT '0',
  `hk_history` varchar(32) NOT NULL DEFAULT '90d',
  `hk_trends_mode` int(11) NOT NULL DEFAULT '1',
  `hk_trends_global` int(11) NOT NULL DEFAULT '0',
  `hk_trends` varchar(32) NOT NULL DEFAULT '365d',
  `default_inventory_mode` int(11) NOT NULL DEFAULT '-1',
  PRIMARY KEY (`configid`),
  KEY `config_1` (`alert_usrgrpid`),
  KEY `config_2` (`discovery_groupid`),
  CONSTRAINT `c_config_1` FOREIGN KEY (`alert_usrgrpid`) REFERENCES `usrgrp` (`usrgrpid`),
  CONSTRAINT `c_config_2` FOREIGN KEY (`discovery_groupid`) REFERENCES `groups` (`groupid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config`
--

LOCK TABLES `config` WRITE;
/*!40000 ALTER TABLE `config` DISABLE KEYS */;
INSERT INTO `config` VALUES (1,'10m','1-5,09:00-18:00',7,1,'1w',100,'blue-theme',0,'',389,'','','','',1,1,5,50,1000,'97AAB3','7499FF','FFC859','FFA059','E97659','E45959','Not classified','Information','Warning','Average','High','Disaster','30m','30m','DC0000','DC0000','00AA00','00AA00',1,1,1,1,1,10,1,'365d','1d','1d','1d',1,'365d',1,'365d',1,'365d',1,0,'90d',1,0,'365d',-1);
/*!40000 ALTER TABLE `config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `corr_condition`
--

DROP TABLE IF EXISTS `corr_condition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `corr_condition` (
  `corr_conditionid` bigint(20) unsigned NOT NULL,
  `correlationid` bigint(20) unsigned NOT NULL,
  `type` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`corr_conditionid`),
  KEY `corr_condition_1` (`correlationid`),
  CONSTRAINT `c_corr_condition_1` FOREIGN KEY (`correlationid`) REFERENCES `correlation` (`correlationid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `corr_condition`
--

LOCK TABLES `corr_condition` WRITE;
/*!40000 ALTER TABLE `corr_condition` DISABLE KEYS */;
/*!40000 ALTER TABLE `corr_condition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `corr_condition_group`
--

DROP TABLE IF EXISTS `corr_condition_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `corr_condition_group` (
  `corr_conditionid` bigint(20) unsigned NOT NULL,
  `operator` int(11) NOT NULL DEFAULT '0',
  `groupid` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`corr_conditionid`),
  KEY `corr_condition_group_1` (`groupid`),
  CONSTRAINT `c_corr_condition_group_1` FOREIGN KEY (`corr_conditionid`) REFERENCES `corr_condition` (`corr_conditionid`) ON DELETE CASCADE,
  CONSTRAINT `c_corr_condition_group_2` FOREIGN KEY (`groupid`) REFERENCES `groups` (`groupid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `corr_condition_group`
--

LOCK TABLES `corr_condition_group` WRITE;
/*!40000 ALTER TABLE `corr_condition_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `corr_condition_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `corr_condition_tag`
--

DROP TABLE IF EXISTS `corr_condition_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `corr_condition_tag` (
  `corr_conditionid` bigint(20) unsigned NOT NULL,
  `tag` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`corr_conditionid`),
  CONSTRAINT `c_corr_condition_tag_1` FOREIGN KEY (`corr_conditionid`) REFERENCES `corr_condition` (`corr_conditionid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `corr_condition_tag`
--

LOCK TABLES `corr_condition_tag` WRITE;
/*!40000 ALTER TABLE `corr_condition_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `corr_condition_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `corr_condition_tagpair`
--

DROP TABLE IF EXISTS `corr_condition_tagpair`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `corr_condition_tagpair` (
  `corr_conditionid` bigint(20) unsigned NOT NULL,
  `oldtag` varchar(255) NOT NULL DEFAULT '',
  `newtag` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`corr_conditionid`),
  CONSTRAINT `c_corr_condition_tagpair_1` FOREIGN KEY (`corr_conditionid`) REFERENCES `corr_condition` (`corr_conditionid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `corr_condition_tagpair`
--

LOCK TABLES `corr_condition_tagpair` WRITE;
/*!40000 ALTER TABLE `corr_condition_tagpair` DISABLE KEYS */;
/*!40000 ALTER TABLE `corr_condition_tagpair` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `corr_condition_tagvalue`
--

DROP TABLE IF EXISTS `corr_condition_tagvalue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `corr_condition_tagvalue` (
  `corr_conditionid` bigint(20) unsigned NOT NULL,
  `tag` varchar(255) NOT NULL DEFAULT '',
  `operator` int(11) NOT NULL DEFAULT '0',
  `value` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`corr_conditionid`),
  CONSTRAINT `c_corr_condition_tagvalue_1` FOREIGN KEY (`corr_conditionid`) REFERENCES `corr_condition` (`corr_conditionid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `corr_condition_tagvalue`
--

LOCK TABLES `corr_condition_tagvalue` WRITE;
/*!40000 ALTER TABLE `corr_condition_tagvalue` DISABLE KEYS */;
/*!40000 ALTER TABLE `corr_condition_tagvalue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `corr_operation`
--

DROP TABLE IF EXISTS `corr_operation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `corr_operation` (
  `corr_operationid` bigint(20) unsigned NOT NULL,
  `correlationid` bigint(20) unsigned NOT NULL,
  `type` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`corr_operationid`),
  KEY `corr_operation_1` (`correlationid`),
  CONSTRAINT `c_corr_operation_1` FOREIGN KEY (`correlationid`) REFERENCES `correlation` (`correlationid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `corr_operation`
--

LOCK TABLES `corr_operation` WRITE;
/*!40000 ALTER TABLE `corr_operation` DISABLE KEYS */;
/*!40000 ALTER TABLE `corr_operation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `correlation`
--

DROP TABLE IF EXISTS `correlation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `correlation` (
  `correlationid` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `evaltype` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0',
  `formula` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`correlationid`),
  UNIQUE KEY `correlation_2` (`name`),
  KEY `correlation_1` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `correlation`
--

LOCK TABLES `correlation` WRITE;
/*!40000 ALTER TABLE `correlation` DISABLE KEYS */;
/*!40000 ALTER TABLE `correlation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dashboard`
--

DROP TABLE IF EXISTS `dashboard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dashboard` (
  `dashboardid` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `userid` bigint(20) unsigned NOT NULL,
  `private` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`dashboardid`),
  KEY `c_dashboard_1` (`userid`),
  CONSTRAINT `c_dashboard_1` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashboard`
--

LOCK TABLES `dashboard` WRITE;
/*!40000 ALTER TABLE `dashboard` DISABLE KEYS */;
INSERT INTO `dashboard` VALUES (1,'仪表盘',1,0);
/*!40000 ALTER TABLE `dashboard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dashboard_user`
--

DROP TABLE IF EXISTS `dashboard_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dashboard_user` (
  `dashboard_userid` bigint(20) unsigned NOT NULL,
  `dashboardid` bigint(20) unsigned NOT NULL,
  `userid` bigint(20) unsigned NOT NULL,
  `permission` int(11) NOT NULL DEFAULT '2',
  PRIMARY KEY (`dashboard_userid`),
  UNIQUE KEY `dashboard_user_1` (`dashboardid`,`userid`),
  KEY `c_dashboard_user_2` (`userid`),
  CONSTRAINT `c_dashboard_user_1` FOREIGN KEY (`dashboardid`) REFERENCES `dashboard` (`dashboardid`) ON DELETE CASCADE,
  CONSTRAINT `c_dashboard_user_2` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashboard_user`
--

LOCK TABLES `dashboard_user` WRITE;
/*!40000 ALTER TABLE `dashboard_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `dashboard_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dashboard_usrgrp`
--

DROP TABLE IF EXISTS `dashboard_usrgrp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dashboard_usrgrp` (
  `dashboard_usrgrpid` bigint(20) unsigned NOT NULL,
  `dashboardid` bigint(20) unsigned NOT NULL,
  `usrgrpid` bigint(20) unsigned NOT NULL,
  `permission` int(11) NOT NULL DEFAULT '2',
  PRIMARY KEY (`dashboard_usrgrpid`),
  UNIQUE KEY `dashboard_usrgrp_1` (`dashboardid`,`usrgrpid`),
  KEY `c_dashboard_usrgrp_2` (`usrgrpid`),
  CONSTRAINT `c_dashboard_usrgrp_1` FOREIGN KEY (`dashboardid`) REFERENCES `dashboard` (`dashboardid`) ON DELETE CASCADE,
  CONSTRAINT `c_dashboard_usrgrp_2` FOREIGN KEY (`usrgrpid`) REFERENCES `usrgrp` (`usrgrpid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashboard_usrgrp`
--

LOCK TABLES `dashboard_usrgrp` WRITE;
/*!40000 ALTER TABLE `dashboard_usrgrp` DISABLE KEYS */;
/*!40000 ALTER TABLE `dashboard_usrgrp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dbversion`
--

DROP TABLE IF EXISTS `dbversion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dbversion` (
  `mandatory` int(11) NOT NULL DEFAULT '0',
  `optional` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dbversion`
--

LOCK TABLES `dbversion` WRITE;
/*!40000 ALTER TABLE `dbversion` DISABLE KEYS */;
INSERT INTO `dbversion` VALUES (3040000,3040007);
/*!40000 ALTER TABLE `dbversion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dchecks`
--

DROP TABLE IF EXISTS `dchecks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dchecks` (
  `dcheckid` bigint(20) unsigned NOT NULL,
  `druleid` bigint(20) unsigned NOT NULL,
  `type` int(11) NOT NULL DEFAULT '0',
  `key_` varchar(512) NOT NULL DEFAULT '',
  `snmp_community` varchar(255) NOT NULL DEFAULT '',
  `ports` varchar(255) NOT NULL DEFAULT '0',
  `snmpv3_securityname` varchar(64) NOT NULL DEFAULT '',
  `snmpv3_securitylevel` int(11) NOT NULL DEFAULT '0',
  `snmpv3_authpassphrase` varchar(64) NOT NULL DEFAULT '',
  `snmpv3_privpassphrase` varchar(64) NOT NULL DEFAULT '',
  `uniq` int(11) NOT NULL DEFAULT '0',
  `snmpv3_authprotocol` int(11) NOT NULL DEFAULT '0',
  `snmpv3_privprotocol` int(11) NOT NULL DEFAULT '0',
  `snmpv3_contextname` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`dcheckid`),
  KEY `dchecks_1` (`druleid`),
  CONSTRAINT `c_dchecks_1` FOREIGN KEY (`druleid`) REFERENCES `drules` (`druleid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dchecks`
--

LOCK TABLES `dchecks` WRITE;
/*!40000 ALTER TABLE `dchecks` DISABLE KEYS */;
INSERT INTO `dchecks` VALUES (2,2,9,'system.uname','','10050','',0,'','',0,0,0,'');
/*!40000 ALTER TABLE `dchecks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dhosts`
--

DROP TABLE IF EXISTS `dhosts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dhosts` (
  `dhostid` bigint(20) unsigned NOT NULL,
  `druleid` bigint(20) unsigned NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `lastup` int(11) NOT NULL DEFAULT '0',
  `lastdown` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`dhostid`),
  KEY `dhosts_1` (`druleid`),
  CONSTRAINT `c_dhosts_1` FOREIGN KEY (`druleid`) REFERENCES `drules` (`druleid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dhosts`
--

LOCK TABLES `dhosts` WRITE;
/*!40000 ALTER TABLE `dhosts` DISABLE KEYS */;
INSERT INTO `dhosts` VALUES (1,2,0,1536907532,0),(2,2,0,1536907532,0),(3,2,0,1536907533,0),(4,2,0,1536907533,0),(5,2,0,1536907533,0),(6,2,0,1536907533,0),(7,2,0,1536907533,0),(8,2,0,1536914729,0),(9,2,0,1536914729,0),(10,2,0,1537184733,0);
/*!40000 ALTER TABLE `dhosts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drules`
--

DROP TABLE IF EXISTS `drules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `drules` (
  `druleid` bigint(20) unsigned NOT NULL,
  `proxy_hostid` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `iprange` varchar(2048) NOT NULL DEFAULT '',
  `delay` varchar(255) NOT NULL DEFAULT '1h',
  `nextcheck` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`druleid`),
  UNIQUE KEY `drules_2` (`name`),
  KEY `drules_1` (`proxy_hostid`),
  CONSTRAINT `c_drules_1` FOREIGN KEY (`proxy_hostid`) REFERENCES `hosts` (`hostid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drules`
--

LOCK TABLES `drules` WRITE;
/*!40000 ALTER TABLE `drules` DISABLE KEYS */;
INSERT INTO `drules` VALUES (2,NULL,'Local network','10.10.10.1-254','1h',1537843472,0);
/*!40000 ALTER TABLE `drules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dservices`
--

DROP TABLE IF EXISTS `dservices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dservices` (
  `dserviceid` bigint(20) unsigned NOT NULL,
  `dhostid` bigint(20) unsigned NOT NULL,
  `value` varchar(255) NOT NULL DEFAULT '',
  `port` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0',
  `lastup` int(11) NOT NULL DEFAULT '0',
  `lastdown` int(11) NOT NULL DEFAULT '0',
  `dcheckid` bigint(20) unsigned NOT NULL,
  `ip` varchar(39) NOT NULL DEFAULT '',
  `dns` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`dserviceid`),
  UNIQUE KEY `dservices_1` (`dcheckid`,`ip`,`port`),
  KEY `dservices_2` (`dhostid`),
  CONSTRAINT `c_dservices_1` FOREIGN KEY (`dhostid`) REFERENCES `dhosts` (`dhostid`) ON DELETE CASCADE,
  CONSTRAINT `c_dservices_2` FOREIGN KEY (`dcheckid`) REFERENCES `dchecks` (`dcheckid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dservices`
--

LOCK TABLES `dservices` WRITE;
/*!40000 ALTER TABLE `dservices` DISABLE KEYS */;
INSERT INTO `dservices` VALUES (1,1,'Linux s1 3.10.0-327.el7.x86_64 #1 SMP Thu Nov 19 22:10:57 UTC 2015 x86_64',10050,0,1536907532,0,2,'10.10.10.31','s1'),(2,2,'Linux s2 3.10.0-327.el7.x86_64 #1 SMP Thu Nov 19 22:10:57 UTC 2015 x86_64',10050,0,1536907532,0,2,'10.10.10.32',''),(3,3,'Linux s4 3.10.0-327.el7.x86_64 #1 SMP Thu Nov 19 22:10:57 UTC 2015 x86_64',10050,0,1536907533,0,2,'10.10.10.34',''),(4,4,'Linux s5 3.10.0-327.el7.x86_64 #1 SMP Thu Nov 19 22:10:57 UTC 2015 x86_64',10050,0,1536907533,0,2,'10.10.10.35',''),(5,5,'Linux s6 3.10.0-514.el7.x86_64 #1 SMP Tue Nov 22 16:42:41 UTC 2016 x86_64',10050,0,1536907533,0,2,'10.10.10.36',''),(6,6,'Linux s13 3.10.0-514.el7.x86_64 #1 SMP Tue Nov 22 16:42:41 UTC 2016 x86_64',10050,0,1536907533,0,2,'10.10.10.41',''),(7,7,'Linux s14 3.10.0-514.el7.x86_64 #1 SMP Tue Nov 22 16:42:41 UTC 2016 x86_64',10050,0,1536907533,0,2,'10.10.10.42','s14'),(8,8,'Linux mysql-common-01 3.10.0-514.el7.x86_64 #1 SMP Tue Nov 22 16:42:41 UTC 2016 x86_64',10050,0,1536914729,0,2,'10.10.10.25',''),(9,9,'Linux ebmas-neo4j 3.10.0-514.el7.x86_64 #1 SMP Tue Nov 22 16:42:41 UTC 2016 x86_64',10050,0,1536914729,0,2,'10.10.10.26',''),(10,10,'Linux s3 3.10.0-327.el7.x86_64 #1 SMP Thu Nov 19 22:10:57 UTC 2015 x86_64',10050,0,1537184733,0,2,'10.10.10.33','');
/*!40000 ALTER TABLE `dservices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `escalations`
--

DROP TABLE IF EXISTS `escalations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `escalations` (
  `escalationid` bigint(20) unsigned NOT NULL,
  `actionid` bigint(20) unsigned NOT NULL,
  `triggerid` bigint(20) unsigned DEFAULT NULL,
  `eventid` bigint(20) unsigned DEFAULT NULL,
  `r_eventid` bigint(20) unsigned DEFAULT NULL,
  `nextcheck` int(11) NOT NULL DEFAULT '0',
  `esc_step` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0',
  `itemid` bigint(20) unsigned DEFAULT NULL,
  `acknowledgeid` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`escalationid`),
  UNIQUE KEY `escalations_1` (`actionid`,`triggerid`,`itemid`,`escalationid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `escalations`
--

LOCK TABLES `escalations` WRITE;
/*!40000 ALTER TABLE `escalations` DISABLE KEYS */;
/*!40000 ALTER TABLE `escalations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_recovery`
--

DROP TABLE IF EXISTS `event_recovery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_recovery` (
  `eventid` bigint(20) unsigned NOT NULL,
  `r_eventid` bigint(20) unsigned NOT NULL,
  `c_eventid` bigint(20) unsigned DEFAULT NULL,
  `correlationid` bigint(20) unsigned DEFAULT NULL,
  `userid` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`eventid`),
  KEY `event_recovery_1` (`r_eventid`),
  KEY `event_recovery_2` (`c_eventid`),
  CONSTRAINT `c_event_recovery_1` FOREIGN KEY (`eventid`) REFERENCES `events` (`eventid`) ON DELETE CASCADE,
  CONSTRAINT `c_event_recovery_2` FOREIGN KEY (`r_eventid`) REFERENCES `events` (`eventid`) ON DELETE CASCADE,
  CONSTRAINT `c_event_recovery_3` FOREIGN KEY (`c_eventid`) REFERENCES `events` (`eventid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_recovery`
--

LOCK TABLES `event_recovery` WRITE;
/*!40000 ALTER TABLE `event_recovery` DISABLE KEYS */;
INSERT INTO `event_recovery` VALUES (85,103,NULL,NULL,NULL),(96,104,NULL,NULL,NULL),(105,109,NULL,NULL,NULL),(106,110,NULL,NULL,NULL),(107,108,NULL,NULL,NULL),(111,632,NULL,NULL,NULL),(112,118,NULL,NULL,NULL),(119,132,NULL,NULL,NULL),(120,133,NULL,NULL,NULL),(121,125,NULL,NULL,NULL),(123,126,NULL,NULL,NULL),(124,127,NULL,NULL,NULL),(128,134,NULL,NULL,NULL),(129,135,NULL,NULL,NULL),(130,136,NULL,NULL,NULL),(131,137,NULL,NULL,NULL),(138,141,NULL,NULL,NULL),(139,142,NULL,NULL,NULL),(140,143,NULL,NULL,NULL),(144,147,NULL,NULL,NULL),(145,148,NULL,NULL,NULL),(146,149,NULL,NULL,NULL),(150,155,NULL,NULL,NULL),(151,153,NULL,NULL,NULL),(152,154,NULL,NULL,NULL),(156,161,NULL,NULL,NULL),(157,159,NULL,NULL,NULL),(158,160,NULL,NULL,NULL),(162,165,NULL,NULL,NULL),(163,166,NULL,NULL,NULL),(164,167,NULL,NULL,NULL),(168,171,NULL,NULL,NULL),(169,172,NULL,NULL,NULL),(170,173,NULL,NULL,NULL),(174,179,NULL,NULL,NULL),(175,177,NULL,NULL,NULL),(176,178,NULL,NULL,NULL),(180,185,NULL,NULL,NULL),(181,183,NULL,NULL,NULL),(182,184,NULL,NULL,NULL),(186,190,NULL,NULL,NULL),(187,191,NULL,NULL,NULL),(188,189,NULL,NULL,NULL),(192,195,NULL,NULL,NULL),(193,196,NULL,NULL,NULL),(194,197,NULL,NULL,NULL),(198,201,NULL,NULL,NULL),(199,202,NULL,NULL,NULL),(200,203,NULL,NULL,NULL),(204,208,NULL,NULL,NULL),(205,209,NULL,NULL,NULL),(206,207,NULL,NULL,NULL),(210,213,NULL,NULL,NULL),(211,214,NULL,NULL,NULL),(212,219,NULL,NULL,NULL),(215,217,NULL,NULL,NULL),(216,218,NULL,NULL,NULL),(220,223,NULL,NULL,NULL),(221,224,NULL,NULL,NULL),(222,225,NULL,NULL,NULL),(226,230,NULL,NULL,NULL),(227,231,NULL,NULL,NULL),(228,229,NULL,NULL,NULL),(232,235,NULL,NULL,NULL),(233,236,NULL,NULL,NULL),(234,237,NULL,NULL,NULL),(238,241,NULL,NULL,NULL),(239,242,NULL,NULL,NULL),(240,243,NULL,NULL,NULL),(244,246,NULL,NULL,NULL),(245,247,NULL,NULL,NULL),(248,253,NULL,NULL,NULL),(249,251,NULL,NULL,NULL),(250,252,NULL,NULL,NULL),(254,258,NULL,NULL,NULL),(255,259,NULL,NULL,NULL),(256,257,NULL,NULL,NULL),(260,265,NULL,NULL,NULL),(261,263,NULL,NULL,NULL),(262,264,NULL,NULL,NULL),(266,270,NULL,NULL,NULL),(267,271,NULL,NULL,NULL),(268,269,NULL,NULL,NULL),(272,275,NULL,NULL,NULL),(273,276,NULL,NULL,NULL),(274,277,NULL,NULL,NULL),(278,281,NULL,NULL,NULL),(279,282,NULL,NULL,NULL),(280,283,NULL,NULL,NULL),(284,287,NULL,NULL,NULL),(285,288,NULL,NULL,NULL),(286,289,NULL,NULL,NULL),(290,293,NULL,NULL,NULL),(291,294,NULL,NULL,NULL),(292,295,NULL,NULL,NULL),(296,301,NULL,NULL,NULL),(297,299,NULL,NULL,NULL),(298,300,NULL,NULL,NULL),(302,305,NULL,NULL,NULL),(303,306,NULL,NULL,NULL),(304,307,NULL,NULL,NULL),(308,313,NULL,NULL,NULL),(309,311,NULL,NULL,NULL),(310,312,NULL,NULL,NULL),(314,319,NULL,NULL,NULL),(315,317,NULL,NULL,NULL),(316,318,NULL,NULL,NULL),(320,324,NULL,NULL,NULL),(321,325,NULL,NULL,NULL),(322,323,NULL,NULL,NULL),(326,329,NULL,NULL,NULL),(327,330,NULL,NULL,NULL),(328,331,NULL,NULL,NULL),(332,335,NULL,NULL,NULL),(333,336,NULL,NULL,NULL),(334,337,NULL,NULL,NULL),(338,342,NULL,NULL,NULL),(339,343,NULL,NULL,NULL),(340,341,NULL,NULL,NULL),(344,347,NULL,NULL,NULL),(345,350,NULL,NULL,NULL),(346,351,NULL,NULL,NULL),(348,349,NULL,NULL,NULL),(352,355,NULL,NULL,NULL),(353,356,NULL,NULL,NULL),(354,357,NULL,NULL,NULL),(358,361,NULL,NULL,NULL),(359,362,NULL,NULL,NULL),(360,363,NULL,NULL,NULL),(364,367,NULL,NULL,NULL),(365,368,NULL,NULL,NULL),(366,369,NULL,NULL,NULL),(370,373,NULL,NULL,NULL),(371,374,NULL,NULL,NULL),(372,375,NULL,NULL,NULL),(376,379,NULL,NULL,NULL),(377,380,NULL,NULL,NULL),(378,381,NULL,NULL,NULL),(382,385,NULL,NULL,NULL),(383,386,NULL,NULL,NULL),(384,387,NULL,NULL,NULL),(388,391,NULL,NULL,NULL),(389,392,NULL,NULL,NULL),(390,393,NULL,NULL,NULL),(394,398,NULL,NULL,NULL),(395,399,NULL,NULL,NULL),(396,397,NULL,NULL,NULL),(400,404,NULL,NULL,NULL),(401,405,NULL,NULL,NULL),(402,403,NULL,NULL,NULL),(406,411,NULL,NULL,NULL),(407,409,NULL,NULL,NULL),(408,410,NULL,NULL,NULL),(412,417,NULL,NULL,NULL),(413,415,NULL,NULL,NULL),(414,416,NULL,NULL,NULL),(418,421,NULL,NULL,NULL),(419,422,NULL,NULL,NULL),(420,423,NULL,NULL,NULL),(424,428,NULL,NULL,NULL),(425,433,NULL,NULL,NULL),(426,427,NULL,NULL,NULL),(429,431,NULL,NULL,NULL),(430,432,NULL,NULL,NULL),(434,437,NULL,NULL,NULL),(435,438,NULL,NULL,NULL),(436,439,NULL,NULL,NULL),(440,443,NULL,NULL,NULL),(441,444,NULL,NULL,NULL),(442,445,NULL,NULL,NULL),(446,449,NULL,NULL,NULL),(447,450,NULL,NULL,NULL),(448,451,NULL,NULL,NULL),(452,455,NULL,NULL,NULL),(453,456,NULL,NULL,NULL),(454,457,NULL,NULL,NULL),(458,462,NULL,NULL,NULL),(459,463,NULL,NULL,NULL),(460,461,NULL,NULL,NULL),(464,511,NULL,NULL,NULL),(477,509,NULL,NULL,NULL),(487,510,NULL,NULL,NULL),(512,515,NULL,NULL,NULL),(513,516,NULL,NULL,NULL),(514,517,NULL,NULL,NULL),(518,521,NULL,NULL,NULL),(519,522,NULL,NULL,NULL),(520,523,NULL,NULL,NULL),(524,527,NULL,NULL,NULL),(525,528,NULL,NULL,NULL),(526,529,NULL,NULL,NULL),(530,533,NULL,NULL,NULL),(531,534,NULL,NULL,NULL),(532,535,NULL,NULL,NULL),(536,664,NULL,NULL,NULL),(537,851,NULL,NULL,NULL),(580,584,NULL,NULL,NULL),(581,585,NULL,NULL,NULL),(582,583,NULL,NULL,NULL),(631,816,NULL,NULL,NULL),(645,660,NULL,NULL,NULL),(661,662,NULL,NULL,NULL),(663,665,NULL,NULL,NULL),(666,865,NULL,NULL,NULL),(667,707,NULL,NULL,NULL),(708,709,NULL,NULL,NULL),(710,711,NULL,NULL,NULL),(712,713,NULL,NULL,NULL),(714,715,NULL,NULL,NULL),(716,717,NULL,NULL,NULL),(718,719,NULL,NULL,NULL),(720,721,NULL,NULL,NULL),(722,723,NULL,NULL,NULL),(724,725,NULL,NULL,NULL),(726,727,NULL,NULL,NULL),(728,729,NULL,NULL,NULL),(730,731,NULL,NULL,NULL),(732,733,NULL,NULL,NULL),(734,735,NULL,NULL,NULL),(736,737,NULL,NULL,NULL),(738,739,NULL,NULL,NULL),(740,741,NULL,NULL,NULL),(742,743,NULL,NULL,NULL),(744,745,NULL,NULL,NULL),(746,747,NULL,NULL,NULL),(748,749,NULL,NULL,NULL),(750,751,NULL,NULL,NULL),(752,753,NULL,NULL,NULL),(754,755,NULL,NULL,NULL),(756,757,NULL,NULL,NULL),(758,759,NULL,NULL,NULL),(760,761,NULL,NULL,NULL),(762,763,NULL,NULL,NULL),(764,765,NULL,NULL,NULL),(766,767,NULL,NULL,NULL),(768,769,NULL,NULL,NULL),(770,771,NULL,NULL,NULL),(772,773,NULL,NULL,NULL),(774,775,NULL,NULL,NULL),(776,777,NULL,NULL,NULL),(778,779,NULL,NULL,NULL),(780,781,NULL,NULL,NULL),(782,783,NULL,NULL,NULL),(784,786,NULL,NULL,NULL),(787,788,NULL,NULL,NULL),(789,790,NULL,NULL,NULL),(791,792,NULL,NULL,NULL),(793,798,NULL,NULL,NULL),(799,800,NULL,NULL,NULL),(801,802,NULL,NULL,NULL),(803,804,NULL,NULL,NULL),(805,806,NULL,NULL,NULL),(807,808,NULL,NULL,NULL),(809,810,NULL,NULL,NULL),(811,812,NULL,NULL,NULL),(813,814,NULL,NULL,NULL),(815,818,NULL,NULL,NULL),(819,821,NULL,NULL,NULL),(820,927,NULL,NULL,NULL),(822,832,NULL,NULL,NULL),(833,834,NULL,NULL,NULL),(835,836,NULL,NULL,NULL),(837,838,NULL,NULL,NULL),(839,840,NULL,NULL,NULL),(852,863,NULL,NULL,NULL),(864,868,NULL,NULL,NULL),(866,867,NULL,NULL,NULL),(869,871,NULL,NULL,NULL),(870,872,NULL,NULL,NULL),(873,884,NULL,NULL,NULL),(874,893,NULL,NULL,NULL),(875,877,NULL,NULL,NULL),(876,878,NULL,NULL,NULL),(879,881,NULL,NULL,NULL),(880,883,NULL,NULL,NULL),(882,890,NULL,NULL,NULL),(885,887,NULL,NULL,NULL),(886,891,NULL,NULL,NULL),(888,889,NULL,NULL,NULL),(892,896,NULL,NULL,NULL),(894,895,NULL,NULL,NULL),(897,2712,NULL,NULL,NULL),(926,930,NULL,NULL,NULL),(953,954,NULL,NULL,NULL),(955,956,NULL,NULL,NULL),(976,977,NULL,NULL,NULL),(1006,1007,NULL,NULL,NULL),(1008,1009,NULL,NULL,NULL),(1024,1025,NULL,NULL,NULL),(1057,1058,NULL,NULL,NULL),(1077,1078,NULL,NULL,NULL),(1079,1080,NULL,NULL,NULL),(1081,1082,NULL,NULL,NULL),(1101,1102,NULL,NULL,NULL),(1121,1122,NULL,NULL,NULL),(1141,1142,NULL,NULL,NULL),(1143,1145,NULL,NULL,NULL),(1144,1146,NULL,NULL,NULL),(1147,1148,NULL,NULL,NULL),(1149,1150,NULL,NULL,NULL),(1169,1170,NULL,NULL,NULL),(1189,1190,NULL,NULL,NULL),(1209,1210,NULL,NULL,NULL),(1229,1230,NULL,NULL,NULL),(1249,1250,NULL,NULL,NULL),(1269,1270,NULL,NULL,NULL),(1289,1290,NULL,NULL,NULL),(1309,1310,NULL,NULL,NULL),(1329,1330,NULL,NULL,NULL),(1349,1360,NULL,NULL,NULL),(1383,1387,NULL,NULL,NULL),(1409,1410,NULL,NULL,NULL),(1429,1430,NULL,NULL,NULL),(1449,1450,NULL,NULL,NULL),(1451,1453,NULL,NULL,NULL),(1452,1454,NULL,NULL,NULL),(1455,1457,NULL,NULL,NULL),(1456,1458,NULL,NULL,NULL),(1477,1478,NULL,NULL,NULL),(1497,1498,NULL,NULL,NULL),(1517,1518,NULL,NULL,NULL),(1519,1522,NULL,NULL,NULL),(1523,1524,NULL,NULL,NULL),(1545,1546,NULL,NULL,NULL),(1565,1566,NULL,NULL,NULL),(1585,1586,NULL,NULL,NULL),(1605,1606,NULL,NULL,NULL),(1625,1626,NULL,NULL,NULL),(1645,1646,NULL,NULL,NULL),(1665,1666,NULL,NULL,NULL),(1685,1686,NULL,NULL,NULL),(1705,1706,NULL,NULL,NULL),(1725,1726,NULL,NULL,NULL),(1745,1746,NULL,NULL,NULL),(1765,1766,NULL,NULL,NULL),(1785,1786,NULL,NULL,NULL),(1805,1806,NULL,NULL,NULL),(1825,1826,NULL,NULL,NULL),(1845,1846,NULL,NULL,NULL),(1865,1866,NULL,NULL,NULL),(1885,1886,NULL,NULL,NULL),(1905,1906,NULL,NULL,NULL),(1925,1926,NULL,NULL,NULL),(1945,1946,NULL,NULL,NULL),(1965,1966,NULL,NULL,NULL),(1985,1986,NULL,NULL,NULL),(1987,1990,NULL,NULL,NULL),(2015,2016,NULL,NULL,NULL),(2019,2020,NULL,NULL,NULL),(2041,2042,NULL,NULL,NULL),(2061,2062,NULL,NULL,NULL),(2081,2082,NULL,NULL,NULL),(2101,2102,NULL,NULL,NULL),(2121,2122,NULL,NULL,NULL),(2141,2142,NULL,NULL,NULL),(2161,2162,NULL,NULL,NULL),(2181,2182,NULL,NULL,NULL),(2201,2202,NULL,NULL,NULL),(2221,2222,NULL,NULL,NULL),(2241,2242,NULL,NULL,NULL),(2261,2262,NULL,NULL,NULL),(2281,2282,NULL,NULL,NULL),(2301,2302,NULL,NULL,NULL),(2321,2322,NULL,NULL,NULL),(2341,2342,NULL,NULL,NULL),(2361,2362,NULL,NULL,NULL),(2381,2382,NULL,NULL,NULL),(2401,2402,NULL,NULL,NULL),(2551,2552,NULL,NULL,NULL),(2637,2638,NULL,NULL,NULL),(2713,2733,NULL,NULL,NULL),(2732,2735,NULL,NULL,NULL),(2734,2741,NULL,NULL,NULL),(2742,2868,NULL,NULL,NULL),(2766,2767,NULL,NULL,NULL),(2791,2792,NULL,NULL,NULL),(2816,2817,NULL,NULL,NULL),(2823,2869,NULL,NULL,NULL),(2824,2871,NULL,NULL,NULL),(2867,2870,NULL,NULL,NULL),(2899,2900,NULL,NULL,NULL),(2926,2928,NULL,NULL,NULL),(2927,2932,NULL,NULL,NULL),(2929,2933,NULL,NULL,NULL),(2930,2934,NULL,NULL,NULL),(2931,2935,NULL,NULL,NULL),(2963,2964,NULL,NULL,NULL),(2969,2970,NULL,NULL,NULL),(2994,2995,NULL,NULL,NULL),(3024,3025,NULL,NULL,NULL),(3027,3635,NULL,NULL,NULL),(3057,3058,NULL,NULL,NULL),(3061,3062,NULL,NULL,NULL),(3089,3090,NULL,NULL,NULL),(3117,3119,NULL,NULL,NULL),(3146,3147,NULL,NULL,NULL),(3174,3175,NULL,NULL,NULL),(3201,3202,NULL,NULL,NULL),(3226,3227,NULL,NULL,NULL),(3255,3256,NULL,NULL,NULL),(3282,3283,NULL,NULL,NULL),(3310,3312,NULL,NULL,NULL),(3339,3340,NULL,NULL,NULL),(3366,3368,NULL,NULL,NULL),(3397,3398,NULL,NULL,NULL),(3432,3434,NULL,NULL,NULL),(3459,3461,NULL,NULL,NULL),(3491,3492,NULL,NULL,NULL),(3519,3521,NULL,NULL,NULL),(3549,3551,NULL,NULL,NULL),(3581,3582,NULL,NULL,NULL),(3608,3609,NULL,NULL,NULL),(3637,3640,NULL,NULL,NULL),(3638,3639,NULL,NULL,NULL),(3667,3668,NULL,NULL,NULL),(3700,3703,NULL,NULL,NULL),(3732,3733,NULL,NULL,NULL),(3761,3763,NULL,NULL,NULL),(3793,3794,NULL,NULL,NULL),(3818,3819,NULL,NULL,NULL),(3848,3849,NULL,NULL,NULL),(3877,3878,NULL,NULL,NULL),(3909,3911,NULL,NULL,NULL),(3939,3940,NULL,NULL,NULL),(3965,3967,NULL,NULL,NULL),(3995,3996,NULL,NULL,NULL),(4027,4029,NULL,NULL,NULL),(4058,4059,NULL,NULL,NULL),(4089,4090,NULL,NULL,NULL),(4117,4118,NULL,NULL,NULL),(4150,4151,NULL,NULL,NULL),(4158,4159,NULL,NULL,NULL),(4182,4183,NULL,NULL,NULL),(4207,4208,NULL,NULL,NULL),(4231,4233,NULL,NULL,NULL),(4261,4263,NULL,NULL,NULL),(4291,4292,NULL,NULL,NULL),(4314,4315,NULL,NULL,NULL),(4344,4347,NULL,NULL,NULL),(4354,4355,NULL,NULL,NULL),(4358,4362,NULL,NULL,NULL),(4389,4391,NULL,NULL,NULL),(4415,4417,NULL,NULL,NULL),(4445,4446,NULL,NULL,NULL),(4469,4471,NULL,NULL,NULL),(4494,4495,NULL,NULL,NULL),(4516,4517,NULL,NULL,NULL),(4542,4543,NULL,NULL,NULL),(4569,4571,NULL,NULL,NULL),(4594,4595,NULL,NULL,NULL),(4619,4621,NULL,NULL,NULL),(4648,4649,NULL,NULL,NULL),(4670,4671,NULL,NULL,NULL),(4692,4693,NULL,NULL,NULL),(4714,4715,NULL,NULL,NULL),(4736,4737,NULL,NULL,NULL),(4758,4759,NULL,NULL,NULL),(4780,4781,NULL,NULL,NULL),(4802,4803,NULL,NULL,NULL),(4824,4825,NULL,NULL,NULL),(4846,4847,NULL,NULL,NULL),(4868,4869,NULL,NULL,NULL),(4890,4891,NULL,NULL,NULL),(4912,4913,NULL,NULL,NULL),(4934,4935,NULL,NULL,NULL),(4956,4957,NULL,NULL,NULL),(4978,4979,NULL,NULL,NULL),(5000,5001,NULL,NULL,NULL),(5022,5023,NULL,NULL,NULL),(5044,5045,NULL,NULL,NULL),(5066,5067,NULL,NULL,NULL),(5088,5089,NULL,NULL,NULL),(5110,5111,NULL,NULL,NULL),(5132,5133,NULL,NULL,NULL),(5154,5155,NULL,NULL,NULL),(5176,5177,NULL,NULL,NULL),(5198,5199,NULL,NULL,NULL),(5220,5221,NULL,NULL,NULL),(5242,5243,NULL,NULL,NULL),(5264,5265,NULL,NULL,NULL),(5266,5293,NULL,NULL,NULL),(5267,5294,NULL,NULL,NULL),(5268,5295,NULL,NULL,NULL),(5269,5270,NULL,NULL,NULL),(5291,5292,NULL,NULL,NULL),(5296,5300,NULL,NULL,NULL),(5297,5441,NULL,NULL,NULL),(5298,5442,NULL,NULL,NULL),(5299,5443,NULL,NULL,NULL),(5321,5322,NULL,NULL,NULL),(5343,5344,NULL,NULL,NULL),(5365,5366,NULL,NULL,NULL),(5367,5368,NULL,NULL,NULL),(5389,5390,NULL,NULL,NULL),(5391,5392,NULL,NULL,NULL),(5413,5414,NULL,NULL,NULL),(5415,5416,NULL,NULL,NULL),(5437,5438,NULL,NULL,NULL),(5439,5440,NULL,NULL,NULL),(5464,5465,NULL,NULL,NULL),(5466,5467,NULL,NULL,NULL),(5488,5489,NULL,NULL,NULL),(5510,5511,NULL,NULL,NULL),(5512,5513,NULL,NULL,NULL),(5534,5535,NULL,NULL,NULL),(5556,5557,NULL,NULL,NULL),(5578,5579,NULL,NULL,NULL),(5600,5601,NULL,NULL,NULL),(5622,5623,NULL,NULL,NULL),(5644,5645,NULL,NULL,NULL),(5666,5667,NULL,NULL,NULL),(5688,5689,NULL,NULL,NULL),(5710,5711,NULL,NULL,NULL),(5732,5733,NULL,NULL,NULL),(5754,5755,NULL,NULL,NULL),(5776,5777,NULL,NULL,NULL),(5798,5799,NULL,NULL,NULL),(5820,5821,NULL,NULL,NULL),(5842,5843,NULL,NULL,NULL),(5864,5865,NULL,NULL,NULL),(5886,5887,NULL,NULL,NULL),(5908,5909,NULL,NULL,NULL),(5930,5931,NULL,NULL,NULL),(5952,5953,NULL,NULL,NULL),(5974,5975,NULL,NULL,NULL),(5996,5997,NULL,NULL,NULL),(6018,6019,NULL,NULL,NULL),(6040,6041,NULL,NULL,NULL),(6062,6063,NULL,NULL,NULL),(6084,6085,NULL,NULL,NULL),(6106,6107,NULL,NULL,NULL),(6128,6129,NULL,NULL,NULL),(6150,6151,NULL,NULL,NULL),(6172,6173,NULL,NULL,NULL),(6194,6195,NULL,NULL,NULL),(6216,6217,NULL,NULL,NULL),(6238,6239,NULL,NULL,NULL),(6262,6263,NULL,NULL,NULL),(6284,6285,NULL,NULL,NULL),(6306,6307,NULL,NULL,NULL),(6330,6331,NULL,NULL,NULL),(6352,6353,NULL,NULL,NULL),(6374,6375,NULL,NULL,NULL),(6396,6397,NULL,NULL,NULL),(6418,6419,NULL,NULL,NULL),(6440,6441,NULL,NULL,NULL),(6462,6463,NULL,NULL,NULL),(6484,6485,NULL,NULL,NULL),(6506,6507,NULL,NULL,NULL),(6528,6529,NULL,NULL,NULL),(6552,6553,NULL,NULL,NULL),(6574,6575,NULL,NULL,NULL),(6596,6597,NULL,NULL,NULL),(6618,6619,NULL,NULL,NULL),(6640,6641,NULL,NULL,NULL),(6662,6663,NULL,NULL,NULL),(6684,6685,NULL,NULL,NULL),(6706,6707,NULL,NULL,NULL),(6730,6731,NULL,NULL,NULL),(6752,6753,NULL,NULL,NULL),(6774,6775,NULL,NULL,NULL),(6796,6797,NULL,NULL,NULL),(6818,6819,NULL,NULL,NULL),(6840,6841,NULL,NULL,NULL),(6862,6863,NULL,NULL,NULL),(6885,6886,NULL,NULL,NULL),(6887,7020,NULL,NULL,NULL),(6908,6909,NULL,NULL,NULL),(6930,6931,NULL,NULL,NULL),(6952,6953,NULL,NULL,NULL),(6974,6975,NULL,NULL,NULL),(6996,6997,NULL,NULL,NULL),(7018,7019,NULL,NULL,NULL),(7021,7352,NULL,NULL,NULL),(7042,7043,NULL,NULL,NULL),(7064,7065,NULL,NULL,NULL),(7086,7087,NULL,NULL,NULL),(7108,7109,NULL,NULL,NULL),(7130,7131,NULL,NULL,NULL),(7152,7153,NULL,NULL,NULL),(7174,7175,NULL,NULL,NULL),(7196,7197,NULL,NULL,NULL),(7218,7219,NULL,NULL,NULL),(7240,7241,NULL,NULL,NULL),(7262,7263,NULL,NULL,NULL),(7284,7285,NULL,NULL,NULL),(7306,7307,NULL,NULL,NULL),(7328,7329,NULL,NULL,NULL),(7350,7351,NULL,NULL,NULL),(7374,7375,NULL,NULL,NULL),(7396,7397,NULL,NULL,NULL),(7418,7419,NULL,NULL,NULL),(7440,7441,NULL,NULL,NULL);
/*!40000 ALTER TABLE `event_recovery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_tag`
--

DROP TABLE IF EXISTS `event_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_tag` (
  `eventtagid` bigint(20) unsigned NOT NULL,
  `eventid` bigint(20) unsigned NOT NULL,
  `tag` varchar(255) NOT NULL DEFAULT '',
  `value` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`eventtagid`),
  KEY `event_tag_1` (`eventid`),
  CONSTRAINT `c_event_tag_1` FOREIGN KEY (`eventid`) REFERENCES `events` (`eventid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_tag`
--

LOCK TABLES `event_tag` WRITE;
/*!40000 ALTER TABLE `event_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `event_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `events` (
  `eventid` bigint(20) unsigned NOT NULL,
  `source` int(11) NOT NULL DEFAULT '0',
  `object` int(11) NOT NULL DEFAULT '0',
  `objectid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `clock` int(11) NOT NULL DEFAULT '0',
  `value` int(11) NOT NULL DEFAULT '0',
  `acknowledged` int(11) NOT NULL DEFAULT '0',
  `ns` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`eventid`),
  KEY `events_1` (`source`,`object`,`objectid`,`clock`),
  KEY `events_2` (`source`,`object`,`clock`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events`
--

LOCK TABLES `events` WRITE;
/*!40000 ALTER TABLE `events` DISABLE KEYS */;
INSERT INTO `events` VALUES (18,0,0,15677,1530004241,1,0,824192311),(28,0,0,15725,1530004498,1,0,907333787),(31,0,0,13496,1530006012,1,0,551759249),(33,3,4,23261,1530006041,1,0,559828733),(34,3,0,13476,1530006041,1,0,559828733),(35,3,4,23267,1530006047,1,0,563750355),(36,3,4,25367,1530006047,1,0,563679921),(37,3,0,13482,1530006047,1,0,563750355),(38,3,0,13563,1530006047,1,0,563679921),(39,3,4,23328,1530006048,1,0,564006977),(40,3,0,13436,1530006048,1,0,564006977),(41,3,4,23635,1530006055,1,0,566900928),(42,3,0,13537,1530006055,1,0,566900928),(44,0,0,15773,1530006135,1,0,624966688),(85,0,0,15684,1530010324,1,0,285443866),(96,0,0,15780,1530010478,1,0,487858548),(103,0,0,15684,1530013924,0,0,629467702),(104,0,0,15780,1530014078,0,0,833926440),(105,0,0,15814,1530069235,1,0,333035087),(106,0,0,15790,1530069247,1,0,348761663),(107,0,0,15806,1530069259,1,0,368738489),(108,0,0,15806,1530069559,0,0,729776913),(109,0,0,15814,1530069595,0,0,768689647),(110,0,0,15790,1530069607,0,0,784547744),(111,0,0,15720,1530602700,1,0,442352160),(112,0,0,15744,1530689133,1,0,336206975),(118,0,0,15744,1530689193,0,0,396563180),(119,0,0,13499,1530689307,1,0,514099745),(120,0,0,13501,1530689312,1,0,517732936),(121,0,0,13502,1530689313,1,0,518379442),(123,0,0,15683,1530689522,1,0,717447865),(124,0,0,15779,1530689676,1,0,855286212),(125,0,0,13502,1530689913,0,0,2177409),(126,0,0,15683,1530690122,0,0,223176004),(127,0,0,15779,1530690276,0,0,378833624),(128,0,0,15680,1530690716,1,0,777208837),(129,0,0,15682,1530690721,1,0,781564375),(130,0,0,15776,1530690870,1,0,932776055),(131,0,0,15778,1530690875,1,0,934844858),(132,0,0,13499,1530692907,0,0,731774545),(133,0,0,13501,1530692912,0,0,735093344),(134,0,0,15680,1530694316,0,0,975418745),(135,0,0,15682,1530694321,0,0,978992812),(136,0,0,15776,1530694470,0,0,62595757),(137,0,0,15778,1530694475,0,0,64726533),(138,0,0,13503,1530786515,1,0,989014040),(139,0,0,15684,1530787924,1,0,190485172),(140,0,0,15780,1530788078,1,0,368060387),(141,0,0,13503,1530790115,0,0,172440200),(142,0,0,15684,1530791524,0,0,494482796),(143,0,0,15780,1530791678,0,0,643229408),(144,0,0,15814,1532050915,1,0,170698668),(145,0,0,15790,1532050927,1,0,213412501),(146,0,0,15806,1532050939,1,0,6219711),(147,0,0,15814,1532050975,0,0,37167566),(148,0,0,15790,1532050987,0,0,50295783),(149,0,0,15806,1532050999,0,0,73053036),(150,0,0,15806,1532917159,1,0,139108798),(151,0,0,15814,1532917195,1,0,168170011),(152,0,0,15790,1532917207,1,0,180144918),(153,0,0,15814,1532917495,0,0,472067787),(154,0,0,15790,1532917507,0,0,482900386),(155,0,0,15806,1532917519,0,0,498860929),(156,0,0,15806,1533007219,1,0,864224224),(157,0,0,15814,1533007255,1,0,890636404),(158,0,0,15790,1533007267,1,0,902389564),(159,0,0,15814,1533007495,0,0,28057716),(160,0,0,15790,1533007507,0,0,40143836),(161,0,0,15806,1533007519,0,0,62932738),(162,0,0,15814,1533007795,1,0,373625689),(163,0,0,15790,1533007807,1,0,387312826),(164,0,0,15806,1533007819,1,0,410028718),(165,0,0,15814,1533008095,0,0,669086766),(166,0,0,15790,1533008107,0,0,680896150),(167,0,0,15806,1533008119,0,0,696951616),(168,0,0,15814,1533008155,1,0,725532442),(169,0,0,15790,1533008167,1,0,737209095),(170,0,0,15806,1533008179,1,0,753817771),(171,0,0,15814,1533008395,0,0,946642302),(172,0,0,15790,1533008407,0,0,959034339),(173,0,0,15806,1533008419,0,0,975600789),(174,0,0,15806,1533008479,1,0,185853525),(175,0,0,15814,1533008515,1,0,288134042),(176,0,0,15790,1533008527,1,0,5341822),(177,0,0,15814,1533008695,0,0,196413034),(178,0,0,15790,1533008707,0,0,209893183),(179,0,0,15806,1533008719,0,0,232478895),(180,0,0,15814,1533013495,1,0,617674800),(181,0,0,15790,1533013507,1,0,629526096),(182,0,0,15806,1533013519,1,0,645288179),(183,0,0,15790,1533013807,0,0,897085557),(184,0,0,15806,1533013819,0,0,912682553),(185,0,0,15814,1533013855,0,0,939998648),(186,0,0,15814,1533015535,1,0,465183799),(187,0,0,15790,1533015547,1,0,476094183),(188,0,0,15806,1533015559,1,0,492708920),(189,0,0,15806,1533015619,0,0,546734996),(190,0,0,15814,1533015655,0,0,573050064),(191,0,0,15790,1533015667,0,0,584416260),(192,0,0,15814,1533020335,1,0,848247845),(193,0,0,15790,1533020347,1,0,859640515),(194,0,0,15806,1533020359,1,0,875716551),(195,0,0,15814,1533021055,0,0,496425305),(196,0,0,15790,1533021067,0,0,507905641),(197,0,0,15806,1533021079,0,0,524000464),(198,0,0,15814,1533021115,1,0,551819476),(199,0,0,15790,1533021127,1,0,563211269),(200,0,0,15806,1533021139,1,0,579907069),(201,0,0,15814,1533021355,0,0,766240468),(202,0,0,15790,1533021367,0,0,777573243),(203,0,0,15806,1533021379,0,0,793413643),(204,0,0,15790,1533021847,1,0,206254680),(205,0,0,15806,1533021859,1,0,223101527),(206,0,0,15814,1533021895,1,0,249399045),(207,0,0,15814,1533022255,0,0,581199938),(208,0,0,15790,1533022267,0,0,592463216),(209,0,0,15806,1533022279,0,0,608585046),(210,0,0,15814,1533023395,1,0,603004232),(211,0,0,15790,1533023407,1,0,614274771),(212,0,0,15806,1533023419,1,0,630080608),(213,0,0,15814,1533023455,0,0,656495358),(214,0,0,15790,1533023467,0,0,667546840),(215,0,0,15814,1533023515,1,0,723421809),(216,0,0,15790,1533023527,1,0,736169520),(217,0,0,15814,1533023755,0,0,954920512),(218,0,0,15790,1533023767,0,0,966226331),(219,0,0,15806,1533023779,0,0,982170991),(220,0,0,15814,1533024655,1,0,767638063),(221,0,0,15790,1533024667,1,0,778040362),(222,0,0,15806,1533024679,1,0,794636649),(223,0,0,15814,1533024955,0,0,13063390),(224,0,0,15790,1533024967,0,0,25382022),(225,0,0,15806,1533024979,0,0,47434661),(226,0,0,15790,1533026827,1,0,744729392),(227,0,0,15806,1533026839,1,0,761486996),(228,0,0,15814,1533026875,1,0,787737430),(229,0,0,15814,1533027055,0,0,949690563),(230,0,0,15790,1533027067,0,0,961465902),(231,0,0,15806,1533027079,0,0,977625552),(232,0,0,15814,1533027655,1,0,506182891),(233,0,0,15790,1533027667,1,0,519643154),(234,0,0,15806,1533027679,1,0,536919829),(235,0,0,15814,1533027955,0,0,779559759),(236,0,0,15790,1533027967,0,0,791183715),(237,0,0,15806,1533027979,0,0,807276412),(238,0,0,15814,1533028015,1,0,832952272),(239,0,0,15790,1533028027,1,0,844254514),(240,0,0,15806,1533028039,1,0,861564379),(241,0,0,15814,1533028255,0,0,262885111),(242,0,0,15790,1533028267,0,0,306093645),(243,0,0,15806,1533028279,0,0,396284237),(244,0,0,15790,1533028507,1,0,239805155),(245,0,0,15806,1533028519,1,0,262269026),(246,0,0,15790,1533028567,0,0,305824756),(247,0,0,15806,1533028579,0,0,327967380),(248,0,0,15814,1533029215,1,0,919268399),(249,0,0,15790,1533029227,1,0,931149952),(250,0,0,15806,1533029239,1,0,947248512),(251,0,0,15790,1533029467,0,0,107842182),(252,0,0,15806,1533029479,0,0,139233121),(253,0,0,15814,1533029515,0,0,176439828),(254,0,0,15806,1533030079,1,0,710735981),(255,0,0,15814,1533030115,1,0,737174868),(256,0,0,15790,1533030127,1,0,749181031),(257,0,0,15790,1533030367,0,0,965413217),(258,0,0,15806,1533030379,0,0,982248511),(259,0,0,15814,1533030415,0,0,53185062),(260,0,0,15814,1533030895,1,0,458626998),(261,0,0,15790,1533030907,1,0,470083014),(262,0,0,15806,1533030919,1,0,488255608),(263,0,0,15790,1533030967,0,0,526191278),(264,0,0,15806,1533030979,0,0,542203548),(265,0,0,15814,1533031015,0,0,569539457),(266,0,0,15814,1533033295,1,0,619402621),(267,0,0,15790,1533033307,1,0,631379814),(268,0,0,15806,1533033319,1,0,647517804),(269,0,0,15806,1533033679,0,0,968917618),(270,0,0,15814,1533033715,0,0,994809398),(271,0,0,15790,1533033727,0,0,43550249),(272,0,0,15814,1533037375,1,0,285711290),(273,0,0,15790,1533037387,1,0,296031145),(274,0,0,15806,1533037399,1,0,312664396),(275,0,0,15814,1533037615,0,0,498931141),(276,0,0,15790,1533037627,0,0,510950174),(277,0,0,15806,1533037639,0,0,527315691),(278,0,0,15814,1533040615,1,0,204379595),(279,0,0,15790,1533040627,1,0,215204353),(280,0,0,15806,1533040639,1,0,232216304),(281,0,0,15814,1533040915,0,0,471316628),(282,0,0,15790,1533040927,0,0,482763338),(283,0,0,15806,1533040939,0,0,499311934),(284,0,0,15814,1533091015,1,0,302618999),(285,0,0,15790,1533091027,1,0,313830551),(286,0,0,15806,1533091039,1,0,330426018),(287,0,0,15814,1533091495,0,0,730522744),(288,0,0,15790,1533091507,0,0,741864943),(289,0,0,15806,1533091519,0,0,757617953),(290,0,0,15814,1533092095,1,0,249704019),(291,0,0,15790,1533092107,1,0,262698723),(292,0,0,15806,1533092119,1,0,285844071),(293,0,0,15814,1533092395,0,0,553595571),(294,0,0,15790,1533092407,0,0,565297648),(295,0,0,15806,1533092419,0,0,581530984),(296,0,0,15806,1533092599,1,0,742163579),(297,0,0,15814,1533092635,1,0,768488640),(298,0,0,15790,1533092647,1,0,779956707),(299,0,0,15814,1533092695,0,0,822854223),(300,0,0,15790,1533092707,0,0,834274342),(301,0,0,15806,1533092719,0,0,850596976),(302,0,0,15814,1533093775,1,0,782832588),(303,0,0,15790,1533093787,1,0,793929023),(304,0,0,15806,1533093799,1,0,809954161),(305,0,0,15814,1533093895,0,0,889076766),(306,0,0,15790,1533093907,0,0,900276589),(307,0,0,15806,1533093919,0,0,915654061),(308,0,0,15814,1533099895,1,0,280244450),(309,0,0,15790,1533099907,1,0,291382899),(310,0,0,15806,1533099919,1,0,308386313),(311,0,0,15790,1533100207,0,0,558091918),(312,0,0,15806,1533100219,0,0,573705051),(313,0,0,15814,1533100255,0,0,600047782),(314,0,0,15790,1533103567,1,0,570311468),(315,0,0,15806,1533103579,1,0,585752393),(316,0,0,15814,1533103615,1,0,612120903),(317,0,0,15806,1533103819,0,0,803891257),(318,0,0,15814,1533103855,0,0,829889194),(319,0,0,15790,1533103867,0,0,841629585),(320,0,0,15814,1533103975,1,0,939210845),(321,0,0,15790,1533103987,1,0,950718747),(322,0,0,15806,1533103999,1,0,967157311),(323,0,0,15806,1533104119,0,0,72779332),(324,0,0,15814,1533104155,0,0,99909404),(325,0,0,15790,1533104167,0,0,111485502),(326,0,0,15814,1533104215,1,0,154165628),(327,0,0,15790,1533104227,1,0,165059523),(328,0,0,15806,1533104239,1,0,181687604),(329,0,0,15814,1533105055,0,0,923002844),(330,0,0,15790,1533105067,0,0,934516863),(331,0,0,15806,1533105079,0,0,950730587),(332,0,0,15814,1533105115,1,0,976748777),(333,0,0,15790,1533105127,1,0,988572013),(334,0,0,15806,1533105139,1,0,65681698),(335,0,0,15814,1533105655,0,0,457899415),(336,0,0,15790,1533105667,0,0,469148055),(337,0,0,15806,1533105679,0,0,485963672),(338,0,0,15790,1533105787,1,0,578256675),(339,0,0,15806,1533105799,1,0,594046508),(340,0,0,15814,1533105835,1,0,621671320),(341,0,0,15814,1533105955,0,0,728842562),(342,0,0,15790,1533105967,0,0,740146051),(343,0,0,15806,1533105979,0,0,756506715),(344,0,0,15814,1533106555,1,0,237450441),(345,0,0,15790,1533106567,1,0,250902835),(346,0,0,15806,1533106579,1,0,273254724),(347,0,0,15814,1533106855,0,0,558174065),(348,0,0,15814,1533106915,1,0,612822517),(349,0,0,15814,1533107155,0,0,828730944),(350,0,0,15790,1533107167,0,0,840555371),(351,0,0,15806,1533107179,0,0,856215154),(352,0,0,15814,1533108235,1,0,795657435),(353,0,0,15790,1533108247,1,0,806512074),(354,0,0,15806,1533108259,1,0,823640859),(355,0,0,15814,1533108655,0,0,179480084),(356,0,0,15790,1533108667,0,0,190718323),(357,0,0,15806,1533108679,0,0,206363176),(358,0,0,15814,1533109195,1,0,666556990),(359,0,0,15790,1533109207,1,0,677843571),(360,0,0,15806,1533109219,1,0,694265849),(361,0,0,15814,1533109255,0,0,719911333),(362,0,0,15790,1533109267,0,0,731198142),(363,0,0,15806,1533109279,0,0,747958899),(364,0,0,15814,1533109555,1,0,989570868),(365,0,0,15790,1533109567,1,0,12227907),(366,0,0,15806,1533109579,1,0,99331232),(367,0,0,15814,1533109855,0,0,258682435),(368,0,0,15790,1533109867,0,0,269865044),(369,0,0,15806,1533109879,0,0,287202235),(370,0,0,15814,1533110815,1,0,142967461),(371,0,0,15790,1533110827,1,0,154277437),(372,0,0,15806,1533110839,1,0,169883880),(373,0,0,15814,1533111055,0,0,358063093),(374,0,0,15790,1533111067,0,0,369334042),(375,0,0,15806,1533111079,0,0,386224496),(376,0,0,15814,1533112375,1,0,547367962),(377,0,0,15790,1533112387,1,0,558314451),(378,0,0,15806,1533112399,1,0,575103724),(379,0,0,15814,1533112555,0,0,709057655),(380,0,0,15790,1533112567,0,0,720611394),(381,0,0,15806,1533112579,0,0,736863338),(382,0,0,15814,1533113455,1,0,513530932),(383,0,0,15790,1533113467,1,0,524909638),(384,0,0,15806,1533113479,1,0,541318865),(385,0,0,15814,1533113755,0,0,809086701),(386,0,0,15790,1533113767,0,0,820191967),(387,0,0,15806,1533113779,0,0,836056736),(388,0,0,15814,1533114055,1,0,388400567),(389,0,0,15790,1533114067,1,0,431095240),(390,0,0,15806,1533114079,1,0,6719455),(391,0,0,15814,1533114655,0,0,611508456),(392,0,0,15790,1533114667,0,0,622713968),(393,0,0,15806,1533114679,0,0,639450602),(394,0,0,15806,1533114739,1,0,693180249),(395,0,0,15814,1533114775,1,0,720111123),(396,0,0,15790,1533114787,1,0,731284908),(397,0,0,15790,1533114967,0,0,894065336),(398,0,0,15806,1533114979,0,0,910000579),(399,0,0,15814,1533115015,0,0,935824706),(400,0,0,15806,1533115039,1,0,963985702),(401,0,0,15814,1533115075,1,0,990476103),(402,0,0,15790,1533115087,1,0,12861096),(403,0,0,15790,1533115267,0,0,162151928),(404,0,0,15806,1533115279,0,0,178396294),(405,0,0,15814,1533115315,0,0,204243148),(406,0,0,15814,1533115435,1,0,311812970),(407,0,0,15790,1533115447,1,0,323921697),(408,0,0,15806,1533115459,1,0,340195290),(409,0,0,15790,1533115567,0,0,431098919),(410,0,0,15806,1533115579,0,0,447267531),(411,0,0,15814,1533115615,0,0,473640776),(412,0,0,15814,1533115675,1,0,527671946),(413,0,0,15790,1533115687,1,0,543952013),(414,0,0,15806,1533115699,1,0,566068749),(415,0,0,15790,1533115867,0,0,709654362),(416,0,0,15806,1533115879,0,0,726089626),(417,0,0,15814,1533115915,0,0,752815984),(418,0,0,15790,1533115927,1,0,764145539),(419,0,0,15806,1533115939,1,0,780454783),(420,0,0,15814,1533115975,1,0,807223239),(421,0,0,15790,1533116167,0,0,979923495),(422,0,0,15806,1533116179,0,0,26238487),(423,0,0,15814,1533116215,0,0,66500236),(424,0,0,15806,1533116479,1,0,261921412),(425,0,0,15814,1533116515,1,0,288323566),(426,0,0,15790,1533116527,1,0,299844299),(427,0,0,15790,1533116767,0,0,515628571),(428,0,0,15806,1533116779,0,0,531329211),(429,0,0,15790,1533116827,1,0,569244437),(430,0,0,15806,1533116839,1,0,585505747),(431,0,0,15790,1533117067,0,0,784020081),(432,0,0,15806,1533117079,0,0,800070792),(433,0,0,15814,1533117115,0,0,838149303),(434,0,0,15806,1533120439,1,0,822481076),(435,0,0,15814,1533120475,1,0,848880240),(436,0,0,15790,1533120487,1,0,860110098),(437,0,0,15806,1533120979,0,0,328323133),(438,0,0,15814,1533121015,0,0,355683765),(439,0,0,15790,1533121027,0,0,368627919),(440,0,0,15814,1533122335,1,0,528017608),(441,0,0,15790,1533122347,1,0,538971683),(442,0,0,15806,1533122359,1,0,556081538),(443,0,0,15814,1533122515,0,0,688734837),(444,0,0,15790,1533122527,0,0,700110830),(445,0,0,15806,1533122539,0,0,716537030),(446,0,0,15814,1533128095,1,0,719534100),(447,0,0,15790,1533128107,1,0,731014449),(448,0,0,15806,1533128119,1,0,748636541),(449,0,0,15814,1533128215,0,0,829162958),(450,0,0,15790,1533128227,0,0,842696149),(451,0,0,15806,1533128239,0,0,858215702),(452,0,0,15806,1533172039,1,0,282927352),(453,0,0,15814,1533172075,1,0,453899096),(454,0,0,15790,1533172087,1,0,476963979),(455,0,0,15806,1533172159,0,0,318038346),(456,0,0,15814,1533172195,0,0,625508989),(457,0,0,15790,1533172207,0,0,638607373),(458,0,0,15814,1533172255,1,0,811278662),(459,0,0,15790,1533172267,1,0,82580688),(460,0,0,15806,1533172279,1,0,29790834),(461,0,0,15806,1533172459,0,0,183290933),(462,0,0,15814,1533172495,0,0,355053710),(463,0,0,15790,1533172507,0,0,49046587),(464,0,0,15806,1533175639,1,0,404410285),(477,0,0,15814,1533175675,1,0,373592790),(487,0,0,15790,1533175687,1,0,258957896),(509,0,0,15814,1533176095,0,0,688561845),(510,0,0,15790,1533176107,0,0,642469910),(511,0,0,15806,1533176119,0,0,153289028),(512,0,0,15814,1533176155,1,0,964632758),(513,0,0,15790,1533176167,1,0,819728182),(514,0,0,15806,1533176179,1,0,211145870),(515,0,0,15814,1533176395,0,0,356368676),(516,0,0,15790,1533176407,0,0,887617537),(517,0,0,15806,1533176419,0,0,271788817),(518,0,0,15814,1533179455,1,0,980506757),(519,0,0,15790,1533179467,1,0,812270361),(520,0,0,15806,1533179479,1,0,309117737),(521,0,0,15814,1533179695,0,0,32730770),(522,0,0,15790,1533179707,0,0,567161361),(523,0,0,15806,1533179719,0,0,82394712),(524,0,0,15814,1533180775,1,0,945235240),(525,0,0,15790,1533180787,1,0,767905357),(526,0,0,15806,1533180799,1,0,253946072),(527,0,0,15814,1533180895,0,0,697893555),(528,0,0,15790,1533180907,0,0,557286102),(529,0,0,15806,1533180919,0,0,452974190),(530,0,0,15814,1533180955,1,0,967081043),(531,0,0,15790,1533180967,1,0,683826512),(532,0,0,15806,1533180979,1,0,143609935),(533,0,0,15814,1533181195,0,0,782452471),(534,0,0,15790,1533181207,0,0,968749439),(535,0,0,15806,1533181219,0,0,294344937),(536,0,0,15806,1533181339,1,0,639248982),(537,0,0,15814,1533181375,1,0,268197112),(538,0,0,15790,1533181387,1,0,955268541),(576,0,0,15825,1533189606,1,0,464375203),(580,0,0,13491,1533190950,1,0,811183258),(581,0,0,15768,1533190950,1,0,811191691),(582,0,0,15672,1533190980,1,0,831350220),(583,0,0,15672,1533191316,0,0,883416777),(584,0,0,13491,1533191407,0,0,553830609),(585,0,0,15768,1533191410,0,0,654596831),(631,0,0,15832,1533200211,1,0,219570095),(632,0,0,15720,1533200333,0,0,335285222),(640,0,0,15855,1533200406,1,0,871857198),(645,0,0,15843,1533200406,1,0,879906599),(660,0,0,15843,1533216426,0,0,261748865),(661,0,0,15843,1533218406,1,0,547697091),(662,0,0,15843,1533247626,0,0,627609468),(663,0,0,15843,1533250806,1,0,73040685),(664,0,0,15806,1533267439,0,0,446629515),(665,0,0,15843,1533267486,0,0,420395093),(666,0,0,15806,1533267499,1,0,960332051),(667,0,0,15843,1533268806,1,0,602736661),(707,0,0,15843,1533282486,0,0,508298100),(708,0,0,15843,1533283206,1,0,617226123),(709,0,0,15843,1533305166,0,0,729587714),(710,0,0,15843,1533308406,1,0,143358373),(711,0,0,15843,1533338226,0,0,275946109),(712,0,0,15843,1533340806,1,0,625945727),(713,0,0,15843,1533369546,0,0,633918769),(714,0,0,15843,1533369606,1,0,612118922),(715,0,0,15843,1533399906,0,0,815721185),(716,0,0,15843,1533402006,1,0,108568459),(717,0,0,15843,1533429186,0,0,873249202),(718,0,0,15843,1533430806,1,0,84454839),(719,0,0,15843,1533458286,0,0,870650378),(720,0,0,15843,1533459606,1,0,54449746),(721,0,0,15843,1533486786,0,0,851292856),(722,0,0,15843,1533488406,1,0,63559239),(723,0,0,15843,1533514686,0,0,709294321),(724,0,0,15843,1533517206,1,0,61277822),(725,0,0,15843,1533535326,0,0,551680055),(726,0,0,15843,1533538806,1,0,40230751),(727,0,0,15843,1533562926,0,0,350812830),(728,0,0,15843,1533564006,1,0,504493645),(729,0,0,15843,1533592986,0,0,463769254),(730,0,0,15843,1533596406,1,0,945181404),(731,0,0,15843,1533619806,0,0,185017348),(732,0,0,15843,1533621606,1,0,438000519),(733,0,0,15843,1533647166,0,0,992524187),(734,0,0,15843,1533679206,1,0,410779087),(735,0,0,15843,1533695946,0,0,736322841),(736,0,0,15843,1533718806,1,0,885020005),(737,0,0,15843,1533744306,0,0,387416111),(738,0,0,15843,1533776406,1,0,771970516),(739,0,0,15843,1533801666,0,0,235066266),(740,0,0,15843,1533805206,1,0,720373344),(741,0,0,15843,1533828666,0,0,947253970),(742,0,0,15843,1533830406,1,0,191697123),(743,0,0,15843,1533858006,0,0,981319284),(744,0,0,15843,1533859206,1,0,142176828),(745,0,0,15843,1533884226,0,0,565463240),(746,0,0,15843,1533884406,1,0,597085565),(747,0,0,15843,1533911406,0,0,321758517),(748,0,0,15843,1533913206,1,0,551128605),(749,0,0,15843,1533940506,0,0,293738271),(750,0,0,15843,1533942006,1,0,510678088),(751,0,0,15843,1533968586,0,0,159063124),(752,0,0,15843,1533970806,1,0,470086057),(753,0,0,15843,1533995766,0,0,872229002),(754,0,0,15843,1533996006,1,0,908837819),(755,0,0,15843,1534022346,0,0,489360950),(756,0,0,15843,1534024806,1,0,831560859),(757,0,0,15843,1534048566,0,0,78197830),(758,0,0,15843,1534050006,1,0,285114465),(759,0,0,15843,1534074126,0,0,593552155),(760,0,0,15843,1534075206,1,0,743266648),(761,0,0,15843,1534099026,0,0,27024641),(762,0,0,15843,1534100406,1,0,213826077),(763,0,0,15843,1534124046,0,0,468464072),(764,0,0,15843,1534125606,1,0,689776542),(765,0,0,15843,1534141386,0,0,864839001),(766,0,0,15843,1534143606,1,0,171364326),(767,0,0,15843,1534157286,0,0,52724094),(768,0,0,15843,1534158006,1,0,159911669),(769,0,0,15843,1534184586,0,0,825572245),(770,0,0,15843,1534186806,1,0,139234462),(771,0,0,15843,1534212066,0,0,606518492),(772,0,0,15843,1534215606,1,0,95898118),(773,0,0,15843,1534236366,0,0,965121107),(774,0,0,15843,1534237206,1,0,79705020),(775,0,0,15843,1534265106,0,0,896886726),(776,0,0,15843,1534266006,1,0,20591612),(777,0,0,15843,1534296126,0,0,187198894),(778,0,0,15843,1534298406,1,0,507194846),(779,0,0,15843,1534322946,0,0,916577268),(780,0,0,15843,1534323606,1,0,981603276),(781,0,0,15843,1534348266,0,0,368486011),(782,0,0,15843,1534348806,1,0,449680632),(783,0,0,15843,1534379886,0,0,694623280),(784,0,0,15843,1534381206,1,0,883802696),(786,0,0,15843,1534387266,0,0,735240852),(787,0,0,15842,1534387326,1,0,718105927),(788,0,0,15842,1534387326,0,0,718105927),(789,0,0,15843,1534388406,1,0,878030076),(790,0,0,15843,1534430886,0,0,703296198),(791,0,0,15843,1534431606,1,0,804588992),(792,0,0,15843,1534462446,0,0,18133626),(793,0,0,15843,1534464006,1,0,235512073),(798,0,0,15843,1534488486,0,0,611267443),(799,0,0,15843,1534489206,1,0,700448007),(800,0,0,15843,1534504266,0,0,809559219),(801,0,0,15843,1534507206,1,0,182852190),(802,0,0,15843,1534535766,0,0,146545560),(803,0,0,15843,1534536006,1,0,168384362),(804,0,0,15843,1534566546,0,0,391201383),(805,0,0,15843,1534568406,1,0,629727063),(806,0,0,15843,1534595466,0,0,346524836),(807,0,0,15843,1534597206,1,0,588973699),(808,0,0,15843,1534625706,0,0,512488376),(809,0,0,15843,1534626006,1,0,555055728),(810,0,0,15843,1534654386,0,0,458013817),(811,0,0,15843,1534654806,1,0,522700874),(812,0,0,15843,1534682106,0,0,280916477),(813,0,0,15843,1534683606,1,0,489906864),(814,0,0,15843,1534709406,0,0,45356627),(815,0,0,15843,1534712406,1,0,456626155),(816,0,0,15832,1534731411,0,0,385272231),(817,0,0,15832,1534731591,1,1,383384047),(818,0,0,15843,1534733646,0,0,388798853),(819,0,0,15843,1534734006,1,0,415621302),(820,0,0,15866,1534734829,1,0,23082015),(821,0,0,15843,1534750206,0,0,641243798),(822,0,0,15843,1534752006,1,0,887119581),(832,0,0,15843,1534762926,0,0,378008679),(833,0,0,15843,1534766406,1,0,854609100),(834,0,0,15843,1534794186,0,0,649783663),(835,0,0,15843,1534795206,1,0,796723560),(836,0,0,15843,1534818726,0,0,14376327),(837,0,0,15843,1534820406,1,0,246342297),(838,0,0,15843,1534821966,0,0,464773860),(839,0,0,15843,1534824006,1,0,752867805),(840,0,0,15843,1534833426,0,0,40574442),(851,0,0,15814,1535606755,0,0,846798669),(852,0,0,15814,1535606815,1,0,992860988),(863,0,0,15814,1536044515,0,0,285061367),(864,0,0,15814,1536044575,1,0,315508532),(865,0,0,15806,1536054199,0,0,804021829),(866,0,0,15806,1536054259,1,0,735539384),(867,0,0,15806,1536125779,0,0,393289377),(868,0,0,15814,1536125815,0,0,2289070),(869,0,0,15814,1536125875,1,0,82463368),(870,0,0,15806,1536125899,1,0,319492012),(871,0,0,15814,1536141955,0,0,30022049),(872,0,0,15806,1536141979,0,0,749340662),(873,0,0,15806,1536142159,1,0,3429471),(874,0,0,15814,1536142195,1,0,386192725),(875,0,0,15810,1536144887,1,0,12396869),(876,0,0,15802,1536144911,1,0,855192530),(877,0,0,15810,1536145007,0,0,603811374),(878,0,0,15802,1536145031,0,0,459304603),(879,0,0,15810,1536145247,1,0,896694758),(880,0,0,15802,1536145271,1,0,130317964),(881,0,0,15810,1536145307,0,0,948263666),(882,0,0,15810,1536145367,1,0,665546087),(883,0,0,15802,1536200951,0,0,690792837),(884,0,0,15806,1536200959,0,0,448212574),(885,0,0,15802,1536201011,1,0,444045208),(886,0,0,15806,1536201019,1,0,276734964),(887,0,0,15802,1536201431,0,0,3199014),(888,0,0,15802,1536201491,1,0,129799018),(889,0,0,15802,1536201551,0,0,84928356),(890,0,0,15810,1536201587,0,0,933133955),(891,0,0,15806,1536202339,0,0,581456355),(892,0,0,15806,1536202399,1,0,894161900),(893,0,0,15814,1536202915,0,0,199444306),(894,0,0,15814,1536202975,1,0,758208777),(895,0,0,15814,1536203215,0,0,869106186),(896,0,0,15806,1536203239,0,0,158715292),(897,0,0,15814,1536203275,1,0,118964711),(898,0,0,15806,1536203299,1,0,16263075),(909,0,0,15892,1536746358,1,1,570156242),(926,0,0,15899,1536822101,1,0,91793556),(927,0,0,15866,1536822618,0,0,980092357),(928,0,0,15833,1536822623,1,0,52708567),(929,0,0,15880,1536822637,1,0,882311645),(930,0,0,15899,1536825701,0,0,152998367),(934,0,0,15934,1536890056,1,0,330336533),(936,0,0,15917,1536890075,1,0,688449709),(944,0,0,15952,1536890589,1,0,987965985),(950,0,0,15960,1536890685,1,0,503143395),(953,0,0,15912,1536893520,1,0,710237171),(954,0,0,15912,1536893670,0,0,676818407),(955,0,0,15912,1536894000,1,0,803161410),(956,0,0,15912,1536894150,0,0,68895035),(963,0,0,15937,1536894211,1,0,831472545),(965,0,0,15939,1536894216,1,0,912339010),(967,0,0,15941,1536894219,1,0,111138874),(975,0,0,15739,1536904348,1,0,273408714),(976,0,0,13470,1536904355,1,0,259118936),(977,0,0,13470,1536904895,0,0,175490145),(1006,0,0,13470,1536907955,1,0,876150973),(1007,0,0,13470,1536908375,0,0,374711870),(1008,0,0,15962,1536910586,1,0,469707332),(1009,0,0,15962,1536910796,0,0,165207585),(1024,0,0,13470,1536911555,1,0,570670346),(1025,0,0,13470,1536911975,0,0,364089916),(1057,0,0,13470,1536915155,1,0,462505835),(1058,0,0,13470,1536915575,0,0,673330544),(1077,0,0,13470,1536918755,1,0,925783822),(1078,0,0,13470,1536919175,0,0,52522830),(1079,0,0,15975,1536920768,1,0,761121481),(1080,0,0,15975,1536920798,0,0,44528319),(1081,0,0,15975,1536921158,1,0,208717157),(1082,0,0,15975,1536921188,0,0,945106911),(1101,0,0,13470,1536922355,1,0,331542437),(1102,0,0,13470,1536922775,0,0,454092684),(1121,0,0,13470,1536925955,1,0,569194462),(1122,0,0,13470,1536926375,0,0,804107641),(1141,0,0,13470,1536929555,1,0,810409521),(1142,0,0,13470,1536929975,0,0,3799653),(1143,0,0,15974,1536930157,1,0,850568773),(1144,0,0,15978,1536930161,1,0,260440264),(1145,0,0,15974,1536930187,0,0,559708111),(1146,0,0,15978,1536930191,0,0,42127843),(1147,0,0,15975,1536930219,1,0,6191150),(1148,0,0,15975,1536930248,0,0,311028523),(1149,0,0,15977,1536930250,1,0,131242261),(1150,0,0,15977,1536930280,0,0,645922043),(1169,0,0,13470,1536933155,1,0,154045948),(1170,0,0,13470,1536933575,0,0,553196956),(1189,0,0,13470,1536936755,1,0,425865234),(1190,0,0,13470,1536937175,0,0,689439220),(1209,0,0,13470,1536940355,1,0,537768735),(1210,0,0,13470,1536940775,0,0,848141493),(1229,0,0,13470,1536943955,1,0,643604589),(1230,0,0,13470,1536944375,0,0,884515488),(1249,0,0,13470,1536947555,1,0,900039920),(1250,0,0,13470,1536947975,0,0,118479383),(1269,0,0,13470,1536951155,1,0,919411100),(1270,0,0,13470,1536951575,0,0,629533885),(1289,0,0,13470,1536954755,1,0,593910072),(1290,0,0,13470,1536955175,0,0,148613081),(1309,0,0,13470,1536958355,1,0,787422316),(1310,0,0,13470,1536958775,0,0,1055604),(1329,0,0,13470,1536961955,1,0,169129751),(1330,0,0,13470,1536962375,0,0,783060720),(1349,0,0,13470,1536965555,1,0,479653048),(1355,3,4,29140,1536965830,1,0,254737352),(1356,3,5,29121,1536965841,1,0,107112768),(1357,3,5,29122,1536965842,1,0,152826238),(1358,3,5,29123,1536965843,1,0,355164228),(1359,3,5,29125,1536965845,1,0,418374871),(1360,0,0,13470,1536965975,0,0,340776816),(1383,0,0,13470,1536969155,1,0,588007711),(1387,0,0,13470,1536969575,0,0,828095605),(1388,3,4,29120,1536969920,1,0,25050911),(1409,0,0,13470,1536972755,1,0,786872393),(1410,0,0,13470,1536973175,0,0,860456420),(1429,0,0,13470,1536976355,1,0,359694575),(1430,0,0,13470,1536976775,0,0,765322349),(1449,0,0,13470,1536979955,1,0,493291422),(1450,0,0,13470,1536980375,0,0,908428594),(1451,0,0,15975,1536981098,1,0,673389198),(1452,0,0,15977,1536981100,1,0,884238873),(1453,0,0,15975,1536981128,0,0,987151007),(1454,0,0,15977,1536981130,0,0,541051945),(1455,0,0,15978,1536981161,1,0,380397706),(1456,0,0,15974,1536981187,1,0,637217062),(1457,0,0,15978,1536981191,0,0,239333954),(1458,0,0,15974,1536981217,0,0,476063378),(1477,0,0,13470,1536983555,1,0,626512529),(1478,0,0,13470,1536983975,0,0,464404361),(1497,0,0,13470,1536987155,1,0,932813825),(1498,0,0,13470,1536987575,0,0,798865646),(1517,0,0,13470,1536990755,1,0,663377792),(1518,0,0,13470,1536991175,0,0,660466573),(1519,0,0,15978,1536993311,1,0,916385947),(1522,0,0,15978,1536993341,0,0,156069025),(1523,0,0,15975,1536993428,1,0,125629047),(1524,0,0,15975,1536993458,0,0,539760490),(1545,0,0,13470,1536994355,1,0,579438202),(1546,0,0,13470,1536994775,0,0,892435830),(1565,0,0,13470,1536997955,1,0,944392223),(1566,0,0,13470,1536998375,0,0,928091098),(1585,0,0,13470,1537001555,1,0,758949663),(1586,0,0,13470,1537001975,0,0,349836097),(1605,0,0,13470,1537005155,1,0,865939852),(1606,0,0,13470,1537005575,0,0,238006851),(1625,0,0,13470,1537008755,1,0,946152856),(1626,0,0,13470,1537009175,0,0,430954574),(1645,0,0,13470,1537012355,1,0,912417659),(1646,0,0,13470,1537012775,0,0,17436036),(1665,0,0,13470,1537015955,1,0,741231085),(1666,0,0,13470,1537016375,0,0,773946142),(1685,0,0,13470,1537019555,1,0,434097359),(1686,0,0,13470,1537019975,0,0,480328859),(1705,0,0,13470,1537023155,1,0,693342404),(1706,0,0,13470,1537023575,0,0,736819749),(1725,0,0,13470,1537026755,1,0,462054536),(1726,0,0,13470,1537027175,0,0,504956776),(1745,0,0,13470,1537030355,1,0,83599468),(1746,0,0,13470,1537030775,0,0,838941084),(1765,0,0,13470,1537033955,1,0,591658276),(1766,0,0,13470,1537034375,0,0,985361295),(1785,0,0,13470,1537037555,1,0,495998859),(1786,0,0,13470,1537037975,0,0,509612079),(1805,0,0,13470,1537041155,1,0,979012999),(1806,0,0,13470,1537041575,0,0,988015262),(1825,0,0,13470,1537044755,1,0,32351795),(1826,0,0,13470,1537045175,0,0,687617417),(1845,0,0,13470,1537048355,1,0,365781391),(1846,0,0,13470,1537048775,0,0,899361937),(1865,0,0,13470,1537051955,1,0,56473454),(1866,0,0,13470,1537052375,0,0,780169124),(1885,0,0,13470,1537055555,1,0,235860737),(1886,0,0,13470,1537055975,0,0,539099174),(1905,0,0,13470,1537059155,1,0,604119469),(1906,0,0,13470,1537059575,0,0,916347030),(1925,0,0,13470,1537062755,1,0,823383471),(1926,0,0,13470,1537063175,0,0,450232421),(1945,0,0,13470,1537066355,1,0,664324940),(1946,0,0,13470,1537066775,0,0,956460214),(1965,0,0,13470,1537069955,1,0,615379738),(1966,0,0,13470,1537070375,0,0,754458718),(1985,0,0,13470,1537073555,1,0,8731764),(1986,0,0,13470,1537073975,0,0,670542117),(1987,0,0,15978,1537075481,1,0,815456073),(1990,0,0,15978,1537075511,0,0,79330501),(2015,0,0,13470,1537077155,1,0,682118416),(2016,0,0,13470,1537077575,0,0,828149960),(2019,0,0,15978,1537078241,1,0,346709708),(2020,0,0,15978,1537078271,0,0,386191152),(2041,0,0,13470,1537080755,1,0,725962312),(2042,0,0,13470,1537081175,0,0,372425652),(2061,0,0,13470,1537084355,1,0,695579140),(2062,0,0,13470,1537084775,0,0,646848959),(2081,0,0,13470,1537087955,1,0,222177746),(2082,0,0,13470,1537088375,0,0,54598803),(2101,0,0,13470,1537091555,1,0,455844019),(2102,0,0,13470,1537091975,0,0,707149586),(2121,0,0,13470,1537095155,1,0,375007289),(2122,0,0,13470,1537095575,0,0,816594406),(2141,0,0,13470,1537098755,1,0,778091175),(2142,0,0,13470,1537099175,0,0,690582927),(2161,0,0,13470,1537102355,1,0,47333847),(2162,0,0,13470,1537102775,0,0,530457251),(2181,0,0,13470,1537105955,1,0,242317725),(2182,0,0,13470,1537106375,0,0,258147214),(2201,0,0,13470,1537109555,1,0,563564510),(2202,0,0,13470,1537109975,0,0,827406859),(2221,0,0,13470,1537113155,1,0,24117237),(2222,0,0,13470,1537113575,0,0,493113052),(2241,0,0,13470,1537116755,1,0,866042520),(2242,0,0,13470,1537117175,0,0,844681359),(2261,0,0,13470,1537120355,1,0,542146006),(2262,0,0,13470,1537120775,0,0,986148497),(2281,0,0,13470,1537123955,1,0,130619687),(2282,0,0,13470,1537124375,0,0,469519023),(2301,0,0,13470,1537127555,1,0,684351274),(2302,0,0,13470,1537127975,0,0,259724264),(2321,0,0,13470,1537131155,1,0,288222414),(2322,0,0,13470,1537131575,0,0,485681324),(2341,0,0,13470,1537134755,1,0,956472976),(2342,0,0,13470,1537135175,0,0,617004058),(2361,0,0,13470,1537138355,1,0,64670289),(2362,0,0,13470,1537138775,0,0,961489546),(2381,0,0,13470,1537141955,1,0,162650128),(2382,0,0,13470,1537142375,0,0,455344218),(2401,0,0,13470,1537145555,1,0,588243043),(2402,0,0,13470,1537145975,0,0,830512978),(2551,0,0,13470,1537149155,1,0,316755715),(2552,0,0,13470,1537149575,0,0,505148977),(2637,0,0,13470,1537152755,1,0,669680973),(2638,0,0,13470,1537153175,0,0,687639813),(2712,0,0,15814,1537155295,0,0,609052697),(2713,0,0,15814,1537155355,1,0,98036440),(2732,0,0,13470,1537156355,1,0,452695497),(2733,0,0,15814,1537156375,0,0,901681807),(2734,0,0,15814,1537156435,1,0,987345818),(2735,0,0,13470,1537156775,0,0,887584993),(2741,0,0,15814,1537158955,0,0,987238872),(2742,0,0,15814,1537159015,1,0,946660934),(2766,0,0,13470,1537159955,1,0,276358324),(2767,0,0,13470,1537160375,0,0,943963119),(2791,0,0,13470,1537163555,1,0,566068326),(2792,0,0,13470,1537163975,0,0,357165714),(2816,0,0,13470,1537167155,1,0,974151755),(2817,0,0,13470,1537167575,0,0,862968429),(2823,0,0,15976,1537170249,1,0,553574947),(2824,0,0,15975,1537170278,1,0,207974553),(2867,0,0,13470,1537170755,1,0,544371413),(2868,0,0,15814,1537171015,0,0,988161925),(2869,0,0,15976,1537171179,0,0,125746251),(2870,0,0,13470,1537171235,0,0,479242416),(2871,0,0,15975,1537171238,0,0,977969091),(2899,0,0,13470,1537174355,1,0,482689767),(2900,0,0,13470,1537174775,0,0,688883993),(2926,0,0,15970,1537177833,1,0,634214112),(2927,0,0,15814,1537177855,1,0,440231662),(2928,0,0,15970,1537177863,0,0,569657612),(2929,0,0,15970,1537177893,1,0,863900836),(2930,0,0,15979,1537177903,1,0,174737889),(2931,0,0,13470,1537177955,1,0,181177404),(2932,0,0,15814,1537178275,0,0,330835496),(2933,0,0,15970,1537178313,0,0,327302499),(2934,0,0,15979,1537178323,0,0,689518056),(2935,0,0,13470,1537178375,0,0,376802715),(2963,0,0,13470,1537181555,1,0,818663722),(2964,0,0,13470,1537181975,0,0,499833005),(2969,0,0,15974,1537184617,1,0,71906334),(2970,0,0,15974,1537184677,0,0,946815821),(2994,0,0,13470,1537185155,1,0,570576323),(2995,0,0,13470,1537185575,0,0,490076830),(3024,0,0,13470,1537188755,1,0,383043492),(3025,0,0,13470,1537189175,0,0,805005978),(3027,0,0,15964,1537189651,1,0,178843151),(3057,0,0,13470,1537192355,1,0,692173635),(3058,0,0,13470,1537192775,0,0,771283700),(3061,0,0,15978,1537193531,1,0,281263682),(3062,0,0,15978,1537193651,0,0,747013444),(3089,0,0,13470,1537195955,1,0,72488861),(3090,0,0,13470,1537196375,0,0,288687889),(3117,0,0,13470,1537199555,1,0,712901114),(3119,0,0,13470,1537199975,0,0,965498612),(3146,0,0,13470,1537203155,1,0,262557148),(3147,0,0,13470,1537203575,0,0,9051522),(3174,0,0,13470,1537206755,1,0,737555388),(3175,0,0,13470,1537207175,0,0,27496559),(3201,0,0,13470,1537210355,1,0,716706304),(3202,0,0,13470,1537210775,0,0,462221905),(3226,0,0,13470,1537213955,1,0,663990516),(3227,0,0,13470,1537214375,0,0,26678694),(3255,0,0,13470,1537217555,1,0,602811037),(3256,0,0,13470,1537217975,0,0,367077075),(3282,0,0,13470,1537221155,1,0,39734940),(3283,0,0,13470,1537221575,0,0,972121593),(3310,0,0,13470,1537224755,1,0,489441404),(3312,0,0,13470,1537225175,0,0,992926520),(3339,0,0,13470,1537228355,1,0,979054016),(3340,0,0,13470,1537228775,0,0,21102509),(3366,0,0,13470,1537231955,1,0,931075419),(3368,0,0,13470,1537232375,0,0,504924986),(3397,0,0,13470,1537235555,1,0,618926504),(3398,0,0,13470,1537235975,0,0,123912671),(3432,0,0,13470,1537239155,1,0,768202163),(3434,0,0,13470,1537239575,0,0,365358683),(3438,0,0,15987,1537242211,1,0,870836990),(3459,0,0,13470,1537242755,1,0,602916684),(3461,0,0,13470,1537243175,0,0,435363218),(3491,0,0,13470,1537246355,1,0,982427628),(3492,0,0,13470,1537246775,0,0,935165111),(3519,0,0,13470,1537249955,1,0,850557637),(3521,0,0,13470,1537250375,0,0,368048371),(3549,0,0,13470,1537253555,1,0,969477989),(3551,0,0,13470,1537253975,0,0,911606733),(3581,0,0,13470,1537257155,1,0,807938402),(3582,0,0,13470,1537257575,0,0,375087436),(3608,0,0,13470,1537260756,1,0,690505),(3609,0,0,13470,1537261175,0,0,319053416),(3635,0,0,15964,1537263961,0,0,336095385),(3637,0,0,13470,1537264355,1,0,583323220),(3638,0,0,15983,1537264498,1,0,546160730),(3639,0,0,15983,1537264588,0,0,630000508),(3640,0,0,13470,1537264775,0,0,381488300),(3667,0,0,13470,1537267955,1,0,400650404),(3668,0,0,13470,1537268375,0,0,562071892),(3700,0,0,13470,1537271555,1,0,559271307),(3703,0,0,13470,1537271975,0,0,769449134),(3732,0,0,13470,1537275155,1,0,294504519),(3733,0,0,13470,1537275575,0,0,107499093),(3761,0,0,13470,1537278755,1,0,966877232),(3763,0,0,13470,1537279175,0,0,352877995),(3793,0,0,13470,1537282355,1,0,948525330),(3794,0,0,13470,1537282775,0,0,340785727),(3818,0,0,13470,1537285955,1,0,911481761),(3819,0,0,13470,1537286375,0,0,338080866),(3848,0,0,13470,1537289555,1,0,907184824),(3849,0,0,13470,1537289975,0,0,12056856),(3877,0,0,13470,1537293155,1,0,910452620),(3878,0,0,13470,1537293575,0,0,317813012),(3909,0,0,13470,1537296755,1,0,755991257),(3911,0,0,13470,1537297175,0,0,644296890),(3939,0,0,13470,1537300355,1,0,624878060),(3940,0,0,13470,1537300775,0,0,341495345),(3965,0,0,13470,1537303955,1,0,415305084),(3967,0,0,13470,1537304375,0,0,290386016),(3995,0,0,13470,1537307555,1,0,729058010),(3996,0,0,13470,1537307975,0,0,735461848),(4027,0,0,13470,1537311155,1,0,575355790),(4029,0,0,13470,1537311575,0,0,520922278),(4058,0,0,13470,1537314755,1,0,123760892),(4059,0,0,13470,1537315175,0,0,515159738),(4089,0,0,13470,1537318355,1,0,437249034),(4090,0,0,13470,1537318775,0,0,304535879),(4117,0,0,13470,1537321955,1,0,824297498),(4118,0,0,13470,1537322375,0,0,615469776),(4150,0,0,13470,1537325555,1,0,659220970),(4151,0,0,13470,1537325975,0,0,452275389),(4158,0,0,15985,1537328040,1,0,143464585),(4159,0,0,15985,1537328100,0,0,920013499),(4182,0,0,13470,1537329155,1,0,517017036),(4183,0,0,13470,1537329575,0,0,665494686),(4207,0,0,13470,1537332755,1,0,486789755),(4208,0,0,13470,1537333175,0,0,922007854),(4231,0,0,13470,1537336355,1,0,141237079),(4233,0,0,13470,1537336775,0,0,528733137),(4261,0,0,13470,1537339955,1,0,215266354),(4263,0,0,13470,1537340375,0,0,725429400),(4291,0,0,13470,1537343555,1,0,516770410),(4292,0,0,13470,1537343975,0,0,726488463),(4314,0,0,13470,1537347155,1,0,95224457),(4315,0,0,13470,1537347575,0,0,748197091),(4344,0,0,13470,1537350755,1,0,779710031),(4347,0,0,13470,1537351175,0,0,544098781),(4354,0,0,15974,1537353427,1,0,679105585),(4355,0,0,15974,1537353547,0,0,933597610),(4358,0,0,15978,1537353611,1,0,736744783),(4362,0,0,15978,1537353671,0,0,284298357),(4389,0,0,13470,1537354355,1,0,72872206),(4391,0,0,13470,1537354775,0,0,979583481),(4415,0,0,13470,1537357955,1,0,537510739),(4417,0,0,13470,1537358375,0,0,661485313),(4445,0,0,13470,1537361555,1,0,976283342),(4446,0,0,13470,1537361975,0,0,718432767),(4469,0,0,13470,1537365155,1,0,444333238),(4471,0,0,13470,1537365575,0,0,132636316),(4494,0,0,13470,1537368755,1,0,254122902),(4495,0,0,13470,1537369175,0,0,306006081),(4516,0,0,13470,1537372355,1,0,252687611),(4517,0,0,13470,1537372775,0,0,510683969),(4542,0,0,13470,1537375955,1,0,420084096),(4543,0,0,13470,1537376375,0,0,727287088),(4569,0,0,13470,1537379555,1,0,133052493),(4571,0,0,13470,1537379975,0,0,352062660),(4594,0,0,13470,1537383155,1,0,597371397),(4595,0,0,13470,1537383575,0,0,578694899),(4619,0,0,13470,1537386755,1,0,818720114),(4621,0,0,13470,1537387175,0,0,462504376),(4648,0,0,13470,1537390355,1,0,974157441),(4649,0,0,13470,1537390775,0,0,572546266),(4670,0,0,13470,1537393955,1,0,938906623),(4671,0,0,13470,1537394375,0,0,430393589),(4692,0,0,13470,1537397555,1,0,430598840),(4693,0,0,13470,1537397975,0,0,131711982),(4714,0,0,13470,1537401155,1,0,257728174),(4715,0,0,13470,1537401575,0,0,545877623),(4736,0,0,13470,1537404755,1,0,455622219),(4737,0,0,13470,1537405175,0,0,506134868),(4758,0,0,13470,1537408355,1,0,439871266),(4759,0,0,13470,1537408775,0,0,968576011),(4780,0,0,13470,1537411955,1,0,596476507),(4781,0,0,13470,1537412375,0,0,761374088),(4802,0,0,13470,1537415555,1,0,935046025),(4803,0,0,13470,1537415975,0,0,616514358),(4824,0,0,13470,1537419155,1,0,388110192),(4825,0,0,13470,1537419575,0,0,952526367),(4846,0,0,13470,1537422755,1,0,905024924),(4847,0,0,13470,1537423175,0,0,468246351),(4868,0,0,13470,1537426355,1,0,414409607),(4869,0,0,13470,1537426775,0,0,337069911),(4890,0,0,13470,1537429955,1,0,814781051),(4891,0,0,13470,1537430375,0,0,766270782),(4912,0,0,13470,1537433555,1,0,953989332),(4913,0,0,13470,1537433975,0,0,432689384),(4934,0,0,13470,1537437155,1,0,849747026),(4935,0,0,13470,1537437575,0,0,624881303),(4956,0,0,13470,1537440755,1,0,677061353),(4957,0,0,13470,1537441175,0,0,120719505),(4978,0,0,13470,1537444355,1,0,310437126),(4979,0,0,13470,1537444775,0,0,337092853),(5000,0,0,13470,1537447955,1,0,496517995),(5001,0,0,13470,1537448375,0,0,937683847),(5022,0,0,13470,1537451555,1,0,364875022),(5023,0,0,13470,1537451975,0,0,826459992),(5044,0,0,13470,1537455155,1,0,256100796),(5045,0,0,13470,1537455575,0,0,22624832),(5066,0,0,13470,1537458755,1,0,298214386),(5067,0,0,13470,1537459175,0,0,764504376),(5088,0,0,13470,1537462355,1,0,409642717),(5089,0,0,13470,1537462775,0,0,317597933),(5110,0,0,13470,1537465955,1,0,764943209),(5111,0,0,13470,1537466375,0,0,340192078),(5132,0,0,13470,1537469555,1,0,652361686),(5133,0,0,13470,1537469975,0,0,514773434),(5154,0,0,13470,1537473155,1,0,214744333),(5155,0,0,13470,1537473575,0,0,650901742),(5176,0,0,13470,1537476755,1,0,341897311),(5177,0,0,13470,1537477175,0,0,276417455),(5198,0,0,13470,1537480355,1,0,982245002),(5199,0,0,13470,1537480775,0,0,497055411),(5220,0,0,13470,1537483955,1,0,840903936),(5221,0,0,13470,1537484375,0,0,357380372),(5242,0,0,13470,1537487555,1,0,641333816),(5243,0,0,13470,1537487975,0,0,485674649),(5264,0,0,13470,1537491155,1,0,594319048),(5265,0,0,13470,1537491575,0,0,703412139),(5266,0,0,15971,1537493824,1,0,567334555),(5267,0,0,15972,1537493825,1,0,651109019),(5268,0,0,15973,1537493826,1,0,776021045),(5269,0,0,15985,1537493850,1,0,128673906),(5270,0,0,15985,1537493970,0,0,21088708),(5291,0,0,13470,1537494755,1,0,999869048),(5292,0,0,13470,1537495175,0,0,69386736),(5293,0,0,15971,1537495774,0,0,398011329),(5294,0,0,15972,1537495775,0,0,623277930),(5295,0,0,15973,1537495776,0,0,998142942),(5296,0,0,15985,1537497030,1,0,628798448),(5297,0,0,15971,1537497034,1,0,261133575),(5298,0,0,15972,1537497035,1,0,592813240),(5299,0,0,15973,1537497036,1,0,756351319),(5300,0,0,15985,1537497060,0,0,307391698),(5321,0,0,13470,1537498355,1,0,409162095),(5322,0,0,13470,1537498775,0,0,814896350),(5343,0,0,13470,1537501955,1,0,241624018),(5344,0,0,13470,1537502375,0,0,363773007),(5365,0,0,13470,1537505555,1,0,603773133),(5366,0,0,13470,1537505975,0,0,605093373),(5367,0,0,15985,1537506180,1,0,162665038),(5368,0,0,15985,1537506210,0,0,659051912),(5389,0,0,13470,1537509155,1,0,767741000),(5390,0,0,13470,1537509575,0,0,657936198),(5391,0,0,15969,1537511064,1,0,645838713),(5392,0,0,15969,1537511094,0,0,688882599),(5413,0,0,13470,1537512755,1,0,532497019),(5414,0,0,13470,1537513175,0,0,514459279),(5415,0,0,15985,1537513290,1,0,211734059),(5416,0,0,15985,1537513320,0,0,695096113),(5437,0,0,13470,1537516355,1,0,530609860),(5438,0,0,13470,1537516775,0,0,470323564),(5439,0,0,15985,1537516920,1,0,821527060),(5440,0,0,15985,1537516980,0,0,595841060),(5441,0,0,15971,1537519444,0,0,391612170),(5442,0,0,15972,1537519445,0,0,466869054),(5443,0,0,15973,1537519446,0,0,519752040),(5464,0,0,13470,1537519955,1,0,782687451),(5465,0,0,13470,1537520375,0,0,509915610),(5466,0,0,15985,1537521210,1,0,992604412),(5467,0,0,15985,1537521270,0,0,865803183),(5488,0,0,13470,1537523555,1,0,690072942),(5489,0,0,13470,1537523975,0,0,646398930),(5510,0,0,13470,1537527155,1,0,507429109),(5511,0,0,13470,1537527575,0,0,566663787),(5512,0,0,15985,1537527690,1,0,501737562),(5513,0,0,15985,1537527780,0,0,663857111),(5534,0,0,13470,1537530755,1,0,187836502),(5535,0,0,13470,1537531175,0,0,506750516),(5556,0,0,13470,1537534355,1,0,365196889),(5557,0,0,13470,1537534775,0,0,343749314),(5578,0,0,13470,1537537955,1,0,873399149),(5579,0,0,13470,1537538375,0,0,381038183),(5600,0,0,13470,1537541555,1,0,267553096),(5601,0,0,13470,1537541975,0,0,877961797),(5622,0,0,13470,1537545155,1,0,136107161),(5623,0,0,13470,1537545575,0,0,374919041),(5644,0,0,13470,1537548755,1,0,330866808),(5645,0,0,13470,1537549175,0,0,522615856),(5666,0,0,13470,1537552355,1,0,245352455),(5667,0,0,13470,1537552775,0,0,754140810),(5688,0,0,13470,1537555955,1,0,286742154),(5689,0,0,13470,1537556375,0,0,63214994),(5710,0,0,13470,1537559555,1,0,464009996),(5711,0,0,13470,1537559975,0,0,331107975),(5732,0,0,13470,1537563155,1,0,416543358),(5733,0,0,13470,1537563575,0,0,381318705),(5754,0,0,13470,1537566755,1,0,981902612),(5755,0,0,13470,1537567175,0,0,778389608),(5776,0,0,13470,1537570355,1,0,967212104),(5777,0,0,13470,1537570775,0,0,354917714),(5798,0,0,13470,1537573955,1,0,369229884),(5799,0,0,13470,1537574375,0,0,938187837),(5820,0,0,13470,1537577555,1,0,342629812),(5821,0,0,13470,1537577975,0,0,872788523),(5842,0,0,13470,1537581155,1,0,605251962),(5843,0,0,13470,1537581575,0,0,972780380),(5864,0,0,13470,1537584755,1,0,254929004),(5865,0,0,13470,1537585175,0,0,522798979),(5886,0,0,13470,1537588355,1,0,137515355),(5887,0,0,13470,1537588775,0,0,346817217),(5908,0,0,13470,1537591955,1,0,397247985),(5909,0,0,13470,1537592375,0,0,190248935),(5930,0,0,13470,1537595555,1,0,174034038),(5931,0,0,13470,1537595975,0,0,425598585),(5952,0,0,13470,1537599155,1,0,342068642),(5953,0,0,13470,1537599575,0,0,51417604),(5974,0,0,13470,1537602755,1,0,321359116),(5975,0,0,13470,1537603175,0,0,711431686),(5996,0,0,13470,1537606355,1,0,679100611),(5997,0,0,13470,1537606775,0,0,258711116),(6018,0,0,13470,1537609955,1,0,16881894),(6019,0,0,13470,1537610375,0,0,395302591),(6040,0,0,13470,1537613555,1,0,969797923),(6041,0,0,13470,1537613975,0,0,988906252),(6062,0,0,13470,1537617155,1,0,952120477),(6063,0,0,13470,1537617575,0,0,47235503),(6084,0,0,13470,1537620755,1,0,122811341),(6085,0,0,13470,1537621175,0,0,320487451),(6106,0,0,13470,1537624355,1,0,657048068),(6107,0,0,13470,1537624775,0,0,321712735),(6128,0,0,13470,1537627955,1,0,822833507),(6129,0,0,13470,1537628375,0,0,431401465),(6150,0,0,13470,1537631555,1,0,20633201),(6151,0,0,13470,1537631975,0,0,467349114),(6172,0,0,13470,1537635155,1,0,998558214),(6173,0,0,13470,1537635575,0,0,997024529),(6194,0,0,13470,1537638755,1,0,644877211),(6195,0,0,13470,1537639175,0,0,969785561),(6216,0,0,13470,1537642355,1,0,922362691),(6217,0,0,13470,1537642775,0,0,225293706),(6238,0,0,13470,1537645955,1,0,152277526),(6239,0,0,13470,1537646375,0,0,239426302),(6262,0,0,13470,1537649555,1,0,798344008),(6263,0,0,13470,1537649975,0,0,987583084),(6284,0,0,13470,1537653155,1,0,989946844),(6285,0,0,13470,1537653575,0,0,727097624),(6306,0,0,13470,1537656755,1,0,855924970),(6307,0,0,13470,1537657175,0,0,80619776),(6330,0,0,13470,1537660355,1,0,504292110),(6331,0,0,13470,1537660775,0,0,732627094),(6352,0,0,13470,1537663955,1,0,472757059),(6353,0,0,13470,1537664375,0,0,924105239),(6374,0,0,13470,1537667555,1,0,389433494),(6375,0,0,13470,1537667975,0,0,573815403),(6396,0,0,13470,1537671155,1,0,955650596),(6397,0,0,13470,1537671575,0,0,558351282),(6418,0,0,13470,1537674755,1,0,603340865),(6419,0,0,13470,1537675175,0,0,880525944),(6440,0,0,13470,1537678355,1,0,942690427),(6441,0,0,13470,1537678775,0,0,701018999),(6462,0,0,13470,1537681955,1,0,358917888),(6463,0,0,13470,1537682375,0,0,999352456),(6484,0,0,13470,1537685555,1,0,955378160),(6485,0,0,13470,1537685975,0,0,629199842),(6506,0,0,13470,1537689155,1,0,916490678),(6507,0,0,13470,1537689575,0,0,623542163),(6528,0,0,13470,1537692755,1,0,542206769),(6529,0,0,13470,1537693175,0,0,824158212),(6531,3,4,29414,1537693517,1,0,13951492),(6552,0,0,13470,1537696355,1,0,672509075),(6553,0,0,13470,1537696775,0,0,617847739),(6574,0,0,13470,1537699955,1,0,980973397),(6575,0,0,13470,1537700375,0,0,589539927),(6596,0,0,13470,1537703555,1,0,489944236),(6597,0,0,13470,1537703975,0,0,315869465),(6618,0,0,13470,1537707155,1,0,612786002),(6619,0,0,13470,1537707575,0,0,930249506),(6640,0,0,13470,1537710755,1,0,638504403),(6641,0,0,13470,1537711175,0,0,292344037),(6662,0,0,13470,1537714355,1,0,373590929),(6663,0,0,13470,1537714775,0,0,699666122),(6684,0,0,13470,1537717955,1,0,442903903),(6685,0,0,13470,1537718375,0,0,969607666),(6706,0,0,13470,1537721555,1,0,996405025),(6707,0,0,13470,1537721975,0,0,245107716),(6730,0,0,13470,1537725155,1,0,414274322),(6731,0,0,13470,1537725575,0,0,271786479),(6752,0,0,13470,1537728755,1,0,523121364),(6753,0,0,13470,1537729175,0,0,29590613),(6774,0,0,13470,1537732355,1,0,714416269),(6775,0,0,13470,1537732775,0,0,419707611),(6796,0,0,13470,1537735955,1,0,707305981),(6797,0,0,13470,1537736375,0,0,826126786),(6818,0,0,13470,1537739555,1,0,261383331),(6819,0,0,13470,1537739975,0,0,55663232),(6840,0,0,13470,1537743155,1,0,751159738),(6841,0,0,13470,1537743575,0,0,816855523),(6862,0,0,13470,1537746755,1,0,429256398),(6863,0,0,13470,1537747175,0,0,303939630),(6885,0,0,13470,1537750355,1,0,634869959),(6886,0,0,13470,1537750775,0,0,976529686),(6887,3,4,29439,1537750842,1,0,354104447),(6908,0,0,13470,1537753955,1,0,514811229),(6909,0,0,13470,1537754375,0,0,772345465),(6910,1,2,8,1537757132,0,0,0),(6911,1,1,8,1537757132,0,0,0),(6912,1,2,9,1537757132,0,0,0),(6913,1,1,9,1537757132,0,0,0),(6914,1,2,1,1537757135,0,0,0),(6915,1,1,1,1537757135,0,0,0),(6916,1,2,2,1537757135,0,0,0),(6917,1,1,2,1537757135,0,0,0),(6918,1,2,10,1537757135,0,0,0),(6919,1,1,10,1537757135,0,0,0),(6920,1,2,3,1537757135,0,0,0),(6921,1,1,3,1537757135,0,0,0),(6922,1,2,4,1537757135,0,0,0),(6923,1,1,4,1537757135,0,0,0),(6924,1,2,5,1537757135,0,0,0),(6925,1,1,5,1537757135,0,0,0),(6926,1,2,6,1537757135,0,0,0),(6927,1,1,6,1537757135,0,0,0),(6928,1,2,7,1537757135,0,0,0),(6929,1,1,7,1537757135,0,0,0),(6930,0,0,13470,1537757555,1,0,699975536),(6931,0,0,13470,1537757975,0,0,412873991),(6932,1,2,8,1537760732,0,0,0),(6933,1,1,8,1537760732,0,0,0),(6934,1,2,9,1537760732,0,0,0),(6935,1,1,9,1537760732,0,0,0),(6936,1,2,1,1537760735,0,0,0),(6937,1,1,1,1537760735,0,0,0),(6938,1,2,2,1537760735,0,0,0),(6939,1,1,2,1537760735,0,0,0),(6940,1,2,10,1537760735,0,0,0),(6941,1,1,10,1537760735,0,0,0),(6942,1,2,3,1537760735,0,0,0),(6943,1,1,3,1537760735,0,0,0),(6944,1,2,4,1537760735,0,0,0),(6945,1,1,4,1537760735,0,0,0),(6946,1,2,5,1537760736,0,0,0),(6947,1,1,5,1537760736,0,0,0),(6948,1,2,6,1537760736,0,0,0),(6949,1,1,6,1537760736,0,0,0),(6950,1,2,7,1537760736,0,0,0),(6951,1,1,7,1537760736,0,0,0),(6952,0,0,13470,1537761155,1,0,669062497),(6953,0,0,13470,1537761575,0,0,423022179),(6954,1,2,8,1537764332,0,0,0),(6955,1,1,8,1537764332,0,0,0),(6956,1,2,9,1537764332,0,0,0),(6957,1,1,9,1537764332,0,0,0),(6958,1,2,1,1537764335,0,0,0),(6959,1,1,1,1537764335,0,0,0),(6960,1,2,2,1537764335,0,0,0),(6961,1,1,2,1537764335,0,0,0),(6962,1,2,10,1537764335,0,0,0),(6963,1,1,10,1537764335,0,0,0),(6964,1,2,3,1537764335,0,0,0),(6965,1,1,3,1537764335,0,0,0),(6966,1,2,4,1537764335,0,0,0),(6967,1,1,4,1537764335,0,0,0),(6968,1,2,5,1537764335,0,0,0),(6969,1,1,5,1537764335,0,0,0),(6970,1,2,6,1537764335,0,0,0),(6971,1,1,6,1537764335,0,0,0),(6972,1,2,7,1537764335,0,0,0),(6973,1,1,7,1537764335,0,0,0),(6974,0,0,13470,1537764755,1,0,335807701),(6975,0,0,13470,1537765175,0,0,705017617),(6976,1,2,8,1537767932,0,0,0),(6977,1,1,8,1537767932,0,0,0),(6978,1,2,9,1537767932,0,0,0),(6979,1,1,9,1537767932,0,0,0),(6980,1,2,1,1537767936,0,0,0),(6981,1,1,1,1537767936,0,0,0),(6982,1,2,2,1537767936,0,0,0),(6983,1,1,2,1537767936,0,0,0),(6984,1,2,10,1537767936,0,0,0),(6985,1,1,10,1537767936,0,0,0),(6986,1,2,3,1537767936,0,0,0),(6987,1,1,3,1537767936,0,0,0),(6988,1,2,4,1537767936,0,0,0),(6989,1,1,4,1537767936,0,0,0),(6990,1,2,5,1537767936,0,0,0),(6991,1,1,5,1537767936,0,0,0),(6992,1,2,6,1537767936,0,0,0),(6993,1,1,6,1537767936,0,0,0),(6994,1,2,7,1537767936,0,0,0),(6995,1,1,7,1537767936,0,0,0),(6996,0,0,13470,1537768355,1,0,941894556),(6997,0,0,13470,1537768775,0,0,418009604),(6998,1,2,8,1537771532,0,0,0),(6999,1,1,8,1537771532,0,0,0),(7000,1,2,9,1537771532,0,0,0),(7001,1,1,9,1537771532,0,0,0),(7002,1,2,1,1537771535,0,0,0),(7003,1,1,1,1537771535,0,0,0),(7004,1,2,2,1537771535,0,0,0),(7005,1,1,2,1537771535,0,0,0),(7006,1,2,10,1537771535,0,0,0),(7007,1,1,10,1537771535,0,0,0),(7008,1,2,3,1537771535,0,0,0),(7009,1,1,3,1537771535,0,0,0),(7010,1,2,4,1537771535,0,0,0),(7011,1,1,4,1537771535,0,0,0),(7012,1,2,5,1537771535,0,0,0),(7013,1,1,5,1537771535,0,0,0),(7014,1,2,6,1537771535,0,0,0),(7015,1,1,6,1537771535,0,0,0),(7016,1,2,7,1537771535,0,0,0),(7017,1,1,7,1537771535,0,0,0),(7018,0,0,13470,1537771955,1,0,214871496),(7019,0,0,13470,1537772375,0,0,622468353),(7020,3,4,29439,1537773042,0,0,234939897),(7021,3,4,29439,1537773342,1,0,470855426),(7022,1,2,8,1537775133,0,0,0),(7023,1,1,8,1537775133,0,0,0),(7024,1,2,9,1537775133,0,0,0),(7025,1,1,9,1537775133,0,0,0),(7026,1,2,1,1537775136,0,0,0),(7027,1,1,1,1537775136,0,0,0),(7028,1,2,2,1537775136,0,0,0),(7029,1,1,2,1537775136,0,0,0),(7030,1,2,10,1537775136,0,0,0),(7031,1,1,10,1537775136,0,0,0),(7032,1,2,3,1537775136,0,0,0),(7033,1,1,3,1537775136,0,0,0),(7034,1,2,4,1537775136,0,0,0),(7035,1,1,4,1537775136,0,0,0),(7036,1,2,5,1537775136,0,0,0),(7037,1,1,5,1537775136,0,0,0),(7038,1,2,6,1537775136,0,0,0),(7039,1,1,6,1537775136,0,0,0),(7040,1,2,7,1537775136,0,0,0),(7041,1,1,7,1537775136,0,0,0),(7042,0,0,13470,1537775555,1,0,316843110),(7043,0,0,13470,1537775975,0,0,210999703),(7044,1,2,8,1537778732,0,0,0),(7045,1,1,8,1537778732,0,0,0),(7046,1,2,9,1537778732,0,0,0),(7047,1,1,9,1537778732,0,0,0),(7048,1,2,1,1537778735,0,0,0),(7049,1,1,1,1537778735,0,0,0),(7050,1,2,2,1537778735,0,0,0),(7051,1,1,2,1537778735,0,0,0),(7052,1,2,10,1537778735,0,0,0),(7053,1,1,10,1537778735,0,0,0),(7054,1,2,3,1537778735,0,0,0),(7055,1,1,3,1537778735,0,0,0),(7056,1,2,4,1537778735,0,0,0),(7057,1,1,4,1537778735,0,0,0),(7058,1,2,5,1537778735,0,0,0),(7059,1,1,5,1537778735,0,0,0),(7060,1,2,6,1537778735,0,0,0),(7061,1,1,6,1537778735,0,0,0),(7062,1,2,7,1537778735,0,0,0),(7063,1,1,7,1537778735,0,0,0),(7064,0,0,13470,1537779155,1,0,288562842),(7065,0,0,13470,1537779575,0,0,981935189),(7066,1,2,8,1537782333,0,0,0),(7067,1,1,8,1537782333,0,0,0),(7068,1,2,9,1537782333,0,0,0),(7069,1,1,9,1537782333,0,0,0),(7070,1,2,1,1537782336,0,0,0),(7071,1,1,1,1537782336,0,0,0),(7072,1,2,2,1537782336,0,0,0),(7073,1,1,2,1537782336,0,0,0),(7074,1,2,10,1537782336,0,0,0),(7075,1,1,10,1537782336,0,0,0),(7076,1,2,3,1537782336,0,0,0),(7077,1,1,3,1537782336,0,0,0),(7078,1,2,4,1537782336,0,0,0),(7079,1,1,4,1537782336,0,0,0),(7080,1,2,5,1537782336,0,0,0),(7081,1,1,5,1537782336,0,0,0),(7082,1,2,6,1537782336,0,0,0),(7083,1,1,6,1537782336,0,0,0),(7084,1,2,7,1537782336,0,0,0),(7085,1,1,7,1537782336,0,0,0),(7086,0,0,13470,1537782755,1,0,254639344),(7087,0,0,13470,1537783175,0,0,843047262),(7088,1,2,8,1537785932,0,0,0),(7089,1,1,8,1537785932,0,0,0),(7090,1,2,9,1537785932,0,0,0),(7091,1,1,9,1537785932,0,0,0),(7092,1,2,1,1537785935,0,0,0),(7093,1,1,1,1537785935,0,0,0),(7094,1,2,2,1537785935,0,0,0),(7095,1,1,2,1537785935,0,0,0),(7096,1,2,10,1537785935,0,0,0),(7097,1,1,10,1537785935,0,0,0),(7098,1,2,3,1537785935,0,0,0),(7099,1,1,3,1537785935,0,0,0),(7100,1,2,4,1537785935,0,0,0),(7101,1,1,4,1537785935,0,0,0),(7102,1,2,5,1537785935,0,0,0),(7103,1,1,5,1537785935,0,0,0),(7104,1,2,6,1537785936,0,0,0),(7105,1,1,6,1537785936,0,0,0),(7106,1,2,7,1537785936,0,0,0),(7107,1,1,7,1537785936,0,0,0),(7108,0,0,13470,1537786355,1,0,429495515),(7109,0,0,13470,1537786775,0,0,335698812),(7110,1,2,8,1537789532,0,0,0),(7111,1,1,8,1537789532,0,0,0),(7112,1,2,9,1537789532,0,0,0),(7113,1,1,9,1537789532,0,0,0),(7114,1,2,1,1537789535,0,0,0),(7115,1,1,1,1537789535,0,0,0),(7116,1,2,2,1537789535,0,0,0),(7117,1,1,2,1537789535,0,0,0),(7118,1,2,10,1537789535,0,0,0),(7119,1,1,10,1537789535,0,0,0),(7120,1,2,3,1537789535,0,0,0),(7121,1,1,3,1537789535,0,0,0),(7122,1,2,4,1537789535,0,0,0),(7123,1,1,4,1537789535,0,0,0),(7124,1,2,5,1537789535,0,0,0),(7125,1,1,5,1537789535,0,0,0),(7126,1,2,6,1537789535,0,0,0),(7127,1,1,6,1537789535,0,0,0),(7128,1,2,7,1537789535,0,0,0),(7129,1,1,7,1537789535,0,0,0),(7130,0,0,13470,1537789955,1,0,973250817),(7131,0,0,13470,1537790375,0,0,712664350),(7132,1,2,8,1537793132,0,0,0),(7133,1,1,8,1537793132,0,0,0),(7134,1,2,9,1537793132,0,0,0),(7135,1,1,9,1537793132,0,0,0),(7136,1,2,1,1537793135,0,0,0),(7137,1,1,1,1537793135,0,0,0),(7138,1,2,2,1537793135,0,0,0),(7139,1,1,2,1537793135,0,0,0),(7140,1,2,10,1537793135,0,0,0),(7141,1,1,10,1537793135,0,0,0),(7142,1,2,3,1537793136,0,0,0),(7143,1,1,3,1537793136,0,0,0),(7144,1,2,4,1537793136,0,0,0),(7145,1,1,4,1537793136,0,0,0),(7146,1,2,5,1537793136,0,0,0),(7147,1,1,5,1537793136,0,0,0),(7148,1,2,6,1537793136,0,0,0),(7149,1,1,6,1537793136,0,0,0),(7150,1,2,7,1537793136,0,0,0),(7151,1,1,7,1537793136,0,0,0),(7152,0,0,13470,1537793555,1,0,377613961),(7153,0,0,13470,1537793975,0,0,809281141),(7154,1,2,8,1537796732,0,0,0),(7155,1,1,8,1537796732,0,0,0),(7156,1,2,9,1537796732,0,0,0),(7157,1,1,9,1537796732,0,0,0),(7158,1,2,1,1537796735,0,0,0),(7159,1,1,1,1537796735,0,0,0),(7160,1,2,2,1537796735,0,0,0),(7161,1,1,2,1537796735,0,0,0),(7162,1,2,10,1537796735,0,0,0),(7163,1,1,10,1537796735,0,0,0),(7164,1,2,3,1537796735,0,0,0),(7165,1,1,3,1537796735,0,0,0),(7166,1,2,4,1537796735,0,0,0),(7167,1,1,4,1537796735,0,0,0),(7168,1,2,5,1537796735,0,0,0),(7169,1,1,5,1537796735,0,0,0),(7170,1,2,6,1537796735,0,0,0),(7171,1,1,6,1537796735,0,0,0),(7172,1,2,7,1537796735,0,0,0),(7173,1,1,7,1537796735,0,0,0),(7174,0,0,13470,1537797155,1,0,375505485),(7175,0,0,13470,1537797575,0,0,779314814),(7176,1,2,8,1537800332,0,0,0),(7177,1,1,8,1537800332,0,0,0),(7178,1,2,9,1537800332,0,0,0),(7179,1,1,9,1537800332,0,0,0),(7180,1,2,1,1537800336,0,0,0),(7181,1,1,1,1537800336,0,0,0),(7182,1,2,2,1537800336,0,0,0),(7183,1,1,2,1537800336,0,0,0),(7184,1,2,10,1537800336,0,0,0),(7185,1,1,10,1537800336,0,0,0),(7186,1,2,3,1537800336,0,0,0),(7187,1,1,3,1537800336,0,0,0),(7188,1,2,4,1537800336,0,0,0),(7189,1,1,4,1537800336,0,0,0),(7190,1,2,5,1537800336,0,0,0),(7191,1,1,5,1537800336,0,0,0),(7192,1,2,6,1537800336,0,0,0),(7193,1,1,6,1537800336,0,0,0),(7194,1,2,7,1537800336,0,0,0),(7195,1,1,7,1537800336,0,0,0),(7196,0,0,13470,1537800755,1,0,443773758),(7197,0,0,13470,1537801175,0,0,513033385),(7198,1,2,8,1537803932,0,0,0),(7199,1,1,8,1537803932,0,0,0),(7200,1,2,9,1537803932,0,0,0),(7201,1,1,9,1537803932,0,0,0),(7202,1,2,1,1537803935,0,0,0),(7203,1,1,1,1537803935,0,0,0),(7204,1,2,2,1537803935,0,0,0),(7205,1,1,2,1537803935,0,0,0),(7206,1,2,10,1537803935,0,0,0),(7207,1,1,10,1537803935,0,0,0),(7208,1,2,3,1537803935,0,0,0),(7209,1,1,3,1537803935,0,0,0),(7210,1,2,4,1537803935,0,0,0),(7211,1,1,4,1537803935,0,0,0),(7212,1,2,5,1537803935,0,0,0),(7213,1,1,5,1537803935,0,0,0),(7214,1,2,6,1537803935,0,0,0),(7215,1,1,6,1537803935,0,0,0),(7216,1,2,7,1537803935,0,0,0),(7217,1,1,7,1537803935,0,0,0),(7218,0,0,13470,1537804355,1,0,974229687),(7219,0,0,13470,1537804775,0,0,491306955),(7220,1,2,8,1537807533,0,0,0),(7221,1,1,8,1537807533,0,0,0),(7222,1,2,9,1537807533,0,0,0),(7223,1,1,9,1537807533,0,0,0),(7224,1,2,1,1537807536,0,0,0),(7225,1,1,1,1537807536,0,0,0),(7226,1,2,2,1537807536,0,0,0),(7227,1,1,2,1537807536,0,0,0),(7228,1,2,10,1537807536,0,0,0),(7229,1,1,10,1537807536,0,0,0),(7230,1,2,3,1537807536,0,0,0),(7231,1,1,3,1537807536,0,0,0),(7232,1,2,4,1537807536,0,0,0),(7233,1,1,4,1537807536,0,0,0),(7234,1,2,5,1537807536,0,0,0),(7235,1,1,5,1537807536,0,0,0),(7236,1,2,6,1537807536,0,0,0),(7237,1,1,6,1537807536,0,0,0),(7238,1,2,7,1537807536,0,0,0),(7239,1,1,7,1537807536,0,0,0),(7240,0,0,13470,1537807955,1,0,394805490),(7241,0,0,13470,1537808375,0,0,408871441),(7242,1,2,8,1537811132,0,0,0),(7243,1,1,8,1537811132,0,0,0),(7244,1,2,9,1537811132,0,0,0),(7245,1,1,9,1537811132,0,0,0),(7246,1,2,1,1537811135,0,0,0),(7247,1,1,1,1537811135,0,0,0),(7248,1,2,2,1537811135,0,0,0),(7249,1,1,2,1537811135,0,0,0),(7250,1,2,10,1537811135,0,0,0),(7251,1,1,10,1537811135,0,0,0),(7252,1,2,3,1537811135,0,0,0),(7253,1,1,3,1537811135,0,0,0),(7254,1,2,4,1537811135,0,0,0),(7255,1,1,4,1537811135,0,0,0),(7256,1,2,5,1537811135,0,0,0),(7257,1,1,5,1537811135,0,0,0),(7258,1,2,6,1537811135,0,0,0),(7259,1,1,6,1537811135,0,0,0),(7260,1,2,7,1537811135,0,0,0),(7261,1,1,7,1537811135,0,0,0),(7262,0,0,13470,1537811555,1,0,546331756),(7263,0,0,13470,1537811975,0,0,841049702),(7264,1,2,8,1537814733,0,0,0),(7265,1,1,8,1537814733,0,0,0),(7266,1,2,9,1537814733,0,0,0),(7267,1,1,9,1537814733,0,0,0),(7268,1,2,1,1537814736,0,0,0),(7269,1,1,1,1537814736,0,0,0),(7270,1,2,2,1537814736,0,0,0),(7271,1,1,2,1537814736,0,0,0),(7272,1,2,10,1537814736,0,0,0),(7273,1,1,10,1537814736,0,0,0),(7274,1,2,3,1537814736,0,0,0),(7275,1,1,3,1537814736,0,0,0),(7276,1,2,4,1537814736,0,0,0),(7277,1,1,4,1537814736,0,0,0),(7278,1,2,5,1537814736,0,0,0),(7279,1,1,5,1537814736,0,0,0),(7280,1,2,6,1537814736,0,0,0),(7281,1,1,6,1537814736,0,0,0),(7282,1,2,7,1537814736,0,0,0),(7283,1,1,7,1537814736,0,0,0),(7284,0,0,13470,1537815155,1,0,394765615),(7285,0,0,13470,1537815575,0,0,492041256),(7286,1,2,8,1537818332,0,0,0),(7287,1,1,8,1537818332,0,0,0),(7288,1,2,9,1537818332,0,0,0),(7289,1,1,9,1537818332,0,0,0),(7290,1,2,1,1537818335,0,0,0),(7291,1,1,1,1537818335,0,0,0),(7292,1,2,2,1537818335,0,0,0),(7293,1,1,2,1537818335,0,0,0),(7294,1,2,10,1537818335,0,0,0),(7295,1,1,10,1537818335,0,0,0),(7296,1,2,3,1537818335,0,0,0),(7297,1,1,3,1537818335,0,0,0),(7298,1,2,4,1537818335,0,0,0),(7299,1,1,4,1537818335,0,0,0),(7300,1,2,5,1537818335,0,0,0),(7301,1,1,5,1537818335,0,0,0),(7302,1,2,6,1537818335,0,0,0),(7303,1,1,6,1537818335,0,0,0),(7304,1,2,7,1537818335,0,0,0),(7305,1,1,7,1537818335,0,0,0),(7306,0,0,13470,1537818755,1,0,627521583),(7307,0,0,13470,1537819175,0,0,713456859),(7308,1,2,8,1537821932,0,0,0),(7309,1,1,8,1537821932,0,0,0),(7310,1,2,9,1537821932,0,0,0),(7311,1,1,9,1537821932,0,0,0),(7312,1,2,1,1537821935,0,0,0),(7313,1,1,1,1537821935,0,0,0),(7314,1,2,2,1537821935,0,0,0),(7315,1,1,2,1537821935,0,0,0),(7316,1,2,10,1537821935,0,0,0),(7317,1,1,10,1537821935,0,0,0),(7318,1,2,3,1537821935,0,0,0),(7319,1,1,3,1537821935,0,0,0),(7320,1,2,4,1537821935,0,0,0),(7321,1,1,4,1537821935,0,0,0),(7322,1,2,5,1537821935,0,0,0),(7323,1,1,5,1537821935,0,0,0),(7324,1,2,6,1537821935,0,0,0),(7325,1,1,6,1537821935,0,0,0),(7326,1,2,7,1537821935,0,0,0),(7327,1,1,7,1537821935,0,0,0),(7328,0,0,13470,1537822355,1,0,673481737),(7329,0,0,13470,1537822775,0,0,27725369),(7330,1,2,8,1537825532,0,0,0),(7331,1,1,8,1537825532,0,0,0),(7332,1,2,9,1537825532,0,0,0),(7333,1,1,9,1537825532,0,0,0),(7334,1,2,1,1537825535,0,0,0),(7335,1,1,1,1537825535,0,0,0),(7336,1,2,2,1537825535,0,0,0),(7337,1,1,2,1537825535,0,0,0),(7338,1,2,10,1537825535,0,0,0),(7339,1,1,10,1537825535,0,0,0),(7340,1,2,3,1537825536,0,0,0),(7341,1,1,3,1537825536,0,0,0),(7342,1,2,4,1537825536,0,0,0),(7343,1,1,4,1537825536,0,0,0),(7344,1,2,5,1537825536,0,0,0),(7345,1,1,5,1537825536,0,0,0),(7346,1,2,6,1537825536,0,0,0),(7347,1,1,6,1537825536,0,0,0),(7348,1,2,7,1537825536,0,0,0),(7349,1,1,7,1537825536,0,0,0),(7350,0,0,13470,1537825955,1,0,389599116),(7351,0,0,13470,1537826375,0,0,625315649),(7352,3,4,29439,1537828242,0,0,650564195),(7353,3,4,29439,1537828542,1,0,218784738),(7354,1,2,8,1537829132,0,0,0),(7355,1,1,8,1537829132,0,0,0),(7356,1,2,9,1537829132,0,0,0),(7357,1,1,9,1537829132,0,0,0),(7358,1,2,1,1537829135,0,0,0),(7359,1,1,1,1537829135,0,0,0),(7360,1,2,2,1537829135,0,0,0),(7361,1,1,2,1537829135,0,0,0),(7362,1,2,10,1537829135,0,0,0),(7363,1,1,10,1537829135,0,0,0),(7364,1,2,3,1537829135,0,0,0),(7365,1,1,3,1537829135,0,0,0),(7366,1,2,4,1537829135,0,0,0),(7367,1,1,4,1537829135,0,0,0),(7368,1,2,5,1537829135,0,0,0),(7369,1,1,5,1537829135,0,0,0),(7370,1,2,6,1537829135,0,0,0),(7371,1,1,6,1537829135,0,0,0),(7372,1,2,7,1537829135,0,0,0),(7373,1,1,7,1537829135,0,0,0),(7374,0,0,13470,1537829555,1,0,940213109),(7375,0,0,13470,1537829975,0,0,476349597),(7376,1,2,8,1537832732,0,0,0),(7377,1,1,8,1537832732,0,0,0),(7378,1,2,9,1537832732,0,0,0),(7379,1,1,9,1537832732,0,0,0),(7380,1,2,1,1537832736,0,0,0),(7381,1,1,1,1537832736,0,0,0),(7382,1,2,2,1537832736,0,0,0),(7383,1,1,2,1537832736,0,0,0),(7384,1,2,10,1537832736,0,0,0),(7385,1,1,10,1537832736,0,0,0),(7386,1,2,3,1537832736,0,0,0),(7387,1,1,3,1537832736,0,0,0),(7388,1,2,4,1537832736,0,0,0),(7389,1,1,4,1537832736,0,0,0),(7390,1,2,5,1537832736,0,0,0),(7391,1,1,5,1537832736,0,0,0),(7392,1,2,6,1537832736,0,0,0),(7393,1,1,6,1537832736,0,0,0),(7394,1,2,7,1537832736,0,0,0),(7395,1,1,7,1537832736,0,0,0),(7396,0,0,13470,1537833155,1,0,854034364),(7397,0,0,13470,1537833575,0,0,435522540),(7398,1,2,8,1537836332,0,0,0),(7399,1,1,8,1537836332,0,0,0),(7400,1,2,9,1537836332,0,0,0),(7401,1,1,9,1537836332,0,0,0),(7402,1,2,1,1537836335,0,0,0),(7403,1,1,1,1537836335,0,0,0),(7404,1,2,2,1537836335,0,0,0),(7405,1,1,2,1537836335,0,0,0),(7406,1,2,10,1537836335,0,0,0),(7407,1,1,10,1537836335,0,0,0),(7408,1,2,3,1537836335,0,0,0),(7409,1,1,3,1537836335,0,0,0),(7410,1,2,4,1537836335,0,0,0),(7411,1,1,4,1537836335,0,0,0),(7412,1,2,5,1537836335,0,0,0),(7413,1,1,5,1537836335,0,0,0),(7414,1,2,6,1537836335,0,0,0),(7415,1,1,6,1537836335,0,0,0),(7416,1,2,7,1537836335,0,0,0),(7417,1,1,7,1537836335,0,0,0),(7418,0,0,13470,1537836755,1,0,375824134),(7419,0,0,13470,1537837175,0,0,821389147),(7420,1,2,8,1537839932,0,0,0),(7421,1,1,8,1537839932,0,0,0),(7422,1,2,9,1537839932,0,0,0),(7423,1,1,9,1537839932,0,0,0),(7424,1,2,1,1537839935,0,0,0),(7425,1,1,1,1537839935,0,0,0),(7426,1,2,2,1537839935,0,0,0),(7427,1,1,2,1537839935,0,0,0),(7428,1,2,10,1537839935,0,0,0),(7429,1,1,10,1537839935,0,0,0),(7430,1,2,3,1537839935,0,0,0),(7431,1,1,3,1537839935,0,0,0),(7432,1,2,4,1537839935,0,0,0),(7433,1,1,4,1537839935,0,0,0),(7434,1,2,5,1537839935,0,0,0),(7435,1,1,5,1537839935,0,0,0),(7436,1,2,6,1537839935,0,0,0),(7437,1,1,6,1537839935,0,0,0),(7438,1,2,7,1537839935,0,0,0),(7439,1,1,7,1537839935,0,0,0),(7440,0,0,13470,1537840355,1,0,575931244),(7441,0,0,13470,1537840775,0,0,799456353);
/*!40000 ALTER TABLE `events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `expressions`
--

DROP TABLE IF EXISTS `expressions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `expressions` (
  `expressionid` bigint(20) unsigned NOT NULL,
  `regexpid` bigint(20) unsigned NOT NULL,
  `expression` varchar(255) NOT NULL DEFAULT '',
  `expression_type` int(11) NOT NULL DEFAULT '0',
  `exp_delimiter` varchar(1) NOT NULL DEFAULT '',
  `case_sensitive` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`expressionid`),
  KEY `expressions_1` (`regexpid`),
  CONSTRAINT `c_expressions_1` FOREIGN KEY (`regexpid`) REFERENCES `regexps` (`regexpid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expressions`
--

LOCK TABLES `expressions` WRITE;
/*!40000 ALTER TABLE `expressions` DISABLE KEYS */;
INSERT INTO `expressions` VALUES (1,1,'^(btrfs|ext2|ext3|ext4|jfs|reiser|xfs|ffs|ufs|jfs|jfs2|vxfs|hfs|refs|ntfs|fat32|zfs)$',3,',',0),(3,3,'^(Physical memory|Virtual memory|Memory buffers|Cached memory|Swap space)$',4,',',1),(5,4,'^(MMCSS|gupdate|SysmonLog|clr_optimization_v2.0.50727_32|clr_optimization_v4.0.30319_32)$',4,',',1),(6,5,'^(automatic|automatic delayed)$',3,',',1),(7,2,'^Software Loopback Interface',4,',',1),(8,2,'^(In)?[Ll]oop[Bb]ack[0-9._]*$',4,',',1),(9,2,'^NULL[0-9.]*$',4,',',1),(10,2,'^[Ll]o[0-9.]*$',4,',',1),(11,2,'^[Ss]ystem$',4,',',1),(12,2,'^Nu[0-9.]*$',4,',',1);
/*!40000 ALTER TABLE `expressions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `functions`
--

DROP TABLE IF EXISTS `functions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `functions` (
  `functionid` bigint(20) unsigned NOT NULL,
  `itemid` bigint(20) unsigned NOT NULL,
  `triggerid` bigint(20) unsigned NOT NULL,
  `function` varchar(12) NOT NULL DEFAULT '',
  `parameter` varchar(255) NOT NULL DEFAULT '0',
  PRIMARY KEY (`functionid`),
  KEY `functions_1` (`triggerid`),
  KEY `functions_2` (`itemid`,`function`,`parameter`),
  CONSTRAINT `c_functions_1` FOREIGN KEY (`itemid`) REFERENCES `items` (`itemid`) ON DELETE CASCADE,
  CONSTRAINT `c_functions_2` FOREIGN KEY (`triggerid`) REFERENCES `triggers` (`triggerid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `functions`
--

LOCK TABLES `functions` WRITE;
/*!40000 ALTER TABLE `functions` DISABLE KEYS */;
INSERT INTO `functions` VALUES (10199,10019,10016,'diff','0'),(10204,10055,10041,'last','0'),(10207,10058,10044,'diff','0'),(10208,10057,10043,'diff','0'),(12144,22181,13000,'last','0'),(12549,22232,13025,'nodata','5m'),(12550,10020,10047,'nodata','5m'),(12553,10056,10042,'last','0'),(12580,17350,10012,'last','0'),(12583,10025,10021,'change','0'),(12592,22686,13266,'last','0'),(12598,22454,13272,'last','0'),(12641,22189,13015,'min','10m'),(12645,22183,13073,'min','10m'),(12646,22191,13074,'min','10m'),(12648,23620,13075,'min','10m'),(12649,22185,13019,'min','10m'),(12651,22396,13017,'min','10m'),(12653,22219,13023,'min','10m'),(12715,22833,13328,'nodata','5m'),(12717,22835,13330,'last','0'),(12718,22836,13331,'last','0'),(12723,22853,13336,'diff','0'),(12724,22856,13337,'last','0'),(12725,22858,13338,'diff','0'),(12726,22859,13339,'change','0'),(12727,22861,13340,'diff','0'),(12728,22862,13341,'last','0'),(12729,22869,13342,'last','0'),(12730,22872,13343,'last','0'),(12731,22873,13344,'nodata','5m'),(12733,22875,13346,'last','0'),(12734,22876,13347,'last','0'),(12739,22893,13352,'diff','0'),(12740,22896,13353,'last','0'),(12741,22898,13354,'diff','0'),(12742,22899,13355,'change','0'),(12743,22901,13356,'diff','0'),(12744,22902,13357,'last','0'),(12745,22909,13358,'last','0'),(12746,22912,13359,'last','0'),(12747,22913,13360,'nodata','5m'),(12755,22933,13368,'diff','0'),(12757,22938,13370,'diff','0'),(12758,22939,13371,'change','0'),(12759,22941,13372,'diff','0'),(12760,22942,13373,'last','0'),(12761,22949,13374,'last','0'),(12762,22952,13375,'last','0'),(12763,22953,13376,'nodata','5m'),(12771,22973,13384,'diff','0'),(12773,22978,13386,'diff','0'),(12775,22981,13388,'diff','0'),(12776,22982,13389,'last','0'),(12777,22989,13390,'last','0'),(12778,22992,13391,'last','0'),(12779,22993,13392,'nodata','5m'),(12782,22996,13395,'last','0'),(12787,23013,13400,'diff','0'),(12788,23016,13401,'last','0'),(12789,23018,13402,'diff','0'),(12790,23019,13403,'change','0'),(12791,23021,13404,'diff','0'),(12792,23022,13405,'last','0'),(12793,23029,13406,'last','0'),(12794,23032,13407,'last','0'),(12795,23033,13408,'nodata','5m'),(12797,23035,13410,'last','0'),(12798,23036,13411,'last','0'),(12803,23053,13416,'diff','0'),(12805,23058,13418,'diff','0'),(12806,23059,13419,'change','0'),(12807,23061,13420,'diff','0'),(12808,23062,13421,'last','0'),(12809,23069,13422,'last','0'),(12810,23072,13423,'last','0'),(12812,23149,13425,'diff','0'),(12815,23150,13428,'change','0'),(12818,23668,13431,'min','10m'),(12820,23158,13433,'last','0'),(12824,23160,13437,'nodata','5m'),(12826,23165,13439,'last','0'),(12895,23271,13486,'min','10m'),(12896,23273,13487,'min','10m'),(12897,23274,13488,'min','10m'),(12898,23275,13489,'min','10m'),(12899,23276,13490,'min','10m'),(12900,23287,13491,'nodata','5m'),(12902,23289,13493,'last','0'),(12903,23290,13494,'last','0'),(12908,23307,13499,'diff','0'),(12909,23310,13500,'last','0'),(12910,23312,13501,'diff','0'),(12911,23313,13502,'change','0'),(12912,23315,13503,'diff','0'),(12913,23316,13504,'last','0'),(12914,23282,13505,'last','0'),(12915,23284,13506,'last','0'),(12926,22231,13026,'diff','0'),(12927,10059,10045,'diff','0'),(12928,23288,13492,'diff','0'),(12929,22834,13329,'diff','0'),(12930,22874,13345,'diff','0'),(12931,22914,13361,'diff','0'),(12932,22954,13377,'diff','0'),(12933,22994,13393,'diff','0'),(12934,23034,13409,'diff','0'),(12935,23161,13438,'diff','0'),(12936,23318,13507,'diff','0'),(12937,23319,13508,'diff','0'),(12938,23327,13509,'diff','0'),(12939,23320,13510,'diff','0'),(12940,23321,13511,'diff','0'),(12941,23322,13512,'diff','0'),(12942,23323,13513,'diff','0'),(12943,23324,13514,'diff','0'),(12944,23325,13515,'diff','0'),(12945,23326,13516,'diff','0'),(12946,23357,13517,'min','10m'),(12947,23342,13518,'min','10m'),(12948,23341,13519,'min','10m'),(12949,23359,13520,'min','10m'),(12965,23634,13536,'min','10m'),(12966,23635,13537,'min','10m'),(12994,23644,13544,'max','#3'),(12995,23645,13545,'max','#3'),(12996,23646,13546,'max','#3'),(12997,23647,13547,'max','#3'),(12998,23648,13548,'max','#3'),(13068,23115,13367,'avg','5m'),(13069,22922,13366,'avg','5m'),(13070,22918,13365,'avg','5m'),(13071,22917,13364,'avg','5m'),(13072,22882,13350,'avg','5m'),(13073,22878,13349,'avg','5m'),(13074,22877,13348,'avg','5m'),(13075,22962,13382,'avg','5m'),(13078,10010,10010,'avg','5m'),(13079,23296,13497,'avg','5m'),(13080,17362,13243,'avg','5m'),(13081,23301,13498,'avg','5m'),(13082,10009,10190,'avg','5m'),(13083,23292,13496,'avg','5m'),(13084,10013,10011,'avg','5m'),(13085,23291,13495,'avg','5m'),(13086,23042,13414,'avg','5m'),(13087,22842,13334,'avg','5m'),(13088,22838,13333,'avg','5m'),(13089,22837,13332,'avg','5m'),(13090,23007,13399,'avg','5m'),(13091,23002,13398,'avg','5m'),(13092,22998,13397,'avg','5m'),(13093,22997,13396,'avg','5m'),(13094,23143,13435,'avg','5m'),(13095,23140,13430,'avg','5m'),(13152,23651,13551,'max','#3'),(13154,23649,13549,'max','#3'),(13156,23650,13550,'max','#3'),(13157,23652,13552,'max','#3'),(13158,23653,13553,'max','#3'),(13159,23654,13285,'max','#3'),(13160,23661,13557,'last',''),(13161,23662,13558,'last',''),(13164,22424,13080,'avg','10m'),(13165,23252,13467,'avg','10m'),(13170,22412,13081,'avg','10m'),(13171,23253,13468,'avg','10m'),(13172,22430,13083,'avg','10m'),(13173,23255,13470,'avg','10m'),(13174,22422,13084,'avg','10m'),(13175,23256,13471,'avg','10m'),(13176,22406,13085,'avg','10m'),(13177,23257,13472,'avg','10m'),(13178,22408,13086,'avg','30m'),(13179,23258,13473,'avg','30m'),(13180,22402,13087,'avg','10m'),(13181,23259,13474,'avg','10m'),(13182,22418,13088,'avg','10m'),(13183,23260,13475,'avg','10m'),(13184,22416,13089,'avg','10m'),(13185,23261,13476,'avg','10m'),(13186,22689,13275,'avg','10m'),(13187,23262,13477,'avg','10m'),(13188,22399,13091,'avg','10m'),(13189,23264,13479,'avg','10m'),(13190,22420,13092,'avg','10m'),(13191,23265,13480,'avg','10m'),(13192,22414,13093,'min','10m'),(13193,23266,13481,'min','10m'),(13194,23171,13441,'avg','10m'),(13195,23267,13482,'avg','10m'),(13196,23663,13559,'avg','10m'),(13197,23664,13560,'avg','10m'),(13198,22426,13094,'avg','10m'),(13199,23268,13483,'avg','10m'),(13200,22404,13095,'avg','10m'),(13201,23269,13484,'avg','10m'),(13202,22400,13096,'avg','10m'),(13203,23270,13485,'avg','10m'),(13204,22401,13097,'avg','10m'),(13205,23328,13436,'avg','10m'),(13206,23347,13521,'avg','10m'),(13207,23360,13534,'avg','10m'),(13208,23352,13522,'avg','10m'),(13209,23351,13535,'avg','10m'),(13210,23350,13523,'avg','10m'),(13211,23353,13524,'avg','30m'),(13212,23354,13525,'avg','10m'),(13213,23356,13526,'avg','10m'),(13214,23355,13527,'avg','10m'),(13215,23349,13528,'avg','10m'),(13216,23348,13529,'avg','10m'),(13217,23343,13530,'avg','10m'),(13218,23344,13531,'avg','10m'),(13219,23345,13532,'avg','10m'),(13220,23346,13533,'avg','10m'),(13221,23666,13561,'min','#3'),(13222,25366,13562,'avg','10m'),(13223,25367,13563,'avg','10m'),(13224,25368,13564,'avg','10m'),(13225,25369,13565,'avg','10m'),(13226,25370,13566,'avg','10m'),(13227,25371,13567,'avg','10m'),(13228,25665,13568,'avg','10m'),(13229,25666,13569,'avg','10m'),(13230,25667,13570,'avg','10m'),(13231,25668,13571,'avg','10m'),(14249,26831,14163,'last','0'),(14250,26832,14163,'last','0'),(14251,26838,14164,'last','0'),(14252,26836,14164,'last','0'),(14253,26833,14165,'last','0'),(14254,26834,14165,'last','0'),(14255,26827,14166,'str','off'),(14256,26824,14167,'str','off'),(14257,26909,14168,'last','0'),(14258,26908,14168,'last','0'),(14259,26899,14169,'last','0'),(14260,26903,14169,'last','0'),(14261,26902,14170,'last','0'),(14262,26901,14170,'last','0'),(14263,26864,14171,'last','0'),(14264,26882,14171,'last','0'),(14265,26866,14172,'last','0'),(14266,26865,14172,'last','0'),(14267,26861,14173,'last','0'),(14268,26862,14173,'last','0'),(14269,26858,14174,'last','0'),(14270,26856,14174,'last','0'),(14271,26868,14175,'last','0'),(14272,26860,14175,'last','0'),(14273,26877,14176,'last','0'),(14274,26878,14176,'last','0'),(14275,26880,14177,'last','0'),(14276,26879,14177,'last','0'),(14277,26881,14178,'last','0'),(14278,26887,14179,'last','0'),(14279,26895,14179,'last','0'),(14280,26889,14180,'last','0'),(14281,26884,14180,'last','0'),(14282,26906,14181,'last','0'),(14283,26896,14181,'last','0'),(14284,26907,14182,'last','0'),(14285,26908,14182,'last','0'),(14286,26904,14183,'last','0'),(14287,26903,14183,'last','0'),(14288,26900,14184,'last','0'),(14289,26901,14184,'last','0'),(14290,26883,14185,'last','0'),(14291,26882,14185,'last','0'),(14292,26863,14186,'last','0'),(14293,26865,14186,'last','0'),(14294,26867,14187,'last','0'),(14295,26862,14187,'last','0'),(14296,26857,14188,'last','0'),(14297,26856,14188,'last','0'),(14298,26859,14189,'last','0'),(14299,26860,14189,'last','0'),(14300,26869,14190,'last','0'),(14301,26878,14190,'last','0'),(14302,26876,14191,'nodata','5m'),(14303,26875,14192,'str','Server'),(14304,26893,14193,'str','Client'),(14305,26924,14194,'last','0'),(14306,26932,14195,'last','0'),(14307,26932,14196,'last','0'),(14308,26930,14197,'last','0'),(14309,26930,14198,'last','0'),(14310,26931,14199,'last','0'),(14311,26931,14200,'last','0'),(14312,26929,14201,'last','0'),(14313,26929,14202,'last','0'),(14314,26928,14203,'last','0'),(14315,26928,14204,'last','0'),(14316,26925,14205,'last','0'),(14317,26943,14206,'last','0'),(14318,26943,14207,'last','0'),(14319,26939,14208,'last','0'),(14320,26939,14209,'last','0'),(14321,26940,14210,'last','0'),(14322,26940,14211,'last','0'),(14323,26941,14212,'last','0'),(14324,26941,14213,'last','0'),(14325,26942,14214,'last','0'),(14326,26942,14215,'last','0'),(14327,26938,14216,'last','0'),(14328,26938,14217,'last','0'),(14329,26937,14218,'last','0'),(14330,26937,14219,'last','0'),(14331,26933,14220,'last','0'),(14332,26933,14221,'last','0'),(14333,26934,14222,'last','0'),(14334,26935,14223,'last','0'),(14335,26935,14224,'last','0'),(14336,26936,14225,'last','0'),(14337,26936,14226,'last','0'),(14370,27036,14243,'avg','5m'),(14372,27044,14245,'avg','5m'),(14373,27044,14246,'avg','5m'),(14374,27052,14247,'avg','5m'),(14376,27060,14249,'avg','5m'),(14377,27060,14250,'avg','5m'),(14378,27067,14251,'max','#3'),(14379,27066,14252,'min','5m'),(14380,27065,14253,'avg','5m'),(14463,27138,14288,'max','#3'),(14464,27139,14289,'min','5m'),(14465,27140,14290,'avg','5m'),(14466,27148,14291,'last',''),(14468,27149,14293,'max','#3'),(14469,27150,14294,'min','5m'),(14470,27151,14295,'avg','5m'),(14471,27159,14296,'last',''),(14508,27192,14311,'max','#3'),(14509,27193,14312,'min','5m'),(14510,27194,14313,'avg','5m'),(14511,27201,14314,'last',''),(14513,27208,14316,'avg','5m'),(14514,27205,14317,'avg','5m'),(14515,27212,14318,'avg','5m'),(14516,27212,14318,'max','5m'),(14517,27212,14319,'avg','5m'),(14518,27212,14319,'max','5m'),(14519,27212,14320,'avg','5m'),(14520,27212,14320,'min','5m'),(14522,27214,14322,'diff',''),(14523,27214,14322,'strlen',''),(14536,27225,14327,'max','#3'),(14537,27226,14328,'min','5m'),(14538,27227,14329,'avg','5m'),(14539,27234,14330,'last',''),(14541,27240,14332,'avg','5m'),(14542,27239,14333,'avg','5m'),(14543,27238,14334,'last','0'),(14544,27238,14335,'last','0'),(14545,27237,14336,'diff',''),(14546,27237,14336,'strlen',''),(14547,27236,14337,'diff',''),(14548,27236,14337,'strlen',''),(14552,27247,14339,'avg','5m'),(14553,27247,14339,'max','5m'),(14554,27247,14340,'avg','5m'),(14555,27247,14340,'min','5m'),(14570,27261,14347,'max','#3'),(14571,27262,14348,'min','5m'),(14572,27263,14349,'avg','5m'),(14573,27270,14350,'last',''),(14587,27282,14356,'max','#3'),(14588,27283,14357,'min','5m'),(14589,27284,14358,'avg','5m'),(14590,27291,14359,'last',''),(14592,27294,14361,'avg','5m'),(14593,27293,14362,'avg','5m'),(14594,27296,14363,'diff',''),(14595,27296,14363,'strlen',''),(14596,27295,14364,'diff',''),(14597,27295,14364,'strlen',''),(14598,27297,14365,'diff',''),(14599,27297,14365,'strlen',''),(14600,27299,14366,'avg','5m'),(14601,27301,14367,'avg','5m'),(14602,27298,14368,'avg','5m'),(14603,27300,14369,'avg','5m'),(14606,27314,14372,'avg','5m'),(14607,27314,14372,'max','5m'),(14608,27314,14373,'avg','5m'),(14609,27314,14373,'max','5m'),(14610,27314,14374,'avg','5m'),(14611,27314,14374,'min','5m'),(14612,27315,14375,'avg','5m'),(14613,27315,14375,'max','5m'),(14614,27315,14376,'avg','5m'),(14615,27315,14376,'max','5m'),(14616,27315,14377,'avg','5m'),(14617,27315,14377,'min','5m'),(14620,27318,14380,'avg','5m'),(14621,27318,14380,'max','5m'),(14622,27318,14381,'avg','5m'),(14623,27318,14381,'max','5m'),(14624,27318,14382,'avg','5m'),(14625,27318,14382,'min','5m'),(14626,27320,14383,'diff',''),(14627,27320,14383,'strlen',''),(14641,27333,14389,'max','#3'),(14642,27334,14390,'min','5m'),(14643,27335,14391,'avg','5m'),(14644,27342,14392,'last',''),(14663,27365,14403,'max','#3'),(14664,27366,14404,'min','5m'),(14665,27367,14405,'avg','5m'),(14666,27374,14406,'last',''),(14668,27376,14408,'avg','5m'),(14669,27378,14409,'diff',''),(14670,27378,14409,'strlen',''),(14671,27380,14410,'avg','5m'),(14672,27385,14411,'diff',''),(14673,27385,14411,'strlen',''),(14676,27382,14413,'diff',''),(14677,27382,14413,'strlen',''),(14678,27414,14414,'avg','5m'),(14679,27417,14415,'avg','5m'),(14681,27419,14417,'diff',''),(14682,27419,14417,'strlen',''),(14689,27421,14420,'avg','5m'),(14690,27421,14420,'min','5m'),(14693,27424,14423,'avg','5m'),(14695,27442,14425,'avg','5m'),(14696,27427,14426,'avg','5m'),(14698,27428,14428,'diff',''),(14699,27428,14428,'strlen',''),(14702,27445,14430,'diff',''),(14703,27445,14430,'strlen',''),(14722,27430,14437,'avg','5m'),(14723,27430,14437,'min','5m'),(14726,27447,14439,'avg','5m'),(14727,27447,14439,'min','5m'),(14747,27462,14451,'max','#3'),(14748,27463,14452,'min','5m'),(14749,27464,14453,'avg','5m'),(14750,27471,14454,'last',''),(14752,27478,14456,'avg','5m'),(14753,27477,14457,'avg','5m'),(14756,27485,14460,'avg','5m'),(14757,27485,14460,'max','5m'),(14758,27485,14461,'avg','5m'),(14759,27485,14461,'max','5m'),(14760,27485,14462,'avg','5m'),(14761,27485,14462,'min','5m'),(14762,27483,14463,'diff',''),(14763,27483,14463,'strlen',''),(14776,27496,14468,'max','#3'),(14777,27497,14469,'min','5m'),(14778,27498,14470,'avg','5m'),(14779,27505,14471,'last',''),(14781,27511,14473,'avg','5m'),(14782,27509,14474,'diff',''),(14783,27509,14474,'strlen',''),(14784,27516,14475,'avg','5m'),(14785,27517,14476,'avg','5m'),(14786,27517,14476,'max','5m'),(14787,27517,14477,'avg','5m'),(14788,27517,14477,'max','5m'),(14789,27517,14478,'avg','5m'),(14790,27517,14478,'min','5m'),(14806,27532,14486,'max','#3'),(14807,27533,14487,'min','5m'),(14808,27534,14488,'avg','5m'),(14809,27541,14489,'last',''),(14811,27547,14491,'avg','5m'),(14812,27545,14492,'diff',''),(14813,27545,14492,'strlen',''),(14814,27544,14493,'diff',''),(14815,27544,14493,'strlen',''),(14816,27552,14494,'avg','5m'),(14817,27553,14495,'avg','5m'),(14818,27553,14495,'max','5m'),(14819,27553,14496,'avg','5m'),(14820,27553,14496,'max','5m'),(14821,27553,14497,'avg','5m'),(14822,27553,14497,'min','5m'),(14838,27568,14505,'max','#3'),(14839,27569,14506,'min','5m'),(14840,27570,14507,'avg','5m'),(14841,27577,14508,'last',''),(14843,27586,14510,'avg','5m'),(14844,27584,14511,'avg','5m'),(14845,27584,14511,'max','5m'),(14849,27584,14513,'avg','5m'),(14850,27584,14513,'min','5m'),(14851,27582,14514,'diff',''),(14852,27582,14514,'strlen',''),(14853,27579,14515,'diff',''),(14854,27579,14515,'strlen',''),(14855,27590,14516,'avg','5m'),(14871,27608,14524,'max','#3'),(14872,27609,14525,'min','5m'),(14873,27610,14526,'avg','5m'),(14874,27617,14527,'last',''),(14889,27631,14534,'max','#3'),(14890,27632,14535,'min','5m'),(14891,27633,14536,'avg','5m'),(14892,27640,14537,'last',''),(14907,27654,14544,'max','#3'),(14908,27655,14545,'min','5m'),(14909,27656,14546,'avg','5m'),(14910,27663,14547,'last',''),(14912,27671,14549,'avg','5m'),(14913,27670,14550,'avg','5m'),(14914,27672,14551,'avg','5m'),(14915,27672,14551,'max','5m'),(14916,27672,14552,'avg','5m'),(14917,27672,14552,'max','5m'),(14918,27672,14553,'avg','5m'),(14919,27672,14553,'min','5m'),(14922,27678,14556,'diff',''),(14923,27678,14556,'strlen',''),(14924,27677,14557,'diff',''),(14925,27677,14557,'strlen',''),(14972,27734,14582,'max','#3'),(14973,27735,14583,'min','5m'),(14974,27736,14584,'avg','5m'),(14975,27743,14585,'last',''),(14977,27753,14587,'avg','5m'),(14978,27752,14588,'avg','5m'),(14979,27751,14589,'avg','5m'),(14980,27751,14589,'max','5m'),(14981,27751,14590,'avg','5m'),(14982,27751,14590,'max','5m'),(14983,27751,14591,'avg','5m'),(14984,27751,14591,'min','5m'),(14985,27750,14592,'diff',''),(14986,27750,14592,'strlen',''),(15000,27766,14598,'max','#3'),(15001,27767,14599,'min','5m'),(15002,27768,14600,'avg','5m'),(15003,27775,14601,'last',''),(15005,27777,14603,'diff',''),(15006,27777,14603,'strlen',''),(15013,27784,14606,'avg','5m'),(15014,27784,14606,'min','5m'),(15015,27785,14607,'diff',''),(15016,27785,14607,'strlen',''),(15032,27800,14615,'max','#3'),(15033,27801,14616,'min','5m'),(15034,27802,14617,'avg','5m'),(15035,27809,14618,'last',''),(15037,27814,14620,'last','0'),(15038,27813,14621,'diff',''),(15039,27813,14621,'strlen',''),(15040,27820,14622,'avg','5m'),(15041,27819,14623,'avg','5m'),(15042,27821,14624,'avg','5m'),(15043,27821,14624,'max','5m'),(15044,27821,14625,'avg','5m'),(15045,27821,14625,'max','5m'),(15046,27821,14626,'avg','5m'),(15047,27821,14626,'min','5m'),(15094,27882,14652,'max','#3'),(15095,27883,14653,'min','5m'),(15096,27884,14654,'avg','5m'),(15097,27891,14655,'last',''),(15099,27899,14657,'avg','5m'),(15100,27897,14658,'avg','5m'),(15101,27897,14658,'max','5m'),(15102,27897,14659,'avg','5m'),(15103,27897,14659,'max','5m'),(15104,27897,14660,'avg','5m'),(15105,27897,14660,'min','5m'),(15106,27894,14661,'diff',''),(15107,27894,14661,'strlen',''),(15108,27895,14662,'diff',''),(15109,27895,14662,'strlen',''),(15110,27904,14663,'avg','5m'),(15111,27905,14664,'avg','5m'),(15112,27905,14664,'max','5m'),(15113,27905,14665,'avg','5m'),(15114,27905,14665,'max','5m'),(15115,27905,14666,'avg','5m'),(15116,27905,14666,'min','5m'),(15117,27906,14667,'avg','5m'),(15118,27906,14668,'avg','5m'),(15131,27919,14673,'max','#3'),(15132,27920,14674,'min','5m'),(15133,27921,14675,'avg','5m'),(15134,27928,14676,'last',''),(15136,27936,14678,'avg','5m'),(15137,27933,14679,'avg','5m'),(15138,27931,14680,'diff',''),(15139,27931,14680,'strlen',''),(15146,27941,14683,'avg','5m'),(15147,27941,14683,'min','5m'),(15163,27956,14691,'max','#3'),(15164,27957,14692,'min','5m'),(15165,27958,14693,'avg','5m'),(15166,27965,14694,'last',''),(15168,27975,14696,'avg','5m'),(15169,27974,14697,'avg','5m'),(15170,27970,14698,'diff',''),(15171,27970,14698,'strlen',''),(15172,27967,14699,'diff',''),(15173,27967,14699,'strlen',''),(15186,27986,14704,'max','#3'),(15187,27987,14705,'min','5m'),(15188,27988,14706,'avg','5m'),(15189,27995,14707,'last',''),(15191,27999,14709,'diff',''),(15192,27999,14709,'strlen',''),(15193,27998,14710,'diff',''),(15194,27998,14710,'strlen',''),(15195,28003,14711,'avg','5m'),(15196,28004,14712,'avg','5m'),(15209,28015,14717,'max','#3'),(15210,28016,14718,'min','5m'),(15211,28017,14719,'avg','5m'),(15212,28024,14720,'last',''),(15214,28031,14722,'avg','5m'),(15215,28028,14723,'avg','5m'),(15216,28027,14724,'diff',''),(15217,28027,14724,'strlen',''),(15580,28045,14860,'avg','5m'),(15581,28046,14861,'avg','5m'),(15582,28046,14862,'avg','5m'),(15597,28070,14869,'max','#3'),(15598,28071,14870,'min','5m'),(15599,28072,14871,'avg','5m'),(15600,28079,14872,'last',''),(15602,28084,14874,'avg','5m'),(15603,28085,14875,'avg','5m'),(15604,28085,14876,'avg','5m'),(15618,28107,14882,'max','#3'),(15619,28108,14883,'min','5m'),(15620,28109,14884,'avg','5m'),(15621,28116,14885,'last',''),(15678,28130,14906,'max','#3'),(15679,28131,14907,'min','5m'),(15680,28132,14908,'avg','5m'),(15681,28139,14909,'last',''),(15683,28143,14911,'avg','5m'),(15684,28142,14912,'diff',''),(15685,28142,14912,'strlen',''),(15686,28141,14913,'diff',''),(15687,28141,14913,'strlen',''),(15688,28150,14914,'avg','5m'),(15689,28150,14914,'max','5m'),(15690,28150,14915,'avg','5m'),(15691,28150,14915,'max','5m'),(15692,28150,14916,'avg','5m'),(15693,28150,14916,'min','5m'),(15694,28151,14917,'avg','5m'),(15697,28162,14920,'avg','5m'),(15698,28163,14921,'avg','5m'),(15699,28163,14922,'avg','5m'),(15713,28185,14928,'max','#3'),(15714,28186,14929,'min','5m'),(15715,28187,14930,'avg','5m'),(15716,28194,14931,'last',''),(15721,28201,14934,'avg','5m'),(15722,28201,14934,'max','5m'),(15723,28201,14935,'avg','5m'),(15724,28201,14935,'min','5m'),(15726,28204,14937,'diff',''),(15727,28204,14937,'strlen',''),(15729,27030,14939,'last',''),(15730,27607,14940,'last',''),(15731,27032,14941,'last',''),(15732,27191,14942,'last',''),(15733,27332,14943,'last',''),(15734,27461,14944,'last',''),(15735,27531,14945,'last',''),(15736,27567,14946,'last',''),(15737,27630,14947,'last',''),(15738,27653,14948,'last',''),(15739,27733,14949,'last',''),(15740,27799,14950,'last',''),(15741,27955,14951,'last',''),(15742,28069,14952,'last',''),(15743,28129,14953,'last',''),(15744,27038,14954,'avg','5m'),(15745,27054,14955,'avg','5m'),(15746,28052,14956,'avg','5m'),(15747,28091,14957,'avg','5m'),(15748,28169,14958,'avg','5m'),(16352,27143,15161,'max','{$SNMP_TIMEOUT}'),(16353,27618,15162,'max','{$SNMP_TIMEOUT}'),(16354,28025,15163,'max','{$SNMP_TIMEOUT}'),(16375,27154,15170,'max','{$SNMP_TIMEOUT}'),(16376,27202,15171,'max','{$SNMP_TIMEOUT}'),(16377,27235,15172,'max','{$SNMP_TIMEOUT}'),(16378,27271,15173,'max','{$SNMP_TIMEOUT}'),(16379,27292,15174,'max','{$SNMP_TIMEOUT}'),(16380,27343,15175,'max','{$SNMP_TIMEOUT}'),(16381,27375,15176,'max','{$SNMP_TIMEOUT}'),(16382,27472,15177,'max','{$SNMP_TIMEOUT}'),(16383,27506,15178,'max','{$SNMP_TIMEOUT}'),(16384,27542,15179,'max','{$SNMP_TIMEOUT}'),(16385,27578,15180,'max','{$SNMP_TIMEOUT}'),(16386,27641,15181,'max','{$SNMP_TIMEOUT}'),(16387,27664,15182,'max','{$SNMP_TIMEOUT}'),(16388,27744,15183,'max','{$SNMP_TIMEOUT}'),(16389,27776,15184,'max','{$SNMP_TIMEOUT}'),(16390,27810,15185,'max','{$SNMP_TIMEOUT}'),(16391,27892,15186,'max','{$SNMP_TIMEOUT}'),(16392,27929,15187,'max','{$SNMP_TIMEOUT}'),(16393,27966,15188,'max','{$SNMP_TIMEOUT}'),(16394,27996,15189,'max','{$SNMP_TIMEOUT}'),(16395,28080,15190,'max','{$SNMP_TIMEOUT}'),(16396,28117,15191,'max','{$SNMP_TIMEOUT}'),(16397,28140,15192,'max','{$SNMP_TIMEOUT}'),(16398,28195,15193,'max','{$SNMP_TIMEOUT}'),(16445,28210,15208,'diff',''),(16446,28210,15208,'strlen',''),(16447,28208,15209,'diff',''),(16448,28208,15209,'strlen',''),(16457,28218,15214,'avg','5m'),(16458,28218,15214,'min','5m'),(16459,28221,15215,'avg','5m'),(16472,28233,15220,'max','#3'),(16473,28234,15221,'min','5m'),(16474,28235,15222,'avg','5m'),(16475,28242,15223,'last',''),(16476,28243,15224,'max','{$SNMP_TIMEOUT}'),(16477,28246,15225,'avg','5m'),(16484,28247,15228,'avg','5m'),(16818,27213,15330,'count','#1,{$FAN_CRIT_STATUS},eq'),(16819,27479,15331,'count','#1,{$PSU_CRIT_STATUS},eq'),(16820,27479,15332,'count','#1,{$PSU_OK_STATUS},ne'),(16821,27480,15333,'count','#1,{$FAN_CRIT_STATUS},eq'),(16822,27480,15334,'count','#1,{$FAN_OK_STATUS},ne'),(16823,27784,15335,'avg','5m'),(16824,27783,15335,'last','0'),(16825,27784,15335,'max','5m'),(16826,27784,15336,'avg','5m'),(16827,27783,15336,'last','0'),(16828,27784,15336,'max','5m'),(16829,27786,15337,'count','#1,{$PSU_CRIT_STATUS},eq'),(16830,27786,15338,'count','#1,{$PSU_WARN_STATUS},eq'),(16831,27787,15339,'count','#1,{$FAN_CRIT_STATUS},eq'),(16832,27554,15340,'count','#1,{$PSU_CRIT_STATUS},eq'),(16833,27555,15341,'count','#1,{$FAN_CRIT_STATUS},eq'),(16834,27421,15342,'avg','5m'),(16835,27420,15342,'last','0'),(16836,27421,15342,'max','5m'),(16837,27421,15343,'avg','5m'),(16838,27420,15343,'last','0'),(16839,27421,15343,'max','5m'),(16840,27422,15344,'count','#1,{$PSU_CRIT_STATUS:\"critical\"},eq'),(16841,27422,15344,'count','#1,{$PSU_CRIT_STATUS:\"shutdown\"},eq'),(16842,27422,15345,'count','#1,{$PSU_WARN_STATUS:\"warning\"},eq'),(16843,27422,15345,'count','#1,{$PSU_WARN_STATUS:\"notFunctioning\"},eq'),(16844,27423,15346,'count','#1,{$FAN_CRIT_STATUS:\"critical\"},eq'),(16845,27423,15346,'count','#1,{$FAN_CRIT_STATUS:\"shutdown\"},eq'),(16846,27423,15347,'count','#1,{$FAN_WARN_STATUS:\"warning\"},eq'),(16847,27423,15347,'count','#1,{$FAN_WARN_STATUS:\"notFunctioning\"},eq'),(16848,27430,15348,'avg','5m'),(16849,27429,15348,'last','0'),(16850,27430,15348,'max','5m'),(16851,27447,15349,'avg','5m'),(16852,27446,15349,'last','0'),(16853,27447,15349,'max','5m'),(16854,28218,15350,'avg','5m'),(16855,28217,15350,'last','0'),(16856,28218,15350,'max','5m'),(16857,27430,15351,'avg','5m'),(16858,27429,15351,'last','0'),(16859,27430,15351,'max','5m'),(16860,27447,15352,'avg','5m'),(16861,27446,15352,'last','0'),(16862,27447,15352,'max','5m'),(16863,28218,15353,'avg','5m'),(16864,28217,15353,'last','0'),(16865,28218,15353,'max','5m'),(16866,27431,15354,'count','#1,{$PSU_CRIT_STATUS:\"critical\"},eq'),(16867,27431,15354,'count','#1,{$PSU_CRIT_STATUS:\"shutdown\"},eq'),(16868,27448,15355,'count','#1,{$PSU_CRIT_STATUS:\"critical\"},eq'),(16869,27448,15355,'count','#1,{$PSU_CRIT_STATUS:\"shutdown\"},eq'),(16870,28216,15356,'count','#1,{$PSU_CRIT_STATUS:\"critical\"},eq'),(16871,28216,15356,'count','#1,{$PSU_CRIT_STATUS:\"shutdown\"},eq'),(16872,27431,15357,'count','#1,{$PSU_WARN_STATUS:\"warning\"},eq'),(16873,27431,15357,'count','#1,{$PSU_WARN_STATUS:\"notFunctioning\"},eq'),(16874,27448,15358,'count','#1,{$PSU_WARN_STATUS:\"warning\"},eq'),(16875,27448,15358,'count','#1,{$PSU_WARN_STATUS:\"notFunctioning\"},eq'),(16876,28216,15359,'count','#1,{$PSU_WARN_STATUS:\"warning\"},eq'),(16877,28216,15359,'count','#1,{$PSU_WARN_STATUS:\"notFunctioning\"},eq'),(16878,27432,15360,'count','#1,{$FAN_CRIT_STATUS:\"critical\"},eq'),(16879,27432,15360,'count','#1,{$FAN_CRIT_STATUS:\"shutdown\"},eq'),(16880,27449,15361,'count','#1,{$FAN_CRIT_STATUS:\"critical\"},eq'),(16881,27449,15361,'count','#1,{$FAN_CRIT_STATUS:\"shutdown\"},eq'),(16882,28215,15362,'count','#1,{$FAN_CRIT_STATUS:\"critical\"},eq'),(16883,28215,15362,'count','#1,{$FAN_CRIT_STATUS:\"shutdown\"},eq'),(16884,27432,15363,'count','#1,{$FAN_WARN_STATUS:\"warning\"},eq'),(16885,27432,15363,'count','#1,{$FAN_WARN_STATUS:\"notFunctioning\"},eq'),(16886,27449,15364,'count','#1,{$FAN_WARN_STATUS:\"warning\"},eq'),(16887,27449,15364,'count','#1,{$FAN_WARN_STATUS:\"notFunctioning\"},eq'),(16888,28215,15365,'count','#1,{$FAN_WARN_STATUS:\"warning\"},eq'),(16889,28215,15365,'count','#1,{$FAN_WARN_STATUS:\"notFunctioning\"},eq'),(16890,27518,15366,'count','#1,{$PSU_CRIT_STATUS},eq'),(16891,27519,15367,'count','#1,{$FAN_CRIT_STATUS},eq'),(16892,27584,15368,'avg','5m'),(16893,27585,15368,'last','0'),(16894,27584,15368,'max','5m'),(16895,27593,15369,'count','#1,{$PSU_CRIT_STATUS},eq'),(16896,27595,15370,'count','#1,{$FAN_CRIT_STATUS},eq'),(16897,27673,15371,'count','#1,{$FAN_CRIT_STATUS:\"fanError\"},eq'),(16898,27673,15371,'count','#1,{$FAN_CRIT_STATUS:\"hardwareFaulty\"},eq'),(16899,27674,15372,'count','#1,{$PSU_CRIT_STATUS:\"psuError\"},eq'),(16900,27674,15372,'count','#1,{$PSU_CRIT_STATUS:\"rpsError\"},eq'),(16901,27674,15372,'count','#1,{$PSU_CRIT_STATUS:\"hardwareFaulty\"},eq'),(16902,28154,15373,'count','#1,{$FAN_CRIT_STATUS:\"bad\"},eq'),(16903,28154,15374,'count','#1,{$FAN_WARN_STATUS:\"warning\"},eq'),(16904,28155,15375,'count','#1,{$PSU_CRIT_STATUS:\"bad\"},eq'),(16905,28155,15376,'count','#1,{$PSU_WARN_STATUS:\"warning\"},eq'),(16906,27822,15377,'count','#1,{$FAN_CRIT_STATUS},eq'),(16907,27823,15378,'count','#1,{$PSU_CRIT_STATUS},eq'),(16908,27312,15379,'count','#1,{$PSU_CRIT_STATUS},eq'),(16909,27312,15380,'count','#1,{$PSU_OK_STATUS},ne'),(16910,27313,15381,'count','#1,{$FAN_CRIT_STATUS},eq'),(16911,27313,15382,'count','#1,{$FAN_OK_STATUS},ne'),(16912,27316,15383,'count','#1,{$PSU_CRIT_STATUS},eq'),(16913,27316,15384,'count','#1,{$PSU_OK_STATUS},ne'),(16914,27317,15385,'count','#1,{$FAN_CRIT_STATUS},eq'),(16915,27317,15386,'count','#1,{$FAN_OK_STATUS},ne'),(16916,28201,15387,'avg','5m'),(16917,28200,15387,'last','0'),(16918,28201,15387,'max','5m'),(16919,28202,15388,'count','#1,{$FAN_CRIT_STATUS},eq'),(16920,28206,15389,'count','#1,{$PSU_CRIT_STATUS},eq'),(16921,27247,15390,'avg','5m'),(16922,27246,15390,'last','0'),(16923,27247,15390,'max','5m'),(16924,27248,15391,'count','#1,{$PSU_CRIT_STATUS},eq'),(16925,27248,15392,'count','#1,{$PSU_OK_STATUS},ne'),(16926,27250,15393,'count','#1,{$FAN_CRIT_STATUS},eq'),(16927,27250,15394,'count','#1,{$FAN_OK_STATUS},ne'),(16928,27755,15395,'count','#1,{$FAN_CRIT_STATUS},eq'),(16929,27941,15396,'avg','5m'),(16930,27940,15396,'last','0'),(16931,27941,15396,'max','5m'),(16932,27941,15397,'avg','5m'),(16933,27940,15397,'last','0'),(16934,27941,15397,'max','5m'),(16935,27942,15398,'count','#1,{$FAN_CRIT_STATUS:\"failed\"},eq'),(16936,27943,15399,'count','#1,{$PSU_CRIT_STATUS:\"failed\"},eq'),(16937,27077,15400,'last',''),(16938,27077,15400,'diff',''),(16949,27604,15404,'last',''),(16950,27604,15404,'diff',''),(16951,28013,15405,'last',''),(16952,28013,15405,'diff',''),(16973,27087,15412,'last',''),(16974,27087,15412,'diff',''),(16985,27627,15416,'last',''),(16986,27627,15416,'diff',''),(16987,27984,15417,'last',''),(16988,27984,15417,'diff',''),(17009,27097,15424,'last',''),(17010,27097,15424,'diff',''),(17021,27107,15428,'last',''),(17022,27107,15428,'diff',''),(17033,27188,15432,'last',''),(17034,27188,15432,'diff',''),(17035,27223,15433,'last',''),(17036,27223,15433,'diff',''),(17037,27259,15434,'last',''),(17038,27259,15434,'diff',''),(17039,27280,15435,'last',''),(17040,27280,15435,'diff',''),(17041,27329,15436,'last',''),(17042,27329,15436,'diff',''),(17043,27458,15437,'last',''),(17044,27458,15437,'diff',''),(17045,27494,15438,'last',''),(17046,27494,15438,'diff',''),(17047,27528,15439,'last',''),(17048,27528,15439,'diff',''),(17049,27564,15440,'last',''),(17050,27564,15440,'diff',''),(17051,27650,15441,'last',''),(17052,27650,15441,'diff',''),(17053,27730,15442,'last',''),(17054,27730,15442,'diff',''),(17055,27764,15443,'last',''),(17056,27764,15443,'diff',''),(17057,27796,15444,'last',''),(17058,27796,15444,'diff',''),(17059,27880,15445,'last',''),(17060,27880,15445,'diff',''),(17061,27917,15446,'last',''),(17062,27917,15446,'diff',''),(17063,27952,15447,'last',''),(17064,27952,15447,'diff',''),(17065,28066,15448,'last',''),(17066,28066,15448,'diff',''),(17067,28126,15449,'last',''),(17068,28126,15449,'diff',''),(17069,28183,15450,'last',''),(17070,28183,15450,'diff',''),(17071,28231,15451,'last',''),(17072,28231,15451,'diff',''),(17273,27127,15512,'last',''),(17274,27127,15512,'diff',''),(17285,28105,15516,'last',''),(17286,28105,15516,'diff',''),(17417,27074,15550,'avg','15m'),(17418,27071,15550,'last',''),(17419,27075,15550,'avg','15m'),(17420,27076,15551,'avg','5m'),(17421,27073,15551,'avg','5m'),(17422,27071,15552,'change',''),(17423,27071,15552,'last',''),(17424,27070,15552,'last',''),(17425,27077,15552,'last',''),(17426,27071,15552,'prev',''),(17427,27599,15553,'avg','15m'),(17428,27603,15553,'last',''),(17429,27602,15553,'avg','15m'),(17430,28008,15554,'avg','15m'),(17431,28012,15554,'last',''),(17432,28011,15554,'avg','15m'),(17433,27598,15555,'avg','5m'),(17434,27601,15555,'avg','5m'),(17435,28007,15556,'avg','5m'),(17436,28010,15556,'avg','5m'),(17437,27603,15557,'change',''),(17438,27603,15557,'last',''),(17439,27605,15557,'last',''),(17440,27604,15557,'last',''),(17441,27603,15557,'prev',''),(17442,28012,15558,'change',''),(17443,28012,15558,'last',''),(17444,28014,15558,'last',''),(17445,28013,15558,'last',''),(17446,28012,15558,'prev',''),(17447,27084,15559,'avg','15m'),(17448,27081,15559,'last',''),(17449,27085,15559,'avg','15m'),(17450,27086,15560,'avg','5m'),(17451,27083,15560,'avg','5m'),(17452,27081,15561,'change',''),(17453,27081,15561,'last',''),(17454,27080,15561,'last',''),(17455,27087,15561,'last',''),(17456,27081,15561,'prev',''),(17457,27622,15562,'avg','15m'),(17458,27626,15562,'last',''),(17459,27625,15562,'avg','15m'),(17460,27979,15563,'avg','15m'),(17461,27983,15563,'last',''),(17462,27982,15563,'avg','15m'),(17463,27621,15564,'avg','5m'),(17464,27624,15564,'avg','5m'),(17465,27978,15565,'avg','5m'),(17466,27981,15565,'avg','5m'),(17467,27626,15566,'change',''),(17468,27626,15566,'last',''),(17469,27628,15566,'last',''),(17470,27627,15566,'last',''),(17471,27626,15566,'prev',''),(17472,27983,15567,'change',''),(17473,27983,15567,'last',''),(17474,27985,15567,'last',''),(17475,27984,15567,'last',''),(17476,27983,15567,'prev',''),(17477,27124,15568,'avg','15m'),(17478,27121,15568,'last',''),(17479,27125,15568,'avg','15m'),(17480,27126,15569,'avg','5m'),(17481,27123,15569,'avg','5m'),(17482,27121,15570,'change',''),(17483,27121,15570,'last',''),(17484,27120,15570,'last',''),(17485,27127,15570,'last',''),(17486,27121,15570,'prev',''),(17487,28100,15571,'avg','15m'),(17488,28104,15571,'last',''),(17489,28103,15571,'avg','15m'),(17490,28099,15572,'avg','5m'),(17491,28102,15572,'avg','5m'),(17492,28104,15573,'change',''),(17493,28104,15573,'last',''),(17494,28106,15573,'last',''),(17495,28105,15573,'last',''),(17496,28104,15573,'prev',''),(17497,27094,15574,'avg','15m'),(17498,27091,15574,'last',''),(17499,27095,15574,'avg','15m'),(17500,27096,15575,'avg','5m'),(17501,27093,15575,'avg','5m'),(17502,27091,15576,'change',''),(17503,27091,15576,'last',''),(17504,27090,15576,'last',''),(17505,27097,15576,'last',''),(17506,27091,15576,'prev',''),(17507,27104,15577,'avg','15m'),(17508,27101,15577,'last',''),(17509,27105,15577,'avg','15m'),(17510,27106,15578,'avg','5m'),(17511,27103,15578,'avg','5m'),(17512,27101,15579,'change',''),(17513,27101,15579,'last',''),(17514,27100,15579,'last',''),(17515,27107,15579,'last',''),(17516,27101,15579,'prev',''),(17517,27183,15580,'avg','15m'),(17518,27187,15580,'last',''),(17519,27186,15580,'avg','15m'),(17520,27218,15581,'avg','15m'),(17521,27222,15581,'last',''),(17522,27221,15581,'avg','15m'),(17523,27254,15582,'avg','15m'),(17524,27258,15582,'last',''),(17525,27257,15582,'avg','15m'),(17526,27275,15583,'avg','15m'),(17527,27279,15583,'last',''),(17528,27278,15583,'avg','15m'),(17529,27324,15584,'avg','15m'),(17530,27328,15584,'last',''),(17531,27327,15584,'avg','15m'),(17532,27453,15585,'avg','15m'),(17533,27457,15585,'last',''),(17534,27456,15585,'avg','15m'),(17535,27489,15586,'avg','15m'),(17536,27493,15586,'last',''),(17537,27492,15586,'avg','15m'),(17538,27523,15587,'avg','15m'),(17539,27527,15587,'last',''),(17540,27526,15587,'avg','15m'),(17541,27559,15588,'avg','15m'),(17542,27563,15588,'last',''),(17543,27562,15588,'avg','15m'),(17544,27645,15589,'avg','15m'),(17545,27649,15589,'last',''),(17546,27648,15589,'avg','15m'),(17547,27725,15590,'avg','15m'),(17548,27729,15590,'last',''),(17549,27728,15590,'avg','15m'),(17550,27759,15591,'avg','15m'),(17551,27763,15591,'last',''),(17552,27762,15591,'avg','15m'),(17553,27791,15592,'avg','15m'),(17554,27795,15592,'last',''),(17555,27794,15592,'avg','15m'),(17556,27875,15593,'avg','15m'),(17557,27879,15593,'last',''),(17558,27878,15593,'avg','15m'),(17559,27912,15594,'avg','15m'),(17560,27916,15594,'last',''),(17561,27915,15594,'avg','15m'),(17562,27947,15595,'avg','15m'),(17563,27951,15595,'last',''),(17564,27950,15595,'avg','15m'),(17565,28061,15596,'avg','15m'),(17566,28065,15596,'last',''),(17567,28064,15596,'avg','15m'),(17568,28121,15597,'avg','15m'),(17569,28125,15597,'last',''),(17570,28124,15597,'avg','15m'),(17571,28178,15598,'avg','15m'),(17572,28182,15598,'last',''),(17573,28181,15598,'avg','15m'),(17574,28226,15599,'avg','15m'),(17575,28230,15599,'last',''),(17576,28229,15599,'avg','15m'),(17577,27182,15600,'avg','5m'),(17578,27185,15600,'avg','5m'),(17579,27217,15601,'avg','5m'),(17580,27220,15601,'avg','5m'),(17581,27253,15602,'avg','5m'),(17582,27256,15602,'avg','5m'),(17583,27274,15603,'avg','5m'),(17584,27277,15603,'avg','5m'),(17585,27323,15604,'avg','5m'),(17586,27326,15604,'avg','5m'),(17587,27452,15605,'avg','5m'),(17588,27455,15605,'avg','5m'),(17589,27488,15606,'avg','5m'),(17590,27491,15606,'avg','5m'),(17591,27522,15607,'avg','5m'),(17592,27525,15607,'avg','5m'),(17593,27558,15608,'avg','5m'),(17594,27561,15608,'avg','5m'),(17595,27644,15609,'avg','5m'),(17596,27647,15609,'avg','5m'),(17597,27724,15610,'avg','5m'),(17598,27727,15610,'avg','5m'),(17599,27758,15611,'avg','5m'),(17600,27761,15611,'avg','5m'),(17601,27790,15612,'avg','5m'),(17602,27793,15612,'avg','5m'),(17603,27874,15613,'avg','5m'),(17604,27877,15613,'avg','5m'),(17605,27911,15614,'avg','5m'),(17606,27914,15614,'avg','5m'),(17607,27946,15615,'avg','5m'),(17608,27949,15615,'avg','5m'),(17609,28060,15616,'avg','5m'),(17610,28063,15616,'avg','5m'),(17611,28120,15617,'avg','5m'),(17612,28123,15617,'avg','5m'),(17613,28177,15618,'avg','5m'),(17614,28180,15618,'avg','5m'),(17615,28225,15619,'avg','5m'),(17616,28228,15619,'avg','5m'),(17617,27187,15620,'change',''),(17618,27187,15620,'last',''),(17619,27189,15620,'last',''),(17620,27188,15620,'last',''),(17621,27187,15620,'prev',''),(17622,27222,15621,'change',''),(17623,27222,15621,'last',''),(17624,27224,15621,'last',''),(17625,27223,15621,'last',''),(17626,27222,15621,'prev',''),(17627,27258,15622,'change',''),(17628,27258,15622,'last',''),(17629,27260,15622,'last',''),(17630,27259,15622,'last',''),(17631,27258,15622,'prev',''),(17632,27279,15623,'change',''),(17633,27279,15623,'last',''),(17634,27281,15623,'last',''),(17635,27280,15623,'last',''),(17636,27279,15623,'prev',''),(17637,27328,15624,'change',''),(17638,27328,15624,'last',''),(17639,27330,15624,'last',''),(17640,27329,15624,'last',''),(17641,27328,15624,'prev',''),(17642,27457,15625,'change',''),(17643,27457,15625,'last',''),(17644,27459,15625,'last',''),(17645,27458,15625,'last',''),(17646,27457,15625,'prev',''),(17647,27493,15626,'change',''),(17648,27493,15626,'last',''),(17649,27495,15626,'last',''),(17650,27494,15626,'last',''),(17651,27493,15626,'prev',''),(17652,27527,15627,'change',''),(17653,27527,15627,'last',''),(17654,27529,15627,'last',''),(17655,27528,15627,'last',''),(17656,27527,15627,'prev',''),(17657,27563,15628,'change',''),(17658,27563,15628,'last',''),(17659,27565,15628,'last',''),(17660,27564,15628,'last',''),(17661,27563,15628,'prev',''),(17662,27649,15629,'change',''),(17663,27649,15629,'last',''),(17664,27651,15629,'last',''),(17665,27650,15629,'last',''),(17666,27649,15629,'prev',''),(17667,27729,15630,'change',''),(17668,27729,15630,'last',''),(17669,27731,15630,'last',''),(17670,27730,15630,'last',''),(17671,27729,15630,'prev',''),(17672,27763,15631,'change',''),(17673,27763,15631,'last',''),(17674,27765,15631,'last',''),(17675,27764,15631,'last',''),(17676,27763,15631,'prev',''),(17677,27795,15632,'change',''),(17678,27795,15632,'last',''),(17679,27797,15632,'last',''),(17680,27796,15632,'last',''),(17681,27795,15632,'prev',''),(17682,27879,15633,'change',''),(17683,27879,15633,'last',''),(17684,27881,15633,'last',''),(17685,27880,15633,'last',''),(17686,27879,15633,'prev',''),(17687,27916,15634,'change',''),(17688,27916,15634,'last',''),(17689,27918,15634,'last',''),(17690,27917,15634,'last',''),(17691,27916,15634,'prev',''),(17692,27951,15635,'change',''),(17693,27951,15635,'last',''),(17694,27953,15635,'last',''),(17695,27952,15635,'last',''),(17696,27951,15635,'prev',''),(17697,28065,15636,'change',''),(17698,28065,15636,'last',''),(17699,28067,15636,'last',''),(17700,28066,15636,'last',''),(17701,28065,15636,'prev',''),(17702,28125,15637,'change',''),(17703,28125,15637,'last',''),(17704,28127,15637,'last',''),(17705,28126,15637,'last',''),(17706,28125,15637,'prev',''),(17707,28182,15638,'change',''),(17708,28182,15638,'last',''),(17709,28184,15638,'last',''),(17710,28183,15638,'last',''),(17711,28182,15638,'prev',''),(17712,28230,15639,'change',''),(17713,28230,15639,'last',''),(17714,28232,15639,'last',''),(17715,28231,15639,'last',''),(17716,28230,15639,'prev',''),(17885,28605,15808,'last','0'),(17886,28606,15809,'last','0'),(17887,28607,15810,'last','0'),(17888,28608,15811,'last','0'),(17889,28613,15812,'last','0'),(17890,28614,15813,'last','0'),(17891,28615,15814,'last','0'),(17892,28616,15815,'last','0'),(17893,28633,15816,'last',''),(17894,28641,15817,'last',''),(17895,28671,15818,'last',''),(17896,28672,15819,'last',''),(17897,28673,15820,'last',''),(17898,28674,15821,'last',''),(17899,28675,15822,'last',''),(17900,28676,15823,'last',''),(17901,28677,15824,'last',''),(17910,28710,15830,'last','0'),(17911,28641,15831,'last',''),(17912,28671,15832,'last',''),(17913,28672,15833,'last',''),(17914,28673,15834,'last',''),(17915,28674,15835,'last',''),(17916,28675,15836,'last',''),(17917,28676,15837,'last',''),(17918,28677,15838,'last',''),(17967,28788,15865,'last',''),(17968,28788,15866,'last',''),(17969,28792,15867,'last',''),(17970,28792,15868,'last',''),(17971,28805,15869,'last',''),(17972,28805,15870,'last',''),(17973,28807,15871,'last',''),(17974,28807,15872,'last',''),(17975,28834,15873,'last',''),(17976,28834,15874,'last',''),(17977,28835,15875,'last',''),(17978,28835,15876,'last',''),(17979,28836,15877,'last',''),(17980,28836,15878,'last',''),(17981,28837,15879,'last',''),(17982,28837,15880,'last',''),(17983,28838,15881,'last',''),(17984,28838,15882,'last',''),(17985,28839,15883,'last',''),(17986,28839,15884,'last',''),(18063,29097,15961,'last',''),(18065,29100,15963,'last',''),(18066,29101,15964,'last',''),(18067,29102,15965,'last',''),(18068,29098,15966,'last',''),(18069,29099,15967,'last',''),(18070,29095,15968,'last',''),(18071,29094,15969,'last',''),(18072,29103,15970,'last',''),(18073,29104,15971,'last',''),(18074,29105,15972,'last',''),(18075,29106,15973,'last',''),(18076,29107,15974,'last',''),(18077,29108,15975,'last',''),(18078,29109,15976,'last',''),(18079,29110,15977,'last',''),(18080,29111,15978,'last',''),(18081,29113,15979,'last',''),(18082,29130,15980,'last',''),(18083,29545,15981,'last',''),(18084,29547,15982,'last',''),(18085,29548,15983,'last',''),(18086,29549,15984,'last',''),(18087,29550,15985,'last',''),(18088,29551,15986,'last',''),(18089,29551,15987,'last','');
/*!40000 ALTER TABLE `functions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `globalmacro`
--

DROP TABLE IF EXISTS `globalmacro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `globalmacro` (
  `globalmacroid` bigint(20) unsigned NOT NULL,
  `macro` varchar(255) NOT NULL DEFAULT '',
  `value` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`globalmacroid`),
  UNIQUE KEY `globalmacro_1` (`macro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `globalmacro`
--

LOCK TABLES `globalmacro` WRITE;
/*!40000 ALTER TABLE `globalmacro` DISABLE KEYS */;
INSERT INTO `globalmacro` VALUES (2,'{$SNMP_COMMUNITY}','public');
/*!40000 ALTER TABLE `globalmacro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `globalvars`
--

DROP TABLE IF EXISTS `globalvars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `globalvars` (
  `globalvarid` bigint(20) unsigned NOT NULL,
  `snmp_lastsize` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`globalvarid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `globalvars`
--

LOCK TABLES `globalvars` WRITE;
/*!40000 ALTER TABLE `globalvars` DISABLE KEYS */;
/*!40000 ALTER TABLE `globalvars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `graph_discovery`
--

DROP TABLE IF EXISTS `graph_discovery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `graph_discovery` (
  `graphid` bigint(20) unsigned NOT NULL,
  `parent_graphid` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`graphid`),
  KEY `graph_discovery_1` (`parent_graphid`),
  CONSTRAINT `c_graph_discovery_1` FOREIGN KEY (`graphid`) REFERENCES `graphs` (`graphid`) ON DELETE CASCADE,
  CONSTRAINT `c_graph_discovery_2` FOREIGN KEY (`parent_graphid`) REFERENCES `graphs` (`graphid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `graph_discovery`
--

LOCK TABLES `graph_discovery` WRITE;
/*!40000 ALTER TABLE `graph_discovery` DISABLE KEYS */;
INSERT INTO `graph_discovery` VALUES (865,521),(866,521),(867,521),(868,521),(869,521),(870,521),(871,521),(872,521),(873,522),(874,522),(875,522),(876,522);
/*!40000 ALTER TABLE `graph_discovery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `graph_theme`
--

DROP TABLE IF EXISTS `graph_theme`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `graph_theme` (
  `graphthemeid` bigint(20) unsigned NOT NULL,
  `theme` varchar(64) NOT NULL DEFAULT '',
  `backgroundcolor` varchar(6) NOT NULL DEFAULT '',
  `graphcolor` varchar(6) NOT NULL DEFAULT '',
  `gridcolor` varchar(6) NOT NULL DEFAULT '',
  `maingridcolor` varchar(6) NOT NULL DEFAULT '',
  `gridbordercolor` varchar(6) NOT NULL DEFAULT '',
  `textcolor` varchar(6) NOT NULL DEFAULT '',
  `highlightcolor` varchar(6) NOT NULL DEFAULT '',
  `leftpercentilecolor` varchar(6) NOT NULL DEFAULT '',
  `rightpercentilecolor` varchar(6) NOT NULL DEFAULT '',
  `nonworktimecolor` varchar(6) NOT NULL DEFAULT '',
  PRIMARY KEY (`graphthemeid`),
  UNIQUE KEY `graph_theme_1` (`theme`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `graph_theme`
--

LOCK TABLES `graph_theme` WRITE;
/*!40000 ALTER TABLE `graph_theme` DISABLE KEYS */;
INSERT INTO `graph_theme` VALUES (1,'blue-theme','FFFFFF','FFFFFF','CCD5D9','ACBBC2','ACBBC2','1F2C33','E33734','429E47','E33734','EBEBEB'),(2,'dark-theme','2B2B2B','2B2B2B','454545','4F4F4F','4F4F4F','F2F2F2','E45959','59DB8F','E45959','333333');
/*!40000 ALTER TABLE `graph_theme` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `graphs`
--

DROP TABLE IF EXISTS `graphs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `graphs` (
  `graphid` bigint(20) unsigned NOT NULL,
  `name` varchar(128) NOT NULL DEFAULT '',
  `width` int(11) NOT NULL DEFAULT '900',
  `height` int(11) NOT NULL DEFAULT '200',
  `yaxismin` double(16,4) NOT NULL DEFAULT '0.0000',
  `yaxismax` double(16,4) NOT NULL DEFAULT '100.0000',
  `templateid` bigint(20) unsigned DEFAULT NULL,
  `show_work_period` int(11) NOT NULL DEFAULT '1',
  `show_triggers` int(11) NOT NULL DEFAULT '1',
  `graphtype` int(11) NOT NULL DEFAULT '0',
  `show_legend` int(11) NOT NULL DEFAULT '1',
  `show_3d` int(11) NOT NULL DEFAULT '0',
  `percent_left` double(16,4) NOT NULL DEFAULT '0.0000',
  `percent_right` double(16,4) NOT NULL DEFAULT '0.0000',
  `ymin_type` int(11) NOT NULL DEFAULT '0',
  `ymax_type` int(11) NOT NULL DEFAULT '0',
  `ymin_itemid` bigint(20) unsigned DEFAULT NULL,
  `ymax_itemid` bigint(20) unsigned DEFAULT NULL,
  `flags` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`graphid`),
  KEY `graphs_1` (`name`),
  KEY `graphs_2` (`templateid`),
  KEY `graphs_3` (`ymin_itemid`),
  KEY `graphs_4` (`ymax_itemid`),
  CONSTRAINT `c_graphs_1` FOREIGN KEY (`templateid`) REFERENCES `graphs` (`graphid`) ON DELETE CASCADE,
  CONSTRAINT `c_graphs_2` FOREIGN KEY (`ymin_itemid`) REFERENCES `items` (`itemid`),
  CONSTRAINT `c_graphs_3` FOREIGN KEY (`ymax_itemid`) REFERENCES `items` (`itemid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `graphs`
--

LOCK TABLES `graphs` WRITE;
/*!40000 ALTER TABLE `graphs` DISABLE KEYS */;
INSERT INTO `graphs` VALUES (387,'CPU utilization',900,200,0.0000,100.0000,NULL,1,0,1,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(392,'Zabbix server performance',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(404,'Zabbix data gathering process busy %',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(406,'Zabbix internal process busy %',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(410,'Zabbix cache usage, % free',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(420,'Network traffic on {#IFNAME}',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,0,NULL,NULL,2),(433,'CPU load',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,0,NULL,NULL,0),(436,'Swap usage',600,340,0.0000,100.0000,NULL,0,0,2,1,1,0.0000,0.0000,0,0,NULL,NULL,0),(439,'CPU jumps',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(442,'Disk space usage {#FSNAME}',600,340,0.0000,100.0000,NULL,0,0,2,1,1,0.0000,0.0000,0,0,NULL,NULL,2),(456,'CPU utilization',900,200,0.0000,100.0000,NULL,1,0,1,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(457,'CPU load',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,0,NULL,NULL,0),(458,'Swap usage',600,340,0.0000,100.0000,NULL,0,0,2,1,1,0.0000,0.0000,0,0,NULL,NULL,0),(459,'CPU jumps',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(461,'Disk space usage {#FSNAME}',600,340,0.0000,100.0000,NULL,0,0,2,1,1,0.0000,0.0000,0,0,NULL,NULL,2),(462,'CPU utilization',900,200,0.0000,100.0000,NULL,1,0,1,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(463,'CPU load',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,0,NULL,NULL,0),(464,'Swap usage',600,340,0.0000,100.0000,NULL,0,0,2,1,1,0.0000,0.0000,0,0,NULL,NULL,0),(465,'CPU jumps',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(467,'Disk space usage {#FSNAME}',600,340,0.0000,100.0000,NULL,0,0,2,1,1,0.0000,0.0000,0,0,NULL,NULL,2),(469,'CPU load',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,0,NULL,NULL,0),(471,'CPU jumps',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(472,'Network traffic on {#IFNAME}',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,0,NULL,NULL,2),(473,'Disk space usage {#FSNAME}',600,340,0.0000,100.0000,NULL,0,0,2,1,1,0.0000,0.0000,0,0,NULL,NULL,2),(474,'CPU utilization',900,200,0.0000,100.0000,NULL,1,0,1,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(475,'CPU load',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,0,NULL,NULL,0),(478,'Network traffic on {#IFNAME}',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,0,NULL,NULL,2),(479,'Disk space usage {#FSNAME}',600,340,0.0000,100.0000,NULL,0,0,2,1,1,0.0000,0.0000,0,0,NULL,NULL,2),(480,'CPU utilization',900,200,0.0000,100.0000,NULL,1,0,1,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(481,'CPU load',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,0,NULL,NULL,0),(482,'Swap usage',600,340,0.0000,100.0000,NULL,0,0,2,1,1,0.0000,0.0000,0,0,NULL,NULL,0),(483,'CPU jumps',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(484,'Network traffic on {#IFNAME}',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,0,NULL,NULL,2),(485,'Disk space usage {#FSNAME}',600,340,0.0000,100.0000,NULL,0,0,2,1,1,0.0000,0.0000,0,0,NULL,NULL,2),(487,'CPU load',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,0,NULL,NULL,0),(491,'Disk space usage {#FSNAME}',600,340,0.0000,100.0000,NULL,0,0,2,1,1,0.0000,0.0000,0,0,NULL,NULL,2),(492,'Network traffic on {#IFNAME}',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,0,NULL,NULL,2),(493,'Network traffic on {#IFNAME}',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,0,NULL,NULL,2),(494,'Network traffic on en0',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,0,NULL,NULL,0),(495,'CPU load',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,0,NULL,NULL,0),(496,'Disk space usage {#FSNAME}',600,340,0.0000,100.0000,NULL,0,0,2,1,1,0.0000,0.0000,0,0,NULL,NULL,2),(497,'Network traffic on {#IFNAME}',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,0,NULL,NULL,2),(498,'CPU utilization',900,200,0.0000,100.0000,NULL,1,0,1,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(517,'Zabbix internal process busy %',900,200,0.0000,100.0000,406,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(518,'Zabbix data gathering process busy %',900,200,0.0000,100.0000,404,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(519,'Zabbix server performance',900,200,0.0000,100.0000,392,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(520,'Zabbix cache usage, % free',900,200,0.0000,100.0000,410,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(521,'Network traffic on {#IFNAME}',900,200,0.0000,100.0000,420,1,1,0,1,0,0.0000,0.0000,1,0,NULL,NULL,2),(522,'Disk space usage {#FSNAME}',600,340,0.0000,100.0000,442,0,0,2,1,1,0.0000,0.0000,0,0,NULL,NULL,2),(523,'CPU jumps',900,200,0.0000,100.0000,439,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(524,'CPU load',900,200,0.0000,100.0000,433,1,1,0,1,0,0.0000,0.0000,1,0,NULL,NULL,0),(525,'CPU utilization',900,200,0.0000,100.0000,387,1,0,1,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(526,'Swap usage',600,340,0.0000,100.0000,436,0,0,2,1,1,0.0000,0.0000,0,0,NULL,NULL,0),(527,'Value cache effectiveness',900,200,0.0000,100.0000,NULL,1,1,1,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(528,'Value cache effectiveness',900,200,0.0000,100.0000,527,1,1,1,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(529,'Zabbix cache usage, % free',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(530,'Zabbix data gathering process busy %',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(531,'Zabbix internal process busy %',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(532,'Zabbix proxy performance',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(533,'Memory usage',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,2,NULL,10026,0),(534,'Memory usage',900,200,0.0000,100.0000,533,1,1,0,1,0,0.0000,0.0000,1,2,NULL,23317,0),(540,'Memory usage',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,2,NULL,22943,0),(541,'Memory usage',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,2,NULL,22903,0),(542,'Memory usage',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,2,NULL,22983,0),(543,'Memory usage',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,2,NULL,23063,0),(544,'Memory usage',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,2,NULL,22863,0),(545,'Memory usage',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,2,NULL,23023,0),(546,'Memory usage',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,2,NULL,23159,0),(634,'http-8080 worker threads',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(635,'http-8443 worker threads',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(636,'jk-8009 worker threads',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(637,'sessions /',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(638,'Class Loader',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(639,'File Descriptors',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(640,'Garbage Collector collections per second',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(641,'Memory Pool CMS Old Gen',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(642,'Memory Pool CMS Perm Gen',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(643,'Memory Pool Code Cache',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(644,'Memory Pool Perm Gen',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(645,'Memory Pool PS Old Gen',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(646,'Memory Pool PS Perm Gen',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(647,'Memory Pool Tenured Gen',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(648,'Threads',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(649,'MySQL bandwidth',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(650,'MySQL operations',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(651,'Fan speed and ambient temperature',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(652,'Voltage',900,200,0.0000,5.5000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(653,'Fan speed and temperature',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(654,'Voltage',900,200,0.0000,5.5000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(655,'#{#SNMPINDEX}: CPU utilization',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,2),(657,'#{#SNMPINDEX}: CPU utilization',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,2),(668,'CPU utilization',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(669,'Memory utilization',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(671,'CPU utilization',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(672,'Memory utilization',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(675,'CPU utilization',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(676,'CPU utilization',900,200,0.0000,100.0000,675,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(677,'CPU utilization',900,200,0.0000,100.0000,675,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(678,'Memory utilization',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(679,'Memory utilization',900,200,0.0000,100.0000,678,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(680,'Memory utilization',900,200,0.0000,100.0000,678,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(683,'{#SNMPVALUE}: Memory utilization',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,2),(684,'{#SNMPVALUE}: Memory utilization',900,200,0.0000,100.0000,683,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,2),(686,'{#SNMPVALUE}: Memory utilization',900,200,0.0000,100.0000,683,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,2),(687,'#{#SNMPINDEX}: CPU utilization',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,2),(688,'#{#SNMPINDEX}: CPU utilization',900,200,0.0000,100.0000,687,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,2),(691,'CPU utilization',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(692,'CPU utilization',900,200,0.0000,100.0000,691,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(694,'#{#SNMPINDEX}: CPU utilization',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,2),(695,'#{#SNMPINDEX}: Memory utilization',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,2),(697,'Memory utilization',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,2),(698,'CPU utilization',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(700,'#{#SNMPVALUE}: Memory utilization',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,2),(701,'CPU utilization',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(703,'#{#SNMPVALUE}: Memory utilization',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,2),(704,'CPU utilization',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(708,'{#MODULE_NAME}: CPU utilization',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,2),(709,'{#MODULE_NAME}: Memory utilization',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,2),(714,'{#ENT_NAME}: CPU utilization',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,2),(715,'{#ENT_NAME}: Memory utilization',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,2),(718,'{#SNMPVALUE}: CPU utilization',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,2),(719,'{#SNMPVALUE}: Memory utilization',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,2),(724,'#{#SNMPINDEX}: CPU utilization',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,2),(725,'Memory utilization',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(727,'CPU utilization',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(728,'Memory utilization',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(730,'CPU utilization',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(731,'Memory utilization',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(733,'#{#SNMPVALUE}: CPU utilization',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,2),(734,'#{#SNMPVALUE}: Memory utilization',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,2),(736,'CPU utilization',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(737,'Memory utilization',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(738,'Interface {#IFDESCR}: Network traffic',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,2),(739,'Interface {#IFDESCR}: Network traffic',900,200,0.0000,100.0000,738,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,2),(740,'Interface {#IFDESCR}: Network traffic',900,200,0.0000,100.0000,738,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,2),(741,'Interface {#IFDESCR}: Network traffic',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,2),(742,'Interface {#IFDESCR}: Network traffic',900,200,0.0000,100.0000,741,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,2),(743,'Interface {#IFDESCR}: Network traffic',900,200,0.0000,100.0000,741,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,2),(744,'Interface {#IFNAME}({#IFALIAS}): Network traffic',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,2),(745,'Interface {#IFNAME}({#IFALIAS}): Network traffic',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,2),(746,'Interface {#IFNAME}({#IFALIAS}): Network traffic',900,200,0.0000,100.0000,745,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,2),(747,'Interface {#IFNAME}({#IFALIAS}): Network traffic',900,200,0.0000,100.0000,745,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,2),(748,'Interface {#IFNAME}({#IFALIAS}): Network traffic',900,200,0.0000,100.0000,745,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,2),(749,'Interface {#IFNAME}({#IFALIAS}): Network traffic',900,200,0.0000,100.0000,745,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,2),(750,'Interface {#IFNAME}({#IFALIAS}): Network traffic',900,200,0.0000,100.0000,745,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,2),(752,'Interface {#IFNAME}({#IFALIAS}): Network traffic',900,200,0.0000,100.0000,745,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,2),(753,'Interface {#IFNAME}({#IFALIAS}): Network traffic',900,200,0.0000,100.0000,745,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,2),(754,'Interface {#IFNAME}({#IFALIAS}): Network traffic',900,200,0.0000,100.0000,745,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,2),(755,'Interface {#IFNAME}({#IFALIAS}): Network traffic',900,200,0.0000,100.0000,745,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,2),(756,'Interface {#IFNAME}({#IFALIAS}): Network traffic',900,200,0.0000,100.0000,745,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,2),(758,'Interface {#IFNAME}({#IFALIAS}): Network traffic',900,200,0.0000,100.0000,745,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,2),(759,'Interface {#IFNAME}({#IFALIAS}): Network traffic',900,200,0.0000,100.0000,745,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,2),(760,'Interface {#IFNAME}({#IFALIAS}): Network traffic',900,200,0.0000,100.0000,745,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,2),(762,'Interface {#IFNAME}({#IFALIAS}): Network traffic',900,200,0.0000,100.0000,745,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,2),(763,'Interface {#IFNAME}({#IFALIAS}): Network traffic',900,200,0.0000,100.0000,745,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,2),(764,'Interface {#IFNAME}({#IFALIAS}): Network traffic',900,200,0.0000,100.0000,745,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,2),(766,'Interface {#IFNAME}({#IFALIAS}): Network traffic',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,2),(767,'#{#SNMPINDEX}: CPU utilization',900,200,0.0000,100.0000,657,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,2),(769,'Interface {#IFNAME}({#IFALIAS}): Network traffic',900,200,0.0000,100.0000,745,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,2),(770,'#{#SNMPINDEX}: CPU utilization',900,200,0.0000,100.0000,657,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,2),(772,'Interface {#IFNAME}({#IFALIAS}): Network traffic',900,200,0.0000,100.0000,766,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,2),(773,'Interface {#IFNAME}({#IFALIAS}): Network traffic',900,200,0.0000,100.0000,745,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,2),(774,'#{#SNMPVALUE}: Memory utilization',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,2),(775,'CPU utilization',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,0),(776,'#{#SNMPINDEX}: CPU utilization',900,200,0.0000,100.0000,657,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,2),(778,'Interface {#IFNAME}({#IFALIAS}): Network traffic',900,200,0.0000,100.0000,745,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,2),(779,'#{#SNMPINDEX}: Memory utilization',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,2),(780,'#{#SNMPINDEX}: Memory utilization',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,2),(781,'#{#SNMPINDEX}: Memory utilization',900,200,0.0000,100.0000,780,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,2),(782,'#{#SNMPINDEX}: Memory utilization',900,200,0.0000,100.0000,780,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,2),(783,'#{#SNMPINDEX}: Memory utilization',900,200,0.0000,100.0000,780,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,2),(784,'{#SNMPVALUE}: Memory utilization',900,200,0.0000,100.0000,683,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,2),(785,'Interface {#IFNAME}({#IFALIAS}): Network traffic',900,200,0.0000,100.0000,745,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,2),(786,'{#SNMPVALUE}: CPU utilization',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,2),(787,'{#SNMPVALUE}: CPU utilization',900,200,0.0000,100.0000,786,1,1,0,1,0,0.0000,0.0000,1,1,NULL,NULL,2),(788,'Zabbix preprocessing queue',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(789,'Zabbix preprocessing queue',900,200,0.0000,100.0000,788,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(865,'Network traffic on p6p1',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,0,NULL,NULL,4),(866,'Network traffic on p6p2',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,0,NULL,NULL,4),(867,'Network traffic on virbr0-nic',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,0,NULL,NULL,4),(868,'Network traffic on virbr0',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,0,NULL,NULL,4),(869,'Network traffic on em4',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,0,NULL,NULL,4),(870,'Network traffic on em3',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,0,NULL,NULL,4),(871,'Network traffic on em2',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,0,NULL,NULL,4),(872,'Network traffic on em1',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,1,0,NULL,NULL,4),(873,'Disk space usage /',600,340,0.0000,100.0000,NULL,0,0,2,1,1,0.0000,0.0000,0,0,NULL,NULL,4),(874,'Disk space usage /data',600,340,0.0000,100.0000,NULL,0,0,2,1,1,0.0000,0.0000,0,0,NULL,NULL,4),(875,'Disk space usage /home',600,340,0.0000,100.0000,NULL,0,0,2,1,1,0.0000,0.0000,0,0,NULL,NULL,4),(876,'Disk space usage /boot',600,340,0.0000,100.0000,NULL,0,0,2,1,1,0.0000,0.0000,0,0,NULL,NULL,4),(881,'MySQL bandwidth',900,200,0.0000,100.0000,649,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(882,'MySQL operations',900,200,0.0000,100.0000,650,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(951,'统计当天同步任务数据量',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(952,'按时间统计同步任务数据量',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(953,'集群健康节点个数',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(954,'集群磁盘使用率',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(955,'集群一般告警个数',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(956,'集群严重告警个数',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(957,'集群告警节点个数',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(958,'集群失联节点个数',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(959,'HDFS分区数量',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(960,'集群状态',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(961,'HDFS文件存储数量',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(962,'Yarn保留容器个数',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(963,'Yarn分配容器个数',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(964,'Yarn等待调度容器个数',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0),(965,'集群非健康节点个数',900,200,0.0000,100.0000,NULL,1,1,0,1,0,0.0000,0.0000,0,0,NULL,NULL,0);
/*!40000 ALTER TABLE `graphs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `graphs_items`
--

DROP TABLE IF EXISTS `graphs_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `graphs_items` (
  `gitemid` bigint(20) unsigned NOT NULL,
  `graphid` bigint(20) unsigned NOT NULL,
  `itemid` bigint(20) unsigned NOT NULL,
  `drawtype` int(11) NOT NULL DEFAULT '0',
  `sortorder` int(11) NOT NULL DEFAULT '0',
  `color` varchar(6) NOT NULL DEFAULT '009600',
  `yaxisside` int(11) NOT NULL DEFAULT '0',
  `calc_fnc` int(11) NOT NULL DEFAULT '2',
  `type` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`gitemid`),
  KEY `graphs_items_1` (`itemid`),
  KEY `graphs_items_2` (`graphid`),
  CONSTRAINT `c_graphs_items_1` FOREIGN KEY (`graphid`) REFERENCES `graphs` (`graphid`) ON DELETE CASCADE,
  CONSTRAINT `c_graphs_items_2` FOREIGN KEY (`itemid`) REFERENCES `items` (`itemid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `graphs_items`
--

LOCK TABLES `graphs_items` WRITE;
/*!40000 ALTER TABLE `graphs_items` DISABLE KEYS */;
INSERT INTO `graphs_items` VALUES (2092,634,26832,0,0,'C80000',0,2,0),(2093,634,26831,0,1,'00C800',0,2,0),(2094,634,26826,0,2,'0000C8',0,2,0),(2095,635,26836,0,0,'C80000',0,2,0),(2096,635,26838,0,1,'00C800',0,2,0),(2097,635,26837,0,2,'0000C8',0,2,0),(2098,636,26834,0,0,'C80000',0,2,0),(2099,636,26833,0,1,'00C800',0,2,0),(2100,636,26835,0,2,'0000C8',0,2,0),(2101,637,26830,0,0,'C80000',0,2,0),(2102,637,26840,0,1,'00C800',0,2,0),(2103,637,26839,0,2,'0000C8',0,2,0),(2104,638,26892,0,0,'C80000',0,2,0),(2105,638,26891,0,1,'00C800',0,2,0),(2106,638,26910,0,2,'0000C8',0,2,0),(2107,639,26879,0,0,'C80000',0,2,0),(2108,639,26880,0,1,'00C800',0,2,0),(2109,640,26906,0,0,'C80000',0,2,0),(2110,640,26895,0,1,'00C800',0,2,0),(2111,640,26889,0,2,'0000C8',0,2,0),(2112,640,26884,0,3,'C8C800',0,2,0),(2113,640,26896,0,4,'00C8C9',0,2,0),(2114,640,26887,0,5,'C800C8',0,2,0),(2115,641,26900,0,0,'C80000',0,2,0),(2116,641,26901,0,1,'00C800',0,2,0),(2117,641,26902,0,2,'0000C8',0,2,0),(2118,642,26883,0,0,'C80000',0,2,0),(2119,642,26882,0,1,'00C800',0,2,0),(2120,642,26864,0,2,'0000C8',0,2,0),(2121,643,26863,0,0,'C80000',0,2,0),(2122,643,26865,0,1,'00C800',0,2,0),(2123,643,26866,0,2,'0000C8',0,2,0),(2124,644,26867,0,0,'C80000',0,2,0),(2125,644,26862,0,1,'00C800',0,2,0),(2126,644,26861,0,2,'0000C8',0,2,0),(2127,645,26857,0,0,'C80000',0,2,0),(2128,645,26856,0,1,'00C800',0,2,0),(2129,645,26858,0,2,'0000C8',0,2,0),(2130,646,26859,0,0,'0000C8',0,2,0),(2131,646,26860,0,1,'C80000',0,2,0),(2132,646,26868,0,2,'00C800',0,2,0),(2133,647,26869,0,0,'C80000',0,2,0),(2134,647,26878,0,1,'00C800',0,2,0),(2135,647,26877,0,2,'0000C8',0,2,0),(2136,648,26872,0,0,'C80000',0,2,0),(2137,648,26870,0,1,'00C800',0,2,0),(2138,648,26873,0,2,'0000C8',0,2,0),(2139,529,23357,0,0,'DD0000',0,2,0),(2140,529,23341,0,1,'00DDDD',0,2,0),(2141,529,23342,0,2,'3333FF',0,2,0),(2142,530,23345,0,0,'990099',0,2,0),(2143,530,23348,0,1,'990000',0,2,0),(2144,530,23355,0,2,'0000EE',0,2,0),(2145,530,23352,0,3,'FF33FF',0,2,0),(2146,530,23356,0,4,'00EE00',0,2,0),(2147,530,23354,0,5,'003300',0,2,0),(2148,530,23346,0,6,'33FFFF',0,2,0),(2149,530,23349,0,7,'DD0000',0,2,0),(2150,530,23344,0,8,'000099',0,7,0),(2151,531,23353,0,0,'FFAA00',0,2,0),(2152,531,23347,0,1,'990099',0,2,0),(2153,531,23350,0,2,'EE0000',0,2,0),(2154,531,23343,0,3,'FF66FF',0,2,0),(2155,531,23351,0,4,'960000',0,2,0),(2156,531,23360,0,5,'009600',0,2,0),(2157,531,25369,0,6,'009999',0,2,0),(2158,531,25368,0,6,'BBBB00',0,2,0),(2159,532,23340,5,0,'00C800',0,2,0),(2160,532,23358,5,1,'C80000',1,2,0),(2227,649,26920,5,0,'00AA00',0,2,0),(2228,649,26919,5,1,'3333FF',0,2,0),(2229,650,26921,0,0,'C8C800',0,2,0),(2230,650,26922,0,1,'006400',0,2,0),(2231,650,26923,0,2,'C80000',0,2,0),(2232,650,26918,0,3,'0000EE',0,2,0),(2233,650,26917,0,4,'640000',0,2,0),(2234,650,26912,0,5,'00C800',0,2,0),(2235,650,26911,0,6,'C800C8',0,2,0),(2236,472,22945,5,0,'00AA00',0,2,0),(2237,472,22946,5,1,'3333FF',0,2,0),(2238,473,22950,0,0,'C80000',0,2,2),(2239,473,22948,0,1,'00C800',0,2,0),(2240,471,22924,0,0,'009900',0,2,0),(2241,471,22920,0,1,'000099',0,2,0),(2242,469,22922,0,0,'009900',0,2,0),(2243,469,22923,0,1,'000099',0,2,0),(2244,469,22921,0,2,'990000',0,2,0),(2245,498,23109,0,0,'009999',0,2,0),(2246,498,23112,0,1,'990099',0,2,0),(2247,498,23115,0,2,'999900',0,2,0),(2248,498,23113,0,3,'990000',0,2,0),(2249,498,23114,0,4,'000099',0,2,0),(2250,498,23110,0,5,'009900',0,2,0),(2251,540,22942,5,0,'00C800',0,2,0),(2252,492,23073,5,0,'00AA00',0,2,0),(2253,492,23074,5,1,'3333FF',0,2,0),(2254,467,22910,0,0,'C80000',0,2,2),(2255,467,22908,0,1,'00C800',0,2,0),(2256,465,22884,0,0,'009900',0,2,0),(2257,465,22880,0,1,'000099',0,2,0),(2258,463,22882,0,0,'009900',0,2,0),(2259,463,22883,0,1,'000099',0,2,0),(2260,463,22881,0,2,'990000',0,2,0),(2261,462,22886,1,0,'009999',0,2,0),(2262,462,22888,1,1,'990099',0,2,0),(2263,462,22891,1,2,'990000',0,2,0),(2264,462,22892,1,3,'000099',0,2,0),(2265,462,22885,1,4,'009900',0,2,0),(2266,541,22902,5,0,'00C800',0,2,0),(2267,464,22897,0,0,'AA0000',0,2,2),(2268,464,22895,0,1,'00AA00',0,2,0),(2269,478,22985,5,0,'00AA00',0,2,0),(2270,478,22986,5,1,'3333FF',0,2,0),(2271,479,22990,0,0,'C80000',0,2,2),(2272,479,22988,0,1,'00C800',0,2,0),(2273,475,22962,0,0,'009900',0,2,0),(2274,475,22963,0,1,'000099',0,2,0),(2275,475,22961,0,2,'990000',0,2,0),(2276,474,22968,1,0,'990099',0,2,0),(2277,474,22971,1,1,'990000',0,2,0),(2278,474,22972,1,2,'000099',0,2,0),(2279,474,22965,1,3,'009900',0,2,0),(2280,542,22982,5,0,'00C800',0,2,0),(2281,420,22446,5,0,'00AA00',0,2,0),(2282,420,22448,5,1,'3333FF',0,2,0),(2283,521,23280,5,0,'00AA00',0,2,0),(2284,521,23281,5,1,'3333FF',0,2,0),(2285,442,22456,0,0,'C80000',0,2,2),(2286,442,22452,0,1,'00C800',0,2,0),(2287,522,23285,0,0,'C80000',0,2,2),(2288,522,23283,0,1,'00C800',0,2,0),(2289,439,22680,0,0,'009900',0,2,0),(2290,439,22683,0,1,'000099',0,2,0),(2291,523,23298,0,0,'009900',0,2,0),(2292,523,23294,0,1,'000099',0,2,0),(2293,433,10010,0,0,'009900',0,2,0),(2294,433,22674,0,1,'000099',0,2,0),(2295,433,22677,0,2,'990000',0,2,0),(2296,524,23296,0,0,'009900',0,2,0),(2297,524,23297,0,1,'000099',0,2,0),(2298,524,23295,0,2,'990000',0,2,0),(2299,387,22665,1,0,'FF5555',0,2,0),(2300,387,22668,1,1,'55FF55',0,2,0),(2301,387,22671,1,2,'009999',0,2,0),(2302,387,17358,1,3,'990099',0,2,0),(2303,387,17362,1,4,'999900',0,2,0),(2304,387,17360,1,5,'990000',0,2,0),(2305,387,17356,1,6,'000099',0,2,0),(2306,387,17354,1,7,'009900',0,2,0),(2307,525,23304,1,0,'FF5555',0,2,0),(2308,525,23303,1,1,'55FF55',0,2,0),(2309,525,23300,1,2,'009999',0,2,0),(2310,525,23302,1,3,'990099',0,2,0),(2311,525,23301,1,4,'999900',0,2,0),(2312,525,23305,1,5,'990000',0,2,0),(2313,525,23306,1,6,'000099',0,2,0),(2314,525,23299,1,7,'009900',0,2,0),(2315,533,22181,5,0,'00C800',0,2,0),(2316,534,23316,5,0,'00C800',0,2,0),(2317,436,10030,0,0,'AA0000',0,2,2),(2318,436,10014,0,1,'00AA00',0,2,0),(2319,526,23311,0,0,'AA0000',0,2,2),(2320,526,23309,0,1,'00AA00',0,2,0),(2321,491,23070,0,0,'C80000',0,2,2),(2322,491,23068,0,1,'00C800',0,2,0),(2323,487,23042,0,0,'009900',0,2,0),(2324,487,23043,0,1,'000099',0,2,0),(2325,487,23041,0,2,'990000',0,2,0),(2326,543,23062,5,0,'00C800',0,2,0),(2327,494,23077,5,0,'00AA00',0,2,0),(2328,494,23078,5,1,'3333FF',0,2,0),(2329,493,23075,5,0,'00AA00',0,2,0),(2330,493,23076,5,1,'3333FF',0,2,0),(2331,461,22870,0,0,'C80000',0,2,2),(2332,461,22868,0,1,'00C800',0,2,0),(2333,459,22844,0,0,'009900',0,2,0),(2334,459,22840,0,1,'000099',0,2,0),(2335,457,22842,0,0,'009900',0,2,0),(2336,457,22843,0,1,'000099',0,2,0),(2337,457,22841,0,2,'990000',0,2,0),(2338,456,22846,1,0,'009999',0,2,0),(2339,456,22848,1,1,'990099',0,2,0),(2340,456,22851,1,2,'990000',0,2,0),(2341,456,22852,1,3,'000099',0,2,0),(2342,456,22845,1,4,'009900',0,2,0),(2343,544,22862,5,0,'00C800',0,2,0),(2344,458,22857,0,0,'AA0000',0,2,2),(2345,458,22855,0,1,'00AA00',0,2,0),(2346,484,23025,5,0,'00AA00',0,2,0),(2347,484,23026,5,1,'3333FF',0,2,0),(2348,485,23030,0,0,'C80000',0,2,2),(2349,485,23028,0,1,'00C800',0,2,0),(2350,483,23004,0,0,'009900',0,2,0),(2351,483,23000,0,1,'000099',0,2,0),(2352,481,23002,0,0,'009900',0,2,0),(2353,481,23003,0,1,'000099',0,2,0),(2354,481,23001,0,2,'990000',0,2,0),(2355,480,23007,1,0,'999900',0,2,0),(2356,480,23011,1,1,'990000',0,2,0),(2357,480,23012,1,2,'000099',0,2,0),(2358,480,23005,1,3,'009900',0,2,0),(2359,545,23022,5,0,'00C800',0,2,0),(2360,482,23017,0,0,'AA0000',0,2,2),(2361,482,23015,0,1,'00AA00',0,2,0),(2362,497,23169,5,0,'00AA00',0,2,0),(2363,497,23170,5,1,'3333FF',0,2,0),(2364,496,23167,0,0,'C80000',0,2,2),(2365,496,23164,0,1,'00C800',0,2,0),(2366,495,23143,0,0,'009900',0,2,0),(2367,495,23145,0,1,'000099',0,2,0),(2368,495,23144,0,2,'990000',0,2,0),(2369,546,23158,5,0,'00C800',0,2,0),(2370,651,26928,5,0,'EE0000',0,2,0),(2371,651,26927,0,1,'000000',1,2,0),(2372,652,26925,2,0,'880000',0,2,0),(2373,652,26932,0,1,'009900',0,2,0),(2374,652,26930,0,2,'00CCCC',0,2,0),(2375,652,26931,0,3,'000000',0,2,0),(2376,652,26929,0,4,'3333FF',0,2,0),(2377,652,26926,0,5,'777700',0,2,0),(2378,653,26933,2,0,'EE0000',0,2,0),(2379,653,26943,2,1,'EE00EE',0,2,0),(2380,653,26935,0,2,'000000',1,2,0),(2381,653,26936,4,3,'000000',1,2,0),(2382,654,26934,2,0,'880000',0,2,0),(2383,654,26939,0,1,'009900',0,2,0),(2384,654,26942,0,2,'00CCCC',0,2,0),(2385,654,26938,0,3,'000000',0,2,0),(2386,654,26937,0,4,'3333FF',0,2,0),(4474,788,28248,5,0,'1A7C11',0,2,0),(4475,789,28249,5,0,'1A7C11',0,2,0),(4476,527,22199,0,0,'C80000',0,2,0),(4477,527,22196,0,1,'00C800',0,2,0),(4478,528,23628,0,0,'C80000',0,2,0),(4479,528,23625,0,1,'00C800',0,2,0),(4480,410,22185,0,0,'009900',0,2,0),(4481,410,22189,0,1,'DD0000',0,2,0),(4482,410,22396,0,2,'00DDDD',0,2,0),(4483,410,22183,0,3,'3333FF',0,2,0),(4484,410,22191,0,4,'999900',0,2,0),(4485,410,23634,0,5,'00FF00',0,2,0),(4486,520,23276,0,0,'009900',0,2,0),(4487,520,23273,0,1,'DD0000',0,2,0),(4488,520,23275,0,2,'00DDDD',0,2,0),(4489,520,23274,0,3,'3333FF',0,2,0),(4490,520,23620,0,4,'999900',0,2,0),(4491,520,23635,0,5,'00FF00',0,2,0),(4492,404,22404,0,0,'990099',0,2,0),(4493,404,22399,0,1,'990000',0,2,0),(4494,404,22416,0,2,'0000EE',0,2,0),(4495,404,22430,0,3,'FF33FF',0,2,0),(4496,404,22418,0,4,'009600',0,2,0),(4497,404,22402,0,5,'003300',0,2,0),(4498,404,22420,0,6,'CCCC00',0,2,0),(4499,404,22400,0,7,'33FFFF',0,2,0),(4500,404,22689,0,8,'DD0000',0,2,0),(4501,404,23171,0,9,'000099',0,2,0),(4502,404,22401,0,10,'00FF00',0,2,0),(4503,518,23269,0,0,'990099',0,2,0),(4504,518,23264,0,1,'990000',0,2,0),(4505,518,23261,0,2,'0000EE',0,2,0),(4506,518,23255,0,3,'FF33FF',0,2,0),(4507,518,23260,0,4,'009600',0,2,0),(4508,518,23259,0,5,'003300',0,2,0),(4509,518,23265,0,6,'CCCC00',0,2,0),(4510,518,23270,0,7,'33FFFF',0,2,0),(4511,518,23262,0,8,'DD0000',0,2,0),(4512,518,23267,0,9,'000099',0,2,0),(4513,518,23328,0,10,'00FF00',0,2,0),(4514,406,22426,0,0,'00EE00',0,2,0),(4515,406,22422,0,1,'0000EE',0,2,0),(4516,406,22408,0,2,'FFAA00',0,2,0),(4517,406,22424,0,3,'00EEEE',0,2,0),(4518,406,22412,0,4,'990099',0,2,0),(4519,406,22406,0,5,'EE0000',0,2,0),(4520,406,22414,0,6,'FF66FF',0,2,0),(4521,406,23663,0,7,'009999',0,2,0),(4522,406,25366,0,8,'BBBB00',0,2,0),(4523,406,25370,0,9,'AA0000',0,2,0),(4524,406,25665,0,10,'990000',0,2,0),(4525,406,25666,0,11,'008800',0,2,0),(4526,517,23268,0,0,'00EE00',0,2,0),(4527,517,23256,0,1,'0000EE',0,2,0),(4528,517,23258,0,2,'FFAA00',0,2,0),(4529,517,23252,0,3,'00EEEE',0,2,0),(4530,517,23253,0,4,'990099',0,2,0),(4531,517,23257,0,5,'EE0000',0,2,0),(4532,517,23266,0,6,'FF66FF',0,2,0),(4533,517,23664,0,7,'009999',0,2,0),(4534,517,25367,0,8,'BBBB00',0,2,0),(4535,517,25371,0,9,'AA0000',0,2,0),(4536,517,25667,0,10,'990000',0,2,0),(4537,517,25668,0,11,'008800',0,2,0),(4538,392,22187,5,0,'00C800',0,2,0),(4539,392,23251,5,1,'C80000',1,2,0),(4540,519,23277,5,0,'00C800',0,2,0),(4541,519,23272,5,1,'C80000',1,2,0),(5158,738,27074,5,0,'1A7C11',0,2,0),(5159,738,27075,2,1,'2774A4',0,2,0),(5160,738,27073,0,2,'F63100',1,2,0),(5161,738,27076,0,3,'A54F10',1,2,0),(5162,738,27072,0,4,'FC6EA3',1,2,0),(5163,738,27069,0,5,'6C59DC',1,2,0),(5164,739,27599,5,0,'1A7C11',0,2,0),(5165,739,27602,2,1,'2774A4',0,2,0),(5166,739,27601,0,2,'F63100',1,2,0),(5167,739,27598,0,3,'A54F10',1,2,0),(5168,739,27600,0,4,'FC6EA3',1,2,0),(5169,739,27597,0,5,'6C59DC',1,2,0),(5170,740,28008,5,0,'1A7C11',0,2,0),(5171,740,28011,2,1,'2774A4',0,2,0),(5172,740,28010,0,2,'F63100',1,2,0),(5173,740,28007,0,3,'A54F10',1,2,0),(5174,740,28009,0,4,'FC6EA3',1,2,0),(5175,740,28006,0,5,'6C59DC',1,2,0),(5176,741,27084,5,0,'1A7C11',0,2,0),(5177,741,27085,2,1,'2774A4',0,2,0),(5178,741,27083,0,2,'F63100',1,2,0),(5179,741,27086,0,3,'A54F10',1,2,0),(5180,741,27082,0,4,'FC6EA3',1,2,0),(5181,741,27079,0,5,'6C59DC',1,2,0),(5182,742,27622,5,0,'1A7C11',0,2,0),(5183,742,27625,2,1,'2774A4',0,2,0),(5184,742,27624,0,2,'F63100',1,2,0),(5185,742,27621,0,3,'A54F10',1,2,0),(5186,742,27623,0,4,'FC6EA3',1,2,0),(5187,742,27620,0,5,'6C59DC',1,2,0),(5188,743,27979,5,0,'1A7C11',0,2,0),(5189,743,27982,2,1,'2774A4',0,2,0),(5190,743,27981,0,2,'F63100',1,2,0),(5191,743,27978,0,3,'A54F10',1,2,0),(5192,743,27980,0,4,'FC6EA3',1,2,0),(5193,743,27977,0,5,'6C59DC',1,2,0),(5194,766,27124,5,0,'1A7C11',0,2,0),(5195,766,27125,2,1,'2774A4',0,2,0),(5196,766,27123,0,2,'F63100',1,2,0),(5197,766,27126,0,3,'A54F10',1,2,0),(5198,766,27122,0,4,'FC6EA3',1,2,0),(5199,766,27119,0,5,'6C59DC',1,2,0),(5200,772,28100,5,0,'1A7C11',0,2,0),(5201,772,28103,2,1,'2774A4',0,2,0),(5202,772,28102,0,2,'F63100',1,2,0),(5203,772,28099,0,3,'A54F10',1,2,0),(5204,772,28101,0,4,'FC6EA3',1,2,0),(5205,772,28098,0,5,'6C59DC',1,2,0),(5206,744,27094,5,0,'1A7C11',0,2,0),(5207,744,27095,2,1,'2774A4',0,2,0),(5208,744,27093,0,2,'F63100',1,2,0),(5209,744,27096,0,3,'A54F10',1,2,0),(5210,744,27092,0,4,'FC6EA3',1,2,0),(5211,744,27089,0,5,'6C59DC',1,2,0),(5212,745,27104,5,0,'1A7C11',0,2,0),(5213,745,27105,2,1,'2774A4',0,2,0),(5214,745,27103,0,2,'F63100',1,2,0),(5215,745,27106,0,3,'A54F10',1,2,0),(5216,745,27102,0,4,'FC6EA3',1,2,0),(5217,745,27099,0,5,'6C59DC',1,2,0),(5218,746,27183,5,0,'1A7C11',0,2,0),(5219,746,27186,2,1,'2774A4',0,2,0),(5220,746,27185,0,2,'F63100',1,2,0),(5221,746,27182,0,3,'A54F10',1,2,0),(5222,746,27184,0,4,'FC6EA3',1,2,0),(5223,746,27181,0,5,'6C59DC',1,2,0),(5224,747,27218,5,0,'1A7C11',0,2,0),(5225,747,27221,2,1,'2774A4',0,2,0),(5226,747,27220,0,2,'F63100',1,2,0),(5227,747,27217,0,3,'A54F10',1,2,0),(5228,747,27219,0,4,'FC6EA3',1,2,0),(5229,747,27216,0,5,'6C59DC',1,2,0),(5230,748,27254,5,0,'1A7C11',0,2,0),(5231,748,27257,2,1,'2774A4',0,2,0),(5232,748,27256,0,2,'F63100',1,2,0),(5233,748,27253,0,3,'A54F10',1,2,0),(5234,748,27255,0,4,'FC6EA3',1,2,0),(5235,748,27252,0,5,'6C59DC',1,2,0),(5236,749,27275,5,0,'1A7C11',0,2,0),(5237,749,27278,2,1,'2774A4',0,2,0),(5238,749,27277,0,2,'F63100',1,2,0),(5239,749,27274,0,3,'A54F10',1,2,0),(5240,749,27276,0,4,'FC6EA3',1,2,0),(5241,749,27273,0,5,'6C59DC',1,2,0),(5242,750,27324,5,0,'1A7C11',0,2,0),(5243,750,27327,2,1,'2774A4',0,2,0),(5244,750,27326,0,2,'F63100',1,2,0),(5245,750,27323,0,3,'A54F10',1,2,0),(5246,750,27325,0,4,'FC6EA3',1,2,0),(5247,750,27322,0,5,'6C59DC',1,2,0),(5248,752,27453,5,0,'1A7C11',0,2,0),(5249,752,27456,2,1,'2774A4',0,2,0),(5250,752,27455,0,2,'F63100',1,2,0),(5251,752,27452,0,3,'A54F10',1,2,0),(5252,752,27454,0,4,'FC6EA3',1,2,0),(5253,752,27451,0,5,'6C59DC',1,2,0),(5254,753,27489,5,0,'1A7C11',0,2,0),(5255,753,27492,2,1,'2774A4',0,2,0),(5256,753,27491,0,2,'F63100',1,2,0),(5257,753,27488,0,3,'A54F10',1,2,0),(5258,753,27490,0,4,'FC6EA3',1,2,0),(5259,753,27487,0,5,'6C59DC',1,2,0),(5260,754,27523,5,0,'1A7C11',0,2,0),(5261,754,27526,2,1,'2774A4',0,2,0),(5262,754,27525,0,2,'F63100',1,2,0),(5263,754,27522,0,3,'A54F10',1,2,0),(5264,754,27524,0,4,'FC6EA3',1,2,0),(5265,754,27521,0,5,'6C59DC',1,2,0),(5266,755,27559,5,0,'1A7C11',0,2,0),(5267,755,27562,2,1,'2774A4',0,2,0),(5268,755,27561,0,2,'F63100',1,2,0),(5269,755,27558,0,3,'A54F10',1,2,0),(5270,755,27560,0,4,'FC6EA3',1,2,0),(5271,755,27557,0,5,'6C59DC',1,2,0),(5272,756,27645,5,0,'1A7C11',0,2,0),(5273,756,27648,2,1,'2774A4',0,2,0),(5274,756,27647,0,2,'F63100',1,2,0),(5275,756,27644,0,3,'A54F10',1,2,0),(5276,756,27646,0,4,'FC6EA3',1,2,0),(5277,756,27643,0,5,'6C59DC',1,2,0),(5278,758,27725,5,0,'1A7C11',0,2,0),(5279,758,27728,2,1,'2774A4',0,2,0),(5280,758,27727,0,2,'F63100',1,2,0),(5281,758,27724,0,3,'A54F10',1,2,0),(5282,758,27726,0,4,'FC6EA3',1,2,0),(5283,758,27723,0,5,'6C59DC',1,2,0),(5284,759,27759,5,0,'1A7C11',0,2,0),(5285,759,27762,2,1,'2774A4',0,2,0),(5286,759,27761,0,2,'F63100',1,2,0),(5287,759,27758,0,3,'A54F10',1,2,0),(5288,759,27760,0,4,'FC6EA3',1,2,0),(5289,759,27757,0,5,'6C59DC',1,2,0),(5290,760,27791,5,0,'1A7C11',0,2,0),(5291,760,27794,2,1,'2774A4',0,2,0),(5292,760,27793,0,2,'F63100',1,2,0),(5293,760,27790,0,3,'A54F10',1,2,0),(5294,760,27792,0,4,'FC6EA3',1,2,0),(5295,760,27789,0,5,'6C59DC',1,2,0),(5296,762,27875,5,0,'1A7C11',0,2,0),(5297,762,27878,2,1,'2774A4',0,2,0),(5298,762,27877,0,2,'F63100',1,2,0),(5299,762,27874,0,3,'A54F10',1,2,0),(5300,762,27876,0,4,'FC6EA3',1,2,0),(5301,762,27873,0,5,'6C59DC',1,2,0),(5302,763,27912,5,0,'1A7C11',0,2,0),(5303,763,27915,2,1,'2774A4',0,2,0),(5304,763,27914,0,2,'F63100',1,2,0),(5305,763,27911,0,3,'A54F10',1,2,0),(5306,763,27913,0,4,'FC6EA3',1,2,0),(5307,763,27910,0,5,'6C59DC',1,2,0),(5308,764,27947,5,0,'1A7C11',0,2,0),(5309,764,27950,2,1,'2774A4',0,2,0),(5310,764,27949,0,2,'F63100',1,2,0),(5311,764,27946,0,3,'A54F10',1,2,0),(5312,764,27948,0,4,'FC6EA3',1,2,0),(5313,764,27945,0,5,'6C59DC',1,2,0),(5314,769,28061,5,0,'1A7C11',0,2,0),(5315,769,28064,2,1,'2774A4',0,2,0),(5316,769,28063,0,2,'F63100',1,2,0),(5317,769,28060,0,3,'A54F10',1,2,0),(5318,769,28062,0,4,'FC6EA3',1,2,0),(5319,769,28059,0,5,'6C59DC',1,2,0),(5320,773,28121,5,0,'1A7C11',0,2,0),(5321,773,28124,2,1,'2774A4',0,2,0),(5322,773,28123,0,2,'F63100',1,2,0),(5323,773,28120,0,3,'A54F10',1,2,0),(5324,773,28122,0,4,'FC6EA3',1,2,0),(5325,773,28119,0,5,'6C59DC',1,2,0),(5326,778,28178,5,0,'1A7C11',0,2,0),(5327,778,28181,2,1,'2774A4',0,2,0),(5328,778,28180,0,2,'F63100',1,2,0),(5329,778,28177,0,3,'A54F10',1,2,0),(5330,778,28179,0,4,'FC6EA3',1,2,0),(5331,778,28176,0,5,'6C59DC',1,2,0),(5332,785,28226,5,0,'1A7C11',0,2,0),(5333,785,28229,2,1,'2774A4',0,2,0),(5334,785,28228,0,2,'F63100',1,2,0),(5335,785,28225,0,3,'A54F10',1,2,0),(5336,785,28227,0,4,'FC6EA3',1,2,0),(5337,785,28224,0,5,'6C59DC',1,2,0),(5338,655,27036,5,0,'1A7C11',0,2,0),(5339,779,27038,5,0,'1A7C11',0,2,0),(5340,657,27052,5,0,'1A7C11',0,2,0),(5341,767,28045,5,0,'1A7C11',0,2,0),(5342,770,28084,5,0,'1A7C11',0,2,0),(5343,776,28162,5,0,'1A7C11',0,2,0),(5344,780,27054,5,0,'1A7C11',0,2,0),(5345,781,28052,5,0,'1A7C11',0,2,0),(5346,782,28091,5,0,'1A7C11',0,2,0),(5347,783,28169,5,0,'1A7C11',0,2,0),(5348,724,27904,5,0,'1A7C11',0,2,0),(5349,725,27899,5,0,'1A7C11',0,2,0),(5350,668,27208,5,0,'1A7C11',0,2,0),(5351,669,27205,5,0,'1A7C11',0,2,0),(5352,694,27478,5,0,'1A7C11',0,2,0),(5353,695,27477,5,0,'1A7C11',0,2,0),(5354,700,27552,5,0,'1A7C11',0,2,0),(5355,701,27547,5,0,'1A7C11',0,2,0),(5356,683,27414,5,0,'1A7C11',0,2,0),(5357,684,27424,5,0,'1A7C11',0,2,0),(5358,686,27442,5,0,'1A7C11',0,2,0),(5359,784,28221,5,0,'1A7C11',0,2,0),(5360,687,27417,5,0,'1A7C11',0,2,0),(5361,688,27427,5,0,'1A7C11',0,2,0),(5362,786,28246,5,0,'1A7C11',0,2,0),(5363,787,28247,5,0,'1A7C11',0,2,0),(5364,691,27376,5,0,'1A7C11',0,2,0),(5365,692,27380,5,0,'1A7C11',0,2,0),(5366,733,28003,5,0,'1A7C11',0,2,0),(5367,734,28004,5,0,'1A7C11',0,2,0),(5368,730,27975,5,0,'1A7C11',0,2,0),(5369,731,27974,5,0,'1A7C11',0,2,0),(5370,697,27516,5,0,'1A7C11',0,2,0),(5371,698,27511,5,0,'1A7C11',0,2,0),(5372,703,27590,5,0,'1A7C11',0,2,0),(5373,704,27586,5,0,'1A7C11',0,2,0),(5374,708,27671,5,0,'1A7C11',0,2,0),(5375,709,27670,5,0,'1A7C11',0,2,0),(5376,774,28151,5,0,'1A7C11',0,2,0),(5377,775,28143,5,0,'1A7C11',0,2,0),(5378,718,27820,5,0,'1A7C11',0,2,0),(5379,719,27819,5,0,'1A7C11',0,2,0),(5380,675,27294,5,0,'1A7C11',0,2,0),(5381,676,27299,5,0,'1A7C11',0,2,0),(5382,677,27301,5,0,'1A7C11',0,2,0),(5383,678,27293,5,0,'1A7C11',0,2,0),(5384,679,27298,5,0,'1A7C11',0,2,0),(5385,680,27300,5,0,'1A7C11',0,2,0),(5386,671,27240,5,0,'1A7C11',0,2,0),(5387,672,27239,5,0,'1A7C11',0,2,0),(5388,714,27753,5,0,'1A7C11',0,2,0),(5389,715,27752,5,0,'1A7C11',0,2,0),(5390,727,27936,5,0,'1A7C11',0,2,0),(5391,728,27933,5,0,'1A7C11',0,2,0),(5392,736,28031,5,0,'1A7C11',0,2,0),(5393,737,28028,5,0,'1A7C11',0,2,0),(5628,865,28589,5,0,'00AA00',0,2,0),(5629,865,28597,5,1,'3333FF',0,2,0),(5630,866,28590,5,0,'00AA00',0,2,0),(5631,866,28598,5,1,'3333FF',0,2,0),(5632,867,28591,5,0,'00AA00',0,2,0),(5633,867,28599,5,1,'3333FF',0,2,0),(5634,868,28592,5,0,'00AA00',0,2,0),(5635,868,28600,5,1,'3333FF',0,2,0),(5636,869,28593,5,0,'00AA00',0,2,0),(5637,869,28601,5,1,'3333FF',0,2,0),(5638,870,28594,5,0,'00AA00',0,2,0),(5639,870,28602,5,1,'3333FF',0,2,0),(5640,871,28595,5,0,'00AA00',0,2,0),(5641,871,28603,5,1,'3333FF',0,2,0),(5642,872,28596,5,0,'00AA00',0,2,0),(5643,872,28604,5,1,'3333FF',0,2,0),(5644,873,28617,0,0,'C80000',0,2,2),(5645,873,28609,0,1,'00C800',0,2,0),(5646,874,28618,0,0,'C80000',0,2,2),(5647,874,28610,0,1,'00C800',0,2,0),(5648,875,28619,0,0,'C80000',0,2,2),(5649,875,28611,0,1,'00C800',0,2,0),(5650,876,28620,0,0,'C80000',0,2,2),(5651,876,28612,0,1,'00C800',0,2,0),(5664,881,28711,5,0,'00AA00',0,2,0),(5665,881,28712,5,1,'3333FF',0,2,0),(5666,882,28713,0,0,'C8C800',0,2,0),(5667,882,28714,0,1,'006400',0,2,0),(5668,882,28715,0,2,'C80000',0,2,0),(5669,882,28716,0,3,'0000EE',0,2,0),(5670,882,28717,0,4,'640000',0,2,0),(5671,882,28718,0,5,'00C800',0,2,0),(5672,882,28719,0,6,'C800C8',0,2,0),(5840,951,29116,0,0,'1A7C11',0,2,0),(5841,952,29115,0,0,'1A7C11',0,2,0),(5842,953,29459,0,0,'1A7C11',0,2,0),(5843,954,29420,0,0,'1A7C11',0,2,0),(5844,955,29448,0,0,'1A7C11',0,2,0),(5845,956,29413,0,0,'1A7C11',0,2,0),(5846,957,29471,0,0,'1A7C11',0,2,0),(5847,958,29462,0,0,'1A7C11',0,2,0),(5848,959,29442,0,0,'1A7C11',0,2,0),(5849,960,29448,0,0,'1A7C11',0,2,0),(5850,960,29413,0,1,'F63100',0,2,0),(5851,960,29459,0,2,'2774A4',0,2,0),(5852,960,29471,0,3,'A54F10',0,2,0),(5853,960,29462,0,4,'FC6EA3',0,2,0),(5854,960,29433,0,5,'6C59DC',0,2,0),(5855,960,29432,0,6,'AC8C14',0,2,0),(5856,961,29418,0,0,'1A7C11',0,2,0),(5857,962,29444,0,0,'1A7C11',0,2,0),(5858,963,29470,0,0,'1A7C11',0,2,0),(5859,964,29454,0,0,'1A7C11',0,2,0),(5860,965,29432,0,0,'1A7C11',0,2,0);
/*!40000 ALTER TABLE `graphs_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_discovery`
--

DROP TABLE IF EXISTS `group_discovery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_discovery` (
  `groupid` bigint(20) unsigned NOT NULL,
  `parent_group_prototypeid` bigint(20) unsigned NOT NULL,
  `name` varchar(64) NOT NULL DEFAULT '',
  `lastcheck` int(11) NOT NULL DEFAULT '0',
  `ts_delete` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`groupid`),
  KEY `c_group_discovery_2` (`parent_group_prototypeid`),
  CONSTRAINT `c_group_discovery_1` FOREIGN KEY (`groupid`) REFERENCES `groups` (`groupid`) ON DELETE CASCADE,
  CONSTRAINT `c_group_discovery_2` FOREIGN KEY (`parent_group_prototypeid`) REFERENCES `group_prototype` (`group_prototypeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_discovery`
--

LOCK TABLES `group_discovery` WRITE;
/*!40000 ALTER TABLE `group_discovery` DISABLE KEYS */;
/*!40000 ALTER TABLE `group_discovery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_prototype`
--

DROP TABLE IF EXISTS `group_prototype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_prototype` (
  `group_prototypeid` bigint(20) unsigned NOT NULL,
  `hostid` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `groupid` bigint(20) unsigned DEFAULT NULL,
  `templateid` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`group_prototypeid`),
  KEY `group_prototype_1` (`hostid`),
  KEY `c_group_prototype_2` (`groupid`),
  KEY `c_group_prototype_3` (`templateid`),
  CONSTRAINT `c_group_prototype_1` FOREIGN KEY (`hostid`) REFERENCES `hosts` (`hostid`) ON DELETE CASCADE,
  CONSTRAINT `c_group_prototype_2` FOREIGN KEY (`groupid`) REFERENCES `groups` (`groupid`),
  CONSTRAINT `c_group_prototype_3` FOREIGN KEY (`templateid`) REFERENCES `group_prototype` (`group_prototypeid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_prototype`
--

LOCK TABLES `group_prototype` WRITE;
/*!40000 ALTER TABLE `group_prototype` DISABLE KEYS */;
INSERT INTO `group_prototype` VALUES (16,10176,'{#CLUSTER.NAME}',NULL,NULL),(17,10176,'{#DATACENTER.NAME}',NULL,NULL),(18,10176,'',7,NULL),(19,10177,'{#CLUSTER.NAME} (vm)',NULL,NULL),(20,10177,'{#DATACENTER.NAME} (vm)',NULL,NULL),(21,10177,'{#HV.NAME}',NULL,NULL),(22,10177,'',6,NULL);
/*!40000 ALTER TABLE `group_prototype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS `groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groups` (
  `groupid` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `internal` int(11) NOT NULL DEFAULT '0',
  `flags` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`groupid`),
  KEY `groups_1` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups`
--

LOCK TABLES `groups` WRITE;
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
INSERT INTO `groups` VALUES (1,'Templates',0,0),(2,'Linux servers',0,0),(4,'门户与监控',0,0),(5,'Discovered hosts',1,0),(6,'Virtual machines',0,0),(7,'Hypervisors',0,0),(8,'Templates/Modules',0,0),(9,'Templates/Network Devices',0,0),(10,'Templates/Operating Systems',0,0),(11,'Templates/Servers Hardware',0,0),(12,'Templates/Applications',0,0),(13,'Templates/Databases',0,0),(14,'Templates/Virtualization',0,0),(16,'数据分析',0,0),(18,'数据接入',0,0),(19,'数据管理',0,0),(20,'大数据存储与计算',0,0),(21,'数据展现',0,0),(22,'自定义模板组',0,0);
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `host_discovery`
--

DROP TABLE IF EXISTS `host_discovery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `host_discovery` (
  `hostid` bigint(20) unsigned NOT NULL,
  `parent_hostid` bigint(20) unsigned DEFAULT NULL,
  `parent_itemid` bigint(20) unsigned DEFAULT NULL,
  `host` varchar(64) NOT NULL DEFAULT '',
  `lastcheck` int(11) NOT NULL DEFAULT '0',
  `ts_delete` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`hostid`),
  KEY `c_host_discovery_2` (`parent_hostid`),
  KEY `c_host_discovery_3` (`parent_itemid`),
  CONSTRAINT `c_host_discovery_1` FOREIGN KEY (`hostid`) REFERENCES `hosts` (`hostid`) ON DELETE CASCADE,
  CONSTRAINT `c_host_discovery_2` FOREIGN KEY (`parent_hostid`) REFERENCES `hosts` (`hostid`),
  CONSTRAINT `c_host_discovery_3` FOREIGN KEY (`parent_itemid`) REFERENCES `items` (`itemid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `host_discovery`
--

LOCK TABLES `host_discovery` WRITE;
/*!40000 ALTER TABLE `host_discovery` DISABLE KEYS */;
INSERT INTO `host_discovery` VALUES (10176,NULL,26988,'',0,0),(10177,NULL,26989,'',0,0);
/*!40000 ALTER TABLE `host_discovery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `host_inventory`
--

DROP TABLE IF EXISTS `host_inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `host_inventory` (
  `hostid` bigint(20) unsigned NOT NULL,
  `inventory_mode` int(11) NOT NULL DEFAULT '0',
  `type` varchar(64) NOT NULL DEFAULT '',
  `type_full` varchar(64) NOT NULL DEFAULT '',
  `name` varchar(64) NOT NULL DEFAULT '',
  `alias` varchar(64) NOT NULL DEFAULT '',
  `os` varchar(64) NOT NULL DEFAULT '',
  `os_full` varchar(255) NOT NULL DEFAULT '',
  `os_short` varchar(64) NOT NULL DEFAULT '',
  `serialno_a` varchar(64) NOT NULL DEFAULT '',
  `serialno_b` varchar(64) NOT NULL DEFAULT '',
  `tag` varchar(64) NOT NULL DEFAULT '',
  `asset_tag` varchar(64) NOT NULL DEFAULT '',
  `macaddress_a` varchar(64) NOT NULL DEFAULT '',
  `macaddress_b` varchar(64) NOT NULL DEFAULT '',
  `hardware` varchar(255) NOT NULL DEFAULT '',
  `hardware_full` text NOT NULL,
  `software` varchar(255) NOT NULL DEFAULT '',
  `software_full` text NOT NULL,
  `software_app_a` varchar(64) NOT NULL DEFAULT '',
  `software_app_b` varchar(64) NOT NULL DEFAULT '',
  `software_app_c` varchar(64) NOT NULL DEFAULT '',
  `software_app_d` varchar(64) NOT NULL DEFAULT '',
  `software_app_e` varchar(64) NOT NULL DEFAULT '',
  `contact` text NOT NULL,
  `location` text NOT NULL,
  `location_lat` varchar(16) NOT NULL DEFAULT '',
  `location_lon` varchar(16) NOT NULL DEFAULT '',
  `notes` text NOT NULL,
  `chassis` varchar(64) NOT NULL DEFAULT '',
  `model` varchar(64) NOT NULL DEFAULT '',
  `hw_arch` varchar(32) NOT NULL DEFAULT '',
  `vendor` varchar(64) NOT NULL DEFAULT '',
  `contract_number` varchar(64) NOT NULL DEFAULT '',
  `installer_name` varchar(64) NOT NULL DEFAULT '',
  `deployment_status` varchar(64) NOT NULL DEFAULT '',
  `url_a` varchar(255) NOT NULL DEFAULT '',
  `url_b` varchar(255) NOT NULL DEFAULT '',
  `url_c` varchar(255) NOT NULL DEFAULT '',
  `host_networks` text NOT NULL,
  `host_netmask` varchar(39) NOT NULL DEFAULT '',
  `host_router` varchar(39) NOT NULL DEFAULT '',
  `oob_ip` varchar(39) NOT NULL DEFAULT '',
  `oob_netmask` varchar(39) NOT NULL DEFAULT '',
  `oob_router` varchar(39) NOT NULL DEFAULT '',
  `date_hw_purchase` varchar(64) NOT NULL DEFAULT '',
  `date_hw_install` varchar(64) NOT NULL DEFAULT '',
  `date_hw_expiry` varchar(64) NOT NULL DEFAULT '',
  `date_hw_decomm` varchar(64) NOT NULL DEFAULT '',
  `site_address_a` varchar(128) NOT NULL DEFAULT '',
  `site_address_b` varchar(128) NOT NULL DEFAULT '',
  `site_address_c` varchar(128) NOT NULL DEFAULT '',
  `site_city` varchar(128) NOT NULL DEFAULT '',
  `site_state` varchar(64) NOT NULL DEFAULT '',
  `site_country` varchar(64) NOT NULL DEFAULT '',
  `site_zip` varchar(64) NOT NULL DEFAULT '',
  `site_rack` varchar(128) NOT NULL DEFAULT '',
  `site_notes` text NOT NULL,
  `poc_1_name` varchar(128) NOT NULL DEFAULT '',
  `poc_1_email` varchar(128) NOT NULL DEFAULT '',
  `poc_1_phone_a` varchar(64) NOT NULL DEFAULT '',
  `poc_1_phone_b` varchar(64) NOT NULL DEFAULT '',
  `poc_1_cell` varchar(64) NOT NULL DEFAULT '',
  `poc_1_screen` varchar(64) NOT NULL DEFAULT '',
  `poc_1_notes` text NOT NULL,
  `poc_2_name` varchar(128) NOT NULL DEFAULT '',
  `poc_2_email` varchar(128) NOT NULL DEFAULT '',
  `poc_2_phone_a` varchar(64) NOT NULL DEFAULT '',
  `poc_2_phone_b` varchar(64) NOT NULL DEFAULT '',
  `poc_2_cell` varchar(64) NOT NULL DEFAULT '',
  `poc_2_screen` varchar(64) NOT NULL DEFAULT '',
  `poc_2_notes` text NOT NULL,
  PRIMARY KEY (`hostid`),
  CONSTRAINT `c_host_inventory_1` FOREIGN KEY (`hostid`) REFERENCES `hosts` (`hostid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `host_inventory`
--

LOCK TABLES `host_inventory` WRITE;
/*!40000 ALTER TABLE `host_inventory` DISABLE KEYS */;
/*!40000 ALTER TABLE `host_inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hostmacro`
--

DROP TABLE IF EXISTS `hostmacro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hostmacro` (
  `hostmacroid` bigint(20) unsigned NOT NULL,
  `hostid` bigint(20) unsigned NOT NULL,
  `macro` varchar(255) NOT NULL DEFAULT '',
  `value` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`hostmacroid`),
  UNIQUE KEY `hostmacro_1` (`hostid`,`macro`),
  CONSTRAINT `c_hostmacro_1` FOREIGN KEY (`hostid`) REFERENCES `hosts` (`hostid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hostmacro`
--

LOCK TABLES `hostmacro` WRITE;
/*!40000 ALTER TABLE `hostmacro` DISABLE KEYS */;
INSERT INTO `hostmacro` VALUES (351,10184,'{$CPU_UTIL_MAX}','90'),(352,10184,'{$MEMORY_UTIL_MAX}','90'),(353,10184,'{$TEMP_CRIT}','60'),(354,10184,'{$TEMP_WARN}','50'),(355,10184,'{$TEMP_CRIT_LOW}','5'),(356,10184,'{$STORAGE_UTIL_CRIT}','90'),(357,10184,'{$STORAGE_UTIL_WARN}','80'),(358,10185,'{$CPU_UTIL_MAX}','90'),(359,10185,'{$MEMORY_UTIL_MAX}','90'),(360,10185,'{$TEMP_CRIT}','60'),(361,10185,'{$TEMP_WARN}','50'),(362,10185,'{$TEMP_CRIT_LOW}','5'),(363,10185,'{$STORAGE_UTIL_CRIT}','90'),(364,10185,'{$STORAGE_UTIL_WARN}','80'),(365,10186,'{$ICMP_LOSS_WARN}','20'),(366,10186,'{$ICMP_RESPONSE_TIME_WARN}','0.15'),(367,10187,'{$IFCONTROL}','1'),(368,10187,'{$IF_UTIL_MAX}','95'),(369,10187,'{$IF_ERRORS_WARN}','2'),(370,10188,'{$IFCONTROL}','1'),(371,10188,'{$IF_UTIL_MAX}','95'),(372,10188,'{$IF_ERRORS_WARN}','2'),(373,10189,'{$IFCONTROL}','1'),(374,10189,'{$IF_UTIL_MAX}','90'),(375,10189,'{$IF_ERRORS_WARN}','2'),(376,10190,'{$IFCONTROL}','1'),(377,10190,'{$IF_UTIL_MAX}','90'),(378,10190,'{$IF_ERRORS_WARN}','2'),(382,10192,'{$IFCONTROL}','1'),(383,10192,'{$IF_UTIL_MAX}','90'),(384,10192,'{$IF_ERRORS_WARN}','2'),(385,10203,'{$SNMP_TIMEOUT}','3m'),(386,10204,'{$SNMP_TIMEOUT}','3m'),(393,10207,'{$TEMP_CRIT}','75'),(394,10207,'{$TEMP_WARN}','65'),(395,10207,'{$PSU_CRIT_STATUS}','4'),(396,10207,'{$FAN_CRIT_STATUS}','4'),(397,10207,'{$CPU_UTIL_MAX}','90'),(398,10207,'{$MEMORY_UTIL_MAX}','90'),(399,10207,'{$TEMP_CRIT_LOW}','5'),(400,10207,'{$STORAGE_UTIL_CRIT}','90'),(401,10207,'{$STORAGE_UTIL_WARN}','80'),(402,10208,'{$TEMP_CRIT}','75'),(403,10208,'{$TEMP_WARN}','65'),(404,10208,'{$HEALTH_CRIT_STATUS}','4'),(405,10208,'{$HEALTH_WARN_STATUS:\"offline\"}','2'),(406,10208,'{$HEALTH_WARN_STATUS:\"testing\"}','3'),(407,10208,'{$TEMP_WARN_STATUS}','5'),(408,10208,'{$PSU_CRIT_STATUS}','2'),(409,10208,'{$FAN_CRIT_STATUS}','2'),(410,10208,'{$PSU_OK_STATUS}','4'),(411,10208,'{$FAN_OK_STATUS}','4'),(412,10208,'{$CPU_UTIL_MAX}','90'),(413,10208,'{$MEMORY_UTIL_MAX}','90'),(414,10208,'{$TEMP_CRIT_LOW}','5'),(415,10208,'{$STORAGE_UTIL_CRIT}','90'),(416,10208,'{$STORAGE_UTIL_WARN}','80'),(417,10210,'{$TEMP_CRIT}','75'),(418,10210,'{$TEMP_WARN}','65'),(419,10210,'{$PSU_CRIT_STATUS}','3'),(420,10210,'{$FAN_CRIT_STATUS}','3'),(421,10210,'{$PSU_OK_STATUS}','2'),(422,10210,'{$FAN_OK_STATUS}','2'),(423,10210,'{$CPU_UTIL_MAX}','90'),(424,10210,'{$MEMORY_UTIL_MAX}','90'),(425,10210,'{$TEMP_CRIT_LOW}','5'),(426,10210,'{$STORAGE_UTIL_CRIT}','90'),(427,10210,'{$STORAGE_UTIL_WARN}','80'),(428,10211,'{$TEMP_CRIT}','75'),(429,10211,'{$TEMP_WARN}','65'),(430,10211,'{$PSU_CRIT_STATUS}','3'),(431,10211,'{$FAN_CRIT_STATUS}','3'),(432,10211,'{$PSU_OK_STATUS}','2'),(433,10211,'{$FAN_OK_STATUS}','2'),(434,10211,'{$CPU_UTIL_MAX}','90'),(435,10211,'{$MEMORY_UTIL_MAX}','90'),(436,10211,'{$TEMP_CRIT_LOW}','5'),(437,10211,'{$STORAGE_UTIL_CRIT}','90'),(438,10211,'{$STORAGE_UTIL_WARN}','80'),(439,10217,'{$TEMP_CRIT:\"CPU\"}','75'),(440,10217,'{$TEMP_WARN:\"CPU\"}','70'),(441,10217,'{$TEMP_WARN_STATUS}','2'),(442,10217,'{$TEMP_CRIT_STATUS}','3'),(443,10217,'{$TEMP_DISASTER_STATUS}','4'),(448,10218,'{$CPU_UTIL_MAX}','90'),(449,10218,'{$MEMORY_UTIL_MAX}','90'),(450,10218,'{$TEMP_CRIT}','60'),(451,10218,'{$TEMP_WARN}','50'),(452,10218,'{$TEMP_CRIT_LOW}','5'),(453,10218,'{$STORAGE_UTIL_CRIT}','90'),(454,10218,'{$STORAGE_UTIL_WARN}','80'),(462,10220,'{$CPU_UTIL_MAX}','90'),(463,10220,'{$MEMORY_UTIL_MAX}','90'),(464,10220,'{$TEMP_CRIT}','60'),(465,10220,'{$TEMP_WARN}','50'),(466,10220,'{$TEMP_CRIT_LOW}','5'),(467,10220,'{$STORAGE_UTIL_CRIT}','90'),(468,10220,'{$STORAGE_UTIL_WARN}','80'),(469,10221,'{$TEMP_CRIT}','65'),(470,10221,'{$TEMP_WARN}','55'),(471,10221,'{$PSU_CRIT_STATUS}','2'),(472,10221,'{$FAN_CRIT_STATUS}','2'),(473,10221,'{$PSU_OK_STATUS}','1'),(474,10221,'{$FAN_OK_STATUS}','1'),(475,10221,'{$CPU_UTIL_MAX}','90'),(476,10221,'{$MEMORY_UTIL_MAX}','90'),(477,10221,'{$TEMP_CRIT_LOW}','5'),(478,10221,'{$STORAGE_UTIL_CRIT}','90'),(479,10221,'{$STORAGE_UTIL_WARN}','80'),(480,10222,'{$TEMP_CRIT}','75'),(481,10222,'{$TEMP_WARN}','65'),(482,10222,'{$PSU_CRIT_STATUS}','5'),(483,10222,'{$FAN_CRIT_STATUS}','5'),(484,10222,'{$CPU_UTIL_MAX}','90'),(485,10222,'{$MEMORY_UTIL_MAX}','90'),(486,10222,'{$TEMP_CRIT_LOW}','5'),(487,10222,'{$STORAGE_UTIL_CRIT}','90'),(488,10222,'{$STORAGE_UTIL_WARN}','80'),(489,10223,'{$TEMP_CRIT}','75'),(490,10223,'{$TEMP_WARN}','65'),(491,10223,'{$PSU_CRIT_STATUS}','4'),(492,10223,'{$FAN_CRIT_STATUS}','2'),(493,10223,'{$CPU_UTIL_MAX}','90'),(494,10223,'{$MEMORY_UTIL_MAX}','90'),(495,10223,'{$TEMP_CRIT_LOW}','5'),(496,10223,'{$STORAGE_UTIL_CRIT}','90'),(497,10223,'{$STORAGE_UTIL_WARN}','80'),(498,10224,'{$TEMP_CRIT}','65'),(499,10224,'{$TEMP_WARN}','55'),(500,10224,'{$TEMP_CRIT_STATUS}','1'),(501,10224,'{$PSU_CRIT_STATUS}','3'),(502,10224,'{$FAN_CRIT_STATUS}','2'),(505,10224,'{$CPU_UTIL_MAX}','90'),(506,10224,'{$MEMORY_UTIL_MAX}','90'),(507,10224,'{$TEMP_CRIT_LOW}','5'),(508,10224,'{$STORAGE_UTIL_CRIT}','90'),(509,10224,'{$STORAGE_UTIL_WARN}','80'),(510,10227,'{$FAN_CRIT_STATUS:\"fanError\"}','41'),(511,10227,'{$FAN_CRIT_STATUS:\"hardwareFaulty\"}','91'),(512,10227,'{$PSU_CRIT_STATUS:\"psuError\"}','51'),(513,10227,'{$PSU_CRIT_STATUS:\"rpsError\"}','61'),(514,10227,'{$PSU_CRIT_STATUS:\"hardwareFaulty\"}','91'),(515,10227,'{$CPU_UTIL_MAX}','90'),(516,10227,'{$MEMORY_UTIL_MAX}','90'),(517,10227,'{$TEMP_CRIT}','60'),(518,10227,'{$TEMP_WARN}','50'),(519,10227,'{$TEMP_CRIT_LOW}','5'),(520,10227,'{$STORAGE_UTIL_CRIT}','90'),(521,10227,'{$STORAGE_UTIL_WARN}','80'),(533,10229,'{$FAN_CRIT_STATUS}','2'),(534,10229,'{$CPU_UTIL_MAX}','90'),(535,10229,'{$MEMORY_UTIL_MAX}','90'),(536,10229,'{$TEMP_CRIT}','60'),(537,10229,'{$TEMP_WARN}','50'),(538,10229,'{$TEMP_CRIT_LOW}','5'),(539,10229,'{$STORAGE_UTIL_CRIT}','90'),(540,10229,'{$STORAGE_UTIL_WARN}','80'),(541,10230,'{$TEMP_CRIT_STATUS}','3'),(542,10230,'{$TEMP_WARN_STATUS}','2'),(543,10230,'{$PSU_CRIT_STATUS}','3'),(544,10230,'{$FAN_CRIT_STATUS}','3'),(547,10230,'{$TEMP_CRIT}','60'),(548,10230,'{$TEMP_WARN}','50'),(549,10230,'{$TEMP_CRIT_LOW}','5'),(550,10230,'{$STORAGE_UTIL_CRIT}','90'),(551,10230,'{$STORAGE_UTIL_WARN}','80'),(552,10231,'{$TEMP_CRIT:\"Routing Engine\"}','80'),(553,10231,'{$TEMP_WARN:\"Routing Engine\"}','70'),(554,10231,'{$HEALTH_CRIT_STATUS}','3'),(555,10231,'{$FAN_CRIT_STATUS}','6'),(556,10231,'{$PSU_CRIT_STATUS}','6'),(557,10231,'{$CPU_UTIL_MAX}','90'),(558,10231,'{$MEMORY_UTIL_MAX}','90'),(559,10231,'{$TEMP_CRIT}','60'),(560,10231,'{$TEMP_WARN}','50'),(561,10231,'{$TEMP_CRIT_LOW}','5'),(562,10231,'{$STORAGE_UTIL_CRIT}','90'),(563,10231,'{$STORAGE_UTIL_WARN}','80'),(572,10233,'{$TEMP_CRIT:\"CPU\"}','75'),(573,10233,'{$TEMP_WARN:\"CPU\"}','70'),(574,10233,'{$CPU_UTIL_MAX}','90'),(575,10233,'{$MEMORY_UTIL_MAX}','90'),(576,10233,'{$TEMP_CRIT}','60'),(577,10233,'{$TEMP_WARN}','50'),(578,10233,'{$TEMP_CRIT_LOW}','5'),(579,10233,'{$STORAGE_UTIL_CRIT}','90'),(580,10233,'{$STORAGE_UTIL_WARN}','80'),(581,10234,'{$TEMP_WARN_STATUS}','2'),(582,10234,'{$TEMP_CRIT_STATUS}','3'),(583,10234,'{$PSU_CRIT_STATUS:\"failed\"}','2'),(584,10234,'{$FAN_CRIT_STATUS:\"failed\"}','2'),(585,10234,'{$CPU_UTIL_MAX}','90'),(586,10234,'{$MEMORY_UTIL_MAX}','90'),(587,10234,'{$TEMP_CRIT}','60'),(588,10234,'{$TEMP_WARN}','50'),(589,10234,'{$TEMP_CRIT_LOW}','5'),(590,10234,'{$STORAGE_UTIL_CRIT}','90'),(591,10234,'{$STORAGE_UTIL_WARN}','80'),(592,10235,'{$TEMP_CRIT}','75'),(593,10235,'{$TEMP_WARN}','65'),(594,10235,'{$PSU_CRIT_STATUS}','1'),(595,10235,'{$FAN_CRIT_STATUS}','1'),(596,10235,'{$CPU_UTIL_MAX}','90'),(597,10235,'{$MEMORY_UTIL_MAX}','90'),(598,10235,'{$TEMP_CRIT_LOW}','5'),(599,10235,'{$STORAGE_UTIL_CRIT}','90'),(600,10235,'{$STORAGE_UTIL_WARN}','80'),(601,10236,'{$CPU_UTIL_MAX}','90'),(602,10236,'{$MEMORY_UTIL_MAX}','90'),(603,10237,'{$CPU_UTIL_MAX}','90'),(604,10237,'{$MEMORY_UTIL_MAX}','90'),(605,10248,'{$CPU_UTIL_MAX}','90'),(606,10248,'{$MEMORY_UTIL_MAX}','90'),(607,10248,'{$TEMP_CRIT}','60'),(608,10248,'{$TEMP_WARN}','50'),(609,10248,'{$TEMP_CRIT_LOW}','5'),(610,10248,'{$STORAGE_UTIL_CRIT}','90'),(611,10248,'{$STORAGE_UTIL_WARN}','80'),(612,10249,'{$CPU_UTIL_MAX}','90'),(613,10249,'{$MEMORY_UTIL_MAX}','90'),(614,10249,'{$TEMP_CRIT}','60'),(615,10249,'{$TEMP_WARN}','50'),(616,10249,'{$TEMP_CRIT_LOW}','5'),(617,10249,'{$STORAGE_UTIL_CRIT}','90'),(618,10249,'{$STORAGE_UTIL_WARN}','80'),(619,10250,'{$FAN_CRIT_STATUS:\"bad\"}','2'),(620,10250,'{$PSU_CRIT_STATUS:\"bad\"}','2'),(621,10250,'{$TEMP_WARN_STATUS}','3'),(622,10250,'{$TEMP_CRIT_STATUS}','2'),(623,10250,'{$CPU_UTIL_MAX}','90'),(624,10250,'{$MEMORY_UTIL_MAX}','90'),(625,10250,'{$TEMP_CRIT}','60'),(626,10250,'{$TEMP_WARN}','50'),(627,10250,'{$TEMP_CRIT_LOW}','5'),(628,10250,'{$STORAGE_UTIL_CRIT}','90'),(629,10250,'{$STORAGE_UTIL_WARN}','80'),(630,10251,'{$PSU_CRIT_STATUS}','2'),(631,10251,'{$FAN_CRIT_STATUS}','3'),(632,10251,'{$TEMP_WARN_STATUS}','3'),(633,10251,'{$CPU_UTIL_MAX}','90'),(634,10251,'{$MEMORY_UTIL_MAX}','90'),(635,10251,'{$TEMP_CRIT}','60'),(636,10251,'{$TEMP_WARN}','50'),(637,10251,'{$TEMP_CRIT_LOW}','5'),(638,10251,'{$STORAGE_UTIL_CRIT}','90'),(639,10251,'{$STORAGE_UTIL_WARN}','80'),(640,10253,'{$CPU_UTIL_MAX}','90'),(641,10253,'{$MEMORY_UTIL_MAX}','90'),(642,10253,'{$TEMP_CRIT}','60'),(643,10253,'{$TEMP_WARN}','50'),(644,10253,'{$TEMP_CRIT_LOW}','5'),(645,10253,'{$STORAGE_UTIL_CRIT}','90'),(646,10253,'{$STORAGE_UTIL_WARN}','80'),(647,10230,'{$PSU_WARN_STATUS}','4'),(648,10217,'{$PSU_CRIT_STATUS:\"critical\"}','3'),(649,10217,'{$PSU_CRIT_STATUS:\"shutdown\"}','4'),(650,10217,'{$PSU_WARN_STATUS:\"warning\"}','2'),(651,10217,'{$PSU_WARN_STATUS:\"notFunctioning\"}','6'),(652,10217,'{$FAN_CRIT_STATUS:\"critical\"}','3'),(653,10217,'{$FAN_CRIT_STATUS:\"shutdown\"}','4'),(654,10217,'{$FAN_WARN_STATUS:\"warning\"}','2'),(655,10217,'{$FAN_WARN_STATUS:\"notFunctioning\"}','6'),(656,10250,'{$FAN_WARN_STATUS:\"warning\"}','3'),(657,10250,'{$PSU_WARN_STATUS:\"warning\"}','3');
/*!40000 ALTER TABLE `hostmacro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hosts`
--

DROP TABLE IF EXISTS `hosts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hosts` (
  `hostid` bigint(20) unsigned NOT NULL,
  `proxy_hostid` bigint(20) unsigned DEFAULT NULL,
  `host` varchar(128) NOT NULL DEFAULT '',
  `status` int(11) NOT NULL DEFAULT '0',
  `disable_until` int(11) NOT NULL DEFAULT '0',
  `error` varchar(2048) NOT NULL DEFAULT '',
  `available` int(11) NOT NULL DEFAULT '0',
  `errors_from` int(11) NOT NULL DEFAULT '0',
  `lastaccess` int(11) NOT NULL DEFAULT '0',
  `ipmi_authtype` int(11) NOT NULL DEFAULT '-1',
  `ipmi_privilege` int(11) NOT NULL DEFAULT '2',
  `ipmi_username` varchar(16) NOT NULL DEFAULT '',
  `ipmi_password` varchar(20) NOT NULL DEFAULT '',
  `ipmi_disable_until` int(11) NOT NULL DEFAULT '0',
  `ipmi_available` int(11) NOT NULL DEFAULT '0',
  `snmp_disable_until` int(11) NOT NULL DEFAULT '0',
  `snmp_available` int(11) NOT NULL DEFAULT '0',
  `maintenanceid` bigint(20) unsigned DEFAULT NULL,
  `maintenance_status` int(11) NOT NULL DEFAULT '0',
  `maintenance_type` int(11) NOT NULL DEFAULT '0',
  `maintenance_from` int(11) NOT NULL DEFAULT '0',
  `ipmi_errors_from` int(11) NOT NULL DEFAULT '0',
  `snmp_errors_from` int(11) NOT NULL DEFAULT '0',
  `ipmi_error` varchar(2048) NOT NULL DEFAULT '',
  `snmp_error` varchar(2048) NOT NULL DEFAULT '',
  `jmx_disable_until` int(11) NOT NULL DEFAULT '0',
  `jmx_available` int(11) NOT NULL DEFAULT '0',
  `jmx_errors_from` int(11) NOT NULL DEFAULT '0',
  `jmx_error` varchar(2048) NOT NULL DEFAULT '',
  `name` varchar(128) NOT NULL DEFAULT '',
  `flags` int(11) NOT NULL DEFAULT '0',
  `templateid` bigint(20) unsigned DEFAULT NULL,
  `description` text NOT NULL,
  `tls_connect` int(11) NOT NULL DEFAULT '1',
  `tls_accept` int(11) NOT NULL DEFAULT '1',
  `tls_issuer` varchar(1024) NOT NULL DEFAULT '',
  `tls_subject` varchar(1024) NOT NULL DEFAULT '',
  `tls_psk_identity` varchar(128) NOT NULL DEFAULT '',
  `tls_psk` varchar(512) NOT NULL DEFAULT '',
  PRIMARY KEY (`hostid`),
  KEY `hosts_1` (`host`),
  KEY `hosts_2` (`status`),
  KEY `hosts_3` (`proxy_hostid`),
  KEY `hosts_4` (`name`),
  KEY `hosts_5` (`maintenanceid`),
  KEY `c_hosts_3` (`templateid`),
  CONSTRAINT `c_hosts_1` FOREIGN KEY (`proxy_hostid`) REFERENCES `hosts` (`hostid`),
  CONSTRAINT `c_hosts_2` FOREIGN KEY (`maintenanceid`) REFERENCES `maintenances` (`maintenanceid`),
  CONSTRAINT `c_hosts_3` FOREIGN KEY (`templateid`) REFERENCES `hosts` (`hostid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hosts`
--

LOCK TABLES `hosts` WRITE;
/*!40000 ALTER TABLE `hosts` DISABLE KEYS */;
INSERT INTO `hosts` VALUES (10001,NULL,'Template OS Linux',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template OS Linux',0,NULL,'',1,1,'','','',''),(10047,NULL,'Template App Zabbix Server',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template App Zabbix Server',0,NULL,'',1,1,'','','',''),(10048,NULL,'Template App Zabbix Proxy',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template App Zabbix Proxy',0,NULL,'',1,1,'','','',''),(10050,NULL,'Template App Zabbix Agent',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template App Zabbix Agent',0,NULL,'',1,1,'','','',''),(10074,NULL,'Template OS OpenBSD',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template OS OpenBSD',0,NULL,'',1,1,'','','',''),(10075,NULL,'Template OS FreeBSD',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template OS FreeBSD',0,NULL,'',1,1,'','','',''),(10076,NULL,'Template OS AIX',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template OS AIX',0,NULL,'',1,1,'','','',''),(10077,NULL,'Template OS HP-UX',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template OS HP-UX',0,NULL,'',1,1,'','','',''),(10078,NULL,'Template OS Solaris',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template OS Solaris',0,NULL,'',1,1,'','','',''),(10079,NULL,'Template OS Mac OS X',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template OS Mac OS X',0,NULL,'',1,1,'','','',''),(10081,NULL,'Template OS Windows',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template OS Windows',0,NULL,'',1,1,'','','',''),(10084,NULL,'zabbix-servser',0,0,'',1,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','统一监控系统',0,NULL,'',1,1,'','','',''),(10093,NULL,'Template App FTP Service',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template App FTP Service',0,NULL,'',1,1,'','','',''),(10094,NULL,'Template App HTTP Service',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template App HTTP Service',0,NULL,'',1,1,'','','',''),(10095,NULL,'Template App HTTPS Service',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template App HTTPS Service',0,NULL,'',1,1,'','','',''),(10096,NULL,'Template App IMAP Service',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template App IMAP Service',0,NULL,'',1,1,'','','',''),(10097,NULL,'Template App LDAP Service',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template App LDAP Service',0,NULL,'',1,1,'','','',''),(10098,NULL,'Template App NNTP Service',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template App NNTP Service',0,NULL,'',1,1,'','','',''),(10099,NULL,'Template App NTP Service',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template App NTP Service',0,NULL,'',1,1,'','','',''),(10100,NULL,'Template App POP Service',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template App POP Service',0,NULL,'',1,1,'','','',''),(10101,NULL,'Template App SMTP Service',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template App SMTP Service',0,NULL,'',1,1,'','','',''),(10102,NULL,'Template App SSH Service',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template App SSH Service',0,NULL,'',1,1,'','','',''),(10103,NULL,'Template App Telnet Service',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template App Telnet Service',0,NULL,'',1,1,'','','',''),(10168,NULL,'Template App Apache Tomcat JMX',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template App Apache Tomcat JMX',0,NULL,'',1,1,'','','',''),(10169,NULL,'Template App Generic Java JMX',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template App Generic Java JMX',0,NULL,'',1,1,'','','',''),(10170,NULL,'Template DB MySQL',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template DB MySQL',0,NULL,'',1,1,'','','',''),(10171,NULL,'Template Server Intel SR1530 IPMI',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template Server Intel SR1530 IPMI',0,NULL,'',1,1,'','','',''),(10172,NULL,'Template Server Intel SR1630 IPMI',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template Server Intel SR1630 IPMI',0,NULL,'',1,1,'','','',''),(10173,NULL,'Template VM VMware',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template VM VMware',0,NULL,'',1,1,'','','',''),(10174,NULL,'Template VM VMware Guest',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template VM VMware Guest',0,NULL,'',1,1,'','','',''),(10175,NULL,'Template VM VMware Hypervisor',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template VM VMware Hypervisor',0,NULL,'',1,1,'','','',''),(10176,NULL,'{#HV.UUID}',0,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','{#HV.NAME}',2,NULL,'',1,1,'','','',''),(10177,NULL,'{#VM.UUID}',0,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','{#VM.NAME}',2,NULL,'',1,1,'','','',''),(10182,NULL,'Template Module EtherLike-MIB SNMPv1',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template Module EtherLike-MIB SNMPv1',0,NULL,'Template EtherLike-MIB (duplex control only) version: 0.14\r\nMIBs used:\r\nEtherLike-MIB',1,1,'','','',''),(10183,NULL,'Template Module EtherLike-MIB SNMPv2',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template Module EtherLike-MIB SNMPv2',0,NULL,'Template EtherLike-MIB (duplex control only) version: 0.14\r\nMIBs used:\r\nEtherLike-MIB',1,1,'','','',''),(10184,NULL,'Template Module HOST-RESOURCES-MIB SNMPv1',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template Module HOST-RESOURCES-MIB SNMPv1',0,NULL,'HOST-RESOURCES-MIB: CPU, Memory and Storage version: 0.14\r\nMIBs used:\r\nHOST-RESOURCES-MIB',1,1,'','','',''),(10185,NULL,'Template Module HOST-RESOURCES-MIB SNMPv2',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template Module HOST-RESOURCES-MIB SNMPv2',0,NULL,'HOST-RESOURCES-MIB: CPU, Memory and Storage version: 0.14\r\nMIBs used:\r\nHOST-RESOURCES-MIB',1,1,'','','',''),(10186,NULL,'Template Module ICMP Ping',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template Module ICMP Ping',0,NULL,'Template Module ICMP Ping version: 0.14',1,1,'','','',''),(10187,NULL,'Template Module Interfaces Simple SNMPv1',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template Module Interfaces Simple SNMPv1',0,NULL,'Template Interfaces Simple (no ifXTable) version: 0.14\r\nMIBs used:\r\nIF-MIB',1,1,'','','',''),(10188,NULL,'Template Module Interfaces Simple SNMPv2',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template Module Interfaces Simple SNMPv2',0,NULL,'Template Interfaces Simple (no ifXTable) version: 0.14\r\nMIBs used:\r\nIF-MIB',1,1,'','','',''),(10189,NULL,'Template Module Interfaces SNMPv1',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template Module Interfaces SNMPv1',0,NULL,'Template Interfaces version: 0.14\r\nMIBs used:\r\nIF-MIB',1,1,'','','',''),(10190,NULL,'Template Module Interfaces SNMPv2',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template Module Interfaces SNMPv2',0,NULL,'Template Interfaces version: 0.14\r\nMIBs used:\r\nIF-MIB',1,1,'','','',''),(10192,NULL,'Template Module Interfaces Windows SNMPv2',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template Module Interfaces Windows SNMPv2',0,NULL,'Template Module Interfaces Windows version: 0.14\r\nOverview: Special version of interfaces template that is required for Windows OS. Since MS doesn\'t support 64 bit counters but supports ifAlias.\r\n\r\nMIBs used:\r\nIF-MIB',1,1,'','','',''),(10203,NULL,'Template Module Generic SNMPv1',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template Module Generic SNMPv1',0,NULL,'Template Module Generic version: 0.14\r\nMIBs used:\r\nSNMPv2-MIB',1,1,'','','',''),(10204,NULL,'Template Module Generic SNMPv2',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template Module Generic SNMPv2',0,NULL,'Template Module Generic version: 0.14\r\nMIBs used:\r\nSNMPv2-MIB',1,1,'','','',''),(10207,NULL,'Template Net Alcatel Timetra TiMOS SNMPv2',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template Net Alcatel Timetra TiMOS SNMPv2',0,NULL,'Template Net Alcatel Timetra TiMOS version: 0.14\r\nMIBs used:\r\nTIMETRA-SYSTEM-MIB\r\nSNMPv2-MIB\r\nTIMETRA-CHASSIS-MIB',1,1,'','','',''),(10208,NULL,'Template Net Brocade FC SNMPv2',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template Net Brocade FC SNMPv2',0,NULL,'Template Net Brocade FC version: 0.14\r\nOverview: https://community.brocade.com/dtscp75322/attachments/dtscp75322/fibre/25235/1/FOS_MIB_Reference_v740.pdf\r\n\r\nMIBs used:\r\nSW-MIB\r\nKnown Issues:\r\ndescription : no IF-MIB::ifAlias is available\r\nversion : v6.3.1c, v7.0.0c,  v7.4.1c\r\ndevice : all',1,1,'','','',''),(10209,NULL,'Template Module Brocade_Foundry Performance SNMPv2',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template Module Brocade_Foundry Performance SNMPv2',0,NULL,'Template Module Brocade_Foundry Performance version: 0.14\r\nMIBs used:\r\nFOUNDRY-SN-AGENT-MIB',1,1,'','','',''),(10210,NULL,'Template Net Brocade_Foundry Nonstackable SNMPv2',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template Net Brocade_Foundry Nonstackable SNMPv2',0,NULL,'Template Net Brocade_Foundry Nonstackable version: 0.14\r\nOverview: For devices(old Foundry devices, MLXe and so on) that doesn\'t support Stackable SNMP Tables: snChasFan2Table, snChasPwrSupply2Table,snAgentTemp2Table -\r\nFOUNDRY-SN-AGENT-MIB::snChasFanTable, snChasPwrSupplyTable,snAgentTempTable are used instead.\r\nFor example:\r\nThe objects in table snChasPwrSupply2Table is not supported on the NetIron and the FastIron SX devices.\r\nsnChasFan2Table is not supported on  on the NetIron devices.\r\nsnAgentTemp2Table is not supported on old versions of MLXe\r\n\r\nMIBs used:\r\nFOUNDRY-SN-AGENT-MIB',1,1,'','','',''),(10211,NULL,'Template Net Brocade_Foundry Stackable SNMPv2',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template Net Brocade_Foundry Stackable SNMPv2',0,NULL,'Template Brocade_Foundry Stackable version: 0.14\r\nOverview: For devices(most of the IronWare Brocade devices) that support Stackable SNMP Tables in FOUNDRY-SN-AGENT-MIB: snChasFan2Table, snChasPwrSupply2Table,snAgentTemp2Table - so objects from all Stack members are provided.\r\n\r\nMIBs used:\r\nFOUNDRY-SN-AGENT-MIB\r\nFOUNDRY-SN-STACKING-MIB\r\nKnown Issues:\r\ndescription : Correct fan(returns fan status as \'other(1)\' and temperature (returns 0) for the non-master Switches are not available in SNMP\r\nversion : Version 08.0.40b and above\r\ndevice : ICX 7750 in stack',1,1,'','','',''),(10212,NULL,'Template Module Cisco CISCO-MEMORY-POOL-MIB SNMPv2',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template Module Cisco CISCO-MEMORY-POOL-MIB SNMPv2',0,NULL,'Template Cisco CISCO-MEMORY-POOL-MIB version: 0.14\r\nMIBs used:\r\nCISCO-MEMORY-POOL-MIB',1,1,'','','',''),(10213,NULL,'Template Module Cisco CISCO-PROCESS-MIB SNMPv2',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template Module Cisco CISCO-PROCESS-MIB SNMPv2',0,NULL,'Template Cisco CISCO-PROCESS-MIB version: 0.14\r\nMIBs used:\r\nCISCO-PROCESS-MIB',1,1,'','','',''),(10215,NULL,'Template Module Cisco OLD-CISCO-CPU-MIB SNMPv2',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template Module Cisco OLD-CISCO-CPU-MIB SNMPv2',0,NULL,'Template Cisco OLD-CISCO-CPU-MIB version: 0.14\r\nMIBs used:\r\nOLD-CISCO-CPU-MIB',1,1,'','','',''),(10216,NULL,'Template Module Cisco Inventory SNMPv2',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template Module Cisco Inventory SNMPv2',0,NULL,'Template Cisco Inventory version: 0.14\r\nMIBs used:\r\nENTITY-MIB\r\nSNMPv2-MIB',1,1,'','','',''),(10217,NULL,'Template Module Cisco CISCO-ENVMON-MIB SNMPv2',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template Module Cisco CISCO-ENVMON-MIB SNMPv2',0,NULL,'Template Cisco CISCO-ENVMON-MIB version: 0.14\r\nMIBs used:\r\nCISCO-ENVMON-MIB',1,1,'','','',''),(10218,NULL,'Template Net Cisco IOS SNMPv2',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template Net Cisco IOS SNMPv2',0,NULL,'Template Cisco IOS Software releases 12.2(3.5) or later version: 0.14\r\nKnown Issues:\r\ndescription : no if(in|out)(Errors|Discards) are available for vlan ifType\r\nversion : IOS for example: 12.1(22)EA11, 15.4(3)M2\r\ndevice : C2911, C7600',1,1,'','','',''),(10220,NULL,'Template Net Cisco IOS prior to 12.0_3_T SNMPv2',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template Net Cisco IOS prior to 12.0_3_T SNMPv2',0,NULL,'Cisco IOS Software releases prior to 12.0(3)T version: 0.14',1,1,'','','',''),(10221,NULL,'Template Net Dell Force S-Series SNMPv2',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template Net Dell Force S-Series SNMPv2',0,NULL,'Template Dell Force S-Series version: 0.14\r\nMIBs used:\r\nF10-S-SERIES-CHASSIS-MIB',1,1,'','','',''),(10222,NULL,'Template Net D-Link DES 7200 SNMPv2',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template Net D-Link DES 7200 SNMPv2',0,NULL,'Template D-Link DES 7200 version: 0.14\r\nMIBs used:\r\nMY-PROCESS-MIB\r\nMY-MEMORY-MIB\r\nMY-SYSTEM-MIB\r\nSNMPv2-MIB\r\nENTITY-MIB',1,1,'','','',''),(10223,NULL,'Template Net D-Link DES_DGS Switch SNMPv2',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template Net D-Link DES_DGS Switch SNMPv2',0,NULL,'Template D-Link DES_DGS Switch version: 0.14\r\nMIBs used:\r\nDLINK-AGENT-MIB\r\nEQUIPMENT-MIB\r\nSNMPv2-MIB\r\nENTITY-MIB\r\nKnown Issues:\r\ndescription : D-Link reports missing PSU as fail(4)\r\nversion : Firmware: 1.73R008,hardware revision:B1\r\ndevice : DGS-3420-26SC Gigabit Ethernet Switch',1,1,'','','',''),(10224,NULL,'Template Net Extreme EXOS SNMPv2',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template Net Extreme EXOS SNMPv2',0,NULL,'Template Extreme EXOS version: 0.14\r\nMIBs used:\r\nEXTREME-SOFTWARE-MONITOR-MIB\r\nEXTREME-SYSTEM-MIB\r\nENTITY-MIB',1,1,'','','',''),(10225,NULL,'Template Net Network Generic Device SNMPv1',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template Net Network Generic Device SNMPv1',0,NULL,'Template Net Network Generic Device version: 0.14\r\nOverview: Use this template if you can\'t find the template for specific vendor or device family.',1,1,'','','',''),(10226,NULL,'Template Net Network Generic Device SNMPv2',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template Net Network Generic Device SNMPv2',0,NULL,'Template Net Network Generic Device version: 0.14\r\nOverview: Use this template if you can\'t find the template for specific vendor or device family.',1,1,'','','',''),(10227,NULL,'Template Net HP Comware HH3C SNMPv2',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template Net HP Comware HH3C SNMPv2',0,NULL,'Template Net HP Comware (HH3C) version: 0.14\r\nOverview: http://certifiedgeek.weebly.com/blog/hp-comware-snmp-mib-for-cpu-memory-and-temperature\r\nhttp://www.h3c.com.hk/products___solutions/technology/system_management/configuration_example/200912/656451_57_0.htm\r\n\r\nMIBs used:\r\nHH3C-ENTITY-EXT-MIB\r\nENTITY-MIB\r\nKnown Issues:\r\ndescription : No temperature sensors. All entities of them return 0 for HH3C-ENTITY-EXT-MIB::hh3cEntityExtTemperature\r\nversion : 1910-48 Switch Software Version 5.20.99, Release 1116 Copyright(c)2010-2016 Hewlett Packard Enterprise Development LP\r\ndevice : HP 1910-48',1,1,'','','',''),(10229,NULL,'Template Net Huawei VRP SNMPv2',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template Net Huawei VRP SNMPv2',0,NULL,'Template Net Huawei VRP version: 0.14\r\nOverview: Reference: https://www.slideshare.net/Huanetwork/huawei-s5700-naming-conventions-and-port-numbering-conventions\r\nReference: http://support.huawei.com/enterprise/KnowledgebaseReadAction.action?contentId=KB1000090234\r\n\r\nMIBs used:\r\nHUAWEI-ENTITY-EXTENT-MIB\r\nENTITY-MIB',1,1,'','','',''),(10230,NULL,'Template Net Intel_Qlogic Infiniband SNMPv2',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template Net Intel_Qlogic Infiniband SNMPv2',0,NULL,'Template Net Intel_Qlogic Infiniband version: 0.14\r\nMIBs used:\r\nICS-CHASSIS-MIB',1,1,'','','',''),(10231,NULL,'Template Net Juniper SNMPv2',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template Net Juniper SNMPv2',0,NULL,'Template Net Juniper version: 0.14\r\nMIBs used:\r\nJUNIPER-MIB\r\nJUNIPER-ALARM-MIB\r\nSNMPv2-MIB',1,1,'','','',''),(10233,NULL,'Template Net Mikrotik SNMPv2',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template Net Mikrotik SNMPv2',0,NULL,'Template Net Mikrotik version: 0.14\r\nMIBs used:\r\nHOST-RESOURCES-MIB\r\nMIKROTIK-MIB\r\nKnown Issues:\r\ndescription : Doesn\'t have ifHighSpeed filled. fixed in more recent versions\r\nversion : RotuerOS 6.28 or lower\r\ndevice : description : Doesn\'t have any temperature sensors\r\nversion : RotuerOS 6.38.5\r\ndevice : Mikrotik 941-2nD, Mikrotik 951G-2HnD',1,1,'','','',''),(10234,NULL,'Template Net Netgear Fastpath SNMPv2',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template Net Netgear Fastpath SNMPv2',0,NULL,'Template Net Netgear Fastpath version: 0.14\r\nOverview: https://kb.netgear.com/24352/MIBs-for-Smart-switches\r\n\r\nMIBs used:\r\nFASTPATH-SWITCHING-MIB\r\nFASTPATH-BOXSERVICES-PRIVATE-MIB',1,1,'','','',''),(10235,NULL,'Template Net QTech QSW SNMPv2',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template Net QTech QSW SNMPv2',0,NULL,'Template Net QTech QSW version: 0.14\r\nMIBs used:\r\nQTECH-MIB\r\nENTITY-MIB',1,1,'','','',''),(10236,NULL,'Template Net TP-LINK SNMPv2',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template Net TP-LINK SNMPv2',0,NULL,'Template Net TP-LINK JetStream version: 0.14\r\nOverview: Link to MIBs: http://www.tp-linkru.com/download/T2600G-28TS.html#MIBs_Files\r\nSample device overview page: http://www.tp-linkru.com/products/details/cat-39_T2600G-28TS.html#overview\r\nemulation page(web): http://www.tp-linkru.com/resources/simulator/T2600G-28TS(UN)_1.0/Index.htm\r\n\r\nMIBs used:\r\nTPLINK-SYSMONITOR-MIB\r\nTPLINK-SYSINFO-MIB\r\nKnown Issues:\r\ndescription : default sysLocation, sysName and sysContact is not filled with proper data. Real hostname and location can be found only in private branch(TPLINK-SYSINFO-MIB). Please check whether this problem exists in the latest firware: http://www.tp-linkru.com/download/T2600G-28TS.html#Firmware\r\nversion : 2.0.0 Build 20170628 Rel.55184(Beta)\r\ndevice : T2600G-28TS 2.0description : The Serial number of the product(tpSysInfoSerialNum) is missing in HW versions prior to V2_170323\r\nversion : prior to version V2_170323\r\ndevice : T2600G-28TS 2.0',1,1,'','','',''),(10237,NULL,'Template Net Ubiquiti AirOS SNMPv1',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template Net Ubiquiti AirOS SNMPv1',0,NULL,'Template Net Ubiquiti AirOS version: 0.14\r\nMIBs used:\r\nFROGFOOT-RESOURCES-MIB\r\nIEEE802dot11-MIB\r\nKnown Issues:\r\ndescription : UBNT unifi reports speed: like IF-MIB::ifSpeed.1 = Gauge32: 4294967295 for all interfaces\r\nversion : Firmware: BZ.ar7240.v3.7.51.6230.170322.1513\r\ndevice : UBNT UAP-LRdescription : UBNT AirMax(NanoStation, NanoBridge etc) reports ifSpeed: as 0 for VLAN and wireless(ath0) interfaces\r\nversion : Firmware: XW.ar934x.v5.6-beta4.22359.140521.1836\r\ndevice : NanoStation M5description : UBNT AirMax(NanoStation, NanoBridge etc) reports always return ifType: as ethernet(6) even for wifi,vlans and other types\r\nversion : Firmware: XW.ar934x.v5.6-beta4.22359.140521.1836\r\ndevice : NanoStation M5description : ifXTable is not provided in IF-MIB. So Interfaces Simple Template is used instead\r\nversion : all above\r\ndevice : NanoStation, UAP-LR',1,1,'','','',''),(10248,NULL,'Template OS Linux SNMPv2',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template OS Linux SNMPv2',0,NULL,'Template OS Linux version: 0.14',1,1,'','','',''),(10249,NULL,'Template OS Windows SNMPv2',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template OS Windows SNMPv2',0,NULL,'Template OS Windows version: 0.14\r\nKnown Issues:\r\ndescription : Doesn\'t support In/Out 64 bit counters even thoug1h IfxTable is present:\r\nCurrently, Windows gets it’s interface status from MIB-2. Since these 64bit SNMP counters (ifHCInOctets, ifHCOutOctets, etc.) are defined as an extension to IF-MIB, Microsoft has not implemented it.\r\nhttps://social.technet.microsoft.com/Forums/windowsserver/en-US/07b62ff0-94f6-40ca-a99d-d129c1b33d70/windows-2008-r2-snmp-64bit-counters-support?forum=winservergen\r\nversion : Win2008, Win2012R2\r\ndevice : description : Doesn\'t support ifXTable at all\r\nversion : WindowsXP\r\ndevice : description : EtherLike MIB is not supported\r\nversion : *\r\ndevice : *',1,1,'','','',''),(10250,NULL,'Template Net HP Enterprise Switch SNMPv2',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template Net HP Enterprise Switch SNMPv2',0,NULL,'Template Net HP Enterprise Switch version: 0.14\r\nMIBs used:\r\nSTATISTICS-MIB\r\nNETSWITCH-MIB\r\nENTITY-SENSORS-MIB\r\nHP-ICF-CHASSIS\r\nENTITY-MIB\r\nSEMI-MIB',1,1,'','','',''),(10251,NULL,'Template Net Mellanox SNMPv2',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template Net Mellanox SNMPv2',0,NULL,'Template Net Mellanox version: 0.14\r\nMIBs used:\r\nENTITY-SENSORS-MIB\r\nENTITY-STATE-MIB\r\nENTITY-MIB',1,1,'','','',''),(10252,NULL,'Template Module Cisco CISCO-PROCESS-MIB IOS versions 12.0_3_T-12.2_3.5 SNMPv2',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template Module Cisco CISCO-PROCESS-MIB IOS versions 12.0_3_T-12.2_3.5 SNMPv2',0,NULL,'Template Module Cisco CISCO-PROCESS-MIB IOS versions 12.0_3_T-12.2_3.5 version: 0.14\r\nMIBs used:\r\nCISCO-PROCESS-MIB',1,1,'','','',''),(10253,NULL,'Template Net Cisco IOS versions 12.0_3_T-12.2_3.5 SNMPv2',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','Template Net Cisco IOS versions 12.0_3_T-12.2_3.5 SNMPv2',0,NULL,'Cisco IOS Software releases later to 12.0(3)T and prior to 12.2(3.5) version: 0.14',1,1,'','','',''),(10254,NULL,'portal',0,0,'',1,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','领导驾驶舱',0,NULL,'',1,1,'','','',''),(10257,NULL,'items-user',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','门户与监控的模板',0,NULL,'',1,1,'','','',''),(10258,NULL,'data-quality',0,0,'',1,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','数据质量管理系统',0,NULL,'',1,1,'','','',''),(10259,NULL,'metedata',0,0,'',1,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','元数据管理系统',0,NULL,'',1,1,'','','',''),(10260,NULL,'data-standard',0,0,'',1,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','数据标准管理系统',0,NULL,'',1,1,'','','',''),(10261,NULL,'measure-management',0,0,'',1,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','指标管理系统',0,NULL,'',1,1,'','','',''),(10262,NULL,'batch-data',0,0,'',1,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','批量数据处理系统',0,NULL,'',1,1,'','','',''),(10263,NULL,'real-time-data',0,0,'',1,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','实时数据处理监控系统',0,NULL,'',1,1,'','','',''),(10264,NULL,'data-catalog',0,0,'',1,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','数据编目管理系统',0,NULL,'',1,1,'','','',''),(10265,NULL,'bigdata-management',0,0,'',1,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','大数据管理系统',0,NULL,'',1,1,'','','',''),(10266,NULL,'bigdata-security',0,0,'',1,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','大数据安全管理系统',0,NULL,'',1,1,'','','',''),(10267,NULL,'bigdata-user',0,0,'',1,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','大数据使用系统',0,NULL,'',1,1,'','','',''),(10268,NULL,'distributed-excavate',0,0,'',1,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','分布式挖掘系统',0,NULL,'',1,1,'','','',''),(10269,NULL,'High-dimensional-model',0,0,'',1,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','高维模型分析系统',0,NULL,'',1,1,'','','',''),(10270,NULL,'bigdata-retrieval',0,0,'',1,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','大数据检索系统2号',0,NULL,'',1,1,'','','',''),(10271,NULL,'batch-log',0,0,'',1,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','批量日志分析系统',0,NULL,'',1,1,'','','',''),(10272,NULL,'template-custom-group',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','自定义模板组',0,NULL,'',1,1,'','','',''),(10273,NULL,'web-spider',0,0,'',1,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','深网爬虫系统',0,NULL,'',1,1,'','','',''),(10274,NULL,'collect-package',0,0,'',1,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','众包采集系统',0,NULL,'',1,1,'','','',''),(10275,NULL,'comprehensive-collect',0,0,'',1,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','综合采集系统',0,NULL,'',1,1,'','','',''),(10276,NULL,'big-manage-template',3,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','大数据管理系统模板',0,NULL,'',1,1,'','','',''),(10277,NULL,'bigdata-retrieval1',0,0,'',1,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','大数据检索系统1号',0,NULL,'',1,1,'','','',''),(10278,NULL,'semantic-analysis',0,0,'',1,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','语义分析系统',0,NULL,'',1,1,'','','',''),(10279,NULL,'Image-recognition',0,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','影像识别系统',0,NULL,'',1,1,'','','',''),(10280,NULL,'data-visualization',0,0,'',1,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','数据可视化系统',0,NULL,'',1,1,'','','',''),(10281,NULL,'3D-GIS-Service',0,0,'',0,0,0,-1,2,'','',0,0,0,0,NULL,0,0,0,0,0,'','',0,0,0,'','3D GIS服务系统',0,NULL,'',1,1,'','','','');
/*!40000 ALTER TABLE `hosts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hosts_groups`
--

DROP TABLE IF EXISTS `hosts_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hosts_groups` (
  `hostgroupid` bigint(20) unsigned NOT NULL,
  `hostid` bigint(20) unsigned NOT NULL,
  `groupid` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`hostgroupid`),
  UNIQUE KEY `hosts_groups_1` (`hostid`,`groupid`),
  KEY `hosts_groups_2` (`groupid`),
  CONSTRAINT `c_hosts_groups_1` FOREIGN KEY (`hostid`) REFERENCES `hosts` (`hostid`) ON DELETE CASCADE,
  CONSTRAINT `c_hosts_groups_2` FOREIGN KEY (`groupid`) REFERENCES `groups` (`groupid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hosts_groups`
--

LOCK TABLES `hosts_groups` WRITE;
/*!40000 ALTER TABLE `hosts_groups` DISABLE KEYS */;
INSERT INTO `hosts_groups` VALUES (194,10001,10),(189,10047,12),(188,10048,12),(187,10050,8),(196,10074,10),(192,10075,10),(191,10076,10),(193,10077,10),(197,10078,10),(195,10079,10),(198,10081,10),(92,10084,4),(175,10093,8),(178,10094,8),(177,10095,8),(179,10096,8),(180,10097,8),(181,10098,8),(182,10099,8),(183,10100,8),(184,10101,8),(185,10102,8),(186,10103,8),(174,10168,12),(176,10169,12),(190,10170,13),(199,10171,11),(200,10172,11),(201,10173,14),(202,10174,14),(203,10175,14),(208,10182,8),(209,10183,8),(210,10184,8),(211,10185,8),(212,10186,8),(213,10187,8),(214,10188,8),(215,10189,8),(216,10190,8),(218,10192,8),(229,10203,8),(230,10204,8),(233,10207,9),(234,10208,9),(235,10209,8),(236,10210,9),(237,10211,9),(238,10212,8),(239,10213,8),(241,10215,8),(242,10216,8),(243,10217,8),(244,10218,9),(246,10220,9),(247,10221,9),(248,10222,9),(249,10223,9),(250,10224,9),(251,10225,9),(252,10226,9),(253,10227,9),(255,10229,9),(256,10230,9),(257,10231,9),(259,10233,9),(260,10234,9),(261,10235,9),(262,10236,9),(263,10237,9),(274,10248,10),(275,10249,10),(276,10250,9),(277,10251,9),(278,10252,8),(279,10253,9),(280,10254,4),(310,10257,20),(289,10258,19),(290,10259,19),(291,10260,19),(292,10261,19),(293,10262,19),(294,10263,19),(295,10264,19),(296,10265,20),(297,10266,20),(298,10267,20),(299,10268,16),(300,10269,16),(301,10270,16),(302,10271,16),(303,10272,4),(304,10272,22),(305,10273,18),(306,10274,18),(307,10275,18),(311,10276,20),(312,10277,16),(313,10278,16),(314,10279,16),(315,10280,21),(318,10281,21);
/*!40000 ALTER TABLE `hosts_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hosts_templates`
--

DROP TABLE IF EXISTS `hosts_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hosts_templates` (
  `hosttemplateid` bigint(20) unsigned NOT NULL,
  `hostid` bigint(20) unsigned NOT NULL,
  `templateid` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`hosttemplateid`),
  UNIQUE KEY `hosts_templates_1` (`hostid`,`templateid`),
  KEY `hosts_templates_2` (`templateid`),
  CONSTRAINT `c_hosts_templates_1` FOREIGN KEY (`hostid`) REFERENCES `hosts` (`hostid`) ON DELETE CASCADE,
  CONSTRAINT `c_hosts_templates_2` FOREIGN KEY (`templateid`) REFERENCES `hosts` (`hostid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hosts_templates`
--

LOCK TABLES `hosts_templates` WRITE;
/*!40000 ALTER TABLE `hosts_templates` DISABLE KEYS */;
INSERT INTO `hosts_templates` VALUES (4,10001,10050),(31,10074,10050),(32,10075,10050),(33,10076,10050),(34,10077,10050),(35,10078,10050),(36,10079,10050),(37,10081,10050),(39,10084,10001),(38,10084,10047),(131,10176,10175),(132,10177,10174),(133,10203,10186),(134,10204,10186),(136,10207,10183),(135,10207,10190),(137,10207,10204),(138,10208,10190),(139,10208,10204),(141,10210,10190),(142,10210,10204),(140,10210,10209),(144,10211,10190),(145,10211,10204),(143,10211,10209),(151,10218,10183),(150,10218,10190),(152,10218,10204),(149,10218,10212),(148,10218,10213),(146,10218,10216),(147,10218,10217),(163,10220,10204),(161,10220,10212),(162,10220,10215),(159,10220,10216),(160,10220,10217),(165,10221,10183),(164,10221,10190),(166,10221,10204),(167,10222,10190),(168,10222,10204),(170,10223,10183),(169,10223,10190),(171,10223,10204),(173,10224,10183),(172,10224,10190),(174,10224,10204),(176,10225,10182),(175,10225,10187),(177,10225,10203),(179,10226,10183),(178,10226,10188),(180,10226,10204),(182,10227,10183),(181,10227,10190),(183,10227,10204),(189,10229,10183),(188,10229,10190),(190,10229,10204),(191,10230,10190),(192,10230,10204),(194,10231,10183),(193,10231,10190),(195,10231,10204),(200,10233,10190),(201,10233,10204),(202,10234,10190),(203,10234,10204),(205,10235,10183),(204,10235,10190),(206,10235,10204),(207,10236,10188),(208,10236,10204),(209,10237,10187),(210,10237,10203),(213,10248,10183),(211,10248,10185),(212,10248,10190),(214,10248,10204),(215,10249,10185),(216,10249,10192),(217,10249,10204),(219,10250,10183),(218,10250,10190),(220,10250,10204),(221,10251,10185),(222,10251,10190),(223,10251,10204),(228,10253,10190),(229,10253,10204),(226,10253,10212),(224,10253,10216),(225,10253,10217),(227,10253,10252),(238,10254,10170),(245,10265,10276);
/*!40000 ALTER TABLE `hosts_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `housekeeper`
--

DROP TABLE IF EXISTS `housekeeper`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `housekeeper` (
  `housekeeperid` bigint(20) unsigned NOT NULL,
  `tablename` varchar(64) NOT NULL DEFAULT '',
  `field` varchar(64) NOT NULL DEFAULT '',
  `value` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`housekeeperid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `housekeeper`
--

LOCK TABLES `housekeeper` WRITE;
/*!40000 ALTER TABLE `housekeeper` DISABLE KEYS */;
/*!40000 ALTER TABLE `housekeeper` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `httpstep`
--

DROP TABLE IF EXISTS `httpstep`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `httpstep` (
  `httpstepid` bigint(20) unsigned NOT NULL,
  `httptestid` bigint(20) unsigned NOT NULL,
  `name` varchar(64) NOT NULL DEFAULT '',
  `no` int(11) NOT NULL DEFAULT '0',
  `url` varchar(2048) NOT NULL DEFAULT '',
  `timeout` varchar(255) NOT NULL DEFAULT '15s',
  `posts` text NOT NULL,
  `required` varchar(255) NOT NULL DEFAULT '',
  `status_codes` varchar(255) NOT NULL DEFAULT '',
  `follow_redirects` int(11) NOT NULL DEFAULT '1',
  `retrieve_mode` int(11) NOT NULL DEFAULT '0',
  `post_type` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`httpstepid`),
  KEY `httpstep_1` (`httptestid`),
  CONSTRAINT `c_httpstep_1` FOREIGN KEY (`httptestid`) REFERENCES `httptest` (`httptestid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `httpstep`
--

LOCK TABLES `httpstep` WRITE;
/*!40000 ALTER TABLE `httpstep` DISABLE KEYS */;
/*!40000 ALTER TABLE `httpstep` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `httpstep_field`
--

DROP TABLE IF EXISTS `httpstep_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `httpstep_field` (
  `httpstep_fieldid` bigint(20) unsigned NOT NULL,
  `httpstepid` bigint(20) unsigned NOT NULL,
  `type` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  PRIMARY KEY (`httpstep_fieldid`),
  KEY `httpstep_field_1` (`httpstepid`),
  CONSTRAINT `c_httpstep_field_1` FOREIGN KEY (`httpstepid`) REFERENCES `httpstep` (`httpstepid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `httpstep_field`
--

LOCK TABLES `httpstep_field` WRITE;
/*!40000 ALTER TABLE `httpstep_field` DISABLE KEYS */;
/*!40000 ALTER TABLE `httpstep_field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `httpstepitem`
--

DROP TABLE IF EXISTS `httpstepitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `httpstepitem` (
  `httpstepitemid` bigint(20) unsigned NOT NULL,
  `httpstepid` bigint(20) unsigned NOT NULL,
  `itemid` bigint(20) unsigned NOT NULL,
  `type` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`httpstepitemid`),
  UNIQUE KEY `httpstepitem_1` (`httpstepid`,`itemid`),
  KEY `httpstepitem_2` (`itemid`),
  CONSTRAINT `c_httpstepitem_1` FOREIGN KEY (`httpstepid`) REFERENCES `httpstep` (`httpstepid`) ON DELETE CASCADE,
  CONSTRAINT `c_httpstepitem_2` FOREIGN KEY (`itemid`) REFERENCES `items` (`itemid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `httpstepitem`
--

LOCK TABLES `httpstepitem` WRITE;
/*!40000 ALTER TABLE `httpstepitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `httpstepitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `httptest`
--

DROP TABLE IF EXISTS `httptest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `httptest` (
  `httptestid` bigint(20) unsigned NOT NULL,
  `name` varchar(64) NOT NULL DEFAULT '',
  `applicationid` bigint(20) unsigned DEFAULT NULL,
  `nextcheck` int(11) NOT NULL DEFAULT '0',
  `delay` varchar(255) NOT NULL DEFAULT '1m',
  `status` int(11) NOT NULL DEFAULT '0',
  `agent` varchar(255) NOT NULL DEFAULT 'Zabbix',
  `authentication` int(11) NOT NULL DEFAULT '0',
  `http_user` varchar(64) NOT NULL DEFAULT '',
  `http_password` varchar(64) NOT NULL DEFAULT '',
  `hostid` bigint(20) unsigned NOT NULL,
  `templateid` bigint(20) unsigned DEFAULT NULL,
  `http_proxy` varchar(255) NOT NULL DEFAULT '',
  `retries` int(11) NOT NULL DEFAULT '1',
  `ssl_cert_file` varchar(255) NOT NULL DEFAULT '',
  `ssl_key_file` varchar(255) NOT NULL DEFAULT '',
  `ssl_key_password` varchar(64) NOT NULL DEFAULT '',
  `verify_peer` int(11) NOT NULL DEFAULT '0',
  `verify_host` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`httptestid`),
  UNIQUE KEY `httptest_2` (`hostid`,`name`),
  KEY `httptest_1` (`applicationid`),
  KEY `httptest_3` (`status`),
  KEY `httptest_4` (`templateid`),
  CONSTRAINT `c_httptest_1` FOREIGN KEY (`applicationid`) REFERENCES `applications` (`applicationid`),
  CONSTRAINT `c_httptest_2` FOREIGN KEY (`hostid`) REFERENCES `hosts` (`hostid`) ON DELETE CASCADE,
  CONSTRAINT `c_httptest_3` FOREIGN KEY (`templateid`) REFERENCES `httptest` (`httptestid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `httptest`
--

LOCK TABLES `httptest` WRITE;
/*!40000 ALTER TABLE `httptest` DISABLE KEYS */;
/*!40000 ALTER TABLE `httptest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `httptest_field`
--

DROP TABLE IF EXISTS `httptest_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `httptest_field` (
  `httptest_fieldid` bigint(20) unsigned NOT NULL,
  `httptestid` bigint(20) unsigned NOT NULL,
  `type` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  PRIMARY KEY (`httptest_fieldid`),
  KEY `httptest_field_1` (`httptestid`),
  CONSTRAINT `c_httptest_field_1` FOREIGN KEY (`httptestid`) REFERENCES `httptest` (`httptestid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `httptest_field`
--

LOCK TABLES `httptest_field` WRITE;
/*!40000 ALTER TABLE `httptest_field` DISABLE KEYS */;
/*!40000 ALTER TABLE `httptest_field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `httptestitem`
--

DROP TABLE IF EXISTS `httptestitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `httptestitem` (
  `httptestitemid` bigint(20) unsigned NOT NULL,
  `httptestid` bigint(20) unsigned NOT NULL,
  `itemid` bigint(20) unsigned NOT NULL,
  `type` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`httptestitemid`),
  UNIQUE KEY `httptestitem_1` (`httptestid`,`itemid`),
  KEY `httptestitem_2` (`itemid`),
  CONSTRAINT `c_httptestitem_1` FOREIGN KEY (`httptestid`) REFERENCES `httptest` (`httptestid`) ON DELETE CASCADE,
  CONSTRAINT `c_httptestitem_2` FOREIGN KEY (`itemid`) REFERENCES `items` (`itemid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `httptestitem`
--

LOCK TABLES `httptestitem` WRITE;
/*!40000 ALTER TABLE `httptestitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `httptestitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `icon_map`
--

DROP TABLE IF EXISTS `icon_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `icon_map` (
  `iconmapid` bigint(20) unsigned NOT NULL,
  `name` varchar(64) NOT NULL DEFAULT '',
  `default_iconid` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`iconmapid`),
  UNIQUE KEY `icon_map_1` (`name`),
  KEY `icon_map_2` (`default_iconid`),
  CONSTRAINT `c_icon_map_1` FOREIGN KEY (`default_iconid`) REFERENCES `images` (`imageid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `icon_map`
--

LOCK TABLES `icon_map` WRITE;
/*!40000 ALTER TABLE `icon_map` DISABLE KEYS */;
/*!40000 ALTER TABLE `icon_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `icon_mapping`
--

DROP TABLE IF EXISTS `icon_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `icon_mapping` (
  `iconmappingid` bigint(20) unsigned NOT NULL,
  `iconmapid` bigint(20) unsigned NOT NULL,
  `iconid` bigint(20) unsigned NOT NULL,
  `inventory_link` int(11) NOT NULL DEFAULT '0',
  `expression` varchar(64) NOT NULL DEFAULT '',
  `sortorder` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`iconmappingid`),
  KEY `icon_mapping_1` (`iconmapid`),
  KEY `icon_mapping_2` (`iconid`),
  CONSTRAINT `c_icon_mapping_1` FOREIGN KEY (`iconmapid`) REFERENCES `icon_map` (`iconmapid`) ON DELETE CASCADE,
  CONSTRAINT `c_icon_mapping_2` FOREIGN KEY (`iconid`) REFERENCES `images` (`imageid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `icon_mapping`
--

LOCK TABLES `icon_mapping` WRITE;
/*!40000 ALTER TABLE `icon_mapping` DISABLE KEYS */;
/*!40000 ALTER TABLE `icon_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ids`
--

DROP TABLE IF EXISTS `ids`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ids` (
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `field_name` varchar(64) NOT NULL DEFAULT '',
  `nextid` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`table_name`,`field_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ids`
--

LOCK TABLES `ids` WRITE;
/*!40000 ALTER TABLE `ids` DISABLE KEYS */;
INSERT INTO `ids` VALUES ('acknowledges','acknowledgeid',2),('actions','actionid',8),('applications','applicationid',1174),('application_template','application_templateid',418),('auditlog','auditid',1931),('auditlog_details','auditdetailid',126),('conditions','conditionid',26),('functions','functionid',18089),('graphs','graphid',965),('graphs_items','gitemid',5860),('groups','groupid',23),('hosts','hostid',10281),('hosts_groups','hostgroupid',318),('hosts_templates','hosttemplateid',245),('housekeeper','housekeeperid',6808),('interface','interfaceid',38),('items','itemid',29552),('items_applications','itemappid',19524),('item_condition','item_conditionid',417),('item_discovery','itemdiscoveryid',1751),('item_preproc','item_preprocid',4967),('opcommand_hst','opcommand_hstid',2),('operations','operationid',12),('profiles','profileid',680),('screens','screenid',25),('screens_items','screenitemid',139),('sysmaps_elements','selementid',32),('sysmaps_links','linkid',31),('task','taskid',2),('triggers','triggerid',15987),('users_groups','id',6),('widget','widgetid',11),('widget_field','widget_fieldid',12);
/*!40000 ALTER TABLE `ids` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `images`
--

DROP TABLE IF EXISTS `images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `images` (
  `imageid` bigint(20) unsigned NOT NULL,
  `imagetype` int(11) NOT NULL DEFAULT '0',
  `name` varchar(64) NOT NULL DEFAULT '0',
  `image` longblob NOT NULL,
  PRIMARY KEY (`imageid`),
  UNIQUE KEY `images_1` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `images`
--

LOCK TABLES `images` WRITE;
/*!40000 ALTER TABLE `images` DISABLE KEYS */;
/*!40000 ALTER TABLE `images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `interface`
--

DROP TABLE IF EXISTS `interface`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `interface` (
  `interfaceid` bigint(20) unsigned NOT NULL,
  `hostid` bigint(20) unsigned NOT NULL,
  `main` int(11) NOT NULL DEFAULT '0',
  `type` int(11) NOT NULL DEFAULT '0',
  `useip` int(11) NOT NULL DEFAULT '1',
  `ip` varchar(64) NOT NULL DEFAULT '127.0.0.1',
  `dns` varchar(64) NOT NULL DEFAULT '',
  `port` varchar(64) NOT NULL DEFAULT '10050',
  `bulk` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`interfaceid`),
  KEY `interface_1` (`hostid`,`type`),
  KEY `interface_2` (`ip`,`dns`),
  CONSTRAINT `c_interface_1` FOREIGN KEY (`hostid`) REFERENCES `hosts` (`hostid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interface`
--

LOCK TABLES `interface` WRITE;
/*!40000 ALTER TABLE `interface` DISABLE KEYS */;
INSERT INTO `interface` VALUES (1,10084,1,1,1,'127.0.0.1','','10050',1),(2,10254,1,1,1,'10.10.10.42','','10050',1),(6,10254,1,4,1,'10.10.10.42','','12345',1),(10,10258,1,1,1,'10.10.10.41','','10050',1),(11,10259,1,1,1,'10.10.10.41','','10050',1),(12,10260,1,1,1,'10.10.10.41','','10050',1),(13,10261,1,1,1,'10.10.10.42','','10050',1),(14,10262,1,1,1,'10.10.10.36','','10050',1),(15,10263,1,1,1,'10.10.10.36','','10050',1),(16,10264,1,1,1,'10.10.10.26','','10050',1),(17,10265,1,1,1,'10.10.10.31','','10050',1),(18,10266,1,1,1,'10.10.10.31','','10050',1),(19,10267,1,1,1,'10.10.10.34','','10050',1),(20,10268,1,1,1,'10.10.10.34','','10050',1),(21,10269,1,1,1,'10.10.10.32','','10050',1),(22,10270,1,1,1,'10.10.10.33','','10050',1),(23,10271,1,1,1,'10.10.10.35','','10050',1),(31,10273,1,1,1,'10.10.10.25','','10050',1),(32,10274,1,1,1,'10.10.10.25','','10050',1),(33,10275,1,1,1,'10.10.10.26','','10050',1),(34,10277,1,1,1,'10.10.10.32','','10050',1),(35,10278,1,1,1,'10.10.10.41','','10050',1),(36,10279,1,1,1,'127.0.0.1','','10050',1),(37,10280,1,1,1,'10.10.10.41','','10050',1),(38,10281,1,1,1,'127.0.0.1','','10050',1);
/*!40000 ALTER TABLE `interface` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `interface_discovery`
--

DROP TABLE IF EXISTS `interface_discovery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `interface_discovery` (
  `interfaceid` bigint(20) unsigned NOT NULL,
  `parent_interfaceid` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`interfaceid`),
  KEY `c_interface_discovery_2` (`parent_interfaceid`),
  CONSTRAINT `c_interface_discovery_1` FOREIGN KEY (`interfaceid`) REFERENCES `interface` (`interfaceid`) ON DELETE CASCADE,
  CONSTRAINT `c_interface_discovery_2` FOREIGN KEY (`parent_interfaceid`) REFERENCES `interface` (`interfaceid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interface_discovery`
--

LOCK TABLES `interface_discovery` WRITE;
/*!40000 ALTER TABLE `interface_discovery` DISABLE KEYS */;
/*!40000 ALTER TABLE `interface_discovery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_application_prototype`
--

DROP TABLE IF EXISTS `item_application_prototype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_application_prototype` (
  `item_application_prototypeid` bigint(20) unsigned NOT NULL,
  `application_prototypeid` bigint(20) unsigned NOT NULL,
  `itemid` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`item_application_prototypeid`),
  UNIQUE KEY `item_application_prototype_1` (`application_prototypeid`,`itemid`),
  KEY `item_application_prototype_2` (`itemid`),
  CONSTRAINT `c_item_application_prototype_1` FOREIGN KEY (`application_prototypeid`) REFERENCES `application_prototype` (`application_prototypeid`) ON DELETE CASCADE,
  CONSTRAINT `c_item_application_prototype_2` FOREIGN KEY (`itemid`) REFERENCES `items` (`itemid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_application_prototype`
--

LOCK TABLES `item_application_prototype` WRITE;
/*!40000 ALTER TABLE `item_application_prototype` DISABLE KEYS */;
INSERT INTO `item_application_prototype` VALUES (1,1,23666);
/*!40000 ALTER TABLE `item_application_prototype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_condition`
--

DROP TABLE IF EXISTS `item_condition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_condition` (
  `item_conditionid` bigint(20) unsigned NOT NULL,
  `itemid` bigint(20) unsigned NOT NULL,
  `operator` int(11) NOT NULL DEFAULT '8',
  `macro` varchar(64) NOT NULL DEFAULT '',
  `value` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`item_conditionid`),
  KEY `item_condition_1` (`itemid`),
  CONSTRAINT `c_item_condition_1` FOREIGN KEY (`itemid`) REFERENCES `items` (`itemid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_condition`
--

LOCK TABLES `item_condition` WRITE;
/*!40000 ALTER TABLE `item_condition` DISABLE KEYS */;
INSERT INTO `item_condition` VALUES (1,22444,8,'{#IFNAME}','@Network interfaces for discovery'),(2,22450,8,'{#FSTYPE}','@File systems for discovery'),(4,22867,8,'{#FSTYPE}','@File systems for discovery'),(5,22907,8,'{#FSTYPE}','@File systems for discovery'),(6,22944,8,'{#IFNAME}','@Network interfaces for discovery'),(7,22947,8,'{#FSTYPE}','@File systems for discovery'),(8,22984,8,'{#IFNAME}','@Network interfaces for discovery'),(9,22987,8,'{#FSTYPE}','@File systems for discovery'),(10,23024,8,'{#IFNAME}','@Network interfaces for discovery'),(11,23027,8,'{#FSTYPE}','@File systems for discovery'),(12,23067,8,'{#FSTYPE}','@File systems for discovery'),(13,23162,8,'{#FSTYPE}','@File systems for discovery'),(14,23163,8,'{#IFNAME}','@Network interfaces for discovery'),(15,23329,8,'{#IFNAME}','@Network interfaces for discovery'),(16,23540,8,'{#IFNAME}','@Network interfaces for discovery'),(19,23278,8,'{#IFNAME}','@Network interfaces for discovery'),(20,23279,8,'{#FSTYPE}','@File systems for discovery'),(21,23665,8,'{#SERVICE.NAME}','@Windows service names for discovery'),(22,23665,8,'{#SERVICE.STARTUPNAME}','@Windows service startup states for discovery'),(215,27029,8,'{#IFOPERSTATUS}','1'),(216,27029,8,'{#SNMPVALUE}','(2|3)'),(217,27031,8,'{#IFOPERSTATUS}','1'),(218,27031,8,'{#SNMPVALUE}','(2|3)'),(219,27034,8,'{#STORAGE_TYPE}','.+2$'),(220,27034,8,'{#STORAGE_TYPE}','.+hrStorageRam'),(221,27035,8,'{#STORAGE_TYPE}','.+4$'),(222,27035,8,'{#STORAGE_TYPE}','.+hrStorageFixedDisk'),(223,27050,8,'{#STORAGE_TYPE}','.+2$'),(224,27050,8,'{#STORAGE_TYPE}','.+hrStorageRam'),(225,27051,8,'{#STORAGE_TYPE}','.+4$'),(226,27051,8,'{#STORAGE_TYPE}','.+hrStorageFixedDisk'),(227,27068,8,'{#IFADMINSTATUS}','(1|3)'),(228,27068,8,'{#IFNAME}','@Network interfaces for discovery'),(229,27078,8,'{#IFADMINSTATUS}','(1|3)'),(230,27078,8,'{#IFNAME}','@Network interfaces for discovery'),(231,27088,8,'{#IFADMINSTATUS}','(1|3)'),(232,27088,8,'{#IFNAME}','@Network interfaces for discovery'),(233,27098,8,'{#IFADMINSTATUS}','(1|3)'),(234,27098,8,'{#IFNAME}','@Network interfaces for discovery'),(237,27118,8,'{#IFADMINSTATUS}','(1|3)'),(238,27118,8,'{#IFNAME}','@Network interfaces for discovery'),(243,27180,8,'{#IFADMINSTATUS}','(1|3)'),(244,27180,8,'{#IFNAME}','@Network interfaces for discovery'),(245,27190,8,'{#IFOPERSTATUS}','1'),(246,27190,8,'{#SNMPVALUE}','(2|3)'),(247,27209,8,'{#TEMP_SENSOR}','1'),(248,27210,8,'{#SNMPVALUE}','[^1]'),(249,27211,8,'{#ENT_SN}','.+'),(250,27215,8,'{#IFADMINSTATUS}','(1|3)'),(251,27215,8,'{#IFNAME}','@Network interfaces for discovery'),(253,27242,8,'{#SENSOR_TYPE}','1'),(254,27243,8,'{#SENSOR_TYPE}','3'),(255,27244,8,'{#SENSOR_TYPE}','2'),(256,27251,8,'{#IFADMINSTATUS}','(1|3)'),(257,27251,8,'{#IFNAME}','@Network interfaces for discovery'),(258,27272,8,'{#IFADMINSTATUS}','(1|3)'),(259,27272,8,'{#IFNAME}','@Network interfaces for discovery'),(260,27321,8,'{#IFADMINSTATUS}','(1|3)'),(261,27321,8,'{#IFNAME}','@Network interfaces for discovery'),(262,27331,8,'{#IFOPERSTATUS}','1'),(263,27331,8,'{#SNMPVALUE}','(2|3)'),(266,27393,8,'{#ENT_SN}','.+'),(267,27393,8,'{#ENT_CLASS}','[^3]'),(268,27399,8,'{#ENT_SN}','.+'),(269,27399,8,'{#ENT_CLASS}','[^3]'),(272,27410,8,'{#ENT_SN}','.+'),(273,27410,8,'{#ENT_CLASS}','[^3]'),(274,27450,8,'{#IFADMINSTATUS}','(1|3)'),(275,27450,8,'{#IFNAME}','@Network interfaces for discovery'),(276,27460,8,'{#IFOPERSTATUS}','1'),(277,27460,8,'{#SNMPVALUE}','(2|3)'),(278,27486,8,'{#IFADMINSTATUS}','(1|3)'),(279,27486,8,'{#IFNAME}','@Network interfaces for discovery'),(280,27520,8,'{#IFADMINSTATUS}','(1|3)'),(281,27520,8,'{#IFNAME}','@Network interfaces for discovery'),(282,27530,8,'{#IFOPERSTATUS}','1'),(283,27530,8,'{#SNMPVALUE}','(2|3)'),(284,27550,8,'{#STATUS}','[^0]'),(285,27551,8,'{#STATUS}','[^0]'),(286,27556,8,'{#IFADMINSTATUS}','(1|3)'),(287,27556,8,'{#IFNAME}','@Network interfaces for discovery'),(288,27566,8,'{#IFOPERSTATUS}','1'),(289,27566,8,'{#SNMPVALUE}','(2|3)'),(290,27596,8,'{#IFADMINSTATUS}','(1|3)'),(291,27596,8,'{#IFNAME}','@Network interfaces for discovery'),(292,27606,8,'{#IFOPERSTATUS}','1'),(293,27606,8,'{#SNMPVALUE}','(2|3)'),(294,27619,8,'{#IFADMINSTATUS}','(1|3)'),(295,27619,8,'{#IFNAME}','@Network interfaces for discovery'),(296,27629,8,'{#IFOPERSTATUS}','1'),(297,27629,8,'{#SNMPVALUE}','(2|3)'),(298,27642,8,'{#IFADMINSTATUS}','(1|3)'),(299,27642,8,'{#IFNAME}','@Network interfaces for discovery'),(300,27652,8,'{#IFOPERSTATUS}','1'),(301,27652,8,'{#SNMPVALUE}','(2|3)'),(302,27665,8,'{#SNMPVALUE}','^(MODULE|Module) (LEVEL|level)1$'),(303,27665,8,'{#SNMPVALUE}','(Fabric|FABRIC) (.+) (Module|MODULE)'),(304,27666,8,'{#SNMPVALUE}','^(MODULE|Module) (LEVEL|level)1$'),(305,27666,8,'{#SNMPVALUE}','(Fabric|FABRIC) (.+) (Module|MODULE)'),(306,27666,8,'{#SNMPVALUE}','(T|t)emperature.*(s|S)ensor'),(307,27667,8,'{#ENT_CLASS}','7'),(308,27668,8,'{#ENT_CLASS}','6'),(309,27669,8,'{#ENT_CLASS}','3'),(323,27722,8,'{#IFADMINSTATUS}','(1|3)'),(324,27722,8,'{#IFNAME}','@Network interfaces for discovery'),(325,27732,8,'{#IFOPERSTATUS}','1'),(326,27732,8,'{#SNMPVALUE}','(2|3)'),(327,27745,8,'{#ENT_NAME}','MPU.*'),(328,27746,8,'{#ENT_CLASS}','3'),(329,27756,8,'{#IFADMINSTATUS}','(1|3)'),(330,27756,8,'{#IFNAME}','@Network interfaces for discovery'),(331,27779,8,'{#SENSOR_TYPE}','2'),(332,27780,8,'{#ENT_CLASS}','2'),(333,27788,8,'{#IFADMINSTATUS}','(1|3)'),(334,27788,8,'{#IFNAME}','@Network interfaces for discovery'),(335,27798,8,'{#IFOPERSTATUS}','1'),(336,27798,8,'{#SNMPVALUE}','(2|3)'),(337,27815,8,'{#SNMPVALUE}','Routing Engine.*'),(338,27816,8,'{#SNMPVALUE}','[^0]+'),(350,27872,8,'{#IFADMINSTATUS}','(1|3)'),(351,27872,8,'{#IFNAME}','@Network interfaces for discovery'),(352,27903,8,'{#STORAGE_TYPE}','.+4$'),(353,27903,8,'{#STORAGE_TYPE}','.+hrStorageFixedDisk'),(354,27909,8,'{#IFADMINSTATUS}','(1|3)'),(355,27909,8,'{#IFNAME}','@Network interfaces for discovery'),(356,27944,8,'{#IFADMINSTATUS}','(1|3)'),(357,27944,8,'{#IFNAME}','@Network interfaces for discovery'),(358,27954,8,'{#IFOPERSTATUS}','1'),(359,27954,8,'{#SNMPVALUE}','(2|3)'),(360,27976,8,'{#IFADMINSTATUS}','(1|3)'),(361,27976,8,'{#IFNAME}','@Network interfaces for discovery'),(362,28005,8,'{#IFADMINSTATUS}','(1|3)'),(363,28005,8,'{#IFNAME}','@Network interfaces for discovery'),(364,28043,8,'{#STORAGE_TYPE}','.+2$'),(365,28043,8,'{#STORAGE_TYPE}','.+hrStorageRam'),(366,28044,8,'{#STORAGE_TYPE}','.+4$'),(367,28044,8,'{#STORAGE_TYPE}','.+hrStorageFixedDisk'),(368,28058,8,'{#IFADMINSTATUS}','(1|3)'),(369,28058,8,'{#IFNAME}','@Network interfaces for discovery'),(370,28068,8,'{#IFOPERSTATUS}','1'),(371,28068,8,'{#SNMPVALUE}','(2|3)'),(372,28082,8,'{#STORAGE_TYPE}','.+2$'),(373,28082,8,'{#STORAGE_TYPE}','.+hrStorageRam'),(374,28083,8,'{#STORAGE_TYPE}','.+4$'),(375,28083,8,'{#STORAGE_TYPE}','.+hrStorageFixedDisk'),(376,28097,8,'{#IFADMINSTATUS}','(1|3)'),(377,28097,8,'{#IFNAME}','@Network interfaces for discovery'),(378,28118,8,'{#IFADMINSTATUS}','(1|3)'),(379,28118,8,'{#IFNAME}','@Network interfaces for discovery'),(380,28128,8,'{#IFOPERSTATUS}','1'),(381,28128,8,'{#SNMPVALUE}','(2|3)'),(382,28144,8,'{#SNMPVALUE}','8'),(383,28144,8,'{#SENSOR_PRECISION}','0'),(384,28146,8,'{#ENT_CLASS}','.+8.3.2$'),(385,28146,8,'{#ENT_STATUS}','(1|2|3|4)'),(386,28147,8,'{#ENT_CLASS}','.+8.3.1$'),(387,28147,8,'{#ENT_STATUS}','(1|2|3|4)'),(388,28148,8,'{#ENT_CLASS}','.+8.3.3$'),(389,28148,8,'{#ENT_STATUS}','(1|2|3|4)'),(390,28149,8,'{#ENT_CLASS}','3'),(391,28160,8,'{#STORAGE_TYPE}','.+2$'),(392,28160,8,'{#STORAGE_TYPE}','.+hrStorageRam'),(393,28161,8,'{#STORAGE_TYPE}','.+4$'),(394,28161,8,'{#STORAGE_TYPE}','.+hrStorageFixedDisk'),(395,28175,8,'{#IFADMINSTATUS}','(1|3)'),(396,28175,8,'{#IFNAME}','@Network interfaces for discovery'),(397,28196,8,'{#SNMPVALUE}','8'),(398,28196,8,'{#SENSOR_PRECISION}','1'),(399,28197,8,'{#SNMPVALUE}','10'),(400,28198,8,'{#ENT_CLASS}','3'),(401,28199,8,'{#ENT_CLASS}','6'),(402,28207,8,'{#ENT_SN}','.+'),(403,28207,8,'{#ENT_CLASS}','[^3]'),(404,28223,8,'{#IFADMINSTATUS}','(1|3)'),(405,28223,8,'{#IFNAME}','@Network interfaces for discovery');
/*!40000 ALTER TABLE `item_condition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_discovery`
--

DROP TABLE IF EXISTS `item_discovery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_discovery` (
  `itemdiscoveryid` bigint(20) unsigned NOT NULL,
  `itemid` bigint(20) unsigned NOT NULL,
  `parent_itemid` bigint(20) unsigned NOT NULL,
  `key_` varchar(255) NOT NULL DEFAULT '',
  `lastcheck` int(11) NOT NULL DEFAULT '0',
  `ts_delete` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`itemdiscoveryid`),
  UNIQUE KEY `item_discovery_1` (`itemid`,`parent_itemid`),
  KEY `item_discovery_2` (`parent_itemid`),
  CONSTRAINT `c_item_discovery_1` FOREIGN KEY (`itemid`) REFERENCES `items` (`itemid`) ON DELETE CASCADE,
  CONSTRAINT `c_item_discovery_2` FOREIGN KEY (`parent_itemid`) REFERENCES `items` (`itemid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_discovery`
--

LOCK TABLES `item_discovery` WRITE;
/*!40000 ALTER TABLE `item_discovery` DISABLE KEYS */;
INSERT INTO `item_discovery` VALUES (1,22446,22444,'',0,0),(3,22448,22444,'',0,0),(5,22452,22450,'',0,0),(7,22454,22450,'',0,0),(9,22456,22450,'',0,0),(11,22458,22450,'',0,0),(65,22686,22450,'',0,0),(135,22868,22867,'',0,0),(136,22869,22867,'',0,0),(137,22870,22867,'',0,0),(138,22871,22867,'',0,0),(139,22872,22867,'',0,0),(142,22908,22907,'',0,0),(143,22909,22907,'',0,0),(144,22910,22907,'',0,0),(145,22911,22907,'',0,0),(146,22912,22907,'',0,0),(147,22945,22944,'',0,0),(148,22946,22944,'',0,0),(149,22948,22947,'',0,0),(150,22949,22947,'',0,0),(151,22950,22947,'',0,0),(152,22951,22947,'',0,0),(153,22952,22947,'',0,0),(154,22985,22984,'',0,0),(155,22986,22984,'',0,0),(156,22988,22987,'',0,0),(157,22989,22987,'',0,0),(158,22990,22987,'',0,0),(159,22991,22987,'',0,0),(160,22992,22987,'',0,0),(161,23025,23024,'',0,0),(162,23026,23024,'',0,0),(163,23028,23027,'',0,0),(164,23029,23027,'',0,0),(165,23030,23027,'',0,0),(166,23031,23027,'',0,0),(167,23032,23027,'',0,0),(170,23068,23067,'',0,0),(171,23069,23067,'',0,0),(172,23070,23067,'',0,0),(173,23071,23067,'',0,0),(174,23072,23067,'',0,0),(175,23164,23162,'',0,0),(176,23165,23162,'',0,0),(178,23167,23162,'',0,0),(179,23168,23162,'',0,0),(180,23169,23163,'',0,0),(181,23170,23163,'',0,0),(182,23280,23278,'',0,0),(183,23281,23278,'',0,0),(184,23282,23279,'',0,0),(185,23283,23279,'',0,0),(186,23284,23279,'',0,0),(187,23285,23279,'',0,0),(188,23286,23279,'',0,0),(189,23073,23540,'',0,0),(190,23074,23540,'',0,0),(191,23075,23329,'',0,0),(192,23076,23329,'',0,0),(220,23666,23665,'',0,0),(746,26994,26987,'',0,0),(747,26995,26990,'',0,0),(748,26996,26990,'',0,0),(749,26997,26990,'',0,0),(750,26998,26990,'',0,0),(751,26999,26991,'',0,0),(752,27000,26991,'',0,0),(753,27001,26991,'',0,0),(754,27002,26991,'',0,0),(755,27003,26992,'',0,0),(756,27004,26992,'',0,0),(757,27005,26992,'',0,0),(758,27006,26992,'',0,0),(759,27007,26993,'',0,0),(760,27008,26993,'',0,0),(761,27009,26993,'',0,0),(762,27010,26993,'',0,0),(775,27030,27029,'',0,0),(776,27032,27031,'',0,0),(777,27036,27033,'',0,0),(778,27037,27034,'',0,0),(779,27038,27034,'',0,0),(780,27039,27034,'',0,0),(781,27040,27034,'',0,0),(782,27041,27034,'',0,0),(783,27042,27034,'',0,0),(784,27043,27035,'',0,0),(785,27044,27035,'',0,0),(786,27045,27035,'',0,0),(787,27046,27035,'',0,0),(788,27047,27035,'',0,0),(789,27048,27035,'',0,0),(790,27052,27049,'',0,0),(791,27053,27050,'',0,0),(792,27054,27050,'',0,0),(793,27055,27050,'',0,0),(794,27056,27050,'',0,0),(795,27057,27050,'',0,0),(796,27058,27050,'',0,0),(797,27059,27051,'',0,0),(798,27060,27051,'',0,0),(799,27061,27051,'',0,0),(800,27062,27051,'',0,0),(801,27063,27051,'',0,0),(802,27064,27051,'',0,0),(803,27069,27068,'',0,0),(804,27070,27068,'',0,0),(805,27071,27068,'',0,0),(806,27072,27068,'',0,0),(807,27073,27068,'',0,0),(808,27074,27068,'',0,0),(809,27075,27068,'',0,0),(810,27076,27068,'',0,0),(811,27077,27068,'',0,0),(812,27079,27078,'',0,0),(813,27080,27078,'',0,0),(814,27081,27078,'',0,0),(815,27082,27078,'',0,0),(816,27083,27078,'',0,0),(817,27084,27078,'',0,0),(818,27085,27078,'',0,0),(819,27086,27078,'',0,0),(820,27087,27078,'',0,0),(821,27089,27088,'',0,0),(822,27090,27088,'',0,0),(823,27091,27088,'',0,0),(824,27092,27088,'',0,0),(825,27093,27088,'',0,0),(826,27094,27088,'',0,0),(827,27095,27088,'',0,0),(828,27096,27088,'',0,0),(829,27097,27088,'',0,0),(830,27099,27098,'',0,0),(831,27100,27098,'',0,0),(832,27101,27098,'',0,0),(833,27102,27098,'',0,0),(834,27103,27098,'',0,0),(835,27104,27098,'',0,0),(836,27105,27098,'',0,0),(837,27106,27098,'',0,0),(838,27107,27098,'',0,0),(848,27119,27118,'',0,0),(849,27120,27118,'',0,0),(850,27121,27118,'',0,0),(851,27122,27118,'',0,0),(852,27123,27118,'',0,0),(853,27124,27118,'',0,0),(854,27125,27118,'',0,0),(855,27126,27118,'',0,0),(856,27127,27118,'',0,0),(875,27181,27180,'',0,0),(876,27182,27180,'',0,0),(877,27183,27180,'',0,0),(878,27184,27180,'',0,0),(879,27185,27180,'',0,0),(880,27186,27180,'',0,0),(881,27187,27180,'',0,0),(882,27188,27180,'',0,0),(883,27189,27180,'',0,0),(884,27191,27190,'',0,0),(885,27212,27209,'',0,0),(886,27213,27210,'',0,0),(887,27214,27211,'',0,0),(888,27216,27215,'',0,0),(889,27217,27215,'',0,0),(890,27218,27215,'',0,0),(891,27219,27215,'',0,0),(892,27220,27215,'',0,0),(893,27221,27215,'',0,0),(894,27222,27215,'',0,0),(895,27223,27215,'',0,0),(896,27224,27215,'',0,0),(898,27246,27242,'',0,0),(899,27247,27242,'',0,0),(900,27248,27243,'',0,0),(901,27249,27244,'',0,0),(902,27250,27244,'',0,0),(903,27252,27251,'',0,0),(904,27253,27251,'',0,0),(905,27254,27251,'',0,0),(906,27255,27251,'',0,0),(907,27256,27251,'',0,0),(908,27257,27251,'',0,0),(909,27258,27251,'',0,0),(910,27259,27251,'',0,0),(911,27260,27251,'',0,0),(912,27273,27272,'',0,0),(913,27274,27272,'',0,0),(914,27275,27272,'',0,0),(915,27276,27272,'',0,0),(916,27277,27272,'',0,0),(917,27278,27272,'',0,0),(918,27279,27272,'',0,0),(919,27280,27272,'',0,0),(920,27281,27272,'',0,0),(921,27312,27302,'',0,0),(922,27313,27303,'',0,0),(923,27314,27304,'',0,0),(924,27315,27306,'',0,0),(925,27316,27307,'',0,0),(926,27317,27308,'',0,0),(927,27318,27309,'',0,0),(928,27319,27310,'',0,0),(929,27320,27311,'',0,0),(930,27322,27321,'',0,0),(931,27323,27321,'',0,0),(932,27324,27321,'',0,0),(933,27325,27321,'',0,0),(934,27326,27321,'',0,0),(935,27327,27321,'',0,0),(936,27328,27321,'',0,0),(937,27329,27321,'',0,0),(938,27330,27321,'',0,0),(939,27332,27331,'',0,0),(949,27414,27390,'',0,0),(950,27415,27390,'',0,0),(951,27416,27390,'',0,0),(952,27417,27391,'',0,0),(954,27419,27393,'',0,0),(955,27420,27394,'',0,0),(956,27421,27394,'',0,0),(957,27422,27395,'',0,0),(958,27423,27396,'',0,0),(959,27424,27397,'',0,0),(960,27425,27397,'',0,0),(961,27426,27397,'',0,0),(962,27427,27398,'',0,0),(963,27428,27399,'',0,0),(964,27429,27400,'',0,0),(965,27430,27400,'',0,0),(966,27431,27401,'',0,0),(967,27432,27402,'',0,0),(977,27442,27409,'',0,0),(978,27443,27409,'',0,0),(979,27444,27409,'',0,0),(980,27445,27410,'',0,0),(981,27446,27411,'',0,0),(982,27447,27411,'',0,0),(983,27448,27412,'',0,0),(984,27449,27413,'',0,0),(985,27451,27450,'',0,0),(986,27452,27450,'',0,0),(987,27453,27450,'',0,0),(988,27454,27450,'',0,0),(989,27455,27450,'',0,0),(990,27456,27450,'',0,0),(991,27457,27450,'',0,0),(992,27458,27450,'',0,0),(993,27459,27450,'',0,0),(994,27461,27460,'',0,0),(995,27477,27473,'',0,0),(996,27478,27473,'',0,0),(997,27479,27474,'',0,0),(998,27480,27475,'',0,0),(999,27481,27476,'',0,0),(1000,27482,27476,'',0,0),(1001,27483,27476,'',0,0),(1002,27484,27476,'',0,0),(1003,27485,27476,'',0,0),(1004,27487,27486,'',0,0),(1005,27488,27486,'',0,0),(1006,27489,27486,'',0,0),(1007,27490,27486,'',0,0),(1008,27491,27486,'',0,0),(1009,27492,27486,'',0,0),(1010,27493,27486,'',0,0),(1011,27494,27486,'',0,0),(1012,27495,27486,'',0,0),(1013,27516,27512,'',0,0),(1014,27517,27513,'',0,0),(1015,27518,27514,'',0,0),(1016,27519,27515,'',0,0),(1017,27521,27520,'',0,0),(1018,27522,27520,'',0,0),(1019,27523,27520,'',0,0),(1020,27524,27520,'',0,0),(1021,27525,27520,'',0,0),(1022,27526,27520,'',0,0),(1023,27527,27520,'',0,0),(1024,27528,27520,'',0,0),(1025,27529,27520,'',0,0),(1026,27531,27530,'',0,0),(1027,27552,27548,'',0,0),(1028,27553,27549,'',0,0),(1029,27554,27550,'',0,0),(1030,27555,27551,'',0,0),(1031,27557,27556,'',0,0),(1032,27558,27556,'',0,0),(1033,27559,27556,'',0,0),(1034,27560,27556,'',0,0),(1035,27561,27556,'',0,0),(1036,27562,27556,'',0,0),(1037,27563,27556,'',0,0),(1038,27564,27556,'',0,0),(1039,27565,27556,'',0,0),(1040,27567,27566,'',0,0),(1041,27590,27587,'',0,0),(1042,27591,27587,'',0,0),(1043,27592,27587,'',0,0),(1044,27593,27588,'',0,0),(1045,27594,27589,'',0,0),(1046,27595,27589,'',0,0),(1047,27597,27596,'',0,0),(1048,27598,27596,'',0,0),(1049,27599,27596,'',0,0),(1050,27600,27596,'',0,0),(1051,27601,27596,'',0,0),(1052,27602,27596,'',0,0),(1053,27603,27596,'',0,0),(1054,27604,27596,'',0,0),(1055,27605,27596,'',0,0),(1056,27607,27606,'',0,0),(1057,27620,27619,'',0,0),(1058,27621,27619,'',0,0),(1059,27622,27619,'',0,0),(1060,27623,27619,'',0,0),(1061,27624,27619,'',0,0),(1062,27625,27619,'',0,0),(1063,27626,27619,'',0,0),(1064,27627,27619,'',0,0),(1065,27628,27619,'',0,0),(1066,27630,27629,'',0,0),(1067,27643,27642,'',0,0),(1068,27644,27642,'',0,0),(1069,27645,27642,'',0,0),(1070,27646,27642,'',0,0),(1071,27647,27642,'',0,0),(1072,27648,27642,'',0,0),(1073,27649,27642,'',0,0),(1074,27650,27642,'',0,0),(1075,27651,27642,'',0,0),(1076,27653,27652,'',0,0),(1077,27670,27665,'',0,0),(1078,27671,27665,'',0,0),(1079,27672,27666,'',0,0),(1080,27673,27667,'',0,0),(1081,27674,27668,'',0,0),(1082,27675,27669,'',0,0),(1083,27676,27669,'',0,0),(1084,27677,27669,'',0,0),(1085,27678,27669,'',0,0),(1086,27679,27669,'',0,0),(1107,27723,27722,'',0,0),(1108,27724,27722,'',0,0),(1109,27725,27722,'',0,0),(1110,27726,27722,'',0,0),(1111,27727,27722,'',0,0),(1112,27728,27722,'',0,0),(1113,27729,27722,'',0,0),(1114,27730,27722,'',0,0),(1115,27731,27722,'',0,0),(1116,27733,27732,'',0,0),(1117,27748,27745,'',0,0),(1118,27749,27745,'',0,0),(1119,27750,27745,'',0,0),(1120,27751,27745,'',0,0),(1121,27752,27745,'',0,0),(1122,27753,27745,'',0,0),(1123,27754,27746,'',0,0),(1124,27755,27747,'',0,0),(1125,27757,27756,'',0,0),(1126,27758,27756,'',0,0),(1127,27759,27756,'',0,0),(1128,27760,27756,'',0,0),(1129,27761,27756,'',0,0),(1130,27762,27756,'',0,0),(1131,27763,27756,'',0,0),(1132,27764,27756,'',0,0),(1133,27765,27756,'',0,0),(1134,27783,27779,'',0,0),(1135,27784,27779,'',0,0),(1136,27785,27780,'',0,0),(1137,27786,27781,'',0,0),(1138,27787,27782,'',0,0),(1139,27789,27788,'',0,0),(1140,27790,27788,'',0,0),(1141,27791,27788,'',0,0),(1142,27792,27788,'',0,0),(1143,27793,27788,'',0,0),(1144,27794,27788,'',0,0),(1145,27795,27788,'',0,0),(1146,27796,27788,'',0,0),(1147,27797,27788,'',0,0),(1148,27799,27798,'',0,0),(1149,27819,27815,'',0,0),(1150,27820,27815,'',0,0),(1151,27821,27816,'',0,0),(1152,27822,27817,'',0,0),(1153,27823,27818,'',0,0),(1183,27873,27872,'',0,0),(1184,27874,27872,'',0,0),(1185,27875,27872,'',0,0),(1186,27876,27872,'',0,0),(1187,27877,27872,'',0,0),(1188,27878,27872,'',0,0),(1189,27879,27872,'',0,0),(1190,27880,27872,'',0,0),(1191,27881,27872,'',0,0),(1192,27904,27901,'',0,0),(1193,27905,27902,'',0,0),(1194,27906,27903,'',0,0),(1195,27907,27903,'',0,0),(1196,27908,27903,'',0,0),(1197,27910,27909,'',0,0),(1198,27911,27909,'',0,0),(1199,27912,27909,'',0,0),(1200,27913,27909,'',0,0),(1201,27914,27909,'',0,0),(1202,27915,27909,'',0,0),(1203,27916,27909,'',0,0),(1204,27917,27909,'',0,0),(1205,27918,27909,'',0,0),(1206,27940,27937,'',0,0),(1207,27941,27937,'',0,0),(1208,27942,27938,'',0,0),(1209,27943,27939,'',0,0),(1210,27945,27944,'',0,0),(1211,27946,27944,'',0,0),(1212,27947,27944,'',0,0),(1213,27948,27944,'',0,0),(1214,27949,27944,'',0,0),(1215,27950,27944,'',0,0),(1216,27951,27944,'',0,0),(1217,27952,27944,'',0,0),(1218,27953,27944,'',0,0),(1219,27955,27954,'',0,0),(1220,27977,27976,'',0,0),(1221,27978,27976,'',0,0),(1222,27979,27976,'',0,0),(1223,27980,27976,'',0,0),(1224,27981,27976,'',0,0),(1225,27982,27976,'',0,0),(1226,27983,27976,'',0,0),(1227,27984,27976,'',0,0),(1228,27985,27976,'',0,0),(1229,28003,28001,'',0,0),(1230,28004,28002,'',0,0),(1231,28006,28005,'',0,0),(1232,28007,28005,'',0,0),(1233,28008,28005,'',0,0),(1234,28009,28005,'',0,0),(1235,28010,28005,'',0,0),(1236,28011,28005,'',0,0),(1237,28012,28005,'',0,0),(1238,28013,28005,'',0,0),(1239,28014,28005,'',0,0),(1240,28045,28042,'',0,0),(1241,28046,28044,'',0,0),(1242,28047,28044,'',0,0),(1243,28048,28044,'',0,0),(1244,28049,28044,'',0,0),(1245,28050,28044,'',0,0),(1246,28051,28044,'',0,0),(1247,28052,28043,'',0,0),(1248,28053,28043,'',0,0),(1249,28054,28043,'',0,0),(1250,28055,28043,'',0,0),(1251,28056,28043,'',0,0),(1252,28057,28043,'',0,0),(1253,28059,28058,'',0,0),(1254,28060,28058,'',0,0),(1255,28061,28058,'',0,0),(1256,28062,28058,'',0,0),(1257,28063,28058,'',0,0),(1258,28064,28058,'',0,0),(1259,28065,28058,'',0,0),(1260,28066,28058,'',0,0),(1261,28067,28058,'',0,0),(1262,28069,28068,'',0,0),(1263,28084,28081,'',0,0),(1264,28085,28083,'',0,0),(1265,28086,28083,'',0,0),(1266,28087,28083,'',0,0),(1267,28088,28083,'',0,0),(1268,28089,28083,'',0,0),(1269,28090,28083,'',0,0),(1270,28091,28082,'',0,0),(1271,28092,28082,'',0,0),(1272,28093,28082,'',0,0),(1273,28094,28082,'',0,0),(1274,28095,28082,'',0,0),(1275,28096,28082,'',0,0),(1276,28098,28097,'',0,0),(1277,28099,28097,'',0,0),(1278,28100,28097,'',0,0),(1279,28101,28097,'',0,0),(1280,28102,28097,'',0,0),(1281,28103,28097,'',0,0),(1282,28104,28097,'',0,0),(1283,28105,28097,'',0,0),(1284,28106,28097,'',0,0),(1285,28119,28118,'',0,0),(1286,28120,28118,'',0,0),(1287,28121,28118,'',0,0),(1288,28122,28118,'',0,0),(1289,28123,28118,'',0,0),(1290,28124,28118,'',0,0),(1291,28125,28118,'',0,0),(1292,28126,28118,'',0,0),(1293,28127,28118,'',0,0),(1294,28129,28128,'',0,0),(1295,28150,28144,'',0,0),(1296,28151,28145,'',0,0),(1297,28152,28145,'',0,0),(1298,28153,28145,'',0,0),(1299,28154,28146,'',0,0),(1300,28155,28147,'',0,0),(1301,28156,28148,'',0,0),(1302,28157,28149,'',0,0),(1303,28158,28149,'',0,0),(1304,28162,28159,'',0,0),(1305,28163,28161,'',0,0),(1306,28164,28161,'',0,0),(1307,28165,28161,'',0,0),(1308,28166,28161,'',0,0),(1309,28167,28161,'',0,0),(1310,28168,28161,'',0,0),(1311,28169,28160,'',0,0),(1312,28170,28160,'',0,0),(1313,28171,28160,'',0,0),(1314,28172,28160,'',0,0),(1315,28173,28160,'',0,0),(1316,28174,28160,'',0,0),(1317,28176,28175,'',0,0),(1318,28177,28175,'',0,0),(1319,28178,28175,'',0,0),(1320,28179,28175,'',0,0),(1321,28180,28175,'',0,0),(1322,28181,28175,'',0,0),(1323,28182,28175,'',0,0),(1324,28183,28175,'',0,0),(1325,28184,28175,'',0,0),(1326,28200,28196,'',0,0),(1327,28201,28196,'',0,0),(1328,28202,28197,'',0,0),(1329,28203,28197,'',0,0),(1330,28204,28198,'',0,0),(1331,28205,28198,'',0,0),(1332,28206,28199,'',0,0),(1333,28208,28207,'',0,0),(1334,28215,28212,'',0,0),(1335,28216,28213,'',0,0),(1336,28217,28214,'',0,0),(1337,28218,28214,'',0,0),(1338,28220,28219,'',0,0),(1339,28221,28219,'',0,0),(1340,28222,28219,'',0,0),(1341,28224,28223,'',0,0),(1342,28225,28223,'',0,0),(1343,28226,28223,'',0,0),(1344,28227,28223,'',0,0),(1345,28228,28223,'',0,0),(1346,28229,28223,'',0,0),(1347,28230,28223,'',0,0),(1348,28231,28223,'',0,0),(1349,28232,28223,'',0,0),(1350,28246,28244,'',0,0),(1351,28247,28245,'',0,0),(1481,28589,23280,'net.if.in[{#IFNAME}]',1537838878,0),(1482,28590,23280,'net.if.in[{#IFNAME}]',1537838878,0),(1483,28591,23280,'net.if.in[{#IFNAME}]',1537838878,0),(1484,28592,23280,'net.if.in[{#IFNAME}]',1537838878,0),(1485,28593,23280,'net.if.in[{#IFNAME}]',1537838878,0),(1486,28594,23280,'net.if.in[{#IFNAME}]',1537838878,0),(1487,28595,23280,'net.if.in[{#IFNAME}]',1537838878,0),(1488,28596,23280,'net.if.in[{#IFNAME}]',1537838878,0),(1489,28597,23281,'net.if.out[{#IFNAME}]',1537838878,0),(1490,28598,23281,'net.if.out[{#IFNAME}]',1537838878,0),(1491,28599,23281,'net.if.out[{#IFNAME}]',1537838878,0),(1492,28600,23281,'net.if.out[{#IFNAME}]',1537838878,0),(1493,28601,23281,'net.if.out[{#IFNAME}]',1537838878,0),(1494,28602,23281,'net.if.out[{#IFNAME}]',1537838878,0),(1495,28603,23281,'net.if.out[{#IFNAME}]',1537838878,0),(1496,28604,23281,'net.if.out[{#IFNAME}]',1537838878,0),(1497,28605,23282,'vfs.fs.inode[{#FSNAME},pfree]',1537838879,0),(1498,28606,23282,'vfs.fs.inode[{#FSNAME},pfree]',1537838879,0),(1499,28607,23282,'vfs.fs.inode[{#FSNAME},pfree]',1537838879,0),(1500,28608,23282,'vfs.fs.inode[{#FSNAME},pfree]',1537838879,0),(1501,28609,23283,'vfs.fs.size[{#FSNAME},free]',1537838879,0),(1502,28610,23283,'vfs.fs.size[{#FSNAME},free]',1537838879,0),(1503,28611,23283,'vfs.fs.size[{#FSNAME},free]',1537838879,0),(1504,28612,23283,'vfs.fs.size[{#FSNAME},free]',1537838879,0),(1505,28613,23284,'vfs.fs.size[{#FSNAME},pfree]',1537838879,0),(1506,28614,23284,'vfs.fs.size[{#FSNAME},pfree]',1537838879,0),(1507,28615,23284,'vfs.fs.size[{#FSNAME},pfree]',1537838879,0),(1508,28616,23284,'vfs.fs.size[{#FSNAME},pfree]',1537838879,0),(1509,28617,23285,'vfs.fs.size[{#FSNAME},total]',1537838879,0),(1510,28618,23285,'vfs.fs.size[{#FSNAME},total]',1537838879,0),(1511,28619,23285,'vfs.fs.size[{#FSNAME},total]',1537838879,0),(1512,28620,23285,'vfs.fs.size[{#FSNAME},total]',1537838879,0),(1513,28621,23286,'vfs.fs.size[{#FSNAME},used]',1537838879,0),(1514,28622,23286,'vfs.fs.size[{#FSNAME},used]',1537838879,0),(1515,28623,23286,'vfs.fs.size[{#FSNAME},used]',1537838879,0),(1516,28624,23286,'vfs.fs.size[{#FSNAME},used]',1537838879,0),(1517,28630,28626,'',0,0),(1518,28631,28627,'',0,0),(1519,28632,28628,'',0,0),(1520,28633,28629,'',0,0),(1521,28638,28634,'',0,0),(1522,28639,28635,'',0,0),(1523,28640,28636,'',0,0),(1524,28641,28637,'',0,0),(1525,28643,28639,'ip.[{#SQL_NAME_COL}]',1537841535,0),(1526,28644,28639,'ip.[{#SQL_NAME_COL}]',1537841535,0),(1527,28645,28639,'ip.[{#SQL_NAME_COL}]',1537841535,0),(1528,28646,28639,'ip.[{#SQL_NAME_COL}]',1537841535,0),(1529,28647,28639,'ip.[{#SQL_NAME_COL}]',1537841535,0),(1530,28648,28639,'ip.[{#SQL_NAME_COL}]',1537841535,0),(1531,28649,28639,'ip.[{#SQL_NAME_COL}]',1537841535,0),(1532,28650,28639,'ip.[{#SQL_NAME_COL}]',1537841535,0),(1533,28651,28639,'ip.[{#SQL_NAME_COL}]',1537841535,0),(1534,28652,28639,'ip.[{#SQL_NAME_COL}]',1537841535,0),(1535,28653,28639,'ip.[{#SQL_NAME_COL}]',1537841535,0),(1536,28654,28639,'ip.[{#SQL_NAME_COL}]',1537841535,0),(1537,28655,28639,'ip.[{#SQL_NAME_COL}]',1537841535,0),(1538,28656,28639,'ip.[{#SQL_NAME_COL}]',1537841535,0),(1539,28657,28639,'ip.[{#SQL_NAME_COL}]',1537841535,0),(1540,28658,28639,'ip.[{#SQL_NAME_COL}]',1537841535,0),(1541,28659,28639,'ip.[{#SQL_NAME_COL}]',1537841535,0),(1542,28660,28639,'ip.[{#SQL_NAME_COL}]',1537841535,0),(1543,28661,28639,'ip.[{#SQL_NAME_COL}]',1537841535,0),(1544,28662,28639,'ip.[{#SQL_NAME_COL}]',1537841535,0),(1545,28663,28639,'ip.[{#SQL_NAME_COL}]',1537841535,0),(1546,28664,28639,'ip.[{#SQL_NAME_COL}]',1537841535,0),(1547,28665,28639,'ip.[{#SQL_NAME_COL}]',1537841535,0),(1548,28666,28639,'ip.[{#SQL_NAME_COL}]',1537841535,0),(1549,28667,28639,'ip.[{#SQL_NAME_COL}]',1537841535,0),(1550,28668,28639,'ip.[{#SQL_NAME_COL}]',1537841535,0),(1551,28669,28639,'ip.[{#SQL_NAME_COL}]',1537841535,0),(1552,28670,28639,'ip.[{#SQL_NAME_COL}]',1537841535,0),(1553,28671,28641,'user.[{#SQL_NAME_COL}]',1537841537,0),(1554,28672,28641,'user.[{#SQL_NAME_COL}]',1537841537,0),(1555,28673,28641,'user.[{#SQL_NAME_COL}]',1537841537,0),(1556,28674,28641,'user.[{#SQL_NAME_COL}]',1537841537,0),(1557,28675,28641,'user.[{#SQL_NAME_COL}]',1536113387,1538705387),(1558,28676,28641,'user.[{#SQL_NAME_COL}]',1536113387,1538705387),(1559,28677,28641,'user.[{#SQL_NAME_COL}]',1536113387,1538705387),(1560,28779,28639,'ip.[{#SQL_NAME_COL}]',1537841535,0),(1561,28780,28639,'ip.[{#SQL_NAME_COL}]',1537841535,0),(1562,28781,28640,'menu.[{#SQL_NAME_COL}]',1537841536,0),(1563,28782,28640,'menu.[{#SQL_NAME_COL}]',1537841536,0),(1564,28783,28640,'menu.[{#SQL_NAME_COL}]',1537841536,0),(1565,28784,28640,'menu.[{#SQL_NAME_COL}]',1537841536,0),(1566,28785,28640,'menu.[{#SQL_NAME_COL}]',1536053956,1538645956),(1567,28786,28640,'menu.[{#SQL_NAME_COL}]',1537841536,0),(1568,28787,28640,'menu.[{#SQL_NAME_COL}]',1537841536,0),(1569,28788,28641,'user.[{#SQL_NAME_COL}]',1537841537,0),(1570,28789,28639,'ip.[{#SQL_NAME_COL}]',1537841535,0),(1571,28790,28638,'dep.[{#SQL_NAME_COL}]',1537841534,0),(1572,28791,28638,'dep.[{#SQL_NAME_COL}]',1537841534,0),(1573,28792,28641,'user.[{#SQL_NAME_COL}]',1536113387,1538705387),(1574,28805,28641,'user.[{#SQL_NAME_COL}]',1536113417,1538705417),(1575,28806,28639,'ip.[{#SQL_NAME_COL}]',1537841535,0),(1576,28807,28641,'user.[{#SQL_NAME_COL}]',1536113447,1538705447),(1577,28808,28639,'ip.[{#SQL_NAME_COL}]',1537841535,0),(1578,28811,28809,'',0,0),(1579,28812,28810,'',0,0),(1580,28815,28812,'num.[{#SQL_NAME_COL}]',1537841410,0),(1581,28816,28812,'num.[{#SQL_NAME_COL}]',1537841410,0),(1582,28817,28812,'num.[{#SQL_NAME_COL}]',1537841410,0),(1583,28818,28812,'num.[{#SQL_NAME_COL}]',1537841410,0),(1584,28819,28812,'num.[{#SQL_NAME_COL}]',1537841410,0),(1585,28820,28639,'ip.[{#SQL_NAME_COL}]',1537841535,0),(1586,28821,28639,'ip.[{#SQL_NAME_COL}]',1537841535,0),(1587,28822,28639,'ip.[{#SQL_NAME_COL}]',1537841535,0),(1588,28823,28639,'ip.[{#SQL_NAME_COL}]',1537841535,0),(1589,28826,28639,'ip.[{#SQL_NAME_COL}]',1537841535,0),(1590,28827,28639,'ip.[{#SQL_NAME_COL}]',1537841535,0),(1591,28828,28639,'ip.[{#SQL_NAME_COL}]',1537841535,0),(1592,28829,28639,'ip.[{#SQL_NAME_COL}]',1537841535,0),(1593,28832,28640,'menu.[{#SQL_NAME_COL}]',1536054376,1538646376),(1594,28833,28640,'menu.[{#SQL_NAME_COL}]',1537841536,0),(1595,28834,28641,'user.[{#SQL_NAME_COL}]',1536113537,1538705537),(1596,28835,28641,'user.[{#SQL_NAME_COL}]',1537841537,0),(1597,28836,28641,'user.[{#SQL_NAME_COL}]',1537841537,0),(1598,28837,28641,'user.[{#SQL_NAME_COL}]',1537841537,0),(1599,28838,28641,'user.[{#SQL_NAME_COL}]',1537841537,0),(1600,28839,28641,'user.[{#SQL_NAME_COL}]',1537841537,0),(1601,28840,28639,'ip.[{#SQL_NAME_COL}]',1537841535,0),(1602,28841,28639,'ip.[{#SQL_NAME_COL}]',1537841535,0),(1603,28842,28639,'ip.[{#SQL_NAME_COL}]',1537841535,0),(1738,29126,29121,'',0,0),(1739,29127,29122,'',0,0),(1740,29128,29123,'',0,0),(1741,29129,29124,'',0,0),(1742,29130,29125,'',0,0),(1743,29142,29129,'num.[{#SQL_NAME_COL}]',1537841424,0),(1744,29143,29129,'num.[{#SQL_NAME_COL}]',1537841424,0),(1745,29144,29129,'num.[{#SQL_NAME_COL}]',1537841424,0),(1746,29145,29129,'num.[{#SQL_NAME_COL}]',1537841424,0),(1747,29146,29129,'num.[{#SQL_NAME_COL}]',1537841424,0),(1748,29475,28639,'ip.[{#SQL_NAME_COL}]',1537841535,0),(1749,29546,28639,'ip.[{#SQL_NAME_COL}]',1537841535,0),(1750,29551,28641,'user.[{#SQL_NAME_COL}]',1537841537,0),(1751,29552,28639,'ip.[{#SQL_NAME_COL}]',1537841535,0);
/*!40000 ALTER TABLE `item_discovery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_preproc`
--

DROP TABLE IF EXISTS `item_preproc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_preproc` (
  `item_preprocid` bigint(20) unsigned NOT NULL,
  `itemid` bigint(20) unsigned NOT NULL,
  `step` int(11) NOT NULL DEFAULT '0',
  `type` int(11) NOT NULL DEFAULT '0',
  `params` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`item_preprocid`),
  KEY `item_preproc_1` (`itemid`,`step`),
  CONSTRAINT `c_item_preproc_1` FOREIGN KEY (`itemid`) REFERENCES `items` (`itemid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_preproc`
--

LOCK TABLES `item_preproc` WRITE;
/*!40000 ALTER TABLE `item_preproc` DISABLE KEYS */;
INSERT INTO `item_preproc` VALUES (457,26828,1,10,''),(458,26841,2,10,''),(459,26842,3,10,''),(460,26843,4,10,''),(461,26844,5,1,'0.001'),(462,26845,6,10,''),(463,26846,7,10,''),(464,26847,8,10,''),(465,26848,9,1,'0.001'),(466,26849,10,1,'0.001'),(467,26850,11,10,''),(468,26851,12,10,''),(469,26852,13,10,''),(470,26853,14,10,''),(471,26854,15,10,''),(472,26855,16,10,''),(473,26876,1,1,'0.001'),(474,26881,2,1,'100'),(475,26884,3,10,''),(476,26885,4,1,'0.001'),(477,26886,5,1,'0.001'),(478,26887,6,10,''),(479,26888,7,1,'0.001'),(480,26889,8,10,''),(481,26890,9,1,'0.001'),(482,26894,10,1,'0.001'),(483,26895,11,10,''),(484,26896,12,10,''),(485,26897,13,1,'0.001'),(486,26905,14,1,'0.001'),(487,26906,15,10,''),(488,23340,1,10,''),(495,26911,1,10,''),(496,26912,2,10,''),(497,26913,3,10,''),(498,26917,4,10,''),(499,26918,5,10,''),(500,26919,6,10,''),(501,26920,7,10,''),(502,26921,8,10,''),(503,26922,9,10,''),(504,26923,10,10,''),(505,22924,1,10,''),(506,22920,2,10,''),(507,22946,1,10,''),(508,22946,2,1,'8'),(509,22945,3,10,''),(510,22945,4,1,'8'),(511,22880,1,10,''),(512,22884,2,10,''),(513,23074,1,10,''),(514,23074,2,1,'8'),(515,23073,3,10,''),(516,23073,4,1,'8'),(517,22986,1,10,''),(518,22986,2,1,'8'),(519,22985,3,10,''),(520,22985,4,1,'8'),(521,22683,1,10,''),(522,22680,2,10,''),(523,23294,1,10,''),(524,23298,2,10,''),(525,22448,1,10,''),(526,22448,2,1,'8'),(527,22446,3,10,''),(528,22446,4,1,'8'),(529,23281,1,10,''),(530,23281,2,1,'8'),(531,23280,3,10,''),(532,23280,4,1,'8'),(533,23077,1,10,''),(534,23077,2,1,'8'),(535,23078,3,10,''),(536,23078,4,1,'8'),(537,22840,1,10,''),(538,22844,2,10,''),(539,23076,1,10,''),(540,23076,2,1,'8'),(541,23075,3,10,''),(542,23075,4,1,'8'),(543,23000,1,10,''),(544,23004,2,10,''),(545,23026,1,10,''),(546,23026,2,1,'8'),(547,23025,3,10,''),(548,23025,4,1,'8'),(549,23170,1,10,''),(550,23170,2,1,'8'),(551,23169,3,10,''),(552,23169,4,1,'8'),(3432,22196,1,10,''),(3433,22199,2,10,''),(3434,22187,3,10,''),(3435,23625,1,10,''),(3436,23628,2,10,''),(3437,23277,3,10,''),(4340,27159,1,1,'0.01'),(4341,27201,1,1,'0.01'),(4342,27234,2,1,'0.01'),(4343,27270,3,1,'0.01'),(4344,27291,4,1,'0.01'),(4345,27342,5,1,'0.01'),(4346,27374,6,1,'0.01'),(4347,27471,7,1,'0.01'),(4348,27505,8,1,'0.01'),(4349,27541,9,1,'0.01'),(4350,27577,10,1,'0.01'),(4351,27640,11,1,'0.01'),(4352,27663,12,1,'0.01'),(4353,27743,13,1,'0.01'),(4354,27775,14,1,'0.01'),(4355,27809,15,1,'0.01'),(4356,27891,16,1,'0.01'),(4357,27928,17,1,'0.01'),(4358,27965,18,1,'0.01'),(4359,27995,19,1,'0.01'),(4360,28079,20,1,'0.01'),(4361,28116,21,1,'0.01'),(4362,28139,22,1,'0.01'),(4363,28194,23,1,'0.01'),(4364,28242,24,1,'0.01'),(4365,27069,1,10,''),(4366,27072,2,10,''),(4367,27073,3,10,''),(4368,27074,4,10,''),(4369,27074,5,1,'8'),(4370,27075,6,10,''),(4371,27075,7,1,'8'),(4372,27076,8,10,''),(4373,27597,1,10,''),(4374,27600,2,10,''),(4375,27601,3,10,''),(4376,27599,4,10,''),(4377,27599,5,1,'8'),(4378,27602,6,10,''),(4379,27602,7,1,'8'),(4380,27598,8,10,''),(4381,28006,9,10,''),(4382,28009,10,10,''),(4383,28010,11,10,''),(4384,28008,12,10,''),(4385,28008,13,1,'8'),(4386,28011,14,10,''),(4387,28011,15,1,'8'),(4388,28007,16,10,''),(4389,27079,1,10,''),(4390,27082,2,10,''),(4391,27083,3,10,''),(4392,27084,4,10,''),(4393,27084,5,1,'8'),(4394,27085,6,10,''),(4395,27085,7,1,'8'),(4396,27086,8,10,''),(4397,27620,1,10,''),(4398,27623,2,10,''),(4399,27624,3,10,''),(4400,27622,4,10,''),(4401,27622,5,1,'8'),(4402,27625,6,10,''),(4403,27625,7,1,'8'),(4404,27621,8,10,''),(4405,27977,9,10,''),(4406,27980,10,10,''),(4407,27981,11,10,''),(4408,27979,12,10,''),(4409,27979,13,1,'8'),(4410,27982,14,10,''),(4411,27982,15,1,'8'),(4412,27978,16,10,''),(4413,27119,1,10,''),(4414,27121,2,1,'1000000'),(4415,27122,3,10,''),(4416,27123,4,10,''),(4417,27124,5,10,''),(4418,27124,6,1,'8'),(4419,27125,7,10,''),(4420,27125,8,1,'8'),(4421,27126,9,10,''),(4422,28098,1,10,''),(4423,28104,2,1,'1000000'),(4424,28101,3,10,''),(4425,28102,4,10,''),(4426,28100,5,10,''),(4427,28100,6,1,'8'),(4428,28103,7,10,''),(4429,28103,8,1,'8'),(4430,28099,9,10,''),(4431,27089,1,10,''),(4432,27091,2,1,'1000000'),(4433,27092,3,10,''),(4434,27093,4,10,''),(4435,27094,5,10,''),(4436,27094,6,1,'8'),(4437,27095,7,10,''),(4438,27095,8,1,'8'),(4439,27096,9,10,''),(4440,27099,1,10,''),(4441,27101,2,1,'1000000'),(4442,27102,3,10,''),(4443,27103,4,10,''),(4444,27104,5,10,''),(4445,27104,6,1,'8'),(4446,27105,7,10,''),(4447,27105,8,1,'8'),(4448,27106,9,10,''),(4449,27181,1,10,''),(4450,27187,2,1,'1000000'),(4451,27184,3,10,''),(4452,27185,4,10,''),(4453,27183,5,10,''),(4454,27183,6,1,'8'),(4455,27186,7,10,''),(4456,27186,8,1,'8'),(4457,27182,9,10,''),(4458,27216,10,10,''),(4459,27222,11,1,'1000000'),(4460,27219,12,10,''),(4461,27220,13,10,''),(4462,27218,14,10,''),(4463,27218,15,1,'8'),(4464,27221,16,10,''),(4465,27221,17,1,'8'),(4466,27217,18,10,''),(4467,27252,19,10,''),(4468,27258,20,1,'1000000'),(4469,27255,21,10,''),(4470,27256,22,10,''),(4471,27254,23,10,''),(4472,27254,24,1,'8'),(4473,27257,25,10,''),(4474,27257,26,1,'8'),(4475,27253,27,10,''),(4476,27273,28,10,''),(4477,27279,29,1,'1000000'),(4478,27276,30,10,''),(4479,27277,31,10,''),(4480,27275,32,10,''),(4481,27275,33,1,'8'),(4482,27278,34,10,''),(4483,27278,35,1,'8'),(4484,27274,36,10,''),(4485,27322,37,10,''),(4486,27328,38,1,'1000000'),(4487,27325,39,10,''),(4488,27326,40,10,''),(4489,27324,41,10,''),(4490,27324,42,1,'8'),(4491,27327,43,10,''),(4492,27327,44,1,'8'),(4493,27323,45,10,''),(4494,27451,46,10,''),(4495,27457,47,1,'1000000'),(4496,27454,48,10,''),(4497,27455,49,10,''),(4498,27453,50,10,''),(4499,27453,51,1,'8'),(4500,27456,52,10,''),(4501,27456,53,1,'8'),(4502,27452,54,10,''),(4503,27487,55,10,''),(4504,27493,56,1,'1000000'),(4505,27490,57,10,''),(4506,27491,58,10,''),(4507,27489,59,10,''),(4508,27489,60,1,'8'),(4509,27492,61,10,''),(4510,27492,62,1,'8'),(4511,27488,63,10,''),(4512,27521,64,10,''),(4513,27527,65,1,'1000000'),(4514,27524,66,10,''),(4515,27525,67,10,''),(4516,27523,68,10,''),(4517,27523,69,1,'8'),(4518,27526,70,10,''),(4519,27526,71,1,'8'),(4520,27522,72,10,''),(4521,27557,73,10,''),(4522,27563,74,1,'1000000'),(4523,27560,75,10,''),(4524,27561,76,10,''),(4525,27559,77,10,''),(4526,27559,78,1,'8'),(4527,27562,79,10,''),(4528,27562,80,1,'8'),(4529,27558,81,10,''),(4530,27643,82,10,''),(4531,27649,83,1,'1000000'),(4532,27646,84,10,''),(4533,27647,85,10,''),(4534,27645,86,10,''),(4535,27645,87,1,'8'),(4536,27648,88,10,''),(4537,27648,89,1,'8'),(4538,27644,90,10,''),(4539,27723,91,10,''),(4540,27729,92,1,'1000000'),(4541,27726,93,10,''),(4542,27727,94,10,''),(4543,27725,95,10,''),(4544,27725,96,1,'8'),(4545,27728,97,10,''),(4546,27728,98,1,'8'),(4547,27724,99,10,''),(4548,27757,100,10,''),(4549,27763,101,1,'1000000'),(4550,27760,102,10,''),(4551,27761,103,10,''),(4552,27759,104,10,''),(4553,27759,105,1,'8'),(4554,27762,106,10,''),(4555,27762,107,1,'8'),(4556,27758,108,10,''),(4557,27789,109,10,''),(4558,27795,110,1,'1000000'),(4559,27792,111,10,''),(4560,27793,112,10,''),(4561,27791,113,10,''),(4562,27791,114,1,'8'),(4563,27794,115,10,''),(4564,27794,116,1,'8'),(4565,27790,117,10,''),(4566,27873,118,10,''),(4567,27879,119,1,'1000000'),(4568,27876,120,10,''),(4569,27877,121,10,''),(4570,27875,122,10,''),(4571,27875,123,1,'8'),(4572,27878,124,10,''),(4573,27878,125,1,'8'),(4574,27874,126,10,''),(4575,27910,127,10,''),(4576,27916,128,1,'1000000'),(4577,27913,129,10,''),(4578,27914,130,10,''),(4579,27912,131,10,''),(4580,27912,132,1,'8'),(4581,27915,133,10,''),(4582,27915,134,1,'8'),(4583,27911,135,10,''),(4584,27945,136,10,''),(4585,27951,137,1,'1000000'),(4586,27948,138,10,''),(4587,27949,139,10,''),(4588,27947,140,10,''),(4589,27947,141,1,'8'),(4590,27950,142,10,''),(4591,27950,143,1,'8'),(4592,27946,144,10,''),(4593,28059,145,10,''),(4594,28065,146,1,'1000000'),(4595,28062,147,10,''),(4596,28063,148,10,''),(4597,28061,149,10,''),(4598,28061,150,1,'8'),(4599,28064,151,10,''),(4600,28064,152,1,'8'),(4601,28060,153,10,''),(4602,28119,154,10,''),(4603,28125,155,1,'1000000'),(4604,28122,156,10,''),(4605,28123,157,10,''),(4606,28121,158,10,''),(4607,28121,159,1,'8'),(4608,28124,160,10,''),(4609,28124,161,1,'8'),(4610,28120,162,10,''),(4611,28176,163,10,''),(4612,28182,164,1,'1000000'),(4613,28179,165,10,''),(4614,28180,166,10,''),(4615,28178,167,10,''),(4616,28178,168,1,'8'),(4617,28181,169,10,''),(4618,28181,170,1,'8'),(4619,28177,171,10,''),(4620,28224,172,10,''),(4621,28230,173,1,'1000000'),(4622,28227,174,10,''),(4623,28228,175,10,''),(4624,28226,176,10,''),(4625,28226,177,1,'8'),(4626,28229,178,10,''),(4627,28229,179,1,'8'),(4628,28225,180,10,''),(4629,27148,1,1,'0.01'),(4630,27617,1,1,'0.01'),(4631,28024,2,1,'0.01'),(4632,27897,1,1,'0.1'),(4633,27898,2,1,'1024'),(4634,27900,3,1,'1024'),(4635,27905,1,1,'0.1'),(4636,27907,2,1,'1024'),(4637,27908,3,1,'1024'),(4638,27203,1,5,'^(\\w|-|\\.|/)+ (\\w|-|\\.|/)+ (.+) Copyright\n\\3'),(4639,27204,2,5,'^((\\w|-|\\.|/)+)\n\\1'),(4640,27206,3,1,'1024'),(4641,27207,4,1,'1024'),(4642,27777,1,5,'Firmware Version: ([0-9.]+),\n\\1'),(4643,27778,2,5,'(.+) - Firmware\n\\1'),(4644,27377,1,5,'Version (.+), RELEASE\n\\1'),(4645,27381,1,5,'Version (.+), RELEASE\n\\1'),(4646,27384,2,5,'Version (.+), RELEASE\n\\1'),(4647,28211,3,5,'Version (.+), RELEASE\n\\1'),(4648,27591,1,1,'1024'),(4649,27592,2,1,'1024'),(4650,27811,1,5,'kernel (JUNOS [0-9a-zA-Z\\.]+)\n\\1'),(4651,27314,1,1,'0.5'),(4652,27315,2,1,'0.5'),(4653,27318,3,1,'0.5'),(4654,28201,1,1,'0.1'),(4655,27936,1,5,'60 Secs \\( ([0-9\\.]+)%\\).+300 Secs\n\\1'),(4656,28029,1,1,'1024'),(4657,28030,2,1,'1024'),(4781,28589,3,10,''),(4782,28589,4,1,'8'),(4783,28590,3,10,''),(4784,28590,4,1,'8'),(4785,28591,3,10,''),(4786,28591,4,1,'8'),(4787,28592,3,10,''),(4788,28592,4,1,'8'),(4789,28593,3,10,''),(4790,28593,4,1,'8'),(4791,28594,3,10,''),(4792,28594,4,1,'8'),(4793,28595,3,10,''),(4794,28595,4,1,'8'),(4795,28596,3,10,''),(4796,28596,4,1,'8'),(4797,28597,1,10,''),(4798,28597,2,1,'8'),(4799,28598,1,10,''),(4800,28598,2,1,'8'),(4801,28599,1,10,''),(4802,28599,2,1,'8'),(4803,28600,1,10,''),(4804,28600,2,1,'8'),(4805,28601,1,10,''),(4806,28601,2,1,'8'),(4807,28602,1,10,''),(4808,28602,2,1,'8'),(4809,28603,1,10,''),(4810,28603,2,1,'8'),(4811,28604,1,10,''),(4812,28604,2,1,'8'),(4829,28711,1,10,''),(4830,28712,2,10,''),(4831,28713,3,10,''),(4832,28714,4,10,''),(4833,28715,5,10,''),(4834,28716,6,10,''),(4835,28717,7,10,''),(4836,28718,8,10,''),(4837,28719,9,10,''),(4838,28720,10,10,'');
/*!40000 ALTER TABLE `item_preproc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `items` (
  `itemid` bigint(20) unsigned NOT NULL,
  `type` int(11) NOT NULL DEFAULT '0',
  `snmp_community` varchar(64) NOT NULL DEFAULT '',
  `snmp_oid` varchar(512) NOT NULL DEFAULT '',
  `hostid` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `key_` varchar(255) NOT NULL DEFAULT '',
  `delay` varchar(1024) NOT NULL DEFAULT '0',
  `history` varchar(255) NOT NULL DEFAULT '90d',
  `trends` varchar(255) NOT NULL DEFAULT '365d',
  `status` int(11) NOT NULL DEFAULT '0',
  `value_type` int(11) NOT NULL DEFAULT '0',
  `trapper_hosts` varchar(255) NOT NULL DEFAULT '',
  `units` varchar(255) NOT NULL DEFAULT '',
  `snmpv3_securityname` varchar(64) NOT NULL DEFAULT '',
  `snmpv3_securitylevel` int(11) NOT NULL DEFAULT '0',
  `snmpv3_authpassphrase` varchar(64) NOT NULL DEFAULT '',
  `snmpv3_privpassphrase` varchar(64) NOT NULL DEFAULT '',
  `formula` varchar(255) NOT NULL DEFAULT '',
  `error` varchar(2048) NOT NULL DEFAULT '',
  `lastlogsize` bigint(20) unsigned NOT NULL DEFAULT '0',
  `logtimefmt` varchar(64) NOT NULL DEFAULT '',
  `templateid` bigint(20) unsigned DEFAULT NULL,
  `valuemapid` bigint(20) unsigned DEFAULT NULL,
  `params` text NOT NULL,
  `ipmi_sensor` varchar(128) NOT NULL DEFAULT '',
  `authtype` int(11) NOT NULL DEFAULT '0',
  `username` varchar(64) NOT NULL DEFAULT '',
  `password` varchar(64) NOT NULL DEFAULT '',
  `publickey` varchar(64) NOT NULL DEFAULT '',
  `privatekey` varchar(64) NOT NULL DEFAULT '',
  `mtime` int(11) NOT NULL DEFAULT '0',
  `flags` int(11) NOT NULL DEFAULT '0',
  `interfaceid` bigint(20) unsigned DEFAULT NULL,
  `port` varchar(64) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `inventory_link` int(11) NOT NULL DEFAULT '0',
  `lifetime` varchar(255) NOT NULL DEFAULT '30d',
  `snmpv3_authprotocol` int(11) NOT NULL DEFAULT '0',
  `snmpv3_privprotocol` int(11) NOT NULL DEFAULT '0',
  `state` int(11) NOT NULL DEFAULT '0',
  `snmpv3_contextname` varchar(255) NOT NULL DEFAULT '',
  `evaltype` int(11) NOT NULL DEFAULT '0',
  `jmx_endpoint` varchar(255) NOT NULL DEFAULT '',
  `master_itemid` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`itemid`),
  UNIQUE KEY `items_1` (`hostid`,`key_`),
  KEY `items_3` (`status`),
  KEY `items_4` (`templateid`),
  KEY `items_5` (`valuemapid`),
  KEY `items_6` (`interfaceid`),
  KEY `items_7` (`master_itemid`),
  CONSTRAINT `c_items_1` FOREIGN KEY (`hostid`) REFERENCES `hosts` (`hostid`) ON DELETE CASCADE,
  CONSTRAINT `c_items_2` FOREIGN KEY (`templateid`) REFERENCES `items` (`itemid`) ON DELETE CASCADE,
  CONSTRAINT `c_items_3` FOREIGN KEY (`valuemapid`) REFERENCES `valuemaps` (`valuemapid`),
  CONSTRAINT `c_items_4` FOREIGN KEY (`interfaceid`) REFERENCES `interface` (`interfaceid`),
  CONSTRAINT `c_items_5` FOREIGN KEY (`master_itemid`) REFERENCES `items` (`itemid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
/*!40000 ALTER TABLE `items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `items_applications`
--

DROP TABLE IF EXISTS `items_applications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `items_applications` (
  `itemappid` bigint(20) unsigned NOT NULL,
  `applicationid` bigint(20) unsigned NOT NULL,
  `itemid` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`itemappid`),
  UNIQUE KEY `items_applications_1` (`applicationid`,`itemid`),
  KEY `items_applications_2` (`itemid`),
  CONSTRAINT `c_items_applications_1` FOREIGN KEY (`applicationid`) REFERENCES `applications` (`applicationid`) ON DELETE CASCADE,
  CONSTRAINT `c_items_applications_2` FOREIGN KEY (`itemid`) REFERENCES `items` (`itemid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items_applications`
--

LOCK TABLES `items_applications` WRITE;
/*!40000 ALTER TABLE `items_applications` DISABLE KEYS */;
INSERT INTO `items_applications` VALUES (7293,1,10016),(7296,1,10025),(7308,1,10055),(7324,1,10056),(7282,1,10057),(7289,1,10058),(7306,1,17318),(7280,1,17352),(7378,5,22452),(7379,5,22454),(7376,5,22456),(7375,5,22458),(7377,5,22686),(7374,7,22446),(7373,7,22448),(7307,9,10009),(7309,9,10013),(7303,13,10010),(7320,13,17354),(7285,13,17356),(7316,13,17358),(7283,13,17360),(7314,13,17362),(7297,13,22665),(7299,13,22668),(7318,13,22671),(7310,13,22674),(7312,13,22677),(7322,13,22680),(7301,13,22683),(7277,15,10014),(7291,15,10026),(7287,15,10030),(7278,15,17350),(7290,15,22181),(7304,17,10010),(7321,17,17354),(7286,17,17356),(7317,17,17358),(7284,17,17360),(7315,17,17362),(7298,17,22665),(7300,17,22668),(7319,17,22671),(7311,17,22674),(7313,17,22677),(7323,17,22680),(7302,17,22683),(7295,21,10025),(7281,21,10057),(7288,21,10058),(7305,21,17318),(7279,21,17352),(7294,23,10016),(7292,23,10019),(15407,179,22183),(15409,179,22185),(15429,179,22187),(15401,179,22189),(15395,179,22191),(15402,179,22196),(15404,179,22199),(15399,179,22219),(15408,179,22396),(15425,179,22399),(15397,179,22400),(15398,179,22401),(15413,179,22402),(15396,179,22404),(15418,179,22406),(15419,179,22408),(15415,179,22412),(15421,179,22414),(15423,179,22416),(15420,179,22418),(15428,179,22420),(15417,179,22422),(15412,179,22424),(15410,179,22426),(15416,179,22430),(15424,179,22689),(15411,179,23171),(15400,179,23251),(15406,179,23634),(15405,179,23661),(15403,179,23663),(15422,179,25366),(15414,179,25370),(15426,179,25665),(15427,179,25666),(15393,179,28248),(6983,206,22231),(6984,206,22232),(6985,206,23318),(6987,207,10020),(6986,207,10059),(6988,207,23319),(6990,252,22833),(6989,252,22834),(6991,252,23320),(7441,253,22840),(7456,253,22841),(7446,253,22842),(7448,253,22843),(7454,253,22844),(7452,253,22845),(7450,253,22846),(7437,253,22848),(7435,253,22851),(7423,253,22852),(7464,254,22868),(7465,254,22869),(7462,254,22870),(7461,254,22871),(7463,254,22872),(7439,255,22839),(7421,255,22853),(7419,255,22854),(7426,255,22858),(7433,255,22859),(7417,256,22855),(7418,256,22856),(7425,256,22857),(7428,256,22862),(7429,256,22863),(7460,257,23075),(7459,257,23076),(7458,258,22835),(7445,258,22836),(7440,258,22839),(7422,258,22853),(7420,258,22854),(7427,258,22858),(7434,258,22859),(7431,258,22860),(7442,259,22840),(7457,259,22841),(7447,259,22842),(7449,259,22843),(7455,259,22844),(7453,259,22845),(7451,259,22846),(7438,259,22848),(7436,259,22851),(7424,259,22852),(7444,260,22837),(7443,260,22838),(7432,261,22860),(7430,261,22861),(6993,262,22873),(6992,262,22874),(6994,262,23321),(7220,263,22880),(7235,263,22881),(7225,263,22882),(7227,263,22883),(7233,263,22884),(7231,263,22885),(7229,263,22886),(7216,263,22888),(7214,263,22891),(7202,263,22892),(7243,264,22908),(7244,264,22909),(7241,264,22910),(7240,264,22911),(7242,264,22912),(7218,265,22879),(7200,265,22893),(7198,265,22894),(7205,265,22898),(7212,265,22899),(7196,266,22895),(7197,266,22896),(7204,266,22897),(7207,266,22902),(7208,266,22903),(7239,267,23073),(7238,267,23074),(7237,268,22875),(7224,268,22876),(7219,268,22879),(7201,268,22893),(7199,268,22894),(7206,268,22898),(7213,268,22899),(7210,268,22900),(7221,269,22880),(7236,269,22881),(7226,269,22882),(7228,269,22883),(7234,269,22884),(7232,269,22885),(7230,269,22886),(7217,269,22888),(7215,269,22891),(7203,269,22892),(7223,270,22877),(7222,270,22878),(7211,271,22900),(7209,271,22901),(6996,272,22913),(6995,272,22914),(6997,272,23322),(7160,273,22920),(7155,273,22921),(7162,273,22922),(7157,273,22923),(7149,273,22924),(7164,273,23108),(7167,273,23109),(7180,273,23110),(7182,273,23111),(7185,273,23112),(7178,273,23113),(7176,273,23114),(7170,273,23115),(7147,273,23118),(7145,273,23119),(7126,273,23120),(7128,273,23121),(7124,273,23123),(7194,274,22948),(7195,274,22949),(7192,274,22950),(7191,274,22951),(7193,274,22952),(7172,274,23116),(7174,274,23117),(7151,275,22933),(7153,275,22934),(7143,275,22938),(7139,275,22939),(7135,276,22942),(7136,276,22943),(7130,276,23122),(7123,276,23124),(7120,276,23125),(7121,276,23126),(7122,276,23127),(7132,276,23128),(7133,276,23129),(7141,276,23130),(7142,276,23131),(7190,277,22945),(7189,277,22946),(7152,278,22933),(7154,278,22934),(7144,278,22938),(7140,278,22939),(7137,278,22940),(7161,279,22920),(7156,279,22921),(7163,279,22922),(7158,279,22923),(7150,279,22924),(7166,279,23108),(7169,279,23109),(7181,279,23110),(7184,279,23111),(7187,279,23112),(7179,279,23113),(7177,279,23114),(7171,279,23115),(7173,279,23116),(7175,279,23117),(7146,279,23119),(7127,279,23120),(7129,279,23121),(7131,279,23122),(7125,279,23123),(7188,280,22917),(7159,280,22918),(7138,281,22940),(7134,281,22941),(6999,282,22953),(6998,282,22954),(7000,282,23323),(7258,283,22961),(7268,283,22962),(7260,283,22963),(7262,283,22965),(7264,283,22968),(7266,283,22971),(7256,283,22972),(7275,284,22988),(7276,284,22989),(7273,284,22990),(7272,284,22991),(7274,284,22992),(7254,285,22973),(7247,285,22974),(7245,285,22978),(7253,286,22982),(7252,286,22983),(7271,287,22985),(7270,287,22986),(7255,288,22973),(7248,288,22974),(7246,288,22978),(7249,288,22980),(7259,289,22961),(7269,289,22962),(7261,289,22963),(7263,289,22965),(7265,289,22968),(7267,289,22971),(7257,289,22972),(7250,291,22980),(7251,291,22981),(7002,292,22993),(7001,292,22994),(7003,292,23324),(7486,293,23000),(7502,293,23001),(7492,293,23002),(7494,293,23003),(7500,293,23004),(7498,293,23005),(7496,293,23007),(7484,293,23011),(7482,293,23012),(7510,294,23028),(7511,294,23029),(7508,294,23030),(7507,294,23031),(7509,294,23032),(7488,295,22999),(7471,295,23013),(7469,295,23014),(7473,295,23018),(7475,295,23019),(7468,296,23015),(7466,296,23016),(7467,296,23017),(7478,296,23022),(7477,296,23023),(7506,297,23025),(7505,297,23026),(7504,298,22996),(7489,298,22999),(7472,298,23013),(7470,298,23014),(7474,298,23018),(7476,298,23019),(7480,298,23020),(7487,299,23000),(7503,299,23001),(7493,299,23002),(7495,299,23003),(7501,299,23004),(7499,299,23005),(7497,299,23007),(7485,299,23011),(7483,299,23012),(7491,300,22997),(7490,300,22998),(7481,301,23020),(7479,301,23021),(7005,302,23033),(7004,302,23034),(7006,302,23325),(7400,303,23041),(7409,303,23042),(7407,303,23043),(7415,304,23068),(7416,304,23069),(7413,304,23070),(7412,304,23071),(7414,304,23072),(7405,305,23039),(7398,305,23053),(7391,305,23054),(7389,305,23058),(7387,305,23059),(7397,306,23062),(7396,306,23063),(7402,307,23077),(7404,307,23078),(7411,308,23035),(7403,308,23036),(7406,308,23039),(7399,308,23053),(7392,308,23054),(7390,308,23058),(7388,308,23059),(7393,308,23060),(7401,309,23041),(7410,309,23042),(7408,309,23043),(7394,311,23060),(7395,311,23061),(7512,319,23149),(7516,319,23150),(7528,320,23134),(7530,320,23135),(7535,320,23136),(7526,320,23137),(7532,320,23143),(7521,320,23144),(7523,320,23145),(7538,321,23666),(7527,322,23134),(7529,322,23135),(7534,322,23136),(7525,322,23137),(7542,322,23164),(7541,322,23165),(7540,322,23167),(7539,322,23168),(7524,323,23138),(7513,323,23149),(7533,324,23140),(7531,325,23143),(7520,325,23144),(7522,325,23145),(7515,328,23147),(7514,328,23148),(7517,328,23158),(7519,328,23159),(7518,328,23668),(7008,329,23160),(7007,329,23161),(7009,329,23326),(7537,330,23169),(7536,330,23170),(7165,331,23108),(7168,331,23109),(7183,331,23111),(7186,331,23112),(7148,331,23118),(15447,345,23252),(15450,345,23253),(15451,345,23255),(15452,345,23256),(15453,345,23257),(15454,345,23258),(15448,345,23259),(15455,345,23260),(15458,345,23261),(15459,345,23262),(15460,345,23264),(15463,345,23265),(15456,345,23266),(15446,345,23267),(15445,345,23268),(15431,345,23269),(15432,345,23270),(15434,345,23271),(15435,345,23272),(15436,345,23273),(15442,345,23274),(15443,345,23275),(15444,345,23276),(15464,345,23277),(15433,345,23328),(15430,345,23620),(15437,345,23625),(15439,345,23628),(15441,345,23635),(15440,345,23662),(15438,345,23664),(15457,345,25367),(15449,345,25371),(15461,345,25667),(15462,345,25668),(15394,345,28249),(7349,346,23294),(7360,346,23295),(7351,346,23296),(7358,346,23297),(7370,346,23298),(7368,346,23299),(7366,346,23300),(7362,346,23301),(7364,346,23302),(7347,346,23303),(7345,346,23304),(7331,346,23305),(7333,346,23306),(7386,347,23282),(7385,347,23283),(7384,347,23284),(7383,347,23285),(7382,347,23286),(18979,347,28605),(18980,347,28606),(18977,347,28607),(18972,347,28608),(18971,347,28609),(18976,347,28610),(18975,347,28611),(18969,347,28612),(18978,347,28613),(18986,347,28614),(18974,347,28615),(18984,347,28616),(18968,347,28617),(18983,347,28618),(18973,347,28619),(18982,347,28620),(18981,347,28621),(18985,347,28622),(18967,347,28623),(18970,347,28624),(7354,348,23293),(7330,348,23307),(7328,348,23308),(7337,348,23312),(7344,348,23313),(7325,349,23309),(7326,349,23310),(7335,349,23311),(7338,349,23316),(7339,349,23317),(7381,350,23280),(7380,350,23281),(18958,350,28589),(18957,350,28590),(18952,350,28591),(18953,350,28592),(18964,350,28593),(18966,350,28594),(18951,350,28595),(18962,350,28596),(18961,350,28597),(18954,350,28598),(18965,350,28599),(18960,350,28600),(18963,350,28601),(18959,350,28602),(18956,350,28603),(18955,350,28604),(7372,351,23289),(7356,351,23290),(7353,351,23293),(7329,351,23307),(7327,351,23308),(7336,351,23312),(7343,351,23313),(7341,351,23314),(7350,352,23294),(7361,352,23295),(7352,352,23296),(7359,352,23297),(7371,352,23298),(7369,352,23299),(7367,352,23300),(7363,352,23301),(7365,352,23302),(7348,352,23303),(7346,352,23304),(7332,352,23305),(7334,352,23306),(7357,353,23291),(7355,353,23292),(7342,354,23314),(7340,354,23315),(7011,355,23287),(7010,355,23288),(7012,355,23327),(7019,356,23340),(7020,356,23341),(7021,356,23342),(7023,356,23343),(7016,356,23344),(7014,356,23345),(7013,356,23346),(7035,356,23347),(7024,356,23348),(7031,356,23349),(7025,356,23350),(7026,356,23351),(7027,356,23352),(7029,356,23353),(7030,356,23354),(7032,356,23355),(7034,356,23356),(7022,356,23357),(7018,356,23358),(7017,356,23359),(7028,356,23360),(7033,356,25368),(7015,356,25369),(6917,446,23644),(6974,447,23645),(6973,448,23646),(6975,449,23647),(6976,450,23648),(6977,451,23649),(6978,452,23650),(6979,453,23651),(6980,454,23652),(6981,455,23653),(6982,456,23654),(6887,727,26826),(6888,727,26827),(6892,727,26831),(6893,727,26832),(6904,727,26843),(6905,727,26844),(6906,727,26845),(6907,727,26846),(6916,727,26855),(6885,728,26824),(6897,728,26836),(6898,728,26837),(6899,728,26838),(6902,728,26841),(6903,728,26842),(6908,728,26847),(6909,728,26848),(6914,728,26853),(6894,729,26833),(6895,729,26834),(6896,729,26835),(6910,729,26849),(6911,729,26850),(6912,729,26851),(6913,729,26852),(6915,729,26854),(6889,730,26828),(6890,730,26829),(6891,730,26830),(6900,730,26839),(6901,730,26840),(6886,731,26825),(6953,732,26891),(6954,732,26892),(6972,732,26910),(6955,733,26893),(6956,733,26894),(6946,734,26884),(6947,734,26885),(6948,734,26886),(6949,734,26887),(6950,734,26888),(6951,734,26889),(6952,734,26890),(6957,734,26895),(6958,734,26896),(6959,734,26897),(6967,734,26905),(6968,734,26906),(6960,735,26898),(6961,735,26899),(6965,735,26903),(6966,735,26904),(6969,735,26907),(6970,735,26908),(6971,735,26909),(6918,736,26856),(6919,736,26857),(6920,736,26858),(6921,736,26859),(6922,736,26860),(6923,736,26861),(6924,736,26862),(6925,736,26863),(6926,736,26864),(6927,736,26865),(6928,736,26866),(6929,736,26867),(6930,736,26868),(6931,736,26869),(6939,736,26877),(6940,736,26878),(6944,736,26882),(6945,736,26883),(6962,736,26900),(6963,736,26901),(6964,736,26902),(6941,737,26879),(6942,737,26880),(6943,737,26881),(6933,738,26871),(6937,738,26875),(6938,738,26876),(6932,739,26870),(6934,739,26872),(6935,739,26873),(6936,739,26874),(7106,740,26911),(7107,740,26912),(7108,740,26913),(7109,740,26914),(7110,740,26915),(7111,740,26916),(7112,740,26917),(7113,740,26918),(7114,740,26919),(7115,740,26920),(7116,740,26921),(7117,740,26922),(7118,740,26923),(7119,740,26924),(7545,741,26927),(7546,742,26928),(7543,743,26925),(7544,743,26926),(7547,743,26929),(7548,743,26930),(7549,743,26931),(7550,743,26932),(7553,744,26935),(7554,744,26936),(7551,745,26933),(7561,745,26943),(7552,746,26934),(7555,746,26937),(7556,746,26938),(7557,746,26939),(7558,746,26940),(7559,746,26941),(7560,746,26942),(7610,747,26994),(7562,748,26944),(7563,748,26945),(7564,749,26946),(7575,750,26957),(7576,750,26958),(7577,750,26959),(7615,751,26999),(7616,751,27000),(7617,751,27001),(7618,751,27002),(7619,752,27003),(7620,752,27004),(7621,752,27005),(7622,752,27006),(7568,753,26950),(7570,753,26952),(7578,753,26960),(7579,753,26961),(7583,753,26965),(7611,754,26995),(7612,754,26996),(7613,754,26997),(7614,754,26998),(7565,755,26947),(7566,755,26948),(7567,755,26949),(7573,755,26955),(7574,755,26956),(7580,755,26962),(7581,755,26963),(7582,755,26964),(7569,757,26951),(7571,757,26953),(7572,757,26954),(7595,758,26977),(7599,758,26980),(7600,758,26981),(7602,758,26982),(7607,758,26985),(7623,759,27007),(7624,759,27008),(7625,759,27009),(7626,759,27010),(7588,760,26970),(7589,760,26971),(7590,760,26972),(7591,760,26973),(7592,760,26974),(7597,760,26978),(7598,760,26979),(7609,760,26986),(7593,761,26975),(7594,761,26976),(7596,761,26977),(7601,761,26981),(7603,761,26982),(7604,761,26983),(7605,761,26984),(7608,761,26985),(7586,762,26968),(7587,762,26969),(7606,762,26984),(7584,763,26966),(7585,763,26967),(17874,770,27030),(17876,771,27032),(18250,772,27040),(18251,772,27041),(18252,772,27042),(18256,772,27046),(18257,772,27047),(18258,772,27048),(18247,773,27037),(18248,773,27038),(18249,773,27039),(18253,774,27043),(18254,774,27044),(18255,774,27045),(18246,775,27036),(18263,776,27056),(18264,776,27057),(18265,776,27058),(18269,776,27062),(18270,776,27063),(18271,776,27064),(18260,777,27053),(18261,777,27054),(18262,777,27055),(18266,778,27059),(18267,778,27060),(18268,778,27061),(18259,779,27052),(17943,780,27065),(17944,780,27066),(17945,780,27067),(17889,781,27069),(17890,781,27070),(17891,781,27071),(17892,781,27072),(17893,781,27073),(17894,781,27074),(17895,781,27075),(17896,781,27076),(17897,781,27077),(17916,782,27079),(17917,782,27080),(17918,782,27081),(17919,782,27082),(17920,782,27083),(17921,782,27084),(17922,782,27085),(17923,782,27086),(17924,782,27087),(18048,783,27089),(18049,783,27090),(18050,783,27091),(18051,783,27092),(18052,783,27093),(18053,783,27094),(18054,783,27095),(18055,783,27096),(18056,783,27097),(18057,784,27099),(18058,784,27100),(18059,784,27101),(18060,784,27102),(18061,784,27103),(18062,784,27104),(18063,784,27105),(18064,784,27106),(18065,784,27107),(18030,786,27119),(18031,786,27120),(18032,786,27121),(18033,786,27122),(18034,786,27123),(18035,786,27124),(18036,786,27125),(18037,786,27126),(18038,786,27127),(17948,797,27138),(17947,797,27139),(17946,797,27140),(18313,797,27143),(18318,797,27148),(18311,798,27141),(18312,798,27142),(18314,798,27144),(18315,798,27145),(18316,798,27146),(18317,798,27147),(17951,799,27149),(17950,799,27150),(17949,799,27151),(17676,799,27154),(17681,799,27159),(17674,800,27152),(17675,800,27153),(17677,800,27155),(17678,800,27156),(17679,800,27157),(17680,800,27158),(18066,803,27181),(18073,803,27182),(18071,803,27183),(18069,803,27184),(18070,803,27185),(18072,803,27186),(18068,803,27187),(18074,803,27188),(18067,803,27189),(17877,803,27191),(17687,804,27195),(17686,804,27196),(17683,804,27197),(17688,804,27198),(17682,804,27199),(17685,804,27200),(17954,805,27192),(17953,805,27193),(17952,805,27194),(17689,805,27201),(17684,805,27202),(18353,806,27208),(18350,807,27205),(18351,807,27206),(18352,807,27207),(18354,808,27212),(18355,809,27213),(18348,810,27203),(18349,810,27204),(18356,810,27214),(18075,811,27216),(18082,811,27217),(18080,811,27218),(18078,811,27219),(18079,811,27220),(18081,811,27221),(18077,811,27222),(18083,811,27223),(18076,811,27224),(17695,812,27228),(17694,812,27229),(17691,812,27230),(17696,812,27231),(17690,812,27232),(17693,812,27233),(17957,813,27225),(17956,813,27226),(17955,813,27227),(17697,813,27234),(17692,813,27235),(18528,813,27238),(18530,814,27240),(18529,815,27239),(18531,816,27246),(18532,816,27247),(18533,817,27248),(18534,818,27249),(18535,818,27250),(18526,819,27236),(18527,819,27237),(18084,820,27252),(18091,820,27253),(18089,820,27254),(18087,820,27255),(18088,820,27256),(18090,820,27257),(18086,820,27258),(18092,820,27259),(18085,820,27260),(17703,821,27264),(17702,821,27265),(17699,821,27266),(17704,821,27267),(17698,821,27268),(17701,821,27269),(17960,822,27261),(17959,822,27262),(17958,822,27263),(17705,822,27270),(17700,822,27271),(18093,823,27273),(18100,823,27274),(18098,823,27275),(18096,823,27276),(18097,823,27277),(18099,823,27278),(18095,823,27279),(18101,823,27280),(18094,823,27281),(17711,824,27285),(17710,824,27286),(17707,824,27287),(17712,824,27288),(17706,824,27289),(17709,824,27290),(17963,825,27282),(17962,825,27283),(17961,825,27284),(17713,825,27291),(17708,825,27292),(18502,826,27294),(18501,827,27293),(18512,828,27314),(18513,828,27315),(18510,829,27312),(18511,830,27313),(18503,831,27295),(18504,831,27296),(18516,832,27318),(18514,833,27316),(18515,834,27317),(18505,835,27297),(18517,835,27319),(18518,835,27320),(18507,836,27299),(18506,837,27298),(18509,838,27301),(18508,839,27300),(18102,840,27322),(18109,840,27323),(18107,840,27324),(18105,840,27325),(18106,840,27326),(18108,840,27327),(18104,840,27328),(18110,840,27329),(18103,840,27330),(17878,840,27332),(17719,841,27336),(17718,841,27337),(17715,841,27338),(17720,841,27339),(17714,841,27340),(17717,841,27341),(17966,842,27333),(17965,842,27334),(17964,842,27335),(17721,842,27342),(17716,842,27343),(17727,846,27368),(17726,846,27369),(17723,846,27370),(17728,846,27371),(17722,846,27372),(17725,846,27373),(17969,847,27365),(17968,847,27366),(17967,847,27367),(17729,847,27374),(17724,847,27375),(18396,848,27414),(18397,848,27415),(18398,848,27416),(18399,849,27417),(18382,851,27376),(18383,852,27377),(18384,852,27378),(18385,852,27379),(18401,852,27419),(18402,853,27420),(18403,853,27421),(18404,854,27422),(18405,855,27423),(18406,856,27424),(18407,856,27425),(18408,856,27426),(18409,857,27427),(18390,858,27384),(18391,858,27385),(18392,858,27386),(18410,858,27428),(18411,859,27429),(18412,859,27430),(18413,860,27431),(18414,861,27432),(18415,868,27442),(18416,868,27443),(18417,868,27444),(18386,869,27380),(18387,870,27381),(18388,870,27382),(18389,870,27383),(18418,870,27445),(18419,871,27446),(18420,871,27447),(18421,872,27448),(18422,873,27449),(18111,874,27451),(18118,874,27452),(18116,874,27453),(18114,874,27454),(18115,874,27455),(18117,874,27456),(18113,874,27457),(18119,874,27458),(18112,874,27459),(17879,874,27461),(17735,875,27465),(17734,875,27466),(17731,875,27467),(17736,875,27468),(17730,875,27469),(17733,875,27470),(17972,876,27462),(17971,876,27463),(17970,876,27464),(17737,876,27471),(17732,876,27472),(18358,877,27478),(18357,878,27477),(18365,879,27485),(18359,880,27479),(18360,881,27480),(18361,882,27481),(18362,882,27482),(18363,882,27483),(18364,882,27484),(18120,883,27487),(18127,883,27488),(18125,883,27489),(18123,883,27490),(18124,883,27491),(18126,883,27492),(18122,883,27493),(18128,883,27494),(18121,883,27495),(17743,884,27499),(17742,884,27500),(17739,884,27501),(17744,884,27502),(17738,884,27503),(17741,884,27504),(17975,885,27496),(17974,885,27497),(17973,885,27498),(17745,885,27505),(17740,885,27506),(18451,886,27511),(18452,887,27516),(18453,888,27517),(18455,889,27519),(18454,890,27518),(18447,891,27507),(18448,891,27508),(18449,891,27509),(18450,891,27510),(18129,892,27521),(18136,892,27522),(18134,892,27523),(18132,892,27524),(18133,892,27525),(18135,892,27526),(18131,892,27527),(18137,892,27528),(18130,892,27529),(17880,892,27531),(17751,893,27535),(17750,893,27536),(17747,893,27537),(17752,893,27538),(17746,893,27539),(17749,893,27540),(17978,894,27532),(17977,894,27533),(17976,894,27534),(17753,894,27541),(17748,894,27542),(18377,895,27547),(18378,896,27552),(18379,897,27553),(18381,898,27555),(18380,899,27554),(18373,900,27543),(18374,900,27544),(18375,900,27545),(18376,900,27546),(18138,901,27557),(18145,901,27558),(18143,901,27559),(18141,901,27560),(18142,901,27561),(18144,901,27562),(18140,901,27563),(18146,901,27564),(18139,901,27565),(17881,901,27567),(17759,902,27571),(17758,902,27572),(17755,902,27573),(17760,902,27574),(17754,902,27575),(17757,902,27576),(17981,903,27568),(17980,903,27569),(17979,903,27570),(17761,903,27577),(17756,903,27578),(18463,904,27586),(18464,905,27590),(18465,905,27591),(18466,905,27592),(18461,906,27584),(18462,906,27585),(18467,907,27593),(18468,908,27594),(18469,908,27595),(18456,909,27579),(18457,909,27580),(18458,909,27581),(18459,909,27582),(18460,909,27583),(17898,910,27597),(17905,910,27598),(17903,910,27599),(17901,910,27600),(17902,910,27601),(17904,910,27602),(17900,910,27603),(17906,910,27604),(17899,910,27605),(17875,910,27607),(18324,911,27611),(18323,911,27612),(18320,911,27613),(18325,911,27614),(18319,911,27615),(18322,911,27616),(17984,912,27608),(17983,912,27609),(17982,912,27610),(18326,912,27617),(18321,912,27618),(17925,913,27620),(17932,913,27621),(17930,913,27622),(17928,913,27623),(17929,913,27624),(17931,913,27625),(17927,913,27626),(17933,913,27627),(17926,913,27628),(17882,913,27630),(17767,914,27634),(17766,914,27635),(17763,914,27636),(17768,914,27637),(17762,914,27638),(17765,914,27639),(17987,915,27631),(17986,915,27632),(17985,915,27633),(17769,915,27640),(17764,915,27641),(18147,916,27643),(18154,916,27644),(18152,916,27645),(18150,916,27646),(18151,916,27647),(18153,916,27648),(18149,916,27649),(18155,916,27650),(18148,916,27651),(17883,916,27653),(17775,917,27657),(17774,917,27658),(17771,917,27659),(17776,917,27660),(17770,917,27661),(17773,917,27662),(17990,918,27654),(17989,918,27655),(17988,918,27656),(17777,918,27663),(17772,918,27664),(18471,919,27671),(18470,920,27670),(18472,921,27672),(18473,922,27673),(18474,923,27674),(18475,924,27675),(18476,924,27676),(18477,924,27677),(18478,924,27678),(18479,924,27679),(18156,934,27723),(18163,934,27724),(18161,934,27725),(18159,934,27726),(18160,934,27727),(18162,934,27728),(18158,934,27729),(18164,934,27730),(18157,934,27731),(17884,934,27733),(17783,935,27737),(17782,935,27738),(17779,935,27739),(17784,935,27740),(17778,935,27741),(17781,935,27742),(17993,936,27734),(17992,936,27735),(17991,936,27736),(17785,936,27743),(17780,936,27744),(18541,937,27753),(18540,938,27752),(18539,939,27751),(18543,940,27755),(18536,941,27748),(18537,941,27749),(18538,941,27750),(18542,941,27754),(18165,942,27757),(18172,942,27758),(18170,942,27759),(18168,942,27760),(18169,942,27761),(18171,942,27762),(18167,942,27763),(18173,942,27764),(18166,942,27765),(17791,943,27769),(17790,943,27770),(17787,943,27771),(17792,943,27772),(17786,943,27773),(17789,943,27774),(17996,944,27766),(17995,944,27767),(17994,944,27768),(17793,944,27775),(17788,944,27776),(18368,945,27783),(18369,945,27784),(18371,946,27786),(18372,947,27787),(18366,948,27777),(18367,948,27778),(18370,948,27785),(18174,949,27789),(18181,949,27790),(18179,949,27791),(18177,949,27792),(18178,949,27793),(18180,949,27794),(18176,949,27795),(18182,949,27796),(18175,949,27797),(17885,949,27799),(17799,950,27803),(17798,950,27804),(17795,950,27805),(17800,950,27806),(17794,950,27807),(17797,950,27808),(17999,951,27800),(17998,951,27801),(17997,951,27802),(17801,951,27809),(17796,951,27810),(18495,951,27814),(18497,952,27820),(18496,953,27819),(18498,954,27821),(18500,955,27823),(18499,956,27822),(18492,957,27811),(18493,957,27812),(18494,957,27813),(18183,969,27873),(18190,969,27874),(18188,969,27875),(18186,969,27876),(18187,969,27877),(18189,969,27878),(18185,969,27879),(18191,969,27880),(18184,969,27881),(17807,970,27885),(17806,970,27886),(17803,970,27887),(17808,970,27888),(17802,970,27889),(17805,970,27890),(18002,971,27882),(18001,971,27883),(18000,971,27884),(17809,971,27891),(17804,971,27892),(18343,972,27904),(18340,973,27898),(18341,973,27899),(18342,973,27900),(18339,974,27897),(18344,974,27905),(18345,975,27906),(18346,975,27907),(18347,975,27908),(18335,976,27893),(18336,976,27894),(18337,976,27895),(18338,976,27896),(18192,977,27910),(18199,977,27911),(18197,977,27912),(18195,977,27913),(18196,977,27914),(18198,977,27915),(18194,977,27916),(18200,977,27917),(18193,977,27918),(17815,978,27922),(17814,978,27923),(17811,978,27924),(17816,978,27925),(17810,978,27926),(17813,978,27927),(18005,979,27919),(18004,979,27920),(18003,979,27921),(17817,979,27928),(17812,979,27929),(18550,980,27936),(18547,981,27933),(18548,981,27934),(18549,981,27935),(18551,982,27940),(18552,982,27941),(18554,983,27943),(18553,984,27942),(18544,985,27930),(18545,985,27931),(18546,985,27932),(18201,986,27945),(18208,986,27946),(18206,986,27947),(18204,986,27948),(18205,986,27949),(18207,986,27950),(18203,986,27951),(18209,986,27952),(18202,986,27953),(17886,986,27955),(17823,987,27959),(17822,987,27960),(17819,987,27961),(17824,987,27962),(17818,987,27963),(17821,987,27964),(18008,988,27956),(18007,988,27957),(18006,988,27958),(17825,988,27965),(17820,988,27966),(18446,989,27975),(18443,990,27972),(18444,990,27973),(18445,990,27974),(18438,991,27967),(18439,991,27968),(18440,991,27969),(18441,991,27970),(18442,991,27971),(17934,992,27977),(17941,992,27978),(17939,992,27979),(17937,992,27980),(17938,992,27981),(17940,992,27982),(17936,992,27983),(17942,992,27984),(17935,992,27985),(17831,993,27989),(17830,993,27990),(17827,993,27991),(17832,993,27992),(17826,993,27993),(17829,993,27994),(18011,994,27986),(18010,994,27987),(18009,994,27988),(17833,994,27995),(17828,994,27996),(18436,995,28003),(18437,996,28004),(18432,997,27997),(18433,997,27998),(18434,997,27999),(18435,997,28000),(17907,998,28006),(17914,998,28007),(17912,998,28008),(17910,998,28009),(17911,998,28010),(17913,998,28011),(17909,998,28012),(17915,998,28013),(17908,998,28014),(18332,999,28018),(18331,999,28019),(18328,999,28020),(18333,999,28021),(18327,999,28022),(18330,999,28023),(18014,1000,28015),(18013,1000,28016),(18012,1000,28017),(18334,1000,28024),(18329,1000,28025),(18560,1001,28031),(18557,1002,28028),(18558,1002,28029),(18559,1002,28030),(18555,1003,28026),(18556,1003,28027),(18272,1014,28045),(18282,1015,28048),(18283,1015,28049),(18284,1015,28050),(18276,1015,28054),(18277,1015,28055),(18278,1015,28056),(18274,1016,28052),(18273,1016,28053),(18275,1016,28057),(18280,1017,28046),(18279,1017,28047),(18281,1017,28051),(18210,1018,28059),(18217,1018,28060),(18215,1018,28061),(18213,1018,28062),(18214,1018,28063),(18216,1018,28064),(18212,1018,28065),(18218,1018,28066),(18211,1018,28067),(17887,1018,28069),(17839,1019,28073),(17838,1019,28074),(17835,1019,28075),(17840,1019,28076),(17834,1019,28077),(17837,1019,28078),(18017,1020,28070),(18016,1020,28071),(18015,1020,28072),(17841,1020,28079),(17836,1020,28080),(18285,1021,28084),(18295,1022,28087),(18296,1022,28088),(18297,1022,28089),(18289,1022,28093),(18290,1022,28094),(18291,1022,28095),(18287,1023,28091),(18286,1023,28092),(18288,1023,28096),(18293,1024,28085),(18292,1024,28086),(18294,1024,28090),(18039,1025,28098),(18046,1025,28099),(18044,1025,28100),(18042,1025,28101),(18043,1025,28102),(18045,1025,28103),(18041,1025,28104),(18047,1025,28105),(18040,1025,28106),(17847,1026,28110),(17846,1026,28111),(17843,1026,28112),(17848,1026,28113),(17842,1026,28114),(17845,1026,28115),(18020,1027,28107),(18019,1027,28108),(18018,1027,28109),(17849,1027,28116),(17844,1027,28117),(18219,1028,28119),(18226,1028,28120),(18224,1028,28121),(18222,1028,28122),(18223,1028,28123),(18225,1028,28124),(18221,1028,28125),(18227,1028,28126),(18220,1028,28127),(17888,1028,28129),(17855,1029,28133),(17854,1029,28134),(17851,1029,28135),(17856,1029,28136),(17850,1029,28137),(17853,1029,28138),(18023,1030,28130),(18022,1030,28131),(18021,1030,28132),(17857,1030,28139),(17852,1030,28140),(18482,1031,28143),(18484,1032,28151),(18485,1032,28152),(18486,1032,28153),(18483,1033,28150),(18489,1033,28156),(18487,1034,28154),(18488,1035,28155),(18480,1036,28141),(18481,1036,28142),(18490,1036,28157),(18491,1036,28158),(18298,1037,28162),(18308,1038,28165),(18309,1038,28166),(18310,1038,28167),(18302,1038,28171),(18303,1038,28172),(18304,1038,28173),(18300,1039,28169),(18299,1039,28170),(18301,1039,28174),(18306,1040,28163),(18305,1040,28164),(18307,1040,28168),(18228,1041,28176),(18235,1041,28177),(18233,1041,28178),(18231,1041,28179),(18232,1041,28180),(18234,1041,28181),(18230,1041,28182),(18236,1041,28183),(18229,1041,28184),(17863,1042,28188),(17862,1042,28189),(17859,1042,28190),(17864,1042,28191),(17858,1042,28192),(17861,1042,28193),(18026,1043,28185),(18025,1043,28186),(18024,1043,28187),(17865,1043,28194),(17860,1043,28195),(18519,1044,28200),(18520,1044,28201),(18521,1045,28202),(18522,1045,28203),(18525,1046,28206),(18523,1047,28204),(18524,1047,28205),(18426,1048,28208),(18395,1048,28209),(18394,1048,28210),(18393,1048,28211),(18430,1049,28215),(18429,1050,28216),(18427,1051,28217),(18428,1051,28218),(18424,1052,28220),(18423,1052,28221),(18425,1052,28222),(18237,1053,28224),(18244,1053,28225),(18242,1053,28226),(18240,1053,28227),(18241,1053,28228),(18243,1053,28229),(18239,1053,28230),(18245,1053,28231),(18238,1053,28232),(17871,1054,28236),(17870,1054,28237),(17867,1054,28238),(17872,1054,28239),(17866,1054,28240),(17869,1054,28241),(18029,1055,28233),(18028,1055,28234),(18027,1055,28235),(17873,1055,28242),(17868,1055,28243),(18400,1056,28246),(18431,1057,28247),(19020,1096,28711),(19021,1096,28712),(19022,1096,28713),(19023,1096,28714),(19024,1096,28715),(19025,1096,28716),(19026,1096,28717),(19027,1096,28718),(19028,1096,28719),(19029,1096,28720),(19030,1096,28721),(19031,1096,28722),(19032,1096,28723),(19088,1106,28631),(19089,1107,28639),(19093,1107,28643),(19102,1107,28644),(19114,1107,28645),(19116,1107,28646),(19099,1107,28647),(19101,1107,28648),(19104,1107,28649),(19110,1107,28650),(19097,1107,28651),(19108,1107,28652),(19094,1107,28653),(19092,1107,28654),(19112,1107,28655),(19091,1107,28656),(19095,1107,28657),(19113,1107,28658),(19107,1107,28659),(19098,1107,28660),(19096,1107,28661),(19100,1107,28662),(19106,1107,28663),(19120,1107,28664),(19117,1107,28665),(19121,1107,28666),(19118,1107,28667),(19109,1107,28668),(19090,1107,28669),(19105,1107,28670),(19119,1107,28779),(19111,1107,28780),(19103,1107,28789),(19115,1107,28806),(19148,1107,28808),(19176,1107,28820),(19177,1107,28821),(19183,1107,28822),(19184,1107,28823),(19187,1107,28826),(19188,1107,28827),(19189,1107,28828),(19190,1107,28829),(19201,1107,28840),(19202,1107,28841),(19203,1107,28842),(19521,1107,29475),(19522,1107,29546),(19524,1107,29552),(19122,1108,28633),(19123,1109,28641),(19130,1109,28671),(19129,1109,28672),(19132,1109,28673),(19127,1109,28674),(19125,1109,28675),(19133,1109,28676),(19124,1109,28677),(19131,1109,28788),(19126,1109,28792),(19134,1109,28805),(19128,1109,28807),(19195,1109,28834),(19196,1109,28835),(19197,1109,28836),(19198,1109,28837),(19199,1109,28838),(19200,1109,28839),(19523,1109,29551),(19135,1110,28632),(19136,1111,28640),(19145,1111,28781),(19144,1111,28782),(19139,1111,28783),(19143,1111,28784),(19141,1111,28785),(19142,1111,28786),(19140,1111,28787),(19193,1111,28832),(19194,1111,28833),(19137,1112,28630),(19138,1113,28638),(19147,1113,28790),(19146,1113,28791),(19169,1114,28811),(19170,1115,28812),(19172,1115,28815),(19173,1115,28816),(19171,1115,28817),(19175,1115,28818),(19174,1115,28819),(19156,1116,28793),(19155,1116,28795),(19154,1116,28797),(19151,1116,28799),(19152,1116,28801),(19153,1116,28803),(19162,1117,28794),(19161,1117,28796),(19160,1117,28798),(19157,1117,28800),(19158,1117,28802),(19159,1117,28804),(19164,1118,28625),(19167,1118,28813),(19166,1119,28642),(19168,1119,28814),(19182,1122,28710),(19185,1123,28824),(19186,1124,28825),(19191,1125,28830),(19192,1126,28831),(19507,1166,29132),(19508,1167,29133),(19509,1167,29134),(19511,1167,29136),(19504,1169,29129),(19516,1169,29142),(19520,1169,29143),(19518,1169,29144),(19519,1169,29145),(19517,1169,29146),(19506,1170,29131),(19515,1170,29141),(19502,1171,29127),(19505,1172,29130),(19503,1173,29128),(19501,1174,29126);
/*!40000 ALTER TABLE `items_applications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maintenances`
--

DROP TABLE IF EXISTS `maintenances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `maintenances` (
  `maintenanceid` bigint(20) unsigned NOT NULL,
  `name` varchar(128) NOT NULL DEFAULT '',
  `maintenance_type` int(11) NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `active_since` int(11) NOT NULL DEFAULT '0',
  `active_till` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`maintenanceid`),
  UNIQUE KEY `maintenances_2` (`name`),
  KEY `maintenances_1` (`active_since`,`active_till`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maintenances`
--

LOCK TABLES `maintenances` WRITE;
/*!40000 ALTER TABLE `maintenances` DISABLE KEYS */;
/*!40000 ALTER TABLE `maintenances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maintenances_groups`
--

DROP TABLE IF EXISTS `maintenances_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `maintenances_groups` (
  `maintenance_groupid` bigint(20) unsigned NOT NULL,
  `maintenanceid` bigint(20) unsigned NOT NULL,
  `groupid` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`maintenance_groupid`),
  UNIQUE KEY `maintenances_groups_1` (`maintenanceid`,`groupid`),
  KEY `maintenances_groups_2` (`groupid`),
  CONSTRAINT `c_maintenances_groups_1` FOREIGN KEY (`maintenanceid`) REFERENCES `maintenances` (`maintenanceid`) ON DELETE CASCADE,
  CONSTRAINT `c_maintenances_groups_2` FOREIGN KEY (`groupid`) REFERENCES `groups` (`groupid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maintenances_groups`
--

LOCK TABLES `maintenances_groups` WRITE;
/*!40000 ALTER TABLE `maintenances_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `maintenances_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maintenances_hosts`
--

DROP TABLE IF EXISTS `maintenances_hosts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `maintenances_hosts` (
  `maintenance_hostid` bigint(20) unsigned NOT NULL,
  `maintenanceid` bigint(20) unsigned NOT NULL,
  `hostid` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`maintenance_hostid`),
  UNIQUE KEY `maintenances_hosts_1` (`maintenanceid`,`hostid`),
  KEY `maintenances_hosts_2` (`hostid`),
  CONSTRAINT `c_maintenances_hosts_1` FOREIGN KEY (`maintenanceid`) REFERENCES `maintenances` (`maintenanceid`) ON DELETE CASCADE,
  CONSTRAINT `c_maintenances_hosts_2` FOREIGN KEY (`hostid`) REFERENCES `hosts` (`hostid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maintenances_hosts`
--

LOCK TABLES `maintenances_hosts` WRITE;
/*!40000 ALTER TABLE `maintenances_hosts` DISABLE KEYS */;
/*!40000 ALTER TABLE `maintenances_hosts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maintenances_windows`
--

DROP TABLE IF EXISTS `maintenances_windows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `maintenances_windows` (
  `maintenance_timeperiodid` bigint(20) unsigned NOT NULL,
  `maintenanceid` bigint(20) unsigned NOT NULL,
  `timeperiodid` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`maintenance_timeperiodid`),
  UNIQUE KEY `maintenances_windows_1` (`maintenanceid`,`timeperiodid`),
  KEY `maintenances_windows_2` (`timeperiodid`),
  CONSTRAINT `c_maintenances_windows_1` FOREIGN KEY (`maintenanceid`) REFERENCES `maintenances` (`maintenanceid`) ON DELETE CASCADE,
  CONSTRAINT `c_maintenances_windows_2` FOREIGN KEY (`timeperiodid`) REFERENCES `timeperiods` (`timeperiodid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maintenances_windows`
--

LOCK TABLES `maintenances_windows` WRITE;
/*!40000 ALTER TABLE `maintenances_windows` DISABLE KEYS */;
/*!40000 ALTER TABLE `maintenances_windows` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mappings`
--

DROP TABLE IF EXISTS `mappings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mappings` (
  `mappingid` bigint(20) unsigned NOT NULL,
  `valuemapid` bigint(20) unsigned NOT NULL,
  `value` varchar(64) NOT NULL DEFAULT '',
  `newvalue` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`mappingid`),
  KEY `mappings_1` (`valuemapid`),
  CONSTRAINT `c_mappings_1` FOREIGN KEY (`valuemapid`) REFERENCES `valuemaps` (`valuemapid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mappings`
--

LOCK TABLES `mappings` WRITE;
/*!40000 ALTER TABLE `mappings` DISABLE KEYS */;
INSERT INTO `mappings` VALUES (1,1,'0','Down'),(2,1,'1','Up'),(3,2,'0','not available'),(4,2,'1','available'),(5,2,'2','unknown'),(13,6,'1','Other'),(14,6,'2','OK'),(15,6,'3','Degraded'),(17,7,'1','Other'),(18,7,'2','Unknown'),(19,7,'3','OK'),(20,7,'4','NonCritical'),(21,7,'5','Critical'),(22,7,'6','NonRecoverable'),(23,5,'1','unknown'),(24,5,'2','batteryNormal'),(25,5,'3','batteryLow'),(26,4,'1','unknown'),(27,4,'2','notInstalled'),(28,4,'3','ok'),(29,4,'4','failed'),(30,4,'5','highTemperature'),(31,4,'6','replaceImmediately'),(32,4,'7','lowCapacity'),(33,3,'0','Running'),(34,3,'1','Paused'),(35,3,'3','Pause pending'),(36,3,'4','Continue pending'),(37,3,'5','Stop pending'),(38,3,'6','Stopped'),(39,3,'7','Unknown'),(40,3,'255','No such service'),(41,3,'2','Start pending'),(49,9,'1','unknown'),(50,9,'2','running'),(51,9,'3','warning'),(52,9,'4','testing'),(53,9,'5','down'),(61,8,'1','up'),(62,8,'2','down'),(63,8,'3','testing'),(64,8,'4','unknown'),(65,8,'5','dormant'),(66,8,'6','notPresent'),(67,8,'7','lowerLayerDown'),(68,10,'1','Up'),(69,11,'1','up'),(70,11,'2','down'),(71,11,'3','testing'),(72,12,'0','poweredOff'),(73,12,'1','poweredOn'),(74,12,'2','suspended'),(75,13,'0','gray'),(76,13,'1','green'),(77,13,'2','yellow'),(78,13,'3','red'),(79,14,'0','normal'),(80,14,'1','in maintenance'),(81,14,'2','no data collection'),(82,15,'0','Normal'),(83,15,'1','Low memory'),(84,16,'0','Automatic'),(85,16,'1','Automatic delayed'),(86,16,'2','Manual'),(87,16,'3','Disabled'),(88,16,'4','Unknown'),(89,17,'100','Continue'),(90,17,'101','Switching Protocols'),(91,17,'102','Processing'),(92,17,'200','OK'),(93,17,'201','Created'),(94,17,'202','Accepted'),(95,17,'203','Non-Authoritative Information'),(96,17,'204','No Content'),(97,17,'205','Reset Content'),(98,17,'206','Partial Content'),(99,17,'207','Multi-Status'),(100,17,'208','Already Reported'),(101,17,'226','IM Used'),(102,17,'300','Multiple Choices'),(103,17,'301','Moved Permanently'),(104,17,'302','Found'),(105,17,'303','See Other'),(106,17,'304','Not Modified'),(107,17,'305','Use Proxy'),(108,17,'306','Switch Proxy'),(109,17,'307','Temporary Redirect'),(110,17,'308','Permanent Redirect/Resume Incomplete'),(111,17,'400','Bad Request'),(112,17,'401','Unauthorized'),(113,17,'402','Payment Required'),(114,17,'403','Forbidden'),(115,17,'404','Not Found'),(116,17,'405','Method Not Allowed'),(117,17,'406','Not Acceptable'),(118,17,'407','Proxy Authentication Required'),(119,17,'408','Request Timeout'),(120,17,'409','Conflict'),(121,17,'410','Gone'),(122,17,'411','Length Required'),(123,17,'412','Precondition Failed'),(124,17,'413','Payload Too Large'),(125,17,'414','Request-URI Too Long'),(126,17,'415','Unsupported Media Type'),(127,17,'416','Requested Range Not Satisfiable'),(128,17,'417','Expectation Failed'),(129,17,'418','I\'m a Teapot'),(130,17,'419','Authentication Timeout'),(131,17,'420','Method Failure/Enhance Your Calm'),(132,17,'421','Misdirected Request'),(133,17,'422','Unprocessable Entity'),(134,17,'423','Locked'),(135,17,'424','Failed Dependency'),(136,17,'426','Upgrade Required'),(137,17,'428','Precondition Required'),(138,17,'429','Too Many Requests'),(139,17,'431','Request Header Fields Too Large'),(140,17,'440','Login Timeout'),(141,17,'444','No Response'),(142,17,'449','Retry With'),(143,17,'450','Blocked by Windows Parental Controls'),(144,17,'451','Unavailable for Legal Reasons/Redirect'),(145,17,'494','Request Header Too Large'),(146,17,'495','Cert Error'),(147,17,'496','No Cert'),(148,17,'497','HTTP to HTTPS'),(149,17,'498','Token Expired/Invalid'),(150,17,'499','Client Closed Request/Token Required'),(151,17,'500','Internal Server Error'),(152,17,'501','Not Implemented'),(153,17,'502','Bad Gateway'),(154,17,'503','Service Unavailable'),(155,17,'504','Gateway Timeout'),(156,17,'505','HTTP Version Not Supported'),(157,17,'506','Variant Also Negotiates'),(158,17,'507','Insufficient Storage'),(159,17,'508','Loop Detected'),(160,17,'509','Bandwidth Limit Exceeded'),(161,17,'510','Not Extended'),(162,17,'511','Network Authentication Required'),(163,17,'520','Unknown Error'),(164,17,'598','Network Read Timeout Error'),(165,17,'599','Network Connect Timeout Error'),(166,18,'1','ok'),(167,18,'2','unavailable'),(168,18,'3','nonoperational'),(169,19,'1','unknown'),(170,19,'2','halfDuplex'),(171,19,'3','fullDuplex'),(172,20,'1','up'),(173,20,'2','down'),(174,20,'3','testing'),(175,20,'4','unknown'),(176,20,'5','dormant'),(177,20,'6','notPresent'),(178,20,'7','lowerLayerDown'),(179,21,'1','other'),(180,21,'2','regular1822'),(181,21,'3','hdh1822'),(182,21,'4','ddnX25'),(183,21,'5','rfc877x25'),(184,21,'6','ethernetCsmacd'),(185,21,'7','iso88023Csmacd'),(186,21,'8','iso88024TokenBus'),(187,21,'9','iso88025TokenRing'),(188,21,'10','iso88026Man'),(189,21,'11','starLan'),(190,21,'12','proteon10Mbit'),(191,21,'13','proteon80Mbit'),(192,21,'14','hyperchannel'),(193,21,'15','fddi'),(194,21,'16','lapb'),(195,21,'17','sdlc'),(196,21,'18','ds1'),(197,21,'19','e1'),(198,21,'20','basicISDN'),(199,21,'21','primaryISDN'),(200,21,'22','propPointToPointSerial'),(201,21,'23','ppp'),(202,21,'24','softwareLoopback'),(203,21,'25','eon'),(204,21,'26','ethernet3Mbit'),(205,21,'27','nsip'),(206,21,'28','slip'),(207,21,'29','ultra'),(208,21,'30','ds3'),(209,21,'31','sip'),(210,21,'32','frameRelay'),(211,21,'33','rs232'),(212,21,'34','para'),(213,21,'35','arcnet'),(214,21,'36','arcnetPlus'),(215,21,'37','atm'),(216,21,'38','miox25'),(217,21,'39','sonet'),(218,21,'40','x25ple'),(219,21,'41','iso88022llc'),(220,21,'42','localTalk'),(221,21,'43','smdsDxi'),(222,21,'44','frameRelayService'),(223,21,'45','v35'),(224,21,'46','hssi'),(225,21,'47','hippi'),(226,21,'48','modem'),(227,21,'49','aal5'),(228,21,'50','sonetPath'),(229,21,'51','sonetVT'),(230,21,'52','smdsIcip'),(231,21,'53','propVirtual'),(232,21,'54','propMultiplexor'),(233,21,'55','ieee80212'),(234,21,'56','fibreChannel'),(235,21,'57','hippiInterface'),(236,21,'58','frameRelayInterconnect'),(237,21,'59','aflane8023'),(238,21,'60','aflane8025'),(239,21,'61','cctEmul'),(240,21,'62','fastEther'),(241,21,'63','isdn'),(242,21,'64','v11'),(243,21,'65','v36'),(244,21,'66','g703at64k'),(245,21,'67','g703at2mb'),(246,21,'68','qllc'),(247,21,'69','fastEtherFX'),(248,21,'70','channel'),(249,21,'71','ieee80211'),(250,21,'72','ibm370parChan'),(251,21,'73','escon'),(252,21,'74','dlsw'),(253,21,'75','isdns'),(254,21,'76','isdnu'),(255,21,'77','lapd'),(256,21,'78','ipSwitch'),(257,21,'79','rsrb'),(258,21,'80','atmLogical'),(259,21,'81','ds0'),(260,21,'82','ds0Bundle'),(261,21,'83','bsc'),(262,21,'84','async'),(263,21,'85','cnr'),(264,21,'86','iso88025Dtr'),(265,21,'87','eplrs'),(266,21,'88','arap'),(267,21,'89','propCnls'),(268,21,'90','hostPad'),(269,21,'91','termPad'),(270,21,'92','frameRelayMPI'),(271,21,'93','x213'),(272,21,'94','adsl'),(273,21,'95','radsl'),(274,21,'96','sdsl'),(275,21,'97','vdsl'),(276,21,'98','iso88025CRFPInt'),(277,21,'99','myrinet'),(278,21,'100','voiceEM'),(279,21,'101','voiceFXO'),(280,21,'102','voiceFXS'),(281,21,'103','voiceEncap'),(282,21,'104','voiceOverIp'),(283,21,'105','atmDxi'),(284,21,'106','atmFuni'),(285,21,'107','atmIma'),(286,21,'108','pppMultilinkBundle'),(287,21,'109','ipOverCdlc'),(288,21,'110','ipOverClaw'),(289,21,'111','stackToStack'),(290,21,'112','virtualIpAddress'),(291,21,'113','mpc'),(292,21,'114','ipOverAtm'),(293,21,'115','iso88025Fiber'),(294,21,'116','tdlc'),(295,21,'117','gigabitEthernet'),(296,21,'118','hdlc'),(297,21,'119','lapf'),(298,21,'120','v37'),(299,21,'121','x25mlp'),(300,21,'122','x25huntGroup'),(301,21,'123','trasnpHdlc'),(302,21,'124','interleave'),(303,21,'125','fast'),(304,21,'126','ip'),(305,21,'127','docsCableMaclayer'),(306,21,'128','docsCableDownstream'),(307,21,'129','docsCableUpstream'),(308,21,'130','a12MppSwitch'),(309,21,'131','tunnel'),(310,21,'132','coffee'),(311,21,'133','ces'),(312,21,'134','atmSubInterface'),(313,21,'135','l2vlan'),(314,21,'136','l3ipvlan'),(315,21,'137','l3ipxvlan'),(316,21,'138','digitalPowerline'),(317,21,'139','mediaMailOverIp'),(318,21,'140','dtm'),(319,21,'141','dcn'),(320,21,'142','ipForward'),(321,21,'143','msdsl'),(322,21,'144','ieee1394'),(323,21,'145','if-gsn'),(324,21,'146','dvbRccMacLayer'),(325,21,'147','dvbRccDownstream'),(326,21,'148','dvbRccUpstream'),(327,21,'149','atmVirtual'),(328,21,'150','mplsTunnel'),(329,21,'151','srp'),(330,21,'152','voiceOverAtm'),(331,21,'153','voiceOverFrameRelay'),(332,21,'154','idsl'),(333,21,'155','compositeLink'),(334,21,'156','ss7SigLink'),(335,21,'157','propWirelessP2P'),(336,21,'158','frForward'),(337,21,'159','rfc1483'),(338,21,'160','usb'),(339,21,'161','ieee8023adLag'),(340,21,'162','bgppolicyaccounting'),(341,21,'163','frf16MfrBundle'),(342,21,'164','h323Gatekeeper'),(343,21,'165','h323Proxy'),(344,21,'166','mpls'),(345,21,'167','mfSigLink'),(346,21,'168','hdsl2'),(347,21,'169','shdsl'),(348,21,'170','ds1FDL'),(349,21,'171','pos'),(350,21,'172','dvbAsiIn'),(351,21,'173','dvbAsiOut'),(352,21,'174','plc'),(353,21,'175','nfas'),(354,21,'176','tr008'),(355,21,'177','gr303RDT'),(356,21,'178','gr303IDT'),(357,21,'179','isup'),(358,21,'180','propDocsWirelessMaclayer'),(359,21,'181','propDocsWirelessDownstream'),(360,21,'182','propDocsWirelessUpstream'),(361,21,'183','hiperlan2'),(362,21,'184','propBWAp2Mp'),(363,21,'185','sonetOverheadChannel'),(364,21,'186','digitalWrapperOverheadChannel'),(365,21,'187','aal2'),(366,21,'188','radioMAC'),(367,21,'189','atmRadio'),(368,21,'190','imt'),(369,21,'191','mvl'),(370,21,'192','reachDSL'),(371,21,'193','frDlciEndPt'),(372,21,'194','atmVciEndPt'),(373,21,'195','opticalChannel'),(374,21,'196','opticalTransport'),(375,21,'197','propAtm'),(376,21,'198','voiceOverCable'),(377,21,'199','infiniband'),(378,21,'200','teLink'),(379,21,'201','q2931'),(380,21,'202','virtualTg'),(381,21,'203','sipTg'),(382,21,'204','sipSig'),(383,21,'205','docsCableUpstreamChannel'),(384,21,'206','econet'),(385,21,'207','pon155'),(386,21,'208','pon622'),(387,21,'209','bridge'),(388,21,'210','linegroup'),(389,21,'211','voiceEMFGD'),(390,21,'212','voiceFGDEANA'),(391,21,'213','voiceDID'),(392,21,'214','mpegTransport'),(393,21,'215','sixToFour'),(394,21,'216','gtp'),(395,21,'217','pdnEtherLoop1'),(396,21,'218','pdnEtherLoop2'),(397,21,'219','opticalChannelGroup'),(398,21,'220','homepna'),(399,21,'221','gfp'),(400,21,'222','ciscoISLvlan'),(401,21,'223','actelisMetaLOOP'),(402,21,'224','fcipLink'),(403,21,'225','rpr'),(404,21,'226','qam'),(405,21,'227','lmp'),(406,21,'228','cblVectaStar'),(407,21,'229','docsCableMCmtsDownstream'),(408,21,'230','adsl2'),(409,21,'231','macSecControlledIF'),(410,21,'232','macSecUncontrolledIF'),(411,21,'233','aviciOpticalEther'),(412,21,'234','atmbond'),(413,21,'235','voiceFGDOS'),(414,21,'236','mocaVersion1'),(415,21,'237','ieee80216WMAN'),(416,21,'238','adsl2plus'),(417,21,'239','dvbRcsMacLayer'),(418,21,'240','dvbTdm'),(419,21,'241','dvbRcsTdma'),(420,21,'242','x86Laps'),(421,21,'243','wwanPP'),(422,21,'244','wwanPP2'),(423,21,'245','voiceEBS'),(424,21,'246','ifPwType'),(425,21,'247','ilan'),(426,21,'248','pip'),(427,21,'249','aluELP'),(428,21,'250','gpon'),(429,21,'251','vdsl2'),(430,21,'252','capwapDot11Profile'),(431,21,'253','capwapDot11Bss'),(432,21,'254','capwapWtpVirtualRadio'),(433,21,'255','bits'),(434,21,'256','docsCableUpstreamRfPort'),(435,21,'257','cableDownstreamRfPort'),(436,21,'258','vmwareVirtualNic'),(437,21,'259','ieee802154'),(438,21,'260','otnOdu'),(439,21,'261','otnOtu'),(440,21,'262','ifVfiType'),(441,21,'263','g9981'),(442,21,'264','g9982'),(443,21,'265','g9983'),(444,21,'266','aluEpon'),(445,21,'267','aluEponOnu'),(446,21,'268','aluEponPhysicalUni'),(447,21,'269','aluEponLogicalLink'),(448,21,'270','aluGponOnu'),(449,21,'271','aluGponPhysicalUni'),(450,21,'272','vmwareNicTeam'),(451,21,'277','docsOfdmDownstream'),(452,21,'278','docsOfdmaUpstream'),(453,21,'279','gfast'),(454,21,'280','sdci'),(455,21,'281','xboxWireless'),(456,21,'282','fastdsl'),(457,21,'283','docsCableScte55d1FwdOob'),(458,21,'284','docsCableScte55d1RetOob'),(459,21,'285','docsCableScte55d2DsOob'),(460,21,'286','docsCableScte55d2UsOob'),(461,21,'287','docsCableNdf'),(462,21,'288','docsCableNdr'),(463,21,'289','ptm'),(464,21,'290','ghn'),(465,22,'0','not available'),(466,22,'1','available'),(467,22,'2','unknown'),(468,23,'1','deviceStateUnknown'),(469,23,'2','deviceNotEquipped'),(470,23,'3','deviceStateOk'),(471,23,'4','deviceStateFailed'),(472,23,'5','deviceStateOutOfService'),(473,24,'1','unknown'),(474,24,'2','faulty'),(475,24,'3','below-min'),(476,24,'4','nominal'),(477,24,'5','above-max'),(478,24,'6','absent'),(479,25,'1','online'),(480,25,'2','offline'),(481,25,'3','testing'),(482,25,'4','faulty'),(483,26,'1','other'),(484,26,'2','normal'),(485,26,'3','failure'),(486,27,'1','other'),(487,27,'2','normal'),(488,27,'3','failure'),(489,28,'1','normal'),(490,28,'2','warning'),(491,28,'3','critical'),(492,28,'4','shutdown'),(493,28,'5','notPresent'),(494,28,'6','notFunctioning'),(495,29,'1','true - on'),(496,29,'2','false - off'),(497,30,'1','up'),(498,30,'2','down'),(499,30,'3','absent'),(500,31,'1','up'),(501,31,'2','down'),(502,31,'3','absent'),(503,32,'1','noexist'),(504,32,'2','existnopower'),(505,32,'3','existreadypower'),(506,32,'4','normal'),(507,32,'5','powerbutabnormal'),(508,32,'6','unknown'),(509,33,'0','other'),(510,33,'1','working'),(511,33,'2','fail'),(512,33,'3','speed-0'),(513,33,'4','speed-low'),(514,33,'5','speed-middle'),(515,33,'6','speed-high'),(516,34,'0','other'),(517,34,'1','lowVoltage'),(518,34,'2','overCurrent'),(519,34,'3','working'),(520,34,'4','fail'),(521,34,'5','connect'),(522,34,'6','disconnect'),(523,35,'1','true'),(524,35,'2','false'),(525,36,'1','true - on'),(526,36,'2','false - off'),(527,37,'1','alarm'),(528,37,'2','normal'),(529,38,'1','notPresent'),(530,38,'2','presentOK'),(531,38,'3','presentNotOK'),(532,38,'4','presentPowerOff'),(533,39,'1','notSupported'),(534,39,'2','normal'),(535,39,'3','postFailure'),(536,39,'4','entityAbsent'),(537,39,'5','poeError'),(538,39,'6','stackError'),(539,39,'7','stackPortBlocked'),(540,39,'8','stackPortFailed'),(541,39,'9','sfpRecvError'),(542,39,'10','sfpSendError'),(543,39,'11','sfpBothError'),(544,39,'12','fanError'),(545,39,'13','psuError'),(546,39,'14','rpsError'),(547,39,'15','moduleFaulty'),(548,39,'16','sensorError'),(549,39,'17','hardwareFaulty'),(550,40,'1','unknown'),(551,40,'2','bad'),(552,40,'3','warning'),(553,40,'4','good'),(554,40,'5','notPresent'),(555,41,'1','normal'),(556,41,'2','abnormal'),(557,42,'1','online'),(558,42,'2','operational'),(559,42,'3','failed'),(560,42,'4','offline'),(561,43,'1','invalid'),(562,43,'2','bad'),(563,43,'3','warning'),(564,43,'4','good'),(565,43,'5','disabled'),(566,44,'1','unknown'),(567,44,'2','disabled'),(568,44,'3','failed'),(569,44,'4','warning'),(570,44,'5','standby'),(571,44,'6','engaged'),(572,44,'7','redundant'),(573,44,'8','notPresent'),(574,45,'1','normal'),(575,45,'2','high'),(576,45,'3','excessivelyHigh'),(577,45,'4','low'),(578,45,'5','excessivelyLow'),(579,45,'6','noSensor'),(580,45,'7','unknown'),(581,46,'1','other'),(582,46,'2','off'),(583,46,'3','on - RedAlarm'),(584,47,'1','unknown'),(585,47,'2','running'),(586,47,'3','ready'),(587,47,'4','reset'),(588,47,'5','runningAtFullSpeed'),(589,47,'6','down or off'),(590,47,'7','standby'),(591,48,'1','unknown'),(592,48,'2','disabled'),(593,48,'3','enabled'),(594,48,'4','testing'),(595,49,'1','operational'),(596,49,'2','failed'),(597,49,'3','powering'),(598,49,'4','notpowering'),(599,49,'5','notpresent'),(600,50,'1','operational'),(601,50,'2','failed'),(602,50,'3','powering'),(603,50,'4','notpowering'),(604,50,'5','notpresent'),(605,51,'1','normal'),(606,51,'2','warning'),(607,51,'3','critical'),(608,51,'4','shutdown'),(609,51,'5','notpresent'),(610,51,'6','notoperational'),(611,52,'0','normal'),(612,52,'1','abnormal'),(613,53,'0','normal'),(614,53,'1','abnormal'),(615,53,'2','not available'),(616,54,'1','other'),(617,54,'2','ok'),(618,54,'3','degraded'),(619,54,'4','failed'),(620,55,'1','other'),(621,55,'2','unknown'),(622,55,'3','system'),(623,55,'4','systemBoard'),(624,55,'5','ioBoard'),(625,55,'6','cpu'),(626,55,'7','memory'),(627,55,'8','storage'),(628,55,'9','removableMedia'),(629,55,'10','powerSupply'),(630,55,'11','ambient'),(631,55,'12','chassis'),(632,55,'13','bridgeCard'),(633,56,'1','other'),(634,56,'2','ida'),(635,56,'3','idaExpansion'),(636,56,'4','ida-2'),(637,56,'5','smart'),(638,56,'6','smart-2e'),(639,56,'7','smart-2p'),(640,56,'8','smart-2sl'),(641,56,'9','smart-3100es'),(642,56,'10','smart-3200'),(643,56,'11','smart-2dh'),(644,56,'12','smart-221'),(645,56,'13','sa-4250es'),(646,56,'14','sa-4200'),(647,56,'15','sa-integrated'),(648,56,'16','sa-431'),(649,56,'17','sa-5300'),(650,56,'18','raidLc2'),(651,56,'19','sa-5i'),(652,56,'20','sa-532'),(653,56,'21','sa-5312'),(654,56,'22','sa-641'),(655,56,'23','sa-642'),(656,56,'24','sa-6400'),(657,56,'25','sa-6400em'),(658,56,'26','sa-6i'),(659,56,'27','sa-generic'),(660,56,'29','sa-p600'),(661,56,'30','sa-p400'),(662,56,'31','sa-e200'),(663,56,'32','sa-e200i'),(664,56,'33','sa-p400i'),(665,56,'34','sa-p800'),(666,56,'35','sa-e500'),(667,56,'36','sa-p700m'),(668,56,'37','sa-p212'),(669,56,'38','sa-p410'),(670,56,'39','sa-p410i'),(671,56,'40','sa-p411'),(672,56,'41','sa-b110i'),(673,56,'42','sa-p712m'),(674,56,'43','sa-p711m'),(675,56,'44','sa-p812'),(676,57,'1','other'),(677,57,'2','ok'),(678,57,'3','failed'),(679,57,'4','predictiveFailure'),(680,58,'0','nonRecoverable'),(681,58,'2','critical'),(682,58,'4','nonCritical'),(683,58,'255','normal');
/*!40000 ALTER TABLE `mappings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media` (
  `mediaid` bigint(20) unsigned NOT NULL,
  `userid` bigint(20) unsigned NOT NULL,
  `mediatypeid` bigint(20) unsigned NOT NULL,
  `sendto` varchar(100) NOT NULL DEFAULT '',
  `active` int(11) NOT NULL DEFAULT '0',
  `severity` int(11) NOT NULL DEFAULT '63',
  `period` varchar(1024) NOT NULL DEFAULT '1-7,00:00-24:00',
  PRIMARY KEY (`mediaid`),
  KEY `media_1` (`userid`),
  KEY `media_2` (`mediatypeid`),
  CONSTRAINT `c_media_1` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`) ON DELETE CASCADE,
  CONSTRAINT `c_media_2` FOREIGN KEY (`mediatypeid`) REFERENCES `media_type` (`mediatypeid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media`
--

LOCK TABLES `media` WRITE;
/*!40000 ALTER TABLE `media` DISABLE KEYS */;
/*!40000 ALTER TABLE `media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_type`
--

DROP TABLE IF EXISTS `media_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media_type` (
  `mediatypeid` bigint(20) unsigned NOT NULL,
  `type` int(11) NOT NULL DEFAULT '0',
  `description` varchar(100) NOT NULL DEFAULT '',
  `smtp_server` varchar(255) NOT NULL DEFAULT '',
  `smtp_helo` varchar(255) NOT NULL DEFAULT '',
  `smtp_email` varchar(255) NOT NULL DEFAULT '',
  `exec_path` varchar(255) NOT NULL DEFAULT '',
  `gsm_modem` varchar(255) NOT NULL DEFAULT '',
  `username` varchar(255) NOT NULL DEFAULT '',
  `passwd` varchar(255) NOT NULL DEFAULT '',
  `status` int(11) NOT NULL DEFAULT '0',
  `smtp_port` int(11) NOT NULL DEFAULT '25',
  `smtp_security` int(11) NOT NULL DEFAULT '0',
  `smtp_verify_peer` int(11) NOT NULL DEFAULT '0',
  `smtp_verify_host` int(11) NOT NULL DEFAULT '0',
  `smtp_authentication` int(11) NOT NULL DEFAULT '0',
  `exec_params` varchar(255) NOT NULL DEFAULT '',
  `maxsessions` int(11) NOT NULL DEFAULT '1',
  `maxattempts` int(11) NOT NULL DEFAULT '3',
  `attempt_interval` varchar(32) NOT NULL DEFAULT '10s',
  PRIMARY KEY (`mediatypeid`),
  UNIQUE KEY `media_type_1` (`description`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_type`
--

LOCK TABLES `media_type` WRITE;
/*!40000 ALTER TABLE `media_type` DISABLE KEYS */;
INSERT INTO `media_type` VALUES (1,0,'Email','mail.company.com','company.com','zabbix@company.com','','','','',0,25,0,0,0,0,'',1,3,'10s'),(2,3,'Jabber','','','','','','jabber@company.com','zabbix',0,25,0,0,0,0,'',1,3,'10s'),(3,2,'SMS','','','','','/dev/ttyS0','','',0,25,0,0,0,0,'',1,3,'10s');
/*!40000 ALTER TABLE `media_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opcommand`
--

DROP TABLE IF EXISTS `opcommand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opcommand` (
  `operationid` bigint(20) unsigned NOT NULL,
  `type` int(11) NOT NULL DEFAULT '0',
  `scriptid` bigint(20) unsigned DEFAULT NULL,
  `execute_on` int(11) NOT NULL DEFAULT '0',
  `port` varchar(64) NOT NULL DEFAULT '',
  `authtype` int(11) NOT NULL DEFAULT '0',
  `username` varchar(64) NOT NULL DEFAULT '',
  `password` varchar(64) NOT NULL DEFAULT '',
  `publickey` varchar(64) NOT NULL DEFAULT '',
  `privatekey` varchar(64) NOT NULL DEFAULT '',
  `command` text NOT NULL,
  PRIMARY KEY (`operationid`),
  KEY `opcommand_1` (`scriptid`),
  CONSTRAINT `c_opcommand_1` FOREIGN KEY (`operationid`) REFERENCES `operations` (`operationid`) ON DELETE CASCADE,
  CONSTRAINT `c_opcommand_2` FOREIGN KEY (`scriptid`) REFERENCES `scripts` (`scriptid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opcommand`
--

LOCK TABLES `opcommand` WRITE;
/*!40000 ALTER TABLE `opcommand` DISABLE KEYS */;
INSERT INTO `opcommand` VALUES (11,0,NULL,0,'',0,'','','','','/usr/local/env/env2/bin/python2 /etc/zabbix/scripts/UserParameter/LockUser.py'),(12,0,NULL,0,'',0,'','','','','/usr/local/env/env2/bin/python2 /etc/zabbix/scripts/UserParameter/ActionTest.py');
/*!40000 ALTER TABLE `opcommand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opcommand_grp`
--

DROP TABLE IF EXISTS `opcommand_grp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opcommand_grp` (
  `opcommand_grpid` bigint(20) unsigned NOT NULL,
  `operationid` bigint(20) unsigned NOT NULL,
  `groupid` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`opcommand_grpid`),
  KEY `opcommand_grp_1` (`operationid`),
  KEY `opcommand_grp_2` (`groupid`),
  CONSTRAINT `c_opcommand_grp_1` FOREIGN KEY (`operationid`) REFERENCES `operations` (`operationid`) ON DELETE CASCADE,
  CONSTRAINT `c_opcommand_grp_2` FOREIGN KEY (`groupid`) REFERENCES `groups` (`groupid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opcommand_grp`
--

LOCK TABLES `opcommand_grp` WRITE;
/*!40000 ALTER TABLE `opcommand_grp` DISABLE KEYS */;
/*!40000 ALTER TABLE `opcommand_grp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opcommand_hst`
--

DROP TABLE IF EXISTS `opcommand_hst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opcommand_hst` (
  `opcommand_hstid` bigint(20) unsigned NOT NULL,
  `operationid` bigint(20) unsigned NOT NULL,
  `hostid` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`opcommand_hstid`),
  KEY `opcommand_hst_1` (`operationid`),
  KEY `opcommand_hst_2` (`hostid`),
  CONSTRAINT `c_opcommand_hst_1` FOREIGN KEY (`operationid`) REFERENCES `operations` (`operationid`) ON DELETE CASCADE,
  CONSTRAINT `c_opcommand_hst_2` FOREIGN KEY (`hostid`) REFERENCES `hosts` (`hostid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opcommand_hst`
--

LOCK TABLES `opcommand_hst` WRITE;
/*!40000 ALTER TABLE `opcommand_hst` DISABLE KEYS */;
INSERT INTO `opcommand_hst` VALUES (1,11,NULL),(2,12,NULL);
/*!40000 ALTER TABLE `opcommand_hst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opconditions`
--

DROP TABLE IF EXISTS `opconditions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opconditions` (
  `opconditionid` bigint(20) unsigned NOT NULL,
  `operationid` bigint(20) unsigned NOT NULL,
  `conditiontype` int(11) NOT NULL DEFAULT '0',
  `operator` int(11) NOT NULL DEFAULT '0',
  `value` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`opconditionid`),
  KEY `opconditions_1` (`operationid`),
  CONSTRAINT `c_opconditions_1` FOREIGN KEY (`operationid`) REFERENCES `operations` (`operationid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opconditions`
--

LOCK TABLES `opconditions` WRITE;
/*!40000 ALTER TABLE `opconditions` DISABLE KEYS */;
/*!40000 ALTER TABLE `opconditions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operations`
--

DROP TABLE IF EXISTS `operations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `operations` (
  `operationid` bigint(20) unsigned NOT NULL,
  `actionid` bigint(20) unsigned NOT NULL,
  `operationtype` int(11) NOT NULL DEFAULT '0',
  `esc_period` varchar(255) NOT NULL DEFAULT '0',
  `esc_step_from` int(11) NOT NULL DEFAULT '1',
  `esc_step_to` int(11) NOT NULL DEFAULT '1',
  `evaltype` int(11) NOT NULL DEFAULT '0',
  `recovery` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`operationid`),
  KEY `operations_1` (`actionid`),
  CONSTRAINT `c_operations_1` FOREIGN KEY (`actionid`) REFERENCES `actions` (`actionid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operations`
--

LOCK TABLES `operations` WRITE;
/*!40000 ALTER TABLE `operations` DISABLE KEYS */;
INSERT INTO `operations` VALUES (1,2,6,'0',1,1,0,0),(2,2,4,'0',1,1,0,0),(3,3,0,'0',1,1,0,0),(4,4,0,'0',1,1,0,0),(5,5,0,'0',1,1,0,0),(6,6,0,'0',1,1,0,0),(7,3,11,'0',1,1,0,1),(8,4,11,'0',1,1,0,1),(9,5,11,'0',1,1,0,1),(10,6,11,'0',1,1,0,1),(11,7,1,'0',1,1,0,0),(12,8,1,'0',1,1,0,0);
/*!40000 ALTER TABLE `operations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opgroup`
--

DROP TABLE IF EXISTS `opgroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opgroup` (
  `opgroupid` bigint(20) unsigned NOT NULL,
  `operationid` bigint(20) unsigned NOT NULL,
  `groupid` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`opgroupid`),
  UNIQUE KEY `opgroup_1` (`operationid`,`groupid`),
  KEY `opgroup_2` (`groupid`),
  CONSTRAINT `c_opgroup_1` FOREIGN KEY (`operationid`) REFERENCES `operations` (`operationid`) ON DELETE CASCADE,
  CONSTRAINT `c_opgroup_2` FOREIGN KEY (`groupid`) REFERENCES `groups` (`groupid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opgroup`
--

LOCK TABLES `opgroup` WRITE;
/*!40000 ALTER TABLE `opgroup` DISABLE KEYS */;
INSERT INTO `opgroup` VALUES (1,2,2);
/*!40000 ALTER TABLE `opgroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opinventory`
--

DROP TABLE IF EXISTS `opinventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opinventory` (
  `operationid` bigint(20) unsigned NOT NULL,
  `inventory_mode` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`operationid`),
  CONSTRAINT `c_opinventory_1` FOREIGN KEY (`operationid`) REFERENCES `operations` (`operationid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opinventory`
--

LOCK TABLES `opinventory` WRITE;
/*!40000 ALTER TABLE `opinventory` DISABLE KEYS */;
/*!40000 ALTER TABLE `opinventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opmessage`
--

DROP TABLE IF EXISTS `opmessage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opmessage` (
  `operationid` bigint(20) unsigned NOT NULL,
  `default_msg` int(11) NOT NULL DEFAULT '0',
  `subject` varchar(255) NOT NULL DEFAULT '',
  `message` text NOT NULL,
  `mediatypeid` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`operationid`),
  KEY `opmessage_1` (`mediatypeid`),
  CONSTRAINT `c_opmessage_1` FOREIGN KEY (`operationid`) REFERENCES `operations` (`operationid`) ON DELETE CASCADE,
  CONSTRAINT `c_opmessage_2` FOREIGN KEY (`mediatypeid`) REFERENCES `media_type` (`mediatypeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opmessage`
--

LOCK TABLES `opmessage` WRITE;
/*!40000 ALTER TABLE `opmessage` DISABLE KEYS */;
INSERT INTO `opmessage` VALUES (3,1,'Problem: {TRIGGER.NAME}','Problem started at {EVENT.TIME} on {EVENT.DATE}\r\nProblem name: {TRIGGER.NAME}\r\nHost: {HOST.NAME}\r\nSeverity: {TRIGGER.SEVERITY}\r\n\r\nOriginal problem ID: {EVENT.ID}\r\n{TRIGGER.URL}',NULL),(4,1,'','',NULL),(5,1,'','',NULL),(6,1,'','',NULL),(7,1,'Resolved: {TRIGGER.NAME}','Problem has been resolved at {EVENT.RECOVERY.TIME} on {EVENT.RECOVERY.DATE}\r\nProblem name: {TRIGGER.NAME}\r\nHost: {HOST.NAME}\r\nSeverity: {TRIGGER.SEVERITY}\r\n\r\nOriginal problem ID: {EVENT.ID}\r\n{TRIGGER.URL}',NULL),(8,1,'{ITEM.STATE}: {HOST.NAME}:{ITEM.NAME}','Host: {HOST.NAME}\r\nItem: {ITEM.NAME}\r\nKey: {ITEM.KEY}\r\nState: {ITEM.STATE}',NULL),(9,1,'{LLDRULE.STATE}: {HOST.NAME}:{LLDRULE.NAME}','Host: {HOST.NAME}\r\nLow level discovery rule: {LLDRULE.NAME}\r\nKey: {LLDRULE.KEY}\r\nState: {LLDRULE.STATE}',NULL),(10,1,'{TRIGGER.STATE}: {TRIGGER.NAME}','Trigger name: {TRIGGER.NAME}\r\nExpression: {TRIGGER.EXPRESSION}\r\nState: {TRIGGER.STATE}',NULL);
/*!40000 ALTER TABLE `opmessage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opmessage_grp`
--

DROP TABLE IF EXISTS `opmessage_grp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opmessage_grp` (
  `opmessage_grpid` bigint(20) unsigned NOT NULL,
  `operationid` bigint(20) unsigned NOT NULL,
  `usrgrpid` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`opmessage_grpid`),
  UNIQUE KEY `opmessage_grp_1` (`operationid`,`usrgrpid`),
  KEY `opmessage_grp_2` (`usrgrpid`),
  CONSTRAINT `c_opmessage_grp_1` FOREIGN KEY (`operationid`) REFERENCES `operations` (`operationid`) ON DELETE CASCADE,
  CONSTRAINT `c_opmessage_grp_2` FOREIGN KEY (`usrgrpid`) REFERENCES `usrgrp` (`usrgrpid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opmessage_grp`
--

LOCK TABLES `opmessage_grp` WRITE;
/*!40000 ALTER TABLE `opmessage_grp` DISABLE KEYS */;
INSERT INTO `opmessage_grp` VALUES (1,3,7),(2,4,7),(3,5,7),(4,6,7);
/*!40000 ALTER TABLE `opmessage_grp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opmessage_usr`
--

DROP TABLE IF EXISTS `opmessage_usr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opmessage_usr` (
  `opmessage_usrid` bigint(20) unsigned NOT NULL,
  `operationid` bigint(20) unsigned NOT NULL,
  `userid` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`opmessage_usrid`),
  UNIQUE KEY `opmessage_usr_1` (`operationid`,`userid`),
  KEY `opmessage_usr_2` (`userid`),
  CONSTRAINT `c_opmessage_usr_1` FOREIGN KEY (`operationid`) REFERENCES `operations` (`operationid`) ON DELETE CASCADE,
  CONSTRAINT `c_opmessage_usr_2` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opmessage_usr`
--

LOCK TABLES `opmessage_usr` WRITE;
/*!40000 ALTER TABLE `opmessage_usr` DISABLE KEYS */;
/*!40000 ALTER TABLE `opmessage_usr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `optemplate`
--

DROP TABLE IF EXISTS `optemplate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `optemplate` (
  `optemplateid` bigint(20) unsigned NOT NULL,
  `operationid` bigint(20) unsigned NOT NULL,
  `templateid` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`optemplateid`),
  UNIQUE KEY `optemplate_1` (`operationid`,`templateid`),
  KEY `optemplate_2` (`templateid`),
  CONSTRAINT `c_optemplate_1` FOREIGN KEY (`operationid`) REFERENCES `operations` (`operationid`) ON DELETE CASCADE,
  CONSTRAINT `c_optemplate_2` FOREIGN KEY (`templateid`) REFERENCES `hosts` (`hostid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `optemplate`
--

LOCK TABLES `optemplate` WRITE;
/*!40000 ALTER TABLE `optemplate` DISABLE KEYS */;
INSERT INTO `optemplate` VALUES (1,1,10001);
/*!40000 ALTER TABLE `optemplate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `problem`
--

DROP TABLE IF EXISTS `problem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `problem` (
  `eventid` bigint(20) unsigned NOT NULL,
  `source` int(11) NOT NULL DEFAULT '0',
  `object` int(11) NOT NULL DEFAULT '0',
  `objectid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `clock` int(11) NOT NULL DEFAULT '0',
  `ns` int(11) NOT NULL DEFAULT '0',
  `r_eventid` bigint(20) unsigned DEFAULT NULL,
  `r_clock` int(11) NOT NULL DEFAULT '0',
  `r_ns` int(11) NOT NULL DEFAULT '0',
  `correlationid` bigint(20) unsigned DEFAULT NULL,
  `userid` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`eventid`),
  KEY `problem_1` (`source`,`object`,`objectid`),
  KEY `problem_2` (`r_clock`),
  KEY `problem_3` (`r_eventid`),
  CONSTRAINT `c_problem_1` FOREIGN KEY (`eventid`) REFERENCES `events` (`eventid`) ON DELETE CASCADE,
  CONSTRAINT `c_problem_2` FOREIGN KEY (`r_eventid`) REFERENCES `events` (`eventid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `problem`
--

LOCK TABLES `problem` WRITE;
/*!40000 ALTER TABLE `problem` DISABLE KEYS */;
INSERT INTO `problem` VALUES (31,0,0,13496,1530006012,551759249,NULL,0,0,NULL,NULL),(33,3,4,23261,1530006041,559828733,NULL,0,0,NULL,NULL),(34,3,0,13476,1530006041,559828733,NULL,0,0,NULL,NULL),(35,3,4,23267,1530006047,563750355,NULL,0,0,NULL,NULL),(36,3,4,25367,1530006047,563679921,NULL,0,0,NULL,NULL),(37,3,0,13482,1530006047,563750355,NULL,0,0,NULL,NULL),(38,3,0,13563,1530006047,563679921,NULL,0,0,NULL,NULL),(39,3,4,23328,1530006048,564006977,NULL,0,0,NULL,NULL),(40,3,0,13436,1530006048,564006977,NULL,0,0,NULL,NULL),(41,3,4,23635,1530006055,566900928,NULL,0,0,NULL,NULL),(42,3,0,13537,1530006055,566900928,NULL,0,0,NULL,NULL),(817,0,0,15832,1534731591,383384047,NULL,0,0,NULL,NULL),(928,0,0,15833,1536822623,52708567,NULL,0,0,NULL,NULL),(929,0,0,15880,1536822637,882311645,NULL,0,0,NULL,NULL),(1355,3,4,29140,1536965830,254737352,NULL,0,0,NULL,NULL),(1356,3,5,29121,1536965841,107112768,NULL,0,0,NULL,NULL),(1357,3,5,29122,1536965842,152826238,NULL,0,0,NULL,NULL),(1358,3,5,29123,1536965843,355164228,NULL,0,0,NULL,NULL),(1359,3,5,29125,1536965845,418374871,NULL,0,0,NULL,NULL),(1388,3,4,29120,1536969920,25050911,NULL,0,0,NULL,NULL),(3438,0,0,15987,1537242211,870836990,NULL,0,0,NULL,NULL),(6531,3,4,29414,1537693517,13951492,NULL,0,0,NULL,NULL),(6887,3,4,29439,1537750842,354104447,7020,1537773042,234939897,NULL,0),(6908,0,0,13470,1537753955,514811229,6909,1537754375,772345465,NULL,0),(6930,0,0,13470,1537757555,699975536,6931,1537757975,412873991,NULL,0),(6952,0,0,13470,1537761155,669062497,6953,1537761575,423022179,NULL,0),(6974,0,0,13470,1537764755,335807701,6975,1537765175,705017617,NULL,0),(6996,0,0,13470,1537768355,941894556,6997,1537768775,418009604,NULL,0),(7018,0,0,13470,1537771955,214871496,7019,1537772375,622468353,NULL,0),(7021,3,4,29439,1537773342,470855426,7352,1537828242,650564195,NULL,0),(7042,0,0,13470,1537775555,316843110,7043,1537775975,210999703,NULL,0),(7064,0,0,13470,1537779155,288562842,7065,1537779575,981935189,NULL,0),(7086,0,0,13470,1537782755,254639344,7087,1537783175,843047262,NULL,0),(7108,0,0,13470,1537786355,429495515,7109,1537786775,335698812,NULL,0),(7130,0,0,13470,1537789955,973250817,7131,1537790375,712664350,NULL,0),(7152,0,0,13470,1537793555,377613961,7153,1537793975,809281141,NULL,0),(7174,0,0,13470,1537797155,375505485,7175,1537797575,779314814,NULL,0),(7196,0,0,13470,1537800755,443773758,7197,1537801175,513033385,NULL,0),(7218,0,0,13470,1537804355,974229687,7219,1537804775,491306955,NULL,0),(7240,0,0,13470,1537807955,394805490,7241,1537808375,408871441,NULL,0),(7262,0,0,13470,1537811555,546331756,7263,1537811975,841049702,NULL,0),(7284,0,0,13470,1537815155,394765615,7285,1537815575,492041256,NULL,0),(7306,0,0,13470,1537818755,627521583,7307,1537819175,713456859,NULL,0),(7328,0,0,13470,1537822355,673481737,7329,1537822775,27725369,NULL,0),(7350,0,0,13470,1537825955,389599116,7351,1537826375,625315649,NULL,0),(7353,3,4,29439,1537828542,218784738,NULL,0,0,NULL,NULL),(7374,0,0,13470,1537829555,940213109,7375,1537829975,476349597,NULL,0),(7396,0,0,13470,1537833155,854034364,7397,1537833575,435522540,NULL,0),(7418,0,0,13470,1537836755,375824134,7419,1537837175,821389147,NULL,0),(7440,0,0,13470,1537840355,575931244,7441,1537840775,799456353,NULL,0);
/*!40000 ALTER TABLE `problem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `problem_tag`
--

DROP TABLE IF EXISTS `problem_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `problem_tag` (
  `problemtagid` bigint(20) unsigned NOT NULL,
  `eventid` bigint(20) unsigned NOT NULL,
  `tag` varchar(255) NOT NULL DEFAULT '',
  `value` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`problemtagid`),
  KEY `problem_tag_1` (`eventid`),
  KEY `problem_tag_2` (`tag`,`value`),
  CONSTRAINT `c_problem_tag_1` FOREIGN KEY (`eventid`) REFERENCES `problem` (`eventid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `problem_tag`
--

LOCK TABLES `problem_tag` WRITE;
/*!40000 ALTER TABLE `problem_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `problem_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profiles`
--

DROP TABLE IF EXISTS `profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profiles` (
  `profileid` bigint(20) unsigned NOT NULL,
  `userid` bigint(20) unsigned NOT NULL,
  `idx` varchar(96) NOT NULL DEFAULT '',
  `idx2` bigint(20) unsigned NOT NULL DEFAULT '0',
  `value_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `value_int` int(11) NOT NULL DEFAULT '0',
  `value_str` varchar(255) NOT NULL DEFAULT '',
  `source` varchar(96) NOT NULL DEFAULT '',
  `type` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`profileid`),
  KEY `profiles_1` (`userid`,`idx`,`idx2`),
  KEY `profiles_2` (`userid`,`profileid`),
  CONSTRAINT `c_profiles_1` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profiles`
--

LOCK TABLES `profiles` WRITE;
/*!40000 ALTER TABLE `profiles` DISABLE KEYS */;
INSERT INTO `profiles` VALUES (2,1,'web.dashbrd.period',1,0,60,'','',2),(3,1,'web.dashbrd.stime',1,0,0,'20180913155301','',3),(4,1,'web.dashbrd.isnow',1,0,0,'','',2),(5,1,'web.login.attempt.failed',0,0,0,'','',2),(6,1,'web.login.attempt.ip',0,0,0,'10.10.10.151','',3),(7,1,'web.login.attempt.clock',0,0,1530001052,'','',2),(8,1,'web.menu.login.last',0,0,0,'index.php','',3),(9,1,'web.messages',0,0,0,'0','enabled',3),(10,1,'web.messages',0,0,0,'0','triggers.recovery',3),(11,1,'web.messages',0,0,0,'a:0:{}','triggers.severities',3),(12,1,'web.menu.config.last',0,0,0,'hostgroups.php','',3),(13,1,'web.config.groupid',0,0,0,'','',1),(14,1,'web.latest.groupid',0,20,0,'','',1),(15,1,'web.hosts.php.sort',0,0,0,'status','',3),(16,1,'web.hosts.php.sortorder',0,0,0,'DESC','',3),(17,1,'web.paging.lastpage',0,0,0,'hostgroups.php','',3),(18,1,'web.hostgroups.php.sort',0,0,0,'name','',3),(19,1,'web.hostgroups.php.sortorder',0,0,0,'ASC','',3),(20,1,'web.problem.sort',0,0,0,'problem','',3),(21,1,'web.problem.sortorder',0,0,0,'ASC','',3),(22,1,'web.templates.php.groupid',0,20,0,'','',1),(23,1,'web.templates.php.sort',0,0,0,'name','',3),(24,1,'web.templates.php.sortorder',0,0,0,'ASC','',3),(25,1,'web.paging.page',0,0,1,'','',2),(26,1,'web.reports.groupid',0,20,0,'','',1),(27,1,'web.screens.graphid',0,961,0,'','',1),(29,1,'web.menu.view.last',0,0,0,'charts.php','',3),(30,1,'web.view.groupid',0,20,0,'','',1),(31,1,'web.view.hostid',0,0,0,'','',1),(32,1,'web.latest.hostid',0,10084,0,'','',1),(33,1,'web.view.graphid',0,961,0,'','',1),(34,1,'web.latest.graphid',0,961,0,'','',1),(37,1,'web.screenconf.config',0,0,0,'','',2),(38,1,'web.screenconf.php.sort',0,0,0,'name','',3),(39,1,'web.screenconf.php.sortorder',0,0,0,'ASC','',3),(43,1,'web.sysmaps.php.sort',0,0,0,'name','',3),(44,1,'web.sysmaps.php.sortorder',0,0,0,'ASC','',3),(50,1,'web.maintenance.php.sort',0,0,0,'name','',3),(51,1,'web.maintenance.php.sortorder',0,0,0,'ASC','',3),(52,1,'web.latest.php.sort',0,0,0,'name','',3),(53,1,'web.latest.php.sortorder',0,0,0,'ASC','',3),(54,1,'web.favorite.sysmapids',0,1,0,'','sysmapid',1),(55,1,'web.problem.filter.show',0,0,1,'','',2),(58,1,'web.problem.filter.application',0,0,0,'','',3),(59,1,'web.problem.filter.problem',0,0,0,'','',3),(60,1,'web.problem.filter.severity',0,0,0,'','',2),(61,1,'web.problem.filter.age_state',0,0,0,'','',2),(62,1,'web.problem.filter.age',0,0,14,'','',2),(63,1,'web.problem.filter.maintenance',0,0,0,'','',2),(64,1,'web.problem.filter.unacknowledged',0,0,0,'','',2),(65,1,'web.problem.filter.details',0,0,0,'','',2),(66,1,'web.media_type.php.sort',0,0,0,'description','',3),(67,1,'web.media_types.php.sortorder',0,0,0,'ASC','',3),(68,1,'web.tr_status.php.sort',0,0,0,'lastchange','',3),(69,1,'web.tr_status.php.sortorder',0,0,0,'DESC','',3),(70,1,'web.httpmon.php.sort',0,0,0,'name','',3),(71,1,'web.httpmon.php.sortorder',0,0,0,'ASC','',3),(72,1,'web..groupid',0,0,0,'','',1),(73,1,'web.menu.reports.last',0,0,0,'report4.php','',3),(74,1,'web.avail_report.mode',0,0,0,'','',2),(75,1,'web.avail_report.0.groupid',0,0,0,'','',1),(76,1,'web.avail_report.0.timesince',0,0,0,'20180911000000','',3),(77,1,'web.avail_report.0.timetill',0,0,0,'20180912000000','',3),(78,1,'web.avail_report.0.hostid',0,0,0,'','',1),(79,1,'web.toptriggers.filter.severities',0,0,0,'0','',3),(80,1,'web.toptriggers.filter.severities',1,0,0,'2','',3),(81,1,'web.toptriggers.filter.severities',2,0,0,'4','',3),(82,1,'web.toptriggers.filter.severities',3,0,0,'1','',3),(83,1,'web.toptriggers.filter.severities',4,0,0,'3','',3),(84,1,'web.toptriggers.filter.severities',5,0,0,'5','',3),(85,1,'web.toptriggers.filter.from',0,0,0,'1527782400','',3),(86,1,'web.toptriggers.filter.till',0,0,0,'1536745080','',3),(87,1,'web.menu.cm.last',0,0,0,'hostinventoriesoverview.php','',3),(88,1,'web.hostinventories.php.sort',0,0,0,'name','',3),(89,1,'web.hostinventories.php.sortorder',0,0,0,'ASC','',3),(90,1,'web.cm.groupid',0,0,0,'','',1),(91,1,'web.correlation.php.sort',0,0,0,'name','',3),(92,1,'web.correlation.php.sortorder',0,0,0,'ASC','',3),(93,1,'web.actionconf.php.sort',0,0,0,'name','',3),(94,1,'web.actionconf.php.sortorder',0,0,0,'ASC','',3),(95,1,'web.hostinventoriesoverview.php.sort',0,0,0,'host_count','',3),(96,1,'web.hostinventoriesoverview.php.sortorder',0,0,0,'DESC','',3),(97,1,'web.proxies.php.sort',0,0,0,'host','',3),(98,1,'web.proxies.php.sortorder',0,0,0,'ASC','',3),(99,1,'web.menu.admin.last',0,0,0,'adm.gui.php','',3),(100,1,'web.discovery.php.sort',0,0,0,'ip','',3),(101,1,'web.discovery.php.sortorder',0,0,0,'ASC','',3),(102,1,'web..druleid',0,0,0,'','',1),(103,1,'web.latest.druleid',0,0,0,'','',1),(105,1,'web.triggers.php.sort',0,0,0,'description','',3),(106,1,'web.triggers.php.sortorder',0,0,0,'ASC','',3),(107,1,'web.config.hostid',0,10084,0,'','',1),(108,2,'web.problem.sort',0,0,0,'clock','',3),(109,2,'web.problem.sortorder',0,0,0,'DESC','',3),(132,2,'web.dashbrd.dashboardid',0,1,0,'','',1),(133,2,'web.dashbrd.period',1,0,3600,'','',2),(134,2,'web.dashbrd.stime',1,0,0,'20180912135717','',3),(135,2,'web.dashbrd.isnow',1,0,1,'','',2),(139,1,'web.latest.toggle',1081,0,0,'','',2),(141,2,'web.menu.view.last',0,0,0,'zabbix.php','',3),(142,2,'web.latest.php.sort',0,0,0,'name','',3),(143,2,'web.latest.php.sortorder',0,0,0,'ASC','',3),(144,2,'web.paging.lastpage',0,0,0,'sysmaps.php','',3),(145,1,'web.host_discovery.php.sort',0,0,0,'name','',3),(146,1,'web.host_discovery.php.sortorder',0,0,0,'ASC','',3),(147,1,'web.trigger_prototypes.php.sort',0,0,0,'description','',3),(148,1,'web.trigger_prototypes.php.sortorder',0,0,0,'ASC','',3),(149,1,'web.applications.php.sort',0,0,0,'name','',3),(150,1,'web.applications.php.sortorder',0,0,0,'ASC','',3),(152,1,'web.items.filter_hostid',0,10265,0,'','',1),(170,1,'web.items.subfilter_apps',0,0,0,'','',3),(171,1,'web.items.subfilter_types',0,0,0,'','',3),(172,1,'web.items.subfilter_value_types',0,0,0,'','',3),(173,1,'web.items.subfilter_status',0,0,0,'','',3),(174,1,'web.items.subfilter_state',0,0,0,'','',3),(175,1,'web.items.subfilter_templated_items',0,0,0,'','',3),(176,1,'web.items.subfilter_with_triggers',0,0,0,'','',3),(177,1,'web.items.subfilter_hosts',0,0,0,'','',3),(178,1,'web.items.subfilter_interval',0,0,0,'','',3),(179,1,'web.items.subfilter_history',0,0,0,'','',3),(180,1,'web.items.subfilter_trends',0,0,0,'','',3),(181,1,'web.items.php.sort',0,0,0,'status','',3),(182,1,'web.items.php.sortorder',0,0,0,'ASC','',3),(183,1,'web.tr_status.filter.show_triggers',0,0,2,'','',2),(184,1,'web.tr_status.filter.show_details',0,0,0,'','',2),(185,1,'web.tr_status.filter.show_maintenance',0,0,1,'','',2),(186,1,'web.tr_status.filter.show_severity',0,0,0,'','',2),(187,1,'web.tr_status.filter.txt_select',0,0,0,'','',3),(188,1,'web.tr_status.filter.status_change',0,0,0,'','',2),(189,1,'web.tr_status.filter.status_change_days',0,0,14,'','',2),(190,1,'web.tr_status.filter.application',0,0,0,'','',3),(191,1,'web.tr_status.filter.show_events',0,0,1,'','',2),(192,1,'web.tr_status.filter.ack_status',0,0,1,'','',2),(193,1,'web.dashbrd.list_was_opened',0,0,1,'','',2),(194,1,'web.dashbrd.list.sort',0,0,0,'name','',3),(195,1,'web.dashbrd.list.sortorder',0,0,0,'ASC','',3),(197,1,'web.screens.period',16,0,60,'','',2),(198,1,'web.screens.stime',16,0,0,'20180830005554','',3),(199,1,'web.screens.isnow',16,0,0,'','',2),(200,1,'web.overview.filter.show_triggers',0,0,2,'','',2),(201,1,'web.overview.filter.show_maintenance',0,0,1,'','',2),(202,1,'web.overview.filter.show_severity',0,0,0,'','',2),(203,1,'web.overview.filter.txt_select',0,0,0,'','',3),(204,1,'web.overview.filter.status_change',0,0,0,'','',2),(205,1,'web.overview.filter.status_change_days',0,0,14,'','',2),(206,1,'web.overview.filter.application',0,0,0,'','',3),(207,1,'web.overview.filter.ack_status',0,0,1,'','',2),(209,1,'web.reports.hostid',0,10084,0,'','',1),(210,2,'web.sysmaps.php.sort',0,0,0,'name','',3),(211,2,'web.sysmaps.php.sortorder',0,0,0,'ASC','',3),(212,1,'web.discoveryconf.php.sort',0,0,0,'name','',3),(213,1,'web.discoveryconf.php.sortorder',0,0,0,'ASC','',3),(252,1,'web.triggers.filter_priority',0,0,-1,'','',2),(253,1,'web.triggers.filter_state',0,0,-1,'','',2),(254,1,'web.triggers.filter_status',0,0,-1,'','',2),(261,1,'web.problem.timeline.period',0,0,63072000,'','',2),(262,1,'web.problem.timeline.stime',0,0,0,'20160913161406','',3),(263,1,'web.problem.timeline.isnow',0,0,1,'','',2),(282,1,'web.item.graph.period',28728,0,1296000,'','',2),(283,1,'web.item.graph.stime',28728,0,0,'20180805100801','',3),(284,1,'web.item.graph.isnow',28728,0,1,'','',2),(295,1,'web.scripts.php.sort',0,0,0,'name','',3),(296,1,'web.scripts.php.sortorder',0,0,0,'ASC','',3),(297,1,'web.users.filter.usrgrpid',0,0,0,'','',1),(298,1,'web.users.php.sort',0,0,0,'alias','',3),(299,1,'web.users.php.sortorder',0,0,0,'ASC','',3),(300,1,'web.usergrps.php.sort',0,0,0,'name','',3),(301,1,'web.usergrps.php.sortorder',0,0,0,'ASC','',3),(302,1,'web.item.graph.period',28792,0,14505,'','',2),(303,1,'web.item.graph.stime',28792,0,0,'20180820061252','',3),(304,1,'web.item.graph.isnow',28792,0,1,'','',2),(309,1,'web.item.graph.period',28794,0,7312,'','',2),(310,1,'web.item.graph.stime',28794,0,0,'20180820084319','',3),(311,1,'web.item.graph.isnow',28794,0,1,'','',2),(313,1,'web.item.graph.period',28711,0,26386,'','',2),(314,1,'web.item.graph.stime',28711,0,0,'20180820032703','',3),(315,1,'web.item.graph.isnow',28711,0,1,'','',2),(321,1,'web.disc_prototypes.php.sort',0,0,0,'name','',3),(322,1,'web.disc_prototypes.php.sortorder',0,0,0,'ASC','',3),(335,1,'web.latest.toggle_other',10254,0,0,'','',2),(352,1,'web.queue.config',0,0,0,'','',2),(358,1,'web.dashbrd.filter.state',0,0,0,'','',2),(360,1,'web.dashbrd.period',0,0,3600,'','',2),(361,1,'web.dashbrd.stime',0,0,0,'20180913155301','',3),(362,1,'web.dashbrd.isnow',0,0,1,'','',2),(365,1,'web.slideconf.php.sort',0,0,0,'name','',3),(366,1,'web.slideconf.php.sortorder',0,0,0,'ASC','',3),(380,1,'web.item.graph.period',28825,0,518400,'','',2),(381,1,'web.item.graph.stime',28825,0,0,'20180906112933','',3),(382,1,'web.item.graph.isnow',28825,0,1,'','',2),(387,1,'web.latest.toggle',1124,0,0,'','',2),(391,1,'web.hostinventories.filter_field',0,0,0,'deployment_status','',3),(392,1,'web.hostinventories.filter_field_value',0,0,0,'','',3),(393,1,'web.hostinventories.filter_exact',0,0,1,'','',2),(394,1,'web.overview.type',0,0,1,'','',2),(395,1,'web.overview.view_style',0,0,1,'','',2),(397,1,'web.graphs.period',864,0,1555200,'','',2),(398,1,'web.graphs.stime',864,0,0,'20180825164624','',3),(399,1,'web.graphs.isnow',864,0,1,'','',2),(401,1,'web.graphs.period',824,0,432000,'','',2),(402,1,'web.graphs.stime',824,0,0,'20180907165804','',3),(403,1,'web.graphs.isnow',824,0,1,'','',2),(408,1,'web.auditacts.timeline.period',0,0,3628265,'','',2),(409,1,'web.auditacts.timeline.stime',0,0,0,'20180802165633','',3),(410,1,'web.auditacts.timeline.isnow',0,0,1,'','',2),(411,1,'web.actionconf.eventsource',0,0,0,'','',2),(412,1,'web.latest.toggle',1136,0,0,'','',2),(418,1,'web.latest.toggle',1117,0,0,'','',2),(426,1,'web.actionconf.filter_name',0,0,0,'','',3),(427,1,'web.actionconf.filter_status',0,0,-1,'','',2),(428,1,'web.item.graph.period',28782,0,60,'','',2),(429,1,'web.item.graph.stime',28782,0,0,'20180913142638','',3),(430,1,'web.item.graph.isnow',28782,0,0,'','',2),(441,1,'web.item.graph.period',28831,0,16657,'','',2),(442,1,'web.item.graph.stime',28831,0,0,'20180913104828','',3),(443,1,'web.item.graph.isnow',28831,0,1,'','',2),(448,1,'web.latest.toggle',1113,0,0,'','',2),(451,1,'web.item.graph.period',28652,0,2592000,'','',2),(452,1,'web.item.graph.stime',28652,0,0,'20180814163558','',3),(453,1,'web.item.graph.isnow',28652,0,1,'','',2),(455,1,'web.auditlogs.timeline.period',0,0,4320000,'','',2),(456,1,'web.auditlogs.timeline.stime',0,0,0,'20180725164641','',3),(457,1,'web.auditlogs.timeline.isnow',0,0,1,'','',2),(458,1,'web.auditacts.filter.alias',0,0,0,'','',3),(459,1,'web.dashbrd.dashboardid',0,1,0,'','',1),(460,1,'web.latest.toggle',1107,0,0,'','',2),(461,1,'web.latest.toggle',1121,0,0,'','',2),(462,1,'web.latest.toggle',1109,0,0,'','',2),(470,1,'web.latest.toggle',1119,0,0,'','',2),(471,1,'web.latest.toggle',1122,0,0,'','',2),(472,1,'web.latest.toggle',1126,0,0,'','',2),(473,1,'web.latest.toggle',1120,0,0,'','',2),(482,1,'web.latest.toggle',1082,0,0,'','',2),(483,1,'web.latest.toggle',1137,0,0,'','',2),(484,1,'web.latest.toggle',1083,0,0,'','',2),(485,1,'web.latest.toggle',1138,0,0,'','',2),(488,1,'web.httpconf.php.sort',0,0,0,'name','',3),(489,1,'web.httpconf.php.sortorder',0,0,0,'ASC','',3),(510,1,'web.graphs.period',524,0,1123200,'','',2),(511,1,'web.graphs.stime',524,0,0,'20180901214110','',3),(512,1,'web.graphs.isnow',524,0,1,'','',2),(520,1,'web.latest.filter.select',0,0,0,'','',3),(521,1,'web.latest.filter.show_without_data',0,0,0,'','',2),(522,1,'web.latest.filter.show_details',0,0,0,'','',2),(523,1,'web.latest.filter.application',0,0,0,'','',3),(524,1,'web.latest.filter.groupids',0,0,0,'16','',3),(525,1,'web.latest.filter.groupids',1,0,0,'17','',3),(526,1,'web.latest.filter.groupids',2,0,0,'18','',3),(527,1,'web.latest.filter.groupids',3,0,0,'19','',3),(528,1,'web.latest.filter.groupids',4,0,0,'20','',3),(529,1,'web.latest.filter.groupids',5,0,0,'21','',3),(531,1,'web.item.graph.period',29115,0,86400,'','',2),(532,1,'web.item.graph.stime',29115,0,0,'20180915065959','',3),(533,1,'web.item.graph.isnow',29115,0,0,'','',2),(539,1,'web.graphs.php.sort',0,0,0,'name','',3),(540,1,'web.graphs.php.sortorder',0,0,0,'ASC','',3),(541,1,'web.favorite.graphids',0,951,0,'','graphid',1),(548,1,'web.items.filter_groupid',0,0,0,'','',1),(549,1,'web.items.filter_application',0,0,0,'','',3),(550,1,'web.items.filter_name',0,0,0,'','',3),(551,1,'web.items.filter_type',0,0,-1,'','',2),(552,1,'web.items.filter_key',0,0,0,'','',3),(553,1,'web.items.filter_snmp_community',0,0,0,'','',3),(554,1,'web.items.filter_snmpv3_securityname',0,0,0,'','',3),(555,1,'web.items.filter_snmp_oid',0,0,0,'','',3),(556,1,'web.items.filter_port',0,0,0,'','',3),(557,1,'web.items.filter_value_type',0,0,-1,'','',2),(558,1,'web.items.filter_delay',0,0,0,'','',3),(559,1,'web.items.filter_history',0,0,0,'','',3),(560,1,'web.items.filter_trends',0,0,0,'','',3),(561,1,'web.items.filter_status',0,0,-1,'','',2),(562,1,'web.items.filter_state',0,0,-1,'','',2),(563,1,'web.items.filter_templated_items',0,0,-1,'','',2),(564,1,'web.items.filter_with_triggers',0,0,-1,'','',2),(565,1,'web.items.filter_ipmi_sensor',0,0,0,'','',3),(591,1,'web.groups.filter_name',0,0,0,'','',3),(593,1,'web.favorite.graphids',0,954,0,'','graphid',1),(596,1,'web.screens.period',23,0,300,'','',2),(597,1,'web.screens.stime',23,0,0,'20180917180412','',3),(598,1,'web.screens.isnow',23,0,0,'','',2),(599,1,'web.favorite.screenids',0,23,0,'','screenid',1),(601,1,'web.favorite.screenids',0,24,0,'','screenid',1),(605,1,'web.screens.httptestid',0,25,0,'','',1),(606,1,'web.favorite.screenids',0,25,0,'','screenid',1),(613,1,'web.item.graph.timelinefixed',0,0,0,'','',2),(616,1,'web.graphs.period',953,0,21600,'','',2),(617,1,'web.graphs.stime',953,0,0,'20180917133019','',3),(618,1,'web.graphs.isnow',953,0,0,'','',2),(633,1,'web.latest.toggle',1169,0,0,'','',2),(634,1,'web.favorite.graphids',0,961,0,'','graphid',1),(635,1,'web.favorite.graphids',0,956,0,'','graphid',1),(636,1,'web.favorite.graphids',0,965,0,'','graphid',1),(641,1,'web.latest.toggle',346,0,0,'','',2),(642,1,'web.latest.toggle',347,0,0,'','',2),(643,1,'web.latest.toggle',348,0,0,'','',2),(644,1,'web.latest.toggle',349,0,0,'','',2),(645,1,'web.latest.toggle',350,0,0,'','',2),(646,1,'web.latest.toggle',351,0,0,'','',2),(647,1,'web.latest.toggle',352,0,0,'','',2),(648,1,'web.hosts.filter_ip',0,0,0,'','',3),(649,1,'web.hosts.filter_dns',0,0,0,'','',3),(650,1,'web.hosts.filter_host',0,0,0,'','',3),(651,1,'web.hosts.filter_port',0,0,0,'','',3),(653,1,'web.graphs.period',961,0,300,'','',2),(654,1,'web.graphs.stime',961,0,0,'20180919151450','',3),(655,1,'web.graphs.isnow',961,0,1,'','',2),(657,1,'web.screens.period',25,0,300,'','',2),(658,1,'web.screens.stime',25,0,0,'20180918143817','',3),(659,1,'web.screens.isnow',25,0,1,'','',2),(661,1,'web.screenconf.filter_name',0,0,0,'','',3),(675,1,'web.adm.valuemapping.php.sort',0,0,0,'name','',3),(676,1,'web.adm.valuemapping.php.sortorder',0,0,0,'ASC','',3),(679,1,'web.screens.elementid',0,24,0,'','',1),(680,1,'web.maps.sysmapid',0,1,0,'','',1);
/*!40000 ALTER TABLE `profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proxy_autoreg_host`
--

DROP TABLE IF EXISTS `proxy_autoreg_host`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proxy_autoreg_host` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `clock` int(11) NOT NULL DEFAULT '0',
  `host` varchar(64) NOT NULL DEFAULT '',
  `listen_ip` varchar(39) NOT NULL DEFAULT '',
  `listen_port` int(11) NOT NULL DEFAULT '0',
  `listen_dns` varchar(64) NOT NULL DEFAULT '',
  `host_metadata` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `proxy_autoreg_host_1` (`clock`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proxy_autoreg_host`
--

LOCK TABLES `proxy_autoreg_host` WRITE;
/*!40000 ALTER TABLE `proxy_autoreg_host` DISABLE KEYS */;
/*!40000 ALTER TABLE `proxy_autoreg_host` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proxy_dhistory`
--

DROP TABLE IF EXISTS `proxy_dhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proxy_dhistory` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `clock` int(11) NOT NULL DEFAULT '0',
  `druleid` bigint(20) unsigned NOT NULL,
  `ip` varchar(39) NOT NULL DEFAULT '',
  `port` int(11) NOT NULL DEFAULT '0',
  `value` varchar(255) NOT NULL DEFAULT '',
  `status` int(11) NOT NULL DEFAULT '0',
  `dcheckid` bigint(20) unsigned DEFAULT NULL,
  `dns` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `proxy_dhistory_1` (`clock`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proxy_dhistory`
--

LOCK TABLES `proxy_dhistory` WRITE;
/*!40000 ALTER TABLE `proxy_dhistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `proxy_dhistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proxy_history`
--

DROP TABLE IF EXISTS `proxy_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proxy_history` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `itemid` bigint(20) unsigned NOT NULL,
  `clock` int(11) NOT NULL DEFAULT '0',
  `timestamp` int(11) NOT NULL DEFAULT '0',
  `source` varchar(64) NOT NULL DEFAULT '',
  `severity` int(11) NOT NULL DEFAULT '0',
  `value` longtext NOT NULL,
  `logeventid` int(11) NOT NULL DEFAULT '0',
  `ns` int(11) NOT NULL DEFAULT '0',
  `state` int(11) NOT NULL DEFAULT '0',
  `lastlogsize` bigint(20) unsigned NOT NULL DEFAULT '0',
  `mtime` int(11) NOT NULL DEFAULT '0',
  `flags` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `proxy_history_1` (`clock`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proxy_history`
--

LOCK TABLES `proxy_history` WRITE;
/*!40000 ALTER TABLE `proxy_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `proxy_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `regexps`
--

DROP TABLE IF EXISTS `regexps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `regexps` (
  `regexpid` bigint(20) unsigned NOT NULL,
  `name` varchar(128) NOT NULL DEFAULT '',
  `test_string` text NOT NULL,
  PRIMARY KEY (`regexpid`),
  UNIQUE KEY `regexps_1` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `regexps`
--

LOCK TABLES `regexps` WRITE;
/*!40000 ALTER TABLE `regexps` DISABLE KEYS */;
INSERT INTO `regexps` VALUES (1,'File systems for discovery','ext3'),(2,'Network interfaces for discovery','eth0'),(3,'Storage devices for SNMP discovery','/boot'),(4,'Windows service names for discovery','SysmonLog'),(5,'Windows service startup states for discovery','automatic');
/*!40000 ALTER TABLE `regexps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rights`
--

DROP TABLE IF EXISTS `rights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rights` (
  `rightid` bigint(20) unsigned NOT NULL,
  `groupid` bigint(20) unsigned NOT NULL,
  `permission` int(11) NOT NULL DEFAULT '0',
  `id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`rightid`),
  KEY `rights_1` (`groupid`),
  KEY `rights_2` (`id`),
  CONSTRAINT `c_rights_1` FOREIGN KEY (`groupid`) REFERENCES `usrgrp` (`usrgrpid`) ON DELETE CASCADE,
  CONSTRAINT `c_rights_2` FOREIGN KEY (`id`) REFERENCES `groups` (`groupid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rights`
--

LOCK TABLES `rights` WRITE;
/*!40000 ALTER TABLE `rights` DISABLE KEYS */;
/*!40000 ALTER TABLE `rights` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `screen_user`
--

DROP TABLE IF EXISTS `screen_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `screen_user` (
  `screenuserid` bigint(20) unsigned NOT NULL,
  `screenid` bigint(20) unsigned NOT NULL,
  `userid` bigint(20) unsigned NOT NULL,
  `permission` int(11) NOT NULL DEFAULT '2',
  PRIMARY KEY (`screenuserid`),
  UNIQUE KEY `screen_user_1` (`screenid`,`userid`),
  KEY `c_screen_user_2` (`userid`),
  CONSTRAINT `c_screen_user_1` FOREIGN KEY (`screenid`) REFERENCES `screens` (`screenid`) ON DELETE CASCADE,
  CONSTRAINT `c_screen_user_2` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `screen_user`
--

LOCK TABLES `screen_user` WRITE;
/*!40000 ALTER TABLE `screen_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `screen_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `screen_usrgrp`
--

DROP TABLE IF EXISTS `screen_usrgrp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `screen_usrgrp` (
  `screenusrgrpid` bigint(20) unsigned NOT NULL,
  `screenid` bigint(20) unsigned NOT NULL,
  `usrgrpid` bigint(20) unsigned NOT NULL,
  `permission` int(11) NOT NULL DEFAULT '2',
  PRIMARY KEY (`screenusrgrpid`),
  UNIQUE KEY `screen_usrgrp_1` (`screenid`,`usrgrpid`),
  KEY `c_screen_usrgrp_2` (`usrgrpid`),
  CONSTRAINT `c_screen_usrgrp_1` FOREIGN KEY (`screenid`) REFERENCES `screens` (`screenid`) ON DELETE CASCADE,
  CONSTRAINT `c_screen_usrgrp_2` FOREIGN KEY (`usrgrpid`) REFERENCES `usrgrp` (`usrgrpid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `screen_usrgrp`
--

LOCK TABLES `screen_usrgrp` WRITE;
/*!40000 ALTER TABLE `screen_usrgrp` DISABLE KEYS */;
/*!40000 ALTER TABLE `screen_usrgrp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `screens`
--

DROP TABLE IF EXISTS `screens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `screens` (
  `screenid` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `hsize` int(11) NOT NULL DEFAULT '1',
  `vsize` int(11) NOT NULL DEFAULT '1',
  `templateid` bigint(20) unsigned DEFAULT NULL,
  `userid` bigint(20) unsigned DEFAULT NULL,
  `private` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`screenid`),
  KEY `screens_1` (`templateid`),
  KEY `c_screens_3` (`userid`),
  CONSTRAINT `c_screens_1` FOREIGN KEY (`templateid`) REFERENCES `hosts` (`hostid`) ON DELETE CASCADE,
  CONSTRAINT `c_screens_3` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `screens`
--

LOCK TABLES `screens` WRITE;
/*!40000 ALTER TABLE `screens` DISABLE KEYS */;
INSERT INTO `screens` VALUES (3,'System performance',2,3,10001,NULL,0),(4,'Zabbix server health',2,3,10047,NULL,0),(5,'System performance',2,2,10076,NULL,0),(6,'System performance',2,2,10077,NULL,0),(7,'System performance',2,2,10075,NULL,0),(9,'System performance',2,3,10074,NULL,0),(10,'System performance',2,3,10078,NULL,0),(16,'统一监控系统',3,2,NULL,1,0),(17,'Zabbix proxy health',2,2,10048,NULL,0),(18,'System performance',1,2,10079,NULL,0),(19,'System performance',2,2,10081,NULL,0),(20,'MySQL performance',2,1,10170,NULL,1),(21,'常用图形',2,2,NULL,1,1),(22,'统一监控系统系统指标',3,1,NULL,1,0),(23,'大数据管理系统集群状态',5,4,NULL,1,1),(24,'HDFS分区状态',2,1,NULL,1,1),(25,'Yarn容器状态',2,2,NULL,1,1);
/*!40000 ALTER TABLE `screens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `screens_items`
--

DROP TABLE IF EXISTS `screens_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `screens_items` (
  `screenitemid` bigint(20) unsigned NOT NULL,
  `screenid` bigint(20) unsigned NOT NULL,
  `resourcetype` int(11) NOT NULL DEFAULT '0',
  `resourceid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `width` int(11) NOT NULL DEFAULT '320',
  `height` int(11) NOT NULL DEFAULT '200',
  `x` int(11) NOT NULL DEFAULT '0',
  `y` int(11) NOT NULL DEFAULT '0',
  `colspan` int(11) NOT NULL DEFAULT '1',
  `rowspan` int(11) NOT NULL DEFAULT '1',
  `elements` int(11) NOT NULL DEFAULT '25',
  `valign` int(11) NOT NULL DEFAULT '0',
  `halign` int(11) NOT NULL DEFAULT '0',
  `style` int(11) NOT NULL DEFAULT '0',
  `url` varchar(255) NOT NULL DEFAULT '',
  `dynamic` int(11) NOT NULL DEFAULT '0',
  `sort_triggers` int(11) NOT NULL DEFAULT '0',
  `application` varchar(255) NOT NULL DEFAULT '',
  `max_columns` int(11) NOT NULL DEFAULT '3',
  PRIMARY KEY (`screenitemid`),
  KEY `screens_items_1` (`screenid`),
  CONSTRAINT `c_screens_items_1` FOREIGN KEY (`screenid`) REFERENCES `screens` (`screenid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `screens_items`
--

LOCK TABLES `screens_items` WRITE;
/*!40000 ALTER TABLE `screens_items` DISABLE KEYS */;
INSERT INTO `screens_items` VALUES (44,16,2,1,500,100,0,0,2,1,0,0,0,0,'',0,0,'',3),(45,16,0,524,400,156,0,1,1,1,0,0,0,0,'',0,0,'',3),(46,16,0,525,400,100,2,1,1,1,0,0,0,0,'',0,0,'',3),(76,17,0,532,500,212,0,0,1,1,0,1,0,0,'',0,0,'',3),(77,17,0,530,500,100,1,0,1,1,0,1,0,0,'',0,0,'',3),(78,17,0,531,500,100,0,1,1,1,0,1,0,0,'',0,0,'',3),(79,17,0,529,500,128,1,1,1,1,0,1,0,0,'',0,0,'',3),(85,20,0,650,500,200,0,0,1,1,0,1,0,0,'',0,0,'',3),(86,20,0,649,500,270,1,0,1,1,0,1,0,0,'',0,0,'',3),(87,5,0,469,500,148,0,0,1,1,0,1,0,0,'',0,0,'',3),(88,5,0,471,500,100,1,0,1,1,0,0,0,0,'',0,0,'',3),(89,5,0,498,500,100,0,1,1,1,0,0,0,0,'',0,0,'',3),(90,5,0,540,500,100,1,1,1,1,0,0,0,0,'',0,0,'',3),(91,7,0,463,500,120,0,0,1,1,0,1,0,0,'',0,0,'',3),(92,7,0,462,500,106,1,0,1,1,0,1,0,0,'',0,0,'',3),(93,7,0,541,500,100,0,1,1,1,0,0,0,0,'',0,0,'',3),(94,7,0,464,500,300,1,1,1,1,0,0,0,0,'',0,0,'',3),(95,6,0,475,500,114,0,0,1,1,0,1,0,0,'',0,0,'',3),(96,6,0,474,500,100,1,0,1,1,0,1,0,0,'',0,0,'',3),(97,6,0,542,500,100,0,1,1,1,0,0,0,0,'',0,0,'',3),(98,3,0,433,500,120,0,0,1,1,0,1,0,0,'',0,0,'',3),(99,3,0,387,500,148,1,0,1,1,0,1,0,0,'',0,0,'',3),(100,3,0,533,500,100,0,1,1,1,0,0,0,0,'',0,0,'',3),(101,3,0,436,500,300,1,1,1,1,0,0,0,0,'',0,0,'',3),(102,3,1,10009,500,100,0,2,1,1,0,0,0,0,'',0,0,'',3),(103,3,1,10013,500,100,1,2,1,1,0,0,0,0,'',0,0,'',3),(104,18,0,487,500,100,0,0,1,1,0,0,0,0,'',0,0,'',3),(105,18,0,543,500,100,0,1,1,1,0,0,0,0,'',0,0,'',3),(106,9,0,457,500,120,0,0,1,1,0,1,0,0,'',0,0,'',3),(107,9,0,456,500,106,1,0,1,1,0,1,0,0,'',0,0,'',3),(108,9,0,544,500,100,0,1,1,1,0,0,0,0,'',0,0,'',3),(109,9,0,458,500,300,1,1,1,1,0,0,0,0,'',0,0,'',3),(110,9,1,22838,500,100,0,2,1,1,0,0,0,0,'',0,0,'',3),(111,9,1,22837,500,100,1,2,1,1,0,0,0,0,'',0,0,'',3),(112,10,0,481,500,114,0,0,1,1,0,1,0,0,'',0,0,'',3),(113,10,0,480,500,100,1,0,1,1,0,1,0,0,'',0,0,'',3),(114,10,0,545,500,100,0,1,1,1,0,0,0,0,'',0,0,'',3),(115,10,0,482,500,300,1,1,1,1,0,0,0,0,'',0,0,'',3),(116,10,1,22998,500,100,0,2,1,1,0,0,0,0,'',0,0,'',3),(117,10,1,22997,500,100,1,2,1,1,0,0,0,0,'',0,0,'',3),(118,19,0,495,500,100,0,0,1,1,0,0,0,0,'',0,0,'',3),(119,19,0,546,500,100,1,0,1,1,0,0,0,0,'',0,0,'',3),(120,19,1,23140,500,100,0,1,1,1,0,0,0,0,'',0,0,'',3),(121,19,1,23138,500,100,1,1,1,1,0,0,0,0,'',0,0,'',3),(122,4,0,392,500,212,0,0,1,1,0,1,0,0,'',0,0,'',3),(123,4,0,404,500,100,1,0,1,1,0,1,0,0,'',0,0,'',3),(124,4,0,406,555,114,0,1,1,1,0,1,0,0,'',0,0,'',3),(125,4,0,410,500,128,1,1,1,1,0,1,0,0,'',0,0,'',3),(126,4,0,527,500,160,0,2,1,1,0,0,0,0,'',0,0,'',3),(127,4,0,788,500,160,1,2,1,1,0,0,0,0,'',0,0,'',3),(129,22,0,524,400,156,0,0,1,1,0,0,0,0,'',0,0,'',3),(130,22,0,534,400,100,2,0,1,1,0,0,0,0,'',0,0,'',3),(131,23,0,953,500,100,3,0,1,1,0,0,0,0,'',0,0,'',3),(132,23,0,965,500,100,4,0,1,1,0,0,0,0,'',0,0,'',3),(133,24,0,959,500,100,0,0,1,1,0,0,0,0,'',0,0,'',3),(134,24,0,961,500,100,1,0,1,1,0,0,0,0,'',0,0,'',3),(135,25,0,962,500,100,1,0,1,1,0,0,0,0,'',1,0,'',3),(137,25,0,963,500,100,0,1,1,1,0,0,0,0,'',0,0,'',3),(139,25,0,964,500,100,0,0,1,1,0,0,0,0,'',0,0,'',3);
/*!40000 ALTER TABLE `screens_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scripts`
--

DROP TABLE IF EXISTS `scripts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scripts` (
  `scriptid` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `command` varchar(255) NOT NULL DEFAULT '',
  `host_access` int(11) NOT NULL DEFAULT '2',
  `usrgrpid` bigint(20) unsigned DEFAULT NULL,
  `groupid` bigint(20) unsigned DEFAULT NULL,
  `description` text NOT NULL,
  `confirmation` varchar(255) NOT NULL DEFAULT '',
  `type` int(11) NOT NULL DEFAULT '0',
  `execute_on` int(11) NOT NULL DEFAULT '2',
  PRIMARY KEY (`scriptid`),
  UNIQUE KEY `scripts_3` (`name`),
  KEY `scripts_1` (`usrgrpid`),
  KEY `scripts_2` (`groupid`),
  CONSTRAINT `c_scripts_1` FOREIGN KEY (`usrgrpid`) REFERENCES `usrgrp` (`usrgrpid`),
  CONSTRAINT `c_scripts_2` FOREIGN KEY (`groupid`) REFERENCES `groups` (`groupid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scripts`
--

LOCK TABLES `scripts` WRITE;
/*!40000 ALTER TABLE `scripts` DISABLE KEYS */;
INSERT INTO `scripts` VALUES (1,'Ping','ping -c 3 {HOST.CONN}; case $? in [01]) true;; *) false;; esac',2,NULL,NULL,'','',0,2),(2,'Traceroute','/bin/traceroute {HOST.CONN}',2,NULL,NULL,'','',0,2),(3,'Detect operating system','sudo /usr/bin/nmap -O {HOST.CONN}',2,7,NULL,'','',0,2);
/*!40000 ALTER TABLE `scripts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_alarms`
--

DROP TABLE IF EXISTS `service_alarms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `service_alarms` (
  `servicealarmid` bigint(20) unsigned NOT NULL,
  `serviceid` bigint(20) unsigned NOT NULL,
  `clock` int(11) NOT NULL DEFAULT '0',
  `value` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`servicealarmid`),
  KEY `service_alarms_1` (`serviceid`,`clock`),
  KEY `service_alarms_2` (`clock`),
  CONSTRAINT `c_service_alarms_1` FOREIGN KEY (`serviceid`) REFERENCES `services` (`serviceid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_alarms`
--

LOCK TABLES `service_alarms` WRITE;
/*!40000 ALTER TABLE `service_alarms` DISABLE KEYS */;
/*!40000 ALTER TABLE `service_alarms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services`
--

DROP TABLE IF EXISTS `services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `services` (
  `serviceid` bigint(20) unsigned NOT NULL,
  `name` varchar(128) NOT NULL DEFAULT '',
  `status` int(11) NOT NULL DEFAULT '0',
  `algorithm` int(11) NOT NULL DEFAULT '0',
  `triggerid` bigint(20) unsigned DEFAULT NULL,
  `showsla` int(11) NOT NULL DEFAULT '0',
  `goodsla` double(16,4) NOT NULL DEFAULT '99.9000',
  `sortorder` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`serviceid`),
  KEY `services_1` (`triggerid`),
  CONSTRAINT `c_services_1` FOREIGN KEY (`triggerid`) REFERENCES `triggers` (`triggerid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services`
--

LOCK TABLES `services` WRITE;
/*!40000 ALTER TABLE `services` DISABLE KEYS */;
/*!40000 ALTER TABLE `services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services_links`
--

DROP TABLE IF EXISTS `services_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `services_links` (
  `linkid` bigint(20) unsigned NOT NULL,
  `serviceupid` bigint(20) unsigned NOT NULL,
  `servicedownid` bigint(20) unsigned NOT NULL,
  `soft` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`linkid`),
  UNIQUE KEY `services_links_2` (`serviceupid`,`servicedownid`),
  KEY `services_links_1` (`servicedownid`),
  CONSTRAINT `c_services_links_1` FOREIGN KEY (`serviceupid`) REFERENCES `services` (`serviceid`) ON DELETE CASCADE,
  CONSTRAINT `c_services_links_2` FOREIGN KEY (`servicedownid`) REFERENCES `services` (`serviceid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services_links`
--

LOCK TABLES `services_links` WRITE;
/*!40000 ALTER TABLE `services_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `services_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services_times`
--

DROP TABLE IF EXISTS `services_times`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `services_times` (
  `timeid` bigint(20) unsigned NOT NULL,
  `serviceid` bigint(20) unsigned NOT NULL,
  `type` int(11) NOT NULL DEFAULT '0',
  `ts_from` int(11) NOT NULL DEFAULT '0',
  `ts_to` int(11) NOT NULL DEFAULT '0',
  `note` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`timeid`),
  KEY `services_times_1` (`serviceid`,`type`,`ts_from`,`ts_to`),
  CONSTRAINT `c_services_times_1` FOREIGN KEY (`serviceid`) REFERENCES `services` (`serviceid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services_times`
--

LOCK TABLES `services_times` WRITE;
/*!40000 ALTER TABLE `services_times` DISABLE KEYS */;
/*!40000 ALTER TABLE `services_times` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `sessionid` varchar(32) NOT NULL DEFAULT '',
  `userid` bigint(20) unsigned NOT NULL,
  `lastaccess` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`sessionid`),
  KEY `sessions_1` (`userid`,`status`,`lastaccess`),
  CONSTRAINT `c_sessions_1` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('25e01e0fd98658be7b030ef0dc918126',1,1530002819,0),('672ba5dfad5cb597209a01c485cc00a6',1,1530063511,0),('81a77812e195e70b92e986d9e07d6f56',1,1530066617,0),('a76813de581c0f1ae9663ea7c8a19792',1,1530067747,0),('b0d86a663c2caaed20bfc0b193d20091',1,1530069653,0),('35b86bacf73cfbd411495d8cb8493c89',1,1530070089,0),('8b6548b4fd56be64035cdf47be42ab04',1,1530070241,0),('992d70e16ee0990ec85b11f628005314',1,1530082849,0),('991ed62c58be19c2e56892cfce47681d',1,1530093567,0),('0f17cd829e7ea41b3c700d48d0406f18',1,1530173572,0),('5baa1a834bc7b952e6d19010cd1bed43',1,1530176238,0),('dcac0e2ec64eb2966d91064a964a5728',1,1530176348,0),('2cf87eb0589bb3a406eceaabab956ad3',1,1530178261,0),('4b72330c9d366b26602c4fd75a31979f',1,1530242545,0),('de4fd3be6dc5d9d42c3ce27b389adb7a',1,1530689283,0),('6a8f5367cbbd03342edc3ba9a02fe19f',1,1530768680,0),('122daddea5c0118938380ffe3b5dd980',1,1531128647,0),('0aabf4013a189db6086d16e9a141a5be',1,1531135234,0),('306bc0b269815b428dabd762fad36393',1,1531135235,0),('f3648ae959691b10c819e0156d445e9f',1,1531188082,0),('4d58a8956e8bade182d349ef997c5666',1,1531189045,0),('39a59287f75b6631f1d84c0db08e559e',1,1531191691,0),('b811c896751b6733b547fbf5e2a6a119',1,1531216954,0),('d49c12d5014891eac5ed94c29f18969b',1,1531275879,0),('87bf9cd1d569d30e9cb33c021995faa4',1,1531297948,0),('e15f6d1af8e4aa558e733424b438faa4',1,1531359781,0),('c1c40e78a564a9376f8258405a6d9a60',1,1531375419,0),('5b70fb0866da6bdff7b9a158d93074b6',1,1531379909,0),('8c73a1dcedd456f6911fe9df045b66da',1,1531448718,0),('f27424e4368264ef419ac39aab1d2811',1,1531451211,0),('701f699ea91218746b6935bc568360e7',1,1531473884,0),('cb304f15c8d5de367b058286135a952d',1,1531708898,0),('205f5a40e1860ca3d3c05991cf3afa15',1,1531710383,0),('75f663cbab8b75375d2a621e35947030',1,1531726249,0),('e24bc47b631f0f5bdcfe9e6dbc9d9ba4',1,1531804768,0),('4757ae6c0c19baf3cc3bffa4355c7a49',1,1531812588,0),('d14e23add87a9ba7e661fa63dd7d28d6',1,1531814704,0),('55f589a5ab89c322e227aaae2d735368',1,1531900523,0),('aa501b9b0d075cca0789a05cdd4d1f35',1,1531965620,0),('ec5d3c408de61388500ff0a6a0cb209a',1,1531971823,0),('103834b9174b09397db92f83ffde9863',1,1532055608,0),('fe2043cb203147bc91f0f46cfb367dc0',1,1532309492,0),('5a49cb4e72ab43a788d50afe70234038',1,1532341929,0),('8ba94cb7fcd66143a49d0913d40a651b',1,1532484553,0),('d91987c0936c97d173da87bd905a9db3',1,1532932287,0),('d2668f9edc6d76c495f1fe6437affaa6',1,1533005985,0),('c73cb2a35f2a3b3f938f1a1ae5768825',1,1533006287,0),('36de4c59a3737e55b84c14e49f5ff33f',1,1533026993,0),('e45f89f78bd12bc908d1db0f816b54db',1,1533114411,0),('e2b8484a1beae4a72e367695b6118924',1,1533175534,0),('bc04a79ceb8fa3f63b3c4655f5f45b83',1,1533182025,0),('aed747981c76c610c1ece092344946b5',1,1533187002,0),('d6f813db79bd836fdbe5e4e624b1ea85',1,1533191594,0),('36fd3a4900ff1b8756f366bb1fd90c9c',1,1533200801,0),('879c1d104403fb131cdb8606fd1404b5',1,1533285030,0),('df3a48a5343cb64638d1aae6913bff7c',1,1533521432,0),('be3f41646b96a9d3a1e9c3000e90c5c1',1,1533525704,0),('9514ae7ca427eea608adee69edbedc21',1,1533716009,0),('6a8cd58a6c32e3a39ec5647b4e4f81bc',1,1534132163,0),('5f1eddef34a254d3a39e89490587e0c7',1,1534145538,0),('194b58191d2c8e48e648fe2e7458f71b',1,1534215625,0),('78f822461762cc1f75677a83b2fbaf80',1,1534382898,0),('a9acbf67b17cbb58d69a467d0955bbb3',1,1534498586,0),('2b2105f112e6ae0d003d4e2294a172d1',1,1534757302,0),('7474586c8cff785f176ab44e6d8db2db',1,1534757750,0),('0dfc181a97ab6666e2ace514b245ba12',1,1534823174,0),('9cf05298c07b4c37a673592dec313742',1,1534901858,0),('bdee646601a7020095757f9b8d9f68f5',1,1534996145,0),('da455a86cf6fe1752e6ac9e931e83016',1,1535004065,0),('50cd85626348ddafba5a410b50eafec4',1,1535023065,0),('dc4c384082caab999f3f1d3923756b05',1,1535090337,0),('d0a327c901afe8d0a62872fdc704e645',1,1535102649,0),('2bad3ee32da7b90225b7542713d64331',1,1535362509,0),('02e6ed87964b076d5c6ddc2ac5bf4626',1,1535369825,0),('df627740c67acbc7c77354025500539d',1,1535506663,0),('058454ea273b5b91a94c667720c3e66e',1,1535510337,0),('148caf70270aee01d8bad20a6afb511e',1,1535530777,0),('1eab55777655008f3e1c003070129591',1,1535531020,0),('b0955b7d4ccabda7431df1cffc535bf2',1,1535544580,0),('59be8b7db93049e4482292ed7d52cc36',1,1535551621,0),('2d511a355a5506ed2e15cdaa8fe87afc',1,1535593932,0),('38df82bca45e988f930908519b128834',1,1535594299,0),('428a72045d8bf6c674ad8cb2da3d94fb',1,1535595255,0),('243e08f35281a3c45406236853480ee4',1,1535611377,0),('ddb8429e64ba7491a9d188a331580a98',1,1535624632,0),('a7a1da20e9a812865c9d3eef205e61f1',1,1535679599,0),('8733c812c20d8a7350fe4b0642725a7f',1,1535681786,0),('88c3980c254c65202a9e54f5ffd248fd',1,1535688070,0),('072673d4216d5f0ff0585238f8e8bd0f',1,1535941667,0),('a1178f2c842b803b84b34ab8a50317b3',1,1535943455,0),('514c324657bac11101b9440f8932961b',1,1536027804,0),('1aebf77741377b2e6517b885a96f885c',1,1536032159,0),('001f3a92c070781031857db1146ec632',1,1536041521,0),('49055949e19229f114bd94e3de4d9c9d',1,1536043693,0),('9bda6a5dc692b158b8323f695f116cb3',1,1536046649,0),('1954e62d8da05a48b0ad0c64f2ff25cd',1,1536049826,0),('bba132d5708fab57f84bc5575c77d621',1,1536051404,0),('4e849491f0b0e383a5e5c48e74cf3820',1,1536061213,0),('d27723cfd02cd0ebe33904e0ea526edb',1,1536106619,0),('6528b14002d926a2beb0d96b42bdc76e',1,1536111292,0),('72ca3f8ab25f5597caaa0c94b1bbdfb0',1,1536126029,0),('91c19f3460d140a842d1751b7697124e',1,1536153914,0),('fd09df5a097d9ae216a3f547b4da87de',1,1536201229,0),('4ee332789ac32a042e9ce837fc10b077',1,1536204767,0),('aabebcfdd6c213071eb2bb0e72559de3',1,1536205720,0),('8e7a21321ed8d5501f93f80ce4d13685',1,1536214609,0),('d10a69752187c66fb2a8cf307d4fbc67',1,1536312643,0),('81d51fd300a23ce4f1948863a6bbab47',1,1536558470,0),('dddb53bfce77d756c79b259f3266bd87',1,1536560092,0),('76cd4073854b28d4f1fc4fdf5c91cc1c',1,1536658674,0),('b9c31b7ee87a21941484bd6d8c957b6a',1,1536715819,0),('5f2df01624e69c4a65ba4f75720258c8',1,1536724496,0),('2c075411befe35521eb769631245eb4a',1,1536734088,0),('00dc608c71481a0b1e2c346354628223',1,1536735437,0),('f46de752a6bf6e432eb17d9bce57b9af',1,1536738095,0),('5649bb61bc73907ca3fe929c4a30c6df',1,1536744880,0),('d99b2655fd3b57b58c32d07f29aa9ef9',1,1536746533,0),('66437f90ceb502971ea4939803e3a8cd',1,1536802967,0),('f1ff5ecbb95d24fa9feae743b035f289',1,1536829454,0),('6a4d20e1862417d73de0577bd77926af',1,1536831394,0),('04126b25b7e4ebec40d8cedbd4b03608',1,1536903814,0),('bb0288632ef56bb7f27f310488c0e1ae',1,1536911324,0),('3d679b657bf38b419d4e0b06418fdc82',1,1536914887,0),('3cb4b9fc4972dcc0842478b2c7cef907',1,1536917939,0),('96e2b9a3f1ddaf063e0fa039fa1473b7',1,1536970377,0),('c37cf4d837dc15d717d7181b427fc096',1,1536985617,0),('d7127fd3f416eab66d776d7fdc6809c6',1,1537068893,0),('73fae590702bd90bedc15ab5c9a9c9aa',1,1537114361,0),('f9fc3f91d3a26453de911bc9a8e614b2',1,1537148613,0),('c1f95c6e0ad95bee1c40c3221d8280ae',1,1537150890,0),('6140f33b0323075bb4da15c2bd082f31',1,1537151815,0),('272af6e57af8f9608c110c82000f3950',1,1537155559,0),('5b09c4cea385db4b809b14834cd38d50',1,1537162783,0),('372fdfdb382bb72690662a23fc050609',1,1537170874,0),('1588021b8afbc91f22780c9529e10419',1,1537171954,0),('7a7e01055f7a397780260b8ec30ab09f',1,1537179362,0),('a8b64f7c7748a662d02a5d7e88378b21',1,1537181289,0),('0ca3065b69db439708a75a23b9765de0',1,1537182146,0),('7a88ea654b62ae0079e15f45565f47c4',1,1537234590,0),('8180b9c7980296c7c35f9de3b7dc9df4',1,1537253061,0),('e4c47b0bc69167d692bfbf24487bde3e',1,1537256574,0),('e3da4b7947bab4c5f54ab0674b45685d',1,1537327035,0),('6956be7ea7c17daf3d244856d654139f',1,1537327276,0),('22da36bfaa1054b5f9ffa4554b5f2a77',1,1537327907,0),('9e362e1eea2542bc1805d3f520e65f17',1,1537329451,0),('42436c5ed4ec6586e540a3ec3c809d56',1,1537330863,0),('992b2b1d0009fd08ac9733f4f74fcce8',1,1537335131,0),('56429d555da37dee21ca0ee97c32905e',1,1537335810,0),('62812975332fc9b63696d2d5f1f3ab83',1,1537344174,0),('f83e6a5ee88b2e966bcb96266aced2c2',1,1537345588,0),('259feca3d108c7c82fa855219ebd8238',1,1537346094,0),('591a18b14392d2ce239f2581f6898a41',1,1537346503,0),('d9695900e72382b92de70436f8879bff',1,1537421251,0),('46f617560310035f10b09b6dbe37b859',1,1537421605,0),('98a26b97990153e58f63a4aeaaf126a0',1,1537422132,0),('33f8eb8a9d661163827e4a4ad67e2a30',1,1537457515,0),('bea5d25a3b71d8a34e8f8ad57a4fb811',1,1537495626,0),('822a03b574c59af607e8071bb0b1fc22',1,1537499394,0),('728ce45387894dfeb768e2bb1476fa4a',1,1537502149,0),('08f2129c9fad797e47ba75dfddf9b643',1,1537522367,0),('3906b18c059eea528260ec45c5e3023d',1,1537525503,0),('533a9e631f18d595923c04bdc6d74304',1,1537803668,0),('f78b0d62b9096445c6382be0bf970b0a',1,1537841538,0),('85786c139dcba383ff0fdb52ada669a4',1,1537068510,1),('cedc90fb48f07fc6938d91f979b91c84',2,1530001043,0),('0d5762b7f37b47bb96eaabf33b46a200',2,1530001052,0),('bcd01b4491319af044e0cb663d0725a6',2,1530001052,0),('e8037961d901fe6fc611d35c0c54d0b5',2,1530002596,0),('1f2138500df6728347db92e2f6003a57',2,1530002851,0),('e02855c933db0fdf79fa7a710792af55',2,1530002863,0),('f754478ffad2be7be2829d67fc54063e',2,1530002863,0),('2d1eff3dfac0c37dc04fe34c4ba9d9c3',2,1530010098,0),('80fafaa0c9a6066d1d0997ffb9504736',2,1530010098,0),('059e50a217be951ee65046dc8419d526',2,1530066305,0),('2cf2b1656166e7304df40fd770496d32',2,1530066305,0),('525d1d5677b915ce3f6cbaf0d32a4af9',2,1530066305,0),('63db22e83ff1f8734f7011c125ba2437',2,1530066932,0),('137514bf83708dff3f4d00fbf25dcbb1',2,1530067225,0),('3d8ad6a65e168fc046fdfa9342081790',2,1530067225,0),('6a149c023975eadd478081c42fecab8c',2,1530067225,0),('2ca386a9c580b5f3b60d980552085d52',2,1530067745,0),('2e57e81149e41191a5704a7cfdfd2d1e',2,1530067746,0),('558a899ab77363cf99cbc71ef8a97c9a',2,1530067746,0),('d9fbbc0ddcf9d33d87704a8494783c37',2,1530068898,0),('8abe17ac3c806344547fd3eff68d096b',2,1530069384,0),('b4696c3299209cd27832b249b0da2762',2,1530069384,0),('f810df48720516c2b29f86e618c511d8',2,1530069384,0),('a7328c6bb1ac4c3fb727abf9498202b7',2,1530070067,0),('bb1b2f67664d03991b8063df72456576',2,1530070067,0),('6b1093f9fa8d13d3d700a39ebd7a1e4b',2,1530070068,0),('983487e114bcbffe03495d4c029cc371',2,1530070410,0),('912102cbe13ebb221db6fc43c3f4e4ae',2,1530074538,0),('876c036805322242b638d84b23da3b9e',2,1530075018,0),('681dae500a93b2396a32693a35834715',2,1530077298,0),('06feabc82507bea53649f1b354239b39',2,1530077538,0),('65c2d33d95c6f4a950e5acbade33e613',2,1530080410,0),('b455df1667795e04d0b3c8c0fca20e08',2,1530080410,0),('c8d7efb5e9b4ac6dca17d029e4d69e8e',2,1530080410,0),('45979e6a64f1784a30a4840ddb3017a4',2,1530081872,0),('3ae677b534c1693bfe531bae9bb04256',2,1530082751,0),('4826800d7579ea03b25add3bd82b7c50',2,1530082752,0),('f6bd4db086242df19c3fb94bdde753f5',2,1530082752,0),('fafd1d727c1c3bd1933625464f99986e',2,1530082920,0),('83244e1c3f05720d58ab9ed63644e2df',2,1530082923,0),('6d5b11c9b043db611aa9d70800fed0a9',2,1530083160,0),('166ddbdb42c31ad73a16610d30abec8f',2,1530090498,0),('03f5d86b4df0ebfbf2b9a4a7167517a0',2,1530152361,0),('67a3002482091fbe7aeef4601a9715dc',2,1530152362,0),('dcad130770c48497be9c30a70b10c52e',2,1530152362,0),('e599404e86434d41c50c2c93ed5b5f0d',2,1530162258,0),('19be48935d2182eef5e54236f37734f2',2,1530172036,0),('53ce5c0df3417463b35721dbe1c07261',2,1530172036,0),('a0854f677550e1615a9b3de54055fbd3',2,1530172036,0),('34c42e832c92a6f42779d5d7eb41794f',2,1530172044,0),('91a7245a48e842925891280cde0c08b7',2,1530172044,0),('b80023529485635804aa627e7d4087a5',2,1530172044,0),('97c75c2741d8d345d0990a5c5efb207d',2,1530173583,0),('a13e2374a255c86a25b42f4355407185',2,1530179298,0),('bf3b5e7a452821723fb52da1e62f50f1',2,1530179418,0),('7cd36dceb059e63378d3f6d93ec9964d',2,1530180738,0),('bc293a7c11a1dfa0affef1a858b05091',2,1530187218,0),('4135e137abf20fec4d0b24b9cf3c87a1',2,1530242486,0),('d40d161c07a6419a9bf23c64521a70c8',2,1530242486,0),('6692dd62c9f64811b37dab9ff66a5bde',2,1530242487,0),('3af384dea105ca84f29afa9f41d3db97',2,1530249738,0),('73395316fa562d7a7ad57bcd2043294d',2,1530689143,0),('6d6e86e903eadf4bda803e262fae2278',2,1530689144,0),('b13edebbaabd260c6fcf73efa26d931d',2,1530689144,0),('190868a9c3f2989463f6d0849e8c1bf2',2,1530696389,0),('29895aa6f834a77d123b8aa282291f81',2,1530760911,0),('30a669cd863b411ed485d0ffb83b39cf',2,1530760911,0),('7af12bc5f6a0d4b5fc506530a1f66d05',2,1530760911,0),('9d1a8d10ea190e2e19fc13d4974d4d38',2,1530768509,0),('200e864a734113ea661200564725a520',2,1530790871,0),('9234e666a3b84ea9d33329cf769bd432',2,1530790871,0),('302d99499c6b82adae55f1d3ebb207e5',2,1530790872,0),('61bd0d8d6f529ecb6aa1991555c233b4',2,1530802349,0),('f4e37b298e06ed38d1a7a7d660fe0a0d',2,1531109429,0),('2969f98898ef987d5c768de385359086',2,1531125097,0),('c5871ba87177a7ba95eccde91bff76a8',2,1531125097,0),('d41162edb19feab9ba53b02b14874c63',2,1531125097,0),('343d586d388ec6237a98ef5573cf6a1c',2,1531125933,0),('76c34d6819aedfe3f44da578024eda47',2,1531125933,0),('8a5ed4f2797095c004750f6d5fc51cc7',2,1531125933,0),('c9a4116caa174ccf1e46469a0a2a70f6',2,1531128636,0),('388aaef13a13b3bb8114afb9bc9f8ab4',2,1531128647,0),('90aa9373666fb9eb06e4785b3af533d7',2,1531128647,0),('7cc7ad4c37cea2680a1d4297ff36160f',2,1531134509,0),('42c91c49239034d2b00d921a9b6d5a01',2,1531135215,0),('efb4326ac33f0455de947ff24ad4a60b',2,1531135949,0),('9315c51828cb8d033a79bdfaf3c412ea',2,1531187491,0),('38e9ba0e9b50e97ae3467ea0e4888380',2,1531187492,0),('beec7d33db19771767af70d720d0df9e',2,1531187492,0),('25e63fd2cffc0b1c2d048dce5bf965a8',2,1531189589,0),('d0b565fb559f6ec3d8feb54b5b8a4ea8',2,1531189589,0),('dc4aba2e3d61c0ed09a39e0b6b783093',2,1531189589,0),('c915fb129d5192cfe2ec2fee21625d53',2,1531191702,0),('3ce41da11770b0a5f7625a5f10e515dd',2,1531194749,0),('13ce685832ba58bcc72db23d191be98c',2,1531196309,0),('125a1f74a32501b9f297bb0b1fcde28e',2,1531206573,0),('4c1547ab7cfd8c02234aba7cfcb07e82',2,1531206581,0),('d7eb4c9107333071d6bbe814727fa732',2,1531206581,0),('de51e0f74ffaf22ee240191e705ff852',2,1531206833,0),('e9101c48491ee858eafe7807c112c8ae',2,1531206833,0),('f6566fc77fc4ca2632ec9e37ab8b28c5',2,1531206833,0),('cd7474eb50aec383dd04446229e99536',2,1531213829,0),('e07ce318088892675294e0d02285dc0f',2,1531224629,0),('024b5cdd629f662120cd3be528d92089',2,1531272959,0),('892e82464001e617f01ec40b9845a56c',2,1531272966,0),('f4ce8e18898e68659bb103c402017260',2,1531272973,0),('35e13865c7eb9877a2daa05e91f16b3c',2,1531273342,0),('d2e5526664d655084c3941726a514d32',2,1531273342,0),('9059d3a5ac73f43e48e7d76d5670c989',2,1531273343,0),('d1746dd90c1af5b6905b709a4370abff',2,1531276097,0),('46f8835aecd6f43bd822891810a97697',2,1531276098,0),('2500ffa968ce55c9981b9f8e8b204b09',2,1531276099,0),('86ebcaa0c6648af1666a2ef1a47221ee',2,1531281140,0),('9aeaa2ed1c6b2a8a28bfd1bac227fd36',2,1531281140,0),('24fa14ba6dc3fbac1656c274936a9d97',2,1531281141,0),('70553489a0658198b057d3cd7ebf4add',2,1531283309,0),('b1438c27b2f401a1c7413a8e190b5d0f',2,1531284029,0),('b98a99ac21e72f45d0fb053578322ba9',2,1531288349,0),('d375e0557fb700b9fb5378955967520c',2,1531290964,0),('b4275c5dbad09e36f5cc7b23d9eda303',2,1531290970,0),('c19d6c37e85cd158e420cb23d0a6fc2f',2,1531290971,0),('937bc7b1fa7c59b87be590016753f35e',2,1531297589,0),('019ef6782c0d99771cc06fa822b9d390',2,1531297590,0),('e4ff92f0f13b580ec6d2d7e539d093a8',2,1531297590,0),('3168598e48a1d53a5b57c8aff879e116',2,1531297745,0),('7dc00c42330841a1ca7a3fc745ef881b',2,1531297745,0),('c2ba2943909d2cfa53f67e7220bf7d41',2,1531297745,0),('b4392ec3b6a913e518272c635d151d8e',2,1531297930,0),('24aea45fe6d2abaf39bb81c8806645c7',2,1531298189,0),('c19617831dcb7d875504aefa95db2959',2,1531301669,0),('6af8d76774a475733e41ce214a6dfba5',2,1531304531,0),('5292c7815f6a193222596dbe6fe7ae8e',2,1531304532,0),('ba499126de83fc97d7a5276986050b89',2,1531304532,0),('7c96a2e45f0d42da8bacf0085af5b82b',2,1531310669,0),('b6219055b8faeb8246246c7becfbe0e9',2,1531311749,0),('64ef44e751700c5320858aa023fb7dbb',2,1531313909,0),('a5c756c53ed3a5615b3cf0c026b03b94',2,1531371869,0),('2fe3a0fc3dbd9782f0081e9ffe5fa1b4',2,1531377989,0),('30914678496f8228b6f16b711796ad7d',2,1531377989,0),('797c1fffc89729ba5f3c99d8e4ffd3e2',2,1531377989,0),('11c81118b962f00c28d1764115d21196',2,1531383389,0),('e0d47f3e218b90d074f2a28f5e9d8656',2,1531385309,0),('db07566de52a6eac459bca692220ea1b',2,1531390589,0),('18046c25f7068a9b39cf4eaa168ab8e0',2,1531448702,0),('5a655b3bcc6e7f28745166a0251aae52',2,1531448702,0),('8d469500736b391c2499cedfde1a5302',2,1531448702,0),('1c1e0d64179e12cfb26bda6c794a6d0c',2,1531452509,0),('eb10f96b45ed5429b9e19284d40ab4c6',2,1531455989,0),('77d558f52a55dddd8e8e931b11461505',2,1531458509,0),('a0005bcc38bcd998048641f8fbd63083',2,1531460487,0),('d4426532bcc10333c8c30562ffa13b3e',2,1531460702,0),('9c78af3c8364102bc9b72ba5a73cae49',2,1531462752,0),('1c789642a3c428a2b503d17b7af9d14a',2,1531462753,0),('24b7d986e36a82017152c6c6f205001a',2,1531462753,0),('802f719c0b69da50f53795ddcc7f8b63',2,1531470029,0),('71c34d2896cef53d979580b6062babda',2,1531470389,0),('8c7590fad7b5533269e7e9f147be0007',2,1531471200,0),('b639527ab54dbab6c0c3cca09004c761',2,1531471200,0),('d462d5ca1d39121234a91eca7536e4d4',2,1531471200,0),('30ef27fdfa2e7efb4049a4c6f2c8485b',2,1531478429,0),('18e525ce4adaef3a7f5bf09feed13d76',2,1531480709,0),('f34bdaa74a53ea22bda8ba5921dafcb3',2,1531481343,0),('74f022cffb76f7f26a36dff536e8a9a9',2,1531488149,0),('699e0254af34130de6b5f8ac52620643',2,1531709731,0),('73e2f24f725980a65aee27252f131e2e',2,1531709731,0),('339cd868779974ee73a3a41af6320afe',2,1531710377,0),('6d33a724941d5e7cc06a78a87be29dc7',2,1531710377,0),('798b5f4f873127c48087628422635947',2,1531710378,0),('375e5170bf3eea7502d30ece92c79875',2,1531711831,0),('41757c604603e9111e0d1ad3757f2e38',2,1531711831,0),('54e14ddf084acb568a875922db973093',2,1531711831,0),('92a7da54e7a4979c75a0f9f9991b2350',2,1531711831,0),('d528901ee03eac1235a9b3784d3a2645',2,1531711831,0),('f3ba8eb0acc9e6c6fd78d50072364618',2,1531711831,0),('fe044b4dbc96c0f319d39fb4e1801079',2,1531711831,0),('a2c2e8c4c9b442d6c1cae8c6cba2f81d',2,1531711832,0),('c516de2f523e36f8f8f458aa78796069',2,1531711832,0),('e03e5e4ff75be6c97422c7750841eea2',2,1531711832,0),('8f71319dec2f5a6d7dadd3a674911e97',2,1531712431,0),('5b7fc46c0a540726b6b216d7964204d0',2,1531712432,0),('b6f48734b975e1dd8cef04c2d02d3a2d',2,1531715549,0),('8841a6087f877570677e3db562a0006c',2,1531715909,0),('6f6b2ad3ed80f9c7bb27230df3406b93',2,1531716269,0),('178d8eeae6e73e431132c84048a97d42',2,1531717589,0),('c392aa6a5ebbea12722bd031108ae72e',2,1531729349,0),('187422c6c6edd6c59f32182a14edf715',2,1531733549,0),('b7e35756963c1f82eb1dd6fddd29a92a',2,1531796844,0),('43864eeda5e1fd797fe961b6fe34d990',2,1531798536,0),('698507802840a25697121dbcc98b4d8f',2,1531798536,0),('97865cd5fa422af4f93949d332d5353a',2,1531798536,0),('12275b3c119a71270e9dd4e3048eaf8c',2,1531810949,0),('dc60ced1fd5b51e106dfc0cc251f6cde',2,1531816024,0),('4ee13c0fb338268645b0c740accd5f99',2,1531900517,0),('cc0784ca10febbf59d0fd86b2999bb67',2,1531900517,0),('3fbe01f0c5308a547408c987e8e05fdd',2,1531900518,0),('f20a376980ba86a4aac3dc02b0267fd8',2,1531907804,0),('3b7ba592a295142a67c01026f81aec82',2,1531962888,0),('8f37bb8f103436921fedcc27766d2062',2,1531962888,0),('f9339b0d1833358ed80160f9bc6d5a28',2,1531962888,0),('11191dca7026216b8330d21b0d01e078',2,1531963379,0),('158f733c5c89c0f1d95f1c9d7914707c',2,1531963379,0),('7ebeaad30c84841c01793eb963902c28',2,1531963379,0),('85d0e7fef001867ff23be76b44a3ddd1',2,1531968162,0),('26f39bb59488cf73b23f188afffba4aa',2,1531970461,0),('376f318d9db1f5555772a8e124bf5b20',2,1531970461,0),('5a0458bcb0f4ffd39e84a7c603dc9285',2,1531970461,0),('938810c0aefbf4f0a6bcd938b504aed9',2,1531975365,0),('481f19c124d623f361e778ffce388161',2,1531978005,0),('7bc573b5d88b46d2cef786fc5b27e34e',2,1531998285,0),('4cf809e87f465396eead5c79ec9c1fb4',2,1532055552,0),('5fc46f47fd309bf512a4b317f0c95378',2,1532055552,0),('d7fb7adb385291e36903890026a04c3e',2,1532055552,0),('5cabf568eb938ec48e4c8819e5d76308',2,1532062845,0),('52bcf07608bae1ac61df9ebeff8574b5',2,1532064645,0),('4e911b4a8bdd3d7665a37dfc398e2e3c',2,1532309456,0),('4f20878bcf4c2bf9dc186278e55cac24',2,1532309456,0),('f985303eb3ea0c298fa2d9da15b033ab',2,1532309456,0),('4e3be533f4bad1573b427fcf27d54da5',2,1532310599,0),('7f81f06cee189d823bd70b30543f7ffa',2,1532310600,0),('96c9f0d856dbe54ad265fdcd2cf04fe3',2,1532310600,0),('17f03e5305c46eae59811a4fc34d3c38',2,1532317605,0),('5770206725f79a5532afe38337097bdd',2,1532317845,0),('f6e77e1ed7fcdcd05cc9e23d02061d93',2,1532338782,0),('b7612b523b8365b715eeda48cd9a9853',2,1532338783,0),('fe9e6855a2efc9133304a1f7ce26337d',2,1532338783,0),('6abd702da2a256e2c5363eb5e5c1ea48',2,1532347725,0),('930ddd995062c53f3428f132ed25fceb',2,1532404485,0),('a4a91556b83c19d5271f81d5fb7d6f3a',2,1532491726,0),('57120418dcaeb121d904772d78361998',2,1532938421,0),('61eff82fd24fc535a3473f6b605dbd08',2,1532938421,0),('79cc166bc078b000e27de74538dc0502',2,1532938421,0),('8e25c1c861b0189f77dad89166efc13b',2,1532939446,0),('d4330dd993447c4a2480c736d674687d',2,1532951686,0),('138e619e5d57dac2870c6f70cc3907cf',2,1532999499,0),('0ccdd1bb1c841af49d27755eb28861c5',2,1532999788,0),('55df91e1d30480677d803f4b15407937',2,1532999800,0),('56e53a9f470d003166afcb5673330ed6',2,1532999800,0),('c1e4cae8a411ec9280eda7ff75ac3106',2,1533001650,0),('b9553d1df4ba87d18de8f6f550adc84b',2,1533004335,0),('7d70c2fa724d2230ff923e782ba1b003',2,1533004427,0),('737ccca3de319ce6c07dab0c147d4d74',2,1533005974,0),('f277c3a6387483d95ec281727b8576a6',2,1533006268,0),('32d0fa4df768ace57ad6c5b0000fba0e',2,1533020468,0),('2050ea15c2841433001cc419dbc6e17d',2,1533103671,0),('862695ff90b46232b4c8544511b2b4c9',2,1533104008,0),('d09ffb442d62a1842a5db3b0b48a0880',2,1533104008,0),('5057307ba1b47a1367e23e6a8a353f5d',2,1533104009,0),('235d2d8a8639956ea098323a827454e4',2,1533172231,0),('9a30a43e7eaecc1261eb129b0ed165cf',2,1533176952,0),('28a39ef40692248e3754e583fae1343a',2,1533185090,0),('67659f7469a75caad9ef6382d49efc6d',2,1533191594,0),('44ba9c0ae0a674359edc2c4b9329caa9',2,1533283328,0),('e5060731423c2ebb388d8317a202b0c8',2,1533521430,0),('85f6e809a77c08ee69a1e49ae90c63fd',2,1533525698,0),('bd6e3e7abd68fa6ebce6493313970662',2,1533715670,0),('7346af392664bfa98e575db9fb12b68f',2,1533874563,0),('1e8b5e7d5561e5bea9bc9b8082348498',2,1534132166,0),('86007fa5922770325e554b63565843c4',2,1534145533,0),('575f10fc2dc690df614f34f8d89cce1a',2,1534215625,0),('50ff48ab2545ff5f5f5d520c18828768',2,1534381379,0),('7fd0f18144d09bfc3888840101c475db',2,1534387189,0),('c3e2e445c5ed3c9f8444d74c32943c66',2,1534387205,0),('426e1caeddbe7bbcf4a89ded9c1371b2',2,1534498399,0),('95c48e4c3f8bdc91992f24e5ebe9d3c0',2,1534729933,0),('4afcbdb976f8a3074bc9ced26af3691d',2,1534754648,0),('f859c62736c98faf09da7ec2b6457326',2,1534811008,0),('d50af83940bb2801be2a6e72c62c2c42',2,1534820055,0),('44b53c6617802c2312c3044a25801f26',2,1534901636,0),('41f8095072f2eeb759ddc1cd9c01b907',2,1534915080,0),('9ccf31d5aa610bd16b67f9c6b159932c',2,1535004028,0),('b78581bbe82bbbfb716fc14394a4b82a',2,1535019433,0),('ec22f953f63ebb3ab7aaa733c4ff81d1',2,1535022251,0),('c2d17ec6453f11b480d69dc55979bd15',2,1535076042,0),('dc777bf33e110a3934758dc34bf5feda',2,1535080464,0),('fad26ed5abaa85e62a533573405df0b5',2,1535369677,0),('8eab396e2a71a15470e39f9945b06f20',2,1535506658,0),('d9ba7388fb4d545814b1f35cdb442276',2,1535510321,0),('2532006ed286492d6d27ad45893dcfc0',2,1535511720,0),('9e1b018dd69b89ba860a1280278c3e8b',2,1535530713,0),('dde26ef2ed4f0b71ac41302c183c775d',2,1535544423,0),('bc1aad427cf1d2eb94bdd17de7d4d1d2',2,1535551500,0),('0c2be29974918412d2305c33ca94c4da',2,1535593916,0),('f5de025a40233b0b6f6c0b7b14e003d8',2,1535594057,0),('3605db2e3af536e1b2bcfbf11a0e9e57',2,1535595075,0),('aac44d05e3b8082bd6959285853d8f80',2,1535609864,0),('1b77021d288687a160a0da5f0cceead7',2,1535613447,0),('8b8fce2fd494c93099c46a8fb0bc09a4',2,1535616298,0),('d6911ef9691458722793e0e2f3bdeb31',2,1535618902,0),('13c8c7bc3a394bb03bf1f2ed6051e827',2,1535639618,0),('b028940cfc9c197bb4de578f743da098',2,1535679024,0),('93037e6d3aa45f8471501dedbc2391ea',2,1535681745,0),('6b58999d6bab9a64cc2069b1c5616b8b',2,1535682766,0),('61cc179dd0423c854786046b3cdc1e79',2,1535709369,0),('2ec06b9ee6d92a70237f3898d57f4ac7',2,1535710480,0),('546c514986447de3fff963a4931858e5',2,1535710483,0),('1e94980b7109a635f786cff7062c09de',2,1535782091,0),('652305fd79da93693992564d4cddd215',2,1535792848,0),('44eb39dfe04245f98dabbb79c0bfb025',2,1535911658,0),('c56e3c46f7ee078ef5f740fd88144a19',2,1535940871,0),('4c0d679124071814ed9fd790010b3b27',2,1535943649,0),('9bba1323e847a8a2b782bd1ee953e5cc',2,1535945775,0),('b6c458c383a88ebfa1f87345964326d2',2,1536024245,0),('423072c9169b9c58553f686632f47458',2,1536025003,0),('96bf3a73b744a6d34cf325e0917e02b2',2,1536025003,0),('0ca59ac3fc53f29bee10a3a8769315bc',2,1536025004,0),('45ab181393105ab12f96b79a5fc54599',2,1536025004,0),('77b2cd0be353ca6b4b2767e9e29a2807',2,1536025004,0),('7deb7f54024809ccbfd3ff7e1eb17106',2,1536025004,0),('9f5ec9ba62ab6fe34d0a6e1eda4d2a67',2,1536025004,0),('dda10e8048588c34a931780fbc91af70',2,1536025004,0),('f64063b54caf591a130b7530748fed5d',2,1536025004,0),('f66fc5f482e345000b4c52a6eb881561',2,1536025004,0),('5d21691b8acbdfad09f17ebfe447cc96',2,1536036544,0),('1b863f53885613dd75491f022e69c1f7',2,1536040102,0),('a06c35cd99e5c1dd005faa44b36d1e49',2,1536042246,0),('6c3ed03b6c0ad8584df40eca4463927f',2,1536042249,0),('5373658bf094c43596a53c2ecab1447c',2,1536042273,0),('2c188c529020a7a43867337d8d92cd81',2,1536043948,0),('a122ac46ef8fb38f0226ba71f1735360',2,1536046637,0),('6fcc17b6d5c7f4e0fddc1e665a244d0b',2,1536046643,0),('da0a342b40de51879595b22834fbedd7',2,1536050896,0),('8683cf73fe6c49674e98ed80d17cf5db',2,1536056797,0),('4c80c4e01f1a724d5b9b468039d40d38',2,1536057377,0),('30406d1a4077e6197095117fb5956200',2,1536057421,0),('0672371b22419cfa5f2e1e1e739fcafd',2,1536061207,0),('4fbd2dc3fc9f180a7f39c37f2991d775',2,1536106603,0),('2fb59198f407221dfbd8d7d60f70476c',2,1536112199,0),('5c51a0bb18af96545a3f39852e33a8e7',2,1536153818,0),('02aa3498aad9d3a36f9ca3f64abeb5e4',2,1536198075,0),('6d0a3a334b79e076163135913e610c9d',2,1536204752,0),('adeb3bc60460de8bb9448f846f122fff',2,1536204892,0),('a56740836fe8a121c25235f4f70f004f',2,1536204916,0),('9ae343c1068120cede437666615f1882',2,1536214603,0),('adcdc2e20f4e047fc6f7b61c71eb080e',2,1536230177,0),('b60c539d576dfad253a5aeb0a77631b5',2,1536283096,0),('9bb0e6e6367b79797c0be6983e02b9cc',2,1536558464,0),('f0117f755039f065d196a259704ed7d4',2,1536560091,0),('e92dde586a2b6af042df36beb13e5663',2,1536640819,0),('a96bbb17e0ce171f0f28c5fbf916e85e',2,1536640828,0),('8b9a1af8b7a96da9b139763640eba7e0',2,1536657618,0),('973e512083475d6f1508618b77de7a86',2,1536714174,0),('c9ede9b8318a03c2a769a9e23e9166e7',2,1536715866,0),('99b9233763987fc6fb40b3188488f724',2,1536721645,0),('8d060a916b912d723adfd9f0ffdee054',2,1536735448,0),('39a73dd92cc3bea5e826f8e12dfd9aef',2,1536740221,0),('87bc96ba87b450fde51c58a68af6caf2',2,1536744767,0),('ddeb8432c81b74c55dfcdee0403d0acc',2,1536800310,0),('e8942e1e48437d1376cde9ed9f9b4f37',2,1536801956,0),('145da3da9314abaa6d790dee13c96001',2,1536821768,0),('8872037bb3458ad2a723c55c78d9daac',2,1536825348,0),('3fd6b2b504df2933e0b0d27641e5f25b',2,1536886372,0),('bb87988141d355c26b6528a1ad2377e6',2,1536903715,0),('45cb1e791fdb4953d31d289eb46e3bad',2,1536911165,0),('8057a04d3ab289a64ea3ac0d308eb431',2,1536929459,0),('36c33b3c1f61512911543f12a5a6b8e4',2,1536985617,0),('1148f851792cfd0335c1c519e108e205',2,1537068442,0),('661dcfab64e8b81b86ca66b515c54747',2,1537068592,0),('788bece127c9a8e0e588a656580c880e',2,1537068900,0),('84c2c4fcc43e3524e0220fa828e40267',2,1537145167,0),('022ae3dcfa2ef8e762c7c2bf0fd50978',2,1537147326,0),('0597c09e3ad72b933b5e1db4831b56e7',2,1537148596,0),('eecc879bdd0a81b152c5e656dbbe5f62',2,1537148817,0),('25cad140d41fa2e7c359daafc6a158a6',2,1537151815,0),('b093e08bc0fe6d456fd64e86a0f5d8dd',2,1537155879,0),('4f8de04209a0a1b9d40a44361260f112',2,1537161938,0),('89e279a2304501c1993fe4fb456b040d',2,1537163182,0),('33b8d0e6cd4f2d2a3fac27526fb753b1',2,1537168826,0),('f985ee796c8026d7ae2314290fa2607c',2,1537169125,0),('2beee544b49ee4fb502be1a86b39bd88',2,1537169399,0),('5c468d4c3e457efb2bcdd0647f8f2bc8',2,1537169399,0),('5dcd6b90168d9cf9d4137f0fb73116fe',2,1537169399,0),('67fcdb3104a2b4be9e1eac95259b1c0e',2,1537169399,0),('d36a31d6180243837dffbc24490b72cf',2,1537169399,0),('da1c9e1ef18f01fc76934cb98f2e2b9d',2,1537169399,0),('eff712f8721ed7b38537917d101b8cd8',2,1537169399,0),('ff4c2a5022c45474df616b8975b0e630',2,1537169399,0),('0628a38093fe071b04f8c3b53725fb60',2,1537169400,0),('0712bbbcc5a9532380e835e4cc891628',2,1537169400,0),('1c5ea44f02fe4abaf0501e0fa5ed87a9',2,1537169400,0),('1e4601840906e9b08717a6a1ad6922d1',2,1537169400,0),('2ed9c3011fe0db2f8e8a35f93f30f0b6',2,1537169400,0),('3b0e7699c440b72e5d38e226f8ff57d5',2,1537169400,0),('3cc069b79260f2fbc79fbd01a0795876',2,1537169400,0),('630ebda1faf1c332f03e66ab679aad76',2,1537169400,0),('6c5124496d9483b20bd15145b0fcd273',2,1537169400,0),('73f80b1dc13c295c30ee8c7811734295',2,1537169400,0),('7f83c1ba3b4d8e43146de09bbc67eb1a',2,1537169400,0),('9e0d9572f5eb75507542e20ba465a155',2,1537169400,0),('cf75c174c0164865b5674a683c10f40e',2,1537169400,0),('d8d12bdacbfa4181fb77c190eb4796ba',2,1537169400,0),('e12a7ae19834051a46e74067f2cbe14e',2,1537169400,0),('f4ed94a39051360e2a80b1f9ed62d9bc',2,1537169400,0),('0f93b72c7c482e1f5519e191c95379d6',2,1537169401,0),('147aa0d181de56067b5cc0b2f2d22ca1',2,1537169401,0),('33f1f57498eaf46cfe33004243845435',2,1537169401,0),('376fab05b42e6893e30d6ef472da1c94',2,1537169401,0),('77897e6ce87a3f96a3c47739a333ab4a',2,1537169401,0),('843fc12bfb44aeddf3865444da412838',2,1537169401,0),('8d9fbfc8c42876ad79aaf7d0c27c26cc',2,1537169401,0),('abb8eb6727e275f9015e73f8fe9382fd',2,1537169401,0),('b4b51e7e014ecbcc08fda89c4138c402',2,1537169401,0),('be01f04ac8a7ae1d43d413ace080fdcf',2,1537169401,0),('d3e6adb70a5a4ae3fb17e7d4d362f9ac',2,1537169401,0),('dc1fad5d3daf027e4665c9c3b4fb1dd1',2,1537169401,0),('e4a1ee99952b058e8dda9fdea6507dc0',2,1537169401,0),('e8e0f0bc9db68a29074de246b7db0e76',2,1537169401,0),('0327ab03ef636d4a2efcbfa817ddfe21',2,1537169402,0),('07e71b9f0f9b6e64e6d69ea8aab3cd95',2,1537169402,0),('0bdcd72fa664f22c0fd1f5c13227bd33',2,1537169402,0),('1399a3723b216bfd3e7d54be1771cf96',2,1537169402,0),('4cbfde3f0b1b386a6b36c48e073332e8',2,1537169402,0),('553ea78e292c2f3e81d1ab141b89c572',2,1537169402,0),('69584fefc5c2220116395e3484d6b64c',2,1537169402,0),('817d5af8620d01915b7e1628f9d09ef5',2,1537169402,0),('8698bc43cc9fef64096430cd15d67894',2,1537169402,0),('94695df2a5f41801a0c148cec4e3ab8a',2,1537169402,0),('c062836adc58337c035789dee7a24ae2',2,1537169402,0),('ec7e2ca4e0b82f1b6b70f713b876a8eb',2,1537169402,0),('f7b3bdb2c1888961665103dcd09478e6',2,1537169402,0),('fde1d5115d565f961c90d52c76c424ca',2,1537169402,0),('0ede1e8ff5cf37c6176b70c28ef62362',2,1537169403,0),('2d8b48e03858caa5bfdb131665eadf66',2,1537169403,0),('37148e1c85e926b3a750f2490d4b6067',2,1537169403,0),('3de96a902b863b2ecf3ffd38b9077aa9',2,1537169403,0),('73c1333069970c4af5da43ea45538c40',2,1537169403,0),('7dcefa5c46f591ad0c1259f3672ee9a3',2,1537169403,0),('922925ac3f35d4a64380bbf81411e3be',2,1537169403,0),('9535bca60c562e8589787dcf0f156dfb',2,1537169403,0),('9ae904181557a41d8a9fc02260da3eea',2,1537169403,0),('ab172f363d64968a985a4a7637c4e755',2,1537169403,0),('bf0a3fda7216fa4d29ca16e2ba705f0f',2,1537169403,0),('c63f3e3366296add7883cfe4e31c3052',2,1537169403,0),('c7222ef5ec731982cd8f11ec9fa7efc1',2,1537169403,0),('e7502db10bfe6c674d0681a44635d195',2,1537169403,0),('0e1e578293d27b285e835ce099a43d12',2,1537169404,0),('456c246b84e7452ae6bda4219424d4ae',2,1537169404,0),('5383f4741f0868f05580e4dcf4edb9d2',2,1537169404,0),('5b70e8a3f228df6b25979a39752cf0ba',2,1537169404,0),('6d1a663fb040e2806f882495a28c1f40',2,1537169404,0),('8befd7802df7f57d933bb54a0b10798b',2,1537169404,0),('bc613086419556182adcafc93ceb2d7d',2,1537169404,0),('c9e4c783635e85226ed46f7ec0010196',2,1537169404,0),('db072b69fe975f1dede295bc6edf0bd7',2,1537169404,0),('ddfa54ae709ec1e4aa7dba5e4e846cb0',2,1537169404,0),('67674bc0e54ba0447ab131c282b6cfa1',2,1537169409,0),('9e97e29940f6b982737ce69b6f7ed2e7',2,1537169409,0),('a5fa02ea22ccff61b6f8877089447e79',2,1537169409,0),('e63a34477cdfe31f11e0c4ca4cc8bbec',2,1537169409,0),('1cbec6064ed718e0584dc62ac22ca68f',2,1537169410,0),('2df9156d1113e4780d97cec321c5eab2',2,1537169410,0),('54e8b30cbf03f696d75b76b24a4e70c5',2,1537169410,0),('5eb49eed1ef0c468c81f98f11bd68462',2,1537169410,0),('772bdc606e5d5cf79930c1e06d2c6c4e',2,1537169410,0),('85cc1d8418fb7a3e7614eb4606c18afa',2,1537169410,0),('acfa9a57ef294bce1160f82df6855f67',2,1537169410,0),('ad55a94633cb8053be888a40e517cc70',2,1537169410,0),('afa5b7f3cd3f2cc5c43f1016bd35bab0',2,1537169410,0),('ba9effe4a454d7b3ec3def6eb7577571',2,1537169410,0),('c17b1d910d8904f537f99928533b70ac',2,1537169410,0),('c4599d54148e347271b444bbfb42be69',2,1537169410,0),('dfca44067b21d9ad5e2e734879028076',2,1537169410,0),('e5a72aed779be08a82299636a51a1921',2,1537169410,0),('fc9ac171778fd1ab09c41df4228bdb2d',2,1537169410,0),('ff6a629fbd851940ba267f566755e529',2,1537169410,0),('2a27b55467558ec5f4c8a6d79b2b0177',2,1537169411,0),('3c4ab761967ce176d2c73062c44621b3',2,1537169411,0),('3e4cd175dda9d72e6468371eb8f29804',2,1537169411,0),('492dd65c8ef406db3b5b10efb56c7ddc',2,1537169411,0),('4c3766cc69cd1bb686cdd72e8112b958',2,1537169411,0),('4c3ae22208c511239c6f88c5862d03f6',2,1537169411,0),('63084f103bea7aaebfec00bf8f1fc790',2,1537169411,0),('8d707f3fc6c0d1356c51d13994bcbc3a',2,1537169411,0),('8e6d199c9035a1cdb5281a4fc18bbacd',2,1537169411,0),('ae866a79a50e053aa1aadbf66627e820',2,1537169411,0),('c444dd0a87f4aa257e5839908d3707fa',2,1537169411,0),('c7d80fac8381bde2ee01f6c31277aa73',2,1537169411,0),('e34f450a8cca8dfd763d3e8c0791ab4e',2,1537169411,0),('ee21b3378e865fbbf5d6442331cb2bed',2,1537169411,0),('f11cb3c5885f3142d33c23bd15fc666e',2,1537169411,0),('fee0921115128184704df7e9cd08ba03',2,1537169411,0),('0fb67819dde9987269e8f4e084b015c9',2,1537169412,0),('14bc9c8562652598ffb81a4a3474c245',2,1537169412,0),('7efbd72b5e3ec2c57df703a2860d1660',2,1537169412,0),('a7f8ea7b3a6ac8b0c4ea2bb3ce94862f',2,1537169412,0),('b451c55b8bba339ed2e02a1c85e9b7ae',2,1537169412,0),('e10ec98954fcbc0b5d33dad8a4bf7612',2,1537169412,0),('130cda2f822001e9ad4d7f8fc732fa0d',2,1537179336,0),('d50c6d72d11e8f8c465d0fcfa4e41e56',2,1537181325,0),('f9f37b3e9fb03489211b0b32b5d81b1d',2,1537252789,0),('e5c992a75e3f4d36af528d718a164e6f',2,1537267800,0),('356ec0360725daae41d95c11f8e2a842',2,1537327020,0),('034d232d3a6ee1aad9c8e77c68a88577',2,1537327902,0),('7a2a4b46dc2c74ba281d9fcf312ff7d4',2,1537329418,0),('9a1f3b3b3fcd07ed0ff01cc04c7adb42',2,1537330848,0),('9b906175cb120d6bcc36f939542611a7',2,1537335111,0),('79cba5850db5e5d0f93035fddadb5b55',2,1537335804,0),('add6487a36f7d8e920cc22e3b50e6365',2,1537341526,0),('86f15717d60f336657776be60f76dfbc',2,1537342029,0),('c698a4afa16a9189ec0bf642dfaf62c3',2,1537345582,0),('92eafa266e7ec0193d9388f0fd9243e8',2,1537346089,0),('e3b6a2e4ed578db3861160c23aecb4f0',2,1537346485,0),('159d96a7e889f6ab48004f41e850cf85',2,1537421246,0),('93b7fdc54b7a110ffb4b52aeb59dbdbb',2,1537421599,0),('04428ad7b6717f7ad090d92e95f64668',2,1537422127,0),('7cb1d623219f705ea283ff80c4bdb134',2,1537422727,0),('0970a132c7c4eaeb8c74068c814ae251',2,1537449914,0),('ebd41e13131f76c7cff7517189737718',2,1537495590,0),('2a009ec2ab9d5e0c361f41bc20a49639',2,1537496790,0),('276b37d3791af25dc46285a57dcf35d1',2,1537502160,0),('38a12ecd6f4649c99af1a549ceea331a',2,1537502164,0),('71a69ffc27874965c39d18dc50e3c4d6',2,1537801330,0),('c011d5ae7537792fa6d73943d7a6c6d2',2,1537838563,0);
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slides`
--

DROP TABLE IF EXISTS `slides`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `slides` (
  `slideid` bigint(20) unsigned NOT NULL,
  `slideshowid` bigint(20) unsigned NOT NULL,
  `screenid` bigint(20) unsigned NOT NULL,
  `step` int(11) NOT NULL DEFAULT '0',
  `delay` varchar(32) NOT NULL DEFAULT '0',
  PRIMARY KEY (`slideid`),
  KEY `slides_1` (`slideshowid`),
  KEY `slides_2` (`screenid`),
  CONSTRAINT `c_slides_1` FOREIGN KEY (`slideshowid`) REFERENCES `slideshows` (`slideshowid`) ON DELETE CASCADE,
  CONSTRAINT `c_slides_2` FOREIGN KEY (`screenid`) REFERENCES `screens` (`screenid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slides`
--

LOCK TABLES `slides` WRITE;
/*!40000 ALTER TABLE `slides` DISABLE KEYS */;
/*!40000 ALTER TABLE `slides` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slideshow_user`
--

DROP TABLE IF EXISTS `slideshow_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `slideshow_user` (
  `slideshowuserid` bigint(20) unsigned NOT NULL,
  `slideshowid` bigint(20) unsigned NOT NULL,
  `userid` bigint(20) unsigned NOT NULL,
  `permission` int(11) NOT NULL DEFAULT '2',
  PRIMARY KEY (`slideshowuserid`),
  UNIQUE KEY `slideshow_user_1` (`slideshowid`,`userid`),
  KEY `c_slideshow_user_2` (`userid`),
  CONSTRAINT `c_slideshow_user_1` FOREIGN KEY (`slideshowid`) REFERENCES `slideshows` (`slideshowid`) ON DELETE CASCADE,
  CONSTRAINT `c_slideshow_user_2` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slideshow_user`
--

LOCK TABLES `slideshow_user` WRITE;
/*!40000 ALTER TABLE `slideshow_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `slideshow_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slideshow_usrgrp`
--

DROP TABLE IF EXISTS `slideshow_usrgrp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `slideshow_usrgrp` (
  `slideshowusrgrpid` bigint(20) unsigned NOT NULL,
  `slideshowid` bigint(20) unsigned NOT NULL,
  `usrgrpid` bigint(20) unsigned NOT NULL,
  `permission` int(11) NOT NULL DEFAULT '2',
  PRIMARY KEY (`slideshowusrgrpid`),
  UNIQUE KEY `slideshow_usrgrp_1` (`slideshowid`,`usrgrpid`),
  KEY `c_slideshow_usrgrp_2` (`usrgrpid`),
  CONSTRAINT `c_slideshow_usrgrp_1` FOREIGN KEY (`slideshowid`) REFERENCES `slideshows` (`slideshowid`) ON DELETE CASCADE,
  CONSTRAINT `c_slideshow_usrgrp_2` FOREIGN KEY (`usrgrpid`) REFERENCES `usrgrp` (`usrgrpid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slideshow_usrgrp`
--

LOCK TABLES `slideshow_usrgrp` WRITE;
/*!40000 ALTER TABLE `slideshow_usrgrp` DISABLE KEYS */;
/*!40000 ALTER TABLE `slideshow_usrgrp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slideshows`
--

DROP TABLE IF EXISTS `slideshows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `slideshows` (
  `slideshowid` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `delay` varchar(32) NOT NULL DEFAULT '30s',
  `userid` bigint(20) unsigned NOT NULL,
  `private` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`slideshowid`),
  UNIQUE KEY `slideshows_1` (`name`),
  KEY `c_slideshows_3` (`userid`),
  CONSTRAINT `c_slideshows_3` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slideshows`
--

LOCK TABLES `slideshows` WRITE;
/*!40000 ALTER TABLE `slideshows` DISABLE KEYS */;
/*!40000 ALTER TABLE `slideshows` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sysmap_element_trigger`
--

DROP TABLE IF EXISTS `sysmap_element_trigger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sysmap_element_trigger` (
  `selement_triggerid` bigint(20) unsigned NOT NULL,
  `selementid` bigint(20) unsigned NOT NULL,
  `triggerid` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`selement_triggerid`),
  UNIQUE KEY `sysmap_element_trigger_1` (`selementid`,`triggerid`),
  KEY `c_sysmap_element_trigger_2` (`triggerid`),
  CONSTRAINT `c_sysmap_element_trigger_1` FOREIGN KEY (`selementid`) REFERENCES `sysmaps_elements` (`selementid`) ON DELETE CASCADE,
  CONSTRAINT `c_sysmap_element_trigger_2` FOREIGN KEY (`triggerid`) REFERENCES `triggers` (`triggerid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sysmap_element_trigger`
--

LOCK TABLES `sysmap_element_trigger` WRITE;
/*!40000 ALTER TABLE `sysmap_element_trigger` DISABLE KEYS */;
/*!40000 ALTER TABLE `sysmap_element_trigger` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sysmap_element_url`
--

DROP TABLE IF EXISTS `sysmap_element_url`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sysmap_element_url` (
  `sysmapelementurlid` bigint(20) unsigned NOT NULL,
  `selementid` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`sysmapelementurlid`),
  UNIQUE KEY `sysmap_element_url_1` (`selementid`,`name`),
  CONSTRAINT `c_sysmap_element_url_1` FOREIGN KEY (`selementid`) REFERENCES `sysmaps_elements` (`selementid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sysmap_element_url`
--

LOCK TABLES `sysmap_element_url` WRITE;
/*!40000 ALTER TABLE `sysmap_element_url` DISABLE KEYS */;
/*!40000 ALTER TABLE `sysmap_element_url` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sysmap_shape`
--

DROP TABLE IF EXISTS `sysmap_shape`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sysmap_shape` (
  `sysmap_shapeid` bigint(20) unsigned NOT NULL,
  `sysmapid` bigint(20) unsigned NOT NULL,
  `type` int(11) NOT NULL DEFAULT '0',
  `x` int(11) NOT NULL DEFAULT '0',
  `y` int(11) NOT NULL DEFAULT '0',
  `width` int(11) NOT NULL DEFAULT '200',
  `height` int(11) NOT NULL DEFAULT '200',
  `text` text NOT NULL,
  `font` int(11) NOT NULL DEFAULT '9',
  `font_size` int(11) NOT NULL DEFAULT '11',
  `font_color` varchar(6) NOT NULL DEFAULT '000000',
  `text_halign` int(11) NOT NULL DEFAULT '0',
  `text_valign` int(11) NOT NULL DEFAULT '0',
  `border_type` int(11) NOT NULL DEFAULT '0',
  `border_width` int(11) NOT NULL DEFAULT '1',
  `border_color` varchar(6) NOT NULL DEFAULT '000000',
  `background_color` varchar(6) NOT NULL DEFAULT '',
  `zindex` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`sysmap_shapeid`),
  KEY `sysmap_shape_1` (`sysmapid`),
  CONSTRAINT `c_sysmap_shape_1` FOREIGN KEY (`sysmapid`) REFERENCES `sysmaps` (`sysmapid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sysmap_shape`
--

LOCK TABLES `sysmap_shape` WRITE;
/*!40000 ALTER TABLE `sysmap_shape` DISABLE KEYS */;
INSERT INTO `sysmap_shape` VALUES (1,1,0,315,1,680,15,'{MAP.NAME}',9,11,'000000',0,0,0,0,'000000','',0);
/*!40000 ALTER TABLE `sysmap_shape` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sysmap_url`
--

DROP TABLE IF EXISTS `sysmap_url`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sysmap_url` (
  `sysmapurlid` bigint(20) unsigned NOT NULL,
  `sysmapid` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL DEFAULT '',
  `elementtype` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`sysmapurlid`),
  UNIQUE KEY `sysmap_url_1` (`sysmapid`,`name`),
  CONSTRAINT `c_sysmap_url_1` FOREIGN KEY (`sysmapid`) REFERENCES `sysmaps` (`sysmapid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sysmap_url`
--

LOCK TABLES `sysmap_url` WRITE;
/*!40000 ALTER TABLE `sysmap_url` DISABLE KEYS */;
/*!40000 ALTER TABLE `sysmap_url` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sysmap_user`
--

DROP TABLE IF EXISTS `sysmap_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sysmap_user` (
  `sysmapuserid` bigint(20) unsigned NOT NULL,
  `sysmapid` bigint(20) unsigned NOT NULL,
  `userid` bigint(20) unsigned NOT NULL,
  `permission` int(11) NOT NULL DEFAULT '2',
  PRIMARY KEY (`sysmapuserid`),
  UNIQUE KEY `sysmap_user_1` (`sysmapid`,`userid`),
  KEY `c_sysmap_user_2` (`userid`),
  CONSTRAINT `c_sysmap_user_1` FOREIGN KEY (`sysmapid`) REFERENCES `sysmaps` (`sysmapid`) ON DELETE CASCADE,
  CONSTRAINT `c_sysmap_user_2` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sysmap_user`
--

LOCK TABLES `sysmap_user` WRITE;
/*!40000 ALTER TABLE `sysmap_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `sysmap_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sysmap_usrgrp`
--

DROP TABLE IF EXISTS `sysmap_usrgrp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sysmap_usrgrp` (
  `sysmapusrgrpid` bigint(20) unsigned NOT NULL,
  `sysmapid` bigint(20) unsigned NOT NULL,
  `usrgrpid` bigint(20) unsigned NOT NULL,
  `permission` int(11) NOT NULL DEFAULT '2',
  PRIMARY KEY (`sysmapusrgrpid`),
  UNIQUE KEY `sysmap_usrgrp_1` (`sysmapid`,`usrgrpid`),
  KEY `c_sysmap_usrgrp_2` (`usrgrpid`),
  CONSTRAINT `c_sysmap_usrgrp_1` FOREIGN KEY (`sysmapid`) REFERENCES `sysmaps` (`sysmapid`) ON DELETE CASCADE,
  CONSTRAINT `c_sysmap_usrgrp_2` FOREIGN KEY (`usrgrpid`) REFERENCES `usrgrp` (`usrgrpid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sysmap_usrgrp`
--

LOCK TABLES `sysmap_usrgrp` WRITE;
/*!40000 ALTER TABLE `sysmap_usrgrp` DISABLE KEYS */;
/*!40000 ALTER TABLE `sysmap_usrgrp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sysmaps`
--

DROP TABLE IF EXISTS `sysmaps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sysmaps` (
  `sysmapid` bigint(20) unsigned NOT NULL,
  `name` varchar(128) NOT NULL DEFAULT '',
  `width` int(11) NOT NULL DEFAULT '600',
  `height` int(11) NOT NULL DEFAULT '400',
  `backgroundid` bigint(20) unsigned DEFAULT NULL,
  `label_type` int(11) NOT NULL DEFAULT '2',
  `label_location` int(11) NOT NULL DEFAULT '0',
  `highlight` int(11) NOT NULL DEFAULT '1',
  `expandproblem` int(11) NOT NULL DEFAULT '1',
  `markelements` int(11) NOT NULL DEFAULT '0',
  `show_unack` int(11) NOT NULL DEFAULT '0',
  `grid_size` int(11) NOT NULL DEFAULT '50',
  `grid_show` int(11) NOT NULL DEFAULT '1',
  `grid_align` int(11) NOT NULL DEFAULT '1',
  `label_format` int(11) NOT NULL DEFAULT '0',
  `label_type_host` int(11) NOT NULL DEFAULT '2',
  `label_type_hostgroup` int(11) NOT NULL DEFAULT '2',
  `label_type_trigger` int(11) NOT NULL DEFAULT '2',
  `label_type_map` int(11) NOT NULL DEFAULT '2',
  `label_type_image` int(11) NOT NULL DEFAULT '2',
  `label_string_host` varchar(255) NOT NULL DEFAULT '',
  `label_string_hostgroup` varchar(255) NOT NULL DEFAULT '',
  `label_string_trigger` varchar(255) NOT NULL DEFAULT '',
  `label_string_map` varchar(255) NOT NULL DEFAULT '',
  `label_string_image` varchar(255) NOT NULL DEFAULT '',
  `iconmapid` bigint(20) unsigned DEFAULT NULL,
  `expand_macros` int(11) NOT NULL DEFAULT '0',
  `severity_min` int(11) NOT NULL DEFAULT '0',
  `userid` bigint(20) unsigned NOT NULL,
  `private` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`sysmapid`),
  UNIQUE KEY `sysmaps_1` (`name`),
  KEY `sysmaps_2` (`backgroundid`),
  KEY `sysmaps_3` (`iconmapid`),
  KEY `c_sysmaps_3` (`userid`),
  CONSTRAINT `c_sysmaps_1` FOREIGN KEY (`backgroundid`) REFERENCES `images` (`imageid`),
  CONSTRAINT `c_sysmaps_2` FOREIGN KEY (`iconmapid`) REFERENCES `icon_map` (`iconmapid`),
  CONSTRAINT `c_sysmaps_3` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sysmaps`
--

LOCK TABLES `sysmaps` WRITE;
/*!40000 ALTER TABLE `sysmaps` DISABLE KEYS */;
INSERT INTO `sysmaps` VALUES (1,'本地拓扑图',1400,600,NULL,0,0,1,1,1,0,100,1,1,0,2,2,2,2,2,'','','','','',NULL,1,0,1,0);
/*!40000 ALTER TABLE `sysmaps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sysmaps_elements`
--

DROP TABLE IF EXISTS `sysmaps_elements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sysmaps_elements` (
  `selementid` bigint(20) unsigned NOT NULL,
  `sysmapid` bigint(20) unsigned NOT NULL,
  `elementid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `elementtype` int(11) NOT NULL DEFAULT '0',
  `iconid_off` bigint(20) unsigned DEFAULT NULL,
  `iconid_on` bigint(20) unsigned DEFAULT NULL,
  `label` varchar(2048) NOT NULL DEFAULT '',
  `label_location` int(11) NOT NULL DEFAULT '-1',
  `x` int(11) NOT NULL DEFAULT '0',
  `y` int(11) NOT NULL DEFAULT '0',
  `iconid_disabled` bigint(20) unsigned DEFAULT NULL,
  `iconid_maintenance` bigint(20) unsigned DEFAULT NULL,
  `elementsubtype` int(11) NOT NULL DEFAULT '0',
  `areatype` int(11) NOT NULL DEFAULT '0',
  `width` int(11) NOT NULL DEFAULT '200',
  `height` int(11) NOT NULL DEFAULT '200',
  `viewtype` int(11) NOT NULL DEFAULT '0',
  `use_iconmap` int(11) NOT NULL DEFAULT '1',
  `application` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`selementid`),
  KEY `sysmaps_elements_1` (`sysmapid`),
  KEY `sysmaps_elements_2` (`iconid_off`),
  KEY `sysmaps_elements_3` (`iconid_on`),
  KEY `sysmaps_elements_4` (`iconid_disabled`),
  KEY `sysmaps_elements_5` (`iconid_maintenance`),
  CONSTRAINT `c_sysmaps_elements_1` FOREIGN KEY (`sysmapid`) REFERENCES `sysmaps` (`sysmapid`) ON DELETE CASCADE,
  CONSTRAINT `c_sysmaps_elements_2` FOREIGN KEY (`iconid_off`) REFERENCES `images` (`imageid`),
  CONSTRAINT `c_sysmaps_elements_3` FOREIGN KEY (`iconid_on`) REFERENCES `images` (`imageid`),
  CONSTRAINT `c_sysmaps_elements_4` FOREIGN KEY (`iconid_disabled`) REFERENCES `images` (`imageid`),
  CONSTRAINT `c_sysmaps_elements_5` FOREIGN KEY (`iconid_maintenance`) REFERENCES `images` (`imageid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sysmaps_elements`
--

LOCK TABLES `sysmaps_elements` WRITE;
/*!40000 ALTER TABLE `sysmaps_elements` DISABLE KEYS */;
INSERT INTO `sysmaps_elements` VALUES (1,1,10084,0,150,150,'统一监控系统\r\n',0,626,218,NULL,NULL,0,0,200,200,0,0,''),(2,1,10254,0,150,150,'领导驾驶舱\r\n',-1,826,18,NULL,NULL,0,0,200,200,0,0,''),(3,1,10268,0,150,150,'分布式挖掘系统\r\n',-1,426,218,NULL,NULL,0,0,200,200,0,0,''),(4,1,10270,0,150,150,'大数据检索系统',-1,426,318,NULL,NULL,0,0,200,200,0,0,''),(5,1,10269,0,150,150,'高维模型分析系统',-1,326,318,NULL,NULL,0,0,200,200,0,0,''),(6,1,10271,0,150,150,'批量日志分析系统',-1,326,218,NULL,NULL,0,0,200,200,0,0,''),(7,1,10267,0,150,150,'大数据使用系统',-1,226,480,NULL,NULL,0,0,200,200,0,0,''),(8,1,10265,0,150,150,'大数据管理系统\r\n',-1,426,480,NULL,NULL,0,0,200,200,0,0,''),(9,1,10262,0,150,150,'批量数据处理系统',-1,926,218,NULL,NULL,0,0,200,200,0,0,''),(10,1,10274,0,150,135,'众包采集系统',-1,926,480,NULL,NULL,0,0,200,200,0,0,''),(11,1,10263,0,150,150,'实时数据处理监控系统',-1,1126,318,NULL,NULL,0,0,200,200,0,0,''),(12,1,10273,0,150,135,'深网爬虫系统',-1,826,480,NULL,NULL,0,0,200,200,0,0,''),(13,1,10266,0,150,150,'大数据安全管理系统',-1,326,480,NULL,NULL,0,0,200,200,0,0,''),(14,1,10275,0,150,135,'综合采集系统',-1,726,480,NULL,NULL,0,0,200,200,0,0,''),(15,1,10264,0,150,150,'数据编目管理系统',-1,926,318,NULL,NULL,0,0,200,200,0,0,''),(16,1,10261,0,150,150,'指标管理系统',-1,1026,318,NULL,NULL,0,0,200,200,0,0,''),(17,1,10258,0,150,150,'数据质量管理系统',-1,1126,218,NULL,NULL,0,0,200,200,0,0,''),(18,1,10259,0,150,150,'元数据管理需系统',-1,1026,218,NULL,NULL,0,0,200,200,0,0,''),(27,1,10277,0,150,150,'大数据检索系统1号',-1,226,318,NULL,NULL,0,0,200,200,0,0,''),(28,1,10279,0,150,150,'影像识别系统',-1,226,218,NULL,NULL,0,0,200,200,0,0,''),(29,1,10278,0,150,150,'语义分析系统',-1,126,318,NULL,NULL,0,0,200,200,0,0,''),(30,1,10281,0,150,150,'3D-GIS服务系统\r\n',0,326,18,NULL,NULL,0,0,200,200,0,0,''),(31,1,10280,0,150,150,'数据可视化系统\r\n',0,426,18,NULL,NULL,0,0,200,200,0,0,''),(32,1,10265,0,150,150,'大数据平台集群\r\n',-1,1026,18,NULL,NULL,0,0,200,200,0,0,'');
/*!40000 ALTER TABLE `sysmaps_elements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sysmaps_link_triggers`
--

DROP TABLE IF EXISTS `sysmaps_link_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sysmaps_link_triggers` (
  `linktriggerid` bigint(20) unsigned NOT NULL,
  `linkid` bigint(20) unsigned NOT NULL,
  `triggerid` bigint(20) unsigned NOT NULL,
  `drawtype` int(11) NOT NULL DEFAULT '0',
  `color` varchar(6) NOT NULL DEFAULT '000000',
  PRIMARY KEY (`linktriggerid`),
  UNIQUE KEY `sysmaps_link_triggers_1` (`linkid`,`triggerid`),
  KEY `sysmaps_link_triggers_2` (`triggerid`),
  CONSTRAINT `c_sysmaps_link_triggers_1` FOREIGN KEY (`linkid`) REFERENCES `sysmaps_links` (`linkid`) ON DELETE CASCADE,
  CONSTRAINT `c_sysmaps_link_triggers_2` FOREIGN KEY (`triggerid`) REFERENCES `triggers` (`triggerid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sysmaps_link_triggers`
--

LOCK TABLES `sysmaps_link_triggers` WRITE;
/*!40000 ALTER TABLE `sysmaps_link_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `sysmaps_link_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sysmaps_links`
--

DROP TABLE IF EXISTS `sysmaps_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sysmaps_links` (
  `linkid` bigint(20) unsigned NOT NULL,
  `sysmapid` bigint(20) unsigned NOT NULL,
  `selementid1` bigint(20) unsigned NOT NULL,
  `selementid2` bigint(20) unsigned NOT NULL,
  `drawtype` int(11) NOT NULL DEFAULT '0',
  `color` varchar(6) NOT NULL DEFAULT '000000',
  `label` varchar(2048) NOT NULL DEFAULT '',
  PRIMARY KEY (`linkid`),
  KEY `sysmaps_links_1` (`sysmapid`),
  KEY `sysmaps_links_2` (`selementid1`),
  KEY `sysmaps_links_3` (`selementid2`),
  CONSTRAINT `c_sysmaps_links_1` FOREIGN KEY (`sysmapid`) REFERENCES `sysmaps` (`sysmapid`) ON DELETE CASCADE,
  CONSTRAINT `c_sysmaps_links_2` FOREIGN KEY (`selementid1`) REFERENCES `sysmaps_elements` (`selementid`) ON DELETE CASCADE,
  CONSTRAINT `c_sysmaps_links_3` FOREIGN KEY (`selementid2`) REFERENCES `sysmaps_elements` (`selementid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sysmaps_links`
--

LOCK TABLES `sysmaps_links` WRITE;
/*!40000 ALTER TABLE `sysmaps_links` DISABLE KEYS */;
INSERT INTO `sysmaps_links` VALUES (1,1,4,1,0,'00CC00',''),(2,1,7,1,0,'00CC00',''),(3,1,2,1,0,'00CC00',''),(4,1,3,1,0,'00CC00',''),(5,1,6,1,0,'00CC00',''),(6,1,8,1,0,'00CC00',''),(7,1,5,1,0,'00CC00',''),(8,1,1,9,0,'00CC00',''),(9,1,10,1,0,'00CC00',''),(10,1,11,1,0,'00CC00',''),(11,1,12,1,0,'00CC00',''),(12,1,1,16,0,'00CC00',''),(13,1,1,15,0,'00CC00',''),(14,1,1,18,0,'00CC00',''),(15,1,1,17,0,'00CC00',''),(16,1,13,1,0,'00CC00',''),(17,1,14,1,0,'00CC00',''),(26,1,27,1,0,'00CC00',''),(27,1,28,1,0,'00CC00',''),(28,1,29,1,0,'00CC00',''),(29,1,30,1,0,'00CC00',''),(30,1,31,1,0,'00CC00',''),(31,1,32,1,0,'00CC00','');
/*!40000 ALTER TABLE `sysmaps_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task`
--

DROP TABLE IF EXISTS `task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task` (
  `taskid` bigint(20) unsigned NOT NULL,
  `type` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `clock` int(11) NOT NULL DEFAULT '0',
  `ttl` int(11) NOT NULL DEFAULT '0',
  `proxy_hostid` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`taskid`),
  KEY `task_1` (`status`,`proxy_hostid`),
  KEY `c_task_1` (`proxy_hostid`),
  CONSTRAINT `c_task_1` FOREIGN KEY (`proxy_hostid`) REFERENCES `hosts` (`hostid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task`
--

LOCK TABLES `task` WRITE;
/*!40000 ALTER TABLE `task` DISABLE KEYS */;
/*!40000 ALTER TABLE `task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_acknowledge`
--

DROP TABLE IF EXISTS `task_acknowledge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_acknowledge` (
  `taskid` bigint(20) unsigned NOT NULL,
  `acknowledgeid` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`taskid`),
  CONSTRAINT `c_task_acknowledge_1` FOREIGN KEY (`taskid`) REFERENCES `task` (`taskid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_acknowledge`
--

LOCK TABLES `task_acknowledge` WRITE;
/*!40000 ALTER TABLE `task_acknowledge` DISABLE KEYS */;
/*!40000 ALTER TABLE `task_acknowledge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_close_problem`
--

DROP TABLE IF EXISTS `task_close_problem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_close_problem` (
  `taskid` bigint(20) unsigned NOT NULL,
  `acknowledgeid` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`taskid`),
  CONSTRAINT `c_task_close_problem_1` FOREIGN KEY (`taskid`) REFERENCES `task` (`taskid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_close_problem`
--

LOCK TABLES `task_close_problem` WRITE;
/*!40000 ALTER TABLE `task_close_problem` DISABLE KEYS */;
/*!40000 ALTER TABLE `task_close_problem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_remote_command`
--

DROP TABLE IF EXISTS `task_remote_command`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_remote_command` (
  `taskid` bigint(20) unsigned NOT NULL,
  `command_type` int(11) NOT NULL DEFAULT '0',
  `execute_on` int(11) NOT NULL DEFAULT '0',
  `port` int(11) NOT NULL DEFAULT '0',
  `authtype` int(11) NOT NULL DEFAULT '0',
  `username` varchar(64) NOT NULL DEFAULT '',
  `password` varchar(64) NOT NULL DEFAULT '',
  `publickey` varchar(64) NOT NULL DEFAULT '',
  `privatekey` varchar(64) NOT NULL DEFAULT '',
  `command` text NOT NULL,
  `alertid` bigint(20) unsigned DEFAULT NULL,
  `parent_taskid` bigint(20) unsigned NOT NULL,
  `hostid` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`taskid`),
  CONSTRAINT `c_task_remote_command_1` FOREIGN KEY (`taskid`) REFERENCES `task` (`taskid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_remote_command`
--

LOCK TABLES `task_remote_command` WRITE;
/*!40000 ALTER TABLE `task_remote_command` DISABLE KEYS */;
/*!40000 ALTER TABLE `task_remote_command` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_remote_command_result`
--

DROP TABLE IF EXISTS `task_remote_command_result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_remote_command_result` (
  `taskid` bigint(20) unsigned NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `parent_taskid` bigint(20) unsigned NOT NULL,
  `info` text NOT NULL,
  PRIMARY KEY (`taskid`),
  CONSTRAINT `c_task_remote_command_result_1` FOREIGN KEY (`taskid`) REFERENCES `task` (`taskid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_remote_command_result`
--

LOCK TABLES `task_remote_command_result` WRITE;
/*!40000 ALTER TABLE `task_remote_command_result` DISABLE KEYS */;
/*!40000 ALTER TABLE `task_remote_command_result` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `timeperiods`
--

DROP TABLE IF EXISTS `timeperiods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `timeperiods` (
  `timeperiodid` bigint(20) unsigned NOT NULL,
  `timeperiod_type` int(11) NOT NULL DEFAULT '0',
  `every` int(11) NOT NULL DEFAULT '1',
  `month` int(11) NOT NULL DEFAULT '0',
  `dayofweek` int(11) NOT NULL DEFAULT '0',
  `day` int(11) NOT NULL DEFAULT '0',
  `start_time` int(11) NOT NULL DEFAULT '0',
  `period` int(11) NOT NULL DEFAULT '0',
  `start_date` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`timeperiodid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timeperiods`
--

LOCK TABLES `timeperiods` WRITE;
/*!40000 ALTER TABLE `timeperiods` DISABLE KEYS */;
/*!40000 ALTER TABLE `timeperiods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trigger_depends`
--

DROP TABLE IF EXISTS `trigger_depends`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trigger_depends` (
  `triggerdepid` bigint(20) unsigned NOT NULL,
  `triggerid_down` bigint(20) unsigned NOT NULL,
  `triggerid_up` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`triggerdepid`),
  UNIQUE KEY `trigger_depends_1` (`triggerid_down`,`triggerid_up`),
  KEY `trigger_depends_2` (`triggerid_up`),
  CONSTRAINT `c_trigger_depends_1` FOREIGN KEY (`triggerid_down`) REFERENCES `triggers` (`triggerid`) ON DELETE CASCADE,
  CONSTRAINT `c_trigger_depends_2` FOREIGN KEY (`triggerid_up`) REFERENCES `triggers` (`triggerid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trigger_depends`
--

LOCK TABLES `trigger_depends` WRITE;
/*!40000 ALTER TABLE `trigger_depends` DISABLE KEYS */;
INSERT INTO `trigger_depends` VALUES (354,14195,14205),(355,14196,14195),(356,14196,14205),(357,14197,14205),(358,14198,14197),(359,14198,14205),(360,14200,14199),(361,14201,14205),(362,14202,14201),(363,14202,14205),(364,14204,14203),(365,14206,14222),(366,14207,14206),(367,14207,14222),(368,14208,14222),(369,14209,14208),(370,14209,14222),(371,14210,14222),(372,14211,14210),(373,14211,14222),(374,14212,14222),(375,14213,14212),(376,14213,14222),(377,14214,14222),(378,14215,14214),(379,14215,14222),(380,14217,14216),(381,14218,14222),(382,14219,14218),(383,14219,14222),(384,14220,14222),(385,14221,14220),(386,14221,14222),(387,14223,14222),(388,14224,14222),(389,14224,14223),(390,14225,14222),(391,14226,14222),(392,14226,14225),(3729,14246,14245),(3730,14250,14249),(3570,14252,14251),(3599,14253,14251),(3628,14253,14252),(3571,14289,14288),(3600,14290,14288),(3629,14290,14289),(3734,14291,15161),(3574,14294,14293),(3603,14295,14293),(3632,14295,14294),(3502,14296,15170),(3575,14312,14311),(3604,14313,14311),(3633,14313,14312),(3503,14314,15171),(3743,14318,14319),(3576,14328,14327),(3605,14329,14327),(3634,14329,14328),(3504,14330,15172),(3777,14335,14334),(3577,14348,14347),(3606,14349,14347),(3635,14349,14348),(3505,14350,15173),(3578,14357,14356),(3607,14358,14356),(3636,14358,14357),(3506,14359,15174),(3771,14372,14373),(3772,14375,14376),(3775,14380,14381),(3579,14390,14389),(3608,14391,14389),(3637,14391,14390),(3507,14392,15175),(3580,14404,14403),(3609,14405,14403),(3638,14405,14404),(3508,14406,15176),(3581,14452,14451),(3610,14453,14451),(3639,14453,14452),(3509,14454,15177),(3746,14460,14461),(3582,14469,14468),(3611,14470,14468),(3640,14470,14469),(3510,14471,15178),(3762,14476,14477),(3583,14487,14486),(3612,14488,14486),(3641,14488,14487),(3511,14489,15179),(3749,14495,14496),(3584,14506,14505),(3613,14507,14505),(3642,14507,14506),(3512,14508,15180),(3763,14511,15368),(3572,14525,14524),(3601,14526,14524),(3630,14526,14525),(3735,14527,15162),(3585,14535,14534),(3614,14536,14534),(3643,14536,14535),(3513,14537,15181),(3586,14545,14544),(3615,14546,14544),(3644,14546,14545),(3514,14547,15182),(3764,14551,14552),(3587,14583,14582),(3616,14584,14582),(3645,14584,14583),(3515,14585,15183),(3781,14589,14590),(3588,14599,14598),(3617,14600,14598),(3646,14600,14599),(3516,14601,15184),(3589,14616,14615),(3618,14617,14615),(3647,14617,14616),(3517,14618,15185),(3768,14624,14625),(3590,14653,14652),(3619,14654,14652),(3648,14654,14653),(3518,14655,15186),(3740,14658,14659),(3741,14664,14665),(3742,14668,14667),(3591,14674,14673),(3620,14675,14673),(3649,14675,14674),(3519,14676,15187),(3592,14692,14691),(3621,14693,14691),(3650,14693,14692),(3520,14694,15188),(3593,14705,14704),(3622,14706,14704),(3651,14706,14705),(3521,14707,15189),(3573,14718,14717),(3602,14719,14717),(3631,14719,14718),(3736,14720,15163),(3731,14862,14861),(3594,14870,14869),(3623,14871,14869),(3652,14871,14870),(3522,14872,15190),(3732,14876,14875),(3595,14883,14882),(3624,14884,14882),(3653,14884,14883),(3523,14885,15191),(3596,14907,14906),(3625,14908,14906),(3654,14908,14907),(3524,14909,15192),(3765,14914,14915),(3733,14922,14921),(3597,14929,14928),(3626,14930,14928),(3655,14930,14929),(3525,14931,15193),(3737,15161,14288),(3738,15162,14524),(3739,15163,14717),(3527,15170,14293),(3528,15171,14311),(3529,15172,14327),(3530,15173,14347),(3531,15174,14356),(3532,15175,14389),(3533,15176,14403),(3534,15177,14451),(3535,15178,14468),(3536,15179,14486),(3537,15180,14505),(3538,15181,14534),(3539,15182,14544),(3540,15183,14582),(3541,15184,14598),(3542,15185,14615),(3543,15186,14652),(3544,15187,14673),(3545,15188,14691),(3546,15189,14704),(3547,15190,14869),(3548,15191,14882),(3549,15192,14906),(3550,15193,14928),(3598,15221,15220),(3627,15222,15220),(3656,15222,15221),(3526,15223,15224),(3551,15224,15220),(3744,15332,15331),(3745,15334,15333),(3747,15335,15336),(3748,15338,15337),(3750,15342,15343),(3751,15345,15344),(3752,15347,15346),(3753,15348,15351),(3754,15349,15352),(3755,15350,15353),(3756,15357,15354),(3757,15358,15355),(3758,15359,15356),(3759,15363,15360),(3760,15364,15361),(3761,15365,15362),(3766,15374,15373),(3767,15376,15375),(3769,15380,15379),(3770,15382,15381),(3773,15384,15383),(3774,15386,15385),(3776,15387,14934),(3778,15390,14339),(3779,15392,15391),(3780,15394,15393),(3782,15396,15397),(3552,15550,15400),(3553,15551,15400),(3554,15552,15400),(3555,15553,15404),(3556,15554,15405),(3557,15555,15404),(3558,15556,15405),(3559,15557,15404),(3560,15558,15405),(3561,15559,15412),(3562,15560,15412),(3563,15561,15412),(3564,15562,15416),(3565,15563,15417),(3566,15564,15416),(3567,15565,15417),(3568,15566,15416),(3569,15567,15417),(3657,15568,15512),(3658,15569,15512),(3659,15570,15512),(3660,15571,15516),(3661,15572,15516),(3662,15573,15516),(3663,15574,15424),(3664,15575,15424),(3665,15576,15424),(3666,15577,15428),(3667,15578,15428),(3668,15579,15428),(3669,15580,15432),(3670,15581,15433),(3671,15582,15434),(3672,15583,15435),(3673,15584,15436),(3674,15585,15437),(3675,15586,15438),(3676,15587,15439),(3677,15588,15440),(3678,15589,15441),(3679,15590,15442),(3680,15591,15443),(3681,15592,15444),(3682,15593,15445),(3683,15594,15446),(3684,15595,15447),(3685,15596,15448),(3686,15597,15449),(3687,15598,15450),(3688,15599,15451),(3689,15600,15432),(3690,15601,15433),(3691,15602,15434),(3692,15603,15435),(3693,15604,15436),(3694,15605,15437),(3695,15606,15438),(3696,15607,15439),(3697,15608,15440),(3698,15609,15441),(3699,15610,15442),(3700,15611,15443),(3701,15612,15444),(3702,15613,15445),(3703,15614,15446),(3704,15615,15447),(3705,15616,15448),(3706,15617,15449),(3707,15618,15450),(3708,15619,15451),(3709,15620,15432),(3710,15621,15433),(3711,15622,15434),(3712,15623,15435),(3713,15624,15436),(3714,15625,15437),(3715,15626,15438),(3716,15627,15439),(3717,15628,15440),(3718,15629,15441),(3719,15630,15442),(3720,15631,15443),(3721,15632,15444),(3722,15633,15445),(3723,15634,15446),(3724,15635,15447),(3725,15636,15448),(3726,15637,15449),(3727,15638,15450),(3728,15639,15451);
/*!40000 ALTER TABLE `trigger_depends` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trigger_discovery`
--

DROP TABLE IF EXISTS `trigger_discovery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trigger_discovery` (
  `triggerid` bigint(20) unsigned NOT NULL,
  `parent_triggerid` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`triggerid`),
  KEY `trigger_discovery_1` (`parent_triggerid`),
  CONSTRAINT `c_trigger_discovery_1` FOREIGN KEY (`triggerid`) REFERENCES `triggers` (`triggerid`) ON DELETE CASCADE,
  CONSTRAINT `c_trigger_discovery_2` FOREIGN KEY (`parent_triggerid`) REFERENCES `triggers` (`triggerid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trigger_discovery`
--

LOCK TABLES `trigger_discovery` WRITE;
/*!40000 ALTER TABLE `trigger_discovery` DISABLE KEYS */;
INSERT INTO `trigger_discovery` VALUES (15808,13505),(15809,13505),(15810,13505),(15811,13505),(15812,13506),(15813,13506),(15814,13506),(15815,13506),(15818,15817),(15819,15817),(15820,15817),(15821,15817),(15822,15817),(15823,15817),(15824,15817),(15865,15817),(15867,15817),(15869,15817),(15871,15817),(15873,15817),(15875,15817),(15877,15817),(15879,15817),(15881,15817),(15883,15817),(15986,15817),(15832,15831),(15833,15831),(15834,15831),(15835,15831),(15836,15831),(15837,15831),(15838,15831),(15866,15831),(15868,15831),(15870,15831),(15872,15831),(15874,15831),(15876,15831),(15878,15831),(15880,15831),(15882,15831),(15884,15831),(15987,15831);
/*!40000 ALTER TABLE `trigger_discovery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trigger_tag`
--

DROP TABLE IF EXISTS `trigger_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trigger_tag` (
  `triggertagid` bigint(20) unsigned NOT NULL,
  `triggerid` bigint(20) unsigned NOT NULL,
  `tag` varchar(255) NOT NULL DEFAULT '',
  `value` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`triggertagid`),
  KEY `trigger_tag_1` (`triggerid`),
  CONSTRAINT `c_trigger_tag_1` FOREIGN KEY (`triggerid`) REFERENCES `triggers` (`triggerid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trigger_tag`
--

LOCK TABLES `trigger_tag` WRITE;
/*!40000 ALTER TABLE `trigger_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `trigger_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `triggers`
--

DROP TABLE IF EXISTS `triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `triggers` (
  `triggerid` bigint(20) unsigned NOT NULL,
  `expression` varchar(2048) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `url` varchar(255) NOT NULL DEFAULT '',
  `status` int(11) NOT NULL DEFAULT '0',
  `value` int(11) NOT NULL DEFAULT '0',
  `priority` int(11) NOT NULL DEFAULT '0',
  `lastchange` int(11) NOT NULL DEFAULT '0',
  `comments` text NOT NULL,
  `error` varchar(2048) NOT NULL DEFAULT '',
  `templateid` bigint(20) unsigned DEFAULT NULL,
  `type` int(11) NOT NULL DEFAULT '0',
  `state` int(11) NOT NULL DEFAULT '0',
  `flags` int(11) NOT NULL DEFAULT '0',
  `recovery_mode` int(11) NOT NULL DEFAULT '0',
  `recovery_expression` varchar(2048) NOT NULL DEFAULT '',
  `correlation_mode` int(11) NOT NULL DEFAULT '0',
  `correlation_tag` varchar(255) NOT NULL DEFAULT '',
  `manual_close` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`triggerid`),
  KEY `triggers_1` (`status`),
  KEY `triggers_2` (`value`,`lastchange`),
  KEY `triggers_3` (`templateid`),
  CONSTRAINT `c_triggers_1` FOREIGN KEY (`templateid`) REFERENCES `triggers` (`triggerid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `triggers`
--

LOCK TABLES `triggers` WRITE;
/*!40000 ALTER TABLE `triggers` DISABLE KEYS */;
INSERT INTO `triggers` VALUES (10010,'{13078}>5','Processor load is too high on {HOST.NAME}','',0,0,2,0,'','',NULL,0,0,0,0,'',0,'',0),(10011,'{13084}>30','Too many processes running on {HOST.NAME}','',0,0,2,0,'','',NULL,0,0,0,0,'',0,'',0),(10012,'{12580}<50','Lack of free swap space on {HOST.NAME}','',0,0,2,0,'It probably means that the systems requires more physical memory.','',NULL,0,0,0,0,'',0,'',0),(10016,'{10199}>0','/etc/passwd has been changed on {HOST.NAME}','',0,0,2,0,'','',NULL,0,0,0,0,'',0,'',0),(10021,'{12583}<0','{HOST.NAME} has just been restarted','',0,0,1,0,'','',NULL,0,0,0,0,'',0,'',0),(10041,'{10204}<256','Configured max number of processes is too low on {HOST.NAME}','',0,0,1,0,'','',NULL,0,0,0,0,'',0,'',0),(10042,'{12553}<1024','Configured max number of opened files is too low on {HOST.NAME}','',0,0,1,0,'','',NULL,0,0,0,0,'',0,'',0),(10043,'{10208}>0','Hostname was changed on {HOST.NAME}','',0,0,1,0,'','',NULL,0,0,0,0,'',0,'',0),(10044,'{10207}>0','Host information was changed on {HOST.NAME}','',0,0,1,0,'','',NULL,0,0,0,0,'',0,'',0),(10045,'{12927}>0','Version of zabbix_agent(d) was changed on {HOST.NAME}','',0,0,1,0,'','',13026,0,0,0,0,'',0,'',0),(10047,'{12550}=1','Zabbix agent on {HOST.NAME} is unreachable for 5 minutes','',0,0,3,0,'','',13025,0,0,0,0,'',0,'',0),(10190,'{13082}>300','Too many processes on {HOST.NAME}','',0,0,2,0,'','',NULL,0,0,0,0,'',0,'',0),(13000,'{12144}<20M','Lack of available memory on server {HOST.NAME}','',0,0,3,0,'','',NULL,0,0,0,0,'',0,'',0),(13015,'{12641}<25','Less than 25% free in the configuration cache','',0,0,3,0,'Consider increasing CacheSize in the zabbix_server.conf configuration file','',NULL,0,0,0,0,'',0,'',0),(13017,'{12651}<25','Less than 25% free in the history index cache','',0,0,3,0,'','',NULL,0,0,0,0,'',0,'',0),(13019,'{12649}<25','Less than 25% free in the trends cache','',0,0,3,0,'','',NULL,0,0,0,0,'',0,'',0),(13023,'{12653}>100','More than 100 items having missing data for more than 10 minutes','',0,0,2,0,'zabbix[queue,10m] item is collecting data about how many items are missing data for more than 10 minutes (next parameter)','',NULL,0,0,0,0,'',0,'',0),(13025,'{12549}=1','Zabbix agent on {HOST.NAME} is unreachable for 5 minutes','',0,0,3,0,'','',NULL,0,0,0,0,'',0,'',0),(13026,'{12926}>0','Version of zabbix_agent(d) was changed on {HOST.NAME}','',0,0,1,0,'','',NULL,0,0,0,0,'',0,'',0),(13073,'{12645}<25','Less than 25% free in the history cache','',0,0,3,0,'','',NULL,0,0,0,0,'',0,'',0),(13074,'{12646}<5','Less than 5% free in the value cache','',0,0,3,0,'','',NULL,0,0,0,0,'',0,'',0),(13075,'{12648}<5','Less than 5% free in the value cache','',0,0,3,0,'','',13074,0,0,0,0,'',0,'',0),(13080,'{13164}>75','Zabbix alerter processes more than 75% busy','',0,0,3,0,'','',NULL,0,0,0,1,'{13164}<65',0,'',0),(13081,'{13170}>75','Zabbix configuration syncer processes more than 75% busy','',0,0,3,0,'','',NULL,0,0,0,1,'{13170}<65',0,'',0),(13083,'{13172}>75','Zabbix discoverer processes more than 75% busy','',0,0,3,0,'','',NULL,0,0,0,1,'{13172}<65',0,'',0),(13084,'{13174}>75','Zabbix escalator processes more than 75% busy','',0,0,3,0,'','',NULL,0,0,0,1,'{13174}<65',0,'',0),(13085,'{13176}>75','Zabbix history syncer processes more than 75% busy','',0,0,3,0,'','',NULL,0,0,0,1,'{13176}<65',0,'',0),(13086,'{13178}>75','Zabbix housekeeper processes more than 75% busy','',0,0,3,0,'','',NULL,0,0,0,1,'{13178}<65',0,'',0),(13087,'{13180}>75','Zabbix http poller processes more than 75% busy','',0,0,3,0,'','',NULL,0,0,0,1,'{13180}<65',0,'',0),(13088,'{13182}>75','Zabbix icmp pinger processes more than 75% busy','',0,0,3,0,'','',NULL,0,0,0,1,'{13182}<65',0,'',0),(13089,'{13184}>75','Zabbix ipmi poller processes more than 75% busy','',0,0,3,0,'','',NULL,0,0,0,1,'{13184}<65',0,'',0),(13091,'{13188}>75','Zabbix poller processes more than 75% busy','',0,0,3,0,'','',NULL,0,0,0,1,'{13188}<65',0,'',0),(13092,'{13190}>75','Zabbix proxy poller processes more than 75% busy','',0,0,3,0,'','',NULL,0,0,0,1,'{13190}<65',0,'',0),(13093,'{13192}>75','Zabbix self-monitoring processes more than 75% busy','',0,0,3,0,'','',NULL,0,0,0,1,'{13192}<65',0,'',0),(13094,'{13198}>75','Zabbix timer processes more than 75% busy','',0,0,3,0,'','',NULL,0,0,0,1,'{13198}<65',0,'',0),(13095,'{13200}>75','Zabbix trapper processes more than 75% busy','',0,0,3,0,'','',NULL,0,0,0,1,'{13200}<65',0,'',0),(13096,'{13202}>75','Zabbix unreachable poller processes more than 75% busy','',0,0,3,0,'','',NULL,0,0,0,1,'{13202}<65',0,'',0),(13097,'{13204}>75','Zabbix vmware collector processes more than 75% busy','',0,0,3,0,'','',NULL,0,0,0,1,'{13204}<65',0,'',0),(13243,'{13080}>20','Disk I/O is overloaded on {HOST.NAME}','',0,0,2,0,'OS spends significant time waiting for I/O (input/output) operations. It could be indicator of performance issues with storage system.','',NULL,0,0,0,0,'',0,'',0),(13266,'{12592}<20','Free disk space is less than 20% on volume {#FSNAME}','',0,0,2,0,'','',NULL,0,0,2,0,'',0,'',0),(13272,'{12598}<20','Free inodes is less than 20% on volume {#FSNAME}','',0,0,2,0,'','',NULL,0,0,2,0,'',0,'',0),(13275,'{13186}>75','Zabbix java poller processes more than 75% busy','',0,0,3,0,'','',NULL,0,0,0,1,'{13186}<65',0,'',0),(13285,'{13159}=0','Telnet service is down on {HOST.NAME}','',0,0,3,0,'','',NULL,0,0,0,0,'',0,'',0),(13328,'{12715}=1','Zabbix agent on {HOST.NAME} is unreachable for 5 minutes','',0,0,3,0,'','',13025,0,0,0,0,'',0,'',0),(13329,'{12929}>0','Version of zabbix_agent(d) was changed on {HOST.NAME}','',0,0,1,0,'','',13026,0,0,0,0,'',0,'',0),(13330,'{12717}<1024','Configured max number of opened files is too low on {HOST.NAME}','',0,0,1,0,'','',NULL,0,0,0,0,'',0,'',0),(13331,'{12718}<256','Configured max number of processes is too low on {HOST.NAME}','',0,0,1,0,'','',NULL,0,0,0,0,'',0,'',0),(13332,'{13089}>30','Too many processes running on {HOST.NAME}','',0,0,2,0,'','',NULL,0,0,0,0,'',0,'',0),(13333,'{13088}>300','Too many processes on {HOST.NAME}','',0,0,2,0,'','',NULL,0,0,0,0,'',0,'',0),(13334,'{13087}>5','Processor load is too high on {HOST.NAME}','',0,0,2,0,'','',NULL,0,0,0,0,'',0,'',0),(13336,'{12723}>0','Hostname was changed on {HOST.NAME}','',0,0,1,0,'','',NULL,0,0,0,0,'',0,'',0),(13337,'{12724}<50','Lack of free swap space on {HOST.NAME}','',0,0,2,0,'It probably means that the systems requires more physical memory.','',NULL,0,0,0,0,'',0,'',0),(13338,'{12725}>0','Host information was changed on {HOST.NAME}','',0,0,1,0,'','',NULL,0,0,0,0,'',0,'',0),(13339,'{12726}<0','{HOST.NAME} has just been restarted','',0,0,1,0,'','',NULL,0,0,0,0,'',0,'',0),(13340,'{12727}>0','/etc/passwd has been changed on {HOST.NAME}','',0,0,2,0,'','',NULL,0,0,0,0,'',0,'',0),(13341,'{12728}<20M','Lack of available memory on server {HOST.NAME}','',0,0,3,0,'','',NULL,0,0,0,0,'',0,'',0),(13342,'{12729}<20','Free inodes is less than 20% on volume {#FSNAME}','',0,0,2,0,'','',NULL,0,0,2,0,'',0,'',0),(13343,'{12730}<20','Free disk space is less than 20% on volume {#FSNAME}','',0,0,2,0,'','',NULL,0,0,2,0,'',0,'',0),(13344,'{12731}=1','Zabbix agent on {HOST.NAME} is unreachable for 5 minutes','',0,0,3,0,'','',13025,0,0,0,0,'',0,'',0),(13345,'{12930}>0','Version of zabbix_agent(d) was changed on {HOST.NAME}','',0,0,1,0,'','',13026,0,0,0,0,'',0,'',0),(13346,'{12733}<1024','Configured max number of opened files is too low on {HOST.NAME}','',0,0,1,0,'','',NULL,0,0,0,0,'',0,'',0),(13347,'{12734}<256','Configured max number of processes is too low on {HOST.NAME}','',0,0,1,0,'','',NULL,0,0,0,0,'',0,'',0),(13348,'{13074}>30','Too many processes running on {HOST.NAME}','',0,0,2,0,'','',NULL,0,0,0,0,'',0,'',0),(13349,'{13073}>300','Too many processes on {HOST.NAME}','',0,0,2,0,'','',NULL,0,0,0,0,'',0,'',0),(13350,'{13072}>5','Processor load is too high on {HOST.NAME}','',0,0,2,0,'','',NULL,0,0,0,0,'',0,'',0),(13352,'{12739}>0','Hostname was changed on {HOST.NAME}','',0,0,1,0,'','',NULL,0,0,0,0,'',0,'',0),(13353,'{12740}<50','Lack of free swap space on {HOST.NAME}','',0,0,2,0,'It probably means that the systems requires more physical memory.','',NULL,0,0,0,0,'',0,'',0),(13354,'{12741}>0','Host information was changed on {HOST.NAME}','',0,0,1,0,'','',NULL,0,0,0,0,'',0,'',0),(13355,'{12742}<0','{HOST.NAME} has just been restarted','',0,0,1,0,'','',NULL,0,0,0,0,'',0,'',0),(13356,'{12743}>0','/etc/passwd has been changed on {HOST.NAME}','',0,0,2,0,'','',NULL,0,0,0,0,'',0,'',0),(13357,'{12744}<20M','Lack of available memory on server {HOST.NAME}','',0,0,3,0,'','',NULL,0,0,0,0,'',0,'',0),(13358,'{12745}<20','Free inodes is less than 20% on volume {#FSNAME}','',0,0,2,0,'','',NULL,0,0,2,0,'',0,'',0),(13359,'{12746}<20','Free disk space is less than 20% on volume {#FSNAME}','',0,0,2,0,'','',NULL,0,0,2,0,'',0,'',0),(13360,'{12747}=1','Zabbix agent on {HOST.NAME} is unreachable for 5 minutes','',0,0,3,0,'','',13025,0,0,0,0,'',0,'',0),(13361,'{12931}>0','Version of zabbix_agent(d) was changed on {HOST.NAME}','',0,0,1,0,'','',13026,0,0,0,0,'',0,'',0),(13364,'{13071}>30','Too many processes running on {HOST.NAME}','',0,0,2,0,'','',NULL,0,0,0,0,'',0,'',0),(13365,'{13070}>300','Too many processes on {HOST.NAME}','',0,0,2,0,'','',NULL,0,0,0,0,'',0,'',0),(13366,'{13069}>5','Processor load is too high on {HOST.NAME}','',0,0,2,0,'','',NULL,0,0,0,0,'',0,'',0),(13367,'{13068}>20','Disk I/O is overloaded on {HOST.NAME}','',0,0,2,0,'OS spends significant time waiting for I/O (input/output) operations. It could be indicator of performance issues with storage system.','',NULL,0,0,0,0,'',0,'',0),(13368,'{12755}>0','Hostname was changed on {HOST.NAME}','',0,0,1,0,'','',NULL,0,0,0,0,'',0,'',0),(13370,'{12757}>0','Host information was changed on {HOST.NAME}','',0,0,1,0,'','',NULL,0,0,0,0,'',0,'',0),(13371,'{12758}<0','{HOST.NAME} has just been restarted','',0,0,1,0,'','',NULL,0,0,0,0,'',0,'',0),(13372,'{12759}>0','/etc/passwd has been changed on {HOST.NAME}','',0,0,2,0,'','',NULL,0,0,0,0,'',0,'',0),(13373,'{12760}<20M','Lack of available memory on server {HOST.NAME}','',0,0,3,0,'','',NULL,0,0,0,0,'',0,'',0),(13374,'{12761}<20','Free inodes is less than 20% on volume {#FSNAME}','',0,0,2,0,'','',NULL,0,0,2,0,'',0,'',0),(13375,'{12762}<20','Free disk space is less than 20% on volume {#FSNAME}','',0,0,2,0,'','',NULL,0,0,2,0,'',0,'',0),(13376,'{12763}=1','Zabbix agent on {HOST.NAME} is unreachable for 5 minutes','',0,0,3,0,'','',13025,0,0,0,0,'',0,'',0),(13377,'{12932}>0','Version of zabbix_agent(d) was changed on {HOST.NAME}','',0,0,1,0,'','',13026,0,0,0,0,'',0,'',0),(13382,'{13075}>5','Processor load is too high on {HOST.NAME}','',0,0,2,0,'','',NULL,0,0,0,0,'',0,'',0),(13384,'{12771}>0','Hostname was changed on {HOST.NAME}','',0,0,1,0,'','',NULL,0,0,0,0,'',0,'',0),(13386,'{12773}>0','Host information was changed on {HOST.NAME}','',0,0,1,0,'','',NULL,0,0,0,0,'',0,'',0),(13388,'{12775}>0','/etc/passwd has been changed on {HOST.NAME}','',0,0,2,0,'','',NULL,0,0,0,0,'',0,'',0),(13389,'{12776}<20M','Lack of available memory on server {HOST.NAME}','',0,0,3,0,'','',NULL,0,0,0,0,'',0,'',0),(13390,'{12777}<20','Free inodes is less than 20% on volume {#FSNAME}','',0,0,2,0,'','',NULL,0,0,2,0,'',0,'',0),(13391,'{12778}<20','Free disk space is less than 20% on volume {#FSNAME}','',0,0,2,0,'','',NULL,0,0,2,0,'',0,'',0),(13392,'{12779}=1','Zabbix agent on {HOST.NAME} is unreachable for 5 minutes','',0,0,3,0,'','',13025,0,0,0,0,'',0,'',0),(13393,'{12933}>0','Version of zabbix_agent(d) was changed on {HOST.NAME}','',0,0,1,0,'','',13026,0,0,0,0,'',0,'',0),(13395,'{12782}<256','Configured max number of processes is too low on {HOST.NAME}','',0,0,1,0,'','',NULL,0,0,0,0,'',0,'',0),(13396,'{13093}>30','Too many processes running on {HOST.NAME}','',0,0,2,0,'','',NULL,0,0,0,0,'',0,'',0),(13397,'{13092}>300','Too many processes on {HOST.NAME}','',0,0,2,0,'','',NULL,0,0,0,0,'',0,'',0),(13398,'{13091}>5','Processor load is too high on {HOST.NAME}','',0,0,2,0,'','',NULL,0,0,0,0,'',0,'',0),(13399,'{13090}>20','Disk I/O is overloaded on {HOST.NAME}','',0,0,2,0,'OS spends significant time waiting for I/O (input/output) operations. It could be indicator of performance issues with storage system.','',NULL,0,0,0,0,'',0,'',0),(13400,'{12787}>0','Hostname was changed on {HOST.NAME}','',0,0,1,0,'','',NULL,0,0,0,0,'',0,'',0),(13401,'{12788}<50','Lack of free swap space on {HOST.NAME}','',0,0,2,0,'It probably means that the systems requires more physical memory.','',NULL,0,0,0,0,'',0,'',0),(13402,'{12789}>0','Host information was changed on {HOST.NAME}','',0,0,1,0,'','',NULL,0,0,0,0,'',0,'',0),(13403,'{12790}<0','{HOST.NAME} has just been restarted','',0,0,1,0,'','',NULL,0,0,0,0,'',0,'',0),(13404,'{12791}>0','/etc/passwd has been changed on {HOST.NAME}','',0,0,2,0,'','',NULL,0,0,0,0,'',0,'',0),(13405,'{12792}<20M','Lack of available memory on server {HOST.NAME}','',0,0,3,0,'','',NULL,0,0,0,0,'',0,'',0),(13406,'{12793}<20','Free inodes is less than 20% on volume {#FSNAME}','',0,0,2,0,'','',NULL,0,0,2,0,'',0,'',0),(13407,'{12794}<20','Free disk space is less than 20% on volume {#FSNAME}','',0,0,2,0,'','',NULL,0,0,2,0,'',0,'',0),(13408,'{12795}=1','Zabbix agent on {HOST.NAME} is unreachable for 5 minutes','',0,0,3,0,'','',13025,0,0,0,0,'',0,'',0),(13409,'{12934}>0','Version of zabbix_agent(d) was changed on {HOST.NAME}','',0,0,1,0,'','',13026,0,0,0,0,'',0,'',0),(13410,'{12797}<1024','Configured max number of opened files is too low on {HOST.NAME}','',0,0,1,0,'','',NULL,0,0,0,0,'',0,'',0),(13411,'{12798}<256','Configured max number of processes is too low on {HOST.NAME}','',0,0,1,0,'','',NULL,0,0,0,0,'',0,'',0),(13414,'{13086}>5','Processor load is too high on {HOST.NAME}','',0,0,2,0,'','',NULL,0,0,0,0,'',0,'',0),(13416,'{12803}>0','Hostname was changed on {HOST.NAME}','',0,0,1,0,'','',NULL,0,0,0,0,'',0,'',0),(13418,'{12805}>0','Host information was changed on {HOST.NAME}','',0,0,1,0,'','',NULL,0,0,0,0,'',0,'',0),(13419,'{12806}<0','{HOST.NAME} has just been restarted','',0,0,1,0,'','',NULL,0,0,0,0,'',0,'',0),(13420,'{12807}>0','/etc/passwd has been changed on {HOST.NAME}','',0,0,2,0,'','',NULL,0,0,0,0,'',0,'',0),(13421,'{12808}<20M','Lack of available memory on server {HOST.NAME}','',0,0,3,0,'','',NULL,0,0,0,0,'',0,'',0),(13422,'{12809}<20','Free inodes is less than 20% on volume {#FSNAME}','',0,0,2,0,'','',NULL,0,0,2,0,'',0,'',0),(13423,'{12810}<20','Free disk space is less than 20% on volume {#FSNAME}','',0,0,2,0,'','',NULL,0,0,2,0,'',0,'',0),(13425,'{12812}>0','Host information was changed on {HOST.NAME}','',0,0,3,0,'','',NULL,0,0,0,0,'',0,'',0),(13428,'{12815}<0','{HOST.NAME} has just been restarted','',0,0,3,0,'','',NULL,0,0,0,0,'',0,'',0),(13430,'{13095}>300','Too many processes on {HOST.NAME}','',0,0,3,0,'','',NULL,0,0,0,0,'',0,'',0),(13431,'{12818}<10','Lack of available virtual memory on server {HOST.NAME}','',0,0,3,0,'','',NULL,0,0,0,1,'{12818}>20',0,'',0),(13433,'{12820}<10000','Lack of free memory on server {HOST.NAME}','',0,0,3,0,'','',NULL,0,0,0,0,'',0,'',0),(13435,'{13094}>5','Processor load is too high on {HOST.NAME}','',0,0,3,0,'','',NULL,0,0,0,0,'',0,'',0),(13436,'{13205}>75','Zabbix vmware collector processes more than 75% busy','',0,0,3,0,'','Cannot evaluate expression: \"Cannot evaluate function \"Zabbix server:zabbix[process,vmware collector,avg,busy].avg(10m)\": item is not supported.\".',13097,0,1,0,1,'{13205}<65',0,'',0),(13437,'{12824}=1','Zabbix agent on {HOST.NAME} is unreachable for 5 minutes','',0,0,3,0,'','',13025,0,0,0,0,'',0,'',0),(13438,'{12935}>0','Version of zabbix_agent(d) was changed on {HOST.NAME}','',0,0,1,0,'','',13026,0,0,0,0,'',0,'',0),(13439,'{12826}<20','Free disk space is less than 20% on volume {#FSNAME}','',0,0,2,0,'','',NULL,0,0,2,0,'',0,'',0),(13441,'{13194}>75','Zabbix snmp trapper processes more than 75% busy','',0,0,3,0,'','',NULL,0,0,0,1,'{13194}<65',0,'',0),(13467,'{13165}>75','Zabbix alerter processes more than 75% busy','',0,0,3,0,'','',13080,0,0,0,1,'{13165}<65',0,'',0),(13468,'{13171}>75','Zabbix configuration syncer processes more than 75% busy','',0,0,3,0,'','',13081,0,0,0,1,'{13171}<65',0,'',0),(13470,'{13173}>75','Zabbix discoverer processes more than 75% busy','',0,0,3,1537840775,'','',13083,0,0,0,1,'{13173}<65',0,'',0),(13471,'{13175}>75','Zabbix escalator processes more than 75% busy','',0,0,3,0,'','',13084,0,0,0,1,'{13175}<65',0,'',0),(13472,'{13177}>75','Zabbix history syncer processes more than 75% busy','',0,0,3,0,'','',13085,0,0,0,1,'{13177}<65',0,'',0),(13473,'{13179}>75','Zabbix housekeeper processes more than 75% busy','',0,0,3,0,'','',13086,0,0,0,1,'{13179}<65',0,'',0),(13474,'{13181}>75','Zabbix http poller processes more than 75% busy','',0,0,3,0,'','',13087,0,0,0,1,'{13181}<65',0,'',0),(13475,'{13183}>75','Zabbix icmp pinger processes more than 75% busy','',0,0,3,0,'','',13088,0,0,0,1,'{13183}<65',0,'',0),(13476,'{13185}>75','Zabbix ipmi poller processes more than 75% busy','',0,0,3,0,'','Cannot evaluate expression: \"Cannot evaluate function \"zabbix-servser:zabbix[process,ipmi poller,avg,busy].avg(10m)\": item is not supported.\".',13089,0,1,0,1,'{13185}<65',0,'',0),(13477,'{13187}>75','Zabbix java poller processes more than 75% busy','',0,0,3,0,'','',13275,0,0,0,1,'{13187}<65',0,'',0),(13479,'{13189}>75','Zabbix poller processes more than 75% busy','',0,0,3,0,'','',13091,0,0,0,1,'{13189}<65',0,'',0),(13480,'{13191}>75','Zabbix proxy poller processes more than 75% busy','',0,0,3,0,'','',13092,0,0,0,1,'{13191}<65',0,'',0),(13481,'{13193}>75','Zabbix self-monitoring processes more than 75% busy','',0,0,3,0,'','',13093,0,0,0,1,'{13193}<65',0,'',0),(13482,'{13195}>75','Zabbix snmp trapper processes more than 75% busy','',0,0,3,0,'','Cannot evaluate expression: \"Cannot evaluate function \"zabbix-servser:zabbix[process,snmp trapper,avg,busy].avg(10m)\": item is not supported.\".',13441,0,1,0,1,'{13195}<65',0,'',0),(13483,'{13199}>75','Zabbix timer processes more than 75% busy','',0,0,3,0,'','',13094,0,0,0,1,'{13199}<65',0,'',0),(13484,'{13201}>75','Zabbix trapper processes more than 75% busy','',0,0,3,0,'','',13095,0,0,0,1,'{13201}<65',0,'',0),(13485,'{13203}>75','Zabbix unreachable poller processes more than 75% busy','',0,0,3,0,'','',13096,0,0,0,1,'{13203}<65',0,'',0),(13486,'{12895}>100','More than 100 items having missing data for more than 10 minutes','',0,0,2,0,'zabbix[queue,10m] item is collecting data about how many items are missing data for more than 10 minutes (next parameter)','',13023,0,0,0,0,'',0,'',0),(13487,'{12896}<25','Less than 25% free in the configuration cache','',0,0,3,0,'Consider increasing CacheSize in the zabbix_server.conf configuration file','',13015,0,0,0,0,'',0,'',0),(13488,'{12897}<25','Less than 25% free in the history cache','',0,0,3,0,'','',13073,0,0,0,0,'',0,'',0),(13489,'{12898}<25','Less than 25% free in the history index cache','',0,0,3,0,'','',13017,0,0,0,0,'',0,'',0),(13490,'{12899}<25','Less than 25% free in the trends cache','',0,0,3,0,'','',13019,0,0,0,0,'',0,'',0),(13491,'{12900}=1','Zabbix agent on {HOST.NAME} is unreachable for 5 minutes','',0,0,3,1533191407,'','',10047,0,0,0,0,'',0,'',0),(13492,'{12928}>0','Version of zabbix_agent(d) was changed on {HOST.NAME}','',0,0,1,0,'','',10045,0,0,0,0,'',0,'',0),(13493,'{12902}<1024','Configured max number of opened files is too low on {HOST.NAME}','',0,0,1,0,'','',10042,0,0,0,0,'',0,'',0),(13494,'{12903}<256','Configured max number of processes is too low on {HOST.NAME}','',0,0,1,0,'','',10041,0,0,0,0,'',0,'',0),(13495,'{13085}>30','Too many processes running on {HOST.NAME}','',0,0,2,0,'','',10011,0,0,0,0,'',0,'',0),(13496,'{13083}>300','Too many processes on {HOST.NAME}','',0,1,2,1530006012,'','',10190,0,0,0,0,'',0,'',0),(13497,'{13079}>5','Processor load is too high on {HOST.NAME}','',0,0,2,0,'','',10010,0,0,0,0,'',0,'',0),(13498,'{13081}>20','Disk I/O is overloaded on {HOST.NAME}','',0,0,2,0,'OS spends significant time waiting for I/O (input/output) operations. It could be indicator of performance issues with storage system.','',13243,0,0,0,0,'',0,'',0),(13499,'{12908}>0','Hostname was changed on {HOST.NAME}','',0,0,1,1530692907,'','',10043,0,0,0,0,'',0,'',0),(13500,'{12909}<50','Lack of free swap space on {HOST.NAME}','',0,0,2,0,'It probably means that the systems requires more physical memory.','',10012,0,0,0,0,'',0,'',0),(13501,'{12910}>0','Host information was changed on {HOST.NAME}','',0,0,1,1530692912,'','',10044,0,0,0,0,'',0,'',0),(13502,'{12911}<0','{HOST.NAME} has just been restarted','',0,0,1,1530689913,'','',10021,0,0,0,0,'',0,'',0),(13503,'{12912}>0','/etc/passwd has been changed on {HOST.NAME}','',0,0,2,1530790115,'','',10016,0,0,0,0,'',0,'',0),(13504,'{12913}<20M','Lack of available memory on server {HOST.NAME}','',0,0,3,0,'','',13000,0,0,0,0,'',0,'',0),(13505,'{12914}<20','Free inodes is less than 20% on volume {#FSNAME}','',0,0,2,0,'','',13272,0,0,2,0,'',0,'',0),(13506,'{12915}<20','Free disk space is less than 20% on volume {#FSNAME}','',0,0,2,0,'','',13266,0,0,2,0,'',0,'',0),(13507,'{12936}>0','Host name of zabbix_agentd was changed on {HOST.NAME}','',0,0,1,0,'','',NULL,0,0,0,0,'',0,'',0),(13508,'{12937}>0','Host name of zabbix_agentd was changed on {HOST.NAME}','',0,0,1,0,'','',13507,0,0,0,0,'',0,'',0),(13509,'{12938}>0','Host name of zabbix_agentd was changed on {HOST.NAME}','',0,0,1,0,'','',13508,0,0,0,0,'',0,'',0),(13510,'{12939}>0','Host name of zabbix_agentd was changed on {HOST.NAME}','',0,0,1,0,'','',13507,0,0,0,0,'',0,'',0),(13511,'{12940}>0','Host name of zabbix_agentd was changed on {HOST.NAME}','',0,0,1,0,'','',13507,0,0,0,0,'',0,'',0),(13512,'{12941}>0','Host name of zabbix_agentd was changed on {HOST.NAME}','',0,0,1,0,'','',13507,0,0,0,0,'',0,'',0),(13513,'{12942}>0','Host name of zabbix_agentd was changed on {HOST.NAME}','',0,0,1,0,'','',13507,0,0,0,0,'',0,'',0),(13514,'{12943}>0','Host name of zabbix_agentd was changed on {HOST.NAME}','',0,0,1,0,'','',13507,0,0,0,0,'',0,'',0),(13515,'{12944}>0','Host name of zabbix_agentd was changed on {HOST.NAME}','',0,0,1,0,'','',13507,0,0,0,0,'',0,'',0),(13516,'{12945}>0','Host name of zabbix_agentd was changed on {HOST.NAME}','',0,0,1,0,'','',13507,0,0,0,0,'',0,'',0),(13517,'{12946}<25','Less than 25% free in the configuration cache','',0,0,3,0,'Consider increasing CacheSize in the zabbix_server.conf configuration file','',NULL,0,0,0,0,'',0,'',0),(13518,'{12947}<25','Less than 25% free in the history cache','',0,0,3,0,'','',NULL,0,0,0,0,'',0,'',0),(13519,'{12948}<25','Less than 25% free in the history index cache','',0,0,3,0,'','',NULL,0,0,0,0,'',0,'',0),(13520,'{12949}>100','More than 100 items having missing data for more than 10 minutes','',0,0,2,0,'zabbix[queue,10m] item is collecting data about how many items are missing data for more than 10 minutes (next parameter)','',NULL,0,0,0,0,'',0,'',0),(13521,'{13206}>75','Zabbix configuration syncer processes more than 75% busy','',0,0,3,0,'','',NULL,0,0,0,1,'{13206}<65',0,'',0),(13522,'{13208}>75','Zabbix discoverer processes more than 75% busy','',0,0,3,0,'','',NULL,0,0,0,1,'{13208}<65',0,'',0),(13523,'{13210}>75','Zabbix history syncer processes more than 75% busy','',0,0,3,0,'','',NULL,0,0,0,1,'{13210}<65',0,'',0),(13524,'{13211}>75','Zabbix housekeeper processes more than 75% busy','',0,0,3,0,'','',NULL,0,0,0,1,'{13211}<65',0,'',0),(13525,'{13212}>75','Zabbix http poller processes more than 75% busy','',0,0,3,0,'','',NULL,0,0,0,1,'{13212}<65',0,'',0),(13526,'{13213}>75','Zabbix icmp pinger processes more than 75% busy','',0,0,3,0,'','',NULL,0,0,0,1,'{13213}<65',0,'',0),(13527,'{13214}>75','Zabbix ipmi poller processes more than 75% busy','',0,0,3,0,'','',NULL,0,0,0,1,'{13214}<65',0,'',0),(13528,'{13215}>75','Zabbix java poller processes more than 75% busy','',0,0,3,0,'','',NULL,0,0,0,1,'{13215}<65',0,'',0),(13529,'{13216}>75','Zabbix poller processes more than 75% busy','',0,0,3,0,'','',NULL,0,0,0,1,'{13216}<65',0,'',0),(13530,'{13217}>75','Zabbix self-monitoring processes more than 75% busy','',0,0,3,0,'','',NULL,0,0,0,1,'{13217}<65',0,'',0),(13531,'{13218}>75','Zabbix snmp trapper processes more than 75% busy','',0,0,3,0,'','',NULL,0,0,0,1,'{13218}<65',0,'',0),(13532,'{13219}>75','Zabbix trapper processes more than 75% busy','',0,0,3,0,'','',NULL,0,0,0,1,'{13219}<65',0,'',0),(13533,'{13220}>75','Zabbix unreachable poller processes more than 75% busy','',0,0,3,0,'','',NULL,0,0,0,1,'{13220}<65',0,'',0),(13534,'{13207}>75','Zabbix data sender processes more than 75% busy','',0,0,3,0,'','',NULL,0,0,0,1,'{13207}<65',0,'',0),(13535,'{13209}>75','Zabbix heartbeat sender processes more than 75% busy','',0,0,3,0,'','',NULL,0,0,0,1,'{13209}<65',0,'',0),(13536,'{12965}<25','Less than 25% free in the vmware cache','',0,0,3,0,'','',NULL,0,0,0,0,'',0,'',0),(13537,'{12966}<25','Less than 25% free in the vmware cache','',0,0,3,0,'','Cannot evaluate expression: \"Cannot evaluate function \"zabbix-servser:zabbix[vmware,buffer,pfree].min(10m)\": item is not supported.\".',13536,0,1,0,0,'',0,'',0),(13544,'{12994}=0','FTP service is down on {HOST.NAME}','',0,0,3,0,'','',NULL,0,0,0,0,'',0,'',0),(13545,'{12995}=0','HTTP service is down on {HOST.NAME}','',0,0,3,0,'','',NULL,0,0,0,0,'',0,'',0),(13546,'{12996}=0','HTTPS service is down on {HOST.NAME}','',0,0,3,0,'','',NULL,0,0,0,0,'',0,'',0),(13547,'{12997}=0','IMAP service is down on {HOST.NAME}','',0,0,3,0,'','',NULL,0,0,0,0,'',0,'',0),(13548,'{12998}=0','LDAP service is down on {HOST.NAME}','',0,0,3,0,'','',NULL,0,0,0,0,'',0,'',0),(13549,'{13154}=0','NNTP service is down on {HOST.NAME}','',0,0,3,0,'','',NULL,0,0,0,0,'',0,'',0),(13550,'{13156}=0','NTP service is down on {HOST.NAME}','',0,0,3,0,'','',NULL,0,0,0,0,'',0,'',0),(13551,'{13152}=0','POP service is down on {HOST.NAME}','',0,0,3,0,'','',NULL,0,0,0,0,'',0,'',0),(13552,'{13157}=0','SMTP service is down on {HOST.NAME}','',0,0,3,0,'','',NULL,0,0,0,0,'',0,'',0),(13553,'{13158}=0','SSH service is down on {HOST.NAME}','',0,0,3,0,'','',NULL,0,0,0,0,'',0,'',0),(13557,'{13160}=1','Zabbix value cache working in low memory mode','',0,0,4,0,'','',NULL,0,0,0,0,'',0,'',0),(13558,'{13161}=1','Zabbix value cache working in low memory mode','',0,0,4,0,'','',13557,0,0,0,0,'',0,'',0),(13559,'{13196}>75','Zabbix task manager processes more than 75% busy','',0,0,3,0,'','',NULL,0,0,0,1,'{13196}<65',0,'',0),(13560,'{13197}>75','Zabbix task manager processes more than 75% busy','',0,0,3,0,'','',13559,0,0,0,1,'{13197}<65',0,'',0),(13561,'{13221}<>0','Service \"{#SERVICE.NAME}\" ({#SERVICE.DISPLAYNAME}) is not running (startup type {#SERVICE.STARTUPNAME})','',0,0,3,0,'','',NULL,0,0,2,0,'',0,'',0),(13562,'{13222}>75','Zabbix ipmi manager processes more than 75% busy','',0,0,3,0,'','',NULL,0,0,0,1,'{13222}<65',0,'',0),(13563,'{13223}>75','Zabbix ipmi manager processes more than 75% busy','',0,0,3,0,'','Cannot evaluate expression: \"Cannot evaluate function \"Zabbix server:zabbix[process,ipmi manager,avg,busy].avg(10m)\": item is not supported.\".',13562,0,1,0,1,'{13223}<65',0,'',0),(13564,'{13224}>75','Zabbix ipmi manager processes more than 75% busy','',0,0,3,0,'','',NULL,0,0,0,1,'{13224}<65',0,'',0),(13565,'{13225}>75','Zabbix task manager processes more than 75% busy','',0,0,3,0,'','',NULL,0,0,0,1,'{13225}<65',0,'',0),(13566,'{13226}>75','Zabbix alert manager processes more than 75% busy','',0,0,3,0,'','',NULL,0,0,0,1,'{13226}<65',0,'',0),(13567,'{13227}>75','Zabbix alert manager processes more than 75% busy','',0,0,3,0,'','',13566,0,0,0,1,'{13227}<65',0,'',0),(13568,'{13228}>75','Zabbix preprocessing manager processes more than 75% busy','',0,0,3,0,'','',NULL,0,0,0,1,'{13228}<65',0,'',0),(13569,'{13229}>75','Zabbix preprocessing worker processes more than 75% busy','',0,0,3,0,'','',NULL,0,0,0,1,'{13229}<65',0,'',0),(13570,'{13230}>75','Zabbix preprocessing manager processes more than 75% busy','',0,0,3,0,'','',13568,0,0,0,1,'{13230}<65',0,'',0),(13571,'{13231}>75','Zabbix preprocessing worker processes more than 75% busy','',0,0,3,0,'','',13569,0,0,0,1,'{13231}<65',0,'',0),(14163,'{14249} > ({14250} * 0.7)','70% http-8080 worker threads busy on {HOST.NAME}','',0,0,2,0,'','',NULL,0,0,0,0,'',0,'',0),(14164,'{14251} > ({14252} * 0.7)','70% http-8443 worker threads busy on {HOST.NAME}','',0,0,2,0,'','',NULL,0,0,0,0,'',0,'',0),(14165,'{14253} > ({14254}  *0.7)','70% jk-8009 worker threads busy on {HOST.NAME}','',0,0,2,0,'','',NULL,0,0,0,0,'',0,'',0),(14166,'{14255} = 1','gzip compression is off for connector http-8080 on {HOST.NAME}','',0,0,1,0,'','',NULL,0,0,0,0,'',0,'',0),(14167,'{14256} = 1','gzip compression is off for connector http-8443 on {HOST.NAME}','',0,0,1,0,'','',NULL,0,0,0,0,'',0,'',0),(14168,'{14257}>({14258}*0.7)','70% mem Heap Memory used on {HOST.NAME}','',0,0,3,0,'','',NULL,0,0,0,0,'',0,'',0),(14169,'{14259}>({14260}*0.7)','70% mem Non-Heap Memory used on {HOST.NAME}','',0,0,3,0,'','',NULL,0,0,0,0,'',0,'',0),(14170,'{14261}>({14262}*0.7)','70% mp CMS Old Gen used on {HOST.NAME}','',0,0,3,0,'','',NULL,0,0,0,0,'',0,'',0),(14171,'{14263}>({14264}*0.7)','70% mp CMS Perm Gen used on {HOST.NAME}','',0,0,3,0,'','',NULL,0,0,0,0,'',0,'',0),(14172,'{14265}>({14266}*0.7)','70% mp Code Cache used on {HOST.NAME}','',0,0,3,0,'','',NULL,0,0,0,0,'',0,'',0),(14173,'{14267}>({14268}*0.7)','70% mp Perm Gen used on {HOST.NAME}','',0,0,3,0,'','',NULL,0,0,0,0,'',0,'',0),(14174,'{14269}>({14270}*0.7)','70% mp PS Old Gen used on {HOST.NAME}','',0,0,3,0,'','',NULL,0,0,0,0,'',0,'',0),(14175,'{14271}>({14272}*0.7)','70% mp PS Perm Gen used on {HOST.NAME}','',0,0,3,0,'','',NULL,0,0,0,0,'',0,'',0),(14176,'{14273}>({14274}*0.7)','70% mp Tenured Gen used on {HOST.NAME}','',0,0,3,0,'','',NULL,0,0,0,0,'',0,'',0),(14177,'{14275}>({14276}*0.7)','70% os Opened File Descriptor Count used on {HOST.NAME}','',0,0,3,0,'','',NULL,0,0,0,0,'',0,'',0),(14178,'{14277}>70','70% os Process CPU Load on {HOST.NAME}','',0,0,3,0,'','',NULL,0,0,0,0,'',0,'',0),(14179,'{14278}<{14279}','gc Concurrent Mark Sweep in fire fighting mode on {HOST.NAME}','',0,0,3,0,'','',NULL,0,0,0,0,'',0,'',0),(14180,'{14280}<{14281}','gc Mark Sweep Compact in fire fighting mode on {HOST.NAME}','',0,0,3,0,'','',NULL,0,0,0,0,'',0,'',0),(14181,'{14282}<{14283}','gc PS Mark Sweep in fire fighting mode on {HOST.NAME}','',0,0,3,0,'','',NULL,0,0,0,0,'',0,'',0),(14182,'{14284}={14285}','mem Heap Memory fully committed on {HOST.NAME}','',0,0,2,0,'','',NULL,0,0,0,0,'',0,'',0),(14183,'{14286}={14287}','mem Non-Heap Memory fully committed on {HOST.NAME}','',0,0,2,0,'','',NULL,0,0,0,0,'',0,'',0),(14184,'{14288}={14289}','mp CMS Old Gen fully committed on {HOST.NAME}','',0,0,2,0,'','',NULL,0,0,0,0,'',0,'',0),(14185,'{14290}={14291}','mp CMS Perm Gen fully committed on {HOST.NAME}','',0,0,2,0,'','',NULL,0,0,0,0,'',0,'',0),(14186,'{14292}={14293}','mp Code Cache fully committed on {HOST.NAME}','',0,0,2,0,'','',NULL,0,0,0,0,'',0,'',0),(14187,'{14294}={14295}','mp Perm Gen fully committed on {HOST.NAME}','',0,0,2,0,'','',NULL,0,0,0,0,'',0,'',0),(14188,'{14296}={14297}','mp PS Old Gen fully committed on {HOST.NAME}','',0,0,2,0,'','',NULL,0,0,0,0,'',0,'',0),(14189,'{14298}={14299}','mp PS Perm Gen fully committed on {HOST.NAME}','',0,0,2,0,'','',NULL,0,0,0,0,'',0,'',0),(14190,'{14300}={14301}','mp Tenured Gen fully committed on {HOST.NAME}','',0,0,2,0,'','',NULL,0,0,0,0,'',0,'',0),(14191,'{14302}=1','{HOST.NAME} is not reachable','',0,0,3,0,'','',NULL,0,0,0,0,'',0,'',0),(14192,'{14303}<>1','{HOST.NAME} runs suboptimal VM type','',0,0,1,0,'','',NULL,0,0,0,0,'',0,'',0),(14193,'{14304}=1','{HOST.NAME} uses suboptimal JIT compiler','',0,0,1,0,'','',NULL,0,0,0,0,'',0,'',0),(14194,'{14305}=0','MySQL is down','',0,0,2,0,'','',NULL,0,0,0,0,'',0,'',0),(14195,'{14306}<1.597 or {14306}>2.019','BB +1.8V SM Critical [{ITEM.VALUE}]','',0,0,5,0,'','',NULL,0,0,0,0,'',0,'',0),(14196,'{14307}<1.646 or {14307}>1.960','BB +1.8V SM Non-Critical [{ITEM.VALUE}]','',0,0,4,0,'','',NULL,0,0,0,0,'',0,'',0),(14197,'{14308}<2.876 or {14308}>3.729','BB +3.3V Critical [{ITEM.VALUE}]','',0,0,5,0,'','',NULL,0,0,0,0,'',0,'',0),(14198,'{14309}<2.970 or {14309}>3.618','BB +3.3V Non-Critical [{ITEM.VALUE}]','',0,0,4,0,'','',NULL,0,0,0,0,'',0,'',0),(14199,'{14310}<2.876 or {14310}>3.729','BB +3.3V STBY Critical [{ITEM.VALUE}]','',0,0,5,0,'','',NULL,0,0,0,0,'',0,'',0),(14200,'{14311}<2.970 or {14311}>3.618','BB +3.3V STBY Non-Critical [{ITEM.VALUE}]','',0,0,4,0,'','',NULL,0,0,0,0,'',0,'',0),(14201,'{14312}<4.362 or {14312}>5.663','BB +5.0V Critical [{ITEM.VALUE}]','',0,0,5,0,'','',NULL,0,0,0,0,'',0,'',0),(14202,'{14313}<4.483 or {14313}>5.495','BB +5.0V Non-Critical [{ITEM.VALUE}]','',0,0,4,0,'','',NULL,0,0,0,0,'',0,'',0),(14203,'{14314}<5 or {14314}>66','BB Ambient Temp Critical [{ITEM.VALUE}]','',0,0,5,0,'','',NULL,0,0,0,0,'',0,'',0),(14204,'{14315}<10 or {14315}>61','BB Ambient Temp Non-Critical [{ITEM.VALUE}]','',0,0,4,0,'','',NULL,0,0,0,0,'',0,'',0),(14205,'{14316}=0','Power','',0,0,2,0,'','',NULL,0,0,0,0,'',0,'',0),(14206,'{14317}<5 or {14317}>90','Baseboard Temp Critical [{ITEM.VALUE}]','',0,0,5,0,'','',NULL,0,0,0,0,'',0,'',0),(14207,'{14318}<10 or {14318}>83','Baseboard Temp Non-Critical [{ITEM.VALUE}]','',0,0,4,0,'','',NULL,0,0,0,0,'',0,'',0),(14208,'{14319}<0.953 or {14319}>1.149','BB +1.05V PCH Critical [{ITEM.VALUE}]','',0,0,5,0,'','',NULL,0,0,0,0,'',0,'',0),(14209,'{14320}<0.985 or {14320}>1.117','BB +1.05V PCH Non-Critical [{ITEM.VALUE}]','',0,0,4,0,'','',NULL,0,0,0,0,'',0,'',0),(14210,'{14321}<0.683 or {14321}>1.543','BB +1.1V P1 Vccp Critical [{ITEM.VALUE}]','',0,0,5,0,'','',NULL,0,0,0,0,'',0,'',0),(14211,'{14322}<0.708 or {14322}>1.501','BB +1.1V P1 Vccp Non-Critical [{ITEM.VALUE}]','',0,0,4,0,'','',NULL,0,0,0,0,'',0,'',0),(14212,'{14323}<1.362 or {14323}>1.635','BB +1.5V P1 DDR3 Critical [{ITEM.VALUE}]','',0,0,5,0,'','',NULL,0,0,0,0,'',0,'',0),(14213,'{14324}<1.401 or {14324}>1.589','BB +1.5V P1 DDR3 Non-Critical [{ITEM.VALUE}]','',0,0,4,0,'','',NULL,0,0,0,0,'',0,'',0),(14214,'{14325}<2.982 or {14325}>3.625','BB +3.3V Critical [{ITEM.VALUE}]','',0,0,5,0,'','',NULL,0,0,0,0,'',0,'',0),(14215,'{14326}<3.067 or {14326}>3.525','BB +3.3V Non-Critical [{ITEM.VALUE}]','',0,0,4,0,'','',NULL,0,0,0,0,'',0,'',0),(14216,'{14327}<2.982 or {14327}>3.625','BB +3.3V STBY Critical [{ITEM.VALUE}]','',0,0,5,0,'','',NULL,0,0,0,0,'',0,'',0),(14217,'{14328}<3.067 or {14328}>3.525','BB +3.3V STBY Non-Critical [{ITEM.VALUE}]','',0,0,4,0,'','',NULL,0,0,0,0,'',0,'',0),(14218,'{14329}<4.471 or {14329}>5.538','BB +5.0V Critical [{ITEM.VALUE}]','',0,0,5,0,'','',NULL,0,0,0,0,'',0,'',0),(14219,'{14330}<4.630 or {14330}>5.380','BB +5.0V Non-Critical [{ITEM.VALUE}]','',0,0,4,0,'','',NULL,0,0,0,0,'',0,'',0),(14220,'{14331}<0 or {14331}>48','Front Panel Temp Critical [{ITEM.VALUE}]','',0,0,5,0,'','',NULL,0,0,0,0,'',0,'',0),(14221,'{14332}<5 or {14332}>44','Front Panel Temp Non-Critical [{ITEM.VALUE}]','',0,0,4,0,'','',NULL,0,0,0,0,'',0,'',0),(14222,'{14333}=0','Power','',0,0,2,0,'','',NULL,0,0,0,0,'',0,'',0),(14223,'{14334}<324','System Fan 2 Critical [{ITEM.VALUE}]','',0,0,5,0,'','',NULL,0,0,0,0,'',0,'',0),(14224,'{14335}<378','System Fan 2 Non-Critical [{ITEM.VALUE}]','',0,0,4,0,'','',NULL,0,0,0,0,'',0,'',0),(14225,'{14336}<324','System Fan 3 Critical [{ITEM.VALUE}]','',0,0,5,0,'','',NULL,0,0,0,0,'',0,'',0),(14226,'{14337}<378','System Fan 3 Non-Critical [{ITEM.VALUE}]','',0,0,4,0,'','',NULL,0,0,0,0,'',0,'',0),(14243,'{14370}>{$CPU_UTIL_MAX}','#{#SNMPINDEX}: High CPU utilization','',0,0,3,0,'Last value: {ITEM.LASTVALUE1}.','',NULL,0,0,2,0,'',0,'',0),(14245,'{14372}>{$STORAGE_UTIL_CRIT}','{#SNMPVALUE}: Disk space is critically low','',0,0,3,0,'Last value: {ITEM.LASTVALUE1}.','',NULL,0,0,2,0,'',0,'',0),(14246,'{14373}>{$STORAGE_UTIL_WARN}','{#SNMPVALUE}: Disk space is low','',0,0,2,0,'Last value: {ITEM.LASTVALUE1}.','',NULL,0,0,2,0,'',0,'',0),(14247,'{14374}>{$CPU_UTIL_MAX}','#{#SNMPINDEX}: High CPU utilization','',0,0,3,0,'Last value: {ITEM.LASTVALUE1}.','',NULL,0,0,2,0,'',0,'',0),(14249,'{14376}>{$STORAGE_UTIL_CRIT}','{#SNMPVALUE}: Disk space is critically low','',0,0,3,0,'Last value: {ITEM.LASTVALUE1}.','',NULL,0,0,2,0,'',0,'',0),(14250,'{14377}>{$STORAGE_UTIL_WARN}','{#SNMPVALUE}: Disk space is low','',0,0,2,0,'Last value: {ITEM.LASTVALUE1}.','',NULL,0,0,2,0,'',0,'',0),(14251,'{14378}=0','Unavailable by ICMP ping','',0,0,4,0,'Last value: {ITEM.LASTVALUE1}.\r\nLast three attempts returned timeout.  Please check device connectivity.','',NULL,0,0,0,0,'',0,'',0),(14252,'{14379}>{$ICMP_LOSS_WARN} and {14379}<100','High ICMP ping loss','',0,0,2,0,'','',NULL,0,0,0,0,'',0,'',0),(14253,'{14380}>{$ICMP_RESPONSE_TIME_WARN}','High ICMP ping response time','',0,0,2,0,'','',NULL,0,0,0,0,'',0,'',0),(14288,'{14463}=0','Unavailable by ICMP ping','',0,0,4,0,'Last value: {ITEM.LASTVALUE1}.\r\nLast three attempts returned timeout.  Please check device connectivity.','',14251,0,0,0,0,'',0,'',0),(14289,'{14464}>{$ICMP_LOSS_WARN} and {14464}<100','High ICMP ping loss','',0,0,2,0,'','',14252,0,0,0,0,'',0,'',0),(14290,'{14465}>{$ICMP_RESPONSE_TIME_WARN}','High ICMP ping response time','',0,0,2,0,'','',14253,0,0,0,0,'',0,'',0),(14291,'{14466}<10m','{HOST.NAME} has been restarted','',0,0,2,0,'Last value: {ITEM.LASTVALUE1}.\r\nThe device uptime is less than 10 minutes','',NULL,0,0,0,0,'',0,'',1),(14293,'{14468}=0','Unavailable by ICMP ping','',0,0,4,0,'Last value: {ITEM.LASTVALUE1}.\r\nLast three attempts returned timeout.  Please check device connectivity.','',14251,0,0,0,0,'',0,'',0),(14294,'{14469}>{$ICMP_LOSS_WARN} and {14469}<100','High ICMP ping loss','',0,0,2,0,'','',14252,0,0,0,0,'',0,'',0),(14295,'{14470}>{$ICMP_RESPONSE_TIME_WARN}','High ICMP ping response time','',0,0,2,0,'','',14253,0,0,0,0,'',0,'',0),(14296,'{14471}<10m','{HOST.NAME} has been restarted','',0,0,2,0,'Last value: {ITEM.LASTVALUE1}.\r\nThe device uptime is less than 10 minutes','',NULL,0,0,0,0,'',0,'',1),(14311,'{14508}=0','Unavailable by ICMP ping','',0,0,4,0,'Last value: {ITEM.LASTVALUE1}.\r\nLast three attempts returned timeout.  Please check device connectivity.','',14293,0,0,0,0,'',0,'',0),(14312,'{14509}>{$ICMP_LOSS_WARN} and {14509}<100','High ICMP ping loss','',0,0,2,0,'','',14294,0,0,0,0,'',0,'',0),(14313,'{14510}>{$ICMP_RESPONSE_TIME_WARN}','High ICMP ping response time','',0,0,2,0,'','',14295,0,0,0,0,'',0,'',0),(14314,'{14511}<10m','{HOST.NAME} has been restarted','',0,0,2,0,'Last value: {ITEM.LASTVALUE1}.\r\nThe device uptime is less than 10 minutes','',14296,0,0,0,0,'',0,'',1),(14316,'{14513}>{$CPU_UTIL_MAX}','High CPU utilization','',0,0,3,0,'Last value: {ITEM.LASTVALUE1}.','',NULL,0,0,0,0,'',0,'',0),(14317,'{14514}>{$MEMORY_UTIL_MAX}','High memory utilization','',0,0,3,0,'Last value: {ITEM.LASTVALUE1}.','',NULL,0,0,0,0,'',0,'',0),(14318,'{14515}>{$TEMP_WARN:\"\"}','{#SNMPVALUE}: Temperature is above warning threshold: >{$TEMP_WARN:\"\"}','',0,0,2,0,'Last value: {ITEM.LASTVALUE1}.\r\nThis trigger uses temperature sensor values as well as temperature sensor status if available','',NULL,0,0,2,1,'{14516}<{$TEMP_WARN:\"\"}-3',0,'',0),(14319,'{14517}>{$TEMP_CRIT:\"\"}','{#SNMPVALUE}: Temperature is above critical threshold: >{$TEMP_CRIT:\"\"}','',0,0,4,0,'Last value: {ITEM.LASTVALUE1}.\r\nThis trigger uses temperature sensor values as well as temperature sensor status if available','',NULL,0,0,2,1,'{14518}<{$TEMP_CRIT:\"\"}-3',0,'',0),(14320,'{14519}<{$TEMP_CRIT_LOW:\"\"}','{#SNMPVALUE}: Temperature is too low: <{$TEMP_CRIT_LOW:\"\"}','',0,0,3,0,'Last value: {ITEM.LASTVALUE1}.','',NULL,0,0,2,1,'{14520}>{$TEMP_CRIT_LOW:\"\"}+3',0,'',0),(14322,'{14522}=1 and {14523}>0','{#ENT_NAME}: Device has been replaced (new serial number received)','',0,0,1,0,'Last value: {ITEM.LASTVALUE1}.\r\nDevice serial number has changed. Ack to close','',NULL,0,0,2,2,'',0,'',1),(14327,'{14536}=0','Unavailable by ICMP ping','',0,0,4,0,'Last value: {ITEM.LASTVALUE1}.\r\nLast three attempts returned timeout.  Please check device connectivity.','',14293,0,0,0,0,'',0,'',0),(14328,'{14537}>{$ICMP_LOSS_WARN} and {14537}<100','High ICMP ping loss','',0,0,2,0,'','',14294,0,0,0,0,'',0,'',0),(14329,'{14538}>{$ICMP_RESPONSE_TIME_WARN}','High ICMP ping response time','',0,0,2,0,'','',14295,0,0,0,0,'',0,'',0),(14330,'{14539}<10m','{HOST.NAME} has been restarted','',0,0,2,0,'Last value: {ITEM.LASTVALUE1}.\r\nThe device uptime is less than 10 minutes','',14296,0,0,0,0,'',0,'',1),(14332,'{14541}>{$CPU_UTIL_MAX}','High CPU utilization','',0,0,3,0,'Last value: {ITEM.LASTVALUE1}.','',NULL,0,0,0,0,'',0,'',0),(14333,'{14542}>{$MEMORY_UTIL_MAX}','High memory utilization','',0,0,3,0,'Last value: {ITEM.LASTVALUE1}.','',NULL,0,0,0,0,'',0,'',0),(14334,'{14543}={$HEALTH_CRIT_STATUS}','System status is in critical state','',0,0,4,0,'Last value: {ITEM.LASTVALUE1}.\r\nPlease check the device for errors','',NULL,0,0,0,0,'',0,'',0),(14335,'{14544}={$HEALTH_WARN_STATUS:\"offline\"} or {14544}={$HEALTH_WARN_STATUS:\"testing\"}','System status is in warning state','',0,0,2,0,'Last value: {ITEM.LASTVALUE1}.\r\nPlease check the device for warnings','',NULL,0,0,0,0,'',0,'',0),(14336,'{14545}=1 and {14546}>0','Device has been replaced (new serial number received)','',0,0,1,0,'Last value: {ITEM.LASTVALUE1}.\r\nDevice serial number has changed. Ack to close','',NULL,0,0,0,2,'',0,'',1),(14337,'{14547}=1 and {14548}>0','Firmware has changed','',0,0,1,0,'Last value: {ITEM.LASTVALUE1}.\r\nFirmware version has changed. Ack to close','',NULL,0,0,0,2,'',0,'',1),(14339,'{14552}>{$TEMP_CRIT:\"\"}','{#SENSOR_INFO}: Temperature is above critical threshold: >{$TEMP_CRIT:\"\"}','',0,0,4,0,'Last value: {ITEM.LASTVALUE1}.\r\nThis trigger uses temperature sensor values as well as temperature sensor status if available','',NULL,0,0,2,1,'{14553}<{$TEMP_CRIT:\"\"}-3',0,'',0),(14340,'{14554}<{$TEMP_CRIT_LOW:\"\"}','{#SENSOR_INFO}: Temperature is too low: <{$TEMP_CRIT_LOW:\"\"}','',0,0,3,0,'Last value: {ITEM.LASTVALUE1}.','',NULL,0,0,2,1,'{14555}>{$TEMP_CRIT_LOW:\"\"}+3',0,'',0),(14347,'{14570}=0','Unavailable by ICMP ping','',0,0,4,0,'Last value: {ITEM.LASTVALUE1}.\r\nLast three attempts returned timeout.  Please check device connectivity.','',14293,0,0,0,0,'',0,'',0),(14348,'{14571}>{$ICMP_LOSS_WARN} and {14571}<100','High ICMP ping loss','',0,0,2,0,'','',14294,0,0,0,0,'',0,'',0),(14349,'{14572}>{$ICMP_RESPONSE_TIME_WARN}','High ICMP ping response time','',0,0,2,0,'','',14295,0,0,0,0,'',0,'',0),(14350,'{14573}<10m','{HOST.NAME} has been restarted','',0,0,2,0,'Last value: {ITEM.LASTVALUE1}.\r\nThe device uptime is less than 10 minutes','',14296,0,0,0,0,'',0,'',1),(14356,'{14587}=0','Unavailable by ICMP ping','',0,0,4,0,'Last value: {ITEM.LASTVALUE1}.\r\nLast three attempts returned timeout.  Please check device connectivity.','',14293,0,0,0,0,'',0,'',0),(14357,'{14588}>{$ICMP_LOSS_WARN} and {14588}<100','High ICMP ping loss','',0,0,2,0,'','',14294,0,0,0,0,'',0,'',0),(14358,'{14589}>{$ICMP_RESPONSE_TIME_WARN}','High ICMP ping response time','',0,0,2,0,'','',14295,0,0,0,0,'',0,'',0),(14359,'{14590}<10m','{HOST.NAME} has been restarted','',0,0,2,0,'Last value: {ITEM.LASTVALUE1}.\r\nThe device uptime is less than 10 minutes','',14296,0,0,0,0,'',0,'',1),(14361,'{14592}>{$CPU_UTIL_MAX}','High CPU utilization','',0,0,3,0,'Last value: {ITEM.LASTVALUE1}.','',NULL,0,0,0,0,'',0,'',0),(14362,'{14593}>{$MEMORY_UTIL_MAX}','High memory utilization','',0,0,3,0,'Last value: {ITEM.LASTVALUE1}.','',NULL,0,0,0,0,'',0,'',0),(14363,'{14594}=1 and {14595}>0','Device has been replaced (new serial number received)','',0,0,1,0,'Last value: {ITEM.LASTVALUE1}.\r\nDevice serial number has changed. Ack to close','',NULL,0,0,0,2,'',0,'',1),(14364,'{14596}=1 and {14597}>0','Firmware has changed','',0,0,1,0,'Last value: {ITEM.LASTVALUE1}.\r\nFirmware version has changed. Ack to close','',NULL,0,0,0,2,'',0,'',1),(14365,'{14598}=1 and {14599}>0','Firmware has changed','',0,0,1,0,'Last value: {ITEM.LASTVALUE1}.\r\nFirmware version has changed. Ack to close','',NULL,0,0,0,2,'',0,'',1),(14366,'{14600}>{$CPU_UTIL_MAX}','High CPU utilization','',0,0,3,0,'Last value: {ITEM.LASTVALUE1}.','',14361,0,0,0,0,'',0,'',0),(14367,'{14601}>{$CPU_UTIL_MAX}','High CPU utilization','',0,0,3,0,'Last value: {ITEM.LASTVALUE1}.','',14361,0,0,0,0,'',0,'',0),(14368,'{14602}>{$MEMORY_UTIL_MAX}','High memory utilization','',0,0,3,0,'Last value: {ITEM.LASTVALUE1}.','',14362,0,0,0,0,'',0,'',0),(14369,'{14603}>{$MEMORY_UTIL_MAX}','High memory utilization','',0,0,3,0,'Last value: {ITEM.LASTVALUE1}.','',14362,0,0,0,0,'',0,'',0),(14372,'{14606}>{$TEMP_WARN:\"\"}','{#SENSOR_DESCR}: Temperature is above warning threshold: >{$TEMP_WARN:\"\"}','',0,0,2,0,'Last value: {ITEM.LASTVALUE1}.\r\nThis trigger uses temperature sensor values as well as temperature sensor status if available','',NULL,0,0,2,1,'{14607}<{$TEMP_WARN:\"\"}-3',0,'',0),(14373,'{14608}>{$TEMP_CRIT:\"\"}','{#SENSOR_DESCR}: Temperature is above critical threshold: >{$TEMP_CRIT:\"\"}','',0,0,4,0,'Last value: {ITEM.LASTVALUE1}.\r\nThis trigger uses temperature sensor values as well as temperature sensor status if available','',NULL,0,0,2,1,'{14609}<{$TEMP_CRIT:\"\"}-3',0,'',0),(14374,'{14610}<{$TEMP_CRIT_LOW:\"\"}','{#SENSOR_DESCR}: Temperature is too low: <{$TEMP_CRIT_LOW:\"\"}','',0,0,3,0,'Last value: {ITEM.LASTVALUE1}.','',NULL,0,0,2,1,'{14611}>{$TEMP_CRIT_LOW:\"\"}+3',0,'',0),(14375,'{14612}>{$TEMP_WARN:\"\"}','Temperature is above warning threshold: >{$TEMP_WARN:\"\"}','',0,0,2,0,'Last value: {ITEM.LASTVALUE1}.\r\nThis trigger uses temperature sensor values as well as temperature sensor status if available','',NULL,0,0,2,1,'{14613}<{$TEMP_WARN:\"\"}-3',0,'',0),(14376,'{14614}>{$TEMP_CRIT:\"\"}','Temperature is above critical threshold: >{$TEMP_CRIT:\"\"}','',0,0,4,0,'Last value: {ITEM.LASTVALUE1}.\r\nThis trigger uses temperature sensor values as well as temperature sensor status if available','',NULL,0,0,2,1,'{14615}<{$TEMP_CRIT:\"\"}-3',0,'',0),(14377,'{14616}<{$TEMP_CRIT_LOW:\"\"}','Temperature is too low: <{$TEMP_CRIT_LOW:\"\"}','',0,0,3,0,'Last value: {ITEM.LASTVALUE1}.','',NULL,0,0,2,1,'{14617}>{$TEMP_CRIT_LOW:\"\"}+3',0,'',0),(14380,'{14620}>{$TEMP_WARN:\"\"}','{#SENSOR_DESCR}: Temperature is above warning threshold: >{$TEMP_WARN:\"\"}','',0,0,2,0,'Last value: {ITEM.LASTVALUE1}.\r\nThis trigger uses temperature sensor values as well as temperature sensor status if available','',NULL,0,0,2,1,'{14621}<{$TEMP_WARN:\"\"}-3',0,'',0),(14381,'{14622}>{$TEMP_CRIT:\"\"}','{#SENSOR_DESCR}: Temperature is above critical threshold: >{$TEMP_CRIT:\"\"}','',0,0,4,0,'Last value: {ITEM.LASTVALUE1}.\r\nThis trigger uses temperature sensor values as well as temperature sensor status if available','',NULL,0,0,2,1,'{14623}<{$TEMP_CRIT:\"\"}-3',0,'',0),(14382,'{14624}<{$TEMP_CRIT_LOW:\"\"}','{#SENSOR_DESCR}: Temperature is too low: <{$TEMP_CRIT_LOW:\"\"}','',0,0,3,0,'Last value: {ITEM.LASTVALUE1}.','',NULL,0,0,2,1,'{14625}>{$TEMP_CRIT_LOW:\"\"}+3',0,'',0),(14383,'{14626}=1 and {14627}>0','Unit {#SNMPVALUE}: Device has been replaced (new serial number received)','',0,0,1,0,'Last value: {ITEM.LASTVALUE1}.\r\nDevice serial number has changed. Ack to close','',NULL,0,0,2,2,'',0,'',1),(14389,'{14641}=0','Unavailable by ICMP ping','',0,0,4,0,'Last value: {ITEM.LASTVALUE1}.\r\nLast three attempts returned timeout.  Please check device connectivity.','',14293,0,0,0,0,'',0,'',0),(14390,'{14642}>{$ICMP_LOSS_WARN} and {14642}<100','High ICMP ping loss','',0,0,2,0,'','',14294,0,0,0,0,'',0,'',0),(14391,'{14643}>{$ICMP_RESPONSE_TIME_WARN}','High ICMP ping response time','',0,0,2,0,'','',14295,0,0,0,0,'',0,'',0),(14392,'{14644}<10m','{HOST.NAME} has been restarted','',0,0,2,0,'Last value: {ITEM.LASTVALUE1}.\r\nThe device uptime is less than 10 minutes','',14296,0,0,0,0,'',0,'',1),(14403,'{14663}=0','Unavailable by ICMP ping','',0,0,4,0,'Last value: {ITEM.LASTVALUE1}.\r\nLast three attempts returned timeout.  Please check device connectivity.','',14293,0,0,0,0,'',0,'',0),(14404,'{14664}>{$ICMP_LOSS_WARN} and {14664}<100','High ICMP ping loss','',0,0,2,0,'','',14294,0,0,0,0,'',0,'',0),(14405,'{14665}>{$ICMP_RESPONSE_TIME_WARN}','High ICMP ping response time','',0,0,2,0,'','',14295,0,0,0,0,'',0,'',0),(14406,'{14666}<10m','{HOST.NAME} has been restarted','',0,0,2,0,'Last value: {ITEM.LASTVALUE1}.\r\nThe device uptime is less than 10 minutes','',14296,0,0,0,0,'',0,'',1),(14408,'{14668}>{$CPU_UTIL_MAX}','High CPU utilization','',0,0,3,0,'Last value: {ITEM.LASTVALUE1}.','',NULL,0,0,0,0,'',0,'',0),(14409,'{14669}=1 and {14670}>0','Device has been replaced (new serial number received)','',0,0,1,0,'Last value: {ITEM.LASTVALUE1}.\r\nDevice serial number has changed. Ack to close','',NULL,0,0,0,2,'',0,'',1),(14410,'{14671}>{$CPU_UTIL_MAX}','High CPU utilization','',0,0,3,0,'Last value: {ITEM.LASTVALUE1}.','',14408,0,0,0,0,'',0,'',0),(14411,'{14672}=1 and {14673}>0','Device has been replaced (new serial number received)','',0,0,1,0,'Last value: {ITEM.LASTVALUE1}.\r\nDevice serial number has changed. Ack to close','',14409,0,0,0,2,'',0,'',1),(14413,'{14676}=1 and {14677}>0','Device has been replaced (new serial number received)','',0,0,1,0,'Last value: {ITEM.LASTVALUE1}.\r\nDevice serial number has changed. Ack to close','',14409,0,0,0,2,'',0,'',1),(14414,'{14678}>{$MEMORY_UTIL_MAX}','{#SNMPVALUE}: High memory utilization','',0,0,3,0,'Last value: {ITEM.LASTVALUE1}.','',NULL,0,0,2,0,'',0,'',0),(14415,'{14679}>{$CPU_UTIL_MAX}','#{#SNMPINDEX}: High CPU utilization','',0,0,3,0,'Last value: {ITEM.LASTVALUE1}.','',NULL,0,0,2,0,'',0,'',0),(14417,'{14681}=1 and {14682}>0','{#ENT_NAME}: Device has been replaced (new serial number received)','',0,0,1,0,'Last value: {ITEM.LASTVALUE1}.\r\nDevice serial number has changed. Ack to close','',NULL,0,0,2,2,'',0,'',1),(14420,'{14689}<{$TEMP_CRIT_LOW:\"\"}','{#SNMPVALUE}: Temperature is too low: <{$TEMP_CRIT_LOW:\"\"}','',0,0,3,0,'Last value: {ITEM.LASTVALUE1}.','',NULL,0,0,2,1,'{14690}>{$TEMP_CRIT_LOW:\"\"}+3',0,'',0),(14423,'{14693}>{$MEMORY_UTIL_MAX}','{#SNMPVALUE}: High memory utilization','',0,0,3,0,'Last value: {ITEM.LASTVALUE1}.','',14414,0,0,2,0,'',0,'',0),(14425,'{14695}>{$MEMORY_UTIL_MAX}','{#SNMPVALUE}: High memory utilization','',0,0,3,0,'Last value: {ITEM.LASTVALUE1}.','',14414,0,0,2,0,'',0,'',0),(14426,'{14696}>{$CPU_UTIL_MAX}','#{#SNMPINDEX}: High CPU utilization','',0,0,3,0,'Last value: {ITEM.LASTVALUE1}.','',14415,0,0,2,0,'',0,'',0),(14428,'{14698}=1 and {14699}>0','{#ENT_NAME}: Device has been replaced (new serial number received)','',0,0,1,0,'Last value: {ITEM.LASTVALUE1}.\r\nDevice serial number has changed. Ack to close','',14417,0,0,2,2,'',0,'',1),(14430,'{14702}=1 and {14703}>0','{#ENT_NAME}: Device has been replaced (new serial number received)','',0,0,1,0,'Last value: {ITEM.LASTVALUE1}.\r\nDevice serial number has changed. Ack to close','',14417,0,0,2,2,'',0,'',1),(14437,'{14722}<{$TEMP_CRIT_LOW:\"\"}','{#SNMPVALUE}: Temperature is too low: <{$TEMP_CRIT_LOW:\"\"}','',0,0,3,0,'Last value: {ITEM.LASTVALUE1}.','',14420,0,0,2,1,'{14723}>{$TEMP_CRIT_LOW:\"\"}+3',0,'',0),(14439,'{14726}<{$TEMP_CRIT_LOW:\"\"}','{#SNMPVALUE}: Temperature is too low: <{$TEMP_CRIT_LOW:\"\"}','',0,0,3,0,'Last value: {ITEM.LASTVALUE1}.','',14420,0,0,2,1,'{14727}>{$TEMP_CRIT_LOW:\"\"}+3',0,'',0),(14451,'{14747}=0','Unavailable by ICMP ping','',0,0,4,0,'Last value: {ITEM.LASTVALUE1}.\r\nLast three attempts returned timeout.  Please check device connectivity.','',14293,0,0,0,0,'',0,'',0),(14452,'{14748}>{$ICMP_LOSS_WARN} and {14748}<100','High ICMP ping loss','',0,0,2,0,'','',14294,0,0,0,0,'',0,'',0),(14453,'{14749}>{$ICMP_RESPONSE_TIME_WARN}','High ICMP ping response time','',0,0,2,0,'','',14295,0,0,0,0,'',0,'',0),(14454,'{14750}<10m','{HOST.NAME} has been restarted','',0,0,2,0,'Last value: {ITEM.LASTVALUE1}.\r\nThe device uptime is less than 10 minutes','',14296,0,0,0,0,'',0,'',1),(14456,'{14752}>{$CPU_UTIL_MAX}','#{#SNMPINDEX}: High CPU utilization','',0,0,3,0,'Last value: {ITEM.LASTVALUE1}.','',NULL,0,0,2,0,'',0,'',0),(14457,'{14753}>{$MEMORY_UTIL_MAX}','#{#SNMPINDEX}: High memory utilization','',0,0,3,0,'Last value: {ITEM.LASTVALUE1}.','',NULL,0,0,2,0,'',0,'',0),(14460,'{14756}>{$TEMP_WARN:\"\"}','Device {#SNMPVALUE}: Temperature is above warning threshold: >{$TEMP_WARN:\"\"}','',0,0,2,0,'Last value: {ITEM.LASTVALUE1}.\r\nThis trigger uses temperature sensor values as well as temperature sensor status if available','',NULL,0,0,2,1,'{14757}<{$TEMP_WARN:\"\"}-3',0,'',0),(14461,'{14758}>{$TEMP_CRIT:\"\"}','Device {#SNMPVALUE}: Temperature is above critical threshold: >{$TEMP_CRIT:\"\"}','',0,0,4,0,'Last value: {ITEM.LASTVALUE1}.\r\nThis trigger uses temperature sensor values as well as temperature sensor status if available','',NULL,0,0,2,1,'{14759}<{$TEMP_CRIT:\"\"}-3',0,'',0),(14462,'{14760}<{$TEMP_CRIT_LOW:\"\"}','Device {#SNMPVALUE}: Temperature is too low: <{$TEMP_CRIT_LOW:\"\"}','',0,0,3,0,'Last value: {ITEM.LASTVALUE1}.','',NULL,0,0,2,1,'{14761}>{$TEMP_CRIT_LOW:\"\"}+3',0,'',0),(14463,'{14762}=1 and {14763}>0','#{#SNMPVALUE}: Device has been replaced (new serial number received)','',0,0,1,0,'Last value: {ITEM.LASTVALUE1}.\r\nDevice serial number has changed. Ack to close','',NULL,0,0,2,2,'',0,'',1),(14468,'{14776}=0','Unavailable by ICMP ping','',0,0,4,0,'Last value: {ITEM.LASTVALUE1}.\r\nLast three attempts returned timeout.  Please check device connectivity.','',14293,0,0,0,0,'',0,'',0),(14469,'{14777}>{$ICMP_LOSS_WARN} and {14777}<100','High ICMP ping loss','',0,0,2,0,'','',14294,0,0,0,0,'',0,'',0),(14470,'{14778}>{$ICMP_RESPONSE_TIME_WARN}','High ICMP ping response time','',0,0,2,0,'','',14295,0,0,0,0,'',0,'',0),(14471,'{14779}<10m','{HOST.NAME} has been restarted','',0,0,2,0,'Last value: {ITEM.LASTVALUE1}.\r\nThe device uptime is less than 10 minutes','',14296,0,0,0,0,'',0,'',1),(14473,'{14781}>{$CPU_UTIL_MAX}','High CPU utilization','',0,0,3,0,'Last value: {ITEM.LASTVALUE1}.','',NULL,0,0,0,0,'',0,'',0),(14474,'{14782}=1 and {14783}>0','Firmware has changed','',0,0,1,0,'Last value: {ITEM.LASTVALUE1}.\r\nFirmware version has changed. Ack to close','',NULL,0,0,0,2,'',0,'',1),(14475,'{14784}>{$MEMORY_UTIL_MAX}','High memory utilization','',0,0,3,0,'Last value: {ITEM.LASTVALUE1}.','',NULL,0,0,2,0,'',0,'',0),(14476,'{14785}>{$TEMP_WARN:\"\"}','{#SNMPVALUE}: Temperature is above warning threshold: >{$TEMP_WARN:\"\"}','',0,0,2,0,'Last value: {ITEM.LASTVALUE1}.\r\nThis trigger uses temperature sensor values as well as temperature sensor status if available','',NULL,0,0,2,1,'{14786}<{$TEMP_WARN:\"\"}-3',0,'',0),(14477,'{14787}>{$TEMP_CRIT:\"\"}','{#SNMPVALUE}: Temperature is above critical threshold: >{$TEMP_CRIT:\"\"}','',0,0,4,0,'Last value: {ITEM.LASTVALUE1}.\r\nThis trigger uses temperature sensor values as well as temperature sensor status if available','',NULL,0,0,2,1,'{14788}<{$TEMP_CRIT:\"\"}-3',0,'',0),(14478,'{14789}<{$TEMP_CRIT_LOW:\"\"}','{#SNMPVALUE}: Temperature is too low: <{$TEMP_CRIT_LOW:\"\"}','',0,0,3,0,'Last value: {ITEM.LASTVALUE1}.','',NULL,0,0,2,1,'{14790}>{$TEMP_CRIT_LOW:\"\"}+3',0,'',0),(14486,'{14806}=0','Unavailable by ICMP ping','',0,0,4,0,'Last value: {ITEM.LASTVALUE1}.\r\nLast three attempts returned timeout.  Please check device connectivity.','',14293,0,0,0,0,'',0,'',0),(14487,'{14807}>{$ICMP_LOSS_WARN} and {14807}<100','High ICMP ping loss','',0,0,2,0,'','',14294,0,0,0,0,'',0,'',0),(14488,'{14808}>{$ICMP_RESPONSE_TIME_WARN}','High ICMP ping response time','',0,0,2,0,'','',14295,0,0,0,0,'',0,'',0),(14489,'{14809}<10m','{HOST.NAME} has been restarted','',0,0,2,0,'Last value: {ITEM.LASTVALUE1}.\r\nThe device uptime is less than 10 minutes','',14296,0,0,0,0,'',0,'',1),(14491,'{14811}>{$CPU_UTIL_MAX}','High CPU utilization','',0,0,3,0,'Last value: {ITEM.LASTVALUE1}.','',NULL,0,0,0,0,'',0,'',0),(14492,'{14812}=1 and {14813}>0','Device has been replaced (new serial number received)','',0,0,1,0,'Last value: {ITEM.LASTVALUE1}.\r\nDevice serial number has changed. Ack to close','',NULL,0,0,0,2,'',0,'',1),(14493,'{14814}=1 and {14815}>0','Firmware has changed','',0,0,1,0,'Last value: {ITEM.LASTVALUE1}.\r\nFirmware version has changed. Ack to close','',NULL,0,0,0,2,'',0,'',1),(14494,'{14816}>{$MEMORY_UTIL_MAX}','#{#SNMPVALUE}: High memory utilization','',0,0,3,0,'Last value: {ITEM.LASTVALUE1}.','',NULL,0,0,2,0,'',0,'',0),(14495,'{14817}>{$TEMP_WARN:\"\"}','#{#SNMPVALUE}: Temperature is above warning threshold: >{$TEMP_WARN:\"\"}','',0,0,2,0,'Last value: {ITEM.LASTVALUE1}.\r\nThis trigger uses temperature sensor values as well as temperature sensor status if available','',NULL,0,0,2,1,'{14818}<{$TEMP_WARN:\"\"}-3',0,'',0),(14496,'{14819}>{$TEMP_CRIT:\"\"}','#{#SNMPVALUE}: Temperature is above critical threshold: >{$TEMP_CRIT:\"\"}','',0,0,4,0,'Last value: {ITEM.LASTVALUE1}.\r\nThis trigger uses temperature sensor values as well as temperature sensor status if available','',NULL,0,0,2,1,'{14820}<{$TEMP_CRIT:\"\"}-3',0,'',0),(14497,'{14821}<{$TEMP_CRIT_LOW:\"\"}','#{#SNMPVALUE}: Temperature is too low: <{$TEMP_CRIT_LOW:\"\"}','',0,0,3,0,'Last value: {ITEM.LASTVALUE1}.','',NULL,0,0,2,1,'{14822}>{$TEMP_CRIT_LOW:\"\"}+3',0,'',0),(14505,'{14838}=0','Unavailable by ICMP ping','',0,0,4,0,'Last value: {ITEM.LASTVALUE1}.\r\nLast three attempts returned timeout.  Please check device connectivity.','',14293,0,0,0,0,'',0,'',0),(14506,'{14839}>{$ICMP_LOSS_WARN} and {14839}<100','High ICMP ping loss','',0,0,2,0,'','',14294,0,0,0,0,'',0,'',0),(14507,'{14840}>{$ICMP_RESPONSE_TIME_WARN}','High ICMP ping response time','',0,0,2,0,'','',14295,0,0,0,0,'',0,'',0),(14508,'{14841}<10m','{HOST.NAME} has been restarted','',0,0,2,0,'Last value: {ITEM.LASTVALUE1}.\r\nThe device uptime is less than 10 minutes','',14296,0,0,0,0,'',0,'',1),(14510,'{14843}>{$CPU_UTIL_MAX}','High CPU utilization','',0,0,3,0,'Last value: {ITEM.LASTVALUE1}.','',NULL,0,0,0,0,'',0,'',0),(14511,'{14844}>{$TEMP_WARN:\"\"}','Device: Temperature is above warning threshold: >{$TEMP_WARN:\"\"}','',0,0,2,0,'Last value: {ITEM.LASTVALUE1}.\r\nThis trigger uses temperature sensor values as well as temperature sensor status if available','',NULL,0,0,0,1,'{14845}<{$TEMP_WARN:\"\"}-3',0,'',0),(14513,'{14849}<{$TEMP_CRIT_LOW:\"\"}','Device: Temperature is too low: <{$TEMP_CRIT_LOW:\"\"}','',0,0,3,0,'Last value: {ITEM.LASTVALUE1}.','',NULL,0,0,0,1,'{14850}>{$TEMP_CRIT_LOW:\"\"}+3',0,'',0),(14514,'{14851}=1 and {14852}>0','Device has been replaced (new serial number received)','',0,0,1,0,'Last value: {ITEM.LASTVALUE1}.\r\nDevice serial number has changed. Ack to close','',NULL,0,0,0,2,'',0,'',1),(14515,'{14853}=1 and {14854}>0','Firmware has changed','',0,0,1,0,'Last value: {ITEM.LASTVALUE1}.\r\nFirmware version has changed. Ack to close','',NULL,0,0,0,2,'',0,'',1),(14516,'{14855}>{$MEMORY_UTIL_MAX}','#{#SNMPVALUE}: High memory utilization','',0,0,3,0,'Last value: {ITEM.LASTVALUE1}.','',NULL,0,0,2,0,'',0,'',0),(14524,'{14871}=0','Unavailable by ICMP ping','',0,0,4,0,'Last value: {ITEM.LASTVALUE1}.\r\nLast three attempts returned timeout.  Please check device connectivity.','',14288,0,0,0,0,'',0,'',0),(14525,'{14872}>{$ICMP_LOSS_WARN} and {14872}<100','High ICMP ping loss','',0,0,2,0,'','',14289,0,0,0,0,'',0,'',0),(14526,'{14873}>{$ICMP_RESPONSE_TIME_WARN}','High ICMP ping response time','',0,0,2,0,'','',14290,0,0,0,0,'',0,'',0),(14527,'{14874}<10m','{HOST.NAME} has been restarted','',0,0,2,0,'Last value: {ITEM.LASTVALUE1}.\r\nThe device uptime is less than 10 minutes','',14291,0,0,0,0,'',0,'',1),(14534,'{14889}=0','Unavailable by ICMP ping','',0,0,4,0,'Last value: {ITEM.LASTVALUE1}.\r\nLast three attempts returned timeout.  Please check device connectivity.','',14293,0,0,0,0,'',0,'',0),(14535,'{14890}>{$ICMP_LOSS_WARN} and {14890}<100','High ICMP ping loss','',0,0,2,0,'','',14294,0,0,0,0,'',0,'',0),(14536,'{14891}>{$ICMP_RESPONSE_TIME_WARN}','High ICMP ping response time','',0,0,2,0,'','',14295,0,0,0,0,'',0,'',0),(14537,'{14892}<10m','{HOST.NAME} has been restarted','',0,0,2,0,'Last value: {ITEM.LASTVALUE1}.\r\nThe device uptime is less than 10 minutes','',14296,0,0,0,0,'',0,'',1),(14544,'{14907}=0','Unavailable by ICMP ping','',0,0,4,0,'Last value: {ITEM.LASTVALUE1}.\r\nLast three attempts returned timeout.  Please check device connectivity.','',14293,0,0,0,0,'',0,'',0),(14545,'{14908}>{$ICMP_LOSS_WARN} and {14908}<100','High ICMP ping loss','',0,0,2,0,'','',14294,0,0,0,0,'',0,'',0),(14546,'{14909}>{$ICMP_RESPONSE_TIME_WARN}','High ICMP ping response time','',0,0,2,0,'','',14295,0,0,0,0,'',0,'',0),(14547,'{14910}<10m','{HOST.NAME} has been restarted','',0,0,2,0,'Last value: {ITEM.LASTVALUE1}.\r\nThe device uptime is less than 10 minutes','',14296,0,0,0,0,'',0,'',1),(14549,'{14912}>{$CPU_UTIL_MAX}','{#MODULE_NAME}: High CPU utilization','',0,0,3,0,'Last value: {ITEM.LASTVALUE1}.','',NULL,0,0,2,0,'',0,'',0),(14550,'{14913}>{$MEMORY_UTIL_MAX}','{#MODULE_NAME}: High memory utilization','',0,0,3,0,'Last value: {ITEM.LASTVALUE1}.','',NULL,0,0,2,0,'',0,'',0),(14551,'{14914}>{$TEMP_WARN:\"\"}','{#SNMPVALUE}: Temperature is above warning threshold: >{$TEMP_WARN:\"\"}','',0,0,2,0,'Last value: {ITEM.LASTVALUE1}.\r\nThis trigger uses temperature sensor values as well as temperature sensor status if available','',NULL,0,0,2,1,'{14915}<{$TEMP_WARN:\"\"}-3',0,'',0),(14552,'{14916}>{$TEMP_CRIT:\"\"}','{#SNMPVALUE}: Temperature is above critical threshold: >{$TEMP_CRIT:\"\"}','',0,0,4,0,'Last value: {ITEM.LASTVALUE1}.\r\nThis trigger uses temperature sensor values as well as temperature sensor status if available','',NULL,0,0,2,1,'{14917}<{$TEMP_CRIT:\"\"}-3',0,'',0),(14553,'{14918}<{$TEMP_CRIT_LOW:\"\"}','{#SNMPVALUE}: Temperature is too low: <{$TEMP_CRIT_LOW:\"\"}','',0,0,3,0,'Last value: {ITEM.LASTVALUE1}.','',NULL,0,0,2,1,'{14919}>{$TEMP_CRIT_LOW:\"\"}+3',0,'',0),(14556,'{14922}=1 and {14923}>0','{#ENT_NAME}: Device has been replaced (new serial number received)','',0,0,1,0,'Last value: {ITEM.LASTVALUE1}.\r\nDevice serial number has changed. Ack to close','',NULL,0,0,2,2,'',0,'',1),(14557,'{14924}=1 and {14925}>0','{#ENT_NAME}: Firmware has changed','',0,0,1,0,'Last value: {ITEM.LASTVALUE1}.\r\nFirmware version has changed. Ack to close','',NULL,0,0,2,2,'',0,'',1),(14582,'{14972}=0','Unavailable by ICMP ping','',0,0,4,0,'Last value: {ITEM.LASTVALUE1}.\r\nLast three attempts returned timeout.  Please check device connectivity.','',14293,0,0,0,0,'',0,'',0),(14583,'{14973}>{$ICMP_LOSS_WARN} and {14973}<100','High ICMP ping loss','',0,0,2,0,'','',14294,0,0,0,0,'',0,'',0),(14584,'{14974}>{$ICMP_RESPONSE_TIME_WARN}','High ICMP ping response time','',0,0,2,0,'','',14295,0,0,0,0,'',0,'',0),(14585,'{14975}<10m','{HOST.NAME} has been restarted','',0,0,2,0,'Last value: {ITEM.LASTVALUE1}.\r\nThe device uptime is less than 10 minutes','',14296,0,0,0,0,'',0,'',1),(14587,'{14977}>{$CPU_UTIL_MAX}','{#ENT_NAME}: High CPU utilization','',0,0,3,0,'Last value: {ITEM.LASTVALUE1}.','',NULL,0,0,2,0,'',0,'',0),(14588,'{14978}>{$MEMORY_UTIL_MAX}','{#ENT_NAME}: High memory utilization','',0,0,3,0,'Last value: {ITEM.LASTVALUE1}.','',NULL,0,0,2,0,'',0,'',0),(14589,'{14979}>{$TEMP_WARN:\"\"}','{#ENT_NAME}: Temperature is above warning threshold: >{$TEMP_WARN:\"\"}','',0,0,2,0,'Last value: {ITEM.LASTVALUE1}.\r\nThis trigger uses temperature sensor values as well as temperature sensor status if available','',NULL,0,0,2,1,'{14980}<{$TEMP_WARN:\"\"}-3',0,'',0),(14590,'{14981}>{$TEMP_CRIT:\"\"}','{#ENT_NAME}: Temperature is above critical threshold: >{$TEMP_CRIT:\"\"}','',0,0,4,0,'Last value: {ITEM.LASTVALUE1}.\r\nThis trigger uses temperature sensor values as well as temperature sensor status if available','',NULL,0,0,2,1,'{14982}<{$TEMP_CRIT:\"\"}-3',0,'',0),(14591,'{14983}<{$TEMP_CRIT_LOW:\"\"}','{#ENT_NAME}: Temperature is too low: <{$TEMP_CRIT_LOW:\"\"}','',0,0,3,0,'Last value: {ITEM.LASTVALUE1}.','',NULL,0,0,2,1,'{14984}>{$TEMP_CRIT_LOW:\"\"}+3',0,'',0),(14592,'{14985}=1 and {14986}>0','{#ENT_NAME}: Device has been replaced (new serial number received)','',0,0,1,0,'Last value: {ITEM.LASTVALUE1}.\r\nDevice serial number has changed. Ack to close','',NULL,0,0,2,2,'',0,'',1),(14598,'{15000}=0','Unavailable by ICMP ping','',0,0,4,0,'Last value: {ITEM.LASTVALUE1}.\r\nLast three attempts returned timeout.  Please check device connectivity.','',14293,0,0,0,0,'',0,'',0),(14599,'{15001}>{$ICMP_LOSS_WARN} and {15001}<100','High ICMP ping loss','',0,0,2,0,'','',14294,0,0,0,0,'',0,'',0),(14600,'{15002}>{$ICMP_RESPONSE_TIME_WARN}','High ICMP ping response time','',0,0,2,0,'','',14295,0,0,0,0,'',0,'',0),(14601,'{15003}<10m','{HOST.NAME} has been restarted','',0,0,2,0,'Last value: {ITEM.LASTVALUE1}.\r\nThe device uptime is less than 10 minutes','',14296,0,0,0,0,'',0,'',1),(14603,'{15005}=1 and {15006}>0','Firmware has changed','',0,0,1,0,'Last value: {ITEM.LASTVALUE1}.\r\nFirmware version has changed. Ack to close','',NULL,0,0,0,2,'',0,'',1),(14606,'{15013}<{$TEMP_CRIT_LOW:\"\"}','{#SENSOR_INFO}: Temperature is too low: <{$TEMP_CRIT_LOW:\"\"}','',0,0,3,0,'Last value: {ITEM.LASTVALUE1}.','',NULL,0,0,2,1,'{15014}>{$TEMP_CRIT_LOW:\"\"}+3',0,'',0),(14607,'{15015}=1 and {15016}>0','{#ENT_NAME}: Device has been replaced (new serial number received)','',0,0,1,0,'Last value: {ITEM.LASTVALUE1}.\r\nDevice serial number has changed. Ack to close','',NULL,0,0,2,2,'',0,'',1),(14615,'{15032}=0','Unavailable by ICMP ping','',0,0,4,0,'Last value: {ITEM.LASTVALUE1}.\r\nLast three attempts returned timeout.  Please check device connectivity.','',14293,0,0,0,0,'',0,'',0),(14616,'{15033}>{$ICMP_LOSS_WARN} and {15033}<100','High ICMP ping loss','',0,0,2,0,'','',14294,0,0,0,0,'',0,'',0),(14617,'{15034}>{$ICMP_RESPONSE_TIME_WARN}','High ICMP ping response time','',0,0,2,0,'','',14295,0,0,0,0,'',0,'',0),(14618,'{15035}<10m','{HOST.NAME} has been restarted','',0,0,2,0,'Last value: {ITEM.LASTVALUE1}.\r\nThe device uptime is less than 10 minutes','',14296,0,0,0,0,'',0,'',1),(14620,'{15037}={$HEALTH_CRIT_STATUS}','System status is in critical state','',0,0,4,0,'Last value: {ITEM.LASTVALUE1}.\r\nPlease check the device for errors','',NULL,0,0,0,0,'',0,'',0),(14621,'{15038}=1 and {15039}>0','Device has been replaced (new serial number received)','',0,0,1,0,'Last value: {ITEM.LASTVALUE1}.\r\nDevice serial number has changed. Ack to close','',NULL,0,0,0,2,'',0,'',1),(14622,'{15040}>{$CPU_UTIL_MAX}','{#SNMPVALUE}: High CPU utilization','',0,0,3,0,'Last value: {ITEM.LASTVALUE1}.','',NULL,0,0,2,0,'',0,'',0),(14623,'{15041}>{$MEMORY_UTIL_MAX}','{#SNMPVALUE}: High memory utilization','',0,0,3,0,'Last value: {ITEM.LASTVALUE1}.','',NULL,0,0,2,0,'',0,'',0),(14624,'{15042}>{$TEMP_WARN:\"\"}','{#SENSOR_INFO}: Temperature is above warning threshold: >{$TEMP_WARN:\"\"}','',0,0,2,0,'Last value: {ITEM.LASTVALUE1}.\r\nThis trigger uses temperature sensor values as well as temperature sensor status if available','',NULL,0,0,2,1,'{15043}<{$TEMP_WARN:\"\"}-3',0,'',0),(14625,'{15044}>{$TEMP_CRIT:\"\"}','{#SENSOR_INFO}: Temperature is above critical threshold: >{$TEMP_CRIT:\"\"}','',0,0,4,0,'Last value: {ITEM.LASTVALUE1}.\r\nThis trigger uses temperature sensor values as well as temperature sensor status if available','',NULL,0,0,2,1,'{15045}<{$TEMP_CRIT:\"\"}-3',0,'',0),(14626,'{15046}<{$TEMP_CRIT_LOW:\"\"}','{#SENSOR_INFO}: Temperature is too low: <{$TEMP_CRIT_LOW:\"\"}','',0,0,3,0,'Last value: {ITEM.LASTVALUE1}.','',NULL,0,0,2,1,'{15047}>{$TEMP_CRIT_LOW:\"\"}+3',0,'',0),(14652,'{15094}=0','Unavailable by ICMP ping','',0,0,4,0,'Last value: {ITEM.LASTVALUE1}.\r\nLast three attempts returned timeout.  Please check device connectivity.','',14293,0,0,0,0,'',0,'',0),(14653,'{15095}>{$ICMP_LOSS_WARN} and {15095}<100','High ICMP ping loss','',0,0,2,0,'','',14294,0,0,0,0,'',0,'',0),(14654,'{15096}>{$ICMP_RESPONSE_TIME_WARN}','High ICMP ping response time','',0,0,2,0,'','',14295,0,0,0,0,'',0,'',0),(14655,'{15097}<10m','{HOST.NAME} has been restarted','',0,0,2,0,'Last value: {ITEM.LASTVALUE1}.\r\nThe device uptime is less than 10 minutes','',14296,0,0,0,0,'',0,'',1),(14657,'{15099}>{$MEMORY_UTIL_MAX}','High memory utilization','',0,0,3,0,'Last value: {ITEM.LASTVALUE1}.','',NULL,0,0,0,0,'',0,'',0),(14658,'{15100}>{$TEMP_WARN:\"Device\"}','Device: Temperature is above warning threshold: >{$TEMP_WARN:\"Device\"}','',0,0,2,0,'Last value: {ITEM.LASTVALUE1}.\r\nThis trigger uses temperature sensor values as well as temperature sensor status if available','',NULL,0,0,0,1,'{15101}<{$TEMP_WARN:\"Device\"}-3',0,'',0),(14659,'{15102}>{$TEMP_CRIT:\"Device\"}','Device: Temperature is above critical threshold: >{$TEMP_CRIT:\"Device\"}','',0,0,4,0,'Last value: {ITEM.LASTVALUE1}.\r\nThis trigger uses temperature sensor values as well as temperature sensor status if available','',NULL,0,0,0,1,'{15103}<{$TEMP_CRIT:\"Device\"}-3',0,'',0),(14660,'{15104}<{$TEMP_CRIT_LOW:\"Device\"}','Device: Temperature is too low: <{$TEMP_CRIT_LOW:\"Device\"}','',0,0,3,0,'Last value: {ITEM.LASTVALUE1}.','',NULL,0,0,0,1,'{15105}>{$TEMP_CRIT_LOW:\"Device\"}+3',0,'',0),(14661,'{15106}=1 and {15107}>0','Device has been replaced (new serial number received)','',0,0,1,0,'Last value: {ITEM.LASTVALUE1}.\r\nDevice serial number has changed. Ack to close','',NULL,0,0,0,2,'',0,'',1),(14662,'{15108}=1 and {15109}>0','Firmware has changed','',0,0,1,0,'Last value: {ITEM.LASTVALUE1}.\r\nFirmware version has changed. Ack to close','',NULL,0,0,0,2,'',0,'',1),(14663,'{15110}>{$CPU_UTIL_MAX}','#{#SNMPINDEX}: High CPU utilization','',0,0,3,0,'Last value: {ITEM.LASTVALUE1}.','',NULL,0,0,2,0,'',0,'',0),(14664,'{15111}>{$TEMP_WARN:\"CPU\"}','CPU: Temperature is above warning threshold: >{$TEMP_WARN:\"CPU\"}','',0,0,2,0,'Last value: {ITEM.LASTVALUE1}.\r\nThis trigger uses temperature sensor values as well as temperature sensor status if available','',NULL,0,0,2,1,'{15112}<{$TEMP_WARN:\"CPU\"}-3',0,'',0),(14665,'{15113}>{$TEMP_CRIT:\"CPU\"}','CPU: Temperature is above critical threshold: >{$TEMP_CRIT:\"CPU\"}','',0,0,4,0,'Last value: {ITEM.LASTVALUE1}.\r\nThis trigger uses temperature sensor values as well as temperature sensor status if available','',NULL,0,0,2,1,'{15114}<{$TEMP_CRIT:\"CPU\"}-3',0,'',0),(14666,'{15115}<{$TEMP_CRIT_LOW:\"CPU\"}','CPU: Temperature is too low: <{$TEMP_CRIT_LOW:\"CPU\"}','',0,0,3,0,'Last value: {ITEM.LASTVALUE1}.','',NULL,0,0,2,1,'{15116}>{$TEMP_CRIT_LOW:\"CPU\"}+3',0,'',0),(14667,'{15117}>{$STORAGE_UTIL_CRIT}','Disk-{#SNMPINDEX}: Disk space is critically low','',0,0,3,0,'Last value: {ITEM.LASTVALUE1}.','',NULL,0,0,2,0,'',0,'',0),(14668,'{15118}>{$STORAGE_UTIL_WARN}','Disk-{#SNMPINDEX}: Disk space is low','',0,0,2,0,'Last value: {ITEM.LASTVALUE1}.','',NULL,0,0,2,0,'',0,'',0),(14673,'{15131}=0','Unavailable by ICMP ping','',0,0,4,0,'Last value: {ITEM.LASTVALUE1}.\r\nLast three attempts returned timeout.  Please check device connectivity.','',14293,0,0,0,0,'',0,'',0),(14674,'{15132}>{$ICMP_LOSS_WARN} and {15132}<100','High ICMP ping loss','',0,0,2,0,'','',14294,0,0,0,0,'',0,'',0),(14675,'{15133}>{$ICMP_RESPONSE_TIME_WARN}','High ICMP ping response time','',0,0,2,0,'','',14295,0,0,0,0,'',0,'',0),(14676,'{15134}<10m','{HOST.NAME} has been restarted','',0,0,2,0,'Last value: {ITEM.LASTVALUE1}.\r\nThe device uptime is less than 10 minutes','',14296,0,0,0,0,'',0,'',1),(14678,'{15136}>{$CPU_UTIL_MAX}','High CPU utilization','',0,0,3,0,'Last value: {ITEM.LASTVALUE1}.','',NULL,0,0,0,0,'',0,'',0),(14679,'{15137}>{$MEMORY_UTIL_MAX}','High memory utilization','',0,0,3,0,'Last value: {ITEM.LASTVALUE1}.','',NULL,0,0,0,0,'',0,'',0),(14680,'{15138}=1 and {15139}>0','Device has been replaced (new serial number received)','',0,0,1,0,'Last value: {ITEM.LASTVALUE1}.\r\nDevice serial number has changed. Ack to close','',NULL,0,0,0,2,'',0,'',1),(14683,'{15146}<{$TEMP_CRIT_LOW:\"\"}','#{#SNMPVALUE}: Temperature is too low: <{$TEMP_CRIT_LOW:\"\"}','',0,0,3,0,'Last value: {ITEM.LASTVALUE1}.','',NULL,0,0,2,1,'{15147}>{$TEMP_CRIT_LOW:\"\"}+3',0,'',0),(14691,'{15163}=0','Unavailable by ICMP ping','',0,0,4,0,'Last value: {ITEM.LASTVALUE1}.\r\nLast three attempts returned timeout.  Please check device connectivity.','',14293,0,0,0,0,'',0,'',0),(14692,'{15164}>{$ICMP_LOSS_WARN} and {15164}<100','High ICMP ping loss','',0,0,2,0,'','',14294,0,0,0,0,'',0,'',0),(14693,'{15165}>{$ICMP_RESPONSE_TIME_WARN}','High ICMP ping response time','',0,0,2,0,'','',14295,0,0,0,0,'',0,'',0),(14694,'{15166}<10m','{HOST.NAME} has been restarted','',0,0,2,0,'Last value: {ITEM.LASTVALUE1}.\r\nThe device uptime is less than 10 minutes','',14296,0,0,0,0,'',0,'',1),(14696,'{15168}>{$CPU_UTIL_MAX}','High CPU utilization','',0,0,3,0,'Last value: {ITEM.LASTVALUE1}.','',NULL,0,0,0,0,'',0,'',0),(14697,'{15169}>{$MEMORY_UTIL_MAX}','High memory utilization','',0,0,3,0,'Last value: {ITEM.LASTVALUE1}.','',NULL,0,0,0,0,'',0,'',0),(14698,'{15170}=1 and {15171}>0','Device has been replaced (new serial number received)','',0,0,1,0,'Last value: {ITEM.LASTVALUE1}.\r\nDevice serial number has changed. Ack to close','',NULL,0,0,0,2,'',0,'',1),(14699,'{15172}=1 and {15173}>0','Firmware has changed','',0,0,1,0,'Last value: {ITEM.LASTVALUE1}.\r\nFirmware version has changed. Ack to close','',NULL,0,0,0,2,'',0,'',1),(14704,'{15186}=0','Unavailable by ICMP ping','',0,0,4,0,'Last value: {ITEM.LASTVALUE1}.\r\nLast three attempts returned timeout.  Please check device connectivity.','',14293,0,0,0,0,'',0,'',0),(14705,'{15187}>{$ICMP_LOSS_WARN} and {15187}<100','High ICMP ping loss','',0,0,2,0,'','',14294,0,0,0,0,'',0,'',0),(14706,'{15188}>{$ICMP_RESPONSE_TIME_WARN}','High ICMP ping response time','',0,0,2,0,'','',14295,0,0,0,0,'',0,'',0),(14707,'{15189}<10m','{HOST.NAME} has been restarted','',0,0,2,0,'Last value: {ITEM.LASTVALUE1}.\r\nThe device uptime is less than 10 minutes','',14296,0,0,0,0,'',0,'',1),(14709,'{15191}=1 and {15192}>0','Device has been replaced (new serial number received)','',0,0,1,0,'Last value: {ITEM.LASTVALUE1}.\r\nDevice serial number has changed. Ack to close','',NULL,0,0,0,2,'',0,'',1),(14710,'{15193}=1 and {15194}>0','Firmware has changed','',0,0,1,0,'Last value: {ITEM.LASTVALUE1}.\r\nFirmware version has changed. Ack to close','',NULL,0,0,0,2,'',0,'',1),(14711,'{15195}>{$CPU_UTIL_MAX}','#{#SNMPVALUE}: High CPU utilization','',0,0,3,0,'Last value: {ITEM.LASTVALUE1}.','',NULL,0,0,2,0,'',0,'',0),(14712,'{15196}>{$MEMORY_UTIL_MAX}','#{#SNMPVALUE}: High memory utilization','',0,0,3,0,'Last value: {ITEM.LASTVALUE1}.','',NULL,0,0,2,0,'',0,'',0),(14717,'{15209}=0','Unavailable by ICMP ping','',0,0,4,0,'Last value: {ITEM.LASTVALUE1}.\r\nLast three attempts returned timeout.  Please check device connectivity.','',14288,0,0,0,0,'',0,'',0),(14718,'{15210}>{$ICMP_LOSS_WARN} and {15210}<100','High ICMP ping loss','',0,0,2,0,'','',14289,0,0,0,0,'',0,'',0),(14719,'{15211}>{$ICMP_RESPONSE_TIME_WARN}','High ICMP ping response time','',0,0,2,0,'','',14290,0,0,0,0,'',0,'',0),(14720,'{15212}<10m','{HOST.NAME} has been restarted','',0,0,2,0,'Last value: {ITEM.LASTVALUE1}.\r\nThe device uptime is less than 10 minutes','',14291,0,0,0,0,'',0,'',1),(14722,'{15214}>{$CPU_UTIL_MAX}','High CPU utilization','',0,0,3,0,'Last value: {ITEM.LASTVALUE1}.','',NULL,0,0,0,0,'',0,'',0),(14723,'{15215}>{$MEMORY_UTIL_MAX}','High memory utilization','',0,0,3,0,'Last value: {ITEM.LASTVALUE1}.','',NULL,0,0,0,0,'',0,'',0),(14724,'{15216}=1 and {15217}>0','Firmware has changed','',0,0,1,0,'Last value: {ITEM.LASTVALUE1}.\r\nFirmware version has changed. Ack to close','',NULL,0,0,0,2,'',0,'',1),(14860,'{15580}>{$CPU_UTIL_MAX}','#{#SNMPINDEX}: High CPU utilization','',0,0,3,0,'Last value: {ITEM.LASTVALUE1}.','',14247,0,0,2,0,'',0,'',0),(14861,'{15581}>{$STORAGE_UTIL_CRIT}','{#SNMPVALUE}: Disk space is critically low','',0,0,3,0,'Last value: {ITEM.LASTVALUE1}.','',14249,0,0,2,0,'',0,'',0),(14862,'{15582}>{$STORAGE_UTIL_WARN}','{#SNMPVALUE}: Disk space is low','',0,0,2,0,'Last value: {ITEM.LASTVALUE1}.','',14250,0,0,2,0,'',0,'',0),(14869,'{15597}=0','Unavailable by ICMP ping','',0,0,4,0,'Last value: {ITEM.LASTVALUE1}.\r\nLast three attempts returned timeout.  Please check device connectivity.','',14293,0,0,0,0,'',0,'',0),(14870,'{15598}>{$ICMP_LOSS_WARN} and {15598}<100','High ICMP ping loss','',0,0,2,0,'','',14294,0,0,0,0,'',0,'',0),(14871,'{15599}>{$ICMP_RESPONSE_TIME_WARN}','High ICMP ping response time','',0,0,2,0,'','',14295,0,0,0,0,'',0,'',0),(14872,'{15600}<10m','{HOST.NAME} has been restarted','',0,0,2,0,'Last value: {ITEM.LASTVALUE1}.\r\nThe device uptime is less than 10 minutes','',14296,0,0,0,0,'',0,'',1),(14874,'{15602}>{$CPU_UTIL_MAX}','#{#SNMPINDEX}: High CPU utilization','',0,0,3,0,'Last value: {ITEM.LASTVALUE1}.','',14247,0,0,2,0,'',0,'',0),(14875,'{15603}>{$STORAGE_UTIL_CRIT}','{#SNMPVALUE}: Disk space is critically low','',0,0,3,0,'Last value: {ITEM.LASTVALUE1}.','',14249,0,0,2,0,'',0,'',0),(14876,'{15604}>{$STORAGE_UTIL_WARN}','{#SNMPVALUE}: Disk space is low','',0,0,2,0,'Last value: {ITEM.LASTVALUE1}.','',14250,0,0,2,0,'',0,'',0),(14882,'{15618}=0','Unavailable by ICMP ping','',0,0,4,0,'Last value: {ITEM.LASTVALUE1}.\r\nLast three attempts returned timeout.  Please check device connectivity.','',14293,0,0,0,0,'',0,'',0),(14883,'{15619}>{$ICMP_LOSS_WARN} and {15619}<100','High ICMP ping loss','',0,0,2,0,'','',14294,0,0,0,0,'',0,'',0),(14884,'{15620}>{$ICMP_RESPONSE_TIME_WARN}','High ICMP ping response time','',0,0,2,0,'','',14295,0,0,0,0,'',0,'',0),(14885,'{15621}<10m','{HOST.NAME} has been restarted','',0,0,2,0,'Last value: {ITEM.LASTVALUE1}.\r\nThe device uptime is less than 10 minutes','',14296,0,0,0,0,'',0,'',1),(14906,'{15678}=0','Unavailable by ICMP ping','',0,0,4,0,'Last value: {ITEM.LASTVALUE1}.\r\nLast three attempts returned timeout.  Please check device connectivity.','',14293,0,0,0,0,'',0,'',0),(14907,'{15679}>{$ICMP_LOSS_WARN} and {15679}<100','High ICMP ping loss','',0,0,2,0,'','',14294,0,0,0,0,'',0,'',0),(14908,'{15680}>{$ICMP_RESPONSE_TIME_WARN}','High ICMP ping response time','',0,0,2,0,'','',14295,0,0,0,0,'',0,'',0),(14909,'{15681}<10m','{HOST.NAME} has been restarted','',0,0,2,0,'Last value: {ITEM.LASTVALUE1}.\r\nThe device uptime is less than 10 minutes','',14296,0,0,0,0,'',0,'',1),(14911,'{15683}>{$CPU_UTIL_MAX}','High CPU utilization','',0,0,3,0,'Last value: {ITEM.LASTVALUE1}.','',NULL,0,0,0,0,'',0,'',0),(14912,'{15684}=1 and {15685}>0','Device has been replaced (new serial number received)','',0,0,1,0,'Last value: {ITEM.LASTVALUE1}.\r\nDevice serial number has changed. Ack to close','',NULL,0,0,0,2,'',0,'',1),(14913,'{15686}=1 and {15687}>0','Firmware has changed','',0,0,1,0,'Last value: {ITEM.LASTVALUE1}.\r\nFirmware version has changed. Ack to close','',NULL,0,0,0,2,'',0,'',1),(14914,'{15688}>{$TEMP_WARN:\"\"}','{#SENSOR_INFO}: Temperature is above warning threshold: >{$TEMP_WARN:\"\"}','',0,0,2,0,'Last value: {ITEM.LASTVALUE1}.\r\nThis trigger uses temperature sensor values as well as temperature sensor status if available','',NULL,0,0,2,1,'{15689}<{$TEMP_WARN:\"\"}-3',0,'',0),(14915,'{15690}>{$TEMP_CRIT:\"\"}','{#SENSOR_INFO}: Temperature is above critical threshold: >{$TEMP_CRIT:\"\"}','',0,0,4,0,'Last value: {ITEM.LASTVALUE1}.\r\nThis trigger uses temperature sensor values as well as temperature sensor status if available','',NULL,0,0,2,1,'{15691}<{$TEMP_CRIT:\"\"}-3',0,'',0),(14916,'{15692}<{$TEMP_CRIT_LOW:\"\"}','{#SENSOR_INFO}: Temperature is too low: <{$TEMP_CRIT_LOW:\"\"}','',0,0,3,0,'Last value: {ITEM.LASTVALUE1}.','',NULL,0,0,2,1,'{15693}>{$TEMP_CRIT_LOW:\"\"}+3',0,'',0),(14917,'{15694}>{$MEMORY_UTIL_MAX}','#{#SNMPVALUE}: High memory utilization','',0,0,3,0,'Last value: {ITEM.LASTVALUE1}.','',NULL,0,0,2,0,'',0,'',0),(14920,'{15697}>{$CPU_UTIL_MAX}','#{#SNMPINDEX}: High CPU utilization','',0,0,3,0,'Last value: {ITEM.LASTVALUE1}.','',14247,0,0,2,0,'',0,'',0),(14921,'{15698}>{$STORAGE_UTIL_CRIT}','{#SNMPVALUE}: Disk space is critically low','',0,0,3,0,'Last value: {ITEM.LASTVALUE1}.','',14249,0,0,2,0,'',0,'',0),(14922,'{15699}>{$STORAGE_UTIL_WARN}','{#SNMPVALUE}: Disk space is low','',0,0,2,0,'Last value: {ITEM.LASTVALUE1}.','',14250,0,0,2,0,'',0,'',0),(14928,'{15713}=0','Unavailable by ICMP ping','',0,0,4,0,'Last value: {ITEM.LASTVALUE1}.\r\nLast three attempts returned timeout.  Please check device connectivity.','',14293,0,0,0,0,'',0,'',0),(14929,'{15714}>{$ICMP_LOSS_WARN} and {15714}<100','High ICMP ping loss','',0,0,2,0,'','',14294,0,0,0,0,'',0,'',0),(14930,'{15715}>{$ICMP_RESPONSE_TIME_WARN}','High ICMP ping response time','',0,0,2,0,'','',14295,0,0,0,0,'',0,'',0),(14931,'{15716}<10m','{HOST.NAME} has been restarted','',0,0,2,0,'Last value: {ITEM.LASTVALUE1}.\r\nThe device uptime is less than 10 minutes','',14296,0,0,0,0,'',0,'',1),(14934,'{15721}>{$TEMP_CRIT:\"\"}','{#SENSOR_INFO}: Temperature is above critical threshold: >{$TEMP_CRIT:\"\"}','',0,0,4,0,'Last value: {ITEM.LASTVALUE1}.\r\nThis trigger uses temperature sensor values as well as temperature sensor status if available','',NULL,0,0,2,1,'{15722}<{$TEMP_CRIT:\"\"}-3',0,'',0),(14935,'{15723}<{$TEMP_CRIT_LOW:\"\"}','{#SENSOR_INFO}: Temperature is too low: <{$TEMP_CRIT_LOW:\"\"}','',0,0,3,0,'Last value: {ITEM.LASTVALUE1}.','',NULL,0,0,2,1,'{15724}>{$TEMP_CRIT_LOW:\"\"}+3',0,'',0),(14937,'{15726}=1 and {15727}>0','{#ENT_NAME}: Device has been replaced (new serial number received)','',0,0,1,0,'Last value: {ITEM.LASTVALUE1}.\r\nDevice serial number has changed. Ack to close','',NULL,0,0,2,2,'',0,'',1),(14939,'{15729}=2','Interface {#IFNAME}({#IFALIAS}): In half-duplex mode','',0,0,2,0,'Last value: {ITEM.LASTVALUE1}.\r\nPlease check autonegotiation settings and cabling','',NULL,0,0,2,0,'',0,'',1),(14940,'{15730}=2','Interface {#IFNAME}({#IFALIAS}): In half-duplex mode','',0,0,2,0,'Last value: {ITEM.LASTVALUE1}.\r\nPlease check autonegotiation settings and cabling','',14939,0,0,2,0,'',0,'',1),(14941,'{15731}=2','Interface {#IFNAME}({#IFALIAS}): In half-duplex mode','',0,0,2,0,'Last value: {ITEM.LASTVALUE1}.\r\nPlease check autonegotiation settings and cabling','',NULL,0,0,2,0,'',0,'',1),(14942,'{15732}=2','Interface {#IFNAME}({#IFALIAS}): In half-duplex mode','',0,0,2,0,'Last value: {ITEM.LASTVALUE1}.\r\nPlease check autonegotiation settings and cabling','',14941,0,0,2,0,'',0,'',1),(14943,'{15733}=2','Interface {#IFNAME}({#IFALIAS}): In half-duplex mode','',0,0,2,0,'Last value: {ITEM.LASTVALUE1}.\r\nPlease check autonegotiation settings and cabling','',14941,0,0,2,0,'',0,'',1),(14944,'{15734}=2','Interface {#IFNAME}({#IFALIAS}): In half-duplex mode','',0,0,2,0,'Last value: {ITEM.LASTVALUE1}.\r\nPlease check autonegotiation settings and cabling','',14941,0,0,2,0,'',0,'',1),(14945,'{15735}=2','Interface {#IFNAME}({#IFALIAS}): In half-duplex mode','',0,0,2,0,'Last value: {ITEM.LASTVALUE1}.\r\nPlease check autonegotiation settings and cabling','',14941,0,0,2,0,'',0,'',1),(14946,'{15736}=2','Interface {#IFNAME}({#IFALIAS}): In half-duplex mode','',0,0,2,0,'Last value: {ITEM.LASTVALUE1}.\r\nPlease check autonegotiation settings and cabling','',14941,0,0,2,0,'',0,'',1),(14947,'{15737}=2','Interface {#IFNAME}({#IFALIAS}): In half-duplex mode','',0,0,2,0,'Last value: {ITEM.LASTVALUE1}.\r\nPlease check autonegotiation settings and cabling','',14941,0,0,2,0,'',0,'',1),(14948,'{15738}=2','Interface {#IFNAME}({#IFALIAS}): In half-duplex mode','',0,0,2,0,'Last value: {ITEM.LASTVALUE1}.\r\nPlease check autonegotiation settings and cabling','',14941,0,0,2,0,'',0,'',1),(14949,'{15739}=2','Interface {#IFNAME}({#IFALIAS}): In half-duplex mode','',0,0,2,0,'Last value: {ITEM.LASTVALUE1}.\r\nPlease check autonegotiation settings and cabling','',14941,0,0,2,0,'',0,'',1),(14950,'{15740}=2','Interface {#IFNAME}({#IFALIAS}): In half-duplex mode','',0,0,2,0,'Last value: {ITEM.LASTVALUE1}.\r\nPlease check autonegotiation settings and cabling','',14941,0,0,2,0,'',0,'',1),(14951,'{15741}=2','Interface {#IFNAME}({#IFALIAS}): In half-duplex mode','',0,0,2,0,'Last value: {ITEM.LASTVALUE1}.\r\nPlease check autonegotiation settings and cabling','',14941,0,0,2,0,'',0,'',1),(14952,'{15742}=2','Interface {#IFNAME}({#IFALIAS}): In half-duplex mode','',0,0,2,0,'Last value: {ITEM.LASTVALUE1}.\r\nPlease check autonegotiation settings and cabling','',14941,0,0,2,0,'',0,'',1),(14953,'{15743}=2','Interface {#IFNAME}({#IFALIAS}): In half-duplex mode','',0,0,2,0,'Last value: {ITEM.LASTVALUE1}.\r\nPlease check autonegotiation settings and cabling','',14941,0,0,2,0,'',0,'',1),(14954,'{15744}>{$MEMORY_UTIL_MAX}','#{#SNMPINDEX}: High memory utilization','',0,0,3,0,'Last value: {ITEM.LASTVALUE1}.','',NULL,0,0,2,0,'',0,'',0),(14955,'{15745}>{$MEMORY_UTIL_MAX}','#{#SNMPINDEX}: High memory utilization','',0,0,3,0,'Last value: {ITEM.LASTVALUE1}.','',NULL,0,0,2,0,'',0,'',0),(14956,'{15746}>{$MEMORY_UTIL_MAX}','#{#SNMPINDEX}: High memory utilization','',0,0,3,0,'Last value: {ITEM.LASTVALUE1}.','',14955,0,0,2,0,'',0,'',0),(14957,'{15747}>{$MEMORY_UTIL_MAX}','#{#SNMPINDEX}: High memory utilization','',0,0,3,0,'Last value: {ITEM.LASTVALUE1}.','',14955,0,0,2,0,'',0,'',0),(14958,'{15748}>{$MEMORY_UTIL_MAX}','#{#SNMPINDEX}: High memory utilization','',0,0,3,0,'Last value: {ITEM.LASTVALUE1}.','',14955,0,0,2,0,'',0,'',0),(15161,'{16352}=0','No SNMP data collection','',0,0,2,0,'Last value: {ITEM.LASTVALUE1}.\r\nSNMP is not available for polling. Please check device connectivity and SNMP settings.','',NULL,0,0,0,0,'',0,'',0),(15162,'{16353}=0','No SNMP data collection','',0,0,2,0,'Last value: {ITEM.LASTVALUE1}.\r\nSNMP is not available for polling. Please check device connectivity and SNMP settings.','',15161,0,0,0,0,'',0,'',0),(15163,'{16354}=0','No SNMP data collection','',0,0,2,0,'Last value: {ITEM.LASTVALUE1}.\r\nSNMP is not available for polling. Please check device connectivity and SNMP settings.','',15161,0,0,0,0,'',0,'',0),(15170,'{16375}=0','No SNMP data collection','',0,0,2,0,'Last value: {ITEM.LASTVALUE1}.\r\nSNMP is not available for polling. Please check device connectivity and SNMP settings.','',NULL,0,0,0,0,'',0,'',0),(15171,'{16376}=0','No SNMP data collection','',0,0,2,0,'Last value: {ITEM.LASTVALUE1}.\r\nSNMP is not available for polling. Please check device connectivity and SNMP settings.','',15170,0,0,0,0,'',0,'',0),(15172,'{16377}=0','No SNMP data collection','',0,0,2,0,'Last value: {ITEM.LASTVALUE1}.\r\nSNMP is not available for polling. Please check device connectivity and SNMP settings.','',15170,0,0,0,0,'',0,'',0),(15173,'{16378}=0','No SNMP data collection','',0,0,2,0,'Last value: {ITEM.LASTVALUE1}.\r\nSNMP is not available for polling. Please check device connectivity and SNMP settings.','',15170,0,0,0,0,'',0,'',0),(15174,'{16379}=0','No SNMP data collection','',0,0,2,0,'Last value: {ITEM.LASTVALUE1}.\r\nSNMP is not available for polling. Please check device connectivity and SNMP settings.','',15170,0,0,0,0,'',0,'',0),(15175,'{16380}=0','No SNMP data collection','',0,0,2,0,'Last value: {ITEM.LASTVALUE1}.\r\nSNMP is not available for polling. Please check device connectivity and SNMP settings.','',15170,0,0,0,0,'',0,'',0),(15176,'{16381}=0','No SNMP data collection','',0,0,2,0,'Last value: {ITEM.LASTVALUE1}.\r\nSNMP is not available for polling. Please check device connectivity and SNMP settings.','',15170,0,0,0,0,'',0,'',0),(15177,'{16382}=0','No SNMP data collection','',0,0,2,0,'Last value: {ITEM.LASTVALUE1}.\r\nSNMP is not available for polling. Please check device connectivity and SNMP settings.','',15170,0,0,0,0,'',0,'',0),(15178,'{16383}=0','No SNMP data collection','',0,0,2,0,'Last value: {ITEM.LASTVALUE1}.\r\nSNMP is not available for polling. Please check device connectivity and SNMP settings.','',15170,0,0,0,0,'',0,'',0),(15179,'{16384}=0','No SNMP data collection','',0,0,2,0,'Last value: {ITEM.LASTVALUE1}.\r\nSNMP is not available for polling. Please check device connectivity and SNMP settings.','',15170,0,0,0,0,'',0,'',0),(15180,'{16385}=0','No SNMP data collection','',0,0,2,0,'Last value: {ITEM.LASTVALUE1}.\r\nSNMP is not available for polling. Please check device connectivity and SNMP settings.','',15170,0,0,0,0,'',0,'',0),(15181,'{16386}=0','No SNMP data collection','',0,0,2,0,'Last value: {ITEM.LASTVALUE1}.\r\nSNMP is not available for polling. Please check device connectivity and SNMP settings.','',15170,0,0,0,0,'',0,'',0),(15182,'{16387}=0','No SNMP data collection','',0,0,2,0,'Last value: {ITEM.LASTVALUE1}.\r\nSNMP is not available for polling. Please check device connectivity and SNMP settings.','',15170,0,0,0,0,'',0,'',0),(15183,'{16388}=0','No SNMP data collection','',0,0,2,0,'Last value: {ITEM.LASTVALUE1}.\r\nSNMP is not available for polling. Please check device connectivity and SNMP settings.','',15170,0,0,0,0,'',0,'',0),(15184,'{16389}=0','No SNMP data collection','',0,0,2,0,'Last value: {ITEM.LASTVALUE1}.\r\nSNMP is not available for polling. Please check device connectivity and SNMP settings.','',15170,0,0,0,0,'',0,'',0),(15185,'{16390}=0','No SNMP data collection','',0,0,2,0,'Last value: {ITEM.LASTVALUE1}.\r\nSNMP is not available for polling. Please check device connectivity and SNMP settings.','',15170,0,0,0,0,'',0,'',0),(15186,'{16391}=0','No SNMP data collection','',0,0,2,0,'Last value: {ITEM.LASTVALUE1}.\r\nSNMP is not available for polling. Please check device connectivity and SNMP settings.','',15170,0,0,0,0,'',0,'',0),(15187,'{16392}=0','No SNMP data collection','',0,0,2,0,'Last value: {ITEM.LASTVALUE1}.\r\nSNMP is not available for polling. Please check device connectivity and SNMP settings.','',15170,0,0,0,0,'',0,'',0),(15188,'{16393}=0','No SNMP data collection','',0,0,2,0,'Last value: {ITEM.LASTVALUE1}.\r\nSNMP is not available for polling. Please check device connectivity and SNMP settings.','',15170,0,0,0,0,'',0,'',0),(15189,'{16394}=0','No SNMP data collection','',0,0,2,0,'Last value: {ITEM.LASTVALUE1}.\r\nSNMP is not available for polling. Please check device connectivity and SNMP settings.','',15170,0,0,0,0,'',0,'',0),(15190,'{16395}=0','No SNMP data collection','',0,0,2,0,'Last value: {ITEM.LASTVALUE1}.\r\nSNMP is not available for polling. Please check device connectivity and SNMP settings.','',15170,0,0,0,0,'',0,'',0),(15191,'{16396}=0','No SNMP data collection','',0,0,2,0,'Last value: {ITEM.LASTVALUE1}.\r\nSNMP is not available for polling. Please check device connectivity and SNMP settings.','',15170,0,0,0,0,'',0,'',0),(15192,'{16397}=0','No SNMP data collection','',0,0,2,0,'Last value: {ITEM.LASTVALUE1}.\r\nSNMP is not available for polling. Please check device connectivity and SNMP settings.','',15170,0,0,0,0,'',0,'',0),(15193,'{16398}=0','No SNMP data collection','',0,0,2,0,'Last value: {ITEM.LASTVALUE1}.\r\nSNMP is not available for polling. Please check device connectivity and SNMP settings.','',15170,0,0,0,0,'',0,'',0),(15208,'{16445}=1 and {16446}>0','Device has been replaced (new serial number received)','',0,0,1,0,'Last value: {ITEM.LASTVALUE1}.\r\nDevice serial number has changed. Ack to close','',14409,0,0,0,2,'',0,'',1),(15209,'{16447}=1 and {16448}>0','{#ENT_NAME}: Device has been replaced (new serial number received)','',0,0,1,0,'Last value: {ITEM.LASTVALUE1}.\r\nDevice serial number has changed. Ack to close','',14417,0,0,2,2,'',0,'',1),(15214,'{16457}<{$TEMP_CRIT_LOW:\"\"}','{#SNMPVALUE}: Temperature is too low: <{$TEMP_CRIT_LOW:\"\"}','',0,0,3,0,'Last value: {ITEM.LASTVALUE1}.','',14420,0,0,2,1,'{16458}>{$TEMP_CRIT_LOW:\"\"}+3',0,'',0),(15215,'{16459}>{$MEMORY_UTIL_MAX}','{#SNMPVALUE}: High memory utilization','',0,0,3,0,'Last value: {ITEM.LASTVALUE1}.','',14414,0,0,2,0,'',0,'',0),(15220,'{16472}=0','Unavailable by ICMP ping','',0,0,4,0,'Last value: {ITEM.LASTVALUE1}.\r\nLast three attempts returned timeout.  Please check device connectivity.','',14293,0,0,0,0,'',0,'',0),(15221,'{16473}>{$ICMP_LOSS_WARN} and {16473}<100','High ICMP ping loss','',0,0,2,0,'','',14294,0,0,0,0,'',0,'',0),(15222,'{16474}>{$ICMP_RESPONSE_TIME_WARN}','High ICMP ping response time','',0,0,2,0,'','',14295,0,0,0,0,'',0,'',0),(15223,'{16475}<10m','{HOST.NAME} has been restarted','',0,0,2,0,'Last value: {ITEM.LASTVALUE1}.\r\nThe device uptime is less than 10 minutes','',14296,0,0,0,0,'',0,'',1),(15224,'{16476}=0','No SNMP data collection','',0,0,2,0,'Last value: {ITEM.LASTVALUE1}.\r\nSNMP is not available for polling. Please check device connectivity and SNMP settings.','',15170,0,0,0,0,'',0,'',0),(15225,'{16477}>{$CPU_UTIL_MAX}','{#SNMPVALUE}: High CPU utilization','',0,0,3,0,'Last value: {ITEM.LASTVALUE1}.','',NULL,0,0,2,0,'',0,'',0),(15228,'{16484}>{$CPU_UTIL_MAX}','{#SNMPVALUE}: High CPU utilization','',0,0,3,0,'Last value: {ITEM.LASTVALUE1}.','',15225,0,0,2,0,'',0,'',0),(15330,'{16818}=1','#{#SNMPINDEX}: Fan is in critical state','',0,0,3,0,'Last value: {ITEM.LASTVALUE1}.\r\nPlease check the fan unit','',NULL,0,0,2,0,'',0,'',0),(15331,'{16819}=1','PSU {#SNMPVALUE}: Power supply is in critical state','',0,0,3,0,'Last value: {ITEM.LASTVALUE1}.\r\nPlease check the power supply unit for errors','',NULL,0,0,2,0,'',0,'',0),(15332,'{16820}=1','PSU {#SNMPVALUE}: Power supply is not in normal state','',0,0,1,0,'Last value: {ITEM.LASTVALUE1}.\r\nPlease check the power supply unit for errors','',NULL,0,0,2,0,'',0,'',0),(15333,'{16821}=1','Fan {#SNMPVALUE}: Fan is in critical state','',0,0,3,0,'Last value: {ITEM.LASTVALUE1}.\r\nPlease check the fan unit','',NULL,0,0,2,0,'',0,'',0),(15334,'{16822}=1','Fan {#SNMPVALUE}: Fan is not in normal state','',0,0,1,0,'Last value: {ITEM.LASTVALUE1}.\r\nPlease check the fan unit','',NULL,0,0,2,0,'',0,'',0),(15335,'{16823}>{$TEMP_WARN:\"\"}\r\nor\r\n{16824}={$TEMP_WARN_STATUS}','{#SENSOR_INFO}: Temperature is above warning threshold: >{$TEMP_WARN:\"\"}','',0,0,2,0,'Last value: {ITEM.LASTVALUE1}.\r\nThis trigger uses temperature sensor values as well as temperature sensor status if available','',NULL,0,0,2,1,'{16825}<{$TEMP_WARN:\"\"}-3',0,'',0),(15336,'{16826}>{$TEMP_CRIT:\"\"}\r\nor\r\n{16827}={$TEMP_CRIT_STATUS}','{#SENSOR_INFO}: Temperature is above critical threshold: >{$TEMP_CRIT:\"\"}','',0,0,4,0,'Last value: {ITEM.LASTVALUE1}.\r\nThis trigger uses temperature sensor values as well as temperature sensor status if available','',NULL,0,0,2,1,'{16828}<{$TEMP_CRIT:\"\"}-3',0,'',0),(15337,'{16829}=1','{#SNMPVALUE}: Power supply is in critical state','',0,0,3,0,'Last value: {ITEM.LASTVALUE1}.\r\nPlease check the power supply unit for errors','',NULL,0,0,2,0,'',0,'',0),(15338,'{16830}=1','{#SNMPVALUE}: Power supply is in warning state','',0,0,2,0,'Last value: {ITEM.LASTVALUE1}.\r\nPlease check the power supply unit for errors','',NULL,0,0,2,0,'',0,'',0),(15339,'{16831}=1','{#SNMPVALUE}: Fan is in critical state','',0,0,3,0,'Last value: {ITEM.LASTVALUE1}.\r\nPlease check the fan unit','',NULL,0,0,2,0,'',0,'',0),(15340,'{16832}=1','#{#SNMPVALUE}: Power supply is in critical state','',0,0,3,0,'Last value: {ITEM.LASTVALUE1}.\r\nPlease check the power supply unit for errors','',NULL,0,0,2,0,'',0,'',0),(15341,'{16833}=1','#{#SNMPVALUE}: Fan is in critical state','',0,0,3,0,'Last value: {ITEM.LASTVALUE1}.\r\nPlease check the fan unit','',NULL,0,0,2,0,'',0,'',0),(15342,'{16834}>{$TEMP_WARN:\"\"}\r\nor\r\n{16835}={$TEMP_WARN_STATUS}','{#SNMPVALUE}: Temperature is above warning threshold: >{$TEMP_WARN:\"\"}','',0,0,2,0,'Last value: {ITEM.LASTVALUE1}.\r\nThis trigger uses temperature sensor values as well as temperature sensor status if available','',NULL,0,0,2,1,'{16836}<{$TEMP_WARN:\"\"}-3',0,'',0),(15343,'{16837}>{$TEMP_CRIT:\"\"}\r\nor\r\n{16838}={$TEMP_CRIT_STATUS}\r\nor\r\n{16838}={$TEMP_DISASTER_STATUS}','{#SNMPVALUE}: Temperature is above critical threshold: >{$TEMP_CRIT:\"\"}','',0,0,4,0,'Last value: {ITEM.LASTVALUE1}.\r\nThis trigger uses temperature sensor values as well as temperature sensor status if available','',NULL,0,0,2,1,'{16839}<{$TEMP_CRIT:\"\"}-3',0,'',0),(15344,'{16840}=1 or {16841}=1','{#SENSOR_INFO}: Power supply is in critical state','',0,0,3,0,'Last value: {ITEM.LASTVALUE1}.\r\nPlease check the power supply unit for errors','',NULL,0,0,2,0,'',0,'',0),(15345,'{16842}=1 or {16843}=1','{#SENSOR_INFO}: Power supply is in warning state','',0,0,2,0,'Last value: {ITEM.LASTVALUE1}.\r\nPlease check the power supply unit for errors','',NULL,0,0,2,0,'',0,'',0),(15346,'{16844}=1 or {16845}=1','{#SENSOR_INFO}: Fan is in critical state','',0,0,3,0,'Last value: {ITEM.LASTVALUE1}.\r\nPlease check the fan unit','',NULL,0,0,2,0,'',0,'',0),(15347,'{16846}=1 or {16847}=1','{#SENSOR_INFO}: Fan is in warning state','',0,0,2,0,'Last value: {ITEM.LASTVALUE1}.\r\nPlease check the fan unit','',NULL,0,0,2,0,'',0,'',0),(15348,'{16848}>{$TEMP_WARN:\"\"}\r\nor\r\n{16849}={$TEMP_WARN_STATUS}','{#SNMPVALUE}: Temperature is above warning threshold: >{$TEMP_WARN:\"\"}','',0,0,2,0,'Last value: {ITEM.LASTVALUE1}.\r\nThis trigger uses temperature sensor values as well as temperature sensor status if available','',15342,0,0,2,1,'{16850}<{$TEMP_WARN:\"\"}-3',0,'',0),(15349,'{16851}>{$TEMP_WARN:\"\"}\r\nor\r\n{16852}={$TEMP_WARN_STATUS}','{#SNMPVALUE}: Temperature is above warning threshold: >{$TEMP_WARN:\"\"}','',0,0,2,0,'Last value: {ITEM.LASTVALUE1}.\r\nThis trigger uses temperature sensor values as well as temperature sensor status if available','',15342,0,0,2,1,'{16853}<{$TEMP_WARN:\"\"}-3',0,'',0),(15350,'{16854}>{$TEMP_WARN:\"\"}\r\nor\r\n{16855}={$TEMP_WARN_STATUS}','{#SNMPVALUE}: Temperature is above warning threshold: >{$TEMP_WARN:\"\"}','',0,0,2,0,'Last value: {ITEM.LASTVALUE1}.\r\nThis trigger uses temperature sensor values as well as temperature sensor status if available','',15342,0,0,2,1,'{16856}<{$TEMP_WARN:\"\"}-3',0,'',0),(15351,'{16857}>{$TEMP_CRIT:\"\"}\r\nor\r\n{16858}={$TEMP_CRIT_STATUS}\r\nor\r\n{16858}={$TEMP_DISASTER_STATUS}','{#SNMPVALUE}: Temperature is above critical threshold: >{$TEMP_CRIT:\"\"}','',0,0,4,0,'Last value: {ITEM.LASTVALUE1}.\r\nThis trigger uses temperature sensor values as well as temperature sensor status if available','',15343,0,0,2,1,'{16859}<{$TEMP_CRIT:\"\"}-3',0,'',0),(15352,'{16860}>{$TEMP_CRIT:\"\"}\r\nor\r\n{16861}={$TEMP_CRIT_STATUS}\r\nor\r\n{16861}={$TEMP_DISASTER_STATUS}','{#SNMPVALUE}: Temperature is above critical threshold: >{$TEMP_CRIT:\"\"}','',0,0,4,0,'Last value: {ITEM.LASTVALUE1}.\r\nThis trigger uses temperature sensor values as well as temperature sensor status if available','',15343,0,0,2,1,'{16862}<{$TEMP_CRIT:\"\"}-3',0,'',0),(15353,'{16863}>{$TEMP_CRIT:\"\"}\r\nor\r\n{16864}={$TEMP_CRIT_STATUS}\r\nor\r\n{16864}={$TEMP_DISASTER_STATUS}','{#SNMPVALUE}: Temperature is above critical threshold: >{$TEMP_CRIT:\"\"}','',0,0,4,0,'Last value: {ITEM.LASTVALUE1}.\r\nThis trigger uses temperature sensor values as well as temperature sensor status if available','',15343,0,0,2,1,'{16865}<{$TEMP_CRIT:\"\"}-3',0,'',0),(15354,'{16866}=1 or {16867}=1','{#SENSOR_INFO}: Power supply is in critical state','',0,0,3,0,'Last value: {ITEM.LASTVALUE1}.\r\nPlease check the power supply unit for errors','',15344,0,0,2,0,'',0,'',0),(15355,'{16868}=1 or {16869}=1','{#SENSOR_INFO}: Power supply is in critical state','',0,0,3,0,'Last value: {ITEM.LASTVALUE1}.\r\nPlease check the power supply unit for errors','',15344,0,0,2,0,'',0,'',0),(15356,'{16870}=1 or {16871}=1','{#SENSOR_INFO}: Power supply is in critical state','',0,0,3,0,'Last value: {ITEM.LASTVALUE1}.\r\nPlease check the power supply unit for errors','',15344,0,0,2,0,'',0,'',0),(15357,'{16872}=1 or {16873}=1','{#SENSOR_INFO}: Power supply is in warning state','',0,0,2,0,'Last value: {ITEM.LASTVALUE1}.\r\nPlease check the power supply unit for errors','',15345,0,0,2,0,'',0,'',0),(15358,'{16874}=1 or {16875}=1','{#SENSOR_INFO}: Power supply is in warning state','',0,0,2,0,'Last value: {ITEM.LASTVALUE1}.\r\nPlease check the power supply unit for errors','',15345,0,0,2,0,'',0,'',0),(15359,'{16876}=1 or {16877}=1','{#SENSOR_INFO}: Power supply is in warning state','',0,0,2,0,'Last value: {ITEM.LASTVALUE1}.\r\nPlease check the power supply unit for errors','',15345,0,0,2,0,'',0,'',0),(15360,'{16878}=1 or {16879}=1','{#SENSOR_INFO}: Fan is in critical state','',0,0,3,0,'Last value: {ITEM.LASTVALUE1}.\r\nPlease check the fan unit','',15346,0,0,2,0,'',0,'',0),(15361,'{16880}=1 or {16881}=1','{#SENSOR_INFO}: Fan is in critical state','',0,0,3,0,'Last value: {ITEM.LASTVALUE1}.\r\nPlease check the fan unit','',15346,0,0,2,0,'',0,'',0),(15362,'{16882}=1 or {16883}=1','{#SENSOR_INFO}: Fan is in critical state','',0,0,3,0,'Last value: {ITEM.LASTVALUE1}.\r\nPlease check the fan unit','',15346,0,0,2,0,'',0,'',0),(15363,'{16884}=1 or {16885}=1','{#SENSOR_INFO}: Fan is in warning state','',0,0,2,0,'Last value: {ITEM.LASTVALUE1}.\r\nPlease check the fan unit','',15347,0,0,2,0,'',0,'',0),(15364,'{16886}=1 or {16887}=1','{#SENSOR_INFO}: Fan is in warning state','',0,0,2,0,'Last value: {ITEM.LASTVALUE1}.\r\nPlease check the fan unit','',15347,0,0,2,0,'',0,'',0),(15365,'{16888}=1 or {16889}=1','{#SENSOR_INFO}: Fan is in warning state','',0,0,2,0,'Last value: {ITEM.LASTVALUE1}.\r\nPlease check the fan unit','',15347,0,0,2,0,'',0,'',0),(15366,'{16890}=1','{#SNMPVALUE}: Power supply is in critical state','',0,0,3,0,'Last value: {ITEM.LASTVALUE1}.\r\nPlease check the power supply unit for errors','',NULL,0,0,2,0,'',0,'',0),(15367,'{16891}=1','{#SNMPVALUE}: Fan is in critical state','',0,0,3,0,'Last value: {ITEM.LASTVALUE1}.\r\nPlease check the fan unit','',NULL,0,0,2,0,'',0,'',0),(15368,'{16892}>{$TEMP_CRIT:\"\"}\r\nor\r\n{16893}={$TEMP_CRIT_STATUS}','Device: Temperature is above critical threshold: >{$TEMP_CRIT:\"\"}','',0,0,4,0,'Last value: {ITEM.LASTVALUE1}.\r\nThis trigger uses temperature sensor values as well as temperature sensor status if available','',NULL,0,0,0,1,'{16894}<{$TEMP_CRIT:\"\"}-3',0,'',0),(15369,'{16895}=1','PSU {#SNMPVALUE}: Power supply is in critical state','',0,0,3,0,'Last value: {ITEM.LASTVALUE1}.\r\nPlease check the power supply unit for errors','',NULL,0,0,2,0,'',0,'',0),(15370,'{16896}=1','Fan {#SNMPVALUE}: Fan is in critical state','',0,0,3,0,'Last value: {ITEM.LASTVALUE1}.\r\nPlease check the fan unit','',NULL,0,0,2,0,'',0,'',0),(15371,'{16897}=1 or {16898}=1','{#ENT_NAME}: Fan is in critical state','',0,0,3,0,'Last value: {ITEM.LASTVALUE1}.\r\nPlease check the fan unit','',NULL,0,0,2,0,'',0,'',0),(15372,'{16899}=1 or {16900}=1 or {16901}=1','{#ENT_NAME}: Power supply is in critical state','',0,0,3,0,'Last value: {ITEM.LASTVALUE1}.\r\nPlease check the power supply unit for errors','',NULL,0,0,2,0,'',0,'',0),(15373,'{16902}=1','{#ENT_DESCR}: Fan is in critical state','',0,0,3,0,'Last value: {ITEM.LASTVALUE1}.\r\nPlease check the fan unit','',NULL,0,0,2,0,'',0,'',0),(15374,'{16903}=1','{#ENT_DESCR}: Fan is in warning state','',0,0,2,0,'Last value: {ITEM.LASTVALUE1}.\r\nPlease check the fan unit','',NULL,0,0,2,0,'',0,'',0),(15375,'{16904}=1','{#ENT_DESCR}: Power supply is in critical state','',0,0,3,0,'Last value: {ITEM.LASTVALUE1}.\r\nPlease check the power supply unit for errors','',NULL,0,0,2,0,'',0,'',0),(15376,'{16905}=1','{#ENT_DESCR}: Power supply is in warning state','',0,0,2,0,'Last value: {ITEM.LASTVALUE1}.\r\nPlease check the power supply unit for errors','',NULL,0,0,2,0,'',0,'',0),(15377,'{16906}=1','{#SNMPVALUE}: Fan is in critical state','',0,0,3,0,'Last value: {ITEM.LASTVALUE1}.\r\nPlease check the fan unit','',NULL,0,0,2,0,'',0,'',0),(15378,'{16907}=1','{#SNMPVALUE}: Power supply is in critical state','',0,0,3,0,'Last value: {ITEM.LASTVALUE1}.\r\nPlease check the power supply unit for errors','',NULL,0,0,2,0,'',0,'',0),(15379,'{16908}=1','PSU {#PSU_INDEX}: Power supply is in critical state','',0,0,3,0,'Last value: {ITEM.LASTVALUE1}.\r\nPlease check the power supply unit for errors','',NULL,0,0,2,0,'',0,'',0),(15380,'{16909}=1','PSU {#PSU_INDEX}: Power supply is not in normal state','',0,0,1,0,'Last value: {ITEM.LASTVALUE1}.\r\nPlease check the power supply unit for errors','',NULL,0,0,2,0,'',0,'',0),(15381,'{16910}=1','Fan {#FAN_INDEX}: Fan is in critical state','',0,0,3,0,'Last value: {ITEM.LASTVALUE1}.\r\nPlease check the fan unit','',NULL,0,0,2,0,'',0,'',0),(15382,'{16911}=1','Fan {#FAN_INDEX}: Fan is not in normal state','',0,0,1,0,'Last value: {ITEM.LASTVALUE1}.\r\nPlease check the fan unit','',NULL,0,0,2,0,'',0,'',0),(15383,'{16912}=1','Unit {#PSU_UNIT} PSU {#PSU_INDEX}: Power supply is in critical state','',0,0,3,0,'Last value: {ITEM.LASTVALUE1}.\r\nPlease check the power supply unit for errors','',NULL,0,0,2,0,'',0,'',0),(15384,'{16913}=1','Unit {#PSU_UNIT} PSU {#PSU_INDEX}: Power supply is not in normal state','',0,0,1,0,'Last value: {ITEM.LASTVALUE1}.\r\nPlease check the power supply unit for errors','',NULL,0,0,2,0,'',0,'',0),(15385,'{16914}=1','Unit {#FAN_UNIT} Fan {#FAN_INDEX}: Fan is in critical state','',0,0,3,0,'Last value: {ITEM.LASTVALUE1}.\r\nPlease check the fan unit','',NULL,0,0,2,0,'',0,'',0),(15386,'{16915}=1','Unit {#FAN_UNIT} Fan {#FAN_INDEX}: Fan is not in normal state','',0,0,1,0,'Last value: {ITEM.LASTVALUE1}.\r\nPlease check the fan unit','',NULL,0,0,2,0,'',0,'',0),(15387,'{16916}>{$TEMP_WARN:\"\"}\r\nor\r\n{16917}={$TEMP_WARN_STATUS}','{#SENSOR_INFO}: Temperature is above warning threshold: >{$TEMP_WARN:\"\"}','',0,0,2,0,'Last value: {ITEM.LASTVALUE1}.\r\nThis trigger uses temperature sensor values as well as temperature sensor status if available','',NULL,0,0,2,1,'{16918}<{$TEMP_WARN:\"\"}-3',0,'',0),(15388,'{16919}=1','{#SENSOR_INFO}: Fan is in critical state','',0,0,3,0,'Last value: {ITEM.LASTVALUE1}.\r\nPlease check the fan unit','',NULL,0,0,2,0,'',0,'',0),(15389,'{16920}=1','{#ENT_NAME}: Power supply is in critical state','',0,0,3,0,'Last value: {ITEM.LASTVALUE1}.\r\nPlease check the power supply unit for errors','',NULL,0,0,2,0,'',0,'',0),(15390,'{16921}>{$TEMP_WARN:\"\"}\r\nor\r\n{16922}={$TEMP_WARN_STATUS}','{#SENSOR_INFO}: Temperature is above warning threshold: >{$TEMP_WARN:\"\"}','',0,0,2,0,'Last value: {ITEM.LASTVALUE1}.\r\nThis trigger uses temperature sensor values as well as temperature sensor status if available','',NULL,0,0,2,1,'{16923}<{$TEMP_WARN:\"\"}-3',0,'',0),(15391,'{16924}=1','{#SENSOR_INFO}: Power supply is in critical state','',0,0,3,0,'Last value: {ITEM.LASTVALUE1}.\r\nPlease check the power supply unit for errors','',NULL,0,0,2,0,'',0,'',0),(15392,'{16925}=1','{#SENSOR_INFO}: Power supply is not in normal state','',0,0,1,0,'Last value: {ITEM.LASTVALUE1}.\r\nPlease check the power supply unit for errors','',NULL,0,0,2,0,'',0,'',0),(15393,'{16926}=1','{#SENSOR_INFO}: Fan is in critical state','',0,0,3,0,'Last value: {ITEM.LASTVALUE1}.\r\nPlease check the fan unit','',NULL,0,0,2,0,'',0,'',0),(15394,'{16927}=1','{#SENSOR_INFO}: Fan is not in normal state','',0,0,1,0,'Last value: {ITEM.LASTVALUE1}.\r\nPlease check the fan unit','',NULL,0,0,2,0,'',0,'',0),(15395,'{16928}=1','#{#SNMPVALUE}: Fan is in critical state','',0,0,3,0,'Last value: {ITEM.LASTVALUE1}.\r\nPlease check the fan unit','',NULL,0,0,2,0,'',0,'',0),(15396,'{16929}>{$TEMP_WARN:\"\"}\r\nor\r\n{16930}={$TEMP_WARN_STATUS}','#{#SNMPVALUE}: Temperature is above warning threshold: >{$TEMP_WARN:\"\"}','',0,0,2,0,'Last value: {ITEM.LASTVALUE1}.\r\nThis trigger uses temperature sensor values as well as temperature sensor status if available','',NULL,0,0,2,1,'{16931}<{$TEMP_WARN:\"\"}-3',0,'',0),(15397,'{16932}>{$TEMP_CRIT:\"\"}\r\nor\r\n{16933}={$TEMP_CRIT_STATUS}','#{#SNMPVALUE}: Temperature is above critical threshold: >{$TEMP_CRIT:\"\"}','',0,0,4,0,'Last value: {ITEM.LASTVALUE1}.\r\nThis trigger uses temperature sensor values as well as temperature sensor status if available','',NULL,0,0,2,1,'{16934}<{$TEMP_CRIT:\"\"}-3',0,'',0),(15398,'{16935}=1','#{#SNMPVALUE}: Fan is in critical state','',0,0,3,0,'Last value: {ITEM.LASTVALUE1}.\r\nPlease check the fan unit','',NULL,0,0,2,0,'',0,'',0),(15399,'{16936}=1','#{#SNMPVALUE}: Power supply is in critical state','',0,0,3,0,'Last value: {ITEM.LASTVALUE1}.\r\nPlease check the power supply unit for errors','',NULL,0,0,2,0,'',0,'',0),(15400,'{$IFCONTROL:\"{#IFNAME}\"}=1 and ({16937}=2 and {16938}=1)','Interface {#IFDESCR}: Link down','',0,0,3,0,'Last value: {ITEM.LASTVALUE1}.\r\nInterface is down','',NULL,0,0,2,1,'{16937}<>2',0,'',0),(15404,'{$IFCONTROL:\"{#IFNAME}\"}=1 and ({16949}=2 and {16950}=1)','Interface {#IFDESCR}: Link down','',0,0,3,0,'Last value: {ITEM.LASTVALUE1}.\r\nInterface is down','',15400,0,0,2,1,'{16949}<>2',0,'',0),(15405,'{$IFCONTROL:\"{#IFNAME}\"}=1 and ({16951}=2 and {16952}=1)','Interface {#IFDESCR}: Link down','',0,0,3,0,'Last value: {ITEM.LASTVALUE1}.\r\nInterface is down','',15400,0,0,2,1,'{16951}<>2',0,'',0),(15412,'{$IFCONTROL:\"{#IFNAME}\"}=1 and ({16973}=2 and {16974}=1)','Interface {#IFDESCR}: Link down','',0,0,3,0,'Last value: {ITEM.LASTVALUE1}.\r\nInterface is down','',NULL,0,0,2,1,'{16973}<>2',0,'',0),(15416,'{$IFCONTROL:\"{#IFNAME}\"}=1 and ({16985}=2 and {16986}=1)','Interface {#IFDESCR}: Link down','',0,0,3,0,'Last value: {ITEM.LASTVALUE1}.\r\nInterface is down','',15412,0,0,2,1,'{16985}<>2',0,'',0),(15417,'{$IFCONTROL:\"{#IFNAME}\"}=1 and ({16987}=2 and {16988}=1)','Interface {#IFDESCR}: Link down','',0,0,3,0,'Last value: {ITEM.LASTVALUE1}.\r\nInterface is down','',15412,0,0,2,1,'{16987}<>2',0,'',0),(15424,'{$IFCONTROL:\"{#IFNAME}\"}=1 and ({17009}=2 and {17010}=1)','Interface {#IFNAME}({#IFALIAS}): Link down','',0,0,3,0,'Last value: {ITEM.LASTVALUE1}.\r\nInterface is down','',NULL,0,0,2,1,'{17009}<>2',0,'',0),(15428,'{$IFCONTROL:\"{#IFNAME}\"}=1 and ({17021}=2 and {17022}=1)','Interface {#IFNAME}({#IFALIAS}): Link down','',0,0,3,0,'Last value: {ITEM.LASTVALUE1}.\r\nInterface is down','',NULL,0,0,2,1,'{17021}<>2',0,'',0),(15432,'{$IFCONTROL:\"{#IFNAME}\"}=1 and ({17033}=2 and {17034}=1)','Interface {#IFNAME}({#IFALIAS}): Link down','',0,0,3,0,'Last value: {ITEM.LASTVALUE1}.\r\nInterface is down','',15428,0,0,2,1,'{17033}<>2',0,'',0),(15433,'{$IFCONTROL:\"{#IFNAME}\"}=1 and ({17035}=2 and {17036}=1)','Interface {#IFNAME}({#IFALIAS}): Link down','',0,0,3,0,'Last value: {ITEM.LASTVALUE1}.\r\nInterface is down','',15428,0,0,2,1,'{17035}<>2',0,'',0),(15434,'{$IFCONTROL:\"{#IFNAME}\"}=1 and ({17037}=2 and {17038}=1)','Interface {#IFNAME}({#IFALIAS}): Link down','',0,0,3,0,'Last value: {ITEM.LASTVALUE1}.\r\nInterface is down','',15428,0,0,2,1,'{17037}<>2',0,'',0),(15435,'{$IFCONTROL:\"{#IFNAME}\"}=1 and ({17039}=2 and {17040}=1)','Interface {#IFNAME}({#IFALIAS}): Link down','',0,0,3,0,'Last value: {ITEM.LASTVALUE1}.\r\nInterface is down','',15428,0,0,2,1,'{17039}<>2',0,'',0),(15436,'{$IFCONTROL:\"{#IFNAME}\"}=1 and ({17041}=2 and {17042}=1)','Interface {#IFNAME}({#IFALIAS}): Link down','',0,0,3,0,'Last value: {ITEM.LASTVALUE1}.\r\nInterface is down','',15428,0,0,2,1,'{17041}<>2',0,'',0),(15437,'{$IFCONTROL:\"{#IFNAME}\"}=1 and ({17043}=2 and {17044}=1)','Interface {#IFNAME}({#IFALIAS}): Link down','',0,0,3,0,'Last value: {ITEM.LASTVALUE1}.\r\nInterface is down','',15428,0,0,2,1,'{17043}<>2',0,'',0),(15438,'{$IFCONTROL:\"{#IFNAME}\"}=1 and ({17045}=2 and {17046}=1)','Interface {#IFNAME}({#IFALIAS}): Link down','',0,0,3,0,'Last value: {ITEM.LASTVALUE1}.\r\nInterface is down','',15428,0,0,2,1,'{17045}<>2',0,'',0),(15439,'{$IFCONTROL:\"{#IFNAME}\"}=1 and ({17047}=2 and {17048}=1)','Interface {#IFNAME}({#IFALIAS}): Link down','',0,0,3,0,'Last value: {ITEM.LASTVALUE1}.\r\nInterface is down','',15428,0,0,2,1,'{17047}<>2',0,'',0),(15440,'{$IFCONTROL:\"{#IFNAME}\"}=1 and ({17049}=2 and {17050}=1)','Interface {#IFNAME}({#IFALIAS}): Link down','',0,0,3,0,'Last value: {ITEM.LASTVALUE1}.\r\nInterface is down','',15428,0,0,2,1,'{17049}<>2',0,'',0),(15441,'{$IFCONTROL:\"{#IFNAME}\"}=1 and ({17051}=2 and {17052}=1)','Interface {#IFNAME}({#IFALIAS}): Link down','',0,0,3,0,'Last value: {ITEM.LASTVALUE1}.\r\nInterface is down','',15428,0,0,2,1,'{17051}<>2',0,'',0),(15442,'{$IFCONTROL:\"{#IFNAME}\"}=1 and ({17053}=2 and {17054}=1)','Interface {#IFNAME}({#IFALIAS}): Link down','',0,0,3,0,'Last value: {ITEM.LASTVALUE1}.\r\nInterface is down','',15428,0,0,2,1,'{17053}<>2',0,'',0),(15443,'{$IFCONTROL:\"{#IFNAME}\"}=1 and ({17055}=2 and {17056}=1)','Interface {#IFNAME}({#IFALIAS}): Link down','',0,0,3,0,'Last value: {ITEM.LASTVALUE1}.\r\nInterface is down','',15428,0,0,2,1,'{17055}<>2',0,'',0),(15444,'{$IFCONTROL:\"{#IFNAME}\"}=1 and ({17057}=2 and {17058}=1)','Interface {#IFNAME}({#IFALIAS}): Link down','',0,0,3,0,'Last value: {ITEM.LASTVALUE1}.\r\nInterface is down','',15428,0,0,2,1,'{17057}<>2',0,'',0),(15445,'{$IFCONTROL:\"{#IFNAME}\"}=1 and ({17059}=2 and {17060}=1)','Interface {#IFNAME}({#IFALIAS}): Link down','',0,0,3,0,'Last value: {ITEM.LASTVALUE1}.\r\nInterface is down','',15428,0,0,2,1,'{17059}<>2',0,'',0),(15446,'{$IFCONTROL:\"{#IFNAME}\"}=1 and ({17061}=2 and {17062}=1)','Interface {#IFNAME}({#IFALIAS}): Link down','',0,0,3,0,'Last value: {ITEM.LASTVALUE1}.\r\nInterface is down','',15428,0,0,2,1,'{17061}<>2',0,'',0),(15447,'{$IFCONTROL:\"{#IFNAME}\"}=1 and ({17063}=2 and {17064}=1)','Interface {#IFNAME}({#IFALIAS}): Link down','',0,0,3,0,'Last value: {ITEM.LASTVALUE1}.\r\nInterface is down','',15428,0,0,2,1,'{17063}<>2',0,'',0),(15448,'{$IFCONTROL:\"{#IFNAME}\"}=1 and ({17065}=2 and {17066}=1)','Interface {#IFNAME}({#IFALIAS}): Link down','',0,0,3,0,'Last value: {ITEM.LASTVALUE1}.\r\nInterface is down','',15428,0,0,2,1,'{17065}<>2',0,'',0),(15449,'{$IFCONTROL:\"{#IFNAME}\"}=1 and ({17067}=2 and {17068}=1)','Interface {#IFNAME}({#IFALIAS}): Link down','',0,0,3,0,'Last value: {ITEM.LASTVALUE1}.\r\nInterface is down','',15428,0,0,2,1,'{17067}<>2',0,'',0),(15450,'{$IFCONTROL:\"{#IFNAME}\"}=1 and ({17069}=2 and {17070}=1)','Interface {#IFNAME}({#IFALIAS}): Link down','',0,0,3,0,'Last value: {ITEM.LASTVALUE1}.\r\nInterface is down','',15428,0,0,2,1,'{17069}<>2',0,'',0),(15451,'{$IFCONTROL:\"{#IFNAME}\"}=1 and ({17071}=2 and {17072}=1)','Interface {#IFNAME}({#IFALIAS}): Link down','',0,0,3,0,'Last value: {ITEM.LASTVALUE1}.\r\nInterface is down','',15428,0,0,2,1,'{17071}<>2',0,'',0),(15512,'{$IFCONTROL:\"{#IFNAME}\"}=1 and ({17273}=2 and {17274}=1)','Interface {#IFNAME}({#IFALIAS}): Link down','',0,0,3,0,'Last value: {ITEM.LASTVALUE1}.\r\nInterface is down','',NULL,0,0,2,1,'{17273}<>2',0,'',0),(15516,'{$IFCONTROL:\"{#IFNAME}\"}=1 and ({17285}=2 and {17286}=1)','Interface {#IFNAME}({#IFALIAS}): Link down','',0,0,3,0,'Last value: {ITEM.LASTVALUE1}.\r\nInterface is down','',15512,0,0,2,1,'{17285}<>2',0,'',0),(15550,'({17417}>({$IF_UTIL_MAX:\"{#IFNAME}\"}/100)*{17418} or\r\n{17419}>({$IF_UTIL_MAX:\"{#IFNAME}\"}/100)*{17418}) and\r\n{17418}>0','Interface {#IFDESCR}: High bandwidth usage >{$IF_UTIL_MAX:\"{#IFNAME}\"}%','',0,0,2,0,'Last value: {ITEM.LASTVALUE1}.','',NULL,0,0,2,1,'{17417}<(({$IF_UTIL_MAX:\"{#IFNAME}\"}-3)/100)*{17418} and\r\n{17419}<(({$IF_UTIL_MAX:\"{#IFNAME}\"}-3)/100)*{17418}',0,'',1),(15551,'{17420}>{$IF_ERRORS_WARN:\"{#IFNAME}\"}\r\nor {17421}>{$IF_ERRORS_WARN:\"{#IFNAME}\"}','Interface {#IFDESCR}: High error rate','',0,0,2,0,'Last value: {ITEM.LASTVALUE1}.\r\nRecovers when below 80% of {$IF_ERRORS_WARN:\"{#IFNAME}\"} threshold','',NULL,0,0,2,1,'{17420}<{$IF_ERRORS_WARN:\"{#IFNAME}\"}*0.8\r\nand {17421}<{$IF_ERRORS_WARN:\"{#IFNAME}\"}*0.8',0,'',1),(15552,'{17422}<0 and {17423}>0\r\nand (\r\n{17424}=6 or\r\n{17424}=7 or\r\n{17424}=11 or\r\n{17424}=62 or\r\n{17424}=69 or\r\n{17424}=117\r\n)\r\nand\r\n({17425}<>2)\r\n','Interface {#IFDESCR}: Ethernet has changed to lower speed than it was before','',0,0,1,0,'Last value: {ITEM.LASTVALUE1}.\r\nThis Ethernet connection has transitioned down from its known maximum speed. This might be a sign of autonegotiation issues. Ack to close.','',NULL,0,0,2,1,'({17422}>0 and {17426}>0) or\r\n({17425}=2)',0,'',1),(15553,'({17427}>({$IF_UTIL_MAX:\"{#IFNAME}\"}/100)*{17428} or\r\n{17429}>({$IF_UTIL_MAX:\"{#IFNAME}\"}/100)*{17428}) and\r\n{17428}>0','Interface {#IFDESCR}: High bandwidth usage >{$IF_UTIL_MAX:\"{#IFNAME}\"}%','',0,0,2,0,'Last value: {ITEM.LASTVALUE1}.','',15550,0,0,2,1,'{17427}<(({$IF_UTIL_MAX:\"{#IFNAME}\"}-3)/100)*{17428} and\r\n{17429}<(({$IF_UTIL_MAX:\"{#IFNAME}\"}-3)/100)*{17428}',0,'',1),(15554,'({17430}>({$IF_UTIL_MAX:\"{#IFNAME}\"}/100)*{17431} or\r\n{17432}>({$IF_UTIL_MAX:\"{#IFNAME}\"}/100)*{17431}) and\r\n{17431}>0','Interface {#IFDESCR}: High bandwidth usage >{$IF_UTIL_MAX:\"{#IFNAME}\"}%','',0,0,2,0,'Last value: {ITEM.LASTVALUE1}.','',15550,0,0,2,1,'{17430}<(({$IF_UTIL_MAX:\"{#IFNAME}\"}-3)/100)*{17431} and\r\n{17432}<(({$IF_UTIL_MAX:\"{#IFNAME}\"}-3)/100)*{17431}',0,'',1),(15555,'{17433}>{$IF_ERRORS_WARN:\"{#IFNAME}\"}\r\nor {17434}>{$IF_ERRORS_WARN:\"{#IFNAME}\"}','Interface {#IFDESCR}: High error rate','',0,0,2,0,'Last value: {ITEM.LASTVALUE1}.\r\nRecovers when below 80% of {$IF_ERRORS_WARN:\"{#IFNAME}\"} threshold','',15551,0,0,2,1,'{17433}<{$IF_ERRORS_WARN:\"{#IFNAME}\"}*0.8\r\nand {17434}<{$IF_ERRORS_WARN:\"{#IFNAME}\"}*0.8',0,'',1),(15556,'{17435}>{$IF_ERRORS_WARN:\"{#IFNAME}\"}\r\nor {17436}>{$IF_ERRORS_WARN:\"{#IFNAME}\"}','Interface {#IFDESCR}: High error rate','',0,0,2,0,'Last value: {ITEM.LASTVALUE1}.\r\nRecovers when below 80% of {$IF_ERRORS_WARN:\"{#IFNAME}\"} threshold','',15551,0,0,2,1,'{17435}<{$IF_ERRORS_WARN:\"{#IFNAME}\"}*0.8\r\nand {17436}<{$IF_ERRORS_WARN:\"{#IFNAME}\"}*0.8',0,'',1),(15557,'{17437}<0 and {17438}>0\r\nand (\r\n{17439}=6 or\r\n{17439}=7 or\r\n{17439}=11 or\r\n{17439}=62 or\r\n{17439}=69 or\r\n{17439}=117\r\n)\r\nand\r\n({17440}<>2)\r\n','Interface {#IFDESCR}: Ethernet has changed to lower speed than it was before','',0,0,1,0,'Last value: {ITEM.LASTVALUE1}.\r\nThis Ethernet connection has transitioned down from its known maximum speed. This might be a sign of autonegotiation issues. Ack to close.','',15552,0,0,2,1,'({17437}>0 and {17441}>0) or\r\n({17440}=2)',0,'',1),(15558,'{17442}<0 and {17443}>0\r\nand (\r\n{17444}=6 or\r\n{17444}=7 or\r\n{17444}=11 or\r\n{17444}=62 or\r\n{17444}=69 or\r\n{17444}=117\r\n)\r\nand\r\n({17445}<>2)\r\n','Interface {#IFDESCR}: Ethernet has changed to lower speed than it was before','',0,0,1,0,'Last value: {ITEM.LASTVALUE1}.\r\nThis Ethernet connection has transitioned down from its known maximum speed. This might be a sign of autonegotiation issues. Ack to close.','',15552,0,0,2,1,'({17442}>0 and {17446}>0) or\r\n({17445}=2)',0,'',1),(15559,'({17447}>({$IF_UTIL_MAX:\"{#IFNAME}\"}/100)*{17448} or\r\n{17449}>({$IF_UTIL_MAX:\"{#IFNAME}\"}/100)*{17448}) and\r\n{17448}>0','Interface {#IFDESCR}: High bandwidth usage >{$IF_UTIL_MAX:\"{#IFNAME}\"}%','',0,0,2,0,'Last value: {ITEM.LASTVALUE1}.','',NULL,0,0,2,1,'{17447}<(({$IF_UTIL_MAX:\"{#IFNAME}\"}-3)/100)*{17448} and\r\n{17449}<(({$IF_UTIL_MAX:\"{#IFNAME}\"}-3)/100)*{17448}',0,'',1),(15560,'{17450}>{$IF_ERRORS_WARN:\"{#IFNAME}\"}\r\nor {17451}>{$IF_ERRORS_WARN:\"{#IFNAME}\"}','Interface {#IFDESCR}: High error rate','',0,0,2,0,'Last value: {ITEM.LASTVALUE1}.\r\nRecovers when below 80% of {$IF_ERRORS_WARN:\"{#IFNAME}\"} threshold','',NULL,0,0,2,1,'{17450}<{$IF_ERRORS_WARN:\"{#IFNAME}\"}*0.8\r\nand {17451}<{$IF_ERRORS_WARN:\"{#IFNAME}\"}*0.8',0,'',1),(15561,'{17452}<0 and {17453}>0\r\nand (\r\n{17454}=6 or\r\n{17454}=7 or\r\n{17454}=11 or\r\n{17454}=62 or\r\n{17454}=69 or\r\n{17454}=117\r\n)\r\nand\r\n({17455}<>2)\r\n','Interface {#IFDESCR}: Ethernet has changed to lower speed than it was before','',0,0,1,0,'Last value: {ITEM.LASTVALUE1}.\r\nThis Ethernet connection has transitioned down from its known maximum speed. This might be a sign of autonegotiation issues. Ack to close.','',NULL,0,0,2,1,'({17452}>0 and {17456}>0) or\r\n({17455}=2)',0,'',1),(15562,'({17457}>({$IF_UTIL_MAX:\"{#IFNAME}\"}/100)*{17458} or\r\n{17459}>({$IF_UTIL_MAX:\"{#IFNAME}\"}/100)*{17458}) and\r\n{17458}>0','Interface {#IFDESCR}: High bandwidth usage >{$IF_UTIL_MAX:\"{#IFNAME}\"}%','',0,0,2,0,'Last value: {ITEM.LASTVALUE1}.','',15559,0,0,2,1,'{17457}<(({$IF_UTIL_MAX:\"{#IFNAME}\"}-3)/100)*{17458} and\r\n{17459}<(({$IF_UTIL_MAX:\"{#IFNAME}\"}-3)/100)*{17458}',0,'',1),(15563,'({17460}>({$IF_UTIL_MAX:\"{#IFNAME}\"}/100)*{17461} or\r\n{17462}>({$IF_UTIL_MAX:\"{#IFNAME}\"}/100)*{17461}) and\r\n{17461}>0','Interface {#IFDESCR}: High bandwidth usage >{$IF_UTIL_MAX:\"{#IFNAME}\"}%','',0,0,2,0,'Last value: {ITEM.LASTVALUE1}.','',15559,0,0,2,1,'{17460}<(({$IF_UTIL_MAX:\"{#IFNAME}\"}-3)/100)*{17461} and\r\n{17462}<(({$IF_UTIL_MAX:\"{#IFNAME}\"}-3)/100)*{17461}',0,'',1),(15564,'{17463}>{$IF_ERRORS_WARN:\"{#IFNAME}\"}\r\nor {17464}>{$IF_ERRORS_WARN:\"{#IFNAME}\"}','Interface {#IFDESCR}: High error rate','',0,0,2,0,'Last value: {ITEM.LASTVALUE1}.\r\nRecovers when below 80% of {$IF_ERRORS_WARN:\"{#IFNAME}\"} threshold','',15560,0,0,2,1,'{17463}<{$IF_ERRORS_WARN:\"{#IFNAME}\"}*0.8\r\nand {17464}<{$IF_ERRORS_WARN:\"{#IFNAME}\"}*0.8',0,'',1),(15565,'{17465}>{$IF_ERRORS_WARN:\"{#IFNAME}\"}\r\nor {17466}>{$IF_ERRORS_WARN:\"{#IFNAME}\"}','Interface {#IFDESCR}: High error rate','',0,0,2,0,'Last value: {ITEM.LASTVALUE1}.\r\nRecovers when below 80% of {$IF_ERRORS_WARN:\"{#IFNAME}\"} threshold','',15560,0,0,2,1,'{17465}<{$IF_ERRORS_WARN:\"{#IFNAME}\"}*0.8\r\nand {17466}<{$IF_ERRORS_WARN:\"{#IFNAME}\"}*0.8',0,'',1),(15566,'{17467}<0 and {17468}>0\r\nand (\r\n{17469}=6 or\r\n{17469}=7 or\r\n{17469}=11 or\r\n{17469}=62 or\r\n{17469}=69 or\r\n{17469}=117\r\n)\r\nand\r\n({17470}<>2)\r\n','Interface {#IFDESCR}: Ethernet has changed to lower speed than it was before','',0,0,1,0,'Last value: {ITEM.LASTVALUE1}.\r\nThis Ethernet connection has transitioned down from its known maximum speed. This might be a sign of autonegotiation issues. Ack to close.','',15561,0,0,2,1,'({17467}>0 and {17471}>0) or\r\n({17470}=2)',0,'',1),(15567,'{17472}<0 and {17473}>0\r\nand (\r\n{17474}=6 or\r\n{17474}=7 or\r\n{17474}=11 or\r\n{17474}=62 or\r\n{17474}=69 or\r\n{17474}=117\r\n)\r\nand\r\n({17475}<>2)\r\n','Interface {#IFDESCR}: Ethernet has changed to lower speed than it was before','',0,0,1,0,'Last value: {ITEM.LASTVALUE1}.\r\nThis Ethernet connection has transitioned down from its known maximum speed. This might be a sign of autonegotiation issues. Ack to close.','',15561,0,0,2,1,'({17472}>0 and {17476}>0) or\r\n({17475}=2)',0,'',1),(15568,'({17477}>({$IF_UTIL_MAX:\"{#IFNAME}\"}/100)*{17478} or\r\n{17479}>({$IF_UTIL_MAX:\"{#IFNAME}\"}/100)*{17478}) and\r\n{17478}>0','Interface {#IFNAME}({#IFALIAS}): High bandwidth usage >{$IF_UTIL_MAX:\"{#IFNAME}\"}%','',0,0,2,0,'Last value: {ITEM.LASTVALUE1}.','',NULL,0,0,2,1,'{17477}<(({$IF_UTIL_MAX:\"{#IFNAME}\"}-3)/100)*{17478} and\r\n{17479}<(({$IF_UTIL_MAX:\"{#IFNAME}\"}-3)/100)*{17478}',0,'',1),(15569,'{17480}>{$IF_ERRORS_WARN:\"{#IFNAME}\"}\r\nor {17481}>{$IF_ERRORS_WARN:\"{#IFNAME}\"}','Interface {#IFNAME}({#IFALIAS}): High error rate','',0,0,2,0,'Last value: {ITEM.LASTVALUE1}.\r\nRecovers when below 80% of {$IF_ERRORS_WARN:\"{#IFNAME}\"} threshold','',NULL,0,0,2,1,'{17480}<{$IF_ERRORS_WARN:\"{#IFNAME}\"}*0.8\r\nand {17481}<{$IF_ERRORS_WARN:\"{#IFNAME}\"}*0.8',0,'',1),(15570,'{17482}<0 and {17483}>0\r\nand (\r\n{17484}=6 or\r\n{17484}=7 or\r\n{17484}=11 or\r\n{17484}=62 or\r\n{17484}=69 or\r\n{17484}=117\r\n)\r\nand\r\n({17485}<>2)\r\n','Interface {#IFNAME}({#IFALIAS}): Ethernet has changed to lower speed than it was before','',0,0,1,0,'Last value: {ITEM.LASTVALUE1}.\r\nThis Ethernet connection has transitioned down from its known maximum speed. This might be a sign of autonegotiation issues. Ack to close.','',NULL,0,0,2,1,'({17482}>0 and {17486}>0) or\r\n({17485}=2)',0,'',1),(15571,'({17487}>({$IF_UTIL_MAX:\"{#IFNAME}\"}/100)*{17488} or\r\n{17489}>({$IF_UTIL_MAX:\"{#IFNAME}\"}/100)*{17488}) and\r\n{17488}>0','Interface {#IFNAME}({#IFALIAS}): High bandwidth usage >{$IF_UTIL_MAX:\"{#IFNAME}\"}%','',0,0,2,0,'Last value: {ITEM.LASTVALUE1}.','',15568,0,0,2,1,'{17487}<(({$IF_UTIL_MAX:\"{#IFNAME}\"}-3)/100)*{17488} and\r\n{17489}<(({$IF_UTIL_MAX:\"{#IFNAME}\"}-3)/100)*{17488}',0,'',1),(15572,'{17490}>{$IF_ERRORS_WARN:\"{#IFNAME}\"}\r\nor {17491}>{$IF_ERRORS_WARN:\"{#IFNAME}\"}','Interface {#IFNAME}({#IFALIAS}): High error rate','',0,0,2,0,'Last value: {ITEM.LASTVALUE1}.\r\nRecovers when below 80% of {$IF_ERRORS_WARN:\"{#IFNAME}\"} threshold','',15569,0,0,2,1,'{17490}<{$IF_ERRORS_WARN:\"{#IFNAME}\"}*0.8\r\nand {17491}<{$IF_ERRORS_WARN:\"{#IFNAME}\"}*0.8',0,'',1),(15573,'{17492}<0 and {17493}>0\r\nand (\r\n{17494}=6 or\r\n{17494}=7 or\r\n{17494}=11 or\r\n{17494}=62 or\r\n{17494}=69 or\r\n{17494}=117\r\n)\r\nand\r\n({17495}<>2)\r\n','Interface {#IFNAME}({#IFALIAS}): Ethernet has changed to lower speed than it was before','',0,0,1,0,'Last value: {ITEM.LASTVALUE1}.\r\nThis Ethernet connection has transitioned down from its known maximum speed. This might be a sign of autonegotiation issues. Ack to close.','',15570,0,0,2,1,'({17492}>0 and {17496}>0) or\r\n({17495}=2)',0,'',1),(15574,'({17497}>({$IF_UTIL_MAX:\"{#IFNAME}\"}/100)*{17498} or\r\n{17499}>({$IF_UTIL_MAX:\"{#IFNAME}\"}/100)*{17498}) and\r\n{17498}>0','Interface {#IFNAME}({#IFALIAS}): High bandwidth usage >{$IF_UTIL_MAX:\"{#IFNAME}\"}%','',0,0,2,0,'Last value: {ITEM.LASTVALUE1}.','',NULL,0,0,2,1,'{17497}<(({$IF_UTIL_MAX:\"{#IFNAME}\"}-3)/100)*{17498} and\r\n{17499}<(({$IF_UTIL_MAX:\"{#IFNAME}\"}-3)/100)*{17498}',0,'',1),(15575,'{17500}>{$IF_ERRORS_WARN:\"{#IFNAME}\"}\r\nor {17501}>{$IF_ERRORS_WARN:\"{#IFNAME}\"}','Interface {#IFNAME}({#IFALIAS}): High error rate','',0,0,2,0,'Last value: {ITEM.LASTVALUE1}.\r\nRecovers when below 80% of {$IF_ERRORS_WARN:\"{#IFNAME}\"} threshold','',NULL,0,0,2,1,'{17500}<{$IF_ERRORS_WARN:\"{#IFNAME}\"}*0.8\r\nand {17501}<{$IF_ERRORS_WARN:\"{#IFNAME}\"}*0.8',0,'',1),(15576,'{17502}<0 and {17503}>0\r\nand (\r\n{17504}=6 or\r\n{17504}=7 or\r\n{17504}=11 or\r\n{17504}=62 or\r\n{17504}=69 or\r\n{17504}=117\r\n)\r\nand\r\n({17505}<>2)\r\n','Interface {#IFNAME}({#IFALIAS}): Ethernet has changed to lower speed than it was before','',0,0,1,0,'Last value: {ITEM.LASTVALUE1}.\r\nThis Ethernet connection has transitioned down from its known maximum speed. This might be a sign of autonegotiation issues. Ack to close.','',NULL,0,0,2,1,'({17502}>0 and {17506}>0) or\r\n({17505}=2)',0,'',1),(15577,'({17507}>({$IF_UTIL_MAX:\"{#IFNAME}\"}/100)*{17508} or\r\n{17509}>({$IF_UTIL_MAX:\"{#IFNAME}\"}/100)*{17508}) and\r\n{17508}>0','Interface {#IFNAME}({#IFALIAS}): High bandwidth usage >{$IF_UTIL_MAX:\"{#IFNAME}\"}%','',0,0,2,0,'Last value: {ITEM.LASTVALUE1}.','',NULL,0,0,2,1,'{17507}<(({$IF_UTIL_MAX:\"{#IFNAME}\"}-3)/100)*{17508} and\r\n{17509}<(({$IF_UTIL_MAX:\"{#IFNAME}\"}-3)/100)*{17508}',0,'',1),(15578,'{17510}>{$IF_ERRORS_WARN:\"{#IFNAME}\"}\r\nor {17511}>{$IF_ERRORS_WARN:\"{#IFNAME}\"}','Interface {#IFNAME}({#IFALIAS}): High error rate','',0,0,2,0,'Last value: {ITEM.LASTVALUE1}.\r\nRecovers when below 80% of {$IF_ERRORS_WARN:\"{#IFNAME}\"} threshold','',NULL,0,0,2,1,'{17510}<{$IF_ERRORS_WARN:\"{#IFNAME}\"}*0.8\r\nand {17511}<{$IF_ERRORS_WARN:\"{#IFNAME}\"}*0.8',0,'',1),(15579,'{17512}<0 and {17513}>0\r\nand (\r\n{17514}=6 or\r\n{17514}=7 or\r\n{17514}=11 or\r\n{17514}=62 or\r\n{17514}=69 or\r\n{17514}=117\r\n)\r\nand\r\n({17515}<>2)\r\n','Interface {#IFNAME}({#IFALIAS}): Ethernet has changed to lower speed than it was before','',0,0,1,0,'Last value: {ITEM.LASTVALUE1}.\r\nThis Ethernet connection has transitioned down from its known maximum speed. This might be a sign of autonegotiation issues. Ack to close.','',NULL,0,0,2,1,'({17512}>0 and {17516}>0) or\r\n({17515}=2)',0,'',1),(15580,'({17517}>({$IF_UTIL_MAX:\"{#IFNAME}\"}/100)*{17518} or\r\n{17519}>({$IF_UTIL_MAX:\"{#IFNAME}\"}/100)*{17518}) and\r\n{17518}>0','Interface {#IFNAME}({#IFALIAS}): High bandwidth usage >{$IF_UTIL_MAX:\"{#IFNAME}\"}%','',0,0,2,0,'Last value: {ITEM.LASTVALUE1}.','',15577,0,0,2,1,'{17517}<(({$IF_UTIL_MAX:\"{#IFNAME}\"}-3)/100)*{17518} and\r\n{17519}<(({$IF_UTIL_MAX:\"{#IFNAME}\"}-3)/100)*{17518}',0,'',1),(15581,'({17520}>({$IF_UTIL_MAX:\"{#IFNAME}\"}/100)*{17521} or\r\n{17522}>({$IF_UTIL_MAX:\"{#IFNAME}\"}/100)*{17521}) and\r\n{17521}>0','Interface {#IFNAME}({#IFALIAS}): High bandwidth usage >{$IF_UTIL_MAX:\"{#IFNAME}\"}%','',0,0,2,0,'Last value: {ITEM.LASTVALUE1}.','',15577,0,0,2,1,'{17520}<(({$IF_UTIL_MAX:\"{#IFNAME}\"}-3)/100)*{17521} and\r\n{17522}<(({$IF_UTIL_MAX:\"{#IFNAME}\"}-3)/100)*{17521}',0,'',1),(15582,'({17523}>({$IF_UTIL_MAX:\"{#IFNAME}\"}/100)*{17524} or\r\n{17525}>({$IF_UTIL_MAX:\"{#IFNAME}\"}/100)*{17524}) and\r\n{17524}>0','Interface {#IFNAME}({#IFALIAS}): High bandwidth usage >{$IF_UTIL_MAX:\"{#IFNAME}\"}%','',0,0,2,0,'Last value: {ITEM.LASTVALUE1}.','',15577,0,0,2,1,'{17523}<(({$IF_UTIL_MAX:\"{#IFNAME}\"}-3)/100)*{17524} and\r\n{17525}<(({$IF_UTIL_MAX:\"{#IFNAME}\"}-3)/100)*{17524}',0,'',1),(15583,'({17526}>({$IF_UTIL_MAX:\"{#IFNAME}\"}/100)*{17527} or\r\n{17528}>({$IF_UTIL_MAX:\"{#IFNAME}\"}/100)*{17527}) and\r\n{17527}>0','Interface {#IFNAME}({#IFALIAS}): High bandwidth usage >{$IF_UTIL_MAX:\"{#IFNAME}\"}%','',0,0,2,0,'Last value: {ITEM.LASTVALUE1}.','',15577,0,0,2,1,'{17526}<(({$IF_UTIL_MAX:\"{#IFNAME}\"}-3)/100)*{17527} and\r\n{17528}<(({$IF_UTIL_MAX:\"{#IFNAME}\"}-3)/100)*{17527}',0,'',1),(15584,'({17529}>({$IF_UTIL_MAX:\"{#IFNAME}\"}/100)*{17530} or\r\n{17531}>({$IF_UTIL_MAX:\"{#IFNAME}\"}/100)*{17530}) and\r\n{17530}>0','Interface {#IFNAME}({#IFALIAS}): High bandwidth usage >{$IF_UTIL_MAX:\"{#IFNAME}\"}%','',0,0,2,0,'Last value: {ITEM.LASTVALUE1}.','',15577,0,0,2,1,'{17529}<(({$IF_UTIL_MAX:\"{#IFNAME}\"}-3)/100)*{17530} and\r\n{17531}<(({$IF_UTIL_MAX:\"{#IFNAME}\"}-3)/100)*{17530}',0,'',1),(15585,'({17532}>({$IF_UTIL_MAX:\"{#IFNAME}\"}/100)*{17533} or\r\n{17534}>({$IF_UTIL_MAX:\"{#IFNAME}\"}/100)*{17533}) and\r\n{17533}>0','Interface {#IFNAME}({#IFALIAS}): High bandwidth usage >{$IF_UTIL_MAX:\"{#IFNAME}\"}%','',0,0,2,0,'Last value: {ITEM.LASTVALUE1}.','',15577,0,0,2,1,'{17532}<(({$IF_UTIL_MAX:\"{#IFNAME}\"}-3)/100)*{17533} and\r\n{17534}<(({$IF_UTIL_MAX:\"{#IFNAME}\"}-3)/100)*{17533}',0,'',1),(15586,'({17535}>({$IF_UTIL_MAX:\"{#IFNAME}\"}/100)*{17536} or\r\n{17537}>({$IF_UTIL_MAX:\"{#IFNAME}\"}/100)*{17536}) and\r\n{17536}>0','Interface {#IFNAME}({#IFALIAS}): High bandwidth usage >{$IF_UTIL_MAX:\"{#IFNAME}\"}%','',0,0,2,0,'Last value: {ITEM.LASTVALUE1}.','',15577,0,0,2,1,'{17535}<(({$IF_UTIL_MAX:\"{#IFNAME}\"}-3)/100)*{17536} and\r\n{17537}<(({$IF_UTIL_MAX:\"{#IFNAME}\"}-3)/100)*{17536}',0,'',1),(15587,'({17538}>({$IF_UTIL_MAX:\"{#IFNAME}\"}/100)*{17539} or\r\n{17540}>({$IF_UTIL_MAX:\"{#IFNAME}\"}/100)*{17539}) and\r\n{17539}>0','Interface {#IFNAME}({#IFALIAS}): High bandwidth usage >{$IF_UTIL_MAX:\"{#IFNAME}\"}%','',0,0,2,0,'Last value: {ITEM.LASTVALUE1}.','',15577,0,0,2,1,'{17538}<(({$IF_UTIL_MAX:\"{#IFNAME}\"}-3)/100)*{17539} and\r\n{17540}<(({$IF_UTIL_MAX:\"{#IFNAME}\"}-3)/100)*{17539}',0,'',1),(15588,'({17541}>({$IF_UTIL_MAX:\"{#IFNAME}\"}/100)*{17542} or\r\n{17543}>({$IF_UTIL_MAX:\"{#IFNAME}\"}/100)*{17542}) and\r\n{17542}>0','Interface {#IFNAME}({#IFALIAS}): High bandwidth usage >{$IF_UTIL_MAX:\"{#IFNAME}\"}%','',0,0,2,0,'Last value: {ITEM.LASTVALUE1}.','',15577,0,0,2,1,'{17541}<(({$IF_UTIL_MAX:\"{#IFNAME}\"}-3)/100)*{17542} and\r\n{17543}<(({$IF_UTIL_MAX:\"{#IFNAME}\"}-3)/100)*{17542}',0,'',1),(15589,'({17544}>({$IF_UTIL_MAX:\"{#IFNAME}\"}/100)*{17545} or\r\n{17546}>({$IF_UTIL_MAX:\"{#IFNAME}\"}/100)*{17545}) and\r\n{17545}>0','Interface {#IFNAME}({#IFALIAS}): High bandwidth usage >{$IF_UTIL_MAX:\"{#IFNAME}\"}%','',0,0,2,0,'Last value: {ITEM.LASTVALUE1}.','',15577,0,0,2,1,'{17544}<(({$IF_UTIL_MAX:\"{#IFNAME}\"}-3)/100)*{17545} and\r\n{17546}<(({$IF_UTIL_MAX:\"{#IFNAME}\"}-3)/100)*{17545}',0,'',1),(15590,'({17547}>({$IF_UTIL_MAX:\"{#IFNAME}\"}/100)*{17548} or\r\n{17549}>({$IF_UTIL_MAX:\"{#IFNAME}\"}/100)*{17548}) and\r\n{17548}>0','Interface {#IFNAME}({#IFALIAS}): High bandwidth usage >{$IF_UTIL_MAX:\"{#IFNAME}\"}%','',0,0,2,0,'Last value: {ITEM.LASTVALUE1}.','',15577,0,0,2,1,'{17547}<(({$IF_UTIL_MAX:\"{#IFNAME}\"}-3)/100)*{17548} and\r\n{17549}<(({$IF_UTIL_MAX:\"{#IFNAME}\"}-3)/100)*{17548}',0,'',1),(15591,'({17550}>({$IF_UTIL_MAX:\"{#IFNAME}\"}/100)*{17551} or\r\n{17552}>({$IF_UTIL_MAX:\"{#IFNAME}\"}/100)*{17551}) and\r\n{17551}>0','Interface {#IFNAME}({#IFALIAS}): High bandwidth usage >{$IF_UTIL_MAX:\"{#IFNAME}\"}%','',0,0,2,0,'Last value: {ITEM.LASTVALUE1}.','',15577,0,0,2,1,'{17550}<(({$IF_UTIL_MAX:\"{#IFNAME}\"}-3)/100)*{17551} and\r\n{17552}<(({$IF_UTIL_MAX:\"{#IFNAME}\"}-3)/100)*{17551}',0,'',1),(15592,'({17553}>({$IF_UTIL_MAX:\"{#IFNAME}\"}/100)*{17554} or\r\n{17555}>({$IF_UTIL_MAX:\"{#IFNAME}\"}/100)*{17554}) and\r\n{17554}>0','Interface {#IFNAME}({#IFALIAS}): High bandwidth usage >{$IF_UTIL_MAX:\"{#IFNAME}\"}%','',0,0,2,0,'Last value: {ITEM.LASTVALUE1}.','',15577,0,0,2,1,'{17553}<(({$IF_UTIL_MAX:\"{#IFNAME}\"}-3)/100)*{17554} and\r\n{17555}<(({$IF_UTIL_MAX:\"{#IFNAME}\"}-3)/100)*{17554}',0,'',1),(15593,'({17556}>({$IF_UTIL_MAX:\"{#IFNAME}\"}/100)*{17557} or\r\n{17558}>({$IF_UTIL_MAX:\"{#IFNAME}\"}/100)*{17557}) and\r\n{17557}>0','Interface {#IFNAME}({#IFALIAS}): High bandwidth usage >{$IF_UTIL_MAX:\"{#IFNAME}\"}%','',0,0,2,0,'Last value: {ITEM.LASTVALUE1}.','',15577,0,0,2,1,'{17556}<(({$IF_UTIL_MAX:\"{#IFNAME}\"}-3)/100)*{17557} and\r\n{17558}<(({$IF_UTIL_MAX:\"{#IFNAME}\"}-3)/100)*{17557}',0,'',1),(15594,'({17559}>({$IF_UTIL_MAX:\"{#IFNAME}\"}/100)*{17560} or\r\n{17561}>({$IF_UTIL_MAX:\"{#IFNAME}\"}/100)*{17560}) and\r\n{17560}>0','Interface {#IFNAME}({#IFALIAS}): High bandwidth usage >{$IF_UTIL_MAX:\"{#IFNAME}\"}%','',0,0,2,0,'Last value: {ITEM.LASTVALUE1}.','',15577,0,0,2,1,'{17559}<(({$IF_UTIL_MAX:\"{#IFNAME}\"}-3)/100)*{17560} and\r\n{17561}<(({$IF_UTIL_MAX:\"{#IFNAME}\"}-3)/100)*{17560}',0,'',1),(15595,'({17562}>({$IF_UTIL_MAX:\"{#IFNAME}\"}/100)*{17563} or\r\n{17564}>({$IF_UTIL_MAX:\"{#IFNAME}\"}/100)*{17563}) and\r\n{17563}>0','Interface {#IFNAME}({#IFALIAS}): High bandwidth usage >{$IF_UTIL_MAX:\"{#IFNAME}\"}%','',0,0,2,0,'Last value: {ITEM.LASTVALUE1}.','',15577,0,0,2,1,'{17562}<(({$IF_UTIL_MAX:\"{#IFNAME}\"}-3)/100)*{17563} and\r\n{17564}<(({$IF_UTIL_MAX:\"{#IFNAME}\"}-3)/100)*{17563}',0,'',1),(15596,'({17565}>({$IF_UTIL_MAX:\"{#IFNAME}\"}/100)*{17566} or\r\n{17567}>({$IF_UTIL_MAX:\"{#IFNAME}\"}/100)*{17566}) and\r\n{17566}>0','Interface {#IFNAME}({#IFALIAS}): High bandwidth usage >{$IF_UTIL_MAX:\"{#IFNAME}\"}%','',0,0,2,0,'Last value: {ITEM.LASTVALUE1}.','',15577,0,0,2,1,'{17565}<(({$IF_UTIL_MAX:\"{#IFNAME}\"}-3)/100)*{17566} and\r\n{17567}<(({$IF_UTIL_MAX:\"{#IFNAME}\"}-3)/100)*{17566}',0,'',1),(15597,'({17568}>({$IF_UTIL_MAX:\"{#IFNAME}\"}/100)*{17569} or\r\n{17570}>({$IF_UTIL_MAX:\"{#IFNAME}\"}/100)*{17569}) and\r\n{17569}>0','Interface {#IFNAME}({#IFALIAS}): High bandwidth usage >{$IF_UTIL_MAX:\"{#IFNAME}\"}%','',0,0,2,0,'Last value: {ITEM.LASTVALUE1}.','',15577,0,0,2,1,'{17568}<(({$IF_UTIL_MAX:\"{#IFNAME}\"}-3)/100)*{17569} and\r\n{17570}<(({$IF_UTIL_MAX:\"{#IFNAME}\"}-3)/100)*{17569}',0,'',1),(15598,'({17571}>({$IF_UTIL_MAX:\"{#IFNAME}\"}/100)*{17572} or\r\n{17573}>({$IF_UTIL_MAX:\"{#IFNAME}\"}/100)*{17572}) and\r\n{17572}>0','Interface {#IFNAME}({#IFALIAS}): High bandwidth usage >{$IF_UTIL_MAX:\"{#IFNAME}\"}%','',0,0,2,0,'Last value: {ITEM.LASTVALUE1}.','',15577,0,0,2,1,'{17571}<(({$IF_UTIL_MAX:\"{#IFNAME}\"}-3)/100)*{17572} and\r\n{17573}<(({$IF_UTIL_MAX:\"{#IFNAME}\"}-3)/100)*{17572}',0,'',1),(15599,'({17574}>({$IF_UTIL_MAX:\"{#IFNAME}\"}/100)*{17575} or\r\n{17576}>({$IF_UTIL_MAX:\"{#IFNAME}\"}/100)*{17575}) and\r\n{17575}>0','Interface {#IFNAME}({#IFALIAS}): High bandwidth usage >{$IF_UTIL_MAX:\"{#IFNAME}\"}%','',0,0,2,0,'Last value: {ITEM.LASTVALUE1}.','',15577,0,0,2,1,'{17574}<(({$IF_UTIL_MAX:\"{#IFNAME}\"}-3)/100)*{17575} and\r\n{17576}<(({$IF_UTIL_MAX:\"{#IFNAME}\"}-3)/100)*{17575}',0,'',1),(15600,'{17577}>{$IF_ERRORS_WARN:\"{#IFNAME}\"}\r\nor {17578}>{$IF_ERRORS_WARN:\"{#IFNAME}\"}','Interface {#IFNAME}({#IFALIAS}): High error rate','',0,0,2,0,'Last value: {ITEM.LASTVALUE1}.\r\nRecovers when below 80% of {$IF_ERRORS_WARN:\"{#IFNAME}\"} threshold','',15578,0,0,2,1,'{17577}<{$IF_ERRORS_WARN:\"{#IFNAME}\"}*0.8\r\nand {17578}<{$IF_ERRORS_WARN:\"{#IFNAME}\"}*0.8',0,'',1),(15601,'{17579}>{$IF_ERRORS_WARN:\"{#IFNAME}\"}\r\nor {17580}>{$IF_ERRORS_WARN:\"{#IFNAME}\"}','Interface {#IFNAME}({#IFALIAS}): High error rate','',0,0,2,0,'Last value: {ITEM.LASTVALUE1}.\r\nRecovers when below 80% of {$IF_ERRORS_WARN:\"{#IFNAME}\"} threshold','',15578,0,0,2,1,'{17579}<{$IF_ERRORS_WARN:\"{#IFNAME}\"}*0.8\r\nand {17580}<{$IF_ERRORS_WARN:\"{#IFNAME}\"}*0.8',0,'',1),(15602,'{17581}>{$IF_ERRORS_WARN:\"{#IFNAME}\"}\r\nor {17582}>{$IF_ERRORS_WARN:\"{#IFNAME}\"}','Interface {#IFNAME}({#IFALIAS}): High error rate','',0,0,2,0,'Last value: {ITEM.LASTVALUE1}.\r\nRecovers when below 80% of {$IF_ERRORS_WARN:\"{#IFNAME}\"} threshold','',15578,0,0,2,1,'{17581}<{$IF_ERRORS_WARN:\"{#IFNAME}\"}*0.8\r\nand {17582}<{$IF_ERRORS_WARN:\"{#IFNAME}\"}*0.8',0,'',1),(15603,'{17583}>{$IF_ERRORS_WARN:\"{#IFNAME}\"}\r\nor {17584}>{$IF_ERRORS_WARN:\"{#IFNAME}\"}','Interface {#IFNAME}({#IFALIAS}): High error rate','',0,0,2,0,'Last value: {ITEM.LASTVALUE1}.\r\nRecovers when below 80% of {$IF_ERRORS_WARN:\"{#IFNAME}\"} threshold','',15578,0,0,2,1,'{17583}<{$IF_ERRORS_WARN:\"{#IFNAME}\"}*0.8\r\nand {17584}<{$IF_ERRORS_WARN:\"{#IFNAME}\"}*0.8',0,'',1),(15604,'{17585}>{$IF_ERRORS_WARN:\"{#IFNAME}\"}\r\nor {17586}>{$IF_ERRORS_WARN:\"{#IFNAME}\"}','Interface {#IFNAME}({#IFALIAS}): High error rate','',0,0,2,0,'Last value: {ITEM.LASTVALUE1}.\r\nRecovers when below 80% of {$IF_ERRORS_WARN:\"{#IFNAME}\"} threshold','',15578,0,0,2,1,'{17585}<{$IF_ERRORS_WARN:\"{#IFNAME}\"}*0.8\r\nand {17586}<{$IF_ERRORS_WARN:\"{#IFNAME}\"}*0.8',0,'',1),(15605,'{17587}>{$IF_ERRORS_WARN:\"{#IFNAME}\"}\r\nor {17588}>{$IF_ERRORS_WARN:\"{#IFNAME}\"}','Interface {#IFNAME}({#IFALIAS}): High error rate','',0,0,2,0,'Last value: {ITEM.LASTVALUE1}.\r\nRecovers when below 80% of {$IF_ERRORS_WARN:\"{#IFNAME}\"} threshold','',15578,0,0,2,1,'{17587}<{$IF_ERRORS_WARN:\"{#IFNAME}\"}*0.8\r\nand {17588}<{$IF_ERRORS_WARN:\"{#IFNAME}\"}*0.8',0,'',1),(15606,'{17589}>{$IF_ERRORS_WARN:\"{#IFNAME}\"}\r\nor {17590}>{$IF_ERRORS_WARN:\"{#IFNAME}\"}','Interface {#IFNAME}({#IFALIAS}): High error rate','',0,0,2,0,'Last value: {ITEM.LASTVALUE1}.\r\nRecovers when below 80% of {$IF_ERRORS_WARN:\"{#IFNAME}\"} threshold','',15578,0,0,2,1,'{17589}<{$IF_ERRORS_WARN:\"{#IFNAME}\"}*0.8\r\nand {17590}<{$IF_ERRORS_WARN:\"{#IFNAME}\"}*0.8',0,'',1),(15607,'{17591}>{$IF_ERRORS_WARN:\"{#IFNAME}\"}\r\nor {17592}>{$IF_ERRORS_WARN:\"{#IFNAME}\"}','Interface {#IFNAME}({#IFALIAS}): High error rate','',0,0,2,0,'Last value: {ITEM.LASTVALUE1}.\r\nRecovers when below 80% of {$IF_ERRORS_WARN:\"{#IFNAME}\"} threshold','',15578,0,0,2,1,'{17591}<{$IF_ERRORS_WARN:\"{#IFNAME}\"}*0.8\r\nand {17592}<{$IF_ERRORS_WARN:\"{#IFNAME}\"}*0.8',0,'',1),(15608,'{17593}>{$IF_ERRORS_WARN:\"{#IFNAME}\"}\r\nor {17594}>{$IF_ERRORS_WARN:\"{#IFNAME}\"}','Interface {#IFNAME}({#IFALIAS}): High error rate','',0,0,2,0,'Last value: {ITEM.LASTVALUE1}.\r\nRecovers when below 80% of {$IF_ERRORS_WARN:\"{#IFNAME}\"} threshold','',15578,0,0,2,1,'{17593}<{$IF_ERRORS_WARN:\"{#IFNAME}\"}*0.8\r\nand {17594}<{$IF_ERRORS_WARN:\"{#IFNAME}\"}*0.8',0,'',1),(15609,'{17595}>{$IF_ERRORS_WARN:\"{#IFNAME}\"}\r\nor {17596}>{$IF_ERRORS_WARN:\"{#IFNAME}\"}','Interface {#IFNAME}({#IFALIAS}): High error rate','',0,0,2,0,'Last value: {ITEM.LASTVALUE1}.\r\nRecovers when below 80% of {$IF_ERRORS_WARN:\"{#IFNAME}\"} threshold','',15578,0,0,2,1,'{17595}<{$IF_ERRORS_WARN:\"{#IFNAME}\"}*0.8\r\nand {17596}<{$IF_ERRORS_WARN:\"{#IFNAME}\"}*0.8',0,'',1),(15610,'{17597}>{$IF_ERRORS_WARN:\"{#IFNAME}\"}\r\nor {17598}>{$IF_ERRORS_WARN:\"{#IFNAME}\"}','Interface {#IFNAME}({#IFALIAS}): High error rate','',0,0,2,0,'Last value: {ITEM.LASTVALUE1}.\r\nRecovers when below 80% of {$IF_ERRORS_WARN:\"{#IFNAME}\"} threshold','',15578,0,0,2,1,'{17597}<{$IF_ERRORS_WARN:\"{#IFNAME}\"}*0.8\r\nand {17598}<{$IF_ERRORS_WARN:\"{#IFNAME}\"}*0.8',0,'',1),(15611,'{17599}>{$IF_ERRORS_WARN:\"{#IFNAME}\"}\r\nor {17600}>{$IF_ERRORS_WARN:\"{#IFNAME}\"}','Interface {#IFNAME}({#IFALIAS}): High error rate','',0,0,2,0,'Last value: {ITEM.LASTVALUE1}.\r\nRecovers when below 80% of {$IF_ERRORS_WARN:\"{#IFNAME}\"} threshold','',15578,0,0,2,1,'{17599}<{$IF_ERRORS_WARN:\"{#IFNAME}\"}*0.8\r\nand {17600}<{$IF_ERRORS_WARN:\"{#IFNAME}\"}*0.8',0,'',1),(15612,'{17601}>{$IF_ERRORS_WARN:\"{#IFNAME}\"}\r\nor {17602}>{$IF_ERRORS_WARN:\"{#IFNAME}\"}','Interface {#IFNAME}({#IFALIAS}): High error rate','',0,0,2,0,'Last value: {ITEM.LASTVALUE1}.\r\nRecovers when below 80% of {$IF_ERRORS_WARN:\"{#IFNAME}\"} threshold','',15578,0,0,2,1,'{17601}<{$IF_ERRORS_WARN:\"{#IFNAME}\"}*0.8\r\nand {17602}<{$IF_ERRORS_WARN:\"{#IFNAME}\"}*0.8',0,'',1),(15613,'{17603}>{$IF_ERRORS_WARN:\"{#IFNAME}\"}\r\nor {17604}>{$IF_ERRORS_WARN:\"{#IFNAME}\"}','Interface {#IFNAME}({#IFALIAS}): High error rate','',0,0,2,0,'Last value: {ITEM.LASTVALUE1}.\r\nRecovers when below 80% of {$IF_ERRORS_WARN:\"{#IFNAME}\"} threshold','',15578,0,0,2,1,'{17603}<{$IF_ERRORS_WARN:\"{#IFNAME}\"}*0.8\r\nand {17604}<{$IF_ERRORS_WARN:\"{#IFNAME}\"}*0.8',0,'',1),(15614,'{17605}>{$IF_ERRORS_WARN:\"{#IFNAME}\"}\r\nor {17606}>{$IF_ERRORS_WARN:\"{#IFNAME}\"}','Interface {#IFNAME}({#IFALIAS}): High error rate','',0,0,2,0,'Last value: {ITEM.LASTVALUE1}.\r\nRecovers when below 80% of {$IF_ERRORS_WARN:\"{#IFNAME}\"} threshold','',15578,0,0,2,1,'{17605}<{$IF_ERRORS_WARN:\"{#IFNAME}\"}*0.8\r\nand {17606}<{$IF_ERRORS_WARN:\"{#IFNAME}\"}*0.8',0,'',1),(15615,'{17607}>{$IF_ERRORS_WARN:\"{#IFNAME}\"}\r\nor {17608}>{$IF_ERRORS_WARN:\"{#IFNAME}\"}','Interface {#IFNAME}({#IFALIAS}): High error rate','',0,0,2,0,'Last value: {ITEM.LASTVALUE1}.\r\nRecovers when below 80% of {$IF_ERRORS_WARN:\"{#IFNAME}\"} threshold','',15578,0,0,2,1,'{17607}<{$IF_ERRORS_WARN:\"{#IFNAME}\"}*0.8\r\nand {17608}<{$IF_ERRORS_WARN:\"{#IFNAME}\"}*0.8',0,'',1),(15616,'{17609}>{$IF_ERRORS_WARN:\"{#IFNAME}\"}\r\nor {17610}>{$IF_ERRORS_WARN:\"{#IFNAME}\"}','Interface {#IFNAME}({#IFALIAS}): High error rate','',0,0,2,0,'Last value: {ITEM.LASTVALUE1}.\r\nRecovers when below 80% of {$IF_ERRORS_WARN:\"{#IFNAME}\"} threshold','',15578,0,0,2,1,'{17609}<{$IF_ERRORS_WARN:\"{#IFNAME}\"}*0.8\r\nand {17610}<{$IF_ERRORS_WARN:\"{#IFNAME}\"}*0.8',0,'',1),(15617,'{17611}>{$IF_ERRORS_WARN:\"{#IFNAME}\"}\r\nor {17612}>{$IF_ERRORS_WARN:\"{#IFNAME}\"}','Interface {#IFNAME}({#IFALIAS}): High error rate','',0,0,2,0,'Last value: {ITEM.LASTVALUE1}.\r\nRecovers when below 80% of {$IF_ERRORS_WARN:\"{#IFNAME}\"} threshold','',15578,0,0,2,1,'{17611}<{$IF_ERRORS_WARN:\"{#IFNAME}\"}*0.8\r\nand {17612}<{$IF_ERRORS_WARN:\"{#IFNAME}\"}*0.8',0,'',1),(15618,'{17613}>{$IF_ERRORS_WARN:\"{#IFNAME}\"}\r\nor {17614}>{$IF_ERRORS_WARN:\"{#IFNAME}\"}','Interface {#IFNAME}({#IFALIAS}): High error rate','',0,0,2,0,'Last value: {ITEM.LASTVALUE1}.\r\nRecovers when below 80% of {$IF_ERRORS_WARN:\"{#IFNAME}\"} threshold','',15578,0,0,2,1,'{17613}<{$IF_ERRORS_WARN:\"{#IFNAME}\"}*0.8\r\nand {17614}<{$IF_ERRORS_WARN:\"{#IFNAME}\"}*0.8',0,'',1),(15619,'{17615}>{$IF_ERRORS_WARN:\"{#IFNAME}\"}\r\nor {17616}>{$IF_ERRORS_WARN:\"{#IFNAME}\"}','Interface {#IFNAME}({#IFALIAS}): High error rate','',0,0,2,0,'Last value: {ITEM.LASTVALUE1}.\r\nRecovers when below 80% of {$IF_ERRORS_WARN:\"{#IFNAME}\"} threshold','',15578,0,0,2,1,'{17615}<{$IF_ERRORS_WARN:\"{#IFNAME}\"}*0.8\r\nand {17616}<{$IF_ERRORS_WARN:\"{#IFNAME}\"}*0.8',0,'',1),(15620,'{17617}<0 and {17618}>0\r\nand (\r\n{17619}=6 or\r\n{17619}=7 or\r\n{17619}=11 or\r\n{17619}=62 or\r\n{17619}=69 or\r\n{17619}=117\r\n)\r\nand\r\n({17620}<>2)\r\n','Interface {#IFNAME}({#IFALIAS}): Ethernet has changed to lower speed than it was before','',0,0,1,0,'Last value: {ITEM.LASTVALUE1}.\r\nThis Ethernet connection has transitioned down from its known maximum speed. This might be a sign of autonegotiation issues. Ack to close.','',15579,0,0,2,1,'({17617}>0 and {17621}>0) or\r\n({17620}=2)',0,'',1),(15621,'{17622}<0 and {17623}>0\r\nand (\r\n{17624}=6 or\r\n{17624}=7 or\r\n{17624}=11 or\r\n{17624}=62 or\r\n{17624}=69 or\r\n{17624}=117\r\n)\r\nand\r\n({17625}<>2)\r\n','Interface {#IFNAME}({#IFALIAS}): Ethernet has changed to lower speed than it was before','',0,0,1,0,'Last value: {ITEM.LASTVALUE1}.\r\nThis Ethernet connection has transitioned down from its known maximum speed. This might be a sign of autonegotiation issues. Ack to close.','',15579,0,0,2,1,'({17622}>0 and {17626}>0) or\r\n({17625}=2)',0,'',1),(15622,'{17627}<0 and {17628}>0\r\nand (\r\n{17629}=6 or\r\n{17629}=7 or\r\n{17629}=11 or\r\n{17629}=62 or\r\n{17629}=69 or\r\n{17629}=117\r\n)\r\nand\r\n({17630}<>2)\r\n','Interface {#IFNAME}({#IFALIAS}): Ethernet has changed to lower speed than it was before','',0,0,1,0,'Last value: {ITEM.LASTVALUE1}.\r\nThis Ethernet connection has transitioned down from its known maximum speed. This might be a sign of autonegotiation issues. Ack to close.','',15579,0,0,2,1,'({17627}>0 and {17631}>0) or\r\n({17630}=2)',0,'',1),(15623,'{17632}<0 and {17633}>0\r\nand (\r\n{17634}=6 or\r\n{17634}=7 or\r\n{17634}=11 or\r\n{17634}=62 or\r\n{17634}=69 or\r\n{17634}=117\r\n)\r\nand\r\n({17635}<>2)\r\n','Interface {#IFNAME}({#IFALIAS}): Ethernet has changed to lower speed than it was before','',0,0,1,0,'Last value: {ITEM.LASTVALUE1}.\r\nThis Ethernet connection has transitioned down from its known maximum speed. This might be a sign of autonegotiation issues. Ack to close.','',15579,0,0,2,1,'({17632}>0 and {17636}>0) or\r\n({17635}=2)',0,'',1),(15624,'{17637}<0 and {17638}>0\r\nand (\r\n{17639}=6 or\r\n{17639}=7 or\r\n{17639}=11 or\r\n{17639}=62 or\r\n{17639}=69 or\r\n{17639}=117\r\n)\r\nand\r\n({17640}<>2)\r\n','Interface {#IFNAME}({#IFALIAS}): Ethernet has changed to lower speed than it was before','',0,0,1,0,'Last value: {ITEM.LASTVALUE1}.\r\nThis Ethernet connection has transitioned down from its known maximum speed. This might be a sign of autonegotiation issues. Ack to close.','',15579,0,0,2,1,'({17637}>0 and {17641}>0) or\r\n({17640}=2)',0,'',1),(15625,'{17642}<0 and {17643}>0\r\nand (\r\n{17644}=6 or\r\n{17644}=7 or\r\n{17644}=11 or\r\n{17644}=62 or\r\n{17644}=69 or\r\n{17644}=117\r\n)\r\nand\r\n({17645}<>2)\r\n','Interface {#IFNAME}({#IFALIAS}): Ethernet has changed to lower speed than it was before','',0,0,1,0,'Last value: {ITEM.LASTVALUE1}.\r\nThis Ethernet connection has transitioned down from its known maximum speed. This might be a sign of autonegotiation issues. Ack to close.','',15579,0,0,2,1,'({17642}>0 and {17646}>0) or\r\n({17645}=2)',0,'',1),(15626,'{17647}<0 and {17648}>0\r\nand (\r\n{17649}=6 or\r\n{17649}=7 or\r\n{17649}=11 or\r\n{17649}=62 or\r\n{17649}=69 or\r\n{17649}=117\r\n)\r\nand\r\n({17650}<>2)\r\n','Interface {#IFNAME}({#IFALIAS}): Ethernet has changed to lower speed than it was before','',0,0,1,0,'Last value: {ITEM.LASTVALUE1}.\r\nThis Ethernet connection has transitioned down from its known maximum speed. This might be a sign of autonegotiation issues. Ack to close.','',15579,0,0,2,1,'({17647}>0 and {17651}>0) or\r\n({17650}=2)',0,'',1),(15627,'{17652}<0 and {17653}>0\r\nand (\r\n{17654}=6 or\r\n{17654}=7 or\r\n{17654}=11 or\r\n{17654}=62 or\r\n{17654}=69 or\r\n{17654}=117\r\n)\r\nand\r\n({17655}<>2)\r\n','Interface {#IFNAME}({#IFALIAS}): Ethernet has changed to lower speed than it was before','',0,0,1,0,'Last value: {ITEM.LASTVALUE1}.\r\nThis Ethernet connection has transitioned down from its known maximum speed. This might be a sign of autonegotiation issues. Ack to close.','',15579,0,0,2,1,'({17652}>0 and {17656}>0) or\r\n({17655}=2)',0,'',1),(15628,'{17657}<0 and {17658}>0\r\nand (\r\n{17659}=6 or\r\n{17659}=7 or\r\n{17659}=11 or\r\n{17659}=62 or\r\n{17659}=69 or\r\n{17659}=117\r\n)\r\nand\r\n({17660}<>2)\r\n','Interface {#IFNAME}({#IFALIAS}): Ethernet has changed to lower speed than it was before','',0,0,1,0,'Last value: {ITEM.LASTVALUE1}.\r\nThis Ethernet connection has transitioned down from its known maximum speed. This might be a sign of autonegotiation issues. Ack to close.','',15579,0,0,2,1,'({17657}>0 and {17661}>0) or\r\n({17660}=2)',0,'',1),(15629,'{17662}<0 and {17663}>0\r\nand (\r\n{17664}=6 or\r\n{17664}=7 or\r\n{17664}=11 or\r\n{17664}=62 or\r\n{17664}=69 or\r\n{17664}=117\r\n)\r\nand\r\n({17665}<>2)\r\n','Interface {#IFNAME}({#IFALIAS}): Ethernet has changed to lower speed than it was before','',0,0,1,0,'Last value: {ITEM.LASTVALUE1}.\r\nThis Ethernet connection has transitioned down from its known maximum speed. This might be a sign of autonegotiation issues. Ack to close.','',15579,0,0,2,1,'({17662}>0 and {17666}>0) or\r\n({17665}=2)',0,'',1),(15630,'{17667}<0 and {17668}>0\r\nand (\r\n{17669}=6 or\r\n{17669}=7 or\r\n{17669}=11 or\r\n{17669}=62 or\r\n{17669}=69 or\r\n{17669}=117\r\n)\r\nand\r\n({17670}<>2)\r\n','Interface {#IFNAME}({#IFALIAS}): Ethernet has changed to lower speed than it was before','',0,0,1,0,'Last value: {ITEM.LASTVALUE1}.\r\nThis Ethernet connection has transitioned down from its known maximum speed. This might be a sign of autonegotiation issues. Ack to close.','',15579,0,0,2,1,'({17667}>0 and {17671}>0) or\r\n({17670}=2)',0,'',1),(15631,'{17672}<0 and {17673}>0\r\nand (\r\n{17674}=6 or\r\n{17674}=7 or\r\n{17674}=11 or\r\n{17674}=62 or\r\n{17674}=69 or\r\n{17674}=117\r\n)\r\nand\r\n({17675}<>2)\r\n','Interface {#IFNAME}({#IFALIAS}): Ethernet has changed to lower speed than it was before','',0,0,1,0,'Last value: {ITEM.LASTVALUE1}.\r\nThis Ethernet connection has transitioned down from its known maximum speed. This might be a sign of autonegotiation issues. Ack to close.','',15579,0,0,2,1,'({17672}>0 and {17676}>0) or\r\n({17675}=2)',0,'',1),(15632,'{17677}<0 and {17678}>0\r\nand (\r\n{17679}=6 or\r\n{17679}=7 or\r\n{17679}=11 or\r\n{17679}=62 or\r\n{17679}=69 or\r\n{17679}=117\r\n)\r\nand\r\n({17680}<>2)\r\n','Interface {#IFNAME}({#IFALIAS}): Ethernet has changed to lower speed than it was before','',0,0,1,0,'Last value: {ITEM.LASTVALUE1}.\r\nThis Ethernet connection has transitioned down from its known maximum speed. This might be a sign of autonegotiation issues. Ack to close.','',15579,0,0,2,1,'({17677}>0 and {17681}>0) or\r\n({17680}=2)',0,'',1),(15633,'{17682}<0 and {17683}>0\r\nand (\r\n{17684}=6 or\r\n{17684}=7 or\r\n{17684}=11 or\r\n{17684}=62 or\r\n{17684}=69 or\r\n{17684}=117\r\n)\r\nand\r\n({17685}<>2)\r\n','Interface {#IFNAME}({#IFALIAS}): Ethernet has changed to lower speed than it was before','',0,0,1,0,'Last value: {ITEM.LASTVALUE1}.\r\nThis Ethernet connection has transitioned down from its known maximum speed. This might be a sign of autonegotiation issues. Ack to close.','',15579,0,0,2,1,'({17682}>0 and {17686}>0) or\r\n({17685}=2)',0,'',1),(15634,'{17687}<0 and {17688}>0\r\nand (\r\n{17689}=6 or\r\n{17689}=7 or\r\n{17689}=11 or\r\n{17689}=62 or\r\n{17689}=69 or\r\n{17689}=117\r\n)\r\nand\r\n({17690}<>2)\r\n','Interface {#IFNAME}({#IFALIAS}): Ethernet has changed to lower speed than it was before','',0,0,1,0,'Last value: {ITEM.LASTVALUE1}.\r\nThis Ethernet connection has transitioned down from its known maximum speed. This might be a sign of autonegotiation issues. Ack to close.','',15579,0,0,2,1,'({17687}>0 and {17691}>0) or\r\n({17690}=2)',0,'',1),(15635,'{17692}<0 and {17693}>0\r\nand (\r\n{17694}=6 or\r\n{17694}=7 or\r\n{17694}=11 or\r\n{17694}=62 or\r\n{17694}=69 or\r\n{17694}=117\r\n)\r\nand\r\n({17695}<>2)\r\n','Interface {#IFNAME}({#IFALIAS}): Ethernet has changed to lower speed than it was before','',0,0,1,0,'Last value: {ITEM.LASTVALUE1}.\r\nThis Ethernet connection has transitioned down from its known maximum speed. This might be a sign of autonegotiation issues. Ack to close.','',15579,0,0,2,1,'({17692}>0 and {17696}>0) or\r\n({17695}=2)',0,'',1),(15636,'{17697}<0 and {17698}>0\r\nand (\r\n{17699}=6 or\r\n{17699}=7 or\r\n{17699}=11 or\r\n{17699}=62 or\r\n{17699}=69 or\r\n{17699}=117\r\n)\r\nand\r\n({17700}<>2)\r\n','Interface {#IFNAME}({#IFALIAS}): Ethernet has changed to lower speed than it was before','',0,0,1,0,'Last value: {ITEM.LASTVALUE1}.\r\nThis Ethernet connection has transitioned down from its known maximum speed. This might be a sign of autonegotiation issues. Ack to close.','',15579,0,0,2,1,'({17697}>0 and {17701}>0) or\r\n({17700}=2)',0,'',1),(15637,'{17702}<0 and {17703}>0\r\nand (\r\n{17704}=6 or\r\n{17704}=7 or\r\n{17704}=11 or\r\n{17704}=62 or\r\n{17704}=69 or\r\n{17704}=117\r\n)\r\nand\r\n({17705}<>2)\r\n','Interface {#IFNAME}({#IFALIAS}): Ethernet has changed to lower speed than it was before','',0,0,1,0,'Last value: {ITEM.LASTVALUE1}.\r\nThis Ethernet connection has transitioned down from its known maximum speed. This might be a sign of autonegotiation issues. Ack to close.','',15579,0,0,2,1,'({17702}>0 and {17706}>0) or\r\n({17705}=2)',0,'',1),(15638,'{17707}<0 and {17708}>0\r\nand (\r\n{17709}=6 or\r\n{17709}=7 or\r\n{17709}=11 or\r\n{17709}=62 or\r\n{17709}=69 or\r\n{17709}=117\r\n)\r\nand\r\n({17710}<>2)\r\n','Interface {#IFNAME}({#IFALIAS}): Ethernet has changed to lower speed than it was before','',0,0,1,0,'Last value: {ITEM.LASTVALUE1}.\r\nThis Ethernet connection has transitioned down from its known maximum speed. This might be a sign of autonegotiation issues. Ack to close.','',15579,0,0,2,1,'({17707}>0 and {17711}>0) or\r\n({17710}=2)',0,'',1),(15639,'{17712}<0 and {17713}>0\r\nand (\r\n{17714}=6 or\r\n{17714}=7 or\r\n{17714}=11 or\r\n{17714}=62 or\r\n{17714}=69 or\r\n{17714}=117\r\n)\r\nand\r\n({17715}<>2)\r\n','Interface {#IFNAME}({#IFALIAS}): Ethernet has changed to lower speed than it was before','',0,0,1,0,'Last value: {ITEM.LASTVALUE1}.\r\nThis Ethernet connection has transitioned down from its known maximum speed. This might be a sign of autonegotiation issues. Ack to close.','',15579,0,0,2,1,'({17712}>0 and {17716}>0) or\r\n({17715}=2)',0,'',1),(15808,'{17885}<20','Free inodes is less than 20% on volume /','',0,0,2,0,'','',NULL,0,0,4,0,'',0,'',0),(15809,'{17886}<20','Free inodes is less than 20% on volume /data','',0,0,2,0,'','',NULL,0,0,4,0,'',0,'',0),(15810,'{17887}<20','Free inodes is less than 20% on volume /home','',0,0,2,1536201587,'','',NULL,0,0,4,0,'',0,'',0),(15811,'{17888}<20','Free inodes is less than 20% on volume /boot','',0,0,2,0,'','',NULL,0,0,4,0,'',0,'',0),(15812,'{17889}<20','Free disk space is less than 20% on volume /','',0,0,2,0,'','',NULL,0,0,4,0,'',0,'',0),(15813,'{17890}<20','Free disk space is less than 20% on volume /data','',0,0,2,0,'','',NULL,0,0,4,0,'',0,'',0),(15814,'{17891}<20','Free disk space is less than 20% on volume /home','',0,0,2,1537178275,'','',NULL,0,0,4,0,'',0,'',0),(15815,'{17892}<20','Free disk space is less than 20% on volume /boot','',0,0,2,0,'','',NULL,0,0,4,0,'',0,'',0),(15816,'{17893}>100','登录次数触发器','',0,0,1,0,'','',NULL,0,0,2,0,'',0,'',0),(15817,'{17894}>100','登录次数触发器','',0,0,1,0,'','',NULL,0,0,2,0,'',0,'',0),(15818,'{17895}>100','登录次数触发器','',0,0,1,0,'','',NULL,0,0,4,0,'',0,'',0),(15819,'{17896}>100','登录次数触发器','',0,0,1,0,'','',NULL,0,0,4,0,'',0,'',0),(15820,'{17897}>100','登录次数触发器','',0,0,1,0,'','',NULL,0,0,4,0,'',0,'',0),(15821,'{17898}>100','登录次数触发器','',0,0,1,0,'','',NULL,0,0,4,0,'',0,'',0),(15822,'{17899}>100','登录次数触发器','',0,0,1,0,'','',NULL,0,0,4,0,'',0,'',0),(15823,'{17900}>100','登录次数触发器','',0,0,1,0,'','',NULL,0,0,4,0,'',0,'',0),(15824,'{17901}>100','登录次数触发器','',0,0,1,0,'','',NULL,0,0,4,0,'',0,'',0),(15830,'{17910}=0','MySQL is down','',0,0,2,0,'','',14194,0,0,0,0,'',0,'',0),(15831,'{17911}>1','TestAction','',1,0,1,0,'','',NULL,0,0,2,0,'',0,'',0),(15832,'{17912}>1','TestAction','',1,1,1,1534731591,'','',NULL,0,0,4,0,'',0,'',0),(15833,'{17913}>1','TestAction','',1,1,1,1536822623,'','',NULL,0,0,4,0,'',0,'',0),(15834,'{17914}>1','TestAction','',1,0,1,0,'','',NULL,0,0,4,0,'',0,'',0),(15835,'{17915}>1','TestAction','',1,0,1,0,'','',NULL,0,0,4,0,'',0,'',0),(15836,'{17916}>1','TestAction','',1,0,1,0,'','',NULL,0,0,4,0,'',0,'',0),(15837,'{17917}>1','TestAction','',1,0,1,0,'','',NULL,0,0,4,0,'',0,'',0),(15838,'{17918}>1','TestAction','',1,0,1,0,'','',NULL,0,0,4,0,'',0,'',0),(15865,'{17967}>100','登录次数触发器','',0,0,1,0,'','',NULL,0,0,4,0,'',0,'',0),(15866,'{17968}>1','TestAction','',1,0,1,1536822618,'','',NULL,0,0,4,0,'',0,'',0),(15867,'{17969}>100','登录次数触发器','',0,0,1,0,'','',NULL,0,0,4,0,'',0,'',0),(15868,'{17970}>1','TestAction','',1,0,1,0,'','',NULL,0,0,4,0,'',0,'',0),(15869,'{17971}>100','登录次数触发器','',0,0,1,0,'','',NULL,0,0,4,0,'',0,'',0),(15870,'{17972}>1','TestAction','',1,0,1,0,'','',NULL,0,0,4,0,'',0,'',0),(15871,'{17973}>100','登录次数触发器','',0,0,1,0,'','',NULL,0,0,4,0,'',0,'',0),(15872,'{17974}>1','TestAction','',1,0,1,0,'','',NULL,0,0,4,0,'',0,'',0),(15873,'{17975}>100','登录次数触发器','',0,0,1,0,'','',NULL,0,0,4,0,'',0,'',0),(15874,'{17976}>1','TestAction','',1,0,1,0,'','',NULL,0,0,4,0,'',0,'',0),(15875,'{17977}>100','登录次数触发器','',0,0,1,0,'','',NULL,0,0,4,0,'',0,'',0),(15876,'{17978}>1','TestAction','',1,0,1,0,'','',NULL,0,0,4,0,'',0,'',0),(15877,'{17979}>100','登录次数触发器','',0,0,1,0,'','',NULL,0,0,4,0,'',0,'',0),(15878,'{17980}>1','TestAction','',1,0,1,0,'','',NULL,0,0,4,0,'',0,'',0),(15879,'{17981}>100','登录次数触发器','',0,0,1,0,'','',NULL,0,0,4,0,'',0,'',0),(15880,'{17982}>1','TestAction','',1,1,1,1536822637,'','',NULL,0,0,4,0,'',0,'',0),(15881,'{17983}>100','登录次数触发器','',0,0,1,0,'','',NULL,0,0,4,0,'',0,'',0),(15882,'{17984}>1','TestAction','',1,0,1,0,'','',NULL,0,0,4,0,'',0,'',0),(15883,'{17985}>100','登录次数触发器','',0,0,1,0,'','',NULL,0,0,4,0,'',0,'',0),(15884,'{17986}>1','TestAction','',1,0,1,0,'','',NULL,0,0,4,0,'',0,'',0),(15961,'{18063}=1','大数据安全管理系统失去响应','',0,0,4,0,'大数据安全管理系统失去响应，请检查大数据安全管理系统运行状态','',NULL,0,0,0,0,'',0,'',0),(15963,'{18065}=1','大数据使用系统失去响应','',0,0,4,0,'大数据使用系统失去响应，请查看大数据使用系统的运行状态','',NULL,0,0,0,0,'',0,'',0),(15964,'{18066}=1','分布式挖掘系统失去响应','',0,0,4,1537263961,'分布式挖掘系统失去响应，清查看分布式挖掘系统运行状态','',NULL,0,0,0,0,'',0,'',0),(15965,'{18067}=1','批量日志分析系统失去响应','',0,0,4,0,'批量日志分析系统失去响应，请查看批量日志分析系统运行状态','',NULL,0,0,0,0,'',0,'',0),(15966,'{18068}=1','大数据检索系统2号运行状态','',0,0,4,0,'大数据检索系统2号失去响应，请查看大数据检索系统2号运行状态','',NULL,0,0,0,0,'',0,'',0),(15967,'{18069}=1','高维模型分析系统失去响应','',0,0,4,0,'高维模型分析系统失去响应，请查看高维模型分析系统运行状态','',NULL,0,0,0,0,'',0,'',0),(15968,'{18070}=1','实时数据处理监控系统失去响应','',0,0,4,0,'实时数据处理监控系统失去响应，请查看实时数据处理监控系统运行状态','',NULL,0,0,0,0,'',0,'',0),(15969,'{18071}=1','批量数据处理系统失去响应','',0,0,4,1537511094,'批量数据处理系统失去响应，请查看批量数据处理系统运行状态','',NULL,0,0,0,0,'',0,'',0),(15970,'{18072}=1','指标管理系统失去响应','',0,0,4,1537178313,'指标管理系统失去响应，请查看指标管理系统运行状态','',NULL,0,0,0,0,'',0,'',0),(15971,'{18073}=1','数据标准管理系统失去响应','',0,0,4,1537519444,'数据标准管理系统失去响应，请查看数据标准管理系统运行状态','',NULL,0,0,0,0,'',0,'',0),(15972,'{18074}=1','元数据管理系统失去响应','',0,0,4,1537519445,'元数据管理系统失去响应，请查看元数据管理系统运行状态','',NULL,0,0,0,0,'',0,'',0),(15973,'{18075}=1','数据质量管理系统失去响应','',0,0,4,1537519446,'数据质量管理系统失去响应，请查看数据质量管理系统运行状态','',NULL,0,0,0,0,'',0,'',0),(15974,'{18076}=1','数据编目管理系统失去响应','',0,0,4,1537353547,'数据编目管理系统失去响应，清查看数据编目管理系统运行状态','',NULL,0,0,0,0,'',0,'',0),(15975,'{18077}=1','深网爬虫系统展示层失去响应','',0,0,4,1537171238,'深网爬虫系统展示层失去响应，请查看深网爬虫系统展示层运行状态','',NULL,0,0,0,0,'',0,'',0),(15976,'{18078}=1','深网爬虫系统服务层失去响应','',0,0,4,1537171179,'深网爬虫系统服务层失去响应，请查看深网爬虫系统服务层运行状态','',NULL,0,0,0,0,'',0,'',0),(15977,'{18079}=1','众包采集系统失去响应','',0,0,4,1536981130,'众包采集系统失去响应，请查看众包采集系统运行状态','',NULL,0,0,0,0,'',0,'',0),(15978,'{18080}=1','综合采集系统失去响应','',0,0,4,1537353671,'综合采集系统失去响应，请查看综合采集系统运行状态','',NULL,0,0,0,0,'',0,'',0),(15979,'{18081}=1','领导驾驶舱失去响应','',0,0,4,1537178323,'领导驾驶舱失去响应，请查看领导驾驶舱运行状态','',NULL,0,0,0,0,'',0,'',0),(15980,'{18082}>100','登录次数触发器','',0,0,1,0,'','',NULL,0,0,2,0,'',0,'',0),(15981,'{18083}=1','大数据管理系统失去响应','',0,0,4,0,'大数据管理系统失去响应，请查看大数据管理系统运行状态','',NULL,0,0,0,0,'',0,'',0),(15982,'{18084}=1','大数据检索系统1号运行状态','',0,0,4,0,'大数据检索系统1号失去响应，请查看大数据检索系统1号运行状态','',NULL,0,0,0,0,'',0,'',0),(15983,'{18085}=1','语义分析系统运行失去响应','',0,0,4,1537264588,'语义分析系统运行失去响应，请查看语义分析系统运行状态','',NULL,0,0,0,0,'',0,'',0),(15984,'{18086}=1','语义分析系统运行失去响应','',0,0,4,0,'语义分析系统运行失去响应，请查看语义分析系统运行状态','',NULL,0,0,0,0,'',0,'',0),(15985,'{18087}=1','数据可视化系统运行状态','',0,0,4,1537527780,'数据可视化系统失去响应，请查看数据可视化系统运行状态','',NULL,0,0,0,0,'',0,'',0),(15986,'{18088}>100','登录次数触发器','',0,0,1,0,'','',NULL,0,0,4,0,'',0,'',0),(15987,'{18089}>1','TestAction','',1,1,1,1537242211,'','',NULL,0,0,4,0,'',0,'',0);
/*!40000 ALTER TABLE `triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `userid` bigint(20) unsigned NOT NULL,
  `alias` varchar(100) NOT NULL DEFAULT '',
  `name` varchar(100) NOT NULL DEFAULT '',
  `surname` varchar(100) NOT NULL DEFAULT '',
  `passwd` char(32) NOT NULL DEFAULT '',
  `url` varchar(255) NOT NULL DEFAULT '',
  `autologin` int(11) NOT NULL DEFAULT '0',
  `autologout` varchar(32) NOT NULL DEFAULT '15m',
  `lang` varchar(5) NOT NULL DEFAULT 'en_GB',
  `refresh` varchar(32) NOT NULL DEFAULT '30s',
  `type` int(11) NOT NULL DEFAULT '1',
  `theme` varchar(128) NOT NULL DEFAULT 'default',
  `attempt_failed` int(11) NOT NULL DEFAULT '0',
  `attempt_ip` varchar(39) NOT NULL DEFAULT '',
  `attempt_clock` int(11) NOT NULL DEFAULT '0',
  `rows_per_page` int(11) NOT NULL DEFAULT '50',
  PRIMARY KEY (`userid`),
  UNIQUE KEY `users_1` (`alias`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Admin','Zabbix','Administrator','5fce1b3e34b520afeffb37ce08c7cd66','',0,'0','zh_CN','30s',3,'default',0,'10.10.10.151',1530001052,50),(2,'guest','','','d41d8cd98f00b204e9800998ecf8427e','',0,'0','en_GB','30s',1,'default',0,'',0,50);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_groups`
--

DROP TABLE IF EXISTS `users_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_groups` (
  `id` bigint(20) unsigned NOT NULL,
  `usrgrpid` bigint(20) unsigned NOT NULL,
  `userid` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_groups_1` (`usrgrpid`,`userid`),
  KEY `users_groups_2` (`userid`),
  CONSTRAINT `c_users_groups_1` FOREIGN KEY (`usrgrpid`) REFERENCES `usrgrp` (`usrgrpid`) ON DELETE CASCADE,
  CONSTRAINT `c_users_groups_2` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_groups`
--

LOCK TABLES `users_groups` WRITE;
/*!40000 ALTER TABLE `users_groups` DISABLE KEYS */;
INSERT INTO `users_groups` VALUES (4,7,1),(6,8,2);
/*!40000 ALTER TABLE `users_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usrgrp`
--

DROP TABLE IF EXISTS `usrgrp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usrgrp` (
  `usrgrpid` bigint(20) unsigned NOT NULL,
  `name` varchar(64) NOT NULL DEFAULT '',
  `gui_access` int(11) NOT NULL DEFAULT '0',
  `users_status` int(11) NOT NULL DEFAULT '0',
  `debug_mode` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`usrgrpid`),
  UNIQUE KEY `usrgrp_1` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usrgrp`
--

LOCK TABLES `usrgrp` WRITE;
/*!40000 ALTER TABLE `usrgrp` DISABLE KEYS */;
INSERT INTO `usrgrp` VALUES (7,'Zabbix administrators',0,0,0),(8,'Guests',2,0,0),(9,'Disabled',0,1,0),(11,'Enabled debug mode',0,0,1),(12,'No access to the frontend',2,0,0);
/*!40000 ALTER TABLE `usrgrp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `valuemaps`
--

DROP TABLE IF EXISTS `valuemaps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `valuemaps` (
  `valuemapid` bigint(20) unsigned NOT NULL,
  `name` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`valuemapid`),
  UNIQUE KEY `valuemaps_1` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `valuemaps`
--

LOCK TABLES `valuemaps` WRITE;
/*!40000 ALTER TABLE `valuemaps` DISABLE KEYS */;
INSERT INTO `valuemaps` VALUES (4,'APC Battery Replacement Status'),(5,'APC Battery Status'),(28,'CISCO-ENVMON-MIB::CiscoEnvMonState'),(55,'CPQHLTH-MIB::cpqHeTemperatureLocale'),(56,'CPQIDA-MIB::cpqDaCntlrModel'),(57,'CPQIDA-MIB::cpqDaPhyDrvStatus'),(54,'CPQSINFO-MIB::status'),(7,'Dell Open Manage System Status'),(18,'ENTITY-SENSORS-MIB::EntitySensorStatus'),(48,'ENTITY-STATE-MIB::EntityOperState'),(33,'EQUIPMENT-MIB::swFanStatus'),(34,'EQUIPMENT-MIB::swPowerStatus'),(19,'EtherLike-MIB::dot3StatsDuplexStatus'),(36,'EXTREME-SYSTEM-MIB::extremeFanOperational'),(37,'EXTREME-SYSTEM-MIB::extremeOverTemperatureAlarm'),(38,'EXTREME-SYSTEM-MIB::extremePowerSupplyStatus'),(30,'F10-S-SERIES-CHASSIS-MIB::chSysFanTrayOperStatus'),(31,'F10-S-SERIES-CHASSIS-MIB::chSysPowerSupplyOperStatus'),(29,'F10-S-SERIES-CHASSIS-MIB::extremeFanOperational'),(50,'FASTPATH-BOXSERVICES-PRIVATE-MIB::boxServicesFanItemState'),(49,'FASTPATH-BOXSERVICES-PRIVATE-MIB::boxServicesPowSupplyItemState'),(51,'FASTPATH-BOXSERVICES-PRIVATE-MIB::boxServicesTempSensorState'),(27,'FOUNDRY-SN-AGENT-MIB::snChasFanOperStatus'),(26,'FOUNDRY-SN-AGENT-MIB::snChasPwrSupplyOperStatus'),(39,'HH3C-ENTITY-EXT-MIB::hh3cEntityExtErrorStatus'),(2,'Host availability'),(6,'HP Insight System Status'),(40,'HP-ICF-CHASSIS::hpicfSensorStatus'),(17,'HTTP response status code'),(41,'HUAWEI-ENTITY-EXTENT-MIB::hwEntityFanState'),(42,'ICS-CHASSIS-MIB::icsChassisFanOperStatus'),(44,'ICS-CHASSIS-MIB::icsChassisPowerSupplyOperStatus'),(43,'ICS-CHASSIS-MIB::icsChassisSensorSlotOperStatus'),(45,'ICS-CHASSIS-MIB::icsChassisTemperatureStatus'),(20,'IF-MIB::ifOperStatus'),(21,'IF-MIB::ifType'),(58,'IMM-MIB::systemHealthStat'),(47,'JUNIPER-ALARM-MIB::jnxOperatingState'),(46,'JUNIPER-ALARM-MIB::jnxRedAlarmState'),(14,'Maintenance status'),(32,'MY-SYSTEM-MIB::mySystemFanIsNormal'),(52,'QTECH-MIB::sysFanStatus'),(53,'QTECH-MIB::sysPowerStatus'),(1,'Service state'),(9,'SNMP device status (hrDeviceStatus)'),(11,'SNMP interface status (ifAdminStatus)'),(8,'SNMP interface status (ifOperStatus)'),(25,'SW-MIB::swOperStatus'),(24,'SW-MIB::swSensorStatus'),(23,'TIMETRA-CHASSIS-MIB::TmnxDeviceState'),(35,'TruthValue'),(15,'Value cache operating mode'),(13,'VMware status'),(12,'VMware VirtualMachinePowerState'),(16,'Windows service startup type'),(3,'Windows service state'),(10,'Zabbix agent ping status'),(22,'zabbix.host.available');
/*!40000 ALTER TABLE `valuemaps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `widget`
--

DROP TABLE IF EXISTS `widget`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `widget` (
  `widgetid` bigint(20) unsigned NOT NULL,
  `dashboardid` bigint(20) unsigned NOT NULL,
  `type` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `x` int(11) NOT NULL DEFAULT '0',
  `y` int(11) NOT NULL DEFAULT '0',
  `width` int(11) NOT NULL DEFAULT '1',
  `height` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`widgetid`),
  KEY `widget_1` (`dashboardid`),
  CONSTRAINT `c_widget_1` FOREIGN KEY (`dashboardid`) REFERENCES `dashboard` (`dashboardid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `widget`
--

LOCK TABLES `widget` WRITE;
/*!40000 ALTER TABLE `widget` DISABLE KEYS */;
INSERT INTO `widget` VALUES (1,1,'favgrph','监控指标分析',0,5,2,3),(2,1,'favscr','监控指标综合分析',2,5,2,3),(3,1,'favmap','网络拓扑图',4,5,2,3),(5,1,'problems','',0,0,6,5),(7,1,'hoststat','主机群组运行状态',6,0,6,4),(8,1,'syssum','主机群组报警一览',6,4,6,4),(9,1,'stszbx','',6,8,6,5),(10,1,'webovr','',0,8,3,5),(11,1,'dscvry','',3,8,3,5);
/*!40000 ALTER TABLE `widget` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `widget_field`
--

DROP TABLE IF EXISTS `widget_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `widget_field` (
  `widget_fieldid` bigint(20) unsigned NOT NULL,
  `widgetid` bigint(20) unsigned NOT NULL,
  `type` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `value_int` int(11) NOT NULL DEFAULT '0',
  `value_str` varchar(255) NOT NULL DEFAULT '',
  `value_groupid` bigint(20) unsigned DEFAULT NULL,
  `value_hostid` bigint(20) unsigned DEFAULT NULL,
  `value_itemid` bigint(20) unsigned DEFAULT NULL,
  `value_graphid` bigint(20) unsigned DEFAULT NULL,
  `value_sysmapid` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`widget_fieldid`),
  KEY `widget_field_1` (`widgetid`),
  KEY `widget_field_2` (`value_groupid`),
  KEY `widget_field_3` (`value_hostid`),
  KEY `widget_field_4` (`value_itemid`),
  KEY `widget_field_5` (`value_graphid`),
  KEY `widget_field_6` (`value_sysmapid`),
  CONSTRAINT `c_widget_field_1` FOREIGN KEY (`widgetid`) REFERENCES `widget` (`widgetid`) ON DELETE CASCADE,
  CONSTRAINT `c_widget_field_2` FOREIGN KEY (`value_groupid`) REFERENCES `groups` (`groupid`) ON DELETE CASCADE,
  CONSTRAINT `c_widget_field_3` FOREIGN KEY (`value_hostid`) REFERENCES `hosts` (`hostid`) ON DELETE CASCADE,
  CONSTRAINT `c_widget_field_4` FOREIGN KEY (`value_itemid`) REFERENCES `items` (`itemid`) ON DELETE CASCADE,
  CONSTRAINT `c_widget_field_5` FOREIGN KEY (`value_graphid`) REFERENCES `graphs` (`graphid`) ON DELETE CASCADE,
  CONSTRAINT `c_widget_field_6` FOREIGN KEY (`value_sysmapid`) REFERENCES `sysmaps` (`sysmapid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `widget_field`
--

LOCK TABLES `widget_field` WRITE;
/*!40000 ALTER TABLE `widget_field` DISABLE KEYS */;
INSERT INTO `widget_field` VALUES (3,5,0,'severities',1,'',NULL,NULL,NULL,NULL,NULL),(6,5,0,'severities',2,'',NULL,NULL,NULL,NULL,NULL),(7,5,0,'severities',3,'',NULL,NULL,NULL,NULL,NULL),(8,5,0,'severities',4,'',NULL,NULL,NULL,NULL,NULL),(9,5,0,'severities',5,'',NULL,NULL,NULL,NULL,NULL),(11,10,0,'rf_rate',900,'',NULL,NULL,NULL,NULL,NULL),(12,11,0,'rf_rate',600,'',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `widget_field` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-09-25 10:12:24