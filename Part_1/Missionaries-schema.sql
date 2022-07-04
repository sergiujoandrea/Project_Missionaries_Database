-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: lefti.virtualcampus.ro
-- Generation Time: Apr 16, 2022 at 07:24 PM
-- Server version: 5.7.36-google-log
-- PHP Version: 7.3.31-1~deb10u1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lefti_joandreasergiu`
--

-- --------------------------------------------------------

--
-- Table structure for table `Addresses`
--

CREATE TABLE `Addresses` (
  `Address_ID` int(11) NOT NULL,
  `Line_1` varchar(45) NOT NULL,
  `Line_2` varchar(45) DEFAULT '',
  `Line_3` varchar(45) DEFAULT '',
  `City` varchar(45) NOT NULL,
  `Zip_or_Postcode` int(11) NOT NULL,
  `State_Province_County` varchar(45) NOT NULL,
  `Country_Code` int(11) NOT NULL,
  `Other_Details` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Churches`
--

CREATE TABLE `Churches` (
  `Church_ID` int(11) NOT NULL,
  `Address_ID` int(11) NOT NULL,
  `Church_Name` varchar(45) DEFAULT NULL,
  `Ministers_Name` varchar(45) DEFAULT NULL,
  `Contact_Details` varchar(45) DEFAULT NULL,
  `Other_Details` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Donations`
--

CREATE TABLE `Donations` (
  `Donation_ID` int(11) NOT NULL,
  `Donation_to_Church_ID` int(11) NOT NULL,
  `Donor_ID` int(11) NOT NULL,
  `Payment_Method_Code` int(11) NOT NULL,
  `Date_of_Donation` date NOT NULL,
  `Amount_of_Donation` float NOT NULL,
  `Payment_Method_Details` varchar(45) NOT NULL,
  `Other_Details` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Donors`
--

CREATE TABLE `Donors` (
  `Donor_ID` int(11) NOT NULL,
  `Donor_Details` varchar(45) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Missionaries`
--

CREATE TABLE `Missionaries` (
  `Missionary_ID` int(11) NOT NULL,
  `Address_ID` int(11) NOT NULL,
  `Church_ID` int(11) NOT NULL,
  `Gender_MF` varchar(45) NOT NULL,
  `Married_YN` varchar(45) NOT NULL,
  `Date_of_Birth` date NOT NULL,
  `First_Name` varchar(45) NOT NULL,
  `Middle_Name` varchar(45) DEFAULT '',
  `Last_Name` varchar(45) NOT NULL,
  `Cell_Mobile_Number` int(11) NOT NULL,
  `Email_Address` varchar(45) DEFAULT '',
  `Date_Joined_Church` date NOT NULL,
  `Date_Left_Church` date NOT NULL,
  `Other_Details` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Ref_Countries`
--

CREATE TABLE `Ref_Countries` (
  `Country_Code` int(11) NOT NULL,
  `Country_Name` varchar(45) NOT NULL,
  `Country_Description` varchar(250) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Ref_Payment_Methods`
--

CREATE TABLE `Ref_Payment_Methods` (
  `Payment_Method_Code` int(11) NOT NULL,
  `Payment_Method_Name eg Amex, Cash, DC, MC` varchar(45) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Service_Postings`
--

CREATE TABLE `Service_Postings` (
  `Posting_ID` int(11) NOT NULL,
  `Country_of_Service_Code` int(11) NOT NULL,
  `Address_Details` varchar(45) DEFAULT NULL,
  `Contact_Details` varchar(45) DEFAULT NULL,
  `Date_Service_From` date NOT NULL,
  `Date_Service_To` date NOT NULL,
  `Other_Details` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Addresses`
--
ALTER TABLE `Addresses`
  ADD PRIMARY KEY (`Address_ID`),
  ADD KEY `fk_Addresses_Ref_Countries_idx` (`Country_Code`);

--
-- Indexes for table `Churches`
--
ALTER TABLE `Churches`
  ADD PRIMARY KEY (`Church_ID`),
  ADD KEY `fk_Churches_Addresses1_idx` (`Address_ID`);

--
-- Indexes for table `Donations`
--
ALTER TABLE `Donations`
  ADD PRIMARY KEY (`Donation_ID`),
  ADD KEY `fk_Donations_Churches1_idx` (`Donation_to_Church_ID`),
  ADD KEY `fk_Donations_Donors1_idx` (`Donor_ID`),
  ADD KEY `fk_Donations_Ref_Payment_Methods1_idx` (`Payment_Method_Code`);

--
-- Indexes for table `Donors`
--
ALTER TABLE `Donors`
  ADD PRIMARY KEY (`Donor_ID`);

--
-- Indexes for table `Missionaries`
--
ALTER TABLE `Missionaries`
  ADD PRIMARY KEY (`Missionary_ID`),
  ADD KEY `fk_Missionaries_Churches1_idx` (`Church_ID`),
  ADD KEY `fk_Missionaries_Addresses1_idx` (`Address_ID`);

--
-- Indexes for table `Ref_Countries`
--
ALTER TABLE `Ref_Countries`
  ADD PRIMARY KEY (`Country_Code`);

--
-- Indexes for table `Ref_Payment_Methods`
--
ALTER TABLE `Ref_Payment_Methods`
  ADD PRIMARY KEY (`Payment_Method_Code`);

--
-- Indexes for table `Service_Postings`
--
ALTER TABLE `Service_Postings`
  ADD PRIMARY KEY (`Posting_ID`),
  ADD KEY `fk_Service_Postings_Ref_Countries1_idx` (`Country_of_Service_Code`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Addresses`
--
ALTER TABLE `Addresses`
  MODIFY `Address_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Churches`
--
ALTER TABLE `Churches`
  MODIFY `Church_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Donations`
--
ALTER TABLE `Donations`
  MODIFY `Donation_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Donors`
--
ALTER TABLE `Donors`
  MODIFY `Donor_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Missionaries`
--
ALTER TABLE `Missionaries`
  MODIFY `Missionary_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Ref_Payment_Methods`
--
ALTER TABLE `Ref_Payment_Methods`
  MODIFY `Payment_Method_Code` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Addresses`
--
ALTER TABLE `Addresses`
  ADD CONSTRAINT `fk_Addresses_Ref_Countries` FOREIGN KEY (`Country_Code`) REFERENCES `Ref_Countries` (`Country_Code`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `Churches`
--
ALTER TABLE `Churches`
  ADD CONSTRAINT `fk_Churches_Addresses1` FOREIGN KEY (`Address_ID`) REFERENCES `Addresses` (`Address_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `Donations`
--
ALTER TABLE `Donations`
  ADD CONSTRAINT `fk_Donations_Churches1` FOREIGN KEY (`Donation_to_Church_ID`) REFERENCES `Churches` (`Church_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Donations_Donors1` FOREIGN KEY (`Donor_ID`) REFERENCES `Donors` (`Donor_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Donations_Ref_Payment_Methods1` FOREIGN KEY (`Payment_Method_Code`) REFERENCES `Ref_Payment_Methods` (`Payment_Method_Code`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `Missionaries`
--
ALTER TABLE `Missionaries`
  ADD CONSTRAINT `fk_Missionaries_Addresses1` FOREIGN KEY (`Address_ID`) REFERENCES `Addresses` (`Address_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Missionaries_Churches1` FOREIGN KEY (`Church_ID`) REFERENCES `Churches` (`Church_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `Service_Postings`
--
ALTER TABLE `Service_Postings`
  ADD CONSTRAINT `fk_Service_Postings_Missionaries1` FOREIGN KEY (`Posting_ID`) REFERENCES `Missionaries` (`Missionary_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Service_Postings_Ref_Countries1` FOREIGN KEY (`Country_of_Service_Code`) REFERENCES `Ref_Countries` (`Country_Code`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
