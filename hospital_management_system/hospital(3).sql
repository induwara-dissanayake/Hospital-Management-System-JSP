-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 16, 2025 at 11:45 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hospital`
--

-- --------------------------------------------------------

--
-- Table structure for table `clinic_order`
--

CREATE TABLE `clinic_order` (
  `id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `clinic_order`
--

INSERT INTO `clinic_order` (`id`, `patient_id`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);

-- --------------------------------------------------------

--
-- Table structure for table `doctor`
--

CREATE TABLE `doctor` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `adress` varchar(100) NOT NULL,
  `nic` varchar(100) NOT NULL,
  `licence` varchar(100) NOT NULL,
  `dob` date NOT NULL,
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `doctor`
--

INSERT INTO `doctor` (`id`, `name`, `adress`, `nic`, `licence`, `dob`, `email`) VALUES
(1, 'induwara', 'aa', 'aa', 'aa', '2025-04-01', 'aa');

-- --------------------------------------------------------

--
-- Table structure for table `doctor_login`
--

CREATE TABLE `doctor_login` (
  `doctor_id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `doctor_login`
--

INSERT INTO `doctor_login` (`doctor_id`, `username`, `password`) VALUES
(1, 'induwara', '1234');

-- --------------------------------------------------------

--
-- Table structure for table `doctor_patient_prescription_opd`
--

CREATE TABLE `doctor_patient_prescription_opd` (
  `order_id` int(11) NOT NULL,
  `doctor_id` int(11) NOT NULL,
  `prescription_id` int(11) NOT NULL,
  `routine_id` int(11) NOT NULL,
  `days` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `doctor_patient_report_clinic`
--

CREATE TABLE `doctor_patient_report_clinic` (
  `order_id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `sugar` int(11) NOT NULL,
  `bp` int(11) NOT NULL,
  `cholesterol` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `doctor_patient_report_opd`
--

CREATE TABLE `doctor_patient_report_opd` (
  `order_id` int(11) NOT NULL,
  `illness` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `doctor_prescription`
--

CREATE TABLE `doctor_prescription` (
  `id` int(11) NOT NULL,
  `prescription` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `doctor_routine`
--

CREATE TABLE `doctor_routine` (
  `id` int(11) NOT NULL,
  `routine` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `opd_order`
--

CREATE TABLE `opd_order` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `age` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `opd_order`
--

INSERT INTO `opd_order` (`id`, `name`, `age`) VALUES
(1, 'Alice Fernando', 32),
(2, 'Bob Silva', 45),
(3, 'Chathura Perera', 28),
(4, 'Dilani Jayasuriya', 37),
(5, 'Eranga Wijesinghe', 52),
(6, 'Fathima Nazeer', 24),
(7, 'Gihan Madushanka', 30),
(8, 'Hiruni Gunawardena', 41),
(9, 'Ishara Senanayake', 19),
(10, 'Janith Alwis', 60);

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE `patient` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `nic` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `patient`
--

INSERT INTO `patient` (`id`, `name`, `nic`) VALUES
(1, 'Kasun Perera', '901234567V'),
(2, 'Nimali Silva', '912345678V'),
(3, 'Tharindu Jayasena', '923456789V'),
(4, 'Saman Kumara', '933456789V'),
(5, 'Iresha Fernando', '943456789V'),
(6, 'Amal Weerasinghe', '953456789V'),
(7, 'Dilani Rathnayake', '963456789V'),
(8, 'Kavindu Senanayake', '973456789V'),
(9, 'Nirosha Dissanayake', '983456789V'),
(10, 'Mahesh Abeywickrama', '993456789V');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `clinic_order`
--
ALTER TABLE `clinic_order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_patientid` (`patient_id`);

--
-- Indexes for table `doctor`
--
ALTER TABLE `doctor`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `doctor_login`
--
ALTER TABLE `doctor_login`
  ADD KEY `fk_docid` (`doctor_id`);

--
-- Indexes for table `doctor_patient_prescription_opd`
--
ALTER TABLE `doctor_patient_prescription_opd`
  ADD KEY `fk_presid` (`prescription_id`),
  ADD KEY `fk_docid` (`doctor_id`),
  ADD KEY `fk_routinid` (`routine_id`);

--
-- Indexes for table `doctor_prescription`
--
ALTER TABLE `doctor_prescription`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `doctor_routine`
--
ALTER TABLE `doctor_routine`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `opd_order`
--
ALTER TABLE `opd_order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `clinic_order`
--
ALTER TABLE `clinic_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `doctor`
--
ALTER TABLE `doctor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `doctor_prescription`
--
ALTER TABLE `doctor_prescription`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `doctor_routine`
--
ALTER TABLE `doctor_routine`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `opd_order`
--
ALTER TABLE `opd_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `patient`
--
ALTER TABLE `patient`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `clinic_order`
--
ALTER TABLE `clinic_order`
  ADD CONSTRAINT `fk_patientid` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `doctor_login`
--
ALTER TABLE `doctor_login`
  ADD CONSTRAINT `fk_docid` FOREIGN KEY (`doctor_id`) REFERENCES `doctor` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `doctor_patient_prescription_opd`
--
ALTER TABLE `doctor_patient_prescription_opd`
  ADD CONSTRAINT `fk_routinid` FOREIGN KEY (`routine_id`) REFERENCES `doctor_routine` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
