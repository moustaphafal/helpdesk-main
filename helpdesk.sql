-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Feb 16, 2023 at 11:48 AM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `helpdesk`
--

-- --------------------------------------------------------

--
-- Table structure for table `persistent_logins`
--

CREATE TABLE IF NOT EXISTS `persistent_logins` (
  `username` varchar(64) NOT NULL,
  `series` varchar(64) NOT NULL,
  `token` varchar(64) NOT NULL,
  `last_used` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`series`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE IF NOT EXISTS `role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`role_id`, `role`) VALUES
(1, 'ADMIN'),
(2, 'USER'),
(3, 'SUPPORT');

-- --------------------------------------------------------

--
-- Table structure for table `status`
--

CREATE TABLE IF NOT EXISTS `status` (
  `status_id` int(11) NOT NULL AUTO_INCREMENT,
  `author` varchar(255) DEFAULT NULL,
  `description` varchar(255) NOT NULL,
  `title` varchar(50) NOT NULL,
  `update_date` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`status_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `status`
--

INSERT INTO `status` (`status_id`, `author`, `description`, `title`, `update_date`) VALUES
(1, 'admin@admin.com', 'this is a ticket update to an already open ticket', 'this is a ticket update', NULL),
(2, 'admin@admin.com', 'this is a second update to test adding status updates', 'this is a second update', NULL),
(3, 'admin@admin.com', 'this is the status update on a third ticket that was created', 'this is a status update on ticket 3', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ticket`
--

CREATE TABLE IF NOT EXISTS `ticket` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date_closed` datetime DEFAULT NULL,
  `date_opened` datetime DEFAULT NULL,
  `description` varchar(500) NOT NULL,
  `title` varchar(50) NOT NULL,
  `assigned_to_id` int(11) DEFAULT NULL,
  `created_by_id` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `last_updated` datetime DEFAULT NULL,
  `stage` varchar(255) DEFAULT NULL,
  `departement` varchar(255) DEFAULT NULL,
  `priorite` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKfatbq9qkusl0yex88521x9fk6` (`assigned_to_id`),
  KEY `FKbot3adlibnkqwfrh38v72jjo1` (`created_by_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;

--
-- Dumping data for table `ticket`
--

INSERT INTO `ticket` (`id`, `date_closed`, `date_opened`, `description`, `title`, `assigned_to_id`, `created_by_id`, `status`, `last_updated`, `stage`, `departement`, `priorite`) VALUES
(1, '2023-02-15 16:16:47', '2019-03-12 23:51:03', 'test ticket 1', 'bon', 3, 2, NULL, '2023-02-15 16:16:47', 'CLOTURE', NULL, NULL),
(2, '2023-02-15 16:17:58', '2019-03-12 23:56:32', 'test ticket 2ddu', 'bon', 2, 2, NULL, '2023-02-15 16:17:58', 'CLOTURE', NULL, NULL),
(3, '2023-02-15 16:18:41', '2019-03-16 15:33:58', 'dhhdhdhdiiueuia', 'bon', 1, 2, NULL, '2023-02-15 16:18:46', 'CLOTURE', NULL, NULL),
(4, NULL, '2019-03-16 16:17:42', 'this is a description', 'this is a title that is meant to be way too long', 2, 2, NULL, '2023-02-14 13:22:09', 'CLOTURE', NULL, NULL),
(5, '2023-02-15 16:17:24', '2023-02-13 00:05:25', 'j''ai un problème', 'bon', 2, 2, NULL, '2023-02-15 16:17:24', 'CLOTURE', NULL, NULL),
(6, NULL, '2023-02-13 10:36:52', 'j''ai un probmeme urgent', 'hdhhh', 2, 2, NULL, '2023-02-14 13:32:20', 'RECU', 'SUPPORT_TECHNIQUE', 'FAIBLE'),
(7, NULL, '2023-02-13 10:38:32', 'sjs', 'dhh', 3, 2, NULL, '2023-02-13 10:38:32', 'RECU', 'SUPPORT_TECHNIQUE', 'FAIBLE'),
(8, NULL, '2023-02-13 10:42:44', 'eeu', 'fhf', 2, 2, NULL, '2023-02-13 10:42:44', 'RECU', 'SUPPORT_TECHNIQUE', 'FAIBLE'),
(9, '2023-02-13 11:11:03', '2023-02-13 10:43:21', 'jee', 'hrh', 2, 2, NULL, '2023-02-13 11:11:03', 'CLOTURE', 'SUPPORT_COMMERCIAL', 'MOYENNE'),
(10, '2023-02-13 11:12:41', '2023-02-13 10:51:29', 'ss', 'ddgdg', 2, 2, NULL, '2023-02-13 11:12:41', 'CLOTURE', 'SUPPORT_TECHNIQUE', 'FAIBLE'),
(11, '2023-02-13 13:08:06', '2023-02-13 12:35:03', 'duud', 'hdhh', NULL, 3, NULL, '2023-02-13 13:08:06', 'CLOTURE', 'SUPPORT_TECHNIQUE', 'FAIBLE'),
(12, '2023-02-13 16:12:02', '2023-02-13 13:36:05', 'XJS', 'HHS', 2, 3, NULL, '2023-02-14 13:12:40', 'CLOTURE', 'SUPPORT_TECHNIQUE', 'FAIBLE'),
(13, NULL, '2023-02-13 13:37:12', 'SS', 'SS', 4, 4, NULL, '2023-02-14 17:28:56', 'RECU', 'SUPPORT_TECHNIQUE', 'FAIBLE'),
(14, '2023-02-13 16:12:14', '2023-02-13 13:39:18', 'jsjjs', 'hshh', 3, 3, NULL, '2023-02-13 16:12:14', 'CLOTURE', 'SUPPORT_TECHNIQUE', 'HAUTE'),
(15, NULL, '2023-02-15 11:12:34', 'duduudu', 'perkdk', NULL, 3, NULL, '2023-02-15 11:12:34', 'RECU', 'SUPPORT_TECHNIQUE', 'MOYENNE'),
(16, NULL, '2023-02-15 16:11:18', 'kkrddtlm', 'kkk', NULL, 2, NULL, '2023-02-15 16:11:18', 'RECU', 'SUPPORT_TECHNIQUE', 'FAIBLE');

-- --------------------------------------------------------

--
-- Table structure for table `ticket_status`
--

CREATE TABLE IF NOT EXISTS `ticket_status` (
  `ticket_id` int(11) NOT NULL,
  `status_id` int(11) NOT NULL,
  KEY `FK6yn1r2tmmlbdwhseesabht9o8` (`status_id`),
  KEY `FKc5crr2kjup6so4cfoslpc0a5l` (`ticket_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ticket_status`
--

INSERT INTO `ticket_status` (`ticket_id`, `status_id`) VALUES
(2, 1),
(2, 2),
(3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `active` int(11) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `active`, `email`, `firstName`, `lastName`, `password`, `username`) VALUES
(1, 1, 'bdaubry@gmail.com', 'Brian', 'Aubry', '$2a$10$.RUw5S/zyl/HGBd85o6Q/e0hnXsYyAnVzJILHTqPPkDqmlMWLPxJu', NULL),
(2, 1, 'admin@admin.com', 'admin', 'admin', '$2a$10$fD1BeYqFJntdYpE9.gNVquAAEzJxHNgqczYKGwQcn18Ngvnwt/aUO', NULL),
(3, 1, 'testuser@test.com', 'testuser', 'testuser', '$2a$10$aUGCFq11bHq/XPr4eN0sG.0z9AlX3c5OdjsMgjPjH5oYJTK2hIsFa', NULL),
(4, 1, 'support@support.com', 'support', 'support', '$2a$10$aUGCFq11bHq/XPr4eN0sG.0z9AlX3c5OdjsMgjPjH5oYJTK2hIsFa', 'support'),
(5, 1, 'assmalicksy461@gmail.com', 'Maodo', 'SY', '$2a$10$zhWbfKCcHH2OJqcfoXZ8s.P0.PEbuwoMuMAh.A2IR41dauUdlpHOe', 'msy'),
(6, 1, 'support@support.coms', 'Maodo', 'SY', '$2a$10$.LXFybDUKNunGg4NtUMX6Ol495YW5gXx6935ipHh9CVm4MUv5BDcS', 'msy'),
(7, 1, 'support@support.comss', 'Maodo', 'SY', '$2a$10$Xp/VbX3qG8JnV1T4cN38xeHlFmuHU.GXOT0Varl5PM6rRJHfymOgG', 'msy'),
(8, 1, 'testuser@test.como', 'Maodo', 'SY', '$2a$10$xnj9Hfhc9NsjyJH/iNWJGexGXl47P7fltPEaS6csVxkrMTIl4ilKW', 'msy'),
(9, 1, 'admin@admin.comzzz', 'El Hadji', 'sy', '$2a$10$PsbLn5TecqNANPjNEwNaYeG9/jhn6TwWcCOCJB71zAgYsVmSvVdaO', 'esy'),
(10, 1, 'admin@ddadmin.com', 'sjjsj', 'uzuz', '$2a$10$eqrTCLkCptDQVtrxloA7Ream67zRmMZwt0tCfNgvwFH6vxGFNC1w.', 'suzuz');

-- --------------------------------------------------------

--
-- Table structure for table `user_role`
--

CREATE TABLE IF NOT EXISTS `user_role` (
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `FKa68196081fvovjhkek5m97n3y` (`role_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_role`
--

INSERT INTO `user_role` (`user_id`, `role_id`) VALUES
(1, 2),
(1, 3),
(2, 1),
(2, 2),
(2, 3),
(3, 2),
(4, 3),
(5, 2),
(5, 3),
(6, 2),
(6, 3),
(7, 2),
(8, 2),
(8, 3),
(9, 2),
(10, 2);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
