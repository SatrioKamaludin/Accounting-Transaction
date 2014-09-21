-- phpMyAdmin SQL Dump
-- version 4.1.6
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Sep 21, 2014 at 06:39 PM
-- Server version: 5.6.16
-- PHP Version: 5.5.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `shipment`
--

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE IF NOT EXISTS `country` (
  `country_id` int(2) NOT NULL,
  `country_name` varchar(20) NOT NULL,
  PRIMARY KEY (`country_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `country`
--

INSERT INTO `country` (`country_id`, `country_name`) VALUES
(1, 'Indonesia'),
(2, 'Brunei'),
(3, 'Laos'),
(4, 'Cambodia'),
(5, 'Malaysia'),
(6, 'Burma'),
(7, 'Philippines'),
(8, 'Singapore'),
(9, 'Thailand'),
(10, 'Vietnam');

-- --------------------------------------------------------

--
-- Table structure for table `gender_type`
--

CREATE TABLE IF NOT EXISTS `gender_type` (
  `gender_type_id` int(1) NOT NULL,
  `description` varchar(10) NOT NULL,
  PRIMARY KEY (`gender_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `gender_type`
--

INSERT INTO `gender_type` (`gender_type_id`, `description`) VALUES
(1, 'Pria'),
(2, 'Wanita');

-- --------------------------------------------------------

--
-- Table structure for table `marital_status_type`
--

CREATE TABLE IF NOT EXISTS `marital_status_type` (
  `marital_status_type_id` int(1) NOT NULL,
  `description` varchar(10) NOT NULL,
  PRIMARY KEY (`marital_status_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `marital_status_type`
--

INSERT INTO `marital_status_type` (`marital_status_type_id`, `description`) VALUES
(1, 'Lajang'),
(2, 'Menikah'),
(3, 'Duda'),
(4, 'Janda');

-- --------------------------------------------------------

--
-- Table structure for table `organization`
--

CREATE TABLE IF NOT EXISTS `organization` (
  `organization_id` int(10) NOT NULL,
  `organization_name` varchar(50) NOT NULL,
  `organization_role` int(2) NOT NULL,
  PRIMARY KEY (`organization_id`),
  KEY `organization_role` (`organization_role`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `organization`
--

INSERT INTO `organization` (`organization_id`, `organization_name`, `organization_role`) VALUES
(1, 'PT. AKSARA', 1);

-- --------------------------------------------------------

--
-- Table structure for table `organization_role`
--

CREATE TABLE IF NOT EXISTS `organization_role` (
  `organization_role_id` int(1) NOT NULL,
  `description` varchar(30) NOT NULL,
  `organization_unit_id` int(2) NOT NULL,
  PRIMARY KEY (`organization_role_id`),
  KEY `organization_unit_id` (`organization_unit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `organization_role`
--

INSERT INTO `organization_role` (`organization_role_id`, `description`, `organization_unit_id`) VALUES
(1, 'Partner', 1),
(2, 'Partner', 2),
(3, 'Partner', 3),
(4, 'Partner', 4),
(5, 'Supplier', 1),
(6, 'Supplier', 2),
(7, 'Supplier', 3),
(8, 'Supplier', 4),
(9, 'Household', 1),
(10, 'Household', 2),
(11, 'Household', 3),
(12, 'Household', 4),
(13, 'Personal', 4),
(14, 'Internal Organization', 1),
(15, 'Internal Organization', 2),
(16, 'Internal Organization', 3),
(17, 'Internal Organization', 4);

-- --------------------------------------------------------

--
-- Table structure for table `organization_unit`
--

CREATE TABLE IF NOT EXISTS `organization_unit` (
  `organization_unit_id` int(2) NOT NULL,
  `description` varchar(40) NOT NULL,
  PRIMARY KEY (`organization_unit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `organization_unit`
--

INSERT INTO `organization_unit` (`organization_unit_id`, `description`) VALUES
(1, 'Parent Organization'),
(2, 'Department'),
(3, 'Division'),
(4, 'Other Organization U');

-- --------------------------------------------------------

--
-- Table structure for table `party`
--

CREATE TABLE IF NOT EXISTS `party` (
  `party_id` int(10) NOT NULL,
  `person_id` int(2) NOT NULL,
  `organization_id` int(2) NOT NULL,
  PRIMARY KEY (`party_id`),
  KEY `person_id` (`person_id`,`organization_id`),
  KEY `organization_id` (`organization_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `party`
--

INSERT INTO `party` (`party_id`, `person_id`, `organization_id`) VALUES
(1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `person`
--

CREATE TABLE IF NOT EXISTS `person` (
  `person_id` int(10) NOT NULL,
  `id_number` varchar(16) NOT NULL,
  `full_name` varchar(40) NOT NULL,
  `address` varchar(100) NOT NULL,
  `birth_date` date NOT NULL,
  `mother_maiden_name` varchar(30) NOT NULL,
  `comment` varchar(50) DEFAULT NULL,
  `gender_type_id` int(1) NOT NULL,
  `marital_status_type_id` int(1) NOT NULL,
  `country_id` int(2) NOT NULL,
  PRIMARY KEY (`person_id`),
  KEY `gender_type_id` (`gender_type_id`,`marital_status_type_id`),
  KEY `country_id` (`country_id`),
  KEY `country_id_2` (`country_id`),
  KEY `marital_status_type_id` (`marital_status_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `person`
--

INSERT INTO `person` (`person_id`, `id_number`, `full_name`, `address`, `birth_date`, `mother_maiden_name`, `comment`, `gender_type_id`, `marital_status_type_id`, `country_id`) VALUES
(1, '3310012209930005', 'Aji Tri Santoso', 'Jl. Kejaksaan Tinggi 128, Sukapura, Dayeuh Kolot.', '2014-09-22', 'n/a', 'admin', 1, 1, 1);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `organization`
--
ALTER TABLE `organization`
  ADD CONSTRAINT `fk_org_role` FOREIGN KEY (`organization_role`) REFERENCES `organization_role` (`organization_role_id`);

--
-- Constraints for table `organization_role`
--
ALTER TABLE `organization_role`
  ADD CONSTRAINT `fk_role_unit` FOREIGN KEY (`organization_unit_id`) REFERENCES `organization_unit` (`organization_unit_id`);

--
-- Constraints for table `party`
--
ALTER TABLE `party`
  ADD CONSTRAINT `fk_party_org` FOREIGN KEY (`organization_id`) REFERENCES `organization` (`organization_id`),
  ADD CONSTRAINT `fk_party_person` FOREIGN KEY (`person_id`) REFERENCES `person` (`person_id`);

--
-- Constraints for table `person`
--
ALTER TABLE `person`
  ADD CONSTRAINT `fk_person_country` FOREIGN KEY (`country_id`) REFERENCES `country` (`country_id`),
  ADD CONSTRAINT `fk_person_gender` FOREIGN KEY (`gender_type_id`) REFERENCES `gender_type` (`gender_type_ID`),
  ADD CONSTRAINT `fk_person_marital` FOREIGN KEY (`marital_status_type_id`) REFERENCES `marital_status_type` (`marital_status_type_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
