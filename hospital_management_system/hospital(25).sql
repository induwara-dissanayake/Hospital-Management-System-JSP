-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 08, 2025 at 11:17 AM
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
(1, 1, '2025-04-30 21:43:07', '2025-05-03 12:36:34', 'Present'),
(2, 2, '2025-04-30 21:43:24', '2025-05-02 12:42:04', 'Present'),
(3, 1, '2025-04-30 21:45:06', '2025-05-03 12:36:34', 'Present'),
(4, 3, '2025-04-30 21:45:38', '2025-05-04 19:53:49', 'Present'),
(5, 2, '2025-04-30 21:54:46', '2025-05-02 12:42:04', 'Present'),
(6, 2, '2025-04-30 21:57:15', '2025-05-02 12:42:04', 'Present'),
(7, 2, '2025-04-30 21:58:11', '2025-05-02 12:42:04', 'Present'),
(8, 2, '2025-04-30 22:07:27', '2025-05-02 12:42:04', 'Present'),
(9, 1, '2025-04-30 22:07:39', '2025-05-03 12:36:34', 'Present'),
(10, 2, '2025-04-30 22:13:46', '2025-05-02 12:42:04', 'Present'),
(11, 2, '2025-05-01 01:46:37', '2025-05-02 12:42:04', 'Present'),
(12, 3, '2025-05-01 01:53:39', '2025-05-04 19:53:49', 'Present'),
(13, 4, '2025-05-01 01:55:06', NULL, 'Present'),
(14, 1, '2025-05-01 01:55:31', '2025-05-03 12:36:34', 'Present'),
(15, 2, '2025-05-01 02:13:32', '2025-05-02 12:42:04', 'Present'),
(16, 2, '2025-05-01 02:26:51', '2025-05-02 12:42:04', 'Present'),
(17, 2, '2025-05-01 02:31:40', '2025-05-02 12:42:04', 'Present'),
(18, 2, '2025-05-01 20:56:24', '2025-05-02 12:42:04', 'Present'),
(19, 2, '2025-05-01 20:58:16', '2025-05-02 12:42:04', 'Present'),
(20, 3, '2025-05-02 10:10:08', '2025-05-04 19:53:49', 'Present'),
(21, 3, '2025-05-02 10:21:35', '2025-05-04 19:53:49', 'Present'),
(22, 3, '2025-05-02 10:22:19', '2025-05-04 19:53:49', 'Present'),
(23, 2, '2025-05-02 10:22:24', '2025-05-02 12:42:04', 'Present'),
(24, 3, '2025-05-02 10:22:42', '2025-05-04 19:53:49', 'Present'),
(25, 3, '2025-05-02 10:32:08', '2025-05-04 19:53:49', 'Present'),
(26, 2, '2025-05-02 10:53:07', '2025-05-02 12:42:04', 'Present'),
(27, 3, '2025-05-02 10:53:35', '2025-05-04 19:53:49', 'Present'),
(28, 4, '2025-05-02 10:54:08', NULL, 'Present'),
(29, 1, '2025-05-02 10:54:38', '2025-05-03 12:36:34', 'Present'),
(30, 2, '2025-05-02 12:35:33', '2025-05-02 12:42:04', 'Present'),
(31, 2, '2025-05-02 12:37:11', '2025-05-02 12:42:04', 'Present'),
(32, 2, '2025-05-02 12:40:10', '2025-05-02 12:42:04', 'Present'),
(33, 2, '2025-05-02 12:42:03', '2025-05-02 12:42:04', 'Present'),
(34, 2, '2025-05-02 12:42:08', '2025-05-02 18:54:39', 'Present'),
(35, 2, '2025-05-02 12:42:15', '2025-05-02 18:54:39', 'Present'),
(36, 3, '2025-05-02 12:43:07', '2025-05-04 19:53:49', 'Present'),
(37, 4, '2025-05-02 12:43:59', NULL, 'Present'),
(38, 1, '2025-05-02 12:44:12', '2025-05-03 12:36:34', 'Present'),
(39, 1, '2025-05-02 12:55:55', '2025-05-03 12:36:34', 'Present'),
(40, 2, '2025-05-02 12:57:46', '2025-05-02 18:54:39', 'Present'),
(41, 2, '2025-05-02 18:31:05', '2025-05-02 18:54:39', 'Present'),
(42, 3, '2025-05-02 18:33:14', '2025-05-04 19:53:49', 'Present'),
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
(54, 3, '2025-05-03 01:29:44', '2025-05-04 19:53:49', 'Present'),
(55, 3, '2025-05-03 02:19:32', '2025-05-04 19:53:49', 'Present'),
(56, 3, '2025-05-03 02:23:23', '2025-05-04 19:53:49', 'Present'),
(57, 3, '2025-05-03 02:37:46', '2025-05-04 19:53:49', 'Present'),
(58, 3, '2025-05-03 02:43:15', '2025-05-04 19:53:49', 'Present'),
(59, 3, '2025-05-03 02:48:48', '2025-05-04 19:53:49', 'Present'),
(60, 3, '2025-05-03 02:58:39', '2025-05-04 19:53:49', 'Present'),
(61, 3, '2025-05-03 03:07:32', '2025-05-04 19:53:49', 'Present'),
(62, 3, '2025-05-03 03:11:35', '2025-05-04 19:53:49', 'Present'),
(63, 3, '2025-05-03 10:31:26', '2025-05-04 19:53:49', 'Present'),
(64, 3, '2025-05-03 10:58:18', '2025-05-04 19:53:49', 'Present'),
(65, 3, '2025-05-03 11:07:20', '2025-05-04 19:53:49', 'Present'),
(66, 3, '2025-05-03 11:10:32', '2025-05-04 19:53:49', 'Present'),
(67, 1, '2025-05-03 11:15:13', '2025-05-03 12:36:34', 'Present'),
(68, 3, '2025-05-03 11:22:39', '2025-05-04 19:53:49', 'Present'),
(69, 3, '2025-05-03 11:26:23', '2025-05-04 19:53:49', 'Present'),
(70, 3, '2025-05-03 12:36:41', '2025-05-04 19:53:49', 'Present'),
(71, 3, '2025-05-03 13:24:00', '2025-05-04 19:53:49', 'Present'),
(72, 4, '2025-05-03 13:24:21', NULL, 'Present'),
(73, 1, '2025-05-03 13:24:29', '2025-05-04 10:43:58', 'Present'),
(74, 3, '2025-05-03 13:30:25', '2025-05-04 19:53:49', 'Present'),
(75, 3, '2025-05-03 14:14:57', '2025-05-04 19:53:49', 'Present'),
(76, 3, '2025-05-03 14:28:51', '2025-05-04 19:53:49', 'Present'),
(77, 3, '2025-05-03 14:39:27', '2025-05-04 19:53:49', 'Present'),
(78, 3, '2025-05-03 20:58:21', '2025-05-04 19:53:49', 'Present'),
(79, 3, '2025-05-03 21:01:14', '2025-05-04 19:53:49', 'Present'),
(80, 3, '2025-05-04 10:45:22', '2025-05-04 19:53:49', 'Present'),
(81, 3, '2025-05-04 11:45:06', '2025-05-04 19:53:49', 'Present'),
(82, 1, '2025-05-04 11:56:45', '2025-05-04 19:33:41', 'Present'),
(83, 2, '2025-05-04 11:57:58', NULL, 'Present'),
(84, 3, '2025-05-04 12:18:29', '2025-05-04 19:53:49', 'Present'),
(85, 3, '2025-05-04 12:21:46', '2025-05-04 19:53:49', 'Present'),
(86, 3, '2025-05-04 14:33:48', '2025-05-04 19:53:49', 'Present'),
(87, 3, '2025-05-04 14:35:45', '2025-05-04 19:53:49', 'Present'),
(88, 3, '2025-05-04 18:34:54', '2025-05-04 19:53:49', 'Present'),
(89, 3, '2025-05-04 18:37:13', '2025-05-04 19:53:49', 'Present'),
(90, 3, '2025-05-04 19:02:28', '2025-05-04 19:53:49', 'Present'),
(91, 3, '2025-05-04 19:03:44', '2025-05-04 19:53:49', 'Present'),
(92, 3, '2025-05-04 19:33:46', '2025-05-04 19:53:49', 'Present'),
(93, 3, '2025-05-04 19:53:58', '2025-05-05 21:03:17', 'Present'),
(94, 3, '2025-05-05 01:00:36', '2025-05-05 21:03:17', 'Present'),
(95, 3, '2025-05-05 01:31:34', '2025-05-05 21:03:17', 'Present'),
(96, 3, '2025-05-05 20:24:12', '2025-05-05 21:03:17', 'Present'),
(97, 4, '2025-05-05 20:29:49', NULL, 'Present'),
(98, 1, '2025-05-05 20:30:34', '2025-05-05 20:40:21', 'Present'),
(99, 3, '2025-05-05 20:40:24', '2025-05-05 21:03:17', 'Present'),
(100, 3, '2025-05-05 20:50:42', '2025-05-05 21:03:17', 'Present'),
(101, 3, '2025-05-05 21:02:49', '2025-05-05 21:03:17', 'Present'),
(102, 3, '2025-05-05 21:03:21', '2025-05-06 12:39:25', 'Present'),
(103, 3, '2025-05-05 21:04:21', '2025-05-06 12:39:25', 'Present'),
(104, 3, '2025-05-05 21:16:34', '2025-05-06 12:39:25', 'Present'),
(105, 1, '2025-05-05 21:23:35', '2025-05-06 10:47:20', 'Present'),
(106, 3, '2025-05-05 21:59:41', '2025-05-06 12:39:25', 'Present'),
(107, 3, '2025-05-06 02:14:31', '2025-05-06 12:39:25', 'Present'),
(108, 3, '2025-05-06 02:15:14', '2025-05-06 12:39:25', 'Present'),
(109, 3, '2025-05-06 02:16:52', '2025-05-06 12:39:25', 'Present'),
(110, 3, '2025-05-06 02:20:16', '2025-05-06 12:39:25', 'Present'),
(111, 1, '2025-05-06 10:47:34', '2025-05-06 11:07:42', 'Present'),
(112, 3, '2025-05-06 11:01:59', '2025-05-06 12:39:25', 'Present'),
(113, 4, '2025-05-06 11:08:15', NULL, 'Present'),
(114, 3, '2025-05-06 11:09:31', '2025-05-06 12:39:25', 'Present'),
(115, 3, '2025-05-06 12:24:52', '2025-05-06 12:39:25', 'Present'),
(116, 4, '2025-05-06 12:39:30', NULL, 'Present'),
(117, 1, '2025-05-06 14:13:38', '2025-05-06 16:43:05', 'Present'),
(118, 3, '2025-05-06 16:40:45', NULL, 'Present'),
(119, 1, '2025-05-06 16:43:08', '2025-05-06 16:47:15', 'Present'),
(120, 1, '2025-05-06 20:16:58', '2025-05-08 14:29:07', 'Present'),
(121, 4, '2025-05-06 20:17:07', NULL, 'Present'),
(122, 4, '2025-05-06 23:11:21', NULL, 'Present'),
(123, 4, '2025-05-06 23:14:21', NULL, 'Present'),
(124, 4, '2025-05-06 23:16:56', NULL, 'Present'),
(125, 4, '2025-05-06 23:22:03', NULL, 'Present'),
(126, 4, '2025-05-07 00:39:08', NULL, 'Present'),
(127, 4, '2025-05-07 01:16:14', NULL, 'Present'),
(128, 4, '2025-05-07 01:18:15', NULL, 'Present'),
(129, 4, '2025-05-07 01:21:03', NULL, 'Present'),
(130, 4, '2025-05-07 23:48:34', NULL, 'Present'),
(131, 4, '2025-05-07 23:57:38', NULL, 'Present'),
(132, 4, '2025-05-08 01:17:24', NULL, 'Present'),
(133, 4, '2025-05-08 01:21:33', NULL, 'Present'),
(134, 4, '2025-05-08 01:33:53', NULL, 'Present'),
(135, 4, '2025-05-08 03:06:47', NULL, 'Present'),
(136, 4, '2025-05-08 03:11:41', NULL, 'Present'),
(137, 4, '2025-05-08 03:27:39', NULL, 'Present'),
(138, 4, '2025-05-08 03:29:04', NULL, 'Present'),
(139, 4, '2025-05-08 03:48:56', NULL, 'Present'),
(140, 3, '2025-05-08 10:54:51', NULL, 'Present'),
(141, 4, '2025-05-08 10:55:02', NULL, 'Present'),
(142, 3, '2025-05-08 11:30:27', NULL, 'Present'),
(143, 1, '2025-05-08 12:15:18', '2025-05-08 14:29:07', 'Present'),
(144, 4, '2025-05-08 14:26:41', NULL, 'Present'),
(145, 4, '2025-05-08 14:30:50', NULL, 'Present'),
(146, 1, '2025-05-08 14:31:07', NULL, 'Present'),
(147, 1, '2025-05-08 14:32:50', NULL, 'Present'),
(148, 1, '2025-05-08 14:34:09', NULL, 'Present');

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
  `patient_id` int(11) NOT NULL,
  `clinic_id` int(11) NOT NULL,
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
(1, 'Paracetamol', 'Tablet'),
(2, 'Amoxicillin', 'Capsule'),
(3, 'Ibuprofen', 'Tablet'),
(4, 'Cetirizine', 'Tablet'),
(5, 'Metformin', 'Tablet'),
(6, 'Amlodipine', 'Tablet'),
(7, 'Losartan', 'Tablet'),
(8, 'Omeprazole', 'Capsule'),
(9, 'Salbutamol', 'Syrup'),
(10, 'Furosemide', 'Tablet'),
(11, 'Ciprofloxacin', 'Tablet'),
(12, 'Azithromycin', 'Tablet'),
(13, 'Clopidogrel', 'Tablet'),
(14, 'Simvastatin', 'Tablet'),
(15, 'Ranitidine', 'Tablet'),
(16, 'Doxycycline', 'Capsule'),
(17, 'Prednisolone', 'Tablet'),
(18, 'Loratadine', 'Tablet'),
(19, 'Metronidazole', 'Tablet'),
(20, 'Diclofenac', 'Tablet'),
(21, 'Tramadol', 'Capsule'),
(22, 'Pantoprazole', 'Tablet'),
(23, 'Hydrochlorothiazide', 'Tablet'),
(24, 'Erythromycin', 'Tablet'),
(25, 'Acetaminophen', 'Syrup'),
(26, 'Morphine', 'Injection'),
(27, 'Atorvastatin', 'Tablet'),
(28, 'Warfarin', 'Tablet'),
(29, 'Insulin Glargine', 'Injection'),
(30, 'Levothyroxine', 'Tablet'),
(31, 'Sertraline', 'Tablet'),
(32, 'Diazepam', 'Tablet'),
(33, 'Gabapentin', 'Capsule'),
(34, 'Carvedilol', 'Tablet'),
(35, 'Ketoconazole', 'Cream'),
(36, 'Fluconazole', 'Tablet'),
(37, 'Insulin Lispro', 'Injection'),
(38, 'Albuterol', 'Inhaler'),
(39, 'Montelukast', 'Tablet'),
(40, 'Nitroglycerin', 'Tablet'),
(41, 'Esomeprazole', 'Tablet'),
(42, 'Valacyclovir', 'Tablet'),
(43, 'Levofloxacin', 'Tablet'),
(44, 'Ondansetron', 'Tablet'),
(45, 'Spironolactone', 'Tablet'),
(46, 'Methotrexate', 'Tablet'),
(47, 'Glipizide', 'Tablet'),
(48, 'Rosuvastatin', 'Tablet'),
(49, 'Lamotrigine', 'Tablet'),
(50, 'Tamsulosin', 'Capsule');

