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

SET FOREIGN_KEY_CHECKS = 1;
