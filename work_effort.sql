-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Sep 15, 2014 at 07:09 AM
-- Server version: 5.6.16
-- PHP Version: 5.5.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `work effort`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity`
--

CREATE TABLE IF NOT EXISTS `activity` (
  `activity ID` int(3) NOT NULL AUTO_INCREMENT,
  `activity name` text NOT NULL,
  PRIMARY KEY (`activity ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `maintenance`
--

CREATE TABLE IF NOT EXISTS `maintenance` (
  `maintenance ID` int(3) NOT NULL AUTO_INCREMENT,
  `maintenance name` text NOT NULL,
  PRIMARY KEY (`maintenance ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `phase`
--

CREATE TABLE IF NOT EXISTS `phase` (
  `phase ID` int(3) NOT NULL AUTO_INCREMENT,
  `phase name` text NOT NULL,
  PRIMARY KEY (`phase ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `production run`
--

CREATE TABLE IF NOT EXISTS `production run` (
  `production ID` int(3) NOT NULL AUTO_INCREMENT,
  `production name` text NOT NULL,
  PRIMARY KEY (`production ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `program`
--

CREATE TABLE IF NOT EXISTS `program` (
  `program ID` int(3) NOT NULL AUTO_INCREMENT,
  `program name` text NOT NULL,
  PRIMARY KEY (`program ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `project`
--

CREATE TABLE IF NOT EXISTS `project` (
  `project ID` int(3) NOT NULL AUTO_INCREMENT,
  `project name` text NOT NULL,
  PRIMARY KEY (`project ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `research`
--

CREATE TABLE IF NOT EXISTS `research` (
  `research ID` int(3) NOT NULL AUTO_INCREMENT,
  `research name` text NOT NULL,
  PRIMARY KEY (`research ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `task`
--

CREATE TABLE IF NOT EXISTS `task` (
  `task ID` int(3) NOT NULL AUTO_INCREMENT,
  `task name` text NOT NULL,
  PRIMARY KEY (`task ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `work effort`
--

CREATE TABLE IF NOT EXISTS `work effort` (
  `work effort ID` int(3) NOT NULL AUTO_INCREMENT,
  `activity ID` int(3) NOT NULL,
  `phase ID` int(3) NOT NULL,
  `program ID` int(3) NOT NULL,
  `project ID` int(3) NOT NULL,
  `task ID` int(3) NOT NULL,
  PRIMARY KEY (`work effort ID`),
  KEY `work effort ID` (`work effort ID`,`activity ID`,`phase ID`,`program ID`,`project ID`,`task ID`),
  KEY `work effort ID_2` (`work effort ID`),
  KEY `activity ID` (`activity ID`),
  KEY `phase ID` (`phase ID`),
  KEY `program ID` (`program ID`),
  KEY `project ID` (`project ID`),
  KEY `task ID` (`task ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `work effort purpose type`
--

CREATE TABLE IF NOT EXISTS `work effort purpose type` (
  `ID` int(3) NOT NULL AUTO_INCREMENT,
  `type` text NOT NULL,
  `maintenance ID` int(3) NOT NULL,
  `work flow ID` int(3) NOT NULL,
  `production ID` int(3) NOT NULL,
  `research ID` int(3) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `maintenance ID` (`maintenance ID`),
  KEY `work flow ID` (`work flow ID`),
  KEY `production ID` (`production ID`),
  KEY `research ID` (`research ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `work flow`
--

CREATE TABLE IF NOT EXISTS `work flow` (
  `work flow ID` int(3) NOT NULL AUTO_INCREMENT,
  `description` text NOT NULL,
  PRIMARY KEY (`work flow ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `work effort`
--
ALTER TABLE `work effort`
  ADD CONSTRAINT `fk_work_task` FOREIGN KEY (`task ID`) REFERENCES `task` (`task ID`),
  ADD CONSTRAINT `fk_work_activity` FOREIGN KEY (`activity ID`) REFERENCES `activity` (`activity ID`),
  ADD CONSTRAINT `fk_work_phase` FOREIGN KEY (`phase ID`) REFERENCES `phase` (`phase ID`),
  ADD CONSTRAINT `fk_work_program` FOREIGN KEY (`program ID`) REFERENCES `program` (`program ID`),
  ADD CONSTRAINT `fk_work_project` FOREIGN KEY (`project ID`) REFERENCES `project` (`project ID`);

--
-- Constraints for table `work effort purpose type`
--
ALTER TABLE `work effort purpose type`
  ADD CONSTRAINT `fk_research` FOREIGN KEY (`research ID`) REFERENCES `research` (`research ID`),
  ADD CONSTRAINT `fk_maintenance` FOREIGN KEY (`maintenance ID`) REFERENCES `maintenance` (`maintenance ID`),
  ADD CONSTRAINT `fk_production` FOREIGN KEY (`production ID`) REFERENCES `production run` (`production ID`),
  ADD CONSTRAINT `fk_work flow` FOREIGN KEY (`work flow ID`) REFERENCES `work flow` (`work flow ID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
