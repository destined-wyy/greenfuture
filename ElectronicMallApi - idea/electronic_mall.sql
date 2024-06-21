/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80019
 Source Host           : localhost:3306
 Source Schema         : electronic_mall

 Target Server Type    : MySQL
 Target Server Version : 80019
 File Encoding         : 65001

 Date: 10/08/2023 20:33:14
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for address
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `link_user` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '联系人',
  `link_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '地址',
  `link_phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '电话',
  `user_id` bigint(0) NULL DEFAULT NULL COMMENT '所属用户',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '地址表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of address
-- ----------------------------
INSERT INTO `address` VALUES (1, '张三', '北京市', '13333333333', 1);
INSERT INTO `address` VALUES (2, '张三', '北京市', '15888888888', 2);
INSERT INTO `address` VALUES (3, '张三', '上海市', '15555555555', 2);
INSERT INTO `address` VALUES (4, '张三', '新疆', '15888888888', 2);

-- ----------------------------
-- Table structure for avatar
-- ----------------------------
DROP TABLE IF EXISTS `avatar`;
CREATE TABLE `avatar`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `size` bigint(0) NULL DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `md5` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '头像表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of avatar
-- ----------------------------
INSERT INTO `avatar` VALUES (2, 'jpg', 492, '/avatar/978418fbe75243b4ba38da389a468b78.jpg', '1e5802c8b96198fd524cc91ad3f9d476');
INSERT INTO `avatar` VALUES (3, 'jpg', 146, '/avatar/e8663626d17b41bd89707299fcd5ac81.jpg', '5c072037e4e9662831fe448e28795770');
INSERT INTO `avatar` VALUES (4, 'jpg', 175, '/avatar/09cd5add81ff4abfbd1ccf91b2e9c820.jpg', '507704f05fbca53793bce9970b40e6c8');

-- ----------------------------
-- Table structure for carousel
-- ----------------------------
DROP TABLE IF EXISTS `carousel`;
CREATE TABLE `carousel`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `good_id` bigint(0) NULL DEFAULT NULL COMMENT '对应的商品id',
  `show_order` int(0) NULL DEFAULT NULL COMMENT '播放顺序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '轮播图表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of carousel
-- ----------------------------
INSERT INTO `carousel` VALUES (4, 5, 2);
INSERT INTO `carousel` VALUES (5, 4, 3);
INSERT INTO `carousel` VALUES (6, 7, 4);

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `count` int(0) NULL DEFAULT NULL COMMENT '数量',
  `create_time` datetime NULL DEFAULT NULL COMMENT '加入时间',
  `good_id` bigint(0) NULL DEFAULT NULL COMMENT '商品id',
  `standard` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `user_id` bigint(0) NULL DEFAULT NULL COMMENT '用户id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '购物车表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cart
-- ----------------------------
INSERT INTO `cart` VALUES (2, 1, '2023-07-15 13:48:00', 2, 'M 中码', 2);
INSERT INTO `cart` VALUES (3, 1, '2023-07-15 13:48:04', 5, '白色', 2);
INSERT INTO `cart` VALUES (4, 1, '2023-07-15 13:48:08', 7, '43码', 2);

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '类别名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '分类表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1, '女装');
INSERT INTO `category` VALUES (2, '男装');
INSERT INTO `category` VALUES (10, '运动鞋');
INSERT INTO `category` VALUES (11, '休闲鞋');
INSERT INTO `category` VALUES (12, '靴子');
INSERT INTO `category` VALUES (13, '办公用品');
INSERT INTO `category` VALUES (14, '书籍');
INSERT INTO `category` VALUES (15, '笔记本');
INSERT INTO `category` VALUES (16, '手机');
INSERT INTO `category` VALUES (17, '平板电脑');
INSERT INTO `category` VALUES (18, '烹饪食材');
INSERT INTO `category` VALUES (19, '白酒');
INSERT INTO `category` VALUES (20, '茶叶');
INSERT INTO `category` VALUES (21, '咖啡');
INSERT INTO `category` VALUES (22, '宠物用品');
INSERT INTO `category` VALUES (23, '宠物饲料');

