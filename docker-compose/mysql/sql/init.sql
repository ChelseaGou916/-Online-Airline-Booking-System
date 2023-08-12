CREATE DATABASE IF NOT EXISTS yx157 default character set UTF8mb4 collate utf8mb4_unicode_ci;
USE yx157;
-- ----------------------------
-- Table structure for flight
-- ----------------------------
DROP TABLE IF EXISTS `flight`;
CREATE TABLE `flight`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'flight id',
  `type` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'plane type',
  `capacity` int(10) NOT NULL COMMENT 'flight capacity',
  `number` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'flight number',
  `start_point` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'flight start point',
  `destination` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'flight destination',
  `middle` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'fight middle',
  `departure_time` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'departure time',
  `arrival_time` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'arrival time',
  `price` int(10) NOT NULL COMMENT 'price',
  `all_time` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'all time',
  `stop_time` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'stop time',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of flight
-- ----------------------------
INSERT INTO `flight` VALUES (1, 'SyberJet', 6, 'DS171', 'Dairy Flat', 'Sydney', 'Rotorua', '7.1 6:00', '7.1 8:30', 350, '4.5h', '30min');
INSERT INTO `flight` VALUES (2, 'SyberJet', 6, 'DS173', 'Sydney', 'Dairy Flat', NULL, '7.3 13:00', '7.3 19:00', 350, '4h', NULL);
INSERT INTO `flight` VALUES (3, 'Cirrus', 4, 'DC165', 'Dairy Flat', 'Rotorua', NULL, '6.27 6:00', '6.27 6:40', 150, '40min', NULL);
INSERT INTO `flight` VALUES (4, 'Cirrus', 4, 'DC165', 'Dairy Flat', 'Rotorua', NULL, '6.27 13:00', '6.27 13:40', 150, '40min', NULL);
INSERT INTO `flight` VALUES (5, 'Cirrus', 4, 'DC165', 'Dairy Flat', 'Rotorua', NULL, '6.28 6:00', '6.28 6:40', 150, '40min', NULL);
INSERT INTO `flight` VALUES (6, 'Cirrus', 4, 'DC165', 'Dairy Flat', 'Rotorua', NULL, '6.28 13:00', '6.28 13:40', 150, '40min', NULL);
INSERT INTO `flight` VALUES (7, 'Cirrus', 4, 'DC165', 'Dairy Flat', 'Rotorua', NULL, '6.29 6:00', '6.29 6:40', 150, '40min', NULL);
INSERT INTO `flight` VALUES (8, 'Cirrus', 4, 'DC165', 'Dairy Flat', 'Rotorua', NULL, '6.29 13:00', '6.29 13:40', 150, '40min', NULL);
INSERT INTO `flight` VALUES (9, 'Cirrus', 4, 'DC165', 'Dairy Flat', 'Rotorua', NULL, '6.30 6:00', '6.30 6:40', 150, '40min', NULL);
INSERT INTO `flight` VALUES (10, 'Cirrus', 4, 'DC165', 'Dairy Flat', 'Rotorua', NULL, '6.30 13:00', '6.30 13:40', 150, '40min', NULL);
INSERT INTO `flight` VALUES (11, 'Cirrus', 4, 'DC165', 'Dairy Flat', 'Rotorua', NULL, '7.1 6:00', '7.1 6:40', 150, '40min', NULL);
INSERT INTO `flight` VALUES (12, 'Cirrus', 4, 'DC165', 'Dairy Flat', 'Rotorua', NULL, '7.1 13:00', '7.1 13:40', 150, '40min', NULL);
INSERT INTO `flight` VALUES (13, 'Cirrus', 4, 'DC156', 'Rotorua', 'Dairy Flat', NULL, '6.27 12:00', '6.27 12:40', 150, '40min', NULL);
INSERT INTO `flight` VALUES (14, 'Cirrus', 4, 'DC156', 'Rotorua', 'Dairy Flat', NULL, '6.27 19:00', '6.27 19:40', 150, '40min', NULL);
INSERT INTO `flight` VALUES (15, 'Cirrus', 4, 'DC156', 'Rotorua', 'Dairy Flat', NULL, '6.28 12:00', '6.28 12:40', 150, '40min', NULL);
INSERT INTO `flight` VALUES (16, 'Cirrus', 4, 'DC156', 'Rotorua', 'Dairy Flat', NULL, '6.28 19:00', '6.28 19:40', 150, '40min', NULL);
INSERT INTO `flight` VALUES (17, 'Cirrus', 4, 'DC156', 'Rotorua', 'Dairy Flat', NULL, '6.29 12:00', '6.29 12:40', 150, '40min', NULL);
INSERT INTO `flight` VALUES (18, 'Cirrus', 4, 'DC156', 'Rotorua', 'Dairy Flat', NULL, '6.29 19:00', '6.29 19:40', 150, '40min', NULL);
INSERT INTO `flight` VALUES (19, 'Cirrus', 4, 'DC156', 'Rotorua', 'Dairy Flat', NULL, '6.30 12:00', '6.30 12:40', 150, '40min', NULL);
INSERT INTO `flight` VALUES (20, 'Cirrus', 4, 'DC156', 'Rotorua', 'Dairy Flat', NULL, '6.30 19:00', '6.30 19:40', 150, '40min', NULL);
INSERT INTO `flight` VALUES (21, 'Cirrus', 4, 'DC156', 'Rotorua', 'Dairy Flat', NULL, '7.1 12:00', '7.1 12:40', 150, '40min', NULL);
INSERT INTO `flight` VALUES (22, 'Cirrus', 4, 'DC156', 'Rotorua', 'Dairy Flat', NULL, '7.1 19:00', '7.1 19:40', 150, '40min', NULL);
INSERT INTO `flight` VALUES (23, 'Cirrus', 4, 'DC265', 'Dairy Flat', 'Claris', NULL, '6.27 7:00', '6.27 7:20', 100, '20min', NULL);
INSERT INTO `flight` VALUES (24, 'Cirrus', 4, 'DC265', 'Dairy Flat', 'Claris', NULL, '6.29 7:00', '6.29 7:20', 100, '20min', NULL);
INSERT INTO `flight` VALUES (25, 'Cirrus', 4, 'DC265', 'Dairy Flat', 'Claris', NULL, '7.1 7:00', '7.1 7:20', 100, '20min', NULL);
INSERT INTO `flight` VALUES (26, 'Cirrus', 4, 'DC256', 'Claris', 'Dairy Flat', NULL, '6.28 7:00', '6.28 7:20', 100, '20min', NULL);
INSERT INTO `flight` VALUES (27, 'Cirrus', 4, 'DC256', 'Claris', 'Dairy Flat', NULL, '7.1 7:00', '7.1 7:20', 100, '20min', NULL);
INSERT INTO `flight` VALUES (28, 'Cirrus', 4, 'DC256', 'Claris', 'Dairy Flat', NULL, '7.2 7:00', '7.2 7:20', 100, '20min', NULL);
INSERT INTO `flight` VALUES (29, 'HondaJet', 5, 'DH121', 'Dairy Flat', 'Tuuta', NULL, '6.28 13:00', '6.28 16:45', 300, '3h', NULL);
INSERT INTO `flight` VALUES (30, 'HondaJet', 5, 'DH121', 'Dairy Flat', 'Tuuta', NULL, '7.1 13:00', '7.1 16:45', 300, '3h', NULL);
INSERT INTO `flight` VALUES (31, 'HondaJet', 5, 'DH112', 'Tuuta', 'Dairy Flat', NULL, '6.29 13:00', '6.29 15:15', 300, '3h', NULL);
INSERT INTO `flight` VALUES (32, 'HondaJet', 5, 'DH112', 'Tuuta', 'Dairy Flat', NULL, '7.2 13:00', '7.2 15:15', 300, '3h', NULL);
INSERT INTO `flight` VALUES (33, 'HondaJet', 5, 'DH201', 'Dairy Flat', 'Lake Tekapo', NULL, '6.27 8:00', '6.27 11:00', 200, '3h', NULL);
INSERT INTO `flight` VALUES (34, 'HondaJet', 5, 'DH202', 'Lake Tekapo', 'Dairy Flat', NULL, '7.1 8:00', '7.1 11:00', 200, '3h', NULL);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'user id',
  `account` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'user account',
  `password` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'user password',
  `is_admin` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'is admin  1 admin',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', 'admin123', '1');
INSERT INTO `user` VALUES (6, 'test', '123123123', NULL);

-- ----------------------------
-- Table structure for user_flight
-- ----------------------------
DROP TABLE IF EXISTS `user_flight`;
CREATE TABLE `user_flight`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'user flight id',
  `user_id` int(11) NOT NULL COMMENT 'user id',
  `flight_id` int(11) NOT NULL COMMENT 'flight id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_flight
-- ----------------------------
INSERT INTO `user_flight` VALUES (10, 1, 2);

SET FOREIGN_KEY_CHECKS = 1;
