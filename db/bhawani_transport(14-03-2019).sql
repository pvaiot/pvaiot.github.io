/*
Navicat MySQL Data Transfer

Source Server         : MySql
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : bhawani_transport

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2019-03-14 18:30:48
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
INSERT INTO `acknowledgement` VALUES ('1', '2', '114308', '2019-03-11', 'SILIGURI', 'SILIGURI', 'WB67A3151', '114308', '2019-03-11', '17:47', '2019-03-11', '13:52', 'SILIGURI', '2019-03-11', '2019-03-11', '800', '2019-03-11 12:23:00', '2019-03-11 12:23:00');

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
INSERT INTO `acknowledgement_child` VALUES ('1', '1', null, '50', '50', 'Yes', null, null, null, null, null, '2019-03-11 12:23:01', '2019-03-11 12:23:01');

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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of broker_image
-- ----------------------------
INSERT INTO `broker_image` VALUES ('1', '12', 'front', 'back', '2019-03-05 17:25:43', '2019-03-05 17:25:43');

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
INSERT INTO `challan` VALUES ('2', null, '114308', '2019-03-11', '1', 'SILIGURI', '1', 'SILIGURI', null, null, null, 'WB67A3151', '21F63267809', 'MAT448035C3F16412', 'TATA', 'JIKRIA MIDYA', 'BANKURA', '7908008297', 'No', null, null, null, 'No', 'No', null, null, null, null, 'Hardwell Insurance with all kind of Value', 'lic123456', '2', 'ASHADUL MIDYA', '983291766', 'SONAMUKHI BANKURA', 'WB67-20110012691', 'BANKURA', '1', 'SILIGURI', '1000', '100', '100', '800', '0', '2019-03-11 12:22:02', '2019-03-11 12:22:02', 'Eight Hundred Rupees  Only', '1', 'Jasoosk');

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of challan_child2
-- ----------------------------
INSERT INTO `challan_child2` VALUES ('2', '2', '1', '114308', '2019-03-11 12:22:02', '2019-03-11 12:22:02', '269', '6', '6');

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of challan_child3
-- ----------------------------
INSERT INTO `challan_child3` VALUES ('2', '2', '269', '6', '6', '2019-03-11 12:22:02', '2019-03-11 12:22:02');

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
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of cock_consignment
-- ----------------------------
INSERT INTO `cock_consignment` VALUES ('3', '114309', '2019-03-04', '11', '1', 'SILIGURI', '6', 'FATAPUKUR', '', 'ASANSOL', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', '2', 'HCV.16', '7', 'WB37B8492', '259160', '0', '2019-03-07 08:07:50', '2019-03-07 10:20:51', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'RANI SATI WAREHOUSING & LOGISTIC, BARDHAMAN WEST BENGAL 713383', 'Naveen Kumar', '', '160322');
INSERT INTO `cock_consignment` VALUES ('4', '114308', '2019-03-04', '11', '1', 'SILIGURI', '6', 'FATAPUKUR', '', 'DARJEELING', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'HIMALAYA AGENCIES', '1', 'LCV.6', '6', 'WB73B7316', '134353.51', '0', '2019-03-07 10:03:50', '2019-03-07 10:03:50', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', '1ST FLOOR 5A NEHRU ROADCHOWRASTA, DARJEELING, WEST BENGAL 734101', 'Naveen Kumar', '52813', '');
INSERT INTO `cock_consignment` VALUES ('5', '114307', '2019-03-03', '11', '1', 'SILIGURI', '6', 'FATAPUKUR', '', 'JAGDISHPUR', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'GUPTA ENTERPRISES', '', 'H', '8', 'UP67T5215', '0', '0', '2019-03-07 10:20:25', '2019-03-07 10:20:25', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'BIHIA DIST BHOJPUR, BLOK OFFICE JAGDISHPUR, BIHAR 802158', 'Naveen Kumar', '', '158977');
INSERT INTO `cock_consignment` VALUES ('6', '114310', '2019-03-05', '11', '1', 'SILIGURI', '6', 'FATAPUKUR', '', 'DARJEELING', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'HIMALAYA AGENCIES', '1', 'LCV.6', '6', 'WB73B7316', '177472.57', '0', '2019-03-07 10:38:02', '2019-03-08 05:04:55', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', '1ST FLOOR 5A NEHRU ROADCHOWRASTA, DARJEELING, WEST BENGAL 734101', 'Naveen Kumar', '53642', '');
INSERT INTO `cock_consignment` VALUES ('7', '114313', '2019-03-05', '11', '1', 'SILIGURI', '6', 'FATAPUKUR', '', 'CHHAPRA', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'MAA BHAWANI FOODS', '2', 'HCV.16', '9', 'UP61T6500', '680364', '0', '2019-03-07 10:44:46', '2019-03-07 10:44:46', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'BHAGWAN BAZAR, CHAPRA NEAR RATANPURA MOHALLA CHHAPRA BIHAR 841301', 'Naveen Kumar', '', '163643');
INSERT INTO `cock_consignment` VALUES ('8', '114314', '2019-03-06', '11', '1', 'SILIGURI', '6', 'FATAPUKUR', '', 'BARAUNI', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'M.S. AGENCY', '3', 'HCV.15', '10', 'RJ23GA3143', '0', '0', '2019-03-07 10:55:10', '2019-03-07 10:55:10', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'BIHAR STATE TRANSPORT CORP. NR. BUS STAND BARAUNI BEGUSARAI BIHAR 851112', 'Naveen Kumar', '', '163588');
INSERT INTO `cock_consignment` VALUES ('9', '114311', '2019-03-05', '11', '1', 'SILIGURI', '6', 'FATAPUKUR', '', 'BARAUNI', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'M.S. AGENCY', '2', 'HCV.16', '11', 'NL01AB8399', '619704', '0', '2019-03-07 11:02:38', '2019-03-07 11:02:38', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'BIHAR STATE TRANSPORT CORP. NR. BUS STAND BARAUNI BEGUSARAI BIHAR 851112', 'Naveen Kumar', '', '163589');
INSERT INTO `cock_consignment` VALUES ('10', '114312', '2019-03-05', '11', '1', 'SILIGURI', '6', 'FATAPUKUR', '', 'CHHAPRA', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'MAA BHAWANI FOODS', '2', 'HCV.16', '12', 'UP65ET2229', '0', '0', '2019-03-07 11:10:18', '2019-03-07 11:10:18', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'BHAGWAN BAZAR NEAR RATANPURA MOHALLA CHAPRA BIHAR 841301', 'Naveen Kumar', '', '163642');
INSERT INTO `cock_consignment` VALUES ('11', '114316', '2019-03-06', '11', '1', 'SILIGURI', '6', 'FATAPUKUR', '', 'DARJEELING', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'HIMALAYA AGENCIES', '1', 'LCV.6', '14', 'WB73B6290', '136257.97', '0', '2019-03-08 07:28:02', '2019-03-08 07:28:02', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', '1ST FLOOR 5A NEHRU ROADCHOWRASTA, DARJEELING, WEST BENGAL 734101', 'Naveen Kumar', '54245', '');
INSERT INTO `cock_consignment` VALUES ('12', '114324', '2019-03-06', '11', '1', 'SILIGURI', '6', 'FATAPUKUR', '', 'MUZAFFARPUR', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', '4', 'HCV.20', '15', 'WB73D6936', '648004', '0', '2019-03-08 07:39:39', '2019-03-08 07:39:39', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'BEHIND IT MEMORIAL HOSPITAL, NH 57 UMANAGAR, MUZAFFARPUR, BIHAR 842004', 'Naveen Kumar', '', '170137');
INSERT INTO `cock_consignment` VALUES ('13', '114325', '2019-03-07', '11', '1', 'SILIGURI', '6', 'FATAPUKUR', '', 'MUZAFFARPUR', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', '4', 'HCV.20', '16', 'NL01K7974', '478768', '0', '2019-03-08 07:54:38', '2019-03-08 07:55:51', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'BEHIND IT MEMORIAL HOSPITAL, NH 57 UMANAGAR, MUZAFFARPUR, BIHAR 842004', 'Naveen Kumar', '', '170138');
INSERT INTO `cock_consignment` VALUES ('14', '114327', '2019-03-07', '11', '1', 'SILIGURI', '6', 'FATAPUKUR', '', 'SITAMARHI', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'ARADHANA ENTERPRISES', '2', 'HCV.16', '17', 'WB41H1520', '525754.98', '0', '2019-03-08 08:04:13', '2019-03-08 08:04:13', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'CEN MARKETING UNION RIGHA, SITAMARHI BIHAR 843327', 'Naveen Kumar', '', '170095');
INSERT INTO `cock_consignment` VALUES ('15', '114317', '2019-03-06', '11', '1', 'SILIGURI', '6', 'FATAPUKUR', '', 'SUKIA', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'JAI MAHAKAL DISTRIBUTOR', '1', 'LCV.6', '6', 'WB73B7316', '156621.6', '0', '2019-03-08 08:11:11', '2019-03-08 08:11:11', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'SARDAR GAIRI GAONAT - SUKHIA POKHARI DARJEELING', 'Naveen Kumar', '54247', '');
INSERT INTO `cock_consignment` VALUES ('16', '114318', '2019-03-06', '11', '', 'SILIGURI', '', 'FATAPUKUR', '', 'BETTIAH', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'K D FOODS', '', 'HCV.16', '', 'UP21BN3884', '573202.86', '0', '2019-03-08 09:03:03', '2019-03-08 09:03:03', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'TEEN LALTEN CHOWK GULAB BAGH ROAD NEAR MEDICAL COLLAGE BETTIAH 845438', 'Naveen Kumar', '', '167385');
INSERT INTO `cock_consignment` VALUES ('17', '114319', '2019-03-06', '11', '1', 'SILIGURI', '6', 'FATAPUKUR', '', 'BAGAHA', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'PRIYA TRADERS', '3', 'HCV.15', '23', 'UP21BN4985', '510018.01', '0', '2019-03-08 09:08:38', '2019-03-08 09:08:38', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'MALKAULI BAGHA WEST CHAMPARAN NEAR KALI MANDIR BAGHA WEST CHAMPRAN 845101', 'Naveen Kumar', '', '167144');
INSERT INTO `cock_consignment` VALUES ('18', '114320', '2019-03-06', '11', '1', 'SILIGURI', '6', 'FATAPUKUR', '', 'ASANSOL', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'RELIANCE RETAIL LTD', '3', 'HCV.15', '24', 'WB37D6668', '502087.29', '0', '2019-03-08 09:14:23', '2019-03-08 09:14:23', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'ADDA KINK ROAD BABUA PUKAR ANR ASANSOL COLLEGIATE SCHOOL KALYANPUR ASANSOL WEST BENGAL 713301', 'Naveen Kumar', '', '164456');
INSERT INTO `cock_consignment` VALUES ('19', '114328', '2019-03-07', '11', '1', 'SILIGURI', '6', 'FATAPUKUR', '', 'SHEOHAR', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'ANAND TRADERS ', '2', 'HCV.16', '19', 'WB23C2601', '465655.59', '0', '2019-03-08 09:41:11', '2019-03-08 09:41:11', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'BLOCK ROAD SHEOHAR NEAR UNION BANK OF INDIA SHEOHAR BIHAR 843302', 'Naveen Kumar', '', '170326');
INSERT INTO `cock_consignment` VALUES ('20', '114326', '2019-03-07', '11', '1', 'SILIGURI', '6', 'FATAPUKUR', '', 'SHEOHAR', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'MAA AMBEY ENTERPRIESE', '2', 'HCV.16', '18', 'HR69A0939', '493289.28', '0', '2019-03-08 09:45:12', '2019-03-08 09:45:12', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'WARD NO 15 SHEOHAR  UNION BANK SHEOHAR BIHAR 843329', 'Naveen Kumar', '', '170327');
INSERT INTO `cock_consignment` VALUES ('21', '114315', '2019-03-06', '11', '1', 'SILIGURI', '6', 'FATAPUKUR', '', 'BARAUNI', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'M.S. AGENCY', '3', 'HCV.15', '25', 'RJ05GA6735', '691704', '0', '2019-03-08 09:47:48', '2019-03-08 09:47:48', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'BIHAR STATE TRANSPORT CORP. NR. BUS STAND BARAUNI BEGUSARAI BIHAR 851112', 'Naveen Kumar', '', '163587');
INSERT INTO `cock_consignment` VALUES ('22', '114321', '2019-03-07', '11', '', 'SILIGURI', '6', 'FATAPUKUR', '', 'MOTHABARI', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'MAA DURGA AGENCY', '5', 'LCV.9', '21', 'WB57A8428', '371841.96', '0', '2019-03-08 09:52:11', '2019-03-08 09:52:11', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'VILL+PO-MOTHABARI MALDA NEAR COOPERATIVE BANK MOTHABARI MALDA 732207', 'Naveen Kumar', '', '169690');
INSERT INTO `cock_consignment` VALUES ('23', '114322', '2019-03-07', '11', '', 'SILIGURI', '6', 'FATAPUKUR', '', 'BANKURA', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'K K ENTERPRISES', '3', 'HCV.15', '20', 'WB37C0388', '600650.83', '0', '2019-03-08 09:57:47', '2019-03-08 09:57:47', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', '269/2 KAMRAMATH NEAR TOWN GIRLS H S BANKURA TOWN  WEST BENGAL 722101', 'Naveen Kumar', '', '168912');
INSERT INTO `cock_consignment` VALUES ('24', '114323', '2019-03-07', '11', '1', 'SILIGURI', '6', 'FATAPUKUR', '', 'DARJEELING', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'HIMALAYA AGENCIES', '1', 'LCV.6', '14', 'WB73B6290', '168229.11', '0', '2019-03-08 10:10:56', '2019-03-08 10:17:49', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', '1ST FLOOR 5A NEHRU ROADCHOWRASTA, DARJEELING, WEST BENGAL 734101', 'Naveen Kumar', '55102', '');
INSERT INTO `cock_consignment` VALUES ('25', '114330', '2019-03-08', '11', '1', 'SILIGURI', '6', 'FATAPUKUR', '', 'SHEOHAR', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'MAA AMBEY ENTERPRISES', '2', 'HCV.16', '26', 'RJ02GB3919', '463182.8', '0', '2019-03-09 05:33:42', '2019-03-09 05:33:42', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'WARD NO-15 SHEOHAR OPP UNION BANK SHEOHAR 843329', 'Naveen Kumar', '', '173559');
INSERT INTO `cock_consignment` VALUES ('26', '114329', '2019-03-08', '11', '1', 'SILIGURI', '6', 'FATAPUKUR', '10', 'ASANSOL', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', '3', 'HCV.15', '27', 'UP78BT0456', '404600', '0', '2019-03-09 05:54:07', '2019-03-09 05:56:56', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'RANI SATI WAREHOUSING LOGISTIC BARDHAMAN WEST BENGAL  735134', 'Naveen Kumar', '55376', '');
INSERT INTO `cock_consignment` VALUES ('27', '114332', '2019-03-08', '11', '1', 'SILIGURI', '6', 'FATAPUKUR', '4', 'BETTIAH', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'K D FOODS ', '2', 'HCV.16', '28', 'HR658405', '523620.78', '0', '2019-03-09 06:12:41', '2019-03-13 13:18:48', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'TEEN LALTEN CHOWK GULAB BAGH ROADNEAR MEDICAL COLLEGE BETTAIH BIHAR 845438', 'Naveen Kumar', '', '175234');
INSERT INTO `cock_consignment` VALUES ('28', '114334', '2019-03-08', '11', '1', 'SILIGURI', '6', 'FATAPUKUR', '', 'DARJEELING', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'HIMALAYA AGENCY', '1', 'LCV.6', '6', 'WB73B7316', '124689.63', '0', '2019-03-09 06:18:38', '2019-03-09 06:18:38', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', '1ST FLOOR 5A NEHRU ROADCHOWRASTA DARJEELING SILIGURI WEST BENGAL 734101', 'Naveen Kumar', '', '173985');
INSERT INTO `cock_consignment` VALUES ('29', '114333', '2019-03-08', '11', '1', 'SILIGURI', '6', 'FATAPUKUR', '', 'DARJEELING', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'HIMALAYA AGENCIES', '1', 'LCV.6', '14', 'WB73B6290', '196101.88', '0', '2019-03-09 06:25:08', '2019-03-13 13:22:10', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', '1ST FLOOR 5A NEHRU ROADCHOWRASTA DARJEELING SILIGURI WEST BENGAL 734101', 'Naveen Kumar', '', '173986');
INSERT INTO `cock_consignment` VALUES ('30', '114336', '2019-03-09', '11', '1', 'SILIGURI', '6', 'FATAPUKUR', '', 'BETTIAH', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'KD FOODS BETTIAH', '3', 'HCV.15', '29', 'RJ14GD9178', '470668.8', '0', '2019-03-09 06:30:20', '2019-03-09 06:30:20', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'TEEN LALTEN CHOWK GULAB BAGH ROADNEAR MEDICAL COLLEGE BETTIAH BIHAR 845438', 'Naveen Kumar', '', '175233');
INSERT INTO `cock_consignment` VALUES ('31', '114243', '2019-03-10', '11', '1', 'SILIGURI', '6', 'FATAPUKUR', '', 'MUZAFFARPUR', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', '2', 'HCV.16', '34', 'WB03C9855', '415681.08', '0', '2019-03-11 14:01:35', '2019-03-11 14:01:35', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'MUZAFFARPUR', 'Naveen Kumar', '', '183649');
INSERT INTO `cock_consignment` VALUES ('32', '114344', '2019-03-10', '11', '1', 'SILIGURI', '6', 'FATAPUKUR', '', 'NAWADA', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'KAVITANJALI ENTERPRISE', '2', 'HCV.16', '32', 'JH02T8671', '588647.04', '0', '2019-03-11 14:06:22', '2019-03-13 15:52:31', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'THANA ROAD NAWADA BOARD COMPLEXNAWADA  BIHAR 805110', 'Naveen Kumar', '', '181290');
INSERT INTO `cock_consignment` VALUES ('33', '114345', '2019-03-10', '11', '1', 'SILIGURI', '6', 'FATAPUKUR', '', 'SASARAM', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'RAJ ENTERPRISES', '2', 'HCV.16', '31', 'UP63T3563', '593700.88', '0', '2019-03-11 14:09:54', '2019-03-13 15:53:18', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'JAGAT KAUSAL MARKET SASARAM BIHAR 821115', 'Naveen Kumar', '', '184246');
INSERT INTO `cock_consignment` VALUES ('34', '114346', '2019-03-10', '11', '1', 'SILIGURI', '6', 'FATAPUKUR', '', 'SHERGHATI', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'ALIZA ENTERPRISES', '2', 'HCV.16', '35', 'MH04FJ6629', '602628.12', '0', '2019-03-11 14:13:39', '2019-03-13 15:54:03', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'MADARSA GALI HAMZAPUR SHERGHATINEAR IMAMGANJ SHERGHATI BIHAR 824211', 'Naveen Kumar', '', '184247');
INSERT INTO `cock_consignment` VALUES ('35', '114347', '2019-03-10', '11', '1', 'SILIGURI', '6', 'FATAPUKUR', '', 'GAYA', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'MAA MANGLA TRDERD', '2', 'HCV.16', '37', 'UP63AT1953', '606552.92', '0', '2019-03-11 14:17:21', '2019-03-13 15:54:46', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'MAIN ROAD KHATKACHAK MARANPUR GAYANR GAYA BIHAR 823001', 'Naveen Kumar', '', '184249');
INSERT INTO `cock_consignment` VALUES ('36', '114348', '2019-03-10', '11', '1', 'SILIGURI', '6', 'FATAPUKUR', '', 'RAIGUNJ', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'BISWANATH NUHIWAL', '2', 'HCV.16', '36', 'WB25D3132', '415681.08', '0', '2019-03-11 14:21:15', '2019-03-13 15:55:14', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'BANDAR MARWARY DINAJPUR RAIGANJ WEST BENGAL 733134', 'Naveen Kumar', '', '182966');
INSERT INTO `cock_consignment` VALUES ('37', '114342', '2019-03-10', '11', '1', 'SILIGURI', '6', 'FATAPUKUR', '', 'NALANDA', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'NAUSEEMA TRADING', '2', 'HCV.16', '33', 'BR25A2887', '567374.9', '0', '2019-03-12 05:25:36', '2019-03-13 15:46:32', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'GANGADIWANBIHAR SHARIFBADI NALANDA BIHAR 805105', 'Naveen Kumar', '', '184248');
INSERT INTO `cock_consignment` VALUES ('38', '114337', '2019-03-09', '11', '', 'SILIGURI', '6', 'FATAPUKUR', '', 'CHHAURADANOW', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'LAXMI ENTERPRISES', '2', 'HCV.16', '38', 'NL08A4529', '500926.08', '0', '2019-03-13 13:52:51', '2019-03-13 13:52:51', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'BANK ROAD CHHAURADANO E CHAMPARAN CHHAURADANO DHAKA 845302', 'Naveen Kumar', '', '176398');
INSERT INTO `cock_consignment` VALUES ('39', '114338', '2019-03-09', '11', '1', 'SILIGURI', '6', 'FATAPUKUR', '', 'NALANDA', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'NAUSEEMA TRADING', '2', 'HCV.16', '39', 'CG12AR3805', '591032.3', '0', '2019-03-13 14:02:44', '2019-03-13 14:02:44', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'GAGANDIWANBIHARI  SHARIFBADI B.O NALANDA BIHAR 805105', 'Naveen Kumar', '', '179044');
INSERT INTO `cock_consignment` VALUES ('40', '114339', '2019-03-10', '11', '1', 'SILIGURI', '6', 'FATAPUKUR', '', 'CHHAURADANOW', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'LAXMI ENTERPRISES', '2', 'HCV.16', '40', 'JH02G7611', '470668.8', '0', '2019-03-13 15:36:08', '2019-03-13 15:36:08', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'BANK ROAD CHHAURADANO E CHAMPARAN DHAKA 845302', 'Naveen Kumar', '', '179043');
INSERT INTO `cock_consignment` VALUES ('41', '114340', '2019-03-10', '11', '', 'SILIGURI', '6', 'FATAPUKUR', '', 'MUZAFFARPUR', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', '4', 'HCV.20', '41', 'UP65CT2458', '558600', '0', '2019-03-13 15:39:27', '2019-03-13 15:39:27', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'IT MEMORIAL HOSPITAL NH 57 MUZAFFARPUR', 'Naveen Kumar', '', '183408');
INSERT INTO `cock_consignment` VALUES ('42', '114341', '2019-03-10', '11', '1', 'SILIGURI', '6', 'FATAPUKUR', '', 'MUZAFFARPUR', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', '4', 'HCV.20', '42', 'UP63AT0462', '558600', '0', '2019-03-13 15:41:56', '2019-03-13 15:41:56', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'IT MEMORIAL HOSPITAL, NH 57 MUZAFFARPUR', 'Naveen Kumar', '', '183667');
INSERT INTO `cock_consignment` VALUES ('43', '114343', '2019-03-10', '11', '1', 'SILIGURI', '6', 'FATAPUKUR', '', 'MUZAFFARPUR', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', '2', 'HCV.16', '34', 'WB03C9855', '0', '0', '2019-03-13 15:51:35', '2019-03-13 15:51:35', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'IT MEMORIAL HOSPITAL, NH 57 MUZAFFARPUR', 'Naveen Kumar', '', '183649');
INSERT INTO `cock_consignment` VALUES ('44', '114349', '2019-03-11', '11', '', 'SILIGURI', '6', 'FATAPUKUR', '', 'DARJEELING', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'HIMALAYA AGENCIES', '1', 'LCV.6', '6', 'WB73B7316', '133801', '0', '2019-03-13 15:57:24', '2019-03-13 15:57:24', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', '1ST FLOOR 5A NEHRU ROADCHOWRASTA, DARJEELING, WEST BENGAL 734101', 'Naveen Kumar', '57870', '');
INSERT INTO `cock_consignment` VALUES ('45', '114350', '2019-03-11', '11', '1', 'SILIGURI', '6', 'FATAPUKUR', '', 'DARJEELING', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'HIMALAYA AGENCIES', '1', 'LCV.6', '43', 'WB73C1432', '153945.25', '0', '2019-03-13 16:01:44', '2019-03-13 16:01:44', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', '1ST FLOOR 5A NEHRU ROADCHOWRASTA, DARJEELING, WEST BENGAL 734101', 'Naveen Kumar', '57912', '');
INSERT INTO `cock_consignment` VALUES ('46', '114335', '2019-03-08', '11', '', 'SILIGURI', '6', 'FATAPUKUR', '', 'ASANSOL', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', '2', 'HCV.16', '30', 'WB11A7650', '335600', '0', '2019-03-13 16:07:07', '2019-03-13 16:07:07', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'RANI SATI WAREHOUSING & LOGISTIC, BARDHAMAN WEST BENGAL 713383', 'Naveen Kumar', '55377', '');
INSERT INTO `cock_consignment` VALUES ('47', '114331', '2019-03-08', '11', '', 'SILIGURI', '6', 'FATAPUKUR', '', 'DARJEELING', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'FUTURE RETAIL LIMITED', '1', 'LCV.6', '44', 'WB73C4277', '29203.2', '0', '2019-03-14 04:17:48', '2019-03-14 04:17:48', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'RINK MALL DARJEELING WEST BENGAL 734301', 'Naveen Kumar', '', '169799');

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
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of cock_consignment_child
-- ----------------------------
INSERT INTO `cock_consignment_child` VALUES ('1', '2', 'Invoice12345', '2019-03-05', '10000', 'Waybill123', '2019-03-10', '2019-03-06 11:32:54', '2019-03-06 11:32:54');
INSERT INTO `cock_consignment_child` VALUES ('9', '4', '7063064107', '2019-03-04', '134353.51', '801041518017', '2019-03-06', '2019-03-07 10:03:50', '2019-03-07 10:03:50');
INSERT INTO `cock_consignment_child` VALUES ('10', '5', '7063064100', '2019-03-03', '0000', '841041460992', '2019-03-12', '2019-03-07 10:20:25', '2019-03-07 10:20:25');
INSERT INTO `cock_consignment_child` VALUES ('11', '3', '7105655463', '2019-03-04', '259160', '841041515979', '2019-03-10', '2019-03-07 10:20:51', '2019-03-07 10:20:51');
INSERT INTO `cock_consignment_child` VALUES ('13', '7', '7063064138', '2019-03-05', '680364', '881041771502', '2019-03-14', '2019-03-07 10:44:46', '2019-03-07 10:44:46');
INSERT INTO `cock_consignment_child` VALUES ('14', '8', '7063064148', '2019-03-06', '0000', '801041785880', '2019-03-11', '2019-03-07 10:55:10', '2019-03-07 10:55:10');
INSERT INTO `cock_consignment_child` VALUES ('15', '9', '7063064137', '2019-03-05', '619704', '811041771501', '2019-03-14', '2019-03-07 11:02:38', '2019-03-07 11:02:38');
INSERT INTO `cock_consignment_child` VALUES ('16', '10', '7063064140', '2019-03-05', '000', '891041776795', '2019-03-14', '2019-03-07 11:10:18', '2019-03-07 11:10:18');
INSERT INTO `cock_consignment_child` VALUES ('17', '6', '7063064128', '2019-03-05', '177472.57', '851041688175', '2019-03-07', '2019-03-08 05:04:55', '2019-03-08 05:04:55');
INSERT INTO `cock_consignment_child` VALUES ('18', '11', '7063064169', '2019-03-06', '136257.97', '891041918706', '2019-03-08', '2019-03-08 07:28:02', '2019-03-08 07:28:02');
INSERT INTO `cock_consignment_child` VALUES ('19', '12', '7128237425', '2019-03-06', '648004', '891042013422', '2019-03-13', '2019-03-08 07:39:39', '2019-03-08 07:39:39');
INSERT INTO `cock_consignment_child` VALUES ('21', '13', '7128237424', '2019-03-07', '478768', '821042013421', '2019-03-13', '2019-03-08 07:55:51', '2019-03-08 07:55:51');
INSERT INTO `cock_consignment_child` VALUES ('22', '14', '7063064206', '2019-03-07', '525754.98', '861042074462', '2019-03-14', '2019-03-08 08:04:13', '2019-03-08 08:04:13');
INSERT INTO `cock_consignment_child` VALUES ('23', '15', '7063064162', '2019-03-06', '156621.60', '871041918700', '2019-03-08', '2019-03-08 08:11:11', '2019-03-08 08:11:11');
INSERT INTO `cock_consignment_child` VALUES ('24', '16', '7063064174', '2019-03-06', '573202.86', '831041942640', '2019-03-14', '2019-03-08 09:03:03', '2019-03-08 09:03:03');
INSERT INTO `cock_consignment_child` VALUES ('25', '17', '7063064175', '2019-03-06', '510018.01', '871041942642', '2019-03-14', '2019-03-08 09:08:38', '2019-03-08 09:08:38');
INSERT INTO `cock_consignment_child` VALUES ('26', '18', '7063064178', '2019-03-06', '351530.40', '811041942644', '2019-03-12', '2019-03-08 09:14:23', '2019-03-08 09:14:23');
INSERT INTO `cock_consignment_child` VALUES ('27', '18', '7063064177', '2019-03-06', '150556.89', '8811041942045', '2019-03-12', '2019-03-08 09:14:23', '2019-03-08 09:14:23');
INSERT INTO `cock_consignment_child` VALUES ('28', '19', '7063064212', '2019-03-07', '465655.59', '871042105202', '2019-03-14', '2019-03-08 09:41:11', '2019-03-08 09:41:11');
INSERT INTO `cock_consignment_child` VALUES ('29', '20', '7063064207', '2019-03-07', '493289.28', '871042083656', '2019-03-15', '2019-03-08 09:45:12', '2019-03-08 09:45:12');
INSERT INTO `cock_consignment_child` VALUES ('30', '21', '7063064150', '2019-03-06', '691704', '891041822308', '2019-03-12', '2019-03-08 09:47:48', '2019-03-08 09:47:48');
INSERT INTO `cock_consignment_child` VALUES ('31', '22', '7063064183', '2019-03-07', '371841.96', '891041950050', '2019-03-11', '2019-03-08 09:52:11', '2019-03-08 09:52:11');
INSERT INTO `cock_consignment_child` VALUES ('32', '23', '7063064184', '2019-03-07', '600650.83', '871041950207', '2019-03-14', '2019-03-08 09:57:47', '2019-03-08 09:57:47');
INSERT INTO `cock_consignment_child` VALUES ('34', '24', '7063064196', '2019-03-07', '168229.11', '881042023796', '2019-03-09', '2019-03-08 10:17:49', '2019-03-08 10:17:49');
INSERT INTO `cock_consignment_child` VALUES ('35', '25', '7063064221', '2019-03-08', '463182.80', '871042177962', '2019-03-15', '2019-03-09 05:33:42', '2019-03-09 05:33:42');
INSERT INTO `cock_consignment_child` VALUES ('38', '26', '7105655689', '2019-03-08', '404600.00', '891042176457', '2019-03-14', '2019-03-09 05:56:56', '2019-03-09 05:56:56');
INSERT INTO `cock_consignment_child` VALUES ('40', '28', '7063064235', '2019-03-08', '124689.63', '871042245102', '2019-03-10', '2019-03-09 06:18:38', '2019-03-09 06:18:38');
INSERT INTO `cock_consignment_child` VALUES ('42', '30', '7063064250', '2019-03-09', '470668.80', '871042274685', '2019-03-16', '2019-03-09 06:30:20', '2019-03-09 06:30:20');
INSERT INTO `cock_consignment_child` VALUES ('43', '31', '7128237581', '2019-03-10', '415681.08', '821042459146', '2019-03-16', '2019-03-11 14:01:35', '2019-03-11 14:01:35');
INSERT INTO `cock_consignment_child` VALUES ('50', '27', '7063064231', '2019-03-08', '523620.78', '881042219379', '2019-03-14', '2019-03-13 13:18:48', '2019-03-13 13:18:48');
INSERT INTO `cock_consignment_child` VALUES ('51', '29', '7063064234', '2019-03-08', '196101.88', '801042245101', '2019-03-10', '2019-03-13 13:22:10', '2019-03-13 13:22:10');
INSERT INTO `cock_consignment_child` VALUES ('52', '38', '7063064258', '2019-03-09', '500926.08', '801042337677', '2019-03-15', '2019-03-13 13:52:51', '2019-03-13 13:52:51');
INSERT INTO `cock_consignment_child` VALUES ('53', '39', '7063064268', '2019-03-09', '591032.30', '831042419705', '2019-03-16', '2019-03-13 14:02:44', '2019-03-13 14:02:44');
INSERT INTO `cock_consignment_child` VALUES ('54', '40', '7063064276', '2019-03-10', '470668.80', '871042432168', '2019-03-16', '2019-03-13 15:36:08', '2019-03-13 15:36:08');
INSERT INTO `cock_consignment_child` VALUES ('55', '41', '7128237551', '2019-03-10', '558600', '841042432169', '2019-03-16', '2019-03-13 15:39:27', '2019-03-13 15:39:27');
INSERT INTO `cock_consignment_child` VALUES ('56', '42', '7128237552', '2019-03-10', '558600', '801042432170', '2019-03-16', '2019-03-13 15:41:56', '2019-03-13 15:41:56');
INSERT INTO `cock_consignment_child` VALUES ('57', '37', '7063064288', '2019-03-10', '567374.90', '881042476747', '2019-03-18', '2019-03-13 15:46:32', '2019-03-13 15:46:32');
INSERT INTO `cock_consignment_child` VALUES ('58', '43', '7128237581', '2019-03-10', '0000', '821042459146', '2019-03-16', '2019-03-13 15:51:35', '2019-03-13 15:51:35');
INSERT INTO `cock_consignment_child` VALUES ('59', '32', '7063064287', '2019-03-10', '588647.04', '841042476745', '2019-03-17', '2019-03-13 15:52:31', '2019-03-13 15:52:31');
INSERT INTO `cock_consignment_child` VALUES ('60', '33', '7063064291', '2019-03-10', '593700.88', '891042485209', '2019-03-17', '2019-03-13 15:53:18', '2019-03-13 15:53:18');
INSERT INTO `cock_consignment_child` VALUES ('61', '34', '7063064293', '2019-03-10', '602628.12', '851042490058', '2019-03-19', '2019-03-13 15:54:03', '2019-03-13 15:54:03');
INSERT INTO `cock_consignment_child` VALUES ('62', '35', '7063064294', '2019-03-10', '606552.92', '821042490059', '2019-03-18', '2019-03-13 15:54:46', '2019-03-13 15:54:46');
INSERT INTO `cock_consignment_child` VALUES ('63', '36', '7063064292', '2019-03-10', '415681.08', '871042486459', '2019-03-14', '2019-03-13 15:55:14', '2019-03-13 15:55:14');
INSERT INTO `cock_consignment_child` VALUES ('64', '44', '7063064300', '2019-03-11', '133801', '811042556882', '2019-03-13', '2019-03-13 15:57:24', '2019-03-13 15:57:24');
INSERT INTO `cock_consignment_child` VALUES ('65', '45', '7063064303', '2019-03-11', '153945.25', '881042580275', '2019-03-13', '2019-03-13 16:01:44', '2019-03-13 16:01:44');
INSERT INTO `cock_consignment_child` VALUES ('66', '46', '7105655708', '2019-03-08', '335600', '821042267842', '2019-03-14', '2019-03-13 16:07:07', '2019-03-13 16:07:07');
INSERT INTO `cock_consignment_child` VALUES ('67', '47', '7063064225', '2019-03-08', '29203.20', '', '2019-03-10', '2019-03-14 04:17:48', '2019-03-14 04:17:48');

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
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of cock_consignment_child2
-- ----------------------------
INSERT INTO `cock_consignment_child2` VALUES ('9', '4', '2', 'SOFT DRINK', '269', 'COKE', '6', '6', '', '2019-03-07 10:03:50', '2019-03-07 10:03:50');
INSERT INTO `cock_consignment_child2` VALUES ('10', '5', '2', 'SOFT DRINK', '938', 'COKE', '15', '15', '', '2019-03-07 10:20:25', '2019-03-07 10:20:25');
INSERT INTO `cock_consignment_child2` VALUES ('11', '3', '2', 'SOFT DRINK', '682', 'COKE', '16', '16', '', '2019-03-07 10:20:51', '2019-03-07 10:20:51');
INSERT INTO `cock_consignment_child2` VALUES ('13', '7', '2', 'SOFT DRINK', '1013', 'COKE', '15', '15', '', '2019-03-07 10:44:46', '2019-03-07 10:44:46');
INSERT INTO `cock_consignment_child2` VALUES ('14', '8', '2', 'SOFT DRINK', '830', 'COKE', '16', '16', '', '2019-03-07 10:55:10', '2019-03-07 10:55:10');
INSERT INTO `cock_consignment_child2` VALUES ('15', '9', '2', 'SOFT DRINK', '906', 'COKE', '15', '15', '', '2019-03-07 11:02:38', '2019-03-07 11:02:38');
INSERT INTO `cock_consignment_child2` VALUES ('16', '10', '2', 'SOFT DRINK', '906', 'COKE', '15', '15', '', '2019-03-07 11:10:18', '2019-03-07 11:10:18');
INSERT INTO `cock_consignment_child2` VALUES ('17', '6', '2', 'SOFT DRINK', '257', 'COKE', '6', '6', '', '2019-03-08 05:04:55', '2019-03-08 05:04:55');
INSERT INTO `cock_consignment_child2` VALUES ('18', '11', '1', 'NOTE BOOK', '256', 'COKE', '6', '6', '', '2019-03-08 07:28:03', '2019-03-08 07:28:03');
INSERT INTO `cock_consignment_child2` VALUES ('19', '12', '2', 'SOFT DRINK', '1540', 'COKE', '20', '20', '', '2019-03-08 07:39:39', '2019-03-08 07:39:39');
INSERT INTO `cock_consignment_child2` VALUES ('21', '13', '2', 'SOFT DRINK', '1035', 'COKE', '20', '20', '', '2019-03-08 07:55:51', '2019-03-08 07:55:51');
INSERT INTO `cock_consignment_child2` VALUES ('22', '14', '2', 'SOFT DRINK', '731', 'COKE', '15', '15', '', '2019-03-08 08:04:13', '2019-03-08 08:04:13');
INSERT INTO `cock_consignment_child2` VALUES ('23', '15', '2', 'SOFT DRINK', '221', 'COKE', '6', '6', '', '2019-03-08 08:11:11', '2019-03-08 08:11:11');
INSERT INTO `cock_consignment_child2` VALUES ('24', '16', '2', 'SOFT DRINK', '842', 'COKE', '16', '16', '', '2019-03-08 09:03:03', '2019-03-08 09:03:03');
INSERT INTO `cock_consignment_child2` VALUES ('25', '17', '2', 'SOFT DRINK', '760', 'COKE', '15', '15', '', '2019-03-08 09:08:38', '2019-03-08 09:08:38');
INSERT INTO `cock_consignment_child2` VALUES ('26', '18', '2', 'SOFT DRINK', '943', 'COKE', '15', '15', '', '2019-03-08 09:14:23', '2019-03-08 09:14:23');
INSERT INTO `cock_consignment_child2` VALUES ('27', '19', '2', 'SOFT DRINK', '856', 'COKE', '16', '16', '', '2019-03-08 09:41:11', '2019-03-08 09:41:11');
INSERT INTO `cock_consignment_child2` VALUES ('28', '20', '2', 'SOFT DRINK', '711', 'COKE', '15', '15', '', '2019-03-08 09:45:12', '2019-03-08 09:45:12');
INSERT INTO `cock_consignment_child2` VALUES ('29', '21', '2', 'SOFT DRINK', '1031', 'COKE', '15', '15', '', '2019-03-08 09:47:48', '2019-03-08 09:47:48');
INSERT INTO `cock_consignment_child2` VALUES ('30', '22', '2', 'SOFT DRINK', '512', 'COKE', '9', '9', '', '2019-03-08 09:52:11', '2019-03-08 09:52:11');
INSERT INTO `cock_consignment_child2` VALUES ('31', '23', '2', 'SOFT DRINK', '1044', 'COKE', '15', '15', '', '2019-03-08 09:57:47', '2019-03-08 09:57:47');
INSERT INTO `cock_consignment_child2` VALUES ('33', '24', '2', 'SOFT DRINK', '212', 'COKE', '6', '6', '', '2019-03-08 10:17:49', '2019-03-08 10:17:49');
INSERT INTO `cock_consignment_child2` VALUES ('34', '25', '2', 'SOFT DRINK', '756', 'COKE', '16', '16', '', '2019-03-09 05:33:42', '2019-03-09 05:33:42');
INSERT INTO `cock_consignment_child2` VALUES ('37', '26', '2', 'SOFT DRINK', '1445', 'COKE', '15', '15', '', '2019-03-09 05:56:56', '2019-03-09 05:56:56');
INSERT INTO `cock_consignment_child2` VALUES ('39', '28', '2', 'SOFT DRINK', '233', 'COKE', '6', '6', '', '2019-03-09 06:18:38', '2019-03-09 06:18:38');
INSERT INTO `cock_consignment_child2` VALUES ('41', '30', '2', 'SOFT DRINK', '672', 'COKE', '15', '15', '', '2019-03-09 06:30:20', '2019-03-09 06:30:20');
INSERT INTO `cock_consignment_child2` VALUES ('42', '31', '2', 'SOFT DRINK', '800', 'COKE', '16', '16', '', '2019-03-11 14:01:35', '2019-03-11 14:01:35');
INSERT INTO `cock_consignment_child2` VALUES ('49', '27', '2', 'SOFT DRINK', '799', 'COKE', '15', '15', '', '2019-03-13 13:18:48', '2019-03-13 13:18:48');
INSERT INTO `cock_consignment_child2` VALUES ('50', '29', '2', 'SOFT DRINK', '316', 'COKE', '6', '6', '', '2019-03-13 13:22:10', '2019-03-13 13:22:10');
INSERT INTO `cock_consignment_child2` VALUES ('51', '38', '2', 'SOFT DRINK', '741', 'COKE', '16', '16', '', '2019-03-13 13:52:51', '2019-03-13 13:52:51');
INSERT INTO `cock_consignment_child2` VALUES ('52', '39', '2', 'SOFT DRINK', '1002', 'COKE', '16', '16', '', '2019-03-13 14:02:44', '2019-03-13 14:02:44');
INSERT INTO `cock_consignment_child2` VALUES ('53', '40', '2', 'SOFT DRINK', '672', 'COKE', '16', '16', '', '2019-03-13 15:36:08', '2019-03-13 15:36:08');
INSERT INTO `cock_consignment_child2` VALUES ('54', '41', '2', 'SOFT DRINK', '1000', 'COKE', '20', '20', '', '2019-03-13 15:39:27', '2019-03-13 15:39:27');
INSERT INTO `cock_consignment_child2` VALUES ('55', '42', '2', 'SOFT DRINK', '1000', 'COKE', '20', '20', '', '2019-03-13 15:41:56', '2019-03-13 15:41:56');
INSERT INTO `cock_consignment_child2` VALUES ('56', '37', '2', 'SOFT DRINK', '908', 'COKE', '16', '16', '', '2019-03-13 15:46:32', '2019-03-13 15:46:32');
INSERT INTO `cock_consignment_child2` VALUES ('57', '43', '2', 'SOFT DRINK', '800', 'COKE', '16', '16', '', '2019-03-13 15:51:35', '2019-03-13 15:51:35');
INSERT INTO `cock_consignment_child2` VALUES ('58', '32', '2', 'SOFT DRINK', '992', 'COKE', '16', '16', '', '2019-03-13 15:52:31', '2019-03-13 15:52:31');
INSERT INTO `cock_consignment_child2` VALUES ('59', '33', '2', 'SOFT DRINK', '996', 'COKE', '16', '16', '', '2019-03-13 15:53:18', '2019-03-13 15:53:18');
INSERT INTO `cock_consignment_child2` VALUES ('60', '34', '2', 'SOFT DRINK', '1018', 'COKE', '16', '16', '', '2019-03-13 15:54:03', '2019-03-13 15:54:03');
INSERT INTO `cock_consignment_child2` VALUES ('61', '35', '2', 'SOFT DRINK', '1018', 'COKE', '16', '16', '', '2019-03-13 15:54:46', '2019-03-13 15:54:46');
INSERT INTO `cock_consignment_child2` VALUES ('62', '36', '2', 'SOFT DRINK', '664', 'COKE', '9', '9', '', '2019-03-13 15:55:14', '2019-03-13 15:55:14');
INSERT INTO `cock_consignment_child2` VALUES ('63', '44', '2', 'SOFT DRINK', '232', 'COKE', '6', '6', '', '2019-03-13 15:57:24', '2019-03-13 15:57:24');
INSERT INTO `cock_consignment_child2` VALUES ('64', '45', '2', 'SOFT DRINK', '185', 'COKE', '6', '6', '', '2019-03-13 16:01:44', '2019-03-13 16:01:44');
INSERT INTO `cock_consignment_child2` VALUES ('65', '46', '2', 'SOFT DRINK', '1600', 'COKE', '16', '16', '', '2019-03-13 16:07:07', '2019-03-13 16:07:07');
INSERT INTO `cock_consignment_child2` VALUES ('66', '47', '2', 'SOFT DRINK', '36', 'COKE', '6', '6', '', '2019-03-14 04:17:48', '2019-03-14 04:17:48');

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of coke_acknowledgement
-- ----------------------------

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of coke_acknowledgement_child
-- ----------------------------

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of coke_challan
-- ----------------------------
INSERT INTO `coke_challan` VALUES ('1', null, '7894565', '2019-03-11', '1', 'SILIGURI', '2', 'GUWAHATI', null, null, null, 'WB59B3513', '697TC57BSZ114822', '444026BSZ114822', 'TATA', 'SAJJAD ALI', 'GANGARAMPUR', '983270744', 'No', null, null, null, 'No', 'No', null, null, null, null, 'BAZAZ', '123456789', '1', 'SAJJAD ALI', '9832670733', 'TLP BAGDOGRA DARJEELING', 'WB7320020366314', 'SILIGURI', '1', 'SILIGURI', '1000', '100', '100', '800', '0', '2019-03-11 11:03:35', '2019-03-11 11:03:35', 'Eight Hundred Rupees  Only', '1', 'Jasoosk');

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of coke_challan_child2
-- ----------------------------
INSERT INTO `coke_challan_child2` VALUES ('1', '1', '3', '7894565', '2019-03-11 11:03:35', '2019-03-11 11:03:35', '50', '50', '50');

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of coke_challan_child3
-- ----------------------------
INSERT INTO `coke_challan_child3` VALUES ('1', '1', '50', '50', '50', '2019-03-11 11:03:35', '2019-03-11 11:03:35');

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of consignment
-- ----------------------------
INSERT INTO `consignment` VALUES ('1', '114308', '2019-03-04', '11', '1', 'SILIGURI', '6', 'FATAPUKUR', '', 'DARJEELING', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'HIMALAYA AGENCIES', '1', 'LCV.6', '2', 'WB67A3151', '134353.51', '0', '2019-03-05 17:45:11', '2019-03-05 17:45:11', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', '1ST FLOOR 5A NEHRU ROADCHOWRASTA, DARJEELING, WEST BENGAL 734101', 'Prince');
INSERT INTO `consignment` VALUES ('3', '52141', '2019-03-14', '44', '', 'SILIGURI', '1', 'SILIGURI', '', 'GUWAHATI', '', 'ITC LIMITED -EDUCATION & STATIONERY', 'Jason', '3', 'HCV.15', '2', 'WB67A3151', '10000', '0', '2019-03-14 09:03:53', '2019-03-14 09:03:53', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'RANI SATI WAREHOUSING & LOGISTIC, BARDHAMAN WEST BENGAL 713383', 'Prince');

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of consignment_child
-- ----------------------------
INSERT INTO `consignment_child` VALUES ('1', '1', '7105655463', '2019-03-04', '134353.51', '841041515979', '2019-03-10', '2019-03-05 17:45:11', '2019-03-05 17:45:11');
INSERT INTO `consignment_child` VALUES ('2', '1', '7105655464', '2019-03-13', '134353.51', '841041515980', '2019-03-10', '2019-03-13 11:58:40', '2019-03-13 11:58:42');
INSERT INTO `consignment_child` VALUES ('3', '1', '7105655465', '2019-03-13', '134353.51', '841041515981', '2019-03-13', '2019-03-13 13:51:08', '2019-03-13 13:51:10');
INSERT INTO `consignment_child` VALUES ('4', '3', '789456', '2019-03-14', '10000', 'B789456', null, '2019-03-14 09:03:53', '2019-03-14 09:03:53');

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
INSERT INTO `consignment_child2` VALUES ('1', '1', '2', 'SOFT DRINK', '269', 'COKE', '6', '6', '', '2019-03-05 17:45:11', '2019-03-05 17:45:11');
INSERT INTO `consignment_child2` VALUES ('2', '1', '2', 'SOFT DRINK', '200', 'COKE', '10', '10', null, '2019-03-13 11:57:36', '2019-03-13 11:57:39');
INSERT INTO `consignment_child2` VALUES ('3', '3', '2', 'SOFT DRINK', '25', 'wow', '50', '50', 'carry carefully', '2019-03-14 09:03:53', '2019-03-14 09:03:53');

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of driver
-- ----------------------------
INSERT INTO `driver` VALUES ('1', 'SAJJAD ALI', 'WB7320020366314', 'SILIGURI', 'TLP BAGDOGRA DARJEELING', '9832670733', '', '', '2018-12-22 10:45:40', '2018-12-22 10:45:40');
INSERT INTO `driver` VALUES ('2', 'ASHADUL MIDYA', 'WB67-20110012691', 'BANKURA', 'SONAMUKHI BANKURA', '983291766', '', '', '2018-12-25 09:27:58', '2018-12-25 09:27:58');
INSERT INTO `driver` VALUES ('3', 'KAMLESH KUMAR', 'UP8320160009319', 'FIROZABAD', 'KHADIT JASRANA FIROZABAD', '8954694060', '', '', '2018-12-29 16:24:52', '2018-12-29 16:24:52');
INSERT INTO `driver` VALUES ('4', 'KULDEEP KUMAR', 'UP5820020025311', 'SANT KABIR NAGAR', '', '9667658028', '', '', '2019-01-12 16:09:51', '2019-01-19 16:05:26');
INSERT INTO `driver` VALUES ('5', 'PRADIP DAS', '77904/TV/Z/10', 'NAGALAND', 'SILIGURI', '', '9932955250', '', '2019-02-06 11:56:03', '2019-02-06 11:56:03');

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of driver_images
-- ----------------------------

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of freightbill_child
-- ----------------------------
INSERT INTO `freightbill_child` VALUES ('3', '3', '114308', '5', '520', '5', '520', '0', '0', '2019-03-14 11:45:27', '2019-03-14 11:45:27');
INSERT INTO `freightbill_child` VALUES ('4', '4', '114308', '5.5', '621.5', '1.3', '146.9', '0', '0', '2019-03-14 12:01:39', '2019-03-14 12:01:39');
INSERT INTO `freightbill_child` VALUES ('5', '5', '114308', '0', '0', '0', '0', '0', '0', '2019-03-14 12:24:56', '2019-03-14 12:24:56');

-- ----------------------------
-- Table structure for `freight_bill`
-- ----------------------------
DROP TABLE IF EXISTS `freight_bill`;
CREATE TABLE `freight_bill` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `bill_date` date DEFAULT NULL,
  `branch_code` varchar(255) DEFAULT NULL,
  `bill_no` varchar(255) DEFAULT NULL,
  `party_code` varchar(255) DEFAULT NULL,
  `consignment_type` varchar(255) DEFAULT NULL,
  `gst_type` varchar(255) DEFAULT NULL,
  `consignment_no` varchar(255) DEFAULT NULL,
  `qty` varchar(255) DEFAULT NULL,
  `freight` varchar(255) DEFAULT NULL,
  `detention` varchar(255) DEFAULT NULL,
  `labour` varchar(255) DEFAULT NULL,
  `cock_lr_no` varchar(255) DEFAULT NULL,
  `invoice_no` varchar(255) DEFAULT NULL,
  `snt_charge` varchar(255) DEFAULT NULL,
  `toll_tax` varchar(255) DEFAULT NULL,
  `weight` varchar(255) DEFAULT NULL,
  `total_amount` varchar(255) DEFAULT NULL,
  `rate_of_gst` varchar(255) DEFAULT NULL,
  `rate_of_igst` varchar(255) DEFAULT NULL,
  `net_amount` varchar(255) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `loading_charge` varchar(255) DEFAULT NULL,
  `unloading_charge` varchar(255) DEFAULT NULL,
  `net_amount_in_word` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `consignment_no` (`consignment_no`),
  CONSTRAINT `consignment_no` FOREIGN KEY (`consignment_no`) REFERENCES `acknowledgement` (`challan_number`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of freight_bill
-- ----------------------------
INSERT INTO `freight_bill` VALUES ('3', '2019-03-14', '1101', 'Bill2018', '11', null, '1', '114308', '469', '10000', '100', '100', null, '7105655463 / 64 / 65 ', null, null, '16', '10400', '5', '0', '11440', '2019-03-14 11:45:27', '2019-03-14 11:45:27', '100', '100', null);
INSERT INTO `freight_bill` VALUES ('4', '2019-03-14', '1101', 'SBTS11056789', '44', null, '1', '114308', '469', '10000', '1000', '100', null, '7105655463 / 64 / 65 ', null, null, '16', '11300', '6.8', '1.5', '12068', '2019-03-14 12:01:39', '2019-03-14 12:01:39', '100', '100', null);
INSERT INTO `freight_bill` VALUES ('5', '2019-03-14', '1101', 'BOLIIDIjfi', '44', null, '0', '114308', '469', '1000', '10', '10', null, '7105655463 / 64 / 65 ', null, null, '16', '1040', '0', '0', '1040', '2019-03-14 12:24:56', '2019-03-14 12:24:56', '10', '10', 'One Thousand Forty   Rupees  Only');

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
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`consignor_name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of indent
-- ----------------------------
INSERT INTO `indent` VALUES ('5', 'IN0005', '2019-03-06', '1', '1101', '2', 'GUWAHATI', null, '1', 'ITC LIMITED -EDUCATION & STATIONERY', '1', '2019-03-06', null, null, '1', 'NOTE BOOK', null, null, null, '0', '2019-03-06 07:37:19', '2019-03-07 12:30:45');
INSERT INTO `indent` VALUES ('6', 'IN0006', '2019-03-06', '1', '1101', '2', 'GUWAHATI', null, '1', 'ITC LIMITED -EDUCATION & STATIONERY', '1', '2019-03-06', null, null, '2', 'SOFT DRINK', null, null, null, '0', '2019-03-06 08:30:11', '2019-03-07 09:24:24');
INSERT INTO `indent` VALUES ('7', 'IN0007', '2019-03-06', '1', '1101', '1', 'SILIGURI', null, '2', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', '2', '2019-03-05', null, null, '2', 'SOFT DRINK', null, null, null, '0', '2019-03-07 10:31:35', '2019-03-07 10:32:30');

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
) ENGINE=InnoDB AUTO_INCREMENT=120 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of indentplacement_child
-- ----------------------------
INSERT INTO `indentplacement_child` VALUES ('116', '28', 'BETTIAH', '50', 'LCV.6', 'WB213465', '2500', '2019-03-08 06:36:13', '2019-03-08 06:36:13', '9876543210', 'ITC SECTION', null, 'GAZIPUR VANARASH ROADWAYS', '95', '2019-03-08', null);
INSERT INTO `indentplacement_child` VALUES ('117', '28', 'BARAUNI', '25', 'HCV.15', 'Wb7898665', '100', '2019-03-08 06:36:14', '2019-03-08 06:36:14', '1234567890', 'Prince', null, '', '96', '2019-03-30', null);
INSERT INTO `indentplacement_child` VALUES ('118', '25', 'BETTIAH', '25', 'HCV.15', 'WBstrvs', '1200', '2019-03-12 05:08:52', '2019-03-12 05:08:52', '9876543210', 'Prince', null, 'DURGAPUR ROADWAYS', '100', null, 'remark1');
INSERT INTO `indentplacement_child` VALUES ('119', '25', 'SILIGURI', '78', 'HCV.16', 'Wb7898665', '', '2019-03-12 05:08:53', '2019-03-12 05:08:53', '', 'Prince', null, 'GAZIPUR VANARASH ROADWAYS', '102', null, '');

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
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of indent_child
-- ----------------------------
INSERT INTO `indent_child` VALUES ('64', '6', 'GUWAHATI', '50', 'HCV.16', '2019-03-07 09:24:24', '2019-03-07 09:24:24', '2', 'Jason');
INSERT INTO `indent_child` VALUES ('65', '6', 'BETTIAH', '80', 'HCV.15', '2019-03-07 09:24:24', '2019-03-07 09:24:24', '3', 'Prince');
INSERT INTO `indent_child` VALUES ('95', '7', 'BETTIAH', '50', 'LCV.6', '2019-03-07 10:32:30', '2019-03-07 10:32:30', '1', 'ITC SECTION');
INSERT INTO `indent_child` VALUES ('96', '7', 'BARAUNI', '25', 'HCV.15', '2019-03-07 10:32:30', '2019-03-07 10:32:30', '3', 'Prince');
INSERT INTO `indent_child` VALUES ('100', '5', 'BETTIAH', '25', 'HCV.15', '2019-03-07 12:16:22', '2019-03-07 12:16:22', '3', 'Prince');
INSERT INTO `indent_child` VALUES ('102', '5', 'SILIGURI', '78', 'HCV.16', '2019-03-07 12:30:45', '2019-03-07 12:30:45', '2', 'Prince');

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
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of indent_child_connection
-- ----------------------------
INSERT INTO `indent_child_connection` VALUES ('7', null, 'GUWAHATI', '50', 'HCV.16', null, null, '2019-03-07 09:24:24', '2019-03-07 09:24:24', null, 'Jason', null, null, '6');
INSERT INTO `indent_child_connection` VALUES ('8', null, 'BETTIAH', '80', 'HCV.15', null, null, '2019-03-07 09:24:25', '2019-03-07 09:24:25', null, 'Prince', null, null, '6');
INSERT INTO `indent_child_connection` VALUES ('32', null, 'BETTIAH', '50', 'HCV.15', null, null, '2019-03-07 09:46:06', '2019-03-07 09:46:06', null, 'ITC SECTION', null, null, '5');
INSERT INTO `indent_child_connection` VALUES ('33', null, 'DARJEELING', '50', 'LCV.6', null, null, '2019-03-07 09:46:06', '2019-03-07 09:46:06', null, 'new asdsad', null, null, '5');
INSERT INTO `indent_child_connection` VALUES ('34', null, 'GUWAHATI', '25', 'LCV.6', null, null, '2019-03-07 09:46:06', '2019-03-07 09:46:06', null, 'Prince', null, null, '5');
INSERT INTO `indent_child_connection` VALUES ('35', null, 'BETTIAH', '15', 'HCV.16', null, null, '2019-03-07 09:46:06', '2019-03-07 09:46:06', null, 'ffffffff', null, null, '5');
INSERT INTO `indent_child_connection` VALUES ('36', null, 'SILIGURI', '10', 'HCV.15', null, null, '2019-03-07 09:46:06', '2019-03-07 09:46:06', null, 'ppppppp', null, null, '5');

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
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of indent_placement
-- ----------------------------
INSERT INTO `indent_placement` VALUES ('25', '5', 'IN0005', '2019-03-06', 'GUWAHATI', '1101', '44', 'ITC LIMITED -EDUCATION & STATIONERY', null, null, null, null, null, null, null, '2019-03-07 12:16:12', '2019-03-12 05:08:52');
INSERT INTO `indent_placement` VALUES ('28', '7', 'IN0007', '2019-03-05', 'SILIGURI', '1101', '11', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', null, null, null, null, null, null, null, '2019-03-08 05:39:56', '2019-03-08 06:36:13');

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of insurance
-- ----------------------------
INSERT INTO `insurance` VALUES ('1', 'BAZAZ', '2018-07-18 12:20:22', '2018-07-18 12:20:22');
INSERT INTO `insurance` VALUES ('2', 'Hardwell Insurance with all kind of Value', '2018-12-12 17:27:44', '2018-12-12 17:27:44');
INSERT INTO `insurance` VALUES ('3', 'NEW INDIA ASSURANCE CO.LTD.', '2018-12-29 16:26:10', '2018-12-29 16:26:10');
INSERT INTO `insurance` VALUES ('4', 'NATIONAL INSURANCE CO LTD', '2019-01-19 15:50:15', '2019-01-19 16:04:45');

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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of lorry
-- ----------------------------
INSERT INTO `lorry` VALUES ('1', 'WB59B3513', '697TC57BSZ114822', '444026BSZ114822', 'TATA', 'SAJJAD ALI', 'GANGARAMPUR', '983270744', '', '', 'ALAPA0048H', '', '', null, '', '', '2018-12-22 11:05:06', '2018-12-22 11:05:06');
INSERT INTO `lorry` VALUES ('2', 'WB67A3151', '21F63267809', 'MAT448035C3F16412', 'TATA', 'JIKRIA MIDYA', 'BANKURA', '7908008297', '', '', 'BQBPM3490A', '', '', null, '', '', '2018-12-25 09:23:30', '2018-12-25 09:23:30');
INSERT INTO `lorry` VALUES ('3', 'RJ32GC0343', 'JGEZ403678', 'MB1CTCHD6JAGH6839', 'AL', 'BRAJ BIHARI YADAV', 'KOTPUTALI, JAIPUR', '9928003229', '', '', 'AKXPY2515P', '', '', null, '', '', '2018-12-29 16:12:40', '2018-12-29 16:12:40');
INSERT INTO `lorry` VALUES ('4', 'DL01GC4986', '51D84223091', 'MAT448022F5E05979', 'TATA', 'KAMLESH DEVI', 'PRITAMPURA, DELHI', '9999944614', '', '', 'BJCPD3387H', '', '', null, '', '', '2019-01-12 15:29:31', '2019-01-12 15:29:31');
INSERT INTO `lorry` VALUES ('5', 'NL02L8361', '41L63406837', 'MAT466388E1N19667', 'TATA', 'MAHESH CHAUDHURI', 'MOKOKCHUNG, NAGALAND', '9832014855', '', '', 'AOSPC2545L', '', '', null, '', '', '2019-02-06 11:47:12', '2019-02-06 11:47:12');
INSERT INTO `lorry` VALUES ('6', 'WBstrvs', '', '', '', '', '', '', '', '', '', '', '', null, '', '', '2019-03-08 07:04:10', '2019-03-08 07:04:10');

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of lorry_image
-- ----------------------------
INSERT INTO `lorry_image` VALUES ('1', '6', 'rc', 'permit', 'insurance', 'fitness', 'pan', '2019-03-08 07:04:10', '2019-03-08 07:04:10');

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
INSERT INTO `party` VALUES ('1', 'ITC LIMITED -EDUCATION & STATIONERY', '44', 'AAACH3005M', '19AAACH3005M1ZO', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', '9733006465', '', '', '', '2018-12-29 16:15:34', '2018-12-29 16:16:13');
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of petrol_pump
-- ----------------------------
INSERT INTO `petrol_pump` VALUES ('1', 'Indian Petrol', 'Siliguri', '2019-01-03 10:23:39', '2019-01-03 10:23:39');
INSERT INTO `petrol_pump` VALUES ('2', 'MAINAO SERVICE STATION', 'BHUTKI, JALPAIGURI', '2019-01-12 15:48:11', '2019-01-12 15:48:11');
INSERT INTO `petrol_pump` VALUES ('3', 'JALPAIGURI SERVICE CENTRE', 'MOHITNAGAR, JALPAIGURI', '2019-01-12 15:49:29', '2019-01-12 15:49:29');

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of petrol_pump_record
-- ----------------------------
INSERT INTO `petrol_pump_record` VALUES ('1', '1', '1', '1000', '2019/03/09', '2019-03-09 08:36:52', '2019-03-09 08:36:52');
INSERT INTO `petrol_pump_record` VALUES ('2', '1', '1', '100', '2019/03/11', '2019-03-11 11:03:35', '2019-03-11 11:03:35');
INSERT INTO `petrol_pump_record` VALUES ('3', '1', '1', '100', '2019/03/11', '2019-03-11 11:06:02', '2019-03-11 11:06:02');
INSERT INTO `petrol_pump_record` VALUES ('4', '2', '1', '100', '2019/03/11', '2019-03-11 12:22:02', '2019-03-11 12:22:02');

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
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_email_unique` (`email`) USING BTREE,
  UNIQUE KEY `user_mobile_unique` (`mobile`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'Koustav', 'koustav.ju@gmail.com', '$2y$10$n5k8JJVQQitVVj6fct.vreyK3IoZlWDyDChLBiFZebewqGE5Dv8.m', 'Admin', 'HYnSdLcdn4wj5wQgXpYuIrwOsYkYN9weeLhamDxCOs2ltghUpWRwM57KyuMf', '2016-12-25 02:31:00', '2018-01-09 12:56:06', 'siliguri', '8420843222', 'siliguri', null, null);
INSERT INTO `users` VALUES ('2', 'Narayan Paswan', 'paswan.narayan@gmail.com', '$2y$10$8qwbV/l1iws9atYykHI1k.T/47gDtXSua26YVjN2ODKniBnxBqWAm', 'Admin', 'gTya59Xgfp69IbTNbEnCRWGPBKIGxGzftyrYs1ufp89erJTxFmM8JTlZ2OJa', '2018-04-13 10:44:12', '2018-11-28 11:11:36', null, null, null, null, null);
INSERT INTO `users` VALUES ('3', 'Nawin Ji', 'nawinji@gmail.com', '$2y$10$rphrFMN6z3BHwVQspK/S4ueM2ZRSLAk2usmsnLbifZhVWPAA0xlkm', 'Admin', 'B60Vh1dexIN9GbUTR8Wkp48TYWdByUnFFJPcgEqzVtdWcwX6m5z3IgmRbiJG', '2018-07-04 13:03:46', '2018-07-04 13:04:20', null, null, null, null, null);
INSERT INTO `users` VALUES ('4', 'Prince', 'prncsharma@gmail.com', '$2y$10$vxlVOoYnpHCECwJlpXn9Ce/a53vQtVQlp4RmQJ0T.sXnmGc2tqzqu', 'Admin', 'sLT4E859wwg5a0Sxg0MjiCw61Cme8j4Cds7WUi2bLRTNTSCb3hrNb7nZ2XSB', '2018-11-23 11:59:04', '2018-11-27 11:25:16', null, null, null, null, null);