-- ----------------------------
-- Table structure for good
-- ----------------------------
DROP TABLE IF EXISTS `good`;
CREATE TABLE `good`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '商品名称',
  `description` varchar(1600) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '描述',
  `discount` double(10, 2) NOT NULL DEFAULT 1.00 COMMENT '折扣',
  `sales` bigint(0) NOT NULL DEFAULT 0 COMMENT '销量',
  `sale_money` double(10, 2) NULL DEFAULT 0.00 COMMENT '销售额',
  `category_id` bigint(0) NULL DEFAULT NULL COMMENT '分类id',
  `imgs` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '商品图片',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `recommend` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否推荐。0不推荐，1推荐',
  `is_delete` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否删除，0未删除，1删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '商品表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of good
-- ----------------------------
INSERT INTO `good` VALUES (2, '衬衫', '鳄鱼夹克男春季新款休闲百搭翻领外套男中青年时尚潮流夹克衫男装上衣 绿色 XL(130-145斤)', 0.95, 35, 13700.50, 2, '/file/74488020672944968462e9e4a9c89096.png', '2023-03-27 13:32:44', 1, 0);
INSERT INTO `good` VALUES (3, '桌椅套装', '这款桌椅套装是您家庭和办公室的理想选择。精心设计的桌子和舒适的椅子，完美结合，给您带来了坐姿舒适和优雅的工作环境。优质材料和坚固的结构确保您享受长久的使用寿命。', 0.98, 0, 0.00, 13, '/file/b4ac53ed62c74c298366619399c39f99.jpg', '2023-03-31 20:44:00', 1, 0);
INSERT INTO `good` VALUES (4, '威士忌 大瓶', '这款洋酒是一款精心酿造的上乘佳酿，给您带来无与伦比的品尝享受。精选优质的原料，经过精心的发酵和蒸馏工艺，使得这款洋酒口感柔和，回味悠长。', 0.80, 0, 0.00, 19, '/file/be9d2d6a17c5436fb0b8c2f7927484b2.jpg', '2023-03-31 20:46:37', 1, 0);
INSERT INTO `good` VALUES (5, '女上衣', '酒红色圆领短袖T恤女休闲2023年新款上衣修身拼色女装S8220334 白色 XL', 0.80, 1, 116.00, 1, '/file/15cb9fc604984dfa97e0e968eb1d196d.jpg', '2023-03-31 20:47:59', 1, 0);
INSERT INTO `good` VALUES (6, '《PSALMS》英文版 图书', '《PSALMS》英文版是一本精美的图书，专门收录了许多有趣的诗篇。这本书为读者带来了感人至深的心灵之旅。', 1.00, 0, 0.00, 14, '/file/8dc5354c7332454796c614bb4a0572fb.jpg', '2023-03-31 20:48:51', 1, 0);
INSERT INTO `good` VALUES (7, '休闲鞋', '男士运动休闲鞋软底网面鞋健步鞋黑灰色42', 0.96, 1, 110.40, 11, '/file/0afa4eb1c51943808f6e83cd9ced25e8.jpg', '2023-03-31 20:49:36', 1, 0);
INSERT INTO `good` VALUES (8, '123', '123', 1.00, 43, 5289.00, 1, '/file/09bb6edab07a4c68a44cce41a3300d97.jpg', '2023-06-12 00:55:57', 0, 1);
INSERT INTO `good` VALUES (9, '儿童简笔画册', '适合儿童简笔画上色的底稿', 1.00, 0, 0.00, 13, '/file/2e2a1df657324a3293642344327310cb.png', '2023-08-10 20:28:58', 1, 0);
INSERT INTO `good` VALUES (10, '墨镜', '抵抗紫外线', 1.00, 0, 0.00, 13, '/file/449ab0163ba648c08cb4a76b40a9dcec.jpg', '2023-08-10 20:29:47', 1, 0);

