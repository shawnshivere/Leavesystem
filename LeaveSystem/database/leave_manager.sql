-- phpMyAdmin SQL Dump
-- version 4.8.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 11, 2018 at 06:36 PM
-- Server version: 10.1.33-MariaDB
-- PHP Version: 7.2.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `leave_manager`
--

-- --------------------------------------------------------

--
-- Table structure for table `accepted_leaves`
--

CREATE TABLE `accepted_leaves` (
  `id` int(11) NOT NULL,
  `leave_id` bigint(20) NOT NULL,
  `staff_id` bigint(20) NOT NULL,
  `leave_type` varchar(250) NOT NULL,
  `num_days` int(11) NOT NULL,
  `date_accepted` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `admin_id` bigint(20) NOT NULL,
  `title` varchar(20) NOT NULL,
  `fname` varchar(150) NOT NULL,
  `lname` varchar(150) NOT NULL,
  `username` varchar(70) NOT NULL,
  `password` varchar(250) NOT NULL,
  `email` varchar(200) NOT NULL,
  `phone` int(10) UNSIGNED NOT NULL,
  `date_registered` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `admin_id`, `title`, `fname`, `lname`, `username`, `password`, `email`, `phone`, `date_registered`) VALUES
(1, 152122333134, 'Dr', 'Main', 'Administrator', 'admin', '$2y$10$p3d1dr/FuAkfqQ30EAuqlumWF7c9vy4b0kKkSpx2.janWhzBU5nu6', 'groupone-admin@gmail.com', 500000000, '2018-03-22');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `id` int(11) NOT NULL,
  `staff_id` bigint(20) NOT NULL,
  `title` varchar(20) NOT NULL,
  `fname` varchar(150) NOT NULL,
  `lname` varchar(150) NOT NULL,
  `username` varchar(70) NOT NULL,
  `password` varchar(250) NOT NULL,
  `email` varchar(200) NOT NULL,
  `country_code` varchar(4) NOT NULL,
  `phone` int(10) UNSIGNED NOT NULL,
  `supervisor` varchar(200) DEFAULT NULL,
  `staff_level` enum('supervisor','non-supervisor') DEFAULT NULL,
  `date_registered` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`id`, `staff_id`, `title`, `fname`, `lname`, `username`, `password`, `email`, `country_code`, `phone`, `supervisor`, `staff_level`, `date_registered`) VALUES
(1, 3201821131600, 'Mr', 'Sample', 'Supervisor', 'supervisor', '$2y$10$WlamRug8jhoNKItvm6b7leFwecCAG14KtzwJ47bp7W4ti7JBbm1jy', 'supervisor@yahoo.com', '+233', 543550008, 'N/A', 'supervisor', '2018-03-21');

-- --------------------------------------------------------

--
-- Table structure for table `job_description`
--

