-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 24, 2019 at 08:06 PM
-- Server version: 10.1.28-MariaDB
-- PHP Version: 7.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravue`
--

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_06_01_000001_create_oauth_auth_codes_table', 2),
(4, '2016_06_01_000002_create_oauth_access_tokens_table', 2),
(5, '2016_06_01_000003_create_oauth_refresh_tokens_table', 2),
(6, '2016_06_01_000004_create_oauth_clients_table', 2),
(7, '2016_06_01_000005_create_oauth_personal_access_clients_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('20feda6441f4fd6dd707050b4bf42f22a9a6878f8dc1dead0a38dc61354329894a74ca297560c561', 1, 1, 'Ahmad ul hoq Nadim', '[]', 1, '2019-04-04 09:02:33', '2019-04-04 09:02:33', '2020-04-04 15:02:33'),
('3de4de94f2fcfbaa843a876064d4ff87804bd85d54a8c878da6fa1e812cd4c37a0e361d340f1b8df', 1, 1, 'test', '[]', 1, '2019-04-04 08:00:29', '2019-04-04 08:00:29', '2020-04-04 14:00:29');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', '9bqdpLn2vzuWDEstrzD92NkoijLQq3pRDaojjcpw', 'http://localhost', 1, 0, 0, '2019-04-04 07:39:19', '2019-04-04 07:39:19'),
(2, NULL, 'Laravel Password Grant Client', 'LUvph9LJggYG3XUZj1vrdSixt8ZgnxdBsqCcrI6I', 'http://localhost', 0, 1, 0, '2019-04-04 07:39:19', '2019-04-04 07:39:19');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2019-04-04 07:39:19', '2019-04-04 07:39:19');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `bio` mediumtext COLLATE utf8mb4_unicode_ci,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'profile.png',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `type`, `bio`, `photo`, `remember_token`, `created_at`, `updated_at`) VALUES
(16, 'Nadim', 'nadim@gmail.com', NULL, '$2y$10$RHkaPpiOw3IHvIbDddOcwuuCVQwV4MiLJr9OOIh25vQeo1yQfPgjS', 'author', 'This is Nadim\'s bio...', '1554879237.jpeg', NULL, '2019-04-06 12:36:47', '2019-04-10 00:53:57'),
(17, 'Arian', 'arian@gmail.com', NULL, '$2y$10$yoLh4fsJuhn7wYcJwedkD.gknEflJQBIRfi4GWVaFYNeXjS6IptuS', 'user', 'This is Arian\'s bio....', 'default.png', NULL, '2019-04-07 08:21:57', '2019-04-07 08:21:57'),
(18, 'Zedane', 'zedane@gmail.com', NULL, '$2y$10$iCJhZ8fBvajzIkYuRRNVOOm6/GxDyVHTtxcLIREMsUSMQuaVxUSbG', 'author', 'This is Zedane\'s bio...', 'default.png', NULL, '2019-04-07 08:22:36', '2019-04-07 08:22:36'),
(19, 'Admin', 'admin@gmail.com', NULL, '$2y$10$e6svd.qhs6SosSaKTe1fY.rEF2T7JkBl5poyzLPo6NSTNTK8c2NSy', 'admin', 'Admin...', 'default.png', NULL, '2019-04-10 03:30:10', '2019-04-10 03:30:10'),
(20, 'Author', 'author@yahoo.com', NULL, '$2y$10$xS1hqfImPtjPypL413yKeuveFC9mfK7GgIe29xGWMa0bT7/1d3Bfu', 'author', 'Author', 'default.png', NULL, '2019-04-10 03:30:35', '2019-04-10 03:30:35'),
(21, 'John Doe', 'doe@yahoo.com', NULL, '$2y$10$IUNI/wabdqdj.k2U4u5pBu4Xea1hc0/1gEK1C0iH2ZYjVJa7OBvRC', 'user', 'Doe', 'default.png', NULL, '2019-04-10 03:31:03', '2019-04-10 03:31:03'),
(22, 'Ameer', 'ameer@hotmail.com', NULL, '$2y$10$Ua.tPuVE.9.D8J46R0dDJ.IsOlMOd7kIMn.EuRJkOY8kqoVNK/xoO', 'user', 'Ameer', 'default.png', NULL, '2019-04-10 03:31:29', '2019-04-10 03:31:29'),
(23, 'Shakib', 'shakib@laravue.com', NULL, '$2y$10$PUjhA9YlCOpE9l0V7.A/XeT2aBdzqeKKRm9DOms8CccxCnDyF7sQK', 'author', 'Author', 'default.png', NULL, '2019-04-10 03:31:55', '2019-04-10 03:31:55'),
(24, 'Ahmad ul hoq Nadim', 'ahmadulhoqnadim@gamil.com', NULL, '$2y$10$ijodnJ/zzunPR4y5JTcgnezDYMAuAOiZx8HujTe9TW/bOuFsNwaBi', 'admin', 'This is My Bio...', 'default.png', NULL, '2019-04-10 03:32:21', '2019-04-10 03:32:21'),
(25, 'Some One', 'some@yahoo.com', NULL, '$2y$10$ngFrG3KV2uoy4SqrJrGXW.y.qXmy06AmuI4ulTvrUqad.8.7d8sB2', 'user', 'some one is no one.', 'default.png', NULL, '2019-04-10 03:32:56', '2019-04-10 03:32:56'),
(26, 'Jane Foster', 'foster.jain@laravue.com', NULL, '$2y$10$NkMB2FnSHIwAYb6RIWYzH./iyMZ843DwU42NiG8pSZBoAbik2B7DW', 'user', 'jane foster is a scientist', 'default.png', NULL, '2019-04-10 03:33:40', '2019-04-10 03:33:40'),
(27, 'Niki', 'niki@yahoo.com', NULL, '$2y$10$On9sKdFlq39aToffHaapvOVq.MKeO0Mps9P2OxcoTJtwxBDuG2wMG', 'user', 'niki is nk', 'default.png', NULL, '2019-04-10 03:34:15', '2019-04-10 03:34:15'),
(28, 'son of abish', 'bish@laravue.com', NULL, '$2y$10$arLLZns.YvJa1vliqDJRZO582MRNg1ewBr9rUgPQbqMyhO7KInOl.', 'user', 'oops.', 'default.png', NULL, '2019-04-10 03:34:52', '2019-04-10 03:34:52'),
(29, 'nome', 'noem@hotmail.com', NULL, '$2y$10$3QhLS6LWMTlQy6lItDTbyuYRnZoBgD5y572UIpDgfzHALRGk6K8b.', 'user', 'mone', 'default.png', NULL, '2019-04-10 03:35:21', '2019-04-10 03:35:21');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_personal_access_clients_client_id_index` (`client_id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
