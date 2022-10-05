-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 16, 2022 at 03:44 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

--
-- Database: `s103440939`
--

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `email` varchar(50) NOT NULL,
  `gender` char(1) NOT NULL,
  `teams` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `name`, `email`, `gender`, `teams`) VALUES
(1, 'Nguyen Duc Linh', 'duclinhpq2001@gmail.com', 'M', 'Team 1'),
(2, 'Hoang Anh Tuan', 'anhtuanhoang2001@gmail.com', 'M', 'Team 2'),
(3, 'Nguyen Ngoc Dang Quang', 'quangnguyen2162001@gmail.com', 'M', 'Team 3'),
(4, 'Do Tuan Anh', 'donshina2001@gmail.com', 'M', 'Team 4'),
(5, 'Nguyen Kim Anh', 'kimanh_2301@gmail.com', 'F', 'Team 5'),
(6, 'Nguyen Linh Hong', 'bunnynguyen2105@gmail.com', 'F', 'Team 1'),
(7, 'game la de', 'test@gmail.com', 'F', 'Team 1');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `firstname`, `lastname`) VALUES
(-1, 'admin', 'e10adc3949ba59abbe56e057f20f883e', 'huy', 'huy'),
(1, 'test', 'e10adc3949ba59abbe56e057f20f883e', 'Thien', 'Huynh'),
(3, 'test2', 'e10adc3949ba59abbe56e057f20f883e', 'test', 'test'),
(4, 'test3', 'e10adc3949ba59abbe56e057f20f883e', 'test', 'testtest');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;
