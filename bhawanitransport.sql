/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : bhawanitransport

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2018-11-20 17:44:59
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of acknowledgement
-- ----------------------------
INSERT INTO `acknowledgement` VALUES ('7', '2', 'CN555', '2018-10-23', 'Malbazar', 'Siliguri', 'wb72p4632', 'PAN447', '2018-10-23', '12:18 PM', '2018-10-23', '12:18 PM', 'Rajkote', null, null, '74000.00', '2018-10-23 06:49:27', '2018-10-23 06:49:27');
INSERT INTO `acknowledgement` VALUES ('18', '3', 'CN8888', '2018-10-23', 'Siliguri', 'Malbazar', 'wb72p4632', '558', '2018-10-23', '2:02 PM', '2018-10-23', '2:02 PM', 'Rajkote', '2018-10-24', '2018-10-24', '4400.00', '2018-10-23 08:33:22', '2018-10-23 08:33:22');
INSERT INTO `acknowledgement` VALUES ('19', '4', '12', '2018-10-23', 'Siliguri', 'Siliguri', 'wb72p4632', '22598', '2018-10-23', '2:03 PM', '2018-10-23', '2:03 PM', 'Rajkote', '2018-10-23', '2018-10-23', '0.00', '2018-10-23 08:34:38', '2018-10-23 08:34:38');
INSERT INTO `acknowledgement` VALUES ('20', '20', '12', '2018-10-23', 'Siliguri', 'Siliguri', 'wb72p4632', '58555', '2018-10-23', '2:04 PM', '2018-10-23', '2:04 PM', 'Rajkote', '2018-10-23', '2018-10-23', '0.00', '2018-10-23 08:35:47', '2018-10-23 11:36:31');

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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of acknowledgement_child
-- ----------------------------
INSERT INTO `acknowledgement_child` VALUES ('6', '18', null, '1', '2', 'Yes', 'Damage', 'Current', '12', '13', '20', '2018-10-23 08:33:22', '2018-10-23 08:33:22');
INSERT INTO `acknowledgement_child` VALUES ('7', '19', null, '1', '2', 'Yes', 'Damage', 'Current', '10', '20', '10', '2018-10-23 08:34:38', '2018-10-23 08:34:38');
INSERT INTO `acknowledgement_child` VALUES ('8', '19', null, '3', '10', 'Yes', 'Damage', 'Current', '20', '30', '40', '2018-10-23 08:34:38', '2018-10-23 08:34:38');
INSERT INTO `acknowledgement_child` VALUES ('16', '20', null, '1', '2', 'Yes', 'Damage', 'Current', '10', '30', '10', '2018-10-23 11:36:31', '2018-10-23 11:36:31');

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
INSERT INTO `bank_name` VALUES ('5', 'Bank of India', '2018-05-25 06:06:31', '2018-05-25 06:06:31');
INSERT INTO `bank_name` VALUES ('6', 'Bank of Maharashtra', '2018-05-25 06:06:42', '2018-05-25 06:06:42');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of branch
-- ----------------------------
INSERT INTO `branch` VALUES ('1', 'Patna', 'Darbhanga', 'Bihar', 'pat205', '2018-07-18 06:46:27', '2018-07-18 06:46:27');
INSERT INTO `branch` VALUES ('2', 'Rajkote', 'raj', 'Gujrat', 'gu887', '2018-07-18 06:46:47', '2018-07-18 06:46:47');

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of broker
-- ----------------------------
INSERT INTO `broker` VALUES ('1', 'Mr Kuntal Ghosh', 'Romani para', 'pan no8877', '8958965559', '9899858859', '03563-55889', '2018-07-18 06:48:16', '2018-07-18 06:48:16');
INSERT INTO `broker` VALUES ('2', 'Ashis', 'Mal', null, null, null, null, '2018-09-25 10:15:10', '2018-09-25 10:15:10');
INSERT INTO `broker` VALUES ('3', 'aa', 'bbb', null, null, null, null, '2018-09-25 10:16:48', '2018-09-25 10:16:48');
INSERT INTO `broker` VALUES ('4', 'Mr Rakhal', 'Siliguri', null, null, null, null, '2018-09-25 10:17:23', '2018-09-25 10:17:23');
INSERT INTO `broker` VALUES ('5', 'bottle', 'malbazar', '', '7882889', '9828855', '54545454', '2018-09-25 10:20:05', '2018-09-25 10:20:05');

