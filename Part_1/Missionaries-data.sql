-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: lefti.virtualcampus.ro
-- Generation Time: Apr 16, 2022 at 09:53 PM
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

--
-- Dumping data for table `Addresses`
--

INSERT INTO `Addresses` (`Address_ID`, `Line_1`, `Line_2`, `Line_3`, `City`, `Zip_or_Postcode`, `State_Province_County`, `Country_Code`, `Other_Details`) VALUES
(1, '735 Bld des Armées', 'SECAF Tokoin Séminaire', '', 'Lomé', 8395, 'Togo', 236, NULL),
(2, '15 Santuario Dr', '', '', 'Chimayo', 87522, 'New Mexico', 1, NULL),
(3, '3X83+3R3', '', '', 'Dengzhou', 474360, 'Neixiang', 86, NULL),
(4, 'VXXP+MCR', 'Pugima, Walelagama', '', 'Jayawijaya Regency', 99511, 'Papua', 675, NULL),
(5, '7HVR+JC2', '', '', 'Nsambya', 7106, 'Kampala', 256, NULL);

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

--
-- Dumping data for table `Churches`
--

INSERT INTO `Churches` (`Church_ID`, `Address_ID`, `Church_Name`, `Ministers_Name`, `Contact_Details`, `Other_Details`) VALUES
(1, 1, 'Eglise LA PORTE CHRETIENNE DU TOGO', ' Paul Vedzo', '+228 22 21 29 37', NULL),
(2, 2, 'Santuario de Chimayo', 'Francisco Fernández Valentín', '+1 505-351-9961', NULL),
(3, 3, 'Qianma Christian Church', 'Liang Fa', NULL, NULL),
(4, 4, 'Gereja Katolik Kristus Gembala Kita', 'Dennis Kabekabe', NULL, NULL),
(5, 5, 'St Peter\'s Catholic Church Nsambya', 'Dennis Kilama', '+256-753-433167', NULL);

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
  `Payment_Method_Details` varchar(45) DEFAULT '',
  `Other_Details` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Donations`
--

INSERT INTO `Donations` (`Donation_ID`, `Donation_to_Church_ID`, `Donor_ID`, `Payment_Method_Code`, `Date_of_Donation`, `Amount_of_Donation`, `Payment_Method_Details`, `Other_Details`) VALUES
(1, 1, 1, 1, '1899-07-09', 100, 'RON', NULL),
(2, 2, 2, 2, '1901-01-19', 200, 'EUR', NULL),
(3, 3, 3, 3, '1898-05-06', 345.98, 'MKD', NULL),
(4, 4, 4, 4, '1942-02-12', 34.6, 'GBP', NULL),
(5, 5, 5, 5, '1903-08-15', 56.99, 'USD', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `Donors`
--

CREATE TABLE `Donors` (
  `Donor_ID` int(11) NOT NULL,
  `Donor_Details` varchar(45) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Donors`
--

INSERT INTO `Donors` (`Donor_ID`, `Donor_Details`) VALUES
(1, 'Joandrea Sergiu-Catalin '),
(2, 'Gyenge Andrei'),
(3, 'Maralescu Beniamin'),
(4, 'Licurici Madalin Florentin'),
(5, 'Lazar Ruxandra Ioana');

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

--
-- Dumping data for table `Missionaries`
--

