-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 07, 2019 at 08:09 PM
-- Server version: 10.1.34-MariaDB
-- PHP Version: 5.6.37

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `api_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `class` varchar(255) NOT NULL,
  `rollnumber` int(11) NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `user_id`, `name`, `class`, `rollnumber`, `created`, `modified`) VALUES
(1, 5, 'Ali', '9th', 1, '2019-10-07 21:11:43', '2019-10-07 16:11:43'),
(2, 5, 'John', '10th', 2, '2019-10-07 21:12:12', '2019-10-07 16:12:12'),
(3, 5, 'Hamza', '10th', 3, '2019-10-07 21:12:36', '2019-10-07 16:12:36'),
(4, 5, 'Amir', '10th', 4, '2019-10-07 21:13:21', '2019-10-07 16:13:21'),
(5, 5, 'Saddam', '10th', 5, '2019-10-07 21:13:43', '2019-10-07 16:13:43'),
(6, 5, 'Adil', '10th', 6, '2019-10-07 21:14:05', '2019-10-07 16:14:05'),
(7, 5, 'Amin', '10th', 7, '2019-10-07 21:14:18', '2019-10-07 16:14:18'),
(8, 5, 'Usman', '10th', 8, '2019-10-07 21:15:06', '2019-10-07 16:15:06'),
(9, 5, 'Zahid', '10th', 9, '2019-10-07 21:15:06', '2019-10-07 16:15:06'),
(10, 5, 'Mohsin', '10th', 10, '2019-10-07 21:15:44', '2019-10-07 16:15:44'),
(11, 5, 'Awais', '10th', 11, '2019-10-07 21:15:44', '2019-10-07 16:15:44'),
(12, 5, 'Abdul', '10th', 12, '2019-10-07 21:16:51', '2019-10-07 16:16:51'),
(13, 5, 'Umer', '10th', 13, '2019-10-07 21:17:28', '2019-10-07 16:17:28'),
(14, 5, 'Zunira', '10th', 14, '2019-10-07 21:17:28', '2019-10-07 16:17:28');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `firstname` varchar(256) NOT NULL,
  `lastname` varchar(256) NOT NULL,
  `email` varchar(256) NOT NULL,
  `password` varchar(2048) NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `email`, `password`, `created`, `modified`) VALUES
(5, 'Haroon', 'Sohail', 'haroon@haroon.com', '$2y$10$1GhTGP9xY8pqgYnw9Olvmu9ixgb9e3arUYoOjsajjoiV3TwdclFu.', '2019-10-07 18:51:55', '2019-10-07 13:51:55');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `rollnumber` (`rollnumber`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `students_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
