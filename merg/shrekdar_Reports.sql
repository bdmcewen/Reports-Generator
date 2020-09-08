-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 12, 2020 at 09:51 PM
-- Server version: 5.6.41-84.1
-- PHP Version: 7.2.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shrekdar_Reports`
--
CREATE DATABASE IF NOT EXISTS `shrekdar_Reports` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `shrekdar_Reports`;

-- --------------------------------------------------------

--
-- Table structure for table `APIType`
--

DROP TABLE IF EXISTS `APIType`;
CREATE TABLE `APIType` (
  `APITypeID` int(11) NOT NULL,
  `APIType` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `UserAPI`
--

DROP TABLE IF EXISTS `UserAPI`;
CREATE TABLE `UserAPI` (
  `UserAPIID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `TypeID` int(11) NOT NULL,
  `APIkey` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ClientID` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Users`
--

DROP TABLE IF EXISTS `Users`;
CREATE TABLE `Users` (
  `UserID` int(11) NOT NULL,
  `UserTypeID` int(11) NOT NULL,
  `InnName` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Password` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ViewID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Email` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `UserTypes`
--

DROP TABLE IF EXISTS `UserTypes`;
CREATE TABLE `UserTypes` (
  `UserTypeID` int(11) NOT NULL,
  `UserType` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `WebPages`
--

DROP TABLE IF EXISTS `WebPages`;
CREATE TABLE `WebPages` (
  `PageID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `URL` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `DateEnd` date NOT NULL,
  `DateBegin` date NOT NULL,
  `UserViewID` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `APIType`
--
ALTER TABLE `APIType`
  ADD PRIMARY KEY (`APITypeID`);

--
-- Indexes for table `UserAPI`
--
ALTER TABLE `UserAPI`
  ADD PRIMARY KEY (`UserAPIID`),
  ADD KEY `UserID` (`UserID`),
  ADD KEY `TypeID` (`TypeID`);

--
-- Indexes for table `Users`
--
ALTER TABLE `Users`
  ADD PRIMARY KEY (`UserID`),
  ADD KEY `UserTypeID` (`UserTypeID`);

--
-- Indexes for table `UserTypes`
--
ALTER TABLE `UserTypes`
  ADD PRIMARY KEY (`UserTypeID`);

--
-- Indexes for table `WebPages`
--
ALTER TABLE `WebPages`
  ADD PRIMARY KEY (`PageID`),
  ADD KEY `UserID` (`UserID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `APIType`
--
ALTER TABLE `APIType`
  MODIFY `APITypeID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `UserAPI`
--
ALTER TABLE `UserAPI`
  MODIFY `UserAPIID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Users`
--
ALTER TABLE `Users`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `UserTypes`
--
ALTER TABLE `UserTypes`
  MODIFY `UserTypeID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `WebPages`
--
ALTER TABLE `WebPages`
  MODIFY `PageID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `UserAPI`
--
ALTER TABLE `UserAPI`
  ADD CONSTRAINT `UserAPI_ibfk_1` FOREIGN KEY (`TypeID`) REFERENCES `APIType` (`APITypeID`),
  ADD CONSTRAINT `UserAPI_ibfk_2` FOREIGN KEY (`UserID`) REFERENCES `Users` (`UserID`);

--
-- Constraints for table `Users`
--
ALTER TABLE `Users`
  ADD CONSTRAINT `Users_ibfk_1` FOREIGN KEY (`UserTypeID`) REFERENCES `UserTypes` (`UserTypeID`);

--
-- Constraints for table `WebPages`
--
ALTER TABLE `WebPages`
  ADD CONSTRAINT `WebPages_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `Users` (`UserID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
