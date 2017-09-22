/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50624
Source Host           : localhost:3306
Source Database       : web-sample

Target Server Type    : MYSQL
Target Server Version : 50624
File Encoding         : 65001

Date: 2017-09-22 18:23:15
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin_application
-- ----------------------------
DROP TABLE IF EXISTS `admin_application`;
CREATE TABLE `admin_application` (
  `CODE` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '系统代码',
  `NAME` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '系统名称',
  `BASE_URL` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '访问路径',
  `CREATE_AT` datetime DEFAULT NULL,
  `UPDATE_AT` datetime DEFAULT NULL,
  PRIMARY KEY (`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='系统模块表';

-- ----------------------------
-- Records of admin_application
-- ----------------------------
INSERT INTO `admin_application` VALUES ('Apps', '后台管理系统', null, '2016-07-17 01:33:49', '2016-09-30 16:36:54');

-- ----------------------------
-- Table structure for admin_login_log
-- ----------------------------
DROP TABLE IF EXISTS `admin_login_log`;
CREATE TABLE `admin_login_log` (
  `ID` bigint(20) NOT NULL,
  `USER_ID` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `USER_NAME` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '用户名',
  `NICK_NAME` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '昵称',
  `NGID` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT 'ngid',
  `OPERATION_TYE` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '操作类型',
  `OPERATION_TIME` datetime DEFAULT NULL COMMENT '操作时间',
  `IS_SUCCESS` bit(1) DEFAULT NULL COMMENT '是否成功',
  `USER_IP` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '用户IP',
  `BROWSER` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '浏览器',
  `USER_AGENT` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT 'USER_AGENT',
  `SESSION_ID` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '服务器会话id',
  `SECURITY_TOKEN` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '安全token',
  `ERROR_MSG` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '登录异常信息',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of admin_login_log
-- ----------------------------

-- ----------------------------
-- Table structure for admin_permission
-- ----------------------------
DROP TABLE IF EXISTS `admin_permission`;
CREATE TABLE `admin_permission` (
  `CODE` varchar(255) COLLATE utf8_bin NOT NULL COMMENT '权限代码',
  `PTYPE` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '权限类型',
  `DATA_FROM` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT 'SYNC:自动同步\r\n            MANUAL:手动添加',
  `URL` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '如果该权限是菜单，代表点击菜单时可以访问的目标地址',
  `METHOD` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_CODE` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '父菜单ID',
  `NAME` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `SORT` int(11) DEFAULT NULL,
  `HIDDEN` smallint(6) DEFAULT NULL,
  `CHILDREN_SIZE` int(11) DEFAULT NULL COMMENT '子节点数量',
  `APP_CODE` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `RESOURCES_PATTERN` varchar(1000) COLLATE utf8_bin DEFAULT NULL COMMENT '如果权限保护是通过某种模式匹配，比如web的url\r\n            则此字段代表了这权限需要保护的资源。\r\n            其他模式的权限不需要用到此字段。\r\n            如果是url，则按照下面的格式解释，多个模式之间用逗号分隔：\r\n            请求方法 | url地址，如：post | /user/create, /user/list\r\n            没有请求方法的默认为get\r\n            ',
  PRIMARY KEY (`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of admin_permission
-- ----------------------------
INSERT INTO `admin_permission` VALUES ('Apps', 'MENU', 'SYNC', '', null, null, '后台管理系统', '1', '0', '1', 'Apps', null);
INSERT INTO `admin_permission` VALUES ('Apps_AdminModule', 'MENU', 'SYNC', '', null, 'Apps', '用户角色权限管理', '4747', '0', '3', 'Apps', null);
INSERT INTO `admin_permission` VALUES ('Apps_AdminModule_AdminRoleMgr', 'MENU', 'SYNC', '/web-admin/role', 'GET', 'Apps_AdminModule', '角色管理', '1', '0', '4', 'Apps', 'GET|/web-admin/role*, GET|/web-admin/role/*');
INSERT INTO `admin_permission` VALUES ('Apps_AdminModule_AdminRoleMgr_AssignPermission', 'FUNCTION', 'SYNC', null, null, 'Apps_AdminModule_AdminRoleMgr', '分配权限', '4755', '0', '0', 'Apps', 'POST|/web-admin/rolePermission/*, GET|/web-admin/rolePermission/*');
INSERT INTO `admin_permission` VALUES ('Apps_AdminModule_AdminRoleMgr_Create', 'FUNCTION', 'SYNC', null, null, 'Apps_AdminModule_AdminRoleMgr', '新增', '4758', '0', '0', 'Apps', 'POST|/web-admin/role*');
INSERT INTO `admin_permission` VALUES ('Apps_AdminModule_AdminRoleMgr_Delete', 'FUNCTION', 'SYNC', null, null, 'Apps_AdminModule_AdminRoleMgr', '删除', '4756', '0', '0', 'Apps', 'DELETE|/web-admin/role*');
INSERT INTO `admin_permission` VALUES ('Apps_AdminModule_AdminRoleMgr_Update', 'FUNCTION', 'SYNC', null, null, 'Apps_AdminModule_AdminRoleMgr', '更新', '4757', '0', '0', 'Apps', 'PUT|/web-admin/role/*');
INSERT INTO `admin_permission` VALUES ('Apps_AdminModule_AdminUserMgr', 'MENU', 'SYNC', '/web-admin/user', 'GET', 'Apps_AdminModule', '用户管理', '2', '0', '4', 'Apps', 'GET|/web-admin/user*, GET|/web-admin/user/*');
INSERT INTO `admin_permission` VALUES ('Apps_AdminModule_AdminUserMgr_AssignRole', 'FUNCTION', 'SYNC', null, null, 'Apps_AdminModule_AdminUserMgr', '分配角色', '4750', '0', '0', 'Apps', 'PUT|/web-admin/userRole/*, GET|/web-admin/userRole/*');
INSERT INTO `admin_permission` VALUES ('Apps_AdminModule_AdminUserMgr_Create', 'FUNCTION', 'SYNC', null, null, 'Apps_AdminModule_AdminUserMgr', '新增', '4753', '0', '0', 'Apps', 'POST|/web-admin/user*');
INSERT INTO `admin_permission` VALUES ('Apps_AdminModule_AdminUserMgr_Delete', 'FUNCTION', 'SYNC', null, null, 'Apps_AdminModule_AdminUserMgr', '删除', '4751', '0', '0', 'Apps', 'DELETE|/web-admin/user*');
INSERT INTO `admin_permission` VALUES ('Apps_AdminModule_AdminUserMgr_Update', 'FUNCTION', 'SYNC', null, null, 'Apps_AdminModule_AdminUserMgr', '更新', '4752', '0', '0', 'Apps', 'PUT|/web-admin/user/*');
INSERT INTO `admin_permission` VALUES ('Apps_AdminModule_DictMgr', 'MENU', 'SYNC', '/web-admin/dictionary', 'GET', 'Apps_AdminModule', '字典配置管理', '4748', '0', '0', 'Apps', 'GET|/web-admin/dictionary*, GET|/web-admin/dictionary/*, PUT|/web-admin/dictionary/*, DELETE|/web-admin/dictionary/*, POST|/web-admin/dictionary*, GET|/web-admin/dictionary/children*, DELETE|/web-admin/dictionary*');

-- ----------------------------
-- Table structure for admin_role
-- ----------------------------
DROP TABLE IF EXISTS `admin_role`;
CREATE TABLE `admin_role` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '角色名',
  `STATUS` varchar(10) COLLATE utf8_bin NOT NULL DEFAULT 'NORMAL' COMMENT '状态\r\n            NORMAL:正常\r\n            STOP:停用',
  `REMARK` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '角色描述',
  `CREATE_AT` datetime DEFAULT NULL,
  `UPDATE_AT` datetime DEFAULT NULL,
  `APP_CODE` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '系统代码',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='角色表';

-- ----------------------------
-- Records of admin_role
-- ----------------------------
INSERT INTO `admin_role` VALUES ('1', '管理员', 'NORMAL', '', '2016-07-17 01:29:30', '2016-07-17 01:29:30', null);

-- ----------------------------
-- Table structure for admin_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `admin_role_permission`;
CREATE TABLE `admin_role_permission` (
  `ROLE_ID` decimal(8,0) NOT NULL,
  `PERMISSION_CODE` varchar(255) COLLATE utf8_bin NOT NULL COMMENT '权限代码',
  PRIMARY KEY (`ROLE_ID`,`PERMISSION_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='角色权限表';

-- ----------------------------
-- Records of admin_role_permission
-- ----------------------------
INSERT INTO `admin_role_permission` VALUES ('1', 'Apps_AdminModule_AdminUserMgr');
INSERT INTO `admin_role_permission` VALUES ('1', 'Apps_AdminModule_AdminUserMgr_Create');
INSERT INTO `admin_role_permission` VALUES ('1', 'Apps_AdminModule_AdminUserMgr_Delete');
INSERT INTO `admin_role_permission` VALUES ('1', 'Apps_AdminModule_AdminUserMgr_Update');

-- ----------------------------
-- Table structure for admin_user
-- ----------------------------
DROP TABLE IF EXISTS `admin_user`;
CREATE TABLE `admin_user` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `USER_NAME` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '用户名',
  `NICK_NAME` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '昵称',
  `PASSWORD` varchar(512) COLLATE utf8_bin NOT NULL COMMENT '密码',
  `EMAIL` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '电子邮件',
  `MOBILE` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '手机',
  `GENDER` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '性别',
  `STATUS` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '状态:\r\n            NORMAL-正常\r\n            STOP-停用\r\n            ',
  `BIRTHDAY` datetime DEFAULT NULL COMMENT '出生日期',
  `CREATE_AT` datetime DEFAULT NULL COMMENT '创建时间',
  `UPDATE_AT` datetime DEFAULT NULL COMMENT '最后更新时间',
  `APP_CODE` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='用户表';

-- ----------------------------
-- Records of admin_user
-- ----------------------------
INSERT INTO `admin_user` VALUES ('1', 'root', '终极管理员', '$2a$10$4ft6RTeIB2.FBkWUEWY10OI0YAfftSIlHa2cZmmc8OpcJEbUaMkji', null, null, null, 'NORMAL', '2016-07-18 00:46:32', null, '2016-07-17 00:46:37', null);
INSERT INTO `admin_user` VALUES ('2', 'test', '测试用户', '$2a$10$37LQSTCGxXbK27NmNLC.XOEluiTE3OCVkbNQUw5qqnYxqXqmDGUEy', '', '', 'MALE', 'NORMAL', '2016-07-17 22:30:24', '2016-07-17 22:30:27', '2016-07-18 00:03:39', null);

-- ----------------------------
-- Table structure for admin_user_role
-- ----------------------------
DROP TABLE IF EXISTS `admin_user_role`;
CREATE TABLE `admin_user_role` (
  `ROLE_ID` bigint(20) NOT NULL COMMENT '角色主键',
  `USER_ID` bigint(20) NOT NULL COMMENT '用户主键',
  PRIMARY KEY (`ROLE_ID`,`USER_ID`),
  KEY `FK_R_AD_ROLE_USER` (`USER_ID`),
  CONSTRAINT `FK_R_AD_ROLE_USER` FOREIGN KEY (`USER_ID`) REFERENCES `admin_user` (`ID`),
  CONSTRAINT `FK_R_AD_USER_ROLE` FOREIGN KEY (`ROLE_ID`) REFERENCES `admin_role` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='用户角色关联表';

-- ----------------------------
-- Records of admin_user_role
-- ----------------------------

-- ----------------------------
-- Table structure for databasechangelog
-- ----------------------------
DROP TABLE IF EXISTS `databasechangelog`;
CREATE TABLE `databasechangelog` (
  `ID` varchar(255) COLLATE utf8_bin NOT NULL,
  `AUTHOR` varchar(255) COLLATE utf8_bin NOT NULL,
  `FILENAME` varchar(255) COLLATE utf8_bin NOT NULL,
  `DATEEXECUTED` datetime NOT NULL,
  `ORDEREXECUTED` int(11) NOT NULL,
  `EXECTYPE` varchar(10) COLLATE utf8_bin NOT NULL,
  `MD5SUM` varchar(35) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `COMMENTS` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TAG` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LIQUIBASE` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `CONTEXTS` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LABELS` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DEPLOYMENT_ID` varchar(10) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of databasechangelog
-- ----------------------------
INSERT INTO `databasechangelog` VALUES ('1', 'way', 'src/main/resources/liquibase/db.changelog.xml', '2016-09-27 11:45:03', '1', 'EXECUTED', '7:10349a8fb3a7208fb013dcd6ca68c593', 'createTable tableName=ADMIN_LOGIN_LOG', '', null, '3.5.0', null, null, '4947903828');

-- ----------------------------
-- Table structure for databasechangeloglock
-- ----------------------------
DROP TABLE IF EXISTS `databasechangeloglock`;
CREATE TABLE `databasechangeloglock` (
  `ID` int(11) NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `LOCKGRANTED` datetime DEFAULT NULL,
  `LOCKEDBY` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of databasechangeloglock
-- ----------------------------
INSERT INTO `databasechangeloglock` VALUES ('1', '\0', null, null);

-- ----------------------------
-- Table structure for data_dictionary
-- ----------------------------
DROP TABLE IF EXISTS `data_dictionary`;
CREATE TABLE `data_dictionary` (
  `CODE` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '字典编码\r\n            同一类别的字典编码，以类别编码为前缀,全部为大写字母',
  `NAME` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '显示名称',
  `VALUE` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '字典值',
  `PARENT_CODE` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '所属类别',
  `IS_VALID` tinyint(1) DEFAULT NULL COMMENT '是否有效\r\n            0:无效\r\n            1:有效\r\n            默认有效\r\n            ',
  `IS_ENUM_VALUE` tinyint(1) DEFAULT NULL COMMENT '是否枚举常量',
  `SORT` int(11) DEFAULT NULL COMMENT '排序',
  `REMARK` varchar(1000) COLLATE utf8_bin DEFAULT NULL COMMENT '描述',
  `CREATE_AT` datetime DEFAULT NULL COMMENT '创建日期',
  `UPDATE_AT` datetime DEFAULT NULL COMMENT '最后更新日期',
  PRIMARY KEY (`CODE`),
  KEY `AK_DICT_UNIQUE_CODE` (`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='数据字典表';

-- ----------------------------
-- Records of data_dictionary
-- ----------------------------
INSERT INTO `data_dictionary` VALUES ('SEX', '性别', 'SEX', '', '1', null, null, '', null, '2016-07-17 23:52:52');
INSERT INTO `data_dictionary` VALUES ('SEX_FEMALE', '女', 'FEMALE', 'SEX', '1', null, null, '', null, '2016-07-18 00:03:18');
INSERT INTO `data_dictionary` VALUES ('SEX_MALE', '男', 'MALE', 'SEX', '1', null, null, '', null, '2016-07-18 00:03:08');

-- ----------------------------
-- Table structure for web_user
-- ----------------------------
DROP TABLE IF EXISTS `web_user`;
CREATE TABLE `web_user` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `USER_NAME` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '用户名',
  `NICK_NAME` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '昵称',
  `PASSWORD` varchar(512) COLLATE utf8_bin NOT NULL COMMENT '密码',
  `EMAIL` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '电子邮件',
  `MOBILE` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '手机',
  `GENDER` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '性别',
  `STATUS` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '状态:\r\n            NORMAL-正常\r\n            STOP-停用\r\n            ',
  `BIRTHDAY` datetime DEFAULT NULL COMMENT '出生日期',
  `CREATE_AT` datetime DEFAULT NULL COMMENT '创建时间',
  `UPDATE_AT` datetime DEFAULT NULL COMMENT '最后更新时间',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='用户表';

-- ----------------------------
-- Records of web_user
-- ----------------------------
