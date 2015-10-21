-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 21, 2015 at 04:08 PM
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`id`) VALUES
(1),
(2),
(4),
(5),
(6);

-- --------------------------------------------------------

--
-- Table structure for table `company_name`
--

CREATE TABLE IF NOT EXISTS `company_name` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `language` varchar(45) NOT NULL,
  `name` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `company_name`
--

INSERT INTO `company_name` (`id`, `company_id`, `language`, `name`) VALUES
(1, 1, 'vietnamese', 'Đại Hàn'),
(2, 2, 'english', 'abc'),
(4, 1, 'english', 'Korea'),
(5, 4, 'english', 'USA'),
(6, 4, 'vietnamese', 'Mỹ'),
(7, 2, 'vietnamese', 'cccccc'),
(8, 5, 'vietnamese', 'Nhật Bản');

-- --------------------------------------------------------

--
-- Table structure for table `group`
--

CREATE TABLE IF NOT EXISTS `group` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) CHARACTER SET utf8 NOT NULL,
  `description` varchar(250) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `group`
--

INSERT INTO `group` (`ID`, `name`, `description`) VALUES
(1, 'Super Admin', 'Super Admin'),
(2, 'Company leader', 'Company team leader'),
(3, 'Company creater', 'Company creater'),
(4, 'User editer', 'User editer'),
(5, 'User creater', '423432');

-- --------------------------------------------------------

--
-- Table structure for table `group_resource`
--

CREATE TABLE IF NOT EXISTS `group_resource` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `groupID` int(11) NOT NULL,
  `resourceID` int(11) NOT NULL,
  `create` tinyint(1) NOT NULL,
  `edit` tinyint(1) NOT NULL,
  `delete` tinyint(1) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `group_resource`
--

INSERT INTO `group_resource` (`ID`, `groupID`, `resourceID`, `create`, `edit`, `delete`) VALUES
(1, 1, 1, 1, 1, 1),
(3, 1, 2, 1, 1, 1),
(4, 3, 2, 1, 0, 0),
(5, 4, 1, 1, 1, 0),
(6, 1, 3, 1, 1, 1),
(7, 1, 4, 1, 1, 1),
(9, 2, 2, 1, 1, 1),
(10, 1, 5, 1, 1, 1),
(11, 1, 6, 1, 1, 1),
(12, 2, 1, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `language`
--

CREATE TABLE IF NOT EXISTS `language` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(45) NOT NULL,
  `name` varchar(45) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `language`
--

INSERT INTO `language` (`id`, `code`, `name`) VALUES
(1, 'en', 'English'),
(2, 'cn', 'Chinese'),
(4, 'jp', 'Japanese'),
(5, 'kr', 'Korean');

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE IF NOT EXISTS `news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `news`
--


-- --------------------------------------------------------

--
-- Table structure for table `news_info`
--

CREATE TABLE IF NOT EXISTS `news_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `new_id` int(11) NOT NULL,
  `language_code` varchar(45) NOT NULL,
  `title` varchar(45) CHARACTER SET utf8 NOT NULL,
  `description` varchar(100) CHARACTER SET utf8 NOT NULL,
  `content` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `news_info`
--

-- --------------------------------------------------------

--
-- Table structure for table `permission`
--

-- --------------------------------------------------------

--
-- Table structure for table `resource`
--

CREATE TABLE IF NOT EXISTS `resource` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `resource_name` varchar(40) CHARACTER SET utf8 NOT NULL,
  `resource_description` varchar(250) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `resource`
--

INSERT INTO `resource` (`ID`, `resource_name`, `resource_description`) VALUES
(1, 'user', 'user'),
(2, 'company', 'user'),
(3, 'group', 'user'),
(4, 'perms', 'user'),
(5, 'language', 'language'),
(6, 'news', 'news');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `email`, `permission`, `dob`, `status`, `gender`, `companyid`) VALUES
(1, 'sangnguyen', 'e10adc3949ba59abbe56e057f20f883e', 'sang.nguyen@gmail.com', 2, '1992-12-25', 1, 1, 1),
(7, 'ausertest1', '123456', 'usertest1@mail.com', 0, '1995-09-20', 1, 1, 1),
(8, 'usertest2', '202cb962ac59075b964b07152d234b70', 'usertest2@mail.com', 1, '1997-05-03', 1, 1, 1),
(9, 'usertest3', '202cb962ac59075b964b07152d234b70', 'usertest@mail.com', 0, '2000-06-04', 1, 1, 2),
(10, 'usertest4', 'usertest', 'usertest4@mail.com', 0, '1990-12-25', 1, 1, 1),
(11, 'root', 'e10adc3949ba59abbe56e057f20f883e', 'root@gmail.com', 1, '2000-03-03', 1, 1, 1),
(13, 'moon', '202cb962ac59075b964b07152d234b70', 'moon@mym.com', 1, '1992-06-01', 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_group`
--

CREATE TABLE IF NOT EXISTS `user_group` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `userID` int(11) NOT NULL,
  `groupID` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `user_group`
--

INSERT INTO `user_group` (`ID`, `userID`, `groupID`) VALUES
(1, 1, 1),
(3, 12, 2),
(7, 13, 4),
(8, 7, 3),
(9, 11, 3);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
