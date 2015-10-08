-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 08, 2015 at 06:50 PM
-- Server version: 5.5.44-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `users`
--

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(40) NOT NULL,
  `password` varchar(40) NOT NULL,
  `email` varchar(45) NOT NULL,
  `permission` int(11) NOT NULL,
  `dob` date DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `gender` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `email`, `permission`, `dob`, `status`, `gender`) VALUES
(1, 'sangnguyen', 'e10adc3949ba59abbe56e057f20f883e', 'sang.nguyen@gmail.com', 2, '1992-12-25', 1, 1),
(2, 'admin', 'e10adc3949ba59abbe56e057f20f883e', 'admin@mail.com', 1, '1990-12-25', 1, 1),
(4, 'tasy', '202cb962ac59075b964b07152d234b70', 'tasymaster@gmail.com', 0, '1990-12-25', 1, 1),
(5, 'user2', 'e10adc3949ba59abbe56e057f20f883e', 'tzz@gmail.com', 0, '1990-12-25', 1, 1),
(7, 'ausertest1', '123456', 'usertest1@mail.com', 0, '1995-09-20', 1, 1),
(8, 'usertest2', 'usertest2', 'usertest2@mail.com', 0, '1990-12-25', 1, 1),
(9, 'usertest3', 'usertest', 'usertest@mail.com', 0, '1987-12-25', 1, 1),
(10, 'usertest4', 'usertest', 'usertest4@mail.com', 0, '1990-12-25', 1, 1);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
