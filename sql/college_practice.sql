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

 Date: 05/04/2021 22:47:35
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
INSERT INTO `sessions` VALUES ('8cUDDIFHI-j6KrN6AFFd-7FsY4iW24KI', 1617712461, '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2021-04-06T12:34:20.904Z\",\"httpOnly\":true,\"path\":\"/\"},\"token\":\"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzeGdsX3VzZXJfaWQiOjEsInN4Z2xfdXNlcl9hY2NvdW50IjoxMjM0NTYsInN4Z2xfdXNlcl9wYXNzd29yZCI6IjAyNDFlNTNmY2I3ZTZmZDc5NGJiODYwYTJhZGI2YjgxIiwiaWF0IjoxNjE3NjI1NjE4fQ.H3-RQQqLjPh4YVvIjprvI7cPItTC8cDFvv6HW3Pm_oI\"}');

-- ----------------------------
-- Table structure for sxgl_company
-- ----------------------------
DROP TABLE IF EXISTS `sxgl_company`;
CREATE TABLE `sxgl_company`  (
  `sxgl_company_id` int(11) NOT NULL AUTO_INCREMENT,
  `sxgl_company_name` varchar(255) CHARACTER SET gbk COLLATE gbk_bin NULL DEFAULT NULL COMMENT '单位地址',
  `sxgl_company_address` varchar(255) CHARACTER SET gbk COLLATE gbk_bin NULL DEFAULT NULL,
  `sxgl_company_type` varchar(255) CHARACTER SET gbk COLLATE gbk_bin NULL DEFAULT NULL COMMENT '公司类型',
  `sxgl_connect_person` varchar(255) CHARACTER SET gbk COLLATE gbk_bin NULL DEFAULT NULL COMMENT '联系人',
  `sxgl_company_phone` varchar(255) CHARACTER SET gbk COLLATE gbk_bin NULL DEFAULT NULL COMMENT '联系电话',
  `sxgl_company_industry` varchar(255) CHARACTER SET gbk COLLATE gbk_bin NULL DEFAULT NULL COMMENT '所属行业',
  PRIMARY KEY (`sxgl_company_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = gbk COLLATE = gbk_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sxgl_company
-- ----------------------------
INSERT INTO `sxgl_company` VALUES (1, '软通动力', '北京市海淀区西北旺东路10号院东区16号楼5层502 ', '国有企业', '刘天文', '15678276655', 'IT行业');
INSERT INTO `sxgl_company` VALUES (5, '良品铺子', '武汉市江汉区发展大道164号', '合资企业', '王明', '15623226653', '批发和零售业');
INSERT INTO `sxgl_company` VALUES (6, '中国建筑股份有限公司', '中国北京市海淀区三里河路15号', '国有企业', '周乃翔', '15623226653', '建筑业');
INSERT INTO `sxgl_company` VALUES (7, '中国建筑股份有限公司', '中国北京市海淀区三里河路15号', '国有企业', '周乃翔', '15623226653', '建筑业');
INSERT INTO `sxgl_company` VALUES (8, '中国建筑股份有限公司', '中国北京市海淀区三里河路15号', '国有企业', '周乃翔', '15623226653', '建筑业');
INSERT INTO `sxgl_company` VALUES (9, '中国建筑股份有限公司', '中国北京市海淀区三里河路15号', '国有企业', '周乃翔', '15623226653', '建筑业');
INSERT INTO `sxgl_company` VALUES (12, '中国建筑股份有限公司', NULL, '国有企业', '周乃翔', '15623226653', 'IT行业');

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
  `sxgl_company_tutor_edu` varchar(255) CHARACTER SET gbk COLLATE gbk_bin NULL DEFAULT NULL COMMENT '学历',
  PRIMARY KEY (`sxgl_company_tutor_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = gbk COLLATE = gbk_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sxgl_company_tutor
-- ----------------------------
INSERT INTO `sxgl_company_tutor` VALUES (2011237, '白晓', '15623226533', 1, '产品经理', '本科');
INSERT INTO `sxgl_company_tutor` VALUES (1503290366, '我都发誓', '455641', 5, '大', '专科');

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
  `sxgl_file` varchar(255) CHARACTER SET gbk COLLATE gbk_bin NULL DEFAULT NULL COMMENT '附件',
  `sxgl_year` varchar(255) CHARACTER SET gbk COLLATE gbk_bin NULL DEFAULT NULL COMMENT '实习学年',
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
  `sxgl_job_id` int(11) NOT NULL AUTO_INCREMENT,
  `sxgl_job_name` varchar(255) CHARACTER SET gbk COLLATE gbk_bin NULL DEFAULT NULL,
  `sxgl_company_id` int(11) NULL DEFAULT NULL,
  `sxgl_job_type` varchar(255) CHARACTER SET gbk COLLATE gbk_bin NULL DEFAULT NULL COMMENT '岗位类型',
  PRIMARY KEY (`sxgl_job_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = gbk COLLATE = gbk_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sxgl_job
-- ----------------------------
INSERT INTO `sxgl_job` VALUES (5, '前端', 1, '管理岗位');

-- ----------------------------
-- Table structure for sxgl_plan
-- ----------------------------
DROP TABLE IF EXISTS `sxgl_plan`;
CREATE TABLE `sxgl_plan`  (
  `sxgl_plan_id` int(11) NOT NULL AUTO_INCREMENT,
  `sxgl_plan_name` varchar(255) CHARACTER SET gbk COLLATE gbk_bin NULL DEFAULT NULL,
  `sxgl_department` varchar(255) CHARACTER SET gbk COLLATE gbk_bin NULL DEFAULT NULL,
  `sxgl_year` varchar(255) CHARACTER SET gbk COLLATE gbk_bin NULL DEFAULT NULL COMMENT '实习学年',
  `sxgl_grade` varchar(255) CHARACTER SET gbk COLLATE gbk_bin NULL DEFAULT NULL COMMENT '实习年级',
  `sxgl_createtime` datetime(0) NULL DEFAULT NULL,
  `sxgl_endtime` datetime(0) NULL DEFAULT NULL,
  `sxgl_type` varchar(255) CHARACTER SET gbk COLLATE gbk_bin NULL DEFAULT NULL COMMENT '实习类型',
  PRIMARY KEY (`sxgl_plan_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = gbk COLLATE = gbk_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sxgl_plan
-- ----------------------------
INSERT INTO `sxgl_plan` VALUES (1, '2021计算机学院实习计划', '计算机学院', '2020-2021上学期', '2017级', '2021-04-05 00:00:00', '2021-05-21 00:00:00', '毕业实习');

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
  `sxgl_student_name` varchar(255) CHARACTER SET gbk COLLATE gbk_bin NULL DEFAULT NULL,
  `sxgl_student_college` varchar(255) CHARACTER SET gbk COLLATE gbk_bin NULL DEFAULT NULL COMMENT '学生学院',
  `sxgl_student_major` varchar(255) CHARACTER SET gbk COLLATE gbk_bin NULL DEFAULT NULL COMMENT '学生专业\r\n',
  `sxgl_student_class` varchar(255) CHARACTER SET gbk COLLATE gbk_bin NULL DEFAULT NULL COMMENT '学生班级',
  `sxgl_student_phone` varchar(255) CHARACTER SET gbk COLLATE gbk_bin NULL DEFAULT NULL,
  `sxgl_student_score` varchar(255) CHARACTER SET gbk COLLATE gbk_bin NULL DEFAULT NULL,
  `sxgl_student_remark` varchar(255) CHARACTER SET gbk COLLATE gbk_bin NULL DEFAULT NULL COMMENT '学生评语',
  `sxgl_student_Report_id` varchar(255) CHARACTER SET gbk COLLATE gbk_bin NULL DEFAULT NULL COMMENT '实习报告',
  `sxgl_student_intention_id` varchar(255) CHARACTER SET gbk COLLATE gbk_bin NULL DEFAULT NULL COMMENT '实习意向',
  `sxgl_student_summary_id` varchar(255) CHARACTER SET gbk COLLATE gbk_bin NULL DEFAULT NULL COMMENT '实习总结',
  `sxgl_student_weekReport_id` varchar(255) CHARACTER SET gbk COLLATE gbk_bin NULL DEFAULT NULL COMMENT '实习周报',
  `sxgl_company_id` int(11) NULL DEFAULT NULL COMMENT '实习单位',
  `sxgl_teacher_id` int(11) NULL DEFAULT NULL COMMENT '校内指导教师',
  `sxgl_company_tutor_id` int(11) NULL DEFAULT NULL COMMENT '校外实践导师',
  `sxgl_select` int(11) NULL DEFAULT 0 COMMENT '实习方式',
  PRIMARY KEY (`sxgl_student_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = gbk COLLATE = gbk_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sxgl_student
-- ----------------------------
INSERT INTO `sxgl_student` VALUES (2017001, '小明', '计算机学院', '计算机科学与技术', '计科1703', '15634347676', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 2011237, 0);
INSERT INTO `sxgl_student` VALUES (2017002, '王明', '计算机学院', '计算机科学与技术', '计科1703', '15667678989', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 2011237, 0);
INSERT INTO `sxgl_student` VALUES (2017003, '李艳', '计算机学院', '计算机科学与技术', '计科1703', '16778788989', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 2011237, 0);
INSERT INTO `sxgl_student` VALUES (2017004, '王一', '计算机学院', '计算机科学与技术', '计科1703', '17834346767', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 2011237, 0);
INSERT INTO `sxgl_student` VALUES (2017005, '王一', '计算机学院', '计算机科学与技术', '计科1703', '17834346767', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 2011237, 0);
INSERT INTO `sxgl_student` VALUES (2017006, '王一', '计算机学院', '计算机科学与技术', '计科1703', '17834346767', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 2011237, 0);
INSERT INTO `sxgl_student` VALUES (2017007, '王一', '计算机学院', '计算机科学与技术', '计科1703', '17834346767', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 2011237, 0);
INSERT INTO `sxgl_student` VALUES (2017008, '王一', '计算机学院', '计算机科学与技术', '计科1703', '17834346767', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 2011237, 0);
INSERT INTO `sxgl_student` VALUES (2017009, '王一', '计算机学院', '计算机科学与技术', '计科1703', '17834346767', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 2011237, 0);
INSERT INTO `sxgl_student` VALUES (2017010, '王一', '计算机学院', '计算机科学与技术', '计科1703', '17834346767', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 2011237, 0);
INSERT INTO `sxgl_student` VALUES (2017011, '王一', '计算机学院', '计算机科学与技术', '计科1703', '17834346767', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 2011237, 0);
INSERT INTO `sxgl_student` VALUES (2017012, '王一', '计算机学院', '计算机科学与技术', '计科1703', '17834346767', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 2011237, 0);

-- ----------------------------
-- Table structure for sxgl_summary
-- ----------------------------
DROP TABLE IF EXISTS `sxgl_summary`;
CREATE TABLE `sxgl_summary`  (
  `sxgl_summary_id` int(11) NOT NULL AUTO_INCREMENT,
  `sxgl_student_id` int(11) NULL DEFAULT NULL,
  `sxgl_summary_title` varchar(255) CHARACTER SET gbk COLLATE gbk_bin NOT NULL,
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
  PRIMARY KEY (`sxgl_teacher_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = gbk COLLATE = gbk_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sxgl_teacher
-- ----------------------------
INSERT INTO `sxgl_teacher` VALUES (1201700005, '王五', '计算机科学与技术学院', '15623226565');

-- ----------------------------
-- Table structure for sxgl_user
-- ----------------------------
DROP TABLE IF EXISTS `sxgl_user`;
CREATE TABLE `sxgl_user`  (
  `sxgl_user_id` int(11) NOT NULL AUTO_INCREMENT,
  `sxgl_user_account` int(12) NOT NULL,
  `sxgl_user_name` varchar(255) CHARACTER SET gbk COLLATE gbk_bin NULL DEFAULT NULL,
  `sxgl_user_password` varchar(255) CHARACTER SET gbk COLLATE gbk_bin NOT NULL,
  `sxgl_user_img` varchar(255) CHARACTER SET gbk COLLATE gbk_bin NULL DEFAULT NULL,
  `sxgl_role_id` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`sxgl_user_id`, `sxgl_user_account`) USING BTREE,
  UNIQUE INDEX `zgl_user_account`(`sxgl_user_account`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 151 CHARACTER SET = gbk COLLATE = gbk_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sxgl_user
-- ----------------------------
INSERT INTO `sxgl_user` VALUES (1, 123456, '管理员', '0241e53fcb7e6fd794bb860a2adb6b81', NULL, 1);
INSERT INTO `sxgl_user` VALUES (4, 901211, '副管理员', '0241e53fcb7e6fd794bb860a2adb6b81', NULL, 1);
INSERT INTO `sxgl_user` VALUES (7, 1101700001, '黄老师', '0241e53fcb7e6fd794bb860a2adb6b81', NULL, 3);
INSERT INTO `sxgl_user` VALUES (8, 1101700002, '王老师', '0241e53fcb7e6fd794bb860a2adb6b81', NULL, 3);
INSERT INTO `sxgl_user` VALUES (9, 1201700003, '李老师', '0241e53fcb7e6fd794bb860a2adb6b81', NULL, 4);
INSERT INTO `sxgl_user` VALUES (10, 1201700004, '左老师', '0241e53fcb7e6fd794bb860a2adb6b81', NULL, 4);
INSERT INTO `sxgl_user` VALUES (64, 1503290366, '我都发誓', '0241e53fcb7e6fd794bb860a2adb6b81', NULL, 4);
INSERT INTO `sxgl_user` VALUES (138, 1201700005, '王五', '0241e53fcb7e6fd794bb860a2adb6b81', NULL, 3);
INSERT INTO `sxgl_user` VALUES (139, 2017001, '小明', '0241e53fcb7e6fd794bb860a2adb6b81', NULL, 2);
INSERT INTO `sxgl_user` VALUES (140, 2017002, '王明', '0241e53fcb7e6fd794bb860a2adb6b81', NULL, 2);
INSERT INTO `sxgl_user` VALUES (141, 2017003, '李艳', '0241e53fcb7e6fd794bb860a2adb6b81', NULL, 2);
INSERT INTO `sxgl_user` VALUES (142, 2017004, '王一', '0241e53fcb7e6fd794bb860a2adb6b81', NULL, 2);
INSERT INTO `sxgl_user` VALUES (143, 2017006, '王一', '0241e53fcb7e6fd794bb860a2adb6b81', NULL, 2);
INSERT INTO `sxgl_user` VALUES (144, 2017007, '王一', '0241e53fcb7e6fd794bb860a2adb6b81', NULL, 2);
INSERT INTO `sxgl_user` VALUES (145, 2017008, '王一', '0241e53fcb7e6fd794bb860a2adb6b81', NULL, 2);
INSERT INTO `sxgl_user` VALUES (146, 2017009, '王一', '0241e53fcb7e6fd794bb860a2adb6b81', NULL, 2);
INSERT INTO `sxgl_user` VALUES (147, 2017010, '王一', '0241e53fcb7e6fd794bb860a2adb6b81', NULL, 2);
INSERT INTO `sxgl_user` VALUES (148, 2017005, '王一', '0241e53fcb7e6fd794bb860a2adb6b81', NULL, 2);
INSERT INTO `sxgl_user` VALUES (149, 2017011, '王一', '0241e53fcb7e6fd794bb860a2adb6b81', NULL, 2);
INSERT INTO `sxgl_user` VALUES (150, 2017012, '王一', '0241e53fcb7e6fd794bb860a2adb6b81', NULL, 2);

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

-- ----------------------------
-- Table structure for upload
-- ----------------------------
DROP TABLE IF EXISTS `upload`;
CREATE TABLE `upload`  (
  `uploadfile` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of upload
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
