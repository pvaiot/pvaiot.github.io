/*
Navicat MySQL Data Transfer

Source Server         : MySql
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : bhawani_transport

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2019-02-27 17:04:21
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of acknowledgement
-- ----------------------------
INSERT INTO `acknowledgement` VALUES ('7', '9', 'P25896', '2019-01-19', 'Siliguri', 'Malbazar', 'WB213465', 'assdasdasd', '2018-12-22', '02:00', '2019-01-22', '02:15', 'Siliguri', '2018-12-20', '2018-12-25', '8000', '2019-02-01 07:29:04', '2019-02-01 07:29:04');
INSERT INTO `acknowledgement` VALUES ('8', '12', 'draco Meteor', '2019-02-06', 'Siliguri', 'Siliguri', 'Wb72p4632', 'asdhgd', '2019-02-13', '10:10', '2019-02-13', '10:40', 'Siliguri', '2019-02-20', '2019-02-25', '3000', '2019-02-13 05:10:58', '2019-02-13 05:10:58');

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of acknowledgement_child
-- ----------------------------
INSERT INTO `acknowledgement_child` VALUES ('4', '7', null, '25', '25', 'Yes', null, null, null, null, null, '2019-02-01 07:29:04', '2019-02-01 07:29:04');
INSERT INTO `acknowledgement_child` VALUES ('5', '8', null, '50', '50', 'Yes', null, null, null, null, null, '2019-02-13 05:10:58', '2019-02-13 05:10:58');

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of balance_hire_process
-- ----------------------------
INSERT INTO `balance_hire_process` VALUES ('3', 'P25896', '2019-01-19', 'WB213465', 'Siliguri', 'Malbazar', '1000', '829', '10000', '8000', '200', '200', '200', '200', '200', '20', '20', '20', '200', '200', '100', '100', '100', 'Siliguri', '2019-02-14', '2019-02-14');

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
INSERT INTO `bank_name` VALUES ('1', 'Allahabad Bank', '2018-05-25 06:05:42', '2018-05-25 06:05:42');
INSERT INTO `bank_name` VALUES ('2', 'Andhra Bank', '2018-05-25 06:05:54', '2018-05-25 06:05:54');
INSERT INTO `bank_name` VALUES ('3', 'Axis Bank', '2018-05-25 06:06:04', '2018-05-25 06:06:04');
INSERT INTO `bank_name` VALUES ('4', 'Bank of Baroda', '2018-05-25 06:06:18', '2018-05-25 06:06:18');
INSERT INTO `bank_name` VALUES ('7', 'Canara Bank', '2018-05-25 06:06:49', '2018-05-25 06:06:49');
INSERT INTO `bank_name` VALUES ('8', 'Central Bank of India', '2018-05-25 06:06:57', '2018-05-25 06:06:57');
INSERT INTO `bank_name` VALUES ('9', 'Union Bank', '2018-05-25 06:07:11', '2018-05-25 06:07:11');
INSERT INTO `bank_name` VALUES ('10', 'Corporation Bank', '2018-05-25 06:07:29', '2018-05-25 06:07:29');
INSERT INTO `bank_name` VALUES ('11', 'Federal Bank', '2018-05-25 06:07:56', '2018-05-25 06:07:56');
INSERT INTO `bank_name` VALUES ('12', 'ICICI Bank', '2018-05-25 06:08:09', '2018-05-25 06:08:09');
INSERT INTO `bank_name` VALUES ('13', 'IDBI Bank', '2018-05-25 06:08:21', '2018-05-25 06:08:21');
INSERT INTO `bank_name` VALUES ('14', 'Indian Bank', '2018-05-25 06:08:29', '2018-05-25 06:08:29');
INSERT INTO `bank_name` VALUES ('15', 'Kotak Bank', '2018-05-25 06:08:43', '2018-05-25 06:08:43');
INSERT INTO `bank_name` VALUES ('16', 'Punjab National Bank ', '2018-05-25 06:08:54', '2018-05-25 06:08:54');
INSERT INTO `bank_name` VALUES ('17', 'State Bank of India', '2018-05-25 06:09:08', '2018-05-25 06:09:08');
INSERT INTO `bank_name` VALUES ('18', 'Syndicate Bank', '2018-05-25 06:09:20', '2018-05-25 06:09:20');
INSERT INTO `bank_name` VALUES ('19', 'UCO Bank', '2018-05-25 06:09:29', '2018-05-25 06:09:29');
INSERT INTO `bank_name` VALUES ('20', 'Union Bank of India', '2018-05-25 06:09:39', '2018-05-25 06:09:39');
INSERT INTO `bank_name` VALUES ('21', 'United Bank of India', '2018-05-25 06:09:54', '2018-05-25 06:09:54');
INSERT INTO `bank_name` VALUES ('22', 'Vijaya Bank', '2018-05-25 06:10:03', '2018-05-25 06:10:03');
INSERT INTO `bank_name` VALUES ('23', 'Yes Bank Ltd', '2018-05-25 06:10:14', '2018-05-25 06:10:14');

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of branch
-- ----------------------------
INSERT INTO `branch` VALUES ('1', 'Patna', 'Darbhanga', 'Bihar', 'pat205', '2018-07-18 06:46:27', '2018-07-18 06:46:27');
INSERT INTO `branch` VALUES ('2', 'Rajkote', 'raj', 'Gujrat', 'gu887', '2018-07-18 06:46:47', '2018-07-18 06:46:47');
INSERT INTO `branch` VALUES ('3', 'Siliguri', 'Darjeeling', 'WEST BENGAL', 'S150', '2018-11-26 06:13:30', '2018-11-26 06:13:30');

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of broker
-- ----------------------------
INSERT INTO `broker` VALUES ('1', 'adhasj', 'jkdsjkhadjh', 'jkhjkhadjakhadsjkh', 'kjshdkjadshkj', 'hjkdahjkashjk', 'hjkasdhjdhasjh', '2018-12-22 06:21:50', '2018-12-22 06:21:50');

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
INSERT INTO `broker_image` VALUES ('1', '1', '115454603249_front.png', '115454597105_back.png', '2018-12-22 12:02:04', '2018-12-22 06:32:04');

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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of challan
-- ----------------------------
INSERT INTO `challan` VALUES ('9', null, 'P25896', '2019-01-19', '1', 'Siliguri', '2', 'Malbazar', null, null, null, 'WB213465', 'engine987', 'cha123456', 'something', 'HARDWELL', 'LA', '1234567890', 'No', null, null, null, 'No', 'No', null, null, null, null, 'LIC', 'asdasdads', '1', 'jason', '1234567890', 'Millanpally', 'lic12345679', 'SILIGURI', '3', 'Siliguri', '10000', '1000', '1000', '8000', '0', '2019-01-19 08:33:14', '2019-01-19 08:33:52', 'Eight Thousand Rupees  Only', '3', null);
INSERT INTO `challan` VALUES ('10', null, 'Newconsignment123', '2019-01-29', '1', 'Siliguri', '6', 'jaipur', null, null, null, 'WB213465', 'engine987', 'cha123456', 'something', 'HARDWELL', 'LA', '1234567890', 'No', null, null, null, 'No', 'No', null, null, null, null, 'LIC', 'lic123456', '1', 'jason', '1234567890', 'Millanpally', 'lic12345679', 'SILIGURI', '3', 'Siliguri', '5000', '1000', '2000', '2000', '0', '2019-01-29 11:38:46', '2019-01-29 11:38:46', 'Two Thousand Rupees  Only', '3', null);
INSERT INTO `challan` VALUES ('11', null, 'Newconsignment123', '2019-01-29', '1', 'Siliguri', '6', 'jaipur', null, null, null, 'WB213465', 'engine987', 'cha123456', 'something', 'HARDWELL', 'LA', '1234567890', 'No', null, null, null, 'No', 'No', null, null, null, null, 'LIC', 'lic123456', '1', 'jason', '1234567890', 'Millanpally', 'lic12345679', 'SILIGURI', '3', 'Siliguri', '5000', '1000', '2000', '2000', '0', '2019-01-29 11:40:31', '2019-01-29 11:40:31', 'Two Thousand Rupees  Only', '3', null);
INSERT INTO `challan` VALUES ('12', null, 'draco Meteor', '2019-02-06', '1', 'Siliguri', '1', 'Siliguri', null, null, null, 'Wb72p4632', 'engine987', 'cha123456', 'something', 'HARDWELL', 'LA', '1234567890', 'No', null, null, null, 'No', 'No', null, null, null, null, 'LIC', 'adsdasd', '1', 'jason', '1234567890', 'Millanpally', 'lic12345679', 'SILIGURI', '1', 'Patna', '5000', '1000', '1000', '3000', '0', '2019-02-06 10:17:04', '2019-02-06 10:17:04', 'Three Thousand Rupees  Only', '3', null);
INSERT INTO `challan` VALUES ('16', null, 'consignment1', '2019-02-02', '1', 'Siliguri', '2', 'Malbazar', null, null, null, 'WB213465', 'engine987', 'cha123456', 'something', 'HARDWELL', 'LA', '1234567890', 'No', null, null, null, 'No', 'No', null, null, null, null, 'LIC', 'asdjashd', '1', 'jason', '1234567890', 'Millanpally', 'lic12345679', 'SILIGURI', '3', 'Siliguri', '10000', '0', '1000', '9000', '0', '2019-02-06 10:50:22', '2019-02-06 10:50:22', 'Nine Thousand Rupees  Only', null, 'Jasoosk');

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
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of challan_child2
-- ----------------------------
INSERT INTO `challan_child2` VALUES ('30', '9', '3', 'P25896', '2019-01-19 08:33:52', '2019-01-19 08:33:52', '75', '250', '277');
INSERT INTO `challan_child2` VALUES ('31', '9', '4', 'prn123456789', '2019-01-19 08:33:52', '2019-01-19 08:33:52', '25', '500', '550');
INSERT INTO `challan_child2` VALUES ('32', '9', '7', 'con123456789', '2019-01-19 08:33:52', '2019-01-19 08:33:52', '25', '2', '2');
INSERT INTO `challan_child2` VALUES ('33', '11', '8', 'NewConsignment', '2019-01-29 11:40:31', '2019-01-29 11:40:31', '75', '7', '7');
INSERT INTO `challan_child2` VALUES ('34', '12', '3', 'P25896', '2019-02-06 10:17:04', '2019-02-06 10:17:04', '75', '250', '277');
INSERT INTO `challan_child2` VALUES ('37', '16', '10', 'consignment1', '2019-02-06 10:50:22', '2019-02-06 10:50:22', '50', '50', '50');

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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of challan_child3
-- ----------------------------
INSERT INTO `challan_child3` VALUES ('17', '9', '125', '752', '829', '2019-01-19 08:33:52', '2019-01-19 08:33:52');
INSERT INTO `challan_child3` VALUES ('18', '10', '75', '7', '7', '2019-01-29 11:38:46', '2019-01-29 11:38:46');
INSERT INTO `challan_child3` VALUES ('19', '11', '75', '7', '7', '2019-01-29 11:40:31', '2019-01-29 11:40:31');
INSERT INTO `challan_child3` VALUES ('20', '12', '75', '250', '277', '2019-02-06 10:17:04', '2019-02-06 10:17:04');
INSERT INTO `challan_child3` VALUES ('24', '16', '50', '50', '50', '2019-02-06 10:50:22', '2019-02-06 10:50:22');

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
  PRIMARY KEY (`id`),
  KEY `name` (`consignment_no`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of consignment
-- ----------------------------
INSERT INTO `consignment` VALUES ('3', 'P25896', '2018-11-25', 'Kumar2805', '', 'Siliguri', '', 'Siliguri', '', 'Patna', '', 'Prince', 'Jaosn', '', 'HSV', '1', 'Wb72p4632', '5000', '0', '2018-11-30 09:51:57', '2018-12-29 10:15:45');
INSERT INTO `consignment` VALUES ('4', 'prn123456789', '2018-12-02', 'Kumar2805', '3', 'Siliguri', '', 'Siliguri', '', 'Jaipur', '', 'Tracko', 'Drake', '', 'HSV', ' 1', 'Wb72p4632', '50000', '0', '2018-12-03 06:08:18', '2018-12-03 06:11:12');
INSERT INTO `consignment` VALUES ('5', 'newconsignment123', '2018-11-25', 'Kumar2805', '', 'CA', '', 'CA', '', 'LA', '', 'Logan', 'Jake', '', 'HSV', '1', 'Wb72p4632', '10000', '1', '2018-12-03 10:09:42', '2018-12-03 10:10:53');
INSERT INTO `consignment` VALUES ('7', 'con123456789', '2018-02-12', 'Kumar2805', '', 'Siliguri', '', 'Siliguri', '', 'Jaipur', '', 'Jaosn', 'Brody', '', '20wheeler', '1', 'WB213465', '1000', '0', '2018-12-22 07:05:25', '2018-12-29 10:04:09');
INSERT INTO `consignment` VALUES ('8', 'newConsignment', '2018-12-28', 'Kumar2805', '', 'Siliguri', '1', 'Siliguri', '', 'Malbazar', '', 'Jason', 'Brody', '', 'HSV2.0', '1', 'WB213465', '5000', '0', '2018-12-28 07:46:05', '2018-12-28 07:46:05');
INSERT INTO `consignment` VALUES ('10', 'consignment1', '2019-02-01', 'kumar2805', '', 'Siligruri', '', 'Siliguri', '', 'Malbazar', '1', 'Mr Kumar Suwami', 'Brody', '1', '20 wheeler', '1', 'WB213465', '10000', '0', '2019-02-02 06:23:19', '2019-02-02 06:23:19');

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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of consignment_child
-- ----------------------------
INSERT INTO `consignment_child` VALUES ('4', '3', '6999587', '2018-11-25', '5000', 'bill105', '2019-02-02', '2018-11-30 09:51:57', '2018-11-30 09:51:57');
INSERT INTO `consignment_child` VALUES ('5', '4', 'invoice987654', '2018-12-02', '50000', 'billofdec1', '2019-02-02', '2018-12-03 06:08:18', '2018-12-03 06:08:18');
INSERT INTO `consignment_child` VALUES ('6', '5', 'newInvoice', '2018-11-25', '10000', 'newbill', '2019-02-02', '2018-12-03 10:09:43', '2018-12-03 10:09:43');
INSERT INTO `consignment_child` VALUES ('8', '7', 'invoice987645', '2018-12-22', '1000', 'ada5464', '2018-05-02', '2018-12-22 07:05:25', '2018-12-22 07:05:25');
INSERT INTO `consignment_child` VALUES ('9', '8', 'invoice9876456', '2018-12-28', '5000', 'asdasdasd', '2018-12-30', '2018-12-28 07:46:05', '2018-12-28 07:46:05');
INSERT INTO `consignment_child` VALUES ('11', '10', 'invoice1', '2019-02-01', '10000', 'bill1', '2019-02-02', '2019-02-02 06:23:19', '2019-02-02 06:23:19');

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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of consignment_child2
-- ----------------------------
INSERT INTO `consignment_child2` VALUES ('6', '3', '1', 'JUICE BOTTLE', '25', 'nothing', '200', '225', 'something', '2018-11-30 09:51:57', '2018-11-30 09:51:57');
INSERT INTO `consignment_child2` VALUES ('7', '3', '2', 'MAZA BOTTLE', '50', 'wow', '50', '52', 'hello', '2018-11-30 09:51:57', '2018-11-30 09:51:57');
INSERT INTO `consignment_child2` VALUES ('8', '4', '1', 'JUICE BOTTLE', '25', 'nothing', '500', '550', 'wow', '2018-12-03 06:08:19', '2018-12-03 06:08:19');
INSERT INTO `consignment_child2` VALUES ('9', '5', '1', 'JUICE BOTTLE', '500', 'nothing', '500', '550', 'something', '2018-12-03 10:09:43', '2018-12-03 10:09:43');
INSERT INTO `consignment_child2` VALUES ('10', '5', '1', 'JUICE BOTTLE', '50', 'wow', '50', '52', 'hello', '2018-12-03 10:09:43', '2018-12-03 10:09:43');
INSERT INTO `consignment_child2` VALUES ('11', '5', '2', 'MAZA BOTTLE', '600', 'Hii', '600', '620', 'pprpp', '2018-12-03 10:09:43', '2018-12-03 10:09:43');
INSERT INTO `consignment_child2` VALUES ('12', '5', '2', 'MAZA BOTTLE', '56', 'asdhadskj', '56', '60', 'fiuygaysud', '2018-12-03 10:09:43', '2018-12-03 10:09:43');
INSERT INTO `consignment_child2` VALUES ('14', '7', '1', 'JUICE BOTTLE', '25', 'wow', '2', '2', 'asdasdda', '2018-12-22 07:05:25', '2018-12-22 07:05:25');
INSERT INTO `consignment_child2` VALUES ('15', '8', '1', 'JUICE BOTTLE', '25', 'wow', '2', '2', 'asdasdda', '2018-12-28 07:46:05', '2018-12-28 07:46:05');
INSERT INTO `consignment_child2` VALUES ('16', '8', '2', 'MAZA BOTTLE', '50', 'asddsa', '5', '5', 'dsahsdagjhd', '2018-12-28 07:46:05', '2018-12-28 07:46:05');
INSERT INTO `consignment_child2` VALUES ('17', '10', '1', 'JUICE BOTTLE', '50', 'discription1', '50', '50', 'remark1', '2019-02-02 06:23:19', '2019-02-02 06:23:19');

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of doctor
-- ----------------------------
INSERT INTO `doctor` VALUES ('4', 'Dr Narayan Paswan', 'Heart', '600', 'Male', '1985-03-10', '9832339909', '9832658988', '9892288528', 'paswan.narayan@gmail.com', 'Malbazar', '2018-08-01 18:48:49', '2018-08-01 18:50:09');

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of driver
-- ----------------------------
INSERT INTO `driver` VALUES ('1', 'jason', 'lic12345679', 'SILIGURI', 'Millanpally', '1234567890', '1234567890', 'jhkjahdskjhads', '2018-12-28 07:11:45', '2018-12-28 07:11:45');

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
INSERT INTO `driver_images` VALUES ('1', '1', 'front', 'back', '2018-12-28 07:11:46', '2018-12-28 07:11:46');

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
INSERT INTO `indent` VALUES ('5', 'IN0001', '2019-02-27', '1', 'pat205', '3', 'Siliguri', null, '1', 'Mr Kumar Suwami', '2', '2019-02-28', null, null, '1', 'JUICE BOTTLE', null, null, null, '0', '2019-02-27 07:38:17', '2019-02-27 07:38:17');
INSERT INTO `indent` VALUES ('6', 'IN0006', '2019-02-27', '2', 'gu887', '3', 'Siliguri', null, '2', 'ITC GREAT COMPANY', '2', '2019-02-28', null, null, '1', 'JUICE BOTTLE', null, null, null, '0', '2019-02-27 08:02:07', '2019-02-27 08:02:07');

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
  PRIMARY KEY (`id`),
  KEY `indent` (`indent_id`),
  CONSTRAINT `indent` FOREIGN KEY (`indent_id`) REFERENCES `indent` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of indent_child
-- ----------------------------
INSERT INTO `indent_child` VALUES ('1', '6', 'jaipur', '25', '20 wheeler', '2019-02-27 08:02:07', '2019-02-27 08:02:07', '1');
INSERT INTO `indent_child` VALUES ('2', '6', 'patna', '50', '20 wheeler', '2019-02-27 08:02:07', '2019-02-27 08:02:07', '1');

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
  `destination` varchar(255) DEFAULT NULL,
  `vehicle_type` varchar(255) DEFAULT NULL,
  `placement` varchar(255) DEFAULT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of indent_placement
-- ----------------------------

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of insurance
-- ----------------------------
INSERT INTO `insurance` VALUES ('1', 'LIC', '2018-07-18 06:50:19', '2018-07-18 06:50:19');
INSERT INTO `insurance` VALUES ('3', 'Hardwell Insurance with all kind of Value', '2018-12-12 11:57:44', '2018-12-12 11:57:44');

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
INSERT INTO `location` VALUES ('1', 'Siliguri', 'Darjeeling', 'West Bengal', '2018-07-18 06:45:02', '2018-07-18 06:45:02');
INSERT INTO `location` VALUES ('2', 'Malbazar', 'Jalpaiguri', 'west bengal', '2018-07-18 06:45:23', '2018-07-18 06:45:23');
INSERT INTO `location` VALUES ('6', 'jaipur', 'jaipur', 'rajasthan', '2018-12-26 09:13:01', '2018-12-26 09:13:01');
INSERT INTO `location` VALUES ('7', 'LA', 'L.A', 'California', '2018-12-26 11:06:10', '2018-12-26 11:06:10');

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of lorry
-- ----------------------------
INSERT INTO `lorry` VALUES ('1', 'WB213465', 'engine987', 'cha123456', 'something', 'HARDWELL', 'LA', '1234567890', '1234567890', '1234567890', 'HDPAN', 'HDGST', '5', 'Bank of India', 'ACOFHD', 'HDIFSC', '2018-12-22 06:17:10', '2018-12-22 06:17:10');

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
INSERT INTO `lorry_image` VALUES ('1', '1', 'WB21346515454594301_rc.png', 'WB21346515454594301_permit.jpg', 'WB21346515454594301_insurance.png', 'WB21346515454594301_fitness.jpg', 'WB21346515454594301_pan.jpg', '2018-12-22 11:47:10', '2018-12-22 06:17:10');

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
INSERT INTO `materialcategory` VALUES ('1', 'JUICE BOTTLE', '2018-07-18 06:55:38', '2018-07-18 06:55:38');
INSERT INTO `materialcategory` VALUES ('2', 'MAZA BOTTLE', '2018-07-18 06:55:49', '2018-07-18 06:55:49');

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
INSERT INTO `party` VALUES ('1', 'Mr Kumar Suwami', 'kumar2805', 'panno9869', 'gst7744', 'Hakimpara, Siliguri', '7764879504', '9865889588', '03562-58998', 'paswan.narayan@gmail.com', '2018-07-18 06:43:33', '2018-07-18 06:43:33');
INSERT INTO `party` VALUES ('2', 'ITC GREAT COMPANY', '44', '', '', 'Siliguri', '1234567890', '', '', '', '2019-01-21 05:25:26', '2019-01-21 05:25:26');

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of petrol_pump
-- ----------------------------
INSERT INTO `petrol_pump` VALUES ('3', 'HP petrol pump', 'Siliguri', '2019-01-03 09:57:41', '2019-01-03 09:57:41');
INSERT INTO `petrol_pump` VALUES ('5', 'Indian Petrol', 'Siliguri', '2019-01-03 10:23:39', '2019-01-03 10:23:39');

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of petrol_pump_record
-- ----------------------------
INSERT INTO `petrol_pump_record` VALUES ('1', '11', '3', '1000', '2019/01/29', '2019-01-29 11:40:31', '2019-01-29 11:40:31');
INSERT INTO `petrol_pump_record` VALUES ('2', '11', '3', '5000', '2019/01/29', '2019-01-29 17:54:52', '2019-01-29 00:00:00');
INSERT INTO `petrol_pump_record` VALUES ('3', '11', '3', '10000', '2019/01/30', '2019-01-30 12:27:53', '2019-01-30 12:27:59');
INSERT INTO `petrol_pump_record` VALUES ('4', '12', '5', '1000', '2019/02/02', '2019-02-02 06:12:51', '2019-02-02 06:12:51');
INSERT INTO `petrol_pump_record` VALUES ('5', '12', '3', '1000', '2019/02/06', '2019-02-06 10:17:04', '2019-02-06 10:17:04');

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of trucktype
-- ----------------------------
INSERT INTO `trucktype` VALUES ('1', '20 wheeler', '2018-07-18 06:50:03', '2018-07-18 06:50:03');

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'Koustav', 'koustav.ju@gmail.com', '$2y$10$n5k8JJVQQitVVj6fct.vreyK3IoZlWDyDChLBiFZebewqGE5Dv8.m', 'Admin', 'HYnSdLcdn4wj5wQgXpYuIrwOsYkYN9weeLhamDxCOs2ltghUpWRwM57KyuMf', '2016-12-24 21:01:00', '2018-01-09 07:26:06', 'siliguri', '8420843222', 'siliguri', null, null);
INSERT INTO `users` VALUES ('2', 'Narayan Paswan', 'paswan.narayan@gmail.com', '$2y$10$8qwbV/l1iws9atYykHI1k.T/47gDtXSua26YVjN2ODKniBnxBqWAm', 'Admin', 'gTya59Xgfp69IbTNbEnCRWGPBKIGxGzftyrYs1ufp89erJTxFmM8JTlZ2OJa', '2018-04-13 05:14:12', '2018-11-28 05:41:36', null, null, null, null, null);
INSERT INTO `users` VALUES ('4', 'Nawin Ji', 'nawinji@gmail.com', '$2y$10$rphrFMN6z3BHwVQspK/S4ueM2ZRSLAk2usmsnLbifZhVWPAA0xlkm', 'Admin', 'k0WmFIKsketO7PdE9g5tRQMEEUgZOVnQsdtchrO89cbhFnriPyoJmwwA5EZh', '2018-07-04 07:33:46', '2018-07-04 07:34:20', null, null, null, null, null);
INSERT INTO `users` VALUES ('5', 'Prince', 'prncsharma@gmail.com', '$2y$10$vxlVOoYnpHCECwJlpXn9Ce/a53vQtVQlp4RmQJ0T.sXnmGc2tqzqu', 'Admin', 'Uw4k3ROS0RliFPfryBxFu1eGZV5mSQnvFgjgL4svZZGRrLL27Ylu9FJWSwU5', '2018-11-23 06:29:04', '2018-11-27 05:55:16', null, null, null, null, null);
