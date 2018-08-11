CREATE DATABASE  IF NOT EXISTS `evekitdb_2_1_0` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `evekitdb_2_1_0`;
-- MySQL dump 10.13  Distrib 5.6.24, for Win64 (x86_64)
--
-- Host: localhost    Database: evekitdb_2_1_0
-- ------------------------------------------------------
-- Server version	5.6.27-log

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
-- Table structure for table `accountstatus_multicharactertraining`
--

DROP TABLE IF EXISTS `accountstatus_multicharactertraining`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accountstatus_multicharactertraining` (
  `AccountStatus_cid` bigint(20) NOT NULL,
  `multiCharacterTraining` bigint(20) DEFAULT NULL,
  KEY `FKqk8j1djc3ellaypq61d3ioh31` (`AccountStatus_cid`),
  CONSTRAINT `FKqk8j1djc3ellaypq61d3ioh31` FOREIGN KEY (`AccountStatus_cid`) REFERENCES `evekit_data_account_status` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cacheddata_metadata`
--

DROP TABLE IF EXISTS `cacheddata_metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cacheddata_metadata` (
  `CachedData_cid` bigint(20) NOT NULL,
  `metaData` varchar(255) DEFAULT NULL,
  `metaData_KEY` varchar(255) NOT NULL,
  PRIMARY KEY (`CachedData_cid`,`metaData_KEY`),
  CONSTRAINT `FKkv5hym9am6ug5t69erh97t7cf` FOREIGN KEY (`CachedData_cid`) REFERENCES `evekit_cached_data` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `charactermailmessage_tocharacterid`
--

DROP TABLE IF EXISTS `charactermailmessage_tocharacterid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `charactermailmessage_tocharacterid` (
  `CharacterMailMessage_cid` bigint(20) NOT NULL,
  `toCharacterID` bigint(20) DEFAULT NULL,
  KEY `FK3w2vlq5w5pa9h6gdig3vg35j8` (`CharacterMailMessage_cid`),
  CONSTRAINT `FK3w2vlq5w5pa9h6gdig3vg35j8` FOREIGN KEY (`CharacterMailMessage_cid`) REFERENCES `evekit_data_character_mail_message` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `charactermailmessage_tolistid`
--

DROP TABLE IF EXISTS `charactermailmessage_tolistid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `charactermailmessage_tolistid` (
  `CharacterMailMessage_cid` bigint(20) NOT NULL,
  `toListID` bigint(20) DEFAULT NULL,
  KEY `FKfthmfsmeenlehj8uvov7ohaqt` (`CharacterMailMessage_cid`),
  CONSTRAINT `FKfthmfsmeenlehj8uvov7ohaqt` FOREIGN KEY (`CharacterMailMessage_cid`) REFERENCES `evekit_data_character_mail_message` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `corporationtitle_grantableroles`
--

DROP TABLE IF EXISTS `corporationtitle_grantableroles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `corporationtitle_grantableroles` (
  `CorporationTitle_cid` bigint(20) NOT NULL,
  `grantableRoles` bigint(20) DEFAULT NULL,
  KEY `FK6i4i1lmxbpp7ssp7shcpn7enc` (`CorporationTitle_cid`),
  CONSTRAINT `FK6i4i1lmxbpp7ssp7shcpn7enc` FOREIGN KEY (`CorporationTitle_cid`) REFERENCES `evekit_data_corporation_title` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `corporationtitle_grantablerolesatbase`
--

DROP TABLE IF EXISTS `corporationtitle_grantablerolesatbase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `corporationtitle_grantablerolesatbase` (
  `CorporationTitle_cid` bigint(20) NOT NULL,
  `grantableRolesAtBase` bigint(20) DEFAULT NULL,
  KEY `FK8jq2v86tadmcns31fmern8u1k` (`CorporationTitle_cid`),
  CONSTRAINT `FK8jq2v86tadmcns31fmern8u1k` FOREIGN KEY (`CorporationTitle_cid`) REFERENCES `evekit_data_corporation_title` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `corporationtitle_grantablerolesathq`
--

DROP TABLE IF EXISTS `corporationtitle_grantablerolesathq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `corporationtitle_grantablerolesathq` (
  `CorporationTitle_cid` bigint(20) NOT NULL,
  `grantableRolesAtHQ` bigint(20) DEFAULT NULL,
  KEY `FKdqh22e6ihfdgdcx15g1tvxoci` (`CorporationTitle_cid`),
  CONSTRAINT `FKdqh22e6ihfdgdcx15g1tvxoci` FOREIGN KEY (`CorporationTitle_cid`) REFERENCES `evekit_data_corporation_title` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `corporationtitle_grantablerolesatother`
--

DROP TABLE IF EXISTS `corporationtitle_grantablerolesatother`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `corporationtitle_grantablerolesatother` (
  `CorporationTitle_cid` bigint(20) NOT NULL,
  `grantableRolesAtOther` bigint(20) DEFAULT NULL,
  KEY `FKmsgc3g0yp790xmdyhfl1iuk8g` (`CorporationTitle_cid`),
  CONSTRAINT `FKmsgc3g0yp790xmdyhfl1iuk8g` FOREIGN KEY (`CorporationTitle_cid`) REFERENCES `evekit_data_corporation_title` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `corporationtitle_roles`
--

DROP TABLE IF EXISTS `corporationtitle_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `corporationtitle_roles` (
  `CorporationTitle_cid` bigint(20) NOT NULL,
  `roles` bigint(20) DEFAULT NULL,
  KEY `FKay6o38p3bp91ul2m1q41f53ky` (`CorporationTitle_cid`),
  CONSTRAINT `FKay6o38p3bp91ul2m1q41f53ky` FOREIGN KEY (`CorporationTitle_cid`) REFERENCES `evekit_data_corporation_title` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `corporationtitle_rolesatbase`
--

DROP TABLE IF EXISTS `corporationtitle_rolesatbase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `corporationtitle_rolesatbase` (
  `CorporationTitle_cid` bigint(20) NOT NULL,
  `rolesAtBase` bigint(20) DEFAULT NULL,
  KEY `FK3x9k45x52ft91s6cqvu1kmmfo` (`CorporationTitle_cid`),
  CONSTRAINT `FK3x9k45x52ft91s6cqvu1kmmfo` FOREIGN KEY (`CorporationTitle_cid`) REFERENCES `evekit_data_corporation_title` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `corporationtitle_rolesathq`
--

DROP TABLE IF EXISTS `corporationtitle_rolesathq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `corporationtitle_rolesathq` (
  `CorporationTitle_cid` bigint(20) NOT NULL,
  `rolesAtHQ` bigint(20) DEFAULT NULL,
  KEY `FKecqyovq21p0iumw6xk083a690` (`CorporationTitle_cid`),
  CONSTRAINT `FKecqyovq21p0iumw6xk083a690` FOREIGN KEY (`CorporationTitle_cid`) REFERENCES `evekit_data_corporation_title` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `corporationtitle_rolesatother`
--

DROP TABLE IF EXISTS `corporationtitle_rolesatother`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `corporationtitle_rolesatother` (
  `CorporationTitle_cid` bigint(20) NOT NULL,
  `rolesAtOther` bigint(20) DEFAULT NULL,
  KEY `FKkufsrfwct54393eors8t3gyng` (`CorporationTitle_cid`),
  CONSTRAINT `FKkufsrfwct54393eors8t3gyng` FOREIGN KEY (`CorporationTitle_cid`) REFERENCES `evekit_data_corporation_title` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `evekit_access_keys`
--

DROP TABLE IF EXISTS `evekit_access_keys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evekit_access_keys` (
  `kid` bigint(20) NOT NULL,
  `accessMask` longblob,
  `expiry` bigint(20) NOT NULL,
  `keyName` varchar(255) DEFAULT NULL,
  `limit` bigint(20) DEFAULT NULL,
  `randomSeed` bigint(20) NOT NULL,
  `accessKey` bigint(20) DEFAULT NULL,
  `aid` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`kid`),
  UNIQUE KEY `accessKeyIndex` (`accessKey`),
  KEY `accountIndex` (`aid`),
  KEY `keyNameIndex` (`keyName`),
  CONSTRAINT `FK81dsg5lfekjco1t36mt974y1y` FOREIGN KEY (`aid`) REFERENCES `evekit_sync_accounts` (`aid`),
  CONSTRAINT `FKafim3iwwadnwkjg0as4bm902v` FOREIGN KEY (`accessKey`) REFERENCES `evekit_sequence` (`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `evekit_auth_source`
--

DROP TABLE IF EXISTS `evekit_auth_source`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evekit_auth_source` (
  `sid` bigint(20) NOT NULL,
  `details` longtext,
  `last` bigint(20) NOT NULL,
  `screenName` varchar(255) DEFAULT NULL,
  `source` varchar(255) DEFAULT NULL,
  `uid` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`sid`),
  KEY `accountIndex` (`uid`),
  KEY `sourceAndScreenIndex` (`source`,`screenName`),
  CONSTRAINT `FK7ddu85ufo1xcyw12gyn98qv15` FOREIGN KEY (`uid`) REFERENCES `evekit_users` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `evekit_cached_data`
--

DROP TABLE IF EXISTS `evekit_cached_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evekit_cached_data` (
  `cid` bigint(20) NOT NULL,
  `accessMask` tinyblob,
  `eveKitVersion` smallint(6) NOT NULL,
  `lifeEnd` bigint(20) NOT NULL,
  `lifeStart` bigint(20) NOT NULL,
  `aid` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`cid`),
  KEY `accountIndex` (`aid`),
  KEY `lifeStartIndex` (`lifeStart`),
  KEY `lifeEndIndex` (`lifeEnd`),
  CONSTRAINT `FK9kmpvr4ocupemxfg2lpjxtumj` FOREIGN KEY (`aid`) REFERENCES `evekit_sync_accounts` (`aid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `evekit_char_sync`
--

DROP TABLE IF EXISTS `evekit_char_sync`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evekit_char_sync` (
  `accountBalanceDetail` varchar(255) DEFAULT NULL,
  `accountBalanceStatus` int(11) DEFAULT NULL,
  `accountStatusDetail` varchar(255) DEFAULT NULL,
  `accountStatusStatus` int(11) DEFAULT NULL,
  `assetListDetail` varchar(255) DEFAULT NULL,
  `assetListStatus` int(11) DEFAULT NULL,
  `blueprintsDetail` varchar(255) DEFAULT NULL,
  `blueprintsStatus` int(11) DEFAULT NULL,
  `bookmarksDetail` varchar(255) DEFAULT NULL,
  `bookmarksStatus` int(11) DEFAULT NULL,
  `calendarEventAttendeesDetail` varchar(255) DEFAULT NULL,
  `calendarEventAttendeesStatus` int(11) DEFAULT NULL,
  `characterSheetDetail` varchar(255) DEFAULT NULL,
  `characterSheetStatus` int(11) DEFAULT NULL,
  `chatChannelsDetail` varchar(255) DEFAULT NULL,
  `chatChannelsStatus` int(11) DEFAULT NULL,
  `contactListDetail` varchar(255) DEFAULT NULL,
  `contactListStatus` int(11) DEFAULT NULL,
  `contactNotificationsDetail` varchar(255) DEFAULT NULL,
  `contactNotificationsStatus` int(11) DEFAULT NULL,
  `contractBidsDetail` varchar(255) DEFAULT NULL,
  `contractBidsStatus` int(11) DEFAULT NULL,
  `contractItemsDetail` varchar(255) DEFAULT NULL,
  `contractItemsStatus` int(11) DEFAULT NULL,
  `contractsDetail` varchar(255) DEFAULT NULL,
  `contractsStatus` int(11) DEFAULT NULL,
  `facWarStatsDetail` varchar(255) DEFAULT NULL,
  `facWarStatsStatus` int(11) DEFAULT NULL,
  `industryJobsDetail` varchar(255) DEFAULT NULL,
  `industryJobsHistoryDetail` varchar(255) DEFAULT NULL,
  `industryJobsHistoryStatus` int(11) DEFAULT NULL,
  `industryJobsStatus` int(11) DEFAULT NULL,
  `killlogDetail` varchar(255) DEFAULT NULL,
  `killlogStatus` int(11) DEFAULT NULL,
  `locationsDetail` varchar(255) DEFAULT NULL,
  `locationsStatus` int(11) DEFAULT NULL,
  `mailBodiesDetail` varchar(255) DEFAULT NULL,
  `mailBodiesStatus` int(11) DEFAULT NULL,
  `mailMessagesDetail` varchar(255) DEFAULT NULL,
  `mailMessagesStatus` int(11) DEFAULT NULL,
  `mailingListsDetail` varchar(255) DEFAULT NULL,
  `mailingListsStatus` int(11) DEFAULT NULL,
  `marketOrdersDetail` varchar(255) DEFAULT NULL,
  `marketOrdersStatus` int(11) DEFAULT NULL,
  `medalsDetail` varchar(255) DEFAULT NULL,
  `medalsStatus` int(11) DEFAULT NULL,
  `notificationTextsDetail` varchar(255) DEFAULT NULL,
  `notificationTextsStatus` int(11) DEFAULT NULL,
  `notificationsDetail` varchar(255) DEFAULT NULL,
  `notificationsStatus` int(11) DEFAULT NULL,
  `partialCharacterSheetDetail` varchar(255) DEFAULT NULL,
  `partialCharacterSheetStatus` int(11) DEFAULT NULL,
  `planetaryColoniesDetail` varchar(255) DEFAULT NULL,
  `planetaryColoniesStatus` int(11) DEFAULT NULL,
  `researchDetail` varchar(255) DEFAULT NULL,
  `researchStatus` int(11) DEFAULT NULL,
  `skillInTrainingDetail` varchar(255) DEFAULT NULL,
  `skillInTrainingStatus` int(11) DEFAULT NULL,
  `skillQueueDetail` varchar(255) DEFAULT NULL,
  `skillQueueStatus` int(11) DEFAULT NULL,
  `skillsDetail` varchar(255) DEFAULT NULL,
  `skillsStatus` int(11) DEFAULT NULL,
  `standingsDetail` varchar(255) DEFAULT NULL,
  `standingsStatus` int(11) DEFAULT NULL,
  `upcomingCalendarEventsDetail` varchar(255) DEFAULT NULL,
  `upcomingCalendarEventsStatus` int(11) DEFAULT NULL,
  `walletJournalDetail` varchar(255) DEFAULT NULL,
  `walletJournalStatus` int(11) DEFAULT NULL,
  `walletTransactionsDetail` varchar(255) DEFAULT NULL,
  `walletTransactionsStatus` int(11) DEFAULT NULL,
  `tid` bigint(20) NOT NULL,
  PRIMARY KEY (`tid`),
  CONSTRAINT `FKcsingpbawh8ecynpsrxvhkv22` FOREIGN KEY (`tid`) REFERENCES `evekit_sync` (`tid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `evekit_corp_sync`
--

DROP TABLE IF EXISTS `evekit_corp_sync`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evekit_corp_sync` (
  `accountBalanceDetail` varchar(255) DEFAULT NULL,
  `accountBalanceStatus` int(11) DEFAULT NULL,
  `assetListDetail` varchar(255) DEFAULT NULL,
  `assetListStatus` int(11) DEFAULT NULL,
  `blueprintsDetail` varchar(255) DEFAULT NULL,
  `blueprintsStatus` int(11) DEFAULT NULL,
  `bookmarksDetail` varchar(255) DEFAULT NULL,
  `bookmarksStatus` int(11) DEFAULT NULL,
  `contactListDetail` varchar(255) DEFAULT NULL,
  `contactListStatus` int(11) DEFAULT NULL,
  `containerLogDetail` varchar(255) DEFAULT NULL,
  `containerLogStatus` int(11) DEFAULT NULL,
  `contractBidsDetail` varchar(255) DEFAULT NULL,
  `contractBidsStatus` int(11) DEFAULT NULL,
  `contractItemsDetail` varchar(255) DEFAULT NULL,
  `contractItemsStatus` int(11) DEFAULT NULL,
  `contractsDetail` varchar(255) DEFAULT NULL,
  `contractsStatus` int(11) DEFAULT NULL,
  `corpMedalsDetail` varchar(255) DEFAULT NULL,
  `corpMedalsStatus` int(11) DEFAULT NULL,
  `corpTitlesDetail` varchar(255) DEFAULT NULL,
  `corpTitlesStatus` int(11) DEFAULT NULL,
  `corporationSheetDetail` varchar(255) DEFAULT NULL,
  `corporationSheetStatus` int(11) DEFAULT NULL,
  `customsOfficeDetail` varchar(255) DEFAULT NULL,
  `customsOfficeStatus` int(11) DEFAULT NULL,
  `facWarStatsDetail` varchar(255) DEFAULT NULL,
  `facWarStatsStatus` int(11) DEFAULT NULL,
  `facilitiesDetail` varchar(255) DEFAULT NULL,
  `facilitiesStatus` int(11) DEFAULT NULL,
  `industryJobsDetail` varchar(255) DEFAULT NULL,
  `industryJobsHistoryDetail` varchar(255) DEFAULT NULL,
  `industryJobsHistoryStatus` int(11) DEFAULT NULL,
  `industryJobsStatus` int(11) DEFAULT NULL,
  `killlogDetail` varchar(255) DEFAULT NULL,
  `killlogStatus` int(11) DEFAULT NULL,
  `locationsDetail` varchar(255) DEFAULT NULL,
  `locationsStatus` int(11) DEFAULT NULL,
  `marketOrdersDetail` varchar(255) DEFAULT NULL,
  `marketOrdersStatus` int(11) DEFAULT NULL,
  `memberMedalsDetail` varchar(255) DEFAULT NULL,
  `memberMedalsStatus` int(11) DEFAULT NULL,
  `memberSecurityDetail` varchar(255) DEFAULT NULL,
  `memberSecurityLogDetail` varchar(255) DEFAULT NULL,
  `memberSecurityLogStatus` int(11) DEFAULT NULL,
  `memberSecurityStatus` int(11) DEFAULT NULL,
  `memberTrackingDetail` varchar(255) DEFAULT NULL,
  `memberTrackingStatus` int(11) DEFAULT NULL,
  `outpostDetailDetail` varchar(255) DEFAULT NULL,
  `outpostDetailStatus` int(11) DEFAULT NULL,
  `outpostListDetail` varchar(255) DEFAULT NULL,
  `outpostListStatus` int(11) DEFAULT NULL,
  `shareholderDetail` varchar(255) DEFAULT NULL,
  `shareholderStatus` int(11) DEFAULT NULL,
  `standingsDetail` varchar(255) DEFAULT NULL,
  `standingsStatus` int(11) DEFAULT NULL,
  `starbaseDetailDetail` varchar(255) DEFAULT NULL,
  `starbaseDetailStatus` int(11) DEFAULT NULL,
  `starbaseListDetail` varchar(255) DEFAULT NULL,
  `starbaseListStatus` int(11) DEFAULT NULL,
  `walletJournalDetail` varchar(255) DEFAULT NULL,
  `walletJournalStatus` int(11) DEFAULT NULL,
  `walletTransactionsDetail` varchar(255) DEFAULT NULL,
  `walletTransactionsStatus` int(11) DEFAULT NULL,
  `tid` bigint(20) NOT NULL,
  PRIMARY KEY (`tid`),
  CONSTRAINT `FKc5xwvxh27fh78qw8hiwnb44hw` FOREIGN KEY (`tid`) REFERENCES `evekit_sync` (`tid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `evekit_data_account_balance`
--

DROP TABLE IF EXISTS `evekit_data_account_balance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evekit_data_account_balance` (
  `accountID` int(11) NOT NULL,
  `accountKey` int(11) NOT NULL,
  `balance` decimal(19,2) DEFAULT NULL,
  `cid` bigint(20) NOT NULL,
  PRIMARY KEY (`cid`),
  KEY `accountIDIndex` (`accountID`),
  KEY `accountKeyIndex` (`accountKey`),
  CONSTRAINT `FKr4fgy8h2mswm0ix3ifgwi327t` FOREIGN KEY (`cid`) REFERENCES `evekit_cached_data` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `evekit_data_account_status`
--

DROP TABLE IF EXISTS `evekit_data_account_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evekit_data_account_status` (
  `createDate` bigint(20) NOT NULL,
  `logonCount` bigint(20) NOT NULL,
  `logonMinutes` bigint(20) NOT NULL,
  `paidUntil` bigint(20) NOT NULL,
  `cid` bigint(20) NOT NULL,
  PRIMARY KEY (`cid`),
  CONSTRAINT `FKaju9fbq0hbr53pege92q3olca` FOREIGN KEY (`cid`) REFERENCES `evekit_cached_data` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `evekit_data_asset`
--

DROP TABLE IF EXISTS `evekit_data_asset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evekit_data_asset` (
  `container` bigint(20) NOT NULL,
  `flag` int(11) NOT NULL,
  `itemID` bigint(20) NOT NULL,
  `locationID` bigint(20) NOT NULL,
  `quantity` bigint(20) NOT NULL,
  `rawQuantity` bigint(20) NOT NULL,
  `singleton` bit(1) NOT NULL,
  `typeID` int(11) NOT NULL,
  `cid` bigint(20) NOT NULL,
  PRIMARY KEY (`cid`),
  KEY `itemIDIndex` (`itemID`),
  KEY `containerIndex` (`container`),
  CONSTRAINT `FKho8161whl26j6uqd2ngnli086` FOREIGN KEY (`cid`) REFERENCES `evekit_cached_data` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `evekit_data_blueprint`
--

DROP TABLE IF EXISTS `evekit_data_blueprint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evekit_data_blueprint` (
  `flagID` int(11) NOT NULL,
  `itemID` bigint(20) NOT NULL,
  `locationID` bigint(20) NOT NULL,
  `materialEfficiency` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `runs` int(11) NOT NULL,
  `timeEfficiency` int(11) NOT NULL,
  `typeID` int(11) NOT NULL,
  `typeName` varchar(255) DEFAULT NULL,
  `cid` bigint(20) NOT NULL,
  PRIMARY KEY (`cid`),
  KEY `itemIDIndex` (`itemID`),
  CONSTRAINT `FKjglciy3em0hetj8qst22ys5ea` FOREIGN KEY (`cid`) REFERENCES `evekit_cached_data` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `evekit_data_bookmark`
--

DROP TABLE IF EXISTS `evekit_data_bookmark`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evekit_data_bookmark` (
  `bookmarkCreatorID` bigint(20) NOT NULL,
  `bookmarkID` int(11) NOT NULL,
  `created` bigint(20) NOT NULL,
  `folderCreatorID` bigint(20) NOT NULL,
  `folderID` int(11) NOT NULL,
  `folderName` varchar(255) DEFAULT NULL,
  `itemID` bigint(20) NOT NULL,
  `locationID` bigint(20) NOT NULL,
  `memo` varchar(255) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `typeID` int(11) NOT NULL,
  `x` double NOT NULL,
  `y` double NOT NULL,
  `z` double NOT NULL,
  `cid` bigint(20) NOT NULL,
  PRIMARY KEY (`cid`),
  KEY `folderIDIndex` (`folderID`),
  KEY `bookmarkIDIndex` (`bookmarkID`),
  CONSTRAINT `FKbf010sxmchabhfwglfg14742g` FOREIGN KEY (`cid`) REFERENCES `evekit_cached_data` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `evekit_data_calendar_event_attendee`
--

DROP TABLE IF EXISTS `evekit_data_calendar_event_attendee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evekit_data_calendar_event_attendee` (
  `characterID` bigint(20) NOT NULL,
  `characterName` varchar(255) DEFAULT NULL,
  `eventID` bigint(20) NOT NULL,
  `response` varchar(255) DEFAULT NULL,
  `cid` bigint(20) NOT NULL,
  PRIMARY KEY (`cid`),
  KEY `eventIDIndex` (`eventID`),
  KEY `characterIDIndex` (`characterID`),
  CONSTRAINT `FKljm4hurdhg3yrexo1qa74wjrq` FOREIGN KEY (`cid`) REFERENCES `evekit_cached_data` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `evekit_data_capsuleer`
--

DROP TABLE IF EXISTS `evekit_data_capsuleer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evekit_data_capsuleer` (
  `accountBalanceExpiry` bigint(20) NOT NULL,
  `accountStatusExpiry` bigint(20) NOT NULL,
  `assetListExpiry` bigint(20) NOT NULL,
  `blueprintsExpiry` bigint(20) NOT NULL,
  `bookmarksExpiry` bigint(20) NOT NULL,
  `calendarEventAttendeesExpiry` bigint(20) NOT NULL,
  `characterID` bigint(20) NOT NULL,
  `characterName` varchar(255) DEFAULT NULL,
  `characterSheetExpiry` bigint(20) NOT NULL,
  `chatChannelsExpiry` bigint(20) NOT NULL,
  `contactListExpiry` bigint(20) NOT NULL,
  `contactNotificationsExpiry` bigint(20) NOT NULL,
  `contractBidsExpiry` bigint(20) NOT NULL,
  `contractItemsExpiry` bigint(20) NOT NULL,
  `contractsExpiry` bigint(20) NOT NULL,
  `facWarStatsExpiry` bigint(20) NOT NULL,
  `industryJobsExpiry` bigint(20) NOT NULL,
  `industryJobsHistoryExpiry` bigint(20) NOT NULL,
  `killlogExpiry` bigint(20) NOT NULL,
  `locationsExpiry` bigint(20) NOT NULL,
  `mailBodiesExpiry` bigint(20) NOT NULL,
  `mailMessagesExpiry` bigint(20) NOT NULL,
  `mailingListsExpiry` bigint(20) NOT NULL,
  `marketOrdersExpiry` bigint(20) NOT NULL,
  `medalsExpiry` bigint(20) NOT NULL,
  `notificationTextsExpiry` bigint(20) NOT NULL,
  `notificationsExpiry` bigint(20) NOT NULL,
  `partialCharacterSheetExpiry` bigint(20) NOT NULL,
  `planetaryColoniesExpiry` bigint(20) NOT NULL,
  `researchExpiry` bigint(20) NOT NULL,
  `skillInTrainingExpiry` bigint(20) NOT NULL,
  `skillQueueExpiry` bigint(20) NOT NULL,
  `skillsExpiry` bigint(20) NOT NULL,
  `standingsExpiry` bigint(20) NOT NULL,
  `upcomingCalendarEventsExpiry` bigint(20) NOT NULL,
  `walletJournalExpiry` bigint(20) NOT NULL,
  `walletTransactionsExpiry` bigint(20) NOT NULL,
  `cid` bigint(20) NOT NULL,
  PRIMARY KEY (`cid`),
  CONSTRAINT `FK9umg7lx8r2xcmhhgh0jr25r7j` FOREIGN KEY (`cid`) REFERENCES `evekit_cached_data` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `evekit_data_character_contact_notification`
--

DROP TABLE IF EXISTS `evekit_data_character_contact_notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evekit_data_character_contact_notification` (
  `messageData` varchar(255) DEFAULT NULL,
  `notificationID` bigint(20) NOT NULL,
  `senderID` bigint(20) NOT NULL,
  `senderName` varchar(255) DEFAULT NULL,
  `sentDate` bigint(20) NOT NULL,
  `cid` bigint(20) NOT NULL,
  PRIMARY KEY (`cid`),
  KEY `notificationIDIndex` (`notificationID`),
  KEY `sentDateIndex` (`sentDate`),
  CONSTRAINT `FK6nu7kygdu21gegh5y8whbsyok` FOREIGN KEY (`cid`) REFERENCES `evekit_cached_data` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `evekit_data_character_mail_message`
--

DROP TABLE IF EXISTS `evekit_data_character_mail_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evekit_data_character_mail_message` (
  `corpOrAllianceID` bigint(20) NOT NULL,
  `messageID` bigint(20) NOT NULL,
  `msgRead` bit(1) NOT NULL,
  `senderID` bigint(20) NOT NULL,
  `senderName` varchar(255) DEFAULT NULL,
  `senderTypeID` int(11) NOT NULL,
  `sentDate` bigint(20) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `cid` bigint(20) NOT NULL,
  PRIMARY KEY (`cid`),
  KEY `messageIDIndex` (`messageID`),
  KEY `sentDateIndex` (`sentDate`),
  KEY `msgReadIndex` (`msgRead`),
  CONSTRAINT `FK2d3drpegqlasjkvcv7dc55282` FOREIGN KEY (`cid`) REFERENCES `evekit_cached_data` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `evekit_data_character_mail_message_body`
--

DROP TABLE IF EXISTS `evekit_data_character_mail_message_body`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evekit_data_character_mail_message_body` (
  `body` longtext,
  `messageID` bigint(20) NOT NULL,
  `retrieved` bit(1) NOT NULL,
  `cid` bigint(20) NOT NULL,
  PRIMARY KEY (`cid`),
  KEY `messageIDIndex` (`messageID`),
  KEY `retrievedIndex` (`retrieved`),
  CONSTRAINT `FKiyhywjkcxf094tqvnlmbl5k4q` FOREIGN KEY (`cid`) REFERENCES `evekit_cached_data` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `evekit_data_character_medal`
--

DROP TABLE IF EXISTS `evekit_data_character_medal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evekit_data_character_medal` (
  `corporationID` bigint(20) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `issued` bigint(20) NOT NULL,
  `issuerID` bigint(20) NOT NULL,
  `medalID` int(11) NOT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `cid` bigint(20) NOT NULL,
  PRIMARY KEY (`cid`),
  KEY `medalIDIndex` (`medalID`),
  KEY `issuedIndex` (`issued`),
  CONSTRAINT `FKb7vl96yicjrc3x69if4r1mr39` FOREIGN KEY (`cid`) REFERENCES `evekit_cached_data` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `evekit_data_character_notification`
--

DROP TABLE IF EXISTS `evekit_data_character_notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evekit_data_character_notification` (
  `msgRead` bit(1) NOT NULL,
  `notificationID` bigint(20) NOT NULL,
  `senderID` bigint(20) NOT NULL,
  `sentDate` bigint(20) NOT NULL,
  `typeID` int(11) NOT NULL,
  `cid` bigint(20) NOT NULL,
  PRIMARY KEY (`cid`),
  KEY `notificationIDIndex` (`notificationID`),
  KEY `sentDateIndex` (`sentDate`),
  KEY `msgReadIndex` (`msgRead`),
  CONSTRAINT `FKney1d27w8imdarfv44ryco9ee` FOREIGN KEY (`cid`) REFERENCES `evekit_cached_data` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `evekit_data_character_notification_body`
--

DROP TABLE IF EXISTS `evekit_data_character_notification_body`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evekit_data_character_notification_body` (
  `missing` bit(1) NOT NULL,
  `notificationID` bigint(20) NOT NULL,
  `retrieved` bit(1) NOT NULL,
  `text` longtext,
  `cid` bigint(20) NOT NULL,
  PRIMARY KEY (`cid`),
  KEY `notificationIDIndex` (`notificationID`),
  KEY `retrievedIndex` (`retrieved`),
  CONSTRAINT `FKa2eto50gu52d6lci0v8q6fdin` FOREIGN KEY (`cid`) REFERENCES `evekit_cached_data` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `evekit_data_character_role`
--

DROP TABLE IF EXISTS `evekit_data_character_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evekit_data_character_role` (
  `roleCategory` varchar(255) DEFAULT NULL,
  `roleID` bigint(20) NOT NULL,
  `roleName` varchar(255) DEFAULT NULL,
  `cid` bigint(20) NOT NULL,
  PRIMARY KEY (`cid`),
  KEY `roleCategoryIndex` (`roleCategory`),
  KEY `roleIDIndex` (`roleID`),
  CONSTRAINT `FKd1bp4cp323quea3wegl3o1t58` FOREIGN KEY (`cid`) REFERENCES `evekit_cached_data` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `evekit_data_character_sheet`
--

DROP TABLE IF EXISTS `evekit_data_character_sheet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evekit_data_character_sheet` (
  `allianceID` bigint(20) NOT NULL,
  `allianceName` varchar(255) DEFAULT NULL,
  `ancestry` varchar(255) DEFAULT NULL,
  `ancestryID` int(11) NOT NULL,
  `bloodline` varchar(255) DEFAULT NULL,
  `bloodlineID` int(11) NOT NULL,
  `characterID` bigint(20) NOT NULL,
  `charisma` int(11) NOT NULL,
  `corporationID` bigint(20) NOT NULL,
  `corporationName` varchar(255) DEFAULT NULL,
  `doB` bigint(20) NOT NULL,
  `factionID` bigint(20) NOT NULL,
  `factionName` varchar(255) DEFAULT NULL,
  `freeRespecs` int(11) NOT NULL,
  `freeSkillPoints` bigint(20) NOT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `homeStationID` bigint(20) NOT NULL,
  `intelligence` int(11) NOT NULL,
  `lastRespecDate` bigint(20) NOT NULL,
  `lastTimedRespec` bigint(20) NOT NULL,
  `memory` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `perception` int(11) NOT NULL,
  `race` varchar(255) DEFAULT NULL,
  `remoteStationDate` bigint(20) NOT NULL,
  `willpower` int(11) NOT NULL,
  `cid` bigint(20) NOT NULL,
  PRIMARY KEY (`cid`),
  CONSTRAINT `FKbgm6x09v7e91ls3yod2n453kq` FOREIGN KEY (`cid`) REFERENCES `evekit_cached_data` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `evekit_data_character_sheet_balance`
--

DROP TABLE IF EXISTS `evekit_data_character_sheet_balance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evekit_data_character_sheet_balance` (
  `balance` decimal(19,2) DEFAULT NULL,
  `cid` bigint(20) NOT NULL,
  PRIMARY KEY (`cid`),
  CONSTRAINT `FKq8o4jn3qg31vtqrcei4mkya6r` FOREIGN KEY (`cid`) REFERENCES `evekit_cached_data` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `evekit_data_character_sheet_clone`
--

DROP TABLE IF EXISTS `evekit_data_character_sheet_clone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evekit_data_character_sheet_clone` (
  `cloneJumpDate` bigint(20) NOT NULL,
  `cid` bigint(20) NOT NULL,
  PRIMARY KEY (`cid`),
  CONSTRAINT `FK64tujv9nqh8usj0saq8w7cei4` FOREIGN KEY (`cid`) REFERENCES `evekit_cached_data` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `evekit_data_character_sheet_jump`
--

DROP TABLE IF EXISTS `evekit_data_character_sheet_jump`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evekit_data_character_sheet_jump` (
  `jumpActivation` bigint(20) NOT NULL,
  `jumpFatigue` bigint(20) NOT NULL,
  `jumpLastUpdate` bigint(20) NOT NULL,
  `cid` bigint(20) NOT NULL,
  PRIMARY KEY (`cid`),
  CONSTRAINT `FK6h5a95i6qo9nyabajkwt6ngrb` FOREIGN KEY (`cid`) REFERENCES `evekit_cached_data` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `evekit_data_character_skill`
--

DROP TABLE IF EXISTS `evekit_data_character_skill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evekit_data_character_skill` (
  `level` int(11) NOT NULL,
  `published` bit(1) NOT NULL,
  `skillpoints` int(11) NOT NULL,
  `typeID` int(11) NOT NULL,
  `cid` bigint(20) NOT NULL,
  PRIMARY KEY (`cid`),
  KEY `typeIDIndex` (`typeID`),
  CONSTRAINT `FKh1dxlcv41pmoq53ldhnobmd0o` FOREIGN KEY (`cid`) REFERENCES `evekit_cached_data` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `evekit_data_character_skill_in_training`
--

DROP TABLE IF EXISTS `evekit_data_character_skill_in_training`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evekit_data_character_skill_in_training` (
  `currentTrainingQueueTime` bigint(20) NOT NULL,
  `skillInTraining` bit(1) NOT NULL,
  `skillTypeID` int(11) NOT NULL,
  `trainingDestinationSP` int(11) NOT NULL,
  `trainingEndTime` bigint(20) NOT NULL,
  `trainingStartSP` int(11) NOT NULL,
  `trainingStartTime` bigint(20) NOT NULL,
  `trainingToLevel` int(11) NOT NULL,
  `cid` bigint(20) NOT NULL,
  PRIMARY KEY (`cid`),
  CONSTRAINT `FKghn0cqof4f2fu30jyt115m1eo` FOREIGN KEY (`cid`) REFERENCES `evekit_cached_data` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `evekit_data_character_title`
--

DROP TABLE IF EXISTS `evekit_data_character_title`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evekit_data_character_title` (
  `titleID` bigint(20) NOT NULL,
  `titleName` varchar(255) DEFAULT NULL,
  `cid` bigint(20) NOT NULL,
  PRIMARY KEY (`cid`),
  KEY `titleIDIndex` (`titleID`),
  CONSTRAINT `FKm774uxrfq2cadgwyoquxg5r5m` FOREIGN KEY (`cid`) REFERENCES `evekit_cached_data` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `evekit_data_chatchannel`
--

DROP TABLE IF EXISTS `evekit_data_chatchannel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evekit_data_chatchannel` (
  `channelID` bigint(20) NOT NULL,
  `comparisonKey` varchar(255) DEFAULT NULL,
  `displayName` varchar(255) DEFAULT NULL,
  `hasPassword` bit(1) NOT NULL,
  `motd` longtext,
  `ownerID` bigint(20) NOT NULL,
  `ownerName` varchar(255) DEFAULT NULL,
  `cid` bigint(20) NOT NULL,
  PRIMARY KEY (`cid`),
  KEY `channelIDIndex` (`channelID`),
  CONSTRAINT `FKhvnrfdyyop1vbim28naada5wp` FOREIGN KEY (`cid`) REFERENCES `evekit_cached_data` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `evekit_data_chatchannel_member`
--

DROP TABLE IF EXISTS `evekit_data_chatchannel_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evekit_data_chatchannel_member` (
  `accessorID` bigint(20) NOT NULL,
  `accessorName` varchar(255) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `channelID` bigint(20) NOT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `untilWhen` bigint(20) NOT NULL,
  `cid` bigint(20) NOT NULL,
  PRIMARY KEY (`cid`),
  KEY `channelIDIndex` (`channelID`),
  KEY `categoryIndex` (`category`),
  KEY `accessorIDIndex` (`accessorID`),
  CONSTRAINT `FKmopak1sh1uv4xqkvpm3ps9juv` FOREIGN KEY (`cid`) REFERENCES `evekit_cached_data` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `evekit_data_contact`
--

DROP TABLE IF EXISTS `evekit_data_contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evekit_data_contact` (
  `contactID` int(11) NOT NULL,
  `contactName` varchar(255) DEFAULT NULL,
  `contactTypeID` int(11) NOT NULL,
  `inWatchlist` bit(1) NOT NULL,
  `labelMask` bigint(20) NOT NULL,
  `list` varchar(255) DEFAULT NULL,
  `standing` double NOT NULL,
  `cid` bigint(20) NOT NULL,
  PRIMARY KEY (`cid`),
  KEY `listIndex` (`list`),
  KEY `contactIDIndex` (`contactID`),
  CONSTRAINT `FKkq6n1c29qntm0wljsra8wfb9k` FOREIGN KEY (`cid`) REFERENCES `evekit_cached_data` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `evekit_data_contact_label`
--

DROP TABLE IF EXISTS `evekit_data_contact_label`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evekit_data_contact_label` (
  `labelID` bigint(20) NOT NULL,
  `list` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `cid` bigint(20) NOT NULL,
  PRIMARY KEY (`cid`),
  KEY `listIndex` (`list`),
  KEY `labelIDIndex` (`labelID`),
  CONSTRAINT `FKau3mo752c2y2du1wydiwq7bhk` FOREIGN KEY (`cid`) REFERENCES `evekit_cached_data` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `evekit_data_container_log`
--

DROP TABLE IF EXISTS `evekit_data_container_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evekit_data_container_log` (
  `action` varchar(255) DEFAULT NULL,
  `actorID` bigint(20) NOT NULL,
  `actorName` varchar(255) DEFAULT NULL,
  `flag` int(11) NOT NULL,
  `itemID` bigint(20) NOT NULL,
  `itemTypeID` int(11) NOT NULL,
  `locationID` bigint(20) NOT NULL,
  `logTime` bigint(20) NOT NULL,
  `newConfiguration` varchar(255) DEFAULT NULL,
  `oldConfiguration` varchar(255) DEFAULT NULL,
  `passwordType` varchar(255) DEFAULT NULL,
  `quantity` bigint(20) NOT NULL,
  `typeID` int(11) NOT NULL,
  `cid` bigint(20) NOT NULL,
  PRIMARY KEY (`cid`),
  KEY `logTimeIndex` (`logTime`),
  CONSTRAINT `FKkrh2a657nrdgw84w7ps4n17if` FOREIGN KEY (`cid`) REFERENCES `evekit_cached_data` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `evekit_data_contract`
--

DROP TABLE IF EXISTS `evekit_data_contract`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evekit_data_contract` (
  `acceptorID` bigint(20) NOT NULL,
  `assigneeID` bigint(20) NOT NULL,
  `availability` varchar(255) DEFAULT NULL,
  `buyout` decimal(19,2) DEFAULT NULL,
  `collateral` decimal(19,2) DEFAULT NULL,
  `contractID` bigint(20) NOT NULL,
  `dateAccepted` bigint(20) NOT NULL,
  `dateCompleted` bigint(20) NOT NULL,
  `dateExpired` bigint(20) NOT NULL,
  `dateIssued` bigint(20) NOT NULL,
  `endStationID` bigint(20) NOT NULL,
  `forCorp` bit(1) NOT NULL,
  `issuerCorpID` bigint(20) NOT NULL,
  `issuerID` bigint(20) NOT NULL,
  `numDays` int(11) NOT NULL,
  `price` decimal(19,2) DEFAULT NULL,
  `reward` decimal(19,2) DEFAULT NULL,
  `startStationID` bigint(20) NOT NULL,
  `status` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `volume` double NOT NULL,
  `cid` bigint(20) NOT NULL,
  PRIMARY KEY (`cid`),
  KEY `contractIDIndex` (`contractID`),
  KEY `dateIssuedIndex` (`dateIssued`),
  CONSTRAINT `FKgcgcjbbqqppkftsqlm7o5swhk` FOREIGN KEY (`cid`) REFERENCES `evekit_cached_data` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `evekit_data_contract_bid`
--

DROP TABLE IF EXISTS `evekit_data_contract_bid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evekit_data_contract_bid` (
  `amount` decimal(19,2) DEFAULT NULL,
  `bidID` bigint(20) NOT NULL,
  `bidderID` bigint(20) NOT NULL,
  `contractID` bigint(20) NOT NULL,
  `dateBid` bigint(20) NOT NULL,
  `cid` bigint(20) NOT NULL,
  PRIMARY KEY (`cid`),
  KEY `contractIDIndex` (`contractID`),
  KEY `bidIDIndex` (`bidID`),
  CONSTRAINT `FK22o4baskslenvgcoehn08qc6p` FOREIGN KEY (`cid`) REFERENCES `evekit_cached_data` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `evekit_data_contract_item`
--

DROP TABLE IF EXISTS `evekit_data_contract_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evekit_data_contract_item` (
  `contractID` bigint(20) NOT NULL,
  `included` bit(1) NOT NULL,
  `quantity` bigint(20) NOT NULL,
  `rawQuantity` bigint(20) NOT NULL,
  `recordID` bigint(20) NOT NULL,
  `singleton` bit(1) NOT NULL,
  `typeID` int(11) NOT NULL,
  `cid` bigint(20) NOT NULL,
  PRIMARY KEY (`cid`),
  KEY `contractIDIndex` (`contractID`),
  KEY `recordIDIndex` (`recordID`),
  CONSTRAINT `FK9p6tkb0u7cuv46orf9ny98itj` FOREIGN KEY (`cid`) REFERENCES `evekit_cached_data` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `evekit_data_corporation`
--

DROP TABLE IF EXISTS `evekit_data_corporation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evekit_data_corporation` (
  `accountBalanceExpiry` bigint(20) NOT NULL,
  `assetListExpiry` bigint(20) NOT NULL,
  `blueprintsExpiry` bigint(20) NOT NULL,
  `bookmarksExpiry` bigint(20) NOT NULL,
  `contactListExpiry` bigint(20) NOT NULL,
  `containerLogExpiry` bigint(20) NOT NULL,
  `contractBidsExpiry` bigint(20) NOT NULL,
  `contractItemsExpiry` bigint(20) NOT NULL,
  `contractsExpiry` bigint(20) NOT NULL,
  `corporationID` bigint(20) NOT NULL,
  `corporationName` varchar(255) DEFAULT NULL,
  `corporationSheetExpiry` bigint(20) NOT NULL,
  `customsOfficeExpiry` bigint(20) NOT NULL,
  `facWarStatsExpiry` bigint(20) NOT NULL,
  `facilitiesExpiry` bigint(20) NOT NULL,
  `industryJobsExpiry` bigint(20) NOT NULL,
  `industryJobsHistoryExpiry` bigint(20) NOT NULL,
  `killlogExpiry` bigint(20) NOT NULL,
  `locationsExpiry` bigint(20) NOT NULL,
  `marketOrdersExpiry` bigint(20) NOT NULL,
  `medalsExpiry` bigint(20) NOT NULL,
  `memberMedalsExpiry` bigint(20) NOT NULL,
  `memberSecurityExpiry` bigint(20) NOT NULL,
  `memberSecurityLogExpiry` bigint(20) NOT NULL,
  `memberTrackingExpiry` bigint(20) NOT NULL,
  `outpostListExpiry` bigint(20) NOT NULL,
  `outpostServiceDetailExpiry` bigint(20) NOT NULL,
  `shareholdersExpiry` bigint(20) NOT NULL,
  `standingsExpiry` bigint(20) NOT NULL,
  `starbaseDetailExpiry` bigint(20) NOT NULL,
  `starbaseListExpiry` bigint(20) NOT NULL,
  `titlesExpiry` bigint(20) NOT NULL,
  `walletJournalExpiry` bigint(20) NOT NULL,
  `walletTransactionsExpiry` bigint(20) NOT NULL,
  `cid` bigint(20) NOT NULL,
  PRIMARY KEY (`cid`),
  CONSTRAINT `FKsn9u8pe6d9bjsxlj0p0vjnp9m` FOREIGN KEY (`cid`) REFERENCES `evekit_cached_data` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `evekit_data_corporation_medal`
--

DROP TABLE IF EXISTS `evekit_data_corporation_medal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evekit_data_corporation_medal` (
  `created` bigint(20) NOT NULL,
  `creatorID` bigint(20) NOT NULL,
  `description` longtext,
  `medalID` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `cid` bigint(20) NOT NULL,
  PRIMARY KEY (`cid`),
  KEY `medalIDIndex` (`medalID`),
  CONSTRAINT `FK3v6tdb62jmusa056oi624wixa` FOREIGN KEY (`cid`) REFERENCES `evekit_cached_data` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `evekit_data_corporation_member_medal`
--

DROP TABLE IF EXISTS `evekit_data_corporation_member_medal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evekit_data_corporation_member_medal` (
  `characterID` bigint(20) NOT NULL,
  `issued` bigint(20) NOT NULL,
  `issuerID` bigint(20) NOT NULL,
  `medalID` int(11) NOT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `cid` bigint(20) NOT NULL,
  PRIMARY KEY (`cid`),
  KEY `medalIDIndex` (`medalID`),
  KEY `characterIDIndex` (`characterID`),
  KEY `issuedIndex` (`issued`),
  CONSTRAINT `FKsob2d6nd8x0coigolvuwsxpg8` FOREIGN KEY (`cid`) REFERENCES `evekit_cached_data` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `evekit_data_corporation_sheet`
--

DROP TABLE IF EXISTS `evekit_data_corporation_sheet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evekit_data_corporation_sheet` (
  `allianceID` bigint(20) NOT NULL,
  `allianceName` varchar(255) DEFAULT NULL,
  `ceoID` bigint(20) NOT NULL,
  `ceoName` varchar(255) DEFAULT NULL,
  `corporationID` bigint(20) NOT NULL,
  `corporationName` varchar(255) DEFAULT NULL,
  `description` longtext,
  `logoColor1` int(11) NOT NULL,
  `logoColor2` int(11) NOT NULL,
  `logoColor3` int(11) NOT NULL,
  `logoGraphicID` int(11) NOT NULL,
  `logoShape1` int(11) NOT NULL,
  `logoShape2` int(11) NOT NULL,
  `logoShape3` int(11) NOT NULL,
  `memberCount` int(11) NOT NULL,
  `memberLimit` int(11) NOT NULL,
  `shares` int(11) NOT NULL,
  `stationID` bigint(20) NOT NULL,
  `stationName` varchar(255) DEFAULT NULL,
  `taxRate` double NOT NULL,
  `ticker` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `cid` bigint(20) NOT NULL,
  PRIMARY KEY (`cid`),
  CONSTRAINT `FK666jcqvem9b107lc4aab8miap` FOREIGN KEY (`cid`) REFERENCES `evekit_cached_data` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `evekit_data_corporation_title`
--

DROP TABLE IF EXISTS `evekit_data_corporation_title`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evekit_data_corporation_title` (
  `titleID` bigint(20) NOT NULL,
  `titleName` varchar(255) DEFAULT NULL,
  `cid` bigint(20) NOT NULL,
  PRIMARY KEY (`cid`),
  KEY `titleIDIndex` (`titleID`),
  CONSTRAINT `FK4ok41rrxc5em4gs3tk28hhyf7` FOREIGN KEY (`cid`) REFERENCES `evekit_cached_data` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `evekit_data_customs_office`
--

DROP TABLE IF EXISTS `evekit_data_customs_office`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evekit_data_customs_office` (
  `allowAlliance` bit(1) NOT NULL,
  `allowStandings` bit(1) NOT NULL,
  `itemID` bigint(20) NOT NULL,
  `reinforceHour` int(11) NOT NULL,
  `solarSystemID` int(11) NOT NULL,
  `solarSystemName` varchar(255) DEFAULT NULL,
  `standingLevel` double NOT NULL,
  `taxRateAlliance` double NOT NULL,
  `taxRateCorp` double NOT NULL,
  `taxRateStandingBad` double NOT NULL,
  `taxRateStandingGood` double NOT NULL,
  `taxRateStandingHigh` double NOT NULL,
  `taxRateStandingHorrible` double NOT NULL,
  `taxRateStandingNeutral` double NOT NULL,
  `cid` bigint(20) NOT NULL,
  PRIMARY KEY (`cid`),
  KEY `itemIDIndex` (`itemID`),
  CONSTRAINT `FKarcovr23690ncvey6lfjlj8yt` FOREIGN KEY (`cid`) REFERENCES `evekit_cached_data` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `evekit_data_division`
--

DROP TABLE IF EXISTS `evekit_data_division`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evekit_data_division` (
  `accountKey` int(11) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `wallet` bit(1) NOT NULL,
  `cid` bigint(20) NOT NULL,
  PRIMARY KEY (`cid`),
  KEY `walletIndex` (`wallet`),
  KEY `accountKeyIndex` (`accountKey`),
  CONSTRAINT `FK113ei2joc70xkp000ybwimv20` FOREIGN KEY (`cid`) REFERENCES `evekit_cached_data` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `evekit_data_facility`
--

DROP TABLE IF EXISTS `evekit_data_facility`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evekit_data_facility` (
  `facilityID` bigint(20) NOT NULL,
  `regionID` int(11) NOT NULL,
  `regionName` varchar(255) DEFAULT NULL,
  `solarSystemID` int(11) NOT NULL,
  `solarSystemName` varchar(255) DEFAULT NULL,
  `starbaseModifier` int(11) NOT NULL,
  `tax` double NOT NULL,
  `typeID` int(11) NOT NULL,
  `typeName` varchar(255) DEFAULT NULL,
  `cid` bigint(20) NOT NULL,
  PRIMARY KEY (`cid`),
  KEY `facilityIDIndex` (`facilityID`),
  CONSTRAINT `FKt9etm8j8ndav0yygr3oel9ppx` FOREIGN KEY (`cid`) REFERENCES `evekit_cached_data` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `evekit_data_facwarstats`
--

DROP TABLE IF EXISTS `evekit_data_facwarstats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evekit_data_facwarstats` (
  `currentRank` int(11) NOT NULL,
  `enlisted` bigint(20) NOT NULL,
  `factionID` int(11) NOT NULL,
  `factionName` varchar(255) DEFAULT NULL,
  `highestRank` int(11) NOT NULL,
  `killsLastWeek` int(11) NOT NULL,
  `killsTotal` int(11) NOT NULL,
  `killsYesterday` int(11) NOT NULL,
  `pilots` int(11) NOT NULL,
  `victoryPointsLastWeek` int(11) NOT NULL,
  `victoryPointsTotal` int(11) NOT NULL,
  `victoryPointsYesterday` int(11) NOT NULL,
  `cid` bigint(20) NOT NULL,
  PRIMARY KEY (`cid`),
  CONSTRAINT `FKrniwyp92igal67v010akjc4s2` FOREIGN KEY (`cid`) REFERENCES `evekit_cached_data` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `evekit_data_fuel`
--

DROP TABLE IF EXISTS `evekit_data_fuel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evekit_data_fuel` (
  `itemID` bigint(20) NOT NULL,
  `quantity` int(11) NOT NULL,
  `typeID` int(11) NOT NULL,
  `cid` bigint(20) NOT NULL,
  PRIMARY KEY (`cid`),
  KEY `itemIDIndex` (`itemID`),
  KEY `typeIDIndex` (`typeID`),
  CONSTRAINT `FKsgwqxh1kusu67t6jb7ti9aa52` FOREIGN KEY (`cid`) REFERENCES `evekit_cached_data` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `evekit_data_implant`
--

DROP TABLE IF EXISTS `evekit_data_implant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evekit_data_implant` (
  `typeID` int(11) NOT NULL,
  `typeName` varchar(255) DEFAULT NULL,
  `cid` bigint(20) NOT NULL,
  PRIMARY KEY (`cid`),
  KEY `typeIDIndex` (`typeID`),
  CONSTRAINT `FKpu0vbk6d6tye6inrru0av5a74` FOREIGN KEY (`cid`) REFERENCES `evekit_cached_data` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `evekit_data_industry_job`
--

DROP TABLE IF EXISTS `evekit_data_industry_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evekit_data_industry_job` (
  `activityID` int(11) NOT NULL,
  `blueprintID` bigint(20) NOT NULL,
  `blueprintLocationID` bigint(20) NOT NULL,
  `blueprintTypeID` int(11) NOT NULL,
  `blueprintTypeName` varchar(255) DEFAULT NULL,
  `completedCharacterID` bigint(20) NOT NULL,
  `completedDate` bigint(20) NOT NULL,
  `cost` decimal(19,2) DEFAULT NULL,
  `endDate` bigint(20) NOT NULL,
  `facilityID` bigint(20) NOT NULL,
  `installerID` bigint(20) NOT NULL,
  `installerName` varchar(255) DEFAULT NULL,
  `jobID` bigint(20) NOT NULL,
  `licensedRuns` int(11) NOT NULL,
  `outputLocationID` bigint(20) NOT NULL,
  `pauseDate` bigint(20) NOT NULL,
  `probability` double NOT NULL,
  `productTypeID` int(11) NOT NULL,
  `productTypeName` varchar(255) DEFAULT NULL,
  `runs` int(11) NOT NULL,
  `solarSystemID` int(11) NOT NULL,
  `solarSystemName` varchar(255) DEFAULT NULL,
  `startDate` bigint(20) NOT NULL,
  `stationID` bigint(20) NOT NULL,
  `status` int(11) NOT NULL,
  `successfulRuns` int(11) NOT NULL,
  `teamID` bigint(20) NOT NULL,
  `timeInSeconds` int(11) NOT NULL,
  `cid` bigint(20) NOT NULL,
  PRIMARY KEY (`cid`),
  KEY `jobIDIndex` (`jobID`),
  KEY `startDateIndex` (`startDate`),
  KEY `completedDateIndex` (`completedDate`),
  CONSTRAINT `FKt9jwmt3nydca575w3d69yv4is` FOREIGN KEY (`cid`) REFERENCES `evekit_cached_data` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `evekit_data_jump_clone`
--

DROP TABLE IF EXISTS `evekit_data_jump_clone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evekit_data_jump_clone` (
  `cloneName` varchar(255) DEFAULT NULL,
  `jumpCloneID` int(11) NOT NULL,
  `locationID` bigint(20) NOT NULL,
  `typeID` int(11) NOT NULL,
  `cid` bigint(20) NOT NULL,
  PRIMARY KEY (`cid`),
  KEY `jumpCloneIDIndex` (`jumpCloneID`),
  CONSTRAINT `FKt11sggiik4te41ql203e7c6ee` FOREIGN KEY (`cid`) REFERENCES `evekit_cached_data` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `evekit_data_jump_clone_implant`
--

DROP TABLE IF EXISTS `evekit_data_jump_clone_implant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evekit_data_jump_clone_implant` (
  `jumpCloneID` int(11) NOT NULL,
  `typeID` int(11) NOT NULL,
  `typeName` varchar(255) DEFAULT NULL,
  `cid` bigint(20) NOT NULL,
  PRIMARY KEY (`cid`),
  KEY `jumpCloneIDIndex` (`jumpCloneID`),
  KEY `typeIDIndex` (`typeID`),
  CONSTRAINT `FKaiv7lv0spvu1ql9m8rmer207q` FOREIGN KEY (`cid`) REFERENCES `evekit_cached_data` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `evekit_data_kill`
--

DROP TABLE IF EXISTS `evekit_data_kill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evekit_data_kill` (
  `killID` bigint(20) NOT NULL,
  `killTime` bigint(20) NOT NULL,
  `moonID` int(11) NOT NULL,
  `solarSystemID` bigint(20) NOT NULL,
  `cid` bigint(20) NOT NULL,
  PRIMARY KEY (`cid`),
  KEY `killIDIndex` (`killID`),
  KEY `killTimeIndex` (`killTime`),
  CONSTRAINT `FK7fvdt9hq1g66x01gchkjkpxay` FOREIGN KEY (`cid`) REFERENCES `evekit_cached_data` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `evekit_data_kill_attacker`
--

DROP TABLE IF EXISTS `evekit_data_kill_attacker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evekit_data_kill_attacker` (
  `allianceID` bigint(20) NOT NULL,
  `allianceName` varchar(255) DEFAULT NULL,
  `attackerCharacterID` bigint(20) NOT NULL,
  `attackerCharacterName` varchar(255) DEFAULT NULL,
  `attackerCorporationID` bigint(20) NOT NULL,
  `attackerCorporationName` varchar(255) DEFAULT NULL,
  `damageDone` int(11) NOT NULL,
  `factionID` int(11) NOT NULL,
  `factionName` varchar(255) DEFAULT NULL,
  `finalBlow` bit(1) NOT NULL,
  `killID` bigint(20) NOT NULL,
  `securityStatus` double NOT NULL,
  `shipTypeID` int(11) NOT NULL,
  `weaponTypeID` int(11) NOT NULL,
  `cid` bigint(20) NOT NULL,
  PRIMARY KEY (`cid`),
  KEY `killIDIndex` (`killID`),
  KEY `attackerCharacterIDIndex` (`attackerCharacterID`),
  CONSTRAINT `FK2iloh0s5ec9u6udtdr40eti9u` FOREIGN KEY (`cid`) REFERENCES `evekit_cached_data` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `evekit_data_kill_item`
--

DROP TABLE IF EXISTS `evekit_data_kill_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evekit_data_kill_item` (
  `containerSequence` int(11) NOT NULL,
  `flag` int(11) NOT NULL,
  `killID` bigint(20) NOT NULL,
  `qtyDestroyed` int(11) NOT NULL,
  `qtyDropped` int(11) NOT NULL,
  `sequence` int(11) NOT NULL,
  `singleton` bit(1) NOT NULL,
  `typeID` int(11) NOT NULL,
  `cid` bigint(20) NOT NULL,
  PRIMARY KEY (`cid`),
  KEY `killIDIndex` (`killID`),
  KEY `sequenceIndex` (`sequence`),
  KEY `containerSequenceIndex` (`containerSequence`),
  CONSTRAINT `FKofwujfv40y9hn5bttxuyfxtwr` FOREIGN KEY (`cid`) REFERENCES `evekit_cached_data` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `evekit_data_kill_victim`
--

DROP TABLE IF EXISTS `evekit_data_kill_victim`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evekit_data_kill_victim` (
  `allianceID` bigint(20) NOT NULL,
  `allianceName` varchar(255) DEFAULT NULL,
  `damageTaken` bigint(20) NOT NULL,
  `factionID` bigint(20) NOT NULL,
  `factionName` varchar(255) DEFAULT NULL,
  `killCharacterID` bigint(20) NOT NULL,
  `killCharacterName` varchar(255) DEFAULT NULL,
  `killCorporationID` bigint(20) NOT NULL,
  `killCorporationName` varchar(255) DEFAULT NULL,
  `killID` bigint(20) NOT NULL,
  `shipTypeID` int(11) NOT NULL,
  `cid` bigint(20) NOT NULL,
  PRIMARY KEY (`cid`),
  KEY `killIDIndex` (`killID`),
  CONSTRAINT `FKtf8yedmr2d03gx5fetbygg9r6` FOREIGN KEY (`cid`) REFERENCES `evekit_cached_data` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `evekit_data_location`
--

DROP TABLE IF EXISTS `evekit_data_location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evekit_data_location` (
  `itemID` bigint(20) NOT NULL,
  `itemName` varchar(255) DEFAULT NULL,
  `x` double NOT NULL,
  `y` double NOT NULL,
  `z` double NOT NULL,
  `cid` bigint(20) NOT NULL,
  PRIMARY KEY (`cid`),
  KEY `idIndex` (`itemID`),
  CONSTRAINT `FK8a06n6kqsbr5e4qsjpy6vwkx0` FOREIGN KEY (`cid`) REFERENCES `evekit_cached_data` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `evekit_data_mailing_list`
--

DROP TABLE IF EXISTS `evekit_data_mailing_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evekit_data_mailing_list` (
  `displayName` varchar(255) DEFAULT NULL,
  `listID` bigint(20) NOT NULL,
  `cid` bigint(20) NOT NULL,
  PRIMARY KEY (`cid`),
  KEY `listIDIndex` (`listID`),
  CONSTRAINT `FKtcibtajsal59lst1sc023d1e1` FOREIGN KEY (`cid`) REFERENCES `evekit_cached_data` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `evekit_data_market_order`
--

DROP TABLE IF EXISTS `evekit_data_market_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evekit_data_market_order` (
  `accountKey` int(11) NOT NULL,
  `bid` bit(1) NOT NULL,
  `charID` bigint(20) NOT NULL,
  `duration` int(11) NOT NULL,
  `escrow` decimal(19,2) DEFAULT NULL,
  `issued` bigint(20) NOT NULL,
  `minVolume` int(11) NOT NULL,
  `orderID` bigint(20) NOT NULL,
  `orderRange` int(11) NOT NULL,
  `orderState` int(11) NOT NULL,
  `price` decimal(19,2) DEFAULT NULL,
  `stationID` bigint(20) NOT NULL,
  `typeID` int(11) NOT NULL,
  `volEntered` int(11) NOT NULL,
  `volRemaining` int(11) NOT NULL,
  `cid` bigint(20) NOT NULL,
  PRIMARY KEY (`cid`),
  KEY `orderIDIndex` (`orderID`),
  KEY `issuedIndex` (`issued`),
  KEY `orderStateIndex` (`orderState`),
  CONSTRAINT `FKajpvxiq13ke8rp79ym8hpj1d` FOREIGN KEY (`cid`) REFERENCES `evekit_cached_data` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `evekit_data_member_security`
--

DROP TABLE IF EXISTS `evekit_data_member_security`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evekit_data_member_security` (
  `characterID` bigint(20) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `cid` bigint(20) NOT NULL,
  PRIMARY KEY (`cid`),
  KEY `characterIDIndex` (`characterID`),
  CONSTRAINT `FKeuxh021ir2xmsv1yl8k2lq9m7` FOREIGN KEY (`cid`) REFERENCES `evekit_cached_data` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `evekit_data_member_security_log`
--

DROP TABLE IF EXISTS `evekit_data_member_security_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evekit_data_member_security_log` (
  `changeTime` bigint(20) NOT NULL,
  `changedCharacterID` bigint(20) NOT NULL,
  `changedCharacterName` varchar(255) DEFAULT NULL,
  `issuerID` bigint(20) NOT NULL,
  `issuerName` varchar(255) DEFAULT NULL,
  `roleLocationType` varchar(255) DEFAULT NULL,
  `cid` bigint(20) NOT NULL,
  PRIMARY KEY (`cid`),
  KEY `changeTimeIndex` (`changeTime`),
  CONSTRAINT `FKtav6qkrvtcqxl0fr3qy1alqax` FOREIGN KEY (`cid`) REFERENCES `evekit_cached_data` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `evekit_data_member_tracking`
--

DROP TABLE IF EXISTS `evekit_data_member_tracking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evekit_data_member_tracking` (
  `base` varchar(255) DEFAULT NULL,
  `baseID` bigint(20) NOT NULL,
  `characterID` bigint(20) NOT NULL,
  `grantableRoles` bigint(20) NOT NULL,
  `location` varchar(255) DEFAULT NULL,
  `locationID` bigint(20) NOT NULL,
  `logoffDateTime` bigint(20) NOT NULL,
  `logonDateTime` bigint(20) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `roles` bigint(20) NOT NULL,
  `shipType` varchar(255) DEFAULT NULL,
  `shipTypeID` int(11) NOT NULL,
  `startDateTime` bigint(20) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `cid` bigint(20) NOT NULL,
  PRIMARY KEY (`cid`),
  KEY `characterIDIndex` (`characterID`),
  CONSTRAINT `FKdg4h1aiver8x1ka9vsgk05s36` FOREIGN KEY (`cid`) REFERENCES `evekit_cached_data` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `evekit_data_outpost`
--

DROP TABLE IF EXISTS `evekit_data_outpost`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evekit_data_outpost` (
  `dockingCostPerShipVolume` decimal(19,2) DEFAULT NULL,
  `officeRentalCost` decimal(19,2) DEFAULT NULL,
  `ownerID` bigint(20) NOT NULL,
  `reprocessingEfficiency` double NOT NULL,
  `reprocessingStationTake` double NOT NULL,
  `solarSystemID` int(11) NOT NULL,
  `standingOwnerID` bigint(20) NOT NULL,
  `stationID` bigint(20) NOT NULL,
  `stationName` varchar(255) DEFAULT NULL,
  `stationTypeID` int(11) NOT NULL,
  `x` bigint(20) NOT NULL,
  `y` bigint(20) NOT NULL,
  `z` bigint(20) NOT NULL,
  `cid` bigint(20) NOT NULL,
  PRIMARY KEY (`cid`),
  KEY `stationIDIndex` (`stationID`),
  CONSTRAINT `FKrahwxyv0bpeb4pkqvwivkcsdr` FOREIGN KEY (`cid`) REFERENCES `evekit_cached_data` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `evekit_data_outpost_service_detail`
--

DROP TABLE IF EXISTS `evekit_data_outpost_service_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evekit_data_outpost_service_detail` (
  `discountPerGoodStanding` decimal(19,2) DEFAULT NULL,
  `minStanding` double NOT NULL,
  `ownerID` bigint(20) NOT NULL,
  `serviceName` varchar(255) DEFAULT NULL,
  `stationID` bigint(20) NOT NULL,
  `surchargePerBadStanding` decimal(19,2) DEFAULT NULL,
  `cid` bigint(20) NOT NULL,
  PRIMARY KEY (`cid`),
  KEY `stationIDIndex` (`stationID`),
  KEY `serviceNameIndex` (`serviceName`),
  CONSTRAINT `FKgocrimmhk6224v94102ytmnuo` FOREIGN KEY (`cid`) REFERENCES `evekit_cached_data` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `evekit_data_planetary_colony`
--

DROP TABLE IF EXISTS `evekit_data_planetary_colony`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evekit_data_planetary_colony` (
  `lastUpdate` bigint(20) NOT NULL,
  `numberOfPins` int(11) NOT NULL,
  `ownerID` bigint(20) NOT NULL,
  `ownerName` varchar(255) DEFAULT NULL,
  `planetID` bigint(20) NOT NULL,
  `planetName` varchar(255) DEFAULT NULL,
  `planetTypeID` int(11) NOT NULL,
  `planetTypeName` varchar(255) DEFAULT NULL,
  `solarSystemID` int(11) NOT NULL,
  `solarSystemName` varchar(255) DEFAULT NULL,
  `upgradeLevel` int(11) NOT NULL,
  `cid` bigint(20) NOT NULL,
  PRIMARY KEY (`cid`),
  KEY `planetIDIndex` (`planetID`),
  CONSTRAINT `FK4w98wjex22pr8pqef8sirdxjt` FOREIGN KEY (`cid`) REFERENCES `evekit_cached_data` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `evekit_data_planetary_link`
--

DROP TABLE IF EXISTS `evekit_data_planetary_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evekit_data_planetary_link` (
  `destinationPinID` bigint(20) NOT NULL,
  `linkLevel` int(11) NOT NULL,
  `planetID` bigint(20) NOT NULL,
  `sourcePinID` bigint(20) NOT NULL,
  `cid` bigint(20) NOT NULL,
  PRIMARY KEY (`cid`),
  KEY `planetIDIndex` (`planetID`),
  KEY `sourcePinIDIndex` (`sourcePinID`),
  KEY `destinationPinIDIndex` (`destinationPinID`),
  CONSTRAINT `FKg86r96dkljls6ji9ywtfkicxe` FOREIGN KEY (`cid`) REFERENCES `evekit_cached_data` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `evekit_data_planetary_pin`
--

DROP TABLE IF EXISTS `evekit_data_planetary_pin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evekit_data_planetary_pin` (
  `contentQuantity` int(11) NOT NULL,
  `contentTypeID` int(11) NOT NULL,
  `contentTypeName` varchar(255) DEFAULT NULL,
  `cycleTime` int(11) NOT NULL,
  `expiryTime` bigint(20) NOT NULL,
  `installTime` bigint(20) NOT NULL,
  `lastLaunchTime` bigint(20) NOT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `pinID` bigint(20) NOT NULL,
  `planetID` bigint(20) NOT NULL,
  `quantityPerCycle` int(11) NOT NULL,
  `schematicID` int(11) NOT NULL,
  `typeID` int(11) NOT NULL,
  `typeName` varchar(255) DEFAULT NULL,
  `cid` bigint(20) NOT NULL,
  PRIMARY KEY (`cid`),
  KEY `planetIDIndex` (`planetID`),
  KEY `pinIDIndex` (`pinID`),
  CONSTRAINT `FKshsbup2lwsrskhr6e32yllgey` FOREIGN KEY (`cid`) REFERENCES `evekit_cached_data` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `evekit_data_planetary_route`
--

DROP TABLE IF EXISTS `evekit_data_planetary_route`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evekit_data_planetary_route` (
  `contentTypeID` int(11) NOT NULL,
  `contentTypeName` varchar(255) DEFAULT NULL,
  `destinationPinID` bigint(20) NOT NULL,
  `planetID` bigint(20) NOT NULL,
  `quantity` int(11) NOT NULL,
  `routeID` bigint(20) NOT NULL,
  `sourcePinID` bigint(20) NOT NULL,
  `waypoint1` bigint(20) NOT NULL,
  `waypoint2` bigint(20) NOT NULL,
  `waypoint3` bigint(20) NOT NULL,
  `waypoint4` bigint(20) NOT NULL,
  `waypoint5` bigint(20) NOT NULL,
  `cid` bigint(20) NOT NULL,
  PRIMARY KEY (`cid`),
  KEY `planetIDIndex` (`planetID`),
  KEY `routeIDIndex` (`routeID`),
  CONSTRAINT `FK4cfd3gl2kttxgbcc4nvd3gi5k` FOREIGN KEY (`cid`) REFERENCES `evekit_cached_data` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `evekit_data_research_agent`
--

DROP TABLE IF EXISTS `evekit_data_research_agent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evekit_data_research_agent` (
  `agentID` int(11) NOT NULL,
  `currentPoints` double NOT NULL,
  `pointsPerDay` double NOT NULL,
  `remainderPoints` double NOT NULL,
  `researchStartDate` bigint(20) NOT NULL,
  `skillTypeID` int(11) NOT NULL,
  `cid` bigint(20) NOT NULL,
  PRIMARY KEY (`cid`),
  KEY `agentIDIndex` (`agentID`),
  CONSTRAINT `FKh7pxbuwgxlan1xovmb6tefict` FOREIGN KEY (`cid`) REFERENCES `evekit_cached_data` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `evekit_data_role`
--

DROP TABLE IF EXISTS `evekit_data_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evekit_data_role` (
  `roleDescription` longtext,
  `roleID` bigint(20) NOT NULL,
  `roleName` varchar(255) DEFAULT NULL,
  `cid` bigint(20) NOT NULL,
  PRIMARY KEY (`cid`),
  KEY `roleIDIndex` (`roleID`),
  CONSTRAINT `FKimnl8mrpxnfxs0yj3sh7pbnoi` FOREIGN KEY (`cid`) REFERENCES `evekit_cached_data` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `evekit_data_security_role`
--

DROP TABLE IF EXISTS `evekit_data_security_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evekit_data_security_role` (
  `roleID` bigint(20) NOT NULL,
  `roleName` varchar(255) DEFAULT NULL,
  `cid` bigint(20) NOT NULL,
  PRIMARY KEY (`cid`),
  KEY `roleIDIndex` (`roleID`),
  CONSTRAINT `FK3hod1c4dnx270v6reos8exl04` FOREIGN KEY (`cid`) REFERENCES `evekit_cached_data` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `evekit_data_security_title`
--

DROP TABLE IF EXISTS `evekit_data_security_title`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evekit_data_security_title` (
  `titleID` bigint(20) NOT NULL,
  `titleName` varchar(255) DEFAULT NULL,
  `cid` bigint(20) NOT NULL,
  PRIMARY KEY (`cid`),
  KEY `titleIDIndex` (`titleID`),
  CONSTRAINT `FKd0px8icwmxmoorswfgdvhni3d` FOREIGN KEY (`cid`) REFERENCES `evekit_cached_data` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `evekit_data_shareholder`
--

DROP TABLE IF EXISTS `evekit_data_shareholder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evekit_data_shareholder` (
  `isCorporation` bit(1) NOT NULL,
  `shareholderCorporationID` bigint(20) NOT NULL,
  `shareholderCorporationName` varchar(255) DEFAULT NULL,
  `shareholderID` bigint(20) NOT NULL,
  `shareholderName` varchar(255) DEFAULT NULL,
  `shares` int(11) NOT NULL,
  `cid` bigint(20) NOT NULL,
  PRIMARY KEY (`cid`),
  KEY `shareholderIDIndex` (`shareholderID`),
  CONSTRAINT `FKg4qtalnja9a7hcxtku2yljupi` FOREIGN KEY (`cid`) REFERENCES `evekit_cached_data` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `evekit_data_skill_in_queue`
--

DROP TABLE IF EXISTS `evekit_data_skill_in_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evekit_data_skill_in_queue` (
  `endSP` int(11) NOT NULL,
  `endTime` bigint(20) NOT NULL,
  `level` int(11) NOT NULL,
  `queuePosition` int(11) NOT NULL,
  `startSP` int(11) NOT NULL,
  `startTime` bigint(20) NOT NULL,
  `typeID` int(11) NOT NULL,
  `cid` bigint(20) NOT NULL,
  PRIMARY KEY (`cid`),
  KEY `queuePositionIndex` (`queuePosition`),
  CONSTRAINT `FKkhypfxxmca4opjmnpy129ars6` FOREIGN KEY (`cid`) REFERENCES `evekit_cached_data` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `evekit_data_standing`
--

DROP TABLE IF EXISTS `evekit_data_standing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evekit_data_standing` (
  `fromID` int(11) NOT NULL,
  `fromName` varchar(255) DEFAULT NULL,
  `standing` double NOT NULL,
  `standingEntity` varchar(255) DEFAULT NULL,
  `cid` bigint(20) NOT NULL,
  PRIMARY KEY (`cid`),
  KEY `standingEntityIndex` (`standingEntity`),
  KEY `fromIDIndex` (`fromID`),
  CONSTRAINT `FK460hsxt7s27c1imufb5fxtywx` FOREIGN KEY (`cid`) REFERENCES `evekit_cached_data` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `evekit_data_starbase`
--

DROP TABLE IF EXISTS `evekit_data_starbase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evekit_data_starbase` (
  `itemID` bigint(20) NOT NULL,
  `locationID` bigint(20) NOT NULL,
  `moonID` int(11) NOT NULL,
  `onlineTimestamp` bigint(20) NOT NULL,
  `standingOwnerID` bigint(20) NOT NULL,
  `state` int(11) NOT NULL,
  `stateTimestamp` bigint(20) NOT NULL,
  `typeID` int(11) NOT NULL,
  `cid` bigint(20) NOT NULL,
  PRIMARY KEY (`cid`),
  KEY `itemIDIndex` (`itemID`),
  CONSTRAINT `FK4pqhixjir45cf3q4s0u5rx64h` FOREIGN KEY (`cid`) REFERENCES `evekit_cached_data` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `evekit_data_starbase_detail`
--

DROP TABLE IF EXISTS `evekit_data_starbase_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evekit_data_starbase_detail` (
  `allowAllianceMembers` bit(1) NOT NULL,
  `allowCorporationMembers` bit(1) NOT NULL,
  `deployFlags` int(11) NOT NULL,
  `itemID` bigint(20) NOT NULL,
  `onAggressionEnabled` bit(1) NOT NULL,
  `onAggressionStanding` int(11) NOT NULL,
  `onCorporationWarEnabled` bit(1) NOT NULL,
  `onCorporationWarStanding` int(11) NOT NULL,
  `onStandingDropEnabled` bit(1) NOT NULL,
  `onStandingDropStanding` int(11) NOT NULL,
  `onStatusDropEnabled` bit(1) NOT NULL,
  `onStatusDropStanding` int(11) NOT NULL,
  `onlineTimestamp` bigint(20) NOT NULL,
  `state` int(11) NOT NULL,
  `stateTimestamp` bigint(20) NOT NULL,
  `usageFlags` int(11) NOT NULL,
  `useStandingsFrom` bigint(20) NOT NULL,
  `cid` bigint(20) NOT NULL,
  PRIMARY KEY (`cid`),
  KEY `itemIDIndex` (`itemID`),
  CONSTRAINT `FKgjxkg9w7lo8j5w1lqtm0nb7mw` FOREIGN KEY (`cid`) REFERENCES `evekit_cached_data` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `evekit_data_upcoming_calendar_event`
--

DROP TABLE IF EXISTS `evekit_data_upcoming_calendar_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evekit_data_upcoming_calendar_event` (
  `duration` int(11) NOT NULL,
  `eventDate` bigint(20) NOT NULL,
  `eventID` bigint(20) NOT NULL,
  `eventText` longtext,
  `eventTitle` varchar(255) DEFAULT NULL,
  `important` bit(1) NOT NULL,
  `ownerID` bigint(20) NOT NULL,
  `ownerName` varchar(255) DEFAULT NULL,
  `response` varchar(255) DEFAULT NULL,
  `cid` bigint(20) NOT NULL,
  PRIMARY KEY (`cid`),
  KEY `eventIDIndex` (`eventID`),
  CONSTRAINT `FKkp20ys5nkxqqnc8swj54kiwbe` FOREIGN KEY (`cid`) REFERENCES `evekit_cached_data` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `evekit_data_wallet_journal`
--

DROP TABLE IF EXISTS `evekit_data_wallet_journal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evekit_data_wallet_journal` (
  `accountKey` int(11) NOT NULL,
  `amount` decimal(19,2) DEFAULT NULL,
  `argID1` bigint(20) NOT NULL,
  `argName1` varchar(255) DEFAULT NULL,
  `balance` decimal(19,2) DEFAULT NULL,
  `date` bigint(20) NOT NULL,
  `ownerID1` bigint(20) NOT NULL,
  `ownerID2` bigint(20) NOT NULL,
  `ownerName1` varchar(255) DEFAULT NULL,
  `ownerName2` varchar(255) DEFAULT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `refID` bigint(20) NOT NULL,
  `refTypeID` int(11) NOT NULL,
  `taxAmount` decimal(19,2) DEFAULT NULL,
  `taxReceiverID` bigint(20) NOT NULL,
  `cid` bigint(20) NOT NULL,
  PRIMARY KEY (`cid`),
  KEY `accountKeyIndex` (`accountKey`),
  KEY `refIDIndex` (`refID`),
  KEY `dateIndex` (`date`),
  CONSTRAINT `FK3w2nrv5lb3xtlbmtgs8hp3fvr` FOREIGN KEY (`cid`) REFERENCES `evekit_cached_data` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `evekit_data_wallet_transaction`
--

DROP TABLE IF EXISTS `evekit_data_wallet_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evekit_data_wallet_transaction` (
  `accountKey` int(11) NOT NULL,
  `clientID` bigint(20) NOT NULL,
  `clientName` varchar(255) DEFAULT NULL,
  `clientTypeID` int(11) NOT NULL,
  `date` bigint(20) NOT NULL,
  `journalTransactionID` bigint(20) NOT NULL,
  `price` decimal(19,2) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `stationID` int(11) NOT NULL,
  `stationName` varchar(255) DEFAULT NULL,
  `transactionFor` varchar(255) DEFAULT NULL,
  `transactionID` bigint(20) NOT NULL,
  `transactionType` varchar(255) DEFAULT NULL,
  `typeID` int(11) NOT NULL,
  `typeName` varchar(255) DEFAULT NULL,
  `cid` bigint(20) NOT NULL,
  `characterID` bigint(20) NOT NULL,
  `characterName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`cid`),
  KEY `transactionIDIndex` (`transactionID`),
  CONSTRAINT `FKnch7ua2a6hrebva2xa7i0iogt` FOREIGN KEY (`cid`) REFERENCES `evekit_cached_data` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `evekit_model_type_map`
--

DROP TABLE IF EXISTS `evekit_model_type_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evekit_model_type_map` (
  `cid` bigint(20) NOT NULL,
  `typeName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `evekit_sequence`
--

DROP TABLE IF EXISTS `evekit_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evekit_sequence` (
  `value` bigint(20) NOT NULL,
  PRIMARY KEY (`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `evekit_sync`
--

DROP TABLE IF EXISTS `evekit_sync`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evekit_sync` (
  `tid` bigint(20) NOT NULL,
  `finished` bit(1) NOT NULL,
  `syncEnd` bigint(20) NOT NULL,
  `syncStart` bigint(20) NOT NULL,
  `aid` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`tid`),
  KEY `accountIndex` (`aid`),
  KEY `finishedIndex` (`aid`,`finished`),
  KEY `syncEndIndex` (`aid`,`syncEnd`),
  CONSTRAINT `FKowso7ky0wskldrvsyuxjq28ju` FOREIGN KEY (`aid`) REFERENCES `evekit_sync_accounts` (`aid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `evekit_sync_accounts`
--

DROP TABLE IF EXISTS `evekit_sync_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evekit_sync_accounts` (
  `aid` bigint(20) NOT NULL,
  `autoSynchronized` bit(1) NOT NULL,
  `characterType` bit(1) NOT NULL,
  `created` bigint(20) NOT NULL,
  `eveCharacterID` bigint(20) NOT NULL,
  `eveCharacterName` varchar(255) DEFAULT NULL,
  `eveCorporationID` bigint(20) NOT NULL,
  `eveCorporationName` varchar(255) DEFAULT NULL,
  `eveKey` int(11) NOT NULL,
  `eveVCode` varchar(255) DEFAULT NULL,
  `markedForDelete` bigint(20) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `uid` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`aid`),
  KEY `accountIndex` (`uid`),
  KEY `nameIndex` (`name`),
  KEY `autoIndex` (`autoSynchronized`),
  KEY `deleteableIndex` (`markedForDelete`),
  CONSTRAINT `FK60d7w3tlqqutjp6bfhku9rkf5` FOREIGN KEY (`uid`) REFERENCES `evekit_users` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `evekit_users`
--

DROP TABLE IF EXISTS `evekit_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evekit_users` (
  `uid` bigint(20) NOT NULL,
  `active` bit(1) NOT NULL,
  `admin` bit(1) NOT NULL,
  `created` bigint(20) NOT NULL,
  `last` bigint(20) NOT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `hibernate_sequence`
--

DROP TABLE IF EXISTS `hibernate_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `membersecurity_grantableroles`
--

DROP TABLE IF EXISTS `membersecurity_grantableroles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `membersecurity_grantableroles` (
  `MemberSecurity_cid` bigint(20) NOT NULL,
  `grantableRoles` bigint(20) DEFAULT NULL,
  KEY `FKk8wn1avutyxp5dt3ufdsvw5xu` (`MemberSecurity_cid`),
  CONSTRAINT `FKk8wn1avutyxp5dt3ufdsvw5xu` FOREIGN KEY (`MemberSecurity_cid`) REFERENCES `evekit_data_member_security` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `membersecurity_grantablerolesatbase`
--

DROP TABLE IF EXISTS `membersecurity_grantablerolesatbase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `membersecurity_grantablerolesatbase` (
  `MemberSecurity_cid` bigint(20) NOT NULL,
  `grantableRolesAtBase` bigint(20) DEFAULT NULL,
  KEY `FKiss99wtsmcjlpklrn3fr68i1x` (`MemberSecurity_cid`),
  CONSTRAINT `FKiss99wtsmcjlpklrn3fr68i1x` FOREIGN KEY (`MemberSecurity_cid`) REFERENCES `evekit_data_member_security` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `membersecurity_grantablerolesathq`
--

DROP TABLE IF EXISTS `membersecurity_grantablerolesathq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `membersecurity_grantablerolesathq` (
  `MemberSecurity_cid` bigint(20) NOT NULL,
  `grantableRolesAtHQ` bigint(20) DEFAULT NULL,
  KEY `FK220yr8y9w70isnei0l4w833w7` (`MemberSecurity_cid`),
  CONSTRAINT `FK220yr8y9w70isnei0l4w833w7` FOREIGN KEY (`MemberSecurity_cid`) REFERENCES `evekit_data_member_security` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `membersecurity_grantablerolesatother`
--

DROP TABLE IF EXISTS `membersecurity_grantablerolesatother`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `membersecurity_grantablerolesatother` (
  `MemberSecurity_cid` bigint(20) NOT NULL,
  `grantableRolesAtOther` bigint(20) DEFAULT NULL,
  KEY `FKrc3f3jliwq2bc9y8bv5x0b0oh` (`MemberSecurity_cid`),
  CONSTRAINT `FKrc3f3jliwq2bc9y8bv5x0b0oh` FOREIGN KEY (`MemberSecurity_cid`) REFERENCES `evekit_data_member_security` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `membersecurity_roles`
--

DROP TABLE IF EXISTS `membersecurity_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `membersecurity_roles` (
  `MemberSecurity_cid` bigint(20) NOT NULL,
  `roles` bigint(20) DEFAULT NULL,
  KEY `FK5tacxqtjmgrg5ynrsf9rn3dif` (`MemberSecurity_cid`),
  CONSTRAINT `FK5tacxqtjmgrg5ynrsf9rn3dif` FOREIGN KEY (`MemberSecurity_cid`) REFERENCES `evekit_data_member_security` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `membersecurity_rolesatbase`
--

DROP TABLE IF EXISTS `membersecurity_rolesatbase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `membersecurity_rolesatbase` (
  `MemberSecurity_cid` bigint(20) NOT NULL,
  `rolesAtBase` bigint(20) DEFAULT NULL,
  KEY `FKs1yejbr7r9rfy6wla95n8qyfw` (`MemberSecurity_cid`),
  CONSTRAINT `FKs1yejbr7r9rfy6wla95n8qyfw` FOREIGN KEY (`MemberSecurity_cid`) REFERENCES `evekit_data_member_security` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `membersecurity_rolesathq`
--

DROP TABLE IF EXISTS `membersecurity_rolesathq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `membersecurity_rolesathq` (
  `MemberSecurity_cid` bigint(20) NOT NULL,
  `rolesAtHQ` bigint(20) DEFAULT NULL,
  KEY `FK5s13bm93dv5wublufkbgo0wt4` (`MemberSecurity_cid`),
  CONSTRAINT `FK5s13bm93dv5wublufkbgo0wt4` FOREIGN KEY (`MemberSecurity_cid`) REFERENCES `evekit_data_member_security` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `membersecurity_rolesatother`
--

DROP TABLE IF EXISTS `membersecurity_rolesatother`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `membersecurity_rolesatother` (
  `MemberSecurity_cid` bigint(20) NOT NULL,
  `rolesAtOther` bigint(20) DEFAULT NULL,
  KEY `FKhwdhh1dny2jw994ip7jxww5r8` (`MemberSecurity_cid`),
  CONSTRAINT `FKhwdhh1dny2jw994ip7jxww5r8` FOREIGN KEY (`MemberSecurity_cid`) REFERENCES `evekit_data_member_security` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `membersecurity_titles`
--

DROP TABLE IF EXISTS `membersecurity_titles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `membersecurity_titles` (
  `MemberSecurity_cid` bigint(20) NOT NULL,
  `titles` bigint(20) DEFAULT NULL,
  KEY `FK3n5r70jgcldito1t9muk7en2t` (`MemberSecurity_cid`),
  CONSTRAINT `FK3n5r70jgcldito1t9muk7en2t` FOREIGN KEY (`MemberSecurity_cid`) REFERENCES `evekit_data_member_security` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `membersecuritylog_newroles`
--

DROP TABLE IF EXISTS `membersecuritylog_newroles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `membersecuritylog_newroles` (
  `MemberSecurityLog_cid` bigint(20) NOT NULL,
  `newRoles` bigint(20) DEFAULT NULL,
  KEY `FKpui1el73puj7ajj1smnconr3y` (`MemberSecurityLog_cid`),
  CONSTRAINT `FKpui1el73puj7ajj1smnconr3y` FOREIGN KEY (`MemberSecurityLog_cid`) REFERENCES `evekit_data_member_security_log` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `membersecuritylog_oldroles`
--

DROP TABLE IF EXISTS `membersecuritylog_oldroles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `membersecuritylog_oldroles` (
  `MemberSecurityLog_cid` bigint(20) NOT NULL,
  `oldRoles` bigint(20) DEFAULT NULL,
  KEY `FKfauyv7clnxaauw2dbbw5vub2d` (`MemberSecurityLog_cid`),
  CONSTRAINT `FKfauyv7clnxaauw2dbbw5vub2d` FOREIGN KEY (`MemberSecurityLog_cid`) REFERENCES `evekit_data_member_security_log` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `orbital_properties`
--

DROP TABLE IF EXISTS `orbital_properties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orbital_properties` (
  `propertyName` varchar(255) NOT NULL,
  `propertyValue` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`propertyName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-10-02 11:39:29
