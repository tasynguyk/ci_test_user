-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 13, 2015 at 05:16 PM
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
  `company_id` int(11) NOT NULL AUTO_INCREMENT,
  `vi_name` varchar(40) CHARACTER SET utf8 NOT NULL,
  `en_name` varchar(40) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`company_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`company_id`, `vi_name`, `en_name`) VALUES
(1, 'Đại Hàn', 'Korea'),
(2, 'Nhật Bản', 'Japan'),
(3, 'Mỹ', 'USA'),
(4, 'Mã Lai Á', 'Malaysia');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `email`, `permission`, `dob`, `status`, `gender`, `companyid`) VALUES
(1, 'sangnguyen', 'e10adc3949ba59abbe56e057f20f883e', 'sang.nguyen@gmail.com', 2, '1992-12-25', 1, 1, 1),
(5, 'user2', '202cb962ac59075b964b07152d234b70', 'tzz@gmail.com', 0, '2005-03-01', 1, 1, 3),
(7, 'ausertest1', '123456', 'usertest1@mail.com', 0, '1995-09-20', 1, 1, 2),
(8, 'usertest2', '202cb962ac59075b964b07152d234b70', 'usertest2@mail.com', 1, '1997-05-03', 1, 1, 1),
(9, 'usertest3', '202cb962ac59075b964b07152d234b70', 'usertest@mail.com', 0, '2000-06-04', 1, 1, 4),
(10, 'usertest4', 'usertest', 'usertest4@mail.com', 0, '1990-12-25', 1, 1, 1),
(11, 'root', 'e10adc3949ba59abbe56e057f20f883e', 'root@gmail.com', 0, '2004-02-02', 1, 1, 2),
(12, 'kira', '202cb962ac59075b964b07152d234b70', 'kira@light.com', 0, '2000-03-03', 1, 1, 2);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