-- ----------------------------
-- Table structure for good_standard
-- ----------------------------
DROP TABLE IF EXISTS `good_standard`;
CREATE TABLE `good_standard`  (
  `good_id` bigint(0) NULL DEFAULT NULL COMMENT '商品id',
  `value` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '规格',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '价格',
  `store` bigint(0) NULL DEFAULT NULL COMMENT '库存'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '商品规格表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of good_standard
-- ----------------------------
INSERT INTO `good_standard` VALUES (8, '123', 123.00, 80);
INSERT INTO `good_standard` VALUES (5, '白色', 145.00, 299);
INSERT INTO `good_standard` VALUES (7, '43码', 115.00, 149);
INSERT INTO `good_standard` VALUES (6, '英文版', 99.00, 500);
INSERT INTO `good_standard` VALUES (4, '单瓶', 2600.00, 500);
INSERT INTO `good_standard` VALUES (4, '三瓶送礼套装', 6100.00, 900);
INSERT INTO `good_standard` VALUES (3, '桌子', 90.00, 600);
INSERT INTO `good_standard` VALUES (3, '椅子', 50.00, 500);
INSERT INTO `good_standard` VALUES (3, '桌子+椅子', 150.00, 500);
INSERT INTO `good_standard` VALUES (2, 'S 小码', 129.00, 498);
INSERT INTO `good_standard` VALUES (2, 'M 中码', 129.00, 496);
INSERT INTO `good_standard` VALUES (2, 'L 大码', 129.00, 496);
INSERT INTO `good_standard` VALUES (9, '标准版', 50.00, 600);
INSERT INTO `good_standard` VALUES (10, '标准30cm', 60.00, 500);

-- ----------------------------
-- Table structure for icon
-- ----------------------------
DROP TABLE IF EXISTS `icon`;
CREATE TABLE `icon`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `value` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '图标的识别码',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '图标表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of icon
-- ----------------------------
INSERT INTO `icon` VALUES (1, '&#xe600;');
INSERT INTO `icon` VALUES (15, '&#xe617;');
INSERT INTO `icon` VALUES (16, '&#xe709;');
INSERT INTO `icon` VALUES (17, '&#xe601;');
INSERT INTO `icon` VALUES (18, '&#xe618;');
INSERT INTO `icon` VALUES (19, '&#xe602;');
INSERT INTO `icon` VALUES (21, '&#xe606;');

-- ----------------------------
-- Table structure for icon_category
-- ----------------------------
DROP TABLE IF EXISTS `icon_category`;
CREATE TABLE `icon_category`  (
  `category_id` bigint(0) NOT NULL COMMENT '分类id',
  `icon_id` bigint(0) NOT NULL COMMENT '图标id',
  PRIMARY KEY (`category_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '商品分类 - 图标关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of icon_category
-- ----------------------------
INSERT INTO `icon_category` VALUES (1, 1);
INSERT INTO `icon_category` VALUES (2, 1);
INSERT INTO `icon_category` VALUES (10, 15);
INSERT INTO `icon_category` VALUES (11, 15);
INSERT INTO `icon_category` VALUES (12, 15);
INSERT INTO `icon_category` VALUES (13, 16);
INSERT INTO `icon_category` VALUES (14, 16);
INSERT INTO `icon_category` VALUES (15, 17);
INSERT INTO `icon_category` VALUES (16, 17);
INSERT INTO `icon_category` VALUES (17, 17);
INSERT INTO `icon_category` VALUES (18, 18);
INSERT INTO `icon_category` VALUES (19, 19);
INSERT INTO `icon_category` VALUES (20, 19);
INSERT INTO `icon_category` VALUES (21, 19);
INSERT INTO `icon_category` VALUES (22, 21);
INSERT INTO `icon_category` VALUES (23, 21);

-- ----------------------------
-- Table structure for order_goods
-- ----------------------------
DROP TABLE IF EXISTS `order_goods`;
CREATE TABLE `order_goods`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `order_id` bigint(0) NULL DEFAULT NULL COMMENT '订单id',
  `good_id` bigint(0) NULL DEFAULT NULL COMMENT '商品id',
  `count` int(0) NULL DEFAULT NULL COMMENT '数量',
  `standard` varchar(1600) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '规格',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_goods
-- ----------------------------
INSERT INTO `order_goods` VALUES (9, 9, 2, 3, 'M 中码');
INSERT INTO `order_goods` VALUES (10, 10, 2, 3, 'L 大码');
INSERT INTO `order_goods` VALUES (11, 11, 2, 1, 'S 小码');
INSERT INTO `order_goods` VALUES (12, 12, 8, 1, '123');
INSERT INTO `order_goods` VALUES (13, 13, 8, 12, '123');
INSERT INTO `order_goods` VALUES (14, 14, 8, 1, '123');
INSERT INTO `order_goods` VALUES (15, 15, 8, 1, '123');
INSERT INTO `order_goods` VALUES (16, 16, 8, 15, '123');
INSERT INTO `order_goods` VALUES (17, 17, 8, 1, '123');
INSERT INTO `order_goods` VALUES (18, 18, 8, 1, '123');
INSERT INTO `order_goods` VALUES (19, 19, 8, 11, '123');
INSERT INTO `order_goods` VALUES (20, 20, 2, 1, 'M 中码');
INSERT INTO `order_goods` VALUES (21, 21, 2, 1, 'L 大码');
INSERT INTO `order_goods` VALUES (22, 22, 7, 1, '43码');
INSERT INTO `order_goods` VALUES (23, 23, 2, 1, 'S 小码');
INSERT INTO `order_goods` VALUES (24, 24, 5, 1, '白色');

-- ----------------------------
-- Table structure for standard
-- ----------------------------
DROP TABLE IF EXISTS `standard`;
CREATE TABLE `standard`  (
  `goodId` bigint(0) NOT NULL COMMENT '商品id',
  `value` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '商品规格',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '该规格的价格',
  `store` bigint(0) NULL DEFAULT NULL COMMENT '该规格的库存',
  PRIMARY KEY (`goodId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '规格表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_file
-- ----------------------------
DROP TABLE IF EXISTS `sys_file`;
CREATE TABLE `sys_file`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '文件名称',
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '文件类型',
  `size` bigint(0) NULL DEFAULT NULL COMMENT '大小',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '文件路径',
  `is_delete` tinyint(1) NULL DEFAULT NULL COMMENT '是否删除',
  `enable` tinyint(1) NULL DEFAULT NULL COMMENT '是否启用',
  `md5` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'md5值',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '系统文件表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_file
-- ----------------------------
INSERT INTO `sys_file` VALUES (7, '07.jpg', 'jpg', 1814, '/file/7dfd10628edc4b4e97de19c1cb86585e.jpg', 0, 0, '04271616ebc6914643c3af592dd58bef');
INSERT INTO `sys_file` VALUES (8, '9a49edb823cc4cb799cb3438a7419a83.jpg', 'jpg', 132, '/file/2b6249b9ba24491a9048c1e8c0b5256e.jpg', 0, 0, 'f11ed5acc29b90770a453eceb7524712');
INSERT INTO `sys_file` VALUES (9, '9a49edb823cc4cb799cb3438a7419a83.jpg', 'jpg', 132, '/file/2b6249b9ba24491a9048c1e8c0b5256e.jpg', 0, 0, 'f11ed5acc29b90770a453eceb7524712');
INSERT INTO `sys_file` VALUES (10, '9a49edb823cc4cb799cb3438a7419a83.jpg', 'jpg', 132, '/file/2b6249b9ba24491a9048c1e8c0b5256e.jpg', 0, 0, 'f11ed5acc29b90770a453eceb7524712');
INSERT INTO `sys_file` VALUES (11, '9a49edb823cc4cb799cb3438a7419a83.jpg', 'jpg', 132, '/file/2b6249b9ba24491a9048c1e8c0b5256e.jpg', 0, 0, 'f11ed5acc29b90770a453eceb7524712');
INSERT INTO `sys_file` VALUES (12, '5a776cc21c1b407bbd2595a7af726a61.jpg', 'jpg', 846, '/file/0e8132c00dc6484faa18b2d1487b34ec.jpg', 0, 0, '8f0a34a66bbc1a794b7c138897a66dad');
INSERT INTO `sys_file` VALUES (13, '5a776cc21c1b407bbd2595a7af726a61.jpg', 'jpg', 846, '/file/0e8132c00dc6484faa18b2d1487b34ec.jpg', 0, 0, '8f0a34a66bbc1a794b7c138897a66dad');
INSERT INTO `sys_file` VALUES (14, '5a776cc21c1b407bbd2595a7af726a61.jpg', 'jpg', 846, '/file/0e8132c00dc6484faa18b2d1487b34ec.jpg', 0, 0, '8f0a34a66bbc1a794b7c138897a66dad');
INSERT INTO `sys_file` VALUES (15, '5a776cc21c1b407bbd2595a7af726a61.jpg', 'jpg', 846, '/file/0e8132c00dc6484faa18b2d1487b34ec.jpg', 0, 0, '8f0a34a66bbc1a794b7c138897a66dad');
INSERT INTO `sys_file` VALUES (16, '5a776cc21c1b407bbd2595a7af726a61.jpg', 'jpg', 846, '/file/0e8132c00dc6484faa18b2d1487b34ec.jpg', 0, 0, '8f0a34a66bbc1a794b7c138897a66dad');
INSERT INTO `sys_file` VALUES (17, '5a776cc21c1b407bbd2595a7af726a61.jpg', 'jpg', 846, '/file/0e8132c00dc6484faa18b2d1487b34ec.jpg', 0, 0, '8f0a34a66bbc1a794b7c138897a66dad');
INSERT INTO `sys_file` VALUES (18, '02.jpg', 'jpg', 33, '/file/84ad8a9829424254811ce2220edc2d3b.jpg', 0, 0, 'fcf09e93c497c75cf2b3656f80f997cc');
INSERT INTO `sys_file` VALUES (19, '01.jpg', 'jpg', 26, '/file/cef757d124ec4b169cffd65de5e3c47c.jpg', 0, 0, 'd5b6bb3b068c1980d77c59079248a4a4');
INSERT INTO `sys_file` VALUES (20, '03.jpg', 'jpg', 22, '/file/7791be8ea1ee4aa0a149ae8e75c857d6.jpg', 0, 0, '75e8b3e8790e514fb799857f636a1623');
INSERT INTO `sys_file` VALUES (21, '04.jpg', 'jpg', 25, '/file/867aaf026b684b1e8b1a10c87e31df7e.jpg', 0, 0, '1d7397d5a4ce0995f711a1484d593f44');
INSERT INTO `sys_file` VALUES (22, '05.jpg', 'jpg', 19, '/file/f9f26a01e13d4ba68d7f7bd12df282e0.jpg', 0, 0, 'b2d243af2652abf08a491074c8f099ea');
INSERT INTO `sys_file` VALUES (23, '06.jpg', 'jpg', 11, '/file/286aa7816325455b8cdcd522aca833fe.jpg', 0, 0, 'c160a645c3dacb58ffb123a4239dcb50');
INSERT INTO `sys_file` VALUES (24, '037c5b1f3e40406893b423563c557a91.jpg', 'jpg', 1641, '/file/09bb6edab07a4c68a44cce41a3300d97.jpg', 0, 0, '067143803d2f87dcb939de5d4ace2bbb');
INSERT INTO `sys_file` VALUES (25, '01.jpg', 'jpg', 329, '/file/15cb9fc604984dfa97e0e968eb1d196d.jpg', 0, 0, '8c78b307ff66fbc7db624da25138f480');
INSERT INTO `sys_file` VALUES (26, '02.jpg', 'jpg', 738, '/file/e2cf8486c2384b8296972a550bf7e934.jpg', 0, 0, '7db1f7335529ad2a68367d29d0441695');
INSERT INTO `sys_file` VALUES (27, '04.jpg', 'jpg', 158, '/file/0afa4eb1c51943808f6e83cd9ced25e8.jpg', 0, 0, '0bfaaafc7ca1a9a5478baa8c9cae492c');
INSERT INTO `sys_file` VALUES (28, '05 (1).jpg', 'jpg', 773, '/file/8dc5354c7332454796c614bb4a0572fb.jpg', 0, 0, '925882b34e70434888ee7ca373bae52c');
INSERT INTO `sys_file` VALUES (29, '03 (2).jpg', 'jpg', 208, '/file/b4ac53ed62c74c298366619399c39f99.jpg', 0, 0, '1468738643a2f6dbd5fad1f7c80cdb00');
INSERT INTO `sys_file` VALUES (30, '06.jpg', 'jpg', 3494, '/file/be9d2d6a17c5436fb0b8c2f7927484b2.jpg', 0, 0, 'd9950e2a7400a3d26ebde81c47e92e04');
INSERT INTO `sys_file` VALUES (31, '02.png', 'png', 5898, '/file/74488020672944968462e9e4a9c89096.png', 0, 0, 'ad801047fc9918bd626656d08d696898');
INSERT INTO `sys_file` VALUES (32, '02.png', 'png', 71, '/file/2e2a1df657324a3293642344327310cb.png', 0, 0, '2c3a088b474cb2144645411f2e3da9c6');
INSERT INTO `sys_file` VALUES (33, '03.jpg', 'jpg', 31, '/file/449ab0163ba648c08cb4a76b40a9dcec.jpg', 0, 0, 'fa95b8365bc4ec2096f4dc3f31dc8e27');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '密码',
  `nickname` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '昵称',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '手机号码',
  `address` varchar(1600) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '地址',
  `avatar_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '头像链接',
  `role` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '角色',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 'admin', 'e10adc3949ba59abbe56e057f20f883e', '管理员', '123@qq.com', '13333333333', NULL, '/avatar/09cd5add81ff4abfbd1ccf91b2e9c820.jpg', 'admin');
INSERT INTO `sys_user` VALUES (2, 'user', 'e10adc3949ba59abbe56e057f20f883e', '新用户', '1234@qq.com', '15888888888', NULL, '/avatar/978418fbe75243b4ba38da389a468b78.jpg', 'user');

-- ----------------------------
-- Table structure for t_order
-- ----------------------------
DROP TABLE IF EXISTS `t_order`;
CREATE TABLE `t_order`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `order_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '订单号',
  `total_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '总价',
  `user_id` bigint(0) NULL DEFAULT NULL COMMENT '用户id',
  `link_user` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '联系人',
  `link_phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '联系电话',
  `link_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '地址',
  `state` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '订单状态',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '订单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_order
-- ----------------------------
INSERT INTO `t_order` VALUES (9, '20230331223822860904', 367.65, 2, '张三', '15888888888', '新疆', '已收货', '2023-03-31 22:38:22');
INSERT INTO `t_order` VALUES (24, '20230805014642654151', 116.00, 2, '张三', '15888888888', '北京市', '已支付', '2023-08-05 01:46:42');

SET FOREIGN_KEY_CHECKS = 1;
