-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 07, 2021 at 01:24 PM
-- Server version: 5.7.24
-- PHP Version: 7.2.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `foodstock`
--

-- --------------------------------------------------------

--
-- Table structure for table `aliment`
--

CREATE TABLE `aliment` (
  `id` int(11) NOT NULL,
  `nom` text COLLATE utf8_unicode_ci NOT NULL,
  `date_achat` datetime NOT NULL,
  `prix_achat` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `stock_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `aliment`
--

INSERT INTO `aliment` (`id`, `nom`, `date_achat`, `prix_achat`, `stock_id`) VALUES
(1, 'Courgette', '2021-01-07 14:05:17', '2 chèvres', 1),
(2, 'Saucisses Véganes', '2021-01-01 02:00:00', '600€', 1),
(3, 'Chocolat au lait', '2021-01-07 14:16:04', 'Le juste prix', 2);

-- --------------------------------------------------------

--
-- Table structure for table `assoc_alim_type_saison`
--

CREATE TABLE `assoc_alim_type_saison` (
  `id` int(11) NOT NULL,
  `alim_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `saison_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `assoc_alim_type_saison`
--

INSERT INTO `assoc_alim_type_saison` (`id`, `alim_id`, `type_id`, `saison_id`) VALUES
(1, 2, 2, 1),
(2, 3, 7, 3);

-- --------------------------------------------------------

--
-- Table structure for table `saison`
--

CREATE TABLE `saison` (
  `id` int(11) NOT NULL,
  `saison` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `saison`
--

INSERT INTO `saison` (`id`, `saison`) VALUES
(1, 'Hiver'),
(2, 'Pringtemps'),
(3, 'Été'),
(4, 'Automne'),
(5, 'Janvier');

-- --------------------------------------------------------

--
-- Table structure for table `stock`
--

CREATE TABLE `stock` (
  `id` int(11) NOT NULL,
  `stock` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `stock`
--

INSERT INTO `stock` (`id`, `stock`) VALUES
(1, 0),
(2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `type`
--

CREATE TABLE `type` (
  `id` int(11) NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `type`
--

INSERT INTO `type` (`id`, `type`) VALUES
(1, 'Fruit'),
(2, 'Légume'),
(3, 'Produit céréalier'),
(4, 'Produit laitier'),
(5, 'Viande'),
(6, 'Poisson'),
(7, 'Fruit de mer'),
(8, 'Matière grasse'),
(9, 'Produit sucré'),
(10, 'Liquide'),
(11, 'Condiment');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `aliment`
--
ALTER TABLE `aliment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stock_id` (`stock_id`);

--
-- Indexes for table `assoc_alim_type_saison`
--
ALTER TABLE `assoc_alim_type_saison`
  ADD PRIMARY KEY (`id`),
  ADD KEY `alim_id` (`alim_id`),
  ADD KEY `type_id` (`type_id`),
  ADD KEY `saison_id` (`saison_id`);

--
-- Indexes for table `saison`
--
ALTER TABLE `saison`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stock`
--
ALTER TABLE `stock`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `type`
--
ALTER TABLE `type`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `aliment`
--
ALTER TABLE `aliment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `assoc_alim_type_saison`
--
ALTER TABLE `assoc_alim_type_saison`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `saison`
--
ALTER TABLE `saison`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `stock`
--
ALTER TABLE `stock`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `type`
--
ALTER TABLE `type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `aliment`
--
ALTER TABLE `aliment`
  ADD CONSTRAINT `aliment_ibfk_1` FOREIGN KEY (`stock_id`) REFERENCES `stock` (`id`);

--
-- Constraints for table `assoc_alim_type_saison`
--
ALTER TABLE `assoc_alim_type_saison`
  ADD CONSTRAINT `assoc_alim_type_saison_ibfk_1` FOREIGN KEY (`alim_id`) REFERENCES `aliment` (`id`),
  ADD CONSTRAINT `assoc_alim_type_saison_ibfk_2` FOREIGN KEY (`type_id`) REFERENCES `type` (`id`),
  ADD CONSTRAINT `assoc_alim_type_saison_ibfk_3` FOREIGN KEY (`saison_id`) REFERENCES `saison` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
