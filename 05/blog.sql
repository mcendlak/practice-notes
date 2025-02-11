-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Feb 11, 2025 at 11:15 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `blog`
--

-- --------------------------------------------------------

--
-- Table structure for table `authors`
--

CREATE TABLE `authors` (
  `id` int(11) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `authors`
--

INSERT INTO `authors` (`id`, `firstname`, `lastname`, `email`, `created_at`) VALUES
(1, 'Feliks', 'Nowakowski', 'fnowakowski@wp.pl', '2025-02-04 20:58:37'),
(2, 'Marek', 'Kowal', 'mkowal@wp.pl', '2025-02-04 20:59:19');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `created_at`) VALUES
(1, 'Porady', '2025-02-04 21:31:19'),
(2, 'Złe rady', '2025-02-04 21:31:19'),
(3, 'Ciekawostki', '2025-02-04 21:31:19');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `comment` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `username`, `comment`, `created_at`) VALUES
(1, 'felek', 'coś tam', '2025-02-11 22:12:27'),
(2, 'krystian', 'no co ty powiesz', '2025-02-11 22:12:41');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `author_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `title`, `content`, `author_id`, `created_at`, `updated_at`) VALUES
(1, 'Pierwszy post Feliksa', 'To jest pierwszy post, ale nic w nim konkretnego nie ma', 1, '2025-02-04 21:21:15', '2025-02-04 21:21:15'),
(2, 'Drugi od Felka', 'Tutaj też nic nie ma, bo się uczę SQLa', 1, '2025-02-04 21:22:06', '2025-02-04 21:22:06'),
(3, 'Pierwszy post Marka', 'Jak wyżej, nic tu nie ma, tylko bez sensu tekst', 2, '2025-02-04 21:23:15', '2025-02-04 21:23:15'),
(4, 'Drugi post Marka', 'Teraz sprawdzam, czy po insert mogę dać inną kolejność nazw kolumn, a wartości wejdą i tak', 2, '2025-02-04 21:24:20', '2025-02-04 21:24:20'),
(35, 'Post 1', 'Treść posta 1', 1, '2025-02-11 21:53:32', '2025-02-11 21:53:32'),
(36, 'Post 2', 'Treść posta 2', 2, '2025-02-11 21:53:32', '2025-02-11 21:53:32'),
(37, 'Post 3', 'Treść posta 3', 1, '2025-02-11 21:53:32', '2025-02-11 21:53:32'),
(38, 'Post 4', 'Treść posta 4', 2, '2025-02-11 21:53:32', '2025-02-11 21:53:32'),
(39, 'Post 5', 'Treść posta 5', 1, '2025-02-11 21:53:32', '2025-02-11 21:53:32'),
(40, 'Post 6', 'Treść posta 6', 2, '2025-02-11 21:53:32', '2025-02-11 21:53:32'),
(41, 'Post 7', 'Treść posta 7', 1, '2025-02-11 21:53:32', '2025-02-11 21:53:32'),
(42, 'Post 8', 'Treść posta 8', 2, '2025-02-11 21:53:32', '2025-02-11 21:53:32'),
(43, 'Post 9', 'Treść posta 9', 1, '2025-02-11 21:53:32', '2025-02-11 21:53:32'),
(44, 'Post 10', 'Treść posta 10', 2, '2025-02-11 21:53:32', '2025-02-11 21:53:32'),
(45, 'Post 11', 'Treść posta 11', 1, '2025-02-11 21:53:32', '2025-02-11 21:53:32'),
(46, 'Post 12', 'Treść posta 12', 2, '2025-02-11 21:53:32', '2025-02-11 21:53:32'),
(47, 'Post 13', 'Treść posta 13', 1, '2025-02-11 21:53:32', '2025-02-11 21:53:32'),
(48, 'Post 14', 'Treść posta 14', 2, '2025-02-11 21:53:32', '2025-02-11 21:53:32'),
(49, 'Post 15', 'Treść posta 15', 1, '2025-02-11 21:53:32', '2025-02-11 21:53:32'),
(50, 'Post 16', 'Treść posta 16', 2, '2025-02-11 21:53:32', '2025-02-11 21:53:32'),
(51, 'Post 17', 'Treść posta 17', 1, '2025-02-11 21:53:32', '2025-02-11 21:53:32'),
(52, 'Post 18', 'Treść posta 18', 2, '2025-02-11 21:53:32', '2025-02-11 21:53:32'),
(53, 'Post 19', 'Treść posta 19', 1, '2025-02-11 21:53:32', '2025-02-11 21:53:32'),
(54, 'Post 20', 'Treść posta 20', 2, '2025-02-11 21:53:32', '2025-02-11 21:53:32'),
(55, 'Post 21', 'Treść posta 21', 1, '2025-02-11 21:53:32', '2025-02-11 21:53:32'),
(56, 'Post 22', 'Treść posta 22', 2, '2025-02-11 21:53:32', '2025-02-11 21:53:32'),
(57, 'Post 23', 'Treść posta 23', 1, '2025-02-11 21:53:32', '2025-02-11 21:53:32'),
(58, 'Post 24', 'Treść posta 24', 2, '2025-02-11 21:53:32', '2025-02-11 21:53:32'),
(59, 'Post 25', 'Treść posta 25', 1, '2025-02-11 21:53:32', '2025-02-11 21:53:32'),
(60, 'Post 26', 'Treść posta 26', 2, '2025-02-11 21:53:32', '2025-02-11 21:53:32'),
(61, 'Post 27', 'Treść posta 27', 1, '2025-02-11 21:53:32', '2025-02-11 21:53:32'),
(62, 'Post 28', 'Treść posta 28', 2, '2025-02-11 21:53:32', '2025-02-11 21:53:32'),
(63, 'Post 29', 'Treść posta 29', 1, '2025-02-11 21:53:32', '2025-02-11 21:53:32'),
(64, 'Post 30', 'Treść posta 30', 2, '2025-02-11 21:53:32', '2025-02-11 21:53:32');

-- --------------------------------------------------------

--
-- Table structure for table `posts_categories`
--

CREATE TABLE `posts_categories` (
  `post_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `posts_categories`
--

INSERT INTO `posts_categories` (`post_id`, `category_id`) VALUES
(1, 1),
(1, 3),
(2, 2),
(2, 3),
(3, 1),
(3, 3),
(4, 2),
(4, 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `authors`
--
ALTER TABLE `authors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_email` (`email`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_posts_authors` (`author_id`);

--
-- Indexes for table `posts_categories`
--
ALTER TABLE `posts_categories`
  ADD PRIMARY KEY (`post_id`,`category_id`),
  ADD KEY `fk_categories` (`category_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `fk_posts_authors` FOREIGN KEY (`author_id`) REFERENCES `authors` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `posts_categories`
--
ALTER TABLE `posts_categories`
  ADD CONSTRAINT `fk_categories` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_posts` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
