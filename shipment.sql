-- phpMyAdmin SQL Dump
-- version 4.1.6
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Oct 08, 2014 at 12:30 PM
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
-- Table structure for table `contact_mechanism`
--

CREATE TABLE IF NOT EXISTS `contact_mechanism` (
  `contact_mechanism_id` int(11) NOT NULL,
  PRIMARY KEY (`contact_mechanism_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='contact parent';

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
-- Table structure for table `document`
--

CREATE TABLE IF NOT EXISTS `document` (
  `document_id` int(11) NOT NULL,
  `description` varchar(45) DEFAULT NULL,
  `document_type_Id` int(11) DEFAULT NULL,
  `shipment_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`document_id`),
  KEY `fk_doc_ship_idx` (`shipment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `document_type`
--

CREATE TABLE IF NOT EXISTS `document_type` (
  `document_type_id` int(11) NOT NULL,
  `description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`document_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `electronic_address`
--

CREATE TABLE IF NOT EXISTS `electronic_address` (
  `contact_mechanism_id` int(11) NOT NULL,
  `electronic_address_string` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`contact_mechanism_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `facility`
--

CREATE TABLE IF NOT EXISTS `facility` (
  `facility_id` int(11) NOT NULL,
  `facility_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`facility_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `fixed_asset`
--

CREATE TABLE IF NOT EXISTS `fixed_asset` (
  `fixed_asset_id` int(11) NOT NULL,
  `fixed_asset_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`fixed_asset_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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

-- --------------------------------------------------------

--
-- Table structure for table `postal_address`
--

CREATE TABLE IF NOT EXISTS `postal_address` (
  `contact_mechanism_id` int(11) NOT NULL,
  `address` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`contact_mechanism_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `shipment`
--

CREATE TABLE IF NOT EXISTS `shipment` (
  `shipment_id` int(11) NOT NULL,
  `estimated_ship_date` varchar(45) DEFAULT NULL,
  `estimated_ready_date` varchar(45) DEFAULT NULL,
  `estimated_arrival_date` varchar(45) DEFAULT NULL,
  `ship_cost` varchar(45) DEFAULT NULL,
  `latest_cancel_date` varchar(45) DEFAULT NULL,
  `handling_instruction` varchar(45) DEFAULT NULL,
  `last_updated` varchar(45) DEFAULT NULL,
  `party_id` int(11) DEFAULT NULL,
  `contact_mechanism_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`shipment_id`),
  KEY `fk_ship_party` (`party_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='parent shipment ';

-- --------------------------------------------------------

--
-- Table structure for table `shipment_item`
--

CREATE TABLE IF NOT EXISTS `shipment_item` (
  `shipment_item_id` int(11) NOT NULL,
  `quantity` varchar(45) DEFAULT NULL,
  `shipments_contents_description` varchar(45) DEFAULT NULL,
  `shipment_id` int(11) DEFAULT NULL,
  `product_name` varchar(45) DEFAULT NULL,
  `comment` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`shipment_item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `shipment_method_type`
--

CREATE TABLE IF NOT EXISTS `shipment_method_type` (
  `shipment_method_type_id` int(11) NOT NULL,
  `description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`shipment_method_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `shipment_route_segment`
--

CREATE TABLE IF NOT EXISTS `shipment_route_segment` (
  `shipment_route_segment_id` int(11) NOT NULL,
  `actual_start_datetime` datetime DEFAULT NULL,
  `actual_arrival_datetime` datetime DEFAULT NULL,
  `fuel used` varchar(45) DEFAULT NULL,
  `shipment_id` int(11) DEFAULT NULL,
  `shipment_method_type` int(11) DEFAULT NULL,
  `facility_id` int(11) DEFAULT NULL,
  `fixed_asset_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`shipment_route_segment_id`),
  KEY `fk_route_type_idx` (`shipment_method_type`),
  KEY `ffk_route_ship_idx` (`shipment_id`),
  KEY `fk_fac_route_idx` (`facility_id`),
  KEY `fk_fix_route_idx` (`fixed_asset_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `shipment_status`
--

CREATE TABLE IF NOT EXISTS `shipment_status` (
  `shipment_status_id` int(11) NOT NULL,
  `shipment_id` int(11) DEFAULT NULL,
  `shipment_status_type_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`shipment_status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `shiptment_status_type`
--

CREATE TABLE IF NOT EXISTS `shiptment_status_type` (
  `shiptment_status_type_id` int(11) NOT NULL,
  `shipment_type` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`shiptment_status_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `telecommunications_number`
--

CREATE TABLE IF NOT EXISTS `telecommunications_number` (
  `contact_mechanism_id` int(11) NOT NULL,
  `contact_number` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`contact_mechanism_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `document`
--
ALTER TABLE `document`
  ADD CONSTRAINT `fk_doc_type` FOREIGN KEY (`document_id`) REFERENCES `document_type` (`document_type_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_doc_ship` FOREIGN KEY (`shipment_id`) REFERENCES `shipment` (`shipment_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `electronic_address`
--
ALTER TABLE `electronic_address`
  ADD CONSTRAINT `fk_contact_email` FOREIGN KEY (`contact_mechanism_id`) REFERENCES `contact_mechanism` (`contact_mechanism_id`) ON DELETE CASCADE ON UPDATE CASCADE;

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

--
-- Constraints for table `postal_address`
--
ALTER TABLE `postal_address`
  ADD CONSTRAINT `fk_contact_postal` FOREIGN KEY (`contact_mechanism_id`) REFERENCES `contact_mechanism` (`contact_mechanism_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shipment`
--
ALTER TABLE `shipment`
  ADD CONSTRAINT `fk_ship_con` FOREIGN KEY (`shipment_id`) REFERENCES `contact_mechanism` (`contact_mechanism_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_ship_party` FOREIGN KEY (`party_id`) REFERENCES `party` (`party_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shipment_item`
--
ALTER TABLE `shipment_item`
  ADD CONSTRAINT `fk_item_ship` FOREIGN KEY (`shipment_item_id`) REFERENCES `shipment` (`shipment_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `shipment_route_segment`
--
ALTER TABLE `shipment_route_segment`
  ADD CONSTRAINT `fk_fix_route` FOREIGN KEY (`fixed_asset_id`) REFERENCES `fixed_asset` (`fixed_asset_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `ffk_route_ship` FOREIGN KEY (`shipment_id`) REFERENCES `shipment` (`shipment_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_fac_route` FOREIGN KEY (`facility_id`) REFERENCES `facility` (`facility_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_route_type` FOREIGN KEY (`shipment_method_type`) REFERENCES `shipment_method_type` (`shipment_method_type_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `shipment_status`
--
ALTER TABLE `shipment_status`
  ADD CONSTRAINT `fk_type_stat` FOREIGN KEY (`shipment_status_id`) REFERENCES `shiptment_status_type` (`shiptment_status_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_ship_stat` FOREIGN KEY (`shipment_status_id`) REFERENCES `shipment` (`shipment_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `telecommunications_number`
--
ALTER TABLE `telecommunications_number`
  ADD CONSTRAINT `fk_contact_tele` FOREIGN KEY (`contact_mechanism_id`) REFERENCES `contact_mechanism` (`contact_mechanism_id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
