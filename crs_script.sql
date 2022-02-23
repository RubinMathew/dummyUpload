/*
MySQL Data Transfer
Source Host: localhost
Source Database: crs
Target Host: localhost
Target Database: crs
Date: 2/18/2022 10:23:02 AM
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for catalog
-- ----------------------------
DROP TABLE IF EXISTS `catalog`;
CREATE TABLE `catalog` (
  `courseCode` varchar(32) NOT NULL default '',
  `courseName` varchar(32) default NULL,
  `description` varchar(255) default NULL,
  PRIMARY KEY  (`courseCode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `courseCode` varchar(32) NOT NULL,
  `courseName` varchar(32) NOT NULL,
  `instructorId` varchar(32) NOT NULL,
  `availableSeats` int(10) NOT NULL,
  PRIMARY KEY  (`courseCode`),
  KEY `courseCode` (`courseCode`,`courseName`,`instructorId`,`availableSeats`),
  KEY `instructorId` (`instructorId`),
  CONSTRAINT `instructorId` FOREIGN KEY (`instructorId`) REFERENCES `professor` (`instructorId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for payment
-- ----------------------------
DROP TABLE IF EXISTS `payment`;
CREATE TABLE `payment` (
  `referenceId` varchar(32) default NULL,
  `studentId` varchar(32) NOT NULL,
  `amount` float(32,0) default NULL,
  `modeOfPayment` varchar(32) default NULL,
  KEY `studentId` (`studentId`),
  CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`studentId`) REFERENCES `payment` (`studentId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for professor
-- ----------------------------
DROP TABLE IF EXISTS `professor`;
CREATE TABLE `professor` (
  `instructorId` varchar(32) NOT NULL,
  `department` varchar(32) NOT NULL,
  `designation` varchar(32) NOT NULL,
  `doj` date NOT NULL,
  PRIMARY KEY  (`instructorId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for registeredcourse
-- ----------------------------
DROP TABLE IF EXISTS `registeredcourse`;
CREATE TABLE `registeredcourse` (
  `studentId` varchar(32) NOT NULL,
  `courseCode` varchar(32) NOT NULL,
  `grade` varchar(32) NOT NULL,
  KEY `studentId` (`studentId`),
  KEY `courseCode` (`courseCode`),
  CONSTRAINT `courseCode` FOREIGN KEY (`courseCode`) REFERENCES `course` (`courseCode`),
  CONSTRAINT `studentId` FOREIGN KEY (`studentId`) REFERENCES `student` (`studentId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `roleType` varchar(32) NOT NULL,
  `userId` varchar(32) NOT NULL,
  KEY `userId` (`userId`),
  CONSTRAINT `userId` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `studentId` varchar(32) NOT NULL,
  `branch` varchar(32) NOT NULL,
  `batch` varchar(32) NOT NULL,
  `isRegistered` varchar(32) NOT NULL,
  `isPaid` varchar(32) NOT NULL,
  PRIMARY KEY  (`studentId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `userId` varchar(32) NOT NULL,
  `password` varchar(32) NOT NULL,
  PRIMARY KEY  (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `catalog` VALUES ('AWS', 'Amazon', 'Amazon cloud certifcation');
INSERT INTO `catalog` VALUES ('Az-104', 'Azure', 'Microsoft certification');
INSERT INTO `catalog` VALUES ('Az-900', 'Azure', 'Microsoft certification');
INSERT INTO `catalog` VALUES ('lz-808', 'Java', 'Java certification');
INSERT INTO `catalog` VALUES ('office365', 'MS', 'Ms certification');
INSERT INTO `catalog` VALUES ('Python', 'Python', 'Python certificate');
INSERT INTO `course` VALUES ('Az-104', 'Azure', '2', '9');
INSERT INTO `course` VALUES ('Az-900', 'Azure', '2', '10');
INSERT INTO `course` VALUES ('Python', 'Python Certification', '2', '4');
INSERT INTO `professor` VALUES ('2', 'IT', 'AS', '0000-00-00');
INSERT INTO `professor` VALUES ('5', 'IT', 'AS', '0000-00-00');
INSERT INTO `professor` VALUES ('7', 'IT', 'AS', '0000-00-00');
INSERT INTO `registeredcourse` VALUES ('1', 'Az-900', 'A');
INSERT INTO `role` VALUES ('STUDENT', '1');
INSERT INTO `role` VALUES ('PROFESSOR', '2');
INSERT INTO `role` VALUES ('ADMIN', '3');
INSERT INTO `student` VALUES ('1', 'IT', '2022', 'true', 'false');
INSERT INTO `user` VALUES ('1', 'abc');
INSERT INTO `user` VALUES ('2', 'xyz');
INSERT INTO `user` VALUES ('3', 'efg');