-- --------------------------------------------------------

--
-- Table structure for table `medicine`
--

CREATE TABLE `medicine` (
  `medicine_id` int(11) NOT NULL,
  `medicine_name` varchar(100) NOT NULL,
  `dosage_form` varchar(50) NOT NULL,
  `dosage_strength` varchar(50) NOT NULL,
  `stock_quantity` int(11) NOT NULL,
  `prescribed_for` varchar(255) NOT NULL,
  `category` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `medicine`
--

INSERT INTO `medicine` (`medicine_id`, `medicine_name`, `dosage_form`, `dosage_strength`, `stock_quantity`, `prescribed_for`, `category`, `created_at`, `updated_at`) VALUES
(1, 'Paracetamol', 'Tablet', '500mg', 120, 'Fever, mild pain', 'Analgesic', '2025-05-08 09:17:21', '2025-05-08 09:17:21'),
(2, 'Amoxicillin', 'Capsule', '250mg', 80, 'Bacterial infections', 'Antibiotic', '2025-05-08 09:17:21', '2025-05-08 09:17:21'),
(3, 'Ibuprofen', 'Tablet', '400mg', 60, 'Pain, inflammation', 'NSAID', '2025-05-08 09:17:21', '2025-05-08 09:17:21'),
(4, 'Cetirizine', 'Tablet', '10mg', 150, 'Allergic rhinitis, urticaria', 'Antihistamine', '2025-05-08 09:17:21', '2025-05-08 09:17:21'),
(5, 'Metformin', 'Tablet', '500mg', 90, 'Type 2 Diabetes', 'Antidiabetic', '2025-05-08 09:17:21', '2025-05-08 09:17:21'),
(6, 'Amlodipine', 'Tablet', '5mg', 70, 'Hypertension, angina', 'Antihypertensive', '2025-05-08 09:17:21', '2025-05-08 09:17:21'),
(7, 'Losartan', 'Tablet', '50mg', 85, 'Hypertension', 'Antihypertensive', '2025-05-08 09:17:21', '2025-05-08 09:17:21'),
(8, 'Omeprazole', 'Capsule', '20mg', 100, 'Gastric ulcers, GERD', 'Proton Pump Inhibitor', '2025-05-08 09:17:21', '2025-05-08 09:17:21'),
(9, 'Salbutamol', 'Syrup', '2mg/5ml', 40, 'Asthma, bronchospasm', 'Bronchodilator', '2025-05-08 09:17:21', '2025-05-08 09:17:21'),
(10, 'Furosemide', 'Tablet', '40mg', 50, 'Edema, hypertension', 'Diuretic', '2025-05-08 09:17:21', '2025-05-08 09:17:21'),
(11, 'Ciprofloxacin', 'Tablet', '500mg', 75, 'Bacterial infections', 'Antibiotic', '2025-05-08 09:17:21', '2025-05-08 09:17:21'),
(12, 'Azithromycin', 'Tablet', '250mg', 65, 'Respiratory infections', 'Antibiotic', '2025-05-08 09:17:21', '2025-05-08 09:17:21'),
(13, 'Clopidogrel', 'Tablet', '75mg', 55, 'Stroke prevention', 'Antiplatelet', '2025-05-08 09:17:21', '2025-05-08 09:17:21'),
(14, 'Simvastatin', 'Tablet', '20mg', 90, 'High cholesterol', 'Statin', '2025-05-08 09:17:21', '2025-05-08 09:17:21'),
(15, 'Ranitidine', 'Tablet', '150mg', 60, 'Acid reflux, ulcers', 'H2 Blocker', '2025-05-08 09:17:21', '2025-05-08 09:17:21'),
(16, 'Doxycycline', 'Capsule', '100mg', 45, 'Bacterial infections, acne', 'Antibiotic', '2025-05-08 09:17:21', '2025-05-08 09:17:21'),
(17, 'Prednisolone', 'Tablet', '5mg', 50, 'Inflammatory conditions', 'Corticosteroid', '2025-05-08 09:17:21', '2025-05-08 09:17:21'),
(18, 'Loratadine', 'Tablet', '10mg', 95, 'Allergic rhinitis, urticaria', 'Antihistamine', '2025-05-08 09:17:21', '2025-05-08 09:17:21'),
(19, 'Metronidazole', 'Tablet', '400mg', 70, 'Protozoal infections, bacterial vaginosis', 'Antibiotic', '2025-05-08 09:17:21', '2025-05-08 09:17:21'),
(20, 'Diclofenac', 'Tablet', '50mg', 55, 'Pain, inflammation', 'NSAID', '2025-05-08 09:17:21', '2025-05-08 09:17:21'),
(21, 'Tramadol', 'Capsule', '50mg', 30, 'Moderate to severe pain', 'Opioid', '2025-05-08 09:17:21', '2025-05-08 09:17:21'),
(22, 'Pantoprazole', 'Tablet', '40mg', 80, 'GERD, ulcers', 'Proton Pump Inhibitor', '2025-05-08 09:17:21', '2025-05-08 09:17:21'),
(23, 'Hydrochlorothiazide', 'Tablet', '25mg', 65, 'Hypertension, edema', 'Diuretic', '2025-05-08 09:17:21', '2025-05-08 09:17:21'),
(24, 'Erythromycin', 'Tablet', '500mg', 40, 'Bacterial infections', 'Antibiotic', '2025-05-08 09:17:21', '2025-05-08 09:17:21'),
(25, 'Acetaminophen', 'Syrup', '120mg/5ml', 90, 'Fever, pain (children)', 'Analgesic', '2025-05-08 09:17:21', '2025-05-08 09:17:21'),
(26, 'Morphine', 'Injection', '10mg/ml', 25, 'Severe pain, postoperative', 'Opioid', '2025-05-08 09:17:21', '2025-05-08 09:17:21'),
(27, 'Atorvastatin', 'Tablet', '20mg', 100, 'High cholesterol', 'Statin', '2025-05-08 09:17:21', '2025-05-08 09:17:21'),
(28, 'Warfarin', 'Tablet', '5mg', 30, 'Prevention of thrombosis', 'Anticoagulant', '2025-05-08 09:17:21', '2025-05-08 09:17:21'),
(29, 'Insulin Glargine', 'Injection', '100IU/ml', 20, 'Type 1 & 2 Diabetes', 'Antidiabetic', '2025-05-08 09:17:21', '2025-05-08 09:17:21'),
(30, 'Levothyroxine', 'Tablet', '50mcg', 75, 'Hypothyroidism', 'Hormone', '2025-05-08 09:17:21', '2025-05-08 09:17:21'),
(31, 'Sertraline', 'Tablet', '50mg', 45, 'Depression, anxiety', 'Antidepressant', '2025-05-08 09:17:21', '2025-05-08 09:17:21'),
(32, 'Diazepam', 'Tablet', '5mg', 55, 'Anxiety, muscle spasm', 'Anxiolytic', '2025-05-08 09:17:21', '2025-05-08 09:17:21'),
(33, 'Gabapentin', 'Capsule', '300mg', 60, 'Neuropathic pain, epilepsy', 'Anticonvulsant', '2025-05-08 09:17:21', '2025-05-08 09:17:21'),
(34, 'Carvedilol', 'Tablet', '12.5mg', 50, 'Heart failure, hypertension', 'Beta-blocker', '2025-05-08 09:17:21', '2025-05-08 09:17:21'),
(35, 'Ketoconazole', 'Cream', '2%', 40, 'Fungal infections', 'Antifungal', '2025-05-08 09:17:21', '2025-05-08 09:17:21'),
(36, 'Fluconazole', 'Tablet', '150mg', 35, 'Candidiasis', 'Antifungal', '2025-05-08 09:17:21', '2025-05-08 09:17:21'),
(37, 'Insulin Lispro', 'Injection', '100IU/ml', 20, 'Type 1 & 2 Diabetes', 'Antidiabetic', '2025-05-08 09:17:21', '2025-05-08 09:17:21'),
(38, 'Albuterol', 'Inhaler', '90mcg/dose', 25, 'Asthma, COPD', 'Bronchodilator', '2025-05-08 09:17:21', '2025-05-08 09:17:21'),
(39, 'Montelukast', 'Tablet', '10mg', 65, 'Asthma, allergic rhinitis', 'Leukotriene Inhibitor', '2025-05-08 09:17:21', '2025-05-08 09:17:21'),
(40, 'Nitroglycerin', 'Tablet', '0.5mg', 30, 'Angina pectoris', 'Vasodilator', '2025-05-08 09:17:21', '2025-05-08 09:17:21'),
(41, 'Esomeprazole', 'Tablet', '20mg', 70, 'GERD, ulcers', 'Proton Pump Inhibitor', '2025-05-08 09:17:21', '2025-05-08 09:17:21'),
(42, 'Valacyclovir', 'Tablet', '500mg', 40, 'Herpes zoster, genital herpes', 'Antiviral', '2025-05-08 09:17:21', '2025-05-08 09:17:21'),
(43, 'Levofloxacin', 'Tablet', '500mg', 45, 'Bacterial infections', 'Antibiotic', '2025-05-08 09:17:21', '2025-05-08 09:17:21'),
(44, 'Ondansetron', 'Tablet', '8mg', 55, 'Nausea, vomiting', 'Antiemetic', '2025-05-08 09:17:21', '2025-05-08 09:17:21'),
(45, 'Spironolactone', 'Tablet', '25mg', 60, 'Heart failure, edema', 'Diuretic', '2025-05-08 09:17:21', '2025-05-08 09:17:21'),
(46, 'Methotrexate', 'Tablet', '2.5mg', 25, 'Rheumatoid arthritis, psoriasis', 'Immunosuppressant', '2025-05-08 09:17:21', '2025-05-08 09:17:21'),
(47, 'Glipizide', 'Tablet', '5mg', 50, 'Type 2 Diabetes', 'Antidiabetic', '2025-05-08 09:17:21', '2025-05-08 09:17:21'),
(48, 'Rosuvastatin', 'Tablet', '10mg', 80, 'High cholesterol', 'Statin', '2025-05-08 09:17:21', '2025-05-08 09:17:21'),
(49, 'Lamotrigine', 'Tablet', '100mg', 35, 'Epilepsy, bipolar disorder', 'Anticonvulsant', '2025-05-08 09:17:21', '2025-05-08 09:17:21'),
(50, 'Tamsulosin', 'Capsule', '0.4mg', 40, 'Benign prostatic hyperplasia', 'Alpha-blocker', '2025-05-08 09:17:21', '2025-05-08 09:17:21');

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
  `tolken_no` int(11) NOT NULL,
  `doctor_complete` int(11) NOT NULL DEFAULT 0,
  `counter_complete` int(11) NOT NULL DEFAULT 0
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
  `gender` varchar(100) NOT NULL,
  `blood_type` varchar(100) NOT NULL,
  `patient_address` varchar(100) NOT NULL,
  `patient_nic` varchar(20) NOT NULL,
  `patient_contact_no` int(10) NOT NULL,
  `patient_guardian_name` varchar(100) DEFAULT NULL,
  `patient_guardian_contact_no` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reception_patient_registration`
--

INSERT INTO `reception_patient_registration` (`id`, `patient_name`, `patient_dob`, `clinic_id`, `gender`, `blood_type`, `patient_address`, `patient_nic`, `patient_contact_no`, `patient_guardian_name`, `patient_guardian_contact_no`) VALUES
(1, 'John Doe', '1990-05-14', 1, 'Male', 'A+', '123 Main St', '902101234V', 771234567, 'Jane Doe', 771234568),
(2, 'Emily Smith', '1985-08-22', 2, 'Female', 'O+', '45 Park Lane', '852141236V', 771234569, 'Robert Smith', 771234570),
(3, 'Michael Johnson', '2000-12-30', 3, 'Male', 'B-', '789 Oak Ave', '993456789V', 771234571, 'Laura Johnson', 771234572),
(4, 'Sarah Lee', '1995-03-10', 4, 'Female', 'AB+', '56 River Rd', '945123654V', 771234573, 'Daniel Lee', 771234574),
(5, 'David Brown', '1988-11-01', 1, 'Male', 'O-', '98 Lakeview Dr', '901235874V', 771234575, 'Rachel Brown', 771234576),
(6, 'Olivia Davis', '2003-09-25', 2, 'Female', 'A-', '12 Sunset Blvd', '902178963V', 771234577, 'Paul Davis', 771234578),
(7, 'James Wilson', '1978-02-18', 3, 'Male', 'B+', '34 Sunrise St', '787456123V', 771234579, 'Anna Wilson', 771234580),
(8, 'Sophia Martinez', '1999-06-14', 4, 'Female', 'AB-', '120 Elm St', '853789456V', 771234581, 'John Martinez', 771234582),
(9, 'Daniel Anderson', '2010-04-02', 5, 'Male', 'O+', '67 Hillcrest', '991234567V', 771234583, 'Lisa Anderson', 771234584),
(10, 'Emma Thomas', '2005-01-16', 1, 'Female', 'A+', '23 Valley Rd', '902356789V', 771234585, 'Mark Thomas', 771234586),
(11, 'William Taylor', '1982-07-28', 2, 'Male', 'B+', '11 Pine St', '781234567V', 771234587, 'Nancy Taylor', 771234588),
(12, 'Mia Hernandez', '2015-12-05', 3, 'Female', 'O-', '77 Maple Ave', '902987654V', 771234589, 'Steve Hernandez', 771234590),
(13, 'Joseph Moore', '1993-10-20', 4, 'Male', 'AB+', '43 Garden Ln', '802345678V', 771234591, 'Patricia Moore', 771234592),
(14, 'Ava Jackson', '2008-09-13', 5, 'Female', 'A-', '19 Brook St', '902246810V', 771234593, 'Kevin Jackson', 771234594),
(15, 'Benjamin Martin', '1975-06-07', 1, 'Male', 'B-', '5 Ocean Rd', '651234567V', 771234595, 'Deborah Martin', 771234596),
(16, 'Charlotte Lee', '1989-02-23', 2, 'Female', 'O+', '14 Bay View', '902765432V', 771234597, 'Patrick Lee', 771234598),
(17, 'Henry Perez', '2011-11-29', 3, 'Male', 'A+', '39 Ridge St', '902132435V', 771234599, 'Samantha Perez', 771234600),
(18, 'Amelia White', '1997-08-15', 4, 'Female', 'AB-', '52 Crescent St', '902976431V', 771234601, 'George White', 771234602),
(19, 'Lucas Harris', '1983-03-18', 5, 'Male', 'B+', '9 Forest Rd', '802198765V', 771234603, 'Victoria Harris', 771234604),
(20, 'Evelyn Clark', '2001-05-21', 1, 'Female', 'A-', '66 Cypress Ln', '902854321V', 771234605, 'Brian Clark', 771234606),
(21, 'Matthew Lewis', '1994-07-30', 2, 'Male', 'O-', '78 Highland Ave', '902197531V', 771234607, 'Kim Lewis', 771234608),
(22, 'Harper Young', '2007-02-11', 3, 'Female', 'AB+', '44 Willow Way', '902314159V', 771234609, 'Andrew Young', 771234610),
(23, 'Jack Walker', '1986-09-19', 4, 'Male', 'A+', '32 Cedar St', '902268321V', 771234611, 'Rebecca Walker', 771234612),
(24, 'Abigail Hall', '1991-04-27', 5, 'Female', 'B-', '10 Birch Rd', '902879321V', 771234613, 'Gary Hall', 771234614),
(25, 'Samuel Allen', '1998-12-12', 1, 'Male', 'O+', '27 Oakwood Dr', '902984531V', 771234615, 'Teresa Allen', 771234616),
(26, 'Ella Scott', '2013-03-03', 2, 'Female', 'A-', '85 Redwood St', '902109283V', 771234617, 'Dennis Scott', 771234618),
(27, 'Logan King', '1987-10-09', 3, 'Male', 'B+', '18 Ash St', '902324156V', 771234619, 'Pamela King', 771234620),
(28, 'Elizabeth Green', '2004-01-01', 4, 'Female', 'AB-', '7 Cherry Ln', '902435672V', 771234621, 'Larry Green', 771234622),
(29, 'Jacob Baker', '1992-06-16', 5, 'Male', 'O-', '41 Poplar St', '902768341V', 771234623, 'Monica Baker', 771234624),
(30, 'Sofia Gonzalez', '1996-11-04', 1, 'Female', 'A+', '59 Hawthorn Ave', '902128476V', 771234625, 'Frank Gonzalez', 771234626),
(31, 'Mason Nelson', '1980-08-25', 2, 'Male', 'B-', '36 Linden Rd', '902654738V', 771234627, 'Gloria Nelson', 771234628),
(32, 'Avery Carter', '2012-04-30', 3, 'Female', 'O+', '13 Aspen Way', '902485739V', 771234629, 'Walter Carter', 771234630),
(33, 'Sebastian Mitchell', '1979-03-22', 4, 'Male', 'AB+', '72 Hickory St', '902379485V', 771234631, 'Judith Mitchell', 771234632),
(34, 'Chloe Roberts', '2009-07-18', 5, 'Female', 'A-', '26 Magnolia Ln', '902846273V', 771234633, 'Ralph Roberts', 771234634),
(35, 'Liam Turner', '1984-12-06', 1, 'Male', 'B+', '83 Sycamore St', '902312487V', 771234635, 'Irene Turner', 771234636),
(36, 'Grace Phillips', '1990-09-02', 2, 'Female', 'O-', '47 Cottonwood Dr', '902917324V', 771234637, 'Douglas Phillips', 771234638),
(37, 'Ethan Campbell', '1999-01-14', 3, 'Male', 'A+', '16 Spruce St', '902123479V', 771234639, 'Katherine Campbell', 771234640),
(38, 'Lily Parker', '1981-11-26', 4, 'Female', 'AB-', '38 Walnut St', '902859324V', 771234641, 'Gregory Parker', 771234642),
(39, 'Noah Evans', '2006-06-08', 5, 'Male', 'O+', '3 Peach Blossom', '902794851V', 771234643, 'Margaret Evans', 771234644),
(40, 'Zoey Edwards', '2014-10-31', 1, 'Female', 'A-', '20 Lemon Tree Ln', '902487231V', 771234645, 'Gerald Edwards', 771234646),
(41, 'Luke Collins', '1993-02-13', 2, 'Male', 'B-', '58 Acorn Ave', '902853421V', 771234647, 'Joan Collins', 771234648),
(42, 'Hannah Stewart', '1985-07-07', 3, 'Female', 'AB+', '74 Palm St', '902741852V', 771234649, 'Peter Stewart', 771234650),
(43, 'Anthony Sanchez', '1997-05-19', 4, 'Male', 'O-', '99 Cypress Rd', '902389476V', 771234651, 'Christina Sanchez', 771234652),
(44, 'Natalie Morris', '1982-03-28', 5, 'Female', 'A+', '8 Bluebell Ln', '902785641V', 771234653, 'Arthur Morris', 771234654),
(45, 'Dylan Rogers', '2002-08-20', 1, 'Male', 'B+', '25 Violet St', '902148237V', 771234655, 'Judith Rogers', 771234656),
(46, 'Aria Reed', '1995-09-14', 2, 'Female', 'O+', '54 Dahlia Ave', '902378451V', 771234657, 'Russell Reed', 771234658),
(47, 'Nathan Cook', '1988-04-04', 3, 'Male', 'AB-', '91 Camellia St', '902597483V', 771234659, 'Loretta Cook', 771234660),
(48, 'Ella Morgan', '2016-12-22', 4, 'Female', 'A-', '15 Lilac St', '902684219V', 771234661, 'Calvin Morgan', 771234662),
(49, 'Andrew Bell', '1977-01-09', 5, 'Male', 'B-', '70 Daffodil Ave', '902964738V', 771234663, 'Yvonne Bell', 771234664),
(50, 'induwara', '2002-03-13', 3, 'Male', 'B+', '6/6 bemmulla', '200207111111', 11111111, 'nn', 1111111111);

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
  ADD PRIMARY KEY (`medicine_id`);

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=149;

--
-- AUTO_INCREMENT for table `doctor_clinic_department`
--
ALTER TABLE `doctor_clinic_department`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `doctor_prescription`
--
ALTER TABLE `doctor_prescription`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `medicine`
--
ALTER TABLE `medicine`
  MODIFY `medicine_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

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