CREATE TABLE `job_description` (
  `id` int(11) NOT NULL,
  `staff_id` bigint(20) NOT NULL,
  `staff_level` enum('supervisor','non-supervisor') NOT NULL,
  `salary_level` decimal(45,2) NOT NULL,
  `date_joined` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `job_description`
--

INSERT INTO `job_description` (`id`, `staff_id`, `staff_level`, `salary_level`, `date_joined`) VALUES
(1, 3201821131600, 'supervisor', '1500.00', '2017-10-30'),
(2, 4201804045945, 'non-supervisor', '5000.00', '2018-03-05');

-- --------------------------------------------------------

--
-- Table structure for table `leaves`
--

CREATE TABLE `leaves` (
  `id` int(11) NOT NULL,
  `leave_id` bigint(20) NOT NULL,
  `leave_type` enum('annual','sick','maternity','paternity','study','emergency','casual','special','examinations','sports','absense','short_embark_disembark','long_embark_disembark') NOT NULL,
  `allowed_days` bigint(20) NOT NULL,
  `current_days` int(11) NOT NULL,
  `allowed_monthly_days` bigint(20) NOT NULL,
  `for_staff_level` varchar(200) NOT NULL,
  `auto_update` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `leave_applications`
--

CREATE TABLE `leave_applications` (
  `id` int(11) NOT NULL,
  `leave_id` bigint(20) NOT NULL,
  `staff_id` bigint(20) NOT NULL,
  `leave_type` varchar(250) NOT NULL,
  `leave_start_date` varchar(25) NOT NULL,
  `leave_end_date` varchar(25) NOT NULL,
  `action` enum('accept','reject') DEFAULT NULL,
  `date_requested` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `leave_applications`
--

INSERT INTO `leave_applications` (`id`, `leave_id`, `staff_id`, `leave_type`, `leave_start_date`, `leave_end_date`, `action`, `date_requested`) VALUES
(1, 191521664375, 3201821131600, 'annual', '2018-03-22', '2018-03-30', 'accept', '21-03-2018'),
(4, 201521664189, 3201821131600, 'annual', '2018-03-31', '2018-04-03', 'accept', '24-03-2018'),
(6, 171521752477, 3201821131600, 'long_embark_disembark', '2018-03-24', '2018-03-31', 'accept', '24-03-2018'),
(7, 0, 3201821131600, 'study', '2018-03-26', '2018-03-31', 'reject', '24-03-2018'),
(8, 141521664294, 3201821131600, 'examinations', '2018-03-29', '2018-03-30', 'accept', '22-03-2018'),
(9, 191521664322, 3201821131600, 'sports', '2018-03-29', '2018-04-07', 'accept', '22-03-2018'),
(10, 201521664164, 3201821131600, 'maternity', '2018-03-28', '2018-04-04', 'accept', '22-03-2018'),
(11, 161521664278, 4201804045945, 'special', '2018-03-23', '2018-03-30', 'accept', '22-03-2018'),
(12, 191521664227, 4201804045945, 'emergency', '2018-03-31', '2018-04-06', 'accept', '25-03-2018'),
(13, 111521833755, 3201821131600, 'sick', '2018-04-07', '2018-04-13', 'accept', '29-03-2018'),
(14, 141521664135, 3201821131600, 'annual', '2018-03-30', '2018-04-01', 'accept', '29-03-2018');

-- --------------------------------------------------------

--
-- Table structure for table `password_recovery_meta`
--

CREATE TABLE `password_recovery_meta` (
  `id` int(11) NOT NULL,
  `token` varchar(2000) NOT NULL,
  `expiry` bigint(20) DEFAULT NULL,
  `email` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `recommended_leaves`
--

CREATE TABLE `recommended_leaves` (
  `id` int(11) NOT NULL,
  `leave_id` bigint(20) NOT NULL,
  `leave_type` varchar(250) NOT NULL,
  `staff_id` bigint(20) NOT NULL,
  `recommended_by` varchar(250) NOT NULL,
  `num_days` int(11) NOT NULL,
  `why_recommend` varchar(1000) NOT NULL,
  `date_recommended` varchar(25) NOT NULL,
  `status` enum('accepted','rejected') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `rejected_leaves`
--

CREATE TABLE `rejected_leaves` (
  `id` int(11) NOT NULL,
  `leave_id` bigint(20) NOT NULL,
  `staff_id` bigint(20) NOT NULL,
  `leave_type` varchar(250) NOT NULL,
  `reason_reject` varchar(1000) DEFAULT NULL,
  `date_rejected` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user_leave_metadata`
--

CREATE TABLE `user_leave_metadata` (
  `id` int(11) NOT NULL,
  `staff_level` varchar(200) NOT NULL,
  `total_yr_leave_count` bigint(20) NOT NULL,
  `total_month_leave_count` bigint(20) NOT NULL,
  `current_days` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_leave_metadata`
--

INSERT INTO `user_leave_metadata` (`id`, `staff_level`, `total_yr_leave_count`, `total_month_leave_count`, `current_days`) VALUES
(1, 'non-supervisor', 300, 25, 300),
(2, 'supervisor', 320, 30, 320);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accepted_leaves`
--
ALTER TABLE `accepted_leaves`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admin_id` (`admin_id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `phone` (`phone`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `staff_id` (`staff_id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `phone` (`phone`);

--
-- Indexes for table `job_description`
--
ALTER TABLE `job_description`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `leaves`
--
ALTER TABLE `leaves`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `leave_id` (`leave_id`);

--
-- Indexes for table `leave_applications`
--
ALTER TABLE `leave_applications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_recovery_meta`
--
ALTER TABLE `password_recovery_meta`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `recommended_leaves`
--
ALTER TABLE `recommended_leaves`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rejected_leaves`
--
ALTER TABLE `rejected_leaves`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_leave_metadata`
--
ALTER TABLE `user_leave_metadata`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accepted_leaves`
--
ALTER TABLE `accepted_leaves`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `job_description`
--
ALTER TABLE `job_description`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `leaves`
--
ALTER TABLE `leaves`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `leave_applications`
--
ALTER TABLE `leave_applications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `password_recovery_meta`
--
ALTER TABLE `password_recovery_meta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `recommended_leaves`
--
ALTER TABLE `recommended_leaves`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rejected_leaves`
--
ALTER TABLE `rejected_leaves`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_leave_metadata`
--
ALTER TABLE `user_leave_metadata`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
