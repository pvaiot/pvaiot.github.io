-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 07, 2019 at 01:29 PM
-- Server version: 5.6.41-84.1-log
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sbtscv13_bhawani_transport`
--

-- --------------------------------------------------------

--
-- Table structure for table `indent`
--

CREATE TABLE `indent` (
  `id` int(10) NOT NULL,
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
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `indent`
--

INSERT INTO `indent` (`id`, `indent_no`, `indent_date`, `branch_id`, `branch_code`, `origin_id`, `origin`, `destination`, `consignor_id`, `consignor_name`, `party_code`, `placement_ideal_date`, `truck_type_id`, `truck_type`, `material_id`, `material`, `tonnage`, `rate`, `per_tone_amount`, `status`, `consignee`, `created_at`, `updated_at`) VALUES
(1, 'IN0001', '2019-03-06', '1', '1101', '6', 'FATAPUKUR', NULL, '2', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', '2', '2019-03-06', NULL, NULL, '2', 'SOFT DRINK', NULL, NULL, NULL, 0, NULL, '2019-03-06 06:47:37', '2019-03-06 08:08:40'),
(3, 'IN0002', '2019-03-06', '1', '1101', '6', 'FATAPUKUR', NULL, '2', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', '2', '2019-03-07', NULL, NULL, '2', 'SOFT DRINK', NULL, NULL, NULL, 0, NULL, '2019-03-06 16:32:17', '2019-03-07 07:52:33');

-- --------------------------------------------------------

--
-- Table structure for table `indentplacement_child`
--

CREATE TABLE `indentplacement_child` (
  `id` int(10) NOT NULL,
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
  `indent_child_id` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `indentplacement_child`
--

INSERT INTO `indentplacement_child` (`id`, `indentplacement_id`, `destination`, `tonnage`, `truck_type`, `truck_no`, `rate`, `created_at`, `updated_at`, `mobile_no`, `consignee`, `broker_id`, `broker`, `indent_child_id`) VALUES
(45, 2, 'DARJEELING', '6', 'LCV.6', 'WB73B6290', '6200', '2019-03-06 11:01:09', '2019-03-06 11:01:09', '7602343996', 'HIMALAYA AGENCY', NULL, 'DIRECT', NULL),
(46, 2, 'SUKIA', '6', 'LCV.6', 'WB73B7316', '6200', '2019-03-06 11:01:09', '2019-03-06 11:01:09', '8906850150', 'JAI MAHAKAL DISTIBUTORS', NULL, 'DIRECT', NULL),
(47, 2, 'ASANSOL', '15', 'HCV.15', 'WB37D6668', '16800', '2019-03-06 11:01:09', '2019-03-06 11:01:09', '9933680190', 'RELIANCE RETAIL', NULL, 'PATNA BUXAR ROADLINE', NULL),
(48, 2, 'BAGAHA', '15', 'HCV.15', 'UP21BN4985', '24500', '2019-03-06 11:01:09', '2019-03-06 11:01:09', '7500835586', 'PRIYA TRADERS', NULL, 'UP BENGAL ROADLINE', NULL),
(49, 2, 'BETTIAH', '15', 'HCV.15', 'UP21BN3884', '23000', '2019-03-06 11:01:09', '2019-03-06 11:01:09', '9759791886', 'KD FOOD', NULL, 'UP BENGAL ROADLINE', NULL),
(123, 4, 'DARJEELING', '6', 'LCV.6', 'WB73B6290', '6200', '2019-03-07 09:06:54', '2019-03-07 09:06:54', '', 'HIMALYA AGENCY', NULL, 'DIRECT', NULL),
(124, 4, 'DARJEELING', '6', 'LCV.6', '', '', '2019-03-07 09:06:54', '2019-03-07 09:06:54', '', 'FUTURE RETAIL LTD', NULL, '', NULL),
(125, 4, 'ASANSOL', '16', 'HCV.16', '', '', '2019-03-07 09:06:54', '2019-03-07 09:06:54', '', 'HCCBPL', NULL, '', NULL),
(126, 4, 'ASANSOL', '16', 'HCV.16', '', '', '2019-03-07 09:06:54', '2019-03-07 09:06:54', '', 'HCCBPL', NULL, '', NULL),
(127, 4, 'BANKURA', '15', 'HCV.15', 'WB37C0388', '19000', '2019-03-07 09:06:54', '2019-03-07 09:06:54', '8670661063', 'KK ENT', NULL, 'MAA SHANTI ROADWAYS', NULL),
(128, 4, 'SHEOHAR', '16', 'HCV.16', 'WB23C2608', '21500', '2019-03-07 09:06:54', '2019-03-07 09:06:54', '7047369192', 'ANAND TRADERS', NULL, '', NULL),
(129, 4, 'SHEOHAR', '15', 'HCV.15', 'HR69A0939', '22000', '2019-03-07 09:06:54', '2019-03-07 09:06:54', '9991654535', 'MAA AMBEY ENTERPRISES', NULL, 'PUNJAB GOLDEN TRANSPORT CO', NULL),
(130, 4, 'MUZAFFARPUR', '20', 'HCV.20', 'WB73D6936', '21000', '2019-03-07 09:06:54', '2019-03-07 09:06:54', '', 'HCCBPL', NULL, 'SS FREIGHT CARRIER', NULL),
(131, 4, 'MUZAFFARPUR', '20', 'HCV.20', 'NL01K7974', '21000', '2019-03-07 09:06:54', '2019-03-07 09:06:54', '9903190071', 'HCCBPL', NULL, 'PATNA BUXAR ROADLINE', NULL),
(132, 4, 'MOTHABARI', '9', 'LCV.9', 'WB57A8428', '7800', '2019-03-07 09:06:54', '2019-03-07 09:06:54', '7679849307', 'MAA DURGA MISTHAN BHANDAR', NULL, 'BOSE ROADWAYS', NULL),
(133, 4, 'SITAMARHI', '15', 'HCV.15', 'WB41H1520', '21500', '2019-03-07 09:06:54', '2019-03-07 09:06:54', '9593154942', 'ARADHANA ENTERPRISES', NULL, 'BIHAR ROADLINE', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `indent_child`
--

CREATE TABLE `indent_child` (
  `id` int(10) NOT NULL,
  `indent_id` int(10) DEFAULT NULL,
  `destination` varchar(255) DEFAULT NULL,
  `tonnage` varchar(255) DEFAULT NULL,
  `truck_type` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `truck_type_id` int(10) DEFAULT NULL,
  `consignee` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `indent_child`
--

INSERT INTO `indent_child` (`id`, `indent_id`, `destination`, `tonnage`, `truck_type`, `created_at`, `updated_at`, `truck_type_id`, `consignee`) VALUES
(58, 1, 'SUKIA', '6', 'LCV.6', '2019-03-06 08:08:40', '2019-03-06 08:08:40', 1, 'JAI MAHAKAL DISTIBUTORS'),
(59, 1, 'ASANSOL', '15', 'HCV.15', '2019-03-06 08:08:40', '2019-03-06 08:08:40', 3, 'RELIANCE RETAIL'),
(60, 1, 'BAGAHA', '15', 'HCV.15', '2019-03-06 08:08:40', '2019-03-06 08:08:40', 3, 'PRIYA TRADERS'),
(61, 1, 'BETTIAH', '15', 'HCV.15', '2019-03-06 08:08:40', '2019-03-06 08:08:40', 3, 'KD FOOD'),
(81, 3, 'DARJEELING', '6', 'LCV.6', '2019-03-07 07:52:33', '2019-03-07 07:52:33', 1, 'HIMALYA AGENCY'),
(82, 3, 'DARJEELING', '6', 'LCV.6', '2019-03-07 07:52:33', '2019-03-07 07:52:33', 1, 'FUTURE RETAIL LTD'),
(83, 3, 'ASANSOL', '16', 'HCV.16', '2019-03-07 07:52:33', '2019-03-07 07:52:33', 2, 'HCCBPL'),
(84, 3, 'ASANSOL', '16', 'HCV.16', '2019-03-07 07:52:33', '2019-03-07 07:52:33', 2, 'HCCBPL'),
(85, 3, 'BANKURA', '15', 'HCV.15', '2019-03-07 07:52:33', '2019-03-07 07:52:33', 3, 'KK ENT'),
(86, 3, 'SHEOHAR', '16', 'HCV.16', '2019-03-07 07:52:33', '2019-03-07 07:52:33', 2, 'ANAND TRADERS'),
(87, 3, 'SHEOHAR', '15', 'HCV.15', '2019-03-07 07:52:33', '2019-03-07 07:52:33', 3, 'MAA AMBEY ENTERPRISES'),
(88, 3, 'MUZAFFARPUR', '20', 'HCV.20', '2019-03-07 07:52:33', '2019-03-07 07:52:33', 4, 'HCCBPL'),
(89, 3, 'MUZAFFARPUR', '20', 'HCV.20', '2019-03-07 07:52:33', '2019-03-07 07:52:33', 4, 'HCCBPL'),
(90, 3, 'MOTHABARI', '9', 'LCV.9', '2019-03-07 07:52:33', '2019-03-07 07:52:33', 5, 'MAA DURGA MISTHAN BHANDAR'),
(91, 3, 'SITAMARHI', '15', 'HCV.15', '2019-03-07 07:52:33', '2019-03-07 07:52:33', 3, 'ARADHANA ENTERPRISES');

-- --------------------------------------------------------

--
-- Table structure for table `indent_placement`
--

CREATE TABLE `indent_placement` (
  `id` int(10) NOT NULL,
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
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `indent_placement`
--

INSERT INTO `indent_placement` (`id`, `indent_id`, `indent_no`, `indent_placement_date`, `origin`, `branch_code`, `party_code`, `consignor_name`, `vehicle_no`, `tonnage`, `rate`, `per_tone_amount`, `loading_staff`, `cancel`, `remarks`, `created_at`, `updated_at`) VALUES
(2, '1', 'IN0001', '2019-03-06', 'FATAPUKUR', '1101', '11', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-03-06 08:02:45', '2019-03-06 11:01:09'),
(4, '3', 'IN0002', '2019-03-07', 'FATAPUKUR', '1101', '11', 'HINDUSTAN COCA-COLA BEVERAGES PVT. LTD.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-03-07 08:56:19', '2019-03-07 09:06:54');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `indent`
--
ALTER TABLE `indent`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`consignor_name`);

--
-- Indexes for table `indentplacement_child`
--
ALTER TABLE `indentplacement_child`
  ADD PRIMARY KEY (`id`),
  ADD KEY `indentplacement_id` (`indentplacement_id`);

--
-- Indexes for table `indent_child`
--
ALTER TABLE `indent_child`
  ADD PRIMARY KEY (`id`),
  ADD KEY `indent` (`indent_id`);

--
-- Indexes for table `indent_placement`
--
ALTER TABLE `indent_placement`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `indent`
--
ALTER TABLE `indent`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `indentplacement_child`
--
ALTER TABLE `indentplacement_child`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=134;

--
-- AUTO_INCREMENT for table `indent_child`
--
ALTER TABLE `indent_child`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=92;

--
-- AUTO_INCREMENT for table `indent_placement`
--
ALTER TABLE `indent_placement`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `indentplacement_child`
--
ALTER TABLE `indentplacement_child`
  ADD CONSTRAINT `indentplacement_id` FOREIGN KEY (`indentplacement_id`) REFERENCES `indent_placement` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `indent_child`
--
ALTER TABLE `indent_child`
  ADD CONSTRAINT `indent` FOREIGN KEY (`indent_id`) REFERENCES `indent` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
