/*
Navicat MySQL Data Transfer

Source Server         : sample
Source Server Version : 50626
Source Host           : localhost:3306
Source Database       : seed253c

Target Server Type    : MYSQL
Target Server Version : 50626
File Encoding         : 65001

Date: 2016-06-09 22:54:38
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of query_string
-- ----------------------------
INSERT INTO `query_string` VALUES ('1', '0', '1', '测试', 'select from SystemMenu a where a.right>=5');
