/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50620
Source Host           : localhost:3306
Source Database       : seed253c

Target Server Type    : MYSQL
Target Server Version : 50620
File Encoding         : 65001

Date: 2016-06-10 11:32:48
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `query_string`
-- ----------------------------
DROP TABLE IF EXISTS `query_string`;
CREATE TABLE `query_string` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `clazz_id` bigint(20) NOT NULL,
  `comment` varchar(255) NOT NULL,
  `sql_string` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_t2796icw8cla96tt3o00r6s5d` (`clazz_id`),
  CONSTRAINT `FK_t2796icw8cla96tt3o00r6s5d` FOREIGN KEY (`clazz_id`) REFERENCES `domain_query` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of query_string
-- ----------------------------
INSERT INTO `query_string` VALUES ('1', '4', '1', '测试', 'from SystemMenu a where a.menuRight>=5');
INSERT INTO `query_string` VALUES ('2', '0', '1', '测试小于10的', 'from SystemMenu a where a.menuRight<10');
