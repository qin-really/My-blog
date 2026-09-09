/*
 Navicat Premium Dump SQL

 Source Server         : 5.7
 Source Server Type    : MySQL
 Source Server Version : 50726 (5.7.26)
 Source Host           : localhost:3306
 Source Schema         : music_player

 Target Server Type    : MySQL
 Target Server Version : 50726 (5.7.26)
 File Encoding         : 65001

 Date: 10/09/2026 17:21:21
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for favorites
-- ----------------------------
DROP TABLE IF EXISTS `favorites`;
CREATE TABLE `favorites`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `song_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_user_song`(`user_id`, `song_id`) USING BTREE,
  INDEX `fk_fav_song`(`song_id`) USING BTREE,
  CONSTRAINT `fk_fav_song` FOREIGN KEY (`song_id`) REFERENCES `songs` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `fk_fav_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '用户收藏歌曲表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of favorites
-- ----------------------------
INSERT INTO `favorites` VALUES (1, 1, 9, '2026-08-19 00:43:46');
INSERT INTO `favorites` VALUES (2, 2, 10, '2026-08-19 00:46:49');
INSERT INTO `favorites` VALUES (4, 1, 8, '2026-08-19 01:02:21');
INSERT INTO `favorites` VALUES (5, 3, 9, '2026-08-19 02:16:34');
INSERT INTO `favorites` VALUES (6, 2, 17, '2026-08-19 14:29:23');
INSERT INTO `favorites` VALUES (7, 2, 18, '2026-08-19 14:29:23');
INSERT INTO `favorites` VALUES (8, 2, 19, '2026-08-19 14:29:23');
INSERT INTO `favorites` VALUES (9, 2, 20, '2026-08-19 14:29:24');
INSERT INTO `favorites` VALUES (10, 2, 21, '2026-08-19 14:29:24');
INSERT INTO `favorites` VALUES (11, 2, 22, '2026-08-19 14:29:25');
INSERT INTO `favorites` VALUES (12, 2, 8, '2026-09-10 13:36:10');

-- ----------------------------
-- Table structure for play_history
-- ----------------------------
DROP TABLE IF EXISTS `play_history`;
CREATE TABLE `play_history`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `song_id` bigint(20) UNSIGNED NOT NULL,
  `played_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_user_played_at`(`user_id`, `played_at`) USING BTREE,
  INDEX `fk_hist_song`(`song_id`) USING BTREE,
  CONSTRAINT `fk_hist_song` FOREIGN KEY (`song_id`) REFERENCES `songs` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `fk_hist_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 289 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '播放历史表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of play_history
-- ----------------------------
INSERT INTO `play_history` VALUES (1, 1, 9, '2026-08-19 00:43:07');
INSERT INTO `play_history` VALUES (2, 2, 11, '2026-08-19 00:45:18');
INSERT INTO `play_history` VALUES (3, 2, 10, '2026-08-19 00:47:57');
INSERT INTO `play_history` VALUES (4, 2, 8, '2026-08-19 00:51:40');
INSERT INTO `play_history` VALUES (5, 2, 11, '2026-08-19 00:51:48');
INSERT INTO `play_history` VALUES (6, 1, 9, '2026-08-19 01:02:10');
INSERT INTO `play_history` VALUES (7, 1, 11, '2026-08-19 01:02:18');
INSERT INTO `play_history` VALUES (8, 1, 10, '2026-08-19 01:05:12');
INSERT INTO `play_history` VALUES (9, 1, 9, '2026-08-19 01:05:43');
INSERT INTO `play_history` VALUES (10, 1, 5, '2026-08-19 01:07:09');
INSERT INTO `play_history` VALUES (11, 1, 5, '2026-08-19 01:07:26');
INSERT INTO `play_history` VALUES (12, 1, 9, '2026-08-19 01:08:18');
INSERT INTO `play_history` VALUES (13, 1, 11, '2026-08-19 01:08:19');
INSERT INTO `play_history` VALUES (14, 1, 5, '2026-08-19 01:11:44');
INSERT INTO `play_history` VALUES (15, 1, 5, '2026-08-19 01:14:11');
INSERT INTO `play_history` VALUES (16, 1, 10, '2026-08-19 01:17:54');
INSERT INTO `play_history` VALUES (17, 1, 9, '2026-08-19 01:19:10');
INSERT INTO `play_history` VALUES (18, 1, 5, '2026-08-19 01:23:22');
INSERT INTO `play_history` VALUES (19, 1, 9, '2026-08-19 01:27:05');
INSERT INTO `play_history` VALUES (20, 1, 9, '2026-08-19 01:30:37');
INSERT INTO `play_history` VALUES (21, 1, 5, '2026-08-19 01:30:45');
INSERT INTO `play_history` VALUES (22, 1, 11, '2026-08-19 01:30:47');
INSERT INTO `play_history` VALUES (23, 1, 10, '2026-08-19 01:30:51');
INSERT INTO `play_history` VALUES (24, 1, 8, '2026-08-19 01:30:51');
INSERT INTO `play_history` VALUES (25, 1, 6, '2026-08-19 01:30:52');
INSERT INTO `play_history` VALUES (26, 1, 7, '2026-08-19 01:30:52');
INSERT INTO `play_history` VALUES (27, 1, 11, '2026-08-19 01:30:54');
INSERT INTO `play_history` VALUES (28, 1, 9, '2026-08-19 01:30:55');
INSERT INTO `play_history` VALUES (29, 1, 11, '2026-08-19 01:30:55');
INSERT INTO `play_history` VALUES (30, 1, 7, '2026-08-19 01:30:56');
INSERT INTO `play_history` VALUES (31, 1, 9, '2026-08-19 01:30:56');
INSERT INTO `play_history` VALUES (32, 1, 7, '2026-08-19 01:30:57');
INSERT INTO `play_history` VALUES (33, 1, 8, '2026-08-19 01:30:57');
INSERT INTO `play_history` VALUES (34, 1, 9, '2026-08-19 01:30:57');
INSERT INTO `play_history` VALUES (35, 1, 5, '2026-08-19 01:31:10');
INSERT INTO `play_history` VALUES (36, 1, 11, '2026-08-19 01:31:10');
INSERT INTO `play_history` VALUES (37, 1, 10, '2026-08-19 01:31:11');
INSERT INTO `play_history` VALUES (38, 1, 9, '2026-08-19 01:39:00');
INSERT INTO `play_history` VALUES (39, 1, 11, '2026-08-19 01:39:08');
INSERT INTO `play_history` VALUES (40, 1, 5, '2026-08-19 01:39:57');
INSERT INTO `play_history` VALUES (41, 1, 6, '2026-08-19 01:40:05');
INSERT INTO `play_history` VALUES (42, 2, 11, '2026-08-19 01:43:17');
INSERT INTO `play_history` VALUES (43, 2, 6, '2026-08-19 01:45:11');
INSERT INTO `play_history` VALUES (44, 2, 5, '2026-08-19 01:45:37');
INSERT INTO `play_history` VALUES (45, 2, 8, '2026-08-19 01:47:07');
INSERT INTO `play_history` VALUES (46, 2, 6, '2026-08-19 01:48:31');
INSERT INTO `play_history` VALUES (47, 2, 11, '2026-08-19 01:51:17');
INSERT INTO `play_history` VALUES (48, 2, 5, '2026-08-19 01:54:41');
INSERT INTO `play_history` VALUES (49, 2, 10, '2026-08-19 01:58:25');
INSERT INTO `play_history` VALUES (50, 2, 6, '2026-08-19 02:01:56');
INSERT INTO `play_history` VALUES (51, 2, 8, '2026-08-19 02:06:19');
INSERT INTO `play_history` VALUES (52, 2, 7, '2026-08-19 02:09:34');
INSERT INTO `play_history` VALUES (53, 2, 5, '2026-08-19 02:10:24');
INSERT INTO `play_history` VALUES (54, 1, 9, '2026-08-19 02:13:38');
INSERT INTO `play_history` VALUES (55, 1, 5, '2026-08-19 02:15:06');
INSERT INTO `play_history` VALUES (56, 3, 6, '2026-08-19 02:16:17');
INSERT INTO `play_history` VALUES (57, 3, 7, '2026-08-19 02:16:53');
INSERT INTO `play_history` VALUES (58, 3, 6, '2026-08-19 02:16:58');
INSERT INTO `play_history` VALUES (59, 3, 6, '2026-08-19 02:17:04');
INSERT INTO `play_history` VALUES (60, 3, 7, '2026-08-19 02:17:07');
INSERT INTO `play_history` VALUES (61, 3, 5, '2026-08-19 02:17:11');
INSERT INTO `play_history` VALUES (62, 1, 5, '2026-08-19 12:10:10');
INSERT INTO `play_history` VALUES (63, 1, 9, '2026-08-19 12:13:54');
INSERT INTO `play_history` VALUES (64, 1, 11, '2026-08-19 12:17:59');
INSERT INTO `play_history` VALUES (65, 1, 6, '2026-08-19 12:21:24');
INSERT INTO `play_history` VALUES (66, 1, 7, '2026-08-19 12:25:47');
INSERT INTO `play_history` VALUES (67, 1, 10, '2026-08-19 12:28:52');
INSERT INTO `play_history` VALUES (68, 1, 8, '2026-08-19 12:32:23');
INSERT INTO `play_history` VALUES (69, 1, 9, '2026-08-19 12:36:56');
INSERT INTO `play_history` VALUES (70, 1, 5, '2026-08-19 12:41:52');
INSERT INTO `play_history` VALUES (71, 1, 11, '2026-08-19 12:45:36');
INSERT INTO `play_history` VALUES (72, 1, 9, '2026-08-19 12:49:00');
INSERT INTO `play_history` VALUES (73, 1, 11, '2026-08-19 12:50:21');
INSERT INTO `play_history` VALUES (74, 1, 7, '2026-08-19 12:50:33');
INSERT INTO `play_history` VALUES (75, 1, 7, '2026-08-19 12:53:27');
INSERT INTO `play_history` VALUES (76, 1, 10, '2026-08-19 12:55:36');
INSERT INTO `play_history` VALUES (77, 1, 7, '2026-08-19 12:55:42');
INSERT INTO `play_history` VALUES (78, 1, 5, '2026-08-19 12:55:43');
INSERT INTO `play_history` VALUES (79, 1, 10, '2026-08-19 12:59:26');
INSERT INTO `play_history` VALUES (80, 1, 11, '2026-08-19 13:02:57');
INSERT INTO `play_history` VALUES (81, 1, 8, '2026-08-19 13:06:21');
INSERT INTO `play_history` VALUES (82, 1, 7, '2026-08-19 13:09:37');
INSERT INTO `play_history` VALUES (83, 1, 5, '2026-08-19 13:10:09');
INSERT INTO `play_history` VALUES (84, 1, 5, '2026-08-19 13:14:25');
INSERT INTO `play_history` VALUES (85, 1, 10, '2026-08-19 13:14:30');
INSERT INTO `play_history` VALUES (86, 1, 9, '2026-08-19 13:14:32');
INSERT INTO `play_history` VALUES (87, 1, 5, '2026-08-19 13:14:33');
INSERT INTO `play_history` VALUES (88, 1, 6, '2026-08-19 13:18:16');
INSERT INTO `play_history` VALUES (89, 1, 5, '2026-08-19 13:21:13');
INSERT INTO `play_history` VALUES (90, 1, 6, '2026-08-19 13:24:57');
INSERT INTO `play_history` VALUES (91, 1, 8, '2026-08-19 13:29:20');
INSERT INTO `play_history` VALUES (92, 1, 5, '2026-08-19 13:30:26');
INSERT INTO `play_history` VALUES (93, 1, 8, '2026-08-19 13:34:09');
INSERT INTO `play_history` VALUES (94, 1, 5, '2026-08-19 13:37:25');
INSERT INTO `play_history` VALUES (95, 1, 6, '2026-08-19 13:39:42');
INSERT INTO `play_history` VALUES (96, 1, 7, '2026-08-19 13:44:05');
INSERT INTO `play_history` VALUES (97, 1, 5, '2026-08-19 13:45:32');
INSERT INTO `play_history` VALUES (98, 1, 9, '2026-08-19 13:49:15');
INSERT INTO `play_history` VALUES (99, 1, 5, '2026-08-19 13:53:57');
INSERT INTO `play_history` VALUES (100, 1, 9, '2026-08-19 13:57:41');
INSERT INTO `play_history` VALUES (101, 1, 5, '2026-08-19 14:00:34');
INSERT INTO `play_history` VALUES (102, 1, 9, '2026-08-19 14:04:18');
INSERT INTO `play_history` VALUES (103, 1, 11, '2026-08-19 14:08:23');
INSERT INTO `play_history` VALUES (104, 1, 6, '2026-08-19 14:11:47');
INSERT INTO `play_history` VALUES (105, 1, 5, '2026-08-19 14:18:00');
INSERT INTO `play_history` VALUES (106, 1, 9, '2026-08-19 14:19:31');
INSERT INTO `play_history` VALUES (107, 1, 5, '2026-08-19 14:19:36');
INSERT INTO `play_history` VALUES (108, 1, 5, '2026-08-19 14:23:23');
INSERT INTO `play_history` VALUES (109, 1, 5, '2026-08-19 14:27:13');
INSERT INTO `play_history` VALUES (110, 1, 9, '2026-08-19 14:27:28');
INSERT INTO `play_history` VALUES (111, 1, 5, '2026-08-19 14:27:41');
INSERT INTO `play_history` VALUES (112, 1, 16, '2026-08-19 14:30:03');
INSERT INTO `play_history` VALUES (113, 1, 5, '2026-08-19 14:30:09');
INSERT INTO `play_history` VALUES (114, 1, 9, '2026-08-19 14:33:52');
INSERT INTO `play_history` VALUES (115, 1, 11, '2026-08-19 14:37:57');
INSERT INTO `play_history` VALUES (116, 1, 6, '2026-08-19 14:41:21');
INSERT INTO `play_history` VALUES (117, 1, 7, '2026-08-19 14:45:45');
INSERT INTO `play_history` VALUES (118, 1, 10, '2026-08-19 14:48:50');
INSERT INTO `play_history` VALUES (119, 1, 8, '2026-08-19 14:52:21');
INSERT INTO `play_history` VALUES (120, 2, 5, '2026-08-19 15:13:55');
INSERT INTO `play_history` VALUES (121, 2, 5, '2026-08-19 15:14:37');
INSERT INTO `play_history` VALUES (122, 1, 9, '2026-08-19 15:15:27');
INSERT INTO `play_history` VALUES (123, 1, 5, '2026-08-19 15:16:09');
INSERT INTO `play_history` VALUES (124, 1, 10, '2026-08-19 15:16:31');
INSERT INTO `play_history` VALUES (125, 2, 9, '2026-08-19 15:17:38');
INSERT INTO `play_history` VALUES (126, 1, 10, '2026-08-19 15:18:58');
INSERT INTO `play_history` VALUES (127, 2, 5, '2026-08-19 15:25:58');
INSERT INTO `play_history` VALUES (128, 1, 11, '2026-08-19 15:26:09');
INSERT INTO `play_history` VALUES (129, 1, 9, '2026-08-19 15:31:28');
INSERT INTO `play_history` VALUES (130, 1, 11, '2026-08-19 15:31:41');
INSERT INTO `play_history` VALUES (131, 1, 9, '2026-08-19 15:39:19');
INSERT INTO `play_history` VALUES (132, 2, 5, '2026-08-19 15:39:36');
INSERT INTO `play_history` VALUES (133, 2, 5, '2026-08-19 15:42:20');
INSERT INTO `play_history` VALUES (134, 1, 6, '2026-08-19 15:42:52');
INSERT INTO `play_history` VALUES (135, 2, 9, '2026-08-19 15:48:51');
INSERT INTO `play_history` VALUES (136, 2, 11, '2026-08-19 15:52:56');
INSERT INTO `play_history` VALUES (137, 2, 6, '2026-08-19 15:56:20');
INSERT INTO `play_history` VALUES (138, 2, 7, '2026-08-19 16:00:43');
INSERT INTO `play_history` VALUES (139, 2, 10, '2026-08-19 16:03:49');
INSERT INTO `play_history` VALUES (140, 2, 8, '2026-08-19 16:07:20');
INSERT INTO `play_history` VALUES (141, 2, 16, '2026-08-19 16:10:36');
INSERT INTO `play_history` VALUES (142, 2, 9, '2026-08-19 17:06:39');
INSERT INTO `play_history` VALUES (143, 2, 11, '2026-08-19 17:10:44');
INSERT INTO `play_history` VALUES (144, 2, 6, '2026-08-19 17:14:09');
INSERT INTO `play_history` VALUES (145, 2, 7, '2026-08-19 17:18:32');
INSERT INTO `play_history` VALUES (146, 2, 10, '2026-08-19 17:21:37');
INSERT INTO `play_history` VALUES (147, 2, 8, '2026-08-19 17:25:08');
INSERT INTO `play_history` VALUES (148, 2, 16, '2026-08-19 17:28:24');
INSERT INTO `play_history` VALUES (149, 2, 12, '2026-08-19 17:31:13');
INSERT INTO `play_history` VALUES (150, 2, 13, '2026-08-19 17:35:34');
INSERT INTO `play_history` VALUES (151, 2, 14, '2026-08-19 17:39:42');
INSERT INTO `play_history` VALUES (152, 2, 15, '2026-08-19 17:45:27');
INSERT INTO `play_history` VALUES (153, 2, 19, '2026-08-19 17:50:17');
INSERT INTO `play_history` VALUES (154, 2, 20, '2026-08-19 17:54:08');
INSERT INTO `play_history` VALUES (155, 2, 21, '2026-08-19 17:58:15');
INSERT INTO `play_history` VALUES (156, 2, 22, '2026-08-19 18:02:36');
INSERT INTO `play_history` VALUES (157, 2, 5, '2026-08-19 18:27:05');
INSERT INTO `play_history` VALUES (158, 2, 9, '2026-08-19 18:30:48');
INSERT INTO `play_history` VALUES (159, 2, 11, '2026-08-19 18:34:54');
INSERT INTO `play_history` VALUES (160, 2, 5, '2026-08-19 18:55:01');
INSERT INTO `play_history` VALUES (161, 2, 9, '2026-08-19 18:55:04');
INSERT INTO `play_history` VALUES (162, 2, 11, '2026-08-19 18:59:09');
INSERT INTO `play_history` VALUES (163, 2, 11, '2026-08-19 19:08:30');
INSERT INTO `play_history` VALUES (164, 2, 5, '2026-08-19 19:44:31');
INSERT INTO `play_history` VALUES (165, 2, 9, '2026-08-19 19:45:00');
INSERT INTO `play_history` VALUES (166, 2, 11, '2026-08-19 19:47:01');
INSERT INTO `play_history` VALUES (167, 1, 5, '2026-08-19 19:59:37');
INSERT INTO `play_history` VALUES (168, 1, 9, '2026-08-19 19:59:43');
INSERT INTO `play_history` VALUES (169, 2, 5, '2026-08-19 20:00:00');
INSERT INTO `play_history` VALUES (170, 2, 25, '2026-08-19 20:00:14');
INSERT INTO `play_history` VALUES (171, 1, 9, '2026-08-19 20:02:04');
INSERT INTO `play_history` VALUES (172, 1, 5, '2026-08-19 20:02:30');
INSERT INTO `play_history` VALUES (173, 1, 9, '2026-08-19 20:55:05');
INSERT INTO `play_history` VALUES (174, 1, 9, '2026-08-19 20:55:05');
INSERT INTO `play_history` VALUES (175, 1, 5, '2026-08-19 20:56:13');
INSERT INTO `play_history` VALUES (176, 1, 9, '2026-08-19 21:01:39');
INSERT INTO `play_history` VALUES (177, 1, 11, '2026-08-19 21:06:12');
INSERT INTO `play_history` VALUES (178, 1, 6, '2026-08-19 21:09:36');
INSERT INTO `play_history` VALUES (179, 1, 7, '2026-08-19 21:13:59');
INSERT INTO `play_history` VALUES (180, 1, 9, '2026-08-19 21:18:09');
INSERT INTO `play_history` VALUES (181, 1, 5, '2026-08-19 21:18:12');
INSERT INTO `play_history` VALUES (182, 1, 25, '2026-08-19 21:21:55');
INSERT INTO `play_history` VALUES (183, 1, 10, '2026-08-19 21:25:56');
INSERT INTO `play_history` VALUES (184, 1, 5, '2026-08-19 21:29:31');
INSERT INTO `play_history` VALUES (185, 1, 15, '2026-08-19 21:33:14');
INSERT INTO `play_history` VALUES (186, 1, 15, '2026-08-19 21:48:41');
INSERT INTO `play_history` VALUES (187, 1, 15, '2026-08-19 22:34:23');
INSERT INTO `play_history` VALUES (188, 1, 5, '2026-08-20 01:40:51');
INSERT INTO `play_history` VALUES (189, 2, 27, '2026-09-07 10:22:04');
INSERT INTO `play_history` VALUES (190, 2, 28, '2026-09-07 10:22:35');
INSERT INTO `play_history` VALUES (191, 1, 9, '2026-09-07 10:23:22');
INSERT INTO `play_history` VALUES (192, 2, 28, '2026-09-07 10:24:02');
INSERT INTO `play_history` VALUES (193, 2, 27, '2026-09-07 10:25:08');
INSERT INTO `play_history` VALUES (194, 2, 27, '2026-09-07 10:25:09');
INSERT INTO `play_history` VALUES (195, 2, 14, '2026-09-07 10:25:11');
INSERT INTO `play_history` VALUES (196, 2, 14, '2026-09-07 10:25:12');
INSERT INTO `play_history` VALUES (197, 2, 11, '2026-09-07 10:25:27');
INSERT INTO `play_history` VALUES (198, 2, 11, '2026-09-07 10:25:27');
INSERT INTO `play_history` VALUES (199, 2, 12, '2026-09-07 10:25:31');
INSERT INTO `play_history` VALUES (200, 2, 12, '2026-09-07 10:25:31');
INSERT INTO `play_history` VALUES (201, 2, 28, '2026-09-07 10:25:37');
INSERT INTO `play_history` VALUES (202, 2, 28, '2026-09-07 10:25:37');
INSERT INTO `play_history` VALUES (203, 2, 5, '2026-09-07 12:01:22');
INSERT INTO `play_history` VALUES (204, 2, 11, '2026-09-07 12:01:55');
INSERT INTO `play_history` VALUES (205, 2, 5, '2026-09-07 12:02:19');
INSERT INTO `play_history` VALUES (206, 2, 5, '2026-09-07 12:28:52');
INSERT INTO `play_history` VALUES (207, 2, 5, '2026-09-07 12:29:19');
INSERT INTO `play_history` VALUES (208, 2, 11, '2026-09-07 12:30:17');
INSERT INTO `play_history` VALUES (209, 2, 5, '2026-09-07 13:00:00');
INSERT INTO `play_history` VALUES (210, 2, 5, '2026-09-07 13:00:20');
INSERT INTO `play_history` VALUES (211, 2, 9, '2026-09-07 13:00:33');
INSERT INTO `play_history` VALUES (212, 2, 5, '2026-09-07 13:00:34');
INSERT INTO `play_history` VALUES (213, 2, 9, '2026-09-07 13:00:35');
INSERT INTO `play_history` VALUES (214, 2, 5, '2026-09-07 13:10:32');
INSERT INTO `play_history` VALUES (215, 2, 5, '2026-09-07 13:11:02');
INSERT INTO `play_history` VALUES (216, 2, 9, '2026-09-07 13:11:13');
INSERT INTO `play_history` VALUES (217, 2, 9, '2026-09-07 13:11:30');
INSERT INTO `play_history` VALUES (218, 2, 11, '2026-09-07 13:11:32');
INSERT INTO `play_history` VALUES (219, 2, 6, '2026-09-07 13:11:34');
INSERT INTO `play_history` VALUES (220, 2, 5, '2026-09-07 13:12:45');
INSERT INTO `play_history` VALUES (221, 2, 5, '2026-09-07 13:26:18');
INSERT INTO `play_history` VALUES (222, 2, 9, '2026-09-07 13:26:35');
INSERT INTO `play_history` VALUES (223, 2, 11, '2026-09-07 13:26:36');
INSERT INTO `play_history` VALUES (224, 2, 6, '2026-09-07 13:26:39');
INSERT INTO `play_history` VALUES (225, 2, 8, '2026-09-07 13:26:50');
INSERT INTO `play_history` VALUES (226, 2, 19, '2026-09-07 13:26:52');
INSERT INTO `play_history` VALUES (227, 2, 7, '2026-09-07 13:27:00');
INSERT INTO `play_history` VALUES (228, 2, 10, '2026-09-07 13:27:02');
INSERT INTO `play_history` VALUES (229, 2, 9, '2026-09-07 13:38:08');
INSERT INTO `play_history` VALUES (230, 2, 5, '2026-09-07 13:38:42');
INSERT INTO `play_history` VALUES (231, 2, 9, '2026-09-07 13:38:45');
INSERT INTO `play_history` VALUES (232, 2, 11, '2026-09-07 13:38:46');
INSERT INTO `play_history` VALUES (233, 2, 22, '2026-09-07 13:40:04');
INSERT INTO `play_history` VALUES (234, 2, 27, '2026-09-07 13:40:29');
INSERT INTO `play_history` VALUES (235, 2, 6, '2026-09-07 13:40:52');
INSERT INTO `play_history` VALUES (236, 2, 5, '2026-09-07 13:56:30');
INSERT INTO `play_history` VALUES (237, 2, 9, '2026-09-07 13:56:34');
INSERT INTO `play_history` VALUES (238, 2, 11, '2026-09-07 13:56:35');
INSERT INTO `play_history` VALUES (239, 2, 6, '2026-09-07 13:56:36');
INSERT INTO `play_history` VALUES (240, 2, 7, '2026-09-07 13:56:37');
INSERT INTO `play_history` VALUES (241, 2, 10, '2026-09-07 13:56:39');
INSERT INTO `play_history` VALUES (242, 2, 8, '2026-09-07 13:56:39');
INSERT INTO `play_history` VALUES (243, 2, 15, '2026-09-07 13:56:40');
INSERT INTO `play_history` VALUES (244, 2, 28, '2026-09-07 13:56:44');
INSERT INTO `play_history` VALUES (245, 2, 11, '2026-09-07 13:57:04');
INSERT INTO `play_history` VALUES (246, 1, 5, '2026-09-07 18:54:51');
INSERT INTO `play_history` VALUES (247, 1, 9, '2026-09-07 18:57:34');
INSERT INTO `play_history` VALUES (248, 1, 5, '2026-09-07 20:16:41');
INSERT INTO `play_history` VALUES (249, 1, 5, '2026-09-07 20:16:41');
INSERT INTO `play_history` VALUES (250, 1, 5, '2026-09-07 20:17:02');
INSERT INTO `play_history` VALUES (251, 1, 9, '2026-09-07 20:17:03');
INSERT INTO `play_history` VALUES (252, 2, 5, '2026-09-08 10:52:34');
INSERT INTO `play_history` VALUES (253, 2, 5, '2026-09-08 10:56:20');
INSERT INTO `play_history` VALUES (254, 2, 5, '2026-09-08 10:56:20');
INSERT INTO `play_history` VALUES (255, 2, 5, '2026-09-08 12:59:42');
INSERT INTO `play_history` VALUES (256, 2, 5, '2026-09-08 13:07:26');
INSERT INTO `play_history` VALUES (257, 2, 28, '2026-09-08 13:23:25');
INSERT INTO `play_history` VALUES (258, 2, 28, '2026-09-08 13:24:43');
INSERT INTO `play_history` VALUES (259, 2, 27, '2026-09-08 13:24:44');
INSERT INTO `play_history` VALUES (260, 2, 5, '2026-09-10 12:44:37');
INSERT INTO `play_history` VALUES (261, 2, 5, '2026-09-10 13:11:02');
INSERT INTO `play_history` VALUES (262, 1, 8, '2026-09-10 14:31:04');
INSERT INTO `play_history` VALUES (263, 1, 8, '2026-09-10 14:34:34');
INSERT INTO `play_history` VALUES (264, 1, 8, '2026-09-10 14:35:47');
INSERT INTO `play_history` VALUES (265, 1, 8, '2026-09-10 14:36:24');
INSERT INTO `play_history` VALUES (266, 1, 9, '2026-09-10 14:36:43');
INSERT INTO `play_history` VALUES (267, 1, 9, '2026-09-10 14:37:07');
INSERT INTO `play_history` VALUES (268, 1, 9, '2026-09-10 14:38:06');
INSERT INTO `play_history` VALUES (269, 1, 9, '2026-09-10 14:39:46');
INSERT INTO `play_history` VALUES (270, 1, 9, '2026-09-10 14:40:23');
INSERT INTO `play_history` VALUES (271, 1, 9, '2026-09-10 14:50:13');
INSERT INTO `play_history` VALUES (272, 1, 9, '2026-09-10 14:53:03');
INSERT INTO `play_history` VALUES (273, 1, 9, '2026-09-10 14:53:34');
INSERT INTO `play_history` VALUES (274, 1, 9, '2026-09-10 14:54:30');
INSERT INTO `play_history` VALUES (275, 1, 9, '2026-09-10 15:03:11');
INSERT INTO `play_history` VALUES (276, 1, 9, '2026-09-10 15:07:54');
INSERT INTO `play_history` VALUES (277, 1, 9, '2026-09-10 15:09:31');
INSERT INTO `play_history` VALUES (278, 1, 9, '2026-09-10 15:16:35');
INSERT INTO `play_history` VALUES (279, 1, 9, '2026-09-10 15:17:16');
INSERT INTO `play_history` VALUES (280, 1, 9, '2026-09-10 15:17:39');
INSERT INTO `play_history` VALUES (281, 1, 9, '2026-09-10 15:42:01');
INSERT INTO `play_history` VALUES (282, 1, 8, '2026-09-10 15:43:53');
INSERT INTO `play_history` VALUES (283, 1, 8, '2026-09-10 15:56:34');
INSERT INTO `play_history` VALUES (284, 1, 9, '2026-09-10 16:01:46');
INSERT INTO `play_history` VALUES (285, 1, 8, '2026-09-10 16:05:51');
INSERT INTO `play_history` VALUES (286, 1, 8, '2026-09-10 16:08:11');
INSERT INTO `play_history` VALUES (287, 1, 8, '2026-09-10 16:19:15');
INSERT INTO `play_history` VALUES (288, 1, 9, '2026-09-10 16:58:50');

-- ----------------------------
-- Table structure for playlist_songs
-- ----------------------------
DROP TABLE IF EXISTS `playlist_songs`;
CREATE TABLE `playlist_songs`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '关联ID',
  `playlist_id` bigint(20) UNSIGNED NOT NULL COMMENT '歌单ID',
  `song_id` bigint(20) UNSIGNED NOT NULL COMMENT '歌曲ID',
  `sort_order` int(11) NOT NULL DEFAULT 0 COMMENT '排序值，越小越靠前',
  `added_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_playlist_song`(`playlist_id`, `song_id`) USING BTREE,
  INDEX `idx_song_id`(`song_id`) USING BTREE,
  CONSTRAINT `fk_ps_playlist` FOREIGN KEY (`playlist_id`) REFERENCES `playlists` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `fk_ps_song` FOREIGN KEY (`song_id`) REFERENCES `songs` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '歌单歌曲关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of playlist_songs
-- ----------------------------
INSERT INTO `playlist_songs` VALUES (4, 2, 11, 1, '2026-08-18 23:59:39');
INSERT INTO `playlist_songs` VALUES (5, 1, 9, 2, '2026-08-19 00:03:00');
INSERT INTO `playlist_songs` VALUES (6, 1, 5, 3, '2026-08-19 02:14:55');
INSERT INTO `playlist_songs` VALUES (7, 3, 6, 0, '2026-08-19 02:16:10');
INSERT INTO `playlist_songs` VALUES (8, 3, 7, 1, '2026-08-19 02:16:12');
INSERT INTO `playlist_songs` VALUES (9, 2, 24, 2, '2026-08-19 14:29:28');
INSERT INTO `playlist_songs` VALUES (10, 2, 16, 3, '2026-08-19 14:29:31');
INSERT INTO `playlist_songs` VALUES (11, 2, 14, 4, '2026-08-19 14:29:34');

-- ----------------------------
-- Table structure for playlists
-- ----------------------------
DROP TABLE IF EXISTS `playlists`;
CREATE TABLE `playlists`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '歌单ID',
  `user_id` bigint(20) UNSIGNED NOT NULL COMMENT '所属用户ID',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '歌单名称',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '歌单描述',
  `cover_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '歌单封面URL',
  `is_public` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否公开：0私有 1公开',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_user_id`(`user_id`) USING BTREE,
  INDEX `idx_is_public`(`is_public`) USING BTREE,
  CONSTRAINT `fk_playlists_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '歌单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of playlists
-- ----------------------------
INSERT INTO `playlists` VALUES (1, 1, 'My Favorites', 'My favorite songs', NULL, 0, '2026-08-18 22:15:36', '2026-08-18 22:15:36');
INSERT INTO `playlists` VALUES (2, 2, 'Workout Mix', 'Songs for workout', NULL, 1, '2026-08-18 22:15:36', '2026-08-18 22:15:36');
INSERT INTO `playlists` VALUES (3, 3, 'test', 'test', NULL, 0, '2026-08-19 02:15:47', '2026-08-19 02:15:47');

-- ----------------------------
-- Table structure for songs
-- ----------------------------
DROP TABLE IF EXISTS `songs`;
CREATE TABLE `songs`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '歌曲ID',
  `title` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '歌曲标题',
  `artist` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '艺术家',
  `album` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '专辑',
  `duration_ms` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '时长（毫秒）',
  `file_path` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '音频文件存储路径（相对或绝对）',
  `file_size` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '文件大小（字节）',
  `mime_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'MIME类型，如 audio/mpeg',
  `cover_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '封面图URL',
  `lyrics` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '歌词（LRC格式）',
  `uploader_id` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '上传者用户ID',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_title_artist`(`title`, `artist`) USING BTREE,
  INDEX `idx_uploader_id`(`uploader_id`) USING BTREE,
  CONSTRAINT `fk_songs_uploader` FOREIGN KEY (`uploader_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '歌曲元数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of songs
-- ----------------------------
INSERT INTO `songs` VALUES (5, '有心无意', '本兮', '有心无意', 223000, '/本兮 - 有心无意.flac', 28051085, 'audio/flac', '/covers/song_1788747750372_4575.jpg', '[ti:有心无意]\n[ar:本兮]\n[al:有心无意]\n[00:00.00]有心无意 - 本兮\n[00:03.51]词：本兮\n[00:07.02]曲：本兮\n[00:10.53]编曲：夏侯哲\n[00:14.04]你说的话 有心的吗\n[00:19.48]\n[00:20.41]刺痛我了 无意的吧\n[00:25.74]沉默在回答\n[00:28.72]\n[00:29.58]你低头不说话\n[00:32.15]认真的回答\n[00:35.90]是我听错了吗\n[00:38.72]你心中的她 我不是那个她\n[00:41.60]无法带给你所想要的 许多想法\n[00:45.76]她 你心中全是她\n[00:47.97]我走不进 我怕前面道路太崎岖\n[00:51.99]一个人才走的下\n[00:54.35]你会再抛弃我吗\n[00:57.46]不要说话 安静才不会吵\n[01:01.37]最讨厌我幼稚的想法\n[01:06.15]\n[01:18.22]你说麻木 为何挣扎\n[01:23.10]\n[01:24.50]心里的话 扭曲放大\n[01:29.76]全都丢给我\n[01:33.28]让我去消化\n[01:35.98]\n[01:36.57]理解你 是我 唯一能做的吧\n[01:42.62]你心中的她 我不是那个她\n[01:45.65]无法带给你所想要的 许多想法\n[01:49.73]她 你心中全是她\n[01:51.94]我走不进 我怕前面道路太崎岖\n[01:55.83]一个人才走的下\n[01:58.40]你会再抛弃我吗\n[02:01.54]不要说话 安静才不会吵\n[02:05.36]最讨厌我幼稚的想法\n[02:10.29]\n[02:27.53]你心中的她 我不是那个她\n[02:30.46]无法带给你所想要的 许多想法\n[02:34.60]她 你心中全是她\n[02:36.72]我走不进 我怕前面道路太崎岖\n[02:40.87]一个人才走的下\n[02:43.33]你会再抛弃我吗\n[02:46.33]不要说话 安静才不会吵\n[02:50.19]最讨厌我幼稚的想法\n[02:53.20]你心中的她 我不是那个她\n[02:55.99]无法制造新的记忆填补旧伤\n[03:00.07]她 你心中全是她\n[03:02.35]不想靠近 你内心最深处\n[03:05.88]离开他的世界\n[03:08.03]还有谁会紧紧抱我吗\n[03:11.75]我还记得\n[03:13.31]你最初陪伴我的时候说的话\n[03:18.44]怀念吗\n[03:21.42]\n[03:22.99]你说的话 有心的吗\n[03:28.17]\n[03:29.28]刺痛我了 无意的吧', 1, '2026-08-18 23:58:19', '2026-08-18 23:58:19');
INSERT INTO `songs` VALUES (6, '倒带(电视剧《求婚事务所》片尾曲)', '蔡依林', 'J女神 影音典藏精选', 262000, '/蔡依林 - 倒带(电视剧《求婚事务所》片尾曲).flac', 58692347, 'audio/flac', '/covers/song_1788747750380_2180.jpg', '[00:00.00]作词 : 方文山\n[00:01.00]作曲 : 周杰伦\n[00:03.00]\n[00:16.21]我受够了等待\n[00:19.80]你所谓的安排\n[00:24.94]说的未来到底多久才来\n[00:30.95]总是要来不及\n[00:34.59]才知道我可爱\n[00:39.65]我想依赖 而你却都不在\n[00:44.77]应该开心的地带\n[00:48.42]你给的全是空白\n[00:52.10]一个人假日发呆\n[00:55.33]找不到人陪我看海\n[00:59.49]我在幸福的门外\n[01:03.15]却一直都进不来\n[01:06.84]你累积给的伤害\n[01:10.02]我是真的很难释怀\n[01:13.74]终于看开 爱回不来\n[01:17.38]而你总是太晚明白\n[01:21.08]最后才把话说开\n[01:24.77]哭着求我留下来\n[01:28.42]终于看开 爱回不来\n[01:32.16]我们面前太多阻碍\n[01:35.83]你的手却放不开\n[01:39.26]宁愿没出息 求我别离开\n[01:45.81]\n[01:59.31]你总是要我乖\n[02:02.92]慢慢计划将来\n[02:08.02]我的眼泪却一直掉下来\n[02:14.00]过去怎么交代\n[02:17.65]你该给的信赖\n[02:22.72]被你亲手缓缓推入悬崖\n[02:27.74]从我脸上的苍白\n[02:31.48]看到记忆慢下来\n[02:35.12]过去甜蜜在倒带\n[02:38.38]只是感觉已经不在\n[02:42.53]而我对你的期待\n[02:46.19]被你一次次摔坏\n[02:49.88]已经碎成太多块\n[02:53.11]要怎么拼凑跟重来\n[02:56.76]终于看开 爱回不来\n[03:00.50]而你总是太晚明白\n[03:04.17]最后才把话说开\n[03:07.86]哭着求我留下来\n[03:11.51]终于看开 爱回不来\n[03:15.17]我们面前太多阻碍\n[03:18.92]你的手却放不开\n[03:22.33]宁愿没出息 求我别离开\n[03:29.91]终于看开 爱回不来\n[03:33.63]而你总是太晚明白\n[03:37.25]最后才把话说开\n[03:40.93]哭着求我留下来\n[03:44.65]终于看开 爱回不来\n[03:48.34]我们面前太多阻碍\n[03:51.98]你的手却放不开\n[03:55.41]宁愿没出息 求我别离开\n[04:02.99]', 1, '2026-08-18 23:58:19', '2026-08-18 23:58:19');
INSERT INTO `songs` VALUES (7, '舞娘', '蔡依林', 'Love国语情歌集', 185000, '/蔡依林 - 舞娘.flac', 24122981, 'audio/flac', '/covers/song_1788747750389_6477.jpg', '[00:00.00]作词 : 陈镇川\n[00:01.00]作曲 : Liv Nervo/Miriam Nervo/Greg Kursten\n[00:02.00]编曲 : 吕绍淳\n[00:07.69]月光 放肆在染色的窗边\n[00:11.33]尘烟 魔幻所有视觉\n[00:14.93]再一杯 那古老神秘的恒河水\n[00:18.76]我藏在额头的猫眼\n[00:21.39]揭开了庆典\n[00:23.03]为爱囚禁数千年的关节\n[00:26.75]正诉说遗忘的爱恋\n[00:31.20]听所有喜悲系在我的腰间\n[00:34.50]让那些画面再出现\n[00:36.83]再回到从前\n[00:38.95]旋转 跳跃 我闭着眼\n[00:42.48]喧嚣看不见\n[00:44.34]你沉醉了没\n[00:46.42]白雪 夏夜 我不停歇\n[00:50.14]模糊了年岁\n[00:52.22]时光的沙漏被我踩碎\n[01:02.16]故事 刻画在旋转的指尖\n[01:06.60]是谁 在痴痴的追随\n[01:09.39]这一夜 那破旧皇宫的台阶\n[01:13.55]我忘情抖落的汗水\n[01:16.40]点亮了庆典\n[01:17.60]一寸一寸把我紧紧包围\n[01:21.21]我要让世界忘了睡\n[01:25.04]你的心事倒影在我的眉间\n[01:29.60]放弃的快乐都实现\n[01:31.27]难过都摧毁\n[01:33.10]旋转 跳跃 我闭着眼\n[01:37.10]喧嚣看不见\n[01:38.60]你沉醉了没\n[01:41.60]白雪 夏夜 我不停歇\n[01:44.51]模糊了年岁\n[01:46.48]舞娘的喜悲没人看见\n[01:54.35]时光的沙漏被我踩碎\n[02:02.00]舞娘的喜悲没人看见\n[02:04.64]旋转 旋转 旋转\n[02:12.06]旋转 旋转 旋转\n[02:19.62]所有喜悲系在我的腰间\n[02:23.44]让那些画面再出现\n[02:25.64]回到从前\n[03:00.69]回到从前\n[03:02.26]旋转 跳跃 我闭着眼\n[03:06.29]喧嚣看不见\n[03:07.62]你沉醉了没\n[03:09.80]白雪 夏夜 我不停歇\n[03:13.42]模糊了年岁\n[03:15.38]时光的沙漏被我踩碎\n[03:18.69]旋转 跳跃 我闭着眼\n[03:21.18]喧嚣看不见\n[03:23.04]你沉醉了没\n[03:25.23]白雪 夏夜 我不停歇\n[03:29.49]模糊了年岁\n[03:31.19]舞娘的喜悲没人看见\n[03:31.39]End', 1, '2026-08-18 23:58:19', '2026-08-18 23:58:19');
INSERT INTO `songs` VALUES (8, '情人', '蔡徐坤', '情人', 195000, '/蔡徐坤 - 情人.flac', 22901849, 'audio/flac', '/covers/song_1788747750398_5503.jpg', '[00:00.00]作词 : 蔡徐坤/丁彦雪\n[00:00.43]作曲 : 蔡徐坤/Max Ulver/Andreas Ringblom/Daniel Schulz\n[00:00.86]编曲 : Max Ulver/Andreas Ringblom\n[00:01.29]制作人 : 蔡徐坤/CHOICE37\n[00:01.72]\n[00:12.04]眼色 是幻觉\n[00:14.50]泳池边你的身影勾成线\n[00:17.41]温热 蔓延\n[00:20.79]多少个午夜\n[00:22.42]肆无忌惮\n[00:23.64]醉梦酣欢\n[00:25.09]无意追逐\n[00:26.62]无法止步\n[00:28.62]热度 包围了我\n[00:32.91]All I wanna do is fool around\n[00:35.59]我的心在小鹿乱撞\n[00:38.27]从日落到清晨的月光\n[00:41.16]抱你到天亮\n[00:43.36]你轻轻一个吻\n[00:45.98]我疯狂体会\n[00:48.76]气氛开始升温\n[00:51.55]危险又迷人\n[00:53.81]I really wanna dance tonight\n[00:57.46]Feel a little bit dangerous\n[01:00.19]少了些安全感\n[01:03.32]做我的情人\n[01:04.89]I know you want it\n[01:12.75]掉落 人间 你像丘比特赐予我的首选\n[01:18.74]靠在 枕边\n[01:22.98]ah 光绕过你天使般的脸\n[01:25.75]ah 这感觉实在太危险\n[01:28.46]能否再对我温柔一点点\n[01:31.23]不忍心再带你去冒险\n[01:34.28]All I wanna do is fool around\n[01:36.98]我的心在小鹿乱撞\n[01:39.80]从日落到清晨的月光\n[01:42.58]抱你到天亮\n[01:44.87]你轻轻一个吻\n[01:47.41]我疯狂体会\n[01:50.07]气氛开始升温\n[01:52.81]危险又迷人\n[01:55.31]I really wanna dance tonight\n[01:58.90]Feel a little bit dangerous\n[02:01.66]少了些安全感\n[02:04.45]做我的情人\n[02:06.11]I know you want it\n[02:19.51]怪这感觉 狂热\n[02:21.20]灯光 晃了\n[02:22.38]音乐 放着\n[02:23.41]感受体温 上升\n[02:25.23]妆 花了\n[02:26.51]你 晃着\n[02:27.86]I know u really wanna\n[02:29.26]You know u really wanna\n[02:32.19]你轻轻一个吻\n[02:34.76]我疯狂体会\n[02:37.49]气氛开始升温\n[02:40.31]危险又迷人\n[02:42.51]I know you wanna dance tonight\n[02:46.29]Feel a little bit dangerous\n[02:49.18]少了些安全感\n[02:51.96]做我的情人\n[02:53.66]I know you want it\n[03:06.23]Be my lover', 1, '2026-08-18 23:58:19', '2026-08-18 23:58:19');
INSERT INTO `songs` VALUES (9, '别来无恙', '陈柏宇', 'Escape', 245000, '/陈柏宇 - 别来无恙.flac', 26631112, 'audio/flac', '/covers/song_1788747750410_6225.jpg', '[00:00.00]编曲 : Edward Chan/黄兆铭\n[00:01.00]制作人 : Edward Chan\n[00:02.00]作词 : 陈咏谦\n[00:03.00]作曲 : 林奕匡\n[00:15.94]喝满杯白开水 求身心安静\n[00:22.74]去远足或登山 尝试自然美\n[00:29.24]曾经的酒肉 多么污浊\n[00:32.77]常令你操心\n[00:35.29]我如今 已离开\n[00:43.73]你着起白婚纱 如仙子一样\n[00:50.64]那个他是否都 全意在乎你\n[00:56.92]梦想的生活 好好生活\n[01:00.66]来年陪着子女学行\n[01:05.62]记念当初我们的爱情\n[01:10.11]我现时自己肯做饭\n[01:13.65]闷极时自己可浪漫\n[01:17.17]庆幸还睡得好 还活得好过昨日\n[01:23.69]应付完自己的患难\n[01:27.54]为未来改正我习惯\n[01:31.02]忙下去 捱下去 但一不小心\n[01:37.54]总记起你\n[01:47.99]你那张旧CD 还偷偷转动\n[01:54.92]句句都梦一般 无法被忘记\n[02:01.34]王菲的孤寂 多么孤寂\n[02:04.91]谁成为陌生过路人\n[02:10.03]你是否都挂念这个人\n[02:14.52]我现时自己肯做饭\n[02:18.08]闷极时自己可浪漫\n[02:21.56]庆幸还睡得好 还活得好过昨日\n[02:28.30]应付完自己的患难\n[02:31.93]为未来改正我习惯\n[02:35.36]忙下去 捱下去 但一不小心\n[02:41.93]总记起你\n[02:48.26]这幅冰冷墙壁 怎么铺满尘埃\n[02:55.20]望着掉色的相 为何还是发着呆\n[03:02.14]这张精致床单 早该跟你离开\n[03:09.26]现在剩我一个 想起曾经\n[03:13.67]我为何未懂得自白\n[03:17.63]我为何未舍得学习\n[03:21.13]恃住雄辩滔滔 随便的把你喝骂\n[03:27.90]我为何未懂得站立\n[03:31.47]为事情出错了负责\n[03:34.91]然后我 然后我 恨不得当初\n[03:41.21]懂得爱惜你', 1, '2026-08-18 23:58:19', '2026-08-18 23:58:19');
INSERT INTO `songs` VALUES (10, '断绝来往', '陈柏宇', 'First Experience', 210000, '/陈柏宇 - 断绝来往.flac', 22199692, 'audio/flac', '/covers/song_1788747750421_8453.jpg', '[00:00.00]作词 : 黄凯琪\n[00:01.00]作曲 : 欧建星\n[00:19.12]或再不配合共你一对\n[00:23.40]都想当老友伴随\n[00:28.33]始终两脚难后退太不识趣\n[00:34.16]单向地爱下去\n[00:37.44]别这种态度极之乾脆\n[00:42.34]约见面藉口诸多说要推\n[00:47.61]如果不想再面对\n[00:49.52]惨遭负累\n[00:52.53]无谓再做朋友便告吹\n[00:56.51]*我会消失让自己一个抑鬱\n[00:59.57]道谢你绝情绝得送上这种恶疾\n[01:04.88]来日裡你与我各自卖醉\n[01:08.89]再也不知你於週末怎麼生趣\n[01:14.43]尽快消失為自己一个呼吸\n[01:18.30]若令你动情或者我永远不及\n[01:22.84]即管退隐谁人令我这麼固执\n[01:52.11]或有种隔膜没法攻破\n[01:56.96]都可否念於当初吻过麼\n[02:01.54]如果骚扰你是我不胜负荷\n[02:07.51]寧愿断绝来往就这麼\n[02:10.36]*我会消失让自己一个抑鬱\n[02:14.11]道谢你绝情绝得送上这种恶疾\n[02:19.29]来日裡你与我各自卖醉\n[02:23.75]再也不知你於週末怎麼生趣\n[02:28.86]尽快消失為自己一个呼吸\n[02:32.66]若令你动情或者我永远不及\n[02:37.29]即管退隐谁人令我这麼固执\n[02:47.24]偷生过每日日夜都因你抑鬱\n[02:52.52]念尽你绝情地放弃爱我\n[02:56.12]是千夫所指的过失\n[03:00.62]纯情愿憎多一个人不接受怜悯', 1, '2026-08-18 23:58:19', '2026-08-18 23:58:19');
INSERT INTO `songs` VALUES (11, '车匙', '陈柏宇', '五年新曲加精选', 204000, '/陈柏宇 - 车匙.mp3', 8234525, 'audio/mpeg', '/covers/song_1788747750433_3685.jpg', '[ti:车匙]\n[ar:陈柏宇]\n[al:208452]\n[00:00.00]车匙 - 陈柏宇 (Jason Chan)\n[00:05.42]词：陈少琪\n[00:10.85]曲：伍仲衡\n[00:16.28]遗弃这旧汽车消灭记忆那裂痕\n[00:22.80]忘记曾坐着你车迈向荒废树林\n[00:29.33]面前长路越来越暗临别越来越近\n[00:37.43]再远看你家就当临走情人热吻\n[00:43.17]手中紧握车匙追不到往事\n[00:46.61]方知挂念较怀念更容易\n[00:50.52]相爱凭几公里飞驰\n[00:54.46]要停下回望太迟\n[00:57.34]手中抛开车匙路上便无依\n[01:01.56]车里几多温馨故事几声愿意\n[01:06.93]原来只不过是幻觉磨蚀我的心志\n[01:26.84]忘记暖着你手冬夜播歌去漫游\n[01:33.38]时间沉默睡了飞越了整个地球\n[01:40.07]为何乘坐路程未够留下话题未够\n[01:48.23]我却要带走是你赠的迷人玩偶\n[01:53.65]手中紧握车匙追不到往事\n[01:57.29]方知挂念较怀念更容易\n[02:01.19]相爱凭几公里飞驰\n[02:05.04]要停下回望太迟\n[02:07.67]手中抛开车匙路上便无依\n[02:12.17]车里几多温馨故事几声愿意\n[02:17.58]原来只不过是幻觉然后我又沦落至此\n[02:31.85]谁伴我又游荡到此\n[02:36.15]手中紧握车匙追不到往事\n[02:39.54]方知挂念较怀念更容易\n[02:43.15]相爱凭几公里飞驰\n[02:47.46]要停下回望太迟\n[02:50.14]手中抛开车匙路上便无依\n[02:54.56]车里几多温馨故事几声愿意\n[02:59.76]原来只不过是幻觉磨蚀我的心志\n[03:08.63]有时情路里太多标志', 1, '2026-08-18 23:58:19', '2026-08-18 23:58:19');
INSERT INTO `songs` VALUES (12, 'Smooth Criminal', 'Michael Jackson', 'Bad', 260000, '/Michael Jackson - Smooth Criminal.flac', 30385855, 'audio/flac', '/covers/song_1788747750146_1089.jpg', '[00:00.00]作词 : Michael Jackson\n[00:01.00]作曲 : Michael Jackson\n[00:31.11]As he came into the window\n[00:31.11]当他从窗户潜入时\n[00:32.64]It was the sound of a crescendo\n[00:32.64]声音渐渐加强\n[00:35.27]He came into her apartement\n[00:35.27]他进入她的公寓\n[00:36.84]He left the bloodstains on the carpet\n[00:36.84]他留下血迹在地毯上\n[00:39.30]She ran underneath the table\n[00:39.30]她逃到桌下\n[00:40.82]He could see she was unable\n[00:40.82]他见她柔弱\n[00:43.43]So she ran into the bedroom\n[00:43.43]然后她逃进卧房\n[00:44.95]She was struck down it was her doom\n[00:44.95]却被击倒 这是命中注定\n[00:47.23]Annie are you ok\n[00:47.23]安妮，你还好吧？\n[00:48.41]So Annie are you ok\n[00:48.41]没事吧，安妮？\n[00:49.83]Are you ok Annie\n[00:49.83]安妮，你还好吧？\n[00:51.27]Annie are you ok\n[00:51.27]没事吧，安妮？\n[00:52.43]So Annie are you ok\n[00:52.43]安妮，你还好吧？\n[00:54.02]Are you ok Annie\n[00:54.02]没事吧，安妮？\n[00:55.25]Annie are you ok\n[00:55.25]安妮，你还好吧？\n[00:56.61]So Annie are you ok\n[00:56.61]没事吧，安妮？\n[00:58.02]Are you ok Annie\n[00:58.02]安妮，你还好吧？\n[00:59.35]Annie are you ok\n[00:59.35]没事吧，安妮？\n[01:00.61]So Annie are you ok are you ok Annie\n[01:00.61]安妮，你还好吧？ 没事吧，安妮？\n[01:03.56]Annie are you ok\n[01:03.56]安妮，你还好吧？\n[01:05.08]Will you tell us that you\'re ok\n[01:05.08]能告诉我们你没事吗?\n[01:07.66]There\'s a sign in the window\n[01:07.66]窗户上有个记号\n[01:09.21]That he struck you a crescendo Annie\n[01:09.21]安妮，他攻击你时声响逐渐变大\n[01:11.68]He came into your apartement\n[01:11.68]他进入你的公寓\n[01:13.29]He left the bloodstains on the carpet\n[01:13.29]他留下血迹在地毯上\n[01:15.83]And then you ran into the bedroom\n[01:15.83]然后你逃进卧房\n[01:17.29]You were struck down\n[01:17.29]却被击倒\n[01:18.35]It was your doom\n[01:18.35]这是你命中注定\n[01:19.39]Annie are you ok\n[01:19.39]安妮，你还好吧？\n[01:20.85]So Annie are you ok\n[01:20.85]没事吧，安妮？\n[01:22.52]Are you ok Annie\n[01:22.52]安妮，你还好吧？\n[01:23.73]Annie are you ok\n[01:23.73]没事吧，安妮？\n[01:24.97]So Annie are you ok\n[01:24.97]安妮，你还好吧？\n[01:26.47]Are you ok Annie\n[01:26.47]没事吧，安妮？\n[01:27.82]Annie are you ok\n[01:27.82]安妮，你还好吧？\n[01:29.09]So Annie are you ok\n[01:29.09]没事吧，安妮？\n[01:30.51]Are you ok Annie\n[01:30.51]安妮，你还好吧？\n[01:31.83]You\'ve been hit by\n[01:31.83]你被袭击\n[01:33.40]You\'ve been hit by\n[01:33.40]你被袭击\n[01:34.66]a smooth criminal\n[01:34.66]被一个从容的犯罪高手袭击\n[01:44.53]So they came into the outway\n[01:44.53]人们跑到外面\n[01:45.81]It was Sunday what a black day\n[01:45.81]那天是星期日-多么可怕的一天\n[01:48.32]Mouth to mouth resuscitation\n[01:48.32]口对口做人工呼吸\n[01:49.91]Sounding heartbeats intimidations\n[01:49.91]带着被恐吓的重心跳声\n[01:51.00]Annie are you ok\n[01:51.00]安妮，你还好吧？\n[01:53.42]So Annie are you ok\n[01:53.42]没事吧，安妮？\n[01:54.91]Are you ok Annie\n[01:54.91]安妮，你还好吧？\n[01:56.15]Annie are you ok\n[01:56.15]没事吧，安妮？\n[01:57.59]So Annie are you ok\n[01:57.59]安妮，你还好吧？\n[01:58.71]Are you ok Annie\n[01:58.71]没事吧，安妮？\n[01:59.82]Annie are you ok\n[01:59.82]安妮，你还好吧？\n[02:00.82]So Annie are you ok\n[02:00.82]没事吧，安妮？\n[02:01.67]Are you ok Annie\n[02:01.67]安妮，你还好吧？\n[02:03.28]Annie are you ok\n[02:03.28]没事吧，安妮？\n[02:07.03]So Annie are you ok are you ok Annie\n[02:07.03]安妮，你还好吧？ 没事吧，安妮？\n[02:08.94]Annie are you ok\n[02:08.94]安妮，你还好吧？\n[02:09.56]Will you tell us that you\'re ok\n[02:09.56]能告诉我们你没事吗?\n[02:13.84]There\'s a sign in the window\n[02:13.84]窗户上有个记号\n[02:14.85]That he struck you a crescendo Annie\n[02:14.85]安妮，他攻击你时声响逐渐变大\n[02:16.84]He came into your apartement\n[02:16.84]他进入你的公寓\n[02:17.63]Left the bloodstains on the carpet\n[02:17.63]他留下血迹在地毯上\n[02:20.71]The you ran into the bedroom\n[02:20.71]然后你逃进卧房\n[02:22.31]You were struck down\n[02:22.31]却被击倒\n[02:23.34]It was your doom\n[02:23.34]这是你命中注定\n[02:24.49]Annie are you ok\n[02:24.49]安妮，你还好吧？\n[02:25.79]So Annie are you ok\n[02:25.79]没事吧，安妮？\n[02:27.34]Are you ok Annie\n[02:27.34]安妮，你还好吧？\n[02:28.68]You\'ve been hit by\n[02:28.68]你被袭击\n[02:30.28]You\'ve been struck by\n[02:30.28]你被袭击\n[02:31.53]a smooth criminal\n[02:31.53]被一个从容的犯罪高手袭击\n[02:46.56]Okay I want everybody to clear the area right now\n[02:46.56]好吧！我希望大家马上将现场清理干净！\n[03:05.63]Annie are you ok\n[03:05.63]安妮，你还好吧？\n[03:06.98]Will you tell us that you\'re ok\n[03:06.98]能告诉我们你没事吗?\n[03:09.31]There\'s a sign in the window\n[03:09.31]窗户上有个记号\n[03:11.57]That he struck you a crescendo Annie\n[03:11.57]安妮，他攻击你时声响逐渐变大\n[03:13.86]He came into your apartement\n[03:13.86]他进入你的公寓\n[03:15.34]Left the bloodstains on the carpet\n[03:15.34]他留下血迹在地毯上\n[03:18.24]The you ran into the bedroom\n[03:18.24]然后你逃进卧房\n[03:19.75]You were struck down\n[03:19.75]却被击倒\n[03:20.83]It was your doom Annie\n[03:20.83]这是你命中注定\n[03:21.95]Annie are you ok\n[03:21.95]安妮，你还好吧？\n[03:23.49]Will you tell us that you\'re ok\n[03:23.49]能告诉我们你没事吗?\n[03:25.07]There\'s a sign in the window\n[03:25.07]窗户上有个记号\n[03:27.61]That he struck you a crescendo Annie\n[03:27.61]安妮，他攻击你时声响逐渐变大\n[03:29.65]He came into your apartement\n[03:29.65]他进入你的公寓\n[03:32.46]Left the bloodstains on the carpet\n[03:32.46]他留下血迹在地毯上\n[03:33.97]The you ran into the bedroom\n[03:33.97]然后你逃进卧房\n[03:36.00]You were struck down\n[03:36.00]却被击倒\n[03:37.62]It was your doom Annie\n[03:37.62]这是你命中注定  安妮', 1, '2026-08-19 14:28:36', '2026-08-19 14:28:36');
INSERT INTO `songs` VALUES (13, 'Thriller', 'Michael Jackson', 'Thriller', 248000, '/Michael Jackson - Thriller.flac', 33807782, 'audio/flac', '/covers/song_1788747750168_564.jpg', '[00:00.00]作词 : Temperton\n[00:01.00]作曲 : ROD TEMPERTON\n[00:59.19]It\'s close to midnight and something evil\'s lurking in the dark\n[00:59.19]午夜时分 魔鬼在暗处隐藏\n[01:07.35]Under the moonlight you see a sight that almost stops your heart\n[01:07.35]月光之下这幅景象几乎能让你心脏停止\n[01:13.29]You try to scream but terror takes the sound before you make it\n[01:13.29]想要尖叫 恐怖却让你声带失效\n[01:21.47]You start to freeze as horror looks you right between the eyes\n[01:21.47]浑身冰凉 惊骇眼中闪光\n[01:27.46]You\'re paralyzed\n[01:27.46]你完全瘫痪\n[01:29.63]\'Cause this is thriller thriller night\n[01:29.63]因为这是颤慄之夜\n[01:34.23]And no one\'s gonna save you from the beast about to strike\n[01:34.23]没人能救你于猛兽之口\n[01:38.25]You know it\'s thriller thriller night\n[01:38.25]你看，这就是颤慄之夜\n[01:42.14]You\'re fighting for your life inside a killer thriller tonight\n[01:42.14]要活命，就要拼搏 在这个阴森的颤慄之夜\n[01:56.02]You hear the door slam and realize there\'s nowhere left to run\n[01:56.02]门猛地关上 你意识到无处可逃\n[02:04.02]You feel the cold hand and wonder if you\'ll ever see the sun\n[02:04.02]手脚冰凉 不知能否得见明日朝阳\n[02:09.91]You close your eyes and hope that this is just imagination\n[02:09.91]闭上眼睛 希望一切只是幻想\n[02:18.32]But all the while you hear the creature creepin\' up behind\n[02:18.32]时时刻刻 你都听见鬼怪在偷偷来到身旁\n[02:24.10]You\'re out of time\n[02:24.10]你来不及逃窜\n[02:25.97]\'Cause this is thriller thriller night\n[02:25.97]因为这是颤慄之夜\n[02:30.95]There ain\'t no second chance against the thing with forty eyes\n[02:30.95]与百眼妖魔的战斗 不是你死就是我亡\n[02:33.71]You know it\'s thriller thriller night\n[02:33.71]你看，这就是颤慄之夜\n[02:38.90]You\'re fighting for your life inside a killer thriller tonight\n[02:38.90]要活命，就要拼搏 在这个阴森的颤慄之夜\n[02:45.25]Night creatures call\n[02:45.25]夜灵开始啼鸣\n[02:47.04]And the dead start to walk in their masquerade\n[02:47.04]僵尸开起了舞会\n[02:53.51]There\'s no escapin\' the jaws of the alien this time\n[02:53.51]这次再没办法逃开异形的僚牙\n[02:58.91]（they\'re open wide）\n[02:58.91]他们无所不在\n[03:00.12]This is the end of your life\n[03:00.12]你的生命正走向灭亡\n[03:06.99]They\'re out to get you there\'s demons closing in on every side\n[03:06.99]它们出来抓你 恶灵四面逼近\n[03:15.09]They will possess you unless you change the number on your dial\n[03:15.09]它们将迷住你 除非你掉头离去\n[03:20.98]Now is the time for you and I to cuddle close together\n[03:20.98]现在正是时候让我们紧拥一起\n[03:29.10]All thru the night I\'ll save you from the terrors on the screen\n[03:29.10]整个夜晚 我会把你从那些妖魔的手中救出\n[03:35.12]I\'ll make you see\n[03:35.12]我要让你看见\n[03:37.20]That it\'s a thriller thriller night\n[03:37.20]这是颤慄之夜\n[03:41.65]\'Cause I can thrill you more than any ghost would dare to try\n[03:41.65]没有一个鬼怪能比我 更让你不知所措\n[03:45.51]Girl this is thriller thriller night\n[03:45.51]女孩啊，这就是颤慄之夜\n[03:49.84]So let me hold you tight and share a killer diller chiller\n[03:49.84]让我紧紧将你拥抱 共享这个迷人、静谧、惊悚的\n[03:54.49]Thriller here tonight\n[03:54.49]颤慄之夜\n[03:57.60]That it\'s a thriller thriller night\n[03:57.60]这是颤慄之夜\n[04:03.59]\'Cause I can thrill you more than any ghost would dare to try\n[04:03.59]没有一个鬼怪能比我 更让你不知所措\n[04:06.36]Girl this is thriller thriller night\n[04:06.36]女孩啊，这就是颤慄之夜\n[04:09.95]So let me hold you tight and share a killer diller chiller\n[04:09.95]让我紧紧将你拥抱 共享这个迷人、静谧、惊悚的颤慄之夜\n[04:26.07]Darkness falls across the land\n[04:26.07]黑暗笼罩大地\n[04:27.76]The midnite hour is close at hand\n[04:27.76]午夜近在眼前\n[04:31.10]Creatures crawl in search of blood\n[04:31.10]嗜血的死灵\n[04:34.61]To terrorize y\'awl\'s neighborhood\n[04:34.61]遍布在你的周围\n[04:38.17]And whosoever shall be found\n[04:38.17]哪怕你看见的是\n[04:42.27]Without the soul for getting down\n[04:42.27]没有灵魂的鬼魅\n[04:45.95]Must stand and face the hounds of hell\n[04:45.95]也得坚强面对，这些来自地狱的猎犬\n[04:50.25]And rot inside a corpse\'s shell\n[04:50.25]在尸体下的腐肉\n[05:14.67]The foulest stench is in the air\n[05:14.67]散发著阵阵恶臭\n[05:17.24]The funk of forty thousand years\n[05:17.24]四万年的妖魔\n[05:20.08]And grizzly ghouls from every tomb\n[05:20.08]坟堆里的尸鬼\n[05:23.05]Ma Jiali 1999/08/01\n[05:24.07]Are closing in to seal your doom\n[05:24.07]就将来完结你的性命\n[05:27.55]And though you fight to stay alive\n[05:27.55]你拼死决斗\n[05:31.13]Your body starts to shiver\n[05:31.13]却全身发抖\n[05:34.66]For no mere mortal can resist\n[05:34.66]凡人不能抵挡\n[05:38.60]The evil of the thriller\n[05:38.60]颤慄之邪灵', 1, '2026-08-19 14:28:37', '2026-08-19 14:28:37');
INSERT INTO `songs` VALUES (14, 'You Are Not Alone', 'Michael Jackson', 'HIStory - PAST, PRESENT AND FUTURE - BOOK I (Explicit)', 345000, '/Michael Jackson - You Are Not Alone.flac', 38371250, 'audio/flac', '/covers/song_1788747750177_2154.jpg', '[ti:You Are Not Alone/你不会孤单]\n[ar:Michael Jackson]\n[al:1996 Grammy Nominees]\n[00:00.00]You Are Not Alone - Michael Jackson\n[00:04.16]Lyrics by：R. Kelly\n[00:08.32]Composed by：R. Kelly\n[00:12.48]Arranged by：R.Kelly/Michael Jackson\n[00:16.64]Another day has gone\n[00:16.64]又一日过去了\n[00:20.66]I\'m still all alone\n[00:20.66]我依然孤单\n[00:24.62]How could this be\n[00:24.62]怎会如此\n[00:28.61]You\'re not here with me\n[00:28.61]你不在我的身边\n[00:32.52]You never said goodbye\n[00:32.52]你从不说再见\n[00:36.69]Someone tell me why\n[00:36.69]谁能告诉我为什么\n[00:40.68]Did you have to go\n[00:40.68]你真的必须走\n[00:44.42]And leave my world so cold\n[00:44.42]独留我一人凄凉吗\n[00:49.56]\n[00:50.18]Every day I sit and ask myself\n[00:50.18]我每天坐下来问自己\n[00:54.23]How did love slip away\n[00:54.23]爱情怎会远离\n[00:57.73]\n[00:58.68]Something whispers in my ear and says\n[00:58.68]有声音悄悄在我耳边说\n[01:04.50]That you are not alone\n[01:04.50]你并不会孤单\n[01:08.66]I am here with you\n[01:08.66]我永伴你身旁\n[01:12.71]Though you\'re far away\n[01:12.71]不管你在多远的地方\n[01:16.71]I am here to stay\n[01:16.71]我都会守候着\n[01:20.54]But you are not alone\n[01:20.54]你并不会孤单\n[01:24.00]\n[01:24.69]I am here with you\n[01:24.69]我永伴你身旁\n[01:28.74]Though we\'re far apart\n[01:28.74]不管天涯海角\n[01:32.48]You\'re always in my heart\n[01:32.48]你在我心间\n[01:36.48]But you are not alone\n[01:36.48]你并不会孤单\n[01:40.73]\n[01:42.87]\'Lone \'lone\n[01:42.87]孤单 孤单\n[01:49.54]Why \'lone\n[01:49.54]为什么孤单\n[01:54.83]\n[01:56.77]Just the other night\n[01:56.77]几天前的晚上\n[02:00.55]I thought I heard you cry\n[02:00.55]我想我听到了你哭泣\n[02:04.77]Asking me to come\n[02:04.77]呼唤我的到来\n[02:08.48]And hold you in my arms\n[02:08.48]紧拥你在怀间\n[02:12.75]I can hear your prayers\n[02:12.75]我听到了你的祈祷\n[02:16.43]Your burdens I will bear\n[02:16.43]我愿肩承你的负担\n[02:20.52]But first I need your hand\n[02:20.52]但先得执子之手\n[02:24.20]Then forever can begin\n[02:24.20]方能白头偕老\n[02:28.94]\n[02:30.28]Every day I sit and ask myself\n[02:30.28]我每天坐下来问自己\n[02:34.33]How did love slip away\n[02:34.33]爱情怎会远离\n[02:37.85]\n[02:38.75]Something whispers in my ear and says\n[02:38.75]有声音悄悄在我耳边说\n[02:44.59]That you are not alone\n[02:44.59]你并不会孤单\n[02:48.80]I am here with you\n[02:48.80]我永伴你身旁\n[02:52.78]Though you\'re far away\n[02:52.78]不管你在多远的地方\n[02:56.81]I am here to stay\n[02:56.81]我都会守候着\n[03:00.57]But you are not alone\n[03:00.57]你并不会孤单\n[03:04.80]I am here with you\n[03:04.80]我永伴你身旁\n[03:08.24]\n[03:08.78]Though we\'re far apart\n[03:08.78]不管你在多远的地方\n[03:12.60]You\'re always in my heart\n[03:12.60]我都会守候着\n[03:16.60]But you are not alone\n[03:16.60]你并不会孤单\n[03:20.42]\n[03:23.37]Whisper three words and I\'ll come running\n[03:23.37]悄悄说出那三个字 我将飞奔而来\n[03:28.87]\n[03:31.33]And girl you know that I\'ll be there\n[03:31.33]女孩啊 你知道 我会在那里\n[03:37.51]\n[03:38.12]I\'ll be there\n[03:38.12]我会在那里\n[03:43.16]\n[03:44.57]That you are not alone\n[03:44.57]你并不会孤单\n[03:48.09]\n[03:48.83]I am here with you\n[03:48.83]我永伴你身旁\n[03:52.27]\n[03:52.83]Though you\'re far away\n[03:52.83]不管你在多远的地方\n[03:56.30]\n[03:56.84]I am here to stay\n[03:56.84]我都会守候着\n[04:00.62]But you are not alone\n[04:00.62]你并不会孤单\n[04:04.79]I am here with you\n[04:04.79]我永伴你身旁\n[04:08.23]\n[04:08.89]Though we\'re far apart\n[04:08.89]不管你在多远的地方\n[04:12.62]You\'re always in my heart\n[04:12.62]我都会守候着\n[04:16.64]But you are not alone\n[04:16.64]你并不会孤单\n[04:19.24]That you are not alone\n[04:19.24]你并不会孤单\n[04:20.91]I am here with you\n[04:20.91]我永伴你身旁\n[04:24.14]\n[04:24.89]Though you\'re far away\n[04:24.89]不管你在多远的地方\n[04:28.30]\n[04:28.83]I am here to stay\n[04:28.83]我都会守候着\n[04:32.60]But you are not alone\n[04:32.60]你并不会孤单\n[04:36.27]\n[04:36.83]I am here with you\n[04:36.83]我永伴你身旁\n[04:40.27]\n[04:40.86]Though we\'re far apart\n[04:40.86]不管你在多远的地方\n[04:44.17]\n[04:44.70]You\'re always in my heart\n[04:44.70]我都会守候着\n[04:48.59]But you are not alone\n[04:48.59]你并不会孤单\n[04:51.77]\n[04:56.17]You are not alone\n[04:56.17]你不会孤单\n[04:57.23]You are not alone\n[04:57.23]你不会孤单\n[04:59.04]\n[05:01.71]Say it again\n[05:01.71]再说一遍\n[05:02.59]\n[05:03.93]You are not alone\n[05:03.93]你不会孤单\n[05:05.09]You are not alone\n[05:05.09]你不会孤单\n[05:06.83]\n[05:07.69]Not alone Not alone\n[05:07.69]不孤单 不孤单\n[05:10.44]\n[05:12.11]If you just reach out for me girl\n[05:12.11]你只要对我伸出手 女孩\n[05:14.76]In the morning in the evening\n[05:14.76]在上午 在晚上\n[05:18.31]\n[05:19.18]Not alone not alone\n[05:19.18]不孤单 不孤单\n[05:21.77]\n[05:22.58]You and me not alone\n[05:22.58]你和我不孤单\n[05:25.69]Oh together together\n[05:25.69]一起 一起\n[05:29.72]\n[05:32.90]Not not being alone\n[05:32.90]停止孤单\n[05:35.83]\n[05:36.86]Not not being alone\n[05:36.86]停止孤单', 1, '2026-08-19 14:28:37', '2026-08-19 14:28:37');
INSERT INTO `songs` VALUES (15, '海底', 'monna莫娜', '海底', 248000, '/Monna莫娜 - 海底.mp3', 9947084, 'audio/mpeg', '/covers/song_1788747750187_1513.jpg', '[00:00.00]海底 - Monna莫娜\r\n[00:00.00]以下歌词翻译由微信翻译提供\r\n[00:21.55]The scattered moonlight shined through the clouds\r\n[00:21.55]星星点点的月光透过云层洒下来\r\n[00:29.58]Along with the wind hide itself from the crowds\r\n[00:29.58]随风而逝避开熙熙攘攘的人群\r\n[00:37.29]It caresses your dress just like the waves of your tress\r\n[00:37.29]它轻抚着你的裙子就像你波浪般的秀发\r\n[00:45.14]Slowly rinses your pain secures the warmth remained\r\n[00:45.14]慢慢洗净你的痛苦让你感受到温暖\r\n[00:52.59]Somewhere deep in the sea a subtle voice\'s guiding me\r\n[00:52.59]在大海深处的某个地方有个微妙的声音在指引我\r\n[01:01.22]Our souls drowned in silence no choice but fall into sleep\r\n[01:01.22]我们的灵魂被沉默淹没除了沉睡别无选择\r\n[01:09.15]You said you love the gentle wind breeze\r\n[01:09.15]你说你喜欢和煦的微风\r\n[01:11.73]Beyond these crowded cities\r\n[01:11.73]远离拥挤的城市\r\n[01:13.70]Told me that our ashes they belong to the seas\r\n[01:13.70]告诉我我们的骨灰属于大海\r\n[01:17.09]When life ends by then where would we be\r\n[01:17.09]当生命终结那时我们会在哪里\r\n[01:19.62]Wonder if they loved me\r\n[01:19.62]不知道他们是否爱过我\r\n[01:21.67]Would this world exist\r\n[01:21.67]这世界会不会存在\r\n[01:25.11]Pretending to be fine saying that \"I\'m alright\"\r\n[01:25.11]装作没事的样子说我没事\r\n[01:29.11]You\'re telling lies can\'t even look into my eyes\r\n[01:29.11]你在撒谎你甚至不敢直视我的眼睛\r\n[01:33.21]Our souls drowned in silence no choice but fall into sleep\r\n[01:33.21]我们的灵魂被沉默淹没除了沉睡别无选择\r\n[01:57.47]The scattered moonlight shined through the clouds\r\n[01:57.47]星星点点的月光透过云层洒下来\r\n[02:05.25]Along with the wind hide itself from the crowds\r\n[02:05.25]随风而逝避开熙熙攘攘的人群\r\n[02:12.52]It caresses your dress just like the waves of your tress\r\n[02:12.52]它轻抚着你的裙子就像你波浪般的秀发\r\n[02:20.27]Slowly rinses your pain secures the warmth remained\r\n[02:20.27]慢慢洗净你的痛苦让你感受到温暖\r\n[02:27.45]Somewhere deep in the sea a subtle voice\'s guiding me\r\n[02:27.45]在大海深处的某个地方有个微妙的声音在指引我\r\n[02:35.81]Our souls drowned in silence no choice but fall into sleep\r\n[02:35.81]我们的灵魂被沉默淹没除了沉睡别无选择\r\n[02:43.58]You said you love the gentle wind breeze\r\n[02:43.58]你说你喜欢和煦的微风\r\n[02:46.04]Beyond these crowded cities\r\n[02:46.04]远离拥挤的城市\r\n[02:47.86]Told me that our ashes they belong to the seas\r\n[02:47.86]告诉我我们的骨灰属于大海\r\n[02:51.10]When life ends by then where would we be\r\n[02:51.10]当生命终结那时我们会在哪里\r\n[02:53.64]Wonder if they loved me\r\n[02:53.64]不知道他们是否爱过我\r\n[02:55.60]Would this world exist\r\n[02:55.60]这世界会不会存在\r\n[02:59.06]Pretending to be fine saying that \"I\'m alright\"\r\n[02:59.06]装作没事的样子说我没事\r\n[03:02.79]You\'re telling lies can\'t even look into my eyes\r\n[03:02.79]你在撒谎你甚至不敢直视我的眼睛\r\n[03:06.79]Our souls drowned in silence no choice but fall into sleep\r\n[03:06.79]我们的灵魂被沉默淹没除了沉睡别无选择\r\n[03:17.94]It\'s too late\r\n[03:17.94]已经来不及了\r\n[03:19.99]Way too late\r\n[03:19.99]来不及了\r\n[03:21.80]Hate to see you away\r\n[03:21.80]不愿看到你离我而去\r\n[03:25.56]It\'s too late\r\n[03:25.56]已经来不及了\r\n[03:27.45]Way too late\r\n[03:27.45]来不及了\r\n[03:29.42]Yet you smiled as I stayed\r\n[03:29.42]可你对我微笑\r\n[03:33.40]Summer days spring\'s serenade\r\n[03:33.40]夏日时光春天的小夜曲\r\n[03:37.13]Tomorrow\'s gonna be okay\r\n[03:37.13]明天会没事的\r\n[03:41.24]Autumn breeze snow on your sleeves\r\n[03:41.24]秋风习习你的衣袖上落满雪花\r\n[03:44.94]They\'re out of reach under the seas\r\n[03:44.94]他们在海底遥不可及', 1, '2026-08-19 14:28:37', '2026-08-19 14:28:37');
INSERT INTO `songs` VALUES (16, 'My Stupid Heart (Kids Version)', 'Walk off the Earth、Luminati Suns', 'My Stupid Heart (Kids Version)', 168000, '/My Stupid Heart (Kids Version) - Walk off the Earth Luminati Suns.flac', 21353977, 'audio/flac', '/covers/song_1788747750195_3872.jpg', '[by:人类迷惑行为__]\n[00:00.00]作曲 : Gianni Luminati Nicassio/Jake Torrey/Lostboy/Michael Matosic/Sarah Blackwood/Tokyo Speirs\n[00:00.11]Hey, everybody\n[00:00.11]嘿 大家好\n[00:00.51]My mom \'n dad made this new song called \"My Stupid Heart\"\n[00:00.51]我的爸爸妈妈写了首新歌叫《My Stupid Heart》\n[00:03.54]I\'m gonna play it with my brothers\n[00:03.54]接下来我和哥哥们就为大家带来这首歌\n[00:05.18]Let\'s gooooooo!!\n[00:05.18]开唱！！\n[00:07.07]\n[00:07.33]My stupid heart\n[00:07.33]我愚蠢的心\n[00:08.88]Don\'t know\n[00:08.88]不懂\n[00:09.98]I\'ve tried to let you go\n[00:09.98]我早就想放你走\n[00:11.85]So many times before\n[00:11.85]之前好多次松开了手\n[00:13.93]Then wound up at your door\n[00:13.93]却又出现在你家门口\n[00:15.76]My stupid\n[00:15.76]我愚蠢……\n[00:16.14]\n[00:16.52]Can\'t believe that I haven\'t figured out by now\n[00:16.52]真不敢相信 事到如今我还没想通\n[00:19.63]Every time I call you up\n[00:19.63]致电给你\n[00:21.84]All you do is let me down (Let\'s Go!)\n[00:21.84]收到的无一不是失望 (开唱)\n[00:24.48]\n[00:24.83]Shoulda known there was nothing about us I could change\n[00:24.83]早该醒悟 你我之间再无回旋余地\n[00:28.10]Everytime we try to be friends\n[00:28.10]每每想友好相处\n[00:30.11]It always ends the same\n[00:30.11]结果却一如既往\n[00:32.20]\n[00:32.36]But when I try to remember\n[00:32.36]而当我试着去回忆\n[00:36.37]All the pain that we\'ve been through\n[00:36.37]彼此共历的那些苦痛\n[00:40.59]Something in me says whatever\n[00:40.59]我明明觉得“无所谓”\n[00:44.78]And it brings me back to you\n[00:44.78]却又不禁想起你\n[00:48.17]\n[00:48.86]My stupid heart\n[00:48.86]我愚蠢的心\n[00:50.63]Don\'t know\n[00:50.63]不懂\n[00:51.63]I\'ve tried to let you go\n[00:51.63]我早就想放你走\n[00:53.58]So many times before\n[00:53.58]之前好多次松开了手\n[00:55.60]Then wound up at your door\n[00:55.60]却又出现在你家门口\n[00:57.48]My stupid heart\n[00:57.48]我愚蠢的心\n[00:58.85]Too late\n[00:58.85]为时太晚\n[00:59.79]Already on my way\n[00:59.79]我都已启程\n[01:01.92]If we go down in flames\n[01:01.92]若彼此陷身火海\n[01:04.12]Again then you can blame my stupid heart\n[01:04.12]你便又可以怪我那颗愚蠢的心\n[01:09.83](Okay!)\n[01:09.83](好吧)\n[01:11.91](Okay!)\n[01:11.91](好吧)\n[01:13.06]You can blame my stupid heart\n[01:13.06]你大可怪我那颗愚蠢的心\n[01:18.38](Okay!)\n[01:18.38](好吧)\n[01:20.65](Okay!)\n[01:20.65](好吧)\n[01:21.27]You can blame my stupid heart\n[01:21.27]你大可以怪罪我愚蠢的心\n[01:23.51]\n[01:23.73]Every now and then I get inside my head\n[01:23.73]我时不时就会沉思默想一番\n[01:26.55]Try to leave your text unread\n[01:26.55]尽量不去读你的信息\n[01:28.35]But I wind up here instead\n[01:28.35]却又陷入僵局\n[01:30.96]\n[01:31.67]I shoulda bit my tongue while we were still ahead\n[01:31.67]你我还走在前列的时候 我就该保持沉默\n[01:34.78]Yeah always had to be right\n[01:34.78]我总在争所谓对的名头\n[01:36.80]Til we had nothing left\n[01:36.80]直到彼此一无所有\n[01:39.07]\n[01:39.23]But when I try to remember\n[01:39.23]而当我试着去回忆\n[01:43.12]All the pain that we\'ve been through\n[01:43.12]彼此共历的那些苦痛\n[01:47.36]Something in me says whatever\n[01:47.36]我明明觉得“无所谓”\n[01:51.61]And it brings me back to you\n[01:51.61]却又不禁想起你\n[01:55.05]\n[01:55.61]My stupid heart\n[01:55.61]我愚蠢的心\n[01:57.32]Don\'t know\n[01:57.32]不懂\n[01:58.44]I\'ve tried to let you go\n[01:58.44]我早就想放你走\n[02:00.24]So many times before\n[02:00.24]之前好多次松开了手\n[02:02.41]Then wound up at your door\n[02:02.41]却又出现在你家门口\n[02:04.00]My stupid heart\n[02:04.00]我愚蠢的心\n[02:05.66]Too late\n[02:05.66]为时太晚\n[02:06.82]Already on my way\n[02:06.82]我都已启程\n[02:08.59]If we go down in flames\n[02:08.59]若彼此陷身火海\n[02:10.83]Again then you can blame my stupid heart (Let\'s Go!)\n[02:10.83]你便又可以怪我那颗愚蠢的心 (开唱)\n[02:16.70](Okay!)\n[02:16.70](好吧)\n[02:18.94](Okay!)\n[02:18.94](好吧)\n[02:19.43]\n[02:19.60]You can blame my stupid heart\n[02:19.60]你大可怪我那颗愚蠢的心\n[02:23.86]I\'ve tried to let you go\n[02:23.86]我早就想放你走\n[02:25.38]So many times before\n[02:25.38]之前好多次松开了手\n[02:29.06]You can blame my stupid heart\n[02:29.06]你大可怪我那颗愚蠢的心\n[02:30.83]Too late\n[02:30.83]为时太晚\n[02:32.14]Already on my way\n[02:32.14]我都已启程\n[02:33.96]If we go down in flames\n[02:33.96]若彼此陷身火海\n[02:35.90]Again then you can blame my stupid heart\n[02:35.90]你便又可以怪我那颗愚蠢的心\n[02:39.25]Too late\n[02:39.25]为时太晚\n[02:40.31]Already on my way\n[02:40.31]我都已启程\n[02:42.13]If we go down in flames\n[02:42.13]若彼此陷身火海\n[02:44.27]Again then you can blame my stupid heart\n[02:44.27]你便又可以怪我那颗愚蠢的心', 1, '2026-08-19 14:28:37', '2026-08-19 14:28:37');
INSERT INTO `songs` VALUES (17, 'Lowlife', 'Neck Deep', 'Lowlife', 190000, '/Neck Deep - Lowlife.flac', 25574420, 'audio/flac', '/covers/song_1788747750223_1070.jpg', '[by:Anay_冰镇维他]\n[00:00.00]作曲 : JOSHUA HALLING/Benedict Barlow/Daniel Washington/Matthew West/SAMUEL BOWDEN/Sebastian Barlow\n[00:07.81]My colors\n[00:07.81]我的颜色\n[00:10.02]Yellow and green\n[00:10.02]是金黄和新绿\n[00:11.51]But I like some purple with my tangerine\n[00:11.51]可我还想加点紫色进亮橘\n[00:15.37]Can you name me, a better disease?\n[00:15.37]你能说出一个好点的病症吗？\n[00:19.11]I\'m young and dumb\n[00:19.11]我年轻又莽撞\n[00:21.20]Got vacancy\n[00:21.20]无所事事\n[00:24.86]Got vacancy\n[00:24.86]无所事事\n[00:28.66]I\'m vacant\n[00:28.66]也无处可去\n[00:34.07]You\'re perfect\n[00:34.07]你成熟完美\n[00:36.55]Perfectly clean\n[00:36.55]西装一尘不染\n[00:37.94]I\'m drinking coffee on a trampoline\n[00:37.94]而我在蹦床上喝着咖啡\n[00:41.70]You think you\'re better than me\n[00:41.70]你觉得自己比我技高一筹\n[00:45.17]\'Cuz I\'m young and dumb and vacant,see?\n[00:45.17]因为我年少无知无方向\n[00:50.95]I\'m vacant,see?\n[00:50.95]我籍籍无名\n[00:54.93]I\'m vacant\n[00:54.93]我吊儿郎当\n[00:56.86]Oh well, oh well\n[00:59.32]You\'re a normie\n[00:59.32]可你不过是个路人甲\n[01:02.47]So ****ing boring\n[01:02.47]无聊得令人生厌\n[01:05.64]Maybe I\'ll see you in hell\n[01:05.64]我或将同你在地狱相遇\n[01:08.04]Mr. \'I\'m so important\'\n[01:08.04]“我很重要”先生\n[01:19.09]My dreamworld is Alice and me\n[01:19.09]理想的世界里只有我与爱丽丝\n[01:22.92]My life is one big jamboree\n[01:22.92]我的人生就像一场盛大的PARTY\n[01:26.43]If you feel like taking a seat\n[01:26.43]如果你想进来找个位子\n[01:30.27]No you can\'t stay\n[01:30.27]不好意思，非请勿入\n[01:32.43]No vacancy\n[01:32.43]我们已经满座啦\n[01:35.94]No vacancy\n[01:35.94]这儿没你的位置\n[01:39.78]I\'m vacant\n[01:39.78]我就这么随心所欲\n[01:41.81]oh well oh well\n[01:44.30]You\'re a normie\n[01:44.30]你这个路人甲\n[01:47.54]So ****ing boring\n[01:47.54]无聊得令人生厌\n[01:50.45]Maybe I\'ll see you in hell\n[01:50.45]我或将同你在地狱相遇\n[01:52.98]Mr. \'I\'m so important\'\n[01:52.98]“我很重要”先生\n[01:59.01]Mr. important\n[01:59.01]噢，重要人士\n[02:01.33]I\'m ignoring you\n[02:01.33]我才不把你放眼里\n[02:06.38]The king of the morning\n[02:06.38]你这个明日之星\n[02:08.53]****ing boring\n[02:08.53]实在太TM烦了\n[02:11.48]So what, so what\n[02:11.48]那又怎样，拿我怎样\n[02:14.42]I\'m a lowlife\n[02:14.42]我就是个平庸之辈\n[02:17.66]Living the slowlife\n[02:17.66]过着我自己的生活\n[02:20.80]Baby I\'ll see you in hell\n[02:20.80]小可爱，我们会在地狱见面的\n[02:22.96]Mr. \'dead on the inside\'\n[02:22.96]“心如死灰”先生\n[02:33.92]Can you name me, a better disease?\n[02:33.92]你想叫我什么？新的社会蛀虫？\n[02:37.88]I\'m young and dumb\n[02:37.88]我趁着年轻肆无忌惮\n[02:39.75]Got vacancy\n[02:39.75]没人能给我身份定义\n[02:43.64]At the jamboree\n[02:43.64]在派对里\n[02:47.39]On the trampoline\n[02:47.39]在蹦床上\n[02:51.13]Purple tangerine\n[02:51.13]紫色的亮橘\n[02:54.94]Got vacancy\n[02:54.94]享受自由吧', 1, '2026-08-19 14:28:37', '2026-08-19 14:28:37');
INSERT INTO `songs` VALUES (18, '中国话', 'S.H.E', 'Play', 194000, '/S.H.E - 中国话.flac', 24174786, 'audio/flac', '/covers/song_1788747750260_6640.jpg', '[ti:中国话]\n[ar:S.H.E]\n[al:Play]\n[00:00.00]中国话 - S.H.E\n[00:00.10]词：郑楠/施人诚\n[00:00.21]曲：郑楠\n[00:00.31]编曲：郑楠\n[00:00.42]扁担宽 板凳长 扁担想绑在板凳上\n[00:05.12]扁担宽 板凳长 扁担想绑在板凳上\n[00:10.20]伦敦玛莉莲买了件旗袍送妈妈\n[00:12.59]莫斯科的夫司基爱上牛肉面疙瘩\n[00:15.05]各种颜色的皮肤 各种颜色的头发\n[00:17.47]嘴里念的说的开始流行中国话\n[00:19.85]多少年我们苦练英文发音和文法\n[00:22.20]这几年换他们卷着舌头学\n[00:24.10]平上去入的变化\n[00:25.31]平平仄仄平平仄\n[00:26.56]好聪明的中国人 好优美的中国话\n[00:29.09]扁担宽 板凳长 扁担想绑在板凳上\n[00:31.55]板凳不让扁担绑在板凳上\n[00:33.32]扁担偏要绑在板凳上\n[00:34.85]板凳偏偏不让扁担绑在那板凳上\n[00:37.01]到底扁担宽还是板凳长\n[00:38.70]哥哥弟弟坡前坐\n[00:39.98]坡上卧着一只鹅 坡下流着一条河\n[00:42.41]哥哥说 宽宽的河 弟弟说 白白的鹅\n[00:44.87]鹅要过河 河要渡鹅\n[00:46.45]不知是那鹅过河 还是河渡鹅\n[00:48.21]全世界都在学中国话\n[00:52.51]孔夫子的话 越来越国际化\n[00:57.25]全世界都在讲中国话\n[01:02.11]我们说的话 让世界都认真听话\n[01:17.47]纽约苏珊娜开了间禅风Lounge Bar\n[01:19.82]柏林来的沃夫冈拿胡琴配着电吉他\n[01:22.31]各种颜色的皮肤 各种颜色的头发\n[01:24.66]嘴里念的说的开始流行中国话\n[01:27.05]多少年我们苦练英文发音和文法\n[01:29.33]这几年换他们卷着舌头学\n[01:31.23]平上去入的变化\n[01:32.46]仄仄平平仄仄平\n[01:33.73]好聪明的中国人 好优美的中国话\n[01:36.22]有个小孩叫小杜 上街打醋又买布\n[01:38.73]买了布 打了醋 回头看见鹰抓兔\n[01:41.16]放下布 搁下醋 上前去追鹰和兔\n[01:43.61]飞了鹰 跑了兔 洒了醋 湿了布\n[01:45.93]嘴说腿 腿说嘴 嘴说腿 爱跑腿\n[01:48.32]腿说嘴 爱卖嘴 光动嘴 不动腿\n[01:50.72]光动腿 不动嘴 不如不长腿和嘴\n[01:53.18]到底是那嘴说腿 还是腿说嘴\n[01:55.16]全世界都在学中国话\n[01:59.69]孔夫子的话 越来越国际化\n[02:04.44]全世界都在讲中国话\n[02:09.32]我们说的话 让世界都认真听话\n[02:15.25]扁担扁扁扁 扁担宽 板凳长\n[02:17.65]扁担扁扁扁 扁担宽 板凳长\n[02:20.00]扁担扁扁扁 扁担宽\n[02:23.68]全世界都在学中国话\n[02:28.51]孔夫子的话 越来越国际化\n[02:33.23]全世界都在讲中国话\n[02:38.10]我们说的话 让世界都认真听话\n[02:43.01]全世界都在学中国话\n[02:47.66]孔夫子的话 越来越国际化\n[02:52.41]全世界都在讲中国话\n[02:57.23]我们说的话 让世界都认真听话', 1, '2026-08-19 14:28:37', '2026-08-19 14:28:37');
INSERT INTO `songs` VALUES (19, '눈, 코, 입(眼,鼻,口)', '太阳', 'Rise', 230000, '/TAEYANG (太阳) - 눈,코,입 (EYES,NOSE,LIPS).flac', 27116120, 'audio/flac', '/covers/song_1788747750289_4249.jpg', '[ti:눈,코,입 (眼，鼻，嘴)]\n[ar:태양 (太阳)]\n[al:RISE (2st Album : RISE)]\n[00:00.00]눈,코,입 - TAEYANG\n[00:01.77]词：TEDDY/태양\n[00:03.55]曲：TEDDY/DEE. P/Rebecca Johnson\n[00:05.32]编曲：TEDDY/DEE. P\n[00:07.10]미안해 미안해 하지마\n[00:07.10]不要说对不起 对不起\n[00:09.36]내가 초라해지잖아\n[00:09.36]这会让我更加落魄不堪\n[00:12.69]빨간 예쁜 입술로\n[00:12.69]用你那美丽的红唇\n[00:14.85]어서 나를 죽이고 가\n[00:14.85]痛快的杀了我 再走吧\n[00:17.23]나는 괜찮아\n[00:17.23]我没关系的\n[00:19.20]마지막으로 나를 바라봐줘\n[00:19.20]最后看我一眼吧\n[00:22.73]아무렇지 않은 듯 웃어줘\n[00:22.73]若无其事地对我微笑吧\n[00:26.01]네가 보고 싶을 때\n[00:26.01]让我在想你的时候\n[00:28.31]기억할 수 있게\n[00:28.31]能记起你的模样\n[00:29.82]나의 머릿속에 네 얼굴\n[00:29.82]让我能在脑海里\n[00:31.88]그릴 수 있게\n[00:31.88]勾勒出你的容颜\n[00:33.78]\n[00:34.99]널 보낼 수 없는 나의 욕심이\n[00:34.99]不愿放开你的这份奢望\n[00:38.38]집착이 되어 널 가뒀고\n[00:38.38]化作执着 将你囚禁\n[00:41.04]\n[00:41.75]혹시 이런 나 땜에 힘들었니\n[00:41.75]你是否因这样的我疲惫不堪\n[00:44.84]아무 대답 없는 너\n[00:44.84]默默不答的你\n[00:47.86]\n[00:48.93]바보처럼 왜\n[00:48.93]好傻 为什么\n[00:51.33]\n[00:52.25]너를 지우지 못해\n[00:52.25]无法忘记你\n[00:54.47]\n[00:55.46]넌 떠나버렸는데\n[00:55.46]明明你已离开\n[00:57.67]\n[00:59.89]너의 눈 코 입\n[00:59.89]你的眼睛 鼻子 双唇\n[01:02.28]날 만지던 네 손길\n[01:02.28]你曾温柔抚摸我的手\n[01:05.11]작은 손톱까지 다\n[01:05.11]甚至那小小的指尖 全都\n[01:08.01]\n[01:09.74]여전히 널 느낄 수 있지만\n[01:09.74]我依然能够感受到你\n[01:13.00]꺼진 불꽃처럼\n[01:13.00]可是 就像熄灭的花火般\n[01:15.90]타들어가버린\n[01:15.90]已经燃烧殆尽\n[01:18.55]우리 사랑 모두 다\n[01:18.55]我们所有的爱\n[01:21.70]\n[01:23.12]너무 아프지만 이젠 널\n[01:23.12]虽然痛彻心扉 今后\n[01:25.64]추억이라 부를게\n[01:25.64]就把你称为回忆吧\n[01:27.35]\n[01:30.32]사랑해 사랑했지만\n[01:30.32]爱你 虽然爱你\n[01:32.68]내가 부족했었나 봐\n[01:32.68]可我 也许还是不够格吧\n[01:36.02]혹시 우연이라도\n[01:36.02]哪怕是偶然\n[01:38.23]한순간만이라도\n[01:38.23]哪怕仅有一瞬间\n[01:39.94]널 볼 수 있을까\n[01:39.94]也能否见到你呢\n[01:43.06]하루하루가 불안해져\n[01:43.06]一天一天愈发不安\n[01:45.97]네 모든 게 갈수록 희미해져\n[01:45.97]你的一切逐渐模糊\n[01:49.38]사진 속에 너는 왜\n[01:49.38]照片里的你 为什么\n[01:51.78]해맑게 웃는데\n[01:51.78]笑得那么灿烂\n[01:53.31]우리에게 다가오는 이별을 모른 채\n[01:53.31]全然没有察觉 逐渐靠近我们的离别\n[01:57.52]\n[01:58.31]널 보낼 수 없는 나의 욕심이\n[01:58.31]不愿放开你的这份奢望\n[02:01.76]집착이 되어 널 가뒀고\n[02:01.76]化作执着 将你囚禁\n[02:04.36]\n[02:05.03]혹시 이런 나 땜에 힘들었니\n[02:05.03]你是否因这样的我疲惫不堪\n[02:08.15]아무 대답 없는 너\n[02:08.15]默默不答的你\n[02:11.27]\n[02:12.42]바보처럼 왜\n[02:12.42]好傻 为什么\n[02:14.36]\n[02:15.60]너를 지우지 못해\n[02:15.60]无法忘记你\n[02:18.07]\n[02:18.89]넌 떠나버렸는데\n[02:18.89]明明你已离开\n[02:21.20]\n[02:23.25]너의 눈 코 입\n[02:23.25]你的眼睛 鼻子 双唇\n[02:25.69]날 만지던 네 손길\n[02:25.69]你曾温柔抚摸我的手\n[02:28.43]작은 손톱까지 다\n[02:28.43]甚至那小小的指甲 全都\n[02:31.67]\n[02:33.17]여전히 널 느낄 수 있지만\n[02:33.17]我依然能够感受到你\n[02:35.70]\n[02:36.35]꺼진 불꽃처럼\n[02:36.35]就像熄灭的花火般\n[02:39.19]타들어가버린\n[02:39.19]已经燃烧殆尽\n[02:41.87]우리 사랑 모두 다\n[02:41.87]我们所有的爱\n[02:45.22]\n[02:46.39]너무 아프지만\n[02:46.39]虽然痛彻心扉 今后\n[02:47.70]이젠 널 추억이라 부를게\n[02:47.70]就把你称为回忆吧\n[02:50.64]\n[03:03.58]나만을 바라보던 너의 까만 눈\n[03:03.58]你的深邃明眸 曾经只凝望我\n[03:06.45]향기로운 숨을 담은 너의 코\n[03:06.45]你呼出清新气息的鼻子\n[03:09.64]사랑해 사랑해\n[03:09.64]我爱你 我爱你\n[03:13.20]내게 속삭이던 그 입술을 난\n[03:13.20]曾对我低语呢喃的那嘴唇 让我怀念\n[03:16.01]\n[03:18.28]너의 눈 코 입\n[03:18.28]你的眼睛 鼻子 双唇\n[03:20.71]날 만지던 네 손길\n[03:20.71]你曾温柔抚摸我的手\n[03:23.49]작은 손톱까지 다\n[03:23.49]甚至那小小的指尖 全都\n[03:26.70]\n[03:28.15]여전히 널 느낄 수 있지만\n[03:28.15]我依然能够感受到你\n[03:30.77]\n[03:31.44]꺼진 불꽃처럼\n[03:31.44]就像熄灭的花火般\n[03:34.25]타들어가버린\n[03:34.25]已经燃烧殆尽\n[03:36.84]우리 사랑 모두 다\n[03:36.84]我们所有的爱\n[03:40.08]\n[03:41.41]너무 아프지만 이젠 널\n[03:41.41]虽然痛彻心扉 今后\n[03:43.95]추억이라 부를게\n[03:43.95]就把你称为回忆吧', 1, '2026-08-19 14:28:37', '2026-08-19 14:28:37');
INSERT INTO `songs` VALUES (20, '三国恋', 'Tank', 'Fighting！生存之道', 246000, '/Tank - 三国恋.flac', 33240599, 'audio/flac', '/covers/song_1788747750299_7519.jpg', '[00:00.00]作词 : Tank/颜玺轩\n[00:01.00]作曲 : Tank\n[00:02.00]编曲 : 吕绍淳\n[00:30.09]将军 北方仓粮占据\n[00:34.09]六马十二兵 等待你光临\n[00:37.29]胡琴 诉说英勇事迹\n[00:39.60]败军 向南远北方离\n[00:44.48]家乡 在那美的远方\n[00:46.08]期望在身上 梦想在流浪\n[00:49.68]肩上 剩下的能量\n[00:53.39]还能撑到什么地方\n[00:55.76]等待良人归来那一刻 眼泪为你唱歌\n[01:08.18]在我离你远去那一天 蓝色的雨下在我眼前\n[01:15.08]骄傲的泪 不敢弃守我眼睛\n[01:20.49]在我离你远去那一天 灰色的梦睡在我身边\n[01:27.00]我早就该习惯没有你的夜 勇敢的面对\n[01:39.73]赤壁 烽火连天战役\n[01:44.69]只挂掉我们 七万个兄弟\n[01:46.61]长江 水面写日记\n[01:49.48]连你也能看见涟漪\n[01:52.72]家乡 在那美的远方\n[01:56.28]泪水背着光 安静而悲伤\n[01:59.22]肩上 剩下的能量\n[02:01.72]还能撑到什麽地方\n[02:05.29]等待良人归来那一刻 眼泪为你唱歌\n[02:17.65]在我离你远去那一天 蓝色的雨下在我眼前\n[02:24.47]骄傲的泪 不敢弃守我眼睛\n[02:31.38]在我离你远去那一天 灰色的梦睡在我身边\n[02:37.36]我早就该习惯没有你的夜 勇敢的面对\n[02:43.23]我试着面对 灰色的夜 还在眼前\n[02:55.72]等待良人归来那一刻 眼泪为你唱歌\n[03:08.37]在我离你远去那一天 蓝色的雨下在我眼前\n[03:14.87]骄傲的泪 不敢弃守我眼睛\n[03:20.79]在我离你远去那一天 灰色的梦睡在我身边\n[03:27.28]我早就该习惯没有你的夜 勇敢的面对', 1, '2026-08-19 14:28:37', '2026-08-19 14:28:37');
INSERT INTO `songs` VALUES (21, '不完美小孩', 'TFBOYS', '我们的时光', 260000, '/TFBOYS - 不完美小孩.flac', 28660940, 'audio/flac', '/covers/song_1788747750311_9334.jpg', '[00:00.00]作词 : 蓝小邪\n[00:01.00]作曲 : 颜小健\n[00:02.00]编曲 : 颜小健\n[00:05.83]\n[00:15.59]千玺：\n[00:17.79]当我的笑灿烂像阳光\n[00:22.14]当我的梦做的够漂亮\n[00:26.31]这世界才为我鼓掌\n[00:30.53]只有你担心我受伤\n[00:33.76]王源：\n[00:34.75]全世界在等我飞更高\n[00:39.08]你却心疼我小小翅膀\n[00:42.79]为我撑起\n[00:45.08]沿途休息的地方\n[00:49.46]俊凯：\n[00:50.67]当我必须像个完美的小孩\n[00:55.74]满足所有人的期待\n[00:59.22]你却好像 格外欣赏\n[01:04.27]我犯错犯傻的模样\n[01:08.87]合：\n[01:09.64]我不完美的梦\n[01:11.94]你陪着我想\n[01:14.15]不完美的勇气\n[01:15.95]你说更勇敢\n[01:18.41]不完美的泪\n[01:20.41]你笑着擦干\n[01:22.56]不完美的歌\n[01:24.11]你都会唱\n[01:26.61]我不完美心事\n[01:28.76]你全放在心上\n[01:30.75]这不完美的我\n[01:32.70]你总当作宝贝\n[01:35.30]千玺：\n[01:36.10]你给我的爱也许不完美\n[01:39.57]但却最美\n[02:02.40]千玺：\n[02:03.96]全世界在催着我长大\n[02:08.26]你却总能捧我在手掌\n[02:11.42]王源：\n[02:11.98]为我遮挡\n[02:14.27]未知的那些风浪\n[02:18.06]俊凯：\n[02:19.86]当我努力做个完美的小孩\n[02:24.94]满足所有人的期待\n[02:27.75]王源：\n[02:28.43]你却不讲 你的愿望\n[02:32.66]合：\n[02:33.46]怕增添我肩上重量\n[02:38.91]我不完美的梦\n[02:41.16]你陪着我想\n[02:43.31]不完美的勇气\n[02:45.11]你说更勇敢\n[02:47.61]不完美的泪\n[02:49.56]你笑着擦干\n[02:51.78]不完美的歌\n[02:53.38]你都会唱\n[02:55.82]我不完美心事\n[02:57.91]你全放在心上\n[02:59.98]这不完美的我\n[03:01.88]你总当作宝贝\n[03:05.33]你给我的爱也许不完美\n[03:08.78]但却最美\n[03:28.93]俊凯：\n[03:29.88]我不完美的梦\n[03:32.16]你陪着我想\n[03:34.26]不完美的勇气\n[03:36.06]你说更勇敢\n[03:38.04]合：\n[03:38.59]不完美的泪\n[03:40.64]你笑着擦干\n[03:42.74]不完美的歌\n[03:44.39]你都会唱\n[03:46.74]我不完美心事\n[03:48.89]你全放在心上\n[03:51.00]这不完美的我\n[03:52.80]你总当作宝贝\n[03:56.37]你给我的爱也许不完美\n[03:59.67]但却最美\n[04:02.56]王源：\n[04:04.71]你给我的爱也许不完美\n[04:08.25]但却最美', 1, '2026-08-19 14:28:37', '2026-08-19 14:28:37');
INSERT INTO `songs` VALUES (22, 'Flashbang dance(feat. n0thing)', 'The Verkkars、n0thing', 'Flashbang dance (feat. n0thing)', 160000, '/The Verkkars、n0thing - Flashbang dance (feat. n0thing).flac', 20463056, 'audio/flac', '/covers/song_1788747750319_7169.jpg', '[ti:Flashbang dance(feat. n0thing)]\n[ar:The Verkkars/n0thing]\n[al:Flashbang dance (feat. n0thing)]\n[00:00.00]Flashbang dance(feat. n0thing) - The Verkkars/n0thing\n[00:00.00]QQ音乐享有本翻译作品的著作权\n[00:02.07]Lyrics by：The Verkkars/n0thing\n[00:04.15]It\'s Verkkars and n0thing\n[00:04.15]Verkkars携手n0thing\n[00:08.28]Oohh\n[00:09.45]Do the flashbang dance \'til the last man stands\n[00:09.45]来跳闪光舞 直至最后一人\n[00:13.65]It\'s all on the hips and the hands hands hands\n[00:13.65]它的要点集中在臀和手\n[00:17.05]Put your game face on and prepare your stance\n[00:17.05]拿出你的认真态度 守好你的据点\n[00:21.00]\'Til the last man stands\n[00:21.00]直至最后一人\n[00:23.17]\n[00:24.30]Now do the flashbang dance\n[00:24.30]现在来跳闪光舞\n[00:25.88]Dance dance dance dance d-d-d-d\n[00:25.88]舞 舞 舞 舞\n[00:31.94]Now do the flashbang dance\n[00:31.94]现在来跳闪光舞\n[00:33.48]Flash flash ba-dang\n[00:33.48]闪光 闪光\n[00:34.86]Flash ba-dang a dance\n[00:34.86]闪光舞\n[00:36.38]Hey\n[00:37.45]Flash flash ba-dang\n[00:37.45]闪光舞\n[00:38.76]Bang a dang a dance\n[00:38.76]闪光舞 闪光舞\n[00:39.79]Show them how they do it\n[00:39.79]给他们看看是怎么做的\n[00:41.31]Flash flash ba-dang\n[00:41.31]闪光 闪光\n[00:42.59]Flash ba-dang a dance\n[00:42.59]闪光舞\n[00:43.96]Hey\n[00:45.02]Flash flash ba-dang\n[00:45.02]闪光 闪光\n[00:46.38]Three two one\n[00:46.38]三 二 一\n[00:47.71]Here we go\n[00:47.71]我们出发\n[00:48.42]Running off long A with an AK\n[00:48.42]拿上AK突破A点\n[00:50.26]Doesn\'t really matter what way you wanna play\n[00:50.26]你要用什么战术技巧不是关键\n[00:52.15]Dashing through a smoke\n[00:52.15]冲过烟雾\n[00:52.91]With a flash like Snax\n[00:52.91]像Snax一样扔出闪光弹\n[00:54.10]Coming with speed and ready to attack\n[00:54.10]快速跑位 准备发起进攻\n[00:56.35]Pop flash make the crowd dance\n[00:56.35]扔出闪光弹 让人群四散逃窜\n[00:57.85]300 IQ with the counter tacs\n[00:57.85]智商300 计时器倒数着时间\n[00:59.52]Now whole team sitting on my back\n[00:59.52]现在 整支小队都是我的后盾\n[01:01.62]Next round on me I got zero cash\n[01:01.62]下一轮是我的主场 我没有花钱\n[01:03.86]Balling like Gaben Gaben feeling bit faded\n[01:03.86]像格本一样玩转游戏 感觉视线渐渐模糊\n[01:06.87]And even if I go blind I can still see all my haters\n[01:06.87]即使看不见前方 我依然能感觉到我的敌人\n[01:10.89]Do the flashbang dance \'til the last man stands\n[01:10.89]来跳闪光舞 直至最后一人\n[01:15.07]It\'s all on the hips and the hands hands hands\n[01:15.07]它的要点集中在臀和手\n[01:18.48]Put your game face on and prepare your stance\n[01:18.48]拿出你的认真态度 守好你的据点\n[01:22.31]\'Til the last man stands\n[01:22.31]直至最后一人\n[01:25.70]Now do the flashbang dance\n[01:25.70]现在扔出闪光弹\n[01:27.00]Monday \'til the Friday\n[01:27.00]从周一到周五\n[01:28.69]Friday \'til the Sunday\n[01:28.69]从周五到周日\n[01:30.52]All we all we do is party flashbang dance\n[01:30.52]我们日日夜夜 我们日日夜夜都在枪林弹雨的世界狂欢\n[01:33.50]Monday Monday\n[01:33.50]周一 周一\n[01:34.49]Monday \'til the Friday\n[01:34.49]从周一到周五\n[01:36.30]Friday \'til the Sunday\n[01:36.30]从周五到周日\n[01:38.19]All we all we do is\n[01:38.19]我们日日夜夜 我们日日夜夜都在\n[01:40.47]\n[01:41.13]Now do the flashbang dance\n[01:41.13]现在来跳闪光舞\n[01:42.60]Flash flash ba-dang\n[01:42.60]闪光 闪光\n[01:43.95]Flash ba-dang a dance\n[01:43.95]来跳闪光舞\n[01:45.35]Hey\n[01:46.39]Flash flash ba-dang\n[01:46.39]闪光 闪光\n[01:47.88]Bang a dang a dance\n[01:47.88]闪光舞 闪光舞\n[01:49.51]\n[01:50.45]Flash flash ba-dang\n[01:50.45]闪光 闪光\n[01:51.69]Flash ba-dang a dance\n[01:51.69]来跳闪光舞\n[01:53.10]Hey\n[01:54.12]Flash flash ba-dang\n[01:54.12]闪光 闪光\n[01:55.52]Three two one\n[01:55.52]三 二 一\n[01:56.63]Here we go\n[01:56.63]我们出发\n[01:57.05]Round two\n[01:57.05]第二轮\n[01:57.42]Feeling maxed out full of ammo\n[01:57.42]感觉兴奋到极点 装满子弹\n[01:59.31]Spray and pray that\'s our only motto\n[01:59.31]扫射并祈祷 这是我们唯一的格言\n[02:01.38]King of the jungle negev and rambo\n[02:01.38]丛林之王 内盖夫和蓝博\n[02:03.27]200 ammo ready to rumble\n[02:03.27]200发子弹 准备赌上一把\n[02:05.23]Yeah\n[02:05.94]Mister flashbang here\n[02:05.94]在这里扔出闪光弹\n[02:07.03]Cook it whip it medium rare\n[02:07.03]游刃有余 大杀四方 还没到火候\n[02:08.82]Flip it\n[02:08.82]换种战术继续\n[02:09.80]Any place and hour\n[02:09.80]任何地点 任何时间\n[02:10.90]Hips don\'t lie y\'all know its powers\n[02:10.90]实力不会说谎 你知道这都是力量决定的\n[02:12.86]Balling like Gaben feeling bit faded\n[02:12.86]像格本一样玩转游戏 感觉视线渐渐模糊\n[02:15.98]And even if I go blind I could still see all my haters\n[02:15.98]即使看不见前方 我依然能感觉到我的敌人\n[02:20.13]Do the flashbang dance \'til the last man stands\n[02:20.13]来跳闪光舞 直至最后一人\n[02:24.31]It\'s all on the hips and the hands hands hands\n[02:24.31]它的要点集中在臀和手\n[02:27.57]Put your game face on and prepare your stance\n[02:27.57]拿出你的认真态度 守好你的据点\n[02:31.46]\'Til the last man stands\n[02:31.46]直至最后一人\n[02:33.79]\n[02:34.84]Now do the flashbang dance\n[02:34.84]现在来跳闪光舞', 1, '2026-08-19 14:28:37', '2026-08-19 14:28:37');
INSERT INTO `songs` VALUES (23, 'Trouble Maker', 'Trouble Maker', 'Trouble Maker', 220000, '/Trouble Maker - Trouble Maker.flac', 27699457, 'audio/flac', '/covers/song_1788747750329_8190.jpg', '[by:Jensen48_]\n[00:00.00]作词 : Rado\n[00:01.00]作曲 : 新沙洞老虎/Rado\n[00:16.82]1！2！3！\n[00:23.32]니 눈을 보면 난 trouble maker\n[00:23.32]看着你的双眼 我就是捣蛋鬼\n[00:27.38]니 곁에 서면 난trouble maker\n[00:27.38]站在你的身边 我就是捣蛋鬼\n[00:30.59]조금씩 더 더 더\n[00:30.59]一点点 更加\n[00:32.65]갈수록 더 더 더\n[00:32.65]越来越 愈发\n[00:35.03]이젠 내 맘을 나도 어쩔 수 없어\n[00:35.03]现在连我自己都拿我的心毫无办法\n[00:39.37]니가 나를 잊지 못하게 자꾸 니 앞에서 또\n[00:39.37]为了让你忘不了我 总是又在你眼前出现\n[00:43.63]니 맘 자꾸 내가 흔들어 벗어날 수 없도록\n[00:43.63]我总是动摇你的心 让你无法逃脱\n[00:47.87]니 입술을 또 훔치고 멀리 달아나버려\n[00:47.87]再一次偷走你的吻 然后逃得远远的\n[00:51.99]난 trou a a a ble ! trouble! trou! Trouble maker\n[00:51.99]我就是个捣蛋鬼\n[00:59.53]Trouble maker Trouble maker Trouble maker Trouble maker\n[00:59.53]捣蛋鬼\n[01:15.30]니 맘을 깨물고 도망칠 거야 고양이 처럼\n[01:15.30]咬一口你的心然后逃走 就像猫咪一样\n[01:19.74]넌 자꾸 안달이 날 거야 내 앞으로 와 어서 화내버렴\n[01:19.74]你总是会焦躁不已 来到我的眼前 快要发飙\n[01:23.82]내 섹시한 걸음 니 머리 속에 발동을 거는\n[01:23.82]我性感的步伐 那隐约的肌肤触碰\n[01:27.77]은근한 스킨십 얼굴에 비친 못 참아 죽겠단 니 눈빛\n[01:27.77]让你的大脑飞速运转 脸上映照出你那快要忍不住的眼神\n[01:32.20]갈수록 깊이 더 빠져들어 알수록 니가 더 맘에 들어 baby\n[01:32.20]陷得越来越深 越是了解就越是喜欢你 baby\n[01:40.75]아무래도 니 생각에 취했나봐 lady\n[01:40.75]不管怎么说 似乎已经满脑子都是你 lady\n[01:44.72]I never never never stop!\n[01:44.72]我不会停下\n[01:48.36]니가 나를 잊지 못하게 자꾸 니 앞에서 또\n[01:48.36]为了让你忘不了我 总是又在你眼前出现\n[01:52.50]니 맘 자꾸 내가 흔들어 벗어날 수 없도록\n[01:52.50]我总是动摇你的心 让你无法逃脱\n[01:56.65]니 입술을 또 훔치고 멀리 달아나버려\n[01:56.65]再一次偷走你的吻 然后逃得远远的\n[02:00.85]난trou a a a ble! Trouble! Trou! Trouble maker!\n[02:00.85]我就是个捣蛋鬼\n[02:08.43]Trouble maker Trouble maker Trouble maker Trouble maker\n[02:08.43]捣蛋鬼\n[02:22.49]어떻게 널 내 맘에 제발 둘 수 있는지\n[02:22.49]我要如何才能将你放在我的心中\n[02:30.86]그냥 내 맘이 가는대로 이젠\n[02:30.86]就那样随着自己的心 现在\n[02:34.50]I never never stop!\n[02:34.50]我不会停下\n[02:36.57]멈출 수 없어\n[02:36.57]无法停止\n[02:55.46]니가 나를 잊지 못하게 자꾸 니 앞에서 또\n[02:55.46]为了让你忘不了我 总是又在你眼前出现\n[02:59.43]니 맘 자꾸 내가 흔들어 벗어날 수 없도록\n[02:59.43]我总是动摇你的心 让你无法逃脱\n[03:03.41]니 입술을 또 훔치고 멀리 달아나버려\n[03:03.41]再一次偷走你的吻 然后逃得远远的\n[03:07.69]난trou a a a ble! Trouble! Trou! Trouble maker!\n[03:07.69]我就是个捣蛋鬼\n[03:15.33]Trouble maker Trouble maker Trouble maker Trouble maker\n[03:15.33]捣蛋鬼', 1, '2026-08-19 14:28:37', '2026-08-19 14:28:37');
INSERT INTO `songs` VALUES (24, 'Revenge(Minecraft Creeper Song)', 'TryHardNinja', 'Revenge (Minecraft Creeper Song) [feat. CaptainSparklez]', 223000, '/TryHardNinja、Captainsparklez - Revenge (Minecraft Creeper Song).flac', 27685354, 'audio/flac', '/covers/song_1788747750338_4491.jpg', '[ti:Revenge(Minecraft Creeper Song)]\n[ar:TryHardNinja/Captainsparklez]\n[al:Revenge (Minecraft Creeper Song) (feat. CaptainSparklez)]\n[00:00.00]Revenge(Minecraft Creeper Song) - TryHardNinja/Captainsparklez\n[00:01.82]Lyrics by：Igor Gordiyenko\n[00:02.69]Composed by：Igor Gordiyenko\n[00:03.51]TryHardNinja：\n[00:04.37]Creeper\n[00:04.37]苦力怕\n[00:06.41]Aw man\n[00:06.41]噢 伙计\n[00:07.65]TryHardNinja：\n[00:08.36]So we back in the mine\n[00:08.36]进入矿井\n[00:10.12]Got our pickaxe swinging from side to side\n[00:10.12]拿起十字镐准备挖矿 从一边挖到另一边\n[00:13.84]Side-side to side\n[00:13.84]每个角落都不放过\n[00:16.33]This task a grueling one\n[00:16.33]这是一项艰苦的任务\n[00:18.10]Hope to find some diamonds tonight night night\n[00:18.10]希望今晚能挖到钻石\n[00:21.85]Diamonds tonight\n[00:21.85]今晚挖到钻石\n[00:23.58]TryHardNinja：\n[00:24.04]Heads up\n[00:24.04]小心谨慎\n[00:25.90]You hear a sound turn around and look up\n[00:25.90]你听到奇怪的声音 转身抬头 四处观望\n[00:30.09]Total shock fills your body\n[00:30.09]汗毛竖立 震惊不已\n[00:32.34]Oh no it\'s you again\n[00:32.34]又是你\n[00:34.11]I can never forget those eyes eyes eyes\n[00:34.11]你的那双眼睛 我永生难忘\n[00:37.83]Eyes-eye-eyes\n[00:37.83]眼睛\n[00:38.86]TryHardNinja：\n[00:39.03]\'Cause baby tonight\n[00:39.03]宝贝 今晚苦力怕\n[00:41.55]The creeper\'s tryna steal all our stuff again\n[00:41.55]想要再次把你的物品洗劫一空\n[00:46.89]\'Cause baby tonight\n[00:46.89]宝贝 今晚\n[00:49.66]You grab your pick shovel and bolt again\n[00:49.66]带上工具\n[00:53.85]Bolt again-gain\n[00:53.85]绝地重生\n[00:55.88]And run run until it\'s done done\n[00:55.88]东奔西走 直到游戏结束\n[00:59.08]Until the sun comes up in the morn\'\n[00:59.08]直到太阳升起\n[01:03.02]\'Cause baby tonight\n[01:03.02]宝贝 今晚\n[01:05.59]The creeper\'s tryna steal all our stuff again\n[01:05.59]苦力怕想要再次把你的物品洗劫一空\n[01:09.84]Stuff again-gain\n[01:09.84]全部偷走\n[01:11.65]TryHardNinja：\n[01:12.41]Just when you think you\'re safe\n[01:12.41]就在你以为安全的时候\n[01:14.11]Overhear some hissing from right behind\n[01:14.11]身后传来嘶嘶声\n[01:17.85]Right-right behind\n[01:17.85]身后\n[01:20.48]That\'s a nice life you have\n[01:20.48]你现在的生活还不错\n[01:22.12]Shame it\'s gotta end at this time time time\n[01:22.12]不过真遗憾 这次一切终将结束\n[01:25.83]Time-time-time-time\n[01:25.83]就是现在\n[01:27.59]TryHardNinja：\n[01:28.08]Blows up\n[01:28.08]发生爆炸\n[01:29.90]Then your health bar drops and you could use a one-up\n[01:29.90]代表你生命的血量掉了半截\n[01:34.15]Get inside don\'t be tardy\n[01:34.15]你可以借助道具满血复活\n[01:36.34]So now you\'re stuck in there\n[01:36.34]赶紧躲起来 别迟疑\n[01:38.10]Half a heart is left but don\'t die die die\n[01:38.10]你现在进退维谷 奄奄一息\n[01:41.87]Die-die-die\n[01:41.87]差一点死掉\n[01:42.80]TryHardNinja：\n[01:42.92]\'Cause baby tonight\n[01:42.92]宝贝 今晚\n[01:45.59]The creeper\'s tryna steal all our stuff again\n[01:45.59]苦力怕想要再次把你的物品洗劫一空\n[01:50.85]\'Cause baby tonight\n[01:50.85]宝贝 今晚\n[01:53.62]You grab your pick shovel and bolt again\n[01:53.62]带上工具\n[01:57.88]Bolt again-gain\n[01:57.88]绝地重生\n[01:59.83]And run run until it\'s done done\n[01:59.83]东奔西走 直到游戏结束\n[02:03.10]Until the sun comes up in the morn\'\n[02:03.10]直到太阳升起\n[02:06.90]\'Cause baby tonight\n[02:06.90]宝贝 今晚\n[02:09.53]The creeper\'s tryna steal all our stuff again\n[02:09.53]苦力怕想要再次把你的物品洗劫一空\n[02:12.72]CaptainSparklez：\n[02:12.84]Creepers you\'re mine haha\n[02:12.84]苦力怕 你是我的\n[02:16.27]Dig up diamonds and craft those diamonds\n[02:16.27]挖钻石 把钻石打造成盔甲\n[02:18.09]And make some armor get it baby\n[02:18.09]宝贝 马到成功\n[02:20.03]Go and forge that like you so MLG pro\n[02:20.03]发掘像你这种职业玩家\n[02:22.17]The sword\'s made of diamonds so come at me bro huh\n[02:22.17]这把剑是钻石做的 向我发起进攻\n[02:24.65]Training in your room under the torchlight\n[02:24.65]房间里点燃火把 借着光亮加紧训练\n[02:26.06]Hone that form to get you ready for the big fight\n[02:26.06]潜心学习 为即将到来的战斗做好准备\n[02:28.60]Every single day and the whole night\n[02:28.60]日日夜夜\n[02:30.13]Creeper\'s out prowlin\' hoo alright\n[02:30.13]苦力怕在不断繁殖\n[02:32.29]Look at me look at you\n[02:32.29]看看我 看看你自己\n[02:33.61]Take my revenge that\'s what I\'m gonna do\n[02:33.61]我要复仇 这是我要做的事\n[02:35.75]I\'m a warrior baby what else is new\n[02:35.75]我是英勇的战士 宝贝 不足为奇\n[02:37.94]And my blade\'s gonna tear through you bring it\n[02:37.94]我要让你尝尝利剑穿心的滋味\n[02:39.61]TryHardNinja/CaptainSparklez：\n[02:39.86]\'Cause baby tonight\n[02:39.86]宝贝 今晚\n[02:41.66]The creeper\'s tryna steal all our stuff again\n[02:41.66]苦力怕想要再次把你的物品洗劫一空\n[02:44.69]Gather your stuff yeah let\'s take back the world\n[02:44.69]夺回属于我们的世界\n[02:47.11]Yeah baby tonight\n[02:47.11]宝贝 今晚\n[02:48.51]Haha\n[02:50.11]Grab your sword armor and go\n[02:50.11]拿上你的剑 穿上盔甲 行动起来\n[02:52.54]It\'s on\n[02:52.54]行动起来\n[02:53.70]Take your revenge\n[02:53.70]开始复仇\n[02:54.30]Woo oh-oh oh-oh\n[02:56.15]So fight fight like it\'s the last last night\n[02:56.15]加入战斗 全力以赴 浴血奋战\n[02:59.49]Of your life life show them your bite\n[02:59.49]直到生命终结 给他们点教训\n[03:02.62]Woo\n[03:02.69]TryHardNinja/CaptainSparklez：\n[03:02.94]\'Cause baby tonight\n[03:02.94]宝贝 今晚\n[03:05.56]The creeper\'s tryna steal all our stuff again\n[03:05.56]苦力怕想要再次把你的物品洗劫一空\n[03:11.04]\'Cause baby tonight\n[03:11.04]宝贝 今晚\n[03:13.60]You grab your pick shovel and bolt again\n[03:13.60]带上工具\n[03:17.88]Bolt again-gain woo\n[03:17.88]绝地重生\n[03:19.98]And run run until it\'s done done\n[03:19.98]东奔西走 直到游戏结束\n[03:23.13]Until the sun comes up in the morn\'\n[03:23.13]直到太阳升起\n[03:26.99]\'Cause baby tonight\n[03:26.99]宝贝 今晚\n[03:28.94]Come on swing your sword up high\n[03:28.94]拿上你的剑\n[03:30.82]Come on jab your sword down low\n[03:30.82]穿上盔甲 行动起来\n[03:35.62]Woo', 1, '2026-08-19 14:28:37', '2026-08-19 14:28:37');
INSERT INTO `songs` VALUES (25, '他们的低语(纯歌版）', 'ZERO、霜降', 'cover | 他们的低语', 315000, '/ZERO、霜降 - 他们的低语 (纯歌版).mp3', 12720164, 'audio/mpeg', '/covers/song_1788747750350_4457.jpg', '[00:02.59]原Cast：\r\n[00:03.68]策划：鹿濯\r\n[00:04.80]编曲：郑洋（Young Z）\r\n[00:05.76]填词：鹿濯\r\n[00:06.63]画师：洲*衙\r\n[00:07.44]歌曲音频后期：郑洋（Young Z）\r\n[00:08.29]演唱：ZERO＆霜降\r\n[00:09.13]中/国：赵泽轩\r\n[00:09.93]日/本：集远翔太\r\n[00:10.72]德/国：霜降\r\n[00:11.55]意/大/利：Orchard\r\n[00:12.29]俄/罗/斯：心晴\r\n[00:13.03]英/国：桐路\r\n[00:13.71]法/国：夜久瞳\r\n[00:14.96]美/国＆加/拿/大：逆鳞\r\n[00:16.07]普/鲁/士：清山\r\n[00:17.06]-\r\n[00:22.66]现Cast：\r\n[00:23.99]唱｜混｜视：文雯\r\n[00:24.74]念白：文雯｜岁安\r\n[00:25.62]-\r\n[00:29.28]阿波罗的诗琴 回溯悠长\r\n[00:35.62]日出之邦的风 奏响了争鸣八荒\r\n[00:41.98]槲寄生的沉语 咏叹末世的悲怆\r\n[00:48.41]东征呼马蹄扬 独霸一方\r\n[00:54.27]-\r\n[00:57.70]我听见庞贝的乐章 盲诗人的恸哭绝唱\r\n[01:03.50]我听见奥尔良的引吭 属于法兰西的光\r\n[01:10.15]大荒驼铃东起古城墙 扬帆驶入万海千江\r\n[01:16.49]新大陆的征途之上 星条飞扬\r\n[01:23.66]-\r\n[01:36.34]翡冷翠的花蕾 重生绽放\r\n[01:42.84]黑船来航之声 再塑了明治东洋\r\n[01:49.04]日耳曼的战车烙上 复仇的悲凉\r\n[01:55.62]燃乌香破虚妄 惊涛骇浪\r\n[02:02.31]-\r\n[02:04.85]我听见汽笛的嚣响 齿轮轻声咬合碰撞\r\n[02:10.70]我听见怒号猩红癫狂 推开苏维埃的窗\r\n[02:17.34]血染塞纳三色覆波旁 自由颂往南地北方\r\n[02:23.60]千年王朝终成过往 民声嘹亮\r\n[02:30.41]-\r\n[02:31.07]青天下红旗冉冉心之所往\r\n[02:37.25]炮嚣鸣梦魇天降局势激荡\r\n[02:43.62]冬将军逆转天平的倾向\r\n[02:48.80]势如破竹霸王行动拓战场\r\n[02:56.15]-\r\n[03:00.97]美/国：He was my North\r\n[03:03.40]加/拿/大：My South\r\n[03:05.08]德/国：My East\r\n[03:06.48]普/鲁/士：And West\r\n[03:08.32]意/大/利：My working weak\r\n[03:10.79]英/国：And my Sunday rest.\r\n[03:14.12]日/本：My moon\r\n[03:15.59]法/国：My midnight\r\n[03:17.26]俄/罗/斯：My talk\r\n[03:19.93]中/国：My song.\r\n[03:22.56]-\r\n[03:24.77]我听见庞贝的乐章 盲诗人的恸哭绝唱\r\n[03:31.10]我听见奥尔良的引吭 属于法兰西的光\r\n[03:37.28]大荒驼铃东起古城墙 扬帆驶入万海千江\r\n[03:43.51]新大陆的征途之上 星条\r\n[03:49.69]-\r\n[03:50.33]我听见汽笛的嚣响 齿轮轻声咬合碰撞\r\n[03:56.37]我听见怒号猩红癫狂 推开苏维埃的窗\r\n[04:02.82]血染塞纳三色覆波旁 自由颂往南地北方\r\n[04:09.24]千年王朝终成过往 民声\r\n[04:14.88]-\r\n[04:15.88]我听见败落的彷徨 落笔终了史书一行\r\n[04:22.07]我听见白鸽啼自远方 泪雨欢歌洒沿巷\r\n[04:28.33]铁幕一语沙盘乾坤荡 破碎之身归入星芒\r\n[04:34.84]巨龙乘于五星翱翔 震天雄邦\r\n[04:44.94]（End.）', 1, '2026-08-19 14:28:37', '2026-08-19 14:28:37');
INSERT INTO `songs` VALUES (26, '他们的低语(剧情版)', 'ZERO、霜降', NULL, 487000, '/ZERO、霜降-他们的低语(剧情版).mp3', 19616868, 'audio/mpeg', '/covers/song_1788747750362_5105.jpg', '[00:04.29]中/国：那段历史 或许已经无人知晓\r\n[00:08.42]古/埃/及：法/老的时代终将过去\r\n[00:14.46]古/印/度：摩/柯/婆/罗/多的故事还会不会有人记得\r\n[00:20.80]古/希/腊：不要忘记月/神的后裔 不要忘记美/索/不/达/米/亚文明\r\n[00:27.88]阿波罗的诗琴 回溯悠长\r\n[00:35.66]日出之邦的风 奏响了争鸣八荒\r\n[00:42.13]槲寄生的沉语 咏叹末世的悲怆\r\n[00:48.60]东征呼马蹄扬 独霸一方\r\n[00:56.82]我听见庞贝的乐章 盲诗人的恸哭绝唱\r\n[01:03.60]我听见奥尔良的引吭 属于法兰西的光\r\n[01:10.00]大荒驼铃东起古城墙 扬帆驶入万海千江\r\n[01:16.48]新大陆的征途之上 星条飞扬\r\n[01:23.76]豆丁意/大/利：我记得他说的话 他答应过我 他会回来\r\n[01:30.90]神/圣/罗/马：意/大/利 我 我从公元九百年就开始喜欢你了\r\n[01:36.73]翡冷翠的花蕾 重生绽放\r\n[01:42.92]黑船来航锚声 再塑了明治东洋\r\n[01:49.26]日耳曼的战车烙上 复仇的悲凉\r\n[01:55.68]燃乌香破虚妄 惊涛骇浪\r\n[02:04.55]我听见汽笛的嚣响 齿轮轻声咬合碰撞\r\n[02:10.86]我听见怒号猩红癫狂 推开苏维埃的窗\r\n[02:17.19]血染塞纳三色覆波旁 自由颂往南地北方\r\n[02:23.60]千年王朝终成过往 民声嘹亮\r\n[02:31.10]青天下红旗冉冉心之所往\r\n[02:37.28]炮嚣鸣梦魇天降局势激荡\r\n[02:43.59]冬将军逆转天平的倾向\r\n[02:49.23]势如破竹霸王行动拓战场\r\n[02:54.24]中/国：啊！菊 你 你怎么\r\n[03:06.87]日/本：我从来没有把您当做过兄长 如此固步自封的你 也不值得我称之为老师了\r\n[03:15.25]德/国：我要变强 要成为第一强大的国家 就算是要掠夺！是要无止境的战斗！\r\n[03:24.94]意/大/利：路德不可以！要是再这样下去就会消失的 就像罗/马爷爷一样\r\n[03:32.70]日/本：你还当我是会躲在被子里哭的胆小鬼吗 在下可不会收手的\r\n[03:38.85]中/国：豺狼虎豹！就算是流尽最后一滴血 也不准你们再踏进我家一步\r\n[03:48.31]俄/罗/斯：莫/斯/科可不是你们想来就来想走就走的地方\r\n[03:55.53]英/国：休战吧弗朗西斯 现在 不是搞私人恩怨的时候了\r\n[04:00.25]法/国：能在是非面前这么识大体 真是不容易呀小少爷\r\n[04:07.02]美/国：呵 是吗 看来不得不由英雄出场了\r\n[04:14.88]香/港：老师！老师！你放开我！\r\n[04:19.58]澳/门：老师 救救我！\r\n[04:23.71]台/湾：先生！我不要！我不想走！\r\n[04:27.65]中/国：不 不要！放开他们！\r\n[04:31.10]美/国：我再也不会喝红茶了！\r\n[04:34.39]英/国：你说什么？！\r\n[04:35.96]英/国我怎么可能开枪啊！混蛋！\r\n[04:45.89]美/国：原本在我面前这么高大的人 现在居然这样弱小\r\n[04:50.79]德/国：我不像他！我不像他！我 我怎么会和哥哥一样\r\n[04:58.09]普/鲁/士：阿西他啊 是明明和我像的要死还不承认的固执家伙\r\n[05:08.22]俄/罗/斯：西伯利亚的冬天永远是孤独的白色，所以露西亚在家里种满了好看的向日葵，这样，大家就会回来了吧。\r\n[05:19.76]贞/德：我不畏惧死亡 我只是感到悲哀 天佑 法兰西\r\n[05:30.69]法/国：一世又一世 我只是想着奥尔良的少女啊 能平静而幸福地活下去\r\n[06:11.74]我听见庞贝的乐章 盲诗人的恸哭绝唱\r\n[06:17.45]我听见奥尔良的引吭 属于法兰西的光\r\n[06:23.82]大荒驼铃东起古城墙 扬帆驶入万海千江\r\n[06:30.32]新大陆的征途之上 星条\r\n[06:36.77]我听见汽笛的嚣响 齿轮轻声咬合碰撞\r\n[06:43.04]我听见怒号猩红癫狂 推开苏维埃的窗\r\n[06:49.31]血染塞纳三色覆波旁 自由颂往南地北方\r\n[06:55.88]千年王朝终成过往 民声\r\n[07:02.35]我听见败落的仿徨 落笔终了史书一行\r\n[07:08.61]我听见白鸽啼自远方 泪雨欢歌沿巷\r\n[07:15.08]铁幕一语沙盘乾坤荡 破碎之身归入星芒\r\n[07:21.39]巨龙乘于五星翱翔 震天雄邦\r\n[07:28.81]意/大/利：说起来，我有听罗马爷爷提起过你呢\r\n[07:32.26]中/国：啊..\r\n[07:33.23]罗/马/帝/国： 嗨塞里斯 别一副苦瓜脸 我可带了你这东方大地喝不到的佳酿来\r\n[07:41.81]中/国：别不打招呼就冲进别人家里来 大秦\r\n[07:45.46]罗/马/帝/国：哈哈哈嘴上这样说 其实一个人很寂寞吧\r\n[07:51.29]中/国：是啊 毕竟能谈起往事的故人 一个也不在了', 1, '2026-08-19 14:28:37', '2026-08-19 14:28:37');
INSERT INTO `songs` VALUES (27, '交换余生', '林俊杰', '交换余生', 276000, '/song_1788747691288_5857.flac', 34432109, 'audio/flac', '/covers/song_1788747750270_745.jpg', '[ti:交换余生]\n[ar:林俊杰]\n[al:交换余生]\n[by:dongmei_karakal]\n[00:00.00]交换余生 (No Turning Back) - 林俊杰 (JJ Lin)\n[00:01.32]词：易家扬\n[00:01.91]曲：林俊杰 JJ LIN\n[00:02.79]编曲 & 键盘 MUSIC ARRANGEMENT & KEYBOARDS：简道生Dawson Chien/蔡政勋 Andy Tsai\n[00:05.58]制作人 PRODUCER：林俊杰 JJ LIN\n[00:06.90]配唱制作 VOCAL PRODUCTION：林俊杰 JJ LIN\n[00:08.52]制作协力 PRODUCTION ASSISTANCE：黄冠龙 ALEX.D/周信廷 SHiN CHOU/蔡沛蓁\n[00:11.17]弦乐编写 STRINGS ARRANGEMENT：王韵筑 Liv Wang\n[00:12.78]弦乐 STRINGS：李琪弦乐团\n[00:13.96]吉他 GUITAR：黄冠龙 ALEX.D\n[00:14.99]低音吉他 BASS GUITAR：寗子达\n[00:16.31]鼓 DRUMS：Brendan Buckley\n[00:16.90]和声编写 BACKGROUND VOCAL ARRANGEMENT：林俊杰 JJ LIN\n[00:18.66]和声 BACKGROUND VOCALS：林俊杰 JJ LIN\n[00:19.99]录音室 RECORDING STUDIOS：JFJ SANCTUARY (Taipei)/THE JFJ LAB (Taipei)/Smile录音棚 (Beijing)/East West Studios (Los Angeles)\n[00:21.90]录音师 RECORDING ENGINEERS：林俊杰 JJ LIN/周信廷 SHiN CHOU/李杰汇/Wil Anspach\n[00:24.84]鼓组音频编辑 ADDITIONAL DRUMS ENGINEERING：Buckley Buckley\n[00:26.46]混音室 MIXING STUDIO：mixHaus (Encino, CA)\n[00:27.48]混音师 MIXING ENGINEER：Richard Furch\n[00:28.51]后期母带处理制作人 MASTERING PRODUCER：林俊杰 JJ LIN\n[00:30.87]后期母带处理录音室 MASTERING STUDIO：Bernie Grundman Mastering, LA\n[00:33.07]后期母带处理录音师 MASTERING ENGINEER：Mike Bozzi\n[00:34.99]孤单听雨的猫\n[00:37.35]往时间裂缝里看到了我\n[00:41.40]\n[00:42.71]雷电交加之外的另一些我\n[00:47.64]\n[00:50.07]乌云静止以后 跳进平行时空\n[00:56.29]那些我 旅行中的你我\n[01:00.25]回忆胡乱穿梭 坠落\n[01:07.44]\n[01:09.40]交换余生 是我 非我 苦与乐\n[01:16.87]阴天之后总有续命的晴空\n[01:23.09]\n[01:23.98]如果我们几经转折 结局一样不动\n[01:31.60]也才算无愧这分合\n[01:39.30]\n[02:05.54]定位心海的锚\n[02:07.87]让时间停顿的像慢动作\n[02:12.31]\n[02:13.19]你说命运很坏吧幸好有我\n[02:17.88]\n[02:20.17]如果没有以后 如果平行失控\n[02:26.81]那些我 不同人生的我\n[02:30.61]会以什么方式 哭过\n[02:37.80]交换余生 是我 非我 苦与乐\n[02:45.50]阴天之后总有续命的晴空\n[02:51.69]\n[02:52.75]如果我们几经转折 结局一样不动\n[03:00.38]也才算无愧这分合\n[03:07.77]云等风 人等梦 爱辗过时光等什么\n[03:13.75]\n[03:15.44]记不住 认不出 泪眼中谁一样脸红\n[03:21.48]\n[03:22.50]等你说 等我说 一等就是一个宇宙\n[03:28.48]\n[03:29.40]日升换月落 真爱换寂寞\n[03:36.10]\n[03:37.12]交换余生 也许 忘了 第几梦\n[03:44.20]那时我们身处第几号时空\n[03:51.17]\n[03:51.96]因为我们手心紧握 记忆也能紧扣\n[03:59.65]可不怕前方的虫洞\n[04:06.58]\n[04:07.31]爱是时间的古董', 2, '2026-09-07 10:21:31', '2026-09-07 10:21:31');
INSERT INTO `songs` VALUES (28, '消愁', '毛不易', '平凡的一天', 261000, '/song_1788747748359_6882.flac', 22873964, 'audio/flac', '/covers/song_1788747750280_9778.jpg', '[00:00.00]作词 : 毛不易\n[00:00.54]作曲 : 毛不易\n[00:01.09]编曲 : 赵兆\n[00:01.64]制作人 : 李健/赵兆\n[00:02.19]\n[00:31.62]当你走进这欢乐场\n[00:35.80]背上所有的梦与想\n[00:40.09]各色的脸上各色的妆\n[00:44.39]没人记得你的模样\n[00:47.92]\n[00:48.67]三巡酒过你在角落\n[00:52.94]固执的唱着苦涩的歌\n[00:57.19]听它在喧嚣里被淹没\n[01:01.14]你拿起酒杯对自己说\n[01:05.57]\n[01:07.82]一杯敬朝阳 一杯敬月光\n[01:11.84]唤醒我的向往 温柔了寒窗\n[01:15.59]于是可以不回头地逆风飞翔\n[01:20.42]不怕心头有雨 眼底有霜\n[01:23.99]\n[01:24.77]一杯敬故乡 一杯敬远方\n[01:28.97]守着我的善良 催着我成长\n[01:32.81]所以南北的路从此不再漫长\n[01:37.59]灵魂不再无处安放\n[01:44.06]\n[02:03.44]躁动不安的座上客\n[02:07.56]自以为是地表演着\n[02:12.09]伪装着 舞蹈着 疲惫着\n[02:15.64]你拿起酒杯对自己说\n[02:20.49]一杯敬朝阳 一杯敬月光\n[02:24.75]唤醒我的向往 温柔了寒窗\n[02:28.53]于是可以不回头地逆风飞翔\n[02:33.19]不怕心头有雨 眼底有霜\n[02:36.90]\n[02:37.50]一杯敬故乡 一杯敬远方\n[02:41.85]守着我的善良 催着我成长\n[02:45.61]所以南北的路从此不再漫长\n[02:50.44]灵魂不再无处安放\n[02:55.69]\n[03:01.23]一杯敬明天 一杯敬过往\n[03:05.44]支撑我的身体 厚重了肩膀\n[03:09.18]虽然从不相信所谓山高水长\n[03:14.00]人生苦短何必念念不忘\n[03:17.95]\n[03:18.36]一杯敬自由 一杯敬死亡\n[03:22.59]宽恕我的平凡 驱散了迷惘\n[03:26.36]好吧天亮之后总是潦草离场\n[03:31.13]清醒的人最荒唐\n[03:37.80]清醒的人最荒唐\n[03:47.99]\n[04:16.34]手风琴 : 许笑男\n[04:16.67]键盘 : 赵兆\n[04:17.01]吉他 : 薛峰\n[04:17.34]贝斯 : 韩阳\n[04:17.67]鼓 : 武勇恒\n[04:18.01]和声 : 梁古驰\n[04:18.34]弦乐 : 国际首席爱乐乐团International Philharmonic Orchestra\n[04:18.67]混音 : 李游\n[04:19.01]母带 : Joe LaPorta .（Sterling . NY）\n[04:19.34]录音棚 : 55TEC . Beijing\n[04:19.67]录音 : 李游 李杨\n[04:20.00]人声录音 : 李杨\n[04:20.34]人声编辑 : 李杨\n[04:20.67]录音助理 : 郭舒文 邢铜\n[04:21.00]制作发行 : 哇唧唧哇', 2, '2026-09-07 10:22:28', '2026-09-07 10:22:28');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户名，唯一',
  `password_hash` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '密码哈希（BCrypt）',
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '昵称',
  `avatar_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '头像URL',
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '状态：1正常 0禁用',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_username`(`username`) USING BTREE,
  INDEX `idx_status`(`status`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'demo', '$2a$10$dXJ3SW6G7P50lGmMkkmwe.20cQQubK3.HZWzG3YB1tlRy.fqvM/BG', 'Alice', NULL, 1, '2026-08-18 22:15:36', '2026-08-18 23:40:17');
INSERT INTO `users` VALUES (2, 'admin', '$2a$10$dXJ3SW6G7P50lGmMkkmwe.20cQQubK3.HZWzG3YB1tlRy.fqvM/BG', 'admin', NULL, 1, '2026-08-18 22:15:36', '2026-08-18 23:58:02');
INSERT INTO `users` VALUES (3, 'test', '$2a$10$1jkLZ5DyxjhJMgM/5xPYJukqvON7gqsSjNpUgli562ZrkXG4jVk4O', 'test', NULL, 1, '2026-08-19 02:15:34', '2026-08-19 02:15:34');

SET FOREIGN_KEY_CHECKS = 1;
