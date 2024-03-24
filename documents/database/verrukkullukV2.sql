-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 24, 2024 at 10:02 PM
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
-- Database: `verrukkulluk`
--

-- --------------------------------------------------------

--
-- Table structure for table `beoordeling`
--

CREATE TABLE `beoordeling` (
  `id` int(11) NOT NULL,
  `persoon_id` int(11) NOT NULL,
  `recept_id` int(11) NOT NULL,
  `sterren` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `beoordeling`
--

INSERT INTO `beoordeling` (`id`, `persoon_id`, `recept_id`, `sterren`) VALUES
(1, 5, 4, 0),
(2, 2, 4, 0);

-- --------------------------------------------------------

--
-- Table structure for table `favoriet`
--

CREATE TABLE `favoriet` (
  `id` int(11) NOT NULL,
  `persoon_id` int(11) NOT NULL,
  `recept_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `favoriet`
--

INSERT INTO `favoriet` (`id`, `persoon_id`, `recept_id`) VALUES
(1, 4, 1),
(2, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `ingredient`
--

CREATE TABLE `ingredient` (
  `id` int(11) NOT NULL,
  `ingredientnaam` varchar(255) DEFAULT NULL,
  `ingredientbeschrijving` text DEFAULT NULL,
  `ingredientcalorien` int(11) DEFAULT NULL,
  `prijs` float DEFAULT NULL,
  `ingredienthoeveelheid` float DEFAULT NULL,
  `meeteenheid` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ingredient`
--

INSERT INTO `ingredient` (`id`, `ingredientnaam`, `ingredientbeschrijving`, `ingredientcalorien`, `prijs`, `ingredienthoeveelheid`, `meeteenheid`) VALUES
(1, 'Appel', 'een soort fruit', 500, 30, 29, 'stuks');

-- --------------------------------------------------------

--
-- Table structure for table `ingredientregel`
--

CREATE TABLE `ingredientregel` (
  `id` int(11) NOT NULL,
  `recept_id` int(11) NOT NULL,
  `ingredient_id` int(11) NOT NULL,
  `gebruikshoeveelheid` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ingredientregel`
--

INSERT INTO `ingredientregel` (`id`, `recept_id`, `ingredient_id`, `gebruikshoeveelheid`) VALUES
(1, 4, 1, 3.1415);

-- --------------------------------------------------------

--
-- Table structure for table `opmerking`
--

CREATE TABLE `opmerking` (
  `id` int(11) NOT NULL,
  `persoon_id` int(11) NOT NULL,
  `recept_id` int(11) NOT NULL,
  `opmerkingbescrijving` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `opmerking`
--

INSERT INTO `opmerking` (`id`, `persoon_id`, `recept_id`, `opmerkingbescrijving`) VALUES
(1, 5, 4, 'modder smaakt beter');

-- --------------------------------------------------------

--
-- Table structure for table `persoon`
--

CREATE TABLE `persoon` (
  `id` int(11) NOT NULL,
  `voornaam` varchar(255) DEFAULT NULL,
  `achternaam` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `wachtwoord` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `persoon`
--

INSERT INTO `persoon` (`id`, `voornaam`, `achternaam`, `email`, `wachtwoord`) VALUES
(1, 'Frans', 'Pannetjes', 'example@email.com', 'wachtwoord'),
(2, 'Tim', 'Applesap', 'example@email.com', 'wachtwoord'),
(3, 'Koen', 'Hendriks', 'example@email.com', 'wachtwoord'),
(4, 'Jamie', 'Ramsay', 'example@email.com', 'wachtwoord'),
(5, 'Gorden', 'Oliver', 'example@email.com', 'wachtwoord');

-- --------------------------------------------------------

--
-- Table structure for table `recept`
--

CREATE TABLE `recept` (
  `id` int(11) NOT NULL,
  `persoon_id` int(11) NOT NULL,
  `titel` varchar(255) DEFAULT NULL,
  `keuken_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `receptbeschrijving` text DEFAULT NULL,
  `datum` date DEFAULT curdate()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `recept`
--

INSERT INTO `recept` (`id`, `persoon_id`, `titel`, `keuken_id`, `type_id`, `receptbeschrijving`, `datum`) VALUES
(1, 5, 'Pizza Green', 5, 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor i', '0000-00-00'),
(2, 3, 'Sushi rolls', 7, 3, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor i', '0000-00-00'),
(3, 2, 'Hollandse Stamppot ', 8, 2, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor i', '0000-00-00'),
(4, 4, 'Vegan Burger', 6, 4, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor i', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `recept_property`
--

CREATE TABLE `recept_property` (
  `id` int(11) NOT NULL,
  `record_type` varchar(255) DEFAULT NULL,
  `beschrijving` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `recept_property`
--

INSERT INTO `recept_property` (`id`, `record_type`, `beschrijving`) VALUES
(1, 'T', 'vegetarisch'),
(2, 'T', 'vlees'),
(3, 'T', 'vis'),
(4, 'T', 'veganistsich'),
(5, 'K', 'Italiaans'),
(6, 'K', 'Amerikaans'),
(7, 'K', 'Japans'),
(8, 'K', 'Nederlands');

-- --------------------------------------------------------

--
-- Table structure for table `voorbereidingstap`
--

CREATE TABLE `voorbereidingstap` (
  `id` int(11) NOT NULL,
  `voorgaandestap_id` int(11) DEFAULT NULL,
  `recept_id` int(11) NOT NULL,
  `voorbereidingbescrijving` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `voorbereidingstap`
--

INSERT INTO `voorbereidingstap` (`id`, `voorgaandestap_id`, `recept_id`, `voorbereidingbescrijving`) VALUES
(15, NULL, 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum cursus dolor sapien, ac dictum sapien commodo sit amet. Fusce suscipit lacus feugiat, dignissim leo tristique, hendrerit nibh. Integer velit nulla, iaculis ut congue ac, sodales quis mauris. Pellentesque ac auctor erat. Morbi nibh leo, feugiat sit amet tellus vel, ultrices blandit libero. Etiam et mollis massa, nec viverra ipsum. Cras lacus ipsum, aliquam ut hendrerit vitae, convallis ut dui. Mauris nunc lacus, aliquam eu magna quis, malesuada pellentesque mauris. In facilisis lectus quis nunc vulputate varius. Etiam pulvinar eget nibh sed accumsan. Nullam vel finibus nulla. '),
(16, 15, 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum cursus dolor sapien, ac dictum sapien commodo sit amet. Fusce suscipit lacus feugiat, dignissim leo tristique, hendrerit nibh. Integer velit nulla, iaculis ut congue ac, sodales quis mauris. Pellentesque ac auctor erat. Morbi nibh leo, feugiat sit amet tellus vel, ultrices blandit libero. Etiam et mollis massa, nec viverra ipsum. Cras lacus ipsum, aliquam ut hendrerit vitae, convallis ut dui. Mauris nunc lacus, aliquam eu magna quis, malesuada pellentesque mauris. In facilisis lectus quis nunc vulputate varius. Etiam pulvinar eget nibh sed accumsan. Nullam vel finibus nulla. '),
(17, 16, 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum cursus dolor sapien, ac dictum sapien commodo sit amet. Fusce suscipit lacus feugiat, dignissim leo tristique, hendrerit nibh. Integer velit nulla, iaculis ut congue ac, sodales quis mauris. Pellentesque ac auctor erat. Morbi nibh leo, feugiat sit amet tellus vel, ultrices blandit libero. Etiam et mollis massa, nec viverra ipsum. Cras lacus ipsum, aliquam ut hendrerit vitae, convallis ut dui. Mauris nunc lacus, aliquam eu magna quis, malesuada pellentesque mauris. In facilisis lectus quis nunc vulputate varius. Etiam pulvinar eget nibh sed accumsan. Nullam vel finibus nulla. '),
(18, NULL, 2, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum cursus dolor sapien, ac dictum sapien commodo sit amet. Fusce suscipit lacus feugiat, dignissim leo tristique, hendrerit nibh. Integer velit nulla, iaculis ut congue ac, sodales quis mauris. Pellentesque ac auctor erat. Morbi nibh leo, feugiat sit amet tellus vel, ultrices blandit libero. Etiam et mollis massa, nec viverra ipsum. Cras lacus ipsum, aliquam ut hendrerit vitae, convallis ut dui. Mauris nunc lacus, aliquam eu magna quis, malesuada pellentesque mauris. In facilisis lectus quis nunc vulputate varius. Etiam pulvinar eget nibh sed accumsan. Nullam vel finibus nulla. '),
(21, 18, 2, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum cursus dolor sapien, ac dictum sapien commodo sit amet. Fusce suscipit lacus feugiat, dignissim leo tristique, hendrerit nibh. Integer velit nulla, iaculis ut congue ac, sodales quis mauris. Pellentesque ac auctor erat. Morbi nibh leo, feugiat sit amet tellus vel, ultrices blandit libero. Etiam et mollis massa, nec viverra ipsum. Cras lacus ipsum, aliquam ut hendrerit vitae, convallis ut dui. Mauris nunc lacus, aliquam eu magna quis, malesuada pellentesque mauris. In facilisis lectus quis nunc vulputate varius. Etiam pulvinar eget nibh sed accumsan. Nullam vel finibus nulla. '),
(22, NULL, 3, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum cursus dolor sapien, ac dictum sapien commodo sit amet. Fusce suscipit lacus feugiat, dignissim leo tristique, hendrerit nibh. Integer velit nulla, iaculis ut congue ac, sodales quis mauris. Pellentesque ac auctor erat. Morbi nibh leo, feugiat sit amet tellus vel, ultrices blandit libero. Etiam et mollis massa, nec viverra ipsum. Cras lacus ipsum, aliquam ut hendrerit vitae, convallis ut dui. Mauris nunc lacus, aliquam eu magna quis, malesuada pellentesque mauris. In facilisis lectus quis nunc vulputate varius. Etiam pulvinar eget nibh sed accumsan. Nullam vel finibus nulla. '),
(23, 22, 3, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum cursus dolor sapien, ac dictum sapien commodo sit amet. Fusce suscipit lacus feugiat, dignissim leo tristique, hendrerit nibh. Integer velit nulla, iaculis ut congue ac, sodales quis mauris. Pellentesque ac auctor erat. Morbi nibh leo, feugiat sit amet tellus vel, ultrices blandit libero. Etiam et mollis massa, nec viverra ipsum. Cras lacus ipsum, aliquam ut hendrerit vitae, convallis ut dui. Mauris nunc lacus, aliquam eu magna quis, malesuada pellentesque mauris. In facilisis lectus quis nunc vulputate varius. Etiam pulvinar eget nibh sed accumsan. Nullam vel finibus nulla. '),
(24, NULL, 4, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum cursus dolor sapien, ac dictum sapien commodo sit amet. Fusce suscipit lacus feugiat, dignissim leo tristique, hendrerit nibh. Integer velit nulla, iaculis ut congue ac, sodales quis mauris. Pellentesque ac auctor erat. Morbi nibh leo, feugiat sit amet tellus vel, ultrices blandit libero. Etiam et mollis massa, nec viverra ipsum. Cras lacus ipsum, aliquam ut hendrerit vitae, convallis ut dui. Mauris nunc lacus, aliquam eu magna quis, malesuada pellentesque mauris. In facilisis lectus quis nunc vulputate varius. Etiam pulvinar eget nibh sed accumsan. Nullam vel finibus nulla. ');

-- --------------------------------------------------------

--
-- Table structure for table `winkelmand`
--

CREATE TABLE `winkelmand` (
  `id` int(11) NOT NULL,
  `persoon_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `winkelmand`
--

INSERT INTO `winkelmand` (`id`, `persoon_id`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

-- --------------------------------------------------------

--
-- Table structure for table `winkelmandregel`
--

CREATE TABLE `winkelmandregel` (
  `id` int(11) NOT NULL,
  `ingredient_id` int(11) NOT NULL,
  `winkelmand_id` int(11) NOT NULL,
  `aantal` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `winkelmandregel`
--

INSERT INTO `winkelmandregel` (`id`, `ingredient_id`, `winkelmand_id`, `aantal`) VALUES
(1, 1, 1, 500),
(2, 1, 5, 800);

-- --------------------------------------------------------

--
-- Table structure for table `winkemandrecept`
--

CREATE TABLE `winkemandrecept` (
  `id` int(11) NOT NULL,
  `recept_id` int(11) NOT NULL,
  `winkelmand_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `winkemandrecept`
--

INSERT INTO `winkemandrecept` (`id`, `recept_id`, `winkelmand_id`) VALUES
(1, 4, 5);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `beoordeling`
--
ALTER TABLE `beoordeling`
  ADD PRIMARY KEY (`id`),
  ADD KEY `persoon_id` (`persoon_id`),
  ADD KEY `recept_id` (`recept_id`);

--
-- Indexes for table `favoriet`
--
ALTER TABLE `favoriet`
  ADD PRIMARY KEY (`id`),
  ADD KEY `persoon_id` (`persoon_id`),
  ADD KEY `recept_id` (`recept_id`);

--
-- Indexes for table `ingredient`
--
ALTER TABLE `ingredient`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ingredientregel`
--
ALTER TABLE `ingredientregel`
  ADD PRIMARY KEY (`id`),
  ADD KEY `recept_id` (`recept_id`),
  ADD KEY `ingredient_id` (`ingredient_id`);

--
-- Indexes for table `opmerking`
--
ALTER TABLE `opmerking`
  ADD PRIMARY KEY (`id`),
  ADD KEY `persoon_id` (`persoon_id`),
  ADD KEY `recept_id` (`recept_id`);

--
-- Indexes for table `persoon`
--
ALTER TABLE `persoon`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `recept`
--
ALTER TABLE `recept`
  ADD PRIMARY KEY (`id`),
  ADD KEY `persoon_id` (`persoon_id`),
  ADD KEY `keuken_id` (`keuken_id`),
  ADD KEY `type_id` (`type_id`);

--
-- Indexes for table `recept_property`
--
ALTER TABLE `recept_property`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `voorbereidingstap`
--
ALTER TABLE `voorbereidingstap`
  ADD PRIMARY KEY (`id`),
  ADD KEY `voorgaandestap_id` (`voorgaandestap_id`),
  ADD KEY `recept_id` (`recept_id`);

--
-- Indexes for table `winkelmand`
--
ALTER TABLE `winkelmand`
  ADD PRIMARY KEY (`id`),
  ADD KEY `persoon_id` (`persoon_id`);

--
-- Indexes for table `winkelmandregel`
--
ALTER TABLE `winkelmandregel`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ingredient_id` (`ingredient_id`),
  ADD KEY `winkelmand_id` (`winkelmand_id`);

--
-- Indexes for table `winkemandrecept`
--
ALTER TABLE `winkemandrecept`
  ADD PRIMARY KEY (`id`),
  ADD KEY `recept_id` (`recept_id`),
  ADD KEY `winkelmand_id` (`winkelmand_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `beoordeling`
--
ALTER TABLE `beoordeling`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `favoriet`
--
ALTER TABLE `favoriet`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `ingredient`
--
ALTER TABLE `ingredient`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ingredientregel`
--
ALTER TABLE `ingredientregel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `opmerking`
--
ALTER TABLE `opmerking`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `persoon`
--
ALTER TABLE `persoon`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `recept`
--
ALTER TABLE `recept`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `recept_property`
--
ALTER TABLE `recept_property`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `voorbereidingstap`
--
ALTER TABLE `voorbereidingstap`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `winkelmand`
--
ALTER TABLE `winkelmand`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `winkelmandregel`
--
ALTER TABLE `winkelmandregel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `winkemandrecept`
--
ALTER TABLE `winkemandrecept`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `beoordeling`
--
ALTER TABLE `beoordeling`
  ADD CONSTRAINT `beoordeling_ibfk_1` FOREIGN KEY (`persoon_id`) REFERENCES `persoon` (`id`),
  ADD CONSTRAINT `beoordeling_ibfk_2` FOREIGN KEY (`recept_id`) REFERENCES `recept` (`id`);

--
-- Constraints for table `favoriet`
--
ALTER TABLE `favoriet`
  ADD CONSTRAINT `favoriet_ibfk_1` FOREIGN KEY (`persoon_id`) REFERENCES `persoon` (`id`),
  ADD CONSTRAINT `favoriet_ibfk_2` FOREIGN KEY (`recept_id`) REFERENCES `recept` (`id`);

--
-- Constraints for table `ingredientregel`
--
ALTER TABLE `ingredientregel`
  ADD CONSTRAINT `ingredientregel_ibfk_1` FOREIGN KEY (`recept_id`) REFERENCES `recept` (`id`),
  ADD CONSTRAINT `ingredientregel_ibfk_2` FOREIGN KEY (`ingredient_id`) REFERENCES `ingredient` (`id`);

--
-- Constraints for table `opmerking`
--
ALTER TABLE `opmerking`
  ADD CONSTRAINT `opmerking_ibfk_1` FOREIGN KEY (`persoon_id`) REFERENCES `persoon` (`id`),
  ADD CONSTRAINT `opmerking_ibfk_2` FOREIGN KEY (`recept_id`) REFERENCES `recept` (`id`);

--
-- Constraints for table `recept`
--
ALTER TABLE `recept`
  ADD CONSTRAINT `recept_ibfk_1` FOREIGN KEY (`persoon_id`) REFERENCES `persoon` (`id`),
  ADD CONSTRAINT `recept_ibfk_2` FOREIGN KEY (`keuken_id`) REFERENCES `recept_property` (`id`),
  ADD CONSTRAINT `recept_ibfk_3` FOREIGN KEY (`type_id`) REFERENCES `recept_property` (`id`);

--
-- Constraints for table `voorbereidingstap`
--
ALTER TABLE `voorbereidingstap`
  ADD CONSTRAINT `voorbereidingstap_ibfk_1` FOREIGN KEY (`voorgaandestap_id`) REFERENCES `voorbereidingstap` (`id`),
  ADD CONSTRAINT `voorbereidingstap_ibfk_2` FOREIGN KEY (`recept_id`) REFERENCES `recept` (`id`);

--
-- Constraints for table `winkelmand`
--
ALTER TABLE `winkelmand`
  ADD CONSTRAINT `winkelmand_ibfk_1` FOREIGN KEY (`persoon_id`) REFERENCES `persoon` (`id`);

--
-- Constraints for table `winkelmandregel`
--
ALTER TABLE `winkelmandregel`
  ADD CONSTRAINT `winkelmandregel_ibfk_1` FOREIGN KEY (`ingredient_id`) REFERENCES `ingredient` (`id`),
  ADD CONSTRAINT `winkelmandregel_ibfk_2` FOREIGN KEY (`winkelmand_id`) REFERENCES `winkelmand` (`id`);

--
-- Constraints for table `winkemandrecept`
--
ALTER TABLE `winkemandrecept`
  ADD CONSTRAINT `winkemandrecept_ibfk_1` FOREIGN KEY (`recept_id`) REFERENCES `recept` (`id`),
  ADD CONSTRAINT `winkemandrecept_ibfk_2` FOREIGN KEY (`winkelmand_id`) REFERENCES `winkelmand` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
