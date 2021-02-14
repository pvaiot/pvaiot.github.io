/*
Navicat MySQL Data Transfer

Source Server         : MySql
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : bhawani_transport

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2019-03-06 17:17:15
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of acknowledgement
-- ----------------------------

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of acknowledgement_child
-- ----------------------------

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of challan
-- ----------------------------

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of challan_child2
-- ----------------------------

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of challan_child3
-- ----------------------------

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of cock_consignment
-- ----------------------------
INSERT INTO `cock_consignment` VALUES ('2', '7894565', '2019-03-05', '11', '', 'Siliguri', '2', 'GUWAHATI', '', 'BETTIAH', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'Jason', '3', 'HCV.15', '1', 'WB59B3513', '10000', '0', '2019-03-06 11:32:54', '2019-03-06 11:32:54', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', 'Jaipur', 'Prince', 'Trip123', 'Load123');

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of cock_consignment_child
-- ----------------------------
INSERT INTO `cock_consignment_child` VALUES ('1', '2', 'Invoice12345', '2019-03-05', '10000', 'Waybill123', '2019-03-10', '2019-03-06 11:32:54', '2019-03-06 11:32:54');

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of cock_consignment_child2
-- ----------------------------
INSERT INTO `cock_consignment_child2` VALUES ('1', '2', '2', 'SOFT DRINK', '50', 'discription1', '50', '50', 'remark1', '2019-03-06 11:32:54', '2019-03-06 11:32:54');

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of consignment
-- ----------------------------
INSERT INTO `consignment` VALUES ('1', '114308', '2019-03-04', '11', '1', 'SILIGURI', '6', 'FATAPUKUR', '', 'DARJEELING', '', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', 'HIMALAYA AGENCIES', '1', 'LCV.6', '2', 'WB67A3151', '134353.51', '0', '2019-03-05 17:45:11', '2019-03-05 17:45:11', 'DC FATAPUKUR, PANIKAURI GRAM PANCHAYAT, MOUZA KISMAT SUKHANI, JALPAIGURI, WEST BENGAL 735134', '1ST FLOOR 5A NEHRU ROADCHOWRASTA, DARJEELING, WEST BENGAL 734101', 'Prince');

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of consignment_child
-- ----------------------------
INSERT INTO `consignment_child` VALUES ('1', '1', '7105655463', '2019-03-04', '134353.51', '841041515979', '2019-03-10', '2019-03-05 17:45:11', '2019-03-05 17:45:11');

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of consignment_child2
-- ----------------------------
INSERT INTO `consignment_child2` VALUES ('1', '1', '2', 'SOFT DRINK', '269', 'COKE', '6', '6', '', '2019-03-05 17:45:11', '2019-03-05 17:45:11');

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
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`consignor_name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of indent
-- ----------------------------
INSERT INTO `indent` VALUES ('5', 'IN0005', '2019-03-06', '1', '1101', '2', 'GUWAHATI', null, '1', 'ITC LIMITED -EDUCATION & STATIONERY', '1', '2019-03-06', null, null, '1', 'NOTE BOOK', null, null, null, '0', '2019-03-06 07:37:19', '2019-03-06 07:44:26');
INSERT INTO `indent` VALUES ('6', 'IN0006', '2019-03-06', '1', '1101', '2', 'GUWAHATI', null, '1', 'ITC LIMITED -EDUCATION & STATIONERY', '1', '2019-03-06', null, null, '2', 'SOFT DRINK', null, null, null, '0', '2019-03-06 08:30:11', '2019-03-06 08:30:11');

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
  PRIMARY KEY (`id`),
  KEY `indentplacement_id` (`indentplacement_id`),
  CONSTRAINT `indentplacement_id` FOREIGN KEY (`indentplacement_id`) REFERENCES `indent_placement` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of indentplacement_child
-- ----------------------------
INSERT INTO `indentplacement_child` VALUES ('21', '8', 'BETTIAH', '50', 'HCV.15', '', '', '2019-03-06 10:31:16', '2019-03-06 10:31:16', '', 'ITC SECTION', null, 'GAZIPUR VANARASH ROADWAYS');
INSERT INTO `indentplacement_child` VALUES ('22', '8', 'DARJEELING', '50', 'LCV.6', '', '', '2019-03-06 10:31:16', '2019-03-06 10:31:16', '', 'new asdsad', null, '');
INSERT INTO `indentplacement_child` VALUES ('23', '8', 'GUWAHATI', '25', 'LCV.6', '', '', '2019-03-06 10:31:16', '2019-03-06 10:31:16', '', 'Prince', null, '');
INSERT INTO `indentplacement_child` VALUES ('24', '8', 'DARJEELING', '125', 'HCV.16', '', '', '2019-03-06 10:31:16', '2019-03-06 10:31:16', '', 'JASON', null, '');
INSERT INTO `indentplacement_child` VALUES ('25', '8', 'CHHAPRA', '5666', 'HCV.16', '', '', '2019-03-06 10:31:16', '2019-03-06 10:31:16', '', 'ttttttttttttt', null, '');

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
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of indent_child
-- ----------------------------
INSERT INTO `indent_child` VALUES ('33', '5', 'BETTIAH', '50', 'HCV.15', '2019-03-06 07:44:26', '2019-03-06 07:44:26', '3', 'ITC SECTION');
INSERT INTO `indent_child` VALUES ('34', '5', 'DARJEELING', '50', 'LCV.6', '2019-03-06 07:44:27', '2019-03-06 07:44:27', '1', 'new asdsad');
INSERT INTO `indent_child` VALUES ('35', '5', 'GUWAHATI', '25', 'LCV.6', '2019-03-06 07:44:27', '2019-03-06 07:44:27', '1', 'Prince');
INSERT INTO `indent_child` VALUES ('36', '5', 'DARJEELING', '125', 'HCV.16', '2019-03-06 07:44:27', '2019-03-06 07:44:27', '2', 'JASON');
INSERT INTO `indent_child` VALUES ('37', '5', 'CHHAPRA', '5666', 'HCV.16', '2019-03-06 07:44:27', '2019-03-06 07:44:27', '2', 'ttttttttttttt');
INSERT INTO `indent_child` VALUES ('44', '6', 'GUWAHATI', '50', 'HCV.16', '2019-03-06 08:30:12', '2019-03-06 08:30:12', '2', 'Jason');
INSERT INTO `indent_child` VALUES ('45', '6', 'BETTIAH', '80', 'HCV.15', '2019-03-06 08:30:12', '2019-03-06 08:30:12', '3', 'Prince');

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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of indent_placement
-- ----------------------------
INSERT INTO `indent_placement` VALUES ('8', '5', 'IN0005', '1970-01-01', 'GUWAHATI', '1101', '44', 'ITC LIMITED -EDUCATION & STATIONERY', null, null, null, null, null, null, null, '2019-03-06 10:27:42', '2019-03-06 10:31:16');

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of lorry
-- ----------------------------
INSERT INTO `lorry` VALUES ('1', 'WB59B3513', '697TC57BSZ114822', '444026BSZ114822', 'TATA', 'SAJJAD ALI', 'GANGARAMPUR', '983270744', '', '', 'ALAPA0048H', '', '', null, '', '', '2018-12-22 11:05:06', '2018-12-22 11:05:06');
INSERT INTO `lorry` VALUES ('2', 'WB67A3151', '21F63267809', 'MAT448035C3F16412', 'TATA', 'JIKRIA MIDYA', 'BANKURA', '7908008297', '', '', 'BQBPM3490A', '', '', null, '', '', '2018-12-25 09:23:30', '2018-12-25 09:23:30');
INSERT INTO `lorry` VALUES ('3', 'RJ32GC0343', 'JGEZ403678', 'MB1CTCHD6JAGH6839', 'AL', 'BRAJ BIHARI YADAV', 'KOTPUTALI, JAIPUR', '9928003229', '', '', 'AKXPY2515P', '', '', null, '', '', '2018-12-29 16:12:40', '2018-12-29 16:12:40');
INSERT INTO `lorry` VALUES ('4', 'DL01GC4986', '51D84223091', 'MAT448022F5E05979', 'TATA', 'KAMLESH DEVI', 'PRITAMPURA, DELHI', '9999944614', '', '', 'BJCPD3387H', '', '', null, '', '', '2019-01-12 15:29:31', '2019-01-12 15:29:31');
INSERT INTO `lorry` VALUES ('5', 'NL02L8361', '41L63406837', 'MAT466388E1N19667', 'TATA', 'MAHESH CHAUDHURI', 'MOKOKCHUNG, NAGALAND', '9832014855', '', '', 'AOSPC2545L', '', '', null, '', '', '2019-02-06 11:47:12', '2019-02-06 11:47:12');

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of lorry_image
-- ----------------------------

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
INSERT INTO `party` VALUES ('1', 'ITC LIMITED -EDUCATION & STATIONERY', '44', '', '', '', '', '', '', '', '2018-12-29 16:15:34', '2018-12-29 16:16:13');
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of petrol_pump_record
-- ----------------------------

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
INSERT INTO `users` VALUES ('4', 'Prince', 'prncsharma@gmail.com', '$2y$10$vxlVOoYnpHCECwJlpXn9Ce/a53vQtVQlp4RmQJ0T.sXnmGc2tqzqu', 'Admin', 'nhW56Pd5eINz9Erv3Is9wdcvkGHJIh5vldW5U15iBzV0HTwpDr0wlvW1hX7w', '2018-11-23 11:59:04', '2018-11-27 11:25:16', null, null, null, null, null);
