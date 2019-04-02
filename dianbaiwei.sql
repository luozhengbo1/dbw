/*
Navicat MySQL Data Transfer

Source Server         : Z----------------------127.0.0.1
Source Server Version : 50540
Source Host           : localhost:3306
Source Database       : dianbaiwei

Target Server Type    : MYSQL
Target Server Version : 50540
File Encoding         : 65001

Date: 2018-02-26 10:10:31
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for auth_access
-- ----------------------------
DROP TABLE IF EXISTS `auth_access`;
CREATE TABLE `auth_access` (
  `uid` mediumint(8) unsigned NOT NULL COMMENT '用户组明细表',
  `group_id` mediumint(8) unsigned NOT NULL,
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_access
-- ----------------------------
INSERT INTO `auth_access` VALUES ('1', '1');
INSERT INTO `auth_access` VALUES ('2', '2');
INSERT INTO `auth_access` VALUES ('3', '2');
INSERT INTO `auth_access` VALUES ('4', '2');
INSERT INTO `auth_access` VALUES ('5', '2');
INSERT INTO `auth_access` VALUES ('6', '2');
INSERT INTO `auth_access` VALUES ('7', '2');
INSERT INTO `auth_access` VALUES ('10', '2');
INSERT INTO `auth_access` VALUES ('11', '2');
INSERT INTO `auth_access` VALUES ('12', '3');

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户组表',
  `title` char(100) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `rules` char(255) NOT NULL DEFAULT '',
  `note` varchar(255) NOT NULL,
  `is_company` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group
-- ----------------------------
INSERT INTO `auth_group` VALUES ('1', '超级管理员', '1', '1,2,3,4,5,12,42,53,6,7,8,9,10,11,14,15,16,17,18,19,39,20,21,22,23,24,25,26,27,28,49,50,51,29,30,31,32,33,40,34,35,36,37,38,41,43,44,45,46,47,48,52,54,55,56,57,66,58,59,60,61,62,63,64,65,66', '超级管理员', '0');
INSERT INTO `auth_group` VALUES ('2', '创维康', '1', '1,2,3,4,5,12,42,53,6,7,8,9,10,11,14,15,16,17,18,19,39,43,52', '创维康', '1');
INSERT INTO `auth_group` VALUES ('3', '兴荣餐饮', '1', '1,2,3,4,5,12,42,53,6,7,8,9,10,11,14,15,16,17,18,19,39,43,44,45,46,47,48,52,58,59,60,61,62,63,64,65', '兴荣餐饮', '1');
INSERT INTO `auth_group` VALUES ('4', '餐服', '1', '1,2,3,4,5,12,42,6,7,8,9,10,11,14,15,16,17,18,19,39,43,52', '餐服', '0');
INSERT INTO `auth_group` VALUES ('5', '经管', '1', '1,6,14,20,26,29,34,43', '经管', '0');

-- ----------------------------
-- Table structure for auth_login_log
-- ----------------------------
DROP TABLE IF EXISTS `auth_login_log`;
CREATE TABLE `auth_login_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `ip` varchar(50) NOT NULL,
  `operate` varchar(50) NOT NULL,
  `add_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=292 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_login_log
-- ----------------------------
INSERT INTO `auth_login_log` VALUES ('98', 'admin', '127.0.0.1', '登陆', '2017-08-12 11:34:17');
INSERT INTO `auth_login_log` VALUES ('99', 'admin', '127.0.0.1', '注销', '2017-08-12 13:47:56');
INSERT INTO `auth_login_log` VALUES ('100', 'admin', '127.0.0.1', '登陆', '2017-08-12 14:11:10');
INSERT INTO `auth_login_log` VALUES ('101', 'admin', '127.0.0.1', '登陆', '2017-08-12 17:25:00');
INSERT INTO `auth_login_log` VALUES ('102', 'admin', '127.0.0.1', '登陆', '2017-08-14 08:11:23');
INSERT INTO `auth_login_log` VALUES ('103', 'admin', '127.0.0.1', '登陆', '2017-08-14 11:30:28');
INSERT INTO `auth_login_log` VALUES ('104', 'admin', '127.0.0.1', '登陆', '2017-08-15 10:06:06');
INSERT INTO `auth_login_log` VALUES ('105', 'admin', '127.0.0.1', '注销', '2017-08-16 11:21:11');
INSERT INTO `auth_login_log` VALUES ('106', 'H70000', '127.0.0.1', '登陆', '2017-08-16 11:21:20');
INSERT INTO `auth_login_log` VALUES ('107', 'H70000', '127.0.0.1', '注销', '2017-08-16 11:22:50');
INSERT INTO `auth_login_log` VALUES ('108', 'admin', '127.0.0.1', '登陆', '2017-08-16 11:22:58');
INSERT INTO `auth_login_log` VALUES ('109', 'admin', '127.0.0.1', '登陆', '2017-08-17 09:47:17');
INSERT INTO `auth_login_log` VALUES ('110', 'admin', '127.0.0.1', '登陆', '2017-08-17 10:07:22');
INSERT INTO `auth_login_log` VALUES ('111', 'admin', '127.0.0.1', '登陆', '2017-08-17 14:13:18');
INSERT INTO `auth_login_log` VALUES ('112', 'admin', '127.0.0.1', '登陆', '2017-08-17 16:10:41');
INSERT INTO `auth_login_log` VALUES ('113', 'admin', '127.0.0.1', '注销', '2017-08-18 10:16:50');
INSERT INTO `auth_login_log` VALUES ('114', 'admin', '127.0.0.1', '登陆', '2017-08-18 10:16:58');
INSERT INTO `auth_login_log` VALUES ('115', 'admin', '127.0.0.1', '注销', '2017-08-18 10:17:37');
INSERT INTO `auth_login_log` VALUES ('116', 'admin', '127.0.0.1', '登陆', '2017-08-18 10:17:42');
INSERT INTO `auth_login_log` VALUES ('117', 'admin', '127.0.0.1', '注销', '2017-08-18 10:21:04');
INSERT INTO `auth_login_log` VALUES ('118', 'H70000', '127.0.0.1', '登陆', '2017-08-18 10:21:09');
INSERT INTO `auth_login_log` VALUES ('119', 'H70000', '127.0.0.1', '注销', '2017-08-18 10:21:49');
INSERT INTO `auth_login_log` VALUES ('120', 'admin', '127.0.0.1', '登陆', '2017-08-18 10:21:54');
INSERT INTO `auth_login_log` VALUES ('121', 'admin', '127.0.0.1', '注销', '2017-08-18 10:22:15');
INSERT INTO `auth_login_log` VALUES ('122', 'H70000', '127.0.0.1', '登陆', '2017-08-18 10:22:28');
INSERT INTO `auth_login_log` VALUES ('123', 'H70000', '127.0.0.1', '注销', '2017-08-18 10:22:44');
INSERT INTO `auth_login_log` VALUES ('124', 'admin', '127.0.0.1', '登陆', '2017-08-18 10:26:18');
INSERT INTO `auth_login_log` VALUES ('125', 'admin', '127.0.0.1', '注销', '2017-08-18 10:26:26');
INSERT INTO `auth_login_log` VALUES ('126', 'H70000', '127.0.0.1', '登陆', '2017-08-18 10:26:37');
INSERT INTO `auth_login_log` VALUES ('127', 'admin', '127.0.0.1', '登陆', '2017-08-18 11:11:25');
INSERT INTO `auth_login_log` VALUES ('128', 'admin', '127.0.0.1', '注销', '2017-08-18 11:11:31');
INSERT INTO `auth_login_log` VALUES ('129', 'admin', '127.0.0.1', '登陆', '2017-08-18 11:13:10');
INSERT INTO `auth_login_log` VALUES ('130', 'admin', '127.0.0.1', '登陆', '2017-08-18 13:57:23');
INSERT INTO `auth_login_log` VALUES ('131', 'admin', '127.0.0.1', '登陆', '2017-08-18 16:22:19');
INSERT INTO `auth_login_log` VALUES ('132', 'admin', '127.0.0.1', '注销', '2017-08-19 14:01:57');
INSERT INTO `auth_login_log` VALUES ('133', 'H70000', '127.0.0.1', '登陆', '2017-08-19 14:02:07');
INSERT INTO `auth_login_log` VALUES ('134', 'H70000', '127.0.0.1', '注销', '2017-08-19 14:02:15');
INSERT INTO `auth_login_log` VALUES ('135', 'admin', '127.0.0.1', '登陆', '2017-08-19 14:06:43');
INSERT INTO `auth_login_log` VALUES ('136', 'admin', '127.0.0.1', '注销', '2017-08-19 14:49:30');
INSERT INTO `auth_login_log` VALUES ('137', 'admin', '127.0.0.1', '登陆', '2017-08-21 10:12:07');
INSERT INTO `auth_login_log` VALUES ('138', 'admin', '127.0.0.1', '注销', '2017-08-21 10:15:44');
INSERT INTO `auth_login_log` VALUES ('139', 'admin', '127.0.0.1', '登陆', '2017-08-21 10:15:54');
INSERT INTO `auth_login_log` VALUES ('140', 'admin', '127.0.0.1', '登陆', '2017-08-21 10:18:19');
INSERT INTO `auth_login_log` VALUES ('141', 'admin', '127.0.0.1', '注销', '2017-08-21 10:18:25');
INSERT INTO `auth_login_log` VALUES ('142', 'admin', '127.0.0.1', '登陆', '2017-08-21 10:36:52');
INSERT INTO `auth_login_log` VALUES ('143', 'admin', '127.0.0.1', '登陆', '2017-08-21 10:54:48');
INSERT INTO `auth_login_log` VALUES ('144', 'admin', '127.0.0.1', '登陆', '2017-08-21 10:56:35');
INSERT INTO `auth_login_log` VALUES ('145', 'admin', '127.0.0.1', '注销', '2017-08-21 14:19:18');
INSERT INTO `auth_login_log` VALUES ('146', 'admin', '127.0.0.1', '登陆', '2017-08-21 14:19:24');
INSERT INTO `auth_login_log` VALUES ('147', 'admin', '127.0.0.1', '注销', '2017-08-21 14:20:11');
INSERT INTO `auth_login_log` VALUES ('148', 'admin', '127.0.0.1', '登陆', '2017-08-21 14:20:15');
INSERT INTO `auth_login_log` VALUES ('149', 'admin', '127.0.0.1', '注销', '2017-08-21 14:34:31');
INSERT INTO `auth_login_log` VALUES ('150', 'admin', '127.0.0.1', '登陆', '2017-08-21 14:43:12');
INSERT INTO `auth_login_log` VALUES ('151', 'admin', '127.0.0.1', '注销', '2017-08-21 14:54:08');
INSERT INTO `auth_login_log` VALUES ('152', 'admin', '127.0.0.1', '登陆', '2017-08-21 16:40:47');
INSERT INTO `auth_login_log` VALUES ('153', 'admin', '127.0.0.1', '登陆', '2017-08-22 09:44:16');
INSERT INTO `auth_login_log` VALUES ('154', 'admin', '10.67.125.70', '登陆', '2017-08-22 13:48:40');
INSERT INTO `auth_login_log` VALUES ('155', 'admin', '127.0.0.1', '注销', '2017-08-23 14:22:21');
INSERT INTO `auth_login_log` VALUES ('156', 'admin', '10.67.125.70', '登陆', '2017-08-23 16:08:54');
INSERT INTO `auth_login_log` VALUES ('157', 'admin', '127.0.0.1', '登陆', '2017-08-23 16:52:29');
INSERT INTO `auth_login_log` VALUES ('158', 'admin', '10.67.125.70', '登陆', '2017-08-23 18:49:37');
INSERT INTO `auth_login_log` VALUES ('159', 'admin', '10.67.125.70', '登陆', '2017-08-24 14:57:54');
INSERT INTO `auth_login_log` VALUES ('160', 'admin', '127.0.0.1', '登陆', '2017-08-25 10:55:23');
INSERT INTO `auth_login_log` VALUES ('161', 'admin', '127.0.0.1', '登陆', '2017-08-28 08:20:30');
INSERT INTO `auth_login_log` VALUES ('162', 'admin', '127.0.0.1', '登陆', '2017-08-29 10:20:25');
INSERT INTO `auth_login_log` VALUES ('163', 'admin', '127.0.0.1', '登陆', '2017-08-29 10:22:32');
INSERT INTO `auth_login_log` VALUES ('164', 'admin', '127.0.0.1', '登陆', '2017-08-29 10:40:48');
INSERT INTO `auth_login_log` VALUES ('165', 'admin', '127.0.0.1', '登陆', '2017-08-29 10:43:22');
INSERT INTO `auth_login_log` VALUES ('166', 'admin', '127.0.0.1', '注销', '2017-08-29 10:43:29');
INSERT INTO `auth_login_log` VALUES ('167', 'admin', '127.0.0.1', '登陆', '2017-08-29 10:44:43');
INSERT INTO `auth_login_log` VALUES ('168', 'admin', '127.0.0.1', '注销', '2017-08-29 10:45:14');
INSERT INTO `auth_login_log` VALUES ('169', 'admin', '127.0.0.1', '登陆', '2017-08-29 10:45:21');
INSERT INTO `auth_login_log` VALUES ('170', 'admin', '127.0.0.1', '注销', '2017-08-29 10:45:26');
INSERT INTO `auth_login_log` VALUES ('171', 'admin', '127.0.0.1', '登陆', '2017-08-29 10:45:43');
INSERT INTO `auth_login_log` VALUES ('172', 'admin', '127.0.0.1', '注销', '2017-08-29 10:45:53');
INSERT INTO `auth_login_log` VALUES ('173', 'admin', '127.0.0.1', '登陆', '2017-08-29 10:45:58');
INSERT INTO `auth_login_log` VALUES ('174', 'admin', '127.0.0.1', '注销', '2017-08-29 10:46:04');
INSERT INTO `auth_login_log` VALUES ('175', 'admin', '10.67.124.91', '登陆', '2017-08-29 11:10:28');
INSERT INTO `auth_login_log` VALUES ('176', 'admin', '127.0.0.1', '登陆', '2017-08-29 11:11:56');
INSERT INTO `auth_login_log` VALUES ('177', 'admin', '10.67.124.91', '登陆', '2017-08-29 14:27:55');
INSERT INTO `auth_login_log` VALUES ('178', 'admin', '127.0.0.1', '登陆', '2017-08-29 16:05:13');
INSERT INTO `auth_login_log` VALUES ('179', 'admin', '10.67.124.91', '登陆', '2017-08-30 10:30:24');
INSERT INTO `auth_login_log` VALUES ('180', 'admin', '10.67.124.91', '注销', '2017-08-30 10:40:09');
INSERT INTO `auth_login_log` VALUES ('181', 'admin', '10.67.124.91', '登陆', '2017-08-30 10:41:10');
INSERT INTO `auth_login_log` VALUES ('182', 'admin', '10.67.124.91', '注销', '2017-08-30 10:49:15');
INSERT INTO `auth_login_log` VALUES ('183', 'admin', '10.67.124.91', '登陆', '2017-08-30 10:50:44');
INSERT INTO `auth_login_log` VALUES ('184', 'admin', '10.67.124.91', '注销', '2017-08-30 11:09:31');
INSERT INTO `auth_login_log` VALUES ('185', 'xingrong', '10.67.124.91', '登陆', '2017-08-30 11:09:51');
INSERT INTO `auth_login_log` VALUES ('186', 'admin', '127.0.0.1', '登陆', '2017-08-30 11:19:40');
INSERT INTO `auth_login_log` VALUES ('187', 'admin', '10.67.125.70', '登陆', '2017-08-30 15:24:33');
INSERT INTO `auth_login_log` VALUES ('188', 'admin', '10.67.124.91', '登陆', '2017-08-31 08:43:23');
INSERT INTO `auth_login_log` VALUES ('189', 'admin', '10.67.125.70', '登陆', '2017-08-31 09:05:26');
INSERT INTO `auth_login_log` VALUES ('190', 'admin', '10.67.124.184', '登陆', '2017-08-31 14:01:56');
INSERT INTO `auth_login_log` VALUES ('191', 'admin', '10.67.125.70', '登陆', '2017-08-31 15:08:41');
INSERT INTO `auth_login_log` VALUES ('192', 'admin', '10.67.124.91', '登陆', '2017-09-01 10:03:55');
INSERT INTO `auth_login_log` VALUES ('193', 'admin', '10.67.124.91', '登陆', '2017-09-01 15:38:26');
INSERT INTO `auth_login_log` VALUES ('194', 'admin', '127.0.0.1', '登陆', '2017-09-04 09:29:19');
INSERT INTO `auth_login_log` VALUES ('195', 'admin', '127.0.0.1', '注销', '2017-09-04 09:29:26');
INSERT INTO `auth_login_log` VALUES ('196', 'admin', '127.0.0.1', '登陆', '2017-09-04 09:29:33');
INSERT INTO `auth_login_log` VALUES ('197', 'admin', '127.0.0.1', '登陆', '2017-09-04 16:44:28');
INSERT INTO `auth_login_log` VALUES ('198', 'admin', '127.0.0.1', '登陆', '2017-09-04 17:01:01');
INSERT INTO `auth_login_log` VALUES ('199', 'admin', '127.0.0.1', '登陆', '2017-09-05 10:14:01');
INSERT INTO `auth_login_log` VALUES ('200', 'admin', '10.67.124.184', '登陆', '2017-09-05 11:07:08');
INSERT INTO `auth_login_log` VALUES ('201', 'admin', '127.0.0.1', '登陆', '2017-09-05 11:09:24');
INSERT INTO `auth_login_log` VALUES ('202', 'admin', '10.67.124.91', '登陆', '2017-09-05 16:04:56');
INSERT INTO `auth_login_log` VALUES ('203', 'admin', '10.67.124.91', '注销', '2017-09-05 16:05:25');
INSERT INTO `auth_login_log` VALUES ('204', 'xingrong', '10.67.124.91', '登陆', '2017-09-05 16:05:35');
INSERT INTO `auth_login_log` VALUES ('205', 'xingrong', '10.67.124.91', '注销', '2017-09-05 16:10:07');
INSERT INTO `auth_login_log` VALUES ('206', 'admin', '10.67.124.91', '登陆', '2017-09-05 16:10:15');
INSERT INTO `auth_login_log` VALUES ('207', 'admin', '10.67.124.91', '注销', '2017-09-05 16:11:32');
INSERT INTO `auth_login_log` VALUES ('208', 'chuangweikang', '10.67.124.91', '登陆', '2017-09-05 16:11:58');
INSERT INTO `auth_login_log` VALUES ('209', 'admin', '127.0.0.1', '登陆', '2017-09-05 16:45:26');
INSERT INTO `auth_login_log` VALUES ('210', 'admin', '10.67.125.70', '登陆', '2017-09-05 17:19:18');
INSERT INTO `auth_login_log` VALUES ('211', 'admin', '127.0.0.1', '登陆', '2017-09-06 09:43:31');
INSERT INTO `auth_login_log` VALUES ('212', 'admin', '127.0.0.1', '登陆', '2017-09-06 09:56:22');
INSERT INTO `auth_login_log` VALUES ('213', 'admin', '10.67.125.70', '登陆', '2017-09-06 11:26:12');
INSERT INTO `auth_login_log` VALUES ('214', 'admin', '127.0.0.1', '登陆', '2017-09-06 11:32:48');
INSERT INTO `auth_login_log` VALUES ('215', 'admin', '10.67.125.70', '登陆', '2017-09-06 13:20:55');
INSERT INTO `auth_login_log` VALUES ('216', 'admin', '10.67.124.91', '登陆', '2017-09-06 13:52:15');
INSERT INTO `auth_login_log` VALUES ('217', 'admin', '10.67.124.91', '注销', '2017-09-06 13:53:25');
INSERT INTO `auth_login_log` VALUES ('218', 'xingrong', '10.67.124.91', '登陆', '2017-09-06 13:53:46');
INSERT INTO `auth_login_log` VALUES ('219', 'admin', '10.67.124.184', '登陆', '2017-09-06 14:00:19');
INSERT INTO `auth_login_log` VALUES ('220', 'admin', '10.67.124.184', '注销', '2017-09-06 14:01:34');
INSERT INTO `auth_login_log` VALUES ('221', 'xingrong', '10.67.124.184', '登陆', '2017-09-06 14:02:16');
INSERT INTO `auth_login_log` VALUES ('222', 'admin', '10.67.125.70', '登陆', '2017-09-07 09:23:44');
INSERT INTO `auth_login_log` VALUES ('223', 'admin', '127.0.0.1', '登陆', '2017-09-12 15:05:36');
INSERT INTO `auth_login_log` VALUES ('224', 'admin', '127.0.0.1', '登陆', '2017-09-14 17:20:25');
INSERT INTO `auth_login_log` VALUES ('225', 'admin', '127.0.0.1', '登陆', '2017-09-15 11:26:33');
INSERT INTO `auth_login_log` VALUES ('226', 'admin', '127.0.0.1', '登陆', '2017-09-15 11:26:42');
INSERT INTO `auth_login_log` VALUES ('227', 'admin', '127.0.0.1', '登陆', '2017-09-15 11:27:30');
INSERT INTO `auth_login_log` VALUES ('228', 'admin', '10.67.125.70', '登陆', '2017-09-22 08:39:06');
INSERT INTO `auth_login_log` VALUES ('229', 'admin', '10.67.125.70', '登陆', '2017-09-22 10:11:16');
INSERT INTO `auth_login_log` VALUES ('230', 'admin', '127.0.0.1', '登陆', '2017-09-22 16:59:23');
INSERT INTO `auth_login_log` VALUES ('231', 'admin', '10.67.124.91', '登陆', '2017-09-25 16:41:55');
INSERT INTO `auth_login_log` VALUES ('232', 'admin', '10.67.125.70', '登陆', '2017-09-26 15:42:36');
INSERT INTO `auth_login_log` VALUES ('233', 'admin', '127.0.0.1', '登陆', '2017-09-26 15:59:43');
INSERT INTO `auth_login_log` VALUES ('234', 'admin', '127.0.0.1', '登陆', '2017-09-29 10:38:08');
INSERT INTO `auth_login_log` VALUES ('235', 'admin', '127.0.0.1', '登陆', '2017-10-09 10:25:53');
INSERT INTO `auth_login_log` VALUES ('236', 'admin', '127.0.0.1', '登陆', '2017-10-10 15:30:58');
INSERT INTO `auth_login_log` VALUES ('237', 'admin', '127.0.0.1', '登陆', '2017-10-10 16:17:28');
INSERT INTO `auth_login_log` VALUES ('238', 'admin', '10.67.125.70', '登陆', '2017-10-11 10:11:59');
INSERT INTO `auth_login_log` VALUES ('239', 'admin', '127.0.0.1', '登陆', '2017-10-11 11:36:56');
INSERT INTO `auth_login_log` VALUES ('240', 'admin', '10.67.124.91', '登陆', '2017-10-11 14:23:26');
INSERT INTO `auth_login_log` VALUES ('241', 'admin', '10.67.124.91', '注销', '2017-10-11 14:25:52');
INSERT INTO `auth_login_log` VALUES ('242', 'xingrong', '10.67.124.91', '登陆', '2017-10-11 14:26:16');
INSERT INTO `auth_login_log` VALUES ('243', 'xingrong', '10.67.124.91', '注销', '2017-10-11 14:26:47');
INSERT INTO `auth_login_log` VALUES ('244', 'admin', '10.67.124.91', '登陆', '2017-10-11 14:27:00');
INSERT INTO `auth_login_log` VALUES ('245', 'admin', '10.67.124.91', '注销', '2017-10-11 14:29:38');
INSERT INTO `auth_login_log` VALUES ('246', 'xingrong', '10.67.124.91', '登陆', '2017-10-11 14:29:55');
INSERT INTO `auth_login_log` VALUES ('247', 'xingrong', '10.67.124.91', '注销', '2017-10-11 14:30:10');
INSERT INTO `auth_login_log` VALUES ('248', 'admin', '10.67.124.91', '登陆', '2017-10-11 14:30:16');
INSERT INTO `auth_login_log` VALUES ('249', 'admin', '10.67.124.91', '注销', '2017-10-11 14:50:01');
INSERT INTO `auth_login_log` VALUES ('250', 'xingrong', '10.67.124.91', '登陆', '2017-10-11 14:50:17');
INSERT INTO `auth_login_log` VALUES ('251', 'admin', '10.67.124.184', '登陆', '2017-10-11 15:37:38');
INSERT INTO `auth_login_log` VALUES ('252', 'admin', '10.67.124.184', '登陆', '2017-10-12 15:28:40');
INSERT INTO `auth_login_log` VALUES ('253', 'admin', '10.67.124.91', '登陆', '2017-10-12 15:55:29');
INSERT INTO `auth_login_log` VALUES ('254', 'admin', '10.67.124.91', '注销', '2017-10-12 16:34:07');
INSERT INTO `auth_login_log` VALUES ('255', 'admin', '10.67.124.91', '登陆', '2017-10-12 16:34:37');
INSERT INTO `auth_login_log` VALUES ('256', 'admin', '10.67.124.184', '登陆', '2017-10-12 16:37:10');
INSERT INTO `auth_login_log` VALUES ('257', 'admin', '10.67.124.91', '登陆', '2017-10-12 16:38:28');
INSERT INTO `auth_login_log` VALUES ('258', 'admin', '10.67.125.70', '登陆', '2017-10-12 17:39:19');
INSERT INTO `auth_login_log` VALUES ('259', 'admin', '10.67.125.33', '登陆', '2017-10-12 18:16:35');
INSERT INTO `auth_login_log` VALUES ('260', 'admin', '127.0.0.1', '登陆', '2017-10-13 08:22:38');
INSERT INTO `auth_login_log` VALUES ('261', 'xingrong', '10.67.124.91', '登陆', '2017-10-14 08:53:49');
INSERT INTO `auth_login_log` VALUES ('262', 'admin', '127.0.0.1', '登陆', '2017-10-14 10:44:15');
INSERT INTO `auth_login_log` VALUES ('263', 'admin', '127.0.0.1', '登陆', '2017-10-14 15:59:48');
INSERT INTO `auth_login_log` VALUES ('264', 'admin', '10.67.124.91', '登陆', '2017-10-16 08:45:15');
INSERT INTO `auth_login_log` VALUES ('265', 'admin', '127.0.0.1', '登陆', '2017-10-16 14:09:24');
INSERT INTO `auth_login_log` VALUES ('266', 'admin', '10.67.125.70', '登陆', '2017-10-16 14:09:51');
INSERT INTO `auth_login_log` VALUES ('267', 'admin', '127.0.0.1', '登陆', '2017-10-18 08:51:45');
INSERT INTO `auth_login_log` VALUES ('268', 'admin', '127.0.0.1', '登陆', '2017-10-18 14:56:37');
INSERT INTO `auth_login_log` VALUES ('269', 'admin', '127.0.0.1', '登陆', '2017-10-19 10:06:59');
INSERT INTO `auth_login_log` VALUES ('270', 'admin', '10.67.196.166', '登陆', '2017-10-19 12:40:07');
INSERT INTO `auth_login_log` VALUES ('271', 'admin', '127.0.0.1', '登陆', '2017-10-19 14:19:46');
INSERT INTO `auth_login_log` VALUES ('272', 'admin', '127.0.0.1', '登陆', '2017-10-20 14:08:51');
INSERT INTO `auth_login_log` VALUES ('273', 'admin', '127.0.0.1', '登陆', '2017-10-21 09:50:09');
INSERT INTO `auth_login_log` VALUES ('274', 'admin', '127.0.0.1', '登陆', '2017-10-23 16:12:38');
INSERT INTO `auth_login_log` VALUES ('275', 'admin', '127.0.0.1', '登陆', '2017-10-24 16:21:22');
INSERT INTO `auth_login_log` VALUES ('276', 'admin', '10.67.124.91', '登陆', '2017-10-31 08:45:00');
INSERT INTO `auth_login_log` VALUES ('277', 'admin', '127.0.0.1', '登陆', '2017-11-01 11:09:30');
INSERT INTO `auth_login_log` VALUES ('278', 'admin', '127.0.0.1', '登陆', '2018-01-20 10:03:06');
INSERT INTO `auth_login_log` VALUES ('279', 'admin', '127.0.0.1', '登陆', '2018-01-20 14:02:30');
INSERT INTO `auth_login_log` VALUES ('280', 'admin', '127.0.0.1', '登陆', '2018-01-20 14:05:52');
INSERT INTO `auth_login_log` VALUES ('281', 'admin', '127.0.0.1', '登陆', '2018-01-20 15:01:18');
INSERT INTO `auth_login_log` VALUES ('282', 'admin', '10.67.124.91', '登陆', '2018-01-20 17:03:41');
INSERT INTO `auth_login_log` VALUES ('283', 'admin', '10.67.125.116', '登陆', '2018-01-22 14:50:30');
INSERT INTO `auth_login_log` VALUES ('284', 'admin', '10.67.125.116', '登陆', '2018-01-22 14:56:55');
INSERT INTO `auth_login_log` VALUES ('285', 'admin', '10.67.124.184', '登陆', '2018-01-22 14:58:12');
INSERT INTO `auth_login_log` VALUES ('286', 'admin', '10.67.125.116', '登陆', '2018-01-23 08:31:01');
INSERT INTO `auth_login_log` VALUES ('287', 'admin', '10.67.124.91', '登陆', '2018-01-23 08:34:10');
INSERT INTO `auth_login_log` VALUES ('288', 'admin', '10.67.125.116', '登陆', '2018-01-23 13:48:18');
INSERT INTO `auth_login_log` VALUES ('289', 'admin', '10.67.124.91', '登陆', '2018-01-27 10:41:08');
INSERT INTO `auth_login_log` VALUES ('290', 'admin', '10.67.124.91', '登陆', '2018-01-27 10:41:36');
INSERT INTO `auth_login_log` VALUES ('291', 'admin', '127.0.0.1', '登陆', '2018-01-30 13:10:32');

-- ----------------------------
-- Table structure for auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `auth_rule`;
CREATE TABLE `auth_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '规则表',
  `name` char(80) NOT NULL DEFAULT '',
  `title` char(20) NOT NULL DEFAULT '',
  `type` tinyint(1) NOT NULL DEFAULT '1',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `condition` char(100) NOT NULL DEFAULT '',
  `sort` mediumint(8) NOT NULL DEFAULT '50',
  `level` mediumint(8) NOT NULL DEFAULT '0',
  `pid` mediumint(8) NOT NULL,
  `note` varchar(255) NOT NULL,
  `add_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_rule
-- ----------------------------
INSERT INTO `auth_rule` VALUES ('1', 'Food', '菜品设置', '1', '1', '', '50', '0', '0', '菜品设置', '2017-08-19 10:43:04');
INSERT INTO `auth_rule` VALUES ('2', 'Food/addFood', '新增菜品', '1', '1', '', '50', '1', '1', '新增菜品', '2017-08-19 10:43:25');
INSERT INTO `auth_rule` VALUES ('3', 'Food/editFood', '编辑菜品', '1', '1', '', '50', '1', '1', '编辑菜品', '2017-08-19 10:43:52');
INSERT INTO `auth_rule` VALUES ('4', 'Food/foodDetail', '菜品详情', '1', '1', '', '50', '1', '1', '菜品详情', '2017-08-19 10:44:19');
INSERT INTO `auth_rule` VALUES ('5', 'Food/delFood', '删除菜品', '1', '1', '', '50', '1', '1', '删除菜品', '2017-08-19 10:44:48');
INSERT INTO `auth_rule` VALUES ('6', 'Type', '类型设置', '1', '1', '', '50', '0', '0', '类型设置', '2017-08-19 10:46:26');
INSERT INTO `auth_rule` VALUES ('7', 'Type/addType', '新增类型', '1', '1', '', '50', '1', '6', '新增类型', '2017-08-19 10:47:12');
INSERT INTO `auth_rule` VALUES ('8', 'Type/editType', '编辑类型', '1', '1', '', '50', '1', '6', '编辑类型', '2017-08-19 10:48:03');
INSERT INTO `auth_rule` VALUES ('9', 'Type/typeDetail', '类型详情', '1', '1', '', '50', '1', '6', '类型详情', '2017-08-19 10:48:37');
INSERT INTO `auth_rule` VALUES ('10', 'Type/delType', '删除类型', '1', '1', '', '50', '1', '6', '删除类型', '2017-08-19 10:49:09');
INSERT INTO `auth_rule` VALUES ('11', 'Type/typeList', '类型列表', '1', '1', '', '50', '1', '6', '类型列表', '2017-08-19 10:49:46');
INSERT INTO `auth_rule` VALUES ('12', 'Food/foodList', '菜品列表', '1', '1', '', '50', '1', '1', '菜品列表', '2017-08-19 10:45:12');
INSERT INTO `auth_rule` VALUES ('14', 'Chart', '图表统计', '1', '1', '', '50', '0', '0', '图表统计', '2017-08-19 14:07:05');
INSERT INTO `auth_rule` VALUES ('15', 'Chart/transAmount', '交易金额构成', '1', '1', '', '50', '1', '14', '交易金额构成', '2017-08-19 14:07:35');
INSERT INTO `auth_rule` VALUES ('16', 'Chart/downTransAmountExcel', '导出Excel(交易金额构成)', '1', '1', '', '50', '1', '14', '导出Excel(交易金额构成)', '2017-08-19 14:08:12');
INSERT INTO `auth_rule` VALUES ('17', 'Chart/foodTrend', '7日就餐人数/人次', '1', '1', '', '50', '1', '14', '7日就餐人数/人次', '2017-08-19 14:09:58');
INSERT INTO `auth_rule` VALUES ('18', 'Chart/downFoodTrendExcel', '导出Excel(7日就餐人数/人次)', '1', '1', '', '50', '1', '14', '导出Excel(7日就餐人数/人次)', '2017-08-19 14:08:32');
INSERT INTO `auth_rule` VALUES ('19', 'Chart/foodType', '就餐类别构成', '1', '1', '', '50', '1', '14', '就餐类别构成', '2017-08-19 14:10:13');
INSERT INTO `auth_rule` VALUES ('20', 'Device', '设备设置', '1', '1', '', '50', '0', '0', '设备设置', '2017-08-19 11:07:13');
INSERT INTO `auth_rule` VALUES ('21', 'Device/addDevice', '新增设备', '1', '1', '', '50', '1', '20', '新增设备', '2017-08-19 11:07:43');
INSERT INTO `auth_rule` VALUES ('22', 'Device/editDevice', '编辑设备', '1', '1', '', '50', '1', '20', '编辑设备', '2017-08-19 11:08:15');
INSERT INTO `auth_rule` VALUES ('23', 'Device/deviceDetail', '设备详情', '1', '1', '', '50', '1', '20', '设备详情', '2017-08-19 11:08:43');
INSERT INTO `auth_rule` VALUES ('24', 'Device/delDevice', '删除设备', '1', '1', '', '50', '1', '20', '删除设备', '2017-08-19 11:09:03');
INSERT INTO `auth_rule` VALUES ('25', 'Device/deviceList', '设备列表', '1', '1', '', '50', '1', '20', '设备列表', '2017-08-19 11:09:27');
INSERT INTO `auth_rule` VALUES ('26', 'APK', 'apk 设置', '1', '1', '', '50', '0', '0', 'apk 设置', '2017-08-19 11:21:03');
INSERT INTO `auth_rule` VALUES ('27', 'APK/addAPK', '新增apk', '1', '1', '', '50', '1', '26', '新增APK', '2017-08-19 11:30:09');
INSERT INTO `auth_rule` VALUES ('28', 'APK/editAPK', '编辑apk', '1', '1', '', '50', '1', '26', '编辑apk', '2017-08-19 11:30:37');
INSERT INTO `auth_rule` VALUES ('29', 'AuthGroup', '用户组设置', '1', '1', '', '50', '0', '0', '用户组设置', '2017-08-01 10:17:03');
INSERT INTO `auth_rule` VALUES ('30', 'AuthGroup/addGroup', '新增用户组', '1', '1', '', '50', '1', '29', '新增用户组', '2017-08-02 09:01:01');
INSERT INTO `auth_rule` VALUES ('31', 'AuthGroup/editGroup', '编辑用户组', '1', '1', '', '50', '1', '29', '编辑用户组', '2017-08-02 09:01:26');
INSERT INTO `auth_rule` VALUES ('32', 'AuthGroup/groupDetail', '用户组详情', '1', '1', '', '50', '1', '29', '用户组详情', '2017-08-02 09:01:59');
INSERT INTO `auth_rule` VALUES ('33', 'AuthGroup/delGroup', '删除用户组', '1', '1', '', '50', '1', '29', '删除用户组', '2017-08-02 09:02:39');
INSERT INTO `auth_rule` VALUES ('34', 'AuthRule', '规则设置', '1', '1', '', '50', '0', '0', '规则设置', '2017-08-02 09:03:26');
INSERT INTO `auth_rule` VALUES ('35', 'AuthRule/addRule', '新增规则', '1', '1', '', '50', '1', '34', '新增规则', '2017-08-02 09:04:12');
INSERT INTO `auth_rule` VALUES ('36', 'AuthRule/editRule', '编辑规则', '1', '1', '', '50', '1', '34', '编辑规则', '2017-08-02 09:04:39');
INSERT INTO `auth_rule` VALUES ('37', 'AuthRule/ruleDetail', '规则详情', '1', '1', '', '50', '1', '34', '规则详情', '2017-08-02 09:05:05');
INSERT INTO `auth_rule` VALUES ('38', 'AuthRule/delRule', '删除规则', '1', '1', '', '50', '1', '34', '删除规则', '2017-08-02 09:05:34');
INSERT INTO `auth_rule` VALUES ('39', 'Chart/downFoodTypeExcel', '导出Excel', '1', '1', '', '50', '1', '14', '导出Excel', '2017-08-19 14:10:27');
INSERT INTO `auth_rule` VALUES ('40', 'AuthGroup/groupList', '用户组列表', '1', '1', '', '50', '1', '29', '用户组列表', '2017-08-02 09:24:59');
INSERT INTO `auth_rule` VALUES ('41', 'AuthRule/ruleList', '规则列表', '1', '1', '', '50', '1', '34', '规则列表', '2017-08-02 09:26:17');
INSERT INTO `auth_rule` VALUES ('42', 'Food/downExcel', '导出Excel', '1', '1', '', '50', '1', '1', '导出Excel', '2017-08-19 10:45:49');
INSERT INTO `auth_rule` VALUES ('43', 'AuthUser', '用户设置', '1', '1', '', '50', '0', '0', '活动管理', '2017-08-02 09:43:23');
INSERT INTO `auth_rule` VALUES ('44', 'AuthUser/addUser', '新增用户', '1', '1', '', '50', '1', '43', '新增用户', '2017-08-02 09:44:16');
INSERT INTO `auth_rule` VALUES ('45', 'AuthUser/editUser', '编辑用户', '1', '1', '', '50', '1', '43', '编辑用户', '2017-08-02 16:44:02');
INSERT INTO `auth_rule` VALUES ('46', 'AuthUser/userDetail', '用户详情', '1', '1', '', '50', '1', '43', '用户详情', '2017-08-02 16:44:02');
INSERT INTO `auth_rule` VALUES ('47', 'AuthUser/delUser', '删除用户', '1', '1', '', '50', '1', '43', '删除用户', '2017-08-02 09:02:39');
INSERT INTO `auth_rule` VALUES ('48', 'AuthUser/userList', '用户列表', '1', '1', '', '50', '1', '43', '用户列表', '2017-08-02 09:02:39');
INSERT INTO `auth_rule` VALUES ('49', 'APK/apkDetail', 'apk详情', '1', '1', '', '50', '1', '26', 'apk详情', '2017-08-19 11:30:37');
INSERT INTO `auth_rule` VALUES ('50', 'APK/delAPK', '删除apk', '1', '1', '', '50', '1', '26', '删除apk', '2017-08-19 11:30:37');
INSERT INTO `auth_rule` VALUES ('51', 'APK/apkList', 'apk列表', '1', '1', '', '50', '1', '26', 'apkList', '2017-08-19 11:30:37');
INSERT INTO `auth_rule` VALUES ('52', 'AuthUser/userInfo', '用户信息', '1', '1', '', '50', '1', '43', '用户信息', '2017-08-21 10:40:15');
INSERT INTO `auth_rule` VALUES ('53', 'Food/uploadFoodThumb', '上传菜品封面', '1', '1', '', '50', '1', '1', '上传菜品封面', '2017-08-30 15:33:00');
INSERT INTO `auth_rule` VALUES ('54', 'Log', '日志管理', '1', '1', '', '50', '0', '0', 'Log', '2017-09-04 17:01:37');
INSERT INTO `auth_rule` VALUES ('55', 'Log/foodList', '同步菜品', '1', '1', '', '50', '1', '54', '同步菜品', '2017-09-04 17:02:22');
INSERT INTO `auth_rule` VALUES ('56', 'Log/clientList', '同步白名单', '1', '1', '', '50', '1', '54', '同步白名单', '2017-09-04 17:03:16');
INSERT INTO `auth_rule` VALUES ('57', 'Log/apkList', 'APK版本', '1', '1', '', '50', '1', '54', 'apk版本', '2017-09-04 17:27:49');
INSERT INTO `auth_rule` VALUES ('58', 'Order', '订单管理', '1', '1', '', '50', '0', '0', '订单管理', '2017-10-09 13:35:22');
INSERT INTO `auth_rule` VALUES ('59', 'Order/orderList', '订单列表', '1', '1', '', '50', '1', '58', '订单列表', '2017-10-09 13:36:47');
INSERT INTO `auth_rule` VALUES ('60', 'Order/orderDetail', '订单详情', '1', '1', '', '50', '1', '58', '订单详情', '2017-10-09 13:37:22');
INSERT INTO `auth_rule` VALUES ('61', 'Order/downExcel', '导出Excel', '1', '1', '', '50', '1', '58', '导出Excel', '2017-10-09 13:37:22');
INSERT INTO `auth_rule` VALUES ('62', 'Pay', '薪资结算', '1', '1', '', '50', '0', '0', '', '2017-10-13 12:44:57');
INSERT INTO `auth_rule` VALUES ('63', 'Pay/payList', '结算列表', '1', '1', '', '50', '1', '62', '', '2017-10-13 12:45:45');
INSERT INTO `auth_rule` VALUES ('64', 'Pay/payDetail', '结算详情', '1', '1', '', '50', '1', '62', '', '2017-10-13 12:46:13');
INSERT INTO `auth_rule` VALUES ('65', 'Pay/downExcel', '导出Excel', '1', '1', '', '50', '1', '62', '', '2017-10-13 12:57:58');
INSERT INTO `auth_rule` VALUES ('66', 'Log/takeFoodList', '取订餐', '1', '1', '', '50', '1', '54', '取订餐', '2017-09-04 17:03:16');

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `status` varchar(1) NOT NULL,
  `note` varchar(255) NOT NULL,
  `add_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user
-- ----------------------------
INSERT INTO `auth_user` VALUES ('1', 'admin', '21232f297a57a5a743894a0e4a801fc3', '1', 'CCARD高级管理', '2016-04-20 08:05:11');
INSERT INTO `auth_user` VALUES ('2', 'chuangweikang', 'e10adc3949ba59abbe56e057f20f883e', '1', 'CCARD测试账号-1', '2017-08-23 10:59:04');
INSERT INTO `auth_user` VALUES ('12', 'xingrong', 'e10adc3949ba59abbe56e057f20f883e', '1', '', '2017-10-11 14:49:57');

-- ----------------------------
-- Table structure for ccard_apk
-- ----------------------------
DROP TABLE IF EXISTS `ccard_apk`;
CREATE TABLE `ccard_apk` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `version` varchar(50) NOT NULL,
  `url` varchar(50) NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '强制:1，非强制：0',
  `add_time` datetime NOT NULL,
  `note` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ccard_apk
-- ----------------------------
INSERT INTO `ccard_apk` VALUES ('2', '1.2.2', 'http://www.baidu.com/1.apk', '2', '2017-08-12 09:01:47', '');
INSERT INTO `ccard_apk` VALUES ('3', '1.5', '/Uploads/files/apk1502501760.apk', '1', '2017-08-12 09:37:47', '1123');
INSERT INTO `ccard_apk` VALUES ('4', '123.5', '/Uploads/files/apk1502501919.apk', '0', '2017-08-12 09:38:51', '1111');
INSERT INTO `ccard_apk` VALUES ('5', '123.6', '/Uploads/files/apk/1502784171.apk', '1', '2017-08-15 16:02:54', '阿达1111');
INSERT INTO `ccard_apk` VALUES ('6', '123.7', '/Uploads/files/apk/1502784199.apk', '0', '2017-08-15 16:03:22', '按时打算');

-- ----------------------------
-- Table structure for ccard_apk_log
-- ----------------------------
DROP TABLE IF EXISTS `ccard_apk_log`;
CREATE TABLE `ccard_apk_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `devid` varchar(50) NOT NULL,
  `version` varchar(50) NOT NULL,
  `add_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=561 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ccard_apk_log
-- ----------------------------
INSERT INTO `ccard_apk_log` VALUES ('1', '5e4721d7b0f6d432', '1.0', '2017-08-21 16:19:55');
INSERT INTO `ccard_apk_log` VALUES ('2', '5e4721d7b0f6d432', '1.0', '2017-08-21 16:20:24');
INSERT INTO `ccard_apk_log` VALUES ('3', '5e4721d7b0f6d432', '1.0', '2017-08-21 16:20:44');
INSERT INTO `ccard_apk_log` VALUES ('4', '5e4721d7b0f6d432', '1.0', '2017-08-21 16:21:32');
INSERT INTO `ccard_apk_log` VALUES ('5', '5e4721d7b0f6d432', '1.0', '2017-08-21 16:23:21');
INSERT INTO `ccard_apk_log` VALUES ('6', '5e4721d7b0f6d432', '1.0', '2017-08-22 10:17:55');
INSERT INTO `ccard_apk_log` VALUES ('7', '90a2e0269b6c878', '1.0', '2017-09-04 14:43:12');
INSERT INTO `ccard_apk_log` VALUES ('8', '90a2e0269b6c878', '1.0', '2017-09-04 14:43:33');
INSERT INTO `ccard_apk_log` VALUES ('9', '90a2e0269b6c878', '1.0', '2017-09-04 14:44:58');
INSERT INTO `ccard_apk_log` VALUES ('10', '90a2e0269b6c878', '1.0', '2017-09-04 14:51:00');
INSERT INTO `ccard_apk_log` VALUES ('11', '90a2e0269b6c878', '1.0', '2017-09-04 17:29:52');
INSERT INTO `ccard_apk_log` VALUES ('12', '90a2e0269b6c878', '1.0', '2017-09-05 10:27:29');
INSERT INTO `ccard_apk_log` VALUES ('13', '90a2e0269b6c878', '1.0', '2017-09-05 10:34:19');
INSERT INTO `ccard_apk_log` VALUES ('14', '90a2e0269b6c878', '1.0', '2017-09-05 10:34:53');
INSERT INTO `ccard_apk_log` VALUES ('15', '90a2e0269b6c878', '1.0', '2017-09-05 11:30:01');
INSERT INTO `ccard_apk_log` VALUES ('16', '90a2e0269b6c878', '1.0', '2017-09-05 11:37:10');
INSERT INTO `ccard_apk_log` VALUES ('17', '90a2e0269b6c878', '1.0', '2017-09-05 14:37:25');
INSERT INTO `ccard_apk_log` VALUES ('18', '90a2e0269b6c878', '1.0', '2017-09-05 14:38:03');
INSERT INTO `ccard_apk_log` VALUES ('19', '90a2e0269b6c878', '1.0', '2017-09-05 14:40:36');
INSERT INTO `ccard_apk_log` VALUES ('20', '90a2e0269b6c878', '1.0', '2017-09-05 14:41:36');
INSERT INTO `ccard_apk_log` VALUES ('21', '90a2e0269b6c878', '1.0', '2017-09-05 14:44:28');
INSERT INTO `ccard_apk_log` VALUES ('22', '90a2e0269b6c878', '1.0', '2017-09-05 14:45:42');
INSERT INTO `ccard_apk_log` VALUES ('23', '90a2e0269b6c878', '1.0', '2017-09-05 14:46:19');
INSERT INTO `ccard_apk_log` VALUES ('24', '90a2e0269b6c878', '1.0', '2017-09-05 15:47:17');
INSERT INTO `ccard_apk_log` VALUES ('25', '90a2e0269b6c878', '1.0', '2017-09-05 15:50:59');
INSERT INTO `ccard_apk_log` VALUES ('26', '90a2e0269b6c878', '1.0', '2017-09-05 16:15:56');
INSERT INTO `ccard_apk_log` VALUES ('27', '90a2e0269b6c878', '1.0', '2017-09-05 16:16:26');
INSERT INTO `ccard_apk_log` VALUES ('28', '90a2e0269b6c878', '1.0', '2017-09-05 16:17:53');
INSERT INTO `ccard_apk_log` VALUES ('29', '90a2e0269b6c878', '1.0', '2017-09-05 16:19:42');
INSERT INTO `ccard_apk_log` VALUES ('30', '90a2e0269b6c878', '1.0', '2017-09-05 16:23:28');
INSERT INTO `ccard_apk_log` VALUES ('31', '90a2e0269b6c878', '1.0', '2017-09-05 16:23:59');
INSERT INTO `ccard_apk_log` VALUES ('32', '90a2e0269b6c878', '1.0', '2017-09-05 16:24:12');
INSERT INTO `ccard_apk_log` VALUES ('33', '90a2e0269b6c878', '1.0', '2017-09-05 16:24:56');
INSERT INTO `ccard_apk_log` VALUES ('34', '90a2e0269b6c878', '1.0', '2017-09-05 16:26:24');
INSERT INTO `ccard_apk_log` VALUES ('35', '90a2e0269b6c878', '1.0', '2017-09-05 16:27:13');
INSERT INTO `ccard_apk_log` VALUES ('36', '90a2e0269b6c878', '1.0', '2017-09-05 16:34:41');
INSERT INTO `ccard_apk_log` VALUES ('37', '90a2e0269b6c878', '1.0', '2017-09-05 16:35:12');
INSERT INTO `ccard_apk_log` VALUES ('38', '90a2e0269b6c878', '1.0', '2017-09-05 16:57:12');
INSERT INTO `ccard_apk_log` VALUES ('39', '90a2e0269b6c878', '1.0', '2017-09-05 17:03:34');
INSERT INTO `ccard_apk_log` VALUES ('40', '90a2e0269b6c878', '1.0', '2017-09-05 17:05:21');
INSERT INTO `ccard_apk_log` VALUES ('41', '90a2e0269b6c878', '1.0', '2017-09-05 17:10:27');
INSERT INTO `ccard_apk_log` VALUES ('42', '90a2e0269b6c878', '1.0', '2017-09-05 17:12:01');
INSERT INTO `ccard_apk_log` VALUES ('43', '90a2e0269b6c878', '1.0', '2017-09-05 17:13:28');
INSERT INTO `ccard_apk_log` VALUES ('44', '90a2e0269b6c878', '1.0', '2017-09-05 17:17:15');
INSERT INTO `ccard_apk_log` VALUES ('45', '90a2e0269b6c878', '1.0', '2017-09-05 17:32:44');
INSERT INTO `ccard_apk_log` VALUES ('46', '90a2e0269b6c878', '1.0', '2017-09-05 17:35:46');
INSERT INTO `ccard_apk_log` VALUES ('47', '90a2e0269b6c878', '1.0', '2017-09-06 08:05:37');
INSERT INTO `ccard_apk_log` VALUES ('48', '90a2e0269b6c878', '1.0', '2017-09-06 08:06:51');
INSERT INTO `ccard_apk_log` VALUES ('49', '90a2e0269b6c878', '1.0', '2017-09-06 08:12:35');
INSERT INTO `ccard_apk_log` VALUES ('50', '90a2e0269b6c878', '1.0', '2017-09-06 08:23:02');
INSERT INTO `ccard_apk_log` VALUES ('51', '90a2e0269b6c878', '1.0', '2017-09-06 08:31:01');
INSERT INTO `ccard_apk_log` VALUES ('52', '90a2e0269b6c878', '1.0', '2017-09-06 08:55:41');
INSERT INTO `ccard_apk_log` VALUES ('53', '90a2e0269b6c878', '1.0', '2017-09-06 08:56:37');
INSERT INTO `ccard_apk_log` VALUES ('54', '90a2e0269b6c878', '1.0', '2017-09-06 09:01:07');
INSERT INTO `ccard_apk_log` VALUES ('55', '90a2e0269b6c878', '1.0', '2017-09-06 09:02:44');
INSERT INTO `ccard_apk_log` VALUES ('56', '90a2e0269b6c878', '1.0', '2017-09-06 09:41:34');
INSERT INTO `ccard_apk_log` VALUES ('57', '90a2e0269b6c878', '1.0', '2017-09-06 09:53:19');
INSERT INTO `ccard_apk_log` VALUES ('58', '90a2e0269b6c878', '1.0', '2017-09-06 09:55:24');
INSERT INTO `ccard_apk_log` VALUES ('59', '90a2e0269b6c878', '1.0', '2017-09-06 09:58:27');
INSERT INTO `ccard_apk_log` VALUES ('60', '90a2e0269b6c878', '1.0', '2017-09-06 10:02:51');
INSERT INTO `ccard_apk_log` VALUES ('61', '90a2e0269b6c878', '1.0', '2017-09-06 10:03:15');
INSERT INTO `ccard_apk_log` VALUES ('62', '90a2e0269b6c878', '1.0', '2017-09-06 10:03:58');
INSERT INTO `ccard_apk_log` VALUES ('63', '90a2e0269b6c878', '1.0', '2017-09-06 10:04:15');
INSERT INTO `ccard_apk_log` VALUES ('64', '90a2e0269b6c878', '1.0', '2017-09-06 10:04:56');
INSERT INTO `ccard_apk_log` VALUES ('65', '90a2e0269b6c878', '1.0', '2017-09-06 10:06:00');
INSERT INTO `ccard_apk_log` VALUES ('66', '90a2e0269b6c878', '1.0', '2017-09-06 10:06:31');
INSERT INTO `ccard_apk_log` VALUES ('67', '90a2e0269b6c878', '1.0', '2017-09-06 10:20:44');
INSERT INTO `ccard_apk_log` VALUES ('68', '90a2e0269b6c878', '1.0', '2017-09-06 10:22:52');
INSERT INTO `ccard_apk_log` VALUES ('69', '90a2e0269b6c878', '1.0', '2017-09-06 10:29:14');
INSERT INTO `ccard_apk_log` VALUES ('70', '90a2e0269b6c878', '1.0', '2017-09-06 10:30:56');
INSERT INTO `ccard_apk_log` VALUES ('71', '90a2e0269b6c878', '1.0', '2017-09-06 10:32:16');
INSERT INTO `ccard_apk_log` VALUES ('72', '90a2e0269b6c878', '1.0', '2017-09-06 10:34:53');
INSERT INTO `ccard_apk_log` VALUES ('73', '90a2e0269b6c878', '1.0', '2017-09-06 10:45:43');
INSERT INTO `ccard_apk_log` VALUES ('74', '90a2e0269b6c878', '1.0', '2017-09-06 10:58:07');
INSERT INTO `ccard_apk_log` VALUES ('75', '90a2e0269b6c878', '1.0', '2017-09-06 10:58:39');
INSERT INTO `ccard_apk_log` VALUES ('76', '90a2e0269b6c878', '1.0', '2017-09-06 11:12:32');
INSERT INTO `ccard_apk_log` VALUES ('77', '90a2e0269b6c878', '1.0', '2017-09-06 11:13:48');
INSERT INTO `ccard_apk_log` VALUES ('78', '90a2e0269b6c878', '1.0', '2017-09-06 11:39:29');
INSERT INTO `ccard_apk_log` VALUES ('79', '90a2e0269b6c878', '1.0', '2017-09-06 11:41:42');
INSERT INTO `ccard_apk_log` VALUES ('80', '90a2e0269b6c878', '1.0', '2017-09-06 12:23:39');
INSERT INTO `ccard_apk_log` VALUES ('81', 'bd1e2ff2f7d039a6', '1.0', '2017-09-06 12:37:32');
INSERT INTO `ccard_apk_log` VALUES ('82', 'bd1e2ff2f7d039a6', '1.0', '2017-09-06 12:39:02');
INSERT INTO `ccard_apk_log` VALUES ('83', 'bd1e2ff2f7d039a6', '1.0', '2017-09-06 12:39:53');
INSERT INTO `ccard_apk_log` VALUES ('84', 'bd1e2ff2f7d039a6', '1.0', '2017-09-06 13:03:13');
INSERT INTO `ccard_apk_log` VALUES ('85', 'bd1e2ff2f7d039a6', '1.0', '2017-09-06 13:04:24');
INSERT INTO `ccard_apk_log` VALUES ('86', 'bd1e2ff2f7d039a6', '1.0', '2017-09-06 13:08:11');
INSERT INTO `ccard_apk_log` VALUES ('87', 'bd1e2ff2f7d039a6', '1.0', '2017-09-06 13:49:33');
INSERT INTO `ccard_apk_log` VALUES ('88', 'bd1e2ff2f7d039a6', '1.0', '2017-09-06 13:56:50');
INSERT INTO `ccard_apk_log` VALUES ('89', 'bd1e2ff2f7d039a6', '1.0', '2017-09-06 14:05:44');
INSERT INTO `ccard_apk_log` VALUES ('90', 'bd1e2ff2f7d039a6', '1.0', '2017-09-06 14:57:49');
INSERT INTO `ccard_apk_log` VALUES ('91', '90a2e0269b6c878', '1.0', '2017-09-07 09:09:49');
INSERT INTO `ccard_apk_log` VALUES ('92', '90a2e0269b6c878', '1.0', '2017-09-07 09:15:52');
INSERT INTO `ccard_apk_log` VALUES ('93', '90a2e0269b6c878', '1.0', '2017-09-07 09:19:02');
INSERT INTO `ccard_apk_log` VALUES ('94', '90a2e0269b6c878', '1.0', '2017-09-07 09:26:16');
INSERT INTO `ccard_apk_log` VALUES ('95', '90a2e0269b6c878', '1.0', '2017-09-07 09:29:56');
INSERT INTO `ccard_apk_log` VALUES ('96', '90a2e0269b6c878', '1.0', '2017-09-07 09:35:34');
INSERT INTO `ccard_apk_log` VALUES ('97', '90a2e0269b6c878', '1.0', '2017-09-07 09:53:06');
INSERT INTO `ccard_apk_log` VALUES ('98', '90a2e0269b6c878', '1.0', '2017-09-07 11:04:44');
INSERT INTO `ccard_apk_log` VALUES ('99', '90a2e0269b6c878', '1.0', '2017-09-07 14:59:33');
INSERT INTO `ccard_apk_log` VALUES ('100', '90a2e0269b6c878', '1.0', '2017-09-07 15:00:40');
INSERT INTO `ccard_apk_log` VALUES ('101', '90a2e0269b6c878', '1.0', '2017-09-07 16:04:33');
INSERT INTO `ccard_apk_log` VALUES ('102', '90a2e0269b6c878', '1.0', '2017-09-07 16:25:52');
INSERT INTO `ccard_apk_log` VALUES ('103', '90a2e0269b6c878', '1.0', '2017-09-07 16:52:58');
INSERT INTO `ccard_apk_log` VALUES ('104', '90a2e0269b6c878', '1.0', '2017-09-07 16:53:38');
INSERT INTO `ccard_apk_log` VALUES ('105', '90a2e0269b6c878', '1.0', '2017-09-07 17:00:32');
INSERT INTO `ccard_apk_log` VALUES ('106', '90a2e0269b6c878', '1.0', '2017-09-07 17:04:27');
INSERT INTO `ccard_apk_log` VALUES ('107', '90a2e0269b6c878', '1.0', '2017-09-07 17:04:54');
INSERT INTO `ccard_apk_log` VALUES ('108', '90a2e0269b6c878', '1.0', '2017-09-07 17:12:55');
INSERT INTO `ccard_apk_log` VALUES ('109', '90a2e0269b6c878', '1.0', '2017-09-07 17:15:08');
INSERT INTO `ccard_apk_log` VALUES ('110', '90a2e0269b6c878', '1.0', '2017-09-07 17:20:33');
INSERT INTO `ccard_apk_log` VALUES ('111', '90a2e0269b6c878', '1.0', '2017-09-07 17:20:52');
INSERT INTO `ccard_apk_log` VALUES ('112', '90a2e0269b6c878', '1.0', '2017-09-07 17:24:24');
INSERT INTO `ccard_apk_log` VALUES ('113', '90a2e0269b6c878', '1.0', '2017-09-07 17:27:54');
INSERT INTO `ccard_apk_log` VALUES ('114', '90a2e0269b6c878', '1.0', '2017-09-07 17:28:43');
INSERT INTO `ccard_apk_log` VALUES ('115', '90a2e0269b6c878', '1.0', '2017-09-07 17:32:25');
INSERT INTO `ccard_apk_log` VALUES ('116', '90a2e0269b6c878', '1.0', '2017-09-07 17:33:28');
INSERT INTO `ccard_apk_log` VALUES ('117', '90a2e0269b6c878', '1.0', '2017-09-07 17:44:52');
INSERT INTO `ccard_apk_log` VALUES ('118', '90a2e0269b6c878', '1.0', '2017-09-08 09:30:06');
INSERT INTO `ccard_apk_log` VALUES ('119', '90a2e0269b6c878', '1.0', '2017-09-08 11:04:46');
INSERT INTO `ccard_apk_log` VALUES ('120', '90a2e0269b6c878', '1.0', '2017-09-08 11:23:50');
INSERT INTO `ccard_apk_log` VALUES ('121', '90a2e0269b6c878', '1.0', '2017-09-08 16:15:45');
INSERT INTO `ccard_apk_log` VALUES ('122', '90a2e0269b6c878', '1.0', '2017-09-08 16:47:26');
INSERT INTO `ccard_apk_log` VALUES ('123', '90a2e0269b6c878', '1.0', '2017-09-08 17:05:53');
INSERT INTO `ccard_apk_log` VALUES ('124', '90a2e0269b6c878', '1.0', '2017-09-08 17:32:27');
INSERT INTO `ccard_apk_log` VALUES ('125', '90a2e0269b6c878', '1.0', '2017-09-09 10:44:14');
INSERT INTO `ccard_apk_log` VALUES ('126', '90a2e0269b6c878', '1.0', '2017-09-09 15:14:01');
INSERT INTO `ccard_apk_log` VALUES ('127', '90a2e0269b6c878', '1.0', '2017-09-09 16:48:19');
INSERT INTO `ccard_apk_log` VALUES ('128', '90a2e0269b6c878', '1.0', '2017-09-09 16:55:22');
INSERT INTO `ccard_apk_log` VALUES ('129', '90a2e0269b6c878', '1.0', '2017-09-09 16:56:33');
INSERT INTO `ccard_apk_log` VALUES ('130', '90a2e0269b6c878', '1.0', '2017-09-09 16:59:24');
INSERT INTO `ccard_apk_log` VALUES ('131', '90a2e0269b6c878', '1.0', '2017-09-09 17:11:23');
INSERT INTO `ccard_apk_log` VALUES ('132', '90a2e0269b6c878', '1.0', '2017-09-09 17:14:19');
INSERT INTO `ccard_apk_log` VALUES ('133', '90a2e0269b6c878', '1.0', '2017-09-09 17:16:33');
INSERT INTO `ccard_apk_log` VALUES ('134', '90a2e0269b6c878', '1.0', '2017-09-09 17:20:54');
INSERT INTO `ccard_apk_log` VALUES ('135', '90a2e0269b6c878', '1.0', '2017-09-09 17:29:05');
INSERT INTO `ccard_apk_log` VALUES ('136', '90a2e0269b6c878', '1.0', '2017-09-11 09:13:04');
INSERT INTO `ccard_apk_log` VALUES ('137', '90a2e0269b6c878', '1.0', '2017-09-11 11:07:17');
INSERT INTO `ccard_apk_log` VALUES ('138', '90a2e0269b6c878', '1.0', '2017-09-11 11:22:02');
INSERT INTO `ccard_apk_log` VALUES ('139', '90a2e0269b6c878', '1.0', '2017-09-11 11:38:36');
INSERT INTO `ccard_apk_log` VALUES ('140', '90a2e0269b6c878', '1.0', '2017-09-11 11:38:52');
INSERT INTO `ccard_apk_log` VALUES ('141', '90a2e0269b6c878', '1.0', '2017-09-11 11:42:57');
INSERT INTO `ccard_apk_log` VALUES ('142', '90a2e0269b6c878', '1.0', '2017-09-11 11:45:14');
INSERT INTO `ccard_apk_log` VALUES ('143', '90a2e0269b6c878', '1.0', '2017-09-11 12:14:22');
INSERT INTO `ccard_apk_log` VALUES ('144', '90a2e0269b6c878', '1.0', '2017-09-11 12:15:59');
INSERT INTO `ccard_apk_log` VALUES ('145', '90a2e0269b6c878', '1.0', '2017-09-11 12:18:42');
INSERT INTO `ccard_apk_log` VALUES ('146', '90a2e0269b6c878', '1.0', '2017-09-13 09:59:03');
INSERT INTO `ccard_apk_log` VALUES ('147', '90a2e0269b6c878', '1.0', '2017-09-13 09:59:47');
INSERT INTO `ccard_apk_log` VALUES ('148', '90a2e0269b6c878', '1.0', '2017-09-13 10:08:54');
INSERT INTO `ccard_apk_log` VALUES ('149', '90a2e0269b6c878', '1.0', '2017-09-13 10:52:13');
INSERT INTO `ccard_apk_log` VALUES ('150', '90a2e0269b6c878', '1.0', '2017-09-13 10:58:26');
INSERT INTO `ccard_apk_log` VALUES ('151', '90a2e0269b6c878', '1.0', '2017-09-13 11:11:09');
INSERT INTO `ccard_apk_log` VALUES ('152', '90a2e0269b6c878', '1.0', '2017-09-13 11:16:13');
INSERT INTO `ccard_apk_log` VALUES ('153', '90a2e0269b6c878', '1.0', '2017-09-13 11:18:17');
INSERT INTO `ccard_apk_log` VALUES ('154', '90a2e0269b6c878', '1.0', '2017-09-13 11:28:42');
INSERT INTO `ccard_apk_log` VALUES ('155', '90a2e0269b6c878', '1.0', '2017-09-13 11:31:04');
INSERT INTO `ccard_apk_log` VALUES ('156', '90a2e0269b6c878', '1.0', '2017-09-13 11:49:38');
INSERT INTO `ccard_apk_log` VALUES ('157', '90a2e0269b6c878', '1.0', '2017-09-13 11:51:44');
INSERT INTO `ccard_apk_log` VALUES ('158', '90a2e0269b6c878', '1.0', '2017-09-13 12:55:50');
INSERT INTO `ccard_apk_log` VALUES ('159', '90a2e0269b6c878', '1.0', '2017-09-13 13:01:19');
INSERT INTO `ccard_apk_log` VALUES ('160', '90a2e0269b6c878', '1.0', '2017-09-13 13:03:02');
INSERT INTO `ccard_apk_log` VALUES ('161', '90a2e0269b6c878', '1.0', '2017-09-13 13:04:23');
INSERT INTO `ccard_apk_log` VALUES ('162', '90a2e0269b6c878', '1.0', '2017-09-13 13:07:00');
INSERT INTO `ccard_apk_log` VALUES ('163', '90a2e0269b6c878', '1.0', '2017-09-13 14:15:09');
INSERT INTO `ccard_apk_log` VALUES ('164', '90a2e0269b6c878', '1.0', '2017-09-13 14:17:04');
INSERT INTO `ccard_apk_log` VALUES ('165', '90a2e0269b6c878', '1.0', '2017-09-13 14:18:56');
INSERT INTO `ccard_apk_log` VALUES ('166', '90a2e0269b6c878', '1.0', '2017-09-13 14:26:08');
INSERT INTO `ccard_apk_log` VALUES ('167', '90a2e0269b6c878', '1.0', '2017-09-13 14:28:08');
INSERT INTO `ccard_apk_log` VALUES ('168', '90a2e0269b6c878', '1.0', '2017-09-13 14:29:51');
INSERT INTO `ccard_apk_log` VALUES ('169', '90a2e0269b6c878', '1.0', '2017-09-14 08:37:34');
INSERT INTO `ccard_apk_log` VALUES ('170', '90a2e0269b6c878', '1.0', '2017-09-14 08:38:35');
INSERT INTO `ccard_apk_log` VALUES ('171', '90a2e0269b6c878', '1.0', '2017-09-14 08:39:41');
INSERT INTO `ccard_apk_log` VALUES ('172', '90a2e0269b6c878', '1.0', '2017-09-14 08:45:42');
INSERT INTO `ccard_apk_log` VALUES ('173', '90a2e0269b6c878', '1.0', '2017-09-14 09:00:38');
INSERT INTO `ccard_apk_log` VALUES ('174', '90a2e0269b6c878', '1.0', '2017-09-14 09:07:53');
INSERT INTO `ccard_apk_log` VALUES ('175', '90a2e0269b6c878', '1.0', '2017-09-14 09:57:57');
INSERT INTO `ccard_apk_log` VALUES ('176', '90a2e0269b6c878', '1.0', '2017-09-14 10:41:09');
INSERT INTO `ccard_apk_log` VALUES ('177', '90a2e0269b6c878', '1.0', '2017-09-14 10:42:17');
INSERT INTO `ccard_apk_log` VALUES ('178', '90a2e0269b6c878', '1.0', '2017-09-14 10:45:12');
INSERT INTO `ccard_apk_log` VALUES ('179', '90a2e0269b6c878', '1.0', '2017-09-14 10:49:49');
INSERT INTO `ccard_apk_log` VALUES ('180', '90a2e0269b6c878', '1.0', '2017-09-14 10:50:12');
INSERT INTO `ccard_apk_log` VALUES ('181', '90a2e0269b6c878', '1.0', '2017-09-14 10:57:09');
INSERT INTO `ccard_apk_log` VALUES ('182', '90a2e0269b6c878', '1.0', '2017-09-14 11:10:00');
INSERT INTO `ccard_apk_log` VALUES ('183', '90a2e0269b6c878', '1.0', '2017-09-14 14:39:17');
INSERT INTO `ccard_apk_log` VALUES ('184', '90a2e0269b6c878', '1.0', '2017-09-15 08:17:02');
INSERT INTO `ccard_apk_log` VALUES ('185', '90a2e0269b6c878', '1.0', '2017-09-15 08:17:43');
INSERT INTO `ccard_apk_log` VALUES ('186', '90a2e0269b6c878', '1.0', '2017-09-15 08:18:08');
INSERT INTO `ccard_apk_log` VALUES ('187', '90a2e0269b6c878', '1.0', '2017-09-15 08:18:25');
INSERT INTO `ccard_apk_log` VALUES ('188', '90a2e0269b6c878', '1.0', '2017-09-15 08:19:09');
INSERT INTO `ccard_apk_log` VALUES ('189', '90a2e0269b6c878', '1.0', '2017-09-15 08:21:31');
INSERT INTO `ccard_apk_log` VALUES ('190', '90a2e0269b6c878', '1.0', '2017-09-15 08:22:39');
INSERT INTO `ccard_apk_log` VALUES ('191', '90a2e0269b6c878', '1.0', '2017-09-15 08:24:27');
INSERT INTO `ccard_apk_log` VALUES ('192', '90a2e0269b6c878', '1.0', '2017-09-15 08:24:39');
INSERT INTO `ccard_apk_log` VALUES ('193', '90a2e0269b6c878', '1.0', '2017-09-15 08:27:11');
INSERT INTO `ccard_apk_log` VALUES ('194', '90a2e0269b6c878', '1.0', '2017-09-15 08:27:42');
INSERT INTO `ccard_apk_log` VALUES ('195', '90a2e0269b6c878', '1.0', '2017-09-15 08:28:37');
INSERT INTO `ccard_apk_log` VALUES ('196', '90a2e0269b6c878', '1.0', '2017-09-15 08:30:06');
INSERT INTO `ccard_apk_log` VALUES ('197', '90a2e0269b6c878', '1.0', '2017-09-15 08:49:28');
INSERT INTO `ccard_apk_log` VALUES ('198', '90a2e0269b6c878', '1.0', '2017-09-15 08:50:26');
INSERT INTO `ccard_apk_log` VALUES ('199', '90a2e0269b6c878', '1.0', '2017-09-15 08:52:41');
INSERT INTO `ccard_apk_log` VALUES ('200', '90a2e0269b6c878', '1.0', '2017-09-15 11:21:44');
INSERT INTO `ccard_apk_log` VALUES ('201', '90a2e0269b6c878', '1.0', '2017-09-15 11:34:47');
INSERT INTO `ccard_apk_log` VALUES ('202', '90a2e0269b6c878', '1.0', '2017-09-16 08:43:19');
INSERT INTO `ccard_apk_log` VALUES ('203', '90a2e0269b6c878', '1.0', '2017-09-21 10:03:26');
INSERT INTO `ccard_apk_log` VALUES ('204', '90a2e0269b6c878', '1.0', '2017-09-21 10:03:35');
INSERT INTO `ccard_apk_log` VALUES ('205', '90a2e0269b6c878', '1.0', '2017-09-21 10:03:52');
INSERT INTO `ccard_apk_log` VALUES ('206', '90a2e0269b6c878', '1.0', '2017-09-21 10:05:03');
INSERT INTO `ccard_apk_log` VALUES ('207', '90a2e0269b6c878', '1.0', '2017-09-21 14:20:39');
INSERT INTO `ccard_apk_log` VALUES ('208', '90a2e0269b6c878', '1.0', '2017-09-21 14:25:52');
INSERT INTO `ccard_apk_log` VALUES ('209', '90a2e0269b6c878', '1.0', '2017-09-21 14:41:55');
INSERT INTO `ccard_apk_log` VALUES ('210', '90a2e0269b6c878', '1.0', '2017-09-21 14:43:05');
INSERT INTO `ccard_apk_log` VALUES ('211', '90a2e0269b6c878', '1.0', '2017-09-21 14:43:43');
INSERT INTO `ccard_apk_log` VALUES ('212', '90a2e0269b6c878', '1.0', '2017-09-21 14:50:03');
INSERT INTO `ccard_apk_log` VALUES ('213', '90a2e0269b6c878', '1.0', '2017-09-21 15:03:25');
INSERT INTO `ccard_apk_log` VALUES ('214', '90a2e0269b6c878', '1.0', '2017-09-21 15:10:48');
INSERT INTO `ccard_apk_log` VALUES ('215', '90a2e0269b6c878', '1.0', '2017-09-21 15:49:36');
INSERT INTO `ccard_apk_log` VALUES ('216', '90a2e0269b6c878', '1.0', '2017-09-21 16:03:59');
INSERT INTO `ccard_apk_log` VALUES ('217', '90a2e0269b6c878', '1.0', '2017-09-21 16:09:15');
INSERT INTO `ccard_apk_log` VALUES ('218', '90a2e0269b6c878', '1.0', '2017-09-21 16:11:07');
INSERT INTO `ccard_apk_log` VALUES ('219', '90a2e0269b6c878', '1.0', '2017-09-21 16:15:43');
INSERT INTO `ccard_apk_log` VALUES ('220', '90a2e0269b6c878', '1.0', '2017-09-21 16:17:11');
INSERT INTO `ccard_apk_log` VALUES ('221', '90a2e0269b6c878', '1.0', '2017-09-21 16:19:26');
INSERT INTO `ccard_apk_log` VALUES ('222', '90a2e0269b6c878', '1.0', '2017-09-21 16:36:34');
INSERT INTO `ccard_apk_log` VALUES ('223', '90a2e0269b6c878', '1.0', '2017-09-21 16:47:44');
INSERT INTO `ccard_apk_log` VALUES ('224', '90a2e0269b6c878', '1.0', '2017-09-21 17:02:03');
INSERT INTO `ccard_apk_log` VALUES ('225', '90a2e0269b6c878', '1.0', '2017-09-21 17:02:48');
INSERT INTO `ccard_apk_log` VALUES ('226', '90a2e0269b6c878', '1.0', '2017-09-21 17:03:51');
INSERT INTO `ccard_apk_log` VALUES ('227', '90a2e0269b6c878', '1.0', '2017-09-21 17:04:43');
INSERT INTO `ccard_apk_log` VALUES ('228', '90a2e0269b6c878', '1.0', '2017-09-21 17:09:19');
INSERT INTO `ccard_apk_log` VALUES ('229', '90a2e0269b6c878', '1.0', '2017-09-21 17:17:00');
INSERT INTO `ccard_apk_log` VALUES ('230', '90a2e0269b6c878', '1.0', '2017-09-21 17:24:49');
INSERT INTO `ccard_apk_log` VALUES ('231', '90a2e0269b6c878', '1.0', '2017-09-22 08:03:41');
INSERT INTO `ccard_apk_log` VALUES ('232', '90a2e0269b6c878', '1.0', '2017-09-22 08:06:04');
INSERT INTO `ccard_apk_log` VALUES ('233', '90a2e0269b6c878', '1.0', '2017-09-22 08:06:54');
INSERT INTO `ccard_apk_log` VALUES ('234', '90a2e0269b6c878', '1.0', '2017-09-22 08:33:23');
INSERT INTO `ccard_apk_log` VALUES ('235', '90a2e0269b6c878', '1.0', '2017-09-22 08:34:49');
INSERT INTO `ccard_apk_log` VALUES ('236', '90a2e0269b6c878', '1.0', '2017-09-22 08:40:30');
INSERT INTO `ccard_apk_log` VALUES ('237', '90a2e0269b6c878', '1.0', '2017-09-22 09:34:30');
INSERT INTO `ccard_apk_log` VALUES ('238', '90a2e0269b6c878', '1.0', '2017-09-22 09:41:53');
INSERT INTO `ccard_apk_log` VALUES ('239', '90a2e0269b6c878', '1.0', '2017-09-22 09:47:17');
INSERT INTO `ccard_apk_log` VALUES ('240', '90a2e0269b6c878', '1.0', '2017-09-22 09:59:35');
INSERT INTO `ccard_apk_log` VALUES ('241', '90a2e0269b6c878', '1.0', '2017-09-22 11:20:09');
INSERT INTO `ccard_apk_log` VALUES ('242', '90a2e0269b6c878', '1.0', '2017-09-22 15:58:38');
INSERT INTO `ccard_apk_log` VALUES ('243', '90a2e0269b6c878', '1.0', '2017-09-22 16:45:49');
INSERT INTO `ccard_apk_log` VALUES ('244', '90a2e0269b6c878', '1.0', '2017-09-22 17:04:44');
INSERT INTO `ccard_apk_log` VALUES ('245', '90a2e0269b6c878', '1.0', '2017-09-25 09:37:36');
INSERT INTO `ccard_apk_log` VALUES ('246', '90a2e0269b6c878', '1.0', '2017-09-25 09:38:37');
INSERT INTO `ccard_apk_log` VALUES ('247', '90a2e0269b6c878', '1.0', '2017-09-25 09:54:25');
INSERT INTO `ccard_apk_log` VALUES ('248', '90a2e0269b6c878', '1.0', '2017-09-25 11:00:05');
INSERT INTO `ccard_apk_log` VALUES ('249', '90a2e0269b6c878', '1.0', '2017-09-25 13:35:09');
INSERT INTO `ccard_apk_log` VALUES ('250', '90a2e0269b6c878', '1.0', '2017-09-25 13:35:45');
INSERT INTO `ccard_apk_log` VALUES ('251', '90a2e0269b6c878', '1.0', '2017-09-25 13:36:03');
INSERT INTO `ccard_apk_log` VALUES ('252', '90a2e0269b6c878', '1.0', '2017-09-25 13:37:31');
INSERT INTO `ccard_apk_log` VALUES ('253', '90a2e0269b6c878', '1.0', '2017-09-25 13:46:15');
INSERT INTO `ccard_apk_log` VALUES ('254', '90a2e0269b6c878', '1.0', '2017-09-25 15:25:08');
INSERT INTO `ccard_apk_log` VALUES ('255', '90a2e0269b6c878', '1.0', '2017-09-25 15:34:03');
INSERT INTO `ccard_apk_log` VALUES ('256', '90a2e0269b6c878', '1.0', '2017-09-25 15:34:14');
INSERT INTO `ccard_apk_log` VALUES ('257', '90a2e0269b6c878', '1.0', '2017-09-25 15:34:31');
INSERT INTO `ccard_apk_log` VALUES ('258', '90a2e0269b6c878', '1.0', '2017-09-25 17:21:16');
INSERT INTO `ccard_apk_log` VALUES ('259', '90a2e0269b6c878', '1.0', '2017-09-26 08:06:55');
INSERT INTO `ccard_apk_log` VALUES ('260', '90a2e0269b6c878', '1.0', '2017-09-26 08:48:15');
INSERT INTO `ccard_apk_log` VALUES ('261', '90a2e0269b6c878', '1.0', '2017-09-26 08:52:42');
INSERT INTO `ccard_apk_log` VALUES ('262', '90a2e0269b6c878', '1.0', '2017-09-26 09:10:45');
INSERT INTO `ccard_apk_log` VALUES ('263', '90a2e0269b6c878', '1.0', '2017-09-26 09:18:10');
INSERT INTO `ccard_apk_log` VALUES ('264', '90a2e0269b6c878', '1.0', '2017-09-26 09:23:16');
INSERT INTO `ccard_apk_log` VALUES ('265', '90a2e0269b6c878', '1.0', '2017-09-26 09:25:33');
INSERT INTO `ccard_apk_log` VALUES ('266', '90a2e0269b6c878', '1.0', '2017-09-26 09:29:35');
INSERT INTO `ccard_apk_log` VALUES ('267', '90a2e0269b6c878', '1.0', '2017-09-26 09:51:41');
INSERT INTO `ccard_apk_log` VALUES ('268', '90a2e0269b6c878', '1.0', '2017-09-26 09:52:38');
INSERT INTO `ccard_apk_log` VALUES ('269', '90a2e0269b6c878', '1.0', '2017-09-26 10:00:32');
INSERT INTO `ccard_apk_log` VALUES ('270', '90a2e0269b6c878', '1.0', '2017-09-26 10:00:51');
INSERT INTO `ccard_apk_log` VALUES ('271', '90a2e0269b6c878', '1.0', '2017-09-26 10:02:05');
INSERT INTO `ccard_apk_log` VALUES ('272', '90a2e0269b6c878', '1.0', '2017-09-26 10:04:37');
INSERT INTO `ccard_apk_log` VALUES ('273', '90a2e0269b6c878', '1.0', '2017-09-26 10:06:50');
INSERT INTO `ccard_apk_log` VALUES ('274', '90a2e0269b6c878', '1.0', '2017-09-26 10:10:55');
INSERT INTO `ccard_apk_log` VALUES ('275', '90a2e0269b6c878', '1.0', '2017-09-26 10:11:17');
INSERT INTO `ccard_apk_log` VALUES ('276', '90a2e0269b6c878', '1.0', '2017-09-26 10:16:44');
INSERT INTO `ccard_apk_log` VALUES ('277', '90a2e0269b6c878', '1.0', '2017-09-26 10:17:17');
INSERT INTO `ccard_apk_log` VALUES ('278', '90a2e0269b6c878', '1.0', '2017-09-26 10:18:55');
INSERT INTO `ccard_apk_log` VALUES ('279', '90a2e0269b6c878', '1.0', '2017-09-26 10:20:27');
INSERT INTO `ccard_apk_log` VALUES ('280', '90a2e0269b6c878', '1.0', '2017-09-26 10:27:00');
INSERT INTO `ccard_apk_log` VALUES ('281', '90a2e0269b6c878', '1.0', '2017-09-26 10:30:10');
INSERT INTO `ccard_apk_log` VALUES ('282', '90a2e0269b6c878', '1.0', '2017-09-26 10:31:53');
INSERT INTO `ccard_apk_log` VALUES ('283', '90a2e0269b6c878', '1.0', '2017-09-26 11:41:30');
INSERT INTO `ccard_apk_log` VALUES ('284', '90a2e0269b6c878', '1.0', '2017-09-26 13:38:50');
INSERT INTO `ccard_apk_log` VALUES ('285', '90a2e0269b6c878', '1.0', '2017-09-26 13:39:39');
INSERT INTO `ccard_apk_log` VALUES ('286', '90a2e0269b6c878', '1.0', '2017-09-26 13:44:44');
INSERT INTO `ccard_apk_log` VALUES ('287', '90a2e0269b6c878', '1.0', '2017-09-26 13:46:20');
INSERT INTO `ccard_apk_log` VALUES ('288', '90a2e0269b6c878', '1.0', '2017-09-26 14:20:48');
INSERT INTO `ccard_apk_log` VALUES ('289', '90a2e0269b6c878', '1.0', '2017-09-26 14:41:55');
INSERT INTO `ccard_apk_log` VALUES ('290', '90a2e0269b6c878', '1.0', '2017-09-26 14:48:44');
INSERT INTO `ccard_apk_log` VALUES ('291', '90a2e0269b6c878', '1.0', '2017-09-26 14:49:42');
INSERT INTO `ccard_apk_log` VALUES ('292', '90a2e0269b6c878', '1.0', '2017-09-26 14:53:28');
INSERT INTO `ccard_apk_log` VALUES ('293', '90a2e0269b6c878', '1.0', '2017-09-26 14:57:28');
INSERT INTO `ccard_apk_log` VALUES ('294', '90a2e0269b6c878', '1.0', '2017-09-26 15:00:20');
INSERT INTO `ccard_apk_log` VALUES ('295', '90a2e0269b6c878', '1.0', '2017-09-26 15:03:25');
INSERT INTO `ccard_apk_log` VALUES ('296', '90a2e0269b6c878', '1.0', '2017-09-26 15:04:33');
INSERT INTO `ccard_apk_log` VALUES ('297', '90a2e0269b6c878', '1.0', '2017-09-26 15:07:40');
INSERT INTO `ccard_apk_log` VALUES ('298', '90a2e0269b6c878', '1.0', '2017-09-26 15:08:56');
INSERT INTO `ccard_apk_log` VALUES ('299', '5c41faac5b6e9eca', '1.0', '2017-09-26 15:15:17');
INSERT INTO `ccard_apk_log` VALUES ('300', '90a2e0269b6c878', '1.0', '2017-09-26 15:17:28');
INSERT INTO `ccard_apk_log` VALUES ('301', '90a2e0269b6c878', '1.0', '2017-09-26 15:32:15');
INSERT INTO `ccard_apk_log` VALUES ('302', '90a2e0269b6c878', '1.0', '2017-09-26 15:32:57');
INSERT INTO `ccard_apk_log` VALUES ('303', '90a2e0269b6c878', '1.0', '2017-09-26 15:33:46');
INSERT INTO `ccard_apk_log` VALUES ('304', '90a2e0269b6c878', '1.0', '2017-09-26 15:34:42');
INSERT INTO `ccard_apk_log` VALUES ('305', '90a2e0269b6c878', '1.0', '2017-09-26 15:35:22');
INSERT INTO `ccard_apk_log` VALUES ('306', '90a2e0269b6c878', '1.0', '2017-09-26 15:37:02');
INSERT INTO `ccard_apk_log` VALUES ('307', '90a2e0269b6c878', '1.0', '2017-09-26 15:40:21');
INSERT INTO `ccard_apk_log` VALUES ('308', '90a2e0269b6c878', '1.0', '2017-09-26 15:46:31');
INSERT INTO `ccard_apk_log` VALUES ('309', '90a2e0269b6c878', '1.0', '2017-09-26 15:48:03');
INSERT INTO `ccard_apk_log` VALUES ('310', '90a2e0269b6c878', '1.0', '2017-09-26 15:55:55');
INSERT INTO `ccard_apk_log` VALUES ('311', '90a2e0269b6c878', '1.0', '2017-09-26 15:57:19');
INSERT INTO `ccard_apk_log` VALUES ('312', '90a2e0269b6c878', '1.0', '2017-09-26 15:58:58');
INSERT INTO `ccard_apk_log` VALUES ('313', '90a2e0269b6c878', '1.0', '2017-09-26 16:54:25');
INSERT INTO `ccard_apk_log` VALUES ('314', '90a2e0269b6c878', '1.0', '2017-09-26 19:31:39');
INSERT INTO `ccard_apk_log` VALUES ('315', '90a2e0269b6c878', '1.0', '2017-09-27 09:22:23');
INSERT INTO `ccard_apk_log` VALUES ('316', '90a2e0269b6c878', '1.0', '2017-09-27 09:24:26');
INSERT INTO `ccard_apk_log` VALUES ('317', '90a2e0269b6c878', '1.0', '2017-09-27 09:24:38');
INSERT INTO `ccard_apk_log` VALUES ('318', '90a2e0269b6c878', '1.0', '2017-09-27 10:13:27');
INSERT INTO `ccard_apk_log` VALUES ('319', '90a2e0269b6c878', '1.0', '2017-09-27 15:19:24');
INSERT INTO `ccard_apk_log` VALUES ('320', '90a2e0269b6c878', '1.0', '2017-09-27 15:22:39');
INSERT INTO `ccard_apk_log` VALUES ('321', '90a2e0269b6c878', '1.0', '2017-09-27 15:23:37');
INSERT INTO `ccard_apk_log` VALUES ('322', '90a2e0269b6c878', '1.0', '2017-09-27 15:25:37');
INSERT INTO `ccard_apk_log` VALUES ('323', '90a2e0269b6c878', '1.0', '2017-09-27 16:51:33');
INSERT INTO `ccard_apk_log` VALUES ('324', '90a2e0269b6c878', '1.0', '2017-09-27 16:52:14');
INSERT INTO `ccard_apk_log` VALUES ('325', '90a2e0269b6c878', '1.0', '2017-09-27 16:56:50');
INSERT INTO `ccard_apk_log` VALUES ('326', '90a2e0269b6c878', '1.0', '2017-09-27 16:58:18');
INSERT INTO `ccard_apk_log` VALUES ('327', '90a2e0269b6c878', '1.0', '2017-09-27 17:02:59');
INSERT INTO `ccard_apk_log` VALUES ('328', '90a2e0269b6c878', '1.0', '2017-09-27 17:05:25');
INSERT INTO `ccard_apk_log` VALUES ('329', '90a2e0269b6c878', '1.0', '2017-09-27 17:10:33');
INSERT INTO `ccard_apk_log` VALUES ('330', '90a2e0269b6c878', '1.0', '2017-09-27 17:11:53');
INSERT INTO `ccard_apk_log` VALUES ('331', '90a2e0269b6c878', '1.0', '2017-09-27 17:17:30');
INSERT INTO `ccard_apk_log` VALUES ('332', '90a2e0269b6c878', '1.0', '2017-09-27 17:19:17');
INSERT INTO `ccard_apk_log` VALUES ('333', '90a2e0269b6c878', '1.0', '2017-09-27 17:29:34');
INSERT INTO `ccard_apk_log` VALUES ('334', '90a2e0269b6c878', '1.0', '2017-09-27 17:30:21');
INSERT INTO `ccard_apk_log` VALUES ('335', '90a2e0269b6c878', '1.0', '2017-09-27 17:31:33');
INSERT INTO `ccard_apk_log` VALUES ('336', '90a2e0269b6c878', '1.0', '2017-09-27 17:31:52');
INSERT INTO `ccard_apk_log` VALUES ('337', '90a2e0269b6c878', '1.0', '2017-09-28 08:47:31');
INSERT INTO `ccard_apk_log` VALUES ('338', '90a2e0269b6c878', '1.0', '2017-09-28 08:51:56');
INSERT INTO `ccard_apk_log` VALUES ('339', '90a2e0269b6c878', '1.0', '2017-09-28 08:57:46');
INSERT INTO `ccard_apk_log` VALUES ('340', '90a2e0269b6c878', '1.0', '2017-09-28 09:06:28');
INSERT INTO `ccard_apk_log` VALUES ('341', '90a2e0269b6c878', '1.0', '2017-09-28 09:08:24');
INSERT INTO `ccard_apk_log` VALUES ('342', '90a2e0269b6c878', '1.0', '2017-09-28 09:10:36');
INSERT INTO `ccard_apk_log` VALUES ('343', '90a2e0269b6c878', '1.0', '2017-09-28 09:12:19');
INSERT INTO `ccard_apk_log` VALUES ('344', '90a2e0269b6c878', '1.0', '2017-09-28 09:13:36');
INSERT INTO `ccard_apk_log` VALUES ('345', '90a2e0269b6c878', '1.0', '2017-09-28 09:14:54');
INSERT INTO `ccard_apk_log` VALUES ('346', '90a2e0269b6c878', '1.0', '2017-09-28 09:18:30');
INSERT INTO `ccard_apk_log` VALUES ('347', '90a2e0269b6c878', '1.0', '2017-09-28 09:20:16');
INSERT INTO `ccard_apk_log` VALUES ('348', '90a2e0269b6c878', '1.0', '2017-09-28 10:22:16');
INSERT INTO `ccard_apk_log` VALUES ('349', '90a2e0269b6c878', '1.0', '2017-09-28 13:52:21');
INSERT INTO `ccard_apk_log` VALUES ('350', '90a2e0269b6c878', '1.0', '2017-09-28 14:19:22');
INSERT INTO `ccard_apk_log` VALUES ('351', '90a2e0269b6c878', '1.0', '2017-09-29 08:15:24');
INSERT INTO `ccard_apk_log` VALUES ('352', '90a2e0269b6c878', '1.0', '2017-09-29 08:24:22');
INSERT INTO `ccard_apk_log` VALUES ('353', '90a2e0269b6c878', '1.0', '2017-09-29 08:27:08');
INSERT INTO `ccard_apk_log` VALUES ('354', '90a2e0269b6c878', '1.0', '2017-09-29 08:27:47');
INSERT INTO `ccard_apk_log` VALUES ('355', '90a2e0269b6c878', '1.0', '2017-09-29 08:34:59');
INSERT INTO `ccard_apk_log` VALUES ('356', '90a2e0269b6c878', '1.0', '2017-09-29 08:36:17');
INSERT INTO `ccard_apk_log` VALUES ('357', '90a2e0269b6c878', '1.0', '2017-09-29 08:37:10');
INSERT INTO `ccard_apk_log` VALUES ('358', '90a2e0269b6c878', '1.0', '2017-09-29 08:46:34');
INSERT INTO `ccard_apk_log` VALUES ('359', '90a2e0269b6c878', '1.0', '2017-09-29 08:48:59');
INSERT INTO `ccard_apk_log` VALUES ('360', '90a2e0269b6c878', '1.0', '2017-09-29 09:15:17');
INSERT INTO `ccard_apk_log` VALUES ('361', '90a2e0269b6c878', '1.0', '2017-09-29 09:25:54');
INSERT INTO `ccard_apk_log` VALUES ('362', '90a2e0269b6c878', '1.0', '2017-09-29 09:37:36');
INSERT INTO `ccard_apk_log` VALUES ('363', '90a2e0269b6c878', '1.0', '2017-09-29 09:53:57');
INSERT INTO `ccard_apk_log` VALUES ('364', '90a2e0269b6c878', '1.0', '2017-09-29 15:12:52');
INSERT INTO `ccard_apk_log` VALUES ('365', '90a2e0269b6c878', '1.0', '2017-09-29 15:15:43');
INSERT INTO `ccard_apk_log` VALUES ('366', '90a2e0269b6c878', '1.0', '2017-09-29 15:38:54');
INSERT INTO `ccard_apk_log` VALUES ('367', '90a2e0269b6c878', '1.0', '2017-09-29 16:00:52');
INSERT INTO `ccard_apk_log` VALUES ('368', '90a2e0269b6c878', '1.0', '2017-09-29 16:49:55');
INSERT INTO `ccard_apk_log` VALUES ('369', '90a2e0269b6c878', '1.0', '2017-09-29 17:06:02');
INSERT INTO `ccard_apk_log` VALUES ('370', '90a2e0269b6c878', '1.0', '2017-09-29 17:08:58');
INSERT INTO `ccard_apk_log` VALUES ('371', '90a2e0269b6c878', '1.0', '2017-09-29 17:17:38');
INSERT INTO `ccard_apk_log` VALUES ('372', '90a2e0269b6c878', '1.0', '2017-09-29 17:22:58');
INSERT INTO `ccard_apk_log` VALUES ('373', '90a2e0269b6c878', '1.0', '2017-10-09 09:00:41');
INSERT INTO `ccard_apk_log` VALUES ('374', '90a2e0269b6c878', '1.0', '2017-10-09 10:40:33');
INSERT INTO `ccard_apk_log` VALUES ('375', '90a2e0269b6c878', '1.0', '2017-10-09 10:41:24');
INSERT INTO `ccard_apk_log` VALUES ('376', '90a2e0269b6c878', '1.0', '2017-10-09 10:42:13');
INSERT INTO `ccard_apk_log` VALUES ('377', '90a2e0269b6c878', '1.0', '2017-10-09 10:53:36');
INSERT INTO `ccard_apk_log` VALUES ('378', '90a2e0269b6c878', '1.0', '2017-10-09 10:54:35');
INSERT INTO `ccard_apk_log` VALUES ('379', '90a2e0269b6c878', '1.0', '2017-10-09 11:07:23');
INSERT INTO `ccard_apk_log` VALUES ('380', '90a2e0269b6c878', '1.0', '2017-10-09 11:12:54');
INSERT INTO `ccard_apk_log` VALUES ('381', '90a2e0269b6c878', '1.0', '2017-10-09 11:45:47');
INSERT INTO `ccard_apk_log` VALUES ('382', '90a2e0269b6c878', '1.0', '2017-10-09 14:29:10');
INSERT INTO `ccard_apk_log` VALUES ('383', '90a2e0269b6c878', '1.0', '2017-10-09 15:30:58');
INSERT INTO `ccard_apk_log` VALUES ('384', '90a2e0269b6c878', '1.0', '2017-10-09 16:36:10');
INSERT INTO `ccard_apk_log` VALUES ('385', '90a2e0269b6c878', '1.0', '2017-10-09 16:38:22');
INSERT INTO `ccard_apk_log` VALUES ('386', '90a2e0269b6c878', '1.0', '2017-10-09 16:42:34');
INSERT INTO `ccard_apk_log` VALUES ('387', '90a2e0269b6c878', '1.0', '2017-10-09 16:46:06');
INSERT INTO `ccard_apk_log` VALUES ('388', '90a2e0269b6c878', '1.0', '2017-10-10 09:00:18');
INSERT INTO `ccard_apk_log` VALUES ('389', '90a2e0269b6c878', '1.0', '2017-10-10 09:19:15');
INSERT INTO `ccard_apk_log` VALUES ('390', '90a2e0269b6c878', '1.0', '2017-10-10 09:20:42');
INSERT INTO `ccard_apk_log` VALUES ('391', '90a2e0269b6c878', '1.0', '2017-10-10 09:21:49');
INSERT INTO `ccard_apk_log` VALUES ('392', '90a2e0269b6c878', '1.0', '2017-10-10 09:40:42');
INSERT INTO `ccard_apk_log` VALUES ('393', '90a2e0269b6c878', '1.0', '2017-10-10 17:08:56');
INSERT INTO `ccard_apk_log` VALUES ('394', '90a2e0269b6c878', '1.0', '2017-10-10 17:12:13');
INSERT INTO `ccard_apk_log` VALUES ('395', '90a2e0269b6c878', '1.0', '2017-10-10 17:12:56');
INSERT INTO `ccard_apk_log` VALUES ('396', '90a2e0269b6c878', '1.0', '2017-10-11 09:21:21');
INSERT INTO `ccard_apk_log` VALUES ('397', '90a2e0269b6c878', '1.0', '2017-10-11 09:24:06');
INSERT INTO `ccard_apk_log` VALUES ('398', '90a2e0269b6c878', '1.0', '2017-10-11 14:08:33');
INSERT INTO `ccard_apk_log` VALUES ('399', '90a2e0269b6c878', '1.0', '2017-10-11 14:11:06');
INSERT INTO `ccard_apk_log` VALUES ('400', '90a2e0269b6c878', '1.0', '2017-10-11 14:26:02');
INSERT INTO `ccard_apk_log` VALUES ('401', '90a2e0269b6c878', '1.0', '2017-10-11 14:30:11');
INSERT INTO `ccard_apk_log` VALUES ('402', '90a2e0269b6c878', '1.0', '2017-10-11 14:34:53');
INSERT INTO `ccard_apk_log` VALUES ('403', '90a2e0269b6c878', '1.0', '2017-10-11 14:51:22');
INSERT INTO `ccard_apk_log` VALUES ('404', '90a2e0269b6c878', '1.0', '2017-10-11 14:57:17');
INSERT INTO `ccard_apk_log` VALUES ('405', '90a2e0269b6c878', '1.0', '2017-10-11 15:50:21');
INSERT INTO `ccard_apk_log` VALUES ('406', '90a2e0269b6c878', '1.0', '2017-10-11 16:42:05');
INSERT INTO `ccard_apk_log` VALUES ('407', '90a2e0269b6c878', '1.0', '2017-10-11 16:43:47');
INSERT INTO `ccard_apk_log` VALUES ('408', '90a2e0269b6c878', '1.0', '2017-10-11 16:50:49');
INSERT INTO `ccard_apk_log` VALUES ('409', '90a2e0269b6c878', '1.0', '2017-10-11 16:55:39');
INSERT INTO `ccard_apk_log` VALUES ('410', '90a2e0269b6c878', '1.0', '2017-10-11 17:31:52');
INSERT INTO `ccard_apk_log` VALUES ('411', '90a2e0269b6c878', '1.0', '2017-10-12 08:30:18');
INSERT INTO `ccard_apk_log` VALUES ('412', '90a2e0269b6c878', '1.0', '2017-10-12 08:32:24');
INSERT INTO `ccard_apk_log` VALUES ('413', '90a2e0269b6c878', '1.0', '2017-10-12 08:33:08');
INSERT INTO `ccard_apk_log` VALUES ('414', '90a2e0269b6c878', '1.0', '2017-10-12 08:34:40');
INSERT INTO `ccard_apk_log` VALUES ('415', '90a2e0269b6c878', '1.0', '2017-10-12 08:58:32');
INSERT INTO `ccard_apk_log` VALUES ('416', '90a2e0269b6c878', '1.0', '2017-10-12 09:10:41');
INSERT INTO `ccard_apk_log` VALUES ('417', '90a2e0269b6c878', '1.0', '2017-10-12 09:19:13');
INSERT INTO `ccard_apk_log` VALUES ('418', '90a2e0269b6c878', '1.0', '2017-10-12 10:07:36');
INSERT INTO `ccard_apk_log` VALUES ('419', '90a2e0269b6c878', '1.0', '2017-10-12 10:19:37');
INSERT INTO `ccard_apk_log` VALUES ('420', '90a2e0269b6c878', '1.0', '2017-10-12 10:45:23');
INSERT INTO `ccard_apk_log` VALUES ('421', '90a2e0269b6c878', '1.0', '2017-10-12 10:48:12');
INSERT INTO `ccard_apk_log` VALUES ('422', '90a2e0269b6c878', '1.0', '2017-10-12 11:14:08');
INSERT INTO `ccard_apk_log` VALUES ('423', '90a2e0269b6c878', '1.0', '2017-10-12 13:59:37');
INSERT INTO `ccard_apk_log` VALUES ('424', '90a2e0269b6c878', '1.0', '2017-10-12 14:32:10');
INSERT INTO `ccard_apk_log` VALUES ('425', '90a2e0269b6c878', '1.0', '2017-10-12 14:33:32');
INSERT INTO `ccard_apk_log` VALUES ('426', '90a2e0269b6c878', '1.0', '2017-10-12 14:38:37');
INSERT INTO `ccard_apk_log` VALUES ('427', '90a2e0269b6c878', '1.0', '2017-10-12 14:39:18');
INSERT INTO `ccard_apk_log` VALUES ('428', '90a2e0269b6c878', '1.0', '2017-10-12 14:40:29');
INSERT INTO `ccard_apk_log` VALUES ('429', '90a2e0269b6c878', '1.0', '2017-10-12 14:50:20');
INSERT INTO `ccard_apk_log` VALUES ('430', '90a2e0269b6c878', '1.0', '2017-10-12 14:51:40');
INSERT INTO `ccard_apk_log` VALUES ('431', '90a2e0269b6c878', '1.0', '2017-10-12 14:52:52');
INSERT INTO `ccard_apk_log` VALUES ('432', '90a2e0269b6c878', '1.0', '2017-10-12 14:55:38');
INSERT INTO `ccard_apk_log` VALUES ('433', '90a2e0269b6c878', '1.0', '2017-10-12 15:13:31');
INSERT INTO `ccard_apk_log` VALUES ('434', '90a2e0269b6c878', '1.0', '2017-10-12 15:25:52');
INSERT INTO `ccard_apk_log` VALUES ('435', '90a2e0269b6c878', '1.0', '2017-10-12 15:28:36');
INSERT INTO `ccard_apk_log` VALUES ('436', '90a2e0269b6c878', '1.0', '2017-10-12 15:47:09');
INSERT INTO `ccard_apk_log` VALUES ('437', '90a2e0269b6c878', '1.0', '2017-10-12 15:48:12');
INSERT INTO `ccard_apk_log` VALUES ('438', '90a2e0269b6c878', '1.0', '2017-10-12 16:04:23');
INSERT INTO `ccard_apk_log` VALUES ('439', '90a2e0269b6c878', '1.0', '2017-10-12 16:05:04');
INSERT INTO `ccard_apk_log` VALUES ('440', '90a2e0269b6c878', '1.0', '2017-10-12 16:07:17');
INSERT INTO `ccard_apk_log` VALUES ('441', '90a2e0269b6c878', '1.0', '2017-10-12 16:08:03');
INSERT INTO `ccard_apk_log` VALUES ('442', '90a2e0269b6c878', '1.0', '2017-10-12 16:10:56');
INSERT INTO `ccard_apk_log` VALUES ('443', '90a2e0269b6c878', '1.0', '2017-10-12 16:17:21');
INSERT INTO `ccard_apk_log` VALUES ('444', '90a2e0269b6c878', '1.0', '2017-10-12 17:40:56');
INSERT INTO `ccard_apk_log` VALUES ('445', '90a2e0269b6c878', '1.0', '2017-10-12 17:45:49');
INSERT INTO `ccard_apk_log` VALUES ('446', '90a2e0269b6c878', '1.0', '2017-10-12 17:47:26');
INSERT INTO `ccard_apk_log` VALUES ('447', '90a2e0269b6c878', '1.0', '2017-10-12 18:26:34');
INSERT INTO `ccard_apk_log` VALUES ('448', '90a2e0269b6c878', '1.0', '2017-10-13 08:47:08');
INSERT INTO `ccard_apk_log` VALUES ('449', '90a2e0269b6c878', '1.0', '2017-10-13 14:36:25');
INSERT INTO `ccard_apk_log` VALUES ('450', 'bd1e2ff2f7d039a6', '1.0', '2017-10-13 15:33:30');
INSERT INTO `ccard_apk_log` VALUES ('451', '90a2e0269b6c878', '1.0', '2017-10-13 16:10:35');
INSERT INTO `ccard_apk_log` VALUES ('452', '90a2e0269b6c878', '1.0', '2017-10-13 16:29:15');
INSERT INTO `ccard_apk_log` VALUES ('453', '90a2e0269b6c878', '1.0', '2017-10-13 18:47:18');
INSERT INTO `ccard_apk_log` VALUES ('454', '90a2e0269b6c878', '1.0', '2017-10-13 18:48:09');
INSERT INTO `ccard_apk_log` VALUES ('455', '90a2e0269b6c878', '1.0', '2017-10-13 20:30:56');
INSERT INTO `ccard_apk_log` VALUES ('456', '90a2e0269b6c878', '1.0', '2017-10-13 20:35:08');
INSERT INTO `ccard_apk_log` VALUES ('457', '90a2e0269b6c878', '1.0', '2017-10-13 20:42:18');
INSERT INTO `ccard_apk_log` VALUES ('458', '90a2e0269b6c878', '1.0', '2017-10-13 20:51:18');
INSERT INTO `ccard_apk_log` VALUES ('459', '90a2e0269b6c878', '1.0', '2017-10-13 21:30:26');
INSERT INTO `ccard_apk_log` VALUES ('460', '90a2e0269b6c878', '1.0', '2017-10-13 21:50:39');
INSERT INTO `ccard_apk_log` VALUES ('461', '90a2e0269b6c878', '1.0', '2017-10-13 21:54:31');
INSERT INTO `ccard_apk_log` VALUES ('462', '90a2e0269b6c878', '1.0', '2017-10-14 08:02:11');
INSERT INTO `ccard_apk_log` VALUES ('463', '90a2e0269b6c878', '1.0', '2017-10-14 08:05:11');
INSERT INTO `ccard_apk_log` VALUES ('464', '90a2e0269b6c878', '1.0', '2017-10-24 14:03:06');
INSERT INTO `ccard_apk_log` VALUES ('465', '90a2e0269b6c878', '1.0', '2017-10-24 14:07:01');
INSERT INTO `ccard_apk_log` VALUES ('466', '90a2e0269b6c878', '1.0', '2017-10-24 14:12:40');
INSERT INTO `ccard_apk_log` VALUES ('467', '90a2e0269b6c878', '1.0', '2017-10-24 14:14:13');
INSERT INTO `ccard_apk_log` VALUES ('468', '90a2e0269b6c878', '1.0', '2017-10-24 14:21:32');
INSERT INTO `ccard_apk_log` VALUES ('469', '90a2e0269b6c878', '1.0', '2017-10-24 14:23:56');
INSERT INTO `ccard_apk_log` VALUES ('470', '90a2e0269b6c878', '1.0', '2017-10-24 14:35:38');
INSERT INTO `ccard_apk_log` VALUES ('471', '90a2e0269b6c878', '1.0', '2017-10-24 14:38:51');
INSERT INTO `ccard_apk_log` VALUES ('472', '90a2e0269b6c878', '1.0', '2017-10-24 14:40:07');
INSERT INTO `ccard_apk_log` VALUES ('473', '90a2e0269b6c878', '1.0', '2017-10-24 14:41:59');
INSERT INTO `ccard_apk_log` VALUES ('474', '90a2e0269b6c878', '1.0', '2017-10-24 15:01:45');
INSERT INTO `ccard_apk_log` VALUES ('475', '90a2e0269b6c878', '1.0', '2017-10-24 15:02:38');
INSERT INTO `ccard_apk_log` VALUES ('476', '90a2e0269b6c878', '1.0', '2017-10-24 15:04:54');
INSERT INTO `ccard_apk_log` VALUES ('477', '90a2e0269b6c878', '1.0', '2017-10-24 15:11:26');
INSERT INTO `ccard_apk_log` VALUES ('478', '90a2e0269b6c878', '1.0', '2017-10-24 15:14:54');
INSERT INTO `ccard_apk_log` VALUES ('479', '90a2e0269b6c878', '1.0', '2017-10-24 15:17:50');
INSERT INTO `ccard_apk_log` VALUES ('480', '90a2e0269b6c878', '1.0', '2017-10-24 15:38:05');
INSERT INTO `ccard_apk_log` VALUES ('481', '90a2e0269b6c878', '1.0', '2017-10-24 15:44:36');
INSERT INTO `ccard_apk_log` VALUES ('482', '90a2e0269b6c878', '1.0', '2017-10-24 15:49:28');
INSERT INTO `ccard_apk_log` VALUES ('483', '90a2e0269b6c878', '1.0', '2017-10-24 15:50:07');
INSERT INTO `ccard_apk_log` VALUES ('484', '90a2e0269b6c878', '1.0', '2017-10-24 15:51:26');
INSERT INTO `ccard_apk_log` VALUES ('485', '90a2e0269b6c878', '1.0', '2017-10-24 16:02:04');
INSERT INTO `ccard_apk_log` VALUES ('486', '90a2e0269b6c878', '1.0', '2017-10-24 16:14:53');
INSERT INTO `ccard_apk_log` VALUES ('487', '90a2e0269b6c878', '1.0', '2017-10-24 16:18:41');
INSERT INTO `ccard_apk_log` VALUES ('488', '90a2e0269b6c878', '1.0', '2017-10-24 16:29:43');
INSERT INTO `ccard_apk_log` VALUES ('489', '90a2e0269b6c878', '1.0', '2017-10-24 16:31:48');
INSERT INTO `ccard_apk_log` VALUES ('490', '90a2e0269b6c878', '1.0', '2017-10-24 16:44:06');
INSERT INTO `ccard_apk_log` VALUES ('491', '90a2e0269b6c878', '1.0', '2017-10-24 16:45:16');
INSERT INTO `ccard_apk_log` VALUES ('492', '90a2e0269b6c878', '1.0', '2017-10-24 17:00:46');
INSERT INTO `ccard_apk_log` VALUES ('493', '90a2e0269b6c878', '1.0', '2017-10-24 17:01:06');
INSERT INTO `ccard_apk_log` VALUES ('494', '90a2e0269b6c878', '1.0', '2017-10-24 17:01:54');
INSERT INTO `ccard_apk_log` VALUES ('495', '90a2e0269b6c878', '1.0', '2017-10-24 17:07:23');
INSERT INTO `ccard_apk_log` VALUES ('496', '90a2e0269b6c878', '1.0', '2017-10-24 17:17:03');
INSERT INTO `ccard_apk_log` VALUES ('497', '90a2e0269b6c878', '1.0', '2017-10-24 17:18:21');
INSERT INTO `ccard_apk_log` VALUES ('498', '90a2e0269b6c878', '1.0', '2017-10-24 17:19:12');
INSERT INTO `ccard_apk_log` VALUES ('499', '90a2e0269b6c878', '1.0', '2017-10-24 17:30:13');
INSERT INTO `ccard_apk_log` VALUES ('500', '90a2e0269b6c878', '1.0', '2017-10-24 17:31:35');
INSERT INTO `ccard_apk_log` VALUES ('501', '90a2e0269b6c878', '1.0', '2017-10-25 08:58:04');
INSERT INTO `ccard_apk_log` VALUES ('502', '90a2e0269b6c878', '1.0', '2017-10-26 16:19:57');
INSERT INTO `ccard_apk_log` VALUES ('503', '90a2e0269b6c878', '1.0', '2017-10-26 16:33:18');
INSERT INTO `ccard_apk_log` VALUES ('504', '90a2e0269b6c878', '1.0', '2017-10-26 16:34:08');
INSERT INTO `ccard_apk_log` VALUES ('505', '90a2e0269b6c878', '1.0', '2017-10-26 16:36:26');
INSERT INTO `ccard_apk_log` VALUES ('506', '90a2e0269b6c878', '1.0', '2017-10-26 16:37:41');
INSERT INTO `ccard_apk_log` VALUES ('507', '90a2e0269b6c878', '1.0', '2017-10-26 16:38:38');
INSERT INTO `ccard_apk_log` VALUES ('508', '90a2e0269b6c878', '1.0', '2017-10-30 17:29:09');
INSERT INTO `ccard_apk_log` VALUES ('509', '90a2e0269b6c878', '1.0', '2017-10-30 17:29:34');
INSERT INTO `ccard_apk_log` VALUES ('510', '90a2e0269b6c878', '1.0', '2017-10-31 08:44:09');
INSERT INTO `ccard_apk_log` VALUES ('511', '90a2e0269b6c878', '1.0', '2017-10-31 10:21:52');
INSERT INTO `ccard_apk_log` VALUES ('512', '90a2e0269b6c878', '1.0', '2017-11-01 14:21:39');
INSERT INTO `ccard_apk_log` VALUES ('513', '90a2e0269b6c878', '1.0', '2017-11-02 16:13:34');
INSERT INTO `ccard_apk_log` VALUES ('514', '90a2e0269b6c878', '1.0', '2017-12-11 08:03:01');
INSERT INTO `ccard_apk_log` VALUES ('515', '3a1e5e6e1b3635ab', '1.0', '2017-12-25 20:39:08');
INSERT INTO `ccard_apk_log` VALUES ('516', '3a1e5e6e1b3635ab', '1.0', '2017-12-27 16:08:47');
INSERT INTO `ccard_apk_log` VALUES ('517', 'bd1e2ff2f7d039a6', '1.0', '2018-01-20 16:26:41');
INSERT INTO `ccard_apk_log` VALUES ('518', 'bd1e2ff2f7d039a6', '1.0', '2018-01-20 16:31:12');
INSERT INTO `ccard_apk_log` VALUES ('519', 'bd1e2ff2f7d039a6', '1.0', '2018-01-20 16:31:25');
INSERT INTO `ccard_apk_log` VALUES ('520', 'bd1e2ff2f7d039a6', '1.0', '2018-01-20 16:34:33');
INSERT INTO `ccard_apk_log` VALUES ('521', 'bd1e2ff2f7d039a6', '1.0', '2018-01-20 16:39:37');
INSERT INTO `ccard_apk_log` VALUES ('522', 'bd1e2ff2f7d039a6', '1.0', '2018-01-20 16:43:40');
INSERT INTO `ccard_apk_log` VALUES ('523', 'bd1e2ff2f7d039a6', '1.0', '2018-01-20 16:54:37');
INSERT INTO `ccard_apk_log` VALUES ('524', 'bd1e2ff2f7d039a6', '1.0', '2018-01-20 17:01:07');
INSERT INTO `ccard_apk_log` VALUES ('525', 'bd1e2ff2f7d039a6', '1.0', '2018-01-20 17:03:20');
INSERT INTO `ccard_apk_log` VALUES ('526', 'bd1e2ff2f7d039a6', '1.0', '2018-01-22 08:23:31');
INSERT INTO `ccard_apk_log` VALUES ('527', '90a2e0269b6c878', '1.0', '2018-01-22 08:29:23');
INSERT INTO `ccard_apk_log` VALUES ('528', '90a2e0269b6c878', '1.0', '2018-01-22 14:59:29');
INSERT INTO `ccard_apk_log` VALUES ('529', '90a2e0269b6c878', '1.0', '2018-01-22 15:08:17');
INSERT INTO `ccard_apk_log` VALUES ('530', '90a2e0269b6c878', '1.0', '2018-01-22 15:09:53');
INSERT INTO `ccard_apk_log` VALUES ('531', '90a2e0269b6c878', '1.0', '2018-01-22 15:10:05');
INSERT INTO `ccard_apk_log` VALUES ('532', '90a2e0269b6c878', '1.0', '2018-01-22 15:10:13');
INSERT INTO `ccard_apk_log` VALUES ('533', '90a2e0269b6c878', '1.0', '2018-01-22 15:39:28');
INSERT INTO `ccard_apk_log` VALUES ('534', '90a2e0269b6c878', '1.0', '2018-01-23 10:29:18');
INSERT INTO `ccard_apk_log` VALUES ('535', '90a2e0269b6c878', '1.0', '2018-01-23 10:31:32');
INSERT INTO `ccard_apk_log` VALUES ('536', '90a2e0269b6c878', '1.0', '2018-01-23 10:35:27');
INSERT INTO `ccard_apk_log` VALUES ('537', '90a2e0269b6c878', '1.0', '2018-01-23 10:38:33');
INSERT INTO `ccard_apk_log` VALUES ('538', '90a2e0269b6c878', '1.0', '2018-01-23 10:40:26');
INSERT INTO `ccard_apk_log` VALUES ('539', '90a2e0269b6c878', '1.0', '2018-01-23 13:49:18');
INSERT INTO `ccard_apk_log` VALUES ('540', '90a2e0269b6c878', '1.0', '2018-01-23 14:18:06');
INSERT INTO `ccard_apk_log` VALUES ('541', '90a2e0269b6c878', '1.0', '2018-01-23 15:11:28');
INSERT INTO `ccard_apk_log` VALUES ('542', '90a2e0269b6c878', '1.0', '2018-01-23 15:17:20');
INSERT INTO `ccard_apk_log` VALUES ('543', '90a2e0269b6c878', '1.0', '2018-01-23 15:29:47');
INSERT INTO `ccard_apk_log` VALUES ('544', '90a2e0269b6c878', '1.0', '2018-01-23 15:32:05');
INSERT INTO `ccard_apk_log` VALUES ('545', '90a2e0269b6c878', '1.0', '2018-01-23 15:36:39');
INSERT INTO `ccard_apk_log` VALUES ('546', '90a2e0269b6c878', '1.0', '2018-01-23 15:38:26');
INSERT INTO `ccard_apk_log` VALUES ('547', '90a2e0269b6c878', '1.0', '2018-01-23 15:58:11');
INSERT INTO `ccard_apk_log` VALUES ('548', '90a2e0269b6c878', '1.0', '2018-01-23 16:01:09');
INSERT INTO `ccard_apk_log` VALUES ('549', '90a2e0269b6c878', '1.0', '2018-01-23 16:15:09');
INSERT INTO `ccard_apk_log` VALUES ('550', '90a2e0269b6c878', '1.0', '2018-01-23 16:16:43');
INSERT INTO `ccard_apk_log` VALUES ('551', '90a2e0269b6c878', '1.0', '2018-01-23 16:17:23');
INSERT INTO `ccard_apk_log` VALUES ('552', '90a2e0269b6c878', '1.0', '2018-01-25 16:03:15');
INSERT INTO `ccard_apk_log` VALUES ('553', '90a2e0269b6c878', '1.0', '2018-01-25 17:26:15');
INSERT INTO `ccard_apk_log` VALUES ('554', '90a2e0269b6c878', '1.0', '2018-01-26 08:38:50');
INSERT INTO `ccard_apk_log` VALUES ('555', '90a2e0269b6c878', '1.0', '2018-01-26 08:41:22');
INSERT INTO `ccard_apk_log` VALUES ('556', '90a2e0269b6c878', '1.0', '2018-01-26 08:58:30');
INSERT INTO `ccard_apk_log` VALUES ('557', '90a2e0269b6c878', '1.0', '2018-01-26 09:04:57');
INSERT INTO `ccard_apk_log` VALUES ('558', '90a2e0269b6c878', '1.0', '2018-01-26 09:13:23');
INSERT INTO `ccard_apk_log` VALUES ('559', '90a2e0269b6c878', '1.0', '2018-01-26 09:17:49');
INSERT INTO `ccard_apk_log` VALUES ('560', '90a2e0269b6c878', '1.0', '2018-01-26 16:27:01');

-- ----------------------------
-- Table structure for ccard_app
-- ----------------------------
DROP TABLE IF EXISTS `ccard_app`;
CREATE TABLE `ccard_app` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `appkey` varchar(100) NOT NULL,
  `skey` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ccard_app
-- ----------------------------
INSERT INTO `ccard_app` VALUES ('1', 'nuts', 'wtf');

-- ----------------------------
-- Table structure for ccard_client
-- ----------------------------
DROP TABLE IF EXISTS `ccard_client`;
CREATE TABLE `ccard_client` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pnum` varchar(50) NOT NULL,
  `pname` varchar(50) NOT NULL,
  `department` varchar(255) NOT NULL,
  `gid` varchar(50) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `note` varchar(255) NOT NULL,
  `update_time` datetime NOT NULL,
  `create_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ccard_client
-- ----------------------------
INSERT INTO `ccard_client` VALUES ('14', '4555', '曹峰嘉', '(天津)EPD(V)關務物流部', '6c:63:44:72', '1', '', '2017-08-03 16:18:40', '2017-08-03 16:18:40');
INSERT INTO `ccard_client` VALUES ('15', '8357', '李順德', '經營管理', 'a2:b1:75:68', '1', '', '2017-08-03 16:18:49', '2017-08-03 16:18:49');
INSERT INTO `ccard_client` VALUES ('16', '9351', '王嘉慶', 'EPD(V)量產制造三處', 'f2:7b:79:68', '1', '', '2017-08-03 16:18:49', '2017-08-04 16:33:23');
INSERT INTO `ccard_client` VALUES ('17', '8704', '簡志傑', 'L(V)組裝廠', '1c:0e:2b:88', '1', '', '2017-09-14 10:56:09', '2017-09-14 10:56:09');
INSERT INTO `ccard_client` VALUES ('18', '9285', '陳志名', 'L(V)產品工程', 'c0:47:5a:18', '1', '', '2017-10-17 08:25:42', '2017-10-17 08:25:42');

-- ----------------------------
-- Table structure for ccard_device
-- ----------------------------
DROP TABLE IF EXISTS `ccard_device`;
CREATE TABLE `ccard_device` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `no` varchar(50) NOT NULL,
  `title` varchar(50) NOT NULL,
  `ip` varchar(255) NOT NULL,
  `devid` varchar(50) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `address` varchar(255) NOT NULL,
  `note` varchar(255) NOT NULL,
  `add_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ccard_device
-- ----------------------------
INSERT INTO `ccard_device` VALUES ('14', '001', 'MobilePhone001', '', '5e4721d7b0f6d432', '0', 'A22餐厅', '', '2017-08-03 16:18:40');
INSERT INTO `ccard_device` VALUES ('15', '002', 'BigTab001', '', '951bae5fb2dde2a0', '0', 'A21-3F', '', '2017-08-03 16:18:49');
INSERT INTO `ccard_device` VALUES ('16', '003', '小紫', '', '5c41faac5b6e9eca', '0', '', '', '2017-08-04 16:33:23');
INSERT INTO `ccard_device` VALUES ('17', '004', 'BigTab002', '', '90a2e0269b6c878', '0', '测试', '', '2017-09-14 10:56:09');
INSERT INTO `ccard_device` VALUES ('18', '005', 'BigTab003', '', 'bd1e2ff2f7d039a6', '0', '', '0', '2017-10-17 08:25:42');

-- ----------------------------
-- Table structure for ccard_food
-- ----------------------------
DROP TABLE IF EXISTS `ccard_food`;
CREATE TABLE `ccard_food` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `price` float(50,1) NOT NULL,
  `thumb` text NOT NULL,
  `status` tinyint(1) NOT NULL COMMENT '0:下架 1:正常 2:删除',
  `update_time` datetime NOT NULL,
  `add_time` datetime NOT NULL,
  `type_id` varchar(50) NOT NULL,
  `gp_id` int(11) NOT NULL,
  `note` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ccard_food
-- ----------------------------
INSERT INTO `ccard_food` VALUES ('1', '牛肉堡', '6.0', '/Uploads/images/thumb/1506329314.jpg', '1', '2017-09-25 16:49:45', '2017-09-25 16:49:45', '6', '3', '');
INSERT INTO `ccard_food` VALUES ('2', '黄金春卷（8个）', '5.0', '/Uploads/images/thumb/1506329579.jpg', '1', '2017-09-25 16:53:49', '2017-09-25 16:53:49', '6', '3', '');
INSERT INTO `ccard_food` VALUES ('3', '芙蓉蟹棒（2根）', '5.0', '/Uploads/images/thumb/1506330333.jpg', '1', '2017-09-25 17:05:39', '2017-09-25 17:05:39', '6', '3', '');
INSERT INTO `ccard_food` VALUES ('4', '薯条', '4.0', '/Uploads/images/thumb/1506330372.jpg', '1', '2017-09-25 17:06:20', '2017-09-25 17:06:20', '6', '3', '');
INSERT INTO `ccard_food` VALUES ('5', '鸡腿堡', '5.0', '/Uploads/images/thumb/1506330452.jpg', '1', '2017-09-25 17:07:35', '2017-09-25 17:07:35', '6', '3', '');
INSERT INTO `ccard_food` VALUES ('6', '鸡腿', '4.0', '/Uploads/images/thumb/1506330487.jpg', '1', '2017-09-25 17:08:12', '2017-09-25 17:08:12', '6', '3', '');
INSERT INTO `ccard_food` VALUES ('7', '香芋地瓜丸（6个）', '4.5', '/Uploads/images/thumb/1506330546.jpg', '1', '2017-09-26 16:05:41', '2017-09-25 17:09:09', '6', '3', '');
INSERT INTO `ccard_food` VALUES ('8', '月饼', '11.0', '/Uploads/images/thumb/1506410361.jpg', '2', '2017-09-26 15:19:21', '2017-09-26 15:19:21', '5', '3', '');
INSERT INTO `ccard_food` VALUES ('9', '汉堡王', '21.0', '/Uploads/images/thumb/1506410596.jpg', '2', '2017-09-26 16:05:41', '2017-09-26 15:23:16', '6', '3', '');
INSERT INTO `ccard_food` VALUES ('10', '王老吉', '4.0', '/Uploads/images/thumb/1506410659.jpg', '2', '2017-10-11 14:51:59', '2017-09-26 15:24:19', '6', '3', '');
INSERT INTO `ccard_food` VALUES ('11', '中秋月饼', '6.0', '/Uploads/images/thumb/1506410745.jpg', '0', '2017-09-26 16:02:20', '2017-09-26 15:25:45', '6', '3', '');
INSERT INTO `ccard_food` VALUES ('12', 'aa', '6.0', '/Uploads/images/thumb/1506410826.jpg', '2', '2017-09-26 16:02:08', '2017-09-26 15:27:06', '6', '3', '');
INSERT INTO `ccard_food` VALUES ('13', '还', '9.0', '/Uploads/images/thumb/1506410878.jpg', '2', '2017-09-26 16:01:57', '2017-09-26 15:27:58', '6', '3', '');
INSERT INTO `ccard_food` VALUES ('14', '哈啊', '9.0', '/Uploads/images/thumb/1506412142.jpg', '2', '2017-09-26 16:01:49', '2017-09-26 15:49:02', '6', '3', '');
INSERT INTO `ccard_food` VALUES ('15', '啊啊啊', '3.5', '/Uploads/images/thumb/1506412217.jpg', '2', '2017-10-12 14:16:53', '2017-09-26 15:50:17', '6', '3', '');
INSERT INTO `ccard_food` VALUES ('16', '香芋地瓜丸（8个）', '6.0', '/Uploads/images/thumb/1507797700.jpg', '1', '2017-10-12 16:41:44', '2017-10-12 15:56:37', '6', '3', '');
INSERT INTO `ccard_food` VALUES ('17', 'hanbaobaobaobao', '10.0', '/Uploads/images/thumb/1516439269.jpg', '2', '2018-01-20 17:07:51', '2018-01-20 17:07:51', '6', '3', '');
INSERT INTO `ccard_food` VALUES ('18', 'Taft', '3.0', '/Uploads/images/thumb/1516581131.jpg', '2', '2018-01-22 08:32:11', '2018-01-22 08:32:11', '5', '3', '');
INSERT INTO `ccard_food` VALUES ('19', '菜品1111', '11.0', '/Uploads/images/thumb/1516603866.png', '2', '2018-01-22 14:51:19', '2018-01-22 14:51:19', '2', '3', '');
INSERT INTO `ccard_food` VALUES ('20', 'TestFood', '6.0', '/Uploads/images/thumb/1516604327.png', '2', '2018-01-22 14:58:53', '2018-01-22 14:58:53', '6', '3', '');
INSERT INTO `ccard_food` VALUES ('21', '测试汉堡', '6.5', '/Uploads/images/thumb/1516667760.JPG', '1', '2018-01-23 08:36:10', '2018-01-23 08:36:10', '6', '3', '');
INSERT INTO `ccard_food` VALUES ('22', 'ceshi 1', '7.0', '/Uploads/images/thumb/1516668468.jpg', '1', '2018-01-23 08:47:48', '2018-01-23 08:47:48', '4', '3', '');

-- ----------------------------
-- Table structure for ccard_food_copy
-- ----------------------------
DROP TABLE IF EXISTS `ccard_food_copy`;
CREATE TABLE `ccard_food_copy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `price` float(50,1) NOT NULL,
  `thumb` text NOT NULL,
  `status` tinyint(1) NOT NULL,
  `update_time` datetime NOT NULL,
  `add_time` datetime NOT NULL,
  `type_id` varchar(50) NOT NULL,
  `gp_id` int(11) NOT NULL,
  `note` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=109 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ccard_food_copy
-- ----------------------------
INSERT INTO `ccard_food_copy` VALUES ('1', '西红柿鸡蛋', '5.0', '/Uploads/images/thumb/xihongshi.jpg', '1', '2017-08-05 14:59:44', '2017-08-01 08:32:25', '3', '2', '');
INSERT INTO `ccard_food_copy` VALUES ('2', '宫爆鸡丁', '6.0', '/Uploads/images/thumb/gongbaojiding.jpg', '1', '2017-08-10 09:14:32', '2017-08-02 08:32:30', '2', '2', '');
INSERT INTO `ccard_food_copy` VALUES ('6', '豆沙包', '1.0', '/Uploads/images/thumb/1502349149.jpg', '1', '2017-08-11 09:14:32', '2017-08-03 08:32:35', '1', '2', '');
INSERT INTO `ccard_food_copy` VALUES ('7', '油条', '1.0', '/Uploads/images/thumb/1502412307.jpg', '1', '2017-08-11 08:45:13', '2017-08-11 08:45:13', '1', '2', '');
INSERT INTO `ccard_food_copy` VALUES ('8', '包子', '1.0', '/Uploads/images/thumb/1502413819.jpg', '1', '2017-08-11 09:34:29', '2017-08-11 09:10:26', '1', '3', '');
INSERT INTO `ccard_food_copy` VALUES ('9', '烧饼', '1.0', '/Uploads/images/thumb/1502781193.jpg', '1', '2017-08-15 15:13:48', '2017-08-12 10:53:27', '1', '3', '');
INSERT INTO `ccard_food_copy` VALUES ('10', '豆腐脑', '1.0', '/Uploads/images/thumb/1502845720.jpg', '1', '2017-08-16 09:27:17', '2017-08-15 15:12:51', '1', '3', '');
INSERT INTO `ccard_food_copy` VALUES ('11', '麻团', '1.0', '/Uploads/images/thumb/1502850964.jpg', '1', '2017-08-16 10:36:12', '2017-08-16 10:36:12', '1', '2', '');
INSERT INTO `ccard_food_copy` VALUES ('12', '凉拌黄瓜', '2.0', '/Uploads/images/thumb/1502853757.jpg', '1', '2017-08-16 13:57:59', '2017-08-16 11:22:39', '4', '2', '');
INSERT INTO `ccard_food_copy` VALUES ('27', '麻花', '1.0', '/Uploads/images/thumb/1504142646.jpg', '1', '2017-08-31 09:24:09', '2017-08-24 09:47:11', '1', '2', '');
INSERT INTO `ccard_food_copy` VALUES ('102', '牛肉', '2.0', '/Uploads/images/thumb/1504747246.jpg', '2', '2017-09-07 09:20:46', '2017-09-07 09:20:46', '4', '3', '');
INSERT INTO `ccard_food_copy` VALUES ('25', '地三鲜', '5.0', '/Uploads/images/thumb/1504142539.jpg', '1', '2017-08-31 09:22:24', '2017-08-24 09:05:11', '4', '3', '');
INSERT INTO `ccard_food_copy` VALUES ('28', '地三鲜', '5.0', '/Uploads/images/thumb/1504142539.jpg', '1', '2017-08-24 09:47:41', '2017-08-24 09:47:41', '4', '2', '');
INSERT INTO `ccard_food_copy` VALUES ('103', '→_→', '1.0', '/Uploads/images/thumb/1504747357.jpg', '2', '2017-09-07 09:24:47', '2017-09-07 09:22:37', '4', '3', '');
INSERT INTO `ccard_food_copy` VALUES ('105', '&amp;&amp;%', '1.0', '/Uploads/images/thumb/1504747898.jpg', '2', '2017-09-07 09:31:38', '2017-09-07 09:31:38', '4', '3', '');
INSERT INTO `ccard_food_copy` VALUES ('104', '^ω^', '1.0', '/Uploads/images/thumb/1504747698.jpg', '2', '2017-09-07 09:28:18', '2017-09-07 09:28:18', '4', '3', '');
INSERT INTO `ccard_food_copy` VALUES ('83', '黄焖牛肉', '5.0', '/Uploads/images/thumb/1504165204.jpg', '1', '2017-09-06 09:44:17', '2017-08-31 15:40:07', '4', '3', '');
INSERT INTO `ccard_food_copy` VALUES ('84', '苹果', '1.0', '/Uploads/images/thumb/1504165271.jpg', '1', '2017-08-31 15:41:16', '2017-08-31 15:41:16', '3', '3', '');
INSERT INTO `ccard_food_copy` VALUES ('85', '烧饼夹火腿', '3.0', '/Uploads/images/thumb/1504165356.jpg', '1', '2017-08-31 15:42:39', '2017-08-31 15:42:39', '1', '3', '');
INSERT INTO `ccard_food_copy` VALUES ('86', '炒豆角', '4.0', '/Uploads/images/thumb/1504165548.jpg', '1', '2017-08-31 15:45:51', '2017-08-31 15:45:51', '4', '3', '');
INSERT INTO `ccard_food_copy` VALUES ('87', '蒜苔炒肉', '4.0', '/Uploads/images/thumb/1504165654.jpg', '1', '2017-09-01 10:12:49', '2017-08-31 15:47:37', '4', '3', '');
INSERT INTO `ccard_food_copy` VALUES ('88', '鸡蛋炒番茄', '6.0', '/Uploads/images/thumb/1504603407.jpg', '2', '2017-09-05 17:25:43', '2017-09-05 17:23:55', '4', '3', '');
INSERT INTO `ccard_food_copy` VALUES ('89', '炸酥肉', '6.0', '/Uploads/images/thumb/1504603894.jpg', '1', '2017-09-06 11:35:29', '2017-09-05 17:31:34', '4', '3', '');
INSERT INTO `ccard_food_copy` VALUES ('90', '春卷', '1.0', '/Uploads/images/thumb/1504659007.jpg', '1', '2017-09-06 11:36:27', '2017-09-06 08:50:07', '1', '3', '');
INSERT INTO `ccard_food_copy` VALUES ('45', '熊猫肉', '10.0', '/Uploads/images/thumb/1503645433.jpg', '1', '2017-08-25 15:17:13', '2017-08-25 15:17:13', '5', '3', '');
INSERT INTO `ccard_food_copy` VALUES ('46', '猪蹄', '5.0', '/Uploads/images/thumb/1503646933.jpg', '1', '2017-08-25 15:42:13', '2017-08-25 15:42:13', '5', '3', '');
INSERT INTO `ccard_food_copy` VALUES ('106', '大头', '1.0', '/Uploads/images/thumb/1504748204.jpg', '1', '2017-09-07 09:36:44', '2017-09-07 09:36:44', '4', '3', '');
INSERT INTO `ccard_food_copy` VALUES ('107', '青菜', '2.0', '/Uploads/images/thumb/1505446141.jpg', '1', '2017-09-15 11:29:00', '2017-09-15 11:29:00', '3', '3', '');
INSERT INTO `ccard_food_copy` VALUES ('108', '绿萝', '5.0', '/Uploads/images/thumb/1506040798.jpg', '1', '2017-09-22 08:39:58', '2017-09-22 08:39:58', '3', '3', '');
INSERT INTO `ccard_food_copy` VALUES ('53', '烤鸭', '15.0', '/Uploads/images/thumb/1503883615.jpg', '1', '2017-08-31 10:40:56', '2017-08-28 09:26:55', '5', '3', '');
INSERT INTO `ccard_food_copy` VALUES ('54', '烧三丝', '4.0', '/Uploads/images/thumb/1503883755.jpg', '1', '2017-08-31 15:09:12', '2017-08-28 09:29:15', '4', '3', '');
INSERT INTO `ccard_food_copy` VALUES ('55', '煎饺', '2.0', '/Uploads/images/thumb/1503885505.jpg', '1', '2017-08-31 10:14:40', '2017-08-28 09:40:05', '1', '3', '');
INSERT INTO `ccard_food_copy` VALUES ('56', '鱼香茄子', '3.0', '/Uploads/images/thumb/1503884869.jpg', '1', '2017-08-31 10:16:09', '2017-08-28 09:47:49', '5', '3', '');
INSERT INTO `ccard_food_copy` VALUES ('57', '炖排骨', '10.0', '/Uploads/images/thumb/1503885258.jpg', '1', '2017-08-31 10:17:30', '2017-08-28 09:54:18', '3', '3', '');
INSERT INTO `ccard_food_copy` VALUES ('58', '煎饺', '4.0', '/Uploads/images/thumb/1503885505.jpg', '1', '2017-09-06 09:44:02', '2017-08-28 09:58:25', '4', '3', '');
INSERT INTO `ccard_food_copy` VALUES ('59', '蒸鲈鱼', '15.0', '/Uploads/images/thumb/1503885580.jpg', '1', '2017-08-31 15:43:46', '2017-08-28 09:59:40', '4', '3', '');
INSERT INTO `ccard_food_copy` VALUES ('82', '麻婆豆腐', '4.0', '/Uploads/images/thumb/1504165108.jpg', '1', '2017-09-06 09:44:26', '2017-08-31 15:38:32', '4', '3', '');
INSERT INTO `ccard_food_copy` VALUES ('81', '凉菜', '1.0', '/Uploads/images/thumb/1504165015.jpg', '1', '2017-08-31 15:36:59', '2017-08-31 15:36:59', '4', '3', '');
INSERT INTO `ccard_food_copy` VALUES ('62', '梨', '2.0', '/Uploads/images/thumb/1503993816.jpg', '1', '2017-08-31 09:26:34', '2017-08-29 16:03:36', '5', '3', '');
INSERT INTO `ccard_food_copy` VALUES ('91', '糖醋里脊', '4.0', '/Uploads/images/thumb/1504662402.jpg', '1', '2017-09-06 09:46:45', '2017-09-06 09:46:45', '4', '3', '');
INSERT INTO `ccard_food_copy` VALUES ('92', '什锦小炒', '4.0', '/Uploads/images/thumb/1504662445.jpg', '1', '2017-09-06 09:47:28', '2017-09-06 09:47:28', '4', '3', '');
INSERT INTO `ccard_food_copy` VALUES ('93', '糖酥鲤鱼', '4.0', '/Uploads/images/thumb/1504663012.jpg', '1', '2017-09-06 09:56:58', '2017-09-06 09:56:58', '3', '3', '');
INSERT INTO `ccard_food_copy` VALUES ('94', '香甜玉米粒', '4.0', '/Uploads/images/thumb/1504663648.jpg', '1', '2017-09-06 10:07:33', '2017-09-06 10:07:33', '3', '3', '');
INSERT INTO `ccard_food_copy` VALUES ('95', '番茄炒蛋', '2.0', '/Uploads/images/thumb/1504668296.jpg', '2', '2017-09-06 11:24:56', '2017-09-06 11:24:56', '4', '3', '');
INSERT INTO `ccard_food_copy` VALUES ('97', '番茄炒蛋', '6.0', '/Uploads/images/thumb/1504678467.jpg', '1', '2017-09-06 14:14:27', '2017-09-06 14:14:27', '4', '3', '');
INSERT INTO `ccard_food_copy` VALUES ('98', '西红柿', '6.0', '/Uploads/images/thumb/1504678629.jpg', '1', '2017-09-06 14:17:13', '2017-09-06 14:17:13', '4', '3', '');
INSERT INTO `ccard_food_copy` VALUES ('99', '\'\'\'', '6.0', '/Uploads/images/thumb/1504685329.jpg', '2', '2017-09-06 16:08:49', '2017-09-06 16:08:49', '5', '3', '');
INSERT INTO `ccard_food_copy` VALUES ('100', '地瓜粥', '2.0', '/Uploads/images/thumb/1504746751.jpg', '2', '2017-09-07 09:12:31', '2017-09-07 09:12:31', '4', '3', '');
INSERT INTO `ccard_food_copy` VALUES ('101', '同子肉', '2.0', '/Uploads/images/thumb/1504747030.jpg', '2', '2017-09-07 09:17:10', '2017-09-07 09:17:10', '4', '3', '');
INSERT INTO `ccard_food_copy` VALUES ('77', '红烧茄子', '3.0', '/Uploads/images/thumb/1504143134.jpg', '1', '2017-08-31 09:32:20', '2017-08-30 15:59:35', '4', '3', '');
INSERT INTO `ccard_food_copy` VALUES ('78', '魔法士干脆面', '1.0', '/Uploads/images/thumb/1504139743.jpg', '1', '2017-08-31 09:26:52', '2017-08-31 08:35:43', '1', '3', '');
INSERT INTO `ccard_food_copy` VALUES ('79', '汉堡包', '2.0', '/Uploads/images/thumb/1504139816.jpg', '2', '2017-08-31 08:36:56', '2017-08-31 08:36:56', '1', '3', '');
INSERT INTO `ccard_food_copy` VALUES ('80', '香菇', '3.0', '/Uploads/images/thumb/1504139956.jpg', '0', '2017-08-31 08:44:28', '2017-08-31 08:39:16', '5', '2', '');

-- ----------------------------
-- Table structure for ccard_food_log
-- ----------------------------
DROP TABLE IF EXISTS `ccard_food_log`;
CREATE TABLE `ccard_food_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `content` text NOT NULL,
  `operate` varchar(50) NOT NULL,
  `add_time` datetime NOT NULL,
  `source` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=320 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ccard_food_log
-- ----------------------------
INSERT INTO `ccard_food_log` VALUES ('97', 'admin', '{\"id\":\"9\",\"title\":\"\\u8c46\\u8150\\u8111\",\"price\":\"1\",\"thumb\":\"\",\"status\":\"1\",\"food_time\":\"\",\"update_time\":\"2017-08-12 14:10:20\",\"add_time\":\"2017-08-12 10:53:27\",\"type_id\":\"1\",\"gp_id\":\"1\"}', '编辑', '2017-08-12 14:11:17', null);
INSERT INTO `ccard_food_log` VALUES ('98', 'admin', '{\"title\":\"\\u8c46\\u8150\\u8111\",\"type_id\":\"1\",\"price\":\"1\",\"thumb\":\"\",\"status\":\"1\",\"note\":\"\",\"gp_id\":\"admin\",\"update_time\":\"2017-08-15 15:12:51\",\"add_time\":\"2017-08-15 15:12:51\"}', '新增', '2017-08-15 15:12:51', null);
INSERT INTO `ccard_food_log` VALUES ('99', 'admin', '{\"id\":\"9\",\"title\":\"\\u8c46\\u8150\\u8111\",\"price\":\"1\",\"thumb\":\"\",\"status\":\"1\",\"food_time\":\"\",\"update_time\":\"2017-08-12 14:11:17\",\"add_time\":\"2017-08-12 10:53:27\",\"type_id\":\"1\",\"gp_id\":\"1\"}', '编辑', '2017-08-15 15:13:29', null);
INSERT INTO `ccard_food_log` VALUES ('100', 'admin', '{\"id\":\"9\",\"title\":\"\\u70e7\\u997c\",\"price\":\"1\",\"thumb\":\"/Uploads/images/thumb/1502781193.jpg\",\"status\":\"1\",\"food_time\":\"\",\"update_time\":\"2017-08-15 15:13:28\",\"add_time\":\"2017-08-12 10:53:27\",\"type_id\":\"1\",\"gp_id\":\"1\"}', '编辑', '2017-08-15 15:13:48', null);
INSERT INTO `ccard_food_log` VALUES ('101', 'admin', '{\"id\":\"10\",\"title\":\"\\u8c46\\u8150\\u8111\",\"price\":\"1\",\"thumb\":\"\",\"status\":\"1\",\"food_time\":\"\",\"update_time\":\"2017-08-15 15:12:51\",\"add_time\":\"2017-08-15 15:12:51\",\"type_id\":\"1\",\"gp_id\":\"1\"}', '删除', '2017-08-15 15:40:00', null);
INSERT INTO `ccard_food_log` VALUES ('102', 'admin', '{\"id\":\"10\",\"title\":\"\\u8c46\\u8150\\u8111\",\"price\":\"1\",\"thumb\":\"\",\"status\":\"2\",\"food_time\":\"\",\"update_time\":\"2017-08-15 15:12:51\",\"add_time\":\"2017-08-15 15:12:51\",\"type_id\":\"1\",\"gp_id\":\"1\"}', '编辑', '2017-08-16 09:08:48', null);
INSERT INTO `ccard_food_log` VALUES ('103', 'admin', '{\"id\":\"10\",\"title\":\"\\u8c46\\u8150\\u8111\",\"price\":\"1\",\"thumb\":\"/Uploads/images/thumb/1502845720.jpg\",\"status\":\"1\",\"food_time\":\"\",\"update_time\":\"2017-08-16 09:08:48\",\"add_time\":\"2017-08-15 15:12:51\",\"type_id\":\"1\",\"gp_id\":\"1\"}', '编辑', '2017-08-16 09:26:54', null);
INSERT INTO `ccard_food_log` VALUES ('104', 'admin', '{\"id\":\"10\",\"title\":\"\\u8c46\\u8150\\u8111\",\"price\":\"1\",\"thumb\":\"/Uploads/images/thumb/1502845720.jpg\",\"status\":\"1\",\"food_time\":\"\",\"update_time\":\"2017-08-16 09:26:54\",\"add_time\":\"2017-08-15 15:12:51\",\"type_id\":\"1\",\"gp_id\":\"1\"}', '编辑', '2017-08-16 09:27:09', null);
INSERT INTO `ccard_food_log` VALUES ('105', 'admin', '{\"id\":\"10\",\"title\":\"\\u8c46\\u8150\\u8111\",\"price\":\"2\",\"thumb\":\"/Uploads/images/thumb/1502845720.jpg\",\"status\":\"1\",\"food_time\":\"\",\"update_time\":\"2017-08-16 09:27:09\",\"add_time\":\"2017-08-15 15:12:51\",\"type_id\":\"1\",\"gp_id\":\"1\"}', '编辑', '2017-08-16 09:27:17', null);
INSERT INTO `ccard_food_log` VALUES ('106', 'admin', '{\"title\":\"\\u9ebb\\u56e2\",\"type_id\":\"1\",\"price\":\"1\",\"thumb\":\"/Uploads/images/thumb/1502850964.jpg\",\"status\":\"1\",\"note\":\"\\u9ebb\\u56e2\",\"gp_id\":\"2\",\"update_time\":\"2017-08-16 10:36:12\",\"add_time\":\"2017-08-16 10:36:12\"}', '新增', '2017-08-16 10:36:12', null);
INSERT INTO `ccard_food_log` VALUES ('108', 'admin', '{\"id\":\"12\",\"title\":\"\\u51c9\\u62cc\\u9ec4\\u74dc\",\"price\":\"3.0\",\"thumb\":\"/Uploads/images/thumb/1502853757.jpg\",\"status\":\"1\",\"update_time\":\"2017-08-16 11:22:39\",\"add_time\":\"2017-08-16 11:22:39\",\"type_id\":\"4\",\"gp_id\":\"2\"}', '编辑', '2017-08-16 11:23:42', null);
INSERT INTO `ccard_food_log` VALUES ('109', 'admin', '{\"id\":\"12\",\"title\":\"\\u51c9\\u62cc\\u9ec4\\u74dc\",\"price\":\"3.0\",\"thumb\":\"/Uploads/images/thumb/1502853757.jpg\",\"status\":\"1\",\"update_time\":\"2017-08-16 11:23:42\",\"add_time\":\"2017-08-16 11:22:39\",\"type_id\":\"4\",\"gp_id\":\"3\"}', '编辑', '2017-08-16 11:33:51', null);
INSERT INTO `ccard_food_log` VALUES ('110', 'admin', '{\"id\":\"12\",\"title\":\"\\u51c9\\u62cc\\u9ec4\\u74dc\",\"price\":\"3.0\",\"thumb\":\"/Uploads/images/thumb/1502853757.jpg\",\"status\":\"1\",\"update_time\":\"2017-08-16 11:33:51\",\"add_time\":\"2017-08-16 11:22:39\",\"type_id\":\"4\",\"gp_id\":\"3\"}', '编辑', '2017-08-16 11:34:05', null);
INSERT INTO `ccard_food_log` VALUES ('111', 'admin', '{\"id\":\"12\",\"title\":\"\\u51c9\\u62cc\\u9ec4\\u74dc\",\"price\":\"3.0\",\"thumb\":\"/Uploads/images/thumb/1502853757.jpg\",\"status\":\"1\",\"update_time\":\"2017-08-16 11:34:05\",\"add_time\":\"2017-08-16 11:22:39\",\"type_id\":\"4\",\"gp_id\":\"3\"}', '编辑', '2017-08-16 11:42:05', null);
INSERT INTO `ccard_food_log` VALUES ('112', 'admin', '{\"id\":\"12\",\"title\":\"\\u51c9\\u62cc\\u9ec4\\u74dc\",\"price\":\"3.0\",\"thumb\":\"/Uploads/images/thumb/1502853757.jpg\",\"status\":\"1\",\"update_time\":\"2017-08-16 11:42:05\",\"add_time\":\"2017-08-16 11:22:39\",\"type_id\":\"4\",\"gp_id\":\"3\"}', '编辑', '2017-08-16 11:43:38', null);
INSERT INTO `ccard_food_log` VALUES ('113', 'admin', '{\"id\":\"12\",\"title\":\"\\u51c9\\u62cc\\u9ec4\\u74dc\",\"price\":\"3.0\",\"thumb\":\"/Uploads/images/thumb/1502853757.jpg\",\"status\":\"1\",\"update_time\":\"2017-08-16 11:43:38\",\"add_time\":\"2017-08-16 11:22:39\",\"type_id\":\"4\",\"gp_id\":\"3\"}', '编辑', '2017-08-16 11:43:46', null);
INSERT INTO `ccard_food_log` VALUES ('114', 'admin', '{\"id\":\"12\",\"title\":\"\\u51c9\\u62cc\\u9ec4\\u74dc\",\"price\":\"3.0\",\"thumb\":\"/Uploads/images/thumb/1502853757.jpg\",\"status\":\"0\",\"update_time\":\"2017-08-16 11:43:46\",\"add_time\":\"2017-08-16 11:22:39\",\"type_id\":\"4\",\"gp_id\":\"2\"}', '编辑', '2017-08-16 11:43:56', null);
INSERT INTO `ccard_food_log` VALUES ('115', 'admin', '{\"id\":\"12\",\"title\":\"\\u51c9\\u62cc\\u9ec4\\u74dc\",\"price\":\"2.0\",\"thumb\":\"/Uploads/images/thumb/1502853757.jpg\",\"status\":\"0\",\"update_time\":\"2017-08-16 11:43:56\",\"add_time\":\"2017-08-16 11:22:39\",\"type_id\":\"2\",\"gp_id\":\"2\"}', '编辑', '2017-08-16 11:44:09', null);
INSERT INTO `ccard_food_log` VALUES ('116', 'admin', '{\"id\":\"12\",\"title\":\"\\u51c9\\u62cc\\u9ec4\\u74dc\",\"price\":\"2.0\",\"thumb\":\"/Uploads/images/thumb/1502853757.jpg\",\"status\":\"0\",\"update_time\":\"2017-08-16 11:44:09\",\"add_time\":\"2017-08-16 11:22:39\",\"type_id\":\"4\",\"gp_id\":\"2\",\"note\":\"\"}', '编辑', '2017-08-16 11:45:04', null);
INSERT INTO `ccard_food_log` VALUES ('117', 'admin', '{\"id\":\"12\",\"title\":\"\\u51c9\\u62cc\\u9ec4\\u74dc\",\"price\":\"2.0\",\"thumb\":\"/Uploads/images/thumb/1502853757.jpg\",\"status\":\"0\",\"update_time\":\"2017-08-16 11:45:04\",\"add_time\":\"2017-08-16 11:22:39\",\"type_id\":\"4\",\"gp_id\":\"2\",\"note\":\"11\"}', '编辑', '2017-08-16 13:37:44', null);
INSERT INTO `ccard_food_log` VALUES ('118', 'admin', '{\"id\":\"12\",\"title\":\"\\u51c9\\u62cc\\u9ec4\\u74dc\",\"price\":\"2.0\",\"thumb\":\"/Uploads/images/thumb/1502853757.jpg\",\"status\":\"0\",\"update_time\":\"2017-08-16 13:37:44\",\"add_time\":\"2017-08-16 11:22:39\",\"type_id\":\"4\",\"gp_id\":\"2\",\"note\":\"11\"}', '编辑', '2017-08-16 13:37:51', null);
INSERT INTO `ccard_food_log` VALUES ('119', 'admin', '{\"title\":\"\\u51c9\\u62cc\\u9ec4\\u74dc\",\"type_id\":\"2\",\"price\":\"3\",\"thumb\":\"\",\"status\":\"1\",\"note\":\"\",\"gp_id\":\"2\",\"update_time\":\"2017-08-16 13:44:40\",\"add_time\":\"2017-08-16 13:44:40\"}', '新增', '2017-08-16 13:44:40', null);
INSERT INTO `ccard_food_log` VALUES ('120', 'admin', '{\"id\":\"12\",\"title\":\"\\u51c9\\u62cc\\u9ec4\\u74dc\",\"price\":\"2.0\",\"thumb\":\"/Uploads/images/thumb/1502853757.jpg\",\"status\":\"1\",\"update_time\":\"2017-08-16 13:37:51\",\"add_time\":\"2017-08-16 11:22:39\",\"type_id\":\"4\",\"gp_id\":\"2\",\"note\":\"11\"}', '编辑', '2017-08-16 13:57:24', 'app');
INSERT INTO `ccard_food_log` VALUES ('121', 'admin', '{\"id\":\"12\",\"title\":\"\\u51c9\\u62cc\\u9ec4\\u74dc\",\"price\":\"3.0\",\"thumb\":\"/Uploads/images/thumb/1502853757.jpg\",\"status\":\"1\",\"update_time\":\"2017-08-16 13:57:24\",\"add_time\":\"2017-08-16 11:22:39\",\"type_id\":\"4\",\"gp_id\":\"2\",\"note\":\"11\"}', '编辑', '2017-08-16 13:57:40', 'web');
INSERT INTO `ccard_food_log` VALUES ('122', 'admin', '{\"id\":\"12\",\"title\":\"\\u51c9\\u62cc\\u9ec4\\u74dc1\",\"price\":\"3.0\",\"thumb\":\"/Uploads/images/thumb/1502853757.jpg\",\"status\":\"1\",\"update_time\":\"2017-08-16 13:57:40\",\"add_time\":\"2017-08-16 11:22:39\",\"type_id\":\"4\",\"gp_id\":\"2\",\"note\":\"11\"}', '编辑', '2017-08-16 13:57:48', 'web');
INSERT INTO `ccard_food_log` VALUES ('123', 'admin', '{\"id\":\"12\",\"title\":\"\\u51c9\\u62cc\\u9ec4\\u74dc\",\"price\":\"3.0\",\"thumb\":\"/Uploads/images/thumb/1502853757.jpg\",\"status\":\"1\",\"update_time\":\"2017-08-16 13:57:48\",\"add_time\":\"2017-08-16 11:22:39\",\"type_id\":\"4\",\"gp_id\":\"2\",\"note\":\"11\"}', '编辑', '2017-08-16 13:57:59', 'app');
INSERT INTO `ccard_food_log` VALUES ('124', 'admin', '{\"name\":\"111\",\"type_id\":\"1\",\"price\":\"1\",\"status\":1,\"gp_id\":\"2\",\"update_time\":\"2017-08-24 08:19:43\",\"add_time\":\"2017-08-24 08:19:43\"}', '增加', '2017-08-24 08:19:43', 'app-123456');
INSERT INTO `ccard_food_log` VALUES ('125', 'admin', '{\"name\":\"3\",\"type_id\":\"2\",\"price\":\"3\",\"status\":1,\"gp_id\":\"2\",\"update_time\":\"2017-08-24 08:37:52\",\"add_time\":\"2017-08-24 08:37:52\",\"thumb\":\"/Uploads/images/thumb/1503535072.png\"}', '增加', '2017-08-24 08:37:52', 'app-123456');
INSERT INTO `ccard_food_log` VALUES ('126', 'admin', '{\"name\":\"3111\",\"type_id\":\"2\",\"price\":\"3\",\"status\":1,\"gp_id\":\"2\",\"update_time\":\"2017-08-24 08:38:22\",\"add_time\":\"2017-08-24 08:38:22\",\"thumb\":\"/Uploads/images/thumb/1503535102.png\"}', '增加', '2017-08-24 08:38:22', 'app-123456');
INSERT INTO `ccard_food_log` VALUES ('127', 'admin', '{\"name\":\"456\",\"type_id\":\"444\",\"price\":\"333\",\"status\":1,\"gp_id\":\"2\",\"update_time\":\"2017-08-24 08:55:29\",\"add_time\":\"2017-08-24 08:55:29\",\"thumb\":\"/Uploads/images/thumb/1503536129.png\"}', '增加', '2017-08-24 08:55:29', 'app-123456');
INSERT INTO `ccard_food_log` VALUES ('128', 'admin', '{\"name\":\"deserters\",\"type_id\":\"4\",\"price\":\"223\",\"status\":1,\"gp_id\":\"3\",\"update_time\":\"2017-08-24 09:00:32\",\"add_time\":\"2017-08-24 09:00:32\"}', '增加', '2017-08-24 09:00:32', 'app-951bae5fb2dde2a0');
INSERT INTO `ccard_food_log` VALUES ('129', '', '{\"name\":\"4561\",\"type_id\":\"444\",\"price\":\"333\",\"status\":1,\"gp_id\":\"2\",\"update_time\":\"2017-08-24 09:05:11\",\"add_time\":\"2017-08-24 09:05:11\",\"thumb\":\"/Uploads/images/thumb/1503536711.png\"}', '增加', '2017-08-24 09:05:11', 'app-123456');
INSERT INTO `ccard_food_log` VALUES ('130', '', '{\"name\":\"\",\"type_id\":\"\",\"price\":\"\",\"status\":1,\"gp_id\":\"\",\"update_time\":\"2017-08-24 09:44:13\",\"add_time\":\"2017-08-24 09:44:13\"}', '增加', '2017-08-24 09:44:13', 'app-951bae5fb2dde2a0');
INSERT INTO `ccard_food_log` VALUES ('131', '', '{\"name\":\"123333\",\"type_id\":\"1\",\"price\":\"1\",\"status\":1,\"gp_id\":\"2\",\"update_time\":\"2017-08-24 09:47:11\",\"add_time\":\"2017-08-24 09:47:11\",\"thumb\":\"/Uploads/images/thumb/1503539231.jpg\"}', '增加', '2017-08-24 09:47:11', 'app-123456');
INSERT INTO `ccard_food_log` VALUES ('132', '', '{\"name\":\"13434\",\"type_id\":\"4234\",\"price\":\"4324\",\"status\":1,\"gp_id\":\"2\",\"update_time\":\"2017-08-24 09:47:41\",\"add_time\":\"2017-08-24 09:47:41\",\"thumb\":\"/Uploads/images/thumb/1503539261.jpg\"}', '增加', '2017-08-24 09:47:41', 'app-123456');
INSERT INTO `ccard_food_log` VALUES ('133', '', '{\"name\":\"1343421313243\",\"type_id\":\"4234\",\"price\":\"4324sar\",\"status\":1,\"gp_id\":\"2\",\"update_time\":\"2017-08-24 09:48:06\",\"add_time\":\"2017-08-24 09:48:06\",\"thumb\":\"/Uploads/images/thumb/1503539286.jpg\"}', '增加', '2017-08-24 09:48:06', 'app-123456');
INSERT INTO `ccard_food_log` VALUES ('134', '', '{\"name\":\"\",\"type_id\":\"\",\"price\":\"\",\"status\":1,\"gp_id\":\"\",\"update_time\":\"2017-08-24 09:49:05\",\"add_time\":\"2017-08-24 09:49:05\"}', '增加', '2017-08-24 09:49:05', 'app-951bae5fb2dde2a0');
INSERT INTO `ccard_food_log` VALUES ('135', 'admin', '{\"name\":\"\\u597d\\u6b21\\u76842\",\"type_id\":\"2\",\"price\":\"36\",\"status\":1,\"gp_id\":\"2\",\"update_time\":\"2017-08-24 10:14:57\",\"add_time\":\"2017-08-24 10:14:57\"}', '增加', '2017-08-24 10:14:57', 'app-951bae5fb2dde2a0');
INSERT INTO `ccard_food_log` VALUES ('136', 'admin', '{\"name\":\"\\u597d\\u6b21\\u76841\",\"type_id\":\"2\",\"price\":\"36\",\"status\":1,\"gp_id\":\"2\",\"update_time\":\"2017-08-24 10:15:56\",\"add_time\":\"2017-08-24 10:15:56\"}', '增加', '2017-08-24 10:15:56', 'app-951bae5fb2dde2a0');
INSERT INTO `ccard_food_log` VALUES ('137', 'admin', '{\"name\":\"\",\"type_id\":\"\",\"price\":\"\",\"status\":1,\"gp_id\":\"2\",\"update_time\":\"2017-08-24 10:37:05\",\"add_time\":\"2017-08-24 10:37:05\"}', '增加', '2017-08-24 10:37:05', 'app-951bae5fb2dde2a0');
INSERT INTO `ccard_food_log` VALUES ('138', 'admin', '{\"name\":\"test1\",\"type_id\":\"4234\",\"price\":\"4324sar\",\"status\":1,\"gp_id\":\"2\",\"update_time\":\"2017-08-24 10:40:06\",\"add_time\":\"2017-08-24 10:40:06\",\"thumb\":\"/Uploads/images/thumb/1503542406.png\"}', '增加', '2017-08-24 10:40:06', 'app-123456');
INSERT INTO `ccard_food_log` VALUES ('139', 'admin', '{\"name\":\"name\",\"type_id\":\"\",\"price\":\"0.5\",\"status\":1,\"gp_id\":\"3\",\"update_time\":\"2017-08-24 14:57:18\",\"add_time\":\"2017-08-24 14:57:18\",\"thumb\":\"/Uploads/images/thumb/1503557838.JPEG\"}', '增加', '2017-08-24 14:57:19', 'app-123456');
INSERT INTO `ccard_food_log` VALUES ('140', 'xingrong', '{\"name\":\"yy\",\"type_id\":\"\",\"price\":\"gg\",\"status\":1,\"gp_id\":\"3\",\"update_time\":\"2017-08-24 16:33:56\",\"add_time\":\"2017-08-24 16:33:56\",\"thumb\":\"/Uploads/images/thumb/1503563636.jpeg\"}', '增加', '2017-08-24 16:33:57', 'app-123456');
INSERT INTO `ccard_food_log` VALUES ('141', 'xingrong', '{\"name\":\"TTY ww\",\"type_id\":\"\",\"price\":\"3\",\"status\":1,\"gp_id\":\"3\",\"update_time\":\"2017-08-25 10:19:46\",\"add_time\":\"2017-08-25 10:19:46\",\"thumb\":\"/Uploads/images/thumb/1503627586.jpeg\"}', '增加', '2017-08-25 10:19:46', 'app-123456');
INSERT INTO `ccard_food_log` VALUES ('142', 'xingrong', '{\"name\":\"Byrd\",\"type_id\":\"\",\"price\":\"2\",\"status\":1,\"gp_id\":\"3\",\"update_time\":\"2017-08-25 10:22:22\",\"add_time\":\"2017-08-25 10:22:22\",\"thumb\":\"/Uploads/images/thumb/1503627742.jpeg\"}', '增加', '2017-08-25 10:22:22', 'app-123456');
INSERT INTO `ccard_food_log` VALUES ('143', 'xingrong', '{\"name\":\"Hughhu\",\"type_id\":\"\",\"price\":\"2\",\"status\":1,\"gp_id\":\"3\",\"update_time\":\"2017-08-25 10:22:34\",\"add_time\":\"2017-08-25 10:22:34\",\"thumb\":\"/Uploads/images/thumb/1503627754.jpeg\"}', '增加', '2017-08-25 10:22:34', 'app-123456');
INSERT INTO `ccard_food_log` VALUES ('144', 'xingrong', '{\"name\":\"Hughhu hh\",\"type_id\":\"\",\"price\":\"2\",\"status\":1,\"gp_id\":\"3\",\"update_time\":\"2017-08-25 10:22:54\",\"add_time\":\"2017-08-25 10:22:54\",\"thumb\":\"/Uploads/images/thumb/1503627774.jpeg\"}', '增加', '2017-08-25 10:22:54', 'app-123456');
INSERT INTO `ccard_food_log` VALUES ('145', 'xingrong', '{\"name\":\"hggugyygyy\",\"type_id\":\"\",\"price\":\"46\",\"status\":1,\"gp_id\":\"3\",\"update_time\":\"2017-08-25 10:27:56\",\"add_time\":\"2017-08-25 10:27:56\",\"thumb\":\"/Uploads/images/thumb/1503628076.jpeg\"}', '增加', '2017-08-25 10:27:56', 'app-123456');
INSERT INTO `ccard_food_log` VALUES ('146', 'xingrong', '{\"name\":\"hggugyygy\",\"type_id\":\"\",\"price\":\"46\",\"status\":1,\"gp_id\":\"3\",\"update_time\":\"2017-08-25 10:28:17\",\"add_time\":\"2017-08-25 10:28:17\",\"thumb\":\"/Uploads/images/thumb/1503628097.jpeg\"}', '增加', '2017-08-25 10:28:17', 'app-123456');
INSERT INTO `ccard_food_log` VALUES ('147', 'xingrong', '{\"name\":\"hugyyy\",\"type_id\":\"\",\"price\":\"3\",\"status\":1,\"gp_id\":\"3\",\"update_time\":\"2017-08-25 10:38:18\",\"add_time\":\"2017-08-25 10:38:18\",\"thumb\":\"/Uploads/images/thumb/1503628698.jpeg\"}', '增加', '2017-08-25 10:38:18', 'app-123456');
INSERT INTO `ccard_food_log` VALUES ('148', 'xingrong', '{\"name\":\"ybncc\",\"type_id\":\"\",\"price\":\"54\",\"status\":1,\"gp_id\":\"3\",\"update_time\":\"2017-08-25 11:03:47\",\"add_time\":\"2017-08-25 11:03:47\",\"thumb\":\"/Uploads/images/thumb/1503630227.jpg\"}', '增加', '2017-08-25 11:03:47', 'app-123456');
INSERT INTO `ccard_food_log` VALUES ('149', 'xingrong', '{\"name\":\"\\u718a\\u732b\\u8089\",\"type_id\":\"\",\"price\":\"11\",\"status\":1,\"gp_id\":\"3\",\"update_time\":\"2017-08-25 15:17:13\",\"add_time\":\"2017-08-25 15:17:13\",\"thumb\":\"/Uploads/images/thumb/1503645433.jpg\"}', '增加', '2017-08-25 15:17:13', 'app-123456');
INSERT INTO `ccard_food_log` VALUES ('150', 'xingrong', '{\"name\":\"\\u963f\\u9c81\",\"type_id\":\"\",\"price\":\"4258.858\",\"status\":1,\"gp_id\":\"3\",\"update_time\":\"2017-08-25 15:42:13\",\"add_time\":\"2017-08-25 15:42:13\",\"thumb\":\"/Uploads/images/thumb/1503646933.jpg\"}', '增加', '2017-08-25 15:42:13', 'app-123456');
INSERT INTO `ccard_food_log` VALUES ('151', 'xingrong', '{\"name\":\"_(:\\u0437\\u300d\\u2220)_\",\"type_id\":\"\",\"price\":\"64\",\"status\":1,\"gp_id\":\"3\",\"update_time\":\"2017-08-25 15:49:39\",\"add_time\":\"2017-08-25 15:49:39\",\"thumb\":\"/Uploads/images/thumb/1503647379.jpg\"}', '增加', '2017-08-25 15:49:39', 'app-123456');
INSERT INTO `ccard_food_log` VALUES ('152', 'xingrong', '{\"name\":\"tbd\",\"type_id\":\"\",\"price\":\"23\",\"status\":1,\"gp_id\":\"3\",\"update_time\":\"2017-08-25 16:18:49\",\"add_time\":\"2017-08-25 16:18:49\",\"thumb\":\"/Uploads/images/thumb/1503649129.jpg\"}', '增加', '2017-08-25 16:18:49', 'app-123456');
INSERT INTO `ccard_food_log` VALUES ('153', 'xingrong', '{\"name\":\"tbn\",\"type_id\":\"\",\"price\":\"9\",\"status\":1,\"gp_id\":\"3\",\"update_time\":\"2017-08-25 16:20:53\",\"add_time\":\"2017-08-25 16:20:53\",\"thumb\":\"/Uploads/images/thumb/1503649253.jpg\"}', '增加', '2017-08-25 16:20:53', 'app-123456');
INSERT INTO `ccard_food_log` VALUES ('154', 'xingrong', '{\"name\":\"\\u770b\\u4e00\\u4e0b\",\"type_id\":\"\",\"price\":\"66\",\"status\":1,\"gp_id\":\"3\",\"update_time\":\"2017-08-25 16:22:22\",\"add_time\":\"2017-08-25 16:22:22\",\"thumb\":\"/Uploads/images/thumb/1503649342.jpg\"}', '增加', '2017-08-25 16:22:22', 'app-123456');
INSERT INTO `ccard_food_log` VALUES ('155', 'xingrong', '{\"name\":\"\\u70b9\\u51fb\\u8fdb\",\"type_id\":\"\",\"price\":\"65\",\"status\":1,\"gp_id\":\"3\",\"update_time\":\"2017-08-25 16:30:51\",\"add_time\":\"2017-08-25 16:30:51\",\"thumb\":\"/Uploads/images/thumb/1503649851.jpg\"}', '增加', '2017-08-25 16:30:51', 'app-123456');
INSERT INTO `ccard_food_log` VALUES ('156', 'xingrong', '{\"name\":\"Truth\",\"type_id\":\"\",\"price\":\"23\",\"status\":1,\"gp_id\":\"3\",\"update_time\":\"2017-08-28 08:34:16\",\"add_time\":\"2017-08-28 08:34:16\",\"thumb\":\"/Uploads/images/thumb/1503880456.jpg\"}', '增加', '2017-08-28 08:34:16', 'app-123456');
INSERT INTO `ccard_food_log` VALUES ('157', 'xingrong', '{\"name\":\"the him\",\"type_id\":\"5\",\"price\":\"33\",\"status\":1,\"gp_id\":\"3\",\"update_time\":\"2017-08-28 09:26:55\",\"add_time\":\"2017-08-28 09:26:55\",\"thumb\":\"/Uploads/images/thumb/1503883615.jpg\"}', '增加', '2017-08-28 09:26:55', 'app-123456');
INSERT INTO `ccard_food_log` VALUES ('158', 'xingrong', '{\"name\":\"rugby\",\"type_id\":\"5\",\"price\":\"555\",\"status\":1,\"gp_id\":\"3\",\"update_time\":\"2017-08-28 09:29:15\",\"add_time\":\"2017-08-28 09:29:15\",\"thumb\":\"/Uploads/images/thumb/1503883755.jpg\"}', '增加', '2017-08-28 09:29:15', 'app-123456');
INSERT INTO `ccard_food_log` VALUES ('159', 'xingrong', '{\"name\":\"ggg t ggg ggg ggg\",\"type_id\":\"1\",\"price\":\"34\",\"status\":1,\"gp_id\":\"3\",\"update_time\":\"2017-08-28 09:40:05\",\"add_time\":\"2017-08-28 09:40:05\",\"thumb\":\"/Uploads/images/thumb/1503884405.jpg\"}', '增加', '2017-08-28 09:40:05', 'app-123456');
INSERT INTO `ccard_food_log` VALUES ('160', 'xingrong', '{\"name\":\"111\",\"type_id\":\"5\",\"price\":\"3\",\"status\":1,\"gp_id\":\"3\",\"update_time\":\"2017-08-28 09:47:49\",\"add_time\":\"2017-08-28 09:47:49\",\"thumb\":\"/Uploads/images/thumb/1503884869.jpg\"}', '增加', '2017-08-28 09:47:49', 'app-123456');
INSERT INTO `ccard_food_log` VALUES ('161', 'xingrong', '{\"name\":\"ggg t ggg\",\"type_id\":\"3\",\"price\":\"45\",\"status\":1,\"gp_id\":\"3\",\"update_time\":\"2017-08-28 09:54:18\",\"add_time\":\"2017-08-28 09:54:18\",\"thumb\":\"/Uploads/images/thumb/1503885258.jpg\"}', '增加', '2017-08-28 09:54:18', 'app-123456');
INSERT INTO `ccard_food_log` VALUES ('162', 'xingrong', '{\"name\":\"yuhhghhvgb\",\"type_id\":\"3\",\"price\":\"57\",\"status\":1,\"gp_id\":\"3\",\"update_time\":\"2017-08-28 09:58:25\",\"add_time\":\"2017-08-28 09:58:25\",\"thumb\":\"/Uploads/images/thumb/1503885505.jpg\"}', '增加', '2017-08-28 09:58:25', 'app-123456');
INSERT INTO `ccard_food_log` VALUES ('163', 'xingrong', '{\"name\":\"truth33\",\"type_id\":\"5\",\"price\":\"44\",\"status\":1,\"gp_id\":\"3\",\"update_time\":\"2017-08-28 09:59:40\",\"add_time\":\"2017-08-28 09:59:40\",\"thumb\":\"/Uploads/images/thumb/1503885580.jpg\"}', '增加', '2017-08-28 09:59:40', 'app-123456');
INSERT INTO `ccard_food_log` VALUES ('164', 'xingrong', '{\"name\":\"yuhhghh44556\",\"type_id\":\"1\",\"price\":\"32\",\"status\":1,\"gp_id\":\"3\",\"update_time\":\"2017-08-29 08:35:47\",\"add_time\":\"2017-08-29 08:35:47\",\"thumb\":\"/Uploads/images/thumb/1503966947.jpg\"}', '增加', '2017-08-29 08:35:48', 'app-123456');
INSERT INTO `ccard_food_log` VALUES ('165', 'xingrong', '{\"name\":\"text1\",\"type_id\":\"4\",\"price\":\"5\",\"status\":1,\"gp_id\":\"3\",\"update_time\":\"2017-08-29 16:02:36\",\"add_time\":\"2017-08-29 16:02:36\",\"thumb\":\"/Uploads/images/thumb/1503993756.jpg\"}', '增加', '2017-08-29 16:02:36', 'app-123456');
INSERT INTO `ccard_food_log` VALUES ('166', 'xingrong', '{\"name\":\"test2\",\"type_id\":\"5\",\"price\":\"2\",\"status\":1,\"gp_id\":\"3\",\"update_time\":\"2017-08-29 16:03:36\",\"add_time\":\"2017-08-29 16:03:36\",\"thumb\":\"/Uploads/images/thumb/1503993816.jpg\"}', '增加', '2017-08-29 16:03:36', 'app-123456');
INSERT INTO `ccard_food_log` VALUES ('167', 'xingrong', '{\"name\":\"test3\",\"type_id\":\"4\",\"price\":\"6\",\"status\":1,\"gp_id\":\"3\",\"update_time\":\"2017-08-29 16:04:11\",\"add_time\":\"2017-08-29 16:04:11\",\"thumb\":\"/Uploads/images/thumb/1503993851.jpg\"}', '增加', '2017-08-29 16:04:11', 'app-123456');
INSERT INTO `ccard_food_log` VALUES ('168', 'xingrong', '{\"name\":\"test4\",\"type_id\":\"1\",\"price\":\"1\",\"status\":1,\"gp_id\":\"3\",\"update_time\":\"2017-08-29 16:06:05\",\"add_time\":\"2017-08-29 16:06:05\",\"thumb\":\"/Uploads/images/thumb/1503993965.jpg\"}', '增加', '2017-08-29 16:06:05', 'app-123456');
INSERT INTO `ccard_food_log` VALUES ('169', 'xingrong', '{\"name\":\"test5\",\"type_id\":\"5\",\"price\":\"10\",\"status\":1,\"gp_id\":\"3\",\"update_time\":\"2017-08-29 16:07:04\",\"add_time\":\"2017-08-29 16:07:04\",\"thumb\":\"/Uploads/images/thumb/1503994024.jpg\"}', '增加', '2017-08-29 16:07:04', 'app-123456');
INSERT INTO `ccard_food_log` VALUES ('170', 'xingrong', '{\"name\":\"test6\",\"type_id\":\"3\",\"price\":\"4\",\"status\":1,\"gp_id\":\"3\",\"update_time\":\"2017-08-29 16:07:18\",\"add_time\":\"2017-08-29 16:07:18\",\"thumb\":\"/Uploads/images/thumb/1503994038.jpg\"}', '增加', '2017-08-29 16:07:18', 'app-123456');
INSERT INTO `ccard_food_log` VALUES ('171', 'xingrong', '{\"name\":\"test7\",\"type_id\":\"3\",\"price\":\"3\",\"status\":1,\"gp_id\":\"3\",\"update_time\":\"2017-08-29 16:19:13\",\"add_time\":\"2017-08-29 16:19:13\",\"thumb\":\"/Uploads/images/thumb/1503994753.jpg\"}', '增加', '2017-08-29 16:19:13', 'app-123456');
INSERT INTO `ccard_food_log` VALUES ('172', 'xingrong', '{\"name\":\"FFC\",\"type_id\":\"3\",\"price\":\"3\",\"status\":1,\"gp_id\":\"3\",\"update_time\":\"2017-08-30 08:37:15\",\"add_time\":\"2017-08-30 08:37:15\",\"thumb\":\"/Uploads/images/thumb/1504053435.jpg\"}', '增加', '2017-08-30 08:37:15', 'app-123456');
INSERT INTO `ccard_food_log` VALUES ('173', 'xingrong', '{\"name\":\"three\",\"type_id\":\"4\",\"price\":\"333\",\"status\":1,\"gp_id\":\"3\",\"update_time\":\"2017-08-30 08:37:26\",\"add_time\":\"2017-08-30 08:37:26\",\"thumb\":\"/Uploads/images/thumb/1504053446.jpg\"}', '增加', '2017-08-30 08:37:26', 'app-123456');
INSERT INTO `ccard_food_log` VALUES ('174', 'xingrong', '{\"name\":\"HGTV red\",\"type_id\":\"3\",\"price\":\"344\",\"status\":1,\"gp_id\":\"3\",\"update_time\":\"2017-08-30 08:49:56\",\"add_time\":\"2017-08-30 08:49:56\",\"thumb\":\"/Uploads/images/thumb/1504054196.jpg\"}', '增加', '2017-08-30 08:49:56', 'app-123456');
INSERT INTO `ccard_food_log` VALUES ('175', 'xingrong', '{\"name\":\"NGF\",\"type_id\":\"5\",\"price\":\"3\",\"status\":1,\"gp_id\":\"3\",\"update_time\":\"2017-08-30 08:50:23\",\"add_time\":\"2017-08-30 08:50:23\",\"thumb\":\"/Uploads/images/thumb/1504054223.jpg\"}', '增加', '2017-08-30 08:50:23', 'app-123456');
INSERT INTO `ccard_food_log` VALUES ('176', 'xingrong', '{\"name\":\"test11\",\"type_id\":\"3\",\"price\":\"5\",\"status\":1,\"gp_id\":\"3\",\"update_time\":\"2017-08-30 10:27:05\",\"add_time\":\"2017-08-30 10:27:05\",\"thumb\":\"/Uploads/images/thumb/1504060025.jpg\"}', '增加', '2017-08-30 10:27:05', 'app-123456');
INSERT INTO `ccard_food_log` VALUES ('177', 'xingrong', '{\"name\":\"test22\",\"type_id\":\"1\",\"price\":\"3\",\"status\":1,\"gp_id\":\"3\",\"update_time\":\"2017-08-30 10:27:54\",\"add_time\":\"2017-08-30 10:27:54\",\"thumb\":\"/Uploads/images/thumb/1504060074.jpg\"}', '增加', '2017-08-30 10:27:54', 'app-123456');
INSERT INTO `ccard_food_log` VALUES ('178', 'admin', '{\"id\":\"73\",\"name\":\"test22\",\"price\":\"3.0\",\"thumb\":\"/Uploads/images/thumb/1504060074.jpg\",\"status\":\"1\",\"update_time\":\"2017-08-30 10:27:54\",\"add_time\":\"2017-08-30 10:27:54\",\"type_id\":\"1\",\"gp_id\":\"3\",\"note\":\"\"}', '编辑', '2017-08-30 10:31:28', null);
INSERT INTO `ccard_food_log` VALUES ('179', 'chuangweikang', '{\"name\":\"test33\",\"type_id\":\"5\",\"price\":\"6\",\"status\":1,\"gp_id\":\"2\",\"update_time\":\"2017-08-30 10:32:37\",\"add_time\":\"2017-08-30 10:32:37\",\"thumb\":\"/Uploads/images/thumb/1504060357.jpg\"}', '增加', '2017-08-30 10:32:37', 'app-123456');
INSERT INTO `ccard_food_log` VALUES ('180', 'admin', '{\"id\":\"74\",\"name\":\"test33\",\"price\":\"6.0\",\"thumb\":\"/Uploads/images/thumb/1504060357.jpg\",\"status\":\"1\",\"update_time\":\"2017-08-30 10:32:37\",\"add_time\":\"2017-08-30 10:32:37\",\"type_id\":\"5\",\"gp_id\":\"2\",\"note\":\"\"}', '编辑', '2017-08-30 10:33:11', null);
INSERT INTO `ccard_food_log` VALUES ('181', 'admin', '{\"id\":\"71\",\"name\":\"NGF\",\"price\":\"3.0\",\"thumb\":\"/Uploads/images/thumb/1504054223.jpg\",\"status\":\"1\",\"update_time\":\"2017-08-30 08:50:23\",\"add_time\":\"2017-08-30 08:50:23\",\"type_id\":\"5\",\"gp_id\":\"3\",\"note\":\"\"}', '删除', '2017-08-30 10:33:26', null);
INSERT INTO `ccard_food_log` VALUES ('182', 'admin', '{\"id\":\"68\",\"name\":\"FFC\",\"price\":\"3.0\",\"thumb\":\"/Uploads/images/thumb/1504053435.jpg\",\"status\":\"1\",\"update_time\":\"2017-08-30 08:37:15\",\"add_time\":\"2017-08-30 08:37:15\",\"type_id\":\"3\",\"gp_id\":\"3\",\"note\":\"\"}', '删除', '2017-08-30 10:33:40', null);
INSERT INTO `ccard_food_log` VALUES ('183', 'chuangweikang', '{\"name\":\"test44\",\"type_id\":\"1\",\"price\":\"4\",\"status\":1,\"gp_id\":\"2\",\"update_time\":\"2017-08-30 10:37:56\",\"add_time\":\"2017-08-30 10:37:56\",\"thumb\":\"/Uploads/images/thumb/1504060676.jpg\"}', '增加', '2017-08-30 10:37:56', 'app-123456');
INSERT INTO `ccard_food_log` VALUES ('184', 'admin', '{\"name\":\"111\",\"type_id\":\"4\",\"price\":\"aaaa\",\"thumb\":\"\",\"status\":\"1\",\"note\":\"\",\"gp_id\":\"2\",\"update_time\":\"2017-08-30 10:58:22\",\"add_time\":\"2017-08-30 10:58:22\"}', '新增', '2017-08-30 10:58:22', null);
INSERT INTO `ccard_food_log` VALUES ('185', 'admin', '{\"id\":\"75\",\"name\":\"test44\",\"price\":\"4.0\",\"thumb\":\"/Uploads/images/thumb/1504060676.jpg\",\"status\":\"1\",\"update_time\":\"2017-08-30 10:37:56\",\"add_time\":\"2017-08-30 10:37:56\",\"type_id\":\"1\",\"gp_id\":\"2\",\"note\":\"\"}', '编辑', '2017-08-30 11:00:42', null);
INSERT INTO `ccard_food_log` VALUES ('186', 'xingrong', '{\"id\":\"73\",\"name\":\"test22\",\"price\":\"6.0\",\"thumb\":\"/Uploads/images/thumb/1504060074.jpg\",\"status\":\"1\",\"update_time\":\"2017-08-30 10:31:28\",\"add_time\":\"2017-08-30 10:27:54\",\"type_id\":\"1\",\"gp_id\":\"3\",\"note\":\"\"}', '编辑', '2017-08-30 11:10:52', null);
INSERT INTO `ccard_food_log` VALUES ('187', 'admin', '{\"id\":\"76\",\"name\":\"111\",\"price\":\"0.0\",\"thumb\":\"\",\"status\":\"1\",\"update_time\":\"2017-08-30 10:58:22\",\"add_time\":\"2017-08-30 10:58:22\",\"type_id\":\"4\",\"gp_id\":\"2\",\"note\":\"\"}', '编辑', '2017-08-30 11:25:49', null);
INSERT INTO `ccard_food_log` VALUES ('188', 'admin', '{\"id\":\"76\",\"name\":\"111\",\"price\":\"0.0\",\"thumb\":\"\",\"status\":\"1\",\"update_time\":\"2017-08-30 11:25:49\",\"add_time\":\"2017-08-30 10:58:22\",\"type_id\":\"4\",\"gp_id\":\"2\",\"note\":\"\"}', '编辑', '2017-08-30 11:32:57', null);
INSERT INTO `ccard_food_log` VALUES ('189', 'xingrong', '{\"name\":\"\\u9752\\u83dc\",\"type_id\":\"4\",\"price\":\"2\",\"status\":1,\"gp_id\":\"3\",\"update_time\":\"2017-08-30 15:59:35\",\"add_time\":\"2017-08-30 15:59:35\",\"thumb\":\"/Uploads/images/thumb/1504079975.jpg\"}', '增加', '2017-08-30 15:59:35', 'app-123456');
INSERT INTO `ccard_food_log` VALUES ('190', 'xingrong', '{\"name\":\"\\u5e72\\u8106\\u9762\",\"type_id\":\"1\",\"price\":\"1\",\"status\":1,\"gp_id\":\"3\",\"update_time\":\"2017-08-31 08:35:43\",\"add_time\":\"2017-08-31 08:35:43\",\"thumb\":\"/Uploads/images/thumb/1504139743.jpg\"}', '增加', '2017-08-31 08:35:43', 'app-123456');
INSERT INTO `ccard_food_log` VALUES ('191', 'xingrong', '{\"name\":\"\\u6c49\\u5821\\u5305\",\"type_id\":\"1\",\"price\":\"2\",\"status\":1,\"gp_id\":\"3\",\"update_time\":\"2017-08-31 08:36:56\",\"add_time\":\"2017-08-31 08:36:56\",\"thumb\":\"/Uploads/images/thumb/1504139816.jpg\"}', '增加', '2017-08-31 08:36:56', 'app-123456');
INSERT INTO `ccard_food_log` VALUES ('192', 'chuangweikang', '{\"name\":\"\\u9999\\u83c7\",\"type_id\":\"5\",\"price\":\"3\",\"status\":1,\"gp_id\":\"2\",\"update_time\":\"2017-08-31 08:39:16\",\"add_time\":\"2017-08-31 08:39:16\",\"thumb\":\"/Uploads/images/thumb/1504139956.jpg\"}', '增加', '2017-08-31 08:39:16', 'app-123456');
INSERT INTO `ccard_food_log` VALUES ('193', 'admin', '{\"id\":\"80\",\"name\":\"\\u9999\\u83c7\",\"price\":\"3.0\",\"thumb\":\"/Uploads/images/thumb/1504139956.jpg\",\"status\":\"1\",\"update_time\":\"2017-08-31 08:39:16\",\"add_time\":\"2017-08-31 08:39:16\",\"type_id\":\"5\",\"gp_id\":\"2\",\"note\":\"\"}', '编辑', '2017-08-31 08:44:28', null);
INSERT INTO `ccard_food_log` VALUES ('194', 'admin', '{\"id\":\"79\",\"name\":\"\\u6c49\\u5821\\u5305\",\"price\":\"2.0\",\"thumb\":\"/Uploads/images/thumb/1504139816.jpg\",\"status\":\"1\",\"update_time\":\"2017-08-31 08:36:56\",\"add_time\":\"2017-08-31 08:36:56\",\"type_id\":\"1\",\"gp_id\":\"3\",\"note\":\"\"}', '删除', '2017-08-31 08:44:35', null);
INSERT INTO `ccard_food_log` VALUES ('195', 'admin', '{\"id\":\"14\",\"name\":\"fffffff\",\"price\":\"33.0\",\"thumb\":\"\",\"status\":\"1\",\"update_time\":\"2017-08-23 16:58:48\",\"add_time\":\"2017-08-23 16:58:48\",\"type_id\":\"4\",\"gp_id\":\"3\",\"note\":\"\"}', '编辑', '2017-08-31 09:17:25', null);
INSERT INTO `ccard_food_log` VALUES ('196', 'admin', '{\"id\":\"24\",\"name\":\"deserters\",\"price\":\"223.0\",\"thumb\":\"\",\"status\":\"1\",\"update_time\":\"2017-08-24 09:00:32\",\"add_time\":\"2017-08-24 09:00:32\",\"type_id\":\"4\",\"gp_id\":\"3\",\"note\":\"\"}', '编辑', '2017-08-31 09:18:35', null);
INSERT INTO `ccard_food_log` VALUES ('197', 'admin', '{\"id\":\"25\",\"name\":\"4561\",\"price\":\"333.0\",\"thumb\":\"/Uploads/images/thumb/1503536711.png\",\"status\":\"1\",\"update_time\":\"2017-08-24 09:05:11\",\"add_time\":\"2017-08-24 09:05:11\",\"type_id\":\"444\",\"gp_id\":\"2\",\"note\":\"\"}', '编辑', '2017-08-31 09:22:24', null);
INSERT INTO `ccard_food_log` VALUES ('198', 'admin', '{\"id\":\"27\",\"name\":\"123333\",\"price\":\"1.0\",\"thumb\":\"/Uploads/images/thumb/1503539231.jpg\",\"status\":\"1\",\"update_time\":\"2017-08-24 09:47:11\",\"add_time\":\"2017-08-24 09:47:11\",\"type_id\":\"1\",\"gp_id\":\"2\",\"note\":\"\"}', '编辑', '2017-08-31 09:24:09', null);
INSERT INTO `ccard_food_log` VALUES ('199', 'admin', '{\"id\":\"62\",\"name\":\"test2\",\"price\":\"2.0\",\"thumb\":\"/Uploads/images/thumb/1503993816.jpg\",\"status\":\"1\",\"update_time\":\"2017-08-29 16:03:36\",\"add_time\":\"2017-08-29 16:03:36\",\"type_id\":\"5\",\"gp_id\":\"3\",\"note\":\"\"}', '编辑', '2017-08-31 09:26:34', null);
INSERT INTO `ccard_food_log` VALUES ('200', 'admin', '{\"id\":\"78\",\"name\":\"\\u5e72\\u8106\\u9762\",\"price\":\"1.0\",\"thumb\":\"/Uploads/images/thumb/1504139743.jpg\",\"status\":\"1\",\"update_time\":\"2017-08-31 08:35:43\",\"add_time\":\"2017-08-31 08:35:43\",\"type_id\":\"1\",\"gp_id\":\"3\",\"note\":\"\"}', '编辑', '2017-08-31 09:26:52', null);
INSERT INTO `ccard_food_log` VALUES ('201', 'admin', '{\"id\":\"77\",\"name\":\"\\u9752\\u83dc\",\"price\":\"2.0\",\"thumb\":\"/Uploads/images/thumb/1504079975.jpg\",\"status\":\"1\",\"update_time\":\"2017-08-30 15:59:35\",\"add_time\":\"2017-08-30 15:59:35\",\"type_id\":\"4\",\"gp_id\":\"3\",\"note\":\"\"}', '编辑', '2017-08-31 09:32:20', null);
INSERT INTO `ccard_food_log` VALUES ('202', 'admin', '{\"id\":\"53\",\"name\":\"the him\",\"price\":\"33.0\",\"thumb\":\"/Uploads/images/thumb/1503883615.jpg\",\"status\":\"1\",\"update_time\":\"2017-08-28 09:26:55\",\"add_time\":\"2017-08-28 09:26:55\",\"type_id\":\"5\",\"gp_id\":\"3\",\"note\":\"\"}', '编辑', '2017-08-31 09:38:16', null);
INSERT INTO `ccard_food_log` VALUES ('203', 'admin', '{\"id\":\"54\",\"name\":\"rugby\",\"price\":\"555.0\",\"thumb\":\"/Uploads/images/thumb/1503883755.jpg\",\"status\":\"1\",\"update_time\":\"2017-08-28 09:29:15\",\"add_time\":\"2017-08-28 09:29:15\",\"type_id\":\"5\",\"gp_id\":\"3\",\"note\":\"\"}', '编辑', '2017-08-31 10:12:56', null);
INSERT INTO `ccard_food_log` VALUES ('204', 'admin', '{\"id\":\"55\",\"name\":\"ggg t ggg ggg ggg\",\"price\":\"34.0\",\"thumb\":\"/Uploads/images/thumb/1503884405.jpg\",\"status\":\"1\",\"update_time\":\"2017-08-28 09:40:05\",\"add_time\":\"2017-08-28 09:40:05\",\"type_id\":\"1\",\"gp_id\":\"3\",\"note\":\"\"}', '编辑', '2017-08-31 10:14:40', null);
INSERT INTO `ccard_food_log` VALUES ('205', 'admin', '{\"id\":\"56\",\"name\":\"111\",\"price\":\"3.0\",\"thumb\":\"/Uploads/images/thumb/1503884869.jpg\",\"status\":\"1\",\"update_time\":\"2017-08-28 09:47:49\",\"add_time\":\"2017-08-28 09:47:49\",\"type_id\":\"5\",\"gp_id\":\"3\",\"note\":\"\"}', '编辑', '2017-08-31 10:16:09', null);
INSERT INTO `ccard_food_log` VALUES ('206', 'admin', '{\"id\":\"57\",\"name\":\"ggg t ggg\",\"price\":\"45.0\",\"thumb\":\"/Uploads/images/thumb/1503885258.jpg\",\"status\":\"1\",\"update_time\":\"2017-08-28 09:54:18\",\"add_time\":\"2017-08-28 09:54:18\",\"type_id\":\"3\",\"gp_id\":\"3\",\"note\":\"\"}', '编辑', '2017-08-31 10:17:30', null);
INSERT INTO `ccard_food_log` VALUES ('207', 'admin', '{\"id\":\"59\",\"name\":\"truth33\",\"price\":\"44.0\",\"thumb\":\"/Uploads/images/thumb/1503885580.jpg\",\"status\":\"1\",\"update_time\":\"2017-08-28 09:59:40\",\"add_time\":\"2017-08-28 09:59:40\",\"type_id\":\"5\",\"gp_id\":\"3\",\"note\":\"\"}', '编辑', '2017-08-31 10:19:36', null);
INSERT INTO `ccard_food_log` VALUES ('208', 'admin', '{\"id\":\"54\",\"name\":\"\\u70e7\\u4e09\\u4e1d\",\"price\":\"555.0\",\"thumb\":\"/Uploads/images/thumb/1503883755.jpg\",\"status\":\"1\",\"update_time\":\"2017-08-31 10:12:56\",\"add_time\":\"2017-08-28 09:29:15\",\"type_id\":\"5\",\"gp_id\":\"3\",\"note\":\"\"}', '编辑', '2017-08-31 10:40:44', null);
INSERT INTO `ccard_food_log` VALUES ('209', 'admin', '{\"id\":\"53\",\"name\":\"\\u70e4\\u9e2d\",\"price\":\"33.0\",\"thumb\":\"/Uploads/images/thumb/1503883615.jpg\",\"status\":\"1\",\"update_time\":\"2017-08-31 09:38:16\",\"add_time\":\"2017-08-28 09:26:55\",\"type_id\":\"5\",\"gp_id\":\"3\",\"note\":\"\"}', '编辑', '2017-08-31 10:40:56', null);
INSERT INTO `ccard_food_log` VALUES ('210', 'admin', '{\"id\":\"54\",\"name\":\"\\u70e7\\u4e09\\u4e1d\",\"price\":\"4.0\",\"thumb\":\"/Uploads/images/thumb/1503883755.jpg\",\"status\":\"1\",\"update_time\":\"2017-08-31 10:40:44\",\"add_time\":\"2017-08-28 09:29:15\",\"type_id\":\"5\",\"gp_id\":\"3\",\"note\":\"\"}', '编辑', '2017-08-31 15:09:12', null);
INSERT INTO `ccard_food_log` VALUES ('211', 'admin', '{\"name\":\"\\u51c9\\u83dc\",\"type_id\":\"4\",\"price\":\"1.0\",\"thumb\":\"/Uploads/images/thumb/1504165015.jpg\",\"status\":\"1\",\"note\":\"\",\"gp_id\":\"3\",\"update_time\":\"2017-08-31 15:36:59\",\"add_time\":\"2017-08-31 15:36:59\"}', '新增', '2017-08-31 15:36:59', null);
INSERT INTO `ccard_food_log` VALUES ('212', 'admin', '{\"name\":\"\\u9ebb\\u5a46\\u8c46\\u8150\",\"type_id\":\"3\",\"price\":\"4.0\",\"thumb\":\"/Uploads/images/thumb/1504165108.jpg\",\"status\":\"1\",\"note\":\"\",\"gp_id\":\"3\",\"update_time\":\"2017-08-31 15:38:32\",\"add_time\":\"2017-08-31 15:38:32\"}', '新增', '2017-08-31 15:38:32', null);
INSERT INTO `ccard_food_log` VALUES ('213', 'admin', '{\"name\":\"\\u9ec4\\u7116\\u725b\\u8089\",\"type_id\":\"3\",\"price\":\"5.0\",\"thumb\":\"/Uploads/images/thumb/1504165204.jpg\",\"status\":\"1\",\"note\":\"\",\"gp_id\":\"3\",\"update_time\":\"2017-08-31 15:40:07\",\"add_time\":\"2017-08-31 15:40:07\"}', '新增', '2017-08-31 15:40:07', null);
INSERT INTO `ccard_food_log` VALUES ('214', 'admin', '{\"name\":\"\\u82f9\\u679c\",\"type_id\":\"3\",\"price\":\"1\",\"thumb\":\"/Uploads/images/thumb/1504165271.jpg\",\"status\":\"1\",\"note\":\"\",\"gp_id\":\"3\",\"update_time\":\"2017-08-31 15:41:16\",\"add_time\":\"2017-08-31 15:41:16\"}', '新增', '2017-08-31 15:41:16', null);
INSERT INTO `ccard_food_log` VALUES ('215', 'admin', '{\"name\":\"\\u70e7\\u997c\\u5939\\u706b\\u817f\",\"type_id\":\"1\",\"price\":\"3\",\"thumb\":\"/Uploads/images/thumb/1504165356.jpg\",\"status\":\"1\",\"note\":\"\",\"gp_id\":\"3\",\"update_time\":\"2017-08-31 15:42:39\",\"add_time\":\"2017-08-31 15:42:39\"}', '新增', '2017-08-31 15:42:39', null);
INSERT INTO `ccard_food_log` VALUES ('216', 'admin', '{\"id\":\"59\",\"name\":\"\\u84b8\\u9c88\\u9c7c\",\"price\":\"15.0\",\"thumb\":\"/Uploads/images/thumb/1503885580.jpg\",\"status\":\"1\",\"update_time\":\"2017-08-31 10:19:36\",\"add_time\":\"2017-08-28 09:59:40\",\"type_id\":\"5\",\"gp_id\":\"3\",\"note\":\"\"}', '编辑', '2017-08-31 15:43:46', null);
INSERT INTO `ccard_food_log` VALUES ('217', 'admin', '{\"name\":\"\\u7092\\u8c46\\u89d2\",\"type_id\":\"4\",\"price\":\"4\",\"thumb\":\"/Uploads/images/thumb/1504165548.jpg\",\"status\":\"1\",\"note\":\"\",\"gp_id\":\"3\",\"update_time\":\"2017-08-31 15:45:51\",\"add_time\":\"2017-08-31 15:45:51\"}', '新增', '2017-08-31 15:45:51', null);
INSERT INTO `ccard_food_log` VALUES ('218', 'admin', '{\"name\":\"\\u849c\\u82d4\\u7092\\u8089\",\"type_id\":\"4\",\"price\":\"4\",\"thumb\":\"/Uploads/images/thumb/1504165654.jpg\",\"status\":\"1\",\"note\":\"\",\"gp_id\":\"3\",\"update_time\":\"2017-08-31 15:47:37\",\"add_time\":\"2017-08-31 15:47:37\"}', '新增', '2017-08-31 15:47:37', null);
INSERT INTO `ccard_food_log` VALUES ('219', 'admin', '{\"id\":\"87\",\"name\":\"\\u849c\\u82d4\\u7092\\u8089\",\"price\":\"4.0\",\"thumb\":\"/Uploads/images/thumb/1504165654.jpg\",\"status\":\"1\",\"update_time\":\"2017-08-31 15:47:37\",\"add_time\":\"2017-08-31 15:47:37\",\"type_id\":\"4\",\"gp_id\":\"3\",\"note\":\"\"}', '编辑', '2017-09-01 10:10:01', null);
INSERT INTO `ccard_food_log` VALUES ('220', 'admin', '{\"id\":\"87\",\"name\":\"\\u849c\\u82d4\\u7092\\u8089\",\"price\":\"4.0\",\"thumb\":\"/Uploads/images/thumb/1504165654.jpg\",\"status\":\"0\",\"update_time\":\"2017-09-01 10:10:01\",\"add_time\":\"2017-08-31 15:47:37\",\"type_id\":\"4\",\"gp_id\":\"3\",\"note\":\"\"}', '编辑', '2017-09-01 10:12:49', null);
INSERT INTO `ccard_food_log` VALUES ('221', 'admin', '{\"name\":\"\\u756a\\u8304\\u7092\\u9e21\\u86cb\",\"type_id\":\"4\",\"price\":\"6\",\"thumb\":\"/Uploads/images/thumb/1504603407.jpg\",\"status\":\"1\",\"note\":\"\",\"gp_id\":\"3\",\"update_time\":\"2017-09-05 17:23:55\",\"add_time\":\"2017-09-05 17:23:55\"}', '新增', '2017-09-05 17:23:55', null);
INSERT INTO `ccard_food_log` VALUES ('222', 'admin', '{\"id\":\"88\",\"name\":\"\\u756a\\u8304\\u7092\\u9e21\\u86cb\",\"price\":\"6.0\",\"thumb\":\"/Uploads/images/thumb/1504603407.jpg\",\"status\":\"1\",\"update_time\":\"2017-09-05 17:23:55\",\"add_time\":\"2017-09-05 17:23:55\",\"type_id\":\"4\",\"gp_id\":\"3\",\"note\":\"\"}', '编辑', '2017-09-05 17:25:43', null);
INSERT INTO `ccard_food_log` VALUES ('223', 'admin', '{\"id\":\"88\",\"name\":\"\\u9e21\\u86cb\\u7092\\u756a\\u8304\",\"price\":\"6.0\",\"thumb\":\"/Uploads/images/thumb/1504603407.jpg\",\"status\":\"1\",\"update_time\":\"2017-09-05 17:25:43\",\"add_time\":\"2017-09-05 17:23:55\",\"type_id\":\"4\",\"gp_id\":\"3\",\"note\":\"\"}', '删除', '2017-09-05 17:26:23', null);
INSERT INTO `ccard_food_log` VALUES ('224', 'xingrong', '{\"name\":\"yan jianrou\",\"type_id\":\"4\",\"price\":\"6\",\"status\":1,\"gp_id\":\"3\",\"update_time\":\"2017-09-05 17:31:34\",\"add_time\":\"2017-09-05 17:31:34\",\"thumb\":\"/Uploads/images/thumb/1504603894.jpg\"}', '增加', '2017-09-05 17:31:34', 'app-');
INSERT INTO `ccard_food_log` VALUES ('225', 'xingrong', '{\"name\":\"\\u5dee\\u4e0d\\u591a\",\"type_id\":\"1\",\"price\":\"1\",\"status\":1,\"gp_id\":\"3\",\"update_time\":\"2017-09-06 08:50:07\",\"add_time\":\"2017-09-06 08:50:07\",\"thumb\":\"/Uploads/images/thumb/1504659007.jpg\"}', '增加', '2017-09-06 08:50:07', 'app-');
INSERT INTO `ccard_food_log` VALUES ('226', 'admin', '{\"id\":\"58\",\"name\":\"\\u714e\\u997a\",\"price\":\"2.0\",\"thumb\":\"/Uploads/images/thumb/1503885505.jpg\",\"status\":\"1\",\"update_time\":\"2017-08-28 09:58:25\",\"add_time\":\"2017-08-28 09:58:25\",\"type_id\":\"3\",\"gp_id\":\"2\",\"note\":\"\"}', '编辑', '2017-09-06 09:43:49', null);
INSERT INTO `ccard_food_log` VALUES ('227', 'admin', '{\"id\":\"58\",\"name\":\"\\u714e\\u997a\",\"price\":\"4.0\",\"thumb\":\"/Uploads/images/thumb/1503885505.jpg\",\"status\":\"1\",\"update_time\":\"2017-09-06 09:43:49\",\"add_time\":\"2017-08-28 09:58:25\",\"type_id\":\"3\",\"gp_id\":\"3\",\"note\":\"\"}', '编辑', '2017-09-06 09:44:02', null);
INSERT INTO `ccard_food_log` VALUES ('228', 'admin', '{\"id\":\"83\",\"name\":\"\\u9ec4\\u7116\\u725b\\u8089\",\"price\":\"5.0\",\"thumb\":\"/Uploads/images/thumb/1504165204.jpg\",\"status\":\"1\",\"update_time\":\"2017-08-31 15:40:07\",\"add_time\":\"2017-08-31 15:40:07\",\"type_id\":\"3\",\"gp_id\":\"3\",\"note\":\"\"}', '编辑', '2017-09-06 09:44:17', null);
INSERT INTO `ccard_food_log` VALUES ('229', 'admin', '{\"id\":\"82\",\"name\":\"\\u9ebb\\u5a46\\u8c46\\u8150\",\"price\":\"4.0\",\"thumb\":\"/Uploads/images/thumb/1504165108.jpg\",\"status\":\"1\",\"update_time\":\"2017-08-31 15:38:32\",\"add_time\":\"2017-08-31 15:38:32\",\"type_id\":\"3\",\"gp_id\":\"3\",\"note\":\"\"}', '编辑', '2017-09-06 09:44:26', null);
INSERT INTO `ccard_food_log` VALUES ('230', 'admin', '{\"name\":\"\\u7cd6\\u918b\\u91cc\\u810a\",\"type_id\":\"4\",\"price\":\"4\",\"thumb\":\"/Uploads/images/thumb/1504662402.jpg\",\"status\":\"1\",\"note\":\"\",\"gp_id\":\"3\",\"update_time\":\"2017-09-06 09:46:45\",\"add_time\":\"2017-09-06 09:46:45\"}', '新增', '2017-09-06 09:46:45', null);
INSERT INTO `ccard_food_log` VALUES ('231', 'admin', '{\"name\":\"\\u4ec0\\u9526\\u5c0f\\u7092\",\"type_id\":\"4\",\"price\":\"4\",\"thumb\":\"/Uploads/images/thumb/1504662445.jpg\",\"status\":\"1\",\"note\":\"\",\"gp_id\":\"3\",\"update_time\":\"2017-09-06 09:47:28\",\"add_time\":\"2017-09-06 09:47:28\"}', '新增', '2017-09-06 09:47:28', null);
INSERT INTO `ccard_food_log` VALUES ('232', 'admin', '{\"name\":\"\\u7cd6\\u9165\\u9ca4\\u9c7c\",\"type_id\":\"3\",\"price\":\"4\",\"thumb\":\"/Uploads/images/thumb/1504663012.jpg\",\"status\":\"1\",\"note\":\"\",\"gp_id\":\"3\",\"update_time\":\"2017-09-06 09:56:58\",\"add_time\":\"2017-09-06 09:56:58\"}', '新增', '2017-09-06 09:56:58', null);
INSERT INTO `ccard_food_log` VALUES ('233', 'admin', '{\"name\":\"\\u9999\\u751c\\u7389\\u7c73\\u7c92\",\"type_id\":\"3\",\"price\":\"4\",\"thumb\":\"/Uploads/images/thumb/1504663648.jpg\",\"status\":\"1\",\"note\":\"\",\"gp_id\":\"3\",\"update_time\":\"2017-09-06 10:07:33\",\"add_time\":\"2017-09-06 10:07:33\"}', '新增', '2017-09-06 10:07:33', null);
INSERT INTO `ccard_food_log` VALUES ('234', 'xingrong', '{\"name\":\"\\u756a\\u8304\\u7092\\u86cb\",\"type_id\":\"4\",\"price\":\"2\",\"status\":1,\"gp_id\":\"3\",\"update_time\":\"2017-09-06 11:24:56\",\"add_time\":\"2017-09-06 11:24:56\",\"thumb\":\"/Uploads/images/thumb/1504668296.jpg\"}', '增加', '2017-09-06 11:24:56', 'app-');
INSERT INTO `ccard_food_log` VALUES ('235', 'admin', '{\"id\":\"95\",\"name\":\"\\u756a\\u8304\\u7092\\u86cb\",\"price\":\"2.0\",\"thumb\":\"/Uploads/images/thumb/1504668296.jpg\",\"status\":\"1\",\"update_time\":\"2017-09-06 11:24:56\",\"add_time\":\"2017-09-06 11:24:56\",\"type_id\":\"4\",\"gp_id\":\"3\",\"note\":\"\"}', '删除', '2017-09-06 11:26:26', null);
INSERT INTO `ccard_food_log` VALUES ('236', 'admin', '{\"name\":\"\\u756a\\u8304\\u7092\\u9e21\\u86cb\",\"type_id\":\"2\",\"price\":\"5\",\"thumb\":\"/Uploads/images/thumb/1504668489.jpg\",\"status\":\"1\",\"note\":\"\",\"gp_id\":\"3\",\"update_time\":\"2017-09-06 11:28:15\",\"add_time\":\"2017-09-06 11:28:15\"}', '新增', '2017-09-06 11:28:15', null);
INSERT INTO `ccard_food_log` VALUES ('237', 'admin', '{\"id\":\"96\",\"name\":\"\\u756a\\u8304\\u7092\\u9e21\\u86cb\",\"price\":\"5.0\",\"thumb\":\"/Uploads/images/thumb/1504668489.jpg\",\"status\":\"1\",\"update_time\":\"2017-09-06 11:28:15\",\"add_time\":\"2017-09-06 11:28:15\",\"type_id\":\"2\",\"gp_id\":\"3\",\"note\":\"\"}', '编辑', '2017-09-06 11:28:45', null);
INSERT INTO `ccard_food_log` VALUES ('238', 'admin', '{\"id\":\"89\",\"name\":\"yan jianrou\",\"price\":\"6.0\",\"thumb\":\"/Uploads/images/thumb/1504603894.jpg\",\"status\":\"1\",\"update_time\":\"2017-09-05 17:31:34\",\"add_time\":\"2017-09-05 17:31:34\",\"type_id\":\"4\",\"gp_id\":\"3\",\"note\":\"\"}', '编辑', '2017-09-06 11:35:30', null);
INSERT INTO `ccard_food_log` VALUES ('239', 'admin', '{\"id\":\"90\",\"name\":\"\\u5dee\\u4e0d\\u591a\",\"price\":\"1.0\",\"thumb\":\"/Uploads/images/thumb/1504659007.jpg\",\"status\":\"1\",\"update_time\":\"2017-09-06 08:50:07\",\"add_time\":\"2017-09-06 08:50:07\",\"type_id\":\"1\",\"gp_id\":\"3\",\"note\":\"\"}', '编辑', '2017-09-06 11:36:27', null);
INSERT INTO `ccard_food_log` VALUES ('240', 'xingrong', '{\"name\":\"\\u756a\\u8304\\u7092\\u86cb\",\"type_id\":\"4\",\"price\":\"6\",\"status\":1,\"gp_id\":\"3\",\"update_time\":\"2017-09-06 14:14:27\",\"add_time\":\"2017-09-06 14:14:27\",\"thumb\":\"/Uploads/images/thumb/1504678467.jpg\"}', '增加', '2017-09-06 14:14:27', 'app-');
INSERT INTO `ccard_food_log` VALUES ('241', 'xingrong', '{\"name\":\"\\u897f\\u7ea2\\u67ff\",\"type_id\":\"4\",\"price\":\"6\",\"thumb\":\"/Uploads/images/thumb/1504678629.jpg\",\"status\":\"1\",\"note\":\"\",\"gp_id\":\"3\",\"update_time\":\"2017-09-06 14:17:13\",\"add_time\":\"2017-09-06 14:17:13\"}', '新增', '2017-09-06 14:17:13', null);
INSERT INTO `ccard_food_log` VALUES ('242', 'xingrong', '{\"name\":\"\'\'\'\",\"type_id\":\"5\",\"price\":\"6\",\"status\":1,\"gp_id\":\"3\",\"update_time\":\"2017-09-06 16:08:49\",\"add_time\":\"2017-09-06 16:08:49\",\"thumb\":\"/Uploads/images/thumb/1504685329.jpg\"}', '增加', '2017-09-06 16:08:49', 'app-');
INSERT INTO `ccard_food_log` VALUES ('243', 'xingrong', '{\"name\":\"\\u5730\\u74dc\\u7ca5\",\"type_id\":\"4\",\"price\":\"2\",\"status\":1,\"gp_id\":\"3\",\"update_time\":\"2017-09-07 09:12:31\",\"add_time\":\"2017-09-07 09:12:31\",\"thumb\":\"/Uploads/images/thumb/1504746751.jpg\"}', '增加', '2017-09-07 09:12:31', 'app-');
INSERT INTO `ccard_food_log` VALUES ('244', 'xingrong', '{\"name\":\"\\u540c\\u5b50\\u8089\",\"type_id\":\"4\",\"price\":\"2\",\"status\":1,\"gp_id\":\"3\",\"update_time\":\"2017-09-07 09:17:10\",\"add_time\":\"2017-09-07 09:17:10\",\"thumb\":\"/Uploads/images/thumb/1504747030.jpg\"}', '增加', '2017-09-07 09:17:10', 'app-');
INSERT INTO `ccard_food_log` VALUES ('245', 'xingrong', '{\"name\":\"\\u725b\\u8089\",\"type_id\":\"4\",\"price\":\"2\",\"status\":1,\"gp_id\":\"3\",\"update_time\":\"2017-09-07 09:20:46\",\"add_time\":\"2017-09-07 09:20:46\",\"thumb\":\"/Uploads/images/thumb/1504747246.jpg\"}', '增加', '2017-09-07 09:20:46', 'app-');
INSERT INTO `ccard_food_log` VALUES ('246', 'xingrong', '{\"name\":\"\\u2192_\\u2192\",\"type_id\":\"4\",\"price\":\"1\",\"status\":1,\"gp_id\":\"3\",\"update_time\":\"2017-09-07 09:22:37\",\"add_time\":\"2017-09-07 09:22:37\",\"thumb\":\"/Uploads/images/thumb/1504747357.jpg\"}', '增加', '2017-09-07 09:22:37', 'app-');
INSERT INTO `ccard_food_log` VALUES ('247', 'admin', '{\"id\":\"103\",\"name\":\"\\u2192_\\u2192\",\"price\":\"1.0\",\"thumb\":\"/Uploads/images/thumb/1504747357.jpg\",\"status\":\"1\",\"update_time\":\"2017-09-07 09:22:37\",\"add_time\":\"2017-09-07 09:22:37\",\"type_id\":\"4\",\"gp_id\":\"3\",\"note\":\"\"}', '编辑', '2017-09-07 09:24:28', null);
INSERT INTO `ccard_food_log` VALUES ('248', 'admin', '{\"id\":\"103\",\"name\":\"\\u2192_\\u2192\",\"price\":\"1.0\",\"thumb\":\"/Uploads/images/thumb/1504747357.jpg\",\"status\":\"0\",\"update_time\":\"2017-09-07 09:24:28\",\"add_time\":\"2017-09-07 09:22:37\",\"type_id\":\"4\",\"gp_id\":\"3\",\"note\":\"\"}', '编辑', '2017-09-07 09:24:47', null);
INSERT INTO `ccard_food_log` VALUES ('249', 'xingrong', '{\"name\":\"^\\u03c9^\",\"type_id\":\"4\",\"price\":\"1\",\"status\":1,\"gp_id\":\"3\",\"update_time\":\"2017-09-07 09:28:18\",\"add_time\":\"2017-09-07 09:28:18\",\"thumb\":\"/Uploads/images/thumb/1504747698.jpg\"}', '增加', '2017-09-07 09:28:18', 'app-');
INSERT INTO `ccard_food_log` VALUES ('250', 'xingrong', '{\"name\":\"&amp;&amp;%\",\"type_id\":\"4\",\"price\":\"1\",\"status\":1,\"gp_id\":\"3\",\"update_time\":\"2017-09-07 09:31:38\",\"add_time\":\"2017-09-07 09:31:38\",\"thumb\":\"/Uploads/images/thumb/1504747898.jpg\"}', '增加', '2017-09-07 09:31:38', 'app-');
INSERT INTO `ccard_food_log` VALUES ('251', 'admin', '{\"id\":\"103\",\"name\":\"\\u2192_\\u2192\",\"price\":\"1.0\",\"thumb\":\"/Uploads/images/thumb/1504747357.jpg\",\"status\":\"1\",\"update_time\":\"2017-09-07 09:24:47\",\"add_time\":\"2017-09-07 09:22:37\",\"type_id\":\"4\",\"gp_id\":\"3\",\"note\":\"\"}', '删除', '2017-09-07 09:32:25', null);
INSERT INTO `ccard_food_log` VALUES ('252', 'admin', '{\"id\":\"105\",\"name\":\"&amp;&amp;%\",\"price\":\"1.0\",\"thumb\":\"/Uploads/images/thumb/1504747898.jpg\",\"status\":\"1\",\"update_time\":\"2017-09-07 09:31:38\",\"add_time\":\"2017-09-07 09:31:38\",\"type_id\":\"4\",\"gp_id\":\"3\",\"note\":\"\"}', '删除', '2017-09-07 09:32:37', null);
INSERT INTO `ccard_food_log` VALUES ('253', 'admin', '{\"id\":\"104\",\"name\":\"^\\u03c9^\",\"price\":\"1.0\",\"thumb\":\"/Uploads/images/thumb/1504747698.jpg\",\"status\":\"1\",\"update_time\":\"2017-09-07 09:28:18\",\"add_time\":\"2017-09-07 09:28:18\",\"type_id\":\"4\",\"gp_id\":\"3\",\"note\":\"\"}', '删除', '2017-09-07 09:32:40', null);
INSERT INTO `ccard_food_log` VALUES ('254', 'admin', '{\"id\":\"102\",\"name\":\"\\u725b\\u8089\",\"price\":\"2.0\",\"thumb\":\"/Uploads/images/thumb/1504747246.jpg\",\"status\":\"1\",\"update_time\":\"2017-09-07 09:20:46\",\"add_time\":\"2017-09-07 09:20:46\",\"type_id\":\"4\",\"gp_id\":\"3\",\"note\":\"\"}', '删除', '2017-09-07 09:32:45', null);
INSERT INTO `ccard_food_log` VALUES ('255', 'admin', '{\"id\":\"101\",\"name\":\"\\u540c\\u5b50\\u8089\",\"price\":\"2.0\",\"thumb\":\"/Uploads/images/thumb/1504747030.jpg\",\"status\":\"1\",\"update_time\":\"2017-09-07 09:17:10\",\"add_time\":\"2017-09-07 09:17:10\",\"type_id\":\"4\",\"gp_id\":\"3\",\"note\":\"\"}', '删除', '2017-09-07 09:32:48', null);
INSERT INTO `ccard_food_log` VALUES ('256', 'admin', '{\"id\":\"100\",\"name\":\"\\u5730\\u74dc\\u7ca5\",\"price\":\"2.0\",\"thumb\":\"/Uploads/images/thumb/1504746751.jpg\",\"status\":\"1\",\"update_time\":\"2017-09-07 09:12:31\",\"add_time\":\"2017-09-07 09:12:31\",\"type_id\":\"4\",\"gp_id\":\"3\",\"note\":\"\"}', '删除', '2017-09-07 09:32:52', null);
INSERT INTO `ccard_food_log` VALUES ('257', 'admin', '{\"id\":\"99\",\"name\":\"\'\'\'\",\"price\":\"6.0\",\"thumb\":\"/Uploads/images/thumb/1504685329.jpg\",\"status\":\"1\",\"update_time\":\"2017-09-06 16:08:49\",\"add_time\":\"2017-09-06 16:08:49\",\"type_id\":\"5\",\"gp_id\":\"3\",\"note\":\"\"}', '删除', '2017-09-07 09:32:55', null);
INSERT INTO `ccard_food_log` VALUES ('258', 'xingrong', '{\"name\":\"\\u5927\\u5934\",\"type_id\":\"4\",\"price\":\"1\",\"status\":1,\"gp_id\":\"3\",\"update_time\":\"2017-09-07 09:36:44\",\"add_time\":\"2017-09-07 09:36:44\",\"thumb\":\"/Uploads/images/thumb/1504748204.jpg\"}', '增加', '2017-09-07 09:36:44', 'app-');
INSERT INTO `ccard_food_log` VALUES ('259', 'xingrong', '{\"name\":\"\\u9752\\u83dc\",\"type_id\":\"3\",\"price\":\"2\",\"status\":1,\"gp_id\":\"3\",\"update_time\":\"2017-09-15 11:29:00\",\"add_time\":\"2017-09-15 11:29:00\",\"thumb\":\"/Uploads/images/thumb/1505446141.jpg\"}', '增加', '2017-09-15 11:29:01', 'app-');
INSERT INTO `ccard_food_log` VALUES ('260', 'xingrong', '{\"name\":\"\\u7eff\\u841d\",\"type_id\":\"3\",\"price\":\"5\",\"status\":1,\"gp_id\":\"3\",\"update_time\":\"2017-09-22 08:39:58\",\"add_time\":\"2017-09-22 08:39:58\",\"thumb\":\"/Uploads/images/thumb/1506040798.jpg\"}', '增加', '2017-09-22 08:39:59', 'app-');
INSERT INTO `ccard_food_log` VALUES ('261', 'admin', '{\"name\":\"\\u725b\\u8089\\u5821\",\"type_id\":\"6\",\"price\":\"6\",\"thumb\":\"/Uploads/images/thumb/1506329314.jpg\",\"status\":\"1\",\"note\":\"\",\"gp_id\":\"3\",\"update_time\":\"2017-09-25 16:49:45\",\"add_time\":\"2017-09-25 16:49:45\"}', '新增', '2017-09-25 16:49:45', null);
INSERT INTO `ccard_food_log` VALUES ('262', 'admin', '{\"name\":\"\\u9ec4\\u91d1\\u6625\\u5377\\uff088\\u4e2a\\uff09\",\"type_id\":\"6\",\"price\":\"5\",\"thumb\":\"/Uploads/images/thumb/1506329579.jpg\",\"status\":\"1\",\"note\":\"\",\"gp_id\":\"3\",\"update_time\":\"2017-09-25 16:53:49\",\"add_time\":\"2017-09-25 16:53:49\"}', '新增', '2017-09-25 16:53:49', null);
INSERT INTO `ccard_food_log` VALUES ('263', 'admin', '{\"name\":\"\\u8299\\u84c9\\u87f9\\u68d2\\uff082\\u6839\\uff09\",\"type_id\":\"6\",\"price\":\"5\",\"thumb\":\"/Uploads/images/thumb/1506330333.jpg\",\"status\":\"1\",\"note\":\"\",\"gp_id\":\"3\",\"update_time\":\"2017-09-25 17:05:39\",\"add_time\":\"2017-09-25 17:05:39\"}', '新增', '2017-09-25 17:05:39', null);
INSERT INTO `ccard_food_log` VALUES ('264', 'admin', '{\"name\":\"\\u85af\\u6761\",\"type_id\":\"6\",\"price\":\"4\",\"thumb\":\"/Uploads/images/thumb/1506330372.jpg\",\"status\":\"1\",\"note\":\"\",\"gp_id\":\"3\",\"update_time\":\"2017-09-25 17:06:20\",\"add_time\":\"2017-09-25 17:06:20\"}', '新增', '2017-09-25 17:06:20', null);
INSERT INTO `ccard_food_log` VALUES ('265', 'admin', '{\"name\":\"\\u9e21\\u817f\\u5821\",\"type_id\":\"6\",\"price\":\"5\",\"thumb\":\"/Uploads/images/thumb/1506330452.jpg\",\"status\":\"1\",\"note\":\"\",\"gp_id\":\"3\",\"update_time\":\"2017-09-25 17:07:35\",\"add_time\":\"2017-09-25 17:07:35\"}', '新增', '2017-09-25 17:07:35', null);
INSERT INTO `ccard_food_log` VALUES ('266', 'admin', '{\"name\":\"\\u9e21\\u817f\",\"type_id\":\"6\",\"price\":\"4\",\"thumb\":\"/Uploads/images/thumb/1506330487.jpg\",\"status\":\"1\",\"note\":\"\",\"gp_id\":\"3\",\"update_time\":\"2017-09-25 17:08:12\",\"add_time\":\"2017-09-25 17:08:12\"}', '新增', '2017-09-25 17:08:12', null);
INSERT INTO `ccard_food_log` VALUES ('267', 'admin', '{\"name\":\"\\u9999\\u828b\\u5730\\u74dc\\u4e38\\uff086\\u4e2a\\uff09\",\"type_id\":\"6\",\"price\":\"4.5\",\"thumb\":\"/Uploads/images/thumb/1506330546.jpg\",\"status\":\"1\",\"note\":\"\",\"gp_id\":\"3\",\"update_time\":\"2017-09-25 17:09:09\",\"add_time\":\"2017-09-25 17:09:09\"}', '新增', '2017-09-25 17:09:09', null);
INSERT INTO `ccard_food_log` VALUES ('268', 'xingrong', '{\"name\":\"\\u6708\\u997c\",\"type_id\":\"5\",\"price\":\"11\",\"status\":1,\"gp_id\":\"3\",\"update_time\":\"2017-09-26 15:19:21\",\"add_time\":\"2017-09-26 15:19:21\",\"thumb\":\"/Uploads/images/thumb/1506410361.jpg\"}', '增加', '2017-09-26 15:19:22', 'app-');
INSERT INTO `ccard_food_log` VALUES ('269', 'xingrong', '{\"name\":\"\\u6c49\\u5821\\u738b\",\"type_id\":\"6\",\"price\":\"21\",\"status\":1,\"gp_id\":\"3\",\"update_time\":\"2017-09-26 15:23:16\",\"add_time\":\"2017-09-26 15:23:16\",\"thumb\":\"/Uploads/images/thumb/1506410596.jpg\"}', '增加', '2017-09-26 15:23:16', 'app-');
INSERT INTO `ccard_food_log` VALUES ('270', 'xingrong', '{\"name\":\"\\u738b\\u8001\\u5409\",\"type_id\":\"6\",\"price\":\"2.5\",\"status\":1,\"gp_id\":\"3\",\"update_time\":\"2017-09-26 15:24:19\",\"add_time\":\"2017-09-26 15:24:19\",\"thumb\":\"/Uploads/images/thumb/1506410659.jpg\"}', '增加', '2017-09-26 15:24:19', 'app-');
INSERT INTO `ccard_food_log` VALUES ('271', 'xingrong', '{\"name\":\"\\u4e2d\\u79cb\\u6708\\u997c\",\"type_id\":\"6\",\"price\":\"6\",\"status\":1,\"gp_id\":\"3\",\"update_time\":\"2017-09-26 15:25:45\",\"add_time\":\"2017-09-26 15:25:45\",\"thumb\":\"/Uploads/images/thumb/1506410745.jpg\"}', '增加', '2017-09-26 15:25:45', 'app-');
INSERT INTO `ccard_food_log` VALUES ('272', 'xingrong', '{\"name\":\"aa\",\"type_id\":\"6\",\"price\":\"6\",\"status\":1,\"gp_id\":\"3\",\"update_time\":\"2017-09-26 15:27:06\",\"add_time\":\"2017-09-26 15:27:06\",\"thumb\":\"/Uploads/images/thumb/1506410826.jpg\"}', '增加', '2017-09-26 15:27:06', 'app-');
INSERT INTO `ccard_food_log` VALUES ('273', 'xingrong', '{\"name\":\"\\u8fd8\",\"type_id\":\"6\",\"price\":\"9\",\"status\":1,\"gp_id\":\"3\",\"update_time\":\"2017-09-26 15:27:58\",\"add_time\":\"2017-09-26 15:27:58\",\"thumb\":\"/Uploads/images/thumb/1506410878.jpg\"}', '增加', '2017-09-26 15:27:58', 'app-');
INSERT INTO `ccard_food_log` VALUES ('274', 'admin', '{\"id\":\"10\",\"name\":\"\\u738b\\u8001\\u5409\",\"price\":\"2.5\",\"thumb\":\"/Uploads/images/thumb/1506410659.jpg\",\"status\":\"1\",\"update_time\":\"2017-09-26 15:24:19\",\"add_time\":\"2017-09-26 15:24:19\",\"type_id\":\"6\",\"gp_id\":\"3\",\"note\":\"\"}', '删除', '2017-09-26 15:42:56', null);
INSERT INTO `ccard_food_log` VALUES ('275', 'admin', '{\"id\":\"12\",\"name\":\"aa\",\"price\":\"6.0\",\"thumb\":\"/Uploads/images/thumb/1506410826.jpg\",\"status\":\"1\",\"update_time\":\"2017-09-26 15:27:06\",\"add_time\":\"2017-09-26 15:27:06\",\"type_id\":\"6\",\"gp_id\":\"3\",\"note\":\"\"}', '删除', '2017-09-26 15:43:00', null);
INSERT INTO `ccard_food_log` VALUES ('276', 'admin', '{\"id\":\"13\",\"name\":\"\\u8fd8\",\"price\":\"9.0\",\"thumb\":\"/Uploads/images/thumb/1506410878.jpg\",\"status\":\"1\",\"update_time\":\"2017-09-26 15:27:58\",\"add_time\":\"2017-09-26 15:27:58\",\"type_id\":\"6\",\"gp_id\":\"3\",\"note\":\"\"}', '删除', '2017-09-26 15:43:04', null);
INSERT INTO `ccard_food_log` VALUES ('277', 'admin', '{\"id\":\"11\",\"name\":\"\\u4e2d\\u79cb\\u6708\\u997c\",\"price\":\"6.0\",\"thumb\":\"/Uploads/images/thumb/1506410745.jpg\",\"status\":\"1\",\"update_time\":\"2017-09-26 15:25:45\",\"add_time\":\"2017-09-26 15:25:45\",\"type_id\":\"6\",\"gp_id\":\"3\",\"note\":\"\"}', '删除', '2017-09-26 15:43:13', null);
INSERT INTO `ccard_food_log` VALUES ('278', 'admin', '{\"id\":\"9\",\"name\":\"\\u6c49\\u5821\\u738b\",\"price\":\"21.0\",\"thumb\":\"/Uploads/images/thumb/1506410596.jpg\",\"status\":\"1\",\"update_time\":\"2017-09-26 15:23:16\",\"add_time\":\"2017-09-26 15:23:16\",\"type_id\":\"6\",\"gp_id\":\"3\",\"note\":\"\"}', '删除', '2017-09-26 15:43:17', null);
INSERT INTO `ccard_food_log` VALUES ('279', 'admin', '{\"id\":\"8\",\"name\":\"\\u6708\\u997c\",\"price\":\"11.0\",\"thumb\":\"/Uploads/images/thumb/1506410361.jpg\",\"status\":\"1\",\"update_time\":\"2017-09-26 15:19:21\",\"add_time\":\"2017-09-26 15:19:21\",\"type_id\":\"5\",\"gp_id\":\"3\",\"note\":\"\"}', '删除', '2017-09-26 15:43:20', null);
INSERT INTO `ccard_food_log` VALUES ('280', 'xingrong', '{\"name\":\"\\u54c8\\u554a\",\"type_id\":\"6\",\"price\":\"9\",\"status\":1,\"gp_id\":\"3\",\"update_time\":\"2017-09-26 15:49:02\",\"add_time\":\"2017-09-26 15:49:02\",\"thumb\":\"/Uploads/images/thumb/1506412142.jpg\"}', '增加', '2017-09-26 15:49:02', 'app-');
INSERT INTO `ccard_food_log` VALUES ('281', 'admin', '{\"id\":\"14\",\"name\":\"\\u54c8\\u554a\",\"price\":\"9.0\",\"thumb\":\"/Uploads/images/thumb/1506412142.jpg\",\"status\":\"1\",\"update_time\":\"2017-09-26 15:49:02\",\"add_time\":\"2017-09-26 15:49:02\",\"type_id\":\"6\",\"gp_id\":\"3\",\"note\":\"\"}', '删除', '2017-09-26 15:49:31', null);
INSERT INTO `ccard_food_log` VALUES ('282', 'xingrong', '{\"name\":\"\\u554a\\u554a\\u554a\",\"type_id\":\"6\",\"price\":\"3.5\",\"status\":1,\"gp_id\":\"3\",\"update_time\":\"2017-09-26 15:50:17\",\"add_time\":\"2017-09-26 15:50:17\",\"thumb\":\"/Uploads/images/thumb/1506412217.jpg\"}', '增加', '2017-09-26 15:50:17', 'app-');
INSERT INTO `ccard_food_log` VALUES ('283', 'admin', '{\"id\":\"15\",\"name\":\"\\u554a\\u554a\\u554a\",\"price\":\"3.5\",\"thumb\":\"/Uploads/images/thumb/1506412217.jpg\",\"status\":\"1\",\"update_time\":\"2017-09-26 15:50:17\",\"add_time\":\"2017-09-26 15:50:17\",\"type_id\":\"6\",\"gp_id\":\"3\",\"note\":\"\"}', '删除', '2017-09-26 15:50:31', null);
INSERT INTO `ccard_food_log` VALUES ('284', 'admin', '{\"id\":\"7\",\"name\":\"\\u9999\\u828b\\u5730\\u74dc\\u4e38\\uff086\\u4e2a\\uff09\",\"price\":\"4.5\",\"thumb\":\"/Uploads/images/thumb/1506330546.jpg\",\"status\":\"1\",\"update_time\":\"2017-09-25 17:09:09\",\"add_time\":\"2017-09-25 17:09:09\",\"type_id\":\"6\",\"gp_id\":\"3\",\"note\":\"\"}', '编辑', '2017-09-26 15:51:05', null);
INSERT INTO `ccard_food_log` VALUES ('285', 'admin', '{\"id\":\"7\",\"name\":\"\\u9999\\u828b\\u5730\\u74dc\\u4e38\\uff086\\u4e2a\\uff09\",\"price\":\"4.5\",\"thumb\":\"/Uploads/images/thumb/1506330546.jpg\",\"status\":\"0\",\"update_time\":\"2017-09-26 15:51:05\",\"add_time\":\"2017-09-25 17:09:09\",\"type_id\":\"6\",\"gp_id\":\"3\",\"note\":\"\"}', '编辑', '2017-09-26 15:51:30', null);
INSERT INTO `ccard_food_log` VALUES ('286', 'admin', '{\"id\":\"15\",\"name\":\"\\u554a\\u554a\\u554a\",\"price\":\"3.5\",\"thumb\":\"/Uploads/images/thumb/1506412217.jpg\",\"status\":\"1\",\"update_time\":\"2017-09-26 15:52:17\",\"add_time\":\"2017-09-26 15:50:17\",\"type_id\":\"6\",\"gp_id\":\"3\",\"note\":\"\"}', '删除', '2017-09-26 15:55:15', null);
INSERT INTO `ccard_food_log` VALUES ('287', 'admin', '{\"id\":\"15\",\"name\":\"\\u554a\\u554a\\u554a\",\"price\":\"3.5\",\"thumb\":\"/Uploads/images/thumb/1506412217.jpg\",\"status\":\"1\",\"update_time\":\"2017-09-26 15:58:17\",\"add_time\":\"2017-09-26 15:50:17\",\"type_id\":\"6\",\"gp_id\":\"3\",\"note\":\"\"}', '编辑', '2017-09-26 15:59:53', null);
INSERT INTO `ccard_food_log` VALUES ('288', 'admin', '{\"id\":\"15\",\"name\":\"\\u554a\\u554a\\u554a\",\"price\":\"3.5\",\"thumb\":\"/Uploads/images/thumb/1506412217.jpg\",\"status\":\"0\",\"update_time\":\"2017-09-26 15:59:53\",\"add_time\":\"2017-09-26 15:50:17\",\"type_id\":\"6\",\"gp_id\":\"3\",\"note\":\"\"}', '编辑', '2017-09-26 16:00:21', null);
INSERT INTO `ccard_food_log` VALUES ('289', 'admin', '{\"id\":\"15\",\"name\":\"\\u554a\\u554a\\u554a\",\"price\":\"3.5\",\"thumb\":\"/Uploads/images/thumb/1506412217.jpg\",\"status\":\"1\",\"update_time\":\"2017-09-26 16:00:21\",\"add_time\":\"2017-09-26 15:50:17\",\"type_id\":\"6\",\"gp_id\":\"3\",\"note\":\"\"}', '编辑', '2017-09-26 16:01:41', null);
INSERT INTO `ccard_food_log` VALUES ('290', 'admin', '{\"id\":\"14\",\"name\":\"\\u54c8\\u554a\",\"price\":\"9.0\",\"thumb\":\"/Uploads/images/thumb/1506412142.jpg\",\"status\":\"1\",\"update_time\":\"2017-09-26 15:52:17\",\"add_time\":\"2017-09-26 15:49:02\",\"type_id\":\"6\",\"gp_id\":\"3\",\"note\":\"\"}', '编辑', '2017-09-26 16:01:49', null);
INSERT INTO `ccard_food_log` VALUES ('291', 'admin', '{\"id\":\"13\",\"name\":\"\\u8fd8\",\"price\":\"9.0\",\"thumb\":\"/Uploads/images/thumb/1506410878.jpg\",\"status\":\"1\",\"update_time\":\"2017-09-26 15:52:17\",\"add_time\":\"2017-09-26 15:27:58\",\"type_id\":\"6\",\"gp_id\":\"3\",\"note\":\"\"}', '编辑', '2017-09-26 16:01:57', null);
INSERT INTO `ccard_food_log` VALUES ('292', 'admin', '{\"id\":\"12\",\"name\":\"aa\",\"price\":\"6.0\",\"thumb\":\"/Uploads/images/thumb/1506410826.jpg\",\"status\":\"1\",\"update_time\":\"2017-09-26 15:52:17\",\"add_time\":\"2017-09-26 15:27:06\",\"type_id\":\"6\",\"gp_id\":\"3\",\"note\":\"\"}', '编辑', '2017-09-26 16:02:08', null);
INSERT INTO `ccard_food_log` VALUES ('293', 'admin', '{\"id\":\"11\",\"name\":\"\\u4e2d\\u79cb\\u6708\\u997c\",\"price\":\"6.0\",\"thumb\":\"/Uploads/images/thumb/1506410745.jpg\",\"status\":\"1\",\"update_time\":\"2017-09-26 15:52:17\",\"add_time\":\"2017-09-26 15:25:45\",\"type_id\":\"6\",\"gp_id\":\"3\",\"note\":\"\"}', '编辑', '2017-09-26 16:02:20', null);
INSERT INTO `ccard_food_log` VALUES ('294', 'admin', '{\"id\":\"10\",\"name\":\"\\u738b\\u8001\\u5409\",\"price\":\"2.5\",\"thumb\":\"/Uploads/images/thumb/1506410659.jpg\",\"status\":\"1\",\"update_time\":\"2017-09-26 15:52:17\",\"add_time\":\"2017-09-26 15:24:19\",\"type_id\":\"6\",\"gp_id\":\"3\",\"note\":\"\"}', '编辑', '2017-09-26 16:02:28', null);
INSERT INTO `ccard_food_log` VALUES ('295', 'xingrong', '{\"id\":\"10\",\"name\":\"\\u738b\\u8001\\u5409\",\"price\":\"2.5\",\"thumb\":\"/Uploads/images/thumb/1506410659.jpg\",\"status\":\"0\",\"update_time\":\"2017-09-26 16:02:28\",\"add_time\":\"2017-09-26 15:24:19\",\"type_id\":\"6\",\"gp_id\":\"3\",\"note\":\"\"}', '编辑', '2017-10-11 14:50:43', null);
INSERT INTO `ccard_food_log` VALUES ('296', 'xingrong', '{\"id\":\"10\",\"name\":\"\\u738b\\u8001\\u5409\",\"price\":\"2.5\",\"thumb\":\"/Uploads/images/thumb/1506410659.jpg\",\"status\":\"1\",\"update_time\":\"2017-10-11 14:50:43\",\"add_time\":\"2017-09-26 15:24:19\",\"type_id\":\"6\",\"gp_id\":\"3\",\"note\":\"\"}', '编辑', '2017-10-11 14:50:59', null);
INSERT INTO `ccard_food_log` VALUES ('297', 'xingrong', '{\"id\":\"10\",\"name\":\"\\u738b\\u8001\\u5409\",\"price\":\"4.0\",\"thumb\":\"/Uploads/images/thumb/1506410659.jpg\",\"status\":\"1\",\"update_time\":\"2017-10-11 14:50:59\",\"add_time\":\"2017-09-26 15:24:19\",\"type_id\":\"6\",\"gp_id\":\"3\",\"note\":\"\"}', '编辑', '2017-10-11 14:51:59', null);
INSERT INTO `ccard_food_log` VALUES ('298', 'admin', '{\"id\":\"15\",\"name\":\"\\u554a\\u554a\\u554a\",\"price\":\"3.5\",\"thumb\":\"/Uploads/images/thumb/1506412217.jpg\",\"status\":\"0\",\"update_time\":\"2017-09-26 16:01:41\",\"add_time\":\"2017-09-26 15:50:17\",\"type_id\":\"6\",\"gp_id\":\"3\",\"note\":\"\"}', '编辑', '2017-10-11 16:53:20', null);
INSERT INTO `ccard_food_log` VALUES ('299', 'admin', '{\"id\":\"15\",\"name\":\"\\u554a\\u554a\\u554a\",\"price\":\"3.5\",\"thumb\":\"/Uploads/images/thumb/1506412217.jpg\",\"status\":\"1\",\"update_time\":\"2017-10-11 16:53:20\",\"add_time\":\"2017-09-26 15:50:17\",\"type_id\":\"6\",\"gp_id\":\"3\",\"note\":\"\"}', '编辑', '2017-10-12 14:16:53', null);
INSERT INTO `ccard_food_log` VALUES ('300', 'admin', '{\"name\":\"\\u9999\\u828b\\u5730\\u74dc\\u4e38\\uff088\\u4e2a\\uff09\",\"type_id\":\"6\",\"price\":\"6\",\"thumb\":\"\",\"status\":\"1\",\"note\":\"\",\"gp_id\":\"3\",\"update_time\":\"2017-10-12 15:56:37\",\"add_time\":\"2017-10-12 15:56:37\"}', '新增', '2017-10-12 15:56:37', null);
INSERT INTO `ccard_food_log` VALUES ('301', 'admin', '{\"id\":\"16\",\"name\":\"\\u9999\\u828b\\u5730\\u74dc\\u4e38\\uff088\\u4e2a\\uff09\",\"price\":\"6.0\",\"thumb\":\"\",\"status\":\"1\",\"update_time\":\"2017-10-12 15:56:37\",\"add_time\":\"2017-10-12 15:56:37\",\"type_id\":\"6\",\"gp_id\":\"3\",\"note\":\"\"}', '编辑', '2017-10-12 16:16:45', null);
INSERT INTO `ccard_food_log` VALUES ('302', 'admin', '{\"id\":\"16\",\"name\":\"\\u9999\\u828b\\u5730\\u74dc\\u4e38\\uff088\\u4e2a\\uff09\",\"price\":\"6.0\",\"thumb\":\"/Uploads/images/thumb/1507796203.png\",\"status\":\"1\",\"update_time\":\"2017-10-12 16:16:45\",\"add_time\":\"2017-10-12 15:56:37\",\"type_id\":\"6\",\"gp_id\":\"3\",\"note\":\"\"}', '编辑', '2017-10-12 16:19:27', null);
INSERT INTO `ccard_food_log` VALUES ('303', 'admin', '{\"id\":\"16\",\"name\":\"\\u9999\\u828b\\u5730\\u74dc\\u4e38\\uff088\\u4e2a\\uff09\",\"price\":\"6.0\",\"thumb\":\"/Uploads/images/thumb/1507796362.png\",\"status\":\"1\",\"update_time\":\"2017-10-12 16:19:27\",\"add_time\":\"2017-10-12 15:56:37\",\"type_id\":\"6\",\"gp_id\":\"3\",\"note\":\"\"}', '编辑', '2017-10-12 16:33:44', null);
INSERT INTO `ccard_food_log` VALUES ('304', 'admin', '{\"id\":\"16\",\"name\":\"\\u9999\\u828b\\u5730\\u74dc\\u4e38\\uff088\\u4e2a\\uff09\",\"price\":\"6.0\",\"thumb\":\"/Uploads/images/thumb/1507797218.jpg\",\"status\":\"1\",\"update_time\":\"2017-10-12 16:33:44\",\"add_time\":\"2017-10-12 15:56:37\",\"type_id\":\"6\",\"gp_id\":\"3\",\"note\":\"\"}', '编辑', '2017-10-12 16:41:44', null);
INSERT INTO `ccard_food_log` VALUES ('305', 'admin', '{\"name\":\"hanbaobaobaobao\",\"type_id\":\"6\",\"price\":\"10\",\"thumb\":\"/Uploads/images/thumb/1516439269.jpg\",\"status\":\"1\",\"note\":\"\",\"gp_id\":\"3\",\"update_time\":\"2018-01-20 17:07:51\",\"add_time\":\"2018-01-20 17:07:51\"}', '新增', '2018-01-20 17:07:51', null);
INSERT INTO `ccard_food_log` VALUES ('306', 'xingrong', '{\"name\":\"Taft\",\"type_id\":\"5\",\"price\":\"3\",\"status\":1,\"gp_id\":\"3\",\"update_time\":\"2018-01-22 08:32:11\",\"add_time\":\"2018-01-22 08:32:11\",\"thumb\":\"/Uploads/images/thumb/1516581131.jpg\"}', '增加', '2018-01-22 08:32:11', 'app-');
INSERT INTO `ccard_food_log` VALUES ('307', 'admin', '{\"name\":\"\\u83dc\\u54c11111\",\"type_id\":\"2\",\"price\":\"11\",\"thumb\":\"/Uploads/images/thumb/1516603866.png\",\"status\":\"1\",\"note\":\"\",\"gp_id\":\"3\",\"update_time\":\"2018-01-22 14:51:19\",\"add_time\":\"2018-01-22 14:51:19\"}', '新增', '2018-01-22 14:51:19', null);
INSERT INTO `ccard_food_log` VALUES ('308', 'admin', '{\"name\":\"TestFood\",\"type_id\":\"6\",\"price\":\"6\",\"thumb\":\"/Uploads/images/thumb/1516604327.png\",\"status\":\"1\",\"note\":\"\",\"gp_id\":\"3\",\"update_time\":\"2018-01-22 14:58:53\",\"add_time\":\"2018-01-22 14:58:53\"}', '新增', '2018-01-22 14:58:53', null);
INSERT INTO `ccard_food_log` VALUES ('309', 'admin', '{\"id\":\"20\",\"name\":\"TestFood\",\"price\":\"6.0\",\"thumb\":\"/Uploads/images/thumb/1516604327.png\",\"status\":\"1\",\"update_time\":\"2018-01-22 14:58:53\",\"add_time\":\"2018-01-22 14:58:53\",\"type_id\":\"6\",\"gp_id\":\"3\",\"note\":\"\"}', '删除', '2018-01-22 15:02:10', null);
INSERT INTO `ccard_food_log` VALUES ('310', 'admin', '{\"id\":\"19\",\"name\":\"\\u83dc\\u54c11111\",\"price\":\"11.0\",\"thumb\":\"/Uploads/images/thumb/1516603866.png\",\"status\":\"1\",\"update_time\":\"2018-01-22 14:51:19\",\"add_time\":\"2018-01-22 14:51:19\",\"type_id\":\"2\",\"gp_id\":\"3\",\"note\":\"\"}', '删除', '2018-01-22 15:02:14', null);
INSERT INTO `ccard_food_log` VALUES ('311', 'admin', '{\"id\":\"18\",\"name\":\"Taft\",\"price\":\"3.0\",\"thumb\":\"/Uploads/images/thumb/1516581131.jpg\",\"status\":\"1\",\"update_time\":\"2018-01-22 08:32:11\",\"add_time\":\"2018-01-22 08:32:11\",\"type_id\":\"5\",\"gp_id\":\"3\",\"note\":\"\"}', '删除', '2018-01-22 15:02:17', null);
INSERT INTO `ccard_food_log` VALUES ('312', 'admin', '{\"id\":\"17\",\"name\":\"hanbaobaobaobao\",\"price\":\"10.0\",\"thumb\":\"/Uploads/images/thumb/1516439269.jpg\",\"status\":\"1\",\"update_time\":\"2018-01-20 17:07:51\",\"add_time\":\"2018-01-20 17:07:51\",\"type_id\":\"6\",\"gp_id\":\"3\",\"note\":\"\"}', '删除', '2018-01-22 15:02:20', null);
INSERT INTO `ccard_food_log` VALUES ('313', 'admin', '{\"id\":\"15\",\"name\":\"\\u554a\\u554a\\u554a\",\"price\":\"3.5\",\"thumb\":\"/Uploads/images/thumb/1506412217.jpg\",\"status\":\"0\",\"update_time\":\"2017-10-12 14:16:53\",\"add_time\":\"2017-09-26 15:50:17\",\"type_id\":\"6\",\"gp_id\":\"3\",\"note\":\"\"}', '删除', '2018-01-22 15:02:28', null);
INSERT INTO `ccard_food_log` VALUES ('314', 'admin', '{\"id\":\"14\",\"name\":\"\\u54c8\\u554a\",\"price\":\"9.0\",\"thumb\":\"/Uploads/images/thumb/1506412142.jpg\",\"status\":\"0\",\"update_time\":\"2017-09-26 16:01:49\",\"add_time\":\"2017-09-26 15:49:02\",\"type_id\":\"6\",\"gp_id\":\"3\",\"note\":\"\"}', '删除', '2018-01-22 15:02:32', null);
INSERT INTO `ccard_food_log` VALUES ('315', 'admin', '{\"id\":\"13\",\"name\":\"\\u8fd8\",\"price\":\"9.0\",\"thumb\":\"/Uploads/images/thumb/1506410878.jpg\",\"status\":\"0\",\"update_time\":\"2017-09-26 16:01:57\",\"add_time\":\"2017-09-26 15:27:58\",\"type_id\":\"6\",\"gp_id\":\"3\",\"note\":\"\"}', '删除', '2018-01-22 15:02:35', null);
INSERT INTO `ccard_food_log` VALUES ('316', 'admin', '{\"id\":\"12\",\"name\":\"aa\",\"price\":\"6.0\",\"thumb\":\"/Uploads/images/thumb/1506410826.jpg\",\"status\":\"0\",\"update_time\":\"2017-09-26 16:02:08\",\"add_time\":\"2017-09-26 15:27:06\",\"type_id\":\"6\",\"gp_id\":\"3\",\"note\":\"\"}', '删除', '2018-01-22 15:02:39', null);
INSERT INTO `ccard_food_log` VALUES ('317', 'admin', '{\"id\":\"10\",\"name\":\"\\u738b\\u8001\\u5409\",\"price\":\"4.0\",\"thumb\":\"/Uploads/images/thumb/1506410659.jpg\",\"status\":\"0\",\"update_time\":\"2017-10-11 14:51:59\",\"add_time\":\"2017-09-26 15:24:19\",\"type_id\":\"6\",\"gp_id\":\"3\",\"note\":\"\"}', '删除', '2018-01-22 15:02:44', null);
INSERT INTO `ccard_food_log` VALUES ('318', 'admin', '{\"name\":\"\\u6d4b\\u8bd5\\u6c49\\u5821\",\"type_id\":\"6\",\"price\":\"6.5\",\"thumb\":\"/Uploads/images/thumb/1516667760.JPG\",\"status\":\"1\",\"note\":\"\",\"gp_id\":\"3\",\"update_time\":\"2018-01-23 08:36:10\",\"add_time\":\"2018-01-23 08:36:10\"}', '新增', '2018-01-23 08:36:10', null);
INSERT INTO `ccard_food_log` VALUES ('319', 'xingrong', '{\"name\":\"ceshi 1\",\"type_id\":\"4\",\"price\":\"7\",\"status\":1,\"gp_id\":\"3\",\"update_time\":\"2018-01-23 08:47:48\",\"add_time\":\"2018-01-23 08:47:48\",\"thumb\":\"/Uploads/images/thumb/1516668468.jpg\"}', '增加', '2018-01-23 08:47:48', 'app-');

-- ----------------------------
-- Table structure for ccard_order
-- ----------------------------
DROP TABLE IF EXISTS `ccard_order`;
CREATE TABLE `ccard_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户组明细表',
  `order_no` varchar(50) NOT NULL,
  `pnum` varchar(50) NOT NULL,
  `pname` varchar(50) NOT NULL,
  `department` varchar(50) NOT NULL,
  `feecode` varchar(50) NOT NULL,
  `gid` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `amount` float(50,1) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0:未支付 1:已支付',
  `food_take` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0:未取餐  1:已取餐',
  `food_type` varchar(50) NOT NULL,
  `pay_id` varchar(255) NOT NULL,
  `pay_type` tinyint(1) NOT NULL,
  `pay_time` datetime NOT NULL,
  `add_time` datetime NOT NULL,
  `devid` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uid_group_id` (`id`,`order_no`),
  KEY `uid` (`id`),
  KEY `group_id` (`order_no`)
) ENGINE=InnoDB AUTO_INCREMENT=460 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ccard_order
-- ----------------------------
INSERT INTO `ccard_order` VALUES ('250', '2017101601263078857', 'H7310307', '龐浩哲', '人資處/安全部', '70000097', 'b9:b3:3d:03', '点餐', '10.0', '1', '1', '汉堡', '', '0', '2017-10-16 11:05:59', '2017-10-16 11:03:00', '90a2e0269b6c878');
INSERT INTO `ccard_order` VALUES ('251', '2017101602017716660', 'H7396292', '陳玥', '(天津)EPD(I)製造部', '776ET005', 'b4:0d:b4:01', '点餐', '5.0', '1', '1', '汉堡', '', '0', '2017-10-16 11:06:50', '2017-10-16 11:03:51', '90a2e0269b6c878');
INSERT INTO `ccard_order` VALUES ('252', '2017101601651388919', 'H7394241', '畢雙', '(天津)CABG L(V)/製造處/成型廠/成型裝配', '79VE7405', '7e:72:e0:f6', '点餐', '10.0', '1', '1', '汉堡', '', '0', '2017-10-16 11:08:06', '2017-10-16 11:05:08', '90a2e0269b6c878');
INSERT INTO `ccard_order` VALUES ('253', '2017101601749160923', 'H7392775', '魏辰光', '(天津)CABG L(X)/Dot Hill製造部/生產課', '79VF5105', '0e:fc:e4:f6', '点餐', '5.0', '1', '1', '汉堡', '', '0', '2017-10-16 11:15:39', '2017-10-16 11:12:40', '90a2e0269b6c878');
INSERT INTO `ccard_order` VALUES ('254', '2017101600799143121', 'H7300057', '王永', '(天津)EPD(VI)製造處/產品工程', '0', '20:9d:f4:03', '点餐', '10.0', '1', '1', '汉堡', '', '0', '2017-10-16 11:31:03', '2017-10-16 11:28:05', '90a2e0269b6c878');
INSERT INTO `ccard_order` VALUES ('255', '2017101600669079590', 'H7331017', '崔春燕', '(天津)EPBG人資總務部', '77NEJ005', '00:3c:f8:03', '点餐', '5.0', '1', '1', '汉堡', '', '0', '2017-10-16 11:31:19', '2017-10-16 11:28:20', '90a2e0269b6c878');
INSERT INTO `ccard_order` VALUES ('256', '2017101600145850545', 'H7364636', '馬秀香', 'EPDV組裝二部生產課', '0', '70:f6:fb:03', '点餐', '6.0', '1', '1', '汉堡', '', '0', '2017-10-16 11:32:45', '2017-10-16 11:29:46', '90a2e0269b6c878');
INSERT INTO `ccard_order` VALUES ('257', '2017101601972265101', 'H7364645', '耿雪菲', 'EPDV組裝二部生產課', '0', '30:c4:f1:03', '点餐', '5.0', '1', '1', '汉堡', '', '0', '2017-10-16 11:32:59', '2017-10-16 11:30:00', '90a2e0269b6c878');
INSERT INTO `ccard_order` VALUES ('258', '2017101600833674965', 'H7358010', '劉芳', 'EPDV組裝一處', '775O1305', '80:02:5f:01', '点餐', '5.0', '1', '1', '汉堡', '', '0', '2017-10-16 11:37:55', '2017-10-16 11:34:57', '90a2e0269b6c878');
INSERT INTO `ccard_order` VALUES ('259', '2017101601107655556', 'H7375726', '朱紅霞', '(天津)EPD(VI) 製造處/生產製造部', '771VB105', '0e:54:1c:80', '点餐', '5.0', '1', '1', '汉堡', '', '0', '2017-10-16 11:39:29', '2017-10-16 11:36:31', '90a2e0269b6c878');
INSERT INTO `ccard_order` VALUES ('260', '2017101601471819442', 'H7371035', '劉曉花', '(天津)CABGL(VI)/製造一部/檢測一課', '79UMLW35', '70:82:f4:03', '点餐', '5.0', '1', '1', '汉堡', '', '0', '2017-10-16 11:39:41', '2017-10-16 11:36:42', '90a2e0269b6c878');
INSERT INTO `ccard_order` VALUES ('261', '2017101601469613278', 'H7107249', '李洋', '(天津)CABGL(V)/製造處/供應鏈運籌管制部', '79VE1006', 'eb:0a:28:0c', '点餐', '5.0', '1', '1', '汉堡', '', '0', '2017-10-16 11:41:19', '2017-10-16 11:38:20', '90a2e0269b6c878');
INSERT INTO `ccard_order` VALUES ('262', '2017101601310902848', 'H7375528', '崔田元', 'EPDV塑件開發處塑模廠', '775YAA08', '0e:56:e2:f6', '点餐', '5.0', '1', '1', '汉堡', '', '0', '2017-10-16 11:41:27', '2017-10-16 11:38:29', '90a2e0269b6c878');
INSERT INTO `ccard_order` VALUES ('263', '2017101600448003703', 'H7396230', '曹永安', '(天津)CABGL(V)/製造處/成型廠/成型裝配', '79VE0007', 'b4:96:63:01', '点餐', '4.0', '1', '1', '汉堡', '', '0', '2017-10-16 11:42:04', '2017-10-16 11:39:05', '90a2e0269b6c878');
INSERT INTO `ccard_order` VALUES ('264', '2017101600879436721', 'F1191604', '胡小婷', '(天津)EPD(V)塑件開發處/成型廠/成型裝配課', '775O0605', '00:b8:fe:03', '点餐', '5.0', '1', '1', '汉堡', '', '0', '2017-10-16 11:43:30', '2017-10-16 11:40:31', '90a2e0269b6c878');
INSERT INTO `ccard_order` VALUES ('265', '2017101601681668835', 'H7396281', '白馬靖毅', '(天津)CABGL(V)/製造處/成型廠/成型裝配', '775O0005', 'b4:e5:e7:01', '点餐', '8.0', '1', '1', '汉堡', '', '0', '2017-10-16 11:43:44', '2017-10-16 11:40:46', '90a2e0269b6c878');
INSERT INTO `ccard_order` VALUES ('266', '2017101601378722723', 'H7108260', '張金玉', '(天津)SECACPower/ACPower/AC1', '77C01008', 'db:4a:3f:0d', '点餐', '5.0', '1', '1', '汉堡', '', '0', '2017-10-16 11:46:12', '2017-10-16 11:43:13', '90a2e0269b6c878');
INSERT INTO `ccard_order` VALUES ('267', '2017101600402325772', 'H7394168', '張甯國', '(天津)EPD(V) 沖件開發處/沖模一廠/開發一課', '775YA208', '6e:68:db:f6', '点餐', '9.0', '1', '1', '汉堡', '', '0', '2017-10-16 11:49:06', '2017-10-16 11:46:07', '90a2e0269b6c878');
INSERT INTO `ccard_order` VALUES ('268', '2017101600709252012', 'H7106889', '高媛', '(天津)SDC/SIT', '0', '54:71:e0:ec', '点餐', '5.0', '1', '1', '汉堡', '', '0', '2017-10-16 11:50:34', '2017-10-16 11:47:36', '90a2e0269b6c878');
INSERT INTO `ccard_order` VALUES ('269', '2017101600219936428', 'H7394364', '楊天天', '(天津)EPD(I) 製造部', '776ET105', '9e:d1:de:f6', '点餐', '10.0', '1', '1', '汉堡', '', '0', '2017-10-16 11:54:53', '2017-10-16 11:51:54', '90a2e0269b6c878');
INSERT INTO `ccard_order` VALUES ('270', '2017101601172297827', 'H7395633', '萬亨', '(天津)EPD(I) 製造部', '776ET005', 'b4:f5:27:01', '点餐', '9.0', '1', '1', '汉堡', '', '0', '2017-10-16 11:56:41', '2017-10-16 11:53:42', '90a2e0269b6c878');
INSERT INTO `ccard_order` VALUES ('271', '2017101600264109638', 'H7109056', '曹婧', '(天津)策略採購', '70000047', 'b4:a1:92:01', '点餐', '5.0', '1', '1', '汉堡', '', '0', '2017-10-16 11:57:00', '2017-10-16 11:54:01', '90a2e0269b6c878');
INSERT INTO `ccard_order` VALUES ('272', '2017101601163116108', 'H7377316', '關通', 'EPD(V)衝壓廠', '775O1205', '00:6c:62:01', '点餐', '9.0', '1', '1', '汉堡', '', '0', '2017-10-16 11:57:42', '2017-10-16 11:54:43', '90a2e0269b6c878');
INSERT INTO `ccard_order` VALUES ('273', '2017101601914859422', 'H7371443', '張強', 'EPDI製造', '776ET105', '10:14:fe:03', '点餐', '5.0', '1', '1', '汉堡', '', '0', '2017-10-16 11:57:58', '2017-10-16 11:55:00', '90a2e0269b6c878');
INSERT INTO `ccard_order` VALUES ('274', '2017101601210408073', 'H7108719', '穆增宇', 'SRD/LAYOUT', '79USRD18', '94:b5:5c:40', '点餐', '5.0', '1', '1', '汉堡', '', '0', '2017-10-16 11:58:27', '2017-10-16 11:55:28', '90a2e0269b6c878');
INSERT INTO `ccard_order` VALUES ('275', '2017101601629778152', 'H7397807', '張蓉戚', '(天津)EPD(VI) 製造處/生產製造部', '', '54:75:01:01', '点餐', '9.0', '1', '1', '汉堡', '', '0', '2017-10-16 11:58:42', '2017-10-16 11:55:43', '90a2e0269b6c878');
INSERT INTO `ccard_order` VALUES ('276', '2017101601687413498', 'H7397212', '吳永愛', '(天津)EPD(VI) 製造處/生產製造部', '', '44:f1:88:01', '点餐', '10.0', '1', '1', '汉堡', '', '0', '2017-10-16 11:58:54', '2017-10-16 11:55:55', '90a2e0269b6c878');
INSERT INTO `ccard_order` VALUES ('277', '2017101600471972326', 'H7338382', '段秀換', '(天津)CABG L(V)/製造處/衝壓廠/沖壓生產', '0', '10:bb:61:01', '点餐', '5.0', '1', '1', '汉堡', '', '0', '2017-10-16 11:59:32', '2017-10-16 11:56:34', '90a2e0269b6c878');
INSERT INTO `ccard_order` VALUES ('278', '2017101601583107491', 'H7393788', '徐茁', '(天津)人資處/招募課', '79VE4325', 'de:6e:e0:f6', '点餐', '5.0', '1', '1', '汉堡', '', '0', '2017-10-16 11:59:43', '2017-10-16 11:56:44', '90a2e0269b6c878');
INSERT INTO `ccard_order` VALUES ('279', '2017101602087474565', 'H7397154', '趙行行', '(天津)EPD(I) 製造部', '776ET105', '54:ae:fd:01', '点餐', '5.0', '1', '1', '汉堡', '', '0', '2017-10-16 11:59:57', '2017-10-16 11:56:58', '90a2e0269b6c878');
INSERT INTO `ccard_order` VALUES ('280', '2017101601750430857', 'H7324768', '荊小航', '(天津)EPD(I)資材部/物控課', '776ET015', '70:96:61:01', '点餐', '5.0', '1', '1', '汉堡', '', '0', '2017-10-16 12:00:08', '2017-10-16 11:57:09', '90a2e0269b6c878');
INSERT INTO `ccard_order` VALUES ('281', '2017101601478279816', 'H7396300', '秦偉', '(天津)EPD(I)製造部', '776ET005', 'b4:c6:af:01', '点餐', '9.0', '1', '1', '汉堡', '', '0', '2017-10-16 12:00:21', '2017-10-16 11:57:22', '90a2e0269b6c878');
INSERT INTO `ccard_order` VALUES ('282', '2017101600638066083', 'H7396290', '田翔', '(天津)EPD(I)製造部', '776ET005', 'a4:d3:d5:01', '点餐', '9.0', '1', '1', '汉堡', '', '0', '2017-10-16 12:00:48', '2017-10-16 11:57:49', '90a2e0269b6c878');
INSERT INTO `ccard_order` VALUES ('283', '2017101602071277545', '', '', '', '', '', '点餐', '5.0', '1', '1', '汉堡', '', '1', '2017-10-16 12:00:59', '2017-10-16 11:58:01', '90a2e0269b6c878');
INSERT INTO `ccard_order` VALUES ('284', '2017101602131869229', 'H7393922', '姚志偉', '(天津)EPD(I) 製造部', '776ET105', '3e:54:e4:f6', '点餐', '10.0', '1', '1', '汉堡', '', '0', '2017-10-16 12:01:23', '2017-10-16 11:58:24', '90a2e0269b6c878');
INSERT INTO `ccard_order` VALUES ('285', '2017101600680374185', 'H7379415', '付歡歡', '(天津)EPD(I)製造部', '776ET105', '94:3f:fc:40', '点餐', '10.0', '1', '1', '汉堡', '', '0', '2017-10-16 12:01:54', '2017-10-16 11:58:55', '90a2e0269b6c878');
INSERT INTO `ccard_order` VALUES ('286', '2017101601289703468', '', '', '', '', '', '点餐', '5.0', '1', '1', '汉堡', '', '1', '2017-10-16 12:01:58', '2017-10-16 11:58:59', '90a2e0269b6c878');
INSERT INTO `ccard_order` VALUES ('287', '2017101601135212898', 'H7109376', '郝鵬', '(天津)SRD3/sustaining/SPE', '77P11028', 'b4:50:0d:01', '点餐', '5.0', '1', '1', '汉堡', '', '0', '2017-10-16 12:02:19', '2017-10-16 11:59:20', '90a2e0269b6c878');
INSERT INTO `ccard_order` VALUES ('288', '2017101600258396432', 'F2138264', '黃松燕', '(天津)EPD(VI)製造處/產品工程', '0', 'b2:36:3a:5c', '点餐', '5.0', '1', '1', '汉堡', '', '0', '2017-10-16 12:02:26', '2017-10-16 11:59:27', '90a2e0269b6c878');
INSERT INTO `ccard_order` VALUES ('289', '2017101600344408451', 'H7394725', '顧文慧', '(天津)EPD(I) 製造部', '776ET105', 'd4:54:0a:01', '点餐', '5.0', '1', '1', '汉堡', '', '0', '2017-10-16 12:02:30', '2017-10-16 11:59:31', '90a2e0269b6c878');
INSERT INTO `ccard_order` VALUES ('290', '2017101601219623558', 'H7378925', '劉彩霞', '(天津)EPD(I) 製造部', '776ET105', '84:d5:d7:40', '点餐', '5.0', '1', '1', '汉堡', '', '0', '2017-10-16 12:02:39', '2017-10-16 11:59:40', '90a2e0269b6c878');
INSERT INTO `ccard_order` VALUES ('291', '2017101600084686547', 'H7370706', '趙懷龍', '(天津)CABGL(V)/製造處/衝壓廠/衝壓生產', '79VE4105', 'b0:ff:fe:03', '点餐', '5.0', '1', '1', '汉堡', '', '0', '2017-10-16 12:02:44', '2017-10-16 11:59:46', '90a2e0269b6c878');
INSERT INTO `ccard_order` VALUES ('292', '2017101601555247330', 'H7396266', '周勇', '(天津)EPD(I)製造部', '776ET005', 'b4:dc:2d:01', '点餐', '5.0', '1', '1', '汉堡', '', '0', '2017-10-16 12:02:55', '2017-10-16 11:59:56', '90a2e0269b6c878');
INSERT INTO `ccard_order` VALUES ('293', '2017101602120418066', 'H7396240', '劉朝陽', '(天津)EPD(I)製造部', '776ET005', 'b4:81:0c:01', '点餐', '10.0', '1', '1', '汉堡', '', '0', '2017-10-16 12:03:01', '2017-10-16 12:00:02', '90a2e0269b6c878');
INSERT INTO `ccard_order` VALUES ('294', '2017101601741281763', 'H7396276', '魏彥斌', '(天津)EPD(I)製造部', '776ET005', 'b4:c0:9f:01', '点餐', '10.0', '1', '1', '汉堡', '', '0', '2017-10-16 12:03:11', '2017-10-16 12:00:12', '90a2e0269b6c878');
INSERT INTO `ccard_order` VALUES ('295', '2017101600802377592', 'H7396974', '霍占良', '(天津)CABG L(V)/製造處/衝壓廠/衝壓企劃', '79VE4325', '54:2b:0f:01', '点餐', '5.0', '1', '1', '汉堡', '', '0', '2017-10-16 12:03:23', '2017-10-16 12:00:24', '90a2e0269b6c878');
INSERT INTO `ccard_order` VALUES ('296', '2017101601824740901', 'F4541726', '易小美', '(天津)亞太Operation中心/EPBG天津專案', '77NEJ005', 'ff:bd:43:e4', '点餐', '5.0', '1', '1', '汉堡', '', '0', '2017-10-16 12:03:44', '2017-10-16 12:00:45', '90a2e0269b6c878');
INSERT INTO `ccard_order` VALUES ('297', '2017101601129096026', 'H7324924', '蘇安幫', '(天津)EPD(I)製造部/生產二課', '776ET105', 'bb:06:45:0d', '点餐', '9.0', '1', '1', '汉堡', '', '0', '2017-10-16 12:03:52', '2017-10-16 12:00:53', '90a2e0269b6c878');
INSERT INTO `ccard_order` VALUES ('298', '2017101600809250263', 'F7240125', '許敏敏', '(天津)SEC/Regulatory/Environmental 2', 'DBA608', 'f0:bb:f4:03', '点餐', '9.0', '1', '1', '汉堡', '', '0', '2017-10-16 12:04:13', '2017-10-16 12:01:14', '90a2e0269b6c878');
INSERT INTO `ccard_order` VALUES ('299', '2017101600261900501', 'H7398041', '趙振振', '(天津)CABG L(X)/待分發', '', 'f4:ee:07:02', '点餐', '10.0', '1', '1', '汉堡', '', '0', '2017-10-16 12:04:42', '2017-10-16 12:01:44', '90a2e0269b6c878');
INSERT INTO `ccard_order` VALUES ('300', '2017101600442789105', 'H7107092', '王濤', 'EPDI品保JQE', '0', 'cb:91:43:0d', '点餐', '4.0', '1', '1', '汉堡', '', '0', '2017-10-16 12:04:50', '2017-10-16 12:01:51', '90a2e0269b6c878');
INSERT INTO `ccard_order` VALUES ('301', '2017101601592097936', 'H7396238', '李震北', '(天津)EPD(I)製造部', '776ET005', 'b4:44:52:01', '点餐', '5.0', '1', '1', '汉堡', '', '0', '2017-10-16 12:04:54', '2017-10-16 12:01:55', '90a2e0269b6c878');
INSERT INTO `ccard_order` VALUES ('302', '2017101600240595176', 'H7108221', '柴智元', '(天津)CABG SRD/SDS/BIOS', '79USRD48', 'a0:9e:65:01', '点餐', '10.0', '1', '1', '汉堡', '', '0', '2017-10-16 12:05:32', '2017-10-16 12:02:33', '90a2e0269b6c878');
INSERT INTO `ccard_order` VALUES ('303', '2017101600070825532', 'H7327531', '楊洪臣', '(天津)EPD(V)塑件開發處/成型廠/成型裝配課', '775N1505', '55:dc:3c:52', '点餐', '9.0', '1', '1', '汉堡', '', '0', '2017-10-16 12:05:57', '2017-10-16 12:02:58', '90a2e0269b6c878');
INSERT INTO `ccard_order` VALUES ('304', '2017101601296590927', 'H7361147', '任麗娜', '(天津)CABG資材處/資材部/L(X)倉儲課', '0', 'a0:d5:52:18', '点餐', '5.0', '1', '1', '汉堡', '', '0', '2017-10-16 12:06:03', '2017-10-16 12:03:04', '90a2e0269b6c878');
INSERT INTO `ccard_order` VALUES ('305', '2017101601645741865', 'H7393815', '蘇榮飛', '(天津)CABG L(V)/製造處/成型廠/成型裝配', '79VE7405', 'ee:1a:e0:f6', '点餐', '9.0', '1', '1', '汉堡', '', '0', '2017-10-16 12:06:12', '2017-10-16 12:03:13', '90a2e0269b6c878');
INSERT INTO `ccard_order` VALUES ('306', '2017101600302855955', 'F2863402', '劉麗娟', 'CABG資材資材NPI物料規劃課', '0', 'd8:5e:0b:24', '点餐', '5.0', '1', '1', '汉堡', '', '0', '2017-10-16 12:06:24', '2017-10-16 12:03:26', '90a2e0269b6c878');
INSERT INTO `ccard_order` VALUES ('307', '2017101601495097290', 'H7392700', '牛朋', '(天津)EPD(I) 製造部', '776ET105', '3e:3e:db:f6', '点餐', '5.0', '1', '1', '汉堡', '', '0', '2017-10-16 12:06:28', '2017-10-16 12:03:29', '90a2e0269b6c878');
INSERT INTO `ccard_order` VALUES ('308', '2017101601104616729', 'H7392678', '李瑞娜', '(天津)EPD(I) 製造部', '776ET105', '9e:4b:dd:f6', '点餐', '9.0', '1', '1', '汉堡', '', '0', '2017-10-16 12:06:38', '2017-10-16 12:03:39', '90a2e0269b6c878');
INSERT INTO `ccard_order` VALUES ('309', '2017101600060591537', 'F2138458', '王建', 'EPDI專案部PM課', '0', '8a:f8:cb:f2', '点餐', '10.0', '1', '1', '汉堡', '', '0', '2017-10-16 12:07:57', '2017-10-16 12:04:59', '90a2e0269b6c878');
INSERT INTO `ccard_order` VALUES ('310', '2017101601521056695', 'H7374958', '王超超', '(天津)EPD(V)沖件開發處/量產沖壓廠/生產部/生產一課', '775O1205', '0e:cd:b3:80', '点餐', '5.0', '1', '1', '汉堡', '', '0', '2017-10-16 12:09:34', '2017-10-16 12:06:36', '90a2e0269b6c878');
INSERT INTO `ccard_order` VALUES ('311', '2017101601699973484', 'F4652035', '吳文傑', '(天津)EPD(V)沖件開發處/量產沖壓廠/企劃部/資源課', '775O1205', '0e:b8:c1:36', '点餐', '5.0', '1', '1', '汉堡', '', '0', '2017-10-16 12:09:53', '2017-10-16 12:06:54', '90a2e0269b6c878');
INSERT INTO `ccard_order` VALUES ('312', '2017101601559984004', 'F6201864', '李洪輪', '(天津)EPD(V)沖件開發處/烤漆加工部/企劃課', '0', 'c2:97:3e:5c', '点餐', '5.0', '1', '1', '汉堡', '', '0', '2017-10-16 12:10:12', '2017-10-16 12:07:13', '90a2e0269b6c878');
INSERT INTO `ccard_order` VALUES ('313', '2017101601018945482', 'H7358905', '薛璐璐', '(天津)EPD(V)沖件開發處/量產沖壓廠/企劃部/企劃課', '775O1205', 'c0:c8:50:18', '点餐', '5.0', '1', '1', '汉堡', '', '0', '2017-10-16 12:10:23', '2017-10-16 12:07:24', '90a2e0269b6c878');
INSERT INTO `ccard_order` VALUES ('314', '2017101601900472774', 'H7108395', '李泓遠', '(天津)物流總處天津/京津管理部/業務拓展課', 'DVCJ07', '30:70:f4:03', '点餐', '5.0', '1', '1', '汉堡', '', '0', '2017-10-16 12:12:01', '2017-10-16 12:09:02', '90a2e0269b6c878');
INSERT INTO `ccard_order` VALUES ('315', '2017101602130269922', 'H7394317', '袁文考', '(天津)EPD(V) 沖件開發處/量產沖壓廠/生產部/物流課', '775O1205', '5e:27:e2:f6', '点餐', '5.0', '1', '1', '汉堡', '', '0', '2017-10-16 12:12:27', '2017-10-16 12:09:29', '90a2e0269b6c878');
INSERT INTO `ccard_order` VALUES ('316', '2017101601031436969', '', '', '', '', '', '点餐', '9.0', '1', '1', '汉堡', '', '1', '2017-10-16 12:12:42', '2017-10-16 12:09:43', '90a2e0269b6c878');
INSERT INTO `ccard_order` VALUES ('317', '2017101600795185949', 'H7108264', '周永娜', '(天津)SRD3/SIT2-TJ/六課', '77NVC258', '1b:8e:40:0d', '点餐', '5.0', '1', '1', '汉堡', '', '0', '2017-10-16 12:16:40', '2017-10-16 12:13:41', '90a2e0269b6c878');
INSERT INTO `ccard_order` VALUES ('318', '2017101601013909902', 'H7109348', '劉麗傑', '(天津)共用資源/SLS/SIV-TJ/SIV2', '70C02008', '93:79:93:83', '点餐', '5.0', '1', '1', '汉堡', '', '0', '2017-10-16 12:19:15', '2017-10-16 12:16:16', '90a2e0269b6c878');
INSERT INTO `ccard_order` VALUES ('319', '2017101601902280030', 'G4030392', '李會傑', '(天津)EPD(I)檢測部/測試支援課', '776ET308', '34:bd:b7:b0', '点餐', '4.0', '1', '1', '汉堡', '', '0', '2017-10-16 12:21:37', '2017-10-16 12:18:38', '90a2e0269b6c878');
INSERT INTO `ccard_order` VALUES ('320', '2017101601652231592', 'H7108553', '李凱莉', '(天津)SRD3/SIT2-TJ', '77NVC258', '0e:e4:07:80', '点餐', '5.0', '1', '1', '汉堡', '', '0', '2017-10-16 12:23:37', '2017-10-16 12:20:38', '90a2e0269b6c878');
INSERT INTO `ccard_order` VALUES ('321', '2017101601269677682', 'H7106818', '楊方興', '(天津)CABGSRD/Val/PA', '79USRDM8', 'a4:fc:dc:ec', '点餐', '5.0', '1', '1', '汉堡', '', '0', '2017-10-16 12:29:30', '2017-10-16 12:26:32', '90a2e0269b6c878');
INSERT INTO `ccard_order` VALUES ('322', '2017101601269677811', 'H7106818', '楊方興', '(天津)CABGSRD/Val/PA', '79USRDM8', 'a4:fc:dc:ec', '点餐', '9.0', '1', '1', '汉堡', '', '0', '2017-10-16 12:29:30', '2017-10-16 12:26:32', '90a2e0269b6c878');
INSERT INTO `ccard_order` VALUES ('324', '20171020018476060', 'H7106818', '楊方興', '(天津)CABGSRD/Val/PA', '79USRDM8', 'a4:fc:dc:ec', '订餐', '4.5', '1', '0', '汉堡', '', '0', '2017-10-20 14:00:48', '2017-10-20 14:01:09', 'bd1e2ff2f7d039a6');
INSERT INTO `ccard_order` VALUES ('325', '20171020016522311', 'H7108553', '李凱莉', '(天津)SRD3/SIT2-TJ', '77NVC258', '0e:e4:07:80', '订餐', '5.0', '1', '0', '汉堡', '', '0', '2017-10-20 12:23:37', '2017-10-20 12:20:38', '90a2e0269b6c878');
INSERT INTO `ccard_order` VALUES ('368', '20171021129770035', 'H7107898', '李梅', '雲端應用研發處/開發課', '70000018', '30:24:f7:03', '订餐', '4.0', '1', '0', '汉堡', '', '0', '2017-10-21 16:42:59', '2017-10-21 16:43:25', 'bd1e2ff2f7d039a6');
INSERT INTO `ccard_order` VALUES ('369', '20171021153592414', 'H7107898', '李梅', '雲端應用研發處/開發課', '70000018', '30:24:f7:03', '订餐', '4.0', '1', '0', '汉堡', '', '0', '2017-10-21 16:43:04', '2017-10-21 16:43:29', 'bd1e2ff2f7d039a6');
INSERT INTO `ccard_order` VALUES ('370', '20171021623853360', 'H7107898', '李梅', '雲端應用研發處/開發課', '70000018', '30:24:f7:03', '订餐', '4.5', '1', '0', '汉堡', '', '0', '2017-10-21 16:43:09', '2017-10-21 16:43:35', 'bd1e2ff2f7d039a6');
INSERT INTO `ccard_order` VALUES ('371', '20171021598148255', 'H7107898', '李梅', '雲端應用研發處/開發課', '70000018', '30:24:f7:03', '订餐', '6.0', '1', '0', '汉堡', '', '0', '2017-10-21 16:43:20', '2017-10-21 16:43:46', 'bd1e2ff2f7d039a6');
INSERT INTO `ccard_order` VALUES ('372', '20171021017335062', 'H7108721', '賈淇超', '雲端應用研發處', '70000018', '0e:a6:22:80', '订餐', '6.0', '1', '0', '汉堡', '', '0', '2017-10-21 16:43:27', '2017-10-21 16:43:53', 'bd1e2ff2f7d039a6');
INSERT INTO `ccard_order` VALUES ('373', '20171021413979345', 'H7108721', '賈淇超', '雲端應用研發處', '70000018', '0e:a6:22:80', '订餐', '5.0', '1', '0', '汉堡', '', '0', '2017-10-21 16:43:32', '2017-10-21 16:43:58', 'bd1e2ff2f7d039a6');
INSERT INTO `ccard_order` VALUES ('374', '20171023931869453', 'H7107898', '李梅', '雲端應用研發處/開發課', '70000018', '30:24:f7:03', '订餐', '5.0', '1', '0', '汉堡', '', '0', '2017-10-23 08:08:16', '2017-10-23 08:08:41', 'bd1e2ff2f7d039a6');
INSERT INTO `ccard_order` VALUES ('375', '20171023767648008', 'H7108721', '賈淇超', '雲端應用研發處', '70000018', '0e:a6:22:80', '订餐', '16.0', '1', '1', '汉堡', '', '0', '2017-10-23 08:24:09', '2017-10-23 08:24:34', 'bd1e2ff2f7d039a6');
INSERT INTO `ccard_order` VALUES ('376', '20171023875948439', 'H7108721', '賈淇超', '雲端應用研發處', '70000018', '0e:a6:22:80', '订餐', '5.0', '1', '1', '汉堡', '', '0', '2017-10-23 08:24:13', '2017-10-23 08:24:38', 'bd1e2ff2f7d039a6');
INSERT INTO `ccard_order` VALUES ('377', '20171023148284793', 'H7106885', '賓單單', '雲端應用研發處/開發課', '70000018', 'e4:e9:07:ed', '订餐', '11.0', '1', '1', '汉堡', '', '0', '2017-10-23 14:37:13', '2017-10-23 14:37:40', 'bd1e2ff2f7d039a6');
INSERT INTO `ccard_order` VALUES ('378', '20171023964263990', 'H7106885', '賓單單', '雲端應用研發處/開發課', '70000018', 'e4:e9:07:ed', '订餐', '5.0', '1', '1', '汉堡', '', '0', '2017-10-23 14:39:59', '2017-10-23 14:40:27', 'bd1e2ff2f7d039a6');
INSERT INTO `ccard_order` VALUES ('379', '20171023715880553', 'H7106885', '賓單單', '雲端應用研發處/開發課', '70000018', 'e4:e9:07:ed', '订餐', '4.0', '1', '1', '汉堡', '', '0', '2017-10-23 14:40:19', '2017-10-23 14:40:46', 'bd1e2ff2f7d039a6');
INSERT INTO `ccard_order` VALUES ('380', '20171023373836020', 'H7107296', '王樹濤', '雲端應用研發處/開發課', '70000018', '0b:7a:41:07', '订餐', '5.0', '1', '1', '汉堡', '', '0', '2017-10-23 14:48:33', '2017-10-23 14:49:00', 'bd1e2ff2f7d039a6');
INSERT INTO `ccard_order` VALUES ('381', '20171023136234430', 'H7107296', '王樹濤', '雲端應用研發處/開發課', '70000018', '0b:7a:41:07', '订餐', '6.0', '1', '1', '汉堡', '', '0', '2017-10-23 14:49:34', '2017-10-23 14:50:01', 'bd1e2ff2f7d039a6');
INSERT INTO `ccard_order` VALUES ('382', '20171023030193345', 'H7107296', '王樹濤', '雲端應用研發處/開發課', '70000018', '0b:7a:41:07', '订餐', '4.5', '1', '1', '汉堡', '', '0', '2017-10-23 14:49:45', '2017-10-23 14:50:12', 'bd1e2ff2f7d039a6');
INSERT INTO `ccard_order` VALUES ('383', '20171023010530397', 'H7107296', '王樹濤', '雲端應用研發處/開發課', '70000018', '0b:7a:41:07', '订餐', '4.0', '1', '1', '汉堡', '', '0', '2017-10-23 14:49:54', '2017-10-23 14:50:21', 'bd1e2ff2f7d039a6');
INSERT INTO `ccard_order` VALUES ('384', '2017102456575550', 'H7108721', '賈淇超', '雲端應用研發處', '70000018', '0e:a6:22:80', '订餐', '6.0', '1', '1', '汉堡', '', '0', '2017-10-24 11:15:41', '2017-10-24 11:16:08', 'bd1e2ff2f7d039a6');
INSERT INTO `ccard_order` VALUES ('385', '2017102410150995', 'H7108721', '賈淇超', '雲端應用研發處', '70000018', '0e:a6:22:80', '订餐', '10.0', '1', '1', '汉堡', '', '0', '2017-10-24 11:15:47', '2017-10-24 11:16:14', 'bd1e2ff2f7d039a6');
INSERT INTO `ccard_order` VALUES ('386', '2017102497101101', 'H7107898', '李梅', '雲端應用研發處/開發課', '70000018', '30:24:f7:03', '订餐', '4.0', '1', '1', '汉堡', '', '0', '2017-10-24 11:19:12', '2017-10-24 11:19:38', 'bd1e2ff2f7d039a6');
INSERT INTO `ccard_order` VALUES ('387', '2017102455984852', 'H7109426', '張宇', 'IT', '70000018', 'b4:71:f8:01', '订餐', '6.0', '1', '1', '汉堡', '', '0', '2017-10-24 11:38:21', '2017-10-24 11:38:47', 'bd1e2ff2f7d039a6');
INSERT INTO `ccard_order` VALUES ('388', '2017102410152535', 'H7106885', '賓單單', '雲端應用研發處/開發課', '70000018', 'e4:e9:07:ed', '订餐', '12.5', '1', '1', '汉堡', '', '0', '2017-10-24 14:58:27', '2017-10-24 14:58:54', 'bd1e2ff2f7d039a6');
INSERT INTO `ccard_order` VALUES ('389', '2017102610057525', 'H7106885', '賓單單', '雲端應用研發處/開發課', '70000018', 'e4:e9:07:ed', '订餐', '5.0', '1', '1', '汉堡', '', '0', '2017-10-26 16:17:37', '2017-10-26 16:18:05', 'bd1e2ff2f7d039a6');
INSERT INTO `ccard_order` VALUES ('390', '2017102651504950', 'H7106885', '賓單單', '雲端應用研發處/開發課', '70000018', 'e4:e9:07:ed', '订餐', '5.0', '1', '1', '汉堡', '', '0', '2017-10-26 16:17:42', '2017-10-26 16:18:11', 'bd1e2ff2f7d039a6');
INSERT INTO `ccard_order` VALUES ('391', '2017102655511025', 'H7106885', '賓單單', '雲端應用研發處/開發課', '70000018', 'e4:e9:07:ed', '订餐', '6.0', '1', '1', '汉堡', '', '0', '2017-10-26 16:17:47', '2017-10-26 16:18:15', 'bd1e2ff2f7d039a6');
INSERT INTO `ccard_order` VALUES ('392', '2017102610150101', 'H7107898', '李梅', '雲端應用研發處/開發課', '70000018', '30:24:f7:03', '订餐', '4.0', '1', '0', '汉堡', '', '0', '2017-10-26 16:18:26', '2017-10-26 16:18:54', 'bd1e2ff2f7d039a6');
INSERT INTO `ccard_order` VALUES ('393', '2017102650985752', 'H7107898', '李梅', '雲端應用研發處/開發課', '70000018', '30:24:f7:03', '订餐', '8.5', '1', '0', '汉堡', '', '0', '2017-10-26 16:18:45', '2017-10-26 16:19:14', 'bd1e2ff2f7d039a6');
INSERT INTO `ccard_order` VALUES ('394', '2017102652985310', 'H7108721', '賈淇超', '雲端應用研發處', '70000018', '0e:a6:22:80', '订餐', '19.0', '1', '1', '汉堡', '', '0', '2017-10-26 16:19:20', '2017-10-26 16:19:48', 'bd1e2ff2f7d039a6');
INSERT INTO `ccard_order` VALUES ('395', '2017103157999910', 'H7107898', '李梅', '雲端應用研發處/開發課', '70000018', '30:24:f7:03', '订餐', '15.0', '1', '1', '汉堡', '', '0', '2017-10-31 08:42:49', '2017-10-31 08:43:21', 'bd1e2ff2f7d039a6');
INSERT INTO `ccard_order` VALUES ('396', '2017103197529810', 'H7107828', '孫慧琳', '雲端應用研發處/開發課', '70000018', 'b4:5f:fe:01', '订餐', '8.5', '1', '1', '汉堡', '', '0', '2017-10-31 08:43:05', '2017-10-31 08:43:38', 'bd1e2ff2f7d039a6');
INSERT INTO `ccard_order` VALUES ('397', '2017103157979956', 'H7107828', '孫慧琳', '雲端應用研發處/開發課', '70000018', 'b4:5f:fe:01', '订餐', '6.0', '1', '1', '汉堡', '', '0', '2017-10-31 08:43:21', '2017-10-31 08:43:53', 'bd1e2ff2f7d039a6');
INSERT INTO `ccard_order` VALUES ('398', '2017103197514955', 'H7108721', '賈淇超', '雲端應用研發處', '70000018', '0e:a6:22:80', '订餐', '8.5', '1', '1', '汉堡', '', '0', '2017-10-31 10:21:29', '2017-10-31 10:22:02', 'bd1e2ff2f7d039a6');
INSERT INTO `ccard_order` VALUES ('399', '2017103152551015', 'H7108721', '賈淇超', '雲端應用研發處', '70000018', '0e:a6:22:80', '订餐', '8.5', '1', '1', '汉堡', '', '0', '2017-10-31 10:21:40', '2017-10-31 10:22:12', 'bd1e2ff2f7d039a6');
INSERT INTO `ccard_order` VALUES ('400', '2018012010255101', 'H7108721', '賈淇超', '雲端應用研發處', '70000018', '0e:a6:22:80', '点餐', '8.5', '1', '1', '汉堡', '', '0', '2000-01-01 08:05:37', '2018-01-20 16:27:11', 'bd1e2ff2f7d039a6');
INSERT INTO `ccard_order` VALUES ('401', '2018012057984810', 'H7108721', '賈淇超', '雲端應用研發處', '70000018', '0e:a6:22:80', '点餐', '8.5', '1', '1', '汉堡', '', '0', '2000-01-01 08:05:47', '2018-01-20 16:27:21', 'bd1e2ff2f7d039a6');
INSERT INTO `ccard_order` VALUES ('402', '2018012050505799', 'H7108721', '賈淇超', '雲端應用研發處', '70000018', '0e:a6:22:80', '点餐', '11.0', '1', '1', '汉堡', '', '0', '2000-01-01 08:05:55', '2018-01-20 16:27:30', 'bd1e2ff2f7d039a6');
INSERT INTO `ccard_order` VALUES ('403', '2018012097495797', 'H7108721', '賈淇超', '雲端應用研發處', '70000018', '0e:a6:22:80', '点餐', '5.0', '1', '1', '汉堡', '', '0', '2000-01-01 08:06:03', '2018-01-20 16:27:38', 'bd1e2ff2f7d039a6');
INSERT INTO `ccard_order` VALUES ('404', '2018012010252100', 'H7108721', '賈淇超', '雲端應用研發處', '70000018', '0e:a6:22:80', '点餐', '5.0', '1', '1', '汉堡', '', '0', '2000-01-01 08:06:09', '2018-01-20 16:27:43', 'bd1e2ff2f7d039a6');
INSERT INTO `ccard_order` VALUES ('405', '2018012053100564', 'H7108721', '賈淇超', '雲端應用研發處', '70000018', '0e:a6:22:80', '点餐', '4.0', '1', '1', '汉堡', '', '0', '2000-01-01 08:06:15', '2018-01-20 16:27:49', 'bd1e2ff2f7d039a6');
INSERT INTO `ccard_order` VALUES ('406', '2018012057565797', 'H7108721', '賈淇超', '雲端應用研發處', '70000018', '0e:a6:22:80', '点餐', '3.0', '1', '1', '特色餐', '', '0', '2000-01-01 08:06:51', '2018-01-20 16:28:25', 'bd1e2ff2f7d039a6');
INSERT INTO `ccard_order` VALUES ('407', '2018012097534910', 'H7108721', '賈淇超', '雲端應用研發處', '70000018', '0e:a6:22:80', '点餐', '8.5', '1', '1', '汉堡', '', '0', '2000-01-01 08:13:16', '2018-01-20 16:34:50', 'bd1e2ff2f7d039a6');
INSERT INTO `ccard_order` VALUES ('408', '2018012051974950', 'H7108721', '賈淇超', '雲端應用研發處', '70000018', '0e:a6:22:80', '点餐', '4.5', '1', '1', '汉堡', '', '0', '2000-01-01 08:23:01', '2018-01-20 16:44:35', 'bd1e2ff2f7d039a6');
INSERT INTO `ccard_order` VALUES ('409', '2018012055495499', 'H7108721', '賈淇超', '雲端應用研發處', '70000018', '0e:a6:22:80', '点餐', '5.0', '1', '1', '汉堡', '', '0', '2000-01-01 08:23:20', '2018-01-20 16:44:55', 'bd1e2ff2f7d039a6');
INSERT INTO `ccard_order` VALUES ('410', '2018012050100995', 'H7108721', '賈淇超', '雲端應用研發處', '70000018', '0e:a6:22:80', '点餐', '4.5', '1', '1', '汉堡', '', '0', '2000-01-01 08:24:52', '2018-01-20 16:46:26', 'bd1e2ff2f7d039a6');
INSERT INTO `ccard_order` VALUES ('411', '2018012098981005', 'H7108721', '賈淇超', '雲端應用研發處', '70000018', '0e:a6:22:80', '点餐', '4.5', '1', '1', '汉堡', '', '0', '2000-01-01 08:27:57', '2018-01-20 16:49:31', 'bd1e2ff2f7d039a6');
INSERT INTO `ccard_order` VALUES ('412', '2018012010150555', '', '', '', '', '', '点餐', '4.5', '1', '1', '汉堡', '', '1', '2000-01-01 08:29:03', '2018-01-20 16:50:38', 'bd1e2ff2f7d039a6');
INSERT INTO `ccard_order` VALUES ('413', '2018012053574810', '', '', '', '', '', '点餐', '5.0', '1', '1', '汉堡', '', '1', '2000-01-01 08:29:11', '2018-01-20 16:50:45', 'bd1e2ff2f7d039a6');
INSERT INTO `ccard_order` VALUES ('414', '2018012010257981', 'H7108721', '賈淇超', '雲端應用研發處', '70000018', '0e:a6:22:80', '点餐', '4.5', '1', '1', '汉堡', '', '0', '2000-01-01 08:33:21', '2018-01-20 16:54:55', 'bd1e2ff2f7d039a6');
INSERT INTO `ccard_order` VALUES ('415', '2018012057579853', 'H7108721', '賈淇超', '雲端應用研發處', '70000018', '0e:a6:22:80', '点餐', '11.0', '1', '1', '汉堡', '', '0', '2000-01-01 08:33:31', '2018-01-20 16:55:05', 'bd1e2ff2f7d039a6');
INSERT INTO `ccard_order` VALUES ('416', '2018012049574810', 'H7108721', '賈淇超', '雲端應用研發處', '70000018', '0e:a6:22:80', '点餐', '6.0', '1', '1', '汉堡', '', '0', '2000-01-01 08:39:47', '2018-01-20 17:01:21', 'bd1e2ff2f7d039a6');
INSERT INTO `ccard_order` VALUES ('417', '2018012052494950', 'H7106885', '賓單單', '雲端應用研發處/開發課', '70000018', 'e4:e9:07:ed', '点餐', '10.0', '1', '1', '汉堡', '', '0', '2017-12-20 17:05:13', '2018-01-20 17:05:08', 'bd1e2ff2f7d039a6');
INSERT INTO `ccard_order` VALUES ('418', '2018012054101975', '', '', '', '', '', '点餐', '21.0', '1', '1', '汉堡', '', '1', '2017-12-20 17:05:32', '2018-01-20 17:05:26', 'bd1e2ff2f7d039a6');
INSERT INTO `ccard_order` VALUES ('419', '2018012010255555', 'H7107719', '孫嗣奇', '雲端應用研發處/開發課', '70000018', 'fb:60:ff:06', '点餐', '17.5', '1', '1', '汉堡', '', '0', '2017-12-20 17:05:56', '2018-01-20 17:05:51', 'bd1e2ff2f7d039a6');
INSERT INTO `ccard_order` VALUES ('420', '2018012057100519', 'H7106885', '賓單單', '雲端應用研發處/開發課', '70000018', 'e4:e9:07:ed', '点餐', '6.0', '1', '1', '标准餐', '', '0', '2017-12-20 17:06:23', '2018-01-20 17:06:17', 'bd1e2ff2f7d039a6');
INSERT INTO `ccard_order` VALUES ('421', '2018012010053579', '', '', '', '', '', '点餐', '6.0', '1', '1', '标准餐', '', '1', '2017-12-20 17:06:26', '2018-01-20 17:06:21', 'bd1e2ff2f7d039a6');
INSERT INTO `ccard_order` VALUES ('422', '2018012051505397', 'H7106885', '賓單單', '雲端應用研發處/開發課', '70000018', 'e4:e9:07:ed', '点餐', '7.0', '1', '1', '自选餐', '', '0', '2017-12-20 17:07:04', '2018-01-20 17:06:59', 'bd1e2ff2f7d039a6');
INSERT INTO `ccard_order` VALUES ('423', '2018012253541015', 'H7108721', '賈淇超', '雲端應用研發處', '70000018', '0e:a6:22:80', '点餐', '6.0', '1', '1', '汉堡', '', '0', '2000-01-03 05:27:19', '2018-01-22 15:00:21', '90a2e0269b6c878');
INSERT INTO `ccard_order` VALUES ('424', '2018012210010098', 'H7108721', '賈淇超', '雲端應用研發處', '70000018', '0e:a6:22:80', '点餐', '6.0', '1', '1', '汉堡', '', '0', '2000-01-03 05:27:28', '2018-01-22 15:00:29', '90a2e0269b6c878');
INSERT INTO `ccard_order` VALUES ('425', '2018012210297991', 'H7108721', '賈淇超', '雲端應用研發處', '70000018', '0e:a6:22:80', '点餐', '6.0', '1', '1', '汉堡', '', '0', '2000-01-03 05:35:29', '2018-01-22 15:08:31', '90a2e0269b6c878');
INSERT INTO `ccard_order` VALUES ('426', '2018012250495553', 'H7108721', '賈淇超', '雲端應用研發處', '70000018', '0e:a6:22:80', '点餐', '4.5', '1', '1', '汉堡', '', '0', '2000-01-03 06:06:44', '2018-01-22 15:39:46', '90a2e0269b6c878');
INSERT INTO `ccard_order` VALUES ('427', '2018012348575556', 'F1040652', '李宇', '(天津)雲端應用研發處/雲端應用開發部', '70000018', '0b:2c:4e:07', '点餐', '6.0', '1', '1', '标准餐', '', '0', '2000-01-03 22:59:30', '2018-01-23 08:32:32', '90a2e0269b6c878');
INSERT INTO `ccard_order` VALUES ('428', '2018012310149999', '', '', '', '', '', '点餐', '8.5', '1', '1', '汉堡', '', '1', '2000-01-03 23:00:00', '2018-01-23 08:33:02', '90a2e0269b6c878');
INSERT INTO `ccard_order` VALUES ('429', '2018012397100485', '', '', '', '', '', '点餐', '19.5', '1', '1', '汉堡', '', '1', '2000-01-03 23:04:12', '2018-01-23 08:37:14', '90a2e0269b6c878');
INSERT INTO `ccard_order` VALUES ('430', '2018012398495350', '', '', '', '', '', '点餐', '26.0', '1', '1', '汉堡', '', '1', '2018-01-23 23:06:21', '2018-01-23 08:39:23', '90a2e0269b6c878');
INSERT INTO `ccard_order` VALUES ('431', '2018012350495448', 'H7107719', '孫嗣奇', '雲端應用研發處/開發課', '70000018', 'fb:60:ff:06', '点餐', '7.0', '1', '1', '自选餐', '', '0', '2018-01-23 23:16:04', '2018-01-23 08:49:06', '90a2e0269b6c878');
INSERT INTO `ccard_order` VALUES ('432', '2018012355515199', 'H7108721', '賈淇超', '雲端應用研發處', '70000018', '0e:a6:22:80', '订餐', '5.0', '1', '0', '汉堡', '', '0', '2018-01-23 23:50:17', '2018-01-23 09:23:19', '90a2e0269b6c878');
INSERT INTO `ccard_order` VALUES ('433', '2018012310098485', 'H7108721', '賈淇超', '雲端應用研發處', '70000018', '0e:a6:22:80', '订餐', '5.0', '1', '0', '汉堡', '', '0', '2018-01-23 23:53:19', '2018-01-23 09:26:21', '90a2e0269b6c878');
INSERT INTO `ccard_order` VALUES ('434', '2018012310052995', 'H7108721', '賈淇超', '雲端應用研發處', '70000018', '0e:a6:22:80', '订餐', '6.5', '1', '0', '汉堡', '', '0', '2018-01-23 23:58:07', '2018-01-23 09:31:09', '90a2e0269b6c878');
INSERT INTO `ccard_order` VALUES ('435', '2018012351525154', 'H7107719', '孫嗣奇', '雲端應用研發處/開發課', '70000018', 'fb:60:ff:06', '订餐', '8.5', '1', '0', '汉堡', '', '0', '2018-01-24 00:55:33', '2018-01-23 10:28:35', '90a2e0269b6c878');
INSERT INTO `ccard_order` VALUES ('436', '2018012399100999', 'H7107719', '孫嗣奇', '雲端應用研發處/開發課', '70000018', 'fb:60:ff:06', '订餐', '9.0', '1', '0', '汉堡', '', '0', '2018-01-24 01:01:35', '2018-01-23 10:34:36', '90a2e0269b6c878');
INSERT INTO `ccard_order` VALUES ('437', '2018012398984952', 'H7107719', '孫嗣奇', '雲端應用研發處/開發課', '70000018', 'fb:60:ff:06', '点餐', '8.5', '1', '1', '汉堡', '', '0', '2018-01-24 01:03:09', '2018-01-23 10:36:11', '90a2e0269b6c878');
INSERT INTO `ccard_order` VALUES ('438', '2018012310148101', 'H7109426', '張宇', 'IT', '70000018', 'b4:71:f8:01', '订餐', '4.0', '1', '0', '汉堡', '', '0', '2018-01-24 01:04:48', '2018-01-23 10:37:50', '90a2e0269b6c878');
INSERT INTO `ccard_order` VALUES ('439', '2018012355975599', 'H7107719', '孫嗣奇', '雲端應用研發處/開發課', '70000018', 'fb:60:ff:06', '订餐', '4.0', '1', '0', '汉堡', '', '0', '2018-01-24 01:04:57', '2018-01-23 10:37:59', '90a2e0269b6c878');
INSERT INTO `ccard_order` VALUES ('440', '2018012310048541', 'H7107719', '孫嗣奇', '雲端應用研發處/開發課', '70000018', 'fb:60:ff:06', '订餐', '11.0', '1', '0', '汉堡', '', '0', '2018-01-24 01:05:03', '2018-01-23 10:38:05', '90a2e0269b6c878');
INSERT INTO `ccard_order` VALUES ('441', '2018012310052981', 'H7107719', '孫嗣奇', '雲端應用研發處/開發課', '70000018', 'fb:60:ff:06', '订餐', '9.0', '1', '0', '汉堡', '', '0', '2018-01-24 01:05:19', '2018-01-23 10:38:21', '90a2e0269b6c878');
INSERT INTO `ccard_order` VALUES ('442', '2018012357101975', 'H7109426', '張宇', 'IT', '70000018', 'b4:71:f8:01', '订餐', '14.0', '1', '1', '汉堡', '', '0', '2018-01-23 10:39:20', '2018-01-23 10:39:53', '90a2e0269b6c878');
INSERT INTO `ccard_order` VALUES ('443', '2018012351551019', 'H7106717', '常浩', '雲端應用研發處/開發課', '0', '2b:df:4b:0d', '订餐', '9.0', '1', '1', '汉堡', '', '0', '2018-01-23 10:40:17', '2018-01-23 10:40:51', '90a2e0269b6c878');
INSERT INTO `ccard_order` VALUES ('444', '2018012310051485', 'H7106717', '常浩', '雲端應用研發處/開發課', '0', '2b:df:4b:0d', '订餐', '11.0', '1', '1', '汉堡', '', '0', '2018-01-23 10:40:27', '2018-01-23 10:41:01', '90a2e0269b6c878');
INSERT INTO `ccard_order` VALUES ('445', '2018012399519854', '', '', '', '', '', '点餐', '17.5', '1', '1', '汉堡', '', '1', '2018-01-23 13:49:46', '2018-01-23 13:50:20', '90a2e0269b6c878');
INSERT INTO `ccard_order` VALUES ('446', '2018012355100100', 'F1040652', '李宇', '(天津)雲端應用研發處/雲端應用開發部', '70000018', '0b:2c:4e:07', '点餐', '8.0', '1', '1', '汉堡', '', '0', '2018-01-23 13:50:14', '2018-01-23 13:50:47', '90a2e0269b6c878');
INSERT INTO `ccard_order` VALUES ('447', '2018012348519797', 'F1040652', '李宇', '(天津)雲端應用研發處/雲端應用開發部', '70000018', '0b:2c:4e:07', '订餐', '4.5', '1', '1', '汉堡', '', '0', '2018-01-23 13:52:15', '2018-01-23 13:52:48', '90a2e0269b6c878');
INSERT INTO `ccard_order` VALUES ('448', '2018012349579999', 'H7107898', '李梅', '雲端應用研發處/開發課', '70000018', '30:24:f7:03', '点餐', '1.0', '1', '1', '汉堡', '', '0', '2018-01-23 15:17:04', '2018-01-23 15:17:37', '90a2e0269b6c878');
INSERT INTO `ccard_order` VALUES ('449', '2018012351555797', 'H7107898', '李梅', '雲端應用研發處/開發課', '70000018', '30:24:f7:03', '点餐', '2.0', '1', '1', '汉堡', '', '0', '2018-01-23 15:32:02', '2018-01-23 15:32:35', '90a2e0269b6c878');
INSERT INTO `ccard_order` VALUES ('450', '2018012357535498', 'H7107898', '李梅', '雲端應用研發處/開發課', '70000018', '30:24:f7:03', '点餐', '0.1', '1', '1', '汉堡', '', '0', '2018-01-23 15:36:40', '2018-01-23 15:37:13', '90a2e0269b6c878');
INSERT INTO `ccard_order` VALUES ('451', '2018012351531004', 'H7107898', '李梅', '雲端應用研發處/開發課', '70000018', '30:24:f7:03', '点餐', '1.2', '1', '1', '汉堡', '', '0', '2018-01-23 15:57:54', '2018-01-23 15:58:27', '90a2e0269b6c878');
INSERT INTO `ccard_order` VALUES ('452', '2018012310098101', 'H7107898', '李梅', '雲端應用研發處/開發課', '70000018', '30:24:f7:03', '点餐', '0.1', '1', '1', '汉堡', '', '0', '2018-01-23 16:01:00', '2018-01-23 16:01:33', '90a2e0269b6c878');
INSERT INTO `ccard_order` VALUES ('453', '2018012310010197', 'H7107898', '李梅', '雲端應用研發處/開發課', '70000018', '30:24:f7:03', '点餐', '6.0', '1', '1', '标准餐', '', '0', '2018-01-23 16:01:16', '2018-01-23 16:01:49', '90a2e0269b6c878');
INSERT INTO `ccard_order` VALUES ('454', '2018012356499810', '', '', '', '', '', '点餐', '6.0', '1', '1', '标准餐', '', '1', '2018-01-23 16:07:18', '2018-01-23 16:07:52', '90a2e0269b6c878');
INSERT INTO `ccard_order` VALUES ('455', '2018012348499854', '', '', '', '', '', '点餐', '6.0', '1', '1', '标准餐', '', '1', '2018-01-23 16:07:26', '2018-01-23 16:08:00', '90a2e0269b6c878');
INSERT INTO `ccard_order` VALUES ('456', '2018012357534957', '', '', '', '', '', '点餐', '6.0', '1', '1', '标准餐', '', '1', '2018-01-23 16:07:36', '2018-01-23 16:08:09', '90a2e0269b6c878');
INSERT INTO `ccard_order` VALUES ('457', '2018012310051569', 'H7107898', '李梅', '雲端應用研發處/開發課', '70000018', '30:24:f7:03', '点餐', '1.0', '1', '1', '汉堡', '', '0', '2018-01-23 16:17:16', '2018-01-23 16:17:49', '90a2e0269b6c878');
INSERT INTO `ccard_order` VALUES ('458', '2018012610249495', '', '', '', '', '', '点餐', '4.5', '1', '1', '汉堡', '', '1', '2018-01-26 09:12:45', '2018-01-26 09:13:35', '90a2e0269b6c878');
INSERT INTO `ccard_order` VALUES ('459', '2018012650579954', '', '', '', '', '', '点餐', '6.0', '1', '1', '汉堡', '', '1', '2018-01-26 09:12:49', '2018-01-26 09:13:38', '90a2e0269b6c878');

-- ----------------------------
-- Table structure for ccard_record
-- ----------------------------
DROP TABLE IF EXISTS `ccard_record`;
CREATE TABLE `ccard_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` varchar(50) NOT NULL,
  `food_id` int(11) NOT NULL,
  `food_name` varchar(50) NOT NULL,
  `food_price` float(50,1) NOT NULL,
  `food_num` smallint(8) NOT NULL DEFAULT '1',
  `company` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=795 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ccard_record
-- ----------------------------
INSERT INTO `ccard_record` VALUES ('515', '250', '6', '鸡腿', '4.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('516', '250', '5', '鸡腿堡', '5.0', '2', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('517', '251', '5', '鸡腿堡', '5.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('518', '252', '3', '芙蓉蟹棒（2根）', '5.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('519', '252', '6', '鸡腿', '4.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('520', '252', '1', '牛肉堡', '6.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('521', '252', '5', '鸡腿堡', '5.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('522', '253', '16', '香芋地瓜丸（8个）', '6.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('523', '253', '5', '鸡腿堡', '5.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('524', '254', '2', '黄金春卷（8个）', '5.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('525', '254', '5', '鸡腿堡', '5.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('526', '255', '5', '鸡腿堡', '5.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('527', '256', '1', '牛肉堡', '6.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('528', '257', '5', '鸡腿堡', '5.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('529', '258', '5', '鸡腿堡', '5.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('530', '259', '5', '鸡腿堡', '5.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('531', '260', '5', '鸡腿堡', '5.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('532', '261', '5', '鸡腿堡', '5.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('533', '262', '5', '鸡腿堡', '5.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('534', '263', '6', '鸡腿', '4.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('535', '264', '3', '芙蓉蟹棒（2根）', '5.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('536', '265', '6', '鸡腿', '4.0', '2', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('537', '266', '5', '鸡腿堡', '5.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('538', '267', '6', '鸡腿', '4.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('539', '267', '5', '鸡腿堡', '5.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('540', '268', '5', '鸡腿堡', '5.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('541', '269', '6', '鸡腿', '4.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('542', '269', '5', '鸡腿堡', '5.0', '2', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('543', '270', '6', '鸡腿', '4.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('544', '270', '5', '鸡腿堡', '5.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('545', '271', '5', '鸡腿堡', '5.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('546', '272', '6', '鸡腿', '4.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('547', '272', '5', '鸡腿堡', '5.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('548', '273', '5', '鸡腿堡', '5.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('549', '274', '5', '鸡腿堡', '5.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('550', '275', '6', '鸡腿', '4.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('551', '275', '5', '鸡腿堡', '5.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('552', '276', '5', '鸡腿堡', '5.0', '2', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('553', '277', '5', '鸡腿堡', '5.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('554', '278', '5', '鸡腿堡', '5.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('555', '279', '5', '鸡腿堡', '5.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('556', '280', '5', '鸡腿堡', '5.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('557', '281', '6', '鸡腿', '4.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('558', '281', '5', '鸡腿堡', '5.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('559', '282', '6', '鸡腿', '4.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('560', '282', '5', '鸡腿堡', '5.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('561', '283', '5', '鸡腿堡', '5.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('562', '284', '6', '鸡腿', '4.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('563', '284', '1', '牛肉堡', '6.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('564', '285', '6', '鸡腿', '4.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('565', '285', '1', '牛肉堡', '6.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('566', '286', '5', '鸡腿堡', '5.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('567', '287', '6', '鸡腿', '4.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('568', '287', '5', '鸡腿堡', '5.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('569', '288', '5', '鸡腿堡', '5.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('570', '289', '5', '鸡腿堡', '5.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('571', '290', '5', '鸡腿堡', '5.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('572', '291', '5', '鸡腿堡', '5.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('573', '292', '5', '鸡腿堡', '5.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('574', '293', '5', '鸡腿堡', '5.0', '2', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('575', '294', '5', '鸡腿堡', '5.0', '2', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('576', '295', '5', '鸡腿堡', '5.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('577', '296', '5', '鸡腿堡', '5.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('578', '297', '6', '鸡腿', '4.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('579', '297', '5', '鸡腿堡', '5.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('580', '298', '6', '鸡腿', '4.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('581', '298', '5', '鸡腿堡', '5.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('582', '299', '5', '鸡腿堡', '5.0', '2', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('583', '300', '6', '鸡腿', '4.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('584', '301', '5', '鸡腿堡', '5.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('585', '302', '5', '鸡腿堡', '5.0', '2', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('586', '303', '6', '鸡腿', '4.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('587', '303', '5', '鸡腿堡', '5.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('588', '304', '5', '鸡腿堡', '5.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('589', '305', '6', '鸡腿', '4.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('590', '305', '5', '鸡腿堡', '5.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('591', '306', '5', '鸡腿堡', '5.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('592', '307', '5', '鸡腿堡', '5.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('593', '308', '6', '鸡腿', '4.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('594', '308', '5', '鸡腿堡', '5.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('595', '309', '6', '鸡腿', '4.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('596', '309', '1', '牛肉堡', '6.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('597', '310', '16', '香芋地瓜丸（8个）', '6.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('598', '310', '2', '黄金春卷（8个）', '5.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('599', '310', '3', '芙蓉蟹棒（2根）', '5.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('600', '310', '1', '牛肉堡', '6.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('601', '310', '5', '鸡腿堡', '5.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('602', '310', '7', '香芋地瓜丸（6个）', '4.5', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('603', '311', '5', '鸡腿堡', '5.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('604', '312', '5', '鸡腿堡', '5.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('605', '313', '5', '鸡腿堡', '5.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('606', '314', '2', '黄金春卷（8个）', '5.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('607', '315', '5', '鸡腿堡', '5.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('608', '316', '6', '鸡腿', '4.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('609', '316', '5', '鸡腿堡', '5.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('610', '317', '6', '鸡腿', '4.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('611', '317', '5', '鸡腿堡', '5.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('612', '317', '7', '香芋地瓜丸（6个）', '4.5', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('613', '318', '5', '鸡腿堡', '5.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('614', '319', '3', '芙蓉蟹棒（2根）', '5.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('615', '319', '6', '鸡腿', '4.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('616', '319', '5', '鸡腿堡', '5.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('617', '320', '6', '鸡腿', '4.0', '3', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('618', '320', '1', '牛肉堡', '6.0', '2', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('619', '320', '5', '鸡腿堡', '5.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('620', '321', '5', '鸡腿堡', '5.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('627', '324', '7', '香芋地瓜丸（6个）', '4.5', '2', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('628', '322', '6', '鸡腿', '4.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('629', '322', '5', '鸡腿堡', '5.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('630', '324', '7', '香芋地瓜丸（6个）', '4.5', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('631', '325', '5', '鸡腿堡', '5.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('632', '326', '4', '薯条', '4.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('633', '327', '4', '薯条', '4.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('634', '328', '16', '香芋地瓜丸（8个）', '6.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('635', '329', '7', '香芋地瓜丸（6个）', '4.5', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('636', '330', '4', '薯条', '4.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('637', '331', '7', '香芋地瓜丸（6个）', '4.5', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('638', '332', '7', '香芋地瓜丸（6个）', '4.5', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('639', '333', '4', '薯条', '4.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('640', '334', '7', '香芋地瓜丸（6个）', '4.5', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('641', '335', '7', '香芋地瓜丸（6个）', '4.5', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('642', '336', '16', '香芋地瓜丸（8个）', '6.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('643', '337', '16', '香芋地瓜丸（8个）', '6.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('644', '338', '7', '香芋地瓜丸（6个）', '4.5', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('645', '339', '7', '香芋地瓜丸（6个）', '4.5', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('646', '340', '7', '香芋地瓜丸（6个）', '4.5', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('647', '341', '4', '薯条', '4.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('648', '342', '7', '香芋地瓜丸（6个）', '4.5', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('649', '343', '4', '薯条', '4.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('650', '344', '6', '鸡腿', '4.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('651', '345', '4', '薯条', '4.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('652', '346', '7', '香芋地瓜丸（6个）', '4.5', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('653', '347', '6', '鸡腿', '4.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('654', '348', '7', '香芋地瓜丸（6个）', '4.5', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('655', '349', '4', '薯条', '4.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('656', '350', '16', '香芋地瓜丸（8个）', '6.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('657', '350', '5', '鸡腿堡', '5.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('658', '351', '6', '鸡腿', '4.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('659', '352', '4', '薯条', '4.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('660', '353', '4', '薯条', '4.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('661', '354', '4', '薯条', '4.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('662', '355', '4', '薯条', '4.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('663', '356', '4', '薯条', '4.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('664', '357', '3', '芙蓉蟹棒（2根）', '5.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('665', '358', '4', '薯条', '4.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('666', '359', '3', '芙蓉蟹棒（2根）', '5.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('667', '359', '2', '黄金春卷（8个）', '5.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('668', '359', '5', '鸡腿堡', '5.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('669', '360', '7', '香芋地瓜丸（6个）', '4.5', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('670', '361', '7', '香芋地瓜丸（6个）', '4.5', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('671', '362', '6', '鸡腿', '4.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('672', '363', '7', '香芋地瓜丸（6个）', '4.5', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('673', '364', '4', '薯条', '4.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('674', '365', '4', '薯条', '4.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('675', '366', '6', '鸡腿', '4.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('676', '367', '7', '香芋地瓜丸（6个）', '4.5', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('677', '368', '4', '薯条', '4.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('678', '369', '6', '鸡腿', '4.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('679', '370', '7', '香芋地瓜丸（6个）', '4.5', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('680', '371', '1', '牛肉堡', '6.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('681', '372', '16', '香芋地瓜丸（8个）', '6.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('682', '373', '2', '黄金春卷（8个）', '5.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('683', '374', '3', '芙蓉蟹棒（2根）', '5.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('684', '375', '6', '鸡腿', '4.0', '2', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('685', '375', '4', '薯条', '4.0', '2', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('686', '376', '5', '鸡腿堡', '5.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('687', '377', '16', '香芋地瓜丸（8个）', '6.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('688', '377', '5', '鸡腿堡', '5.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('689', '378', '5', '鸡腿堡', '5.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('690', '379', '6', '鸡腿', '4.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('691', '380', '5', '鸡腿堡', '5.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('692', '381', '16', '香芋地瓜丸（8个）', '6.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('693', '382', '7', '香芋地瓜丸（6个）', '4.5', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('694', '383', '4', '薯条', '4.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('695', '384', '16', '香芋地瓜丸（8个）', '6.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('696', '385', '2', '黄金春卷（8个）', '5.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('697', '385', '3', '芙蓉蟹棒（2根）', '5.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('698', '386', '6', '鸡腿', '4.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('699', '387', '16', '香芋地瓜丸（8个）', '6.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('700', '388', '6', '鸡腿', '4.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('701', '388', '4', '薯条', '4.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('702', '388', '7', '香芋地瓜丸（6个）', '4.5', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('703', '389', '5', '鸡腿堡', '5.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('704', '390', '3', '芙蓉蟹棒（2根）', '5.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('705', '391', '16', '香芋地瓜丸（8个）', '6.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('706', '392', '4', '薯条', '4.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('707', '393', '6', '鸡腿', '4.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('708', '393', '7', '香芋地瓜丸（6个）', '4.5', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('709', '394', '2', '黄金春卷（8个）', '5.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('710', '394', '3', '芙蓉蟹棒（2根）', '5.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('711', '394', '4', '薯条', '4.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('712', '394', '5', '鸡腿堡', '5.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('713', '395', '6', '鸡腿', '4.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('714', '395', '1', '牛肉堡', '6.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('715', '395', '5', '鸡腿堡', '5.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('716', '396', '6', '鸡腿', '4.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('717', '396', '7', '香芋地瓜丸（6个）', '4.5', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('718', '397', '16', '香芋地瓜丸（8个）', '6.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('719', '398', '6', '鸡腿', '4.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('720', '398', '7', '香芋地瓜丸（6个）', '4.5', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('721', '399', '6', '鸡腿', '4.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('722', '399', '7', '香芋地瓜丸（6个）', '4.5', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('723', '400', '6', '鸡腿', '4.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('724', '400', '7', '香芋地瓜丸（6个）', '4.5', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('725', '401', '6', '鸡腿', '4.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('726', '401', '7', '香芋地瓜丸（6个）', '4.5', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('727', '402', '16', '香芋地瓜丸（8个）', '6.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('728', '402', '5', '鸡腿堡', '5.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('729', '403', '3', '芙蓉蟹棒（2根）', '5.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('730', '404', '2', '黄金春卷（8个）', '5.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('731', '405', '6', '鸡腿', '4.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('732', '406', '56', '鱼香茄子', '3.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('733', '407', '6', '鸡腿', '4.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('734', '407', '7', '香芋地瓜丸（6个）', '4.5', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('735', '408', '7', '香芋地瓜丸（6个）', '4.5', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('736', '409', '3', '芙蓉蟹棒（2根）', '5.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('737', '410', '7', '香芋地瓜丸（6个）', '4.5', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('738', '411', '7', '香芋地瓜丸（6个）', '4.5', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('739', '412', '7', '香芋地瓜丸（6个）', '4.5', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('740', '413', '5', '鸡腿堡', '5.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('741', '414', '7', '香芋地瓜丸（6个）', '4.5', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('742', '415', '16', '香芋地瓜丸（8个）', '6.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('743', '415', '5', '鸡腿堡', '5.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('744', '416', '16', '香芋地瓜丸（8个）', '6.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('745', '417', '1', '牛肉堡', '6.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('746', '417', '6', '鸡腿', '4.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('747', '418', '2', '黄金春卷（8个）', '5.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('748', '418', '3', '芙蓉蟹棒（2根）', '5.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('749', '418', '1', '牛肉堡', '6.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('750', '418', '5', '鸡腿堡', '5.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('751', '419', '2', '黄金春卷（8个）', '5.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('752', '419', '6', '鸡腿', '4.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('753', '419', '4', '薯条', '4.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('754', '419', '7', '香芋地瓜丸（6个）', '4.5', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('755', '422', '77', '红烧茄子', '3.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('756', '422', '82', '麻婆豆腐', '4.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('757', '423', '20', 'TestFood', '6.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('758', '424', '20', 'TestFood', '6.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('759', '425', '20', 'TestFood', '6.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('760', '426', '7', '香芋地瓜丸（6个）', '4.5', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('761', '428', '6', '鸡腿', '4.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('762', '428', '7', '香芋地瓜丸（6个）', '4.5', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('763', '429', '21', '测试汉堡', '6.5', '3', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('764', '430', '21', '测试汉堡', '6.5', '4', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('765', '431', '22', 'ceshi 1', '7.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('766', '432', '5', '鸡腿堡', '5.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('767', '433', '5', '鸡腿堡', '5.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('768', '434', '21', '测试汉堡', '6.5', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('769', '435', '6', '鸡腿', '4.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('770', '435', '7', '香芋地瓜丸（6个）', '4.5', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('771', '436', '5', '鸡腿堡', '5.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('772', '436', '4', '薯条', '4.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('773', '437', '6', '鸡腿', '4.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('774', '437', '7', '香芋地瓜丸（6个）', '4.5', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('775', '438', '6', '鸡腿', '4.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('776', '439', '4', '薯条', '4.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('777', '440', '16', '香芋地瓜丸（8个）', '6.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('778', '440', '5', '鸡腿堡', '5.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('779', '441', '5', '鸡腿堡', '5.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('780', '441', '4', '薯条', '4.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('781', '442', '3', '芙蓉蟹棒（2根）', '5.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('782', '442', '6', '鸡腿', '4.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('783', '442', '5', '鸡腿堡', '5.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('784', '443', '6', '鸡腿', '4.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('785', '443', '5', '鸡腿堡', '5.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('786', '444', '16', '香芋地瓜丸（8个）', '6.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('787', '444', '5', '鸡腿堡', '5.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('788', '445', '6', '鸡腿', '4.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('789', '445', '7', '香芋地瓜丸（6个）', '4.5', '3', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('790', '446', '6', '鸡腿', '4.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('791', '446', '4', '薯条', '4.0', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('792', '447', '7', '香芋地瓜丸（6个）', '4.5', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('793', '458', '7', '香芋地瓜丸（6个）', '4.5', '1', '兴荣餐饮');
INSERT INTO `ccard_record` VALUES ('794', '459', '16', '香芋地瓜丸（8个）', '6.0', '1', '兴荣餐饮');

-- ----------------------------
-- Table structure for ccard_sync_client_log
-- ----------------------------
DROP TABLE IF EXISTS `ccard_sync_client_log`;
CREATE TABLE `ccard_sync_client_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `devid` varchar(50) NOT NULL,
  `operate` varchar(50) NOT NULL,
  `add_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=187 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ccard_sync_client_log
-- ----------------------------
INSERT INTO `ccard_sync_client_log` VALUES ('99', '5e4721d7b0f6d432', '同步', '2017-08-11 11:17:52');
INSERT INTO `ccard_sync_client_log` VALUES ('100', '5e4721d7b0f6d432', '同步', '2017-08-11 11:18:11');
INSERT INTO `ccard_sync_client_log` VALUES ('101', '5e4721d7b0f6d432', '同步', '2017-08-21 12:27:26');
INSERT INTO `ccard_sync_client_log` VALUES ('102', '951bae5fb2dde2a0', '同步', '2017-09-02 10:00:52');
INSERT INTO `ccard_sync_client_log` VALUES ('103', '90a2e0269b6c878', '同步', '2017-09-02 15:31:20');
INSERT INTO `ccard_sync_client_log` VALUES ('104', '90a2e0269b6c878', '同步', '2017-09-02 15:38:43');
INSERT INTO `ccard_sync_client_log` VALUES ('105', '90a2e0269b6c878', '同步', '2017-09-02 15:40:07');
INSERT INTO `ccard_sync_client_log` VALUES ('106', '90a2e0269b6c878', '同步', '2017-09-02 15:47:14');
INSERT INTO `ccard_sync_client_log` VALUES ('107', '90a2e0269b6c878', '同步', '2017-09-02 15:52:54');
INSERT INTO `ccard_sync_client_log` VALUES ('108', '90a2e0269b6c878', '同步', '2017-09-02 16:28:42');
INSERT INTO `ccard_sync_client_log` VALUES ('109', '90a2e0269b6c878', '同步', '2017-09-02 16:32:24');
INSERT INTO `ccard_sync_client_log` VALUES ('110', '90a2e0269b6c878', '同步', '2017-09-02 16:35:09');
INSERT INTO `ccard_sync_client_log` VALUES ('111', '90a2e0269b6c878', '同步', '2017-09-02 18:09:33');
INSERT INTO `ccard_sync_client_log` VALUES ('112', '951bae5fb2dde2a0', '同步', '2017-09-02 18:19:31');
INSERT INTO `ccard_sync_client_log` VALUES ('113', '90a2e0269b6c878', '同步', '2017-09-02 18:24:47');
INSERT INTO `ccard_sync_client_log` VALUES ('114', '90a2e0269b6c878', '同步', '2017-09-02 18:24:59');
INSERT INTO `ccard_sync_client_log` VALUES ('115', '90a2e0269b6c878', '同步', '2017-09-02 18:29:21');
INSERT INTO `ccard_sync_client_log` VALUES ('116', '90a2e0269b6c878', '同步', '2017-09-02 18:46:58');
INSERT INTO `ccard_sync_client_log` VALUES ('117', '90a2e0269b6c878', '同步', '2017-09-02 18:51:17');
INSERT INTO `ccard_sync_client_log` VALUES ('118', '90a2e0269b6c878', '同步', '2017-09-05 14:51:12');
INSERT INTO `ccard_sync_client_log` VALUES ('119', '90a2e0269b6c878', '同步', '2017-09-05 16:33:39');
INSERT INTO `ccard_sync_client_log` VALUES ('120', '90a2e0269b6c878', '同步', '2017-09-05 17:17:01');
INSERT INTO `ccard_sync_client_log` VALUES ('121', '90a2e0269b6c878', '同步', '2017-09-05 17:17:38');
INSERT INTO `ccard_sync_client_log` VALUES ('122', '90a2e0269b6c878', '同步', '2017-09-05 17:33:00');
INSERT INTO `ccard_sync_client_log` VALUES ('123', '90a2e0269b6c878', '同步', '2017-09-06 08:31:40');
INSERT INTO `ccard_sync_client_log` VALUES ('124', '90a2e0269b6c878', '同步', '2017-09-06 08:57:26');
INSERT INTO `ccard_sync_client_log` VALUES ('125', '90a2e0269b6c878', '同步', '2017-09-06 09:01:27');
INSERT INTO `ccard_sync_client_log` VALUES ('126', '90a2e0269b6c878', '同步', '2017-09-06 09:04:30');
INSERT INTO `ccard_sync_client_log` VALUES ('127', '90a2e0269b6c878', '同步', '2017-09-06 09:51:42');
INSERT INTO `ccard_sync_client_log` VALUES ('128', '90a2e0269b6c878', '同步', '2017-09-06 09:53:48');
INSERT INTO `ccard_sync_client_log` VALUES ('129', '90a2e0269b6c878', '同步', '2017-09-06 09:59:00');
INSERT INTO `ccard_sync_client_log` VALUES ('130', 'bd1e2ff2f7d039a6', '同步', '2017-09-06 12:44:47');
INSERT INTO `ccard_sync_client_log` VALUES ('131', 'bd1e2ff2f7d039a6', '同步', '2017-09-06 12:45:06');
INSERT INTO `ccard_sync_client_log` VALUES ('132', 'bd1e2ff2f7d039a6', '同步', '2017-09-06 13:11:05');
INSERT INTO `ccard_sync_client_log` VALUES ('133', 'bd1e2ff2f7d039a6', '同步', '2017-09-06 14:07:35');
INSERT INTO `ccard_sync_client_log` VALUES ('134', '90a2e0269b6c878', '同步', '2017-09-09 16:49:31');
INSERT INTO `ccard_sync_client_log` VALUES ('135', '90a2e0269b6c878', '同步', '2017-09-09 17:17:27');
INSERT INTO `ccard_sync_client_log` VALUES ('136', '90a2e0269b6c878', '同步', '2017-09-09 17:17:37');
INSERT INTO `ccard_sync_client_log` VALUES ('137', '90a2e0269b6c878', '同步', '2017-09-09 17:17:41');
INSERT INTO `ccard_sync_client_log` VALUES ('138', '90a2e0269b6c878', '同步', '2017-09-11 12:16:13');
INSERT INTO `ccard_sync_client_log` VALUES ('139', '90a2e0269b6c878', '同步', '2017-09-11 12:16:22');
INSERT INTO `ccard_sync_client_log` VALUES ('140', '90a2e0269b6c878', '同步', '2017-09-11 12:19:07');
INSERT INTO `ccard_sync_client_log` VALUES ('141', '951bae5fb2dde2a0', '同步', '2017-09-12 15:06:43');
INSERT INTO `ccard_sync_client_log` VALUES ('142', '90a2e0269b6c878', '同步', '2017-09-14 08:37:57');
INSERT INTO `ccard_sync_client_log` VALUES ('143', '90a2e0269b6c878', '同步', '2017-09-14 10:41:21');
INSERT INTO `ccard_sync_client_log` VALUES ('144', '90a2e0269b6c878', '同步', '2017-09-14 10:41:33');
INSERT INTO `ccard_sync_client_log` VALUES ('145', '90a2e0269b6c878', '同步', '2017-09-14 10:56:43');
INSERT INTO `ccard_sync_client_log` VALUES ('146', '90a2e0269b6c878', '同步', '2017-09-14 14:41:37');
INSERT INTO `ccard_sync_client_log` VALUES ('147', '90a2e0269b6c878', '同步', '2017-09-21 10:04:39');
INSERT INTO `ccard_sync_client_log` VALUES ('148', '90a2e0269b6c878', '同步', '2017-09-21 10:04:56');
INSERT INTO `ccard_sync_client_log` VALUES ('149', '90a2e0269b6c878', '同步', '2017-09-21 10:05:14');
INSERT INTO `ccard_sync_client_log` VALUES ('150', '90a2e0269b6c878', '同步', '2017-09-22 08:44:31');
INSERT INTO `ccard_sync_client_log` VALUES ('151', '90a2e0269b6c878', '同步', '2017-09-22 08:57:05');
INSERT INTO `ccard_sync_client_log` VALUES ('152', '90a2e0269b6c878', '同步', '2017-09-25 13:37:08');
INSERT INTO `ccard_sync_client_log` VALUES ('153', '90a2e0269b6c878', '同步', '2017-09-25 13:37:26');
INSERT INTO `ccard_sync_client_log` VALUES ('154', '90a2e0269b6c878', '同步', '2017-09-25 13:37:47');
INSERT INTO `ccard_sync_client_log` VALUES ('155', '90a2e0269b6c878', '同步', '2017-09-25 13:46:34');
INSERT INTO `ccard_sync_client_log` VALUES ('156', '90a2e0269b6c878', '同步', '2017-09-25 15:25:23');
INSERT INTO `ccard_sync_client_log` VALUES ('157', '90a2e0269b6c878', '同步', '2017-09-26 10:00:46');
INSERT INTO `ccard_sync_client_log` VALUES ('158', '90a2e0269b6c878', '同步', '2017-09-29 08:46:53');
INSERT INTO `ccard_sync_client_log` VALUES ('159', '90a2e0269b6c878', '同步', '2017-10-11 09:31:21');
INSERT INTO `ccard_sync_client_log` VALUES ('160', '90a2e0269b6c878', '同步', '2017-10-11 14:55:35');
INSERT INTO `ccard_sync_client_log` VALUES ('161', '90a2e0269b6c878', '同步', '2017-10-12 10:21:25');
INSERT INTO `ccard_sync_client_log` VALUES ('162', '90a2e0269b6c878', '同步', '2017-10-12 10:21:33');
INSERT INTO `ccard_sync_client_log` VALUES ('163', '90a2e0269b6c878', '同步', '2017-10-13 16:35:22');
INSERT INTO `ccard_sync_client_log` VALUES ('164', '90a2e0269b6c878', '同步', '2017-10-13 21:04:56');
INSERT INTO `ccard_sync_client_log` VALUES ('165', '90a2e0269b6c878', '同步', '2017-10-13 21:04:59');
INSERT INTO `ccard_sync_client_log` VALUES ('166', '90a2e0269b6c878', '同步', '2017-10-13 21:05:01');
INSERT INTO `ccard_sync_client_log` VALUES ('167', '90a2e0269b6c878', '同步', '2017-10-13 21:54:47');
INSERT INTO `ccard_sync_client_log` VALUES ('168', '90a2e0269b6c878', '同步', '2017-10-14 08:02:29');
INSERT INTO `ccard_sync_client_log` VALUES ('169', '90a2e0269b6c878', '同步', '2017-10-14 08:05:29');
INSERT INTO `ccard_sync_client_log` VALUES ('170', '90a2e0269b6c878', '同步', '2018-01-22 15:08:53');
INSERT INTO `ccard_sync_client_log` VALUES ('171', '90a2e0269b6c878', '同步', '2018-01-22 15:09:45');
INSERT INTO `ccard_sync_client_log` VALUES ('172', '90a2e0269b6c878', '同步', '2018-01-23 15:17:50');
INSERT INTO `ccard_sync_client_log` VALUES ('173', '90a2e0269b6c878', '同步', '2018-01-25 16:03:26');
INSERT INTO `ccard_sync_client_log` VALUES ('174', '90a2e0269b6c878', '同步', '2018-01-25 16:03:30');
INSERT INTO `ccard_sync_client_log` VALUES ('175', '90a2e0269b6c878', '同步', '2018-01-25 17:26:27');
INSERT INTO `ccard_sync_client_log` VALUES ('176', '90a2e0269b6c878', '同步', '2018-01-25 17:26:30');
INSERT INTO `ccard_sync_client_log` VALUES ('177', '90a2e0269b6c878', '同步', '2018-01-25 17:26:45');
INSERT INTO `ccard_sync_client_log` VALUES ('178', '90a2e0269b6c878', '同步', '2018-01-26 08:38:59');
INSERT INTO `ccard_sync_client_log` VALUES ('179', '90a2e0269b6c878', '同步', '2018-01-26 08:41:27');
INSERT INTO `ccard_sync_client_log` VALUES ('180', '90a2e0269b6c878', '同步', '2018-01-26 08:41:31');
INSERT INTO `ccard_sync_client_log` VALUES ('181', '90a2e0269b6c878', '同步', '2018-01-26 08:58:36');
INSERT INTO `ccard_sync_client_log` VALUES ('182', '90a2e0269b6c878', '同步', '2018-01-26 08:58:40');
INSERT INTO `ccard_sync_client_log` VALUES ('183', '90a2e0269b6c878', '同步', '2018-01-26 09:05:01');
INSERT INTO `ccard_sync_client_log` VALUES ('184', '90a2e0269b6c878', '同步', '2018-01-26 09:18:36');
INSERT INTO `ccard_sync_client_log` VALUES ('185', '90a2e0269b6c878', '同步', '2018-01-26 16:27:13');
INSERT INTO `ccard_sync_client_log` VALUES ('186', '90a2e0269b6c878', '同步', '2018-01-26 16:27:16');

-- ----------------------------
-- Table structure for ccard_sync_food_log
-- ----------------------------
DROP TABLE IF EXISTS `ccard_sync_food_log`;
CREATE TABLE `ccard_sync_food_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `devid` varchar(50) NOT NULL,
  `operate` varchar(50) NOT NULL,
  `add_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=573 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ccard_sync_food_log
-- ----------------------------
INSERT INTO `ccard_sync_food_log` VALUES ('97', '951bae5fb2dde2a0', '同步', '2017-08-11 10:40:02');
INSERT INTO `ccard_sync_food_log` VALUES ('98', '951bae5fb2dde2a0', '同步', '2017-08-11 10:55:07');
INSERT INTO `ccard_sync_food_log` VALUES ('99', '951bae5fb2dde2a0', '同步', '2017-08-11 11:16:14');
INSERT INTO `ccard_sync_food_log` VALUES ('100', '951bae5fb2dde2a0', '同步', '2017-08-11 11:17:04');
INSERT INTO `ccard_sync_food_log` VALUES ('101', '951bae5fb2dde2a0', '同步', '2017-08-21 12:25:14');
INSERT INTO `ccard_sync_food_log` VALUES ('102', '951bae5fb2dde2a0', '同步', '2017-08-28 10:29:56');
INSERT INTO `ccard_sync_food_log` VALUES ('103', '951bae5fb2dde2a0', '同步', '2017-08-28 10:32:18');
INSERT INTO `ccard_sync_food_log` VALUES ('104', '951bae5fb2dde2a0', '同步', '2017-08-28 17:08:16');
INSERT INTO `ccard_sync_food_log` VALUES ('105', '951bae5fb2dde2a0', '同步', '2017-08-28 17:10:47');
INSERT INTO `ccard_sync_food_log` VALUES ('106', '951bae5fb2dde2a0', '同步', '2017-08-28 17:11:13');
INSERT INTO `ccard_sync_food_log` VALUES ('107', '951bae5fb2dde2a0', '同步', '2017-08-28 17:18:28');
INSERT INTO `ccard_sync_food_log` VALUES ('108', '951bae5fb2dde2a0', '同步', '2017-08-28 17:38:18');
INSERT INTO `ccard_sync_food_log` VALUES ('109', '951bae5fb2dde2a0', '同步', '2017-08-28 17:39:29');
INSERT INTO `ccard_sync_food_log` VALUES ('110', '951bae5fb2dde2a0', '同步', '2017-08-28 17:52:33');
INSERT INTO `ccard_sync_food_log` VALUES ('111', '951bae5fb2dde2a0', '同步', '2017-08-28 18:33:00');
INSERT INTO `ccard_sync_food_log` VALUES ('112', '951bae5fb2dde2a0', '同步', '2017-08-28 18:33:18');
INSERT INTO `ccard_sync_food_log` VALUES ('113', '951bae5fb2dde2a0', '同步', '2017-08-28 18:33:19');
INSERT INTO `ccard_sync_food_log` VALUES ('114', '951bae5fb2dde2a0', '同步', '2017-08-28 18:33:20');
INSERT INTO `ccard_sync_food_log` VALUES ('115', '951bae5fb2dde2a0', '同步', '2017-08-28 18:33:21');
INSERT INTO `ccard_sync_food_log` VALUES ('116', '951bae5fb2dde2a0', '同步', '2017-08-28 18:33:21');
INSERT INTO `ccard_sync_food_log` VALUES ('117', '951bae5fb2dde2a0', '同步', '2017-08-28 18:33:22');
INSERT INTO `ccard_sync_food_log` VALUES ('118', '951bae5fb2dde2a0', '同步', '2017-08-28 18:35:44');
INSERT INTO `ccard_sync_food_log` VALUES ('119', '951bae5fb2dde2a0', '同步', '2017-08-28 18:35:45');
INSERT INTO `ccard_sync_food_log` VALUES ('120', '951bae5fb2dde2a0', '同步', '2017-08-28 18:35:46');
INSERT INTO `ccard_sync_food_log` VALUES ('121', '951bae5fb2dde2a0', '同步', '2017-08-28 18:35:47');
INSERT INTO `ccard_sync_food_log` VALUES ('122', '951bae5fb2dde2a0', '同步', '2017-08-28 18:35:48');
INSERT INTO `ccard_sync_food_log` VALUES ('123', '951bae5fb2dde2a0', '同步', '2017-08-28 18:39:17');
INSERT INTO `ccard_sync_food_log` VALUES ('124', '951bae5fb2dde2a0', '同步', '2017-08-28 18:39:18');
INSERT INTO `ccard_sync_food_log` VALUES ('125', '951bae5fb2dde2a0', '同步', '2017-08-28 18:39:19');
INSERT INTO `ccard_sync_food_log` VALUES ('126', '951bae5fb2dde2a0', '同步', '2017-08-28 18:39:20');
INSERT INTO `ccard_sync_food_log` VALUES ('127', '951bae5fb2dde2a0', '同步', '2017-08-28 18:39:21');
INSERT INTO `ccard_sync_food_log` VALUES ('128', '951bae5fb2dde2a0', '同步', '2017-08-28 18:39:22');
INSERT INTO `ccard_sync_food_log` VALUES ('129', '951bae5fb2dde2a0', '同步', '2017-08-28 18:39:22');
INSERT INTO `ccard_sync_food_log` VALUES ('130', '951bae5fb2dde2a0', '同步', '2017-08-28 18:39:23');
INSERT INTO `ccard_sync_food_log` VALUES ('131', '951bae5fb2dde2a0', '同步', '2017-08-28 18:39:24');
INSERT INTO `ccard_sync_food_log` VALUES ('132', '951bae5fb2dde2a0', '同步', '2017-08-28 18:39:25');
INSERT INTO `ccard_sync_food_log` VALUES ('133', '951bae5fb2dde2a0', '同步', '2017-08-28 18:39:25');
INSERT INTO `ccard_sync_food_log` VALUES ('134', '951bae5fb2dde2a0', '同步', '2017-08-28 18:39:26');
INSERT INTO `ccard_sync_food_log` VALUES ('135', '951bae5fb2dde2a0', '同步', '2017-08-28 19:04:07');
INSERT INTO `ccard_sync_food_log` VALUES ('136', '951bae5fb2dde2a0', '同步', '2017-08-28 19:04:07');
INSERT INTO `ccard_sync_food_log` VALUES ('137', '951bae5fb2dde2a0', '同步', '2017-08-28 19:04:08');
INSERT INTO `ccard_sync_food_log` VALUES ('138', '951bae5fb2dde2a0', '同步', '2017-08-29 08:07:40');
INSERT INTO `ccard_sync_food_log` VALUES ('139', '951bae5fb2dde2a0', '同步', '2017-08-29 08:51:45');
INSERT INTO `ccard_sync_food_log` VALUES ('140', '951bae5fb2dde2a0', '同步', '2017-08-29 08:58:43');
INSERT INTO `ccard_sync_food_log` VALUES ('141', '951bae5fb2dde2a0', '同步', '2017-08-29 09:00:38');
INSERT INTO `ccard_sync_food_log` VALUES ('142', '951bae5fb2dde2a0', '同步', '2017-08-29 09:02:25');
INSERT INTO `ccard_sync_food_log` VALUES ('143', '951bae5fb2dde2a0', '同步', '2017-08-29 09:12:09');
INSERT INTO `ccard_sync_food_log` VALUES ('144', '951bae5fb2dde2a0', '同步', '2017-08-29 09:12:56');
INSERT INTO `ccard_sync_food_log` VALUES ('145', '951bae5fb2dde2a0', '同步', '2017-08-29 09:13:01');
INSERT INTO `ccard_sync_food_log` VALUES ('146', '951bae5fb2dde2a0', '同步', '2017-08-29 09:13:09');
INSERT INTO `ccard_sync_food_log` VALUES ('147', '951bae5fb2dde2a0', '同步', '2017-08-29 09:13:15');
INSERT INTO `ccard_sync_food_log` VALUES ('148', '951bae5fb2dde2a0', '同步', '2017-08-29 09:14:18');
INSERT INTO `ccard_sync_food_log` VALUES ('149', '951bae5fb2dde2a0', '同步', '2017-08-29 09:14:58');
INSERT INTO `ccard_sync_food_log` VALUES ('150', '951bae5fb2dde2a0', '同步', '2017-08-29 09:15:06');
INSERT INTO `ccard_sync_food_log` VALUES ('151', '951bae5fb2dde2a0', '同步', '2017-08-29 09:17:20');
INSERT INTO `ccard_sync_food_log` VALUES ('152', '951bae5fb2dde2a0', '同步', '2017-08-29 09:18:42');
INSERT INTO `ccard_sync_food_log` VALUES ('153', '951bae5fb2dde2a0', '同步', '2017-08-29 09:18:55');
INSERT INTO `ccard_sync_food_log` VALUES ('154', '951bae5fb2dde2a0', '同步', '2017-08-29 09:19:00');
INSERT INTO `ccard_sync_food_log` VALUES ('155', '951bae5fb2dde2a0', '同步', '2017-08-29 09:19:04');
INSERT INTO `ccard_sync_food_log` VALUES ('156', '951bae5fb2dde2a0', '同步', '2017-08-29 09:19:07');
INSERT INTO `ccard_sync_food_log` VALUES ('157', '951bae5fb2dde2a0', '同步', '2017-08-29 09:20:00');
INSERT INTO `ccard_sync_food_log` VALUES ('158', '951bae5fb2dde2a0', '同步', '2017-08-29 09:30:05');
INSERT INTO `ccard_sync_food_log` VALUES ('159', '951bae5fb2dde2a0', '同步', '2017-08-29 09:41:48');
INSERT INTO `ccard_sync_food_log` VALUES ('160', '951bae5fb2dde2a0', '同步', '2017-08-29 09:41:54');
INSERT INTO `ccard_sync_food_log` VALUES ('161', '951bae5fb2dde2a0', '同步', '2017-08-29 09:41:58');
INSERT INTO `ccard_sync_food_log` VALUES ('162', '951bae5fb2dde2a0', '同步', '2017-08-29 09:42:06');
INSERT INTO `ccard_sync_food_log` VALUES ('163', '951bae5fb2dde2a0', '同步', '2017-08-29 09:42:17');
INSERT INTO `ccard_sync_food_log` VALUES ('164', '951bae5fb2dde2a0', '同步', '2017-08-29 09:49:32');
INSERT INTO `ccard_sync_food_log` VALUES ('165', '951bae5fb2dde2a0', '同步', '2017-08-29 09:49:43');
INSERT INTO `ccard_sync_food_log` VALUES ('166', '951bae5fb2dde2a0', '同步', '2017-08-29 09:49:54');
INSERT INTO `ccard_sync_food_log` VALUES ('167', '951bae5fb2dde2a0', '同步', '2017-08-29 09:50:00');
INSERT INTO `ccard_sync_food_log` VALUES ('168', '951bae5fb2dde2a0', '同步', '2017-08-29 09:50:21');
INSERT INTO `ccard_sync_food_log` VALUES ('169', '951bae5fb2dde2a0', '同步', '2017-08-29 09:51:09');
INSERT INTO `ccard_sync_food_log` VALUES ('170', '951bae5fb2dde2a0', '同步', '2017-08-29 09:51:36');
INSERT INTO `ccard_sync_food_log` VALUES ('171', '951bae5fb2dde2a0', '同步', '2017-08-29 11:43:09');
INSERT INTO `ccard_sync_food_log` VALUES ('172', '951bae5fb2dde2a0', '同步', '2017-08-29 14:19:20');
INSERT INTO `ccard_sync_food_log` VALUES ('173', '951bae5fb2dde2a0', '同步', '2017-08-30 08:34:30');
INSERT INTO `ccard_sync_food_log` VALUES ('174', '951bae5fb2dde2a0', '同步', '2017-08-30 09:08:52');
INSERT INTO `ccard_sync_food_log` VALUES ('175', '951bae5fb2dde2a0', '同步', '2017-08-30 09:23:52');
INSERT INTO `ccard_sync_food_log` VALUES ('176', '951bae5fb2dde2a0', '同步', '2017-08-30 09:26:56');
INSERT INTO `ccard_sync_food_log` VALUES ('177', '951bae5fb2dde2a0', '同步', '2017-08-30 09:57:03');
INSERT INTO `ccard_sync_food_log` VALUES ('178', '951bae5fb2dde2a0', '同步', '2017-08-30 11:18:57');
INSERT INTO `ccard_sync_food_log` VALUES ('179', '951bae5fb2dde2a0', '同步', '2017-08-30 11:24:16');
INSERT INTO `ccard_sync_food_log` VALUES ('180', '951bae5fb2dde2a0', '同步', '2017-08-30 11:26:27');
INSERT INTO `ccard_sync_food_log` VALUES ('181', '951bae5fb2dde2a0', '同步', '2017-08-30 11:32:04');
INSERT INTO `ccard_sync_food_log` VALUES ('182', '951bae5fb2dde2a0', '同步', '2017-08-30 11:33:05');
INSERT INTO `ccard_sync_food_log` VALUES ('183', '951bae5fb2dde2a0', '同步', '2017-08-30 11:48:36');
INSERT INTO `ccard_sync_food_log` VALUES ('184', '951bae5fb2dde2a0', '同步', '2017-08-30 14:13:05');
INSERT INTO `ccard_sync_food_log` VALUES ('185', '951bae5fb2dde2a0', '同步', '2017-08-30 14:27:10');
INSERT INTO `ccard_sync_food_log` VALUES ('186', '951bae5fb2dde2a0', '同步', '2017-08-30 14:27:18');
INSERT INTO `ccard_sync_food_log` VALUES ('187', '951bae5fb2dde2a0', '同步', '2017-08-30 15:26:29');
INSERT INTO `ccard_sync_food_log` VALUES ('188', '951bae5fb2dde2a0', '同步', '2017-08-30 15:26:30');
INSERT INTO `ccard_sync_food_log` VALUES ('189', '951bae5fb2dde2a0', '同步', '2017-08-30 15:26:31');
INSERT INTO `ccard_sync_food_log` VALUES ('190', '951bae5fb2dde2a0', '同步', '2017-08-30 15:27:15');
INSERT INTO `ccard_sync_food_log` VALUES ('191', '951bae5fb2dde2a0', '同步', '2017-08-30 15:27:20');
INSERT INTO `ccard_sync_food_log` VALUES ('192', '951bae5fb2dde2a0', '同步', '2017-08-30 15:27:24');
INSERT INTO `ccard_sync_food_log` VALUES ('193', '951bae5fb2dde2a0', '同步', '2017-08-30 15:27:28');
INSERT INTO `ccard_sync_food_log` VALUES ('194', '951bae5fb2dde2a0', '同步', '2017-08-30 15:32:48');
INSERT INTO `ccard_sync_food_log` VALUES ('195', '951bae5fb2dde2a0', '同步', '2017-08-30 15:44:54');
INSERT INTO `ccard_sync_food_log` VALUES ('196', '951bae5fb2dde2a0', '同步', '2017-08-30 15:49:50');
INSERT INTO `ccard_sync_food_log` VALUES ('197', '951bae5fb2dde2a0', '同步', '2017-08-30 16:06:24');
INSERT INTO `ccard_sync_food_log` VALUES ('198', '951bae5fb2dde2a0', '同步', '2017-08-30 16:08:01');
INSERT INTO `ccard_sync_food_log` VALUES ('199', '951bae5fb2dde2a0', '同步', '2017-08-30 17:01:19');
INSERT INTO `ccard_sync_food_log` VALUES ('200', '951bae5fb2dde2a0', '同步', '2017-08-30 17:09:23');
INSERT INTO `ccard_sync_food_log` VALUES ('201', '951bae5fb2dde2a0', '同步', '2017-08-30 17:11:28');
INSERT INTO `ccard_sync_food_log` VALUES ('202', '951bae5fb2dde2a0', '同步', '2017-08-30 17:15:40');
INSERT INTO `ccard_sync_food_log` VALUES ('203', '951bae5fb2dde2a0', '同步', '2017-08-30 17:17:08');
INSERT INTO `ccard_sync_food_log` VALUES ('204', '951bae5fb2dde2a0', '同步', '2017-08-30 17:28:12');
INSERT INTO `ccard_sync_food_log` VALUES ('205', '951bae5fb2dde2a0', '同步', '2017-08-31 08:17:38');
INSERT INTO `ccard_sync_food_log` VALUES ('206', '951bae5fb2dde2a0', '同步', '2017-08-31 08:34:17');
INSERT INTO `ccard_sync_food_log` VALUES ('207', '951bae5fb2dde2a0', '同步', '2017-08-31 08:35:48');
INSERT INTO `ccard_sync_food_log` VALUES ('208', '951bae5fb2dde2a0', '同步', '2017-08-31 08:37:00');
INSERT INTO `ccard_sync_food_log` VALUES ('209', '951bae5fb2dde2a0', '同步', '2017-08-31 08:39:27');
INSERT INTO `ccard_sync_food_log` VALUES ('210', '951bae5fb2dde2a0', '同步', '2017-08-31 08:44:46');
INSERT INTO `ccard_sync_food_log` VALUES ('211', '951bae5fb2dde2a0', '同步', '2017-08-31 08:44:52');
INSERT INTO `ccard_sync_food_log` VALUES ('212', '951bae5fb2dde2a0', '同步', '2017-08-31 08:45:08');
INSERT INTO `ccard_sync_food_log` VALUES ('213', '951bae5fb2dde2a0', '同步', '2017-08-31 08:45:17');
INSERT INTO `ccard_sync_food_log` VALUES ('214', '951bae5fb2dde2a0', '同步', '2017-08-31 08:45:29');
INSERT INTO `ccard_sync_food_log` VALUES ('215', '951bae5fb2dde2a0', '同步', '2017-08-31 08:45:48');
INSERT INTO `ccard_sync_food_log` VALUES ('216', '951bae5fb2dde2a0', '同步', '2017-08-31 08:45:57');
INSERT INTO `ccard_sync_food_log` VALUES ('217', '951bae5fb2dde2a0', '同步', '2017-08-31 08:53:04');
INSERT INTO `ccard_sync_food_log` VALUES ('218', '951bae5fb2dde2a0', '同步', '2017-08-31 08:53:07');
INSERT INTO `ccard_sync_food_log` VALUES ('219', '951bae5fb2dde2a0', '同步', '2017-08-31 08:53:18');
INSERT INTO `ccard_sync_food_log` VALUES ('220', '951bae5fb2dde2a0', '同步', '2017-08-31 08:55:57');
INSERT INTO `ccard_sync_food_log` VALUES ('221', '951bae5fb2dde2a0', '同步', '2017-08-31 09:06:50');
INSERT INTO `ccard_sync_food_log` VALUES ('222', '951bae5fb2dde2a0', '同步', '2017-08-31 09:23:36');
INSERT INTO `ccard_sync_food_log` VALUES ('223', '951bae5fb2dde2a0', '同步', '2017-08-31 09:23:37');
INSERT INTO `ccard_sync_food_log` VALUES ('224', '951bae5fb2dde2a0', '同步', '2017-08-31 10:20:12');
INSERT INTO `ccard_sync_food_log` VALUES ('225', '951bae5fb2dde2a0', '同步', '2017-08-31 10:20:20');
INSERT INTO `ccard_sync_food_log` VALUES ('226', '951bae5fb2dde2a0', '同步', '2017-08-31 10:20:25');
INSERT INTO `ccard_sync_food_log` VALUES ('227', '951bae5fb2dde2a0', '同步', '2017-08-31 10:20:29');
INSERT INTO `ccard_sync_food_log` VALUES ('228', '951bae5fb2dde2a0', '同步', '2017-08-31 10:20:30');
INSERT INTO `ccard_sync_food_log` VALUES ('229', '951bae5fb2dde2a0', '同步', '2017-08-31 10:20:41');
INSERT INTO `ccard_sync_food_log` VALUES ('230', '951bae5fb2dde2a0', '同步', '2017-08-31 10:45:00');
INSERT INTO `ccard_sync_food_log` VALUES ('231', '951bae5fb2dde2a0', '同步', '2017-08-31 10:49:47');
INSERT INTO `ccard_sync_food_log` VALUES ('232', '951bae5fb2dde2a0', '同步', '2017-08-31 10:53:22');
INSERT INTO `ccard_sync_food_log` VALUES ('233', '951bae5fb2dde2a0', '同步', '2017-08-31 11:31:15');
INSERT INTO `ccard_sync_food_log` VALUES ('234', '951bae5fb2dde2a0', '同步', '2017-08-31 11:43:45');
INSERT INTO `ccard_sync_food_log` VALUES ('235', '951bae5fb2dde2a0', '同步', '2017-08-31 13:39:19');
INSERT INTO `ccard_sync_food_log` VALUES ('236', '951bae5fb2dde2a0', '同步', '2017-08-31 13:45:04');
INSERT INTO `ccard_sync_food_log` VALUES ('237', '951bae5fb2dde2a0', '同步', '2017-08-31 13:46:43');
INSERT INTO `ccard_sync_food_log` VALUES ('238', '951bae5fb2dde2a0', '同步', '2017-08-31 14:03:24');
INSERT INTO `ccard_sync_food_log` VALUES ('239', '951bae5fb2dde2a0', '同步', '2017-08-31 14:08:54');
INSERT INTO `ccard_sync_food_log` VALUES ('240', '951bae5fb2dde2a0', '同步', '2017-08-31 14:13:06');
INSERT INTO `ccard_sync_food_log` VALUES ('241', '951bae5fb2dde2a0', '同步', '2017-08-31 14:15:09');
INSERT INTO `ccard_sync_food_log` VALUES ('242', '951bae5fb2dde2a0', '同步', '2017-08-31 14:20:26');
INSERT INTO `ccard_sync_food_log` VALUES ('243', '951bae5fb2dde2a0', '同步', '2017-08-31 14:27:53');
INSERT INTO `ccard_sync_food_log` VALUES ('244', '951bae5fb2dde2a0', '同步', '2017-08-31 14:28:30');
INSERT INTO `ccard_sync_food_log` VALUES ('245', '951bae5fb2dde2a0', '同步', '2017-08-31 14:28:42');
INSERT INTO `ccard_sync_food_log` VALUES ('246', '951bae5fb2dde2a0', '同步', '2017-08-31 14:29:04');
INSERT INTO `ccard_sync_food_log` VALUES ('247', '951bae5fb2dde2a0', '同步', '2017-08-31 14:31:23');
INSERT INTO `ccard_sync_food_log` VALUES ('248', '951bae5fb2dde2a0', '同步', '2017-08-31 14:52:25');
INSERT INTO `ccard_sync_food_log` VALUES ('249', '951bae5fb2dde2a0', '同步', '2017-08-31 14:52:48');
INSERT INTO `ccard_sync_food_log` VALUES ('250', '951bae5fb2dde2a0', '同步', '2017-08-31 14:59:26');
INSERT INTO `ccard_sync_food_log` VALUES ('251', '951bae5fb2dde2a0', '同步', '2017-08-31 15:02:30');
INSERT INTO `ccard_sync_food_log` VALUES ('252', '951bae5fb2dde2a0', '同步', '2017-08-31 15:09:16');
INSERT INTO `ccard_sync_food_log` VALUES ('253', '951bae5fb2dde2a0', '同步', '2017-08-31 15:09:30');
INSERT INTO `ccard_sync_food_log` VALUES ('254', '951bae5fb2dde2a0', '同步', '2017-08-31 15:23:20');
INSERT INTO `ccard_sync_food_log` VALUES ('255', '1111', '同步', '2017-08-31 15:25:19');
INSERT INTO `ccard_sync_food_log` VALUES ('256', '951bae5fb2dde2a0', '同步', '2017-08-31 15:26:36');
INSERT INTO `ccard_sync_food_log` VALUES ('257', '951bae5fb2dde2a0', '同步', '2017-08-31 15:33:20');
INSERT INTO `ccard_sync_food_log` VALUES ('258', '951bae5fb2dde2a0', '同步', '2017-08-31 15:34:19');
INSERT INTO `ccard_sync_food_log` VALUES ('259', '951bae5fb2dde2a0', '同步', '2017-08-31 15:37:14');
INSERT INTO `ccard_sync_food_log` VALUES ('260', '951bae5fb2dde2a0', '同步', '2017-08-31 15:38:40');
INSERT INTO `ccard_sync_food_log` VALUES ('261', '951bae5fb2dde2a0', '同步', '2017-08-31 15:40:16');
INSERT INTO `ccard_sync_food_log` VALUES ('262', '951bae5fb2dde2a0', '同步', '2017-08-31 15:41:33');
INSERT INTO `ccard_sync_food_log` VALUES ('263', '951bae5fb2dde2a0', '同步', '2017-08-31 15:42:59');
INSERT INTO `ccard_sync_food_log` VALUES ('264', '951bae5fb2dde2a0', '同步', '2017-08-31 15:43:54');
INSERT INTO `ccard_sync_food_log` VALUES ('265', '951bae5fb2dde2a0', '同步', '2017-08-31 15:44:14');
INSERT INTO `ccard_sync_food_log` VALUES ('266', '951bae5fb2dde2a0', '同步', '2017-08-31 15:45:06');
INSERT INTO `ccard_sync_food_log` VALUES ('267', '951bae5fb2dde2a0', '同步', '2017-08-31 15:45:10');
INSERT INTO `ccard_sync_food_log` VALUES ('268', '951bae5fb2dde2a0', '同步', '2017-08-31 15:45:13');
INSERT INTO `ccard_sync_food_log` VALUES ('269', '951bae5fb2dde2a0', '同步', '2017-08-31 15:48:10');
INSERT INTO `ccard_sync_food_log` VALUES ('270', '951bae5fb2dde2a0', '同步', '2017-08-31 15:48:11');
INSERT INTO `ccard_sync_food_log` VALUES ('271', '951bae5fb2dde2a0', '同步', '2017-08-31 15:55:41');
INSERT INTO `ccard_sync_food_log` VALUES ('272', '951bae5fb2dde2a0', '同步', '2017-08-31 15:58:35');
INSERT INTO `ccard_sync_food_log` VALUES ('273', '951bae5fb2dde2a0', '同步', '2017-08-31 16:00:06');
INSERT INTO `ccard_sync_food_log` VALUES ('274', '951bae5fb2dde2a0', '同步', '2017-08-31 16:02:37');
INSERT INTO `ccard_sync_food_log` VALUES ('275', '951bae5fb2dde2a0', '同步', '2017-08-31 16:28:14');
INSERT INTO `ccard_sync_food_log` VALUES ('276', '951bae5fb2dde2a0', '同步', '2017-08-31 16:29:45');
INSERT INTO `ccard_sync_food_log` VALUES ('277', '951bae5fb2dde2a0', '同步', '2017-08-31 16:30:56');
INSERT INTO `ccard_sync_food_log` VALUES ('278', '951bae5fb2dde2a0', '同步', '2017-08-31 16:33:50');
INSERT INTO `ccard_sync_food_log` VALUES ('279', '951bae5fb2dde2a0', '同步', '2017-08-31 16:35:00');
INSERT INTO `ccard_sync_food_log` VALUES ('280', '951bae5fb2dde2a0', '同步', '2017-08-31 16:40:22');
INSERT INTO `ccard_sync_food_log` VALUES ('281', '4328c173b1e411c2', '同步', '2017-08-31 17:15:16');
INSERT INTO `ccard_sync_food_log` VALUES ('282', 'bd1e2ff2f7d039a6', '同步', '2017-08-31 17:18:13');
INSERT INTO `ccard_sync_food_log` VALUES ('283', 'bd1e2ff2f7d039a6', '同步', '2017-08-31 17:22:52');
INSERT INTO `ccard_sync_food_log` VALUES ('284', 'bd1e2ff2f7d039a6', '同步', '2017-08-31 17:23:34');
INSERT INTO `ccard_sync_food_log` VALUES ('285', '90a2e0269b6c878', '同步', '2017-08-31 17:25:47');
INSERT INTO `ccard_sync_food_log` VALUES ('286', '90a2e0269b6c878', '同步', '2017-08-31 17:50:23');
INSERT INTO `ccard_sync_food_log` VALUES ('287', '90a2e0269b6c878', '同步', '2017-08-31 17:54:05');
INSERT INTO `ccard_sync_food_log` VALUES ('288', '90a2e0269b6c878', '同步', '2017-08-31 17:58:27');
INSERT INTO `ccard_sync_food_log` VALUES ('289', 'bd1e2ff2f7d039a6', '同步', '2017-08-31 18:22:45');
INSERT INTO `ccard_sync_food_log` VALUES ('290', 'bd1e2ff2f7d039a6', '同步', '2017-08-31 18:25:15');
INSERT INTO `ccard_sync_food_log` VALUES ('291', 'bd1e2ff2f7d039a6', '同步', '2017-08-31 18:28:08');
INSERT INTO `ccard_sync_food_log` VALUES ('292', '90a2e0269b6c878', '同步', '2017-08-31 20:00:26');
INSERT INTO `ccard_sync_food_log` VALUES ('293', '90a2e0269b6c878', '同步', '2017-08-31 20:02:59');
INSERT INTO `ccard_sync_food_log` VALUES ('294', '90a2e0269b6c878', '同步', '2017-08-31 20:03:01');
INSERT INTO `ccard_sync_food_log` VALUES ('295', '90a2e0269b6c878', '同步', '2017-08-31 20:04:54');
INSERT INTO `ccard_sync_food_log` VALUES ('296', '90a2e0269b6c878', '同步', '2017-08-31 20:05:20');
INSERT INTO `ccard_sync_food_log` VALUES ('297', '90a2e0269b6c878', '同步', '2017-09-01 09:17:21');
INSERT INTO `ccard_sync_food_log` VALUES ('298', '90a2e0269b6c878', '同步', '2017-09-01 09:20:37');
INSERT INTO `ccard_sync_food_log` VALUES ('299', '90a2e0269b6c878', '同步', '2017-09-01 10:03:57');
INSERT INTO `ccard_sync_food_log` VALUES ('300', '90a2e0269b6c878', '同步', '2017-09-01 10:04:27');
INSERT INTO `ccard_sync_food_log` VALUES ('301', '90a2e0269b6c878', '同步', '2017-09-01 10:09:25');
INSERT INTO `ccard_sync_food_log` VALUES ('302', '90a2e0269b6c878', '同步', '2017-09-01 10:12:29');
INSERT INTO `ccard_sync_food_log` VALUES ('303', '90a2e0269b6c878', '同步', '2017-09-01 10:12:37');
INSERT INTO `ccard_sync_food_log` VALUES ('304', '90a2e0269b6c878', '同步', '2017-09-01 10:18:21');
INSERT INTO `ccard_sync_food_log` VALUES ('305', '90a2e0269b6c878', '同步', '2017-09-01 10:18:38');
INSERT INTO `ccard_sync_food_log` VALUES ('306', '90a2e0269b6c878', '同步', '2017-09-01 10:33:31');
INSERT INTO `ccard_sync_food_log` VALUES ('307', '90a2e0269b6c878', '同步', '2017-09-01 10:33:39');
INSERT INTO `ccard_sync_food_log` VALUES ('308', '90a2e0269b6c878', '同步', '2017-09-01 11:19:10');
INSERT INTO `ccard_sync_food_log` VALUES ('309', '90a2e0269b6c878', '同步', '2017-09-01 11:21:43');
INSERT INTO `ccard_sync_food_log` VALUES ('310', '90a2e0269b6c878', '同步', '2017-09-01 11:21:46');
INSERT INTO `ccard_sync_food_log` VALUES ('311', '90a2e0269b6c878', '同步', '2017-09-01 11:22:44');
INSERT INTO `ccard_sync_food_log` VALUES ('312', '90a2e0269b6c878', '同步', '2017-09-01 11:22:47');
INSERT INTO `ccard_sync_food_log` VALUES ('313', '90a2e0269b6c878', '同步', '2017-09-01 11:24:12');
INSERT INTO `ccard_sync_food_log` VALUES ('314', '1111', '同步', '2017-09-01 14:06:41');
INSERT INTO `ccard_sync_food_log` VALUES ('315', '1111', '同步', '2017-09-01 14:09:10');
INSERT INTO `ccard_sync_food_log` VALUES ('316', '90a2e0269b6c878', '同步', '2017-09-01 14:09:42');
INSERT INTO `ccard_sync_food_log` VALUES ('317', '90a2e0269b6c878', '同步', '2017-09-01 14:10:25');
INSERT INTO `ccard_sync_food_log` VALUES ('318', '90a2e0269b6c878', '同步', '2017-09-01 14:50:39');
INSERT INTO `ccard_sync_food_log` VALUES ('319', '90a2e0269b6c878', '同步', '2017-09-01 14:52:56');
INSERT INTO `ccard_sync_food_log` VALUES ('320', '90a2e0269b6c878', '同步', '2017-09-01 14:53:07');
INSERT INTO `ccard_sync_food_log` VALUES ('321', '90a2e0269b6c878', '同步', '2017-09-01 15:08:25');
INSERT INTO `ccard_sync_food_log` VALUES ('322', '90a2e0269b6c878', '同步', '2017-09-01 17:31:20');
INSERT INTO `ccard_sync_food_log` VALUES ('323', '90a2e0269b6c878', '同步', '2017-09-01 17:31:26');
INSERT INTO `ccard_sync_food_log` VALUES ('324', '90a2e0269b6c878', '同步', '2017-09-01 17:34:25');
INSERT INTO `ccard_sync_food_log` VALUES ('325', '90a2e0269b6c878', '同步', '2017-09-01 17:35:45');
INSERT INTO `ccard_sync_food_log` VALUES ('326', '90a2e0269b6c878', '同步', '2017-09-01 17:40:27');
INSERT INTO `ccard_sync_food_log` VALUES ('327', '90a2e0269b6c878', '同步', '2017-09-02 09:41:48');
INSERT INTO `ccard_sync_food_log` VALUES ('328', '90a2e0269b6c878', '同步', '2017-09-02 09:41:49');
INSERT INTO `ccard_sync_food_log` VALUES ('329', '90a2e0269b6c878', '同步', '2017-09-02 09:41:54');
INSERT INTO `ccard_sync_food_log` VALUES ('330', '90a2e0269b6c878', '同步', '2017-09-02 09:42:03');
INSERT INTO `ccard_sync_food_log` VALUES ('331', '90a2e0269b6c878', '同步', '2017-09-02 09:42:09');
INSERT INTO `ccard_sync_food_log` VALUES ('332', '90a2e0269b6c878', '同步', '2017-09-02 09:42:30');
INSERT INTO `ccard_sync_food_log` VALUES ('333', '90a2e0269b6c878', '同步', '2017-09-02 09:42:37');
INSERT INTO `ccard_sync_food_log` VALUES ('334', '90a2e0269b6c878', '同步', '2017-09-02 09:42:40');
INSERT INTO `ccard_sync_food_log` VALUES ('335', '90a2e0269b6c878', '同步', '2017-09-02 09:42:44');
INSERT INTO `ccard_sync_food_log` VALUES ('336', '90a2e0269b6c878', '同步', '2017-09-02 09:43:08');
INSERT INTO `ccard_sync_food_log` VALUES ('337', '90a2e0269b6c878', '同步', '2017-09-02 09:43:14');
INSERT INTO `ccard_sync_food_log` VALUES ('338', '90a2e0269b6c878', '同步', '2017-09-02 09:45:46');
INSERT INTO `ccard_sync_food_log` VALUES ('339', '90a2e0269b6c878', '同步', '2017-09-02 09:45:51');
INSERT INTO `ccard_sync_food_log` VALUES ('340', '90a2e0269b6c878', '同步', '2017-09-02 09:49:39');
INSERT INTO `ccard_sync_food_log` VALUES ('341', '90a2e0269b6c878', '同步', '2017-09-02 09:49:43');
INSERT INTO `ccard_sync_food_log` VALUES ('342', '90a2e0269b6c878', '同步', '2017-09-02 09:50:28');
INSERT INTO `ccard_sync_food_log` VALUES ('343', '90a2e0269b6c878', '同步', '2017-09-02 14:58:52');
INSERT INTO `ccard_sync_food_log` VALUES ('344', '90a2e0269b6c878', '同步', '2017-09-02 14:58:57');
INSERT INTO `ccard_sync_food_log` VALUES ('345', '90a2e0269b6c878', '同步', '2017-09-02 14:59:01');
INSERT INTO `ccard_sync_food_log` VALUES ('346', '90a2e0269b6c878', '同步', '2017-09-02 14:59:15');
INSERT INTO `ccard_sync_food_log` VALUES ('347', '90a2e0269b6c878', '同步', '2017-09-02 15:16:07');
INSERT INTO `ccard_sync_food_log` VALUES ('348', '90a2e0269b6c878', '同步', '2017-09-02 15:17:59');
INSERT INTO `ccard_sync_food_log` VALUES ('349', '90a2e0269b6c878', '同步', '2017-09-02 15:18:02');
INSERT INTO `ccard_sync_food_log` VALUES ('350', '90a2e0269b6c878', '同步', '2017-09-02 15:18:05');
INSERT INTO `ccard_sync_food_log` VALUES ('351', '90a2e0269b6c878', '同步', '2017-09-02 15:23:34');
INSERT INTO `ccard_sync_food_log` VALUES ('352', '90a2e0269b6c878', '同步', '2017-09-02 15:24:29');
INSERT INTO `ccard_sync_food_log` VALUES ('353', '90a2e0269b6c878', '同步', '2017-09-02 15:26:54');
INSERT INTO `ccard_sync_food_log` VALUES ('354', '90a2e0269b6c878', '同步', '2017-09-02 15:27:09');
INSERT INTO `ccard_sync_food_log` VALUES ('355', '90a2e0269b6c878', '同步', '2017-09-02 15:31:11');
INSERT INTO `ccard_sync_food_log` VALUES ('356', '90a2e0269b6c878', '同步', '2017-09-02 15:38:37');
INSERT INTO `ccard_sync_food_log` VALUES ('357', '90a2e0269b6c878', '同步', '2017-09-02 15:39:29');
INSERT INTO `ccard_sync_food_log` VALUES ('358', '90a2e0269b6c878', '同步', '2017-09-02 15:39:32');
INSERT INTO `ccard_sync_food_log` VALUES ('359', '90a2e0269b6c878', '同步', '2017-09-02 15:48:35');
INSERT INTO `ccard_sync_food_log` VALUES ('360', '90a2e0269b6c878', '同步', '2017-09-02 17:47:14');
INSERT INTO `ccard_sync_food_log` VALUES ('361', '90a2e0269b6c878', '同步', '2017-09-02 17:53:38');
INSERT INTO `ccard_sync_food_log` VALUES ('362', '90a2e0269b6c878', '同步', '2017-09-02 17:54:31');
INSERT INTO `ccard_sync_food_log` VALUES ('363', '90a2e0269b6c878', '同步', '2017-09-02 18:04:05');
INSERT INTO `ccard_sync_food_log` VALUES ('364', '90a2e0269b6c878', '同步', '2017-09-02 18:06:51');
INSERT INTO `ccard_sync_food_log` VALUES ('365', '90a2e0269b6c878', '同步', '2017-09-02 18:24:41');
INSERT INTO `ccard_sync_food_log` VALUES ('366', '90a2e0269b6c878', '同步', '2017-09-02 18:29:14');
INSERT INTO `ccard_sync_food_log` VALUES ('367', '90a2e0269b6c878', '同步', '2017-09-02 18:46:54');
INSERT INTO `ccard_sync_food_log` VALUES ('368', '90a2e0269b6c878', '同步', '2017-09-04 13:44:47');
INSERT INTO `ccard_sync_food_log` VALUES ('369', '90a2e0269b6c878', '同步', '2017-09-04 13:45:33');
INSERT INTO `ccard_sync_food_log` VALUES ('370', '90a2e0269b6c878', '同步', '2017-09-04 17:29:42');
INSERT INTO `ccard_sync_food_log` VALUES ('371', '90a2e0269b6c878', '同步', '2017-09-05 10:27:47');
INSERT INTO `ccard_sync_food_log` VALUES ('372', '90a2e0269b6c878', '同步', '2017-09-05 10:31:45');
INSERT INTO `ccard_sync_food_log` VALUES ('373', '90a2e0269b6c878', '同步', '2017-09-05 10:34:30');
INSERT INTO `ccard_sync_food_log` VALUES ('374', '90a2e0269b6c878', '同步', '2017-09-05 10:35:06');
INSERT INTO `ccard_sync_food_log` VALUES ('375', '90a2e0269b6c878', '同步', '2017-09-05 11:30:12');
INSERT INTO `ccard_sync_food_log` VALUES ('376', '90a2e0269b6c878', '同步', '2017-09-05 11:37:29');
INSERT INTO `ccard_sync_food_log` VALUES ('377', '90a2e0269b6c878', '同步', '2017-09-05 14:45:27');
INSERT INTO `ccard_sync_food_log` VALUES ('378', '90a2e0269b6c878', '同步', '2017-09-05 14:51:22');
INSERT INTO `ccard_sync_food_log` VALUES ('379', '90a2e0269b6c878', '同步', '2017-09-05 16:20:25');
INSERT INTO `ccard_sync_food_log` VALUES ('380', '90a2e0269b6c878', '同步', '2017-09-05 16:33:48');
INSERT INTO `ccard_sync_food_log` VALUES ('381', '90a2e0269b6c878', '同步', '2017-09-05 17:13:48');
INSERT INTO `ccard_sync_food_log` VALUES ('382', '90a2e0269b6c878', '同步', '2017-09-05 17:15:18');
INSERT INTO `ccard_sync_food_log` VALUES ('383', '90a2e0269b6c878', '同步', '2017-09-05 17:24:34');
INSERT INTO `ccard_sync_food_log` VALUES ('384', '90a2e0269b6c878', '同步', '2017-09-05 17:24:51');
INSERT INTO `ccard_sync_food_log` VALUES ('385', '90a2e0269b6c878', '同步', '2017-09-05 17:25:50');
INSERT INTO `ccard_sync_food_log` VALUES ('386', '90a2e0269b6c878', '同步', '2017-09-05 17:26:33');
INSERT INTO `ccard_sync_food_log` VALUES ('387', '90a2e0269b6c878', '同步', '2017-09-05 17:31:47');
INSERT INTO `ccard_sync_food_log` VALUES ('388', '90a2e0269b6c878', '同步', '2017-09-05 17:33:06');
INSERT INTO `ccard_sync_food_log` VALUES ('389', '90a2e0269b6c878', '同步', '2017-09-06 08:06:38');
INSERT INTO `ccard_sync_food_log` VALUES ('390', '90a2e0269b6c878', '同步', '2017-09-06 08:06:41');
INSERT INTO `ccard_sync_food_log` VALUES ('391', '90a2e0269b6c878', '同步', '2017-09-06 08:12:03');
INSERT INTO `ccard_sync_food_log` VALUES ('392', '90a2e0269b6c878', '同步', '2017-09-06 08:31:31');
INSERT INTO `ccard_sync_food_log` VALUES ('393', '90a2e0269b6c878', '同步', '2017-09-06 08:31:34');
INSERT INTO `ccard_sync_food_log` VALUES ('394', '90a2e0269b6c878', '同步', '2017-09-06 08:50:14');
INSERT INTO `ccard_sync_food_log` VALUES ('395', '90a2e0269b6c878', '同步', '2017-09-06 09:03:02');
INSERT INTO `ccard_sync_food_log` VALUES ('396', '90a2e0269b6c878', '同步', '2017-09-06 09:03:06');
INSERT INTO `ccard_sync_food_log` VALUES ('397', '90a2e0269b6c878', '同步', '2017-09-06 09:45:09');
INSERT INTO `ccard_sync_food_log` VALUES ('398', '90a2e0269b6c878', '同步', '2017-09-06 09:47:41');
INSERT INTO `ccard_sync_food_log` VALUES ('399', '90a2e0269b6c878', '同步', '2017-09-06 09:51:38');
INSERT INTO `ccard_sync_food_log` VALUES ('400', '90a2e0269b6c878', '同步', '2017-09-06 09:51:40');
INSERT INTO `ccard_sync_food_log` VALUES ('401', '90a2e0269b6c878', '同步', '2017-09-06 11:25:02');
INSERT INTO `ccard_sync_food_log` VALUES ('402', '90a2e0269b6c878', '同步', '2017-09-06 11:26:32');
INSERT INTO `ccard_sync_food_log` VALUES ('403', '90a2e0269b6c878', '同步', '2017-09-06 11:28:20');
INSERT INTO `ccard_sync_food_log` VALUES ('404', '90a2e0269b6c878', '同步', '2017-09-06 11:28:29');
INSERT INTO `ccard_sync_food_log` VALUES ('405', '90a2e0269b6c878', '同步', '2017-09-06 11:28:49');
INSERT INTO `ccard_sync_food_log` VALUES ('406', 'bd1e2ff2f7d039a6', '同步', '2017-09-06 12:38:33');
INSERT INTO `ccard_sync_food_log` VALUES ('407', 'bd1e2ff2f7d039a6', '同步', '2017-09-06 12:41:26');
INSERT INTO `ccard_sync_food_log` VALUES ('408', 'bd1e2ff2f7d039a6', '同步', '2017-09-06 12:44:54');
INSERT INTO `ccard_sync_food_log` VALUES ('409', 'bd1e2ff2f7d039a6', '同步', '2017-09-06 12:44:57');
INSERT INTO `ccard_sync_food_log` VALUES ('410', 'bd1e2ff2f7d039a6', '同步', '2017-09-06 12:45:01');
INSERT INTO `ccard_sync_food_log` VALUES ('411', 'bd1e2ff2f7d039a6', '同步', '2017-09-06 13:11:12');
INSERT INTO `ccard_sync_food_log` VALUES ('412', 'bd1e2ff2f7d039a6', '同步', '2017-09-06 13:52:56');
INSERT INTO `ccard_sync_food_log` VALUES ('413', 'bd1e2ff2f7d039a6', '同步', '2017-09-06 13:54:10');
INSERT INTO `ccard_sync_food_log` VALUES ('414', 'bd1e2ff2f7d039a6', '同步', '2017-09-06 13:55:53');
INSERT INTO `ccard_sync_food_log` VALUES ('415', 'bd1e2ff2f7d039a6', '同步', '2017-09-06 13:57:56');
INSERT INTO `ccard_sync_food_log` VALUES ('416', 'bd1e2ff2f7d039a6', '同步', '2017-09-06 14:14:36');
INSERT INTO `ccard_sync_food_log` VALUES ('417', 'bd1e2ff2f7d039a6', '同步', '2017-09-06 14:17:18');
INSERT INTO `ccard_sync_food_log` VALUES ('418', 'bd1e2ff2f7d039a6', '同步', '2017-09-06 14:58:44');
INSERT INTO `ccard_sync_food_log` VALUES ('419', '90a2e0269b6c878', '同步', '2017-09-07 09:12:35');
INSERT INTO `ccard_sync_food_log` VALUES ('420', '90a2e0269b6c878', '同步', '2017-09-07 09:12:46');
INSERT INTO `ccard_sync_food_log` VALUES ('421', '90a2e0269b6c878', '同步', '2017-09-07 09:17:13');
INSERT INTO `ccard_sync_food_log` VALUES ('422', '90a2e0269b6c878', '同步', '2017-09-07 09:17:20');
INSERT INTO `ccard_sync_food_log` VALUES ('423', '90a2e0269b6c878', '同步', '2017-09-07 09:19:21');
INSERT INTO `ccard_sync_food_log` VALUES ('424', '90a2e0269b6c878', '同步', '2017-09-07 09:20:24');
INSERT INTO `ccard_sync_food_log` VALUES ('425', '90a2e0269b6c878', '同步', '2017-09-07 09:20:51');
INSERT INTO `ccard_sync_food_log` VALUES ('426', '90a2e0269b6c878', '同步', '2017-09-07 09:22:42');
INSERT INTO `ccard_sync_food_log` VALUES ('427', '90a2e0269b6c878', '同步', '2017-09-07 09:24:33');
INSERT INTO `ccard_sync_food_log` VALUES ('428', '90a2e0269b6c878', '同步', '2017-09-07 09:24:51');
INSERT INTO `ccard_sync_food_log` VALUES ('429', '90a2e0269b6c878', '同步', '2017-09-07 09:27:26');
INSERT INTO `ccard_sync_food_log` VALUES ('430', '90a2e0269b6c878', '同步', '2017-09-07 09:28:22');
INSERT INTO `ccard_sync_food_log` VALUES ('431', '90a2e0269b6c878', '同步', '2017-09-07 09:30:52');
INSERT INTO `ccard_sync_food_log` VALUES ('432', '90a2e0269b6c878', '同步', '2017-09-07 09:31:42');
INSERT INTO `ccard_sync_food_log` VALUES ('433', '90a2e0269b6c878', '同步', '2017-09-07 09:33:05');
INSERT INTO `ccard_sync_food_log` VALUES ('434', '90a2e0269b6c878', '同步', '2017-09-07 09:33:08');
INSERT INTO `ccard_sync_food_log` VALUES ('435', '90a2e0269b6c878', '同步', '2017-09-07 09:35:46');
INSERT INTO `ccard_sync_food_log` VALUES ('436', '90a2e0269b6c878', '同步', '2017-09-07 09:36:50');
INSERT INTO `ccard_sync_food_log` VALUES ('437', '90a2e0269b6c878', '同步', '2017-09-07 11:05:00');
INSERT INTO `ccard_sync_food_log` VALUES ('438', '90a2e0269b6c878', '同步', '2017-09-07 16:26:05');
INSERT INTO `ccard_sync_food_log` VALUES ('439', '90a2e0269b6c878', '同步', '2017-09-07 17:01:10');
INSERT INTO `ccard_sync_food_log` VALUES ('440', '90a2e0269b6c878', '同步', '2017-09-07 17:25:04');
INSERT INTO `ccard_sync_food_log` VALUES ('441', '90a2e0269b6c878', '同步', '2017-09-07 17:30:29');
INSERT INTO `ccard_sync_food_log` VALUES ('442', '90a2e0269b6c878', '同步', '2017-09-07 17:46:23');
INSERT INTO `ccard_sync_food_log` VALUES ('443', '90a2e0269b6c878', '同步', '2017-09-08 17:06:35');
INSERT INTO `ccard_sync_food_log` VALUES ('444', '123131', '同步', '2017-09-09 10:49:40');
INSERT INTO `ccard_sync_food_log` VALUES ('445', '123131', '同步', '2017-09-09 16:50:52');
INSERT INTO `ccard_sync_food_log` VALUES ('446', '90a2e0269b6c878', '同步', '2017-09-09 16:51:15');
INSERT INTO `ccard_sync_food_log` VALUES ('447', '90a2e0269b6c878', '同步', '2017-09-09 16:51:19');
INSERT INTO `ccard_sync_food_log` VALUES ('448', '90a2e0269b6c878', '同步', '2017-09-09 16:59:45');
INSERT INTO `ccard_sync_food_log` VALUES ('449', '90a2e0269b6c878', '同步', '2017-09-09 16:59:49');
INSERT INTO `ccard_sync_food_log` VALUES ('450', '90a2e0269b6c878', '同步', '2017-09-09 17:11:35');
INSERT INTO `ccard_sync_food_log` VALUES ('451', '90a2e0269b6c878', '同步', '2017-09-09 17:17:10');
INSERT INTO `ccard_sync_food_log` VALUES ('452', '90a2e0269b6c878', '同步', '2017-09-09 17:17:14');
INSERT INTO `ccard_sync_food_log` VALUES ('453', '90a2e0269b6c878', '同步', '2017-09-11 12:19:04');
INSERT INTO `ccard_sync_food_log` VALUES ('454', '90a2e0269b6c878', '同步', '2017-09-13 10:00:02');
INSERT INTO `ccard_sync_food_log` VALUES ('455', '90a2e0269b6c878', '同步', '2017-09-13 10:09:24');
INSERT INTO `ccard_sync_food_log` VALUES ('456', '90a2e0269b6c878', '同步', '2017-09-13 10:52:56');
INSERT INTO `ccard_sync_food_log` VALUES ('457', '90a2e0269b6c878', '同步', '2017-09-13 10:53:06');
INSERT INTO `ccard_sync_food_log` VALUES ('458', '90a2e0269b6c878', '同步', '2017-09-13 10:53:10');
INSERT INTO `ccard_sync_food_log` VALUES ('459', '90a2e0269b6c878', '同步', '2017-09-13 10:58:39');
INSERT INTO `ccard_sync_food_log` VALUES ('460', '90a2e0269b6c878', '同步', '2017-09-13 10:58:53');
INSERT INTO `ccard_sync_food_log` VALUES ('461', '90a2e0269b6c878', '同步', '2017-09-13 11:00:45');
INSERT INTO `ccard_sync_food_log` VALUES ('462', '90a2e0269b6c878', '同步', '2017-09-13 11:00:53');
INSERT INTO `ccard_sync_food_log` VALUES ('463', '90a2e0269b6c878', '同步', '2017-09-13 11:18:31');
INSERT INTO `ccard_sync_food_log` VALUES ('464', '90a2e0269b6c878', '同步', '2017-09-13 11:18:35');
INSERT INTO `ccard_sync_food_log` VALUES ('465', '90a2e0269b6c878', '同步', '2017-09-13 11:24:11');
INSERT INTO `ccard_sync_food_log` VALUES ('466', '90a2e0269b6c878', '同步', '2017-09-13 11:28:56');
INSERT INTO `ccard_sync_food_log` VALUES ('467', '90a2e0269b6c878', '同步', '2017-09-13 11:29:01');
INSERT INTO `ccard_sync_food_log` VALUES ('468', '90a2e0269b6c878', '同步', '2017-09-13 11:31:19');
INSERT INTO `ccard_sync_food_log` VALUES ('469', '90a2e0269b6c878', '同步', '2017-09-13 11:31:26');
INSERT INTO `ccard_sync_food_log` VALUES ('470', '90a2e0269b6c878', '同步', '2017-09-13 11:32:15');
INSERT INTO `ccard_sync_food_log` VALUES ('471', '90a2e0269b6c878', '同步', '2017-09-13 11:32:19');
INSERT INTO `ccard_sync_food_log` VALUES ('472', '90a2e0269b6c878', '同步', '2017-09-13 11:35:48');
INSERT INTO `ccard_sync_food_log` VALUES ('473', '90a2e0269b6c878', '同步', '2017-09-13 11:35:52');
INSERT INTO `ccard_sync_food_log` VALUES ('474', '90a2e0269b6c878', '同步', '2017-09-13 11:36:29');
INSERT INTO `ccard_sync_food_log` VALUES ('475', '90a2e0269b6c878', '同步', '2017-09-13 11:49:53');
INSERT INTO `ccard_sync_food_log` VALUES ('476', '90a2e0269b6c878', '同步', '2017-09-13 11:51:59');
INSERT INTO `ccard_sync_food_log` VALUES ('477', '90a2e0269b6c878', '同步', '2017-09-13 12:56:13');
INSERT INTO `ccard_sync_food_log` VALUES ('478', '90a2e0269b6c878', '同步', '2017-09-13 13:01:48');
INSERT INTO `ccard_sync_food_log` VALUES ('479', '90a2e0269b6c878', '同步', '2017-09-14 08:38:00');
INSERT INTO `ccard_sync_food_log` VALUES ('480', '90a2e0269b6c878', '同步', '2017-09-14 09:08:16');
INSERT INTO `ccard_sync_food_log` VALUES ('481', '90a2e0269b6c878', '同步', '2017-09-14 10:50:00');
INSERT INTO `ccard_sync_food_log` VALUES ('482', '90a2e0269b6c878', '同步', '2017-09-14 10:50:05');
INSERT INTO `ccard_sync_food_log` VALUES ('483', '90a2e0269b6c878', '同步', '2017-09-14 10:51:32');
INSERT INTO `ccard_sync_food_log` VALUES ('484', '90a2e0269b6c878', '同步', '2017-09-14 10:56:45');
INSERT INTO `ccard_sync_food_log` VALUES ('485', '90a2e0269b6c878', '同步', '2017-09-14 11:09:50');
INSERT INTO `ccard_sync_food_log` VALUES ('486', '90a2e0269b6c878', '同步', '2017-09-14 11:10:15');
INSERT INTO `ccard_sync_food_log` VALUES ('487', '90a2e0269b6c878', '同步', '2017-09-15 08:17:16');
INSERT INTO `ccard_sync_food_log` VALUES ('488', '90a2e0269b6c878', '同步', '2017-09-15 08:17:21');
INSERT INTO `ccard_sync_food_log` VALUES ('489', '90a2e0269b6c878', '同步', '2017-09-15 08:17:27');
INSERT INTO `ccard_sync_food_log` VALUES ('490', '90a2e0269b6c878', '同步', '2017-09-15 08:18:43');
INSERT INTO `ccard_sync_food_log` VALUES ('491', '90a2e0269b6c878', '同步', '2017-09-15 08:18:50');
INSERT INTO `ccard_sync_food_log` VALUES ('492', '90a2e0269b6c878', '同步', '2017-09-15 08:19:24');
INSERT INTO `ccard_sync_food_log` VALUES ('493', '90a2e0269b6c878', '同步', '2017-09-15 08:19:42');
INSERT INTO `ccard_sync_food_log` VALUES ('494', '90a2e0269b6c878', '同步', '2017-09-15 08:22:59');
INSERT INTO `ccard_sync_food_log` VALUES ('495', '90a2e0269b6c878', '同步', '2017-09-15 08:24:55');
INSERT INTO `ccard_sync_food_log` VALUES ('496', '90a2e0269b6c878', '同步', '2017-09-15 11:29:05');
INSERT INTO `ccard_sync_food_log` VALUES ('497', '90a2e0269b6c878', '同步', '2017-09-21 10:04:48');
INSERT INTO `ccard_sync_food_log` VALUES ('498', '90a2e0269b6c878', '同步', '2017-09-22 08:35:07');
INSERT INTO `ccard_sync_food_log` VALUES ('499', '90a2e0269b6c878', '同步', '2017-09-22 08:40:08');
INSERT INTO `ccard_sync_food_log` VALUES ('500', '90a2e0269b6c878', '同步', '2017-09-22 08:57:08');
INSERT INTO `ccard_sync_food_log` VALUES ('501', '90a2e0269b6c878', '同步', '2017-09-22 17:05:01');
INSERT INTO `ccard_sync_food_log` VALUES ('502', '90a2e0269b6c878', '同步', '2017-09-25 13:35:28');
INSERT INTO `ccard_sync_food_log` VALUES ('503', '90a2e0269b6c878', '同步', '2017-09-25 13:36:15');
INSERT INTO `ccard_sync_food_log` VALUES ('504', '90a2e0269b6c878', '同步', '2017-09-25 13:37:18');
INSERT INTO `ccard_sync_food_log` VALUES ('505', '90a2e0269b6c878', '同步', '2017-09-25 13:37:20');
INSERT INTO `ccard_sync_food_log` VALUES ('506', '90a2e0269b6c878', '同步', '2017-09-25 13:37:51');
INSERT INTO `ccard_sync_food_log` VALUES ('507', '90a2e0269b6c878', '同步', '2017-09-25 13:37:56');
INSERT INTO `ccard_sync_food_log` VALUES ('508', '90a2e0269b6c878', '同步', '2017-09-25 13:46:39');
INSERT INTO `ccard_sync_food_log` VALUES ('509', '90a2e0269b6c878', '同步', '2017-09-25 15:25:25');
INSERT INTO `ccard_sync_food_log` VALUES ('510', '90a2e0269b6c878', '同步', '2017-09-25 17:22:55');
INSERT INTO `ccard_sync_food_log` VALUES ('511', '90a2e0269b6c878', '同步', '2017-09-26 10:00:48');
INSERT INTO `ccard_sync_food_log` VALUES ('512', '90a2e0269b6c878', '同步', '2017-09-26 15:23:21');
INSERT INTO `ccard_sync_food_log` VALUES ('513', '90a2e0269b6c878', '同步', '2017-09-26 15:24:31');
INSERT INTO `ccard_sync_food_log` VALUES ('514', '90a2e0269b6c878', '同步', '2017-09-26 15:24:51');
INSERT INTO `ccard_sync_food_log` VALUES ('515', '90a2e0269b6c878', '同步', '2017-09-26 15:25:52');
INSERT INTO `ccard_sync_food_log` VALUES ('516', '90a2e0269b6c878', '同步', '2017-09-26 15:27:09');
INSERT INTO `ccard_sync_food_log` VALUES ('517', '90a2e0269b6c878', '同步', '2017-09-26 15:28:00');
INSERT INTO `ccard_sync_food_log` VALUES ('518', '90a2e0269b6c878', '同步', '2017-09-26 15:43:24');
INSERT INTO `ccard_sync_food_log` VALUES ('519', '90a2e0269b6c878', '同步', '2017-09-26 15:43:32');
INSERT INTO `ccard_sync_food_log` VALUES ('520', '90a2e0269b6c878', '同步', '2017-09-26 15:43:45');
INSERT INTO `ccard_sync_food_log` VALUES ('521', '90a2e0269b6c878', '同步', '2017-09-26 15:45:08');
INSERT INTO `ccard_sync_food_log` VALUES ('522', '90a2e0269b6c878', '同步', '2017-09-26 15:48:17');
INSERT INTO `ccard_sync_food_log` VALUES ('523', '90a2e0269b6c878', '同步', '2017-09-26 15:49:06');
INSERT INTO `ccard_sync_food_log` VALUES ('524', '90a2e0269b6c878', '同步', '2017-09-26 15:49:34');
INSERT INTO `ccard_sync_food_log` VALUES ('525', '90a2e0269b6c878', '同步', '2017-09-26 15:49:42');
INSERT INTO `ccard_sync_food_log` VALUES ('526', '90a2e0269b6c878', '同步', '2017-09-26 15:50:20');
INSERT INTO `ccard_sync_food_log` VALUES ('527', '90a2e0269b6c878', '同步', '2017-09-26 15:50:37');
INSERT INTO `ccard_sync_food_log` VALUES ('528', '90a2e0269b6c878', '同步', '2017-09-26 15:51:10');
INSERT INTO `ccard_sync_food_log` VALUES ('529', '90a2e0269b6c878', '同步', '2017-09-26 15:51:37');
INSERT INTO `ccard_sync_food_log` VALUES ('530', '90a2e0269b6c878', '同步', '2017-09-26 15:54:28');
INSERT INTO `ccard_sync_food_log` VALUES ('531', '90a2e0269b6c878', '同步', '2017-09-26 15:54:53');
INSERT INTO `ccard_sync_food_log` VALUES ('532', '90a2e0269b6c878', '同步', '2017-09-26 15:54:57');
INSERT INTO `ccard_sync_food_log` VALUES ('533', '90a2e0269b6c878', '同步', '2017-09-26 15:55:20');
INSERT INTO `ccard_sync_food_log` VALUES ('534', '123131', '同步', '2017-09-26 15:56:23');
INSERT INTO `ccard_sync_food_log` VALUES ('535', '123131', '同步', '2017-09-26 15:57:36');
INSERT INTO `ccard_sync_food_log` VALUES ('536', '90a2e0269b6c878', '同步', '2017-09-26 16:01:13');
INSERT INTO `ccard_sync_food_log` VALUES ('537', '90a2e0269b6c878', '同步', '2017-09-26 16:01:19');
INSERT INTO `ccard_sync_food_log` VALUES ('538', '90a2e0269b6c878', '同步', '2017-09-26 16:02:32');
INSERT INTO `ccard_sync_food_log` VALUES ('539', '90a2e0269b6c878', '同步', '2017-09-26 16:02:56');
INSERT INTO `ccard_sync_food_log` VALUES ('540', '90a2e0269b6c878', '同步', '2017-09-26 16:03:40');
INSERT INTO `ccard_sync_food_log` VALUES ('541', '90a2e0269b6c878', '同步', '2017-09-26 16:03:46');
INSERT INTO `ccard_sync_food_log` VALUES ('542', '90a2e0269b6c878', '同步', '2017-09-26 16:03:50');
INSERT INTO `ccard_sync_food_log` VALUES ('543', '90a2e0269b6c878', '同步', '2017-09-26 16:03:53');
INSERT INTO `ccard_sync_food_log` VALUES ('544', '90a2e0269b6c878', '同步', '2017-09-29 08:46:56');
INSERT INTO `ccard_sync_food_log` VALUES ('545', '90a2e0269b6c878', '同步', '2017-09-29 09:37:55');
INSERT INTO `ccard_sync_food_log` VALUES ('546', '90a2e0269b6c878', '同步', '2017-10-09 17:09:31');
INSERT INTO `ccard_sync_food_log` VALUES ('547', '90a2e0269b6c878', '同步', '2017-10-11 09:21:36');
INSERT INTO `ccard_sync_food_log` VALUES ('548', '90a2e0269b6c878', '同步', '2017-10-11 14:51:39');
INSERT INTO `ccard_sync_food_log` VALUES ('549', '90a2e0269b6c878', '同步', '2017-10-11 14:52:08');
INSERT INTO `ccard_sync_food_log` VALUES ('550', '90a2e0269b6c878', '同步', '2017-10-12 16:00:54');
INSERT INTO `ccard_sync_food_log` VALUES ('551', '90a2e0269b6c878', '同步', '2017-10-12 16:42:09');
INSERT INTO `ccard_sync_food_log` VALUES ('552', '90a2e0269b6c878', '同步', '2017-10-12 18:35:25');
INSERT INTO `ccard_sync_food_log` VALUES ('553', '90a2e0269b6c878', '同步', '2017-10-13 16:35:18');
INSERT INTO `ccard_sync_food_log` VALUES ('554', '90a2e0269b6c878', '同步', '2017-10-13 20:42:34');
INSERT INTO `ccard_sync_food_log` VALUES ('555', '90a2e0269b6c878', '同步', '2017-10-14 08:05:44');
INSERT INTO `ccard_sync_food_log` VALUES ('556', '90a2e0269b6c878', '同步', '2017-10-24 17:07:12');
INSERT INTO `ccard_sync_food_log` VALUES ('557', 'bd1e2ff2f7d039a6', '同步', '2018-01-20 17:07:58');
INSERT INTO `ccard_sync_food_log` VALUES ('558', 'bd1e2ff2f7d039a6', '同步', '2018-01-20 17:08:10');
INSERT INTO `ccard_sync_food_log` VALUES ('559', 'bd1e2ff2f7d039a6', '同步', '2018-01-20 17:08:14');
INSERT INTO `ccard_sync_food_log` VALUES ('560', 'bd1e2ff2f7d039a6', '同步', '2018-01-20 17:08:17');
INSERT INTO `ccard_sync_food_log` VALUES ('561', 'bd1e2ff2f7d039a6', '同步', '2018-01-20 17:08:32');
INSERT INTO `ccard_sync_food_log` VALUES ('562', 'bd1e2ff2f7d039a6', '同步', '2018-01-20 17:08:35');
INSERT INTO `ccard_sync_food_log` VALUES ('563', 'bd1e2ff2f7d039a6', '同步', '2018-01-20 17:11:47');
INSERT INTO `ccard_sync_food_log` VALUES ('564', 'bd1e2ff2f7d039a6', '同步', '2018-01-20 17:19:31');
INSERT INTO `ccard_sync_food_log` VALUES ('565', '90a2e0269b6c878', '同步', '2018-01-22 08:29:42');
INSERT INTO `ccard_sync_food_log` VALUES ('566', '90a2e0269b6c878', '同步', '2018-01-22 08:29:49');
INSERT INTO `ccard_sync_food_log` VALUES ('567', '90a2e0269b6c878', '同步', '2018-01-22 08:32:20');
INSERT INTO `ccard_sync_food_log` VALUES ('568', '90a2e0269b6c878', '同步', '2018-01-22 14:59:41');
INSERT INTO `ccard_sync_food_log` VALUES ('569', '90a2e0269b6c878', '同步', '2018-01-22 15:09:37');
INSERT INTO `ccard_sync_food_log` VALUES ('570', '90a2e0269b6c878', '同步', '2018-01-22 15:09:42');
INSERT INTO `ccard_sync_food_log` VALUES ('571', '90a2e0269b6c878', '同步', '2018-01-23 08:37:00');
INSERT INTO `ccard_sync_food_log` VALUES ('572', '90a2e0269b6c878', '同步', '2018-01-23 08:47:56');

-- ----------------------------
-- Table structure for ccard_take_food_log
-- ----------------------------
DROP TABLE IF EXISTS `ccard_take_food_log`;
CREATE TABLE `ccard_take_food_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pnum` varchar(20) NOT NULL,
  `gid` varchar(20) NOT NULL,
  `order_no` int(11) NOT NULL,
  `devid` varchar(50) NOT NULL,
  `operate` varchar(50) NOT NULL,
  `add_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=670 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ccard_take_food_log
-- ----------------------------
INSERT INTO `ccard_take_food_log` VALUES ('556', 'H7111111', '00000', '375', '', '取餐', '2017-10-23 14:30:15');
INSERT INTO `ccard_take_food_log` VALUES ('557', 'H7111111', '00000', '375', '', '取餐', '2017-10-23 14:30:42');
INSERT INTO `ccard_take_food_log` VALUES ('558', 'H7111111', '00000', '375', '', '取餐', '2017-10-23 14:30:43');
INSERT INTO `ccard_take_food_log` VALUES ('559', 'H7111111', '00000', '375', '', '取餐', '2017-10-23 14:30:45');
INSERT INTO `ccard_take_food_log` VALUES ('560', 'H7111111', '00000', '375', '', '取餐', '2017-10-23 14:30:46');
INSERT INTO `ccard_take_food_log` VALUES ('561', 'H7108721', '0e:a6:22:80', '375', '', '取餐', '2017-10-23 14:33:08');
INSERT INTO `ccard_take_food_log` VALUES ('562', 'H7106885', 'e4:e9:07:ed', '377', '', '取餐', '2017-10-23 14:39:31');
INSERT INTO `ccard_take_food_log` VALUES ('563', 'H7106885', 'e4:e9:07:ed', '377', '', '取餐', '2017-10-23 14:41:03');
INSERT INTO `ccard_take_food_log` VALUES ('564', 'H7107296', '0b:7a:41:07', '380', '', '取餐', '2017-10-23 14:49:28');
INSERT INTO `ccard_take_food_log` VALUES ('565', 'H7107296', '0b:7a:41:07', '380', '', '取餐', '2017-10-23 14:50:34');
INSERT INTO `ccard_take_food_log` VALUES ('566', 'H7108721', '0e:a6:22:80', '375', '', '取餐', '2017-10-23 14:52:58');
INSERT INTO `ccard_take_food_log` VALUES ('567', 'H7108721', '0e:a6:22:80', '375', '', '取餐', '2017-10-23 14:53:12');
INSERT INTO `ccard_take_food_log` VALUES ('568', 'H7108721', '0e:a6:22:80', '375', '', '取餐', '2017-10-23 14:55:31');
INSERT INTO `ccard_take_food_log` VALUES ('569', 'H7108721', '0e:a6:22:80', '375', '', '取餐', '2017-10-23 15:03:30');
INSERT INTO `ccard_take_food_log` VALUES ('570', 'H7108721', '0e:a6:22:80', '375', '', '取餐', '2017-10-23 15:08:27');
INSERT INTO `ccard_take_food_log` VALUES ('571', 'H7108721', '0e:a6:22:80', '2147483647', '90a2e0269b6c878', '取餐', '2017-10-24 11:19:39');
INSERT INTO `ccard_take_food_log` VALUES ('572', 'H7108721', '0e:a6:22:80', '2147483647', '90a2e0269b6c878', '取餐', '2017-10-24 11:19:39');
INSERT INTO `ccard_take_food_log` VALUES ('573', 'H7108721', '0e:a6:22:80', '2147483647', '90a2e0269b6c878', '取餐', '2017-10-24 11:22:18');
INSERT INTO `ccard_take_food_log` VALUES ('574', 'H7108721', '0e:a6:22:80', '2147483647', '90a2e0269b6c878', '取餐', '2017-10-24 11:22:18');
INSERT INTO `ccard_take_food_log` VALUES ('575', 'H7108721', '0e:a6:22:80', '2147483647', '90a2e0269b6c878', '取餐', '2017-10-24 11:22:29');
INSERT INTO `ccard_take_food_log` VALUES ('576', 'H7108721', '0e:a6:22:80', '2147483647', '90a2e0269b6c878', '取餐', '2017-10-24 11:22:29');
INSERT INTO `ccard_take_food_log` VALUES ('577', 'H7108721', '0e:a6:22:80', '2147483647', '90a2e0269b6c878', '取餐', '2017-10-24 11:22:36');
INSERT INTO `ccard_take_food_log` VALUES ('578', 'H7108721', '0e:a6:22:80', '2147483647', '90a2e0269b6c878', '取餐', '2017-10-24 11:22:36');
INSERT INTO `ccard_take_food_log` VALUES ('579', 'H7108721', '0e:a6:22:80', '2147483647', '90a2e0269b6c878', '取餐', '2017-10-24 11:25:25');
INSERT INTO `ccard_take_food_log` VALUES ('580', 'H7108721', '0e:a6:22:80', '2147483647', '90a2e0269b6c878', '取餐', '2017-10-24 11:25:25');
INSERT INTO `ccard_take_food_log` VALUES ('581', 'H7108721', '0e:a6:22:80', '2147483647', '90a2e0269b6c878', '取餐', '2017-10-24 11:25:32');
INSERT INTO `ccard_take_food_log` VALUES ('582', 'H7108721', '0e:a6:22:80', '2147483647', '90a2e0269b6c878', '取餐', '2017-10-24 11:25:32');
INSERT INTO `ccard_take_food_log` VALUES ('583', 'H7108721', '0e:a6:22:80', '2147483647', '90a2e0269b6c878', '取餐', '2017-10-24 11:25:39');
INSERT INTO `ccard_take_food_log` VALUES ('584', 'H7108721', '0e:a6:22:80', '2147483647', '90a2e0269b6c878', '取餐', '2017-10-24 11:25:39');
INSERT INTO `ccard_take_food_log` VALUES ('585', 'H7108721', '0e:a6:22:80', '2147483647', '90a2e0269b6c878', '取餐', '2017-10-24 11:25:45');
INSERT INTO `ccard_take_food_log` VALUES ('586', 'H7108721', '0e:a6:22:80', '2147483647', '90a2e0269b6c878', '取餐', '2017-10-24 11:25:45');
INSERT INTO `ccard_take_food_log` VALUES ('587', 'H7109426', 'b4:71:f8:01', '2147483647', '90a2e0269b6c878', '取餐', '2017-10-24 11:39:01');
INSERT INTO `ccard_take_food_log` VALUES ('588', 'H7109426', 'b4:71:f8:01', '2147483647', '90a2e0269b6c878', '取餐', '2017-10-24 11:39:13');
INSERT INTO `ccard_take_food_log` VALUES ('589', 'H7108721', '0e:a6:22:80', '2147483647', '90a2e0269b6c878', '取餐', '2017-10-24 11:39:20');
INSERT INTO `ccard_take_food_log` VALUES ('590', 'H7108721', '0e:a6:22:80', '2147483647', '90a2e0269b6c878', '取餐', '2017-10-24 11:39:20');
INSERT INTO `ccard_take_food_log` VALUES ('591', 'H7108721', '0e:a6:22:80', '2147483647', '90a2e0269b6c878', '取餐', '2017-10-24 11:40:30');
INSERT INTO `ccard_take_food_log` VALUES ('592', 'H7108721', '0e:a6:22:80', '2147483647', '90a2e0269b6c878', '取餐', '2017-10-24 11:40:30');
INSERT INTO `ccard_take_food_log` VALUES ('593', 'H7109426', 'b4:71:f8:01', '2147483647', '90a2e0269b6c878', '取餐', '2017-10-24 11:40:39');
INSERT INTO `ccard_take_food_log` VALUES ('594', 'H7108721', '0e:a6:22:80', '2147483647', '90a2e0269b6c878', '取餐', '2017-10-24 13:40:15');
INSERT INTO `ccard_take_food_log` VALUES ('595', 'H7108721', '0e:a6:22:80', '2147483647', '90a2e0269b6c878', '取餐', '2017-10-24 13:40:15');
INSERT INTO `ccard_take_food_log` VALUES ('596', 'H7108721', '0e:a6:22:80', '2147483647', '90a2e0269b6c878', '取餐', '2017-10-24 13:40:28');
INSERT INTO `ccard_take_food_log` VALUES ('597', 'H7108721', '0e:a6:22:80', '2147483647', '90a2e0269b6c878', '取餐', '2017-10-24 13:40:28');
INSERT INTO `ccard_take_food_log` VALUES ('598', 'H7108721', '0e:a6:22:80', '2147483647', '90a2e0269b6c878', '取餐', '2017-10-24 13:44:27');
INSERT INTO `ccard_take_food_log` VALUES ('599', 'H7108721', '0e:a6:22:80', '2147483647', '90a2e0269b6c878', '取餐', '2017-10-24 13:44:27');
INSERT INTO `ccard_take_food_log` VALUES ('600', 'H7108721', '0e:a6:22:80', '2147483647', '90a2e0269b6c878', '取餐', '2017-10-24 13:44:46');
INSERT INTO `ccard_take_food_log` VALUES ('601', 'H7108721', '0e:a6:22:80', '2147483647', '90a2e0269b6c878', '取餐', '2017-10-24 13:44:46');
INSERT INTO `ccard_take_food_log` VALUES ('602', 'H7108721', '0e:a6:22:80', '2147483647', '90a2e0269b6c878', '取餐', '2017-10-24 13:44:55');
INSERT INTO `ccard_take_food_log` VALUES ('603', 'H7108721', '0e:a6:22:80', '2147483647', '90a2e0269b6c878', '取餐', '2017-10-24 13:44:55');
INSERT INTO `ccard_take_food_log` VALUES ('604', 'H7109426', 'b4:71:f8:01', '2147483647', '90a2e0269b6c878', '取餐', '2017-10-24 13:45:09');
INSERT INTO `ccard_take_food_log` VALUES ('605', 'H7109426', 'b4:71:f8:01', '2147483647', '90a2e0269b6c878', '取餐', '2017-10-24 13:45:17');
INSERT INTO `ccard_take_food_log` VALUES ('606', 'H7108721', '0e:a6:22:80', '2147483647', '90a2e0269b6c878', '取餐', '2017-10-24 13:45:26');
INSERT INTO `ccard_take_food_log` VALUES ('607', 'H7108721', '0e:a6:22:80', '2147483647', '90a2e0269b6c878', '取餐', '2017-10-24 13:45:26');
INSERT INTO `ccard_take_food_log` VALUES ('608', 'H7109426', 'b4:71:f8:01', '2147483647', '90a2e0269b6c878', '取餐', '2017-10-24 13:45:50');
INSERT INTO `ccard_take_food_log` VALUES ('609', 'H7108721', '0e:a6:22:80', '2147483647', '90a2e0269b6c878', '取餐', '2017-10-24 13:45:56');
INSERT INTO `ccard_take_food_log` VALUES ('610', 'H7108721', '0e:a6:22:80', '2147483647', '90a2e0269b6c878', '取餐', '2017-10-24 13:45:56');
INSERT INTO `ccard_take_food_log` VALUES ('611', 'H7108721', '0e:a6:22:80', '2147483647', '90a2e0269b6c878', '取餐', '2017-10-24 14:07:23');
INSERT INTO `ccard_take_food_log` VALUES ('612', 'H7108721', '0e:a6:22:80', '2147483647', '90a2e0269b6c878', '取餐', '2017-10-24 14:07:23');
INSERT INTO `ccard_take_food_log` VALUES ('613', 'H7108721', '0e:a6:22:80', '2147483647', '90a2e0269b6c878', '取餐', '2017-10-24 14:07:32');
INSERT INTO `ccard_take_food_log` VALUES ('614', 'H7108721', '0e:a6:22:80', '2147483647', '90a2e0269b6c878', '取餐', '2017-10-24 14:07:32');
INSERT INTO `ccard_take_food_log` VALUES ('615', 'H7109426', 'b4:71:f8:01', '2147483647', '90a2e0269b6c878', '取餐', '2017-10-24 14:07:40');
INSERT INTO `ccard_take_food_log` VALUES ('616', 'H7109426', 'b4:71:f8:01', '2147483647', '90a2e0269b6c878', '取餐', '2017-10-24 14:07:48');
INSERT INTO `ccard_take_food_log` VALUES ('617', 'H7108721', '0e:a6:22:80', '2147483647', '90a2e0269b6c878', '取餐', '2017-10-24 14:07:49');
INSERT INTO `ccard_take_food_log` VALUES ('618', 'H7108721', '0e:a6:22:80', '2147483647', '90a2e0269b6c878', '取餐', '2017-10-24 14:07:49');
INSERT INTO `ccard_take_food_log` VALUES ('619', 'H7108721', '0e:a6:22:80', '2147483647', '90a2e0269b6c878', '取餐', '2017-10-24 14:12:59');
INSERT INTO `ccard_take_food_log` VALUES ('620', 'H7108721', '0e:a6:22:80', '2147483647', '90a2e0269b6c878', '取餐', '2017-10-24 14:12:59');
INSERT INTO `ccard_take_food_log` VALUES ('621', 'H7108721', '0e:a6:22:80', '2147483647', '90a2e0269b6c878', '取餐', '2017-10-24 14:13:05');
INSERT INTO `ccard_take_food_log` VALUES ('622', 'H7108721', '0e:a6:22:80', '2147483647', '90a2e0269b6c878', '取餐', '2017-10-24 14:13:06');
INSERT INTO `ccard_take_food_log` VALUES ('623', 'H7108721', '0e:a6:22:80', '2147483647', '90a2e0269b6c878', '取餐', '2017-10-24 14:13:14');
INSERT INTO `ccard_take_food_log` VALUES ('624', 'H7108721', '0e:a6:22:80', '2147483647', '90a2e0269b6c878', '取餐', '2017-10-24 14:13:14');
INSERT INTO `ccard_take_food_log` VALUES ('625', 'H7108721', '0e:a6:22:80', '2147483647', '90a2e0269b6c878', '取餐', '2017-10-24 14:13:22');
INSERT INTO `ccard_take_food_log` VALUES ('626', 'H7108721', '0e:a6:22:80', '2147483647', '90a2e0269b6c878', '取餐', '2017-10-24 14:13:22');
INSERT INTO `ccard_take_food_log` VALUES ('627', 'H7108721', '0e:a6:22:80', '2147483647', '90a2e0269b6c878', '取餐', '2017-10-24 14:13:30');
INSERT INTO `ccard_take_food_log` VALUES ('628', 'H7108721', '0e:a6:22:80', '2147483647', '90a2e0269b6c878', '取餐', '2017-10-24 14:13:30');
INSERT INTO `ccard_take_food_log` VALUES ('629', 'H7108721', '0e:a6:22:80', '2147483647', '90a2e0269b6c878', '取餐', '2017-10-24 14:14:46');
INSERT INTO `ccard_take_food_log` VALUES ('630', 'H7108721', '0e:a6:22:80', '2147483647', '90a2e0269b6c878', '取餐', '2017-10-24 14:14:46');
INSERT INTO `ccard_take_food_log` VALUES ('631', 'H7108721', '0e:a6:22:80', '2147483647', '90a2e0269b6c878', '取餐', '2017-10-24 14:14:55');
INSERT INTO `ccard_take_food_log` VALUES ('632', 'H7108721', '0e:a6:22:80', '2147483647', '90a2e0269b6c878', '取餐', '2017-10-24 14:14:55');
INSERT INTO `ccard_take_food_log` VALUES ('633', 'H7108721', '0e:a6:22:80', '2147483647', '90a2e0269b6c878', '取餐', '2017-10-24 14:15:02');
INSERT INTO `ccard_take_food_log` VALUES ('634', 'H7108721', '0e:a6:22:80', '2147483647', '90a2e0269b6c878', '取餐', '2017-10-24 14:15:02');
INSERT INTO `ccard_take_food_log` VALUES ('635', 'H7108721', '0e:a6:22:80', '2147483647', '90a2e0269b6c878', '取餐', '2017-10-24 14:15:13');
INSERT INTO `ccard_take_food_log` VALUES ('636', 'H7108721', '0e:a6:22:80', '2147483647', '90a2e0269b6c878', '取餐', '2017-10-24 14:15:13');
INSERT INTO `ccard_take_food_log` VALUES ('637', 'H7108721', '0e:a6:22:80', '2147483647', '90a2e0269b6c878', '取餐', '2017-10-24 14:15:21');
INSERT INTO `ccard_take_food_log` VALUES ('638', 'H7108721', '0e:a6:22:80', '2147483647', '90a2e0269b6c878', '取餐', '2017-10-24 14:15:21');
INSERT INTO `ccard_take_food_log` VALUES ('639', 'H7108721', '0e:a6:22:80', '2147483647', '90a2e0269b6c878', '取餐', '2017-10-24 14:21:43');
INSERT INTO `ccard_take_food_log` VALUES ('640', 'H7108721', '0e:a6:22:80', '2147483647', '90a2e0269b6c878', '取餐', '2017-10-24 14:21:43');
INSERT INTO `ccard_take_food_log` VALUES ('641', 'H7108721', '0e:a6:22:80', '2147483647', '90a2e0269b6c878', '取餐', '2017-10-24 14:22:11');
INSERT INTO `ccard_take_food_log` VALUES ('642', 'H7108721', '0e:a6:22:80', '2147483647', '90a2e0269b6c878', '取餐', '2017-10-24 14:22:11');
INSERT INTO `ccard_take_food_log` VALUES ('643', 'H7108721', '0e:a6:22:80', '2147483647', '90a2e0269b6c878', '取餐', '2017-10-24 14:22:19');
INSERT INTO `ccard_take_food_log` VALUES ('644', 'H7108721', '0e:a6:22:80', '2147483647', '90a2e0269b6c878', '取餐', '2017-10-24 14:22:19');
INSERT INTO `ccard_take_food_log` VALUES ('645', 'H7108721', '0e:a6:22:80', '2147483647', '90a2e0269b6c878', '取餐', '2017-10-24 14:24:11');
INSERT INTO `ccard_take_food_log` VALUES ('646', 'H7108721', '0e:a6:22:80', '2147483647', '90a2e0269b6c878', '取餐', '2017-10-24 14:24:11');
INSERT INTO `ccard_take_food_log` VALUES ('647', 'H7108721', '0e:a6:22:80', '2147483647', '90a2e0269b6c878', '取餐', '2017-10-24 14:24:20');
INSERT INTO `ccard_take_food_log` VALUES ('648', 'H7108721', '0e:a6:22:80', '2147483647', '90a2e0269b6c878', '取餐', '2017-10-24 14:24:20');
INSERT INTO `ccard_take_food_log` VALUES ('649', 'H7108721', '0e:a6:22:80', '2147483647', '90a2e0269b6c878', '取餐', '2017-10-24 14:40:59');
INSERT INTO `ccard_take_food_log` VALUES ('650', 'H7108721', '0e:a6:22:80', '2147483647', '90a2e0269b6c878', '取餐', '2017-10-24 14:40:59');
INSERT INTO `ccard_take_food_log` VALUES ('651', 'H7106885', 'e4:e9:07:ed', '2147483647', '90a2e0269b6c878', '取餐', '2017-10-24 14:59:31');
INSERT INTO `ccard_take_food_log` VALUES ('652', 'H7108721', '0e:a6:22:80', '2147483647', '90a2e0269b6c878', '取餐', '2017-10-24 15:02:54');
INSERT INTO `ccard_take_food_log` VALUES ('653', 'H7108721', '0e:a6:22:80', '2147483647', '90a2e0269b6c878', '取餐', '2017-10-24 15:02:54');
INSERT INTO `ccard_take_food_log` VALUES ('654', 'H7108721', '0e:a6:22:80', '2147483647', '90a2e0269b6c878', '取餐', '2017-10-24 15:50:18');
INSERT INTO `ccard_take_food_log` VALUES ('655', 'H7108721', '0e:a6:22:80', '2147483647', '90a2e0269b6c878', '取餐', '2017-10-24 15:50:18');
INSERT INTO `ccard_take_food_log` VALUES ('656', 'H7107898', '30:24:f7:03', '2147483647', '90a2e0269b6c878', '取餐', '2017-10-24 15:51:37');
INSERT INTO `ccard_take_food_log` VALUES ('657', 'H7108721', '0e:a6:22:80', '2147483647', '90a2e0269b6c878', '取餐', '2017-10-26 16:20:24');
INSERT INTO `ccard_take_food_log` VALUES ('658', 'H7106885', 'e4:e9:07:ed', '2147483647', '90a2e0269b6c878', '取餐', '2017-10-26 16:20:38');
INSERT INTO `ccard_take_food_log` VALUES ('659', 'H7106885', 'e4:e9:07:ed', '2147483647', '90a2e0269b6c878', '取餐', '2017-10-26 16:20:38');
INSERT INTO `ccard_take_food_log` VALUES ('660', 'H7106885', 'e4:e9:07:ed', '2147483647', '90a2e0269b6c878', '取餐', '2017-10-26 16:20:38');
INSERT INTO `ccard_take_food_log` VALUES ('661', 'H7107828', 'b4:5f:fe:01', '2147483647', '90a2e0269b6c878', '取餐', '2017-10-31 08:45:33');
INSERT INTO `ccard_take_food_log` VALUES ('662', 'H7107828', 'b4:5f:fe:01', '2147483647', '90a2e0269b6c878', '取餐', '2017-10-31 08:45:33');
INSERT INTO `ccard_take_food_log` VALUES ('663', 'H7107898', '30:24:f7:03', '2147483647', '90a2e0269b6c878', '取餐', '2017-10-31 08:46:11');
INSERT INTO `ccard_take_food_log` VALUES ('664', 'H7108721', '0e:a6:22:80', '2147483647', '90a2e0269b6c878', '取餐', '2017-10-31 10:22:35');
INSERT INTO `ccard_take_food_log` VALUES ('665', 'H7108721', '0e:a6:22:80', '2147483647', '90a2e0269b6c878', '取餐', '2017-10-31 10:22:35');
INSERT INTO `ccard_take_food_log` VALUES ('666', 'H7106717', '2b:df:4b:0d', '2147483647', '90a2e0269b6c878', '取餐', '2018-01-23 10:41:31');
INSERT INTO `ccard_take_food_log` VALUES ('667', 'H7106717', '2b:df:4b:0d', '2147483647', '90a2e0269b6c878', '取餐', '2018-01-23 10:41:31');
INSERT INTO `ccard_take_food_log` VALUES ('668', 'H7109426', 'b4:71:f8:01', '2147483647', '90a2e0269b6c878', '取餐', '2018-01-23 10:41:37');
INSERT INTO `ccard_take_food_log` VALUES ('669', 'F1040652', '0b:2c:4e:07', '2147483647', '90a2e0269b6c878', '取餐', '2018-01-23 13:53:14');

-- ----------------------------
-- Table structure for ccard_type
-- ----------------------------
DROP TABLE IF EXISTS `ccard_type`;
CREATE TABLE `ccard_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `note` varchar(255) NOT NULL,
  `add_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ccard_type
-- ----------------------------
INSERT INTO `ccard_type` VALUES ('1', '早餐', '', '2017-08-03 16:17:02');
INSERT INTO `ccard_type` VALUES ('2', '标准餐', '', '2017-08-03 16:17:02');
INSERT INTO `ccard_type` VALUES ('3', '商务餐', '', '2017-08-03 16:17:19');
INSERT INTO `ccard_type` VALUES ('4', '自选餐', '', '2017-08-08 08:58:07');
INSERT INTO `ccard_type` VALUES ('5', '特色餐', '', '2017-08-30 11:04:15');
INSERT INTO `ccard_type` VALUES ('6', '汉堡', '', '2017-09-25 16:44:15');

-- ----------------------------
-- Table structure for ccard_upload_file_log
-- ----------------------------
DROP TABLE IF EXISTS `ccard_upload_file_log`;
CREATE TABLE `ccard_upload_file_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `devid` varchar(50) NOT NULL,
  `file_name` varchar(50) NOT NULL,
  `operate` varchar(50) NOT NULL,
  `count` int(11) NOT NULL,
  `add_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ccard_upload_file_log
-- ----------------------------
INSERT INTO `ccard_upload_file_log` VALUES ('1', '90a2e0269b6c878', '1504943889.json', '上传', '4', '2017-09-09 15:58:10');
INSERT INTO `ccard_upload_file_log` VALUES ('2', '90a2e0269b6c878', '1504946929.json', '上传', '4', '2017-09-09 16:48:50');
INSERT INTO `ccard_upload_file_log` VALUES ('3', '90a2e0269b6c878', '1504948901.json', '上传', '1', '2017-09-09 17:21:41');
INSERT INTO `ccard_upload_file_log` VALUES ('4', '90a2e0269b6c878', '1504949419.json', '上传', '1', '2017-09-09 17:30:19');
INSERT INTO `ccard_upload_file_log` VALUES ('5', '90a2e0269b6c878', '1505104125.json', '上传', '3', '2017-09-11 12:28:45');
