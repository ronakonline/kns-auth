-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 24, 2020 at 05:38 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `knsauth`
--

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `first_name` mediumtext NOT NULL,
  `last_name` mediumtext NOT NULL,
  `email` mediumtext NOT NULL,
  `password` mediumtext NOT NULL,
  `user_type` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `last_loggedin` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `password`, `user_type`, `created_at`, `last_loggedin`) VALUES
(1, 'John', 'Rey', 'admin@admin.com', 'admin@1', 1, '2020-06-23 20:17:25', '2020-06-24 13:46:37');

-- --------------------------------------------------------

--
-- Table structure for table `user_types`
--

CREATE TABLE `user_types` (
  `id` int(11) NOT NULL,
  `name` mediumtext NOT NULL,
  `create_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_types`
--

INSERT INTO `user_types` (`id`, `name`, `create_at`) VALUES
(1, 'admin', '2020-06-24 15:36:36');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_types`
--
ALTER TABLE `user_types`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user_types`
--
ALTER TABLE `user_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
