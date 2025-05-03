-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 03, 2025 at 08:59 AM
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
(2, 2, '2025-04-30 21:43:24', '2025-05-02 12:42:04', 'Present'),
(3, 1, '2025-04-30 21:45:06', NULL, 'Present'),
(4, 3, '2025-04-30 21:45:38', NULL, 'Present'),
(5, 2, '2025-04-30 21:54:46', '2025-05-02 12:42:04', 'Present'),
(6, 2, '2025-04-30 21:57:15', '2025-05-02 12:42:04', 'Present'),
(7, 2, '2025-04-30 21:58:11', '2025-05-02 12:42:04', 'Present'),
(8, 2, '2025-04-30 22:07:27', '2025-05-02 12:42:04', 'Present'),
(9, 1, '2025-04-30 22:07:39', NULL, 'Present'),
(10, 2, '2025-04-30 22:13:46', '2025-05-02 12:42:04', 'Present'),
(11, 2, '2025-05-01 01:46:37', '2025-05-02 12:42:04', 'Present'),
(12, 3, '2025-05-01 01:53:39', NULL, 'Present'),
(13, 4, '2025-05-01 01:55:06', NULL, 'Present'),
(14, 1, '2025-05-01 01:55:31', NULL, 'Present'),
(15, 2, '2025-05-01 02:13:32', '2025-05-02 12:42:04', 'Present'),
(16, 2, '2025-05-01 02:26:51', '2025-05-02 12:42:04', 'Present'),
(17, 2, '2025-05-01 02:31:40', '2025-05-02 12:42:04', 'Present'),
(18, 2, '2025-05-01 20:56:24', '2025-05-02 12:42:04', 'Present'),
(19, 2, '2025-05-01 20:58:16', '2025-05-02 12:42:04', 'Present'),
(20, 3, '2025-05-02 10:10:08', NULL, 'Present'),
(21, 3, '2025-05-02 10:21:35', NULL, 'Present'),
(22, 3, '2025-05-02 10:22:19', NULL, 'Present'),
(23, 2, '2025-05-02 10:22:24', '2025-05-02 12:42:04', 'Present'),
(24, 3, '2025-05-02 10:22:42', NULL, 'Present'),
(25, 3, '2025-05-02 10:32:08', NULL, 'Present'),
(26, 2, '2025-05-02 10:53:07', '2025-05-02 12:42:04', 'Present'),
(27, 3, '2025-05-02 10:53:35', NULL, 'Present'),
(28, 4, '2025-05-02 10:54:08', NULL, 'Present'),
(29, 1, '2025-05-02 10:54:38', NULL, 'Present'),
(30, 2, '2025-05-02 12:35:33', '2025-05-02 12:42:04', 'Present'),
(31, 2, '2025-05-02 12:37:11', '2025-05-02 12:42:04', 'Present'),
(32, 2, '2025-05-02 12:40:10', '2025-05-02 12:42:04', 'Present'),
(33, 2, '2025-05-02 12:42:03', '2025-05-02 12:42:04', 'Present'),
(34, 2, '2025-05-02 12:42:08', '2025-05-02 18:54:39', 'Present'),
(35, 2, '2025-05-02 12:42:15', '2025-05-02 18:54:39', 'Present'),
(36, 3, '2025-05-02 12:43:07', NULL, 'Present'),
(37, 4, '2025-05-02 12:43:59', NULL, 'Present'),
(38, 1, '2025-05-02 12:44:12', NULL, 'Present'),
(39, 1, '2025-05-02 12:55:55', NULL, 'Present'),
(40, 2, '2025-05-02 12:57:46', '2025-05-02 18:54:39', 'Present'),
(41, 2, '2025-05-02 18:31:05', '2025-05-02 18:54:39', 'Present'),
(42, 3, '2025-05-02 18:33:14', NULL, 'Present'),
(43, 2, '2025-05-02 18:54:18', '2025-05-02 18:54:39', 'Present'),
(44, 2, '2025-05-02 18:54:41', '2025-05-02 18:55:19', 'Present'),
(45, 2, '2025-05-02 18:55:23', '2025-05-02 20:24:17', 'Present'),
(46, 2, '2025-05-02 19:48:18', '2025-05-02 20:24:17', 'Present'),
(47, 2, '2025-05-02 20:17:31', '2025-05-02 20:24:17', 'Present'),
(48, 2, '2025-05-02 20:23:30', '2025-05-02 20:24:17', 'Present'),
(49, 2, '2025-05-02 20:24:19', NULL, 'Present'),
(50, 2, '2025-05-02 20:43:58', NULL, 'Present'),
(51, 2, '2025-05-02 21:19:00', NULL, 'Present'),
(52, 2, '2025-05-02 21:25:21', NULL, 'Present'),
(53, 2, '2025-05-02 21:28:35', NULL, 'Present'),
(54, 3, '2025-05-03 01:29:44', NULL, 'Present'),
(55, 3, '2025-05-03 02:19:32', NULL, 'Present'),
(56, 3, '2025-05-03 02:23:23', NULL, 'Present'),
(57, 3, '2025-05-03 02:37:46', NULL, 'Present'),
(58, 3, '2025-05-03 02:43:15', NULL, 'Present'),
(59, 3, '2025-05-03 02:48:48', NULL, 'Present'),
(60, 3, '2025-05-03 02:58:39', NULL, 'Present'),
(61, 3, '2025-05-03 03:07:32', NULL, 'Present'),
(62, 3, '2025-05-03 03:11:35', NULL, 'Present'),
(63, 3, '2025-05-03 10:31:26', NULL, 'Present'),
(64, 3, '2025-05-03 10:58:18', NULL, 'Present'),
(65, 3, '2025-05-03 11:07:20', NULL, 'Present'),
(66, 3, '2025-05-03 11:10:32', NULL, 'Present'),
(67, 1, '2025-05-03 11:15:13', NULL, 'Present'),
(68, 3, '2025-05-03 11:22:39', NULL, 'Present'),
(69, 3, '2025-05-03 11:26:23', NULL, 'Present');

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
(9, 'aaaaaaaaaaaaaaaaaaaaa', '0'),
(10, 'Vitamin D', '0'),
(11, 'qqq', '0'),
(12, 'xxxxx', '0'),
(15, 'ane manda', '0'),
(16, 'qqq', 'Tablet'),
(17, 'fewgwegweg', '1'),
(18, 'bvvvvswvwevw', 'Drops'),
(20, 'asdasfasascvasvcasv', 'Liquid');

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

