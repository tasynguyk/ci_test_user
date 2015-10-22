-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 22, 2015 at 05:28 PM
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
-- Table structure for table `comment`
--

CREATE TABLE IF NOT EXISTS `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `newsid` int(11) NOT NULL,
  `content` text NOT NULL,
  `status` tinyint(1) NOT NULL,
  `time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `comment`
--

INSERT INTO `comment` (`id`, `userid`, `newsid`, `content`, `status`, `time`) VALUES
(1, 11, 1, '123', 1, '2015-10-22 14:32:13'),
(2, 11, 1, '32131', 1, '2015-10-22 14:34:56'),
(3, 11, 1, '22', 1, '2015-10-22 14:34:59'),
(5, 1, 1, 'tesst', 0, '2015-10-22 15:08:40'),
(6, 1, 1, '123', 0, '2015-10-22 16:37:50'),
(7, 1, 1, '123', 0, '2015-10-22 16:38:08'),
(8, 1, 1, '1234', 0, '2015-10-22 16:40:08'),
(9, 1, 1, 'z', 0, '2015-10-22 16:45:41'),
(10, 1, 1, 'sfdsfds', 0, '2015-10-22 16:49:50'),
(11, 1, 1, '1', 0, '2015-10-22 17:04:50'),
(12, 0, 1, '1', 0, '2015-10-22 17:11:17'),
(13, 0, 1, '1', 0, '2015-10-22 17:11:27');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `group`
--

INSERT INTO `group` (`ID`, `name`, `description`) VALUES
(1, 'Super Admin', 'Super Admin'),
(2, 'Company leader', 'Company team leader'),
(3, 'Company creater', 'Company creater'),
(4, 'User editer', 'User editer'),
(5, 'User creater', '423432'),
(6, 'News team', 'News team');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

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
(12, 2, 1, 0, 0, 0),
(13, 6, 6, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `language`
--

CREATE TABLE IF NOT EXISTS `language` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(45) NOT NULL,
  `name` varchar(45) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `language`
--

INSERT INTO `language` (`id`, `code`, `name`) VALUES
(1, 'en', 'English'),
(2, 'cn', 'Chinese'),
(4, 'jp', 'Japanese'),
(5, 'kr', 'Korean'),
(6, 'vi', 'Vietnamese');

-- --------------------------------------------------------

--
-- Table structure for table `mail`
--

CREATE TABLE IF NOT EXISTS `mail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idsend` int(11) NOT NULL,
  `idfrom` int(11) NOT NULL,
  `subject` varchar(50) CHARACTER SET utf8 NOT NULL,
  `message` text NOT NULL,
  `time` datetime NOT NULL,
  `seen` tinyint(1) NOT NULL,
  `del_from` tinyint(1) NOT NULL,
  `del_to` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `mail`
--

INSERT INTO `mail` (`id`, `idsend`, `idfrom`, `subject`, `message`, `time`, `seen`, `del_from`, `del_to`) VALUES
(7, 5, 1, 'send', '123', '2015-10-19 08:32:31', 0, 0, 0),
(8, 1, 5, 'kkkk', '??', '2015-10-19 08:42:36', 1, 0, 0),
(9, 1, 11, 'test seen', 'test', '2015-10-19 09:13:45', 1, 0, 0),
(10, 1, 11, '1', '1', '2015-10-19 09:25:20', 0, 0, 0),
(11, 1, 11, '2', '2', '2015-10-19 09:25:25', 0, 0, 0),
(12, 13, 1, 'subj', 'dear moon\n// nothing', '2015-10-20 09:44:32', 1, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE IF NOT EXISTS `news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`id`, `image`) VALUES
(1, '3fdcb007714f0404e97ead6166787bc3.jpg'),
(2, '1.jpg'),
(4, '1.jpg'),
(5, '1.jpg'),
(7, '49254c986ed50030d8d27a84af2cad9f.jpg'),
(8, 'b5def0a6a1e2a046b67698c10768a2da.jpg');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `news_info`
--

INSERT INTO `news_info` (`id`, `new_id`, `language_code`, `title`, `description`, `content`) VALUES
(1, 1, 'en', '123', '123', '121312'),
(2, 1, 'cn', '一二三', '一二三', '<h1>dgdgd</h1>'),
(4, 1, 'kr', 'korea', 'korea', 'korea'),
(5, 2, 'cn', 'Lian xi', 'Lian xi', '42422'),
(7, 4, 'en', 'adsa', 'asdsa', 'asdasda'),
(8, 5, 'cn', 'page', 'page', 'pagd'),
(10, 1, 'jp', 'jp', 'jp', 'jp'),
(11, 7, 'en', '456', '456', '456'),
(12, 7, 'cn', '四五六', '四五六', '???'),
(13, 8, 'en', 'sss', 'sss', 'ssss');

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

CREATE TABLE IF NOT EXISTS `notification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `newsid` int(11) NOT NULL,
  `time` datetime NOT NULL,
  `status` tinyint(1) NOT NULL,
  `cmtid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `notification`
--

INSERT INTO `notification` (`id`, `userid`, `newsid`, `time`, `status`, `cmtid`) VALUES
(1, 1, 1, '2015-10-22 16:38:08', 1, 0),
(2, 1, 1, '2015-10-22 16:40:08', 1, 0),
(3, 1, 1, '2015-10-22 16:45:41', 1, 9),
(4, 1, 1, '2015-10-22 16:49:50', 1, 10),
(5, 1, 1, '2015-10-22 17:04:50', 0, 11),
(6, 0, 1, '2015-10-22 17:11:17', 0, 12),
(7, 0, 1, '2015-10-22 17:11:27', 0, 13);

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
(8, 'tasy', '202cb962ac59075b964b07152d234b70', 'usertest2@mail.com', 0, '1997-05-03', 1, 1, 1),
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `user_group`
--

INSERT INTO `user_group` (`ID`, `userID`, `groupID`) VALUES
(1, 1, 1),
(3, 12, 2),
(7, 13, 4),
(8, 7, 3),
(9, 11, 3),
(10, 8, 6);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
