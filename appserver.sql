/*
 Navicat Premium Data Transfer

 Source Server         : sss
 Source Server Type    : MySQL
 Source Server Version : 80026
 Source Host           : localhost:3306
 Source Schema         : appserver

 Target Server Type    : MySQL
 Target Server Version : 80026
 File Encoding         : 65001

 Date: 07/02/2023 12:40:11
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `package_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 35 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '代码生成业务表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (33, 'login_return', '', NULL, NULL, 'LoginReturn', 'crud', 'com.ruoyi.system', 'system', 'return', NULL, 'ruoyi', '0', '/', NULL, 'admin', '2022-11-23 09:03:37', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (34, 'lora_node', '传感器表 ', NULL, NULL, 'LoraNode', 'crud', 'com.ruoyi.system', 'system', 'node', '传感器 ', 'ruoyi', '0', '/', NULL, 'admin', '2022-11-23 11:03:36', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (35, 'lora_terminal', '终端表 ', NULL, NULL, 'LoraTerminal', 'crud', 'com.ruoyi.system', 'system', 'terminal', '终端 ', 'ruoyi', '0', '/', NULL, 'admin', '2022-11-23 11:26:35', '', NULL, NULL);

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `sort` int NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 454 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (411, '33', 'return_id', '', 'bigint', 'Long', 'returnId', '1', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 1, 'admin', '2022-11-23 09:03:37', '', '2022-11-25 13:55:17');
INSERT INTO `gen_table_column` VALUES (412, '33', 'work_id', '', 'int', 'Long', 'workId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2022-11-23 09:03:37', '', '2022-11-25 13:55:17');
INSERT INTO `gen_table_column` VALUES (413, '33', 'business_cycle', '业务周期', 'int', 'Long', 'businessCycle', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2022-11-23 09:03:37', '', '2022-11-25 13:55:17');
INSERT INTO `gen_table_column` VALUES (414, '33', 'time_slot_width', '时隙宽度', 'int', 'Long', 'timeSlotWidth', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2022-11-23 09:03:37', '', '2022-11-25 13:55:17');
INSERT INTO `gen_table_column` VALUES (415, '33', 'threshold', '阈值', 'int', 'Long', 'threshold', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2022-11-23 09:03:37', '', '2022-11-25 13:55:17');
INSERT INTO `gen_table_column` VALUES (416, '33', 'time_window', '时间窗口', 'int', 'Long', 'timeWindow', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2022-11-23 09:03:37', '', '2022-11-25 13:55:17');
INSERT INTO `gen_table_column` VALUES (417, '33', 'sn', '', 'bigint', 'String', 'sn', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2022-11-23 09:03:37', '', '2022-11-25 13:55:17');
INSERT INTO `gen_table_column` VALUES (419, '33', 'terminal_eui', 'terminalEui', 'varchar(255)', 'String', 'terminalEui', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 8, '', '2022-11-23 09:04:10', '', '2022-11-25 13:55:17');
INSERT INTO `gen_table_column` VALUES (420, '33', 'frame', '帧结构', 'varchar(255)', 'String', 'frame', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 9, '', '2022-11-23 10:32:49', '', '2022-11-25 13:55:17');
INSERT INTO `gen_table_column` VALUES (421, '34', 'terminal_id', '终端id', 'bigint', 'Long', 'terminalId', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2022-11-23 11:03:36', '', NULL);
INSERT INTO `gen_table_column` VALUES (422, '34', 'terminal_eui', '终端出厂ID', 'varchar(20)', 'String', 'terminalEui', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2022-11-23 11:03:36', '', NULL);
INSERT INTO `gen_table_column` VALUES (423, '34', 'active_state', '0 未激活1 已激活', 'tinyint(1)', 'Integer', 'activeState', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2022-11-23 11:03:36', '', NULL);
INSERT INTO `gen_table_column` VALUES (424, '34', 'run_state', '运行状态', 'char(1)', 'String', 'runState', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2022-11-23 11:03:36', '', NULL);
INSERT INTO `gen_table_column` VALUES (425, '34', 'battery', '电池电量', 'float', 'Long', 'battery', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2022-11-23 11:03:36', '', NULL);
INSERT INTO `gen_table_column` VALUES (426, '34', 'last_msg_dt', '最后一次发送消息时间', 'timestamp', 'Date', 'lastMsgDt', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 6, 'admin', '2022-11-23 11:03:36', '', NULL);
INSERT INTO `gen_table_column` VALUES (427, '34', 'gateway_eui', '网关id', 'varchar(20)', 'String', 'gatewayEui', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2022-11-23 11:03:36', '', NULL);
INSERT INTO `gen_table_column` VALUES (428, '34', 'app_eui', '关联appEui', 'varchar(20)', 'String', 'appEui', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2022-11-23 11:03:36', '', NULL);
INSERT INTO `gen_table_column` VALUES (429, '34', 'random', 'mac是否具有随机类型：否：0   是：1', 'char(1)', 'String', 'random', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2022-11-23 11:03:36', '', NULL);
INSERT INTO `gen_table_column` VALUES (430, '34', 'tdma', 'mac是否具有TDMA类型：否：0 是：1', 'char(1)', 'String', 'tdma', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 10, 'admin', '2022-11-23 11:03:36', '', NULL);
INSERT INTO `gen_table_column` VALUES (431, '34', 'real_time', 'mac是否具有实时类型：否：0 是：1', 'char(1)', 'String', 'realTime', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 11, 'admin', '2022-11-23 11:03:36', '', NULL);
INSERT INTO `gen_table_column` VALUES (432, '34', 'operation_sn', '绑定的业务类型', 'int', 'Long', 'operationSn', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 12, 'admin', '2022-11-23 11:03:36', '', NULL);
INSERT INTO `gen_table_column` VALUES (433, '33', 'sensor_id', '', 'int', 'Long', 'sensorId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 10, '', '2022-11-23 11:10:00', '', '2022-11-25 13:55:17');
INSERT INTO `gen_table_column` VALUES (434, '33', 'sensor_type', '', 'tinyint', 'Long', 'sensorType', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', '', 11, '', '2022-11-23 11:10:00', '', '2022-11-25 13:55:17');
INSERT INTO `gen_table_column` VALUES (435, '35', 'sn_id', '终端id', 'bigint', 'Long', 'snId', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2022-11-23 11:26:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (436, '35', 'sn', 'sn = terminalEUI + sensorID', 'varchar(25)', 'String', 'sn', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2022-11-23 11:26:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (437, '35', 'terminal_eui', 'lora终端出厂Eui', 'varchar(20)', 'String', 'terminalEui', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2022-11-23 11:26:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (438, '35', 'gateway_eui', '关联的网关eui', 'varchar(20)', 'String', 'gatewayEui', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2022-11-23 11:26:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (439, '35', 'sensor_id', '传感器id：0~255', 'int', 'Long', 'sensorId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2022-11-23 11:26:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (440, '35', 'sensor_type', '服务类型(传感器类型)', 'tinyint', 'Long', 'sensorType', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', '', 6, 'admin', '2022-11-23 11:26:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (441, '35', 'app_eui', '终端设备的AppEUI', 'varchar(40)', 'String', 'appEui', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2022-11-23 11:26:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (442, '35', 'run_state', '0 在线 1离线 默认在线', 'char(1)', 'String', 'runState', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2022-11-23 11:26:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (443, '35', 'active_state', '0 未激活1 已激活 默认未激活', 'char(1)', 'String', 'activeState', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2022-11-23 11:26:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (444, '35', 'last_msg_dt', '最后一次发送消息时间', 'timestamp', 'Date', 'lastMsgDt', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 10, 'admin', '2022-11-23 11:26:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (445, '35', 'app_id', '关联appID', 'bigint', 'Long', 'appId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 11, 'admin', '2022-11-23 11:26:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (446, '35', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 12, 'admin', '2022-11-23 11:26:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (447, '35', 'app_name', 'app名称', 'varchar(20)', 'String', 'appName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 13, 'admin', '2022-11-23 11:26:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (448, '35', 'mac_type', 'MAC协议类型包括面向事件的随机接入（01）、面向传感器监测的周期接入（02）、面向广播与控制下行连接（03）等。', 'char(1)', 'String', 'macType', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', '', 14, 'admin', '2022-11-23 11:26:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (449, '35', 'work_id', '业务类型', 'int', 'Long', 'workId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 15, 'admin', '2022-11-23 11:26:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (450, '35', 'threshold', '阈值', 'int', 'Long', 'threshold', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 16, 'admin', '2022-11-23 11:26:35', '', NULL);
INSERT INTO `gen_table_column` VALUES (451, '33', 'app_eui', NULL, 'varchar(255)', 'String', 'appEui', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 12, '', '2022-11-25 13:55:17', '', NULL);
INSERT INTO `gen_table_column` VALUES (452, '33', 'run_state', '入网状态 0：未入网 1：入网', 'char(1)', 'String', 'runState', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 13, '', '2022-11-25 13:55:17', '', NULL);
INSERT INTO `gen_table_column` VALUES (453, '33', 'app_type', '业务类型', 'int', 'Long', 'appType', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', '', 14, '', '2022-11-25 13:55:17', '', NULL);
INSERT INTO `gen_table_column` VALUES (454, '33', 'payload', NULL, 'varchar(255)', 'String', 'payload', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 15, '', '2022-11-25 13:55:17', '', NULL);

-- ----------------------------
-- Table structure for login_return
-- ----------------------------
DROP TABLE IF EXISTS `login_return`;
CREATE TABLE `login_return`  (
  `return_id` bigint NOT NULL,
  `work_id` int NULL DEFAULT NULL,
  `business_cycle` int NULL DEFAULT NULL COMMENT '业务周期',
  `time_slot_width` int NULL DEFAULT NULL COMMENT '时隙宽度',
  `threshold` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '阈值',
  `time_window` int NULL DEFAULT NULL COMMENT '时间窗口',
  `sn` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `terminal_eui` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'terminalEui',
  `frame` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '帧结构',
  `sensor_id` int NULL DEFAULT NULL,
  `sensor_type` tinyint NULL DEFAULT NULL,
  `app_eui` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `run_state` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '入网状态 0：未入网 1：入网',
  `app_type` int NULL DEFAULT NULL COMMENT '业务类型',
  `payload` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `length` int NULL DEFAULT NULL COMMENT '长度',
  `virtual_subnet` int NULL DEFAULT NULL COMMENT '虚拟子网号'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of login_return
-- ----------------------------
INSERT INTO `login_return` VALUES (1, 1001, 1, 1, '1,-2,3', 1, '12344', '123', NULL, 1, 2, '111111', NULL, 0, '01130a01', NULL, NULL);
INSERT INTO `login_return` VALUES (2, 2002, 1, 2, '1,-2,3', 2, '12344', '123', NULL, 2, 1, '111111', NULL, 1, '2ab2', NULL, NULL);

-- ----------------------------
-- Table structure for lora_app
-- ----------------------------
DROP TABLE IF EXISTS `lora_app`;
CREATE TABLE `lora_app`  (
  `app_id` bigint NOT NULL AUTO_INCREMENT COMMENT '应用id',
  `app_eui` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'appEui',
  `app_secret` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'app密钥',
  `app_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '应用名称',
  `descript` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '应用描述',
  `terminals` int NULL DEFAULT NULL COMMENT '连接终端数量',
  `manager_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '管理者名字',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `timeto` datetime(0) NULL DEFAULT NULL COMMENT '授权结束日期',
  `auth_state` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '授权状态 0：已授权 1：未授权',
  `version` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'APP版本号',
  `company` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公司',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `auth_starttime` datetime(0) NULL DEFAULT NULL COMMENT '授权起始日期',
  PRIMARY KEY (`app_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 67 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '应用表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of lora_app
-- ----------------------------
INSERT INTO `lora_app` VALUES (1, '111111', NULL, '立库检测', NULL, NULL, 'Kimi', '18991970777', '2022-11-30 00:00:00', '0', NULL, 'ISIP', '2022-11-13 10:36:58', '2022-11-16 00:00:00');
INSERT INTO `lora_app` VALUES (2, '222222', NULL, '档案管理', NULL, NULL, 'Alexis', '15325939402', '2023-03-04 00:00:00', '0', NULL, 'ISIP', '2022-10-04 15:25:07', '2022-11-16 00:00:00');
INSERT INTO `lora_app` VALUES (3, '333333', NULL, 'RFID机器人', NULL, NULL, 'Susilo', '18991972999', '2023-03-04 00:00:00', '0', NULL, 'ISIP', '2022-10-04 15:25:07', '2022-10-04 00:00:00');
INSERT INTO `lora_app` VALUES (4, '444444', NULL, '智能货柜', NULL, NULL, 'Madline', '18294382933', '2022-11-30 00:00:00', '0', NULL, 'ISIP', '2022-11-13 10:36:58', '2022-11-16 00:00:00');
INSERT INTO `lora_app` VALUES (5, '555555', NULL, '电力机房', NULL, NULL, 'Yangchen', '15275029511', '2022-11-30 00:00:00', '0', NULL, 'ISIP', '2022-11-13 10:36:58', '2022-11-16 00:00:00');
INSERT INTO `lora_app` VALUES (6, '666666', NULL, 'RFID传送带', NULL, NULL, 'Sara', '13332494025', '2022-11-30 00:00:00', '0', NULL, 'ISIP', '2022-11-13 10:36:58', '2022-11-16 00:00:00');

-- ----------------------------
-- Table structure for lora_appserver
-- ----------------------------
DROP TABLE IF EXISTS `lora_appserver`;
CREATE TABLE `lora_appserver`  (
  `id` bigint NOT NULL,
  `appserver_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `appserver_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `appserver_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `authorize_time` datetime(0) NULL DEFAULT NULL,
  `last_msg_dt` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of lora_appserver
-- ----------------------------

-- ----------------------------
-- Table structure for lora_data
-- ----------------------------
DROP TABLE IF EXISTS `lora_data`;
CREATE TABLE `lora_data`  (
  `data_id` bigint NOT NULL AUTO_INCREMENT COMMENT '数据ID',
  `terminal_eui` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '终端设备Eui',
  `sensor_id` int NULL DEFAULT NULL COMMENT '传感器ID',
  `sn` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '传感器sn',
  `gateway_eui` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '网关eui',
  `app_eui` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'appEui',
  `sensor_type` int NULL DEFAULT NULL COMMENT '传感器数据类型',
  `recv_data` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '接收数据的十六进制字符串',
  `recv_afterdata` varchar(2048) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '解析后的数据内容',
  `recv_time` timestamp(0) NULL DEFAULT NULL COMMENT 'appserver接收时间',
  `msg_length` double NULL DEFAULT NULL COMMENT '消息内容长度',
  `read_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '是否已读',
  `msg_version` int NULL DEFAULT NULL COMMENT '消息版本号',
  `warning_flag` int NULL DEFAULT 0 COMMENT '是否为报警消息，是报警消息：1',
  `app_type` int NULL DEFAULT NULL COMMENT '业务类型',
  PRIMARY KEY (`data_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 191675 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'appserver帧数据表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of lora_data
-- ----------------------------
INSERT INTO `lora_data` VALUES (191604, '123', 0, '12300001', NULL, '111111', 1, 'C08F126F3EFAE1484316199A42040000', '{t=32.0, x=-4.24, y=0.37, z=139.05}', '2022-11-14 09:51:10', NULL, '0', NULL, 0, NULL);
INSERT INTO `lora_data` VALUES (191605, '123', 0, '12300001', NULL, '111111', 1, 'C08F126F3EFAE1484316199A42040000', '{t=32.0, x=-4.24, y=0.37, z=139.05}', '2022-11-14 09:51:35', NULL, '0', NULL, 1, NULL);
INSERT INTO `lora_data` VALUES (191606, '123', 0, '12300001', NULL, '111111', 1, 'C08F126F3EFAE1484316199A42040000', '{t=32.0, x=-4.24, y=0.37, z=139.05}', '2022-11-14 09:51:52', NULL, '0', NULL, 1, NULL);
INSERT INTO `lora_data` VALUES (191607, '123', 0, '12300001', NULL, '111111', 1, 'C08F126F3EFAE1484316199A42040000', '{t=32.0, x=-4.24, y=0.37, z=139.05}', '2022-11-14 09:54:50', NULL, '0', NULL, 1, NULL);
INSERT INTO `lora_data` VALUES (191608, '123', 0, '12300001', NULL, '111111', 1, 'C08F126F3EFAE1484316199A42040000', '{t=32.0, x=-4.24, y=0.37, z=139.05}', '2022-11-14 09:55:29', NULL, '0', NULL, 0, NULL);
INSERT INTO `lora_data` VALUES (191609, '123', 0, '12300001', NULL, '111111', 1, 'C08F126F3EFAE1484316199A42040000', '{t=32.0, x=-4.24, y=0.37, z=139.05}', '2022-11-14 09:58:03', NULL, '0', NULL, 0, NULL);
INSERT INTO `lora_data` VALUES (191610, '123', 0, '12300001', NULL, '111111', 1, 'C08F126F3EFAE1484316199A42040000', '{t=32.0, x=-4.24, y=0.37, z=139.05}', '2022-11-14 09:59:08', NULL, '0', NULL, 0, NULL);
INSERT INTO `lora_data` VALUES (191611, '123', 0, '12300001', NULL, '111111', 1, 'C08F126F3EFAE1484316199A42040000', '{t=32.0, x=-4.24, y=0.37, z=139.05}', '2022-11-14 10:01:22', NULL, '0', NULL, 0, NULL);
INSERT INTO `lora_data` VALUES (191612, '123', 0, '12300001', NULL, '222222', 1, 'C08F126F3EFAE1484316199A42040000', '{t=32.0, x=-4.24, y=0.37, z=139.05}', '2022-11-14 10:02:19', NULL, '0', NULL, 0, NULL);
INSERT INTO `lora_data` VALUES (191613, '123', 0, '12300001', NULL, '222222', 1, 'C08F126F3EFAE1484316199A42040000', '{t=32.0, x=-4.24, y=0.37, z=139.05}', '2022-11-14 10:05:09', NULL, '0', NULL, 0, NULL);
INSERT INTO `lora_data` VALUES (191614, '123', 0, '12300001', NULL, '444444', 1, 'C08F126F3EFAE1484316199A42040000', '{t=32.0, x=-4.24, y=0.37, z=139.05}', '2022-11-14 10:07:21', NULL, '0', NULL, 0, NULL);
INSERT INTO `lora_data` VALUES (191615, '123', 0, '12300001', NULL, '444444', 1, 'C08F126F3EFAE1484316199A42040000', '{t=32.0, x=-4.24, y=0.37, z=139.05}', '2022-11-14 10:08:06', NULL, '0', NULL, 0, NULL);
INSERT INTO `lora_data` VALUES (191616, '123', 0, '12300001', NULL, '555555', 1, 'C08F126F3EFAE1484316199A42040000', '{t=32.0, x=-4.24, y=0.37, z=139.05}', '2022-11-14 10:10:22', NULL, '0', NULL, 0, NULL);
INSERT INTO `lora_data` VALUES (191617, '123', 0, '12300001', NULL, '555555', 1, 'C08F126F3EFAE1484316199A42040000', '{t=32.0, x=-4.24, y=0.37, z=139.05}', '2022-11-14 10:12:49', NULL, '0', NULL, 0, NULL);
INSERT INTO `lora_data` VALUES (191618, '123', 0, '12300001', NULL, '555555', 1, 'C08F126F3EFAE1484316199A42040000', '{t=32.0, x=-4.24, y=0.37, z=139.05}', '2022-11-14 10:16:03', NULL, '0', NULL, 0, NULL);
INSERT INTO `lora_data` VALUES (191619, '123', 0, '12300001', NULL, '111111', 1, 'C08F126F3EFAE1484316199A42040000', '{t=32.0, x=-4.24, y=0.37, z=139.05}', '2022-11-14 10:17:30', NULL, '0', NULL, 0, NULL);
INSERT INTO `lora_data` VALUES (191620, '123', 0, '12300001', NULL, '111111', 1, 'C08F126F3EFAE1484316199A42040000', '{t=32.0, x=-4.24, y=0.37, z=139.05}', '2022-11-14 10:18:46', NULL, '0', NULL, 0, NULL);
INSERT INTO `lora_data` VALUES (191621, '123', 0, '12300001', NULL, '111111', 1, 'C08F126F3EFAE1484316199A42040000', '{t=32.0, x=-4.24, y=0.37, z=139.05}', '2022-11-14 10:20:09', NULL, '0', NULL, 0, NULL);
INSERT INTO `lora_data` VALUES (191622, '123', 0, '12300001', NULL, '111111', 1, 'C08F126F3EFAE1484316199A42040000', '{t=32.0, x=-4.24, y=0.37, z=139.05}', '2022-11-14 10:37:25', NULL, '0', NULL, 0, NULL);
INSERT INTO `lora_data` VALUES (191623, '123', 0, '12300001', NULL, '111111', 1, 'C08F126F3EFAE1484316199A42040000', '{t=32.0, x=-4.24, y=0.37, z=139.05}', '2022-11-14 10:47:00', NULL, '0', NULL, 0, NULL);
INSERT INTO `lora_data` VALUES (191624, '123', 0, '12300001', NULL, '111111', 1, 'C08F126F3EFAE1484316199A42040000', '{t=32.0, x=-4.24, y=0.37, z=139.05}', '2022-11-14 10:49:30', NULL, '0', NULL, 0, NULL);
INSERT INTO `lora_data` VALUES (191625, '123', 0, '12300001', NULL, '111111', 1, 'C08F126F3EFAE1484316199A42040000', '{t=32.0, x=-4.24, y=0.37, z=139.05}', '2022-11-16 13:26:55', NULL, '0', NULL, 0, NULL);
INSERT INTO `lora_data` VALUES (191626, '123', 0, '12300001', NULL, '111111', 1, 'C08F126F3EFAE1484316199A42040000', '{t=32.0, x=-4.24, y=0.37, z=139.05}', '2022-11-16 13:30:11', NULL, '0', NULL, 0, NULL);
INSERT INTO `lora_data` VALUES (191627, '123', 0, '12300001', NULL, '111111', 1, 'C08F126F3EFAE1484316199A42040000', '{t=32.0, x=-4.24, y=0.37, z=139.05}', '2022-11-16 13:32:16', NULL, '0', NULL, 0, NULL);
INSERT INTO `lora_data` VALUES (191628, '123', 0, '12300001', NULL, '111111', 1, 'C08F126F3EFAE1484316199A42040000', '{t=32.0, x=-4.24, y=0.37, z=139.05}', '2022-11-16 13:34:49', NULL, '0', NULL, 0, NULL);
INSERT INTO `lora_data` VALUES (191629, '123', 0, '12300001', NULL, '111111', 1, 'C08F126F3EFAE1484316199A42040000', '{t=32.0, x=-4.24, y=0.37, z=139.05}', '2022-11-16 13:36:23', NULL, '0', NULL, 0, NULL);
INSERT INTO `lora_data` VALUES (191630, '123', 0, '12300001', NULL, '111111', 1, 'C08F126F3EFAE1484316199A42040000', '{t=32.0, x=-4.24, y=0.37, z=139.05}', '2022-11-18 21:33:29', NULL, '0', NULL, 0, NULL);
INSERT INTO `lora_data` VALUES (191631, '123', 0, '12300001', NULL, '111111', 1, 'C08F126F3EFAE1484316199A42040000', '{t=32.0, x=-4.24, y=0.37, z=139.05}', '2022-11-19 15:28:39', NULL, '0', NULL, 0, NULL);
INSERT INTO `lora_data` VALUES (191632, '123', 0, '12300001', NULL, '111111', 1, 'C08F126F3EFAE1484316199A42040000', '{t=32.0, x=-4.24, y=0.37, z=139.05}', '2022-11-19 15:32:24', NULL, '0', NULL, 0, NULL);
INSERT INTO `lora_data` VALUES (191633, '123', 0, '12300001', NULL, '111111', 1, 'C08F126F3EFAE1484316199A42040000', '{t=32.0, x=-4.24, y=0.37, z=139.05}', '2022-11-19 15:36:25', NULL, '0', NULL, 0, NULL);
INSERT INTO `lora_data` VALUES (191635, '123', 0, '12300001', NULL, '111111', 1, 'C08F126F3EFAE1484316199A42040000', '{t=32.0, x=-4.94, y=1.37, z=651.05}', '2022-11-19 16:23:21', NULL, '0', NULL, 0, NULL);
INSERT INTO `lora_data` VALUES (191636, '123', 0, '12300001', NULL, '111111', 1, 'C08F126F3EFAE1484316199A42040000', '{t=32.0, x=-4.47, y=4.31, z=2181.53}', '2022-11-19 16:27:05', NULL, '0', NULL, 0, NULL);
INSERT INTO `lora_data` VALUES (191637, '123', 0, '12300001', NULL, '111111', 1, 'C08F126F3EFAE1484316199A42040000', '{t=32.0, x=-4.47, y=0.49, z=150.1}', '2022-11-21 09:42:14', NULL, '0', NULL, 0, NULL);
INSERT INTO `lora_data` VALUES (191638, '123', 0, '12300001', NULL, '111111', 1, 'C08F126F3EFAE1484316199A42040000', '{t=32.0, x=0.0, y=0.49, z=150.1}', '2022-11-26 10:26:33', NULL, '0', NULL, 0, NULL);
INSERT INTO `lora_data` VALUES (191639, '123', 0, '12300001', NULL, '111111', 1, 'C08F126F3EFAE1484316199A42040000', '{t=32.0, x=0.0, y=0.49, z=150.1}', '2022-11-26 10:27:38', NULL, '0', NULL, 0, NULL);
INSERT INTO `lora_data` VALUES (191640, '123', 0, '12300001', NULL, '111111', 1, 'C08F126F3EFAE1484316199A42040000', '{t=32.0, x=0.0, y=0.49, z=150.1}', '2022-12-06 12:05:56', NULL, '0', NULL, 0, NULL);
INSERT INTO `lora_data` VALUES (191641, '123', 0, '12300001', NULL, '111111', 1, 'C08F126F3EFAE1484316199A42040000', '{t=32.0, x=0.0, y=0.49, z=150.1}', '2022-12-06 12:06:04', NULL, '0', NULL, 0, NULL);
INSERT INTO `lora_data` VALUES (191642, '123', 0, '12300001', NULL, '111111', 1, 'C08F126F3EFAE1484316199A42040000', '{t=32.0, x=0.0, y=0.49, z=150.1}', '2022-12-06 12:10:11', NULL, '0', NULL, 0, NULL);
INSERT INTO `lora_data` VALUES (191643, '123', 0, '12300001', NULL, '111111', 1, 'C08F126F3EFAE1484316199A42040000', '{t=32.0, x=0.0, y=0.49, z=150.1}', '2022-12-06 12:12:14', NULL, '0', NULL, 0, NULL);
INSERT INTO `lora_data` VALUES (191644, '123', 0, '12300001', NULL, '111111', 1, 'C08F126F3EFAE1484316199A42040000', '{t=32.0, x=0.0, y=0.49, z=150.1}', '2022-12-06 12:13:27', NULL, '0', NULL, 0, NULL);
INSERT INTO `lora_data` VALUES (191645, '123', 0, '12300001', NULL, '111111', 1, 'C08F126F3EFAE1484316199A42040000', '{t=32.0, x=0.0, y=0.49, z=150.1}', '2022-12-06 12:18:28', NULL, '0', NULL, 0, NULL);
INSERT INTO `lora_data` VALUES (191646, '123', 1, '12300117', NULL, '111111', 17, '51010001C08F126F3EFAE1484316199A42040000', NULL, '2022-12-06 12:27:21', NULL, '0', NULL, 0, NULL);
INSERT INTO `lora_data` VALUES (191647, '123', 1, '12300117', NULL, '111111', 17, '51010001C08F126F3EFAE1484316199A42040000', NULL, '2022-12-06 15:52:32', NULL, '0', NULL, 0, NULL);
INSERT INTO `lora_data` VALUES (191648, '123', 1, '12300117', NULL, '111111', 17, '51010001C08F126F3EFAE1484316199A42040000', NULL, '2022-12-06 15:53:55', NULL, '0', NULL, 0, NULL);
INSERT INTO `lora_data` VALUES (191649, '123', 1, '12300117', NULL, '111111', 17, '51010001C08F126F3EFAE1484316199A42040000', NULL, '2022-12-06 15:57:21', NULL, '0', NULL, 0, NULL);
INSERT INTO `lora_data` VALUES (191650, '123', 1, '12300117', NULL, '111111', 17, '51010001C08F126F3EFAE1484316199A42040000', NULL, '2022-12-06 15:58:45', NULL, '0', NULL, 0, NULL);
INSERT INTO `lora_data` VALUES (191651, '123', 1, '12300117', NULL, '111111', 17, '51010001', NULL, '2022-12-06 15:59:06', NULL, '0', NULL, 0, NULL);
INSERT INTO `lora_data` VALUES (191652, '123', 1, '12300117', NULL, '111111', 17, '51010001', NULL, '2022-12-06 16:00:24', NULL, '0', NULL, 0, NULL);
INSERT INTO `lora_data` VALUES (191653, '123', 1, '12300117', NULL, '111111', 17, '51010001', NULL, '2022-12-06 16:01:58', NULL, '0', NULL, 0, NULL);
INSERT INTO `lora_data` VALUES (191654, '123', 1, '12300101', NULL, '111111', 1, '41010001AAC08F126F3EFAE1484316199A42040000', '{t=131072.0, x=-0.0, y=-0.0, z=5.910544585341787E28}', '2022-12-06 16:06:07', NULL, '0', NULL, 0, NULL);
INSERT INTO `lora_data` VALUES (191655, '123', 1, '12300101', NULL, '111111', 1, '41010001AAC08F126F3EFAE1484316199A42040000', '{t=131072.0, x=-4.47, y=-0.0, z=5.910544585341787E28}', '2022-12-06 16:08:55', NULL, '0', NULL, 0, NULL);
INSERT INTO `lora_data` VALUES (191656, '123', 1, '12300101', NULL, '111111', 1, '41010001AAC08F126F3EFAE1484316199A42040000', '{t=131072.0, x=-4.47, y=-0.0, z=5.910544585341787E28}', '2022-12-06 16:09:59', NULL, '0', NULL, 0, NULL);
INSERT INTO `lora_data` VALUES (191657, '123', 1, '12300101', NULL, '111111', 1, '41010001AAC08F126F3EFAE1484316199A42040000', '{t=32.0, x=-4.47, y=0.49, z=150.1}', '2022-12-06 16:14:17', NULL, '0', NULL, 0, NULL);
INSERT INTO `lora_data` VALUES (191658, '123', 1, '12300102', NULL, '111111', 2, '42010001AA002010104000050500', NULL, '2022-12-06 16:21:09', NULL, '0', NULL, 0, NULL);
INSERT INTO `lora_data` VALUES (191659, '123', 1, '12300102', NULL, '111111', 2, '42010001AA002010104000050500', '{x=-2.016, y=-4.0, z=-81.28}', '2022-12-06 16:23:37', NULL, '0', NULL, 0, NULL);
INSERT INTO `lora_data` VALUES (191660, '123', 1, '12300102', NULL, '111111', 2, '42010001AA002010104000050500', '{x=-2.016, y=-4.0, z=-81.28}', '2022-12-06 16:26:21', NULL, '0', NULL, 0, NULL);
INSERT INTO `lora_data` VALUES (191661, '123', 1, '12300102', NULL, '111111', 2, '42010001AA002010104000050500', '{x=-2.016, y=-4.0, z=-81.28}', '2022-12-06 16:29:41', NULL, '0', NULL, 0, NULL);
INSERT INTO `lora_data` VALUES (191662, '123', 1, '12300102', NULL, '111111', 2, '42010001AA002010104000050500', '{x=2.016, y=-4.0, z=81.28}', '2022-12-06 16:32:32', NULL, '0', NULL, 0, NULL);
INSERT INTO `lora_data` VALUES (191663, '123', 1, '12300102', NULL, '111111', 2, '42010001AA002010104000050500', '{x=2.01, y=-4.0, z=80.5}', '2022-12-06 16:35:15', NULL, '0', NULL, 0, NULL);
INSERT INTO `lora_data` VALUES (191664, '123', 1, '12300102', NULL, '111111', 2, '42010001AA002010104000050500', '{x=2.01, y=-4.0, z=50.5}', '2022-12-06 16:36:04', NULL, '0', NULL, 0, NULL);
INSERT INTO `lora_data` VALUES (191665, '123', 1, '12300104', NULL, '111111', 4, '44010001AA002010104000050500', NULL, '2022-12-06 16:42:12', NULL, '0', NULL, 0, NULL);
INSERT INTO `lora_data` VALUES (191666, '123', 1, '12300104', NULL, '111111', 4, '44010001AA002010104000050500', NULL, '2022-12-06 16:43:30', NULL, '0', NULL, 0, NULL);
INSERT INTO `lora_data` VALUES (191667, '123', 1, '12300104', NULL, '111111', 4, '44010001AA002010104000050500', NULL, '2022-12-06 16:50:13', NULL, '0', NULL, 0, 1);
INSERT INTO `lora_data` VALUES (191668, '123', 1, '12300104', NULL, '111111', 4, '44010001AA002010104000050500', NULL, '2022-12-06 16:52:19', 170, '0', NULL, 0, 1);
INSERT INTO `lora_data` VALUES (191669, '123', 1, '12300104', NULL, '111111', 4, '44010001AA002010104000050500', NULL, '2022-12-06 17:07:46', 170, '0', NULL, 0, 1);
INSERT INTO `lora_data` VALUES (191670, '123', 1, '12300104', NULL, '111111', 4, '44010001AA42DEEB3E41930000', '{x=111.46, y=18.38}', '2022-12-06 17:21:07', 170, '0', NULL, 0, 1);
INSERT INTO `lora_data` VALUES (191671, '123', 1, '12300103', NULL, '111111', 3, '43010001AA006400120064000A', '{p=1, x=10, y=1, z=10}', '2022-12-06 17:36:02', 170, '0', NULL, 0, 1);
INSERT INTO `lora_data` VALUES (191672, '123', 1, '12300103', NULL, '111111', 3, '43010001AA006400120064000A', '{p=10, x=10, y=1, z=10}', '2022-12-06 17:37:42', 170, '0', NULL, 0, 1);
INSERT INTO `lora_data` VALUES (191673, '123', 1, '12300103', NULL, '111111', 3, '43010001AA006400120064000A', '{p=10, x=100, y=18, z=100}', '2022-12-06 17:39:14', 170, '0', NULL, 0, 1);
INSERT INTO `lora_data` VALUES (191674, '123', 1, '12300103', NULL, '111111', 3, '43010001AA006400120064000A', '{p=10.0, x=10.0, y=1.8, z=10.0}', '2022-12-06 17:41:28', 170, '0', NULL, 0, 1);
INSERT INTO `lora_data` VALUES (191675, '123', 1, '12300103', NULL, '111111', 3, '43010001AA006400120064000A', '{PM2.5=10.0, temperature=10.0, noise=10.0, humidity=1.8}', '2022-12-06 17:46:10', 170, '0', NULL, 0, 1);

-- ----------------------------
-- Table structure for lora_gateway
-- ----------------------------
DROP TABLE IF EXISTS `lora_gateway`;
CREATE TABLE `lora_gateway`  (
  `gateway_id` bigint NOT NULL AUTO_INCREMENT,
  `gw_eui` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT '网关eui',
  `name` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT '网关名称',
  `fw_version` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT '网关固件版本',
  `run_state` tinyint(1) NULL DEFAULT NULL COMMENT '网关当前状态  0.未注册（平台侧网关初始化完成后的状态-创建后）1.	工作状态；2.	不在线（接入注册完成，网关不在线）；3.	被BAR状态；4.	异常状态；（ 1供电切断，改电池供电 2 LOAR 发送阻塞 3 LOAR 接收阻塞）5.	OTA版本升级状态；',
  `create_dt` timestamp(0) NULL DEFAULT NULL COMMENT '创建时间',
  `reg_dt` timestamp(0) NULL DEFAULT NULL COMMENT '注册时间，接收到第一次注册消息时间',
  `last_conn_dt` timestamp(0) NULL DEFAULT NULL COMMENT '最后一次连接时间',
  `last_msg_dt` timestamp(0) NULL DEFAULT NULL COMMENT '最后一次发送消息时间',
  `battery` float NULL DEFAULT NULL COMMENT '电池剩余容量，0~100，电池容量百分比',
  `power_type` tinyint(1) NULL DEFAULT NULL COMMENT '供电类型，1、市电，2、太阳能，3poe，4电池',
  `gps` varchar(110) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT '网关位置：4546.40891,N,12639.65641,E字段1：纬度ddmm.mmmm，度分格式字段2：纬度N（北纬）或S（南纬）字段3：经度dddmm.mmmm，度分格式字段4：经度E（东经）或W（西经）位数不够后面补‘\\\\0’。',
  `lora_count` tinyint NULL DEFAULT NULL COMMENT '共有几个Lora接口，由网关注册时更新。',
  PRIMARY KEY (`gateway_id`) USING BTREE,
  UNIQUE INDEX `11`(`gw_eui`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 90 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '网关表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of lora_gateway
-- ----------------------------
INSERT INTO `lora_gateway` VALUES (4, '16843025', 'xi', '1', 2, '2018-08-27 15:12:10', '2019-01-19 09:54:31', '2019-01-30 16:46:51', '2019-01-30 16:46:37', 50, 1, '108.8990,34.1538', 4);
INSERT INTO `lora_gateway` VALUES (5, '16847121', 'wg', '1', 5, '2018-10-04 14:23:24', '2019-01-30 19:57:12', '2019-01-30 19:57:12', '2019-01-30 19:57:28', 50, 1, '108.8990,34.1538', 4);
INSERT INTO `lora_gateway` VALUES (6, '16843008', 'rr', '1', 2, '2018-10-04 14:24:59', '2019-03-16 09:45:36', '2019-07-30 10:50:08', '2019-07-30 10:47:50', 33, 1, '108.8989,34.1537', 4);
INSERT INTO `lora_gateway` VALUES (8, '16843011', '2', '1', 2, '2019-01-30 20:23:55', '2020-08-08 11:31:17', '2020-09-09 21:56:27', '2020-09-09 21:56:10', 33, 1, '108.8989,34.1537', 4);
INSERT INTO `lora_gateway` VALUES (9, '16843012', '3', '1', 2, '2019-01-30 20:23:58', '2020-08-23 18:42:24', '2020-09-04 17:01:53', '2020-09-04 17:00:13', 33, 1, '108.8989,34.1537', 4);
INSERT INTO `lora_gateway` VALUES (10, '16843013', '4', '1', 2, '2019-01-30 20:24:00', '2019-08-10 18:56:36', '2019-08-14 16:20:49', '2019-08-14 16:20:28', 33, 1, '108.8991,34.1549', 4);
INSERT INTO `lora_gateway` VALUES (12, '16843015', '6', '0', 1, '2019-01-30 20:24:06', '2021-03-03 08:46:40', '2021-03-22 20:45:27', '2021-03-22 20:45:28', 33, 1, '108.8989,34.1537', 4);
INSERT INTO `lora_gateway` VALUES (13, '16843016', '7', '1', 2, '2019-01-30 20:24:08', '2019-02-15 15:27:17', '2019-02-15 15:29:58', '2019-02-15 15:29:31', 33, 1, '108.8989,34.1539', 4);
INSERT INTO `lora_gateway` VALUES (14, '16843009', 'y', '', 2, NULL, '2020-05-13 23:04:11', '2020-08-23 16:11:16', '2020-08-23 16:10:57', 33, 1, '108.8989,34.1537', 4);
INSERT INTO `lora_gateway` VALUES (15, '16843010', 'yy', '', 2, NULL, '2020-07-11 08:40:24', '2021-01-22 11:30:13', '2021-01-22 11:29:54', 33, 1, '108.8989,34.1537', 4);
INSERT INTO `lora_gateway` VALUES (18, '16843054', 'rds', '', 0, NULL, NULL, NULL, NULL, NULL, 0, '', NULL);
INSERT INTO `lora_gateway` VALUES (74, '16844013', 'ceshi', '', 2, '2019-05-15 20:52:16', '2019-05-29 18:11:51', '2019-08-05 10:04:37', '2020-12-29 18:19:26', 33, 1, '108.8988,34.1539', 4);
INSERT INTO `lora_gateway` VALUES (81, '16843014', '332', '', 2, '2020-07-18 20:10:05', '2020-10-20 21:43:54', '2020-12-10 16:58:13', '2020-12-10 16:58:05', 33, 1, '108.8989,34.1537', 4);
INSERT INTO `lora_gateway` VALUES (85, '16843019', '332', '', 0, '2020-07-18 20:14:30', NULL, NULL, NULL, 66, 0, '', NULL);
INSERT INTO `lora_gateway` VALUES (86, '16843045', 'kang yang', '', 0, '2020-09-03 23:00:56', NULL, NULL, NULL, 66, 0, '', NULL);
INSERT INTO `lora_gateway` VALUES (89, '123456', '1112', '', 0, '2020-09-17 16:42:27', NULL, NULL, NULL, 66, 0, '', NULL);
INSERT INTO `lora_gateway` VALUES (90, '20110103', 'pp', '', 0, '2021-02-23 11:11:12', NULL, NULL, NULL, 66, 0, '', NULL);

-- ----------------------------
-- Table structure for lora_interface
-- ----------------------------
DROP TABLE IF EXISTS `lora_interface`;
CREATE TABLE `lora_interface`  (
  `id` int NOT NULL,
  `transmit_power` int NULL DEFAULT NULL COMMENT '发射功率',
  `bandwidth` int NULL DEFAULT NULL COMMENT '发射频率带宽',
  `spreading_factor` int NULL DEFAULT NULL COMMENT '扩频因子',
  `lora_id` int NULL DEFAULT NULL COMMENT '接口编号',
  `band` int NULL DEFAULT NULL COMMENT '波特率',
  `frequency` int NULL DEFAULT NULL COMMENT '信道频率',
  `gw_eui` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '网关eui',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of lora_interface
-- ----------------------------

-- ----------------------------
-- Table structure for lora_node
-- ----------------------------
DROP TABLE IF EXISTS `lora_node`;
CREATE TABLE `lora_node`  (
  `terminal_id` bigint NOT NULL AUTO_INCREMENT COMMENT '终端id',
  `terminal_eui` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT '终端出厂ID',
  `active_state` tinyint(1) NULL DEFAULT NULL COMMENT '0 未激活1 已激活',
  `run_state` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '运行状态',
  `battery` float NULL DEFAULT NULL COMMENT '电池电量',
  `last_msg_dt` timestamp(0) NULL DEFAULT NULL COMMENT '最后一次发送消息时间',
  `gateway_eui` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '网关id',
  `app_eui` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联appEui',
  PRIMARY KEY (`terminal_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '传感器表 ' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of lora_node
-- ----------------------------
INSERT INTO `lora_node` VALUES (1, '123', 1, NULL, NULL, NULL, NULL, '111111');

-- ----------------------------
-- Table structure for lora_operation
-- ----------------------------
DROP TABLE IF EXISTS `lora_operation`;
CREATE TABLE `lora_operation`  (
  `operation_id` bigint NOT NULL COMMENT '业务id',
  `operation_sn` int NULL DEFAULT NULL COMMENT '业务编号',
  `openration_describe` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '业务类型注释',
  PRIMARY KEY (`operation_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of lora_operation
-- ----------------------------

-- ----------------------------
-- Table structure for lora_terminal
-- ----------------------------
DROP TABLE IF EXISTS `lora_terminal`;
CREATE TABLE `lora_terminal`  (
  `sn_id` bigint NOT NULL AUTO_INCREMENT COMMENT '终端id',
  `sn` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'sn = terminalEUI + sensorID',
  `terminal_eui` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT 'lora终端出厂Eui',
  `gateway_eui` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联的网关eui',
  `sensor_id` int NULL DEFAULT NULL COMMENT '传感器id：0~255',
  `sensor_type` tinyint NULL DEFAULT NULL COMMENT '服务类型(传感器类型)',
  `app_eui` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT '终端设备的AppEUI',
  `run_state` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '0 在线 1离线 默认在线',
  `active_state` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '0 未激活1 已激活 默认未激活',
  `last_msg_dt` timestamp(0) NULL DEFAULT NULL COMMENT '最后一次发送消息时间',
  `app_id` bigint NULL DEFAULT NULL COMMENT '关联appID',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `app_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'app名称',
  `mac_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT 'MAC协议类型包括面向事件的随机接入（01）、面向传感器监测的周期接入（02）、面向广播与控制下行连接（03）等。',
  `work_id` int NULL DEFAULT NULL COMMENT '业务类型',
  `threshold` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '阈值',
  `cycle` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '周期',
  PRIMARY KEY (`sn_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 136 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '终端表 ' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of lora_terminal
-- ----------------------------
INSERT INTO `lora_terminal` VALUES (83, '12344', '123', '', 1, 1, '111111', '0', '1', '2022-11-06 00:00:00', NULL, NULL, '立体仓库', NULL, NULL, '[1,2,3]', NULL);
INSERT INTO `lora_terminal` VALUES (95, '12344', '123', NULL, 2, 1, '111111', '0', '1', '2022-11-06 00:00:00', NULL, NULL, '立体仓库', NULL, NULL, '[1,2,3]', NULL);
INSERT INTO `lora_terminal` VALUES (96, '12344', '123', NULL, 3, 1, '111111', '0', '1', '2022-11-06 00:00:00', NULL, NULL, '立体仓库', NULL, NULL, '[1,2,3]', NULL);

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `blob_data` blob NULL COMMENT '存放持久化Trigger对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Blob类型的触发器表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `calendar_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '日历名称',
  `calendar` blob NOT NULL COMMENT '存放持久化calendar对象',
  PRIMARY KEY (`sched_name`, `calendar_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '日历信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `cron_expression` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'cron表达式',
  `time_zone_id` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '时区',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Cron类型的触发器表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `entry_id` varchar(95) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度器实例id',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `instance_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度器实例名',
  `fired_time` bigint NOT NULL COMMENT '触发的时间',
  `sched_time` bigint NOT NULL COMMENT '定时器制定的时间',
  `priority` int NOT NULL COMMENT '优先级',
  `state` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态',
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务组名',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否并发',
  `requests_recovery` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否接受恢复执行',
  PRIMARY KEY (`sched_name`, `entry_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '已触发的触发器表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务组名',
  `description` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `job_class_name` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '执行任务类名称',
  `is_durable` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否持久化',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否并发',
  `is_update_data` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否更新数据',
  `requests_recovery` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否接受恢复执行',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '任务详细信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `lock_name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '悲观锁名称',
  PRIMARY KEY (`sched_name`, `lock_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '存储的悲观锁信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  PRIMARY KEY (`sched_name`, `trigger_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '暂停的触发器表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `instance_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '实例名称',
  `last_checkin_time` bigint NOT NULL COMMENT '上次检查时间',
  `checkin_interval` bigint NOT NULL COMMENT '检查间隔时间',
  PRIMARY KEY (`sched_name`, `instance_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '调度器状态表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `repeat_count` bigint NOT NULL COMMENT '重复的次数统计',
  `repeat_interval` bigint NOT NULL COMMENT '重复的间隔时间',
  `times_triggered` bigint NOT NULL COMMENT '已经触发的次数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '简单触发器的信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `str_prop_1` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
  `str_prop_2` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
  `str_prop_3` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
  `int_prop_1` int NULL DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
  `int_prop_2` int NULL DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
  `long_prop_1` bigint NULL DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
  `long_prop_2` bigint NULL DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
  `dec_prop_1` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
  `dec_prop_2` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
  `bool_prop_1` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
  `bool_prop_2` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '同步机制的行锁表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '触发器的名字',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '触发器所属组的名字',
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_job_details表job_name的外键',
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_job_details表job_group的外键',
  `description` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `next_fire_time` bigint NULL DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
  `prev_fire_time` bigint NULL DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
  `priority` int NULL DEFAULT NULL COMMENT '优先级',
  `trigger_state` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '触发器状态',
  `trigger_type` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '触发器的类型',
  `start_time` bigint NOT NULL COMMENT '开始时间',
  `end_time` bigint NULL DEFAULT NULL COMMENT '结束时间',
  `calendar_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日程表名称',
  `misfire_instr` smallint NULL DEFAULT NULL COMMENT '补偿执行的策略',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  INDEX `sched_name`(`sched_name`, `job_name`, `job_group`) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '触发器详细信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '参数配置表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2022-09-27 21:29:43', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2022-09-27 21:29:43', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2022-09-27 21:29:43', '', NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES (4, '账号自助-验证码开关', 'sys.account.captchaEnabled', 'true', 'Y', 'admin', '2022-09-27 21:29:43', '', NULL, '是否开启验证码功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2022-09-27 21:29:43', '', NULL, '是否开启注册用户功能（true开启，false关闭）');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 200 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '部门表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', 'ISIP科技', 0, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-09-27 21:29:42', 'admin', '2022-10-15 13:18:47');
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '西北区', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-09-27 21:29:42', 'admin', '2022-10-15 13:18:54');
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '长沙分公司', 2, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2022-09-27 21:29:42', '', NULL);
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '立体仓库', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-09-27 21:29:42', 'admin', '2022-10-15 13:18:12');
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2022-09-27 21:29:42', '', NULL);
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '测试部门', 3, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2022-09-27 21:29:42', '', NULL);
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2022-09-27 21:29:42', '', NULL);
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2022-09-27 21:29:42', '', NULL);
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2022-09-27 21:29:42', '', NULL);
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2022-09-27 21:29:42', '', NULL);
INSERT INTO `sys_dept` VALUES (200, 101, '0,100,101', '123', 2, '123', '13333333333', '9123@qq.com', '0', '2', 'admin', '2022-10-18 15:26:47', '', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 113 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典数据表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2022-09-27 21:29:43', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2022-09-27 21:29:43', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2022-09-27 21:29:43', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2022-09-27 21:29:43', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2022-09-27 21:29:43', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2022-09-27 21:29:43', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2022-09-27 21:29:43', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2022-09-27 21:29:43', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2022-09-27 21:29:43', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2022-09-27 21:29:43', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2022-09-27 21:29:43', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2022-09-27 21:29:43', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2022-09-27 21:29:43', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2022-09-27 21:29:43', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2022-09-27 21:29:43', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2022-09-27 21:29:43', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2022-09-27 21:29:43', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2022-09-27 21:29:43', '', NULL, '其他操作');
INSERT INTO `sys_dict_data` VALUES (19, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2022-09-27 21:29:43', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (20, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2022-09-27 21:29:43', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (21, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2022-09-27 21:29:43', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (22, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2022-09-27 21:29:43', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (23, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2022-09-27 21:29:43', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (24, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2022-09-27 21:29:43', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (25, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2022-09-27 21:29:43', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (26, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2022-09-27 21:29:43', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (27, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2022-09-27 21:29:43', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (28, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2022-09-27 21:29:43', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (29, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2022-09-27 21:29:43', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (100, 0, '未授权', '0', 'app_authstate', NULL, 'default', 'N', '0', 'admin', '2022-09-27 21:31:42', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (101, 1, '已授权', '1', 'app_authstate', NULL, 'default', 'N', '0', 'admin', '2022-09-27 21:31:49', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (102, 1, '低功耗倾角传感器', '1', 'data_type', NULL, 'default', 'N', '0', 'admin', '2022-09-27 21:33:16', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (103, 2, '数字型加速度计', '2', 'data_type', NULL, 'default', 'N', '0', 'admin', '2022-09-27 21:33:25', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (104, 3, '多功能空气质量变送器', '3', 'data_type', NULL, 'default', 'N', '0', 'admin', '2022-09-27 21:33:50', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (105, 4, '压力式静力水准仪', '4', 'data_type', NULL, 'default', 'N', '0', 'admin', '2022-09-27 21:34:11', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (106, 5, '声光报警器', '5', 'data_type', NULL, 'default', 'N', '0', 'admin', '2022-09-27 21:34:21', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (107, 0, '在线', '0', 'terminal_runstate', NULL, 'default', 'N', '0', 'admin', '2022-09-27 21:35:02', 'admin', '2022-11-05 19:11:46', NULL);
INSERT INTO `sys_dict_data` VALUES (108, 1, '离线', '1', 'terminal_runstate', NULL, 'default', 'N', '0', 'admin', '2022-09-27 21:35:08', 'admin', '2022-11-05 19:11:52', NULL);
INSERT INTO `sys_dict_data` VALUES (112, 0, '未激活', '0', 'terminal_activestate', NULL, 'default', 'N', '0', 'admin', '2022-09-27 21:36:01', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (113, 1, '已激活', '1', 'terminal_activestate', NULL, 'default', 'N', '0', 'admin', '2022-09-27 21:36:06', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 103 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典类型表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2022-09-27 21:29:43', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2022-09-27 21:29:43', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2022-09-27 21:29:43', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2022-09-27 21:29:43', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2022-09-27 21:29:43', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2022-09-27 21:29:43', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2022-09-27 21:29:43', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2022-09-27 21:29:43', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2022-09-27 21:29:43', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2022-09-27 21:29:43', '', NULL, '登录状态列表');
INSERT INTO `sys_dict_type` VALUES (100, 'APP授权状态', 'app_authstate', '0', 'admin', '2022-09-27 21:31:27', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (101, '传感器数据类型', 'data_type', '0', 'admin', '2022-09-27 21:32:27', 'admin', '2022-09-27 21:33:00', NULL);
INSERT INTO `sys_dict_type` VALUES (102, '终端运行状态', 'terminal_runstate', '0', 'admin', '2022-09-27 21:34:51', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (103, '终端激活状态', 'terminal_activestate', '0', 'admin', '2022-09-27 21:35:50', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务调度表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2022-09-27 21:29:43', '', NULL, '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2022-09-27 21:29:43', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2022-09-27 21:29:43', '', NULL, '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime(0) NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 241 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统访问记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (100, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-09-28 11:42:20');
INSERT INTO `sys_logininfor` VALUES (101, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-09-28 13:16:15');
INSERT INTO `sys_logininfor` VALUES (102, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-09-28 14:42:47');
INSERT INTO `sys_logininfor` VALUES (103, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-09-28 15:34:26');
INSERT INTO `sys_logininfor` VALUES (104, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-09-28 17:20:11');
INSERT INTO `sys_logininfor` VALUES (105, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-09-28 17:44:57');
INSERT INTO `sys_logininfor` VALUES (106, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-09-28 19:31:55');
INSERT INTO `sys_logininfor` VALUES (107, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-09-29 11:09:28');
INSERT INTO `sys_logininfor` VALUES (108, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2022-09-29 13:18:07');
INSERT INTO `sys_logininfor` VALUES (109, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-09-29 13:18:12');
INSERT INTO `sys_logininfor` VALUES (110, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-09-29 16:14:29');
INSERT INTO `sys_logininfor` VALUES (111, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码已失效', '2022-09-29 17:59:34');
INSERT INTO `sys_logininfor` VALUES (112, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码已失效', '2022-09-29 18:32:35');
INSERT INTO `sys_logininfor` VALUES (113, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-09-29 18:50:44');
INSERT INTO `sys_logininfor` VALUES (114, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-09-30 09:15:39');
INSERT INTO `sys_logininfor` VALUES (115, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-09-30 10:01:48');
INSERT INTO `sys_logininfor` VALUES (116, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-09-30 11:00:02');
INSERT INTO `sys_logininfor` VALUES (117, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-09-30 22:31:14');
INSERT INTO `sys_logininfor` VALUES (118, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-10-01 00:21:47');
INSERT INTO `sys_logininfor` VALUES (119, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-10-08 09:10:16');
INSERT INTO `sys_logininfor` VALUES (120, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-10-08 10:04:48');
INSERT INTO `sys_logininfor` VALUES (121, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码已失效', '2022-10-08 15:44:19');
INSERT INTO `sys_logininfor` VALUES (122, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-10-08 15:44:22');
INSERT INTO `sys_logininfor` VALUES (123, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-10-08 16:45:12');
INSERT INTO `sys_logininfor` VALUES (124, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-10-09 10:48:26');
INSERT INTO `sys_logininfor` VALUES (125, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-10-09 11:43:09');
INSERT INTO `sys_logininfor` VALUES (126, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-10-09 12:41:03');
INSERT INTO `sys_logininfor` VALUES (127, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-10-11 16:06:02');
INSERT INTO `sys_logininfor` VALUES (128, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-10-11 17:51:45');
INSERT INTO `sys_logininfor` VALUES (129, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-10-15 13:01:30');
INSERT INTO `sys_logininfor` VALUES (130, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-10-15 14:35:01');
INSERT INTO `sys_logininfor` VALUES (131, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-10-15 16:39:48');
INSERT INTO `sys_logininfor` VALUES (132, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-10-15 18:10:59');
INSERT INTO `sys_logininfor` VALUES (133, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2022-10-15 21:31:22');
INSERT INTO `sys_logininfor` VALUES (134, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-10-15 21:31:24');
INSERT INTO `sys_logininfor` VALUES (135, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2022-10-15 22:30:40');
INSERT INTO `sys_logininfor` VALUES (136, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-10-15 22:30:43');
INSERT INTO `sys_logininfor` VALUES (137, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-10-16 08:36:11');
INSERT INTO `sys_logininfor` VALUES (138, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-10-16 10:46:49');
INSERT INTO `sys_logininfor` VALUES (139, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-10-16 12:36:47');
INSERT INTO `sys_logininfor` VALUES (140, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-10-16 13:36:30');
INSERT INTO `sys_logininfor` VALUES (141, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-10-16 17:58:56');
INSERT INTO `sys_logininfor` VALUES (142, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-10-16 19:51:00');
INSERT INTO `sys_logininfor` VALUES (143, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-10-16 22:02:17');
INSERT INTO `sys_logininfor` VALUES (144, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-10-17 09:21:41');
INSERT INTO `sys_logininfor` VALUES (145, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2022-10-17 14:06:21');
INSERT INTO `sys_logininfor` VALUES (146, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2022-10-17 14:06:23');
INSERT INTO `sys_logininfor` VALUES (147, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2022-10-17 14:06:25');
INSERT INTO `sys_logininfor` VALUES (148, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-10-17 14:06:28');
INSERT INTO `sys_logininfor` VALUES (149, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-10-17 19:11:28');
INSERT INTO `sys_logininfor` VALUES (150, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-10-17 21:58:31');
INSERT INTO `sys_logininfor` VALUES (151, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-10-18 10:16:22');
INSERT INTO `sys_logininfor` VALUES (152, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-10-18 15:23:06');
INSERT INTO `sys_logininfor` VALUES (153, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-10-18 17:20:15');
INSERT INTO `sys_logininfor` VALUES (154, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码已失效', '2022-10-19 18:47:15');
INSERT INTO `sys_logininfor` VALUES (155, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-10-19 18:47:18');
INSERT INTO `sys_logininfor` VALUES (156, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-10-20 10:17:21');
INSERT INTO `sys_logininfor` VALUES (157, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-10-22 12:19:54');
INSERT INTO `sys_logininfor` VALUES (158, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-10-22 13:46:57');
INSERT INTO `sys_logininfor` VALUES (159, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码已失效', '2022-10-23 13:19:14');
INSERT INTO `sys_logininfor` VALUES (160, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-10-23 13:19:23');
INSERT INTO `sys_logininfor` VALUES (161, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-10-23 17:35:53');
INSERT INTO `sys_logininfor` VALUES (162, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-10-23 18:22:11');
INSERT INTO `sys_logininfor` VALUES (163, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-10-30 15:20:33');
INSERT INTO `sys_logininfor` VALUES (164, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2022-10-31 19:13:00');
INSERT INTO `sys_logininfor` VALUES (165, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2022-10-31 19:13:02');
INSERT INTO `sys_logininfor` VALUES (166, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-10-31 19:13:05');
INSERT INTO `sys_logininfor` VALUES (167, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-10-31 19:14:53');
INSERT INTO `sys_logininfor` VALUES (168, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-10-31 19:16:45');
INSERT INTO `sys_logininfor` VALUES (169, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-10-31 19:17:46');
INSERT INTO `sys_logininfor` VALUES (170, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码已失效', '2022-10-31 19:20:14');
INSERT INTO `sys_logininfor` VALUES (171, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-10-31 19:20:18');
INSERT INTO `sys_logininfor` VALUES (172, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-10-31 19:38:16');
INSERT INTO `sys_logininfor` VALUES (173, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-11-02 10:41:33');
INSERT INTO `sys_logininfor` VALUES (174, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-11-02 16:28:50');
INSERT INTO `sys_logininfor` VALUES (175, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-11-02 17:06:43');
INSERT INTO `sys_logininfor` VALUES (176, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-11-03 08:26:00');
INSERT INTO `sys_logininfor` VALUES (177, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-11-04 16:51:48');
INSERT INTO `sys_logininfor` VALUES (178, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-11-04 22:58:12');
INSERT INTO `sys_logininfor` VALUES (179, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-11-05 08:13:02');
INSERT INTO `sys_logininfor` VALUES (180, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-11-05 08:54:21');
INSERT INTO `sys_logininfor` VALUES (181, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-11-05 10:16:30');
INSERT INTO `sys_logininfor` VALUES (182, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-11-05 15:05:11');
INSERT INTO `sys_logininfor` VALUES (183, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-11-05 16:03:21');
INSERT INTO `sys_logininfor` VALUES (184, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-11-05 17:42:45');
INSERT INTO `sys_logininfor` VALUES (185, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-11-05 18:42:38');
INSERT INTO `sys_logininfor` VALUES (186, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-11-05 19:35:29');
INSERT INTO `sys_logininfor` VALUES (187, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-11-06 08:42:19');
INSERT INTO `sys_logininfor` VALUES (188, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-11-06 12:21:29');
INSERT INTO `sys_logininfor` VALUES (189, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2022-11-06 14:04:37');
INSERT INTO `sys_logininfor` VALUES (190, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-11-06 14:04:42');
INSERT INTO `sys_logininfor` VALUES (191, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-11-06 16:15:05');
INSERT INTO `sys_logininfor` VALUES (192, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-11-06 18:04:14');
INSERT INTO `sys_logininfor` VALUES (193, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-11-07 14:50:59');
INSERT INTO `sys_logininfor` VALUES (194, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-11-07 16:27:03');
INSERT INTO `sys_logininfor` VALUES (195, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-11-07 18:18:50');
INSERT INTO `sys_logininfor` VALUES (196, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-11-07 19:48:08');
INSERT INTO `sys_logininfor` VALUES (197, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-11-07 20:45:47');
INSERT INTO `sys_logininfor` VALUES (198, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-11-07 22:27:36');
INSERT INTO `sys_logininfor` VALUES (199, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-11-08 16:58:57');
INSERT INTO `sys_logininfor` VALUES (200, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-11-08 17:48:24');
INSERT INTO `sys_logininfor` VALUES (201, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-11-12 08:15:16');
INSERT INTO `sys_logininfor` VALUES (202, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-11-12 09:15:32');
INSERT INTO `sys_logininfor` VALUES (203, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-11-12 16:58:38');
INSERT INTO `sys_logininfor` VALUES (204, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2022-11-13 08:20:14');
INSERT INTO `sys_logininfor` VALUES (205, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-11-13 08:20:17');
INSERT INTO `sys_logininfor` VALUES (206, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-11-13 09:36:06');
INSERT INTO `sys_logininfor` VALUES (207, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-11-13 11:58:24');
INSERT INTO `sys_logininfor` VALUES (208, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码已失效', '2022-11-13 14:07:49');
INSERT INTO `sys_logininfor` VALUES (209, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-11-13 14:08:14');
INSERT INTO `sys_logininfor` VALUES (210, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-11-13 14:54:44');
INSERT INTO `sys_logininfor` VALUES (211, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-11-13 20:48:15');
INSERT INTO `sys_logininfor` VALUES (212, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-11-14 08:46:07');
INSERT INTO `sys_logininfor` VALUES (213, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-11-14 09:56:19');
INSERT INTO `sys_logininfor` VALUES (214, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-11-15 16:00:46');
INSERT INTO `sys_logininfor` VALUES (215, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-11-16 11:21:07');
INSERT INTO `sys_logininfor` VALUES (216, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-11-16 13:07:18');
INSERT INTO `sys_logininfor` VALUES (217, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-11-17 09:52:01');
INSERT INTO `sys_logininfor` VALUES (218, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-11-17 11:14:17');
INSERT INTO `sys_logininfor` VALUES (219, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码已失效', '2022-11-17 11:30:55');
INSERT INTO `sys_logininfor` VALUES (220, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-11-17 11:30:58');
INSERT INTO `sys_logininfor` VALUES (221, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-11-18 09:40:32');
INSERT INTO `sys_logininfor` VALUES (222, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-11-18 11:31:09');
INSERT INTO `sys_logininfor` VALUES (223, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-11-18 16:34:43');
INSERT INTO `sys_logininfor` VALUES (224, 'admin', '222.24.22.154', 'XX XX', 'Firefox 10', 'Windows 10', '0', '登录成功', '2022-11-18 17:15:02');
INSERT INTO `sys_logininfor` VALUES (225, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-11-18 18:29:29');
INSERT INTO `sys_logininfor` VALUES (226, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-11-19 11:13:48');
INSERT INTO `sys_logininfor` VALUES (227, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2022-11-21 10:44:53');
INSERT INTO `sys_logininfor` VALUES (228, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-11-21 10:44:57');
INSERT INTO `sys_logininfor` VALUES (229, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-11-21 12:03:10');
INSERT INTO `sys_logininfor` VALUES (230, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-11-21 14:45:36');
INSERT INTO `sys_logininfor` VALUES (231, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-11-21 16:17:01');
INSERT INTO `sys_logininfor` VALUES (232, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-11-21 16:17:03');
INSERT INTO `sys_logininfor` VALUES (233, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-11-21 17:02:49');
INSERT INTO `sys_logininfor` VALUES (234, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-11-21 20:40:04');
INSERT INTO `sys_logininfor` VALUES (235, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-11-22 19:23:02');
INSERT INTO `sys_logininfor` VALUES (236, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-11-23 09:03:12');
INSERT INTO `sys_logininfor` VALUES (237, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-11-23 09:50:07');
INSERT INTO `sys_logininfor` VALUES (238, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-11-23 10:32:39');
INSERT INTO `sys_logininfor` VALUES (239, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-11-23 11:03:26');
INSERT INTO `sys_logininfor` VALUES (240, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-11-25 13:55:06');
INSERT INTO `sys_logininfor` VALUES (241, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-11-28 15:31:00');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '路由参数',
  `is_frame` int NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2087 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单权限表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 4, 'system', NULL, '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2022-09-27 21:29:42', 'admin', '2022-09-27 22:13:43', '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 8, 'monitor', NULL, '', 1, 0, 'M', '1', '0', '', 'monitor', 'admin', '2022-09-27 21:29:42', 'admin', '2022-09-30 23:24:15', '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 7, 'tool', NULL, '', 1, 0, 'M', '0', '0', '', 'tool', 'admin', '2022-09-27 21:29:42', 'admin', '2022-11-07 16:28:24', '系统工具目录');
INSERT INTO `sys_menu` VALUES (4, '若依官网', 0, 9, 'http://ruoyi.vip', NULL, '', 0, 0, 'M', '1', '0', '', 'guide', 'admin', '2022-09-27 21:29:42', 'admin', '2022-09-30 09:30:20', '若依官网地址');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2022-09-27 21:29:42', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2022-09-27 21:29:42', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2022-09-27 21:29:42', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', '', 1, 0, 'C', '1', '0', 'system:dept:list', 'tree', 'admin', '2022-09-27 21:29:42', 'admin', '2022-10-30 16:04:17', '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', '', 1, 0, 'C', '1', '0', 'system:post:list', 'post', 'admin', '2022-09-27 21:29:42', 'admin', '2022-10-30 16:04:24', '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', '', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2022-09-27 21:29:42', 'admin', '2022-10-18 15:28:55', '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', '', 1, 0, 'C', '1', '0', 'system:config:list', 'edit', 'admin', '2022-09-27 21:29:42', 'admin', '2022-09-29 13:23:54', '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', '', 1, 0, 'C', '1', '0', 'system:notice:list', 'message', 'admin', '2022-09-27 21:29:42', 'admin', '2022-09-29 13:23:39', '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, 'log', '', '', 1, 0, 'M', '0', '0', '', 'log', 'admin', '2022-09-27 21:29:42', '', NULL, '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', '', 1, 0, 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2022-09-27 21:29:42', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, 'job', 'monitor/job/index', '', 1, 0, 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2022-09-27 21:29:42', '', NULL, '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 3, 'druid', 'monitor/druid/index', '', 1, 0, 'C', '0', '0', 'monitor:druid:list', 'druid', 'admin', '2022-09-27 21:29:42', '', NULL, '数据监控菜单');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 4, 'server', 'monitor/server/index', '', 1, 0, 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2022-09-27 21:29:42', '', NULL, '服务监控菜单');
INSERT INTO `sys_menu` VALUES (113, '缓存监控', 2, 5, 'cache', 'monitor/cache/index', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis', 'admin', '2022-09-27 21:29:42', '', NULL, '缓存监控菜单');
INSERT INTO `sys_menu` VALUES (114, '缓存列表', 2, 6, 'cacheList', 'monitor/cache/list', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis-list', 'admin', '2022-09-27 21:29:42', '', NULL, '缓存列表菜单');
INSERT INTO `sys_menu` VALUES (115, '表单构建', 3, 1, 'build', 'tool/build/index', '', 1, 0, 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2022-09-27 21:29:42', '', NULL, '表单构建菜单');
INSERT INTO `sys_menu` VALUES (116, '代码生成', 3, 2, 'gen', 'tool/gen/index', '', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2022-09-27 21:29:42', '', NULL, '代码生成菜单');
INSERT INTO `sys_menu` VALUES (117, '系统接口', 3, 3, 'swagger', 'tool/swagger/index', '', 1, 0, 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2022-09-27 21:29:42', '', NULL, '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', '', 1, 0, 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2022-09-27 21:29:42', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', '', 1, 0, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2022-09-27 21:29:42', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1000, '用户查询', 100, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2022-09-27 21:29:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1001, '用户新增', 100, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2022-09-27 21:29:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户修改', 100, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2022-09-27 21:29:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户删除', 100, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2022-09-27 21:29:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户导出', 100, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2022-09-27 21:29:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导入', 100, 6, '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2022-09-27 21:29:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '重置密码', 100, 7, '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2022-09-27 21:29:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '角色查询', 101, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2022-09-27 21:29:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色新增', 101, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2022-09-27 21:29:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色修改', 101, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2022-09-27 21:29:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色删除', 101, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2022-09-27 21:29:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色导出', 101, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2022-09-27 21:29:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '菜单查询', 102, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2022-09-27 21:29:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单新增', 102, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2022-09-27 21:29:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单修改', 102, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2022-09-27 21:29:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单删除', 102, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2022-09-27 21:29:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '部门查询', 103, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2022-09-27 21:29:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门新增', 103, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2022-09-27 21:29:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门修改', 103, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2022-09-27 21:29:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门删除', 103, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2022-09-27 21:29:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '岗位查询', 104, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin', '2022-09-27 21:29:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位新增', 104, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin', '2022-09-27 21:29:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位修改', 104, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2022-09-27 21:29:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位删除', 104, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2022-09-27 21:29:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位导出', 104, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin', '2022-09-27 21:29:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '字典查询', 105, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2022-09-27 21:29:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典新增', 105, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2022-09-27 21:29:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典修改', 105, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2022-09-27 21:29:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典删除', 105, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2022-09-27 21:29:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典导出', 105, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2022-09-27 21:29:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '参数查询', 106, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin', '2022-09-27 21:29:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数新增', 106, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin', '2022-09-27 21:29:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数修改', 106, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2022-09-27 21:29:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数删除', 106, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2022-09-27 21:29:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数导出', 106, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin', '2022-09-27 21:29:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '公告查询', 107, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin', '2022-09-27 21:29:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告新增', 107, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin', '2022-09-27 21:29:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告修改', 107, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2022-09-27 21:29:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告删除', 107, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2022-09-27 21:29:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '操作查询', 500, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2022-09-27 21:29:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作删除', 500, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2022-09-27 21:29:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '日志导出', 500, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2022-09-27 21:29:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '登录查询', 501, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2022-09-27 21:29:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录删除', 501, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2022-09-27 21:29:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '日志导出', 501, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2022-09-27 21:29:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '账户解锁', 501, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:unlock', '#', 'admin', '2022-09-27 21:29:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2022-09-27 21:29:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2022-09-27 21:29:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2022-09-27 21:29:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1049, '任务查询', 110, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2022-09-27 21:29:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1050, '任务新增', 110, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2022-09-27 21:29:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1051, '任务修改', 110, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2022-09-27 21:29:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1052, '任务删除', 110, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2022-09-27 21:29:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1053, '状态修改', 110, 5, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2022-09-27 21:29:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1054, '任务导出', 110, 6, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2022-09-27 21:29:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '生成查询', 116, 1, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2022-09-27 21:29:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '生成修改', 116, 2, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2022-09-27 21:29:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '生成删除', 116, 3, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2022-09-27 21:29:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '导入代码', 116, 4, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2022-09-27 21:29:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '预览代码', 116, 5, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2022-09-27 21:29:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '生成代码', 116, 6, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2022-09-27 21:29:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2001, '终端管理', 0, 2, 'Terminal', 'equ/terminal/index', NULL, 1, 0, 'C', '0', '0', 'equ:terminal:list', 'button', 'admin', '2022-09-27 21:37:21', 'admin', '2022-10-30 15:29:12', '');
INSERT INTO `sys_menu` VALUES (2002, '数据管理', 0, 3, 'dataManagement', 'data/dataManagement/index', NULL, 1, 0, 'C', '0', '0', 'data:dataManagement:list', 'button', 'admin', '2022-09-27 21:37:44', 'admin', '2022-09-27 22:13:38', '');
INSERT INTO `sys_menu` VALUES (2004, '终端 查询', 2001, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'equ:terminal:query', '#', 'admin', '2022-09-27 21:42:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2005, '终端 新增', 2001, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'equ:terminal:add', '#', 'admin', '2022-09-27 21:42:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2006, '终端 修改', 2001, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'equ:terminal:edit', '#', 'admin', '2022-09-27 21:42:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2007, '终端 删除', 2001, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'equ:terminal:remove', '#', 'admin', '2022-09-27 21:42:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2008, '终端 导出', 2001, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'equ:terminal:export', '#', 'admin', '2022-09-27 21:42:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2028, 'appserver帧数据查询', 2002, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'data:dataManagement:query', '#', 'admin', '2022-09-28 17:30:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2029, 'appserver帧数据新增', 2002, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'data:dataManagement:add', '#', 'admin', '2022-09-27 21:57:28', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2030, 'appserver帧数据修改', 2002, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'data:dataManagement:edit', '#', 'admin', '2022-09-27 21:57:28', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2031, 'appserver帧数据删除', 2002, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'data:dataManagement:remove', '#', 'admin', '2022-09-27 21:57:28', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2032, 'appserver帧数据导出', 2002, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'data:dataManagement:export', '#', 'admin', '2022-09-27 21:57:28', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2033, '授权管理', 0, 5, 'auth', NULL, NULL, 1, 0, 'M', '0', '0', '', 'button', 'admin', '2022-09-27 22:13:17', 'admin', '2022-09-27 22:13:51', '');
INSERT INTO `sys_menu` VALUES (2034, '预警', 0, 6, 'warnning', NULL, NULL, 1, 0, 'M', '0', '0', NULL, 'component', 'admin', '2022-09-27 22:14:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2041, 'appserver帧数据', 2002, 1, 'dataManagement', 'data/dataManagement/index', NULL, 1, 0, 'C', '0', '0', 'data:dataManagement:list', '#', 'admin', '2022-09-28 17:30:06', '', NULL, 'appserver帧数据菜单');
INSERT INTO `sys_menu` VALUES (2060, 'APP管理', 0, 1, 'appManagement', 'app/appManagement/index', NULL, 1, 0, 'C', '0', '0', 'app:appManagement:list', 'button', 'admin', '2022-09-28 17:34:57', 'admin', '2022-09-29 13:26:33', '');
INSERT INTO `sys_menu` VALUES (2062, '应用查询', 2060, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'app:appManagement:query', '#', 'admin', '2022-09-28 17:35:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2063, '应用新增', 2060, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'app:appManagement:add', '#', 'admin', '2022-09-28 17:35:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2064, '应用修改', 2060, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'app:appManagement:edit', '#', 'admin', '2022-09-28 17:35:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2065, '应用删除', 2060, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'app:appManagement:remove', '#', 'admin', '2022-09-28 17:35:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2066, '应用导出', 2060, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'app:appManagement:export', '#', 'admin', '2022-09-28 17:35:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2067, '测试', 0, 7, 'test', NULL, NULL, 1, 0, 'M', '1', '0', '', '404', 'admin', '2022-09-29 16:14:47', 'admin', '2022-10-30 16:03:46', '');
INSERT INTO `sys_menu` VALUES (2080, '终端管理测试', 2067, 1, 'terminaltest', 'appserver/terminal/index', NULL, 1, 0, 'C', '0', '0', 'appserver:terminal:list', '404', 'admin', '2022-10-15 13:09:27', 'admin', '2022-10-17 10:43:11', '');
INSERT INTO `sys_menu` VALUES (2082, 'terminal', 2067, 1, '1', 'appserver/app/index', NULL, 1, 0, 'C', '0', '0', '', '404', 'admin', '2022-10-15 22:31:59', 'admin', '2022-10-30 15:29:30', '');
INSERT INTO `sys_menu` VALUES (2083, 'app管理测试', 2067, 2, 'appterminaltest', 'appserver/app/index', NULL, 1, 0, 'C', '0', '0', '', 'button', 'admin', '2022-10-16 18:13:30', 'admin', '2022-10-17 10:43:18', '');
INSERT INTO `sys_menu` VALUES (2084, '网关管理', 0, 3, 'gateway', '', NULL, 1, 0, 'M', '0', '0', '', 'bug', 'admin', '2022-11-05 16:14:03', 'admin', '2022-11-21 16:18:26', '');
INSERT INTO `sys_menu` VALUES (2086, '网关拓扑', 2084, 2, 'topology', 'equ/gateway/topology', NULL, 1, 0, 'C', '0', '0', NULL, '404', 'admin', '2022-11-21 16:19:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2087, '网关数据', 2084, 1, 'index', 'equ/gateway/index', NULL, 1, 0, 'C', '0', '0', NULL, 'cascader', 'admin', '2022-11-21 16:19:39', '', NULL, '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '通知公告表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：2018-07-01 若依新版本发布啦', '2', 0xE696B0E78988E69CACE58685E5AEB9, '0', 'admin', '2022-09-27 21:29:43', '', NULL, '管理员');
INSERT INTO `sys_notice` VALUES (2, '维护通知：2018-07-01 若依系统凌晨维护', '1', 0xE7BBB4E68AA4E58685E5AEB9, '0', 'admin', '2022-09-27 21:29:43', '', NULL, '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime(0) NULL DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 627 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '操作日志记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (100, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', NULL, '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"APP授权状态\",\"dictType\":\"app_authstate\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-27 21:31:27');
INSERT INTO `sys_oper_log` VALUES (101, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"未授权\",\"dictSort\":0,\"dictType\":\"app_authstate\",\"dictValue\":\"0\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-27 21:31:42');
INSERT INTO `sys_oper_log` VALUES (102, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"已授权\",\"dictSort\":1,\"dictType\":\"app_authstate\",\"dictValue\":\"1\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-27 21:31:49');
INSERT INTO `sys_oper_log` VALUES (103, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', NULL, '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"传感器数据类型\",\"dictType\":\"data_type\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-27 21:32:27');
INSERT INTO `sys_oper_log` VALUES (104, '字典类型', 2, 'com.ruoyi.web.controller.system.SysDictTypeController.edit()', 'PUT', 1, 'admin', NULL, '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2022-09-27 21:32:27\",\"dictId\":101,\"dictName\":\"传感器数据类型\",\"dictType\":\"data_type\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-27 21:33:00');
INSERT INTO `sys_oper_log` VALUES (105, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"低功耗倾角传感器\",\"dictSort\":1,\"dictType\":\"data_type\",\"dictValue\":\"1\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-27 21:33:16');
INSERT INTO `sys_oper_log` VALUES (106, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"数字型加速度计\",\"dictSort\":2,\"dictType\":\"data_type\",\"dictValue\":\"2\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-27 21:33:25');
INSERT INTO `sys_oper_log` VALUES (107, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"多功能空气质量变送器\",\"dictSort\":3,\"dictType\":\"data_type\",\"dictValue\":\"3\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-27 21:33:50');
INSERT INTO `sys_oper_log` VALUES (108, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"压力式静力水准仪\",\"dictSort\":4,\"dictType\":\"data_type\",\"dictValue\":\"4\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-27 21:34:11');
INSERT INTO `sys_oper_log` VALUES (109, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"声光报警器\",\"dictSort\":5,\"dictType\":\"data_type\",\"dictValue\":\"5\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-27 21:34:21');
INSERT INTO `sys_oper_log` VALUES (110, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', NULL, '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"终端运行状态\",\"dictType\":\"terminal_runstate\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-27 21:34:51');
INSERT INTO `sys_oper_log` VALUES (111, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"未连接\",\"dictSort\":0,\"dictType\":\"terminal_runstate\",\"dictValue\":\"0\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-27 21:35:02');
INSERT INTO `sys_oper_log` VALUES (112, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"正常\",\"dictSort\":1,\"dictType\":\"terminal_runstate\",\"dictValue\":\"1\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-27 21:35:08');
INSERT INTO `sys_oper_log` VALUES (113, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"电量不足\",\"dictSort\":2,\"dictType\":\"terminal_runstate\",\"dictValue\":\"2\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-27 21:35:15');
INSERT INTO `sys_oper_log` VALUES (114, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"有干扰\",\"dictSort\":3,\"dictType\":\"terminal_runstate\",\"dictValue\":\"3\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-27 21:35:23');
INSERT INTO `sys_oper_log` VALUES (115, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"需要校准\",\"dictSort\":4,\"dictType\":\"terminal_runstate\",\"dictValue\":\"4\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-27 21:35:31');
INSERT INTO `sys_oper_log` VALUES (116, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', NULL, '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"终端激活状态\",\"dictType\":\"terminal_activestate\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-27 21:35:50');
INSERT INTO `sys_oper_log` VALUES (117, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"未激活\",\"dictSort\":0,\"dictType\":\"terminal_activestate\",\"dictValue\":\"0\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-27 21:36:01');
INSERT INTO `sys_oper_log` VALUES (118, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"已激活\",\"dictSort\":1,\"dictType\":\"terminal_activestate\",\"dictValue\":\"1\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-27 21:36:06');
INSERT INTO `sys_oper_log` VALUES (119, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"button\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"APP管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"APPmanagement\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-27 21:36:41');
INSERT INTO `sys_oper_log` VALUES (120, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"button\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"终端管理\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":0,\"path\":\"terminalManagement\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-27 21:37:21');
INSERT INTO `sys_oper_log` VALUES (121, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"button\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"数据管理\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":0,\"path\":\"dataManagement\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-27 21:37:44');
INSERT INTO `sys_oper_log` VALUES (122, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '\"lora_terminal,lora_data,lora_app\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-27 21:38:13');
INSERT INTO `sys_oper_log` VALUES (123, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"appManagement\",\"className\":\"LoraApp\",\"columns\":[{\"capJavaField\":\"AppId\",\"columnComment\":\"应用id\",\"columnId\":1,\"columnName\":\"app_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2022-09-27 21:38:13\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"appId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"AppEui\",\"columnId\":2,\"columnName\":\"app_eui\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2022-09-27 21:38:13\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"appEui\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"AppSecret\",\"columnId\":3,\"columnName\":\"app_secret\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2022-09-27 21:38:13\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"appSecret\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"AppName\",\"columnComment\":\"应用名称\",\"columnId\":4,\"columnName\":\"app_name\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2022-09-27 21:38:13\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"appName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"requi', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-27 21:39:12');
INSERT INTO `sys_oper_log` VALUES (124, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"dataManagement\",\"className\":\"LoraData\",\"columns\":[{\"capJavaField\":\"DataId\",\"columnComment\":\"数据ID\",\"columnId\":12,\"columnName\":\"data_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2022-09-27 21:38:13\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"dataId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"TerminalId\",\"columnComment\":\"终端设备ID\",\"columnId\":13,\"columnName\":\"terminal_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2022-09-27 21:38:13\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"terminalId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"SensorId\",\"columnComment\":\"传感器ID\",\"columnId\":14,\"columnName\":\"sensor_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2022-09-27 21:38:13\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"sensorId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"SensorType\",\"columnComment\":\"传感器数据类型\",\"columnId\":15,\"columnName\":\"sensor_type\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2022-09-27 21:38:13\",\"dictType\":\"data_type\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"sensorType\",\"javaType\":\"Long\",\"list\":true,\"p', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-27 21:39:53');
INSERT INTO `sys_oper_log` VALUES (125, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"terminal\",\"className\":\"LoraTerminal\",\"columns\":[{\"capJavaField\":\"TerminalId\",\"columnComment\":\"终端id\",\"columnId\":20,\"columnName\":\"terminal_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2022-09-27 21:38:13\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"terminalId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"TerminalType\",\"columnComment\":\"终端类型\",\"columnId\":21,\"columnName\":\"terminal_type\",\"columnType\":\"tinyint\",\"createBy\":\"admin\",\"createTime\":\"2022-09-27 21:38:13\",\"dictType\":\"data_type\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"terminalType\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"TerminalEui\",\"columnComment\":\"终端出厂ID\",\"columnId\":22,\"columnName\":\"terminal_eui\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2022-09-27 21:38:13\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"terminalEui\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"TerminalAddr\",\"columnComment\":\"服务器分给终端的网络临时地址\",\"columnId\":23,\"columnName\":\"terminal_addr\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2022-09-27 21:38:13\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaFie', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-27 21:40:30');
INSERT INTO `sys_oper_log` VALUES (126, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2022-09-27 21:40:34');
INSERT INTO `sys_oper_log` VALUES (127, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2022-09-27 21:40:34');
INSERT INTO `sys_oper_log` VALUES (128, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2022-09-27 21:40:38');
INSERT INTO `sys_oper_log` VALUES (129, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2022-09-27 21:40:39');
INSERT INTO `sys_oper_log` VALUES (130, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2022-09-27 21:44:46');
INSERT INTO `sys_oper_log` VALUES (131, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"app/appManagement/index\",\"createTime\":\"2022-09-27 21:36:41\",\"icon\":\"button\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"APP管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"APPmanagement\",\"perms\":\"app:appManagement:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-27 21:48:32');
INSERT INTO `sys_oper_log` VALUES (132, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"app/appManagement/index\",\"createTime\":\"2022-09-27 21:36:41\",\"icon\":\"button\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"APP管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"APPmanagement\",\"perms\":\"app:appManagement:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-27 21:49:23');
INSERT INTO `sys_oper_log` VALUES (133, '应用', 3, 'com.ruoyi.app.controller.LoraAppController.remove()', 'DELETE', 1, 'admin', NULL, '/app/appManagement/8,9,10,11,12,13,14,15,16,17', '127.0.0.1', '内网IP', '{appIds=8,9,10,11,12,13,14,15,16,17}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-27 21:51:16');
INSERT INTO `sys_oper_log` VALUES (134, '应用', 1, 'com.ruoyi.app.controller.LoraAppController.add()', 'POST', 1, 'admin', NULL, '/app/appManagement', '127.0.0.1', '内网IP', '{\"appEui\":\"23\",\"appId\":24,\"appSecret\":\"123\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-27 21:51:21');
INSERT INTO `sys_oper_log` VALUES (135, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"equ/terminal/index\",\"createTime\":\"2022-09-27 21:37:21\",\"icon\":\"button\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2001,\"menuName\":\"终端管理\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":0,\"path\":\"terminalManagement\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-27 21:51:36');
INSERT INTO `sys_oper_log` VALUES (136, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"equ/terminal/index\",\"createTime\":\"2022-09-27 21:37:21\",\"icon\":\"button\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2001,\"menuName\":\"终端管理\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":0,\"path\":\"terminalManagement\",\"perms\":\"equ:terminal:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-27 21:51:40');
INSERT INTO `sys_oper_log` VALUES (137, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"data/dataManagement/index\",\"createTime\":\"2022-09-27 21:37:44\",\"icon\":\"button\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2002,\"menuName\":\"数据管理\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":0,\"path\":\"dataManagement\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-27 21:51:56');
INSERT INTO `sys_oper_log` VALUES (138, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"data/dataManagement/index\",\"createTime\":\"2022-09-27 21:37:44\",\"icon\":\"button\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2002,\"menuName\":\"数据管理\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":0,\"path\":\"dataManagement\",\"perms\":\"data:dataManagement:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-27 21:52:01');
INSERT INTO `sys_oper_log` VALUES (139, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"data/dataManagement/index\",\"createTime\":\"2022-09-27 21:37:44\",\"icon\":\"button\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2002,\"menuName\":\"数据管理\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":0,\"path\":\"dataManagement\",\"perms\":\"data:dataManagement:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-27 21:53:17');
INSERT INTO `sys_oper_log` VALUES (140, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"dataManagement\",\"className\":\"LoraData\",\"columns\":[{\"capJavaField\":\"DataId\",\"columnComment\":\"数据ID\",\"columnId\":12,\"columnName\":\"data_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2022-09-27 21:38:13\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"dataId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2022-09-27 21:39:53\",\"usableColumn\":false},{\"capJavaField\":\"TerminalId\",\"columnComment\":\"终端设备ID\",\"columnId\":13,\"columnName\":\"terminal_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2022-09-27 21:38:13\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"terminalId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2022-09-27 21:39:53\",\"usableColumn\":false},{\"capJavaField\":\"SensorId\",\"columnComment\":\"传感器ID\",\"columnId\":14,\"columnName\":\"sensor_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2022-09-27 21:38:13\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"sensorId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2022-09-27 21:39:53\",\"usableColumn\":false},{\"capJavaField\":\"SensorType\",\"columnComment\":\"传感器数据类型\",\"columnId\":15,\"columnName\":\"sensor_type\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2022-09-27 21:38:13\",\"dictType\":\"data_type\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isIn', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-27 21:56:22');
INSERT INTO `sys_oper_log` VALUES (141, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2022-09-27 21:56:27');
INSERT INTO `sys_oper_log` VALUES (142, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2010', '127.0.0.1', '内网IP', '{menuId=2010}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-27 21:57:45');
INSERT INTO `sys_oper_log` VALUES (143, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"app/appManagement/index\",\"createTime\":\"2022-09-27 21:36:41\",\"icon\":\"button\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"APP管理\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":0,\"path\":\"APPmanagement\",\"perms\":\"app:appManagement:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-27 22:12:16');
INSERT INTO `sys_oper_log` VALUES (144, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"equ/terminal/index\",\"createTime\":\"2022-09-27 21:37:21\",\"icon\":\"button\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2001,\"menuName\":\"终端管理\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":0,\"path\":\"terminalManagement\",\"perms\":\"equ:terminal:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-27 22:12:26');
INSERT INTO `sys_oper_log` VALUES (145, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"data/dataManagement/index\",\"createTime\":\"2022-09-27 21:37:44\",\"icon\":\"button\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2002,\"menuName\":\"数据管理\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"dataManagement\",\"perms\":\"data:dataManagement:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-27 22:12:36');
INSERT INTO `sys_oper_log` VALUES (146, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2022-09-27 21:29:42\",\"icon\":\"monitor\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2,\"menuName\":\"系统监控\",\"menuType\":\"M\",\"orderNum\":5,\"params\":{},\"parentId\":0,\"path\":\"monitor\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-27 22:12:41');
INSERT INTO `sys_oper_log` VALUES (147, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2022-09-27 21:29:42\",\"icon\":\"guide\",\"isCache\":\"0\",\"isFrame\":\"0\",\"menuId\":4,\"menuName\":\"若依官网\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"http://ruoyi.vip\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-27 22:12:48');
INSERT INTO `sys_oper_log` VALUES (148, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2022-09-27 21:29:42\",\"icon\":\"guide\",\"isCache\":\"0\",\"isFrame\":\"0\",\"menuId\":4,\"menuName\":\"若依官网\",\"menuType\":\"M\",\"orderNum\":6,\"params\":{},\"parentId\":0,\"path\":\"http://ruoyi.vip\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-27 22:12:53');
INSERT INTO `sys_oper_log` VALUES (149, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"button\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"授权管理\",\"menuType\":\"M\",\"orderNum\":2,\"params\":{},\"parentId\":0,\"path\":\"auth\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-27 22:13:17');
INSERT INTO `sys_oper_log` VALUES (150, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"app/appManagement/index\",\"createTime\":\"2022-09-27 21:36:41\",\"icon\":\"button\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"APP管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"APPmanagement\",\"perms\":\"app:appManagement:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-27 22:13:24');
INSERT INTO `sys_oper_log` VALUES (151, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"equ/terminal/index\",\"createTime\":\"2022-09-27 21:37:21\",\"icon\":\"button\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2001,\"menuName\":\"终端管理\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":0,\"path\":\"terminalManagement\",\"perms\":\"equ:terminal:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-27 22:13:30');
INSERT INTO `sys_oper_log` VALUES (152, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"data/dataManagement/index\",\"createTime\":\"2022-09-27 21:37:44\",\"icon\":\"button\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2002,\"menuName\":\"数据管理\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":0,\"path\":\"dataManagement\",\"perms\":\"data:dataManagement:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-27 22:13:38');
INSERT INTO `sys_oper_log` VALUES (153, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2022-09-27 21:29:42\",\"icon\":\"system\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1,\"menuName\":\"系统管理\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"system\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-27 22:13:44');
INSERT INTO `sys_oper_log` VALUES (154, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2022-09-27 22:13:17\",\"icon\":\"button\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2033,\"menuName\":\"授权管理\",\"menuType\":\"M\",\"orderNum\":5,\"params\":{},\"parentId\":0,\"path\":\"auth\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-27 22:13:51');
INSERT INTO `sys_oper_log` VALUES (155, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"component\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"预警\",\"menuType\":\"M\",\"orderNum\":6,\"params\":{},\"parentId\":0,\"path\":\"warnning\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-27 22:14:49');
INSERT INTO `sys_oper_log` VALUES (156, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2022-09-27 21:29:42\",\"icon\":\"tool\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":3,\"menuName\":\"系统工具\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"tool\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-27 22:15:00');
INSERT INTO `sys_oper_log` VALUES (157, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2022-09-27 21:29:42\",\"icon\":\"tool\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":3,\"menuName\":\"系统工具\",\"menuType\":\"M\",\"orderNum\":7,\"params\":{},\"parentId\":0,\"path\":\"tool\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-27 22:15:13');
INSERT INTO `sys_oper_log` VALUES (158, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2022-09-27 21:29:42\",\"icon\":\"monitor\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2,\"menuName\":\"系统监控\",\"menuType\":\"M\",\"orderNum\":8,\"params\":{},\"parentId\":0,\"path\":\"monitor\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-27 22:15:18');
INSERT INTO `sys_oper_log` VALUES (159, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2022-09-27 21:29:42\",\"icon\":\"guide\",\"isCache\":\"0\",\"isFrame\":\"0\",\"menuId\":4,\"menuName\":\"若依官网\",\"menuType\":\"M\",\"orderNum\":9,\"params\":{},\"parentId\":0,\"path\":\"http://ruoyi.vip\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-27 22:15:23');
INSERT INTO `sys_oper_log` VALUES (160, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', NULL, '/tool/gen/synchDb/lora_app', '127.0.0.1', '内网IP', '{tableName=lora_app}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-28 16:06:51');
INSERT INTO `sys_oper_log` VALUES (161, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"appManagement\",\"className\":\"LoraApp\",\"columns\":[{\"capJavaField\":\"AppId\",\"columnComment\":\"应用id\",\"columnId\":1,\"columnName\":\"app_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2022-09-27 21:38:13\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"appId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2022-09-28 16:06:50\",\"usableColumn\":false},{\"capJavaField\":\"AppEui\",\"columnComment\":\"\",\"columnId\":2,\"columnName\":\"app_eui\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2022-09-27 21:38:13\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"appEui\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2022-09-28 16:06:50\",\"usableColumn\":false},{\"capJavaField\":\"AppSecret\",\"columnComment\":\"\",\"columnId\":3,\"columnName\":\"app_secret\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2022-09-27 21:38:13\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"appSecret\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2022-09-28 16:06:50\",\"usableColumn\":false},{\"capJavaField\":\"AppName\",\"columnComment\":\"应用名称\",\"columnId\":4,\"columnName\":\"app_name\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2022-09-27 21:38:13\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-28 16:06:59');
INSERT INTO `sys_oper_log` VALUES (162, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2022-09-28 16:07:04');
INSERT INTO `sys_oper_log` VALUES (163, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"appManagement\",\"className\":\"LoraApp\",\"columns\":[{\"capJavaField\":\"AppId\",\"columnComment\":\"应用id\",\"columnId\":1,\"columnName\":\"app_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2022-09-27 21:38:13\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"appId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2022-09-28 16:06:59\",\"usableColumn\":false},{\"capJavaField\":\"AppEui\",\"columnComment\":\"\",\"columnId\":2,\"columnName\":\"app_eui\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2022-09-27 21:38:13\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"appEui\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2022-09-28 16:06:59\",\"usableColumn\":false},{\"capJavaField\":\"AppSecret\",\"columnComment\":\"\",\"columnId\":3,\"columnName\":\"app_secret\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2022-09-27 21:38:13\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"appSecret\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2022-09-28 16:06:59\",\"usableColumn\":false},{\"capJavaField\":\"AppName\",\"columnComment\":\"应用名称\",\"columnId\":4,\"columnName\":\"app_name\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2022-09-27 21:38:13\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-28 16:15:02');
INSERT INTO `sys_oper_log` VALUES (164, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2022-09-28 16:15:05');
INSERT INTO `sys_oper_log` VALUES (165, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2022', '127.0.0.1', '内网IP', '{menuId=2022}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-28 17:27:35');
INSERT INTO `sys_oper_log` VALUES (166, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2023', '127.0.0.1', '内网IP', '{menuId=2023}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-28 17:27:36');
INSERT INTO `sys_oper_log` VALUES (167, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2024', '127.0.0.1', '内网IP', '{menuId=2024}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-28 17:27:38');
INSERT INTO `sys_oper_log` VALUES (168, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2039', '127.0.0.1', '内网IP', '{menuId=2039}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-28 17:27:40');
INSERT INTO `sys_oper_log` VALUES (169, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2040', '127.0.0.1', '内网IP', '{menuId=2040}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-28 17:27:43');
INSERT INTO `sys_oper_log` VALUES (170, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"app/appManagement/index\",\"createTime\":\"2022-09-27 21:36:41\",\"icon\":\"button\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"APP管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"APPmanage\",\"perms\":\"app:appManagement:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-28 17:29:25');
INSERT INTO `sys_oper_log` VALUES (171, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2048', '127.0.0.1', '内网IP', '{menuId=2048}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-28 17:31:39');
INSERT INTO `sys_oper_log` VALUES (172, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2049', '127.0.0.1', '内网IP', '{menuId=2049}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-28 17:31:41');
INSERT INTO `sys_oper_log` VALUES (173, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2050', '127.0.0.1', '内网IP', '{menuId=2050}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-28 17:31:43');
INSERT INTO `sys_oper_log` VALUES (174, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2051', '127.0.0.1', '内网IP', '{menuId=2051}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-28 17:31:44');
INSERT INTO `sys_oper_log` VALUES (175, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2052', '127.0.0.1', '内网IP', '{menuId=2052}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-28 17:31:46');
INSERT INTO `sys_oper_log` VALUES (176, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2047', '127.0.0.1', '内网IP', '{menuId=2047}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-28 17:31:48');
INSERT INTO `sys_oper_log` VALUES (177, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2000', '127.0.0.1', '内网IP', '{menuId=2000}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-28 17:31:50');
INSERT INTO `sys_oper_log` VALUES (178, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"app/appManagement/index\",\"createBy\":\"admin\",\"icon\":\"button\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"APP管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"appManagement\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-28 17:32:20');
INSERT INTO `sys_oper_log` VALUES (179, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2054', '127.0.0.1', '内网IP', '{menuId=2054}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2022-09-28 17:33:27');
INSERT INTO `sys_oper_log` VALUES (180, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"button\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"APP管理\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"appManagement\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-28 17:34:57');
INSERT INTO `sys_oper_log` VALUES (181, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"appManagement\",\"className\":\"LoraApp\",\"columns\":[{\"capJavaField\":\"AppId\",\"columnComment\":\"应用id\",\"columnId\":1,\"columnName\":\"app_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2022-09-27 21:38:13\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"appId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2022-09-28 16:15:01\",\"usableColumn\":false},{\"capJavaField\":\"AppEui\",\"columnComment\":\"\",\"columnId\":2,\"columnName\":\"app_eui\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2022-09-27 21:38:13\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"appEui\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2022-09-28 16:15:01\",\"usableColumn\":false},{\"capJavaField\":\"AppSecret\",\"columnComment\":\"\",\"columnId\":3,\"columnName\":\"app_secret\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2022-09-27 21:38:13\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"appSecret\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2022-09-28 16:15:01\",\"usableColumn\":false},{\"capJavaField\":\"AppName\",\"columnComment\":\"应用名称\",\"columnId\":4,\"columnName\":\"app_name\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2022-09-27 21:38:13\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-28 17:35:11');
INSERT INTO `sys_oper_log` VALUES (182, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2022-09-28 17:35:18');
INSERT INTO `sys_oper_log` VALUES (183, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"app/appManagement/index\",\"createTime\":\"2022-09-28 17:34:57\",\"icon\":\"button\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2060,\"menuName\":\"APP管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"appManagement\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-28 17:45:25');
INSERT INTO `sys_oper_log` VALUES (184, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"app/appManagement/index\",\"createTime\":\"2022-09-28 17:34:57\",\"icon\":\"button\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2060,\"menuName\":\"APP管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"appManagement\",\"perms\":\"app:appManagement:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-28 17:45:30');
INSERT INTO `sys_oper_log` VALUES (185, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"app/appManagement/index\",\"createTime\":\"2022-09-28 17:35:49\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2061,\"menuName\":\"应用\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"appManagement\",\"perms\":\"app:appManagement:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-28 17:45:37');
INSERT INTO `sys_oper_log` VALUES (186, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"app/appManagement/index\",\"createTime\":\"2022-09-28 17:35:49\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2061,\"menuName\":\"应用\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2060,\"path\":\"appManagement\",\"perms\":\"app:appManagement:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-28 17:46:03');
INSERT INTO `sys_oper_log` VALUES (187, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"app/appManagement/1\",\"createTime\":\"2022-09-28 17:34:57\",\"icon\":\"button\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2060,\"menuName\":\"APP管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"appManagement\",\"perms\":\"app:appManagement:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-28 19:39:01');
INSERT INTO `sys_oper_log` VALUES (188, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"appManagement\",\"className\":\"LoraApp\",\"columns\":[{\"capJavaField\":\"AppId\",\"columnComment\":\"应用id\",\"columnId\":1,\"columnName\":\"app_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2022-09-27 21:38:13\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"appId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2022-09-28 17:35:11\",\"usableColumn\":false},{\"capJavaField\":\"AppEui\",\"columnComment\":\"\",\"columnId\":2,\"columnName\":\"app_eui\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2022-09-27 21:38:13\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"appEui\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2022-09-28 17:35:11\",\"usableColumn\":false},{\"capJavaField\":\"AppSecret\",\"columnComment\":\"\",\"columnId\":3,\"columnName\":\"app_secret\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2022-09-27 21:38:13\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"appSecret\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2022-09-28 17:35:11\",\"usableColumn\":false},{\"capJavaField\":\"AppName\",\"columnComment\":\"应用名称\",\"columnId\":4,\"columnName\":\"app_name\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2022-09-27 21:38:13\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-28 19:42:09');
INSERT INTO `sys_oper_log` VALUES (189, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"app/appManagement/index\",\"createTime\":\"2022-09-28 17:34:57\",\"icon\":\"button\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2060,\"menuName\":\"APP管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"appManagement\",\"perms\":\"app:appManagement:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-28 19:43:28');
INSERT INTO `sys_oper_log` VALUES (190, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"app/appManagement/index\",\"createTime\":\"2022-09-28 17:34:57\",\"icon\":\"button\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2060,\"menuName\":\"APP管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"appManagement\",\"perms\":\"app:appManagement:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-28 19:50:09');
INSERT INTO `sys_oper_log` VALUES (191, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"app/appManagement/1\",\"createTime\":\"2022-09-28 17:34:57\",\"icon\":\"button\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2060,\"menuName\":\"APP管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"appManagement\",\"perms\":\"app:appManagement:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-28 19:51:26');
INSERT INTO `sys_oper_log` VALUES (192, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"app/appManagement/index\",\"createTime\":\"2022-09-28 17:34:57\",\"icon\":\"button\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2060,\"menuName\":\"APP管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"appManagement\",\"perms\":\"app:appManagement:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-28 19:51:49');
INSERT INTO `sys_oper_log` VALUES (193, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"app/appManagement/1\",\"createTime\":\"2022-09-28 17:34:57\",\"icon\":\"button\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2060,\"menuName\":\"APP管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"appManagement\",\"perms\":\"app:appManagement:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-28 19:52:07');
INSERT INTO `sys_oper_log` VALUES (194, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"app/appManagement/index\",\"createTime\":\"2022-09-28 17:34:57\",\"icon\":\"button\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2060,\"menuName\":\"APP管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"appManagement\",\"perms\":\"app:appManagement:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-29 13:18:34');
INSERT INTO `sys_oper_log` VALUES (195, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', NULL, '/tool/gen/synchDb/lora_app', '127.0.0.1', '内网IP', '{tableName=lora_app}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-29 13:20:20');
INSERT INTO `sys_oper_log` VALUES (196, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"appManagement\",\"className\":\"LoraApp\",\"columns\":[{\"capJavaField\":\"AppId\",\"columnComment\":\"应用id\",\"columnId\":1,\"columnName\":\"app_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2022-09-27 21:38:13\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"appId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2022-09-29 13:20:20\",\"usableColumn\":false},{\"capJavaField\":\"AppEui\",\"columnComment\":\"\",\"columnId\":2,\"columnName\":\"app_eui\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2022-09-27 21:38:13\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"appEui\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2022-09-29 13:20:20\",\"usableColumn\":false},{\"capJavaField\":\"AppSecret\",\"columnComment\":\"\",\"columnId\":3,\"columnName\":\"app_secret\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2022-09-27 21:38:13\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"appSecret\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2022-09-29 13:20:20\",\"usableColumn\":false},{\"capJavaField\":\"AppName\",\"columnComment\":\"应用名称\",\"columnId\":4,\"columnName\":\"app_name\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2022-09-27 21:38:13\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-29 13:20:40');
INSERT INTO `sys_oper_log` VALUES (197, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"appManagement\",\"className\":\"LoraApp\",\"columns\":[{\"capJavaField\":\"AppId\",\"columnComment\":\"应用id\",\"columnId\":1,\"columnName\":\"app_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2022-09-27 21:38:13\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"appId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2022-09-29 13:20:40\",\"usableColumn\":false},{\"capJavaField\":\"AppEui\",\"columnComment\":\"\",\"columnId\":2,\"columnName\":\"app_eui\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2022-09-27 21:38:13\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"appEui\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2022-09-29 13:20:40\",\"usableColumn\":false},{\"capJavaField\":\"AppSecret\",\"columnComment\":\"\",\"columnId\":3,\"columnName\":\"app_secret\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2022-09-27 21:38:13\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"appSecret\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2022-09-29 13:20:40\",\"usableColumn\":false},{\"capJavaField\":\"AppName\",\"columnComment\":\"应用名称\",\"columnId\":4,\"columnName\":\"app_name\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2022-09-27 21:38:13\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-29 13:21:19');
INSERT INTO `sys_oper_log` VALUES (198, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/notice/index\",\"createTime\":\"2022-09-27 21:29:42\",\"icon\":\"message\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":107,\"menuName\":\"通知公告\",\"menuType\":\"C\",\"orderNum\":8,\"params\":{},\"parentId\":1,\"path\":\"notice\",\"perms\":\"system:notice:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-29 13:23:39');
INSERT INTO `sys_oper_log` VALUES (199, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/config/index\",\"createTime\":\"2022-09-27 21:29:42\",\"icon\":\"edit\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":106,\"menuName\":\"参数设置\",\"menuType\":\"C\",\"orderNum\":7,\"params\":{},\"parentId\":1,\"path\":\"config\",\"perms\":\"system:config:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-29 13:23:54');
INSERT INTO `sys_oper_log` VALUES (200, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"app/appManagement/1\",\"createTime\":\"2022-09-28 17:34:57\",\"icon\":\"button\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2060,\"menuName\":\"APP管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"appManagement\",\"perms\":\"app:appManagement:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-29 13:26:17');
INSERT INTO `sys_oper_log` VALUES (201, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"app/appManagement/index\",\"createTime\":\"2022-09-28 17:34:57\",\"icon\":\"button\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2060,\"menuName\":\"APP管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"appManagement\",\"perms\":\"app:appManagement:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-29 13:26:33');
INSERT INTO `sys_oper_log` VALUES (202, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"404\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"测试\",\"menuType\":\"M\",\"orderNum\":7,\"params\":{},\"parentId\":0,\"path\":\"test\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-29 16:14:47');
INSERT INTO `sys_oper_log` VALUES (203, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"apptestManagement\",\"className\":\"LoratestApp\",\"columns\":[{\"capJavaField\":\"AppId\",\"columnComment\":\"应用id\",\"columnId\":1,\"columnName\":\"app_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2022-09-27 21:38:13\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"appId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2022-09-29 13:21:19\",\"usableColumn\":false},{\"capJavaField\":\"AppEui\",\"columnComment\":\"\",\"columnId\":2,\"columnName\":\"app_eui\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2022-09-27 21:38:13\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"appEui\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2022-09-29 13:21:19\",\"usableColumn\":false},{\"capJavaField\":\"AppSecret\",\"columnComment\":\"\",\"columnId\":3,\"columnName\":\"app_secret\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2022-09-27 21:38:13\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"appSecret\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2022-09-29 13:21:19\",\"usableColumn\":false},{\"capJavaField\":\"AppName\",\"columnComment\":\"应用名称\",\"columnId\":4,\"columnName\":\"app_name\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2022-09-27 21:38:13\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"i', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-29 16:15:48');
INSERT INTO `sys_oper_log` VALUES (204, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2022-09-29 16:15:53');
INSERT INTO `sys_oper_log` VALUES (205, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"apptestManagement\",\"className\":\"LoratestApp\",\"columns\":[{\"capJavaField\":\"AppId\",\"columnComment\":\"应用id\",\"columnId\":1,\"columnName\":\"app_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2022-09-27 21:38:13\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"appId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2022-09-29 16:15:48\",\"usableColumn\":false},{\"capJavaField\":\"AppEui\",\"columnComment\":\"\",\"columnId\":2,\"columnName\":\"app_eui\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2022-09-27 21:38:13\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"appEui\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2022-09-29 16:15:48\",\"usableColumn\":false},{\"capJavaField\":\"AppSecret\",\"columnComment\":\"\",\"columnId\":3,\"columnName\":\"app_secret\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2022-09-27 21:38:13\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"appSecret\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2022-09-29 16:15:48\",\"usableColumn\":false},{\"capJavaField\":\"AppName\",\"columnComment\":\"应用名称\",\"columnId\":4,\"columnName\":\"app_name\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2022-09-27 21:38:13\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"i', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-29 16:16:52');
INSERT INTO `sys_oper_log` VALUES (206, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2022-09-29 16:16:55');
INSERT INTO `sys_oper_log` VALUES (207, '应用', 2, 'com.ruoyi.app.controller.LoraAppController.edit()', 'PUT', 1, 'admin', NULL, '/app/appManagement', '127.0.0.1', '内网IP', '{\"appEui\":\"123\",\"appId\":18,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-29 19:32:39');
INSERT INTO `sys_oper_log` VALUES (208, '应用', 2, 'com.ruoyi.app.controller.LoraAppController.edit()', 'PUT', 1, 'admin', NULL, '/app/appManagement', '127.0.0.1', '内网IP', '{\"appEui\":\"123\",\"appId\":18,\"params\":{},\"phone\":\"13301023566\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-29 20:12:58');
INSERT INTO `sys_oper_log` VALUES (209, 'appserver帧数据', 5, 'com.ruoyi.data.controller.LoraDataController.export()', 'POST', 1, 'admin', NULL, '/data/dataManagement/export', '127.0.0.1', '内网IP', '{\"params\":{}}', NULL, 0, NULL, '2022-09-30 09:16:15');
INSERT INTO `sys_oper_log` VALUES (210, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2022-09-29 16:14:47\",\"icon\":\"404\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2067,\"menuName\":\"测试\",\"menuType\":\"M\",\"orderNum\":7,\"params\":{},\"parentId\":0,\"path\":\"test\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-30 09:30:17');
INSERT INTO `sys_oper_log` VALUES (211, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2022-09-27 21:29:42\",\"icon\":\"guide\",\"isCache\":\"0\",\"isFrame\":\"0\",\"menuId\":4,\"menuName\":\"若依官网\",\"menuType\":\"M\",\"orderNum\":9,\"params\":{},\"parentId\":0,\"path\":\"http://ruoyi.vip\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-30 09:30:20');
INSERT INTO `sys_oper_log` VALUES (212, 'appserver帧数据', 5, 'com.ruoyi.data.controller.LoraDataController.export()', 'POST', 1, 'admin', NULL, '/data/dataManagement/export', '127.0.0.1', '内网IP', '{\"params\":{}}', NULL, 0, NULL, '2022-09-30 23:22:46');
INSERT INTO `sys_oper_log` VALUES (213, 'appserver帧数据', 5, 'com.ruoyi.data.controller.LoraDataController.export()', 'POST', 1, 'admin', NULL, '/data/dataManagement/export', '127.0.0.1', '内网IP', '{\"params\":{}}', NULL, 0, NULL, '2022-09-30 23:22:55');
INSERT INTO `sys_oper_log` VALUES (214, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2022-09-27 21:29:42\",\"icon\":\"monitor\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2,\"menuName\":\"系统监控\",\"menuType\":\"M\",\"orderNum\":8,\"params\":{},\"parentId\":0,\"path\":\"monitor\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-30 23:24:15');
INSERT INTO `sys_oper_log` VALUES (215, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2022-09-27 21:29:42\",\"icon\":\"tool\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":3,\"menuName\":\"系统工具\",\"menuType\":\"M\",\"orderNum\":7,\"params\":{},\"parentId\":0,\"path\":\"tool\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-30 23:24:19');
INSERT INTO `sys_oper_log` VALUES (216, 'appserver帧数据', 5, 'com.ruoyi.data.controller.LoraDataController.export()', 'POST', 1, 'admin', NULL, '/data/dataManagement/export', '127.0.0.1', '内网IP', '{\"params\":{}}', NULL, 0, NULL, '2022-09-30 23:25:29');
INSERT INTO `sys_oper_log` VALUES (217, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2022-09-27 21:29:42\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":105,\"deptName\":\"测试部门\",\"leader\":\"若依\",\"orderNum\":3,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":105,\"email\":\"ry@qq.com\",\"loginDate\":\"2022-09-27 21:29:42\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"XXN\",\"params\":{},\"phonenumber\":\"15666666666\",\"postIds\":[2],\"remark\":\"测试员\",\"roleIds\":[2],\"roles\":[{\"admin\":false,\"dataScope\":\"2\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":\"2\",\"status\":\"0\"}],\"sex\":\"1\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":2,\"userName\":\"ry\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-01 00:23:26');
INSERT INTO `sys_oper_log` VALUES (218, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/dict/index\",\"createTime\":\"2022-09-27 21:29:42\",\"icon\":\"dict\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":105,\"menuName\":\"字典管理\",\"menuType\":\"C\",\"orderNum\":6,\"params\":{},\"parentId\":1,\"path\":\"dict\",\"perms\":\"system:dict:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-01 00:23:53');
INSERT INTO `sys_oper_log` VALUES (219, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/post/index\",\"createTime\":\"2022-09-27 21:29:42\",\"icon\":\"post\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":104,\"menuName\":\"岗位管理\",\"menuType\":\"C\",\"orderNum\":5,\"params\":{},\"parentId\":1,\"path\":\"post\",\"perms\":\"system:post:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-01 00:23:59');
INSERT INTO `sys_oper_log` VALUES (220, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/dept/index\",\"createTime\":\"2022-09-27 21:29:42\",\"icon\":\"tree\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":103,\"menuName\":\"部门管理\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":1,\"path\":\"dept\",\"perms\":\"system:dept:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-01 00:24:03');
INSERT INTO `sys_oper_log` VALUES (221, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/dept/index\",\"createTime\":\"2022-09-27 21:29:42\",\"icon\":\"tree\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":103,\"menuName\":\"部门管理\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":1,\"path\":\"dept\",\"perms\":\"system:dept:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-01 00:24:49');
INSERT INTO `sys_oper_log` VALUES (222, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/system/dept/103', '127.0.0.1', '内网IP', '{deptId=103}', '{\"msg\":\"部门存在用户,不允许删除\",\"code\":500}', 0, NULL, '2022-10-01 00:25:01');
INSERT INTO `sys_oper_log` VALUES (223, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/system/dept/104', '127.0.0.1', '内网IP', '{deptId=104}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-01 00:25:04');
INSERT INTO `sys_oper_log` VALUES (224, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/system/dept/106', '127.0.0.1', '内网IP', '{deptId=106}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-01 00:25:06');
INSERT INTO `sys_oper_log` VALUES (225, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/system/dept/107', '127.0.0.1', '内网IP', '{deptId=107}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-01 00:25:08');
INSERT INTO `sys_oper_log` VALUES (226, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/system/dept/105', '127.0.0.1', '内网IP', '{deptId=105}', '{\"msg\":\"部门存在用户,不允许删除\",\"code\":500}', 0, NULL, '2022-10-01 00:25:10');
INSERT INTO `sys_oper_log` VALUES (227, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/system/dept/109', '127.0.0.1', '内网IP', '{deptId=109}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-01 00:25:12');
INSERT INTO `sys_oper_log` VALUES (228, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/system/dept/108', '127.0.0.1', '内网IP', '{deptId=108}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-01 00:25:16');
INSERT INTO `sys_oper_log` VALUES (229, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/system/dept/102', '127.0.0.1', '内网IP', '{deptId=102}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-01 00:25:17');
INSERT INTO `sys_oper_log` VALUES (230, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0\",\"children\":[],\"deptId\":100,\"deptName\":\"ISIP科技\",\"email\":\"ry@qq.com\",\"leader\":\"若依\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-01 00:25:26');
INSERT INTO `sys_oper_log` VALUES (231, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100\",\"children\":[],\"deptId\":101,\"deptName\":\"西邮总公司\",\"email\":\"ry@qq.com\",\"leader\":\"若依\",\"orderNum\":1,\"params\":{},\"parentId\":100,\"parentName\":\"ISIP科技\",\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-01 00:25:33');
INSERT INTO `sys_oper_log` VALUES (232, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2022-09-27 21:29:42\",\"icon\":\"tool\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":3,\"menuName\":\"系统工具\",\"menuType\":\"M\",\"orderNum\":7,\"params\":{},\"parentId\":0,\"path\":\"tool\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-08 09:10:45');
INSERT INTO `sys_oper_log` VALUES (233, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2022-09-27 21:29:42\",\"icon\":\"tool\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":3,\"menuName\":\"系统工具\",\"menuType\":\"M\",\"orderNum\":7,\"params\":{},\"parentId\":0,\"path\":\"tool\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-08 09:10:45');
INSERT INTO `sys_oper_log` VALUES (234, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"apptestManagement\",\"className\":\"LoratestApp\",\"columns\":[{\"capJavaField\":\"AppId\",\"columnComment\":\"应用id\",\"columnId\":1,\"columnName\":\"app_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2022-09-27 21:38:13\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"appId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2022-09-29 16:16:52\",\"usableColumn\":false},{\"capJavaField\":\"AppEui\",\"columnComment\":\"\",\"columnId\":2,\"columnName\":\"app_eui\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2022-09-27 21:38:13\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"appEui\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2022-09-29 16:16:52\",\"usableColumn\":false},{\"capJavaField\":\"AppSecret\",\"columnComment\":\"\",\"columnId\":3,\"columnName\":\"app_secret\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2022-09-27 21:38:13\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"appSecret\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2022-09-29 16:16:52\",\"usableColumn\":false},{\"capJavaField\":\"AppName\",\"columnComment\":\"应用名称\",\"columnId\":4,\"columnName\":\"app_name\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2022-09-27 21:38:13\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"i', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-08 09:11:51');
INSERT INTO `sys_oper_log` VALUES (235, '终端 ', 2, 'com.ruoyi.system.controller.LoraTerminalController.edit()', 'PUT', 1, 'admin', NULL, '/equ/terminal', '127.0.0.1', '内网IP', '{\"params\":{},\"terminalEui\":\"2\",\"terminalId\":1}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2022-10-08 15:51:21');
INSERT INTO `sys_oper_log` VALUES (236, '终端 ', 2, 'com.ruoyi.system.controller.LoraTerminalController.edit()', 'PUT', 1, 'admin', NULL, '/equ/terminal', '127.0.0.1', '内网IP', '{\"appId\":3,\"params\":{},\"terminalEui\":\"2\",\"terminalId\":1}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2022-10-08 15:51:22');
INSERT INTO `sys_oper_log` VALUES (237, '终端 ', 2, 'com.ruoyi.system.controller.LoraTerminalController.edit()', 'PUT', 1, 'admin', NULL, '/equ/terminal', '127.0.0.1', '内网IP', '{\"params\":{},\"terminalEui\":\"4\",\"terminalId\":45}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2022-10-09 10:48:42');
INSERT INTO `sys_oper_log` VALUES (238, '终端 ', 2, 'com.ruoyi.system.controller.LoraTerminalController.edit()', 'PUT', 1, 'admin', NULL, '/equ/terminal', '127.0.0.1', '内网IP', '{\"appId\":4,\"params\":{},\"terminalEui\":\"4\",\"terminalId\":45}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2022-10-09 10:48:43');
INSERT INTO `sys_oper_log` VALUES (239, '终端 ', 2, 'com.ruoyi.system.controller.LoraTerminalController.edit()', 'PUT', 1, 'admin', NULL, '/equ/terminal', '127.0.0.1', '内网IP', '{\"appId\":3,\"params\":{},\"terminalEui\":\"3\",\"terminalId\":3}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2022-10-09 10:57:05');
INSERT INTO `sys_oper_log` VALUES (240, '终端 ', 2, 'com.ruoyi.system.controller.LoraTerminalController.edit()', 'PUT', 1, 'admin', NULL, '/equ/terminal', '127.0.0.1', '内网IP', '{\"appId\":1,\"params\":{},\"terminalEui\":\"3\",\"terminalId\":3}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2022-10-09 10:57:07');
INSERT INTO `sys_oper_log` VALUES (241, '终端 ', 2, 'com.ruoyi.system.controller.LoraTerminalController.edit()', 'PUT', 1, 'admin', NULL, '/equ/terminal', '127.0.0.1', '内网IP', '{\"appId\":1,\"params\":{},\"terminalEui\":\"1\",\"terminalId\":1}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2022-10-09 10:57:25');
INSERT INTO `sys_oper_log` VALUES (242, '终端 ', 2, 'com.ruoyi.system.controller.LoraTerminalController.edit()', 'PUT', 1, 'admin', NULL, '/equ/terminal', '127.0.0.1', '内网IP', '{\"appId\":2,\"params\":{},\"terminalEui\":\"1\",\"terminalId\":1}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2022-10-09 10:57:27');
INSERT INTO `sys_oper_log` VALUES (243, '应用', 1, 'com.ruoyi.system.controller.LoraAppController.add()', 'POST', 1, 'admin', NULL, '/app/appManagement', '127.0.0.1', '内网IP', '{\"appEui\":\"123\",\"appId\":25,\"appName\":\"12\",\"company\":\"123\",\"managerName\":\"12\",\"params\":{},\"phone\":\"13333333333\",\"timeto\":\"2022-10-09 00:00:00\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-09 10:58:47');
INSERT INTO `sys_oper_log` VALUES (244, '终端 ', 2, 'com.ruoyi.system.controller.LoraTerminalController.edit()', 'PUT', 1, 'admin', NULL, '/equ/terminal', '127.0.0.1', '内网IP', '{\"appId\":25,\"params\":{},\"terminalEui\":\"25\",\"terminalId\":25}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-09 10:58:56');
INSERT INTO `sys_oper_log` VALUES (245, '终端 ', 2, 'com.ruoyi.system.controller.LoraTerminalController.edit()', 'PUT', 1, 'admin', NULL, '/equ/terminal', '127.0.0.1', '内网IP', '{\"appId\":25,\"params\":{},\"terminalEui\":\"25\",\"terminalId\":13}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-09 10:59:28');
INSERT INTO `sys_oper_log` VALUES (246, '终端 ', 2, 'com.ruoyi.system.controller.LoraTerminalController.edit()', 'PUT', 1, 'admin', NULL, '/equ/terminal', '127.0.0.1', '内网IP', '{\"appId\":25,\"params\":{},\"terminalEui\":\"25\",\"terminalId\":25}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-09 11:00:25');
INSERT INTO `sys_oper_log` VALUES (247, '终端 ', 2, 'com.ruoyi.system.controller.LoraTerminalController.edit()', 'PUT', 1, 'admin', NULL, '/equ/terminal', '127.0.0.1', '内网IP', '{\"appId\":25,\"params\":{},\"terminalEui\":\"25\",\"terminalId\":25}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-09 11:00:31');
INSERT INTO `sys_oper_log` VALUES (248, '应用', 1, 'com.ruoyi.system.controller.LoraAppController.add()', 'POST', 1, 'admin', NULL, '/app/appManagement', '127.0.0.1', '内网IP', '{\"appEui\":\"13\",\"appId\":26,\"appName\":\"13\",\"company\":\"13\",\"managerName\":\"14\",\"params\":{},\"phone\":\"13333333333\",\"timeto\":\"2022-10-04 00:00:00\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-09 11:00:44');
INSERT INTO `sys_oper_log` VALUES (249, '终端 ', 2, 'com.ruoyi.system.controller.LoraTerminalController.edit()', 'PUT', 1, 'admin', NULL, '/equ/terminal', '127.0.0.1', '内网IP', '{\"activeState\":1,\"appEui\":\"305419896\",\"appId\":25,\"battery\":100,\"macType\":1,\"params\":{},\"runState\":0,\"terminalAddr\":16,\"terminalEui\":\"4660\",\"terminalId\":5,\"terminalType\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-09 11:02:27');
INSERT INTO `sys_oper_log` VALUES (250, '终端 ', 2, 'com.ruoyi.system.controller.LoraTerminalController.edit()', 'PUT', 1, 'admin', NULL, '/equ/terminal', '127.0.0.1', '内网IP', '{\"activeState\":1,\"appEui\":\"305419896\",\"appId\":25,\"battery\":99,\"macType\":1,\"params\":{},\"runState\":0,\"terminalAddr\":4004,\"terminalEui\":\"4004\",\"terminalId\":9,\"terminalType\":2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-09 11:02:34');
INSERT INTO `sys_oper_log` VALUES (251, '终端 ', 2, 'com.ruoyi.system.controller.LoraTerminalController.edit()', 'PUT', 1, 'admin', NULL, '/equ/terminal', '127.0.0.1', '内网IP', '{\"activeState\":1,\"appEui\":\"305419896\",\"appId\":3,\"battery\":99,\"macType\":1,\"params\":{},\"runState\":0,\"terminalAddr\":4004,\"terminalEui\":\"4004\",\"terminalId\":9,\"terminalType\":2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-09 11:02:36');
INSERT INTO `sys_oper_log` VALUES (252, '终端 ', 2, 'com.ruoyi.system.controller.LoraTerminalController.edit()', 'PUT', 1, 'admin', NULL, '/equ/terminal', '127.0.0.1', '内网IP', '{\"activeState\":1,\"appEui\":\"305419896\",\"appId\":1,\"battery\":99,\"macType\":1,\"params\":{},\"runState\":0,\"terminalAddr\":4004,\"terminalEui\":\"4004\",\"terminalId\":9,\"terminalType\":2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-09 11:02:39');
INSERT INTO `sys_oper_log` VALUES (253, '终端 ', 2, 'com.ruoyi.system.controller.LoraTerminalController.edit()', 'PUT', 1, 'admin', NULL, '/equ/terminal', '127.0.0.1', '内网IP', '{\"activeState\":1,\"appEui\":\"305419896\",\"appId\":7,\"battery\":99,\"macType\":1,\"params\":{},\"runState\":0,\"terminalAddr\":4004,\"terminalEui\":\"4004\",\"terminalId\":9,\"terminalType\":2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-09 11:02:42');
INSERT INTO `sys_oper_log` VALUES (254, '终端 ', 2, 'com.ruoyi.system.controller.LoraTerminalController.edit()', 'PUT', 1, 'admin', NULL, '/equ/terminal', '127.0.0.1', '内网IP', '{\"appId\":13,\"params\":{},\"terminalEui\":\"13\",\"terminalId\":13}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-09 11:04:59');
INSERT INTO `sys_oper_log` VALUES (255, '终端 ', 5, 'com.ruoyi.system.controller.LoraTerminalController.export()', 'POST', 1, 'admin', NULL, '/equ/terminal/export', '127.0.0.1', '内网IP', '{\"params\":{}}', NULL, 0, NULL, '2022-10-09 11:05:06');
INSERT INTO `sys_oper_log` VALUES (256, '终端 ', 3, 'com.ruoyi.system.controller.LoraTerminalController.remove()', 'DELETE', 1, 'admin', NULL, '/equ/terminal/9', '127.0.0.1', '内网IP', '{terminalIds=9}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-09 11:05:16');
INSERT INTO `sys_oper_log` VALUES (257, '终端 ', 2, 'com.ruoyi.system.controller.LoraTerminalController.edit()', 'PUT', 1, 'admin', NULL, '/equ/terminal', '127.0.0.1', '内网IP', '{\"appId\":17,\"params\":{},\"terminalEui\":\"14\",\"terminalId\":5555}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2022-10-09 11:05:33');
INSERT INTO `sys_oper_log` VALUES (258, '终端 ', 2, 'com.ruoyi.system.controller.LoraTerminalController.edit()', 'PUT', 1, 'admin', NULL, '/equ/terminal', '127.0.0.1', '内网IP', '{\"appId\":25,\"params\":{},\"terminalEui\":\"14\",\"terminalId\":5555}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2022-10-09 11:05:38');
INSERT INTO `sys_oper_log` VALUES (259, '终端 ', 2, 'com.ruoyi.system.controller.LoraTerminalController.edit()', 'PUT', 1, 'admin', NULL, '/equ/terminal', '127.0.0.1', '内网IP', '{\"appId\":25,\"params\":{},\"terminalEui\":\"35\",\"terminalId\":5555}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2022-10-09 11:05:44');
INSERT INTO `sys_oper_log` VALUES (260, '终端 ', 2, 'com.ruoyi.system.controller.LoraTerminalController.edit()', 'PUT', 1, 'admin', NULL, '/equ/terminal', '127.0.0.1', '内网IP', '{\"appId\":6,\"params\":{},\"terminalEui\":\"6\",\"terminalId\":6}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2022-10-09 11:06:00');
INSERT INTO `sys_oper_log` VALUES (261, '终端 ', 2, 'com.ruoyi.system.controller.LoraTerminalController.edit()', 'PUT', 1, 'admin', NULL, '/equ/terminal', '127.0.0.1', '内网IP', '{\"appId\":1,\"params\":{},\"terminalEui\":\"1\",\"terminalId\":1}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2022-10-09 11:06:44');
INSERT INTO `sys_oper_log` VALUES (262, '终端 ', 2, 'com.ruoyi.system.controller.LoraTerminalController.edit()', 'PUT', 1, 'admin', NULL, '/equ/terminal', '127.0.0.1', '内网IP', '{\"appId\":5,\"params\":{},\"terminalEui\":\"5\",\"terminalId\":5}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-09 11:06:50');
INSERT INTO `sys_oper_log` VALUES (263, '终端 ', 2, 'com.ruoyi.system.controller.LoraTerminalController.edit()', 'PUT', 1, 'admin', NULL, '/equ/terminal', '127.0.0.1', '内网IP', '{\"appId\":5,\"params\":{},\"terminalEui\":\"5\",\"terminalId\":5}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-09 11:06:59');
INSERT INTO `sys_oper_log` VALUES (264, '终端 ', 2, 'com.ruoyi.system.controller.LoraTerminalController.edit()', 'PUT', 1, 'admin', NULL, '/equ/terminal', '127.0.0.1', '内网IP', '{\"appId\":5,\"params\":{},\"terminalEui\":\"5\",\"terminalId\":5}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-09 11:07:07');
INSERT INTO `sys_oper_log` VALUES (265, '终端 ', 2, 'com.ruoyi.system.controller.LoraTerminalController.edit()', 'PUT', 1, 'admin', NULL, '/equ/terminal', '127.0.0.1', '内网IP', '{\"appId\":5,\"params\":{},\"terminalEui\":\"4\",\"terminalId\":555}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2022-10-09 11:07:53');
INSERT INTO `sys_oper_log` VALUES (266, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptId\":105,\"nickName\":\"Weiwang\",\"params\":{},\"phonenumber\":\"15229200311\",\"postIds\":[1,2,3,4],\"roleIds\":[2],\"sex\":\"0\",\"status\":\"0\",\"userId\":100,\"userName\":\"LWW18\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-09 11:51:16');
INSERT INTO `sys_oper_log` VALUES (267, '角色管理', 1, 'com.ruoyi.web.controller.system.SysRoleController.add()', 'POST', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":false,\"menuIds\":[2060,2062,2063,2064,2065,2066,2001,2004,2005,2006,2007,2008,2002,2028,2041,2029,2030,2031,2032,1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2033,2034,3,115,116,1055,1056,1057,1058,1059,1060,117,2067,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114,4],\"params\":{},\"roleId\":100,\"roleKey\":\"2\",\"roleName\":\"test\",\"roleSort\":\"3\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-09 11:52:02');
INSERT INTO `sys_oper_log` VALUES (268, '角色管理', 4, 'com.ruoyi.web.controller.system.SysRoleController.selectAuthUserAll()', 'PUT', 1, 'admin', NULL, '/system/role/authUser/selectAll', '127.0.0.1', '内网IP', '100 [1,2,100]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-09 11:52:27');
INSERT INTO `sys_oper_log` VALUES (269, '终端 ', 2, 'com.ruoyi.system.controller.LoraTerminalController.edit()', 'PUT', 1, 'admin', NULL, '/equ/terminal', '127.0.0.1', '内网IP', '{\"appId\":10,\"params\":{},\"terminalEui\":\"10\",\"terminalId\":10}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-09 12:04:23');
INSERT INTO `sys_oper_log` VALUES (270, '终端 ', 2, 'com.ruoyi.system.controller.LoraTerminalController.edit()', 'PUT', 1, 'admin', NULL, '/equ/terminal', '127.0.0.1', '内网IP', '{\"appId\":222,\"params\":{},\"terminalEui\":\"222\",\"terminalId\":444}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2022-10-09 12:04:28');
INSERT INTO `sys_oper_log` VALUES (271, '终端 ', 2, 'com.ruoyi.system.controller.LoraTerminalController.edit()', 'PUT', 1, 'admin', NULL, '/equ/terminal', '127.0.0.1', '内网IP', '{\"appId\":44,\"params\":{},\"terminalEui\":\"44\",\"terminalId\":444}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2022-10-09 12:08:54');
INSERT INTO `sys_oper_log` VALUES (272, '终端 ', 2, 'com.ruoyi.system.controller.LoraTerminalController.edit()', 'PUT', 1, 'admin', NULL, '/equ/terminal', '127.0.0.1', '内网IP', '{\"appId\":44,\"params\":{},\"terminalEui\":\"444\",\"terminalId\":4444}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2022-10-09 12:08:57');
INSERT INTO `sys_oper_log` VALUES (273, '终端 ', 2, 'com.ruoyi.system.controller.LoraTerminalController.edit()', 'PUT', 1, 'admin', NULL, '/equ/terminal', '127.0.0.1', '内网IP', '{\"appId\":1,\"params\":{},\"terminalEui\":\"1\",\"terminalId\":1}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2022-10-09 12:35:04');
INSERT INTO `sys_oper_log` VALUES (274, '终端 ', 2, 'com.ruoyi.system.controller.LoraTerminalController.edit()', 'PUT', 1, 'admin', NULL, '/equ/terminal', '127.0.0.1', '内网IP', '{\"appId\":7,\"params\":{},\"terminalEui\":\"7\",\"terminalId\":567}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2022-10-09 12:35:10');
INSERT INTO `sys_oper_log` VALUES (275, '终端 ', 2, 'com.ruoyi.system.controller.LoraTerminalController.edit()', 'PUT', 1, 'admin', NULL, '/equ/terminal', '127.0.0.1', '内网IP', '{\"appId\":123,\"params\":{},\"terminalEui\":\"123\",\"terminalId\":123}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2022-10-09 12:36:56');
INSERT INTO `sys_oper_log` VALUES (276, '终端 ', 2, 'com.ruoyi.system.controller.LoraTerminalController.edit()', 'PUT', 1, 'admin', NULL, '/equ/terminal', '127.0.0.1', '内网IP', '{\"appId\":5,\"params\":{},\"terminalEui\":\"5\",\"terminalId\":5}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-09 12:41:12');
INSERT INTO `sys_oper_log` VALUES (277, '终端 ', 2, 'com.ruoyi.system.controller.LoraTerminalController.edit()', 'PUT', 1, 'admin', NULL, '/equ/terminal', '127.0.0.1', '内网IP', '{\"appId\":124,\"params\":{},\"terminalEui\":\"124124\",\"terminalId\":12341}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2022-10-09 12:41:17');
INSERT INTO `sys_oper_log` VALUES (278, '应用', 1, 'com.ruoyi.system.controller.LoraAppController.add()', 'POST', 1, 'admin', NULL, '/app/appManagement', '127.0.0.1', '内网IP', '{\"appEui\":\"45\",\"appId\":27,\"appName\":\"345\",\"company\":\"345\",\"managerName\":\"345\",\"params\":{},\"phone\":\"13333333333\",\"timeto\":\"2022-10-02 00:00:00\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-09 12:41:37');
INSERT INTO `sys_oper_log` VALUES (279, '终端 ', 1, 'com.ruoyi.system.controller.LoraTerminalController.add()', 'POST', 1, 'admin', NULL, '/equ/terminal', '127.0.0.1', '内网IP', '{\"nwkskey\":\"123\",\"params\":{},\"terminalAddr\":123,\"terminalEui\":\"123\",\"terminalId\":76,\"terminalType\":2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-09 12:43:43');
INSERT INTO `sys_oper_log` VALUES (280, '终端 ', 2, 'com.ruoyi.system.controller.LoraTerminalController.edit()', 'PUT', 1, 'admin', NULL, '/equ/terminal', '127.0.0.1', '内网IP', '{\"appId\":24,\"params\":{},\"terminalEui\":\"24\",\"terminalId\":24}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-09 12:46:43');
INSERT INTO `sys_oper_log` VALUES (281, '终端 ', 2, 'com.ruoyi.system.controller.LoraTerminalController.edit()', 'PUT', 1, 'admin', NULL, '/equ/terminal', '127.0.0.1', '内网IP', '{\"appId\":666,\"params\":{},\"terminalEui\":\"666\",\"terminalId\":666}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2022-10-09 12:46:53');
INSERT INTO `sys_oper_log` VALUES (282, '终端 ', 2, 'com.ruoyi.system.controller.LoraTerminalController.edit()', 'PUT', 1, 'admin', NULL, '/equ/terminal', '127.0.0.1', '内网IP', '{\"appId\":666,\"params\":{},\"terminalEui\":\"666\",\"terminalId\":666}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2022-10-09 12:46:54');
INSERT INTO `sys_oper_log` VALUES (283, '终端 ', 1, 'com.ruoyi.system.controller.LoraTerminalController.add()', 'POST', 1, 'admin', NULL, '/equ/terminal', '127.0.0.1', '内网IP', '{\"params\":{},\"terminalId\":77,\"terminalType\":2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-09 12:47:14');
INSERT INTO `sys_oper_log` VALUES (284, '终端 ', 1, 'com.ruoyi.system.controller.LoraTerminalController.add()', 'POST', 1, 'admin', NULL, '/equ/terminal', '127.0.0.1', '内网IP', '{\"appId\":45,\"params\":{},\"terminalEui\":\"45\",\"terminalId\":78,\"terminalType\":2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-09 12:52:07');
INSERT INTO `sys_oper_log` VALUES (285, '终端 ', 1, 'com.ruoyi.system.controller.LoraTerminalController.add()', 'POST', 1, 'admin', NULL, '/equ/terminal', '127.0.0.1', '内网IP', '{\"appId\":35,\"params\":{},\"terminalEui\":\"35\",\"terminalId\":79,\"terminalType\":2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-09 12:52:46');
INSERT INTO `sys_oper_log` VALUES (286, '应用', 1, 'com.ruoyi.system.controller.LoraAppController.add()', 'POST', 1, 'admin', NULL, '/app/appManagement', '127.0.0.1', '内网IP', '{\"appEui\":\"123\",\"appId\":28,\"appName\":\"123\",\"company\":\"132\",\"managerName\":\"123\",\"params\":{},\"phone\":\"13333333333\",\"timeto\":\"2022-10-03 00:00:00\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-15 13:05:59');
INSERT INTO `sys_oper_log` VALUES (287, '终端 ', 1, 'com.ruoyi.system.controller.LoraTerminalController.add()', 'POST', 1, 'admin', NULL, '/equ/terminal', '127.0.0.1', '内网IP', '{\"appId\":123,\"params\":{},\"terminalEui\":\"123\",\"terminalId\":80,\"terminalType\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-15 13:06:06');
INSERT INTO `sys_oper_log` VALUES (288, '终端 ', 1, 'com.ruoyi.system.controller.LoraTerminalController.add()', 'POST', 1, 'admin', NULL, '/equ/terminal', '127.0.0.1', '内网IP', '{\"appId\":23,\"params\":{},\"terminalEui\":\"24\",\"terminalId\":81,\"terminalType\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-15 13:06:12');
INSERT INTO `sys_oper_log` VALUES (289, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"404\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"终端管理测试\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"edu/terminaltest/index\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-15 13:09:27');
INSERT INTO `sys_oper_log` VALUES (290, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"edu/terminaltest/index\",\"createTime\":\"2022-10-15 13:09:27\",\"icon\":\"404\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2080,\"menuName\":\"终端管理测试\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"terminaltest\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-15 13:09:54');
INSERT INTO `sys_oper_log` VALUES (291, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"edu/terminaltest/index\",\"createTime\":\"2022-10-15 13:09:27\",\"icon\":\"404\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2080,\"menuName\":\"终端管理测试\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"terminaltest\",\"perms\":\"system:user:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-15 13:10:26');
INSERT INTO `sys_oper_log` VALUES (292, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/user/index\",\"createTime\":\"2022-10-15 13:09:27\",\"icon\":\"404\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2080,\"menuName\":\"终端管理测试\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"terminaltest\",\"perms\":\"system:user:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-15 13:10:58');
INSERT INTO `sys_oper_log` VALUES (293, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"equ/terminaltest/index\",\"createTime\":\"2022-10-15 13:09:27\",\"icon\":\"404\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2080,\"menuName\":\"终端管理测试\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"terminaltest\",\"perms\":\"system:user:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-15 13:12:47');
INSERT INTO `sys_oper_log` VALUES (294, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/system/dept/103', '127.0.0.1', '内网IP', '{deptId=103}', '{\"msg\":\"部门存在用户,不允许删除\",\"code\":500}', 0, NULL, '2022-10-15 13:14:15');
INSERT INTO `sys_oper_log` VALUES (295, '用户管理', 3, 'com.ruoyi.web.controller.system.SysUserController.remove()', 'DELETE', 1, 'admin', NULL, '/system/user/100,2', '127.0.0.1', '内网IP', '{userIds=100,2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-15 13:14:32');
INSERT INTO `sys_oper_log` VALUES (296, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":true,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2022-09-27 21:29:42\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":103,\"deptName\":\"研发部门\",\"leader\":\"若依\",\"orderNum\":1,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":103,\"email\":\"ry@163.com\",\"loginDate\":\"2022-10-15 13:01:30\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"若依\",\"params\":{},\"phonenumber\":\"15888888888\",\"postIds\":[1],\"remark\":\"管理员\",\"roleIds\":[1],\"roles\":[{\"admin\":true,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":1,\"roleKey\":\"admin\",\"roleName\":\"超级管理员\",\"roleSort\":\"1\",\"status\":\"0\"},{\"admin\":false,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":100,\"roleKey\":\"2\",\"roleName\":\"test\",\"roleSort\":\"3\",\"status\":\"0\"}],\"sex\":\"1\",\"status\":\"0\",\"userId\":1,\"userName\":\"admin\"}', NULL, 1, '不允许操作超级管理员用户', '2022-10-15 13:14:45');
INSERT INTO `sys_oper_log` VALUES (297, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/system/dept/105', '127.0.0.1', '内网IP', '{deptId=105}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-15 13:15:13');
INSERT INTO `sys_oper_log` VALUES (298, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0\",\"children\":[],\"deptId\":100,\"deptName\":\"ISIP科技\",\"email\":\"ry@qq.com\",\"leader\":\"若依\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-15 13:15:19');
INSERT INTO `sys_oper_log` VALUES (299, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100\",\"children\":[],\"deptId\":101,\"deptName\":\"立体仓库\",\"email\":\"ry@qq.com\",\"leader\":\"若依\",\"orderNum\":1,\"params\":{},\"parentId\":100,\"parentName\":\"ISIP科技\",\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-15 13:15:31');
INSERT INTO `sys_oper_log` VALUES (300, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":103,\"deptName\":\"研发部门\",\"email\":\"ry@qq.com\",\"leader\":\"若依\",\"orderNum\":1,\"params\":{},\"parentId\":101,\"parentName\":\"立体仓库\",\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-15 13:15:39');
INSERT INTO `sys_oper_log` VALUES (301, '角色管理', 3, 'com.ruoyi.web.controller.system.SysRoleController.remove()', 'DELETE', 1, 'admin', NULL, '/system/role/100', '127.0.0.1', '内网IP', '{roleIds=100}', NULL, 1, 'test已分配,不能删除', '2022-10-15 13:16:32');
INSERT INTO `sys_oper_log` VALUES (302, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":true,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2022-09-27 21:29:42\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":103,\"deptName\":\"研发部门\",\"leader\":\"若依\",\"orderNum\":1,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":103,\"email\":\"ry@163.com\",\"loginDate\":\"2022-10-15 13:01:30\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"若依\",\"params\":{},\"phonenumber\":\"15888888888\",\"postIds\":[1],\"remark\":\"管理员\",\"roleIds\":[1],\"roles\":[{\"admin\":true,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":1,\"roleKey\":\"admin\",\"roleName\":\"超级管理员\",\"roleSort\":\"1\",\"status\":\"0\"},{\"admin\":false,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":100,\"roleKey\":\"2\",\"roleName\":\"test\",\"roleSort\":\"3\",\"status\":\"0\"}],\"sex\":\"1\",\"status\":\"0\",\"userId\":1,\"userName\":\"admin\"}', NULL, 1, '不允许操作超级管理员用户', '2022-10-15 13:16:40');
INSERT INTO `sys_oper_log` VALUES (303, '用户管理', 3, 'com.ruoyi.web.controller.system.SysUserController.remove()', 'DELETE', 1, 'admin', NULL, '/system/user/1', '127.0.0.1', '内网IP', '{userIds=1}', '{\"msg\":\"当前用户不能删除\",\"code\":500}', 0, NULL, '2022-10-15 13:16:51');
INSERT INTO `sys_oper_log` VALUES (304, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100\",\"children\":[],\"deptId\":101,\"deptName\":\"App管理\",\"email\":\"ry@qq.com\",\"leader\":\"若依\",\"orderNum\":1,\"params\":{},\"parentId\":100,\"parentName\":\"ISIP科技\",\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-15 13:18:02');
INSERT INTO `sys_oper_log` VALUES (305, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":103,\"deptName\":\"立体仓库\",\"email\":\"ry@qq.com\",\"leader\":\"若依\",\"orderNum\":1,\"params\":{},\"parentId\":101,\"parentName\":\"App管理\",\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-15 13:18:12');
INSERT INTO `sys_oper_log` VALUES (306, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0\",\"children\":[],\"deptId\":100,\"deptName\":\"App管理\",\"email\":\"ry@qq.com\",\"leader\":\"若依\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-15 13:18:38');
INSERT INTO `sys_oper_log` VALUES (307, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0\",\"children\":[],\"deptId\":100,\"deptName\":\"ISIP科技\",\"email\":\"ry@qq.com\",\"leader\":\"若依\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-15 13:18:47');
INSERT INTO `sys_oper_log` VALUES (308, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100\",\"children\":[],\"deptId\":101,\"deptName\":\"西北区\",\"email\":\"ry@qq.com\",\"leader\":\"若依\",\"orderNum\":1,\"params\":{},\"parentId\":100,\"parentName\":\"ISIP科技\",\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-15 13:18:54');
INSERT INTO `sys_oper_log` VALUES (309, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/post/index\",\"createTime\":\"2022-09-27 21:29:42\",\"icon\":\"post\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":104,\"menuName\":\"岗位管理\",\"menuType\":\"C\",\"orderNum\":5,\"params\":{},\"parentId\":1,\"path\":\"post\",\"perms\":\"system:post:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-15 13:26:26');
INSERT INTO `sys_oper_log` VALUES (310, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '\"terminal\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-15 18:19:11');
INSERT INTO `sys_oper_log` VALUES (311, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', NULL, '/tool/gen/synchDb/terminal', '127.0.0.1', '内网IP', '{tableName=terminal}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-15 18:23:35');
INSERT INTO `sys_oper_log` VALUES (312, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/4', '127.0.0.1', '内网IP', '{tableIds=4}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-15 18:24:38');
INSERT INTO `sys_oper_log` VALUES (313, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '\"terminal\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-15 18:24:42');
INSERT INTO `sys_oper_log` VALUES (314, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', NULL, '/tool/gen/synchDb/terminal', '127.0.0.1', '内网IP', '{tableName=terminal}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-15 18:25:25');
INSERT INTO `sys_oper_log` VALUES (315, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/5', '127.0.0.1', '内网IP', '{tableIds=5}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-15 18:25:32');
INSERT INTO `sys_oper_log` VALUES (316, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '\"terminal\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-15 18:25:35');
INSERT INTO `sys_oper_log` VALUES (317, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '\"app\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-15 18:44:55');
INSERT INTO `sys_oper_log` VALUES (318, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"icon\":\"404\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"测试\",\"menuType\":\"M\",\"orderNum\":7,\"params\":{},\"parentId\":0,\"path\":\"test\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"新增菜单\'测试\'失败，菜单名称已存在\",\"code\":500}', 0, NULL, '2022-10-15 22:31:11');
INSERT INTO `sys_oper_log` VALUES (319, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"404\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"测试页面\",\"menuType\":\"M\",\"orderNum\":7,\"params\":{},\"parentId\":0,\"path\":\"test\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-15 22:31:20');
INSERT INTO `sys_oper_log` VALUES (320, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2081', '127.0.0.1', '内网IP', '{menuId=2081}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-15 22:31:25');
INSERT INTO `sys_oper_log` VALUES (321, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"appserver/termina/index\",\"createBy\":\"admin\",\"icon\":\"404\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"terminal\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2067,\"path\":\"terminal\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-15 22:31:59');
INSERT INTO `sys_oper_log` VALUES (322, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2022-09-29 16:14:47\",\"icon\":\"404\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2067,\"menuName\":\"测试\",\"menuType\":\"M\",\"orderNum\":7,\"params\":{},\"parentId\":0,\"path\":\"test\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-15 22:32:17');
INSERT INTO `sys_oper_log` VALUES (323, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"sys/user/index\",\"createTime\":\"2022-10-15 22:31:59\",\"icon\":\"404\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2082,\"menuName\":\"terminal\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2067,\"path\":\"terminal\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-15 22:35:18');
INSERT INTO `sys_oper_log` VALUES (324, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/user/index\",\"createTime\":\"2022-10-15 22:31:59\",\"icon\":\"404\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2082,\"menuName\":\"terminal\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2067,\"path\":\"terminal\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-15 22:35:47');
INSERT INTO `sys_oper_log` VALUES (325, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"appserver/app/index\",\"createTime\":\"2022-10-15 22:31:59\",\"icon\":\"404\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2082,\"menuName\":\"terminal\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2067,\"path\":\"terminal\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-15 22:49:21');
INSERT INTO `sys_oper_log` VALUES (326, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"appserver/app/index\",\"createTime\":\"2022-10-15 13:09:27\",\"icon\":\"404\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2080,\"menuName\":\"终端管理测试\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"terminaltest\",\"perms\":\"appserver:app:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-16 08:38:19');
INSERT INTO `sys_oper_log` VALUES (327, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"equ/terminaltest/index\",\"createTime\":\"2022-10-15 13:09:27\",\"icon\":\"404\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2080,\"menuName\":\"终端管理测试\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"terminaltest\",\"perms\":\"appserver:app:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-16 08:39:44');
INSERT INTO `sys_oper_log` VALUES (328, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"appserver/app/index\",\"createTime\":\"2022-10-15 13:09:27\",\"icon\":\"404\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2080,\"menuName\":\"终端管理测试\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"terminaltest\",\"perms\":\"appserver:app:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-16 08:40:20');
INSERT INTO `sys_oper_log` VALUES (329, '部门管理', 1, 'com.ruoyi.system.controller.AppController.add()', 'POST', 1, 'admin', NULL, '/appserver/app', '127.0.0.1', '内网IP', '{\"appEui\":\"1\",\"appName\":\"1\",\"children\":[],\"company\":\"1\",\"orderNum\":1,\"params\":{},\"phone\":\"13333333333\",\"status\":\"0\",\"timeto\":\"2022-10-09 00:00:00\"}', NULL, 1, '', '2022-10-16 08:44:48');
INSERT INTO `sys_oper_log` VALUES (330, '部门管理', 1, 'com.ruoyi.system.controller.AppController.add()', 'POST', 1, 'admin', NULL, '/appserver/app', '127.0.0.1', '内网IP', '{\"appEui\":\"1\",\"appName\":\"1\",\"children\":[],\"company\":\"1\",\"orderNum\":1,\"params\":{},\"phone\":\"13333333333\",\"status\":\"0\",\"timeto\":\"2022-10-09 00:00:00\"}', NULL, 1, '', '2022-10-16 08:44:56');
INSERT INTO `sys_oper_log` VALUES (331, '部门管理', 1, 'com.ruoyi.system.controller.AppController.add()', 'POST', 1, 'admin', NULL, '/appserver/app', '127.0.0.1', '内网IP', '{\"appEui\":\"123\",\"appName\":\"123\",\"children\":[],\"company\":\"123\",\"orderNum\":1,\"params\":{},\"phone\":\"13333333333\",\"status\":\"0\",\"timeto\":\"2022-10-09 00:00:00\"}', NULL, 1, '', '2022-10-16 08:50:55');
INSERT INTO `sys_oper_log` VALUES (332, '部门管理', 1, 'com.ruoyi.system.controller.AppController.add()', 'POST', 1, 'admin', NULL, '/appserver/app', '127.0.0.1', '内网IP', '{\"appEui\":\"123\",\"appName\":\"123\",\"children\":[],\"company\":\"123\",\"orderNum\":1,\"params\":{},\"phone\":\"13333333333\",\"status\":\"0\",\"timeto\":\"2022-10-10 00:00:00\"}', NULL, 1, '', '2022-10-16 08:53:58');
INSERT INTO `sys_oper_log` VALUES (333, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"appserver/terminal/index\",\"createTime\":\"2022-10-15 13:09:27\",\"icon\":\"404\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2080,\"menuName\":\"终端管理测试\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"terminaltest\",\"perms\":\"appserver:app:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-16 08:56:49');
INSERT INTO `sys_oper_log` VALUES (334, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"appserver/app/index\",\"createTime\":\"2022-10-15 13:09:27\",\"icon\":\"404\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2080,\"menuName\":\"终端管理测试\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"terminaltest\",\"perms\":\"appserver:app:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-16 09:16:25');
INSERT INTO `sys_oper_log` VALUES (335, '部门管理', 1, 'com.ruoyi.system.controller.AppController.add()', 'POST', 1, 'admin', NULL, '/appserver/app', '127.0.0.1', '内网IP', '{\"appEui\":\"1234\",\"appName\":\"123\",\"children\":[],\"company\":\"24\",\"orderNum\":2,\"params\":{},\"phone\":\"13333333333\",\"status\":\"0\",\"timeto\":\"2022-10-04 00:00:00\"}', NULL, 1, '', '2022-10-16 09:16:50');
INSERT INTO `sys_oper_log` VALUES (336, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"equ/terminalManagement/index\",\"createTime\":\"2022-10-15 13:09:27\",\"icon\":\"404\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2080,\"menuName\":\"终端管理测试\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"terminaltest\",\"perms\":\"appserver:app:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-16 09:18:01');
INSERT INTO `sys_oper_log` VALUES (337, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"equ/terminal/index\",\"createTime\":\"2022-10-15 13:09:27\",\"icon\":\"404\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2080,\"menuName\":\"终端管理测试\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"terminaltest\",\"perms\":\"appserver:app:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-16 09:18:51');
INSERT INTO `sys_oper_log` VALUES (338, '终端 ', 1, 'com.ruoyi.system.controller.LoraTerminalController.add()', 'POST', 1, 'admin', NULL, '/equ/terminal', '127.0.0.1', '内网IP', '{\"appId\":123,\"params\":{},\"terminalEui\":\"123\",\"terminalId\":82,\"terminalType\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-16 09:19:03');
INSERT INTO `sys_oper_log` VALUES (339, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"appserver/app/index\",\"createTime\":\"2022-10-15 13:09:27\",\"icon\":\"404\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2080,\"menuName\":\"终端管理测试\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"terminaltest\",\"perms\":\"appserver:app:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-16 09:19:32');
INSERT INTO `sys_oper_log` VALUES (340, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"appserver/terminal/index\",\"createTime\":\"2022-10-15 13:09:27\",\"icon\":\"404\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2080,\"menuName\":\"终端管理测试\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"terminaltest\",\"perms\":\"appserver:app:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-16 09:32:18');
INSERT INTO `sys_oper_log` VALUES (341, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"appserver/app/index\",\"createTime\":\"2022-10-15 13:09:27\",\"icon\":\"404\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2080,\"menuName\":\"终端管理测试\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"terminaltest\",\"perms\":\"appserver:app:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-16 10:12:38');
INSERT INTO `sys_oper_log` VALUES (342, '应用管理', 1, 'com.ruoyi.system.controller.AppController.add()', 'POST', 1, 'admin', NULL, '/appserver/app', '127.0.0.1', '内网IP', '{\"ancestors\":\",25\",\"appEui\":\"123\",\"appName\":\"123\",\"children\":[],\"company\":\"123\",\"leader\":\"123\",\"orderNum\":1,\"params\":{},\"parentId\":25,\"phone\":\"13333333333\",\"status\":\"0\",\"timeto\":\"2022-10-10 00:00:00\"}', NULL, 1, 'nested exception is org.apache.ibatis.reflection.ReflectionException: There is no getter for property named \'deptId\' in \'class com.ruoyi.system.domain.App\'', '2022-10-16 11:04:01');
INSERT INTO `sys_oper_log` VALUES (343, '应用管理', 1, 'com.ruoyi.system.controller.AppController.add()', 'POST', 1, 'admin', NULL, '/appserver/app', '127.0.0.1', '内网IP', '{\"ancestors\":\",25\",\"appEui\":\"123\",\"appName\":\"123\",\"children\":[],\"company\":\"123\",\"leader\":\"123\",\"orderNum\":1,\"params\":{},\"parentId\":25,\"phone\":\"13333333333\",\"status\":\"0\",\"timeto\":\"2022-10-10 00:00:00\"}', NULL, 1, 'nested exception is org.apache.ibatis.reflection.ReflectionException: There is no getter for property named \'deptId\' in \'class com.ruoyi.system.domain.App\'', '2022-10-16 11:04:28');
INSERT INTO `sys_oper_log` VALUES (344, '应用管理', 1, 'com.ruoyi.system.controller.AppController.add()', 'POST', 1, 'admin', NULL, '/appserver/app', '127.0.0.1', '内网IP', '{\"ancestors\":\",25\",\"appEui\":\"123\",\"appName\":\"123\",\"children\":[],\"company\":\"123\",\"leader\":\"123\",\"orderNum\":1,\"params\":{},\"parentId\":25,\"phone\":\"13333333333\",\"status\":\"0\",\"timeto\":\"2022-10-10 00:00:00\"}', NULL, 1, 'nested exception is org.apache.ibatis.reflection.ReflectionException: There is no getter for property named \'deptId\' in \'class com.ruoyi.system.domain.App\'', '2022-10-16 11:04:54');
INSERT INTO `sys_oper_log` VALUES (345, '应用管理', 1, 'com.ruoyi.system.controller.AppController.add()', 'POST', 1, 'admin', NULL, '/appserver/app', '127.0.0.1', '内网IP', '{\"ancestors\":\",26\",\"appEui\":\"123\",\"appName\":\"123\",\"children\":[],\"company\":\"123\",\"leader\":\"123\",\"orderNum\":1,\"params\":{},\"parentId\":26,\"phone\":\"13333333333\",\"status\":\"0\",\"timeto\":\"2022-10-09 00:00:00\"}', NULL, 1, 'nested exception is org.apache.ibatis.reflection.ReflectionException: There is no getter for property named \'deptId\' in \'class com.ruoyi.system.domain.App\'', '2022-10-16 11:07:37');
INSERT INTO `sys_oper_log` VALUES (346, '应用管理', 1, 'com.ruoyi.system.controller.AppController.add()', 'POST', 1, 'admin', NULL, '/appserver/app', '127.0.0.1', '内网IP', '{\"ancestors\":\",26\",\"appEui\":\"123\",\"appName\":\"123\",\"children\":[],\"company\":\"123\",\"leader\":\"123\",\"orderNum\":1,\"params\":{},\"parentId\":26,\"phone\":\"13333333333\",\"status\":\"0\",\"timeto\":\"2022-10-09 00:00:00\"}', NULL, 1, 'nested exception is org.apache.ibatis.reflection.ReflectionException: There is no getter for property named \'deptId\' in \'class com.ruoyi.system.domain.App\'', '2022-10-16 11:11:40');
INSERT INTO `sys_oper_log` VALUES (347, '应用管理', 1, 'com.ruoyi.system.controller.AppController.add()', 'POST', 1, 'admin', NULL, '/appserver/app', '127.0.0.1', '内网IP', '{\"ancestors\":\",26\",\"appEui\":\"123\",\"appName\":\"123\",\"children\":[],\"company\":\"123\",\"leader\":\"123\",\"orderNum\":3,\"params\":{},\"parentId\":26,\"phone\":\"13333333333\",\"status\":\"0\",\"timeto\":\"2022-10-02 00:00:00\"}', NULL, 1, 'nested exception is org.apache.ibatis.reflection.ReflectionException: There is no getter for property named \'deptId\' in \'class com.ruoyi.system.domain.App\'', '2022-10-16 11:12:03');
INSERT INTO `sys_oper_log` VALUES (348, '应用管理', 1, 'com.ruoyi.system.controller.AppController.add()', 'POST', 1, 'admin', NULL, '/appserver/app', '127.0.0.1', '内网IP', '{\"ancestors\":\",26\",\"appEui\":\"123\",\"appName\":\"123\",\"children\":[],\"company\":\"123\",\"leader\":\"123\",\"orderNum\":3,\"params\":{},\"parentId\":26,\"phone\":\"13333333333\",\"status\":\"0\",\"timeto\":\"2022-10-02 00:00:00\"}', NULL, 1, 'nested exception is org.apache.ibatis.reflection.ReflectionException: There is no getter for property named \'deptId\' in \'class com.ruoyi.system.domain.App\'', '2022-10-16 11:12:05');
INSERT INTO `sys_oper_log` VALUES (349, '应用管理', 1, 'com.ruoyi.system.controller.AppController.add()', 'POST', 1, 'admin', NULL, '/appserver/app', '127.0.0.1', '内网IP', '{\"ancestors\":\",26\",\"appEui\":\"123\",\"appName\":\"123\",\"children\":[],\"company\":\"123\",\"leader\":\"123\",\"orderNum\":3,\"params\":{},\"parentId\":26,\"phone\":\"13333333333\",\"status\":\"0\",\"timeto\":\"2022-10-02 00:00:00\"}', NULL, 1, 'nested exception is org.apache.ibatis.reflection.ReflectionException: There is no getter for property named \'deptId\' in \'class com.ruoyi.system.domain.App\'', '2022-10-16 11:12:06');
INSERT INTO `sys_oper_log` VALUES (350, '应用管理', 1, 'com.ruoyi.system.controller.AppController.add()', 'POST', 1, 'admin', NULL, '/appserver/app', '127.0.0.1', '内网IP', '{\"ancestors\":\",26\",\"appEui\":\"132\",\"appName\":\"123\",\"children\":[],\"company\":\"123\",\"leader\":\"123\",\"orderNum\":1,\"params\":{},\"parentId\":26,\"phone\":\"13333333333\",\"status\":\"0\",\"timeto\":\"2022-10-09 00:00:00\"}', NULL, 1, 'nested exception is org.apache.ibatis.reflection.ReflectionException: There is no getter for property named \'deptId\' in \'class com.ruoyi.system.domain.App\'', '2022-10-16 11:13:06');
INSERT INTO `sys_oper_log` VALUES (351, '应用管理', 1, 'com.ruoyi.system.controller.AppController.add()', 'POST', 1, 'admin', NULL, '/appserver/app', '127.0.0.1', '内网IP', '{\"ancestors\":\",26\",\"appEui\":\"132\",\"appName\":\"123\",\"children\":[],\"company\":\"123\",\"leader\":\"123\",\"orderNum\":1,\"params\":{},\"parentId\":26,\"phone\":\"13333333333\",\"status\":\"0\",\"timeto\":\"2022-10-09 00:00:00\"}', NULL, 1, 'nested exception is org.apache.ibatis.reflection.ReflectionException: There is no getter for property named \'deptId\' in \'class com.ruoyi.system.domain.App\'', '2022-10-16 11:13:10');
INSERT INTO `sys_oper_log` VALUES (352, '应用管理', 1, 'com.ruoyi.system.controller.AppController.add()', 'POST', 1, 'admin', NULL, '/appserver/app', '127.0.0.1', '内网IP', '{\"ancestors\":\",26\",\"appEui\":\"132\",\"appName\":\"123\",\"children\":[],\"company\":\"123\",\"leader\":\"123\",\"orderNum\":1,\"params\":{},\"parentId\":26,\"phone\":\"13333333333\",\"status\":\"0\",\"timeto\":\"2022-10-09 00:00:00\"}', NULL, 1, 'nested exception is org.apache.ibatis.reflection.ReflectionException: There is no getter for property named \'deptId\' in \'class com.ruoyi.system.domain.App\'', '2022-10-16 11:13:12');
INSERT INTO `sys_oper_log` VALUES (353, '应用管理', 1, 'com.ruoyi.system.controller.AppController.add()', 'POST', 1, 'admin', NULL, '/appserver/app', '127.0.0.1', '内网IP', '{\"ancestors\":\",26\",\"appEui\":\"132\",\"appName\":\"123\",\"children\":[],\"company\":\"123\",\"leader\":\"123\",\"orderNum\":1,\"params\":{},\"parentId\":26,\"phone\":\"13333333333\",\"status\":\"0\",\"timeto\":\"2022-10-09 00:00:00\"}', NULL, 1, 'nested exception is org.apache.ibatis.reflection.ReflectionException: There is no getter for property named \'deptId\' in \'class com.ruoyi.system.domain.App\'', '2022-10-16 11:13:13');
INSERT INTO `sys_oper_log` VALUES (354, '应用管理', 1, 'com.ruoyi.system.controller.AppController.add()', 'POST', 1, 'admin', NULL, '/appserver/app', '127.0.0.1', '内网IP', '{\"ancestors\":\",25\",\"appEui\":\"123\",\"appName\":\"123\",\"children\":[],\"company\":\"123\",\"leader\":\"123\",\"orderNum\":1,\"params\":{},\"parentId\":25,\"phone\":\"13333333333\",\"status\":\"0\",\"timeto\":\"2022-10-02 00:00:00\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'create_time\' in \'field list\'\r\n### The error may exist in file [F:\\appserver\\appserver-system\\target\\classes\\mapper\\system\\AppMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.AppMapper.insertApp-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into app(        parent_id,     ancestors,     app_eui,         app_name,     company,     leader,     phone,     status,     timeto,             order_num,              create_time    )values(        ?,     ?,     ?,         ?,     ?,     ?,     ?,     ?,     ?,             ?,              sysdate()    )\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'create_time\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'create_time\' in \'field list\'', '2022-10-16 11:14:28');
INSERT INTO `sys_oper_log` VALUES (355, '应用管理', 1, 'com.ruoyi.system.controller.AppController.add()', 'POST', 1, 'admin', NULL, '/appserver/app', '127.0.0.1', '内网IP', '{\"ancestors\":\",25\",\"appEui\":\"123\",\"appName\":\"123\",\"children\":[],\"company\":\"123\",\"leader\":\"123\",\"orderNum\":1,\"params\":{},\"parentId\":25,\"phone\":\"13333333333\",\"status\":\"0\",\"timeto\":\"2022-10-02 00:00:00\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')values(\n		 \n		 25, \n		 \',25\', \n		 \'123\', \n		 \n		 \'123\', \n		 \'123\', \n		 \'123\', \n\' at line 19\r\n### The error may exist in file [F:\\appserver\\appserver-system\\target\\classes\\mapper\\system\\AppMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.AppMapper.insertApp-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into app(        parent_id,     ancestors,     app_eui,         app_name,     company,     leader,     phone,     status,     timeto,             order_num,                 )values(        ?,     ?,     ?,         ?,     ?,     ?,     ?,     ?,     ?,             ?,              sysdate()    )\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')values(\n		 \n		 25, \n		 \',25\', \n		 \'123\', \n		 \n		 \'123\', \n		 \'123\', \n		 \'123\', \n\' at line 19\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')values(\n		 \n		 25, \n		 \',25\', \n		 \'123\', \n		 \n		 \'123\', \n		 \'123\', \n		 \'123\', \n\' at line 19', '2022-10-16 11:15:34');
INSERT INTO `sys_oper_log` VALUES (356, '应用管理', 1, 'com.ruoyi.system.controller.AppController.add()', 'POST', 1, 'admin', NULL, '/appserver/app', '127.0.0.1', '内网IP', '{\"ancestors\":\",25\",\"appEui\":\"123\",\"appName\":\"123\",\"children\":[],\"company\":\"123\",\"leader\":\"123\",\"orderNum\":1,\"params\":{},\"parentId\":25,\"phone\":\"13333333333\",\"status\":\"0\",\"timeto\":\"2022-10-02 00:00:00\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')values(\n		 \n		 25, \n		 \',25\', \n		 \'123\', \n		 \n		 \'123\', \n		 \'123\', \n		 \'123\', \n\' at line 19\r\n### The error may exist in file [F:\\appserver\\appserver-system\\target\\classes\\mapper\\system\\AppMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.AppMapper.insertApp-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into app(        parent_id,     ancestors,     app_eui,         app_name,     company,     leader,     phone,     status,     timeto,             order_num,                 )values(        ?,     ?,     ?,         ?,     ?,     ?,     ?,     ?,     ?,             ?,              sysdate()    )\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')values(\n		 \n		 25, \n		 \',25\', \n		 \'123\', \n		 \n		 \'123\', \n		 \'123\', \n		 \'123\', \n\' at line 19\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')values(\n		 \n		 25, \n		 \',25\', \n		 \'123\', \n		 \n		 \'123\', \n		 \'123\', \n		 \'123\', \n\' at line 19', '2022-10-16 11:15:53');
INSERT INTO `sys_oper_log` VALUES (357, '应用管理', 1, 'com.ruoyi.system.controller.AppController.add()', 'POST', 1, 'admin', NULL, '/appserver/app', '127.0.0.1', '内网IP', '{\"ancestors\":\",25\",\"appEui\":\"123\",\"appName\":\"123\",\"children\":[],\"company\":\"123\",\"leader\":\"123\",\"orderNum\":1,\"params\":{},\"parentId\":25,\"phone\":\"13333333333\",\"status\":\"0\",\"timeto\":\"2022-10-03 00:00:00\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')values(\n		 \n		 25, \n		 \',25\', \n		 \'123\', \n		 \n		 \'123\', \n		 \'123\', \n		 \'123\', \n\' at line 19\r\n### The error may exist in file [F:\\appserver\\appserver-system\\target\\classes\\mapper\\system\\AppMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.AppMapper.insertApp-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into app(        parent_id,     ancestors,     app_eui,         app_name,     company,     leader,     phone,     status,     timeto,             order_num,              )values(        ?,     ?,     ?,         ?,     ?,     ?,     ?,     ?,     ?,             ?,                 )\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')values(\n		 \n		 25, \n		 \',25\', \n		 \'123\', \n		 \n		 \'123\', \n		 \'123\', \n		 \'123\', \n\' at line 19\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')values(\n		 \n		 25, \n		 \',25\', \n		 \'123\', \n		 \n		 \'123\', \n		 \'123\', \n		 \'123\', \n\' at line 19', '2022-10-16 11:17:38');
INSERT INTO `sys_oper_log` VALUES (358, '应用管理', 1, 'com.ruoyi.system.controller.AppController.add()', 'POST', 1, 'admin', NULL, '/appserver/app', '127.0.0.1', '内网IP', '{\"ancestors\":\",1\",\"appEui\":\"123\",\"appName\":\"123\",\"children\":[],\"company\":\"123\",\"leader\":\"123\",\"orderNum\":1,\"params\":{},\"parentId\":1,\"phone\":\"13333333333\",\"status\":\"0\",\"timeto\":\"2022-10-02 00:00:00\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')values(\n		 1, \n		 \',1\', \n		 \'123\', \n		 \n		 \'123\', \n		 \'123\', \n		 \'123\', \n		 \'13\' at line 18\r\n### The error may exist in file [F:\\appserver\\appserver-system\\target\\classes\\mapper\\system\\AppMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.AppMapper.insertApp-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into app(    parent_id,     ancestors,     app_eui,         app_name,     company,     leader,     phone,     status,     timeto,             order_num,              )values(    ?,     ?,     ?,         ?,     ?,     ?,     ?,     ?,     ?,             ?,              sysdate()    )\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')values(\n		 1, \n		 \',1\', \n		 \'123\', \n		 \n		 \'123\', \n		 \'123\', \n		 \'123\', \n		 \'13\' at line 18\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')values(\n		 1, \n		 \',1\', \n		 \'123\', \n		 \n		 \'123\', \n		 \'123\', \n		 \'123\', \n		 \'13\' at line 18', '2022-10-16 11:20:57');
INSERT INTO `sys_oper_log` VALUES (359, '应用管理', 1, 'com.ruoyi.system.controller.AppController.add()', 'POST', 1, 'admin', NULL, '/appserver/app', '127.0.0.1', '内网IP', '{\"ancestors\":\",1\",\"appEui\":\"1235\",\"appName\":\"124\",\"children\":[],\"company\":\"135\",\"leader\":\"13\",\"orderNum\":1,\"params\":{},\"parentId\":1,\"phone\":\"13333333333\",\"status\":\"0\",\"timeto\":\"2022-10-11 00:00:00\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')values(\n		 1, \n		 \',1\', \n		 \'1235\', \n\n		 \'124\', \n		 \'135\', \n		 \'13\', \n		 \'13333\' at line 18\r\n### The error may exist in file [F:\\appserver\\appserver-system\\target\\classes\\mapper\\system\\AppMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.AppMapper.insertApp-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into app(    parent_id,     ancestors,     app_eui,      app_name,     company,     leader,     phone,     status,     timeto,       order_num,        )values(    ?,     ?,     ?,      ?,     ?,     ?,     ?,     ?,     ?,       ?,        sysdate()    )\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')values(\n		 1, \n		 \',1\', \n		 \'1235\', \n\n		 \'124\', \n		 \'135\', \n		 \'13\', \n		 \'13333\' at line 18\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')values(\n		 1, \n		 \',1\', \n		 \'1235\', \n\n		 \'124\', \n		 \'135\', \n		 \'13\', \n		 \'13333\' at line 18', '2022-10-16 11:24:03');
INSERT INTO `sys_oper_log` VALUES (360, '应用管理', 1, 'com.ruoyi.system.controller.AppController.add()', 'POST', 1, 'admin', NULL, '/appserver/app', '127.0.0.1', '内网IP', '{\"ancestors\":\",1\",\"appEui\":\"1234\",\"appName\":\"123\",\"children\":[],\"company\":\"12345\",\"leader\":\"12356\",\"orderNum\":1,\"params\":{},\"parentId\":1,\"phone\":\"13333333333\",\"status\":\"0\",\"timeto\":\"2022-10-03 00:00:00\"}', NULL, 1, 'nested exception is org.apache.ibatis.reflection.ReflectionException: There is no getter for property named \'managerId\' in \'class com.ruoyi.system.domain.App\'', '2022-10-16 11:27:43');
INSERT INTO `sys_oper_log` VALUES (361, '应用管理', 1, 'com.ruoyi.system.controller.AppController.add()', 'POST', 1, 'admin', NULL, '/appserver/app', '127.0.0.1', '内网IP', '{\"ancestors\":\",1\",\"appEui\":\"1234\",\"appName\":\"123\",\"children\":[],\"company\":\"12345\",\"leader\":\"123456\",\"orderNum\":1,\"params\":{},\"parentId\":1,\"phone\":\"13333333333\",\"status\":\"0\",\"timeto\":\"2022-10-03 00:00:00\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')values(\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n		 \'1234\', \n		 \n		 \'123\', \n		 \n\n		 \'123456\', \n		 \'2022\' at line 27\r\n### The error may exist in file [F:\\appserver\\appserver-system\\target\\classes\\mapper\\system\\AppMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.AppMapper.insertApp-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into app(                   app_eui,         app_name,         leader,     timeto,     status,         company,     phone,     )values(                     ?,         ?,          ?,     ?,     ?,         ?,     ?,\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')values(\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n		 \'1234\', \n		 \n		 \'123\', \n		 \n\n		 \'123456\', \n		 \'2022\' at line 27\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')values(\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n		 \'1234\', \n		 \n		 \'123\', \n		 \n\n		 \'123456\', \n		 \'2022\' at line 27', '2022-10-16 11:29:47');
INSERT INTO `sys_oper_log` VALUES (362, '应用管理', 1, 'com.ruoyi.system.controller.AppController.add()', 'POST', 1, 'admin', NULL, '/appserver/app', '127.0.0.1', '内网IP', '{\"ancestors\":\",1\",\"appEui\":\"1234\",\"appName\":\"123\",\"children\":[],\"company\":\"12345\",\"leader\":\"123456\",\"orderNum\":1,\"params\":{},\"parentId\":1,\"phone\":\"13333333333\",\"status\":\"0\",\"timeto\":\"2022-10-02 00:00:00\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'leader\' in \'field list\'\r\n### The error may exist in file [F:\\appserver\\appserver-system\\target\\classes\\mapper\\system\\AppMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.AppMapper.insertApp-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into lora_app    ( app_eui,    app_name,    leader,    timeto,    status,    company,    phone )     values ( ?,    ?,    ?,    ?,    ?,    ?,    ? )\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'leader\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'leader\' in \'field list\'', '2022-10-16 11:35:24');
INSERT INTO `sys_oper_log` VALUES (363, '应用管理', 1, 'com.ruoyi.system.controller.AppController.add()', 'POST', 1, 'admin', NULL, '/appserver/app', '127.0.0.1', '内网IP', '{\"ancestors\":\",1\",\"appEui\":\"1234\",\"appName\":\"123\",\"children\":[],\"company\":\"12345\",\"leader\":\"123456\",\"orderNum\":1,\"params\":{},\"parentId\":1,\"phone\":\"13333333333\",\"status\":\"0\",\"timeto\":\"2022-10-02 00:00:00\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'leader\' in \'field list\'\r\n### The error may exist in file [F:\\appserver\\appserver-system\\target\\classes\\mapper\\system\\AppMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.AppMapper.insertApp-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into lora_app    ( app_eui,    app_name,    leader,    timeto,    status,    company,    phone )     values ( ?,    ?,    ?,    ?,    ?,    ?,    ? )\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'leader\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'leader\' in \'field list\'', '2022-10-16 11:35:29');
INSERT INTO `sys_oper_log` VALUES (364, '应用管理', 1, 'com.ruoyi.system.controller.AppController.add()', 'POST', 1, 'admin', NULL, '/appserver/app', '127.0.0.1', '内网IP', '{\"ancestors\":\",1\",\"appEui\":\"1234\",\"appId\":29,\"appName\":\"123\",\"children\":[],\"company\":\"12345\",\"leader\":\"123456\",\"orderNum\":1,\"params\":{},\"parentId\":1,\"phone\":\"13333333333\",\"status\":\"0\",\"timeto\":\"2022-10-02 00:00:00\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-16 11:39:51');
INSERT INTO `sys_oper_log` VALUES (365, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"appserver/terminal/index\",\"createTime\":\"2022-10-15 13:09:27\",\"icon\":\"404\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2080,\"menuName\":\"终端管理测试\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"terminaltest\",\"perms\":\"appserver:app:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-16 11:40:35');
INSERT INTO `sys_oper_log` VALUES (366, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"appserver/terminal/index\",\"createTime\":\"2022-10-15 13:09:27\",\"icon\":\"404\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2080,\"menuName\":\"终端管理测试\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"terminaltest\",\"perms\":\"appserver:terminal:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-16 11:40:42');
INSERT INTO `sys_oper_log` VALUES (367, '终端管理', 3, 'com.ruoyi.system.controller.TerminalController.remove()', 'DELETE', 1, 'admin', NULL, '/appserver/terminal/5', '127.0.0.1', '内网IP', '{terminalIds=5}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-16 18:02:57');
INSERT INTO `sys_oper_log` VALUES (368, '终端管理', 3, 'com.ruoyi.system.controller.TerminalController.remove()', 'DELETE', 1, 'admin', NULL, '/appserver/terminal/17,16,15', '127.0.0.1', '内网IP', '{terminalIds=17,16,15}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-16 18:03:02');
INSERT INTO `sys_oper_log` VALUES (369, '终端管理', 3, 'com.ruoyi.system.controller.TerminalController.remove()', 'DELETE', 1, 'admin', NULL, '/appserver/terminal/12', '127.0.0.1', '内网IP', '{terminalIds=12}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-16 18:03:13');
INSERT INTO `sys_oper_log` VALUES (370, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"appserver/app/index\",\"createTime\":\"2022-10-15 13:09:27\",\"icon\":\"404\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2080,\"menuName\":\"终端管理测试\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"terminaltest\",\"perms\":\"appserver:terminal:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-16 18:12:49');
INSERT INTO `sys_oper_log` VALUES (371, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"appserver/terminal/index\",\"icon\":\"button\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"终端管理测试\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":0,\"path\":\"terminaltest\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"新增菜单\'终端管理测试\'失败，菜单名称已存在\",\"code\":500}', 0, NULL, '2022-10-16 18:13:18');
INSERT INTO `sys_oper_log` VALUES (372, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"appserver/app/index\",\"createBy\":\"admin\",\"icon\":\"button\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"app管理测试\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":0,\"path\":\"terminaltest\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-16 18:13:31');
INSERT INTO `sys_oper_log` VALUES (373, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"appserver/terminal/index\",\"createTime\":\"2022-10-15 13:09:27\",\"icon\":\"404\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2080,\"menuName\":\"终端管理测试\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"terminaltest\",\"perms\":\"appserver:terminal:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-16 18:13:39');
INSERT INTO `sys_oper_log` VALUES (374, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"appserver/app/index\",\"createTime\":\"2022-10-16 18:13:30\",\"icon\":\"button\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2083,\"menuName\":\"app管理测试\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":0,\"path\":\"appterminaltest\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-16 18:13:46');
INSERT INTO `sys_oper_log` VALUES (375, '应用', 3, 'com.ruoyi.system.controller.LoraAppController.remove()', 'DELETE', 1, 'admin', NULL, '/app/appManagement/25,26,27,28', '127.0.0.1', '内网IP', '{appIds=25,26,27,28}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-16 20:02:46');
INSERT INTO `sys_oper_log` VALUES (376, '终端管理', 3, 'com.ruoyi.system.controller.TerminalController.remove()', 'DELETE', 1, 'admin', NULL, '/appserver/terminal/5', '127.0.0.1', '内网IP', '{terminalIds=5}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-16 22:11:16');
INSERT INTO `sys_oper_log` VALUES (377, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"apptestManagement\",\"className\":\"LoratestApp\",\"columns\":[{\"capJavaField\":\"AppId\",\"columnComment\":\"应用id\",\"columnId\":1,\"columnName\":\"app_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2022-09-27 21:38:13\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"appId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2022-10-08 09:11:51\",\"usableColumn\":false},{\"capJavaField\":\"AppEui\",\"columnComment\":\"\",\"columnId\":2,\"columnName\":\"app_eui\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2022-09-27 21:38:13\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"appEui\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2022-10-08 09:11:51\",\"usableColumn\":false},{\"capJavaField\":\"AppSecret\",\"columnComment\":\"\",\"columnId\":3,\"columnName\":\"app_secret\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2022-09-27 21:38:13\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"appSecret\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2022-10-08 09:11:51\",\"usableColumn\":false},{\"capJavaField\":\"AppName\",\"columnComment\":\"应用名称\",\"columnId\":4,\"columnName\":\"app_name\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2022-09-27 21:38:13\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"i', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-17 10:14:16');
INSERT INTO `sys_oper_log` VALUES (378, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"app\",\"className\":\"App\",\"columns\":[{\"capJavaField\":\"AppId\",\"columnComment\":\"应用id\",\"columnId\":100,\"columnName\":\"app_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2022-10-15 18:44:55\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"appId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ParentId\",\"columnComment\":\"父应用id\",\"columnId\":101,\"columnName\":\"parent_id\",\"columnType\":\"varchar(11)\",\"createBy\":\"admin\",\"createTime\":\"2022-10-15 18:44:55\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"parentId\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":true,\"tableId\":7,\"updateBy\":\"\",\"usableColumn\":true},{\"capJavaField\":\"Ancestors\",\"columnComment\":\"app祖级列表\",\"columnId\":102,\"columnName\":\"ancestors\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2022-10-15 18:44:55\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"ancestors\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":true,\"tableId\":7,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"AppEui\",\"columnComment\":\"appEui\",\"columnId\":103,\"columnName\":\"app_eui\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2022-10-15 18:44:55\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"appEui\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-17 10:15:35');
INSERT INTO `sys_oper_log` VALUES (379, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"appserver/terminal/index\",\"createTime\":\"2022-10-15 13:09:27\",\"icon\":\"404\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2080,\"menuName\":\"终端管理测试\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2067,\"path\":\"terminaltest\",\"perms\":\"appserver:terminal:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-17 10:43:11');
INSERT INTO `sys_oper_log` VALUES (380, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"appserver/app/index\",\"createTime\":\"2022-10-16 18:13:30\",\"icon\":\"button\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2083,\"menuName\":\"app管理测试\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2067,\"path\":\"appterminaltest\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-17 10:43:18');
INSERT INTO `sys_oper_log` VALUES (381, '部门管理', 1, 'com.ruoyi.web.controller.system.SysDeptController.add()', 'POST', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100,101\",\"children\":[],\"createBy\":\"admin\",\"deptName\":\"123\",\"email\":\"9123@qq.com\",\"leader\":\"123\",\"orderNum\":2,\"params\":{},\"parentId\":101,\"phone\":\"13333333333\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-18 15:26:47');
INSERT INTO `sys_oper_log` VALUES (382, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/dict/index\",\"createTime\":\"2022-09-27 21:29:42\",\"icon\":\"dict\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":105,\"menuName\":\"字典管理\",\"menuType\":\"C\",\"orderNum\":6,\"params\":{},\"parentId\":1,\"path\":\"dict\",\"perms\":\"system:dict:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-18 15:28:55');
INSERT INTO `sys_oper_log` VALUES (383, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', NULL, '/tool/gen/synchDb/lora_app', '127.0.0.1', '内网IP', '{tableName=lora_app}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-22 13:47:14');
INSERT INTO `sys_oper_log` VALUES (384, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/1,2,3,6,7', '127.0.0.1', '内网IP', '{tableIds=1,2,3,6,7}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-22 13:47:34');
INSERT INTO `sys_oper_log` VALUES (385, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '\"lora_app\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-22 13:47:38');
INSERT INTO `sys_oper_log` VALUES (386, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/system/dept/200', '127.0.0.1', '内网IP', '{deptId=200}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-22 14:15:07');
INSERT INTO `sys_oper_log` VALUES (387, '应用', 2, 'com.ruoyi.system.controller.LoraAppController.edit()', 'PUT', 1, 'admin', NULL, '/app/appManagement', '127.0.0.1', '内网IP', '{\"appEui\":\"12345\",\"appId\":1,\"appName\":\"立体仓库\",\"authState\":\"0\",\"company\":\"陕西省XX公司\",\"managerId\":1,\"managerName\":\"Tony\",\"params\":{},\"phone\":\"13333333333\",\"timeto\":\"2023-05-01 00:00:00\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-22 14:36:50');
INSERT INTO `sys_oper_log` VALUES (388, '应用', 1, 'com.ruoyi.system.controller.LoraAppController.add()', 'POST', 1, 'admin', NULL, '/app/appManagement', '127.0.0.1', '内网IP', '{\"appEui\":\"2\",\"appId\":29,\"appName\":\"2\",\"company\":\"2\",\"managerName\":\"2\",\"params\":{},\"phone\":\"13333333333\",\"timeto\":\"2022-10-03 00:00:00\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-22 14:44:10');
INSERT INTO `sys_oper_log` VALUES (389, '应用', 3, 'com.ruoyi.system.controller.LoraAppController.remove()', 'DELETE', 1, 'admin', NULL, '/app/appManagement/29', '127.0.0.1', '内网IP', '{appIds=29}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-22 14:45:04');
INSERT INTO `sys_oper_log` VALUES (390, '终端 ', 2, 'com.ruoyi.system.controller.LoraTerminalController.edit()', 'PUT', 1, 'admin', NULL, '/equ/terminal', '127.0.0.1', '内网IP', '{\"activeState\":1,\"appEui\":\"305419896\",\"appId\":12345,\"battery\":100,\"macType\":1,\"params\":{},\"runState\":0,\"terminalAddr\":16,\"terminalEui\":\"5\",\"terminalId\":5,\"terminalType\":2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-22 15:02:58');
INSERT INTO `sys_oper_log` VALUES (391, '终端 ', 3, 'com.ruoyi.system.controller.LoraTerminalController.remove()', 'DELETE', 1, 'admin', NULL, '/equ/terminal/5', '127.0.0.1', '内网IP', '{terminalIds=5}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-22 15:03:06');
INSERT INTO `sys_oper_log` VALUES (392, '终端 ', 5, 'com.ruoyi.system.controller.LoraTerminalController.export()', 'POST', 1, 'admin', NULL, '/equ/terminal/export', '127.0.0.1', '内网IP', '{\"params\":{}}', NULL, 0, NULL, '2022-10-22 15:03:31');
INSERT INTO `sys_oper_log` VALUES (393, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/8', '127.0.0.1', '内网IP', '{tableIds=8}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-23 13:19:40');
INSERT INTO `sys_oper_log` VALUES (394, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '\"lora_data,lora_app,lora_terminal\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-23 13:19:49');
INSERT INTO `sys_oper_log` VALUES (395, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', NULL, '/tool/gen/synchDb/lora_data', '127.0.0.1', '内网IP', '{tableName=lora_data}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-23 13:38:58');
INSERT INTO `sys_oper_log` VALUES (396, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', NULL, '/tool/gen/synchDb/lora_data', '127.0.0.1', '内网IP', '{tableName=lora_data}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-23 14:10:30');
INSERT INTO `sys_oper_log` VALUES (397, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', NULL, '/tool/gen/synchDb/lora_data', '127.0.0.1', '内网IP', '{tableName=lora_data}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-23 14:35:48');
INSERT INTO `sys_oper_log` VALUES (398, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', NULL, '/tool/gen/synchDb/lora_data', '127.0.0.1', '内网IP', '{tableName=lora_data}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-23 17:36:03');
INSERT INTO `sys_oper_log` VALUES (399, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', NULL, '/tool/gen/synchDb/lora_terminal', '127.0.0.1', '内网IP', '{tableName=lora_terminal}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-23 18:22:31');
INSERT INTO `sys_oper_log` VALUES (400, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"equ/terminal/index\",\"createTime\":\"2022-09-27 21:37:21\",\"icon\":\"button\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2001,\"menuName\":\"终端管理\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":0,\"path\":\"Terminal\",\"perms\":\"equ:terminal:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-30 15:29:12');
INSERT INTO `sys_oper_log` VALUES (401, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"appserver/app/index\",\"createTime\":\"2022-10-15 22:31:59\",\"icon\":\"404\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2082,\"menuName\":\"terminal\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2067,\"path\":\"1\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-30 15:29:30');
INSERT INTO `sys_oper_log` VALUES (402, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2022-09-29 16:14:47\",\"icon\":\"404\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2067,\"menuName\":\"测试\",\"menuType\":\"M\",\"orderNum\":7,\"params\":{},\"parentId\":0,\"path\":\"test\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-30 16:03:46');
INSERT INTO `sys_oper_log` VALUES (403, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2022-09-27 21:29:42\",\"icon\":\"tool\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":3,\"menuName\":\"系统工具\",\"menuType\":\"M\",\"orderNum\":7,\"params\":{},\"parentId\":0,\"path\":\"tool\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-30 16:03:56');
INSERT INTO `sys_oper_log` VALUES (404, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/dept/index\",\"createTime\":\"2022-09-27 21:29:42\",\"icon\":\"tree\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":103,\"menuName\":\"部门管理\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":1,\"path\":\"dept\",\"perms\":\"system:dept:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-30 16:04:17');
INSERT INTO `sys_oper_log` VALUES (405, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/post/index\",\"createTime\":\"2022-09-27 21:29:42\",\"icon\":\"post\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":104,\"menuName\":\"岗位管理\",\"menuType\":\"C\",\"orderNum\":5,\"params\":{},\"parentId\":1,\"path\":\"post\",\"perms\":\"system:post:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-30 16:04:24');
INSERT INTO `sys_oper_log` VALUES (406, '应用', 2, 'com.ruoyi.system.controller.LoraAppController.edit()', 'PUT', 1, 'admin', NULL, '/app/appManagement', '127.0.0.1', '内网IP', '{\"appEui\":\"12345\",\"appId\":1,\"appName\":\"立体仓库\",\"authStarttime\":\"2022-11-01 00:00:00\",\"authState\":\"0\",\"company\":\"陕西省物联公司\",\"createTime\":\"2022-10-04 15:25:07\",\"delFlag\":\"0\",\"managerId\":1,\"managerName\":\"Tony\",\"params\":{},\"phone\":\"13333333333\",\"timeto\":\"2023-05-01 00:00:00\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-03 08:34:11');
INSERT INTO `sys_oper_log` VALUES (407, '终端 ', 3, 'com.ruoyi.system.controller.LoraTerminalController.remove()', 'DELETE', 1, 'admin', NULL, '/equ/terminal/101', '127.0.0.1', '内网IP', '{terminalIds=101}', NULL, 1, 'Invalid bound statement (not found): com.ruoyi.system.mapper.LoraTerminalMapper.deleteLoraTerminalByTerminalIds', '2022-11-03 08:36:44');
INSERT INTO `sys_oper_log` VALUES (408, '终端 ', 3, 'com.ruoyi.system.controller.LoraTerminalController.remove()', 'DELETE', 1, 'admin', NULL, '/equ/terminal/101', '127.0.0.1', '内网IP', '{terminalIds=101}', NULL, 1, 'nested exception is org.apache.ibatis.binding.BindingException: Parameter \'appId\' not found. Available parameters are [array, arg0]', '2022-11-03 08:40:06');
INSERT INTO `sys_oper_log` VALUES (409, '终端 ', 3, 'com.ruoyi.system.controller.LoraTerminalController.remove()', 'DELETE', 1, 'admin', NULL, '/equ/terminal/101', '127.0.0.1', '内网IP', '{terminalIds=101}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-03 08:41:14');
INSERT INTO `sys_oper_log` VALUES (410, '终端 ', 3, 'com.ruoyi.system.controller.LoraTerminalController.remove()', 'DELETE', 1, 'admin', NULL, '/equ/terminal/103', '127.0.0.1', '内网IP', '{terminalIds=103}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-03 08:42:59');
INSERT INTO `sys_oper_log` VALUES (411, '终端 ', 3, 'com.ruoyi.system.controller.LoraTerminalController.remove()', 'DELETE', 1, 'admin', NULL, '/equ/terminal/102', '127.0.0.1', '内网IP', '{terminalIds=102}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-03 08:43:03');
INSERT INTO `sys_oper_log` VALUES (412, '终端 ', 3, 'com.ruoyi.system.controller.LoraTerminalController.remove()', 'DELETE', 1, 'admin', NULL, '/equ/terminal/95', '127.0.0.1', '内网IP', '{terminalIds=95}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-03 08:43:07');
INSERT INTO `sys_oper_log` VALUES (413, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2022-09-27 21:29:42\",\"icon\":\"tool\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":3,\"menuName\":\"系统工具\",\"menuType\":\"M\",\"orderNum\":7,\"params\":{},\"parentId\":0,\"path\":\"tool\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-03 08:44:48');
INSERT INTO `sys_oper_log` VALUES (414, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/9,10,11', '127.0.0.1', '内网IP', '{tableIds=9,10,11}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-03 08:45:04');
INSERT INTO `sys_oper_log` VALUES (415, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '\"lora_terminal\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-03 08:45:09');
INSERT INTO `sys_oper_log` VALUES (416, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/12', '127.0.0.1', '内网IP', '{tableIds=12}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-05 08:14:15');
INSERT INTO `sys_oper_log` VALUES (417, '终端 ', 3, 'com.ruoyi.system.controller.LoraSensorController.remove()', 'DELETE', 1, 'admin', NULL, '/equ/sensor/1', '127.0.0.1', '内网IP', '{sensorIds=1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-05 10:51:23');
INSERT INTO `sys_oper_log` VALUES (418, '终端 ', 3, 'com.ruoyi.system.controller.LoraSensorController.remove()', 'DELETE', 1, 'admin', NULL, '/equ/sensor/1', '127.0.0.1', '内网IP', '{sensorIds=1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-05 10:51:30');
INSERT INTO `sys_oper_log` VALUES (419, '终端 ', 3, 'com.ruoyi.system.controller.LoraSensorController.remove()', 'DELETE', 1, 'admin', NULL, '/equ/sensor/1', '127.0.0.1', '内网IP', '{sensorIds=1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-05 10:57:49');
INSERT INTO `sys_oper_log` VALUES (420, '终端 ', 3, 'com.ruoyi.system.controller.LoraSensorController.remove()', 'DELETE', 1, 'admin', NULL, '/equ/sensor/1', '127.0.0.1', '内网IP', '{sensorIds=1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-05 10:58:39');
INSERT INTO `sys_oper_log` VALUES (421, '终端 ', 5, 'com.ruoyi.system.controller.LoraSensorController.export()', 'POST', 1, 'admin', NULL, '/equ/sensor/export', '127.0.0.1', '内网IP', '{\"params\":{},\"serviceType\":0}', NULL, 0, NULL, '2022-11-05 10:59:34');
INSERT INTO `sys_oper_log` VALUES (422, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '\"lora_sensor\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-05 11:00:34');
INSERT INTO `sys_oper_log` VALUES (423, '终端 ', 3, 'com.ruoyi.system.controller.LoraSensorController.remove()', 'DELETE', 1, 'admin', NULL, '/equ/sensor/1', '127.0.0.1', '内网IP', '{sensorIds=1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-05 11:56:19');
INSERT INTO `sys_oper_log` VALUES (424, '终端 ', 3, 'com.ruoyi.system.controller.LoraSensorController.remove()', 'DELETE', 1, 'admin', NULL, '/equ/sensor/1', '127.0.0.1', '内网IP', '{sensorIds=1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-05 12:16:55');
INSERT INTO `sys_oper_log` VALUES (425, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '\"lora_terminal\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-05 12:30:48');
INSERT INTO `sys_oper_log` VALUES (426, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '\"lora_gateway\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-05 12:32:57');
INSERT INTO `sys_oper_log` VALUES (427, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', NULL, '/tool/gen/synchDb/lora_gateway', '127.0.0.1', '内网IP', '{tableName=lora_gateway}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-05 12:34:19');
INSERT INTO `sys_oper_log` VALUES (428, '终端 ', 3, 'com.ruoyi.system.controller.LoraTerminalController.remove()', 'DELETE', 1, 'admin', NULL, '/equ/terminal/118', '127.0.0.1', '内网IP', '{terminalIds=118}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-05 13:23:23');
INSERT INTO `sys_oper_log` VALUES (429, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/13,14,15', '127.0.0.1', '内网IP', '{tableIds=13,14,15}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-05 15:22:40');
INSERT INTO `sys_oper_log` VALUES (430, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '\"lora_node\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-05 15:22:44');
INSERT INTO `sys_oper_log` VALUES (431, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"node\",\"className\":\"LoraNode\",\"columns\":[{\"capJavaField\":\"NodeId\",\"columnComment\":\"传感器id\",\"columnId\":232,\"columnName\":\"node_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2022-11-05 15:22:44\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"nodeId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":16,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"NodeEui\",\"columnComment\":\"传感器出厂ID\",\"columnId\":233,\"columnName\":\"node_eui\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2022-11-05 15:22:44\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"nodeEui\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":16,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ActiveState\",\"columnComment\":\"0 未激活1 已激活\",\"columnId\":234,\"columnName\":\"active_state\",\"columnType\":\"tinyint(1)\",\"createBy\":\"admin\",\"createTime\":\"2022-11-05 15:22:44\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"activeState\",\"javaType\":\"Integer\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":16,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Battery\",\"columnComment\":\"电池电量\",\"columnId\":235,\"columnName\":\"battery\",\"columnType\":\"float\",\"createBy\":\"admin\",\"createTime\":\"2022-11-05 15:22:44\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"battery\",\"javaType\":\"Long\",\"list\":true', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-05 15:23:11');
INSERT INTO `sys_oper_log` VALUES (432, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', NULL, '/tool/gen/synchDb/lora_node', '127.0.0.1', '内网IP', '{tableName=lora_node}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-05 15:24:44');
INSERT INTO `sys_oper_log` VALUES (433, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '\"lora_gateway\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-05 16:11:26');
INSERT INTO `sys_oper_log` VALUES (434, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"equ/gateway/index\",\"createBy\":\"admin\",\"icon\":\"bug\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"网关\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"gateway\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-05 16:14:03');
INSERT INTO `sys_oper_log` VALUES (435, '应用', 1, 'com.ruoyi.system.controller.LoraAppController.add()', 'POST', 1, 'admin', NULL, '/app/appManagement', '127.0.0.1', '内网IP', '{\"appId\":63,\"appName\":\"机器人\",\"authStarttime\":\"2022-11-02 00:00:00\",\"company\":\"ISIP\",\"managerName\":\"Tom\",\"params\":{},\"phone\":\"18991972999\",\"timeto\":\"2022-11-02 00:00:00\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-05 17:45:38');
INSERT INTO `sys_oper_log` VALUES (436, '应用', 3, 'com.ruoyi.system.controller.LoraAppController.remove()', 'DELETE', 1, 'admin', NULL, '/app/appManagement/63', '127.0.0.1', '内网IP', '{appIds=63}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-05 17:45:44');
INSERT INTO `sys_oper_log` VALUES (437, '应用', 1, 'com.ruoyi.system.controller.LoraAppController.add()', 'POST', 1, 'admin', NULL, '/app/appManagement', '127.0.0.1', '内网IP', '{\"company\":\"123\",\"params\":{}}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'company, \n             \n             \n        create_time\n        )values(\n\n    \' at line 13\r\n### The error may exist in file [F:\\appserver\\appserver-system\\target\\classes\\mapper\\system\\LoraAppMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.LoraAppMapper.insertLoraApp-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into lora_app                                                                                                                                                           company,                                      create_time         )values(                                                                                                               ?,                                        sysdate()         )\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'company, \n             \n             \n        create_time\n        )values(\n\n    \' at line 13\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'company, \n             \n             \n        create_time\n        )values(\n\n    \' at line 13', '2022-11-05 17:58:25');
INSERT INTO `sys_oper_log` VALUES (438, '应用', 1, 'com.ruoyi.system.controller.LoraAppController.add()', 'POST', 1, 'admin', NULL, '/app/appManagement', '127.0.0.1', '内网IP', '{\"company\":\"12\",\"params\":{}}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'company, \n             \n             \n        create_time\n        )values(\n\n    \' at line 13\r\n### The error may exist in file [F:\\appserver\\appserver-system\\target\\classes\\mapper\\system\\LoraAppMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.LoraAppMapper.insertLoraApp-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into lora_app                                                                                                                                                           company,                                      create_time         )values(                                                                                                               ?,                                        sysdate()         )\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'company, \n             \n             \n        create_time\n        )values(\n\n    \' at line 13\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'company, \n             \n             \n        create_time\n        )values(\n\n    \' at line 13', '2022-11-05 17:58:30');
INSERT INTO `sys_oper_log` VALUES (439, '应用', 1, 'com.ruoyi.system.controller.LoraAppController.add()', 'POST', 1, 'admin', NULL, '/app/appManagement', '127.0.0.1', '内网IP', '{\"company\":\"12\",\"managerName\":\"345\",\"params\":{}}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'manager_name, \n             \n             \n             \n             \n         \' at line 8\r\n### The error may exist in file [F:\\appserver\\appserver-system\\target\\classes\\mapper\\system\\LoraAppMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.LoraAppMapper.insertLoraApp-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into lora_app                                                                                     manager_name,                                                                       company,                                      create_time         )values(                                                             ?,                                                   ?,                                        sysdate()         )\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'manager_name, \n             \n             \n             \n             \n         \' at line 8\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'manager_name, \n             \n             \n             \n             \n         \' at line 8', '2022-11-05 17:58:55');
INSERT INTO `sys_oper_log` VALUES (440, '应用', 1, 'com.ruoyi.system.controller.LoraAppController.add()', 'POST', 1, 'admin', NULL, '/app/appManagement', '127.0.0.1', '内网IP', '{\"appId\":64,\"company\":\"123\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-05 17:59:51');
INSERT INTO `sys_oper_log` VALUES (441, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"equ/node/index\",\"createBy\":\"admin\",\"icon\":\"404\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"lora终端\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":0,\"path\":\"loraterminal\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-05 18:53:31');
INSERT INTO `sys_oper_log` VALUES (442, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2085', '127.0.0.1', '内网IP', '{menuId=2085}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-05 18:57:42');
INSERT INTO `sys_oper_log` VALUES (443, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', NULL, '/tool/gen/synchDb/lora_node', '127.0.0.1', '内网IP', '{tableName=lora_node}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-05 19:02:22');
INSERT INTO `sys_oper_log` VALUES (444, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', NULL, '/tool/gen/synchDb/lora_gateway', '127.0.0.1', '内网IP', '{tableName=lora_gateway}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-05 19:02:23');
INSERT INTO `sys_oper_log` VALUES (445, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '\"lora_terminal\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-05 19:02:40');
INSERT INTO `sys_oper_log` VALUES (446, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', NULL, '/tool/gen/synchDb/lora_terminal', '127.0.0.1', '内网IP', '{tableName=lora_terminal}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-05 19:02:43');
INSERT INTO `sys_oper_log` VALUES (447, '字典类型', 3, 'com.ruoyi.web.controller.system.SysDictDataController.remove()', 'DELETE', 1, 'admin', NULL, '/system/dict/data/109', '127.0.0.1', '内网IP', '{dictCodes=109}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-05 19:11:31');
INSERT INTO `sys_oper_log` VALUES (448, '字典类型', 3, 'com.ruoyi.web.controller.system.SysDictDataController.remove()', 'DELETE', 1, 'admin', NULL, '/system/dict/data/111', '127.0.0.1', '内网IP', '{dictCodes=111}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-05 19:11:33');
INSERT INTO `sys_oper_log` VALUES (449, '字典类型', 3, 'com.ruoyi.web.controller.system.SysDictDataController.remove()', 'DELETE', 1, 'admin', NULL, '/system/dict/data/110', '127.0.0.1', '内网IP', '{dictCodes=110}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-05 19:11:37');
INSERT INTO `sys_oper_log` VALUES (450, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2022-09-27 21:35:02\",\"default\":false,\"dictCode\":107,\"dictLabel\":\"在线\",\"dictSort\":0,\"dictType\":\"terminal_runstate\",\"dictValue\":\"0\",\"isDefault\":\"N\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-05 19:11:46');
INSERT INTO `sys_oper_log` VALUES (451, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2022-09-27 21:35:08\",\"default\":false,\"dictCode\":108,\"dictLabel\":\"离线\",\"dictSort\":1,\"dictType\":\"terminal_runstate\",\"dictValue\":\"1\",\"isDefault\":\"N\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-05 19:11:52');
INSERT INTO `sys_oper_log` VALUES (452, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', NULL, '/tool/gen/synchDb/lora_node', '127.0.0.1', '内网IP', '{tableName=lora_node}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-06 12:21:43');
INSERT INTO `sys_oper_log` VALUES (453, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.changeStatus()', 'PUT', 1, 'admin', NULL, '/system/user/changeStatus', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2022-11-06 14:10:09');
INSERT INTO `sys_oper_log` VALUES (454, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.changeStatus()', 'PUT', 1, 'admin', NULL, '/system/user/changeStatus', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2022-11-06 14:10:12');
INSERT INTO `sys_oper_log` VALUES (455, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.changeStatus()', 'PUT', 1, 'admin', NULL, '/system/user/changeStatus', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"status\":\"1\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2022-11-06 14:10:20');
INSERT INTO `sys_oper_log` VALUES (456, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.changeStatus()', 'PUT', 1, 'admin', NULL, '/system/user/changeStatus', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2022-11-06 14:10:48');
INSERT INTO `sys_oper_log` VALUES (457, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.changeStatus()', 'PUT', 1, 'admin', NULL, '/system/user/changeStatus', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2022-11-06 14:10:57');
INSERT INTO `sys_oper_log` VALUES (458, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.changeStatus()', 'PUT', 1, 'admin', NULL, '/system/user/changeStatus', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2022-11-06 14:11:03');
INSERT INTO `sys_oper_log` VALUES (459, '应用', 3, 'com.ruoyi.system.controller.LoraAppController.remove()', 'DELETE', 1, 'admin', NULL, '/app/appManagement/64', '127.0.0.1', '内网IP', '{appIds=64}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-06 14:17:18');
INSERT INTO `sys_oper_log` VALUES (460, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.changeStatus()', 'PUT', 1, 'admin', NULL, '/system/user/changeStatus', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2022-11-06 14:17:22');
INSERT INTO `sys_oper_log` VALUES (461, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.changeStatus()', 'PUT', 1, 'admin', NULL, '/system/user/changeStatus', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2022-11-06 14:17:39');
INSERT INTO `sys_oper_log` VALUES (462, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.changeStatus()', 'PUT', 1, 'admin', NULL, '/system/user/changeStatus', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2022-11-06 14:17:53');
INSERT INTO `sys_oper_log` VALUES (463, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '\"lora_app\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-06 14:19:32');
INSERT INTO `sys_oper_log` VALUES (464, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.changeStatus()', 'PUT', 1, 'admin', NULL, '/system/user/changeStatus', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"status\":\"1\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2022-11-06 14:21:03');
INSERT INTO `sys_oper_log` VALUES (465, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.changeStatus()', 'PUT', 1, 'admin', NULL, '/system/user/changeStatus', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"status\":\"1\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2022-11-06 14:21:05');
INSERT INTO `sys_oper_log` VALUES (466, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.changeStatus()', 'PUT', 1, 'admin', NULL, '/system/user/changeStatus', '127.0.0.1', '内网IP', '{\"admin\":true,\"params\":{},\"status\":\"1\",\"userId\":1}', NULL, 1, '不允许操作超级管理员用户', '2022-11-06 14:33:43');
INSERT INTO `sys_oper_log` VALUES (467, 'App管理', 2, 'com.ruoyi.system.controller.LoraAppController.changeStatus()', 'PUT', 1, 'admin', NULL, '/app/appManagement/changeStatus', '127.0.0.1', '内网IP', '{\"appId\":1,\"authState\":\"1\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-06 14:37:50');
INSERT INTO `sys_oper_log` VALUES (468, 'App管理', 2, 'com.ruoyi.system.controller.LoraAppController.changeStatus()', 'PUT', 1, 'admin', NULL, '/app/appManagement/changeStatus', '127.0.0.1', '内网IP', '{\"appId\":63,\"authState\":\"1\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-06 14:37:52');
INSERT INTO `sys_oper_log` VALUES (469, 'App管理', 2, 'com.ruoyi.system.controller.LoraAppController.changeStatus()', 'PUT', 1, 'admin', NULL, '/app/appManagement/changeStatus', '127.0.0.1', '内网IP', '{\"appId\":1,\"authState\":\"0\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-06 14:37:53');
INSERT INTO `sys_oper_log` VALUES (470, 'App管理', 2, 'com.ruoyi.system.controller.LoraAppController.changeStatus()', 'PUT', 1, 'admin', NULL, '/app/appManagement/changeStatus', '127.0.0.1', '内网IP', '{\"appId\":2,\"authState\":\"0\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-06 14:37:54');
INSERT INTO `sys_oper_log` VALUES (471, 'App管理', 2, 'com.ruoyi.system.controller.LoraAppController.changeStatus()', 'PUT', 1, 'admin', NULL, '/app/appManagement/changeStatus', '127.0.0.1', '内网IP', '{\"appId\":63,\"authState\":\"0\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-06 14:37:56');
INSERT INTO `sys_oper_log` VALUES (472, 'App管理', 2, 'com.ruoyi.system.controller.LoraAppController.changeStatus()', 'PUT', 1, 'admin', NULL, '/app/appManagement/changeStatus', '127.0.0.1', '内网IP', '{\"appId\":2,\"authState\":\"1\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-06 14:44:45');
INSERT INTO `sys_oper_log` VALUES (473, 'App管理', 2, 'com.ruoyi.system.controller.LoraAppController.changeStatus()', 'PUT', 1, 'admin', NULL, '/app/appManagement/changeStatus', '127.0.0.1', '内网IP', '{\"appId\":2,\"authState\":\"0\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-06 14:44:47');
INSERT INTO `sys_oper_log` VALUES (474, '应用', 1, 'com.ruoyi.system.controller.LoraAppController.add()', 'POST', 1, 'admin', NULL, '/app/appManagement', '127.0.0.1', '内网IP', '{\"appName\":\"立体仓库\",\"params\":{}}', '{\"msg\":\"新增App\'立体仓库\'失败，App名称已存在\",\"code\":500}', 0, NULL, '2022-11-06 14:44:57');
INSERT INTO `sys_oper_log` VALUES (475, '应用', 1, 'com.ruoyi.system.controller.LoraAppController.add()', 'POST', 1, 'admin', NULL, '/app/appManagement', '127.0.0.1', '内网IP', '{\"appId\":65,\"appName\":\"立体仓库1\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-06 14:45:01');
INSERT INTO `sys_oper_log` VALUES (476, '应用', 3, 'com.ruoyi.system.controller.LoraAppController.remove()', 'DELETE', 1, 'admin', NULL, '/app/appManagement/65', '127.0.0.1', '内网IP', '{appIds=65}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-06 14:46:38');
INSERT INTO `sys_oper_log` VALUES (477, '应用', 1, 'com.ruoyi.system.controller.LoraAppController.add()', 'POST', 1, 'admin', NULL, '/app/appManagement', '127.0.0.1', '内网IP', '{\"appName\":\"123\",\"params\":{}}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'app_name\' in \'field list\'\r\n### The error may exist in file [F:\\appserver\\appserver-system\\target\\classes\\mapper\\system\\LoraAppMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.LoraAppMapper.insertLoraApp-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_user(                                          app_name,                                                                                                                                            create_time         )values(                                          ?,                                                                                                                                                      sysdate()         )\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'app_name\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'app_name\' in \'field list\'', '2022-11-06 14:46:44');
INSERT INTO `sys_oper_log` VALUES (478, '应用', 1, 'com.ruoyi.system.controller.LoraAppController.add()', 'POST', 1, 'admin', NULL, '/app/appManagement', '127.0.0.1', '内网IP', '{\"appName\":\"lww\",\"params\":{}}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'app_name\' in \'field list\'\r\n### The error may exist in file [F:\\appserver\\appserver-system\\target\\classes\\mapper\\system\\LoraAppMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.LoraAppMapper.insertLoraApp-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_user(                                          app_name,                                                                                                                                            create_time         )values(                                          ?,                                                                                                                                                      sysdate()         )\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'app_name\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'app_name\' in \'field list\'', '2022-11-06 14:46:50');
INSERT INTO `sys_oper_log` VALUES (479, '应用', 1, 'com.ruoyi.system.controller.LoraAppController.add()', 'POST', 1, 'admin', NULL, '/app/appManagement', '127.0.0.1', '内网IP', '{\"appName\":\"345\",\"params\":{}}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'app_name\' in \'field list\'\r\n### The error may exist in file [F:\\appserver\\appserver-system\\target\\classes\\mapper\\system\\LoraAppMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.LoraAppMapper.insertLoraApp-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_user(                                          app_name,                                                                                                                                            create_time         )values(                                          ?,                                                                                                                                        sysdate()         )\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'app_name\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'app_name\' in \'field list\'', '2022-11-06 14:47:58');
INSERT INTO `sys_oper_log` VALUES (480, '应用', 1, 'com.ruoyi.system.controller.LoraAppController.add()', 'POST', 1, 'admin', NULL, '/app/appManagement', '127.0.0.1', '内网IP', '{\"appName\":\"345\",\"params\":{}}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'app_name\' in \'field list\'\r\n### The error may exist in file [F:\\appserver\\appserver-system\\target\\classes\\mapper\\system\\LoraAppMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.LoraAppMapper.insertLoraApp-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_user(                                          app_name,                                                                                                                                            create_time         )values(                                          ?,                                                                                                                                        sysdate()         )\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'app_name\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'app_name\' in \'field list\'', '2022-11-06 14:48:07');
INSERT INTO `sys_oper_log` VALUES (481, '应用', 1, 'com.ruoyi.system.controller.LoraAppController.add()', 'POST', 1, 'admin', NULL, '/app/appManagement', '127.0.0.1', '内网IP', '{\"appId\":66,\"appName\":\"123\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-06 14:49:12');
INSERT INTO `sys_oper_log` VALUES (482, 'App管理', 2, 'com.ruoyi.system.controller.LoraAppController.changeStatus()', 'PUT', 1, 'admin', NULL, '/app/appManagement/changeStatus', '127.0.0.1', '内网IP', '{\"appId\":1,\"authState\":\"1\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-06 18:04:20');
INSERT INTO `sys_oper_log` VALUES (483, 'App管理', 2, 'com.ruoyi.system.controller.LoraAppController.changeStatus()', 'PUT', 1, 'admin', NULL, '/app/appManagement/changeStatus', '127.0.0.1', '内网IP', '{\"appId\":1,\"authState\":\"0\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-06 18:04:24');
INSERT INTO `sys_oper_log` VALUES (484, 'App管理', 2, 'com.ruoyi.system.controller.LoraAppController.changeStatus()', 'PUT', 1, 'admin', NULL, '/app/appManagement/changeStatus', '127.0.0.1', '内网IP', '{\"appId\":1,\"authState\":\"1\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-06 18:04:40');
INSERT INTO `sys_oper_log` VALUES (485, 'App管理', 2, 'com.ruoyi.system.controller.LoraAppController.changeStatus()', 'PUT', 1, 'admin', NULL, '/app/appManagement/changeStatus', '127.0.0.1', '内网IP', '{\"appId\":1,\"authState\":\"0\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-06 18:04:43');
INSERT INTO `sys_oper_log` VALUES (486, 'App管理', 2, 'com.ruoyi.system.controller.LoraAppController.changeStatus()', 'PUT', 1, 'admin', NULL, '/app/appManagement/changeStatus', '127.0.0.1', '内网IP', '{\"appId\":1,\"authState\":\"1\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-07 14:51:09');
INSERT INTO `sys_oper_log` VALUES (487, 'App管理', 2, 'com.ruoyi.system.controller.LoraAppController.changeStatus()', 'PUT', 1, 'admin', NULL, '/app/appManagement/changeStatus', '127.0.0.1', '内网IP', '{\"appId\":1,\"authState\":\"0\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-07 14:51:11');
INSERT INTO `sys_oper_log` VALUES (488, 'App管理', 2, 'com.ruoyi.system.controller.LoraAppController.changeStatus()', 'PUT', 1, 'admin', NULL, '/app/appManagement/changeStatus', '127.0.0.1', '内网IP', '{\"appId\":2,\"authState\":\"0\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-07 14:51:16');
INSERT INTO `sys_oper_log` VALUES (489, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '\"lora_data\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-07 15:43:41');
INSERT INTO `sys_oper_log` VALUES (490, 'App管理', 2, 'com.ruoyi.system.controller.LoraAppController.changeStatus()', 'PUT', 1, 'admin', NULL, '/app/appManagement/changeStatus', '127.0.0.1', '内网IP', '{\"appId\":2,\"authState\":\"1\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-07 15:49:47');
INSERT INTO `sys_oper_log` VALUES (491, 'App管理', 2, 'com.ruoyi.system.controller.LoraAppController.changeStatus()', 'PUT', 1, 'admin', NULL, '/app/appManagement/changeStatus', '127.0.0.1', '内网IP', '{\"appId\":2,\"authState\":\"0\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-07 15:49:48');
INSERT INTO `sys_oper_log` VALUES (492, 'App管理', 2, 'com.ruoyi.system.controller.LoraAppController.changeStatus()', 'PUT', 1, 'admin', NULL, '/app/appManagement/changeStatus', '127.0.0.1', '内网IP', '{\"appId\":63,\"authState\":\"1\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-07 15:49:55');
INSERT INTO `sys_oper_log` VALUES (493, 'App管理', 2, 'com.ruoyi.system.controller.LoraAppController.changeStatus()', 'PUT', 1, 'admin', NULL, '/app/appManagement/changeStatus', '127.0.0.1', '内网IP', '{\"appId\":66,\"authState\":\"1\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-07 15:49:56');
INSERT INTO `sys_oper_log` VALUES (494, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2022-09-27 21:29:42\",\"icon\":\"tool\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":3,\"menuName\":\"系统工具\",\"menuType\":\"M\",\"orderNum\":7,\"params\":{},\"parentId\":0,\"path\":\"tool\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-07 15:50:32');
INSERT INTO `sys_oper_log` VALUES (495, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2022-09-27 21:29:42\",\"icon\":\"tool\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":3,\"menuName\":\"系统工具\",\"menuType\":\"M\",\"orderNum\":7,\"params\":{},\"parentId\":0,\"path\":\"tool\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-07 16:28:24');
INSERT INTO `sys_oper_log` VALUES (496, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '\"lora_appserver\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-07 16:28:37');
INSERT INTO `sys_oper_log` VALUES (497, 'App管理', 2, 'com.ruoyi.system.controller.LoraAppController.changeStatus()', 'PUT', 1, 'admin', NULL, '/app/appManagement/changeStatus', '127.0.0.1', '内网IP', '{\"appId\":63,\"authState\":\"0\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-07 16:54:31');
INSERT INTO `sys_oper_log` VALUES (498, 'App管理', 2, 'com.ruoyi.system.controller.LoraAppController.changeStatus()', 'PUT', 1, 'admin', NULL, '/app/appManagement/changeStatus', '127.0.0.1', '内网IP', '{\"appId\":1,\"authState\":\"1\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-07 19:48:30');
INSERT INTO `sys_oper_log` VALUES (499, 'App管理', 2, 'com.ruoyi.system.controller.LoraAppController.changeStatus()', 'PUT', 1, 'admin', NULL, '/app/appManagement/changeStatus', '127.0.0.1', '内网IP', '{\"appId\":1,\"authState\":\"0\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-07 19:48:43');
INSERT INTO `sys_oper_log` VALUES (500, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/16,17,18,19,20,21', '127.0.0.1', '内网IP', '{tableIds=16,17,18,19,20,21}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-07 19:49:10');
INSERT INTO `sys_oper_log` VALUES (501, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '\"lora_terminal\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-07 19:49:58');
INSERT INTO `sys_oper_log` VALUES (502, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', NULL, '/tool/gen/synchDb/lora_terminal', '127.0.0.1', '内网IP', '{tableName=lora_terminal}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-07 19:59:02');
INSERT INTO `sys_oper_log` VALUES (503, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', NULL, '/tool/gen/synchDb/lora_terminal', '127.0.0.1', '内网IP', '{tableName=lora_terminal}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-07 19:59:13');
INSERT INTO `sys_oper_log` VALUES (504, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/22', '127.0.0.1', '内网IP', '{tableIds=22}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-07 19:59:42');
INSERT INTO `sys_oper_log` VALUES (505, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '\"lora_terminal\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-07 19:59:46');
INSERT INTO `sys_oper_log` VALUES (506, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '\"lora_data\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-07 22:27:49');
INSERT INTO `sys_oper_log` VALUES (507, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '\"lora_appserver\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-08 16:59:10');
INSERT INTO `sys_oper_log` VALUES (508, 'App管理', 2, 'com.ruoyi.system.controller.LoraAppController.changeStatus()', 'PUT', 1, 'admin', NULL, '/app/appManagement/changeStatus', '127.0.0.1', '内网IP', '{\"appId\":1,\"authState\":\"1\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-12 09:42:40');
INSERT INTO `sys_oper_log` VALUES (509, 'App管理', 2, 'com.ruoyi.system.controller.LoraAppController.changeStatus()', 'PUT', 1, 'admin', NULL, '/app/appManagement/changeStatus', '127.0.0.1', '内网IP', '{\"appId\":1,\"authState\":\"0\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-12 09:42:42');
INSERT INTO `sys_oper_log` VALUES (510, '终端 ', 2, 'com.ruoyi.system.controller.LoraTerminalController.edit()', 'PUT', 1, 'admin', NULL, '/equ/terminal', '127.0.0.1', '内网IP', '{\"activeState\":\"0\",\"app\":{\"appEui\":\"333333\",\"params\":{}},\"appEui\":\"333333\",\"createTime\":\"2022-11-07 20:59:33\",\"params\":{},\"runState\":\"0\",\"sensorId\":123,\"sensorType\":2,\"sn\":\"3333333333312301\",\"snId\":128,\"terminalEui\":\"33333333333\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-12 09:47:19');
INSERT INTO `sys_oper_log` VALUES (511, '终端 ', 2, 'com.ruoyi.system.controller.LoraTerminalController.edit()', 'PUT', 1, 'admin', NULL, '/equ/terminal', '127.0.0.1', '内网IP', '{\"activeState\":\"0\",\"app\":{\"appEui\":\"333333\",\"params\":{}},\"appEui\":\"333333\",\"createTime\":\"2022-11-07 20:54:45\",\"params\":{},\"runState\":\"0\",\"sensorId\":123,\"sensorType\":4,\"sn\":\"3333333333312312\",\"snId\":127,\"terminalEui\":\"33333333333\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-12 09:47:25');
INSERT INTO `sys_oper_log` VALUES (512, '终端 ', 2, 'com.ruoyi.system.controller.LoraTerminalController.edit()', 'PUT', 1, 'admin', NULL, '/equ/terminal', '127.0.0.1', '内网IP', '{\"activeState\":\"0\",\"app\":{\"appEui\":\"333333\",\"params\":{}},\"appEui\":\"333333\",\"createTime\":\"2022-11-07 20:54:45\",\"params\":{},\"runState\":\"0\",\"sensorId\":123,\"sensorType\":4,\"sn\":\"3333333333312312\",\"snId\":127,\"terminalEui\":\"33333333333\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-12 09:47:30');
INSERT INTO `sys_oper_log` VALUES (513, 'App管理', 2, 'com.ruoyi.system.controller.LoraAppController.changeStatus()', 'PUT', 1, 'admin', NULL, '/app/appManagement/changeStatus', '127.0.0.1', '内网IP', '{\"appId\":66,\"authState\":\"0\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-12 09:48:38');
INSERT INTO `sys_oper_log` VALUES (514, 'App管理', 2, 'com.ruoyi.system.controller.LoraAppController.changeStatus()', 'PUT', 1, 'admin', NULL, '/app/appManagement/changeStatus', '127.0.0.1', '内网IP', '{\"appId\":2,\"authState\":\"1\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-12 09:48:40');
INSERT INTO `sys_oper_log` VALUES (515, '终端 ', 2, 'com.ruoyi.system.controller.LoraTerminalController.edit()', 'PUT', 1, 'admin', NULL, '/equ/terminal', '127.0.0.1', '内网IP', '{\"activeState\":\"0\",\"app\":{\"appEui\":\"333333\",\"params\":{}},\"appEui\":\"333333\",\"createTime\":\"2022-11-07 20:54:37\",\"params\":{},\"runState\":\"0\",\"sensorId\":123,\"sensorType\":0,\"sn\":\"333333333331231\",\"snId\":126,\"terminalEui\":\"33333333333\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-12 09:49:12');
INSERT INTO `sys_oper_log` VALUES (516, '终端 ', 2, 'com.ruoyi.system.controller.LoraTerminalController.edit()', 'PUT', 1, 'admin', NULL, '/equ/terminal', '127.0.0.1', '内网IP', '{\"activeState\":\"0\",\"app\":{\"appEui\":\"333333\",\"params\":{}},\"appEui\":\"333333\",\"createTime\":\"2022-11-07 20:54:37\",\"params\":{},\"runState\":\"0\",\"sensorId\":123,\"sensorType\":0,\"sn\":\"333333333331231\",\"snId\":126,\"terminalEui\":\"33333333333\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-12 09:49:39');
INSERT INTO `sys_oper_log` VALUES (517, '终端 ', 2, 'com.ruoyi.system.controller.LoraTerminalController.edit()', 'PUT', 1, 'admin', NULL, '/equ/terminal', '127.0.0.1', '内网IP', '{\"activeState\":\"0\",\"app\":{\"appEui\":\"333333\",\"params\":{}},\"appEui\":\"333333\",\"createTime\":\"2022-11-07 20:54:37\",\"params\":{},\"runState\":\"0\",\"sensorId\":123,\"sensorType\":0,\"sn\":\"333333333331231\",\"snId\":126,\"terminalEui\":\"33333333333\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-12 09:49:43');
INSERT INTO `sys_oper_log` VALUES (518, '终端 ', 2, 'com.ruoyi.system.controller.LoraTerminalController.edit()', 'PUT', 1, 'admin', NULL, '/equ/terminal', '127.0.0.1', '内网IP', '{\"activeState\":\"0\",\"app\":{\"appEui\":\"333333\",\"appId\":1,\"params\":{}},\"appEui\":\"333333\",\"appId\":1,\"lastMsgDt\":\"2022-11-06 00:00:00\",\"params\":{},\"runState\":\"0\",\"sensorId\":123,\"sensorType\":1,\"snId\":83,\"terminalEui\":\"123456789\"}', NULL, 1, '', '2022-11-12 09:51:10');
INSERT INTO `sys_oper_log` VALUES (519, '终端 ', 2, 'com.ruoyi.system.controller.LoraTerminalController.edit()', 'PUT', 1, 'admin', NULL, '/equ/terminal', '127.0.0.1', '内网IP', '{\"activeState\":\"0\",\"app\":{\"appEui\":\"333333\",\"appId\":1,\"params\":{}},\"appEui\":\"333333\",\"appId\":1,\"lastMsgDt\":\"2022-11-06 00:00:00\",\"params\":{},\"runState\":\"0\",\"sensorId\":123,\"sensorType\":1,\"snId\":83,\"terminalEui\":\"123456789\"}', NULL, 1, '', '2022-11-12 09:52:04');
INSERT INTO `sys_oper_log` VALUES (520, '终端 ', 2, 'com.ruoyi.system.controller.LoraTerminalController.edit()', 'PUT', 1, 'admin', NULL, '/equ/terminal', '127.0.0.1', '内网IP', '{\"activeState\":\"0\",\"app\":{\"appEui\":\"333333\",\"appId\":1,\"params\":{}},\"appEui\":\"333333\",\"appId\":1,\"lastMsgDt\":\"2022-11-06 00:00:00\",\"params\":{},\"runState\":\"0\",\"sensorId\":123,\"sensorType\":1,\"snId\":83,\"terminalEui\":\"123456789\"}', NULL, 1, '', '2022-11-12 09:52:22');
INSERT INTO `sys_oper_log` VALUES (521, '终端 ', 2, 'com.ruoyi.system.controller.LoraTerminalController.edit()', 'PUT', 1, 'admin', NULL, '/equ/terminal', '127.0.0.1', '内网IP', '{\"activeState\":\"0\",\"app\":{\"appEui\":\"333333\",\"appId\":1,\"params\":{}},\"appEui\":\"333333\",\"appId\":1,\"lastMsgDt\":\"2022-11-06 00:00:00\",\"params\":{},\"runState\":\"0\",\"sensorId\":123,\"sensorType\":1,\"snId\":83,\"terminalEui\":\"123456789\"}', NULL, 1, '', '2022-11-12 09:53:43');
INSERT INTO `sys_oper_log` VALUES (522, '终端 ', 2, 'com.ruoyi.system.controller.LoraTerminalController.edit()', 'PUT', 1, 'admin', NULL, '/equ/terminal', '127.0.0.1', '内网IP', '{\"activeState\":\"0\",\"app\":{\"appEui\":\"111111\",\"appId\":1,\"params\":{}},\"appEui\":\"111111\",\"appId\":1,\"lastMsgDt\":\"2022-11-06 00:00:00\",\"params\":{},\"runState\":\"0\",\"sensorId\":555555,\"sensorType\":1,\"snId\":95,\"terminalEui\":\"123456789\"}', NULL, 1, '', '2022-11-12 09:54:06');
INSERT INTO `sys_oper_log` VALUES (523, '终端 ', 2, 'com.ruoyi.system.controller.LoraTerminalController.edit()', 'PUT', 1, 'admin', NULL, '/equ/terminal', '127.0.0.1', '内网IP', '{\"activeState\":\"0\",\"app\":{\"appEui\":\"111111\",\"appId\":1,\"params\":{}},\"appEui\":\"111111\",\"appId\":1,\"lastMsgDt\":\"2022-11-06 00:00:00\",\"params\":{},\"runState\":\"0\",\"sensorId\":7,\"sensorType\":1,\"snId\":96,\"terminalEui\":\"1234567891\"}', NULL, 1, '', '2022-11-12 09:54:22');
INSERT INTO `sys_oper_log` VALUES (524, '终端 ', 2, 'com.ruoyi.system.controller.LoraTerminalController.edit()', 'PUT', 1, 'admin', NULL, '/equ/terminal', '127.0.0.1', '内网IP', '{\"activeState\":\"0\",\"app\":{\"appEui\":\"333333\",\"appId\":1,\"params\":{}},\"appEui\":\"333333\",\"appId\":1,\"lastMsgDt\":\"2022-11-06 00:00:00\",\"params\":{},\"runState\":\"0\",\"sensorId\":7,\"sensorType\":1,\"snId\":83,\"terminalEui\":\"123456789\"}', NULL, 1, '', '2022-11-12 09:54:33');
INSERT INTO `sys_oper_log` VALUES (525, '终端 ', 2, 'com.ruoyi.system.controller.LoraTerminalController.edit()', 'PUT', 1, 'admin', NULL, '/equ/terminal', '127.0.0.1', '内网IP', '{\"activeState\":\"0\",\"app\":{\"appEui\":\"333333\",\"appId\":1,\"params\":{}},\"appEui\":\"333333\",\"appId\":1,\"lastMsgDt\":\"2022-11-06 00:00:00\",\"params\":{},\"runState\":\"0\",\"sensorId\":1,\"sensorType\":1,\"snId\":83,\"terminalEui\":\"123456789\"}', NULL, 1, '', '2022-11-12 09:54:55');
INSERT INTO `sys_oper_log` VALUES (526, '终端 ', 2, 'com.ruoyi.system.controller.LoraTerminalController.edit()', 'PUT', 1, 'admin', NULL, '/equ/terminal', '127.0.0.1', '内网IP', '{\"activeState\":\"0\",\"app\":{\"appEui\":\"333333\",\"appId\":1,\"params\":{}},\"appEui\":\"333333\",\"appId\":1,\"lastMsgDt\":\"2022-11-06 00:00:00\",\"params\":{},\"runState\":\"0\",\"sensorId\":1,\"sensorType\":1,\"snId\":83,\"terminalEui\":\"123456789\"}', NULL, 1, '', '2022-11-12 09:55:26');
INSERT INTO `sys_oper_log` VALUES (527, '终端 ', 2, 'com.ruoyi.system.controller.LoraTerminalController.edit()', 'PUT', 1, 'admin', NULL, '/equ/terminal', '127.0.0.1', '内网IP', '{\"activeState\":\"0\",\"app\":{\"appEui\":\"333333\",\"appId\":1,\"params\":{}},\"appEui\":\"333333\",\"appId\":1,\"lastMsgDt\":\"2022-11-06 00:00:00\",\"params\":{},\"runState\":\"0\",\"sensorId\":1,\"sensorType\":1,\"snId\":83,\"terminalEui\":\"123456789\"}', NULL, 1, '', '2022-11-12 09:55:30');
INSERT INTO `sys_oper_log` VALUES (528, '终端 ', 2, 'com.ruoyi.system.controller.LoraTerminalController.edit()', 'PUT', 1, 'admin', NULL, '/equ/terminal', '127.0.0.1', '内网IP', '{\"activeState\":\"0\",\"app\":{\"appEui\":\"111111\",\"appId\":1,\"params\":{}},\"appEui\":\"111111\",\"appId\":1,\"lastMsgDt\":\"2022-11-06 00:00:00\",\"params\":{},\"runState\":\"0\",\"sensorId\":123,\"sensorType\":0,\"snId\":97,\"terminalEui\":\"123\"}', NULL, 1, '', '2022-11-12 09:55:47');
INSERT INTO `sys_oper_log` VALUES (529, '终端 ', 2, 'com.ruoyi.system.controller.LoraTerminalController.edit()', 'PUT', 1, 'admin', NULL, '/equ/terminal', '127.0.0.1', '内网IP', '{\"activeState\":\"0\",\"app\":{\"appEui\":\"111111\",\"appId\":1,\"params\":{}},\"appEui\":\"111111\",\"appId\":1,\"lastMsgDt\":\"2022-11-06 00:00:00\",\"params\":{},\"runState\":\"0\",\"sensorId\":123,\"sensorType\":0,\"snId\":97,\"terminalEui\":\"123\"}', NULL, 1, '', '2022-11-12 09:55:55');
INSERT INTO `sys_oper_log` VALUES (530, '终端 ', 2, 'com.ruoyi.system.controller.LoraTerminalController.edit()', 'PUT', 1, 'admin', NULL, '/equ/terminal', '127.0.0.1', '内网IP', '{\"activeState\":\"0\",\"app\":{\"appEui\":\"111111\",\"appId\":1,\"params\":{}},\"appEui\":\"111111\",\"appId\":1,\"lastMsgDt\":\"2022-11-06 00:00:00\",\"params\":{},\"runState\":\"0\",\"sensorId\":123,\"sensorType\":0,\"snId\":97,\"terminalEui\":\"123\"}', NULL, 1, '', '2022-11-12 09:57:23');
INSERT INTO `sys_oper_log` VALUES (531, '终端 ', 2, 'com.ruoyi.system.controller.LoraTerminalController.edit()', 'PUT', 1, 'admin', NULL, '/equ/terminal', '127.0.0.1', '内网IP', '{\"activeState\":\"0\",\"app\":{\"appEui\":\"333333\",\"appId\":1,\"params\":{}},\"appEui\":\"333333\",\"appId\":1,\"lastMsgDt\":\"2022-11-06 00:00:00\",\"params\":{},\"runState\":\"0\",\"sensorId\":44,\"sensorType\":1,\"snId\":83,\"terminalEui\":\"123456789\"}', NULL, 1, '', '2022-11-12 09:59:21');
INSERT INTO `sys_oper_log` VALUES (532, '终端 ', 2, 'com.ruoyi.system.controller.LoraTerminalController.edit()', 'PUT', 1, 'admin', NULL, '/equ/terminal', '127.0.0.1', '内网IP', '{\"activeState\":\"0\",\"app\":{\"appEui\":\"333333\",\"appId\":1,\"params\":{}},\"appEui\":\"333333\",\"appId\":1,\"lastMsgDt\":\"2022-11-06 00:00:00\",\"params\":{},\"runState\":\"0\",\"sensorId\":33,\"sensorType\":1,\"snId\":83,\"terminalEui\":\"123456789\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-12 10:04:20');
INSERT INTO `sys_oper_log` VALUES (533, '终端 ', 2, 'com.ruoyi.system.controller.LoraTerminalController.edit()', 'PUT', 1, 'admin', NULL, '/equ/terminal', '127.0.0.1', '内网IP', '{\"activeState\":\"0\",\"app\":{\"appEui\":\"333333\",\"appId\":1,\"params\":{}},\"appEui\":\"333333\",\"appId\":1,\"lastMsgDt\":\"2022-11-06 00:00:00\",\"params\":{},\"runState\":\"0\",\"sensorId\":33,\"sensorType\":1,\"snId\":83,\"terminalEui\":\"123456789\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-12 10:04:31');
INSERT INTO `sys_oper_log` VALUES (534, '终端 ', 2, 'com.ruoyi.system.controller.LoraTerminalController.edit()', 'PUT', 1, 'admin', NULL, '/equ/terminal', '127.0.0.1', '内网IP', '{\"activeState\":\"0\",\"app\":{\"appEui\":\"333333\",\"appId\":1,\"params\":{}},\"appEui\":\"333333\",\"appId\":1,\"lastMsgDt\":\"2022-11-06 00:00:00\",\"params\":{},\"runState\":\"0\",\"sensorId\":33,\"sensorType\":1,\"snId\":83,\"terminalEui\":\"123456789\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-12 10:04:41');
INSERT INTO `sys_oper_log` VALUES (535, '终端 ', 2, 'com.ruoyi.system.controller.LoraTerminalController.edit()', 'PUT', 1, 'admin', NULL, '/equ/terminal', '127.0.0.1', '内网IP', '{\"activeState\":\"0\",\"app\":{\"appEui\":\"333333\",\"appId\":1,\"params\":{}},\"appEui\":\"111111\",\"appId\":1,\"lastMsgDt\":\"2022-11-06 00:00:00\",\"params\":{},\"runState\":\"0\",\"sensorId\":33,\"sensorType\":1,\"snId\":83,\"terminalEui\":\"123456789\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-12 10:05:42');
INSERT INTO `sys_oper_log` VALUES (536, '终端 ', 2, 'com.ruoyi.system.controller.LoraTerminalController.edit()', 'PUT', 1, 'admin', NULL, '/equ/terminal', '127.0.0.1', '内网IP', '{\"activeState\":\"0\",\"app\":{\"appEui\":\"333333\",\"appId\":1,\"params\":{}},\"appEui\":\"111111\",\"appId\":1,\"lastMsgDt\":\"2022-11-06 00:00:00\",\"params\":{},\"runState\":\"0\",\"sensorType\":0,\"snId\":99,\"terminalEui\":\"1234666\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-12 10:06:33');
INSERT INTO `sys_oper_log` VALUES (537, '终端 ', 2, 'com.ruoyi.system.controller.LoraTerminalController.edit()', 'PUT', 1, 'admin', NULL, '/equ/terminal', '127.0.0.1', '内网IP', '{\"activeState\":\"0\",\"app\":{\"appEui\":\"111111\",\"appId\":1,\"params\":{}},\"appEui\":\"333333\",\"appId\":1,\"lastMsgDt\":\"2022-11-06 00:00:00\",\"params\":{},\"runState\":\"0\",\"sensorId\":33,\"sensorType\":1,\"snId\":83,\"terminalEui\":\"123456789\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-12 10:06:47');
INSERT INTO `sys_oper_log` VALUES (538, '终端 ', 2, 'com.ruoyi.system.controller.LoraTerminalController.edit()', 'PUT', 1, 'admin', NULL, '/equ/terminal', '127.0.0.1', '内网IP', '{\"activeState\":\"0\",\"app\":{\"appEui\":\"333333\",\"appId\":1,\"params\":{}},\"appEui\":\"333333\",\"appId\":1,\"lastMsgDt\":\"2022-11-06 00:00:00\",\"params\":{},\"runState\":\"0\",\"sensorId\":33,\"sensorType\":1,\"snId\":83,\"terminalEui\":\"123456789\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-12 10:08:15');
INSERT INTO `sys_oper_log` VALUES (539, '终端 ', 2, 'com.ruoyi.system.controller.LoraTerminalController.edit()', 'PUT', 1, 'admin', NULL, '/equ/terminal', '127.0.0.1', '内网IP', '{\"activeState\":\"0\",\"app\":{\"appEui\":\"333333\",\"appId\":1,\"params\":{}},\"appEui\":\"333333\",\"appId\":1,\"lastMsgDt\":\"2022-11-06 00:00:00\",\"params\":{},\"runState\":\"0\",\"sensorId\":33,\"sensorType\":1,\"snId\":83,\"terminalEui\":\"123456789\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-12 10:09:29');
INSERT INTO `sys_oper_log` VALUES (540, '终端 ', 2, 'com.ruoyi.system.controller.LoraTerminalController.edit()', 'PUT', 1, 'admin', NULL, '/equ/terminal', '127.0.0.1', '内网IP', '{\"activeState\":\"0\",\"app\":{\"appEui\":\"111111\",\"appId\":1,\"params\":{}},\"appEui\":\"111111\",\"appId\":1,\"lastMsgDt\":\"2022-11-06 00:00:00\",\"params\":{},\"runState\":\"0\",\"sensorId\":234,\"sensorType\":1,\"snId\":95,\"terminalEui\":\"123456789\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-12 10:14:35');
INSERT INTO `sys_oper_log` VALUES (541, '终端 ', 2, 'com.ruoyi.system.controller.LoraTerminalController.edit()', 'PUT', 1, 'admin', NULL, '/equ/terminal', '127.0.0.1', '内网IP', '{\"activeState\":\"0\",\"app\":{\"appEui\":\"333333\",\"appId\":1,\"params\":{}},\"appEui\":\"333333\",\"appId\":1,\"lastMsgDt\":\"2022-11-06 00:00:00\",\"params\":{},\"runState\":\"0\",\"sensorId\":33,\"sensorType\":1,\"snId\":83,\"terminalEui\":\"123456789\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-12 10:14:41');
INSERT INTO `sys_oper_log` VALUES (542, '终端 ', 2, 'com.ruoyi.system.controller.LoraTerminalController.edit()', 'PUT', 1, 'admin', NULL, '/equ/terminal', '127.0.0.1', '内网IP', '{\"activeState\":\"0\",\"app\":{\"appEui\":\"111111\",\"appId\":1,\"params\":{}},\"appEui\":\"111111\",\"appId\":1,\"lastMsgDt\":\"2022-11-06 00:00:00\",\"params\":{},\"runState\":\"0\",\"sensorId\":234,\"sensorType\":1,\"snId\":95,\"terminalEui\":\"123456789\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-12 10:22:13');
INSERT INTO `sys_oper_log` VALUES (543, '终端 ', 2, 'com.ruoyi.system.controller.LoraTerminalController.edit()', 'PUT', 1, 'admin', NULL, '/equ/terminal', '127.0.0.1', '内网IP', '{\"activeState\":\"0\",\"app\":{\"appEui\":\"333333\",\"appId\":1,\"params\":{}},\"appEui\":\"333333\",\"appId\":1,\"lastMsgDt\":\"2022-11-06 00:00:00\",\"params\":{},\"runState\":\"0\",\"sensorType\":0,\"snId\":101,\"terminalEui\":\"12346667\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-12 10:43:42');
INSERT INTO `sys_oper_log` VALUES (544, '终端 ', 2, 'com.ruoyi.system.controller.LoraTerminalController.edit()', 'PUT', 1, 'admin', NULL, '/equ/terminal', '127.0.0.1', '内网IP', '{\"activeState\":\"0\",\"app\":{\"appEui\":\"333333\",\"appId\":1,\"params\":{}},\"appEui\":\"333333\",\"appId\":1,\"lastMsgDt\":\"2022-11-06 00:00:00\",\"params\":{},\"runState\":\"0\",\"sensorId\":33,\"sensorType\":1,\"snId\":83,\"terminalEui\":\"123456789\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-12 10:45:25');
INSERT INTO `sys_oper_log` VALUES (545, '终端 ', 2, 'com.ruoyi.system.controller.LoraTerminalController.edit()', 'PUT', 1, 'admin', NULL, '/equ/terminal', '127.0.0.1', '内网IP', '{\"activeState\":\"0\",\"app\":{\"appEui\":\"111111\",\"appId\":1,\"params\":{}},\"appEui\":\"111111\",\"appId\":1,\"lastMsgDt\":\"2022-11-06 00:00:00\",\"params\":{},\"runState\":\"0\",\"sensorId\":435,\"sensorType\":1,\"snId\":96,\"terminalEui\":\"1234567891\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-12 10:48:19');
INSERT INTO `sys_oper_log` VALUES (546, '终端 ', 2, 'com.ruoyi.system.controller.LoraTerminalController.edit()', 'PUT', 1, 'admin', NULL, '/equ/terminal', '127.0.0.1', '内网IP', '{\"activeState\":\"0\",\"app\":{\"appEui\":\"333333\",\"appId\":1,\"params\":{}},\"appEui\":\"333333\",\"appId\":1,\"lastMsgDt\":\"2022-11-06 00:00:00\",\"params\":{},\"runState\":\"0\",\"sensorId\":33,\"sensorType\":1,\"snId\":83,\"terminalEui\":\"123456789\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-12 10:54:49');
INSERT INTO `sys_oper_log` VALUES (547, '终端 ', 1, 'com.ruoyi.system.controller.LoraTerminalController.add()', 'POST', 1, 'admin', NULL, '/equ/terminal', '127.0.0.1', '内网IP', '{\"params\":{},\"snId\":132}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-12 10:57:41');
INSERT INTO `sys_oper_log` VALUES (548, '终端 ', 1, 'com.ruoyi.system.controller.LoraTerminalController.add()', 'POST', 1, 'admin', NULL, '/equ/terminal', '127.0.0.1', '内网IP', '{\"params\":{},\"snId\":133}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-12 10:57:50');
INSERT INTO `sys_oper_log` VALUES (549, '终端 ', 1, 'com.ruoyi.system.controller.LoraTerminalController.add()', 'POST', 1, 'admin', NULL, '/equ/terminal', '127.0.0.1', '内网IP', '{\"params\":{},\"snId\":134}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-12 11:01:01');
INSERT INTO `sys_oper_log` VALUES (550, '终端 ', 1, 'com.ruoyi.system.controller.LoraTerminalController.add()', 'POST', 1, 'admin', NULL, '/equ/terminal', '127.0.0.1', '内网IP', '{\"params\":{},\"sensorId\":23,\"snId\":135,\"terminalEui\":\"234\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-12 11:11:47');
INSERT INTO `sys_oper_log` VALUES (551, '终端 ', 2, 'com.ruoyi.system.controller.LoraTerminalController.edit()', 'PUT', 1, 'admin', NULL, '/equ/terminal', '127.0.0.1', '内网IP', '{\"activeState\":\"0\",\"app\":{\"appEui\":\"333333\",\"appId\":1,\"params\":{}},\"appEui\":\"333333\",\"appId\":1,\"lastMsgDt\":\"2022-11-06 00:00:00\",\"params\":{},\"runState\":\"0\",\"sensorId\":33,\"sensorType\":1,\"snId\":83,\"terminalEui\":\"123456789\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-12 11:44:54');
INSERT INTO `sys_oper_log` VALUES (552, '终端 ', 2, 'com.ruoyi.system.controller.LoraTerminalController.edit()', 'PUT', 1, 'admin', NULL, '/equ/terminal', '127.0.0.1', '内网IP', '{\"activeState\":\"0\",\"app\":{\"appEui\":\"333333\",\"appId\":1,\"params\":{}},\"appEui\":\"333333\",\"appId\":1,\"lastMsgDt\":\"2022-11-06 00:00:00\",\"params\":{},\"runState\":\"0\",\"sensorId\":33,\"sensorType\":1,\"snId\":83,\"terminalEui\":\"123456789\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-12 11:45:16');
INSERT INTO `sys_oper_log` VALUES (553, '终端 ', 2, 'com.ruoyi.system.controller.LoraTerminalController.edit()', 'PUT', 1, 'admin', NULL, '/equ/terminal', '127.0.0.1', '内网IP', '{\"activeState\":\"0\",\"app\":{\"appEui\":\"111111\",\"appId\":1,\"params\":{}},\"appEui\":\"111111\",\"appId\":1,\"lastMsgDt\":\"2022-11-06 00:00:00\",\"params\":{},\"runState\":\"0\",\"sensorId\":435,\"sensorType\":1,\"snId\":96,\"terminalEui\":\"1234567891\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-12 11:48:21');
INSERT INTO `sys_oper_log` VALUES (554, '终端 ', 2, 'com.ruoyi.system.controller.LoraTerminalController.edit()', 'PUT', 1, 'admin', NULL, '/equ/terminal', '127.0.0.1', '内网IP', '{\"activeState\":\"0\",\"app\":{\"appEui\":\"333333\",\"appId\":1,\"params\":{}},\"appEui\":\"333333\",\"appId\":1,\"lastMsgDt\":\"2022-11-06 00:00:00\",\"params\":{},\"runState\":\"0\",\"sensorId\":33,\"sensorType\":1,\"snId\":83,\"terminalEui\":\"123456789\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-12 11:48:39');
INSERT INTO `sys_oper_log` VALUES (555, '终端 ', 2, 'com.ruoyi.system.controller.LoraTerminalController.edit()', 'PUT', 1, 'admin', NULL, '/equ/terminal', '127.0.0.1', '内网IP', '{\"activeState\":\"0\",\"app\":{\"appEui\":\"333333\",\"appId\":1,\"params\":{}},\"appEui\":\"333333\",\"appId\":1,\"lastMsgDt\":\"2022-11-06 00:00:00\",\"params\":{},\"runState\":\"0\",\"sensorId\":33,\"sensorType\":1,\"snId\":83,\"terminalEui\":\"123456789\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-12 16:58:57');
INSERT INTO `sys_oper_log` VALUES (556, '终端 ', 2, 'com.ruoyi.system.controller.LoraTerminalController.edit()', 'PUT', 1, 'admin', NULL, '/equ/terminal', '127.0.0.1', '内网IP', '{\"activeState\":\"0\",\"app\":{\"appEui\":\"111111\",\"appId\":1,\"params\":{}},\"appEui\":\"111111\",\"appId\":1,\"lastMsgDt\":\"2022-11-06 00:00:00\",\"params\":{},\"runState\":\"0\",\"sensorId\":234,\"sensorType\":1,\"snId\":95,\"terminalEui\":\"123456789\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-12 17:04:05');
INSERT INTO `sys_oper_log` VALUES (557, '终端 ', 2, 'com.ruoyi.system.controller.LoraTerminalController.edit()', 'PUT', 1, 'admin', NULL, '/equ/terminal', '127.0.0.1', '内网IP', '{\"activeState\":\"0\",\"app\":{\"appEui\":\"333333\",\"appId\":1,\"params\":{}},\"appEui\":\"333333\",\"appId\":1,\"lastMsgDt\":\"2022-11-06 00:00:00\",\"params\":{},\"runState\":\"0\",\"sensorId\":33,\"sensorType\":1,\"snId\":83,\"terminalEui\":\"123456789\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-12 17:04:36');
INSERT INTO `sys_oper_log` VALUES (558, '终端 ', 2, 'com.ruoyi.system.controller.LoraTerminalController.edit()', 'PUT', 1, 'admin', NULL, '/equ/terminal', '127.0.0.1', '内网IP', '{\"activeState\":\"0\",\"app\":{\"appEui\":\"111111\",\"appId\":1,\"params\":{}},\"appEui\":\"111111\",\"appId\":1,\"lastMsgDt\":\"2022-11-06 00:00:00\",\"params\":{},\"runState\":\"0\",\"sensorId\":234,\"sensorType\":1,\"snId\":95,\"terminalEui\":\"123456789\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-12 17:07:10');
INSERT INTO `sys_oper_log` VALUES (559, '终端 ', 2, 'com.ruoyi.system.controller.LoraTerminalController.edit()', 'PUT', 1, 'admin', NULL, '/equ/terminal', '127.0.0.1', '内网IP', '{\"activeState\":\"0\",\"app\":{\"appEui\":\"333333\",\"appId\":1,\"params\":{}},\"appEui\":\"333333\",\"appId\":1,\"lastMsgDt\":\"2022-11-06 00:00:00\",\"params\":{},\"runState\":\"0\",\"sensorId\":333,\"sensorType\":1,\"snId\":83,\"terminalEui\":\"123456789\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-12 17:10:57');
INSERT INTO `sys_oper_log` VALUES (560, '终端 ', 2, 'com.ruoyi.system.controller.LoraTerminalController.edit()', 'PUT', 1, 'admin', NULL, '/equ/terminal', '127.0.0.1', '内网IP', '{\"activeState\":\"0\",\"app\":{\"appEui\":\"333333\",\"appId\":1,\"params\":{}},\"appEui\":\"333333\",\"appId\":1,\"lastMsgDt\":\"2022-11-06 00:00:00\",\"params\":{},\"runState\":\"0\",\"sensorId\":333,\"sensorType\":1,\"snId\":83,\"terminalEui\":\"123456789\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-12 17:11:38');
INSERT INTO `sys_oper_log` VALUES (561, '终端 ', 2, 'com.ruoyi.system.controller.LoraTerminalController.edit()', 'PUT', 1, 'admin', NULL, '/equ/terminal', '127.0.0.1', '内网IP', '{\"activeState\":\"0\",\"app\":{\"appEui\":\"333333\",\"appId\":1,\"params\":{}},\"appEui\":\"333333\",\"appId\":1,\"lastMsgDt\":\"2022-11-06 00:00:00\",\"params\":{},\"runState\":\"0\",\"sensorId\":123,\"sensorType\":1,\"snId\":83,\"terminalEui\":\"123456789\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-12 17:11:51');
INSERT INTO `sys_oper_log` VALUES (562, '终端 ', 2, 'com.ruoyi.system.controller.LoraTerminalController.edit()', 'PUT', 1, 'admin', NULL, '/equ/terminal', '127.0.0.1', '内网IP', '{\"activeState\":\"0\",\"app\":{\"appEui\":\"333333\",\"appId\":1,\"params\":{}},\"appEui\":\"333333\",\"appId\":1,\"lastMsgDt\":\"2022-11-06 00:00:00\",\"params\":{},\"runState\":\"0\",\"sensorId\":1233,\"sensorType\":1,\"snId\":83,\"terminalEui\":\"123456789\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-12 17:12:08');
INSERT INTO `sys_oper_log` VALUES (563, '终端 ', 2, 'com.ruoyi.system.controller.LoraTerminalController.edit()', 'PUT', 1, 'admin', NULL, '/equ/terminal', '127.0.0.1', '内网IP', '{\"activeState\":\"0\",\"app\":{\"appEui\":\"333333\",\"appId\":1,\"params\":{}},\"appEui\":\"333333\",\"appId\":1,\"lastMsgDt\":\"2022-11-06 00:00:00\",\"params\":{},\"runState\":\"0\",\"sensorId\":1233,\"sensorType\":1,\"snId\":83,\"terminalEui\":\"123456789\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-12 17:15:41');
INSERT INTO `sys_oper_log` VALUES (564, '终端 ', 2, 'com.ruoyi.system.controller.LoraTerminalController.edit()', 'PUT', 1, 'admin', NULL, '/equ/terminal', '127.0.0.1', '内网IP', '{\"activeState\":\"0\",\"app\":{\"appEui\":\"333333\",\"appId\":1,\"params\":{}},\"appEui\":\"333333\",\"appId\":1,\"appName\":\"立体仓库\",\"lastMsgDt\":\"2022-11-06 00:00:00\",\"params\":{},\"runState\":\"0\",\"sensorId\":1233,\"sensorType\":1,\"snId\":83,\"terminalEui\":\"123456789\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-12 17:22:37');
INSERT INTO `sys_oper_log` VALUES (565, '终端 ', 2, 'com.ruoyi.system.controller.LoraTerminalController.edit()', 'PUT', 1, 'admin', NULL, '/equ/terminal', '127.0.0.1', '内网IP', '{\"activeState\":\"0\",\"app\":{\"appEui\":\"111111\",\"appId\":1,\"params\":{}},\"appEui\":\"111111\",\"appId\":1,\"appName\":\"RFID机器人\",\"lastMsgDt\":\"2022-11-06 00:00:00\",\"params\":{},\"runState\":\"0\",\"sensorId\":234,\"sensorType\":1,\"snId\":95,\"terminalEui\":\"123456789\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-12 17:23:36');
INSERT INTO `sys_oper_log` VALUES (566, '终端 ', 2, 'com.ruoyi.system.controller.LoraTerminalController.edit()', 'PUT', 1, 'admin', NULL, '/equ/terminal', '127.0.0.1', '内网IP', '{\"activeState\":\"0\",\"app\":{\"appEui\":\"333333\",\"appName\":\"立体仓库\",\"params\":{}},\"appEui\":\"333333\",\"appId\":1,\"appName\":\"RFID机器人\",\"lastMsgDt\":\"2022-11-06 00:00:00\",\"params\":{},\"runState\":\"0\",\"sensorId\":1233,\"sensorType\":1,\"snId\":83,\"terminalEui\":\"123456789\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-12 17:27:01');
INSERT INTO `sys_oper_log` VALUES (567, '终端 ', 2, 'com.ruoyi.system.controller.LoraTerminalController.edit()', 'PUT', 1, 'admin', NULL, '/equ/terminal', '127.0.0.1', '内网IP', '{\"activeState\":\"0\",\"app\":{\"appEui\":\"111111\",\"params\":{}},\"appEui\":\"111111\",\"appId\":1,\"appName\":\"立体仓库\",\"lastMsgDt\":\"2022-11-06 00:00:00\",\"params\":{},\"runState\":\"0\",\"sensorId\":435,\"sensorType\":1,\"snId\":96,\"terminalEui\":\"1234567891\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-12 17:28:13');
INSERT INTO `sys_oper_log` VALUES (568, '终端 ', 2, 'com.ruoyi.system.controller.LoraTerminalController.edit()', 'PUT', 1, 'admin', NULL, '/equ/terminal', '127.0.0.1', '内网IP', '{\"activeState\":\"0\",\"app\":{\"appEui\":\"333333\",\"appName\":\"RFID机器人\",\"params\":{}},\"appEui\":\"333333\",\"appId\":1,\"appName\":\"立体仓库\",\"lastMsgDt\":\"2022-11-06 00:00:00\",\"params\":{},\"runState\":\"0\",\"sensorId\":1233,\"sensorType\":1,\"snId\":83,\"terminalEui\":\"123456789\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-12 17:28:51');
INSERT INTO `sys_oper_log` VALUES (569, '终端 ', 2, 'com.ruoyi.system.controller.LoraTerminalController.edit()', 'PUT', 1, 'admin', NULL, '/equ/terminal', '127.0.0.1', '内网IP', '{\"activeState\":\"0\",\"app\":{\"appEui\":\"333333\",\"appName\":\"立体仓库\",\"params\":{}},\"appEui\":\"333333\",\"appId\":1,\"appName\":\"RFID机器人\",\"lastMsgDt\":\"2022-11-06 00:00:00\",\"params\":{},\"runState\":\"0\",\"sensorId\":1233,\"sensorType\":1,\"snId\":83,\"terminalEui\":\"123456789\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-12 17:30:47');
INSERT INTO `sys_oper_log` VALUES (570, '终端 ', 2, 'com.ruoyi.system.controller.LoraTerminalController.edit()', 'PUT', 1, 'admin', NULL, '/equ/terminal', '127.0.0.1', '内网IP', '{\"activeState\":\"0\",\"app\":{\"appEui\":\"222222\",\"appName\":\"RFID机器人\",\"params\":{}},\"appEui\":\"222222\",\"appId\":1,\"appName\":\"立体仓库\",\"lastMsgDt\":\"2022-11-06 00:00:00\",\"params\":{},\"runState\":\"0\",\"sensorId\":1233,\"sensorType\":1,\"snId\":83,\"terminalEui\":\"111111\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-12 17:48:36');
INSERT INTO `sys_oper_log` VALUES (571, '终端 ', 2, 'com.ruoyi.system.controller.LoraTerminalController.edit()', 'PUT', 1, 'admin', NULL, '/equ/terminal', '127.0.0.1', '内网IP', '{\"activeState\":\"0\",\"app\":{\"appEui\":\"222222\",\"appName\":\"立体仓库\",\"params\":{}},\"appEui\":\"222222\",\"appId\":1,\"appName\":\"RFID机器人\",\"lastMsgDt\":\"2022-11-06 00:00:00\",\"params\":{},\"runState\":\"0\",\"sensorId\":1233,\"sensorType\":1,\"snId\":83,\"terminalEui\":\"333333\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-12 17:51:42');
INSERT INTO `sys_oper_log` VALUES (572, '终端 ', 2, 'com.ruoyi.system.controller.LoraTerminalController.edit()', 'PUT', 1, 'admin', NULL, '/equ/terminal', '127.0.0.1', '内网IP', '{\"activeState\":\"0\",\"app\":{\"appEui\":\"222222\",\"appName\":\"RFID机器人\",\"params\":{}},\"appEui\":\"222222\",\"appId\":1,\"appName\":\"RFID机器人\",\"lastMsgDt\":\"2022-11-06 00:00:00\",\"params\":{},\"runState\":\"0\",\"sensorId\":1233,\"sensorType\":1,\"snId\":83,\"terminalEui\":\"333333\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-12 17:54:15');
INSERT INTO `sys_oper_log` VALUES (573, '终端 ', 2, 'com.ruoyi.system.controller.LoraTerminalController.edit()', 'PUT', 1, 'admin', NULL, '/equ/terminal', '127.0.0.1', '内网IP', '{\"activeState\":\"0\",\"app\":{\"appEui\":\"222222\",\"appName\":\"RFID机器人\",\"params\":{}},\"appEui\":\"222222\",\"appId\":1,\"appName\":\"立体仓库\",\"lastMsgDt\":\"2022-11-06 00:00:00\",\"params\":{},\"runState\":\"0\",\"sensorId\":1233,\"sensorType\":1,\"snId\":83,\"terminalEui\":\"111111\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-12 17:55:37');
INSERT INTO `sys_oper_log` VALUES (574, '终端 ', 2, 'com.ruoyi.system.controller.LoraTerminalController.edit()', 'PUT', 1, 'admin', NULL, '/equ/terminal', '127.0.0.1', '内网IP', '{\"activeState\":\"0\",\"app\":{\"appEui\":\"222222\",\"appName\":\"立体仓库\",\"params\":{}},\"appEui\":\"333333\",\"appId\":1,\"appName\":\"RFID机器人\",\"lastMsgDt\":\"2022-11-06 00:00:00\",\"params\":{},\"runState\":\"0\",\"sensorId\":1233,\"sensorType\":1,\"snId\":83,\"terminalEui\":\"111111\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-12 17:57:33');
INSERT INTO `sys_oper_log` VALUES (575, '终端 ', 2, 'com.ruoyi.system.controller.LoraTerminalController.edit()', 'PUT', 1, 'admin', NULL, '/equ/terminal', '127.0.0.1', '内网IP', '{\"activeState\":\"0\",\"app\":{\"appEui\":\"333333\",\"appName\":\"RFID机器人\",\"params\":{}},\"appEui\":\"333333\",\"appId\":1,\"appName\":\"234\",\"lastMsgDt\":\"2022-11-06 00:00:00\",\"params\":{},\"runState\":\"0\",\"sensorId\":1233,\"sensorType\":1,\"snId\":83,\"terminalEui\":\"111111\"}', '{\"msg\":\"没有该APP，请重试！\",\"code\":500}', 0, NULL, '2022-11-12 18:02:36');
INSERT INTO `sys_oper_log` VALUES (576, '应用', 3, 'com.ruoyi.system.controller.LoraAppController.remove()', 'DELETE', 1, 'admin', NULL, '/app/appManagement/66', '127.0.0.1', '内网IP', '{appIds=66}', NULL, 1, '1', '2022-11-13 10:20:05');
INSERT INTO `sys_oper_log` VALUES (577, '应用', 3, 'com.ruoyi.system.controller.LoraAppController.remove()', 'DELETE', 1, 'admin', NULL, '/app/appManagement/66', '127.0.0.1', '内网IP', '{appIds=66}', NULL, 1, '1', '2022-11-13 10:21:55');
INSERT INTO `sys_oper_log` VALUES (578, '应用', 3, 'com.ruoyi.system.controller.LoraAppController.remove()', 'DELETE', 1, 'admin', NULL, '/app/appManagement/66', '127.0.0.1', '内网IP', '{appIds=66}', NULL, 1, '1', '2022-11-13 10:22:00');
INSERT INTO `sys_oper_log` VALUES (579, '应用', 3, 'com.ruoyi.system.controller.LoraAppController.remove()', 'DELETE', 1, 'admin', NULL, '/app/appManagement/66', '127.0.0.1', '内网IP', '{appIds=66}', NULL, 1, '1', '2022-11-13 10:23:13');
INSERT INTO `sys_oper_log` VALUES (580, '应用', 3, 'com.ruoyi.system.controller.LoraAppController.remove()', 'DELETE', 1, 'admin', NULL, '/app/appManagement/66', '127.0.0.1', '内网IP', '{appIds=66}', NULL, 1, '1', '2022-11-13 10:23:31');
INSERT INTO `sys_oper_log` VALUES (581, '应用', 3, 'com.ruoyi.system.controller.LoraAppController.remove()', 'DELETE', 1, 'admin', NULL, '/app/appManagement/66', '127.0.0.1', '内网IP', '{appIds=66}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-13 10:24:27');
INSERT INTO `sys_oper_log` VALUES (582, '应用', 3, 'com.ruoyi.system.controller.LoraAppController.remove()', 'DELETE', 1, 'admin', NULL, '/app/appManagement/63', '127.0.0.1', '内网IP', '{appIds=63}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-13 10:26:45');
INSERT INTO `sys_oper_log` VALUES (583, 'App管理', 2, 'com.ruoyi.system.controller.LoraAppController.changeStatus()', 'PUT', 1, 'admin', NULL, '/app/appManagement/changeStatus', '127.0.0.1', '内网IP', '{\"appId\":3,\"authState\":\"1\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-13 10:28:29');
INSERT INTO `sys_oper_log` VALUES (584, 'App管理', 2, 'com.ruoyi.system.controller.LoraAppController.changeStatus()', 'PUT', 1, 'admin', NULL, '/app/appManagement/changeStatus', '127.0.0.1', '内网IP', '{\"appId\":3,\"authState\":\"0\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-13 10:28:30');
INSERT INTO `sys_oper_log` VALUES (585, '应用', 1, 'com.ruoyi.system.controller.LoraAppController.add()', 'POST', 1, 'admin', NULL, '/app/appManagement', '127.0.0.1', '内网IP', '{\"appEui\":\"555555\",\"appId\":67,\"appName\":\"电力机房\",\"authStarttime\":\"2022-11-16 00:00:00\",\"company\":\"ISIP\",\"managerName\":\"Tom\",\"params\":{},\"phone\":\"15275029511\",\"timeto\":\"2022-11-30 00:00:00\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-13 10:36:58');
INSERT INTO `sys_oper_log` VALUES (586, 'App管理', 2, 'com.ruoyi.system.controller.LoraAppController.changeStatus()', 'PUT', 1, 'admin', NULL, '/app/appManagement/changeStatus', '127.0.0.1', '内网IP', '{\"appId\":2,\"authState\":\"0\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-13 15:06:17');
INSERT INTO `sys_oper_log` VALUES (587, 'App管理', 2, 'com.ruoyi.system.controller.LoraAppController.changeStatus()', 'PUT', 1, 'admin', NULL, '/app/appManagement/changeStatus', '127.0.0.1', '内网IP', '{\"appId\":67,\"authState\":\"1\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-13 15:06:18');
INSERT INTO `sys_oper_log` VALUES (588, 'App管理', 2, 'com.ruoyi.system.controller.LoraAppController.changeStatus()', 'PUT', 1, 'admin', NULL, '/app/appManagement/changeStatus', '127.0.0.1', '内网IP', '{\"appId\":4,\"authState\":\"1\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-13 15:06:20');
INSERT INTO `sys_oper_log` VALUES (589, 'App管理', 2, 'com.ruoyi.system.controller.LoraAppController.changeStatus()', 'PUT', 1, 'admin', NULL, '/app/appManagement/changeStatus', '127.0.0.1', '内网IP', '{\"appId\":3,\"authState\":\"1\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-13 15:06:22');
INSERT INTO `sys_oper_log` VALUES (590, 'App管理', 2, 'com.ruoyi.system.controller.LoraAppController.changeStatus()', 'PUT', 1, 'admin', NULL, '/app/appManagement/changeStatus', '127.0.0.1', '内网IP', '{\"appId\":2,\"authState\":\"1\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-13 15:06:24');
INSERT INTO `sys_oper_log` VALUES (591, 'App管理', 2, 'com.ruoyi.system.controller.LoraAppController.changeStatus()', 'PUT', 1, 'admin', NULL, '/app/appManagement/changeStatus', '127.0.0.1', '内网IP', '{\"appId\":2,\"authState\":\"0\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-13 15:06:27');
INSERT INTO `sys_oper_log` VALUES (592, 'App管理', 2, 'com.ruoyi.system.controller.LoraAppController.changeStatus()', 'PUT', 1, 'admin', NULL, '/app/appManagement/changeStatus', '127.0.0.1', '内网IP', '{\"appId\":3,\"authState\":\"0\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-13 15:06:29');
INSERT INTO `sys_oper_log` VALUES (593, 'App管理', 2, 'com.ruoyi.system.controller.LoraAppController.changeStatus()', 'PUT', 1, 'admin', NULL, '/app/appManagement/changeStatus', '127.0.0.1', '内网IP', '{\"appId\":4,\"authState\":\"0\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-13 15:06:32');
INSERT INTO `sys_oper_log` VALUES (594, 'App管理', 2, 'com.ruoyi.system.controller.LoraAppController.changeStatus()', 'PUT', 1, 'admin', NULL, '/app/appManagement/changeStatus', '127.0.0.1', '内网IP', '{\"appId\":67,\"authState\":\"0\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-13 15:06:33');
INSERT INTO `sys_oper_log` VALUES (595, '终端 ', 3, 'com.ruoyi.system.controller.LoraTerminalController.remove()', 'DELETE', 1, 'admin', NULL, '/equ/terminal/132,133,134,135', '127.0.0.1', '内网IP', '{snIds=132,133,134,135}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-13 15:08:42');
INSERT INTO `sys_oper_log` VALUES (596, '应用', 3, 'com.ruoyi.system.controller.LoraAppController.remove()', 'DELETE', 1, 'admin', NULL, '/app/appManagement/1,2', '127.0.0.1', '内网IP', '{appIds=1,2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-13 15:16:15');
INSERT INTO `sys_oper_log` VALUES (597, '应用', 3, 'com.ruoyi.system.controller.LoraAppController.remove()', 'DELETE', 1, 'admin', NULL, '/app/appManagement/4', '127.0.0.1', '内网IP', '{appIds=4}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-13 15:16:19');
INSERT INTO `sys_oper_log` VALUES (598, 'App管理', 2, 'com.ruoyi.system.controller.LoraAppController.changeStatus()', 'PUT', 1, 'admin', NULL, '/app/appManagement/changeStatus', '127.0.0.1', '内网IP', '{\"appId\":3,\"authState\":\"1\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-14 10:26:44');
INSERT INTO `sys_oper_log` VALUES (599, 'App管理', 2, 'com.ruoyi.system.controller.LoraAppController.changeStatus()', 'PUT', 1, 'admin', NULL, '/app/appManagement/changeStatus', '127.0.0.1', '内网IP', '{\"appId\":3,\"authState\":\"0\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-14 10:26:48');
INSERT INTO `sys_oper_log` VALUES (600, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"terminal\",\"className\":\"LoraTerminal\",\"columns\":[{\"capJavaField\":\"SnId\",\"columnComment\":\"终端id\",\"columnId\":310,\"columnName\":\"sn_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2022-11-07 19:59:46\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"snId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":23,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Sn\",\"columnComment\":\"sn = terminalEUI + sensorID\",\"columnId\":311,\"columnName\":\"sn\",\"columnType\":\"varchar(0)\",\"createBy\":\"admin\",\"createTime\":\"2022-11-07 19:59:46\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"sn\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":23,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"TerminalEui\",\"columnComment\":\"lora终端出厂Eui\",\"columnId\":312,\"columnName\":\"terminal_eui\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2022-11-07 19:59:46\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"terminalEui\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":23,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"GatewayEui\",\"columnComment\":\"关联的网关eui\",\"columnId\":313,\"columnName\":\"gateway_eui\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2022-11-07 19:59:46\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"gatewayEui\",\"jav', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-16 13:08:53');
INSERT INTO `sys_oper_log` VALUES (601, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/23,24,25', '127.0.0.1', '内网IP', '{tableIds=23,24,25}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-17 11:15:03');
INSERT INTO `sys_oper_log` VALUES (602, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '\"lora_terminal\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-17 11:15:08');
INSERT INTO `sys_oper_log` VALUES (603, '应用', 2, 'com.ruoyi.system.controller.LoraAppController.edit()', 'PUT', 1, 'admin', NULL, '/app/appManagement', '127.0.0.1', '内网IP', '{\"appEui\":\"222222\",\"appId\":2,\"appName\":\"档案管理\",\"authStarttime\":\"2022-11-16 00:00:00\",\"authState\":\"0\",\"company\":\"ISIP\",\"createTime\":\"2022-10-04 15:25:07\",\"managerName\":\"Alexis\",\"params\":{},\"phone\":\"15325939402\",\"timeto\":\"2023-03-04 00:00:00\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-17 11:19:42');
INSERT INTO `sys_oper_log` VALUES (604, '应用', 2, 'com.ruoyi.system.controller.LoraAppController.edit()', 'PUT', 1, 'admin', NULL, '/app/appManagement', '127.0.0.1', '内网IP', '{\"appEui\":\"333333\",\"appId\":3,\"appName\":\"RFID机器人\",\"authStarttime\":\"2022-10-04 00:00:00\",\"authState\":\"0\",\"company\":\"ISIP\",\"createTime\":\"2022-10-04 15:25:07\",\"managerName\":\"Susilo\",\"params\":{},\"phone\":\"18991972999\",\"timeto\":\"2023-03-04 00:00:00\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-17 11:20:06');
INSERT INTO `sys_oper_log` VALUES (605, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '\"lora_loraterminal\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-21 12:03:20');
INSERT INTO `sys_oper_log` VALUES (606, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', NULL, '/tool/gen/synchDb/lora_loraterminal', '127.0.0.1', '内网IP', '{tableName=lora_loraterminal}', NULL, 1, '同步数据失败，原表结构不存在', '2022-11-21 12:13:34');
INSERT INTO `sys_oper_log` VALUES (607, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '\"lora_node\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-21 12:13:38');
INSERT INTO `sys_oper_log` VALUES (608, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/26,27,28', '127.0.0.1', '内网IP', '{tableIds=26,27,28}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-21 14:46:14');
INSERT INTO `sys_oper_log` VALUES (609, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '\"lora_node\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-21 14:46:22');
INSERT INTO `sys_oper_log` VALUES (610, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/29', '127.0.0.1', '内网IP', '{tableIds=29}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-21 15:12:22');
INSERT INTO `sys_oper_log` VALUES (611, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '\"lora_node\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-21 15:12:30');
INSERT INTO `sys_oper_log` VALUES (612, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"\",\"createTime\":\"2022-11-05 16:14:03\",\"icon\":\"bug\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2084,\"menuName\":\"网关管理\",\"menuType\":\"M\",\"orderNum\":3,\"params\":{},\"parentId\":0,\"path\":\"gateway\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-21 16:18:26');
INSERT INTO `sys_oper_log` VALUES (613, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"\",\"createTime\":\"2022-11-05 16:14:03\",\"icon\":\"bug\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2084,\"menuName\":\"网关管理\",\"menuType\":\"M\",\"orderNum\":3,\"params\":{},\"parentId\":0,\"path\":\"gateway\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-21 16:18:26');
INSERT INTO `sys_oper_log` VALUES (614, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"\",\"createTime\":\"2022-11-05 16:14:03\",\"icon\":\"bug\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2084,\"menuName\":\"网关管理\",\"menuType\":\"M\",\"orderNum\":3,\"params\":{},\"parentId\":0,\"path\":\"gateway\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-21 16:18:26');
INSERT INTO `sys_oper_log` VALUES (615, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"equ/gateway/topology\",\"createBy\":\"admin\",\"icon\":\"404\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"网关拓扑\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2084,\"path\":\"topology\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-21 16:19:05');
INSERT INTO `sys_oper_log` VALUES (616, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"equ/gateway/index\",\"createBy\":\"admin\",\"icon\":\"cascader\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"网关数据\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2084,\"path\":\"index\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-21 16:19:39');
INSERT INTO `sys_oper_log` VALUES (617, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/30', '127.0.0.1', '内网IP', '{tableIds=30}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-21 20:40:17');
INSERT INTO `sys_oper_log` VALUES (618, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '\"lora_node\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-21 20:40:23');
INSERT INTO `sys_oper_log` VALUES (619, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '\"login_return\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-22 19:23:12');
INSERT INTO `sys_oper_log` VALUES (620, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/31,32', '127.0.0.1', '内网IP', '{tableIds=31,32}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-23 09:03:34');
INSERT INTO `sys_oper_log` VALUES (621, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '\"login_return\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-23 09:03:37');
INSERT INTO `sys_oper_log` VALUES (622, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', NULL, '/tool/gen/synchDb/login_return', '127.0.0.1', '内网IP', '{tableName=login_return}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-23 09:04:10');
INSERT INTO `sys_oper_log` VALUES (623, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', NULL, '/tool/gen/synchDb/login_return', '127.0.0.1', '内网IP', '{tableName=login_return}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-23 10:32:49');
INSERT INTO `sys_oper_log` VALUES (624, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '\"lora_node\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-23 11:03:36');
INSERT INTO `sys_oper_log` VALUES (625, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', NULL, '/tool/gen/synchDb/login_return', '127.0.0.1', '内网IP', '{tableName=login_return}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-23 11:10:01');
INSERT INTO `sys_oper_log` VALUES (626, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '\"lora_terminal\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-23 11:26:35');
INSERT INTO `sys_oper_log` VALUES (627, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', NULL, '/tool/gen/synchDb/login_return', '127.0.0.1', '内网IP', '{tableName=login_return}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-25 13:55:17');

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '岗位信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2022-09-27 21:29:42', '', NULL, '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2022-09-27 21:29:42', '', NULL, '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2022-09-27 21:29:42', '', NULL, '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2022-09-27 21:29:42', '', NULL, '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2022-09-27 21:29:42', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', 1, 1, '0', '0', 'admin', '2022-09-27 21:29:42', '', NULL, '普通角色');
INSERT INTO `sys_role` VALUES (100, 'test', '2', 3, '1', 0, 1, '0', '0', 'admin', '2022-10-09 11:52:02', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `dept_id` bigint NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和部门关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (2, 100);
INSERT INTO `sys_role_dept` VALUES (2, 101);
INSERT INTO `sys_role_dept` VALUES (2, 105);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2);
INSERT INTO `sys_role_menu` VALUES (2, 3);
INSERT INTO `sys_role_menu` VALUES (2, 4);
INSERT INTO `sys_role_menu` VALUES (2, 100);
INSERT INTO `sys_role_menu` VALUES (2, 101);
INSERT INTO `sys_role_menu` VALUES (2, 102);
INSERT INTO `sys_role_menu` VALUES (2, 103);
INSERT INTO `sys_role_menu` VALUES (2, 104);
INSERT INTO `sys_role_menu` VALUES (2, 105);
INSERT INTO `sys_role_menu` VALUES (2, 106);
INSERT INTO `sys_role_menu` VALUES (2, 107);
INSERT INTO `sys_role_menu` VALUES (2, 108);
INSERT INTO `sys_role_menu` VALUES (2, 109);
INSERT INTO `sys_role_menu` VALUES (2, 110);
INSERT INTO `sys_role_menu` VALUES (2, 111);
INSERT INTO `sys_role_menu` VALUES (2, 112);
INSERT INTO `sys_role_menu` VALUES (2, 113);
INSERT INTO `sys_role_menu` VALUES (2, 114);
INSERT INTO `sys_role_menu` VALUES (2, 115);
INSERT INTO `sys_role_menu` VALUES (2, 116);
INSERT INTO `sys_role_menu` VALUES (2, 117);
INSERT INTO `sys_role_menu` VALUES (2, 500);
INSERT INTO `sys_role_menu` VALUES (2, 501);
INSERT INTO `sys_role_menu` VALUES (2, 1000);
INSERT INTO `sys_role_menu` VALUES (2, 1001);
INSERT INTO `sys_role_menu` VALUES (2, 1002);
INSERT INTO `sys_role_menu` VALUES (2, 1003);
INSERT INTO `sys_role_menu` VALUES (2, 1004);
INSERT INTO `sys_role_menu` VALUES (2, 1005);
INSERT INTO `sys_role_menu` VALUES (2, 1006);
INSERT INTO `sys_role_menu` VALUES (2, 1007);
INSERT INTO `sys_role_menu` VALUES (2, 1008);
INSERT INTO `sys_role_menu` VALUES (2, 1009);
INSERT INTO `sys_role_menu` VALUES (2, 1010);
INSERT INTO `sys_role_menu` VALUES (2, 1011);
INSERT INTO `sys_role_menu` VALUES (2, 1012);
INSERT INTO `sys_role_menu` VALUES (2, 1013);
INSERT INTO `sys_role_menu` VALUES (2, 1014);
INSERT INTO `sys_role_menu` VALUES (2, 1015);
INSERT INTO `sys_role_menu` VALUES (2, 1016);
INSERT INTO `sys_role_menu` VALUES (2, 1017);
INSERT INTO `sys_role_menu` VALUES (2, 1018);
INSERT INTO `sys_role_menu` VALUES (2, 1019);
INSERT INTO `sys_role_menu` VALUES (2, 1020);
INSERT INTO `sys_role_menu` VALUES (2, 1021);
INSERT INTO `sys_role_menu` VALUES (2, 1022);
INSERT INTO `sys_role_menu` VALUES (2, 1023);
INSERT INTO `sys_role_menu` VALUES (2, 1024);
INSERT INTO `sys_role_menu` VALUES (2, 1025);
INSERT INTO `sys_role_menu` VALUES (2, 1026);
INSERT INTO `sys_role_menu` VALUES (2, 1027);
INSERT INTO `sys_role_menu` VALUES (2, 1028);
INSERT INTO `sys_role_menu` VALUES (2, 1029);
INSERT INTO `sys_role_menu` VALUES (2, 1030);
INSERT INTO `sys_role_menu` VALUES (2, 1031);
INSERT INTO `sys_role_menu` VALUES (2, 1032);
INSERT INTO `sys_role_menu` VALUES (2, 1033);
INSERT INTO `sys_role_menu` VALUES (2, 1034);
INSERT INTO `sys_role_menu` VALUES (2, 1035);
INSERT INTO `sys_role_menu` VALUES (2, 1036);
INSERT INTO `sys_role_menu` VALUES (2, 1037);
INSERT INTO `sys_role_menu` VALUES (2, 1038);
INSERT INTO `sys_role_menu` VALUES (2, 1039);
INSERT INTO `sys_role_menu` VALUES (2, 1040);
INSERT INTO `sys_role_menu` VALUES (2, 1041);
INSERT INTO `sys_role_menu` VALUES (2, 1042);
INSERT INTO `sys_role_menu` VALUES (2, 1043);
INSERT INTO `sys_role_menu` VALUES (2, 1044);
INSERT INTO `sys_role_menu` VALUES (2, 1045);
INSERT INTO `sys_role_menu` VALUES (2, 1046);
INSERT INTO `sys_role_menu` VALUES (2, 1047);
INSERT INTO `sys_role_menu` VALUES (2, 1048);
INSERT INTO `sys_role_menu` VALUES (2, 1049);
INSERT INTO `sys_role_menu` VALUES (2, 1050);
INSERT INTO `sys_role_menu` VALUES (2, 1051);
INSERT INTO `sys_role_menu` VALUES (2, 1052);
INSERT INTO `sys_role_menu` VALUES (2, 1053);
INSERT INTO `sys_role_menu` VALUES (2, 1054);
INSERT INTO `sys_role_menu` VALUES (2, 1055);
INSERT INTO `sys_role_menu` VALUES (2, 1056);
INSERT INTO `sys_role_menu` VALUES (2, 1057);
INSERT INTO `sys_role_menu` VALUES (2, 1058);
INSERT INTO `sys_role_menu` VALUES (2, 1059);
INSERT INTO `sys_role_menu` VALUES (2, 1060);
INSERT INTO `sys_role_menu` VALUES (100, 1);
INSERT INTO `sys_role_menu` VALUES (100, 2);
INSERT INTO `sys_role_menu` VALUES (100, 3);
INSERT INTO `sys_role_menu` VALUES (100, 4);
INSERT INTO `sys_role_menu` VALUES (100, 100);
INSERT INTO `sys_role_menu` VALUES (100, 101);
INSERT INTO `sys_role_menu` VALUES (100, 102);
INSERT INTO `sys_role_menu` VALUES (100, 103);
INSERT INTO `sys_role_menu` VALUES (100, 104);
INSERT INTO `sys_role_menu` VALUES (100, 105);
INSERT INTO `sys_role_menu` VALUES (100, 106);
INSERT INTO `sys_role_menu` VALUES (100, 107);
INSERT INTO `sys_role_menu` VALUES (100, 108);
INSERT INTO `sys_role_menu` VALUES (100, 109);
INSERT INTO `sys_role_menu` VALUES (100, 110);
INSERT INTO `sys_role_menu` VALUES (100, 111);
INSERT INTO `sys_role_menu` VALUES (100, 112);
INSERT INTO `sys_role_menu` VALUES (100, 113);
INSERT INTO `sys_role_menu` VALUES (100, 114);
INSERT INTO `sys_role_menu` VALUES (100, 115);
INSERT INTO `sys_role_menu` VALUES (100, 116);
INSERT INTO `sys_role_menu` VALUES (100, 117);
INSERT INTO `sys_role_menu` VALUES (100, 500);
INSERT INTO `sys_role_menu` VALUES (100, 501);
INSERT INTO `sys_role_menu` VALUES (100, 1000);
INSERT INTO `sys_role_menu` VALUES (100, 1001);
INSERT INTO `sys_role_menu` VALUES (100, 1002);
INSERT INTO `sys_role_menu` VALUES (100, 1003);
INSERT INTO `sys_role_menu` VALUES (100, 1004);
INSERT INTO `sys_role_menu` VALUES (100, 1005);
INSERT INTO `sys_role_menu` VALUES (100, 1006);
INSERT INTO `sys_role_menu` VALUES (100, 1007);
INSERT INTO `sys_role_menu` VALUES (100, 1008);
INSERT INTO `sys_role_menu` VALUES (100, 1009);
INSERT INTO `sys_role_menu` VALUES (100, 1010);
INSERT INTO `sys_role_menu` VALUES (100, 1011);
INSERT INTO `sys_role_menu` VALUES (100, 1012);
INSERT INTO `sys_role_menu` VALUES (100, 1013);
INSERT INTO `sys_role_menu` VALUES (100, 1014);
INSERT INTO `sys_role_menu` VALUES (100, 1015);
INSERT INTO `sys_role_menu` VALUES (100, 1016);
INSERT INTO `sys_role_menu` VALUES (100, 1017);
INSERT INTO `sys_role_menu` VALUES (100, 1018);
INSERT INTO `sys_role_menu` VALUES (100, 1019);
INSERT INTO `sys_role_menu` VALUES (100, 1020);
INSERT INTO `sys_role_menu` VALUES (100, 1021);
INSERT INTO `sys_role_menu` VALUES (100, 1022);
INSERT INTO `sys_role_menu` VALUES (100, 1023);
INSERT INTO `sys_role_menu` VALUES (100, 1024);
INSERT INTO `sys_role_menu` VALUES (100, 1025);
INSERT INTO `sys_role_menu` VALUES (100, 1026);
INSERT INTO `sys_role_menu` VALUES (100, 1027);
INSERT INTO `sys_role_menu` VALUES (100, 1028);
INSERT INTO `sys_role_menu` VALUES (100, 1029);
INSERT INTO `sys_role_menu` VALUES (100, 1030);
INSERT INTO `sys_role_menu` VALUES (100, 1031);
INSERT INTO `sys_role_menu` VALUES (100, 1032);
INSERT INTO `sys_role_menu` VALUES (100, 1033);
INSERT INTO `sys_role_menu` VALUES (100, 1034);
INSERT INTO `sys_role_menu` VALUES (100, 1035);
INSERT INTO `sys_role_menu` VALUES (100, 1036);
INSERT INTO `sys_role_menu` VALUES (100, 1037);
INSERT INTO `sys_role_menu` VALUES (100, 1038);
INSERT INTO `sys_role_menu` VALUES (100, 1039);
INSERT INTO `sys_role_menu` VALUES (100, 1040);
INSERT INTO `sys_role_menu` VALUES (100, 1041);
INSERT INTO `sys_role_menu` VALUES (100, 1042);
INSERT INTO `sys_role_menu` VALUES (100, 1043);
INSERT INTO `sys_role_menu` VALUES (100, 1044);
INSERT INTO `sys_role_menu` VALUES (100, 1045);
INSERT INTO `sys_role_menu` VALUES (100, 1046);
INSERT INTO `sys_role_menu` VALUES (100, 1047);
INSERT INTO `sys_role_menu` VALUES (100, 1048);
INSERT INTO `sys_role_menu` VALUES (100, 1049);
INSERT INTO `sys_role_menu` VALUES (100, 1050);
INSERT INTO `sys_role_menu` VALUES (100, 1051);
INSERT INTO `sys_role_menu` VALUES (100, 1052);
INSERT INTO `sys_role_menu` VALUES (100, 1053);
INSERT INTO `sys_role_menu` VALUES (100, 1054);
INSERT INTO `sys_role_menu` VALUES (100, 1055);
INSERT INTO `sys_role_menu` VALUES (100, 1056);
INSERT INTO `sys_role_menu` VALUES (100, 1057);
INSERT INTO `sys_role_menu` VALUES (100, 1058);
INSERT INTO `sys_role_menu` VALUES (100, 1059);
INSERT INTO `sys_role_menu` VALUES (100, 1060);
INSERT INTO `sys_role_menu` VALUES (100, 2001);
INSERT INTO `sys_role_menu` VALUES (100, 2002);
INSERT INTO `sys_role_menu` VALUES (100, 2004);
INSERT INTO `sys_role_menu` VALUES (100, 2005);
INSERT INTO `sys_role_menu` VALUES (100, 2006);
INSERT INTO `sys_role_menu` VALUES (100, 2007);
INSERT INTO `sys_role_menu` VALUES (100, 2008);
INSERT INTO `sys_role_menu` VALUES (100, 2028);
INSERT INTO `sys_role_menu` VALUES (100, 2029);
INSERT INTO `sys_role_menu` VALUES (100, 2030);
INSERT INTO `sys_role_menu` VALUES (100, 2031);
INSERT INTO `sys_role_menu` VALUES (100, 2032);
INSERT INTO `sys_role_menu` VALUES (100, 2033);
INSERT INTO `sys_role_menu` VALUES (100, 2034);
INSERT INTO `sys_role_menu` VALUES (100, 2041);
INSERT INTO `sys_role_menu` VALUES (100, 2060);
INSERT INTO `sys_role_menu` VALUES (100, 2062);
INSERT INTO `sys_role_menu` VALUES (100, 2063);
INSERT INTO `sys_role_menu` VALUES (100, 2064);
INSERT INTO `sys_role_menu` VALUES (100, 2065);
INSERT INTO `sys_role_menu` VALUES (100, 2066);
INSERT INTO `sys_role_menu` VALUES (100, 2067);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime(0) NULL DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '若依', '00', 'ry@163.com', '15888888888', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2022-11-28 15:31:00', 'admin', '2022-09-27 21:29:42', '', '2022-11-28 15:31:00', '管理员');
INSERT INTO `sys_user` VALUES (2, 105, 'ry', 'XXN', '00', 'ry@qq.com', '15666666666', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '2', '127.0.0.1', '2022-09-27 21:29:42', 'admin', '2022-09-27 21:29:42', 'admin', '2022-10-01 00:23:26', '测试员');
INSERT INTO `sys_user` VALUES (100, 105, 'LWW18', 'Weiwang', '00', '', '15229200311', '0', '', '$2a$10$UuTDwlnSKBGYhI0zHAu50.Yw.9.BmJ5xyb/odGnS210017HYrhtiK', '0', '2', '', NULL, 'admin', '2022-10-09 11:51:16', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `post_id` bigint NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户和角色关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (1, 100);

SET FOREIGN_KEY_CHECKS = 1;
