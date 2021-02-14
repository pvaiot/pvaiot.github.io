/*
Navicat MySQL Data Transfer

Source Server         : MySql
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : bhawani_transport

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2019-04-20 10:51:39
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `acknowledgement`
-- ----------------------------
DROP TABLE IF EXISTS `acknowledgement`;
CREATE TABLE `acknowledgement` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `challan_id` varchar(50) DEFAULT NULL,
  `challan_number` varchar(100) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `origin` varchar(255) DEFAULT NULL,
  `destination` varchar(255) DEFAULT NULL,
  `vehicle_no` varchar(255) DEFAULT NULL,
  `pan_no` varchar(255) DEFAULT NULL,
  `reporting_date` date DEFAULT NULL,
  `reporting_time` varchar(20) DEFAULT NULL,
  `unloading_date` date DEFAULT NULL,
  `unloading_time` varchar(20) DEFAULT NULL,
  `balance_payable_at` varchar(255) DEFAULT NULL,
  `acknowledgement_received_date` date DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `balance_amount` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `challan_number` (`challan_number`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of acknowledgement
-- ----------------------------
INSERT INTO `acknowledgement` VALUES ('1', '2', '441047', '2019-03-07', 'FULBARI', 'GUWAHATI', 'NL02K8060', 'BTVPR2359J', '2019-03-11', '', '2019-03-11', '', 'SILIGURI', '2019-03-29', '2019-03-29', '3000', '2019-03-29 18:29:15', '2019-03-29 18:29:15');

-- ----------------------------
-- Table structure for `acknowledgement_child`
-- ----------------------------
DROP TABLE IF EXISTS `acknowledgement_child`;
CREATE TABLE `acknowledgement_child` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `acknowledgement_id` int(10) DEFAULT NULL,
  `consigment_no` varchar(100) DEFAULT NULL,
  `received_qty` varchar(50) DEFAULT NULL,
  `received_weight` varchar(100) DEFAULT NULL,
  `is_good_condition` varchar(255) DEFAULT NULL,
  `cause_of_loss` varchar(255) DEFAULT NULL,
  `damage_mode` varchar(255) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `quantity` varchar(255) DEFAULT NULL,
  `value` varchar(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`received_weight`),
  KEY `acknowledgement_id` (`acknowledgement_id`),
  CONSTRAINT `acknowledgement_child_ibfk_1` FOREIGN KEY (`acknowledgement_id`) REFERENCES `acknowledgement` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of acknowledgement_child
-- ----------------------------
INSERT INTO `acknowledgement_child` VALUES ('1', '1', null, '590', '16', 'Yes', null, null, null, null, null, '2019-03-29 18:29:15', '2019-03-29 18:29:15');

-- ----------------------------
-- Table structure for `appointment`
-- ----------------------------
DROP TABLE IF EXISTS `appointment`;
CREATE TABLE `appointment` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `patient_name` varchar(255) DEFAULT NULL,
  `mobile_no` varchar(50) DEFAULT NULL,
  `specialization` varchar(100) DEFAULT NULL,
  `specialist` varchar(100) DEFAULT NULL,
  `appointment_date_time` datetime DEFAULT NULL,
  `date_time_of_visit` datetime DEFAULT NULL,
  `reference_doctor` varchar(200) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`patient_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of appointment
-- ----------------------------

-- ----------------------------
-- Table structure for `balance_hire_process`
-- ----------------------------
DROP TABLE IF EXISTS `balance_hire_process`;
CREATE TABLE `balance_hire_process` (
  `balance_process_id` int(10) NOT NULL AUTO_INCREMENT,
  `challan_no` varchar(255) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `vehicle_no` varchar(255) DEFAULT NULL,
  `from` varchar(255) DEFAULT NULL,
  `to` varchar(255) DEFAULT NULL,
  `total_advance` varchar(255) DEFAULT NULL,
  `total_weight` varchar(255) DEFAULT NULL,
  `total_freight` varchar(255) DEFAULT NULL,
  `balance_amount` varchar(255) DEFAULT NULL,
  `detention` varchar(255) DEFAULT NULL,
  `local_lorry_hire` varchar(255) DEFAULT NULL,
  `labour_charge` varchar(255) DEFAULT NULL,
  `green_tax` varchar(255) DEFAULT NULL,
  `toll_tax` varchar(255) DEFAULT NULL,
  `shortage` varchar(255) DEFAULT NULL,
  `damage` varchar(255) DEFAULT NULL,
  `late_delivery` varchar(255) DEFAULT NULL,
  `fuel_recovery` varchar(255) DEFAULT NULL,
  `driver_claim` varchar(255) DEFAULT NULL,
  `incidental` varchar(255) DEFAULT NULL,
  `mamul` varchar(255) DEFAULT NULL,
  `lorry_hire_cash_discount` varchar(255) DEFAULT NULL,
  `branch` varchar(255) DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  PRIMARY KEY (`balance_process_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of balance_hire_process
-- ----------------------------

-- ----------------------------
-- Table structure for `bank_account`
-- ----------------------------
DROP TABLE IF EXISTS `bank_account`;
CREATE TABLE `bank_account` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `bank_id` varchar(50) DEFAULT NULL,
  `bank_name` varchar(255) DEFAULT NULL,
  `account_holder_name` varchar(255) DEFAULT NULL,
  `bank_account_no` varchar(255) DEFAULT NULL,
  `ifsc_code` varchar(255) DEFAULT NULL,
  `bank_address` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`bank_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of bank_account
-- ----------------------------

-- ----------------------------
-- Table structure for `bank_name`
-- ----------------------------
DROP TABLE IF EXISTS `bank_name`;
CREATE TABLE `bank_name` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `bank_name` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`bank_name`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of bank_name
-- ----------------------------
INSERT INTO `bank_name` VALUES ('1', 'Allahabad Bank', '2018-05-25 11:35:42', '2018-05-25 11:35:42');
INSERT INTO `bank_name` VALUES ('2', 'Andhra Bank', '2018-05-25 11:35:54', '2018-05-25 11:35:54');
INSERT INTO `bank_name` VALUES ('3', 'Axis Bank', '2018-05-25 11:36:04', '2018-05-25 11:36:04');
INSERT INTO `bank_name` VALUES ('4', 'Bank of Baroda', '2018-05-25 11:36:18', '2018-05-25 11:36:18');
INSERT INTO `bank_name` VALUES ('5', 'Bank of India', '2018-05-25 11:36:31', '2018-05-25 11:36:31');
INSERT INTO `bank_name` VALUES ('6', 'Bank of Maharashtra', '2018-05-25 11:36:42', '2018-05-25 11:36:42');
INSERT INTO `bank_name` VALUES ('7', 'Canara Bank', '2018-05-25 11:36:49', '2018-05-25 11:36:49');
INSERT INTO `bank_name` VALUES ('8', 'Central Bank of India', '2018-05-25 11:36:57', '2018-05-25 11:36:57');
INSERT INTO `bank_name` VALUES ('9', 'Union Bank', '2018-05-25 11:37:11', '2018-05-25 11:37:11');
INSERT INTO `bank_name` VALUES ('10', 'Corporation Bank', '2018-05-25 11:37:29', '2018-05-25 11:37:29');
INSERT INTO `bank_name` VALUES ('11', 'Federal Bank', '2018-05-25 11:37:56', '2018-05-25 11:37:56');
INSERT INTO `bank_name` VALUES ('12', 'ICICI Bank', '2018-05-25 11:38:09', '2018-05-25 11:38:09');
INSERT INTO `bank_name` VALUES ('13', 'IDBI Bank', '2018-05-25 11:38:21', '2018-05-25 11:38:21');
INSERT INTO `bank_name` VALUES ('14', 'Indian Bank', '2018-05-25 11:38:29', '2018-05-25 11:38:29');
INSERT INTO `bank_name` VALUES ('15', 'Kotak Bank', '2018-05-25 11:38:43', '2018-05-25 11:38:43');
INSERT INTO `bank_name` VALUES ('16', 'Punjab National Bank ', '2018-05-25 11:38:54', '2018-05-25 11:38:54');
INSERT INTO `bank_name` VALUES ('17', 'State Bank of India', '2018-05-25 11:39:08', '2018-05-25 11:39:08');
INSERT INTO `bank_name` VALUES ('18', 'Syndicate Bank', '2018-05-25 11:39:20', '2018-05-25 11:39:20');
INSERT INTO `bank_name` VALUES ('19', 'UCO Bank', '2018-05-25 11:39:29', '2018-05-25 11:39:29');
INSERT INTO `bank_name` VALUES ('20', 'Union Bank of India', '2018-05-25 11:39:39', '2018-05-25 11:39:39');
INSERT INTO `bank_name` VALUES ('21', 'United Bank of India', '2018-05-25 11:39:54', '2018-05-25 11:39:54');
INSERT INTO `bank_name` VALUES ('22', 'Vijaya Bank', '2018-05-25 11:40:03', '2018-05-25 11:40:03');
INSERT INTO `bank_name` VALUES ('23', 'Yes Bank Ltd', '2018-05-25 11:40:14', '2018-05-25 11:40:14');

-- ----------------------------
-- Table structure for `branch`
-- ----------------------------
DROP TABLE IF EXISTS `branch`;
CREATE TABLE `branch` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `city` varchar(255) DEFAULT NULL,
  `dist` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `branch_code` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of branch
-- ----------------------------
INSERT INTO `branch` VALUES ('1', 'SILIGURI', 'JALPAIGURI', 'WEST BENGAL', '1101', '2018-11-26 11:43:30', '2019-01-18 13:25:24');

-- ----------------------------
-- Table structure for `broker`
-- ----------------------------
DROP TABLE IF EXISTS `broker`;
CREATE TABLE `broker` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `pan_no` varchar(255) DEFAULT NULL,
  `mobile_no` varchar(20) DEFAULT NULL,
  `contact_no` varchar(20) DEFAULT NULL,
  `land_line_no` varchar(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of broker
-- ----------------------------
INSERT INTO `broker` VALUES ('1', 'GAZIPUR VANARASH ROADWAYS', 'MATIGARA PARIWAHAN NAGAR', '', '9832308523', '9679823282', '03532571644', '2018-12-22 10:39:56', '2018-12-22 10:39:56');
INSERT INTO `broker` VALUES ('2', 'SS FREIGHT CARRIER', 'FULBARI', 'AOSPC2545L', '9933901657', '7679471091', '8167490594', '2019-02-06 11:54:14', '2019-02-06 11:54:14');
INSERT INTO `broker` VALUES ('3', 'DURGAPUR ROADWAYS', 'PARIBAHAN NAGAR, MATIGARA, SILIGURI, DARJEELING', '', '9641077714', '9832501534', '8509911123', '2019-03-05 16:33:51', '2019-03-05 16:33:51');
INSERT INTO `broker` VALUES ('4', 'SILIGURI ANDHRA ROADWAYS', 'PARIBAHAN NAGAR, MATIGARA, SILIGURI, DARJEELING', '', '9832033788', '9832343066', '9832466088', '2019-03-05 16:35:03', '2019-03-05 16:35:03');
INSERT INTO `broker` VALUES ('5', 'NEW VENKATARAMANA TRANSPORT', 'PARIBAHAN NAGAR, MATIGARA, SILIGURI, DARJEELING', '', '9800449149', '9434071833', '9474077999', '2019-03-05 16:36:29', '2019-03-05 16:36:29');
INSERT INTO `broker` VALUES ('6', 'SANJAY ROADLINE', 'PARIBAHAN NAGAR, MATIGARA, SILIGURI, DARJEELING', '', '9732142726', '9434152026', '', '2019-03-05 16:37:23', '2019-03-05 16:37:23');
INSERT INTO `broker` VALUES ('7', 'GAZIPUR VANARASH ROADWAYS', 'PARIBAHAN NAGAR, MATIGARA, SILIGURI, DARJEELING', '', '9832308523', '9679823282', '', '2019-03-05 16:38:39', '2019-03-05 16:38:39');
INSERT INTO `broker` VALUES ('8', 'GORAKHPUR GOLDEN TRANSPORT', 'PARIBAHAN NAGAR, MATIGARA, SILIGURI, DARJEELING', '', '9434234637', '9832440702', '', '2019-03-05 16:39:59', '2019-03-05 16:39:59');
INSERT INTO `broker` VALUES ('9', 'BOMBAY FREIGHT CARRIER', 'PARIBAHAN NAGAR, MATIGARA, SILIGURI, DARJEELING', '', '9434496377', '9733447023', '03532571297', '2019-03-05 16:41:20', '2019-03-05 16:41:20');
INSERT INTO `broker` VALUES ('10', 'LUCKNOW KANPUR ROADLINES', 'PARIBAHAN NAGAR, MATIGARA, SILIGURI, DARJEELING', '', '9832373474', '9932038274', '', '2019-03-05 16:42:28', '2019-03-05 16:42:28');
INSERT INTO `broker` VALUES ('11', 'SAROJ ROADLINES', 'PARIBAHAN NAGAR, MATIGARA, SILIGURI, DARJEELING', '', '9832022226', '9932122226', '', '2019-03-05 16:44:40', '2019-03-05 16:44:40');
INSERT INTO `broker` VALUES ('12', 'MEDNIPUR SAMBALPUR ROADWAYS', 'PARIBAHAN NAGAR, MATIGARA, SILIGURI, DARJEELING', '', '9832313921', '7098564121', '', '2019-03-05 17:25:43', '2019-03-05 17:25:43');
INSERT INTO `broker` VALUES ('13', 'SRI SATYA SAI ROADWAYS', 'NH.31 BYPASS ROAD, SEVOKE ROAD, SILIGURI', '', '9434195007', '9002833926', '', '2019-03-05 19:16:50', '2019-03-05 19:16:50');
INSERT INTO `broker` VALUES ('14', 'MALWA GUWAHATI CARRIERS', 'OPP SITA MANSION BUILDING, NH 31 BY-PASS, SILIGURI', '', '9932994582', '9851003590', '', '2019-03-05 19:17:36', '2019-03-05 19:17:36');
INSERT INTO `broker` VALUES ('15', 'KAILASH TRANSPORT CO.', 'NH.31 BYPASS ROAD, SEVOKE ROAD, SILIGURI', '', '9932290765', '9832072174', '03532544041', '2019-03-05 19:18:35', '2019-03-05 19:18:35');
INSERT INTO `broker` VALUES ('16', 'PUNJAB GOLDEN TRANSPORT CO', 'REGULATED MARKET, MALLAGURI SILIGURI', '', '9832454061', '9641254061', '9614117556', '2019-03-05 19:19:26', '2019-03-05 19:19:26');
INSERT INTO `broker` VALUES ('17', 'SHREE RAM ROADWAYS', 'KARBALA MAIDAN , BURDWAN ROAD, SILIGURI', '', '9800012331', '9832062331', '', '2019-03-05 19:20:52', '2019-03-05 19:20:52');
INSERT INTO `broker` VALUES ('18', 'NEW SILIGURI AGARTALA ROADWAYS', 'FULBARI TRUCK TERMINUS', '', '9434877338', '9832490555', '03532568736', '2019-03-05 19:22:32', '2019-03-05 19:22:32');
INSERT INTO `broker` VALUES ('19', 'SHARMA TRANSPORT COMPANY', 'FULBARI BY PASS, SILIGURI', '', '9434431134', '', '', '2019-03-05 19:23:27', '2019-03-05 19:23:27');
INSERT INTO `broker` VALUES ('20', 'JAY MAA KALI ROADLINES', 'FULBARI BY PASS, SILIGURI', '', '9832016116', '9476296186', '9933570146', '2019-03-05 19:24:38', '2019-03-05 19:24:38');
INSERT INTO `broker` VALUES ('21', 'P B C TRANSPORT CORPORATION ', 'FULBARI MAIN ROAD', '', '9434377401', '9749051994', '9832052100', '2019-03-05 19:25:48', '2019-03-05 19:25:48');
INSERT INTO `broker` VALUES ('22', 'ETAWAH AGRA ROADLINE', 'FULBARI', '', '9832089005', '8670117227', '9733226034', '2019-03-05 19:26:41', '2019-03-05 19:26:41');
INSERT INTO `broker` VALUES ('23', 'NEW BIHAR TRANSPORT', 'FULBARI', '', '9434986159', '9831211559', '9679276193', '2019-03-05 19:27:51', '2019-03-05 19:27:51');
INSERT INTO `broker` VALUES ('24', 'SINGH ROADLINE ', 'REGULATED MARKET, MALLAGURI SILIGURI', '', '9733450335', '9749046443', '', '2019-03-05 19:28:26', '2019-03-05 19:28:26');
INSERT INTO `broker` VALUES ('25', 'PULAK DUTTA', 'BURDWAN ROAD', '', '8509180771', '9547300565', '9434343235', '2019-03-05 19:29:28', '2019-03-05 19:29:28');
INSERT INTO `broker` VALUES ('26', 'BRAMHPUTRA ROADWAYS', 'FULBARI TRUCK TERMINUS', '', '9832062866', '9851002866', '', '2019-03-05 19:30:15', '2019-03-05 19:30:15');
INSERT INTO `broker` VALUES ('27', 'UP GOLDEN CARRIER', 'FULBARI BY PASS, SILIGURI', '', '9434758846', '9933397722', '8250891835', '2019-03-05 19:31:07', '2019-03-05 19:31:07');
INSERT INTO `broker` VALUES ('28', 'SHREE DURGA ROADWAYS', 'FULBARI TRUCK TERMINUS', '', '9002538136', '9593044772', '', '2019-03-05 19:32:06', '2019-03-05 19:32:06');
INSERT INTO `broker` VALUES ('29', 'JAI HANUMAN ROADLINES', 'FULBARI TRUCK TERMINUS', '', '9832358221', '9641289801', '', '2019-03-06 15:28:58', '2019-03-06 15:28:58');
INSERT INTO `broker` VALUES ('30', 'ASSAM ROAD CARRIER', 'FULBARI TRUCK TERMINUS', '', '9434692238', '9832032937', '9434488886', '2019-03-06 15:30:11', '2019-03-06 15:30:11');
INSERT INTO `broker` VALUES ('31', 'NEW GAUTAM TRANSPORT ', 'OPP TRUCK TERMINUS, FULBARI', '', '9832077211', '9434068211', '9933391009', '2019-03-06 15:33:58', '2019-03-06 15:33:58');
INSERT INTO `broker` VALUES ('32', 'KUNDU CARRYING CORPORATION', 'FULBARI PARKING GROUND', '', '9832095798', '9647787797', '', '2019-03-06 15:35:03', '2019-03-06 15:35:03');
INSERT INTO `broker` VALUES ('33', 'NEW SAHA ROADWAYS', 'FULBARI TRUCK TERMINUS', '', '9641961202', '9749509102', '8927556383', '2019-03-06 15:35:54', '2019-03-06 15:35:54');
INSERT INTO `broker` VALUES ('34', 'BHAGWAT ROADLINES ', 'FULBARI', '', '9832373372', '9434476174', '8637511686', '2019-03-06 15:38:14', '2019-03-06 15:38:14');
INSERT INTO `broker` VALUES ('35', 'S S ROADLINES', 'REGULATED MARKET, MALLAGURI SILIGURI', '', '9800153283', '9832092524', '9800696943', '2019-03-06 15:39:59', '2019-03-06 15:39:59');
INSERT INTO `broker` VALUES ('36', 'GUPTA TRAILER SERVICE ', 'FULBARI BY PASS, SILIGURI', '', '9614192508', '8436617447', '', '2019-03-06 15:40:49', '2019-03-06 15:40:49');
INSERT INTO `broker` VALUES ('37', 'S R ROADWAYS', 'NEAR TRUCK TERMINUS, FULBARI', '', '9609906415', '9749051726', '', '2019-03-06 15:41:44', '2019-03-06 15:41:44');
INSERT INTO `broker` VALUES ('38', 'MISHRA ROAD LINE', 'PARIBAHAN NAGAR, MATIGARA, SILIGURI, DARJEELING', '', '8250977805', '9832044539', '', '2019-03-06 15:42:24', '2019-03-06 15:42:24');
INSERT INTO `broker` VALUES ('39', 'HAPUR GUWAHATI ROADLINES', 'NH.31 BYPASS ROAD, SEVOKE ROAD, SILIGURI', '', '9332670896', '8016810192', '', '2019-03-06 15:43:17', '2019-03-06 15:43:17');
INSERT INTO `broker` VALUES ('40', 'BABA LOKNATH TRANSPORTS', 'REGULATED MARKET, MALLAGURI SILIGURI', '', '9434228384', '9749473277', '8670600160', '2019-03-06 15:44:38', '2019-03-06 15:44:38');
INSERT INTO `broker` VALUES ('41', 'SURESH ROAD CARIER', 'REGULATED MARKET, MALLAGURI SILIGURI', '', '9832016842', '8670738323', '', '2019-03-06 15:45:18', '2019-03-06 15:45:18');
INSERT INTO `broker` VALUES ('42', 'BIHAR RANCHI CARRIER', 'PARIBAHAN NAGAR, MATIGARA, SILIGURI, DARJEELING', '', '9832072076', '9933430106', '9832093646', '2019-03-06 15:46:14', '2019-03-06 15:46:14');
INSERT INTO `broker` VALUES ('43', 'SHREE RADHE KRISHNA ROADWAYS', 'BYPASS ROAD OPP MAA SHAKTI KATA, SILIGURI', '', '9749270637', '', '', '2019-03-06 15:47:26', '2019-03-06 15:47:26');
INSERT INTO `broker` VALUES ('44', 'SANJAY ROAD CARRIER ', 'REGULATED MARKET, MALLAGURI SILIGURI', '', '9832039316', '8617679379', '8967352905', '2019-03-06 15:48:23', '2019-03-06 15:48:23');
INSERT INTO `broker` VALUES ('45', 'RAJPUT ROAD CARRIER', 'NEAR TRUCK TERMINUS, FULBARI', '', '6295592197', '9829397574', '', '2019-03-06 15:49:14', '2019-03-06 15:49:14');
INSERT INTO `broker` VALUES ('46', 'KOYAL ROADWAYS', 'FULBARI TRUCK TERMINUS', '', '8906801623', '7699875160', '', '2019-03-06 15:50:01', '2019-03-06 15:50:01');
INSERT INTO `broker` VALUES ('47', 'PUNJAB ASSAM ROADWAYS', 'FULBARI TRUCK TERMINUS', '', '9609138339', '8346866572', '', '2019-03-06 15:50:54', '2019-03-06 15:50:54');
INSERT INTO `broker` VALUES ('48', 'JMK LOGISTICS', 'MITAL COMPOUND, SEVOKE ROAD, SILIGURI', '', '9832550311', '7431844177', '9733128009', '2019-03-06 15:52:00', '2019-03-06 15:52:00');
INSERT INTO `broker` VALUES ('49', 'NEW INDIA TRANSPORT SERVICE', 'NH.31 BYPASS ROAD, SEVOKE ROAD, SILIGURI', '', '9547762244', '9647781035', '7431014384', '2019-03-06 15:53:07', '2019-03-06 15:53:07');
INSERT INTO `broker` VALUES ('50', 'ANAND TEMPO SERVICE', 'NH.31 BYPASS ROAD, SEVOKE ROAD, SILIGURI', '', '9832070393', '8967833111', '', '2019-03-06 15:53:48', '2019-03-06 15:53:48');
INSERT INTO `broker` VALUES ('51', 'JAMMU HIMACHAL ROADWAYS', 'SITA MANSION, OPP IG OFFICE, SEVOKE ROAD, SILIGURI', '', '9832378850', '8001400381', '', '2019-03-06 15:54:38', '2019-03-06 15:54:38');
INSERT INTO `broker` VALUES ('52', 'SARASWATI TRANSPORT CORPORATION', 'NH.31 BYPASS ROAD, SEVOKE ROAD, SILIGURI', '', '9434757536', '8101667330', '9332580542', '2019-03-06 15:55:39', '2019-03-06 15:55:39');
INSERT INTO `broker` VALUES ('53', 'ASSAM INDORE ROADWAYS', 'SITA MANSION, OPP IG OFFICE, SEVOKE ROAD, SILIGURI', '', '9832094161', '9434106634', '03532548615', '2019-03-06 15:56:41', '2019-03-06 15:56:41');
INSERT INTO `broker` VALUES ('54', 'NEW SAGAR TEMPO SERVICE', 'NH.31 BYPASS ROAD, SEVOKE ROAD, SILIGURI', '', '9832355532', '9593870632', '03532545432', '2019-03-06 15:57:40', '2019-03-06 15:57:40');
INSERT INTO `broker` VALUES ('55', 'SRI SAI CARRIERS', 'SITA MANSION, OPP IG OFFICE, SEVOKE ROAD, SILIGURI', '', '9434151900', '9832384298', '', '2019-03-06 15:58:44', '2019-03-06 15:58:44');
INSERT INTO `broker` VALUES ('56', 'HISSAR ROADLINES', 'SITA MANSION, OPP IG OFFICE, SEVOKE ROAD, SILIGURI', '', '9832081266', '9434673722', '9434251562', '2019-03-06 15:59:50', '2019-03-06 15:59:50');
INSERT INTO `broker` VALUES ('57', 'NEW MARSHAL ROADLINES', 'SITA MANSION, OPP IG OFFICE, SEVOKE ROAD, SILIGURI', '', '9932186609', '9434049365', '03532545629', '2019-03-06 16:01:48', '2019-03-06 16:01:48');
INSERT INTO `broker` VALUES ('58', 'GURU NANAK ROADLINES', 'OPP SITA MANSION BUILDING, NH 31 BY-PASS, SILIGURI', '', '7550847685', '9993863273', '', '2019-03-06 16:02:55', '2019-03-06 16:02:55');
INSERT INTO `broker` VALUES ('59', 'MISHRA ROAD CARRIERS', 'SEVOKE ROAD OPP BHAKTINAGAR POLICE STATION', '', '9474048110', '9434682681', '9933582681', '2019-03-06 16:04:36', '2019-03-06 16:04:36');
INSERT INTO `broker` VALUES ('60', 'SONU ROADWAYS', 'SEVOKE ROAD OPP BHAKTINAGAR POLICE STATION', '', '9434007158', '9734177485', '', '2019-03-06 16:05:26', '2019-03-06 16:05:26');
INSERT INTO `broker` VALUES ('61', 'KARTIK ROADWAYS CORPORATION', 'OPP MAA SHAKTI DHARAMKATA, EASTERN BYPASS', '', '7988228566', '9729370755', '9800661508', '2019-03-06 16:07:41', '2019-03-06 16:07:41');
INSERT INTO `broker` VALUES ('62', 'POPULAR TRANSPORT AGENCY', 'SEVOKE ROAD OPP BHAKTINAGAR POLICE STATION', '', '9434049894', '9832066870', '03532545706', '2019-03-06 16:08:41', '2019-03-06 16:08:41');
INSERT INTO `broker` VALUES ('63', 'DIRECT', '', '', '', '', '', '2019-03-06 16:10:45', '2019-03-06 16:10:45');
INSERT INTO `broker` VALUES ('64', 'PATNA BUXAR ROADLINE', 'DARJEELING MORE', '', '9802456149', '9933381552', '', '2019-03-06 16:12:16', '2019-03-06 16:12:16');
INSERT INTO `broker` VALUES ('65', 'UP BENGAL ROADLINE', 'FULBARI TRUCK TERMINUS', '', '9064931464', '7001562461', '8509438770', '2019-03-06 16:15:12', '2019-03-06 16:15:12');
INSERT INTO `broker` VALUES ('66', 'BOSE ROADWAYS', 'FULBARI', '', '9735075923', '', '', '2019-03-06 22:06:22', '2019-03-06 22:06:22');
INSERT INTO `broker` VALUES ('67', 'MAA SHANTI ROADWAYS', 'PRAKASH NAGAR', '', '9832549717', '9800663455', '9475760800 ', '2019-03-07 14:27:13', '2019-03-07 14:27:49');
INSERT INTO `broker` VALUES ('68', 'BIHAR ROADLINE', 'PARIBAHAN NAGAR, MATIGARA, SILIGURI, DARJEELING', '', '9832052612', '7699992612', '', '2019-03-07 14:34:38', '2019-03-07 14:34:38');
INSERT INTO `broker` VALUES ('69', 'DHARMA DA LOCAL', 'LIC BUILDING SEVOKE ROAD SILIGURI', '', '9434151745', '', '', '2019-03-07 14:37:46', '2019-03-07 14:37:46');
INSERT INTO `broker` VALUES ('70', 'DINESH ROADLINE', 'PRAKASH NAGAR', '', '9002089218', '9832067619', '', '2019-03-08 12:53:01', '2019-03-08 12:53:01');
INSERT INTO `broker` VALUES ('71', 'JAIPUR JORHAT TRANSPORT COMPANY', 'NH.31 BYPASS ROAD, SEVOKE ROAD, SILIGURI', '', '9832567772', '9635609323', '9775567772', '2019-03-08 15:59:05', '2019-03-08 15:59:05');
INSERT INTO `broker` VALUES ('72', 'BANSHAL ROAD CARRIER', 'ESTERN BYPASS SILIGURI', '', '9434753600', '9832047413', '', '2019-03-09 14:34:37', '2019-03-09 14:34:37');
INSERT INTO `broker` VALUES ('73', 'JAI MAA BHAWANI TRANSPORT', 'FULBARI', '', '6296562170', '8597517361', '', '2019-03-11 11:25:10', '2019-03-11 11:25:10');
INSERT INTO `broker` VALUES ('74', 'SAMRAT ROADWAYS', 'JHANKAR MORE', '', '9932640019', '', '', '2019-03-11 11:25:35', '2019-03-11 11:25:35');
INSERT INTO `broker` VALUES ('75', 'AKBAR ', 'FULBARI', '', '8116650888', '9933776466', '', '2019-03-11 19:11:49', '2019-03-11 19:11:49');
INSERT INTO `broker` VALUES ('77', 'BINOD FULBARI', 'FULBARI', '', '9933669673', '', '', '2019-03-12 20:37:29', '2019-03-12 20:37:29');
INSERT INTO `broker` VALUES ('78', 'DELHI TINSUKIYA TRANSPORT', 'NH.31 BYPASS ROAD, SEVOKE ROAD, SILIGURI', '', '9002058226', '9474873426', '', '2019-03-12 20:38:34', '2019-03-12 20:38:34');
INSERT INTO `broker` VALUES ('79', 'KHOKHAN DA', 'LIC BUILDING SEVOKE ROAD SILIGURI', '', '9832016023', '', '', '2019-03-12 20:39:29', '2019-03-12 20:39:29');
INSERT INTO `broker` VALUES ('80', 'NISHAN ROADWAYS', 'FULBARI TRUCK TERMINUS', '', '7679499261', null, null, '2019-04-02 10:49:20', '2019-04-02 10:49:20');

-- ----------------------------
-- Table structure for `broker_child`
-- ----------------------------
DROP TABLE IF EXISTS `broker_child`;
CREATE TABLE `broker_child` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `broker_id` int(10) DEFAULT NULL,
  `contact_no` varchar(255) DEFAULT NULL,
  `contact_person` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `broker_id` (`broker_id`),
  CONSTRAINT `broker_id` FOREIGN KEY (`broker_id`) REFERENCES `broker` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of broker_child
-- ----------------------------
INSERT INTO `broker_child` VALUES ('4', '80', 'SHYAMAL ', '7679499261', '2019-04-02 10:49:20', '2019-04-02 10:49:20');
INSERT INTO `broker_child` VALUES ('5', '80', 'SHYAMAL', '7063520861', '2019-04-02 10:49:20', '2019-04-02 10:49:20');

-- ----------------------------
-- Table structure for `broker_image`
-- ----------------------------
DROP TABLE IF EXISTS `broker_image`;
CREATE TABLE `broker_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `broker_id` int(11) DEFAULT NULL,
  `broker_front` varchar(255) DEFAULT NULL,
  `broker_back` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `broker_imgae` (`broker_id`),
  CONSTRAINT `broker_imgae` FOREIGN KEY (`broker_id`) REFERENCES `broker` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of broker_image
-- ----------------------------
INSERT INTO `broker_image` VALUES ('1', '12', 'front', 'back', '2019-03-05 17:25:43', '2019-03-05 17:25:43');
INSERT INTO `broker_image` VALUES ('2', '13', 'front', 'back', '2019-03-05 19:16:50', '2019-03-05 19:16:50');
INSERT INTO `broker_image` VALUES ('3', '14', 'front', 'back', '2019-03-05 19:17:36', '2019-03-05 19:17:36');
INSERT INTO `broker_image` VALUES ('4', '15', 'front', 'back', '2019-03-05 19:18:35', '2019-03-05 19:18:35');
INSERT INTO `broker_image` VALUES ('5', '16', 'front', 'back', '2019-03-05 19:19:26', '2019-03-05 19:19:26');
INSERT INTO `broker_image` VALUES ('6', '17', 'front', 'back', '2019-03-05 19:20:52', '2019-03-05 19:20:52');
INSERT INTO `broker_image` VALUES ('7', '18', 'front', 'back', '2019-03-05 19:22:32', '2019-03-05 19:22:32');
INSERT INTO `broker_image` VALUES ('8', '19', 'front', 'back', '2019-03-05 19:23:27', '2019-03-05 19:23:27');
INSERT INTO `broker_image` VALUES ('9', '20', 'front', 'back', '2019-03-05 19:24:38', '2019-03-05 19:24:38');
INSERT INTO `broker_image` VALUES ('10', '21', 'front', 'back', '2019-03-05 19:25:48', '2019-03-05 19:25:48');
INSERT INTO `broker_image` VALUES ('11', '22', 'front', 'back', '2019-03-05 19:26:41', '2019-03-05 19:26:41');
INSERT INTO `broker_image` VALUES ('12', '23', 'front', 'back', '2019-03-05 19:27:51', '2019-03-05 19:27:51');
INSERT INTO `broker_image` VALUES ('13', '24', 'front', 'back', '2019-03-05 19:28:26', '2019-03-05 19:28:26');
INSERT INTO `broker_image` VALUES ('14', '25', 'front', 'back', '2019-03-05 19:29:28', '2019-03-05 19:29:28');
INSERT INTO `broker_image` VALUES ('15', '26', 'front', 'back', '2019-03-05 19:30:15', '2019-03-05 19:30:15');
INSERT INTO `broker_image` VALUES ('16', '27', 'front', 'back', '2019-03-05 19:31:07', '2019-03-05 19:31:07');
INSERT INTO `broker_image` VALUES ('17', '28', 'front', 'back', '2019-03-05 19:32:06', '2019-03-05 19:32:06');
INSERT INTO `broker_image` VALUES ('18', '29', 'front', 'back', '2019-03-06 15:28:58', '2019-03-06 15:28:58');
INSERT INTO `broker_image` VALUES ('19', '30', 'front', 'back', '2019-03-06 15:30:11', '2019-03-06 15:30:11');
INSERT INTO `broker_image` VALUES ('20', '31', 'front', 'back', '2019-03-06 15:33:58', '2019-03-06 15:33:58');
INSERT INTO `broker_image` VALUES ('21', '32', 'front', 'back', '2019-03-06 15:35:03', '2019-03-06 15:35:03');
INSERT INTO `broker_image` VALUES ('22', '33', 'front', 'back', '2019-03-06 15:35:54', '2019-03-06 15:35:54');
INSERT INTO `broker_image` VALUES ('23', '34', 'front', 'back', '2019-03-06 15:38:14', '2019-03-06 15:38:14');
INSERT INTO `broker_image` VALUES ('24', '35', 'front', 'back', '2019-03-06 15:39:59', '2019-03-06 15:39:59');
INSERT INTO `broker_image` VALUES ('25', '36', 'front', 'back', '2019-03-06 15:40:49', '2019-03-06 15:40:49');
INSERT INTO `broker_image` VALUES ('26', '37', 'front', 'back', '2019-03-06 15:41:44', '2019-03-06 15:41:44');
INSERT INTO `broker_image` VALUES ('27', '38', 'front', 'back', '2019-03-06 15:42:24', '2019-03-06 15:42:24');
INSERT INTO `broker_image` VALUES ('28', '39', 'front', 'back', '2019-03-06 15:43:17', '2019-03-06 15:43:17');
INSERT INTO `broker_image` VALUES ('29', '40', 'front', 'back', '2019-03-06 15:44:38', '2019-03-06 15:44:38');
INSERT INTO `broker_image` VALUES ('30', '41', 'front', 'back', '2019-03-06 15:45:18', '2019-03-06 15:45:18');
INSERT INTO `broker_image` VALUES ('31', '42', 'front', 'back', '2019-03-06 15:46:14', '2019-03-06 15:46:14');
INSERT INTO `broker_image` VALUES ('32', '43', 'front', 'back', '2019-03-06 15:47:26', '2019-03-06 15:47:26');
INSERT INTO `broker_image` VALUES ('33', '44', 'front', 'back', '2019-03-06 15:48:23', '2019-03-06 15:48:23');
INSERT INTO `broker_image` VALUES ('34', '45', 'front', 'back', '2019-03-06 15:49:14', '2019-03-06 15:49:14');
INSERT INTO `broker_image` VALUES ('35', '46', 'front', 'back', '2019-03-06 15:50:01', '2019-03-06 15:50:01');
INSERT INTO `broker_image` VALUES ('36', '47', 'front', 'back', '2019-03-06 15:50:54', '2019-03-06 15:50:54');
INSERT INTO `broker_image` VALUES ('37', '48', 'front', 'back', '2019-03-06 15:52:00', '2019-03-06 15:52:00');
INSERT INTO `broker_image` VALUES ('38', '49', 'front', 'back', '2019-03-06 15:53:07', '2019-03-06 15:53:07');
INSERT INTO `broker_image` VALUES ('39', '50', 'front', 'back', '2019-03-06 15:53:48', '2019-03-06 15:53:48');
INSERT INTO `broker_image` VALUES ('40', '51', 'front', 'back', '2019-03-06 15:54:38', '2019-03-06 15:54:38');
INSERT INTO `broker_image` VALUES ('41', '52', 'front', 'back', '2019-03-06 15:55:39', '2019-03-06 15:55:39');
INSERT INTO `broker_image` VALUES ('42', '53', 'front', 'back', '2019-03-06 15:56:41', '2019-03-06 15:56:41');
INSERT INTO `broker_image` VALUES ('43', '54', 'front', 'back', '2019-03-06 15:57:40', '2019-03-06 15:57:40');
INSERT INTO `broker_image` VALUES ('44', '55', 'front', 'back', '2019-03-06 15:58:44', '2019-03-06 15:58:44');
INSERT INTO `broker_image` VALUES ('45', '56', 'front', 'back', '2019-03-06 15:59:50', '2019-03-06 15:59:50');
INSERT INTO `broker_image` VALUES ('46', '57', 'front', 'back', '2019-03-06 16:01:48', '2019-03-06 16:01:48');
INSERT INTO `broker_image` VALUES ('47', '58', 'front', 'back', '2019-03-06 16:02:55', '2019-03-06 16:02:55');
INSERT INTO `broker_image` VALUES ('48', '59', 'front', 'back', '2019-03-06 16:04:36', '2019-03-06 16:04:36');
INSERT INTO `broker_image` VALUES ('49', '60', 'front', 'back', '2019-03-06 16:05:26', '2019-03-06 16:05:26');
INSERT INTO `broker_image` VALUES ('50', '61', 'front', 'back', '2019-03-06 16:07:41', '2019-03-06 16:07:41');
INSERT INTO `broker_image` VALUES ('51', '62', 'front', 'back', '2019-03-06 16:08:41', '2019-03-06 16:08:41');
INSERT INTO `broker_image` VALUES ('52', '63', 'front', 'back', '2019-03-06 16:10:45', '2019-03-06 16:10:45');
INSERT INTO `broker_image` VALUES ('53', '64', 'front', 'back', '2019-03-06 16:12:16', '2019-03-06 16:12:16');
INSERT INTO `broker_image` VALUES ('54', '65', 'front', 'back', '2019-03-06 16:15:12', '2019-03-06 16:15:12');
INSERT INTO `broker_image` VALUES ('55', '66', 'front', 'back', '2019-03-06 22:06:22', '2019-03-06 22:06:22');
INSERT INTO `broker_image` VALUES ('56', '67', 'front', 'back', '2019-03-07 14:27:13', '2019-03-07 14:27:13');
INSERT INTO `broker_image` VALUES ('57', '68', 'front', 'back', '2019-03-07 14:34:38', '2019-03-07 14:34:38');
INSERT INTO `broker_image` VALUES ('58', '69', 'front', 'back', '2019-03-07 14:37:46', '2019-03-07 14:37:46');
INSERT INTO `broker_image` VALUES ('59', '70', 'front', 'back', '2019-03-08 12:53:01', '2019-03-08 12:53:01');
INSERT INTO `broker_image` VALUES ('60', '71', 'front', 'back', '2019-03-08 15:59:05', '2019-03-08 15:59:05');
INSERT INTO `broker_image` VALUES ('61', '72', 'front', 'back', '2019-03-09 14:34:37', '2019-03-09 14:34:37');
INSERT INTO `broker_image` VALUES ('62', '73', 'front', 'back', '2019-03-11 11:25:10', '2019-03-11 11:25:10');
INSERT INTO `broker_image` VALUES ('63', '74', 'front', 'back', '2019-03-11 11:25:35', '2019-03-11 11:25:35');
INSERT INTO `broker_image` VALUES ('64', '75', 'front', 'back', '2019-03-11 19:11:49', '2019-03-11 19:11:49');
INSERT INTO `broker_image` VALUES ('66', '77', 'front', 'back', '2019-03-12 20:37:29', '2019-03-12 20:37:29');
INSERT INTO `broker_image` VALUES ('67', '78', 'front', 'back', '2019-03-12 20:38:34', '2019-03-12 20:38:34');
INSERT INTO `broker_image` VALUES ('68', '79', 'front', 'back', '2019-03-12 20:39:29', '2019-03-12 20:39:29');
INSERT INTO `broker_image` VALUES ('69', '80', 'front', 'back', '2019-04-02 10:49:20', '2019-04-02 10:49:20');

-- ----------------------------
-- Table structure for `challan`
-- ----------------------------
DROP TABLE IF EXISTS `challan`;
CREATE TABLE `challan` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `consignment_id` int(10) DEFAULT NULL,
  `challan_no` varchar(255) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `from_id` varchar(20) DEFAULT NULL,
  `from` varchar(255) DEFAULT NULL,
  `to_id` varchar(20) DEFAULT NULL,
  `to` varchar(255) DEFAULT NULL,
  `consignment_no` varchar(50) DEFAULT NULL,
  `con_date` date DEFAULT NULL,
  `destination` varchar(255) DEFAULT NULL,
  `truck_no` varchar(255) DEFAULT NULL,
  `engine_no` varchar(255) DEFAULT NULL,
  `chassis_no` varchar(255) DEFAULT NULL,
  `make` varchar(255) DEFAULT NULL,
  `owners_name` varchar(255) DEFAULT NULL,
  `owners_address` varchar(255) DEFAULT NULL,
  `owners_phone` varchar(255) DEFAULT NULL,
  `pan_applicable` varchar(255) DEFAULT NULL,
  `pan_no` varchar(255) DEFAULT NULL,
  `pan_name` varchar(255) DEFAULT NULL,
  `pan_of` varchar(255) DEFAULT NULL,
  `declaration_submitted` varchar(255) DEFAULT NULL,
  `broker` varchar(255) DEFAULT NULL,
  `broker_id` varchar(10) DEFAULT NULL,
  `broker_name` varchar(255) DEFAULT NULL,
  `broker_phone` varchar(255) DEFAULT NULL,
  `broker_slip_no` varchar(255) DEFAULT NULL,
  `insurance_name` varchar(255) DEFAULT NULL,
  `policy_no` varchar(255) DEFAULT NULL,
  `drivers_id` varchar(20) DEFAULT NULL,
  `drivers_name` varchar(255) DEFAULT NULL,
  `drivers_contact_no` varchar(255) DEFAULT NULL,
  `drivers_address` varchar(255) DEFAULT NULL,
  `license_no` varchar(255) DEFAULT NULL,
  `place_of_issue` varchar(255) DEFAULT NULL,
  `balance_payable_at_id` varchar(20) DEFAULT NULL,
  `balance_payable_at` varchar(255) DEFAULT NULL,
  `freight` varchar(255) DEFAULT NULL,
  `diesel` varchar(255) DEFAULT NULL,
  `cash_advance` varchar(255) DEFAULT NULL,
  `balance` varchar(255) DEFAULT NULL,
  `status` int(2) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `in_word` varchar(255) DEFAULT NULL,
  `petrol_pump_id` int(10) DEFAULT NULL,
  `insurance_place_issue` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`challan_no`),
  KEY `consignment_id` (`consignment_id`),
  CONSTRAINT `consignment_id` FOREIGN KEY (`consignment_id`) REFERENCES `consignment` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of challan
-- ----------------------------
INSERT INTO `challan` VALUES ('2', null, '441047', '2019-03-07', '18', 'FULBARI', '2', 'GUWAHATI', null, null, null, 'NL02K8060', '40A62308628', '426021DVZ15613', 'TATA MOTORS', 'AJAY RAY', 'MOKOKCHUNG NAGALAND', '8609329312', 'Yes', 'BTVPR2359J', null, 'Driver', 'Yes', 'Yes', '70', 'DINESH ROADLINE', '9002089218', '', 'TNIACL', '51230031180100000366', '8', 'AJAY RAY', '9800159820', 'SILIGURI', 'WB7320090276575', 'NAGALAND', '1', 'SILIGURI', '24500', '6000', '15500', '3000', '0', '2019-03-08 16:26:32', '2019-03-08 16:38:51', 'Three Thousand Rupees  Only', '2', 'SILIGURI');

-- ----------------------------
-- Table structure for `challan_child`
-- ----------------------------
DROP TABLE IF EXISTS `challan_child`;
CREATE TABLE `challan_child` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `challan_id` int(10) DEFAULT NULL,
  `consignment_id` int(10) DEFAULT NULL,
  `category` varchar(225) DEFAULT NULL,
  `package` int(255) DEFAULT NULL,
  `net_weight` int(255) DEFAULT NULL,
  `gross_weight` int(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `challan_id` (`challan_id`),
  CONSTRAINT `challan_child_ibfk_1` FOREIGN KEY (`challan_id`) REFERENCES `challan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of challan_child
-- ----------------------------

-- ----------------------------
-- Table structure for `challan_child2`
-- ----------------------------
DROP TABLE IF EXISTS `challan_child2`;
CREATE TABLE `challan_child2` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `challan_id` int(10) DEFAULT NULL,
  `consignment_id` int(10) DEFAULT NULL,
  `consignment_no` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `total_package` varchar(255) DEFAULT NULL,
  `total_net_weight` varchar(255) DEFAULT NULL,
  `total_gross_weight` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `challan` (`challan_id`),
  CONSTRAINT `challan` FOREIGN KEY (`challan_id`) REFERENCES `challan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of challan_child2
-- ----------------------------
INSERT INTO `challan_child2` VALUES ('4', '2', '2', '441047', '2019-03-08 16:38:51', '2019-03-08 16:38:51', '590', '16', '16');

-- ----------------------------
-- Table structure for `challan_child3`
-- ----------------------------
DROP TABLE IF EXISTS `challan_child3`;
CREATE TABLE `challan_child3` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `challan_id` int(10) DEFAULT NULL,
  `total_package` varchar(255) DEFAULT NULL,
  `total_net_weight` varchar(255) DEFAULT NULL,
  `total_gross_weight` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `challan_id` (`challan_id`),
  CONSTRAINT `challan_id` FOREIGN KEY (`challan_id`) REFERENCES `challan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of challan_child3
-- ----------------------------
INSERT INTO `challan_child3` VALUES ('4', '2', '590', '16', '16', '2019-03-08 16:38:51', '2019-03-08 16:38:51');

-- ----------------------------
-- Table structure for `cock_consignment`
-- ----------------------------
DROP TABLE IF EXISTS `cock_consignment`;
CREATE TABLE `cock_consignment` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `consignment_no` varchar(255) DEFAULT NULL,
  `con_date` date DEFAULT NULL,
  `party_code` varchar(255) DEFAULT NULL,
  `billed_at_id` varchar(20) DEFAULT NULL,
  `billed_at` varchar(255) DEFAULT NULL,
  `from_id` varchar(20) DEFAULT NULL,
  `from` varchar(255) DEFAULT NULL,
  `to_id` varchar(20) DEFAULT NULL,
  `to` varchar(255) DEFAULT NULL,
  `consignor_id` varchar(10) DEFAULT NULL,
  `consignor_name` varchar(255) DEFAULT NULL,
  `consignee_name` varchar(255) DEFAULT NULL,
  `truck_type_id` varchar(20) DEFAULT NULL,
  `truck_type` varchar(255) DEFAULT NULL,
  `truck_no_id` varchar(20) DEFAULT NULL,
  `truck_no` varchar(255) DEFAULT NULL,
  `cn_value` varchar(255) DEFAULT NULL,
  `status` int(2) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `consignor_address` varchar(255) DEFAULT NULL,
  `consignee_address` varchar(255) DEFAULT NULL,
  `created_user` varchar(255) DEFAULT NULL,
  `trip_id` varchar(255) DEFAULT NULL,
  `load_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=185 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of cock_consignment
-- ----------------------------
INSERT INTO `cock_consignment` VALUES ('3', '114309', '2019-03-04', '11', '1', 'SILIGURI', '6', 'FATAPUKUR', '', 'ASANSOL', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', null, 'HCV.16', '7', 'WB37B8492', '259160', '0', '2019-03-07 13:37:50', '2019-04-03 06:52:23', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'RANI SATI WAREHOUSING & LOGISTIC, BARDHAMAN WEST BENGAL 713383', 'Naveen Kumar', '', '160322');
INSERT INTO `cock_consignment` VALUES ('4', '114308', '2019-03-04', '11', '1', 'SILIGURI', '6', 'FATAPUKUR', '', 'DARJEELING', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'HIMALAYA AGENCIES', null, 'HCV.16', '6', 'WB73B7316', '134353.51', '0', '2019-03-07 15:33:50', '2019-04-03 06:52:23', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', '1ST FLOOR 5A NEHRU ROADCHOWRASTA, DARJEELING, WEST BENGAL 734101', 'Naveen Kumar', '52813', '');
INSERT INTO `cock_consignment` VALUES ('5', '114307', '2019-03-03', '11', '1', 'SILIGURI', '6', 'FATAPUKUR', '', 'JAGDISHPUR', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'GUPTA ENTERPRISES', '', 'H', '8', 'UP67T5215', '0', '0', '2019-03-07 15:50:25', '2019-03-07 15:50:25', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'BIHIA DIST BHOJPUR, BLOK OFFICE JAGDISHPUR, BIHAR 802158', 'Naveen Kumar', '', '158977');
INSERT INTO `cock_consignment` VALUES ('6', '114310', '2019-03-05', '11', '1', 'SILIGURI', '6', 'FATAPUKUR', '', 'DARJEELING', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'HIMALAYA AGENCIES', '1', 'LCV.6', '6', 'WB73B7316', '177472.57', '0', '2019-03-07 16:08:02', '2019-03-08 10:34:55', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', '1ST FLOOR 5A NEHRU ROADCHOWRASTA, DARJEELING, WEST BENGAL 734101', 'Naveen Kumar', '53642', '');
INSERT INTO `cock_consignment` VALUES ('7', '114313', '2019-03-05', '11', '1', 'SILIGURI', '6', 'FATAPUKUR', '', 'CHHAPRA', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'MAA BHAWANI FOODS', '2', 'HCV.16', '9', 'UP61T6500', '680364', '0', '2019-03-07 16:14:46', '2019-03-07 16:14:46', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'BHAGWAN BAZAR, CHAPRA NEAR RATANPURA MOHALLA CHHAPRA BIHAR 841301', 'Naveen Kumar', '', '163643');
INSERT INTO `cock_consignment` VALUES ('8', '114314', '2019-03-06', '11', '1', 'SILIGURI', '6', 'FATAPUKUR', '', 'BARAUNI', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'M.S. AGENCY', '3', 'HCV.15', '10', 'RJ23GA3143', '0', '0', '2019-03-07 16:25:10', '2019-03-07 16:25:10', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'BIHAR STATE TRANSPORT CORP. NR. BUS STAND BARAUNI BEGUSARAI BIHAR 851112', 'Naveen Kumar', '', '163588');
INSERT INTO `cock_consignment` VALUES ('9', '114311', '2019-03-05', '11', '1', 'SILIGURI', '6', 'FATAPUKUR', '', 'BARAUNI', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'M.S. AGENCY', '2', 'HCV.16', '11', 'NL01AB8399', '619704', '0', '2019-03-07 16:32:38', '2019-03-07 16:32:38', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'BIHAR STATE TRANSPORT CORP. NR. BUS STAND BARAUNI BEGUSARAI BIHAR 851112', 'Naveen Kumar', '', '163589');
INSERT INTO `cock_consignment` VALUES ('10', '114312', '2019-03-05', '11', '1', 'SILIGURI', '6', 'FATAPUKUR', '', 'CHHAPRA', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'MAA BHAWANI FOODS', '2', 'HCV.16', '12', 'UP65ET2229', '0', '0', '2019-03-07 16:40:18', '2019-03-07 16:40:18', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'BHAGWAN BAZAR NEAR RATANPURA MOHALLA CHAPRA BIHAR 841301', 'Naveen Kumar', '', '163642');
INSERT INTO `cock_consignment` VALUES ('11', '114316', '2019-03-06', '11', '1', 'SILIGURI', '6', 'FATAPUKUR', '', 'DARJEELING', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'HIMALAYA AGENCIES', '1', 'LCV.6', '14', 'WB73B6290', '136257.97', '0', '2019-03-08 12:58:02', '2019-03-15 16:27:14', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', '1ST FLOOR 5A NEHRU ROADCHOWRASTA, DARJEELING, WEST BENGAL 734101', 'Naveen Kumar', '54245', '');
INSERT INTO `cock_consignment` VALUES ('12', '114324', '2019-03-06', '11', '1', 'SILIGURI', '6', 'FATAPUKUR', '', 'MUZAFFARPUR', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', '4', 'HCV.20', '15', 'WB73D6936', '648004', '0', '2019-03-08 13:09:39', '2019-03-08 13:09:39', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'BEHIND IT MEMORIAL HOSPITAL, NH 57 UMANAGAR, MUZAFFARPUR, BIHAR 842004', 'Naveen Kumar', '', '170137');
INSERT INTO `cock_consignment` VALUES ('13', '114325', '2019-03-07', '11', '1', 'SILIGURI', '6', 'FATAPUKUR', '', 'MUZAFFARPUR', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', '4', 'HCV.20', '16', 'NL01K7974', '478768', '0', '2019-03-08 13:24:38', '2019-03-08 13:25:51', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'BEHIND IT MEMORIAL HOSPITAL, NH 57 UMANAGAR, MUZAFFARPUR, BIHAR 842004', 'Naveen Kumar', '', '170138');
INSERT INTO `cock_consignment` VALUES ('14', '114327', '2019-03-07', '11', '1', 'SILIGURI', '6', 'FATAPUKUR', '', 'SITAMARHI', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'ARADHANA ENTERPRISES', '2', 'HCV.16', '17', 'WB41H1520', '525754.98', '0', '2019-03-08 13:34:13', '2019-03-08 13:34:13', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'CEN MARKETING UNION RIGHA, SITAMARHI BIHAR 843327', 'Naveen Kumar', '', '170095');
INSERT INTO `cock_consignment` VALUES ('15', '114317', '2019-03-06', '11', '1', 'SILIGURI', '6', 'FATAPUKUR', '', 'SUKIA', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'JAI MAHAKAL DISTRIBUTOR', '1', 'LCV.6', '6', 'WB73B7316', '156621.6', '0', '2019-03-08 13:41:11', '2019-03-08 13:41:11', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'SARDAR GAIRI GAONAT - SUKHIA POKHARI DARJEELING', 'Naveen Kumar', '54247', '');
INSERT INTO `cock_consignment` VALUES ('16', '114318', '2019-03-06', '11', '', 'SILIGURI', '', 'FATAPUKUR', '', 'BETTIAH', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'K D FOODS', '', 'HCV.16', '22', 'UP21BN3884', '573202.86', '0', '2019-03-08 14:33:03', '2019-04-03 06:52:23', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'TEEN LALTEN CHOWK GULAB BAGH ROAD NEAR MEDICAL COLLAGE BETTIAH 845438', 'Naveen Kumar', '', '167385');
INSERT INTO `cock_consignment` VALUES ('17', '114319', '2019-03-06', '11', '1', 'SILIGURI', '6', 'FATAPUKUR', '', 'BAGAHA', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'PRIYA TRADERS', '3', 'HCV.15', '23', 'UP21BN4985', '510018.01', '0', '2019-03-08 14:38:38', '2019-03-08 14:38:38', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'MALKAULI BAGHA WEST CHAMPARAN NEAR KALI MANDIR BAGHA WEST CHAMPRAN 845101', 'Naveen Kumar', '', '167144');
INSERT INTO `cock_consignment` VALUES ('18', '114320', '2019-03-06', '11', '1', 'SILIGURI', '6', 'FATAPUKUR', '', 'ASANSOL', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'RELIANCE RETAIL LTD', '3', 'HCV.15', '24', 'WB37D6668', '502087.29', '0', '2019-03-08 14:44:23', '2019-03-08 14:44:23', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'ADDA KINK ROAD BABUA PUKAR ANR ASANSOL COLLEGIATE SCHOOL KALYANPUR ASANSOL WEST BENGAL 713301', 'Naveen Kumar', '', '164456');
INSERT INTO `cock_consignment` VALUES ('19', '114328', '2019-03-07', '11', '1', 'SILIGURI', '6', 'FATAPUKUR', '', 'SHEOHAR', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'ANAND TRADERS ', '2', 'HCV.16', '19', 'WB23C2601', '465655.59', '0', '2019-03-08 15:11:11', '2019-03-08 15:11:11', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'BLOCK ROAD SHEOHAR NEAR UNION BANK OF INDIA SHEOHAR BIHAR 843302', 'Naveen Kumar', '', '170326');
INSERT INTO `cock_consignment` VALUES ('20', '114326', '2019-03-07', '11', '1', 'SILIGURI', '6', 'FATAPUKUR', '', 'SHEOHAR', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'MAA AMBEY ENTERPRIESE', '2', 'HCV.16', '18', 'HR69A0939', '493289.28', '0', '2019-03-08 15:15:12', '2019-03-08 15:15:12', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'WARD NO 15 SHEOHAR  UNION BANK SHEOHAR BIHAR 843329', 'Naveen Kumar', '', '170327');
INSERT INTO `cock_consignment` VALUES ('21', '114315', '2019-03-06', '11', '1', 'SILIGURI', '6', 'FATAPUKUR', '', 'BARAUNI', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'M.S. AGENCY', '3', 'HCV.15', '25', 'RJ05GA6735', '691704', '0', '2019-03-08 15:17:48', '2019-03-08 15:17:48', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'BIHAR STATE TRANSPORT CORP. NR. BUS STAND BARAUNI BEGUSARAI BIHAR 851112', 'Naveen Kumar', '', '163587');
INSERT INTO `cock_consignment` VALUES ('22', '114321', '2019-03-07', '11', '', 'SILIGURI', '6', 'FATAPUKUR', '', 'MOTHABARI', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'MAA DURGA AGENCY', '5', 'LCV.9', '21', 'WB57A8428', '371841.96', '0', '2019-03-08 15:22:11', '2019-03-08 15:22:11', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'VILL+PO-MOTHABARI MALDA NEAR COOPERATIVE BANK MOTHABARI MALDA 732207', 'Naveen Kumar', '', '169690');
INSERT INTO `cock_consignment` VALUES ('23', '114322', '2019-03-07', '11', '', 'SILIGURI', '6', 'FATAPUKUR', '', 'BANKURA', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'K K ENTERPRISES', '3', 'HCV.15', '20', 'WB37C0388', '600650.83', '0', '2019-03-08 15:27:47', '2019-03-08 15:27:47', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', '269/2 KAMRAMATH NEAR TOWN GIRLS H S BANKURA TOWN  WEST BENGAL 722101', 'Naveen Kumar', '', '168912');
INSERT INTO `cock_consignment` VALUES ('24', '114323', '2019-03-07', '11', '1', 'SILIGURI', '6', 'FATAPUKUR', '', 'DARJEELING', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'HIMALAYA AGENCIES', '1', 'LCV.6', '14', 'WB73B6290', '168229.11', '0', '2019-03-08 15:40:56', '2019-03-08 15:47:49', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', '1ST FLOOR 5A NEHRU ROADCHOWRASTA, DARJEELING, WEST BENGAL 734101', 'Naveen Kumar', '55102', '');
INSERT INTO `cock_consignment` VALUES ('25', '114330', '2019-03-08', '11', '1', 'SILIGURI', '6', 'FATAPUKUR', '', 'SHEOHAR', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'MAA AMBEY ENTERPRISES', '2', 'HCV.16', '26', 'RJ02GB3919', '463182.8', '0', '2019-03-09 11:03:42', '2019-03-09 11:03:42', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'WARD NO-15 SHEOHAR OPP UNION BANK SHEOHAR 843329', 'Naveen Kumar', '', '173559');
INSERT INTO `cock_consignment` VALUES ('26', '114329', '2019-03-08', '11', '1', 'SILIGURI', '6', 'FATAPUKUR', '10', 'ASANSOL', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', '3', 'HCV.15', '27', 'UP78BT0456', '404600', '0', '2019-03-09 11:24:07', '2019-03-09 11:26:56', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'RANI SATI WAREHOUSING LOGISTIC BARDHAMAN WEST BENGAL  735134', 'Naveen Kumar', '55376', '');
INSERT INTO `cock_consignment` VALUES ('27', '114332', '2019-03-08', '11', '1', 'SILIGURI', '6', 'FATAPUKUR', '4', 'BETTIAH', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'K D FOODS ', '2', 'HCV.16', '28', 'HR658405', '523620.78', '0', '2019-03-09 11:42:41', '2019-03-13 18:48:48', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'TEEN LALTEN CHOWK GULAB BAGH ROADNEAR MEDICAL COLLEGE BETTAIH BIHAR 845438', 'Naveen Kumar', '', '175234');
INSERT INTO `cock_consignment` VALUES ('28', '114334', '2019-03-08', '11', '1', 'SILIGURI', '6', 'FATAPUKUR', '', 'DARJEELING', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'HIMALAYA AGENCY', '1', 'LCV.6', '6', 'WB73B7316', '124689.63', '0', '2019-03-09 11:48:38', '2019-03-09 11:48:38', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', '1ST FLOOR 5A NEHRU ROADCHOWRASTA DARJEELING SILIGURI WEST BENGAL 734101', 'Naveen Kumar', '', '173985');
INSERT INTO `cock_consignment` VALUES ('29', '114333', '2019-03-08', '11', '1', 'SILIGURI', '6', 'FATAPUKUR', '', 'DARJEELING', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'HIMALAYA AGENCIES', '1', 'LCV.6', '14', 'WB73B6290', '196101.88', '0', '2019-03-09 11:55:08', '2019-03-13 18:52:10', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', '1ST FLOOR 5A NEHRU ROADCHOWRASTA DARJEELING SILIGURI WEST BENGAL 734101', 'Naveen Kumar', '', '173986');
INSERT INTO `cock_consignment` VALUES ('30', '114336', '2019-03-09', '11', '1', 'SILIGURI', '6', 'FATAPUKUR', '', 'BETTIAH', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'KD FOODS BETTIAH', '3', 'HCV.15', '29', 'RJ14GD9178', '470668.8', '0', '2019-03-09 12:00:20', '2019-03-09 12:00:20', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'TEEN LALTEN CHOWK GULAB BAGH ROADNEAR MEDICAL COLLEGE BETTIAH BIHAR 845438', 'Naveen Kumar', '', '175233');
INSERT INTO `cock_consignment` VALUES ('31', '114243', '2019-03-10', '11', '1', 'SILIGURI', '6', 'FATAPUKUR', '', 'MUZAFFARPUR', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', '2', 'HCV.16', '34', 'WB03C9855', '415681.08', '0', '2019-03-11 19:31:35', '2019-03-11 19:31:35', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'MUZAFFARPUR', 'Naveen Kumar', '', '183649');
INSERT INTO `cock_consignment` VALUES ('32', '114344', '2019-03-10', '11', '1', 'SILIGURI', '6', 'FATAPUKUR', '', 'NAWADA', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'KAVITANJALI ENTERPRISE', '2', 'HCV.16', '32', 'JH02T8671', '588647.04', '0', '2019-03-11 19:36:22', '2019-03-13 21:22:31', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'THANA ROAD NAWADA BOARD COMPLEXNAWADA  BIHAR 805110', 'Naveen Kumar', '', '181290');
INSERT INTO `cock_consignment` VALUES ('33', '114345', '2019-03-10', '11', '1', 'SILIGURI', '6', 'FATAPUKUR', '', 'SASARAM', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'RAJ ENTERPRISES', '2', 'HCV.16', '31', 'UP63T3563', '593700.88', '0', '2019-03-11 19:39:54', '2019-03-13 21:23:18', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'JAGAT KAUSAL MARKET SASARAM BIHAR 821115', 'Naveen Kumar', '', '184246');
INSERT INTO `cock_consignment` VALUES ('34', '114346', '2019-03-10', '11', '1', 'SILIGURI', '6', 'FATAPUKUR', '', 'SHERGHATI', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'ALIZA ENTERPRISES', '2', 'HCV.16', '35', 'MH04FJ6629', '602628.12', '0', '2019-03-11 19:43:39', '2019-03-13 21:24:03', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'MADARSA GALI HAMZAPUR SHERGHATINEAR IMAMGANJ SHERGHATI BIHAR 824211', 'Naveen Kumar', '', '184247');
INSERT INTO `cock_consignment` VALUES ('35', '114347', '2019-03-10', '11', '1', 'SILIGURI', '6', 'FATAPUKUR', '', 'GAYA', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'MAA MANGLA TRDERD', '2', 'HCV.16', '37', 'UP63AT1953', '606552.92', '0', '2019-03-11 19:47:21', '2019-03-13 21:24:46', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'MAIN ROAD KHATKACHAK MARANPUR GAYANR GAYA BIHAR 823001', 'Naveen Kumar', '', '184249');
INSERT INTO `cock_consignment` VALUES ('36', '114348', '2019-03-10', '11', '1', 'SILIGURI', '6', 'FATAPUKUR', '', 'RAIGUNJ', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'BISWANATH NUHIWAL', '2', 'HCV.16', '36', 'WB25D3132', '415681.08', '0', '2019-03-11 19:51:15', '2019-03-13 21:25:14', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'BANDAR MARWARY DINAJPUR RAIGANJ WEST BENGAL 733134', 'Naveen Kumar', '', '182966');
INSERT INTO `cock_consignment` VALUES ('37', '114342', '2019-03-10', '11', '1', 'SILIGURI', '6', 'FATAPUKUR', '', 'NALANDA', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'NAUSEEMA TRADING', '2', 'HCV.16', '33', 'BR25A2887', '567374.9', '0', '2019-03-12 10:55:36', '2019-03-13 21:16:32', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'GANGADIWANBIHAR SHARIFBADI NALANDA BIHAR 805105', 'Naveen Kumar', '', '184248');
INSERT INTO `cock_consignment` VALUES ('38', '114337', '2019-03-09', '11', '', 'SILIGURI', '6', 'FATAPUKUR', '', 'CHHAURADANOW', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'LAXMI ENTERPRISES', '2', 'HCV.16', '38', 'NL08A4529', '500926.08', '0', '2019-03-13 19:22:51', '2019-03-13 19:22:51', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'BANK ROAD CHHAURADANO E CHAMPARAN CHHAURADANO DHAKA 845302', 'Naveen Kumar', '', '176398');
INSERT INTO `cock_consignment` VALUES ('39', '114338', '2019-03-09', '11', '1', 'SILIGURI', '6', 'FATAPUKUR', '', 'NALANDA', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'NAUSEEMA TRADING', '2', 'HCV.16', '39', 'CG12AR3805', '591032.3', '0', '2019-03-13 19:32:44', '2019-03-13 19:32:44', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'GAGANDIWANBIHARI  SHARIFBADI B.O NALANDA BIHAR 805105', 'Naveen Kumar', '', '179044');
INSERT INTO `cock_consignment` VALUES ('40', '114339', '2019-03-10', '11', '1', 'SILIGURI', '6', 'FATAPUKUR', '', 'CHHAURADANOW', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'LAXMI ENTERPRISES', '2', 'HCV.16', '40', 'JH02G7611', '470668.8', '0', '2019-03-13 21:06:08', '2019-03-13 21:06:08', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'BANK ROAD CHHAURADANO E CHAMPARAN DHAKA 845302', 'Naveen Kumar', '', '179043');
INSERT INTO `cock_consignment` VALUES ('41', '114340', '2019-03-10', '11', '', 'SILIGURI', '6', 'FATAPUKUR', '', 'MUZAFFARPUR', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', '4', 'HCV.20', '41', 'UP65CT2458', '558600', '0', '2019-03-13 21:09:27', '2019-03-13 21:09:27', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'IT MEMORIAL HOSPITAL NH 57 MUZAFFARPUR', 'Naveen Kumar', '', '183408');
INSERT INTO `cock_consignment` VALUES ('42', '114341', '2019-03-10', '11', '1', 'SILIGURI', '6', 'FATAPUKUR', '', 'MUZAFFARPUR', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', '4', 'HCV.20', '42', 'UP63AT0462', '558600', '0', '2019-03-13 21:11:56', '2019-03-13 21:11:56', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'IT MEMORIAL HOSPITAL, NH 57 MUZAFFARPUR', 'Naveen Kumar', '', '183667');
INSERT INTO `cock_consignment` VALUES ('43', '114343', '2019-03-10', '11', '1', 'SILIGURI', '6', 'FATAPUKUR', '', 'MUZAFFARPUR', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', '2', 'HCV.16', '34', 'WB03C9855', '0', '0', '2019-03-13 21:21:35', '2019-03-13 21:21:35', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'IT MEMORIAL HOSPITAL, NH 57 MUZAFFARPUR', 'Naveen Kumar', '', '183649');
INSERT INTO `cock_consignment` VALUES ('44', '114349', '2019-03-11', '11', '', 'SILIGURI', '6', 'FATAPUKUR', '', 'DARJEELING', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'HIMALAYA AGENCIES', '1', 'LCV.6', '6', 'WB73B7316', '133801', '0', '2019-03-13 21:27:24', '2019-03-13 21:27:24', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', '1ST FLOOR 5A NEHRU ROADCHOWRASTA, DARJEELING, WEST BENGAL 734101', 'Naveen Kumar', '57870', '');
INSERT INTO `cock_consignment` VALUES ('45', '114350', '2019-03-11', '11', '1', 'SILIGURI', '6', 'FATAPUKUR', '', 'DARJEELING', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'HIMALAYA AGENCIES', '1', 'LCV.6', '43', 'WB73C1432', '153945.25', '0', '2019-03-13 21:31:44', '2019-03-13 21:31:44', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', '1ST FLOOR 5A NEHRU ROADCHOWRASTA, DARJEELING, WEST BENGAL 734101', 'Naveen Kumar', '57912', '');
INSERT INTO `cock_consignment` VALUES ('46', '114335', '2019-03-08', '11', '', 'SILIGURI', '6', 'FATAPUKUR', '', 'ASANSOL', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', '2', 'HCV.16', '30', 'WB11A7650', '335600', '0', '2019-03-13 21:37:07', '2019-03-13 21:37:07', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'RANI SATI WAREHOUSING & LOGISTIC, BARDHAMAN WEST BENGAL 713383', 'Naveen Kumar', '55377', '');
INSERT INTO `cock_consignment` VALUES ('47', '114331', '2019-03-08', '11', '', 'SILIGURI', '6', 'FATAPUKUR', '', 'DARJEELING', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'FUTURE RETAIL LIMITED', '1', 'LCV.6', '44', 'WB73C4277', '29203.2', '0', '2019-03-14 09:47:48', '2019-03-14 09:47:48', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'RINK MALL DARJEELING WEST BENGAL 734301', 'Naveen Kumar', '', '169799');
INSERT INTO `cock_consignment` VALUES ('48', '114351', '2019-03-11', '11', '1', 'SILIGURI', '6', 'FATAPUKUR', '', 'MUZAFFARPUR', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', '4', 'HCV.20', '45', 'HR39B8009', '558600', '0', '2019-03-14 17:08:50', '2019-03-14 17:08:50', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'IT MEMORIAL HOSPITAL, NH 57 MUZAFFARPUR', 'Naveen Kumar', '', '185499');
INSERT INTO `cock_consignment` VALUES ('49', '114352', '2019-03-11', '11', '1', 'SILIGURI', '6', 'FATAPUKUR', '', 'RAJGIR', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'RAJGIR TRADERS', '2', 'HCV.16', '46', 'JH10U3585', '577428.12', '0', '2019-03-14 17:13:03', '2019-03-14 17:13:03', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'OPPTUTUTYRE HOUSE RAJGIR, BIHAR 805105', 'Naveen Kumar', '', '184245');
INSERT INTO `cock_consignment` VALUES ('50', '114353', '2019-03-11', '11', '1', 'SILIGURI', '', 'FATAPUKUR', '', 'MUZAFFARPUR', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', '4', 'HCV.20', '47', 'AS01JC6800', '645152.5', '0', '2019-03-14 17:17:32', '2019-03-14 17:17:32', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'IT MEMORIAL HOSPITAL, NH 57 MUZAFFARPUR', 'Naveen Kumar', '', '185529');
INSERT INTO `cock_consignment` VALUES ('51', '114354', '2019-03-11', '11', '1', 'SILIGURI', '6', 'FATAPUKUR', '', 'MUZAFFARPUR', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', '2', 'HCV.16', '48', 'NL01Q5915', '645152.5', '0', '2019-03-14 17:26:27', '2019-03-14 17:26:27', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'IT MEMORIAL HOSPITAL NH 57 MUZAFFARPUR', 'Naveen Kumar', '', '185471');
INSERT INTO `cock_consignment` VALUES ('52', '114355', '2019-03-12', '11', '1', 'SILIGURI', '6', 'FATAPUKUR', '', 'DARJEELING', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'HIMALAYA AGENCIES', '1', 'LCV.6', '43', 'WB73C1432', '137385.16', '0', '2019-03-14 17:32:06', '2019-03-14 17:32:06', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', '1ST FLOOR 5A NEHRU ROADCHOWRASTA, DARJEELING, WEST BENGAL 734101', 'Naveen Kumar', '59675', '');
INSERT INTO `cock_consignment` VALUES ('53', '114356', '2019-03-12', '11', '1', 'SILIGURI', '6', 'FATAPUKUR', '', 'DARJEELING', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'HIMALAYA AGENCIES', '1', 'LCV.6', '6', 'WB73B7316', '165386.17', '0', '2019-03-14 17:34:28', '2019-03-14 17:34:28', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', '1ST FLOOR 5A NEHRU ROADCHOWRASTA, DARJEELING, WEST BENGAL 734101', 'Naveen Kumar', '59549', '');
INSERT INTO `cock_consignment` VALUES ('54', '114357', '2019-03-12', '11', '1', 'SILIGURI', '6', 'FATAPUKUR', '', 'NAWADA', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'KAVITANJALI ENTERPRISES', '2', 'HCV.16', '49', 'UP21CN0515', '427484.8', '0', '2019-03-14 17:38:52', '2019-03-14 17:38:52', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'SHOP NO 284 THANA ROAD NAWADA BIHAR 805110', 'Naveen Kumar', '', '189978');
INSERT INTO `cock_consignment` VALUES ('55', '114358', '2019-03-12', '11', '1', 'SILIGURI', '6', 'FATAPUKUR', '', 'MUZAFFARPUR', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', '4', 'HCV.20', '50', 'HR55P8967', '533960', '0', '2019-03-14 17:42:54', '2019-03-14 17:42:54', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'IT MEMORIAL HOSPITAL NH 57 MUZAFFARPUR', 'Naveen Kumar', '', '188172');
INSERT INTO `cock_consignment` VALUES ('56', '114359', '2019-03-12', '11', '1', 'SILIGURI', '6', 'FATAPUKUR', '', 'BETTIAH', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'SIKARIYA TRADERS', '2', 'HCV.16', '51', 'WB23C2705', '575075.08', '0', '2019-03-14 17:57:41', '2019-03-14 17:57:41', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'LAL BAZAR BETTIAH BIHAR 845438', 'Naveen Kumar', '', '189691');
INSERT INTO `cock_consignment` VALUES ('57', '114360', '2019-03-12', '11', '1', 'SILIGURI', '6', 'FATAPUKUR', '', 'DARBHANGA', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'BALAJEE AGENCY', '2', 'HCV.16', '52', 'WB33A9947', '0', '0', '2019-03-14 18:01:40', '2019-03-15 16:23:35', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'C/O N.K.HOBBY S/O B.N KAPRILAXMI SAGAR, DARBHANGA BIHAR 847203', 'Naveen Kumar', '', '190429');
INSERT INTO `cock_consignment` VALUES ('58', '114361', '2019-03-12', '11', '1', 'SILIGURI', '6', 'FATAPUKUR', '', 'MUZAFFARPUR', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', '2', 'HCV.16', '53', 'UP13AT1609', '511700', '0', '2019-03-14 18:05:25', '2019-03-14 18:05:25', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'IT MEMORIAL HOSPITAL, NH 57  MUZAFFARPUR', 'Naveen Kumar', '', '188220');
INSERT INTO `cock_consignment` VALUES ('59', '114362', '2019-03-12', '11', '1', 'SILIGURI', '6', 'FATAPUKUR', '', 'BIHARSARIF', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'GOODWILL TELE AGENCY', '2', 'HCV.16', '54', 'UP63AT4028', '534289.95', '0', '2019-03-14 18:35:32', '2019-03-14 18:35:32', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'SHISHU UDYAN CAMPUS KAMRUDINGANJ, BIHARSHARIF BIHAR 803101', 'Naveen Kumar', '', '190496');
INSERT INTO `cock_consignment` VALUES ('60', '114363', '2019-03-12', '11', '1', 'SILIGURI', '6', 'FATAPUKUR', '', 'NAWADA', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'KAVITANJALI ENTERPRISES', '2', 'HCV.16', '55', 'WB23A9838', '649960.47', '0', '2019-03-14 18:42:23', '2019-03-14 18:42:23', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'SHOP NO 284 THANA ROAD NAWADA BIHAR 805110', 'Naveen Kumar', '', '189979');
INSERT INTO `cock_consignment` VALUES ('61', '114364', '2019-03-12', '11', '1', 'SILIGURI', '6', 'FATAPUKUR', '', 'JAGDISHPUR', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'GUPTA ENTERPRISES', '2', 'HCV.16', '56', 'MP20HB5467', '592457.82', '0', '2019-03-14 19:01:01', '2019-03-14 19:01:01', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'BIHIA DIST BHOJPUR, BLOCK OFFICE JAGDISHPUR BIHAR 802158', 'Naveen Kumar', '', '190430');
INSERT INTO `cock_consignment` VALUES ('62', '114365', '2019-03-12', '11', '1', 'SILIGURI', '6', 'FATAPUKUR', '', 'GHORASAHAN', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'PAWAN TRADERS', '2', 'HCV.16', '57', 'WB23C2373', '459182.4', '0', '2019-03-14 19:04:36', '2019-03-14 19:04:36', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'SHREEPUR RD GHORASAHAN E CHAMPARAN BIHAR 845303', 'Naveen Kumar', '', '190493');
INSERT INTO `cock_consignment` VALUES ('63', '114366', '2019-03-12', '11', '1', 'SILIGURI', '6', 'FATAPUKUR', '', 'LAKHISARAI', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'OM SAI AGENCY', '2', 'HCV.16', '58', 'NL01K5031', '0', '0', '2019-03-14 19:08:30', '2019-04-03 06:52:23', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'MAIN RD SURAJGARH LAKHISARAI BIHAR 811106', 'Naveen Kumar', '', '190492');
INSERT INTO `cock_consignment` VALUES ('64', '114367', '2019-03-13', '11', '1', 'SILIGURI', '6', 'FATAPUKUR', '', 'SAKRI', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'PANKAJ AGENCY', '2', 'HCV.16', '59', 'HR38S0553', '0', '0', '2019-03-14 19:14:31', '2019-04-03 06:52:23', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'C/O RAMESH KUMAR AGARWAL SAKRI BAZAR DARBHANGA BIHAR 847203', 'Naveen Kumar', '', '190494');
INSERT INTO `cock_consignment` VALUES ('65', '114368', '2019-03-12', '11', '1', 'SILIGURI', '6', 'FATAPUKUR', '', 'SHEIKHPURA', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'KRISHI KUNJ', '2', 'HCV.16', '60', 'WB41E2547', '502295.51', '0', '2019-03-14 19:17:25', '2019-04-03 06:52:23', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'KATRA CHOWK NEAR TIME CENT SEKHPURA BIHAR 811105', 'Naveen Kumar', '', '190498');
INSERT INTO `cock_consignment` VALUES ('66', '114369', '2019-03-13', '11', '1', 'SILIGURI', '6', 'FATAPUKUR', '', 'MADHUBANI', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'VIKASH ENTERPRISES', '2', 'HCV.16', '61', 'WB03D0155', '589058.04', '0', '2019-03-14 19:21:09', '2019-03-14 19:21:09', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'C/O VIKASH RANJAN SAURATHSANTU NAGAR CHOWK MADHUBANI BIHAR 847230', 'Naveen Kumar', '', '190427');
INSERT INTO `cock_consignment` VALUES ('67', '114370', '2019-03-13', '11', '1', 'SILIGURI', '6', 'FATAPUKUR', '', 'JAMALPUR', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'BHARTI ENTERPRISES', '2', 'HCV.16', '62', 'WB41C2357', '553895.51', '0', '2019-03-15 13:25:41', '2019-03-15 16:55:43', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'MANISH KUMARBARI ASHIKPPUR JAMALPUR BIHAR 811213', 'Naveen Kumar', '', '190491');
INSERT INTO `cock_consignment` VALUES ('68', '114371', '2019-03-13', '11', '', 'SILIGURI', '', 'FATAPUKUR', '', 'PURULIYA', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'SUBIR KUMAR HALDAR', '2', 'HCV.16', '63', 'WB37B7237', '510773.55', '0', '2019-03-15 13:29:15', '2019-03-15 16:56:57', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'MADHYA BAZAR PURULINAR PURULIA WEST BENGAL 723101', 'Naveen Kumar', '', '193809');
INSERT INTO `cock_consignment` VALUES ('69', '114372', '2019-03-13', '11', '', 'SILIGURI', '6', 'FATAPUKUR', '', 'ASANSOL', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'RELIANCE RETAIL LTD', '2', 'HCV.16', '7', 'WB37B8492', '428484', '0', '2019-03-15 13:34:29', '2019-03-15 16:58:13', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'ADDA LINK ROAD BABUA PUKUR ASANSOL WEST BENGOL 713301', 'Naveen Kumar', '', '189977');
INSERT INTO `cock_consignment` VALUES ('70', '114373', '2019-03-13', '11', '', 'SILIGURI', '6', 'FATAPUKUR', '', 'NAWADA', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'MM ENTERPRISES', '2', 'HCV.16', '64', 'WB03C7792', '530434.17', '0', '2019-03-15 13:38:05', '2019-03-15 16:58:52', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'ANSAR NAGAR NAWADANR NAWADA BIHAR 805110', 'Naveen Kumar', '', '189692');
INSERT INTO `cock_consignment` VALUES ('71', '14374', '2019-03-13', '11', '', 'SILIGURI', '6', 'FATAPUKUR', '', 'DARJEELING', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'HIMALAYA AGENCIES', '1', 'LCV.6', '6', 'WB73B7316', '148884.77', '0', '2019-03-15 13:41:21', '2019-03-15 13:41:21', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'DARJEELING WEST BENGAL 734101', 'Naveen Kumar', '60386', '');
INSERT INTO `cock_consignment` VALUES ('72', '114374', '2019-03-13', '11', '1', 'SILIGURI', '6', 'FATAPUKUR', '', 'DARJEELING', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'HIMALAYA AGENCIES', '1', 'LCV.6', '6', 'WB73B7316', '148884.77', '0', '2019-03-15 17:01:50', '2019-03-15 17:01:50', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', '1ST FLOOR 5A NEHRU ROADCHOWRASTA, DARJEELING, WEST BENGAL 734101', 'Naveen Kumar', '60386', '');
INSERT INTO `cock_consignment` VALUES ('73', '114375', '2019-03-13', '11', '1', 'SILIGURI', '6', 'FATAPUKUR', '', 'MIRIK', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'GAYTRI STORES', '1', 'LCV.6', '14', 'WB73B6290', '0', '0', '2019-03-15 17:05:26', '2019-03-15 17:05:26', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'THANA LINE WORD NO 3PO MIRIK WEST BENGAL 734214', 'Naveen Kumar', '60796', '');
INSERT INTO `cock_consignment` VALUES ('74', '114377', '2019-03-12', '11', '1', 'SILIGURI', '6', 'FATAPUKUR', '', 'BEGUSARAI', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'PARTIMA ENTERPRISES', '2', 'HCV.16', '66', 'OD16B1152', '569328.48', '0', '2019-03-15 17:19:46', '2019-03-15 17:19:46', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'BALLIA BAZAR LAKHMINIANR PURANI DURGA ASTHAN BEGUSARAI BIHAR 851211', 'Naveen Kumar', '', '194131');
INSERT INTO `cock_consignment` VALUES ('75', '114378', '2019-03-13', '11', '1', 'SILIGURI', '', 'FATAPUKUR', '', 'DARJEELING', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'HIMALAYA AGENCIES', '1', 'LCV.6', '43', 'WB73C1432', '164310.51', '0', '2019-03-15 17:21:48', '2019-03-15 17:21:48', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', '1ST FLOOR 5A NEHRU ROADCHOWRASTA, DARJEELING, WEST BENGAL 734101', 'Naveen Kumar', '', '192651');
INSERT INTO `cock_consignment` VALUES ('76', '114379', '2019-03-13', '11', '1', 'SILIGURI', '', 'FATAPUKUR', '', 'JAYNAGAR', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'DADEE MAA LAXMI ENTERPRISES', '2', 'HCV.16', '67', 'HR69C7177', '541747.67', '0', '2019-03-15 17:24:46', '2019-03-15 17:24:46', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'NH 105 JAYNAGAR BASTI NEAR PETROL PUMP MADHUBANI RURAL BIHAR 847226', 'Naveen Kumar', '', '190428');
INSERT INTO `cock_consignment` VALUES ('77', '114381', '2019-03-13', '11', '', 'SILIGURI', '6', 'FATAPUKUR', '', 'JAMUI', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'SRI RADHE RADHE ENTERPRISES', '2', 'HCV.16', '70', 'WB41H0730', '495883.2', '0', '2019-03-15 17:33:13', '2019-03-15 17:33:13', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'MALLEPUR JHAJHA ROAD JAMUI NEAR KATAUNA MORE JAMUI BIHAR 811307', 'Naveen Kumar', '', '190495');
INSERT INTO `cock_consignment` VALUES ('78', '114383', '2019-03-13', '11', '1', 'SILIGURI', '6', 'FATAPUKUR', '', 'JAMUI', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'RAVI COLD DRINK ', '2', 'HCV.16', '72', 'WB41J3853', '689043.48', '0', '2019-03-15 17:55:04', '2019-03-15 17:55:04', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'JP CHOWK CHAKI JAMUI INFRONT  OF STATE BANK OF INDIA JAMUI 811303', 'Naveen Kumar', '', '190497');
INSERT INTO `cock_consignment` VALUES ('79', '114384', '2019-03-14', '11', '1', 'SILIGURI', '6', 'FATAPUKUR', '', 'NAUGACHHIA', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'MARUTI TRADERS', '2', 'HCV.16', '73', 'WB73E4370', '480904.98', '0', '2019-03-15 18:08:18', '2019-03-15 18:08:18', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'NEAR MADAN AHILYA COLLAGE NAUGACHIA BIHAR 853204', 'Naveen Kumar', '', '194017');
INSERT INTO `cock_consignment` VALUES ('80', '114385', '2019-03-14', '11', '1', 'SILIGURI', '6', 'FATAPUKUR', '', 'DARBHANGA', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'BALAJEE AGENCY', '2', 'HCV.16', '74', 'UP13AT1728', '657431.28', '0', '2019-03-15 18:27:29', '2019-03-15 18:27:29', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'C/O N.K. HOBBYS /O B.N KAPRI LAXMI SAGAR DARBHANGA BIHAR 847203', 'Naveen Kumar', '', '194015');
INSERT INTO `cock_consignment` VALUES ('81', '114386', '2019-03-14', '11', '1', 'SILIGURI', '6', 'FATAPUKUR', '', 'CHHAURADANOW', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'LAXMI ENTERPRISES ', '3', 'HCV.15', '75', 'UP17AT4387', '503787.06', '0', '2019-03-15 18:30:47', '2019-03-15 18:30:47', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'BANK RD CHHAURADANO E CHAMPRAN NR GP RESIDENTIAL SCHOOL CHAURADANOW BIHAR 845302', 'Naveen Kumar', '', '195986');
INSERT INTO `cock_consignment` VALUES ('82', '114382', '2019-03-13', '11', '1', 'SILIGURI', '6', 'FATAPUKUR', '', 'ROHTAS', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'SHIVAM TRADERS ', '2', 'HCV.16', '71', 'MP17HH1528', '536612.58', '0', '2019-03-15 18:46:06', '2019-03-15 18:46:06', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'SHIV MANDIR ROAD DIST BUXAR  BRAHAMPUR ROHTAS BIHAR 821109', 'Naveen Kumar', '', '194020');
INSERT INTO `cock_consignment` VALUES ('83', '114380', '2019-03-13', '11', '1', 'SILIGURI', '', 'FATAPUKUR', '', 'BHAGALPUR', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'ANJALI TRADERS', '2', 'HCV.16', '76', 'NL01L7749', '578991.66', '0', '2019-03-15 18:49:11', '2019-03-15 18:49:11', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'FEKU BHAWAN NATH NAGAR NEAR JAWAHAR CINEMA BHAGALPUR BIHAR 812006', 'Naveen Kumar', '', '194019');
INSERT INTO `cock_consignment` VALUES ('84', '114376', '2019-03-13', '11', '1', 'SILIGURI', '6', 'FATAPUKUR', '', 'BHAGALPUR', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'AMIT TRADERS ', '2', 'HCV.16', '65', 'WB39B4446', '522020.55', '0', '2019-03-15 19:16:24', '2019-03-15 19:16:24', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'SABOUR BHAGALPUR NEAR  STATION CHOWK BHAGALPUR BIHAR 813210', 'Naveen Kumar', '', '194018');
INSERT INTO `cock_consignment` VALUES ('85', '114387', '2019-03-14', '11', '1', 'SILIGURI', '6', 'FATAPUKUR', '', 'DARJEELING', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'HIMALAYA AGENCY ', '1', 'LCV.6', '6', 'WB73B7316', '141005.41', '0', '2019-03-25 15:09:41', '2019-03-26 15:34:20', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', '1ST FLOOR NEHRU ROADCHOWRASTA DARJILING SILIGURI WEST BENGOL 734104', 'Naveen Kumar', '61638', '');
INSERT INTO `cock_consignment` VALUES ('86', '114388', '2019-03-14', '11', '1', 'SILIGURI', '6', 'FATAPUKUR', '', 'MUZAFFARPUR', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', '4', 'HCV.20', '144', 'WB49N0222', '844120', '0', '2019-03-25 15:33:04', '2019-03-26 15:35:39', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'BEHIND IT MEMORIAL HOSPITAL NH57 MUZAFFARPUR BIHAR 842004', 'Naveen Kumar', '', '193471');
INSERT INTO `cock_consignment` VALUES ('87', '114389', '2019-03-14', '11', '1', 'SILIGURI', '6', 'FATAPUKUR', '', 'MUZAFFARPUR', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', '4', 'HCV.20', '79', 'PB11BU4177', '492120', '0', '2019-03-25 15:47:41', '2019-03-26 15:37:33', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'BEHIND IT MEMORIAL HOSPTAIL MUZAFFARPUR BIHAR 842004', 'Naveen Kumar', '', '193421');
INSERT INTO `cock_consignment` VALUES ('88', '114390', '2019-03-14', '11', '', 'SILIGURI', '6', 'FATAPUKUR', '', 'DARBHANGA', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'SHAKTI ENTERPRISES', '2', 'HCV.16', '80', 'RJ09GA0385', '512013.4', '0', '2019-03-25 15:52:23', '2019-03-26 15:49:14', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'SUPOUL BAZAR DARBHANGANR BIHAR 847203', 'Naveen Kumar', '', '195461');
INSERT INTO `cock_consignment` VALUES ('89', '114391', '2019-03-15', '11', '1', 'SILIGURI', '6', 'FATAPUKUR', '', 'DARBHANGA', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'BALAJEE AGENCY', '2', 'HCV.16', '81', 'WB23C2581', '465125.35', '0', '2019-03-25 15:56:53', '2019-03-26 15:52:42', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'BN KAPRILAXMI SAGAR DARBHANGA BIHAR 847203', 'Naveen Kumar', '', '194046');
INSERT INTO `cock_consignment` VALUES ('90', '114451', '2019-03-18', '11', '1', 'SILIGURI', '6', 'FATAPUKUR', '', 'SUKIA', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'JAI MAHAKAL DISTRIBUTORS', '1', 'LCV.6', '14', 'WB73B6290', '175904.86', '0', '2019-03-25 15:58:31', '2019-03-25 15:58:31', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'SARDAR GAIRI GAONAT SUKHIA POKHARI DARJEELING WEST BENGAL 734221', 'Naveen Kumar', '64482', '');
INSERT INTO `cock_consignment` VALUES ('91', '114452', '2019-03-18', '11', '1', 'SILIGURI', '', 'FATAPUKUR', '', 'DARJEELING', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'HIMALAYA AGENCIES', '1', 'LCV.6', '6', 'WB73B7316', '164915.68', '0', '2019-03-25 16:00:13', '2019-03-25 16:00:13', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', '1ST FLOOR 5A NEHRU ROADCHOWRASTA, DARJEELING, WEST BENGAL 734101', 'Naveen Kumar', '66924', '');
INSERT INTO `cock_consignment` VALUES ('92', '114392', '2019-03-14', '11', '1', 'SILIGURI', '6', 'FATAPUKUR', '42', 'BHOJPUR', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'VISHNAVI ENTERPRISES', '2', 'HCV.16', '82', 'MP53HA1969', '580011.64', '0', '2019-03-25 16:00:32', '2019-03-26 15:54:19', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'GARAHANIBAZAR STATE BANK BHOJPUR BIHAR 802301', 'Naveen Kumar', '', '195101');
INSERT INTO `cock_consignment` VALUES ('93', '114453', '2019-03-18', '11', '1', 'SILIGURI', '6', 'FATAPUKUR', '', 'GERABARI', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'BALAJEE TRADEING ', '4', 'HCV.20', '77', 'UP52F6232', '779413.3', '0', '2019-03-25 16:03:17', '2019-03-25 16:03:17', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'GERABARI PO KORHA NH 31 NEAR BANK OF INDIA GERABARI KAATIHAR BIHAR 854108', 'Naveen Kumar', '', '212873');
INSERT INTO `cock_consignment` VALUES ('94', '114454', '2019-03-19', '11', '1', 'SILIGURI', '6', 'FATAPUKUR', '', 'MIRIK', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'GAYTRI STORE ', '1', 'LCV.6', '14', 'WB73B6290', '170717.01', '0', '2019-03-25 16:05:38', '2019-03-25 16:05:38', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'THANA LINE WORD NO 3 PO MIRIK, SILIGURI WEST BENGAL 734214', 'Naveen Kumar', '67856', '');
INSERT INTO `cock_consignment` VALUES ('95', '114455', '2019-03-19', '11', '1', 'SILIGURI', '6', 'FATAPUKUR', '', 'DARJEELING', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'HIMALAYA AGENCIES', '1', 'LCV.6', '6', 'WB73B7316', '240015.09', '0', '2019-03-25 16:09:20', '2019-03-25 16:09:20', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', '1ST FLOOR 5A NEHRU ROADCHOWRASTA, DARJEELING, WEST BENGAL 734101', 'Naveen Kumar', '67932', '');
INSERT INTO `cock_consignment` VALUES ('96', '114393', '2019-03-15', '11', '1', 'SILIGURI', '6', 'FATAPUKUR', '', 'JAGDISHPUR', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'GUPTA ENTERPRISES', '2', 'HCV.16', '145', 'MP20HB3616', '580031.64', '0', '2019-03-25 16:10:07', '2019-03-26 15:58:47', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'BLOCK OFFICE JAGDISPUR BIHAR 802158', 'Naveen Kumar', '', '195988');
INSERT INTO `cock_consignment` VALUES ('97', '114394', '2019-03-15', '11', '1', 'SILIGURI', '6', 'FATAPUKUR', '41', 'CHANPATIYA', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'KUMAR STORES', '2', 'HCV.16', '84', 'UP78CN2770', '7063064489', '0', '2019-03-25 16:19:22', '2019-03-26 16:00:20', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'BELDARPPATI WARD NO 8 CHANPATIA BIHAR 845449', 'Naveen Kumar', '', '195102');
INSERT INTO `cock_consignment` VALUES ('98', '114460', '2019-03-20', '11', '1', 'SILIGURI', '6', 'FATAPUKUR', '', 'MUZAFFARPUR', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', '4', 'HCV.20', '136', 'UP14FT5797', '633780', '0', '2019-03-25 16:21:06', '2019-03-25 16:21:06', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'BEHIND IT MEMORIAL HOSPITAL NH 57 MUZAFFARPUR, BIHAR', 'Naveen Kumar', '', '224150');
INSERT INTO `cock_consignment` VALUES ('99', '114395', '2019-03-15', '11', '1', 'SILIGURI', '6', 'FATAPUKUR', '', 'BETTIAH', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'SIKARIA TRADERS', '2', 'HCV.16', '85', 'NL05G0655', '564344.27', '0', '2019-03-25 16:22:24', '2019-03-25 16:22:24', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'LAL BAZAR BETTIAH BIHAR 845438', 'Naveen Kumar', '', '199142');
INSERT INTO `cock_consignment` VALUES ('100', '114461', '2019-03-20', '11', '1', 'SILIGURI', '6', 'FATAPUKUR', '', 'DARJEELING', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'HIMALAYA AGENCIES', '1', 'LCV.6', '6', 'WB73B7316', '153204.97', '0', '2019-03-25 16:22:40', '2019-03-25 16:22:40', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', '1ST FLOOR 5A NEHRU ROADCHOWRASTA, DARJEELING, WEST BENGAL 734101', 'Naveen Kumar', '68987', '');
INSERT INTO `cock_consignment` VALUES ('101', '114462', '2019-03-20', '11', '', 'SILIGURI', '6', 'FATAPUKUR', '', 'DARJEELING', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'HIMALAYA AGENCIES', '1', 'LCV.6', '14', 'WB73B6290', '156128.43', '0', '2019-03-25 16:24:11', '2019-03-25 16:24:11', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', '1ST FLOOR 5A NEHRU ROADCHOWRASTA, DARJEELING, WEST BENGAL 734101', 'Naveen Kumar', '', '222251');
INSERT INTO `cock_consignment` VALUES ('102', '114396', '2019-03-14', '11', '', 'SILIGURI', '6', 'FATAPUKUR', '', 'MUZAFFARPUR', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', '4', 'HCV.20', '86', 'UP78DN3935', '484120', '0', '2019-03-25 16:25:29', '2019-03-25 16:25:29', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'BHIKAMPUR BEHIND IT MEMORIAL HOSPATIAL MUZAFFARPUR BIHAR 842004', 'Naveen Kumar', '', '193442');
INSERT INTO `cock_consignment` VALUES ('103', '114463', '2019-03-21', '11', '1', 'SILIGURI', '6', 'FATAPUKUR', '', 'MUZAFFARPUR', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', '4', 'HCV.20', '137', 'UP37T2313', '481460', '0', '2019-03-25 16:26:13', '2019-03-25 16:26:13', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'BEHIND IT MEMORIAL HOSPITAL NH 57 MUZAFFARPUR BIHAR', 'Naveen Kumar', '', '227836');
INSERT INTO `cock_consignment` VALUES ('104', '114464', '2019-03-21', '11', '1', 'SILIGURI', '6', 'FATAPUKUR', '', 'DARJEELING', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'FUTURE RETAIL ', '1', 'LCV.6', '43', 'WB73C1432', '0', '0', '2019-03-25 16:29:47', '2019-03-25 16:29:47', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'RINK MALL 19 LADENLA ROAD  DARJEELING SILIGURI WEST BENGAL 734301', 'Naveen Kumar', '', '230355');
INSERT INTO `cock_consignment` VALUES ('105', '114397', '2019-03-15', '11', '', 'SILIGURI', '6', 'FATAPUKUR', '', 'ROHTAS', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'SHIVAM TRADERS', '2', 'HCV.16', '87', 'MP19HA3499', '536612.58', '0', '2019-03-25 16:30:33', '2019-03-25 16:30:33', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'SHIV MANDIR ROADAT POBRAHAMPUR DIST BUXAR ROHTAS BIHAR 821109', 'Naveen Kumar', '', '194119');
INSERT INTO `cock_consignment` VALUES ('106', '114465', '2019-03-23', '11', '1', 'SILIGURI', '6', 'FATAPUKUR', '', 'DARJEELING', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'HIMALAYA AGENCIES', '1', 'LCV.6', '43', 'WB73C1432', '126736.85', '0', '2019-03-25 16:31:23', '2019-03-25 16:31:23', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', '1ST FLOOR 5A NEHRU ROADCHOWRASTA, DARJEELING, WEST BENGAL 734101', 'Naveen Kumar', '73231', '');
INSERT INTO `cock_consignment` VALUES ('107', '114466', '2019-03-23', '11', '1', 'SILIGURI', '6', 'FATAPUKUR', '', 'MIRIK', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'GAYTRI STORES', '1', 'LCV.6', '14', 'WB73B6290', '143109.48', '0', '2019-03-25 16:33:40', '2019-03-25 16:33:40', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'THANA LINE WARD NO 3 PO MIRIK, SILIGURI WEST BENGAL 734214', 'Naveen Kumar', '73229', '');
INSERT INTO `cock_consignment` VALUES ('108', '114398', '2019-03-15', '11', '', 'SILIGURI', '6', 'FATAPUKUR', '', 'ROHTAS', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'S N ENTERPRISES', '2', 'HCV.16', '88', 'MP20HB5760', '57262.58', '0', '2019-03-25 16:34:20', '2019-03-25 16:34:20', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'NAZIM HASANBILGARAMI MARKETMALIABAG ROHTAS BIHAR 802201', 'Naveen Kumar', '', '194120');
INSERT INTO `cock_consignment` VALUES ('109', '114467', '2019-03-23', '11', '1', 'SILIGURI', '6', 'FATAPUKUR', '', 'NAWADA', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'KAVITANJALI ENTERPRISES', '4', 'HCV.20', '138', 'MP20HB5927', '739615.14', '0', '2019-03-25 16:36:18', '2019-03-25 16:36:18', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'SHOP NO - 284 THANA ROAD NAWADA AT DISTRICT BOARD COMPLEX  NAWADA BIHAR 805110', 'Naveen Kumar', '', '236879');
INSERT INTO `cock_consignment` VALUES ('110', '114399', '2019-03-15', '11', '', 'SILIGURI', '6', 'FATAPUKUR', '', 'PURULIYA', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'SUBIR KUMAR HALDAR', '2', 'HCV.16', '89', 'JH11E2305', '671002.33', '0', '2019-03-25 16:38:12', '2019-03-25 16:38:12', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'MADHYA BAZAR PURULIYA DHARAMSHALA WEST BENGAL 723101', 'Naveen Kumar', '', '194021');
INSERT INTO `cock_consignment` VALUES ('111', '114468', '2019-03-23', '11', '1', 'SILIGURI', '6', 'FATAPUKUR', '', 'PATNA', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'SHREE KRISHNA ENTERPRISES', '4', 'HCV.20', '139', 'UP60T1811', '626157.6', '0', '2019-03-25 16:39:15', '2019-03-25 16:39:15', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'KULHARIA HOUSE ASHOK RAJPATH AKILPUR PATNA BIHAR 800012', 'Naveen Kumar', '', '237207');
INSERT INTO `cock_consignment` VALUES ('112', '114400', '2019-03-15', '11', '1', 'SILIGURI', '6', 'FATAPUKUR', '', 'BEGUSARAI', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'RANJAN KUMAR MANJHAUL', '2', 'HCV.16', '90', 'WB23C2197', '553128.48', '0', '2019-03-25 16:42:28', '2019-03-25 16:42:28', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'BAKHARI ROAD MANJHAUL BEGUSARAI BIHAR 851127', 'Naveen Kumar', '', '195103');
INSERT INTO `cock_consignment` VALUES ('113', '114469', '2019-03-23', '11', '1', 'SILIGURI', '6', 'FATAPUKUR', '', 'DARJEELING', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'HIMALAYA AGENCIES', '1', 'LCV.6', '14', 'WB73B6290', '143223.58', '0', '2019-03-25 16:42:49', '2019-03-25 16:42:49', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', '1ST FLOOR 5A NEHRU ROADCHOWRASTA, DARJEELING, WEST BENGAL 734101', 'Naveen Kumar', '73210', '');
INSERT INTO `cock_consignment` VALUES ('114', '114470', '2019-03-24', '11', '1', 'SILIGURI', '6', 'FATAPUKUR', '', 'ASANSOL', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'RELIANCE RETAIL  LTD', '4', 'HCV.20', '140', 'NL01AA7693', '432768.84', '0', '2019-03-25 16:46:11', '2019-03-25 16:49:51', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'ADDA LINK ROAD BABUA PUKUR ASANSOL WEST BENGOL 713301', 'Naveen Kumar', '', '238344');
INSERT INTO `cock_consignment` VALUES ('115', '114401', '2019-03-14', '11', '', 'SILIGURI', '6', 'FATAPUKUR', '', 'MADHUBANI', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'ASHA DISTRIBUTORS', '2', 'HCV.16', '91', 'RJ07GB5518', '481570.59', '0', '2019-03-25 16:48:34', '2019-03-25 16:48:34', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'KHUTAUNA BAZARNEAR MOYI CINEMA MADHUBANI BIHAR 847227', 'Naveen Kumar', '', '191292');
INSERT INTO `cock_consignment` VALUES ('116', '114471', '2019-03-24', '11', '1', 'SILIGURI', '6', 'FATAPUKUR', '', 'ASANSOL', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'RELIANCE RETAIL LTD.', '3', 'HCV.15', '141', 'NL01AB8341', '397878', '0', '2019-03-25 16:49:05', '2019-03-25 16:49:05', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'ADDA LINK ROAD BABUA PUKUR ASANSOL WEST BENGOL 713301', 'Naveen Kumar', '', '237000');
INSERT INTO `cock_consignment` VALUES ('117', '114402', '2019-03-14', '11', '1', 'SILIGURI', '6', 'FATAPUKUR', '', 'DARBHANGA', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'G B ENTERPRISES LAHERIASARAI', '2', 'HCV.16', '92', 'WB23A7997', '595703.94', '0', '2019-03-25 16:52:25', '2019-03-25 16:52:25', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'SAIDNAGAR LAHERIASARAI BANK OF INDIA DARBHANGA BIHAR 846001', 'Naveen Kumar', '', '195987');
INSERT INTO `cock_consignment` VALUES ('118', '114472', '2019-03-24', '11', '1', 'SILIGURI', '6', 'FATAPUKUR', '', 'PUPRI', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'SRI GANPATI SALES ', '4', 'HCV.20', '142', 'HR69C3547', '689656.38', '0', '2019-03-25 16:54:07', '2019-03-25 16:54:07', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'C/O SRI HARI SAHCINEMA ROAD  PUPRI DIS SITAMADHI BIHAR 843331', 'Naveen Kumar', '', '236877');
INSERT INTO `cock_consignment` VALUES ('119', '114403', '2019-03-14', '11', '', 'SILIGURI', '6', 'FATAPUKUR', '', 'MUZAFFARPUR', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', '4', 'HCV.20', '93', 'UP19T5293', '484120', '0', '2019-03-25 16:56:11', '2019-03-25 16:56:11', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'BHIKAMPUR BEHAIND IT MEMORIAL HOSPATAIL MUZAFFARPUR BIHAR 842004', 'Naveen Kumar', '', '193422');
INSERT INTO `cock_consignment` VALUES ('120', '114473', '2019-03-24', '11', '1', 'SILIGURI', '6', 'FATAPUKUR', '', 'NAWADA', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'KAVITANJALI ENTERPRISES', '4', 'HCV.20', '143', 'UP63AT1532', '547564.8', '0', '2019-03-25 16:56:59', '2019-03-25 16:56:59', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'SHOP NO - 284 THANA ROAD  NAWADA AT DISTRICT COMPLEX NAWADA, BIHAR 805110 ', 'Naveen Kumar', '', '236878');
INSERT INTO `cock_consignment` VALUES ('121', '114404', '2019-03-14', '11', '1', 'SILIGURI', '6', 'FATAPUKUR', '', 'JAMUI', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'RAVI COLD  DRINKS CHAKAI', '2', 'HCV.16', '94', 'WB41F8432', '647528.22', '0', '2019-03-25 16:59:54', '2019-03-25 16:59:54', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'JP CHOWK CHAKI JAMUI BIHAR 811303', 'Naveen Kumar', '', '200037');
INSERT INTO `cock_consignment` VALUES ('122', '114434', '2019-03-16', '11', '1', 'SILIGURI', '', 'FATAPUKUR', '', 'DARJEELING', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'INOX LEISURE & HIMALAYA AGENCY', '1', 'LCV.6', '14', 'WB73B6290', '159334.41', '0', '2019-03-25 17:00:19', '2019-03-26 17:13:08', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', '1ST FLOOR 5A NEHRU ROADCHOWRASTA, DARJEELING, WEST BENGAL 734101', 'Naveen Kumar', '', '206838');
INSERT INTO `cock_consignment` VALUES ('123', '114435', '2019-03-16', '11', '1', 'SILIGURI', '6', 'FATAPUKUR', '', 'DARJEELING', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'HIMALAYA AGENCIES', '1', 'LCV.6', '6', 'WB73B7316', '172768.39', '0', '2019-03-25 17:01:59', '2019-03-25 17:01:59', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', '1ST FLOOR 5A NEHRU ROADCHOWRASTA, DARJEELING, WEST BENGAL 734101', 'Naveen Kumar', '64450', '');
INSERT INTO `cock_consignment` VALUES ('124', '114405', '2019-03-14', '11', '1', 'SILIGURI', '6', 'FATAPUKUR', '', 'ASANSOL', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'RELIANCE RETAIL LTD', '2', 'HCV.16', '95', 'WB23B1474', '419302.2', '0', '2019-03-25 17:03:26', '2019-03-25 17:03:26', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'ADDA  LINK ROAD BABUA PUKUR ASANSOL WEST BENGAL 713301', 'Naveen Kumar', '', '195354');
INSERT INTO `cock_consignment` VALUES ('125', '114436', '2019-03-16', '11', '1', 'SILIGURI', '6', 'FATAPUKUR', '', 'PATNA', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'LAXMI ENTERPRISES', '4', 'HCV.20', '121', 'BR27G6193', '630360', '0', '2019-03-25 17:04:58', '2019-03-25 17:04:58', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'POLSON ROAD DIGHA GHAT PATNA  BIHAR 800010', 'Naveen Kumar', '', '208719');
INSERT INTO `cock_consignment` VALUES ('126', '114406', '2019-03-14', '11', '1', 'SILIGURI', '6', 'FATAPUKUR', '', 'MOHIUDDINAGAR', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'SATNAM AGENCIES', '2', 'HCV.16', '96', 'HR55V9494', '465686.4', '0', '2019-03-25 17:07:00', '2019-03-25 17:07:00', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'MOHIUDDIN NAGAR RAMAN CINENMA DIST SAMSATIPUR BIHAR 848502', 'Naveen Kumar', '', '194132');
INSERT INTO `cock_consignment` VALUES ('127', '114437', '2019-03-17', '11', '1', 'SILIGURI', '6', 'FATAPUKUR', '', 'JAYNAGAR', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'DADEE MAA LAXMI ENTERPRISES', '4', 'HCV.20', '122', 'HR38S6727', '603333.12', '0', '2019-03-25 17:07:31', '2019-03-25 17:07:31', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'NH 105 JAYNAGAR BASTI NEAR PETROL PUMP MADHUBANI RURAL BIHAR 847226', 'Naveen Kumar', '', '208720');
INSERT INTO `cock_consignment` VALUES ('128', '114438', '2019-03-16', '11', '1', 'SILIGURI', '6', 'FATAPUKUR', '', 'ASANSOL', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', '4', 'HCV.20', '123', 'WB830101', '381140', '0', '2019-03-25 17:09:26', '2019-03-25 17:09:26', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'RANI SATI WAREHOUSING & LOGISTIC, BARDHAMAN WEST BENGAL 713383', 'Naveen Kumar', '', '208168');
INSERT INTO `cock_consignment` VALUES ('129', '114439', '2019-03-16', '11', '1', 'SILIGURI', '6', 'FATAPUKUR', '', 'BANKURA', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'PAUL FRUITS COMPANY', '3', 'HCV.15', '124', 'WB65C0875', '737896.29', '0', '2019-03-25 17:11:52', '2019-03-25 17:11:52', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'LAL BAZAR BANKURA  NR BISHNUPUR ROAD BANKURA WEST BENGAL 722101', 'Naveen Kumar', '', '203860');
INSERT INTO `cock_consignment` VALUES ('130', '114440', '2019-03-16', '11', '1', 'SILIGURI', '6', 'FATAPUKUR', '', 'ASANSOL', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', '2', 'HCV.16', '125', 'WB61A1389', '275500', '0', '2019-03-25 17:13:26', '2019-03-25 17:13:26', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'RANI SATI WAREHOUSING & LOGISTIC, BARDHAMAN WEST BENGAL 713383', 'Naveen Kumar', '', '208182');
INSERT INTO `cock_consignment` VALUES ('131', '114407', '2019-03-15', '11', '', 'SILIGURI', '6', 'FATAPUKUR', '', 'DARBHANGA', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'MAA ENTERPRISES BAHERI', '2', 'HCV.16', '97', 'UP21BN8025', '465125.35', '0', '2019-03-25 17:14:17', '2019-03-25 17:14:17', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'RAM NAGAR DEVKULIBAHERI DIST DARBHANGA BIHAR 847105', 'Naveen Kumar', '', '195464');
INSERT INTO `cock_consignment` VALUES ('132', '114441', '2019-03-16', '11', '1', 'SILIGURI', '6', 'FATAPUKUR', '', 'GERABARI', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'BALAJEE TRADING ', '2', 'HCV.16', '126', 'WB29B1924', '600846.36', '0', '2019-03-25 17:15:57', '2019-03-25 17:15:57', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'GERABARI PO KORHA NH 31 NEAR BANK OF INDIA GERABARI KATIHAR ', 'Naveen Kumar', '', '208742');
INSERT INTO `cock_consignment` VALUES ('133', '114408', '2019-03-15', '11', '', 'SILIGURI', '6', 'FATAPUKUR', '', 'MUZAFFARPUR', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', '4', 'HCV.20', '98', 'HR55T6645', '484120', '0', '2019-03-25 17:17:56', '2019-03-25 17:17:56', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'BHIKAMPUR BEHAIND IT MEMORIAL HOSPATIAL MUZAFFARPUR BIHAR 842004', 'Naveen Kumar', '', '193464');
INSERT INTO `cock_consignment` VALUES ('134', '114442', '2019-03-16', '11', '1', 'SILIGURI', '6', 'FATAPUKUR', '', 'SINGHWARA', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'NAMAN AUTOMOBILES ', '4', 'HCV.20', '127', 'MH15EG8649', '704899.58', '0', '2019-03-25 17:19:05', '2019-03-25 17:31:26', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'MAIN ROAD SINGHWARA DARBHANGA NEAR NAND RAJ AUTOMOBILES  SINGHWARA DARBHANGA BIHAR 847106', 'Naveen Kumar', '', '208718');
INSERT INTO `cock_consignment` VALUES ('135', '114443', '2019-03-16', '11', '1', 'SILIGURI', '6', 'FATAPUKUR', '', 'PATNA', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'LAXMI ENTERPRISES', '4', 'HCV.20', '128', 'CG15AC5546', '836730.72', '0', '2019-03-25 17:20:58', '2019-04-03 06:52:23', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'POLSON ROAD DIGHA GHAT PATNA BIHAR 800010', 'Naveen Kumar', '', '211005');
INSERT INTO `cock_consignment` VALUES ('136', '114409', '2019-03-15', '11', '', 'SILIGURI', '6', 'FATAPUKUR', '', 'MUZAFFARPUR', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', '4', 'HCV.20', '99', 'HR657512', '484460', '0', '2019-03-25 17:21:58', '2019-03-25 17:21:58', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'BHIKAMPUR BEHAIND IT MEMORAIL HOSPATIAL MUZAFFARPUR BIHAR 842004', 'Naveen Kumar', '', '197725');
INSERT INTO `cock_consignment` VALUES ('137', '114444', '2019-03-16', '11', '1', 'SILIGURI', '6', 'FATAPUKUR', '', 'BAHERI', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'MAA ENTERPRISES', '4', 'HCV.20', '129', 'PB06V0832', '622138.28', '0', '2019-03-25 17:23:34', '2019-03-25 17:23:34', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'RAMNAGAR DEVKULI BAHERI DIST DARBHANGA BIHAR 847105', 'Naveen Kumar', '', '208717');
INSERT INTO `cock_consignment` VALUES ('138', '114410', '2019-03-15', '11', '1', 'SILIGURI', '6', 'FATAPUKUR', '', 'MUZAFFARPUR', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', '4', 'HCV.20', '100', 'PB10DM3325', '543697', '0', '2019-03-25 17:25:51', '2019-03-25 17:25:51', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'BHIKAMPUR BEHAIND IT MEMORAIL HOSPATAIL MUZAFFARPUR BIHAR 842004', 'Naveen Kumar', '', '193441');
INSERT INTO `cock_consignment` VALUES ('139', '114445', '2019-03-17', '11', '1', 'SILIGURI', '6', 'FATAPUKUR', '', 'MUZAFFARPUR', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', '4', 'HCV.20', '130', 'PB06V0821', '536795', '0', '2019-03-25 17:25:57', '2019-03-25 17:25:57', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'BEHIND IT MEMORIAL HOSPITAL NH 57 MUZAFFARPUR BIHAR', 'Naveen Kumar', '', '213681');
INSERT INTO `cock_consignment` VALUES ('140', '114446', '2019-03-17', '11', '1', 'SILIGURI', '6', 'FATAPUKUR', '', 'MUZAFFARPUR', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', '4', 'HCV.20', '131', 'PB06V0819', '481460', '0', '2019-03-25 17:29:54', '2019-03-25 17:29:54', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'BEHIND IT MEMORIAL HOSPITAL NH 57 MUZAFFARPUR BIHAR', 'Naveen Kumar', '', '213690');
INSERT INTO `cock_consignment` VALUES ('141', '114411', '2019-03-15', '11', '', 'SILIGURI', '6', 'FATAPUKUR', '', 'MUZAFFARPUR', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', '4', 'HCV.20', '101', 'PB10DM3225', '484120', '0', '2019-03-25 17:30:13', '2019-03-25 17:30:13', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'BHIKAMPUR BEHAIND IT MEMORAIL HOSPATAIL MUZAFFARPUR BIHAR 842004', 'Naveen Kumar', '', '193463');
INSERT INTO `cock_consignment` VALUES ('142', '114447', '2019-03-17', '11', '1', 'SILIGURI', '6', 'FATAPUKUR', '', 'MUZAFFARPUR', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', '4', 'HCV.20', '132', 'MH15GV7011', '536795', '0', '2019-03-25 17:33:48', '2019-03-25 17:33:48', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'BEHIND IT MEMORIAL HOSPITAL NH 57 MUZAFFARPUR BIHAR', 'Naveen Kumar', '', '213682');
INSERT INTO `cock_consignment` VALUES ('143', '114412', '2019-03-15', '11', '1', 'SILIGURI', '6', 'FATAPUKUR', '', 'BETTIAH', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'K D FOODS', '2', 'HCV.16', '38', 'NL08A4529', '695417.5', '0', '2019-03-25 17:34:44', '2019-03-25 17:34:44', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'TEEN LALTEN CHOWK NEAR MEDICAL COLLEGE BETTAIH BIHAR 845438', 'Naveen Kumar', '', '200033');
INSERT INTO `cock_consignment` VALUES ('144', '114448', '2019-03-17', '11', '1', 'SILIGURI', '6', 'FATAPUKUR', '', 'MUZAFFARPUR', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', '4', 'HCV.20', '133', 'BR06GA1820', '517160', '0', '2019-03-25 17:35:56', '2019-03-25 17:35:56', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'BEHIND IT MEMORIAL HOSPITAL NH 57 MUZAFFARPUR BIHAR', 'Naveen Kumar', '', '202480');
INSERT INTO `cock_consignment` VALUES ('145', '114413', '2019-03-15', '11', '1', 'SILIGURI', '6', 'FATAPUKUR', '', 'MUZAFFARPUR', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', '4', 'HCV.20', '102', 'PB06V8673', '556000', '0', '2019-03-25 17:38:25', '2019-03-25 17:38:25', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'BHIKAMPUR BEHAIND  IT MEMORAIL HOSPATAIL MUZAFFARPUR BIHAR 842004', 'Naveen Kumar', '', '197726');
INSERT INTO `cock_consignment` VALUES ('146', '114449', '2019-03-17', '11', '1', 'SILIGURI', '6', 'FATAPUKUR', '', 'MURIA', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'DILIP AGENCY ', '2', 'HCV.16', '134', 'WB23B6665', '440564.1', '0', '2019-03-25 17:39:19', '2019-03-25 17:39:19', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'AT KAMALPUR PANDAUL PO & PS PANDAUL NEAR RAILWAY GUMTI MADHUBANI RL DARBHANGA BIHAR 847234', 'Naveen Kumar', '', '212874');
INSERT INTO `cock_consignment` VALUES ('147', '114450', '2019-03-17', '11', '1', 'SILIGURI', '6', 'FATAPUKUR', '', 'MUZAFFARPUR', '2', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', '4', 'HCV.20', '135', 'CG04JD0385', '502306', '0', '2019-03-25 17:41:30', '2019-03-25 17:41:30', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'BEHIND IT MEMORIAL HOSPITAL NH 57 MUZAFFARPUR BIHAR', 'Naveen Kumar', '', '202479');
INSERT INTO `cock_consignment` VALUES ('148', '114414', '2019-03-15', '11', '1', 'SILIGURI', '6', 'FATAPUKUR', '', 'MUZAFFARPUR', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', '4', 'HCV.20', '103', 'UP12AT0022', '536795', '0', '2019-03-25 17:42:18', '2019-03-25 17:42:18', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'BHIKAMPUR IT MEMORAIL HOSPATAIL MUZAFFARPUR BIHAR 842004', 'Naveen Kumar', '', '193472');
INSERT INTO `cock_consignment` VALUES ('149', '114415', '2019-03-15', '11', '1', 'SILIGURI', '6', 'FATAPUKUR', '', 'MUZAFFARPUR', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', '4', 'HCV.20', '104', 'UP12AT7284', '594258', '0', '2019-03-25 17:46:54', '2019-03-25 17:46:54', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'BHIKAMPUR IT MEMORAIL HOSPATAIL MUZAFFARPUR BIHAR 842004', 'Naveen Kumar', '', '193473');
INSERT INTO `cock_consignment` VALUES ('150', '114416', '2019-03-15', '11', '1', 'SILIGURI', '6', 'FATAPUKUR', '', 'DARBHANGA', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'MAA ENTERPRISES', '2', 'HCV.16', '105', 'HR67A4125', '544356.66', '0', '2019-03-25 17:51:17', '2019-03-27 15:25:05', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'RAM NAGAR DEVKULIBAHERI DIST DARBHANGA BIHAR 847105', 'Naveen Kumar', '', '195463');
INSERT INTO `cock_consignment` VALUES ('151', '114417', '2019-03-15', '11', '', 'SILIGURI', '6', 'FATAPUKUR', '', 'KURSEON', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'SHREE KRISHNA AGENCY', '1', 'LCV.6', '6', 'WB73B7316', '159704.91', '0', '2019-03-25 17:57:08', '2019-03-25 17:57:08', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'NEAR KURSEON RAILWAY STATION GUDRI BAZAR KURSEON SILIGURI WEST BENGAL 734203', 'Naveen Kumar', '62807', '201597');
INSERT INTO `cock_consignment` VALUES ('152', '114418', '2019-03-15', '11', '', 'SILIGURI', '6', 'FATAPUKUR', '', 'SUKIA', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'JAI MAHAKAL DISTRIBUTOR ', '1', 'LCV.6', '14', 'WB73B6290', '149933.08', '0', '2019-03-25 18:01:47', '2019-03-25 18:01:47', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'SARDAR GAIRI GAONAT SUKHIA DARJILING WEST BENGAL 734221', 'Naveen Kumar', '', '201710');
INSERT INTO `cock_consignment` VALUES ('153', '114419', '2019-03-15', '11', '1', 'SILIGURI', '6', 'FATAPUKUR', '', 'GANGARAMPUR', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'DAS COLD DRINKS', '5', 'LCV.9', '106', 'WB41C1775', '439364.6', '0', '2019-03-25 18:06:55', '2019-03-25 18:06:55', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'HIGH ROAD BUS STAND GANGARAMPUR DAKSHIN DINAJPUR WEST BENGAL 733124', 'Naveen Kumar', '', '201683');
INSERT INTO `cock_consignment` VALUES ('154', '114420', '2019-03-15', '11', '1', 'SILIGURI', '6', 'FATAPUKUR', '', 'PATNA', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'SHREE KRISHNA ENTERPRISES', '2', 'HCV.16', '107', 'MH04EL6677', '565563.3', '0', '2019-03-25 18:11:23', '2019-03-25 18:11:23', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'KULHARIA HOUSEASOK RAJPATHAKILPUR PATNA BIHAR 800012', 'Naveen Kumar', '', '196011');
INSERT INTO `cock_consignment` VALUES ('155', '114421', '2019-03-15', '11', '', 'SILIGURI', '6', 'FATAPUKUR', '', 'MUZAFFARPUR', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'CHANDRAMA& SAKUNTALA ENT MARKAN', '4', 'HCV.20', '108', 'PB11CQ3359', '810243.96', '0', '2019-03-25 18:18:01', '2019-03-25 18:18:01', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'MARKAN CHOWK MUZAFFARPUR HANUMAN MANDIR BIHAR 843119', 'Naveen Kumar', '', '204969');
INSERT INTO `cock_consignment` VALUES ('156', '114422', '2019-03-15', '11', '1', 'SILIGURI', '6', 'FATAPUKUR', '', 'DARBHANGA', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'MAA ENTERPRISES BAHERI', '4', 'HCV.20', '109', 'BR01GC2460', '674938.78', '0', '2019-03-25 18:27:07', '2019-03-27 15:46:12', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'RAM NAGAR DEVKULIBAHERI DIST DARBHANGA  BIHAR 847105', 'Naveen Kumar', '', '204848');
INSERT INTO `cock_consignment` VALUES ('157', '114423', '2019-03-15', '11', '', 'SILIGURI', '6', 'FATAPUKUR', '', 'BETTIAH', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'K D FOODS', '2', 'HCV.16', '147', 'HP12F9277', '641586.89', '0', '2019-03-25 19:07:02', '2019-04-03 06:52:23', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'TEEN LALTEN CHOWK NEAR MEDICAL COLLEGE BETTAIH BIHAR 845438', 'Naveen Kumar', '', '202560');
INSERT INTO `cock_consignment` VALUES ('158', '114424', '2019-03-16', '11', '', 'SILIGURI', '6', 'FATAPUKUR', '', 'DARBHANGA', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'SUDHA MILK PARLOUR', '4', 'HCV.20', '111', 'PB19F4975', '699100.38', '0', '2019-03-25 19:10:43', '2019-03-25 19:10:43', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'ALIKNAGAR ROAD PO PS BAHERA ASHPURNEAR TOWER DARBHANGA BIHAR 847201', 'Naveen Kumar', '', '204970');
INSERT INTO `cock_consignment` VALUES ('159', '114425', '2019-03-16', '11', '1', 'SILIGURI', '6', 'FATAPUKUR', '', 'BETTIAH', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'SIKARIA TREADRS', '', 'HCV.16', '112', 'PB32H7054', '513002.28', '0', '2019-03-25 19:14:14', '2019-03-25 19:14:14', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'LAL BAZAR BETTAIH BIHAR 845438', 'Naveen Kumar', '', '203009');
INSERT INTO `cock_consignment` VALUES ('160', '114426', '2019-03-16', '11', '1', 'SILIGURI', '6', 'FATAPUKUR', '', 'MADHUBANI', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'ASHA DISTRIBUTORS', '2', 'HCV.16', '113', 'WB73E5575', '495883.2', '0', '2019-03-25 19:17:40', '2019-03-25 19:17:40', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'KHUTAUNA BAZAR NEAR MOTI CINEMA MADHUBANI BIHAR 847227', 'Naveen Kumar', '', '194016');
INSERT INTO `cock_consignment` VALUES ('161', '114427', '2019-03-16', '11', '', 'SILIGURI', '', 'FATAPUKUR', '', 'BHAGALPUR', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'GAURAV ENTERPRISE BARAHAT', '', 'HCV.16', '114', 'WB39A7167', '563117.16', '0', '2019-03-25 19:24:26', '2019-04-03 06:52:23', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'BARAHAT PO ISHIPURNEAR UCO BANK BHAGALPUR BIHAR 813206', 'Naveen Kumar', '', '204845');
INSERT INTO `cock_consignment` VALUES ('162', '114428', '2019-03-16', '11', '1', 'SILIGURI', '6', 'FATAPUKUR', '', 'PATNA', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'SHREE KRISHNA ENTERPRISES', '2', 'HCV.16', '115', 'PB06M9951', '525578.68', '0', '2019-03-25 19:33:33', '2019-03-25 19:33:33', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'KULHARIA HOUSEASHOK RAJPATHAKILPUR PATNA BIHAR 800012', 'Naveen Kumar', '', '204847');
INSERT INTO `cock_consignment` VALUES ('163', '114429', '2019-03-16', '11', '1', 'SILIGURI', '', 'FATAPUKUR', '', 'PATNA', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'SHREE KRISHNA ENTERPRISES', '2', 'HCV.16', '116', 'PB06L9451', '564801.08', '0', '2019-03-25 19:37:15', '2019-03-25 19:37:15', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'KULHARIA HOUSEASHOK RAJPATHAKILPUR PATNA BIHAR 800012', 'Naveen Kumar', '', '204846');
INSERT INTO `cock_consignment` VALUES ('164', '114430', '2019-03-16', '11', '1', 'SILIGURI', '6', 'FATAPUKUR', '', 'MUZAFFARPUR', '2', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', '4', 'HCV.20', '117', 'RJ19GB6356', '461700', '0', '2019-03-25 19:41:17', '2019-03-25 19:41:17', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'BHIKAMPUR BEHIND IT MEMORAIL HOSPATAIL MUZAFFARPUR BIHAR 842004', 'Naveen Kumar', '', '197743');
INSERT INTO `cock_consignment` VALUES ('165', '114431', '2019-03-16', '11', '1', 'SILIGURI', '6', 'FATAPUKUR', '', 'ARARIA', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'AMIT PAN MASALA STORES', '4', 'HCV.20', '118', 'UP12AT2319', '787605.12', '0', '2019-03-25 19:46:41', '2019-03-25 19:46:41', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'KIRAN MEDICAL JOKIHAT ARARIA BIHAR 854329', 'Naveen Kumar', '', '204844');
INSERT INTO `cock_consignment` VALUES ('166', '114432', '2019-03-16', '11', '', 'SILIGURI', '6', 'FATAPUKUR', '', 'MUZAFFARPUR', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', '4', 'HCV.20', '119', 'RJ19GF2877', '600985', '0', '2019-03-25 19:51:19', '2019-03-25 19:51:19', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'BHIKAMPUR BEHIND IT MEMORAIL HOSPATAIL MUZAFFARPUR BIHAR 842004', 'Naveen Kumar', '', '197744');
INSERT INTO `cock_consignment` VALUES ('167', '114433', '2018-03-16', '11', '1', 'SILIGURI', '6', 'FATAPUKUR', '', 'ASANSOL', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', '', 'HCV.16', '120', 'NL02L0892', '258400', '0', '2019-03-25 19:55:03', '2019-03-25 19:55:03', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'RANI SATI WAREHOUSE LOGISTIC BARDHAMAN ASANSOL WEST BENGAL 713383', 'Naveen Kumar', '', '197755');
INSERT INTO `cock_consignment` VALUES ('168', '114456', '2019-03-19', '11', '1', 'SILIGURI', '6', 'FATAPUKUR', '', 'JAMUI', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'SRI RADHE RADHE ENTERPRISES ', '2', 'HCV.16', '146', 'AP29TB2329', '639334.92', '0', '2019-03-25 19:58:18', '2019-03-25 19:58:18', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'MALLEPUR JHAJHA ROAD JAMUI BIHAR 811307', 'Naveen Kumar', '', '221593');
INSERT INTO `cock_consignment` VALUES ('169', '114457', '2019-03-19', '11', '1', 'SILIGURI', '6', 'FATAPUKUR', '', 'DARBHANGA', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'MAA ENTERPRISE BAHERI', '4', 'HCV.20', '148', 'UP14ET5897', '657420.16', '0', '2019-03-25 20:02:06', '2019-03-25 20:02:06', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'RAM NAGAR DARBHANGA BIHAR 847105', 'Naveen Kumar', '', '221594');
INSERT INTO `cock_consignment` VALUES ('170', '114459', '2019-03-19', '11', '1', 'SILIGURI', '6', 'FATAPUKUR', '', 'KURSEON', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'SHREE KRISHNA AGENACY', '1', 'LCV.6', '14', 'WB73B6290', '150266.02', '0', '2019-03-25 20:06:17', '2019-03-25 20:06:17', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'NEAR KURSEON RAILWAY STATION GUDRI BAZAR KURSEON WEST BENGAL 734202', 'Naveen Kumar', '67909', '218863');
INSERT INTO `cock_consignment` VALUES ('171', '114458', '2019-03-19', '11', '1', 'SILIGURI', '6', 'FATAPUKUR', '', 'NAWADA', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'KAVITANJALI ENTERPRISES', '4', 'HCV.20', '150', 'UP63T8909', '865974.32', '0', '2019-03-26 19:09:43', '2019-03-26 19:09:43', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'SHOP NO - 284 THANA ROAD  NAWADA AT DISTRICT BOARD COMPLEX NAWADA BIHAR 805110', 'Naveen Kumar', '', '220126');
INSERT INTO `cock_consignment` VALUES ('173', '114474', '2019-03-24', '11', '', 'SILIGURI', null, 'FATAPUKUR', null, 'BETTIAH', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'K D FOODS', '', 'HCV.16', '151', 'UP63T3911', '561409.01', '0', '2019-03-30 13:15:18', '2019-03-30 13:15:18', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'TEEN LALTEN CHOWK GULAB BAGH ROAD NEAR MEDICAL COLLAGE BETTIAH BIHAR 845438', 'Naveen Kumar', '', '242361');
INSERT INTO `cock_consignment` VALUES ('174', '114475', '2019-03-24', '11', '', 'SILIGURI', '', 'FATAPUKUR', '', 'MUZAFFARPUR', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'CHANDRMA & SAKUNTALA ENT', null, 'HCV.16', '152', 'RJ02GB7925', '671551.16', '0', '2019-03-30 13:21:44', '2019-04-03 06:30:08', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'MARKAN CHOWK MUZAFFARPUR, HANUMAN MANDIR MARKAN BIHAR 843119', 'Naveen Kumar', '', '242362');
INSERT INTO `cock_consignment` VALUES ('175', '114476', '2019-03-25', '11', '', 'SILIGURI', null, 'FATAPUKUR', null, 'DARJEELING', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'HIMALAYA AGENCIES', '', 'LCV.6', '6', 'WB73B7316', '131864.99', '0', '2019-03-30 13:31:48', '2019-03-30 13:31:48', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', '1ST FLOOR 5A NEHRU ROADCHOWRASTA, DARJEELING, WEST BENGAL 734101', 'Naveen Kumar', '', '238439');
INSERT INTO `cock_consignment` VALUES ('176', '114477', '2019-03-25', '11', '', 'SILIGURI', null, 'FATAPUKUR', null, 'HARIRAMPUR', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'GOPAL PRASAD GUPTA', '', 'LCV.6', '153', 'WB51A8539', '422794.3', '0', '2019-03-30 13:45:07', '2019-03-30 13:45:07', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'HARIRAMPUR DAKSHIN DINAJPUR GANGARAMPUR WEST BENGAL 733125', 'Naveen Kumar', '', '244044');
INSERT INTO `cock_consignment` VALUES ('177', '114548', '2019-03-31', '11', '', 'SILIGURI', null, 'FATAPUKUR', null, 'BHOJPUR', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'VAISHNAVI ENTERPRISES', '', 'HCV.20', '209', 'UP65FT8318', '757177.12', '0', '2019-03-31 19:11:14', '2019-03-31 19:11:14', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'GARHANI BAZAR NEAR STATE BANK BHOJPUR BIHAR 802301', 'Naveen Kumar', '', '268187');
INSERT INTO `cock_consignment` VALUES ('178', '114549', '2019-03-31', '11', '', 'SILIGURI', null, 'FATAPUKUR', null, 'BETTIAH', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'K D FOODS', '', 'HCV.20', '208', 'RJ19GF9785', '770695.98', '0', '2019-03-31 19:15:28', '2019-03-31 19:15:28', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'TEEN LALTEN CHOWK GULAB BAGH ROADNEAR MEDICAL COLLEGE BETTIAH BIHAR 845438', 'Naveen Kumar', '', '270079');
INSERT INTO `cock_consignment` VALUES ('179', '114550', '2019-03-31', '11', '', 'SILIGURI', null, 'FATAPUKUR', null, 'BEGUSARAI', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'RANJAN KUMAR', '', 'HCV.20', '210', 'PB12Q2897', '630360', '0', '2019-04-01 08:25:37', '2019-04-01 08:25:37', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'BAKHRI ROAD MANJHAUL BEGUSARAI BIHAR 851127', 'Naveen Kumar', '', '270078');
INSERT INTO `cock_consignment` VALUES ('180', '114551', '2019-04-01', '11', '', 'SILIGURI', null, 'FATAPUKUR', null, 'MIRIK', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'GAYTRI STORES', null, 'LCV.6', '14', 'WB73B6290', '45494.28', '0', '2019-04-01 16:56:47', '2019-04-16 10:09:09', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'THANA LINE WORD MIRIK SILIGURI WEST BENGAL ', 'Naveen Kumar', '83061', '273298');
INSERT INTO `cock_consignment` VALUES ('181', '273370', '2019-04-01', '11', '', 'SILIGURI', null, 'FATAPUKUR', null, 'KATSA', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'MUSKAN ENTERPRISES', null, 'HCV.20', '211', 'MP20HB9887', '637364', '0', '2019-04-01 18:59:36', '2019-04-01 18:59:36', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'KATSA CHOWK AMNAUR SARAN MARHAURA BIHAR 841311', 'Naveen Kumar', '', '273370');
INSERT INTO `cock_consignment` VALUES ('182', '114553', '2019-04-01', '11', '', 'SILIGURI', null, 'FATAPUKUR', null, 'DARJEELING', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'HIMALAYA AGENCIES', null, 'LCV.6', '6', 'WB73B7316', '163262.85', '0', '2019-04-01 20:58:53', '2019-04-01 20:58:53', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', '1ST FLOOR 5A NEHRU ROADCHOWRASTA DARJEELING WEDT BENGAL 734101', 'Naveen Kumar', '', '272541');
INSERT INTO `cock_consignment` VALUES ('183', '118905', '2019-04-10', '44', '', 'SILIGURI', null, 'SILIGURI', null, '73', '', 'ITC LIMITED -EDUCATION & STATIONERY', 'Jaosn', null, 'LCV.6', '2', 'WB67A3151', '10000', '0', '2019-04-10 04:32:04', '2019-04-10 04:32:04', 'C/o Super Treads Private Limited, 14P, Dabgarm, Indl Growth Centre, Satellite Township, Fulbari Siliguri, West Bengal 734015', 'asjdhjaskdhkajsdhajksdhjk', 'Prince', '', '123456');
INSERT INTO `cock_consignment` VALUES ('184', '118510', '2019-04-10', '44', '', 'SILIGURI', null, 'tyeytywuyt', null, 'tyeytywuyt', '', 'ITC LIMITED -EDUCATION & STATIONERY', 'asdnasdkgash', null, 'LCV.6', '1', 'WB59B3513', '10000', '0', '2019-04-10 04:36:33', '2019-04-10 04:36:33', 'C/o Super Treads Private Limited, 14P, Dabgarm, Indl Growth Centre, Satellite Township, Fulbari Siliguri, West Bengal 734015', 'jhgasdfasfdaghsdfgh', 'Prince', '', '2135464');

-- ----------------------------
-- Table structure for `cock_consignment_child`
-- ----------------------------
DROP TABLE IF EXISTS `cock_consignment_child`;
CREATE TABLE `cock_consignment_child` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `consignment_id` int(10) DEFAULT NULL,
  `invoice_no` varchar(255) DEFAULT NULL,
  `invoice_date` date DEFAULT NULL,
  `invoice_value` varchar(255) DEFAULT NULL,
  `way_bill_no` varchar(100) DEFAULT NULL,
  `validity` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=260 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of cock_consignment_child
-- ----------------------------
INSERT INTO `cock_consignment_child` VALUES ('1', '2', 'Invoice12345', '2019-03-05', '10000', 'Waybill123', '2019-03-10', '2019-03-06 17:02:54', '2019-03-06 17:02:54');
INSERT INTO `cock_consignment_child` VALUES ('10', '5', '7063064100', '2019-03-03', '0000', '841041460992', '2019-03-12', '2019-03-07 15:50:25', '2019-03-07 15:50:25');
INSERT INTO `cock_consignment_child` VALUES ('13', '7', '7063064138', '2019-03-05', '680364', '881041771502', '2019-03-14', '2019-03-07 16:14:46', '2019-03-07 16:14:46');
INSERT INTO `cock_consignment_child` VALUES ('14', '8', '7063064148', '2019-03-06', '0000', '801041785880', '2019-03-11', '2019-03-07 16:25:10', '2019-03-07 16:25:10');
INSERT INTO `cock_consignment_child` VALUES ('15', '9', '7063064137', '2019-03-05', '619704', '811041771501', '2019-03-14', '2019-03-07 16:32:38', '2019-03-07 16:32:38');
INSERT INTO `cock_consignment_child` VALUES ('16', '10', '7063064140', '2019-03-05', '000', '891041776795', '2019-03-14', '2019-03-07 16:40:18', '2019-03-07 16:40:18');
INSERT INTO `cock_consignment_child` VALUES ('17', '6', '7063064128', '2019-03-05', '177472.57', '851041688175', '2019-03-07', '2019-03-08 10:34:55', '2019-03-08 10:34:55');
INSERT INTO `cock_consignment_child` VALUES ('19', '12', '7128237425', '2019-03-06', '648004', '891042013422', '2019-03-13', '2019-03-08 13:09:39', '2019-03-08 13:09:39');
INSERT INTO `cock_consignment_child` VALUES ('21', '13', '7128237424', '2019-03-07', '478768', '821042013421', '2019-03-13', '2019-03-08 13:25:51', '2019-03-08 13:25:51');
INSERT INTO `cock_consignment_child` VALUES ('22', '14', '7063064206', '2019-03-07', '525754.98', '861042074462', '2019-03-14', '2019-03-08 13:34:13', '2019-03-08 13:34:13');
INSERT INTO `cock_consignment_child` VALUES ('23', '15', '7063064162', '2019-03-06', '156621.60', '871041918700', '2019-03-08', '2019-03-08 13:41:11', '2019-03-08 13:41:11');
INSERT INTO `cock_consignment_child` VALUES ('24', '16', '7063064174', '2019-03-06', '573202.86', '831041942640', '2019-03-14', '2019-03-08 14:33:03', '2019-03-08 14:33:03');
INSERT INTO `cock_consignment_child` VALUES ('25', '17', '7063064175', '2019-03-06', '510018.01', '871041942642', '2019-03-14', '2019-03-08 14:38:38', '2019-03-08 14:38:38');
INSERT INTO `cock_consignment_child` VALUES ('26', '18', '7063064178', '2019-03-06', '351530.40', '811041942644', '2019-03-12', '2019-03-08 14:44:23', '2019-03-08 14:44:23');
INSERT INTO `cock_consignment_child` VALUES ('27', '18', '7063064177', '2019-03-06', '150556.89', '8811041942045', '2019-03-12', '2019-03-08 14:44:23', '2019-03-08 14:44:23');
INSERT INTO `cock_consignment_child` VALUES ('28', '19', '7063064212', '2019-03-07', '465655.59', '871042105202', '2019-03-14', '2019-03-08 15:11:11', '2019-03-08 15:11:11');
INSERT INTO `cock_consignment_child` VALUES ('29', '20', '7063064207', '2019-03-07', '493289.28', '871042083656', '2019-03-15', '2019-03-08 15:15:12', '2019-03-08 15:15:12');
INSERT INTO `cock_consignment_child` VALUES ('30', '21', '7063064150', '2019-03-06', '691704', '891041822308', '2019-03-12', '2019-03-08 15:17:48', '2019-03-08 15:17:48');
INSERT INTO `cock_consignment_child` VALUES ('31', '22', '7063064183', '2019-03-07', '371841.96', '891041950050', '2019-03-11', '2019-03-08 15:22:11', '2019-03-08 15:22:11');
INSERT INTO `cock_consignment_child` VALUES ('32', '23', '7063064184', '2019-03-07', '600650.83', '871041950207', '2019-03-14', '2019-03-08 15:27:47', '2019-03-08 15:27:47');
INSERT INTO `cock_consignment_child` VALUES ('34', '24', '7063064196', '2019-03-07', '168229.11', '881042023796', '2019-03-09', '2019-03-08 15:47:49', '2019-03-08 15:47:49');
INSERT INTO `cock_consignment_child` VALUES ('35', '25', '7063064221', '2019-03-08', '463182.80', '871042177962', '2019-03-15', '2019-03-09 11:03:42', '2019-03-09 11:03:42');
INSERT INTO `cock_consignment_child` VALUES ('38', '26', '7105655689', '2019-03-08', '404600.00', '891042176457', '2019-03-14', '2019-03-09 11:26:56', '2019-03-09 11:26:56');
INSERT INTO `cock_consignment_child` VALUES ('40', '28', '7063064235', '2019-03-08', '124689.63', '871042245102', '2019-03-10', '2019-03-09 11:48:38', '2019-03-09 11:48:38');
INSERT INTO `cock_consignment_child` VALUES ('42', '30', '7063064250', '2019-03-09', '470668.80', '871042274685', '2019-03-16', '2019-03-09 12:00:20', '2019-03-09 12:00:20');
INSERT INTO `cock_consignment_child` VALUES ('43', '31', '7128237581', '2019-03-10', '415681.08', '821042459146', '2019-03-16', '2019-03-11 19:31:35', '2019-03-11 19:31:35');
INSERT INTO `cock_consignment_child` VALUES ('50', '27', '7063064231', '2019-03-08', '523620.78', '881042219379', '2019-03-14', '2019-03-13 18:48:48', '2019-03-13 18:48:48');
INSERT INTO `cock_consignment_child` VALUES ('51', '29', '7063064234', '2019-03-08', '196101.88', '801042245101', '2019-03-10', '2019-03-13 18:52:10', '2019-03-13 18:52:10');
INSERT INTO `cock_consignment_child` VALUES ('52', '38', '7063064258', '2019-03-09', '500926.08', '801042337677', '2019-03-15', '2019-03-13 19:22:51', '2019-03-13 19:22:51');
INSERT INTO `cock_consignment_child` VALUES ('53', '39', '7063064268', '2019-03-09', '591032.30', '831042419705', '2019-03-16', '2019-03-13 19:32:44', '2019-03-13 19:32:44');
INSERT INTO `cock_consignment_child` VALUES ('54', '40', '7063064276', '2019-03-10', '470668.80', '871042432168', '2019-03-16', '2019-03-13 21:06:08', '2019-03-13 21:06:08');
INSERT INTO `cock_consignment_child` VALUES ('55', '41', '7128237551', '2019-03-10', '558600', '841042432169', '2019-03-16', '2019-03-13 21:09:27', '2019-03-13 21:09:27');
INSERT INTO `cock_consignment_child` VALUES ('56', '42', '7128237552', '2019-03-10', '558600', '801042432170', '2019-03-16', '2019-03-13 21:11:56', '2019-03-13 21:11:56');
INSERT INTO `cock_consignment_child` VALUES ('57', '37', '7063064288', '2019-03-10', '567374.90', '881042476747', '2019-03-18', '2019-03-13 21:16:32', '2019-03-13 21:16:32');
INSERT INTO `cock_consignment_child` VALUES ('58', '43', '7128237581', '2019-03-10', '0000', '821042459146', '2019-03-16', '2019-03-13 21:21:35', '2019-03-13 21:21:35');
INSERT INTO `cock_consignment_child` VALUES ('59', '32', '7063064287', '2019-03-10', '588647.04', '841042476745', '2019-03-17', '2019-03-13 21:22:31', '2019-03-13 21:22:31');
INSERT INTO `cock_consignment_child` VALUES ('60', '33', '7063064291', '2019-03-10', '593700.88', '891042485209', '2019-03-17', '2019-03-13 21:23:18', '2019-03-13 21:23:18');
INSERT INTO `cock_consignment_child` VALUES ('61', '34', '7063064293', '2019-03-10', '602628.12', '851042490058', '2019-03-19', '2019-03-13 21:24:03', '2019-03-13 21:24:03');
INSERT INTO `cock_consignment_child` VALUES ('62', '35', '7063064294', '2019-03-10', '606552.92', '821042490059', '2019-03-18', '2019-03-13 21:24:46', '2019-03-13 21:24:46');
INSERT INTO `cock_consignment_child` VALUES ('63', '36', '7063064292', '2019-03-10', '415681.08', '871042486459', '2019-03-14', '2019-03-13 21:25:14', '2019-03-13 21:25:14');
INSERT INTO `cock_consignment_child` VALUES ('64', '44', '7063064300', '2019-03-11', '133801', '811042556882', '2019-03-13', '2019-03-13 21:27:24', '2019-03-13 21:27:24');
INSERT INTO `cock_consignment_child` VALUES ('65', '45', '7063064303', '2019-03-11', '153945.25', '881042580275', '2019-03-13', '2019-03-13 21:31:44', '2019-03-13 21:31:44');
INSERT INTO `cock_consignment_child` VALUES ('66', '46', '7105655708', '2019-03-08', '335600', '821042267842', '2019-03-14', '2019-03-13 21:37:07', '2019-03-13 21:37:07');
INSERT INTO `cock_consignment_child` VALUES ('67', '47', '7063064225', '2019-03-08', '29203.20', '', '2019-03-10', '2019-03-14 09:47:48', '2019-03-14 09:47:48');
INSERT INTO `cock_consignment_child` VALUES ('68', '48', '7128237635', '2019-03-11', '558600', '891042580281', '2019-03-17', '2019-03-14 17:08:50', '2019-03-14 17:08:50');
INSERT INTO `cock_consignment_child` VALUES ('69', '49', '7063064298', '2019-03-11', '577428.12', '851042548104', '2019-03-19', '2019-03-14 17:13:03', '2019-03-14 17:13:03');
INSERT INTO `cock_consignment_child` VALUES ('70', '50', '7128237649', '2019-03-11', '645152.50', '821042644940', '2019-03-17', '2019-03-14 17:17:32', '2019-03-14 17:17:32');
INSERT INTO `cock_consignment_child` VALUES ('71', '51', '7128237650', '2019-03-11', '645152.50', '891042644941', '2019-03-17', '2019-03-14 17:26:27', '2019-03-14 17:26:27');
INSERT INTO `cock_consignment_child` VALUES ('72', '52', '7063064347', '2019-03-12', '137385.16', '831042796992', '2019-03-14', '2019-03-14 17:32:06', '2019-03-14 17:32:06');
INSERT INTO `cock_consignment_child` VALUES ('73', '53', '7063064318', '2019-03-12', '165386.17', '851042729163', '2019-03-14', '2019-03-14 17:34:28', '2019-03-14 17:34:28');
INSERT INTO `cock_consignment_child` VALUES ('74', '54', '7063064332', '2019-03-12', '427484.80', '821042729177', '2019-03-19', '2019-03-14 17:38:52', '2019-03-14 17:38:52');
INSERT INTO `cock_consignment_child` VALUES ('75', '55', '7128237674', '2019-03-12', '533960', '861042656468', '2019-03-18', '2019-03-14 17:42:54', '2019-03-14 17:42:54');
INSERT INTO `cock_consignment_child` VALUES ('76', '56', '7063064352', '2019-03-12', '575075.08', '871042796994', '2019-03-19', '2019-03-14 17:57:41', '2019-03-14 17:57:41');
INSERT INTO `cock_consignment_child` VALUES ('78', '58', '7128237690', '2019-03-12', '511700', '881042816589', '2019-03-18', '2019-03-14 18:05:25', '2019-03-14 18:05:25');
INSERT INTO `cock_consignment_child` VALUES ('79', '59', '7063064325', '2019-03-12', '534289.95', '831042729170', '2019-03-18', '2019-03-14 18:35:32', '2019-03-14 18:35:32');
INSERT INTO `cock_consignment_child` VALUES ('80', '60', '7063064346', '2019-03-12', '649960.47', '881042762505', '2019-03-19', '2019-03-14 18:42:23', '2019-03-14 18:42:23');
INSERT INTO `cock_consignment_child` VALUES ('81', '61', '7063064331', '2019-03-12', '592457.82', '851042729176', '2019-03-19', '2019-03-14 19:01:01', '2019-03-14 19:01:01');
INSERT INTO `cock_consignment_child` VALUES ('82', '62', '7063064356', '2019-03-12', '459182.40', '851042796998', '2019-03-19', '2019-03-14 19:04:36', '2019-03-14 19:04:36');
INSERT INTO `cock_consignment_child` VALUES ('86', '66', '7063064374', '2019-03-13', '589058.04', '811042826785', '2019-03-18', '2019-03-14 19:21:09', '2019-03-14 19:21:09');
INSERT INTO `cock_consignment_child` VALUES ('91', '71', '7063064380', '2019-03-13', '148884.77', '841042878475', '2019-03-15', '2019-03-15 13:41:21', '2019-03-15 13:41:21');
INSERT INTO `cock_consignment_child` VALUES ('93', '57', '7063064359', '2019-03-12', '000', '801042809543', '2019-03-20', '2019-03-15 16:23:35', '2019-03-15 16:23:35');
INSERT INTO `cock_consignment_child` VALUES ('94', '11', '7063064169', '2019-03-06', '136257.97', '891041918706', '2019-03-08', '2019-03-15 16:27:14', '2019-03-15 16:27:14');
INSERT INTO `cock_consignment_child` VALUES ('95', '67', '7063064379', '2019-03-13', '553895.51', '821042865314', '2019-03-19', '2019-03-15 16:55:43', '2019-03-15 16:55:43');
INSERT INTO `cock_consignment_child` VALUES ('96', '68', '7063064377', '2019-03-13', '510773.55', '881042865312', '2019-03-22', '2019-03-15 16:56:57', '2019-03-15 16:56:57');
INSERT INTO `cock_consignment_child` VALUES ('97', '69', '7063064376', '2019-03-13', '428484', '811042865311', '2019-03-20', '2019-03-15 16:58:13', '2019-03-15 16:58:13');
INSERT INTO `cock_consignment_child` VALUES ('98', '70', '7063064372', '2019-03-13', '530434.17', '831042869067', '2019-03-21', '2019-03-15 16:58:52', '2019-03-15 16:58:52');
INSERT INTO `cock_consignment_child` VALUES ('99', '72', '7063064380', '2019-03-13', '148884.77', '841042878475', '2019-03-15', '2019-03-15 17:01:50', '2019-03-15 17:01:50');
INSERT INTO `cock_consignment_child` VALUES ('100', '73', '7063064384', '2019-03-13', '175329.36', '891042887728', '2019-03-15', '2019-03-15 17:05:26', '2019-03-15 17:05:26');
INSERT INTO `cock_consignment_child` VALUES ('101', '74', '7063064381', '2019-03-12', '569328.48', '811042878476', '2019-03-18', '2019-03-15 17:19:46', '2019-03-15 17:19:46');
INSERT INTO `cock_consignment_child` VALUES ('102', '75', '7063064396', '2019-03-13', '164310.51', '871042950420', '2019-03-15', '2019-03-15 17:21:48', '2019-03-15 17:21:48');
INSERT INTO `cock_consignment_child` VALUES ('103', '76', '7063064383', '2019-03-13', '541747.67', '851042878478', '2019-03-18', '2019-03-15 17:24:46', '2019-03-15 17:24:46');
INSERT INTO `cock_consignment_child` VALUES ('104', '77', '7063064398', '2019-03-13', '495883.20', '811042950422', '2019-03-20', '2019-03-15 17:33:13', '2019-03-15 17:33:13');
INSERT INTO `cock_consignment_child` VALUES ('105', '78', '7063064409', '2019-03-13', '689043.48', '871042981532', '2019-03-17', '2019-03-15 17:55:04', '2019-03-15 17:55:04');
INSERT INTO `cock_consignment_child` VALUES ('106', '79', '7063064429', '2019-03-14', '480904.98', '881042991831', '2019-03-18', '2019-03-15 18:08:18', '2019-03-15 18:08:18');
INSERT INTO `cock_consignment_child` VALUES ('107', '80', '7063064434', '2019-03-14', '657431.28', '821042992836', '2019-03-19', '2019-03-15 18:27:29', '2019-03-15 18:27:29');
INSERT INTO `cock_consignment_child` VALUES ('108', '81', '7063064427', '2019-03-14', '503787.06', '851042991829', '2019-03-21', '2019-03-15 18:30:47', '2019-03-15 18:30:47');
INSERT INTO `cock_consignment_child` VALUES ('109', '82', '7063064382', '2019-03-13', '536612.58', '881042878477', '2019-03-21', '2019-03-15 18:46:06', '2019-03-15 18:46:06');
INSERT INTO `cock_consignment_child` VALUES ('110', '83', '7063064400', '2019-03-13', '578991.66', '851042950424', '2019-03-20', '2019-03-15 18:49:11', '2019-03-15 18:49:11');
INSERT INTO `cock_consignment_child` VALUES ('111', '84', '7063064378', '2019-03-13', '522020.55', '851042865313', '2019-03-18', '2019-03-15 19:16:24', '2019-03-15 19:16:24');
INSERT INTO `cock_consignment_child` VALUES ('117', '90', '7063064663', '2019-03-18', '175904.86', '801043675026', '2019-03-20', '2019-03-25 15:58:31', '2019-03-25 15:58:31');
INSERT INTO `cock_consignment_child` VALUES ('118', '91', '7063064662', '2019-03-18', '164915.68', '831043675025', '2019-03-20', '2019-03-25 16:00:13', '2019-03-25 16:00:13');
INSERT INTO `cock_consignment_child` VALUES ('120', '93', '7063064651', '2019-03-18', '779413.30', '811043570526', '2019-03-21', '2019-03-25 16:03:17', '2019-03-25 16:03:17');
INSERT INTO `cock_consignment_child` VALUES ('121', '94', '7063064695', '2019-03-19', '170717.01', '811043807862', '2019-03-21', '2019-03-25 16:05:38', '2019-03-25 16:05:38');
INSERT INTO `cock_consignment_child` VALUES ('122', '95', '7063064694', '2019-03-19', '240015.09', '841043807861', '2019-03-21', '2019-03-25 16:09:20', '2019-03-25 16:09:20');
INSERT INTO `cock_consignment_child` VALUES ('125', '98', '7128238174', '2019-03-20', '633780', '861043986773', '2019-03-20', '2019-03-25 16:21:06', '2019-03-25 16:21:06');
INSERT INTO `cock_consignment_child` VALUES ('126', '99', '7063064479', '2019-03-15', '564344.27', '831043157833', '2019-03-21', '2019-03-25 16:22:24', '2019-03-25 16:22:24');
INSERT INTO `cock_consignment_child` VALUES ('127', '100', '7063064747', '2019-03-20', '153204.97', '891043986772', '2019-03-22', '2019-03-25 16:22:40', '2019-03-25 16:22:40');
INSERT INTO `cock_consignment_child` VALUES ('128', '101', '7063064746', '2019-03-20', '156128.43', '821043986771', '2019-03-22', '2019-03-25 16:24:11', '2019-03-25 16:24:11');
INSERT INTO `cock_consignment_child` VALUES ('129', '102', '7128237791', '2019-03-14', '484120', '861043110343', '2019-03-21', '2019-03-25 16:25:29', '2019-03-25 16:25:29');
INSERT INTO `cock_consignment_child` VALUES ('130', '103', '7128238200', '2019-03-21', '481460', '821044063297', '2019-03-26', '2019-03-25 16:26:13', '2019-03-25 16:26:13');
INSERT INTO `cock_consignment_child` VALUES ('131', '104', '7063064787', '2019-03-21', '000', '', null, '2019-03-25 16:29:47', '2019-03-25 16:29:47');
INSERT INTO `cock_consignment_child` VALUES ('132', '105', '7063064486', '2019-03-15', '536612.58', '871043162206', '2019-03-23', '2019-03-25 16:30:33', '2019-03-25 16:30:33');
INSERT INTO `cock_consignment_child` VALUES ('133', '106', '7063064835', '2019-03-23', '126736.85', '841044205345', '2019-03-25', '2019-03-25 16:31:23', '2019-03-25 16:31:23');
INSERT INTO `cock_consignment_child` VALUES ('134', '107', '7063064834', '2019-03-23', '143109.48', '871044205344', '2019-03-24', '2019-03-25 16:33:40', '2019-03-25 16:33:40');
INSERT INTO `cock_consignment_child` VALUES ('135', '108', '7063064485', '2019-03-15', '57262.58', '891043161717', '2019-03-22', '2019-03-25 16:34:20', '2019-03-25 16:34:20');
INSERT INTO `cock_consignment_child` VALUES ('136', '109', '7063064849', '2019-03-23', '739615.14', '831044260705', '2019-03-23', '2019-03-25 16:36:18', '2019-03-25 16:36:18');
INSERT INTO `cock_consignment_child` VALUES ('137', '110', '7063064487', '2019-03-15', '671002.33', '831043162402', '2019-03-23', '2019-03-25 16:38:12', '2019-03-25 16:38:12');
INSERT INTO `cock_consignment_child` VALUES ('138', '111', '7063064853', '2019-03-23', '626157.60', '871044281120', '2019-04-01', '2019-03-25 16:39:15', '2019-03-25 16:39:15');
INSERT INTO `cock_consignment_child` VALUES ('139', '112', '7063064488', '2019-03-15', '553128.48', '841043162492', '2019-03-21', '2019-03-25 16:42:28', '2019-03-25 16:42:28');
INSERT INTO `cock_consignment_child` VALUES ('140', '113', '7063064878', '2019-03-23', '143223.58', '871044305347', '2019-03-25', '2019-03-25 16:42:49', '2019-03-25 16:42:49');
INSERT INTO `cock_consignment_child` VALUES ('143', '115', '7063064475', '2019-03-14', '481570.59', '861043157829', '2019-03-19', '2019-03-25 16:48:34', '2019-03-25 16:48:34');
INSERT INTO `cock_consignment_child` VALUES ('144', '116', '7063064900', '2019-03-24', '397878', '841044311387', '2019-03-30', '2019-03-25 16:49:05', '2019-03-25 16:49:05');
INSERT INTO `cock_consignment_child` VALUES ('145', '114', '7063064898', '2019-03-24', '34890.84', '811044311490', '2019-03-30', '2019-03-25 16:49:51', '2019-03-25 16:49:51');
INSERT INTO `cock_consignment_child` VALUES ('146', '114', '7063064897', '2019-03-24', '397878', '811044311490', '2019-03-30', '2019-03-25 16:49:51', '2019-03-25 16:49:51');
INSERT INTO `cock_consignment_child` VALUES ('147', '117', '7063064476', '2019-03-14', '595703.94', '821043157830', '2019-03-19', '2019-03-25 16:52:25', '2019-03-25 16:52:25');
INSERT INTO `cock_consignment_child` VALUES ('148', '118', '7063064904', '2019-03-24', '689656.38', '801044312403', '2019-03-30', '2019-03-25 16:54:07', '2019-03-25 16:54:07');
INSERT INTO `cock_consignment_child` VALUES ('149', '119', '7128237775', '2019-03-14', '484120.00', '831043040942', '2019-03-20', '2019-03-25 16:56:11', '2019-03-25 16:56:11');
INSERT INTO `cock_consignment_child` VALUES ('150', '120', '7063064908', '2019-03-24', '547564.80', '831044313645', '2019-03-29', '2019-03-25 16:56:59', '2019-03-25 16:56:59');
INSERT INTO `cock_consignment_child` VALUES ('151', '121', '7063064464', '2019-03-14', '647528.22', '861043153294', '2019-03-21', '2019-03-25 16:59:54', '2019-03-25 16:59:54');
INSERT INTO `cock_consignment_child` VALUES ('154', '123', '7063064574', '2019-03-16', '172768.39', '891043386659', '2019-03-18', '2019-03-25 17:01:59', '2019-03-25 17:01:59');
INSERT INTO `cock_consignment_child` VALUES ('155', '124', '7063064468', '2019-03-14', '419302.20', '841043153298', '2019-03-20', '2019-03-25 17:03:26', '2019-03-25 17:03:26');
INSERT INTO `cock_consignment_child` VALUES ('156', '125', '7063064571', '2019-03-16', '630360', '841043389372', '2019-03-23', '2019-03-25 17:04:58', '2019-03-25 17:04:58');
INSERT INTO `cock_consignment_child` VALUES ('157', '126', '7063064467', '2019-03-14', '465686.40', '871043153297', '2019-03-21', '2019-03-25 17:07:00', '2019-03-25 17:07:00');
INSERT INTO `cock_consignment_child` VALUES ('158', '127', '7063064615', '2019-03-17', '603333.12', '851043499319', '2019-03-23', '2019-03-25 17:07:31', '2019-03-25 17:07:31');
INSERT INTO `cock_consignment_child` VALUES ('159', '128', '7105656157', '2019-03-16', '381140', '851043398962', '2019-03-22', '2019-03-25 17:09:26', '2019-03-25 17:09:26');
INSERT INTO `cock_consignment_child` VALUES ('160', '129', '7063064585', '2019-03-16', '737896.29', '831043480432', '2019-03-24', '2019-03-25 17:11:52', '2019-03-25 17:11:52');
INSERT INTO `cock_consignment_child` VALUES ('161', '130', '7105656172', '2019-03-16', '275500', '891043478604', '2019-03-22', '2019-03-25 17:13:26', '2019-03-25 17:13:26');
INSERT INTO `cock_consignment_child` VALUES ('162', '131', '7063064495', '2019-03-15', '465125.35', '821043163527', '2019-03-23', '2019-03-25 17:14:17', '2019-03-25 17:14:17');
INSERT INTO `cock_consignment_child` VALUES ('163', '132', '7063064590', '2019-03-16', '600846.36', '881043480437', '2019-03-25', '2019-03-25 17:15:57', '2019-03-25 17:15:57');
INSERT INTO `cock_consignment_child` VALUES ('164', '133', '7128237805', '2019-03-15', '484120.00', '861043163529', '2019-03-21', '2019-03-25 17:17:56', '2019-03-25 17:17:56');
INSERT INTO `cock_consignment_child` VALUES ('167', '136', '7128237804', '2019-03-15', '484460.00', '891043163528', '2019-03-21', '2019-03-25 17:21:58', '2019-03-25 17:21:58');
INSERT INTO `cock_consignment_child` VALUES ('168', '137', '7063064598', '2019-03-16', '622138.28', '851043492040', '2019-03-23', '2019-03-25 17:23:34', '2019-03-25 17:23:34');
INSERT INTO `cock_consignment_child` VALUES ('169', '138', '7128237815', '2019-03-15', '543697.00', '821043165213', '2019-03-21', '2019-03-25 17:25:51', '2019-03-25 17:25:51');
INSERT INTO `cock_consignment_child` VALUES ('170', '139', '7128237944', '2019-03-17', '536795', '891043503597', '2019-03-23', '2019-03-25 17:25:57', '2019-03-25 17:25:57');
INSERT INTO `cock_consignment_child` VALUES ('171', '140', '7128237962', '2019-03-17', '481460', '821043550914', '2019-03-23', '2019-03-25 17:29:54', '2019-03-25 17:29:54');
INSERT INTO `cock_consignment_child` VALUES ('172', '141', '7128237814', '2019-03-15', '484120.00', '851043165212', '2019-03-21', '2019-03-25 17:30:13', '2019-03-25 17:30:13');
INSERT INTO `cock_consignment_child` VALUES ('173', '134', '7063064589', '2019-03-16', '704899.58', '811043480436', '2019-03-23', '2019-03-25 17:31:26', '2019-03-25 17:31:26');
INSERT INTO `cock_consignment_child` VALUES ('174', '142', '7128237943', '2019-03-17', '536795', '831043503560', '2019-03-23', '2019-03-25 17:33:48', '2019-03-25 17:33:48');
INSERT INTO `cock_consignment_child` VALUES ('175', '143', '7063064496', '2019-03-15', '695417.50', '851043177770', '2019-03-21', '2019-03-25 17:34:44', '2019-03-25 17:34:44');
INSERT INTO `cock_consignment_child` VALUES ('176', '144', '7128237977', '2019-03-17', '517160', '821043562469', '2019-03-22', '2019-03-25 17:35:56', '2019-03-25 17:35:56');
INSERT INTO `cock_consignment_child` VALUES ('177', '145', '7128237850', '2019-03-15', '556000.00', '841043226110', '2019-03-22', '2019-03-25 17:38:25', '2019-03-25 17:38:25');
INSERT INTO `cock_consignment_child` VALUES ('178', '146', '7063064634', '2019-03-17', '440564.10', '811043550911', '2019-03-25', '2019-03-25 17:39:19', '2019-03-25 17:39:19');
INSERT INTO `cock_consignment_child` VALUES ('179', '147', '7128237978', '2019-03-17', '502306', '881043562470', '2019-03-22', '2019-03-25 17:41:30', '2019-03-25 17:41:30');
INSERT INTO `cock_consignment_child` VALUES ('180', '148', '7128237830', '2019-03-15', '536795.00', '811043176676', '2019-03-21', '2019-03-25 17:42:18', '2019-03-25 17:42:18');
INSERT INTO `cock_consignment_child` VALUES ('181', '149', '7128237828', '2019-03-15', '594258.00', '871043176674', '2019-03-21', '2019-03-25 17:46:54', '2019-03-25 17:46:54');
INSERT INTO `cock_consignment_child` VALUES ('183', '151', '7063064514', '2019-03-15', '159704.91', '84104327770', '2019-03-17', '2019-03-25 17:57:08', '2019-03-25 17:57:08');
INSERT INTO `cock_consignment_child` VALUES ('184', '152', '7063064515', '2019-03-15', '149933.08', '811043277771', '2019-03-17', '2019-03-25 18:01:47', '2019-03-25 18:01:47');
INSERT INTO `cock_consignment_child` VALUES ('185', '153', '706306531', '2019-03-15', '439364.60', '841043298883', '2019-03-20', '2019-03-25 18:06:55', '2019-03-25 18:06:55');
INSERT INTO `cock_consignment_child` VALUES ('186', '154', '7063064521', '2019-03-15', '565563.30', '861043277776', '2019-03-22', '2019-03-25 18:11:23', '2019-03-25 18:11:23');
INSERT INTO `cock_consignment_child` VALUES ('187', '155', '7063064550', '2019-03-15', '810243.96', '831043326925', '2019-03-21', '2019-03-25 18:18:01', '2019-03-25 18:18:01');
INSERT INTO `cock_consignment_child` VALUES ('191', '158', '7063064556', '2019-03-16', '699100.38', '871043329814', '2019-03-21', '2019-03-25 19:10:43', '2019-03-25 19:10:43');
INSERT INTO `cock_consignment_child` VALUES ('192', '159', '7063064564', '2019-03-16', '513002.28', '891043329823', '2019-03-23', '2019-03-25 19:14:14', '2019-03-25 19:14:14');
INSERT INTO `cock_consignment_child` VALUES ('193', '160', '7063064569', '2019-03-16', '495883.20', '841043329828', '2019-03-20', '2019-03-25 19:17:40', '2019-03-25 19:17:40');
INSERT INTO `cock_consignment_child` VALUES ('194', '161', '7063064561', '2019-03-16', '563117.16', '821043329819', '2019-03-21', '2019-03-25 19:24:26', '2019-03-25 19:24:26');
INSERT INTO `cock_consignment_child` VALUES ('195', '162', '7063064559', '2019-03-16', '525578.68', '881043329817', '2019-03-22', '2019-03-25 19:33:33', '2019-03-25 19:33:33');
INSERT INTO `cock_consignment_child` VALUES ('196', '163', '7063064558', '2019-03-16', '564801.08', '811043329816', '2019-03-22', '2019-03-25 19:37:15', '2019-03-25 19:37:15');
INSERT INTO `cock_consignment_child` VALUES ('197', '164', '7128237890', '2019-03-16', '461700.00', '831043327604', '2019-03-23', '2019-03-25 19:41:17', '2019-03-25 19:41:17');
INSERT INTO `cock_consignment_child` VALUES ('198', '165', '7063064560', '2019-03-16', '787605.12', '851043329818', '2019-03-21', '2019-03-25 19:46:41', '2019-03-25 19:46:41');
INSERT INTO `cock_consignment_child` VALUES ('199', '166', '7128237872', '2019-03-16', '600985.00', '8210433436352', '2019-03-27', '2019-03-25 19:51:19', '2019-03-25 19:51:19');
INSERT INTO `cock_consignment_child` VALUES ('200', '167', '7105656141', '2018-03-16', '258400.00', '821043343632', '2019-03-27', '2019-03-25 19:55:03', '2019-03-25 19:55:03');
INSERT INTO `cock_consignment_child` VALUES ('201', '168', '7063064719', '2019-03-19', '639334.92', '871043876873', '2019-03-28', '2019-03-25 19:58:18', '2019-03-25 19:58:18');
INSERT INTO `cock_consignment_child` VALUES ('202', '169', '7063064727', '2019-03-19', '657420.16', '821043910035', '2019-03-27', '2019-03-25 20:02:06', '2019-03-25 20:02:06');
INSERT INTO `cock_consignment_child` VALUES ('203', '170', '7063064740', '2019-03-19', '150266.02', '811043917484', '2019-03-22', '2019-03-25 20:06:17', '2019-03-25 20:06:17');
INSERT INTO `cock_consignment_child` VALUES ('204', '85', '7063064439', '2019-03-14', '141005.41', '891043074048', '2019-03-16', '2019-03-26 15:34:20', '2019-03-26 15:34:20');
INSERT INTO `cock_consignment_child` VALUES ('205', '86', '7128237774', '2019-03-14', '844120', '861043040941', '2019-03-20', '2019-03-26 15:35:39', '2019-03-26 15:35:39');
INSERT INTO `cock_consignment_child` VALUES ('206', '87', '7128237790', '2019-03-14', '492120.00', '871043091801', '2019-03-21', '2019-03-26 15:37:33', '2019-03-26 15:37:33');
INSERT INTO `cock_consignment_child` VALUES ('207', '88', '7063064453', '2019-03-14', '512013.40', '841043130754', '2019-03-20', '2019-03-26 15:49:14', '2019-03-26 15:49:14');
INSERT INTO `cock_consignment_child` VALUES ('208', '89', '7063064484', '2019-03-15', '465125.35', '821043161716', '2019-03-20', '2019-03-26 15:52:42', '2019-03-26 15:52:42');
INSERT INTO `cock_consignment_child` VALUES ('209', '92', '7063064477', '2019-03-14', '580011.64', '891043157831', '2019-03-21', '2019-03-26 15:54:19', '2019-03-26 15:54:19');
INSERT INTO `cock_consignment_child` VALUES ('210', '96', '7063064480', '2019-03-15', '580031.64', '871043157835', '2019-03-21', '2019-03-26 15:58:47', '2019-03-26 15:58:47');
INSERT INTO `cock_consignment_child` VALUES ('211', '97', '7063064489', '2019-03-15', '7063064489', '851043162552', '2019-03-22', '2019-03-26 16:00:20', '2019-03-26 16:00:20');
INSERT INTO `cock_consignment_child` VALUES ('212', '122', '7063064578', '2019-03-16', '132550.41', '871043387164', '2019-03-19', '2019-03-26 17:13:08', '2019-03-26 17:13:08');
INSERT INTO `cock_consignment_child` VALUES ('213', '122', '7063064577', '2019-03-16', '26784', '', '2019-03-19', '2019-03-26 17:13:08', '2019-03-26 17:13:08');
INSERT INTO `cock_consignment_child` VALUES ('214', '171', '7063064718', '2019-03-19', '865974.32', '831043876871', '2019-03-27', '2019-03-26 19:09:43', '2019-03-26 19:09:43');
INSERT INTO `cock_consignment_child` VALUES ('215', '172', '7063065067', '2019-03-26', '702008.66', '881044674266', '2019-04-03', '2019-03-27 12:13:27', '2019-03-27 12:13:27');
INSERT INTO `cock_consignment_child` VALUES ('216', '150', '7063034502', '2019-03-15', '544356.66', '841043226107', '2019-03-20', '2019-03-27 15:25:05', '2019-03-27 15:25:05');
INSERT INTO `cock_consignment_child` VALUES ('217', '156', '7063064549', '2019-03-15', '674938.78', '861043326924', '2019-03-20', '2019-03-27 15:46:12', '2019-03-27 15:46:12');
INSERT INTO `cock_consignment_child` VALUES ('218', '135', '7063064605', '2019-03-16', '836730.72', '861043493893', '2019-03-23', '2019-03-27 16:58:50', '2019-03-27 16:58:50');
INSERT INTO `cock_consignment_child` VALUES ('219', '157', '7063064566', '2019-03-15', '641586.89', '831043329825', '2019-03-22', '2019-03-28 11:28:13', '2019-03-28 11:28:13');
INSERT INTO `cock_consignment_child` VALUES ('220', '63', '7063064353', '2019-03-12', '000.', '841042796995', '2019-03-18', '2019-03-29 20:31:36', '2019-03-29 20:31:36');
INSERT INTO `cock_consignment_child` VALUES ('221', '64', '7063064371', '2019-03-13', '000', '801042824856', '2019-03-18', '2019-03-29 20:37:17', '2019-03-29 20:37:17');
INSERT INTO `cock_consignment_child` VALUES ('222', '65', '7063064367', '2019-03-12', '502295.51', '891042820299', '2019-03-18', '2019-03-29 20:43:52', '2019-03-29 20:43:52');
INSERT INTO `cock_consignment_child` VALUES ('223', '173', '7063064934', '2019-03-24', '561409.01', '811044370222', '2019-04-01', '2019-03-30 13:15:18', '2019-03-30 13:15:18');
INSERT INTO `cock_consignment_child` VALUES ('226', '175', '7063064974', '2019-03-25', '131864.99', '841044444948', '2019-03-27', '2019-03-30 13:31:48', '2019-03-30 13:31:48');
INSERT INTO `cock_consignment_child` VALUES ('227', '176', '7063065000', '2019-03-25', '422794.30', '851044503268', '2019-03-30', '2019-03-30 13:45:07', '2019-03-30 13:45:07');
INSERT INTO `cock_consignment_child` VALUES ('228', '177', '7063065306', '2019-03-31', '757177.12', '801045640642', '2019-04-09', '2019-03-31 19:11:14', '2019-03-31 19:11:14');
INSERT INTO `cock_consignment_child` VALUES ('229', '178', '7063065307', '2019-03-31', '770695.98', '871045640643', '2019-04-07', '2019-03-31 19:15:28', '2019-03-31 19:15:28');
INSERT INTO `cock_consignment_child` VALUES ('230', '179', '706365312', '2019-03-31', '630360.00', '861045694692', '2019-04-07', '2019-04-01 08:25:37', '2019-04-01 08:25:37');
INSERT INTO `cock_consignment_child` VALUES ('232', '181', '7063065330', '2019-04-01', '637364.00', '801045801492', '2019-04-09', '2019-04-01 18:59:36', '2019-04-01 18:59:36');
INSERT INTO `cock_consignment_child` VALUES ('233', '182', '7063065339', '2019-04-01', '163262.85', '831045836112', '2019-04-03', '2019-04-01 20:58:53', '2019-04-01 20:58:53');
INSERT INTO `cock_consignment_child` VALUES ('234', '4', '7063064107', '2019-03-04', '134353.51', '801041518017', null, '2019-04-03 05:40:52', '2019-04-03 05:40:52');
INSERT INTO `cock_consignment_child` VALUES ('235', '3', '7105655463', '2019-03-04', '259160', '841041515979', null, '2019-04-03 05:41:03', '2019-04-03 05:41:03');
INSERT INTO `cock_consignment_child` VALUES ('236', '174', '7063064933', '2019-03-24', '671551.16', '841044370221', '2019-03-31', '2019-04-03 06:30:08', '2019-04-03 06:30:08');
INSERT INTO `cock_consignment_child` VALUES ('237', '183', '23454854', '2019-04-10', '10000', '10132134', null, '2019-04-10 04:32:04', '2019-04-10 04:32:04');
INSERT INTO `cock_consignment_child` VALUES ('238', '184', 'asdadasdas', '2019-04-10', '10000', 'B789456', null, '2019-04-10 04:36:33', '2019-04-10 04:36:33');
INSERT INTO `cock_consignment_child` VALUES ('258', '180', '7063065325', '2019-04-01', '40.28', 'asdasdasdsad', null, '2019-04-16 10:09:09', '2019-04-16 10:09:09');
INSERT INTO `cock_consignment_child` VALUES ('259', '180', '7063065326', '2019-04-01', '45454', 'asdasdasdsad', null, '2019-04-16 10:09:09', '2019-04-16 10:09:09');

-- ----------------------------
-- Table structure for `cock_consignment_child2`
-- ----------------------------
DROP TABLE IF EXISTS `cock_consignment_child2`;
CREATE TABLE `cock_consignment_child2` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `consignment_id` int(10) DEFAULT NULL,
  `category_id` varchar(20) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `package` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `net_weight` varchar(255) DEFAULT NULL,
  `gross_weight` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `consignment` (`consignment_id`),
  CONSTRAINT `consignment` FOREIGN KEY (`consignment_id`) REFERENCES `cock_consignment` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=254 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of cock_consignment_child2
-- ----------------------------
INSERT INTO `cock_consignment_child2` VALUES ('10', '5', '2', 'SOFT DRINK', '938', 'COKE', '15', '15', '', '2019-03-07 15:50:25', '2019-03-07 15:50:25');
INSERT INTO `cock_consignment_child2` VALUES ('13', '7', '2', 'SOFT DRINK', '1013', 'COKE', '15', '15', '', '2019-03-07 16:14:46', '2019-03-07 16:14:46');
INSERT INTO `cock_consignment_child2` VALUES ('14', '8', '2', 'SOFT DRINK', '830', 'COKE', '16', '16', '', '2019-03-07 16:25:10', '2019-03-07 16:25:10');
INSERT INTO `cock_consignment_child2` VALUES ('15', '9', '2', 'SOFT DRINK', '906', 'COKE', '15', '15', '', '2019-03-07 16:32:38', '2019-03-07 16:32:38');
INSERT INTO `cock_consignment_child2` VALUES ('16', '10', '2', 'SOFT DRINK', '906', 'COKE', '15', '15', '', '2019-03-07 16:40:18', '2019-03-07 16:40:18');
INSERT INTO `cock_consignment_child2` VALUES ('17', '6', '2', 'SOFT DRINK', '257', 'COKE', '6', '6', '', '2019-03-08 10:34:55', '2019-03-08 10:34:55');
INSERT INTO `cock_consignment_child2` VALUES ('19', '12', '2', 'SOFT DRINK', '1540', 'COKE', '20', '20', '', '2019-03-08 13:09:39', '2019-03-08 13:09:39');
INSERT INTO `cock_consignment_child2` VALUES ('21', '13', '2', 'SOFT DRINK', '1035', 'COKE', '20', '20', '', '2019-03-08 13:25:51', '2019-03-08 13:25:51');
INSERT INTO `cock_consignment_child2` VALUES ('22', '14', '2', 'SOFT DRINK', '731', 'COKE', '15', '15', '', '2019-03-08 13:34:13', '2019-03-08 13:34:13');
INSERT INTO `cock_consignment_child2` VALUES ('23', '15', '2', 'SOFT DRINK', '221', 'COKE', '6', '6', '', '2019-03-08 13:41:11', '2019-03-08 13:41:11');
INSERT INTO `cock_consignment_child2` VALUES ('24', '16', '2', 'SOFT DRINK', '842', 'COKE', '16', '16', '', '2019-03-08 14:33:03', '2019-03-08 14:33:03');
INSERT INTO `cock_consignment_child2` VALUES ('25', '17', '2', 'SOFT DRINK', '760', 'COKE', '15', '15', '', '2019-03-08 14:38:38', '2019-03-08 14:38:38');
INSERT INTO `cock_consignment_child2` VALUES ('26', '18', '2', 'SOFT DRINK', '943', 'COKE', '15', '15', '', '2019-03-08 14:44:23', '2019-03-08 14:44:23');
INSERT INTO `cock_consignment_child2` VALUES ('27', '19', '2', 'SOFT DRINK', '856', 'COKE', '16', '16', '', '2019-03-08 15:11:11', '2019-03-08 15:11:11');
INSERT INTO `cock_consignment_child2` VALUES ('28', '20', '2', 'SOFT DRINK', '711', 'COKE', '15', '15', '', '2019-03-08 15:15:12', '2019-03-08 15:15:12');
INSERT INTO `cock_consignment_child2` VALUES ('29', '21', '2', 'SOFT DRINK', '1031', 'COKE', '15', '15', '', '2019-03-08 15:17:48', '2019-03-08 15:17:48');
INSERT INTO `cock_consignment_child2` VALUES ('30', '22', '2', 'SOFT DRINK', '512', 'COKE', '9', '9', '', '2019-03-08 15:22:11', '2019-03-08 15:22:11');
INSERT INTO `cock_consignment_child2` VALUES ('31', '23', '2', 'SOFT DRINK', '1044', 'COKE', '15', '15', '', '2019-03-08 15:27:47', '2019-03-08 15:27:47');
INSERT INTO `cock_consignment_child2` VALUES ('33', '24', '2', 'SOFT DRINK', '212', 'COKE', '6', '6', '', '2019-03-08 15:47:49', '2019-03-08 15:47:49');
INSERT INTO `cock_consignment_child2` VALUES ('34', '25', '2', 'SOFT DRINK', '756', 'COKE', '16', '16', '', '2019-03-09 11:03:42', '2019-03-09 11:03:42');
INSERT INTO `cock_consignment_child2` VALUES ('37', '26', '2', 'SOFT DRINK', '1445', 'COKE', '15', '15', '', '2019-03-09 11:26:56', '2019-03-09 11:26:56');
INSERT INTO `cock_consignment_child2` VALUES ('39', '28', '2', 'SOFT DRINK', '233', 'COKE', '6', '6', '', '2019-03-09 11:48:38', '2019-03-09 11:48:38');
INSERT INTO `cock_consignment_child2` VALUES ('41', '30', '2', 'SOFT DRINK', '672', 'COKE', '15', '15', '', '2019-03-09 12:00:20', '2019-03-09 12:00:20');
INSERT INTO `cock_consignment_child2` VALUES ('42', '31', '2', 'SOFT DRINK', '800', 'COKE', '16', '16', '', '2019-03-11 19:31:35', '2019-03-11 19:31:35');
INSERT INTO `cock_consignment_child2` VALUES ('49', '27', '2', 'SOFT DRINK', '799', 'COKE', '15', '15', '', '2019-03-13 18:48:48', '2019-03-13 18:48:48');
INSERT INTO `cock_consignment_child2` VALUES ('50', '29', '2', 'SOFT DRINK', '316', 'COKE', '6', '6', '', '2019-03-13 18:52:10', '2019-03-13 18:52:10');
INSERT INTO `cock_consignment_child2` VALUES ('51', '38', '2', 'SOFT DRINK', '741', 'COKE', '16', '16', '', '2019-03-13 19:22:51', '2019-03-13 19:22:51');
INSERT INTO `cock_consignment_child2` VALUES ('52', '39', '2', 'SOFT DRINK', '1002', 'COKE', '16', '16', '', '2019-03-13 19:32:44', '2019-03-13 19:32:44');
INSERT INTO `cock_consignment_child2` VALUES ('53', '40', '2', 'SOFT DRINK', '672', 'COKE', '16', '16', '', '2019-03-13 21:06:08', '2019-03-13 21:06:08');
INSERT INTO `cock_consignment_child2` VALUES ('54', '41', '2', 'SOFT DRINK', '1000', 'COKE', '20', '20', '', '2019-03-13 21:09:27', '2019-03-13 21:09:27');
INSERT INTO `cock_consignment_child2` VALUES ('55', '42', '2', 'SOFT DRINK', '1000', 'COKE', '20', '20', '', '2019-03-13 21:11:56', '2019-03-13 21:11:56');
INSERT INTO `cock_consignment_child2` VALUES ('56', '37', '2', 'SOFT DRINK', '908', 'COKE', '16', '16', '', '2019-03-13 21:16:32', '2019-03-13 21:16:32');
INSERT INTO `cock_consignment_child2` VALUES ('57', '43', '2', 'SOFT DRINK', '800', 'COKE', '16', '16', '', '2019-03-13 21:21:35', '2019-03-13 21:21:35');
INSERT INTO `cock_consignment_child2` VALUES ('58', '32', '2', 'SOFT DRINK', '992', 'COKE', '16', '16', '', '2019-03-13 21:22:31', '2019-03-13 21:22:31');
INSERT INTO `cock_consignment_child2` VALUES ('59', '33', '2', 'SOFT DRINK', '996', 'COKE', '16', '16', '', '2019-03-13 21:23:18', '2019-03-13 21:23:18');
INSERT INTO `cock_consignment_child2` VALUES ('60', '34', '2', 'SOFT DRINK', '1018', 'COKE', '16', '16', '', '2019-03-13 21:24:03', '2019-03-13 21:24:03');
INSERT INTO `cock_consignment_child2` VALUES ('61', '35', '2', 'SOFT DRINK', '1018', 'COKE', '16', '16', '', '2019-03-13 21:24:46', '2019-03-13 21:24:46');
INSERT INTO `cock_consignment_child2` VALUES ('62', '36', '2', 'SOFT DRINK', '664', 'COKE', '9', '9', '', '2019-03-13 21:25:14', '2019-03-13 21:25:14');
INSERT INTO `cock_consignment_child2` VALUES ('63', '44', '2', 'SOFT DRINK', '232', 'COKE', '6', '6', '', '2019-03-13 21:27:24', '2019-03-13 21:27:24');
INSERT INTO `cock_consignment_child2` VALUES ('64', '45', '2', 'SOFT DRINK', '185', 'COKE', '6', '6', '', '2019-03-13 21:31:44', '2019-03-13 21:31:44');
INSERT INTO `cock_consignment_child2` VALUES ('65', '46', '2', 'SOFT DRINK', '1600', 'COKE', '16', '16', '', '2019-03-13 21:37:07', '2019-03-13 21:37:07');
INSERT INTO `cock_consignment_child2` VALUES ('66', '47', '2', 'SOFT DRINK', '36', 'COKE', '6', '6', '', '2019-03-14 09:47:48', '2019-03-14 09:47:48');
INSERT INTO `cock_consignment_child2` VALUES ('67', '48', '2', 'SOFT DRINK', '1000', 'COKE', '20', '20', '', '2019-03-14 17:08:50', '2019-03-14 17:08:50');
INSERT INTO `cock_consignment_child2` VALUES ('68', '49', '2', 'SOFT DRINK', '1018', 'COKE', '16', '16', '', '2019-03-14 17:13:03', '2019-03-14 17:13:03');
INSERT INTO `cock_consignment_child2` VALUES ('69', '50', '2', 'SOFT DRINK', '1725', 'COKE', '20', '20', '', '2019-03-14 17:17:32', '2019-03-14 17:17:32');
INSERT INTO `cock_consignment_child2` VALUES ('70', '51', '2', 'SOFT DRINK', '800', 'COKE', '16', '16', '', '2019-03-14 17:26:27', '2019-03-14 17:26:27');
INSERT INTO `cock_consignment_child2` VALUES ('71', '52', '2', 'SOFT DRINK', '212', 'COKE', '6', '6', '', '2019-03-14 17:32:06', '2019-03-14 17:32:06');
INSERT INTO `cock_consignment_child2` VALUES ('72', '53', '2', 'SOFT DRINK', '218', 'COKE', '6', '6', '', '2019-03-14 17:34:28', '2019-03-14 17:34:28');
INSERT INTO `cock_consignment_child2` VALUES ('73', '54', '2', 'SOFT DRINK', '712', 'COKE', '16', '16', '', '2019-03-14 17:38:52', '2019-03-14 17:38:52');
INSERT INTO `cock_consignment_child2` VALUES ('74', '55', '2', 'SOFT DRINK', '1180', 'COKE', '20', '20', '', '2019-03-14 17:42:54', '2019-03-14 17:42:54');
INSERT INTO `cock_consignment_child2` VALUES ('75', '56', '2', 'SOFT DRINK', '826', 'COKE', '16', '16', '', '2019-03-14 17:57:41', '2019-03-14 17:57:41');
INSERT INTO `cock_consignment_child2` VALUES ('77', '58', '2', 'SOFT DRINK', '1225', 'COKE', '16', '16', '', '2019-03-14 18:05:25', '2019-03-14 18:05:25');
INSERT INTO `cock_consignment_child2` VALUES ('78', '59', '2', 'SOFT DRINK', '816', 'COKE', '16', '16', '', '2019-03-14 18:35:32', '2019-03-14 18:35:32');
INSERT INTO `cock_consignment_child2` VALUES ('79', '60', '2', 'SOFT DRINK', '783', 'COKE', '16', '16', '', '2019-03-14 18:42:23', '2019-03-14 18:42:23');
INSERT INTO `cock_consignment_child2` VALUES ('80', '61', '2', 'SOFT DRINK', '896', 'COKE', '16', '16', '', '2019-03-14 19:01:01', '2019-03-14 19:01:01');
INSERT INTO `cock_consignment_child2` VALUES ('81', '62', '2', 'SOFT DRINK', '706', 'COKE', '16', '16', '', '2019-03-14 19:04:36', '2019-03-14 19:04:36');
INSERT INTO `cock_consignment_child2` VALUES ('85', '66', '2', 'SOFT DRINK', '788', 'COKE', '16', '16', '', '2019-03-14 19:21:09', '2019-03-14 19:21:09');
INSERT INTO `cock_consignment_child2` VALUES ('90', '71', '2', 'SOFT DRINK', '206', 'COKE', '6', '6', '', '2019-03-15 13:41:21', '2019-03-15 13:41:21');
INSERT INTO `cock_consignment_child2` VALUES ('92', '57', '2', 'SOFT DRINK', '726', 'COKE', '16', '16', '', '2019-03-15 16:23:35', '2019-03-15 16:23:35');
INSERT INTO `cock_consignment_child2` VALUES ('93', '11', '2', 'SOFT DRINK', '256', 'COKE', '6', '6', '', '2019-03-15 16:27:14', '2019-03-15 16:27:14');
INSERT INTO `cock_consignment_child2` VALUES ('94', '67', '2', 'SOFT DRINK', '792', 'COKE', '16', '16', '', '2019-03-15 16:55:43', '2019-03-15 16:55:43');
INSERT INTO `cock_consignment_child2` VALUES ('95', '68', '2', 'SOFT DRINK', '730', 'COKE', '16', '16', '', '2019-03-15 16:56:57', '2019-03-15 16:56:57');
INSERT INTO `cock_consignment_child2` VALUES ('96', '69', '2', 'SOFT DRINK', '700', 'COKE', '16', '16', '', '2019-03-15 16:58:13', '2019-03-15 16:58:13');
INSERT INTO `cock_consignment_child2` VALUES ('97', '70', '2', 'SOFT DRINK', '729', 'COKE', '16', '16', '', '2019-03-15 16:58:52', '2019-03-15 16:58:52');
INSERT INTO `cock_consignment_child2` VALUES ('98', '72', '2', 'SOFT DRINK', '206', 'COKE', '6', '6', '', '2019-03-15 17:01:50', '2019-03-15 17:01:50');
INSERT INTO `cock_consignment_child2` VALUES ('99', '73', '2', 'SOFT DRINK', '275', 'COKE', '6', '6', '', '2019-03-15 17:05:26', '2019-03-15 17:05:26');
INSERT INTO `cock_consignment_child2` VALUES ('100', '74', '2', 'SOFT DRINK', '756', 'COKE', '16', '16', '', '2019-03-15 17:19:46', '2019-03-15 17:19:46');
INSERT INTO `cock_consignment_child2` VALUES ('101', '75', '2', 'SOFT DRINK', '217', 'COKE', '6', '6', '', '2019-03-15 17:21:48', '2019-03-15 17:21:48');
INSERT INTO `cock_consignment_child2` VALUES ('102', '76', '2', 'SOFT DRINK', '836', 'COKE', '16', '16', '', '2019-03-15 17:24:46', '2019-03-15 17:24:46');
INSERT INTO `cock_consignment_child2` VALUES ('103', '77', '2', 'SOFT DRINK', '708', 'COKE', '16', '16', '', '2019-03-15 17:33:13', '2019-03-15 17:33:13');
INSERT INTO `cock_consignment_child2` VALUES ('104', '78', '2', 'SOFT DRINK', '1007', 'COKE', '16', '16', '', '2019-03-15 17:55:04', '2019-03-15 17:55:04');
INSERT INTO `cock_consignment_child2` VALUES ('105', '79', '2', 'SOFT DRINK', '771', 'COKE', '16', '16', '', '2019-03-15 18:08:18', '2019-03-15 18:08:18');
INSERT INTO `cock_consignment_child2` VALUES ('106', '80', '2', 'SOFT DRINK', '792', 'COKE', '16', '16', '', '2019-03-15 18:27:29', '2019-03-15 18:27:29');
INSERT INTO `cock_consignment_child2` VALUES ('107', '81', '2', 'SOFT DRINK', '696', 'COKE', '15', '15', '', '2019-03-15 18:30:47', '2019-03-15 18:30:47');
INSERT INTO `cock_consignment_child2` VALUES ('108', '82', '2', 'SOFT DRINK', '777', 'COKE', '16', '16', '', '2019-03-15 18:46:06', '2019-03-15 18:46:06');
INSERT INTO `cock_consignment_child2` VALUES ('109', '83', '2', 'SOFT DRINK', '750', 'COKE', '16', '16', '', '2019-03-15 18:49:11', '2019-03-15 18:49:11');
INSERT INTO `cock_consignment_child2` VALUES ('110', '84', '2', 'SOFT DRINK', '777', 'COKE', '16', '16', '', '2019-03-15 19:16:24', '2019-03-15 19:16:24');
INSERT INTO `cock_consignment_child2` VALUES ('116', '90', '2', 'SOFT DRINK', '292', 'COKE', '6', '6', '', '2019-03-25 15:58:31', '2019-03-25 15:58:31');
INSERT INTO `cock_consignment_child2` VALUES ('117', '91', '2', 'SOFT DRINK', '335', 'COKE', '6', '6', '', '2019-03-25 16:00:13', '2019-03-25 16:00:13');
INSERT INTO `cock_consignment_child2` VALUES ('119', '93', '2', 'SOFT DRINK', '1167', 'COKE', '20', '20', '', '2019-03-25 16:03:17', '2019-03-25 16:03:17');
INSERT INTO `cock_consignment_child2` VALUES ('120', '94', '2', 'SOFT DRINK', '234', 'COKE', '6', '6', '', '2019-03-25 16:05:38', '2019-03-25 16:05:38');
INSERT INTO `cock_consignment_child2` VALUES ('121', '95', '2', 'SOFT DRINK', '349', 'COKE', '6', '6', '', '2019-03-25 16:09:20', '2019-03-25 16:09:20');
INSERT INTO `cock_consignment_child2` VALUES ('124', '98', '2', 'SOFT DRINK', '1525', 'COKE', '20', '20', '', '2019-03-25 16:21:06', '2019-03-25 16:21:06');
INSERT INTO `cock_consignment_child2` VALUES ('125', '99', '2', 'SOFT DRINK', '904', 'COKE', '16', '16', '', '2019-03-25 16:22:24', '2019-03-25 16:22:24');
INSERT INTO `cock_consignment_child2` VALUES ('126', '100', '2', 'SOFT DRINK', '208', 'COKE', '6', '6', '', '2019-03-25 16:22:40', '2019-03-25 16:22:40');
INSERT INTO `cock_consignment_child2` VALUES ('127', '101', '2', 'SOFT DRINK', '197', 'COKE', '6', '6', '', '2019-03-25 16:24:11', '2019-03-25 16:24:11');
INSERT INTO `cock_consignment_child2` VALUES ('128', '102', '2', 'SOFT DRINK', '910', 'COKE', '20', '20', '', '2019-03-25 16:25:29', '2019-03-25 16:25:29');
INSERT INTO `cock_consignment_child2` VALUES ('129', '103', '2', 'SOFT DRINK', '905', 'COKE', '20', '20', '', '2019-03-25 16:26:13', '2019-03-25 16:26:13');
INSERT INTO `cock_consignment_child2` VALUES ('130', '104', '2', 'SOFT DRINK', '67', 'COKE', '6', '6', '', '2019-03-25 16:29:47', '2019-03-25 16:29:47');
INSERT INTO `cock_consignment_child2` VALUES ('131', '105', '2', 'SOFT DRINK', '777', 'COKE', '16', '16', '', '2019-03-25 16:30:33', '2019-03-25 16:30:33');
INSERT INTO `cock_consignment_child2` VALUES ('132', '106', '2', 'SOFT DRINK', '225', 'COKE', '6', '6', '', '2019-03-25 16:31:23', '2019-03-25 16:31:23');
INSERT INTO `cock_consignment_child2` VALUES ('133', '107', '2', 'SOFT DRINK', '262', 'COKE', '6', '6', '', '2019-03-25 16:33:40', '2019-03-25 16:33:40');
INSERT INTO `cock_consignment_child2` VALUES ('134', '108', '2', 'SOFT DRINK', '777', 'COKE', '16', '16', '', '2019-03-25 16:34:20', '2019-03-25 16:34:20');
INSERT INTO `cock_consignment_child2` VALUES ('135', '109', '2', 'SOFT DRINK', '1095', 'COKE', '20', '20', '', '2019-03-25 16:36:18', '2019-03-25 16:36:18');
INSERT INTO `cock_consignment_child2` VALUES ('136', '110', '2', 'SOFT DRINK', '952', 'COKE', '16', '16', '', '2019-03-25 16:38:12', '2019-03-25 16:38:12');
INSERT INTO `cock_consignment_child2` VALUES ('137', '111', '2', 'SOFT DRINK', '894', 'COKE', '20', '20', '', '2019-03-25 16:39:15', '2019-03-25 16:39:15');
INSERT INTO `cock_consignment_child2` VALUES ('138', '112', '2', 'SOFT DRINK', '756', 'COKE', '16', '16', '', '2019-03-25 16:42:28', '2019-03-25 16:42:28');
INSERT INTO `cock_consignment_child2` VALUES ('139', '113', '2', 'SOFT DRINK', '243', 'COKE', '6', '6', '', '2019-03-25 16:42:49', '2019-03-25 16:42:49');
INSERT INTO `cock_consignment_child2` VALUES ('141', '115', '2', 'SOFT DRINK', '785', 'COKE', '16', '16', '', '2019-03-25 16:48:34', '2019-03-25 16:48:34');
INSERT INTO `cock_consignment_child2` VALUES ('142', '116', '2', 'SOFT DRINK', '650', 'COKE', '15', '15', '', '2019-03-25 16:49:05', '2019-03-25 16:49:05');
INSERT INTO `cock_consignment_child2` VALUES ('143', '114', '2', 'SOFT DRINK', '707', 'COKE', '16', '20', '', '2019-03-25 16:49:51', '2019-03-25 16:49:51');
INSERT INTO `cock_consignment_child2` VALUES ('144', '117', '2', 'SOFT DRINK', '834', 'COKE', '16', '16', '', '2019-03-25 16:52:25', '2019-03-25 16:52:25');
INSERT INTO `cock_consignment_child2` VALUES ('145', '118', '2', 'SOFT DRINK', '933', 'COKE', '20', '20', '', '2019-03-25 16:54:07', '2019-03-25 16:54:07');
INSERT INTO `cock_consignment_child2` VALUES ('146', '119', '2', 'SOFT DRINK', '910', 'COKE', '20', '20', '', '2019-03-25 16:56:11', '2019-03-25 16:56:11');
INSERT INTO `cock_consignment_child2` VALUES ('147', '120', '2', 'SOFT DRINK', '912', 'COKE', '20', '20', '', '2019-03-25 16:56:59', '2019-03-25 16:56:59');
INSERT INTO `cock_consignment_child2` VALUES ('148', '121', '2', 'SOFT DRINK', '877', 'COKE', '16', '16', '', '2019-03-25 16:59:54', '2019-03-25 16:59:54');
INSERT INTO `cock_consignment_child2` VALUES ('150', '123', '2', 'SOFT DRINK', '236', 'COKE', '6', '6', '', '2019-03-25 17:01:59', '2019-03-25 17:01:59');
INSERT INTO `cock_consignment_child2` VALUES ('151', '124', '2', 'SOFT DRINK', '685', 'COKE', '16', '16', '', '2019-03-25 17:03:26', '2019-03-25 17:03:26');
INSERT INTO `cock_consignment_child2` VALUES ('152', '125', '2', 'SOFT DRINK', '900', 'COKE', '20', '20', '', '2019-03-25 17:04:58', '2019-03-25 17:04:58');
INSERT INTO `cock_consignment_child2` VALUES ('153', '126', '2', 'SOFT DRINK', '716', 'COKE', '16', '16', '', '2019-03-25 17:07:00', '2019-03-25 17:07:00');
INSERT INTO `cock_consignment_child2` VALUES ('154', '127', '2', 'SOFT DRINK', '950', 'COKE', '20', '20', '', '2019-03-25 17:07:31', '2019-03-25 17:07:31');
INSERT INTO `cock_consignment_child2` VALUES ('155', '128', '2', 'SOFT DRINK', '1125', 'COKE', '20', '20', '', '2019-03-25 17:09:26', '2019-03-25 17:09:26');
INSERT INTO `cock_consignment_child2` VALUES ('156', '129', '2', 'SOFT DRINK', '1303', 'COKE', '15', '15', '', '2019-03-25 17:11:52', '2019-03-25 17:11:52');
INSERT INTO `cock_consignment_child2` VALUES ('157', '130', '2', 'SOFT DRINK', '725', 'COKE', '16', '16', '', '2019-03-25 17:13:26', '2019-03-25 17:13:26');
INSERT INTO `cock_consignment_child2` VALUES ('158', '131', '2', 'SOFT DRINK', '720', 'COKE', '16', '16', '', '2019-03-25 17:14:17', '2019-03-25 17:14:17');
INSERT INTO `cock_consignment_child2` VALUES ('159', '132', '2', 'SOFT DRINK', '858', 'COKE', '16', '16', '', '2019-03-25 17:15:57', '2019-03-25 17:15:57');
INSERT INTO `cock_consignment_child2` VALUES ('160', '133', '2', 'SOFT DRINK', '910', 'COKE', '20', '20', '', '2019-03-25 17:17:56', '2019-03-25 17:17:56');
INSERT INTO `cock_consignment_child2` VALUES ('163', '136', '2', 'SOFT DRINK', '905', 'COKE ', '20', '20', '', '2019-03-25 17:21:58', '2019-03-25 17:21:58');
INSERT INTO `cock_consignment_child2` VALUES ('164', '137', '2', 'SOFT DRINK', '1022', 'COKE', '20', '20', '', '2019-03-25 17:23:34', '2019-03-25 17:23:34');
INSERT INTO `cock_consignment_child2` VALUES ('165', '138', '2', 'SOFT DRINK', '1160', 'COKE', '20', '20', '', '2019-03-25 17:25:51', '2019-03-25 17:25:51');
INSERT INTO `cock_consignment_child2` VALUES ('166', '139', '2', 'SOFT DRINK', '1225', 'COKE', '20', '20', '', '2019-03-25 17:25:57', '2019-03-25 17:25:57');
INSERT INTO `cock_consignment_child2` VALUES ('167', '140', '2', 'SOFT DRINK', '905', 'COKE', '20', '20', '', '2019-03-25 17:29:54', '2019-03-25 17:29:54');
INSERT INTO `cock_consignment_child2` VALUES ('168', '141', '2', 'SOFT DRINK', '910', 'COKE', '20', '20', '', '2019-03-25 17:30:13', '2019-03-25 17:30:13');
INSERT INTO `cock_consignment_child2` VALUES ('169', '134', '2', 'SOFT DRINK', '1023', 'COKE', '20', '20', '', '2019-03-25 17:31:26', '2019-03-25 17:31:26');
INSERT INTO `cock_consignment_child2` VALUES ('170', '142', '2', 'SOFT DRINK', '1225', 'COKE', '20', '20', '', '2019-03-25 17:33:48', '2019-03-25 17:33:48');
INSERT INTO `cock_consignment_child2` VALUES ('171', '143', '2', 'SOFT DRINK', '1111', 'COKE', '16', '16', '', '2019-03-25 17:34:44', '2019-03-25 17:34:44');
INSERT INTO `cock_consignment_child2` VALUES ('172', '144', '2', 'SOFT DRINK', '1010', 'COKE', '20', '20', '', '2019-03-25 17:35:56', '2019-03-25 17:35:56');
INSERT INTO `cock_consignment_child2` VALUES ('173', '145', '2', 'SOFT DRINK', '1000', 'COKE', '20', '20', '', '2019-03-25 17:38:25', '2019-03-25 17:38:25');
INSERT INTO `cock_consignment_child2` VALUES ('174', '146', '2', 'SOFT DRINK', '727', 'COKE', '16', '16', '', '2019-03-25 17:39:19', '2019-03-25 17:39:19');
INSERT INTO `cock_consignment_child2` VALUES ('175', '147', '2', 'SOFT DRINK', '1020', 'COKE', '20', '20', '', '2019-03-25 17:41:30', '2019-03-25 17:41:30');
INSERT INTO `cock_consignment_child2` VALUES ('176', '148', '2', 'SOFT DRINK', '1225', 'COKE ', '20', '20', '', '2019-03-25 17:42:18', '2019-03-25 17:42:18');
INSERT INTO `cock_consignment_child2` VALUES ('177', '149', '2', 'SOFT DRINK', '1380', 'COKE', '20', '20', '', '2019-03-25 17:46:54', '2019-03-25 17:46:54');
INSERT INTO `cock_consignment_child2` VALUES ('179', '151', '2', 'SOFT DRINK', '274', 'COKE', '6', '6', '', '2019-03-25 17:57:08', '2019-03-25 17:57:08');
INSERT INTO `cock_consignment_child2` VALUES ('180', '152', '2', 'SOFT DRINK', '207', 'COKE', '6', '6', '', '2019-03-25 18:01:47', '2019-03-25 18:01:47');
INSERT INTO `cock_consignment_child2` VALUES ('181', '153', '2', 'SOFT DRINK', '736', 'COKE', '9', '9', '', '2019-03-25 18:06:55', '2019-03-25 18:06:55');
INSERT INTO `cock_consignment_child2` VALUES ('182', '154', '2', 'SOFT DRINK', '816', 'COKE', '16', '16', '', '2019-03-25 18:11:23', '2019-03-25 18:11:23');
INSERT INTO `cock_consignment_child2` VALUES ('183', '155', '2', 'SOFT DRINK', '1292', 'COKE ', '20', '20', '', '2019-03-25 18:18:01', '2019-03-25 18:18:01');
INSERT INTO `cock_consignment_child2` VALUES ('187', '158', '2', 'SOFT DRINK', '968', 'COKE', '20', '20', '', '2019-03-25 19:10:43', '2019-03-25 19:10:43');
INSERT INTO `cock_consignment_child2` VALUES ('188', '159', '2', 'SOFT DRINK', '708', 'COKE', '16', '16', '', '2019-03-25 19:14:14', '2019-03-25 19:14:14');
INSERT INTO `cock_consignment_child2` VALUES ('189', '160', '2', 'SOFT DRINK', '708', 'COKE', '16', '16', '', '2019-03-25 19:17:40', '2019-03-25 19:17:40');
INSERT INTO `cock_consignment_child2` VALUES ('190', '161', '2', 'SOFT DRINK', '744', 'COKE ', '16', '16', '', '2019-03-25 19:24:26', '2019-03-25 19:24:26');
INSERT INTO `cock_consignment_child2` VALUES ('191', '162', '2', 'SOFT DRINK', '733', 'COKE', '16', '16', '', '2019-03-25 19:33:33', '2019-03-25 19:33:33');
INSERT INTO `cock_consignment_child2` VALUES ('192', '163', '2', 'SOFT DRINK', '821', 'COKE', '16', '16', '', '2019-03-25 19:37:15', '2019-03-25 19:37:15');
INSERT INTO `cock_consignment_child2` VALUES ('193', '164', '2', 'SOFT DRINK', '970', 'COKE', '20', '20', '', '2019-03-25 19:41:17', '2019-03-25 19:41:17');
INSERT INTO `cock_consignment_child2` VALUES ('194', '165', '2', 'SOFT DRINK', '1164', 'COKE', '20', '20', '', '2019-03-25 19:46:41', '2019-03-25 19:46:41');
INSERT INTO `cock_consignment_child2` VALUES ('195', '166', '2', 'SOFT DRINK', '1225', 'COKE', '20', '20', '', '2019-03-25 19:51:19', '2019-03-25 19:51:19');
INSERT INTO `cock_consignment_child2` VALUES ('196', '167', '2', 'SOFT DRINK', '680', 'COKE', '16', '16', '', '2019-03-25 19:55:03', '2019-03-25 19:55:03');
INSERT INTO `cock_consignment_child2` VALUES ('197', '168', '2', 'SOFT DRINK', '989', 'COKE', '16', '16', '', '2019-03-25 19:58:18', '2019-03-25 19:58:18');
INSERT INTO `cock_consignment_child2` VALUES ('198', '169', '2', 'SOFT DRINK', '999', 'COKE', '20', '20', '', '2019-03-25 20:02:06', '2019-03-25 20:02:06');
INSERT INTO `cock_consignment_child2` VALUES ('199', '170', '2', 'SOFT DRINK', '250', 'COKE', '6', '6', '', '2019-03-25 20:06:17', '2019-03-25 20:06:17');
INSERT INTO `cock_consignment_child2` VALUES ('200', '85', '2', 'SOFT DRINK', '240', 'COKE', '6', '6', '', '2019-03-26 15:34:20', '2019-03-26 15:34:20');
INSERT INTO `cock_consignment_child2` VALUES ('201', '86', '2', 'SOFT DRINK', '910', 'COKE', '20', '20', '', '2019-03-26 15:35:39', '2019-03-26 15:35:39');
INSERT INTO `cock_consignment_child2` VALUES ('202', '87', '2', 'SOFT DRINK', '935', 'COKE', '20', '20', '', '2019-03-26 15:37:33', '2019-03-26 15:37:33');
INSERT INTO `cock_consignment_child2` VALUES ('203', '88', '2', 'SOFT DRINK', '758', 'COKE', '16', '16', '', '2019-03-26 15:49:14', '2019-03-26 15:49:14');
INSERT INTO `cock_consignment_child2` VALUES ('204', '89', '2', 'SOFT DRINK', '720', 'COKE', '16', '16', '', '2019-03-26 15:52:42', '2019-03-26 15:52:42');
INSERT INTO `cock_consignment_child2` VALUES ('205', '92', '2', 'SOFT DRINK', '776', 'COKE', '16', '16', '', '2019-03-26 15:54:19', '2019-03-26 15:54:19');
INSERT INTO `cock_consignment_child2` VALUES ('206', '96', '2', 'SOFT DRINK', '788', 'COKE', '16', '16', '', '2019-03-26 15:58:47', '2019-03-26 15:58:47');
INSERT INTO `cock_consignment_child2` VALUES ('207', '97', '2', 'SOFT DRINK', '879', 'COKE', '16', '16', '', '2019-03-26 16:00:20', '2019-03-26 16:00:20');
INSERT INTO `cock_consignment_child2` VALUES ('208', '122', '2', 'SOFT DRINK', '266', 'COKE', '6', '6', '', '2019-03-26 17:13:08', '2019-03-26 17:13:08');
INSERT INTO `cock_consignment_child2` VALUES ('209', '171', '2', 'SOFT DRINK', '1347', 'COKE', '20', '20', '', '2019-03-26 19:09:43', '2019-03-26 19:09:43');
INSERT INTO `cock_consignment_child2` VALUES ('211', '150', '2', 'SOFT DRINK', '790', 'COKE ', '16', '16', '', '2019-03-27 15:25:05', '2019-03-27 15:25:05');
INSERT INTO `cock_consignment_child2` VALUES ('212', '156', '2', 'SOFT DRINK', '1044', 'COKE', '20', '20', '', '2019-03-27 15:46:12', '2019-03-27 15:46:12');
INSERT INTO `cock_consignment_child2` VALUES ('213', '135', '2', 'SOFT DRINK', '1008', 'COKE', '20', '20', '', '2019-03-27 16:58:50', '2019-03-27 16:58:50');
INSERT INTO `cock_consignment_child2` VALUES ('214', '157', '2', 'SOFT DRINK', '944', 'COKE', '16', '16', '', '2019-03-28 11:28:13', '2019-03-28 11:28:13');
INSERT INTO `cock_consignment_child2` VALUES ('215', '63', '2', 'SOFT DRINK', '708', 'COKE', '16', '16', '', '2019-03-29 20:31:36', '2019-03-29 20:31:36');
INSERT INTO `cock_consignment_child2` VALUES ('216', '64', '2', 'SOFT DRINK', '840', 'COKE', '16', '16', '', '2019-03-29 20:37:17', '2019-03-29 20:37:17');
INSERT INTO `cock_consignment_child2` VALUES ('217', '65', '2', 'SOFT DRINK', '792', 'COKE', '16', '16', '', '2019-03-29 20:43:52', '2019-03-29 20:43:52');
INSERT INTO `cock_consignment_child2` VALUES ('218', '173', '2', 'SOFT DRINK', '804', 'COKE', '16', '16', '', '2019-03-30 13:15:18', '2019-03-30 13:15:18');
INSERT INTO `cock_consignment_child2` VALUES ('221', '175', '2', 'SOFT DRINK', '269', 'COKE', '6', '6', '', '2019-03-30 13:31:48', '2019-03-30 13:31:48');
INSERT INTO `cock_consignment_child2` VALUES ('222', '176', '2', 'SOFT DRINK', '553', 'COKE', '9', '9', '', '2019-03-30 13:45:07', '2019-03-30 13:45:07');
INSERT INTO `cock_consignment_child2` VALUES ('223', '177', '2', 'SOFT DRINK', '1135', 'COKE', '20', '20', '', '2019-03-31 19:11:14', '2019-03-31 19:11:14');
INSERT INTO `cock_consignment_child2` VALUES ('224', '178', '2', 'SOFT DRINK', '1089', 'COKE', '20', '20', '', '2019-03-31 19:15:28', '2019-03-31 19:15:28');
INSERT INTO `cock_consignment_child2` VALUES ('225', '179', '2', 'SOFT DRINK', '900', 'COKE', '20', '20', '', '2019-04-01 08:25:37', '2019-04-01 08:25:37');
INSERT INTO `cock_consignment_child2` VALUES ('227', '181', '2', 'SOFT DRINK', '910', 'COKE', '20', '20', '', '2019-04-01 18:59:36', '2019-04-01 18:59:36');
INSERT INTO `cock_consignment_child2` VALUES ('228', '182', '2', 'SOFT DRINK', '204', 'COKE', '6', '6', '', '2019-04-01 20:58:53', '2019-04-01 20:58:53');
INSERT INTO `cock_consignment_child2` VALUES ('229', '4', '2', 'SOFT DRINK', '269', 'COKE', '6', '6', '', '2019-04-03 05:40:52', '2019-04-03 05:40:52');
INSERT INTO `cock_consignment_child2` VALUES ('230', '3', '2', 'SOFT DRINK', '682', 'COKE', '16', '16', '', '2019-04-03 05:41:03', '2019-04-03 05:41:03');
INSERT INTO `cock_consignment_child2` VALUES ('231', '174', '2', 'SOFT DRINK', '926', 'COKE', '20', '20', '', '2019-04-03 06:30:08', '2019-04-03 06:30:08');
INSERT INTO `cock_consignment_child2` VALUES ('232', '183', '1', 'NOTE BOOK', '52', 'COKE', '52', '52', 'remark1', '2019-04-10 04:32:04', '2019-04-10 04:32:04');
INSERT INTO `cock_consignment_child2` VALUES ('233', '184', '2', 'SOFT DRINK', 'asdasd', 'fadsjask', 'asdas', 'asdas', 'jdsjhasdk', '2019-04-10 04:36:33', '2019-04-10 04:36:33');
INSERT INTO `cock_consignment_child2` VALUES ('253', '180', '2', 'SOFT DRINK', '224', 'COKE', '6', '6', '', '2019-04-16 10:09:09', '2019-04-16 10:09:09');

-- ----------------------------
-- Table structure for `coke_acknowledgement`
-- ----------------------------
DROP TABLE IF EXISTS `coke_acknowledgement`;
CREATE TABLE `coke_acknowledgement` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `challan_id` varchar(50) DEFAULT NULL,
  `challan_number` varchar(100) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `origin` varchar(255) DEFAULT NULL,
  `destination` varchar(255) DEFAULT NULL,
  `vehicle_no` varchar(255) DEFAULT NULL,
  `pan_no` varchar(255) DEFAULT NULL,
  `reporting_date` date DEFAULT NULL,
  `reporting_time` varchar(20) DEFAULT NULL,
  `unloading_date` date DEFAULT NULL,
  `unloading_time` varchar(20) DEFAULT NULL,
  `balance_payable_at` varchar(255) DEFAULT NULL,
  `acknowledgement_received_date` date DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `balance_amount` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `trip_id` varchar(255) DEFAULT NULL,
  `load_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of coke_acknowledgement
-- ----------------------------
INSERT INTO `coke_acknowledgement` VALUES ('4', '7', '114551', '2019-04-03', 'SILIGURI', 'GUWAHATI', 'WB73B6290', 'asdasdasd', '2019-04-17', '12:24', '2019-04-18', '15:29', 'SILIGURI', '2019-04-17', '2019-04-18', '10000', '2019-04-17 09:59:48', '2019-04-17 09:59:48', '', '273298');

-- ----------------------------
-- Table structure for `coke_acknowledgement_child`
-- ----------------------------
DROP TABLE IF EXISTS `coke_acknowledgement_child`;
CREATE TABLE `coke_acknowledgement_child` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `acknowledgement_id` int(10) DEFAULT NULL,
  `consigment_no` varchar(100) DEFAULT NULL,
  `received_qty` varchar(50) DEFAULT NULL,
  `received_weight` varchar(100) DEFAULT NULL,
  `is_good_condition` varchar(255) DEFAULT NULL,
  `cause_of_loss` varchar(255) DEFAULT NULL,
  `damage_mode` varchar(255) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `quantity` varchar(255) DEFAULT NULL,
  `value` varchar(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `acknoledgement_id` (`acknowledgement_id`),
  CONSTRAINT `acknoledgement_id` FOREIGN KEY (`acknowledgement_id`) REFERENCES `coke_acknowledgement` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of coke_acknowledgement_child
-- ----------------------------
INSERT INTO `coke_acknowledgement_child` VALUES ('4', '4', null, '85', '85', 'Yes', null, null, null, null, null, '2019-04-17 09:59:48', '2019-04-17 09:59:48');

-- ----------------------------
-- Table structure for `coke_challan`
-- ----------------------------
DROP TABLE IF EXISTS `coke_challan`;
CREATE TABLE `coke_challan` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `consignment_id` int(10) DEFAULT NULL,
  `challan_no` varchar(255) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `from_id` varchar(20) DEFAULT NULL,
  `from` varchar(255) DEFAULT NULL,
  `to_id` varchar(20) DEFAULT NULL,
  `to` varchar(255) DEFAULT NULL,
  `consignment_no` varchar(50) DEFAULT NULL,
  `con_date` date DEFAULT NULL,
  `destination` varchar(255) DEFAULT NULL,
  `truck_no` varchar(255) DEFAULT NULL,
  `engine_no` varchar(255) DEFAULT NULL,
  `chassis_no` varchar(255) DEFAULT NULL,
  `make` varchar(255) DEFAULT NULL,
  `owners_name` varchar(255) DEFAULT NULL,
  `owners_address` varchar(255) DEFAULT NULL,
  `owners_phone` varchar(255) DEFAULT NULL,
  `pan_applicable` varchar(255) DEFAULT NULL,
  `pan_no` varchar(255) DEFAULT NULL,
  `pan_name` varchar(255) DEFAULT NULL,
  `pan_of` varchar(255) DEFAULT NULL,
  `declaration_submitted` varchar(255) DEFAULT NULL,
  `broker` varchar(255) DEFAULT NULL,
  `broker_id` varchar(10) DEFAULT NULL,
  `broker_name` varchar(255) DEFAULT NULL,
  `broker_phone` varchar(255) DEFAULT NULL,
  `broker_slip_no` varchar(255) DEFAULT NULL,
  `insurance_name` varchar(255) DEFAULT NULL,
  `policy_no` varchar(255) DEFAULT NULL,
  `drivers_id` varchar(20) DEFAULT NULL,
  `drivers_name` varchar(255) DEFAULT NULL,
  `drivers_contact_no` varchar(255) DEFAULT NULL,
  `drivers_address` varchar(255) DEFAULT NULL,
  `license_no` varchar(255) DEFAULT NULL,
  `place_of_issue` varchar(255) DEFAULT NULL,
  `balance_payable_at_id` varchar(20) DEFAULT NULL,
  `balance_payable_at` varchar(255) DEFAULT NULL,
  `freight` varchar(255) DEFAULT NULL,
  `diesel` varchar(255) DEFAULT NULL,
  `cash_advance` varchar(255) DEFAULT NULL,
  `balance` varchar(255) DEFAULT NULL,
  `status` int(2) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `in_word` varchar(255) DEFAULT NULL,
  `petrol_pump_id` int(10) DEFAULT NULL,
  `insurance_place_issue` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `coke_consignment_id` (`consignment_id`),
  CONSTRAINT `coke_consignment_id` FOREIGN KEY (`consignment_id`) REFERENCES `cock_consignment` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of coke_challan
-- ----------------------------
INSERT INTO `coke_challan` VALUES ('4', null, '114311', '2019-03-05', '6', 'FATAPUKUR', '3', 'BARAUNI', null, null, null, 'NL01AB8399', '81C84465037', 'MAT46661J5C09433', 'TATA MOTORS', 'NARESH PD CHOUDHARI', 'DEOGARH JHARKHAND', '9110949717', 'Yes', 'AOCPC5964R', '', 'Driver', 'Yes', 'No', null, null, null, null, '', '', '9', 'NARESH PD CHOUDHARY', '9110949717', 'JHARKHAND', 'JH1519910025369', '', '1', 'SILIGURI', '19000', '7000', '10000', '2000', '0', '2019-03-14 21:21:58', '2019-03-14 21:21:58', 'Two Thousand Rupees  Only', '2', '');
INSERT INTO `coke_challan` VALUES ('5', null, '114314', '2019-03-06', '6', 'FATAPUKUR', '3', 'BARAUNI', null, null, null, 'RJ23GA3143', '01A62831198', 'MAT466372A5A00301', 'TATA MOTORS', 'JAGAT SINGH', 'SANGANER JAIPUR', '9667736662', 'Yes', 'GLPPS0696G', '', 'Driver', 'Yes', 'Yes', '71', 'JAIPUR JORHAT TRANSPORT COMPANY', '9832567772', '', '', '', '10', 'JAGAT SINGH', '9667736662', 'JAIPUR', 'RJ34ADLC1328225', '', '1', 'SILIGURI', '18500', '5000', '11500', '2000', '0', '2019-03-14 21:31:05', '2019-03-14 21:31:05', 'Two Thousand Rupees  Only', '2', '');
INSERT INTO `coke_challan` VALUES ('6', null, '114315', '2019-03-06', '6', 'FATAPUKUR', '3', 'BARAUNI', null, null, null, 'RJ05GA6735', '01G62906591', 'MAT466372A5H07280', 'TATA MOTORS LTD', 'HEMRAJ', 'KAGAYA PATTIMAHU KARAULI', '9461842141', 'Yes', 'AQYPH2814D', '', 'Driver', 'Yes', 'Yes', '71', 'JAIPUR JORHAT TRANSPORT COMPANY', '9832567772', '', '', '', '11', 'HEMRAJ', '9983313187', 'KARAULI', 'RJ3420100049694', '', '1', 'SILIGURI', '18500', '5000', '11500', '2000', '0', '2019-03-14 21:34:52', '2019-03-14 21:34:52', 'Two Thousand Rupees  Only', '2', '');
INSERT INTO `coke_challan` VALUES ('7', null, '114551', '2019-04-03', '1', 'SILIGURI', '2', 'GUWAHATI', null, null, null, 'WB73B6290', 'SLTBB136044', 'MBUWEL4XBB0142532', 'SWARAJ MAZDA LTD', 'BHAICHUNG BHUTIA', 'DARJEELING', '7602343996', 'No', null, null, null, 'No', 'No', null, null, null, null, 'BAZAZ', '12315431', '1', 'SAJJAD ALI', '9832670733', 'TLP BAGDOGRA DARJEELING', 'WB7320020366314', 'SILIGURI', '1', 'SILIGURI', '10000', '0', '0', '10000', '0', '2019-04-03 07:20:28', '2019-04-03 07:20:28', 'Ten Thousands Rupees  Only', null, 'Jaipur');
INSERT INTO `coke_challan` VALUES ('11', null, '114310', '2019-04-16', '1', 'SILIGURI', '2', 'GUWAHATI', null, null, null, 'WB73B7316', 'SLTEB139574', 'MBUWEL4XEB0146128', 'SWARAJ MAZDA LTD', 'NAKUL CHETTRI', 'MAHANANDI BAZAR, KURSEONG, WEST BENGAL', '8906850150', '', 'adsada', null, 'Driver', 'No', 'No', null, null, null, null, 'BAZAZ', 'asdasdas', '5', 'PRADIP DAS', '978494984894', 'SILIGURI', '77904/TV/Z/10', 'NAGALAND', '1', 'SILIGURI', '120000', '', '1000', '119000', '0', '2019-04-16 05:31:41', '2019-04-16 05:33:37', 'One Lakh Nineteen Thousands Rupees  Only', '0', 'asdasd');

-- ----------------------------
-- Table structure for `coke_challan_child`
-- ----------------------------
DROP TABLE IF EXISTS `coke_challan_child`;
CREATE TABLE `coke_challan_child` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `challan_id` int(10) DEFAULT NULL,
  `consignment_id` int(10) DEFAULT NULL,
  `category` varchar(225) DEFAULT NULL,
  `package` int(255) DEFAULT NULL,
  `net_weight` int(255) DEFAULT NULL,
  `gross_weight` int(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `coke_challan_id` (`challan_id`),
  CONSTRAINT `coke_challan_id` FOREIGN KEY (`challan_id`) REFERENCES `coke_challan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of coke_challan_child
-- ----------------------------

-- ----------------------------
-- Table structure for `coke_challan_child2`
-- ----------------------------
DROP TABLE IF EXISTS `coke_challan_child2`;
CREATE TABLE `coke_challan_child2` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `challan_id` int(10) DEFAULT NULL,
  `consignment_id` int(10) DEFAULT NULL,
  `consignment_no` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `total_package` varchar(255) DEFAULT NULL,
  `total_net_weight` varchar(255) DEFAULT NULL,
  `total_gross_weight` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of coke_challan_child2
-- ----------------------------
INSERT INTO `coke_challan_child2` VALUES ('6', '4', '9', '114311', '2019-03-14 21:21:58', '2019-03-14 21:21:58', '906', '15', '15');
INSERT INTO `coke_challan_child2` VALUES ('7', '5', '8', '114314', '2019-03-14 21:31:05', '2019-03-14 21:31:05', '830', '16', '16');
INSERT INTO `coke_challan_child2` VALUES ('8', '6', '21', '114315', '2019-03-14 21:34:52', '2019-03-14 21:34:52', '1031', '15', '15');
INSERT INTO `coke_challan_child2` VALUES ('9', '7', '180', '114551', '2019-04-03 07:20:28', '2019-04-03 07:20:28', '224', '6', '6');
INSERT INTO `coke_challan_child2` VALUES ('19', '11', '6', '114310', '2019-04-16 05:33:37', '2019-04-16 05:33:37', '257', '6', '6');

-- ----------------------------
-- Table structure for `coke_challan_child3`
-- ----------------------------
DROP TABLE IF EXISTS `coke_challan_child3`;
CREATE TABLE `coke_challan_child3` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `challan_id` int(10) DEFAULT NULL,
  `total_package` varchar(255) DEFAULT NULL,
  `total_net_weight` varchar(255) DEFAULT NULL,
  `total_gross_weight` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `coke_challan` (`challan_id`),
  CONSTRAINT `coke_challan` FOREIGN KEY (`challan_id`) REFERENCES `coke_challan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of coke_challan_child3
-- ----------------------------
INSERT INTO `coke_challan_child3` VALUES ('6', '4', '906', '15', '15', '2019-03-14 21:21:58', '2019-03-14 21:21:58');
INSERT INTO `coke_challan_child3` VALUES ('7', '5', '830', '16', '16', '2019-03-14 21:31:05', '2019-03-14 21:31:05');
INSERT INTO `coke_challan_child3` VALUES ('8', '6', '1031', '15', '15', '2019-03-14 21:34:52', '2019-03-14 21:34:52');
INSERT INTO `coke_challan_child3` VALUES ('9', '7', '224', '6', '6', '2019-04-03 07:20:28', '2019-04-03 07:20:28');
INSERT INTO `coke_challan_child3` VALUES ('19', '11', '257', '6', '6', '2019-04-16 05:33:37', '2019-04-16 05:33:37');

-- ----------------------------
-- Table structure for `consignment`
-- ----------------------------
DROP TABLE IF EXISTS `consignment`;
CREATE TABLE `consignment` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `consignment_no` varchar(255) DEFAULT NULL,
  `con_date` date DEFAULT NULL,
  `party_code` varchar(255) DEFAULT NULL,
  `billed_at_id` varchar(20) DEFAULT NULL,
  `billed_at` varchar(255) DEFAULT NULL,
  `from_id` varchar(20) DEFAULT NULL,
  `from` varchar(255) DEFAULT NULL,
  `to_id` varchar(20) DEFAULT NULL,
  `to` varchar(255) DEFAULT NULL,
  `consignor_id` varchar(10) DEFAULT NULL,
  `consignor_name` varchar(255) DEFAULT NULL,
  `consignee_name` varchar(255) DEFAULT NULL,
  `truck_type_id` varchar(20) DEFAULT NULL,
  `truck_type` varchar(255) DEFAULT NULL,
  `truck_no_id` varchar(20) DEFAULT NULL,
  `truck_no` varchar(255) DEFAULT NULL,
  `cn_value` varchar(255) DEFAULT NULL,
  `status` int(2) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `consignor_address` varchar(255) DEFAULT NULL,
  `consignee_address` varchar(255) DEFAULT NULL,
  `created_user` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`consignment_no`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of consignment
-- ----------------------------
INSERT INTO `consignment` VALUES ('2', '441047', '2019-03-07', '44', '1', 'SILIGURI', '18', 'FULBARI', '', 'GUWAHATI', '', 'ITC LIMITED -EDUCATION & STATIONERY', 'ITC LIMITED -EDUCATION & STATIONERY', '2', 'HCV.16', '13', 'NL02K8060', '2141121.58', '0', '2019-03-08 16:18:48', '2019-03-08 16:18:48', 'C/o Super Treads Private Limited, 14P, Dabgarm, Indl Growth Centre, Satellite Township, Fulbari Siliguri, West Bengal 734015', 'WSP SANGITA ENTERPRISES, KRISHNA FINBUILT PVT. LTD. COMPOUND L.P. SCHOOL ROAD GUWAHATI 781033, WEST BORAGAON NH 37 ASSAM', 'Naveen Kumar');

-- ----------------------------
-- Table structure for `consignment_cancellation`
-- ----------------------------
DROP TABLE IF EXISTS `consignment_cancellation`;
CREATE TABLE `consignment_cancellation` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `consignment_no` varchar(255) DEFAULT NULL,
  `cancellation_date` date DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of consignment_cancellation
-- ----------------------------

-- ----------------------------
-- Table structure for `consignment_child`
-- ----------------------------
DROP TABLE IF EXISTS `consignment_child`;
CREATE TABLE `consignment_child` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `consignment_id` int(10) NOT NULL,
  `invoice_no` varchar(255) DEFAULT NULL,
  `invoice_date` date DEFAULT NULL,
  `invoice_value` varchar(255) DEFAULT NULL,
  `way_bill_no` varchar(100) DEFAULT NULL,
  `validity` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`consignment_id`),
  CONSTRAINT `consignment_child_ibfk_1` FOREIGN KEY (`consignment_id`) REFERENCES `consignment` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of consignment_child
-- ----------------------------
INSERT INTO `consignment_child` VALUES ('3', '2', 'J19A519121000075', '2019-03-07', '2141121.58', '861042101489', '2019-03-13', '2019-03-08 16:18:48', '2019-03-08 16:18:48');

-- ----------------------------
-- Table structure for `consignment_child2`
-- ----------------------------
DROP TABLE IF EXISTS `consignment_child2`;
CREATE TABLE `consignment_child2` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `consignment_id` int(10) NOT NULL,
  `category_id` varchar(20) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `package` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `net_weight` varchar(255) DEFAULT NULL,
  `gross_weight` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`consignment_id`),
  CONSTRAINT `consignment_child2_ibfk_1` FOREIGN KEY (`consignment_id`) REFERENCES `consignment` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of consignment_child2
-- ----------------------------
INSERT INTO `consignment_child2` VALUES ('3', '2', '1', 'NOTE BOOK', '590', 'PAPER', '16', '16', '', '2019-03-08 16:18:48', '2019-03-08 16:18:48');

-- ----------------------------
-- Table structure for `consignment_serial_no`
-- ----------------------------
DROP TABLE IF EXISTS `consignment_serial_no`;
CREATE TABLE `consignment_serial_no` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `consignment_serial_no` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of consignment_serial_no
-- ----------------------------
INSERT INTO `consignment_serial_no` VALUES ('1', '6', '2019-04-01 14:03:51', '2019-04-01 14:03:51');

-- ----------------------------
-- Table structure for `doctor`
-- ----------------------------
DROP TABLE IF EXISTS `doctor`;
CREATE TABLE `doctor` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `specialist` varchar(255) DEFAULT NULL,
  `consultation_fees` varchar(20) DEFAULT NULL,
  `gender` varchar(20) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `mobile_no` varchar(20) DEFAULT NULL,
  `phone_no_home` varchar(20) DEFAULT NULL,
  `phone_no_clinic` varchar(20) DEFAULT NULL,
  `email_id` varchar(50) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of doctor
-- ----------------------------

-- ----------------------------
-- Table structure for `driver`
-- ----------------------------
DROP TABLE IF EXISTS `driver`;
CREATE TABLE `driver` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `truck_driver_name` varchar(255) DEFAULT NULL,
  `truck_driver_license_no` varchar(255) DEFAULT NULL,
  `truck_driver_license_palce_of_issue` varchar(255) DEFAULT NULL,
  `truck_driver_address` varchar(255) DEFAULT NULL,
  `truck_driver_mob_no` varchar(255) DEFAULT NULL,
  `truck_driver_contact_no` varchar(255) DEFAULT NULL,
  `truck_driver_land_line_no` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`truck_driver_name`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of driver
-- ----------------------------
INSERT INTO `driver` VALUES ('1', 'SAJJAD ALI', 'WB7320020366314', 'SILIGURI', 'TLP BAGDOGRA DARJEELING', '9832670733', '', '', '2018-12-22 10:45:40', '2018-12-22 10:45:40');
INSERT INTO `driver` VALUES ('2', 'ASHADUL MIDYA', 'WB67-20110012691', 'BANKURA', 'SONAMUKHI BANKURA', '983291766', '', '', '2018-12-25 09:27:58', '2018-12-25 09:27:58');
INSERT INTO `driver` VALUES ('3', 'KAMLESH KUMAR', 'UP8320160009319', 'FIROZABAD', 'KHADIT JASRANA FIROZABAD', '8954694060', '', '', '2018-12-29 16:24:52', '2018-12-29 16:24:52');
INSERT INTO `driver` VALUES ('4', 'KULDEEP KUMAR', 'UP5820020025311', 'SANT KABIR NAGAR', '', '9667658028', '', '', '2019-01-12 16:09:51', '2019-01-19 16:05:26');
INSERT INTO `driver` VALUES ('5', 'PRADIP DAS', '77904/TV/Z/10', 'NAGALAND', 'SILIGURI', '', '9932955250', '', '2019-02-06 11:56:03', '2019-02-06 11:56:03');
INSERT INTO `driver` VALUES ('6', 'NAKUL CHETTRI', 'WB6018', 'KURSEONG', 'KURSEONG', '8906850150', '', '', '2019-03-05 18:24:27', '2019-03-05 18:25:35');
INSERT INTO `driver` VALUES ('7', 'NIYAMUL ANSARI', 'WB4120070225629', 'BURDWAN', 'PANAGARH, BURDWAN', '8116776167', '', '', '2019-03-07 11:59:46', '2019-03-07 11:59:46');
INSERT INTO `driver` VALUES ('8', 'AJAY RAY', 'WB7320090276575', 'NAGALAND', 'SILIGURI', '9800159820', '', '', '2019-03-08 16:25:33', '2019-03-08 16:25:33');
INSERT INTO `driver` VALUES ('9', 'NARESH PD CHOUDHARY', 'JH1519910025369', '', 'JHARKHAND', '9110949717', '', '', '2019-03-14 21:21:13', '2019-03-14 21:21:13');
INSERT INTO `driver` VALUES ('10', 'JAGAT SINGH', 'RJ34ADLC1328225', '', 'JAIPUR', '9667736662', '', '', '2019-03-14 21:30:28', '2019-03-14 21:30:28');
INSERT INTO `driver` VALUES ('11', 'HEMRAJ', 'RJ3420100049694', '', 'KARAULI', '9983313187', '', '', '2019-03-14 21:34:19', '2019-03-14 21:34:19');

-- ----------------------------
-- Table structure for `driver_images`
-- ----------------------------
DROP TABLE IF EXISTS `driver_images`;
CREATE TABLE `driver_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `driver_id` int(11) DEFAULT NULL,
  `licence_front` varchar(255) DEFAULT NULL,
  `licence_back` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `driver` (`driver_id`),
  CONSTRAINT `driver` FOREIGN KEY (`driver_id`) REFERENCES `driver` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of driver_images
-- ----------------------------
INSERT INTO `driver_images` VALUES ('1', '7', 'front', 'back', '2019-03-07 11:59:46', '2019-03-07 11:59:46');

-- ----------------------------
-- Table structure for `freightbill_child`
-- ----------------------------
DROP TABLE IF EXISTS `freightbill_child`;
CREATE TABLE `freightbill_child` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `freight_bill_id` int(10) NOT NULL,
  `consignment_no` varchar(25) DEFAULT NULL,
  `rate_of_cgst` varchar(10) DEFAULT NULL,
  `cgst_amount` varchar(10) DEFAULT NULL,
  `rate_of_sgst` varchar(10) DEFAULT NULL,
  `sgst_amount` varchar(10) DEFAULT NULL,
  `rate_of_igst` varchar(10) DEFAULT NULL,
  `igst_amount` varchar(10) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `freight_bill_id` (`freight_bill_id`),
  CONSTRAINT `freight_bill_id` FOREIGN KEY (`freight_bill_id`) REFERENCES `freight_bill` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of freightbill_child
-- ----------------------------

-- ----------------------------
-- Table structure for `freight_bill`
-- ----------------------------
DROP TABLE IF EXISTS `freight_bill`;
CREATE TABLE `freight_bill` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `bill_date` date DEFAULT NULL,
  `branch_code` varchar(25) DEFAULT NULL,
  `bill_no` varchar(25) NOT NULL,
  `party_code` varchar(25) DEFAULT NULL,
  `consignment_type` varchar(25) DEFAULT NULL,
  `gst_type` varchar(25) DEFAULT NULL,
  `consignment_no` varchar(25) DEFAULT NULL,
  `qty` int(25) DEFAULT NULL,
  `freight` int(25) DEFAULT NULL,
  `detention` varchar(25) DEFAULT NULL,
  `labour` int(25) DEFAULT NULL,
  `cock_lr_no` varchar(50) DEFAULT NULL,
  `invoice_no` varchar(25) DEFAULT NULL,
  `snt_charge` int(25) DEFAULT NULL,
  `toll_tax` int(25) DEFAULT NULL,
  `weight` int(25) DEFAULT NULL,
  `total_amount` int(50) DEFAULT NULL,
  `rate_of_gst` int(25) DEFAULT NULL,
  `rate_of_igst` int(25) DEFAULT NULL,
  `net_amount` float(50,0) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `consignment_no` (`consignment_no`),
  CONSTRAINT `consignment_no` FOREIGN KEY (`consignment_no`) REFERENCES `acknowledgement` (`challan_number`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of freight_bill
-- ----------------------------

-- ----------------------------
-- Table structure for `indent`
-- ----------------------------
DROP TABLE IF EXISTS `indent`;
CREATE TABLE `indent` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `indent_no` varchar(50) DEFAULT NULL,
  `indent_date` date DEFAULT NULL,
  `branch_id` varchar(50) DEFAULT NULL,
  `branch_code` varchar(50) DEFAULT NULL,
  `origin_id` varchar(50) DEFAULT NULL,
  `origin` varchar(255) DEFAULT NULL,
  `destination` varchar(255) DEFAULT NULL,
  `consignor_id` varchar(50) DEFAULT NULL,
  `consignor_name` varchar(255) DEFAULT NULL,
  `party_code` varchar(100) DEFAULT NULL,
  `placement_ideal_date` date DEFAULT NULL,
  `truck_type_id` varchar(50) DEFAULT NULL,
  `truck_type` varchar(255) DEFAULT NULL,
  `material_id` varchar(50) DEFAULT NULL,
  `material` varchar(255) DEFAULT NULL,
  `tonnage` varchar(255) DEFAULT NULL,
  `rate` varchar(255) DEFAULT NULL,
  `per_tone_amount` varchar(10) DEFAULT NULL,
  `status` int(2) DEFAULT '0',
  `consignee` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`consignor_name`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of indent
-- ----------------------------
INSERT INTO `indent` VALUES ('1', 'IN0001', '2019-03-06', '1', '1101', '6', 'FATAPUKUR', null, '2', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', '2', '2019-03-07', null, null, '2', 'SOFT DRINK', null, null, null, '0', null, '2019-03-07 20:23:06', '2019-03-08 12:22:17');
INSERT INTO `indent` VALUES ('2', 'IN0002', '2019-03-07', '1', '1101', '6', 'FATAPUKUR', null, '2', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', '2', '2019-03-08', null, null, '2', 'SOFT DRINK', null, null, null, '0', null, '2019-03-07 20:26:39', '2019-03-08 17:00:36');
INSERT INTO `indent` VALUES ('3', 'IN0003', '2019-03-07', '1', '1101', '1', 'SILIGURI', null, '1', 'ITC LIMITED -EDUCATION & STATIONERY', '1', '2019-03-07', null, null, '1', 'NOTE BOOK', null, null, null, '0', null, '2019-03-07 21:19:36', '2019-03-07 21:19:36');
INSERT INTO `indent` VALUES ('4', 'IN0004', '2019-03-08', '1', '1101', '1', 'SILIGURI', null, '1', 'ITC LIMITED -EDUCATION & STATIONERY', '1', '2019-03-08', null, null, '1', 'NOTE BOOK', null, null, null, '0', null, '2019-03-08 16:05:36', '2019-03-08 16:05:36');
INSERT INTO `indent` VALUES ('5', 'IN0005', '2019-03-08', '1', '1101', '6', 'FATAPUKUR', null, '2', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', '2', '2019-03-09', null, null, '2', 'SOFT DRINK', null, null, null, '0', null, '2019-03-09 10:22:56', '2019-03-09 10:28:09');
INSERT INTO `indent` VALUES ('6', 'IN0006', '2019-03-09', '1', '1101', '6', 'FATAPUKUR', null, '2', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', '2', '2019-03-10', null, null, '2', 'SOFT DRINK', null, null, null, '0', null, '2019-03-11 10:09:27', '2019-03-11 11:24:02');
INSERT INTO `indent` VALUES ('7', 'IN0007', '2019-03-10', '1', '1101', '6', 'FATAPUKUR', null, '2', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', '2', '2019-03-11', null, null, '2', 'SOFT DRINK', null, null, null, '0', null, '2019-03-11 10:25:54', '2019-03-11 19:15:39');
INSERT INTO `indent` VALUES ('8', 'IN0008', '2019-03-11', '1', '1101', '6', 'FATAPUKUR', null, '2', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', '2', '2019-03-12', null, null, '2', 'SOFT DRINK', null, null, null, '0', null, '2019-03-11 22:15:38', '2019-03-12 21:37:58');
INSERT INTO `indent` VALUES ('10', 'IN0009', '2019-03-12', '1', '1101', '6', 'FATAPUKUR', null, '2', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', '2', '2019-03-13', null, null, '2', 'SOFT DRINK', null, null, null, '0', null, '2019-03-13 16:30:59', '2019-03-13 16:45:39');
INSERT INTO `indent` VALUES ('11', 'IN0011', '2019-03-27', '1', '1101', '6', 'FATAPUKUR', null, '2', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', '2', '2019-03-28', null, null, '2', 'SOFT DRINK', null, null, null, '0', null, '2019-03-27 19:02:57', '2019-03-28 09:42:05');
INSERT INTO `indent` VALUES ('12', 'IN0012', '2019-03-31', '1', '1101', '6', 'FATAPUKUR', null, '2', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', '2', '2019-04-01', null, null, '2', 'SOFT DRINK', null, null, null, '0', null, '2019-04-01 17:44:03', '2019-04-01 18:07:01');
INSERT INTO `indent` VALUES ('13', 'IN0013', '2019-04-01', '1', '1101', '6', 'FATAPUKUR', null, '2', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', '2', '2019-04-02', null, null, '2', 'SOFT DRINK', null, null, null, '0', null, '2019-04-01 18:11:03', '2019-04-05 04:48:07');

-- ----------------------------
-- Table structure for `indentplacement_child`
-- ----------------------------
DROP TABLE IF EXISTS `indentplacement_child`;
CREATE TABLE `indentplacement_child` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `indentplacement_id` int(10) DEFAULT NULL,
  `destination` varchar(255) DEFAULT NULL,
  `tonnage` varchar(255) DEFAULT NULL,
  `truck_type` varchar(255) DEFAULT NULL,
  `truck_no` varchar(255) DEFAULT NULL,
  `rate` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `mobile_no` varchar(255) DEFAULT NULL,
  `consignee` varchar(255) DEFAULT NULL,
  `broker_id` varchar(255) DEFAULT NULL,
  `broker` varchar(255) DEFAULT NULL,
  `indent_child_id` int(10) DEFAULT NULL,
  `indent_placement_date_child` date DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `indentplacement_id` (`indentplacement_id`),
  CONSTRAINT `indentplacement_id` FOREIGN KEY (`indentplacement_id`) REFERENCES `indent_placement` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=607 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of indentplacement_child
-- ----------------------------
INSERT INTO `indentplacement_child` VALUES ('36', '1', 'GUWAHATI', '16', 'HCV.16', 'NL02K8060', '24500', '2019-03-08 12:53:27', '2019-03-08 12:53:27', '8609329352', 'ITC LIMITED', null, 'DINESH ROADLINE', '15', '2019-03-07', null);
INSERT INTO `indentplacement_child` VALUES ('64', '2', 'DARJEELING', '6', 'LCV.6', 'WB73B6290', '6200', '2019-03-08 16:04:17', '2019-03-08 16:04:17', '7602343996', 'HIMALYA AGENCY', null, 'DIRECT', '1', '2019-03-07', null);
INSERT INTO `indentplacement_child` VALUES ('65', '2', 'DARJEELING', '6', 'LCV.6', 'WB73C4277', '6200', '2019-03-08 16:04:17', '2019-03-08 16:04:17', '', 'FUTURE RETAIL LTD', null, 'DIRECT', '2', '2019-03-08', null);
INSERT INTO `indentplacement_child` VALUES ('66', '2', 'ASANSOL', '16', 'HCV.16', 'UP78BT0456', '44000', '2019-03-08 16:04:17', '2019-03-08 16:04:17', '7980787779', 'HCCBPL', null, 'DIRECT', '3', '2019-03-08', null);
INSERT INTO `indentplacement_child` VALUES ('67', '2', 'ASANSOL', '16', 'HCV.16', 'WB11A7650', '46000', '2019-03-08 16:04:17', '2019-03-08 16:04:17', '6205771499', 'HCCBPL', null, 'DIRECT', '4', '2019-03-08', null);
INSERT INTO `indentplacement_child` VALUES ('68', '2', 'BANKURA', '15', 'HCV.15', 'WB37C0388', '19000', '2019-03-08 16:04:17', '2019-03-08 16:04:17', '8670661063', 'KK ENT', null, 'MAA SHANTI ROADWAYS', '5', '2019-03-07', null);
INSERT INTO `indentplacement_child` VALUES ('69', '2', 'SHEOHAR', '16', 'HCV.16', 'WB23C2601', '21500', '2019-03-08 16:04:17', '2019-03-08 16:04:17', '9733302248', 'ANAND TRADERS', null, 'DHARMA DA LOCAL', '6', '2019-03-07', null);
INSERT INTO `indentplacement_child` VALUES ('70', '2', 'SHEOHAR', '15', 'HCV.15', 'HR69A0939', '22000', '2019-03-08 16:04:17', '2019-03-08 16:04:17', '9991654535', 'MAA AMBEY ENTERPISES', null, 'PUNJAB GOLDEN TRANSPORT CO', '7', '2019-03-07', null);
INSERT INTO `indentplacement_child` VALUES ('71', '2', 'MUZAFFARPUR', '20', 'HCV.20', 'WB73D6936', '21000', '2019-03-08 16:04:17', '2019-03-08 16:04:17', '6299450434', 'HCCBPL', null, 'SS FREIGHT CARRIER', '8', '2019-03-07', null);
INSERT INTO `indentplacement_child` VALUES ('72', '2', 'MUZAFFARPUR', '20', 'HCV.20', 'NL01K7974', '21000', '2019-03-08 16:04:17', '2019-03-08 16:04:17', '9903190071', 'HCCBPL', null, 'PATNA BUXAR ROADLINE', '9', '2019-03-07', null);
INSERT INTO `indentplacement_child` VALUES ('73', '2', 'MOTHABARI', '9', 'LCV.9', 'WB57A8428', '7800', '2019-03-08 16:04:17', '2019-03-08 16:04:17', '7679849307', 'MAA DURGA AGENCY', null, 'BOSE ROADWAYS', '10', '2019-03-07', null);
INSERT INTO `indentplacement_child` VALUES ('74', '2', 'SITAMARHI', '15', 'HCV.15', 'WB41H1520', '21500', '2019-03-08 16:04:17', '2019-03-08 16:04:17', '9593154942', 'ARADHANA ENTERPRISES', null, 'BIHAR ROADLINE', '11', '2019-03-07', null);
INSERT INTO `indentplacement_child` VALUES ('75', '4', 'GUWAHATI', '16', 'HCV.16', 'WB73B4366', '24500', '2019-03-08 16:07:53', '2019-03-08 16:07:53', '', 'ITC LIMITED', null, 'DINESH ROADLINE', '19', '2019-03-08', null);
INSERT INTO `indentplacement_child` VALUES ('76', '3', 'DARJEELING', '6', 'LCV.6', 'WB73B7316', '6200', '2019-03-08 17:01:59', '2019-03-08 17:01:59', '8906850150', 'HIMALYA AGENCY', null, 'DIRECT', '12', '2019-03-08', null);
INSERT INTO `indentplacement_child` VALUES ('77', '3', 'DARJEELING', '6', 'LCV.6', 'WB73B6290', '6200', '2019-03-08 17:01:59', '2019-03-08 17:01:59', '7602343996', 'HIMALYA AGENCY', null, 'DIRECT', '13', '2019-03-08', null);
INSERT INTO `indentplacement_child` VALUES ('78', '3', 'SHEOHAR', '15', 'HCV.15', 'RJ02GB3919', '22000', '2019-03-08 17:01:59', '2019-03-08 17:01:59', '7728924235', 'MAA AMBEY ENTERPRISES', null, 'JAIPUR JORHAT TRANSPORT COMPANY', '14', '2019-03-08', null);
INSERT INTO `indentplacement_child` VALUES ('79', '3', 'BETTIAH', '15', 'HCV.15', 'HR658407', '23500', '2019-03-08 17:01:59', '2019-03-08 17:01:59', '8002373755', 'KD FOOD', null, 'PUNJAB GOLDEN TRANSPORT CO', '16', '2019-03-08', null);
INSERT INTO `indentplacement_child` VALUES ('80', '3', 'BETTIAH', '15', 'HCV.15', 'RJ14GD9178', '23000', '2019-03-08 17:01:59', '2019-03-08 17:01:59', '7426947240', 'KD FOOD', null, 'JAIPUR JORHAT TRANSPORT COMPANY', '17', '2019-03-08', null);
INSERT INTO `indentplacement_child` VALUES ('81', '3', 'CHHAURADANOW', '15', 'HCV.15', 'NL08A4529', '21500', '2019-03-08 17:01:59', '2019-03-08 17:01:59', '7079593415', 'LAXMI ENTERPRISES', null, 'BHAGWAT ROADLINES ', '20', '2019-03-08', null);
INSERT INTO `indentplacement_child` VALUES ('102', '5', 'CHHAURADANOW', '16', 'HCV.16', 'JH02G7611', '23000', '2019-03-11 11:14:15', '2019-03-11 11:14:15', '6203336438', 'LAXMI ENTERPRISES', null, 'PATNA BUXAR ROADLINE', '21', '2019-03-09', null);
INSERT INTO `indentplacement_child` VALUES ('103', '5', 'MUZAFFARPUR', '16', 'HCV.16', 'WB03C9855', '18000', '2019-03-11 11:14:15', '2019-03-11 11:14:15', '9007285930', 'HCCBPL', null, 'PATNA BUXAR ROADLINE', '22', '2019-03-09', null);
INSERT INTO `indentplacement_child` VALUES ('104', '5', 'MUZAFFARPUR', '20', 'HCV.20', 'UP65CT2458', '20000', '2019-03-11 11:14:15', '2019-03-11 11:14:15', '9451648156', 'HCCBPL', null, 'GAZIPUR VANARASH ROADWAYS', '23', '2019-03-09', null);
INSERT INTO `indentplacement_child` VALUES ('105', '5', 'NALANDA', '16', 'HCV.16', 'CG12AR3805', '23500', '2019-03-11 11:14:15', '2019-03-11 11:14:15', '9113369768', 'NAUCEEMA TRADING', null, 'SANJAY ROADLINE', '24', '2019-03-09', null);
INSERT INTO `indentplacement_child` VALUES ('136', '6', 'NAWADA', '16', 'HCV.16', 'JH02T8671', '25000', '2019-03-11 19:12:23', '2019-03-11 19:12:23', '8249482428', 'KAVITANJALI', null, 'BIHAR RANCHI CARRIER', '25', '2019-03-10', null);
INSERT INTO `indentplacement_child` VALUES ('137', '6', 'NALANDA', '16', 'HCV.16', 'BR25A2887', '24500', '2019-03-11 19:12:23', '2019-03-11 19:12:23', '6355441447', 'NAUSEEMA TRADERS', null, 'JAI MAA BHAWANI TRANSPORT', '26', '2019-03-10', null);
INSERT INTO `indentplacement_child` VALUES ('138', '6', 'RAJGIR', '16', 'HCV.16', 'JH10U3585', '25000', '2019-03-11 19:12:23', '2019-03-11 19:12:23', '9934193989', 'HHJKJ', null, 'AKBAR ', '27', '2019-03-10', null);
INSERT INTO `indentplacement_child` VALUES ('139', '6', 'SASARAM', '16', 'HCV.16', 'UP63T3563', '25000', '2019-03-11 19:12:23', '2019-03-11 19:12:23', '8953580488', 'RAJ ENTERPRISES', null, 'GAZIPUR VANARASH ROADWAYS', '28', '2019-03-10', null);
INSERT INTO `indentplacement_child` VALUES ('140', '6', 'GAYA', '16', 'HCV.16', 'UP63AT1953', '26000', '2019-03-11 19:12:23', '2019-03-11 19:12:23', '7487847875', 'MAA MANGLA TRADERS', null, 'BOMBAY FREIGHT CARRIER', '29', '2019-03-10', null);
INSERT INTO `indentplacement_child` VALUES ('141', '6', 'SHERGHATI', '16', 'HCV.16', 'MH04FJ6629', '27000', '2019-03-11 19:12:23', '2019-03-11 19:12:23', '9981958729', 'ALIZA ENTERPRISE', null, 'BOMBAY FREIGHT CARRIER', '30', '2019-03-10', null);
INSERT INTO `indentplacement_child` VALUES ('142', '6', 'MUZAFFARPUR', '20', 'HCV.20', 'UP63AT0462', '20000', '2019-03-11 19:12:23', '2019-03-11 19:12:23', '9893141196', 'HCCBPL', null, 'BOMBAY FREIGHT CARRIER', '31', '2019-03-10', null);
INSERT INTO `indentplacement_child` VALUES ('143', '6', 'RAIGUNJ', '9', 'LCV.9', 'WB25D3231', '6800', '2019-03-11 19:12:23', '2019-03-11 19:12:23', '6291177316', 'BISWANATH NUHWAL', null, 'SAMRAT ROADWAYS', '38', '2019-03-10', null);
INSERT INTO `indentplacement_child` VALUES ('150', '7', 'MUZAFFARPUR', '20', 'HCV.20', 'HR39B8009', '20000', '2019-03-11 19:19:32', '2019-03-11 19:19:32', '8294854381', 'HCCBPL', null, 'DIRECT', '32', '2019-03-11', null);
INSERT INTO `indentplacement_child` VALUES ('151', '7', 'MUZAFFARPUR', '20', 'HCV.20', 'AS01JC6800', '20000', '2019-03-11 19:19:32', '2019-03-11 19:19:32', '', 'HCCBPL', null, 'NEW SILIGURI AGARTALA ROADWAYS', '33', '2019-03-11', null);
INSERT INTO `indentplacement_child` VALUES ('152', '7', 'MUZAFFARPUR', '16', 'HCV.16', 'NL01Q5915', '18000', '2019-03-11 19:19:32', '2019-03-11 19:19:32', '7260947323', 'HCCBPL', null, 'S S ROADLINES', '34', '2019-03-11', null);
INSERT INTO `indentplacement_child` VALUES ('153', '7', 'DARJEELING', '6', 'LCV.6', 'WB73B7316', '6200', '2019-03-11 19:19:32', '2019-03-11 19:19:32', '', 'HIMALAYA AGENCY', null, 'DIRECT', '36', '2019-03-11', null);
INSERT INTO `indentplacement_child` VALUES ('154', '7', 'DARJEELING', '6', 'LCV.6', 'WB73C1432', '6000', '2019-03-11 19:19:32', '2019-03-11 19:19:32', '9735003938', 'HIMALAYA AGENCY', null, 'DIRECT', '37', '2019-03-11', null);
INSERT INTO `indentplacement_child` VALUES ('281', '8', 'NAWADA', '16', 'HCV.16', 'UP21CN0515', '24500', '2019-03-13 13:07:51', '2019-03-13 13:07:51', '', 'KAVITANJALI ENTERPRISES', null, 'DIRECT', '39', '2019-03-12', '');
INSERT INTO `indentplacement_child` VALUES ('282', '8', 'NAWADA', '16', 'HCV.16', 'WB23A9838', '24500', '2019-03-13 13:07:51', '2019-03-13 13:07:51', '', 'KAVITANJALI ENTERPRISES', null, 'GAZIPUR VANARASH ROADWAYS', '40', '2019-03-12', '');
INSERT INTO `indentplacement_child` VALUES ('283', '8', 'NAWADA', '16', 'HCV.16', 'WB03C7792', '24500', '2019-03-13 13:07:51', '2019-03-13 13:07:51', '', 'M M ENTERPRISES', null, 'GAZIPUR VANARASH ROADWAYS', '41', '2019-03-12', '');
INSERT INTO `indentplacement_child` VALUES ('284', '8', 'BETTIAH', '16', 'HCV.16', 'WB23C2705', '23000', '2019-03-13 13:07:51', '2019-03-13 13:07:51', '', 'SIKARIYA TRADERS', null, 'PULAK DUTTA', '42', '2019-03-12', '');
INSERT INTO `indentplacement_child` VALUES ('285', '8', 'SHEIKHPURA', '16', 'HCV.16', 'WB41C2547', '24500', '2019-03-13 13:07:51', '2019-03-13 13:07:51', '', 'KRISHI KUNJ', null, 'BINOD FULBARI', '43', '2019-03-12', '');
INSERT INTO `indentplacement_child` VALUES ('286', '8', 'JAMUI', '16', 'HCV.16', 'WB41J3853', '23500', '2019-03-13 13:07:51', '2019-03-13 13:07:51', '6361647452', 'RAVI COLD DRINK CHAKAI', null, 'BINOD FULBARI', '44', '2019-03-12', '');
INSERT INTO `indentplacement_child` VALUES ('287', '8', 'BIHARSARIF', '16', 'HCV.16', 'UP63AT4028', '25000', '2019-03-13 13:07:51', '2019-03-13 13:07:51', '', 'GOODWILL TELE AGENCY', null, 'BOMBAY FREIGHT CARRIER', '45', '2019-03-12', '');
INSERT INTO `indentplacement_child` VALUES ('288', '8', 'JAMUI', '16', 'HCV.16', 'WB41H0730', '24000', '2019-03-13 13:07:51', '2019-03-13 13:07:51', '', 'SRI RADHE RADHE ENTERPRISES', null, 'BINOD FULBARI', '46', '2019-03-12', '');
INSERT INTO `indentplacement_child` VALUES ('289', '8', 'SAKRI', '16', 'HCV.16', 'HR38F0556', '18000', '2019-03-13 13:07:51', '2019-03-13 13:07:51', '', 'PANKAJ AGENCY', null, 'DIRECT', '47', '2019-03-12', '');
INSERT INTO `indentplacement_child` VALUES ('290', '8', 'GHORASAHAN', '16', 'HCV.16', 'WB23C2373', '24500', '2019-03-13 13:07:51', '2019-03-13 13:07:51', '', 'PAWAN TRADERS', null, 'KHOKHAN DA', '48', '2019-03-12', '');
INSERT INTO `indentplacement_child` VALUES ('291', '8', 'LAKHISARAI', '16', 'HCV.16', 'NL01K5031', '22000', '2019-03-13 13:07:51', '2019-03-13 13:07:51', '', 'OM SAI AGENCY', null, 'PATNA BUXAR ROADLINE', '49', '2019-03-12', '');
INSERT INTO `indentplacement_child` VALUES ('292', '8', 'JAMALPUR', '16', 'HCV.16', 'WB41C2357', '24500', '2019-03-13 13:07:51', '2019-03-13 13:07:51', '', 'BHARTI ENTERPRISES', null, 'BINOD FULBARI', '50', '2019-03-12', '');
INSERT INTO `indentplacement_child` VALUES ('293', '8', 'JAGDISHPUR', '16', 'HCV.16', 'MP20HB5467', '25500', '2019-03-13 13:07:51', '2019-03-13 13:07:51', '', 'GUPTA ENTERPRISES', null, 'BOMBAY FREIGHT CARRIER', '51', '2019-03-12', '');
INSERT INTO `indentplacement_child` VALUES ('294', '8', 'DARBHANGA', '16', 'HCV.16', 'WB33A9947', '18000', '2019-03-13 13:07:51', '2019-03-13 13:07:51', '', 'BALAJI AGENCY', null, 'MEDNIPUR SAMBALPUR ROADWAYS', '52', '2019-03-12', '');
INSERT INTO `indentplacement_child` VALUES ('295', '8', 'JAYNAGAR', '16', 'HCV.16', 'HR69C7177', '21000', '2019-03-13 13:07:51', '2019-03-13 13:07:51', '', 'DADEE MAA LAXMI ENTERPRISES', null, 'RAJPUT ROAD CARRIER', '53', '2019-03-12', '');
INSERT INTO `indentplacement_child` VALUES ('296', '8', 'MADHUBANI', '16', 'HCV.16', 'WB03D0155', '17500', '2019-03-13 13:07:51', '2019-03-13 13:07:51', '', 'VIKASH ENTERPRISES', null, 'DIRECT', '54', '2019-03-12', '');
INSERT INTO `indentplacement_child` VALUES ('297', '8', 'ASANSOL', '16', 'HCV.16', 'WB37B8492', '16000', '2019-03-13 13:07:51', '2019-03-13 13:07:51', '', 'RELIANCE RETAIL', null, 'DIRECT', '55', '2019-03-12', '');
INSERT INTO `indentplacement_child` VALUES ('298', '8', 'DARJEELING', '6', 'LCV.6', 'WB73B7316', '6200', '2019-03-13 13:07:51', '2019-03-13 13:07:51', '', 'HIMALYA AGENCY', null, 'DIRECT', '56', '2019-03-12', '');
INSERT INTO `indentplacement_child` VALUES ('299', '8', 'DARJEELING', '6', 'LCV.6', 'WB73C1432', '6000', '2019-03-13 13:07:51', '2019-03-13 13:07:51', '', 'HIMALYA AGENCY', null, 'DIRECT', '57', '2019-03-12', '');
INSERT INTO `indentplacement_child` VALUES ('300', '8', 'MUZAFFARPUR', '16', 'HCV.16', 'UP13AT1609', '18000', '2019-03-13 13:07:51', '2019-03-13 13:07:51', '', 'HCCBPL', null, 'DELHI TINSUKIYA TRANSPORT', '58', '2019-03-12', '');
INSERT INTO `indentplacement_child` VALUES ('301', '8', 'MUZAFFARPUR', '20', 'HCV.20', 'HR55P8967', '20000', '2019-03-13 13:07:51', '2019-03-13 13:07:51', '', 'HCCBPL', null, 'DELHI TINSUKIYA TRANSPORT', '59', '2019-03-12', '');
INSERT INTO `indentplacement_child` VALUES ('334', '9', 'DARBHANGA', '16', 'HCV.16', 'HR55N7256', '19000', '2019-03-14 17:51:04', '2019-03-14 17:51:04', '', 'MAA ENTERPRISES BAHERI', null, 'UP BENGAL ROADLINE', '102', '2019-03-13', '');
INSERT INTO `indentplacement_child` VALUES ('335', '9', 'SUPAUL', '16', 'HCV.16', 'RJ09GA0385', '18000', '2019-03-14 17:51:04', '2019-03-14 17:51:04', '9928048896', 'SHAKTI ENTERPRISES', null, 'PUNJAB GOLDEN TRANSPORT CO', '103', '2019-03-13', '');
INSERT INTO `indentplacement_child` VALUES ('336', '9', 'ASANSOL', '16', 'HCV.16', 'WB23B1474', '15500', '2019-03-14 17:51:04', '2019-03-14 17:51:04', '7585876249', 'RELIANCE RETAIL', null, 'DIRECT', '104', '2019-03-13', '');
INSERT INTO `indentplacement_child` VALUES ('337', '9', 'BEGUSARAI', '16', 'HCV.16', 'WB23C2197', '19000', '2019-03-14 17:51:04', '2019-03-14 17:51:04', '6906213827', 'RANJHAN KUMAR', null, 'NEW SILIGURI AGARTALA ROADWAYS', '105', '2019-02-14', '');
INSERT INTO `indentplacement_child` VALUES ('338', '9', 'CHANPATIYA', '16', 'HCV.16', 'UP78CN2770', '25000', '2019-03-14 17:51:04', '2019-03-14 17:51:04', '6397840525', 'KUMAR STORE ', null, 'UP BENGAL ROADLINE', '106', '2019-02-13', '');
INSERT INTO `indentplacement_child` VALUES ('339', '9', 'BHOJPUR', '16', 'HCV.16', 'MP53AJ1969', '25000', '2019-03-14 17:51:04', '2019-03-14 17:51:04', '8827653766', 'VAISHNAVI ENTERPRISES GARHANI', null, 'BOMBAY FREIGHT CARRIER', '107', '2019-02-13', '');
INSERT INTO `indentplacement_child` VALUES ('340', '9', 'MOHIUDDINAGAR', '16', 'HCV.16', 'HR55V1494', '21000', '2019-03-14 17:51:04', '2019-03-14 17:51:04', '9934641048', 'SATNAM AGENCY', null, 'DIRECT', '108', '2019-02-13', '');
INSERT INTO `indentplacement_child` VALUES ('341', '9', 'BEGUSARAI', '16', 'HCV.16', 'OD16B1152', '20000', '2019-03-14 17:51:04', '2019-03-14 17:51:04', '', 'PARTIMA ENTERPRISES BALLIA', null, 'SAROJ ROADLINES', '109', '2019-02-13', '');
INSERT INTO `indentplacement_child` VALUES ('342', '9', 'ROHTAS', '16', 'HCV.16', 'MP20HB5760', '25000', '2019-03-14 17:51:04', '2019-03-14 17:51:04', '9522732694', 'SN ENTRPRISES', null, 'BOMBAY FREIGHT CARRIER', '110', '2019-02-13', '');
INSERT INTO `indentplacement_child` VALUES ('343', '9', 'ROHTAS', '16', 'HCV.16', 'MP19HH3499', '25000', '2019-03-14 17:51:04', '2019-03-14 17:51:04', '7477045173', 'SHIVAM TRADERS', null, 'BOMBAY FREIGHT CARRIER', '111', '2019-02-13', '');
INSERT INTO `indentplacement_child` VALUES ('344', '9', 'MIRIK', '6', 'LCV.6', 'WB73B6290', '', '2019-03-14 17:51:04', '2019-03-14 17:51:04', '', 'GAYTRI STORE', null, '', '112', '2019-02-13', '');
INSERT INTO `indentplacement_child` VALUES ('345', '9', 'DARBHANGA', '16', 'HCV.16', 'UP13AT1728', '18000', '2019-03-14 17:51:04', '2019-03-14 17:51:04', '9568067837', 'BALAJI AGENCY', null, 'UP GOLDEN CARRIER', '113', '2019-02-13', '');
INSERT INTO `indentplacement_child` VALUES ('346', '9', 'PURULIYA', '16', 'HCV.16', 'JH11E2305', '24000', '2019-03-14 17:51:04', '2019-03-14 17:51:04', '9608054689', 'SUBIR KR HALDAR', null, 'BIHAR ROADLINE', '114', '2019-02-14', '');
INSERT INTO `indentplacement_child` VALUES ('347', '9', 'ROHTAS', '16', 'HCV.16', 'MP17HH1528', '25000', '2019-03-14 17:51:04', '2019-03-14 17:51:04', '', 'SHIVAM TRADERS', null, 'BOMBAY FREIGHT CARRIER', '115', '2019-02-13', '');
INSERT INTO `indentplacement_child` VALUES ('348', '9', 'BHAGALPUR', '16', 'HCV.16', 'WB39B4446', '16500', '2019-03-14 17:51:04', '2019-03-14 17:51:04', '9851618466', 'ANJALI TRADERS', null, 'DIRECT', '116', '2019-02-13', '');
INSERT INTO `indentplacement_child` VALUES ('349', '9', 'BHAGALPUR', '16', 'HCV.16', 'NL01N7749', '17000', '2019-03-14 17:51:04', '2019-03-14 17:51:04', '', 'AMIT TRADERS SABOUR', null, 'PATNA BUXAR ROADLINE', '117', '2019-02-13', '');
INSERT INTO `indentplacement_child` VALUES ('350', '9', 'NAUGACHHIA', '16', 'HCV.16', 'WB73E4370', '14000', '2019-03-14 17:51:04', '2019-03-14 17:51:04', '7432853638', 'MARUTI TRADERS', null, 'PATNA BUXAR ROADLINE', '118', '2019-02-13', '');
INSERT INTO `indentplacement_child` VALUES ('351', '9', 'MADHUBANI', '16', 'HCV.16', '', '', '2019-03-14 17:51:04', '2019-03-14 17:51:04', '', 'ASHA DISTRIBUTORS', null, '', '119', null, '');
INSERT INTO `indentplacement_child` VALUES ('352', '9', 'DARBHANGA', '16', 'HCV.16', '', '', '2019-03-14 17:51:04', '2019-03-14 17:51:04', '', 'BALAJJEE AGENCY', null, '', '120', null, '');
INSERT INTO `indentplacement_child` VALUES ('353', '9', 'PURULIYA', '16', 'HCV.16', '', '', '2019-03-14 17:51:04', '2019-03-14 17:51:04', '', 'SUBIR KR HALDAR', null, '', '121', null, '');
INSERT INTO `indentplacement_child` VALUES ('354', '9', 'MUZAFFARPUR', '20', 'HCV.20', '', '', '2019-03-14 17:51:04', '2019-03-14 17:51:04', '', 'HCCBPL', null, '', '122', null, '');
INSERT INTO `indentplacement_child` VALUES ('355', '9', 'MUZAFFARPUR', '20', 'HCV.20', '', '', '2019-03-14 17:51:04', '2019-03-14 17:51:04', '', 'HCCBPL', null, '', '123', null, '');
INSERT INTO `indentplacement_child` VALUES ('356', '9', 'MUZAFFARPUR', '20', 'HCV.20', '', '', '2019-03-14 17:51:04', '2019-03-14 17:51:04', '', 'HCCBPL', null, '', '124', null, '');
INSERT INTO `indentplacement_child` VALUES ('357', '9', 'MUZAFFARPUR', '20', 'HCV.20', '', '', '2019-03-14 17:51:04', '2019-03-14 17:51:04', '', 'HCCBPL', null, '', '125', null, '');
INSERT INTO `indentplacement_child` VALUES ('358', '9', 'MUZAFFARPUR', '20', 'HCV.20', '', '', '2019-03-14 17:51:04', '2019-03-14 17:51:04', '', 'HCCBPL', null, '', '126', null, '');
INSERT INTO `indentplacement_child` VALUES ('359', '9', 'MUZAFFARPUR', '20', 'HCV.20', '', '', '2019-03-14 17:51:04', '2019-03-14 17:51:04', '', 'HCCBPL', null, '', '127', null, '');
INSERT INTO `indentplacement_child` VALUES ('360', '9', 'MUZAFFARPUR', '20', 'HCV.20', '', '', '2019-03-14 17:51:04', '2019-03-14 17:51:04', '', 'HCCBPL', null, '', '128', null, '');
INSERT INTO `indentplacement_child` VALUES ('361', '9', 'MUZAFFARPUR', '20', 'HCV.20', '', '', '2019-03-14 17:51:04', '2019-03-14 17:51:04', '', 'HCCBPL', null, '', '129', null, '');
INSERT INTO `indentplacement_child` VALUES ('362', '9', 'MUZAFFARPUR', '20', 'HCV.20', '', '', '2019-03-14 17:51:04', '2019-03-14 17:51:04', '', 'HCCBPL', null, '', '130', null, '');
INSERT INTO `indentplacement_child` VALUES ('363', '9', 'DARJEELING', '6', 'LCV.6', '', '', '2019-03-14 17:51:04', '2019-03-14 17:51:04', '', 'HIMALYA AGENCY', null, '', '131', null, '');
INSERT INTO `indentplacement_child` VALUES ('364', '9', 'DARJEELING', '6', 'LCV.6', '', '', '2019-03-14 17:51:04', '2019-03-14 17:51:04', '', 'HIMALYA AGENCY', null, '', '132', null, '');
INSERT INTO `indentplacement_child` VALUES ('365', '9', 'MADHUBANI', '16', 'HCV.16', '', '', '2019-03-14 17:51:04', '2019-03-14 17:51:04', '', 'ASHA DISTRIBUTORS', null, '', '133', null, '');
INSERT INTO `indentplacement_child` VALUES ('391', '10', 'BETTIAH', '20', 'HCV.20', 'HR39B8009', '27500', '2019-04-02 10:37:58', '2019-04-02 10:37:58', '8294854381', 'K D FOOD', null, 'DIRECT', '144', '2019-04-02', '');
INSERT INTO `indentplacement_child` VALUES ('392', '10', 'KATSA', '20', 'HCV.20', 'MP20HB9887', '26500', '2019-04-02 10:37:58', '2019-04-02 10:37:58', '6265520147', 'MUSKAN ENTERPRISES', null, 'BOMBAY FREIGHT CARRIER', '145', '2019-04-01', '');
INSERT INTO `indentplacement_child` VALUES ('393', '10', 'DARJEELING', '6', 'LCV.6', 'WB73B7316', '5700', '2019-04-02 10:37:58', '2019-04-02 10:37:58', '8906850150', 'HIMALYA AGENCY', null, 'DIRECT', '146', '2019-04-01', '');
INSERT INTO `indentplacement_child` VALUES ('394', '10', 'MIRIK', '6', 'LCV.6', 'WB73B6290', '5500', '2019-04-02 10:37:58', '2019-04-02 10:37:58', '7602343996', 'GAYTRI STORE', null, 'DIRECT', '147', '2019-04-01', '');
INSERT INTO `indentplacement_child` VALUES ('395', '10', 'SILIGURI', '6', 'LCV.6', 'WB73D5343', '000', '2019-04-02 10:37:58', '2019-04-02 10:37:58', '7550908731', 'FUTURE RETAIL ', null, 'DIRECT', '148', '2019-04-01', '');
INSERT INTO `indentplacement_child` VALUES ('599', '17', 'DARJEELING', '6', 'LCV.6', '1', '', '2019-04-05 04:51:54', '2019-04-05 04:51:54', '', 'HIMALAYA AGENCY', null, '', '149', null, '');
INSERT INTO `indentplacement_child` VALUES ('600', '17', 'DARJEELING', '6', 'LCV.6', '2', '', '2019-04-05 04:51:54', '2019-04-05 04:51:54', '', 'HIMALAYA AGENCY', null, '', '150', null, '');
INSERT INTO `indentplacement_child` VALUES ('601', '17', 'MUZAFFARPUR', '20', 'HCV.20', 'wadasdasd', '', '2019-04-05 04:51:54', '2019-04-05 04:51:54', '', 'HCCBPL', null, '', '152', null, '');
INSERT INTO `indentplacement_child` VALUES ('602', '17', 'MUZAFFARPUR', '20', 'HCV.20', '12345665', '', '2019-04-05 04:51:54', '2019-04-05 04:51:54', '', 'HCCBPL', null, '', '153', null, '');
INSERT INTO `indentplacement_child` VALUES ('603', '17', 'DHOBHI', '16', 'HCV.16', '', '', '2019-04-05 04:51:54', '2019-04-05 04:51:54', '', 'J K ENTERPRISES', null, '', '154', null, '');
INSERT INTO `indentplacement_child` VALUES ('604', '17', 'FORBISGUNJ', '16', 'HCV.16', '456', '5000', '2019-04-05 04:51:54', '2019-04-05 04:51:54', '5645', 'RAMAN ENTERPRISES', null, 'GAZIPUR VANARASH ROADWAYS', '155', '2019-04-02', '');
INSERT INTO `indentplacement_child` VALUES ('605', '17', 'UDAKISHANGUNJ', '16', 'HCV.16', '', '', '2019-04-05 04:51:54', '2019-04-05 04:51:54', '', 'SHEETAL ENTERPRISES', null, '', '156', null, '');
INSERT INTO `indentplacement_child` VALUES ('606', '17', 'GUWAHATI', '25', 'LCV.9', '2212112754', '', '2019-04-05 04:51:54', '2019-04-05 04:51:54', '', 'Jason', null, '', '161', null, '');

-- ----------------------------
-- Table structure for `indent_child`
-- ----------------------------
DROP TABLE IF EXISTS `indent_child`;
CREATE TABLE `indent_child` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `indent_id` int(10) DEFAULT NULL,
  `destination` varchar(255) DEFAULT NULL,
  `tonnage` varchar(255) DEFAULT NULL,
  `truck_type` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `truck_type_id` int(10) DEFAULT NULL,
  `consignee` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `indent` (`indent_id`),
  CONSTRAINT `indent` FOREIGN KEY (`indent_id`) REFERENCES `indent` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=162 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of indent_child
-- ----------------------------
INSERT INTO `indent_child` VALUES ('1', '1', 'DARJEELING', '6', 'LCV.6', '2019-03-07 20:23:06', '2019-03-07 20:23:06', '1', 'HIMALYA AGENCY');
INSERT INTO `indent_child` VALUES ('2', '1', 'DARJEELING', '6', 'LCV.6', '2019-03-07 20:23:06', '2019-03-07 20:23:06', '1', 'FUTURE RETAIL LTD');
INSERT INTO `indent_child` VALUES ('3', '1', 'ASANSOL', '16', 'HCV.16', '2019-03-07 20:23:06', '2019-03-07 20:23:06', '2', 'HCCBPL');
INSERT INTO `indent_child` VALUES ('4', '1', 'ASANSOL', '16', 'HCV.16', '2019-03-07 20:23:06', '2019-03-07 20:23:06', '2', 'HCCBPL');
INSERT INTO `indent_child` VALUES ('5', '1', 'BANKURA', '15', 'HCV.15', '2019-03-07 20:23:06', '2019-03-07 20:23:06', '3', 'KK ENT');
INSERT INTO `indent_child` VALUES ('6', '1', 'SHEOHAR', '16', 'HCV.16', '2019-03-08 12:22:17', '2019-03-08 12:22:17', '2', 'ANAND TRADERS');
INSERT INTO `indent_child` VALUES ('7', '1', 'SHEOHAR', '15', 'HCV.15', '2019-03-08 12:22:17', '2019-03-08 12:22:17', '3', 'MAA AMBEY ENTERPISES');
INSERT INTO `indent_child` VALUES ('8', '1', 'MUZAFFARPUR', '20', 'HCV.20', '2019-03-07 20:23:06', '2019-03-07 20:23:06', '4', 'HCCBPL');
INSERT INTO `indent_child` VALUES ('9', '1', 'MUZAFFARPUR', '20', 'HCV.20', '2019-03-07 20:23:06', '2019-03-07 20:23:06', '4', 'HCCBPL');
INSERT INTO `indent_child` VALUES ('10', '1', 'MOTHABARI', '9', 'LCV.9', '2019-03-08 12:22:17', '2019-03-08 12:22:17', '5', 'MAA DURGA AGENCY');
INSERT INTO `indent_child` VALUES ('11', '1', 'SITAMARHI', '15', 'HCV.15', '2019-03-08 12:22:17', '2019-03-08 12:22:17', '3', 'ARADHANA ENTERPRISES');
INSERT INTO `indent_child` VALUES ('12', '2', 'DARJEELING', '6', 'LCV.6', '2019-03-07 20:26:39', '2019-03-07 20:26:39', '1', 'HIMALYA AGENCY');
INSERT INTO `indent_child` VALUES ('13', '2', 'DARJEELING', '6', 'LCV.6', '2019-03-07 20:26:39', '2019-03-07 20:26:39', '1', 'HIMALYA AGENCY');
INSERT INTO `indent_child` VALUES ('14', '2', 'SHEOHAR', '15', 'HCV.15', '2019-03-07 20:26:39', '2019-03-07 20:26:39', '3', 'MAA AMBEY ENTERPRISES');
INSERT INTO `indent_child` VALUES ('15', '3', 'GUWAHATI', '16', 'HCV.16', '2019-03-07 21:19:36', '2019-03-07 21:19:36', '2', 'ITC LIMITED');
INSERT INTO `indent_child` VALUES ('16', '2', 'BETTIAH', '15', 'HCV.15', '2019-03-08 15:03:37', '2019-03-08 15:03:37', '3', 'KD FOOD');
INSERT INTO `indent_child` VALUES ('17', '2', 'BETTIAH', '15', 'HCV.15', '2019-03-08 15:03:37', '2019-03-08 15:03:37', '3', 'KD FOOD');
INSERT INTO `indent_child` VALUES ('19', '4', 'GUWAHATI', '16', 'HCV.16', '2019-03-08 16:05:36', '2019-03-08 16:05:36', '2', 'ITC LIMITED');
INSERT INTO `indent_child` VALUES ('20', '2', 'CHHAURADANOW', '15', 'HCV.15', '2019-03-08 17:00:36', '2019-03-08 17:00:36', '3', 'LAXMI ENTERPRISES');
INSERT INTO `indent_child` VALUES ('21', '5', 'CHHAURADANOW', '16', 'HCV.16', '2019-03-09 10:22:56', '2019-03-09 10:22:56', '2', 'LAXMI ENTERPRISES');
INSERT INTO `indent_child` VALUES ('22', '5', 'MUZAFFARPUR', '16', 'HCV.16', '2019-03-09 10:22:56', '2019-03-09 10:22:56', '2', 'HCCBPL');
INSERT INTO `indent_child` VALUES ('23', '5', 'MUZAFFARPUR', '20', 'HCV.20', '2019-03-09 10:22:56', '2019-03-09 10:22:56', '4', 'HCCBPL');
INSERT INTO `indent_child` VALUES ('24', '5', 'NALANDA', '16', 'HCV.16', '2019-03-09 10:28:09', '2019-03-09 10:28:09', '2', 'NAUCEEMA TRADING');
INSERT INTO `indent_child` VALUES ('25', '6', 'NAWADA', '16', 'HCV.16', '2019-03-11 10:23:08', '2019-03-11 10:23:08', '2', 'KAVITANJALI');
INSERT INTO `indent_child` VALUES ('26', '6', 'NALANDA', '16', 'HCV.16', '2019-03-11 11:24:02', '2019-03-11 11:24:02', '2', 'NAUSEEMA TRADERS');
INSERT INTO `indent_child` VALUES ('27', '6', 'RAJGIR', '16', 'HCV.16', '2019-03-11 11:24:02', '2019-03-11 11:24:02', '2', 'HHJKJ');
INSERT INTO `indent_child` VALUES ('28', '6', 'SASARAM', '16', 'HCV.16', '2019-03-11 11:24:02', '2019-03-11 11:24:02', '2', 'RAJ ENTERPRISES');
INSERT INTO `indent_child` VALUES ('29', '6', 'GAYA', '16', 'HCV.16', '2019-03-11 11:24:02', '2019-03-11 11:24:02', '2', 'MAA MANGLA TRADERS');
INSERT INTO `indent_child` VALUES ('30', '6', 'SHERGHATI', '16', 'HCV.16', '2019-03-11 11:24:02', '2019-03-11 11:24:02', '2', 'ALIZA ENTERPRISE');
INSERT INTO `indent_child` VALUES ('31', '6', 'MUZAFFARPUR', '20', 'HCV.20', '2019-03-11 10:23:08', '2019-03-11 10:23:08', '4', 'HCCBPL');
INSERT INTO `indent_child` VALUES ('32', '7', 'MUZAFFARPUR', '20', 'HCV.20', '2019-03-11 10:25:54', '2019-03-11 10:25:54', '4', 'HCCBPL');
INSERT INTO `indent_child` VALUES ('33', '7', 'MUZAFFARPUR', '20', 'HCV.20', '2019-03-11 10:25:54', '2019-03-11 10:25:54', '4', 'HCCBPL');
INSERT INTO `indent_child` VALUES ('34', '7', 'MUZAFFARPUR', '16', 'HCV.16', '2019-03-11 10:25:54', '2019-03-11 10:25:54', '2', 'HCCBPL');
INSERT INTO `indent_child` VALUES ('36', '7', 'DARJEELING', '6', 'LCV.6', '2019-03-11 10:25:54', '2019-03-11 10:25:54', '1', 'HIMALAYA AGENCY');
INSERT INTO `indent_child` VALUES ('37', '7', 'DARJEELING', '6', 'LCV.6', '2019-03-11 10:25:54', '2019-03-11 10:25:54', '1', 'HIMALAYA AGENCY');
INSERT INTO `indent_child` VALUES ('38', '6', 'RAIGUNJ', '9', 'LCV.9', '2019-03-11 11:24:02', '2019-03-11 11:24:02', '5', 'BISWANATH NUHWAL');
INSERT INTO `indent_child` VALUES ('39', '8', 'NAWADA', '16', 'HCV.16', '2019-03-11 22:15:38', '2019-03-11 22:15:38', '2', 'KAVITANJALI ENTERPRISES');
INSERT INTO `indent_child` VALUES ('40', '8', 'NAWADA', '16', 'HCV.16', '2019-03-11 22:15:38', '2019-03-11 22:15:38', '2', 'KAVITANJALI ENTERPRISES');
INSERT INTO `indent_child` VALUES ('41', '8', 'NAWADA', '16', 'HCV.16', '2019-03-11 22:15:38', '2019-03-11 22:15:38', '2', 'M M ENTERPRISES');
INSERT INTO `indent_child` VALUES ('42', '8', 'BETTIAH', '16', 'HCV.16', '2019-03-11 22:15:38', '2019-03-11 22:15:38', '2', 'SIKARIYA TRADERS');
INSERT INTO `indent_child` VALUES ('43', '8', 'SHEIKHPURA', '16', 'HCV.16', '2019-03-12 09:08:21', '2019-03-12 09:08:21', '2', 'KRISHI KUNJ');
INSERT INTO `indent_child` VALUES ('44', '8', 'JAMUI', '16', 'HCV.16', '2019-03-12 09:08:21', '2019-03-12 09:08:21', '2', 'RAVI COLD DRINK CHAKAI');
INSERT INTO `indent_child` VALUES ('45', '8', 'BIHARSARIF', '16', 'HCV.16', '2019-03-12 09:08:21', '2019-03-12 09:08:21', '2', 'GOODWILL TELE AGENCY');
INSERT INTO `indent_child` VALUES ('46', '8', 'JAMUI', '16', 'HCV.16', '2019-03-12 09:08:21', '2019-03-12 09:08:21', '2', 'SRI RADHE RADHE ENTERPRISES');
INSERT INTO `indent_child` VALUES ('47', '8', 'SAKRI', '16', 'HCV.16', '2019-03-12 09:22:40', '2019-03-12 09:22:40', '2', 'PANKAJ AGENCY');
INSERT INTO `indent_child` VALUES ('48', '8', 'GHORASAHAN', '16', 'HCV.16', '2019-03-12 09:22:40', '2019-03-12 09:22:40', '2', 'PAWAN TRADERS');
INSERT INTO `indent_child` VALUES ('49', '8', 'LAKHISARAI', '16', 'HCV.16', '2019-03-12 09:22:40', '2019-03-12 09:22:40', '2', 'OM SAI AGENCY');
INSERT INTO `indent_child` VALUES ('50', '8', 'JAMALPUR', '16', 'HCV.16', '2019-03-12 09:22:40', '2019-03-12 09:22:40', '2', 'BHARTI ENTERPRISES');
INSERT INTO `indent_child` VALUES ('51', '8', 'JAGDISHPUR', '16', 'HCV.16', '2019-03-12 09:22:40', '2019-03-12 09:22:40', '2', 'GUPTA ENTERPRISES');
INSERT INTO `indent_child` VALUES ('52', '8', 'DARBHANGA', '16', 'HCV.16', '2019-03-12 09:22:40', '2019-03-12 09:22:40', '2', 'BALAJI AGENCY');
INSERT INTO `indent_child` VALUES ('53', '8', 'JAYNAGAR', '16', 'HCV.16', '2019-03-12 09:22:40', '2019-03-12 09:22:40', '2', 'DADEE MAA LAXMI ENTERPRISES');
INSERT INTO `indent_child` VALUES ('54', '8', 'MADHUBANI', '16', 'HCV.16', '2019-03-12 09:22:40', '2019-03-12 09:22:40', '2', 'VIKASH ENTERPRISES');
INSERT INTO `indent_child` VALUES ('55', '8', 'ASANSOL', '16', 'HCV.16', '2019-03-12 09:22:40', '2019-03-12 09:22:40', '2', 'RELIANCE RETAIL');
INSERT INTO `indent_child` VALUES ('56', '8', 'DARJEELING', '6', 'LCV.6', '2019-03-12 09:22:40', '2019-03-12 09:22:40', '1', 'HIMALYA AGENCY');
INSERT INTO `indent_child` VALUES ('57', '8', 'DARJEELING', '6', 'LCV.6', '2019-03-12 09:22:40', '2019-03-12 09:22:40', '1', 'HIMALYA AGENCY');
INSERT INTO `indent_child` VALUES ('58', '8', 'MUZAFFARPUR', '16', 'HCV.16', '2019-03-12 09:22:40', '2019-03-12 09:22:40', '2', 'HCCBPL');
INSERT INTO `indent_child` VALUES ('59', '8', 'MUZAFFARPUR', '20', 'HCV.20', '2019-03-12 09:22:40', '2019-03-12 09:22:40', '4', 'HCCBPL');
INSERT INTO `indent_child` VALUES ('102', '10', 'DARBHANGA', '16', 'HCV.16', '2019-03-13 16:30:59', '2019-03-13 16:30:59', '2', 'MAA ENTERPRISES BAHERI');
INSERT INTO `indent_child` VALUES ('103', '10', 'SUPAUL', '16', 'HCV.16', '2019-03-13 16:30:59', '2019-03-13 16:30:59', '2', 'SHAKTI ENTERPRISES');
INSERT INTO `indent_child` VALUES ('104', '10', 'ASANSOL', '16', 'HCV.16', '2019-03-13 16:30:59', '2019-03-13 16:30:59', '2', 'RELIANCE RETAIL');
INSERT INTO `indent_child` VALUES ('105', '10', 'BEGUSARAI', '16', 'HCV.16', '2019-03-13 16:30:59', '2019-03-13 16:30:59', '2', 'RANJHAN KUMAR');
INSERT INTO `indent_child` VALUES ('106', '10', 'CHANPATIYA', '16', 'HCV.16', '2019-03-13 16:30:59', '2019-03-13 16:30:59', '2', 'KUMAR STORE ');
INSERT INTO `indent_child` VALUES ('107', '10', 'BHOJPUR', '16', 'HCV.16', '2019-03-13 16:30:59', '2019-03-13 16:30:59', '2', 'VAISHNAVI ENTERPRISES GARHANI');
INSERT INTO `indent_child` VALUES ('108', '10', 'MOHIUDDINAGAR', '16', 'HCV.16', '2019-03-13 16:30:59', '2019-03-13 16:30:59', '2', 'SATNAM AGENCY');
INSERT INTO `indent_child` VALUES ('109', '10', 'BEGUSARAI', '16', 'HCV.16', '2019-03-13 16:30:59', '2019-03-13 16:30:59', '2', 'PARTIMA ENTERPRISES BALLIA');
INSERT INTO `indent_child` VALUES ('110', '10', 'ROHTAS', '16', 'HCV.16', '2019-03-13 16:30:59', '2019-03-13 16:30:59', '2', 'SN ENTRPRISES');
INSERT INTO `indent_child` VALUES ('111', '10', 'ROHTAS', '16', 'HCV.16', '2019-03-13 16:30:59', '2019-03-13 16:30:59', '2', 'SHIVAM TRADERS');
INSERT INTO `indent_child` VALUES ('112', '10', 'MIRIK', '6', 'LCV.6', '2019-03-13 16:45:25', '2019-03-13 16:45:25', '1', 'GAYTRI STORE');
INSERT INTO `indent_child` VALUES ('113', '10', 'DARBHANGA', '16', 'HCV.16', '2019-03-13 16:45:25', '2019-03-13 16:45:25', '2', 'BALAJI AGENCY');
INSERT INTO `indent_child` VALUES ('114', '10', 'PURULIYA', '16', 'HCV.16', '2019-03-13 16:45:25', '2019-03-13 16:45:25', '2', 'SUBIR KR HALDAR');
INSERT INTO `indent_child` VALUES ('115', '10', 'ROHTAS', '16', 'HCV.16', '2019-03-13 16:45:25', '2019-03-13 16:45:25', '2', 'SHIVAM TRADERS');
INSERT INTO `indent_child` VALUES ('116', '10', 'BHAGALPUR', '16', 'HCV.16', '2019-03-13 16:45:25', '2019-03-13 16:45:25', '2', 'ANJALI TRADERS');
INSERT INTO `indent_child` VALUES ('117', '10', 'BHAGALPUR', '16', 'HCV.16', '2019-03-13 16:45:25', '2019-03-13 16:45:25', '2', 'AMIT TRADERS SABOUR');
INSERT INTO `indent_child` VALUES ('118', '10', 'NAUGACHHIA', '16', 'HCV.16', '2019-03-13 16:45:25', '2019-03-13 16:45:25', '2', 'MARUTI TRADERS');
INSERT INTO `indent_child` VALUES ('119', '10', 'MADHUBANI', '16', 'HCV.16', '2019-03-13 16:45:25', '2019-03-13 16:45:25', '2', 'ASHA DISTRIBUTORS');
INSERT INTO `indent_child` VALUES ('120', '10', 'DARBHANGA', '16', 'HCV.16', '2019-03-13 16:45:25', '2019-03-13 16:45:25', '2', 'BALAJJEE AGENCY');
INSERT INTO `indent_child` VALUES ('121', '10', 'PURULIYA', '16', 'HCV.16', '2019-03-13 16:45:25', '2019-03-13 16:45:25', '2', 'SUBIR KR HALDAR');
INSERT INTO `indent_child` VALUES ('122', '10', 'MUZAFFARPUR', '20', 'HCV.20', '2019-03-13 16:45:25', '2019-03-13 16:45:25', '4', 'HCCBPL');
INSERT INTO `indent_child` VALUES ('123', '10', 'MUZAFFARPUR', '20', 'HCV.20', '2019-03-13 16:45:25', '2019-03-13 16:45:25', '4', 'HCCBPL');
INSERT INTO `indent_child` VALUES ('124', '10', 'MUZAFFARPUR', '20', 'HCV.20', '2019-03-13 16:45:25', '2019-03-13 16:45:25', '4', 'HCCBPL');
INSERT INTO `indent_child` VALUES ('125', '10', 'MUZAFFARPUR', '20', 'HCV.20', '2019-03-13 16:45:25', '2019-03-13 16:45:25', '4', 'HCCBPL');
INSERT INTO `indent_child` VALUES ('126', '10', 'MUZAFFARPUR', '20', 'HCV.20', '2019-03-13 16:45:25', '2019-03-13 16:45:25', '4', 'HCCBPL');
INSERT INTO `indent_child` VALUES ('127', '10', 'MUZAFFARPUR', '20', 'HCV.20', '2019-03-13 16:45:25', '2019-03-13 16:45:25', '4', 'HCCBPL');
INSERT INTO `indent_child` VALUES ('128', '10', 'MUZAFFARPUR', '20', 'HCV.20', '2019-03-13 16:45:25', '2019-03-13 16:45:25', '4', 'HCCBPL');
INSERT INTO `indent_child` VALUES ('129', '10', 'MUZAFFARPUR', '20', 'HCV.20', '2019-03-13 16:45:25', '2019-03-13 16:45:25', '4', 'HCCBPL');
INSERT INTO `indent_child` VALUES ('130', '10', 'MUZAFFARPUR', '20', 'HCV.20', '2019-03-13 16:45:25', '2019-03-13 16:45:25', '4', 'HCCBPL');
INSERT INTO `indent_child` VALUES ('131', '10', 'DARJEELING', '6', 'LCV.6', '2019-03-13 16:45:25', '2019-03-13 16:45:25', '1', 'HIMALYA AGENCY');
INSERT INTO `indent_child` VALUES ('132', '10', 'DARJEELING', '6', 'LCV.6', '2019-03-13 16:45:25', '2019-03-13 16:45:25', '1', 'HIMALYA AGENCY');
INSERT INTO `indent_child` VALUES ('133', '10', 'MADHUBANI', '16', 'HCV.16', '2019-03-13 16:45:25', '2019-03-13 16:45:25', '2', 'ASHA DISTRIBUTORS');
INSERT INTO `indent_child` VALUES ('134', '11', 'MUZAFFARPUR', '20', 'HCV.20', '2019-03-27 19:02:57', '2019-03-27 19:02:57', '4', 'SUBHLAXMI ENTERPRISES');
INSERT INTO `indent_child` VALUES ('135', '11', 'DARJEELING', '6', 'LCV.6', '2019-03-27 19:02:57', '2019-03-27 19:02:57', '1', 'HIMALAYA AGENCY');
INSERT INTO `indent_child` VALUES ('136', '11', 'DARJEELING', '6', 'LCV.6', '2019-03-27 19:02:57', '2019-03-27 19:02:57', '1', 'HIMALAYA AGENCY');
INSERT INTO `indent_child` VALUES ('137', '11', 'JAMSHEDPUR', '16', 'HCV.16', '2019-03-28 09:42:05', '2019-03-28 09:42:05', '2', 'NANDINI BEVERAGES');
INSERT INTO `indent_child` VALUES ('138', '11', 'JAMSHEDPUR', '16', 'HCV.16', '2019-03-28 09:42:05', '2019-03-28 09:42:05', '2', 'NANDINI BEVERAGES');
INSERT INTO `indent_child` VALUES ('139', '11', 'PATNA', '20', 'HCV.20', '2019-03-28 09:42:05', '2019-03-28 09:42:05', '4', 'SHREE KRISHNA ENTERPRISES');
INSERT INTO `indent_child` VALUES ('140', '11', 'PATNA', '16', 'HCV.16', '2019-03-28 09:42:05', '2019-03-28 09:42:05', '2', 'SHREE KRISHNA ENTERPRISES');
INSERT INTO `indent_child` VALUES ('141', '11', 'PATNA', '16', 'HCV.16', '2019-03-28 09:42:05', '2019-03-28 09:42:05', '2', 'SHREE KRISHNA ENTERPRISES');
INSERT INTO `indent_child` VALUES ('142', '11', 'GUWAHATI', '16', 'HCV.16', '2019-03-28 09:42:05', '2019-03-28 09:42:05', '2', 'HCCBPL');
INSERT INTO `indent_child` VALUES ('143', '11', 'GUWAHATI', '16', 'HCV.16', '2019-03-28 09:42:05', '2019-03-28 09:42:05', '2', 'HCCBPL');
INSERT INTO `indent_child` VALUES ('144', '12', 'BETTIAH', '20', 'HCV.20', '2019-04-01 17:44:03', '2019-04-01 17:44:03', '4', 'K D FOOD');
INSERT INTO `indent_child` VALUES ('145', '12', 'KATSA', '20', 'HCV.20', '2019-04-01 17:44:03', '2019-04-01 17:44:03', '4', 'MUSKAN ENTERPRISES');
INSERT INTO `indent_child` VALUES ('146', '12', 'DARJEELING', '6', 'LCV.6', '2019-04-01 17:44:03', '2019-04-01 17:44:03', '1', 'HIMALYA AGENCY');
INSERT INTO `indent_child` VALUES ('147', '12', 'MIRIK', '6', 'LCV.6', '2019-04-01 17:44:03', '2019-04-01 17:44:03', '1', 'GAYTRI STORE');
INSERT INTO `indent_child` VALUES ('148', '12', 'SILIGURI', '6', 'LCV.6', '2019-04-01 17:44:03', '2019-04-01 17:44:03', '1', 'FUTURE RETAIL ');
INSERT INTO `indent_child` VALUES ('149', '13', 'DARJEELING', '6', 'LCV.6', '2019-04-01 18:11:03', '2019-04-01 18:11:03', '1', 'HIMALAYA AGENCY');
INSERT INTO `indent_child` VALUES ('150', '13', 'DARJEELING', '6', 'LCV.6', '2019-04-01 18:11:03', '2019-04-01 18:11:03', '1', 'HIMALAYA AGENCY');
INSERT INTO `indent_child` VALUES ('152', '13', 'MUZAFFARPUR', '20', 'HCV.20', '2019-04-01 18:16:44', '2019-04-01 18:16:44', '4', 'HCCBPL');
INSERT INTO `indent_child` VALUES ('153', '13', 'MUZAFFARPUR', '20', 'HCV.20', '2019-04-01 18:16:44', '2019-04-01 18:16:44', '4', 'HCCBPL');
INSERT INTO `indent_child` VALUES ('154', '13', 'DHOBHI', '16', 'HCV.16', '2019-04-01 19:46:56', '2019-04-01 19:46:56', '2', 'J K ENTERPRISES');
INSERT INTO `indent_child` VALUES ('155', '13', 'FORBISGUNJ', '16', 'HCV.16', '2019-04-01 19:46:56', '2019-04-01 19:46:56', '2', 'RAMAN ENTERPRISES');
INSERT INTO `indent_child` VALUES ('156', '13', 'UDAKISHANGUNJ', '16', 'HCV.16', '2019-04-01 19:46:56', '2019-04-01 19:46:56', '2', 'SHEETAL ENTERPRISES');
INSERT INTO `indent_child` VALUES ('161', '13', 'GUWAHATI', '25', 'LCV.9', '2019-04-05 04:48:08', '2019-04-05 04:48:08', '5', 'Jason');

-- ----------------------------
-- Table structure for `indent_child_connection`
-- ----------------------------
DROP TABLE IF EXISTS `indent_child_connection`;
CREATE TABLE `indent_child_connection` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `indentplacement_id` int(10) DEFAULT NULL,
  `destination` varchar(255) DEFAULT NULL,
  `tonnage` varchar(255) DEFAULT NULL,
  `truck_type` varchar(255) DEFAULT NULL,
  `truck_no` varchar(255) DEFAULT NULL,
  `rate` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `mobile_no` varchar(255) DEFAULT NULL,
  `consignee` varchar(255) DEFAULT NULL,
  `broker_id` varchar(255) DEFAULT NULL,
  `broker` varchar(255) DEFAULT NULL,
  `indent_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of indent_child_connection
-- ----------------------------

-- ----------------------------
-- Table structure for `indent_placement`
-- ----------------------------
DROP TABLE IF EXISTS `indent_placement`;
CREATE TABLE `indent_placement` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `indent_id` varchar(10) DEFAULT NULL,
  `indent_no` varchar(50) DEFAULT NULL,
  `indent_placement_date` date DEFAULT NULL,
  `origin` varchar(255) DEFAULT NULL,
  `branch_code` varchar(255) DEFAULT NULL,
  `party_code` varchar(255) DEFAULT NULL,
  `consignor_name` varchar(255) DEFAULT NULL,
  `vehicle_no` varchar(50) DEFAULT NULL,
  `tonnage` varchar(255) DEFAULT NULL,
  `rate` varchar(50) DEFAULT NULL,
  `per_tone_amount` varchar(50) DEFAULT NULL,
  `loading_staff` varchar(200) DEFAULT NULL,
  `cancel` varchar(50) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of indent_placement
-- ----------------------------
INSERT INTO `indent_placement` VALUES ('1', '3', 'IN0003', '2019-03-07', 'SILIGURI', '1101', '44', 'ITC LIMITED -EDUCATION & STATIONERY', null, null, null, null, null, null, null, '2019-03-07 21:20:38', '2019-03-08 12:53:27');
INSERT INTO `indent_placement` VALUES ('2', '1', 'IN0001', '2019-03-07', 'FATAPUKUR', '1101', '11', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', null, null, null, null, null, null, null, '2019-03-08 10:54:33', '2019-03-08 16:04:17');
INSERT INTO `indent_placement` VALUES ('3', '2', 'IN0002', '2019-03-08', 'FATAPUKUR', '1101', '11', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', null, null, null, null, null, null, null, '2019-03-08 15:56:42', '2019-03-08 17:01:59');
INSERT INTO `indent_placement` VALUES ('4', '4', 'IN0004', '2019-03-08', 'SILIGURI', '1101', '44', 'ITC LIMITED -EDUCATION & STATIONERY', null, null, null, null, null, null, null, '2019-03-08 16:07:53', '2019-03-08 16:07:53');
INSERT INTO `indent_placement` VALUES ('5', '5', 'IN0005', '2019-03-09', 'FATAPUKUR', '1101', '11', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', null, null, null, null, null, null, null, '2019-03-09 10:30:37', '2019-03-11 11:14:15');
INSERT INTO `indent_placement` VALUES ('6', '6', 'IN0006', '2019-03-10', 'FATAPUKUR', '1101', '11', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', null, null, null, null, null, null, null, '2019-03-11 11:21:56', '2019-03-11 19:12:23');
INSERT INTO `indent_placement` VALUES ('7', '7', 'IN0007', '2019-03-11', 'FATAPUKUR', '1101', '11', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', null, null, null, null, null, null, null, '2019-03-11 11:27:24', '2019-03-11 19:19:32');
INSERT INTO `indent_placement` VALUES ('8', '8', 'IN0008', '2019-03-12', 'FATAPUKUR', '1101', '11', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', null, null, null, null, null, null, null, '2019-03-12 20:36:47', '2019-03-13 13:07:51');
INSERT INTO `indent_placement` VALUES ('9', '10', 'IN0009', '2019-03-13', 'FATAPUKUR', '1101', '11', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', null, null, null, null, null, null, null, '2019-03-14 16:44:21', '2019-03-14 17:51:04');
INSERT INTO `indent_placement` VALUES ('10', '12', 'IN0012', '2019-04-01', 'FATAPUKUR', '1101', '11', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', null, null, null, null, null, null, null, '2019-04-01 17:49:25', '2019-04-02 10:37:58');
INSERT INTO `indent_placement` VALUES ('17', '13', 'IN0013', '2019-04-02', 'FATAPUKUR', '1101', '11', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', null, null, null, null, null, null, null, '2019-04-02 05:55:28', '2019-04-05 04:51:53');

-- ----------------------------
-- Table structure for `insurance`
-- ----------------------------
DROP TABLE IF EXISTS `insurance`;
CREATE TABLE `insurance` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `insurance_name` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`insurance_name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of insurance
-- ----------------------------
INSERT INTO `insurance` VALUES ('1', 'BAZAZ', '2018-07-18 12:20:22', '2018-07-18 12:20:22');
INSERT INTO `insurance` VALUES ('2', 'Hardwell Insurance with all kind of Value', '2018-12-12 17:27:44', '2018-12-12 17:27:44');
INSERT INTO `insurance` VALUES ('4', 'NATIONAL INSURANCE CO LTD', '2019-01-19 15:50:15', '2019-01-19 16:04:45');
INSERT INTO `insurance` VALUES ('5', 'TNIACL', '2019-03-07 15:45:09', '2019-03-08 16:28:13');

-- ----------------------------
-- Table structure for `location`
-- ----------------------------
DROP TABLE IF EXISTS `location`;
CREATE TABLE `location` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `city` varchar(255) DEFAULT NULL,
  `dist` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`city`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of location
-- ----------------------------
INSERT INTO `location` VALUES ('1', 'SILIGURI', '', 'WEST BENGAL', '2018-07-18 12:15:02', '2018-12-29 16:13:22');
INSERT INTO `location` VALUES ('2', 'GUWAHATI', '', 'ASSAM', '2018-12-29 16:17:31', '2018-12-29 16:17:31');
INSERT INTO `location` VALUES ('3', 'BARAUNI', '', 'BIHAR', '2019-03-05 14:35:01', '2019-03-05 14:35:01');
INSERT INTO `location` VALUES ('4', 'BETTIAH', '', 'BIHAR', '2019-03-05 14:35:12', '2019-03-05 14:35:12');
INSERT INTO `location` VALUES ('5', 'CHHAPRA', '', 'BIHAR', '2019-03-05 14:35:22', '2019-03-05 14:35:22');
INSERT INTO `location` VALUES ('6', 'FATAPUKUR', '', 'WEST BENGAL', '2019-03-05 14:36:32', '2019-03-05 14:36:32');
INSERT INTO `location` VALUES ('7', 'DARJEELING', 'DARJEELING', 'WEST BENGAL', '2019-03-05 17:40:52', '2019-03-05 17:40:52');
INSERT INTO `location` VALUES ('8', 'SUKIA', 'DARJEELING', 'WEST BENGAL', '2019-03-06 11:58:11', '2019-03-06 11:58:11');
INSERT INTO `location` VALUES ('9', 'BAGAHA', '', 'BIHAR', '2019-03-06 11:58:42', '2019-03-06 11:58:42');
INSERT INTO `location` VALUES ('10', 'ASANSOL', '', 'WEST BENGAL', '2019-03-06 12:18:07', '2019-03-06 12:18:07');
INSERT INTO `location` VALUES ('11', 'BANKURA', '', 'WEST BENGAL', '2019-03-06 21:51:51', '2019-03-06 21:51:51');
INSERT INTO `location` VALUES ('12', 'SITAMARHI', '', 'BIHAR', '2019-03-06 21:52:12', '2019-03-06 21:52:12');
INSERT INTO `location` VALUES ('13', 'MUZAFFARPUR', '', 'BIHAR', '2019-03-06 21:52:32', '2019-03-06 21:52:32');
INSERT INTO `location` VALUES ('14', 'SHEOHAR', '', 'BIHAR', '2019-03-06 21:52:48', '2019-03-06 21:52:48');
INSERT INTO `location` VALUES ('15', 'MOTHABARI', '', 'WEST BENGAL', '2019-03-06 22:02:39', '2019-03-06 22:02:39');
INSERT INTO `location` VALUES ('17', 'JAGDISHPUR', '', 'BIHAR', '2019-03-07 15:38:59', '2019-03-07 15:38:59');
INSERT INTO `location` VALUES ('18', 'FULBARI', '', 'WEST BENGAL', '2019-03-08 16:16:46', '2019-03-08 16:16:46');
INSERT INTO `location` VALUES ('19', 'CHHAURADANOW', '', 'BIHAR', '2019-03-08 16:58:51', '2019-03-08 16:58:51');
INSERT INTO `location` VALUES ('20', 'NALANDA', '', 'BIHAR', '2019-03-09 10:24:45', '2019-03-09 10:24:45');
INSERT INTO `location` VALUES ('21', 'NAWADA', '', 'BIHAR', '2019-03-11 10:12:46', '2019-03-11 10:12:46');
INSERT INTO `location` VALUES ('22', 'RAJGIR', '', 'BIHAR', '2019-03-11 10:12:55', '2019-03-11 10:12:55');
INSERT INTO `location` VALUES ('23', 'GAYA', '', 'BIHAR', '2019-03-11 10:13:06', '2019-03-11 10:13:06');
INSERT INTO `location` VALUES ('24', 'SHERGHATI', '', 'BIHAR', '2019-03-11 10:13:19', '2019-03-11 10:13:19');
INSERT INTO `location` VALUES ('25', 'SASARAM', '', 'BIHAR', '2019-03-11 10:13:31', '2019-03-11 10:13:31');
INSERT INTO `location` VALUES ('26', 'RAIGUNJ', '', 'WEST BENGAL', '2019-03-11 10:49:57', '2019-03-11 10:49:57');
INSERT INTO `location` VALUES ('27', 'SHEIKHPURA', '', 'BIHAR', '2019-03-11 22:16:14', '2019-03-11 22:16:14');
INSERT INTO `location` VALUES ('28', 'JAMUI', '', 'BIHAR', '2019-03-11 22:16:32', '2019-03-11 22:16:32');
INSERT INTO `location` VALUES ('29', 'BIHARSARIF', '', 'BIHAR', '2019-03-11 22:17:08', '2019-03-11 22:17:08');
INSERT INTO `location` VALUES ('30', 'DARBHANGA', '', 'BIHAR', '2019-03-11 22:17:27', '2019-03-11 22:17:27');
INSERT INTO `location` VALUES ('31', 'GHORASAHAN', '', 'BIHAR', '2019-03-11 22:17:46', '2019-03-11 22:17:46');
INSERT INTO `location` VALUES ('32', 'LAKHISARAI', '', 'BIHAR', '2019-03-11 22:18:19', '2019-03-11 22:18:19');
INSERT INTO `location` VALUES ('33', 'JAMALPUR', '', 'BIHAR', '2019-03-11 22:18:44', '2019-03-11 22:18:44');
INSERT INTO `location` VALUES ('34', 'JAYNAGAR', '', 'BIHAR', '2019-03-11 22:19:19', '2019-03-11 22:19:19');
INSERT INTO `location` VALUES ('35', 'MADHUBANI', '', 'BIHAR', '2019-03-11 22:19:38', '2019-03-11 22:19:38');
INSERT INTO `location` VALUES ('36', 'SAKRI', '', 'BIHAR', '2019-03-12 09:08:41', '2019-03-12 09:08:41');
INSERT INTO `location` VALUES ('37', 'PATNA', '', 'BIHAR', '2019-03-13 09:17:03', '2019-03-13 09:17:03');
INSERT INTO `location` VALUES ('38', 'SUPAUL', '', 'BIHAR', '2019-03-13 09:17:14', '2019-03-13 09:17:14');
INSERT INTO `location` VALUES ('39', 'DHAKA', '', 'BIHAR', '2019-03-13 09:17:28', '2019-03-13 09:17:28');
INSERT INTO `location` VALUES ('40', 'BEGUSARAI', '', 'BIHAR', '2019-03-13 09:17:58', '2019-03-13 09:17:58');
INSERT INTO `location` VALUES ('41', 'CHANPATIYA', '', 'BIHAR', '2019-03-13 09:18:19', '2019-03-13 09:18:19');
INSERT INTO `location` VALUES ('42', 'BHOJPUR', '', 'BIHAR', '2019-03-13 09:18:29', '2019-03-13 09:18:29');
INSERT INTO `location` VALUES ('43', 'MOHIUDDINAGAR', '', 'BIHAR', '2019-03-13 09:18:49', '2019-03-13 09:18:49');
INSERT INTO `location` VALUES ('44', 'ROHTAS', '', 'BIHAR', '2019-03-13 09:19:07', '2019-03-13 09:19:07');
INSERT INTO `location` VALUES ('45', 'PURULIYA', '', 'BIHAR', '2019-03-13 09:19:35', '2019-03-13 09:19:35');
INSERT INTO `location` VALUES ('46', 'NAUGACHHIA', '', 'BIHAR', '2019-03-13 09:19:56', '2019-03-13 09:19:56');
INSERT INTO `location` VALUES ('47', 'BHAGALPUR', '', 'BIHAR', '2019-03-13 09:20:09', '2019-03-13 09:20:09');
INSERT INTO `location` VALUES ('48', 'MIRIK', '', 'WEST BENGAL', '2019-03-13 16:31:17', '2019-03-13 16:31:17');
INSERT INTO `location` VALUES ('49', 'GERABARI', '', 'BIHAR', '2019-03-25 16:02:05', '2019-03-25 16:02:05');
INSERT INTO `location` VALUES ('50', 'PUPRI', '', 'BIHAR', '2019-03-25 16:53:07', '2019-03-25 16:53:07');
INSERT INTO `location` VALUES ('51', 'SINGHWARA', '', 'BIHAR', '2019-03-25 17:18:03', '2019-03-25 17:18:03');
INSERT INTO `location` VALUES ('52', 'BAHERI', '', 'BIHAR', '2019-03-25 17:22:36', '2019-03-25 17:22:36');
INSERT INTO `location` VALUES ('53', 'MURIA', '', 'BIHAR', '2019-03-25 17:37:58', '2019-03-25 17:37:58');
INSERT INTO `location` VALUES ('54', 'KURSEON', '', 'WEST BENGAL', '2019-03-25 17:55:23', '2019-03-26 17:51:57');
INSERT INTO `location` VALUES ('55', 'GANGARAMPUR', 'DAKSHIN DINAJPUR', 'West Bengal', '2019-03-25 18:05:07', '2019-03-25 18:05:07');
INSERT INTO `location` VALUES ('56', 'ARARIA', 'ARARIA', 'BIHAR', '2019-03-25 19:43:59', '2019-03-25 19:43:59');
INSERT INTO `location` VALUES ('57', 'ARWAL', '', 'BIHAR', '2019-03-27 12:11:21', '2019-03-27 12:11:21');
INSERT INTO `location` VALUES ('58', 'JAMSHEDPUR', '', 'JHARKHAND', '2019-03-28 09:37:42', '2019-03-28 09:37:42');
INSERT INTO `location` VALUES ('59', 'KHARUPATIA', '', 'ASSAM', '2019-03-28 16:52:38', '2019-03-28 16:52:38');
INSERT INTO `location` VALUES ('60', 'KOKARAJHAR', '', 'ASSAM', '2019-03-28 16:53:13', '2019-03-28 16:53:13');
INSERT INTO `location` VALUES ('61', 'BARPETA', '', 'ASSAM', '2019-03-28 16:53:29', '2019-03-28 16:53:29');
INSERT INTO `location` VALUES ('62', 'TEZPUR', '', 'ASSAM', '2019-03-28 16:53:47', '2019-03-28 16:53:47');
INSERT INTO `location` VALUES ('63', 'RANGIA', '', 'ASSAM', '2019-03-28 16:54:16', '2019-03-28 16:54:16');
INSERT INTO `location` VALUES ('64', 'BALIPARA', '', 'ASSAM', '2019-03-28 16:54:54', '2019-03-28 16:54:54');
INSERT INTO `location` VALUES ('65', 'HARIRAMPUR', '', 'WEST BENGAL', '2019-03-30 13:37:08', '2019-03-30 13:37:08');
INSERT INTO `location` VALUES ('67', 'KATSA', '', 'BIHAR', '2019-03-31 21:14:57', '2019-03-31 21:14:57');
INSERT INTO `location` VALUES ('68', 'DHOBHI', '', 'BIHAR', '2019-04-01 19:43:00', '2019-04-01 19:43:00');
INSERT INTO `location` VALUES ('69', 'UDAKISHANGUNJ', '', 'BIHAR', '2019-04-01 19:43:27', '2019-04-01 19:43:27');
INSERT INTO `location` VALUES ('70', 'FORBISGUNJ', '', 'BIHAR', '2019-04-01 19:43:55', '2019-04-01 19:43:55');
INSERT INTO `location` VALUES ('71', 'VASCODIGAMA', 'new jearsy', 'USA', '2019-04-02 11:24:09', '2019-04-02 11:24:09');
INSERT INTO `location` VALUES ('72', 'Jason Home', 'asdd', 'asdjhaj', '2019-04-02 11:24:59', '2019-04-02 11:24:59');
INSERT INTO `location` VALUES ('73', 'asdasdgahdg', 'asdasdasd', 'asdasda', '2019-04-10 04:23:30', '2019-04-10 04:23:30');
INSERT INTO `location` VALUES ('74', 'tyeytywuyt', 'ytasyudtaabsv', 'fghsafdaghdfa', '2019-04-10 04:36:06', '2019-04-10 04:36:06');

-- ----------------------------
-- Table structure for `lorry`
-- ----------------------------
DROP TABLE IF EXISTS `lorry`;
CREATE TABLE `lorry` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `truck_no` varchar(255) DEFAULT NULL,
  `engin_no` varchar(255) DEFAULT NULL,
  `chassis_no` varchar(255) DEFAULT NULL,
  `make` varchar(255) DEFAULT NULL,
  `truck_owner_name` varchar(255) DEFAULT NULL,
  `truck_owner_address` varchar(255) DEFAULT NULL,
  `truck_owner_mob_no` varchar(20) DEFAULT NULL,
  `truck_owner_contact_no` varchar(20) DEFAULT NULL,
  `truck_owner_land_line_no` varchar(20) DEFAULT NULL,
  `truck_owner_pan_no` varchar(20) DEFAULT NULL,
  `truck_owner_gst_no` varchar(20) DEFAULT NULL,
  `truck_owner_bank_id` varchar(50) DEFAULT NULL,
  `truck_owner_bank_name` varchar(200) DEFAULT NULL,
  `truck_owner_bank_ac_no` varchar(20) DEFAULT NULL,
  `truck_owner_ifsc_code` varchar(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`truck_no`)
) ENGINE=InnoDB AUTO_INCREMENT=212 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of lorry
-- ----------------------------
INSERT INTO `lorry` VALUES ('1', 'WB59B3513', '697TC57BSZ114822', '444026BSZ114822', 'TATA', 'SAJJAD ALI', 'GANGARAMPUR', '983270744', '', '', 'ALAPA0048H', '', '', null, '', '', '2018-12-22 11:05:06', '2018-12-22 11:05:06');
INSERT INTO `lorry` VALUES ('2', 'WB67A3151', '21F63267809', 'MAT448035C3F16412', 'TATA', 'JIKRIA MIDYA', 'BANKURA', '7908008297', '', '', 'BQBPM3490A', '', '', null, '', '', '2018-12-25 09:23:30', '2018-12-25 09:23:30');
INSERT INTO `lorry` VALUES ('3', 'RJ32GC0343', 'JGEZ403678', 'MB1CTCHD6JAGH6839', 'AL', 'BRAJ BIHARI YADAV', 'KOTPUTALI, JAIPUR', '9928003229', '', '', 'AKXPY2515P', '', '', null, '', '', '2018-12-29 16:12:40', '2018-12-29 16:12:40');
INSERT INTO `lorry` VALUES ('4', 'DL01GC4986', '51D84223091', 'MAT448022F5E05979', 'TATA', 'KAMLESH DEVI', 'PRITAMPURA, DELHI', '9999944614', '', '', 'BJCPD3387H', '', '', null, '', '', '2019-01-12 15:29:31', '2019-01-12 15:29:31');
INSERT INTO `lorry` VALUES ('5', 'NL02L8361', '41L63406837', 'MAT466388E1N19667', 'TATA', 'MAHESH CHAUDHURI', 'MOKOKCHUNG, NAGALAND', '9832014855', '', '', 'AOSPC2545L', '', '', null, '', '', '2019-02-06 11:47:12', '2019-02-06 11:47:12');
INSERT INTO `lorry` VALUES ('6', 'WB73B7316', 'SLTEB139574', 'MBUWEL4XEB0146128', 'SWARAJ MAZDA LTD', 'NAKUL CHETTRI', 'MAHANANDI BAZAR, KURSEONG, WEST BENGAL', '8906850150', '', '', '', '', '', null, '', '', '2019-03-05 18:14:35', '2019-03-05 18:14:35');
INSERT INTO `lorry` VALUES ('7', 'WB37B8492', '90M62817757', 'MAT42603191P31496', 'TATA', 'MD JAINUL ABEDIN', 'DURGAPUR, BURDWAN', '8617468622', '', '', 'AHYPA0578J', '', '', null, '', '', '2019-03-07 11:58:29', '2019-03-07 11:58:29');
INSERT INTO `lorry` VALUES ('8', 'UP67T5215', '31A84091948', 'MAT448035DAA00603', 'TATA', 'BIRBAL', 'VARANASI, UTTAR PRADESH', '7586859792', '', '', 'CNYPB1516R', '', '', null, '', '', '2019-03-07 15:44:29', '2019-03-07 15:44:29');
INSERT INTO `lorry` VALUES ('9', 'UP61T6500', 'ISBE591804071H63615308', 'MAT541024H1H16202', 'TATA MOTORS', 'SUNIL KR YADAV', 'GHAZIPUR', '9794252665', '', '', 'AMNPY9386L', '', '', null, '', '', '2019-03-07 16:08:25', '2019-03-07 16:08:25');
INSERT INTO `lorry` VALUES ('10', 'RJ23GA3143', '01A62831198', 'MAT466372A5A00301', 'TATA MOTORS', 'JAGAT SINGH', 'SANGANER JAIPUR', '9667736662', '', '', 'GLPPS0696G', '', '', null, '', '', '2019-03-07 16:11:19', '2019-03-07 16:11:19');
INSERT INTO `lorry` VALUES ('11', 'NL01AB8399', '81C84465037', 'MAT46661J5C09433', 'TATA MOTORS', 'NARESH PD CHOUDHARI', 'DEOGARH JHARKHAND', '9110949717', '', '', 'AOCPC5964R', '', '', null, '', '', '2019-03-07 16:16:34', '2019-03-07 16:16:34');
INSERT INTO `lorry` VALUES ('12', 'UP65ET2229', '61C84291008', 'MAT466429GHC04662', 'TATA MOTORS', 'KAMLESH VISWAKARMA', 'GHAZIPUR', '7376832121', '', '', 'AJYPV3076A', '', '', null, '', '', '2019-03-07 16:20:54', '2019-03-07 16:20:54');
INSERT INTO `lorry` VALUES ('13', 'NL02K8060', '40A62308628', '426021DVZ15613', 'TATA MOTORS', 'AJAY RAY', 'MOKOKCHUNG NAGALAND', '8609329312', '9800159820', '', 'BTVPR2359J', '', '', null, '', '', '2019-03-07 20:32:38', '2019-03-07 20:32:38');
INSERT INTO `lorry` VALUES ('14', 'WB73B6290', 'SLTBB136044', 'MBUWEL4XBB0142532', 'SWARAJ MAZDA LTD', 'BHAICHUNG BHUTIA', 'DARJEELING', '7602343996', '', '', 'AAAABH2145H', '', '', null, '', '', '2019-03-08 12:39:27', '2019-03-08 12:39:27');
INSERT INTO `lorry` VALUES ('15', 'WB73D6936', 'B591803251H634607726', 'MAT466420F1H19667', 'TATA MOTORS LTD', 'AVIJIT CHAKRABORTI', 'JYOTI NAGAR SILIGURI', '9547551649', '9547551649', '', 'ANVPC7543G', '', '', null, '', '', '2019-03-08 12:45:46', '2019-03-08 12:45:46');
INSERT INTO `lorry` VALUES ('16', 'NL01K7974', '31G63338228', 'MAT466420D3G15898', 'TATA', 'LAL BHADUR YADAV', 'TCP GATE NAGALAND', '9903190071', '9903190071', '', 'AFCPY5608K', '', '', null, '', '', '2019-03-08 12:54:19', '2019-03-08 12:54:19');
INSERT INTO `lorry` VALUES ('17', 'WB41H1520', '400950D0023697', 'MEC2121CLFP023697', 'BHARAT BENZ', 'SEKH HASAN FIROZ', 'GOLAHAT SRIPALLY BURDWAN', '8250955001', '8250955001', '', 'ACJPF7529C', '', '', null, '', '', '2019-03-08 13:11:59', '2019-03-08 13:11:59');
INSERT INTO `lorry` VALUES ('18', 'HR69A0939', '80D62671208', '426031DRZ720649', 'TATA MOTORS LTD', 'DHARMBIR', 'SONIPAT', '9991654535', '9991654535', '', 'BYJPD1081J', '', '', null, '', '', '2019-03-08 13:17:38', '2019-03-08 13:17:38');
INSERT INTO `lorry` VALUES ('19', 'WB23C2601', '11A62979152', 'MAT448030B1A02024', 'TATA MOTORS LTD', 'SUKHEN SAHA', 'MOUJA NARASINGHAPUR', '9733302248', '9733302248', '', 'CDVPS3182B', '', '', null, '', '', '2019-03-08 13:25:13', '2019-03-08 13:25:13');
INSERT INTO `lorry` VALUES ('20', 'WB37C0388', '01F62888264', 'MAT426031A2F14031', 'TATA MOTORS LTD', 'SHAMBU NATH CHOURASIA', 'GORAI ROAD ASANSOL', '8707090949', '8707090949', '', 'ACKPC8263D', '', '', null, '', '', '2019-03-08 13:32:34', '2019-03-08 13:32:34');
INSERT INTO `lorry` VALUES ('21', 'WB57A8428', '10389', '116748', 'TATA MOTORS LTD', 'BISWAJIT SAHA', 'DAYANAGAR MURSHIDABAD', '9475816199', '9475816199', '', 'DEBPS9674N', '', '', null, '', '', '2019-03-08 13:39:08', '2019-03-08 13:39:08');
INSERT INTO `lorry` VALUES ('22', 'UP21BN3884', '61C84291686', 'MAT448203G5C04555', 'TATA MOTORS LTD', 'JAKIR HUSAIN', 'MORADABAD', '9012725645', '9012725645', '', 'AMQPH0083C', '', '', null, '', '', '2019-03-08 13:49:11', '2019-03-08 13:49:11');
INSERT INTO `lorry` VALUES ('23', 'UP21BN4985', '61F63626939', 'MAT448203G5F11397', 'TATA MOTORS LTD', 'NASCAR ALI', 'BILARI MORADABAD', '9456935561', '9456935561', '', 'BWRPA3165Q', '', '', null, '', '', '2019-03-08 13:55:04', '2019-03-08 13:55:04');
INSERT INTO `lorry` VALUES ('24', 'WB37D6668', '11J63185202', 'MAT466416B3J27856', 'TATA MOTORS LTD', 'RAJU KUMAR OJHA', 'JHARKHAND ROAD', '9933516299', '9933516299', '', 'AAHPO4849C', '', '', null, '', '', '2019-03-08 14:03:37', '2019-03-08 14:03:37');
INSERT INTO `lorry` VALUES ('25', 'RJ05GA6735', '01G62906591', 'MAT466372A5H07280', 'TATA MOTORS LTD', 'HEMRAJ', 'KAGAYA PATTIMAHU KARAULI', '9461842141', '9461842141', '', 'AQYPH2814D', '', '', null, '', '', '2019-03-08 14:09:51', '2019-03-08 14:09:51');
INSERT INTO `lorry` VALUES ('26', 'RJ02GB3919', 'SO3082461F84316923', 'MAT466429GHF10139', 'TATA', 'DALIP SINGH', 'ALWAR RAJ', '7728924235', '', '', 'GBGPS8786C', '', '', null, '', '', '2019-03-09 10:57:24', '2019-03-09 10:57:24');
INSERT INTO `lorry` VALUES ('27', 'UP78BT0456', '697TC57HSZ884907', '444027HSZ733083', 'TATA MOTORS', 'MR PRAMOD KR VOHRA', 'KANPUR', '9434046505', '', '', 'ABJPV1748A', '', '', null, '', '', '2019-03-09 11:03:58', '2019-03-09 11:03:58');
INSERT INTO `lorry` VALUES ('28', 'HR658405', '31E84109773', 'MAT448033DAE04606', 'TATA MOTORS', 'UPENDRA PANDIT', 'PURA ROHTAK', '8002373755', '9815092854', '', 'CAEPK1566K', '', '', null, '', '', '2019-03-09 11:09:00', '2019-03-09 11:09:00');
INSERT INTO `lorry` VALUES ('29', 'RJ14GD9178', '11H63170255', 'MAT466416B5H13633', 'TATA MOTORS', 'RAJVIR SINGH', 'BHARATPUR RAJSTHAN', '9460636698', '', '', 'DDBPS3874M', '', '', null, '', '', '2019-03-09 11:12:51', '2019-03-09 11:12:51');
INSERT INTO `lorry` VALUES ('30', 'WB11A7650', '50L62437737', '426031LUZ140363', 'TATA MOTORS', 'ASOK KR RAY', 'HOWRAH', '8292091330', '', '', '', '', '', null, '', '', '2019-03-09 12:10:44', '2019-03-09 12:10:44');
INSERT INTO `lorry` VALUES ('31', 'UP63T3563', '21D84055604', 'MAT466420C5F10692', 'TATA MOTORS', 'UPENDRA YADAV', 'GHAZIPUR', '8953580488', '', '', 'AHYPY8667L', '', '', null, '', '', '2019-03-10 23:56:48', '2019-03-10 23:56:48');
INSERT INTO `lorry` VALUES ('32', 'JH02T8671', '8591803111J63181622', 'MAT466383B2J21451', 'TATA MOTORS', 'BINOD KR SRIVASTAVA', 'RAMGARH JHARKHAND', '8249482428', '', '', 'AYOPS7127E', '', '', null, '', '', '2019-03-10 23:59:50', '2019-03-10 23:59:50');
INSERT INTO `lorry` VALUES ('33', 'BR25A2887', '90C62741598', '426031CQZ203541', 'TATA MOTORS', 'MANOJ KUMAR', 'PATWAH PATNA', '6355441447', '', '', 'DZSPK3762H', '', '', null, '', '', '2019-03-11 00:02:33', '2019-03-11 00:02:33');
INSERT INTO `lorry` VALUES ('34', 'WB03C9855', '31J63215287', 'MAT422033D1J12472', 'TATA MOTORS', 'MANAWAR HUSSAIN', 'KOLKATA', '8420900442', '', '', 'ADGPH9201H', '', '', null, '', '', '2019-03-11 00:06:47', '2019-03-11 00:06:47');
INSERT INTO `lorry` VALUES ('35', 'MH04FJ6629', '11M63217888', 'MAT466416C5A00724', 'TATA MOTORS', 'BHAGAT SINGH', 'BIJAY NAGAR INDOR', '9981958729', '', '', 'ABAPT7299K', '', '', null, '', '', '2019-03-11 08:00:36', '2019-03-11 08:00:36');
INSERT INTO `lorry` VALUES ('36', 'WB25D3132', '497TC93FZY834800', 'MAT416405A7F25581', 'TATA MOTORS', 'MD RAHUL AMIN', 'DUTTAPUKUR WEST BENGOL', '7890700163', '', '', 'BPCPA3627M', '', '', null, '', '', '2019-03-11 08:03:40', '2019-03-11 08:03:40');
INSERT INTO `lorry` VALUES ('37', 'UP63AT1953', 'ISBE591804071L63635070', 'MAT541024H1N23326', 'TATA MOTORS', 'YOGENDRA MISHRA', 'MIRZAPUR', '7487847875', '', '', 'BXBPM3938C', '', '', null, '', '', '2019-03-11 08:53:00', '2019-03-11 08:53:00');
INSERT INTO `lorry` VALUES ('38', 'NL08A4529', '697TC57BTZ145249', '444026BTZ222856', 'TATA', 'ANJU DEVI MANTRI', 'SEVOKE ROAD SILIGURI', '9431232399', '', '', 'AMMPM1272E', '', '', null, '', '', '2019-03-13 19:02:13', '2019-03-13 19:02:13');
INSERT INTO `lorry` VALUES ('39', 'CG12AR3805', 'GHPZ147786', 'MB1NACHD5HPDY5159', 'TATA', 'DASHRATH TIWARI', 'KORBA CHHATTISGARH', '9893617389', '', '', 'AMZPT7679K', '', '', null, '', '', '2019-03-13 19:28:54', '2019-03-13 19:28:54');
INSERT INTO `lorry` VALUES ('40', 'JH02G7611', '697TC57JTZ144215', '444026JTZ144215', 'TATA', 'SANTOSH KR SINGH', 'MUZAFFARPUR', '6203336438', '', '', 'DUWPS1940E', '', '', null, '', '', '2019-03-13 20:34:55', '2019-03-13 20:34:55');
INSERT INTO `lorry` VALUES ('41', 'UP65CT2458', '31A63310448', 'MAT466422D5B01292', 'TATA', 'ANUJ KR SINGH', 'SUSUWAHI, VARANASI', '9451648156', '', '', 'EWBPS6260P', '', '', null, '', '', '2019-03-13 20:37:29', '2019-03-13 20:37:29');
INSERT INTO `lorry` VALUES ('42', 'UP63AT0462', 'HFPZ110486', 'MB1KACFD2HPEX8579', 'ASHOK LEYLAND', 'RAM SEVOKE PATEL', 'MIRZAPUR UP', '6264051581', '', '', 'CJKPP7272A', '', '', null, '', '', '2019-03-13 20:39:49', '2019-03-13 20:39:49');
INSERT INTO `lorry` VALUES ('43', 'WB73C1432', 'E483CDBE532767', 'MC232CRC0BE225030', 'TATA', 'SUBHAM GADAL', 'KURSEONG', '9735003938', '', '', 'BQJPG1931Q', '', '', null, '', '', '2019-03-13 21:02:41', '2019-03-13 21:02:41');
INSERT INTO `lorry` VALUES ('44', 'WB73C4277', 'SLT3BZ163229', 'MBUWELYXBZ0169680', 'SWARAJ MAZDA LTD', 'SUDESH SUNDAS', 'DARJEELING', '8900850150', '', '', 'EPIPS0719P', '', '', null, '', '', '2019-03-14 09:44:19', '2019-03-14 09:44:19');
INSERT INTO `lorry` VALUES ('45', 'HR39B8009', 'MAT466401A2J21910', '01J62925858', 'TATA', 'SURYA PRAKASH', 'DAYANAND RISHI VIHAR COLONY HISAR', '9862088458', '', '', 'BAAPP2919L', '', '', null, '', '', '2019-03-14 15:16:25', '2019-03-14 15:16:25');
INSERT INTO `lorry` VALUES ('46', 'JH10U3585', 'B591452090K62802261', 'MAT42603191K25970', 'TATA', 'RAMJAY YADAV', 'DHANBAD JHARKHAND', '9934193989', '', '', 'AIXPY1334Q', '', '', null, '', '', '2019-03-14 15:21:29', '2019-03-14 15:21:29');
INSERT INTO `lorry` VALUES ('47', 'AS01JC6800', 'JFPZ112821', 'MBAKACHD3JPFC4645', 'ASHOK LEYLAND', 'HANSHNATH SINGH', 'GUWAHATI', '78965446600', '', '', 'DELPS2565J', '', '', null, '', '', '2019-03-14 15:24:19', '2019-03-14 15:24:19');
INSERT INTO `lorry` VALUES ('48', 'NL01Q5915', '697TC57LTZ910354', '444026LTZ755456', 'TATA', 'RITESH KUMAR', 'BEGUSARAI, BIHAR', '7260947323', '', '', 'COBPK0747P', '', '', null, '', '', '2019-03-14 15:30:34', '2019-03-14 15:30:34');
INSERT INTO `lorry` VALUES ('49', 'UP21CN0515', '51A84203181', 'MAT448202FAA00938', 'TATA', 'MUNAZIR HUSSIAN', 'MORADABAD, UP', '7467021612', '', '', 'ABIPH2619H', '', '', null, '', '', '2019-03-14 15:39:53', '2019-03-14 15:39:53');
INSERT INTO `lorry` VALUES ('50', 'HR55P8967', 'B591803121A63222142', 'MAT466385C2A00739', 'TATA', 'YOGESH', 'BULLANDSHER, UP', '', '9560202114', '', 'AQTPK4985B', '', '', null, '', '', '2019-03-14 15:52:29', '2019-03-14 15:52:29');
INSERT INTO `lorry` VALUES ('51', 'WB23C2705', '11B62991883', 'MAT448050B0B02555', 'TATA', 'MD HABIB', 'KOLKATA', '7372840491', '', '', 'ABQPH0038L', '', '', null, '', '', '2019-03-14 15:57:38', '2019-03-14 15:57:38');
INSERT INTO `lorry` VALUES ('52', 'WB33A9947', '01F62892476', 'MAT426031A3F10657', 'TATA', 'JOGESHWAR GHOSH', 'MEDNIPUR', '9434170252', '', '', 'ASKPG2320D', '', '', null, '', '', '2019-03-14 16:09:09', '2019-03-14 16:09:09');
INSERT INTO `lorry` VALUES ('53', 'UP13AT1609', '61884282442', 'MAT466429G5B02469', 'TATA', 'YOGESH KUMAR', 'BULANDSHAHR UP', '8433184642', '', '', 'AQTPK4985B', '', '', null, '', '', '2019-03-14 16:20:19', '2019-03-14 16:20:19');
INSERT INTO `lorry` VALUES ('54', 'UP63AT4028', 'ISBE591804081F63700897', 'MAT541089J1F18470', 'TATA', 'BHEEM PANDEY', 'MIRZAPUR, UP', '8787004860', '', '', 'CKRPP6287R', '', '', null, '', '', '2019-03-14 16:42:32', '2019-03-14 16:42:32');
INSERT INTO `lorry` VALUES ('55', 'WB23A9838', '697TC57ETZ1256', '444026ETZ120915', 'TATA', 'SHYAM SHUNDER SHAW', 'KOLKATA', '9007393291', '', '', 'CRXPS9471B', '', '', null, '', '', '2019-03-14 16:46:08', '2019-03-14 16:46:08');
INSERT INTO `lorry` VALUES ('56', 'MP20HB5467', 'S038082451L84266554', 'MAT466429FHP08391', 'TATA', 'SAMARJEET PATEL', 'JABALPUR ', '9200378867', '', '', 'AZDPP6683L', '', '', null, '', '', '2019-03-14 16:49:01', '2019-03-14 16:49:01');
INSERT INTO `lorry` VALUES ('57', 'WB23C2373', '01L62952287', 'MAT448030A3N22094', 'TATA', 'DEBASISH SADHUKHAN', 'HOOGHLY, WEST BENGAL', '9830768490', '', '', 'ANKPS1957K', '', '', null, '', '', '2019-03-14 16:52:33', '2019-03-14 16:52:33');
INSERT INTO `lorry` VALUES ('58', 'NL01K5031', '426031ERZ011461', '80E62679136', '', 'MAMTA SINGH', 'KOHIMA, NL', '9679808581', '', '', 'CAJPS7154Q', '', '', null, '', '', '2019-03-14 16:55:02', '2019-03-14 16:55:02');
INSERT INTO `lorry` VALUES ('59', 'HR38S0553', 'CXEZ408498', 'MB1KADWC9CEWH9003', 'ASHOK LEYLAND', 'MAA ANNAPURNA TRANSPORT AGENCY LTD', 'FARIDABAD', '9475534902', '', '', 'AADCM0917A', '', '', null, '', '', '2019-03-14 16:59:02', '2019-03-14 16:59:02');
INSERT INTO `lorry` VALUES ('60', 'WB41E2547', '01C62857305', 'MAT426023A0C07026', 'TATA', 'SANDIP DAS', 'BURDWAN', '9474042544', '', '', 'AHMPD2784M', '', '', null, '', '', '2019-03-14 17:01:27', '2019-03-14 17:01:27');
INSERT INTO `lorry` VALUES ('61', 'WB03D0155', '31L63352140', 'MAT448033D1N15016', 'TATA', 'MEHROON NESSA', 'BOWBAZAR, KOLKATA', '9007285930', '', '', 'AOBPN5167A', '', '', null, '', '', '2019-03-14 17:04:09', '2019-03-14 17:04:09');
INSERT INTO `lorry` VALUES ('62', 'WB41C2357', '444026JTZ36683', '697TC57JTZ145310', 'TATA MOTORS', 'SANDIP DAS', 'BURDWAN', '9474042544', '', '', 'AHMPD2784M', '', '', null, '', '', '2019-03-15 12:09:40', '2019-03-15 12:09:40');
INSERT INTO `lorry` VALUES ('63', 'WB37B7237', '00H62776624', 'MAT42603191H18668', 'TATA MOTORS', 'MD JUNED', 'BURDWAN', '8145988785', '', '', 'AJSPJ2823K', '', '', null, '', '', '2019-03-15 12:13:15', '2019-03-15 12:13:15');
INSERT INTO `lorry` VALUES ('64', 'WB03C7792', '21K63264664', 'MAT448035C1K14845', 'TATA MOTORS', 'MD MERAJ KHAN', 'KOLKATA', '8004133175', '', '', 'BLQPK9059P', '', '', null, '', '', '2019-03-15 12:19:06', '2019-03-15 12:19:06');
INSERT INTO `lorry` VALUES ('65', 'WB39B4446', 'HAPZ129061', 'MB1KACHD8HPYZ6171', 'ASOK LELAYAND', 'ZAYAUDDIN KHAN', 'BURDWAN', '9932713821', '', '', 'ANGPK5143H', '', '', null, '', '', '2019-03-15 12:21:56', '2019-03-15 12:21:56');
INSERT INTO `lorry` VALUES ('66', 'OD16B1152', 'B591803251D63436783', 'MAT466420F1D09429', 'TATA MOTORS', 'WAKIL RAY', 'SUNDARGARH', '9365501499', '', '', 'ANNPR1801J', '', '', null, '', '', '2019-03-15 12:25:14', '2019-03-15 12:25:14');
INSERT INTO `lorry` VALUES ('67', 'HR69C7177', 'E683CDED532404', 'MC242KRC03D006231', 'EICCHER', 'SANKLET KUMAR', 'SONIPAT', '7481935911', '', '', 'EJCPK7653C', '', '', null, '', '', '2019-03-15 12:29:56', '2019-03-15 12:29:56');
INSERT INTO `lorry` VALUES ('69', 'NL0L7749 ', '51B63424005', 'MAT466388F1B03851', 'TATA MOTORS', 'NARESH KUMAR JHA', 'KOLKATA', '8340664626', '', '', 'ABVPJ9952C', '', '', null, '', '', '2019-03-15 13:01:56', '2019-03-15 13:01:56');
INSERT INTO `lorry` VALUES ('70', 'WB41H0730', '51J63463835', 'MAT466420F1J21097', 'TATA MOTORS', 'ARJUN SARKAR', 'BURDWAN', '9332304159', '', '', 'CQUPS9006E', '', '', null, '', '', '2019-03-15 13:05:02', '2019-03-15 13:05:02');
INSERT INTO `lorry` VALUES ('71', 'MP17HH1528', '01A62833282', 'MAT466372A2A01651', 'TATA MOTORS', 'VINOD KUMAR GARG', 'REWA MP', '8827707821', '', '', 'BFWPG1900H', '', '', null, '', '', '2019-03-15 13:08:26', '2019-03-15 13:08:26');
INSERT INTO `lorry` VALUES ('72', 'WB41J3853', '81L84840401', 'MAT46621J5P30477', 'TATA MOTORS', 'KISHOR ROY', 'PURBA BURDWAN', '8609958547', '', '', 'AKFPR3376R', '', '', null, '', '', '2019-03-15 13:13:05', '2019-03-15 13:13:05');
INSERT INTO `lorry` VALUES ('73', 'WB73E4370', '90L62808268', 'MAT42603190N19859', 'TATA MOTORS', 'BINOD KUMAR SINGH', 'SILIGURI', '7866028470', '', '', 'CHLPS4017B', '', '', null, '', '', '2019-03-15 13:16:12', '2019-03-15 13:16:12');
INSERT INTO `lorry` VALUES ('74', 'UP13AT1728', '31A84093914', 'MAT448035D5B01068', 'TATA MOTORS', 'RASHIUDDIN', 'MITHEPUR UP', '9410234512', '', '', 'FUTPS2077B', '', '', null, '', '', '2019-03-15 13:18:35', '2019-03-15 13:18:35');
INSERT INTO `lorry` VALUES ('75', 'UP17AT4387', '1SBE591804071M63648920', 'MAT541024H1P28228', 'TATA MOTORS', 'VINOD', 'BAGHPAT UP', '8057243189', '', '', 'AKUPV3516G', '', '', null, '', '', '2019-03-15 13:21:05', '2019-03-15 13:21:05');
INSERT INTO `lorry` VALUES ('76', 'NL01L7749', '51B63424005', 'MAT466388F1B03851', 'TATA', 'NARESH KUMAR JHA', 'NAGALAND  KOHIMA', '8340664626', '', '', 'ABVPJ9952C', '', '', null, '', '', '2019-03-15 18:33:29', '2019-03-15 18:33:29');
INSERT INTO `lorry` VALUES ('77', 'UP52F6232', '11C63113083', 'MAT46604B5C06677', 'TATA MOTORS', 'SMT MEERA MALL', 'GORAKHPUR', '8115433077', '', '', 'BKOPM5465E', '', '', null, '', '', '2019-03-18 15:51:55', '2019-03-18 15:51:55');
INSERT INTO `lorry` VALUES ('78', 'WB/9N0222', 'CRPZ110373', 'MB1KADWC6C6CPRF7005', 'ALOK LEYLAND ', 'SEKH ALLAUDDIN', '', '7319477493', '', '', 'BVPYA9171L', '', '', null, '', '', '2019-03-19 09:45:02', '2019-03-19 09:45:02');
INSERT INTO `lorry` VALUES ('79', 'PB11BU4177', '51H84248480', 'MAT466422FHJ05540', 'TATA MOTORS', 'JASMER SINGH', '', '9815069392', '', '', 'CWMPS9691D', '', '', null, '', '', '2019-03-19 09:47:34', '2019-03-19 09:47:34');
INSERT INTO `lorry` VALUES ('80', 'RJ09GA0385', '50N31661', '5DE556115', 'ASOK LELAYAND', 'PURAN MAL', 'KISHANGANJ BARAN', '9928048896', '', '', 'BBNPP0588A', '', '', null, '', '', '2019-03-19 09:50:15', '2019-03-19 09:50:15');
INSERT INTO `lorry` VALUES ('81', 'WB23C2581', '11A52980282', 'MAT44805B1A02036', 'TATA MOTORS', 'ISHWAR PRASAD', 'KOLKATA', '9572415033', '', '', 'BMAPP3239H', '', '', null, '', '', '2019-03-19 09:52:46', '2019-03-19 09:52:46');
INSERT INTO `lorry` VALUES ('82', 'MP53HA1969', 'FWHZ418723', 'MB1KADYC7FRWM4104', 'ASOK LELAYAND', 'RAMLAL SAHU', 'DADHIYA DUARA', '9977044799', '', '', 'EETPS1211E', '', '', null, '', '', '2019-03-19 09:58:43', '2019-03-19 09:58:43');
INSERT INTO `lorry` VALUES ('83', '11L63206370', '11L63206370', 'MAT466416B5P20473', 'TATA MOTORS', 'MOHD HANIF ANSARI', 'JABALPUR', '8435172717', '', '', 'AVHPA1206C', '', '', null, '', '', '2019-03-19 10:02:43', '2019-03-19 10:02:43');
INSERT INTO `lorry` VALUES ('84', 'UP78CN2770', '11K63191898', 'MAT448201B0K19330', 'TATA MOTORS', 'SHABBU ALI', 'MORADABAD', '9411202770', '', '', 'BQQPA0670M', '', '', null, '', '', '2019-03-19 10:27:04', '2019-03-19 10:27:04');
INSERT INTO `lorry` VALUES ('85', 'NL05G0655', 'B591803101L62953749', 'MAT448030A2N27406', 'TATA MOTORS', 'CHANDESHWAR YADAV', '', '9435037502', '', '', 'ADYPY2174J', '', '', null, '', '', '2019-03-19 10:29:59', '2019-03-19 10:29:59');
INSERT INTO `lorry` VALUES ('86', 'UP78DN3935', 'CYHZ405423', 'MB1KADYC4CAYD7073', 'ASOK LELAYAND', 'DEEPAK KUMAR SAHU', 'KUSHINAGAR', '', '', '', 'CRIPS9069L', '', '', null, '', '', '2019-03-19 10:32:42', '2019-03-19 10:32:42');
INSERT INTO `lorry` VALUES ('87', 'MP19HA3499', 'B591803221K63298352', 'MAT466388C3K632998357', 'TATA MOTORS', 'AJAY KUMAR GUPTA', 'JABALPUR', '7477045173', '', '', 'CPNPG7436N', '', '', null, '', '', '2019-03-19 10:39:01', '2019-03-19 10:39:01');
INSERT INTO `lorry` VALUES ('88', 'MP20HB5760', 'S03082461J84336989', 'MAT466429GHN13954', 'TATA MOTORS', 'SHITALA PRASAD KOL', 'JABALPUR', '8768529232', '', '', 'AIJPK9339B', '', '', null, '', '', '2019-03-19 10:42:26', '2019-03-19 10:42:26');
INSERT INTO `lorry` VALUES ('89', 'JH11E2305', '80K62717796', '426031KRZ134037', 'TATA MOTORS', 'KISHOR KUMAR', 'GIRIDIH', '9431125248', '', '', 'AYAPK6891K', '', '', null, '', '', '2019-03-19 10:55:44', '2019-03-19 10:55:44');
INSERT INTO `lorry` VALUES ('90', 'WB23C2197', '01J62927355', 'MAT426031A3J17626', 'TATA MOTORS', 'OM PRAKASH SINGH', 'HOOGHLY', '9485125737', '', '', 'BSWPS3899G', '', '', null, '', '', '2019-03-19 10:58:13', '2019-03-19 10:58:13');
INSERT INTO `lorry` VALUES ('91', 'RJ07GB5518', '11E84004988', 'MAT448030B7E21929', 'TATA MOTORS', 'SURJIT YADAV', 'GANGANAGAR', '7986879374', '', '', 'AASPY5793L', '', '', null, '', '', '2019-03-19 11:01:24', '2019-03-19 11:01:24');
INSERT INTO `lorry` VALUES ('92', 'WB23A7997', '697TC57FUZ855200', '444026FUZ728266', 'TELCO LTD', 'MD HABIB', 'KOLKATA', '9903422497', '', '', 'ABQPH0038L', '', '', null, '', '', '2019-03-19 11:31:28', '2019-03-19 11:31:28');
INSERT INTO `lorry` VALUES ('93', 'UP19T5293', '41F84166145', 'MAT466422E5F06675', 'TATA MOTORS', 'ANKIT KUMAR', 'SHAMLI UP', '7617442314', '', '', 'HSMPK8980G', '', '', null, '', '', '2019-03-19 11:34:37', '2019-03-19 11:34:37');
INSERT INTO `lorry` VALUES ('94', 'WB41F8432', '21B63234053', 'MAT448045C1B04269', 'TATA MOTORS', 'SEKH NASIR', 'BURDWAN', '8927370914', '', '', 'APTPN3785R', '', '', null, '', '', '2019-03-19 11:37:51', '2019-03-19 11:37:51');
INSERT INTO `lorry` VALUES ('95', 'WB23B1474', '60L62521027', '448026LTZ143455', 'TELCO LTD', 'TRILOKI NATH TIWARI', 'KOLKATA', '', '   7585876249 ', '', 'AEPPT3436A', '', '', null, '', '', '2019-03-19 12:01:50', '2019-03-19 12:01:50');
INSERT INTO `lorry` VALUES ('96', 'HR55V9494', 'S03064651D84224171', 'MAT466422FHE02159', 'TATA MOTORS', 'CHANDRA SHEKHAR', 'GURGAON', '9934641048', '', '', 'CVGPS5617G', '', '', null, '', '', '2019-03-19 12:05:17', '2019-03-19 12:05:17');
INSERT INTO `lorry` VALUES ('97', 'UP21BN8025', '71H84409292', 'MAT466604H555J12485', 'TATA MOTORS', 'NASIM AHMAD', '', '', '9411808018', '', 'AFVPA6175L', '', '', null, '', '', '2019-03-19 12:08:54', '2019-03-19 12:08:54');
INSERT INTO `lorry` VALUES ('98', 'HR55T6645', '400950D0007686', 'MEC2241CEEP007435', 'ASOK LELAYAND', 'NITIN', 'MUZAFFARNAGAR', '843347845', '', '', 'BADPN4879G', '', '', null, '', '', '2019-03-19 12:17:56', '2019-03-19 12:17:56');
INSERT INTO `lorry` VALUES ('99', 'HR657512', '21H84069031', 'MAT466420C5H14425', 'TATA MOTORS', 'MANJEET SINGH', '', '9416860003', '', '', 'BZLPS2546C', '', '', null, '', '', '2019-03-19 13:10:30', '2019-03-19 13:10:30');
INSERT INTO `lorry` VALUES ('100', 'PB10DM3325', 'ACP132056', 'MB1KADYC6CPAD7231', 'ASOK LELAYAND', 'SURINDER KAUR', 'NEW KARTAR NAGAR', '9814319825', '', '', 'ADJPS6786K', '', '', null, '', '', '2019-03-19 13:13:55', '2019-03-19 13:13:55');
INSERT INTO `lorry` VALUES ('101', 'PB10DM3225', 'ACP132652', 'MB1KDYC8CPAD7329', 'ASOK LELAYAND', 'SURENDER KAUR', 'KARTAR NAGAR', '9814319825', '', '', 'ABVPK9946R', '', '', null, '', '', '2019-03-19 13:21:03', '2019-03-19 13:21:03');
INSERT INTO `lorry` VALUES ('102', 'PB06V8673', 'S03082461C84291831', 'MAT466429GHC04914', 'TATA MOTORS', 'JATINDER SINGH', 'DURGASPUR', '9478520415', '', '', 'ACHPS0934L', '', '', null, '', '', '2019-03-19 13:27:34', '2019-03-19 13:27:34');
INSERT INTO `lorry` VALUES ('103', 'UP12AT0022', 'HJPZ144938', 'MB1NACHD3HPJA9751', 'ASOK LELAYAND', 'AMRIS KUMAR', 'KAMAL NAGAR KUDRA', '7500622200', '', '', 'ASAPA2949Q', '', '', null, '', '', '2019-03-19 13:34:27', '2019-03-19 13:34:27');
INSERT INTO `lorry` VALUES ('104', 'UP12AT7284', 'VEDX5329240B1P', 'MC2M7SRF0JC054526', 'ASOK LELAYAND', 'BIJENDRA SINGH', 'MUZAFFARNAGAR', '9068264421', '', '', 'CGFPS7616M', '', '', null, '', '', '2019-03-19 13:47:51', '2019-03-19 13:47:51');
INSERT INTO `lorry` VALUES ('105', 'HR67A4125', 'BCP129846', 'MB1KADYC0CPBD3744', 'ASOK LELAYAND', 'RAJESH KUMAR', 'BALAGARH', '8168505793', '', '', 'CLZPS9220E', '', '', null, '', '', '2019-03-19 13:55:08', '2019-03-19 13:55:08');
INSERT INTO `lorry` VALUES ('106', 'WB41C1775', '697TC55HTZ139129', '373344HTZ132086', 'TATA MOTORS', 'SAFARUL GAIN', '', '9088688741', '', '', 'BZLPG1469C', '', '', null, '', '', '2019-03-19 13:58:06', '2019-03-19 13:58:06');
INSERT INTO `lorry` VALUES ('107', 'MH04EL6677', '697TC58BZY105244', 'MAT469103A7B08331', 'TATA MOTORS', 'VASIULLAH HASMULLAH KHAN', 'HANUMAN MANDIR THANE', '7715095560', '', '', 'ECTPK9675N', '', '', null, '', '', '2019-03-19 14:01:59', '2019-03-19 14:01:59');
INSERT INTO `lorry` VALUES ('108', 'PB11CQ3359', 'DPHZ416058', 'MB1KADYC4DRPJ2923', 'ASOK LELAYAND', 'DIPAK KUMAR', 'RAJPURA PATIALA', '9878245920', '', '', 'CIUPK7599C', '', '', null, '', '', '2019-03-19 14:52:24', '2019-03-19 14:52:24');
INSERT INTO `lorry` VALUES ('109', 'BR01GC2460', 'B591803121C63246067', 'MAT466388C2C06991', 'TATA MOTORS', 'RANDHIR KUMAR SINGH', 'KANKARBAGH PATNA', '9801165075', '', '', 'CRMPS0028R', '', '', null, '', '', '2019-03-19 14:55:06', '2019-03-19 14:55:06');
INSERT INTO `lorry` VALUES ('110', 'HR12F9277', 'B591803231J63345080', 'MAT4480331J10373', 'TATA MOTORS', 'MANJEET SINGH', 'NALAGARH', '8894416496', '', '', 'FCTPS6944H', '', '', null, '', '', '2019-03-19 14:58:17', '2019-03-19 14:58:17');
INSERT INTO `lorry` VALUES ('111', 'PB19F4975', 'XBH682730', 'MB1KADYC3BAXC8408', 'ASOK LELAYAND', 'GURBAX SINGH', 'THALESAN', '7508026100', '', '', 'CQPPS1435L', '', '', null, '', '', '2019-03-19 15:02:25', '2019-03-19 15:02:25');
INSERT INTO `lorry` VALUES ('112', 'PB32H7054', 'JNH542151', 'JNA096197', 'ALOK LEYLAND ', 'GURDARSHAN SINGH', 'AMARGARH', '9592815492', '', '', 'IBQPS2594G', '', '', null, '', '', '2019-03-19 15:19:42', '2019-03-19 15:19:42');
INSERT INTO `lorry` VALUES ('113', 'WB73E5575', 'B59911452090F62763922', 'MAT42602390F09970', 'TATAMI MOTORS', 'U MESHAW SHA', 'SILIGURI ', '9832554525', '', '', 'CSFPS6482R', '', '', null, '', '', '2019-03-19 15:24:20', '2019-03-19 15:24:20');
INSERT INTO `lorry` VALUES ('114', 'WB39A7167', '21D63251756', 'MAT448033C2008635', 'TATA MOTORS', 'NAND KISHORE YADAV', 'BURDWAN', '9474549394', '', '', 'AAIPY5114F', '', '', null, '', '', '2019-03-19 15:29:12', '2019-03-19 15:29:12');
INSERT INTO `lorry` VALUES ('115', 'PB06M9951', '11D63118888', 'MAT466404B5D07300', 'TATA MOTORS', 'DAVINDER SINGH', 'NANOKOT PB', '7087947051', '', '', 'CFQPS1129P', '', '', null, '', '', '2019-03-19 17:17:41', '2019-03-19 17:17:41');
INSERT INTO `lorry` VALUES ('116', 'PB06L9451', '6BTAA59701J62932784', 'MAT466401A2J23233', 'TATA MOTORS', 'DAVINDER SINGH', 'SITHALI GSP PB', '9501315893', '', '', 'CFOPS1129P', '', '', null, '', '', '2019-03-19 17:21:55', '2019-03-19 17:21:55');
INSERT INTO `lorry` VALUES ('117', 'RJ19GB6356', '6BTAA5901H62921242', 'MAT466101A2H21006', 'TATA MOTORS', 'KAILASH RAM', 'DHPUR', '9784348919', '', '', 'AXKPB2432Q', '', '', null, '', '', '2019-03-19 17:26:44', '2019-03-19 17:26:44');
INSERT INTO `lorry` VALUES ('118', 'UP12AT2319', 'GVPZ139118', 'MB1KACFD7GPVV8844', 'ASOK LELAYAND', 'IRFAN', 'SHER NAGAR UP', '9821749178', '', '', 'ACPPI8373M', '', '', null, '', '', '2019-03-19 17:32:13', '2019-03-19 17:32:13');
INSERT INTO `lorry` VALUES ('119', 'RJ19GF2877', '61D63510834', 'MAT541006G3D08545', 'TATA MOTORS', 'MANGLA RAM', 'JODHPUR', '9636596900', '', '', 'BPJPR8969C', '', '', null, '', '', '2019-03-19 17:35:28', '2019-03-19 17:35:28');
INSERT INTO `lorry` VALUES ('120', 'NL02L0892', '697D22LVQ146244', '3880010LUC203802', 'TATA MOTORS', 'BISWANATH SINGH', 'NAGALAND', '8016221031', '', '', 'CHCPS7404P', '', '', null, '', '', '2019-03-19 17:38:34', '2019-03-19 17:38:34');
INSERT INTO `lorry` VALUES ('121', 'BR27G6193', '81J84820318', 'MAT466621J5J24273', 'TATA MOTORS', 'VIPIN KUMAR', 'JHIKARUA NAWADA', '9931220175', '', '', 'CHUPK6753M', '', '', null, '', '', '2019-03-19 17:46:38', '2019-03-19 17:46:38');
INSERT INTO `lorry` VALUES ('122', 'HR38S6727', '31D8410482D', 'MAT466422D5D04017', 'TATA MOTORS', 'PANKAJ KR SINGHAL', 'FARIDABAD', '9818062214', '', '', 'AWCPS5505L', '', '', null, '', '', '2019-03-19 17:54:32', '2019-03-19 17:54:32');
INSERT INTO `lorry` VALUES ('123', 'WB830101', 'S03082461E84312512', 'MAT466429GHF08962', 'TATA MOTORS', 'MIJANUR RAHAMAN', 'RATUA MALDA', '9733370877', '', '', 'BXCPR1741R', '', '', null, '', '', '2019-03-19 17:57:22', '2019-03-19 17:57:22');
INSERT INTO `lorry` VALUES ('124', 'WB65C0875', '61A68493353', 'MAT466395G1A02399', 'TATA MOTORS', 'MD ANARUL ISLAM', 'MALDA', '9733370877', '', '', 'ABAPI4786J', '', '', null, '', '', '2019-03-19 18:02:21', '2019-03-19 18:02:21');
INSERT INTO `lorry` VALUES ('125', 'WB61A1389', '90D62747389', 'MAT42603182D04812', 'TATA MOTORS', 'ALUAD SEIKH', 'JAMNAGAR', '', '', '', 'KHZPS5254S', '', '', null, '', '', '2019-03-19 18:06:05', '2019-03-19 18:06:05');
INSERT INTO `lorry` VALUES ('126', 'WB29B1924', 'GAPZ125673', 'MB1KADYD7GPAU6104', 'ASOK LELAYAND', 'SAWPAN SAMANTA', 'MEDINIPUR', '7063470082', '', '', 'APIPS2198L', '', '', null, '', '', '2019-03-20 09:15:12', '2019-03-20 09:15:12');
INSERT INTO `lorry` VALUES ('127', 'MH15EG8649', 'BA14ZJ0036', '2016NSK3476', 'ASOK LELAYAND', 'RAMDAS SHINDE', 'NASIK', '8888136000', '', '', 'BEFPS3408Q', '', '', null, '', '', '2019-03-20 09:19:06', '2019-03-20 09:19:06');
INSERT INTO `lorry` VALUES ('128', 'CG15AC5546', 'ISBE591804081C63672905', 'MAT541068J1C07145', 'TATA MOTORS', 'ANWAR RAJA', 'LAKHANPUR SURGUJA', '7632934748', '', '', 'BMPPR4630B', '', '', null, '', '', '2019-03-20 09:22:16', '2019-03-20 09:22:16');
INSERT INTO `lorry` VALUES ('129', 'PB06V0832', 'SO3064651F84236554', 'MAT466422FHGHG04079', 'TATA MOTORS', 'SHARANJIT SINGH', 'GURDASPUR', '9592887632', '', '', 'GNRPS4312F', '', '', null, '', '', '2019-03-20 09:27:09', '2019-03-20 09:27:09');
INSERT INTO `lorry` VALUES ('130', 'PB06V0821', 'GTPZ142011', 'MB1NACFD2GPTW1982', 'ASOK LELAYAND', 'RANJIT SINGH', 'GOBIND NAGAR', '9888497884', '', '', 'AVVPS0075K', '', '', null, '', '', '2019-03-20 09:30:23', '2019-03-20 09:30:23');
INSERT INTO `lorry` VALUES ('131', 'PB06V0819', 'GHPZ147756', 'MB1NACFD3HPGW8730', 'ASOK LELAYAND', 'RANJIT SINGH', 'GOBIND NAGAR', '9888497884', '', '', 'AVVPS0075K', '', '', null, '', '', '2019-03-20 09:32:35', '2019-03-20 09:32:35');
INSERT INTO `lorry` VALUES ('132', 'MH15GV7011', '81H84812511', 'MAT466621J22380', 'TATA MOTORS', 'UMESH KUMAR VYAS', 'NASHIK', '', '9584271907', '', 'AGBPV0324R', '', '', null, '', '', '2019-03-20 09:36:53', '2019-03-20 09:36:53');
INSERT INTO `lorry` VALUES ('133', 'BR06GA1820', 'B591803111J63182644', 'MAT466416B3K28785', 'TATA MOTORS', 'MACHCHHU SINGH', 'MUZAFFARPUR', '6297162400', '', '', 'DUWPS2052F', '', '', null, '', '', '2019-03-20 09:41:57', '2019-03-20 09:41:57');
INSERT INTO `lorry` VALUES ('134', 'WB23B6665', '80K62718888', '426023AQZ700392', 'TATA MOTORS', 'MD KALIMUDDIN', 'KOLKATA', '9681921968', '', '', 'BPFPK0325H', '', '', null, '', '', '2019-03-20 09:46:07', '2019-03-20 09:46:07');
INSERT INTO `lorry` VALUES ('135', 'CG04JD0385', '21H84069134', 'MAT466452C5H14838', 'TATA MOTORS', 'MAA ANNAPURNA TRANSPORT', 'RAJPUR', '9399612507', '', '', 'AADCM0917A', '', '', null, '', '', '2019-03-20 09:49:36', '2019-03-20 09:49:36');
INSERT INTO `lorry` VALUES ('136', 'UP14FT5797', 'SO3082461F84315448', 'MAT466129GHF09556', 'TATA MOTORS', 'MUSTKEEM', 'GHAZIBAD', '9313144800', '', '', 'ARLPM8703G', '', '', null, '', '', '2019-03-25 10:26:20', '2019-03-25 10:26:20');
INSERT INTO `lorry` VALUES ('137', 'UP37T2313', '41H84177510', 'MAT466388E5H09583', 'TATA MOTORS', 'KASIB', 'MEERUT UP', '9634301431', '', '', 'BSZPK4058A', '', '', null, '', '', '2019-03-25 10:30:14', '2019-03-25 10:30:14');
INSERT INTO `lorry` VALUES ('138', 'MP20HB5927', 'ISBE591804071J63620601', 'MAT541024H1J18395', 'TATA MOTORS', 'BHOLA PRASAD GUPTA', 'JABALPUR', '8085090903', '', '', 'ATZPG3460E', '', '', null, '', '', '2019-03-25 10:36:40', '2019-03-25 10:36:40');
INSERT INTO `lorry` VALUES ('139', 'UP60T1811', '21A63225441', 'MAT466416C5A02354', 'TATA MOTORS', 'MARKENDY RAI', 'BALLIA UP', '7839071455', '', '', 'BMVPR3194J', '', '', null, '', '', '2019-03-25 10:41:00', '2019-03-25 10:41:00');
INSERT INTO `lorry` VALUES ('140', 'NL01AA7693', 'HYEZ424556', 'MB1NCHD2HEYY7622', 'ASOK LELAYAND', 'DURGA PRASAD GHOSH', 'PASCHIM VIHAR DELHI', '9650064741', '', '', 'ACSPG8517C', '', '', null, '', '', '2019-03-25 10:44:39', '2019-03-25 10:44:39');
INSERT INTO `lorry` VALUES ('141', 'NL01AB8341', 'JFPZ113023', 'MB1NACHD4JPFC4781', 'ASOK LELAYAND', 'DURGA PRASAD GHOSH', 'PASCHIM VOHAR DELHI', '9813217842', '', '', 'ACSPG8517C', '', '', null, '', '', '2019-03-25 10:49:13', '2019-03-25 10:49:13');
INSERT INTO `lorry` VALUES ('142', 'HR69C3547', 'HAPZ127015', 'MB1NACHD5HPAZ4368', 'ASOK LELAYAND', 'RESHAM SINGH', 'REWA MP', '9813217842', '', '', 'CFMPS9496B', '', '', null, '', '', '2019-03-25 10:51:32', '2019-03-25 10:51:32');
INSERT INTO `lorry` VALUES ('143', 'UP63AT1532', 'ISBE591804071J63622410', 'MAT541024HGJ00559', 'TATA MOTORS', 'YOGENDRA MISHRA', 'MIRZAPUR', '9450107110', '', '', 'BXBPM3938C', '', '', null, '', '', '2019-03-25 10:55:39', '2019-03-25 10:55:39');
INSERT INTO `lorry` VALUES ('144', 'WB49N0222', 'CRPZ110373', 'MB1KADWC6CPRF7005', 'ASOK LELAYAND', 'SEKH ALUUDIN', 'BURDWAN', '7319477493', '', '', 'BVYPA9171L', '', '', null, '', '', '2019-03-25 15:26:39', '2019-03-25 15:26:39');
INSERT INTO `lorry` VALUES ('145', 'MP20HB3616', '11L63206370', 'MAT466416B5P20473', 'TATA MOTORS', 'MOHD HANIF ANSARI', 'JABALPUR', '8435172717', '', '', 'AVHPA1266C', '', '', null, '', '', '2019-03-25 16:05:15', '2019-03-25 16:05:15');
INSERT INTO `lorry` VALUES ('146', 'AP29TB2329', '11D84002516', 'MAT448030B7D17953', 'TATA MOTORS', 'NAV DURGA TRANSPORT CO', 'TELANGANA', '9394610539', '', '', 'AAFPU4927R', '', '', null, '', '', '2019-03-25 18:56:06', '2019-03-25 18:56:06');
INSERT INTO `lorry` VALUES ('147', 'HP12F9277', 'B591803231J63345080', 'MAT448033D2J10373', 'TATA MOTORS', 'MANJEET SINGH', 'NALAGARH HIMACHAL PRADESH', '8894416496', '', '', 'FCTPS6944H', '', '', null, '', '', '2019-03-25 19:03:07', '2019-03-25 19:03:07');
INSERT INTO `lorry` VALUES ('148', 'UP14ET5897', '51E84230793', 'MAT466388F5F07477', 'TATA MOTORS', 'NISHA', 'GHAZIBAD', '6397220573', '', '', 'ASOPN7625A', '', '', null, '', '', '2019-03-25 19:26:42', '2019-03-25 19:26:42');
INSERT INTO `lorry` VALUES ('149', 'UP63AT8909', 'S03082461B84286579', 'MAT466429GHB03553', 'TATA MOTORS', 'LAXMAN DAS GUPTA', 'MIRZAPUR', '9589523722', '', '', 'AUDPG5418P', '', '', null, '', '', '2019-03-25 19:29:43', '2019-03-25 19:29:43');
INSERT INTO `lorry` VALUES ('150', 'UP63T8909', 'SO3082461B84286579', 'MAT466429GHB03553', 'TATA', 'LAXMAN DAS GUPTA ', 'MIRZAPUR, UP', '9589523722', '', '', 'AUDPG5418P', '', '', null, '', '', '2019-03-26 19:06:11', '2019-03-26 19:06:11');
INSERT INTO `lorry` VALUES ('151', 'UP63T3911', '21H8406862', 'MAT448035C5H1455', 'TATA MOTORS', 'MANOR KUMAR TIWARI', 'MIRZAPUR', '9610215702', '', '', 'AKQPT5509B', '', '', null, '', '', '2019-03-28 12:25:04', '2019-03-28 12:25:04');
INSERT INTO `lorry` VALUES ('152', 'RJ02GB7925', 'ISBE591804081J63728168', 'MAT41057J1J27863', 'TATA MOTORS', 'JASMAL KHAN', 'RAJASATHAN', '9001628135', '', '', 'BPVPK9197', '', '', null, '', '', '2019-03-28 12:32:18', '2019-03-28 12:32:18');
INSERT INTO `lorry` VALUES ('153', 'WB51A8539', '497T92NWY850976', 'MAT457403D7N30427', 'TATAMI MOTORS', 'ARUN RAY', 'NADIA', '9800293119', '', '', 'CDAPR0381N', '', '', null, '', '', '2019-03-28 12:39:12', '2019-03-28 12:39:12');
INSERT INTO `lorry` VALUES ('154', 'WB15A1607', '40K62363815', '388341KVZ136697', 'TATA MOTORS', 'BIKASH GHOSH', 'BURDWAN', '9434573161', '', '', 'AFTPG6167Q', '', '', null, '', '', '2019-03-28 13:07:29', '2019-03-28 13:07:29');
INSERT INTO `lorry` VALUES ('155', 'NL01L5613', 'BPH455146', 'BPAO75977', 'TATAMI MOTORS', 'YASPRIT SINGH SAGOO', 'NAGALAND', '9434881124', '', '', 'CMSPS1569L', '', '', null, '', '', '2019-03-28 13:12:28', '2019-03-28 13:12:28');
INSERT INTO `lorry` VALUES ('156', 'WB23C5621', '', '', '', 'UTTAM KUMAR', '', '8297169286', '', '', 'FELPS6564H', '', '', null, '', '', '2019-03-28 13:19:16', '2019-03-28 13:19:16');
INSERT INTO `lorry` VALUES ('157', 'WB25D5590', '', '', '', 'PARVEEN KUMAR SINGH', '', '7003138944', '', '', 'ALQPS1371P', '', '', null, '', '', '2019-03-28 13:23:57', '2019-03-28 13:23:57');
INSERT INTO `lorry` VALUES ('158', 'WB53B8743', 'S0382461L84352519', 'MAT466429HHA00076', 'TATA MOTORS', 'KAZI SHARIF ALAM', 'BIRBHUM', '9734449443', '', '', 'AYSPA1741Q', '', '', null, '', '', '2019-03-28 13:31:37', '2019-03-28 13:31:37');
INSERT INTO `lorry` VALUES ('159', 'JH10X1654', '6BTAA5901G62906824', 'MAT466401A2G1986', 'TATAMI MOTORS', 'SK MD AKHTAR HUSSAIN ', 'BURDWAN', '8927760830', '', '', 'AEKPH2079G', '', '', null, '', '', '2019-03-28 13:43:04', '2019-03-28 13:43:04');
INSERT INTO `lorry` VALUES ('160', 'WB23A7108', '40G62347892', '388341HVZ126806', 'TATA MOTORS', 'RAMJAN SEKH', 'NADIA ', '9641227208', '', '', 'CODPS5893G', '', '', null, '', '', '2019-03-28 13:50:51', '2019-03-28 13:50:51');
INSERT INTO `lorry` VALUES ('161', 'MH40BG4650', 'ISBE591804071M6365197', 'MAT541024H1P29326', 'TATAMI MOTORS', 'AMAR KESHARWANI', 'NAGPUR', '8319705804', '', '', 'BSOPK6294F', '', '', null, '', '', '2019-03-28 14:24:16', '2019-03-28 14:24:16');
INSERT INTO `lorry` VALUES ('162', 'MH20HB9187', 'S0382461F84313640', 'MAT466429GHF09145', 'TATA MOTORS', 'BRAJ KISHORE CHAUBEY', 'JABALPUR', '8770424692', '', '', 'ADOPC8554A', '', '', null, '', '', '2019-03-28 14:30:57', '2019-03-28 14:30:57');
INSERT INTO `lorry` VALUES ('163', 'BR01GG8236', 'ISB59B4S180T181F63707027', 'MAT541109JF20773', 'TATAMI MOTORS', 'AJAY KUMAR ', 'PATNA ', '8409316280', '', '', 'BGBPK8613B', '', '', null, '', '', '2019-03-28 14:38:50', '2019-03-28 14:38:50');
INSERT INTO `lorry` VALUES ('164', 'WB41E3953', '01F62887918', 'MAT426031A1F22324', 'TATA MOTORS', 'GAYARAM MANDAL', 'MEDNAPUR ', '7872720412', '', '', 'CJAPM2718Q', '', '', null, '', '', '2019-03-28 14:58:07', '2019-03-28 14:58:07');
INSERT INTO `lorry` VALUES ('165', 'MH21NX4242', 'S03082461K84342618', 'MAT466429GHN13708', 'TATAMI MOTORS', 'TAJAVEVACANT AHILAJI', 'PUNE', '9561883687', '', '', 'ACTPT9115G', '', '', null, '', '', '2019-03-28 15:09:15', '2019-03-28 15:09:15');
INSERT INTO `lorry` VALUES ('166', 'BR01GH3602', 'MB1KACHD2JPWG3789', 'JWPZ154544', 'ALOK LEYLAND ', 'UDAY KUMAR', 'PATNA ', '9939937055', '', '', 'DWSPK7840F', '', '', null, '', '', '2019-03-28 16:16:04', '2019-03-28 16:16:04');
INSERT INTO `lorry` VALUES ('167', 'WB67A8888', '41K63400442', 'MAT466388E16837', 'TATA MOTORS', 'RAKHAL CH DEY', 'BANKURA', '70630947900', '', '', 'AHKPD8318H', '', '', null, '', '', '2019-03-28 16:24:17', '2019-03-28 16:24:17');
INSERT INTO `lorry` VALUES ('168', 'MH27BX1009', 'ISBE591804071M63650099', 'MAT541024H1P28726', 'TATAMI MOTORS', 'SURAJ MISHRA', 'AMRAVATI', '9422156970', '', '', 'AXIPM1645C', '', '', null, '', '', '2019-03-28 16:32:59', '2019-03-28 16:32:59');
INSERT INTO `lorry` VALUES ('169', 'WB57A6644', '697D22kQQ132268', '373011LQQ008701', 'TATA MOTORS', 'RAMESH BISWAS', 'RAIGANG', '9163275198', '9732091414', 'WB51A 1433487', 'BMDPB0709F', '', '', null, '', '', '2019-03-28 16:57:08', '2019-03-28 16:57:08');
INSERT INTO `lorry` VALUES ('170', 'SK04D0614', '', '', '', 'UWENDRA KAMALA THAPA', 'JORETHANG', '9002350302', '', '', 'ANXPT0672R', '', '', null, '', '', '2019-03-28 17:05:47', '2019-03-28 17:05:47');
INSERT INTO `lorry` VALUES ('171', 'PB13BE6619', '81L84842753', 'MAT466621J530609', 'TATA MOTORS', 'JASPREET SINGH SIDHU', 'DILAWARGHARH', '9039020819', '', '', 'GZZPS3012Q', '', '', null, '', '', '2019-03-28 17:15:40', '2019-03-28 17:15:40');
INSERT INTO `lorry` VALUES ('172', 'CG14D1277', 'B591803241D63370605', 'MAT466388E3D07629', 'TATAMI MOTORS', 'RAMRATAN BAJAJ', 'JASHPUR', '7067872974', '', '', 'ADDPB5818P', '', '', null, '', '', '2019-03-28 17:48:31', '2019-03-28 17:48:31');
INSERT INTO `lorry` VALUES ('173', 'WB51A4907', 'E483CDBD530140', 'MC226HRCBD053227', 'TATAMI MOTORS', 'AHENDRA DUTTA', 'NADIA', '8777699935', '', '', 'AKNPD0155A', '', '', null, '', '', '2019-03-28 17:56:08', '2019-03-28 17:56:08');
INSERT INTO `lorry` VALUES ('174', 'WB67A3973', '21K63297612', 'MAT466388C2K24474', 'TATA MOTORS', 'VIEVEK LAL CHOURASIA ', 'RANIGANJ', '9563332806', '', '', 'AXNPC5919J', '', '', null, '', '', '2019-03-28 18:03:34', '2019-03-28 18:03:34');
INSERT INTO `lorry` VALUES ('175', 'MH40BG8650', 'ISB59B4S180T181E63697245', 'MAT541109J1E17182', 'TATA MOTORS', 'AMAR KESHARWANI', 'NAGPUR', '8319705804', '', '', 'BSOPK6294F', '', '', null, '', '', '2019-03-28 18:10:42', '2019-03-28 18:10:42');
INSERT INTO `lorry` VALUES ('176', 'UP63AT1252', 'HYPZ130701', 'MB1NACHD3HPYZ8097', 'ALOK LEYLAND ', 'HEERA MANI GUPTA', 'MiRZAPUR', '6262392073', '', '', 'ASQPG6033P', '', '', null, '', '', '2019-03-28 18:16:08', '2019-03-28 18:16:08');
INSERT INTO `lorry` VALUES ('177', 'MP20HB2059', '852695', 'C06000', 'TATA MOTORS', 'TAWFIKUL AMBIA', 'JABALPUR', '8358844987', '', '', 'BKZPA4675H', '', '', null, '', '', '2019-03-28 18:22:22', '2019-03-28 18:22:22');
INSERT INTO `lorry` VALUES ('178', 'WB73B4366', '697TC58DQZ106361', 'MAT46910191D09347', 'TATA', 'RAJU ROY', 'PRAKASH NAGAR, SILIGURI', '9800159820', '', '', 'BTVPR4438L', '', '', null, '', '', '2019-03-29 12:54:39', '2019-03-29 12:54:39');
INSERT INTO `lorry` VALUES ('179', 'PB11CF8873', 'B591803221K63294478', 'MAT466388C3K29102', 'TATA', 'SAVRN KAUR', 'BASANTPURA PUNJAB', '7716108873', '', '', 'CFGPK0822P', '', '', null, '', '', '2019-03-29 13:16:52', '2019-03-29 13:16:52');
INSERT INTO `lorry` VALUES ('180', 'WB73D6003', '497TC92EUY0435', 'MAT457403D7N30427', 'TATAMI MOTORS', 'DIPMANI PRADHAN', 'SILIGURI', '8617866762', '', '', 'BAZPP4113M', '', '', null, '', '', '2019-03-31 11:02:33', '2019-03-31 11:02:33');
INSERT INTO `lorry` VALUES ('181', 'WB296339', 'SWE393018', 'SWE527097', 'ALOK LEYLAND ', 'SUKUMAR PATTANAYAK ', 'MEDINIPUR', '9932383685', '', '', 'AJEPP7344R', '', '', null, '', '', '2019-03-31 11:12:00', '2019-03-31 11:12:00');
INSERT INTO `lorry` VALUES ('182', 'WB29A8414', 'EDPZ101867', 'MB1KADWC9EPDJ7154', 'ALOK LEYLAND ', 'MAHASIN ALI KHAN ', 'MEDINIPUR ', '7679732069', '', '', 'DGWPK0861E', '', '', null, '', '', '2019-03-31 11:19:00', '2019-03-31 11:19:00');
INSERT INTO `lorry` VALUES ('183', 'NL02K2451', 'B591803111A62984862 ', 'MAT46640B2A02148', 'TATAMI MOTORS', 'DHANANJAY SHAW', 'NAG ALAN ', '9002951476', '', '', 'BWXPS9758K', '', '', null, '', '', '2019-03-31 11:25:38', '2019-03-31 11:25:38');
INSERT INTO `lorry` VALUES ('184', 'WB39A5367', '11A62982783', 'MAT466404B2A01917', 'TATAMI MOTORS', 'RAJESH BANERJEE', 'DURGAPUR ', '9832233383', '', '', 'ANPBB2535R ', '', '', null, '', '', '2019-03-31 11:29:56', '2019-03-31 11:29:56');
INSERT INTO `lorry` VALUES ('185', 'WB61A6198', '497TC41KSY831628', 'MAT508573H7K14822', 'TATAMI MOTORS', 'PRAKASH ROY', 'GANGARAMPUR', '9933514802', '', '', 'BDZPR0611K', '', '', null, '', '', '2019-03-31 11:39:37', '2019-03-31 11:39:37');
INSERT INTO `lorry` VALUES ('186', 'WB29A8405', 'EYPZ108253', 'MB1KADYC4EPYK3436', 'ALOK LEYLAND ', 'SEKH MAFIJUL', 'MEDINIPUR ', '9732749282', '', '', 'CPPPM4764P', '', '', null, '', '', '2019-03-31 11:46:19', '2019-03-31 11:46:19');
INSERT INTO `lorry` VALUES ('187', 'RJ32GA8533', '11F63151269', 'MAT466404BSG11759', '', 'RAM SINGH', 'JALALPUR ', '7073679614', '', '', 'CITPG0825N', '', '', null, '', '', '2019-03-31 11:52:58', '2019-03-31 11:52:58');
INSERT INTO `lorry` VALUES ('188', 'RJ02GA4685', 'MAH650662', 'MBICMDWC8AAMB8297', 'ALOK LEYLAND ', 'SMT KUNTI DEVI ', 'ALWAR ', '9057289021', '', '', 'BPEBD7910J', '', '', null, '', '', '2019-03-31 12:05:52', '2019-03-31 12:05:52');
INSERT INTO `lorry` VALUES ('189', 'AP16TV6739', '697TC57MUZ915648', '444026MUZ758838', 'TATA MOTORS', 'RAVITEJA TRIPURANI', 'VIJAYAWADA', '9398304927', '', '', 'BHOPT5917M', '', '', null, '', '', '2019-03-31 12:12:21', '2019-03-31 12:12:21');
INSERT INTO `lorry` VALUES ('190', 'AP39V1355', 'KJPZ103451', 'MB1KACHD8KPJH2046', 'ALOK LEYLAND ', 'BANDI SOBHA RANI', 'GANDHI NAGAR EXTENSION GUNTUR', '9440556139', '', '', 'AOJPB5766P', '', '', null, '', '', '2019-03-31 12:18:17', '2019-03-31 12:18:17');
INSERT INTO `lorry` VALUES ('191', 'PB13U9115', '68T45HP90E62755314', 'MAT42603191E11218', 'TATAMI MOTORS', 'SUBODH KUMAR', 'SANGRPUR', '', '', '', 'AYTPK0717F', '', '', null, '', '', '2019-03-31 12:22:30', '2019-03-31 12:22:30');
INSERT INTO `lorry` VALUES ('192', 'UP63AT1251', 'HYPZ130727', 'MBINACHD3HPYZ8150', 'ALOK LEYLAND ', 'MR CHHATHI LAL KESHARWANI', 'MIRZAPUR', '6261681870', '', '', 'AYHPK6832H', '', '', null, '', '', '2019-03-31 12:30:53', '2019-03-31 12:30:53');
INSERT INTO `lorry` VALUES ('193', 'NL01G1453', '697TC57FSZ130580', '444026FSZ121557', 'TATA MOTORS', 'FATEH SINGH BARMI', 'KOHIMA', '8653821278', '', '', 'ADAPB5585A', '', '', null, '', '', '2019-03-31 12:35:32', '2019-03-31 12:35:32');
INSERT INTO `lorry` VALUES ('194', 'PB10DZ4987', 'J1C84098812', 'MAT466420D5C02309', 'TATA MOTORS', 'AMIT KUMAR', 'LUDHIANA ', '9815278883', '', '', 'BJXPK6212K', '', '', null, '', '', '2019-03-31 12:48:43', '2019-03-31 12:48:43');
INSERT INTO `lorry` VALUES ('195', 'PB13AR8996', '21B62604017 ', 'MAT466050C3B20016 ', 'TATA MOTORS', 'YADWINDER SINGH', 'SANGARUR RTA', '9463684517', '', '', 'EDOPS0846F', '', '', null, '', '', '2019-03-31 12:53:31', '2019-03-31 12:53:31');
INSERT INTO `lorry` VALUES ('196', 'PB11AS9411', '01J62927212', 'MAT466401AZJ22377', 'TATA MOTORS', 'RAJINDER KUMAR ', 'PATIALA', '9417860915', '', '', 'BOIPK8416D', '', '', null, '', '', '2019-03-31 12:57:40', '2019-03-31 12:57:40');
INSERT INTO `lorry` VALUES ('197', 'NL02N7330', '01E62216082', 'MAT426031A3E20101', 'TATA MOTORS', 'KRISHNA PADA ROY', 'NAGALAND', '6294004513', '', '', 'DFUPR9455E', '', '', null, '', '', '2019-03-31 13:05:48', '2019-03-31 13:05:48');
INSERT INTO `lorry` VALUES ('198', 'RJ142G9514', '50B62386526 ', '426021BUZ104918', 'TATA MOTORS', 'BHAG CHAND GUPTA ', 'JAIPUR ', '9720041976', '', '', 'ACQPG5130P', '', '', null, '', '', '2019-03-31 13:10:02', '2019-03-31 13:10:02');
INSERT INTO `lorry` VALUES ('199', 'PB29L6693', '63108635', 'MAT466375B5C06020', 'TATA MOTORS', 'MANJIT SINGH ', 'FEROZEPUR', '6239200336', '', '', 'BJMPS5230A', '', '', null, '', '', '2019-03-31 13:14:35', '2019-03-31 13:14:35');
INSERT INTO `lorry` VALUES ('200', 'RJ02GB1455', 'FBPZ113333', 'MB1CTDYC3FPM8035', 'TATA MOTORS', 'KUNTI DEVI ', 'ALWAR ', '9660509754', '', '', 'BPEBD7910J', '', '', null, '', '', '2019-03-31 13:21:55', '2019-03-31 13:21:55');
INSERT INTO `lorry` VALUES ('201', 'NL05D3920', '697TC57KUZ898656', '444026LUZ750968', 'TATA MOTORS', 'FATEH SINGH BARMI', 'NAGALAND ', '', '', '', 'ADAPB5585A', '', '', null, '', '', '2019-03-31 13:25:40', '2019-03-31 13:25:40');
INSERT INTO `lorry` VALUES ('202', 'WB73B4367', '697TC58DQZ106522', 'MAT46910191D09341', 'TATA MOTORS', 'DINESH MANDAL ', 'SILIGURI ', '9678968507', '', '', 'AVWPM7498K', '', '', null, '', '', '2019-03-31 13:57:05', '2019-03-31 13:57:05');
INSERT INTO `lorry` VALUES ('203', 'BR27G0173', 'B591803111K63184348', 'MAT466386B2K22434', 'TATA MOTORS', 'MAHAVIR YADAV ', 'PATNA ', '6299481445', '', '', 'ANQPY8554J', '', '', null, '', '', '2019-03-31 14:03:34', '2019-03-31 14:03:34');
INSERT INTO `lorry` VALUES ('204', 'UP63T5681', 'ETPZ115407', 'MB1KADYC4EPTL1196', 'ALOK LEYLAND ', 'GOVIND YADAV ', 'GHAZIPUR', '9648623214', '', '', 'AMEPY1141L', '', '', null, '', '', '2019-03-31 14:07:26', '2019-03-31 14:07:26');
INSERT INTO `lorry` VALUES ('205', 'RJ18GB5911', 'JYPZ143987', 'MD1CTCHD7JAY5569', 'ALOK LEYLAND ', 'RAJENDRA SINGH ', 'SURAJGARH ', '9079896408', '', '', 'ESRPS1368L', '', '', null, '', '', '2019-03-31 14:17:51', '2019-03-31 14:17:51');
INSERT INTO `lorry` VALUES ('206', 'HR69C2330', '61F84241109', 'MAY448037G5H13029', 'TATA MOTORS', 'JAGBIR', 'DELHI', '9813064507', '', '', 'GLUPS8937R', '', '', null, '', '', '2019-03-31 14:21:30', '2019-03-31 14:21:30');
INSERT INTO `lorry` VALUES ('207', 'UP61AT3784', 'B59145201D82869135', 'MAT426023A7D18445', 'TATA MOTORS', 'RAJ BAHADUR YADAV', 'GHAZIPUR', '9415380483', '', '', 'AHWPY6469N', '', '', null, '', '', '2019-03-31 14:26:28', '2019-03-31 14:26:28');
INSERT INTO `lorry` VALUES ('208', 'RJ19GF9785', '91A84853059', 'MAT456622K5A01522', 'TATA MOTORS', 'MUSE KHAN', 'KERU JODHPUR', '99550199201', '', '', 'DLTPK5936G', '', '', null, '', '', '2019-03-31 19:03:07', '2019-03-31 19:03:07');
INSERT INTO `lorry` VALUES ('209', 'UP65FT8318', 'ISBE591804071K63634642', 'MAT541024H1N23157', 'TATA MOTORS', 'MANOJ SAH', 'VARANASI', '9973971559', '', '', 'BDSPS7289B', '', '', null, '', '', '2019-03-31 19:05:26', '2019-03-31 19:05:26');
INSERT INTO `lorry` VALUES ('210', 'PB12Q2897', '21B84043825', 'MAT466420C5B04582', 'TATA MOTORS', 'BHAWAN SINGH', 'RUPNAGAR PB', '7347297520', '', '', 'DIXPS7656N', '', '', null, '', '', '2019-03-31 20:18:29', '2019-03-31 20:18:29');
INSERT INTO `lorry` VALUES ('211', 'MP20HB9887', '91804071M63652609', 'MAT541024H1P29607', 'TATA MOTORS', 'VED PRAKASH CHAUBEY', 'JABALPUR', '9425157257', '', '', 'ADOPC5751B', '', '', null, '', '', '2019-04-01 18:54:37', '2019-04-01 18:54:37');

-- ----------------------------
-- Table structure for `lorry_image`
-- ----------------------------
DROP TABLE IF EXISTS `lorry_image`;
CREATE TABLE `lorry_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lorry_id` int(11) DEFAULT NULL,
  `rc_image` varchar(255) DEFAULT NULL,
  `permit_image` varchar(255) DEFAULT NULL,
  `insurance_image` varchar(255) DEFAULT NULL,
  `fitness_image` varchar(255) DEFAULT NULL,
  `pan_image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `lorry_id` (`lorry_id`),
  CONSTRAINT `lorry_id` FOREIGN KEY (`lorry_id`) REFERENCES `lorry` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=207 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of lorry_image
-- ----------------------------
INSERT INTO `lorry_image` VALUES ('1', '6', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-05 18:14:35', '2019-03-05 18:14:35');
INSERT INTO `lorry_image` VALUES ('2', '7', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-07 11:58:29', '2019-03-07 11:58:29');
INSERT INTO `lorry_image` VALUES ('3', '8', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-07 15:44:29', '2019-03-07 15:44:29');
INSERT INTO `lorry_image` VALUES ('4', '9', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-07 16:08:26', '2019-03-07 16:08:26');
INSERT INTO `lorry_image` VALUES ('5', '10', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-07 16:11:19', '2019-03-07 16:11:19');
INSERT INTO `lorry_image` VALUES ('6', '11', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-07 16:16:34', '2019-03-07 16:16:34');
INSERT INTO `lorry_image` VALUES ('7', '12', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-07 16:20:54', '2019-03-07 16:20:54');
INSERT INTO `lorry_image` VALUES ('8', '13', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-07 20:32:38', '2019-03-07 20:32:38');
INSERT INTO `lorry_image` VALUES ('9', '14', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-08 12:39:27', '2019-03-08 12:39:27');
INSERT INTO `lorry_image` VALUES ('10', '15', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-08 12:45:46', '2019-03-08 12:45:46');
INSERT INTO `lorry_image` VALUES ('11', '16', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-08 12:54:19', '2019-03-08 12:54:19');
INSERT INTO `lorry_image` VALUES ('12', '17', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-08 13:11:59', '2019-03-08 13:11:59');
INSERT INTO `lorry_image` VALUES ('13', '18', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-08 13:17:38', '2019-03-08 13:17:38');
INSERT INTO `lorry_image` VALUES ('14', '19', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-08 13:25:13', '2019-03-08 13:25:13');
INSERT INTO `lorry_image` VALUES ('15', '20', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-08 13:32:34', '2019-03-08 13:32:34');
INSERT INTO `lorry_image` VALUES ('16', '21', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-08 13:39:08', '2019-03-08 13:39:08');
INSERT INTO `lorry_image` VALUES ('17', '22', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-08 13:49:11', '2019-03-08 13:49:11');
INSERT INTO `lorry_image` VALUES ('18', '23', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-08 13:55:04', '2019-03-08 13:55:04');
INSERT INTO `lorry_image` VALUES ('19', '24', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-08 14:03:37', '2019-03-08 14:03:37');
INSERT INTO `lorry_image` VALUES ('20', '25', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-08 14:09:51', '2019-03-08 14:09:51');
INSERT INTO `lorry_image` VALUES ('21', '26', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-09 10:57:24', '2019-03-09 10:57:24');
INSERT INTO `lorry_image` VALUES ('22', '27', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-09 11:03:58', '2019-03-09 11:03:58');
INSERT INTO `lorry_image` VALUES ('23', '28', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-09 11:09:00', '2019-03-09 11:09:00');
INSERT INTO `lorry_image` VALUES ('24', '29', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-09 11:12:51', '2019-03-09 11:12:51');
INSERT INTO `lorry_image` VALUES ('25', '30', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-09 12:10:44', '2019-03-09 12:10:44');
INSERT INTO `lorry_image` VALUES ('26', '31', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-10 23:56:48', '2019-03-10 23:56:48');
INSERT INTO `lorry_image` VALUES ('27', '32', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-10 23:59:50', '2019-03-10 23:59:50');
INSERT INTO `lorry_image` VALUES ('28', '33', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-11 00:02:33', '2019-03-11 00:02:33');
INSERT INTO `lorry_image` VALUES ('29', '34', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-11 00:06:47', '2019-03-11 00:06:47');
INSERT INTO `lorry_image` VALUES ('30', '35', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-11 08:00:36', '2019-03-11 08:00:36');
INSERT INTO `lorry_image` VALUES ('31', '36', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-11 08:03:40', '2019-03-11 08:03:40');
INSERT INTO `lorry_image` VALUES ('32', '37', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-11 08:53:00', '2019-03-11 08:53:00');
INSERT INTO `lorry_image` VALUES ('33', '38', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-13 19:02:13', '2019-03-13 19:02:13');
INSERT INTO `lorry_image` VALUES ('34', '39', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-13 19:28:54', '2019-03-13 19:28:54');
INSERT INTO `lorry_image` VALUES ('35', '40', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-13 20:34:55', '2019-03-13 20:34:55');
INSERT INTO `lorry_image` VALUES ('36', '41', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-13 20:37:29', '2019-03-13 20:37:29');
INSERT INTO `lorry_image` VALUES ('37', '42', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-13 20:39:49', '2019-03-13 20:39:49');
INSERT INTO `lorry_image` VALUES ('38', '43', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-13 21:02:41', '2019-03-13 21:02:41');
INSERT INTO `lorry_image` VALUES ('39', '44', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-14 09:44:19', '2019-03-14 09:44:19');
INSERT INTO `lorry_image` VALUES ('40', '45', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-14 15:16:25', '2019-03-14 15:16:25');
INSERT INTO `lorry_image` VALUES ('41', '46', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-14 15:21:29', '2019-03-14 15:21:29');
INSERT INTO `lorry_image` VALUES ('42', '47', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-14 15:24:19', '2019-03-14 15:24:19');
INSERT INTO `lorry_image` VALUES ('43', '48', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-14 15:30:34', '2019-03-14 15:30:34');
INSERT INTO `lorry_image` VALUES ('44', '49', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-14 15:39:53', '2019-03-14 15:39:53');
INSERT INTO `lorry_image` VALUES ('45', '50', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-14 15:52:29', '2019-03-14 15:52:29');
INSERT INTO `lorry_image` VALUES ('46', '51', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-14 15:57:38', '2019-03-14 15:57:38');
INSERT INTO `lorry_image` VALUES ('47', '52', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-14 16:09:09', '2019-03-14 16:09:09');
INSERT INTO `lorry_image` VALUES ('48', '53', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-14 16:20:19', '2019-03-14 16:20:19');
INSERT INTO `lorry_image` VALUES ('49', '54', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-14 16:42:32', '2019-03-14 16:42:32');
INSERT INTO `lorry_image` VALUES ('50', '55', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-14 16:46:08', '2019-03-14 16:46:08');
INSERT INTO `lorry_image` VALUES ('51', '56', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-14 16:49:01', '2019-03-14 16:49:01');
INSERT INTO `lorry_image` VALUES ('52', '57', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-14 16:52:33', '2019-03-14 16:52:33');
INSERT INTO `lorry_image` VALUES ('53', '58', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-14 16:55:02', '2019-03-14 16:55:02');
INSERT INTO `lorry_image` VALUES ('54', '59', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-14 16:59:02', '2019-03-14 16:59:02');
INSERT INTO `lorry_image` VALUES ('55', '60', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-14 17:01:27', '2019-03-14 17:01:27');
INSERT INTO `lorry_image` VALUES ('56', '61', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-14 17:04:09', '2019-03-14 17:04:09');
INSERT INTO `lorry_image` VALUES ('57', '62', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-15 12:09:40', '2019-03-15 12:09:40');
INSERT INTO `lorry_image` VALUES ('58', '63', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-15 12:13:15', '2019-03-15 12:13:15');
INSERT INTO `lorry_image` VALUES ('59', '64', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-15 12:19:06', '2019-03-15 12:19:06');
INSERT INTO `lorry_image` VALUES ('60', '65', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-15 12:21:56', '2019-03-15 12:21:56');
INSERT INTO `lorry_image` VALUES ('61', '66', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-15 12:25:14', '2019-03-15 12:25:14');
INSERT INTO `lorry_image` VALUES ('62', '67', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-15 12:29:56', '2019-03-15 12:29:56');
INSERT INTO `lorry_image` VALUES ('64', '69', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-15 13:01:56', '2019-03-15 13:01:56');
INSERT INTO `lorry_image` VALUES ('65', '70', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-15 13:05:02', '2019-03-15 13:05:02');
INSERT INTO `lorry_image` VALUES ('66', '71', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-15 13:08:26', '2019-03-15 13:08:26');
INSERT INTO `lorry_image` VALUES ('67', '72', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-15 13:13:05', '2019-03-15 13:13:05');
INSERT INTO `lorry_image` VALUES ('68', '73', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-15 13:16:12', '2019-03-15 13:16:12');
INSERT INTO `lorry_image` VALUES ('69', '74', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-15 13:18:35', '2019-03-15 13:18:35');
INSERT INTO `lorry_image` VALUES ('70', '75', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-15 13:21:05', '2019-03-15 13:21:05');
INSERT INTO `lorry_image` VALUES ('71', '76', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-15 18:33:29', '2019-03-15 18:33:29');
INSERT INTO `lorry_image` VALUES ('72', '77', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-18 15:51:55', '2019-03-18 15:51:55');
INSERT INTO `lorry_image` VALUES ('73', '78', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-19 09:45:02', '2019-03-19 09:45:02');
INSERT INTO `lorry_image` VALUES ('74', '79', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-19 09:47:34', '2019-03-19 09:47:34');
INSERT INTO `lorry_image` VALUES ('75', '80', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-19 09:50:15', '2019-03-19 09:50:15');
INSERT INTO `lorry_image` VALUES ('76', '81', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-19 09:52:46', '2019-03-19 09:52:46');
INSERT INTO `lorry_image` VALUES ('77', '82', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-19 09:58:43', '2019-03-19 09:58:43');
INSERT INTO `lorry_image` VALUES ('78', '83', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-19 10:02:43', '2019-03-19 10:02:43');
INSERT INTO `lorry_image` VALUES ('79', '84', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-19 10:27:04', '2019-03-19 10:27:04');
INSERT INTO `lorry_image` VALUES ('80', '85', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-19 10:29:59', '2019-03-19 10:29:59');
INSERT INTO `lorry_image` VALUES ('81', '86', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-19 10:32:42', '2019-03-19 10:32:42');
INSERT INTO `lorry_image` VALUES ('82', '87', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-19 10:39:01', '2019-03-19 10:39:01');
INSERT INTO `lorry_image` VALUES ('83', '88', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-19 10:42:26', '2019-03-19 10:42:26');
INSERT INTO `lorry_image` VALUES ('84', '89', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-19 10:55:44', '2019-03-19 10:55:44');
INSERT INTO `lorry_image` VALUES ('85', '90', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-19 10:58:13', '2019-03-19 10:58:13');
INSERT INTO `lorry_image` VALUES ('86', '91', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-19 11:01:24', '2019-03-19 11:01:24');
INSERT INTO `lorry_image` VALUES ('87', '92', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-19 11:31:28', '2019-03-19 11:31:28');
INSERT INTO `lorry_image` VALUES ('88', '93', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-19 11:34:37', '2019-03-19 11:34:37');
INSERT INTO `lorry_image` VALUES ('89', '94', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-19 11:37:51', '2019-03-19 11:37:51');
INSERT INTO `lorry_image` VALUES ('90', '95', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-19 12:01:50', '2019-03-19 12:01:50');
INSERT INTO `lorry_image` VALUES ('91', '96', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-19 12:05:17', '2019-03-19 12:05:17');
INSERT INTO `lorry_image` VALUES ('92', '97', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-19 12:08:54', '2019-03-19 12:08:54');
INSERT INTO `lorry_image` VALUES ('93', '98', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-19 12:17:56', '2019-03-19 12:17:56');
INSERT INTO `lorry_image` VALUES ('94', '99', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-19 13:10:30', '2019-03-19 13:10:30');
INSERT INTO `lorry_image` VALUES ('95', '100', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-19 13:13:55', '2019-03-19 13:13:55');
INSERT INTO `lorry_image` VALUES ('96', '101', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-19 13:21:03', '2019-03-19 13:21:03');
INSERT INTO `lorry_image` VALUES ('97', '102', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-19 13:27:34', '2019-03-19 13:27:34');
INSERT INTO `lorry_image` VALUES ('98', '103', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-19 13:34:27', '2019-03-19 13:34:27');
INSERT INTO `lorry_image` VALUES ('99', '104', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-19 13:47:51', '2019-03-19 13:47:51');
INSERT INTO `lorry_image` VALUES ('100', '105', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-19 13:55:08', '2019-03-19 13:55:08');
INSERT INTO `lorry_image` VALUES ('101', '106', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-19 13:58:06', '2019-03-19 13:58:06');
INSERT INTO `lorry_image` VALUES ('102', '107', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-19 14:01:59', '2019-03-19 14:01:59');
INSERT INTO `lorry_image` VALUES ('103', '108', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-19 14:52:24', '2019-03-19 14:52:24');
INSERT INTO `lorry_image` VALUES ('104', '109', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-19 14:55:06', '2019-03-19 14:55:06');
INSERT INTO `lorry_image` VALUES ('105', '110', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-19 14:58:17', '2019-03-19 14:58:17');
INSERT INTO `lorry_image` VALUES ('106', '111', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-19 15:02:25', '2019-03-19 15:02:25');
INSERT INTO `lorry_image` VALUES ('107', '112', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-19 15:19:42', '2019-03-19 15:19:42');
INSERT INTO `lorry_image` VALUES ('108', '113', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-19 15:24:20', '2019-03-19 15:24:20');
INSERT INTO `lorry_image` VALUES ('109', '114', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-19 15:29:12', '2019-03-19 15:29:12');
INSERT INTO `lorry_image` VALUES ('110', '115', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-19 17:17:41', '2019-03-19 17:17:41');
INSERT INTO `lorry_image` VALUES ('111', '116', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-19 17:21:55', '2019-03-19 17:21:55');
INSERT INTO `lorry_image` VALUES ('112', '117', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-19 17:26:44', '2019-03-19 17:26:44');
INSERT INTO `lorry_image` VALUES ('113', '118', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-19 17:32:13', '2019-03-19 17:32:13');
INSERT INTO `lorry_image` VALUES ('114', '119', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-19 17:35:28', '2019-03-19 17:35:28');
INSERT INTO `lorry_image` VALUES ('115', '120', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-19 17:38:34', '2019-03-19 17:38:34');
INSERT INTO `lorry_image` VALUES ('116', '121', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-19 17:46:38', '2019-03-19 17:46:38');
INSERT INTO `lorry_image` VALUES ('117', '122', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-19 17:54:32', '2019-03-19 17:54:32');
INSERT INTO `lorry_image` VALUES ('118', '123', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-19 17:57:22', '2019-03-19 17:57:22');
INSERT INTO `lorry_image` VALUES ('119', '124', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-19 18:02:21', '2019-03-19 18:02:21');
INSERT INTO `lorry_image` VALUES ('120', '125', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-19 18:06:05', '2019-03-19 18:06:05');
INSERT INTO `lorry_image` VALUES ('121', '126', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-20 09:15:12', '2019-03-20 09:15:12');
INSERT INTO `lorry_image` VALUES ('122', '127', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-20 09:19:06', '2019-03-20 09:19:06');
INSERT INTO `lorry_image` VALUES ('123', '128', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-20 09:22:16', '2019-03-20 09:22:16');
INSERT INTO `lorry_image` VALUES ('124', '129', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-20 09:27:09', '2019-03-20 09:27:09');
INSERT INTO `lorry_image` VALUES ('125', '130', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-20 09:30:23', '2019-03-20 09:30:23');
INSERT INTO `lorry_image` VALUES ('126', '131', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-20 09:32:35', '2019-03-20 09:32:35');
INSERT INTO `lorry_image` VALUES ('127', '132', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-20 09:36:53', '2019-03-20 09:36:53');
INSERT INTO `lorry_image` VALUES ('128', '133', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-20 09:41:57', '2019-03-20 09:41:57');
INSERT INTO `lorry_image` VALUES ('129', '134', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-20 09:46:07', '2019-03-20 09:46:07');
INSERT INTO `lorry_image` VALUES ('130', '135', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-20 09:49:36', '2019-03-20 09:49:36');
INSERT INTO `lorry_image` VALUES ('131', '136', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-25 10:26:20', '2019-03-25 10:26:20');
INSERT INTO `lorry_image` VALUES ('132', '137', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-25 10:30:14', '2019-03-25 10:30:14');
INSERT INTO `lorry_image` VALUES ('133', '138', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-25 10:36:40', '2019-03-25 10:36:40');
INSERT INTO `lorry_image` VALUES ('134', '139', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-25 10:41:00', '2019-03-25 10:41:00');
INSERT INTO `lorry_image` VALUES ('135', '140', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-25 10:44:39', '2019-03-25 10:44:39');
INSERT INTO `lorry_image` VALUES ('136', '141', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-25 10:49:13', '2019-03-25 10:49:13');
INSERT INTO `lorry_image` VALUES ('137', '142', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-25 10:51:32', '2019-03-25 10:51:32');
INSERT INTO `lorry_image` VALUES ('138', '143', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-25 10:55:39', '2019-03-25 10:55:39');
INSERT INTO `lorry_image` VALUES ('139', '144', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-25 15:26:39', '2019-03-25 15:26:39');
INSERT INTO `lorry_image` VALUES ('140', '145', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-25 16:05:15', '2019-03-25 16:05:15');
INSERT INTO `lorry_image` VALUES ('141', '146', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-25 18:56:06', '2019-03-25 18:56:06');
INSERT INTO `lorry_image` VALUES ('142', '147', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-25 19:03:07', '2019-03-25 19:03:07');
INSERT INTO `lorry_image` VALUES ('143', '148', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-25 19:26:42', '2019-03-25 19:26:42');
INSERT INTO `lorry_image` VALUES ('144', '149', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-25 19:29:43', '2019-03-25 19:29:43');
INSERT INTO `lorry_image` VALUES ('145', '150', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-26 19:06:11', '2019-03-26 19:06:11');
INSERT INTO `lorry_image` VALUES ('146', '151', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-28 12:25:04', '2019-03-28 12:25:04');
INSERT INTO `lorry_image` VALUES ('147', '152', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-28 12:32:18', '2019-03-28 12:32:18');
INSERT INTO `lorry_image` VALUES ('148', '153', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-28 12:39:12', '2019-03-28 12:39:12');
INSERT INTO `lorry_image` VALUES ('149', '154', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-28 13:07:29', '2019-03-28 13:07:29');
INSERT INTO `lorry_image` VALUES ('150', '155', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-28 13:12:28', '2019-03-28 13:12:28');
INSERT INTO `lorry_image` VALUES ('151', '156', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-28 13:19:16', '2019-03-28 13:19:16');
INSERT INTO `lorry_image` VALUES ('152', '157', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-28 13:23:57', '2019-03-28 13:23:57');
INSERT INTO `lorry_image` VALUES ('153', '158', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-28 13:31:37', '2019-03-28 13:31:37');
INSERT INTO `lorry_image` VALUES ('154', '159', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-28 13:43:04', '2019-03-28 13:43:04');
INSERT INTO `lorry_image` VALUES ('155', '160', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-28 13:50:51', '2019-03-28 13:50:51');
INSERT INTO `lorry_image` VALUES ('156', '161', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-28 14:24:16', '2019-03-28 14:24:16');
INSERT INTO `lorry_image` VALUES ('157', '162', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-28 14:30:57', '2019-03-28 14:30:57');
INSERT INTO `lorry_image` VALUES ('158', '163', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-28 14:38:50', '2019-03-28 14:38:50');
INSERT INTO `lorry_image` VALUES ('159', '164', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-28 14:58:07', '2019-03-28 14:58:07');
INSERT INTO `lorry_image` VALUES ('160', '165', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-28 15:09:15', '2019-03-28 15:09:15');
INSERT INTO `lorry_image` VALUES ('161', '166', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-28 16:16:04', '2019-03-28 16:16:04');
INSERT INTO `lorry_image` VALUES ('162', '167', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-28 16:24:17', '2019-03-28 16:24:17');
INSERT INTO `lorry_image` VALUES ('163', '168', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-28 16:32:59', '2019-03-28 16:32:59');
INSERT INTO `lorry_image` VALUES ('164', '169', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-28 16:57:08', '2019-03-28 16:57:08');
INSERT INTO `lorry_image` VALUES ('165', '170', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-28 17:05:47', '2019-03-28 17:05:47');
INSERT INTO `lorry_image` VALUES ('166', '171', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-28 17:15:40', '2019-03-28 17:15:40');
INSERT INTO `lorry_image` VALUES ('167', '172', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-28 17:48:31', '2019-03-28 17:48:31');
INSERT INTO `lorry_image` VALUES ('168', '173', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-28 17:56:08', '2019-03-28 17:56:08');
INSERT INTO `lorry_image` VALUES ('169', '174', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-28 18:03:34', '2019-03-28 18:03:34');
INSERT INTO `lorry_image` VALUES ('170', '175', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-28 18:10:42', '2019-03-28 18:10:42');
INSERT INTO `lorry_image` VALUES ('171', '176', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-28 18:16:08', '2019-03-28 18:16:08');
INSERT INTO `lorry_image` VALUES ('172', '177', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-28 18:22:22', '2019-03-28 18:22:22');
INSERT INTO `lorry_image` VALUES ('173', '178', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-29 12:54:39', '2019-03-29 12:54:39');
INSERT INTO `lorry_image` VALUES ('174', '179', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-29 13:16:52', '2019-03-29 13:16:52');
INSERT INTO `lorry_image` VALUES ('175', '180', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-31 11:02:33', '2019-03-31 11:02:33');
INSERT INTO `lorry_image` VALUES ('176', '181', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-31 11:12:00', '2019-03-31 11:12:00');
INSERT INTO `lorry_image` VALUES ('177', '182', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-31 11:19:00', '2019-03-31 11:19:00');
INSERT INTO `lorry_image` VALUES ('178', '183', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-31 11:25:38', '2019-03-31 11:25:38');
INSERT INTO `lorry_image` VALUES ('179', '184', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-31 11:29:56', '2019-03-31 11:29:56');
INSERT INTO `lorry_image` VALUES ('180', '185', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-31 11:39:37', '2019-03-31 11:39:37');
INSERT INTO `lorry_image` VALUES ('181', '186', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-31 11:46:19', '2019-03-31 11:46:19');
INSERT INTO `lorry_image` VALUES ('182', '187', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-31 11:52:58', '2019-03-31 11:52:58');
INSERT INTO `lorry_image` VALUES ('183', '188', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-31 12:05:52', '2019-03-31 12:05:52');
INSERT INTO `lorry_image` VALUES ('184', '189', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-31 12:12:21', '2019-03-31 12:12:21');
INSERT INTO `lorry_image` VALUES ('185', '190', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-31 12:18:17', '2019-03-31 12:18:17');
INSERT INTO `lorry_image` VALUES ('186', '191', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-31 12:22:30', '2019-03-31 12:22:30');
INSERT INTO `lorry_image` VALUES ('187', '192', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-31 12:30:53', '2019-03-31 12:30:53');
INSERT INTO `lorry_image` VALUES ('188', '193', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-31 12:35:32', '2019-03-31 12:35:32');
INSERT INTO `lorry_image` VALUES ('189', '194', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-31 12:48:43', '2019-03-31 12:48:43');
INSERT INTO `lorry_image` VALUES ('190', '195', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-31 12:53:31', '2019-03-31 12:53:31');
INSERT INTO `lorry_image` VALUES ('191', '196', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-31 12:57:40', '2019-03-31 12:57:40');
INSERT INTO `lorry_image` VALUES ('192', '197', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-31 13:05:48', '2019-03-31 13:05:48');
INSERT INTO `lorry_image` VALUES ('193', '198', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-31 13:10:02', '2019-03-31 13:10:02');
INSERT INTO `lorry_image` VALUES ('194', '199', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-31 13:14:35', '2019-03-31 13:14:35');
INSERT INTO `lorry_image` VALUES ('195', '200', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-31 13:21:55', '2019-03-31 13:21:55');
INSERT INTO `lorry_image` VALUES ('196', '201', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-31 13:25:40', '2019-03-31 13:25:40');
INSERT INTO `lorry_image` VALUES ('197', '202', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-31 13:57:05', '2019-03-31 13:57:05');
INSERT INTO `lorry_image` VALUES ('198', '203', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-31 14:03:34', '2019-03-31 14:03:34');
INSERT INTO `lorry_image` VALUES ('199', '204', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-31 14:07:26', '2019-03-31 14:07:26');
INSERT INTO `lorry_image` VALUES ('200', '205', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-31 14:17:51', '2019-03-31 14:17:51');
INSERT INTO `lorry_image` VALUES ('201', '206', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-31 14:21:30', '2019-03-31 14:21:30');
INSERT INTO `lorry_image` VALUES ('202', '207', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-31 14:26:28', '2019-03-31 14:26:28');
INSERT INTO `lorry_image` VALUES ('203', '208', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-31 19:03:07', '2019-03-31 19:03:07');
INSERT INTO `lorry_image` VALUES ('204', '209', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-31 19:05:26', '2019-03-31 19:05:26');
INSERT INTO `lorry_image` VALUES ('205', '210', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-31 20:18:29', '2019-03-31 20:18:29');
INSERT INTO `lorry_image` VALUES ('206', '211', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-04-01 18:54:37', '2019-04-01 18:54:37');

-- ----------------------------
-- Table structure for `materialcategory`
-- ----------------------------
DROP TABLE IF EXISTS `materialcategory`;
CREATE TABLE `materialcategory` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `category` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`category`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of materialcategory
-- ----------------------------
INSERT INTO `materialcategory` VALUES ('1', 'NOTE BOOK', '2018-12-29 16:25:26', '2018-12-29 16:25:26');
INSERT INTO `materialcategory` VALUES ('2', 'SOFT DRINK', '2018-12-29 16:25:31', '2018-12-29 16:25:31');

-- ----------------------------
-- Table structure for `party`
-- ----------------------------
DROP TABLE IF EXISTS `party`;
CREATE TABLE `party` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `party_code` varchar(255) DEFAULT NULL,
  `pan_no` varchar(255) DEFAULT NULL,
  `gst_no` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `mobile_no` varchar(255) DEFAULT NULL,
  `contact_no` varchar(255) DEFAULT NULL,
  `land_line_no` varchar(255) DEFAULT NULL,
  `email_id` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of party
-- ----------------------------
INSERT INTO `party` VALUES ('1', 'ITC LIMITED -EDUCATION & STATIONERY', '44', 'AAACI5950L', '19AAACI5950L1Z7', 'C/o Super Treads Private Limited, 14P, Dabgarm, Indl Growth Centre, Satellite Township, Fulbari Siliguri, West Bengal 734015', '', '', '', '', '2018-12-29 16:15:34', '2019-03-07 21:03:15');
INSERT INTO `party` VALUES ('2', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', '11', 'AAACH3005M', '19AAACH3005M1ZO', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', '9733006465', '', '', 'mmahato@coca-cola.in', '2019-03-05 14:28:58', '2019-03-05 16:29:36');

-- ----------------------------
-- Table structure for `petrol_pump`
-- ----------------------------
DROP TABLE IF EXISTS `petrol_pump`;
CREATE TABLE `petrol_pump` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `contact_no` varchar(255) DEFAULT NULL,
  `contact_person` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of petrol_pump
-- ----------------------------
INSERT INTO `petrol_pump` VALUES ('1', 'Indian Petrol', 'Siliguri', '2019-01-03 10:23:39', '2019-01-03 10:23:39', null, null, null, null);
INSERT INTO `petrol_pump` VALUES ('2', 'MAINAO SERVICE STATION', 'BHUTKI, JALPAIGURI', '2019-01-12 15:48:11', '2019-01-12 15:48:11', null, null, null, null);
INSERT INTO `petrol_pump` VALUES ('3', 'JALPAIGURI SERVICE CENTRE', 'MOHITNAGAR, JALPAIGURI', '2019-01-12 15:49:29', '2019-01-12 15:49:29', null, null, null, null);

-- ----------------------------
-- Table structure for `petrol_pump_record`
-- ----------------------------
DROP TABLE IF EXISTS `petrol_pump_record`;
CREATE TABLE `petrol_pump_record` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `challan_id` int(10) DEFAULT NULL,
  `petrol_pump_id` int(10) DEFAULT NULL,
  `amount` varchar(255) DEFAULT NULL,
  `challan_date` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `petrol_pump` (`petrol_pump_id`),
  CONSTRAINT `petrol_pump` FOREIGN KEY (`petrol_pump_id`) REFERENCES `petrol_pump` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of petrol_pump_record
-- ----------------------------
INSERT INTO `petrol_pump_record` VALUES ('1', '1', '2', '2500', '2019/03/04', '2019-03-05 18:25:16', '2019-03-05 18:25:16');
INSERT INTO `petrol_pump_record` VALUES ('2', '2', '2', '6000', '2019/03/07', '2019-03-08 16:26:32', '2019-03-08 16:26:32');
INSERT INTO `petrol_pump_record` VALUES ('3', '2', '2', '2500', '2019/03/04', '2019-03-14 16:01:41', '2019-03-14 16:01:41');
INSERT INTO `petrol_pump_record` VALUES ('4', '3', '2', '2500', '2019/03/05', '2019-03-14 21:17:05', '2019-03-14 21:17:05');
INSERT INTO `petrol_pump_record` VALUES ('5', '4', '2', '7000', '2019/03/05', '2019-03-14 21:21:58', '2019-03-14 21:21:58');
INSERT INTO `petrol_pump_record` VALUES ('6', '5', '2', '5000', '2019/03/06', '2019-03-14 21:31:05', '2019-03-14 21:31:05');
INSERT INTO `petrol_pump_record` VALUES ('7', '6', '2', '5000', '2019/03/06', '2019-03-14 21:34:52', '2019-03-14 21:34:52');
INSERT INTO `petrol_pump_record` VALUES ('8', '7', '2', '5000', '2019/03/05', '2019-03-27 12:04:19', '2019-03-27 12:04:19');

-- ----------------------------
-- Table structure for `trucktype`
-- ----------------------------
DROP TABLE IF EXISTS `trucktype`;
CREATE TABLE `trucktype` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `trucktype` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`trucktype`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of trucktype
-- ----------------------------
INSERT INTO `trucktype` VALUES ('1', 'LCV.6', '2019-01-14 13:38:33', '2019-01-14 13:38:33');
INSERT INTO `trucktype` VALUES ('2', 'HCV.16', '2018-12-29 16:14:31', '2018-12-29 16:14:31');
INSERT INTO `trucktype` VALUES ('3', 'HCV.15', '2019-01-14 13:38:21', '2019-01-14 13:38:21');
INSERT INTO `trucktype` VALUES ('4', 'HCV.20', '2019-01-14 13:38:26', '2019-01-14 13:38:26');
INSERT INTO `trucktype` VALUES ('5', 'LCV.9', '2019-01-14 13:38:39', '2019-01-14 13:38:39');

-- ----------------------------
-- Table structure for `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `role` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mobile` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `zip` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `state` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `aadhar_no` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `employee_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_email_unique` (`email`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'Prince', 'prncsharma@gmail.com', '$2y$10$vxlVOoYnpHCECwJlpXn9Ce/a53vQtVQlp4RmQJ0T.sXnmGc2tqzqu', 'Admin', 'wPR9zUaC6nk7xRLP97fE6mEsLd3ESsAiZn2E2i1xUFTrXzM5AeiBHyRJgqUi', '2018-11-23 11:59:04', '2018-11-27 11:25:16', null, null, null, null, null, null, 'prince');
INSERT INTO `users` VALUES ('2', 'Narayan Paswan', 'paswan.narayan@gmail.com', '$2y$10$8qwbV/l1iws9atYykHI1k.T/47gDtXSua26YVjN2ODKniBnxBqWAm', 'Admin', 'gTya59Xgfp69IbTNbEnCRWGPBKIGxGzftyrYs1ufp89erJTxFmM8JTlZ2OJa', '2018-04-13 10:44:12', '2018-11-28 11:11:36', null, null, null, null, null, null, null);
INSERT INTO `users` VALUES ('3', 'Naveen Kumar', 'nawinji@gmail.com', '$2y$10$rphrFMN6z3BHwVQspK/S4ueM2ZRSLAk2usmsnLbifZhVWPAA0xlkm', 'Admin', 'CWycjeX5ZiGIZxHmV7EjHtbJx8IjX89FiAlEkom4NicfwmMBBrhk4DOVThs6', '2018-07-04 13:03:46', '2018-07-04 13:04:20', null, null, null, null, null, null, null);
INSERT INTO `users` VALUES ('6', 'Sanjay Chaudhary', 'sanjay@gmail.com', '$2y$10$dhD5wkHtpIcLnYLp42OSJ.FRyxIYFhgGGchXLkUDOKXmD.DGHzRbG', 'User', 'kScxDKK4XSia3AWY9TqtrtvGW1EpiFiH6Tv8eNORh1GqL73vTl6PuXvREO6G', '2019-04-10 07:15:52', '2019-04-10 07:15:52', 'Netaji Road', '1234567881', 'LOS ANGELAS', '734001', 'CALIFORNIA', '85656454564', 'sanj@115');
INSERT INTO `users` VALUES ('8', 'Jason', 'jason@gmail.com', '$2y$10$w5Y4Q8DD37Powd0R/8bfOOWpaLEwnxSCk6EH8pqPPldAojAC3VHYG', 'User', null, '2019-04-10 07:24:36', '2019-04-10 07:25:07', 'Netaji Road', '1234567881', 'LOS ANGELAS', '734001', 'CALIFORNIA', '85656454564', 'jason_12');
