/*
 Navicat Premium Data Transfer

 Source Server         : MySQL
 Source Server Type    : MySQL
 Source Server Version : 80018
 Source Host           : localhost:3306
 Source Schema         : blogdb

 Target Server Type    : MySQL
 Target Server Version : 80018
 File Encoding         : 65001

 Date: 17/12/2020 01:00:46
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for blog_comment
-- ----------------------------
DROP TABLE IF EXISTS `blog_comment`;
CREATE TABLE `blog_comment`  (
  `CommentId` int(11) NOT NULL,
  `BlogId` int(11) NOT NULL,
  PRIMARY KEY (`CommentId`, `BlogId`) USING BTREE,
  INDEX `blogId_bc`(`BlogId`) USING BTREE,
  CONSTRAINT `blogId_bc` FOREIGN KEY (`BlogId`) REFERENCES `blogs` (`BlogId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `commentId_bc` FOREIGN KEY (`CommentId`) REFERENCES `comments` (`CommentId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for blogs
-- ----------------------------
DROP TABLE IF EXISTS `blogs`;
CREATE TABLE `blogs`  (
  `BlogId` int(11) NOT NULL AUTO_INCREMENT,
  `Header` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Text` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `UserId` int(255) NOT NULL,
  `Date` timestamp(0) NOT NULL,
  PRIMARY KEY (`BlogId`) USING BTREE,
  UNIQUE INDEX `BlogId`(`BlogId`) USING BTREE,
  INDEX `Blog_User`(`UserId`) USING BTREE,
  CONSTRAINT `Blog_User` FOREIGN KEY (`UserId`) REFERENCES `users` (`UserId`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for comments
-- ----------------------------
DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments`  (
  `CommentId` int(11) NOT NULL AUTO_INCREMENT,
  `UserId` int(11) NOT NULL,
  `Text` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `BlogId` int(11) NOT NULL,
  `ToCommentId` int(11) NULL DEFAULT NULL,
  `Date` timestamp(0) NOT NULL,
  PRIMARY KEY (`CommentId`) USING BTREE,
  UNIQUE INDEX `PostId`(`CommentId`) USING BTREE,
  INDEX `BlogId`(`BlogId`) USING BTREE,
  INDEX `Comment_Comment`(`ToCommentId`) USING BTREE,
  INDEX `Comment_User`(`UserId`) USING BTREE,
  CONSTRAINT `Comment_Blog` FOREIGN KEY (`BlogId`) REFERENCES `blogs` (`BlogId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `Comment_Comment` FOREIGN KEY (`ToCommentId`) REFERENCES `comments` (`CommentId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `Comment_User` FOREIGN KEY (`UserId`) REFERENCES `users` (`UserId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for favorites
-- ----------------------------
DROP TABLE IF EXISTS `favorites`;
CREATE TABLE `favorites`  (
  `UserId` int(11) NOT NULL,
  `BlogId` int(11) NOT NULL,
  PRIMARY KEY (`UserId`, `BlogId`) USING BTREE,
  INDEX `blogId_ub`(`BlogId`) USING BTREE,
  CONSTRAINT `favorites_ibfk_1` FOREIGN KEY (`BlogId`) REFERENCES `blogs` (`BlogId`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `favorites_ibfk_2` FOREIGN KEY (`UserId`) REFERENCES `users` (`UserId`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for records
-- ----------------------------
DROP TABLE IF EXISTS `records`;
CREATE TABLE `records`  (
  `UserId` int(11) NOT NULL,
  `BlogId` int(11) NOT NULL,
  `RecordId` int(255) NOT NULL AUTO_INCREMENT,
  `Date` timestamp(0) NOT NULL,
  PRIMARY KEY (`RecordId`) USING BTREE,
  INDEX `blogId_ub`(`BlogId`) USING BTREE,
  INDEX `records_ibfk_2`(`UserId`) USING BTREE,
  CONSTRAINT `records_ibfk_1` FOREIGN KEY (`BlogId`) REFERENCES `blogs` (`BlogId`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `records_ibfk_2` FOREIGN KEY (`UserId`) REFERENCES `users` (`UserId`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user_blog
-- ----------------------------
DROP TABLE IF EXISTS `user_blog`;
CREATE TABLE `user_blog`  (
  `UserId` int(11) NOT NULL,
  `BlogId` int(11) NOT NULL,
  PRIMARY KEY (`UserId`, `BlogId`) USING BTREE,
  INDEX `blogId_ub`(`BlogId`) USING BTREE,
  CONSTRAINT `blogId_ub` FOREIGN KEY (`BlogId`) REFERENCES `blogs` (`BlogId`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `userId_ub` FOREIGN KEY (`UserId`) REFERENCES `users` (`UserId`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user_comment
-- ----------------------------
DROP TABLE IF EXISTS `user_comment`;
CREATE TABLE `user_comment`  (
  `UserId` int(11) NOT NULL,
  `CommentId` int(11) NOT NULL,
  PRIMARY KEY (`UserId`, `CommentId`) USING BTREE,
  INDEX `commentId_uc`(`CommentId`) USING BTREE,
  CONSTRAINT `commentId_uc` FOREIGN KEY (`CommentId`) REFERENCES `comments` (`CommentId`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `userId_uc` FOREIGN KEY (`UserId`) REFERENCES `users` (`UserId`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `UserId` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `Password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`UserId`) USING BTREE,
  INDEX `Name`(`Name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
