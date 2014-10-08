-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Sep 19, 2014 at 06:45 AM
-- Server version: 5.6.16
-- PHP Version: 5.5.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `shipments`
--

-- --------------------------------------------------------

--
-- Table structure for table `shipment`
--

CREATE TABLE IF NOT EXISTS `shipment` (
  `shipment ID` int(2) NOT NULL,
  `est_ship_date` date NOT NULL,
  `est_rdy_date` date NOT NULL,
  `est_arv_date` date NOT NULL,
  `act_ship_cost` int(9) NOT NULL,
  `last_cancel_date` date NOT NULL,
  `hand_instr` text NOT NULL,
  `last updated` date NOT NULL,
  PRIMARY KEY (`shipment ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `shipment item`
--

CREATE TABLE IF NOT EXISTS `shipment item` (
  `ship_itemseq id` int(2) NOT NULL,
  `quantity` int(3) NOT NULL,
  `content` text NOT NULL,
  PRIMARY KEY (`ship_itemseq id`),
  KEY `ship_itemseq id` (`ship_itemseq id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `shipment status`
--

CREATE TABLE IF NOT EXISTS `shipment status` (
  `shipment ID` int(2) NOT NULL,
  `date` date NOT NULL,
  `status` text NOT NULL,
  KEY `shipment ID` (`shipment ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `shipment item`
--
ALTER TABLE `shipment item`
  ADD CONSTRAINT `shipment item_ibfk_1` FOREIGN KEY (`ship_itemseq id`) REFERENCES `shipment` (`shipment ID`);

--
-- Constraints for table `shipment status`
--
ALTER TABLE `shipment status`
  ADD CONSTRAINT `FK_shipment ID` FOREIGN KEY (`shipment ID`) REFERENCES `shipment` (`shipment ID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
