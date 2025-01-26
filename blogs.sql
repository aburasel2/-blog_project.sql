-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 26, 2025 at 08:15 PM
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
-- Database: `blogs`
--

-- --------------------------------------------------------

--
-- Table structure for table `authors`
--

CREATE TABLE `authors` (
  `id` int(11) NOT NULL,
  `author_name` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `authors`
--

INSERT INTO `authors` (`id`, `author_name`, `created_at`, `updated_at`) VALUES
(2, 'Rasel', '2025-01-26 11:42:41', '2025-01-26 16:22:48'),
(3, 'Jane Smith', '2025-01-26 11:42:41', '2025-01-26 11:42:41'),
(4, 'Alice Johnson', '2025-01-26 11:42:41', '2025-01-26 11:42:41'),
(5, 'Robert Brown', '2025-01-26 11:42:41', '2025-01-26 11:42:41'),
(6, 'Emily Davis', '2025-01-26 11:42:41', '2025-01-26 11:42:41'),
(7, 'John Doe', '2025-01-26 16:18:36', '2025-01-26 16:18:36'),
(8, 'John Doe', '2025-01-26 16:18:36', '2025-01-26 16:18:36'),
(9, 'John Doe', '2025-01-26 16:18:39', '2025-01-26 16:18:39');

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `category_id` int(11) NOT NULL,
  `author_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `blogs`
--

INSERT INTO `blogs` (`id`, `title`, `body`, `category_id`, `author_id`, `created_at`, `updated_at`) VALUES
(3, 'My Updated blog title', 'Content about minimalism...', 3, 3, '2025-01-26 16:12:06', '2025-01-26 17:25:30'),
(5, 'Online Learning Platforms', 'Content about online education...', 5, 5, '2025-01-26 16:12:06', '2025-01-26 16:12:06'),
(8, 'How to Declutter Your Home', 'Content about decluttering...', 3, 3, '2025-01-26 16:12:06', '2025-01-26 16:12:06'),
(9, 'Top 5 Beaches to Visit', 'Content about travel destinations...', 4, 4, '2025-01-26 16:12:06', '2025-01-26 16:12:06'),
(10, 'Importance of Lifelong Learning', 'Content about continuous education...', 4, 4, '2025-01-26 16:12:06', '2025-01-26 18:47:12'),
(11, 'My blog', 'My blog\'s content', 3, 2, '2025-01-26 17:11:35', '2025-01-26 17:11:35');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `category_name` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category_name`, `created_at`, `updated_at`) VALUES
(1, 'Technology', '2025-01-26 16:12:02', '2025-01-26 16:12:02'),
(3, 'Lifestyle', '2025-01-26 16:12:02', '2025-01-26 16:12:02'),
(4, 'Travel', '2025-01-26 16:12:02', '2025-01-26 16:12:02'),
(5, 'Education', '2025-01-26 16:12:02', '2025-01-26 16:12:02'),
(6, 'Privet', '2025-01-26 17:06:08', '2025-01-26 17:06:08'),
(7, 'Buisness', '2025-01-26 17:07:10', '2025-01-26 17:07:10');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `authors`
--
ALTER TABLE `authors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `author_id` (`author_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `authors`
--
ALTER TABLE `authors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `blogs`
--
ALTER TABLE `blogs`
  ADD CONSTRAINT `blogs_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `blogs_ibfk_2` FOREIGN KEY (`author_id`) REFERENCES `authors` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
