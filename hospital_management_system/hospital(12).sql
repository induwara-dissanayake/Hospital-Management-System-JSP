-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 30, 2025 at 10:30 PM
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
-- Table structure for table `attendance_log`
--

CREATE TABLE `attendance_log` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `login_time` datetime NOT NULL DEFAULT current_timestamp(),
  `logout_time` datetime DEFAULT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'Present'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `attendance_log`
--

INSERT INTO `attendance_log` (`id`, `user_id`, `login_time`, `logout_time`, `status`) VALUES
(1, 1, '2025-04-30 21:43:07', NULL, 'Present'),
(2, 2, '2025-04-30 21:43:24', NULL, 'Present'),
(3, 1, '2025-04-30 21:45:06', NULL, 'Present'),
(4, 3, '2025-04-30 21:45:38', NULL, 'Present'),
(5, 2, '2025-04-30 21:54:46', NULL, 'Present'),
(6, 2, '2025-04-30 21:57:15', NULL, 'Present'),
(7, 2, '2025-04-30 21:58:11', NULL, 'Present'),
(8, 2, '2025-04-30 22:07:27', NULL, 'Present'),
(9, 1, '2025-04-30 22:07:39', NULL, 'Present'),
(10, 2, '2025-04-30 22:13:46', NULL, 'Present'),
(11, 2, '2025-05-01 01:46:37', NULL, 'Present'),
(12, 3, '2025-05-01 01:53:39', NULL, 'Present'),
(13, 4, '2025-05-01 01:55:06', NULL, 'Present'),
(14, 1, '2025-05-01 01:55:31', NULL, 'Present');

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
-- Table structure for table `doctor_patient_illness_clinic`
--

