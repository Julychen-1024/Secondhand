/*
 Navicat MySQL Data Transfer

 Source Server         : 蒋霸霸
 Source Server Type    : MySQL
 Source Server Version : 80011
 Source Host           : localhost:3306
 Source Schema         : secondhand

 Target Server Type    : MySQL
 Target Server Version : 80011
 File Encoding         : 65001

 Date: 07/01/2020 10:25:25
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods`  (
  `g_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `g_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `g_price` double NOT NULL DEFAULT 0,
  `g_num` int(11) NOT NULL DEFAULT 0,
  `g_image1` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `g_image2` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `g_image3` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `g_image4` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `g_info` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `u_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `t_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`g_id`) USING BTREE,
  INDEX `u_id`(`u_id`) USING BTREE,
  INDEX `t_id`(`t_id`) USING BTREE,
  INDEX `g_id`(`g_id`) USING BTREE,
  CONSTRAINT `t_id` FOREIGN KEY (`t_id`) REFERENCES `goodstype` (`t_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `u_id` FOREIGN KEY (`u_id`) REFERENCES `user` (`u_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES ('10000', '手机', 3000, 2, 'image/手机1.jpg', 'image/手机2.jpg', 'image/手机2.jpg', 'image/手机2.jpg', '八成新。', '3160608026', '3');
INSERT INTO `goods` VALUES ('10001', '口红', 233, 2, 'image/美妆1.jpg', 'image/美妆2.jpg', 'image/美妆3.jpg', 'image/美妆4.jpg', '变好看', '3160608027', '2');
INSERT INTO `goods` VALUES ('10002', '羽绒服', 1499, 1, 'image/服饰1.jpg', 'image/服饰2.jpg', 'image/服饰3.jpg', 'image/服饰4.jpg', '穿的', '3160608002', '5');
INSERT INTO `goods` VALUES ('10003', '篮球', 298, 2, 'image/运动1.jpg', 'image/运动2.jpg', 'image/运动3.jpg', 'image/运动4.jpg', '打的', 'pdl', '4');
INSERT INTO `goods` VALUES ('10004', '烤箱', 198, 2, 'image/电器1.jpg', 'image/电器2.jpg', 'image/电器3.jpg', 'image/电器4.jpg', '做饭用', '3160608026', '6');

-- ----------------------------
-- Table structure for goodstype
-- ----------------------------
DROP TABLE IF EXISTS `goodstype`;
CREATE TABLE `goodstype`  (
  `t_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `t_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`t_id`) USING BTREE,
  INDEX `t_id`(`t_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goodstype
-- ----------------------------
INSERT INTO `goodstype` VALUES ('1', '生活百货 ');
INSERT INTO `goodstype` VALUES ('2', '美妆');
INSERT INTO `goodstype` VALUES ('3', '手机数码');
INSERT INTO `goodstype` VALUES ('4', '运动户外');
INSERT INTO `goodstype` VALUES ('5', '服饰');
INSERT INTO `goodstype` VALUES ('6', '电器');

-- ----------------------------
-- Table structure for orderlist
-- ----------------------------
DROP TABLE IF EXISTS `orderlist`;
CREATE TABLE `orderlist`  (
  `o_id` int(11) NOT NULL AUTO_INCREMENT,
  `g_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `buy_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sell_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `o_state` int(11) NOT NULL DEFAULT 0 COMMENT '0表示未完成交易 1表示完成',
  `o_num` int(11) NOT NULL DEFAULT 0,
  `o_sum_price` double NOT NULL DEFAULT 0,
  PRIMARY KEY (`o_id`) USING BTREE,
  INDEX `g_id_3`(`g_id`) USING BTREE,
  INDEX `buy_id`(`buy_id`) USING BTREE,
  INDEX `sell_id`(`sell_id`) USING BTREE,
  CONSTRAINT `buy_id` FOREIGN KEY (`buy_id`) REFERENCES `user` (`u_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `g_id_3` FOREIGN KEY (`g_id`) REFERENCES `goods` (`g_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `sell_id` FOREIGN KEY (`sell_id`) REFERENCES `user` (`u_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orderlist
-- ----------------------------
INSERT INTO `orderlist` VALUES (2, '10000', '3160608027', '3160608026', 1, 1, 3000);
INSERT INTO `orderlist` VALUES (3, '10001', '123456', '3160608027', 1, 1, 233);

-- ----------------------------
-- Table structure for shoppingcart
-- ----------------------------
DROP TABLE IF EXISTS `shoppingcart`;
CREATE TABLE `shoppingcart`  (
  `sc_id` int(11) NOT NULL AUTO_INCREMENT,
  `sc_num` int(11) NOT NULL DEFAULT 0,
  `u_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `g_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`sc_id`) USING BTREE,
  INDEX `u_id_2`(`u_id`) USING BTREE,
  INDEX `g_id_2`(`g_id`) USING BTREE,
  CONSTRAINT `g_id_2` FOREIGN KEY (`g_id`) REFERENCES `goods` (`g_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `u_id_2` FOREIGN KEY (`u_id`) REFERENCES `user` (`u_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of shoppingcart
-- ----------------------------
INSERT INTO `shoppingcart` VALUES (3, 1, 'pdl', '10001');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `u_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `u_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `u_password` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `u_tel` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `u_email` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `u_addr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`u_id`) USING BTREE,
  INDEX `u_id`(`u_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('123456', 'pdl', '123456', '123456', '1231346', '123246');
INSERT INTO `user` VALUES ('3160608002', '唐苇', '3160608002', '1234567', '1234567', '1234567');
INSERT INTO `user` VALUES ('3160608026', 'jyc', '3160608026', '123456789', '123456789', '123456789');
INSERT INTO `user` VALUES ('3160608027', 'hhh', '3160608027', '12345678', '12345678', '12345678');
INSERT INTO `user` VALUES ('pdl', '裴代龙', 'pdl', '123456', '123456', '123456');

SET FOREIGN_KEY_CHECKS = 1;