--
-- Dumping data for table `reception_patient_clinic_records`
--

INSERT INTO `reception_patient_clinic_records` (`id`, `tolken_no`, `clinic_id`, `patient_id`, `date`, `doctor_complete`, `counter_complete`) VALUES
(1, 1, 1, 1001, '2025-05-02 14:22:54', 0, 0),
(2, 2, 1, 1002, '2025-05-02 14:22:54', 0, 0),
(3, 3, 2, 1003, '2025-05-02 14:22:54', 0, 0),
(4, 4, 2, 1004, '2025-05-02 14:22:54', 0, 0),
(5, 5, 3, 1005, '2025-05-02 14:22:54', 0, 0),
(6, 6, 3, 1006, '2025-05-02 14:22:54', 0, 0),
(7, 7, 4, 1007, '2025-05-02 14:22:54', 0, 0),
(8, 8, 4, 1008, '2025-05-02 14:22:54', 0, 0),
(9, 9, 5, 1009, '2025-05-02 14:22:54', 0, 0),
(10, 10, 5, 1010, '2025-05-02 14:22:54', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `reception_patient_opd_record`
--

CREATE TABLE `reception_patient_opd_record` (
  `id` int(11) NOT NULL,
  `patient_name` varchar(40) NOT NULL,
  `patient_age` int(11) NOT NULL,
  `tolken_no` int(11) NOT NULL,
  `doctor_complete` int(11) NOT NULL DEFAULT 0,
  `counter_complete` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reception_patient_opd_record`
--

INSERT INTO `reception_patient_opd_record` (`id`, `patient_name`, `patient_age`, `tolken_no`, `doctor_complete`, `counter_complete`) VALUES
(1, 'John Doe', 35, 101, 0, 0),
(2, 'Jane Smith', 28, 102, 0, 0),
(3, 'Michael Brown', 42, 103, 0, 0),
(4, 'Emily Johnson', 30, 104, 0, 0),
(5, 'William Lee', 50, 105, 0, 0),
(6, 'Olivia Davis', 22, 106, 0, 0),
(7, 'James Wilson', 60, 107, 0, 0),
(8, 'Sophia Martinez', 19, 108, 0, 0),
(9, 'David Anderson', 47, 109, 0, 0),
(10, 'Emma Thomas', 33, 110, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `reception_patient_registration`
--

CREATE TABLE `reception_patient_registration` (
  `id` int(11) NOT NULL,
  `patient_name` varchar(100) NOT NULL,
  `patient_dob` date NOT NULL,
  `clinic_id` int(11) NOT NULL,
  `gender` varchar(100) NOT NULL,
  `patient_address` varchar(100) NOT NULL,
  `patient_nic` varchar(20) NOT NULL,
  `patient_contact_no` int(10) NOT NULL,
  `patient_guardian_name` varchar(100) DEFAULT NULL,
  `patient_guardian_contact_no` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reception_patient_registration`
--

INSERT INTO `reception_patient_registration` (`id`, `patient_name`, `patient_dob`, `clinic_id`, `gender`, `patient_address`, `patient_nic`, `patient_contact_no`, `patient_guardian_name`, `patient_guardian_contact_no`) VALUES
(1, 'John Doe', '1990-05-15', 1, '', '123 Main Street', '902345678V', 771234567, 'Jane Doe', 772345678),
(2, 'Emily Smith', '1985-09-22', 2, '', '45 Park Avenue', '852347891V', 772345678, NULL, NULL),
(3, 'Michael Johnson', '1978-03-10', 1, '', '789 Oak Road', '782341234V', 771112233, 'Sarah Johnson', 774445566),
(4, 'Samantha Lee', '1995-11-30', 3, '', '12 Pine Street', '952348765V', 778899001, NULL, NULL),
(5, 'David Brown', '2000-07-04', 2, '', '67 River Lane', '002349876V', 770987654, 'Mark Brown', 775551122),
(6, 'Olivia White', '1992-02-17', 1, '', '89 Sunset Blvd', '922340123V', 776543210, NULL, NULL),
(7, 'William Green', '1988-06-25', 3, '', '14 Maple Drive', '882349012V', 775432109, 'Anna Green', 778765432),
(8, 'Sophia Taylor', '1993-12-09', 2, '', '56 Lake View', '932347890V', 774321098, NULL, NULL),
(9, 'James Wilson', '1982-04-18', 1, '', '101 Hilltop Road', '822349876V', 773210987, 'Linda Wilson', 779876543),
(10, 'Isabella Martin', '1999-08-27', 3, '', '23 Seaside Street', '992348901V', 772109876, NULL, NULL);

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

-- --------------------------------------------------------

--
-- Table structure for table `user_registrations`
--

CREATE TABLE `user_registrations` (
  `id` int(11) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `address` text NOT NULL,
  `role` enum('doctor','pharmacist','receptionist') NOT NULL,
  `specialization` varchar(100) DEFAULT NULL,
  `license_number` varchar(100) DEFAULT NULL,
  `shift` varchar(100) DEFAULT NULL,
  `registered_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
-- Indexes for table `user_registrations`
--
ALTER TABLE `user_registrations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attendance_log`
--
ALTER TABLE `attendance_log`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT for table `doctor_clinic_department`
--
ALTER TABLE `doctor_clinic_department`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `doctor_prescription`
--
ALTER TABLE `doctor_prescription`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `reception_patient_clinic_records`
--
ALTER TABLE `reception_patient_clinic_records`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `reception_patient_opd_record`
--
ALTER TABLE `reception_patient_opd_record`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `reception_patient_registration`
--
ALTER TABLE `reception_patient_registration`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

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
-- AUTO_INCREMENT for table `user_registrations`
--
ALTER TABLE `user_registrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