CREATE TABLE `doctor_patient_illness_clinic` (
  `order_id` int(11) NOT NULL,
  `illness` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `doctor_patient_illness_opd`
--

CREATE TABLE `doctor_patient_illness_opd` (
  `order_id` int(11) NOT NULL,
  `illness` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `doctor_patient_prescription_clinic`
--

CREATE TABLE `doctor_patient_prescription_clinic` (
  `order_id` int(11) NOT NULL,
  `doctor_id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `clinic_id` int(11) NOT NULL,
  `prescription_id` int(11) NOT NULL,
  `routine` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `days` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `doctor_patient_prescription_opd`
--

CREATE TABLE `doctor_patient_prescription_opd` (
  `order_id` int(11) NOT NULL,
  `doctor_id` int(11) NOT NULL,
  `prescription_id` int(11) NOT NULL,
  `routine` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
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
  `return_date` date DEFAULT NULL,
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
-- Table structure for table `doctor_prescription`
--

CREATE TABLE `doctor_prescription` (
  `id` int(11) NOT NULL,
  `prescription` varchar(100) NOT NULL,
  `type` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `doctor_prescription`
--

INSERT INTO `doctor_prescription` (`id`, `prescription`, `type`) VALUES
(9, 'Salbutamol', '0'),
(10, 'Vitamin D', '0'),
(11, 'qqq', '0'),
(12, 'xxxxx', '0'),
(15, 'ane manda', '0'),
(16, 'qqq', 'Tablet'),
(17, 'fewgwegweg', '1'),
(18, 'bvvvvswvwevw', 'Drops');

-- --------------------------------------------------------

--
-- Table structure for table `medicine`
--

CREATE TABLE `medicine` (
  `medicine_name` varchar(20) NOT NULL,
  `stock_ available` int(11) NOT NULL,
  `dosage` varchar(50) NOT NULL,
  `prescribed_for` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `medicine`
--

INSERT INTO `medicine` (`medicine_name`, `stock_ available`, `dosage`, `prescribed_for`) VALUES
('Amoxicillin', 80, '250 mg, 3/day', 'Bacterial infections'),
('Atorvastatin', 95, '10 mg, 1/day', 'High cholesterol'),
('Azithromycin', 40, '500 mg, 1/day', 'Throat infections, Pneumonia'),
('Cetirizine', 200, '10 mg, 1/day', ' Allergies, Cold'),
('Clopidogrel', 60, '75 mg, 1/day', 'Preventing strokes, heart attacks'),
('Diclofenac', 75, '50 mg, 2/day', 'Pain, Inflammation'),
('Doxycycline', 50, '100 mg, 2/day', 'Bacterial infections, Acne'),
('Ibuprofen', 90, '400 mg, 1 tablet', 'Inflammation, Pain'),
('Insulin (Rapid-Act)', 25, 'As prescribed', 'Diabetes (Type 1 & advanced Type 2)'),
('Iron Supplements', 160, '100 mg, 1/day', 'Anemia, Iron deficiency'),
('Levothyroxine', 130, '50 mcg, 1/day', 'Hypothyroidism'),
('Lorazepam', 40, '1 mg, as needed', 'Anxiety, Sleep disorders'),
('Losartan', 100, '50 mg, 1/day', 'High blood pressure'),
('Metformin', 120, '500 mg, 2/day', 'Type 2 Diabetes'),
('Montelukast', 70, '10 mg, 1/day', 'Asthma, Allergic rhinitis'),
('Omeprazole', 60, '20 mg, 1/day', 'Acid reflux, Ulcers'),
('Pantoprazole', 110, '40 mg, 1/day', 'Acid reflux, GERD'),
('Paracetamol', 150, '500 mg, 1 tablet', 'Fever, Pain relief'),
('Ranitidine', 45, '150 mg, 2/day', 'Ulcers, Acid indigestion'),
('Salbutamol Inhaler', 30, '100 mcg, 2 puffs', 'Asthma, Bronchospasm');

-- --------------------------------------------------------

--
-- Table structure for table `reception_patient_clinic_records`
--

CREATE TABLE `reception_patient_clinic_records` (
  `id` int(11) NOT NULL,
  `tolken_no` int(11) NOT NULL,
  `clinic_id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `doctor_complete` int(11) NOT NULL DEFAULT 0,
  `counter_complete` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reception_patient_opd_record`
--

CREATE TABLE `reception_patient_opd_record` (
  `id` int(11) NOT NULL,
  `patient_name` varchar(40) NOT NULL,
  `patient_age` int(11) NOT NULL,
  `tolken_no` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reception_patient_registration`
--

CREATE TABLE `reception_patient_registration` (
  `id` int(11) NOT NULL,
  `patient_name` varchar(100) NOT NULL,
  `patient_dob` date NOT NULL,
  `clinic_id` int(11) NOT NULL,
  `patient_address` varchar(100) NOT NULL,
  `patient_nic` varchar(20) NOT NULL,
  `patient_contact_no` int(10) NOT NULL,
  `patient_guardian_name` varchar(100) DEFAULT NULL,
  `patient_guardian_contact_no` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `role_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `role_name`) VALUES
(1, 'Admin'),
(2, 'Doctor'),
(4, 'Pharmacist'),
(3, 'Receptionist');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `role_id` tinyint(3) UNSIGNED NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `password`, `role_id`, `created_at`, `updated_at`) VALUES
(1, 'Isuru', 'admin', '1234', 1, '2025-04-29 19:38:04', '2025-04-29 19:38:04'),
(2, 'Induwara', 'doctor', '1234', 2, '2025-04-29 19:38:04', '2025-04-29 19:38:04'),
(3, 'Reception', 'reception', '1234', 3, '2025-04-29 19:38:04', '2025-04-29 19:38:04'),
(4, 'Pharmacy', 'pharmacy', '1234', 4, '2025-04-29 19:38:04', '2025-04-29 19:38:04');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attendance_log`
--
ALTER TABLE `attendance_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `doctor_clinic_department`
--
ALTER TABLE `doctor_clinic_department`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `doctor_patient_prescription_clinic`
--
ALTER TABLE `doctor_patient_prescription_clinic`
  ADD KEY `fk_presid` (`prescription_id`),
  ADD KEY `fk_docid` (`doctor_id`),
  ADD KEY `fk_orderid` (`order_id`);

--
-- Indexes for table `doctor_prescription`
--
ALTER TABLE `doctor_prescription`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `medicine`
--
ALTER TABLE `medicine`
  ADD PRIMARY KEY (`medicine_name`);

--
-- Indexes for table `reception_patient_clinic_records`
--
ALTER TABLE `reception_patient_clinic_records`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reception_patient_opd_record`
--
ALTER TABLE `reception_patient_opd_record`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reception_patient_registration`
--
ALTER TABLE `reception_patient_registration`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `role_name` (`role_name`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `role_id` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attendance_log`
--
ALTER TABLE `attendance_log`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `doctor_clinic_department`
--
ALTER TABLE `doctor_clinic_department`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `doctor_prescription`
--
ALTER TABLE `doctor_prescription`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `reception_patient_clinic_records`
--
ALTER TABLE `reception_patient_clinic_records`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reception_patient_opd_record`
--
ALTER TABLE `reception_patient_opd_record`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reception_patient_registration`
--
ALTER TABLE `reception_patient_registration`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `doctor_patient_prescription_clinic`
--
ALTER TABLE `doctor_patient_prescription_clinic`
  ADD CONSTRAINT `fk_orderid` FOREIGN KEY (`order_id`) REFERENCES `opd_order` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
