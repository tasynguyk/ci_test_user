-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 09, 2015 at 06:55 PM
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
-- Table structure for table `company`
--

CREATE TABLE IF NOT EXISTS `company` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`id`, `name`) VALUES
(1, 'Valve'),
(2, 'EA'),
(3, 'Nexon');

-- --------------------------------------------------------

--
-- Table structure for table `permission`
--

CREATE TABLE IF NOT EXISTS `permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
  `companyid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `email`, `permission`, `dob`, `status`, `gender`, `companyid`) VALUES
(1, 'sangnguyen', 'e10adc3949ba59abbe56e057f20f883e', 'sang.nguyen@gmail.com', 2, '1992-12-25', 1, 1, 1),
(2, 'admin', '123', 'admin@mail.com', 1, '1990-12-25', 0, 1, 1),
(4, 'tasytest', '123', 'tasymaster@gmail.com', 0, '1983-07-02', 0, 1, 2),
(5, 'user2', '202cb962ac59075b964b07152d234b70', 'tzz@gmail.com', 0, '1995-09-05', 1, 1, 3),
(7, 'ausertest1', '123456', 'usertest1@mail.com', 0, '1995-09-20', 1, 1, 2),
(8, 'usertest2', '202cb962ac59075b964b07152d234b70', 'usertest2@mail.com', 1, '1997-05-03', 1, 1, 1),
(9, 'usertest3', 'c4ca4238a0b923820dcc509a6f75849b', 'usertest@mail.com', 1, '1998-04-02', 1, 1, 1),
(10, 'usertest4', 'usertest', 'usertest4@mail.com', 0, '1990-12-25', 1, 1, 1),
(11, 'root', 'e10adc3949ba59abbe56e057f20f883e', 'root@gmail.com', 0, '2004-02-02', 1, 1, 2);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
