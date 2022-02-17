/*
MySQL Data Transfer
Source Host: localhost
Source Database: crs
Target Host: localhost
Target Database: crs
Date: 2/17/2022 3:46:55 PM
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for catalog
-- ----------------------------
DROP TABLE IF EXISTS `catalog`;
CREATE TABLE `catalog` (
  `courseCode` varchar(32) NOT NULL,
  `courseName` varchar(32) NOT NULL,
  `description` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `courseCode` varchar(32) NOT NULL,
  `courseName` varchar(32) NOT NULL,
  `instructorId` int(32) NOT NULL,
  `availableSeats` int(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for payment
-- ----------------------------
DROP TABLE IF EXISTS `payment`;
CREATE TABLE `payment` (
  `referenceId` int(32) NOT NULL,
  `studentId` int(32) NOT NULL,
  `amount` double(32,0) NOT NULL,
  `modeOfPayment` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for registeredcourse
-- ----------------------------
DROP TABLE IF EXISTS `registeredcourse`;
CREATE TABLE `registeredcourse` (
  `studentId` int(32) NOT NULL,
  `courseCode` varchar(32) NOT NULL,
  `grade` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `roleType` varchar(32) NOT NULL,
  `userId` int(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `studentId` int(32) NOT NULL,
  `branch` varchar(32) NOT NULL,
  `batch` int(32) NOT NULL,
  `isRegistered` varchar(32) default NULL,
  `isPaid` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `userId` int(32) NOT NULL,
  `password` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `role` VALUES ('STUDENT', '1');
INSERT INTO `role` VALUES ('PROFESSOR', '2');
INSERT INTO `role` VALUES ('ADMIN', '3');