-- ----------------------------
-- Table structure for `challan`
-- ----------------------------
DROP TABLE IF EXISTS `challan`;
CREATE TABLE `challan` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `consignment_id` varchar(10) DEFAULT NULL,
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
  PRIMARY KEY (`id`),
  KEY `name` (`challan_no`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of challan
-- ----------------------------
INSERT INTO `challan` VALUES ('2', '3', 'CN555', '2018-07-18', '2', 'Malbazar', '1', 'Siliguri', 'CN555', '2018-07-18', 'Siliguri', 'wb72p4632', 'enginno588', 'chasisno889', 'make5588', 'Miss Sanam', 'Kathmandu', '8988899588', 'Yes', 'PAN447', 'MR DILKASH', 'Driver', 'Yes', 'Yes', '1', 'Mr Kuntal Ghosh', '8958965559', 'SLIPNO888', 'BAZAZ', 'POLICY444', '1', 'MR PALAS GHATAK', '9889988889', 'deshbandhu para siliguri', 'Licenseno4787', 'siliguri', '1', 'Patna', '78000', '500', '3500', '74000.00', '0', '2018-07-18 11:59:48', '2018-07-19 06:05:29');
INSERT INTO `challan` VALUES ('3', '4', 'CN8888', '2018-07-19', '1', 'Siliguri', '2', 'Malbazar', 'CN8888', '2018-07-18', 'Malbazar', 'wb72p4632', 'enginno588', 'chasisno889', 'make5588', 'Miss Sanam', 'Kathmandu', '8988899588', 'Yes', '558', 'Mr sujal', 'Broker', 'Yes', 'Yes', '1', 'Mr Kuntal Ghosh', '8958965559', '6999', 'BAZAZ', '25888', '1', 'MR PALAS GHATAK', '9889988889', 'deshbandhu para siliguri', 'Licenseno4787', 'siliguri', '1', 'Patna', '8500', '600', '3500', '4400.00', '0', '2018-07-19 07:35:27', '2018-07-19 07:35:27');
INSERT INTO `challan` VALUES ('4', '6', '12', '2018-03-12', '1', 'Siliguri', '', 'Siliguri', '12', '2018-07-25', 'Siliguri', 'wb72p4632', 'enginno588', 'chasisno889', 'make5588', 'Miss Sanam', 'Kathmandu', '8988899588', '', '', '', '', '', '', '5', 'bottle', '7882889', '', '', '', '', null, '', '', '', '', '', null, '', '', '', '0.00', '0', '2018-09-25 10:26:10', '2018-09-25 10:26:10');

-- ----------------------------
-- Table structure for `challan_child`
-- ----------------------------
DROP TABLE IF EXISTS `challan_child`;
CREATE TABLE `challan_child` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `challan_id` int(10) DEFAULT NULL,
  `package` varchar(255) DEFAULT NULL,
  `net_weight` varchar(255) DEFAULT NULL,
  `gross_weight` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `challan_id` (`challan_id`),
  CONSTRAINT `challan_child_ibfk_1` FOREIGN KEY (`challan_id`) REFERENCES `challan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of challan_child
-- ----------------------------
INSERT INTO `challan_child` VALUES ('5', '2', '256', '8888', '888', '2018-07-19 06:05:29', '2018-07-19 06:05:29');
INSERT INTO `challan_child` VALUES ('6', '2', '2588', '5588', '881', '2018-07-19 06:05:29', '2018-07-19 06:05:29');
INSERT INTO `challan_child` VALUES ('7', '3', '5888', '5588', '8888', '2018-07-19 07:35:28', '2018-07-19 07:35:28');
INSERT INTO `challan_child` VALUES ('8', '3', '8899', '2588', '5999', '2018-07-19 07:35:28', '2018-07-19 07:35:28');
INSERT INTO `challan_child` VALUES ('9', '4', 'Nice', '850', '350', '2018-09-25 10:26:10', '2018-09-25 10:26:10');
INSERT INTO `challan_child` VALUES ('10', '4', 'superb', '870', '661', '2018-09-25 10:26:10', '2018-09-25 10:26:10');

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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of consignment
-- ----------------------------
INSERT INTO `consignment` VALUES ('3', 'CN555', '2018-07-18', 'kumar2805', '2', 'Rajkote', '1', 'Siliguri', '1', 'Siliguri', '1', 'Mr Kumar Suwami', 'MR SUNIL DUTT', '1', '20 wheeler', '1', 'wb72p4632', '504', '1', '2018-07-18 07:28:43', '2018-07-18 11:59:48');
INSERT INTO `consignment` VALUES ('4', 'CN8888', '2018-07-18', 'kumar2805', '2', 'Rajkote', '1', 'Siliguri', '2', 'Malbazar', '1', 'Mr Kumar Suwami', 'MR SUDIR CHAURASIA', '1', '20 wheeler', '1', 'wb72p4632', '1254', '1', '2018-07-18 08:23:41', '2018-07-19 07:35:28');
INSERT INTO `consignment` VALUES ('5', '15', '2018-07-24', 'kumar2805', '2', 'Rajkote', '2', 'Malbazar', '2', 'Malbazar', '1', 'Mr Kumar Suwami', 'mr sanam rana', '1', '20 wheeler', '1', 'wb72p4632', '2255', '0', '2018-07-24 11:47:00', '2018-07-24 11:47:00');
INSERT INTO `consignment` VALUES ('6', '12', '2018-07-25', 'kumar2805', '1', 'Patna', '2', 'Malbazar', '1', 'Siliguri', '1', 'Mr Kumar Suwami', 'Mr Sunil Karmokar', '1', '20 wheeler', '1', 'wb72p4632', '510', '1', '2018-07-25 09:18:29', '2018-09-25 10:26:10');
INSERT INTO `consignment` VALUES ('7', '20125', '2018-07-12', 'kumar2805', '1', 'Patna', '1', 'Siliguri', '2', 'Malbazar', '1', 'Mr Kumar Suwami', 'Mr Ssonjay', '1', '20 wheeler', '1', 'wb72p4632', '125', '0', '2018-07-25 10:31:11', '2018-07-25 10:31:11');
INSERT INTO `consignment` VALUES ('8', 'con2018', '2018-09-18', 'kumar2805', '2', 'Rajkote', '1', 'Siliguri', '', 'Malbazar', '1', 'Mr Kumar Suwami', 'Mr R K Saha', '1', '20 wheeler', '1', 'wb72p4632', '250', '0', '2018-09-18 11:29:53', '2018-09-18 11:29:53');

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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of consignment_child
-- ----------------------------
INSERT INTO `consignment_child` VALUES ('3', '3', '1', '2018-07-18', '2558', '5888122', '2018-07-18', '2018-07-18 07:28:43', '2018-07-18 07:28:43');
INSERT INTO `consignment_child` VALUES ('4', '3', '2', '2018-07-18', '5888', '8858888', '2018-07-18', '2018-07-18 07:28:43', '2018-07-18 07:28:43');
INSERT INTO `consignment_child` VALUES ('5', '4', '1', '2018-07-18', '256', '588', '2018-07-18', '2018-07-18 08:23:41', '2018-07-18 08:23:41');
INSERT INTO `consignment_child` VALUES ('6', '4', '2', '2018-07-18', '998', '55999', '2018-07-18', '2018-07-18 08:23:41', '2018-07-18 08:23:41');
INSERT INTO `consignment_child` VALUES ('7', '5', '1255', '2018-07-24', '2255', '2125', '2018-07-24', '2018-07-24 11:47:00', '2018-07-24 11:47:00');
INSERT INTO `consignment_child` VALUES ('12', '7', '12', '2018-07-12', '125', '255', '2018-07-20', '2018-07-25 10:31:11', '2018-07-25 10:31:11');
INSERT INTO `consignment_child` VALUES ('13', '6', '1', '2018-07-25', '250', '25888', '2018-07-24', '2018-07-25 10:35:51', '2018-07-25 10:35:51');
INSERT INTO `consignment_child` VALUES ('14', '6', '2', '2018-07-25', '260', '8899', '2018-07-23', '2018-07-25 10:35:51', '2018-07-25 10:35:51');
INSERT INTO `consignment_child` VALUES ('15', '8', 'con2018', '2018-09-18', '250', '', '2018-09-20', '2018-09-18 11:29:53', '2018-09-18 11:29:53');

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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of consignment_child2
-- ----------------------------
INSERT INTO `consignment_child2` VALUES ('1', '3', '1', 'JUICE BOTTLE', '256', '5888', '8888', '888', 'GOOD', '2018-07-18 07:28:43', '2018-07-18 07:28:43');
INSERT INTO `consignment_child2` VALUES ('2', '3', '2', 'MAZA BOTTLE', '2588', 'VERY NICE', '5588', '881', 'SUPERB', '2018-07-18 07:28:43', '2018-07-18 07:28:43');
INSERT INTO `consignment_child2` VALUES ('3', '4', '1', 'JUICE BOTTLE', '5888', '98999', '5588', '8888', '8858', '2018-07-18 08:23:41', '2018-07-18 08:23:41');
INSERT INTO `consignment_child2` VALUES ('4', '4', '2', 'MAZA BOTTLE', '8899', '4588', '2588', '5999', '4788', '2018-07-18 08:23:41', '2018-07-18 08:23:41');
INSERT INTO `consignment_child2` VALUES ('5', '5', '2', 'MAZA BOTTLE', '225', 'good', 'nice', 'good', '11', '2018-07-24 11:47:00', '2018-07-24 11:47:00');
INSERT INTO `consignment_child2` VALUES ('10', '7', '1', 'JUICE BOTTLE', '1225', '255', '225', '588', '255', '2018-07-25 10:31:11', '2018-07-25 10:31:11');
INSERT INTO `consignment_child2` VALUES ('11', '6', '1', 'JUICE BOTTLE', 'Nice', 'Good', '850', '350', 'Good', '2018-07-25 10:35:51', '2018-07-25 10:35:51');
INSERT INTO `consignment_child2` VALUES ('12', '6', '2', 'MAZA BOTTLE', 'superb', 'nice', '870', '661', 'Very good', '2018-07-25 10:35:51', '2018-07-25 10:35:51');
INSERT INTO `consignment_child2` VALUES ('13', '8', '1', 'JUICE BOTTLE', '255', 'nice', '250', '250', 'Good', '2018-09-18 11:29:53', '2018-09-18 11:29:53');

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
INSERT INTO `driver` VALUES ('1', 'MR PALAS GHATAK', 'Licenseno4787', 'siliguri', 'deshbandhu para siliguri', '9889988889', '5888999565', '03563-55558', '2018-07-18 06:51:14', '2018-07-18 06:51:14');
INSERT INTO `driver` VALUES ('2', 'Mr Moloy Mazumdar', 'licen858', 'siliguri', 'Hakimpara Siliguri', '7889988885', '699985888', '03563-54885', '2018-07-18 11:30:44', '2018-07-18 11:30:44');
INSERT INTO `driver` VALUES ('3', 'DAS', '25255', null, null, null, null, null, '2018-09-25 08:22:24', '2018-09-25 08:22:24');
INSERT INTO `driver` VALUES ('4', 'Youth', 'wb12458', null, null, null, null, null, '2018-09-25 08:29:02', '2018-09-25 08:29:02');
INSERT INTO `driver` VALUES ('5', 'Bijay Singh Thakur', 'bijay208', 'Jalpaiguri', 'Malbazar', '7764879504', '03562-258858', '02555888555', '2018-09-25 09:43:34', '2018-09-25 09:43:34');

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of indent
-- ----------------------------
INSERT INTO `indent` VALUES ('2', 'IN0001', '2018-10-25', '1', 'pat205', '1', 'Patna', 'Patna', '1', 'Mr Kumar Suwami', 'kumar2805', '2018-10-25', '1', '20 wheeler', '1', 'JUICE BOTTLE', '20 tonnage', '30', 'per_tone', '1', '2018-10-25 07:53:26', '2018-10-25 07:59:00');
INSERT INTO `indent` VALUES ('3', 'IN0003', '2018-11-19', '1', 'pat205', '1', 'Patna', 'Patna', '1', 'Mr Kumar Suwami', 'kumar2805', '2018-11-19', '1', '20 wheeler', '1', 'JUICE BOTTLE', '10 tonnage', '50', 'per_tone', '1', '2018-11-19 11:42:42', '2018-11-20 10:53:07');

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of indent_placement
-- ----------------------------
INSERT INTO `indent_placement` VALUES ('1', '3', 'IN0003', '2018-11-20', 'Patna', 'Patna', '20 wheeler', 'place', '2', '10 tonnage', '50', 'per_tone', 'mr ram sarama', null, 'good', '2018-11-20 10:53:07', '2018-11-20 10:53:07');

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of insurance
-- ----------------------------
INSERT INTO `insurance` VALUES ('1', 'LIC', '2018-07-18 06:50:19', '2018-07-18 06:50:19');
INSERT INTO `insurance` VALUES ('2', 'BAZAZ', '2018-07-18 06:50:22', '2018-07-18 06:50:22');

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of location
-- ----------------------------
INSERT INTO `location` VALUES ('1', 'Siliguri', 'Darjeeling', 'West Bengal', '2018-07-18 06:45:02', '2018-07-18 06:45:02');
INSERT INTO `location` VALUES ('2', 'Malbazar', 'Jalpaiguri', 'west bengal', '2018-07-18 06:45:23', '2018-07-18 06:45:23');
INSERT INTO `location` VALUES ('3', 'aa', 'bb', 'cc', '2018-07-24 08:04:26', '2018-07-24 08:04:26');

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of lorry
-- ----------------------------
INSERT INTO `lorry` VALUES ('1', 'wb72p4632', 'enginno588', 'chasisno889', 'make5588', 'Miss Sanam', 'Kathmandu', '8988899588', '5588995589', '05623-235888', 'panno8788', 'gstno58875', '1', 'Allahabad Bank', 'ac144755788', 'ifsc2084', '2018-07-18 06:49:52', '2018-07-18 06:49:52');
INSERT INTO `lorry` VALUES ('2', 'wb73p4632', 'engine5555', 'chasis8855', 'make8888', 'miss rana', 'siliguri', '8800228', null, null, null, null, null, null, null, null, null, null);

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of party
-- ----------------------------
INSERT INTO `party` VALUES ('1', 'Mr Kumar Suwami', 'kumar2805', 'panno9869', 'gst7744', 'Hakimpara, Siliguri', '7764879504', '9865889588', '03562-58998', 'paswan.narayan@gmail.com', '2018-07-18 06:43:33', '2018-07-18 06:43:33');

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'Koustav', 'koustav.ju@gmail.com', '$2y$10$n5k8JJVQQitVVj6fct.vreyK3IoZlWDyDChLBiFZebewqGE5Dv8.m', 'Admin', 'HYnSdLcdn4wj5wQgXpYuIrwOsYkYN9weeLhamDxCOs2ltghUpWRwM57KyuMf', '2016-12-24 21:01:00', '2018-01-09 07:26:06', 'siliguri', '8420843222', 'siliguri', null, null);
INSERT INTO `users` VALUES ('2', 'Narayan Paswan', 'paswan.narayan@gmail.com', '$2y$10$8qwbV/l1iws9atYykHI1k.T/47gDtXSua26YVjN2ODKniBnxBqWAm', 'Admin', 'v9sqH2BMagIqPT0GFCzxEspfhtZsddwQdTOiTD8nOSP2ZbBSYv9Dhe3MrwOn', '2018-04-13 05:14:12', '2018-11-20 12:10:53', null, null, null, null, null);
INSERT INTO `users` VALUES ('4', 'Nawin Ji', 'nawinji@gmail.com', '$2y$10$rphrFMN6z3BHwVQspK/S4ueM2ZRSLAk2usmsnLbifZhVWPAA0xlkm', 'Admin', 'k0WmFIKsketO7PdE9g5tRQMEEUgZOVnQsdtchrO89cbhFnriPyoJmwwA5EZh', '2018-07-04 07:33:46', '2018-07-04 07:34:20', null, null, null, null, null);
