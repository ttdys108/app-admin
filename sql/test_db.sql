/*
 Navicat Premium Data Transfer

 Source Server         : 121.36.137.124
 Source Server Type    : MySQL
 Source Server Version : 50728
 Source Host           : 121.36.137.124:3306
 Source Schema         : test_db

 Target Server Type    : MySQL
 Target Server Version : 50728
 File Encoding         : 65001

 Date: 09/01/2020 13:42:28
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for base_admin
-- ----------------------------
DROP TABLE IF EXISTS `base_admin`;
CREATE TABLE `base_admin`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `nick_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `sex` tinyint(2) NULL DEFAULT 1 COMMENT '性别（1：男；0：女）',
  `age` int(3) NULL DEFAULT NULL COMMENT '年龄',
  `birth` date NULL DEFAULT NULL COMMENT '生日',
  `photo` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像',
  `address` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址',
  `entry_date` date NULL DEFAULT NULL COMMENT '入职日期',
  `login_count` bigint(20) NULL DEFAULT NULL COMMENT '登录次数',
  `last_login_time` datetime(0) NULL DEFAULT NULL COMMENT '上次登录时间',
  `remark` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `creator_id` bigint(20) NULL DEFAULT NULL COMMENT '创建者id',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间 ',
  `updater_id` bigint(20) NULL DEFAULT NULL COMMENT '更新者id',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `i_id`(`id`) USING BTREE,
  INDEX `i_user_id`(`user_id`) USING BTREE,
  CONSTRAINT `FK_admin_user_user_id` FOREIGN KEY (`user_id`) REFERENCES `base_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '后台用户表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of base_admin
-- ----------------------------
INSERT INTO `base_admin` VALUES (1, 1, 'wangdm', 1, 11, NULL, NULL, '青岛', NULL, NULL, '2019-06-04 09:15:20', NULL, NULL, '2019-11-11 04:05:57', NULL, NULL);
INSERT INTO `base_admin` VALUES (2, 21, NULL, 1, 201, NULL, NULL, NULL, NULL, NULL, NULL, '00', NULL, '2019-11-08 09:52:43', NULL, NULL);
INSERT INTO `base_admin` VALUES (3, 32, NULL, 1, 20, NULL, '../../assets/images/order/05235458.jpg', NULL, NULL, NULL, NULL, '众安控股理财经理', NULL, '2019-07-11 12:15:09', NULL, NULL);
INSERT INTO `base_admin` VALUES (4, 33, NULL, 1, 20, NULL, NULL, NULL, NULL, NULL, NULL, 'test3', NULL, '2019-06-25 17:01:03', NULL, NULL);
INSERT INTO `base_admin` VALUES (5, 34, NULL, 1, 20, NULL, NULL, NULL, NULL, NULL, NULL, '101010101', NULL, '2019-10-28 02:36:18', NULL, NULL);

-- ----------------------------
-- Table structure for base_admin_customer
-- ----------------------------
DROP TABLE IF EXISTS `base_admin_customer`;
CREATE TABLE `base_admin_customer`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(20) NOT NULL COMMENT '业务员id',
  `customer_id` bigint(20) NOT NULL COMMENT '客户id',
  `creator_id` bigint(20) NULL DEFAULT NULL COMMENT '创建者id',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间 ',
  `updater_id` bigint(20) NULL DEFAULT NULL COMMENT '更新者id',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `i_user_id`(`user_id`) USING BTREE,
  INDEX `i_customer_id`(`customer_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 45 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '业务员_客户_关系表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of base_admin_customer
-- ----------------------------
INSERT INTO `base_admin_customer` VALUES (3, 1, 31, NULL, NULL, NULL, NULL);
INSERT INTO `base_admin_customer` VALUES (17, 1, 36, NULL, NULL, NULL, '2019-07-04 18:36:09');
INSERT INTO `base_admin_customer` VALUES (34, 32, 28, NULL, NULL, NULL, '2019-07-05 15:48:59');
INSERT INTO `base_admin_customer` VALUES (37, 21, 35, NULL, NULL, NULL, '2019-07-05 15:50:49');
INSERT INTO `base_admin_customer` VALUES (41, 21, 30, NULL, NULL, NULL, '2019-07-20 16:45:13');
INSERT INTO `base_admin_customer` VALUES (44, 1, 37, NULL, NULL, NULL, '2019-11-11 04:24:59');

-- ----------------------------
-- Table structure for base_bank
-- ----------------------------
DROP TABLE IF EXISTS `base_bank`;
CREATE TABLE `base_bank`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `bank_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '银行名称',
  `bank_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '银行编号',
  `type` tinyint(2) NULL DEFAULT 1 COMMENT '银行卡类型（1：借记卡；2：贷记卡）',
  `quota_mix` decimal(5, 2) NULL DEFAULT NULL COMMENT '银行最低限额',
  `quota_max` decimal(9, 2) NULL DEFAULT NULL COMMENT '银行最高限额',
  `sort` int(8) NULL DEFAULT NULL COMMENT '排序',
  `status` tinyint(2) NULL DEFAULT 1 COMMENT '状态（0：禁用；1：启用）',
  `is_deleted` tinyint(2) NULL DEFAULT 0 COMMENT '是否删除（0：未删除，1：已删除）',
  `creator_id` bigint(20) NULL DEFAULT NULL COMMENT '创建者id',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间 ',
  `updater_id` bigint(20) NULL DEFAULT NULL COMMENT '更新者id',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `i_id`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '银行卡表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of base_bank
-- ----------------------------
INSERT INTO `base_bank` VALUES (1, '工商银行', '001', 1, 500.00, 50000.00, 1, 1, 0, NULL, '2019-07-24 14:36:24', NULL, NULL);
INSERT INTO `base_bank` VALUES (2, '建设银行', '002', 1, 200.00, 100000.00, 2, 1, 0, NULL, '2019-07-24 15:39:32', NULL, NULL);
INSERT INTO `base_bank` VALUES (3, '招商银行', '003', 1, 300.00, 100000.00, 3, 1, 0, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for base_common_key_value
-- ----------------------------
DROP TABLE IF EXISTS `base_common_key_value`;
CREATE TABLE `base_common_key_value`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `key_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '键值key',
  `value` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '键值value',
  `type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类型，可以用来查出一批key',
  `expire_time` int(11) NULL DEFAULT NULL COMMENT '失效时间 单位秒',
  `exp_time` datetime(0) NULL DEFAULT NULL COMMENT '过期时间',
  `creator_id` bigint(20) NULL DEFAULT NULL COMMENT '创建者id',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间 ',
  `updater_id` bigint(20) NULL DEFAULT NULL COMMENT '更新者id',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `i_id`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '公共变量表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for base_customer
-- ----------------------------
DROP TABLE IF EXISTS `base_customer`;
CREATE TABLE `base_customer`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `user_no` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `identity` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证号码',
  `nick_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `sex` tinyint(2) NULL DEFAULT 1 COMMENT '性别（1：男；0：女）',
  `age` int(3) NULL DEFAULT NULL COMMENT '年龄',
  `birth` date NULL DEFAULT NULL COMMENT '生日',
  `photo` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像',
  `level_id` bigint(20) NULL DEFAULT NULL COMMENT '客户等级',
  `score` bigint(255) NULL DEFAULT NULL COMMENT '客户积分',
  `address` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址',
  `login_count` bigint(20) NULL DEFAULT NULL COMMENT '登录次数',
  `last_login_time` datetime(0) NULL DEFAULT NULL COMMENT '上次登录时间',
  `remark` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `creator_id` bigint(20) NULL DEFAULT NULL COMMENT '创建者id',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间 ',
  `updater_id` bigint(20) NULL DEFAULT NULL COMMENT '更新者id',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `i_id`(`id`) USING BTREE,
  INDEX `i_user_id`(`user_id`) USING BTREE,
  CONSTRAINT `FK_customer_user_user_id` FOREIGN KEY (`user_id`) REFERENCES `base_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '客户表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for base_customer_bank
-- ----------------------------
DROP TABLE IF EXISTS `base_customer_bank`;
CREATE TABLE `base_customer_bank`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(20) NOT NULL COMMENT '客户id',
  `bank_id` bigint(20) NOT NULL COMMENT '银行id',
  `bank_num` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '银行卡号',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '银行预留手机号',
  `is_first` tinyint(2) NULL DEFAULT 0 COMMENT '主卡（1：是；0：否）',
  `sort` int(8) NULL DEFAULT NULL COMMENT '排序',
  `status` tinyint(2) NULL DEFAULT 1 COMMENT '状态（0：禁用；1：启用）',
  `is_deleted` tinyint(2) NULL DEFAULT 0 COMMENT '是否删除（0：未删除，1：已删除）',
  `creator_id` bigint(20) NULL DEFAULT NULL COMMENT '创建者id',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间 ',
  `updater_id` bigint(20) NULL DEFAULT NULL COMMENT '更新者id',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `i_id`(`id`) USING BTREE,
  INDEX `i_user_id`(`user_id`) USING BTREE,
  INDEX `i_bank_id`(`bank_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '客户银行卡表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of base_customer_bank
-- ----------------------------
INSERT INTO `base_customer_bank` VALUES (1, 30, 1, '6227002193743755188', '17667846625', 0, NULL, 1, 0, NULL, '2019-07-24 15:34:52', NULL, NULL);
INSERT INTO `base_customer_bank` VALUES (2, 30, 2, '6222021602016959562', '17667846625', 0, NULL, 1, 0, NULL, '2019-07-24 15:36:33', NULL, NULL);
INSERT INTO `base_customer_bank` VALUES (3, 30, 3, '6227002193743755088', '17667846625', 0, NULL, 1, 0, NULL, '2019-07-24 15:37:30', NULL, NULL);
INSERT INTO `base_customer_bank` VALUES (4, 1, 2, '6227002193743755088', '17667846626', 0, NULL, 1, 0, NULL, '2019-07-25 11:01:50', NULL, NULL);
INSERT INTO `base_customer_bank` VALUES (5, 28, 1, '6222021602016959563', '17667846626', 0, NULL, 1, 0, NULL, '2019-07-25 11:10:35', NULL, NULL);

-- ----------------------------
-- Table structure for base_customer_level
-- ----------------------------
DROP TABLE IF EXISTS `base_customer_level`;
CREATE TABLE `base_customer_level`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `min_score` bigint(20) NULL DEFAULT NULL COMMENT '最低分数',
  `max_score` bigint(20) NULL DEFAULT NULL COMMENT '最高分数',
  `level_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '等级名称',
  `level_value` int(20) NULL DEFAULT NULL,
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `creator_id` bigint(20) NULL DEFAULT NULL COMMENT '创建者id',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间 ',
  `updater_id` bigint(20) NULL DEFAULT NULL COMMENT '更新者id',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `i_id`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '会有等级表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of base_customer_level
-- ----------------------------
INSERT INTO `base_customer_level` VALUES (1, 200, 500, '普通会员', 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `base_customer_level` VALUES (2, 500, 800, '黄金会员', 2, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `base_customer_level` VALUES (3, 800, 1000, '钻石会员', 3, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for base_dictionary
-- ----------------------------
DROP TABLE IF EXISTS `base_dictionary`;
CREATE TABLE `base_dictionary`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `sys_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '系统编码',
  `dict_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字典名称',
  `dict_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字典编码',
  `text` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文本',
  `value` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '值',
  `sort` int(8) NULL DEFAULT NULL COMMENT '排序',
  `status` tinyint(2) NULL DEFAULT 1 COMMENT '状态（0：禁用；1：启用）',
  `is_deleted` tinyint(2) NULL DEFAULT 0 COMMENT '是否删除（0：未删除，1：已删除）',
  `remark` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `creator_id` bigint(20) NULL DEFAULT NULL COMMENT '创建者id',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间 ',
  `updater_id` bigint(20) NULL DEFAULT NULL COMMENT '更新者id',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `i_id`(`id`) USING BTREE,
  INDEX `i_sys_code`(`sys_code`) USING BTREE,
  INDEX `i_dic_name`(`dict_name`) USING BTREE,
  INDEX `i_dic_code`(`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '\r\n字典表\r\n\r\n' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of base_dictionary
-- ----------------------------
INSERT INTO `base_dictionary` VALUES (1, 'x-admin', '用户状态', 'user_status', '启用', '1', 1, 1, 0, '12313', 1, '2019-06-13 16:37:07', NULL, NULL);
INSERT INTO `base_dictionary` VALUES (3, 'x-admin', '用户状态', 'user_status', '禁用', '0', 2, 1, 0, '220', NULL, NULL, NULL, NULL);
INSERT INTO `base_dictionary` VALUES (4, 'x-admin', '用户状态', 'user_status', '未知', '2', 3, 1, 0, '00000', NULL, '2019-06-13 17:24:21', NULL, NULL);
INSERT INTO `base_dictionary` VALUES (5, 'x-admin', '角色状态', 'role_status', '启用', '1', 1, 1, 0, '222222', NULL, '2019-06-18 10:01:59', NULL, NULL);
INSERT INTO `base_dictionary` VALUES (6, 'x-admin', '角色状态', 'role_status', '禁用', '0', 2, 1, 0, '5555', NULL, NULL, NULL, NULL);
INSERT INTO `base_dictionary` VALUES (7, 'x-admin', '机构状态', 'org_status', '启用', '1', 1, 1, 0, '88888220000000000000000005545444444444444444444', NULL, '2019-06-18 10:01:59', NULL, NULL);
INSERT INTO `base_dictionary` VALUES (8, 'x-admin', '机构状态', 'org_status', '禁用', '0', 2, 0, 0, '机构状态 test', NULL, NULL, NULL, NULL);
INSERT INTO `base_dictionary` VALUES (9, 'x-admin', '标的类型', 'loan_type', '票据', '0', 1, 1, 0, '', NULL, NULL, NULL, NULL);
INSERT INTO `base_dictionary` VALUES (10, 'x-admin', '标的类型', 'loan_type', '不良资产', '1', 2, 1, 0, '', NULL, NULL, NULL, NULL);
INSERT INTO `base_dictionary` VALUES (11, 'x-admin', '标的类型', 'loan_type', '汽车', '2', 3, 1, 0, '', NULL, NULL, NULL, NULL);
INSERT INTO `base_dictionary` VALUES (13, 'x-admin', '合同状态', 'contract_status', '启用', '1', 1, 1, 0, '', NULL, NULL, NULL, NULL);
INSERT INTO `base_dictionary` VALUES (14, 'x-admin', '合同状态', 'contract_status', '禁用', '0', 2, 1, 0, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for base_gate_log
-- ----------------------------
DROP TABLE IF EXISTS `base_gate_log`;
CREATE TABLE `base_gate_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `menu` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单',
  `opt` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作',
  `uri` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '资源路径',
  `crt_time` datetime(0) NULL DEFAULT NULL COMMENT '操作时间',
  `crt_user` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作人ID',
  `crt_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作人',
  `crt_host` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作主机',
  `body` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 311 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '网关日志' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of base_gate_log
-- ----------------------------
INSERT INTO `base_gate_log` VALUES (1, '用户管理', '编辑', '/admin/user', '2019-06-13 10:43:40', '1', 'wangdm', '127.0.0.1', '123 456 789');
INSERT INTO `base_gate_log` VALUES (2, '用户编辑', '用户编辑', '/admin/administrator/update/{*}', '2019-06-25 15:49:35', '1', '少校', '/192.168.1.104:57922', 'null');
INSERT INTO `base_gate_log` VALUES (3, '用户编辑', '用户编辑', '/admin/administrator/update/{*}', '2019-06-25 15:53:06', '1', '少校', '/192.168.1.104:57922', 'null');
INSERT INTO `base_gate_log` VALUES (4, 'user', '用户编辑', '/admin/administrator/update/{*}', '2019-06-25 15:55:32', '1', '少校', '/192.168.1.104:57497', 'null');
INSERT INTO `base_gate_log` VALUES (5, '用户管理', '用户编辑', '/admin/administrator/update/{*}', '2019-06-25 15:58:51', '1', '少校', '/192.168.1.104:57497', 'null');
INSERT INTO `base_gate_log` VALUES (6, '用户管理', '用户编辑', '/admin/administrator/update/{*}', '2019-06-25 16:00:08', '1', '少校', '/192.168.1.104:57497', 'null');
INSERT INTO `base_gate_log` VALUES (7, '用户管理', '用户编辑', '/admin/administrator/update/{*}', '2019-06-25 16:07:22', '1', '少校', '/192.168.1.104:57497', 'null');
INSERT INTO `base_gate_log` VALUES (8, '用户管理', '用户编辑', '/admin/administrator/update/{*}', '2019-06-25 16:13:33', '1', '少校', '/192.168.1.104:59319', 'null');
INSERT INTO `base_gate_log` VALUES (9, '用户管理', '用户编辑', '/admin/administrator/update/{*}', '2019-06-25 16:14:02', '1', '少校', '/192.168.1.104:59319', 'null');
INSERT INTO `base_gate_log` VALUES (10, '用户管理', '用户编辑', '/admin/administrator/update/{*}', '2019-06-25 16:15:32', '1', '少校', '/192.168.1.104:59319', 'null');
INSERT INTO `base_gate_log` VALUES (11, '用户管理', '用户编辑', '/admin/administrator/update/{*}', '2019-06-25 16:15:37', '1', '少校', '/192.168.1.104:59319', 'null');
INSERT INTO `base_gate_log` VALUES (12, '用户管理', '用户编辑', '/admin/administrator/update/{*}', '2019-06-25 16:16:57', '1', '少校', '/192.168.1.104:59319', 'null');
INSERT INTO `base_gate_log` VALUES (13, '用户管理', '用户编辑', '/admin/administrator/update/{*}', '2019-06-25 16:35:10', '1', '少校', '/192.168.1.104:60758', 'null');
INSERT INTO `base_gate_log` VALUES (14, '用户管理', '用户编辑', '/admin/administrator/update/{*}', '2019-06-25 16:36:49', '1', '少校', '/192.168.1.104:60758', 'null');
INSERT INTO `base_gate_log` VALUES (15, '用户管理', '用户编辑', '/admin/administrator/update/{*}', '2019-06-25 16:39:43', '1', '少校', '/192.168.1.104:61004', 'null');
INSERT INTO `base_gate_log` VALUES (16, '用户管理', '用户编辑', '/admin/administrator/update/{*}', '2019-06-25 16:40:59', '1', '少校', '/192.168.1.104:61004', 'null');
INSERT INTO `base_gate_log` VALUES (17, '用户管理', '用户编辑', '/admin/administrator/update/{*}', '2019-06-25 16:54:41', '1', '少校', '/192.168.1.104:61891', 'null');
INSERT INTO `base_gate_log` VALUES (18, '用户管理', '用户新增', '/admin/administrator/add', '2019-06-25 17:20:09', '1', '少校', '/192.168.1.104:63249', 'null');
INSERT INTO `base_gate_log` VALUES (19, '用户管理', '用户编辑', '/admin/administrator/update/{*}', '2019-06-25 17:40:36', '1', '少校', '/192.168.1.104:64328', 'null');
INSERT INTO `base_gate_log` VALUES (20, '用户管理', '用户编辑', '/admin/administrator/update/{*}', '2019-06-25 17:41:26', '1', '少校', '/192.168.1.104:64454', 'null');
INSERT INTO `base_gate_log` VALUES (21, '用户管理', '用户编辑', '/admin/administrator/update/{*}', '2019-06-25 17:42:01', '1', '少校', '/192.168.1.104:64450', 'null');
INSERT INTO `base_gate_log` VALUES (22, '用户管理', '用户编辑', '/admin/administrator/update/{*}', '2019-06-25 17:42:26', '1', '少校', '/192.168.1.104:64451', 'null');
INSERT INTO `base_gate_log` VALUES (23, '用户管理', '用户编辑', '/admin/administrator/update/{*}', '2019-06-25 17:44:33', '1', '少校', '/192.168.1.104:64599', 'null');
INSERT INTO `base_gate_log` VALUES (24, '用户管理', '用户编辑', '/admin/administrator/update/{*}', '2019-06-25 17:52:42', '1', '少校', '/192.168.1.104:65043', 'null');
INSERT INTO `base_gate_log` VALUES (25, '用户管理', '用户编辑', '/admin/administrator/update/{*}', '2019-06-25 17:59:13', '1', '少校', '/192.168.1.104:65395', 'null');
INSERT INTO `base_gate_log` VALUES (26, '用户管理', '用户编辑', '/admin/administrator/update/{*}', '2019-06-25 18:01:42', '1', '少校', '/192.168.1.104:65395', 'null');
INSERT INTO `base_gate_log` VALUES (27, '用户管理', '用户编辑', '/admin/administrator/update/{*}', '2019-06-25 18:02:34', '1', '少校', '/192.168.1.104:49212', 'null');
INSERT INTO `base_gate_log` VALUES (28, '用户管理', '用户编辑', '/admin/administrator/update/{*}', '2019-06-25 18:03:14', '1', '少校', '/192.168.1.104:49212', 'null');
INSERT INTO `base_gate_log` VALUES (29, '用户管理', '用户编辑', '/admin/administrator/update/{*}', '2019-06-25 18:04:25', '1', '少校', '/192.168.1.104:49212', 'null');
INSERT INTO `base_gate_log` VALUES (30, '用户管理', '用户编辑', '/admin/administrator/update/{*}', '2019-06-25 18:11:17', '1', '少校', '/192.168.1.104:49656', 'null');
INSERT INTO `base_gate_log` VALUES (31, '用户管理', '用户编辑', '/admin/administrator/update/{*}', '2019-06-25 19:07:41', '1', '少校', '/192.168.1.104:52731', 'null');
INSERT INTO `base_gate_log` VALUES (32, '用户管理', '用户编辑', '/admin/administrator/update/{*}', '2019-06-26 09:32:13', '1', '少校', '/192.168.1.104:51528', 'null');
INSERT INTO `base_gate_log` VALUES (33, '用户管理', '用户编辑', '/admin/administrator/update/{*}', '2019-06-26 09:45:19', '1', '少校', '/192.168.1.104:51561', 'null');
INSERT INTO `base_gate_log` VALUES (34, '用户管理', '用户编辑', '/admin/administrator/update/{*}', '2019-06-26 09:49:13', '1', '少校', '/192.168.1.104:51571', 'null');
INSERT INTO `base_gate_log` VALUES (35, '用户管理', '用户编辑', '/admin/administrator/update/{*}', '2019-06-26 09:52:04', '1', '少校', '/192.168.1.104:51569', 'null');
INSERT INTO `base_gate_log` VALUES (36, '用户管理', '用户编辑', '/admin/administrator/update/{*}', '2019-06-26 09:54:05', '1', '少校', '/192.168.1.104:51571', 'null');
INSERT INTO `base_gate_log` VALUES (37, '用户管理', '用户编辑', '/admin/administrator/update/{*}', '2019-06-26 09:59:39', '1', '少校', '/192.168.1.104:51571', 'null');
INSERT INTO `base_gate_log` VALUES (38, '用户管理', '用户编辑', '/admin/administrator/update/{*}', '2019-06-26 10:00:29', '1', '少校', '/192.168.1.104:51595', 'null');
INSERT INTO `base_gate_log` VALUES (39, '用户管理', '用户编辑', '/admin/administrator/update/{*}', '2019-06-26 10:17:21', '1', '少校', '/192.168.1.104:51747', 'null');
INSERT INTO `base_gate_log` VALUES (40, '用户管理', '用户编辑', '/admin/administrator/update/{*}', '2019-06-26 10:18:11', '1', '少校', '/192.168.1.104:51747', 'null');
INSERT INTO `base_gate_log` VALUES (41, '用户管理', '用户编辑', '/admin/administrator/update/{*}', '2019-06-26 10:26:30', '1', '少校', '/192.168.1.104:51806', 'null');
INSERT INTO `base_gate_log` VALUES (42, '用户管理', '用户编辑', '/admin/administrator/update/{*}', '2019-06-26 10:28:24', '1', '少校', '/192.168.1.104:51814', 'null');
INSERT INTO `base_gate_log` VALUES (43, '用户管理', '用户编辑', '/admin/administrator/update/{*}', '2019-06-26 10:28:33', '1', '少校', '/192.168.1.104:51814', 'null');
INSERT INTO `base_gate_log` VALUES (44, '用户管理', '用户编辑', '/admin/administrator/update/{*}', '2019-06-26 10:34:14', '1', '少校', '/192.168.1.104:51828', 'null');
INSERT INTO `base_gate_log` VALUES (45, '用户管理', '用户编辑', '/admin/adm/update/{*}', '2019-06-26 16:17:12', '1', '少校', '/192.168.1.104:55113', 'null');
INSERT INTO `base_gate_log` VALUES (46, '用户管理', '用户编辑', '/admin/adm/update/{*}', '2019-06-26 16:18:15', '1', '少校', '/192.168.1.104:55113', 'null');
INSERT INTO `base_gate_log` VALUES (47, '用户管理', '用户编辑', '/admin/adm/update/{*}', '2019-06-26 16:18:58', '1', '少校', '/192.168.1.104:55113', 'null');
INSERT INTO `base_gate_log` VALUES (48, '用户管理', '用户编辑', '/admin/adm/update/{*}', '2019-06-26 16:35:10', '1', '少校2', '/192.168.1.104:56066', 'null');
INSERT INTO `base_gate_log` VALUES (49, '资源管理', '资源编辑', '/admin/res/{*}', '2019-06-26 17:10:33', '1', '少校', '/192.168.1.104:58103', 'null');
INSERT INTO `base_gate_log` VALUES (50, '资源管理', '资源编辑', '/admin/res/{*}', '2019-06-26 17:12:27', '1', '少校', '/192.168.1.104:58103', 'null');
INSERT INTO `base_gate_log` VALUES (51, '资源管理', '资源编辑', '/admin/res/{*}', '2019-06-26 17:13:01', '1', '少校', '/192.168.1.104:58103', 'null');
INSERT INTO `base_gate_log` VALUES (52, '资源管理', '资源编辑', '/admin/res/{*}', '2019-06-26 17:14:35', '1', '少校', '/192.168.1.104:58103', 'null');
INSERT INTO `base_gate_log` VALUES (53, '资源管理', '资源编辑', '/admin/res/{*}', '2019-06-26 17:20:24', '1', '少校', '/192.168.1.104:58103', 'null');
INSERT INTO `base_gate_log` VALUES (54, '资源管理', '资源编辑', '/admin/res/{*}', '2019-06-26 17:22:31', '1', '少校', '/192.168.1.104:58103', 'null');
INSERT INTO `base_gate_log` VALUES (55, '资源管理', '资源编辑', '/admin/res/{*}', '2019-06-26 17:25:06', '1', '少校', '/192.168.1.104:58103', 'null');
INSERT INTO `base_gate_log` VALUES (56, '资源管理', '资源编辑', '/admin/res/{*}', '2019-06-26 17:27:21', '1', '少校', '/192.168.1.104:59071', 'null');
INSERT INTO `base_gate_log` VALUES (57, '资源管理', '资源编辑', '/admin/res/{*}', '2019-06-26 17:54:51', '1', '少校', '/192.168.1.104:59615', 'null');
INSERT INTO `base_gate_log` VALUES (58, '资源管理', '资源编辑', '/admin/res/{*}', '2019-06-26 17:56:18', '1', '少校', '/192.168.1.104:59615', 'null');
INSERT INTO `base_gate_log` VALUES (59, '资源管理', '资源编辑', '/admin/res/{*}', '2019-06-26 17:56:50', '1', '少校', '/192.168.1.104:59615', 'null');
INSERT INTO `base_gate_log` VALUES (60, '资源管理', '资源编辑', '/admin/res/{*}', '2019-06-26 18:07:31', '1', '少校', '/192.168.1.104:61387', 'null');
INSERT INTO `base_gate_log` VALUES (61, '资源管理', '资源编辑', '/admin/res/{*}', '2019-06-26 18:07:53', '1', '少校', '/192.168.1.104:61387', 'null');
INSERT INTO `base_gate_log` VALUES (62, '角色授权', '角色授权保存', '/admin/roleRes/{*}', '2019-07-03 18:00:54', '1', '少校', '/192.168.1.104:64997', 'null');
INSERT INTO `base_gate_log` VALUES (63, '角色授权', '角色授权保存', '/admin/roleRes/{*}', '2019-07-03 18:10:57', '1', '少校', '/192.168.1.104:64997', 'null');
INSERT INTO `base_gate_log` VALUES (64, '用户管理', '用户编辑', '/admin/adm/update/{*}', '2019-07-04 15:57:10', '1', '少校', '/192.168.1.104:57122', 'null');
INSERT INTO `base_gate_log` VALUES (65, '用户管理', '用户编辑', '/admin/adm/update/{*}', '2019-07-04 15:57:23', '1', '少校', '/192.168.1.104:57122', 'null');
INSERT INTO `base_gate_log` VALUES (66, '角色授权', '角色授权保存', '/admin/roleRes/{*}', '2019-07-05 09:43:39', '1', '少校', '/192.168.1.104:52432', 'null');
INSERT INTO `base_gate_log` VALUES (67, '角色授权', '角色授权保存', '/admin/roleRes/{*}', '2019-07-05 09:56:19', '1', '少校', '/192.168.1.104:53491', 'null');
INSERT INTO `base_gate_log` VALUES (68, '角色授权', '角色授权保存', '/admin/roleRes/{*}', '2019-07-05 09:58:36', '1', '少校', '/192.168.1.104:53491', 'null');
INSERT INTO `base_gate_log` VALUES (69, '角色授权', '角色授权保存', '/admin/roleRes/{*}', '2019-07-05 10:01:04', '1', '少校', '/192.168.1.104:53491', 'null');
INSERT INTO `base_gate_log` VALUES (70, '用户管理', '用户编辑', '/admin/adm/update/{*}', '2019-07-05 15:53:41', '1', '少校', '/192.168.1.104:63194', 'null');
INSERT INTO `base_gate_log` VALUES (71, '资源管理', '资源编辑', '/admin/res/{*}', '2019-07-05 16:55:12', '1', '少校', '/192.168.1.104:50868', 'null');
INSERT INTO `base_gate_log` VALUES (72, '资源管理', '资源编辑', '/admin/res/{*}', '2019-07-11 09:49:09', '1', '少校', '/192.168.1.104:53554', 'null');
INSERT INTO `base_gate_log` VALUES (73, '资源管理', '资源编辑', '/admin/res/{*}', '2019-07-11 09:50:09', '1', '少校', '/192.168.1.104:53554', 'null');
INSERT INTO `base_gate_log` VALUES (74, '资源管理', '资源编辑', '/admin/res/{*}', '2019-07-11 09:51:23', '1', '少校', '/192.168.1.104:53554', 'null');
INSERT INTO `base_gate_log` VALUES (75, '资源管理', '资源编辑', '/admin/res/{*}', '2019-07-11 09:52:49', '1', '少校', '/192.168.1.104:53554', 'null');
INSERT INTO `base_gate_log` VALUES (76, '资源管理', '资源编辑', '/admin/res/{*}', '2019-07-11 09:57:28', '1', '少校', '/192.168.1.104:53554', 'null');
INSERT INTO `base_gate_log` VALUES (77, '资源管理', '资源编辑', '/admin/res/{*}', '2019-07-11 09:58:39', '1', '少校', '/192.168.1.104:53554', 'null');
INSERT INTO `base_gate_log` VALUES (78, '资源管理', '资源编辑', '/admin/res/{*}', '2019-07-11 10:00:44', '1', '少校', '/192.168.1.104:53554', 'null');
INSERT INTO `base_gate_log` VALUES (79, '角色授权', '角色授权保存', '/admin/roleRes/{*}', '2019-07-11 10:06:01', '1', '少校', '/192.168.1.104:53554', 'null');
INSERT INTO `base_gate_log` VALUES (80, '角色授权', '角色授权保存', '/admin/roleRes/{*}', '2019-07-11 10:07:23', '1', '少校', '/192.168.1.104:54258', 'null');
INSERT INTO `base_gate_log` VALUES (81, '角色授权', '角色授权保存', '/admin/roleRes/{*}', '2019-07-11 10:11:03', '1', '少校', '/192.168.1.104:53554', 'null');
INSERT INTO `base_gate_log` VALUES (82, '角色授权', '角色授权保存', '/admin/roleRes/{*}', '2019-07-11 10:12:07', '1', '少校', '/192.168.1.104:53554', 'null');
INSERT INTO `base_gate_log` VALUES (83, '角色授权', '角色授权保存', '/admin/roleRes/{*}', '2019-07-11 10:12:25', '1', '少校', '/192.168.1.104:54258', 'null');
INSERT INTO `base_gate_log` VALUES (84, '角色授权', '角色授权保存', '/admin/roleRes/{*}', '2019-07-11 10:12:30', '1', '少校', '/192.168.1.104:54258', 'null');
INSERT INTO `base_gate_log` VALUES (85, '角色授权', '角色授权保存', '/admin/roleRes/{*}', '2019-07-11 10:12:36', '1', '少校', '/192.168.1.104:54258', 'null');
INSERT INTO `base_gate_log` VALUES (86, '资源管理', '资源编辑', '/admin/res/{*}', '2019-07-11 10:17:47', '1', '少校', '/192.168.1.104:54258', 'null');
INSERT INTO `base_gate_log` VALUES (87, '资源管理', '资源编辑', '/admin/res/{*}', '2019-07-11 10:18:11', '1', '少校', '/192.168.1.104:54258', 'null');
INSERT INTO `base_gate_log` VALUES (88, '资源管理', '资源编辑', '/admin/res/{*}', '2019-07-11 10:18:47', '1', '少校', '/192.168.1.104:54258', 'null');
INSERT INTO `base_gate_log` VALUES (89, '资源管理', '资源编辑', '/admin/res/{*}', '2019-07-11 10:18:52', '1', '少校', '/192.168.1.104:54258', 'null');
INSERT INTO `base_gate_log` VALUES (90, '资源管理', '资源编辑', '/admin/res/{*}', '2019-07-11 10:19:03', '1', '少校', '/192.168.1.104:54258', 'null');
INSERT INTO `base_gate_log` VALUES (91, '资源管理', '资源编辑', '/admin/res/{*}', '2019-07-11 10:19:12', '1', '少校', '/192.168.1.104:54258', 'null');
INSERT INTO `base_gate_log` VALUES (92, '角色授权', '角色授权保存', '/admin/roleRes/{*}', '2019-07-11 10:19:26', '1', '少校', '/192.168.1.104:54258', 'null');
INSERT INTO `base_gate_log` VALUES (93, '角色授权', '角色授权保存', '/admin/roleRes/{*}', '2019-07-11 10:19:38', '1', '少校', '/192.168.1.104:55191', 'null');
INSERT INTO `base_gate_log` VALUES (94, '资源管理', '资源编辑', '/admin/res/{*}', '2019-07-11 10:22:35', '1', '少校', '/192.168.1.104:54258', 'null');
INSERT INTO `base_gate_log` VALUES (95, '资源管理', '资源编辑', '/admin/res/{*}', '2019-07-11 10:23:00', '1', '少校', '/192.168.1.104:54258', 'null');
INSERT INTO `base_gate_log` VALUES (96, '资源管理', '资源编辑', '/admin/res/{*}', '2019-07-11 10:23:13', '1', '少校', '/192.168.1.104:54258', 'null');
INSERT INTO `base_gate_log` VALUES (97, '资源管理', '资源编辑', '/admin/res/{*}', '2019-07-11 10:23:28', '1', '少校', '/192.168.1.104:54258', 'null');
INSERT INTO `base_gate_log` VALUES (98, '资源管理', '资源编辑', '/admin/res/{*}', '2019-07-11 10:25:02', '1', '少校', '/192.168.1.104:55502', 'null');
INSERT INTO `base_gate_log` VALUES (99, '资源管理', '资源编辑', '/admin/res/{*}', '2019-07-11 10:25:22', '1', '少校', '/192.168.1.104:55502', 'null');
INSERT INTO `base_gate_log` VALUES (100, '资源管理', '资源编辑', '/admin/res/{*}', '2019-07-11 10:25:25', '1', '少校', '/192.168.1.104:55502', 'null');
INSERT INTO `base_gate_log` VALUES (101, '资源管理', '资源编辑', '/admin/res/{*}', '2019-07-11 10:25:32', '1', '少校', '/192.168.1.104:55502', 'null');
INSERT INTO `base_gate_log` VALUES (102, '资源管理', '资源编辑', '/admin/res/{*}', '2019-07-11 10:26:20', '1', '少校', '/192.168.1.104:55502', 'null');
INSERT INTO `base_gate_log` VALUES (103, '资源管理', '资源编辑', '/admin/res/{*}', '2019-07-11 10:26:27', '1', '少校', '/192.168.1.104:55502', 'null');
INSERT INTO `base_gate_log` VALUES (104, '资源管理', '资源编辑', '/admin/res/{*}', '2019-07-11 10:26:35', '1', '少校', '/192.168.1.104:55502', 'null');
INSERT INTO `base_gate_log` VALUES (105, '资源管理', '资源编辑', '/admin/res/{*}', '2019-07-11 10:26:40', '1', '少校', '/192.168.1.104:55502', 'null');
INSERT INTO `base_gate_log` VALUES (106, '资源管理', '资源编辑', '/admin/res/{*}', '2019-07-11 10:26:49', '1', '少校', '/192.168.1.104:55502', 'null');
INSERT INTO `base_gate_log` VALUES (107, '资源管理', '资源编辑', '/admin/res/{*}', '2019-07-11 10:26:54', '1', '少校', '/192.168.1.104:55502', 'null');
INSERT INTO `base_gate_log` VALUES (108, '资源管理', '资源编辑', '/admin/res/{*}', '2019-07-11 10:26:58', '1', '少校', '/192.168.1.104:55502', 'null');
INSERT INTO `base_gate_log` VALUES (109, '资源管理', '资源编辑', '/admin/res/{*}', '2019-07-11 10:27:02', '1', '少校', '/192.168.1.104:55502', 'null');
INSERT INTO `base_gate_log` VALUES (110, '资源管理', '资源编辑', '/admin/res/{*}', '2019-07-11 10:27:08', '1', '少校', '/192.168.1.104:55502', 'null');
INSERT INTO `base_gate_log` VALUES (111, '资源管理', '资源编辑', '/admin/res/{*}', '2019-07-11 10:27:48', '1', '少校', '/192.168.1.104:55502', 'null');
INSERT INTO `base_gate_log` VALUES (112, '资源管理', '资源编辑', '/admin/res/{*}', '2019-07-11 10:27:51', '1', '少校', '/192.168.1.104:55502', 'null');
INSERT INTO `base_gate_log` VALUES (113, '资源管理', '资源编辑', '/admin/res/{*}', '2019-07-11 10:28:36', '1', '少校', '/192.168.1.104:55502', 'null');
INSERT INTO `base_gate_log` VALUES (114, '资源管理', '资源编辑', '/admin/res/{*}', '2019-07-11 10:28:42', '1', '少校', '/192.168.1.104:55502', 'null');
INSERT INTO `base_gate_log` VALUES (115, '资源管理', '资源编辑', '/admin/res/{*}', '2019-07-11 10:28:52', '1', '少校', '/192.168.1.104:55502', 'null');
INSERT INTO `base_gate_log` VALUES (116, '资源管理', '资源编辑', '/admin/res/{*}', '2019-07-11 10:28:59', '1', '少校', '/192.168.1.104:55502', 'null');
INSERT INTO `base_gate_log` VALUES (117, '资源管理', '资源编辑', '/admin/res/{*}', '2019-07-11 10:29:25', '1', '少校', '/192.168.1.104:55502', 'null');
INSERT INTO `base_gate_log` VALUES (118, '资源管理', '资源编辑', '/admin/res/{*}', '2019-07-11 10:46:36', '1', '少校', '/192.168.1.104:56514', 'null');
INSERT INTO `base_gate_log` VALUES (119, '资源管理', '资源编辑', '/admin/res/{*}', '2019-07-11 10:46:47', '1', '少校', '/192.168.1.104:56514', 'null');
INSERT INTO `base_gate_log` VALUES (120, '资源管理', '资源编辑', '/admin/res/{*}', '2019-07-11 10:46:56', '1', '少校', '/192.168.1.104:56514', 'null');
INSERT INTO `base_gate_log` VALUES (121, '资源管理', '资源编辑', '/admin/res/{*}', '2019-07-11 10:46:58', '1', '少校', '/192.168.1.104:56514', 'null');
INSERT INTO `base_gate_log` VALUES (122, '资源管理', '资源编辑', '/admin/res/{*}', '2019-07-11 10:47:07', '1', '少校', '/192.168.1.104:56401', 'null');
INSERT INTO `base_gate_log` VALUES (123, '资源管理', '资源编辑', '/admin/res/{*}', '2019-07-11 11:17:16', '1', '少校', '/192.168.1.104:57157', 'null');
INSERT INTO `base_gate_log` VALUES (124, '资源管理', '资源编辑', '/admin/res/{*}', '2019-07-11 11:43:34', '1', '少校', '/192.168.1.104:59433', 'null');
INSERT INTO `base_gate_log` VALUES (125, '资源管理', '资源编辑', '/admin/res/{*}', '2019-07-11 11:43:45', '1', '少校', '/192.168.1.104:59433', 'null');
INSERT INTO `base_gate_log` VALUES (126, '资源管理', '资源编辑', '/admin/res/{*}', '2019-07-11 11:44:05', '1', '少校', '/192.168.1.104:60168', 'null');
INSERT INTO `base_gate_log` VALUES (127, '资源管理', '资源编辑', '/admin/res/{*}', '2019-07-11 11:52:35', '1', '少校', '/192.168.1.104:60694', 'null');
INSERT INTO `base_gate_log` VALUES (128, '资源管理', '资源编辑', '/admin/res/{*}', '2019-07-11 11:52:38', '1', '少校', '/192.168.1.104:60694', 'null');
INSERT INTO `base_gate_log` VALUES (129, '资源管理', '资源编辑', '/admin/res/{*}', '2019-07-11 12:09:28', '1', '少校', '/192.168.1.104:61609', 'null');
INSERT INTO `base_gate_log` VALUES (130, '资源管理', '资源编辑', '/admin/res/{*}', '2019-07-11 12:09:34', '1', '少校', '/192.168.1.104:61609', 'null');
INSERT INTO `base_gate_log` VALUES (131, '资源管理', '资源编辑', '/admin/res/{*}', '2019-07-11 12:09:42', '1', '少校', '/192.168.1.104:61609', 'null');
INSERT INTO `base_gate_log` VALUES (132, '资源管理', '资源编辑', '/admin/res/{*}', '2019-07-11 12:09:45', '1', '少校', '/192.168.1.104:61609', 'null');
INSERT INTO `base_gate_log` VALUES (133, '资源管理', '资源编辑', '/admin/res/{*}', '2019-07-11 12:09:47', '1', '少校', '/192.168.1.104:61609', 'null');
INSERT INTO `base_gate_log` VALUES (134, '资源管理', '资源编辑', '/admin/res/{*}', '2019-07-11 12:14:44', '1', '少校', '/192.168.1.104:61874', 'null');
INSERT INTO `base_gate_log` VALUES (135, '资源管理', '资源编辑', '/admin/res/{*}', '2019-07-11 12:14:48', '1', '少校', '/192.168.1.104:61874', 'null');
INSERT INTO `base_gate_log` VALUES (136, '资源管理', '资源编辑', '/admin/res/{*}', '2019-07-11 12:14:50', '1', '少校', '/192.168.1.104:61874', 'null');
INSERT INTO `base_gate_log` VALUES (137, '资源管理', '资源编辑', '/admin/res/{*}', '2019-07-11 12:15:00', '1', '少校', '/192.168.1.104:61609', 'null');
INSERT INTO `base_gate_log` VALUES (138, '资源管理', '资源编辑', '/admin/res/{*}', '2019-07-11 12:15:02', '1', '少校', '/192.168.1.104:61609', 'null');
INSERT INTO `base_gate_log` VALUES (139, '资源管理', '资源编辑', '/admin/res/{*}', '2019-07-11 12:15:04', '1', '少校', '/192.168.1.104:61609', 'null');
INSERT INTO `base_gate_log` VALUES (140, '用户管理', '用户编辑', '/admin/adm/update/{*}', '2019-07-11 12:15:09', '1', '少校', '/192.168.1.104:61874', 'null');
INSERT INTO `base_gate_log` VALUES (141, '资源管理', '资源编辑', '/admin/res/{*}', '2019-07-11 12:15:15', '1', '少校', '/192.168.1.104:61874', 'null');
INSERT INTO `base_gate_log` VALUES (142, '资源管理', '资源编辑', '/admin/res/{*}', '2019-07-11 12:15:17', '1', '少校', '/192.168.1.104:61874', 'null');
INSERT INTO `base_gate_log` VALUES (143, '资源管理', '资源编辑', '/admin/res/{*}', '2019-07-11 12:15:22', '1', '少校', '/192.168.1.104:61874', 'null');
INSERT INTO `base_gate_log` VALUES (144, '资源管理', '资源编辑', '/admin/res/{*}', '2019-07-11 12:15:25', '1', '少校', '/192.168.1.104:61874', 'null');
INSERT INTO `base_gate_log` VALUES (145, '资源管理', '资源编辑', '/admin/res/{*}', '2019-07-11 12:23:23', '1', '少校', '/192.168.1.104:62343', 'null');
INSERT INTO `base_gate_log` VALUES (146, '资源管理', '资源编辑', '/admin/res/{*}', '2019-07-11 12:23:27', '1', '少校', '/192.168.1.104:62343', 'null');
INSERT INTO `base_gate_log` VALUES (147, '资源管理', '资源编辑', '/admin/res/{*}', '2019-07-11 12:23:29', '1', '少校', '/192.168.1.104:62343', 'null');
INSERT INTO `base_gate_log` VALUES (148, '资源管理', '资源编辑', '/admin/res/{*}', '2019-07-11 12:23:31', '1', '少校', '/192.168.1.104:62343', 'null');
INSERT INTO `base_gate_log` VALUES (149, '资源管理', '资源编辑', '/admin/res/{*}', '2019-07-11 12:23:35', '1', '少校', '/192.168.1.104:62343', 'null');
INSERT INTO `base_gate_log` VALUES (150, '资源管理', '资源编辑', '/admin/res/{*}', '2019-07-11 12:23:37', '1', '少校', '/192.168.1.104:62343', 'null');
INSERT INTO `base_gate_log` VALUES (151, '资源管理', '资源编辑', '/admin/res/{*}', '2019-07-11 12:23:39', '1', '少校', '/192.168.1.104:62343', 'null');
INSERT INTO `base_gate_log` VALUES (152, '资源管理', '资源编辑', '/admin/res/{*}', '2019-07-11 12:23:48', '1', '少校', '/192.168.1.104:62343', 'null');
INSERT INTO `base_gate_log` VALUES (153, '资源管理', '资源编辑', '/admin/res/{*}', '2019-07-11 12:23:49', '1', '少校', '/192.168.1.104:62343', 'null');
INSERT INTO `base_gate_log` VALUES (154, '资源管理', '资源编辑', '/admin/res/{*}', '2019-07-11 12:23:52', '1', '少校', '/192.168.1.104:62343', 'null');
INSERT INTO `base_gate_log` VALUES (155, '资源管理', '资源编辑', '/admin/res/{*}', '2019-07-11 12:23:54', '1', '少校', '/192.168.1.104:62343', 'null');
INSERT INTO `base_gate_log` VALUES (156, '资源管理', '资源编辑', '/admin/res/{*}', '2019-07-11 12:24:00', '1', '少校', '/192.168.1.104:62343', 'null');
INSERT INTO `base_gate_log` VALUES (157, '资源管理', '资源编辑', '/admin/res/{*}', '2019-07-11 12:24:02', '1', '少校', '/192.168.1.104:62343', 'null');
INSERT INTO `base_gate_log` VALUES (158, '资源管理', '资源编辑', '/admin/res/{*}', '2019-07-11 12:24:04', '1', '少校', '/192.168.1.104:62343', 'null');
INSERT INTO `base_gate_log` VALUES (159, '资源管理', '资源编辑', '/admin/res/{*}', '2019-07-11 12:24:07', '1', '少校', '/192.168.1.104:62343', 'null');
INSERT INTO `base_gate_log` VALUES (160, '资源管理', '资源编辑', '/admin/res/{*}', '2019-07-11 12:24:13', '1', '少校', '/192.168.1.104:62343', 'null');
INSERT INTO `base_gate_log` VALUES (161, '资源管理', '资源编辑', '/admin/res/{*}', '2019-07-11 12:24:16', '1', '少校', '/192.168.1.104:62343', 'null');
INSERT INTO `base_gate_log` VALUES (162, '资源管理', '资源编辑', '/admin/res/{*}', '2019-07-11 12:24:18', '1', '少校', '/192.168.1.104:62343', 'null');
INSERT INTO `base_gate_log` VALUES (163, '资源管理', '资源编辑', '/admin/res/{*}', '2019-07-11 12:24:27', '1', '少校', '/192.168.1.104:62407', 'null');
INSERT INTO `base_gate_log` VALUES (164, '资源管理', '资源编辑', '/admin/res/{*}', '2019-07-11 12:24:30', '1', '少校', '/192.168.1.104:62407', 'null');
INSERT INTO `base_gate_log` VALUES (165, '资源管理', '资源编辑', '/admin/res/{*}', '2019-07-11 12:24:32', '1', '少校', '/192.168.1.104:62407', 'null');
INSERT INTO `base_gate_log` VALUES (166, '资源管理', '资源编辑', '/admin/res/{*}', '2019-07-11 12:24:38', '1', '少校', '/192.168.1.104:62407', 'null');
INSERT INTO `base_gate_log` VALUES (167, '资源管理', '资源编辑', '/admin/res/{*}', '2019-07-11 12:24:39', '1', '少校', '/192.168.1.104:62407', 'null');
INSERT INTO `base_gate_log` VALUES (168, '资源管理', '资源编辑', '/admin/res/{*}', '2019-07-11 12:24:43', '1', '少校', '/192.168.1.104:62407', 'null');
INSERT INTO `base_gate_log` VALUES (169, '角色管理', '角色编辑', '/admin/role/{*}', '2019-07-20 15:37:16', '1', '少校', '/192.168.1.104:61845', 'null');
INSERT INTO `base_gate_log` VALUES (170, '角色管理', '角色编辑', '/admin/role/{*}', '2019-07-20 15:37:27', '1', '少校', '/192.168.1.104:61845', 'null');
INSERT INTO `base_gate_log` VALUES (171, '角色管理', '角色编辑', '/admin/role/{*}', '2019-07-20 15:38:09', '1', '少校', '/192.168.1.104:61845', 'null');
INSERT INTO `base_gate_log` VALUES (172, '角色管理', '角色编辑', '/admin/role/{*}', '2019-07-20 15:39:50', '1', '少校', '/192.168.1.104:61845', 'null');
INSERT INTO `base_gate_log` VALUES (173, '角色管理', '角色编辑', '/admin/role/{*}', '2019-07-20 15:40:09', '1', '少校', '/192.168.1.104:61845', 'null');
INSERT INTO `base_gate_log` VALUES (174, '用户管理', '用户编辑', '/admin/adm/update/{*}', '2019-07-20 15:51:33', '1', '少校', '/192.168.1.104:62835', 'null');
INSERT INTO `base_gate_log` VALUES (175, '用户管理', '用户编辑', '/admin/adm/update/{*}', '2019-07-20 15:53:04', '1', '少校', '/192.168.1.104:61845', 'null');
INSERT INTO `base_gate_log` VALUES (176, '数据字典', '字典编辑', '/admin/dict/{*}', '2019-07-20 16:01:59', '1', '少校', '/192.168.1.104:63362', 'null');
INSERT INTO `base_gate_log` VALUES (177, '数据字典', '字典编辑', '/admin/dict/{*}', '2019-07-20 16:02:06', '1', '少校', '/192.168.1.104:63362', 'null');
INSERT INTO `base_gate_log` VALUES (178, '数据字典', '字典编辑', '/admin/dict/{*}', '2019-07-20 16:02:08', '1', '少校', '/192.168.1.104:63362', 'null');
INSERT INTO `base_gate_log` VALUES (179, '客户列表', '客户编辑', '/admin/customer/update/{*}', '2019-07-20 16:05:12', '1', '少校', '/192.168.1.104:63362', 'null');
INSERT INTO `base_gate_log` VALUES (180, '客户列表', '客户编辑', '/admin/customer/update/{*}', '2019-07-20 16:05:16', '1', '少校', '/192.168.1.104:63362', 'null');
INSERT INTO `base_gate_log` VALUES (181, '客户列表', '客户编辑', '/admin/customer/update/{*}', '2019-07-20 16:05:20', '1', '少校', '/192.168.1.104:63362', 'null');
INSERT INTO `base_gate_log` VALUES (182, '客户列表', '客户编辑', '/admin/customer/update/{*}', '2019-07-20 16:05:27', '1', '少校', '/192.168.1.104:63362', 'null');
INSERT INTO `base_gate_log` VALUES (183, '客户列表', '客户编辑', '/admin/customer/update/{*}', '2019-07-20 16:07:01', '1', '少校', '/192.168.1.104:63362', 'null');
INSERT INTO `base_gate_log` VALUES (184, '客户列表', '客户编辑', '/admin/customer/update/{*}', '2019-07-20 16:41:01', '1', '少校', '/192.168.1.104:49224', 'null');
INSERT INTO `base_gate_log` VALUES (185, '客户列表', '客户编辑', '/admin/customer/update/{*}', '2019-07-20 16:44:42', '1', '少校', '/192.168.1.104:49224', 'null');
INSERT INTO `base_gate_log` VALUES (186, '客户列表', '客户编辑', '/admin/customer/update/{*}', '2019-07-20 16:44:57', '1', '少校', '/192.168.1.104:49224', 'null');
INSERT INTO `base_gate_log` VALUES (187, '客户列表', '客户编辑', '/admin/customer/update/{*}', '2019-07-20 16:45:02', '1', '少校', '/192.168.1.104:49224', 'null');
INSERT INTO `base_gate_log` VALUES (188, '客户列表', '客户编辑', '/admin/customer/update/{*}', '2019-07-20 16:45:13', '1', '少校', '/192.168.1.104:49224', 'null');
INSERT INTO `base_gate_log` VALUES (189, '客户列表', '客户编辑', '/admin/customer/update/{*}', '2019-07-20 16:51:40', '1', '少校', '/192.168.1.104:49224', 'null');
INSERT INTO `base_gate_log` VALUES (190, '客户列表', '客户编辑', '/admin/customer/update/{*}', '2019-07-20 16:51:53', '1', '少校', '/192.168.1.104:49224', 'null');
INSERT INTO `base_gate_log` VALUES (191, '客户列表', '客户编辑', '/admin/customer/update/{*}', '2019-07-20 16:51:59', '1', '少校', '/192.168.1.104:49224', 'null');
INSERT INTO `base_gate_log` VALUES (192, '资源管理', '资源新增', '/admin/res', '2019-09-22 19:58:30', '1', '少校', '/192.168.2.161:61865', 'null');
INSERT INTO `base_gate_log` VALUES (193, '资源管理', '资源编辑', '/admin/res/{*}', '2019-09-22 19:59:09', '1', '少校', '/192.168.2.161:61865', 'null');
INSERT INTO `base_gate_log` VALUES (194, '资源管理', '资源新增', '/admin/res', '2019-09-22 20:02:34', '1', '少校', '/192.168.2.161:61865', 'null');
INSERT INTO `base_gate_log` VALUES (195, '资源管理', '资源新增', '/admin/res', '2019-09-22 20:03:59', '1', '少校', '/192.168.2.161:61865', 'null');
INSERT INTO `base_gate_log` VALUES (196, '资源管理', '资源新增', '/admin/res', '2019-09-22 20:05:22', '1', '少校', '/192.168.2.161:61865', 'null');
INSERT INTO `base_gate_log` VALUES (197, '角色授权', '角色授权保存', '/admin/roleRes/{*}', '2019-09-22 20:22:12', '1', '少校', '/192.168.2.161:65002', 'null');
INSERT INTO `base_gate_log` VALUES (198, '合同管理', '合同新增', '/admin/contract', '2019-09-23 21:14:58', '1', '少校', '/192.168.2.161:62669', 'null');
INSERT INTO `base_gate_log` VALUES (199, '合同管理', '合同编辑', '/admin/contract/{*}', '2019-09-23 21:44:02', '1', '少校', '/192.168.2.161:51511', 'null');
INSERT INTO `base_gate_log` VALUES (200, '合同管理', '合同编辑', '/admin/contract/{*}', '2019-09-23 21:47:21', '1', '少校', '/192.168.2.161:51511', 'null');
INSERT INTO `base_gate_log` VALUES (201, '数据字典', '字典新增', '/admin/dict', '2019-10-01 23:58:46', '1', '少校', '/192.168.1.100:65284', 'null');
INSERT INTO `base_gate_log` VALUES (202, '数据字典', '字典编辑', '/admin/dict/{*}', '2019-10-01 23:59:17', '1', '少校', '/192.168.1.100:65284', 'null');
INSERT INTO `base_gate_log` VALUES (203, '角色授权', '角色授权保存', '/admin/roleRes/{*}', '2019-10-03 21:31:49', '1', '少校', '/59.41.23.35:52430', 'null');
INSERT INTO `base_gate_log` VALUES (204, '角色授权', '角色授权保存', '/admin/roleRes/{*}', '2019-10-03 21:36:34', '1', '少校', '/59.41.23.35:52430', 'null');
INSERT INTO `base_gate_log` VALUES (205, '角色授权', '角色授权保存', '/admin/roleRes/{*}', '2019-10-03 21:40:40', '1', '少校', '/112.6.62.76:60493', 'null');
INSERT INTO `base_gate_log` VALUES (206, '角色授权', '角色授权保存', '/admin/roleRes/{*}', '2019-10-03 21:41:23', '1', '少校', '/59.41.23.35:51820', 'null');
INSERT INTO `base_gate_log` VALUES (207, '合同管理', '合同编辑', '/admin/contract/{*}', '2019-10-03 21:49:14', '1', '少校', '/59.41.23.35:51816', 'null');
INSERT INTO `base_gate_log` VALUES (208, '资源管理', '资源编辑', '/admin/res/{*}', '2019-10-04 02:01:41', '1', '少校', '/112.6.62.76:59726', 'null');
INSERT INTO `base_gate_log` VALUES (209, '资源管理', '资源编辑', '/admin/res/{*}', '2019-10-04 04:47:26', '1', '少校', '/112.6.62.76:53453', 'null');
INSERT INTO `base_gate_log` VALUES (210, '资源管理', '资源编辑', '/admin/res/{*}', '2019-10-04 06:16:29', '1', '少校', '/112.6.62.76:61330', 'null');
INSERT INTO `base_gate_log` VALUES (211, '资源管理', '资源编辑', '/admin/res/{*}', '2019-10-04 06:20:41', '1', '少校', '/112.6.62.76:61330', 'null');
INSERT INTO `base_gate_log` VALUES (212, '角色授权', '角色授权保存', '/admin/roleRes/{*}', '2019-10-04 23:26:32', '1', '少校', '/59.41.23.35:52587', 'null');
INSERT INTO `base_gate_log` VALUES (213, '角色授权', '角色授权保存', '/admin/roleRes/{*}', '2019-10-04 23:26:54', '1', '少校', '/59.41.23.35:52587', 'null');
INSERT INTO `base_gate_log` VALUES (214, '评价列表', '评价编辑', '/admin/appraise/{*}', '2019-10-05 05:19:34', '1', '少校', '/59.41.20.140:8059', 'null');
INSERT INTO `base_gate_log` VALUES (215, '评价列表', '评价编辑', '/admin/appraise/{*}', '2019-10-05 05:19:40', '1', '少校', '/59.41.20.140:8059', 'null');
INSERT INTO `base_gate_log` VALUES (216, '评价列表', '评价编辑', '/admin/appraise/{*}', '2019-10-05 05:19:46', '1', '少校', '/59.41.20.140:8059', 'null');
INSERT INTO `base_gate_log` VALUES (217, '评价列表', '评价编辑', '/admin/appraise/{*}', '2019-10-05 05:19:53', '1', '少校', '/59.41.20.140:8059', 'null');
INSERT INTO `base_gate_log` VALUES (218, '评价列表', '评价删除', '/admin/appraise/{*}', '2019-10-05 05:32:33', '1', '少校', '/59.41.20.140:8555', 'null');
INSERT INTO `base_gate_log` VALUES (219, '评价列表', '评价删除', '/admin/appraise/{*}', '2019-10-05 05:32:37', '1', '少校', '/59.41.20.140:8555', 'null');
INSERT INTO `base_gate_log` VALUES (220, '评价列表', '评价删除', '/admin/appraise/{*}', '2019-10-05 05:44:04', '1', '少校', '/59.41.20.140:8191', 'null');
INSERT INTO `base_gate_log` VALUES (221, '评价列表', '评价删除', '/admin/appraise/{*}', '2019-10-05 05:44:52', '1', '少校', '/59.41.20.140:8191', 'null');
INSERT INTO `base_gate_log` VALUES (222, '评价列表', '评价删除', '/admin/appraise/{*}', '2019-10-05 05:52:19', '1', '少校', '/59.41.20.140:8191', 'null');
INSERT INTO `base_gate_log` VALUES (223, '征集方案列表', '方案新增', '/admin/collect', '2019-10-07 00:51:27', '1', '少校', '/59.41.20.140:7372', 'null');
INSERT INTO `base_gate_log` VALUES (224, '征集方案列表', '方案新增', '/admin/collect', '2019-10-07 00:52:39', '1', '少校', '/59.41.20.140:7373', 'null');
INSERT INTO `base_gate_log` VALUES (225, '征集方案列表', '方案新增', '/admin/collect', '2019-10-07 00:52:42', '1', '少校', '/59.41.20.140:7373', 'null');
INSERT INTO `base_gate_log` VALUES (226, '预定列表', '列表删除', '/admin/reserve/{*}', '2019-10-07 01:56:45', '1', '少校', '/59.41.20.140:6754', 'null');
INSERT INTO `base_gate_log` VALUES (227, '营销列表', '营销删除', '/admin/marketing/{*}', '2019-10-07 04:24:45', '1', '少校', '/59.41.23.109:18743', 'null');
INSERT INTO `base_gate_log` VALUES (228, '营销列表', '营销删除', '/admin/marketing/{*}', '2019-10-07 05:04:05', '1', '少校', '/59.41.23.109:20202', 'null');
INSERT INTO `base_gate_log` VALUES (229, '营销列表', '营销删除', '/admin/marketing/{*}', '2019-10-07 05:04:06', '1', '少校', '/59.41.23.109:20202', 'null');
INSERT INTO `base_gate_log` VALUES (230, '营销列表', '营销删除', '/admin/marketing/{*}', '2019-10-07 05:04:08', '1', '少校', '/59.41.23.109:20202', 'null');
INSERT INTO `base_gate_log` VALUES (231, '征集方案列表', '方案删除', '/admin/collect/{*}', '2019-10-07 08:03:13', '1', '少校', '/59.41.23.109:20692', 'null');
INSERT INTO `base_gate_log` VALUES (232, '合同管理', '合同新增', '/admin/contract', '2019-10-07 08:20:32', '1', '少校', '/59.41.23.109:17670', 'null');
INSERT INTO `base_gate_log` VALUES (233, '客户列表', '客户编辑', '/admin/customer/update/{*}', '2019-10-07 19:27:41', '1', '少校', '/112.6.62.76:51159', 'null');
INSERT INTO `base_gate_log` VALUES (234, '客户列表', '客户编辑', '/admin/customer/update/{*}', '2019-10-07 19:27:50', '1', '少校', '/112.6.62.76:51159', 'null');
INSERT INTO `base_gate_log` VALUES (235, '组织机构', '机构新增', '/admin/org', '2019-10-07 19:47:52', '1', '少校', '/112.6.62.76:51821', 'null');
INSERT INTO `base_gate_log` VALUES (236, '组织机构', '机构编辑', '/admin/org/{*}', '2019-10-07 19:48:06', '1', '少校', '/112.6.62.76:51821', 'null');
INSERT INTO `base_gate_log` VALUES (237, '合同管理', '合同编辑', '/admin/contract/{*}', '2019-10-09 08:37:05', '1', '少校', '/113.111.112.209:13801', 'null');
INSERT INTO `base_gate_log` VALUES (238, '合同管理', '合同编辑', '/admin/contract/{*}', '2019-10-09 08:37:12', '1', '少校', '/113.111.112.209:13801', 'null');
INSERT INTO `base_gate_log` VALUES (239, '合同管理', '合同新增', '/admin/contract', '2019-10-09 08:44:28', '1', '少校', '/113.111.112.209:13801', 'null');
INSERT INTO `base_gate_log` VALUES (240, '合同管理', '合同新增', '/admin/contract', '2019-10-09 08:53:29', '1', '少校', '/113.111.112.209:13796', 'null');
INSERT INTO `base_gate_log` VALUES (241, '合同管理', '合同新增', '/admin/contract', '2019-10-09 09:03:21', '1', '少校', '/113.111.112.209:13797', 'null');
INSERT INTO `base_gate_log` VALUES (242, '标的列表', '标的新增', '/admin/loan-sign', '2019-10-09 09:39:28', '1', '少校', '/112.6.62.76:50833', 'null');
INSERT INTO `base_gate_log` VALUES (243, '合同管理', '合同新增', '/admin/contract', '2019-10-09 09:45:21', '1', '少校', '/113.111.112.209:13927', 'null');
INSERT INTO `base_gate_log` VALUES (244, '合同管理', '合同新增', '/admin/contract', '2019-10-09 09:46:57', '1', '少校', '/113.111.112.209:13927', 'null');
INSERT INTO `base_gate_log` VALUES (245, '标的列表', '标的新增', '/admin/loan-sign', '2019-10-09 09:52:01', '1', '少校', '/113.111.112.209:13923', 'null');
INSERT INTO `base_gate_log` VALUES (246, '标的列表', '标的新增', '/admin/loan-sign', '2019-10-09 09:57:10', '1', '少校', '/113.111.112.209:13926', 'null');
INSERT INTO `base_gate_log` VALUES (247, '标的列表', '标的新增', '/admin/loan-sign', '2019-10-09 09:57:29', '1', '少校', '/113.111.112.209:13926', 'null');
INSERT INTO `base_gate_log` VALUES (248, '标的列表', '标的新增', '/admin/loan-sign', '2019-10-09 09:57:37', '1', '少校', '/113.111.112.209:13926', 'null');
INSERT INTO `base_gate_log` VALUES (249, '投标记录', '记录新增', '/admin/loan-record/add', '2019-10-09 12:17:07', '1', '少校', '/113.111.112.209:15376', 'null');
INSERT INTO `base_gate_log` VALUES (250, '投标记录', '记录新增', '/admin/loan-record/add', '2019-10-09 12:26:32', '1', '少校', '/113.111.112.209:15376', 'null');
INSERT INTO `base_gate_log` VALUES (251, '投标记录', '记录新增', '/admin/loan-record/add', '2019-10-09 12:28:02', '1', '少校', '/113.111.112.209:15767', 'null');
INSERT INTO `base_gate_log` VALUES (252, '投标记录', '记录新增', '/admin/loan-record/add', '2019-10-10 12:34:40', '1', '少校', '/113.111.182.0:29289', 'null');
INSERT INTO `base_gate_log` VALUES (253, '投标记录', '记录新增', '/admin/loan-record/add', '2019-10-10 12:35:44', '1', '少校', '/113.111.182.0:29290', 'null');
INSERT INTO `base_gate_log` VALUES (254, '投标记录', '记录新增', '/admin/loan-record/add', '2019-10-10 12:35:45', '1', '少校', '/113.111.182.0:29290', 'null');
INSERT INTO `base_gate_log` VALUES (255, '投标记录', '记录新增', '/admin/loan-record/add', '2019-10-10 12:57:03', '1', '少校', '/113.111.182.0:28321', 'null');
INSERT INTO `base_gate_log` VALUES (256, '标的列表', '标的新增', '/admin/loan-sign', '2019-10-10 13:15:48', '1', '少校', '/113.111.182.0:26509', 'null');
INSERT INTO `base_gate_log` VALUES (257, '资源管理', '资源编辑', '/admin/res/{*}', '2019-10-20 01:25:07', '1', '少校', '/112.6.62.76:50391', 'null');
INSERT INTO `base_gate_log` VALUES (258, '资源管理', '资源编辑', '/admin/res/{*}', '2019-10-20 01:25:13', '1', '少校', '/112.6.62.76:50391', 'null');
INSERT INTO `base_gate_log` VALUES (259, '资源管理', '资源编辑', '/admin/res/{*}', '2019-10-20 01:25:18', '1', '少校', '/112.6.62.76:50391', 'null');
INSERT INTO `base_gate_log` VALUES (260, '资源管理', '资源编辑', '/admin/res/{*}', '2019-10-20 01:25:22', '1', '少校', '/112.6.62.76:50391', 'null');
INSERT INTO `base_gate_log` VALUES (261, '预定列表', '列表编辑', '/admin/reserve/{*}', '2019-10-25 02:21:11', '1', '少校', '/39.88.37.181:9155', 'null');
INSERT INTO `base_gate_log` VALUES (262, '预定列表', '列表删除', '/admin/reserve/{*}', '2019-10-25 02:21:48', '1', '少校', '/39.88.37.181:9155', 'null');
INSERT INTO `base_gate_log` VALUES (263, '资源管理', '资源编辑', '/admin/res/{*}', '2019-10-27 10:57:48', '1', '少校', '/112.225.71.244:57820', 'null');
INSERT INTO `base_gate_log` VALUES (264, '资源管理', '资源编辑', '/admin/res/{*}', '2019-10-27 10:58:03', '1', '少校', '/112.225.71.244:57820', 'null');
INSERT INTO `base_gate_log` VALUES (265, '资源管理', '资源编辑', '/admin/res/{*}', '2019-10-27 10:58:13', '1', '少校', '/112.225.71.244:57820', 'null');
INSERT INTO `base_gate_log` VALUES (266, '用户管理', '用户编辑', '/admin/adm/update/{*}', '2019-10-28 02:36:13', '1', '少校', '/112.6.62.76:23565', 'null');
INSERT INTO `base_gate_log` VALUES (267, '用户管理', '用户编辑', '/admin/adm/update/{*}', '2019-10-28 02:36:18', '1', '少校', '/112.6.62.76:53168', 'null');
INSERT INTO `base_gate_log` VALUES (268, '预定列表', '列表编辑', '/admin/reserve/{*}', '2019-10-28 10:07:19', '1', '少校', '/39.88.37.181:6734', 'null');
INSERT INTO `base_gate_log` VALUES (269, '资源管理', '资源新增', '/admin/res', '2019-11-08 08:31:58', '1', '少校', '/111.199.174.42:62721', 'null');
INSERT INTO `base_gate_log` VALUES (270, '资源管理', '资源删除', '/admin/res/del/{*}', '2019-11-08 08:32:36', '1', '少校', '/111.199.174.42:62766', 'null');
INSERT INTO `base_gate_log` VALUES (271, '资源管理', '资源新增', '/admin/res', '2019-11-08 08:33:16', '1', '少校', '/111.199.174.42:62810', 'null');
INSERT INTO `base_gate_log` VALUES (272, '资源管理', '资源新增', '/admin/res', '2019-11-08 08:33:18', '1', '少校', '/111.199.174.42:62814', 'null');
INSERT INTO `base_gate_log` VALUES (273, '资源管理', '资源新增', '/admin/res', '2019-11-08 08:33:47', '1', '少校', '/111.199.174.42:62850', 'null');
INSERT INTO `base_gate_log` VALUES (274, '资源管理', '资源新增', '/admin/res', '2019-11-08 08:34:26', '1', '少校', '/111.199.174.42:62895', 'null');
INSERT INTO `base_gate_log` VALUES (275, '资源管理', '资源新增', '/admin/res', '2019-11-08 08:34:32', '1', '少校', '/111.199.174.42:62905', 'null');
INSERT INTO `base_gate_log` VALUES (276, '资源管理', '资源新增', '/admin/res', '2019-11-08 08:34:36', '1', '少校', '/111.199.174.42:62905', 'null');
INSERT INTO `base_gate_log` VALUES (277, '资源管理', '资源新增', '/admin/res', '2019-11-08 08:35:47', '1', '少校', '/111.199.174.42:62995', 'null');
INSERT INTO `base_gate_log` VALUES (278, '资源管理', '资源新增', '/admin/res', '2019-11-08 08:37:19', '1', '少校', '/111.199.174.42:63106', 'null');
INSERT INTO `base_gate_log` VALUES (279, '资源管理', '资源新增', '/admin/res', '2019-11-08 08:37:23', '1', '少校', '/111.199.174.42:63111', 'null');
INSERT INTO `base_gate_log` VALUES (280, '资源管理', '资源新增', '/admin/res', '2019-11-08 08:51:13', '1', '少校', '/58.152.43.180:43854', 'null');
INSERT INTO `base_gate_log` VALUES (281, '资源管理', '资源编辑', '/admin/res/{*}', '2019-11-08 08:52:12', '1', '少校', '/111.199.174.42:64218', 'null');
INSERT INTO `base_gate_log` VALUES (282, '资源管理', '资源编辑', '/admin/res/{*}', '2019-11-08 08:52:28', '1', '少校', '/111.199.174.42:64245', 'null');
INSERT INTO `base_gate_log` VALUES (283, '资源管理', '资源新增', '/admin/res', '2019-11-08 08:52:39', '1', '少校', '/58.152.43.180:59656', 'null');
INSERT INTO `base_gate_log` VALUES (284, '资源管理', '资源新增', '/admin/res', '2019-11-08 08:52:54', '1', '少校', '/58.152.43.180:34096', 'null');
INSERT INTO `base_gate_log` VALUES (285, '资源管理', '资源新增', '/admin/res', '2019-11-08 08:57:27', '1', '少校', '/58.152.43.180:56114', 'null');
INSERT INTO `base_gate_log` VALUES (286, '用户管理', '用户删除', '/admin/adm/del/{*}', '2019-11-08 09:45:26', '1', '少校', '/39.88.37.181:7806', 'null');
INSERT INTO `base_gate_log` VALUES (287, '用户管理', '用户编辑', '/admin/adm/update/{*}', '2019-11-08 09:52:43', '1', '少校', '/39.88.37.181:8751', 'null');
INSERT INTO `base_gate_log` VALUES (288, '角色授权', '角色授权保存', '/admin/roleRes/{*}', '2019-11-08 09:52:59', '1', '少校', '/39.88.37.181:8751', 'null');
INSERT INTO `base_gate_log` VALUES (289, '角色授权', '角色授权保存', '/admin/roleRes/{*}', '2019-11-08 09:53:54', '1', '少校', '/39.88.37.181:8751', 'null');
INSERT INTO `base_gate_log` VALUES (290, '客户列表', '客户编辑', '/admin/customer/update/{*}', '2019-11-08 10:08:30', '1', '少校', '/39.88.37.181:9417', 'null');
INSERT INTO `base_gate_log` VALUES (291, '客户列表', '客户编辑', '/admin/customer/update/{*}', '2019-11-08 10:08:46', '1', '少校', '/39.88.37.181:9417', 'null');
INSERT INTO `base_gate_log` VALUES (292, '用户管理', '用户编辑', '/admin/adm/update/{*}', '2019-11-08 10:09:00', '1', '少校', '/39.88.37.181:9417', 'null');
INSERT INTO `base_gate_log` VALUES (293, '客户列表', '客户编辑', '/admin/customer/update/{*}', '2019-11-08 10:09:22', '1', '少校', '/39.88.37.181:9417', 'null');
INSERT INTO `base_gate_log` VALUES (294, '客户列表', '客户编辑', '/admin/customer/update/{*}', '2019-11-08 10:09:32', '1', '少校', '/39.88.37.181:9417', 'null');
INSERT INTO `base_gate_log` VALUES (295, '投标记录', '记录新增', '/admin/loan-record/add', '2019-11-08 10:27:18', '1', '少校', '/39.88.37.181:10796', 'null');
INSERT INTO `base_gate_log` VALUES (296, '组织机构', '机构新增', '/admin/org', '2019-11-09 05:25:19', '1', '少校', '/42.200.189.173:37588', 'null');
INSERT INTO `base_gate_log` VALUES (297, '组织机构', '机构编辑', '/admin/org/{*}', '2019-11-09 05:26:08', '1', '少校', '/42.200.189.173:46684', 'null');
INSERT INTO `base_gate_log` VALUES (298, '组织机构', '机构编辑', '/admin/org/{*}', '2019-11-09 05:26:58', '1', '少校', '/42.200.189.173:57168', 'null');
INSERT INTO `base_gate_log` VALUES (299, '组织机构', '机构新增', '/admin/org', '2019-11-09 05:28:55', '1', '少校', '/203.186.25.60:58524', 'null');
INSERT INTO `base_gate_log` VALUES (300, '组织机构', '机构新增', '/admin/org', '2019-11-09 05:36:47', '1', '少校', '/203.186.25.60:47858', 'null');
INSERT INTO `base_gate_log` VALUES (301, '组织机构', '机构新增', '/admin/org', '2019-11-09 05:36:53', '1', '少校', '/203.186.25.60:48910', 'null');
INSERT INTO `base_gate_log` VALUES (302, '组织机构', '机构编辑', '/admin/org/{*}', '2019-11-09 05:42:15', '1', '少校', '/39.88.37.181:1416', 'null');
INSERT INTO `base_gate_log` VALUES (303, '组织机构', '机构新增', '/admin/org', '2019-11-09 05:42:49', '1', '少校', '/39.88.37.181:1416', 'null');
INSERT INTO `base_gate_log` VALUES (304, '组织机构', '机构新增', '/admin/org', '2019-11-09 05:43:12', '1', '少校', '/39.88.37.181:1416', 'null');
INSERT INTO `base_gate_log` VALUES (305, '组织机构', '机构编辑', '/admin/org/{*}', '2019-11-09 05:43:18', '1', '少校', '/39.88.37.181:1416', 'null');
INSERT INTO `base_gate_log` VALUES (306, '组织机构', '机构编辑', '/admin/org/{*}', '2019-11-09 05:43:24', '1', '少校', '/39.88.37.181:1416', 'null');
INSERT INTO `base_gate_log` VALUES (307, '组织机构', '机构编辑', '/admin/org/{*}', '2019-11-09 05:43:28', '1', '少校', '/39.88.37.181:1416', 'null');
INSERT INTO `base_gate_log` VALUES (308, '组织机构', '机构编辑', '/admin/org/{*}', '2019-11-11 03:21:33', '1', '少校', '/203.186.25.60:43356', 'null');
INSERT INTO `base_gate_log` VALUES (309, '合同管理', '合同删除', '/admin/contract/{*}', '2019-11-11 03:29:42', '1', '少校', '/39.88.37.181:11141', 'null');
INSERT INTO `base_gate_log` VALUES (310, '用户管理', '用户编辑', '/admin/adm/update/{*}', '2019-11-11 04:05:57', '1', '少校', '/203.186.25.60:35172', 'null');

-- ----------------------------
-- Table structure for base_msg
-- ----------------------------
DROP TABLE IF EXISTS `base_msg`;
CREATE TABLE `base_msg`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `send_id` bigint(20) NULL DEFAULT NULL COMMENT '发送者id',
  `receive_id` bigint(20) NOT NULL COMMENT '接受者id',
  `msg_id` bigint(20) NULL DEFAULT NULL COMMENT '消息id',
  `status` int(2) NULL DEFAULT 0 COMMENT '状态（0：未读；1：已读；）',
  `creator_id` bigint(20) NULL DEFAULT NULL COMMENT '创建者id',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间 ',
  `updater_id` bigint(20) NULL DEFAULT NULL COMMENT '更新者id',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of base_msg
-- ----------------------------
INSERT INTO `base_msg` VALUES (1, 1, 28, 1, 1, 1, '2019-10-21 23:33:54', NULL, NULL);
INSERT INTO `base_msg` VALUES (2, 1, 28, 2, 1, 1, '2019-10-21 23:33:57', NULL, NULL);
INSERT INTO `base_msg` VALUES (3, 1, 28, 3, 1, 1, '2019-10-21 23:36:47', NULL, NULL);
INSERT INTO `base_msg` VALUES (4, 1, 28, 4, 1, 1, '2019-10-21 23:36:49', NULL, NULL);
INSERT INTO `base_msg` VALUES (5, 1, 28, 5, 1, 1, '2019-10-21 23:36:51', NULL, NULL);
INSERT INTO `base_msg` VALUES (6, 1, 1, 1, NULL, 1, '2019-11-12 02:54:25', 1, '2019-11-12 02:54:25');
INSERT INTO `base_msg` VALUES (7, 1, 21, 1, NULL, 1, '2019-11-12 02:54:25', 1, '2019-11-12 02:54:25');
INSERT INTO `base_msg` VALUES (8, 1, 28, 1, NULL, 1, '2019-11-12 02:54:25', 1, '2019-11-12 02:54:25');
INSERT INTO `base_msg` VALUES (9, 1, 30, 1, NULL, 1, '2019-11-12 02:54:25', 1, '2019-11-12 02:54:25');
INSERT INTO `base_msg` VALUES (10, 1, 31, 1, NULL, 1, '2019-11-12 02:54:25', 1, '2019-11-12 02:54:25');
INSERT INTO `base_msg` VALUES (11, 1, 32, 1, NULL, 1, '2019-11-12 02:54:25', 1, '2019-11-12 02:54:25');
INSERT INTO `base_msg` VALUES (12, 1, 33, 1, NULL, 1, '2019-11-12 02:54:25', 1, '2019-11-12 02:54:25');
INSERT INTO `base_msg` VALUES (13, 1, 34, 1, NULL, 1, '2019-11-12 02:54:25', 1, '2019-11-12 02:54:25');
INSERT INTO `base_msg` VALUES (14, 1, 35, 1, NULL, 1, '2019-11-12 02:54:25', 1, '2019-11-12 02:54:25');
INSERT INTO `base_msg` VALUES (15, 1, 36, 1, NULL, 1, '2019-11-12 02:54:25', 1, '2019-11-12 02:54:25');
INSERT INTO `base_msg` VALUES (16, 1, 37, 1, NULL, 1, '2019-11-12 02:54:25', 1, '2019-11-12 02:54:25');

-- ----------------------------
-- Table structure for base_msg_text
-- ----------------------------
DROP TABLE IF EXISTS `base_msg_text`;
CREATE TABLE `base_msg_text`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `msg_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `msg_text` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '消息内容',
  `type` int(2) NULL DEFAULT 1 COMMENT '状态（1：点到点；2：点到面；）',
  `creator_id` bigint(20) NULL DEFAULT NULL COMMENT '创建者id',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间 ',
  `updater_id` bigint(20) NULL DEFAULT NULL COMMENT '更新者id',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of base_msg_text
-- ----------------------------
INSERT INTO `base_msg_text` VALUES (1, '测试', '管理员发送给customer的站内信1', 1, 1, '2019-10-21 23:28:43', NULL, NULL);
INSERT INTO `base_msg_text` VALUES (2, '双11', '双11内容测试2', 1, 1, '2019-10-21 23:34:16', NULL, NULL);
INSERT INTO `base_msg_text` VALUES (3, '1212', '管理员发送给customer的站内信3', 1, 1, '2019-10-21 23:36:14', NULL, NULL);
INSERT INTO `base_msg_text` VALUES (4, '内容4', '管理员发送给customer的站内信4', 1, 1, '2019-10-21 23:36:15', NULL, NULL);
INSERT INTO `base_msg_text` VALUES (5, '主题5', '管理员发送给customer的站内信5', 1, 1, '2019-10-21 23:36:17', NULL, NULL);
INSERT INTO `base_msg_text` VALUES (6, '123', '13', 2, 1, '2019-11-12 02:46:05', 1, '2019-11-12 02:46:05');
INSERT INTO `base_msg_text` VALUES (7, '1333', '123', 2, 1, '2019-11-12 02:46:27', 1, '2019-11-12 02:46:27');
INSERT INTO `base_msg_text` VALUES (8, '123213', '	\n管理员发送给customer的站内信3\n内容4\n管理员发送给customer的站内信4', 2, 1, '2019-11-12 02:54:25', 1, '2019-11-12 02:54:25');
INSERT INTO `base_msg_text` VALUES (9, '132', '123', 2, 1, '2019-11-12 02:55:40', 1, '2019-11-12 02:55:40');

-- ----------------------------
-- Table structure for base_org
-- ----------------------------
DROP TABLE IF EXISTS `base_org`;
CREATE TABLE `base_org`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `org_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `org_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '编号',
  `parent_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '父编号',
  `alias` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '别名',
  `level` int(5) NULL DEFAULT NULL COMMENT '级别',
  `sort` int(8) NULL DEFAULT NULL COMMENT '排序',
  `status` tinyint(2) NULL DEFAULT 1 COMMENT '状态（0：禁用；1：启用）',
  `is_deleted` tinyint(2) NULL DEFAULT 0 COMMENT '是否删除（0：未删除，1：已删除）',
  `opened` tinyint(2) NULL DEFAULT 0 COMMENT '是否展开（1：是，0：否）',
  `remark` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `creator_id` bigint(20) NULL DEFAULT NULL COMMENT '创建者id',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间 ',
  `updater_id` bigint(20) NULL DEFAULT NULL COMMENT '更新者id',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `org_name`(`org_name`) USING BTREE,
  UNIQUE INDEX `org_code`(`org_code`) USING BTREE,
  INDEX `i_id`(`id`) USING BTREE,
  INDEX `i_parent_code`(`parent_code`) USING BTREE,
  INDEX `i_org_name`(`org_name`) USING BTREE,
  INDEX `i_org_code`(`org_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '组织机构表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of base_org
-- ----------------------------
INSERT INTO `base_org` VALUES (1, '众安控股', 'za', '-1', '众安', 1, 1, 1, 0, 0, NULL, NULL, '2019-06-12 14:59:31', NULL, NULL);
INSERT INTO `base_org` VALUES (2, '北方大区', 'bf', 'za', '北方', 2, 1, 1, 0, 0, NULL, NULL, '2019-06-12 15:00:06', NULL, NULL);
INSERT INTO `base_org` VALUES (3, '南方大区', 'nf', 'za', '南方', 2, 2, 1, 0, 0, NULL, NULL, '2019-06-12 15:00:28', NULL, NULL);
INSERT INTO `base_org` VALUES (4, '烟台', 'yt', 'bf', '烟台', 3, 1, 1, 0, 0, NULL, NULL, '2019-06-12 15:01:25', NULL, NULL);
INSERT INTO `base_org` VALUES (5, '青岛', 'qd', 'bf', '青岛', 3, 2, 1, 0, 0, NULL, NULL, '2019-06-12 15:01:28', NULL, NULL);
INSERT INTO `base_org` VALUES (6, '深圳', 'sz', 'nf', '深圳', 3, 1, 1, 0, 0, NULL, NULL, '2019-06-12 15:01:56', NULL, NULL);
INSERT INTO `base_org` VALUES (7, '蓬莱', 'pl', 'yt', '蓬莱', 4, 1, 1, 0, 0, NULL, NULL, '2019-06-12 15:02:46', NULL, NULL);
INSERT INTO `base_org` VALUES (8, '广州', 'gz', 'nf', '广州', NULL, 6, 1, 0, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `base_org` VALUES (10, 'test', 'test', '-1', 'test', NULL, 1, 1, 1, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `base_org` VALUES (11, '20191008', '20191008', 'bf', '20191008', NULL, 10, 1, 0, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `base_org` VALUES (12, '哈哈哈 ', '12333', 'bf', '12312313', NULL, 1, 1, 0, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `base_org` VALUES (13, '213333333', '123', 'pl', '123', NULL, 2, 1, 0, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `base_org` VALUES (15, '12333', '12311233333333', '20191008', '123111111111111', NULL, 1, 1, 0, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `base_org` VALUES (16, '潮汕', 'cs', 'nf', '潮汕', NULL, 1, 1, 0, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `base_org` VALUES (17, '香港', 'xg', 'nf', '香港', NULL, NULL, 1, 0, 0, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for base_resource
-- ----------------------------
DROP TABLE IF EXISTS `base_resource`;
CREATE TABLE `base_resource`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `res_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `res_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '编号',
  `parent_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '父编号',
  `type` tinyint(2) NULL DEFAULT 1 COMMENT '类型（1:系统；2：目录；3：菜单；4：功能按钮）',
  `url` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '链接',
  `i_frame` tinyint(1) NULL DEFAULT 0 COMMENT '是否外链（1：是，0：否',
  `component` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组件',
  `icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图标',
  `level` int(5) NULL DEFAULT NULL COMMENT '级别',
  `method` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求方法（GET|POST|PUT|DELETE）',
  `sort` int(8) NULL DEFAULT NULL,
  `status` tinyint(2) NULL DEFAULT 1 COMMENT '状态（0：禁用；1：启用）',
  `opened` tinyint(2) NULL DEFAULT 0 COMMENT '是否展开（1：是，0：否）',
  `is_deleted` tinyint(2) NULL DEFAULT 0 COMMENT '是否删除（0：未删除，1：已删除）',
  `remark` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `creator_id` bigint(20) NULL DEFAULT NULL COMMENT '创建者id',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间 ',
  `updater_id` bigint(20) NULL DEFAULT NULL COMMENT '更新者id',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `res_code`(`res_code`) USING BTREE,
  INDEX `i_id`(`id`) USING BTREE,
  INDEX `i_parent_code`(`parent_code`) USING BTREE,
  INDEX `i_res_name`(`res_name`) USING BTREE,
  INDEX `i_res_code`(`res_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 140 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '资源表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of base_resource
-- ----------------------------
INSERT INTO `base_resource` VALUES (1, '系统管理', 'system', '-1', 2, 'system', 0, NULL, 'system', 1, NULL, 3, 1, 0, 0, NULL, NULL, '2019-06-11 18:09:52', NULL, NULL);
INSERT INTO `base_resource` VALUES (2, '配置管理', 'config', '-1', 2, 'config', 0, NULL, 'dictionary', 1, NULL, 4, 1, 0, 0, NULL, NULL, '2019-06-11 18:09:52', NULL, NULL);
INSERT INTO `base_resource` VALUES (3, '日志管理', 'log', '-1', 2, 'log', 0, NULL, 'log', 1, NULL, 5, 1, 0, 0, NULL, NULL, '2019-06-11 18:09:52', NULL, NULL);
INSERT INTO `base_resource` VALUES (4, '用户管理', 'user', 'system', 3, 'user', 0, 'system/user/index', 'peoples', 2, NULL, 1, 1, 0, 0, NULL, NULL, '2019-06-11 18:09:52', NULL, NULL);
INSERT INTO `base_resource` VALUES (5, '角色管理', 'role', 'system', 3, 'role', 0, 'system/role/index', 'role', 2, NULL, 2, 1, 0, 0, NULL, NULL, '2019-06-11 18:09:52', NULL, '2019-06-21 11:40:40');
INSERT INTO `base_resource` VALUES (6, '资源管理', 'res', 'system', 3, 'res', 0, 'system/res/index', 'menu', 2, NULL, 3, 1, 0, 0, NULL, NULL, '2019-06-11 18:09:52', NULL, NULL);
INSERT INTO `base_resource` VALUES (7, '组织机构', 'org', 'system', 3, 'org', 0, 'system/org/index', 'dept', 2, NULL, 4, 1, 0, 0, NULL, NULL, '2019-06-11 18:09:52', NULL, NULL);
INSERT INTO `base_resource` VALUES (8, '角色授权', 'roleRes', 'system', 3, 'roleRes', 0, 'system/roleRes/index', 'dept', 2, NULL, 5, 1, 0, 0, NULL, NULL, '2019-06-11 18:09:52', NULL, NULL);
INSERT INTO `base_resource` VALUES (9, '机构用户', 'orgUser', 'system', 3, 'orgUser', 0, 'system/orgUser/index', 'dept', 2, NULL, 6, 1, 0, 0, NULL, NULL, '2019-06-11 18:09:52', NULL, NULL);
INSERT INTO `base_resource` VALUES (10, '修改密码', 'password', 'system', 3, 'password', 0, 'system/password/index', 'dept', 2, NULL, 7, 1, 0, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `base_resource` VALUES (11, '用户查询', 'user:view', 'user', 4, '/admin/adm/list', 0, NULL, NULL, 3, 'GET', 1, 1, 0, 0, NULL, NULL, '2019-06-11 18:09:52', NULL, '2019-06-21 11:40:30');
INSERT INTO `base_resource` VALUES (12, '用户新增', 'user:btn_add', 'user', 4, '/admin/adm/add', 0, NULL, NULL, 3, 'POST', 2, 1, 0, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `base_resource` VALUES (13, '用户编辑', 'user:btn_edit', 'user', 4, '/admin/adm/update/{*}', 0, NULL, NULL, 3, 'PUT', 3, 1, 0, 0, NULL, NULL, '2019-06-11 18:09:52', NULL, NULL);
INSERT INTO `base_resource` VALUES (14, '用户删除', 'user:btn_del', 'user', 4, '/admin/adm/del/{*}', 0, NULL, NULL, 3, 'DELETE', 4, 1, 0, 0, NULL, NULL, '2019-06-11 18:09:52', NULL, NULL);
INSERT INTO `base_resource` VALUES (15, '服务监控', 'service', '-1', 2, 'service', 0, NULL, 'monitor', 1, NULL, 6, 1, 0, 0, NULL, NULL, '2019-06-11 18:09:52', NULL, NULL);
INSERT INTO `base_resource` VALUES (16, '注册中心', 'nacos', 'service', 3, 'http://192.168.1.119:8848/nacos', 0, 'service/nacos/index', 'monitor', 2, NULL, 2, 1, 0, 0, NULL, NULL, '2019-06-11 18:09:52', NULL, '2019-06-21 11:40:32');
INSERT INTO `base_resource` VALUES (17, '状态监控', 'monitor', 'service', 3, 'http://192.168.1.61:8760', 0, 'service/monitor/index', 'monitor', 2, NULL, 3, 1, 0, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `base_resource` VALUES (18, '链路监控', 'zipkin', 'service', 3, 'http://192.168.1.61:8850', 0, 'service/zipkin/index', 'monitor', 2, NULL, 4, 1, 0, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `base_resource` VALUES (21, '服务管理', 'manager', 'service', 3, 'manager', 0, 'service/manager/index', 'monitor', 2, NULL, 1, 1, 0, 0, NULL, NULL, '2019-06-11 18:09:52', NULL, NULL);
INSERT INTO `base_resource` VALUES (22, '项目地址', 'github', '-1', 3, 'https://sports.qq.com/nba/', 1, NULL, 'github', 1, NULL, 1, 1, 0, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `base_resource` VALUES (23, '角色查询', 'role:view', 'role', 4, '/admin/role/page', 0, NULL, NULL, 3, 'GET', 1, 1, 0, 0, NULL, NULL, NULL, NULL, '2019-06-21 11:40:26');
INSERT INTO `base_resource` VALUES (24, '角色新增', 'role:btn_add', 'role', 4, '/admin/role', 0, NULL, NULL, 3, 'POST', 2, 1, 0, 0, NULL, NULL, '2019-06-11 18:09:52', NULL, NULL);
INSERT INTO `base_resource` VALUES (25, '角色编辑', 'role:btn_edit', 'role', 4, '/admin/role/{*}', 0, NULL, NULL, 3, 'PUT', 3, 1, 0, 0, NULL, NULL, '2019-06-11 18:09:52', NULL, NULL);
INSERT INTO `base_resource` VALUES (26, '角色删除', 'role:btn_del', 'role', 4, '/admin/role/{*}', 0, NULL, NULL, 3, 'DELETE', 4, 1, 0, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `base_resource` VALUES (27, '资源查询', 'res:view', 'res', 4, '/admin/res/list', 0, NULL, NULL, 3, 'GET', 1, 1, 0, 0, NULL, NULL, NULL, NULL, '2019-06-21 11:40:23');
INSERT INTO `base_resource` VALUES (28, '资源新增', 'res:btn_add', 'res', 4, '/admin/res', 0, NULL, NULL, 3, 'POST', 2, 1, 0, 0, NULL, NULL, '2019-06-11 18:09:52', NULL, NULL);
INSERT INTO `base_resource` VALUES (29, '资源编辑', 'res:btn_edit', 'res', 4, '/admin/res/{*}', 0, NULL, NULL, 3, 'PUT', 3, 1, 0, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `base_resource` VALUES (30, '资源删除', 'res:btn_del', 'res', 4, '/admin/res/del/{*}', 0, NULL, NULL, 3, 'DELETE', 4, 1, 0, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `base_resource` VALUES (31, '机构查询', 'org:view', 'org', 4, '/admin/org/list', 0, NULL, NULL, 3, 'GET', 1, 1, 0, 0, NULL, NULL, '2019-06-11 18:09:52', NULL, '2019-06-21 11:40:35');
INSERT INTO `base_resource` VALUES (32, '机构新增', 'org:btn_add', 'org', 4, '/admin/org', 0, NULL, NULL, 3, 'POST', 2, 1, 0, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `base_resource` VALUES (33, '机构编辑', 'org:btn_edit', 'org', 4, '/admin/org/{*}', 0, NULL, NULL, 3, 'PUT', 3, 1, 0, 0, NULL, NULL, '2019-06-11 18:09:52', NULL, NULL);
INSERT INTO `base_resource` VALUES (34, '机构删除', 'org:btn_del', 'org', 4, '/admin/org/{*}', 0, NULL, NULL, 3, 'DELETE', 4, 1, 0, 0, NULL, NULL, '2019-06-11 18:09:52', NULL, '2019-06-21 11:40:19');
INSERT INTO `base_resource` VALUES (37, '网关日志', 'gateLog', 'log', 3, 'gateLog', 0, 'log/gateLog/index', 'log', 2, NULL, 1, 1, 0, 0, NULL, NULL, '2019-06-13 10:01:24', NULL, NULL);
INSERT INTO `base_resource` VALUES (38, '服务查询', 'manager:view', 'manager', 4, '/auth/service/{*}', 0, NULL, NULL, 3, 'GET', 1, 1, 0, 0, NULL, NULL, '2019-06-11 18:09:52', NULL, NULL);
INSERT INTO `base_resource` VALUES (39, '服务新增', 'manager:btn_add', 'manager', 4, '/auth/service', 0, NULL, NULL, 3, 'POST', 2, 1, 0, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `base_resource` VALUES (40, '服务编辑', 'manager:btn_edit', 'manager', 4, '/auth/service/{*}', 0, NULL, NULL, 3, 'PUT', 3, 1, 0, 0, NULL, NULL, '2019-06-11 18:09:52', NULL, NULL);
INSERT INTO `base_resource` VALUES (41, '服务删除', 'manager:btn_del', 'manager', 4, '/auth/service/{*}', 0, NULL, NULL, 3, 'DELETE', 4, 1, 0, 0, NULL, NULL, '2019-06-11 18:09:52', NULL, NULL);
INSERT INTO `base_resource` VALUES (42, '服务授权', 'manager:btn_auth', 'manager', 4, '/auth/service/{*}', 0, NULL, NULL, 3, 'POST', 5, 1, 0, 0, NULL, NULL, NULL, NULL, '2019-06-21 11:40:13');
INSERT INTO `base_resource` VALUES (43, '工单管理', 'worder', '-1', 2, 'worder', 0, NULL, 'system', 1, NULL, 2, 0, 0, 0, NULL, NULL, '2019-06-21 11:39:59', NULL, NULL);
INSERT INTO `base_resource` VALUES (44, '工单列表', 'plan', 'worder', 3, 'plan', 0, 'worder/plan/index', 'menu', 2, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `base_resource` VALUES (45, '工单记录', 'record', 'worder', 3, 'record', 0, 'worder/record/index', 'dept', 2, NULL, 2, 0, 0, 0, NULL, NULL, '2019-06-21 11:40:10', NULL, '2019-06-21 11:40:16');
INSERT INTO `base_resource` VALUES (48, '角色授权保存', 'roleRes:btn_save', 'roleRes', 4, '/admin/roleRes/{*}', 0, NULL, NULL, 3, 'POST', 1, 1, 0, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `base_resource` VALUES (49, '数据字典', 'dict', 'config', 3, 'dict', 0, 'config/dict/index', 'role', 2, NULL, 1, 1, 0, 0, NULL, NULL, '2019-06-21 11:40:07', NULL, NULL);
INSERT INTO `base_resource` VALUES (50, '字典查询', 'dict:view', 'dict', 4, '/admin/dict/page', 0, NULL, NULL, 3, 'GET', 1, 1, 0, 0, NULL, NULL, NULL, NULL, '2019-06-21 11:40:26');
INSERT INTO `base_resource` VALUES (51, '字典新增', 'dict:btn_add', 'dict', 4, '/admin/dict', 0, NULL, NULL, 3, 'POST', 2, 1, 0, 0, NULL, NULL, '2019-06-11 18:09:52', NULL, NULL);
INSERT INTO `base_resource` VALUES (52, '字典编辑', 'dict:btn_edit', 'dict', 4, '/admin/dict/{*}', 0, NULL, NULL, 3, 'PUT', 3, 1, 0, 0, NULL, NULL, '2019-06-11 18:09:52', NULL, NULL);
INSERT INTO `base_resource` VALUES (53, '字典删除', 'dict:btn_del', 'dict', 4, '/admin/dict/{*}', 0, NULL, NULL, 3, 'DELETE', 4, 1, 0, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `base_resource` VALUES (54, '客户管理', 'customer', '-1', 2, 'customer', 0, NULL, 'system', 1, NULL, 6, 1, 0, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `base_resource` VALUES (60, '客户列表', 'customerList', 'customer', 3, 'customerList', 0, 'customer/list/index', 'role', 2, NULL, 1, 1, 0, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `base_resource` VALUES (61, '我的客户', 'customerMy', 'customer', 3, 'customerMy', 0, 'customer/my/index', 'alipay', 2, '', 2, 1, 0, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `base_resource` VALUES (62, '客户查询', 'customerList:view', 'customerList', 4, '/admin/customer/list', 0, NULL, NULL, 3, 'GET', 1, 1, 0, 0, NULL, NULL, NULL, NULL, '2019-06-21 11:40:26');
INSERT INTO `base_resource` VALUES (63, '客户新增', 'customerList:btn_add', 'customerList', 4, '/admin/customer/add/{*}', 0, NULL, NULL, 3, 'POST', 2, 1, 0, 0, NULL, NULL, '2019-06-11 18:09:52', NULL, NULL);
INSERT INTO `base_resource` VALUES (64, '客户编辑', 'customerList:btn_edit', 'customerList', 4, '/admin/customer/update/{*}', 0, NULL, NULL, 3, 'PUT', 3, 1, 0, 0, NULL, NULL, '2019-06-11 18:09:52', NULL, NULL);
INSERT INTO `base_resource` VALUES (65, '客户删除', 'customerList:btn_del', 'customerList', 4, '/admin/customer/del/{*}', 0, NULL, NULL, 3, 'DELETE', 4, 1, 0, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `base_resource` VALUES (66, '客户编辑', 'customerMy:btn_edit', 'customerMy', 4, '/admin/customerMy/{*}', 0, NULL, NULL, 3, 'PUT', 3, 1, 0, 0, NULL, NULL, '2019-06-11 18:09:52', NULL, NULL);
INSERT INTO `base_resource` VALUES (67, '客户分配', 'customerList:btn_distribute', 'customerList', 4, '/admin/customer/distribute', 0, NULL, NULL, 3, 'POST', 5, 1, 0, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `base_resource` VALUES (68, '标的管理', 'loan', '-1', 2, 'loan', 0, '', 'zujian', NULL, '', 8, 1, 0, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `base_resource` VALUES (69, '标的列表', 'loanList', 'loan', 3, 'loanList', 0, 'loan/loanList/index', 'redis', 2, NULL, 2, 1, 0, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `base_resource` VALUES (70, '投标记录', 'loanRecord', 'loan', 3, 'loanRecord', 0, 'loan/loanRecord/index', 'log', 2, '', 3, 1, 0, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `base_resource` VALUES (71, '合同管理', 'contract', 'loan', 3, 'contract', 0, 'loan/contract/index', 'icon', 2, '', 1, 1, 0, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `base_resource` VALUES (72, '合同查询', 'contract:view', 'contract', 4, '/admin/contract/list', 0, NULL, NULL, 3, 'GET', 1, 1, 0, 0, NULL, NULL, '2019-06-11 18:09:52', NULL, '2019-06-21 11:40:30');
INSERT INTO `base_resource` VALUES (73, '合同新增', 'contract:btn_add', 'contract', 4, '/admin/contract', 0, NULL, NULL, 3, 'POST', 2, 1, 0, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `base_resource` VALUES (74, '合同编辑', 'contract:btn_edit', 'contract', 4, '/admin/contract/{*}', 0, NULL, NULL, 3, 'PUT', 3, 1, 0, 0, NULL, NULL, '2019-06-11 18:09:52', NULL, NULL);
INSERT INTO `base_resource` VALUES (75, '合同删除', 'contract:btn_del', 'contract', 4, '/admin/contract/{*}', 0, NULL, NULL, 3, 'DELETE', 4, 1, 0, 0, NULL, NULL, '2019-06-11 18:09:52', NULL, NULL);
INSERT INTO `base_resource` VALUES (76, '标的查询', 'loanList:view', 'loanList', 4, '/admin/loan-sign/list', 0, NULL, NULL, 3, 'GET', 1, 1, 0, 0, NULL, NULL, '2019-06-11 18:09:52', NULL, '2019-06-21 11:40:30');
INSERT INTO `base_resource` VALUES (77, '标的新增', 'loanList:btn_add', 'loanList', 4, '/admin/loan-sign', 0, NULL, NULL, 3, 'POST', 2, 1, 0, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `base_resource` VALUES (78, '记录查询', 'loanRecord:view', 'loanRecord', 4, '/admin/loan-record/list', 0, NULL, NULL, 3, 'GET', 1, 1, 0, 0, NULL, NULL, '2019-06-11 18:09:52', NULL, '2019-06-21 11:40:30');
INSERT INTO `base_resource` VALUES (79, '记录新增', 'loanRecord:btn_add', 'loanRecord', 4, '/admin/loan-record/add', 0, NULL, NULL, 3, 'POST', 2, 1, 0, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `base_resource` VALUES (80, '记录编辑', 'loanRecord:btn_edit', 'loanRecord', 4, '/admin/loan-record/{*}', 0, NULL, NULL, 3, 'PUT', 3, 1, 0, 0, NULL, NULL, '2019-06-11 18:09:52', NULL, NULL);
INSERT INTO `base_resource` VALUES (81, '记录删除', 'loanRecord:btn_del', 'loanRecord', 4, '/admin/loan-record/{*}', 0, NULL, NULL, 3, 'DELETE', 4, 1, 0, 0, NULL, NULL, '2019-06-11 18:09:52', NULL, NULL);
INSERT INTO `base_resource` VALUES (82, '标的编辑', 'loanList:btn_edit', 'loanList', 4, '/admin/loan-list/{*}', 0, NULL, NULL, 3, 'PUT', 3, 1, 0, 0, NULL, NULL, '2019-06-11 18:09:52', NULL, NULL);
INSERT INTO `base_resource` VALUES (83, '标的删除', 'loanList:btn_del', 'loanList', 4, '/admin/loan-list/{*}', 0, NULL, NULL, 3, 'DELETE', 4, 1, 0, 0, NULL, NULL, '2019-06-11 18:09:52', NULL, NULL);
INSERT INTO `base_resource` VALUES (84, '评价管理', 'appraise', '-1', 2, 'appraise', 0, '', 'anq', NULL, '', 1, 1, 0, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `base_resource` VALUES (87, '评价列表', 'appraiseList', 'appraise', 3, 'appraiseList', 0, 'appraise/appraiseList/index', 'date', NULL, NULL, 9, 1, 0, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `base_resource` VALUES (88, '营销管理', 'marketing', '-1', 2, 'marketing', 0, '', 'anq', NULL, '', 1, 1, 0, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `base_resource` VALUES (89, '营销列表', 'marketingList', 'marketing', 3, 'marketingList', 0, 'marketing/marketingList/index', 'date', NULL, NULL, 9, 1, 0, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `base_resource` VALUES (90, '预定管理', 'reverse', '-1', 2, 'reverse', 0, '', 'anq', NULL, '', 1, 1, 0, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `base_resource` VALUES (91, '预定列表', 'reverseList', 'reverse', 3, 'reverseList', 0, 'reverse/reverseList/index', 'date', NULL, NULL, 9, 1, 0, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `base_resource` VALUES (92, '预定记录', 'reverseRecord', 'reverse', 3, 'reverseRecord', 0, 'reverse/reverseRecord/index', 'date', NULL, NULL, 9, 1, 0, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `base_resource` VALUES (93, '活动管理', 'activi', '-1', 2, 'activi', 0, '', 'anq', NULL, '', 1, 1, 0, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `base_resource` VALUES (94, '活动列表', 'activiList', 'activi', 3, 'activiList', 0, 'activi/activiList/index', 'date', NULL, NULL, 9, 1, 0, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `base_resource` VALUES (95, '征集管理', 'collect', '-1', 2, 'collect', 0, '', 'anq', NULL, '', 1, 1, 0, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `base_resource` VALUES (96, '征集方案列表', 'collectList', 'collect', 3, 'collectList', 0, 'collect/collectList/index', 'date', NULL, NULL, 9, 1, 0, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `base_resource` VALUES (97, '征集记录', 'collectRecord', 'collect', 3, 'collectRecord', 0, 'collect/collectRecord/index', 'date', NULL, NULL, 9, 1, 0, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `base_resource` VALUES (98, '评价查询', 'appraiseList:view', 'appraiseList', 4, '/admin/appraise/list', 0, NULL, NULL, 3, 'GET', 1, 1, 0, 0, NULL, NULL, '2019-06-11 18:09:52', NULL, '2019-06-21 11:40:30');
INSERT INTO `base_resource` VALUES (99, '评价新增', 'appraiseList:btn_add', 'appraiseList', 4, '/admin/appraise', 0, NULL, NULL, 3, 'POST', 2, 1, 0, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `base_resource` VALUES (100, '评价编辑', 'appraiseList:btn_edit', 'appraiseList', 4, '/admin/appraise/{*}', 0, NULL, NULL, 3, 'PUT', 3, 1, 0, 0, NULL, NULL, '2019-06-11 18:09:52', NULL, NULL);
INSERT INTO `base_resource` VALUES (101, '评价删除', 'appraiseList:btn_del', 'appraiseList', 4, '/admin/appraise/{*}', 0, NULL, NULL, 3, 'DELETE', 4, 1, 0, 0, NULL, NULL, '2019-06-11 18:09:52', NULL, NULL);
INSERT INTO `base_resource` VALUES (102, '营销查询', 'marketingList:view', 'marketingList', 4, '/admin/marketing/page', 0, NULL, NULL, 3, 'GET', 1, 1, 0, 0, NULL, NULL, '2019-06-11 18:09:52', NULL, '2019-06-21 11:40:30');
INSERT INTO `base_resource` VALUES (103, '营销新增', 'marketingList:btn_add', 'marketingList', 4, '/admin/marketing', 0, NULL, NULL, 3, 'POST', 2, 1, 0, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `base_resource` VALUES (104, '营销编辑', 'marketingList:btn_edit', 'marketingList', 4, '/admin/marketing/{*}', 0, NULL, NULL, 3, 'PUT', 3, 1, 0, 0, NULL, NULL, '2019-06-11 18:09:52', NULL, NULL);
INSERT INTO `base_resource` VALUES (105, '营销删除', 'marketingList:btn_del', 'marketingList', 4, '/admin/marketing/{*}', 0, NULL, NULL, 3, 'DELETE', 4, 1, 0, 0, NULL, NULL, '2019-06-11 18:09:52', NULL, NULL);
INSERT INTO `base_resource` VALUES (106, '活动查询', 'activiList:view', 'activiList', 4, '/admin/activi/page', 0, NULL, NULL, 3, 'GET', 1, 1, 0, 0, NULL, NULL, '2019-06-11 18:09:52', NULL, '2019-06-21 11:40:30');
INSERT INTO `base_resource` VALUES (107, '活动新增', 'activiList:btn_add', 'activiList', 4, '/admin/activi', 0, NULL, NULL, 3, 'POST', 2, 1, 0, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `base_resource` VALUES (108, '活动编辑', 'activiList:btn_edit', 'activiList', 4, '/admin/activi/{*}', 0, NULL, NULL, 3, 'PUT', 3, 1, 0, 0, NULL, NULL, '2019-06-11 18:09:52', NULL, NULL);
INSERT INTO `base_resource` VALUES (109, '活动删除', 'activiList:btn_del', 'activiList', 4, '/admin/activi/{*}', 0, NULL, NULL, 3, 'DELETE', 4, 1, 0, 0, NULL, NULL, '2019-06-11 18:09:52', NULL, NULL);
INSERT INTO `base_resource` VALUES (110, '列表查询', 'reverseList:view', 'reverseList', 4, '/admin/reserve/page', 0, NULL, NULL, 3, 'GET', 1, 1, 0, 0, NULL, NULL, '2019-06-11 18:09:52', NULL, '2019-06-21 11:40:30');
INSERT INTO `base_resource` VALUES (111, '列表新增', 'reverseList:btn_add', 'reverseList', 4, '/admin/reserve', 0, NULL, NULL, 3, 'POST', 2, 1, 0, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `base_resource` VALUES (112, '列表编辑', 'reverseList:btn_edit', 'reverseList', 4, '/admin/reserve/{*}', 0, NULL, NULL, 3, 'PUT', 3, 1, 0, 0, NULL, NULL, '2019-06-11 18:09:52', NULL, NULL);
INSERT INTO `base_resource` VALUES (113, '列表删除', 'reverseList:btn_del', 'reverseList', 4, '/admin/reserve/{*}', 0, NULL, NULL, 3, 'DELETE', 4, 1, 0, 0, NULL, NULL, '2019-06-11 18:09:52', NULL, NULL);
INSERT INTO `base_resource` VALUES (114, '记录查询', 'reverseRecord:view', 'reverseRecord', 4, '/admin/reserve-record/list', 0, NULL, NULL, 3, 'GET', 1, 1, 0, 0, NULL, NULL, '2019-06-11 18:09:52', NULL, '2019-06-21 11:40:30');
INSERT INTO `base_resource` VALUES (115, '记录新增', 'reverseRecord:btn_add', 'reverseRecord', 4, '/admin/reserve-record', 0, NULL, NULL, 3, 'POST', 2, 1, 0, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `base_resource` VALUES (116, '记录编辑', 'reverseRecord:btn_edit', 'reverseRecord', 4, '/admin/reserve-record/{*}', 0, NULL, NULL, 3, 'PUT', 3, 1, 0, 0, NULL, NULL, '2019-06-11 18:09:52', NULL, NULL);
INSERT INTO `base_resource` VALUES (117, '记录删除', 'reverseRecord:btn_del', 'reverseRecord', 4, '/admin/reserve-record/{*}', 0, NULL, NULL, 3, 'DELETE', 4, 1, 0, 0, NULL, NULL, '2019-06-11 18:09:52', NULL, NULL);
INSERT INTO `base_resource` VALUES (118, '方案查询', 'collectList:view', 'collectList', 4, '/admin/collect/page', 0, NULL, NULL, 3, 'GET', 1, 1, 0, 0, NULL, NULL, '2019-06-11 18:09:52', NULL, '2019-06-21 11:40:30');
INSERT INTO `base_resource` VALUES (119, '方案新增', 'collectList:btn_add', 'collectList', 4, '/admin/collect', 0, NULL, NULL, 3, 'POST', 2, 1, 0, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `base_resource` VALUES (120, '方案编辑', 'collectList:btn_edit', 'collectList', 4, '/admin/collect/{*}', 0, NULL, NULL, 3, 'PUT', 3, 1, 0, 0, NULL, NULL, '2019-06-11 18:09:52', NULL, NULL);
INSERT INTO `base_resource` VALUES (121, '方案删除', 'collectList:btn_del', 'collectList', 4, '/admin/collect/{*}', 0, NULL, NULL, 3, 'DELETE', 4, 1, 0, 0, NULL, NULL, '2019-06-11 18:09:52', NULL, NULL);
INSERT INTO `base_resource` VALUES (122, '记录查询', 'collectRecord:view', 'collectRecord', 4, '/admin/collect-record/list', 0, NULL, NULL, 3, 'GET', 1, 1, 0, 0, NULL, NULL, '2019-06-11 18:09:52', NULL, '2019-06-21 11:40:30');
INSERT INTO `base_resource` VALUES (123, '记录新增', 'collectRecord:btn_add', 'collectRecord', 4, '/admin/collect-record', 0, NULL, NULL, 3, 'POST', 2, 1, 0, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `base_resource` VALUES (124, '记录编辑', 'collectRecord:btn_edit', 'collectRecord', 4, '/admin/collect-record/{*}', 0, NULL, NULL, 3, 'PUT', 3, 1, 0, 0, NULL, NULL, '2019-06-11 18:09:52', NULL, NULL);
INSERT INTO `base_resource` VALUES (125, '记录删除', 'collectRecord:btn_del', 'collectRecord', 4, '/admin/collect-record/{*}', 0, NULL, NULL, 3, 'DELETE', 4, 1, 0, 0, NULL, NULL, '2019-06-11 18:09:52', NULL, NULL);
INSERT INTO `base_resource` VALUES (129, '统计管理', 'statistics', '-1', 2, 'statistics', 0, '', 'codeConsole', NULL, '', 15, 1, 0, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `base_resource` VALUES (130, '用户业绩明细', 'performance', 'statistics', 3, 'performance', 0, 'statistics/performance/index', 'redis', NULL, '', 1, 1, 0, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `base_resource` VALUES (131, '站内信', 'message', '-1', 2, 'message', 0, '', 'develop', NULL, '', 1, 1, 0, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `base_resource` VALUES (132, '站内信列表', 'messagelist', 'message', 3, 'messagelist', 0, 'message/messagelist/index', 'icon', NULL, NULL, 15, 1, 1, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `base_resource` VALUES (133, '站内信新增', 'messagelist:btn_add', 'messagelist', 4, '', 0, '', '', NULL, '', 1, 1, 0, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `base_resource` VALUES (134, '公告', 'inletter', '-1', 2, 'inletter', 0, '', 'swagger', NULL, '', 1, 1, 0, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `base_resource` VALUES (135, '公告列表', 'inletterList', 'inletter', 3, 'inletterList', 0, 'inletter/inletterList/index', 'redis', NULL, NULL, 999, 1, 0, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `base_resource` VALUES (136, '公告新增', 'inletterList:btn_add', 'inletterList', 4, '', 0, '', '', NULL, NULL, 1, 1, 0, 0, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for base_role
-- ----------------------------
DROP TABLE IF EXISTS `base_role`;
CREATE TABLE `base_role`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `role_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称',
  `role_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色编码',
  `sort` int(10) NULL DEFAULT NULL COMMENT '排序',
  `status` tinyint(2) NULL DEFAULT 1 COMMENT '状态（0：禁用；1：启用）',
  `is_deleted` tinyint(2) NULL DEFAULT 0 COMMENT '是否删除（0：未删除，1：已删除）',
  `remark` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `creator_id` bigint(20) NULL DEFAULT NULL COMMENT '创建者id',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间 ',
  `updater_id` bigint(20) NULL DEFAULT NULL COMMENT '更新者id',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `role_name`(`role_name`) USING BTREE,
  UNIQUE INDEX `role_code`(`role_code`) USING BTREE,
  INDEX `i_id`(`id`) USING BTREE,
  INDEX `i_role_name`(`role_name`) USING BTREE,
  INDEX `i_role_code`(`role_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of base_role
-- ----------------------------
INSERT INTO `base_role` VALUES (1, '管理员', 'role_admin', 1, 1, 0, '1111', 1, '2019-06-04 09:15:52', NULL, NULL);
INSERT INTO `base_role` VALUES (2, '普通用户', 'role_normal', 2, 1, 0, '2222', 1, '2019-06-12 16:27:37', NULL, NULL);
INSERT INTO `base_role` VALUES (3, 'VIP用户', 'role_vip', 3, 1, 0, '100   333 sssssssssssssssssssssssssssssssssvfffffffffffff 333355555', 1, '2019-06-12 16:27:59', NULL, NULL);

-- ----------------------------
-- Table structure for base_role_resource
-- ----------------------------
DROP TABLE IF EXISTS `base_role_resource`;
CREATE TABLE `base_role_resource`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `role_id` bigint(20) NOT NULL COMMENT '角色id',
  `resource_id` bigint(20) NOT NULL COMMENT '资源id',
  `creator_id` bigint(20) NULL DEFAULT NULL COMMENT '创建者id',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间 ',
  `updater_id` bigint(20) NULL DEFAULT NULL COMMENT '更新者id',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `i_role_id`(`role_id`) USING BTREE,
  INDEX `i_resource_id`(`resource_id`) USING BTREE,
  CONSTRAINT `FK_role_resource_resource_id` FOREIGN KEY (`resource_id`) REFERENCES `base_resource` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_role_resource_role_id` FOREIGN KEY (`role_id`) REFERENCES `base_role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2111 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色资源表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of base_role_resource
-- ----------------------------
INSERT INTO `base_role_resource` VALUES (104, 3, 43, NULL, NULL, NULL, NULL);
INSERT INTO `base_role_resource` VALUES (105, 3, 22, NULL, NULL, NULL, NULL);
INSERT INTO `base_role_resource` VALUES (106, 3, 44, NULL, NULL, NULL, NULL);
INSERT INTO `base_role_resource` VALUES (866, 2, 1, NULL, '2019-07-11 10:12:38', NULL, NULL);
INSERT INTO `base_role_resource` VALUES (867, 2, 5, NULL, '2019-07-11 10:12:38', NULL, NULL);
INSERT INTO `base_role_resource` VALUES (868, 2, 4, NULL, '2019-07-11 10:12:38', NULL, NULL);
INSERT INTO `base_role_resource` VALUES (869, 2, 11, NULL, '2019-07-11 10:12:38', NULL, NULL);
INSERT INTO `base_role_resource` VALUES (870, 2, 12, NULL, '2019-07-11 10:12:38', NULL, NULL);
INSERT INTO `base_role_resource` VALUES (871, 2, 13, NULL, '2019-07-11 10:12:38', NULL, NULL);
INSERT INTO `base_role_resource` VALUES (872, 2, 14, NULL, '2019-07-11 10:12:38', NULL, NULL);
INSERT INTO `base_role_resource` VALUES (873, 2, 24, NULL, '2019-07-11 10:12:38', NULL, NULL);
INSERT INTO `base_role_resource` VALUES (874, 2, 26, NULL, '2019-07-11 10:12:38', NULL, NULL);
INSERT INTO `base_role_resource` VALUES (875, 2, 9, NULL, '2019-07-11 10:12:38', NULL, NULL);
INSERT INTO `base_role_resource` VALUES (876, 2, 10, NULL, '2019-07-11 10:12:38', NULL, NULL);
INSERT INTO `base_role_resource` VALUES (1755, 1, 1, NULL, '2019-11-08 09:53:54', NULL, NULL);
INSERT INTO `base_role_resource` VALUES (1756, 1, 4, NULL, '2019-11-08 09:53:54', NULL, NULL);
INSERT INTO `base_role_resource` VALUES (1757, 1, 11, NULL, '2019-11-08 09:53:54', NULL, NULL);
INSERT INTO `base_role_resource` VALUES (1758, 1, 12, NULL, '2019-11-08 09:53:54', NULL, NULL);
INSERT INTO `base_role_resource` VALUES (1759, 1, 13, NULL, '2019-11-08 09:53:54', NULL, NULL);
INSERT INTO `base_role_resource` VALUES (1760, 1, 14, NULL, '2019-11-08 09:53:54', NULL, NULL);
INSERT INTO `base_role_resource` VALUES (1761, 1, 5, NULL, '2019-11-08 09:53:54', NULL, NULL);
INSERT INTO `base_role_resource` VALUES (1762, 1, 23, NULL, '2019-11-08 09:53:54', NULL, NULL);
INSERT INTO `base_role_resource` VALUES (1763, 1, 24, NULL, '2019-11-08 09:53:54', NULL, NULL);
INSERT INTO `base_role_resource` VALUES (1764, 1, 25, NULL, '2019-11-08 09:53:54', NULL, NULL);
INSERT INTO `base_role_resource` VALUES (1765, 1, 26, NULL, '2019-11-08 09:53:54', NULL, NULL);
INSERT INTO `base_role_resource` VALUES (1766, 1, 6, NULL, '2019-11-08 09:53:54', NULL, NULL);
INSERT INTO `base_role_resource` VALUES (1767, 1, 27, NULL, '2019-11-08 09:53:54', NULL, NULL);
INSERT INTO `base_role_resource` VALUES (1768, 1, 28, NULL, '2019-11-08 09:53:54', NULL, NULL);
INSERT INTO `base_role_resource` VALUES (1769, 1, 29, NULL, '2019-11-08 09:53:54', NULL, NULL);
INSERT INTO `base_role_resource` VALUES (1770, 1, 30, NULL, '2019-11-08 09:53:54', NULL, NULL);
INSERT INTO `base_role_resource` VALUES (1771, 1, 7, NULL, '2019-11-08 09:53:54', NULL, NULL);
INSERT INTO `base_role_resource` VALUES (1772, 1, 31, NULL, '2019-11-08 09:53:54', NULL, NULL);
INSERT INTO `base_role_resource` VALUES (1773, 1, 32, NULL, '2019-11-08 09:53:54', NULL, NULL);
INSERT INTO `base_role_resource` VALUES (1774, 1, 33, NULL, '2019-11-08 09:53:54', NULL, NULL);
INSERT INTO `base_role_resource` VALUES (1775, 1, 34, NULL, '2019-11-08 09:53:54', NULL, NULL);
INSERT INTO `base_role_resource` VALUES (1776, 1, 8, NULL, '2019-11-08 09:53:54', NULL, NULL);
INSERT INTO `base_role_resource` VALUES (1777, 1, 48, NULL, '2019-11-08 09:53:54', NULL, NULL);
INSERT INTO `base_role_resource` VALUES (1778, 1, 9, NULL, '2019-11-08 09:53:54', NULL, NULL);
INSERT INTO `base_role_resource` VALUES (1779, 1, 10, NULL, '2019-11-08 09:53:54', NULL, NULL);
INSERT INTO `base_role_resource` VALUES (1780, 1, 2, NULL, '2019-11-08 09:53:54', NULL, NULL);
INSERT INTO `base_role_resource` VALUES (1781, 1, 49, NULL, '2019-11-08 09:53:54', NULL, NULL);
INSERT INTO `base_role_resource` VALUES (1782, 1, 50, NULL, '2019-11-08 09:53:54', NULL, NULL);
INSERT INTO `base_role_resource` VALUES (1783, 1, 51, NULL, '2019-11-08 09:53:54', NULL, NULL);
INSERT INTO `base_role_resource` VALUES (1784, 1, 52, NULL, '2019-11-08 09:53:54', NULL, NULL);
INSERT INTO `base_role_resource` VALUES (1785, 1, 53, NULL, '2019-11-08 09:53:54', NULL, NULL);
INSERT INTO `base_role_resource` VALUES (1786, 1, 3, NULL, '2019-11-08 09:53:54', NULL, NULL);
INSERT INTO `base_role_resource` VALUES (1787, 1, 37, NULL, '2019-11-08 09:53:54', NULL, NULL);
INSERT INTO `base_role_resource` VALUES (1788, 1, 15, NULL, '2019-11-08 09:53:54', NULL, NULL);
INSERT INTO `base_role_resource` VALUES (1789, 1, 16, NULL, '2019-11-08 09:53:54', NULL, NULL);
INSERT INTO `base_role_resource` VALUES (1790, 1, 17, NULL, '2019-11-08 09:53:54', NULL, NULL);
INSERT INTO `base_role_resource` VALUES (1791, 1, 18, NULL, '2019-11-08 09:53:54', NULL, NULL);
INSERT INTO `base_role_resource` VALUES (1792, 1, 21, NULL, '2019-11-08 09:53:54', NULL, NULL);
INSERT INTO `base_role_resource` VALUES (1793, 1, 38, NULL, '2019-11-08 09:53:54', NULL, NULL);
INSERT INTO `base_role_resource` VALUES (1794, 1, 39, NULL, '2019-11-08 09:53:54', NULL, NULL);
INSERT INTO `base_role_resource` VALUES (1795, 1, 40, NULL, '2019-11-08 09:53:54', NULL, NULL);
INSERT INTO `base_role_resource` VALUES (1796, 1, 41, NULL, '2019-11-08 09:53:54', NULL, NULL);
INSERT INTO `base_role_resource` VALUES (1797, 1, 42, NULL, '2019-11-08 09:53:54', NULL, NULL);
INSERT INTO `base_role_resource` VALUES (1798, 1, 22, NULL, '2019-11-08 09:53:54', NULL, NULL);
INSERT INTO `base_role_resource` VALUES (1799, 1, 43, NULL, '2019-11-08 09:53:54', NULL, NULL);
INSERT INTO `base_role_resource` VALUES (1800, 1, 44, NULL, '2019-11-08 09:53:54', NULL, NULL);
INSERT INTO `base_role_resource` VALUES (1801, 1, 45, NULL, '2019-11-08 09:53:54', NULL, NULL);
INSERT INTO `base_role_resource` VALUES (1802, 1, 54, NULL, '2019-11-08 09:53:54', NULL, NULL);
INSERT INTO `base_role_resource` VALUES (1803, 1, 60, NULL, '2019-11-08 09:53:54', NULL, NULL);
INSERT INTO `base_role_resource` VALUES (1804, 1, 62, NULL, '2019-11-08 09:53:54', NULL, NULL);
INSERT INTO `base_role_resource` VALUES (1805, 1, 63, NULL, '2019-11-08 09:53:54', NULL, NULL);
INSERT INTO `base_role_resource` VALUES (1806, 1, 64, NULL, '2019-11-08 09:53:54', NULL, NULL);
INSERT INTO `base_role_resource` VALUES (1807, 1, 65, NULL, '2019-11-08 09:53:54', NULL, NULL);
INSERT INTO `base_role_resource` VALUES (1808, 1, 67, NULL, '2019-11-08 09:53:54', NULL, NULL);
INSERT INTO `base_role_resource` VALUES (1809, 1, 61, NULL, '2019-11-08 09:53:54', NULL, NULL);
INSERT INTO `base_role_resource` VALUES (1810, 1, 66, NULL, '2019-11-08 09:53:54', NULL, NULL);
INSERT INTO `base_role_resource` VALUES (1811, 1, 68, NULL, '2019-11-08 09:53:54', NULL, NULL);
INSERT INTO `base_role_resource` VALUES (1812, 1, 69, NULL, '2019-11-08 09:53:54', NULL, NULL);
INSERT INTO `base_role_resource` VALUES (1813, 1, 76, NULL, '2019-11-08 09:53:54', NULL, NULL);
INSERT INTO `base_role_resource` VALUES (1814, 1, 77, NULL, '2019-11-08 09:53:54', NULL, NULL);
INSERT INTO `base_role_resource` VALUES (1815, 1, 82, NULL, '2019-11-08 09:53:54', NULL, NULL);
INSERT INTO `base_role_resource` VALUES (1816, 1, 83, NULL, '2019-11-08 09:53:54', NULL, NULL);
INSERT INTO `base_role_resource` VALUES (1817, 1, 70, NULL, '2019-11-08 09:53:54', NULL, NULL);
INSERT INTO `base_role_resource` VALUES (1818, 1, 78, NULL, '2019-11-08 09:53:54', NULL, NULL);
INSERT INTO `base_role_resource` VALUES (1819, 1, 79, NULL, '2019-11-08 09:53:54', NULL, NULL);
INSERT INTO `base_role_resource` VALUES (1820, 1, 80, NULL, '2019-11-08 09:53:54', NULL, NULL);
INSERT INTO `base_role_resource` VALUES (1821, 1, 81, NULL, '2019-11-08 09:53:54', NULL, NULL);
INSERT INTO `base_role_resource` VALUES (1822, 1, 71, NULL, '2019-11-08 09:53:54', NULL, NULL);
INSERT INTO `base_role_resource` VALUES (1823, 1, 72, NULL, '2019-11-08 09:53:54', NULL, NULL);
INSERT INTO `base_role_resource` VALUES (1824, 1, 73, NULL, '2019-11-08 09:53:54', NULL, NULL);
INSERT INTO `base_role_resource` VALUES (1825, 1, 74, NULL, '2019-11-08 09:53:54', NULL, NULL);
INSERT INTO `base_role_resource` VALUES (1826, 1, 75, NULL, '2019-11-08 09:53:54', NULL, NULL);
INSERT INTO `base_role_resource` VALUES (1827, 1, 84, NULL, '2019-11-08 09:53:54', NULL, NULL);
INSERT INTO `base_role_resource` VALUES (1828, 1, 87, NULL, '2019-11-08 09:53:54', NULL, NULL);
INSERT INTO `base_role_resource` VALUES (1829, 1, 98, NULL, '2019-11-08 09:53:54', NULL, NULL);
INSERT INTO `base_role_resource` VALUES (1830, 1, 99, NULL, '2019-11-08 09:53:54', NULL, NULL);
INSERT INTO `base_role_resource` VALUES (1831, 1, 100, NULL, '2019-11-08 09:53:54', NULL, NULL);
INSERT INTO `base_role_resource` VALUES (1832, 1, 101, NULL, '2019-11-08 09:53:54', NULL, NULL);
INSERT INTO `base_role_resource` VALUES (1833, 1, 88, NULL, '2019-11-08 09:53:54', NULL, NULL);
INSERT INTO `base_role_resource` VALUES (1834, 1, 89, NULL, '2019-11-08 09:53:54', NULL, NULL);
INSERT INTO `base_role_resource` VALUES (1835, 1, 102, NULL, '2019-11-08 09:53:54', NULL, NULL);
INSERT INTO `base_role_resource` VALUES (1836, 1, 103, NULL, '2019-11-08 09:53:54', NULL, NULL);
INSERT INTO `base_role_resource` VALUES (1837, 1, 104, NULL, '2019-11-08 09:53:54', NULL, NULL);
INSERT INTO `base_role_resource` VALUES (1838, 1, 105, NULL, '2019-11-08 09:53:54', NULL, NULL);
INSERT INTO `base_role_resource` VALUES (1839, 1, 90, NULL, '2019-11-08 09:53:54', NULL, NULL);
INSERT INTO `base_role_resource` VALUES (1840, 1, 91, NULL, '2019-11-08 09:53:54', NULL, NULL);
INSERT INTO `base_role_resource` VALUES (1841, 1, 110, NULL, '2019-11-08 09:53:54', NULL, NULL);
INSERT INTO `base_role_resource` VALUES (1842, 1, 111, NULL, '2019-11-08 09:53:54', NULL, NULL);
INSERT INTO `base_role_resource` VALUES (1843, 1, 112, NULL, '2019-11-08 09:53:54', NULL, NULL);
INSERT INTO `base_role_resource` VALUES (1844, 1, 113, NULL, '2019-11-08 09:53:54', NULL, NULL);
INSERT INTO `base_role_resource` VALUES (1845, 1, 92, NULL, '2019-11-08 09:53:54', NULL, NULL);
INSERT INTO `base_role_resource` VALUES (1846, 1, 114, NULL, '2019-11-08 09:53:54', NULL, NULL);
INSERT INTO `base_role_resource` VALUES (1847, 1, 115, NULL, '2019-11-08 09:53:54', NULL, NULL);
INSERT INTO `base_role_resource` VALUES (1848, 1, 116, NULL, '2019-11-08 09:53:54', NULL, NULL);
INSERT INTO `base_role_resource` VALUES (1849, 1, 117, NULL, '2019-11-08 09:53:54', NULL, NULL);
INSERT INTO `base_role_resource` VALUES (1850, 1, 93, NULL, '2019-11-08 09:53:54', NULL, NULL);
INSERT INTO `base_role_resource` VALUES (1851, 1, 94, NULL, '2019-11-08 09:53:54', NULL, NULL);
INSERT INTO `base_role_resource` VALUES (1852, 1, 106, NULL, '2019-11-08 09:53:54', NULL, NULL);
INSERT INTO `base_role_resource` VALUES (1853, 1, 107, NULL, '2019-11-08 09:53:54', NULL, NULL);
INSERT INTO `base_role_resource` VALUES (1854, 1, 108, NULL, '2019-11-08 09:53:54', NULL, NULL);
INSERT INTO `base_role_resource` VALUES (1855, 1, 109, NULL, '2019-11-08 09:53:54', NULL, NULL);
INSERT INTO `base_role_resource` VALUES (1856, 1, 95, NULL, '2019-11-08 09:53:54', NULL, NULL);
INSERT INTO `base_role_resource` VALUES (1857, 1, 96, NULL, '2019-11-08 09:53:54', NULL, NULL);
INSERT INTO `base_role_resource` VALUES (1858, 1, 118, NULL, '2019-11-08 09:53:54', NULL, NULL);
INSERT INTO `base_role_resource` VALUES (1859, 1, 119, NULL, '2019-11-08 09:53:54', NULL, NULL);
INSERT INTO `base_role_resource` VALUES (1860, 1, 120, NULL, '2019-11-08 09:53:54', NULL, NULL);
INSERT INTO `base_role_resource` VALUES (1861, 1, 121, NULL, '2019-11-08 09:53:54', NULL, NULL);
INSERT INTO `base_role_resource` VALUES (1862, 1, 97, NULL, '2019-11-08 09:53:54', NULL, NULL);
INSERT INTO `base_role_resource` VALUES (1863, 1, 122, NULL, '2019-11-08 09:53:54', NULL, NULL);
INSERT INTO `base_role_resource` VALUES (1864, 1, 123, NULL, '2019-11-08 09:53:54', NULL, NULL);
INSERT INTO `base_role_resource` VALUES (1865, 1, 124, NULL, '2019-11-08 09:53:54', NULL, NULL);
INSERT INTO `base_role_resource` VALUES (1866, 1, 125, NULL, '2019-11-08 09:53:54', NULL, NULL);
INSERT INTO `base_role_resource` VALUES (2103, 1, 129, NULL, '2019-11-09 06:29:46', NULL, NULL);
INSERT INTO `base_role_resource` VALUES (2104, 1, 130, NULL, '2019-11-09 06:29:46', NULL, NULL);
INSERT INTO `base_role_resource` VALUES (2105, 1, 131, NULL, '2019-11-09 06:29:46', NULL, NULL);
INSERT INTO `base_role_resource` VALUES (2106, 1, 132, NULL, '2019-11-09 06:29:46', NULL, NULL);
INSERT INTO `base_role_resource` VALUES (2107, 1, 133, NULL, '2019-11-09 06:29:46', NULL, NULL);
INSERT INTO `base_role_resource` VALUES (2108, 1, 134, NULL, '2019-11-09 06:29:46', NULL, NULL);
INSERT INTO `base_role_resource` VALUES (2109, 1, 135, NULL, '2019-11-09 06:29:46', NULL, NULL);
INSERT INTO `base_role_resource` VALUES (2110, 1, 136, NULL, '2019-11-09 06:29:46', NULL, NULL);

-- ----------------------------
-- Table structure for base_sys
-- ----------------------------
DROP TABLE IF EXISTS `base_sys`;
CREATE TABLE `base_sys`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `sys_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `sys_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '编码',
  `sort` int(8) NULL DEFAULT NULL COMMENT '排序',
  `status` tinyint(2) NULL DEFAULT 1 COMMENT '状态（0：禁用；1：启用）',
  `is_deleted` tinyint(2) NULL DEFAULT 0 COMMENT '是否删除（0：未删除，1：已删除）',
  `remark` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `creator_id` bigint(20) NULL DEFAULT NULL COMMENT '创建者id',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间 ',
  `updater_id` bigint(20) NULL DEFAULT NULL COMMENT '更新者id',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `sys_name`(`sys_name`) USING BTREE,
  UNIQUE INDEX `sys_code`(`sys_code`) USING BTREE,
  INDEX `i_id`(`id`) USING BTREE,
  INDEX `i_sys_name`(`sys_name`) USING BTREE,
  INDEX `i_sys_code`(`sys_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for base_user
-- ----------------------------
DROP TABLE IF EXISTS `base_user`;
CREATE TABLE `base_user`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `real_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '真实姓名',
  `type` tinyint(2) NULL DEFAULT 1 COMMENT '用户类型（1：内部用户；2：外部用户）',
  `source` tinyint(2) NULL DEFAULT 0 COMMENT '来源（0：线上，1：线下）',
  `status` tinyint(2) NULL DEFAULT 1 COMMENT '状态（0：禁用；1：启用；）',
  `is_deleted` tinyint(2) NULL DEFAULT 0 COMMENT '是否删除（0：未删除，1：已删除）',
  `creator_id` bigint(20) NULL DEFAULT NULL COMMENT '创建者id',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间 ',
  `updater_id` bigint(20) NULL DEFAULT NULL COMMENT '更新者id',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `user_name`(`user_name`) USING BTREE,
  UNIQUE INDEX `phone`(`phone`) USING BTREE,
  INDEX `i_id`(`id`) USING BTREE,
  INDEX `i_user_name`(`user_name`) USING BTREE,
  INDEX `i_email`(`email`) USING BTREE,
  INDEX `i_phone`(`phone`) USING BTREE,
  INDEX `i_real_name`(`real_name`) USING BTREE,
  INDEX `i_status`(`status`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 38 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of base_user
-- ----------------------------
INSERT INTO `base_user` VALUES (1, 'admin', '$2a$10$a/H1hnjmmWyJACzXtQbWseIUFcKct0zY6h2XJfD9RsPnF8HAfG9ym', '853383690@qq.com', '17667846626', '少校', 1, 0, 1, 0, 1, '2019-11-11 04:05:57', NULL, '2019-06-04 09:14:30');
INSERT INTO `base_user` VALUES (21, 'test', '$2a$12$hqvwTemFtZhSrxzNvlD5pOydljr89pHPjqKqo2dsGP.R0pSVK8yqu', 'test30@qq.com', '17654825510', 'test TEST', 1, 0, 1, 0, NULL, '2019-11-08 09:52:43', NULL, NULL);
INSERT INTO `base_user` VALUES (28, 'customer', '$2a$12$bhgdZRv42NEpfaaNYrKEve2dfARmL0k1rPMVJ3JnT8LojFjZCJkpW', '11001@qq.com', '17097219506', '客户十一郎', 2, 0, 1, 0, NULL, '2019-07-04 18:36:39', 1, '2019-11-21 10:59:23');
INSERT INTO `base_user` VALUES (30, '13864206456', '$2a$12$7Tf/xMoHXh8jaYkPR0OQjOgTTZzfbbZXh.CY1IvKr629JV1YuA5XG', '22@qq.com', '13864206456', '客户2', 2, 0, 1, 0, NULL, '2019-07-20 16:45:13', NULL, NULL);
INSERT INTO `base_user` VALUES (31, 'customer3', '$2a$10$a/H1hnjmmWyJACzXtQbWseIUFcKct0zY6h2XJfD9RsPnF8HAfG9ym', '220@qq.com', '17422222221', '客户3', 2, 0, 0, 0, NULL, '2019-07-05 16:04:41', NULL, NULL);
INSERT INTO `base_user` VALUES (32, 'test2', '$2a$10$a/H1hnjmmWyJACzXtQbWseIUFcKct0zY6h2XJfD9RsPnF8HAfG9ym', '85@qq.com', '17097219501', '少年2', 1, 0, 1, 0, NULL, '2019-07-11 12:15:09', NULL, NULL);
INSERT INTO `base_user` VALUES (33, 'aat3', '$2a$10$a/H1hnjmmWyJACzXtQbWseIUFcKct0zY6h2XJfD9RsPnF8HAfG9ym', '22@qq.com', '17555555525', '少dd2', 1, 0, 1, 0, NULL, '2019-06-25 17:01:03', NULL, NULL);
INSERT INTO `base_user` VALUES (34, 'test4', '$2a$10$a/H1hnjmmWyJACzXtQbWseIUFcKct0zY6h2XJfD9RsPnF8HAfG9ym', '022@qq.com', '17555555520', 'test42', 1, 0, 0, 1, NULL, '2019-10-28 02:36:18', NULL, NULL);
INSERT INTO `base_user` VALUES (35, '客户001', '$2a$12$j18g.DkF9Xkka5Aom.n.L.gs3looRA9.ab1ak/ew1unAyt8C9fmze', '20@qq.com', '17455255525', 'kehu001', 2, 0, 0, 0, NULL, '2019-07-05 10:09:25', NULL, NULL);
INSERT INTO `base_user` VALUES (36, '客户002', '$2a$12$9Y42qFU/CbMcw/JXKB2KFeRsTJwFeBcosBvvLTmmmKroHBW9KXLhq', '2011002@qq.com', '17455225532', 'kehu002', 2, 0, 1, 0, NULL, '2019-07-20 16:51:59', NULL, NULL);
INSERT INTO `base_user` VALUES (37, '2019100801', '$2a$12$XqP76/jVjKEc/kt2utAxlOZL25LfPHkmg9Q71pckL3XxvnmOFsu9i', '2019100801@qq.com', '17667846625', '123', 2, 0, 1, 0, NULL, '2019-11-08 10:09:32', NULL, NULL);

-- ----------------------------
-- Table structure for base_user_org
-- ----------------------------
DROP TABLE IF EXISTS `base_user_org`;
CREATE TABLE `base_user_org`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `org_id` bigint(20) NOT NULL COMMENT '机构id',
  `creator_id` bigint(20) NULL DEFAULT NULL COMMENT '创建者id',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间 ',
  `updater_id` bigint(20) NULL DEFAULT NULL COMMENT '更新者id',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `i_user_id`(`user_id`) USING BTREE,
  INDEX `i_org_id`(`org_id`) USING BTREE,
  CONSTRAINT `FK_user_org_org_id` FOREIGN KEY (`org_id`) REFERENCES `base_org` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_user_org_user_id` FOREIGN KEY (`user_id`) REFERENCES `base_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 65 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户机构表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of base_user_org
-- ----------------------------
INSERT INTO `base_user_org` VALUES (34, 33, 1, NULL, '2019-06-25 17:01:03', NULL, NULL);
INSERT INTO `base_user_org` VALUES (57, 32, 10, NULL, '2019-07-11 12:15:09', NULL, NULL);
INSERT INTO `base_user_org` VALUES (62, 21, 3, NULL, '2019-11-08 09:52:43', NULL, NULL);
INSERT INTO `base_user_org` VALUES (64, 1, 10, NULL, '2019-11-11 04:05:57', NULL, NULL);

-- ----------------------------
-- Table structure for base_user_role
-- ----------------------------
DROP TABLE IF EXISTS `base_user_role`;
CREATE TABLE `base_user_role`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `role_id` bigint(20) NOT NULL COMMENT '角色id',
  `creator_id` bigint(20) NULL DEFAULT NULL COMMENT '创建者id',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间 ',
  `updater_id` bigint(20) NULL DEFAULT NULL COMMENT '更新者id',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `i_user_id`(`user_id`) USING BTREE,
  INDEX `i_role_id`(`role_id`) USING BTREE,
  CONSTRAINT `FK_user_role_role_id` FOREIGN KEY (`role_id`) REFERENCES `base_role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_user_role_user_id` FOREIGN KEY (`user_id`) REFERENCES `base_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 117 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户角色表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of base_user_role
-- ----------------------------
INSERT INTO `base_user_role` VALUES (81, 33, 2, NULL, '2019-06-25 17:01:03', NULL, NULL);
INSERT INTO `base_user_role` VALUES (105, 32, 1, NULL, '2019-07-11 12:15:09', NULL, NULL);
INSERT INTO `base_user_role` VALUES (106, 32, 2, NULL, '2019-07-11 12:15:09', NULL, NULL);
INSERT INTO `base_user_role` VALUES (112, 21, 1, NULL, '2019-11-08 09:52:43', NULL, NULL);
INSERT INTO `base_user_role` VALUES (113, 21, 2, NULL, '2019-11-08 09:52:43', NULL, NULL);
INSERT INTO `base_user_role` VALUES (114, 21, 3, NULL, '2019-11-08 09:52:43', NULL, NULL);
INSERT INTO `base_user_role` VALUES (116, 1, 1, NULL, '2019-11-11 04:05:57', NULL, NULL);

-- ----------------------------
-- Table structure for loan_activi
-- ----------------------------
DROP TABLE IF EXISTS `loan_activi`;
CREATE TABLE `loan_activi`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(20) NOT NULL COMMENT '发布人id',
  `pri_person` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '主负责人',
  `safe_person` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '安全负责人',
  `flag` int(3) NULL DEFAULT NULL COMMENT '0：跳转url；1：显示内容',
  `banner_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pic_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '活动链接或图片',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '活动内容',
  `budget` decimal(18, 2) NULL DEFAULT NULL COMMENT '费用预算',
  `start_time` datetime(0) NULL DEFAULT NULL COMMENT '活动展示时间',
  `end_time` datetime(0) NULL DEFAULT NULL COMMENT '活动展示时间',
  `valid_start_time` datetime(0) NULL DEFAULT NULL COMMENT '活动有效时间',
  `valid_end_time` datetime(0) NULL DEFAULT NULL COMMENT '活动有效时间',
  `status` int(255) NULL DEFAULT NULL COMMENT '状态',
  `comment` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '售后评论',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `creator_id` bigint(20) NULL DEFAULT NULL COMMENT '创建者id',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间 ',
  `updater_id` bigint(20) NULL DEFAULT NULL COMMENT '更新者id',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `i_id`(`id`) USING BTREE,
  INDEX `i_user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '活动表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of loan_activi
-- ----------------------------
INSERT INTO `loan_activi` VALUES (1, 1, '少校', 'ddd', 0, 'http://www.zhonganholding.com/images/news/10.jpg', 'https://user-gold-cdn.xitu.io/2019/10/22/16df3936ca551ef0?imageView2/1/w/1304/h/734/q/85/format/webp/interlace/1', '', 20.00, '2019-10-01 11:00:00', '2019-11-03 10:00:00', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `loan_activi` VALUES (2, 1, '订单', '大概', 0, 'http://www.zhonganholding.com/images/news/9.jpg', 'https://user-gold-cdn.xitu.io/2019/10/22/16df3936ca551ef0?imageView2/1/w/1304/h/734/q/85/format/webp/interlace/1', '', 100.00, '2019-10-01 11:00:00', '2019-11-03 10:00:00', NULL, NULL, 1, '测试', '测试', 1, '2019-10-06 22:52:16', NULL, NULL);
INSERT INTO `loan_activi` VALUES (3, 1, '电动蝶阀v', '的', 0, 'http://www.zhonganholding.com/images/news/8.jpg', 'https://user-gold-cdn.xitu.io/2019/10/22/16df3936ca551ef0?imageView2/1/w/1304/h/734/q/85/format/webp/interlace/1', '', 100.00, '2019-10-01 11:00:00', '2019-11-03 10:00:00', '2019-10-01 11:00:00', '2019-11-11 10:00:00', 1, '册s', '测试', 1, '2019-10-06 23:36:59', NULL, NULL);
INSERT INTO `loan_activi` VALUES (4, 1, 'ddd', '方法', 0, 'http://www.zhonganholding.com/images/news/7.jpg', 'https://user-gold-cdn.xitu.io/2019/10/22/16df3936ca551ef0?imageView2/1/w/1304/h/734/q/85/format/webp/interlace/1', '', 3999.00, '2019-10-11 11:00:00', '2019-11-05 10:00:00', '2019-10-10 11:00:00', '2019-11-21 10:00:00', 0, '测试测试c', '测试12', 1, '2019-10-06 23:56:08', NULL, NULL);
INSERT INTO `loan_activi` VALUES (5, 1, '打的电话', '哈哈', 0, 'http://www.zhonganholding.com/images/news/6.jpg', 'https://user-gold-cdn.xitu.io/2019/10/22/16df3936ca551ef0?imageView2/1/w/1304/h/734/q/85/format/webp/interlace/1', '', 122.00, '2019-10-08 11:00:00', '2019-11-12 10:00:00', '2019-10-18 11:00:00', '2019-11-20 10:00:00', 0, '测试', '测试1', 1, '2019-10-07 06:33:26', NULL, NULL);
INSERT INTO `loan_activi` VALUES (6, 1, '测试', '123', 0, 'http://www.zhonganholding.com/images/news/5.jpg', 'https://user-gold-cdn.xitu.io/2019/10/22/16df3936ca551ef0?imageView2/1/w/1304/h/734/q/85/format/webp/interlace/1', '', 10.00, '2019-11-02 11:00:00', '2019-11-12 10:00:00', '2019-10-18 11:00:00', '2019-11-09 10:00:00', 0, '测试', '测试', 1, '2019-10-07 07:40:49', NULL, NULL);
INSERT INTO `loan_activi` VALUES (7, 1, 'ce', 'ce', 0, 'http://www.zhonganholding.com/images/news/4.jpg', 'https://user-gold-cdn.xitu.io/2019/10/22/16df3936ca551ef0?imageView2/1/w/1304/h/734/q/85/format/webp/interlace/1', '', 122.00, '2001-01-31 10:00:00', '1999-12-31 10:00:00', '2001-01-31 10:00:00', '1999-12-31 10:00:00', 0, '测试', '测试1', 1, '2019-10-07 08:01:47', NULL, NULL);
INSERT INTO `loan_activi` VALUES (8, 1, 'ce', 'ce', 0, 'http://www.zhonganholding.com/images/news/3.jpg', 'https://user-gold-cdn.xitu.io/2019/10/22/16df3936ca551ef0?imageView2/1/w/1304/h/734/q/85/format/webp/interlace/1', '', 122.00, '2001-01-31 10:00:00', '1999-12-31 10:00:00', '2001-01-31 10:00:00', '1999-12-31 10:00:00', 0, '测试', '测试1', 1, '2019-10-07 08:01:52', NULL, NULL);
INSERT INTO `loan_activi` VALUES (9, 1, '111', '111', 0, 'http://www.zhonganholding.com/images/news/2.jpg', 'https://mp.weixin.qq.com/s/xxgaWh50CpmZLdhswaKESQ', '', 1111.00, '2019-09-30 11:00:00', '2019-11-29 10:00:00', '2019-09-30 11:00:00', '2019-11-29 10:00:00', 1, '售后', '备注', 1, '2019-10-21 10:44:07', NULL, NULL);
INSERT INTO `loan_activi` VALUES (11, 1, '11', '11', 1, 'http://www.zhonganholding.com/images/news/1.jpg', '', '<p>2019年1月27日，是一个招财进宝，旺铺生金的好日子。在这样一个大吉大利，大喜大顺的日子里，各位嘉宾及众安实业领导相聚在束氏茶界江西路店，为茶楼的开业喝彩祝福。</p>\n<p><img src=\"http://www.zhonganholding.com/images/news/1.jpg\" alt=\"\" width=\"708\" height=\"528\" /></p>\n<p>中国是茶的故乡,也是茶文化的发源地,它源远流长,有着上千年的历史,茶作为一种绿色健康的饮品，早在17世纪就风靡全球!近年来,随着中国国力的增强,而茶文化也随着一带一路的政策再次走向全世界,在茶行业被专家誉为未来20年最具发展潜力的行业背景下,我们的茶楼应运而生!</p>\n<p><img src=\"http://www.zhonganholding.com/images/news/2.jpg\" alt=\"\" width=\"796\" height=\"591\" /></p>\n<p>束氏茶界江西路店&middot;店长毕文浩女士，自幼在崂山茶园长大，从小对茶文化耳濡目染。2014年入职众安，踏入职场，但对茶的热爱未曾丝毫减少，有梦想就会有希望，2018年，众安实业与束氏茶界强强合作，毕文浩女士把握机遇，荣升茶楼店长。</p>\n<p>&nbsp;</p>\n<p>束氏茶界,由香港上市公司永乐家电联合创始人束为女士创办,秉承合作共赢,创新共享,追求卓越,创造价值的理念,开启品茶之旅!</p>\n<p>&nbsp;</p>\n<p>束氏茶界的产品秉着健康环保，无污染的原则。束氏茶界团队奔波于茶山之中瓷都之地，联合原产地万亩茶园，建设无尘工厂，进行高质量，多渠道质量保证体系。束氏茶界同工厂和茶园垂直对接，价格优势明显性价比高。</p>\n<p>&nbsp;</p>\n<p>束氏茶界的产品包括茶，茶器具，茶配件，茶家居等全品类！其中60%的产品定位终端消费者,30%定位在中高端10%是定位的高端收藏品。对终端消费的产品来说,我们提供艺术与生活的兼容。第二我们30%的东西,我们在艺术与生活的兼容基础上,我们还要有送礼与自用的兼容。第三个10%收藏与使用的兼容。</p>\n<p>&nbsp;</p>\n<p>我们茶楼的开业，将来为爱茶人士提供一个茶文化传播的平台；商务人士社交互动的平台；专业人士分享鉴赏的平台；玩家收藏寻宝结缘交流的平台。在快节奏生活的今天，让更多人爱上茶。</p>\n<p>&nbsp;</p>\n<p>开业期间，束氏茶界的茶艺师为大家带了精彩儒雅的茶艺表演，只见龙泉青瓷碗中，片片嫩茶犹如雀舌，色泽墨绿，碧叶中透出阵阵幽香~</p>\n<p>&nbsp;</p>\n<p>茶好客自来，虽然今天只是试营业，但丝毫不影响宾客们对于茶的喜爱，大家挑选着，品味着，如获至宝。</p>\n<p>&nbsp;</p>\n<p>冬季，是一个享受收获、孕育生机的季节。在事业的奋斗历程中，冬季就是一个加油站，在冬季里，我们开拓市场，创业经营。茶楼的开业，将来为爱茶人士提供一个茶文化传播的平台；商务人士社交互动的平台；专业人士分享鉴赏的平台；玩家收藏寻宝结缘交流的平台。在快节奏生活的今天，让更多人爱上茶。</p>', 11.00, '2019-09-30 11:00:00', '2019-11-29 10:00:00', '2019-10-09 11:00:00', '2019-11-19 10:00:00', 1, '售后评论', '备注', 1, '2019-10-23 08:57:31', NULL, NULL);

-- ----------------------------
-- Table structure for loan_activi_org
-- ----------------------------
DROP TABLE IF EXISTS `loan_activi_org`;
CREATE TABLE `loan_activi_org`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `activi_id` bigint(20) NULL DEFAULT NULL COMMENT '活动id',
  `org_id` bigint(20) NULL DEFAULT NULL COMMENT 'org_id',
  `creator_id` bigint(20) NULL DEFAULT NULL COMMENT '创建者id',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间 ',
  `updater_id` bigint(20) NULL DEFAULT NULL COMMENT '更新者id',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `i_id`(`id`) USING BTREE,
  INDEX `i_user_id`(`activi_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 58 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '活动与组织架构关联表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of loan_activi_org
-- ----------------------------
INSERT INTO `loan_activi_org` VALUES (50, 7, 1, 1, '2019-10-21 10:40:51', NULL, NULL);
INSERT INTO `loan_activi_org` VALUES (51, 7, 10, 1, '2019-10-21 10:40:51', NULL, NULL);
INSERT INTO `loan_activi_org` VALUES (52, 9, 1, 1, '2019-10-21 10:44:07', NULL, NULL);
INSERT INTO `loan_activi_org` VALUES (53, 9, 10, 1, '2019-10-21 10:44:07', NULL, NULL);
INSERT INTO `loan_activi_org` VALUES (54, 11, 10, 1, '2019-10-23 08:45:03', NULL, NULL);
INSERT INTO `loan_activi_org` VALUES (55, 11, 1, 1, '2019-10-23 08:45:03', NULL, NULL);
INSERT INTO `loan_activi_org` VALUES (56, 8, 1, 1, '2019-10-23 08:57:31', NULL, NULL);
INSERT INTO `loan_activi_org` VALUES (57, 8, 10, 1, '2019-10-23 08:57:31', NULL, NULL);

-- ----------------------------
-- Table structure for loan_activi_record
-- ----------------------------
DROP TABLE IF EXISTS `loan_activi_record`;
CREATE TABLE `loan_activi_record`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `activi_id` bigint(20) NULL DEFAULT NULL COMMENT 'activi_id',
  `user_id` bigint(255) NULL DEFAULT NULL COMMENT 'user_id',
  `creator_id` bigint(20) NULL DEFAULT NULL COMMENT '创建者id',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间 ',
  `updater_id` bigint(20) NULL DEFAULT NULL COMMENT '更新者id',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '活动报名记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for loan_appraise
-- ----------------------------
DROP TABLE IF EXISTS `loan_appraise`;
CREATE TABLE `loan_appraise`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `content` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '内容',
  `creator_id` bigint(20) NULL DEFAULT NULL COMMENT '创建者id',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间 ',
  `updater_id` bigint(20) NULL DEFAULT NULL COMMENT '更新者id',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '评价管理' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of loan_appraise
-- ----------------------------
INSERT INTO `loan_appraise` VALUES (1, 1, '10', NULL, NULL, NULL, NULL);
INSERT INTO `loan_appraise` VALUES (2, 1, '1', 1, '2019-10-05 00:16:05', NULL, NULL);

-- ----------------------------
-- Table structure for loan_collect
-- ----------------------------
DROP TABLE IF EXISTS `loan_collect`;
CREATE TABLE `loan_collect`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `collect_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `collect_content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `collect_pic` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `creator_id` bigint(20) NULL DEFAULT NULL COMMENT '创建者id',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间 ',
  `updater_id` bigint(20) NULL DEFAULT NULL COMMENT '更新者id',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '征集' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of loan_collect
-- ----------------------------
INSERT INTO `loan_collect` VALUES (1, '最希望商城上新的商品是什么？', '最希望商城上新的商品是什么？\n1、苹果手机  2、一箱苹果', 'http://x0.ifengimg.com/res/2019/C617CFF5AA524AE46BB9507EB708DDB044A6265A_size12_w490_h179.jpeg', 1, '2019-10-22 00:13:47', NULL, NULL);

-- ----------------------------
-- Table structure for loan_collect_record
-- ----------------------------
DROP TABLE IF EXISTS `loan_collect_record`;
CREATE TABLE `loan_collect_record`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `collect_id` bigint(20) NULL DEFAULT NULL COMMENT 'collect_id',
  `user_id` bigint(255) NULL DEFAULT NULL COMMENT 'user_id',
  `answer` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '选择答案',
  `creator_id` bigint(20) NULL DEFAULT NULL COMMENT '创建者id',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间 ',
  `updater_id` bigint(20) NULL DEFAULT NULL COMMENT '更新者id',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '征集记录' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of loan_collect_record
-- ----------------------------
INSERT INTO `loan_collect_record` VALUES (1, 1, 28, '12313', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for loan_contract
-- ----------------------------
DROP TABLE IF EXISTS `loan_contract`;
CREATE TABLE `loan_contract`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `contract_number` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '合同编号',
  `contract_term` int(11) NULL DEFAULT NULL COMMENT '合同期限',
  `contract_rate` decimal(10, 2) NULL DEFAULT NULL COMMENT '合同利率',
  `contract_status` int(11) NULL DEFAULT 1 COMMENT '合同状态（0：未使用，1：使用中，2：已使用，3：已赎回）',
  `contract_locate` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '合同位置',
  `remark` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `creator_id` bigint(20) NULL DEFAULT NULL COMMENT '创建者id',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间 ',
  `updater_id` bigint(20) NULL DEFAULT NULL COMMENT '更新者id',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `i_contract_number`(`contract_number`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '合同管理' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of loan_contract
-- ----------------------------
INSERT INTO `loan_contract` VALUES (1, '20190922', 12, 0.50, 1, '0.8', '122', NULL, '2019-09-22 22:41:58', NULL, NULL);
INSERT INTO `loan_contract` VALUES (3, '10233', 1, 0.00, 1, 'ce', '1', NULL, NULL, NULL, NULL);
INSERT INTO `loan_contract` VALUES (4, '111', 11, 0.00, 1, '111', '11', NULL, NULL, NULL, NULL);
INSERT INTO `loan_contract` VALUES (5, '33333', 3, 0.40, 1, '1', '2', NULL, NULL, NULL, NULL);
INSERT INTO `loan_contract` VALUES (6, '9333', 3, 0.01, 1, '测试', '测试1', NULL, NULL, NULL, NULL);
INSERT INTO `loan_contract` VALUES (7, '4444', 1, 0.00, 1, '测试', '33', NULL, NULL, NULL, NULL);
INSERT INTO `loan_contract` VALUES (8, '5555', 4, 0.02, 1, '测试', '1', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for loan_marketing
-- ----------------------------
DROP TABLE IF EXISTS `loan_marketing`;
CREATE TABLE `loan_marketing`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(20) NOT NULL COMMENT '发布人id',
  `market_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '标题',
  `market_annual_ratio` decimal(18, 2) NULL DEFAULT NULL COMMENT '年化比例',
  `start_time` datetime(0) NULL DEFAULT NULL COMMENT '结算时间',
  `end_time` datetime(0) NULL DEFAULT NULL COMMENT '结算时间',
  `status` int(3) NULL DEFAULT NULL COMMENT '状态',
  `creator_id` bigint(20) NULL DEFAULT NULL COMMENT '创建者id',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间 ',
  `updater_id` bigint(20) NULL DEFAULT NULL COMMENT '更新者id',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '营销' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of loan_marketing
-- ----------------------------
INSERT INTO `loan_marketing` VALUES (5, 1, NULL, 1.20, '2019-10-17 11:00:00', '2019-11-27 10:00:00', 1, 1, '2019-10-07 05:05:43', NULL, NULL);
INSERT INTO `loan_marketing` VALUES (6, 1, NULL, 3.40, '2019-10-02 11:00:00', '2019-11-06 10:00:00', 0, 1, '2019-10-07 05:24:52', NULL, NULL);
INSERT INTO `loan_marketing` VALUES (7, 1, NULL, 1.20, '2019-10-02 11:00:00', '2019-11-03 10:00:00', 0, 1, '2019-10-09 08:51:22', NULL, NULL);

-- ----------------------------
-- Table structure for loan_notice
-- ----------------------------
DROP TABLE IF EXISTS `loan_notice`;
CREATE TABLE `loan_notice`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `notice_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '公告标题',
  `notice_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '公告内容',
  `status` int(2) NULL DEFAULT NULL COMMENT '状态',
  `creator_id` bigint(20) NULL DEFAULT NULL COMMENT '创建者id',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间 ',
  `updater_id` bigint(20) NULL DEFAULT NULL COMMENT '更新者id',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of loan_notice
-- ----------------------------
INSERT INTO `loan_notice` VALUES (1, '公告测试', '全员公告测试主文本内容', 1, 1, '2019-10-21 23:28:19', NULL, NULL);
INSERT INTO `loan_notice` VALUES (2, '全体注意啦，双11打折了', ' 222全员公告测试主文本内容2222222', 1, 1, '2019-10-21 23:33:24', NULL, NULL);

-- ----------------------------
-- Table structure for loan_reserve
-- ----------------------------
DROP TABLE IF EXISTS `loan_reserve`;
CREATE TABLE `loan_reserve`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `pic` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图标',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
  `service_start_time` time(0) NULL DEFAULT NULL COMMENT '营业时间',
  `service_end_time` time(0) NULL DEFAULT NULL,
  `stock` int(255) NULL DEFAULT NULL COMMENT '库存',
  `status` int(255) NULL DEFAULT NULL COMMENT '营业状态',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '地址',
  `creator_id` bigint(20) NULL DEFAULT NULL COMMENT '创建者id',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间 ',
  `updater_id` bigint(20) NULL DEFAULT NULL COMMENT '更新者id',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '预定' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of loan_reserve
-- ----------------------------
INSERT INTO `loan_reserve` VALUES (1, 'http://www.shushitea.com/images/logo.png', '束式茶界', '20:22:13', '20:22:18', 999, 1, '青岛', 1, '2019-10-25 20:22:38', NULL, NULL);
INSERT INTO `loan_reserve` VALUES (2, 'http://www.zhonganholding.com/images/top_logos/logo06.gif', '健康管理', '20:23:16', '20:23:21', 999, 1, '青豆2', 1, '2019-10-25 20:23:34', NULL, NULL);

-- ----------------------------
-- Table structure for loan_reserve_record
-- ----------------------------
DROP TABLE IF EXISTS `loan_reserve_record`;
CREATE TABLE `loan_reserve_record`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `reserve_id` bigint(11) NULL DEFAULT NULL COMMENT '预定id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `sex` int(255) NULL DEFAULT NULL COMMENT '性别',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `reserve_time` datetime(0) NULL DEFAULT NULL COMMENT '预定时间',
  `num` int(11) NULL DEFAULT NULL COMMENT '预定人数',
  `status` int(255) NULL DEFAULT NULL COMMENT '状态',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `creator_id` bigint(20) NULL DEFAULT NULL COMMENT '创建者id',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间 ',
  `updater_id` bigint(20) NULL DEFAULT NULL COMMENT '更新者id',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '预定记录' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of loan_reserve_record
-- ----------------------------
INSERT INTO `loan_reserve_record` VALUES (1, NULL, '', 1, '1', '2019-10-05 01:08:00', 1, 1, '', NULL, NULL, NULL, NULL);
INSERT INTO `loan_reserve_record` VALUES (2, NULL, '', 1, '1', '2019-10-05 01:08:00', 1, 1, '', NULL, NULL, NULL, NULL);
INSERT INTO `loan_reserve_record` VALUES (3, NULL, '', 1, '1', '2019-10-05 01:08:00', 1, 1, '', NULL, NULL, NULL, NULL);
INSERT INTO `loan_reserve_record` VALUES (4, NULL, '张三', 1, '15388889999', '2019-10-05 01:08:00', 10, 1, '12313131', NULL, NULL, NULL, NULL);
INSERT INTO `loan_reserve_record` VALUES (5, NULL, '123', 1, '15388889999', '2019-10-05 01:33:00', 15, 1, '12313', NULL, NULL, NULL, NULL);
INSERT INTO `loan_reserve_record` VALUES (6, NULL, '李四', 0, '15877779999', '2019-10-06 01:34:00', 18, 1, '12313qwerwrwe', NULL, NULL, NULL, NULL);
INSERT INTO `loan_reserve_record` VALUES (7, NULL, '张三', 1, '15388889999', '2019-10-06 07:12:46', 123, NULL, '12313', NULL, NULL, NULL, NULL);
INSERT INTO `loan_reserve_record` VALUES (8, NULL, '', NULL, '', NULL, NULL, NULL, '', NULL, NULL, NULL, NULL);
INSERT INTO `loan_reserve_record` VALUES (9, NULL, '', NULL, '', NULL, NULL, NULL, '', NULL, NULL, NULL, NULL);
INSERT INTO `loan_reserve_record` VALUES (10, NULL, '张三', 1, '15388889999', '2019-10-08 01:43:04', 6, NULL, '123131', NULL, NULL, NULL, NULL);
INSERT INTO `loan_reserve_record` VALUES (11, NULL, '111', 1, '13333333333', '2019-10-19 05:05:04', 3, NULL, '1123\n\n123\n\n13123', NULL, NULL, NULL, NULL);
INSERT INTO `loan_reserve_record` VALUES (12, NULL, 'sb', 0, '15388878989', '2019-10-24 09:07:27', 12, NULL, '123123123', NULL, NULL, NULL, NULL);
INSERT INTO `loan_reserve_record` VALUES (13, NULL, 'sdf', NULL, '15369999999', '2019-10-25 03:36:48', 8, NULL, '12321313', NULL, NULL, NULL, NULL);
INSERT INTO `loan_reserve_record` VALUES (14, NULL, '1231', NULL, '15699999999', '2019-10-25 03:40:40', 10, NULL, '123123123', NULL, NULL, NULL, NULL);
INSERT INTO `loan_reserve_record` VALUES (15, NULL, 'dsf', 1, '15388889999', '2019-10-25 09:57:07', 3, NULL, '2010', NULL, NULL, NULL, NULL);
INSERT INTO `loan_reserve_record` VALUES (16, NULL, '1', 1, '13333333333', '2019-10-26 21:55:34', 3, NULL, '11', NULL, NULL, NULL, NULL);
INSERT INTO `loan_reserve_record` VALUES (17, 1, '王', 1, '13333333333', '2019-10-26 21:56:22', 3, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `loan_reserve_record` VALUES (18, NULL, '张三', 1, '13899998888', '2019-11-09 06:44:14', 3, NULL, '12313', NULL, NULL, NULL, NULL);
INSERT INTO `loan_reserve_record` VALUES (19, NULL, '张在', 1, '13899988888', '2019-11-09 06:49:03', 3, NULL, '123weqeq', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for loan_sign_info
-- ----------------------------
DROP TABLE IF EXISTS `loan_sign_info`;
CREATE TABLE `loan_sign_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `loan_number` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标的编号',
  `loan_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标的标题',
  `loan_type` int(11) NULL DEFAULT 1 COMMENT '类型（1普通标、2天标）',
  `loan_term` int(11) NULL DEFAULT NULL COMMENT '期限',
  `annual_ratio` decimal(18, 4) NULL DEFAULT NULL COMMENT '年化比例',
  `bill_ratio` decimal(18, 4) NULL DEFAULT NULL COMMENT '在账比例',
  `loan_publish_time` datetime(0) NULL DEFAULT NULL COMMENT '发布时间',
  `loan_stop_time` date NULL DEFAULT NULL COMMENT '截标时间',
  `source` int(11) NULL DEFAULT 0 COMMENT '来源（0：线上，1：线下）',
  `loan_rate` decimal(10, 4) NULL DEFAULT NULL COMMENT '标的利率',
  `loan_status` int(11) NULL DEFAULT NULL COMMENT '标的状态',
  `pay_way` int(11) NULL DEFAULT NULL COMMENT '付息方式（每月固定日期）',
  `creator_id` bigint(20) NULL DEFAULT NULL COMMENT '创建者id',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间 ',
  `updater_id` bigint(20) NULL DEFAULT NULL COMMENT '更新者id',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '标的信息' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of loan_sign_info
-- ----------------------------
INSERT INTO `loan_sign_info` VALUES (1, '444', '44', 1, 3, 0.5000, 1.0000, '2019-10-09 21:51:18', NULL, 0, 0.2000, 1, 1, NULL, NULL, NULL, NULL);
INSERT INTO `loan_sign_info` VALUES (2, '55', '55', 1, 6, 0.6000, 0.8000, NULL, NULL, 0, 0.3000, 1, 1, NULL, NULL, NULL, NULL);
INSERT INTO `loan_sign_info` VALUES (3, '1000', '少000校', 1, NULL, 0.2000, 0.5000, NULL, NULL, 0, 0.2000, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `loan_sign_info` VALUES (4, NULL, NULL, 1, NULL, 222.0000, 2.0000, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `loan_sign_info` VALUES (5, NULL, NULL, 1, NULL, 2.0000, 1.2000, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `loan_sign_info` VALUES (6, '123', '123', 0, 123, NULL, NULL, NULL, NULL, 0, 0.0000, 1, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for loan_sign_record
-- ----------------------------
DROP TABLE IF EXISTS `loan_sign_record`;
CREATE TABLE `loan_sign_record`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tender_money` decimal(18, 4) NULL DEFAULT NULL COMMENT '投资金额',
  `tender_time` datetime(0) NULL DEFAULT NULL COMMENT '投资时间',
  `loan_sign_id` bigint(20) NULL DEFAULT NULL COMMENT '借款标id',
  `customer_id` bigint(20) NULL DEFAULT NULL COMMENT '客户id',
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '用户id',
  `is_first` int(11) NULL DEFAULT 0 COMMENT '是否首次投标（1：是；0：否）',
  `source` int(11) NULL DEFAULT 1 COMMENT '来源（0：线上，1：线下）',
  `is_deleted` tinyint(2) NULL DEFAULT 0 COMMENT '是否删除',
  `year_archieve` decimal(18, 4) NULL DEFAULT NULL COMMENT '年化业绩',
  `is_valid` tinyint(2) NULL DEFAULT 1 COMMENT '是否有效业绩（0：否；1：是）',
  `status` tinyint(2) NULL DEFAULT 1 COMMENT '状态（0：作废；1：正常）',
  `contract_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '合同',
  `exp_time` date NULL DEFAULT NULL COMMENT '线下标的到期时间',
  `rate` decimal(10, 4) NULL DEFAULT NULL COMMENT '线下记录的利率',
  `valid_score` int(255) NULL DEFAULT NULL COMMENT '有效年化积分',
  `bill_score` int(255) NULL DEFAULT NULL COMMENT '在账奖励积分',
  `market_id` bigint(20) NULL DEFAULT NULL COMMENT '营销方案id',
  `shop_score` int(255) NULL DEFAULT NULL COMMENT '商城积分',
  `remark` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `creator_id` bigint(20) NULL DEFAULT NULL COMMENT '创建者id',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间 ',
  `updater_id` bigint(20) NULL DEFAULT NULL COMMENT '更新者id',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `i_customer_id`(`customer_id`) USING BTREE,
  INDEX `i_loan_sign_id`(`loan_sign_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '投标记录表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tbl_authr
-- ----------------------------
DROP TABLE IF EXISTS `tbl_authr`;
CREATE TABLE `tbl_authr`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `resource` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `authr` int(11) NOT NULL DEFAULT 0,
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `update_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_authr_uid`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_authr
-- ----------------------------
INSERT INTO `tbl_authr` VALUES (21, 1000028, '/index', 15, '2019-12-30 19:30:38', NULL);
INSERT INTO `tbl_authr` VALUES (22, 1000028, '/system', 15, '2019-12-30 19:30:38', NULL);
INSERT INTO `tbl_authr` VALUES (23, 1000028, '/system/menu', 15, '2019-12-30 19:30:38', NULL);
INSERT INTO `tbl_authr` VALUES (24, 1000028, '/system/dict', 15, '2019-12-30 19:30:38', NULL);
INSERT INTO `tbl_authr` VALUES (25, 1000028, '/system/user', 15, '2019-12-30 19:30:38', NULL);
INSERT INTO `tbl_authr` VALUES (26, 1000000, '/index', 15, '2019-12-30 19:33:13', NULL);
INSERT INTO `tbl_authr` VALUES (27, 1000000, '/system', 0, '2019-12-30 19:33:13', NULL);
INSERT INTO `tbl_authr` VALUES (28, 1000000, '/system/menu', 0, '2019-12-30 19:33:13', NULL);
INSERT INTO `tbl_authr` VALUES (29, 1000000, '/system/dict', 0, '2019-12-30 19:33:13', NULL);
INSERT INTO `tbl_authr` VALUES (30, 1000000, '/system/user', 0, '2019-12-30 19:33:13', NULL);

-- ----------------------------
-- Table structure for tbl_config
-- ----------------------------
DROP TABLE IF EXISTS `tbl_config`;
CREATE TABLE `tbl_config`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cfg_key` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cfg_value` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sub_type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'ON',
  `description` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `update_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_config
-- ----------------------------
INSERT INTO `tbl_config` VALUES (1, 'zh_CN', '中文', 'lang', NULL, 'ON', 'i18n配置', '2019-12-18 14:14:28', NULL);
INSERT INTO `tbl_config` VALUES (2, 'en', 'English', 'lang', NULL, 'ON', 'i18n配置', '2019-12-18 14:15:10', NULL);
INSERT INTO `tbl_config` VALUES (3, 'menu', '菜单字典', 'dict', NULL, 'ON', '字典类型', '2019-12-18 14:49:35', '2019-12-19 12:02:39');
INSERT INTO `tbl_config` VALUES (4, 'message', '话术字典', 'dict', NULL, 'ON', '字典类型', '2019-12-18 14:50:16', '2019-12-19 12:02:44');

-- ----------------------------
-- Table structure for tbl_dict
-- ----------------------------
DROP TABLE IF EXISTS `tbl_dict`;
CREATE TABLE `tbl_dict`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `dict_key` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `dict_value` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `lang` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `update_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 173 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_dict
-- ----------------------------
INSERT INTO `tbl_dict` VALUES (1, 'index', '首页', 'zh_CN', '首页', '2019-12-18 14:47:05', NULL);
INSERT INTO `tbl_dict` VALUES (2, 'index', 'Home', 'en', 'home page', '2019-12-18 14:47:37', NULL);
INSERT INTO `tbl_dict` VALUES (3, 'choose_lang', '选择语言', 'zh_CN', 'choose language', '2019-12-19 19:05:05', NULL);
INSERT INTO `tbl_dict` VALUES (4, 'choose_lang', 'Language', 'en', 'choose language', '2019-12-19 19:05:39', NULL);
INSERT INTO `tbl_dict` VALUES (5, 'logout', '退出登录', 'zh_CN', 'logout', '2019-12-19 20:56:02', NULL);
INSERT INTO `tbl_dict` VALUES (6, 'logout', 'Logout', 'en', 'logout', '2019-12-19 20:56:14', NULL);
INSERT INTO `tbl_dict` VALUES (7, 'system', '系统设置', 'zh_CN', 's', '2019-12-20 15:32:58', NULL);
INSERT INTO `tbl_dict` VALUES (8, 'system', 'System Settings', 'en', 's', '2019-12-20 15:33:12', NULL);
INSERT INTO `tbl_dict` VALUES (9, 'system_menu', '菜单管理', 'zh_CN', 's', '2019-12-20 15:33:32', NULL);
INSERT INTO `tbl_dict` VALUES (10, 'system_menu', 'Menu', 'en', 's', '2019-12-20 15:33:53', NULL);
INSERT INTO `tbl_dict` VALUES (11, 'system_dict', '字典管理', 'zh_CN', 's', '2019-12-20 15:34:06', NULL);
INSERT INTO `tbl_dict` VALUES (12, 'system_dict', 'Dictionary', 'en', 's', '2019-12-20 15:34:19', NULL);
INSERT INTO `tbl_dict` VALUES (13, 'app_name', '后台管理系统', 'zh_CN', 's', '2019-12-21 14:53:33', NULL);
INSERT INTO `tbl_dict` VALUES (14, 'app_name', 'Administration System', 'en', 's', '2019-12-21 14:54:01', NULL);
INSERT INTO `tbl_dict` VALUES (15, 'login_username', '账号', 'zh_CN', 's', '2019-12-21 14:54:20', '2019-12-21 14:56:24');
INSERT INTO `tbl_dict` VALUES (16, 'login_password', 'Password', 'en', 's', '2019-12-21 14:54:42', NULL);
INSERT INTO `tbl_dict` VALUES (17, 'login_username', 'Username', 'en', 's', '2019-12-21 14:54:53', NULL);
INSERT INTO `tbl_dict` VALUES (18, 'login_password', '密码', 'zh_CN', 's', '2019-12-21 14:55:04', '2019-12-21 14:56:13');
INSERT INTO `tbl_dict` VALUES (19, 'login_password_confirm', 'Confirm', 'en', 's', '2019-12-21 14:55:28', NULL);
INSERT INTO `tbl_dict` VALUES (20, 'login_password_confirm', '确认密码', 'zh_CN', 's', '2019-12-21 14:55:53', NULL);
INSERT INTO `tbl_dict` VALUES (21, 'remember_me', '记住密码', 'zh_CN', 's', '2019-12-21 14:56:54', NULL);
INSERT INTO `tbl_dict` VALUES (22, 'remember_me', 'remember me', 'en', 's', '2019-12-21 14:57:10', '2019-12-21 15:06:28');
INSERT INTO `tbl_dict` VALUES (23, 'login', 'Login', 'en', 's', '2019-12-21 14:57:57', NULL);
INSERT INTO `tbl_dict` VALUES (24, 'login', '登录', 'zh_CN', 's', '2019-12-21 14:58:08', NULL);
INSERT INTO `tbl_dict` VALUES (25, 'register', 'Register', 'en', 's', '2019-12-21 14:58:22', NULL);
INSERT INTO `tbl_dict` VALUES (26, 'register', '注册', 'zh_CN', 's', '2019-12-21 14:58:35', NULL);
INSERT INTO `tbl_dict` VALUES (27, 'to_login', 'Already registered, to ', 'en', 's', '2019-12-21 14:59:26', NULL);
INSERT INTO `tbl_dict` VALUES (28, 'to_login', '已有账号,立即', 'zh_CN', 's', '2019-12-21 14:59:59', NULL);
INSERT INTO `tbl_dict` VALUES (29, 'to_register', '立即注册>', 'zh_CN', 's', '2019-12-21 15:00:25', NULL);
INSERT INTO `tbl_dict` VALUES (30, 'to_register', 'Register Now>', 'en', 's', '2019-12-21 15:00:44', NULL);
INSERT INTO `tbl_dict` VALUES (31, 'v_required', '请输入必填项', 'zh_CN', 's', '2019-12-21 16:53:06', '2019-12-21 16:55:20');
INSERT INTO `tbl_dict` VALUES (32, 'v_required', 'required', 'en', 's', '2019-12-21 16:53:41', '2019-12-21 16:54:53');
INSERT INTO `tbl_dict` VALUES (33, 'v_password_conflict', '密码不一致', 'zh_CN', 's', '2019-12-21 16:54:31', '2019-12-21 16:55:51');
INSERT INTO `tbl_dict` VALUES (34, 'v_password_conflict', 'password not equal', 'en', 's', '2019-12-21 16:56:05', NULL);
INSERT INTO `tbl_dict` VALUES (35, 'register_success', '注册成功!', 'zh_CN', 's', '2019-12-21 22:09:58', NULL);
INSERT INTO `tbl_dict` VALUES (36, 'register_success', 'Register Succeed!', 'en', 's', '2019-12-21 22:10:28', NULL);
INSERT INTO `tbl_dict` VALUES (37, 'confirm', '确认', 'zh_CN', 's', '2019-12-22 09:17:46', NULL);
INSERT INTO `tbl_dict` VALUES (38, 'confirm', 'Confirm', 'en', 's', '2019-12-22 09:17:57', NULL);
INSERT INTO `tbl_dict` VALUES (39, 'cancel', 'Cancel', 'en', 's', '2019-12-22 09:18:05', NULL);
INSERT INTO `tbl_dict` VALUES (40, 'cancel', '取消', 'zh_CN', 's', '2019-12-22 09:18:17', NULL);
INSERT INTO `tbl_dict` VALUES (41, 'logout_tips', '确定退出账号吗?', 'zh_CN', 's', '2019-12-22 09:19:51', NULL);
INSERT INTO `tbl_dict` VALUES (42, 'logout_tips', 'Comfirm to Logout?', 'en', 's', '2019-12-22 09:20:26', NULL);
INSERT INTO `tbl_dict` VALUES (43, 'fullscreen', '全屏', 'zh_CN', 's', '2019-12-22 09:37:09', NULL);
INSERT INTO `tbl_dict` VALUES (44, 'fullscreen', 'Full Screen', 'en', 's', '2019-12-22 09:37:27', NULL);
INSERT INTO `tbl_dict` VALUES (45, 'action_add', '新增', 'zh_CN', 'add', '2019-12-24 14:39:11', '2019-12-24 17:01:35');
INSERT INTO `tbl_dict` VALUES (46, 'action_add', 'Add', 'en', 'add', '2019-12-24 14:39:11', '2019-12-24 17:01:35');
INSERT INTO `tbl_dict` VALUES (47, 'action_edit', '编辑', 'zh_CN', 'edit', '2019-12-24 14:47:01', NULL);
INSERT INTO `tbl_dict` VALUES (48, 'action_edit', 'Edit', 'en', 'edit', '2019-12-24 14:47:01', NULL);
INSERT INTO `tbl_dict` VALUES (49, 'action_delete', '删除', 'zh_CN', 'del', '2019-12-24 14:50:48', NULL);
INSERT INTO `tbl_dict` VALUES (50, 'action_delete', 'Delete', 'en', 'del', '2019-12-24 14:50:48', NULL);
INSERT INTO `tbl_dict` VALUES (63, 'placeholder_search', '请输入关键字搜索', 'zh_CN', 'search', '2019-12-24 15:59:21', NULL);
INSERT INTO `tbl_dict` VALUES (64, 'placeholder_search', 'Enter key words for search', 'en', 'search', '2019-12-24 15:59:21', NULL);
INSERT INTO `tbl_dict` VALUES (65, 'label_key', '编码', 'zh_CN', 'code', '2019-12-24 16:00:50', NULL);
INSERT INTO `tbl_dict` VALUES (66, 'label_key', 'Code', 'en', 'code', '2019-12-24 16:00:50', NULL);
INSERT INTO `tbl_dict` VALUES (67, 'label_value', '名称', 'zh_CN', 'val', '2019-12-24 16:01:19', NULL);
INSERT INTO `tbl_dict` VALUES (68, 'label_value', 'Value', 'en', 'val', '2019-12-24 16:01:19', NULL);
INSERT INTO `tbl_dict` VALUES (69, 'label_locale', '语言', 'zh_CN', 'lang', '2019-12-24 16:01:55', NULL);
INSERT INTO `tbl_dict` VALUES (70, 'label_locale', 'Language', 'en', 'lang', '2019-12-24 16:01:55', NULL);
INSERT INTO `tbl_dict` VALUES (71, 'label_desc', '说明', 'zh_CN', 'desc', '2019-12-24 16:02:18', NULL);
INSERT INTO `tbl_dict` VALUES (72, 'label_desc', 'Description', 'en', 'desc', '2019-12-24 16:02:18', NULL);
INSERT INTO `tbl_dict` VALUES (73, 'label_action', '操作', 'zh_CN', 'action', '2019-12-24 16:02:42', NULL);
INSERT INTO `tbl_dict` VALUES (74, 'label_action', 'Action', 'en', 'action', '2019-12-24 16:02:42', NULL);
INSERT INTO `tbl_dict` VALUES (75, 'title_add_dict', '新增字典', 'zh_CN', 'add', '2019-12-24 16:09:54', NULL);
INSERT INTO `tbl_dict` VALUES (76, 'title_add_dict', 'Add Dictionary', 'en', 'add', '2019-12-24 16:09:54', NULL);
INSERT INTO `tbl_dict` VALUES (77, 'title_edit_dict', '编辑字典', 'zh_CN', 'edit', '2019-12-24 16:10:18', NULL);
INSERT INTO `tbl_dict` VALUES (78, 'title_edit_dict', 'Edit Dictionary', 'en', 'edit', '2019-12-24 16:10:18', NULL);
INSERT INTO `tbl_dict` VALUES (79, 'action_submit', '提交', 'zh_CN', 'submit', '2019-12-24 16:12:50', NULL);
INSERT INTO `tbl_dict` VALUES (80, 'action_submit', 'Submit', 'en', 'submit', '2019-12-24 16:12:50', NULL);
INSERT INTO `tbl_dict` VALUES (81, 'action_add_menu', '添加子菜单', 'zh_CN', 'add', '2019-12-25 16:48:02', NULL);
INSERT INTO `tbl_dict` VALUES (82, 'action_add_menu', 'Append Menu', 'en', 'add', '2019-12-25 16:48:02', NULL);
INSERT INTO `tbl_dict` VALUES (83, 'confirm_delete', '确定删除该项吗?', 'zh_CN', 'd', '2019-12-25 17:08:13', NULL);
INSERT INTO `tbl_dict` VALUES (84, 'confirm_delete', 'Confirm delete?', 'en', 'd', '2019-12-25 17:08:13', NULL);
INSERT INTO `tbl_dict` VALUES (85, 'enable', '启用', 'zh_CN', 'en', '2019-12-25 18:54:38', NULL);
INSERT INTO `tbl_dict` VALUES (86, 'enable', 'Enable', 'en', 'en', '2019-12-25 18:54:38', NULL);
INSERT INTO `tbl_dict` VALUES (87, 'disable', '禁用', 'zh_CN', 'disable', '2019-12-25 18:54:54', NULL);
INSERT INTO `tbl_dict` VALUES (88, 'disable', 'Disable', 'en', 'disable', '2019-12-25 18:54:54', NULL);
INSERT INTO `tbl_dict` VALUES (89, 'menu_root', '根目录', 'zh_CN', 'root', '2019-12-26 12:24:36', NULL);
INSERT INTO `tbl_dict` VALUES (90, 'menu_root', 'Root', 'en', 'root', '2019-12-26 12:24:36', NULL);
INSERT INTO `tbl_dict` VALUES (93, 'label_parent_menu', '父菜单', 'zh_CN', 'p', '2019-12-26 13:02:19', '2019-12-26 15:40:07');
INSERT INTO `tbl_dict` VALUES (94, 'label_parent_menu', 'Parent Menu', 'en', 'p', '2019-12-26 13:02:19', NULL);
INSERT INTO `tbl_dict` VALUES (95, 'label_path', 'Path', 'zh_CN', 'path', '2019-12-26 13:04:57', NULL);
INSERT INTO `tbl_dict` VALUES (96, 'label_path', 'Path', 'en', 'path', '2019-12-26 13:04:57', NULL);
INSERT INTO `tbl_dict` VALUES (97, 'label_auth', '权限', 'zh_CN', 'autn', '2019-12-26 13:06:48', NULL);
INSERT INTO `tbl_dict` VALUES (98, 'label_auth', 'Auth', 'en', 'autn', '2019-12-26 13:06:48', NULL);
INSERT INTO `tbl_dict` VALUES (99, 'label_icon', '图标', 'zh_CN', 'icon', '2019-12-26 13:07:06', NULL);
INSERT INTO `tbl_dict` VALUES (100, 'label_icon', 'Icon', 'en', 'icon', '2019-12-26 13:07:06', NULL);
INSERT INTO `tbl_dict` VALUES (101, 'label_status', '状态', 'zh_CN', 'status', '2019-12-26 13:07:33', NULL);
INSERT INTO `tbl_dict` VALUES (102, 'label_status', 'Status', 'en', 'status', '2019-12-26 13:07:33', NULL);
INSERT INTO `tbl_dict` VALUES (103, 'label_priority', '优先级', 'zh_CN', 'priority', '2019-12-26 13:08:08', NULL);
INSERT INTO `tbl_dict` VALUES (104, 'label_priority', 'Priority', 'en', 'priority', '2019-12-26 13:08:08', NULL);
INSERT INTO `tbl_dict` VALUES (105, 'ON', '启用', 'zh_CN', 'on', '2019-12-26 14:22:04', NULL);
INSERT INTO `tbl_dict` VALUES (106, 'ON', 'ON', 'en', 'on', '2019-12-26 14:22:04', NULL);
INSERT INTO `tbl_dict` VALUES (107, 'OFF', '禁用', 'zh_CN', 'off', '2019-12-26 14:22:23', NULL);
INSERT INTO `tbl_dict` VALUES (108, 'OFF', 'OFF', 'en', 'off', '2019-12-26 14:22:23', NULL);
INSERT INTO `tbl_dict` VALUES (109, 'tips_common_char', '请输入字母,数字,或下划线', 'zh_CN', 'e', '2019-12-26 14:57:34', NULL);
INSERT INTO `tbl_dict` VALUES (110, 'tips_common_char', 'Enter number,alpha,underline', 'en', 'e', '2019-12-26 14:57:34', NULL);
INSERT INTO `tbl_dict` VALUES (111, 'tips_select', '请选择', 'zh_CN', 'select', '2019-12-26 15:06:14', NULL);
INSERT INTO `tbl_dict` VALUES (112, 'tips_select', 'Select one option', 'en', 'select', '2019-12-26 15:06:14', NULL);
INSERT INTO `tbl_dict` VALUES (113, 'test', '测试', 'zh_CN', 'e', '2019-12-26 15:22:37', NULL);
INSERT INTO `tbl_dict` VALUES (114, 'test', 'test', 'en', 'e', '2019-12-26 15:22:37', NULL);
INSERT INTO `tbl_dict` VALUES (115, 'system_user', '用户管理', 'zh_CN', 'user', '2019-12-27 15:03:57', NULL);
INSERT INTO `tbl_dict` VALUES (116, 'system_user', 'User', 'en', 'user', '2019-12-27 15:03:57', NULL);
INSERT INTO `tbl_dict` VALUES (117, 'label_username', '用户名', 'zh_CN', 'a', '2019-12-27 15:10:40', NULL);
INSERT INTO `tbl_dict` VALUES (118, 'label_username', 'Username', 'en', 'a', '2019-12-27 15:10:40', NULL);
INSERT INTO `tbl_dict` VALUES (119, 'label_nickname', '昵称', 'zh_CN', 'n', '2019-12-27 15:10:55', NULL);
INSERT INTO `tbl_dict` VALUES (120, 'label_nickname', 'Nickname', 'en', 'n', '2019-12-27 15:10:55', NULL);
INSERT INTO `tbl_dict` VALUES (121, 'label_mobile', '手机号', 'zh_CN', 'm', '2019-12-27 15:11:26', NULL);
INSERT INTO `tbl_dict` VALUES (122, 'label_mobile', 'Mobile', 'en', 'm', '2019-12-27 15:11:26', NULL);
INSERT INTO `tbl_dict` VALUES (123, 'label_email', '邮箱', 'zh_CN', 'email', '2019-12-27 15:11:53', NULL);
INSERT INTO `tbl_dict` VALUES (124, 'label_email', 'Email', 'en', 'email', '2019-12-27 15:11:53', NULL);
INSERT INTO `tbl_dict` VALUES (125, 'label_email', '邮箱', 'zh_CN', 'email', '2019-12-27 15:12:01', NULL);
INSERT INTO `tbl_dict` VALUES (126, 'label_email', 'Email', 'en', 'email', '2019-12-27 15:12:01', NULL);
INSERT INTO `tbl_dict` VALUES (127, 'tips_search_username', '输入用户名搜索', 'zh_CN', 'e', '2019-12-27 15:30:15', NULL);
INSERT INTO `tbl_dict` VALUES (128, 'tips_search_username', 'Enter username for searching', 'en', 'e', '2019-12-27 15:30:15', NULL);
INSERT INTO `tbl_dict` VALUES (129, 'tips_search_mobile', '输入手机号搜索', 'zh_CN', 'e', '2019-12-27 15:30:41', NULL);
INSERT INTO `tbl_dict` VALUES (130, 'tips_search_mobile', 'Enter mobile for searching', 'en', 'e', '2019-12-27 15:30:41', NULL);
INSERT INTO `tbl_dict` VALUES (131, 'tips_search_email', '输入邮箱搜索', 'zh_CN', 'e', '2019-12-27 15:31:11', NULL);
INSERT INTO `tbl_dict` VALUES (132, 'tips_search_email', 'Enter email for searching', 'en', 'e', '2019-12-27 15:31:11', NULL);
INSERT INTO `tbl_dict` VALUES (133, 'label_search', '搜索', 'zh_CN', 'search', '2019-12-27 15:34:40', NULL);
INSERT INTO `tbl_dict` VALUES (134, 'label_search', 'Search', 'en', 'search', '2019-12-27 15:34:40', NULL);
INSERT INTO `tbl_dict` VALUES (135, 'label_reset', '重置', 'zh_CN', 'reset', '2019-12-27 15:41:07', NULL);
INSERT INTO `tbl_dict` VALUES (136, 'label_reset', 'Reset', 'en', 'reset', '2019-12-27 15:41:07', NULL);
INSERT INTO `tbl_dict` VALUES (137, 'action_auth', '权限设置', 'zh_CN', 'edit', '2019-12-27 18:06:52', NULL);
INSERT INTO `tbl_dict` VALUES (138, 'action_auth', 'Edit Auth', 'en', 'edit', '2019-12-27 18:06:52', NULL);
INSERT INTO `tbl_dict` VALUES (139, 'action_frozen', '冻结账号', 'zh_CN', '冻结', '2019-12-27 18:07:42', NULL);
INSERT INTO `tbl_dict` VALUES (140, 'action_frozen', 'Freez', 'en', '冻结', '2019-12-27 18:07:42', NULL);
INSERT INTO `tbl_dict` VALUES (141, 'action_recover', '恢复', 'zh_CN', 're', '2019-12-27 18:08:40', NULL);
INSERT INTO `tbl_dict` VALUES (142, 'action_recover', 'Recover', 'en', 're', '2019-12-27 18:08:40', NULL);
INSERT INTO `tbl_dict` VALUES (143, 'settings', '设置', 'zh_CN', 's', '2019-12-27 18:16:03', NULL);
INSERT INTO `tbl_dict` VALUES (144, 'settings', 'Settings', 'en', 's', '2019-12-27 18:16:03', NULL);
INSERT INTO `tbl_dict` VALUES (147, 'FROZEN', '冻结', 'zh_CN', 'f', '2019-12-27 18:17:21', NULL);
INSERT INTO `tbl_dict` VALUES (148, 'FROZEN', 'Frozen', 'en', 'f', '2019-12-27 18:17:21', NULL);
INSERT INTO `tbl_dict` VALUES (149, 'ACTIVE', '正常', 'zh_CN', 'asdf', '2019-12-27 18:26:06', NULL);
INSERT INTO `tbl_dict` VALUES (150, 'ACTIVE', 'Active', 'en', 'asdf', '2019-12-27 18:26:06', NULL);
INSERT INTO `tbl_dict` VALUES (151, 'user', '用户', 'zh_CN', 'user', '2019-12-27 18:51:57', NULL);
INSERT INTO `tbl_dict` VALUES (152, 'user', 'User', 'en', 'user', '2019-12-27 18:51:57', NULL);
INSERT INTO `tbl_dict` VALUES (153, 'action_change_user_status', '更改用户状态', 'zh_CN', 'cs', '2019-12-27 18:53:56', NULL);
INSERT INTO `tbl_dict` VALUES (154, 'action_change_user_status', 'Change Status', 'en', 'cs', '2019-12-27 18:53:56', NULL);
INSERT INTO `tbl_dict` VALUES (155, 'authr_readable', '查看', 'zh_CN', 'read', '2019-12-30 15:43:38', NULL);
INSERT INTO `tbl_dict` VALUES (156, 'authr_readable', 'Read', 'en', 'read', '2019-12-30 15:43:38', NULL);
INSERT INTO `tbl_dict` VALUES (157, 'label_select_all', '全选', 'zh_CN', 'sel', '2019-12-30 18:56:10', NULL);
INSERT INTO `tbl_dict` VALUES (158, 'label_select_all', 'Select All', 'en', 'sel', '2019-12-30 18:56:10', NULL);
INSERT INTO `tbl_dict` VALUES (159, 'tips_submit_success', '提交成功', 'zh_CN', 'sub', '2019-12-30 19:09:38', NULL);
INSERT INTO `tbl_dict` VALUES (160, 'tips_submit_success', 'Submit Succeed', 'en', 'sub', '2019-12-30 19:09:38', NULL);
INSERT INTO `tbl_dict` VALUES (161, 'menu_pic', '图片管理', 'zh_CN', 'pic', '2020-01-02 10:54:28', NULL);
INSERT INTO `tbl_dict` VALUES (162, 'menu_pic', 'Pictures', 'en', 'pic', '2020-01-02 10:54:28', NULL);
INSERT INTO `tbl_dict` VALUES (163, 'menu_pic_list', '图片列表', 'zh_CN', 'pl', '2020-01-02 10:55:59', NULL);
INSERT INTO `tbl_dict` VALUES (164, 'menu_pic_list', 'Picture List', 'en', 'pl', '2020-01-02 10:55:59', NULL);
INSERT INTO `tbl_dict` VALUES (165, 'menu_music', '音乐管理', 'zh_CN', 'music', '2020-01-02 13:45:02', NULL);
INSERT INTO `tbl_dict` VALUES (166, 'menu_music', 'Music', 'en', 'music', '2020-01-02 13:45:02', NULL);
INSERT INTO `tbl_dict` VALUES (167, 'menu_music_list', '音乐列表', 'zh_CN', 'ml', '2020-01-02 13:47:58', NULL);
INSERT INTO `tbl_dict` VALUES (168, 'menu_music_list', 'Music List', 'en', 'ml', '2020-01-02 13:47:58', NULL);
INSERT INTO `tbl_dict` VALUES (169, 'menu_video', '视频管理', 'zh_CN', 'video', '2020-01-02 15:58:47', NULL);
INSERT INTO `tbl_dict` VALUES (170, 'menu_video', 'Video', 'en', 'video', '2020-01-02 15:58:47', NULL);
INSERT INTO `tbl_dict` VALUES (171, 'menu_video_list', '视频列表', 'zh_CN', 'lv', '2020-01-02 15:59:10', NULL);
INSERT INTO `tbl_dict` VALUES (172, 'menu_video_list', 'Video List', 'en', 'lv', '2020-01-02 15:59:10', NULL);

-- ----------------------------
-- Table structure for tbl_idm_user
-- ----------------------------
DROP TABLE IF EXISTS `tbl_idm_user`;
CREATE TABLE `tbl_idm_user`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户id主键',
  `email` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `password` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱登陆密码',
  `nickname` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户昵称',
  `account` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户可见账号',
  `mobile` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `device_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '设备唯一标识',
  `status` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户状态',
  `create_date` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `update_date` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_idm_user_email`(`email`) USING BTREE,
  INDEX `idx_idm_user_account`(`account`) USING BTREE,
  INDEX `idx_idm_user_mobile`(`mobile`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10000001 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_idm_user
-- ----------------------------
INSERT INTO `tbl_idm_user` VALUES (10000000, 'ttdys108@163.com', '123456', 'dai', '10001100001', '18627219552', 's0000000000000000000000001', 'NORMAL', '2019-12-11 12:59:39', NULL);

-- ----------------------------
-- Table structure for tbl_menu
-- ----------------------------
DROP TABLE IF EXISTS `tbl_menu`;
CREATE TABLE `tbl_menu`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `parent` bigint(20) NULL DEFAULT NULL,
  `path` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'ON',
  `icon` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `priority` int(11) NOT NULL DEFAULT 0,
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `update_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `auth` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `path`(`path`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_menu
-- ----------------------------
INSERT INTO `tbl_menu` VALUES (1, 'index', '首页', NULL, '/index', 'ON', 'el-icon-s-home', 0, '2019-12-18 14:46:03', '2019-12-26 03:00:55', NULL);
INSERT INTO `tbl_menu` VALUES (2, 'system', '系统设置', NULL, '/system', 'ON', 'el-icon-setting', 100, '2019-12-20 13:45:41', '2019-12-20 19:42:37', '');
INSERT INTO `tbl_menu` VALUES (3, 'system_menu', '菜单设置', 2, '/system/menu', 'ON', NULL, 0, '2019-12-20 13:46:37', '2019-12-20 19:43:02', 'system_menu');
INSERT INTO `tbl_menu` VALUES (4, 'system_dict', '字典设置', 2, '/system/dict', 'ON', NULL, 1, '2019-12-20 13:47:09', '2019-12-20 19:43:06', 'system_dict');
INSERT INTO `tbl_menu` VALUES (9, 'system_user', 'user', 2, '/system/user', 'ON', '', 0, '2019-12-27 15:03:33', NULL, '');
INSERT INTO `tbl_menu` VALUES (10, 'menu_pic', 'pic', NULL, '/picture', 'ON', 'el-icon-picture-outline', 0, '2020-01-02 10:54:08', NULL, '');
INSERT INTO `tbl_menu` VALUES (11, 'menu_pic_list', 'list', 10, '/picture/list', 'ON', '', 0, '2020-01-02 10:55:28', NULL, '');
INSERT INTO `tbl_menu` VALUES (12, 'menu_music', 'music', NULL, '/music', 'ON', 'el-icon-headset', 0, '2020-01-02 13:46:41', NULL, '');
INSERT INTO `tbl_menu` VALUES (13, 'menu_music_list', 'list', 12, '/music/list', 'ON', '', 0, '2020-01-02 13:47:30', NULL, '');
INSERT INTO `tbl_menu` VALUES (14, 'menu_video', 'v', NULL, '/video', 'ON', 'el-icon-video-camera', 0, '2020-01-02 15:58:01', NULL, '');
INSERT INTO `tbl_menu` VALUES (15, 'menu_video_list', 'l', 14, '/video/list', 'ON', '', 0, '2020-01-02 15:58:26', NULL, '');

-- ----------------------------
-- Table structure for tbl_order
-- ----------------------------
DROP TABLE IF EXISTS `tbl_order`;
CREATE TABLE `tbl_order`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_no` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `price` decimal(11, 2) NOT NULL,
  `channel` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cert_file` mediumblob NULL,
  `create_date` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `update_date` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `order_no`(`order_no`) USING BTREE,
  INDEX `idx_order_no`(`order_no`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10000001 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_order
-- ----------------------------
INSERT INTO `tbl_order` VALUES (10000000, '100001111001', 100.00, 'WX', 'NEW', NULL, '2019-11-28 15:47:27', NULL);

-- ----------------------------
-- Table structure for tbl_user
-- ----------------------------
DROP TABLE IF EXISTS `tbl_user`;
CREATE TABLE `tbl_user`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `account` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `avatar` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `nickname` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mobile` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'ACTIVE',
  `device_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `update_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_user_name`(`username`) USING BTREE,
  INDEX `idx_user_account`(`account`) USING BTREE,
  INDEX `idx_user_mobile`(`mobile`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1000029 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_user
-- ----------------------------
INSERT INTO `tbl_user` VALUES (1000000, 'tyuiop', '7cc6c3b9f7dee6a6a1fb61a00ba59a88', NULL, NULL, '啊', '111222333', 'a@1.com', 'ACTIVE', NULL, '2019-12-21 12:50:53', '2019-12-30 19:32:17');
INSERT INTO `tbl_user` VALUES (1000025, 'c', '7cc6c3b9f7dee6a6a1fb61a00ba59a88', NULL, NULL, 'hehe', '5555555', 'c@3.com', 'FROZEN', NULL, '2019-12-21 23:04:06', '2019-12-27 19:09:13');
INSERT INTO `tbl_user` VALUES (1000026, '1', '7cc6c3b9f7dee6a6a1fb61a00ba59a88', NULL, NULL, 'dai', '666666', 'e@5.com', 'ACTIVE', NULL, '2019-12-22 09:12:38', '2019-12-27 18:04:43');
INSERT INTO `tbl_user` VALUES (1000027, 'cc', '7cc6c3b9f7dee6a6a1fb61a00ba59a88', NULL, NULL, NULL, NULL, NULL, 'ACTIVE', NULL, '2019-12-27 18:04:26', NULL);
INSERT INTO `tbl_user` VALUES (1000028, 'admin', 'd99989b91991dfc782feed91ec9cb010', NULL, NULL, NULL, NULL, NULL, 'ACTIVE', NULL, '2019-12-27 18:05:08', NULL);

-- ----------------------------
-- Table structure for worder_plan
-- ----------------------------
DROP TABLE IF EXISTS `worder_plan`;
CREATE TABLE `worder_plan`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `customer_id` bigint(20) NULL DEFAULT NULL COMMENT '客户id',
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '业务员id',
  `type` tinyint(2) NOT NULL COMMENT '类型（0：业务咨询；1：订单咨询；2：建议反馈）',
  `status` tinyint(2) NULL DEFAULT 0 COMMENT '状态（0：进行中；1：已确认；2：已完成；3：已关闭）',
  `is_deleted` tinyint(2) NULL DEFAULT 0 COMMENT '是否删除（0：未删除，1：已删除）',
  `creator_id` bigint(20) NULL DEFAULT NULL COMMENT '创建者id',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间 ',
  `updater_id` bigint(20) NULL DEFAULT NULL COMMENT '更新者id',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '工单表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of worder_plan
-- ----------------------------
INSERT INTO `worder_plan` VALUES (1, 28, NULL, 1, 0, 0, NULL, '2019-05-31 17:41:51', 1, '2019-05-31 17:57:22');
INSERT INTO `worder_plan` VALUES (2, 30, NULL, 2, 2, 0, NULL, '2019-05-31 17:41:54', 1, '2019-05-31 17:57:22');
INSERT INTO `worder_plan` VALUES (3, 31, NULL, 3, 1, 0, NULL, '2019-06-14 15:38:41', NULL, '2019-07-05 15:33:10');
INSERT INTO `worder_plan` VALUES (4, 28, NULL, 1, 1, 0, NULL, '2019-06-05 15:38:45', NULL, '2019-07-05 15:33:10');
INSERT INTO `worder_plan` VALUES (11, 1, 1, 0, 1, 0, NULL, NULL, NULL, NULL);
INSERT INTO `worder_plan` VALUES (12, 1, 200, 0, 0, 0, NULL, NULL, NULL, NULL);
INSERT INTO `worder_plan` VALUES (13, 28, 300, 0, 2, 0, NULL, '2019-07-26 16:05:25', NULL, NULL);
INSERT INTO `worder_plan` VALUES (14, 28, 300, 0, 0, 0, NULL, '2019-07-25 16:05:27', NULL, NULL);
INSERT INTO `worder_plan` VALUES (22, 28, 32, 2, 0, 0, NULL, NULL, NULL, NULL);
INSERT INTO `worder_plan` VALUES (23, 28, 32, 1, 0, 0, NULL, NULL, NULL, NULL);
INSERT INTO `worder_plan` VALUES (24, 28, 32, 2, 0, 0, NULL, NULL, NULL, NULL);
INSERT INTO `worder_plan` VALUES (25, 28, 32, 1, 0, 0, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for worder_record
-- ----------------------------
DROP TABLE IF EXISTS `worder_record`;
CREATE TABLE `worder_record`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `worder_id` bigint(20) NULL DEFAULT NULL COMMENT '工单id',
  `record_money` decimal(18, 4) NULL DEFAULT NULL COMMENT '记录金额',
  `order_num` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '系统生成唯一订单号',
  `fuiou_order_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '富友订单号',
  `status` tinyint(2) NULL DEFAULT 0 COMMENT '状态（0：已付款；1：已确认）',
  `is_deleted` tinyint(2) NULL DEFAULT 0 COMMENT '是否删除（0：未删除，1：已删除）',
  `creator_id` bigint(20) NULL DEFAULT NULL COMMENT '创建者id',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间 ',
  `updater_id` bigint(20) NULL DEFAULT NULL COMMENT '更新者id',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '工单记录表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of worder_record
-- ----------------------------
INSERT INTO `worder_record` VALUES (1, 1, 5000.0000, NULL, NULL, 1, 0, NULL, '2019-05-31 17:42:29', 1, '2019-05-31 17:57:16');
INSERT INTO `worder_record` VALUES (2, 2, 1000.0000, NULL, NULL, 1, 0, NULL, '2019-05-31 17:42:31', 1, '2019-05-31 17:57:16');
INSERT INTO `worder_record` VALUES (3, 3, 200.0000, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;
