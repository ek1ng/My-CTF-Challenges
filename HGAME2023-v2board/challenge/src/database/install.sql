-- MariaDB dump 10.19  Distrib 10.9.4-MariaDB, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: v2board
-- ------------------------------------------------------
-- Server version	5.7.40

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `v2_commission_log`
--

DROP TABLE IF EXISTS `v2_commission_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v2_commission_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `invite_user_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `trade_no` char(36) NOT NULL,
  `order_amount` int(11) NOT NULL,
  `get_amount` int(11) NOT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `v2_commission_log`
--

LOCK TABLES `v2_commission_log` WRITE;
/*!40000 ALTER TABLE `v2_commission_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `v2_commission_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `v2_coupon`
--

DROP TABLE IF EXISTS `v2_coupon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v2_coupon` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `type` tinyint(1) NOT NULL,
  `value` int(11) NOT NULL,
  `show` tinyint(1) NOT NULL DEFAULT '0',
  `limit_use` int(11) DEFAULT NULL,
  `limit_use_with_user` int(11) DEFAULT NULL,
  `limit_plan_ids` varchar(255) DEFAULT NULL,
  `limit_period` varchar(255) DEFAULT NULL,
  `started_at` int(11) NOT NULL,
  `ended_at` int(11) NOT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `v2_coupon`
--

LOCK TABLES `v2_coupon` WRITE;
/*!40000 ALTER TABLE `v2_coupon` DISABLE KEYS */;
/*!40000 ALTER TABLE `v2_coupon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `v2_invite_code`
--

DROP TABLE IF EXISTS `v2_invite_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v2_invite_code` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `code` char(32) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `pv` int(11) NOT NULL DEFAULT '0',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `v2_invite_code`
--

LOCK TABLES `v2_invite_code` WRITE;
/*!40000 ALTER TABLE `v2_invite_code` DISABLE KEYS */;
/*!40000 ALTER TABLE `v2_invite_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `v2_knowledge`
--

DROP TABLE IF EXISTS `v2_knowledge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v2_knowledge` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `language` char(5) NOT NULL COMMENT '語言',
  `category` varchar(255) NOT NULL COMMENT '分類名',
  `title` varchar(255) NOT NULL COMMENT '標題',
  `body` text NOT NULL COMMENT '內容',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `show` tinyint(1) NOT NULL DEFAULT '0' COMMENT '顯示',
  `created_at` int(11) NOT NULL COMMENT '創建時間',
  `updated_at` int(11) NOT NULL COMMENT '更新時間',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='知識庫';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `v2_knowledge`
--

LOCK TABLES `v2_knowledge` WRITE;
/*!40000 ALTER TABLE `v2_knowledge` DISABLE KEYS */;
/*!40000 ALTER TABLE `v2_knowledge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `v2_mail_log`
--

DROP TABLE IF EXISTS `v2_mail_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v2_mail_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(64) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `template_name` varchar(255) NOT NULL,
  `error` text,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `v2_mail_log`
--

LOCK TABLES `v2_mail_log` WRITE;
/*!40000 ALTER TABLE `v2_mail_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `v2_mail_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `v2_notice`
--

DROP TABLE IF EXISTS `v2_notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v2_notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `show` tinyint(1) NOT NULL DEFAULT '0',
  `img_url` varchar(255) DEFAULT NULL,
  `tags` varchar(255) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `v2_notice`
--

LOCK TABLES `v2_notice` WRITE;
/*!40000 ALTER TABLE `v2_notice` DISABLE KEYS */;
/*!40000 ALTER TABLE `v2_notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `v2_order`
--

DROP TABLE IF EXISTS `v2_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v2_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `invite_user_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `plan_id` int(11) NOT NULL,
  `coupon_id` int(11) DEFAULT NULL,
  `payment_id` int(11) DEFAULT NULL,
  `type` int(11) NOT NULL COMMENT '1新购2续费3升级',
  `period` varchar(255) NOT NULL,
  `trade_no` varchar(36) NOT NULL,
  `callback_no` varchar(255) DEFAULT NULL,
  `total_amount` int(11) NOT NULL,
  `handling_amount` int(11) DEFAULT NULL,
  `discount_amount` int(11) DEFAULT NULL,
  `surplus_amount` int(11) DEFAULT NULL COMMENT '剩余价值',
  `refund_amount` int(11) DEFAULT NULL COMMENT '退款金额',
  `balance_amount` int(11) DEFAULT NULL COMMENT '使用余额',
  `surplus_order_ids` text COMMENT '折抵订单',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0待支付1开通中2已取消3已完成4已折抵',
  `commission_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0待确认1发放中2有效3无效',
  `commission_balance` int(11) NOT NULL DEFAULT '0',
  `actual_commission_balance` int(11) DEFAULT NULL COMMENT '实际支付佣金',
  `paid_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `v2_order`
--

LOCK TABLES `v2_order` WRITE;
/*!40000 ALTER TABLE `v2_order` DISABLE KEYS */;
INSERT INTO `v2_order` VALUES
(1,NULL,2,1,NULL,NULL,4,'reset_price','60fd9cd2e8fe0be54e3a995ed1b5b5a0','manual_operation',99999900,NULL,NULL,NULL,NULL,NULL,NULL,1,0,0,NULL,1673261720,1673261717,1673261720);
/*!40000 ALTER TABLE `v2_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `v2_payment`
--

DROP TABLE IF EXISTS `v2_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v2_payment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(32) NOT NULL,
  `payment` varchar(16) NOT NULL,
  `name` varchar(255) NOT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `config` text NOT NULL,
  `notify_domain` varchar(128) DEFAULT NULL,
  `handling_fee_fixed` int(11) DEFAULT NULL,
  `handling_fee_percent` decimal(5,2) DEFAULT NULL,
  `enable` tinyint(1) NOT NULL DEFAULT '0',
  `sort` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `v2_payment`
--

LOCK TABLES `v2_payment` WRITE;
/*!40000 ALTER TABLE `v2_payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `v2_payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `v2_plan`
--

DROP TABLE IF EXISTS `v2_plan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v2_plan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `transfer_enable` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `show` tinyint(1) NOT NULL DEFAULT '0',
  `sort` int(11) DEFAULT NULL,
  `renew` tinyint(1) NOT NULL DEFAULT '1',
  `content` text CHARACTER SET utf8mb4,
  `month_price` int(11) DEFAULT NULL,
  `quarter_price` int(11) DEFAULT NULL,
  `half_year_price` int(11) DEFAULT NULL,
  `year_price` int(11) DEFAULT NULL,
  `two_year_price` int(11) DEFAULT NULL,
  `three_year_price` int(11) DEFAULT NULL,
  `onetime_price` int(11) DEFAULT NULL,
  `reset_price` int(11) DEFAULT NULL,
  `reset_traffic_method` tinyint(1) DEFAULT NULL,
  `capacity_limit` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `v2_plan`
--

LOCK TABLES `v2_plan` WRITE;
/*!40000 ALTER TABLE `v2_plan` DISABLE KEYS */;
INSERT INTO `v2_plan` VALUES
(1,1,9999,'Vidar-Team Plane🛩',0,NULL,0,NULL,9900,99900,999900,9999900,99999900,999999900,999999900,999999900,NULL,NULL,1673259511,1673260284);
/*!40000 ALTER TABLE `v2_plan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `v2_server_group`
--

DROP TABLE IF EXISTS `v2_server_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v2_server_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `v2_server_group`
--

LOCK TABLES `v2_server_group` WRITE;
/*!40000 ALTER TABLE `v2_server_group` DISABLE KEYS */;
INSERT INTO `v2_server_group` VALUES
(1,'test',1673259504,1673259504);
/*!40000 ALTER TABLE `v2_server_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `v2_server_shadowsocks`
--

DROP TABLE IF EXISTS `v2_server_shadowsocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v2_server_shadowsocks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` varchar(255) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `tags` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `rate` varchar(11) NOT NULL,
  `host` varchar(255) NOT NULL,
  `port` int(11) NOT NULL,
  `server_port` int(11) NOT NULL,
  `cipher` varchar(255) NOT NULL,
  `obfs` char(11) DEFAULT NULL,
  `obfs_settings` varchar(255) DEFAULT NULL,
  `show` tinyint(4) NOT NULL DEFAULT '0',
  `sort` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `v2_server_shadowsocks`
--

LOCK TABLES `v2_server_shadowsocks` WRITE;
/*!40000 ALTER TABLE `v2_server_shadowsocks` DISABLE KEYS */;
/*!40000 ALTER TABLE `v2_server_shadowsocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `v2_server_trojan`
--

DROP TABLE IF EXISTS `v2_server_trojan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v2_server_trojan` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '节点ID',
  `group_id` varchar(255) NOT NULL COMMENT '节点组',
  `parent_id` int(11) DEFAULT NULL COMMENT '父节点',
  `tags` varchar(255) DEFAULT NULL COMMENT '节点标签',
  `name` varchar(255) NOT NULL COMMENT '节点名称',
  `rate` varchar(11) NOT NULL COMMENT '倍率',
  `host` varchar(255) NOT NULL COMMENT '主机名',
  `port` int(11) NOT NULL COMMENT '连接端口',
  `server_port` int(11) NOT NULL COMMENT '服务端口',
  `allow_insecure` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许不安全',
  `server_name` varchar(255) DEFAULT NULL,
  `show` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否显示',
  `sort` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='trojan伺服器表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `v2_server_trojan`
--

LOCK TABLES `v2_server_trojan` WRITE;
/*!40000 ALTER TABLE `v2_server_trojan` DISABLE KEYS */;
/*!40000 ALTER TABLE `v2_server_trojan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `v2_server_v2ray`
--

DROP TABLE IF EXISTS `v2_server_v2ray`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v2_server_v2ray` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` varchar(255) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `host` varchar(255) NOT NULL,
  `port` char(11) NOT NULL,
  `server_port` int(11) NOT NULL,
  `tls` tinyint(4) NOT NULL DEFAULT '0',
  `tags` varchar(255) DEFAULT NULL,
  `rate` varchar(11) NOT NULL,
  `network` text NOT NULL,
  `rules` text,
  `networkSettings` text,
  `tlsSettings` text,
  `ruleSettings` text,
  `dnsSettings` text,
  `show` tinyint(1) NOT NULL DEFAULT '0',
  `sort` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `v2_server_v2ray`
--

LOCK TABLES `v2_server_v2ray` WRITE;
/*!40000 ALTER TABLE `v2_server_v2ray` DISABLE KEYS */;
/*!40000 ALTER TABLE `v2_server_v2ray` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `v2_stat_order`
--

DROP TABLE IF EXISTS `v2_stat_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v2_stat_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_count` int(11) NOT NULL COMMENT '订单数量',
  `order_amount` int(11) NOT NULL COMMENT '订单合计',
  `commission_count` int(11) NOT NULL,
  `commission_amount` int(11) NOT NULL COMMENT '佣金合计',
  `record_type` char(1) NOT NULL,
  `record_at` int(11) NOT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `record_at` (`record_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单统计';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `v2_stat_order`
--

LOCK TABLES `v2_stat_order` WRITE;
/*!40000 ALTER TABLE `v2_stat_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `v2_stat_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `v2_stat_server`
--

DROP TABLE IF EXISTS `v2_stat_server`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v2_stat_server` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `server_id` int(11) NOT NULL COMMENT '节点id',
  `server_type` char(11) NOT NULL COMMENT '节点类型',
  `u` bigint(20) NOT NULL,
  `d` bigint(20) NOT NULL,
  `record_type` char(1) NOT NULL COMMENT 'd day m month',
  `record_at` int(11) NOT NULL COMMENT '记录时间',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `server_id_server_type_record_at` (`server_id`,`server_type`,`record_at`),
  KEY `record_at` (`record_at`),
  KEY `server_id` (`server_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='节点数据统计';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `v2_stat_server`
--

LOCK TABLES `v2_stat_server` WRITE;
/*!40000 ALTER TABLE `v2_stat_server` DISABLE KEYS */;
/*!40000 ALTER TABLE `v2_stat_server` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `v2_stat_user`
--

DROP TABLE IF EXISTS `v2_stat_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v2_stat_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `server_rate` decimal(10,2) NOT NULL,
  `u` bigint(20) NOT NULL,
  `d` bigint(20) NOT NULL,
  `record_type` char(2) NOT NULL,
  `record_at` int(11) NOT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `server_rate_user_id_record_at` (`server_rate`,`user_id`,`record_at`),
  KEY `user_id` (`user_id`),
  KEY `record_at` (`record_at`),
  KEY `server_rate` (`server_rate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `v2_stat_user`
--

LOCK TABLES `v2_stat_user` WRITE;
/*!40000 ALTER TABLE `v2_stat_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `v2_stat_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `v2_ticket`
--

DROP TABLE IF EXISTS `v2_ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v2_ticket` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `level` tinyint(1) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0:已开启 1:已关闭',
  `reply_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0:待回复 1:已回复',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `v2_ticket`
--

LOCK TABLES `v2_ticket` WRITE;
/*!40000 ALTER TABLE `v2_ticket` DISABLE KEYS */;
/*!40000 ALTER TABLE `v2_ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `v2_ticket_message`
--

DROP TABLE IF EXISTS `v2_ticket_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v2_ticket_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `ticket_id` int(11) NOT NULL,
  `message` text CHARACTER SET utf8mb4 NOT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `v2_ticket_message`
--

LOCK TABLES `v2_ticket_message` WRITE;
/*!40000 ALTER TABLE `v2_ticket_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `v2_ticket_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `v2_user`
--

DROP TABLE IF EXISTS `v2_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v2_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `invite_user_id` int(11) DEFAULT NULL,
  `telegram_id` bigint(20) DEFAULT NULL,
  `email` varchar(64) NOT NULL,
  `password` varchar(64) NOT NULL,
  `password_algo` char(10) DEFAULT NULL,
  `password_salt` char(10) DEFAULT NULL,
  `balance` int(11) NOT NULL DEFAULT '0',
  `discount` int(11) DEFAULT NULL,
  `commission_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0: system 1: period 2: onetime',
  `commission_rate` int(11) DEFAULT NULL,
  `commission_balance` int(11) NOT NULL DEFAULT '0',
  `t` int(11) NOT NULL DEFAULT '0',
  `u` bigint(20) NOT NULL DEFAULT '0',
  `d` bigint(20) NOT NULL DEFAULT '0',
  `transfer_enable` bigint(20) NOT NULL DEFAULT '0',
  `banned` tinyint(1) NOT NULL DEFAULT '0',
  `is_admin` tinyint(1) NOT NULL DEFAULT '0',
  `is_staff` tinyint(1) NOT NULL DEFAULT '0',
  `last_login_at` int(11) DEFAULT NULL,
  `last_login_ip` int(11) DEFAULT NULL,
  `uuid` varchar(36) NOT NULL,
  `group_id` int(11) DEFAULT NULL,
  `plan_id` int(11) DEFAULT NULL,
  `remind_expire` tinyint(4) DEFAULT '1',
  `remind_traffic` tinyint(4) DEFAULT '1',
  `token` char(32) NOT NULL,
  `remarks` text,
  `expired_at` bigint(20) DEFAULT '0',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `v2_user`
--

LOCK TABLES `v2_user` WRITE;
/*!40000 ALTER TABLE `v2_user` DISABLE KEYS */;
INSERT INTO `v2_user` VALUES
(1,NULL,NULL,'admin@example.com','$2y$10$JLs3LJrKqsTly8K.w9KzI.e0Jt/7oU9W3gQYcUDSRjg1LReimLLTS',NULL,NULL,0,NULL,0,NULL,0,0,0,0,0,0,1,0,NULL,NULL,'85a1c66e-d736-42b2-a0da-69f6fb066e90',1,1,1,1,'39d580e71705f6abac9a414def74c466',NULL,0,1673263308,1673267067);
/*!40000 ALTER TABLE `v2_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-01-09 20:25:08
