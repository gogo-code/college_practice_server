/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3305
 Source Server Type    : MySQL
 Source Server Version : 50733
 Source Host           : localhost:3305
 Source Schema         : college_practice

 Target Server Type    : MySQL
 Target Server Version : 50733
 File Encoding         : 65001

 Date: 21/02/2021 22:46:28
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sessions
-- ----------------------------
DROP TABLE IF EXISTS `sessions`;
CREATE TABLE `sessions`  (
  `session_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `expires` int(11) UNSIGNED NOT NULL,
  `data` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
  PRIMARY KEY (`session_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = gbk COLLATE = gbk_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sessions
-- ----------------------------
INSERT INTO `sessions` VALUES ('9lnf_p1gquWtnPZ3XWJS_zpTy0i5Yd4C', 1613967286, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2021-02-22T04:14:46.384Z\",\"httpOnly\":true,\"path\":\"/\"},\"token\":\"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzeGdsX3VzZXJfaWQiOjEsInN4Z2xfdXNlcl9hY2NvdW50IjoiYWRtaW4iLCJzeGdsX3VzZXJfcGFzc3dvcmQiOiIwMjQxZTUzZmNiN2U2ZmQ3OTRiYjg2MGEyYWRiNmI4MSIsImlhdCI6MTYxMzg4MDg4Nn0.wG0kwoBTTSFi9uecovGeCw3s6cHxqF20auykMkmdUOI\"}');

-- ----------------------------
-- Table structure for sxgl_company
-- ----------------------------
DROP TABLE IF EXISTS `sxgl_company`;
CREATE TABLE `sxgl_company`  (
  `sxgl_company_id` int(11) NOT NULL AUTO_INCREMENT,
  `sxgl_company_name` varchar(255) CHARACTER SET gbk COLLATE gbk_bin NULL DEFAULT NULL COMMENT '单位地址',
  `sxgl_company_address` varchar(255) CHARACTER SET gbk COLLATE gbk_bin NULL DEFAULT NULL,
  `sxgl_company_type` varchar(255) CHARACTER SET gbk COLLATE gbk_bin NULL DEFAULT NULL COMMENT '单位性质:国企私企',
  `sxgl_connect_person` varchar(255) CHARACTER SET gbk COLLATE gbk_bin NULL DEFAULT NULL COMMENT '联系人',
  `sxgl_phone` varchar(255) CHARACTER SET gbk COLLATE gbk_bin NULL DEFAULT NULL COMMENT '联系电话',
  `sxgl_detail` varchar(255) CHARACTER SET gbk COLLATE gbk_bin NULL DEFAULT NULL COMMENT '单位详情',
  PRIMARY KEY (`sxgl_company_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = gbk COLLATE = gbk_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sxgl_company
-- ----------------------------

-- ----------------------------
-- Table structure for sxgl_company_tutor
-- ----------------------------
DROP TABLE IF EXISTS `sxgl_company_tutor`;
CREATE TABLE `sxgl_company_tutor`  (
  `sxgl_company_tutor_id` int(11) NOT NULL,
  `sxgl_company_tutor_name` varchar(255) CHARACTER SET gbk COLLATE gbk_bin NULL DEFAULT NULL,
  `sxgl_company_tutor_phone` varchar(255) CHARACTER SET gbk COLLATE gbk_bin NULL DEFAULT NULL,
  `sxgl_company_id` int(11) NULL DEFAULT NULL,
  `sxgl_company_tutor_job` varchar(255) CHARACTER SET gbk COLLATE gbk_bin NULL DEFAULT NULL,
  `sxgl_company_tutor_img` varchar(255) CHARACTER SET gbk COLLATE gbk_bin NULL DEFAULT NULL,
  PRIMARY KEY (`sxgl_company_tutor_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = gbk COLLATE = gbk_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sxgl_company_tutor
-- ----------------------------

-- ----------------------------
-- Table structure for sxgl_intention
-- ----------------------------
DROP TABLE IF EXISTS `sxgl_intention`;
CREATE TABLE `sxgl_intention`  (
  `sxgl_intention_id` int(11) NOT NULL AUTO_INCREMENT,
  `sxgl_intention_position` varchar(255) CHARACTER SET gbk COLLATE gbk_bin NULL DEFAULT NULL COMMENT '实习岗位',
  `sxgl_student_id` int(11) NULL DEFAULT NULL,
  `sxgl_intention_type` varchar(255) CHARACTER SET gbk COLLATE gbk_bin NULL DEFAULT NULL COMMENT '实习类型',
  `sxgl_comp_name` varchar(255) CHARACTER SET gbk COLLATE gbk_bin NULL DEFAULT NULL COMMENT '实习公司名',
  `sxgl_comp_contact` varchar(255) CHARACTER SET gbk COLLATE gbk_bin NULL DEFAULT NULL COMMENT '实习公司联系人',
  `sxgl_comp_phone` varchar(255) CHARACTER SET gbk COLLATE gbk_bin NULL DEFAULT NULL COMMENT '实习公司联系人电话',
  `sxgl_comp_address` varchar(255) CHARACTER SET gbk COLLATE gbk_bin NOT NULL COMMENT '实习公司联系地址',
  `sxgl_arrange` varchar(255) CHARACTER SET gbk COLLATE gbk_bin NULL DEFAULT NULL COMMENT '安排方式',
  PRIMARY KEY (`sxgl_intention_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = gbk COLLATE = gbk_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sxgl_intention
-- ----------------------------

-- ----------------------------
-- Table structure for sxgl_job
-- ----------------------------
DROP TABLE IF EXISTS `sxgl_job`;
CREATE TABLE `sxgl_job`  (
  `sxgl_job_id` int(11) NOT NULL,
  `sxgl_job_name` varchar(255) CHARACTER SET gbk COLLATE gbk_bin NULL DEFAULT NULL,
  `sxgl_company_id` int(11) NULL DEFAULT NULL,
  `sxgl_job_type` varchar(255) CHARACTER SET gbk COLLATE gbk_bin NULL DEFAULT NULL COMMENT '岗位类型',
  PRIMARY KEY (`sxgl_job_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = gbk COLLATE = gbk_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sxgl_job
-- ----------------------------

-- ----------------------------
-- Table structure for sxgl_plan
-- ----------------------------
DROP TABLE IF EXISTS `sxgl_plan`;
CREATE TABLE `sxgl_plan`  (
  `sxgl_plan_id` int(11) NOT NULL,
  `sxgl_plan_name` varchar(255) CHARACTER SET gbk COLLATE gbk_bin NULL DEFAULT NULL,
  `sxgl_department` varchar(255) CHARACTER SET gbk COLLATE gbk_bin NULL DEFAULT NULL,
  `sxgl_year` varchar(255) CHARACTER SET gbk COLLATE gbk_bin NULL DEFAULT NULL COMMENT '实习学年',
  `sxgl_grade` varchar(255) CHARACTER SET gbk COLLATE gbk_bin NULL DEFAULT NULL COMMENT '实习年级',
  `sxgl_createtime` datetime(0) NULL DEFAULT NULL,
  `sxgl_endtime` datetime(0) NULL DEFAULT NULL,
  `sxgl_type` varchar(255) CHARACTER SET gbk COLLATE gbk_bin NULL DEFAULT NULL COMMENT '实习类型',
  PRIMARY KEY (`sxgl_plan_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = gbk COLLATE = gbk_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sxgl_plan
-- ----------------------------

-- ----------------------------
-- Table structure for sxgl_role
-- ----------------------------
DROP TABLE IF EXISTS `sxgl_role`;
CREATE TABLE `sxgl_role`  (
  `sxgl_role_id` int(11) NOT NULL,
  `sxgl_role_name` varchar(255) CHARACTER SET gbk COLLATE gbk_bin NULL DEFAULT NULL,
  PRIMARY KEY (`sxgl_role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = gbk COLLATE = gbk_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sxgl_role
-- ----------------------------
INSERT INTO `sxgl_role` VALUES (0, '普通人员');
INSERT INTO `sxgl_role` VALUES (1, '管理员');
INSERT INTO `sxgl_role` VALUES (2, '学生');
INSERT INTO `sxgl_role` VALUES (3, '校内指导教师');
INSERT INTO `sxgl_role` VALUES (4, '校外实践教师');

-- ----------------------------
-- Table structure for sxgl_student
-- ----------------------------
DROP TABLE IF EXISTS `sxgl_student`;
CREATE TABLE `sxgl_student`  (
  `sxgl_student_id` int(11) NOT NULL COMMENT '学生学号',
  `sxgl_student_name` varchar(255) CHARACTER SET gbk COLLATE gbk_bin NOT NULL,
  `sxgl_student_college` varchar(255) CHARACTER SET gbk COLLATE gbk_bin NOT NULL COMMENT '学生学院',
  `sxgl_student_major` varchar(255) CHARACTER SET gbk COLLATE gbk_bin NOT NULL COMMENT '学生专业\r\n',
  `sxgl_student_class` varchar(255) CHARACTER SET gbk COLLATE gbk_bin NOT NULL COMMENT '学生班级',
  `sxgl_student_phone` varchar(255) CHARACTER SET gbk COLLATE gbk_bin NOT NULL,
  `sxgl_student_score` varchar(255) CHARACTER SET gbk COLLATE gbk_bin NULL DEFAULT NULL,
  `sxgl_student_remark` varchar(255) CHARACTER SET gbk COLLATE gbk_bin NULL DEFAULT NULL COMMENT '学生评语',
  `sxgl_student_Report_id` varchar(255) CHARACTER SET gbk COLLATE gbk_bin NULL DEFAULT NULL COMMENT '实习报告',
  `sxgl_student_intention_id` varchar(255) CHARACTER SET gbk COLLATE gbk_bin NULL DEFAULT NULL COMMENT '实习意向',
  `sxgl_student_summary_id` varchar(255) CHARACTER SET gbk COLLATE gbk_bin NULL DEFAULT NULL COMMENT '实习总结',
  `sxgl_student_weekReport_id` varchar(255) CHARACTER SET gbk COLLATE gbk_bin NULL DEFAULT NULL COMMENT '实习周报',
  PRIMARY KEY (`sxgl_student_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = gbk COLLATE = gbk_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sxgl_student
-- ----------------------------
INSERT INTO `sxgl_student` VALUES (2017001, '小明', '计算机学院', '计算机科学与技术', '计科1702', '15634347676', '1', '1', '1', '1', '1', '1');

-- ----------------------------
-- Table structure for sxgl_summary
-- ----------------------------
DROP TABLE IF EXISTS `sxgl_summary`;
CREATE TABLE `sxgl_summary`  (
  `sxgl_summary_id` int(11) NOT NULL AUTO_INCREMENT,
  `sxgl_student_id` int(11) NULL DEFAULT NULL,
  `sxgl_summary_title` varchar(255) CHARACTER SET gbk COLLATE gbk_bin NULL DEFAULT NULL,
  `sxgl_summary_content` varchar(255) CHARACTER SET gbk COLLATE gbk_bin NULL DEFAULT NULL,
  PRIMARY KEY (`sxgl_summary_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = gbk COLLATE = gbk_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sxgl_summary
-- ----------------------------

-- ----------------------------
-- Table structure for sxgl_teacher
-- ----------------------------
DROP TABLE IF EXISTS `sxgl_teacher`;
CREATE TABLE `sxgl_teacher`  (
  `sxgl_teacher_id` int(11) NOT NULL COMMENT '教师工号',
  `sxgl_name` varchar(255) CHARACTER SET gbk COLLATE gbk_bin NULL DEFAULT NULL,
  `sxgl_department` varchar(255) CHARACTER SET gbk COLLATE gbk_bin NULL DEFAULT NULL COMMENT '所属学院',
  `sxgl_phone` varchar(255) CHARACTER SET gbk COLLATE gbk_bin NULL DEFAULT NULL,
  `sxgl_img` varchar(255) CHARACTER SET gbk COLLATE gbk_bin NULL DEFAULT NULL,
  PRIMARY KEY (`sxgl_teacher_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = gbk COLLATE = gbk_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sxgl_teacher
-- ----------------------------

-- ----------------------------
-- Table structure for sxgl_user
-- ----------------------------
DROP TABLE IF EXISTS `sxgl_user`;
CREATE TABLE `sxgl_user`  (
  `sxgl_user_id` int(11) NOT NULL AUTO_INCREMENT,
  `sxgl_user_account` varchar(255) CHARACTER SET gbk COLLATE gbk_bin NOT NULL,
  `sxgl_user_name` varchar(255) CHARACTER SET gbk COLLATE gbk_bin NULL DEFAULT NULL,
  `sxgl_user_password` varchar(255) CHARACTER SET gbk COLLATE gbk_bin NOT NULL,
  `sxgl_user_img` varchar(255) CHARACTER SET gbk COLLATE gbk_bin NULL DEFAULT NULL,
  `sxgl_role_id` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`sxgl_user_id`, `sxgl_user_account`) USING BTREE,
  UNIQUE INDEX `zgl_user_account`(`sxgl_user_account`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = gbk COLLATE = gbk_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sxgl_user
-- ----------------------------
INSERT INTO `sxgl_user` VALUES (1, 'admin', '管理员', '0241e53fcb7e6fd794bb860a2adb6b81', NULL, 1);
INSERT INTO `sxgl_user` VALUES (4, 'admin1', '副管理员', '0241e53fcb7e6fd794bb860a2adb6b81', NULL, 1);
INSERT INTO `sxgl_user` VALUES (5, '2017001', '小明', '0241e53fcb7e6fd794bb860a2adb6b81', NULL, 2);
INSERT INTO `sxgl_user` VALUES (6, '2017002', '小红', '0241e53fcb7e6fd794bb860a2adb6b81', NULL, 2);
INSERT INTO `sxgl_user` VALUES (7, '201700001', '黄老师', '0241e53fcb7e6fd794bb860a2adb6b81', NULL, 3);
INSERT INTO `sxgl_user` VALUES (8, '201700002', '王老师', '0241e53fcb7e6fd794bb860a2adb6b81', NULL, 3);
INSERT INTO `sxgl_user` VALUES (9, '201700003', '李老师', '0241e53fcb7e6fd794bb860a2adb6b81', NULL, 4);
INSERT INTO `sxgl_user` VALUES (10, '201700004', '左老师', '0241e53fcb7e6fd794bb860a2adb6b81', NULL, 4);

-- ----------------------------
-- Table structure for sxgl_weekreport
-- ----------------------------
DROP TABLE IF EXISTS `sxgl_weekreport`;
CREATE TABLE `sxgl_weekreport`  (
  `sxgl_weekReport_id` int(11) NOT NULL AUTO_INCREMENT,
  `sxgl_student_id` int(11) NOT NULL,
  `sxgl_title` varchar(255) CHARACTER SET gbk COLLATE gbk_bin NULL DEFAULT NULL COMMENT '周报标题',
  `sxgl_content` varchar(255) CHARACTER SET gbk COLLATE gbk_bin NULL DEFAULT NULL COMMENT '周报内容',
  PRIMARY KEY (`sxgl_weekReport_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = gbk COLLATE = gbk_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sxgl_weekreport
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
