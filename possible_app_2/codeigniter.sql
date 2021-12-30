-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 29, 2021 at 01:26 PM
-- Server version: 10.4.16-MariaDB
-- PHP Version: 7.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `codeigniter`
--

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE `post` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `slug` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `post`
--

INSERT INTO `post` (`id`, `title`, `body`, `slug`, `created_at`) VALUES
(1, 'test', 'test', 'test', '2021-11-11 14:28:14'),
(2, 'dasda', 'dsadas', 'dasda', '2021-11-11 21:55:44'),
(3, 'dasda', 'dsadas', 'dasda', '2021-11-11 21:58:34'),
(4, 'dasda', 'dsadas', 'dasda', '2021-11-11 22:00:07'),
(5, 'dasda', 'dsadas', 'dasda', '2021-11-11 22:01:09'),
(6, 'dasda', 'dsadas', 'dasda', '2021-11-11 22:01:58'),
(7, 'dasda', 'dsadas', 'dasda', '2021-11-11 22:05:30'),
(8, 'dasda', 'dsadas', 'dasda', '2021-11-11 22:07:33'),
(9, 'dasda', 'dsadas', 'dasda', '2021-11-11 22:08:10');

-- --------------------------------------------------------

--
-- Table structure for table `predmeti`
--

CREATE TABLE `predmeti` (
  `ime` text NOT NULL,
  `opis` text NOT NULL,
  `profesor` text NOT NULL,
  `lastnost` text NOT NULL,
  `id` int(11) NOT NULL,
  `povzetek` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `predmeti`
--

INSERT INTO `predmeti` (`ime`, `opis`, `profesor`, `lastnost`, `id`, `povzetek`) VALUES
('test', 'test', 'test', 'test', 1, ''),
('test2', 'test2', 'test2', 'test2', 2, '');

-- --------------------------------------------------------

--
-- Table structure for table `uporabnik_predmet`
--

CREATE TABLE `uporabnik_predmet` (
  `uporabnik` int(11) NOT NULL,
  `predmet` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `uporabnik_predmet`
--

INSERT INTO `uporabnik_predmet` (`uporabnik`, `predmet`) VALUES
(3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp(),
  `charname` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `created_at`, `updated_at`, `charname`) VALUES
(1, '', '$2y$10$v5pRZUlM0eQ7o3b9TYDMi.Pq4ibSzphdCI.d/rMLGLpgSTt1TuJjG', '2021-11-14 22:24:56', '2021-11-14 22:24:56', 'tester'),
(2, 'Arkwir', '$2y$10$LEFWdUIR1Gc9UyMmQf.PMuzVQTQWd2e1HxiIiEESKlFJb6KGD..Ku', '2021-11-14 22:55:55', '2021-11-14 22:55:55', 'Arkwir Karnemos'),
(3, 'Jure', '$2y$10$t5VAC2sTV5LYM2s6qNk32O2EzAT/20CA.pH0DfBDbAbGqswoyPh9.', '2021-11-17 01:00:40', '2021-11-17 01:00:40', 'Arkwir'),
(4, 'ana', '$2y$10$99URPpo9vP/WJlSxUTbfDuCskbv49/1JK0CoT/AT19riPuG9U3NXq', '2021-12-29 13:14:51', '2021-12-29 13:14:51', 'Lorilyl');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `predmeti`
--
ALTER TABLE `predmeti`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `uporabnik_predmet`
--
ALTER TABLE `uporabnik_predmet`
  ADD PRIMARY KEY (`uporabnik`,`predmet`),
  ADD KEY `uporabnik_id` (`uporabnik`),
  ADD KEY `predmet_id` (`predmet`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `post`
--
ALTER TABLE `post`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `predmeti`
--
ALTER TABLE `predmeti`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `uporabnik_predmet`
--
ALTER TABLE `uporabnik_predmet`
  ADD CONSTRAINT `uporabnik_predmet_ibfk_1` FOREIGN KEY (`predmet`) REFERENCES `predmeti` (`id`),
  ADD CONSTRAINT `uporabnik_predmet_ibfk_2` FOREIGN KEY (`uporabnik`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
