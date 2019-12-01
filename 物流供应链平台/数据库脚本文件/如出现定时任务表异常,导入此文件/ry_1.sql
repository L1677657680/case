/*
 Navicat MySQL Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80016
 Source Host           : localhost:3306
 Source Schema         : ry

 Target Server Type    : MySQL
 Target Server Version : 80016
 File Encoding         : 65001

 Date: 04/07/2019 11:48:06
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for apply
-- ----------------------------
DROP TABLE IF EXISTS `apply`;
CREATE TABLE `apply`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '申请订单id',
  `apply_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '申请订单编号',
  `create_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `info` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '申请信息，成功或是失败的反馈信息',
  `status` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态 0-已融资放款 1-正在申请 2-待审核 3-不合规则 4-待确认签章 5-审批不通过 6-已签章 7-待放款 8-不予放款 9-待撤销签章 10-已撤销',
  `sum` decimal(15, 2) NULL DEFAULT NULL COMMENT '申请金额',
  `loan_time` datetime(0) NULL DEFAULT NULL COMMENT '放款时间',
  `loan_account` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '放款账号',
  `bank_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '融资银行',
  `bank_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '融资银行名称',
  `shipper` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '托运方',
  `carrier` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '物流企业',
  `account_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '户名',
  `open_bank` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '开户行',
  `factoring_sum` decimal(15, 2) NULL DEFAULT NULL COMMENT '保理金额',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `apply_id_UNIQUE`(`apply_id`) USING BTREE COMMENT '申请订单编号的索引'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '申请订单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of apply
-- ----------------------------
INSERT INTO `apply` VALUES ('2d18575337a0337f8899a679cf84a352', '4f7a8a46-208d-48e2-a1e1-dfd9ea2e7cb0', '广西北部湾弘信供应链管理有限公司', '2019-07-02 22:27:34', 'tongsheng', '2019-07-04 10:26:49', NULL, '4', 10000.00, NULL, NULL, '200', '广西通盛融资租赁有限公司', '广西投资集团银海铝业有限公司', '广西北部湾弘信供应链管理有限公司', NULL, NULL, 14734.92);

-- ----------------------------
-- Table structure for apply_orders
-- ----------------------------
DROP TABLE IF EXISTS `apply_orders`;
CREATE TABLE `apply_orders`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '申请与订单关联表id',
  `apply_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '申请表编号',
  `orders_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单表编号',
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '申请表与订单表的关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of apply_orders
-- ----------------------------
INSERT INTO `apply_orders` VALUES ('ffb67c944e3f2bc94d793557dc719659', '4f7a8a46-208d-48e2-a1e1-dfd9ea2e7cb0', '7d949f13-2607-4d3d-a7d9-2c3ae8945455', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单编号',
  `number` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单号',
  `carrier_license_number` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '承运人营业执照',
  `carrier_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '承运人名称',
  `shipper_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '托运人名称',
  `start_area` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '起点',
  `end_area` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '终点',
  `count` decimal(15, 4) NULL DEFAULT NULL COMMENT '订单量',
  `product_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '货物名称',
  `contract_number` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '合同编号',
  `cost` decimal(12, 2) NULL DEFAULT NULL COMMENT '订单应收费用',
  `status` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态 新订单, 已完成, 已作废, 异常订单, 调度中',
  `arrival_count` decimal(15, 4) NULL DEFAULT NULL COMMENT '运输完成量',
  `no_transport_count` decimal(15, 4) NULL DEFAULT NULL COMMENT '未完成量',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('7d949f13-2607-4d3d-a7d9-2c3ae8945455', 'YHA19060697', '91450100564040622F', '广西北部湾弘信供应链管理有限公司', '广西投资集团银海铝业有限公司', '德保', '来宾', 959.4500, '氧化铝', 'YHA-SWWL(2019)006', 14734.92, '调度中', 144.1500, 815.3000, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for orders_waybills
-- ----------------------------
DROP TABLE IF EXISTS `orders_waybills`;
CREATE TABLE `orders_waybills`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '运单与订单关联表id',
  `waybills_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '运单表编号',
  `orders_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单表编号',
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单表与运单表的中间关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders_waybills
-- ----------------------------
INSERT INTO `orders_waybills` VALUES ('0311125f952e56fbcf3129d36f70e1d0', '493e7073-94e1-4eca-9410-773b50c5d598', '7d949f13-2607-4d3d-a7d9-2c3ae8945455', NULL, NULL, NULL, NULL);
INSERT INTO `orders_waybills` VALUES ('200d7856fe8acdbfbb4cd718fb1f9fa4', '0644e4d9-4a7e-4c3b-9db0-73ded570be8e', '7d949f13-2607-4d3d-a7d9-2c3ae8945455', NULL, NULL, NULL, NULL);
INSERT INTO `orders_waybills` VALUES ('221b88c59ae2b6702ee79cbb3c7f325e', '102e26f8-a121-4e59-95e6-ac9005f1bfa2', '7d949f13-2607-4d3d-a7d9-2c3ae8945455', NULL, NULL, NULL, NULL);
INSERT INTO `orders_waybills` VALUES ('2a60c560e5a0fbc13d224800e116748f', 'fb2f40a1-6fd6-4775-b071-8fc10118156a', '7d949f13-2607-4d3d-a7d9-2c3ae8945455', NULL, NULL, NULL, NULL);
INSERT INTO `orders_waybills` VALUES ('37c3e0ebb845da6bd129cec0bbc1ba09', 'bb7e082f-485d-455e-8639-c2c5811211bb', '7d949f13-2607-4d3d-a7d9-2c3ae8945455', NULL, NULL, NULL, NULL);
INSERT INTO `orders_waybills` VALUES ('3b096a2890aa29beacec1e7e3042053d', '38ae4279-72d7-4e35-b258-50fb8286f9c0', '7d949f13-2607-4d3d-a7d9-2c3ae8945455', NULL, NULL, NULL, NULL);
INSERT INTO `orders_waybills` VALUES ('4ef68d3dd7ce6af4809e04f3cf02f8af', 'cf8f08d4-a77c-492b-83a0-4ebc2521d8f4', '7d949f13-2607-4d3d-a7d9-2c3ae8945455', NULL, NULL, NULL, NULL);
INSERT INTO `orders_waybills` VALUES ('593d44dfe736f0561ae659f6b101ec9f', '6faa009f-5219-4eff-ac74-94a893c8cba7', '7d949f13-2607-4d3d-a7d9-2c3ae8945455', NULL, NULL, NULL, NULL);
INSERT INTO `orders_waybills` VALUES ('622320a8ff55e06a73a1e793f1d71d2f', 'c0917b97-857f-42d9-a4df-5512f180674b', '7d949f13-2607-4d3d-a7d9-2c3ae8945455', NULL, NULL, NULL, NULL);
INSERT INTO `orders_waybills` VALUES ('8d42960f646bc8e731100b0d743f2e64', '4739c034-1f28-4f78-afe3-0b92b1db72a9', '7d949f13-2607-4d3d-a7d9-2c3ae8945455', NULL, NULL, NULL, NULL);
INSERT INTO `orders_waybills` VALUES ('9152fceb53d601bc97b7ff14958e19c3', '6e53b8e6-3d65-4e56-ba2a-3ff2ce8a8a80', '7d949f13-2607-4d3d-a7d9-2c3ae8945455', NULL, NULL, NULL, NULL);
INSERT INTO `orders_waybills` VALUES ('9362f558665a60718c812c4427848f16', '83c32f32-762b-419a-9454-3db4863a08d1', '7d949f13-2607-4d3d-a7d9-2c3ae8945455', NULL, NULL, NULL, NULL);
INSERT INTO `orders_waybills` VALUES ('a22827cdf9e0766b62c547e12370f643', 'e43c81a2-19c5-44f6-8984-f0ab3ab72f33', '7d949f13-2607-4d3d-a7d9-2c3ae8945455', NULL, NULL, NULL, NULL);
INSERT INTO `orders_waybills` VALUES ('ad7206f815e11f62100fac2033acf4bb', '79aeb65f-fb47-48a8-93c4-1b6fa64b6be6', '7d949f13-2607-4d3d-a7d9-2c3ae8945455', NULL, NULL, NULL, NULL);
INSERT INTO `orders_waybills` VALUES ('ada6850fe2ab0a81c97638caae230fb3', 'ab868839-118b-4f56-8847-4bf5d704b622', '7d949f13-2607-4d3d-a7d9-2c3ae8945455', NULL, NULL, NULL, NULL);
INSERT INTO `orders_waybills` VALUES ('b73e3ce126b4bc7722c27cbfefe72403', 'de2e7afa-5749-4f72-8947-2c1b2444c486', '7d949f13-2607-4d3d-a7d9-2c3ae8945455', NULL, NULL, NULL, NULL);
INSERT INTO `orders_waybills` VALUES ('c6ad308f59bb03912e96dcc4a67e2c0e', '3c2f3c16-0a82-44fd-badd-fc628b031c83', '7d949f13-2607-4d3d-a7d9-2c3ae8945455', NULL, NULL, NULL, NULL);
INSERT INTO `orders_waybills` VALUES ('c8bc4e36688cf58aef8ddac3d7497462', 'cf142daf-a27e-48e3-9548-602737ca88b0', '7d949f13-2607-4d3d-a7d9-2c3ae8945455', NULL, NULL, NULL, NULL);
INSERT INTO `orders_waybills` VALUES ('cbfbad869aff389a3728837596c833c7', '96e18190-8170-4c82-9ffb-e92d2a612568', '7d949f13-2607-4d3d-a7d9-2c3ae8945455', NULL, NULL, NULL, NULL);
INSERT INTO `orders_waybills` VALUES ('de82680d8f7551a42d87e93d71fb2153', '8e8773f1-a864-4148-8779-5d95977d97f5', '7d949f13-2607-4d3d-a7d9-2c3ae8945455', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '参数配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '初始化密码 123456');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
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
) ENGINE = InnoDB AUTO_INCREMENT = 203 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '供应链金融服务云平台', 0, '', '', '', '0', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2019-06-26 05:24:30');
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '平台管理', 1, '', '', '', '0', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2019-06-25 01:22:47');
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '长沙分公司', 2, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '管理', 1, '', '', '', '0', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2019-06-25 01:22:47');
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '测试部门', 3, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES (200, 100, '0,100', '广西通盛融资租赁有限公司', 2, '', '', '', '0', '0', 'admin', '2019-06-25 01:11:48', 'admin', '2019-06-26 05:24:30');
INSERT INTO `sys_dept` VALUES (202, 200, '0,100,200', '审核', 1, NULL, NULL, NULL, '0', '0', 'admin', '2019-06-25 01:34:51', '', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(4) NULL DEFAULT 0 COMMENT '字典排序',
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
) ENGINE = InnoDB AUTO_INCREMENT = 111 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统默认是');
INSERT INTO `sys_dict_data` VALUES (11, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统默认否');
INSERT INTO `sys_dict_data` VALUES (12, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知');
INSERT INTO `sys_dict_data` VALUES (13, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '公告');
INSERT INTO `sys_dict_data` VALUES (14, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES (15, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '关闭状态');
INSERT INTO `sys_dict_data` VALUES (16, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '新增操作');
INSERT INTO `sys_dict_data` VALUES (17, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '修改操作');
INSERT INTO `sys_dict_data` VALUES (18, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '删除操作');
INSERT INTO `sys_dict_data` VALUES (19, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '授权操作');
INSERT INTO `sys_dict_data` VALUES (20, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '导出操作');
INSERT INTO `sys_dict_data` VALUES (21, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '导入操作');
INSERT INTO `sys_dict_data` VALUES (22, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '强退操作');
INSERT INTO `sys_dict_data` VALUES (23, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '生成操作');
INSERT INTO `sys_dict_data` VALUES (24, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '清空操作');
INSERT INTO `sys_dict_data` VALUES (25, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES (26, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '停用状态');
INSERT INTO `sys_dict_data` VALUES (100, 0, '已融资放款', '0', 'apply_status', '', 'success', 'Y', '0', 'admin', '2019-06-21 09:00:31', 'admin', '2019-06-25 05:51:58', '');
INSERT INTO `sys_dict_data` VALUES (101, 1, '正在申请', '1', 'apply_status', '', 'warning', 'Y', '0', 'admin', '2019-06-21 09:02:15', 'admin', '2019-06-25 05:53:29', '');
INSERT INTO `sys_dict_data` VALUES (102, 2, '待审核', '2', 'apply_status', '', 'warning', 'Y', '0', 'admin', '2019-06-21 09:02:40', 'admin', '2019-06-25 05:53:24', '');
INSERT INTO `sys_dict_data` VALUES (103, 3, '不合规则', '3', 'apply_status', '', 'danger', 'Y', '0', 'admin', '2019-06-21 09:02:55', 'admin', '2019-06-25 05:53:34', '');
INSERT INTO `sys_dict_data` VALUES (104, 4, '待确认签章', '4', 'apply_status', '', 'warning', 'Y', '0', 'admin', '2019-06-21 09:03:53', 'admin', '2019-06-25 05:53:55', '');
INSERT INTO `sys_dict_data` VALUES (105, 5, '审批不通过', '5', 'apply_status', '', 'danger', 'Y', '0', 'admin', '2019-06-21 09:04:08', 'admin', '2019-06-25 05:52:27', '');
INSERT INTO `sys_dict_data` VALUES (106, 6, '已签章', '6', 'apply_status', '', 'success', 'Y', '0', 'admin', '2019-06-21 09:04:22', 'admin', '2019-06-25 05:54:03', '');
INSERT INTO `sys_dict_data` VALUES (107, 7, '待放款', '7', 'apply_status', '', 'warning', 'Y', '0', 'admin', '2019-06-21 09:04:38', 'admin', '2019-06-25 05:54:12', '');
INSERT INTO `sys_dict_data` VALUES (108, 8, '不予放款', '8', 'apply_status', '', 'danger', 'Y', '0', 'admin', '2019-06-21 09:04:57', 'admin', '2019-06-25 05:52:33', '');
INSERT INTO `sys_dict_data` VALUES (109, 9, '待撤销签章', '9', 'apply_status', '', 'warning', 'Y', '0', 'admin', '2019-06-21 09:05:22', 'admin', '2019-06-25 05:54:29', '');
INSERT INTO `sys_dict_data` VALUES (110, 10, '已撤销', '10', 'apply_status', '', 'success', 'Y', '0', 'admin', '2019-06-21 09:05:37', 'admin', '2019-06-25 05:54:24', '');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
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
) ENGINE = InnoDB AUTO_INCREMENT = 101 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '系统是否', 'sys_yes_no', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (6, '通知类型', 'sys_notice_type', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知状态', 'sys_notice_status', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (8, '操作类型', 'sys_oper_type', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (9, '系统状态', 'sys_common_status', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '登录状态列表');
INSERT INTO `sys_dict_type` VALUES (100, '申请状态', 'apply_status', '0', 'admin', '2019-06-21 08:59:33', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '任务组名',
  `method_name` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '任务方法',
  `method_params` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '方法参数',
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
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务调度表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, 'ryTask', '系统默认（无参）', 'ryNoParams', '', '0/10 * * * * ?', '3', '1', '1', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_job` VALUES (2, 'ryTask', '系统默认（有参）', 'ryParams', 'ry', '0/20 * * * * ?', '3', '1', '1', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务组名',
  `method_name` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务方法',
  `method_params` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '方法参数',
  `job_message` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `login_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录账号',
  `ipaddr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime(0) NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 239 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (100, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-06-21 02:13:40');
INSERT INTO `sys_logininfor` VALUES (101, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-06-21 02:14:25');
INSERT INTO `sys_logininfor` VALUES (102, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-06-21 02:14:56');
INSERT INTO `sys_logininfor` VALUES (103, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-06-21 02:15:46');
INSERT INTO `sys_logininfor` VALUES (104, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-06-21 02:58:21');
INSERT INTO `sys_logininfor` VALUES (105, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-06-21 03:00:54');
INSERT INTO `sys_logininfor` VALUES (106, 'ry', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-06-21 03:01:04');
INSERT INTO `sys_logininfor` VALUES (107, 'ry', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-06-21 03:09:32');
INSERT INTO `sys_logininfor` VALUES (108, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-06-21 03:09:36');
INSERT INTO `sys_logininfor` VALUES (109, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-06-21 03:11:00');
INSERT INTO `sys_logininfor` VALUES (110, 'ry', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-06-21 03:11:09');
INSERT INTO `sys_logininfor` VALUES (111, 'ry', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-06-21 03:12:34');
INSERT INTO `sys_logininfor` VALUES (112, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-06-21 03:12:39');
INSERT INTO `sys_logininfor` VALUES (113, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-06-21 03:54:46');
INSERT INTO `sys_logininfor` VALUES (114, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-06-21 04:27:24');
INSERT INTO `sys_logininfor` VALUES (115, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-06-21 04:27:29');
INSERT INTO `sys_logininfor` VALUES (116, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-06-21 06:02:32');
INSERT INTO `sys_logininfor` VALUES (117, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-06-21 06:06:16');
INSERT INTO `sys_logininfor` VALUES (118, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-06-21 06:14:55');
INSERT INTO `sys_logininfor` VALUES (119, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-06-21 06:16:28');
INSERT INTO `sys_logininfor` VALUES (120, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-06-21 06:16:33');
INSERT INTO `sys_logininfor` VALUES (121, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-06-21 07:07:01');
INSERT INTO `sys_logininfor` VALUES (122, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-06-21 07:35:41');
INSERT INTO `sys_logininfor` VALUES (123, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-06-21 08:08:31');
INSERT INTO `sys_logininfor` VALUES (124, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-06-24 02:49:38');
INSERT INTO `sys_logininfor` VALUES (125, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-06-25 00:58:04');
INSERT INTO `sys_logininfor` VALUES (126, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-06-25 04:57:58');
INSERT INTO `sys_logininfor` VALUES (127, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-06-25 04:58:02');
INSERT INTO `sys_logininfor` VALUES (128, 'tongsheng', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-06-25 04:58:13');
INSERT INTO `sys_logininfor` VALUES (129, 'tongsheng', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-06-25 04:58:36');
INSERT INTO `sys_logininfor` VALUES (130, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-06-25 04:58:41');
INSERT INTO `sys_logininfor` VALUES (131, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-06-25 05:46:56');
INSERT INTO `sys_logininfor` VALUES (132, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-06-25 06:34:30');
INSERT INTO `sys_logininfor` VALUES (133, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-06-25 06:35:13');
INSERT INTO `sys_logininfor` VALUES (134, 'tongsheng', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-06-25 06:35:22');
INSERT INTO `sys_logininfor` VALUES (135, 'tongsheng', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-06-25 06:35:26');
INSERT INTO `sys_logininfor` VALUES (136, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-06-25 06:35:32');
INSERT INTO `sys_logininfor` VALUES (137, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-06-25 06:56:57');
INSERT INTO `sys_logininfor` VALUES (138, 'tongsheng', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-06-25 06:57:06');
INSERT INTO `sys_logininfor` VALUES (139, 'tongsheng', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-06-25 06:57:28');
INSERT INTO `sys_logininfor` VALUES (140, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-06-25 06:57:32');
INSERT INTO `sys_logininfor` VALUES (141, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-06-25 06:57:59');
INSERT INTO `sys_logininfor` VALUES (142, 'tongsheng', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-06-25 06:58:12');
INSERT INTO `sys_logininfor` VALUES (143, 'tongsheng', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-06-25 07:12:58');
INSERT INTO `sys_logininfor` VALUES (144, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-06-25 07:13:02');
INSERT INTO `sys_logininfor` VALUES (145, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-06-25 07:26:02');
INSERT INTO `sys_logininfor` VALUES (146, 'tongsheng', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-06-25 07:26:18');
INSERT INTO `sys_logininfor` VALUES (147, 'tongsheng', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-06-25 07:26:21');
INSERT INTO `sys_logininfor` VALUES (148, 'tongsheng', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-06-25 07:26:33');
INSERT INTO `sys_logininfor` VALUES (149, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-06-25 07:26:42');
INSERT INTO `sys_logininfor` VALUES (150, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-06-25 07:27:23');
INSERT INTO `sys_logininfor` VALUES (151, 'tongsheng', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-06-25 07:27:33');
INSERT INTO `sys_logininfor` VALUES (152, 'tongsheng', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-06-25 07:27:43');
INSERT INTO `sys_logininfor` VALUES (153, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-06-25 07:27:47');
INSERT INTO `sys_logininfor` VALUES (154, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-06-25 07:27:56');
INSERT INTO `sys_logininfor` VALUES (155, 'tongsheng', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-06-25 07:28:05');
INSERT INTO `sys_logininfor` VALUES (156, 'tongsheng', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-06-25 09:10:48');
INSERT INTO `sys_logininfor` VALUES (157, 'tongsheng', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-06-25 09:20:20');
INSERT INTO `sys_logininfor` VALUES (158, 'tongsheng', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-06-25 09:34:59');
INSERT INTO `sys_logininfor` VALUES (159, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-06-25 16:36:26');
INSERT INTO `sys_logininfor` VALUES (160, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-06-25 16:36:32');
INSERT INTO `sys_logininfor` VALUES (161, 'tongsheng', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-06-26 02:32:18');
INSERT INTO `sys_logininfor` VALUES (162, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-06-26 03:13:02');
INSERT INTO `sys_logininfor` VALUES (163, 'tongsheng', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-06-26 03:13:11');
INSERT INTO `sys_logininfor` VALUES (164, 'tongsheng', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-06-26 03:16:18');
INSERT INTO `sys_logininfor` VALUES (165, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-06-26 04:57:38');
INSERT INTO `sys_logininfor` VALUES (166, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-06-26 04:57:42');
INSERT INTO `sys_logininfor` VALUES (167, 'tongsheng', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-06-26 04:57:54');
INSERT INTO `sys_logininfor` VALUES (168, 'tongsheng', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-06-26 05:10:48');
INSERT INTO `sys_logininfor` VALUES (169, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-06-26 05:10:52');
INSERT INTO `sys_logininfor` VALUES (170, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-06-26 05:12:45');
INSERT INTO `sys_logininfor` VALUES (171, 'tongsheng', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-06-26 05:12:53');
INSERT INTO `sys_logininfor` VALUES (172, 'tongsheng', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-06-26 05:12:58');
INSERT INTO `sys_logininfor` VALUES (173, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-06-26 05:23:32');
INSERT INTO `sys_logininfor` VALUES (174, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-06-26 05:23:37');
INSERT INTO `sys_logininfor` VALUES (175, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '密码输入错误1次', '2019-06-26 05:23:53');
INSERT INTO `sys_logininfor` VALUES (176, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-06-26 05:23:59');
INSERT INTO `sys_logininfor` VALUES (177, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-06-26 05:25:54');
INSERT INTO `sys_logininfor` VALUES (178, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-06-26 05:30:04');
INSERT INTO `sys_logininfor` VALUES (179, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-06-26 05:32:38');
INSERT INTO `sys_logininfor` VALUES (180, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-06-26 06:32:32');
INSERT INTO `sys_logininfor` VALUES (181, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '密码输入错误1次', '2019-06-26 08:27:18');
INSERT INTO `sys_logininfor` VALUES (182, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-06-26 08:27:35');
INSERT INTO `sys_logininfor` VALUES (183, 'tongsheng', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-06-26 09:23:17');
INSERT INTO `sys_logininfor` VALUES (184, 'tongsheng', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-06-27 01:51:25');
INSERT INTO `sys_logininfor` VALUES (185, 'tongsheng', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-06-27 02:47:19');
INSERT INTO `sys_logininfor` VALUES (186, 'tongsheng', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-06-27 03:02:13');
INSERT INTO `sys_logininfor` VALUES (187, 'tongsheng', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-06-27 03:20:55');
INSERT INTO `sys_logininfor` VALUES (188, 'tongsheng', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-06-27 05:31:05');
INSERT INTO `sys_logininfor` VALUES (189, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-06-27 06:14:56');
INSERT INTO `sys_logininfor` VALUES (190, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-06-27 07:12:55');
INSERT INTO `sys_logininfor` VALUES (191, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-06-27 08:02:33');
INSERT INTO `sys_logininfor` VALUES (192, 'tongsheng', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-06-27 08:02:40');
INSERT INTO `sys_logininfor` VALUES (193, 'tongsheng', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-06-27 08:03:46');
INSERT INTO `sys_logininfor` VALUES (194, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '密码输入错误1次', '2019-06-27 08:03:54');
INSERT INTO `sys_logininfor` VALUES (195, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-06-27 08:04:04');
INSERT INTO `sys_logininfor` VALUES (196, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-06-27 08:05:58');
INSERT INTO `sys_logininfor` VALUES (197, 'tongsheng', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-06-27 08:06:06');
INSERT INTO `sys_logininfor` VALUES (198, 'tongsheng', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-06-27 08:06:55');
INSERT INTO `sys_logininfor` VALUES (199, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-06-27 08:13:20');
INSERT INTO `sys_logininfor` VALUES (200, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-06-27 08:13:24');
INSERT INTO `sys_logininfor` VALUES (201, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-06-27 08:42:12');
INSERT INTO `sys_logininfor` VALUES (202, 'tongsheng', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-06-27 08:42:18');
INSERT INTO `sys_logininfor` VALUES (203, 'tongsheng', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-06-27 08:42:27');
INSERT INTO `sys_logininfor` VALUES (204, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-06-27 08:42:41');
INSERT INTO `sys_logininfor` VALUES (205, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-06-27 08:43:22');
INSERT INTO `sys_logininfor` VALUES (206, 'tongsheng', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-06-27 08:43:28');
INSERT INTO `sys_logininfor` VALUES (207, 'tongsheng', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-06-27 09:58:38');
INSERT INTO `sys_logininfor` VALUES (208, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-06-27 09:58:49');
INSERT INTO `sys_logininfor` VALUES (209, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-06-27 10:01:33');
INSERT INTO `sys_logininfor` VALUES (210, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '密码输入错误1次', '2019-06-27 14:09:52');
INSERT INTO `sys_logininfor` VALUES (211, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-06-27 14:10:01');
INSERT INTO `sys_logininfor` VALUES (212, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-06-27 15:05:00');
INSERT INTO `sys_logininfor` VALUES (213, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-06-27 15:51:21');
INSERT INTO `sys_logininfor` VALUES (214, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-06-27 16:05:34');
INSERT INTO `sys_logininfor` VALUES (215, 'tongsheng', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-06-27 16:05:43');
INSERT INTO `sys_logininfor` VALUES (216, 'tongsheng', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-06-27 16:06:38');
INSERT INTO `sys_logininfor` VALUES (217, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-06-27 16:07:08');
INSERT INTO `sys_logininfor` VALUES (218, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-06-27 16:07:19');
INSERT INTO `sys_logininfor` VALUES (219, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-06-27 16:07:42');
INSERT INTO `sys_logininfor` VALUES (220, 'tongsheng', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-06-27 16:07:51');
INSERT INTO `sys_logininfor` VALUES (221, 'tongsheng', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-06-28 03:41:11');
INSERT INTO `sys_logininfor` VALUES (222, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-06-28 06:13:13');
INSERT INTO `sys_logininfor` VALUES (223, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-06-28 06:20:02');
INSERT INTO `sys_logininfor` VALUES (224, 'tongsheng', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-06-28 06:20:10');
INSERT INTO `sys_logininfor` VALUES (225, 'tongsheng', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-06-28 06:21:35');
INSERT INTO `sys_logininfor` VALUES (226, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-06-28 06:21:44');
INSERT INTO `sys_logininfor` VALUES (227, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-06-28 06:21:57');
INSERT INTO `sys_logininfor` VALUES (228, 'tongsheng', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-06-28 06:22:08');
INSERT INTO `sys_logininfor` VALUES (229, 'tongsheng', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-06-28 06:22:51');
INSERT INTO `sys_logininfor` VALUES (230, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-06-28 06:22:58');
INSERT INTO `sys_logininfor` VALUES (231, 'tongsheng', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-06-28 07:00:10');
INSERT INTO `sys_logininfor` VALUES (232, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-07-01 01:09:52');
INSERT INTO `sys_logininfor` VALUES (233, 'tongsheng', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-07-01 09:20:07');
INSERT INTO `sys_logininfor` VALUES (234, 'tongsheng', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-07-02 03:37:24');
INSERT INTO `sys_logininfor` VALUES (235, 'tongsheng', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-07-02 06:14:31');
INSERT INTO `sys_logininfor` VALUES (236, 'tongsheng', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-07-02 06:25:26');
INSERT INTO `sys_logininfor` VALUES (237, 'tongsheng', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-07-02 06:32:25');
INSERT INTO `sys_logininfor` VALUES (238, 'tongsheng', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-07-02 14:48:12');
INSERT INTO `sys_logininfor` VALUES (239, 'tongsheng', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-07-03 06:09:56');
INSERT INTO `sys_logininfor` VALUES (240, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '密码输入错误1次', '2019-07-03 06:53:51');
INSERT INTO `sys_logininfor` VALUES (241, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-07-03 06:54:00');
INSERT INTO `sys_logininfor` VALUES (242, 'admin', '10.65.0.5', '内网IP', 'Chrome Mobile', 'Android Mobile', '0', '登录成功', '2019-07-04 02:05:06');
INSERT INTO `sys_logininfor` VALUES (243, 'admin', '10.65.0.5', '内网IP', 'Internet Explorer 11', 'Windows 10', '0', '登录成功', '2019-07-04 02:22:54');
INSERT INTO `sys_logininfor` VALUES (244, 'admin', '10.65.0.5', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-07-04 02:25:36');
INSERT INTO `sys_logininfor` VALUES (245, 'tongsheng', '10.65.0.5', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-07-04 02:25:58');
INSERT INTO `sys_logininfor` VALUES (246, 'tongsheng', '10.65.0.5', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-07-04 02:26:05');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
  `url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '#' COMMENT '请求地址',
  `target` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '打开方式（menuItem页签 menuBlank新窗口）',
  `menu_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `perms` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2023 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, '#', '', 'M', '0', '', 'fa fa-gear', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 2, '#', '', 'M', '0', '', 'fa fa-video-camera', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 3, '#', '', 'M', '0', '', 'fa fa-bars', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统工具目录');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 2, '/system/user', '', 'C', '0', 'system:user:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2019-06-27 07:52:41', '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, '/system/role', '', 'C', '0', 'system:role:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, '/system/menu', '', 'C', '0', 'system:menu:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, '/system/dept', '', 'C', '0', 'system:dept:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, '/system/post', '', 'C', '0', 'system:post:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, '/system/dict', '', 'C', '0', 'system:dict:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, '/system/config', '', 'C', '0', 'system:config:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, '/system/notice', '', 'C', '0', 'system:notice:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, '#', '', 'M', '0', '', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, '/monitor/online', '', 'C', '0', 'monitor:online:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, '/monitor/job', '', 'C', '0', 'monitor:job:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 3, '/monitor/data', '', 'C', '0', 'monitor:data:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '数据监控菜单');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 3, '/monitor/server', '', 'C', '0', 'monitor:server:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '服务监控菜单');
INSERT INTO `sys_menu` VALUES (113, '表单构建', 3, 1, '/tool/build', '', 'C', '0', 'tool:build:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '表单构建菜单');
INSERT INTO `sys_menu` VALUES (114, '代码生成', 3, 2, '/tool/gen', '', 'C', '0', 'tool:gen:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '代码生成菜单');
INSERT INTO `sys_menu` VALUES (115, '系统接口', 3, 3, '/tool/swagger', '', 'C', '0', 'tool:swagger:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, '/monitor/operlog', '', 'C', '0', 'monitor:operlog:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, '/monitor/logininfor', '', 'C', '0', 'monitor:logininfor:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1000, '用户查询', 100, 1, '#', '', 'F', '0', 'system:user:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1001, '用户新增', 100, 2, '#', '', 'F', '0', 'system:user:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1002, '用户修改', 100, 3, '#', '', 'F', '0', 'system:user:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1003, '用户删除', 100, 4, '#', '', 'F', '0', 'system:user:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1004, '用户导出', 100, 5, '#', '', 'F', '0', 'system:user:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1005, '用户导入', 100, 6, '#', '', 'F', '0', 'system:user:import', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1006, '重置密码', 100, 7, '#', '', 'F', '0', 'system:user:resetPwd', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1007, '角色查询', 101, 1, '#', '', 'F', '0', 'system:role:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1008, '角色新增', 101, 2, '#', '', 'F', '0', 'system:role:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1009, '角色修改', 101, 3, '#', '', 'F', '0', 'system:role:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1010, '角色删除', 101, 4, '#', '', 'F', '0', 'system:role:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1011, '角色导出', 101, 5, '#', '', 'F', '0', 'system:role:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1012, '菜单查询', 102, 1, '#', '', 'F', '0', 'system:menu:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1013, '菜单新增', 102, 2, '#', '', 'F', '0', 'system:menu:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1014, '菜单修改', 102, 3, '#', '', 'F', '0', 'system:menu:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1015, '菜单删除', 102, 4, '#', '', 'F', '0', 'system:menu:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1016, '部门查询', 103, 1, '#', '', 'F', '0', 'system:dept:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1017, '部门新增', 103, 2, '#', '', 'F', '0', 'system:dept:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1018, '部门修改', 103, 3, '#', '', 'F', '0', 'system:dept:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1019, '部门删除', 103, 4, '#', '', 'F', '0', 'system:dept:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1020, '岗位查询', 104, 1, '#', '', 'F', '0', 'system:post:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1021, '岗位新增', 104, 2, '#', '', 'F', '0', 'system:post:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1022, '岗位修改', 104, 3, '#', '', 'F', '0', 'system:post:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1023, '岗位删除', 104, 4, '#', '', 'F', '0', 'system:post:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1024, '岗位导出', 104, 5, '#', '', 'F', '0', 'system:post:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1025, '字典查询', 105, 1, '#', '', 'F', '0', 'system:dict:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1026, '字典新增', 105, 2, '#', '', 'F', '0', 'system:dict:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1027, '字典修改', 105, 3, '#', '', 'F', '0', 'system:dict:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1028, '字典删除', 105, 4, '#', '', 'F', '0', 'system:dict:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1029, '字典导出', 105, 5, '#', '', 'F', '0', 'system:dict:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1030, '参数查询', 106, 1, '#', '', 'F', '0', 'system:config:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1031, '参数新增', 106, 2, '#', '', 'F', '0', 'system:config:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1032, '参数修改', 106, 3, '#', '', 'F', '0', 'system:config:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1033, '参数删除', 106, 4, '#', '', 'F', '0', 'system:config:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1034, '参数导出', 106, 5, '#', '', 'F', '0', 'system:config:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1035, '公告查询', 107, 1, '#', '', 'F', '0', 'system:notice:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1036, '公告新增', 107, 2, '#', '', 'F', '0', 'system:notice:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1037, '公告修改', 107, 3, '#', '', 'F', '0', 'system:notice:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1038, '公告删除', 107, 4, '#', '', 'F', '0', 'system:notice:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1039, '操作查询', 500, 1, '#', '', 'F', '0', 'monitor:operlog:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1040, '操作删除', 500, 2, '#', '', 'F', '0', 'monitor:operlog:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1041, '详细信息', 500, 3, '#', '', 'F', '0', 'monitor:operlog:detail', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1042, '日志导出', 500, 4, '#', '', 'F', '0', 'monitor:operlog:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1043, '登录查询', 501, 1, '#', '', 'F', '0', 'monitor:logininfor:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1044, '登录删除', 501, 2, '#', '', 'F', '0', 'monitor:logininfor:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1045, '日志导出', 501, 3, '#', '', 'F', '0', 'monitor:logininfor:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', '', 'F', '0', 'monitor:online:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', '', 'F', '0', 'monitor:online:batchForceLogout', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', '', 'F', '0', 'monitor:online:forceLogout', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1049, '任务查询', 110, 1, '#', '', 'F', '0', 'monitor:job:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1050, '任务新增', 110, 2, '#', '', 'F', '0', 'monitor:job:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1051, '任务修改', 110, 3, '#', '', 'F', '0', 'monitor:job:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1052, '任务删除', 110, 4, '#', '', 'F', '0', 'monitor:job:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1053, '状态修改', 110, 5, '#', '', 'F', '0', 'monitor:job:changeStatus', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1054, '任务详细', 110, 6, '#', '', 'F', '0', 'monitor:job:detail', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1055, '任务导出', 110, 7, '#', '', 'F', '0', 'monitor:job:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1056, '生成查询', 114, 1, '#', '', 'F', '0', 'tool:gen:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1057, '生成代码', 114, 2, '#', '', 'F', '0', 'tool:gen:code', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (2000, '申请订单', 1, 1, '/apply', '', 'C', '0', 'platform:apply:view', '#', 'admin', '2018-03-01 00:00:00', 'admin', '2019-06-21 03:59:31', '申请订单菜单');
INSERT INTO `sys_menu` VALUES (2001, '申请订单查询', 2000, 1, '#', '', 'F', '0', 'platform:apply:list', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2003, '申请订单修改', 2000, 3, '#', '', 'F', '0', 'platform:apply:edit', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2004, '申请订单删除', 2000, 4, '#', '', 'F', '0', 'platform:apply:remove', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2005, '申请管理', 1, 1, '/apply/check', '', 'C', '0', 'platform:apply:checkview', '#', 'admin', '2019-06-25 06:13:51', 'admin', '2019-06-25 06:34:59', '');
INSERT INTO `sys_menu` VALUES (2006, '详细', 2005, 2, '#', '', 'F', '0', 'platform:apply:detail', '#', 'admin', '2019-06-25 06:16:41', 'admin', '2019-06-25 07:27:22', '');
INSERT INTO `sys_menu` VALUES (2007, '查询', 2005, 1, '#', '', 'F', '0', 'platform:apply:checklist', '#', 'admin', '2019-06-25 07:27:13', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2008, '订单列表', 1, 1, '/apply/orders', '', 'C', '0', 'platform:orders:view', '#', 'admin', '2018-03-01 00:00:00', 'admin', '2019-06-27 07:52:23', '订单菜单');
INSERT INTO `sys_menu` VALUES (2009, '订单查询', 2008, 1, '#', '', 'F', '0', 'platform:orders:list', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2013, '运单列表', 1, 1, '/apply/waybills', '', 'C', '0', 'platform:waybills:view', '#', 'admin', '2018-03-01 00:00:00', 'admin', '2019-06-27 07:52:07', '运单菜单');
INSERT INTO `sys_menu` VALUES (2014, '运单查询', 2013, 1, '#', '', 'F', '0', 'platform:waybills:list', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2018, '导出', 2013, 2, '#', '', 'F', '0', 'platform:waybills:export', '#', 'admin', '2019-06-27 08:04:56', 'admin', '2019-06-27 08:05:39', '');
INSERT INTO `sys_menu` VALUES (2019, '导出', 2008, 2, '#', '', 'F', '0', 'platform:orders:export', '#', 'admin', '2019-06-27 08:05:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2020, '详细', 2008, 3, '#', '', 'F', '0', 'platform:orders:detail', '#', 'admin', '2019-06-27 08:30:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2021, '详细', 2013, 3, '#', '', 'F', '0', 'platform:waybills:detail', '#', 'admin', '2019-06-27 14:30:20', '', NULL, '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '通知公告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int(2) NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '方法名称',
  `operator_type` int(1) NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求参数',
  `status` int(1) NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime(0) NULL DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 505 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (100, '角色管理', 2, 'com.ruoyi.project.system.role.controller.RoleController.editSave()', 1, 'admin', '研发部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"2\"],\"roleName\":[\"普通角色\"],\"roleKey\":[\"common\"],\"roleSort\":[\"2\"],\"status\":[\"0\"],\"remark\":[\"普通角色\"],\"menuIds\":[\"1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,1042,501,1043,1044,1045\"]}', 0, NULL, '2019-06-21 03:00:21');
INSERT INTO `sys_oper_log` VALUES (101, '重置密码', 2, 'com.ruoyi.project.system.user.controller.UserController.resetPwd()', 1, 'admin', '研发部门', '/system/user/resetPwd/2', '127.0.0.1', '内网IP', '{}', 0, NULL, '2019-06-21 03:00:42');
INSERT INTO `sys_oper_log` VALUES (102, '重置密码', 2, 'com.ruoyi.project.system.user.controller.UserController.resetPwd()', 1, 'admin', '研发部门', '/system/user/resetPwd', '127.0.0.1', '内网IP', '{\"userId\":[\"2\"],\"loginName\":[\"ry\"],\"password\":[\"123456\"]}', 0, NULL, '2019-06-21 03:00:49');
INSERT INTO `sys_oper_log` VALUES (103, '角色管理', 2, 'com.ruoyi.project.system.role.controller.RoleController.editSave()', 1, 'admin', '研发部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"2\"],\"roleName\":[\"普通角色\"],\"roleKey\":[\"common\"],\"roleSort\":[\"2\"],\"status\":[\"0\"],\"remark\":[\"普通角色\"],\"menuIds\":[\"1,100,1000,1006,107,1035,1036,1037,1038\"]}', 0, NULL, '2019-06-21 03:10:57');
INSERT INTO `sys_oper_log` VALUES (104, '代码生成', 8, 'com.ruoyi.project.tool.gen.controller.GenController.genCode()', 1, 'admin', '研发部门', '/tool/gen/genCode/apply', '127.0.0.1', '内网IP', '{}', 0, NULL, '2019-06-21 03:13:05');
INSERT INTO `sys_oper_log` VALUES (105, '菜单管理', 2, 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2000\"],\"parentId\":[\"1\"],\"menuType\":[\"C\"],\"menuName\":[\"申请订单\"],\"url\":[\"/platform/apply\"],\"perms\":[\"platform:apply:view\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', 0, NULL, '2019-06-21 03:59:31');
INSERT INTO `sys_oper_log` VALUES (106, '用户管理', 5, 'com.ruoyi.project.system.user.controller.UserController.export()', 1, 'admin', '研发部门', '/system/user/export', '127.0.0.1', '内网IP', '{\"deptId\":[\"\"],\"parentId\":[\"\"],\"loginName\":[\"\"],\"phonenumber\":[\"\"],\"status\":[\"\"],\"params[beginTime]\":[\"\"],\"params[endTime]\":[\"\"]}', 0, NULL, '2019-06-21 06:45:37');
INSERT INTO `sys_oper_log` VALUES (107, '申请订单', 3, 'com.ruoyi.project.platform.apply.controller.ApplyController.remove()', 1, 'admin', '研发部门', '/apply/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"1\"]}', 0, NULL, '2019-06-21 07:35:58');
INSERT INTO `sys_oper_log` VALUES (108, '申请订单', 1, 'com.ruoyi.project.platform.apply.controller.ApplyController.addSave()', 1, 'admin', '研发部门', '/apply/add', '127.0.0.1', '内网IP', '{\"applyId\":[\"1\"],\"info\":[\"1\"],\"status\":[\"1\"],\"sum\":[\"1\"],\"loanTime\":[\"2019-06-21\"],\"loanAccount\":[\"1\"]}', 0, NULL, '2019-06-21 07:46:52');
INSERT INTO `sys_oper_log` VALUES (109, '申请订单', 3, 'com.ruoyi.project.platform.apply.controller.ApplyController.remove()', 1, 'admin', NULL, '/apply/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"5439fcf23e92caffc391fb8eac33b86f\"]}', 1, '\r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Truncated incorrect DOUBLE value: \'5439fcf23e92caffc391fb8eac33b86f\'\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: DELETE FROM apply WHERE id IN (   ?  )\r\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Truncated incorrect DOUBLE value: \'5439fcf23e92caffc391fb8eac33b86f\'\n; Data truncation: Truncated incorrect DOUBLE value: \'5439fcf23e92caffc391fb8eac33b86f\'; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Truncated incorrect DOUBLE value: \'5439fcf23e92caffc391fb8eac33b86f\'', '2019-06-21 08:05:42');
INSERT INTO `sys_oper_log` VALUES (110, '申请订单', 3, 'com.ruoyi.project.platform.apply.controller.ApplyController.remove()', 1, 'admin', NULL, '/apply/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"5439fcf23e92caffc391fb8eac33b86f\"]}', 1, '\r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Truncated incorrect DOUBLE value: \'5439fcf23e92caffc391fb8eac33b86f\'\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: DELETE FROM apply WHERE id IN (   ?  )\r\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Truncated incorrect DOUBLE value: \'5439fcf23e92caffc391fb8eac33b86f\'\n; Data truncation: Truncated incorrect DOUBLE value: \'5439fcf23e92caffc391fb8eac33b86f\'; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Truncated incorrect DOUBLE value: \'5439fcf23e92caffc391fb8eac33b86f\'', '2019-06-21 08:05:42');
INSERT INTO `sys_oper_log` VALUES (111, '申请订单', 3, 'com.ruoyi.project.platform.apply.controller.ApplyController.remove()', 1, 'admin', NULL, '/apply/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"5439fcf23e92caffc391fb8eac33b86f\"]}', 1, '\r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Truncated incorrect DOUBLE value: \'5439fcf23e92caffc391fb8eac33b86f\'\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: DELETE FROM apply WHERE id IN (   ?  )\r\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Truncated incorrect DOUBLE value: \'5439fcf23e92caffc391fb8eac33b86f\'\n; Data truncation: Truncated incorrect DOUBLE value: \'5439fcf23e92caffc391fb8eac33b86f\'; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Truncated incorrect DOUBLE value: \'5439fcf23e92caffc391fb8eac33b86f\'', '2019-06-21 08:05:58');
INSERT INTO `sys_oper_log` VALUES (112, '申请订单', 3, 'com.ruoyi.project.platform.apply.controller.ApplyController.remove()', 1, 'admin', '研发部门', '/apply/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"5439fcf23e92caffc391fb8eac33b86f\"]}', 1, '\r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Truncated incorrect DOUBLE value: \'5439fcf23e92caffc391fb8eac33b86f\'\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: DELETE FROM apply WHERE id IN (   ?  )\r\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Truncated incorrect DOUBLE value: \'5439fcf23e92caffc391fb8eac33b86f\'\n; Data truncation: Truncated incorrect DOUBLE value: \'5439fcf23e92caffc391fb8eac33b86f\'; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Truncated incorrect DOUBLE value: \'5439fcf23e92caffc391fb8eac33b86f\'', '2019-06-21 08:08:37');
INSERT INTO `sys_oper_log` VALUES (113, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, 'admin', NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-06-21 08:22:28');
INSERT INTO `sys_oper_log` VALUES (114, '字典类型', 1, 'com.ruoyi.project.system.dict.controller.DictTypeController.addSave()', 1, 'admin', NULL, '/system/dict/add', '127.0.0.1', '内网IP', '{\"dictName\":[\"申请状态\"],\"dictType\":[\"apply_status\"],\"status\":[\"0\"],\"remark\":[\"\"]}', 0, NULL, '2019-06-21 08:59:34');
INSERT INTO `sys_oper_log` VALUES (115, '字典数据', 1, 'com.ruoyi.project.system.dict.controller.DictDataController.addSave()', 1, 'admin', NULL, '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"已融资放款\"],\"dictValue\":[\"0\"],\"dictType\":[\"apply_status\"],\"cssClass\":[\"\"],\"dictSort\":[\"0\"],\"listClass\":[\"success\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', 0, NULL, '2019-06-21 09:00:31');
INSERT INTO `sys_oper_log` VALUES (116, '字典数据', 2, 'com.ruoyi.project.system.dict.controller.DictDataController.editSave()', 1, 'admin', NULL, '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\"dictCode\":[\"100\"],\"dictLabel\":[\"已融资放款\"],\"dictValue\":[\"0\"],\"dictType\":[\"apply_status\"],\"cssClass\":[\"\"],\"dictSort\":[\"0\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', 0, NULL, '2019-06-21 09:01:32');
INSERT INTO `sys_oper_log` VALUES (117, '字典数据', 1, 'com.ruoyi.project.system.dict.controller.DictDataController.addSave()', 1, 'admin', NULL, '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"正在申请\"],\"dictValue\":[\"1\"],\"dictType\":[\"apply_status\"],\"cssClass\":[\"\"],\"dictSort\":[\"1\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', 0, NULL, '2019-06-21 09:02:16');
INSERT INTO `sys_oper_log` VALUES (118, '字典数据', 1, 'com.ruoyi.project.system.dict.controller.DictDataController.addSave()', 1, 'admin', NULL, '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"待审核\"],\"dictValue\":[\"2\"],\"dictType\":[\"apply_status\"],\"cssClass\":[\"\"],\"dictSort\":[\"2\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', 0, NULL, '2019-06-21 09:02:40');
INSERT INTO `sys_oper_log` VALUES (119, '字典数据', 1, 'com.ruoyi.project.system.dict.controller.DictDataController.addSave()', 1, 'admin', NULL, '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"不合规则\"],\"dictValue\":[\"3\"],\"dictType\":[\"apply_status\"],\"cssClass\":[\"\"],\"dictSort\":[\"3\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', 0, NULL, '2019-06-21 09:02:55');
INSERT INTO `sys_oper_log` VALUES (120, '字典数据', 1, 'com.ruoyi.project.system.dict.controller.DictDataController.addSave()', 1, 'admin', NULL, '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"待确认签章\"],\"dictValue\":[\"4\"],\"dictType\":[\"apply_status\"],\"cssClass\":[\"\"],\"dictSort\":[\"4\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', 0, NULL, '2019-06-21 09:03:53');
INSERT INTO `sys_oper_log` VALUES (121, '字典数据', 1, 'com.ruoyi.project.system.dict.controller.DictDataController.addSave()', 1, 'admin', NULL, '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"审批不通过\"],\"dictValue\":[\"5\"],\"dictType\":[\"apply_status\"],\"cssClass\":[\"\"],\"dictSort\":[\"5\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', 0, NULL, '2019-06-21 09:04:08');
INSERT INTO `sys_oper_log` VALUES (122, '字典数据', 1, 'com.ruoyi.project.system.dict.controller.DictDataController.addSave()', 1, 'admin', NULL, '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"已签章\"],\"dictValue\":[\"6\"],\"dictType\":[\"apply_status\"],\"cssClass\":[\"\"],\"dictSort\":[\"6\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', 0, NULL, '2019-06-21 09:04:22');
INSERT INTO `sys_oper_log` VALUES (123, '字典数据', 1, 'com.ruoyi.project.system.dict.controller.DictDataController.addSave()', 1, 'admin', NULL, '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"待放款\"],\"dictValue\":[\"7\"],\"dictType\":[\"apply_status\"],\"cssClass\":[\"\"],\"dictSort\":[\"7\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', 0, NULL, '2019-06-21 09:04:38');
INSERT INTO `sys_oper_log` VALUES (124, '字典数据', 1, 'com.ruoyi.project.system.dict.controller.DictDataController.addSave()', 1, 'admin', NULL, '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"不予放款\"],\"dictValue\":[\"8\"],\"dictType\":[\"apply_status\"],\"cssClass\":[\"\"],\"dictSort\":[\"8\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', 0, NULL, '2019-06-21 09:04:57');
INSERT INTO `sys_oper_log` VALUES (125, '字典数据', 1, 'com.ruoyi.project.system.dict.controller.DictDataController.addSave()', 1, 'admin', NULL, '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"待撤销签章\"],\"dictValue\":[\"9\"],\"dictType\":[\"apply_status\"],\"cssClass\":[\"\"],\"dictSort\":[\"9\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', 0, NULL, '2019-06-21 09:05:22');
INSERT INTO `sys_oper_log` VALUES (126, '字典数据', 1, 'com.ruoyi.project.system.dict.controller.DictDataController.addSave()', 1, 'admin', NULL, '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"已撤销\"],\"dictValue\":[\"10\"],\"dictType\":[\"apply_status\"],\"cssClass\":[\"\"],\"dictSort\":[\"10\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', 0, NULL, '2019-06-21 09:05:37');
INSERT INTO `sys_oper_log` VALUES (127, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, NULL, NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-06-24 01:04:31');
INSERT INTO `sys_oper_log` VALUES (128, '代码生成', 8, 'com.ruoyi.project.tool.gen.controller.GenController.genCode()', 1, 'admin', '研发部门', '/tool/gen/genCode/orders', '127.0.0.1', '内网IP', '{}', 0, NULL, '2019-06-24 02:49:49');
INSERT INTO `sys_oper_log` VALUES (129, '代码生成', 8, 'com.ruoyi.project.tool.gen.controller.GenController.genCode()', 1, 'admin', '研发部门', '/tool/gen/genCode/waybills', '127.0.0.1', '内网IP', '{}', 0, NULL, '2019-06-24 02:49:56');
INSERT INTO `sys_oper_log` VALUES (130, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, NULL, NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-06-24 08:24:02');
INSERT INTO `sys_oper_log` VALUES (131, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, NULL, NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-06-24 08:24:15');
INSERT INTO `sys_oper_log` VALUES (132, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, NULL, NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-06-24 08:26:19');
INSERT INTO `sys_oper_log` VALUES (133, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, NULL, NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-06-24 08:26:23');
INSERT INTO `sys_oper_log` VALUES (134, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, NULL, NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-06-24 08:28:25');
INSERT INTO `sys_oper_log` VALUES (135, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, NULL, NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-06-24 08:30:47');
INSERT INTO `sys_oper_log` VALUES (136, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, NULL, NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-06-24 08:37:36');
INSERT INTO `sys_oper_log` VALUES (137, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, NULL, NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-06-24 08:43:44');
INSERT INTO `sys_oper_log` VALUES (138, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, NULL, NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-06-24 08:47:34');
INSERT INTO `sys_oper_log` VALUES (139, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, NULL, NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-06-24 08:50:43');
INSERT INTO `sys_oper_log` VALUES (140, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, NULL, NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-06-24 08:50:51');
INSERT INTO `sys_oper_log` VALUES (141, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, NULL, NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-06-24 08:53:06');
INSERT INTO `sys_oper_log` VALUES (142, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, NULL, NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-06-24 08:53:55');
INSERT INTO `sys_oper_log` VALUES (143, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, NULL, NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-06-24 08:56:55');
INSERT INTO `sys_oper_log` VALUES (144, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, NULL, NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-06-24 09:01:10');
INSERT INTO `sys_oper_log` VALUES (145, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, NULL, NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-06-24 09:05:07');
INSERT INTO `sys_oper_log` VALUES (146, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, NULL, NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-06-24 09:06:45');
INSERT INTO `sys_oper_log` VALUES (147, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, NULL, NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-06-24 09:11:39');
INSERT INTO `sys_oper_log` VALUES (148, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, NULL, NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-06-24 09:14:03');
INSERT INTO `sys_oper_log` VALUES (149, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, NULL, NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-06-24 09:14:45');
INSERT INTO `sys_oper_log` VALUES (150, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, NULL, NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-06-24 09:15:12');
INSERT INTO `sys_oper_log` VALUES (151, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, NULL, NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-06-24 09:15:25');
INSERT INTO `sys_oper_log` VALUES (152, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, NULL, NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-06-24 09:15:58');
INSERT INTO `sys_oper_log` VALUES (153, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, NULL, NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-06-24 09:16:12');
INSERT INTO `sys_oper_log` VALUES (154, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, NULL, NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-06-24 09:16:18');
INSERT INTO `sys_oper_log` VALUES (155, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, NULL, NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-06-24 09:17:20');
INSERT INTO `sys_oper_log` VALUES (156, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, NULL, NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-06-24 09:17:53');
INSERT INTO `sys_oper_log` VALUES (157, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, NULL, NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-06-24 09:18:20');
INSERT INTO `sys_oper_log` VALUES (158, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, NULL, NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-06-24 09:18:24');
INSERT INTO `sys_oper_log` VALUES (159, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, NULL, NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-06-24 09:18:58');
INSERT INTO `sys_oper_log` VALUES (160, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, NULL, NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-06-24 09:19:00');
INSERT INTO `sys_oper_log` VALUES (161, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, NULL, NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-06-24 09:20:00');
INSERT INTO `sys_oper_log` VALUES (162, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, NULL, NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-06-24 09:20:13');
INSERT INTO `sys_oper_log` VALUES (163, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, NULL, NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-06-24 09:21:14');
INSERT INTO `sys_oper_log` VALUES (164, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, NULL, NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-06-24 09:21:27');
INSERT INTO `sys_oper_log` VALUES (165, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, NULL, NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-06-24 09:22:34');
INSERT INTO `sys_oper_log` VALUES (166, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, NULL, NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-06-24 09:24:12');
INSERT INTO `sys_oper_log` VALUES (167, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, NULL, NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-06-24 09:24:39');
INSERT INTO `sys_oper_log` VALUES (168, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, NULL, NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-06-24 09:27:37');
INSERT INTO `sys_oper_log` VALUES (169, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, NULL, NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-06-24 09:34:32');
INSERT INTO `sys_oper_log` VALUES (170, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, NULL, NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-06-24 09:36:10');
INSERT INTO `sys_oper_log` VALUES (171, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, NULL, NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-06-24 09:37:19');
INSERT INTO `sys_oper_log` VALUES (172, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, NULL, NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-06-24 09:38:58');
INSERT INTO `sys_oper_log` VALUES (173, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, NULL, NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-06-24 09:39:19');
INSERT INTO `sys_oper_log` VALUES (174, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, NULL, NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-06-24 09:40:43');
INSERT INTO `sys_oper_log` VALUES (175, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, NULL, NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-06-24 09:54:24');
INSERT INTO `sys_oper_log` VALUES (176, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, NULL, NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-06-24 09:55:48');
INSERT INTO `sys_oper_log` VALUES (177, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, NULL, NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-06-24 09:56:16');
INSERT INTO `sys_oper_log` VALUES (178, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, NULL, NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-06-24 09:56:32');
INSERT INTO `sys_oper_log` VALUES (179, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, NULL, NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-06-24 09:56:55');
INSERT INTO `sys_oper_log` VALUES (180, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, NULL, NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-06-24 09:59:01');
INSERT INTO `sys_oper_log` VALUES (181, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, NULL, NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-06-24 14:59:46');
INSERT INTO `sys_oper_log` VALUES (182, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, NULL, NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-06-24 15:00:13');
INSERT INTO `sys_oper_log` VALUES (183, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, NULL, NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-06-24 15:00:48');
INSERT INTO `sys_oper_log` VALUES (184, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, NULL, NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-06-24 15:00:53');
INSERT INTO `sys_oper_log` VALUES (185, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, NULL, NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-06-24 15:02:26');
INSERT INTO `sys_oper_log` VALUES (186, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, NULL, NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-06-24 15:05:18');
INSERT INTO `sys_oper_log` VALUES (187, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, NULL, NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-06-24 15:06:58');
INSERT INTO `sys_oper_log` VALUES (188, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, NULL, NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-06-24 15:10:15');
INSERT INTO `sys_oper_log` VALUES (189, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, NULL, NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-06-24 15:11:28');
INSERT INTO `sys_oper_log` VALUES (190, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, NULL, NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-06-24 15:13:19');
INSERT INTO `sys_oper_log` VALUES (191, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, NULL, NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-06-24 15:14:09');
INSERT INTO `sys_oper_log` VALUES (192, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, NULL, NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-06-24 15:15:47');
INSERT INTO `sys_oper_log` VALUES (193, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, NULL, NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-06-24 15:17:22');
INSERT INTO `sys_oper_log` VALUES (194, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, NULL, NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-06-24 15:17:26');
INSERT INTO `sys_oper_log` VALUES (195, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, NULL, NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-06-24 15:18:01');
INSERT INTO `sys_oper_log` VALUES (196, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, NULL, NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-06-24 15:22:22');
INSERT INTO `sys_oper_log` VALUES (197, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, NULL, NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-06-24 15:23:48');
INSERT INTO `sys_oper_log` VALUES (198, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, NULL, NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-06-24 15:24:47');
INSERT INTO `sys_oper_log` VALUES (199, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, NULL, NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-06-24 15:25:08');
INSERT INTO `sys_oper_log` VALUES (200, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, NULL, NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-06-24 16:24:18');
INSERT INTO `sys_oper_log` VALUES (201, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, NULL, NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-06-24 16:25:24');
INSERT INTO `sys_oper_log` VALUES (202, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, NULL, NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-06-24 16:25:53');
INSERT INTO `sys_oper_log` VALUES (203, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, NULL, NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-06-24 16:27:24');
INSERT INTO `sys_oper_log` VALUES (204, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, NULL, NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-06-24 16:27:48');
INSERT INTO `sys_oper_log` VALUES (205, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, NULL, NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-06-24 16:31:48');
INSERT INTO `sys_oper_log` VALUES (206, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, NULL, NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-06-24 16:34:56');
INSERT INTO `sys_oper_log` VALUES (207, '用户管理', 2, 'com.ruoyi.project.system.user.controller.UserController.editSave()', 1, 'admin', '研发部门', '/system/user/edit', '127.0.0.1', '内网IP', '{\"userId\":[\"1\"],\"deptId\":[\"103\"],\"userName\":[\"若依\"],\"dept.deptName\":[\"研发部门\"],\"phonenumber\":[\"15888888888\"],\"email\":[\"ry@163.com\"],\"loginName\":[\"admin\"],\"sex\":[\"1\"],\"role\":[\"1\"],\"remark\":[\"管理员\"],\"status\":[\"0\"],\"roleIds\":[\"1\"],\"postIds\":[\"\"]}', 0, NULL, '2019-06-25 01:04:12');
INSERT INTO `sys_oper_log` VALUES (208, '用户管理', 2, 'com.ruoyi.project.system.user.controller.UserController.editSave()', 1, 'admin', '研发部门', '/system/user/edit', '127.0.0.1', '内网IP', '{\"userId\":[\"2\"],\"deptId\":[\"105\"],\"userName\":[\"若依\"],\"dept.deptName\":[\"测试部门\"],\"phonenumber\":[\"15666666666\"],\"email\":[\"ry@qq.com\"],\"loginName\":[\"ry\"],\"sex\":[\"1\"],\"role\":[\"2\"],\"remark\":[\"测试员\"],\"status\":[\"0\"],\"roleIds\":[\"2\"],\"postIds\":[\"\"]}', 0, NULL, '2019-06-25 01:04:21');
INSERT INTO `sys_oper_log` VALUES (209, '用户管理', 2, 'com.ruoyi.project.system.user.controller.UserController.editSave()', 1, 'admin', '研发部门', '/system/user/edit', '127.0.0.1', '内网IP', '{\"userId\":[\"2\"],\"deptId\":[\"105\"],\"userName\":[\"若依\"],\"dept.deptName\":[\"测试部门\"],\"phonenumber\":[\"15666666666\"],\"email\":[\"ry@qq.com\"],\"loginName\":[\"ry\"],\"sex\":[\"1\"],\"role\":[\"2\"],\"remark\":[\"测试员\"],\"status\":[\"0\"],\"roleIds\":[\"2\"],\"postIds\":[\"2\"]}', 0, NULL, '2019-06-25 01:05:18');
INSERT INTO `sys_oper_log` VALUES (210, '岗位管理', 1, 'com.ruoyi.project.system.post.controller.PostController.addSave()', 1, 'admin', '研发部门', '/system/post/add', '127.0.0.1', '内网IP', '{\"postName\":[\"审核\"],\"postCode\":[\"check\"],\"postSort\":[\"5\"],\"status\":[\"0\"],\"remark\":[\"\"]}', 0, NULL, '2019-06-25 01:07:54');
INSERT INTO `sys_oper_log` VALUES (211, '部门管理', 2, 'com.ruoyi.project.system.dept.controller.DeptController.editSave()', 1, 'admin', '研发部门', '/system/dept/edit', '127.0.0.1', '内网IP', '{\"deptId\":[\"100\"],\"parentId\":[\"0\"],\"parentName\":[\"无\"],\"deptName\":[\"通盛租赁\"],\"orderNum\":[\"0\"],\"leader\":[\"\"],\"phone\":[\"\"],\"email\":[\"\"],\"status\":[\"0\"]}', 0, NULL, '2019-06-25 01:08:54');
INSERT INTO `sys_oper_log` VALUES (212, '部门管理', 3, 'com.ruoyi.project.system.dept.controller.DeptController.remove()', 1, 'admin', '研发部门', '/system/dept/remove/101', '127.0.0.1', '内网IP', '{}', 0, NULL, '2019-06-25 01:09:03');
INSERT INTO `sys_oper_log` VALUES (213, '部门管理', 3, 'com.ruoyi.project.system.dept.controller.DeptController.remove()', 1, 'admin', '研发部门', '/system/dept/remove/107', '127.0.0.1', '内网IP', '{}', 0, NULL, '2019-06-25 01:09:15');
INSERT INTO `sys_oper_log` VALUES (214, '部门管理', 3, 'com.ruoyi.project.system.dept.controller.DeptController.remove()', 1, 'admin', '研发部门', '/system/dept/remove/105', '127.0.0.1', '内网IP', '{}', 0, NULL, '2019-06-25 01:09:17');
INSERT INTO `sys_oper_log` VALUES (215, '部门管理', 3, 'com.ruoyi.project.system.dept.controller.DeptController.remove()', 1, 'admin', '研发部门', '/system/dept/remove/106', '127.0.0.1', '内网IP', '{}', 0, NULL, '2019-06-25 01:09:22');
INSERT INTO `sys_oper_log` VALUES (216, '部门管理', 3, 'com.ruoyi.project.system.dept.controller.DeptController.remove()', 1, 'admin', '研发部门', '/system/dept/remove/104', '127.0.0.1', '内网IP', '{}', 0, NULL, '2019-06-25 01:09:25');
INSERT INTO `sys_oper_log` VALUES (217, '部门管理', 3, 'com.ruoyi.project.system.dept.controller.DeptController.remove()', 1, 'admin', '研发部门', '/system/dept/remove/103', '127.0.0.1', '内网IP', '{}', 0, NULL, '2019-06-25 01:09:27');
INSERT INTO `sys_oper_log` VALUES (218, '部门管理', 3, 'com.ruoyi.project.system.dept.controller.DeptController.remove()', 1, 'admin', '研发部门', '/system/dept/remove/109', '127.0.0.1', '内网IP', '{}', 0, NULL, '2019-06-25 01:10:07');
INSERT INTO `sys_oper_log` VALUES (219, '部门管理', 3, 'com.ruoyi.project.system.dept.controller.DeptController.remove()', 1, 'admin', '研发部门', '/system/dept/remove/108', '127.0.0.1', '内网IP', '{}', 0, NULL, '2019-06-25 01:10:09');
INSERT INTO `sys_oper_log` VALUES (220, '部门管理', 3, 'com.ruoyi.project.system.dept.controller.DeptController.remove()', 1, 'admin', '研发部门', '/system/dept/remove/102', '127.0.0.1', '内网IP', '{}', 0, NULL, '2019-06-25 01:10:12');
INSERT INTO `sys_oper_log` VALUES (221, '部门管理', 2, 'com.ruoyi.project.system.dept.controller.DeptController.editSave()', 1, 'admin', '研发部门', '/system/dept/edit', '127.0.0.1', '内网IP', '{\"deptId\":[\"101\"],\"parentId\":[\"100\"],\"parentName\":[\"通盛租赁\"],\"deptName\":[\"广西南宁\"],\"orderNum\":[\"1\"],\"leader\":[\"若依\"],\"phone\":[\"15888888888\"],\"email\":[\"ry@qq.com\"],\"status\":[\"0\"]}', 0, NULL, '2019-06-25 01:10:54');
INSERT INTO `sys_oper_log` VALUES (222, '部门管理', 2, 'com.ruoyi.project.system.dept.controller.DeptController.editSave()', 1, 'admin', '研发部门', '/system/dept/edit', '127.0.0.1', '内网IP', '{\"deptId\":[\"101\"],\"parentId\":[\"100\"],\"parentName\":[\"通盛租赁\"],\"deptName\":[\"广西南宁\"],\"orderNum\":[\"1\"],\"leader\":[\"\"],\"phone\":[\"\"],\"email\":[\"\"],\"status\":[\"0\"]}', 0, NULL, '2019-06-25 01:11:02');
INSERT INTO `sys_oper_log` VALUES (223, '部门管理', 1, 'com.ruoyi.project.system.dept.controller.DeptController.addSave()', 1, 'admin', '研发部门', '/system/dept/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"100\"],\"deptName\":[\"审核\"],\"orderNum\":[\"1\"],\"leader\":[\"\"],\"phone\":[\"\"],\"email\":[\"\"],\"status\":[\"0\"]}', 0, NULL, '2019-06-25 01:11:49');
INSERT INTO `sys_oper_log` VALUES (224, '用户管理', 2, 'com.ruoyi.project.system.user.controller.UserController.editSave()', 1, 'admin', '研发部门', '/system/user/edit', '127.0.0.1', '内网IP', '{\"userId\":[\"2\"],\"deptId\":[\"200\"],\"userName\":[\"若依\"],\"dept.deptName\":[\"审核\"],\"phonenumber\":[\"15666666666\"],\"email\":[\"ry@qq.com\"],\"loginName\":[\"ry\"],\"sex\":[\"1\"],\"role\":[\"2\"],\"remark\":[\"测试员\"],\"status\":[\"0\"],\"roleIds\":[\"2\"],\"postIds\":[\"2\"]}', 0, NULL, '2019-06-25 01:11:59');
INSERT INTO `sys_oper_log` VALUES (225, '用户管理', 2, 'com.ruoyi.project.system.user.controller.UserController.editSave()', 1, 'admin', '研发部门', '/system/user/edit', '127.0.0.1', '内网IP', '{\"userId\":[\"1\"],\"deptId\":[\"200\"],\"userName\":[\"若依\"],\"dept.deptName\":[\"审核\"],\"phonenumber\":[\"15888888888\"],\"email\":[\"ry@163.com\"],\"loginName\":[\"admin\"],\"sex\":[\"1\"],\"role\":[\"1\"],\"remark\":[\"管理员\"],\"status\":[\"0\"],\"roleIds\":[\"1\"],\"postIds\":[\"1\"]}', 0, NULL, '2019-06-25 01:12:05');
INSERT INTO `sys_oper_log` VALUES (226, '用户管理', 2, 'com.ruoyi.project.system.user.controller.UserController.editSave()', 1, 'admin', '研发部门', '/system/user/edit', '127.0.0.1', '内网IP', '{\"userId\":[\"1\"],\"deptId\":[\"200\"],\"userName\":[\"若依\"],\"dept.deptName\":[\"审核\"],\"phonenumber\":[\"15888888888\"],\"email\":[\"ry@163.com\"],\"loginName\":[\"admin\"],\"sex\":[\"1\"],\"role\":[\"1\",\"2\"],\"remark\":[\"管理员\"],\"status\":[\"0\"],\"roleIds\":[\"1,2\"],\"postIds\":[\"1\"]}', 0, NULL, '2019-06-25 01:12:13');
INSERT INTO `sys_oper_log` VALUES (227, '部门管理', 3, 'com.ruoyi.project.system.dept.controller.DeptController.remove()', 1, 'admin', '研发部门', '/system/dept/remove/105', '127.0.0.1', '内网IP', '{}', 0, NULL, '2019-06-25 01:12:37');
INSERT INTO `sys_oper_log` VALUES (228, '部门管理', 1, 'com.ruoyi.project.system.dept.controller.DeptController.addSave()', 1, 'admin', '研发部门', '/system/dept/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"100\"],\"deptName\":[\"数的\"],\"orderNum\":[\"2\"],\"leader\":[\"\"],\"phone\":[\"\"],\"email\":[\"\"],\"status\":[\"0\"]}', 0, NULL, '2019-06-25 01:15:36');
INSERT INTO `sys_oper_log` VALUES (229, '部门管理', 3, 'com.ruoyi.project.system.dept.controller.DeptController.remove()', 1, 'admin', '研发部门', '/system/dept/remove/201', '127.0.0.1', '内网IP', '{}', 0, NULL, '2019-06-25 01:15:42');
INSERT INTO `sys_oper_log` VALUES (230, '岗位管理', 2, 'com.ruoyi.project.system.post.controller.PostController.editSave()', 1, 'admin', '研发部门', '/system/post/edit', '127.0.0.1', '内网IP', '{\"postId\":[\"5\"],\"postName\":[\"审核人员\"],\"postCode\":[\"check\"],\"postSort\":[\"5\"],\"status\":[\"0\"],\"remark\":[\"\"]}', 0, NULL, '2019-06-25 01:17:21');
INSERT INTO `sys_oper_log` VALUES (231, '岗位管理', 3, 'com.ruoyi.project.system.post.controller.PostController.remove()', 1, 'admin', '研发部门', '/system/post/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"1\"]}', 0, NULL, '2019-06-25 01:17:30');
INSERT INTO `sys_oper_log` VALUES (232, '岗位管理', 3, 'com.ruoyi.project.system.post.controller.PostController.remove()', 1, 'admin', '研发部门', '/system/post/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"2\"]}', 0, NULL, '2019-06-25 01:17:34');
INSERT INTO `sys_oper_log` VALUES (233, '用户管理', 2, 'com.ruoyi.project.system.user.controller.UserController.editSave()', 1, 'admin', '研发部门', '/system/user/edit', '127.0.0.1', '内网IP', '{\"userId\":[\"1\"],\"deptId\":[\"200\"],\"userName\":[\"若依\"],\"dept.deptName\":[\"审核\"],\"phonenumber\":[\"15888888888\"],\"email\":[\"ry@163.com\"],\"loginName\":[\"admin\"],\"sex\":[\"1\"],\"role\":[\"1\"],\"remark\":[\"管理员\"],\"status\":[\"0\"],\"roleIds\":[\"1\"],\"postIds\":[\"1\"]}', 0, NULL, '2019-06-25 01:20:03');
INSERT INTO `sys_oper_log` VALUES (234, '用户管理', 2, 'com.ruoyi.project.system.user.controller.UserController.editSave()', 1, 'admin', '研发部门', '/system/user/edit', '127.0.0.1', '内网IP', '{\"userId\":[\"1\"],\"deptId\":[\"200\"],\"userName\":[\"若依\"],\"dept.deptName\":[\"审核\"],\"phonenumber\":[\"15888888888\"],\"email\":[\"ry@163.com\"],\"loginName\":[\"admin\"],\"sex\":[\"1\"],\"role\":[\"2\"],\"remark\":[\"管理员\"],\"status\":[\"0\"],\"roleIds\":[\"2\"],\"postIds\":[\"1\"]}', 0, NULL, '2019-06-25 01:20:08');
INSERT INTO `sys_oper_log` VALUES (235, '用户管理', 2, 'com.ruoyi.project.system.user.controller.UserController.editSave()', 1, 'admin', '研发部门', '/system/user/edit', '127.0.0.1', '内网IP', '{\"userId\":[\"1\"],\"deptId\":[\"200\"],\"userName\":[\"若依\"],\"dept.deptName\":[\"审核\"],\"phonenumber\":[\"15888888888\"],\"email\":[\"ry@163.com\"],\"loginName\":[\"admin\"],\"sex\":[\"1\"],\"role\":[\"1\",\"2\"],\"remark\":[\"管理员\"],\"status\":[\"0\"],\"roleIds\":[\"1,2\"],\"postIds\":[\"1\"]}', 0, NULL, '2019-06-25 01:20:11');
INSERT INTO `sys_oper_log` VALUES (236, '用户管理', 2, 'com.ruoyi.project.system.user.controller.UserController.editSave()', 1, 'admin', '研发部门', '/system/user/edit', '127.0.0.1', '内网IP', '{\"userId\":[\"1\"],\"deptId\":[\"103\"],\"userName\":[\"管理员\"],\"dept.deptName\":[\"研发部门\"],\"phonenumber\":[\"15000000000\"],\"email\":[\"ry@163.com\"],\"loginName\":[\"admin\"],\"sex\":[\"1\"],\"role\":[\"1\"],\"remark\":[\"管理员\"],\"status\":[\"0\"],\"roleIds\":[\"1\"],\"postIds\":[\"1\"]}', 0, NULL, '2019-06-25 01:20:32');
INSERT INTO `sys_oper_log` VALUES (237, '部门管理', 2, 'com.ruoyi.project.system.dept.controller.DeptController.editSave()', 1, 'admin', '研发部门', '/system/dept/edit', '127.0.0.1', '内网IP', '{\"deptId\":[\"100\"],\"parentId\":[\"0\"],\"parentName\":[\"无\"],\"deptName\":[\"金融服务平台\"],\"orderNum\":[\"0\"],\"leader\":[\"\"],\"phone\":[\"\"],\"email\":[\"\"],\"status\":[\"0\"]}', 0, NULL, '2019-06-25 01:21:33');
INSERT INTO `sys_oper_log` VALUES (238, '部门管理', 2, 'com.ruoyi.project.system.dept.controller.DeptController.editSave()', 1, 'admin', '研发部门', '/system/dept/edit', '127.0.0.1', '内网IP', '{\"deptId\":[\"101\"],\"parentId\":[\"100\"],\"parentName\":[\"金融服务平台\"],\"deptName\":[\"平台管理\"],\"orderNum\":[\"1\"],\"leader\":[\"\"],\"phone\":[\"\"],\"email\":[\"\"],\"status\":[\"0\"]}', 0, NULL, '2019-06-25 01:21:44');
INSERT INTO `sys_oper_log` VALUES (239, '部门管理', 2, 'com.ruoyi.project.system.dept.controller.DeptController.editSave()', 1, 'admin', '研发部门', '/system/dept/edit', '127.0.0.1', '内网IP', '{\"deptId\":[\"103\"],\"parentId\":[\"101\"],\"parentName\":[\"平台管理\"],\"deptName\":[\"管理\"],\"orderNum\":[\"1\"],\"leader\":[\"\"],\"phone\":[\"\"],\"email\":[\"\"],\"status\":[\"0\"]}', 0, NULL, '2019-06-25 01:22:47');
INSERT INTO `sys_oper_log` VALUES (240, '用户管理', 2, 'com.ruoyi.project.system.user.controller.UserController.editSave()', 1, 'admin', '研发部门', '/system/user/edit', '127.0.0.1', '内网IP', '{\"userId\":[\"2\"],\"deptId\":[\"200\"],\"userName\":[\"审核\"],\"dept.deptName\":[\"审核\"],\"phonenumber\":[\"15666666666\"],\"email\":[\"ry@qq.com\"],\"loginName\":[\"ry\"],\"sex\":[\"0\"],\"role\":[\"2\"],\"remark\":[\"测试员\"],\"status\":[\"0\"],\"roleIds\":[\"2\"],\"postIds\":[\"5\"]}', 0, NULL, '2019-06-25 01:32:06');
INSERT INTO `sys_oper_log` VALUES (241, '部门管理', 2, 'com.ruoyi.project.system.dept.controller.DeptController.editSave()', 1, 'admin', '研发部门', '/system/dept/edit', '127.0.0.1', '内网IP', '{\"deptId\":[\"200\"],\"parentId\":[\"100\"],\"parentName\":[\"金融服务平台\"],\"deptName\":[\"通盛租赁\"],\"orderNum\":[\"1\"],\"leader\":[\"\"],\"phone\":[\"\"],\"email\":[\"\"],\"status\":[\"0\"]}', 0, NULL, '2019-06-25 01:34:32');
INSERT INTO `sys_oper_log` VALUES (242, '部门管理', 1, 'com.ruoyi.project.system.dept.controller.DeptController.addSave()', 1, 'admin', '研发部门', '/system/dept/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"200\"],\"deptName\":[\"审核\"],\"orderNum\":[\"1\"],\"leader\":[\"\"],\"phone\":[\"\"],\"email\":[\"\"],\"status\":[\"0\"]}', 0, NULL, '2019-06-25 01:34:51');
INSERT INTO `sys_oper_log` VALUES (243, '用户管理', 2, 'com.ruoyi.project.system.user.controller.UserController.editSave()', 1, 'admin', '研发部门', '/system/user/edit', '127.0.0.1', '内网IP', '{\"userId\":[\"2\"],\"deptId\":[\"202\"],\"userName\":[\"审核\"],\"dept.deptName\":[\"审核\"],\"phonenumber\":[\"15666666666\"],\"email\":[\"ry@qq.com\"],\"loginName\":[\"ry\"],\"sex\":[\"0\"],\"role\":[\"2\"],\"remark\":[\"测试员\"],\"status\":[\"0\"],\"roleIds\":[\"2\"],\"postIds\":[\"5\"]}', 0, NULL, '2019-06-25 01:35:08');
INSERT INTO `sys_oper_log` VALUES (244, '岗位管理', 2, 'com.ruoyi.project.system.post.controller.PostController.editSave()', 1, 'admin', '研发部门', '/system/post/edit', '127.0.0.1', '内网IP', '{\"postId\":[\"1\"],\"postName\":[\"管理员\"],\"postCode\":[\"admin\"],\"postSort\":[\"1\"],\"status\":[\"0\"],\"remark\":[\"\"]}', 0, NULL, '2019-06-25 01:35:51');
INSERT INTO `sys_oper_log` VALUES (245, '岗位管理', 3, 'com.ruoyi.project.system.post.controller.PostController.remove()', 1, 'admin', '研发部门', '/system/post/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"2\"]}', 0, NULL, '2019-06-25 01:35:55');
INSERT INTO `sys_oper_log` VALUES (246, '岗位管理', 3, 'com.ruoyi.project.system.post.controller.PostController.remove()', 1, 'admin', '研发部门', '/system/post/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"3\"]}', 0, NULL, '2019-06-25 01:35:58');
INSERT INTO `sys_oper_log` VALUES (247, '用户管理', 2, 'com.ruoyi.project.system.user.controller.UserController.editSave()', 1, 'admin', '研发部门', '/system/user/edit', '127.0.0.1', '内网IP', '{\"userId\":[\"1\"],\"deptId\":[\"103\"],\"userName\":[\"管理员\"],\"dept.deptName\":[\"管理\"],\"phonenumber\":[\"15888888888\"],\"email\":[\"ry@163.com\"],\"loginName\":[\"admin\"],\"sex\":[\"1\"],\"role\":[\"1\"],\"remark\":[\"管理员\"],\"status\":[\"0\"],\"roleIds\":[\"1\"],\"postIds\":[\"1\"]}', 0, NULL, '2019-06-25 01:36:30');
INSERT INTO `sys_oper_log` VALUES (248, '部门管理', 2, 'com.ruoyi.project.system.dept.controller.DeptController.editSave()', 1, 'admin', '研发部门', '/system/dept/edit', '127.0.0.1', '内网IP', '{\"deptId\":[\"100\"],\"parentId\":[\"0\"],\"parentName\":[\"无\"],\"deptName\":[\"供应链金融服务云平台\"],\"orderNum\":[\"0\"],\"leader\":[\"\"],\"phone\":[\"\"],\"email\":[\"\"],\"status\":[\"0\"]}', 0, NULL, '2019-06-25 01:37:48');
INSERT INTO `sys_oper_log` VALUES (249, '部门管理', 2, 'com.ruoyi.project.system.dept.controller.DeptController.editSave()', 1, 'admin', '研发部门', '/system/dept/edit', '127.0.0.1', '内网IP', '{\"deptId\":[\"200\"],\"parentId\":[\"100\"],\"parentName\":[\"供应链金融服务云平台\"],\"deptName\":[\"通盛租赁\"],\"orderNum\":[\"2\"],\"leader\":[\"\"],\"phone\":[\"\"],\"email\":[\"\"],\"status\":[\"0\"]}', 0, NULL, '2019-06-25 01:37:59');
INSERT INTO `sys_oper_log` VALUES (250, '在线用户', 7, 'com.ruoyi.project.monitor.online.controller.UserOnlineController.forceLogout()', 1, 'admin', '研发部门', '/monitor/online/forceLogout', '127.0.0.1', '内网IP', '{\"sessionId\":[\"feb1d879-2600-4957-a26b-cef1c171c980\"]}', 0, NULL, '2019-06-25 01:38:19');
INSERT INTO `sys_oper_log` VALUES (251, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, 'admin', NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-06-25 01:50:43');
INSERT INTO `sys_oper_log` VALUES (252, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, 'admin', NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-06-25 01:52:36');
INSERT INTO `sys_oper_log` VALUES (253, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, 'admin', NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-06-25 01:57:26');
INSERT INTO `sys_oper_log` VALUES (254, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, 'admin', NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-06-25 02:00:04');
INSERT INTO `sys_oper_log` VALUES (255, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, 'admin', NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-06-25 02:01:53');
INSERT INTO `sys_oper_log` VALUES (256, '用户管理', 1, 'com.ruoyi.project.system.user.controller.UserController.addSave()', 1, 'admin', NULL, '/system/user/add', '127.0.0.1', '内网IP', '{\"deptId\":[\"202\"],\"userName\":[\"通盛审核\"],\"deptName\":[\"审核\"],\"phonenumber\":[\"13888888888\"],\"email\":[\"xx@qq.com\"],\"loginName\":[\"tongsheng\"],\"password\":[\"123456\"],\"sex\":[\"2\"],\"remark\":[\"\"],\"status\":[\"0\"],\"roleIds\":[\"\"],\"postIds\":[\"5\"]}', 0, NULL, '2019-06-25 02:03:46');
INSERT INTO `sys_oper_log` VALUES (257, '角色管理', 1, 'com.ruoyi.project.system.role.controller.RoleController.addSave()', 1, 'admin', NULL, '/system/role/add', '127.0.0.1', '内网IP', '{\"roleName\":[\"融资机构\"],\"roleKey\":[\"bank\"],\"roleSort\":[\"3\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"1,2000,2001,2002,2003,2004,107,1035\"]}', 0, NULL, '2019-06-25 02:05:14');
INSERT INTO `sys_oper_log` VALUES (258, '个人信息', 2, 'com.ruoyi.project.system.user.controller.ProfileController.update()', 1, 'admin', '管理', '/system/user/profile/update', '127.0.0.1', '内网IP', '{\"id\":[\"\"],\"userName\":[\"管理员\"],\"phonenumber\":[\"15888888888\"],\"email\":[\"xxx@qq.com\"],\"sex\":[\"1\"]}', 1, 'com.ruoyi.project.monitor.online.domain.OnlineSession cannot be cast to com.ruoyi.project.monitor.online.domain.OnlineSession', '2019-06-25 02:07:20');
INSERT INTO `sys_oper_log` VALUES (259, '用户管理', 2, 'com.ruoyi.project.system.user.controller.UserController.editSave()', 1, 'admin', '管理', '/system/user/edit', '127.0.0.1', '内网IP', '{\"userId\":[\"100\"],\"deptId\":[\"202\"],\"userName\":[\"通盛审核\"],\"dept.deptName\":[\"审核\"],\"phonenumber\":[\"13888888888\"],\"email\":[\"xx@qq.com\"],\"loginName\":[\"tongsheng\"],\"sex\":[\"2\"],\"role\":[\"100\"],\"remark\":[\"\"],\"status\":[\"0\"],\"roleIds\":[\"100\"],\"postIds\":[\"5\"]}', 0, NULL, '2019-06-25 02:09:08');
INSERT INTO `sys_oper_log` VALUES (260, '角色管理', 2, 'com.ruoyi.project.system.role.controller.RoleController.authDataScopeSave()', 1, 'admin', '管理', '/system/role/authDataScope', '127.0.0.1', '内网IP', '{\"roleId\":[\"100\"],\"roleName\":[\"融资机构\"],\"roleKey\":[\"bank\"],\"dataScope\":[\"3\"],\"deptIds\":[\"\"]}', 0, NULL, '2019-06-25 02:12:05');
INSERT INTO `sys_oper_log` VALUES (261, '角色管理', 2, 'com.ruoyi.project.system.role.controller.RoleController.authDataScopeSave()', 1, 'admin', '管理', '/system/role/authDataScope', '127.0.0.1', '内网IP', '{\"roleId\":[\"100\"],\"roleName\":[\"融资机构\"],\"roleKey\":[\"bank\"],\"dataScope\":[\"2\"],\"deptIds\":[\"100,200,202\"]}', 0, NULL, '2019-06-25 02:12:29');
INSERT INTO `sys_oper_log` VALUES (262, '用户管理', 1, 'com.ruoyi.project.system.user.controller.UserController.addSave()', 1, 'admin', '管理', '/system/user/add', '127.0.0.1', '内网IP', '{\"deptId\":[\"103\"],\"userName\":[\"11\"],\"deptName\":[\"管理\"],\"phonenumber\":[\"15607804063\"],\"email\":[\"1174758926@qq.com\"],\"loginName\":[\"123456\"],\"password\":[\"123456\"],\"sex\":[\"0\"],\"remark\":[\"\"],\"status\":[\"0\"],\"roleIds\":[\"\"],\"postIds\":[\"\"]}', 0, NULL, '2019-06-25 02:18:23');
INSERT INTO `sys_oper_log` VALUES (263, '用户管理', 3, 'com.ruoyi.project.system.user.controller.UserController.remove()', 1, 'admin', '管理', '/system/user/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"101\"]}', 0, NULL, '2019-06-25 02:18:28');
INSERT INTO `sys_oper_log` VALUES (264, '角色管理', 2, 'com.ruoyi.project.system.role.controller.RoleController.editSave()', 1, 'admin', '管理', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"100\"],\"roleName\":[\"通盛租赁\"],\"roleKey\":[\"ts\"],\"roleSort\":[\"3\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"1,2000,2001,2002,2003,2004,107,1035\"]}', 0, NULL, '2019-06-25 02:22:29');
INSERT INTO `sys_oper_log` VALUES (265, '角色管理', 4, 'com.ruoyi.project.system.role.controller.RoleController.cancelAuthUser()', 1, 'admin', '管理', '/system/role/authUser/cancel', '127.0.0.1', '内网IP', '{\"roleId\":[\"2\"],\"userId\":[\"2\"]}', 0, NULL, '2019-06-25 02:23:02');
INSERT INTO `sys_oper_log` VALUES (266, '角色管理', 3, 'com.ruoyi.project.system.role.controller.RoleController.remove()', 1, 'admin', '管理', '/system/role/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"2\"]}', 0, NULL, '2019-06-25 02:23:07');
INSERT INTO `sys_oper_log` VALUES (267, '角色管理', 2, 'com.ruoyi.project.system.role.controller.RoleController.authDataScopeSave()', 1, 'admin', '管理', '/system/role/authDataScope', '127.0.0.1', '内网IP', '{\"roleId\":[\"100\"],\"roleName\":[\"通盛租赁\"],\"roleKey\":[\"ts\"],\"dataScope\":[\"2\"],\"deptIds\":[\"100,200,202\"]}', 0, NULL, '2019-06-25 02:23:38');
INSERT INTO `sys_oper_log` VALUES (268, '角色管理', 2, 'com.ruoyi.project.system.role.controller.RoleController.editSave()', 1, 'admin', '管理', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"100\"],\"roleName\":[\"融资机构\"],\"roleKey\":[\"bank\"],\"roleSort\":[\"3\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"1,2000,2001,2002,2003,2004,107,1035\"]}', 0, NULL, '2019-06-25 02:25:17');
INSERT INTO `sys_oper_log` VALUES (269, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, 'admin', NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-06-25 03:00:10');
INSERT INTO `sys_oper_log` VALUES (270, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, 'admin', NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-06-25 03:01:00');
INSERT INTO `sys_oper_log` VALUES (271, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, 'admin', NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-06-25 03:01:20');
INSERT INTO `sys_oper_log` VALUES (272, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, 'admin', NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-06-25 03:03:51');
INSERT INTO `sys_oper_log` VALUES (273, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, 'admin', NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-06-25 03:04:47');
INSERT INTO `sys_oper_log` VALUES (274, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, 'admin', NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-06-25 03:07:08');
INSERT INTO `sys_oper_log` VALUES (275, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, 'admin', NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-06-25 03:09:41');
INSERT INTO `sys_oper_log` VALUES (276, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, 'admin', NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-06-25 03:10:17');
INSERT INTO `sys_oper_log` VALUES (277, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, 'admin', NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-06-25 03:10:34');
INSERT INTO `sys_oper_log` VALUES (278, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, 'admin', NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-06-25 03:11:52');
INSERT INTO `sys_oper_log` VALUES (279, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, 'admin', NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-06-25 03:14:04');
INSERT INTO `sys_oper_log` VALUES (280, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, 'admin', NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-06-25 03:14:58');
INSERT INTO `sys_oper_log` VALUES (281, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, 'admin', NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-06-25 03:20:47');
INSERT INTO `sys_oper_log` VALUES (282, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, 'admin', NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-06-25 03:21:04');
INSERT INTO `sys_oper_log` VALUES (283, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, 'admin', NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-06-25 03:22:23');
INSERT INTO `sys_oper_log` VALUES (284, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, 'admin', NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-06-25 03:27:00');
INSERT INTO `sys_oper_log` VALUES (285, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, 'admin', NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-06-25 03:29:22');
INSERT INTO `sys_oper_log` VALUES (286, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, 'admin', NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-06-25 03:38:18');
INSERT INTO `sys_oper_log` VALUES (287, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, 'admin', NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-06-25 03:41:00');
INSERT INTO `sys_oper_log` VALUES (288, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, 'admin', NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-06-25 03:47:19');
INSERT INTO `sys_oper_log` VALUES (289, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, 'admin', NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-06-25 03:47:54');
INSERT INTO `sys_oper_log` VALUES (290, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, 'admin', NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-06-25 03:48:52');
INSERT INTO `sys_oper_log` VALUES (291, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, 'admin', NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-06-25 03:49:31');
INSERT INTO `sys_oper_log` VALUES (292, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, 'admin', NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-06-25 03:50:15');
INSERT INTO `sys_oper_log` VALUES (293, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, 'admin', NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-06-25 03:54:11');
INSERT INTO `sys_oper_log` VALUES (294, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, 'admin', NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-06-25 03:54:54');
INSERT INTO `sys_oper_log` VALUES (295, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, 'admin', NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-06-25 03:55:22');
INSERT INTO `sys_oper_log` VALUES (296, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, 'admin', NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-06-25 03:56:30');
INSERT INTO `sys_oper_log` VALUES (297, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, 'admin', NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-06-25 03:56:55');
INSERT INTO `sys_oper_log` VALUES (298, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, 'admin', NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-06-25 04:00:07');
INSERT INTO `sys_oper_log` VALUES (299, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, 'admin', NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-06-25 04:00:36');
INSERT INTO `sys_oper_log` VALUES (300, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, 'admin', NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-06-25 04:05:04');
INSERT INTO `sys_oper_log` VALUES (301, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, 'admin', NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-06-25 04:43:37');
INSERT INTO `sys_oper_log` VALUES (302, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, 'admin', NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-06-25 04:50:02');
INSERT INTO `sys_oper_log` VALUES (303, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, 'admin', NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-06-25 04:50:41');
INSERT INTO `sys_oper_log` VALUES (304, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, 'admin', NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-06-25 04:51:00');
INSERT INTO `sys_oper_log` VALUES (305, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, 'admin', NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-06-25 04:56:02');
INSERT INTO `sys_oper_log` VALUES (306, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, 'admin', NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-06-25 04:56:16');
INSERT INTO `sys_oper_log` VALUES (307, '角色管理', 2, 'com.ruoyi.project.system.role.controller.RoleController.editSave()', 1, 'admin', '管理', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"100\"],\"roleName\":[\"融资机构\"],\"roleKey\":[\"bank\"],\"roleSort\":[\"3\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"1,2000,2001,107,1035\"]}', 0, NULL, '2019-06-25 04:59:02');
INSERT INTO `sys_oper_log` VALUES (308, '字典数据', 2, 'com.ruoyi.project.system.dict.controller.DictDataController.editSave()', 1, 'admin', '管理', '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\"dictCode\":[\"100\"],\"dictLabel\":[\"已融资放款\"],\"dictValue\":[\"0\"],\"dictType\":[\"apply_status\"],\"cssClass\":[\"\"],\"dictSort\":[\"0\"],\"listClass\":[\"success\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', 0, NULL, '2019-06-25 05:51:58');
INSERT INTO `sys_oper_log` VALUES (309, '字典数据', 2, 'com.ruoyi.project.system.dict.controller.DictDataController.editSave()', 1, 'admin', '管理', '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\"dictCode\":[\"102\"],\"dictLabel\":[\"待审核\"],\"dictValue\":[\"2\"],\"dictType\":[\"apply_status\"],\"cssClass\":[\"\"],\"dictSort\":[\"2\"],\"listClass\":[\"info\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', 0, NULL, '2019-06-25 05:52:18');
INSERT INTO `sys_oper_log` VALUES (310, '字典数据', 2, 'com.ruoyi.project.system.dict.controller.DictDataController.editSave()', 1, 'admin', '管理', '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\"dictCode\":[\"105\"],\"dictLabel\":[\"审批不通过\"],\"dictValue\":[\"5\"],\"dictType\":[\"apply_status\"],\"cssClass\":[\"\"],\"dictSort\":[\"5\"],\"listClass\":[\"danger\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', 0, NULL, '2019-06-25 05:52:27');
INSERT INTO `sys_oper_log` VALUES (311, '字典数据', 2, 'com.ruoyi.project.system.dict.controller.DictDataController.editSave()', 1, 'admin', '管理', '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\"dictCode\":[\"108\"],\"dictLabel\":[\"不予放款\"],\"dictValue\":[\"8\"],\"dictType\":[\"apply_status\"],\"cssClass\":[\"\"],\"dictSort\":[\"8\"],\"listClass\":[\"danger\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', 0, NULL, '2019-06-25 05:52:33');
INSERT INTO `sys_oper_log` VALUES (312, '字典数据', 2, 'com.ruoyi.project.system.dict.controller.DictDataController.editSave()', 1, 'admin', '管理', '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\"dictCode\":[\"102\"],\"dictLabel\":[\"待审核\"],\"dictValue\":[\"2\"],\"dictType\":[\"apply_status\"],\"cssClass\":[\"\"],\"dictSort\":[\"2\"],\"listClass\":[\"primary\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', 0, NULL, '2019-06-25 05:53:10');
INSERT INTO `sys_oper_log` VALUES (313, '字典数据', 2, 'com.ruoyi.project.system.dict.controller.DictDataController.editSave()', 1, 'admin', '管理', '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\"dictCode\":[\"102\"],\"dictLabel\":[\"待审核\"],\"dictValue\":[\"2\"],\"dictType\":[\"apply_status\"],\"cssClass\":[\"\"],\"dictSort\":[\"2\"],\"listClass\":[\"warning\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', 0, NULL, '2019-06-25 05:53:25');
INSERT INTO `sys_oper_log` VALUES (314, '字典数据', 2, 'com.ruoyi.project.system.dict.controller.DictDataController.editSave()', 1, 'admin', '管理', '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\"dictCode\":[\"101\"],\"dictLabel\":[\"正在申请\"],\"dictValue\":[\"1\"],\"dictType\":[\"apply_status\"],\"cssClass\":[\"\"],\"dictSort\":[\"1\"],\"listClass\":[\"warning\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', 0, NULL, '2019-06-25 05:53:29');
INSERT INTO `sys_oper_log` VALUES (315, '字典数据', 2, 'com.ruoyi.project.system.dict.controller.DictDataController.editSave()', 1, 'admin', '管理', '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\"dictCode\":[\"103\"],\"dictLabel\":[\"不合规则\"],\"dictValue\":[\"3\"],\"dictType\":[\"apply_status\"],\"cssClass\":[\"\"],\"dictSort\":[\"3\"],\"listClass\":[\"danger\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', 0, NULL, '2019-06-25 05:53:34');
INSERT INTO `sys_oper_log` VALUES (316, '字典数据', 2, 'com.ruoyi.project.system.dict.controller.DictDataController.editSave()', 1, 'admin', '管理', '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\"dictCode\":[\"104\"],\"dictLabel\":[\"待确认签章\"],\"dictValue\":[\"4\"],\"dictType\":[\"apply_status\"],\"cssClass\":[\"\"],\"dictSort\":[\"4\"],\"listClass\":[\"default\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', 0, NULL, '2019-06-25 05:53:43');
INSERT INTO `sys_oper_log` VALUES (317, '字典数据', 2, 'com.ruoyi.project.system.dict.controller.DictDataController.editSave()', 1, 'admin', '管理', '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\"dictCode\":[\"104\"],\"dictLabel\":[\"待确认签章\"],\"dictValue\":[\"4\"],\"dictType\":[\"apply_status\"],\"cssClass\":[\"\"],\"dictSort\":[\"4\"],\"listClass\":[\"warning\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', 0, NULL, '2019-06-25 05:53:55');
INSERT INTO `sys_oper_log` VALUES (318, '字典数据', 2, 'com.ruoyi.project.system.dict.controller.DictDataController.editSave()', 1, 'admin', '管理', '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\"dictCode\":[\"106\"],\"dictLabel\":[\"已签章\"],\"dictValue\":[\"6\"],\"dictType\":[\"apply_status\"],\"cssClass\":[\"\"],\"dictSort\":[\"6\"],\"listClass\":[\"success\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', 0, NULL, '2019-06-25 05:54:03');
INSERT INTO `sys_oper_log` VALUES (319, '字典数据', 2, 'com.ruoyi.project.system.dict.controller.DictDataController.editSave()', 1, 'admin', '管理', '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\"dictCode\":[\"107\"],\"dictLabel\":[\"待放款\"],\"dictValue\":[\"7\"],\"dictType\":[\"apply_status\"],\"cssClass\":[\"\"],\"dictSort\":[\"7\"],\"listClass\":[\"warning\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', 0, NULL, '2019-06-25 05:54:12');
INSERT INTO `sys_oper_log` VALUES (320, '字典数据', 2, 'com.ruoyi.project.system.dict.controller.DictDataController.editSave()', 1, 'admin', '管理', '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\"dictCode\":[\"109\"],\"dictLabel\":[\"待撤销签章\"],\"dictValue\":[\"9\"],\"dictType\":[\"apply_status\"],\"cssClass\":[\"\"],\"dictSort\":[\"9\"],\"listClass\":[\"success\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', 0, NULL, '2019-06-25 05:54:18');
INSERT INTO `sys_oper_log` VALUES (321, '字典数据', 2, 'com.ruoyi.project.system.dict.controller.DictDataController.editSave()', 1, 'admin', '管理', '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\"dictCode\":[\"110\"],\"dictLabel\":[\"已撤销\"],\"dictValue\":[\"10\"],\"dictType\":[\"apply_status\"],\"cssClass\":[\"\"],\"dictSort\":[\"10\"],\"listClass\":[\"success\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', 0, NULL, '2019-06-25 05:54:24');
INSERT INTO `sys_oper_log` VALUES (322, '字典数据', 2, 'com.ruoyi.project.system.dict.controller.DictDataController.editSave()', 1, 'admin', '管理', '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\"dictCode\":[\"109\"],\"dictLabel\":[\"待撤销签章\"],\"dictValue\":[\"9\"],\"dictType\":[\"apply_status\"],\"cssClass\":[\"\"],\"dictSort\":[\"9\"],\"listClass\":[\"warning\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', 0, NULL, '2019-06-25 05:54:30');
INSERT INTO `sys_oper_log` VALUES (323, '菜单管理', 1, 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', 1, 'admin', NULL, '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1\"],\"menuType\":[\"C\"],\"menuName\":[\"申请管理\"],\"url\":[\"/apply/checkList\"],\"perms\":[\"platform:apply:checklist\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', 0, NULL, '2019-06-25 06:13:51');
INSERT INTO `sys_oper_log` VALUES (324, '菜单管理', 2, 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 1, 'admin', NULL, '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2005\"],\"parentId\":[\"1\"],\"menuType\":[\"C\"],\"menuName\":[\"申请管理\"],\"url\":[\"/apply/list\"],\"perms\":[\"platform:apply:view\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', 0, NULL, '2019-06-25 06:15:55');
INSERT INTO `sys_oper_log` VALUES (325, '菜单管理', 1, 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', 1, 'admin', NULL, '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2005\"],\"menuType\":[\"F\"],\"menuName\":[\"查询\"],\"url\":[\"\"],\"perms\":[\"platform:apply:checklist\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', 0, NULL, '2019-06-25 06:16:41');
INSERT INTO `sys_oper_log` VALUES (326, '菜单管理', 2, 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 1, 'admin', NULL, '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2005\"],\"parentId\":[\"1\"],\"menuType\":[\"C\"],\"menuName\":[\"申请管理\"],\"url\":[\"/applyCheck\"],\"perms\":[\"platform:apply:view\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', 0, NULL, '2019-06-25 06:19:33');
INSERT INTO `sys_oper_log` VALUES (327, '菜单管理', 2, 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 1, 'admin', NULL, '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2005\"],\"parentId\":[\"1\"],\"menuType\":[\"C\"],\"menuName\":[\"申请管理\"],\"url\":[\"/apply\"],\"perms\":[\"platform:apply:view\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', 0, NULL, '2019-06-25 06:21:38');
INSERT INTO `sys_oper_log` VALUES (328, '菜单管理', 2, 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 1, 'admin', NULL, '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2005\"],\"parentId\":[\"1\"],\"menuType\":[\"C\"],\"menuName\":[\"申请管理\"],\"url\":[\"/apply\"],\"perms\":[\"platform:applycheck:view\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', 0, NULL, '2019-06-25 06:26:04');
INSERT INTO `sys_oper_log` VALUES (329, '菜单管理', 2, 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 1, 'admin', '管理', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2005\"],\"parentId\":[\"1\"],\"menuType\":[\"C\"],\"menuName\":[\"申请管理\"],\"url\":[\"/apply/check\"],\"perms\":[\"platform:apply:checkview\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', 0, NULL, '2019-06-25 06:34:59');
INSERT INTO `sys_oper_log` VALUES (330, '角色管理', 2, 'com.ruoyi.project.system.role.controller.RoleController.editSave()', 1, 'admin', '管理', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"100\"],\"roleName\":[\"融资机构\"],\"roleKey\":[\"bank\"],\"roleSort\":[\"3\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"1,2005,2006,107,1035\"]}', 0, NULL, '2019-06-25 06:57:55');
INSERT INTO `sys_oper_log` VALUES (331, '菜单管理', 2, 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 1, 'admin', NULL, '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2006\"],\"parentId\":[\"2005\"],\"menuType\":[\"F\"],\"menuName\":[\"详细\"],\"url\":[\"#\"],\"perms\":[\"platform:apply:detail\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', 0, NULL, '2019-06-25 07:25:45');
INSERT INTO `sys_oper_log` VALUES (332, '角色管理', 2, 'com.ruoyi.project.system.role.controller.RoleController.editSave()', 1, 'admin', NULL, '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"100\"],\"roleName\":[\"融资机构\"],\"roleKey\":[\"bank\"],\"roleSort\":[\"3\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"1,2005,2006,107,1035\"]}', 0, NULL, '2019-06-25 07:25:59');
INSERT INTO `sys_oper_log` VALUES (333, '菜单管理', 1, 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', 1, 'admin', '管理', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2005\"],\"menuType\":[\"F\"],\"menuName\":[\"查询\"],\"url\":[\"\"],\"perms\":[\"platform:apply:checklist\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', 0, NULL, '2019-06-25 07:27:14');
INSERT INTO `sys_oper_log` VALUES (334, '菜单管理', 2, 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 1, 'admin', '管理', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2006\"],\"parentId\":[\"2005\"],\"menuType\":[\"F\"],\"menuName\":[\"详细\"],\"url\":[\"#\"],\"perms\":[\"platform:apply:detail\"],\"orderNum\":[\"2\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', 0, NULL, '2019-06-25 07:27:22');
INSERT INTO `sys_oper_log` VALUES (335, '角色管理', 2, 'com.ruoyi.project.system.role.controller.RoleController.editSave()', 1, 'admin', '管理', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"100\"],\"roleName\":[\"融资机构\"],\"roleKey\":[\"bank\"],\"roleSort\":[\"3\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"1,2005,2007,2006,107,1035\"]}', 0, NULL, '2019-06-25 07:27:55');
INSERT INTO `sys_oper_log` VALUES (336, '用户管理', 5, 'com.ruoyi.project.system.user.controller.UserController.export()', 1, 'admin', '管理', '/system/user/export', '127.0.0.1', '内网IP', '{\"deptId\":[\"\"],\"parentId\":[\"\"],\"loginName\":[\"\"],\"phonenumber\":[\"\"],\"status\":[\"\"],\"params[beginTime]\":[\"\"],\"params[endTime]\":[\"\"]}', 0, NULL, '2019-06-25 16:36:49');
INSERT INTO `sys_oper_log` VALUES (337, '通知公告', 3, 'com.ruoyi.project.system.notice.controller.NoticeController.remove()', 1, 'admin', '管理', '/system/notice/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"1,2\"]}', 0, NULL, '2019-06-26 05:11:03');
INSERT INTO `sys_oper_log` VALUES (338, '部门管理', 2, 'com.ruoyi.project.system.dept.controller.DeptController.editSave()', 1, 'admin', '管理', '/system/dept/edit', '127.0.0.1', '内网IP', '{\"deptId\":[\"200\"],\"parentId\":[\"100\"],\"parentName\":[\"供应链金融服务云平台\"],\"deptName\":[\"广西通盛融资租赁有限公司\"],\"orderNum\":[\"2\"],\"leader\":[\"\"],\"phone\":[\"\"],\"email\":[\"\"],\"status\":[\"0\"]}', 0, NULL, '2019-06-26 05:24:30');
INSERT INTO `sys_oper_log` VALUES (339, '申请订单', 2, 'com.ruoyi.project.platform.apply.controller.ApplyController.editSave()', 1, 'admin', '管理', '/jeecg-boot/apply/edit', '127.0.0.1', '内网IP', '{\"id\":[\"85cdba9e58d31278e4a3a964a0130651\"],\"applyId\":[\"ae5e3cad-001e-4a0c-b49f-8f16b37c61b7\"],\"info\":[\"测试数据\"],\"status\":[\"4\"],\"sum\":[\"3500.00\"],\"loanTime\":[\"\"],\"loanAccount\":[\"\"]}', 0, NULL, '2019-06-26 08:28:29');
INSERT INTO `sys_oper_log` VALUES (340, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, NULL, NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-06-27 03:31:57');
INSERT INTO `sys_oper_log` VALUES (341, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, NULL, NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-06-27 03:32:39');
INSERT INTO `sys_oper_log` VALUES (342, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, NULL, NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-06-27 03:33:58');
INSERT INTO `sys_oper_log` VALUES (343, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, NULL, NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-06-27 03:35:39');
INSERT INTO `sys_oper_log` VALUES (344, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, NULL, NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-06-27 03:39:31');
INSERT INTO `sys_oper_log` VALUES (345, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, NULL, NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-06-27 03:54:22');
INSERT INTO `sys_oper_log` VALUES (346, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, NULL, NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-06-27 05:00:09');
INSERT INTO `sys_oper_log` VALUES (347, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, NULL, NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-06-27 05:02:58');
INSERT INTO `sys_oper_log` VALUES (348, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, NULL, NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-06-27 05:03:00');
INSERT INTO `sys_oper_log` VALUES (349, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, NULL, NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-06-27 05:08:21');
INSERT INTO `sys_oper_log` VALUES (350, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, NULL, NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-06-27 05:10:22');
INSERT INTO `sys_oper_log` VALUES (351, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, NULL, NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-06-27 05:30:36');
INSERT INTO `sys_oper_log` VALUES (352, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, 'tongsheng', NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-06-27 05:38:08');
INSERT INTO `sys_oper_log` VALUES (353, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, 'tongsheng', NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-06-27 05:43:21');
INSERT INTO `sys_oper_log` VALUES (354, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, 'tongsheng', NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-06-27 05:44:07');
INSERT INTO `sys_oper_log` VALUES (355, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, 'tongsheng', NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-06-27 05:45:51');
INSERT INTO `sys_oper_log` VALUES (356, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, 'tongsheng', NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-06-27 05:45:57');
INSERT INTO `sys_oper_log` VALUES (357, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, 'tongsheng', NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-06-27 05:46:26');
INSERT INTO `sys_oper_log` VALUES (358, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, 'tongsheng', NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-06-27 05:53:31');
INSERT INTO `sys_oper_log` VALUES (359, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, 'tongsheng', NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-06-27 05:53:37');
INSERT INTO `sys_oper_log` VALUES (360, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, 'tongsheng', NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-06-27 05:54:14');
INSERT INTO `sys_oper_log` VALUES (361, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, 'tongsheng', NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-06-27 05:54:18');
INSERT INTO `sys_oper_log` VALUES (362, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, 'tongsheng', NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-06-27 05:54:44');
INSERT INTO `sys_oper_log` VALUES (363, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, 'tongsheng', NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-06-27 05:54:48');
INSERT INTO `sys_oper_log` VALUES (364, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, 'tongsheng', NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-06-27 05:55:06');
INSERT INTO `sys_oper_log` VALUES (365, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, 'tongsheng', NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-06-27 05:56:25');
INSERT INTO `sys_oper_log` VALUES (366, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, 'tongsheng', NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-06-27 05:56:28');
INSERT INTO `sys_oper_log` VALUES (367, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, NULL, NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-06-27 05:59:25');
INSERT INTO `sys_oper_log` VALUES (368, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, NULL, NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-06-27 05:59:56');
INSERT INTO `sys_oper_log` VALUES (369, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, NULL, NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-06-27 06:00:57');
INSERT INTO `sys_oper_log` VALUES (370, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, NULL, NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-06-27 06:01:55');
INSERT INTO `sys_oper_log` VALUES (371, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, NULL, NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-06-27 06:02:32');
INSERT INTO `sys_oper_log` VALUES (372, '菜单管理', 2, 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 1, 'admin', '管理', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2013\"],\"parentId\":[\"3\"],\"menuType\":[\"C\"],\"menuName\":[\"运单\"],\"url\":[\"/apply/waybills\"],\"perms\":[\"platform:waybills:view\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', 0, NULL, '2019-06-27 07:13:55');
INSERT INTO `sys_oper_log` VALUES (373, '菜单管理', 2, 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 1, 'admin', '管理', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2008\"],\"parentId\":[\"3\"],\"menuType\":[\"C\"],\"menuName\":[\"订单\"],\"url\":[\"/apply/orders\"],\"perms\":[\"platform:orders:view\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', 0, NULL, '2019-06-27 07:14:03');
INSERT INTO `sys_oper_log` VALUES (374, '菜单管理', 2, 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 1, 'admin', NULL, '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2013\"],\"parentId\":[\"1\"],\"menuType\":[\"C\"],\"menuName\":[\"运单列表\"],\"url\":[\"/apply/waybills\"],\"perms\":[\"platform:waybills:view\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', 0, NULL, '2019-06-27 07:52:07');
INSERT INTO `sys_oper_log` VALUES (375, '菜单管理', 2, 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 1, 'admin', NULL, '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2008\"],\"parentId\":[\"1\"],\"menuType\":[\"C\"],\"menuName\":[\"订单列表\"],\"url\":[\"/apply/orders\"],\"perms\":[\"platform:orders:view\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', 0, NULL, '2019-06-27 07:52:23');
INSERT INTO `sys_oper_log` VALUES (376, '菜单管理', 2, 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 1, 'admin', NULL, '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"100\"],\"parentId\":[\"1\"],\"menuType\":[\"C\"],\"menuName\":[\"用户管理\"],\"url\":[\"/system/user\"],\"perms\":[\"system:user:view\"],\"orderNum\":[\"2\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', 0, NULL, '2019-06-27 07:52:41');
INSERT INTO `sys_oper_log` VALUES (377, '菜单管理', 3, 'com.ruoyi.project.system.menu.controller.MenuController.remove()', 1, 'admin', NULL, '/system/menu/remove/2002', '127.0.0.1', '内网IP', '{}', 0, NULL, '2019-06-27 07:53:11');
INSERT INTO `sys_oper_log` VALUES (378, '菜单管理', 3, 'com.ruoyi.project.system.menu.controller.MenuController.remove()', 1, 'admin', NULL, '/system/menu/remove/2015', '127.0.0.1', '内网IP', '{}', 0, NULL, '2019-06-27 07:53:32');
INSERT INTO `sys_oper_log` VALUES (379, '菜单管理', 3, 'com.ruoyi.project.system.menu.controller.MenuController.remove()', 1, 'admin', NULL, '/system/menu/remove/2016', '127.0.0.1', '内网IP', '{}', 0, NULL, '2019-06-27 07:53:45');
INSERT INTO `sys_oper_log` VALUES (380, '菜单管理', 3, 'com.ruoyi.project.system.menu.controller.MenuController.remove()', 1, 'admin', NULL, '/system/menu/remove/2017', '127.0.0.1', '内网IP', '{}', 0, NULL, '2019-06-27 07:53:53');
INSERT INTO `sys_oper_log` VALUES (381, '菜单管理', 3, 'com.ruoyi.project.system.menu.controller.MenuController.remove()', 1, 'admin', NULL, '/system/menu/remove/2010', '127.0.0.1', '内网IP', '{}', 0, NULL, '2019-06-27 07:54:08');
INSERT INTO `sys_oper_log` VALUES (382, '菜单管理', 3, 'com.ruoyi.project.system.menu.controller.MenuController.remove()', 1, 'admin', NULL, '/system/menu/remove/2012', '127.0.0.1', '内网IP', '{}', 0, NULL, '2019-06-27 07:54:21');
INSERT INTO `sys_oper_log` VALUES (383, '菜单管理', 3, 'com.ruoyi.project.system.menu.controller.MenuController.remove()', 1, 'admin', NULL, '/system/menu/remove/2011', '127.0.0.1', '内网IP', '{}', 0, NULL, '2019-06-27 07:54:27');
INSERT INTO `sys_oper_log` VALUES (384, '角色管理', 2, 'com.ruoyi.project.system.role.controller.RoleController.editSave()', 1, 'admin', NULL, '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"100\"],\"roleName\":[\"融资机构\"],\"roleKey\":[\"bank\"],\"roleSort\":[\"3\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"1,2013,2014,2008,2009,2005,2007,2006,107,1035\"]}', 0, NULL, '2019-06-27 08:02:31');
INSERT INTO `sys_oper_log` VALUES (385, '菜单管理', 1, 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', 1, 'admin', '管理', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2013\"],\"menuType\":[\"F\"],\"menuName\":[\"导出\"],\"url\":[\"\"],\"perms\":[\"platform:orders:export\"],\"orderNum\":[\"2\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', 0, NULL, '2019-06-27 08:04:56');
INSERT INTO `sys_oper_log` VALUES (386, '菜单管理', 1, 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', 1, 'admin', '管理', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2008\"],\"menuType\":[\"F\"],\"menuName\":[\"导出\"],\"url\":[\"\"],\"perms\":[\"platform:orders:export\"],\"orderNum\":[\"2\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', 0, NULL, '2019-06-27 08:05:23');
INSERT INTO `sys_oper_log` VALUES (387, '菜单管理', 2, 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 1, 'admin', '管理', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2018\"],\"parentId\":[\"2013\"],\"menuType\":[\"F\"],\"menuName\":[\"导出\"],\"url\":[\"#\"],\"perms\":[\"platform:waybills:export\"],\"orderNum\":[\"2\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', 0, NULL, '2019-06-27 08:05:39');
INSERT INTO `sys_oper_log` VALUES (388, '角色管理', 2, 'com.ruoyi.project.system.role.controller.RoleController.editSave()', 1, 'admin', '管理', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"100\"],\"roleName\":[\"融资机构\"],\"roleKey\":[\"bank\"],\"roleSort\":[\"3\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"1,2005,2007,2006,2013,2014,2018,2008,2009,2019,107,1035\"]}', 0, NULL, '2019-06-27 08:05:55');
INSERT INTO `sys_oper_log` VALUES (389, '重置密码', 2, 'com.ruoyi.project.system.user.controller.UserController.resetPwd()', 1, 'admin', '管理', '/system/user/resetPwd/2', '127.0.0.1', '内网IP', '{}', 0, NULL, '2019-06-27 08:24:32');
INSERT INTO `sys_oper_log` VALUES (390, '重置密码', 2, 'com.ruoyi.project.system.user.controller.UserController.resetPwd()', 1, 'admin', '管理', '/system/user/resetPwd/2', '127.0.0.1', '内网IP', '{}', 0, NULL, '2019-06-27 08:24:39');
INSERT INTO `sys_oper_log` VALUES (391, '菜单管理', 1, 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', 1, 'admin', NULL, '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2008\"],\"menuType\":[\"F\"],\"menuName\":[\"详细\"],\"url\":[\"\"],\"perms\":[\"platform:orders:detail\"],\"orderNum\":[\"3\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', 0, NULL, '2019-06-27 08:30:59');
INSERT INTO `sys_oper_log` VALUES (392, '角色管理', 2, 'com.ruoyi.project.system.role.controller.RoleController.editSave()', 1, 'admin', '管理', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"100\"],\"roleName\":[\"融资机构\"],\"roleKey\":[\"bank\"],\"roleSort\":[\"3\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"1,2013,2014,2018,2008,2009,2019,2020,2005,2007,2006,107,1035\"]}', 0, NULL, '2019-06-27 08:42:52');
INSERT INTO `sys_oper_log` VALUES (393, '菜单管理', 1, 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', 1, 'admin', NULL, '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2013\"],\"menuType\":[\"F\"],\"menuName\":[\"详细\"],\"url\":[\"\"],\"perms\":[\"platform:waybills:detail\"],\"orderNum\":[\"3\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', 0, NULL, '2019-06-27 14:30:20');
INSERT INTO `sys_oper_log` VALUES (394, '角色管理', 2, 'com.ruoyi.project.system.role.controller.RoleController.editSave()', 1, 'admin', '管理', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"100\"],\"roleName\":[\"融资机构\"],\"roleKey\":[\"bank\"],\"roleSort\":[\"3\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"1,2013,2014,2018,2021,2008,2009,2019,2020,2005,2007,2006,107,1035\"]}', 0, NULL, '2019-06-27 16:07:40');
INSERT INTO `sys_oper_log` VALUES (395, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, NULL, NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-06-28 00:33:34');
INSERT INTO `sys_oper_log` VALUES (396, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, NULL, NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-06-28 03:40:39');
INSERT INTO `sys_oper_log` VALUES (397, '菜单管理', 1, 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', 1, 'admin', NULL, '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1\"],\"menuType\":[\"C\"],\"menuName\":[\"测试\"],\"url\":[\"/apply/test\"],\"perms\":[\"\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', 0, NULL, '2019-06-28 06:18:32');
INSERT INTO `sys_oper_log` VALUES (398, '角色管理', 2, 'com.ruoyi.project.system.role.controller.RoleController.editSave()', 1, 'admin', '管理', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"100\"],\"roleName\":[\"融资机构\"],\"roleKey\":[\"bank\"],\"roleSort\":[\"3\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"1,2022,2005,2007,2006,2013,2014,2018,2021,2008,2009,2019,2020,107,1035\"]}', 0, NULL, '2019-06-28 06:21:55');
INSERT INTO `sys_oper_log` VALUES (399, '角色管理', 2, 'com.ruoyi.project.system.role.controller.RoleController.editSave()', 1, 'admin', '管理', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"100\"],\"roleName\":[\"融资机构\"],\"roleKey\":[\"bank\"],\"roleSort\":[\"3\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"1,2005,2007,2006,2013,2014,2018,2021,2008,2009,2019,2020,107,1035\"]}', 0, NULL, '2019-06-28 06:24:53');
INSERT INTO `sys_oper_log` VALUES (400, '菜单管理', 3, 'com.ruoyi.project.system.menu.controller.MenuController.remove()', 1, 'admin', '管理', '/system/menu/remove/2022', '127.0.0.1', '内网IP', '{}', 0, NULL, '2019-06-28 06:25:00');
INSERT INTO `sys_oper_log` VALUES (401, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, NULL, NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-06-28 09:08:47');
INSERT INTO `sys_oper_log` VALUES (402, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, NULL, NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-06-28 09:28:08');
INSERT INTO `sys_oper_log` VALUES (403, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, NULL, NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-06-28 09:56:00');
INSERT INTO `sys_oper_log` VALUES (404, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, NULL, NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-06-28 09:57:03');
INSERT INTO `sys_oper_log` VALUES (405, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, NULL, NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-06-28 09:57:33');
INSERT INTO `sys_oper_log` VALUES (406, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, NULL, NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-06-28 09:57:44');
INSERT INTO `sys_oper_log` VALUES (407, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, NULL, NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-06-28 09:58:30');
INSERT INTO `sys_oper_log` VALUES (408, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, NULL, NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-06-28 10:06:23');
INSERT INTO `sys_oper_log` VALUES (409, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, NULL, NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-06-28 10:07:06');
INSERT INTO `sys_oper_log` VALUES (410, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, NULL, NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-06-28 10:08:16');
INSERT INTO `sys_oper_log` VALUES (411, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, NULL, NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-06-28 10:08:31');
INSERT INTO `sys_oper_log` VALUES (412, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, NULL, NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-06-28 10:09:14');
INSERT INTO `sys_oper_log` VALUES (413, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, NULL, NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-07-01 00:50:36');
INSERT INTO `sys_oper_log` VALUES (414, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, NULL, NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-07-01 00:55:01');
INSERT INTO `sys_oper_log` VALUES (415, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, NULL, NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-07-01 00:57:24');
INSERT INTO `sys_oper_log` VALUES (416, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, NULL, NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-07-01 01:17:46');
INSERT INTO `sys_oper_log` VALUES (417, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, NULL, NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-07-01 01:20:59');
INSERT INTO `sys_oper_log` VALUES (418, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, NULL, NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-07-01 09:42:49');
INSERT INTO `sys_oper_log` VALUES (419, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, NULL, NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-07-01 09:43:55');
INSERT INTO `sys_oper_log` VALUES (420, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, NULL, NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-07-01 09:43:59');
INSERT INTO `sys_oper_log` VALUES (421, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, NULL, NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-07-01 09:44:12');
INSERT INTO `sys_oper_log` VALUES (422, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, NULL, NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-07-01 09:45:14');
INSERT INTO `sys_oper_log` VALUES (423, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, NULL, NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-07-01 09:46:19');
INSERT INTO `sys_oper_log` VALUES (424, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, NULL, NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-07-01 09:47:21');
INSERT INTO `sys_oper_log` VALUES (425, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, NULL, NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-07-01 09:47:39');
INSERT INTO `sys_oper_log` VALUES (426, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, NULL, NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-07-01 09:49:22');
INSERT INTO `sys_oper_log` VALUES (427, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, NULL, NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-07-01 09:51:53');
INSERT INTO `sys_oper_log` VALUES (428, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, NULL, NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-07-02 03:03:15');
INSERT INTO `sys_oper_log` VALUES (429, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, NULL, NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-07-02 03:14:06');
INSERT INTO `sys_oper_log` VALUES (430, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, NULL, NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-07-02 03:15:15');
INSERT INTO `sys_oper_log` VALUES (431, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, NULL, NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-07-02 03:17:23');
INSERT INTO `sys_oper_log` VALUES (432, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, NULL, NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-07-02 03:22:42');
INSERT INTO `sys_oper_log` VALUES (433, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, NULL, NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-07-02 03:23:20');
INSERT INTO `sys_oper_log` VALUES (434, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, NULL, NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-07-02 03:32:32');
INSERT INTO `sys_oper_log` VALUES (435, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, NULL, NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-07-02 03:33:29');
INSERT INTO `sys_oper_log` VALUES (436, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, NULL, NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-07-02 03:48:25');
INSERT INTO `sys_oper_log` VALUES (437, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, NULL, NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-07-02 03:48:59');
INSERT INTO `sys_oper_log` VALUES (438, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, NULL, NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-07-02 03:53:19');
INSERT INTO `sys_oper_log` VALUES (439, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, NULL, NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-07-02 03:57:13');
INSERT INTO `sys_oper_log` VALUES (440, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, NULL, NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-07-02 09:33:49');
INSERT INTO `sys_oper_log` VALUES (441, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, NULL, NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-07-02 10:06:42');
INSERT INTO `sys_oper_log` VALUES (442, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, NULL, NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-07-02 10:08:03');
INSERT INTO `sys_oper_log` VALUES (443, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, NULL, NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-07-02 10:08:10');
INSERT INTO `sys_oper_log` VALUES (444, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, NULL, NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-07-02 10:09:26');
INSERT INTO `sys_oper_log` VALUES (445, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, NULL, NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-07-02 10:11:35');
INSERT INTO `sys_oper_log` VALUES (446, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, NULL, NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-07-02 10:12:58');
INSERT INTO `sys_oper_log` VALUES (447, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, NULL, NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-07-02 13:38:49');
INSERT INTO `sys_oper_log` VALUES (448, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, NULL, NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-07-02 13:43:58');
INSERT INTO `sys_oper_log` VALUES (449, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, NULL, NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-07-02 13:44:15');
INSERT INTO `sys_oper_log` VALUES (450, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, NULL, NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-07-02 13:45:07');
INSERT INTO `sys_oper_log` VALUES (451, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, NULL, NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-07-02 13:46:32');
INSERT INTO `sys_oper_log` VALUES (452, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, NULL, NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-07-02 13:48:17');
INSERT INTO `sys_oper_log` VALUES (453, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, NULL, NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-07-02 13:51:56');
INSERT INTO `sys_oper_log` VALUES (454, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, NULL, NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-07-02 13:56:17');
INSERT INTO `sys_oper_log` VALUES (455, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, NULL, NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-07-02 13:57:10');
INSERT INTO `sys_oper_log` VALUES (456, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, NULL, NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-07-02 14:01:48');
INSERT INTO `sys_oper_log` VALUES (457, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, NULL, NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-07-02 14:04:07');
INSERT INTO `sys_oper_log` VALUES (458, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, NULL, NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-07-02 14:04:14');
INSERT INTO `sys_oper_log` VALUES (459, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, NULL, NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-07-02 14:05:35');
INSERT INTO `sys_oper_log` VALUES (460, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, NULL, NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-07-02 14:09:33');
INSERT INTO `sys_oper_log` VALUES (461, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, NULL, NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-07-02 14:10:22');
INSERT INTO `sys_oper_log` VALUES (462, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, NULL, NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-07-02 14:18:57');
INSERT INTO `sys_oper_log` VALUES (463, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, NULL, NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-07-02 14:22:26');
INSERT INTO `sys_oper_log` VALUES (464, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, NULL, NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-07-02 14:27:26');
INSERT INTO `sys_oper_log` VALUES (465, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, NULL, NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-07-02 14:28:18');
INSERT INTO `sys_oper_log` VALUES (466, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, NULL, NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-07-02 14:28:57');
INSERT INTO `sys_oper_log` VALUES (467, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, NULL, NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-07-02 14:29:17');
INSERT INTO `sys_oper_log` VALUES (468, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, NULL, NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-07-02 14:32:05');
INSERT INTO `sys_oper_log` VALUES (469, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, NULL, NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-07-02 14:32:13');
INSERT INTO `sys_oper_log` VALUES (470, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, NULL, NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-07-02 14:34:33');
INSERT INTO `sys_oper_log` VALUES (471, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, NULL, NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-07-02 14:35:39');
INSERT INTO `sys_oper_log` VALUES (472, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, NULL, NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-07-02 14:45:32');
INSERT INTO `sys_oper_log` VALUES (473, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, NULL, NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-07-02 14:46:06');
INSERT INTO `sys_oper_log` VALUES (474, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, NULL, NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-07-02 14:47:00');
INSERT INTO `sys_oper_log` VALUES (475, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, 'tongsheng', '审核', '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-07-02 14:48:24');
INSERT INTO `sys_oper_log` VALUES (476, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, 'tongsheng', '审核', '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-07-02 14:50:24');
INSERT INTO `sys_oper_log` VALUES (477, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, 'tongsheng', '审核', '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-07-02 14:51:30');
INSERT INTO `sys_oper_log` VALUES (478, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, 'tongsheng', '审核', '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-07-02 14:52:50');
INSERT INTO `sys_oper_log` VALUES (479, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, 'tongsheng', '审核', '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-07-02 14:52:58');
INSERT INTO `sys_oper_log` VALUES (480, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, 'tongsheng', '审核', '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-07-02 14:56:08');
INSERT INTO `sys_oper_log` VALUES (481, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, 'tongsheng', '审核', '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-07-02 14:59:37');
INSERT INTO `sys_oper_log` VALUES (482, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, 'tongsheng', '审核', '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-07-02 14:59:42');
INSERT INTO `sys_oper_log` VALUES (483, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, 'tongsheng', '审核', '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-07-02 15:03:06');
INSERT INTO `sys_oper_log` VALUES (484, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, 'tongsheng', '审核', '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-07-02 15:03:26');
INSERT INTO `sys_oper_log` VALUES (485, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, 'tongsheng', '审核', '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-07-02 15:04:30');
INSERT INTO `sys_oper_log` VALUES (486, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, 'tongsheng', '审核', '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-07-02 15:04:32');
INSERT INTO `sys_oper_log` VALUES (487, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, 'tongsheng', '审核', '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-07-02 15:06:00');
INSERT INTO `sys_oper_log` VALUES (488, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, 'tongsheng', '审核', '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-07-02 15:06:07');
INSERT INTO `sys_oper_log` VALUES (489, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, 'tongsheng', '审核', '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-07-02 15:08:25');
INSERT INTO `sys_oper_log` VALUES (490, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, 'tongsheng', '审核', '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-07-02 15:09:57');
INSERT INTO `sys_oper_log` VALUES (491, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, 'tongsheng', '审核', '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-07-02 15:10:33');
INSERT INTO `sys_oper_log` VALUES (492, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, 'tongsheng', '审核', '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-07-02 15:11:34');
INSERT INTO `sys_oper_log` VALUES (493, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, 'tongsheng', '审核', '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-07-02 15:11:56');
INSERT INTO `sys_oper_log` VALUES (494, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, 'tongsheng', '审核', '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-07-02 15:13:02');
INSERT INTO `sys_oper_log` VALUES (495, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, 'tongsheng', '审核', '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-07-02 15:13:17');
INSERT INTO `sys_oper_log` VALUES (496, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, 'tongsheng', '审核', '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-07-02 15:14:18');
INSERT INTO `sys_oper_log` VALUES (497, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, 'tongsheng', '审核', '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-07-02 15:18:26');
INSERT INTO `sys_oper_log` VALUES (498, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, 'tongsheng', '审核', '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-07-02 15:21:03');
INSERT INTO `sys_oper_log` VALUES (499, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, 'tongsheng', '审核', '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-07-02 15:26:08');
INSERT INTO `sys_oper_log` VALUES (500, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, 'tongsheng', '审核', '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-07-02 15:30:18');
INSERT INTO `sys_oper_log` VALUES (501, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, NULL, NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-07-03 01:25:08');
INSERT INTO `sys_oper_log` VALUES (502, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, NULL, NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-07-03 01:25:15');
INSERT INTO `sys_oper_log` VALUES (503, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, NULL, NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-07-03 01:26:47');
INSERT INTO `sys_oper_log` VALUES (504, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, NULL, NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-07-03 02:06:23');
INSERT INTO `sys_oper_log` VALUES (505, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, 'tongsheng', '审核', '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-07-03 06:12:24');
INSERT INTO `sys_oper_log` VALUES (506, '申请表-行好运网提交申请-跳转页面', 0, 'com.ruoyi.project.platform.apply.controller.ApplyController.present()', 1, 'tongsheng', NULL, '/apply/present', '127.0.0.1', '内网IP', NULL, 0, NULL, '2019-07-03 06:18:44');

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int(4) NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '岗位信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'admin', '管理员', 1, '0', 'admin', '2018-03-16 11:33:00', 'admin', '2019-06-25 01:35:51', '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_post` VALUES (5, 'check', '审核人员', 5, '0', 'admin', '2019-06-25 01:07:54', 'admin', '2019-06-25 01:17:21', '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(4) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 101 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '管理员', 'admin', 1, '1', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', '0', '2', 'admin', '2018-03-16 11:33:00', 'admin', '2019-06-21 03:10:56', '普通角色');
INSERT INTO `sys_role` VALUES (100, '融资机构', 'bank', 3, '2', '0', '0', 'admin', '2019-06-25 02:05:14', 'admin', '2019-06-28 06:24:53', '');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和部门关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (2, 100);
INSERT INTO `sys_role_dept` VALUES (2, 101);
INSERT INTO `sys_role_dept` VALUES (2, 105);
INSERT INTO `sys_role_dept` VALUES (100, 100);
INSERT INTO `sys_role_dept` VALUES (100, 200);
INSERT INTO `sys_role_dept` VALUES (100, 202);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 100);
INSERT INTO `sys_role_menu` VALUES (2, 107);
INSERT INTO `sys_role_menu` VALUES (2, 1000);
INSERT INTO `sys_role_menu` VALUES (2, 1006);
INSERT INTO `sys_role_menu` VALUES (2, 1035);
INSERT INTO `sys_role_menu` VALUES (2, 1036);
INSERT INTO `sys_role_menu` VALUES (2, 1037);
INSERT INTO `sys_role_menu` VALUES (2, 1038);
INSERT INTO `sys_role_menu` VALUES (100, 1);
INSERT INTO `sys_role_menu` VALUES (100, 107);
INSERT INTO `sys_role_menu` VALUES (100, 1035);
INSERT INTO `sys_role_menu` VALUES (100, 2005);
INSERT INTO `sys_role_menu` VALUES (100, 2006);
INSERT INTO `sys_role_menu` VALUES (100, 2007);
INSERT INTO `sys_role_menu` VALUES (100, 2008);
INSERT INTO `sys_role_menu` VALUES (100, 2009);
INSERT INTO `sys_role_menu` VALUES (100, 2013);
INSERT INTO `sys_role_menu` VALUES (100, 2014);
INSERT INTO `sys_role_menu` VALUES (100, 2018);
INSERT INTO `sys_role_menu` VALUES (100, 2019);
INSERT INTO `sys_role_menu` VALUES (100, 2020);
INSERT INTO `sys_role_menu` VALUES (100, 2021);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(20) NULL DEFAULT NULL COMMENT '部门ID',
  `login_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '登录账号',
  `user_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '头像路径',
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '密码',
  `salt` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '盐加密',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '最后登陆IP',
  `login_date` datetime(0) NULL DEFAULT NULL COMMENT '最后登陆时间',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 102 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '管理员', '00', 'xxx@qq.com', '15888888888', '1', '', '29c67a30398638269fe600f73a054934', '111111', '0', '0', '10.65.0.5', '2019-07-04 10:22:54', 'admin', '2018-03-16 11:33:00', 'ry', '2019-07-04 02:22:54', '管理员');
INSERT INTO `sys_user` VALUES (2, 202, 'ry', '审核', '00', 'ry@qq.com', '15666666666', '0', '', 'db181b83c6607d4aad41202b01d397b6', '56d2b6', '0', '0', '127.0.0.1', '2019-06-21 11:11:10', 'admin', '2018-03-16 11:33:00', 'admin', '2019-06-25 01:35:08', '测试员');
INSERT INTO `sys_user` VALUES (100, 202, 'tongsheng', '通盛审核', '00', 'xx@qq.com', '13888888888', '2', '', '92d03500dc7ef1c3fd0776161647d1f8', 'e890dd', '0', '0', '10.65.0.5', '2019-07-04 10:26:06', 'admin', '2019-06-25 02:03:46', 'admin', '2019-07-04 02:26:05', NULL);

-- ----------------------------
-- Table structure for sys_user_online
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_online`;
CREATE TABLE `sys_user_online`  (
  `sessionId` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户会话id',
  `login_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录账号',
  `dept_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `ipaddr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '在线状态on_line在线off_line离线',
  `start_timestamp` datetime(0) NULL DEFAULT NULL COMMENT 'session创建时间',
  `last_access_time` datetime(0) NULL DEFAULT NULL COMMENT 'session最后访问时间',
  `expire_time` int(5) NULL DEFAULT 0 COMMENT '超时时间，单位为分钟',
  PRIMARY KEY (`sessionId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '在线用户记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);
INSERT INTO `sys_user_post` VALUES (2, 5);
INSERT INTO `sys_user_post` VALUES (100, 5);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户和角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (100, 100);

-- ----------------------------
-- Table structure for waybills
-- ----------------------------
DROP TABLE IF EXISTS `waybills`;
CREATE TABLE `waybills`  (
  `id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '运单id',
  `number` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '运单号',
  `actual_count` decimal(12, 4) NULL DEFAULT NULL COMMENT '装货量',
  `back_count` decimal(12, 4) NULL DEFAULT NULL COMMENT '到货量',
  `driver_name` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '司机',
  `car_vno` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '车牌',
  `price` decimal(12, 2) NULL DEFAULT NULL COMMENT '单价',
  `cost` decimal(12, 2) NULL DEFAULT NULL COMMENT '运单应收费用',
  `load_date` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '装货时间 格式 yyyy-MM-dd HH:mm:ss 没装货该字段为-',
  `arrival_date` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '到货时间 格式 yyyy-MM-dd HH:mm:ss 没到货该字段为-',
  `status` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '运单状态 已接单, 已装货, 运输中, 到货交付, 已回单, 已结算',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '运单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of waybills
-- ----------------------------
INSERT INTO `waybills` VALUES ('0644e4d9-4a7e-4c3b-9db0-73ded570be8e', 'Y19060697713', 49.6000, 0.0000, '蓝昌永', '桂AP0201', 102.00, 0.00, '2019-06-06 16:17:48', '-', '运输中', NULL, NULL, NULL, NULL);
INSERT INTO `waybills` VALUES ('102e26f8-a121-4e59-95e6-ac9005f1bfa2', 'Y19060697715', 49.6000, 0.0000, '吕军', '桂AS7271', 102.00, 0.00, '2019-06-08 16:39:40', '-', '运输中', NULL, NULL, NULL, NULL);
INSERT INTO `waybills` VALUES ('38ae4279-72d7-4e35-b258-50fb8286f9c0', 'Y19060697712', 49.6000, 0.0000, '黄启勇', '桂AN9180', 102.00, 0.00, '2019-06-05 16:16:58', '-', '运输中', NULL, NULL, NULL, NULL);
INSERT INTO `waybills` VALUES ('3c2f3c16-0a82-44fd-badd-fc628b031c83', 'Y19060697708', 44.9500, 0.0000, '林俭', '桂AS5338', 102.00, 0.00, '2019-06-04 16:11:27', '-', '运输中', NULL, NULL, NULL, NULL);
INSERT INTO `waybills` VALUES ('4739c034-1f28-4f78-afe3-0b92b1db72a9', 'Y19060697716', 49.6000, 0.0000, '张敏', '桂AN5221', 102.00, 0.00, '2019-06-12 16:39:20', '-', '运输中', NULL, NULL, NULL, NULL);
INSERT INTO `waybills` VALUES ('493e7073-94e1-4eca-9410-773b50c5d598', 'Y19060697717', 49.6000, 0.0000, '熊永留', '桂AP8156', 102.00, 0.00, '2019-06-08 16:47:04', '-', '运输中', NULL, NULL, NULL, NULL);
INSERT INTO `waybills` VALUES ('6e53b8e6-3d65-4e56-ba2a-3ff2ce8a8a80', 'Y19060697718', 44.9500, 0.0000, '覃一容', '桂AP5211', 102.00, 0.00, '2019-06-09 16:47:58', '-', '运输中', NULL, NULL, NULL, NULL);
INSERT INTO `waybills` VALUES ('6faa009f-5219-4eff-ac74-94a893c8cba7', 'Y19060697705', 49.6000, 49.7600, '覃然', '桂AN6181', 102.00, 5075.52, '2019-06-03 16:07:19', '2019-06-07 00:00:00', '已回单', NULL, NULL, NULL, NULL);
INSERT INTO `waybills` VALUES ('79aeb65f-fb47-48a8-93c4-1b6fa64b6be6', 'Y19060697721', 44.9500, 0.0000, '黄佑宏', '桂AP0827', 102.00, 0.00, '2019-06-10 16:49:39', '-', '运输中', NULL, NULL, NULL, NULL);
INSERT INTO `waybills` VALUES ('83c32f32-762b-419a-9454-3db4863a08d1', 'Y19060697704', 49.6000, 0.0000, '黄高达', '桂AN9180', 102.00, 0.00, '2019-06-01 16:06:54', '-', '运输中', NULL, NULL, NULL, NULL);
INSERT INTO `waybills` VALUES ('8e8773f1-a864-4148-8779-5d95977d97f5', 'Y19060697714', 49.6000, 0.0000, '李世广', '桂AP1106', 102.00, 0.00, '2019-06-11 16:38:53', '-', '运输中', NULL, NULL, NULL, NULL);
INSERT INTO `waybills` VALUES ('96e18190-8170-4c82-9ffb-e92d2a612568', 'Y19060697720', 49.6000, 0.0000, '韦华春', '桂AN9180', 102.00, 0.00, '2019-06-10 16:49:15', '-', '运输中', NULL, NULL, NULL, NULL);
INSERT INTO `waybills` VALUES ('ab868839-118b-4f56-8847-4bf5d704b622', 'Y19060697706', 44.9500, 45.1000, '陈尚伟', '桂AP0827', 102.00, 4600.20, '2019-06-03 16:10:51', '2019-06-04 00:00:00', '已回单', NULL, NULL, NULL, NULL);
INSERT INTO `waybills` VALUES ('bb7e082f-485d-455e-8639-c2c5811211bb', 'Y19060697709', 49.6000, 0.0000, '吴永松', '桂AS0918', 102.00, 0.00, '2019-06-04 16:14:43', '-', '运输中', NULL, NULL, NULL, NULL);
INSERT INTO `waybills` VALUES ('c0917b97-857f-42d9-a4df-5512f180674b', 'Y19060697719', 44.9500, 0.0000, '李世广', '桂AP5277', 102.00, 0.00, '2019-06-09 16:48:36', '-', '运输中', NULL, NULL, NULL, NULL);
INSERT INTO `waybills` VALUES ('cf142daf-a27e-48e3-9548-602737ca88b0', 'Y19060697707', 49.6000, 49.6200, '苏卫', '桂AS8797', 102.00, 5059.20, '2019-06-04 16:11:11', '2019-06-05 00:00:00', '已回单', NULL, NULL, NULL, NULL);
INSERT INTO `waybills` VALUES ('cf8f08d4-a77c-492b-83a0-4ebc2521d8f4', 'Y19060697711', 44.9500, 0.0000, '浦健', '桂AP5211', 102.00, 0.00, '2019-06-04 16:16:32', '-', '运输中', NULL, NULL, NULL, NULL);
INSERT INTO `waybills` VALUES ('de2e7afa-5749-4f72-8947-2c1b2444c486', 'Y19060697722', 44.9500, 0.0000, '潘启航', '桂AP1871', 102.00, 0.00, '2019-06-10 16:50:23', '-', '运输中', NULL, NULL, NULL, NULL);
INSERT INTO `waybills` VALUES ('e43c81a2-19c5-44f6-8984-f0ab3ab72f33', 'Y19060697723', 49.6000, 0.0000, '黄高达', '桂AS7017', 102.00, 0.00, '2019-06-10 16:50:36', '-', '运输中', NULL, NULL, NULL, NULL);
INSERT INTO `waybills` VALUES ('fb2f40a1-6fd6-4775-b071-8fc10118156a', 'Y19060697710', 49.6000, 0.0000, '能永留', '桂AS7017', 102.00, 0.00, '2019-06-04 16:15:52', '-', '运输中', NULL, NULL, NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;
