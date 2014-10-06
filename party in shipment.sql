-- phpMyAdmin SQL Dump
-- version 4.1.6
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Oct 06, 2014 at 07:29 PM
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
(1, 'Male'),
(2, 'Female'),
(3, 'Male to Fe'),
(4, 'Female to '),
(5, 'Not Provid');

-- --------------------------------------------------------

--
-- Table structure for table `informal_organization`
--

CREATE TABLE IF NOT EXISTS `informal_organization` (
  `organization_id` int(11) NOT NULL,
  PRIMARY KEY (`organization_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `legal_organization`
--

CREATE TABLE IF NOT EXISTS `legal_organization` (
  `organization_id` int(11) NOT NULL,
  `federal_tax_id_num` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`organization_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='organization subtype';

--
-- Dumping data for table `legal_organization`
--

INSERT INTO `legal_organization` (`organization_id`, `federal_tax_id_num`) VALUES
(1, '1103120130');

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
  `party_id` int(11) NOT NULL,
  `organization_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`party_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `organization`
--

INSERT INTO `organization` (`party_id`, `organization_name`) VALUES
(1, 'Bentang Pustaka');

-- --------------------------------------------------------

--
-- Table structure for table `party`
--

CREATE TABLE IF NOT EXISTS `party` (
  `party_id` int(11) NOT NULL,
  PRIMARY KEY (`party_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `party`
--

INSERT INTO `party` (`party_id`) VALUES
(1);

-- --------------------------------------------------------

--
-- Table structure for table `person`
--

CREATE TABLE IF NOT EXISTS `person` (
  `party_id` int(11) NOT NULL,
  `id_number` varchar(16) NOT NULL,
  `full_name` varchar(40) NOT NULL,
  `address` varchar(100) NOT NULL,
  `birth_date` date NOT NULL,
  `mother_maiden_name` varchar(30) NOT NULL,
  `comment` varchar(50) DEFAULT NULL,
  `gender_type_id` int(1) NOT NULL,
  `marital_status_type_id` int(1) NOT NULL,
  `country_id` int(2) NOT NULL,
  PRIMARY KEY (`party_id`),
  KEY `gender_type_id` (`gender_type_id`,`marital_status_type_id`),
  KEY `country_id` (`country_id`),
  KEY `country_id_2` (`country_id`),
  KEY `marital_status_type_id` (`marital_status_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `person`
--

INSERT INTO `person` (`party_id`, `id_number`, `full_name`, `address`, `birth_date`, `mother_maiden_name`, `comment`, `gender_type_id`, `marital_status_type_id`, `country_id`) VALUES
(1, '33110323241212', 'Agatha Christie', 'Jl. Anggrek 26, Medan', '2014-10-08', 'Christie Hakim', 'loyal', 2, 1, 1);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `informal_organization`
--
ALTER TABLE `informal_organization`
  ADD CONSTRAINT `fk_org_inf` FOREIGN KEY (`organization_id`) REFERENCES `organization` (`party_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `legal_organization`
--
ALTER TABLE `legal_organization`
  ADD CONSTRAINT `fk_org` FOREIGN KEY (`organization_id`) REFERENCES `organization` (`party_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `organization`
--
ALTER TABLE `organization`
  ADD CONSTRAINT `fk_party_org` FOREIGN KEY (`party_id`) REFERENCES `party` (`party_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `person`
--
ALTER TABLE `person`
  ADD CONSTRAINT `fk_party` FOREIGN KEY (`party_id`) REFERENCES `party` (`party_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_person_country` FOREIGN KEY (`country_id`) REFERENCES `country` (`country_id`),
  ADD CONSTRAINT `fk_person_gender` FOREIGN KEY (`gender_type_id`) REFERENCES `gender_type` (`gender_type_ID`),
  ADD CONSTRAINT `fk_person_marital` FOREIGN KEY (`marital_status_type_id`) REFERENCES `marital_status_type` (`marital_status_type_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
