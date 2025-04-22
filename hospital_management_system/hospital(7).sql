-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 22, 2025 at 07:55 PM
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
  `patient_id` int(11) NOT NULL,
  `clinic_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `clinic_order`
--

INSERT INTO `clinic_order` (`id`, `patient_id`, `clinic_id`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 2),
(5, 5, 5),
(6, 6, 4),
(7, 7, 2),
(8, 8, 1),
(9, 9, 3),
(10, 10, 5);

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
-- Table structure for table `doctor_attendance`
--

CREATE TABLE `doctor_attendance` (
  `doctor_id` int(11) NOT NULL,
  `time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `doctor_attendance`
--

INSERT INTO `doctor_attendance` (`doctor_id`, `time`) VALUES
(1, '2025-04-17 22:39:57'),
(1, '2025-04-17 22:41:55'),
(1, '2025-04-18 00:57:17'),
(1, '2025-04-18 01:03:57'),
(1, '2025-04-18 01:04:17'),
(1, '2025-04-18 01:05:23'),
(1, '2025-04-18 01:05:38'),
(1, '2025-04-18 11:22:48'),
(1, '2025-04-18 23:18:50'),
(1, '2025-04-19 21:48:32'),
(1, '2025-04-19 22:34:39'),
(1, '2025-04-19 23:37:17'),
(1, '2025-04-20 01:26:06'),
(1, '2025-04-20 11:18:29'),
(1, '2025-04-21 15:54:42'),
(1, '2025-04-21 19:32:56'),
(1, '2025-04-21 23:26:08'),
(1, '2025-04-22 14:22:11'),
(1, '2025-04-22 14:47:43'),
(1, '2025-04-22 14:48:55'),
(1, '2025-04-22 15:32:09'),
(1, '2025-04-22 21:39:30'),
(1, '2025-04-22 21:44:25'),
(1, '2025-04-22 21:46:51'),
(1, '2025-04-22 22:03:29'),
(1, '2025-04-22 22:55:25'),
(1, '2025-04-22 23:07:35'),
(1, '2025-04-22 23:16:25'),
(1, '2025-04-22 23:17:54'),
(1, '2025-04-22 23:19:15'),
(1, '2025-04-22 23:24:05'),
(1, '2025-04-22 23:25:33');

-- --------------------------------------------------------

--
-- Table structure for table `doctor_clinic_department`
--

CREATE TABLE `doctor_clinic_department` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `doctor_clinic_department`
--

INSERT INTO `doctor_clinic_department` (`id`, `name`) VALUES
(1, 'Eye'),
(2, '\r\nCardiology'),
(3, 'Gynecology'),
(4, '\r\nNeurology'),
(5, '\r\nPediatric');

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
  `patient_id` int(11) NOT NULL,
  `clinic_id` int(11) NOT NULL,
  `prescription_id` int(11) NOT NULL,
  `routine` int(11) NOT NULL,
  `days` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `doctor_patient_report_clinic`
--

CREATE TABLE `doctor_patient_report_clinic` (
  `order_id` int(11) NOT NULL,
  `doctor_id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `clinic_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `weight` varchar(100) DEFAULT NULL,
  `sugar_level` varchar(100) DEFAULT NULL,
  `bp` varchar(100) DEFAULT NULL,
  `lipid_profile` varchar(100) DEFAULT NULL,
  `hemoglobin` varchar(100) DEFAULT NULL,
  `vision` varchar(100) DEFAULT NULL,
  `eye_pressure` varchar(100) DEFAULT NULL,
  `vdrl` varchar(100) DEFAULT NULL,
  `hiv` varchar(100) DEFAULT NULL
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

--
-- Dumping data for table `doctor_prescription`
--

INSERT INTO `doctor_prescription` (`id`, `prescription`) VALUES
(1, 'Paracetamol'),
(2, 'Amoxicillin'),
(3, 'Ibuprofen'),
(4, 'Cetrizine'),
(5, 'Metformin'),
(6, 'Aspirin'),
(7, 'Loratadine'),
(8, 'Omeprazole'),
(9, 'Salbutamol'),
(10, 'Vitamin D');

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
-- Indexes for table `doctor_attendance`
--
ALTER TABLE `doctor_attendance`
  ADD KEY `fk_doctorid` (`doctor_id`);

--
-- Indexes for table `doctor_clinic_department`
--
ALTER TABLE `doctor_clinic_department`
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
  ADD KEY `fk_orderid` (`order_id`);

--
-- Indexes for table `doctor_prescription`
--
ALTER TABLE `doctor_prescription`
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
-- AUTO_INCREMENT for table `doctor_clinic_department`
--
ALTER TABLE `doctor_clinic_department`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `doctor_prescription`
--
ALTER TABLE `doctor_prescription`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

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
-- Constraints for table `doctor_attendance`
--
ALTER TABLE `doctor_attendance`
  ADD CONSTRAINT `fk_doctorid` FOREIGN KEY (`doctor_id`) REFERENCES `doctor` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `doctor_login`
--
ALTER TABLE `doctor_login`
  ADD CONSTRAINT `fk_docid` FOREIGN KEY (`doctor_id`) REFERENCES `doctor` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `doctor_patient_prescription_opd`
--
ALTER TABLE `doctor_patient_prescription_opd`
  ADD CONSTRAINT `fk_orderid` FOREIGN KEY (`order_id`) REFERENCES `opd_order` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
