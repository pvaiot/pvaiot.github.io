/*
Navicat MySQL Data Transfer

Source Server         : MySql
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : ankitastudio

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2019-03-15 15:00:23
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `bank`
-- ----------------------------
DROP TABLE IF EXISTS `bank`;
CREATE TABLE `bank` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `unique_id` varchar(50) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `customer_id` bigint(20) unsigned DEFAULT NULL,
  `supplier_id` bigint(20) unsigned DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `amount` int(10) DEFAULT NULL,
  `status` varchar(12) DEFAULT NULL,
  `through` varchar(20) DEFAULT NULL,
  `bank_name` varchar(30) DEFAULT NULL,
  `cheque_no` varchar(60) DEFAULT NULL,
  `cheque_issue_date` varchar(20) DEFAULT NULL,
  `chuque_deposit_date` varchar(20) DEFAULT NULL,
  `fund_type` varchar(20) DEFAULT NULL,
  `transation_no` varchar(60) DEFAULT NULL,
  `transaction_date` varchar(20) DEFAULT NULL,
  `extra` varchar(5) DEFAULT NULL,
  `fix_date` date DEFAULT '2016-01-01',
  `purchase_id` varchar(10) DEFAULT NULL,
  `sale_id` varchar(10) DEFAULT NULL,
  `purchase_return_id` varchar(10) DEFAULT NULL,
  `sale_return_id` varchar(10) DEFAULT NULL,
  `receipt_id` int(11) DEFAULT NULL,
  `payment_id` int(11) DEFAULT NULL,
  `general_exp_id` int(11) DEFAULT NULL,
  `contra_id` varchar(10) DEFAULT NULL,
  `debit_not_id` varchar(10) DEFAULT NULL,
  `credit_not_id` varchar(10) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_id` (`customer_id`) USING BTREE,
  KEY `receipt_id` (`receipt_id`),
  KEY `supplier_id` (`supplier_id`),
  KEY `payment_id` (`payment_id`),
  KEY `general_exp_id` (`general_exp_id`),
  CONSTRAINT `bank_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `bank_ibfk_2` FOREIGN KEY (`receipt_id`) REFERENCES `receipts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `bank_ibfk_3` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `bank_ibfk_4` FOREIGN KEY (`payment_id`) REFERENCES `payments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `bank_ibfk_5` FOREIGN KEY (`general_exp_id`) REFERENCES `expenses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of bank
-- ----------------------------
INSERT INTO `bank` VALUES ('11', 'ADW/REC/18-19/0018', '2018-07-16', '3', null, 'Receipt', '540', null, 'fund', 'AXIS BANK', null, null, null, 'RTGS', '718002372', '16/07/2018', '+', '2016-01-01', null, null, null, null, '10', null, null, null, null, null, '2018-07-16 09:03:35', '2018-07-16 09:03:35');
INSERT INTO `bank` VALUES ('13', 'ADW/REC/18-19/0017', '2018-07-16', '3', null, 'Receipt', '400', null, 'cheque', 'SBI', '125414', '16/07/2018', '16/07/2018', null, null, null, '+', '2016-01-01', null, null, null, null, '9', null, null, null, null, null, '2018-07-16 09:15:16', '2018-07-16 09:15:16');
INSERT INTO `bank` VALUES ('15', 'ADW/REC/18-19/0016', '2018-07-16', '3', null, 'Receipt', '200', null, 'cheque', 'Bandhan bank', '111333', '16/07/2018', '16/07/2018', null, null, null, '+', '2016-01-01', null, null, null, null, '8', null, null, null, null, null, '2018-07-16 11:26:47', '2018-07-16 11:26:47');
INSERT INTO `bank` VALUES ('19', 'ADW/PAY/18-19/0040', '2018-07-17', null, '1', 'Payment', '1500', null, 'cheque', 'SBI', '005123', '16/07/2018', '17/07/2018', null, null, null, '-', '2016-01-01', null, null, null, null, null, '40', null, null, null, null, '2018-07-17 08:18:13', '2018-07-17 08:18:13');
INSERT INTO `bank` VALUES ('21', 'ADW/PAY/18-19/0041', '2018-07-17', null, '1', 'Payment', '2000', null, 'fund', 'ICICI BANK', null, null, null, 'NEFT', '120011563', '17/07/2018', '-', '2016-01-01', null, null, null, null, null, '41', null, null, null, null, '2018-07-17 08:29:32', '2018-07-17 08:29:32');
INSERT INTO `bank` VALUES ('31', 'ADW/GEN-EXP/18-19/0008', '2018-07-19', null, null, 'GeneralExpenses', '3000', null, 'cheque', 'HDFC', '00500', '10/07/2018', '19/07/2018', null, null, null, '-', '2016-01-01', null, null, null, null, null, null, '3104', null, null, null, '2018-07-19 11:00:54', '2018-07-19 11:00:54');
INSERT INTO `bank` VALUES ('32', 'ADW/GEN-EXP/18-19/0009', '2018-07-18', null, null, 'GeneralExpenses', '5000', null, 'fund', 'Yes Bank', null, null, null, 'RTGS', '718002372', '19/07/2018', '-', '2016-01-01', null, null, null, null, null, null, '3105', null, null, null, '2018-07-19 11:03:39', '2018-07-19 11:03:39');
INSERT INTO `bank` VALUES ('33', 'ADW/REC/18-19/0019', '2018-08-17', '2', null, 'Receipt', '1650', null, null, '', null, null, null, '', '', '', '+', '2016-01-01', null, null, null, null, '11', null, null, null, null, null, '2018-08-17 06:42:01', '2018-08-17 06:42:01');

-- ----------------------------
-- Table structure for `bill_session`
-- ----------------------------
DROP TABLE IF EXISTS `bill_session`;
CREATE TABLE `bill_session` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `session` varchar(7) DEFAULT NULL,
  `startDate` date DEFAULT NULL,
  `closeDate` date DEFAULT NULL,
  `bill` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of bill_session
-- ----------------------------

-- ----------------------------
-- Table structure for `brand`
-- ----------------------------
DROP TABLE IF EXISTS `brand`;
CREATE TABLE `brand` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `brand_name` varchar(255) DEFAULT NULL,
  `status` tinyint(3) unsigned DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `Brand_Name` (`brand_name`)
) ENGINE=InnoDB AUTO_INCREMENT=288 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of brand
-- ----------------------------
INSERT INTO `brand` VALUES ('1', '4*6 WF', '1', null, null);
INSERT INTO `brand` VALUES ('2', '5*7 WF', '1', null, null);
INSERT INTO `brand` VALUES ('3', '6*8 WF', '1', null, null);
INSERT INTO `brand` VALUES ('4', 'A4WF', '1', null, null);
INSERT INTO `brand` VALUES ('5', 'A3WF', '1', null, null);
INSERT INTO `brand` VALUES ('6', '12*18WF', '1', null, null);
INSERT INTO `brand` VALUES ('7', 'LAMINATION', '1', null, null);
INSERT INTO `brand` VALUES ('8', 'ST SNAP', '1', null, null);
INSERT INTO `brand` VALUES ('9', 'ST SNAP  RE', '1', null, null);
INSERT INTO `brand` VALUES ('12', 'ST SNAP RE', '1', null, null);
INSERT INTO `brand` VALUES ('13', 'L.PRINT', '1', null, null);
INSERT INTO `brand` VALUES ('15', 'PC MED PRINT', '1', null, null);
INSERT INTO `brand` VALUES ('16', '4*6 MED PRINT', '1', null, null);
INSERT INTO `brand` VALUES ('17', '5*7 MED PRINT ', '1', null, null);
INSERT INTO `brand` VALUES ('18', '6*8 MED PRINT ', '1', null, null);
INSERT INTO `brand` VALUES ('19', 'A4 MED PRINT ', '1', null, null);
INSERT INTO `brand` VALUES ('20', '10*12 MED PRINT ', '1', null, null);
INSERT INTO `brand` VALUES ('21', '12*15 MED PRINT ', '1', null, null);
INSERT INTO `brand` VALUES ('22', '12*18 MED PRINT ', '1', null, null);
INSERT INTO `brand` VALUES ('23', '13*20 MED PRINT ', '1', null, null);
INSERT INTO `brand` VALUES ('24', 'PC ST SNAP ', '1', null, null);
INSERT INTO `brand` VALUES ('25', '4*6 ST SNAP  ', '1', null, null);
INSERT INTO `brand` VALUES ('26', '5*7 ST SNAP  ', '1', null, null);
INSERT INTO `brand` VALUES ('27', '6*8 ST SNAP  ', '1', null, null);
INSERT INTO `brand` VALUES ('28', 'A4 ST SNAP  ', '1', null, null);
INSERT INTO `brand` VALUES ('29', '10*12 ST SNAP  ', '1', null, null);
INSERT INTO `brand` VALUES ('30', '12*15 ST SNAP  ', '1', null, null);
INSERT INTO `brand` VALUES ('31', '12*18 ST SNAP  ', '1', null, null);
INSERT INTO `brand` VALUES ('32', '13*20 ST SNAP  ', '1', null, null);
INSERT INTO `brand` VALUES ('33', 'PC ST SNAP RE', '1', null, null);
INSERT INTO `brand` VALUES ('34', '4*6 ST SNAP RE ', '1', null, null);
INSERT INTO `brand` VALUES ('35', '5*7 ST SNAP RE ', '1', null, null);
INSERT INTO `brand` VALUES ('36', '6*8 ST SNAP RE ', '1', null, null);
INSERT INTO `brand` VALUES ('37', 'A4 ST SNAP RE ', '1', null, null);
INSERT INTO `brand` VALUES ('38', '10*12 ST SNAP RE ', '1', null, null);
INSERT INTO `brand` VALUES ('39', '12*15 ST SNAP RE ', '1', null, null);
INSERT INTO `brand` VALUES ('40', '12*18 ST SNAP RE ', '1', null, null);
INSERT INTO `brand` VALUES ('41', '13*20 ST SNAP  RE', '1', null, null);
INSERT INTO `brand` VALUES ('42', '4*6', '1', null, null);
INSERT INTO `brand` VALUES ('43', 'A4', '1', null, null);
INSERT INTO `brand` VALUES ('44', 'WRITE ONLY', '1', null, null);
INSERT INTO `brand` VALUES ('45', 'WRITE WITH POUCH', '1', null, null);
INSERT INTO `brand` VALUES ('46', 'WRITE WITH J.BOX', '1', null, null);
INSERT INTO `brand` VALUES ('47', 'WRITE DOUBLE BLACK BOX', '1', null, null);
INSERT INTO `brand` VALUES ('48', 'COPY TO COPY', '1', null, null);
INSERT INTO `brand` VALUES ('49', 'DOC/PHOTO', '1', null, null);
INSERT INTO `brand` VALUES ('50', 'RESTORATION', '1', null, null);
INSERT INTO `brand` VALUES ('51', 'RESTORATION RE', '1', null, null);
INSERT INTO `brand` VALUES ('52', '4*6 RESTORATION', '1', null, null);
INSERT INTO `brand` VALUES ('53', '5*7 RESTORATION', '1', null, null);
INSERT INTO `brand` VALUES ('54', '6*8 RESTORATION', '1', null, null);
INSERT INTO `brand` VALUES ('55', 'A4 RESTORATION', '1', null, null);
INSERT INTO `brand` VALUES ('56', '10*12 RESTORATION', '1', null, null);
INSERT INTO `brand` VALUES ('57', '12*15 RESTORATION', '1', null, null);
INSERT INTO `brand` VALUES ('58', '12*18 RESTORATION', '1', null, null);
INSERT INTO `brand` VALUES ('59', 'SUBLIMATION', '1', null, null);
INSERT INTO `brand` VALUES ('60', 'A. CARD', '1', null, null);
INSERT INTO `brand` VALUES ('61', 'ONE SIDE', '1', null, null);
INSERT INTO `brand` VALUES ('62', 'SAPPHIRE', '1', null, null);
INSERT INTO `brand` VALUES ('63', '13*20', '1', null, null);
INSERT INTO `brand` VALUES ('64', 'IBL31', '1', null, null);
INSERT INTO `brand` VALUES ('65', 'IBL25', '1', null, null);
INSERT INTO `brand` VALUES ('66', 'IBL26', '1', null, null);
INSERT INTO `brand` VALUES ('67', 'IBL27', '1', null, null);
INSERT INTO `brand` VALUES ('68', 'IBL28', '1', null, null);
INSERT INTO `brand` VALUES ('69', 'IBL29', '1', null, null);
INSERT INTO `brand` VALUES ('70', 'IHBM54', '1', null, null);
INSERT INTO `brand` VALUES ('71', 'IHBM74', '1', null, null);
INSERT INTO `brand` VALUES ('72', 'IHBM96', '1', null, null);
INSERT INTO `brand` VALUES ('73', 'IHBM811', '1', null, null);
INSERT INTO `brand` VALUES ('74', 'IHBC54', '1', null, null);
INSERT INTO `brand` VALUES ('75', 'IHBC74', '1', null, null);
INSERT INTO `brand` VALUES ('76', 'IHBC96', '1', null, null);
INSERT INTO `brand` VALUES ('77', 'IHBC811', '1', null, null);
INSERT INTO `brand` VALUES ('78', 'IHBCA4', '1', null, null);
INSERT INTO `brand` VALUES ('79', 'NEW SW4 HEART', '1', null, null);
INSERT INTO `brand` VALUES ('80', 'OLD SW4 HEART', '1', null, null);
INSERT INTO `brand` VALUES ('81', 'IHBC-SQC1', '1', null, null);
INSERT INTO `brand` VALUES ('82', 'IHBC-SQC2', '1', null, null);
INSERT INTO `brand` VALUES ('83', 'IWCHB', '1', null, null);
INSERT INTO `brand` VALUES ('84', 'IHBWF', '1', null, null);
INSERT INTO `brand` VALUES ('85', 'IMCWF', '1', null, null);
INSERT INTO `brand` VALUES ('86', 'ISH1', '1', null, null);
INSERT INTO `brand` VALUES ('87', 'ISH2', '1', null, null);
INSERT INTO `brand` VALUES ('88', 'ISH3', '1', null, null);
INSERT INTO `brand` VALUES ('89', 'ISH4', '1', null, null);
INSERT INTO `brand` VALUES ('90', 'ISH5', '1', null, null);
INSERT INTO `brand` VALUES ('91', 'ISH6', '1', null, null);
INSERT INTO `brand` VALUES ('92', 'ISH8', '1', null, null);
INSERT INTO `brand` VALUES ('93', 'ISH9', '1', null, null);
INSERT INTO `brand` VALUES ('94', 'ISH10', '1', null, null);
INSERT INTO `brand` VALUES ('95', 'ISH11', '1', null, null);
INSERT INTO `brand` VALUES ('96', 'ISHA4', '1', null, null);
INSERT INTO `brand` VALUES ('97', 'WF44', '1', null, null);
INSERT INTO `brand` VALUES ('98', 'WF66', '1', null, null);
INSERT INTO `brand` VALUES ('99', 'WF68', '1', null, null);
INSERT INTO `brand` VALUES ('100', 'WF810', '1', null, null);
INSERT INTO `brand` VALUES ('101', 'WF812', '1', null, null);
INSERT INTO `brand` VALUES ('102', 'IRF44', '1', null, null);
INSERT INTO `brand` VALUES ('103', 'IRF66', '1', null, null);
INSERT INTO `brand` VALUES ('104', 'ICT JUTE66', '1', null, null);
INSERT INTO `brand` VALUES ('105', 'ICT JUTE810', '1', null, null);
INSERT INTO `brand` VALUES ('106', 'IES44', '1', null, null);
INSERT INTO `brand` VALUES ('107', 'IES66', '1', null, null);
INSERT INTO `brand` VALUES ('108', 'JB44', '1', null, null);
INSERT INTO `brand` VALUES ('109', 'JB66', '1', null, null);
INSERT INTO `brand` VALUES ('110', 'IBSJ-01', '1', null, null);
INSERT INTO `brand` VALUES ('111', 'IBXP7', '1', null, null);
INSERT INTO `brand` VALUES ('112', 'IBSJ-17', '1', null, null);
INSERT INTO `brand` VALUES ('113', 'IBSJ-03B', '1', null, null);
INSERT INTO `brand` VALUES ('114', 'IBSJ-03C', '1', null, null);
INSERT INTO `brand` VALUES ('115', 'IBXP-13', '1', null, null);
INSERT INTO `brand` VALUES ('116', 'W-2X3X6X6', '1', null, null);
INSERT INTO `brand` VALUES ('117', 'W-2X2X6X6', '1', null, null);
INSERT INTO `brand` VALUES ('118', 'W-4X3X6X6', '1', null, null);
INSERT INTO `brand` VALUES ('119', 'IMF66', '1', null, null);
INSERT INTO `brand` VALUES ('120', 'IMF68', '1', null, null);
INSERT INTO `brand` VALUES ('121', 'HM ROUND', '1', null, null);
INSERT INTO `brand` VALUES ('122', 'SW2', '1', null, null);
INSERT INTO `brand` VALUES ('123', 'ICSQ', '1', null, null);
INSERT INTO `brand` VALUES ('124', 'ICHS', '1', null, null);
INSERT INTO `brand` VALUES ('125', 'MUG W', '1', null, null);
INSERT INTO `brand` VALUES ('126', 'MUG CIHC GREEN', '1', null, null);
INSERT INTO `brand` VALUES ('127', 'MUG CIHC RED', '1', null, null);
INSERT INTO `brand` VALUES ('128', 'MUG CIHC YELLOW', '1', null, null);
INSERT INTO `brand` VALUES ('129', 'MUG CIHC MAROON', '1', null, null);
INSERT INTO `brand` VALUES ('130', 'MUG CIHC BLACK', '1', null, null);
INSERT INTO `brand` VALUES ('131', 'MUG CIHC BLUE', '1', null, null);
INSERT INTO `brand` VALUES ('132', 'MS BLACK', '1', null, null);
INSERT INTO `brand` VALUES ('133', 'MS YELLOW', '1', null, null);
INSERT INTO `brand` VALUES ('134', 'MUG METAL', '1', null, null);
INSERT INTO `brand` VALUES ('135', 'MUG POLLY', '1', null, null);
INSERT INTO `brand` VALUES ('136', 'MUG HEART H.I.', '1', null, null);
INSERT INTO `brand` VALUES ('137', 'MUG HEART OUT HANDLE', '1', null, null);
INSERT INTO `brand` VALUES ('138', 'MUG SILVER', '1', null, null);
INSERT INTO `brand` VALUES ('139', 'MUG GOLDEN', '1', null, null);
INSERT INTO `brand` VALUES ('140', 'MUG REDIUM', '1', null, null);
INSERT INTO `brand` VALUES ('141', 'MUG MAGIC', '1', null, null);
INSERT INTO `brand` VALUES ('142', 'MUG CI BLACK', '1', null, null);
INSERT INTO `brand` VALUES ('143', 'IHBKR 1', '1', null, null);
INSERT INTO `brand` VALUES ('144', 'IHBKR 2', '1', null, null);
INSERT INTO `brand` VALUES ('145', 'IHBKR 3', '1', null, null);
INSERT INTO `brand` VALUES ('146', 'IHBKR 4', '1', null, null);
INSERT INTO `brand` VALUES ('147', 'IHBKR 5', '1', null, null);
INSERT INTO `brand` VALUES ('148', 'AC HEART', '1', null, null);
INSERT INTO `brand` VALUES ('149', 'AC KITES', '1', null, null);
INSERT INTO `brand` VALUES ('150', 'AC HOUSE', '1', null, null);
INSERT INTO `brand` VALUES ('151', 'AC ROUND', '1', null, null);
INSERT INTO `brand` VALUES ('152', 'AC HEART TUMAR', '1', null, null);
INSERT INTO `brand` VALUES ('153', 'AC FLOWER', '1', null, null);
INSERT INTO `brand` VALUES ('154', 'AC SHIRT', '1', null, null);
INSERT INTO `brand` VALUES ('155', 'AC APPLE', '1', null, null);
INSERT INTO `brand` VALUES ('156', 'AC CAT', '1', null, null);
INSERT INTO `brand` VALUES ('157', 'AC HAXEL', '1', null, null);
INSERT INTO `brand` VALUES ('158', 'AC GUITAR', '1', null, null);
INSERT INTO `brand` VALUES ('159', 'AC OVAL', '1', null, null);
INSERT INTO `brand` VALUES ('160', 'AC ZIGZAG', '1', null, null);
INSERT INTO `brand` VALUES ('161', 'IBSK-2', '1', null, null);
INSERT INTO `brand` VALUES ('162', 'BOTH SIDE KEY RING', '1', null, null);
INSERT INTO `brand` VALUES ('163', '101 KEY RING', '1', null, null);
INSERT INTO `brand` VALUES ('164', '103 KEY RING', '1', null, null);
INSERT INTO `brand` VALUES ('165', 'IMP KEY RING', '1', null, null);
INSERT INTO `brand` VALUES ('166', 'T-SHIRT PINK S', '1', null, null);
INSERT INTO `brand` VALUES ('167', 'T-SHIRT PINK M', '1', null, null);
INSERT INTO `brand` VALUES ('168', 'T-SHIRT PINK L', '1', null, null);
INSERT INTO `brand` VALUES ('169', 'T-SHIRT PINK XL', '1', null, null);
INSERT INTO `brand` VALUES ('170', 'T-SHIRT BLUE L', '1', null, null);
INSERT INTO `brand` VALUES ('171', 'T-SHIRT BLUE M', '1', null, null);
INSERT INTO `brand` VALUES ('172', 'T-SHIRT BLUE  XL', '1', null, null);
INSERT INTO `brand` VALUES ('173', 'T-SHIRT WHITE L', '1', null, null);
INSERT INTO `brand` VALUES ('174', 'T-SHIRT WHITE M', '1', null, null);
INSERT INTO `brand` VALUES ('175', 'T-SHIRT WHITE XL', '1', null, null);
INSERT INTO `brand` VALUES ('176', 'T-SHIRT WHITE S', '1', null, null);
INSERT INTO `brand` VALUES ('177', 'T-SHIRT WHITE 26', '1', null, null);
INSERT INTO `brand` VALUES ('178', 'T-SHIRT YELLOW L', '1', null, null);
INSERT INTO `brand` VALUES ('179', 'T-SHIRT YELLOW XL', '1', null, null);
INSERT INTO `brand` VALUES ('180', 'T-SHIRT YELLOW M', '1', null, null);
INSERT INTO `brand` VALUES ('181', 'LOVE PHOTO FRAME ', '1', null, null);
INSERT INTO `brand` VALUES ('182', 'AC I LOVE YOU', '1', null, null);
INSERT INTO `brand` VALUES ('183', 'LOVE HARD BOARD', '1', null, null);
INSERT INTO `brand` VALUES ('184', 'AC LOVE CLOCK', '1', null, null);
INSERT INTO `brand` VALUES ('185', 'AC HAPPY BIRTHDAY', '1', null, null);
INSERT INTO `brand` VALUES ('186', 'AC BEST COUPLE', '1', null, null);
INSERT INTO `brand` VALUES ('187', 'AC ZIGZAG 96 CLOCK', '1', null, null);
INSERT INTO `brand` VALUES ('188', ' AC ZIGZAG 54 CLOCK', '1', null, null);
INSERT INTO `brand` VALUES ('189', 'AC ZIGZAG A4 CLOCK', '1', null, null);
INSERT INTO `brand` VALUES ('190', 'AC ZIGZAG 54 CLOCK', '1', null, null);
INSERT INTO `brand` VALUES ('191', 'AMB 75', '1', null, null);
INSERT INTO `brand` VALUES ('192', 'AC ZIGZAG 74', '1', null, null);
INSERT INTO `brand` VALUES ('193', 'METAL PLAT SMALL', '1', null, null);
INSERT INTO `brand` VALUES ('194', 'METAL PLAT BIG', '1', null, null);
INSERT INTO `brand` VALUES ('195', 'VIA', '1', null, null);
INSERT INTO `brand` VALUES ('196', 'STILL PHOTO', '1', null, null);
INSERT INTO `brand` VALUES ('197', 'ENVELOPE', '1', null, null);
INSERT INTO `brand` VALUES ('198', 'FRONT LIT', '1', null, null);
INSERT INTO `brand` VALUES ('199', 'FRONT LIT STAR', '1', null, null);
INSERT INTO `brand` VALUES ('200', 'FRONT LIT FINE', '1', null, null);
INSERT INTO `brand` VALUES ('201', 'BACK LIT', '1', null, null);
INSERT INTO `brand` VALUES ('202', 'BACK LIT ', '1', null, null);
INSERT INTO `brand` VALUES ('203', 'ECO SOLVENT', '1', null, null);
INSERT INTO `brand` VALUES ('204', 'ECO VINAIL', '1', null, null);
INSERT INTO `brand` VALUES ('205', 'GRAY BACK', '1', null, null);
INSERT INTO `brand` VALUES ('206', 'DESIGING', '1', null, null);
INSERT INTO `brand` VALUES ('207', 'PAPER PRINT', '1', null, null);
INSERT INTO `brand` VALUES ('208', 'FRAME A4', '1', null, null);
INSERT INTO `brand` VALUES ('209', 'BY PRDER', '1', null, null);
INSERT INTO `brand` VALUES ('210', 'MDF', '1', null, null);
INSERT INTO `brand` VALUES ('211', '24X34', '1', null, null);
INSERT INTO `brand` VALUES ('212', 'PHOTO', '1', null, null);
INSERT INTO `brand` VALUES ('213', 'VISITING CARD', '1', null, null);
INSERT INTO `brand` VALUES ('214', 'PLASTIC LAMI', '1', null, null);
INSERT INTO `brand` VALUES ('215', 'RBG801', '1', null, null);
INSERT INTO `brand` VALUES ('216', 'PRINT', '1', null, null);
INSERT INTO `brand` VALUES ('217', 'PC COPY TO COPY', '1', null, null);
INSERT INTO `brand` VALUES ('218', '4*6 COY TO COPY', '1', null, null);
INSERT INTO `brand` VALUES ('219', '5*7 COY TO COPY', '1', null, null);
INSERT INTO `brand` VALUES ('220', '6*8 COY TO COPY', '1', null, null);
INSERT INTO `brand` VALUES ('221', 'A4 COY TO COPY', '1', null, null);
INSERT INTO `brand` VALUES ('222', '4*6 COPY TO COPY', '1', null, null);
INSERT INTO `brand` VALUES ('223', '5*7 COPY TO COPY', '1', null, null);
INSERT INTO `brand` VALUES ('224', '6*8 COPY TO COPY', '1', null, null);
INSERT INTO `brand` VALUES ('225', 'A4 COPY TO COPY', '1', null, null);
INSERT INTO `brand` VALUES ('226', 'WF A4', '1', null, null);
INSERT INTO `brand` VALUES ('227', 'P/P TO  4*6', '1', null, null);
INSERT INTO `brand` VALUES ('228', ' P/P TO  4*6  RE', '1', null, null);
INSERT INTO `brand` VALUES ('229', 'PRINTER', '1', null, null);
INSERT INTO `brand` VALUES ('230', 'EPSON L1800', '1', null, null);
INSERT INTO `brand` VALUES ('231', 'PRINT MUG', '1', null, null);
INSERT INTO `brand` VALUES ('232', 'GS PRINT', '1', null, null);
INSERT INTO `brand` VALUES ('233', '224-01', '1', null, null);
INSERT INTO `brand` VALUES ('234', 'DOCUMENT PRINT', '1', null, null);
INSERT INTO `brand` VALUES ('235', '6*6 WF', '1', null, null);
INSERT INTO `brand` VALUES ('236', 'ISH1 BIG', '1', null, null);
INSERT INTO `brand` VALUES ('237', 'ISH2 SMALL', '1', null, null);
INSERT INTO `brand` VALUES ('238', 'AC HAPPY ANNIVERSARY', '1', null, null);
INSERT INTO `brand` VALUES ('239', 'TEFLON TEP', '1', null, null);
INSERT INTO `brand` VALUES ('240', 'LED 01', '1', null, null);
INSERT INTO `brand` VALUES ('241', 'LED 04', '1', null, null);
INSERT INTO `brand` VALUES ('242', 'LED PAPER', '1', null, null);
INSERT INTO `brand` VALUES ('243', 'MUG WP REDIUM', '1', null, null);
INSERT INTO `brand` VALUES ('244', 'ST. SNAP RE', '1', null, null);
INSERT INTO `brand` VALUES ('245', '4*6 RESTORATION RE', '1', null, null);
INSERT INTO `brand` VALUES ('246', '5*7 RESTORATION RE', '1', null, null);
INSERT INTO `brand` VALUES ('247', '6*8 RESTORATION RE', '1', null, null);
INSERT INTO `brand` VALUES ('248', 'A4 RESTORATION RE', '1', null, null);
INSERT INTO `brand` VALUES ('249', 'VIDEO', '1', null, null);
INSERT INTO `brand` VALUES ('250', 'INTERNET SECURITY', '1', null, null);
INSERT INTO `brand` VALUES ('251', 'BOTH SIDE ', '1', null, null);
INSERT INTO `brand` VALUES ('252', 'PER SQ. INC.', '1', null, null);
INSERT INTO `brand` VALUES ('253', 'NEGATIVE', '1', null, null);
INSERT INTO `brand` VALUES ('254', 'MUG WP RED', '1', null, null);
INSERT INTO `brand` VALUES ('255', 'MUG WP BLACK', '1', null, null);
INSERT INTO `brand` VALUES ('256', 'EDITING', '1', null, null);
INSERT INTO `brand` VALUES ('257', 'LED A4', '1', null, null);
INSERT INTO `brand` VALUES ('258', 'CHARGE', '1', null, null);
INSERT INTO `brand` VALUES ('259', '13*16', '1', null, null);
INSERT INTO `brand` VALUES ('260', '10*14', '1', null, null);
INSERT INTO `brand` VALUES ('261', 'INVITATION', '1', null, null);
INSERT INTO `brand` VALUES ('262', 'MUG ', '1', null, null);
INSERT INTO `brand` VALUES ('263', '11*13', '1', null, null);
INSERT INTO `brand` VALUES ('264', 'A3', '1', null, null);
INSERT INTO `brand` VALUES ('265', 'ALBUM', '1', null, null);
INSERT INTO `brand` VALUES ('266', 'A4 MOUNT', '1', null, null);
INSERT INTO `brand` VALUES ('267', 'A3 MOUNT', '1', null, null);
INSERT INTO `brand` VALUES ('268', 'VISITING CARD BOTH SIDE', '1', null, null);
INSERT INTO `brand` VALUES ('269', '12*20', '1', null, null);
INSERT INTO `brand` VALUES ('270', 'FRAME 12*18', '1', null, null);
INSERT INTO `brand` VALUES ('271', 'MLA4WF', '1', null, null);
INSERT INTO `brand` VALUES ('272', 'ML6*8WF', '1', null, null);
INSERT INTO `brand` VALUES ('273', 'ML5*7WF', '1', null, null);
INSERT INTO `brand` VALUES ('274', 'A4 WF', '1', null, null);
INSERT INTO `brand` VALUES ('275', '6*8 MOUNT LESS', '1', null, null);
INSERT INTO `brand` VALUES ('276', '6*8 MOUNT', '1', null, null);
INSERT INTO `brand` VALUES ('277', 'SMP 6*8', '1', null, null);
INSERT INTO `brand` VALUES ('278', 'MUG CIHC OUT HEART HANDEL ', '1', null, null);
INSERT INTO `brand` VALUES ('279', 'PAPER', '1', null, null);
INSERT INTO `brand` VALUES ('280', 'GLUE STICK', '1', null, null);
INSERT INTO `brand` VALUES ('281', 'CANVERA', '1', null, null);
INSERT INTO `brand` VALUES ('282', 'IBL03', '1', null, null);
INSERT INTO `brand` VALUES ('283', 'AC PHOTO FRAME', '1', null, null);
INSERT INTO `brand` VALUES ('284', 'IBL04', '1', null, null);
INSERT INTO `brand` VALUES ('285', 'IBL30', '1', null, null);
INSERT INTO `brand` VALUES ('286', 'ALBUM ', '1', null, null);
INSERT INTO `brand` VALUES ('287', 'DUMMY-BRAND', '1', null, null);

-- ----------------------------
-- Table structure for `brands`
-- ----------------------------
DROP TABLE IF EXISTS `brands`;
CREATE TABLE `brands` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `brand_name` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of brands
-- ----------------------------
INSERT INTO `brands` VALUES ('22', 'HP', '2018-05-08 18:32:50', '2018-05-08 18:32:50');
INSERT INTO `brands` VALUES ('23', 'DELL', '2018-05-08 18:33:06', '2018-05-08 18:33:06');
INSERT INTO `brands` VALUES ('24', 'LENEVO', '2018-05-08 18:33:22', '2018-05-08 18:33:22');
INSERT INTO `brands` VALUES ('25', 'ACER', '2018-05-08 18:33:40', '2018-05-08 18:33:40');
INSERT INTO `brands` VALUES ('26', 'INTEX', '2018-05-08 18:33:54', '2018-05-08 18:33:54');
INSERT INTO `brands` VALUES ('27', 'ZEBRONICS', '2018-05-08 18:34:07', '2018-05-08 18:34:07');
INSERT INTO `brands` VALUES ('28', 'INTEL', '2018-05-08 18:34:18', '2018-05-08 18:34:18');
INSERT INTO `brands` VALUES ('29', 'LAPCARE', '2018-05-08 18:34:33', '2018-05-08 18:34:33');
INSERT INTO `brands` VALUES ('30', 'ELNOVA', '2018-05-08 18:34:58', '2018-05-08 18:34:58');
INSERT INTO `brands` VALUES ('31', 'SUKAM', '2018-05-08 18:35:10', '2018-05-08 18:35:10');
INSERT INTO `brands` VALUES ('32', 'EXIDE', '2018-05-08 18:35:25', '2018-05-08 18:35:25');
INSERT INTO `brands` VALUES ('33', 'CP PLUS', '2018-05-08 18:35:46', '2018-05-08 18:35:46');
INSERT INTO `brands` VALUES ('34', 'SEAGATE', '2018-05-08 18:36:05', '2018-05-08 18:36:05');
INSERT INTO `brands` VALUES ('35', 'WD', '2018-05-08 18:36:16', '2018-05-08 18:36:16');
INSERT INTO `brands` VALUES ('36', 'TOSHIBA', '2018-05-08 18:36:41', '2018-05-08 18:36:41');
INSERT INTO `brands` VALUES ('37', 'CANON', '2018-05-08 18:37:19', '2018-05-08 18:37:19');
INSERT INTO `brands` VALUES ('38', 'BROTHER', '2018-05-08 18:38:18', '2018-05-08 18:38:18');
INSERT INTO `brands` VALUES ('39', 'EPSON', '2018-05-08 18:38:49', '2018-05-08 18:38:49');
INSERT INTO `brands` VALUES ('40', 'CIRCLE', '2018-05-08 18:39:29', '2018-05-08 18:39:29');
INSERT INTO `brands` VALUES ('41', 'FRONTECH', '2018-05-08 18:40:00', '2018-05-08 18:40:00');
INSERT INTO `brands` VALUES ('42', 'LG', '2018-05-08 18:40:56', '2018-05-08 18:40:56');
INSERT INTO `brands` VALUES ('43', 'SAMSUNG', '2018-05-08 18:41:12', '2018-05-08 18:41:12');
INSERT INTO `brands` VALUES ('44', 'BAJAJ', '2018-05-08 18:41:49', '2018-05-08 18:41:49');
INSERT INTO `brands` VALUES ('45', 'LOGITECH', '2018-05-08 18:42:39', '2018-05-08 18:42:39');
INSERT INTO `brands` VALUES ('46', 'SUPERCOMP', '2018-05-08 18:43:01', '2018-05-08 18:43:29');
INSERT INTO `brands` VALUES ('47', 'CONSISTENT', '2018-05-09 18:09:52', '2018-05-09 18:09:52');
INSERT INTO `brands` VALUES ('48', 'AVERTEK', '2018-05-09 18:10:02', '2018-05-09 18:10:02');
INSERT INTO `brands` VALUES ('49', 'NOT APPLCABLE', '2018-05-10 03:06:59', '2018-05-10 03:06:59');
INSERT INTO `brands` VALUES ('50', 'AOC', '2018-05-10 03:14:10', '2018-05-10 03:14:10');
INSERT INTO `brands` VALUES ('51', 'QUICK HEAL', '2018-05-10 03:18:47', '2018-05-10 03:18:47');
INSERT INTO `brands` VALUES ('52', 'ENTER', '2018-05-11 02:40:39', '2018-05-11 02:40:39');
INSERT INTO `brands` VALUES ('53', 'FOXIN', '2018-05-11 02:40:51', '2018-05-11 02:40:51');
INSERT INTO `brands` VALUES ('54', 'PRODOT', '2018-05-13 02:20:18', '2018-05-13 02:20:18');
INSERT INTO `brands` VALUES ('55', 'BLUESTREAK', '2018-05-13 02:35:45', '2018-05-13 02:35:45');
INSERT INTO `brands` VALUES ('56', 'SANDISK', '2018-05-13 02:37:42', '2018-05-13 02:37:42');
INSERT INTO `brands` VALUES ('57', 'SONY', '2018-05-13 02:37:50', '2018-05-13 02:37:50');
INSERT INTO `brands` VALUES ('58', 'SHARP', '2018-05-13 02:40:58', '2018-05-13 02:40:58');

-- ----------------------------
-- Table structure for `cash`
-- ----------------------------
DROP TABLE IF EXISTS `cash`;
CREATE TABLE `cash` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `unique_id` varchar(50) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `customer_id` bigint(20) unsigned DEFAULT NULL,
  `supplier_id` bigint(20) unsigned DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `amount` int(10) DEFAULT NULL,
  `status` varchar(12) DEFAULT NULL,
  `extra` varchar(5) DEFAULT NULL,
  `fix_date` date DEFAULT '2016-01-01',
  `purchase_id` varchar(10) DEFAULT NULL,
  `sale_id` varchar(10) DEFAULT NULL,
  `purchase_return_id` varchar(10) DEFAULT NULL,
  `sale_return_id` varchar(10) DEFAULT NULL,
  `receipt_id` int(11) DEFAULT NULL,
  `payment_id` int(11) DEFAULT NULL,
  `general_exp_id` int(11) DEFAULT NULL,
  `contra_id` varchar(10) DEFAULT NULL,
  `debit_not_id` varchar(10) DEFAULT NULL,
  `credit_not_id` varchar(10) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_id` (`customer_id`) USING BTREE,
  KEY `receipt_id` (`receipt_id`),
  KEY `supplier_id` (`supplier_id`),
  KEY `payment_id` (`payment_id`),
  KEY `general_exp_id` (`general_exp_id`),
  CONSTRAINT `cash_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cash_ibfk_2` FOREIGN KEY (`receipt_id`) REFERENCES `receipts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cash_ibfk_3` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cash_ibfk_4` FOREIGN KEY (`payment_id`) REFERENCES `payments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cash_ibfk_5` FOREIGN KEY (`general_exp_id`) REFERENCES `expenses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of cash
-- ----------------------------
INSERT INTO `cash` VALUES ('14', 'ADWS/5418/18-19', '2018-07-16', '3210', null, 'CashSale', '1400', null, '+', '2016-01-01', null, '23', null, null, null, null, null, null, null, null, '2018-07-16 05:49:24', '2018-07-16 05:49:24');
INSERT INTO `cash` VALUES ('32', 'ADW/PAY/18-19/0039', '2018-07-17', null, '1', 'Payment', '1700', null, '-', '2016-01-01', null, null, null, null, null, '39', null, null, null, null, '2018-07-17 08:15:33', '2018-07-17 08:15:33');
INSERT INTO `cash` VALUES ('33', 'ADW/PAY/18-19/0042', '2018-07-17', null, '1', 'Payment', '500', null, '-', '2016-01-01', null, null, null, null, null, '42', null, null, null, null, '2018-07-17 08:24:08', '2018-07-17 08:24:08');
INSERT INTO `cash` VALUES ('45', 'ADW/GEN-EXP/18-19/0010', '2018-07-18', null, null, 'GeneralExpenses', '200', null, '-', '2016-01-01', null, null, null, null, null, null, '3106', null, null, null, '2018-07-19 10:55:43', '2018-07-19 10:55:43');
INSERT INTO `cash` VALUES ('46', 'ADWS/5421/18-19', '2018-09-08', '3210', null, 'CashSale', '170', null, '+', '2016-01-01', null, '26', null, null, null, null, null, null, null, null, '2018-09-08 09:22:20', '2018-09-08 09:22:20');
INSERT INTO `cash` VALUES ('48', 'ADW/PAY/18-19/0043', '2018-11-10', null, '27', 'Payment', '1000', null, '-', '2016-01-01', null, null, null, null, null, '43', null, null, null, null, '2018-11-10 11:31:34', '2018-11-10 11:31:34');

-- ----------------------------
-- Table structure for `company`
-- ----------------------------
DROP TABLE IF EXISTS `company`;
CREATE TABLE `company` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `company_name` varchar(200) DEFAULT NULL,
  `street_1` varchar(100) DEFAULT NULL,
  `street_2` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `zip` varchar(15) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `mobile` varchar(100) DEFAULT NULL,
  `website` varchar(100) DEFAULT NULL,
  `logo` varchar(100) DEFAULT NULL,
  `gst_no` varchar(100) DEFAULT NULL,
  `billing_sale` varchar(50) DEFAULT NULL,
  `billing_purchase` varchar(50) DEFAULT NULL,
  `billing_sale_return` varchar(50) DEFAULT NULL,
  `billing_purchase_return` varchar(50) DEFAULT NULL,
  `billing_receipt` varchar(50) DEFAULT NULL,
  `billing_payment` varchar(50) DEFAULT NULL,
  `billing_debit_note` varchar(50) DEFAULT NULL,
  `billing_credit_note` varchar(50) DEFAULT NULL,
  `billing_contra` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `billing_retail` varchar(50) DEFAULT NULL,
  `billing_service` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of company
-- ----------------------------
INSERT INTO `company` VALUES ('1', 'Ankita Digital Works', 'Opposite Kadamtala Girls School', 'Kadamtala', 'Jalpaiguri', 'WEST BENGAL', '736146', 'support@ankitadigitalworks.com', '03561 225775', '9832329366', 'www.ankitadigitalworks.com', '', '', '', '', '', '', '', '', '', '', '', '2018-08-22 06:07:52', '2018-09-14 06:56:00', '', '');

-- ----------------------------
-- Table structure for `creditnotes`
-- ----------------------------
DROP TABLE IF EXISTS `creditnotes`;
CREATE TABLE `creditnotes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `unique_no` varchar(50) NOT NULL,
  `customer_id` int(10) unsigned NOT NULL,
  `billing_date` date DEFAULT NULL,
  `desc` blob,
  `narration` blob,
  `amount` varchar(10) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `total_outstanding` varchar(10) DEFAULT NULL,
  `paid_amount_input` varchar(10) DEFAULT NULL,
  `new_outstanding` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_id` (`customer_id`) USING BTREE,
  CONSTRAINT `creditnotes_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of creditnotes
-- ----------------------------

-- ----------------------------
-- Table structure for `creditnote_bill_session`
-- ----------------------------
DROP TABLE IF EXISTS `creditnote_bill_session`;
CREATE TABLE `creditnote_bill_session` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `session` varchar(7) DEFAULT NULL,
  `startDate` date DEFAULT NULL,
  `closeDate` date DEFAULT NULL,
  `bill` int(11) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of creditnote_bill_session
-- ----------------------------
INSERT INTO `creditnote_bill_session` VALUES ('1', '16-17', '2016-04-01', '2017-03-31', '0', null, '2017-04-03 11:29:33');
INSERT INTO `creditnote_bill_session` VALUES ('2', '17-18', '2017-04-01', '2018-03-31', '0', null, '2017-09-14 01:14:17');
INSERT INTO `creditnote_bill_session` VALUES ('3', '18-19', '2018-04-01', '2019-03-31', '0', null, null);
INSERT INTO `creditnote_bill_session` VALUES ('4', '19-20', '2019-04-01', '2020-03-31', '0', null, null);

-- ----------------------------
-- Table structure for `customer`
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `billing_name` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `mobile_number` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `Balance` varchar(255) DEFAULT '0',
  `status` tinyint(3) unsigned DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3214 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of customer
-- ----------------------------
INSERT INTO `customer` VALUES ('1', 'AVIJIT ROY', 'A.Roy', 'siliguri', '7001532456', 'avijit@gmail.com', '0', '1', '2018-06-04 11:40:38', '2018-06-04 06:10:38');
INSERT INTO `customer` VALUES ('2', 'SNEHANSU/AYUSH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3', 'BIPLAB PAUL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('4', 'SUBHAM SHARMA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('5', 'RAJNI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('6', 'SHSMIK SANYAL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('7', 'ASHIS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('8', 'TAPASH BASAK', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('9', 'SWAPAN MANORAMA', null, null, null, null, '4', '1', null, null);
INSERT INTO `customer` VALUES ('10', 'NO NAME', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('11', 'SHIBU DUTTA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('12', 'SHIBU DUTTA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('13', 'SHIBU DUTTA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('14', 'PRADIP DA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('15', 'PRIYANKA DAS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('16', 'SANJAY DAS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('17', 'KUNTAL BASU', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('18', 'KUNTAL BASU', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('19', 'MOUMITA SAHA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('20', 'AALIYA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('21', 'RACHANA CHAKRABORTY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('22', 'RUMKI DUTTA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('23', 'RIYA ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('24', 'SHIPRA MANDAL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('25', 'SUBHA SANKAR BANIK', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('26', 'ANUSHKA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('27', 'ANIRBAN', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('28', 'GOUTAM', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('29', 'ANJANA ROY', null, null, null, null, '10', '1', null, null);
INSERT INTO `customer` VALUES ('30', 'SURESH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('31', 'RAM GOPAL BHATTACHARJEE', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('32', 'KANTA GHOSH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('33', 'RABINDRA BARMAN', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('34', 'PRIYANKA MANDAL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('35', 'NUR ALAM', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('36', 'NANDA BENERJEE', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('37', 'ATANU SAHA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('38', 'RUCHI AGARWAL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('39', 'NILIMA DAS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('40', 'BISWAJIT DEY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('41', 'SATYAJIT ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('42', 'puchu', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('43', 'ashis roy', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('44', 'U BENERJEE', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('45', 'ABHIJIT GHOSH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('46', 'GITA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('47', 'MANIK GHOSH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('48', 'SHILPI BENERJEE', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('49', 'KOUSHAL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('50', 'SURAJIT GHOSH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('51', 'JAYDEB', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('52', 'SIDHU DA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('53', 'SUMAN ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('54', 'HIYA SAHA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('55', 'SONALI ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('56', 'SUBIR SARKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('57', 'NANDITA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('58', 'MOUMITA ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('59', 'SUBRATA MANDAL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('60', 'SURAJIT DAS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('61', 'PODDAR CAR WORLD PVT. LTD.', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('62', 'SWETA GUHA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('63', 'SANTOSH ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('64', 'KALI DAS PAUL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('65', 'A BARMAN', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('66', 'ARIJITA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('67', 'JOY DAS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('68', 'ZIPSY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('69', 'AMIT ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('70', 'TANUSHREE SARKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('71', 'SAHERA BANU', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('72', 'K C ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('73', 'GOUTAM LAMA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('74', 'CHANDANA CHOUDHURY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('75', 'S BENERJEE', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('76', 'APURBA ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('77', 'ANKITA BAGCHI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('78', 'MUSKAN RAM', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('79', 'SANKAR ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('80', 'NARAYAN DEY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('81', 'AMIT ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('82', 'PAMPA ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('83', 'HIMADRI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('84', 'MOUMITA BARMAN', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('85', 'SUROJIT DAS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('86', 'RAJ ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('87', 'SABITA DAS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('88', 'LATAGURI CARNIVAL 2017', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('89', 'SUSHRITI DUTTA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('90', 'KEYA BARMAN', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('91', 'ABDUL MOTALEB', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('92', 'SANCHITA ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('93', 'RANGE OFFICER, BELAKOBA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('94', 'HIMADRI ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('95', 'RANA DHAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('96', 'SUSHRUTI SARKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('97', 'MANCHAY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('98', 'MISTU', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('99', 'MALLIKA ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('100', 'DEBANJALI BHOWMICK', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('101', 'SUBRATA DA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('102', 'DOLA GUHA NEOGI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('103', 'ROBEN BARMAN', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('104', 'SUMI ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('105', 'RABI RAY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('107', 'ASHOK DAS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('108', 'DINESH PRASAD SAHA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('109', 'SANTANA GHOSH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('110', 'TIRTHA RAJ ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('111', 'MITHUN ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('112', 'ANO SARKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('113', 'MALINA CHAKRABORTY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('114', 'DEBASISH LAMINATION', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('115', 'BISWAJIT DA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('116', 'DIPAK SING', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('117', 'LAXMAN', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('118', 'PRATIVA DHAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('119', 'JHUMA DAS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('120', 'AKASH TELECOM', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('121', 'SONTU GHOSH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('122', 'RUPA PAUL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('123', 'PRATIK GHOSH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('124', 'PARAMITA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('125', 'PARAMITA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('126', 'PARAMITA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('127', 'PARAMITA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('128', 'RIYA KUNDU', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('129', 'MOHON HELA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('130', 'PARTHA BARMAN', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('131', 'RAJA PAUL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('132', 'PURBITA SARKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('133', 'NANDAN ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('134', 'ANKITA AK', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('135', 'MODERN IMPRESSION', 'MODERN IMPRESSION', 'GOMOSTO PARA', '9832092372', 'karchoudhurydebajit@gmail.com', '0.4', '1', null, null);
INSERT INTO `customer` VALUES ('136', 'GODAI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('137', 'KARTIK BARMAN', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('138', 'KARTIK BARMAN', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('139', 'HIMADRI ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('140', 'ARINDAM BAGCHI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('141', 'DHUBALATA ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('142', 'SIBABRATA CHAKRABOTI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('143', 'GOUTAM KANTI CHAKRABORTY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('144', 'KALU (ADITYA HELP LINE)', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('145', 'KHUSBU', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('146', 'BAPI ADHIKARY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('147', 'MUNNA ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('148', 'MUNNA ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('149', 'MUNNA LALA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('150', 'NILADRI ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('151', 'PRASANJIT  DUTTA ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('152', 'SANGHORCHIR CLUB AND PATHAGAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('153', 'MUNNI SWISS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('154', 'ANKITA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('155', 'NILINJANA ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('156', 'CHAND HELA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('157', 'MADHURIMA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('158', 'JEET JHA ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('159', 'MD RAGIB', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('160', 'KALAP RISHI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('161', 'CHANDERSWAR SEN', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('162', 'K L KUNDU', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('163', 'NILAJ GOPE', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('164', 'ARUNABHA CHAKRABORTY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('165', 'PAPPU', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('166', 'NADANITA ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('167', ' NABANITA ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('168', 'NABANITA', null, null, null, null, '0.8', '1', null, null);
INSERT INTO `customer` VALUES ('169', 'RUPAN SARKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('170', 'CHOTON ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('171', 'RAJIB CHAKRABORTY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('172', 'D SARKAR ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('173', 'ISHA ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('174', 'LATAGURI RESORT OWNERS ASSOCIATION', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('175', 'MITHU DA (MAYUR RESORT)', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('176', 'RESORT PASAKA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('177', 'DIBYENDU DA (PASHAKA)', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('178', 'SUBAI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('179', 'S SARKAR ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('180', 'SISHIR CHANDRA ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('181', 'MOHADEV CH GHOSH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('182', 'JENIA ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('183', 'HIMINE ROY ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('184', 'SACHIN DA ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('185', 'SANDIP GHOSH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('186', 'SHAMIK SANYAL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('187', 'NOBHONEIL GUHA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('188', 'NOBHONEIL GUHA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('189', 'SHUVADEEP GHOSH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('190', 'S GHOSH ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('191', 'POPI ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('192', 'SAGAR ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('193', 'AJAHR ALI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('194', 'SUNIL DA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('195', 'SAINT PAULs SCHOOL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('196', 'BAPAN ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('197', 'RATAN ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('198', 'UTTAM KR ROY ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('199', 'BABUSONA DAS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('200', 'SANKAR DUTTA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('201', 'SAMPA ROY ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('202', 'PUJA HELA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('203', 'SOUVIK DHAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('204', 'SUROVI DAS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('205', 'PUJA BOSE', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('206', 'AMITA ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('207', 'PUJA DEBNATH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('208', 'RANA ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('209', 'LAKSHMAN DAS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('210', 'AVIJIT DAS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('211', 'AVIJIT DAS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('212', 'AVIJIT DAS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('213', 'ANKITA BANIK', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('214', 'BANHI CHAUDHURI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('215', 'SUBHRA SAHA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('216', 'ROCKY GHOSH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('217', 'SATISH AGARWAL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('218', 'KUSUM RAOTH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('219', 'DIPAK HELA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('220', 'SURAJ SINGHANIA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('221', 'ALOK GUHA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('222', 'PIYUSH ROY SARKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('223', 'RANJIT KR MANDAL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('224', 'BAPPA ROY ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('225', 'BABU LAI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('226', 'PUJA KARMKAR ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('227', 'DOLI BARMAN ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('228', 'ROBI ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('229', 'MOUSUMI DEB', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('230', 'UTTARA CLUB', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('231', 'JUI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('232', 'TAPAN SARKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('233', 'BEAUTI BARMAN', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('234', 'RITA BARMAN ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('236', 'SUVAM ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('237', 'SOUMAN ROY ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('238', 'RUMA DAS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('239', 'BABAN DA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('240', 'BHARATI BARMAN', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('241', 'SHUKLA ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('242', 'BITTU GHOSH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('243', 'LISA SARKAR ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('244', 'SECRETARY ANUBHAB', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('245', 'C R GHOSE ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('246', 'TORA ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('247', 'TARIK', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('248', 'SANJU (PHOTOGRAPHER)', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('249', 'PRADIP CHANDA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('250', 'SOBHA DAS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('251', 'UTTAM BANIK', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('252', 'SHRABONI SUTRADHAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('253', 'RAMA SARKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('254', 'SUBHASHREE SEN ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('255', 'ANIK SAHA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('256', 'SWAPNA BISWAS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('257', 'K GUHA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('258', 'SUBAL DAS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('259', 'SANJU ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('260', 'SNEHA GHOSH ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('261', 'BISWADEEP CHAKRABORTY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('262', 'LALIT ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('263', 'koushik benerjee', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('264', 'JAYANTI  ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('265', 'VIM BISWAKARMA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('266', 'MANIK SARKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('267', 'SOMNATH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('268', 'ASHOK MAHATO', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('269', 'KALLYAN BASAK', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('270', 'SOURAV SAHA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('271', 'ANUPOM ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('272', '01 NO NAME', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('273', 'MANIK ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('274', 'ARCHISMITA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('275', 'DIBYENDU BHATTACHERJEE', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('276', 'RUMKI SARKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('277', 'DR SHARMILA GUPTA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('278', 'S BERA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('279', 'MANISHA SARKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('280', 'SUMITA SARKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('281', 'TAPASH MAMA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('282', 'RUPA  ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('283', 'SANGI LAMA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('284', 'MUPUR AMBOLI ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('285', 'SUBAL DEY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('286', 'SUBAL DEV', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('287', 'SUBAL DEV', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('288', 'MOTILAL ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('289', 'ANIRBAN SAHA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('290', 'SAMIR NEOGI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('291', 'MUNNA MAHATO', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('292', 'BIPLAB SARKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('293', 'BIPLAB SARKAR ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('294', 'BIJIT CHAKRABORTY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('295', 'SHRAMANA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('296', 'MITTU SARKAR ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('297', 'PUCHU SARKAR ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('298', 'BITHI  ROY ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('299', 'PINAKI DEY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('300', 'dhrubajyoti', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('301', 'SOMA DUTTA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('302', 'RAJU (ORCHID)', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('303', 'RAKTIM ROY BASUNIA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('304', 'PRANAB GHOSH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('305', 'GOPAL SAHA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('306', 'AKASHDEEP ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('307', 'PRASENJIT ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('308', 'LAXMI ROY (HOME)', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('309', 'GHANASHYAM BARMAN', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('310', 'SUKANNYA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('311', 'BHUPENDRA NATH BARMAN', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('312', 'MALA HELA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('313', 'SANKHA CHAKRABORTY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('314', 'SANJAY DA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('315', 'KOYEL KARMAKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('316', 'DIPANKAR CHOUDHURY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('317', 'SHUBHANKAR MITRA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('318', 'KALYAN BASAK', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('319', 'ROMYANI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('320', 'RIDHI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('321', 'BINA MADAM', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('322', 'TUMPA PRADHAN', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('323', 'INDRAJIT PAUL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('324', 'SHAYERI ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('325', 'HITESH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('326', 'MANDAR MUKHERJEE', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('327', 'MANDAR MUKHERJEE', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('328', 'MANDAR MUKHERJEE', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('329', 'bhanu sarkar', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('330', 'RIMPA ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('331', 'SINJINI ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('332', 'UTSO', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('333', 'SRAYASEE ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('334', 'SAIBAL SARKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('335', 'AISHWIN KUMAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('336', 'GOURAV ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('337', 'SABJAY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('338', 'S. DEY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('339', 'SUBHRAJIT LODH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('340', 'ADITA CHAKRABORTY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('341', 'SHAYANTAN CHAKARABORTY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('342', 'RANJIT DAS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('343', 'KRISHANU ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('344', 'ARUN BANIK', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('345', 'U  BHATTACHARJEE', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('346', 'SUBHASISH BOSE', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('347', 'PARICHAY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('348', 'D CHETTERJEE', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('349', 'TANMAY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('350', 'MANAB MITRA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('351', 'KAMALENDU', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('352', 'SATAVISHA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('353', 'PARTHA DAS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('354', 'PANKAJ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('355', 'ANITRA ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('356', 'JAYOSHREE ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('357', 'JYOTI RAY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('358', 'BIPLAB ADHIKARY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('359', 'REKHA DEY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('360', 'KHUSI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('361', 'PRASHANTA ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('362', 'PRITAM BARMAN', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('363', 'TANIYA SARKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('364', 'ABHIJIT BHATTACHARJEE', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('365', 'TUMPA ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('366', 'TANAYA SENGUPTA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('367', 'ANAMIKA MISHRA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('368', 'KAR AUTOMOBILES', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('369', 'SIDDHARTHA KAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('370', 'SUBHRA DI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('371', 'BABITA ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('372', 'SUNANDA SINHA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('373', 'PRITHA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('374', 'LAXMI DAS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('375', 'PRATIMA ROUTH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('376', 'ASHIM ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('377', 'NARU GOPAL DEY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('378', 'KOUSHIK SARKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('379', 'RESHMI SARKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('380', 'KALYAN TANTRA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('381', 'SOHAM MUKHERJEE', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('382', 'SANDIPAN DA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('383', 'KISHAN MAHESHWARI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('384', 'SUBRATA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('385', 'SUSHMITA ROUTH ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('386', 'SANKAR MAJUMDER', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('387', 'MOUSONA PAUL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('388', 'PAPIYA PAUL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('389', 'SANJOY ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('390', 'SAMATA BISWAS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('391', 'ARGHADEEP ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('392', 'CHANAKYA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('393', 'BAPPA SARKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('394', 'PUJA ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('395', 'PUJA ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('396', 'PUJA ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('397', 'RHYTYM', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('398', 'SUCHISMITA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('399', 'PRASENJIT ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('400', 'ANIKET CHAKRABORTY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('401', 'RAJANYA RAHA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('402', 'BITANSA ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('403', 'MRINAL SARKAR ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('404', 'SATYAPADA ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('405', 'CHANCHAL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('406', 'ANKITA KUNDU', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('407', 'PRASENJIT MITRA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('408', 'IMTIYAJ ALI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('409', 'BARNA ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('410', 'DEBABRATA MAJUMDAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('411', 'DADA BHAI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('412', 'AKASH GHOSH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('413', 'anindita', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('414', 'SUBHANKAR ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('415', 'J GHOSH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('416', 'SEKHAR BISWAS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('417', 'SAGNIK CHAKRABORTY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('418', 'DONA ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('419', 'SUBHAMAY DUTTA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('420', 'SUDIPTA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('421', 'JAYANTA CHAKRABORTY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('422', 'ALPI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('423', 'PRIYA BISWAS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('424', 'GOURI GHOSH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('425', 'SECERETARY DISTRICT LIBRERY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('426', 'UNA DEY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('427', 'TUSHITA CHOUDHURY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('428', 'SUBHAJIT DUTTA  ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('429', 'SHIBANI ROY ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('430', 'PANKAJ SAHANI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('431', 'KUSHUM ROUTH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('432', 'ANIRUDDHA SARKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('433', 'JAYDEEP MITRA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('434', 'SANDIP ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('435', 'PUJA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('436', 'PUJA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('437', 'BIRJU DAS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('438', 'S C ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('439', 'MEDHA AGARWAL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('440', 'AJAY DEY SARKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('441', 'MAHENDRA AGARWAL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('442', 'BIBEK SARKAR ', null, null, null, null, '200', '1', null, null);
INSERT INTO `customer` VALUES ('443', 'TANISHA ROY ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('444', 'jJAYANTA MAJUMDER', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('445', 'JAYANTA MAJUMDER', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('446', 'ASHOK  KUMAR ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('447', 'MOU DAS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('448', 'BILASH ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('449', 'KONIKA ROY ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('450', 'MONTASH BORMAN', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('451', 'DEBANJAN ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('452', 'RAHUL MAHATO ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('453', 'JAMIRUL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('454', 'PRADIP GHOSH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('455', 'SATYAJIT ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('456', 'RAJA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('457', 'PRALAY KR BRAHNA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('458', 'ABDUL CHHATTAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('459', 'SUJATA  ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('460', 'MONAI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('461', 'RIYA RANA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('462', 'SHYAMAL DA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('463', '  HAMIDRI  MOULICK', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('464', 'RISHITA PAUL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('465', 'SUKLA ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('466', 'APARNA ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('467', 'MD MAINUL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('468', 'BABUL SARKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('469', 'SANJAY ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('470', 'DHIRITI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('471', 'ASHIM ROY CHOUDHURY  ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('472', 'NIRBYOLEEK DAS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('473', 'ELLO', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('474', 'RAJIB BARMAN', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('475', 'SUKANTA KHANRA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('476', 'NABANITA DAY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('477', 'PARTHA DEY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('478', 'PARTHA DEY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('479', 'PARTHA DEY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('480', 'BISWANATH DAS ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('481', 'A C DAS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('482', 'ASHIT GHOSH ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('483', 'ANUP ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('484', 'DEASISH ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('485', 'SHREYASI PAUL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('486', 'MOUSUMI ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('487', 'LIPI BARMAN', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('488', 'ANIKET DAS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('489', 'ROOPJIT SHOP', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('490', 'SANGHASREE CLUB AND PATHAGAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('491', 'SUDIP SAHA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('492', 'SANCHALI DAS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('493', 'MOUSUMI GHOSH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('494', 'RIDDHIMAN ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('495', 'BIPRASH DA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('496', 'MOLLIKA DAS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('497', 'SUSHIL MONDAL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('498', 'SOUGATA ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('499', 'SOMNATH ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('500', 'RAHUL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('501', 'ASIT GHOSH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('502', 'AMIRUL HOQUE', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('503', 'MUNNA ALAM', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('504', 'MADHUSUDAN KARMAKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('505', 'ARPAN ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('506', 'KARAN RAM', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('507', 'MONIKA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('508', 'BITAN DAS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('509', 'ULEN ROY ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('510', 'DIPANKAR ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('511', 'HRISHI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('512', 'SHARLI HORE', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('513', 'MOLOY SEN', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('514', 'PAMPA BARMAN ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('515', 'JOJO DA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('516', 'DEBASISH CHAKRABORTY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('517', 'SUDEB ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('518', 'ASHMITA BISWAS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('519', 'KATTIK BARMAN ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('520', 'MALI CHOKRABORTY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('521', 'GOUTAM BASAK', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('522', 'MD JUYEL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('523', 'PANKAJ DEY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('524', 'JOY MUKHARJEE', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('525', 'SHIV', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('526', 'SANJU DA ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('527', 'BISWAJIT SARKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('528', 'ASHAK ROY ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('529', 'SANCHITA PAUL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('530', 'RAKASH DAS ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('531', 'NABENDU DA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('532', 'SANJAY SHILL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('533', 'SULENDRA MAHATO', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('534', 'SAMIR SARKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('535', 'UDYAN', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('536', 'SUKARNA ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('537', 'BIRSHTI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('538', 'RAJU ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('539', 'SAHELI ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('540', 'MAMPI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('541', 'PAPPU SAHA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('542', 'SOHINI GHOSH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('543', 'TATAI (PHOTO)', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('544', 'RAHIMA PRAMANIK', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('545', 'JOLI SARKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('546', 'RAMESH KUMAR ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('547', 'PIU SARKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('548', 'KRISHNA HELA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('549', 'MANTOSH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('550', 'MOUTRISHA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('551', 'INDRANIL DAS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('552', 'SWAPNA ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('553', 'RANJIT SARKAR ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('554', 'PINTU ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('555', 'ARPITA CHAKRABORTY  ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('556', 'SAMPA DEY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('557', 'SANCHITA BISWAS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('558', 'MANAB MOHANTA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('559', 'ABHIJIT PAUL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('560', 'SOUVIK SARKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('561', 'JOYITA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('562', 'BISWANATH PAUL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('563', 'BISWA JIT MAMA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('564', 'PRASANTA ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('565', 'SOMA SARKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('566', 'SONA SARKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('567', 'K K ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('568', 'SATHI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('569', 'RIYA MAJUMDAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('570', 'RAYA MAJUMDAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('571', 'PRADIP KANODIA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('572', 'SHREYASHI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('573', 'LIPIKA DUTTA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('574', 'ABHI ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('575', 'RANJAN ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('576', 'SUSHILA ROY ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('577', ' SUKARNA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('578', 'RATAN SARKAR ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('579', 'TUMPA SARKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('580', 'ASHIM BISWAS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('581', 'PRAFULLA ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('582', 'TRIDIB GUM', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('583', 'KUNTI GUPTA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('584', 'IPARW', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('585', 'S DEY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('586', 'SOHEL RANA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('587', 'RAI ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('588', 'B  CHAKRABORTY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('589', 'SANDIP DA ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('590', ' RANJANA ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('591', 'SUBHANKAR GHOSH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('592', 'SRIKANTA ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('593', 'KOBITA ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('594', 'SOUMEN ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('595', 'PANKAJ ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('596', 'Q', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('597', 'SUSHIL MAHATO', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('598', 'DIPALI BARMAN', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('599', 'PRIYANKA DUTTA ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('600', 'DEBASISH DAS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('601', 'SANGITA ACCADEMY', null, null, null, null, '20', '1', null, null);
INSERT INTO `customer` VALUES ('602', 'GITASHREE SEN', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('603', 'SANDIPAN ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('604', 'SANJOY ROUTH ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('605', 'MONIKA DAS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('606', 'PAROMITA RAHA DUTTA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('607', 'BAPPA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('608', 'RITESH ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('609', 'POCKY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('610', 'POCKY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('611', 'JOYDIP ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('612', 'S CHANDA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('613', 'CHUMKI ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('614', 'LABONI NANDI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('615', 'DIPIKA ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('616', 'SWAPAN SAHA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('617', 'MAHABI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('618', 'PRIYANKA ROUTH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('619', 'DIPAM CHAKRABORTY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('620', 'DEBASISH DAS  ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('621', 'BISWAJIT DAS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('622', 'AJIT MONDAL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('623', 'MADHURIMA DAS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('624', 'RAJESH ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('625', 'DEBANJANA ROY BHADRA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('626', 'DIPANKAR DAS GUPTA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('627', 'MADHUMITA ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('628', 'SUVRA DA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('629', 'SUVRA DA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('630', 'SUVRA DA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('631', 'K. D. ADHIKARY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('632', 'HERALAL SAHU', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('633', 'SUBHADEEP', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('634', 'ADSR JALPAIGURI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('635', 'SANCHITA DAS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('636', 'NABINA MAJUMDER', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('637', 'HARIDAS ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('638', 'SWAPNA ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('639', 'DEBARGHA SARKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('640', 'SUNITA ROUTH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('641', 'BHASWATI ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('642', 'ANANYA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('643', 'SAYANTAN GHOSH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('644', 'SHANTANU MAJUMDER', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('645', 'S MAJUMDAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('646', 'SAMARESH BERA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('647', 'CHANDAN ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('648', 'SUCHANDRA ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('649', 'RINKU AGARWAL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('650', 'TINKU', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('651', 'Tapanjyoti Raha', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('652', 'GITASHREE SEN ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('653', 'GANESH CH ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('654', 'NILRATAN BANIK', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('655', 'SWAGATAM', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('656', 'DIPABALI DI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('657', 'PRADHAN CHANGRABANDHA  GP', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('658', 'SUOURAV', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('659', 'SOURAV', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('660', 'T GHOSH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('661', 'SOUVIK DEBNATH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('662', 'S BASU', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('663', 'SUBHANKAR BHOWMIK', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('664', 'SUBHANKAR BHOWMIK', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('665', 'DEEPANJALI DUTTA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('666', 'PAYEL CHOUDHURY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('667', 'CHANDAN GHOSH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('668', 'JOY DA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('669', 'SALU ROUTH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('670', 'LIPIKA ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('671', 'PINKI ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('672', 'RAJU PATOWARY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('673', 'KRIPA BARMAN', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('674', 'ABHIPRIYA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('675', 'SANKHYA PRIYA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('676', 'SUNIL MAHATO', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('677', 'RUMA ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('678', 'SREYASI ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('679', 'MITALI ROY ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('680', 'SHUVADIP', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('681', 'DAYAL BARMAN', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('682', 'SEFALI MAHATO', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('683', 'GOPAL DUTTA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('684', 'SUBAJIT', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('685', 'SUBRATA BASAK', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('686', 'MANAB SARKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('687', 'GITA SAHA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('688', 'SANCHITA ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('689', 'LAKSHMI ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('690', 'MANOJ JAIN', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('691', 'SHAYMAL ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('692', 'ANIDIPTO GHOSH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('693', 'sukarna chakraborty', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('694', 'TAMALI CHAKI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('695', 'TINKU DAS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('696', 'SUSANTA ROY ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('697', 'SUBHAM ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('698', 'MITHU ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('699', 'SUNIL KAKA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('700', 'SAHELI  DI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('701', 'SARITA ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('702', 'NIMAI DAS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('703', 'SATYAJIT GHOSH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('704', 'SURAJIT BAGCHI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('705', 'RANJIT ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('706', 'RITA DAS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('707', 'CHHAYA CHOUDHURY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('708', 'SUMAN CHAKRABORTY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('709', 'SUDIP ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('710', 'CHITRALEKHA SINHA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('711', ' APARNA ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('712', 'AAYUSH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('713', 'SANCHARI SEN', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('714', 'JUTHIKA  ADHIKARY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('715', 'BIJAYA GAIKWDA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('716', 'RAJESH ROY ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('717', 'BAPI KARMAKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('718', 'RIYA SARKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('719', 'MRINAL DAS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('720', 'THAKUR DAS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('721', 'SUKANYA SARKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('722', 'BISWAJIT BARMAN', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('723', 'ARUP DAS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('724', 'SANJAY BASAK', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('725', 'NILANJANA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('726', 'SRIPARNA DEY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('727', 'PRIYANKA ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('728', 'DEBA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('729', 'BURI ROUTH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('730', 'JOY DA ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('731', 'BIMAL ROY ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('732', 'SANGITA SEN', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('733', 'MALAY KARMAKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('734', 'SUCHITRA ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('735', 'SANTA GHOSH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('736', 'BABLU', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('737', 'PALLOBI DEY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('738', 'RAJA DEY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('739', 'GOBINDA BAROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('740', 'SUMAN CHAKI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('741', 'NIBIR DAS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('742', 'BABAI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('743', 'SUBHASIS SARKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('744', 'NOVEL ART', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('745', 'BACHCHAN DA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('746', 'DEBNAGAR KUMUDINI HIGH SCHOOL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('747', 'RAKHO HARI ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('748', 'SWAPAN KR DEY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('749', 'SURAJIT BAGCHI  ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('750', 'S CHAKRABORTY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('751', 'ANKITA DEBNATH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('752', 'ANKITA DEBNATH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('753', 'SUBHANKAR CHAKRABORTY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('754', 'SUDIPTA PAUL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('755', 'BABILA BARDHAN CHOUDHURY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('756', 'RIMPA DAS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('757', 'SUPRIYA CHAKRABORTY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('758', 'S BHOUMICK', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('759', 'PAWAN KUMAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('760', 'MOUTUSY KARMAKAR ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('761', 'MANNA  DA ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('762', 'KRISHNA ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('763', 'MOUSAM DA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('764', 'KUHELI SARKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('765', 'BISHAKHA ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('766', 'BABAI DA ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('767', 'GUPIN SARKAR  ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('768', 'AQUATIC JALPAIGURI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('769', 'TANIMA CHANDA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('770', 'SAHELI  SAHA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('771', 'PINUT NATH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('772', 'MOUMITA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('773', 'PRATIMA ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('774', 'ANITA SAHA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('775', 'ADRIJA GHOSH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('776', 'RABI BARMON', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('777', 'BABAI GHOSH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('778', 'SUBHADRA ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('779', 'CHANDAN SARKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('780', 'RUMA SARKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('781', 'MOUSUMI SARKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('782', 'KARISHMA ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('783', 'SAMBHU HELA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('784', 'BIKASH MAJUMDER', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('785', 'SIKHA CHAKRABORTY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('786', 'RANJAN BARMAN', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('787', 'SUBHADIP ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('788', 'URMILA SHA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('789', 'KHUSI SINGHANIA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('790', 'SATYAJIT DEB', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('791', 'MODAN DAS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('792', 'ROHIT DAS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('793', 'MANOJ KUMAR BISWAS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('794', 'MUNNA SAHA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('795', 'KRISHNA DA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('796', 'BHUNITA SARKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('797', 'HEMANTA MANDAL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('798', 'KRISHNA SHIL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('799', 'SONA ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('800', 'BIKASH CH ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('801', 'MOUMITA GHOSH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('802', 'SUJAY TARAFDER', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('803', 'BANDHANA CHAKRABORTY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('804', 'PYUSH PODDAR ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('805', 'PINKU', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('806', 'DIPANKAR DAS GUPTA ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('807', 'SANKAR DA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('808', 'BHAGYASHREE', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('809', 'APURBA DEY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('810', 'ANIKET MODAK', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('811', 'CHAITALI KUNDU', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('812', 'AMINUL HOSSAIN', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('813', 'SAIKAT CHAKI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('814', 'A.C. TRAINING COLLEGE ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('815', 'DHARANI RAY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('816', 'ARINDAM BAKSHI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('817', 'P MITRA ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('818', 'DAEBASRITA BENARJEE', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('819', 'MANISH CHANDA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('820', 'RATHINDRANATH ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('821', 'PARTHA BISWAS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('822', 'SANSANGHAMITRA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('823', 'POPY ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('824', 'JHARNA CHAKRABORTY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('825', 'TITAS PAUL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('826', 'SAMBHAV SENGUPTA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('827', 'RAKHI BARMAN', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('828', 'PALLABI SARKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('829', 'KUNTALA BHOWMICK', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('830', 'SOUMILI MANDAL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('831', 'DEBASRITA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('832', 'PRANAB DUTTA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('833', 'GOPAL BARMAN ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('834', 'MUN MUN BARMAN', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('835', 'RAHUL PASWAN', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('836', 'SHYAMALI SAHA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('837', 'DIPANWITA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('838', 'BHASKAR DAS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('839', 'S BAKSHI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('840', 'SATHI SWANIRVAR GOSTHI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('841', 'NAYAN', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('842', 'BINA ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('843', 'SROBONA SARKAR ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('844', 'JUI ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('845', 'SIMA DAS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('846', 'KOUSHIK ACHARYYA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('847', 'MAYUKH DA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('848', 'MS. I. DUTTA (ALIPURDUAR)', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('849', 'SURJALI ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('850', 'SWETA SARKHEL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('851', 'SAJAL DAS ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('852', 'PALASH ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('853', 'BABU DA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('854', 'A CHAKI DAS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('855', 'M K DASGUPTA ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('856', 'KAMALESH CHAKRABORTY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('857', 'RANJANA ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('858', 'MALA RAY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('859', 'DEBASISH DUTTA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('860', 'MOUMITA CHANDA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('861', 'SWAPAN SARKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('862', 'PRADIP KUMAR GHOSH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('863', 'PUJA CHAKRABORTY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('864', 'LMB', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('865', 'HENA KHATUN', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('866', 'BIKASH ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('867', 'SNIGDHA DAS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('868', 'TUMPI  ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('869', 'KOUSHIK ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('870', 'ASHOK PAUL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('871', 'PRIYANKA GOPE', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('872', 'DESHBANDHU NAGAR H S SCHOOL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('873', 'G NANDI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('874', 'DESHBANDHU NAGAR 1NO R R SCHOOL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('875', 'DIPANKAR MANDAL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('876', 'MANOJIT MISHRA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('877', 'PAROMITA BASAK MANDAL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('878', 'SUMAN ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('879', 'K NARAYAN ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('880', 'SWAPAN KUMAR DAS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('881', 'ANISHA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('882', 'SHOVAN', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('883', 'BHOLA DA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('884', 'KAMALIKA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('885', 'MIMI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('886', 'BABU ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('887', 'KABITA DAS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('888', 'PARIKSHIT', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('889', 'RAJU ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('890', 'RAJA DA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('891', 'BIDYUT GHOSH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('892', 'SHIROPA MALLIK', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('893', 'D DUTTA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('894', 'P SARKAR ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('895', 'SUNIL DA UNIQUE COLECTION ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('896', 'SUBHANKAR SAHA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('897', 'PUTUL MANNA ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('898', 'NISHA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('899', 'DEBASMITA ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('900', 'SOUNAK PAUL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('901', 'DHARAJ ROY ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('902', 'M BHATTACHARJEE`', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('903', 'ANINDITA BARMAN ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('904', 'SUBRATA BASU ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('905', ' SOUGATA DHAR ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('906', 'RANA DEY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('907', 'SOMA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('908', 'MUNMUN ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('909', 'SOMA KARMAKAR ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('910', 'AMOL ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('911', 'ANITA MANDAL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('912', 'SATABDI CHOUDHURI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('913', 'SUBHA DASGUPTA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('914', 'MALA ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('915', 'BHASWATI SENGUPTA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('916', 'SUSHMITA ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('917', 'GOURI BELA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('918', 'SUNITI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('919', 'MUNNA DA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('920', 'RAKESH MANDAL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('921', 'GIURIYA SHA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('922', 'CHUMKI BHATTACHARJYA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('923', 'RISHITA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('924', 'PAPIYA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('925', 'PRASANTA DAS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('926', 'A RAHAMAN', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('927', 'NADU SARKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('928', 'DHONI KANTA SARKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('929', 'UMA DI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('930', 'DIPANKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('931', 'SUPRIYO ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('932', 'TRITIYA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('933', 'DHRUBA DA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('934', 'DIPAK', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('935', 'KOUSHIK DA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('936', 'DINEH PRASAD', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('937', 'SWARNAPALLI SELF HELP GROUP', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('938', 'RAJDEEP', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('939', 'JYOTIRMOYEE SARMA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('940', 'SUBHAJIT SAHA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('942', 'ARPITA BANERJEE', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('943', 'DIPANWITA ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('944', 'SUSIL SEAL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('945', 'PARAMITA SARKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('946', 'MANAB ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('947', 'CHANCHAL CHANDA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('948', 'MOMIT MAHAMMAD  ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('949', 'SIMA SARKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('950', 'BIVHAS MANDAL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('951', 'SUMIT GHOSH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('952', 'NANKI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('953', 'PARVIN BEGAM', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('954', 'KAILASH ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('955', 'SAMUDRA GHOSAL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('956', 'NIRMALA DAS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('957', 'JAYASHREE BARMAN ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('958', 'SANCHITA KUNDU', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('959', 'BUDDHIMAN CHHETRI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('960', 'SUBHASHREE  DI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('961', 'ALO ADHIKARY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('962', 'KRISHNENEDU ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('963', 'SUDIPTA MITRA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('964', 'TEPASH DADGUPTA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('965', 'GOPA SHARMA ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('966', 'KABERI SINGHA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('967', 'SWAPAN DEBA BARMAN', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('968', 'SAYANI DI ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('969', 'NIEC', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('970', 'PROSANTA KR ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('971', 'chandradeep ghosh', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('972', 'RAJ KARMAKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('973', 'UTTAM DEY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('974', 'ANJALI KAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('975', 'SUSHMITA LAMA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('976', 'TAPATI SEN', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('977', 'RATNADEEP SHONE', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('978', 'PRITAM DAS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('979', 'SUJIT SUTRADHAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('980', 'RAJESH DA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('981', 'NIL ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('982', 'DIPAK KUMAR ROUTH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('983', 'SOUVIK', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('984', 'TRITHABRATA   ADHIKARY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('985', 'SOUVIK SOME', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('986', ' DIPAK DA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('987', 'SAYANTANI BHADRA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('988', 'RANA ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('989', 'NAZARUL ISLAM', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('990', 'SHROYETA ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('991', 'BITTU', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('992', 'SHIBRAJ BARMAN', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('993', 'ANUSHKA ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('994', 'UTTAM KR PAUL ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('995', 'PAPU', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('996', 'SHIULI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('997', 'SUBARNA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('998', 'B KARMAKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('999', 'SOUMYASREE GHOSH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1000', 'ANJANA SARKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1001', 'PURNAJIT ROY ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1002', 'SUBHADIP SAHA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1003', 'SUKUMAR SAHA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1004', 'DIPAYANI GHOSH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1005', 'TAPOSH BARMAN', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1006', 'MOUMITA ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1007', 'SOUGATA DHAR ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1008', 'UTTAM KR GHOSH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1009', 'SANGITA ROY ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1010', 'RUCHIKA KUNDU', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1011', 'JITU', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1012', 'NORTH BENGAL AGRO S.C.', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1013', 'BABLU DA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1014', 'SOMBHU HELA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1015', 'SANJIB (MALKANI)', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1016', 'SABINA PRAMANIK', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1017', 'SC ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1018', 'SHALU BASAK', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1019', 'IVY SAHA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1020', 'TIRTHA BRATA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1021', 'SHUKANTALA BARMAN', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1022', 'BISWANATH  MAHATO', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1023', 'PULAK ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1024', 'SHADOOW', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1025', 'SAIKAT BARMA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1026', 'JOLY BARMAN', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1027', 'SPANDAN SENGUPTA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1028', 'DONA KHATUN ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1029', 'DIPIKA SARKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1030', 'MANAS KUMAR ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1031', 'PUKI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1032', 'AYELITA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1033', 'AJOY CHAKRABORTY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1034', 'NO NAME ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1035', 'LITAN SARKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1036', 'RUMPA GHOSH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1037', 'SUBAL ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1038', 'CHANDRIMA GHOSAHAL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1039', 'TULSI DEY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1040', 'MOUMITA CHANDRA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1041', 'BITTU ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1042', 'PANCHANAN ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1043', 'SANJAY ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1044', 'BIKASENDU SHIL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1045', 'RAJIB PARIK', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1046', 'MUNMUN ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1047', 'SRIJAN MONDAL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1048', 'KAJAL ROY ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1049', 'DIPU ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1050', 'BAPI ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1051', 'GOURI DEY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1052', 'GOURI ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1053', 'RAJU HELA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1054', 'ANGAN SARKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1055', 'BISWAJIT ROY ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1056', 'PIYALI DHAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1057', 'NANDITA BARMAN', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1058', 'P S KARMAKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1059', 'SUPARNA ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1060', 'SANKAR KAKU', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1061', 'COMMITMENT', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1062', 'IPSHITA PAL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1063', 'PRASANNA NAGAR POST OFFICE', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1064', 'POULAMI ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1065', 'SRIPIN', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1066', 'RAJU DA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1067', 'SANKHA SUBHRA GHOSH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1068', 'SUBIR ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1069', 'SHUBHAM AGARWAL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1070', 'DEBAJIT BHOWMIK', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1071', 'ADITI BISWAS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1072', 'PARTHA SAHA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1073', 'TUMPA GHOSH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1074', 'RANI HELA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1075', 'PANCHALI GHOSH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1076', 'SAMIR ROUTH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1077', 'SULAGNA GHOSH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1078', 'HIMADRI GOSWAMI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1079', 'pPRAKASH ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1080', 'DHRUBAJYOTI DAS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1081', 'MANTI ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1082', 'PRITAM CHOUDHURY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1083', 'PURNA ROUTH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1084', 'KING KAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1085', 'MANTU SARKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1086', 'SANKHAPRIYA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1087', 'BISHNU SEN', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1088', 'PANDIT JI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1089', 'RIYA ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1090', 'SHAWON', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1091', 'JISHNA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1092', 'TAPAK BARMAN', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1093', 'UNIQUE COLLCETION', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1094', 'PARATISTHA  AMBOLI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1095', 'SAIBAL DA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1096', 'ABHIJIT', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1097', 'DALIYA BARMAN', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1098', 'PAYEL SARKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1099', ' R ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1100', 'R ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1101', 'SURAJ CHATRI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1102', 'GOBINDA GHOSH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1103', 'GOBINDA GHOSH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1104', 'NANDINI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1105', 'ARABINDA DEY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1106', 'TRIPTI CHAKRABORTY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1107', 'ARIJITA DI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1108', 'SAMPA SARKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1109', 'BIJAN BISWAS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1110', 'SHARLI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1111', 'NETAI SARKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1112', 'TAPAS DA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1113', 'N SARKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1114', 'SUBHA  DA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1115', 'SUBIR NANDI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1116', 'RANJEET', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1117', 'SAMARJIT GHOSH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1118', 'SAMPAD HELA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1119', 'PINKU ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1120', 'SUBHASISH BHATTACHARJEE', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1121', 'DEBABRATA ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1122', 'SISHU NIKETAN PRIMARY SCHOOL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1123', 'DIPIKA JHA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1124', 'DIPA LAMA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1125', 'SRUTI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1126', 'SATHI  DUTTA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1127', 'NIHARIKA BARMAN', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1128', 'DIBAKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1129', 'TANIYA SEAL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1130', 'ASHIM BARMAN', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1131', 'RANJIT CHAKRABOR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1132', 'SUNIL GHOSH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1133', 'CDD SOCIETY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1134', ' SAHINA BANU ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1135', 'PRANJAL BINANI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1136', 'BAISALI PAUL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1137', 'PINTU SARKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1138', 'CHOTAI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1139', 'ARCHITA DEB', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1140', 'ASHIK', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1141', 'POUSHALI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1142', 'PAPAI ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1143', 'FANIBHUSAN', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1144', 'SANGITA ROUTH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1145', 'SAMVAB', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1146', 'P DUTTA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1147', 'GOURAV  GHOSH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1148', 'JITNA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1149', 'TILAK', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1150', 'SANKHYAPRIYA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1151', 'SANJAY CHETTRI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1152', 'AYUSH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1153', 'RUDRADIP CHOUDHURY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1154', 'JILI PAUL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1155', 'ARUN GHOSH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1156', 'SIMA ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1157', 'SUBHAJIT', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1158', 'ALOK', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1159', 'ISHIKA ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1160', 'SEFALI ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1161', 'RINKU ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1162', 'MONI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1163', 'RUDRANI DUTTA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1164', 'ABHISHEK SEN', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1165', 'RUPALI ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1166', 'BONIRAN DAS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1167', 'BONIRAN DAS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1168', 'ARTI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1169', 'PARTHA SARKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1170', 'KUNAL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1171', 'PANGAS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1172', 'RATHIN NATH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1173', 'BISWAJIT', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1174', 'MOUMITA SARKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1175', 'UMA NANDI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1176', 'TANIYA DUTTA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1177', 'KAILASH ROUTH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1178', 'GOPAL DA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1179', 'SONA SANYAL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1180', 'SUMAN GHOSH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1181', 'DIPANKAR HORE', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1182', 'DIPANKAR DEBNATH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1183', 'NIRMAL CHANDA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1184', 'RAMYANI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1185', 'SIMRAN AGARWAL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1186', 'BURA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1187', 'TUBLU DA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1188', 'JAYANTA PAL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1189', 'S. DEBNATH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1190', 'PINKI ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1191', 'SUBHENDU ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1192', 'SAYANTANI PAUL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1193', 'GOURAV RAJAK', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1194', 'ADITI SAHA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1195', 'JITEN BARMAN', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1196', 'LITAN DA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1197', 'JOYITA ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1198', 'D SAHA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1199', 'VICTOR BHATTACHERJEE', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1200', 'RANA SAHA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1201', 'GOBINDA SAHA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1202', 'DEBALINA GHOSH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1203', 'RABINDRANATH KARATI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1204', 'SWAPAN KR GOSWAMI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1205', 'ADWIN EKKA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1206', 'M BAJAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1207', 'DESBANDHU NAGAR MADHYAMIK BIDYALAY (HS)', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1208', 'NIRMALA ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1209', 'RAKHI ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1210', 'ALOK ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1211', 'DHUBA DA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1212', 'SMITAM', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1213', 'RAJDIP', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1214', 'ABHIJIT SARKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1215', 'ALPANA SAHA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1216', 'M SIDDHANTA ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1217', 'ANITA DAS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1218', 'SUPARNA CHAKI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1219', 'ANIL CHOUDHURY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1220', 'KOYEL ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1221', 'MINAKHI GHOSH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1222', 'TAPASH CHAKRABORTY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1223', 'I SARKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1224', 'BARNALI SINGHA ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1225', 'CHANDRIMA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1226', 'RIKITA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1227', 'SANYANTANI PULL ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1228', 'ANKAN BENERJEE', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1229', 'BHOLA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1230', 'JAYATI BENERJEE', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1231', 'NAMITA ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1232', 'MALANCHA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1233', 'S SENGUPTA ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1234', 'DIPAK SAHA ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1235', 'S N CHAKRABORTY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1236', 'KANIKA BISWAS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1237', 'N GHOSH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1238', 'TAPASH ROUTH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1239', 'AJANTA MUKHERJEE', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1240', 'CHANDREYEE', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1241', 'TANMAY PAUL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1242', 'RUPA DUTTA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1243', 'PINTU MALLIK ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1244', 'AJAY PAUL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1245', 'MUNNI ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1246', 'DHARAM', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1247', 'PRATIK ROUTH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1248', 'SAAJ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1249', 'CHOTU ROUTH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1250', 'ISHITA ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1251', 'SAMIR ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1252', 'AHI SAHA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1253', 'PUJA  SARKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1254', 'PUJA SARKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1255', 'BIREN BHATTACHERJEE', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1256', 'RINTU DA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1257', 'DEBASHIS CHAKI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1258', 'POMPI ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1259', 'RANA ROY ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1260', 'KRISHNA SEN', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1261', 'RAKHI DAS ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1262', 'TUSHAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1263', 'SOUVIK MANDAL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1264', 'ASHA NIKETAN', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1265', 'DEBASHIS SARKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1266', 'PRAHELIKA BANIK', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1267', 'ABHISEK BARMAN', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1268', 'PRASANTA GOSWAMI ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1269', 'RABINDRANATH DUTTA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1270', 'DOLI ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1271', 'AMAR DAS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1272', 'B MAHATA ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1273', 'PINKI CHATTERJEE ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1274', ' SATISH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1275', 'MOUMITA ADHIKARY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1276', 'KABITA BARMAN', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1277', 'KRISH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1278', 'PINKI DAS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1279', 'CAMELIA ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1280', 'TAPASH DAS ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1281', 'SANTOSH SARKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1282', 'AJAY DALUI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1283', 'BABLI BHEGAM', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1284', 'BABLI BHEGAM', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1285', 'BABLI BHEGAM', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1286', 'BABLI BHEGAM', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1287', 'DEBU DAS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1288', 'RAYMONDS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1289', 'PARTHA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1290', 'FACE FINDER', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1291', 'SATYAJIT PAUL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1292', 'SANDIP KAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1293', 'SANGHASHREE CLUB & PATHAGAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1294', 'DIPANKAR ROY ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1295', 'MANJISTHA ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1296', 'KEYA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1297', 'MRINMAY ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1298', 'ARUP SARKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1299', 'BIMAN CHAKRABORTY ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1300', 'MADANLAL BRIJMOHAN & CO. (RAYMONDS)', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1301', 'MUKTA ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1302', 'P T MITRA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1303', 'BANTI DA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1304', 'ANANDITA  DAS ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1305', 'SHINY PAUL CHOWDHURY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1306', 'ABHIJIT DAS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1307', 'APARNA DUTTA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1308', 'TONI DA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1309', 'SUBRATA DEB', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1310', 'SWAPNA SARKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1311', 'RINA ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1312', 'MANTI DAS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1313', 'RISHITA  ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1314', 'RANJIT SAHA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1315', 'SOMA BISWAS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1316', 'RAJIB', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1317', 'DIPIKA DAS  ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1318', 'SWAPNA GHOSH ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1319', ' ADDITIYA ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1320', 'NABANITA SARKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1321', 'SRABANI KARMAKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1322', 'SANTANA DAS ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1323', 'PRITAM SARKAR ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1324', 'ARUP DEY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1325', 'JAYANTA SARKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1326', 'SUGATA SAHA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1327', 'BOBI ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1328', 'SHALU ROUTH ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1329', 'BINA RANI GHOSH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1330', 'PINKU SARKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1331', 'C MANDAL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1332', 'RAJA GHOSH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1333', 'AAYAZ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1334', 'RINKI SARKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1335', 'SWAPAN MANDAL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1336', 'SUDHIR MANDAL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1337', 'SOWLI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1338', 'PALLABI LAHIRI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1339', 'SUMIT ROUTH  ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1340', 'BALAPARA TISTER CHAR SP PRIMARY SCHOOL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1341', 'BHARGAB CHAKRABORTY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1342', 'LAXMI MONDAL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1343', 'MASUDA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1344', 'RAJDIP DA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1345', 'KAMAL SARKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1346', 'SHINY  PAUL CHOWDHURY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1347', 'MINTU DA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1348', 'MRITYUNJAY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1349', 'INDRAJIT SARKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1350', 'SUBHRA CHAKRABORTY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1351', 'PARTHA DHAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1352', 'DEWALI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1353', 'BUBAI ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1354', 'AMBIKA ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1355', 'ARPITA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1356', 'ANKUSH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1357', 'MAHADEB', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1358', 'BIRU ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1359', 'DHIRAJ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1360', 'APU SARKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1361', 'PINTU ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1362', 'PRATIMA MANDAL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1363', 'DEBASISH CHAKI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1364', 'MUNTAI DA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1365', 'KAMOL DEB', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1366', 'LITAN DA ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1367', 'RAMESH KUMAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1368', 'TAPASH ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1369', 'ARGHAYA DAS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1370', 'DIBAKAR DAS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1371', 'DIBAKAR DAS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1372', 'VODAFONE', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1373', 'GULMI CHAKRABORTY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1374', 'S DAS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1375', 'MRINAL KANTI DAS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1376', 'RAJ NANDINI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1377', 'RUPAM', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1378', 'THAKUR VDO', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1379', 'BINOY DAS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1380', 'R BHADRA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1381', 'M BAZAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1382', 'SANJAY LASKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1383', 'TUBAI ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1384', 'SONIYA BOSAK', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1385', 'SARMISTHA SAHA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1386', 'RAJA SHARMA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1387', 'SOHANA PARVIN', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1388', 'SUDIP ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1389', 'ROMI SENGUPTA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1390', 'MALOTI ROUTH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1391', 'SAYANI NANDI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1392', 'SURAJ MRIDHA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1393', 'SOUGATA DA ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1394', 'SWAPNOJIT  DA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1395', 'ADITI ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1396', 'SINIOR MANAGER, DANGUAJHAR T.G.  ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1397', 'PIU BOSE', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1398', 'BORUN KUMAR GUHA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1399', 'KOULIK', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1400', 'KOUSHIK DEY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1401', 'TANIYA DAS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1402', 'SANCHALI SARKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1403', 'TEESTA THUMPERS MOTORCYCLE CLUB', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1404', 'BIKASH SARDAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1405', ' KOUSHIK DA ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1406', 'PRATIBA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1407', 'S CHANDRA ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1408', 'SHIBANI SANYAL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1409', 'RAHUL ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1410', 'RIYA CHOWDHRY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1411', 'TANMOY ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1412', 'BINOD SAH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1413', 'DIYA NAHATO', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1414', 'AMRITA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1415', 'MANGLA (RAMEN)', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1416', 'PUNAM MAHATO ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1417', 'DAS STD', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1418', 'GAURAV ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1419', 'MADHUMALA SARKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1420', 'SANTANU ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1421', 'TAJNUR HOSSAIN', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1422', 'NITA ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1423', 'SABITA GHOSH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1424', 'CHANDANI DANGA PRAIMARI SCHOOL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1425', 'RUPJIT ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1426', 'SHYAMOL SARKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1427', 'SHARBANU  DASGUPTA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1428', 'MADHUPARNA ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1429', 'SOUNAK', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1430', 'NRIPATI BUSHAN ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1431', 'ANIRUDDHA DAS GUPTA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1432', 'APARNA DAS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1433', 'SUDIP HELA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1434', 'NEOGI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1435', 'LIPI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1436', 'SAIBAL BARMAN', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1437', 'PAMPA DUTTA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1438', 'BIPLAB ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1439', 'DEBOSHREE RAY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1440', 'PROSID BHOWMIK', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1441', 'SANJAY SHOM ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1442', 'MALABIKA CHOUDHURY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1443', 'SANGITA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1444', 'BIKRAM', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1445', 'MILON PAUL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1446', 'MONTOSH ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1447', 'DEBABRATA MAJUMDER ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1448', 'MADHUSUDHAN KARMAKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1449', 'GANESG DUTTA ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1450', 'SHRABANI KUNDU', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1451', 'NRIPATI SANYAL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1452', 'MAYA BENARJEE', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1453', 'DEBOPAM GHOSH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1454', 'PROLAY DEY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1455', 'TAPAN SHARMA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1456', 'MALAY ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1457', 'BIKASH BARMAN', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1458', 'TANIYA SARKAR ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1459', 'NILANJAN DA ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1460', 'RANA BISWAS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1461', 'BASUDEB SARKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1462', 'BABAI PAUL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1463', 'WOMENS WORLD', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1464', 'MAMPI BARMAN', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1465', 'TUBUL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1466', 'A SRINIVAS RAO', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1467', 'CHANCHAL CHATTERJJE ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1468', 'CHANCHAL CHATTERJEE ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1469', 'RINKU DAS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1470', 'DIPAYAN CHAKRABORTY ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1471', 'BIKASH SHARMA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1472', 'SUMAN DAS ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1473', 'SAIKET GHOSH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1474', 'MOLAY ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1475', 'SOMBHU BASU', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1476', 'SUBHASHREE CHATTERJEE', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1477', 'ULLAS ROY ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1478', 'SAYANIKA BANIK', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1479', 'BIPLOB SING  ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1480', 'ADITI SHARMA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1481', 'T P  BHATTACHARY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1482', 'T P  BHATTACHARY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1483', 'T P  BHATTACHARY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1484', 'NILOY GHOSH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1485', 'N B ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1486', 'JAYSHREE PAUL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1487', 'TO THE SUPERINTENDENT KOROK HOME JALPAIGURI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1488', 'SMITA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1489', 'JAYASHREE PAUL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1490', 'MAYNAGURI NORT CIRCLE, JALPAIGURI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1491', 'JOY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1492', 'AMITAVA CHAKRABORTY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1493', 'JOYDIP (BUA)', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1494', 'GOUTAM GHOSH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1495', 'HOME', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1496', 'AMAR BENI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1497', 'D JHA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1498', 'ADRIJA ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1499', 'SUNIL SHAH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1500', 'SANDHYA SAHA ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1501', 'AMAR BENI ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1502', 'SUBHAM SARKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1503', 'RATUL ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1504', 'RUPAYAN', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1505', 'AYAN DEY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1506', 'DIBAKAR GHOSH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1507', 'SWAPAN DEY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1508', 'SAGAR NAHA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1509', 'CHANDANA BANIK', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1510', 'JOY ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1511', 'ABHISEK ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1512', 'PRAPTI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1513', 'SANTUNU SAHA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1514', 'MADHULIKA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1515', 'MENAKA SARKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1516', 'TINKU BANIK', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1517', 'KADAMTALA GIRLS SCHOOL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1518', 'RAIKATPARA YOUNG ASSOCIATION', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1519', 'PRINC', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1520', 'ASHOK KUMAR PAL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1521', 'SHILPI SARKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1522', '\"I:DEBANGAN GHOSH ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1523', 'DEBANGAN GHOSH ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1524', 'RAHUL ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1525', 'ANIL ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1526', 'DEBIKA SAHA ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1527', 'PARTHO ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1528', 'KESHAB', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1529', 'PRABIR SARKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1530', 'MD ANARUL HAQUE', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1531', 'SAIKAT', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1532', 'BABLU ISLAM', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1533', 'MONIKA SARKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1534', 'SHAMIK ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1535', 'PRIYANSHU', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1536', 'HIMANI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1537', 'TAPAN DA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1538', 'SANJUKTA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1539', 'RAJESH BAITHA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1540', 'ROFI ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1541', 'POULAMII', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1542', 'PRIYA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1543', 'SAMIR ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1544', 'RANA DAS GUPTA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1545', 'APARNA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1546', 'KOLI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1547', 'SUDIPTO DA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1548', 'SANJAY SARKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1549', 'A SEN', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1550', 'NRIPEN SARKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1551', 'ADRIJA ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1552', 'MANISHA BISWAS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1553', 'PRIYANKA ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1554', 'PRASEN', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1555', 'SUMANTA KUMAR ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1556', 'RAJA ROUTH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1557', 'SARASWATI ROUTH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1558', 'SUBHAS ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1559', 'JHUMA ROUTH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1560', 'PABITRA ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1561', 'J K BHADRA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1562', 'BADAL ROUTH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1563', 'ANANDA SAHA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1564', 'JAYA ROUTH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1565', 'RABI MOHANTA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1566', 'AJAY SAHA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1567', 'SUBHASHIS SARKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1568', 'AJAY ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1569', 'NATASHA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1570', 'SAMIR GHOSH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1571', 'KRISHNA ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1572', 'RIDHI ROY PRAMANIK', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1573', 'SONIYA MAHATO', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1574', 'ANAMIKA ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1575', 'PAPIYA ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1576', 'AMIT DAS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1577', 'ANUP THAKUR ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1578', 'DEEP BISWAS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1579', 'PRAKASH BARMAN', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1580', 'NABA KUMAR GHOSH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1581', 'SARMISTHA CHATTERJEE', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1582', 'BABITA ROUTH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1583', 'RATNA HELA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1584', 'ANJANA ADHIKARY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1585', 'PARIMAL BARMAN', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1586', 'ASHA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1587', 'RADHIKA ROUTH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1588', 'JOYA ROUTH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1589', 'KARTIK ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1590', 'SUSHANTA CHAKRABORTY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1591', 'RUPAK BARMAN', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1592', 'SUNIL ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1593', 'ANJAN PAUL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1594', 'ANJAN PAUL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1595', 'ANJAN PAUL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1596', 'BAPON ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1597', 'ABHIJIT ROY ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1598', 'PAPAI  ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1599', 'GITA HELE', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1600', 'GOPAL NANDI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1601', 'ARJUN ROUTH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1602', 'BISWAKARMA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1603', 'KOYEL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1604', 'NABIN CH DAS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1605', 'ANKITA SARKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1606', 'ARATI GHOSH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1607', 'NIHAR BHATTACHERJEE', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1608', 'RINKU RAJAT', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1609', 'PRITI PASSWAN', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1610', 'BIKASH ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1611', 'SUBRATA MITRA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1612', 'MAYA HELA ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1613', 'SONIKA DAS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1614', 'SAMPA MAHATO', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1615', 'GITA ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1616', 'L K BARMAN', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1617', 'AMIT ROUTH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1618', 'JAYA ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1619', 'DILIP GHOSH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1620', 'RANJIT', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1621', 'ANKITA ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1622', 'BEAUTY SAHA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1623', 'SAHADEB ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1624', 'JAYANTA PAUL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1625', 'TANIYA BANIK', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1626', 'TUMPA DEY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1627', 'HIREN ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1628', 'SURAJ GHOSH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1629', 'SIKHA SARKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1630', 'PRAKASH ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1631', 'JAYANTA ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1632', 'DIPALI HELA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1633', 'AMAR CHOUDHURY ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1634', 'SANTOSHI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1635', 'JISHU BANERJEE', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1636', 'ANUSHIBA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1637', 'JYOTISH ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1638', 'TUA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1639', 'TANMOY TANTRA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1640', 'MASHKALAI ABRI HANUMAN MANDIR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1641', 'MASHKALAI BARI HANUMAN MANDIR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1642', 'SOUVIK DUTTA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1643', 'JITENDRA NATH SARKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1644', 'ABHINASH MAJUMDER', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1645', 'KARTIK BHOWAL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1646', 'SUSHMITA NAG', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1647', 'SUBRATA SAHA ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1648', 'MITALI KUNDU', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1649', 'SWAPAN ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1650', 'DIBYENDU SARKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1651', 'BIPLAB DAS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1652', 'BISWNATHA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1653', 'HDFC BANK JALPAIGURI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1654', 'ANESHA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1655', 'PRAKASH BANIK', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1656', 'PRAKASH BANIK', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1657', 'MOUSHUMI SHARMA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1658', 'S ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1659', 'SANTOSH MAHATO', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1660', 'DEBASHIS DAS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1661', 'RAJASHREE', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1662', 'DR SUBRATA BHOUMIK ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1663', 'MANOJ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1664', 'R ACHARYA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1665', 'BIPLABI SARKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1666', 'SUDIP GHOSH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1667', 'RINKU DAS ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1668', 'UTTAM DAS ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1669', 'SAMSUNG', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1670', 'RAJA SAHA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1671', 'COMPUTER PLAZA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1672', 'TATAI DAS ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1673', 'MUNKI BARMAN ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1674', 'RABEKA PATRANOBIS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1675', 'ARANYA CHAKRABORTY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1676', 'SNEHASIS DASGUPTA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1677', 'KANCHIN KUMAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1678', 'SAKHAR BISWAS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1679', 'SAKHAR BISWAS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1680', 'SOUMIT', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1681', 'MANGLA DA ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1682', 'BISWANATH JISHU ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1683', 'BISWAS DAS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1684', 'MADHURIMA DASGUPTA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1685', 'S K DEY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1686', 'SUSHMITA ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1687', 'SOUTRIK DUTTA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1688', 'NEMAI DAS ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1689', 'MAHADEB ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1690', 'MAHADEB ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1691', 'S K DAS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1692', 'NAKUL KARMAKAR ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1693', 'RISTA DEY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1694', ' GOPAL KARMAKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1695', 'RESH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1696', 'CHHANDA PAL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1697', 'PAMPA ROY ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1698', 'SUMAN ROY ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1699', 'SI PHOTO ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1700', 'ARITRA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1701', 'SANI  SAHA ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1702', 'U BENARJEE', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1703', 'SURAVI ADHIKARY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1704', 'SUTAPA DEY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1705', 'RAKESH HUSSAIN', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1706', 'ABHIRUP SARKAR ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1707', 'SUKUMAR GUHA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1708', 'AMIT SARKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1709', 'NEHA AGARWAL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1710', 'DEOSHREE', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1711', 'NEPAL CHUNNAKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1712', 'NAISHA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1713', 'SAMIR MANDAL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1714', 'MRINAL BENERJEE', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1715', 'SANDIP BASAK', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1716', 'RAFIKUL ISLAM', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1717', 'ISWAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1718', 'MONA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1719', 'UTTARER MON, JALPAIGURI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1720', 'S K DUTTA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1721', 'BASU SIR GYM', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1722', 'BASANTI BARAI, BHABANI NAGAR, S C', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1723', 'KARTICK ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1724', 'SURAVI SHARMA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1725', 'SAMIR DEB', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1726', 'SANGHAMITRA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1727', 'TANUSHREE BOSE', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1728', 'SHANKAR SARKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1729', 'PRASENJIT BENERJEE', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1730', 'MAMPI ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1731', 'PAPI DAS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1732', 'RANAJOY SARKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1733', 'NILANJAN SARKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1734', 'ANITA MAHATO', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1735', 'HEENA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1736', 'M S ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1737', 'ANANTA KR ROY ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1738', 'SUBANKAR ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1739', 'DIPAK DAS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1740', 'BHASKAR GUHA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1741', 'SOURAV AGARWAL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1742', 'BHISHMA ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1743', 'SUBHRAJIT MANDAL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1744', 'MOM', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1745', 'K.ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1746', 'SANJIT ROY ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1747', 'SANJU KAKA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1748', 'PARTHA SHIL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1749', 'PROLAY SAHA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1750', 'R MALLICK', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1751', 'SHANKAR CHAKRABORTY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1752', 'RATAN ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1753', 'AJIT DUTTA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1754', 'RITU ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1755', 'BIMAL BISWAS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1756', 'DILIP DAS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1757', 'NANDA  ADHIKARY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1758', 'SUVO ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1759', 'SARBANI PAUL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1760', 'ARUP BOSE', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1761', 'ARUP BOSE', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1762', 'ARUP BOSE', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1763', 'RAJ ROUTH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1764', 'TAPAN GHOSH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1765', 'SUJIT SARKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1766', 'PREYASHI SAHA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1767', 'AJAY ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1768', 'SUDIPTA KISHOR ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1769', 'PRIYA SAHA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1770', 'PRADIP SAHA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1771', 'ANURADHA SARKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1772', 'PINAKI RANJAN ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1773', 'ARCHYASOME', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1774', 'NANDAN', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1775', 'PRATIK AGARWAL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1776', 'PAYEL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1777', 'SHYAMAL BHAKTA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1778', 'BARNALI SING', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1779', 'PRABIR CHANDRA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1780', 'RUPA BARMAN', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1781', 'SAMPA SEN', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1782', 'MALLIKA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1783', 'KOUSHIK NANDI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1784', 'A2Z MOBILE MULTIMEDIA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1785', 'SUDESNA GHOSH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1786', ' UTPAL DUTTA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1787', 'CHAYANIKA NAJUNDER', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1788', 'RAMEN ROY ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1789', 'ATISH ROY ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1790', 'SUDIPTA DA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1791', 'TANUSHREE BISWAS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1792', 'ANUPAMA ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1793', 'BABLI BARDHAN CHAOWDHURY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1794', 'PAPRI ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1795', 'NEHA SEN', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1796', 'S DAS ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1797', 'POPI DAS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1798', 'RITARAJ GHOSH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1799', 'DIPIKA ROY ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1800', 'SUJATA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1801', 'NIKITA ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1802', 'P S MAITRA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1803', 'PRIYANKA  BARMAN ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1804', 'MOUSUMI BAIRAGI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1805', 'NABANITA BISWAS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1806', 'SANIB ISWARARY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1807', 'SANJIB ISWARARY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1808', 'SANJIB ISWARARY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1809', 'BEAUTI DUTTA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1810', 'DEPANJANA DEB', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1811', 'PUTUL ROUTH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1812', 'POUSHALI SEN', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1813', 'SOUTAM GHOSH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1814', 'PRIYANKA BANIK', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1815', 'PANKAJ DAS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1816', 'SAHEB', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1817', 'BUBAI ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1818', 'SAQJAL DEY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1819', 'KAMALIKA SENGUPTA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1820', 'LOVELY DUTTA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1821', 'SWAYANTI CHAKRABORTY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1822', 'KRISHNA  SENGUPTA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1823', 'APU DHAKESWARI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1824', 'JOYDEEP CHAKRABORTY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1825', 'MADHABI SUTRADHAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1826', 'TANMOY ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1827', 'SUJIT GHOSH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1828', 'BARUN', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1829', 'AMRITA ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1830', 'RINKU ROY ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1831', 'SUJOY GHOSH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1832', 'RIMPI ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1833', 'PRATISH DUTTA ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1834', 'SAUBHIK DHAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1835', 'CHUMKI DAS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1836', 'SUMIT SHARMA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1837', 'SUMANA ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1838', 'SUMANA ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1839', 'MAHAR SARKAR ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1840', 'AJOY PASWAN', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1841', 'RAJARSHI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1842', 'RUNA BEGAM', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1843', 'RUMA MANDAL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1844', 'DIPU SING', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1845', 'SUBHASREE', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1846', 'SHABHRA SARKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1847', 'DEBASISH ROY ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1848', 'SUBHRANIL  ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1849', 'BONA PARA H.S ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1850', 'T SADHYA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1851', 'RAKHI ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1852', 'AVI ROY ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1853', 'PATAWARY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1854', 'SARODIA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1855', 'ANWESHA BHATTACHERJEE', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1856', 'NEHA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1857', 'BIJOY BENARJEE', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1858', 'SHUBHA ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1859', 'RUMPA  DAS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1860', 'BISWA NATH PAULL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1861', 'B K BHATTACHARYA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1862', 'D DOSTIDA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1863', 'D DOSTI DAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1864', 'SARODIA DI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1865', 'JHUMUR CHANDRA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1866', 'DIPTI DAS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1867', 'DEBAPRIYA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1868', 'DIPALI ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1869', 'NILANJANA ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1870', 'S SAHA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1871', 'DEBASISH GHOSH ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1872', 'MADHUBANI ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1873', 'LITON DA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1874', 'SWAPAN ROUTH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1875', 'PUNIMA ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1876', 'PANKAJ ROY  ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1877', 'SANKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1878', 'PINTU DA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1879', 'MAMPI DAS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1880', 'MOUMITA RAHA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1881', 'STOTRA SAHA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1882', 'DIPARNITA GUHA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1883', 'MEGHA DAS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1884', 'SANKHA DEV SARMA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1885', 'DEBU DA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1886', 'BHASKAR SARMA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1887', 'RITUPARNA MAJUMDER', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1888', 'SOHANA ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1889', 'JOYITA  DEB', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1890', 'P BANERJEE', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1891', 'NITTA NANDAN BARMAN ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1892', 'JOY ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1893', 'TAMASA  CHAKRABORTY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1894', 'CHANDAN KR MITRA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1895', 'TOTON  ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1896', 'MANJU DAM', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1897', 'RAHUL SARKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1898', 'BAPI  DAS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1899', 'LAXMI ROUTH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1900', 'MAMPI SEN', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1901', 'PINAKI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1902', 'SAPTADWIPA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1903', 'SUSHMITA DAS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1904', 'SAINT ANTHONYS SCHOOL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1905', 'BAPPA ROUTH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1906', 'BOBI ROUTH ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1907', 'TO THE SENIOR MANAGER  DENGUJHAR TG', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1908', 'R N DUTTA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1909', 'BIKASH ROY ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1910', 'JINNA ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1911', 'ANKITA DUTTA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1912', 'MIAKSHI ROY ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1913', 'SUJIT MAHATA ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1914', 'MANJU MANDAL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1915', 'TANAYA  CHAKI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1916', 'ROHAN ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1917', 'TAPAN BISWAS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1918', 'SUDIPTA MAJUMDER ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1919', 'BARNALI  ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1920', 'SANKAR ROY ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1921', 'SHARMILA ROY ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1922', 'PUSPITA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1923', 'RIPAN DAM', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1924', 'ANNWESHA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1925', 'KOHINAR BEGAM', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1926', 'SOUMEN SARKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1927', 'S E & MANAGER', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1928', 'ROSHAN ROUTH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1929', 'JAYASHIS NANDI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1930', 'BIKASH KANTI PAUL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1931', 'KAMESHWAR PRASAD', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1932', 'KAMESHWAR PRASAD', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1933', 'KAMESHWAR PRASAD', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1934', 'KAILASH SHARMA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1935', 'SANJANA ROUTH ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1936', 'BIDHAN', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1937', 'S K AGARWAL ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1938', 'SAPTAPARNA  SARKAR ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1939', 'GAJADHAR PRASAD', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1940', 'TANUSHREE DUTTA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1941', 'DIPALI SARKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1942', 'SABANA YASHMIN', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1943', 'SUJATA ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1944', 'SHYMAL DAS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1945', 'BAPPA GHOSH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1946', 'SAOUGATA DA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1947', 'SUBHANKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1948', 'ANNESHA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1949', 'MALLIKA ROY ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1950', 'DIBYANDU ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1951', 'SANJOY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1952', 'KHOKA GHOSH ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1953', 'INDRANI ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1954', 'INDRANI ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1955', 'SUJAL SAHA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1956', 'TAPAN GANGULI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1957', 'SABNA YASHMIN', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1958', 'JAYANTI BARMAN', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1959', 'CHANDAN ROUTH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1960', 'SAMPA LOVE BHUMI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1961', 'KOEL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1962', 'SEEMONTI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1963', 'AAPAN ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1964', 'BANSH SINGH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1965', 'CHANDRA ROY ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1966', 'MOUMITA  ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1967', 'DEBASIS NANDI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1968', 'DEBOMITA ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1969', 'ASHIM SARKAR ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1970', 'XXX', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1971', 'BHAGABATI DEB BARMAN', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1972', 'SHANTA ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1973', 'KONIKA SARKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1974', 'PARESH SARKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1975', 'NIRANJAN BASAK', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1976', 'CHHOTO ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1977', 'OLIVIA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1978', 'SOUMITRA DAS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1979', 'JOYA MAHATO', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1980', 'B B SARKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1981', 'RAJIB PAUL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1982', 'PAROMITA SARKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1983', 'ANTARLEENA DAS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1984', ' SAMIR BISWAS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1985', 'MITHU', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1986', 'SUJAN BARMAN', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1987', 'DILIP KUMAR ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1988', 'ARUP GHOSH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1989', 'ANINDYA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1990', 'SURESH PASWAN', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1991', 'ANINDITA ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1992', 'JUIE ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1993', 'KUNTALA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1994', 'AMRITA BHOWMICK', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1995', 'ASHOK SARKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1996', 'MADHUMANI ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1997', 'TUMPA DAS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1998', 'SWARUP ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('1999', 'KAMINI PASWAN', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2000', 'JUDHISTIR CH DEY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2001', 'ALPANA MITRA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2002', 'SUPRATIM GHOSH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2003', 'SUBHAM SARKAR ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2004', 'SUJIT ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2005', 'RAJIB DAS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2006', 'TULI BAIDYA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2007', 'RATAN SARDAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2008', 'PARVEEN', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2009', 'UCO BANK (KAKA)', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2010', 'SUMANA DAS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2011', 'ANWESHA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2012', 'SONU', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2013', 'SANGITA DAS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2014', 'ANTHANY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2015', 'MALAY SEN ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2016', 'SUNITA PASMAN', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2017', 'SHREYASHI KARMAKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2018', 'TAPAN', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2019', 'RANDHIR KUMAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2020', 'SHYAMAL SARKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2021', 'SUBHRAJIT ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2022', 'S LAHIRI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2023', ' KUNAL DUTTA ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2024', 'GOLI MOHAN ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2025', 'SUDIPA SAHA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2026', 'LALU', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2027', 'KOUSHIK', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2028', 'KOUSHIK', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2029', 'KOUSHIK', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2030', 'PINTU DA ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2031', 'PRITYA ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2032', 'RAJIB GHOSH ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2033', 'BHABATOSH DAS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2034', 'SONAULLA SCHOOL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2035', 'ANKITA  KUNDU', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2036', 'DESH BANDHU NAGAR HS SCHOOL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2037', 'KALACHAD BANIK', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2038', 'SS DUTTA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2039', 'ANKITA ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2040', 'DHRUBAJYOTI ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2041', 'SUSHMITA BARMAN', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2042', 'SANGITA RAM', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2043', 'ROSHNI ISLAM ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2044', 'DR PANIKI SARKAR ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2045', 'BAPPA  CHATTERJEE ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2046', 'HRISHIKESH DEBGUPTA ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2047', 'RUMA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2048', 'APURBA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2049', 'JAYANTI ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2050', 'KANIKA ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2051', 'MOUSAMI SARKAR ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2052', 'MONI ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2053', 'SHREYAN ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2054', 'LIZA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2055', 'DR AMITESH CHATTERJEE', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2056', 'SAMRAT ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2057', 'PAPPU ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2058', 'RAHUL BARMA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2059', 'MOUSAMI GUHA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2060', 'MAMPI ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2061', 'SAIKAT DAS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2062', 'PRADIP GUHA ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2063', 'SAYANTAN ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2064', 'SAHELI BOSE', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2065', 'HERAN BARMAN ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2066', 'UJJYINI SENGUPTA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2067', 'BIJETA CHAKRABORTY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2068', 'RUPALI ROY ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2069', ' JOYANTI ROY ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2070', 'SAMAR SINGHA ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2071', 'SWADHIN MODAK', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2072', 'DIP DEY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2073', 'RIKI DA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2074', 'MANIKA SAHI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2075', 'U KUMAR ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2076', 'MONTU ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2077', 'JOYDIP MITRA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2078', 'BANHISIKHA ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2079', 'DEBALINA AICH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2080', 'BISWAJIT PAUL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2081', 'B ROY CHOUDHURY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2082', 'GOPAL NATH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2083', 'SUBHAM GHOSH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2084', 'BEDANTEE ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2085', 'PALTAN BISWAS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2086', 'JALPAIGURI LAW CLG', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2087', 'POULOMI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2088', 'AMAL KUMAR CHANDA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2089', 'DILIP SAHA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2090', 'PABI CHHETRI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2091', 'SUMAN  BASU  ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2092', 'JUI BANIK', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2093', 'SONA ROY ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2094', 'SOURAV GANGULY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2095', 'ARPITA MAHATO', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2096', 'NIKET SAH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2097', 'AMLAN', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2098', 'BISWANATH MAHANTO', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2099', 'RISHAB', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2100', 'MAKHAN ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2101', 'MICKEL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2102', 'MRITYUNJAY ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2103', 'JHULAN MUSTAFI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2104', 'DIPA ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2105', 'DEBASISH GHOSH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2106', 'TAPASH KR ROY ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2107', 'SIDDHARTHA  ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2108', 'RAMESH ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2109', 'KAMAL GHOSH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2110', 'ALOK DAS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2111', 'SOVA GROUP', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2112', 'NILAKSHI ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2113', 'RATNA ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2114', 'SUSHMITA MANDAL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2115', 'CHANDRIMA ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2116', 'SUSMITA ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2117', 'TITLI SARKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2118', 'PUJA MANDAL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2119', 'SHWETA GANGULY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2120', 'AJOY MAHATO', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2121', 'TARUM  ROY ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2122', 'PRITAMA SAHA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2123', 'SHIPRA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2124', 'SUJAN BISWAS ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2125', 'P MAJUMDER', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2126', 'KOUSHIK ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2127', 'KRISHANU DE', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2128', 'ASHIM CHAKRABORTY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2129', 'DIPALI SHA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2130', 'PALLABI GHOSH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2131', 'BHOLA DAS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2132', 'PARVATI GROUP', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2133', 'NIBIDITA PAUL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2134', 'SANGITA ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2135', 'BRISTY ADHIKARI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2136', 'SAHIL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2137', 'BABLI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2138', 'KABUL ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2139', 'SIMI ROUTH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2140', 'DEBU', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2141', 'RONI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2142', 'MAA SHEBANI ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2143', 'ABHIJIT BOSE', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2144', 'BAPI DAS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2145', 'RANJIT ROY ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2146', 'SUBHAJIT ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2147', 'CHAITALI DHAR ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2148', 'SUKLA CHAKRABORTY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2149', 'BEAUTI ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2150', 'GITA SUTRADHSR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2151', 'RAMPRASAD DAS ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2152', 'ARPITA KUNDU', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2153', 'BIDUT SHIL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2154', 'SUBRATA ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2155', 'PABIR DAS MITRA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2156', 'HIRAN MAYEE PRAMANIK', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2157', 'MANABENDRA SHARMA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2158', 'MUNNA ROUTH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2159', 'ANIKET SAHA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2160', 'SUROJIT GHOSH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2161', 'RAMKRISHNA MISSION ASHRAMA JALPAIGURI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2162', 'DEBADRITA MOHINTA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2163', 'PARTHA KARMAKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2164', 'SAMOYEETA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2165', 'GARGI SENGUPTA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2166', 'PARICK', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2167', 'DHIRENDRA ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2168', 'SAPTARSEE', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2169', 'RANJAN', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2170', 'MOULI BROBHO', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2171', 'SANTOSH MISRA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2172', 'RATHIM SARKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2173', 'TITUL MALLICK', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2174', 'AMIT MOHANTA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2175', 'ANINDITA BANIK', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2176', 'SANGITA GOWALA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2177', 'SUSHOBHAN PRAMANIK', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2178', 'AJIT GHOSH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2179', 'A K PAUL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2180', 'MOU GHOSH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2181', 'SOBHA ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2182', 'SOHEL RAHAMAN ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2183', 'RAJESH SINGHAL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2184', 'MITHILESH THAKUR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2185', 'ASHOK KR MODOK', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2186', 'MANIK BARMAN', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2187', 'SUJIT BARAI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2188', 'ABTA JALPAIGURI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2189', 'JIBAGOTI SARKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2190', 'JOYDEEP SARKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2191', 'SHALU PRASAD', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2192', 'DEBABRATA ROY ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2193', 'PRABIR BOSE', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2194', 'TAPASHI ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2195', 'ARPITA BENRJEE', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2196', 'PRITIKA BHOWMICK', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2197', 'MANKHUSHI SARKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2198', 'KAMLI PASWAN', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2199', 'PRAVINA ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2200', 'DOLAN  BISWAS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2201', 'DEBAJOYI ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2202', 'ALOK MAJUMDER', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2203', 'PRATICK GOSWAMI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2204', 'PRABIR CHAKRABORTY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2205', 'SUBHAS DA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2206', 'SATHI DEY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2207', 'MIRA ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2208', 'S PHANI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2209', 'SHIKA SARKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2210', 'AISHI SARKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2211', 'JIBAN ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2212', 'SUBHANKAR MONDAL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2213', 'GANDHI MITRA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2214', 'MONA GHOSH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2215', 'SUBHAM MISRA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2216', 'AMIT SINHA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2217', 'DIPAK CHOUDHURY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2218', 'PRABIR KUMAR BISWAS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2219', 'SUDIP CHANDA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2220', 'SWAPAN ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2221', 'ARNAB', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2222', 'CHANDANI DANGA PRAIMARY SCHOOL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2223', 'RINKI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2224', 'TANUSHREE SOM MAJUMDER', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2225', 'SWARUP ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2226', 'CHANDRADEEP  ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2227', 'JOY DUTTA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2228', 'KALLOL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2229', 'ASHOK KR GANGULY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2230', 'GITA SARKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2231', 'UMA MUKHARJEE', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2232', 'DEBLIKA ROY ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2233', 'NAMITA DAS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2234', 'PIYALI  CHANDA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2235', 'MONIKUNTALA SENMAJUMDER', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2236', 'JAYASHREE ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2237', 'BACCHU DA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2238', 'LABANI DAS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2239', 'SUSHMITA BISWAS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2240', 'MITHUN BARUA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2241', 'MINAKSHI ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2242', 'MISTHU NANDI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2243', 'CHIRANJIT', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2244', 'TRITHANKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2245', 'BACHHU DEB ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2246', 'MD KIBIRIA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2247', 'SANTOSHI MANDAL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2248', 'RIMPA ROY ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2249', 'DRDC', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2250', 'RINKI ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2251', 'GURIYA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2252', 'SHUBHANKAR ROUTH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2253', 'DEBASHIS DEY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2254', 'SUBHAJIT DAS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2255', 'BRISTY ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2256', 'ANKAN MISRA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2257', 'ARNAB ROY CHOWDHURY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2258', 'BISWADIP', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2259', 'M A SARKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2260', 'BASHUDEB ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2261', 'SANDHA DAS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2262', 'ANINDA BISWAS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2263', 'BHIM', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2264', 'MADHUPARNA  CHAKRABORTY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2265', 'POULAMI SARKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2266', 'BHAKTI ADHIKARY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2267', 'BADAL BISWAS SHARMA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2268', 'BADAL BISWAKARMA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2269', 'ANWESHA GHOSH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2270', 'ANITA ROUTH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2271', 'A K ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2272', 'MADHYA KHAGRA BARI ADDITIONAL PRIMARY SCHOOL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2273', 'ANKIT ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2274', 'ABHIRUP GANGULY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2275', 'SUDIP  DA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2276', 'SOUBIK BOSE', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2277', 'PAYEL GHOSH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2278', 'SONALI DAS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2279', 'SWASATI  ROUTH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2280', 'PARVEEN BEGAM', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2281', 'BIKASH SAHA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2282', 'SUDESNA GOSWMI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2283', 'FDI SCHOOL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2284', 'MADHABI ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2285', 'SRIJA GHOSH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2286', 'RINKU', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2287', 'SAAKSHI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2288', 'JOYPUR ADDL PRY SCHOOL ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2289', 'SUBHASHIS SAHA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2290', 'PARTHA PRATIM SARKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2291', 'ITI SARKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2292', 'SHILPA MANDAL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2293', 'SUPARNITA BHOWMICK', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2294', 'DEBOLINA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2295', 'Bakshipara B.F.P. School SADAR NORTH CIRCLE JALPAIGURI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2296', 'CHIRANJIT MANDAL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2297', 'GOUTAM SEN', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2298', 'DIPAK SINGH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2299', 'BABU K C', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2300', 'NETAI DAS ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2301', 'ABHISHEK ROY ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2302', 'TRISHITA CHANDA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2303', 'SOMDATTA ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2304', 'SHANTANU SARDAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2305', 'RAHUL DAS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2306', 'KOUSHIK KAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2307', 'BISHAL ROY ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2308', 'MAYA SEN ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2309', 'SAMIR SINHA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2310', 'BOGRIBARI  S.C DHUPGURI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2311', 'NABANITA ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2312', 'SUBHASIS ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2313', 'SUKANYA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2314', 'GOKUL ROY SARKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2315', 'KOUSHIK BARMAN', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2316', 'BABAI KARMAKAR ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2317', 'PARTHA  DHAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2318', 'PIJUSH KANTI BOSE', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2319', 'SAPTAPARNI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2320', 'MONDAL GHAT R R PRAIMARI SCHOOL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2321', 'DIPAL SARKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2322', 'BHUMIKA ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2323', 'A CHAKRABORTY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2324', 'MAMPI SARKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2325', 'LAHIRIPARA  B.F.P SCHOOL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2326', 'SASUNIA PARA SCHOOL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2327', 'KAKITA KUNDU', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2328', 'SUBHANKAR MUKHERJEE', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2329', 'NATHUN DA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2330', 'DEEPRAJ  SENGUPTA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2331', 'BANTI  ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2332', 'KAJOL ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2333', 'SISHU SIKHYA NIKETAN SPL.CADRE PRIMARY SCHOOL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2334', 'RANJIT CHOUDHURY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2335', 'DIBAKAR  ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2336', 'LABONI ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2337', 'SANGITA AGARWAL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2338', 'SUBHANKAR ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2339', 'MANOJ BHATTA (SANTU)', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2340', 'BRAJAPUR MALIPARA, PRIMARY SCHOOL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2341', 'POULAMI NANDI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2342', 'GANA UNNAYAN PARSHAD', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2343', 'AMRITA CHAKRABARTI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2344', 'UTTAR SALBARI ST PRY SCHOOL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2345', 'DISTRICT LIBRARY OFFICER', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2346', 'MANIK GANJ BFP SCHOOL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2347', 'NARAYAN SARKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2348', 'SHREYAN DUTTA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2349', 'SACHIN MAJHI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2350', 'ANISH DASGUPTA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2351', 'SUBIR DEY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2352', 'PRASEN ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2353', 'NABIN KARMAKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2354', 'Patkata B.F.P.School', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2355', 'BISWAJIT KAR ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2356', 'JOGAMAYA GIRLS HIGH SCHOOL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2357', 'ARINDAM PAUL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2358', 'SUJAY KR CHAKRABORTY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2359', 'SUBHASHIS  ROY ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2360', 'DISHANI KAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2361', 'PRIYANKA PAUL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2362', 'DESHBANDHU NAGAR 2NO R R SCHOOL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2363', 'CHAND BASU', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2364', 'VOLA DA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2365', 'UMA NANDI PAUL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2366', 'SUSHIL SHIL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2367', 'RITI DAS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2368', 'SONAI ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2369', ' SAMRAT DUTTA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2370', 'SAYANDEEP ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2371', 'MONA THAKUR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2372', 'JAFURUL HOQUE', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2373', 'SAMPA KAMTI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2374', 'ABHISEK PAUL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2375', 'RAJDEEP ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2376', 'SABITA CHAKRABORTY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2377', 'JOSHNA ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2378', 'MITRA ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2379', 'MAMONI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2380', 'BILKIS BEGAM', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2381', 'PUNAM SARKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2382', 'NANDINI ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2383', 'SANJIB GHOSH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2384', 'ARCHANA ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2385', 'BAPI MAHAMMOD', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2386', 'SUPRIYA ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2387', 'PIJUSH ADHIKARI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2388', 'LAXMI ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2389', 'RINKI BEGAM', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2390', 'PRITI SARKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2391', 'JASANUR BEGAM', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2392', 'SAYANTIKA ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2393', 'SAHARA BANU', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2394', 'BEAUTY BARMAN', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2395', 'PAYEL DAS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2396', 'BHARATI ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2397', 'KABITA ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2398', 'RATHIBALA ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2399', 'ARPITA ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2400', 'MOU ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2401', 'JHUMA ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2402', 'SIPRA ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2403', 'PRIYA MANDAL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2404', 'SABITA ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2405', 'AMRITA PRASAD', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2406', 'MAMONI BEGAM', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2407', 'JOYITA ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2408', 'MAMATA ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2409', 'RIK DAS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2410', 'SOMA ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2411', 'SOMINI KHATUN', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2412', 'SHYAMALI ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2413', 'DIPAK ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2414', 'SUPARNA DAS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2415', 'SAPTAMI ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2416', 'SARA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2417', 'NO NAME 4275', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2418', 'BIMAL DAS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2419', 'POPI ADHIKARI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2420', 'PAYEL ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2421', 'MEDHI ROUTH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2422', 'GANGA ROUTH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2423', 'NISHAROUTH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2424', 'MADHUMITA  ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2425', 'PRIYA ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2426', 'PIYALI ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2427', 'SUSANTA DEY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2428', 'RIYA DEY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2429', 'PIULY SARKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2430', 'MAMONI KARMAKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2431', 'MD GUDDU', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2432', 'MANJU DEY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2433', 'RUBANA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2434', 'SWAPNA BARMAN', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2435', 'DOLY ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2436', 'ASHA DAS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2437', 'TONIMA ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2438', 'ABU RAHAMAN', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2439', 'SAGAR SARKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2440', 'DIPIKA BANERJEE', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2441', 'ADRIJA ROY ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2442', 'S CHOWDHRY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2443', 'ADITYA BHOWMICK', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2444', 'ASIT MITRA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2445', 'BIJOY ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2446', 'PRIYANKA GHOSH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2447', 'KISHOR KR DAS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2448', 'SANTANU SAHA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2449', 'AMITABHO PAUL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2450', 'NISHA AGARWAL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2451', 'Patkata B F P School', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2452', 'PUJA DEY ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2453', 'JOYITA SENGUPTA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2454', 'MAMUN DAS ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2455', 'P GHOSH ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2456', 'NONI ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2457', 'KOUSHIK LASKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2458', 'DIPANKAR CHAKRABORTY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2459', 'SUVAN BROJOBASI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2460', 'MANILAL DEBNATH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2461', 'CHANDA KARMAKAR ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2462', 'A DAY ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2463', 'ASHIS BASU ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2464', 'ARCHANA BARMAN ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2465', 'KABITA SARKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2466', 'SIMA GHOSH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2467', 'HIRAK DA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2468', 'AMIN KHAN ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2469', 'MAYER CHOBI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2470', 'S BHOWMIC', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2471', 'PROSENJIT SARKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2472', 'DISTRICT REGISTAR, JALPAIGURI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2473', 'RAKTIM', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2474', 'RISHAB DUTTA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2475', 'MANTOSH MAJUMDER', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2476', 'SECRETARY RECEPTION COMMITTEE, STATE CONFARENCE WBZPEU', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2477', 'ROUNAQUE SARKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2478', 'KRISHANU MANDAL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2479', 'S SENGUPATA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2480', 'DALIA BISWAS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2481', 'MANISH GANGULY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2482', 'MANISHA GANGULY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2483', 'MUKUL SARKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2484', 'Sabyasachi Roy Chowdhury', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2485', 'NUPUR AMBOLI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2486', 'JAYANTI KARMAKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2487', 'SABYASACHI ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2488', 'BIPUL ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2489', 'MRS ACHARJEE', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2490', 'TANMOY PAUL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2491', 'NAYEEM', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2492', 'DREEMLY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2493', 'SH RABBANI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2494', 'BANASHREE BOSE', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2495', 'ASHOK SING', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2496', 'RUCHI GROUP', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2497', 'PRODIPTA GHOSH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2498', 'BIJOY (ANKITA)', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2499', 'BAISAKHI BISWS ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2500', 'ARINDAM LASKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2501', 'PPJSC', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2502', 'SAKIL HOSSAIN', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2503', 'AMIR KHAN', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2504', 'AKHIL KR MANDAL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2505', 'ASHIT MITRE', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2506', 'DIPIKA DEB', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2507', 'KUSHUM SARKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2508', 'MOUMITA SARKAR ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2509', 'RATAN MALAKAR ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2510', 'ASHAK PAUL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2511', 'P K CHETTERJEE (', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2512', 'DHRUBA RANJAN SARKAR ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2513', 'RAJA SARKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2514', 'RANA BARAI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2515', 'STATE BHAWAIYA COMMITEE', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2516', 'RANA MALAKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2517', 'S PAUL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2518', 'DEBABRATA SARKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2519', 'PARTHA PRATIM ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2520', 'SUBHANKAR BASU', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2521', 'MANASH ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2522', 'PARAMITA MISTU', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2523', 'CAMELIA ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2524', 'SUCHANDRA CHAKRABORTY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2525', 'DR R R BANIK', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2526', 'BULU DAS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2527', 'TANIYA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2528', 'MRINMAY  ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2529', 'CHANDAN MAHATO', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2530', 'SURAVI DAS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2531', 'AVILAP', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2532', 'FANINDRA DEV INSTITUTION', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2533', 'PANKAJ KARJEE', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2534', 'SUBHECHHA ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2535', 'MAMPI GUHA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2536', 'SUCHANDA CHAKRABORTY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2537', 'PURNIMA GHOSH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2538', 'MUDIPARA SC PRIMARY SCHOOL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2539', 'BAHADUR PHUTAPAKURI PR SCHOOL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2540', 'SHILPI MANDAL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2541', 'BAHADUR THUTAPAKURI PR SCHOOL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2542', 'RINA STUDY GROUP FOR DANCE', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2543', 'SUBHANKAR SHIL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2544', 'PRIYABRATA KARMAKAR ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2545', 'SUJOY DAS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2546', 'PINKI ROY ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2547', 'PRACHI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2548', 'SPRIHA DAS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2549', 'PRAMESH PARIYAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2550', 'RANJIT KR BARMAN ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2551', 'PINTU SARKAR ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2552', 'SWADESH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2553', 'S TALUKDAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2554', 'SRABANI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2555', 'BANYARUPA ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2556', 'JOYDEB', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2557', 'SANTAI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2558', 'SAMPA TARAFDAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2559', 'SARATI ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2560', 'RITARAJ BOSE', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2561', 'SANJIB DEY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2562', 'RAJESH ROUTH ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2563', 'RATNADEEP ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2564', 'PRADIP SARKAR ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2565', 'TULI RAHA ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2566', 'ASHUL ROY ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2567', 'UDDHAB PRAMANIK', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2568', 'SOUVIK GHOSH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2569', 'RIYA  BISWAS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2570', 'RIYA BARMAN', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2571', 'RUPSHA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2572', 'RIPAN', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2573', 'JIT', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2574', 'PARVIN BEGAM ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2575', 'SANTU  ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2576', 'SHEBASHIS  BHOWMIK', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2577', 'REBA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2578', 'S BHOWMICK', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2579', 'DEBASISH CHOUDHORY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2580', 'BHABATOSH ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2581', 'SOUMITA MUNSHI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2582', 'DR SK DAS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2583', 'MAHASINA SARKAR ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2584', 'AMIT ASU', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2585', 'SUDHAMAY DAY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2586', 'MOLAY ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2587', 'SUDIP DA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2588', 'A SARKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2589', 'DEBARATI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2590', 'JYOTIRMOY ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2591', 'NAMRATA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2592', 'ANJALI GUPTA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2593', 'PALLABI ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2594', 'DR MRIDHA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2595', 'JAYASHMITA MAJUMDER', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2596', 'SHIBANI BARMAN', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2597', 'LOVLY LALA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2598', 'PRADIP DEY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2599', 'BARSHA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2600', 'PRIYANKAR ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2601', 'TAMA SAHA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2602', 'HIMANGSHU ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2603', 'PARIKSHIT CHAKRABORTY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2604', 'BINITA ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2605', 'SUDIPA PRADHAN', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2606', 'UTPAL ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2607', 'BENU ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2608', 'NIKHIL SARKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2609', 'PRADIP', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2610', 'SOVA ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2611', 'ANUSHREE ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2612', 'TANIIYA KAR PAL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2613', 'TUMPA CHETRI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2614', 'RAJIB DEY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2615', 'SHANTANU SAHA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2616', 'HRITIKA CHETRI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2617', 'SUBHASHIS BASAK', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2618', 'SUBHASH RAHA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2619', 'SHUBHAM CHAKI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2620', 'PRITAM GHOSH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2621', 'SARASWATI KARATI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2622', 'SUDIP NUG', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2623', 'ARGHYADEEP', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2624', 'UMA DEY SARKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2625', 'D SEN GUPTA ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2626', 'CHAITANYA ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2627', 'GOBINDA SARKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2628', 'SUBARNA MITRA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2629', 'PINKU MANDAL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2630', 'NANDITA ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2631', 'SUJATA BISWAS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2632', 'SAHELI DAS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2633', 'RATAN DA ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2634', 'JULI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2635', 'MAYNAGURI PANCHAYAT SAMITI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2636', 'ROHIT', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2637', 'DEBASHREE', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2638', 'TANUSHREE  SARKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2639', 'JHUMA SARKAR ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2640', 'PIYALI KARMAKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2641', 'H SEN', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2642', 'KANISHKA MOHANTA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2643', 'JAYDEET KARMAKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2644', 'SHISHUNIKETAN PREP SCHOOL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2645', 'DHIRAJ ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2646', 'M A SARKAR 1XA4 PWF', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2647', 'RITARAJ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2648', 'PRIYA BAUL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2649', 'SUBHRAJIT KAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2650', 'GOPAL ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2651', 'SHARMISTHA SARKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2652', 'RUPALI DUTTA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2653', 'BAPPA ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2654', 'B CHATTERJEE', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2655', 'BANANI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2656', 'SAHEB CHAKRABORTY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2657', 'S DUTTA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2658', 'SAHEB DUTTA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2659', 'MOUSUMI SAHA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2660', 'KRISHNU ACHERYA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2661', 'UDAY MAJUMDER', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2662', 'SANJIB ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2663', 'SEFALI BARMAN ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2664', 'GOBINDA SEN', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2665', 'M/S JOY ENTER PRISE PANDA PARA JALPAIGURI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2666', 'ANUJ KR SAHA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2667', 'BAPPA THAKUR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2668', 'MITALI DAS GUPTA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2669', 'CHAND ROUTT', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2670', 'SUSMITA DHAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2671', 'GOURI BERA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2672', 'MOUMITA DEY SARKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2673', 'A SAHA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2674', 'RUMA KUNDU', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2675', 'SUSHIL SARKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2676', 'STABAK BHADURI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2677', 'SUKANTA ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2678', 'SUPARNA ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2679', 'DEBASISH SARKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2680', 'PALLABI JHA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2681', 'SURAJ GOPE', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2682', 'ANANYA SEN ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2683', 'AMLAN SARKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2684', 'AMLAN SARKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2685', 'SANDIP SAHA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2686', 'DIPALI  DUTTA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2687', 'RAMCHANDRA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2688', 'SUSHAMA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2689', 'TISTA GROUP', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2690', 'ATANU', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2691', 'DEPSHIKA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2692', 'SCHANDAN KUNDU', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2693', 'APALA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2694', 'GOURAV KUNDU', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2695', 'AMAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2696', 'J. P. COMMUNICATIONS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2697', 'TITU DA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2698', 'SUDIP BARMAN', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2699', 'SHRABONI MANDAL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2700', 'BITAN CHOUDHURY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2701', 'SHANKAR DA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2702', 'SHEULI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2703', 'TANUSHREE ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2704', 'A DEY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2705', 'MIIRROR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2706', 'PRITIMA SAHA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2707', 'POLICE STATION', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2708', 'GOBINDO ANKITA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2709', 'TAMAL MITRA ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2710', 'SUKANNYA DEY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2711', 'TAPAS SARKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2712', 'NIRACHAL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2713', 'UPASANA BASAK', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2714', 'MANAB ROUTH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2715', 'ANKITA MANDAL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2716', 'CHAND KR DEY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2717', 'ABHISEK DAS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2718', 'RIYA PAUL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2719', 'M R DELAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2720', 'OM ROUTTA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2721', 'BABUA ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2722', 'DEBA ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2723', 'AMITABHA CHOUDHURY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2724', 'RAMYANI ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2725', ' ANUSTUP KARMAKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2726', 'PORA PARA PRIMARI SCHOOL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2727', 'POULAMI SENGUPTA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2728', 'PRANAB CHAKLADAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2729', 'PINKI SHA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2730', 'BIDYASHREE', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2731', 'PURNIMA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2732', 'SUMAN ANKITA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2733', 'SANCHITA DUTTA BISWAS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2734', 'Jalpaiguri Indoor Games Players’ Association', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2735', 'KUSTAV SENGUPTA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2736', 'ARJUN ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2737', 'PINKI CHOUDHURY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2738', 'SIBAJI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2739', 'SUMAN', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2740', 'CHAND BOSE', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2741', 'ANITA ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2742', 'PIYALI BANIK', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2743', 'SANTU BHATTA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2744', 'ELVISH DAS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2745', 'SUSHANRA EOY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2746', 'PROJJWAL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2747', 'SANHITA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2748', 'NANI SAHA KALONI PRIMARI SCHOOL, SOVA BARI JALPAIGURI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2749', 'DEBASHREE TALUKDAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2750', 'ASHIK ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2751', 'ASHIK ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2752', 'ASHIK ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2753', 'SONALI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2754', 'PRABHAS ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2755', 'SUMITA SINHA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2756', 'LUCKY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2757', 'ANUSTUP KARMAKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2758', 'CANARA BANK  ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2759', 'RAHUL AMIN', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2760', 'DEB ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2761', 'UTPAL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2762', 'ARIJIT ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2763', 'NARAYAN ROY ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2764', 'ANIMESH GHOSH ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2765', 'SANJIB PUL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2766', 'TUFAN ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2767', 'RIMA ROUTH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2768', 'PRADIP ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2769', 'SUTAPA BARMAN', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2770', 'SUTAPA BANERJEE', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2771', 'ROHAN BANERJEE', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2772', 'SUBHADIP SENGUPTA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2773', 'PRIYANKA SAHA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2774', 'SOVON MUSTAFI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2775', 'SAYAN MAJUMDER', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2776', 'BULA HORE', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2777', 'MUDHUMITA SARKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2778', 'CHANDANA DAS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2779', 'PUCHU ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2780', 'TAMALIKA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2781', 'SANI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2782', 'D K MAHANTA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2783', 'BASUDEB GIRLS H S', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2784', 'SAYANI GHOSH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2785', 'ABHIJIT  SARKAR ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2786', 'DEBAMRIT', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2787', 'TINNI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2788', 'KUMLAI 1064 JOTE PRYMARI SCHOOL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2789', 'SURAJIT BHOWMIK', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2790', 'MOUMITA MANDAL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2791', ' DIPAK PAUL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2792', 'BAPI ROY ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2793', 'FALOHARANI ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2794', 'DILIP SARKAR ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2795', 'JOTI  GROUP', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2796', 'ATAL KAKU', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2797', 'BACCU MANDAL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2798', 'TOM SARKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2799', 'IVY BHATTACHERJEE ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2800', 'RANAJIT CHOUDHURY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2801', 'CHANDRIMA DAS PL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2802', 'SWAPAN DAS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2803', 'BHASKAR SARKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2804', 'T SENGUPTA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2805', 'BAAZER KOLKATA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2806', 'AHELLY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2807', 'RANJIT CHAKROBARTY ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2808', 'SABYASACHI BAKSAK ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2809', 'AYAN DAS ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2810', 'MITHUN BARMAN ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2811', 'HARIPADA ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2812', 'ANIMA ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2813', 'PINKI SING', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2814', 'RAHUL BARMAN', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2815', 'ANGSHUMAN ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2816', 'SUMIT ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2817', 'NILOM ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2818', 'SAJAL ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2819', 'PAMPA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2820', 'BHUVEN ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2821', 'SHYMALI SEN', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2822', 'JAYASISH DA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2823', 'S KAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2824', 'AYAN CHAKRABORTY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2825', 'ANJAN GHOSH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2826', 'SUBHRADIP PHANI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2827', 'R N SARKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2828', 'SABINA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2829', 'BENGKANDI JUNIOR HIGH SCHOOL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2830', 'BHUMIKA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2831', 'COMDT 61 DM', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2832', 'MANSHI MALLICK', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2833', 'PRIYA GHOSH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2834', 'MOUMITA SEN ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2835', 'ANJALI SHARMA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2836', 'PARNASREE', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2837', 'MITHUIN SUTRADHAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2838', 'BIPLAB GHOSH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2839', 'SUBHAM AGARWAL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2840', 'MRINMOYEE ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2841', 'ANITOSH ADHIKARI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2842', 'TAFAPARA PRY.SCHOOL ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2843', 'MUMMUN BARMAN ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2844', 'MANDAL GHAT RR PRIMARY SCHOOL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2845', 'PORARAPA S.C.PRY SCHOOL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2846', 'REBAKA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2847', 'SUJAL ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2848', 'AMITESH SEN ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2849', 'G GHOSHAL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2850', 'S GHOSHAL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2851', 'SANTANU  DA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2852', 'BISWAJIT GHOSH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2853', 'SUBHRA ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2854', 'ATASHI SAHA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2855', 'ARUN KUMAR DUTTA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2856', 'DEBARGHA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2857', 'SUDEEP SONAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2858', 'CHITTARANJAN SARKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2859', 'NEW AMARKHANA PRY SCHOOL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2860', 'PRALHAD PAUL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2861', 'R KUNDU ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2862', 'SESBANDHU NAGAR R R PRY SCHOOL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2863', 'DESBANDHU NAGAR R R PRY SCHOOL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2864', 'RATAN SAHA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2865', 'CHOWHIDDI BFT SCHOOL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2866', 'NANIA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2867', 'AMAL SARKAR ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2868', 'HRIDHAAN', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2869', 'TINTIN DA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2870', 'AVNI ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2871', 'SANKAR BHATTACHARJEE', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2872', 'SINGIMARI RR PRY SCHOOL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2873', 'CHANDAN ROY ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2874', 'SOUVIK MONDAL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2875', ' MADHURI GOSWAMI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2876', 'NANDANI ROY ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2877', 'AISHIKA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2878', 'PRINCE', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2879', 'SULEKHA BISWAS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2880', 'BIBEKANANDA ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2881', 'BAISHAKI SINGHA ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2882', 'RANIR KAMAT NABIN PRATHAMIK VIDAYLAYA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2883', 'SOMYAJIT SAHA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2884', 'SUBRATA DAS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2885', 'JHULAN ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2886', 'MANIK GANJ BFP SCHOOL ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2887', 'TAPASHI DAS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2888', 'BHUPAL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2889', 'DEBASHRITA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2890', 'DIYA SAHA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2891', 'DESBANDHU NAGAR R R NO2 PRY SCHOOL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2892', 'MITHU BARMAN', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2893', 'MOUPIA ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2894', 'DIPASHA ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2895', 'NIHARIKA ROY ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2896', 'COMPUTER PLAZA', 'COMPUTER PLAZA', 'BEGUNTARI, CHOWDHURY COTTAGE', '03561227698', '', '0', '1', null, null);
INSERT INTO `customer` VALUES ('2897', 'ILA ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2898', 'SUBHA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2899', 'NATUN BANDAR HARIMANDIR J.R HS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2900', 'JAMURI BARI ASRAFUL HIGH MADRASA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2901', 'PRADIP ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2902', 'TAMAL BOSE', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2903', 'DIP', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2904', 'DOLL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2905', 'INDRAJIT GUPTA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2906', 'CHUMKI SENGUPTA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2907', 'RANJIT ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2908', 'KRISHNA SOM', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2909', 'BONA PARA KANDAR JUNIYAR H S SCHOOL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2910', 'DIPALI BAGCHI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2911', 'DIPALI BAGCHI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2912', 'DIPALI BAGCHI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2913', 'DIPALI BAGCHI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2914', 'DIPALI BAGCHI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2915', 'DIPALI BAGCHI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2916', 'BIREN MOHANTA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2917', 'SUBHAM DAS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2918', 'SANJIT SARKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2919', 'MANNA ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2920', 'MADHUSUDAN HELA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2921', 'SHRABANI DEY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2922', 'DEBARGHA ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2923', 'BISHNUPADA ROY ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2924', 'KRSHNA ADHIKARI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2925', 'SANJOY BHATTACHARJEE', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2926', 'SUBHASH CHANDRA SARKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2927', 'MONISA ROY ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2928', 'RIYANKA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2929', 'DEVILS ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2930', 'RAI SARKAR ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2931', 'PRITI ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2932', 'GOURAB SAHA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2933', 'AANGIRA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2934', 'SOURAV DEY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2935', 'SONI ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2936', 'JITENDAR SAH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2937', 'ANAMIKA SARKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2938', 'SANTOSH DEY SARKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2939', 'SAMAR NAHA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2940', 'SRIJANI BHOWMIK', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2941', 'BISWAJIT ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2942', 'KRISHNA SHA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2943', 'AGNI PAUL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2944', 'KARABI GOSWAMI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2945', 'MEJHO BABU KOTWALI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2946', 'BONA PARA H.S  SCHOOL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2947', 'KAMTECH ENGHNCO', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2948', 'JAYASHREE MITRA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2949', 'BISWAJIT BARUA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2950', 'ATANU RAY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2951', 'LADDU', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2952', 'BUBAI  BARMAN', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2953', 'SHIVANI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2954', 'SAMPA DAS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2955', 'ALI SARKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2956', 'SHYAM ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2957', 'SUMAN DEY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2958', 'UTTAM ROY ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2959', 'TAPAN KUMAR SARKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2960', 'SAPTARSHI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2961', 'AGOMANI DI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2962', 'BHAJAN SARKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2963', 'RIYANKA ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2964', 'KONIKA SHARMA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2965', 'TARAK CHAKRABORTY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2966', 'MANOSHI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2967', 'SPOAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2968', 'NITI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2969', 'BIKASH CHAKRABORTY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2970', 'DIP SINHA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2971', 'ADITYA SARMA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2972', 'SADHANA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2973', 'SALU PRASHAT', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2974', 'AVRANIL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2975', 'SOURAV GHOSH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2976', 'D GHOSH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2977', '  BIRU ROY ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2978', 'RANJIT KARMAKAR ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2979', 'KSHETRAMOHAN H.S SCHOOL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2980', 'LALU ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2981', 'SREEMEGHA DAS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2982', 'KOLLANI ROUTH ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2983', 'NARESH CH ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2984', 'ADITRI GHOSH DASTIDAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2985', 'SHANTI SHA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2986', 'KOUSHIK PAUL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2987', 'ALPANA SARKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2988', 'POMPI DAS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2989', 'ARATI MAHATO', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2990', 'KANIKA ORAOA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2991', 'MANAB SAHA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2992', 'STATE CO-ORD. COM. JPG', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2993', 'NIDHI SAH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2994', 'MUG', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2995', 'MIHA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2996', 'APABRITA BHATTACHARYA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2997', 'SUJAN ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2998', 'SALINI BHOWMIK', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('2999', 'POULAMI ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3000', 'SOURAMITA ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3001', 'ANUBHAB ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3002', 'PRASANTA MONDAL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3003', 'SANJOY ROY ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3004', 'SAIKET BARMA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3005', 'RATHIN DEY ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3006', 'SOUPAYAN SARKAR ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3007', 'DANGUJHAR  T.G', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3008', 'SHUBHADEEP PAUL  ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3009', 'GANESH PAUL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3010', 'MITHUN DAS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3011', 'SAYANTAN GHOSH ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3012', 'RUMPA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3013', 'SULAGNA ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3014', 'SUBHENDU MANDAL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3015', 'PANCHOBOTI BFP SCHOOL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3016', 'RUMPA DUTTA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3017', 'MANJU ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3018', 'NATASHA ROUTH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3019', 'OM ROUTH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3020', 'NAREN PRADHAN', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3021', 'SANJIB DAS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3022', 'BHAJON SARKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3023', 'DULAL DEBNATH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3024', 'SAPTARA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3025', 'SUSMITA BENARJEE', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3026', 'MADHUMITA ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3027', 'CHHOTU', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3028', 'PRITAM RAY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3029', 'AYAN ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3030', 'CHAMPAK SENGUPTA ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3031', 'TUBAI SARKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3032', 'RITU MISRA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3033', 'SHRESTHA SARKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3034', 'MOULI GANGULY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3035', 'ADRIJA SARKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3036', 'RANI CHAKRABORTY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3037', 'MOU SAMAJDAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3038', 'PUJA MAJUMDAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3039', 'MAYA ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3040', 'PRITI DAS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3041', 'RAMA ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3042', 'ARGHADEEP ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3043', 'ABHISHEK BOSE', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3044', 'NIRUPOM  ROY ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3045', 'SAYAED', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3046', 'BHAJAN DAS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3047', ' ABHISHIKTA   NAG', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3048', 'KAJAL SARKAR ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3049', 'TANMAY CHAKI ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3050', 'DILIP KUMAR MITRA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3051', 'JOYDEEP DAS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3052', 'NIKITA ROY ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3053', 'SHABITA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3054', 'SHIV SANKAR MAHATO', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3055', 'BAPAN ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3056', 'KOKIL SAEKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3057', 'BAGPACKERS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3058', 'ANONNA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3059', 'MRINMOY DAS  ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3060', 'MAMPI KARMOKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3061', 'IVY CHAKRABORTY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3062', 'NILAY MANI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3063', 'ADHIR BARMAN', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3064', 'SUVASIS ROY ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3065', 'BIJAN BHADRA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3066', 'USHA ROY ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3067', 'ARINDAM  GHOSH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3068', 'TANMOY KR SENGUPTA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3069', 'SOMA GHOSH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3070', 'BIJAN SARKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3071', 'DRABIR DAS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3072', 'SIMPI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3073', 'SAYAN KARMAKAR ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3074', 'SUYETA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3075', 'SANDIP SANYAL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3076', 'A GHOSH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3077', 'NIBEDITA ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3078', 'SAMANWITA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3079', 'SUVO DAS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3080', 'PRITAM ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3081', 'PRAGGYA BHOWMICK ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3082', 'PUJA MALLCK', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3083', 'EXCICUTIVE ENGINEER JALAPAIGURI SIVITION', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3084', 'SEFALI RUDRA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3085', 'KAMALIKA RUDRA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3086', 'JOUSHIT', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3087', 'PRADIP SEN', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3088', 'M GHOSE', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3089', 'BABUN MISRA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3090', 'SOUMYABRATA BHOWMICK ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3091', 'AFRUJA RAHAMAN', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3092', 'RUCHIKA SAHA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3093', 'SHAMIK  MOULICK', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3094', 'DIBIANKA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3095', 'BEAUTY GHOSH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3096', 'SIBU GHOSH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3097', 'CANADA BANK', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3098', 'SWAPNA KAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3099', 'ADITYA DUTTA GUPTA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3100', 'RAJA PASWAN', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3101', 'SUVO CHAKRABORTY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3102', 'SUBHA CHAKRABORTY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3103', 'SOURAV DAS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3104', 'PARTHA PRATIM DAS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3105', 'SUKNA DAS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3106', 'SANJAY KAHAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3107', 'NILANJAN', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3108', 'A BISWAS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3109', 'SHYAMLI SAHA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3110', 'CHITRA BARMAN', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3111', 'ANNATAMA DAS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3112', 'SAPTASHI ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3113', 'NABANITA NANDI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3114', 'MOUSHUMI ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3115', 'SAMPA SARKAR ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3116', 'PRASANJIT  SARKAR ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3117', 'DIPTI GHOSH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3118', 'PEKARO', 'PEKARO', 'BIDHAN NAGAR, RAIGANJ, UTTAR DINAJPUR', '9232085180', 'order@pekaro.in', '0', '1', null, null);
INSERT INTO `customer` VALUES ('3119', 'MINTU CHANDA ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3120', 'R K BHARTI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3121', 'SEBANGI ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3122', 'DIPANKAR KARMAKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3123', 'ASHIT RAKSHIT', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3124', 'SUBHAJYOTI  SARKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3125', 'MOUMITA RAHA PAUL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3126', 'SMRITI KANA MONDAL ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3127', 'MRITYUNJAY BHATTACHARYA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3128', 'PUCHAN', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3129', 'DIPANKAR RAJAK', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3130', 'SEBJANI  BISWAS ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3131', 'NIBEDITA BENERJEE', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3132', 'SIKHA BENERJEE', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3133', 'S R ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3134', 'BIPUL SARKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3135', 'PRIYA BARMAN  ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3136', 'ABIR ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3137', 'SARIAM JASADHAR HIGH SCHOOL ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3138', 'RITA MAHATO', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3139', 'INDRA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3140', 'ANKITA  SUR ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3141', 'MUKESH ROY BARMAN', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3142', 'SAMAR DEY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3143', 'ANANYA DAS  ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3144', 'MEGHA ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3145', 'KAMAL ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3146', 'PROBIR MAJUMDER', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3147', 'TANMAY SENGUPTA ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3148', 'PAMPI BARMAN', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3149', 'MIHIR GHOSH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3150', 'PRANAB KR DAS', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3151', 'SAGARIKA ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3152', 'ANURADHA DEY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3153', 'JUI AZMI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3154', 'S K ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3155', 'ATANU SEN', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3156', 'P SEN', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3157', 'MIRDUL ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3158', 'DEBOJIT DAS ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3159', 'S BOSE', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3160', 'SUDIPTA CHAKRABORTY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3161', 'MADHUMITA ROY ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3162', 'SHYAMALI  ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3163', 'SUSANTA ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3164', 'APRAJITA ROY ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3165', 'INDRAJIT ROUTH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3166', 'SOUMASHREE DEY SARKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3167', 'PRIYATAM', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3168', 'GOUTAMA SEAL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3169', 'SANDIP KR ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3170', 'DR. SAMARPITA MUKHERJEE', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3171', 'SANGHASREE CLUB AND PATHAGER', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3172', 'SIBANGI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3173', 'SEKHAR ROUTH', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3174', 'BANDHAN BANK ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3175', 'BIPASHA ROY ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3176', 'NAINA ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3177', 'SUCHISMITA  BANIK', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3178', 'UDAY MANDAL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3179', 'BIJAN BISWAS ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3180', 'RUPAK ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3181', 'BHANU MUNDA ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3182', 'S NANDA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3183', 'APARUPA SARKAR ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3184', 'SUDIPTA CHAKI', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3185', 'RABI ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3186', 'SUBHAJIT PAUL', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3187', 'DIPAK BASAK', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3188', 'B BHATTACHERJEE', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3189', 'KANCHAN  JHA ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3190', 'SOMRAJ GUHA', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3191', 'BHASKAR CHOUDHURY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3192', 'BSF RANINAGAR ', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3193', 'ARUN SARKAR', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3194', 'MOUSUMI BENARJEE', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3195', 'UMASANKAR ROY', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3196', 'Mr. Madon Mohanlal Das', 'M.M.L Das', 'HAREM MUKHERJEE ROAD, hakim para, Siliguri, P.O. - Siliguri Head Post Office, P.S. - Siliguri, Dist:- Darjeeling, West Bengal, Pin Code - 734001', '9434045970', 'mmldas@gmail.com', '0', '1', '2018-06-02 17:02:59', '2018-06-02 11:32:59');
INSERT INTO `customer` VALUES ('3209', 'Mus Technologies', 'MUS', 'Siliguri', '9832098320', 'mus@gmail.com', '0', '1', '2018-06-22 07:26:28', '2018-06-22 07:26:28');
INSERT INTO `customer` VALUES ('3210', 'Retail Customer', null, null, null, null, '0', '1', null, null);
INSERT INTO `customer` VALUES ('3211', 'testing kumar', 'testing kumar', 'matrelli\nlkjfdisakl', '9832668671', 'TESTING@GMAIL.COM', '0', '1', '2018-07-24 05:35:49', '2018-07-24 05:35:49');
INSERT INTO `customer` VALUES ('3212', 'b das', '', '', '9832329366', '', '0', '1', '2018-09-08 09:16:42', '2018-09-08 09:16:42');
INSERT INTO `customer` VALUES ('3213', 'B DAS', null, null, null, null, '0', '1', '2018-07-13 16:20:16', '2018-07-13 16:20:16');

-- ----------------------------
-- Table structure for `customers`
-- ----------------------------
DROP TABLE IF EXISTS `customers`;
CREATE TABLE `customers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ledger_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `zip` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mobile` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `vatNo` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bankName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bankAct` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pan` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `customer_type` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ledger_type` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ledger_type2` int(10) DEFAULT NULL,
  `ledger_group` int(10) DEFAULT NULL,
  `opening_balance` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of customers
-- ----------------------------
INSERT INTO `customers` VALUES ('1', 'retail customer', 'ITANAGAR', '', 'ARUNACHAL PRADESH', 'ITANAGAR', '', '', '', null, null, null, null, null, '2018-05-10 02:18:53', '2018-05-23 19:47:30', null, 'debtor', '11', '1', '');
INSERT INTO `customers` VALUES ('2', 'cash', null, null, null, null, null, null, null, null, null, null, null, null, '2018-05-24 11:40:01', '2018-05-24 11:40:01', null, null, '3', '1', '');
INSERT INTO `customers` VALUES ('13', 'NEWTECH COMPUTERS', 'GUWAHATI', '', 'ASSAM', 'GUWAHATI', '', '', '', null, null, null, null, null, '2018-05-08 18:09:39', '2018-05-08 18:09:39', null, 'creditor', '1', '2', null);
INSERT INTO `customers` VALUES ('14', 'STARNET COMPUTERS', 'GUWAHATI', '', 'ASSAM', 'GUWAHATI', '', '', '', null, null, null, null, null, '2018-05-08 18:10:18', '2018-05-08 18:10:18', null, 'debtor', '1', '2', null);
INSERT INTO `customers` VALUES ('15', 'COMPUTERS & APPLIANCES', 'SILPUKHURI', '', 'ASSAM', 'GUWAHATI', '', '', '', null, null, null, null, null, '2018-05-08 18:10:54', '2018-05-08 18:10:54', null, 'creditor', '1', '2', null);
INSERT INTO `customers` VALUES ('16', 'SR INFOTECH', 'GUWAHATI', '', 'ASSAM', 'GUWAHATI', '', '', '', null, null, null, null, null, '2018-05-08 18:11:36', '2018-05-08 18:11:36', null, 'creditor', '1', '2', null);
INSERT INTO `customers` VALUES ('17', 'AMANS', 'GANGA', '', 'ARUNACHAL PRADESH', 'ITANAGAR', '', '9436059682', '', null, null, null, null, null, '2018-05-08 18:12:08', '2018-05-08 18:12:08', null, 'creditor', '1', '2', null);
INSERT INTO `customers` VALUES ('18', 'AKASH ENTERPRISE', 'AKASHDEEP', '', 'ARUNACHAL PRADESH', 'ITANAGAR', '', '', '', '', '', '', '', null, '2018-05-08 18:12:32', '2018-05-23 00:10:20', null, 'creditor', '1', '2', '500');
INSERT INTO `customers` VALUES ('19', 'COURIER', null, null, null, null, null, null, null, null, null, null, null, null, '2018-05-09 18:18:49', '2018-05-09 18:18:49', null, 'expenses', '5', '2', null);
INSERT INTO `customers` VALUES ('21', 'G ETE', 'ITANAGAR', '791111', 'ARUNACHAL PRADESH', 'ITANAGAR', '', '', '', null, null, null, null, null, '2018-05-12 03:46:05', '2018-05-12 03:46:05', null, 'debtor', '2', '1', null);
INSERT INTO `customers` VALUES ('22', 'PETROL', null, null, null, null, null, null, null, null, null, null, null, null, '2018-05-13 01:39:50', '2018-05-13 01:39:50', null, 'expenses', '5', '2', null);
INSERT INTO `customers` VALUES ('23', 'HOUSE RENT', null, null, null, null, null, null, null, null, null, null, null, null, '2018-05-13 01:40:05', '2018-05-13 01:40:05', null, 'expenses', '5', '2', null);
INSERT INTO `customers` VALUES ('24', 'ELECTRICITY BILL', null, null, null, null, null, null, null, null, null, null, null, null, '2018-05-13 01:40:20', '2018-05-13 01:40:20', null, 'expenses', '5', '2', null);
INSERT INTO `customers` VALUES ('25', 'LABOUR CHARGE', null, null, null, null, null, null, null, null, null, null, null, null, '2018-05-13 01:40:38', '2018-05-13 01:40:38', null, 'expenses', '5', '2', null);
INSERT INTO `customers` VALUES ('26', 'AIMWA', null, null, null, null, null, null, null, null, null, null, null, null, '2018-05-13 01:41:00', '2018-05-13 01:41:00', null, 'expenses', '5', '2', null);
INSERT INTO `customers` VALUES ('27', 'TEA AND SNACKS', null, null, null, null, null, null, null, null, null, null, null, null, '2018-05-13 01:41:21', '2018-05-13 01:41:21', null, 'expenses', '5', '2', null);
INSERT INTO `customers` VALUES ('28', 'AUDITION', 'ITANAGAR', '791111', 'ARUNACHAL PRADESH', 'ITANAGAR', '', '', '', null, null, null, null, null, '2018-05-13 03:12:36', '2018-05-13 03:12:36', null, 'creditor', '1', '2', null);
INSERT INTO `customers` VALUES ('29', 'SANIA MOBILE', 'OS COMPLEX', '791111', 'ARUNACHAL PRADESH', 'ITANAGAR', '', '', '', null, null, null, null, null, '2018-05-13 03:12:58', '2018-05-13 03:12:58', null, 'creditor', '1', '2', null);
INSERT INTO `customers` VALUES ('30', 'LOCAL SHOP', 'ITANAGAR', '791111', 'ARUNACHAL PRADESH', 'ITANAGAR', '', '', '', null, null, null, null, null, '2018-05-13 03:13:30', '2018-05-13 03:13:30', null, 'creditor', '1', '2', null);
INSERT INTO `customers` VALUES ('31', 'OLD STOCK', 'SELF', '791111', 'ARUNACHAL PRADESH', 'ITANAGAR', '', '', '', null, null, null, null, null, '2018-05-13 03:13:56', '2018-05-13 03:13:56', null, 'creditor', '1', '2', null);
INSERT INTO `customers` VALUES ('32', 'MOYUK TECHNOLOGIES', 'SILIGURI', '', 'WEST BENGAL', 'SILIGURI', '', '', '', null, null, null, null, null, '2018-05-13 03:14:21', '2018-05-13 03:14:21', null, 'creditor', '1', '2', null);
INSERT INTO `customers` VALUES ('33', 'MUS TECHNOLOGY SERVICES PVT. LTD', 'SILIGURI', '', 'WEST', 'SILIGURI', '', '', '', null, null, null, null, null, '2018-05-13 03:14:48', '2018-05-13 03:14:48', null, 'creditor', '1', '2', null);
INSERT INTO `customers` VALUES ('35', 'LABOUR AND EMPLOYMENT', 'ITANAGAR', '791111', 'ARUNACHAL PRADESH', 'ITANAGAR', '', '', '', null, null, null, null, null, '2018-05-15 14:33:33', '2018-05-15 14:33:33', null, 'debtor', '2', '1', null);
INSERT INTO `customers` VALUES ('36', 'cic office', 'itanagar', '791111', 'ARUNACHAL PRADESH', 'ITANAGAR', '', '', '', null, null, null, null, null, '2018-05-16 12:58:39', '2018-05-16 12:58:39', null, 'debtor', '2', '1', null);
INSERT INTO `customers` VALUES ('37', 'KVIP', 'ITANAGAR', '791111', 'ARUNACHAL PRADESH', 'ITANAGAR', '', '', '', null, null, null, null, null, '2018-05-16 13:14:19', '2018-05-16 13:14:19', null, 'debtor', '2', '1', null);
INSERT INTO `customers` VALUES ('38', 'PWD (SHANTANU)', 'ITANAGAR', '791111', 'ARUNACHAL PRADESH', 'ITANAGAR', '', '', '', null, null, null, null, null, '2018-05-16 14:50:49', '2018-05-16 14:50:49', null, 'debtor', '2', '1', null);
INSERT INTO `customers` VALUES ('40', 'SHREE GANESH INFOTECH', 'ITANAGAR', '791111', 'ARUNACHAL PRADESH', 'itanagar', '', '', '', null, null, null, null, null, '2018-05-16 15:33:20', '2018-05-16 15:33:20', null, 'creditor', '1', '2', null);
INSERT INTO `customers` VALUES ('41', 'tayeng hgher education', 'ITANAGAR', '791111', 'ARUNACHAL PRADESH', 'ITANAGAR', '', '', '', null, null, null, null, null, '2018-05-16 15:35:21', '2018-05-16 15:35:21', null, 'debtor', '2', '1', null);
INSERT INTO `customers` VALUES ('42', 'RG GOVT POLYTECHNIC', 'ITANAGAR', '791111', 'ARUNACHAL PRADESH', 'ITANAGAR', '', '', '', null, null, null, null, null, '2018-05-16 15:42:52', '2018-05-16 15:42:52', null, 'debtor', '2', '1', null);
INSERT INTO `customers` VALUES ('43', 'WRD (JISHU SAHA)', 'ITANAGAR', '791111', 'ARUNACHAL PRADESH', 'ITANAGAR', '', '', '', null, null, null, null, null, '2018-05-18 14:30:46', '2018-05-18 14:30:46', null, 'debtor', '2', '1', null);
INSERT INTO `customers` VALUES ('44', 'LOCAL SHOP ITANAGAR', 'ITANAGAR', '791111', 'ARUNACHAL PRADESH', 'ITANAGAR', '', '', '', null, null, null, null, null, '2018-05-18 14:34:44', '2018-05-18 14:34:44', null, 'creditor', '1', '2', null);
INSERT INTO `customers` VALUES ('45', 'ADHIKARI (SECONDARY EDUCATION)', 'ITANAGAR', '791111', 'ARUNACHAL PRADESH', 'ITANAGAR', '', '', '', '', '', '', '', null, '2018-05-18 14:38:28', '2018-05-23 00:03:27', null, 'debtor', '2', '1', '5000');
INSERT INTO `customers` VALUES ('46', 'DOIMUKH GOVT. COLLEGE', 'DOIMUKH', '791111', 'ARUNACHAL PRADESH', 'DOIMUKH', '', '', '', null, null, null, null, null, '2018-05-20 15:26:40', '2018-05-20 15:26:40', null, 'debtor', '2', '1', null);
INSERT INTO `customers` VALUES ('47', 'DIRANG GOVT POLYTECHNIC', 'DIRANG', '', 'ARUNACHAL PRADESH', 'DIRANG', '', '', '', null, null, null, null, null, '2018-05-20 15:30:42', '2018-05-20 15:30:42', null, 'debtor', '2', '1', null);
INSERT INTO `customers` VALUES ('48', 'RAKHE TAKUM', 'ITANAGAR', '791111', 'ARUNACHAL PRADESH', 'ITANAGAR', '', '', '', null, null, null, null, null, '2018-05-20 15:34:14', '2018-05-20 15:34:14', null, 'debtor', '2', '1', null);
INSERT INTO `customers` VALUES ('49', 'YACHULI DIVISIONAL COMMISSIONER', 'YACHULI', '', 'ARUNACHAL PRADESH', 'YACHULI', '', '', '', null, null, null, null, null, '2018-05-20 15:36:21', '2018-05-20 15:36:21', null, 'debtor', '2', '1', null);
INSERT INTO `customers` VALUES ('50', 'SANJAY KUMAR ', 'MATELLI BAZAR , P.O. MATELLI', '735223', 'WEST BENGAL', 'MATELLI', '9832668671', '9832668671', 'sanjh.matelli@gmail.com', '', '', '', '', null, '2018-05-22 21:31:10', '2018-05-22 21:31:35', 'Registered', 'debtor', '2', '1', null);
INSERT INTO `customers` VALUES ('51', 'Saswta guha', 'siliguri', '735001', 'WEST BENGAL', 'MATELLI', '', '98326686514', 'sanjh.matelli@gmail.com', '', '', '', '', null, '2018-05-22 23:13:45', '2018-05-22 23:13:45', null, 'creditor', '1', '2', '1');
INSERT INTO `customers` VALUES ('52', 'surojit das', 'itanagar', '791111', 'ARUNACHAL PRADESH', 'ITANAGAR', '', '', '', '', '', '', '', null, '2018-05-24 01:38:14', '2018-05-24 01:38:14', null, 'debtor', '2', '1', '');
INSERT INTO `customers` VALUES ('53', 'HEMANTA', 'SD INFOTECH', '791111', 'ARUNACHAL PRADESH', 'ITANAGAR', '', '', '', null, null, null, null, null, '2018-05-24 01:39:33', '2018-05-24 01:39:33', null, 'debtor', '2', '1', null);
INSERT INTO `customers` VALUES ('55', 'LOAN FROM JISHU', null, null, null, null, null, null, null, null, null, null, null, null, '2018-05-26 13:48:39', '2018-05-26 13:48:39', null, null, '7', '2', '');
INSERT INTO `customers` VALUES ('56', 'LOAN FROM UDAY', null, null, null, null, null, null, null, null, null, null, null, null, '2018-05-26 13:59:49', '2018-05-27 03:48:59', null, null, '7', '2', '1300000');
INSERT INTO `customers` VALUES ('57', 'DRIVER SAMIN', null, null, null, null, null, null, null, null, null, null, null, null, '2018-05-26 14:05:25', '2018-05-26 14:05:25', null, null, '8', '1', '');
INSERT INTO `customers` VALUES ('58', 'LABOUR BOARD (NEW PROJECT)', 'ITANAGAR', '791111', 'ARUNACHAL PRADESH', 'ITANAGAR', '', '', '', '', '', '', '', null, '2018-05-26 14:08:34', '2018-05-26 14:08:34', null, 'debtor', '2', '1', '');
INSERT INTO `customers` VALUES ('59', 'LOCAL TRANSPORTATION', null, null, null, null, null, null, null, null, null, null, null, null, '2018-05-26 14:22:57', '2018-05-26 14:22:57', null, null, '5', '2', '');
INSERT INTO `customers` VALUES ('60', 'LOAN FROM J SARKAR', null, null, null, null, null, null, null, null, null, null, null, null, '2018-05-26 14:36:39', '2018-05-26 14:36:39', null, null, '7', '2', '500000');
INSERT INTO `customers` VALUES ('61', 'IMC', null, null, null, null, null, null, null, null, null, null, null, null, '2018-05-26 14:39:41', '2018-05-26 14:39:41', null, null, '5', '2', '');
INSERT INTO `customers` VALUES ('62', 'MISCELLANEOUS', null, null, null, null, null, null, null, null, null, null, null, null, '2018-05-26 14:47:52', '2018-05-26 14:47:52', null, null, '5', '2', '');
INSERT INTO `customers` VALUES ('63', 'TOUR', null, null, null, null, null, null, null, null, null, null, null, null, '2018-05-26 14:58:23', '2018-05-26 14:58:23', null, null, '5', '2', '');
INSERT INTO `customers` VALUES ('64', 'AAPSU', null, null, null, null, null, null, null, null, null, null, null, null, '2018-05-26 15:05:08', '2018-05-26 15:05:08', null, null, '6', '2', '');
INSERT INTO `customers` VALUES ('65', 'SCOOTY SERVICING', null, null, null, null, null, null, null, null, null, null, null, null, '2018-05-26 15:16:00', '2018-05-26 15:16:00', null, null, '5', '2', '');
INSERT INTO `customers` VALUES ('66', 'SYNDICATE BANK', null, null, null, null, null, null, null, null, null, null, null, null, '2018-05-26 18:59:27', '2018-05-26 18:59:27', null, null, '4', '1', '');
INSERT INTO `customers` VALUES ('67', 'AXIS BANK', null, null, null, null, null, null, null, null, null, null, null, null, '2018-05-26 18:59:56', '2018-05-26 18:59:56', null, null, '4', '1', '');
INSERT INTO `customers` VALUES ('68', 'OLD PROJECT', null, null, null, null, null, null, null, null, null, null, null, null, '2018-05-27 04:06:09', '2018-05-27 04:07:32', null, null, '5', '2', '');

-- ----------------------------
-- Table structure for `debitnotes`
-- ----------------------------
DROP TABLE IF EXISTS `debitnotes`;
CREATE TABLE `debitnotes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `unique_no` varchar(50) DEFAULT NULL,
  `supplier_id` int(10) unsigned NOT NULL,
  `billing_date` date DEFAULT NULL,
  `desc` varchar(255) DEFAULT NULL,
  `narration` blob,
  `amount` varchar(10) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `total_outstanding` varchar(10) DEFAULT NULL,
  `paid_amount_input` varchar(10) DEFAULT NULL,
  `new_outstanding` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_id` (`supplier_id`) USING BTREE,
  CONSTRAINT `debitnotes_ibfk_1` FOREIGN KEY (`supplier_id`) REFERENCES `customers` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of debitnotes
-- ----------------------------

-- ----------------------------
-- Table structure for `debitnote_bill_session`
-- ----------------------------
DROP TABLE IF EXISTS `debitnote_bill_session`;
CREATE TABLE `debitnote_bill_session` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `session` varchar(7) DEFAULT NULL,
  `startDate` date DEFAULT NULL,
  `closeDate` date DEFAULT NULL,
  `bill` int(11) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of debitnote_bill_session
-- ----------------------------
INSERT INTO `debitnote_bill_session` VALUES ('1', '16-17', '2016-04-01', '2017-03-31', '0', null, '2017-04-03 11:29:33');
INSERT INTO `debitnote_bill_session` VALUES ('2', '17-18', '2017-04-01', '2018-03-31', '0', null, '2017-09-14 21:18:22');
INSERT INTO `debitnote_bill_session` VALUES ('3', '18-19', '2018-04-01', '2019-03-31', '0', null, null);
INSERT INTO `debitnote_bill_session` VALUES ('4', '19-20', '2019-04-01', '2020-03-31', '0', null, null);

-- ----------------------------
-- Table structure for `employee`
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_id` varchar(255) DEFAULT NULL,
  `emp_name` varchar(255) DEFAULT NULL,
  `emp_desg` varchar(255) DEFAULT NULL,
  `emp_type` varchar(255) DEFAULT NULL,
  `emp_doj` varchar(255) DEFAULT NULL,
  `emp_add` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `emp_aadhar` varchar(255) DEFAULT NULL,
  `salary` varchar(255) DEFAULT '0',
  `schedulepay` varchar(255) DEFAULT '0',
  `lastpaydate` date DEFAULT NULL,
  `trueorfalse` varchar(255) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `emp_id` (`emp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of employee
-- ----------------------------
INSERT INTO `employee` VALUES ('1', 'ADWEMP1', 'GOBINDA MAJUMDAR', 'MANAGER', 'Permanent', '2011-11-01', 'NARAYANPUR, JALPAIGURI', '8170008402', 'myphoto481@gmail.com', '', '6250', '0', '2018-04-07', '0', null, null);
INSERT INTO `employee` VALUES ('2', 'ADWEMP2', 'TINKU ALI', 'ASST. MANAGER', 'Permanent', '2014-01-01', 'SEN PARA, JALPAIGURI', '8436228071', 'alitinku06', '', '4000', '0', '2018-04-07', '0', null, null);
INSERT INTO `employee` VALUES ('3', 'ADWEMP3', 'BIJAY GUHA NEOGI', 'STAFF', 'Permanent', '2016-06-01', 'GOMASTOPARA, JALPAIGURI', '9564466836', 'bijoy08967@gmail.com', '', '2500', '0', '2018-04-07', '0', '2018-10-08 16:43:41', '2018-10-08 16:43:41');
INSERT INTO `employee` VALUES ('4', 'ADWEMP4', 'SUMAN GHOSH', 'STAFF', 'Permanent', '2017-03-01', 'GOMASTA PARA, JALPAIGURI', '7586889672', 'sumanghosh80555\"gmail.com', '', '2500', '0', '2017-11-03', '0', null, null);
INSERT INTO `employee` VALUES ('5', 'ADWEMP5', 'MASI', 'CLEANER', 'Permanent', '2007-11-07', 'JAYANTIPARA, JALPAIGURI', '9832329366', '', '', '500', '0', '2018-05-04', '1', null, null);
INSERT INTO `employee` VALUES ('6', 'ADWEMP7', 'SUMAN GHOSH 01', 'STAFF', 'Permanent', '2017-12-07', 'GOMOSTOPARA, JALPAIGURI', '7586889672', '', '', '4000', '0', '2018-04-07', '0', null, null);
INSERT INTO `employee` VALUES ('9', 'ADWEMP8', 'SUROJIT LAHIRI', 'Manager', 'Permanent', '2018-07-05', 'Siliguri', '9832016392', 'surojit@gmail.com', '785412369014', '0', '0', null, '0', '2018-07-05 12:17:41', '2018-07-05 12:17:41');
INSERT INTO `employee` VALUES ('10', 'ADWEMP9', 'Mr. Bikram Basak', 'Zonal Manager', 'Permanent', '2018-07-05', 'Sukanta Pally, Siliguri, Pin - 734006', '85075395105', 'bikrambasak@gmail.com', '785412369015', '0', '0', null, '0', '2018-07-06 17:09:47', '2018-07-06 11:39:47');
INSERT INTO `employee` VALUES ('78', 'T-EMP-ADW-1', 'Rabi (Temp)', null, 'Temporary', null, '', '9652415241', null, null, '0', '0', null, '0', '2018-10-27 13:03:55', '2018-10-27 13:03:55');
INSERT INTO `employee` VALUES ('79', 'T-EMP-ADW-2', 'Sham Saha (Temp)', null, 'Temporary', null, '', '9852365982', null, null, '0', '0', null, '0', '2018-10-27 13:03:57', '2018-10-27 13:03:57');
INSERT INTO `employee` VALUES ('80', 'T-EMP-ADW-3', 'Sanam Lepcha (Temp)', null, 'Temporary', null, 'Darjeeling', '7894236510', null, null, '0', '0', null, '0', '2018-10-27 13:03:59', '2018-10-27 13:03:59');
INSERT INTO `employee` VALUES ('81', 'T-EMP-ADW-4', 'Bipul Pal (Temp)', null, 'Temporary', null, '', '9832668651', null, null, '0', '0', null, '0', '2018-10-27 13:04:01', '2018-10-27 13:04:01');
INSERT INTO `employee` VALUES ('91', 'T-EMP-ADW-5', 'sanjay lohar (Temp)', null, 'Temporary', null, '', '7894236510', null, null, '0', '0', null, '0', '2018-10-27 13:04:03', '2018-10-27 13:04:03');
INSERT INTO `employee` VALUES ('92', 'T-EMP-ADW-6', 'Bipul Pal (Temp)', null, 'Temporary', null, '', '9874563210', null, null, '0', '0', null, '0', '2018-10-27 13:04:05', '2018-10-27 13:04:05');
INSERT INTO `employee` VALUES ('100', 'T-EMP-ADW-7', 'khochwari (Temp)', null, 'Temporary', null, '', '9652415241', null, null, '0', '0', null, '0', '2018-10-27 13:04:11', '2018-10-27 13:04:11');
INSERT INTO `employee` VALUES ('101', 'T-EMP-ADW-8', 'xxxx (Temp)', null, 'Temporary', null, '', '9874563210', null, null, '0', '0', null, '0', '2018-10-27 13:04:13', '2018-10-27 13:04:13');
INSERT INTO `employee` VALUES ('102', 'T-EMP-ADW-9', 'Raja Ghosh (Temp)', null, 'Temporary', null, 'jalpaiguri', '4545554555', null, null, '0', '0', null, '0', '2018-10-27 13:04:16', '2018-10-27 13:04:16');
INSERT INTO `employee` VALUES ('103', 'T-EMP-ADW-10', 'Kamal Prasad (Temp)', null, 'Temporary', null, 'Jalpaiguri', '8742103695', null, null, '0', '0', null, '0', '2018-10-27 07:31:41', '2018-10-27 07:31:41');
INSERT INTO `employee` VALUES ('104', 'T-EMP-ADW-11', 'xyz (Temp)', null, 'Temporary', null, '', '7852921023', null, null, '0', '0', null, '0', '2018-10-27 08:08:22', '2018-10-27 08:08:22');
INSERT INTO `employee` VALUES ('105', 'T-EMP-ADW-12', 'SAdASD (Temp)', null, 'Temporary', null, '', '9832098320', null, null, '0', '0', null, '0', '2018-10-27 08:28:38', '2018-10-27 08:28:38');
INSERT INTO `employee` VALUES ('106', 'T-EMP-ADW-13', 'sujon sarkar (Temp)', null, 'Temporary', null, '', '65465465465', null, null, '0', '0', null, '0', '2018-10-27 08:37:34', '2018-10-27 08:37:34');
INSERT INTO `employee` VALUES ('107', 'ADWEMP10', 'Prince', 'DeVELOPER', 'Temporary', '2019-02-15', 'Siliguri', '1234567890', 'prince@gmail.com', '', '0', '0', null, '0', '2019-02-19 11:40:14', '2019-02-19 06:10:14');

-- ----------------------------
-- Table structure for `expenses`
-- ----------------------------
DROP TABLE IF EXISTS `expenses`;
CREATE TABLE `expenses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `unique_id` varchar(50) DEFAULT NULL,
  `exp_date` date DEFAULT NULL,
  `exp_type_id` int(11) DEFAULT NULL,
  `exp_amount` int(11) DEFAULT '0',
  `payment_type` varchar(30) DEFAULT NULL,
  `exp_description` varchar(255) DEFAULT NULL,
  `status` tinyint(4) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `expenses_ibfk_1` (`exp_type_id`),
  CONSTRAINT `expenses_ibfk_1` FOREIGN KEY (`exp_type_id`) REFERENCES `expenses_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3107 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of expenses
-- ----------------------------
INSERT INTO `expenses` VALUES ('2', null, '2017-04-05', '2', '10', null, 'LEBU LANKA', '1', null, null);
INSERT INTO `expenses` VALUES ('3', null, '2017-04-05', '2', '250', null, 'RUBER STAMP - PART PAYMENT', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('4', null, '2017-04-05', '4', '90', null, '3 DAYS', '1', null, null);
INSERT INTO `expenses` VALUES ('5', null, '2017-04-05', '2', '1100', null, 'PAINT (WALL) - OFFICE ROOM', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('6', null, '2017-04-05', '2', '350', null, 'PAINTER - OFFICE ROOM', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('7', null, '2017-04-05', '7', '180', null, 'PAINTING & CLEANING', '1', null, null);
INSERT INTO `expenses` VALUES ('8', null, '2017-04-05', '8', '1050', null, 'HINDUSTHAN - 50 WALT LED LIGHT', '1', null, null);
INSERT INTO `expenses` VALUES ('9', null, '2017-04-05', '4', '30', null, '1 DAY', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('10', null, '2017-04-05', '10', '50', null, '10 CUP', '1', null, null);
INSERT INTO `expenses` VALUES ('11', null, '2017-04-06', '10', '45', null, '9 CUP', '1', '2018-06-06 12:50:18', '2018-06-06 12:50:18');
INSERT INTO `expenses` VALUES ('12', null, '2017-04-06', '2', '10', null, '', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('13', null, '2017-04-06', '4', '30', null, '1 DAY', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('14', null, '2017-04-06', '7', '180', null, 'DINER', '1', '2018-06-06 12:47:55', '2018-06-06 12:47:55');
INSERT INTO `expenses` VALUES ('15', null, '2017-04-06', '2', '600', null, 'RAM NAWAMI - TINKU DASAKARMA BHANDAR', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('16', null, '2017-04-06', '7', '300', null, 'RAMNAWAMI LUNCH PREPARATION', '1', '2018-06-06 12:47:55', '2018-06-06 12:47:55');
INSERT INTO `expenses` VALUES ('17', null, '2017-04-06', '2', '50', null, 'TINKU', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('18', null, '2017-04-06', '7', '560', null, 'RAM NAWAMI DINER', '1', '2018-06-06 12:47:55', '2018-06-06 12:47:55');
INSERT INTO `expenses` VALUES ('19', null, '2017-04-06', '2', '400', null, 'RAM NAWAMI - PANDIT JEE & OTHERS', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('20', null, '2017-04-06', '2', '1800', null, 'RAM NAWAMI - DHAKA MISTI DUKAN', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('21', null, '2017-04-06', '21', '200', null, 'DEPOSIT 05.04.2017', '1', null, null);
INSERT INTO `expenses` VALUES ('22', null, '2017-04-06', '8', '400', null, 'SAMAR DA SERVICE AND WIRE', '1', '2018-06-06 12:48:34', '2018-06-06 12:48:34');
INSERT INTO `expenses` VALUES ('23', null, '2017-04-06', '7', '60', null, 'LUNCH', '1', '2018-06-06 12:47:55', '2018-06-06 12:47:55');
INSERT INTO `expenses` VALUES ('24', null, '2017-04-06', '10', '40', null, '', '1', '2018-06-06 12:50:18', '2018-06-06 12:50:18');
INSERT INTO `expenses` VALUES ('25', null, '2017-04-06', '40', '10', null, 'TOTO - TINKU FAIR', '1', '2018-06-06 13:07:24', '2018-06-06 13:07:24');
INSERT INTO `expenses` VALUES ('26', null, '2017-04-06', '7', '300', null, 'MOMO FRY  7 HALF', '1', '2018-06-06 12:47:55', '2018-06-06 12:47:55');
INSERT INTO `expenses` VALUES ('27', null, '2017-04-07', '105', '280', null, '', '1', '2018-06-06 13:24:19', '2018-06-06 13:24:19');
INSERT INTO `expenses` VALUES ('28', null, '2017-04-07', '10', '75', null, '15  CUP', '1', '2018-06-06 12:50:18', '2018-06-06 12:50:18');
INSERT INTO `expenses` VALUES ('29', null, '2017-04-08', '21', '200', null, '', '1', '2018-06-06 12:53:42', '2018-06-06 12:53:42');
INSERT INTO `expenses` VALUES ('30', null, '2017-04-08', '2', '20', null, 'DAN', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('31', null, '2017-04-08', '4', '30', null, '1 DAY', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('32', null, '2017-04-08', '7', '60', null, '', '1', '2018-06-06 12:47:55', '2018-06-06 12:47:55');
INSERT INTO `expenses` VALUES ('33', null, '2017-04-10', '8', '80', null, '3 PIN PLUG', '1', '2018-06-06 12:48:34', '2018-06-06 12:48:34');
INSERT INTO `expenses` VALUES ('34', null, '2017-04-10', '7', '200', null, 'FISH ', '1', '2018-06-06 12:47:55', '2018-06-06 12:47:55');
INSERT INTO `expenses` VALUES ('35', null, '2017-04-10', '7', '500', null, 'MOTTON ', '1', '2018-06-06 12:47:55', '2018-06-06 12:47:55');
INSERT INTO `expenses` VALUES ('36', null, '2017-04-10', '10', '30', null, '6 CUP', '1', '2018-06-06 12:50:18', '2018-06-06 12:50:18');
INSERT INTO `expenses` VALUES ('37', null, '2017-04-11', '7', '50', null, 'GOBINDA', '1', '2018-06-06 12:47:55', '2018-06-06 12:47:55');
INSERT INTO `expenses` VALUES ('38', null, '2017-04-11', '4', '60', null, '2 DAY', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('39', null, '2017-04-11', '10', '35', null, '', '1', '2018-06-06 12:50:18', '2018-06-06 12:50:18');
INSERT INTO `expenses` VALUES ('40', null, '2017-04-12', '40', '80', null, 'TOTO- FOOD', '1', null, null);
INSERT INTO `expenses` VALUES ('41', null, '2017-04-12', '10', '35', null, '7 cup', '1', '2018-06-06 12:50:18', '2018-06-06 12:50:18');
INSERT INTO `expenses` VALUES ('42', null, '2017-04-12', '21', '200', null, '', '1', '2018-06-06 12:53:42', '2018-06-06 12:53:42');
INSERT INTO `expenses` VALUES ('43', null, '2017-04-12', '43', '657', null, 'DATE 05.04.17 TO 11.04.2017', '1', null, null);
INSERT INTO `expenses` VALUES ('44', null, '2017-04-12', '4', '30', null, '1 DAY', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('45', null, '2017-04-13', '2', '202', null, 'NAPKIN 2PKD, 1 PKD TISHU, 1 PKD NAPKIN', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('46', null, '2017-04-13', '10', '65', null, '13 CUP', '1', '2018-06-06 12:50:18', '2018-06-06 12:50:18');
INSERT INTO `expenses` VALUES ('47', null, '2017-04-13', '2', '114', null, 'BATTERY & PAPER', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('48', null, '2017-04-13', '48', '30', null, '', '1', null, null);
INSERT INTO `expenses` VALUES ('49', null, '2017-04-14', '21', '200', null, 'CADIT', '1', '2018-06-06 12:53:42', '2018-06-06 12:53:42');
INSERT INTO `expenses` VALUES ('50', null, '2017-04-14', '7', '60', null, 'TINKU', '1', '2018-06-06 12:47:55', '2018-06-06 12:47:55');
INSERT INTO `expenses` VALUES ('51', null, '2017-04-14', '51', '320', null, 'BHOUMICK 200 PCS.', '1', null, null);
INSERT INTO `expenses` VALUES ('52', null, '2017-04-14', '7', '50', null, 'GOBINDO', '1', '2018-06-06 12:47:55', '2018-06-06 12:47:55');
INSERT INTO `expenses` VALUES ('53', null, '2017-04-15', '2', '10', null, 'LEBU LANKA', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('54', null, '2017-04-15', '2', '10', null, 'DAN', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('55', null, '2017-04-15', '43', '200', null, '', '1', '2018-06-06 13:08:23', '2018-06-06 13:08:23');
INSERT INTO `expenses` VALUES ('56', null, '2017-04-15', '2', '25', null, 'DAN', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('57', null, '2017-04-15', '4', '60', null, '2 day', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('58', null, '2017-04-17', '58', '300', null, 'RANJIT DA  ( COMPUTER )', '1', null, null);
INSERT INTO `expenses` VALUES ('59', null, '2017-04-17', '40', '200', null, 'GOBINDA - SILIGURI BUS VARA', '1', '2018-06-06 13:07:24', '2018-06-06 13:07:24');
INSERT INTO `expenses` VALUES ('60', null, '2017-04-17', '7', '60', null, 'TINKU', '1', '2018-06-06 12:47:55', '2018-06-06 12:47:55');
INSERT INTO `expenses` VALUES ('61', null, '2017-04-17', '10', '45', null, '9 cup', '1', '2018-06-06 12:50:18', '2018-06-06 12:50:18');
INSERT INTO `expenses` VALUES ('62', null, '2017-04-17', '62', '5000', null, 'TUSHAR SARKAR -  FARE FOR PRE WEDDING - ASHMITA', '1', null, null);
INSERT INTO `expenses` VALUES ('63', null, '2017-04-18', '43', '26', null, '2 DVD ', '1', '2018-06-06 13:08:23', '2018-06-06 13:08:23');
INSERT INTO `expenses` VALUES ('64', null, '2017-04-18', '10', '40', null, '8 CUP', '1', '2018-06-06 12:50:18', '2018-06-06 12:50:18');
INSERT INTO `expenses` VALUES ('65', null, '2017-04-19', '7', '60', null, 'SUMAN FOOD COST\r\n', '1', '2018-06-06 12:47:55', '2018-06-06 12:47:55');
INSERT INTO `expenses` VALUES ('66', null, '2017-04-19', '21', '200', null, '', '1', '2018-06-06 12:53:42', '2018-06-06 12:53:42');
INSERT INTO `expenses` VALUES ('67', null, '2017-04-19', '67', '60', null, 'CHOTTO - PETROL', '1', null, null);
INSERT INTO `expenses` VALUES ('68', null, '2017-04-19', '7', '50', null, 'TINKU', '1', '2018-06-06 12:47:55', '2018-06-06 12:47:55');
INSERT INTO `expenses` VALUES ('69', null, '2017-04-19', '2', '30', null, '2 CD 1 BLACK BOX', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('70', null, '2017-04-19', '10', '50', null, '9 CUP', '1', '2018-06-06 12:50:18', '2018-06-06 12:50:18');
INSERT INTO `expenses` VALUES ('72', null, '2017-04-20', '4', '180', null, '6 DAY\r\n', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('73', null, '2017-04-20', '7', '60', null, 'TINKU', '1', '2018-06-06 12:47:55', '2018-06-06 12:47:55');
INSERT INTO `expenses` VALUES ('74', null, '2017-04-20', '43', '65', null, '15-4 to 20-4', '1', '2018-06-06 13:08:23', '2018-06-06 13:08:23');
INSERT INTO `expenses` VALUES ('75', null, '2017-04-21', '75', '70', null, 'BAPPA - 2 DAY tinku sumon\r\ngobi sumon ', '1', null, null);
INSERT INTO `expenses` VALUES ('76', null, '2017-04-21', '4', '30', null, '', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('77', null, '2017-04-21', '8', '100', null, '3PIN PLUG', '1', '2018-06-06 12:48:34', '2018-06-06 12:48:34');
INSERT INTO `expenses` VALUES ('78', null, '2017-04-22', '2', '21', null, 'DAAN', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('79', null, '2017-04-22', '4', '30', null, '1 DAY', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('80', null, '2017-04-22', '7', '120', null, '', '1', '2018-06-06 12:47:55', '2018-06-06 12:47:55');
INSERT INTO `expenses` VALUES ('81', null, '2017-04-22', '43', '20', null, '', '1', '2018-06-06 13:08:23', '2018-06-06 13:08:23');
INSERT INTO `expenses` VALUES ('82', null, '2017-04-24', '40', '50', null, 'TOTO - SUMAN', '1', '2018-06-06 13:07:24', '2018-06-06 13:07:24');
INSERT INTO `expenses` VALUES ('83', null, '2017-04-24', '7', '70', null, '', '1', '2018-06-06 12:47:55', '2018-06-06 12:47:55');
INSERT INTO `expenses` VALUES ('84', null, '2017-04-24', '7', '180', null, '2DAY', '1', '2018-06-06 12:47:55', '2018-06-06 12:47:55');
INSERT INTO `expenses` VALUES ('85', null, '2017-04-24', '7', '100', null, 'GOBINDA', '1', '2018-06-06 13:19:06', '2018-06-06 13:19:06');
INSERT INTO `expenses` VALUES ('86', null, '2017-04-24', '67', '100', null, 'GOBINDA', '1', '2018-06-06 13:17:03', '2018-06-06 13:17:03');
INSERT INTO `expenses` VALUES ('87', null, '2017-04-25', '21', '200', null, '', '1', '2018-06-06 12:53:42', '2018-06-06 12:53:42');
INSERT INTO `expenses` VALUES ('88', null, '2017-04-25', '88', '1092', null, 'MONTH OF APRIL', '1', null, null);
INSERT INTO `expenses` VALUES ('89', null, '2017-04-26', '4', '100', null, '3 DAYS + 10', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('90', null, '2017-04-26', '43', '13', null, '1 PC', '1', '2018-06-06 13:08:23', '2018-06-06 13:08:23');
INSERT INTO `expenses` VALUES ('91', null, '2017-04-27', '4', '30', null, '', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('92', null, '2017-04-28', '21', '200', null, '', '1', '2018-06-06 12:53:42', '2018-06-06 12:53:42');
INSERT INTO `expenses` VALUES ('93', null, '2017-04-28', '40', '60', null, 'TOTO - TINKU', '1', '2018-06-06 13:07:24', '2018-06-06 13:07:24');
INSERT INTO `expenses` VALUES ('94', null, '2017-04-29', '2', '10', null, 'LEBU LANKA', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('95', null, '2017-04-29', '7', '60', null, 'GOBINDA', '1', '2018-06-06 12:47:55', '2018-06-06 12:47:55');
INSERT INTO `expenses` VALUES ('96', null, '2017-04-29', '43', '30', null, 'CHATU', '1', '2018-06-06 13:08:23', '2018-06-06 13:08:23');
INSERT INTO `expenses` VALUES ('97', null, '2017-04-29', '4', '60', null, '2DAY', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('98', null, '2017-04-29', '43', '196', null, '', '1', '2018-06-06 13:08:23', '2018-06-06 13:08:23');
INSERT INTO `expenses` VALUES ('99', null, '2017-04-29', '10', '370', null, '20 TO 29  = 74 CUP', '1', '2018-06-06 12:50:18', '2018-06-06 12:50:18');
INSERT INTO `expenses` VALUES ('100', null, '2017-05-01', '40', '40', null, 'TOTO', '1', '2018-06-06 13:07:24', '2018-06-06 13:07:24');
INSERT INTO `expenses` VALUES ('101', null, '2017-05-02', '2', '95', null, 'BAG', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('102', null, '2017-05-02', '7', '60', null, '', '1', '2018-06-06 12:47:55', '2018-06-06 12:47:55');
INSERT INTO `expenses` VALUES ('103', null, '2017-05-02', '4', '90', null, '3DAY', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('104', null, '2017-05-02', '104', '4500', null, 'MONTH OF APRIL 17', '1', null, null);
INSERT INTO `expenses` VALUES ('105', null, '2017-05-03', '105', '220', null, '11 BOTTLE', '1', null, null);
INSERT INTO `expenses` VALUES ('106', null, '2017-05-03', '2', '20', null, 'COVER FILE', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('107', null, '2017-04-01', '104', '4500', null, 'MONTH OF MARCH', '1', '2018-06-06 13:23:52', '2018-06-06 13:23:52');
INSERT INTO `expenses` VALUES ('108', null, '2017-05-03', '7', '50', null, '', '1', '2018-06-06 12:47:55', '2018-06-06 12:47:55');
INSERT INTO `expenses` VALUES ('109', null, '2017-05-03', '4', '30', null, '1 DAY', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('110', null, '2017-05-04', '4', '30', null, '1 DAY', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('111', null, '2017-05-04', '2', '10', null, 'DAN', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('112', null, '2017-05-04', '40', '200', null, 'GOBINDA SILIGURI ', '1', '2018-06-06 13:07:24', '2018-06-06 13:07:24');
INSERT INTO `expenses` VALUES ('113', null, '2017-05-04', '40', '20', null, 'TINKU & SUMAN TOTO', '1', '2018-06-06 13:07:24', '2018-06-06 13:07:24');
INSERT INTO `expenses` VALUES ('114', null, '2017-05-05', '7', '60', null, 'TINKU', '1', '2018-06-06 12:47:55', '2018-06-06 12:47:55');
INSERT INTO `expenses` VALUES ('115', null, '2017-05-05', '21', '200', null, '', '1', '2018-06-06 12:53:42', '2018-06-06 12:53:42');
INSERT INTO `expenses` VALUES ('116', null, '2017-05-06', '8', '120', null, '3 PIN SOCKET 4, PLUG 2', '1', '2018-06-06 12:48:34', '2018-06-06 12:48:34');
INSERT INTO `expenses` VALUES ('117', null, '2017-05-06', '43', '132', null, '01 - 06 may', '1', '2018-06-06 13:08:23', '2018-06-06 13:08:23');
INSERT INTO `expenses` VALUES ('118', null, '2017-05-06', '2', '10', null, 'LEBU LANKA', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('119', null, '2017-05-06', '2', '20', null, 'DAAN', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('120', null, '2017-05-08', '7', '60', null, 'TINKU\r\n', '1', '2018-06-06 12:47:55', '2018-06-06 12:47:55');
INSERT INTO `expenses` VALUES ('121', null, '2017-05-08', '2', '30', null, 'COMPUTER  DESIGN FROM (AMIT- BOTOL) ', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('122', null, '2017-05-09', '40', '50', null, 'TINKU (MAINAGURI )', '1', '2018-06-06 13:07:24', '2018-06-06 13:07:24');
INSERT INTO `expenses` VALUES ('123', null, '2017-05-09', '7', '60', null, 'TINKU', '1', '2018-07-18 12:50:25', '2018-07-18 12:50:25');
INSERT INTO `expenses` VALUES ('125', null, '2017-05-09', '2', '90', null, 'BILL COVER FILE', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('126', null, '2017-05-09', '10', '10', null, 'TINKU', '1', '2018-06-06 12:50:18', '2018-06-06 12:50:18');
INSERT INTO `expenses` VALUES ('127', null, '2017-05-10', '21', '200', null, '', '1', '2018-06-06 12:53:42', '2018-06-06 12:53:42');
INSERT INTO `expenses` VALUES ('128', null, '2017-05-10', '7', '60', null, '', '1', '2018-06-06 12:47:55', '2018-06-06 12:47:55');
INSERT INTO `expenses` VALUES ('129', null, '2017-05-11', '40', '70', null, 'MAYNAGURI WEDDING (GOBI SUMAN)', '1', '2018-06-06 13:07:24', '2018-06-06 13:07:24');
INSERT INTO `expenses` VALUES ('130', null, '2017-05-11', '7', '325', null, 'LAUNCH DINNER BREAKFAST TEA (GOBI SUMAN TINKU)', '1', '2018-06-06 12:47:55', '2018-06-06 12:47:55');
INSERT INTO `expenses` VALUES ('131', null, '2017-05-11', '4', '210', null, '7DAY', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('132', null, '2017-05-12', '40', '10', null, 'GOBI', '1', '2018-06-06 13:07:24', '2018-06-06 13:07:24');
INSERT INTO `expenses` VALUES ('133', null, '2017-05-12', '4', '30', null, '', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('134', null, '2017-05-12', '21', '200', null, '', '1', '2018-06-06 12:53:42', '2018-06-06 12:53:42');
INSERT INTO `expenses` VALUES ('135', null, '2017-05-12', '43', '20', null, 'DVD ( BABU SAHA ) DOKAN', '1', '2018-06-06 13:08:23', '2018-06-06 13:08:23');
INSERT INTO `expenses` VALUES ('136', null, '2017-05-12', '43', '56', null, '8-5-17 TO 11-5-17', '1', '2018-06-06 13:08:23', '2018-06-06 13:08:23');
INSERT INTO `expenses` VALUES ('137', null, '2017-05-13', '40', '200', null, 'GOBINDA SILIGURI ', '1', '2018-06-06 13:07:24', '2018-06-06 13:07:24');
INSERT INTO `expenses` VALUES ('138', null, '2017-05-13', '4', '30', null, '', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('139', null, '2017-05-13', '10', '30', null, '', '1', '2018-06-06 12:50:18', '2018-06-06 12:50:18');
INSERT INTO `expenses` VALUES ('140', null, '2017-05-13', '2', '23', null, 'DAN', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('141', null, '2017-05-13', '7', '80', null, 'DINER', '1', '2018-06-06 12:47:55', '2018-06-06 12:47:55');
INSERT INTO `expenses` VALUES ('142', null, '2017-05-13', '2', '10', null, 'LABU LANKA', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2017', null, '2017-04-04', '21', '200', null, 'DEPOSIT', '1', '2018-06-06 12:53:42', '2018-06-06 12:53:42');
INSERT INTO `expenses` VALUES ('2018', null, '2017-05-13', '7', '500', null, 'GOBI + SUMAN + DEBU  {DINNER}', '1', '2018-06-06 12:47:55', '2018-06-06 12:47:55');
INSERT INTO `expenses` VALUES ('2019', null, '2017-05-16', '21', '200', null, 'DEPOSIT', '1', '2018-06-06 12:53:42', '2018-06-06 12:53:42');
INSERT INTO `expenses` VALUES ('2020', null, '2017-05-16', '10', '300', null, '59 CUP ', '1', '2018-06-06 12:50:18', '2018-06-06 12:50:18');
INSERT INTO `expenses` VALUES ('2021', null, '2017-05-16', '75', '150', null, 'MANCHAY 3 PL MOMO', '1', '2018-06-06 13:18:03', '2018-06-06 13:18:03');
INSERT INTO `expenses` VALUES ('2022', null, '2017-05-16', '8', '1300', null, 'ELECTRCK TEA KATLY', '1', '2018-06-06 12:48:34', '2018-06-06 12:48:34');
INSERT INTO `expenses` VALUES ('2023', null, '2017-05-17', '40', '10', null, '', '1', '2018-06-06 13:07:24', '2018-06-06 13:07:24');
INSERT INTO `expenses` VALUES ('2024', null, '2017-05-17', '2', '10', null, '', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2025', null, '2017-05-18', '4', '90', null, '15,16,18 \r\n3 DAY', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('2026', null, '2017-05-18', '43', '230', null, '', '1', '2018-06-06 13:08:23', '2018-06-06 13:08:23');
INSERT INTO `expenses` VALUES ('2027', null, '2017-05-19', '2', '1300', null, 'NEWS PAPER FULL PAID 19.05.2017', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2028', null, '2017-05-19', '2', '280', null, 'BILLING PAPER AND OTHERS PAPER', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2029', null, '2017-05-19', '4', '30', null, '', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('2030', null, '2017-05-19', '7', '60', null, 'TINKU', '1', '2018-06-06 12:47:55', '2018-06-06 12:47:55');
INSERT INTO `expenses` VALUES ('2031', null, '2017-05-19', '2', '500', null, 'BACCHU HOTEL (SKY WORLD)', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2032', null, '2017-05-20', '4', '30', null, '', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('2033', null, '2017-05-20', '43', '52', null, '', '1', '2018-06-06 13:08:23', '2018-06-06 13:08:23');
INSERT INTO `expenses` VALUES ('2034', null, '2017-05-20', '2', '10', null, 'DAAS', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2035', null, '2017-05-22', '40', '80', null, 'TOTO VARA GOBI', '1', '2018-06-06 13:07:24', '2018-06-06 13:07:24');
INSERT INTO `expenses` VALUES ('2036', null, '2017-05-23', '21', '200', null, '', '1', '2018-06-06 12:53:42', '2018-06-06 12:53:42');
INSERT INTO `expenses` VALUES ('2037', null, '2017-05-23', '40', '140', null, '30+20+30+30+30 SUMAN CHOTU GOBI \r\nASHMITA WEDDING TOTO VARA', '1', '2018-06-06 13:07:24', '2018-06-06 13:07:24');
INSERT INTO `expenses` VALUES ('2038', null, '2017-05-23', '4', '90', null, '3DAY', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('2039', null, '2017-05-23', '40', '20', null, 'TINKU AND BIJOY \r\n', '1', '2018-06-06 13:07:24', '2018-06-06 13:07:24');
INSERT INTO `expenses` VALUES ('2040', null, '2017-05-24', '2', '20', null, 'BUS FAIR .. ELLORA ', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2041', null, '2017-05-24', '40', '40', null, 'SUMAN ', '1', '2018-06-06 13:07:24', '2018-06-06 13:07:24');
INSERT INTO `expenses` VALUES ('2042', null, '2017-05-24', '4', '30', null, '', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('2043', null, '2017-05-24', '51', '320', null, 'A CARD ', '1', '2018-06-06 13:10:49', '2018-06-06 13:10:49');
INSERT INTO `expenses` VALUES ('2044', null, '2017-05-25', '4', '30', null, '', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('2045', null, '2017-05-26', '4', '30', null, '', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('2046', null, '2017-05-26', '88', '1092', null, 'MONTH OF MAY', '1', '2018-06-06 13:20:01', '2018-06-06 13:20:01');
INSERT INTO `expenses` VALUES ('2047', null, '2017-05-26', '43', '95', null, '', '1', '2018-06-06 13:08:23', '2018-06-06 13:08:23');
INSERT INTO `expenses` VALUES ('2048', null, '2017-05-27', '21', '200', null, '', '1', '2018-06-06 12:53:42', '2018-06-06 12:53:42');
INSERT INTO `expenses` VALUES ('2049', null, '2017-05-27', '2', '10', null, 'LABU', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2050', null, '2017-05-27', '4', '30', null, '', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('2051', null, '2017-05-27', '2', '20', null, 'DAN\r\n', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2052', null, '2017-05-27', '43', '87', null, 'HIT', '1', '2018-06-06 13:08:23', '2018-06-06 13:08:23');
INSERT INTO `expenses` VALUES ('2053', null, '2017-05-29', '4', '30', null, '', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('2054', null, '2017-05-29', '7', '60', null, 'TINKU', '1', '2018-06-06 12:47:55', '2018-06-06 12:47:55');
INSERT INTO `expenses` VALUES ('2055', null, '2017-05-27', '2', '300', null, 'BACHHU HOTEL (IMPULS)', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2056', null, '2017-05-30', '4', '30', null, '', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('2057', null, '2017-05-30', '21', '200', null, '', '1', '2018-06-06 12:53:42', '2018-06-06 12:53:42');
INSERT INTO `expenses` VALUES ('2058', null, '2017-05-30', '43', '85', null, 'FULL PAID', '1', '2018-06-06 13:08:23', '2018-06-06 13:08:23');
INSERT INTO `expenses` VALUES ('2059', null, '2017-05-31', '2', '50', null, 'Flex Quick GUM', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2060', null, '2017-05-31', '4', '30', null, '', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('2061', null, '2017-06-01', '2', '95', null, 'FINAIL, BLICHING POUDER, MUCHI (BAG)', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2062', null, '2017-06-01', '21', '200', null, 'credited', '1', '2018-06-06 12:53:42', '2018-06-06 12:53:42');
INSERT INTO `expenses` VALUES ('2063', null, '2017-06-01', '4', '30', null, 'ONE DAY\r\n', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('2064', null, '2017-06-01', '104', '4500', null, 'MOTH OF MAY', '1', '2018-06-06 13:23:52', '2018-06-06 13:23:52');
INSERT INTO `expenses` VALUES ('2065', null, '2017-06-02', '43', '10', null, '', '1', '2018-06-06 13:08:23', '2018-06-06 13:08:23');
INSERT INTO `expenses` VALUES ('2066', null, '2017-06-02', '105', '180', null, '', '1', '2018-06-06 13:24:19', '2018-06-06 13:24:19');
INSERT INTO `expenses` VALUES ('2067', null, '2017-06-02', '4', '30', null, '', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('2068', null, '2017-06-03', '2', '10', null, 'LABU\r\n', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2069', null, '2017-06-03', '4', '30', null, 'NONE DAY', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('2070', null, '2017-06-03', '2', '50', null, 'food (S,T,B,P,D ) SOBAI ', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2071', null, '2017-06-03', '2', '30', null, 'DAM', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2072', null, '2017-06-03', '21', '200', null, '', '1', '2018-06-06 12:53:42', '2018-06-06 12:53:42');
INSERT INTO `expenses` VALUES ('2073', null, '2017-06-06', '21', '200', null, '', '1', '2018-06-06 12:53:42', '2018-06-06 12:53:42');
INSERT INTO `expenses` VALUES ('2074', null, '2017-06-06', '8', '2590', null, 'WAL FAN, LIGHT', '1', '2018-06-06 12:48:34', '2018-06-06 12:48:34');
INSERT INTO `expenses` VALUES ('2075', null, '2017-06-06', '4', '60', null, '2DAY', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('2076', null, '2017-06-06', '7', '40', null, 'GOBINDA', '1', '2018-06-06 12:47:55', '2018-06-06 12:47:55');
INSERT INTO `expenses` VALUES ('2077', null, '2017-06-06', '40', '70', null, 'TOTO (GOBI & TINKU)', '1', '2018-06-06 13:07:24', '2018-06-06 13:07:24');
INSERT INTO `expenses` VALUES ('2078', null, '2017-06-06', '7', '70', null, 'GOBI DINER ', '1', '2018-06-06 12:47:55', '2018-06-06 12:47:55');
INSERT INTO `expenses` VALUES ('2079', null, '2017-06-06', '43', '200', null, '', '1', '2018-06-06 13:08:23', '2018-06-06 13:08:23');
INSERT INTO `expenses` VALUES ('2080', null, '2017-06-06', '2855', '1000', null, 'COLLEGE ADMISSON CAMP, PARK ER MORE, JALPAIGURI, 06/06/2017', '1', '2018-06-06 14:10:58', '2018-06-06 14:10:58');
INSERT INTO `expenses` VALUES ('2081', null, '2017-06-08', '8', '38', null, 'MALE - FEMALE  AND 2mit wear', '1', '2018-06-06 12:48:34', '2018-06-06 12:48:34');
INSERT INTO `expenses` VALUES ('2082', null, '2017-06-08', '40', '80', null, 'TOTO (ANNAPRASHON POLICE LINE)', '1', '2018-06-06 13:07:24', '2018-06-06 13:07:24');
INSERT INTO `expenses` VALUES ('2083', null, '2017-06-08', '7', '50', null, 'GOBINDA LAUNCH ', '1', '2018-06-06 12:47:55', '2018-06-06 12:47:55');
INSERT INTO `expenses` VALUES ('2084', null, '2017-06-08', '4', '60', null, '2DAY', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('2085', null, '2017-06-09', '40', '50', null, 'CHOTU (OIL)', '1', '2018-06-06 13:07:24', '2018-06-06 13:07:24');
INSERT INTO `expenses` VALUES ('2086', null, '2017-06-09', '4', '30', null, '1 day', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('2087', null, '2017-06-09', '2', '30', null, 'gbt food', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2088', null, '2017-06-10', '2', '10', null, 'LABU ', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2089', null, '2017-06-09', '21', '200', null, '', '1', '2018-06-06 12:53:42', '2018-06-06 12:53:42');
INSERT INTO `expenses` VALUES ('2090', null, '2017-06-09', '10', '25', null, '', '1', '2018-06-06 12:50:18', '2018-06-06 12:50:18');
INSERT INTO `expenses` VALUES ('2091', null, '2017-06-10', '4', '30', null, '1 day', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('2092', null, '2017-06-10', '40', '300', null, 'BIRPARA ( GOBI/ SUMAN)', '1', '2018-06-06 13:07:24', '2018-06-06 13:07:24');
INSERT INTO `expenses` VALUES ('2093', null, '2017-06-12', '8', '5325', null, 'ELECTRICITY BILL ', '1', '2018-06-06 12:48:34', '2018-06-06 12:48:34');
INSERT INTO `expenses` VALUES ('2094', null, '2017-06-12', '4', '30', null, '1 day', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('2095', null, '2017-06-12', '43', '62', null, '', '1', '2018-06-06 13:08:23', '2018-06-06 13:08:23');
INSERT INTO `expenses` VALUES ('2096', null, '2017-06-13', '4', '30', null, '1 day', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('2097', null, '2017-06-13', '2', '10', null, 'MASI\r\n', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2098', null, '2017-06-14', '2', '70', null, 'CELLO TAP/BLADE ', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2099', null, '2017-06-14', '10', '20', null, '4 cup', '1', '2018-06-06 12:50:18', '2018-06-06 12:50:18');
INSERT INTO `expenses` VALUES ('2100', null, '2017-06-14', '4', '30', null, '', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('2101', null, '2017-06-15', '2', '80', null, 'TISHU/CELLO TAP', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2102', null, '2017-06-15', '21', '200', null, '', '1', '2018-06-06 12:53:42', '2018-06-06 12:53:42');
INSERT INTO `expenses` VALUES ('2103', null, '2017-06-15', '4', '30', null, '', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('2104', null, '2017-06-16', '10', '25', null, '5 cup', '1', '2018-06-06 12:50:18', '2018-06-06 12:50:18');
INSERT INTO `expenses` VALUES ('2105', null, '2017-06-16', '4', '30', null, '1 day', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('2106', null, '2017-06-16', '43', '79', null, '', '1', '2018-06-06 13:08:23', '2018-06-06 13:08:23');
INSERT INTO `expenses` VALUES ('2107', null, '2017-06-17', '2', '10', null, 'LABU LANKA', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2108', null, '2017-06-17', '21', '200', null, '', '1', '2018-06-06 12:53:42', '2018-06-06 12:53:42');
INSERT INTO `expenses` VALUES ('2109', null, '2017-06-17', '2', '20', null, 'DAN', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2110', null, '2017-06-17', '4', '30', null, '', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('2111', null, '2017-06-17', '40', '200', null, 'GOBINDA SILIGURI', '1', '2018-06-06 13:07:24', '2018-06-06 13:07:24');
INSERT INTO `expenses` VALUES ('2112', null, '2017-06-17', '4', '30', null, '', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('2113', null, '2017-06-17', '2', '5', null, 'DAN', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2114', null, '2017-06-19', '2', '50', null, 'AK/TINKU/OR  WEDDING   SETUP  ', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2115', null, '2017-06-19', '7', '100', null, 'Royal Hotel ', '1', '2018-06-06 12:47:55', '2018-06-06 12:47:55');
INSERT INTO `expenses` VALUES ('2116', null, '2017-06-19', '4', '30', null, '', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('2117', null, '2017-06-19', '40', '50', null, 'toto-chotto', '1', '2018-06-06 13:07:24', '2018-06-06 13:07:24');
INSERT INTO `expenses` VALUES ('2118', null, '2017-06-17', '40', '50', null, 'GOBINDA - SILIGURI', '1', '2018-06-06 13:07:24', '2018-06-06 13:07:24');
INSERT INTO `expenses` VALUES ('2119', null, '2017-06-19', '2119', '12000', null, 'XPRESSION - FULL PAID', '1', null, null);
INSERT INTO `expenses` VALUES ('2120', null, '2017-06-19', '2119', '0', null, '', '1', '2018-06-06 13:47:29', '2018-06-06 13:47:29');
INSERT INTO `expenses` VALUES ('2121', null, '2017-06-20', '2', '20', null, 'SHIV SENA ', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2122', null, '2017-06-20', '21', '200', null, '', '1', '2018-06-06 12:53:42', '2018-06-06 12:53:42');
INSERT INTO `expenses` VALUES ('2123', null, '2017-06-20', '4', '30', null, '', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('2124', null, '2017-06-21', '4', '30', null, '', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('2125', null, '2017-06-22', '2', '10', null, '', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2126', null, '2017-06-22', '51', '160', null, 'BHOWMICK 100 PIC', '1', '2018-06-06 13:10:49', '2018-06-06 13:10:49');
INSERT INTO `expenses` VALUES ('2127', null, '2017-06-22', '4', '30', null, '1 day', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('2128', null, '2017-06-23', '21', '200', null, '', '1', '2018-06-06 12:53:42', '2018-06-06 12:53:42');
INSERT INTO `expenses` VALUES ('2129', null, '2017-06-23', '10', '20', null, '', '1', '2018-06-06 12:50:18', '2018-06-06 12:50:18');
INSERT INTO `expenses` VALUES ('2130', null, '2017-06-23', '4', '30', null, '', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('2131', null, '2017-06-23', '2', '20', null, '', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2132', null, '2017-06-24', '2', '10', null, 'labu', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2133', null, '2017-06-24', '2', '30', null, '', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2134', null, '2017-06-24', '2', '20', null, 'DAN', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2135', null, '2017-06-24', '4', '30', null, '', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('2136', null, '2017-06-24', '43', '220', null, 'FULL PAID 24-06-2017', '1', '2018-06-06 13:08:23', '2018-06-06 13:08:23');
INSERT INTO `expenses` VALUES ('2137', null, '2017-06-24', '2137', '500', null, 'TINKU IED BONUS', '1', null, null);
INSERT INTO `expenses` VALUES ('2138', null, '2017-06-26', '2', '150', null, 'dhupkathi', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2139', null, '2017-06-26', '40', '200', null, 'siliguri', '1', '2018-06-06 13:07:24', '2018-06-06 13:07:24');
INSERT INTO `expenses` VALUES ('2140', null, '2017-06-27', '21', '200', null, '', '1', '2018-06-06 12:53:42', '2018-06-06 12:53:42');
INSERT INTO `expenses` VALUES ('2141', null, '2017-06-27', '88', '1092', null, '', '1', '2018-06-06 13:20:01', '2018-06-06 13:20:01');
INSERT INTO `expenses` VALUES ('2142', null, '2017-06-27', '4', '60', null, '', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('2143', null, '2017-06-27', '7', '50', null, '', '1', '2018-06-06 12:47:55', '2018-06-06 12:47:55');
INSERT INTO `expenses` VALUES ('2144', null, '2017-06-28', '7', '175', null, '', '1', '2018-06-06 12:47:55', '2018-06-06 12:47:55');
INSERT INTO `expenses` VALUES ('2145', null, '2017-06-28', '10', '10', null, '', '1', '2018-06-06 12:50:18', '2018-06-06 12:50:18');
INSERT INTO `expenses` VALUES ('2146', null, '2017-06-28', '4', '30', null, '', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('2147', null, '2017-06-29', '2', '300', null, 'APC BATTERY PACK CHANGE (RAJKUMAR)', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2148', null, '2017-06-29', '4', '30', null, '', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('2149', null, '2017-06-29', '2', '160', null, 'A4 PLAIN PAPER 500 PIS', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2150', null, '2017-06-29', '2', '10', null, '', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2151', null, '2017-06-30', '7', '150', null, 'GOBINDA AND SUMAN', '1', '2018-06-06 12:47:55', '2018-06-06 12:47:55');
INSERT INTO `expenses` VALUES ('2152', null, '2017-06-30', '4', '30', null, '', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('2153', null, '2017-06-30', '40', '200', null, 'SILUGURI', '1', '2018-06-06 13:07:24', '2018-06-06 13:07:24');
INSERT INTO `expenses` VALUES ('2154', null, '2017-07-01', '43', '73', null, 'full paid', '1', '2018-06-06 13:08:23', '2018-06-06 13:08:23');
INSERT INTO `expenses` VALUES ('2155', null, '2017-07-01', '21', '200', null, 'DEPOSITE', '1', '2018-06-06 12:53:42', '2018-06-06 12:53:42');
INSERT INTO `expenses` VALUES ('2156', null, '2017-07-01', '2', '20', null, 'DAAN', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2157', null, '2017-07-03', '4', '60', null, '2day', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('2158', null, '2017-07-03', '104', '4500', null, 'MONTH OF JUNE', '1', '2018-06-06 13:23:52', '2018-06-06 13:23:52');
INSERT INTO `expenses` VALUES ('2159', null, '2017-07-04', '21', '200', null, '', '1', '2018-06-06 12:53:42', '2018-06-06 12:53:42');
INSERT INTO `expenses` VALUES ('2160', null, '2017-07-04', '4', '30', null, '', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('2161', null, '2017-07-05', '105', '180', null, '', '1', '2018-06-06 13:24:19', '2018-06-06 13:24:19');
INSERT INTO `expenses` VALUES ('2162', null, '2017-07-05', '2855', '2500', null, 'RITURONG 2017', '1', '2018-06-06 14:10:58', '2018-06-06 14:10:58');
INSERT INTO `expenses` VALUES ('2163', null, '2017-07-05', '4', '30', null, '', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('2164', null, '2017-07-05', '2', '10', null, '', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2165', null, '2017-07-06', '10', '50', null, '3day', '1', '2018-06-06 12:50:18', '2018-06-06 12:50:18');
INSERT INTO `expenses` VALUES ('2166', null, '2017-07-06', '7', '20', null, '', '1', '2018-06-06 12:47:55', '2018-06-06 12:47:55');
INSERT INTO `expenses` VALUES ('2167', null, '2017-07-07', '2', '240', null, 'BOTH SIDE GUM, BLACK TAP, SIDE GARD', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2168', null, '2017-07-07', '7', '20', null, '', '1', '2018-06-06 12:47:55', '2018-06-06 12:47:55');
INSERT INTO `expenses` VALUES ('2169', null, '2017-07-07', '4', '90', null, '3day', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('2170', null, '2017-07-07', '21', '100', null, '', '1', '2018-06-06 12:53:42', '2018-06-06 12:53:42');
INSERT INTO `expenses` VALUES ('2171', null, '2017-07-07', '21', '100', null, '', '1', '2018-06-06 12:53:42', '2018-06-06 12:53:42');
INSERT INTO `expenses` VALUES ('2172', null, '2017-07-07', '2', '20', null, '', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2173', null, '2017-07-07', '2', '10', null, 'DAN', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2174', null, '2017-07-08', '7', '60', null, 'TINKU', '1', '2018-06-06 12:47:55', '2018-06-06 12:47:55');
INSERT INTO `expenses` VALUES ('2175', null, '2017-07-08', '2', '10', null, 'LABU\r\n', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2176', null, '2017-07-08', '2', '20', null, 'DAN', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2177', null, '2017-07-08', '7', '200', null, '', '1', '2018-06-06 12:47:55', '2018-06-06 12:47:55');
INSERT INTO `expenses` VALUES ('2178', null, '2017-07-10', '4', '30', null, '', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('2179', null, '2017-07-10', '2', '10', null, '', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2180', null, '2017-07-11', '4', '30', null, '', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('2181', null, '2017-07-11', '10', '85', null, '3 DAYS   17 CUP', '1', '2018-06-06 12:50:18', '2018-06-06 12:50:18');
INSERT INTO `expenses` VALUES ('2182', null, '2017-07-12', '4', '30', null, '', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('2183', null, '2017-07-12', '21', '200', null, '', '1', '2018-06-06 12:53:42', '2018-06-06 12:53:42');
INSERT INTO `expenses` VALUES ('2184', null, '2017-07-12', '10', '30', null, '', '1', '2018-06-06 12:50:18', '2018-06-06 12:50:18');
INSERT INTO `expenses` VALUES ('2185', null, '2017-07-12', '7', '60', null, '', '1', '2018-06-06 12:47:55', '2018-06-06 12:47:55');
INSERT INTO `expenses` VALUES ('2186', null, '2017-07-13', '10', '35', null, '7 cup', '1', '2018-06-06 12:50:18', '2018-06-06 12:50:18');
INSERT INTO `expenses` VALUES ('2187', null, '2017-07-13', '43', '120', null, '3/7 to 13/7', '1', '2018-06-06 13:08:23', '2018-06-06 13:08:23');
INSERT INTO `expenses` VALUES ('2188', null, '2017-07-14', '2', '11500', null, 'MUS TECHNOLOGY (SOFTWARE)', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2189', null, '2017-07-14', '2', '2300', null, 'SMS SERVICE', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2190', null, '2017-07-14', '4', '30', null, '', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('2191', null, '2017-07-14', '2', '10', null, 'kuli', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2192', null, '2017-07-15', '2', '35', null, 'DAN', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2193', null, '2017-07-15', '2', '50', null, 'MASI', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2194', null, '2017-07-15', '2', '40', null, '', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2195', null, '2017-07-15', '21', '200', null, '', '1', '2018-06-06 12:53:42', '2018-06-06 12:53:42');
INSERT INTO `expenses` VALUES ('2196', null, '2017-07-15', '2', '10', null, 'labu', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2197', null, '2017-07-15', '4', '30', null, '\r\n', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('2198', null, '2017-07-17', '7', '30', null, '', '1', '2018-06-06 12:47:55', '2018-06-06 12:47:55');
INSERT INTO `expenses` VALUES ('2199', null, '2017-07-17', '4', '30', null, '', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('2200', null, '2017-07-18', '21', '200', null, '', '1', '2018-06-06 12:53:42', '2018-06-06 12:53:42');
INSERT INTO `expenses` VALUES ('2201', null, '2017-07-18', '2119', '35', null, 'DVD', '1', '2018-06-06 13:47:29', '2018-06-06 13:47:29');
INSERT INTO `expenses` VALUES ('2202', null, '2017-07-18', '4', '30', null, '', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('2203', null, '2017-07-19', '51', '320', null, 'a kham 200', '1', '2018-06-06 13:10:49', '2018-06-06 13:10:49');
INSERT INTO `expenses` VALUES ('2204', null, '2017-07-19', '7', '72', null, '', '1', '2018-06-06 12:47:55', '2018-06-06 12:47:55');
INSERT INTO `expenses` VALUES ('2205', null, '2017-07-19', '10', '20', null, '', '1', '2018-06-06 12:50:18', '2018-06-06 12:50:18');
INSERT INTO `expenses` VALUES ('2206', null, '2017-07-19', '4', '30', null, '', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('2207', null, '2017-07-19', '48', '70', null, 'TGS', '1', '2018-06-07 11:51:41', '2018-06-07 11:51:41');
INSERT INTO `expenses` VALUES ('2208', null, '2017-07-20', '2', '50', null, 'FLEX O GUM', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2209', null, '2017-07-20', '7', '65', null, 'GOBINDA', '1', '2018-06-06 12:47:55', '2018-06-06 12:47:55');
INSERT INTO `expenses` VALUES ('2210', null, '2017-07-20', '4', '30', null, '', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('2211', null, '2017-07-20', '40', '40', null, 'MAYNAGURI, DHUPGURI', '1', '2018-06-06 13:07:24', '2018-06-06 13:07:24');
INSERT INTO `expenses` VALUES ('2212', null, '2017-07-21', '21', '200', null, '', '1', '2018-06-06 12:53:42', '2018-06-06 12:53:42');
INSERT INTO `expenses` VALUES ('2213', null, '2017-07-21', '4', '30', null, '', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('2214', null, '2017-07-21', '2', '70', null, 'finaile', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2215', null, '2017-07-21', '2', '20', null, '', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2216', null, '2017-07-22', '8', '700', null, 'JOGA da, Inverter repair ', '1', '2018-06-06 12:48:34', '2018-06-06 12:48:34');
INSERT INTO `expenses` VALUES ('2217', null, '2017-07-22', '2', '10', null, 'LABU', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2218', null, '2017-07-22', '7', '60', null, '', '1', '2018-06-06 12:47:55', '2018-06-06 12:47:55');
INSERT INTO `expenses` VALUES ('2219', null, '2017-07-22', '4', '30', null, '1 DAY', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('2220', null, '2017-07-22', '2', '20', null, 'BUS FAIR', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2221', null, '2017-07-22', '43', '155', null, 'FULL PAID', '1', '2018-06-06 13:08:23', '2018-06-06 13:08:23');
INSERT INTO `expenses` VALUES ('2222', null, '2017-07-24', '4', '30', null, '', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('2223', null, '2017-07-25', '4', '30', null, '', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('2224', null, '2017-07-25', '7', '20', null, '', '1', '2018-06-06 12:47:55', '2018-06-06 12:47:55');
INSERT INTO `expenses` VALUES ('2225', null, '2017-07-25', '21', '200', null, '', '1', '2018-06-06 12:53:42', '2018-06-06 12:53:42');
INSERT INTO `expenses` VALUES ('2226', null, '2017-07-25', '10', '60', null, '12 cup', '1', '2018-06-06 12:50:18', '2018-06-06 12:50:18');
INSERT INTO `expenses` VALUES ('2227', null, '2017-07-25', '2', '400', null, '8GB pen drive', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2228', null, '2017-07-26', '88', '1121', null, '', '1', '2018-06-06 13:20:01', '2018-06-06 13:20:01');
INSERT INTO `expenses` VALUES ('2229', null, '2017-07-26', '4', '30', null, '', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('2230', null, '2017-07-26', '7', '70', null, 'GOBINDA 26/7/2017', '1', '2018-06-06 12:47:55', '2018-06-06 12:47:55');
INSERT INTO `expenses` VALUES ('2231', null, '2017-07-27', '7', '20', null, 'P-S-T', '1', '2018-06-06 12:47:55', '2018-06-06 12:47:55');
INSERT INTO `expenses` VALUES ('2232', null, '2017-07-27', '10', '60', null, '', '1', '2018-06-06 12:50:18', '2018-06-06 12:50:18');
INSERT INTO `expenses` VALUES ('2233', null, '2017-07-28', '40', '70', null, 'GOBI', '1', '2018-06-06 13:07:24', '2018-06-06 13:07:24');
INSERT INTO `expenses` VALUES ('2234', null, '2017-07-29', '67', '100', null, 'MAINA GURI ( GOBI OR CHOTTU)', '1', '2018-06-06 13:17:03', '2018-06-06 13:17:03');
INSERT INTO `expenses` VALUES ('2235', null, '2017-07-29', '7', '60', null, 'GOBI', '1', '2018-06-06 12:47:55', '2018-06-06 12:47:55');
INSERT INTO `expenses` VALUES ('2236', null, '2017-07-29', '2', '10', null, 'labu', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2237', null, '2017-07-29', '7', '60', null, 'P-S-B-T-T', '1', '2018-06-06 12:47:55', '2018-06-06 12:47:55');
INSERT INTO `expenses` VALUES ('2238', null, '2017-07-29', '21', '200', null, '', '1', '2018-06-06 12:53:42', '2018-06-06 12:53:42');
INSERT INTO `expenses` VALUES ('2239', null, '2017-07-29', '2', '45', null, 'SELLOTAPE', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2240', null, '2017-07-31', '4', '150', null, '5 DAY', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('2241', null, '2017-07-31', '7', '60', null, 'MAYNAGURI', '1', '2018-06-06 12:47:55', '2018-06-06 12:47:55');
INSERT INTO `expenses` VALUES ('2242', null, '2017-08-01', '21', '200', null, '', '1', '2018-06-06 12:53:42', '2018-06-06 12:53:42');
INSERT INTO `expenses` VALUES ('2243', null, '2017-08-01', '4', '30', null, '', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('2244', null, '2017-08-02', '4', '30', null, '', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('2245', null, '2017-08-03', '48', '160', null, '', '1', '2018-06-07 11:51:41', '2018-06-07 11:51:41');
INSERT INTO `expenses` VALUES ('2246', null, '2017-08-03', '4', '30', null, '', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('2247', null, '2017-08-04', '4', '30', null, '', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('2248', null, '2017-08-04', '10', '15', null, '', '1', '2018-06-06 12:50:18', '2018-06-06 12:50:18');
INSERT INTO `expenses` VALUES ('2249', null, '2017-08-05', '21', '200', null, '', '1', '2018-06-06 12:53:42', '2018-06-06 12:53:42');
INSERT INTO `expenses` VALUES ('2250', null, '2017-08-05', '104', '4500', null, 'MONTH OF JULY', '1', '2018-06-06 13:23:52', '2018-06-06 13:23:52');
INSERT INTO `expenses` VALUES ('2251', null, '2017-08-05', '7', '25', null, 'GOBINDA', '1', '2018-06-06 12:47:55', '2018-06-06 12:47:55');
INSERT INTO `expenses` VALUES ('2252', null, '2017-08-05', '2', '10', null, 'LABU', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2253', null, '2017-08-05', '4', '30', null, '', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('2254', null, '2017-08-05', '10', '25', null, '', '1', '2018-06-06 12:50:18', '2018-06-06 12:50:18');
INSERT INTO `expenses` VALUES ('2255', null, '2017-08-07', '10', '30', null, '', '1', '2018-06-06 12:50:18', '2018-06-06 12:50:18');
INSERT INTO `expenses` VALUES ('2256', null, '2017-08-07', '4', '30', null, '', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('2258', null, '2017-08-08', '4', '30', null, '', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('2259', null, '2017-08-08', '105', '200', null, '', '1', '2018-06-06 13:24:19', '2018-06-06 13:24:19');
INSERT INTO `expenses` VALUES ('2260', null, '2017-08-09', '10', '25', null, '', '1', '2018-06-06 12:50:18', '2018-06-06 12:50:18');
INSERT INTO `expenses` VALUES ('2261', null, '2017-08-09', '10', '50', null, '', '1', '2018-06-06 12:50:18', '2018-06-06 12:50:18');
INSERT INTO `expenses` VALUES ('2262', null, '2017-08-09', '7', '20', null, '', '1', '2018-06-06 12:47:55', '2018-06-06 12:47:55');
INSERT INTO `expenses` VALUES ('2263', null, '2017-08-09', '4', '30', null, '', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('2264', null, '2017-08-09', '2', '40', null, 'BLACK TAP', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2265', null, '2017-08-09', '2855', '3000', null, 'WEBSITE RENUAL', '1', '2018-06-06 14:10:58', '2018-06-06 14:10:58');
INSERT INTO `expenses` VALUES ('2266', null, '2017-08-09', '21', '200', null, '', '1', '2018-06-06 12:53:42', '2018-06-06 12:53:42');
INSERT INTO `expenses` VALUES ('2267', null, '2017-08-10', '10', '50', null, '', '1', '2018-06-06 12:50:18', '2018-06-06 12:50:18');
INSERT INTO `expenses` VALUES ('2268', null, '2017-08-10', '4', '30', null, '', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('2269', null, '2017-08-11', '4', '30', null, '', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('2270', null, '2017-08-11', '21', '200', null, '', '1', '2018-06-06 12:53:42', '2018-06-06 12:53:42');
INSERT INTO `expenses` VALUES ('2271', null, '2017-08-11', '10', '50', null, '', '1', '2018-06-06 12:50:18', '2018-06-06 12:50:18');
INSERT INTO `expenses` VALUES ('2272', null, '2017-08-14', '7', '90', null, 'PINTU+GOBI+TINKU', '1', '2018-06-06 12:47:55', '2018-06-06 12:47:55');
INSERT INTO `expenses` VALUES ('2273', null, '2017-08-14', '10', '12', null, '', '1', '2018-06-06 12:50:18', '2018-06-06 12:50:18');
INSERT INTO `expenses` VALUES ('2274', null, '2017-08-14', '40', '20', null, 'suman toto', '1', '2018-06-06 13:07:24', '2018-06-06 13:07:24');
INSERT INTO `expenses` VALUES ('2275', null, '2017-08-14', '4', '30', null, '', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('2276', null, '2017-08-16', '40', '10', null, '', '1', '2018-06-06 13:07:24', '2018-06-06 13:07:24');
INSERT INTO `expenses` VALUES ('2277', null, '2017-08-16', '2813', '1396', null, 'APRIL TO JULY', '1', '2018-06-06 14:00:37', '2018-06-06 14:00:37');
INSERT INTO `expenses` VALUES ('2278', null, '2017-08-16', '4', '30', null, '', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('2279', null, '2017-08-16', '2119', '1200', null, 'projector rent', '1', '2018-06-06 13:47:29', '2018-06-06 13:47:29');
INSERT INTO `expenses` VALUES ('2280', null, '2017-08-16', '2', '225', null, '15ta  gum stk ', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2281', null, '2017-08-16', '21', '200', null, '', '1', '2018-06-06 12:53:42', '2018-06-06 12:53:42');
INSERT INTO `expenses` VALUES ('2282', null, '2017-08-17', '2', '50', null, 'Shymal da Flex Iled', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2283', null, '2017-08-17', '4', '30', null, '', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('2284', null, '2017-08-17', '10', '10', null, '\r\n', '1', '2018-06-06 12:50:18', '2018-06-06 12:50:18');
INSERT INTO `expenses` VALUES ('2285', null, '2017-08-17', '7', '40', null, 'TINKU -SUMAN', '1', '2018-06-06 12:47:55', '2018-06-06 12:47:55');
INSERT INTO `expenses` VALUES ('2286', null, '2017-08-18', '10', '20', null, '', '1', '2018-06-06 12:50:18', '2018-06-06 12:50:18');
INSERT INTO `expenses` VALUES ('2287', null, '2017-08-18', '4', '30', null, '', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('2288', null, '2017-08-19', '2', '15', null, 'labu lanka', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2289', null, '2017-08-19', '2119', '26', null, 'DVD POUCH', '1', '2018-06-06 13:47:29', '2018-06-06 13:47:29');
INSERT INTO `expenses` VALUES ('2290', null, '2017-08-19', '21', '200', null, '', '1', '2018-06-06 12:53:42', '2018-06-06 12:53:42');
INSERT INTO `expenses` VALUES ('2291', null, '2017-08-19', '10', '20', null, '', '1', '2018-06-06 12:50:18', '2018-06-06 12:50:18');
INSERT INTO `expenses` VALUES ('2292', null, '2017-08-19', '75', '35', null, '', '1', '2018-06-06 13:18:03', '2018-06-06 13:18:03');
INSERT INTO `expenses` VALUES ('2293', null, '2017-08-19', '2', '30', null, 'Dan', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2294', null, '2017-08-19', '4', '30', null, '', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('2295', null, '2017-08-21', '10', '50', null, '', '1', '2018-06-06 12:50:18', '2018-06-06 12:50:18');
INSERT INTO `expenses` VALUES ('2296', null, '2017-08-21', '2', '100', null, 'DAN BANNYA TRAN', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2297', null, '2017-08-21', '4', '30', null, '', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('2298', null, '2017-08-21', '2119', '160', null, 'BHOMICK KHAM ANNAPRATION  100PIC', '1', '2018-06-06 13:47:29', '2018-06-06 13:47:29');
INSERT INTO `expenses` VALUES ('2299', null, '2017-08-22', '4', '30', null, '', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('2300', null, '2017-08-22', '10', '35', null, '7 CUP', '1', '2018-06-06 12:50:18', '2018-06-06 12:50:18');
INSERT INTO `expenses` VALUES ('2301', null, '2017-08-23', '2', '100', null, 'CELLO TAP ', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2302', null, '2017-08-23', '2', '30', null, 'kuli+shymal', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2303', null, '2017-08-23', '21', '200', null, '', '1', '2018-06-06 12:53:42', '2018-06-06 12:53:42');
INSERT INTO `expenses` VALUES ('2304', null, '2017-08-23', '4', '30', null, '', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('2305', null, '2017-08-23', '2119', '160', null, '100 KHOM', '1', '2018-06-06 13:47:29', '2018-06-06 13:47:29');
INSERT INTO `expenses` VALUES ('2306', null, '2017-08-23', '10', '10', null, '', '1', '2018-06-06 12:50:18', '2018-06-06 12:50:18');
INSERT INTO `expenses` VALUES ('2307', null, '2017-08-24', '10', '50', null, '', '1', '2018-06-06 12:50:18', '2018-06-06 12:50:18');
INSERT INTO `expenses` VALUES ('2308', null, '2017-08-24', '4', '30', null, '', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('2309', null, '2017-08-25', '2', '50', null, 'GAMCHA ', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2310', null, '2017-08-25', '21', '200', null, '', '1', '2018-06-06 12:53:42', '2018-06-06 12:53:42');
INSERT INTO `expenses` VALUES ('2311', null, '2017-08-25', '2', '10', null, 'bijoy ', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2312', null, '2017-08-25', '4', '30', null, '', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('2313', null, '2017-08-26', '2855', '1000', null, 'JPA 2017', '1', '2018-06-06 14:10:58', '2018-06-06 14:10:58');
INSERT INTO `expenses` VALUES ('2314', null, '2017-08-26', '10', '60', null, '', '1', '2018-06-06 12:50:18', '2018-06-06 12:50:18');
INSERT INTO `expenses` VALUES ('2315', null, '2017-08-26', '2', '50', null, 'BANNYA TRAN', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2316', null, '2017-08-26', '4', '30', null, '', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('2317', null, '2017-08-26', '2', '10', null, '', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2318', null, '2017-08-26', '2', '30', null, 'DAN', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2319', null, '2017-08-26', '2', '10', null, 'LABU LANKA', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2320', null, '2017-08-26', '2855', '510', null, 'KOUSHIK (MAINAGURI)', '1', '2018-06-06 14:10:58', '2018-06-06 14:10:58');
INSERT INTO `expenses` VALUES ('2321', null, '2017-08-26', '88', '1121', null, '', '1', '2018-06-06 13:20:01', '2018-06-06 13:20:01');
INSERT INTO `expenses` VALUES ('2322', null, '2017-08-26', '43', '300', null, '', '1', '2018-06-06 13:08:23', '2018-06-06 13:08:23');
INSERT INTO `expenses` VALUES ('2323', null, '2017-08-28', '4', '30', null, '', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('2324', null, '2017-08-28', '10', '50', null, '', '1', '2018-06-06 12:50:18', '2018-06-06 12:50:18');
INSERT INTO `expenses` VALUES ('2325', null, '2017-08-28', '2', '160', null, 'GOBI -TINKU-BIJOY-SUMAN ', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2326', null, '2017-08-29', '21', '200', null, '', '1', '2018-06-06 12:53:42', '2018-06-06 12:53:42');
INSERT INTO `expenses` VALUES ('2327', null, '2017-08-29', '2', '600', null, 'PAY TO NIRAJ FOR\r\nSHUBHENDU ROY RICE EATING CEREEMONY VIDEO EDITING', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2328', null, '2017-08-29', '2119', '13', null, '', '1', '2018-06-06 13:47:29', '2018-06-06 13:47:29');
INSERT INTO `expenses` VALUES ('2329', null, '2017-08-29', '10', '35', null, '', '1', '2018-06-06 12:50:18', '2018-06-06 12:50:18');
INSERT INTO `expenses` VALUES ('2330', null, '2017-08-29', '4', '30', null, '', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('2331', null, '2017-08-30', '10', '40', null, '', '1', '2018-06-06 12:50:18', '2018-06-06 12:50:18');
INSERT INTO `expenses` VALUES ('2332', null, '2017-08-30', '4', '30', null, '', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('2333', null, '2017-08-30', '2', '40', null, 'jush', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2334', null, '2017-08-31', '10', '50', null, '', '1', '2018-06-06 12:50:18', '2018-06-06 12:50:18');
INSERT INTO `expenses` VALUES ('2335', null, '2017-08-31', '4', '30', null, '', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('2336', null, '2017-09-01', '21', '200', null, '', '1', '2018-06-06 12:53:42', '2018-06-06 12:53:42');
INSERT INTO `expenses` VALUES ('2337', null, '2017-09-01', '10', '50', null, '', '1', '2018-06-06 12:50:18', '2018-06-06 12:50:18');
INSERT INTO `expenses` VALUES ('2338', null, '2017-09-01', '4', '30', null, '', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('2339', null, '2017-09-01', '104', '4500', null, 'MONTH OF AUGUST', '1', '2018-06-06 13:23:52', '2018-06-06 13:23:52');
INSERT INTO `expenses` VALUES ('2340', null, '2017-09-01', '40', '50', null, 'BIJAY WORKSHOP', '1', '2018-06-06 13:07:24', '2018-06-06 13:07:24');
INSERT INTO `expenses` VALUES ('2341', null, '2017-09-02', '2', '30', null, 'BUS FAIR', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2342', null, '2017-09-02', '2', '50', null, 'DAN', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2343', null, '2017-09-02', '10', '30', null, '', '1', '2018-06-06 12:50:18', '2018-06-06 12:50:18');
INSERT INTO `expenses` VALUES ('2344', null, '2017-09-02', '43', '100', null, '', '1', '2018-06-06 13:08:23', '2018-06-06 13:08:23');
INSERT INTO `expenses` VALUES ('2345', null, '2017-09-02', '2', '10', null, 'LABU LANKA', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2346', null, '2017-09-02', '4', '30', null, '', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('2347', null, '2017-09-04', '4', '30', null, '', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('2348', null, '2017-09-05', '21', '200', null, '', '1', '2018-06-06 12:53:42', '2018-06-06 12:53:42');
INSERT INTO `expenses` VALUES ('2349', null, '2017-09-05', '4', '30', null, '', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('2350', null, '2017-09-06', '105', '100', null, '', '1', '2018-06-06 13:24:19', '2018-06-06 13:24:19');
INSERT INTO `expenses` VALUES ('2351', null, '2017-09-06', '4', '30', null, ' ', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('2352', null, '2017-09-07', '4', '30', null, '', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('2353', null, '2017-09-07', '8', '5397', null, 'ELECTICITY BILL', '1', '2018-06-06 12:48:34', '2018-06-06 12:48:34');
INSERT INTO `expenses` VALUES ('2354', null, '2017-09-08', '10', '60', null, '2 day', '1', '2018-06-06 12:50:18', '2018-06-06 12:50:18');
INSERT INTO `expenses` VALUES ('2355', null, '2017-09-08', '10', '30', null, '', '1', '2018-06-06 12:50:18', '2018-06-06 12:50:18');
INSERT INTO `expenses` VALUES ('2356', null, '2017-09-08', '4', '30', null, ' ', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('2357', null, '2017-09-09', '21', '200', null, '', '1', '2018-06-06 12:53:42', '2018-06-06 12:53:42');
INSERT INTO `expenses` VALUES ('2358', null, '2017-09-09', '10', '40', null, '', '1', '2018-06-06 12:50:18', '2018-06-06 12:50:18');
INSERT INTO `expenses` VALUES ('2359', null, '2017-09-09', '4', '30', null, '', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('2360', null, '2017-09-09', '40', '40', null, 'MAINAGURI (BIJOY)', '1', '2018-06-06 13:07:24', '2018-06-06 13:07:24');
INSERT INTO `expenses` VALUES ('2361', null, '2017-09-09', '10', '30', null, '', '1', '2018-06-06 12:50:18', '2018-06-06 12:50:18');
INSERT INTO `expenses` VALUES ('2362', null, '2017-09-09', '2', '10', null, 'LABU', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2363', null, '2017-09-09', '2', '40', null, 'DAN', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2364', null, '2017-09-11', '21', '200', null, '', '1', '2018-06-06 12:53:42', '2018-06-06 12:53:42');
INSERT INTO `expenses` VALUES ('2365', null, '2017-09-11', '2', '50', null, '', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2366', null, '2017-09-11', '4', '30', null, '', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('2367', null, '2017-09-11', '10', '70', null, '14 cup \r\n', '1', '2018-06-06 12:50:18', '2018-06-06 12:50:18');
INSERT INTO `expenses` VALUES ('2368', null, '2017-09-11', '2137', '4000', null, 'TINKU DURGA PUJA BONUS', '1', '2018-06-06 13:49:40', '2018-06-06 13:49:40');
INSERT INTO `expenses` VALUES ('2369', null, '2017-09-11', '2137', '2500', null, 'SUMAN DURGA PUJA BONUS', '1', '2018-06-06 13:49:40', '2018-06-06 13:49:40');
INSERT INTO `expenses` VALUES ('2370', null, '2017-09-11', '2137', '2500', null, 'BIJAY DURGA PUJA BONUS', '1', '2018-06-06 13:49:40', '2018-06-06 13:49:40');
INSERT INTO `expenses` VALUES ('2371', null, '2017-09-12', '4', '30', null, '', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('2372', null, '2017-09-12', '10', '60', null, '', '1', '2018-06-06 12:50:18', '2018-06-06 12:50:18');
INSERT INTO `expenses` VALUES ('2373', null, '2017-09-13', '2', '320', null, 'A KHAM 200 PIS', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2374', null, '2017-09-13', '10', '40', null, '', '1', '2018-06-06 12:50:18', '2018-06-06 12:50:18');
INSERT INTO `expenses` VALUES ('2375', null, '2017-09-14', '4', '30', null, '', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('2376', null, '2017-09-14', '10', '30', null, '', '1', '2018-06-06 12:50:18', '2018-06-06 12:50:18');
INSERT INTO `expenses` VALUES ('2377', null, '2017-09-15', '21', '200', null, '', '1', '2018-06-06 12:53:42', '2018-06-06 12:53:42');
INSERT INTO `expenses` VALUES ('2378', null, '2017-09-15', '2137', '500', null, 'MASI  DURGA PUJA BONUS', '1', '2018-06-06 13:49:40', '2018-06-06 13:49:40');
INSERT INTO `expenses` VALUES ('2379', null, '2017-09-15', '2137', '7000', null, 'GOBINDO  DURGA PUJA BONUS', '1', '2018-06-06 13:49:40', '2018-06-06 13:49:40');
INSERT INTO `expenses` VALUES ('2380', null, '2017-09-15', '4', '30', null, '', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('2381', null, '2017-09-15', '10', '80', null, '', '1', '2018-06-06 12:50:18', '2018-06-06 12:50:18');
INSERT INTO `expenses` VALUES ('2382', null, '2017-09-16', '2', '20', null, 'LABU (10 TAKA  AGER DEU)', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2383', null, '2017-09-16', '2', '110', null, '', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2384', null, '2017-09-16', '4', '30', null, '', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('2385', null, '2017-09-16', '2', '40', null, 'DAN', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2386', null, '2017-09-16', '10', '50', null, '', '1', '2018-06-06 12:50:18', '2018-06-06 12:50:18');
INSERT INTO `expenses` VALUES ('2387', null, '2017-09-18', '2137', '1000', null, 'ABHI (CHOTU)', '1', '2018-06-06 13:49:40', '2018-06-06 13:49:40');
INSERT INTO `expenses` VALUES ('2388', null, '2017-09-18', '2137', '1000', null, 'ANKITA KUNDU', '1', '2018-06-06 13:49:40', '2018-06-06 13:49:40');
INSERT INTO `expenses` VALUES ('2389', null, '2017-09-18', '4', '30', null, '', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('2390', null, '2017-09-18', '10', '45', null, '', '1', '2018-06-06 12:50:18', '2018-06-06 12:50:18');
INSERT INTO `expenses` VALUES ('2391', null, '2017-09-19', '4', '30', null, '', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('2392', null, '2017-09-19', '2', '40', null, '', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2393', null, '2017-09-19', '10', '40', null, '', '1', '2018-06-06 12:50:18', '2018-06-06 12:50:18');
INSERT INTO `expenses` VALUES ('2394', null, '2017-09-20', '21', '200', null, 'DEPO', '1', '2018-06-06 12:53:42', '2018-06-06 12:53:42');
INSERT INTO `expenses` VALUES ('2395', null, '2017-09-20', '2', '12', null, 'DAAN', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2396', null, '2017-09-20', '2831', '51', null, 'DISHARI DURGA PUJA', '1', '2018-06-06 14:01:30', '2018-06-06 14:01:30');
INSERT INTO `expenses` VALUES ('2397', null, '2017-09-20', '10', '30', null, '', '1', '2018-06-06 12:50:18', '2018-06-06 12:50:18');
INSERT INTO `expenses` VALUES ('2398', null, '2017-09-20', '4', '30', null, '', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('2399', null, '2017-09-20', '2831', '1500', null, 'KADAMTALA  DURGABARI', '1', '2018-06-06 14:01:30', '2018-06-06 14:01:30');
INSERT INTO `expenses` VALUES ('2400', null, '2017-09-21', '10', '30', null, ' ', '1', '2018-06-06 12:50:18', '2018-06-06 12:50:18');
INSERT INTO `expenses` VALUES ('2401', null, '2017-09-21', '2', '30', null, '', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2402', null, '2017-09-21', '2831', '40', null, 'AGRANI CLUB | DURGA PUJA', '1', '2018-06-06 14:01:30', '2018-06-06 14:01:30');
INSERT INTO `expenses` VALUES ('2403', null, '2017-09-21', '4', '30', null, '', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('2404', null, '2017-09-21', '10', '10', null, '', '1', '2018-06-06 12:50:18', '2018-06-06 12:50:18');
INSERT INTO `expenses` VALUES ('2405', null, '2017-09-22', '2831', '80', null, 'MAHAMAYAPARA SARBAJANI DURGA PUJA', '1', '2018-06-06 14:01:30', '2018-06-06 14:01:30');
INSERT INTO `expenses` VALUES ('2406', null, '2017-09-22', '4', '30', null, '', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('2407', null, '2017-09-22', '2831', '51', null, 'PANDAPARA SARBAJANNIN DURGA PUJA ', '1', '2018-06-06 14:01:30', '2018-06-06 14:01:30');
INSERT INTO `expenses` VALUES ('2408', null, '2017-09-22', '10', '35', null, '', '1', '2018-06-06 12:50:18', '2018-06-06 12:50:18');
INSERT INTO `expenses` VALUES ('2409', null, '2017-09-23', '2137', '0', null, 'TUSHAR DURAGA PUJA', '1', '2018-06-06 13:49:40', '2018-06-06 13:49:40');
INSERT INTO `expenses` VALUES ('2410', null, '2017-09-23', '2137', '500', null, 'PANKAJ DURGA PUJA', '1', '2018-06-06 13:49:40', '2018-06-06 13:49:40');
INSERT INTO `expenses` VALUES ('2411', null, '2017-09-23', '21', '200', null, '', '1', '2018-06-06 12:53:42', '2018-06-06 12:53:42');
INSERT INTO `expenses` VALUES ('2412', null, '2017-09-23', '7', '30', null, 'tiffin', '1', '2018-06-06 12:47:55', '2018-06-06 12:47:55');
INSERT INTO `expenses` VALUES ('2413', null, '2017-09-23', '4', '30', null, '', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('2414', null, '2017-09-23', '2831', '21', null, 'NEW JEMS CLUB', '1', '2018-06-06 14:01:30', '2018-06-06 14:01:30');
INSERT INTO `expenses` VALUES ('2415', null, '2017-09-23', '2', '10', null, 'LABU', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2417', null, '2017-09-23', '2', '20', null, '', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2418', null, '2017-09-23', '48', '250', null, '', '1', '2018-06-07 11:51:41', '2018-06-07 11:51:41');
INSERT INTO `expenses` VALUES ('2419', null, '2017-09-23', '2', '45', null, 'DAN', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2420', null, '2017-09-25', '88', '1121', null, 'MONTH OF SEP TO OCT', '1', '2018-06-06 13:20:01', '2018-06-06 13:20:01');
INSERT INTO `expenses` VALUES ('2421', null, '2017-09-25', '2831', '70', null, 'NATUN PARA', '1', '2018-06-06 14:01:30', '2018-06-06 14:01:30');
INSERT INTO `expenses` VALUES ('2422', null, '2017-09-25', '2831', '30', null, 'PASCHIM CONGRESSPARA', '1', '2018-06-06 14:01:30', '2018-06-06 14:01:30');
INSERT INTO `expenses` VALUES ('2423', null, '2017-09-25', '2831', '100', null, 'TARUN DOL', '1', '2018-06-06 14:01:30', '2018-06-06 14:01:30');
INSERT INTO `expenses` VALUES ('2424', null, '2017-09-25', '4', '30', null, '', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('2425', null, '2017-09-25', '21', '200', null, '', '1', '2018-06-06 12:53:42', '2018-06-06 12:53:42');
INSERT INTO `expenses` VALUES ('2426', null, '2017-09-25', '10', '50', null, '', '1', '2018-06-06 12:50:18', '2018-06-06 12:50:18');
INSERT INTO `expenses` VALUES ('2427', null, '2017-09-25', '2831', '60', null, 'poura harijan karmi', '1', '2018-06-06 14:01:30', '2018-06-06 14:01:30');
INSERT INTO `expenses` VALUES ('2428', null, '2017-09-26', '8', '465', null, 'repairing work', '1', '2018-06-06 12:48:34', '2018-06-06 12:48:34');
INSERT INTO `expenses` VALUES ('2429', null, '2017-09-26', '2', '350', null, 'PAPER  OR  LOCK', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2430', null, '2017-09-26', '2', '1300', null, 'BILL  BOOK 1000 PIC', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2431', null, '2017-09-26', '2', '70', null, '', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2432', null, '2017-09-26', '2831', '50', null, 'RAMDHANU CULTURUL CLUB', '1', '2018-06-06 14:01:30', '2018-06-06 14:01:30');
INSERT INTO `expenses` VALUES ('2433', null, '2017-09-26', '48', '50', null, '', '1', '2018-06-07 11:51:41', '2018-06-07 11:51:41');
INSERT INTO `expenses` VALUES ('2434', null, '2017-09-26', '4', '30', null, '\r\n', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('2435', null, '2017-09-29', '7', '240', null, 'DINAR', '1', '2018-06-06 12:47:55', '2018-06-06 12:47:55');
INSERT INTO `expenses` VALUES ('2436', null, '2017-09-29', '48', '150', null, '', '1', '2018-06-07 11:51:41', '2018-06-07 11:51:41');
INSERT INTO `expenses` VALUES ('2437', null, '2017-09-29', '2', '20', null, '', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2438', null, '2017-09-29', '2', '20', null, 'DAAN & SUMAN TOTO', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2439', null, '2017-09-29', '10', '45', null, '', '1', '2018-06-06 12:50:18', '2018-06-06 12:50:18');
INSERT INTO `expenses` VALUES ('2440', null, '2017-09-29', '2', '20', null, '', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2441', null, '2017-09-30', '4', '100', null, '3DAY', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('2442', null, '2017-09-29', '4', '100', null, '', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('2443', null, '2017-09-29', '7', '1560', null, 'DURGA PUJA NBOMI SPCL', '1', '2018-06-06 12:47:55', '2018-06-06 12:47:55');
INSERT INTO `expenses` VALUES ('2444', null, '2017-10-03', '4', '200', null, '', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('2445', null, '2017-10-03', '7', '258', null, '', '1', '2018-06-06 12:47:55', '2018-06-06 12:47:55');
INSERT INTO `expenses` VALUES ('2446', null, '2017-10-03', '10', '30', null, '', '1', '2018-06-06 12:50:18', '2018-06-06 12:50:18');
INSERT INTO `expenses` VALUES ('2447', null, '2017-10-04', '2', '70', null, 'FINUL', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2448', null, '2017-10-04', '4', '90', null, '3 days', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('2449', null, '2017-10-04', '10', '20', null, '', '1', '2018-06-06 12:50:18', '2018-06-06 12:50:18');
INSERT INTO `expenses` VALUES ('2450', null, '2017-10-05', '4', '30', null, '', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('2451', null, '2017-10-06', '105', '180', null, 'MONTH OF SEP 17', '1', '2018-06-06 13:24:19', '2018-06-06 13:24:19');
INSERT INTO `expenses` VALUES ('2452', null, '2017-10-06', '21', '200', null, '', '1', '2018-06-06 12:53:42', '2018-06-06 12:53:42');
INSERT INTO `expenses` VALUES ('2453', null, '2017-10-06', '2', '125', null, 'BOND PAPER', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2454', null, '2017-10-06', '104', '4500', null, 'MONTH OF SEPTEMBER', '1', '2018-06-06 13:23:52', '2018-06-06 13:23:52');
INSERT INTO `expenses` VALUES ('2455', null, '2017-10-06', '4', '30', null, '', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('2456', null, '2017-10-07', '4', '30', null, '', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('2457', null, '2017-10-09', '2', '10', null, 'DAN', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2458', null, '2017-10-09', '2', '160', null, '100 PIC  A  KHAM', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2459', null, '2017-10-09', '2', '10', null, 'LABU', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2460', null, '2017-10-10', '21', '200', null, '', '1', '2018-06-06 12:53:42', '2018-06-06 12:53:42');
INSERT INTO `expenses` VALUES ('2461', null, '2017-10-10', '10', '20', null, '4 cup', '1', '2018-06-06 12:50:18', '2018-06-06 12:50:18');
INSERT INTO `expenses` VALUES ('2462', null, '2017-10-10', '2', '10', null, '', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2463', null, '2017-10-10', '2463', '4309', null, 'FULL PAID', '1', null, null);
INSERT INTO `expenses` VALUES ('2464', null, '2017-10-11', '10', '25', null, '', '1', '2018-06-06 12:50:18', '2018-06-06 12:50:18');
INSERT INTO `expenses` VALUES ('2465', null, '2017-10-11', '43', '460', null, 'PUJA TO 11/10/2017', '1', '2018-06-06 13:08:23', '2018-06-06 13:08:23');
INSERT INTO `expenses` VALUES ('2466', null, '2017-10-12', '43', '14', null, '1 pic  DVD', '1', '2018-06-06 13:08:23', '2018-06-06 13:08:23');
INSERT INTO `expenses` VALUES ('2467', null, '2017-10-13', '21', '200', null, '', '1', '2018-06-06 12:53:42', '2018-06-06 12:53:42');
INSERT INTO `expenses` VALUES ('2468', null, '2017-10-13', '10', '30', null, '', '1', '2018-06-06 12:50:18', '2018-06-06 12:50:18');
INSERT INTO `expenses` VALUES ('2469', null, '2017-10-13', '2', '30', null, '', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2470', null, '2017-10-14', '2', '10', null, 'LABU LANKA', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2471', null, '2017-10-14', '2', '100', null, 'DAN', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2472', null, '2017-10-16', '10', '45', null, '', '1', '2018-06-06 12:50:18', '2018-06-06 12:50:18');
INSERT INTO `expenses` VALUES ('2473', null, '2017-10-16', '2', '160', null, 'KHAM', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2474', null, '2017-10-16', '4', '30', null, ' ', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('2475', null, '2017-10-17', '2831', '40', null, 'DADAVAICLUB\r\n', '1', '2018-06-06 14:01:30', '2018-06-06 14:01:30');
INSERT INTO `expenses` VALUES ('2476', null, '2017-10-17', '21', '200', null, '', '1', '2018-06-06 12:53:42', '2018-06-06 12:53:42');
INSERT INTO `expenses` VALUES ('2477', null, '2017-10-17', '10', '40', null, '', '1', '2018-06-06 12:50:18', '2018-06-06 12:50:18');
INSERT INTO `expenses` VALUES ('2478', null, '2017-10-17', '2831', '70', null, 'KADAMTALA YOUTH CLUB', '1', '2018-06-06 14:01:30', '2018-06-06 14:01:30');
INSERT INTO `expenses` VALUES ('2479', null, '2017-10-17', '2', '200', null, '', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2480', null, '2017-10-17', '4', '30', null, '', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('2481', null, '2017-10-18', '2831', '40', null, 'NATUN PARASARBOJANIN ADI', '1', '2018-06-06 14:01:30', '2018-06-06 14:01:30');
INSERT INTO `expenses` VALUES ('2482', null, '2017-10-18', '2855', '7500', null, 'durga puja patkata calony', '1', '2018-06-06 14:10:58', '2018-06-06 14:10:58');
INSERT INTO `expenses` VALUES ('2483', null, '2017-10-18', '2831', '20', null, 'youth care', '1', '2018-06-06 14:01:30', '2018-06-06 14:01:30');
INSERT INTO `expenses` VALUES ('2484', null, '2017-10-18', '2831', '50', null, '', '1', '2018-06-06 14:01:30', '2018-06-06 14:01:30');
INSERT INTO `expenses` VALUES ('2485', null, '2017-10-18', '4', '30', null, '', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('2486', null, '2017-10-18', '2', '25', null, 'TAILAR', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2487', null, '2017-10-18', '48', '70', null, '', '1', '2018-06-07 11:51:41', '2018-06-07 11:51:41');
INSERT INTO `expenses` VALUES ('2488', null, '2017-10-18', '48', '50', null, '', '1', '2018-06-07 11:51:41', '2018-06-07 11:51:41');
INSERT INTO `expenses` VALUES ('2489', null, '2017-10-18', '40', '20', null, '', '1', '2018-06-06 13:07:24', '2018-06-06 13:07:24');
INSERT INTO `expenses` VALUES ('2490', null, '2017-10-18', '2', '10', null, 'I LEAD', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2491', null, '2017-10-19', '2831', '30', null, 'ADARSHO BYAMAGAR', '1', '2018-06-06 14:01:30', '2018-06-06 14:01:30');
INSERT INTO `expenses` VALUES ('2492', null, '2017-10-19', '2831', '100', null, 'SANDHANI', '1', '2018-06-06 14:01:30', '2018-06-06 14:01:30');
INSERT INTO `expenses` VALUES ('2493', null, '2017-10-19', '2831', '40', null, 'NABIN SANGHA', '1', '2018-06-06 14:01:30', '2018-06-06 14:01:30');
INSERT INTO `expenses` VALUES ('2494', null, '2017-10-19', '4', '30', null, '', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('2495', null, '2017-10-23', '4', '120', null, '4DAY', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('2496', null, '2017-10-23', '40', '305', null, 'SUMAN TINKU GOBINDA\r\nSONTU RICE EATING CEREMONY ', '1', '2018-06-06 13:07:24', '2018-06-06 13:07:24');
INSERT INTO `expenses` VALUES ('2497', null, '2017-10-23', '10', '10', null, '', '1', '2018-06-06 12:50:18', '2018-06-06 12:50:18');
INSERT INTO `expenses` VALUES ('2498', null, '2017-10-24', '2831', '60', null, 'MOONLIGHT CLUB', '1', '2018-06-06 14:01:30', '2018-06-06 14:01:30');
INSERT INTO `expenses` VALUES ('2499', null, '2017-10-19', '2137', '500', null, 'GOBINDA', '1', '2018-06-06 13:49:40', '2018-06-06 13:49:40');
INSERT INTO `expenses` VALUES ('2500', null, '2017-10-19', '2137', '500', null, 'TINKU', '1', '2018-06-06 13:49:40', '2018-06-06 13:49:40');
INSERT INTO `expenses` VALUES ('2501', null, '2017-10-19', '2137', '500', null, 'BIJOY', '1', '2018-06-06 13:49:40', '2018-06-06 13:49:40');
INSERT INTO `expenses` VALUES ('2502', null, '2017-10-19', '2137', '500', null, 'SUMAN', '1', '2018-06-06 13:49:40', '2018-06-06 13:49:40');
INSERT INTO `expenses` VALUES ('2503', null, '2017-10-19', '2137', '500', null, 'CHOTTU', '1', '2018-06-06 13:49:40', '2018-06-06 13:49:40');
INSERT INTO `expenses` VALUES ('2504', null, '2017-10-24', '88', '1121', null, 'MONTH OF OCT-NOV 17', '1', '2018-06-06 13:20:01', '2018-06-06 13:20:01');
INSERT INTO `expenses` VALUES ('2505', null, '2017-10-24', '2', '20', null, '', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2506', null, '2017-10-24', '2', '20', null, 'SHIV SENA', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2507', null, '2017-10-19', '2507', '1350', null, 'SWEETS', '1', null, null);
INSERT INTO `expenses` VALUES ('2508', null, '2017-10-19', '2507', '301', null, 'PANDIT JEE', '1', '2018-06-06 16:10:10', '2018-06-06 16:10:10');
INSERT INTO `expenses` VALUES ('2509', null, '2017-10-19', '2507', '790', null, 'MISC. EXP.', '1', '2018-06-06 16:10:10', '2018-06-06 16:10:10');
INSERT INTO `expenses` VALUES ('2510', null, '2017-10-25', '21', '400', null, '', '1', '2018-06-06 12:53:42', '2018-06-06 12:53:42');
INSERT INTO `expenses` VALUES ('2511', null, '2017-10-25', '2', '40', null, 'CELLOTAP', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2512', null, '2017-10-25', '10', '10', null, '\r\n', '1', '2018-06-06 12:50:18', '2018-06-06 12:50:18');
INSERT INTO `expenses` VALUES ('2513', null, '2017-10-25', '4', '30', null, '', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('2514', null, '2017-10-25', '51', '320', null, '200pic  kham', '1', '2018-06-06 13:10:49', '2018-06-06 13:10:49');
INSERT INTO `expenses` VALUES ('2515', null, '2017-10-26', '10', '30', null, '', '1', '2018-06-06 12:50:18', '2018-06-06 12:50:18');
INSERT INTO `expenses` VALUES ('2516', null, '2017-10-26', '7', '50', null, 'GOBINDA', '1', '2018-06-06 12:47:55', '2018-06-06 12:47:55');
INSERT INTO `expenses` VALUES ('2517', null, '2017-10-27', '10', '20', null, '', '1', '2018-06-06 12:50:18', '2018-06-06 12:50:18');
INSERT INTO `expenses` VALUES ('2518', null, '2017-10-27', '4', '30', null, '', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('2519', null, '2017-10-28', '10', '10', null, '', '1', '2018-06-06 12:50:18', '2018-06-06 12:50:18');
INSERT INTO `expenses` VALUES ('2520', null, '2017-10-28', '2', '10', null, 'LABU LANKA\r\n', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2521', null, '2017-10-28', '2', '40', null, '', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2522', null, '2017-10-28', '21', '200', null, '', '1', '2018-06-06 12:53:42', '2018-06-06 12:53:42');
INSERT INTO `expenses` VALUES ('2523', null, '2017-10-28', '4', '30', null, '', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('2524', null, '2017-10-28', '2', '20', null, '', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2525', null, '2017-10-28', '10', '10', null, '', '1', '2018-06-06 12:50:18', '2018-06-06 12:50:18');
INSERT INTO `expenses` VALUES ('2526', null, '2017-10-30', '43', '406', null, '', '1', '2018-06-06 13:08:23', '2018-06-06 13:08:23');
INSERT INTO `expenses` VALUES ('2527', null, '2017-10-30', '10', '10', null, '', '1', '2018-06-06 12:50:18', '2018-06-06 12:50:18');
INSERT INTO `expenses` VALUES ('2528', null, '2017-10-31', '10', '20', null, '', '1', '2018-06-06 12:50:18', '2018-06-06 12:50:18');
INSERT INTO `expenses` VALUES ('2529', null, '2017-10-31', '48', '80', null, '', '1', '2018-06-07 11:51:41', '2018-06-07 11:51:41');
INSERT INTO `expenses` VALUES ('2530', null, '2017-10-31', '4', '30', null, '', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('2531', null, '2017-11-01', '7', '70', null, 'GOBINDA', '1', '2018-06-06 12:47:55', '2018-06-06 12:47:55');
INSERT INTO `expenses` VALUES ('2532', null, '2017-11-01', '4', '30', null, '', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('2533', null, '2017-11-01', '10', '20', null, '', '1', '2018-06-06 12:50:18', '2018-06-06 12:50:18');
INSERT INTO `expenses` VALUES ('2534', null, '2017-11-01', '21', '200', null, '', '1', '2018-06-06 12:53:42', '2018-06-06 12:53:42');
INSERT INTO `expenses` VALUES ('2535', null, '2017-11-01', '104', '4500', null, 'MONTH OF OCT. 17', '1', '2018-06-06 13:23:52', '2018-06-06 13:23:52');
INSERT INTO `expenses` VALUES ('2536', null, '2017-11-02', '2', '70', null, 'TINKU OR GOBI ', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2537', null, '2017-11-02', '48', '180', null, 'TGBS FOOD', '1', '2018-06-07 11:51:41', '2018-06-07 11:51:41');
INSERT INTO `expenses` VALUES ('2538', null, '2017-11-02', '2', '40', null, 'toto  Gobinda', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2539', null, '2017-11-02', '2', '20', null, 'bis', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2540', null, '2017-11-03', '4', '60', null, '2 days\r\n', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('2541', null, '2017-11-03', '105', '200', null, '', '1', '2018-06-06 13:24:19', '2018-06-06 13:24:19');
INSERT INTO `expenses` VALUES ('2542', null, '2017-11-04', '2', '10', null, 'labu', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2543', null, '2017-11-04', '4', '30', null, '', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('2544', null, '2017-11-04', '4', '110', null, 'FOOD', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('2545', null, '2017-11-04', '21', '200', null, '', '1', '2018-06-06 12:53:42', '2018-06-06 12:53:42');
INSERT INTO `expenses` VALUES ('2546', null, '2017-11-04', '10', '30', null, '', '1', '2018-06-06 12:50:18', '2018-06-06 12:50:18');
INSERT INTO `expenses` VALUES ('2547', null, '2017-11-04', '2', '30', null, 'DAN', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2548', null, '2017-11-06', '7', '70', null, '', '1', '2018-06-06 12:47:55', '2018-06-06 12:47:55');
INSERT INTO `expenses` VALUES ('2549', null, '2017-11-06', '4', '30', null, '', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('2550', null, '2017-11-06', '2', '30', null, '', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2551', null, '2017-11-06', '2', '10', null, '', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2552', null, '2017-11-07', '10', '20', null, '', '1', '2018-06-06 12:50:18', '2018-06-06 12:50:18');
INSERT INTO `expenses` VALUES ('2553', null, '2017-11-08', '21', '200', null, '', '1', '2018-06-06 12:53:42', '2018-06-06 12:53:42');
INSERT INTO `expenses` VALUES ('2554', null, '2017-11-08', '2', '100', null, 'BLACK TEB', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2555', null, '2017-11-08', '10', '40', null, '', '1', '2018-06-06 12:50:18', '2018-06-06 12:50:18');
INSERT INTO `expenses` VALUES ('2556', null, '2017-11-08', '7', '130', null, 'GOBINDA  FOOD', '1', '2018-06-06 12:47:55', '2018-06-06 12:47:55');
INSERT INTO `expenses` VALUES ('2557', null, '2017-11-08', '7', '80', null, 'MOMO ', '1', '2018-06-06 12:47:55', '2018-06-06 12:47:55');
INSERT INTO `expenses` VALUES ('2558', null, '2017-11-08', '10', '20', null, 'GOBI TINKU', '1', '2018-06-06 12:50:18', '2018-06-06 12:50:18');
INSERT INTO `expenses` VALUES ('2559', null, '2017-11-09', '10', '40', null, '', '1', '2018-06-06 12:50:18', '2018-06-06 12:50:18');
INSERT INTO `expenses` VALUES ('2560', null, '2017-11-09', '7', '100', null, 'gobi', '1', '2018-06-06 12:47:55', '2018-06-06 12:47:55');
INSERT INTO `expenses` VALUES ('2561', null, '2017-11-09', '2', '20', null, '', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2562', null, '2017-11-09', '4', '90', null, '7-9   3 DAY ', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('2563', null, '2017-11-10', '51', '160', null, '100PIC ', '1', '2018-06-06 13:10:49', '2018-06-06 13:10:49');
INSERT INTO `expenses` VALUES ('2564', null, '2017-11-10', '48', '30', null, '', '1', '2018-06-07 11:51:41', '2018-06-07 11:51:41');
INSERT INTO `expenses` VALUES ('2565', null, '2017-11-10', '10', '20', null, '', '1', '2018-06-06 12:50:18', '2018-06-06 12:50:18');
INSERT INTO `expenses` VALUES ('2566', null, '2017-11-10', '10', '10', null, '', '1', '2018-06-06 12:50:18', '2018-06-06 12:50:18');
INSERT INTO `expenses` VALUES ('2567', null, '2017-11-10', '21', '200', null, '', '1', '2018-06-06 12:53:42', '2018-06-06 12:53:42');
INSERT INTO `expenses` VALUES ('2568', null, '2017-11-10', '2', '20', null, 'DAN AND MIX', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2569', null, '2017-11-11', '10', '50', null, 'TEA KAKA', '1', '2018-06-06 12:50:18', '2018-06-06 12:50:18');
INSERT INTO `expenses` VALUES ('2570', null, '2017-11-11', '4', '60', null, '2DAY', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('2571', null, '2017-11-11', '40', '150', null, 'BBS HOTEL AND TOTO VARA', '1', '2018-06-06 13:07:24', '2018-06-06 13:07:24');
INSERT INTO `expenses` VALUES ('2572', null, '2017-11-11', '2', '10', null, 'LABU', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2573', null, '2017-11-11', '2', '40', null, 'DAN', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2574', null, '2017-11-11', '40', '20', null, 'TINKU ', '1', '2018-06-06 13:07:24', '2018-06-06 13:07:24');
INSERT INTO `expenses` VALUES ('2575', null, '2017-11-13', '2119', '100', null, 'VISITING CARD BOX 10 PIS', '1', '2018-06-06 13:47:29', '2018-06-06 13:47:29');
INSERT INTO `expenses` VALUES ('2576', null, '2017-11-13', '10', '15', null, '', '1', '2018-06-06 12:50:18', '2018-06-06 12:50:18');
INSERT INTO `expenses` VALUES ('2577', null, '2017-11-14', '58', '900', null, 'L800', '1', '2018-06-06 13:15:02', '2018-06-06 13:15:02');
INSERT INTO `expenses` VALUES ('2578', null, '2017-11-14', '7', '100', null, 'GOBI', '1', '2018-06-06 12:47:55', '2018-06-06 12:47:55');
INSERT INTO `expenses` VALUES ('2579', null, '2017-11-14', '4', '60', null, '13 OR 14', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('2580', null, '2017-11-14', '10', '60', null, '', '1', '2018-06-06 12:50:18', '2018-06-06 12:50:18');
INSERT INTO `expenses` VALUES ('2581', null, '2017-11-15', '21', '200', null, '', '1', '2018-06-06 12:53:42', '2018-06-06 12:53:42');
INSERT INTO `expenses` VALUES ('2582', null, '2017-11-15', '4', '30', null, '', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('2583', null, '2017-11-15', '51', '160', null, '100pic', '1', '2018-06-06 13:10:49', '2018-06-06 13:10:49');
INSERT INTO `expenses` VALUES ('2584', null, '2017-11-15', '10', '35', null, ' ', '1', '2018-06-06 12:50:18', '2018-06-06 12:50:18');
INSERT INTO `expenses` VALUES ('2585', null, '2017-11-16', '4', '30', null, '', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('2586', null, '2017-11-16', '10', '55', null, '', '1', '2018-06-06 12:50:18', '2018-06-06 12:50:18');
INSERT INTO `expenses` VALUES ('2587', null, '2017-11-07', '2507', '5900', null, 'AMRIT MISTI DOKAN', '1', '2018-06-06 16:10:10', '2018-06-06 16:10:10');
INSERT INTO `expenses` VALUES ('2588', null, '2017-11-07', '7', '300', null, 'GOBI TINKU ANKITA ', '1', '2018-06-06 12:47:55', '2018-06-06 12:47:55');
INSERT INTO `expenses` VALUES ('2590', null, '2017-11-07', '2507', '1500', null, 'PUJAR BAZAR', '1', '2018-06-06 16:10:10', '2018-06-06 16:10:10');
INSERT INTO `expenses` VALUES ('2591', null, '2017-11-07', '2507', '300', null, 'PANDIT JI', '1', '2018-06-06 16:10:10', '2018-06-06 16:10:10');
INSERT INTO `expenses` VALUES ('2592', null, '2017-11-06', '40', '300', null, 'GOBI TINKU (DIPA PREWEDDING)', '1', '2018-06-06 13:07:24', '2018-06-06 13:07:24');
INSERT INTO `expenses` VALUES ('2593', null, '2017-11-07', '7', '4700', null, '10 YEARS CELEBRATION\r\n10MEMBERS ', '1', '2018-06-06 12:47:55', '2018-06-06 12:47:55');
INSERT INTO `expenses` VALUES ('2594', null, '2017-11-17', '10', '45', null, '', '1', '2018-06-06 12:50:18', '2018-06-06 12:50:18');
INSERT INTO `expenses` VALUES ('2595', null, '2017-11-17', '2', '500', null, 'Dan', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2596', null, '2017-11-17', '2', '10', null, 'DAN', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2597', null, '2017-11-18', '21', '200', null, '', '1', '2018-06-06 12:53:42', '2018-06-06 12:53:42');
INSERT INTO `expenses` VALUES ('2598', null, '2017-11-18', '43', '350', null, '', '1', '2018-06-06 13:08:23', '2018-06-06 13:08:23');
INSERT INTO `expenses` VALUES ('2599', null, '2017-11-18', '2', '50', null, 'DAN', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2600', null, '2017-11-18', '4', '60', null, '2DAY', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('2601', null, '2017-11-18', '2', '10', null, 'KULI', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2602', null, '2017-11-20', '21', '200', null, '', '1', '2018-06-06 12:53:42', '2018-06-06 12:53:42');
INSERT INTO `expenses` VALUES ('2603', null, '2017-11-20', '4', '30', null, '\r\n', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('2604', null, '2017-11-21', '4', '30', null, '', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('2605', null, '2017-11-20', '2', '3500', null, 'BABAI DA FOR-DECORATION', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2606', null, '2017-11-21', '10', '40', null, ' ', '1', '2018-06-06 12:50:18', '2018-06-06 12:50:18');
INSERT INTO `expenses` VALUES ('2607', null, '2017-11-22', '10', '50', null, '', '1', '2018-06-06 12:50:18', '2018-06-06 12:50:18');
INSERT INTO `expenses` VALUES ('2608', null, '2017-11-22', '4', '30', null, '', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('2609', null, '2017-11-22', '2', '200', null, 'COURIER CHARG (TUSHAR)', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2610', null, '2017-11-23', '88', '1121', null, 'MONTH OF NOVEMBER 17', '1', '2018-06-06 13:20:01', '2018-06-06 13:20:01');
INSERT INTO `expenses` VALUES ('2611', null, '2017-11-23', '10', '100', null, '', '1', '2018-06-06 12:50:18', '2018-06-06 12:50:18');
INSERT INTO `expenses` VALUES ('2612', null, '2017-11-23', '4', '30', null, '', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('2613', null, '2017-11-23', '21', '200', null, '', '1', '2018-06-06 12:53:42', '2018-06-06 12:53:42');
INSERT INTO `expenses` VALUES ('2614', null, '2017-11-22', '2119', '4100', null, 'EXTERNAL HARD DISK 1TB (WD)', '1', '2018-06-06 13:47:29', '2018-06-06 13:47:29');
INSERT INTO `expenses` VALUES ('2615', null, '2017-11-24', '10', '30', null, '', '1', '2018-06-06 12:50:18', '2018-06-06 12:50:18');
INSERT INTO `expenses` VALUES ('2616', null, '2017-11-25', '2', '10', null, 'labu\r\n', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2617', null, '2017-11-25', '43', '185', null, '', '1', '2018-06-06 13:08:23', '2018-06-06 13:08:23');
INSERT INTO `expenses` VALUES ('2618', null, '2017-11-25', '10', '25', null, '', '1', '2018-06-06 12:50:18', '2018-06-06 12:50:18');
INSERT INTO `expenses` VALUES ('2619', null, '2017-11-25', '2', '30', null, 'DAN', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2620', null, '2017-11-25', '48', '160', null, '', '1', '2018-06-07 11:51:41', '2018-06-07 11:51:41');
INSERT INTO `expenses` VALUES ('2621', null, '2017-11-27', '10', '20', null, ' ', '1', '2018-06-06 12:50:18', '2018-06-06 12:50:18');
INSERT INTO `expenses` VALUES ('2622', null, '2017-11-28', '21', '200', null, '', '1', '2018-06-06 12:53:42', '2018-06-06 12:53:42');
INSERT INTO `expenses` VALUES ('2623', null, '2017-11-28', '10', '40', null, '', '1', '2018-06-06 12:50:18', '2018-06-06 12:50:18');
INSERT INTO `expenses` VALUES ('2624', null, '2017-11-28', '2', '20', null, 'dan ', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2625', null, '2017-11-28', '40', '20', null, 'SILIGURI (DADAR  BLAJER)', '1', '2018-06-06 13:07:24', '2018-06-06 13:07:24');
INSERT INTO `expenses` VALUES ('2626', null, '2017-11-28', '2', '1224', null, 'NEWS PAPER ( KRISHNA HELA ) NOV TO OCT  FULL PAID', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2627', null, '2017-11-29', '2', '40', null, 'cod (plack)', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2628', null, '2017-11-29', '2', '100', null, 'black teb 6pic', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2629', null, '2017-11-29', '10', '20', null, '', '1', '2018-06-06 12:50:18', '2018-06-06 12:50:18');
INSERT INTO `expenses` VALUES ('2630', null, '2017-11-29', '7', '100', null, 'GOBI', '1', '2018-06-06 12:47:55', '2018-06-06 12:47:55');
INSERT INTO `expenses` VALUES ('2631', null, '2017-11-30', '10', '35', null, '', '1', '2018-06-06 12:50:18', '2018-06-06 12:50:18');
INSERT INTO `expenses` VALUES ('2632', null, '2017-12-01', '105', '200', null, '', '1', '2018-06-06 13:24:19', '2018-06-06 13:24:19');
INSERT INTO `expenses` VALUES ('2633', null, '2017-12-01', '2', '300', null, 'ODER KHAM 5X7', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2634', null, '2017-12-01', '10', '50', null, '', '1', '2018-06-06 12:50:18', '2018-06-06 12:50:18');
INSERT INTO `expenses` VALUES ('2635', null, '2017-12-01', '7', '60', null, 'TINKU', '1', '2018-06-06 12:47:55', '2018-06-06 12:47:55');
INSERT INTO `expenses` VALUES ('2636', null, '2017-12-01', '21', '200', null, '', '1', '2018-06-06 12:53:42', '2018-06-06 12:53:42');
INSERT INTO `expenses` VALUES ('2637', null, '2017-12-02', '2', '10', null, 'labu', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2638', null, '2017-12-04', '7', '60', null, 'TINKU', '1', '2018-06-06 12:47:55', '2018-06-06 12:47:55');
INSERT INTO `expenses` VALUES ('2639', null, '2017-12-04', '10', '40', null, '', '1', '2018-06-06 12:50:18', '2018-06-06 12:50:18');
INSERT INTO `expenses` VALUES ('2640', null, '2017-12-06', '21', '200', null, '', '1', '2018-06-06 12:53:42', '2018-06-06 12:53:42');
INSERT INTO `expenses` VALUES ('2641', null, '2017-12-06', '10', '50', null, '', '1', '2018-06-06 12:50:18', '2018-06-06 12:50:18');
INSERT INTO `expenses` VALUES ('2642', null, '2017-12-06', '40', '60', null, 'SUMAM ( JPG TO SLG)', '1', '2018-06-06 13:07:24', '2018-06-06 13:07:24');
INSERT INTO `expenses` VALUES ('2643', null, '2017-12-07', '8', '850', null, 'SAMAR DA', '1', '2018-06-06 12:48:34', '2018-06-06 12:48:34');
INSERT INTO `expenses` VALUES ('2644', null, '2017-12-08', '40', '5000', null, 'FOOD + TRAVELL\r\nRANOJAY, MOUSHUMI, DIPA WEDDING', '1', '2018-06-06 13:07:24', '2018-06-06 13:07:24');
INSERT INTO `expenses` VALUES ('2645', null, '2017-12-08', '2', '70', null, 'FINAL', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2646', null, '2017-12-11', '21', '400', null, '', '1', '2018-06-06 12:53:42', '2018-06-06 12:53:42');
INSERT INTO `expenses` VALUES ('2647', null, '2017-12-11', '7', '60', null, 'GOBI SUMAN', '1', '2018-06-06 12:47:55', '2018-06-06 12:47:55');
INSERT INTO `expenses` VALUES ('2648', null, '2017-12-11', '2', '10', null, 'DAN', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2649', null, '2017-12-12', '8', '5107', null, 'MONTH OF DEC TO FEB 18', '1', '2018-06-06 12:48:34', '2018-06-06 12:48:34');
INSERT INTO `expenses` VALUES ('2650', null, '2017-12-12', '7', '70', null, 'GOBI', '1', '2018-06-06 12:47:55', '2018-06-06 12:47:55');
INSERT INTO `expenses` VALUES ('2651', null, '2017-12-13', '2', '430', null, 'ANIKET WEIDDING GOBI SUMAN ANKITA', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2652', null, '2017-12-13', '7', '60', null, 'GOBI', '1', '2018-06-06 12:47:55', '2018-06-06 12:47:55');
INSERT INTO `expenses` VALUES ('2653', null, '2017-12-13', '10', '20', null, '', '1', '2018-06-06 12:50:18', '2018-06-06 12:50:18');
INSERT INTO `expenses` VALUES ('2654', null, '2017-12-14', '10', '50', null, '', '1', '2018-06-06 12:50:18', '2018-06-06 12:50:18');
INSERT INTO `expenses` VALUES ('2655', null, '2017-12-14', '2', '30', null, 'BETARI', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2656', null, '2017-12-14', '40', '540', null, 'TINKU( SLG OR NEPAL ) FOOD AND  TRAVELLING', '1', '2018-06-06 13:07:24', '2018-06-06 13:07:24');
INSERT INTO `expenses` VALUES ('2657', null, '2017-12-15', '21', '200', null, 'UCO BANK', '1', '2018-06-06 12:53:42', '2018-06-06 12:53:42');
INSERT INTO `expenses` VALUES ('2658', null, '2017-12-15', '4', '570', null, '24NOV TO 15DEC', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('2659', null, '2017-12-15', '7', '50', null, '', '1', '2018-06-06 12:47:55', '2018-06-06 12:47:55');
INSERT INTO `expenses` VALUES ('2660', null, '2017-12-15', '10', '30', null, '', '1', '2018-06-06 12:50:18', '2018-06-06 12:50:18');
INSERT INTO `expenses` VALUES ('2661', null, '2017-12-16', '10', '30', null, ' ', '1', '2018-06-06 12:50:18', '2018-06-06 12:50:18');
INSERT INTO `expenses` VALUES ('2662', null, '2017-12-16', '7', '80', null, 'gobinda', '1', '2018-06-06 12:47:55', '2018-06-06 12:47:55');
INSERT INTO `expenses` VALUES ('2663', null, '2017-12-16', '2', '80', null, '', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2664', null, '2017-12-16', '7', '80', null, 'GOBI', '1', '2018-06-06 12:47:55', '2018-06-06 12:47:55');
INSERT INTO `expenses` VALUES ('2665', null, '2017-12-16', '4', '30', null, '', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('2666', null, '2017-12-16', '2', '20', null, 'DAN', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2667', null, '2017-12-16', '43', '300', null, '', '1', '2018-06-06 13:08:23', '2018-06-06 13:08:23');
INSERT INTO `expenses` VALUES ('2668', null, '2017-12-16', '48', '120', null, '', '1', '2018-06-07 11:51:41', '2018-06-07 11:51:41');
INSERT INTO `expenses` VALUES ('2669', null, '2017-12-16', '2', '10', null, 'LABU LANKA', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2670', null, '2017-12-18', '7', '70', null, 'GOBI', '1', '2018-06-06 12:47:55', '2018-06-06 12:47:55');
INSERT INTO `expenses` VALUES ('2671', null, '2017-12-18', '48', '50', null, '', '1', '2018-06-07 11:51:41', '2018-06-07 11:51:41');
INSERT INTO `expenses` VALUES ('2672', null, '2017-12-18', '2', '30', null, '', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2673', null, '2017-12-18', '2', '20', null, 'COOLI', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2674', null, '2017-12-19', '10', '35', null, '', '1', '2018-06-06 12:50:18', '2018-06-06 12:50:18');
INSERT INTO `expenses` VALUES ('2675', null, '2017-12-19', '7', '60', null, '', '1', '2018-06-06 12:47:55', '2018-06-06 12:47:55');
INSERT INTO `expenses` VALUES ('2676', null, '2017-12-19', '21', '200', null, '', '1', '2018-06-06 12:53:42', '2018-06-06 12:53:42');
INSERT INTO `expenses` VALUES ('2677', null, '2017-12-19', '48', '60', null, '', '1', '2018-06-07 11:51:41', '2018-06-07 11:51:41');
INSERT INTO `expenses` VALUES ('2678', null, '2017-12-20', '62', '10', null, 'BURI THAKUMA', '1', '2018-06-06 13:16:32', '2018-06-06 13:16:32');
INSERT INTO `expenses` VALUES ('2679', null, '2017-12-20', '62', '10', null, 'DAN', '1', '2018-06-06 13:16:32', '2018-06-06 13:16:32');
INSERT INTO `expenses` VALUES ('2680', null, '2017-12-20', '10', '30', null, '', '1', '2018-06-06 12:50:18', '2018-06-06 12:50:18');
INSERT INTO `expenses` VALUES ('2681', null, '2017-12-20', '7', '60', null, 'gobi', '1', '2018-06-06 12:47:55', '2018-06-06 12:47:55');
INSERT INTO `expenses` VALUES ('2682', null, '2017-12-20', '4', '90', null, '3 DAY', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('2683', null, '2017-12-20', '2', '20', null, 'CHADA', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2684', null, '2017-12-21', '7', '60', null, 'SUMAN', '1', '2018-06-06 12:47:55', '2018-06-06 12:47:55');
INSERT INTO `expenses` VALUES ('2685', null, '2017-12-21', '2', '610', null, 'GOBI SWAPAN SLG ', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2686', null, '2017-12-21', '2', '9000', null, 'NEPAL BIRATNAGAR WEDDING\r\nSWAPAN ', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2687', null, '2017-12-21', '104', '4500', null, 'MONTH OF NOV 17', '1', '2018-06-06 13:23:52', '2018-06-06 13:23:52');
INSERT INTO `expenses` VALUES ('2688', null, '2017-12-22', '7', '60', null, 'GOBI', '1', '2018-06-06 12:47:55', '2018-06-06 12:47:55');
INSERT INTO `expenses` VALUES ('2689', null, '2017-12-22', '4', '60', null, '2 DAY', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('2690', null, '2017-12-23', '2', '10', null, 'LEBU LONKA', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2691', null, '2017-12-23', '88', '1120', null, 'ALLIANCE BROADBAND SERVCE NET', '1', '2018-06-06 13:20:01', '2018-06-06 13:20:01');
INSERT INTO `expenses` VALUES ('2692', null, '2017-12-23', '2', '30', null, 'DAN', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2693', null, '2017-12-23', '4', '30', null, '', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('2694', null, '2017-12-25', '21', '200', null, '', '1', '2018-06-06 12:53:42', '2018-06-06 12:53:42');
INSERT INTO `expenses` VALUES ('2695', null, '2017-12-25', '4', '30', null, '', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('2696', null, '2017-12-26', '4', '30', null, '', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('2697', null, '2017-12-27', '21', '200', null, 'UCO BANK', '1', '2018-06-06 12:53:42', '2018-06-06 12:53:42');
INSERT INTO `expenses` VALUES ('2698', null, '2017-12-27', '2', '180', null, 'DOKANER TEA BANAR JENES', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2699', null, '2017-12-27', '7', '80', null, 'dada', '1', '2018-06-06 12:47:55', '2018-06-06 12:47:55');
INSERT INTO `expenses` VALUES ('2700', null, '2017-12-27', '40', '200', null, 'GOBINDO  SILIGURI', '1', '2018-06-06 13:07:24', '2018-06-06 13:07:24');
INSERT INTO `expenses` VALUES ('2701', null, '2017-12-28', '4', '60', null, '2DAY', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('2702', null, '2017-12-29', '2463', '1750', null, '', '1', '2018-06-07 11:08:42', '2018-06-07 11:08:42');
INSERT INTO `expenses` VALUES ('2703', null, '2017-12-29', '21', '200', null, '', '1', '2018-06-06 12:53:42', '2018-06-06 12:53:42');
INSERT INTO `expenses` VALUES ('2704', null, '2017-12-29', '2', '30', null, 'RS TAG', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2705', null, '2017-12-30', '2', '10', null, 'LEBU LANKA', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2706', null, '2017-12-30', '2', '30', null, 'DAN', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2707', null, '2017-12-29', '7', '230', null, 'GOBINDA', '1', '2018-06-06 12:47:55', '2018-06-06 12:47:55');
INSERT INTO `expenses` VALUES ('2708', null, '2017-12-30', '8', '1500', null, 'SAMAR DA', '1', '2018-06-06 12:48:34', '2018-06-06 12:48:34');
INSERT INTO `expenses` VALUES ('2709', null, '2018-01-01', '21', '200', null, '', '1', '2018-06-06 12:53:42', '2018-06-06 12:53:42');
INSERT INTO `expenses` VALUES ('2710', null, '2018-01-01', '7', '100', null, '2 DAY ', '1', '2018-06-06 12:47:55', '2018-06-06 12:47:55');
INSERT INTO `expenses` VALUES ('2711', null, '2018-01-01', '4', '90', null, '3 DAY', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('2712', null, '2018-01-01', '105', '160', null, '8', '1', '2018-06-06 13:24:19', '2018-06-06 13:24:19');
INSERT INTO `expenses` VALUES ('2713', null, '2018-01-02', '4', '30', null, '', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('2714', null, '2018-01-02', '43', '580', null, '', '1', '2018-06-06 13:08:23', '2018-06-06 13:08:23');
INSERT INTO `expenses` VALUES ('2715', null, '2018-01-02', '104', '4500', null, 'MONTH OF DEC', '1', '2018-06-06 13:23:52', '2018-06-06 13:23:52');
INSERT INTO `expenses` VALUES ('2716', null, '2018-01-03', '4', '30', null, '', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('2717', null, '2018-01-04', '4', '30', null, '', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('2718', null, '2018-01-05', '21', '200', null, '', '1', '2018-06-06 12:53:42', '2018-06-06 12:53:42');
INSERT INTO `expenses` VALUES ('2719', null, '2018-01-05', '4', '30', null, '', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('2720', null, '2018-01-08', '2', '10', null, 'LABU LANKA', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2721', null, '2018-01-08', '7', '60', null, 'gobi', '1', '2018-06-06 12:47:55', '2018-06-06 12:47:55');
INSERT INTO `expenses` VALUES ('2722', null, '2018-01-08', '48', '180', null, 'PINTU GOBI SUMAN+ BIJOY', '1', '2018-06-07 11:51:41', '2018-06-07 11:51:41');
INSERT INTO `expenses` VALUES ('2723', null, '2018-01-08', '4', '60', null, '2 DAY', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('2724', null, '2018-01-09', '21', '200', null, '', '1', '2018-06-06 12:53:42', '2018-06-06 12:53:42');
INSERT INTO `expenses` VALUES ('2725', null, '2018-01-10', '40', '10', null, 'TOTO VARA BIJOY', '1', '2018-06-06 13:07:24', '2018-06-06 13:07:24');
INSERT INTO `expenses` VALUES ('2726', null, '2018-01-10', '48', '100', null, '', '1', '2018-06-07 11:51:41', '2018-06-07 11:51:41');
INSERT INTO `expenses` VALUES ('2727', null, '2018-01-10', '2', '25', null, '', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2728', null, '2018-01-10', '2', '160', null, 'A KHAM', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2729', null, '2018-01-10', '7', '40', null, '', '1', '2018-06-06 12:47:55', '2018-06-06 12:47:55');
INSERT INTO `expenses` VALUES ('2730', null, '2018-01-11', '2', '250', null, 'VISHAL MEGHAMART\r\nPAPOSH ', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2731', null, '2018-01-11', '7', '90', null, 'GOBI', '1', '2018-06-06 12:47:55', '2018-06-06 12:47:55');
INSERT INTO `expenses` VALUES ('2732', null, '2018-01-11', '4', '90', null, '3DAY', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('2733', null, '2018-01-11', '2', '510', null, 'VISHAL MEGHA MART\r\nPAPOSH', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2734', null, '2018-01-12', '8', '50', null, ' TUBELIGHT FOR STUDIO', '1', '2018-06-06 12:48:34', '2018-06-06 12:48:34');
INSERT INTO `expenses` VALUES ('2735', null, '2018-01-12', '21', '200', null, '', '1', '2018-06-06 12:53:42', '2018-06-06 12:53:42');
INSERT INTO `expenses` VALUES ('2736', null, '2018-01-12', '7', '100', null, 'GOBI 2DAY', '1', '2018-06-06 12:47:55', '2018-06-06 12:47:55');
INSERT INTO `expenses` VALUES ('2737', null, '2018-01-12', '4', '30', null, '', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('2738', null, '2018-01-12', '43', '370', null, '3-01 TO  11-10', '1', '2018-06-06 13:08:23', '2018-06-06 13:08:23');
INSERT INTO `expenses` VALUES ('2739', null, '2018-01-13', '2', '10', null, 'LEBU LANKA', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2740', null, '2018-01-13', '2119', '1000', null, 'PHOTO WORLD \r\nALBUM DESIGN DVD', '1', '2018-06-06 13:47:29', '2018-06-06 13:47:29');
INSERT INTO `expenses` VALUES ('2741', null, '2018-01-13', '2855', '6000', null, 'PRIMARI SCHOOL SPORTS ', '1', '2018-06-06 14:10:58', '2018-06-06 14:10:58');
INSERT INTO `expenses` VALUES ('2742', null, '2018-01-13', '2', '140', null, 'BLACK TAP', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2743', null, '2018-01-13', '7', '80', null, '', '1', '2018-06-06 12:47:55', '2018-06-06 12:47:55');
INSERT INTO `expenses` VALUES ('2744', null, '2018-01-13', '4', '30', null, '', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('2745', null, '2018-01-13', '2', '38', null, 'DAN', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2746', null, '2018-01-15', '2', '15', null, '', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2747', null, '2018-01-15', '2', '100', null, 'MILK', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2748', null, '2018-01-16', '2', '5', null, 'DAN', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2749', null, '2018-01-16', '21', '200', null, '', '1', '2018-06-06 12:53:42', '2018-06-06 12:53:42');
INSERT INTO `expenses` VALUES ('2750', null, '2018-01-16', '4', '60', null, '2day', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('2751', null, '2018-01-17', '7', '100', null, '', '1', '2018-06-06 12:47:55', '2018-06-06 12:47:55');
INSERT INTO `expenses` VALUES ('2752', null, '2018-01-17', '51', '160', null, '', '1', '2018-06-06 13:10:49', '2018-06-06 13:10:49');
INSERT INTO `expenses` VALUES ('2753', null, '2018-01-18', '7', '160', null, '', '1', '2018-06-06 12:47:55', '2018-06-06 12:47:55');
INSERT INTO `expenses` VALUES ('2754', null, '2018-01-19', '43', '355', null, '', '1', '2018-06-06 13:08:23', '2018-06-06 13:08:23');
INSERT INTO `expenses` VALUES ('2755', null, '2018-01-19', '4', '90', null, '3 Day', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('2756', null, '2018-01-20', '43', '50', null, 'CD 4 PIS', '1', '2018-06-06 13:08:23', '2018-06-06 13:08:23');
INSERT INTO `expenses` VALUES ('2757', null, '2018-01-20', '21', '200', null, '', '1', '2018-06-06 12:53:42', '2018-06-06 12:53:42');
INSERT INTO `expenses` VALUES ('2758', null, '2018-01-20', '2', '35', null, 'DAN', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2759', null, '2018-01-20', '4', '30', null, '', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('2760', null, '2018-01-20', '2', '10', null, 'LABU LANKA', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2761', null, '2018-01-22', '48', '130', null, 'BIJOY SUMAN', '1', '2018-06-07 11:51:41', '2018-06-07 11:51:41');
INSERT INTO `expenses` VALUES ('2762', null, '2018-01-22', '2', '10', null, 'TOTO (SUMAN)', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2763', null, '2018-01-22', '7', '270', null, 'GOBI BIJOY SUMAN', '1', '2018-06-06 12:47:55', '2018-06-06 12:47:55');
INSERT INTO `expenses` VALUES ('2764', null, '2018-01-22', '88', '1121', null, 'MONTH OF JANUARY', '1', '2018-06-06 13:20:01', '2018-06-06 13:20:01');
INSERT INTO `expenses` VALUES ('2765', null, '2018-01-24', '21', '200', null, 'UCO BANK', '1', '2018-06-06 12:53:42', '2018-06-06 12:53:42');
INSERT INTO `expenses` VALUES ('2766', null, '2018-01-27', '21', '200', null, '', '1', '2018-06-06 12:53:42', '2018-06-06 12:53:42');
INSERT INTO `expenses` VALUES ('2767', null, '2018-01-27', '4', '180', null, '6DAY', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('2768', null, '2018-01-27', '2', '250', null, 'SUBHANKAR WED( TOTO ) BGS', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2769', null, '2018-01-27', '2', '10', null, 'LABU', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2770', null, '2018-01-27', '2', '40', null, 'DAN', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2771', null, '2018-01-29', '2', '110', null, 'MILK', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2772', null, '2018-01-29', '43', '414', null, '', '1', '2018-06-06 13:08:23', '2018-06-06 13:08:23');
INSERT INTO `expenses` VALUES ('2773', null, '2018-01-30', '7', '70', null, '', '1', '2018-06-06 12:47:55', '2018-06-06 12:47:55');
INSERT INTO `expenses` VALUES ('2774', null, '2018-01-30', '2', '50', null, 'FINAL', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2775', null, '2018-01-30', '21', '200', null, '', '1', '2018-06-06 12:53:42', '2018-06-06 12:53:42');
INSERT INTO `expenses` VALUES ('2776', null, '2018-01-30', '8', '50', null, 'REPAIR', '1', '2018-06-06 12:48:34', '2018-06-06 12:48:34');
INSERT INTO `expenses` VALUES ('2777', null, '2018-01-31', '4', '10', null, 'DAN', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('2778', null, '2018-02-01', '2', '40', null, 'FOOD', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2779', null, '2018-02-02', '51', '290', null, '', '1', '2018-06-06 13:10:49', '2018-06-06 13:10:49');
INSERT INTO `expenses` VALUES ('2780', null, '2018-02-02', '21', '200', null, 'DEPO', '1', '2018-06-06 12:53:42', '2018-06-06 12:53:42');
INSERT INTO `expenses` VALUES ('2781', null, '2018-02-03', '2', '40', null, 'gum', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2782', null, '2018-02-03', '2', '20', null, 'DAN\r\n', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2783', null, '2018-02-03', '4', '180', null, '6DAY', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('2784', null, '2018-02-03', '2', '10', null, 'LABU', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2785', null, '2018-02-03', '2', '25', null, 'DAN', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2786', null, '2018-02-03', '7', '40', null, '', '1', '2018-06-06 12:47:55', '2018-06-06 12:47:55');
INSERT INTO `expenses` VALUES ('2787', null, '2018-02-06', '2', '4630', null, 'SHYAMAL / SAKHI BACK LIGHT 11X3 SQ FIT', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2788', null, '2018-02-06', '7', '150', null, '2day Diner ', '1', '2018-06-06 12:47:55', '2018-06-06 12:47:55');
INSERT INTO `expenses` VALUES ('2789', null, '2018-02-07', '21', '1600', null, '', '1', '2018-06-06 12:53:42', '2018-06-06 12:53:42');
INSERT INTO `expenses` VALUES ('2790', null, '2018-02-06', '21', '300', null, '', '1', '2018-06-06 12:53:42', '2018-06-06 12:53:42');
INSERT INTO `expenses` VALUES ('2791', null, '2018-02-07', '7', '60', null, 'GOBI', '1', '2018-06-06 12:47:55', '2018-06-06 12:47:55');
INSERT INTO `expenses` VALUES ('2792', null, '2018-02-07', '2', '60', null, '', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2793', null, '2018-02-08', '40', '40', null, 'SUMAN', '1', '2018-06-06 13:07:24', '2018-06-06 13:07:24');
INSERT INTO `expenses` VALUES ('2794', null, '2018-02-08', '40', '30', null, 'TINKU', '1', '2018-06-06 13:07:24', '2018-06-06 13:07:24');
INSERT INTO `expenses` VALUES ('2795', null, '2018-02-08', '40', '150', null, 'BIJAY', '1', '2018-06-06 13:07:24', '2018-06-06 13:07:24');
INSERT INTO `expenses` VALUES ('2796', null, '2018-02-08', '2463', '2485', null, 'FULL PAID', '1', '2018-06-07 11:08:42', '2018-06-07 11:08:42');
INSERT INTO `expenses` VALUES ('2797', null, '2018-02-08', '21', '300', null, '', '1', '2018-06-06 12:53:42', '2018-06-06 12:53:42');
INSERT INTO `expenses` VALUES ('2798', null, '2018-02-09', '105', '200', null, 'WATER ', '1', '2018-06-06 13:24:19', '2018-06-06 13:24:19');
INSERT INTO `expenses` VALUES ('2799', null, '2018-02-09', '21', '300', null, '', '1', '2018-06-06 12:53:42', '2018-06-06 12:53:42');
INSERT INTO `expenses` VALUES ('2800', null, '2018-02-10', '2', '10', null, 'LEBU ', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2801', null, '2018-02-10', '2', '200', null, 'MILK 10 DAY', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2802', null, '2018-02-10', '2', '30', null, 'DAN', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2803', null, '2018-02-10', '2', '10', null, 'LABU', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2804', null, '2018-02-10', '21', '300', null, '', '1', '2018-06-06 12:53:42', '2018-06-06 12:53:42');
INSERT INTO `expenses` VALUES ('2805', null, '2018-02-12', '21', '600', null, '', '1', '2018-06-06 12:53:42', '2018-06-06 12:53:42');
INSERT INTO `expenses` VALUES ('2806', null, '2018-02-12', '2', '155', null, 'TAP / THUMP / SCAL', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2807', null, '2018-02-12', '43', '300', null, '', '1', '2018-06-06 13:08:23', '2018-06-06 13:08:23');
INSERT INTO `expenses` VALUES ('2808', null, '2018-02-13', '21', '300', null, '', '1', '2018-06-06 12:53:42', '2018-06-06 12:53:42');
INSERT INTO `expenses` VALUES ('2809', null, '2018-02-13', '43', '370', null, '', '1', '2018-06-06 13:08:23', '2018-06-06 13:08:23');
INSERT INTO `expenses` VALUES ('2810', null, '2018-02-14', '2', '10', null, 'GARI ', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2811', null, '2018-02-14', '21', '300', null, '', '1', '2018-06-06 12:53:42', '2018-06-06 12:53:42');
INSERT INTO `expenses` VALUES ('2812', null, '2018-02-15', '40', '60', null, 'FREM  SLG', '1', '2018-06-06 13:07:24', '2018-06-06 13:07:24');
INSERT INTO `expenses` VALUES ('2813', null, '2018-02-15', '2813', '1495', null, '', '1', null, null);
INSERT INTO `expenses` VALUES ('2814', null, '2018-02-15', '2', '3500', null, 'UTTARAYAN,SUSOBHON,ANTARA,MANIJ JAIN, PROSANJIT   TOTAL -8 DAYS EXT-300', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2815', null, '2018-02-15', '21', '300', null, '', '1', '2018-06-06 12:53:42', '2018-06-06 12:53:42');
INSERT INTO `expenses` VALUES ('2816', null, '2018-02-15', '51', '160', null, '100pic ANNAPRATION', '1', '2018-06-06 13:10:49', '2018-06-06 13:10:49');
INSERT INTO `expenses` VALUES ('2817', null, '2018-02-16', '48', '90', null, '', '1', '2018-06-07 11:51:41', '2018-06-07 11:51:41');
INSERT INTO `expenses` VALUES ('2818', null, '2018-02-16', '2', '170', null, 'MANOJ JAIN FOOD`', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2819', null, '2018-02-16', '21', '300', null, '', '1', '2018-06-06 12:53:42', '2018-06-06 12:53:42');
INSERT INTO `expenses` VALUES ('2820', null, '2018-02-17', '2', '120', null, '', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2821', null, '2018-02-17', '2', '10', null, 'DAN BIYER JANE\r\n', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2822', null, '2018-02-17', '21', '300', null, '', '1', '2018-06-06 12:53:42', '2018-06-06 12:53:42');
INSERT INTO `expenses` VALUES ('2823', null, '2018-02-17', '2', '22', null, 'DAN OR LABU', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2824', null, '2018-02-16', '2', '690', null, 'PENDRIVE', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2825', null, '2018-02-17', '43', '314', null, '', '1', '2018-06-06 13:08:23', '2018-06-06 13:08:23');
INSERT INTO `expenses` VALUES ('2826', null, '2018-02-19', '21', '600', null, 'UCO BANK KAKA', '1', '2018-06-06 12:53:42', '2018-06-06 12:53:42');
INSERT INTO `expenses` VALUES ('2827', null, '2018-02-19', '7', '100', null, 'gobindo', '1', '2018-06-06 12:47:55', '2018-06-06 12:47:55');
INSERT INTO `expenses` VALUES ('2828', null, '2018-02-19', '40', '300', null, 'gobindo', '1', '2018-06-06 13:07:24', '2018-06-06 13:07:24');
INSERT INTO `expenses` VALUES ('2829', null, '2018-02-20', '21', '300', null, '\r\n', '1', '2018-06-06 12:53:42', '2018-06-06 12:53:42');
INSERT INTO `expenses` VALUES ('2830', null, '2018-02-21', '2', '180', null, 'KULI TOTO HOTEL', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2831', null, '2018-02-21', '2831', '20', null, '', '1', null, null);
INSERT INTO `expenses` VALUES ('2832', null, '2018-02-21', '4', '450', null, '15DAY', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('2833', null, '2018-02-21', '88', '1121', null, 'MONTH OF FRBRUARY', '1', '2018-06-06 13:20:01', '2018-06-06 13:20:01');
INSERT INTO `expenses` VALUES ('2834', null, '2018-02-21', '48', '100', null, '', '1', '2018-06-07 11:51:41', '2018-06-07 11:51:41');
INSERT INTO `expenses` VALUES ('2835', null, '2018-02-21', '7', '80', null, 'GOBI TINKU', '1', '2018-06-06 12:47:55', '2018-06-06 12:47:55');
INSERT INTO `expenses` VALUES ('2836', null, '2018-02-22', '21', '300', null, '', '1', '2018-06-06 12:53:42', '2018-06-06 12:53:42');
INSERT INTO `expenses` VALUES ('2837', null, '2018-02-23', '2', '200', null, 'ABHI (BIKE OIL 100/-)\r\nGOBI TINKU ABHI SANJU PINTU (100)', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2838', null, '2018-02-23', '40', '100', null, 'GOBI ( ABHINAV WORK)', '1', '2018-06-06 13:07:24', '2018-06-06 13:07:24');
INSERT INTO `expenses` VALUES ('2839', null, '2018-02-23', '7', '120', null, '', '1', '2018-06-06 12:47:55', '2018-06-06 12:47:55');
INSERT INTO `expenses` VALUES ('2840', null, '2018-02-24', '43', '308', null, '', '1', '2018-06-06 13:08:23', '2018-06-06 13:08:23');
INSERT INTO `expenses` VALUES ('2841', null, '2018-02-24', '2', '30', null, 'DAN  AND LABU', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2842', null, '2018-02-24', '21', '300', null, '', '1', '2018-06-06 12:53:42', '2018-06-06 12:53:42');
INSERT INTO `expenses` VALUES ('2843', null, '2018-02-26', '21', '600', null, '2DAY', '1', '2018-06-06 12:53:42', '2018-06-06 12:53:42');
INSERT INTO `expenses` VALUES ('2844', null, '2018-02-26', '4', '120', null, '4day', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('2845', null, '2018-02-26', '40', '80', null, 'GOBI', '1', '2018-06-06 13:07:24', '2018-06-06 13:07:24');
INSERT INTO `expenses` VALUES ('2846', null, '2018-02-26', '2', '90', null, 'MILK', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2847', null, '2018-02-26', '7', '70', null, 'TINKU', '1', '2018-06-06 12:47:55', '2018-06-06 12:47:55');
INSERT INTO `expenses` VALUES ('2848', null, '2018-02-26', '40', '70', null, '', '1', '2018-06-06 13:07:24', '2018-06-06 13:07:24');
INSERT INTO `expenses` VALUES ('2849', null, '2018-02-27', '21', '300', null, '', '1', '2018-06-06 12:53:42', '2018-06-06 12:53:42');
INSERT INTO `expenses` VALUES ('2850', null, '2018-02-27', '40', '30', null, 'BIJOY', '1', '2018-06-06 13:07:24', '2018-06-06 13:07:24');
INSERT INTO `expenses` VALUES ('2851', null, '2018-02-27', '40', '20', null, 'SUMAN', '1', '2018-06-06 13:07:24', '2018-06-06 13:07:24');
INSERT INTO `expenses` VALUES ('2852', null, '2018-02-28', '58', '500', null, 'PRINTER', '1', '2018-06-06 13:15:02', '2018-06-06 13:15:02');
INSERT INTO `expenses` VALUES ('2853', null, '2018-02-28', '7', '270', null, 'GOBI TINKU SUMAN', '1', '2018-06-06 12:47:55', '2018-06-06 12:47:55');
INSERT INTO `expenses` VALUES ('2854', null, '2018-02-28', '4', '150', null, '5 DAY\r\n', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('2855', null, '2018-03-04', '2855', '500', null, 'UREKA CLUB CRICKET', '1', null, null);
INSERT INTO `expenses` VALUES ('2856', null, '2018-03-04', '2', '80', null, 'PANJIKA', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2857', null, '2018-03-04', '2', '10', null, 'LEBU LANKA', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2858', null, '2018-03-05', '2', '200', null, 'MILK', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2859', null, '2018-03-05', '8', '60', null, 'SOKET\r\n', '1', '2018-06-06 12:48:34', '2018-06-06 12:48:34');
INSERT INTO `expenses` VALUES ('2860', null, '2018-03-05', '21', '1800', null, '6 day', '1', '2018-06-06 12:53:42', '2018-06-06 12:53:42');
INSERT INTO `expenses` VALUES ('2861', null, '2018-03-05', '8', '200', null, 'SOCKET+SAMAR', '1', '2018-06-06 12:48:34', '2018-06-06 12:48:34');
INSERT INTO `expenses` VALUES ('2862', null, '2018-03-06', '21', '300', null, '', '1', '2018-06-06 12:53:42', '2018-06-06 12:53:42');
INSERT INTO `expenses` VALUES ('2863', null, '2018-03-08', '7', '160', null, 'GOBI 2 DAY', '1', '2018-06-06 12:47:55', '2018-06-06 12:47:55');
INSERT INTO `expenses` VALUES ('2864', null, '2018-03-08', '21', '600', null, '', '1', '2018-06-06 12:53:42', '2018-06-06 12:53:42');
INSERT INTO `expenses` VALUES ('2865', null, '2018-03-08', '2855', '500', null, 'for BOSONTO UTSOB ANANDADHARA 2018', '1', '2018-06-06 14:10:58', '2018-06-06 14:10:58');
INSERT INTO `expenses` VALUES ('2866', null, '2018-03-09', '8', '4160', null, '', '1', '2018-06-06 12:48:34', '2018-06-06 12:48:34');
INSERT INTO `expenses` VALUES ('2867', null, '2018-03-09', '21', '300', null, 'UCO BANK', '1', '2018-06-06 12:53:42', '2018-06-06 12:53:42');
INSERT INTO `expenses` VALUES ('2868', null, '2018-03-10', '21', '300', null, '', '1', '2018-06-06 12:53:42', '2018-06-06 12:53:42');
INSERT INTO `expenses` VALUES ('2869', null, '2018-03-10', '2', '10', null, 'LEBU', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2870', null, '2018-03-10', '51', '200', null, '125 PIS', '1', '2018-06-06 13:10:49', '2018-06-06 13:10:49');
INSERT INTO `expenses` VALUES ('2871', null, '2018-03-10', '4', '270', null, '9 DAYS\r\n', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('2872', null, '2018-03-10', '43', '520', null, '25 TO 10', '1', '2018-06-06 13:08:23', '2018-06-06 13:08:23');
INSERT INTO `expenses` VALUES ('2873', null, '2018-03-10', '67', '100', null, 'TINKU', '1', '2018-06-06 13:17:03', '2018-06-06 13:17:03');
INSERT INTO `expenses` VALUES ('2874', null, '2018-03-12', '21', '600', null, '', '1', '2018-06-06 12:53:42', '2018-06-06 12:53:42');
INSERT INTO `expenses` VALUES ('2875', null, '2018-03-12', '2', '50', null, 'DHUP KATHI\r\n', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2876', null, '2018-03-12', '40', '310', null, 'SUMAN BIJOY TOTO FAIR ', '1', '2018-06-06 13:07:24', '2018-06-06 13:07:24');
INSERT INTO `expenses` VALUES ('2877', null, '2018-03-13', '21', '300', null, '', '1', '2018-06-06 12:53:42', '2018-06-06 12:53:42');
INSERT INTO `expenses` VALUES ('2878', null, '2018-03-13', '4', '60', null, '2 DAY', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('2879', null, '2018-03-13', '7', '50', null, 'GOBI', '1', '2018-06-06 12:47:55', '2018-06-06 12:47:55');
INSERT INTO `expenses` VALUES ('2880', null, '2018-03-14', '4', '30', null, '', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('2881', null, '2018-03-14', '21', '300', null, '', '1', '2018-06-06 12:53:42', '2018-06-06 12:53:42');
INSERT INTO `expenses` VALUES ('2882', null, '2018-03-15', '51', '160', null, '100 PIS', '1', '2018-06-06 13:10:49', '2018-06-06 13:10:49');
INSERT INTO `expenses` VALUES ('2883', null, '2018-03-15', '2', '200', null, 'MILK 10DAY ', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2884', null, '2018-03-15', '21', '300', null, '', '1', '2018-06-06 12:53:42', '2018-06-06 12:53:42');
INSERT INTO `expenses` VALUES ('2885', null, '2018-03-15', '4', '30', null, '', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('2886', null, '2018-03-16', '21', '300', null, '\r\n', '1', '2018-06-06 12:53:42', '2018-06-06 12:53:42');
INSERT INTO `expenses` VALUES ('2887', null, '2018-03-16', '58', '400', null, 'computer formatting  DADA', '1', '2018-06-06 13:15:02', '2018-06-06 13:15:02');
INSERT INTO `expenses` VALUES ('2888', null, '2018-03-16', '2', '3200', null, 'SHYAMAL DA ( RAHUL AMIN)', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2889', null, '2018-03-17', '2', '10', null, 'LABU LANKA', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2890', null, '2018-03-17', '21', '300', null, '', '1', '2018-06-06 12:53:42', '2018-06-06 12:53:42');
INSERT INTO `expenses` VALUES ('2891', null, '2018-03-17', '2', '20', null, 'LABU LANKA', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2892', null, '2018-03-17', '43', '430', null, '', '1', '2018-06-06 13:08:23', '2018-06-06 13:08:23');
INSERT INTO `expenses` VALUES ('2893', null, '2018-03-17', '4', '60', null, '2DAY', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('2894', null, '2018-03-19', '21', '600', null, '', '1', '2018-06-06 12:53:42', '2018-06-06 12:53:42');
INSERT INTO `expenses` VALUES ('2895', null, '2018-03-19', '4', '30', null, '', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('2896', null, '2018-03-19', '104', '5500', null, 'MONTH OF FEB18', '1', '2018-06-06 13:23:52', '2018-06-06 13:23:52');
INSERT INTO `expenses` VALUES ('2897', null, '2018-03-20', '51', '160', null, '', '1', '2018-06-06 13:10:49', '2018-06-06 13:10:49');
INSERT INTO `expenses` VALUES ('2898', null, '2018-03-20', '2813', '126', null, 'MONTH OF FEBRUARY 2018', '1', '2018-06-06 14:00:37', '2018-06-06 14:00:37');
INSERT INTO `expenses` VALUES ('2899', null, '2018-03-20', '4', '30', null, '', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('2900', null, '2018-03-20', '21', '300', null, '', '1', '2018-06-06 12:53:42', '2018-06-06 12:53:42');
INSERT INTO `expenses` VALUES ('2901', null, '2018-03-21', '2', '10', null, 'Dann For Paa vanga', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2902', null, '2018-03-21', '21', '300', null, '\r\n\r\n', '1', '2018-06-06 12:53:42', '2018-06-06 12:53:42');
INSERT INTO `expenses` VALUES ('2903', null, '2018-03-21', '7', '50', null, 'gobi', '1', '2018-06-06 12:47:55', '2018-06-06 12:47:55');
INSERT INTO `expenses` VALUES ('2904', null, '2018-03-21', '4', '30', null, '', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('2905', null, '2018-03-22', '2', '80', null, 'CELLO TAPE + BLEAD + RABAR ', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2906', null, '2018-03-22', '21', '300', null, '', '1', '2018-06-06 12:53:42', '2018-06-06 12:53:42');
INSERT INTO `expenses` VALUES ('2907', null, '2018-03-22', '4', '30', null, '', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('2908', null, '2018-03-22', '48', '40', null, '', '1', '2018-06-07 11:51:41', '2018-06-07 11:51:41');
INSERT INTO `expenses` VALUES ('2909', null, '2018-03-23', '88', '1120', null, 'MARCH', '1', '2018-06-06 13:20:01', '2018-06-06 13:20:01');
INSERT INTO `expenses` VALUES ('2910', null, '2018-03-23', '21', '300', null, '', '1', '2018-06-06 12:53:42', '2018-06-06 12:53:42');
INSERT INTO `expenses` VALUES ('2911', null, '2018-03-24', '58', '600', null, 'RANJIT+ RAJA', '1', '2018-06-06 13:15:02', '2018-06-06 13:15:02');
INSERT INTO `expenses` VALUES ('2912', null, '2018-03-24', '21', '300', null, '\r\n', '1', '2018-06-06 12:53:42', '2018-06-06 12:53:42');
INSERT INTO `expenses` VALUES ('2913', null, '2018-03-24', '4', '30', null, '', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('2914', null, '2018-03-24', '2', '23', null, 'dan\r\n', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2915', null, '2018-03-24', '2', '10', null, 'LEBU', '1', '2018-07-18 12:09:51', '2018-07-18 12:09:51');
INSERT INTO `expenses` VALUES ('2916', null, '2018-03-24', '43', '226', null, '', '1', '2018-06-06 13:08:23', '2018-06-06 13:08:23');
INSERT INTO `expenses` VALUES ('2917', null, '2018-03-26', '21', '600', null, '2 day ', '1', '2018-06-06 12:53:42', '2018-06-06 12:53:42');
INSERT INTO `expenses` VALUES ('2918', null, '2018-03-26', '51', '264', null, 'KHAM 120 PIC', '1', '2018-06-06 13:10:49', '2018-06-06 13:10:49');
INSERT INTO `expenses` VALUES ('2919', null, '2018-03-26', '7', '200', null, 'GOBI (RAMNABAMI PUJA )', '1', '2018-06-06 12:47:55', '2018-06-06 12:47:55');
INSERT INTO `expenses` VALUES ('2920', null, '2018-03-27', '21', '300', null, '', '1', '2018-06-06 12:53:42', '2018-06-06 12:53:42');
INSERT INTO `expenses` VALUES ('2921', null, '2018-03-27', '2507', '2411', null, 'RAMNABAMI ', '1', '2018-06-06 16:10:10', '2018-06-06 16:10:10');
INSERT INTO `expenses` VALUES ('2922', null, '2018-03-27', '4', '60', null, '2 DAY\r\n', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('2923', null, '2018-03-28', '2', '200', null, '10 DAYS', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2924', null, '2018-03-28', '21', '300', null, 'UCO BANK', '1', '2018-06-06 12:53:42', '2018-06-06 12:53:42');
INSERT INTO `expenses` VALUES ('2925', null, '2018-03-28', '2', '70', null, '', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2926', null, '2018-03-29', '21', '300', null, '', '1', '2018-06-06 12:53:42', '2018-06-06 12:53:42');
INSERT INTO `expenses` VALUES ('2927', null, '2018-03-30', '21', '300', null, '', '1', '2018-06-06 12:53:42', '2018-06-06 12:53:42');
INSERT INTO `expenses` VALUES ('2928', null, '2018-03-30', '2', '99', null, 'PAPOUS 2 PIS', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2929', null, '2018-03-29', '7', '30', null, '', '1', '2018-06-06 12:47:55', '2018-06-06 12:47:55');
INSERT INTO `expenses` VALUES ('2930', null, '2018-03-30', '4', '90', null, '3DAY', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('2931', null, '2018-03-31', '2', '10', null, 'LEBU', '1', '2018-07-18 12:09:51', '2018-07-18 12:09:51');
INSERT INTO `expenses` VALUES ('2932', null, '2018-03-31', '105', '180', null, 'MONTH OF FEBRUARY', '1', '2018-06-06 13:24:19', '2018-06-06 13:24:19');
INSERT INTO `expenses` VALUES ('2933', null, '2018-03-31', '21', '300', null, '', '1', '2018-06-06 12:53:42', '2018-06-06 12:53:42');
INSERT INTO `expenses` VALUES ('2934', null, '2018-03-31', '2', '30', null, '', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2935', null, '2018-03-31', '4', '30', null, '', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('2936', null, '2018-03-31', '43', '227', null, '', '1', '2018-06-06 13:08:23', '2018-06-06 13:08:23');
INSERT INTO `expenses` VALUES ('2937', null, '2018-03-31', '2', '2200', null, 'BILTU FOR CAMERA AND PROJECTOR MANOJ JAIN DHUPGURI', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2938', null, '2018-04-02', '105', '160', null, 'MONTH OF MARCH 18', '1', '2018-06-06 13:24:19', '2018-06-06 13:24:19');
INSERT INTO `expenses` VALUES ('2939', null, '2018-03-31', '2', '25800', null, 'INCOME TAX PAY  2017-18\r\n', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2940', null, '2018-04-02', '51', '480', null, '300 PIS', '1', '2018-06-06 13:10:49', '2018-06-06 13:10:49');
INSERT INTO `expenses` VALUES ('2941', null, '2018-04-02', '21', '600', null, '', '1', '2018-06-06 12:53:42', '2018-06-06 12:53:42');
INSERT INTO `expenses` VALUES ('2942', null, '2018-04-02', '4', '30', null, '', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('2943', null, '2018-04-02', '7', '40', null, '', '1', '2018-06-06 12:47:55', '2018-06-06 12:47:55');
INSERT INTO `expenses` VALUES ('2944', null, '2018-04-03', '21', '300', null, '\r\n\r\n\r\n', '1', '2018-06-06 12:53:42', '2018-06-06 12:53:42');
INSERT INTO `expenses` VALUES ('2945', null, '2018-04-03', '4', '30', null, '', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('2946', null, '2018-04-04', '21', '300', null, '', '1', '2018-06-06 12:53:42', '2018-06-06 12:53:42');
INSERT INTO `expenses` VALUES ('2947', null, '2018-04-04', '7', '20', null, 'TINKU SUMAN', '1', '2018-06-06 12:47:55', '2018-06-06 12:47:55');
INSERT INTO `expenses` VALUES ('2948', null, '2018-04-04', '4', '30', null, '', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('2949', null, '2018-04-04', '2', '30', null, 'KULI', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2950', null, '2018-04-05', '21', '300', null, '', '1', '2018-06-06 12:53:42', '2018-06-06 12:53:42');
INSERT INTO `expenses` VALUES ('2951', null, '2018-04-05', '2', '10', null, 'DAN', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2952', null, '2018-04-05', '48', '40', null, 'GOBI', '1', '2018-06-07 11:51:41', '2018-06-07 11:51:41');
INSERT INTO `expenses` VALUES ('2953', null, '2018-04-06', '21', '300', null, '', '1', '2018-06-06 12:53:42', '2018-06-06 12:53:42');
INSERT INTO `expenses` VALUES ('2954', null, '2018-04-06', '4', '60', null, '2DAY', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('2955', null, '2018-04-06', '7', '70', null, 'GOBI', '1', '2018-06-06 12:47:55', '2018-06-06 12:47:55');
INSERT INTO `expenses` VALUES ('2956', null, '2018-04-07', '104', '5500', null, 'MONTH OF MARCH 18', '1', '2018-06-06 13:23:52', '2018-06-06 13:23:52');
INSERT INTO `expenses` VALUES ('2957', null, '2018-04-07', '43', '348', null, '', '1', '2018-06-06 13:08:23', '2018-06-06 13:08:23');
INSERT INTO `expenses` VALUES ('2958', null, '2018-04-07', '2', '40', null, 'dan', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2959', null, '2018-04-07', '2', '10', null, 'labu', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2960', null, '2018-04-07', '21', '300', null, '', '1', '2018-06-06 12:53:42', '2018-06-06 12:53:42');
INSERT INTO `expenses` VALUES ('2961', null, '2018-04-07', '7', '265', null, 'DADA GOBI TINKU SUMAN', '1', '2018-06-06 12:47:55', '2018-06-06 12:47:55');
INSERT INTO `expenses` VALUES ('2962', null, '2018-04-09', '2', '200', null, 'MILK', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2964', null, '2018-04-09', '21', '600', null, 'DATE OF 08, 09/04/2018', '1', '2018-06-06 12:53:42', '2018-06-06 12:53:42');
INSERT INTO `expenses` VALUES ('2965', null, '2018-04-10', '2855', '2500', null, 'TELI PARA CLUB', '1', '2018-06-06 14:10:58', '2018-06-06 14:10:58');
INSERT INTO `expenses` VALUES ('2966', null, '2018-04-10', '21', '300', null, '', '1', '2018-06-06 12:53:42', '2018-06-06 12:53:42');
INSERT INTO `expenses` VALUES ('2967', null, '2018-04-10', '7', '40', null, 'GOBI', '1', '2018-06-06 12:47:55', '2018-06-06 12:47:55');
INSERT INTO `expenses` VALUES ('2968', null, '2018-04-10', '2', '10', null, 'DAN', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2969', null, '2018-04-10', '4', '90', null, '3DAY', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('2970', null, '2018-04-11', '2', '120', null, 'TEA CUP(KALKATA)  TINKU ', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2971', null, '2018-04-11', '21', '300', null, '', '1', '2018-06-06 12:53:42', '2018-06-06 12:53:42');
INSERT INTO `expenses` VALUES ('2972', null, '2018-04-11', '7', '50', null, 'GOBI', '1', '2018-06-06 12:47:55', '2018-06-06 12:47:55');
INSERT INTO `expenses` VALUES ('2973', null, '2018-04-12', '7', '120', null, 'GOBI', '1', '2018-06-06 12:47:55', '2018-06-06 12:47:55');
INSERT INTO `expenses` VALUES ('2974', null, '2018-04-12', '4', '60', null, '2DAY', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('2975', null, '2018-04-13', '21', '600', null, '2dey', '1', '2018-06-06 12:53:42', '2018-06-06 12:53:42');
INSERT INTO `expenses` VALUES ('2976', null, '2018-04-13', '7', '80', null, '', '1', '2018-06-06 12:47:55', '2018-06-06 12:47:55');
INSERT INTO `expenses` VALUES ('2977', null, '2018-04-13', '2', '20', null, 'DAN (CHAROK PUJA)', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2978', null, '2018-04-14', '21', '300', null, 'UCO BANK KAKA', '1', '2018-06-06 12:53:42', '2018-06-06 12:53:42');
INSERT INTO `expenses` VALUES ('2979', null, '2018-04-14', '7', '130', null, 'GOBI', '1', '2018-06-06 12:47:55', '2018-06-06 12:47:55');
INSERT INTO `expenses` VALUES ('2980', null, '2018-04-14', '4', '60', null, '2DAY', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('2981', null, '2018-04-14', '2', '10', null, 'LEBU', '1', '2018-07-18 12:09:51', '2018-07-18 12:09:51');
INSERT INTO `expenses` VALUES ('2982', null, '2018-04-14', '43', '345', null, '', '1', '2018-06-06 13:08:23', '2018-06-06 13:08:23');
INSERT INTO `expenses` VALUES ('2983', null, '2018-04-14', '2', '15', null, 'DAN', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2984', null, '2018-04-16', '40', '300', null, 'SUNAB CHOTTU (MANOJ JAIN)', '1', '2018-06-06 13:07:24', '2018-06-06 13:07:24');
INSERT INTO `expenses` VALUES ('2985', null, '2018-04-16', '40', '100', null, 'GOBI (ABHINAV)', '1', '2018-06-06 13:07:24', '2018-06-06 13:07:24');
INSERT INTO `expenses` VALUES ('2986', null, '2018-04-16', '21', '600', null, '', '1', '2018-06-06 12:53:42', '2018-06-06 12:53:42');
INSERT INTO `expenses` VALUES ('2987', null, '2018-04-16', '8', '20', null, '', '1', '2018-06-06 12:48:34', '2018-06-06 12:48:34');
INSERT INTO `expenses` VALUES ('2988', null, '2018-04-17', '21', '300', null, '', '1', '2018-06-06 12:53:42', '2018-06-06 12:53:42');
INSERT INTO `expenses` VALUES ('2989', null, '2018-04-17', '7', '70', null, '', '1', '2018-06-06 12:47:55', '2018-06-06 12:47:55');
INSERT INTO `expenses` VALUES ('2990', null, '2018-04-19', '51', '160', null, '100 PIC', '1', '2018-06-06 13:10:49', '2018-06-06 13:10:49');
INSERT INTO `expenses` VALUES ('2991', null, '2018-04-20', '21', '900', null, '18-19-20    3day ', '1', '2018-06-06 12:53:42', '2018-06-06 12:53:42');
INSERT INTO `expenses` VALUES ('2992', null, '2018-04-21', '7', '120', null, '2 day', '1', '2018-06-06 12:47:55', '2018-06-06 12:47:55');
INSERT INTO `expenses` VALUES ('2993', null, '2018-04-21', '88', '1121', null, '', '1', '2018-06-06 13:20:01', '2018-06-06 13:20:01');
INSERT INTO `expenses` VALUES ('2994', null, '2018-04-21', '2', '30', null, 'DAN', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2995', null, '2018-04-21', '2', '10', null, 'LABU', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('2996', null, '2018-04-23', '40', '470', null, 'SUMAN BIJOY (DHUBRI ASSAM)', '1', '2018-06-06 13:07:24', '2018-06-06 13:07:24');
INSERT INTO `expenses` VALUES ('2997', null, '2018-04-23', '7', '595', null, 'SUMAN BIJOY (DHUBRI ASSAM)', '1', '2018-06-06 12:47:55', '2018-06-06 12:47:55');
INSERT INTO `expenses` VALUES ('2998', null, '2018-04-23', '67', '3010', null, 'SLG DHUBRI ASSAM', '1', '2018-06-06 13:17:03', '2018-06-06 13:17:03');
INSERT INTO `expenses` VALUES ('2999', null, '2018-04-23', '7', '2530', null, 'MANOJ JAIN SUMIT SARAF WEDDING', '1', '2018-06-06 12:47:55', '2018-06-06 12:47:55');
INSERT INTO `expenses` VALUES ('3000', null, '2018-04-23', '40', '130', null, 'TINKU SOMNATH (MANOJ JAIN)', '1', '2018-06-06 13:07:24', '2018-06-06 13:07:24');
INSERT INTO `expenses` VALUES ('3001', null, '2018-04-23', '21', '900', null, '3 DAY', '1', '2018-06-06 12:53:42', '2018-06-06 12:53:42');
INSERT INTO `expenses` VALUES ('3002', null, '2018-04-23', '51', '160', null, '', '1', '2018-06-06 13:10:49', '2018-06-06 13:10:49');
INSERT INTO `expenses` VALUES ('3003', null, '2018-04-23', '8', '3690', null, 'ceiling fan, bulb', '1', '2018-06-06 12:48:34', '2018-06-06 12:48:34');
INSERT INTO `expenses` VALUES ('3004', null, '2018-04-23', '4', '210', null, '7DAY', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('3005', null, '2018-04-24', '21', '300', null, '', '1', '2018-06-06 12:53:42', '2018-06-06 12:53:42');
INSERT INTO `expenses` VALUES ('3006', null, '2018-04-25', '2', '200', null, 'MILK', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('3007', null, '2018-04-25', '21', '300', null, 'UCO BANK', '1', '2018-06-06 12:53:42', '2018-06-06 12:53:42');
INSERT INTO `expenses` VALUES ('3008', null, '2018-04-26', '21', '300', null, '', '1', '2018-06-06 12:53:42', '2018-06-06 12:53:42');
INSERT INTO `expenses` VALUES ('3009', null, '2018-04-26', '2', '10', null, 'suman and gobi', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('3010', null, '2018-04-27', '40', '30', null, 'GOBI CHOTU', '1', '2018-06-06 13:07:24', '2018-06-06 13:07:24');
INSERT INTO `expenses` VALUES ('3011', null, '2018-04-27', '40', '20', null, 'toto gobindo', '1', '2018-06-06 13:07:24', '2018-06-06 13:07:24');
INSERT INTO `expenses` VALUES ('3012', null, '2018-04-27', '21', '300', null, '', '1', '2018-06-06 12:53:42', '2018-06-06 12:53:42');
INSERT INTO `expenses` VALUES ('3013', null, '2018-04-28', '2', '10', null, 'LEBU', '1', '2018-07-18 12:09:51', '2018-07-18 12:09:51');
INSERT INTO `expenses` VALUES ('3014', null, '2018-04-28', '40', '50', null, 'TOTO ', '1', '2018-06-06 13:07:24', '2018-06-06 13:07:24');
INSERT INTO `expenses` VALUES ('3015', null, '2018-04-28', '67', '100', null, '', '1', '2018-06-06 13:17:03', '2018-06-06 13:17:03');
INSERT INTO `expenses` VALUES ('3016', null, '2018-04-28', '7', '70', null, 'GOBI', '1', '2018-06-06 12:47:55', '2018-06-06 12:47:55');
INSERT INTO `expenses` VALUES ('3017', null, '2018-04-28', '21', '300', null, '', '1', '2018-06-06 12:53:42', '2018-06-06 12:53:42');
INSERT INTO `expenses` VALUES ('3018', null, '2018-04-28', '40', '30', null, 'SLG ELLORA ', '1', '2018-06-06 13:07:24', '2018-06-06 13:07:24');
INSERT INTO `expenses` VALUES ('3019', null, '2018-04-28', '43', '217', null, '', '1', '2018-06-06 13:08:23', '2018-06-06 13:08:23');
INSERT INTO `expenses` VALUES ('3020', null, '2018-04-28', '4', '150', null, '5Day', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('3021', null, '2018-04-28', '2', '25', null, 'dan', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('3022', null, '2018-04-30', '21', '600', null, '', '1', '2018-06-06 12:53:42', '2018-06-06 12:53:42');
INSERT INTO `expenses` VALUES ('3023', null, '2018-05-02', '105', '120', null, 'MONTH OF APRIL 18', '1', '2018-06-06 13:24:19', '2018-06-06 13:24:19');
INSERT INTO `expenses` VALUES ('3024', null, '2018-05-02', '21', '600', null, 'UCO BANK', '1', '2018-06-06 12:53:42', '2018-06-06 12:53:42');
INSERT INTO `expenses` VALUES ('3025', null, '2018-05-02', '2', '50', null, 'TAP PEN', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('3026', null, '2018-05-02', '2', '30', null, 'BUS FAIR', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('3027', null, '2018-05-03', '21', '300', null, 'UCO BANK', '1', '2018-06-06 12:53:42', '2018-06-06 12:53:42');
INSERT INTO `expenses` VALUES ('3028', null, '2018-05-03', '2', '50', null, 'TIFIN', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('3029', null, '2018-05-04', '21', '300', null, '', '1', '2018-06-06 12:53:42', '2018-06-06 12:53:42');
INSERT INTO `expenses` VALUES ('3030', null, '2018-05-04', '2463', '3720', null, '6*9= 230\r\n12*18=22\r\n8*12= 203\r\n12*15= 121', '1', '2018-06-07 11:08:42', '2018-06-07 11:08:42');
INSERT INTO `expenses` VALUES ('3031', null, '2018-05-04', '2', '10', null, 'DAN', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('3032', null, '2018-05-04', '7', '60', null, 'SGT', '1', '2018-06-06 12:47:55', '2018-06-06 12:47:55');
INSERT INTO `expenses` VALUES ('3033', null, '2018-05-04', '2', '50', null, 'TOTO', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('3034', null, '2018-05-04', '40', '40', null, 'TOTO GOBINDO', '1', '2018-06-06 13:07:24', '2018-06-06 13:07:24');
INSERT INTO `expenses` VALUES ('3035', null, '2018-05-04', '4', '180', null, '6 DAYS', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('3036', null, '2018-05-01', '104', '5500', null, 'MONTH OF APRIL 18', '1', '2018-06-06 13:23:52', '2018-06-06 13:23:52');
INSERT INTO `expenses` VALUES ('3037', null, '2018-05-05', '8', '120', null, 'SOKET', '1', '2018-06-06 12:48:34', '2018-06-06 12:48:34');
INSERT INTO `expenses` VALUES ('3038', null, '2018-05-05', '2', '10', null, 'LABU', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('3039', null, '2018-05-05', '2', '40', null, 'DAN', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('3040', null, '2018-05-05', '21', '300', null, '', '1', '2018-06-06 12:53:42', '2018-06-06 12:53:42');
INSERT INTO `expenses` VALUES ('3041', null, '2018-05-07', '21', '600', null, '2 day', '1', '2018-06-06 12:53:42', '2018-06-06 12:53:42');
INSERT INTO `expenses` VALUES ('3042', null, '2018-05-07', '51', '240', null, '200 PIC   6X8 KHAM', '1', '2018-06-06 13:10:49', '2018-06-06 13:10:49');
INSERT INTO `expenses` VALUES ('3043', null, '2018-05-08', '21', '300', null, 'UCO BANK', '1', '2018-06-06 12:53:42', '2018-06-06 12:53:42');
INSERT INTO `expenses` VALUES ('3044', null, '2018-05-08', '2', '200', null, 'MILK _TINKU ', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('3045', null, '2018-05-08', '7', '210', null, '', '1', '2018-06-06 12:47:55', '2018-06-06 12:47:55');
INSERT INTO `expenses` VALUES ('3046', null, '2018-05-09', '21', '300', null, '', '1', '2018-06-06 12:53:42', '2018-06-06 12:53:42');
INSERT INTO `expenses` VALUES ('3047', null, '2018-05-09', '8', '500', null, 'SAMAR DA WARM LIGHT REPAIR ', '1', '2018-06-06 12:48:34', '2018-06-06 12:48:34');
INSERT INTO `expenses` VALUES ('3048', null, '2018-05-09', '4', '120', null, '4 DAY', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('3049', null, '2018-05-10', '2', '50', null, 'TIE', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('3050', null, '2018-05-10', '21', '300', null, '', '1', '2018-06-06 12:53:42', '2018-06-06 12:53:42');
INSERT INTO `expenses` VALUES ('3051', null, '2018-05-11', '7', '300', null, 'GOBI', '1', '2018-06-06 12:47:55', '2018-06-06 12:47:55');
INSERT INTO `expenses` VALUES ('3052', null, '2018-05-11', '21', '300', null, '', '1', '2018-06-06 12:53:42', '2018-06-06 12:53:42');
INSERT INTO `expenses` VALUES ('3053', null, '2018-05-11', '58', '4100', null, 'mather  bode', '1', '2018-06-06 13:15:02', '2018-06-06 13:15:02');
INSERT INTO `expenses` VALUES ('3054', null, '2018-05-12', '21', '300', null, '', '1', '2018-06-06 12:53:42', '2018-06-06 12:53:42');
INSERT INTO `expenses` VALUES ('3055', null, '2018-05-12', '2', '10', null, 'LABU', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('3056', null, '2018-05-12', '51', '160', null, '100 KHOM', '1', '2018-06-06 13:10:49', '2018-06-06 13:10:49');
INSERT INTO `expenses` VALUES ('3057', null, '2018-05-12', '7', '160', null, 'TIFIN', '1', '2018-06-06 12:47:55', '2018-06-06 12:47:55');
INSERT INTO `expenses` VALUES ('3058', null, '2018-05-12', '21', '300', null, '', '1', '2018-06-06 12:53:42', '2018-06-06 12:53:42');
INSERT INTO `expenses` VALUES ('3059', null, '2018-05-12', '2', '30', null, 'DAN ', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('3060', null, '2018-05-12', '67', '100', null, 'dobi ', '1', '2018-06-06 13:17:03', '2018-06-06 13:17:03');
INSERT INTO `expenses` VALUES ('3061', null, '2018-05-14', '21', '300', null, 'UCO BANK', '1', '2018-06-06 12:53:42', '2018-06-06 12:53:42');
INSERT INTO `expenses` VALUES ('3062', null, '2018-05-15', '21', '300', null, '', '1', '2018-06-06 12:53:42', '2018-06-06 12:53:42');
INSERT INTO `expenses` VALUES ('3063', null, '2018-05-15', '43', '500', null, '', '1', '2018-06-06 13:08:23', '2018-06-06 13:08:23');
INSERT INTO `expenses` VALUES ('3064', null, '2018-05-16', '67', '100', null, 'TINKU HRIWTICK WEDDING', '1', '2018-06-06 13:17:03', '2018-06-06 13:17:03');
INSERT INTO `expenses` VALUES ('3065', null, '2018-05-16', '21', '300', null, '', '1', '2018-06-06 12:53:42', '2018-06-06 12:53:42');
INSERT INTO `expenses` VALUES ('3066', null, '2018-05-17', '21', '300', null, '', '1', '2018-06-06 12:53:42', '2018-06-06 12:53:42');
INSERT INTO `expenses` VALUES ('3067', null, '2018-05-17', '2', '100', null, '250gm   Tea', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('3068', null, '2018-05-18', '2', '50', null, 'FOOD', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('3069', null, '2018-05-19', '21', '600', null, '2DAY', '1', '2018-06-06 12:53:42', '2018-06-06 12:53:42');
INSERT INTO `expenses` VALUES ('3070', null, '2018-05-19', '2', '30', null, 'DAN', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('3071', null, '2018-05-19', '2', '20', null, 'TOTO FREM', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('3072', null, '2018-05-17', '8', '13000', null, 'BATTERY (JOGA)', '1', '2018-06-06 12:48:34', '2018-06-06 12:48:34');
INSERT INTO `expenses` VALUES ('3073', null, '2018-05-21', '21', '600', null, '2DAY', '1', '2018-06-06 12:53:42', '2018-06-06 12:53:42');
INSERT INTO `expenses` VALUES ('3074', null, '2018-05-21', '2', '200', null, 'MILK', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('3075', null, '2018-05-22', '88', '1121', null, 'MONTH OF MAY', '1', '2018-06-06 13:20:01', '2018-06-06 13:20:01');
INSERT INTO `expenses` VALUES ('3076', null, '2018-05-22', '8', '250', null, 'SOKET   OR  SAMAR DA', '1', '2018-06-06 12:48:34', '2018-06-06 12:48:34');
INSERT INTO `expenses` VALUES ('3077', null, '2018-05-22', '2', '50', null, 'BORTH SIDE GUM', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('3078', null, '2018-05-22', '4', '330', null, '11 DAY', '1', '2018-06-06 12:49:12', '2018-06-06 12:49:12');
INSERT INTO `expenses` VALUES ('3079', null, '2018-05-22', '2', '300', null, '', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('3080', null, '2018-05-23', '21', '300', null, '', '1', '2018-06-06 12:53:42', '2018-06-06 12:53:42');
INSERT INTO `expenses` VALUES ('3081', null, '2018-05-23', '2', '100', null, 'TEA', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('3082', null, '2018-05-23', '2', '80', null, 'MILK', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('3083', null, '2018-05-24', '21', '300', null, '', '1', '2018-06-06 12:53:42', '2018-06-06 12:53:42');
INSERT INTO `expenses` VALUES ('3084', null, '2018-05-25', '21', '20', null, 'SHIV SENA', '1', '2018-06-06 12:53:42', '2018-06-06 12:53:42');
INSERT INTO `expenses` VALUES ('3085', null, '2018-05-25', '43', '500', null, '', '1', '2018-06-06 13:08:23', '2018-06-06 13:08:23');
INSERT INTO `expenses` VALUES ('3086', null, '2018-05-25', '21', '300', null, '', '1', '2018-06-06 12:53:42', '2018-06-06 12:53:42');
INSERT INTO `expenses` VALUES ('3087', null, '2018-05-26', '2', '10', null, 'LEBU', '1', '2018-07-18 12:09:51', '2018-07-18 12:09:51');
INSERT INTO `expenses` VALUES ('3088', null, '2018-05-26', '58', '800', null, 'COMPUTER WORLD', '1', '2018-06-06 13:15:02', '2018-06-06 13:15:02');
INSERT INTO `expenses` VALUES ('3089', null, '2018-05-26', '21', '300', null, '', '1', '2018-06-06 12:53:42', '2018-06-06 12:53:42');
INSERT INTO `expenses` VALUES ('3090', null, '2018-05-26', '2', '30', null, '', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('3091', null, '2018-05-25', '7', '50', null, 'GOBI', '1', '2018-06-06 12:47:55', '2018-06-06 12:47:55');
INSERT INTO `expenses` VALUES ('3092', null, '2018-05-26', '2', '100', null, 'GUM', '1', '2018-06-06 12:45:24', '2018-06-06 12:45:24');
INSERT INTO `expenses` VALUES ('3093', null, '2018-05-26', '7', '30', null, '', '1', '2018-06-06 12:47:55', '2018-06-06 12:47:55');
INSERT INTO `expenses` VALUES ('3094', null, '2018-05-26', '7', '50', null, '', '1', '2018-06-06 12:47:55', '2018-06-06 12:47:55');
INSERT INTO `expenses` VALUES ('3104', 'ADW/GEN-EXP/18-19/0008', '2018-07-19', '2855', '3000', 'cheque', 'paid for Advertisement', '1', '2018-07-19 16:30:54', '2018-07-19 11:00:54');
INSERT INTO `expenses` VALUES ('3105', 'ADW/GEN-EXP/18-19/0009', '2018-07-18', '8', '5000', 'fund', 'Paid Electric bill for the month of April, May & June -18', '1', '2018-07-19 16:33:39', '2018-07-19 11:03:39');
INSERT INTO `expenses` VALUES ('3106', 'ADW/GEN-EXP/18-19/0010', '2018-07-18', '7', '200', 'cash', 'Paid for Lunch', '1', '2018-07-19 16:25:25', '2018-07-19 10:55:25');

-- ----------------------------
-- Table structure for `expenses_bill_session`
-- ----------------------------
DROP TABLE IF EXISTS `expenses_bill_session`;
CREATE TABLE `expenses_bill_session` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `session` varchar(7) DEFAULT NULL,
  `startDate` date DEFAULT NULL,
  `closeDate` date DEFAULT NULL,
  `bill` int(11) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of expenses_bill_session
-- ----------------------------
INSERT INTO `expenses_bill_session` VALUES ('1', '16-17', '2016-04-01', '2017-03-31', '0', null, '2017-04-03 11:29:33');
INSERT INTO `expenses_bill_session` VALUES ('2', '17-18', '2017-04-01', '2018-03-31', '0', null, '2017-11-02 16:43:39');
INSERT INTO `expenses_bill_session` VALUES ('3', '18-19', '2018-04-01', '2019-03-31', '10', null, '2018-07-18 10:43:20');
INSERT INTO `expenses_bill_session` VALUES ('4', '19-20', '2019-04-01', '2020-03-31', '0', null, null);

-- ----------------------------
-- Table structure for `expenses_type`
-- ----------------------------
DROP TABLE IF EXISTS `expenses_type`;
CREATE TABLE `expenses_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `exp_type` varchar(255) DEFAULT NULL,
  `status` tinyint(3) unsigned DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2920 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of expenses_type
-- ----------------------------
INSERT INTO `expenses_type` VALUES ('2', 'MISC. EXP.', '1', null, null);
INSERT INTO `expenses_type` VALUES ('4', 'GOBINDA', '1', null, null);
INSERT INTO `expenses_type` VALUES ('7', 'FOOD', '1', null, null);
INSERT INTO `expenses_type` VALUES ('8', 'ELECTRICITY', '1', null, null);
INSERT INTO `expenses_type` VALUES ('10', 'TEA', '1', null, null);
INSERT INTO `expenses_type` VALUES ('21', 'UCO BANK', '1', null, null);
INSERT INTO `expenses_type` VALUES ('40', 'TRAVELLING', '1', null, null);
INSERT INTO `expenses_type` VALUES ('43', 'MUDI DOKAN', '1', null, null);
INSERT INTO `expenses_type` VALUES ('48', 'BAPPA MOMO', '1', null, null);
INSERT INTO `expenses_type` VALUES ('51', 'ENVELOPE', '1', null, null);
INSERT INTO `expenses_type` VALUES ('58', 'COMPUTER REPAIR', '1', null, null);
INSERT INTO `expenses_type` VALUES ('62', 'DRON', '1', null, null);
INSERT INTO `expenses_type` VALUES ('67', 'FUEL', '1', null, null);
INSERT INTO `expenses_type` VALUES ('75', 'TIFFINE', '1', null, null);
INSERT INTO `expenses_type` VALUES ('88', 'ALLIANCE BROADBAND SERVCE PVT.LTD.', '1', null, null);
INSERT INTO `expenses_type` VALUES ('104', 'HOUSE RENT', '1', null, null);
INSERT INTO `expenses_type` VALUES ('105', 'WATER', '1', null, null);
INSERT INTO `expenses_type` VALUES ('2119', 'PURCHASE', '1', null, null);
INSERT INTO `expenses_type` VALUES ('2137', 'EXTRA BONUS', '1', null, null);
INSERT INTO `expenses_type` VALUES ('2463', 'SAHA BAG SUPPLIER', '1', null, null);
INSERT INTO `expenses_type` VALUES ('2507', 'PUJA  EXP.', '1', null, null);
INSERT INTO `expenses_type` VALUES ('2813', 'TELEPHONE BILL', '1', null, null);
INSERT INTO `expenses_type` VALUES ('2831', 'CHANDA', '1', null, null);
INSERT INTO `expenses_type` VALUES ('2855', 'ADVERTISEMENT', '1', null, null);
INSERT INTO `expenses_type` VALUES ('2915', 'LEBU', '1', '2018-06-07 11:33:08', '2018-06-07 11:33:08');
INSERT INTO `expenses_type` VALUES ('2918', 'Grocery', '1', '2018-07-17 12:51:49', '2018-07-17 12:51:49');
INSERT INTO `expenses_type` VALUES ('2919', 'Entertainment', '1', '2018-07-17 19:04:24', '2018-07-17 13:34:24');

-- ----------------------------
-- Table structure for `input_tax`
-- ----------------------------
DROP TABLE IF EXISTS `input_tax`;
CREATE TABLE `input_tax` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `unique_id` varchar(50) DEFAULT NULL,
  `billing_date` date DEFAULT NULL,
  `supplier_name` varchar(150) NOT NULL,
  `type` varchar(30) DEFAULT NULL,
  `purchase_invoice_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `purchase_id` int(10) unsigned DEFAULT NULL,
  `product_id` int(10) unsigned DEFAULT NULL,
  `input_tax` double(10,2) DEFAULT '0.00',
  `status` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sale_id` (`purchase_id`) USING BTREE,
  KEY `product_id` (`product_id`) USING BTREE,
  KEY `sale_invoice_id` (`purchase_invoice_id`) USING BTREE,
  CONSTRAINT `input_tax_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `input_tax_ibfk_2` FOREIGN KEY (`purchase_invoice_id`) REFERENCES `purchase_invoice` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `input_tax_ibfk_3` FOREIGN KEY (`purchase_id`) REFERENCES `purchases` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of input_tax
-- ----------------------------

-- ----------------------------
-- Table structure for `journals`
-- ----------------------------
DROP TABLE IF EXISTS `journals`;
CREATE TABLE `journals` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `journal_no` varchar(50) DEFAULT NULL,
  `journal_date` date DEFAULT NULL,
  `ledger_dr` int(10) unsigned NOT NULL,
  `ledger_cr` int(10) unsigned NOT NULL,
  `amount_dr` double(10,2) DEFAULT NULL,
  `amount_cr` double(10,2) DEFAULT NULL,
  `narration` blob,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `total_amount` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_id` (`ledger_dr`) USING BTREE,
  KEY `ledger_cr` (`ledger_cr`) USING BTREE,
  CONSTRAINT `journals_ibfk_1` FOREIGN KEY (`ledger_dr`) REFERENCES `customers` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `journals_ibfk_2` FOREIGN KEY (`ledger_cr`) REFERENCES `customers` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of journals
-- ----------------------------
INSERT INTO `journals` VALUES ('1', 'ITC/CE/18-19/0001', '2018-05-26', '67', '2', '5000.00', '5000.00', 0x5041494420544F20414D414E5320414741494E5354204F4C442050524F4A45435420455850454E5345532E2054484953204953204E4F54204153534F4349415445442057495448204E4F524D414C2044554553, '2018-05-27 04:13:49', '2018-05-28 12:08:02', '5000');

-- ----------------------------
-- Table structure for `ledgercr`
-- ----------------------------
DROP TABLE IF EXISTS `ledgercr`;
CREATE TABLE `ledgercr` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `unique_id` varchar(50) DEFAULT NULL,
  `billing_date` date DEFAULT NULL,
  `supplier_id` bigint(20) unsigned NOT NULL,
  `type` varchar(30) DEFAULT NULL,
  `amount` int(12) DEFAULT NULL,
  `extra` varchar(5) DEFAULT NULL,
  `payment_id` int(11) DEFAULT NULL,
  `purchase_id` varchar(10) DEFAULT NULL,
  `purchase_return_id` varchar(10) DEFAULT NULL,
  `contra_id` varchar(10) DEFAULT NULL,
  `status` varchar(12) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_id` (`supplier_id`) USING BTREE,
  KEY `payment_id` (`payment_id`),
  CONSTRAINT `ledgercr_ibfk_1` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `ledgercr_ibfk_2` FOREIGN KEY (`payment_id`) REFERENCES `payments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of ledgercr
-- ----------------------------
INSERT INTO `ledgercr` VALUES ('3', 'ADWS/PUR/0048/18-19', '2018-07-16', '1', 'CreditPurchase', '5700', '+', null, '73', null, null, null, '2018-07-16 12:55:42', '2018-07-16 12:58:16');
INSERT INTO `ledgercr` VALUES ('6', 'ADW/PAY/18-19/0039', '2018-07-17', '1', 'Payment', '1700', '-', '39', null, null, null, null, '2018-07-17 07:58:16', '2018-07-17 08:11:18');
INSERT INTO `ledgercr` VALUES ('7', 'ADW/PAY/18-19/0040', '2018-07-17', '1', 'Payment', '1500', '-', '40', null, null, null, null, '2018-07-17 08:18:13', '2018-07-17 08:18:13');
INSERT INTO `ledgercr` VALUES ('8', 'ADW/PAY/18-19/0041', '2018-07-17', '1', 'Payment', '2000', '-', '41', null, null, null, null, '2018-07-17 08:23:42', '2018-07-17 08:23:42');
INSERT INTO `ledgercr` VALUES ('9', 'ADW/PAY/18-19/0042', '2018-07-17', '1', 'Payment', '500', '-', '42', null, null, null, null, '2018-07-17 08:24:08', '2018-07-17 08:24:08');
INSERT INTO `ledgercr` VALUES ('11', 'ADWS/PR/18-19/0005', '2018-07-17', '1', 'purchase Return', '4020', '-', null, null, '8', null, null, '2018-07-17 09:13:43', '2018-07-17 09:13:43');
INSERT INTO `ledgercr` VALUES ('12', 'ADWS/PUR/0049/18-19', '2018-11-10', '27', 'CreditPurchase', '690', '+', null, '74', null, null, null, '2018-11-10 11:07:09', '2018-11-10 11:07:09');
INSERT INTO `ledgercr` VALUES ('13', 'ADWS/PUR/18-19/0050', '2018-11-10', '27', 'CreditPurchase', '1300', '+', null, '75', null, null, null, '2018-11-10 11:12:50', '2018-11-10 11:12:50');
INSERT INTO `ledgercr` VALUES ('14', 'ADW/PAY/18-19/0043', '2018-11-10', '27', 'Payment', '1000', '-', '43', null, null, null, null, '2018-11-10 11:15:40', '2018-11-10 11:31:34');
INSERT INTO `ledgercr` VALUES ('15', 'ADWS/PUR/18-19/0051', '2019-02-14', '1', 'CreditPurchase', '3135', '+', null, '76', null, null, null, '2019-02-14 11:53:32', '2019-02-14 11:53:32');
INSERT INTO `ledgercr` VALUES ('16', 'ADWS/PR/18-19/0006', '2019-02-14', '1', 'purchase Return', '5670', '-', null, null, '9', null, null, '2019-02-14 11:55:01', '2019-02-14 11:55:01');

-- ----------------------------
-- Table structure for `ledgerdr`
-- ----------------------------
DROP TABLE IF EXISTS `ledgerdr`;
CREATE TABLE `ledgerdr` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `unique_id` varchar(50) DEFAULT NULL,
  `billing_date` date DEFAULT NULL,
  `customer_id` bigint(20) unsigned NOT NULL,
  `type` varchar(30) DEFAULT NULL,
  `amount` int(12) DEFAULT NULL,
  `extra` varchar(5) DEFAULT NULL,
  `receipt_id` int(11) DEFAULT NULL,
  `sale_id` varchar(10) DEFAULT NULL,
  `sale_return_id` varchar(10) DEFAULT NULL,
  `contra_id` varchar(10) DEFAULT NULL,
  `status` varchar(12) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_id` (`customer_id`) USING BTREE,
  KEY `receipt_id` (`receipt_id`),
  CONSTRAINT `ledgerdr_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `ledgerdr_ibfk_2` FOREIGN KEY (`receipt_id`) REFERENCES `receipts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of ledgerdr
-- ----------------------------
INSERT INTO `ledgerdr` VALUES ('40', 'ADWS/5418/18-19', '2018-07-16', '3210', 'CashSale', '1400', '+', null, '23', null, null, null, '2018-07-16 05:49:24', '2018-07-16 05:49:24');
INSERT INTO `ledgerdr` VALUES ('41', 'ADWS/5419/18-19', '2018-07-16', '3', 'CreditSale', '1140', '+', null, '24', null, null, null, '2018-07-16 05:54:07', '2018-07-16 05:54:07');
INSERT INTO `ledgerdr` VALUES ('48', 'ADW/REC/18-19/0016', '2018-07-16', '3', 'Receipt', '200', '-', '8', null, null, null, null, '2018-07-16 09:02:24', '2018-07-16 09:02:24');
INSERT INTO `ledgerdr` VALUES ('49', 'ADW/REC/18-19/0017', '2018-07-16', '3', 'Receipt', '400', '-', '9', null, null, null, null, '2018-07-16 09:02:59', '2018-07-16 09:15:16');
INSERT INTO `ledgerdr` VALUES ('50', 'ADW/REC/18-19/0018', '2018-07-16', '3', 'Receipt', '540', '-', '10', null, null, null, null, '2018-07-16 09:03:35', '2018-07-16 09:03:35');
INSERT INTO `ledgerdr` VALUES ('51', 'ADWS/SR/18-19/0006', '2018-07-16', '3', 'sale Return', '1140', '-', null, null, '4', null, null, '2018-07-16 09:17:55', '2018-07-16 09:17:55');
INSERT INTO `ledgerdr` VALUES ('52', 'ADWS/5420/18-19', '2018-08-17', '2', 'CreditSale', '1650', '+', null, '25', null, null, null, '2018-08-17 06:39:20', '2018-08-17 06:39:20');
INSERT INTO `ledgerdr` VALUES ('53', 'ADW/REC/18-19/0019', '2018-08-17', '2', 'Receipt', '1650', '-', '11', null, null, null, null, '2018-08-17 06:42:01', '2018-08-17 06:42:01');
INSERT INTO `ledgerdr` VALUES ('54', 'ADWS/5421/18-19', '2018-09-08', '3210', 'CashSale', '170', '+', null, '26', null, null, null, '2018-09-08 09:22:20', '2018-09-08 09:22:20');
INSERT INTO `ledgerdr` VALUES ('55', 'ADWS/5422/18-19', '2019-02-14', '1', 'CreditSale', '1080', '+', null, '27', null, null, null, '2019-02-14 11:51:54', '2019-02-14 11:51:54');
INSERT INTO `ledgerdr` VALUES ('56', 'ADWS/SR/18-19/0007', '2019-02-14', '3210', 'sale Return', '170', '-', null, null, '5', null, null, '2019-02-14 11:54:40', '2019-02-14 11:54:40');

-- ----------------------------
-- Table structure for `ledger_groups`
-- ----------------------------
DROP TABLE IF EXISTS `ledger_groups`;
CREATE TABLE `ledger_groups` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `ledger_group_name` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of ledger_groups
-- ----------------------------
INSERT INTO `ledger_groups` VALUES ('1', 'assets', null, null);
INSERT INTO `ledger_groups` VALUES ('2', 'liablities', null, null);

-- ----------------------------
-- Table structure for `ledger_type`
-- ----------------------------
DROP TABLE IF EXISTS `ledger_type`;
CREATE TABLE `ledger_type` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `ledger_type_name` varchar(255) DEFAULT NULL,
  `ledger_group_id` int(10) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ledger_group_id` (`ledger_group_id`),
  CONSTRAINT `ledger_type_ibfk_1` FOREIGN KEY (`ledger_group_id`) REFERENCES `ledger_groups` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of ledger_type
-- ----------------------------
INSERT INTO `ledger_type` VALUES ('1', 'sundry creditors', '2', null, null);
INSERT INTO `ledger_type` VALUES ('2', 'sundry debtors', '1', null, null);
INSERT INTO `ledger_type` VALUES ('3', 'cash in hand', '1', null, null);
INSERT INTO `ledger_type` VALUES ('4', 'bank', '1', null, null);
INSERT INTO `ledger_type` VALUES ('5', 'direct expenses', '2', null, null);
INSERT INTO `ledger_type` VALUES ('6', 'indirect expeses', '2', null, null);
INSERT INTO `ledger_type` VALUES ('7', 'Loan', '2', '2018-05-21 01:45:37', '2018-05-26 13:47:33');
INSERT INTO `ledger_type` VALUES ('8', 'investment', '1', null, null);
INSERT INTO `ledger_type` VALUES ('9', 'deposits', '1', null, null);
INSERT INTO `ledger_type` VALUES ('10', 'provision', '1', null, null);
INSERT INTO `ledger_type` VALUES ('11', 'special', '1', '2018-05-24 11:39:11', '2018-05-24 11:39:11');

-- ----------------------------
-- Table structure for `loan_tracks`
-- ----------------------------
DROP TABLE IF EXISTS `loan_tracks`;
CREATE TABLE `loan_tracks` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `loan_deducted_date` varchar(10) DEFAULT NULL,
  `loan_deducted_for_month` varchar(10) DEFAULT NULL,
  `loan_deducted_amount` double DEFAULT NULL,
  `emp_id_pk` int(11) DEFAULT NULL,
  `emp_code` varchar(12) DEFAULT NULL,
  `emp_name` varchar(255) DEFAULT NULL,
  `user_id` varchar(10) DEFAULT NULL,
  `pay_unique_no` varchar(20) DEFAULT NULL,
  `loan_id` varchar(10) DEFAULT NULL,
  `loan_balance` varchar(10) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of loan_tracks
-- ----------------------------
INSERT INTO `loan_tracks` VALUES ('1', '01-08-2018', '07', '2000', '1', 'ADWEMP1', 'GOBINDA MAJUMDAR', null, '4', '2', '8000', '2018-07-12 05:40:21', '2018-07-12 05:40:21');
INSERT INTO `loan_tracks` VALUES ('2', '01-09-2018', '08', '2000', '1', 'ADWEMP1', 'GOBINDA MAJUMDAR', null, '5', '2', '6000', '2018-07-12 06:11:32', '2018-07-12 06:11:32');
INSERT INTO `loan_tracks` VALUES ('3', '01-10-2018', '09', '2000', '1', 'ADWEMP1', 'GOBINDA MAJUMDAR', null, '6', '2', '4000', '2018-07-12 06:13:42', '2018-07-12 06:13:42');
INSERT INTO `loan_tracks` VALUES ('4', '01-11-2018', '10', '2000', '1', 'ADWEMP1', 'GOBINDA MAJUMDAR', null, '7', '2', '2000', '2018-07-12 06:14:21', '2018-07-12 06:14:21');
INSERT INTO `loan_tracks` VALUES ('5', '01-12-2018', '11', '2000', '1', 'ADWEMP1', 'GOBINDA MAJUMDAR', null, '8', '2', '0', '2018-07-12 06:17:03', '2018-07-12 06:17:03');
INSERT INTO `loan_tracks` VALUES ('6', '12-07-2018', '06', '2000', '3', 'ADWEMP3', 'BIJAY GUHA NEOGI', null, '9', '3', '6000', '2018-07-12 06:37:33', '2018-07-12 06:37:33');
INSERT INTO `loan_tracks` VALUES ('7', '01-08-2018', '07', '2000', '3', 'ADWEMP3', 'BIJAY GUHA NEOGI', null, '10', '3', '4000', '2018-07-12 12:31:39', '2018-07-12 12:31:39');
INSERT INTO `loan_tracks` VALUES ('8', '01-09-2018', '08', '2000', '3', 'ADWEMP3', 'BIJAY GUHA NEOGI', null, '11', '3', '2000', '2018-07-12 12:32:12', '2018-07-12 12:32:12');
INSERT INTO `loan_tracks` VALUES ('9', '01-11-2018', '10', '2000', '3', 'ADWEMP3', 'BIJAY GUHA NEOGI', null, '12', '3', '0', '2018-07-12 12:32:59', '2018-07-12 12:32:59');
INSERT INTO `loan_tracks` VALUES ('10', '01-12-2018', '11', '1000', '3', 'ADWEMP3', 'BIJAY GUHA NEOGI', null, '13', '4', '4000', '2018-07-12 12:34:16', '2018-07-12 12:34:16');

-- ----------------------------
-- Table structure for `migrations`
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES ('1', '2014_10_12_000000_create_users_table', '1');
INSERT INTO `migrations` VALUES ('2', '2014_10_12_100000_create_password_resets_table', '1');
INSERT INTO `migrations` VALUES ('3', '2016_11_17_070141_create_Brands_table', '1');
INSERT INTO `migrations` VALUES ('4', '2016_11_17_071212_create_product_types_table', '2');
INSERT INTO `migrations` VALUES ('5', '2016_11_17_073729_create_products_table', '3');
INSERT INTO `migrations` VALUES ('6', '2016_11_21_094836_create_frontend_products_table', '4');
INSERT INTO `migrations` VALUES ('12', '2016_11_26_061901_create_customers_table', '5');
INSERT INTO `migrations` VALUES ('13', '2016_11_26_062014_create_creditors_table', '5');
INSERT INTO `migrations` VALUES ('14', '2016_12_02_101925_create_sales_table', '5');
INSERT INTO `migrations` VALUES ('15', '2016_12_02_101949_create_purchases_table', '5');
INSERT INTO `migrations` VALUES ('16', '2016_12_16_064717_create_services_table', '5');
INSERT INTO `migrations` VALUES ('18', '2017_02_23_064242_create_challan_table', '6');
INSERT INTO `migrations` VALUES ('19', '2017_02_23_082226_create_Challan_invoice', '6');
INSERT INTO `migrations` VALUES ('20', '2017_03_17_072450_create_exp_table', '7');

-- ----------------------------
-- Table structure for `months`
-- ----------------------------
DROP TABLE IF EXISTS `months`;
CREATE TABLE `months` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `month_in_number` varchar(5) DEFAULT NULL,
  `month_in_word` varchar(20) DEFAULT NULL,
  `year` varchar(15) DEFAULT NULL,
  `in_days` varchar(10) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of months
-- ----------------------------
INSERT INTO `months` VALUES ('1', '01', 'January ', '2018', '31', '2018-01-05 12:12:23', '2018-01-05 12:07:00');
INSERT INTO `months` VALUES ('2', '02', 'February', '2018', '28', '2018-01-05 12:12:25', '2018-01-05 12:07:40');
INSERT INTO `months` VALUES ('3', '03', 'March', '2018', '31', '2018-01-05 12:12:38', '2018-01-05 12:07:46');
INSERT INTO `months` VALUES ('4', '04', 'April', '2018', '30', '2018-01-05 12:12:39', '2018-01-05 12:07:52');
INSERT INTO `months` VALUES ('5', '05', 'May', '2018', '31', '2018-01-05 12:12:42', '2018-01-05 12:08:21');
INSERT INTO `months` VALUES ('6', '06', 'June', '2018', '30', '2018-01-05 12:12:45', '2018-01-05 12:08:29');
INSERT INTO `months` VALUES ('7', '07', 'July', '2018', '31', '2018-01-05 12:12:48', '2018-01-05 12:08:35');
INSERT INTO `months` VALUES ('8', '08', 'August', '2018', '31', '2018-01-05 12:12:51', '2018-01-05 12:08:41');
INSERT INTO `months` VALUES ('9', '09', 'September', '2018', '30', '2018-01-05 12:12:54', '2018-01-05 12:08:47');
INSERT INTO `months` VALUES ('10', '10', 'October', '2018', '31', '2018-01-05 12:12:55', '2018-01-05 12:08:53');
INSERT INTO `months` VALUES ('11', '11', 'November', '2018', '30', '2018-01-05 12:12:57', '2018-01-05 12:08:59');
INSERT INTO `months` VALUES ('12', '12', 'December', '2018', '31', '2018-01-05 12:12:59', '2018-01-05 12:09:05');

-- ----------------------------
-- Table structure for `other_charge`
-- ----------------------------
DROP TABLE IF EXISTS `other_charge`;
CREATE TABLE `other_charge` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `unique_id` varchar(50) DEFAULT NULL,
  `billing_date` date DEFAULT NULL,
  `customer_id` int(10) unsigned NOT NULL,
  `amount` int(12) DEFAULT NULL,
  `desc` blob,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `type` varchar(30) DEFAULT NULL,
  `cheque_no` varchar(50) DEFAULT NULL,
  `bank_name` varchar(255) DEFAULT NULL,
  `cheque_issue_date` varchar(20) DEFAULT NULL,
  `cheque_deposit_date` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_id` (`customer_id`) USING BTREE,
  CONSTRAINT `other_charge_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of other_charge
-- ----------------------------

-- ----------------------------
-- Table structure for `other_charge_bill_session`
-- ----------------------------
DROP TABLE IF EXISTS `other_charge_bill_session`;
CREATE TABLE `other_charge_bill_session` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `session` varchar(7) DEFAULT NULL,
  `startDate` date DEFAULT NULL,
  `closeDate` date DEFAULT NULL,
  `bill` int(11) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of other_charge_bill_session
-- ----------------------------
INSERT INTO `other_charge_bill_session` VALUES ('1', '16-17', '2016-04-01', '2017-03-31', '0', null, '2017-04-03 11:29:33');
INSERT INTO `other_charge_bill_session` VALUES ('2', '17-18', '2017-04-01', '2018-03-31', '0', null, '2017-11-03 01:39:53');
INSERT INTO `other_charge_bill_session` VALUES ('3', '18-19', '2018-04-01', '2019-03-31', '1', null, '2018-05-27 04:13:49');
INSERT INTO `other_charge_bill_session` VALUES ('4', '19-20', '2019-04-01', '2020-03-31', '0', null, null);

-- ----------------------------
-- Table structure for `outdoor_assign_emp`
-- ----------------------------
DROP TABLE IF EXISTS `outdoor_assign_emp`;
CREATE TABLE `outdoor_assign_emp` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `outdoor_shoot_id` int(10) unsigned DEFAULT NULL,
  `assign_emp_id` int(11) DEFAULT '0',
  `emp_working_days` int(10) unsigned DEFAULT NULL,
  `pay_per_day` int(11) DEFAULT NULL,
  `misc_payment` int(10) DEFAULT NULL,
  `total_amount` double(10,2) DEFAULT NULL,
  `status` varchar(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  `outdoor_shoot_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `outdoor_shoot_id` (`outdoor_shoot_id`),
  KEY `assign_emp_id` (`assign_emp_id`),
  CONSTRAINT `outdoor_assign_emp_ibfk_1` FOREIGN KEY (`outdoor_shoot_id`) REFERENCES `outdoor_shoot` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `outdoor_assign_emp_ibfk_2` FOREIGN KEY (`assign_emp_id`) REFERENCES `employee` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of outdoor_assign_emp
-- ----------------------------
INSERT INTO `outdoor_assign_emp` VALUES ('29', '45', '9', '2', '650', '50', '1350.00', null, '2018-09-27', '2018-09-27 11:34:35', '2018-09-27 11:34:35');
INSERT INTO `outdoor_assign_emp` VALUES ('30', '46', '3', '2', '1000', '0', '2000.00', null, '2018-10-30', '2018-09-29 12:49:31', '2018-09-29 12:49:31');
INSERT INTO `outdoor_assign_emp` VALUES ('31', '47', '3', '1', '800', '100', '900.00', null, '2018-10-01', '2018-10-01 08:39:39', '2018-10-01 08:39:39');
INSERT INTO `outdoor_assign_emp` VALUES ('32', '48', '78', '1', '500', '50', '550.00', null, '2018-10-03', '2018-10-03 07:45:16', '2018-10-03 07:45:16');
INSERT INTO `outdoor_assign_emp` VALUES ('33', '48', '9', '1', '650', '0', '650.00', null, '2018-10-03', '2018-10-03 07:45:16', '2018-10-03 07:45:16');
INSERT INTO `outdoor_assign_emp` VALUES ('34', '49', '81', '2', '650', '100', '1400.00', null, '2018-10-03', '2018-10-03 13:55:51', '2018-10-03 13:55:51');
INSERT INTO `outdoor_assign_emp` VALUES ('35', '49', '1', '1', '1000', '500', '1500.00', null, '2018-10-03', '2018-10-03 13:55:51', '2018-10-03 13:55:51');
INSERT INTO `outdoor_assign_emp` VALUES ('36', '50', '79', '2', '650', '50', '1350.00', null, '2018-10-04', '2018-10-04 07:56:47', '2018-10-04 07:56:47');
INSERT INTO `outdoor_assign_emp` VALUES ('37', '50', '80', '1', '500', '50', '550.00', null, '2018-10-04', '2018-10-04 07:56:47', '2018-10-04 07:56:47');
INSERT INTO `outdoor_assign_emp` VALUES ('40', '53', '2', '1', '800', '0', '800.00', null, '2018-10-04', '2018-10-04 11:41:09', '2018-10-04 11:41:09');
INSERT INTO `outdoor_assign_emp` VALUES ('41', '45', '2', '2', '500', '50', '1050.00', null, '2018-09-27', '2018-10-05 10:31:58', '2018-10-05 10:31:58');
INSERT INTO `outdoor_assign_emp` VALUES ('42', '53', '5', '1', '400', '0', '400.00', null, '2018-10-04', '2018-10-05 11:41:52', '2018-10-05 11:41:52');
INSERT INTO `outdoor_assign_emp` VALUES ('43', '54', '101', '2', '1000', '0', '2000.00', null, '2018-10-04', '2018-10-23 12:42:11', '2018-10-23 12:42:11');
INSERT INTO `outdoor_assign_emp` VALUES ('46', '63', '4', '1', '200', '50', '250.00', null, '2018-10-27', '2018-10-27 08:38:20', '2018-10-27 08:38:20');
INSERT INTO `outdoor_assign_emp` VALUES ('47', '63', '106', '1', '1000', '0', '1000.00', null, '2018-10-27', '2018-10-27 08:38:21', '2018-10-30 11:55:41');
INSERT INTO `outdoor_assign_emp` VALUES ('48', '64', '1', '2', '200', '50', '450.00', null, '2019-02-18', '2019-02-18 12:23:05', '2019-02-18 12:23:05');
INSERT INTO `outdoor_assign_emp` VALUES ('49', '64', '4', '2', '100', '50', '250.00', null, '2019-02-18', '2019-02-18 12:23:06', '2019-02-18 12:23:06');

-- ----------------------------
-- Table structure for `outdoor_bank`
-- ----------------------------
DROP TABLE IF EXISTS `outdoor_bank`;
CREATE TABLE `outdoor_bank` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `unique_id` varchar(50) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `outdoor_customer_id` int(11) unsigned DEFAULT NULL,
  `assign_emp_id` int(11) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `amount` int(10) DEFAULT NULL,
  `extra` varchar(5) DEFAULT NULL,
  `through` varchar(20) DEFAULT NULL,
  `bank_name` varchar(30) DEFAULT NULL,
  `cheque_no` varchar(60) DEFAULT NULL,
  `cheque_issue_date` varchar(20) DEFAULT NULL,
  `chuque_deposit_date` varchar(20) DEFAULT NULL,
  `fund_type` varchar(20) DEFAULT NULL,
  `transation_no` varchar(60) DEFAULT NULL,
  `transaction_date` varchar(20) DEFAULT NULL,
  `outdoor_shoot_id` int(11) unsigned DEFAULT NULL,
  `outdoor_receipt_id` int(11) unsigned DEFAULT NULL,
  `outdoor_payment_id` int(11) DEFAULT NULL,
  `contra_id` varchar(10) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `outdoor_shoot_id` (`outdoor_shoot_id`),
  KEY `outdoor_receipt_id` (`outdoor_receipt_id`),
  KEY `outdoor_payment_id` (`outdoor_payment_id`),
  KEY `outdoor_bank_ibfk_2` (`assign_emp_id`),
  KEY `outdoor_bank_ibfk_1` (`outdoor_customer_id`),
  CONSTRAINT `outdoor_bank_ibfk_1` FOREIGN KEY (`outdoor_customer_id`) REFERENCES `outdoor_customer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `outdoor_bank_ibfk_2` FOREIGN KEY (`assign_emp_id`) REFERENCES `outdoor_assign_emp` (`assign_emp_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `outdoor_bank_ibfk_3` FOREIGN KEY (`outdoor_shoot_id`) REFERENCES `outdoor_shoot` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `outdoor_bank_ibfk_4` FOREIGN KEY (`outdoor_receipt_id`) REFERENCES `outdoor_receipts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `outdoor_bank_ibfk_5` FOREIGN KEY (`outdoor_payment_id`) REFERENCES `outdoor_payments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of outdoor_bank
-- ----------------------------
INSERT INTO `outdoor_bank` VALUES ('3', 'ADW/OUT-CUS-REC/18-19/0079', '2018-10-27', '27', null, 'Receipt', '5000', '+', 'cheque', 'AXIS', '23547', '27/10/2018', '27/10/2018', null, null, null, '63', '28', null, null, '2018-10-27 09:31:46', '2018-10-27 09:31:46', null);
INSERT INTO `outdoor_bank` VALUES ('4', 'ADW/OUT-EMP-PAY/18-19/0031', '2018-10-25', null, '2', 'Payment', '550', '-', 'cheque', 'SBI', '102456', '25/10/2018', '', null, null, null, null, null, '15', null, '2018-11-01 08:52:45', '2018-11-01 08:52:45', null);
INSERT INTO `outdoor_bank` VALUES ('5', 'ADW/OUT-EMP-PAY/18-19/0040', '2018-11-01', null, '2', 'Payment', '450', '-', 'fund', 'Bandhan Bank', null, null, null, 'UPI', 'p1810291642220142018657', '01/11/2018', '53', null, '24', null, '2018-11-01 11:59:50', '2018-11-01 11:59:50', null);
INSERT INTO `outdoor_bank` VALUES ('6', 'ADW/OUT-CUS-REC/18-19/0080', '2018-11-02', '27', null, 'Receipt', '5000', '+', 'fund', 'Bandhan Bank', null, null, null, 'UPI', 'P1810291642220102574630', '02/11/2018', '63', '29', null, null, '2018-11-02 08:04:17', '2018-11-02 08:04:17', null);
INSERT INTO `outdoor_bank` VALUES ('7', 'ADW/OUT-CUS-REC/18-19/0082', '2018-11-03', '16', null, 'Receipt', '2500', '+', 'fund', 'HDFC Bank', null, null, null, 'UPI', 'P181029164222010257007', '03/11/2018', '48', '31', null, null, '2018-11-03 09:30:18', '2018-11-03 09:30:18', null);

-- ----------------------------
-- Table structure for `outdoor_bill_session`
-- ----------------------------
DROP TABLE IF EXISTS `outdoor_bill_session`;
CREATE TABLE `outdoor_bill_session` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `session` varchar(7) DEFAULT NULL,
  `startDate` date DEFAULT NULL,
  `closeDate` date DEFAULT NULL,
  `bill` int(11) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of outdoor_bill_session
-- ----------------------------
INSERT INTO `outdoor_bill_session` VALUES ('1', '16-17', '2016-04-01', '2017-03-31', '0', null, '2017-04-03 11:29:33');
INSERT INTO `outdoor_bill_session` VALUES ('2', '17-18', '2017-04-01', '2018-03-31', '0', null, '2017-11-02 16:43:39');
INSERT INTO `outdoor_bill_session` VALUES ('3', '18-19', '2018-04-01', '2019-03-31', '51', null, '2019-02-18 12:23:06');
INSERT INTO `outdoor_bill_session` VALUES ('4', '19-20', '2019-04-01', '2020-03-31', '0', null, null);

-- ----------------------------
-- Table structure for `outdoor_cash`
-- ----------------------------
DROP TABLE IF EXISTS `outdoor_cash`;
CREATE TABLE `outdoor_cash` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `unique_id` varchar(50) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `outdoor_customer_id` int(11) unsigned DEFAULT NULL,
  `assign_emp_id` int(11) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `amount` int(10) DEFAULT NULL,
  `extra` varchar(5) DEFAULT NULL,
  `outdoor_shoot_id` int(10) unsigned DEFAULT NULL,
  `outdoor_receipt_id` int(11) unsigned DEFAULT NULL,
  `outdoor_payment_id` int(11) DEFAULT NULL,
  `contra_id` varchar(10) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `outdoor_customer_id` (`outdoor_customer_id`),
  KEY `outdoor_shoot_id` (`outdoor_shoot_id`),
  KEY `outdoor_receipt_id` (`outdoor_receipt_id`),
  KEY `outdoor_payment_id` (`outdoor_payment_id`),
  KEY `outdoor_cash_ibfk_2` (`assign_emp_id`),
  CONSTRAINT `outdoor_cash_ibfk_1` FOREIGN KEY (`outdoor_customer_id`) REFERENCES `outdoor_customer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `outdoor_cash_ibfk_2` FOREIGN KEY (`assign_emp_id`) REFERENCES `outdoor_assign_emp` (`assign_emp_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `outdoor_cash_ibfk_3` FOREIGN KEY (`outdoor_shoot_id`) REFERENCES `outdoor_shoot` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `outdoor_cash_ibfk_4` FOREIGN KEY (`outdoor_receipt_id`) REFERENCES `outdoor_receipts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `outdoor_cash_ibfk_5` FOREIGN KEY (`outdoor_payment_id`) REFERENCES `outdoor_payments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of outdoor_cash
-- ----------------------------
INSERT INTO `outdoor_cash` VALUES ('37', 'ADW/OUT-CUS-REC/18-19/0072', '2018-10-04', '15', null, 'Receipt', '6000', '+', null, '22', null, null, '2018-10-04 07:52:09', '2018-10-04 07:52:09', null);
INSERT INTO `outdoor_cash` VALUES ('42', 'ADW/OUT-CUS-REC/18-19/0075', '2018-10-05', '16', null, 'Receipt', '5000', '+', null, '25', null, null, '2018-10-05 12:29:16', '2018-10-05 12:29:16', null);
INSERT INTO `outdoor_cash` VALUES ('43', 'ADW/OUT-CUS-REC/18-19/0076', '2018-10-05', '16', null, 'Receipt', '5000', '+', null, '26', null, null, '2018-10-05 12:30:17', '2018-10-05 12:30:17', null);
INSERT INTO `outdoor_cash` VALUES ('47', 'ADW/OUT-CUS-REC/18-19/0077', '2018-10-05', '16', null, 'Receipt', '4500', '+', null, '27', null, null, '2018-10-08 09:20:46', '2018-10-08 09:20:46', null);
INSERT INTO `outdoor_cash` VALUES ('48', 'ADW/OUT-CUS-REC/18-19/0074', '2018-10-04', '15', null, 'Receipt', '4500', '+', null, '24', null, null, '2018-10-08 09:20:50', '2018-10-08 09:20:50', null);
INSERT INTO `outdoor_cash` VALUES ('49', 'ADW/OUT-CUS-REC/18-19/0073', '2018-10-04', '15', null, 'Receipt', '3500', '+', null, '23', null, null, '2018-10-08 09:20:55', '2018-10-08 09:20:55', null);
INSERT INTO `outdoor_cash` VALUES ('50', 'ADW/OUT-CUS-REC/18-19/0070', '2018-10-04', '11', null, 'Receipt', '15000', '+', null, '20', null, null, '2018-10-08 09:20:59', '2018-10-08 09:20:59', null);
INSERT INTO `outdoor_cash` VALUES ('51', 'ADW/OUT-EMP-PAY/18-19/0030', '2018-10-25', null, '2', 'Payment', '350', '-', '53', null, '14', null, '2018-10-25 12:56:29', '2018-10-25 12:56:29', null);
INSERT INTO `outdoor_cash` VALUES ('54', 'ADW/OUT-EMP-PAY/18-19/0033', '2018-10-25', null, '3', 'Payment', '1000', '-', '46', null, '17', null, '2018-10-25 13:20:19', '2018-10-25 13:20:19', null);
INSERT INTO `outdoor_cash` VALUES ('59', 'ADW/OUT-EMP-PAY/18-19/0036', '2018-10-30', null, '3', 'Payment', '550', '-', '46', null, '20', null, '2018-10-30 11:07:49', '2018-10-30 11:07:49', null);
INSERT INTO `outdoor_cash` VALUES ('61', 'ADW/OUT-EMP-PAY/18-19/0037', '2018-10-26', null, '3', 'Payment', '350', '-', null, null, '21', null, '2018-10-30 11:20:46', '2018-10-30 11:20:46', null);
INSERT INTO `outdoor_cash` VALUES ('62', 'ADW/OUT-EMP-PAY/18-19/0038', '2018-10-31', null, '79', 'Payment', '500', '-', '50', null, '22', null, '2018-10-31 08:36:20', '2018-10-31 08:36:20', null);
INSERT INTO `outdoor_cash` VALUES ('63', 'ADW/OUT-CUS-REC/18-19/0081', '2018-11-02', '27', null, 'Receipt', '3500', '+', '62', '30', null, null, '2018-11-02 08:14:26', '2018-11-02 08:14:26', null);
INSERT INTO `outdoor_cash` VALUES ('64', 'ADW/OUT-EMP-PAY/18-19/0041', '2018-11-02', null, '2', 'Payment', '500', '-', '45', null, '25', null, '2018-11-02 08:38:52', '2018-11-02 08:38:52', null);
INSERT INTO `outdoor_cash` VALUES ('65', 'ADW/OUT-CUS-REC/18-19/0083', '2018-11-03', '27', null, 'Receipt', '5500', '+', '62', '32', null, null, '2018-11-03 09:36:43', '2018-11-03 09:36:43', null);
INSERT INTO `outdoor_cash` VALUES ('66', 'ADW/OUT-CUS-REC/18-19/0084', '2019-02-18', '11', null, 'Receipt', '10000', '+', '46', '33', null, null, '2019-02-18 10:38:15', '2019-02-18 10:38:15', null);

-- ----------------------------
-- Table structure for `outdoor_customer`
-- ----------------------------
DROP TABLE IF EXISTS `outdoor_customer`;
CREATE TABLE `outdoor_customer` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `outdoor_cus_code` varchar(50) DEFAULT NULL,
  `outdoor_cus_name` varchar(50) DEFAULT NULL,
  `contact_no` varchar(30) DEFAULT NULL,
  `address` mediumtext,
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of outdoor_customer
-- ----------------------------
INSERT INTO `outdoor_customer` VALUES ('11', null, 'Siddhatha Kar', '98320986250', 'Jalpaiguri', '2018-09-08 07:58:47', '2018-09-08 07:58:47');
INSERT INTO `outdoor_customer` VALUES ('15', null, 'S.K. Das', '9832329366', 'Siliguri', '2018-10-25 17:06:41', '2018-10-25 11:36:41');
INSERT INTO `outdoor_customer` VALUES ('16', null, 'Mr. X', '03532539422', 'Siliguri', '2018-09-24 08:27:34', '2018-09-24 08:27:34');
INSERT INTO `outdoor_customer` VALUES ('18', null, 'Mr. Y', '7841236578', 'Kolkata', '2018-10-03 13:53:33', '2018-10-03 13:53:33');
INSERT INTO `outdoor_customer` VALUES ('19', null, 'Mr. Z', '03532539422', 'Siliguri', '2018-10-04 07:55:29', '2018-10-04 07:55:29');
INSERT INTO `outdoor_customer` VALUES ('20', null, 'Nabin Kumar', '03532539422', 'Siliguri', '2018-10-04 14:11:15', '2018-10-04 14:11:15');
INSERT INTO `outdoor_customer` VALUES ('21', null, 'Amlan Kumar Basak', '9832668672', 'Subhaspally, Siliguri', '2018-10-25 17:07:45', '2018-10-25 11:37:45');
INSERT INTO `outdoor_customer` VALUES ('22', null, 'Kuntal Ghosh', '9434319833', 'North Baman Para Jalpaiguri\n\n', '2018-10-27 06:41:40', '2018-10-27 06:41:40');
INSERT INTO `outdoor_customer` VALUES ('23', null, 'aaaa', '03532539422', 'Siliguri', '2018-10-27 07:56:17', '2018-10-27 07:56:17');
INSERT INTO `outdoor_customer` VALUES ('27', null, 'Ram Sarkar', '', '', '2018-11-02 13:34:57', '2018-11-02 13:34:57');
INSERT INTO `outdoor_customer` VALUES ('28', null, 'mr. sanja kumar ', '9832668671', 'mateli bazar', '2019-02-18 12:21:50', '2019-02-18 12:21:50');

-- ----------------------------
-- Table structure for `outdoor_ledgercr`
-- ----------------------------
DROP TABLE IF EXISTS `outdoor_ledgercr`;
CREATE TABLE `outdoor_ledgercr` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `unique_id` varchar(50) DEFAULT NULL,
  `schedule_date` date DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `outdoor_shoot_id` int(10) unsigned DEFAULT NULL,
  `assign_emp_id` int(11) NOT NULL,
  `outdoor_payment_id` int(11) DEFAULT NULL,
  `type` varchar(30) DEFAULT NULL,
  `amount` int(12) DEFAULT NULL,
  `extra` varchar(5) DEFAULT NULL,
  `contra_id` varchar(10) DEFAULT NULL,
  `status` varchar(12) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_id` (`assign_emp_id`) USING BTREE,
  KEY `payment_id` (`outdoor_payment_id`),
  KEY `outdoor_sch_id` (`outdoor_shoot_id`),
  CONSTRAINT `outdoor_ledgercr_ibfk_1` FOREIGN KEY (`assign_emp_id`) REFERENCES `outdoor_assign_emp` (`assign_emp_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `outdoor_ledgercr_ibfk_2` FOREIGN KEY (`outdoor_shoot_id`) REFERENCES `outdoor_shoot` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `outdoor_ledgercr_ibfk_3` FOREIGN KEY (`outdoor_payment_id`) REFERENCES `outdoor_payments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of outdoor_ledgercr
-- ----------------------------
INSERT INTO `outdoor_ledgercr` VALUES ('43', 'ADWS/OUT-SCH/18-19/0034', '2018-09-27', null, '45', '9', null, 'EmpPaymentDue', '1350', '+', null, null, '2018-09-27 11:34:35', '2018-09-27 11:34:35');
INSERT INTO `outdoor_ledgercr` VALUES ('44', 'ADWS/OUT-SCH/18-19/0035', '2018-10-30', null, '46', '3', null, 'EmpPaymentDue', '2000', '+', null, null, '2018-09-29 12:49:31', '2018-09-29 12:49:31');
INSERT INTO `outdoor_ledgercr` VALUES ('45', 'ADWS/OUT-SCH/18-19/0036', '2018-10-01', null, '47', '3', null, 'EmpPaymentDue', '900', '+', null, null, '2018-10-01 08:39:39', '2018-10-01 08:39:39');
INSERT INTO `outdoor_ledgercr` VALUES ('50', 'ADWS/OUT-SCH/18-19/0037', '2018-10-03', null, '48', '78', null, 'EmpPaymentDue', '550', '+', null, null, '2018-10-03 07:45:16', '2018-10-03 07:45:16');
INSERT INTO `outdoor_ledgercr` VALUES ('51', 'ADWS/OUT-SCH/18-19/0037', '2018-10-03', null, '48', '9', null, 'EmpPaymentDue', '650', '+', null, null, '2018-10-03 07:45:16', '2018-10-03 07:45:16');
INSERT INTO `outdoor_ledgercr` VALUES ('53', 'ADWS/OUT-SCH/18-19/0038', '2018-10-03', null, '49', '81', null, 'EmpPaymentDue', '1400', '+', null, null, '2018-10-03 13:55:51', '2018-10-03 13:55:51');
INSERT INTO `outdoor_ledgercr` VALUES ('55', 'ADWS/OUT-SCH/18-19/0039', '2018-10-04', null, '50', '79', null, 'EmpPaymentDue', '1350', '+', null, null, '2018-10-04 07:56:47', '2018-10-04 07:56:47');
INSERT INTO `outdoor_ledgercr` VALUES ('56', 'ADWS/OUT-SCH/18-19/0039', '2018-10-04', null, '50', '80', null, 'EmpPaymentDue', '550', '+', null, null, '2018-10-04 07:56:47', '2018-10-04 07:56:47');
INSERT INTO `outdoor_ledgercr` VALUES ('59', 'ADWS/OUT-SCH/18-19/0042', '2018-10-04', null, '53', '2', null, 'EmpPaymentDue', '800', '+', null, null, '2018-10-04 11:41:09', '2018-10-04 11:41:09');
INSERT INTO `outdoor_ledgercr` VALUES ('60', 'ADWS/OUT-SCH/18-19/0034', '2018-09-27', null, '45', '2', null, 'EmpPaymentDue', '1050', '+', null, null, '2018-10-05 10:31:58', '2018-10-05 10:31:58');
INSERT INTO `outdoor_ledgercr` VALUES ('61', 'ADWS/OUT-SCH/18-19/0042', '2018-10-04', null, '53', '5', null, 'EmpPaymentDue', '400', '+', null, null, '2018-10-05 11:41:52', '2018-10-05 11:41:52');
INSERT INTO `outdoor_ledgercr` VALUES ('70', 'ADWS/OUT-SCH/18-19/0043', '2018-10-04', null, '54', '101', null, 'EmpPaymentDue', '2000', '+', null, null, '2018-10-23 12:42:11', '2018-10-23 12:42:11');
INSERT INTO `outdoor_ledgercr` VALUES ('71', 'ADW/OUT-EMP-PAY/18-19/0030', null, '2018-10-25', '53', '2', '14', 'Payment', '350', '-', null, null, '2018-10-25 12:56:28', '2018-10-25 12:56:28');
INSERT INTO `outdoor_ledgercr` VALUES ('72', 'ADW/OUT-EMP-PAY/18-19/0031', null, '2018-10-25', '45', '2', '15', 'Payment', '550', '-', null, null, '2018-10-25 12:58:27', '2018-10-25 13:19:43');
INSERT INTO `outdoor_ledgercr` VALUES ('74', 'ADW/OUT-EMP-PAY/18-19/0033', null, '2018-10-25', '46', '3', '17', 'Payment', '1000', '-', null, null, '2018-10-25 13:20:19', '2018-10-25 13:20:19');
INSERT INTO `outdoor_ledgercr` VALUES ('78', 'ADWS/OUT-SCH/18-19/0050', '2018-10-27', null, '63', '4', null, 'EmpPaymentDue', '250', '+', null, null, '2018-10-27 08:38:21', '2018-10-27 08:38:21');
INSERT INTO `outdoor_ledgercr` VALUES ('79', 'ADWS/OUT-SCH/18-19/0050', '2018-10-27', null, '63', '106', null, 'EmpPaymentDue', '1000', '+', null, null, '2018-10-27 08:38:21', '2018-10-30 11:55:41');
INSERT INTO `outdoor_ledgercr` VALUES ('81', 'ADW/OUT-EMP-PAY/18-19/0036', null, '2018-10-30', '46', '3', '20', 'Payment', '550', '-', null, null, '2018-10-30 11:07:49', '2018-10-30 11:07:49');
INSERT INTO `outdoor_ledgercr` VALUES ('82', 'ADW/OUT-EMP-PAY/18-19/0037', null, '2018-10-26', '47', '3', '21', 'Payment', '350', '-', null, null, '2018-10-30 11:11:10', '2018-10-30 11:20:45');
INSERT INTO `outdoor_ledgercr` VALUES ('83', 'ADW/OUT-EMP-PAY/18-19/0038', null, '2018-10-31', '50', '79', '22', 'Payment', '500', '-', null, null, '2018-10-31 08:36:20', '2018-10-31 08:36:20');
INSERT INTO `outdoor_ledgercr` VALUES ('85', 'ADW/OUT-EMP-PAY/18-19/0040', null, '2018-11-01', '53', '2', '24', 'Payment', '450', '-', null, null, '2018-11-01 11:59:50', '2018-11-01 11:59:50');
INSERT INTO `outdoor_ledgercr` VALUES ('86', 'ADW/OUT-EMP-PAY/18-19/0041', null, '2018-11-02', '45', '2', '25', 'Payment', '500', '-', null, null, '2018-11-02 08:38:52', '2018-11-02 08:38:52');
INSERT INTO `outdoor_ledgercr` VALUES ('87', 'ADWS/OUT-SCH/18-19/0051', '2019-02-18', null, '64', '1', null, 'EmpPaymentDue', '450', '+', null, null, '2019-02-18 12:23:06', '2019-02-18 12:23:06');
INSERT INTO `outdoor_ledgercr` VALUES ('88', 'ADWS/OUT-SCH/18-19/0051', '2019-02-18', null, '64', '4', null, 'EmpPaymentDue', '250', '+', null, null, '2019-02-18 12:23:06', '2019-02-18 12:23:06');

-- ----------------------------
-- Table structure for `outdoor_ledgerdr`
-- ----------------------------
DROP TABLE IF EXISTS `outdoor_ledgerdr`;
CREATE TABLE `outdoor_ledgerdr` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `unique_id` varchar(50) DEFAULT NULL,
  `schedule_date` date DEFAULT NULL,
  `receiving_date` date DEFAULT NULL,
  `outdoor_customer_id` int(11) unsigned NOT NULL,
  `type` varchar(30) DEFAULT NULL,
  `amount` int(12) DEFAULT NULL,
  `extra` varchar(5) DEFAULT NULL,
  `outdoor_receipt_id` int(11) unsigned DEFAULT NULL,
  `outdoor_shoot_id` int(10) unsigned DEFAULT NULL,
  `contra_id` varchar(10) DEFAULT NULL,
  `status` varchar(12) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_id` (`outdoor_customer_id`) USING BTREE,
  KEY `receipt_id` (`outdoor_receipt_id`),
  KEY `outdoor_sch_id` (`outdoor_shoot_id`),
  CONSTRAINT `outdoor_ledgerdr_ibfk_1` FOREIGN KEY (`outdoor_customer_id`) REFERENCES `outdoor_customer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `outdoor_ledgerdr_ibfk_2` FOREIGN KEY (`outdoor_shoot_id`) REFERENCES `outdoor_shoot` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `outdoor_ledgerdr_ibfk_3` FOREIGN KEY (`outdoor_receipt_id`) REFERENCES `outdoor_receipts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=182 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of outdoor_ledgerdr
-- ----------------------------
INSERT INTO `outdoor_ledgerdr` VALUES ('129', 'ADWS/OUT-SCH/18-19/0034', '2018-09-27', null, '15', 'ProjectCost', '14500', '+', null, '45', null, null, '2018-09-27 11:34:35', '2018-09-27 11:36:46');
INSERT INTO `outdoor_ledgerdr` VALUES ('131', 'ADWS/OUT-SCH/18-19/0035', '2018-10-30', null, '11', 'ProjectCost', '47500', '+', null, '46', null, null, '2018-09-29 07:45:25', '2018-09-29 07:45:25');
INSERT INTO `outdoor_ledgerdr` VALUES ('135', 'ADWS/OUT-SCH/18-19/0036', '2018-10-01', null, '15', 'ProjectCost', '8800', '+', null, '47', null, null, '2018-10-01 08:39:39', '2018-10-01 08:39:39');
INSERT INTO `outdoor_ledgerdr` VALUES ('148', 'ADWS/OUT-SCH/18-19/0037', '2018-10-03', null, '16', 'ProjectCost', '12000', '+', null, '48', null, null, '2018-10-03 07:45:16', '2018-10-03 07:45:16');
INSERT INTO `outdoor_ledgerdr` VALUES ('151', 'ADWS/OUT-SCH/18-19/0038', '2018-10-03', null, '18', 'ProjectCost', '23500', '+', null, '49', null, null, '2018-10-03 13:55:51', '2018-10-03 13:55:51');
INSERT INTO `outdoor_ledgerdr` VALUES ('153', 'ADW/OUT-CUS-REC/18-19/0070', null, '2018-10-04', '11', 'Receipt', '15000', '-', '20', '46', null, null, '2018-10-04 07:32:30', '2018-10-04 07:34:14');
INSERT INTO `outdoor_ledgerdr` VALUES ('155', 'ADW/OUT-CUS-REC/18-19/0072', null, '2018-10-04', '15', 'Receipt', '6000', '-', '22', '45', null, null, '2018-10-04 07:51:48', '2018-10-04 07:52:09');
INSERT INTO `outdoor_ledgerdr` VALUES ('156', 'ADW/OUT-CUS-REC/18-19/0073', null, '2018-10-04', '15', 'Receipt', '3500', '-', '23', '47', null, null, '2018-10-04 07:52:51', '2018-10-04 07:52:51');
INSERT INTO `outdoor_ledgerdr` VALUES ('157', 'ADW/OUT-CUS-REC/18-19/0074', null, '2018-10-04', '15', 'Receipt', '4500', '-', '24', '45', null, null, '2018-10-04 07:53:41', '2018-10-04 07:53:41');
INSERT INTO `outdoor_ledgerdr` VALUES ('158', 'ADWS/OUT-SCH/18-19/0039', '2018-10-04', null, '19', 'ProjectCost', '20000', '+', null, '50', null, null, '2018-10-04 07:56:47', '2018-10-04 07:56:47');
INSERT INTO `outdoor_ledgerdr` VALUES ('161', 'ADWS/OUT-SCH/18-19/0042', '2018-10-04', null, '16', 'ProjectCost', '7000', '+', null, '53', null, null, '2018-10-04 11:41:08', '2018-10-04 11:41:08');
INSERT INTO `outdoor_ledgerdr` VALUES ('162', 'ADWS/OUT-SCH/18-19/0043', '2018-10-04', null, '20', 'ProjectCost', '24400', '+', null, '54', null, null, '2018-10-04 14:11:41', '2018-10-05 13:28:13');
INSERT INTO `outdoor_ledgerdr` VALUES ('163', 'ADW/OUT-CUS-REC/18-19/0075', null, '2018-10-05', '16', 'Receipt', '5000', '-', '25', '53', null, null, '2018-10-05 12:29:16', '2018-10-05 12:29:16');
INSERT INTO `outdoor_ledgerdr` VALUES ('164', 'ADW/OUT-CUS-REC/18-19/0076', null, '2018-10-05', '16', 'Receipt', '5000', '-', '26', '48', null, null, '2018-10-05 12:30:17', '2018-10-05 12:30:17');
INSERT INTO `outdoor_ledgerdr` VALUES ('165', 'ADW/OUT-CUS-REC/18-19/0077', null, '2018-10-05', '16', 'Receipt', '4500', '-', '27', '48', null, null, '2018-10-05 12:31:29', '2018-10-05 12:31:29');
INSERT INTO `outdoor_ledgerdr` VALUES ('173', 'ADWS/OUT-SCH/18-19/0049', '2018-10-27', null, '27', 'ProjectCost', '9000', '+', null, '62', null, null, '2018-10-27 08:28:54', '2018-11-02 12:47:57');
INSERT INTO `outdoor_ledgerdr` VALUES ('174', 'ADWS/OUT-SCH/18-19/0050', '2018-10-27', null, '27', 'ProjectCost', '10000', '+', null, '63', null, null, '2018-10-27 08:32:04', '2018-10-27 08:32:04');
INSERT INTO `outdoor_ledgerdr` VALUES ('175', 'ADW/OUT-CUS-REC/18-19/0079', null, '2018-10-27', '27', 'Receipt', '5000', '-', '28', '63', null, null, '2018-10-27 08:45:47', '2018-10-27 09:24:24');
INSERT INTO `outdoor_ledgerdr` VALUES ('176', 'ADW/OUT-CUS-REC/18-19/0080', null, '2018-11-02', '27', 'Receipt', '5000', '-', '29', '63', null, null, '2018-11-02 08:04:16', '2018-11-02 08:04:16');
INSERT INTO `outdoor_ledgerdr` VALUES ('177', 'ADW/OUT-CUS-REC/18-19/0081', null, '2018-11-02', '27', 'Receipt', '3500', '-', '30', '62', null, null, '2018-11-02 08:14:26', '2018-11-02 08:14:26');
INSERT INTO `outdoor_ledgerdr` VALUES ('178', 'ADW/OUT-CUS-REC/18-19/0082', null, '2018-11-03', '16', 'Receipt', '2500', '-', '31', '48', null, null, '2018-11-03 09:30:18', '2018-11-03 09:30:18');
INSERT INTO `outdoor_ledgerdr` VALUES ('179', 'ADW/OUT-CUS-REC/18-19/0083', null, '2018-11-03', '27', 'Receipt', '5500', '-', '32', '62', null, null, '2018-11-03 09:36:43', '2018-11-03 09:36:43');
INSERT INTO `outdoor_ledgerdr` VALUES ('180', 'ADW/OUT-CUS-REC/18-19/0084', null, '2019-02-18', '11', 'Receipt', '10000', '-', '33', '46', null, null, '2019-02-18 10:38:14', '2019-02-18 10:38:14');
INSERT INTO `outdoor_ledgerdr` VALUES ('181', 'ADWS/OUT-SCH/18-19/0051', '2019-02-18', null, '28', 'ProjectCost', '5000', '+', null, '64', null, null, '2019-02-18 12:23:05', '2019-02-18 12:23:05');

-- ----------------------------
-- Table structure for `outdoor_payments`
-- ----------------------------
DROP TABLE IF EXISTS `outdoor_payments`;
CREATE TABLE `outdoor_payments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `unique_id` varchar(50) DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `outdoor_shoot_id` int(10) unsigned DEFAULT NULL,
  `assign_employee_id` int(11) NOT NULL,
  `amount` int(12) DEFAULT NULL,
  `desc` blob,
  `payment_type` varchar(30) DEFAULT NULL,
  `cheque_no` varchar(50) DEFAULT NULL,
  `cheque_issue_date` varchar(20) DEFAULT NULL,
  `cheque_deposit_date` varchar(20) DEFAULT NULL,
  `bank_name` varchar(50) DEFAULT NULL,
  `fund_type` varchar(15) DEFAULT NULL,
  `fund_transaction_no` varchar(60) DEFAULT NULL,
  `fund_transfer_date` varchar(20) DEFAULT NULL,
  `total_outstanding` varchar(12) DEFAULT NULL,
  `paid_amount` varchar(12) DEFAULT NULL,
  `amount_in_words` varchar(255) DEFAULT NULL,
  `new_outstanding` varchar(12) DEFAULT NULL,
  `paid_as` varchar(255) DEFAULT NULL,
  `latest_payment` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_id` (`assign_employee_id`) USING BTREE,
  KEY `outdoor_sch_id` (`outdoor_shoot_id`),
  CONSTRAINT `outdoor_payments_ibfk_1` FOREIGN KEY (`assign_employee_id`) REFERENCES `outdoor_assign_emp` (`assign_emp_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `outdoor_payments_ibfk_2` FOREIGN KEY (`outdoor_shoot_id`) REFERENCES `outdoor_shoot` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of outdoor_payments
-- ----------------------------
INSERT INTO `outdoor_payments` VALUES ('14', 'ADW/OUT-EMP-PAY/18-19/0030', '2018-10-25', '53', '2', '350', 0x414456414E4345, 'cash', '', '', '', '', '', '', '', '800', '350', 'Three Hundred  and Fifty   Rupees  Only', '450', null, '0', '2018-10-25 12:56:28', '2018-11-01 11:59:49');
INSERT INTO `outdoor_payments` VALUES ('15', 'ADW/OUT-EMP-PAY/18-19/0031', '2018-10-25', '45', '2', '550', 0x414456414E4345, 'cheque', '102456', '25/10/2018', '', 'SBI', '', '', '', '1050', '550', 'Five Hundred  and Fifty   Rupees  Only', '500', null, '0', '2018-10-25 12:58:27', '2018-11-02 08:38:52');
INSERT INTO `outdoor_payments` VALUES ('17', 'ADW/OUT-EMP-PAY/18-19/0033', '2018-10-25', '46', '3', '1000', 0x414456414E4345, 'cash', '', '', '', '', '', '', '', '2000', '1000', 'One Thousand Rupees  Only', '1000', null, '0', '2018-10-25 13:20:19', '2018-10-30 11:07:48');
INSERT INTO `outdoor_payments` VALUES ('20', 'ADW/OUT-EMP-PAY/18-19/0036', '2018-10-30', '46', '3', '550', 0x31737420496E7374616C6C6D656E74, 'cash', '', '', '', '', '', '', '', '1000', '550', 'Five Hundred  and Fifty   Rupees  Only', '450', null, '1', '2018-10-30 11:07:48', '2018-10-30 11:07:48');
INSERT INTO `outdoor_payments` VALUES ('21', 'ADW/OUT-EMP-PAY/18-19/0037', '2018-10-26', '47', '3', '350', 0x414456414E4345, 'cash', '', '', '', '', '', '', '', '900', '350', 'Three Hundred  and Fifty   Rupees  Only', '550', null, '1', '2018-10-30 11:11:09', '2018-10-30 11:20:45');
INSERT INTO `outdoor_payments` VALUES ('22', 'ADW/OUT-EMP-PAY/18-19/0038', '2018-10-31', '50', '79', '500', 0x414456414E4345, 'cash', '', '', '', '', '', '', '', '1350', '500', 'Five Hundred Rupees  Only', '850', null, '1', '2018-10-31 08:36:20', '2018-10-31 08:36:20');
INSERT INTO `outdoor_payments` VALUES ('24', 'ADW/OUT-EMP-PAY/18-19/0040', '2018-11-01', '53', '2', '450', 0x46696E616C205061796D656E74, 'fund', '', '', '', 'Bandhan Bank', 'UPI', 'p1810291642220142018657', '01/11/2018', '450', '450', 'Four Hundred  and Fifty   Rupees  Only', '0', null, '1', '2018-11-01 11:59:49', '2018-11-01 11:59:49');
INSERT INTO `outdoor_payments` VALUES ('25', 'ADW/OUT-EMP-PAY/18-19/0041', '2018-11-02', '45', '2', '500', 0x46696E616C205061796D656E74, 'cash', '', '', '', '', '', '', '', '500', '500', 'Five Hundred Rupees  Only', '0', null, '1', '2018-11-02 08:38:52', '2018-11-02 08:38:52');

-- ----------------------------
-- Table structure for `outdoor_payment_bill_session`
-- ----------------------------
DROP TABLE IF EXISTS `outdoor_payment_bill_session`;
CREATE TABLE `outdoor_payment_bill_session` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `session` varchar(7) DEFAULT NULL,
  `startDate` date DEFAULT NULL,
  `closeDate` date DEFAULT NULL,
  `bill` int(11) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of outdoor_payment_bill_session
-- ----------------------------
INSERT INTO `outdoor_payment_bill_session` VALUES ('1', '16-17', '2016-04-01', '2017-03-31', '0', null, '2017-04-03 11:29:33');
INSERT INTO `outdoor_payment_bill_session` VALUES ('2', '17-18', '2017-04-01', '2018-03-31', '0', null, '2017-11-02 16:43:39');
INSERT INTO `outdoor_payment_bill_session` VALUES ('3', '18-19', '2018-04-01', '2019-03-31', '41', null, '2018-11-02 08:38:52');
INSERT INTO `outdoor_payment_bill_session` VALUES ('4', '19-20', '2019-04-01', '2020-03-31', '0', null, null);

-- ----------------------------
-- Table structure for `outdoor_receipts`
-- ----------------------------
DROP TABLE IF EXISTS `outdoor_receipts`;
CREATE TABLE `outdoor_receipts` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `unique_id` varchar(50) DEFAULT NULL,
  `receiving_date` date DEFAULT NULL,
  `outdoor_customer_id` int(11) unsigned NOT NULL,
  `outdoor_shoot_id` int(10) unsigned DEFAULT NULL,
  `amount` int(12) DEFAULT NULL,
  `desc` blob,
  `receipt_type` varchar(30) DEFAULT NULL,
  `cheque_no` varchar(50) DEFAULT NULL,
  `cheque_issue_date` varchar(20) DEFAULT NULL,
  `cheque_diposit_date` varchar(20) DEFAULT NULL,
  `bank_name` varchar(30) DEFAULT NULL,
  `fund_type` varchar(20) DEFAULT NULL,
  `fund_transaction_no` varchar(60) DEFAULT NULL,
  `fund_transfer_date` varchar(20) DEFAULT NULL,
  `total_outstanding` varchar(15) DEFAULT NULL,
  `paid_amount` varchar(15) DEFAULT NULL,
  `new_outstanding` varchar(15) DEFAULT NULL,
  `received_as` varchar(255) DEFAULT NULL COMMENT 'received_as field for maintain type of receive, like advance or installment',
  `latest_receipt` tinyint(4) DEFAULT NULL,
  `amount_in_words` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_id` (`outdoor_customer_id`) USING BTREE,
  KEY `outdoor_sch_id` (`outdoor_shoot_id`),
  CONSTRAINT `outdoor_receipts_ibfk_1` FOREIGN KEY (`outdoor_customer_id`) REFERENCES `outdoor_customer` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `outdoor_receipts_ibfk_2` FOREIGN KEY (`outdoor_shoot_id`) REFERENCES `outdoor_shoot` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of outdoor_receipts
-- ----------------------------
INSERT INTO `outdoor_receipts` VALUES ('20', 'ADW/OUT-CUS-REC/18-19/0070', '2018-10-04', '11', '46', '15000', 0x414456414E4345, 'cash', '', '', '', '', '', '', '', '47500', '15000', '32500', null, '0', 'Fifteen Thousands Rupees  Only', '2018-10-04 07:32:30', '2019-02-18 10:38:14');
INSERT INTO `outdoor_receipts` VALUES ('22', 'ADW/OUT-CUS-REC/18-19/0072', '2018-10-04', '15', '45', '6000', 0x414456414E4345, 'cash', '', '', '', '', '', '', '', '14500', '6000', '8500', null, '0', null, '2018-10-04 07:51:48', '2018-10-04 07:53:41');
INSERT INTO `outdoor_receipts` VALUES ('23', 'ADW/OUT-CUS-REC/18-19/0073', '2018-10-04', '15', '47', '3500', 0x414456414E4345, 'cash', '', '', '', '', '', '', '', '8800', '3500', '5300', null, '1', 'Three Thousand Five Hundred Rupees  Only', '2018-10-04 07:52:51', '2018-10-08 09:20:55');
INSERT INTO `outdoor_receipts` VALUES ('24', 'ADW/OUT-CUS-REC/18-19/0074', '2018-10-04', '15', '45', '4500', 0x31737420496E7374616C6C6D656E74, 'cash', '', '', '', '', '', '', '', '8500', '4500', '4000', null, '1', 'Four Thousand Five Hundred Rupees  Only', '2018-10-04 07:53:41', '2018-10-08 09:20:50');
INSERT INTO `outdoor_receipts` VALUES ('25', 'ADW/OUT-CUS-REC/18-19/0075', '2018-10-05', '16', '53', '5000', 0x414456414E4345, 'cash', '', '', '', '', '', '', '', '7000', '5000', '2000', null, '1', null, '2018-10-05 12:29:16', '2018-10-23 12:54:32');
INSERT INTO `outdoor_receipts` VALUES ('26', 'ADW/OUT-CUS-REC/18-19/0076', '2018-10-05', '16', '48', '5000', 0x414456414E4345, 'cash', '', '', '', '', '', '', '', '12000', '5000', '7000', null, '0', null, '2018-10-05 12:30:17', '2018-10-05 12:31:29');
INSERT INTO `outdoor_receipts` VALUES ('27', 'ADW/OUT-CUS-REC/18-19/0077', '2018-10-05', '16', '48', '4500', 0x31737420496E7374616C6C6D656E74, 'cash', '', '', '', '', '', '', '', '7000', '4500', '2500', null, '0', 'Four Thousand Five Hundred Rupees  Only', '2018-10-05 12:31:29', '2018-11-03 09:30:17');
INSERT INTO `outdoor_receipts` VALUES ('28', 'ADW/OUT-CUS-REC/18-19/0079', '2018-10-27', '27', '63', '5000', 0x416476616E6365, 'cheque', '23547', '27/10/2018', '27/10/2018', 'AXIS', '', '', '', '10000', '5000', '5000', null, '0', 'Five Thousand Rupees  Only', '2018-10-27 08:45:47', '2018-11-02 08:04:16');
INSERT INTO `outdoor_receipts` VALUES ('29', 'ADW/OUT-CUS-REC/18-19/0080', '2018-11-02', '27', '63', '5000', 0x46696E616C205061796D656E74, 'fund', '', '', '', 'Bandhan Bank', 'UPI', 'P1810291642220102574630', '02/11/2018', '5000', '5000', '0', null, '1', 'Five Thousand Rupees  Only', '2018-11-02 08:04:16', '2018-11-02 08:04:16');
INSERT INTO `outdoor_receipts` VALUES ('30', 'ADW/OUT-CUS-REC/18-19/0081', '2018-11-02', '27', '62', '3500', 0x414456414E4345, 'cash', '', '', '', '', '', '', '', '10000', '3500', '6500', null, '0', 'Three Thousand Five Hundred Rupees  Only', '2018-11-02 08:14:26', '2018-11-03 09:36:42');
INSERT INTO `outdoor_receipts` VALUES ('31', 'ADW/OUT-CUS-REC/18-19/0082', '2018-11-03', '16', '48', '2500', 0x46696E616C205061796D656E74, 'fund', '', '', '', 'HDFC Bank', 'UPI', 'P181029164222010257007', '03/11/2018', '2500', '2500', '0', null, '1', 'Two Thousand Five Hundred Rupees  Only', '2018-11-03 09:30:17', '2018-11-03 09:30:17');
INSERT INTO `outdoor_receipts` VALUES ('32', 'ADW/OUT-CUS-REC/18-19/0083', '2018-11-03', '27', '62', '5500', 0x46696E616C205061796D656E74, 'cash', '', '', '', '', '', '', '', '5500', '5500', '0', null, '1', 'Five Thousand Five Hundred Rupees  Only', '2018-11-03 09:36:43', '2018-11-03 09:36:43');
INSERT INTO `outdoor_receipts` VALUES ('33', 'ADW/OUT-CUS-REC/18-19/0084', '2019-02-18', '11', '46', '10000', 0x6173647364, 'cash', '', '', '', '', '', '', '', '', '10000', '-10000', null, '1', 'Ten Thousands Rupees  Only', '2019-02-18 10:38:14', '2019-02-18 10:38:14');

-- ----------------------------
-- Table structure for `outdoor_receipt_bill_session`
-- ----------------------------
DROP TABLE IF EXISTS `outdoor_receipt_bill_session`;
CREATE TABLE `outdoor_receipt_bill_session` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `session` varchar(7) DEFAULT NULL,
  `startDate` date DEFAULT NULL,
  `closeDate` date DEFAULT NULL,
  `bill` int(11) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of outdoor_receipt_bill_session
-- ----------------------------
INSERT INTO `outdoor_receipt_bill_session` VALUES ('1', '16-17', '2016-04-01', '2017-03-31', '0', null, '2017-04-03 11:29:33');
INSERT INTO `outdoor_receipt_bill_session` VALUES ('2', '17-18', '2017-04-01', '2018-03-31', '0', null, '2017-11-02 04:06:38');
INSERT INTO `outdoor_receipt_bill_session` VALUES ('3', '18-19', '2018-04-01', '2019-03-31', '84', null, '2019-02-18 10:38:14');
INSERT INTO `outdoor_receipt_bill_session` VALUES ('4', '19-20', '2019-04-01', '2020-03-31', '0', null, null);

-- ----------------------------
-- Table structure for `outdoor_shoot`
-- ----------------------------
DROP TABLE IF EXISTS `outdoor_shoot`;
CREATE TABLE `outdoor_shoot` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `outdoor_sch_id` varchar(50) DEFAULT NULL COMMENT 'sch means Schedule',
  `outdoor_cus_id` int(11) unsigned DEFAULT NULL COMMENT 'cus means customer',
  `booking_date` varchar(50) DEFAULT NULL,
  `sch_date` date DEFAULT NULL COMMENT 'sch means Schedule',
  `no_of_days` int(11) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `service_provided` varchar(500) DEFAULT NULL,
  `proj_amount` int(11) DEFAULT NULL,
  `discount_per` varchar(10) DEFAULT NULL,
  `discount` int(11) DEFAULT '0',
  `grand_total` bigint(20) DEFAULT NULL,
  `amount_received_status` varchar(255) DEFAULT 'pending' COMMENT 'amount_received_status have only two values ''pending'' and ''cleared''',
  `work_status` varchar(10) DEFAULT 'pending' COMMENT 'work_status have only two values ''pending'' and ''completed''',
  `amount_payable_to_emp` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `outdoor_cus_id` (`outdoor_cus_id`),
  CONSTRAINT `outdoor_shoot_ibfk_1` FOREIGN KEY (`outdoor_cus_id`) REFERENCES `outdoor_customer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of outdoor_shoot
-- ----------------------------
INSERT INTO `outdoor_shoot` VALUES ('45', 'ADWS/OUT-SCH/18-19/0034', '15', '2018-10-03', '2018-09-27', '2', 'Prewedding', 'Still Photo', '15000', '3.33', '500', '14500', null, 'pending', null, '2018-10-04 17:06:51', '2018-10-04 17:06:51');
INSERT INTO `outdoor_shoot` VALUES ('46', 'ADWS/OUT-SCH/18-19/0035', '11', '2018-10-03', '2018-10-30', '3', 'Wedding', 'Still Photo, Video, Dron', '50000', '5', '2500', '47500', null, 'pending', null, '2018-10-04 17:06:54', '2018-10-04 17:06:54');
INSERT INTO `outdoor_shoot` VALUES ('47', 'ADWS/OUT-SCH/18-19/0036', '15', '2018-10-03', '2018-10-01', '1', 'Birthday', 'Still photo', '10000', '12', '1200', '8800', 'pending', 'pending', null, '2018-10-04 17:08:29', '2018-10-04 17:08:29');
INSERT INTO `outdoor_shoot` VALUES ('48', 'ADWS/OUT-SCH/18-19/0037', '16', '2018-10-04', '2018-10-03', '2', 'Party', 'Photo', '12000', '0', '0', '12000', 'pending', 'pending', null, '2018-10-04 17:06:29', '2018-10-04 17:06:29');
INSERT INTO `outdoor_shoot` VALUES ('49', 'ADWS/OUT-SCH/18-19/0038', '18', '2018-10-04', '2018-10-03', '3', 'Wedding ANNIVERSARY', 'Still Photo, Video, dron', '25000', '6', '1500', '23500', 'pending', 'pending', null, '2018-10-04 17:06:33', '2018-10-04 17:06:33');
INSERT INTO `outdoor_shoot` VALUES ('50', 'ADWS/OUT-SCH/18-19/0039', '19', '2018-10-04', '2018-10-04', '3', 'Factory Opening', 'Still Photo', '20000', '0', '0', '20000', 'pending', 'pending', null, '2018-10-04 17:06:43', '2018-10-04 17:06:43');
INSERT INTO `outdoor_shoot` VALUES ('53', 'ADWS/OUT-SCH/18-19/0042', '16', '2018-10-04', '2018-10-04', '1', 'Aniversary', 'Still Photo', '7000', '0', '0', '7000', null, 'pending', null, '2018-10-04 17:16:31', '2018-10-04 11:46:31');
INSERT INTO `outdoor_shoot` VALUES ('54', 'ADWS/OUT-SCH/18-19/0043', '20', '2018-10-04', '2018-10-04', '2', 'Wedding', 'Video', '25000', '2', '600', '24400', null, 'pending', null, '2018-10-05 18:58:13', '2018-10-05 13:28:13');
INSERT INTO `outdoor_shoot` VALUES ('62', 'ADWS/OUT-SCH/18-19/0049', '27', '2018-10-27', '2018-10-27', '1', 'Birthday', 'Still Photo', '10000', '10', '1000', '9000', null, 'pending', null, '2018-11-02 18:17:57', '2018-11-02 12:47:57');
INSERT INTO `outdoor_shoot` VALUES ('63', 'ADWS/OUT-SCH/18-19/0050', '27', '2018-10-27', '2018-10-27', '1', 'MARRIAGE ', 'still camera', '10000', '0', '0', '10000', null, 'pending', null, '2018-10-27 14:03:23', '2018-10-27 08:33:23');
INSERT INTO `outdoor_shoot` VALUES ('64', 'ADWS/OUT-SCH/18-19/0051', '28', '2019-02-18', '2019-02-18', '2', 'nice ', '', '5000', '0', '0', '5000', 'pending', 'pending', null, '2019-02-18 12:23:05', '2019-02-18 12:23:05');

-- ----------------------------
-- Table structure for `output_tax`
-- ----------------------------
DROP TABLE IF EXISTS `output_tax`;
CREATE TABLE `output_tax` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `unique_id` varchar(50) DEFAULT NULL,
  `billing_date` date DEFAULT NULL,
  `customer_id` int(10) unsigned DEFAULT NULL,
  `type` varchar(30) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `sale_id` int(10) unsigned DEFAULT NULL,
  `product_id` int(10) unsigned DEFAULT NULL,
  `output_tax` double(10,2) DEFAULT NULL,
  `invoice_id` int(10) unsigned DEFAULT NULL,
  `status` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_id` (`customer_id`) USING BTREE,
  KEY `sale_id` (`sale_id`) USING BTREE,
  KEY `product_id` (`product_id`) USING BTREE,
  KEY `invoice_id` (`invoice_id`) USING BTREE,
  CONSTRAINT `output_tax_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `output_tax_ibfk_2` FOREIGN KEY (`sale_id`) REFERENCES `sales` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `output_tax_ibfk_3` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `output_tax_ibfk_4` FOREIGN KEY (`invoice_id`) REFERENCES `sale_invoice` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of output_tax
-- ----------------------------

-- ----------------------------
-- Table structure for `password_resets`
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`) USING BTREE,
  KEY `password_resets_token_index` (`token`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of password_resets
-- ----------------------------
INSERT INTO `password_resets` VALUES ('rahul12@gmail.com', '6fd029c1bc499a9a73630dfb14841d379d32c453856802f1008cb0f0a493a40d', '2017-01-06 20:22:02');
INSERT INTO `password_resets` VALUES ('admin@gmail.com', '158c8594db4e15a935fd9de39cb1bdc6f5f0eaa8767141dc7b851727e4fd6646', '2018-05-14 18:56:54');

-- ----------------------------
-- Table structure for `payments`
-- ----------------------------
DROP TABLE IF EXISTS `payments`;
CREATE TABLE `payments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `unique_id` varchar(50) DEFAULT NULL,
  `billing_date` date DEFAULT NULL,
  `supplier_id` int(10) unsigned NOT NULL,
  `amount` int(12) DEFAULT NULL,
  `desc` blob,
  `payment_type` varchar(30) DEFAULT NULL,
  `cheque_no` varchar(50) DEFAULT NULL,
  `cheque_issue_date` varchar(20) DEFAULT NULL,
  `cheque_diposit_date` varchar(20) DEFAULT NULL,
  `cheque_bank_name` varchar(10) DEFAULT NULL,
  `fund_type` varchar(15) DEFAULT NULL,
  `fund_transaction_no` varchar(60) DEFAULT NULL,
  `fund_transfer_date` varchar(20) DEFAULT NULL,
  `fund_bank_name` varchar(10) DEFAULT NULL,
  `total_outstanding` varchar(12) DEFAULT NULL,
  `paid_amount` varchar(12) DEFAULT NULL,
  `new_outstanding` varchar(12) DEFAULT NULL,
  `balance` int(12) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_id` (`supplier_id`) USING BTREE,
  CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`supplier_id`) REFERENCES `customers` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of payments
-- ----------------------------
INSERT INTO `payments` VALUES ('39', 'ADW/PAY/18-19/0039', '2018-07-17', '1', '1700', 0x666972737420696E7374616C6C6D656E74, 'cash', '', '', '', '', '', '', '', '', '5700', '1700', '4000', '0', '2018-07-17 07:58:16', '2018-07-17 08:11:19');
INSERT INTO `payments` VALUES ('40', 'ADW/PAY/18-19/0040', '2018-07-17', '1', '1500', 0x5061696432, 'cheque', '005123', '16/07/2018', '17/07/2018', 'SBI', '', '', '', '', '4000', '1500', '2500', '0', '2018-07-17 08:18:13', '2018-07-17 08:18:13');
INSERT INTO `payments` VALUES ('41', 'ADW/PAY/18-19/0041', '2018-07-17', '1', '2000', 0x746869726420696E7374616C6C6D656E74, 'fund', '', '', '', '', 'NEFT', '120011563', '17/07/2018', 'ICICI BANK', '2500', '2000', '500', '0', '2018-07-17 08:23:42', '2018-07-17 08:23:42');
INSERT INTO `payments` VALUES ('42', 'ADW/PAY/18-19/0042', '2018-07-17', '1', '500', 0x666972737420696E7374616C6C6D656E74, 'cash', '', '', '', '', '', '', '', '', '500', '500', '0', '0', '2018-07-17 08:24:08', '2018-07-17 08:24:08');
INSERT INTO `payments` VALUES ('43', 'ADW/PAY/18-19/0043', '2018-11-10', '27', '1000', 0x31737420496E7374616C6C6D656E74, 'cash', '', '', '', '', '', '', '', '', '1990', '1000', '990', '0', '2018-11-10 11:15:40', '2018-11-10 11:31:34');

-- ----------------------------
-- Table structure for `payment_bill_session`
-- ----------------------------
DROP TABLE IF EXISTS `payment_bill_session`;
CREATE TABLE `payment_bill_session` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `session` varchar(7) DEFAULT NULL,
  `startDate` date DEFAULT NULL,
  `closeDate` date DEFAULT NULL,
  `bill` int(11) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of payment_bill_session
-- ----------------------------
INSERT INTO `payment_bill_session` VALUES ('1', '16-17', '2016-04-01', '2017-03-31', '0', null, '2017-04-03 11:29:33');
INSERT INTO `payment_bill_session` VALUES ('2', '17-18', '2017-04-01', '2018-03-31', '0', null, '2017-11-02 16:43:39');
INSERT INTO `payment_bill_session` VALUES ('3', '18-19', '2018-04-01', '2019-03-31', '43', null, '2018-11-10 11:15:40');
INSERT INTO `payment_bill_session` VALUES ('4', '19-20', '2019-04-01', '2020-03-31', '0', null, null);

-- ----------------------------
-- Table structure for `product`
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_category_id` bigint(20) DEFAULT NULL,
  `brand_id` bigint(20) DEFAULT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `purchase_price` varchar(255) DEFAULT '0',
  `tax_rate` varchar(255) DEFAULT '0',
  `qty` varchar(255) DEFAULT '0',
  `measurement_unit` varchar(255) DEFAULT NULL,
  `selling_price` varchar(255) DEFAULT '0',
  `status` tinyint(4) DEFAULT '1',
  `open_date` date DEFAULT NULL,
  `close_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `product_category_id` (`product_category_id`),
  KEY `brand_id` (`brand_id`),
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`product_category_id`) REFERENCES `product_category` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `product_ibfk_2` FOREIGN KEY (`brand_id`) REFERENCES `brand` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=720 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('5', '70', '5', '70-02 ML 4*6 WF', '50', '18', '8', 'pcs.', '120', '1', '2017-04-03', '2018-10-03', '2018-09-08 15:15:34', '2018-09-08 09:45:34');
INSERT INTO `product` VALUES ('6', '70', '4', '70-01 ML 4*6 WF', '55', '0', '1', 'pcs.', '120', '1', '2017-04-03', null, '2018-06-06 12:24:01', '2018-06-06 12:24:01');
INSERT INTO `product` VALUES ('9', '70', '4', '70-02 JM 4*6 WF', '150', '0', '0', 'pcs.', '330', '1', '2017-04-03', null, '2018-06-06 12:24:01', '2018-06-06 12:24:01');
INSERT INTO `product` VALUES ('10', '70', '4', '70-01 JM 4*6 WF', '150', '0', '-1', 'pcs.', '330', '1', '2017-04-03', null, '2018-06-06 12:24:01', '2018-06-06 12:24:01');
INSERT INTO `product` VALUES ('17', '70', '5', '70-02 JM 5*7 WF', '170', '0', '0', 'pcs.', '375', '1', '2017-04-03', null, '2018-06-06 12:24:01', '2018-06-06 12:24:01');
INSERT INTO `product` VALUES ('18', '70', '5', '70-01 JM 5*7 WF', '170', '0', '1', 'pcs.', '375', '1', '2017-04-03', '2017-04-03', '2018-06-06 12:24:01', '2018-06-06 12:24:01');
INSERT INTO `product` VALUES ('124', '38', '12', '38-KML 12*18 WF ', '197', '0', '0', 'pcs.', '500', '1', '2017-04-03', null, '2018-06-06 12:24:01', '2018-06-06 12:24:01');
INSERT INTO `product` VALUES ('573', '70', '4', '70-02 M 4*6 WF', '70', '0', '6', 'pcs.', '170', '1', '2017-05-19', null, '2018-06-06 12:24:01', '2018-06-06 12:24:01');
INSERT INTO `product` VALUES ('574', '70', '5', '70-02 M 5*7 WF', '80', '0', '1', 'pcs.', '190', '1', '2017-05-19', null, '2018-06-06 12:24:01', '2018-06-06 12:24:01');
INSERT INTO `product` VALUES ('575', '70', '6', '70-02 M 6*6 WF', '80', '0', '3', 'pcs.', '190', '1', '2017-05-19', null, '2018-06-06 12:24:01', '2018-06-06 12:24:01');
INSERT INTO `product` VALUES ('576', '70', '6', '70-02 M 6*8 WF', '90', '0', '0', 'pcs.', '220', '1', '2017-05-19', null, '2018-06-06 12:24:01', '2018-06-06 12:24:01');
INSERT INTO `product` VALUES ('599', '70', '5', '70-01ML 5*7 WF ', '70', '0', '0', 'pcs.', '155', '1', '2017-06-08', null, '2018-06-06 12:24:01', '2018-06-06 12:24:01');
INSERT INTO `product` VALUES ('600', '70', '5', '70-02ML 5*7 WF ', '70', '0', '1', 'pcs.', '155', '1', '2017-06-08', null, '2018-06-06 12:24:01', '2018-06-06 12:24:01');
INSERT INTO `product` VALUES ('603', '70', '6', '70-01ML 6*8 WF ', '75', '0', '0', 'pcs.', '180', '1', '2017-06-08', null, '2018-06-06 12:24:01', '2018-06-06 12:24:01');
INSERT INTO `product` VALUES ('604', '70', '6', '70-02ML 6*8 WF ', '75', '0', '2', 'pcs.', '180', '1', '2017-06-08', null, '2018-06-06 12:24:01', '2018-06-06 12:24:01');
INSERT INTO `product` VALUES ('608', '70', '5', '70-01M 5*7 WF ', '80', '0', '-1', 'pcs.', '190', '1', '2017-06-08', null, '2018-06-06 12:24:01', '2018-06-06 12:24:01');
INSERT INTO `product` VALUES ('611', '70', '6', '70-01M 6*8 WF ', '90', '0', '0', 'pcs.', '220', '1', '2017-06-08', null, '2018-06-06 12:24:01', '2018-06-06 12:24:01');
INSERT INTO `product` VALUES ('613', '70', '5', '70-01JM 5*7 WF ', '170', '0', '0', 'pcs.', '375', '1', '2017-06-08', null, '2018-06-06 12:24:01', '2018-06-06 12:24:01');
INSERT INTO `product` VALUES ('681', '70', '6', '70-03M 6*8 WF ', '90', '0', '3', 'pcs.', '240', '1', '2017-10-10', null, '2018-06-06 12:24:01', '2018-06-06 12:24:01');
INSERT INTO `product` VALUES ('686', '70', '6', '70*02M 6*8 WF ', '80', '0', '0', 'pcs.', '220', '1', '2017-10-10', null, '2018-06-06 12:24:01', '2018-06-06 12:24:01');
INSERT INTO `product` VALUES ('700', '121', '6', '121FDBML 6*8 WF ', '75', '0', '0', 'pcs.', '165', '1', '2017-11-22', null, '2018-06-06 12:24:01', '2018-06-06 12:24:01');
INSERT INTO `product` VALUES ('701', '121', '6', '121FDBM 6*8 WF ', '90', '0', '1', 'pcs.', '200', '1', '2017-11-22', null, '2018-06-06 12:24:01', '2018-06-06 12:24:01');
INSERT INTO `product` VALUES ('702', '121', '5', '121FDBML 5*7 WF ', '70', '0', '-1', 'pcs.', '155', '1', '2017-11-22', null, '2018-06-06 12:24:01', '2018-06-06 12:24:01');
INSERT INTO `product` VALUES ('705', '70', '5', '70-03ML 5*7 WF ', '70', '0', '0', 'pcs.', '155', '1', '2017-11-22', null, '2018-06-06 12:24:01', '2018-06-06 12:24:01');
INSERT INTO `product` VALUES ('708', '70', '5', '70-03M 5*7 WF ', '75', '0', '-1', 'pcs.', '180', '1', '2017-11-22', null, '2018-06-06 12:24:01', '2018-06-06 12:24:01');
INSERT INTO `product` VALUES ('710', '121', '5', '121FDBM 5*7 WF ', '75', '0', '0', 'pcs.', '180', '1', '2017-11-22', null, '2018-06-06 12:24:01', '2018-06-06 12:24:01');
INSERT INTO `product` VALUES ('711', '259', '287', 'DUMMY-PRODUCT', '500', '18', '50', 'PCS', '1200', '1', '2018-06-07', '2019-06-06', '2018-06-05 18:33:36', '2018-06-05 13:03:36');
INSERT INTO `product` VALUES ('712', '259', '287', 'DUMMY-PRODUCT2', '100', '15', '10', 'PCS', '530', '1', '2018-06-05', '2019-06-04', '2018-06-05 11:15:00', '2018-06-05 11:15:00');
INSERT INTO `product` VALUES ('713', '259', '287', 'DUMMY-PRODUCT3', '55', '10', '10', 'psc', '100', '1', '2018-06-05', '2018-06-30', '2018-06-05 11:57:17', '2018-06-05 11:57:17');
INSERT INTO `product` VALUES ('719', '2', '7', 'Photo', '500', '18', '10', 'psc', '650', '1', '2018-06-22', '2018-06-30', '2018-06-22 07:27:19', '2018-06-22 07:27:19');

-- ----------------------------
-- Table structure for `products`
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_type_id` int(10) unsigned NOT NULL DEFAULT '0',
  `product_type_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `product_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `brand_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `brand_name_id` int(10) unsigned DEFAULT NULL,
  `selling_price` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `product_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `qnty` int(10) DEFAULT '0',
  `cost_price` double(10,2) unsigned DEFAULT NULL,
  `igst` double(4,2) unsigned DEFAULT NULL,
  `cgst` double(4,2) unsigned DEFAULT NULL,
  `sgst` double(4,2) unsigned DEFAULT NULL,
  `opening_stock` int(10) DEFAULT '0',
  `unit_type` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mrp` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `products_product_type_foreign` (`product_type_id`) USING BTREE,
  KEY `brand_name_id` (`brand_name_id`),
  CONSTRAINT `products_ibfk_1` FOREIGN KEY (`product_type_id`) REFERENCES `product_types` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `products_ibfk_2` FOREIGN KEY (`brand_name_id`) REFERENCES `brands` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=194 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO `products` VALUES ('21', '14', 'DESKTOP ACCESSORIES', 'MOTHERBOARD G-31', '2018-05-08 18:55:01', '2018-05-20 16:03:00', null, '27', '805.08', '8473', '13', null, '18.00', '9.00', '9.00', '0', null, '');
INSERT INTO `products` VALUES ('22', '14', 'DESKTOP ACCESSORIES', 'MOTHERBOARD G-41', '2018-05-09 18:11:17', '2018-05-14 09:13:03', null, '48', '3800', '8473', '1', null, '18.00', '9.00', '9.00', '0', null, '');
INSERT INTO `products` VALUES ('23', '14', 'DESKTOP ACCESSORIES', 'MOTHERBOARD H-61', '2018-05-09 18:11:49', '2018-05-20 16:18:28', null, '48', '3500', '8473', '4', null, '18.00', '9.00', '9.00', '0', null, '');
INSERT INTO `products` VALUES ('24', '14', 'DESKTOP ACCESSORIES', 'UPS 1000VA', '2018-05-10 02:15:36', '2018-05-14 08:07:59', null, '30', '3728.81', '', '8', null, '18.00', '9.00', '9.00', '0', null, '');
INSERT INTO `products` VALUES ('25', '14', 'DESKTOP ACCESSORIES', 'LAMINATION MACHINE', '2018-05-10 03:07:47', '2018-05-20 15:43:12', null, '49', '2966.10', '8439', '0', null, '18.00', '9.00', '9.00', '0', null, '');
INSERT INTO `products` VALUES ('26', '12', 'PRINTER', 'PRINTER EPSON L380', '2018-05-10 03:10:28', '2018-05-20 16:00:10', null, '39', '0.25', '8528', '0', null, '18.00', '9.00', '9.00', '0', null, '');
INSERT INTO `products` VALUES ('27', '15', 'NOTEBOOK ACCESSORIES', 'MONITOR SCREEN', '2018-05-10 03:11:47', '2018-05-10 03:11:47', null, '49', '', '8528', '0', null, '18.00', '9.00', '9.00', '0', null, '');
INSERT INTO `products` VALUES ('28', '14', 'DESKTOP ACCESSORIES', 'CABINET', '2018-05-10 03:12:26', '2018-05-20 16:18:28', null, '49', '1900', '8473', '13', null, '18.00', '9.00', '9.00', '0', null, '');
INSERT INTO `products` VALUES ('29', '14', 'DESKTOP ACCESSORIES', 'HARDDISK 500GB', '2018-05-10 03:13:11', '2018-05-20 15:43:12', null, '34', '3200', '8471', '5', null, '18.00', '9.00', '9.00', '0', null, '');
INSERT INTO `products` VALUES ('30', '14', 'DESKTOP ACCESSORIES', 'MONITOR 18.5\"', '2018-05-10 03:15:04', '2018-05-20 15:43:12', null, '50', '8000', '8528', '9', null, '18.00', '9.00', '9.00', '0', null, '');
INSERT INTO `products` VALUES ('31', '14', 'DESKTOP ACCESSORIES', 'RAM DDR3 - 4GB', '2018-05-10 03:15:54', '2018-05-20 16:18:28', null, '49', '2900', '8473', '8', null, '18.00', '9.00', '9.00', '0', null, '');
INSERT INTO `products` VALUES ('32', '14', 'DESKTOP ACCESSORIES', 'UPS BATTERY 7AH', '2018-05-10 03:16:43', '2018-05-14 15:20:41', null, '32', '720.33', '8523', '14', null, '18.00', '9.00', '9.00', '0', null, '');
INSERT INTO `products` VALUES ('33', '20', 'ANTIVIRUS', 'INTERNET SECURITY - 1USER', '2018-05-10 03:19:35', '2018-05-14 08:27:45', null, '51', '847.45', '8523', '12', null, '18.00', '9.00', '9.00', '0', null, '');
INSERT INTO `products` VALUES ('34', '20', 'ANTIVIRUS', 'INTERNET SECURITY - 3USER', '2018-05-10 03:21:11', '2018-05-13 01:29:50', null, '51', '', '8523', '5', null, '18.00', '9.00', '9.00', '0', null, '');
INSERT INTO `products` VALUES ('35', '20', 'ANTIVIRUS', 'INTERNET SECURITY - 5USER', '2018-05-10 03:21:48', '2018-05-10 03:21:48', null, '51', '', '8473', '0', null, '18.00', '9.00', '9.00', '0', null, '');
INSERT INTO `products` VALUES ('36', '20', 'ANTIVIRUS', 'TOTAL SECURITY - 1USER', '2018-05-10 03:22:34', '2018-05-10 03:22:34', null, '51', '', '8523', '0', null, '18.00', '9.00', '9.00', '0', null, '');
INSERT INTO `products` VALUES ('37', '20', 'ANTIVIRUS', 'TOTAL SECURITY - 3USER', '2018-05-10 03:23:05', '2018-05-10 03:23:05', null, '51', '', '8523', '0', null, '18.00', '9.00', '9.00', '0', null, '');
INSERT INTO `products` VALUES ('38', '20', 'ANTIVIRUS', 'TOTAL SECURITY - 5USER', '2018-05-10 03:23:34', '2018-05-13 01:29:50', null, '51', '', '8523', '3', null, '18.00', '9.00', '9.00', '0', null, '');
INSERT INTO `products` VALUES ('39', '20', 'ANTIVIRUS', 'QH PRO - 1USER', '2018-05-10 03:24:16', '2018-05-20 15:43:12', null, '51', '847.45', '8523', '9', null, '18.00', '9.00', '9.00', '0', null, '');
INSERT INTO `products` VALUES ('40', '20', 'ANTIVIRUS', 'QH PRO - 3USER', '2018-05-10 03:24:42', '2018-05-12 03:49:46', null, '51', '1204', '8523', '0', null, '18.00', '9.00', '9.00', '0', null, '');
INSERT INTO `products` VALUES ('41', '20', 'ANTIVIRUS', 'QH PRO - 5USER', '2018-05-10 03:25:10', '2018-05-10 03:25:10', null, '51', '', '8523', '0', null, '18.00', '9.00', '9.00', '0', null, '');
INSERT INTO `products` VALUES ('42', '14', 'DESKTOP ACCESSORIES', 'CPU FAN', '2018-05-11 02:03:18', '2018-05-20 16:18:28', null, '49', '', '8473', '22', null, '18.00', '9.00', '9.00', '0', null, '');
INSERT INTO `products` VALUES ('43', '14', 'DESKTOP ACCESSORIES', 'PROCESSOR DUAL CORE L', '2018-05-11 02:03:52', '2018-05-20 16:18:28', null, '49', '', '8473', '6', null, '18.00', '9.00', '9.00', '0', null, '');
INSERT INTO `products` VALUES ('44', '14', 'DESKTOP ACCESSORIES', 'CORE I3 PROCESSOR L', '2018-05-11 02:04:26', '2018-05-20 15:43:12', null, '49', '2000', '8473', '-2', null, '18.00', '9.00', '9.00', '0', null, '');
INSERT INTO `products` VALUES ('45', '14', 'DESKTOP ACCESSORIES', 'DUAL CORE PROCESSOR', '2018-05-11 02:05:07', '2018-05-13 02:03:27', null, '28', '', '8473', '1', null, '18.00', '9.00', '9.00', '0', null, '');
INSERT INTO `products` VALUES ('46', '14', 'DESKTOP ACCESSORIES', 'CORE I3 PROCESSOR', '2018-05-11 02:05:44', '2018-05-11 02:05:44', null, '28', '', '8473', '0', null, '18.00', '9.00', '9.00', '0', null, '');
INSERT INTO `products` VALUES ('47', '14', 'DESKTOP ACCESSORIES', 'HARDDISK 500GB LAPTOP', '2018-05-11 02:09:42', '2018-05-20 16:19:32', null, '49', '2711.86', '8471', '6', null, '18.00', '9.00', '9.00', '0', null, '');
INSERT INTO `products` VALUES ('48', '14', 'DESKTOP ACCESSORIES', 'HARDDISK 1TB LAPTOP', '2018-05-11 02:35:03', '2018-05-14 15:18:46', null, '49', '', '8471', '5', null, '18.00', '9.00', '9.00', '0', null, '');
INSERT INTO `products` VALUES ('49', '14', 'DESKTOP ACCESSORIES', 'HARDDISK 2TB LAPTOP', '2018-05-11 02:35:49', '2018-05-11 02:35:49', null, '49', '', '8473', '0', null, '18.00', '9.00', '9.00', '0', null, '');
INSERT INTO `products` VALUES ('50', '14', 'DESKTOP ACCESSORIES', 'HARDDISK 1TB DESKTOP', '2018-05-11 02:36:32', '2018-05-20 16:18:28', null, '49', '4500', '8473', '3', null, '18.00', '9.00', '9.00', '0', null, '');
INSERT INTO `products` VALUES ('51', '14', 'DESKTOP ACCESSORIES', 'HARDDISK 2TB DESKTOP', '2018-05-11 02:37:02', '2018-05-17 15:28:48', null, '49', '14000', '8473', '1', null, '18.00', '9.00', '9.00', '0', null, '');
INSERT INTO `products` VALUES ('52', '14', 'DESKTOP ACCESSORIES', 'HARDDISK CASING', '2018-05-11 02:38:26', '2018-05-13 02:03:27', null, '49', '', '8473', '10', null, '18.00', '9.00', '9.00', '0', null, '');
INSERT INTO `products` VALUES ('53', '14', 'DESKTOP ACCESSORIES', 'KEYBOARD', '2018-05-11 02:41:33', '2018-05-20 15:43:12', null, '52', '237.28', '8471', '34', null, '18.00', '9.00', '9.00', '0', null, '');
INSERT INTO `products` VALUES ('54', '14', 'DESKTOP ACCESSORIES', 'MOUSE USB', '2018-05-11 02:42:36', '2018-05-20 15:55:32', null, '49', '144.06', '8471', '25', null, '18.00', '9.00', '9.00', '0', null, '');
INSERT INTO `products` VALUES ('55', '14', 'DESKTOP ACCESSORIES', 'MOU PS2', '2018-05-11 02:47:14', '2018-05-11 02:47:14', null, '49', '', '8471', '0', null, '18.00', '9.00', '9.00', '0', null, '');
INSERT INTO `products` VALUES ('56', '14', 'DESKTOP ACCESSORIES', 'MOUSE WIRELESS', '2018-05-11 02:47:53', '2018-05-20 16:03:00', null, '49', '228.81', '8471', '9', null, '18.00', '9.00', '9.00', '0', null, '');
INSERT INTO `products` VALUES ('57', '14', 'DESKTOP ACCESSORIES', 'KEYBOARD WIRELESS', '2018-05-11 02:48:14', '2018-05-11 02:48:14', null, '49', '', '8471', '0', null, '18.00', '9.00', '9.00', '0', null, '');
INSERT INTO `products` VALUES ('58', '14', 'DESKTOP ACCESSORIES', 'WIRELESS COMBO KEYBOARD MOUSE', '2018-05-11 02:48:48', '2018-05-14 15:18:45', null, '49', '', '8471', '5', null, '18.00', '9.00', '9.00', '0', null, '');
INSERT INTO `products` VALUES ('59', '15', 'NOTEBOOK ACCESSORIES', 'LAPTOP POWER CABLE', '2018-05-11 03:12:44', '2018-05-13 02:03:27', null, '49', '', '8544', '5', null, '18.00', '9.00', '9.00', '0', null, '');
INSERT INTO `products` VALUES ('60', '14', 'DESKTOP ACCESSORIES', 'UPS 600VA', '2018-05-11 03:18:41', '2018-05-20 15:55:32', null, '49', '1440.67', '8504', '24', null, '18.00', '9.00', '9.00', '0', null, '');
INSERT INTO `products` VALUES ('61', '15', 'NOTEBOOK ACCESSORIES', 'LAPTOP BATTERY', '2018-05-11 03:20:20', '2018-05-14 11:52:07', null, '49', '', '85078000', '12', null, '28.00', '14.00', '14.00', '0', null, '');
INSERT INTO `products` VALUES ('62', '14', 'DESKTOP ACCESSORIES', 'DVD WRITER DESKTOP INTERNAL', '2018-05-11 03:21:09', '2018-05-20 16:18:28', null, '49', '1400', '84717020', '9', null, '18.00', '9.00', '9.00', '0', null, '');
INSERT INTO `products` VALUES ('63', '14', 'DESKTOP ACCESSORIES', 'DVD WRITER DESKTOP EXTERNAL', '2018-05-11 03:21:37', '2018-05-17 15:15:08', null, '49', '', '84717020', '7', null, '18.00', '9.00', '9.00', '0', null, '');
INSERT INTO `products` VALUES ('64', '15', 'NOTEBOOK ACCESSORIES', 'DVD WRITER LAPTOP INTERNAL', '2018-05-11 03:22:11', '2018-05-11 03:22:11', null, '49', '', '84717020', '0', null, '18.00', '9.00', '9.00', '0', null, '');
INSERT INTO `products` VALUES ('65', '21', 'CCTV', 'CCTV CAMERA', '2018-05-11 03:23:34', '2018-05-17 15:28:48', null, '49', '2500', '8525', '15', null, '18.00', '9.00', '9.00', '0', null, '');
INSERT INTO `products` VALUES ('66', '21', 'CCTV', 'CCTV BULLET CAMERA', '2018-05-11 03:24:11', '2018-05-17 15:28:48', null, '49', '3800', '8525', '9', null, '18.00', '9.00', '9.00', '0', null, '');
INSERT INTO `products` VALUES ('67', '21', 'CCTV', 'POWER CONNECTOR CCTV', '2018-05-11 03:24:46', '2018-05-17 15:28:48', null, '49', '110', '8544', '45', null, '18.00', '9.00', '9.00', '0', null, '');
INSERT INTO `products` VALUES ('68', '21', 'CCTV', 'BNC CONNECTOR', '2018-05-11 03:25:14', '2018-05-17 15:28:48', null, '49', '110', '8544', '45', null, '18.00', '9.00', '9.00', '0', null, '');
INSERT INTO `products` VALUES ('69', '21', 'CCTV', 'CCTV CABLE (3+1)', '2018-05-11 03:25:46', '2018-05-17 15:28:48', null, '49', '2900', '8544', '6', null, '18.00', '9.00', '9.00', '0', null, '');
INSERT INTO `products` VALUES ('70', '21', 'CCTV', 'DVR 16 CHANNEL', '2018-05-11 03:26:19', '2018-05-17 15:28:48', null, '49', '18000', '8521', '1', null, '18.00', '9.00', '9.00', '0', null, '');
INSERT INTO `products` VALUES ('71', '21', 'CCTV', 'DVR 4 CHANNEL', '2018-05-11 03:26:40', '2018-05-17 15:15:08', null, '49', '', '8521', '1', null, '18.00', '9.00', '9.00', '0', null, '');
INSERT INTO `products` VALUES ('72', '21', 'CCTV', 'DVR 8 CHANNEL', '2018-05-11 03:27:13', '2018-05-17 15:15:08', null, '49', '', '8521', '1', null, '18.00', '9.00', '9.00', '0', null, '');
INSERT INTO `products` VALUES ('73', '21', 'CCTV', 'DVR 32 CHANNEL', '2018-05-11 03:27:48', '2018-05-11 03:27:48', null, '49', '', '8521', '0', null, '18.00', '9.00', '9.00', '0', null, '');
INSERT INTO `products` VALUES ('74', '13', 'CARTRIDGE', '678 (B)', '2018-05-11 03:28:39', '2018-05-14 08:04:03', null, '22', '550.85', '', '7', null, '18.00', '9.00', '9.00', '0', null, '');
INSERT INTO `products` VALUES ('75', '13', 'CARTRIDGE', '704 (B)', '2018-05-11 03:28:56', '2018-05-13 03:29:40', null, '22', '', '', '4', null, '18.00', '9.00', '9.00', '0', null, '');
INSERT INTO `products` VALUES ('76', '13', 'CARTRIDGE', '704 (C)', '2018-05-11 03:29:18', '2018-05-13 03:29:40', null, '22', '', '', '4', null, '18.00', '9.00', '9.00', '0', null, '');
INSERT INTO `products` VALUES ('77', '13', 'CARTRIDGE', '703 (B)', '2018-05-11 03:29:37', '2018-05-13 03:29:40', null, '22', '', '', '3', null, '18.00', '9.00', '9.00', '0', null, '');
INSERT INTO `products` VALUES ('78', '13', 'CARTRIDGE', '703 (C)', '2018-05-11 03:30:00', '2018-05-13 03:29:40', null, '22', '', '', '2', null, '18.00', '9.00', '9.00', '0', null, '');
INSERT INTO `products` VALUES ('79', '14', 'DESKTOP ACCESSORIES', 'SPIKE', '2018-05-12 03:35:47', '2018-05-12 03:37:34', null, '49', '', '8536', '10', null, '18.00', '9.00', '9.00', '0', null, '');
INSERT INTO `products` VALUES ('83', '14', 'DESKTOP ACCESSORIES', 'RAM DDR3 - 2GB', '2018-05-13 01:12:49', '2018-05-20 15:53:54', null, '49', '1016.94', '8473', '14', null, '18.00', '9.00', '9.00', '0', null, '');
INSERT INTO `products` VALUES ('86', '14', 'DESKTOP ACCESSORIES', 'MONITOR 15.5\"', '2018-05-13 01:33:11', '2018-05-13 02:03:27', null, '50', '', '8528', '2', null, '18.00', '9.00', '9.00', '0', null, '');
INSERT INTO `products` VALUES ('87', '13', 'CARTRIDGE', '680 (B)', '2018-05-13 01:45:27', '2018-05-14 07:52:45', null, '22', '593.22', '', '2', null, '18.00', '9.00', '9.00', '0', null, '');
INSERT INTO `products` VALUES ('88', '13', 'CARTRIDGE', '680 (C)', '2018-05-13 01:45:42', '2018-05-14 07:10:17', null, '22', '550.84', '', '0', null, '18.00', '9.00', '9.00', '0', null, '');
INSERT INTO `products` VALUES ('89', '14', 'DESKTOP ACCESSORIES', 'HARDDISK 160GB DESKTOP', '2018-05-13 01:46:44', '2018-05-13 01:46:44', null, '49', '', '8471', '0', null, '18.00', '9.00', '9.00', '0', null, '');
INSERT INTO `products` VALUES ('90', '14', 'DESKTOP ACCESSORIES', 'HARDDISK 320GB DESKTOP', '2018-05-13 01:47:16', '2018-05-14 15:18:46', null, '49', '', '8473', '5', null, '18.00', '9.00', '9.00', '0', null, '');
INSERT INTO `products` VALUES ('91', '13', 'CARTRIDGE', 'EPSON 664 (B)', '2018-05-13 01:51:15', '2018-05-20 16:22:51', null, '39', '254.23', '', '11', null, '18.00', '9.00', '9.00', '0', null, '');
INSERT INTO `products` VALUES ('92', '13', 'CARTRIDGE', 'EPSON 664 (Y)', '2018-05-13 01:51:39', '2018-05-20 16:22:51', null, '39', '347.45', '', '3', null, '18.00', '9.00', '9.00', '0', null, '');
INSERT INTO `products` VALUES ('93', '13', 'CARTRIDGE', 'EPSON 664 (C)', '2018-05-13 01:52:10', '2018-05-20 16:22:51', null, '39', '347.45', '', '3', null, '18.00', '9.00', '9.00', '0', null, '');
INSERT INTO `products` VALUES ('94', '13', 'CARTRIDGE', 'EPSON 664 (M)', '2018-05-13 01:52:49', '2018-05-20 16:22:51', null, '39', '347.45', '', '3', null, '18.00', '9.00', '9.00', '0', null, '');
INSERT INTO `products` VALUES ('95', '14', 'DESKTOP ACCESSORIES', 'CRIMPING TOOLS', '2018-05-13 01:55:03', '2018-05-13 03:29:40', null, '49', '', '8207', '3', null, '18.00', '9.00', '9.00', '0', null, '');
INSERT INTO `products` VALUES ('96', '13', 'CARTRIDGE', '802 (B)', '2018-05-13 01:56:34', '2018-05-14 08:01:45', null, '22', '593.22', '', '0', null, '18.00', '9.00', '9.00', '0', null, '');
INSERT INTO `products` VALUES ('97', '13', 'CARTRIDGE', '802 (C)', '2018-05-13 01:57:03', '2018-05-13 01:57:03', null, '22', '', '', '0', null, '18.00', '9.00', '9.00', '0', null, '');
INSERT INTO `products` VALUES ('98', '13', 'CARTRIDGE', 'CANON NPG 59', '2018-05-13 02:01:19', '2018-05-13 02:19:31', null, '37', '', '', '1', null, '18.00', '9.00', '9.00', '0', null, '');
INSERT INTO `products` VALUES ('99', '13', 'CARTRIDGE', 'CANON NPG - 28', '2018-05-13 02:01:39', '2018-05-13 02:01:39', null, '37', '', '', '0', null, '18.00', '9.00', '9.00', '0', null, '');
INSERT INTO `products` VALUES ('100', '13', 'CARTRIDGE', '88 (A) PRODOT', '2018-05-13 02:20:54', '2018-05-13 02:26:57', null, '54', '', '', '20', null, '18.00', '9.00', '9.00', '0', null, '');
INSERT INTO `products` VALUES ('101', '13', 'CARTRIDGE', '12 (A) PRODOT', '2018-05-13 02:21:13', '2018-05-20 15:27:27', null, '54', '1200', '', '3', null, '18.00', '9.00', '9.00', '0', null, '');
INSERT INTO `products` VALUES ('102', '13', 'CARTRIDGE', '78 (A) PRODOT', '2018-05-13 02:21:32', '2018-05-13 02:31:42', null, '54', '', '', '5', null, '18.00', '9.00', '9.00', '0', null, '');
INSERT INTO `products` VALUES ('103', '13', 'CARTRIDGE', '16 (A) - PRODOT', '2018-05-13 02:21:52', '2018-05-13 02:26:57', null, '54', '', '', '2', null, '18.00', '9.00', '9.00', '0', null, '');
INSERT INTO `products` VALUES ('104', '14', 'DESKTOP ACCESSORIES', 'SMPS', '2018-05-13 02:22:41', '2018-05-13 02:26:57', null, '49', '', '', '20', null, '18.00', '9.00', '9.00', '0', null, '');
INSERT INTO `products` VALUES ('105', '13', 'CARTRIDGE', '88 (A) PRODOT UNIVERSAL', '2018-05-13 02:24:49', '2018-05-13 02:31:42', null, '54', '', '', '5', null, '18.00', '9.00', '9.00', '0', null, '');
INSERT INTO `products` VALUES ('106', '12', 'PRINTER', 'PRINTER LASER CANON LBP6030 W', '2018-05-13 02:33:01', '2018-05-20 15:36:56', null, '37', '0.25', '', '0', null, '18.00', '9.00', '9.00', '0', null, '');
INSERT INTO `products` VALUES ('107', '11', 'NOTEBOOK', 'NOTEBOOK LENEVO LN V110-15|ISK I5-4GB-1TB', '2018-05-13 02:35:18', '2018-05-13 02:58:33', null, '24', '', '', '1', null, '18.00', '9.00', '9.00', '0', null, '');
INSERT INTO `products` VALUES ('108', '13', 'CARTRIDGE', '88 (A) BLUESTREAK', '2018-05-13 02:36:19', '2018-05-13 02:49:14', null, '55', '', '', '10', null, '18.00', '9.00', '9.00', '0', null, '');
INSERT INTO `products` VALUES ('109', '13', 'CARTRIDGE', '12 (A) BLUESTREAK', '2018-05-13 02:36:46', '2018-05-13 02:49:14', null, '55', '', '', '5', null, '18.00', '9.00', '9.00', '0', null, '');
INSERT INTO `products` VALUES ('110', '14', 'DESKTOP ACCESSORIES', 'PENDRIVE 8GB SANDISK', '2018-05-13 02:38:48', '2018-05-13 02:38:48', null, '56', '', '', '0', null, '18.00', '9.00', '9.00', '0', null, '');
INSERT INTO `products` VALUES ('111', '14', 'DESKTOP ACCESSORIES', 'PENDRIVE 16GB SANDISK', '2018-05-13 02:39:09', '2018-05-18 14:39:10', null, '56', '779.66', '', '32', null, '18.00', '9.00', '9.00', '0', null, '');
INSERT INTO `products` VALUES ('112', '14', 'DESKTOP ACCESSORIES', 'PENDRIVE 32GB SANDISK', '2018-05-13 02:39:36', '2018-05-13 15:23:54', null, '56', '', '', '15', null, '18.00', '9.00', '9.00', '0', null, '');
INSERT INTO `products` VALUES ('113', '14', 'DESKTOP ACCESSORIES', 'PENDRIVE 16GB SONY', '2018-05-13 02:39:58', '2018-05-16 15:48:13', null, '57', '1200', '', '0', null, '18.00', '9.00', '9.00', '0', null, '');
INSERT INTO `products` VALUES ('114', '14', 'DESKTOP ACCESSORIES', 'PENDRIVE 32GB SONY', '2018-05-13 02:40:19', '2018-05-13 02:40:19', null, '57', '', '', '0', null, '18.00', '9.00', '9.00', '0', null, '');
INSERT INTO `products` VALUES ('115', '23', 'PHOTOCOPIER', 'XEROX MACHNE SHARP 6020', '2018-05-13 02:41:36', '2018-05-13 02:56:55', null, '58', '', '', '4', null, '18.00', '9.00', '9.00', '0', null, '');
INSERT INTO `products` VALUES ('116', '14', 'DESKTOP ACCESSORIES', 'HARDDISK 500GB EXTERNAL', '2018-05-13 03:04:42', '2018-05-13 03:04:42', null, '49', '', '', '0', null, '18.00', '9.00', '9.00', '0', null, '');
INSERT INTO `products` VALUES ('117', '14', 'DESKTOP ACCESSORIES', 'HARDDISK 1TB EXTERNAL', '2018-05-13 03:05:08', '2018-05-14 08:01:45', null, '49', '4067.80', '', '9', null, '18.00', '9.00', '9.00', '0', null, '');
INSERT INTO `products` VALUES ('118', '14', 'DESKTOP ACCESSORIES', 'HARDDISK 2TB EXTERNAL', '2018-05-13 03:05:28', '2018-05-13 03:05:28', null, '49', '', '', '0', null, '18.00', '9.00', '9.00', '0', null, '');
INSERT INTO `products` VALUES ('119', '24', 'SPEAKER', 'BLUETOOTH SPEAKER', '2018-05-13 03:06:25', '2018-05-20 15:33:13', null, '49', '3000', '', '0', null, '18.00', '9.00', '9.00', '0', null, '');
INSERT INTO `products` VALUES ('120', '15', 'NOTEBOOK ACCESSORIES', 'NOTEBOOK BAG', '2018-05-13 03:09:39', '2018-05-13 03:10:46', null, '49', '', '', '1', null, '18.00', '9.00', '9.00', '0', null, '');
INSERT INTO `products` VALUES ('121', '22', 'NETWORKING PRODUCTS', 'SWITCH 8-PORT D-LINK/PERFECT', '2018-05-13 03:17:00', '2018-05-20 15:53:54', null, '49', '847.45', '', '11', null, '18.00', '9.00', '9.00', '0', null, '');
INSERT INTO `products` VALUES ('122', '22', 'NETWORKING PRODUCTS', 'SWITCH 16-PORT D-LINK/PERFECT', '2018-05-13 03:17:26', '2018-05-13 14:59:55', null, '49', '', '', '2', null, '18.00', '9.00', '9.00', '0', null, '');
INSERT INTO `products` VALUES ('123', '22', 'NETWORKING PRODUCTS', 'SWITCH 32-PORT D-LINK/PERFECT', '2018-05-13 03:17:47', '2018-05-13 03:17:47', null, '49', '', '', '0', null, '18.00', '9.00', '9.00', '0', null, '');
INSERT INTO `products` VALUES ('124', '22', 'NETWORKING PRODUCTS', 'SWITCH 64-PORT D-LINK/PERFECT', '2018-05-13 03:18:12', '2018-05-13 03:18:12', null, '49', '', '', '0', null, '18.00', '9.00', '9.00', '0', null, '');
INSERT INTO `products` VALUES ('125', '22', 'NETWORKING PRODUCTS', 'CAT-6 CABLE', '2018-05-13 03:18:59', '2018-05-14 15:33:26', null, '49', '20.33', '', '-28', null, '18.00', '9.00', '9.00', '0', null, '');
INSERT INTO `products` VALUES ('126', '15', 'NOTEBOOK ACCESSORIES', 'LAPTOP CLEANER', '2018-05-13 03:19:32', '2018-05-14 15:18:46', null, '49', '', '', '23', null, '18.00', '9.00', '9.00', '0', null, '');
INSERT INTO `products` VALUES ('127', '22', 'NETWORKING PRODUCTS', 'CLOUD ROUTER N-150 D-LINK dir-600l', '2018-05-13 03:20:49', '2018-05-13 15:13:16', null, '49', '', '', '1', null, '18.00', '9.00', '9.00', '0', null, '');
INSERT INTO `products` VALUES ('128', '14', 'DESKTOP ACCESSORIES', 'GRAPHICS CARD 2GB GT-710', '2018-05-13 03:21:31', '2018-05-13 14:59:55', null, '49', '', '', '4', null, '18.00', '9.00', '9.00', '0', null, '');
INSERT INTO `products` VALUES ('129', '14', 'DESKTOP ACCESSORIES', 'RAM DDR2 - 2GB', '2018-05-12 15:30:45', '2018-05-14 07:58:31', null, '49', '932.20', '', '7', null, '18.00', '9.00', '9.00', '0', null, '');
INSERT INTO `products` VALUES ('130', '15', 'NOTEBOOK ACCESSORIES', 'laptop keyboard', '2018-05-12 15:31:09', '2018-05-20 16:24:12', null, '49', '1525.42', '', '10', null, '18.00', '9.00', '9.00', '0', null, '');
INSERT INTO `products` VALUES ('131', '15', 'NOTEBOOK ACCESSORIES', 'laptop display 15.6\"', '2018-05-12 15:31:57', '2018-05-14 11:52:07', null, '49', '3389.83', '', '5', null, '18.00', '9.00', '9.00', '0', null, '');
INSERT INTO `products` VALUES ('132', '14', 'DESKTOP ACCESSORIES', 'MOTHERBOARD h-81', '2018-05-12 15:33:06', '2018-05-13 14:59:55', null, '49', '', '', '4', null, '18.00', '9.00', '9.00', '0', null, '');
INSERT INTO `products` VALUES ('133', '14', 'DESKTOP ACCESSORIES', 'MOTHERBOARD H-55', '2018-05-12 15:33:36', '2018-05-13 15:10:40', null, '49', '', '', '2', null, '18.00', '9.00', '9.00', '0', null, '');
INSERT INTO `products` VALUES ('134', '15', 'NOTEBOOK ACCESSORIES', 'laptop adapter', '2018-05-12 15:34:01', '2018-05-14 11:57:08', null, '49', '', '', '30', null, '18.00', '9.00', '9.00', '0', null, '');
INSERT INTO `products` VALUES ('135', '14', 'DESKTOP ACCESSORIES', 'cmos battery', '2018-05-12 15:38:08', '2018-05-13 15:10:40', null, '49', '', '', '35', null, '18.00', '9.00', '9.00', '0', null, '');
INSERT INTO `products` VALUES ('136', '22', 'NETWORKING PRODUCTS', 'adsl modem wireless router dsl 2600u dlink', '2018-05-12 15:39:48', '2018-05-13 14:59:55', null, '49', '', '', '1', null, '18.00', '9.00', '9.00', '0', null, '');
INSERT INTO `products` VALUES ('137', '14', 'DESKTOP ACCESSORIES', 'mobile scanner scanny 6', '2018-05-12 15:40:23', '2018-05-13 15:10:40', null, '49', '', '', '2', null, '18.00', '9.00', '9.00', '0', null, '');
INSERT INTO `products` VALUES ('138', '22', 'NETWORKING PRODUCTS', 'mobile companion dir-505 d-link', '2018-05-12 15:40:57', '2018-05-13 14:59:55', null, '49', '', '', '1', null, '18.00', '9.00', '9.00', '0', null, '');
INSERT INTO `products` VALUES ('139', '14', 'DESKTOP ACCESSORIES', 'vga splitter', '2018-05-12 15:41:14', '2018-05-13 14:59:55', null, '49', '', '', '6', null, '18.00', '9.00', '9.00', '0', null, '');
INSERT INTO `products` VALUES ('140', '14', 'DESKTOP ACCESSORIES', 'usb to usb d-link', '2018-05-12 15:41:57', '2018-05-13 14:59:55', null, '49', '', '', '2', null, '18.00', '9.00', '9.00', '0', null, '');
INSERT INTO `products` VALUES ('141', '13', 'CARTRIDGE', 'ricoh 1230d toner', '2018-05-12 15:42:42', '2018-05-13 14:59:55', null, '49', '', '', '1', null, '18.00', '9.00', '9.00', '0', null, '');
INSERT INTO `products` VALUES ('142', '14', 'DESKTOP ACCESSORIES', 'usb to lan', '2018-05-12 15:42:57', '2018-05-14 08:04:03', null, '49', '169.49', '', '8', null, '18.00', '9.00', '9.00', '0', null, '');
INSERT INTO `products` VALUES ('143', '14', 'DESKTOP ACCESSORIES', 'usb hub', '2018-05-12 15:43:15', '2018-05-13 14:59:55', null, '49', '', '', '6', null, '18.00', '9.00', '9.00', '0', null, '');
INSERT INTO `products` VALUES ('144', '14', 'DESKTOP ACCESSORIES', 'vga cable 20mtr', '2018-05-12 15:43:48', '2018-05-13 14:59:55', null, '49', '', '', '1', null, '18.00', '9.00', '9.00', '0', null, '');
INSERT INTO `products` VALUES ('145', '14', 'DESKTOP ACCESSORIES', 'bga cable 2mtr', '2018-05-12 15:44:08', '2018-05-13 14:59:55', null, '49', '', '', '15', null, '18.00', '9.00', '9.00', '0', null, '');
INSERT INTO `products` VALUES ('146', '14', 'DESKTOP ACCESSORIES', 'printer usb cable', '2018-05-12 15:44:33', '2018-05-13 14:59:55', null, '49', '', '', '25', null, '18.00', '9.00', '9.00', '0', null, '');
INSERT INTO `products` VALUES ('147', '14', 'DESKTOP ACCESSORIES', 'printer usb cable 3mtr', '2018-05-12 15:45:06', '2018-05-13 14:59:55', null, '49', '', '', '12', null, '18.00', '9.00', '9.00', '0', null, '');
INSERT INTO `products` VALUES ('148', '14', 'DESKTOP ACCESSORIES', 'power cable', '2018-05-12 15:45:21', '2018-05-13 14:59:55', null, '49', '', '', '25', null, '18.00', '9.00', '9.00', '0', null, '');
INSERT INTO `products` VALUES ('149', '14', 'DESKTOP ACCESSORIES', 'hdmi cable', '2018-05-12 15:45:37', '2018-05-13 14:59:55', null, '49', '', '', '3', null, '18.00', '9.00', '9.00', '0', null, '');
INSERT INTO `products` VALUES ('150', '22', 'NETWORKING PRODUCTS', 'lan cable 2mtr', '2018-05-12 15:45:56', '2018-05-13 14:59:55', null, '49', '', '', '10', null, '18.00', '9.00', '9.00', '0', null, '');
INSERT INTO `products` VALUES ('151', '14', 'DESKTOP ACCESSORIES', 'heat sink paste', '2018-05-12 15:46:14', '2018-05-13 15:10:40', null, '49', '', '', '15', null, '18.00', '9.00', '9.00', '0', null, '');
INSERT INTO `products` VALUES ('152', '14', 'DESKTOP ACCESSORIES', 'RAM DDR4 - 4GB', '2018-05-13 15:06:15', '2018-05-13 15:10:40', null, '49', '', '', '3', null, '18.00', '9.00', '9.00', '0', null, '');
INSERT INTO `products` VALUES ('153', '9', 'DESKTOP - TOWER', 'acer destop cpu PDC 4GB, 1TB', '2018-05-13 15:20:19', '2018-05-20 15:08:27', null, '25', '21000', '', '2', null, '18.00', '9.00', '9.00', '0', null, '');
INSERT INTO `products` VALUES ('154', '12', 'PRINTER', 'canon printer aio G2010', '2018-05-13 15:27:24', '2018-05-15 14:40:36', null, '37', '14000', '', '0', null, '18.00', '9.00', '9.00', '0', 'pcs', '');
INSERT INTO `products` VALUES ('155', '14', 'DESKTOP ACCESSORIES', 'MONITOR 18.5\" acer', '2018-05-13 15:39:45', '2018-05-14 07:12:24', null, '25', '4661.01', '', '-1', null, '18.00', '9.00', '9.00', '0', null, '');
INSERT INTO `products` VALUES ('156', '12', 'PRINTER', 'printer aio 2767 hp', '2018-05-13 15:44:02', '2018-05-14 07:18:52', null, '22', '5338.98', '', '0', null, '18.00', '9.00', '9.00', '0', null, '');
INSERT INTO `products` VALUES ('157', '23', 'PHOTOCOPIER', 'canon photocopier ir 2040ir', '2018-05-13 15:45:11', '2018-05-14 07:24:14', null, '37', '33898.30', '', '0', null, '18.00', '9.00', '9.00', '0', null, '');
INSERT INTO `products` VALUES ('158', '9', 'DESKTOP - TOWER', 'UPS 600VA apc', '2018-05-13 15:59:04', '2018-05-14 08:06:48', null, '49', '2118.64', '', '2', null, '18.00', '9.00', '9.00', '0', null, '');
INSERT INTO `products` VALUES ('159', '25', 'service', 'SERVICING', '2018-05-14 07:14:02', '2018-05-20 16:24:12', null, '49', '254.23', '', '-4', null, '18.00', '9.00', '9.00', '0', 'pcs', '');
INSERT INTO `products` VALUES ('160', '19', 'ELECTRICAL', 'INVERTER MICRTEK 1500VA', '2018-05-14 07:21:48', '2018-05-14 07:24:14', null, '49', '', '', '2', null, '18.00', '9.00', '9.00', '0', null, '');
INSERT INTO `products` VALUES ('161', '22', 'NETWORKING PRODUCTS', 'CAT6 CABLE LOOSE', '2018-05-14 08:52:27', '2018-05-14 11:19:17', null, '49', '14.2', '', '120', null, '18.00', '9.00', '9.00', '0', 'pcs', '');
INSERT INTO `products` VALUES ('162', '22', 'NETWORKING PRODUCTS', 'rj45 connector', '2018-05-14 10:00:37', '2018-05-20 15:53:54', null, '49', '6.77', '', '159', null, '18.00', '9.00', '9.00', '0', 'pcs', '');
INSERT INTO `products` VALUES ('163', '14', 'DESKTOP ACCESSORIES', 'SOUND CARD  USB', '2018-05-14 12:03:53', '2018-05-14 15:18:46', null, '49', '', '8471', '20', null, '18.00', '9.00', '9.00', '0', 'pcs', '');
INSERT INTO `products` VALUES ('164', '15', 'NOTEBOOK ACCESSORIES', 'HARDDISK 320GB LAPTOP', '2018-05-14 12:10:40', '2018-05-14 15:18:46', null, '49', '', '8471', '3', null, '18.00', '9.00', '9.00', '0', 'pcs', '');
INSERT INTO `products` VALUES ('165', '15', 'NOTEBOOK ACCESSORIES', 'PLASTIC BOX', '2018-05-14 12:13:01', '2018-05-14 15:18:46', null, '49', '', '3923', '1', null, '18.00', '9.00', '9.00', '0', 'pcs', '');
INSERT INTO `products` VALUES ('166', '19', 'ELECTRICAL', 'Freeze lg 185ltr', '2018-05-15 14:13:53', '2018-05-16 12:55:23', null, '42', '', '', '1', null, '18.00', '9.00', '9.00', '0', null, '');
INSERT INTO `products` VALUES ('167', '19', 'ELECTRICAL', '32\" led tv lg', '2018-05-15 14:14:31', '2018-05-15 14:14:31', null, '42', '', '', '0', null, '18.00', '9.00', '9.00', '0', null, '');
INSERT INTO `products` VALUES ('168', '19', 'ELECTRICAL', '42\" led tv lg', '2018-05-15 14:15:01', '2018-05-15 14:15:01', null, '42', '', '', '0', null, '18.00', '9.00', '9.00', '0', null, '');
INSERT INTO `products` VALUES ('169', '19', 'ELECTRICAL', '52\" led tv lg', '2018-05-15 14:15:35', '2018-05-15 14:15:35', null, '42', '', '', '0', null, '18.00', '9.00', '9.00', '0', null, '');
INSERT INTO `products` VALUES ('170', '17', 'FURNITURE', 'executive table 6x4', '2018-05-15 14:17:45', '2018-05-20 15:08:27', null, '49', '36000', '', '0', null, '18.00', '9.00', '9.00', '0', null, '');
INSERT INTO `products` VALUES ('171', '17', 'FURNITURE', 'executive chair', '2018-05-15 14:19:42', '2018-05-20 15:08:27', null, '49', '12000', '', '0', null, '18.00', '9.00', '9.00', '0', null, '');
INSERT INTO `products` VALUES ('172', '17', 'FURNITURE', 'computer table', '2018-05-16 12:52:02', '2018-05-20 15:08:27', null, '49', '6000', '', '0', null, '18.00', '9.00', '9.00', '0', null, '');
INSERT INTO `products` VALUES ('173', '17', 'FURNITURE', 'computer chair', '2018-05-16 12:52:21', '2018-05-20 15:08:27', null, '49', '5000', '', '0', null, '18.00', '9.00', '9.00', '0', null, '');
INSERT INTO `products` VALUES ('174', '17', 'FURNITURE', 'sofaset executive', '2018-05-16 12:56:02', '2018-05-20 15:08:27', null, '49', '54000', '', '0', null, '18.00', '9.00', '9.00', '0', null, '');
INSERT INTO `products` VALUES ('175', '12', 'PRINTER', 'printer laser aio m1136', '2018-05-16 12:56:30', '2018-05-20 15:14:10', null, '22', '13000', '', '0', null, '18.00', '9.00', '9.00', '0', null, '');
INSERT INTO `products` VALUES ('176', '16', 'STATIONERY', 'plastic file folder', '2018-05-16 13:07:28', '2018-05-16 13:15:41', null, '49', '50', '', '0', null, '12.00', '6.00', '6.00', '0', null, '');
INSERT INTO `products` VALUES ('177', '16', 'STATIONERY', 'notepad', '2018-05-16 13:07:46', '2018-05-16 13:15:41', null, '49', '45', '', '-10', null, '12.00', '6.00', '6.00', '0', null, '');
INSERT INTO `products` VALUES ('178', '16', 'STATIONERY', 'pen good quality', '2018-05-16 13:08:22', '2018-05-16 13:15:41', null, '49', '65', '', '0', null, '12.00', '6.00', '6.00', '0', null, '');
INSERT INTO `products` VALUES ('179', '13', 'CARTRIDGE', '88 (A) HP', '2018-05-16 13:17:44', '2018-05-16 14:52:28', null, '22', '0.01', '', '0', null, '18.00', '9.00', '9.00', '0', null, '');
INSERT INTO `products` VALUES ('180', '13', 'CARTRIDGE', '1230D RICOH TONER', '2018-05-16 13:19:05', '2018-05-16 14:52:28', null, '49', '0.01', '', '0', null, '18.00', '9.00', '9.00', '0', null, '');
INSERT INTO `products` VALUES ('181', '13', 'CARTRIDGE', '2501S RICOH TONER', '2018-05-16 13:20:55', '2018-05-16 14:52:28', null, '49', '0.01', '', '0', null, '18.00', '9.00', '9.00', '0', null, '');
INSERT INTO `products` VALUES ('182', '22', 'NETWORKING PRODUCTS', 'RACK 4U D-LINK', '2018-05-17 12:55:58', '2018-05-17 13:01:47', null, '49', '', '', '2', null, '18.00', '9.00', '9.00', '0', null, '');
INSERT INTO `products` VALUES ('183', '14', 'DESKTOP ACCESSORIES', 'BLANK DVD SONY JEWEL CASE', '2018-05-17 14:13:51', '2018-05-20 15:47:22', null, '49', '35', '', '20', null, '18.00', '9.00', '9.00', '0', 'pcs', '');
INSERT INTO `products` VALUES ('184', '14', 'DESKTOP ACCESSORIES', 'DVD BLANK', '2018-05-17 14:14:28', '2018-05-17 14:20:16', null, '49', '', '', '200', null, '18.00', '9.00', '9.00', '0', 'pcs', '');
INSERT INTO `products` VALUES ('185', '21', 'CCTV', 'SMPS 16CH', '2018-05-17 14:26:54', '2018-05-17 15:28:48', null, '49', '3000', '', '0', null, '18.00', '9.00', '9.00', '0', 'pcs', '');
INSERT INTO `products` VALUES ('186', '21', 'CCTV', 'SMPS 8CH', '2018-05-17 14:27:35', '2018-05-17 15:15:08', null, '49', '', '', '1', null, '18.00', '9.00', '9.00', '0', 'pcs', '');
INSERT INTO `products` VALUES ('187', '21', 'CCTV', 'SMPS 4CH', '2018-05-17 14:27:54', '2018-05-17 15:15:08', null, '49', '', '', '1', null, '18.00', '9.00', '9.00', '0', 'pcs', '');
INSERT INTO `products` VALUES ('188', '14', 'DESKTOP ACCESSORIES', 'wi-fi card usb 600mbps', '2018-05-17 15:17:50', '2018-05-17 15:21:45', null, '49', '', '', '5', null, '18.00', '9.00', '9.00', '0', null, '');
INSERT INTO `products` VALUES ('189', '14', 'DESKTOP ACCESSORIES', 'wi-fi card usb 900mbps', '2018-05-17 15:18:27', '2018-05-17 15:21:45', null, '49', '', '', '5', null, '18.00', '9.00', '9.00', '0', null, '');
INSERT INTO `products` VALUES ('190', '14', 'DESKTOP ACCESSORIES', 'MOTHERBOARD h-110', '2018-05-17 15:19:19', '2018-05-17 15:21:45', null, '49', '', '8473', '1', null, '18.00', '9.00', '9.00', '0', null, '');
INSERT INTO `products` VALUES ('191', '14', 'DESKTOP ACCESSORIES', 'ups battery 26ah', '2018-05-18 13:37:16', '2018-05-18 14:37:16', null, '49', '3500', '', '0', null, '18.00', '9.00', '9.00', '0', 'pcs', '');
INSERT INTO `products` VALUES ('192', '26', 'SOFTWARE', 'TURBO C++', '2018-05-18 14:31:49', '2018-05-19 15:21:54', null, '49', '200', '', '0', null, '18.00', '9.00', '9.00', '0', 'pcs', '');
INSERT INTO `products` VALUES ('193', '17', 'FURNITURE', 'BRIEFCASE', '2018-05-18 14:33:59', '2018-05-18 14:36:21', null, '49', '8000', '', '0', null, '18.00', '9.00', '9.00', '0', null, '');

-- ----------------------------
-- Table structure for `product_category`
-- ----------------------------
DROP TABLE IF EXISTS `product_category`;
CREATE TABLE `product_category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_category` varchar(255) DEFAULT NULL,
  `status` tinyint(3) unsigned DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `Product_Category` (`product_category`)
) ENGINE=InnoDB AUTO_INCREMENT=260 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of product_category
-- ----------------------------
INSERT INTO `product_category` VALUES ('1', 'WH08ML', '1', '2018-06-05 13:33:14', '2018-06-05 13:33:14');
INSERT INTO `product_category` VALUES ('2', 'BRG90ML', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('3', 'BLBR58ML', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('4', 'RG54ML', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('5', '70-02ML', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('6', '70-01ML', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('7', '318-01ML', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('8', '393-02ML', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('9', '70-02JM', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('10', '70-01JM', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('11', 'GPET06ML', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('12', 'BLS632ML', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('13', 'RB58ML', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('14', 'WBR58ML', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('15', 'Y011ML', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('16', 'BR011ML', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('17', 'P342GML', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('18', 'P342BML', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('19', 'P342YML', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('20', 'RBT57ML', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('21', 'BLBR011ML', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('22', 'AJ116M', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('23', 'AB102M', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('24', 'NL810M', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('25', 'NL023M', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('26', '224-01M', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('27', 'CC002M', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('28', 'CCB801M', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('29', 'GBR801M', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('30', 'BL081M', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('31', 'BR023M', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('32', 'GT020M', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('33', 'CCB002M', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('34', 'BR180M', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('35', 'BRG801M', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('36', '498-18ML', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('37', '498-19ML', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('38', 'NL810ML', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('39', '516ML', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('40', 'GBR801ML', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('41', '685ML', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('42', 'BL011ML', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('43', 'BLS58ML', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('44', 'BRG632ML', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('45', '420ML', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('46', 'BR109ML', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('47', 'G541ML', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('48', 'S541ML', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('49', 'BR541ML', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('50', 'GLT310ML', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('51', 'BC09ML', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('52', 'BRG09ML', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('53', 'BL58ML', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('54', '687ML', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('55', 'BRGBELAML', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('56', 'AB102ML', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('57', 'BR58ML', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('58', 'BRC58M', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('59', 'RLC58ML', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('60', '754ML', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('61', 'NL59ML', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('62', 'P319ML', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('63', 'SB156ML', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('64', 'RG85ML', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('65', 'J30ML', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('66', 'GRED088ML', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('67', 'OXBLACKML', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('68', 'SA345-01M', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('69', '072-02M', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('70', '072-01M', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('71', '076-01M', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('72', '224-07M', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('73', '224-02M', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('74', '035-01M', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('75', 'AE-105M', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('76', 'AF-106M', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('77', '139-01M', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('78', '498-01M', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('79', 'G580M', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('80', '224-01ML', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('81', '224-02ML', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('82', 'B350M', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('83', 'BR225M', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('84', '121FDBML', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('85', '38-CML', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('86', '632CML', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('87', '623BML', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('88', 'B195ML', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('89', '212ML', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('90', '906ML', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('91', '218BLACKML', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('92', 'H3ML', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('93', '38CML', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('94', '218BROWNML', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('95', '319ML', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('96', 'BAMB00ML', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('97', '38KML', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('98', 'P329ML', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('99', 'BL320ML', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('100', 'AE-105ML', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('101', 'BR14ML', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('102', 'NL1218ML', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('103', 'DORI18ML', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('104', 'BR1218ML', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('105', 'GOLD1218ML', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('106', 'BR1218-01ML', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('107', '342ML', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('108', 'DORIML', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('109', 'PC', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('110', '4*6', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('111', '5*7', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('112', '6*8', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('113', '6*9', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('114', '8*10', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('115', '8*11', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('116', '8*12', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('117', '10*12', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('118', '12*15', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('119', '12*16', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('120', '12*17', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('121', '12*18', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('122', '12*24', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('123', '12*30', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('124', '12*36', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('125', '16*20', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('126', '20*24', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('127', '20*30', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('128', 'A4', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('129', '13*20', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('130', 'INST', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('131', 'PAPER', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('132', 'CD/DVD', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('133', 'FILE TRANSFER', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('134', 'SCAN', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('135', 'ISH8', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('136', 'DIGITAL PRINT', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('137', 'DIG PHOTO ALBUM', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('138', 'SUB', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('139', '16*6', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('140', 'BS-122M', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('141', 'BS-123M', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('142', 'NELPM', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('143', 'VIDEOGRAPHY', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('144', 'PHOTOGRAPHY', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('145', 'ANNAPRASHON ENVELOPE', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('146', 'FLEX', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('147', 'COMPUTER', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('148', 'SUB ', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('149', 'BIJOY ', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('150', 'T-SHIRT', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('151', '24*34 LAMINATION', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('152', 'BELA', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('153', '24*36', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('154', 'BLS-122M', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('155', 'BLS-123M', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('156', 'NEL810M', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('157', '16*24', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('158', 'PASSPORT', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('159', 'DIGITAL ', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('160', 'A3 FRAME', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('161', 'PHOTO FRAME', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('162', 'FAKE', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('163', 'BL58M', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('164', '30*45', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('165', 'INK', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('166', 'P/P', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('167', 'FRAME', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('168', 'RB53ML', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('169', '70-02M', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('170', '37-13M', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('171', '10*24', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('172', 'BRL58NL', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('173', 'ANTIVIRUS', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('174', 'LAMINATION', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('175', '318-01M', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('176', '70-01M', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('177', 'BLS58M', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('178', '393-02M', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('179', 'BLS58JM', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('180', 'G242ML', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('181', 'G242M', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('182', '030WHITEML', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('183', '030GOLDML', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('184', '030WHITEM', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('185', '030GOLDM', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('186', '12*12', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('187', 'DEVLOPE', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('188', 'PHOTO', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('189', 'E-MAIL', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('190', 'ENVELOPE', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('191', 'BR14M', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('192', '11*13', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('193', 'GLASS', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('194', 'NLBLS018M', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('195', 'NLGOLD018N', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('196', 'BLRED018M', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('197', 'BR121801M', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('198', 'DESIGN', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('199', 'GOLDTEX018M', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('200', 'GTEXM', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('201', 'FLGOLD023M', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('202', 'GTEXML', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('203', 'BLRED018ML', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('204', 'GOLDTEX018ML', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('205', 'VIDEO', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('206', 'GB09', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('207', 'NEL810', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('208', 'BRWOOD09', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('209', 'BLBE001', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('210', 'BLBR001', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('211', 'BRG90M', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('212', '70-04M', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('213', 'BG091M', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('214', 'BL091M', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('215', '70-03M', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('216', 'GBR910M', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('217', 'GBR09M', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('218', 'BRWOOD09M', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('219', 'GBR09ML', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('220', '70*02M', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('221', 'GBR910ML', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('222', '70-03ML', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('223', 'S9CH09ML', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('224', 'BG09 ML', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('225', 'AL132M', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('226', '121FDBM', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('227', 'BRWOOD09ML', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('228', 'S9CH09M', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('229', 'BRSNAKE09M', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('230', 'BRSNAKE09ML', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('231', 'BRPOINT081M', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('232', 'AL132ML', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('233', 'WD003ML', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('234', 'BRG026ML', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('235', 'BRG026M', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('236', 'WD003M', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('237', 'GLPOINT004M', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('238', 'BGT-550 ML', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('239', 'BGT-550 M', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('240', 'NL1218M', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('241', 'GLPOINT004ML', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('242', 'OXBLACKM', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('243', 'SNGOLDM', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('244', 'TXGOLDM', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('245', 'PYG034N', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('246', 'PEKARO DIGITAL ', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('247', 'BTRY', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('248', 'GLP57', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('249', 'GIRAFFE57', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('250', 'PATABR', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('251', 'PIC57', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('252', 'GLP57M', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('253', 'PIC57M', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('254', 'PIC57ML', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('255', 'GIRAFFE57ML', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('256', 'PATABRML', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('257', 'PATABRM', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('258', 'GLP57ML', '1', '2018-06-15 10:55:47', '2018-06-15 10:55:47');
INSERT INTO `product_category` VALUES ('259', 'DUMMY-CATEGORY', '1', null, null);

-- ----------------------------
-- Table structure for `product_types`
-- ----------------------------
DROP TABLE IF EXISTS `product_types`;
CREATE TABLE `product_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_name` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of product_types
-- ----------------------------
INSERT INTO `product_types` VALUES ('9', 'DESKTOP - TOWER', '2018-05-08 18:26:14', '2018-05-08 18:26:14');
INSERT INTO `product_types` VALUES ('10', 'DESKTOP - ALL IN ONE', '2018-05-08 18:26:41', '2018-05-08 18:26:41');
INSERT INTO `product_types` VALUES ('11', 'NOTEBOOK', '2018-05-08 18:27:10', '2018-05-08 18:27:10');
INSERT INTO `product_types` VALUES ('12', 'PRINTER', '2018-05-08 18:27:32', '2018-05-08 18:27:32');
INSERT INTO `product_types` VALUES ('13', 'CARTRIDGE', '2018-05-08 18:27:46', '2018-05-08 18:27:46');
INSERT INTO `product_types` VALUES ('14', 'DESKTOP ACCESSORIES', '2018-05-08 18:28:17', '2018-05-08 18:28:17');
INSERT INTO `product_types` VALUES ('15', 'NOTEBOOK ACCESSORIES', '2018-05-08 18:28:39', '2018-05-08 18:28:39');
INSERT INTO `product_types` VALUES ('16', 'STATIONERY', '2018-05-08 18:28:56', '2018-05-08 18:28:56');
INSERT INTO `product_types` VALUES ('17', 'FURNITURE', '2018-05-08 18:29:05', '2018-05-08 18:29:05');
INSERT INTO `product_types` VALUES ('18', 'ELECTRONIC', '2018-05-08 18:29:31', '2018-05-08 18:29:31');
INSERT INTO `product_types` VALUES ('19', 'ELECTRICAL', '2018-05-08 18:29:54', '2018-05-08 18:29:54');
INSERT INTO `product_types` VALUES ('20', 'ANTIVIRUS', '2018-05-10 03:18:04', '2018-05-10 03:18:04');
INSERT INTO `product_types` VALUES ('21', 'CCTV', '2018-05-11 03:22:45', '2018-05-11 03:22:45');
INSERT INTO `product_types` VALUES ('22', 'NETWORKING PRODUCTS', '2018-05-13 02:02:36', '2018-05-13 02:02:36');
INSERT INTO `product_types` VALUES ('23', 'PHOTOCOPIER', '2018-05-13 02:40:40', '2018-05-13 02:40:40');
INSERT INTO `product_types` VALUES ('24', 'SPEAKER', '2018-05-13 03:06:02', '2018-05-13 03:06:02');
INSERT INTO `product_types` VALUES ('25', 'service', '2018-05-14 07:14:02', '2018-05-14 07:14:02');
INSERT INTO `product_types` VALUES ('26', 'SOFTWARE', '2018-05-18 14:31:49', '2018-05-18 14:31:49');

-- ----------------------------
-- Table structure for `purchases`
-- ----------------------------
DROP TABLE IF EXISTS `purchases`;
CREATE TABLE `purchases` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `supplier_id` bigint(20) unsigned DEFAULT NULL,
  `billing_date` date DEFAULT NULL COMMENT 'billing_date is same as entry_date',
  `invoice_no` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'invoice _no is same as billing_no',
  `party_invoice` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `party_invoice_date` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `amount` double(50,2) DEFAULT NULL,
  `discount_received` double(50,0) DEFAULT '0',
  `postage_charge` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `grand_total` double(10,2) DEFAULT NULL,
  `status` tinyint(4) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `supplier_id` (`supplier_id`),
  CONSTRAINT `purchases_ibfk_1` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of purchases
-- ----------------------------
INSERT INTO `purchases` VALUES ('73', '1', '2018-07-16', 'ADWS/PUR/0048/18-19', 'UKP/786/108', '16/07/2018', '6300.00', '630', '30', '5700.00', '1', '2018-07-16 12:55:41', '2018-07-16 12:58:16');
INSERT INTO `purchases` VALUES ('74', '27', '2018-11-10', 'ADWS/PUR/0049/18-19', '759656323', '10/11/2018', '770.00', '80', '', '690.00', '1', '2018-11-10 11:07:08', '2018-11-10 11:07:08');
INSERT INTO `purchases` VALUES ('75', '27', '2018-11-10', 'ADWS/PUR/18-19/0050', 'dfgdg5456741654', '10/11/2018', '1300.00', '0', '', '1300.00', '1', '2018-11-10 11:12:50', '2018-11-10 11:12:50');
INSERT INTO `purchases` VALUES ('76', '1', '2019-02-14', 'ADWS/PUR/18-19/0051', 'somthing', '14/02/2019', '3300.00', '165', '', '3135.00', '1', '2019-02-14 11:53:32', '2019-02-14 11:53:32');

-- ----------------------------
-- Table structure for `purchase_bill_session`
-- ----------------------------
DROP TABLE IF EXISTS `purchase_bill_session`;
CREATE TABLE `purchase_bill_session` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `session` varchar(7) DEFAULT NULL,
  `startDate` date DEFAULT NULL,
  `closeDate` date DEFAULT NULL,
  `bill` int(11) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of purchase_bill_session
-- ----------------------------
INSERT INTO `purchase_bill_session` VALUES ('1', '16-17', '2016-04-01', '2017-03-31', '0', null, '2017-04-02 01:52:01');
INSERT INTO `purchase_bill_session` VALUES ('2', '17-18', '2017-04-01', '2018-03-31', '0', null, '2017-11-10 22:09:10');
INSERT INTO `purchase_bill_session` VALUES ('3', '18-19', '2018-04-01', '2019-03-31', '51', null, '2019-02-14 11:53:32');
INSERT INTO `purchase_bill_session` VALUES ('4', '19-20', '2019-04-01', '2020-03-31', '0', null, null);

-- ----------------------------
-- Table structure for `purchase_invoice`
-- ----------------------------
DROP TABLE IF EXISTS `purchase_invoice`;
CREATE TABLE `purchase_invoice` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `purchase_id` int(10) unsigned DEFAULT NULL,
  `product_id` bigint(20) DEFAULT '0',
  `entry_date` date DEFAULT NULL,
  `desc` blob,
  `serial_no` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quantity` int(10) DEFAULT NULL,
  `rate` double(10,2) DEFAULT NULL,
  `amount` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `discount_per` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `discount_amt` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `total_amount` double(10,2) DEFAULT NULL,
  `status` varchar(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  `track_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sales_product_id_foreign` (`product_id`) USING BTREE,
  KEY `sale_id` (`purchase_id`) USING BTREE,
  CONSTRAINT `purchase_invoice_ibfk_1` FOREIGN KEY (`purchase_id`) REFERENCES `purchases` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `purchase_invoice_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of purchase_invoice
-- ----------------------------
INSERT INTO `purchase_invoice` VALUES ('5', '73', '9', '2018-07-16', '', null, '10', '330.00', '3300', '10', '330', '2970.00', null, '2018-07-16', '2018-07-16 12:55:42', '2018-07-16 12:55:42');
INSERT INTO `purchase_invoice` VALUES ('6', '73', '701', '2018-07-16', '', null, '15', '200.00', '3000', '10', '300', '2700.00', null, '2018-07-16', '2018-07-16 12:58:16', '2018-07-16 12:58:16');
INSERT INTO `purchase_invoice` VALUES ('7', '74', '5', '2018-11-10', '', null, '2', '120.00', '240', '', '50', '190.00', null, '2018-11-10', '2018-11-10 11:07:09', '2018-11-10 11:07:09');
INSERT INTO `purchase_invoice` VALUES ('8', '74', '712', '2018-11-10', '', null, '1', '530.00', '530', '', '30', '500.00', null, '2018-11-10', '2018-11-10 11:07:09', '2018-11-10 11:07:09');
INSERT INTO `purchase_invoice` VALUES ('9', '75', '719', '2018-11-10', '', null, '2', '650.00', '1300', '', '0', '1300.00', null, '2018-11-10', '2018-11-10 11:12:51', '2018-11-10 11:12:51');
INSERT INTO `purchase_invoice` VALUES ('10', '76', '9', '2019-02-14', 0x313030, null, '10', '330.00', '3300', '5', '165', '3135.00', null, '2019-02-14', '2019-02-14 11:53:32', '2019-02-14 11:53:32');

-- ----------------------------
-- Table structure for `purchase_returns`
-- ----------------------------
DROP TABLE IF EXISTS `purchase_returns`;
CREATE TABLE `purchase_returns` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `purchase_id` int(10) DEFAULT NULL,
  `against_purchase_no` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `invoice_no` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `billing_date` date DEFAULT NULL,
  `supplier_id` bigint(20) unsigned DEFAULT '0',
  `total_amount` double(10,2) DEFAULT NULL,
  `total_discount` double(10,2) DEFAULT NULL,
  `grand_total` double(10,2) DEFAULT NULL,
  `party_invoice` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `party_invoice_date` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `supplier_id` (`supplier_id`) USING BTREE,
  CONSTRAINT `purchase_returns_ibfk_1` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of purchase_returns
-- ----------------------------
INSERT INTO `purchase_returns` VALUES ('8', '73', 'ADWS/PUR/0048/18-19', 'ADWS/PR/18-19/0005', '2018-07-17', '1', '4650.00', '630.00', '4020.00', null, null, null, '2018-07-17 09:13:43', '2018-07-17 09:13:43');
INSERT INTO `purchase_returns` VALUES ('9', '73', 'ADWS/PUR/0048/18-19', 'ADWS/PR/18-19/0006', '2019-02-14', '1', '6300.00', '630.00', '5670.00', null, null, null, '2019-02-14 11:55:01', '2019-02-14 11:55:01');

-- ----------------------------
-- Table structure for `purchase_returns_invoice`
-- ----------------------------
DROP TABLE IF EXISTS `purchase_returns_invoice`;
CREATE TABLE `purchase_returns_invoice` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `purchase_id` int(10) unsigned DEFAULT NULL,
  `purchase_invoice_id` int(10) DEFAULT NULL,
  `purchase_return_id` int(10) unsigned DEFAULT NULL,
  `product_id` bigint(20) DEFAULT '0',
  `entry_date` date DEFAULT NULL,
  `desc` blob,
  `quantity` int(10) DEFAULT NULL,
  `rate` double(10,2) DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `discount_amt` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `total_amount` double(10,2) DEFAULT NULL,
  `status` varchar(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  `track_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sales_product_id_foreign` (`product_id`) USING BTREE,
  KEY `sale_id` (`purchase_id`) USING BTREE,
  KEY `purchase_return_id` (`purchase_return_id`) USING BTREE,
  CONSTRAINT `purchase_returns_invoice_ibfk_1` FOREIGN KEY (`purchase_id`) REFERENCES `purchases` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `purchase_returns_invoice_ibfk_3` FOREIGN KEY (`purchase_return_id`) REFERENCES `purchase_returns` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `purchase_returns_invoice_ibfk_4` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of purchase_returns_invoice
-- ----------------------------
INSERT INTO `purchase_returns_invoice` VALUES ('3', '73', '5', '8', '9', null, '', '5', '330.00', '1650', '330', '1320.00', null, '2018-07-17', '2018-07-17 09:13:43', '2018-07-17 09:13:43');
INSERT INTO `purchase_returns_invoice` VALUES ('4', '73', '6', '8', '701', null, '', '15', '200.00', '3000', '300', '2700.00', null, '2018-07-17', '2018-07-17 09:13:43', '2018-07-17 09:13:43');
INSERT INTO `purchase_returns_invoice` VALUES ('5', '73', '5', '9', '9', null, '', '10', '330.00', '3300', '330', '2970.00', null, '2019-02-14', '2019-02-14 11:55:01', '2019-02-14 11:55:01');
INSERT INTO `purchase_returns_invoice` VALUES ('6', '73', '6', '9', '701', null, '', '15', '200.00', '3000', '300', '2700.00', null, '2019-02-14', '2019-02-14 11:55:01', '2019-02-14 11:55:01');

-- ----------------------------
-- Table structure for `purchase_returns_invoice_temp`
-- ----------------------------
DROP TABLE IF EXISTS `purchase_returns_invoice_temp`;
CREATE TABLE `purchase_returns_invoice_temp` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `purchase_id` int(10) unsigned DEFAULT NULL,
  `purchase_invoice_id` int(10) DEFAULT NULL,
  `temp_id` int(10) unsigned DEFAULT NULL,
  `product_id` bigint(10) DEFAULT '0',
  `desc` blob,
  `quantity` int(10) DEFAULT NULL,
  `rate` double(10,2) DEFAULT NULL,
  `discount_amt` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `total_amount` double(10,2) DEFAULT NULL,
  `status` varchar(12) COLLATE utf8_unicode_ci DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sales_product_id_foreign` (`product_id`) USING BTREE,
  KEY `sale_id` (`purchase_id`) USING BTREE,
  KEY `temp_id` (`temp_id`) USING BTREE,
  CONSTRAINT `purchase_returns_invoice_temp_ibfk_1` FOREIGN KEY (`purchase_id`) REFERENCES `purchases` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `purchase_returns_invoice_temp_ibfk_3` FOREIGN KEY (`temp_id`) REFERENCES `purchase_returns_temp` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `purchase_returns_invoice_temp_ibfk_4` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of purchase_returns_invoice_temp
-- ----------------------------
INSERT INTO `purchase_returns_invoice_temp` VALUES ('5', '73', '5', '3', '9', '', '10', '330.00', '330', '2970.00', '1', '2019-02-14 11:54:57', '2019-02-14 11:54:57');
INSERT INTO `purchase_returns_invoice_temp` VALUES ('6', '73', '6', '3', '701', '', '15', '200.00', '300', '2700.00', '1', '2019-02-14 11:54:57', '2019-02-14 11:54:57');

-- ----------------------------
-- Table structure for `purchase_returns_temp`
-- ----------------------------
DROP TABLE IF EXISTS `purchase_returns_temp`;
CREATE TABLE `purchase_returns_temp` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `purchase_id` int(10) DEFAULT NULL,
  `invoice_no` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `billing_date` date DEFAULT NULL,
  `supplier_id` bigint(20) unsigned DEFAULT '0',
  `party_invoice` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `party_invoice_date` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `amount` double(10,2) DEFAULT NULL,
  `total_discount` double(10,2) DEFAULT NULL,
  `postage_charge` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `grand_total` double(10,2) DEFAULT NULL,
  `status` varchar(12) COLLATE utf8_unicode_ci DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `supplier_id` (`supplier_id`) USING BTREE,
  CONSTRAINT `purchase_returns_temp_ibfk_1` FOREIGN KEY (`supplier_id`) REFERENCES `purchases` (`supplier_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of purchase_returns_temp
-- ----------------------------
INSERT INTO `purchase_returns_temp` VALUES ('3', '73', 'ADWS/PUR/0048/18-19', '2018-07-16', '1', 'UKP/786/108', '16/07/2018', '6300.00', '630.00', '30', '5700.00', '1', '2019-02-14 11:54:57', '2019-02-14 11:54:57');

-- ----------------------------
-- Table structure for `purchase_return_bill_session`
-- ----------------------------
DROP TABLE IF EXISTS `purchase_return_bill_session`;
CREATE TABLE `purchase_return_bill_session` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `session` varchar(7) DEFAULT NULL,
  `startDate` date DEFAULT NULL,
  `closeDate` date DEFAULT NULL,
  `bill` int(11) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of purchase_return_bill_session
-- ----------------------------
INSERT INTO `purchase_return_bill_session` VALUES ('1', '16-17', '2016-04-01', '2017-03-31', '0', null, '2017-04-03 11:29:33');
INSERT INTO `purchase_return_bill_session` VALUES ('2', '17-18', '2017-04-01', '2018-03-31', '0', null, '2017-11-03 11:44:37');
INSERT INTO `purchase_return_bill_session` VALUES ('3', '18-19', '2018-04-01', '2019-03-31', '6', null, '2019-02-14 11:55:01');
INSERT INTO `purchase_return_bill_session` VALUES ('4', '19-20', '2019-04-01', '2020-03-31', '0', null, null);

-- ----------------------------
-- Table structure for `purchase_return_input_tax`
-- ----------------------------
DROP TABLE IF EXISTS `purchase_return_input_tax`;
CREATE TABLE `purchase_return_input_tax` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `unique_id` varchar(50) DEFAULT NULL,
  `billing_date` date DEFAULT NULL,
  `supplier_id` int(10) unsigned NOT NULL,
  `type` varchar(30) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `purchase_return_id` int(10) unsigned DEFAULT NULL,
  `product_id` int(10) unsigned DEFAULT NULL,
  `input_tax` double(10,2) DEFAULT NULL,
  `purchase_return_invoice_id` int(10) unsigned DEFAULT NULL,
  `status` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_id` (`supplier_id`) USING BTREE,
  KEY `product_id` (`product_id`) USING BTREE,
  KEY `sale_return_id` (`purchase_return_id`) USING BTREE,
  KEY `sale_return_invoice_id` (`purchase_return_invoice_id`) USING BTREE,
  CONSTRAINT `purchase_return_input_tax_ibfk_1` FOREIGN KEY (`supplier_id`) REFERENCES `customers` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `purchase_return_input_tax_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `purchase_return_input_tax_ibfk_3` FOREIGN KEY (`purchase_return_id`) REFERENCES `purchase_returns` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `purchase_return_input_tax_ibfk_4` FOREIGN KEY (`purchase_return_invoice_id`) REFERENCES `purchase_returns_invoice` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of purchase_return_input_tax
-- ----------------------------

-- ----------------------------
-- Table structure for `receipts`
-- ----------------------------
DROP TABLE IF EXISTS `receipts`;
CREATE TABLE `receipts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `unique_id` varchar(50) DEFAULT NULL,
  `billing_date` date DEFAULT NULL,
  `customer_id` bigint(20) unsigned NOT NULL,
  `amount` int(12) DEFAULT NULL,
  `desc` blob,
  `receipt_type` varchar(30) DEFAULT NULL,
  `cheque_no` varchar(50) DEFAULT NULL,
  `cheque_issue_date` varchar(20) DEFAULT NULL,
  `cheque_diposit_date` varchar(20) DEFAULT NULL,
  `bank_name` varchar(30) DEFAULT NULL,
  `fund_type` varchar(20) DEFAULT NULL,
  `fund_transaction_no` varchar(60) DEFAULT NULL,
  `fund_transfer_date` varchar(20) DEFAULT NULL,
  `fund_bank_name` varchar(30) DEFAULT NULL,
  `total_outstanding` varchar(15) DEFAULT NULL,
  `paid_amount` varchar(15) DEFAULT NULL,
  `new_outstanding` varchar(15) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_id` (`customer_id`) USING BTREE,
  CONSTRAINT `receipts_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of receipts
-- ----------------------------
INSERT INTO `receipts` VALUES ('8', 'ADW/REC/18-19/0016', '2018-07-16', '3', '200', 0x666972737420696E7374616C6C6D656E74, 'cheque', '111333', '16/07/2018', '16/07/2018', 'Bandhan bank', '', '', '', '', '1140', '200', '940', '2018-07-16 09:02:24', '2018-07-16 11:26:47');
INSERT INTO `receipts` VALUES ('9', 'ADW/REC/18-19/0017', '2018-07-16', '3', '400', 0x5061696432, 'cheque', '125414', '16/07/2018', '16/07/2018', 'SBI', '', '', '', '', '940', '400', '540', '2018-07-16 09:02:59', '2018-07-16 09:15:16');
INSERT INTO `receipts` VALUES ('10', 'ADW/REC/18-19/0018', '2018-07-16', '3', '540', 0x46696E616C20496E7374616C6C6D656E74, 'fund', '', '', '', '', 'RTGS', '718002372', '16/07/2018', 'AXIS BANK', '540', '540', '0', '2018-07-16 09:03:35', '2018-07-16 09:03:35');
INSERT INTO `receipts` VALUES ('11', 'ADW/REC/18-19/0019', '2018-08-17', '2', '1650', 0x506169642046696E616C, null, '', '', '', '', '', '', '', '', '1650', '1650', '0', '2018-08-17 06:42:01', '2018-08-17 06:42:01');

-- ----------------------------
-- Table structure for `receipt_bill_session`
-- ----------------------------
DROP TABLE IF EXISTS `receipt_bill_session`;
CREATE TABLE `receipt_bill_session` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `session` varchar(7) DEFAULT NULL,
  `startDate` date DEFAULT NULL,
  `closeDate` date DEFAULT NULL,
  `bill` int(11) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of receipt_bill_session
-- ----------------------------
INSERT INTO `receipt_bill_session` VALUES ('1', '16-17', '2016-04-01', '2017-03-31', '0', null, '2017-04-03 11:29:33');
INSERT INTO `receipt_bill_session` VALUES ('2', '17-18', '2017-04-01', '2018-03-31', '0', null, '2017-11-02 04:06:38');
INSERT INTO `receipt_bill_session` VALUES ('3', '18-19', '2018-04-01', '2019-03-31', '19', null, '2018-08-17 06:42:01');
INSERT INTO `receipt_bill_session` VALUES ('4', '19-20', '2019-04-01', '2020-03-31', '0', null, null);

-- ----------------------------
-- Table structure for `salary`
-- ----------------------------
DROP TABLE IF EXISTS `salary`;
CREATE TABLE `salary` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `employee_id` int(10) DEFAULT NULL,
  `empID` varchar(255) DEFAULT NULL,
  `empName` varchar(255) DEFAULT NULL,
  `salary` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `employee_id` (`employee_id`),
  CONSTRAINT `employee_id` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of salary
-- ----------------------------
INSERT INTO `salary` VALUES ('1', '2', 'ADWEMP2', 'TINKU ALI', '10000', null, '2019-02-25 10:31:38', '2019-02-25 10:31:38');
INSERT INTO `salary` VALUES ('2', '3', 'ADWEMP3', 'BIJAY GUHA NEOGI', '10000', null, '2019-03-15 09:27:34', '2019-03-15 09:27:34');

-- ----------------------------
-- Table structure for `salary_log`
-- ----------------------------
DROP TABLE IF EXISTS `salary_log`;
CREATE TABLE `salary_log` (
  `salary_id` int(10) DEFAULT NULL,
  `empID` varchar(255) DEFAULT NULL,
  `empName` varchar(255) DEFAULT NULL,
  `salary` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `increased_on` date DEFAULT NULL,
  KEY `salary_id` (`salary_id`),
  CONSTRAINT `salary_id` FOREIGN KEY (`salary_id`) REFERENCES `salary` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of salary_log
-- ----------------------------
INSERT INTO `salary_log` VALUES ('1', 'ADWEMP2', 'TINKU ALI', '10000', null, '2019-02-25 10:31:38', '2019-02-25 10:31:38', '2019-02-25');
INSERT INTO `salary_log` VALUES ('2', 'ADWEMP3', 'BIJAY GUHA NEOGI', '10000', null, '2019-03-15 09:27:34', '2019-03-15 09:27:34', '2019-03-15');

-- ----------------------------
-- Table structure for `sales`
-- ----------------------------
DROP TABLE IF EXISTS `sales`;
CREATE TABLE `sales` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `unique_id` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `billing_date` date DEFAULT NULL,
  `customer_id` bigint(20) unsigned DEFAULT '0',
  `billBy` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `total_amount` double(10,2) DEFAULT NULL,
  `total_discount` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fright` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `postage_charge` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `grand_total` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` blob,
  `city` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mobile` varchar(14) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `retail_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sales_customer_id_foreign` (`customer_id`) USING BTREE,
  CONSTRAINT `sales_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of sales
-- ----------------------------
INSERT INTO `sales` VALUES ('23', 'ADWS/5418/18-19', '2018-07-16', '3210', null, '1550.00', '155', null, '5', '1400.00', null, 'Siliguri', null, '7859631247', 'sombhu@gmail.com', 'Sombhu', '2018-07-16 05:49:24', '2018-07-16 05:49:24');
INSERT INTO `sales` VALUES ('24', 'ADWS/5419/18-19', '2018-07-16', '3', null, '1200.00', '60', null, '', '1140.00', null, '', null, '', '', '', '2018-07-16 05:54:07', '2018-07-16 05:54:07');
INSERT INTO `sales` VALUES ('25', 'ADWS/5420/18-19', '2018-08-17', '2', null, '1650.00', '0', null, '', '1650.00', null, '', null, '', '', '', '2018-08-17 06:39:19', '2018-08-17 06:39:19');
INSERT INTO `sales` VALUES ('26', 'ADWS/5421/18-19', '2018-09-08', '3210', null, '220.00', '50', null, '', '170.00', null, '', null, '', '', 'g paul', '2018-09-08 09:22:20', '2018-09-08 09:22:20');
INSERT INTO `sales` VALUES ('27', 'ADWS/5422/18-19', '2019-02-14', '1', null, '1200.00', '120', null, '', '1080.00', null, '', null, '', '', '', '2019-02-14 11:51:54', '2019-02-14 11:51:54');

-- ----------------------------
-- Table structure for `sale_bill_session`
-- ----------------------------
DROP TABLE IF EXISTS `sale_bill_session`;
CREATE TABLE `sale_bill_session` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `session` varchar(7) DEFAULT NULL,
  `startDate` date DEFAULT NULL,
  `closeDate` date DEFAULT NULL,
  `bill` int(11) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of sale_bill_session
-- ----------------------------
INSERT INTO `sale_bill_session` VALUES ('1', '16-17', '2016-04-01', '2017-03-31', '0', null, '2017-04-03 11:29:33');
INSERT INTO `sale_bill_session` VALUES ('2', '17-18', '2017-04-01', '2018-03-31', '0', null, '2017-11-10 22:38:50');
INSERT INTO `sale_bill_session` VALUES ('3', '18-19', '2018-04-01', '2019-03-31', '5422', null, '2019-02-14 11:51:54');
INSERT INTO `sale_bill_session` VALUES ('4', '19-20', '2019-04-01', '2020-03-31', '0', null, null);

-- ----------------------------
-- Table structure for `sale_invoice`
-- ----------------------------
DROP TABLE IF EXISTS `sale_invoice`;
CREATE TABLE `sale_invoice` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sale_id` int(10) unsigned DEFAULT NULL,
  `product_id` bigint(20) DEFAULT '0',
  `description` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mrp` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quantity` int(10) unsigned DEFAULT NULL,
  `unit` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rate` double DEFAULT NULL,
  `discount_per` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `total_amount` double(10,2) DEFAULT NULL,
  `discount` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` varchar(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  `track_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sales_product_id_foreign` (`product_id`) USING BTREE,
  KEY `sale_id` (`sale_id`) USING BTREE,
  CONSTRAINT `sale_invoice_ibfk_1` FOREIGN KEY (`sale_id`) REFERENCES `sales` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sale_invoice_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of sale_invoice
-- ----------------------------
INSERT INTO `sale_invoice` VALUES ('31', '23', '702', '', null, '10', null, '155', '10', '1395.00', '155', '2018-07-16 05:49:24', '2018-07-16 05:49:24', null, '2018-07-16');
INSERT INTO `sale_invoice` VALUES ('32', '24', '5', '', null, '10', null, '120', '5', '1140.00', '60', '2018-07-16 05:54:07', '2018-07-16 05:54:07', null, '2018-07-16');
INSERT INTO `sale_invoice` VALUES ('33', '25', '10', '', null, '5', null, '330', '', '1650.00', '0', '2018-08-17 06:39:20', '2018-08-17 06:39:20', null, '2018-08-17');
INSERT INTO `sale_invoice` VALUES ('34', '26', '573', 'photo feame', null, '2', null, '110', '10', '170.00', '50', '2018-09-08 09:22:20', '2018-09-08 09:22:20', null, '2018-09-08');
INSERT INTO `sale_invoice` VALUES ('35', '27', '5', 'hjgjh', null, '10', null, '120', '10', '1080.00', '120', '2019-02-14 11:51:54', '2019-02-14 11:51:54', null, '2019-02-14');

-- ----------------------------
-- Table structure for `sale_returns`
-- ----------------------------
DROP TABLE IF EXISTS `sale_returns`;
CREATE TABLE `sale_returns` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sale_return_no` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `against_sale_no` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sale_id` varchar(25) COLLATE utf8_unicode_ci DEFAULT 'NA',
  `sale_return_date` date DEFAULT NULL,
  `customer_id` bigint(20) unsigned DEFAULT '0',
  `billBy` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `total_amount` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `total_discount` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `total_sub` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `grand_total` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sales_customer_id_foreign` (`customer_id`) USING BTREE,
  CONSTRAINT `sale_returns_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of sale_returns
-- ----------------------------
INSERT INTO `sale_returns` VALUES ('3', 'ADWS/SR/18-19/0005', 'ADWS/5403/18-19', '8', '2018-06-26', '3', null, '1600.00', '170.00', null, '1430.00', '2018-06-26 12:36:36', '2018-06-26 12:36:36');
INSERT INTO `sale_returns` VALUES ('4', 'ADWS/SR/18-19/0006', 'ADWS/5419/18-19', '24', '2018-07-16', '3', null, '1200', '60', null, '1140.00', '2018-07-16 09:17:55', '2018-07-16 09:17:55');
INSERT INTO `sale_returns` VALUES ('5', 'ADWS/SR/18-19/0007', 'ADWS/5421/18-19', '26', '2019-02-14', '3210', null, '220', '50', null, '170.00', '2019-02-14 11:54:40', '2019-02-14 11:54:40');

-- ----------------------------
-- Table structure for `sale_returns_invoice`
-- ----------------------------
DROP TABLE IF EXISTS `sale_returns_invoice`;
CREATE TABLE `sale_returns_invoice` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sale_return_id` int(10) unsigned NOT NULL,
  `sale_id` int(10) unsigned DEFAULT NULL,
  `sale_invoice_no` int(10) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT '0',
  `description` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quantity` int(10) unsigned DEFAULT NULL,
  `rate` double(10,2) DEFAULT NULL,
  `discount` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `total_amount` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `track_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sales_product_id_foreign` (`product_id`) USING BTREE,
  KEY `sale_id` (`sale_id`) USING BTREE,
  KEY `sale_return_id` (`sale_return_id`) USING BTREE,
  CONSTRAINT `sale_returns_invoice_ibfk_1` FOREIGN KEY (`sale_id`) REFERENCES `sales` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sale_returns_invoice_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sale_returns_invoice_ibfk_3` FOREIGN KEY (`sale_return_id`) REFERENCES `sale_returns` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of sale_returns_invoice
-- ----------------------------
INSERT INTO `sale_returns_invoice` VALUES ('1', '4', '24', '32', '5', '', '10', '120.00', '60', '1140', '2018-07-16', '2018-07-16 09:17:55', '2018-07-16 09:17:55');
INSERT INTO `sale_returns_invoice` VALUES ('2', '5', '26', '34', '573', 'photo feame', '2', '110.00', '50', '170', '2019-02-14', '2019-02-14 11:54:40', '2019-02-14 11:54:40');

-- ----------------------------
-- Table structure for `sale_returns_invoice_temp`
-- ----------------------------
DROP TABLE IF EXISTS `sale_returns_invoice_temp`;
CREATE TABLE `sale_returns_invoice_temp` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `temp_id` int(10) unsigned NOT NULL,
  `sale_invoice_no` int(10) unsigned DEFAULT NULL,
  `sale_id` int(10) unsigned DEFAULT NULL,
  `product_id` bigint(10) DEFAULT '0',
  `description` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mrp` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quantity` int(10) unsigned DEFAULT NULL,
  `unit` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rate` double DEFAULT NULL,
  `discount` varchar(10) COLLATE utf8_unicode_ci DEFAULT '0',
  `total_amount` double(10,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` varchar(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sales_product_id_foreign` (`product_id`) USING BTREE,
  KEY `sale_id` (`sale_id`) USING BTREE,
  KEY `temp_id` (`temp_id`) USING BTREE,
  CONSTRAINT `sale_returns_invoice_temp_ibfk_1` FOREIGN KEY (`sale_id`) REFERENCES `sales` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sale_returns_invoice_temp_ibfk_3` FOREIGN KEY (`temp_id`) REFERENCES `sale_returns_temp` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sale_returns_invoice_temp_ibfk_4` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of sale_returns_invoice_temp
-- ----------------------------
INSERT INTO `sale_returns_invoice_temp` VALUES ('1', '59', '32', '24', '5', '', null, '10', null, '120', '60', '1140.00', '2018-07-16 09:17:33', '2018-07-16 09:17:33', null);
INSERT INTO `sale_returns_invoice_temp` VALUES ('3', '61', '31', '23', '702', '', null, '10', null, '155', '155', '1395.00', '2019-01-22 07:03:54', '2019-01-22 07:03:54', null);
INSERT INTO `sale_returns_invoice_temp` VALUES ('4', '62', '34', '26', '573', 'photo feame', null, '2', null, '110', '50', '170.00', '2019-02-14 11:54:30', '2019-02-14 11:54:30', null);

-- ----------------------------
-- Table structure for `sale_returns_temp`
-- ----------------------------
DROP TABLE IF EXISTS `sale_returns_temp`;
CREATE TABLE `sale_returns_temp` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sale_id` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `unique_id` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `billing_date` date DEFAULT NULL,
  `customer_id` bigint(20) unsigned DEFAULT '0',
  `customer_type` varchar(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  `billBy` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `total_amount` double(10,2) DEFAULT NULL,
  `total_discount` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fright` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `grand_total` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` blob,
  `city` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mobile` varchar(14) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `retail_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `payment_type` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `payment_desc` blob,
  `status` varchar(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sales_customer_id_foreign` (`customer_id`) USING BTREE,
  CONSTRAINT `sale_returns_temp_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of sale_returns_temp
-- ----------------------------
INSERT INTO `sale_returns_temp` VALUES ('58', '8', 'ADWS/5403/18-19', '2018-06-26', '3', null, null, '2200.00', '170', null, '2030.00', null, '', '', '', '', null, null, null, '2018-06-27 06:14:44', '2018-06-27 06:14:44');
INSERT INTO `sale_returns_temp` VALUES ('59', '24', 'ADWS/5419/18-19', '2018-07-16', '3', null, null, '1200.00', '60', null, '1140.00', null, '', '', '', '', null, null, null, '2018-07-16 09:17:33', '2018-07-16 09:17:33');
INSERT INTO `sale_returns_temp` VALUES ('61', '23', 'ADWS/5418/18-19', '2018-07-16', '3210', null, null, '1550.00', '155', null, '1400.00', null, 'Siliguri', '7859631247', 'sombhu@gmail.com', 'Sombhu', null, null, null, '2019-01-22 07:03:54', '2019-01-22 07:03:54');
INSERT INTO `sale_returns_temp` VALUES ('62', '26', 'ADWS/5421/18-19', '2018-09-08', '3210', null, null, '220.00', '50', null, '170.00', null, '', '', '', 'g paul', null, null, null, '2019-02-14 11:54:30', '2019-02-14 11:54:30');

-- ----------------------------
-- Table structure for `sale_return_bill_session`
-- ----------------------------
DROP TABLE IF EXISTS `sale_return_bill_session`;
CREATE TABLE `sale_return_bill_session` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `session` varchar(7) DEFAULT NULL,
  `startDate` date DEFAULT NULL,
  `closeDate` date DEFAULT NULL,
  `bill` int(11) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of sale_return_bill_session
-- ----------------------------
INSERT INTO `sale_return_bill_session` VALUES ('1', '16-17', '2016-04-01', '2017-03-31', '0', null, '2017-04-03 11:29:33');
INSERT INTO `sale_return_bill_session` VALUES ('2', '17-18', '2017-04-01', '2018-03-31', '0', null, '2017-11-03 11:42:37');
INSERT INTO `sale_return_bill_session` VALUES ('3', '18-19', '2018-04-01', '2019-03-31', '7', null, '2019-02-14 11:54:40');
INSERT INTO `sale_return_bill_session` VALUES ('4', '19-20', '2019-04-01', '2020-03-31', '0', null, null);

-- ----------------------------
-- Table structure for `sale_return_output_tax`
-- ----------------------------
DROP TABLE IF EXISTS `sale_return_output_tax`;
CREATE TABLE `sale_return_output_tax` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `unique_id` varchar(50) DEFAULT NULL,
  `billing_date` date DEFAULT NULL,
  `customer_id` int(10) unsigned NOT NULL,
  `type` varchar(30) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `sale_return_id` int(10) unsigned DEFAULT NULL,
  `product_id` int(10) unsigned DEFAULT NULL,
  `output_tax` double(10,2) DEFAULT NULL,
  `sale_return_invoice_id` int(10) unsigned DEFAULT NULL,
  `status` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_id` (`customer_id`) USING BTREE,
  KEY `product_id` (`product_id`) USING BTREE,
  KEY `sale_return_id` (`sale_return_id`) USING BTREE,
  KEY `sale_return_invoice_id` (`sale_return_invoice_id`) USING BTREE,
  CONSTRAINT `sale_return_output_tax_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `sale_return_output_tax_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sale_return_output_tax_ibfk_3` FOREIGN KEY (`sale_return_id`) REFERENCES `sale_returns` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sale_return_output_tax_ibfk_4` FOREIGN KEY (`sale_return_invoice_id`) REFERENCES `sale_returns_invoice` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of sale_return_output_tax
-- ----------------------------

-- ----------------------------
-- Table structure for `supplier`
-- ----------------------------
DROP TABLE IF EXISTS `supplier`;
CREATE TABLE `supplier` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `billing_name` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `mobile_number` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `Balance` varchar(255) DEFAULT '0',
  `status` tinyint(4) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` time DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of supplier
-- ----------------------------
INSERT INTO `supplier` VALUES ('1', 'INTERNATIONAL PHOTOGRAPHY', 'INTERNATIONAL PHOTOGRAPHY', 'METRO GOLI, KOLKATA', '98832 14450', '', '0', '1', null, null);
INSERT INTO `supplier` VALUES ('2', 'COMPUTER WORLD', 'COMPUTER WORLD', 'BEGUNTARI, JALPAIGURI', '98325 24336', '', '0', '1', null, null);
INSERT INTO `supplier` VALUES ('3', 'SHYAMAL ROY', 'SHYAMAL ROY', 'HOSPITAL PARA, MAYNAGURI', '96353 06575', '', '0', '1', null, null);
INSERT INTO `supplier` VALUES ('5', 'DEBASISH LAMINATION', 'DEBASISH LAMINATION', 'SENPARA, JALPAIGURI', '91993 38039', '', '0', '1', null, null);
INSERT INTO `supplier` VALUES ('6', 'XPRESSION', 'XPRESSION', 'BIDHAN MARKET, SILIGURI', '98325 88948', '', '0', '1', null, null);
INSERT INTO `supplier` VALUES ('7', 'GANGOTRI', 'GANGOTRI', 'JAIGAON', '87689 62035', '', '0', '1', null, null);
INSERT INTO `supplier` VALUES ('8', 'RAINBOW DIGITAL LAB', 'RAINBOW DIGITAL LAB', 'MARCHANT ROAD', '97330 00609', '', '42.5', '1', null, null);
INSERT INTO `supplier` VALUES ('9', 'DEEPLINE', 'DEEPLINE', 'MASKALAIBARI, JALPAIGURI', '81164 92543', '', '0', '1', null, null);
INSERT INTO `supplier` VALUES ('10', 'TUN DIGITAL', 'TUN DIGITAL', 'SAMAJPARA, JALPAIGURI', '94762 79681', 'pressprintindia@gmail.com', '0', '1', null, null);
INSERT INTO `supplier` VALUES ('11', 'DISHA DIGITAL', 'DISHA DIGITAL', 'KADAMTALA, JALPAIGURI', '98324 21639', '', '0', '1', null, null);
INSERT INTO `supplier` VALUES ('12', 'FLEX O PRINT', 'FLEX O PRINT', 'HAKIMPARA, SILIGURI', '94743 92081', 'flexoprint123@gmail.com', '0', '1', null, null);
INSERT INTO `supplier` VALUES ('13', 'FLEX O ZONE', 'FLEX O ZONE', 'KADAMTALA, JALPAIGURI', '91264 19887', 'flexozone@gmail.com', '0', '1', null, null);
INSERT INTO `supplier` VALUES ('14', 'NEW DIGITAL GRAPHIC', 'NEW DIGITAL GRAPHIC', 'KADAMTALA, JALPAIGURI', '98320 63956', '', '0', '1', null, null);
INSERT INTO `supplier` VALUES ('15', 'SASHIKANT PRASAD', 'SASHIKANT PRASAD', 'GURGAON', '98110 14914', 'kant_shasi@hotmail.com', '0', '1', null, null);
INSERT INTO `supplier` VALUES ('16', 'CANVERA', 'CANVERA', 'BANGALORE', '90070 12570', '', '0', '1', null, null);
INSERT INTO `supplier` VALUES ('17', 'BISHU WORLD', 'BISHU WORLD', 'KADAMTALA, JALPAIGURI', '89459 23822', '', '0', '1', null, null);
INSERT INTO `supplier` VALUES ('18', 'BHOWMIK CARD HOUSE', 'BHOWMIK CARD HOUSE', 'KADAMTALA, JALPAIGURI', '9832016392', 'BHOWMIKCARDHOUSE@gmail.com', '0', '1', '2018-06-02 16:45:18', '11:15:18');
INSERT INTO `supplier` VALUES ('19', 'ELLORA', 'ELLORA', 'N S ROAD, SILIGURI', '9434045127', 'ELLORASLG@GMAIL.COM', '0', '0', '2018-09-08 14:37:17', '09:07:17');
INSERT INTO `supplier` VALUES ('20', 'IMPULSE', 'IMPULSE', 'BALIGUNJ, KOLKATA', '8584075101', 'sanjoy@impulsespecialtygifting.com', '0', '1', null, null);
INSERT INTO `supplier` VALUES ('21', 'SKY WORLD', 'SKY WORLD', 'DHARMATALA, KOLKATA', '9239577960', 'skyworldsales@gmail.com', '0', '1', null, null);
INSERT INTO `supplier` VALUES ('22', 'SAYAN DA', 'SAYAN DA', 'KUDDBAZAR', '8017033833', 'sayanhore@gmail.com', '0', '1', null, null);
INSERT INTO `supplier` VALUES ('23', 'BRIGHT DIGITAL', 'BRIGHT DIGITAL', 'UJJANI COMPLEX', '9832483497 ', 'ujjalbridig@gmail.com', '0', '1', null, null);
INSERT INTO `supplier` VALUES ('24', 'PRIYANKA DAS', 'PRIYANKA DAS', 'jalpaiguri', '9051770923', 'priyankadas.das78@gmail.com', '0', '1', null, null);
INSERT INTO `supplier` VALUES ('25', 'COMPUTER PLAZA', 'COMPUTER PLAZA', 'BEGUNTARI, CHOWDHURY COTTAGE', '03561227698', '', '0', '1', null, null);
INSERT INTO `supplier` VALUES ('26', 'PEKARO', 'PEKARO', 'BIDHAN NAGAR, RAIGANJ', '9232085180', 'order@pekaro.in', '0', '1', null, null);
INSERT INTO `supplier` VALUES ('27', 'Upendra Kumar Prasad', 'Upen', 'Mal Bazar, Dist: jalpaiguri, P.O. - Mal,\r\nP.S. - Mal, Near Caltex More', '7001532456', 'upenndra@gmail.com', '0', '1', '2018-06-02 13:52:02', '08:22:02');
INSERT INTO `supplier` VALUES ('29', 'AsdASDASFDZda', 'SADASD', 'Siliguri', '', 'saswataisonline@gmail.com', '0', '1', '2018-11-10 12:19:59', '12:19:59');

-- ----------------------------
-- Table structure for `table_emp_loan`
-- ----------------------------
DROP TABLE IF EXISTS `table_emp_loan`;
CREATE TABLE `table_emp_loan` (
  `id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `emp_id_pk` int(11) DEFAULT NULL,
  `emp_code` varchar(255) NOT NULL,
  `emp_name` varchar(255) DEFAULT NULL,
  `wish_deduction_per_month` double(10,2) DEFAULT '0.00',
  `loan_applied` double(10,2) DEFAULT NULL,
  `wish_no_of_month` double(10,2) DEFAULT '0.00',
  `grant_deduction_per_month` double(10,2) DEFAULT '0.00',
  `grant_no_of_month` double(10,2) DEFAULT '0.00',
  `loan_balance` double(10,2) DEFAULT NULL,
  `loan_granted` double(10,2) DEFAULT '0.00',
  `user_id` varchar(12) DEFAULT NULL,
  `remark_by_admin` varchar(255) DEFAULT NULL,
  `loan_applied_date` varchar(15) DEFAULT NULL,
  `loan_status` varchar(50) DEFAULT NULL,
  `reason_for_loan` varchar(255) DEFAULT NULL,
  `grant_date` varchar(15) DEFAULT NULL,
  `pay_unique_no` varchar(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of table_emp_loan
-- ----------------------------
INSERT INTO `table_emp_loan` VALUES ('00000000001', '10', 'ADWEMP9', 'Mr. Bikram Basak', '2000.00', '10000.00', '5.00', '0.00', '0.00', null, '0.00', null, null, null, 'Pending', 'Personal', null, null, '2018-07-11 07:46:07', '2018-07-11 07:46:07');
INSERT INTO `table_emp_loan` VALUES ('00000000002', '1', 'ADWEMP1', 'GOBINDA MAJUMDAR', '1000.00', '15000.00', '15.00', '2000.00', '5.00', '0.00', '10000.00', null, 'Granted', '11-07-2018', 'cleared', 'Personal', '11-07-2018', '8', '2018-07-11 08:00:12', '2018-07-12 06:17:03');
INSERT INTO `table_emp_loan` VALUES ('00000000003', '3', 'ADWEMP3', 'BIJAY GUHA NEOGI', '1000.00', '10000.00', '10.00', '2000.00', '4.00', '0.00', '8000.00', null, 'Granted', '12-07-2018', 'cleared', 'Personal', '12-07-2018', '12', '2018-07-12 05:18:41', '2018-07-12 12:32:59');
INSERT INTO `table_emp_loan` VALUES ('00000000004', '3', 'ADWEMP3', 'BIJAY GUHA NEOGI', '1000.00', '5000.00', '5.00', '1000.00', '5.00', '4000.00', '5000.00', null, '', '12-07-2018', 'Approved', 'Personal', '12-07-2018', '13', '2018-07-12 08:12:19', '2018-07-12 12:34:16');
INSERT INTO `table_emp_loan` VALUES ('00000000005', '9', 'ADWEMP8', 'SUROJIT LAHIRI', '1000.00', '12000.00', '12.00', '0.00', '0.00', null, '0.00', null, null, '18-07-2018', 'Pending', 'Personal', null, null, '2018-07-18 05:48:37', '2018-07-18 05:48:37');

-- ----------------------------
-- Table structure for `table_emp_pay`
-- ----------------------------
DROP TABLE IF EXISTS `table_emp_pay`;
CREATE TABLE `table_emp_pay` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_id_pk` int(11) DEFAULT NULL,
  `emp_code` varchar(255) NOT NULL DEFAULT '0',
  `emp_name` varchar(255) DEFAULT NULL,
  `user_id` varchar(15) DEFAULT NULL,
  `basic_pay` double NOT NULL DEFAULT '0',
  `house_rent_allowance` double DEFAULT NULL,
  `special_allowance` double DEFAULT NULL,
  `conveyance` double DEFAULT NULL,
  `emergency_allowance` double DEFAULT NULL,
  `provident_fund` double DEFAULT NULL,
  `professional_tax` double DEFAULT NULL,
  `income_tax` double DEFAULT NULL,
  `gross_earning` double DEFAULT NULL,
  `gross_deduction` double DEFAULT NULL,
  `net_pay` double DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `emp_id_pk` (`emp_id_pk`),
  CONSTRAINT `table_emp_pay_ibfk_1` FOREIGN KEY (`emp_id_pk`) REFERENCES `employee` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of table_emp_pay
-- ----------------------------
INSERT INTO `table_emp_pay` VALUES ('3', '10', 'ADWEMP9', 'Mr. Bikram Basak', null, '10000', '4400', '6800', '2500', '1000', '3200', '500', '1000', '24700', '4700', '20000', '2018-07-07 12:47:45', '2018-07-09 07:38:06');
INSERT INTO `table_emp_pay` VALUES ('4', '1', 'ADWEMP1', 'GOBINDA MAJUMDAR', null, '8000', '2000', '500', '1000', '550', '1000', '100', '50', '12050', '1150', '10900', '2018-07-10 07:41:28', '2018-07-10 07:41:28');
INSERT INTO `table_emp_pay` VALUES ('5', '3', 'ADWEMP3', 'BIJAY GUHA NEOGI', null, '8000', '3500', '1500', '2000', '1000', '1200', '250', '1000', '16000', '2450', '13550', '2018-07-12 06:36:39', '2018-07-12 06:36:39');

-- ----------------------------
-- Table structure for `table_generate_pay`
-- ----------------------------
DROP TABLE IF EXISTS `table_generate_pay`;
CREATE TABLE `table_generate_pay` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `year` varchar(10) DEFAULT NULL,
  `month` varchar(20) DEFAULT NULL,
  `emp_id_pk` int(11) DEFAULT NULL,
  `emp_code` varchar(255) NOT NULL,
  `emp_name` varchar(255) NOT NULL,
  `user_id` varchar(10) DEFAULT NULL,
  `paid_date` varchar(15) DEFAULT NULL,
  `basic_pay` varchar(15) DEFAULT NULL,
  `house_rent_allowance` varchar(15) DEFAULT NULL,
  `special_allowance` varchar(15) DEFAULT NULL,
  `conveyance` varchar(15) DEFAULT NULL,
  `emergency_allowance` varchar(15) DEFAULT NULL,
  `incentive` varchar(15) DEFAULT '0',
  `provident_fund` varchar(15) DEFAULT '0',
  `professional_tax` varchar(15) DEFAULT '0',
  `income_tax` varchar(15) DEFAULT '0',
  `other_income` varchar(10) DEFAULT NULL,
  `gross_earning` varchar(15) DEFAULT '0',
  `gross_deduction` varchar(15) DEFAULT NULL,
  `deduction_against_loan` varchar(15) DEFAULT NULL,
  `deduction_against_leave` varchar(15) DEFAULT NULL,
  `other_deduction` varchar(15) DEFAULT NULL,
  `total_new_deduction` varchar(15) DEFAULT NULL,
  `total_new_earning` varchar(15) DEFAULT NULL,
  `net_pay` varchar(15) DEFAULT NULL,
  `final_net_pay` varchar(15) DEFAULT NULL,
  `remarks` blob,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of table_generate_pay
-- ----------------------------
INSERT INTO `table_generate_pay` VALUES ('2', '2018', '06', '10', 'ADWEMP9', 'Mr. Bikram Basak', null, '09-07-2018', '10000', '4400', '', '2500', '1000', '2000', '3200', '500', '1000', '500', '24700', '4700', '', '', '4700', '0', '2500', '20000', '22500', null, '2018-07-10 06:48:32', '2018-07-10 07:39:53');
INSERT INTO `table_generate_pay` VALUES ('3', '2018', '06', '1', 'ADWEMP1', 'GOBINDA MAJUMDAR', null, '10-07-2018', '8000', '2000', '500', '1000', '550', '2000', '1000', '100', '50', '600', '12050', '1150', '', '', '1150', '0', '2600', '10900', '13500', null, '2018-07-10 07:42:23', '2018-07-10 07:42:23');
INSERT INTO `table_generate_pay` VALUES ('4', '2018', '07', '1', 'ADWEMP1', 'GOBINDA MAJUMDAR', null, '01-08-2018', '8000', '2000', '500', '1000', '550', '1000', '1000', '100', '50', '', '12050', '1150', '2000', '', '1150', '2000', '1000', '10900', '9900', null, '2018-07-12 05:40:21', '2018-07-12 05:40:21');
INSERT INTO `table_generate_pay` VALUES ('5', '2018', '08', '1', 'ADWEMP1', 'GOBINDA MAJUMDAR', null, '01-09-2018', '8000', '2000', '500', '1000', '550', '', '1000', '100', '50', '', '12050', '1150', '2000', '', '1150', '2000', '', '10900', '8900', null, '2018-07-12 06:11:32', '2018-07-12 06:11:32');
INSERT INTO `table_generate_pay` VALUES ('6', '2018', '09', '1', 'ADWEMP1', 'GOBINDA MAJUMDAR', null, '01-10-2018', '8000', '2000', '500', '1000', '550', '', '1000', '100', '50', '', '12050', '1150', '2000', '', '1150', '2000', '', '10900', '8900', null, '2018-07-12 06:13:42', '2018-07-12 06:13:42');
INSERT INTO `table_generate_pay` VALUES ('7', '2018', '10', '1', 'ADWEMP1', 'GOBINDA MAJUMDAR', null, '01-11-2018', '8000', '2000', '500', '1000', '550', '', '1000', '100', '50', '', '12050', '1150', '2000', '', '1150', '2000', '', '10900', '8900', null, '2018-07-12 06:14:20', '2018-07-12 06:14:20');
INSERT INTO `table_generate_pay` VALUES ('8', '2018', '11', '1', 'ADWEMP1', 'GOBINDA MAJUMDAR', null, '01-12-2018', '8000', '2000', '500', '1000', '550', '', '1000', '100', '50', '', '12050', '1150', '2000', '', '1150', '2000', '0', '10900', '8900', null, '2018-07-12 06:17:03', '2018-07-12 06:17:03');
INSERT INTO `table_generate_pay` VALUES ('9', '2018', '06', '3', 'ADWEMP3', 'BIJAY GUHA NEOGI', null, '12-07-2018', '8000', '3500', '1500', '2000', '1000', '2000', '1200', '250', '1000', '1000', '16000', '2450', '2000', '', '2450', '2000', '3000', '13550', '14550', null, '2018-07-12 06:37:33', '2018-07-12 06:37:33');
INSERT INTO `table_generate_pay` VALUES ('10', '2018', '07', '3', 'ADWEMP3', 'BIJAY GUHA NEOGI', null, '01-08-2018', '8000', '3500', '1500', '2000', '1000', '', '1200', '250', '1000', '', '16000', '2450', '2000', '', '2450', '2000', '', '13550', '11550', null, '2018-07-12 12:31:38', '2018-07-12 12:31:38');
INSERT INTO `table_generate_pay` VALUES ('11', '2018', '08', '3', 'ADWEMP3', 'BIJAY GUHA NEOGI', null, '01-09-2018', '8000', '3500', '1500', '2000', '1000', '', '1200', '250', '1000', '', '16000', '2450', '2000', '', '2450', '2000', '', '13550', '11550', null, '2018-07-12 12:32:12', '2018-07-12 12:32:12');
INSERT INTO `table_generate_pay` VALUES ('12', '2018', '10', '3', 'ADWEMP3', 'BIJAY GUHA NEOGI', null, '01-11-2018', '8000', '3500', '1500', '2000', '1000', '', '1200', '250', '1000', '', '16000', '2450', '2000', '', '2450', '2000', '0', '13550', '11550', null, '2018-07-12 12:32:59', '2018-07-12 12:32:59');
INSERT INTO `table_generate_pay` VALUES ('13', '2018', '11', '3', 'ADWEMP3', 'BIJAY GUHA NEOGI', null, '01-12-2018', '8000', '3500', '1500', '2000', '1000', '', '1200', '250', '1000', '', '16000', '2450', '1000', '', '2450', '1000', '', '13550', '12550', null, '2018-07-12 12:34:16', '2018-07-12 12:34:16');
INSERT INTO `table_generate_pay` VALUES ('14', '2019', '11', '1', 'ADWEMP1', 'GOBINDA MAJUMDAR', null, '01-11-2019', '8000', '2000', '500', '1000', '550', '600', '1000', '100', '50', '', '12050', '1150', '', '', '1150', '0', '600', '10900', '11500', null, '2019-01-01 12:53:25', '2019-01-01 12:53:25');

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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('6', 'Admin', 'admin@gmail.com', '$2y$10$UDVhYhBeVnGaloqsrw9Bauy3t8gzCMPTIdLtHZRwLq92eKZZdXRyS', 'admin', 'DDRIZY0NCL5H9A5kV3uVenet1JgpHVBvXe2DzRWWvDNPOcAjzOahEUhBi6ur', '2017-07-09 21:51:40', '2019-02-18 04:50:34', 'siliguri', '9641524192', 'siliguri', '734001', 'WEST BENGAL');
INSERT INTO `users` VALUES ('7', 'narayan', 'narayan@gmail.com', '$2y$10$kw3ZJ1xCUs40jQp6EWuiLO4rQH3vkgM8YqjP0cahTPv.3xlVDHNrG', 'employee', '9c6OsiPdUCi3AQscGe6W44joRX9lStpx5E5PfIephvin9GsvZAAQTXo4sMq2', '2017-11-04 05:29:33', '2018-10-11 11:10:32', 'Siliguri', '9832668671', 'Siliguri', '734001', 'WB');
INSERT INTO `users` VALUES ('8', 'ASISH DUTTA', 'asish538@gmail.com', '$2y$10$kFHOCfjWeLbM5h7i207xt.BGqtqAaSURe2R8PjQPFEWZBrjUnT3Pi', 'admin', 'xsnJjdAjnjILESp1iaRAJpoZ51GPrum43XqLUuzoz5LA1uvB0yjidKnI0GGw', '2017-11-04 21:16:24', '2017-11-23 21:16:50', 'dpg', '9832679416', 'dpg', '735210', 'wb');