INSERT INTO `Missionaries` (`Missionary_ID`, `Address_ID`, `Church_ID`, `Gender_MF`, `Married_YN`, `Date_of_Birth`, `First_Name`, `Middle_Name`, `Last_Name`, `Cell_Mobile_Number`, `Email_Address`, `Date_Joined_Church`, `Date_Left_Church`, `Other_Details`) VALUES
(1, 1, 1, 'M', 'Y', '1874-07-29', 'John ', '', 'Harris', 223334455, 'john_harris@yahu.com', '1898-05-06', '1900-01-23', NULL),
(2, 2, 2, 'M', 'Y', '1852-09-29', 'Anton', '', 'Docher', 922399922, '', '1900-04-23', '1902-01-01', NULL),
(3, 3, 3, 'F', 'N', '1840-12-12', 'Charlotte', 'Digges \"Lottie\"', 'Moon', 9322434, '', '1873-07-22', '1912-03-04', NULL),
(4, 4, 4, 'F', 'N', '1914-02-23', 'Darlene ', 'Deibler', 'Rose', 34445559, '', '1940-02-04', '1945-09-23', NULL),
(5, 5, 5, 'F', 'N', '1875-02-21', 'Teresa', '', 'Kearney', 964322, '', '1902-12-02', '1905-02-12', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `Ref_Countries`
--

CREATE TABLE `Ref_Countries` (
  `Country_Code` int(11) NOT NULL,
  `Country_Name` varchar(45) NOT NULL,
  `Country_Description` varchar(250) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Ref_Countries`
--

INSERT INTO `Ref_Countries` (`Country_Code`, `Country_Name`, `Country_Description`) VALUES
(1, 'United States', 'The United States of America is a country primarily located in North America.'),
(86, 'China', 'China  reprezintă o regiune culturală puternic legată de civilizația antică ce a dominat aceste locuri. Această entitate multinațională se extinde în majoritatea Asiei de Est.'),
(236, 'Central Africa', 'Africa Centrală este o regiune care include următoarele țări ale continentului african: Burundi, Republica Centrafricană, Ciad, Republica Democrată Congo, Rwanda'),
(256, 'Uganda', 'Uganda sau oficial Republica Uganda, este o țară în estul Africii care se învecinează la est cu Kenya, la nord cu Sudanul de Sud, la vest cu Republica Democrată Congo, în sud-vest cu Rwanda iar în sud cu Tanzania. '),
(675, 'Papua New Guinea', 'Papua Noua Guinee este o țară insulară situată în vestul Oceanului Pacific, la nord de Australia și la est de Indonezia.');

-- --------------------------------------------------------

--
-- Table structure for table `Ref_Payment_Methods`
--

CREATE TABLE `Ref_Payment_Methods` (
  `Payment_Method_Code` int(11) NOT NULL,
  `Payment_Method_Name eg Amex, Cash, DC, MC` varchar(45) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Ref_Payment_Methods`
--

INSERT INTO `Ref_Payment_Methods` (`Payment_Method_Code`, `Payment_Method_Name eg Amex, Cash, DC, MC`) VALUES
(1, 'Cash'),
(2, 'Revolut'),
(3, 'Amex'),
(4, 'DC'),
(5, 'MC');

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
-- Dumping data for table `Service_Postings`
--

INSERT INTO `Service_Postings` (`Posting_ID`, `Country_of_Service_Code`, `Address_Details`, `Contact_Details`, `Date_Service_From`, `Date_Service_To`, `Other_Details`) VALUES
(1, 236, 'Might not have internet there', 'Contact via phone or email.', '1898-05-06', '1900-01-23', NULL),
(2, 1, ' Handover might not let you call', 'Contact via phone.', '1900-04-23', '1902-01-01', NULL),
(3, 86, ' Hot weather', 'Contact via phone.', '1873-07-22', '1912-03-04', NULL),
(4, 675, ' Wet weather', 'Contact via phone.', '1940-02-04', '1945-09-23', NULL),
(5, 256, ' Snowy weather', 'Contact via phone.', '1902-12-02', '1905-02-12', NULL);

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
  MODIFY `Address_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `Churches`
--
ALTER TABLE `Churches`
  MODIFY `Church_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `Donations`
--
ALTER TABLE `Donations`
  MODIFY `Donation_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `Donors`
--
ALTER TABLE `Donors`
  MODIFY `Donor_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `Missionaries`
--
ALTER TABLE `Missionaries`
  MODIFY `Missionary_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `Ref_Payment_Methods`
--
ALTER TABLE `Ref_Payment_Methods`
  MODIFY `Payment_Method_Code` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

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
