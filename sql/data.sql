/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50723
Source Host           : localhost:3306
Source Database       : data

Target Server Type    : MYSQL
Target Server Version : 50723
File Encoding         : 65001

Date: 2018-12-18 17:12:54
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `BLOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `SCHED_NAME` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `CALENDAR_NAME` varchar(200) NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`CALENDAR_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `CRON_EXPRESSION` varchar(120) NOT NULL,
  `TIME_ZONE_ID` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------
INSERT INTO `qrtz_cron_triggers` VALUES ('DefaultQuartzScheduler', 'say hello trigger', 'cron trigger', '0/10 * * * * ?', 'Asia/Shanghai');

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `ENTRY_ID` varchar(95) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `FIRED_TIME` bigint(13) NOT NULL,
  `SCHED_TIME` bigint(13) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `STATE` varchar(16) NOT NULL,
  `JOB_NAME` varchar(200) DEFAULT NULL,
  `JOB_GROUP` varchar(200) DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`ENTRY_ID`),
  KEY `IDX_QRTZ_FT_TRIG_INST_NAME` (`SCHED_NAME`,`INSTANCE_NAME`),
  KEY `IDX_QRTZ_FT_INST_JOB_REQ_RCVRY` (`SCHED_NAME`,`INSTANCE_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_QRTZ_FT_J_G` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_FT_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_FT_T_G` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_FT_TG` (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------
INSERT INTO `qrtz_fired_triggers` VALUES ('DefaultQuartzScheduler', 'NON_CLUSTERED1543388714047', 'say hello trigger', 'cron trigger', 'NON_CLUSTERED', '1543389740054', '1543389750000', '5', 'ACQUIRED', null, null, '0', '0');

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) NOT NULL,
  `IS_DURABLE` varchar(1) NOT NULL,
  `IS_NONCONCURRENT` varchar(1) NOT NULL,
  `IS_UPDATE_DATA` varchar(1) NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) NOT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_J_REQ_RECOVERY` (`SCHED_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_QRTZ_J_GRP` (`SCHED_NAME`,`JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------
INSERT INTO `qrtz_job_details` VALUES ('DefaultQuartzScheduler', 'hello job01_HelloWorld', 'normal job01_HelloWorld', 'this is my first job01_HelloWorld ', 'com.ws.quartzdemo1001.job01_HelloWorld.HelloJob', '0', '0', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787000737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F40000000000010770800000010000000007800);
INSERT INTO `qrtz_job_details` VALUES ('DefaultQuartzScheduler', 'jdbcJob_01', 'jdbcGroup_01', null, 'com.ws.quartzdemo1001.job02_JDBC_HelloWorld.MyJobForJDBCQuartz', '1', '0', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787000737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F40000000000010770800000010000000007800);

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `LOCK_NAME` varchar(40) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`LOCK_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
INSERT INTO `qrtz_locks` VALUES ('RenrenScheduler', 'STATE_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('RenrenScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `LAST_CHECKIN_TIME` bigint(13) NOT NULL,
  `CHECKIN_INTERVAL` bigint(13) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`INSTANCE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
INSERT INTO `qrtz_scheduler_state` VALUES ('jieyueScheduler', 'YangZhou-PC1545123839502', '1545124117226', '15000');
INSERT INTO `qrtz_scheduler_state` VALUES ('RenrenScheduler', 'JY-2017101315431541036042154', '1541056837995', '15000');

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `REPEAT_COUNT` bigint(7) NOT NULL,
  `REPEAT_INTERVAL` bigint(12) NOT NULL,
  `TIMES_TRIGGERED` bigint(10) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `STR_PROP_1` varchar(512) DEFAULT NULL,
  `STR_PROP_2` varchar(512) DEFAULT NULL,
  `STR_PROP_3` varchar(512) DEFAULT NULL,
  `INT_PROP_1` int(11) DEFAULT NULL,
  `INT_PROP_2` int(11) DEFAULT NULL,
  `LONG_PROP_1` bigint(20) DEFAULT NULL,
  `LONG_PROP_2` bigint(20) DEFAULT NULL,
  `DEC_PROP_1` decimal(13,4) DEFAULT NULL,
  `DEC_PROP_2` decimal(13,4) DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) NOT NULL,
  `TRIGGER_TYPE` varchar(8) NOT NULL,
  `START_TIME` bigint(13) NOT NULL,
  `END_TIME` bigint(13) DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) DEFAULT NULL,
  `MISFIRE_INSTR` smallint(2) DEFAULT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_J` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_T_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_T_C` (`SCHED_NAME`,`CALENDAR_NAME`),
  KEY `IDX_QRTZ_T_G` (`SCHED_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_STATE` (`SCHED_NAME`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_N_STATE` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_N_G_STATE` (`SCHED_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_NEXT_FIRE_TIME` (`SCHED_NAME`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_ST` (`SCHED_NAME`,`TRIGGER_STATE`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE_GRP` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `qrtz_job_details` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------
INSERT INTO `qrtz_triggers` VALUES ('DefaultQuartzScheduler', 'say hello trigger', 'cron trigger', 'hello job01_HelloWorld', 'normal job01_HelloWorld', 'this is my first trigger', '1543389750000', '1543389740000', '5', 'ACQUIRED', 'CRON', '1543388714000', '0', null, '0', '');

-- ----------------------------
-- Table structure for schedule_job
-- ----------------------------
DROP TABLE IF EXISTS `schedule_job`;
CREATE TABLE `schedule_job` (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务id',
  `bean_name` varchar(200) DEFAULT NULL COMMENT 'spring bean名称',
  `method_name` varchar(100) DEFAULT NULL COMMENT '方法名',
  `params` varchar(2000) DEFAULT NULL COMMENT '参数',
  `cron_expression` varchar(100) DEFAULT NULL COMMENT 'cron表达式',
  `status` tinyint(4) DEFAULT NULL COMMENT '任务状态  0：正常  1：暂停',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='定时任务';

-- ----------------------------
-- Records of schedule_job
-- ----------------------------

-- ----------------------------
-- Table structure for schedule_job_log
-- ----------------------------
DROP TABLE IF EXISTS `schedule_job_log`;
CREATE TABLE `schedule_job_log` (
  `log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志id',
  `job_id` bigint(20) NOT NULL COMMENT '任务id',
  `bean_name` varchar(200) DEFAULT NULL COMMENT 'spring bean名称',
  `method_name` varchar(100) DEFAULT NULL COMMENT '方法名',
  `params` varchar(2000) DEFAULT NULL COMMENT '参数',
  `status` tinyint(4) NOT NULL COMMENT '任务状态    0：成功    1：失败',
  `error` varchar(2000) DEFAULT NULL COMMENT '失败信息',
  `times` int(11) NOT NULL COMMENT '耗时(单位：毫秒)',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`log_id`),
  KEY `job_id` (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='定时任务日志';

-- ----------------------------
-- Records of schedule_job_log
-- ----------------------------
INSERT INTO `schedule_job_log` VALUES ('1', '17', '1', '1', '1', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'1\' available', '1', '2018-12-17 14:50:33');

-- ----------------------------
-- Table structure for sys_area
-- ----------------------------
DROP TABLE IF EXISTS `sys_area`;
CREATE TABLE `sys_area` (
  `ID` bigint(18) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `AREA_CODE` varchar(50) DEFAULT NULL COMMENT '区域编码',
  `AREA_NAME` varchar(100) DEFAULT NULL COMMENT '区域名称',
  `PARENT_ID` bigint(18) DEFAULT NULL COMMENT '父节点ID',
  `VALIDATE_STATE` varchar(1) DEFAULT NULL COMMENT '有效性状态，1有效，0无效，默认1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=532929 DEFAULT CHARSET=utf8 COMMENT='行政区域';

-- ----------------------------
-- Records of sys_area
-- ----------------------------
INSERT INTO `sys_area` VALUES ('100000', '100000', '中国', '0', '1');
INSERT INTO `sys_area` VALUES ('100100', '100100', '中国', '100000', '1');
INSERT INTO `sys_area` VALUES ('110000', '110000', '北京市', '0', '1');
INSERT INTO `sys_area` VALUES ('110100', '110100', '北京市', '110000', '1');
INSERT INTO `sys_area` VALUES ('110101', '110101', '东城区', '110100', '1');
INSERT INTO `sys_area` VALUES ('110102', '110102', '西城区', '110100', '1');
INSERT INTO `sys_area` VALUES ('110103', '110103', '崇文区', '110100', '1');
INSERT INTO `sys_area` VALUES ('110104', '110104', '宣武区', '110100', '1');
INSERT INTO `sys_area` VALUES ('110105', '110105', '朝阳区', '110100', '1');
INSERT INTO `sys_area` VALUES ('110106', '110106', '丰台区', '110100', '1');
INSERT INTO `sys_area` VALUES ('110107', '110107', '石景山区', '110100', '1');
INSERT INTO `sys_area` VALUES ('110108', '110108', '海淀区', '110100', '1');
INSERT INTO `sys_area` VALUES ('110109', '110109', '门头沟区', '110100', '1');
INSERT INTO `sys_area` VALUES ('110111', '110111', '房山区', '110100', '1');
INSERT INTO `sys_area` VALUES ('110112', '110112', '通州区', '110100', '1');
INSERT INTO `sys_area` VALUES ('110113', '110113', '顺义区', '110100', '1');
INSERT INTO `sys_area` VALUES ('110114', '110114', '昌平区', '110100', '1');
INSERT INTO `sys_area` VALUES ('110115', '110115', '大兴区', '110100', '1');
INSERT INTO `sys_area` VALUES ('110116', '110116', '怀柔区', '110100', '1');
INSERT INTO `sys_area` VALUES ('110117', '110117', '平谷区', '110100', '1');
INSERT INTO `sys_area` VALUES ('110228', '110228', '密云县', '110100', '1');
INSERT INTO `sys_area` VALUES ('110229', '110229', '延庆县', '110100', '1');
INSERT INTO `sys_area` VALUES ('120000', '120000', '天津市', '0', '1');
INSERT INTO `sys_area` VALUES ('120100', '120100', '天津市', '120000', '1');
INSERT INTO `sys_area` VALUES ('120101', '120101', '和平区', '120100', '1');
INSERT INTO `sys_area` VALUES ('120102', '120102', '河东区', '120100', '1');
INSERT INTO `sys_area` VALUES ('120103', '120103', '河西区', '120100', '1');
INSERT INTO `sys_area` VALUES ('120104', '120104', '南开区', '120100', '1');
INSERT INTO `sys_area` VALUES ('120105', '120105', '河北区', '120100', '1');
INSERT INTO `sys_area` VALUES ('120106', '120106', '红桥区', '120100', '1');
INSERT INTO `sys_area` VALUES ('120107', '120107', '塘沽区', '120100', '1');
INSERT INTO `sys_area` VALUES ('120108', '120108', '汉沽区', '120100', '1');
INSERT INTO `sys_area` VALUES ('120109', '120109', '大港区', '120100', '1');
INSERT INTO `sys_area` VALUES ('120110', '120110', '东丽区', '120100', '1');
INSERT INTO `sys_area` VALUES ('120111', '120111', '西青区', '120100', '1');
INSERT INTO `sys_area` VALUES ('120112', '120112', '津南区', '120100', '1');
INSERT INTO `sys_area` VALUES ('120113', '120113', '北辰区', '120100', '1');
INSERT INTO `sys_area` VALUES ('120114', '120114', '武清区', '120100', '1');
INSERT INTO `sys_area` VALUES ('120115', '120115', '宝坻区', '120100', '1');
INSERT INTO `sys_area` VALUES ('120116', '120116', '滨海新区', '120100', '1');
INSERT INTO `sys_area` VALUES ('120221', '120221', '宁河县', '120100', '1');
INSERT INTO `sys_area` VALUES ('120223', '120223', '静海县', '120100', '1');
INSERT INTO `sys_area` VALUES ('120225', '120225', '蓟县', '120100', '1');
INSERT INTO `sys_area` VALUES ('130000', '130000', '河北省', '0', '1');
INSERT INTO `sys_area` VALUES ('130100', '130100', '石家庄市', '130000', '1');
INSERT INTO `sys_area` VALUES ('130102', '130102', '长安区', '130100', '1');
INSERT INTO `sys_area` VALUES ('130103', '130103', '桥东区', '130100', '1');
INSERT INTO `sys_area` VALUES ('130104', '130104', '桥西区', '130100', '1');
INSERT INTO `sys_area` VALUES ('130105', '130105', '新华区', '130100', '1');
INSERT INTO `sys_area` VALUES ('130107', '130107', '井陉矿区', '130100', '1');
INSERT INTO `sys_area` VALUES ('130108', '130108', '裕华区', '130100', '1');
INSERT INTO `sys_area` VALUES ('130121', '130121', '井陉县', '130100', '1');
INSERT INTO `sys_area` VALUES ('130123', '130123', '正定县', '130100', '1');
INSERT INTO `sys_area` VALUES ('130124', '130124', '栾城县', '130100', '1');
INSERT INTO `sys_area` VALUES ('130125', '130125', '行唐县', '130100', '1');
INSERT INTO `sys_area` VALUES ('130126', '130126', '灵寿县', '130100', '1');
INSERT INTO `sys_area` VALUES ('130127', '130127', '高邑县', '130100', '1');
INSERT INTO `sys_area` VALUES ('130128', '130128', '深泽县', '130100', '1');
INSERT INTO `sys_area` VALUES ('130129', '130129', '赞皇县', '130100', '1');
INSERT INTO `sys_area` VALUES ('130130', '130130', '无极县', '130100', '1');
INSERT INTO `sys_area` VALUES ('130131', '130131', '平山县', '130100', '1');
INSERT INTO `sys_area` VALUES ('130132', '130132', '元氏县', '130100', '1');
INSERT INTO `sys_area` VALUES ('130133', '130133', '赵县', '130100', '1');
INSERT INTO `sys_area` VALUES ('130181', '130181', '辛集市', '130100', '1');
INSERT INTO `sys_area` VALUES ('130182', '130182', '藁城市', '130100', '1');
INSERT INTO `sys_area` VALUES ('130183', '130183', '晋州市', '130100', '1');
INSERT INTO `sys_area` VALUES ('130184', '130184', '新乐市', '130100', '1');
INSERT INTO `sys_area` VALUES ('130185', '130185', '鹿泉市', '130100', '1');
INSERT INTO `sys_area` VALUES ('130200', '130200', '唐山市', '130000', '1');
INSERT INTO `sys_area` VALUES ('130202', '130202', '路南区', '130200', '1');
INSERT INTO `sys_area` VALUES ('130203', '130203', '路北区', '130200', '1');
INSERT INTO `sys_area` VALUES ('130204', '130204', '古冶区', '130200', '1');
INSERT INTO `sys_area` VALUES ('130205', '130205', '开平区', '130200', '1');
INSERT INTO `sys_area` VALUES ('130207', '130207', '丰南区', '130200', '1');
INSERT INTO `sys_area` VALUES ('130208', '130208', '丰润区', '130200', '1');
INSERT INTO `sys_area` VALUES ('130223', '130223', '滦县', '130200', '1');
INSERT INTO `sys_area` VALUES ('130224', '130224', '滦南县', '130200', '1');
INSERT INTO `sys_area` VALUES ('130225', '130225', '乐亭县', '130200', '1');
INSERT INTO `sys_area` VALUES ('130227', '130227', '迁西县', '130200', '1');
INSERT INTO `sys_area` VALUES ('130229', '130229', '玉田县', '130200', '1');
INSERT INTO `sys_area` VALUES ('130230', '130230', '唐海县', '130200', '1');
INSERT INTO `sys_area` VALUES ('130281', '130281', '遵化市', '130200', '1');
INSERT INTO `sys_area` VALUES ('130283', '130283', '迁安市', '130200', '1');
INSERT INTO `sys_area` VALUES ('130300', '130300', '秦皇岛市', '130000', '1');
INSERT INTO `sys_area` VALUES ('130302', '130302', '海港区', '130300', '1');
INSERT INTO `sys_area` VALUES ('130303', '130303', '山海关区', '130300', '1');
INSERT INTO `sys_area` VALUES ('130304', '130304', '北戴河区', '130300', '1');
INSERT INTO `sys_area` VALUES ('130321', '130321', '青龙满族自治县', '130300', '1');
INSERT INTO `sys_area` VALUES ('130322', '130322', '昌黎县', '130300', '1');
INSERT INTO `sys_area` VALUES ('130323', '130323', '抚宁县', '130300', '1');
INSERT INTO `sys_area` VALUES ('130324', '130324', '卢龙县', '130300', '1');
INSERT INTO `sys_area` VALUES ('130400', '130400', '邯郸市', '130000', '1');
INSERT INTO `sys_area` VALUES ('130402', '130402', '邯山区', '130400', '1');
INSERT INTO `sys_area` VALUES ('130403', '130403', '丛台区', '130400', '1');
INSERT INTO `sys_area` VALUES ('130404', '130404', '复兴区', '130400', '1');
INSERT INTO `sys_area` VALUES ('130406', '130406', '峰峰矿区', '130400', '1');
INSERT INTO `sys_area` VALUES ('130421', '130421', '邯郸县', '130400', '1');
INSERT INTO `sys_area` VALUES ('130423', '130423', '临漳县', '130400', '1');
INSERT INTO `sys_area` VALUES ('130424', '130424', '成安县', '130400', '1');
INSERT INTO `sys_area` VALUES ('130425', '130425', '大名县', '130400', '1');
INSERT INTO `sys_area` VALUES ('130426', '130426', '涉县', '130400', '1');
INSERT INTO `sys_area` VALUES ('130427', '130427', '磁县', '130400', '1');
INSERT INTO `sys_area` VALUES ('130428', '130428', '肥乡县', '130400', '1');
INSERT INTO `sys_area` VALUES ('130429', '130429', '永年县', '130400', '1');
INSERT INTO `sys_area` VALUES ('130430', '130430', '邱县', '130400', '1');
INSERT INTO `sys_area` VALUES ('130431', '130431', '鸡泽县', '130400', '1');
INSERT INTO `sys_area` VALUES ('130432', '130432', '广平县', '130400', '1');
INSERT INTO `sys_area` VALUES ('130433', '130433', '馆陶县', '130400', '1');
INSERT INTO `sys_area` VALUES ('130434', '130434', '魏县', '130400', '1');
INSERT INTO `sys_area` VALUES ('130435', '130435', '曲周县', '130400', '1');
INSERT INTO `sys_area` VALUES ('130481', '130481', '武安市', '130400', '1');
INSERT INTO `sys_area` VALUES ('130500', '130500', '邢台市', '130000', '1');
INSERT INTO `sys_area` VALUES ('130502', '130502', '桥东区', '130500', '1');
INSERT INTO `sys_area` VALUES ('130503', '130503', '桥西区', '130500', '1');
INSERT INTO `sys_area` VALUES ('130521', '130521', '邢台县', '130500', '1');
INSERT INTO `sys_area` VALUES ('130522', '130522', '临城县', '130500', '1');
INSERT INTO `sys_area` VALUES ('130523', '130523', '内丘县', '130500', '1');
INSERT INTO `sys_area` VALUES ('130524', '130524', '柏乡县', '130500', '1');
INSERT INTO `sys_area` VALUES ('130525', '130525', '隆尧县', '130500', '1');
INSERT INTO `sys_area` VALUES ('130526', '130526', '任县', '130500', '1');
INSERT INTO `sys_area` VALUES ('130527', '130527', '南和县', '130500', '1');
INSERT INTO `sys_area` VALUES ('130528', '130528', '宁晋县', '130500', '1');
INSERT INTO `sys_area` VALUES ('130529', '130529', '巨鹿县', '130500', '1');
INSERT INTO `sys_area` VALUES ('130530', '130530', '新河县', '130500', '1');
INSERT INTO `sys_area` VALUES ('130531', '130531', '广宗县', '130500', '1');
INSERT INTO `sys_area` VALUES ('130532', '130532', '平乡县', '130500', '1');
INSERT INTO `sys_area` VALUES ('130533', '130533', '威县', '130500', '1');
INSERT INTO `sys_area` VALUES ('130534', '130534', '清河县', '130500', '1');
INSERT INTO `sys_area` VALUES ('130535', '130535', '临西县', '130500', '1');
INSERT INTO `sys_area` VALUES ('130581', '130581', '南宫市', '130500', '1');
INSERT INTO `sys_area` VALUES ('130582', '130582', '沙河市', '130500', '1');
INSERT INTO `sys_area` VALUES ('130600', '130600', '保定市', '130000', '1');
INSERT INTO `sys_area` VALUES ('130602', '130602', '新市区', '130600', '1');
INSERT INTO `sys_area` VALUES ('130603', '130603', '北市区', '130600', '1');
INSERT INTO `sys_area` VALUES ('130604', '130604', '南市区', '130600', '1');
INSERT INTO `sys_area` VALUES ('130621', '130621', '满城县', '130600', '1');
INSERT INTO `sys_area` VALUES ('130622', '130622', '清苑县', '130600', '1');
INSERT INTO `sys_area` VALUES ('130623', '130623', '涞水县', '130600', '1');
INSERT INTO `sys_area` VALUES ('130624', '130624', '阜平县', '130600', '1');
INSERT INTO `sys_area` VALUES ('130625', '130625', '徐水县', '130600', '1');
INSERT INTO `sys_area` VALUES ('130626', '130626', '定兴县', '130600', '1');
INSERT INTO `sys_area` VALUES ('130627', '130627', '唐县', '130600', '1');
INSERT INTO `sys_area` VALUES ('130628', '130628', '高阳县', '130600', '1');
INSERT INTO `sys_area` VALUES ('130629', '130629', '容城县', '130600', '1');
INSERT INTO `sys_area` VALUES ('130630', '130630', '涞源县', '130600', '1');
INSERT INTO `sys_area` VALUES ('130631', '130631', '望都县', '130600', '1');
INSERT INTO `sys_area` VALUES ('130632', '130632', '安新县', '130600', '1');
INSERT INTO `sys_area` VALUES ('130633', '130633', '易县', '130600', '1');
INSERT INTO `sys_area` VALUES ('130634', '130634', '曲阳县', '130600', '1');
INSERT INTO `sys_area` VALUES ('130635', '130635', '蠡县', '130600', '1');
INSERT INTO `sys_area` VALUES ('130636', '130636', '顺平县', '130600', '1');
INSERT INTO `sys_area` VALUES ('130637', '130637', '博野县', '130600', '1');
INSERT INTO `sys_area` VALUES ('130638', '130638', '雄县', '130600', '1');
INSERT INTO `sys_area` VALUES ('130681', '130681', '涿州市', '130600', '1');
INSERT INTO `sys_area` VALUES ('130682', '130682', '定州市', '130600', '1');
INSERT INTO `sys_area` VALUES ('130683', '130683', '安国市', '130600', '1');
INSERT INTO `sys_area` VALUES ('130684', '130684', '高碑店市', '130600', '1');
INSERT INTO `sys_area` VALUES ('130700', '130700', '张家口市', '130000', '1');
INSERT INTO `sys_area` VALUES ('130702', '130702', '桥东区', '130700', '1');
INSERT INTO `sys_area` VALUES ('130703', '130703', '桥西区', '130700', '1');
INSERT INTO `sys_area` VALUES ('130705', '130705', '宣化区', '130700', '1');
INSERT INTO `sys_area` VALUES ('130706', '130706', '下花园区', '130700', '1');
INSERT INTO `sys_area` VALUES ('130721', '130721', '宣化县', '130700', '1');
INSERT INTO `sys_area` VALUES ('130722', '130722', '张北县', '130700', '1');
INSERT INTO `sys_area` VALUES ('130723', '130723', '康保县', '130700', '1');
INSERT INTO `sys_area` VALUES ('130724', '130724', '沽源县', '130700', '1');
INSERT INTO `sys_area` VALUES ('130725', '130725', '尚义县', '130700', '1');
INSERT INTO `sys_area` VALUES ('130726', '130726', '蔚县', '130700', '1');
INSERT INTO `sys_area` VALUES ('130727', '130727', '阳原县', '130700', '1');
INSERT INTO `sys_area` VALUES ('130728', '130728', '怀安县', '130700', '1');
INSERT INTO `sys_area` VALUES ('130729', '130729', '万全县', '130700', '1');
INSERT INTO `sys_area` VALUES ('130730', '130730', '怀来县', '130700', '1');
INSERT INTO `sys_area` VALUES ('130731', '130731', '涿鹿县', '130700', '1');
INSERT INTO `sys_area` VALUES ('130732', '130732', '赤城县', '130700', '1');
INSERT INTO `sys_area` VALUES ('130733', '130733', '崇礼县', '130700', '1');
INSERT INTO `sys_area` VALUES ('130800', '130800', '承德市', '130000', '1');
INSERT INTO `sys_area` VALUES ('130802', '130802', '双桥区', '130800', '1');
INSERT INTO `sys_area` VALUES ('130803', '130803', '双滦区', '130800', '1');
INSERT INTO `sys_area` VALUES ('130804', '130804', '鹰手营子矿区', '130800', '1');
INSERT INTO `sys_area` VALUES ('130821', '130821', '承德县', '130800', '1');
INSERT INTO `sys_area` VALUES ('130822', '130822', '兴隆县', '130800', '1');
INSERT INTO `sys_area` VALUES ('130823', '130823', '平泉县', '130800', '1');
INSERT INTO `sys_area` VALUES ('130824', '130824', '滦平县', '130800', '1');
INSERT INTO `sys_area` VALUES ('130825', '130825', '隆化县', '130800', '1');
INSERT INTO `sys_area` VALUES ('130826', '130826', '丰宁满族自治县', '130800', '1');
INSERT INTO `sys_area` VALUES ('130827', '130827', '宽城满族自治县', '130800', '1');
INSERT INTO `sys_area` VALUES ('130828', '130828', '围场满族蒙古族自治县', '130800', '1');
INSERT INTO `sys_area` VALUES ('130900', '130900', '沧州市', '130000', '1');
INSERT INTO `sys_area` VALUES ('130902', '130902', '新华区', '130900', '1');
INSERT INTO `sys_area` VALUES ('130903', '130903', '运河区', '130900', '1');
INSERT INTO `sys_area` VALUES ('130921', '130921', '沧县', '130900', '1');
INSERT INTO `sys_area` VALUES ('130922', '130922', '青县', '130900', '1');
INSERT INTO `sys_area` VALUES ('130923', '130923', '东光县', '130900', '1');
INSERT INTO `sys_area` VALUES ('130924', '130924', '海兴县', '130900', '1');
INSERT INTO `sys_area` VALUES ('130925', '130925', '盐山县', '130900', '1');
INSERT INTO `sys_area` VALUES ('130926', '130926', '肃宁县', '130900', '1');
INSERT INTO `sys_area` VALUES ('130927', '130927', '南皮县', '130900', '1');
INSERT INTO `sys_area` VALUES ('130928', '130928', '吴桥县', '130900', '1');
INSERT INTO `sys_area` VALUES ('130929', '130929', '献县', '130900', '1');
INSERT INTO `sys_area` VALUES ('130930', '130930', '孟村回族自治县', '130900', '1');
INSERT INTO `sys_area` VALUES ('130981', '130981', '泊头市', '130900', '1');
INSERT INTO `sys_area` VALUES ('130982', '130982', '任丘市', '130900', '1');
INSERT INTO `sys_area` VALUES ('130983', '130983', '黄骅市', '130900', '1');
INSERT INTO `sys_area` VALUES ('130984', '130984', '河间市', '130900', '1');
INSERT INTO `sys_area` VALUES ('131000', '131000', '廊坊市', '130000', '1');
INSERT INTO `sys_area` VALUES ('131002', '131002', '安次区', '131000', '1');
INSERT INTO `sys_area` VALUES ('131003', '131003', '广阳区', '131000', '1');
INSERT INTO `sys_area` VALUES ('131022', '131022', '固安县', '131000', '1');
INSERT INTO `sys_area` VALUES ('131023', '131023', '永清县', '131000', '1');
INSERT INTO `sys_area` VALUES ('131024', '131024', '香河县', '131000', '1');
INSERT INTO `sys_area` VALUES ('131025', '131025', '大城县', '131000', '1');
INSERT INTO `sys_area` VALUES ('131026', '131026', '文安县', '131000', '1');
INSERT INTO `sys_area` VALUES ('131028', '131028', '大厂回族自治县', '131000', '1');
INSERT INTO `sys_area` VALUES ('131081', '131081', '霸州市', '131000', '1');
INSERT INTO `sys_area` VALUES ('131082', '131082', '三河市', '131000', '1');
INSERT INTO `sys_area` VALUES ('131100', '131100', '衡水市', '130000', '1');
INSERT INTO `sys_area` VALUES ('131102', '131102', '桃城区', '131100', '1');
INSERT INTO `sys_area` VALUES ('131121', '131121', '枣强县', '131100', '1');
INSERT INTO `sys_area` VALUES ('131122', '131122', '武邑县', '131100', '1');
INSERT INTO `sys_area` VALUES ('131123', '131123', '武强县', '131100', '1');
INSERT INTO `sys_area` VALUES ('131124', '131124', '饶阳县', '131100', '1');
INSERT INTO `sys_area` VALUES ('131125', '131125', '安平县', '131100', '1');
INSERT INTO `sys_area` VALUES ('131126', '131126', '故城县', '131100', '1');
INSERT INTO `sys_area` VALUES ('131127', '131127', '景县', '131100', '1');
INSERT INTO `sys_area` VALUES ('131128', '131128', '阜城县', '131100', '1');
INSERT INTO `sys_area` VALUES ('131181', '131181', '冀州市', '131100', '1');
INSERT INTO `sys_area` VALUES ('131182', '131182', '深州市', '131100', '1');
INSERT INTO `sys_area` VALUES ('140000', '140000', '山西省', '0', '1');
INSERT INTO `sys_area` VALUES ('140100', '140100', '太原市', '140000', '1');
INSERT INTO `sys_area` VALUES ('140105', '140105', '小店区', '140100', '1');
INSERT INTO `sys_area` VALUES ('140106', '140106', '迎泽区', '140100', '1');
INSERT INTO `sys_area` VALUES ('140107', '140107', '杏花岭区', '140100', '1');
INSERT INTO `sys_area` VALUES ('140108', '140108', '尖草坪区', '140100', '1');
INSERT INTO `sys_area` VALUES ('140109', '140109', '万柏林区', '140100', '1');
INSERT INTO `sys_area` VALUES ('140110', '140110', '晋源区', '140100', '1');
INSERT INTO `sys_area` VALUES ('140121', '140121', '清徐县', '140100', '1');
INSERT INTO `sys_area` VALUES ('140122', '140122', '阳曲县', '140100', '1');
INSERT INTO `sys_area` VALUES ('140123', '140123', '娄烦县', '140100', '1');
INSERT INTO `sys_area` VALUES ('140181', '140181', '古交市', '140100', '1');
INSERT INTO `sys_area` VALUES ('140200', '140200', '大同市', '140000', '1');
INSERT INTO `sys_area` VALUES ('140202', '140202', '城区', '140200', '1');
INSERT INTO `sys_area` VALUES ('140203', '140203', '矿区', '140200', '1');
INSERT INTO `sys_area` VALUES ('140211', '140211', '南郊区', '140200', '1');
INSERT INTO `sys_area` VALUES ('140212', '140212', '新荣区', '140200', '1');
INSERT INTO `sys_area` VALUES ('140221', '140221', '阳高县', '140200', '1');
INSERT INTO `sys_area` VALUES ('140222', '140222', '天镇县', '140200', '1');
INSERT INTO `sys_area` VALUES ('140223', '140223', '广灵县', '140200', '1');
INSERT INTO `sys_area` VALUES ('140224', '140224', '灵丘县', '140200', '1');
INSERT INTO `sys_area` VALUES ('140225', '140225', '浑源县', '140200', '1');
INSERT INTO `sys_area` VALUES ('140226', '140226', '左云县', '140200', '1');
INSERT INTO `sys_area` VALUES ('140227', '140227', '大同县', '140200', '1');
INSERT INTO `sys_area` VALUES ('140300', '140300', '阳泉市', '140000', '1');
INSERT INTO `sys_area` VALUES ('140302', '140302', '城区', '140300', '1');
INSERT INTO `sys_area` VALUES ('140303', '140303', '矿区', '140300', '1');
INSERT INTO `sys_area` VALUES ('140311', '140311', '郊区', '140300', '1');
INSERT INTO `sys_area` VALUES ('140321', '140321', '平定县', '140300', '1');
INSERT INTO `sys_area` VALUES ('140322', '140322', '盂县', '140300', '1');
INSERT INTO `sys_area` VALUES ('140400', '140400', '长治市', '140000', '1');
INSERT INTO `sys_area` VALUES ('140402', '140402', '城区', '140400', '1');
INSERT INTO `sys_area` VALUES ('140411', '140411', '郊区', '140400', '1');
INSERT INTO `sys_area` VALUES ('140421', '140421', '长治县', '140400', '1');
INSERT INTO `sys_area` VALUES ('140423', '140423', '襄垣县', '140400', '1');
INSERT INTO `sys_area` VALUES ('140424', '140424', '屯留县', '140400', '1');
INSERT INTO `sys_area` VALUES ('140425', '140425', '平顺县', '140400', '1');
INSERT INTO `sys_area` VALUES ('140426', '140426', '黎城县', '140400', '1');
INSERT INTO `sys_area` VALUES ('140427', '140427', '壶关县', '140400', '1');
INSERT INTO `sys_area` VALUES ('140428', '140428', '长子县', '140400', '1');
INSERT INTO `sys_area` VALUES ('140429', '140429', '武乡县', '140400', '1');
INSERT INTO `sys_area` VALUES ('140430', '140430', '沁县', '140400', '1');
INSERT INTO `sys_area` VALUES ('140431', '140431', '沁源县', '140400', '1');
INSERT INTO `sys_area` VALUES ('140481', '140481', '潞城市', '140400', '1');
INSERT INTO `sys_area` VALUES ('140500', '140500', '晋城市', '140000', '1');
INSERT INTO `sys_area` VALUES ('140502', '140502', '城区', '140500', '1');
INSERT INTO `sys_area` VALUES ('140521', '140521', '沁水县', '140500', '1');
INSERT INTO `sys_area` VALUES ('140522', '140522', '阳城县', '140500', '1');
INSERT INTO `sys_area` VALUES ('140524', '140524', '陵川县', '140500', '1');
INSERT INTO `sys_area` VALUES ('140525', '140525', '泽州县', '140500', '1');
INSERT INTO `sys_area` VALUES ('140581', '140581', '高平市', '140500', '1');
INSERT INTO `sys_area` VALUES ('140600', '140600', '朔州市', '140000', '1');
INSERT INTO `sys_area` VALUES ('140602', '140602', '朔城区', '140600', '1');
INSERT INTO `sys_area` VALUES ('140603', '140603', '平鲁区', '140600', '1');
INSERT INTO `sys_area` VALUES ('140621', '140621', '山阴县', '140600', '1');
INSERT INTO `sys_area` VALUES ('140622', '140622', '应县', '140600', '1');
INSERT INTO `sys_area` VALUES ('140623', '140623', '右玉县', '140600', '1');
INSERT INTO `sys_area` VALUES ('140624', '140624', '怀仁县', '140600', '1');
INSERT INTO `sys_area` VALUES ('140700', '140700', '晋中市', '140000', '1');
INSERT INTO `sys_area` VALUES ('140702', '140702', '榆次区', '140700', '1');
INSERT INTO `sys_area` VALUES ('140721', '140721', '榆社县', '140700', '1');
INSERT INTO `sys_area` VALUES ('140722', '140722', '左权县', '140700', '1');
INSERT INTO `sys_area` VALUES ('140723', '140723', '和顺县', '140700', '1');
INSERT INTO `sys_area` VALUES ('140724', '140724', '昔阳县', '140700', '1');
INSERT INTO `sys_area` VALUES ('140725', '140725', '寿阳县', '140700', '1');
INSERT INTO `sys_area` VALUES ('140726', '140726', '太谷县', '140700', '1');
INSERT INTO `sys_area` VALUES ('140727', '140727', '祁县', '140700', '1');
INSERT INTO `sys_area` VALUES ('140728', '140728', '平遥县', '140700', '1');
INSERT INTO `sys_area` VALUES ('140729', '140729', '灵石县', '140700', '1');
INSERT INTO `sys_area` VALUES ('140781', '140781', '介休市', '140700', '1');
INSERT INTO `sys_area` VALUES ('140800', '140800', '运城市', '140000', '1');
INSERT INTO `sys_area` VALUES ('140802', '140802', '盐湖区', '140800', '1');
INSERT INTO `sys_area` VALUES ('140821', '140821', '临猗县', '140800', '1');
INSERT INTO `sys_area` VALUES ('140822', '140822', '万荣县', '140800', '1');
INSERT INTO `sys_area` VALUES ('140823', '140823', '闻喜县', '140800', '1');
INSERT INTO `sys_area` VALUES ('140824', '140824', '稷山县', '140800', '1');
INSERT INTO `sys_area` VALUES ('140825', '140825', '新绛县', '140800', '1');
INSERT INTO `sys_area` VALUES ('140826', '140826', '绛县', '140800', '1');
INSERT INTO `sys_area` VALUES ('140827', '140827', '垣曲县', '140800', '1');
INSERT INTO `sys_area` VALUES ('140828', '140828', '夏县', '140800', '1');
INSERT INTO `sys_area` VALUES ('140829', '140829', '平陆县', '140800', '1');
INSERT INTO `sys_area` VALUES ('140830', '140830', '芮城县', '140800', '1');
INSERT INTO `sys_area` VALUES ('140881', '140881', '永济市', '140800', '1');
INSERT INTO `sys_area` VALUES ('140882', '140882', '河津市', '140800', '1');
INSERT INTO `sys_area` VALUES ('140900', '140900', '忻州市', '140000', '1');
INSERT INTO `sys_area` VALUES ('140902', '140902', '忻府区', '140900', '1');
INSERT INTO `sys_area` VALUES ('140921', '140921', '定襄县', '140900', '1');
INSERT INTO `sys_area` VALUES ('140922', '140922', '五台县', '140900', '1');
INSERT INTO `sys_area` VALUES ('140923', '140923', '代县', '140900', '1');
INSERT INTO `sys_area` VALUES ('140924', '140924', '繁峙县', '140900', '1');
INSERT INTO `sys_area` VALUES ('140925', '140925', '宁武县', '140900', '1');
INSERT INTO `sys_area` VALUES ('140926', '140926', '静乐县', '140900', '1');
INSERT INTO `sys_area` VALUES ('140927', '140927', '神池县', '140900', '1');
INSERT INTO `sys_area` VALUES ('140928', '140928', '五寨县', '140900', '1');
INSERT INTO `sys_area` VALUES ('140929', '140929', '岢岚县', '140900', '1');
INSERT INTO `sys_area` VALUES ('140930', '140930', '河曲县', '140900', '1');
INSERT INTO `sys_area` VALUES ('140931', '140931', '保德县', '140900', '1');
INSERT INTO `sys_area` VALUES ('140932', '140932', '偏关县', '140900', '1');
INSERT INTO `sys_area` VALUES ('140981', '140981', '原平市', '140900', '1');
INSERT INTO `sys_area` VALUES ('141000', '141000', '临汾市', '140000', '1');
INSERT INTO `sys_area` VALUES ('141002', '141002', '尧都区', '141000', '1');
INSERT INTO `sys_area` VALUES ('141021', '141021', '曲沃县', '141000', '1');
INSERT INTO `sys_area` VALUES ('141022', '141022', '翼城县', '141000', '1');
INSERT INTO `sys_area` VALUES ('141023', '141023', '襄汾县', '141000', '1');
INSERT INTO `sys_area` VALUES ('141024', '141024', '洪洞县', '141000', '1');
INSERT INTO `sys_area` VALUES ('141025', '141025', '古县', '141000', '1');
INSERT INTO `sys_area` VALUES ('141026', '141026', '安泽县', '141000', '1');
INSERT INTO `sys_area` VALUES ('141027', '141027', '浮山县', '141000', '1');
INSERT INTO `sys_area` VALUES ('141028', '141028', '吉县', '141000', '1');
INSERT INTO `sys_area` VALUES ('141029', '141029', '乡宁县', '141000', '1');
INSERT INTO `sys_area` VALUES ('141030', '141030', '大宁县', '141000', '1');
INSERT INTO `sys_area` VALUES ('141031', '141031', '隰县', '141000', '1');
INSERT INTO `sys_area` VALUES ('141032', '141032', '永和县', '141000', '1');
INSERT INTO `sys_area` VALUES ('141033', '141033', '蒲县', '141000', '1');
INSERT INTO `sys_area` VALUES ('141034', '141034', '汾西县', '141000', '1');
INSERT INTO `sys_area` VALUES ('141081', '141081', '侯马市', '141000', '1');
INSERT INTO `sys_area` VALUES ('141082', '141082', '霍州市', '141000', '1');
INSERT INTO `sys_area` VALUES ('141100', '141100', '吕梁市', '140000', '1');
INSERT INTO `sys_area` VALUES ('141102', '141102', '离石区', '141100', '1');
INSERT INTO `sys_area` VALUES ('141121', '141121', '文水县', '141100', '1');
INSERT INTO `sys_area` VALUES ('141122', '141122', '交城县', '141100', '1');
INSERT INTO `sys_area` VALUES ('141123', '141123', '兴县', '141100', '1');
INSERT INTO `sys_area` VALUES ('141124', '141124', '临县', '141100', '1');
INSERT INTO `sys_area` VALUES ('141125', '141125', '柳林县', '141100', '1');
INSERT INTO `sys_area` VALUES ('141126', '141126', '石楼县', '141100', '1');
INSERT INTO `sys_area` VALUES ('141127', '141127', '岚县', '141100', '1');
INSERT INTO `sys_area` VALUES ('141128', '141128', '方山县', '141100', '1');
INSERT INTO `sys_area` VALUES ('141129', '141129', '中阳县', '141100', '1');
INSERT INTO `sys_area` VALUES ('141130', '141130', '交口县', '141100', '1');
INSERT INTO `sys_area` VALUES ('141181', '141181', '孝义市', '141100', '1');
INSERT INTO `sys_area` VALUES ('141182', '141182', '汾阳市', '141100', '1');
INSERT INTO `sys_area` VALUES ('150000', '150000', '内蒙古自治区', '0', '1');
INSERT INTO `sys_area` VALUES ('150100', '150100', '呼和浩特市', '150000', '1');
INSERT INTO `sys_area` VALUES ('150102', '150102', '新城区', '150100', '1');
INSERT INTO `sys_area` VALUES ('150103', '150103', '回民区', '150100', '1');
INSERT INTO `sys_area` VALUES ('150104', '150104', '玉泉区', '150100', '1');
INSERT INTO `sys_area` VALUES ('150105', '150105', '赛罕区', '150100', '1');
INSERT INTO `sys_area` VALUES ('150121', '150121', '土默特左旗', '150100', '1');
INSERT INTO `sys_area` VALUES ('150122', '150122', '托克托县', '150100', '1');
INSERT INTO `sys_area` VALUES ('150123', '150123', '和林格尔县', '150100', '1');
INSERT INTO `sys_area` VALUES ('150124', '150124', '清水河县', '150100', '1');
INSERT INTO `sys_area` VALUES ('150125', '150125', '武川县', '150100', '1');
INSERT INTO `sys_area` VALUES ('150200', '150200', '包头市', '150000', '1');
INSERT INTO `sys_area` VALUES ('150202', '150202', '东河区', '150200', '1');
INSERT INTO `sys_area` VALUES ('150203', '150203', '昆都仑区', '150200', '1');
INSERT INTO `sys_area` VALUES ('150204', '150204', '青山区', '150200', '1');
INSERT INTO `sys_area` VALUES ('150205', '150205', '石拐区', '150200', '1');
INSERT INTO `sys_area` VALUES ('150206', '150206', '白云鄂博矿区', '150200', '1');
INSERT INTO `sys_area` VALUES ('150207', '150207', '九原区', '150200', '1');
INSERT INTO `sys_area` VALUES ('150208', '150208', '白云矿区', '150200', '1');
INSERT INTO `sys_area` VALUES ('150221', '150221', '土默特右旗', '150200', '1');
INSERT INTO `sys_area` VALUES ('150222', '150222', '固阳县', '150200', '1');
INSERT INTO `sys_area` VALUES ('150223', '150223', '达尔罕茂明安联合旗', '150200', '1');
INSERT INTO `sys_area` VALUES ('150300', '150300', '乌海市', '150000', '1');
INSERT INTO `sys_area` VALUES ('150302', '150302', '海勃湾区', '150300', '1');
INSERT INTO `sys_area` VALUES ('150303', '150303', '海南区', '150300', '1');
INSERT INTO `sys_area` VALUES ('150304', '150304', '乌达区', '150300', '1');
INSERT INTO `sys_area` VALUES ('150400', '150400', '赤峰市', '150000', '1');
INSERT INTO `sys_area` VALUES ('150402', '150402', '红山区', '150400', '1');
INSERT INTO `sys_area` VALUES ('150403', '150403', '元宝山区', '150400', '1');
INSERT INTO `sys_area` VALUES ('150404', '150404', '松山区', '150400', '1');
INSERT INTO `sys_area` VALUES ('150421', '150421', '阿鲁科尔沁旗', '150400', '1');
INSERT INTO `sys_area` VALUES ('150422', '150422', '巴林左旗', '150400', '1');
INSERT INTO `sys_area` VALUES ('150423', '150423', '巴林右旗', '150400', '1');
INSERT INTO `sys_area` VALUES ('150424', '150424', '林西县', '150400', '1');
INSERT INTO `sys_area` VALUES ('150425', '150425', '克什克腾旗', '150400', '1');
INSERT INTO `sys_area` VALUES ('150426', '150426', '翁牛特旗', '150400', '1');
INSERT INTO `sys_area` VALUES ('150428', '150428', '喀喇沁旗', '150400', '1');
INSERT INTO `sys_area` VALUES ('150429', '150429', '宁城县', '150400', '1');
INSERT INTO `sys_area` VALUES ('150430', '150430', '敖汉旗', '150400', '1');
INSERT INTO `sys_area` VALUES ('150500', '150500', '通辽市', '150000', '1');
INSERT INTO `sys_area` VALUES ('150502', '150502', '科尔沁区', '150500', '1');
INSERT INTO `sys_area` VALUES ('150521', '150521', '科尔沁左翼中旗', '150500', '1');
INSERT INTO `sys_area` VALUES ('150522', '150522', '科尔沁左翼后旗', '150500', '1');
INSERT INTO `sys_area` VALUES ('150523', '150523', '开鲁县', '150500', '1');
INSERT INTO `sys_area` VALUES ('150524', '150524', '库伦旗', '150500', '1');
INSERT INTO `sys_area` VALUES ('150525', '150525', '奈曼旗', '150500', '1');
INSERT INTO `sys_area` VALUES ('150526', '150526', '扎鲁特旗', '150500', '1');
INSERT INTO `sys_area` VALUES ('150581', '150581', '霍林郭勒市', '150500', '1');
INSERT INTO `sys_area` VALUES ('150600', '150600', '鄂尔多斯市', '150000', '1');
INSERT INTO `sys_area` VALUES ('150602', '150602', '东胜区', '150600', '1');
INSERT INTO `sys_area` VALUES ('150621', '150621', '达拉特旗', '150600', '1');
INSERT INTO `sys_area` VALUES ('150622', '150622', '准格尔旗', '150600', '1');
INSERT INTO `sys_area` VALUES ('150623', '150623', '鄂托克前旗', '150600', '1');
INSERT INTO `sys_area` VALUES ('150624', '150624', '鄂托克旗', '150600', '1');
INSERT INTO `sys_area` VALUES ('150625', '150625', '杭锦旗', '150600', '1');
INSERT INTO `sys_area` VALUES ('150626', '150626', '乌审旗', '150600', '1');
INSERT INTO `sys_area` VALUES ('150627', '150627', '伊金霍洛旗', '150600', '1');
INSERT INTO `sys_area` VALUES ('150700', '150700', '呼伦贝尔市', '150000', '1');
INSERT INTO `sys_area` VALUES ('150702', '150702', '海拉尔区', '150700', '1');
INSERT INTO `sys_area` VALUES ('150721', '150721', '阿荣旗', '150700', '1');
INSERT INTO `sys_area` VALUES ('150722', '150722', '莫力达瓦达斡尔族自治旗', '150700', '1');
INSERT INTO `sys_area` VALUES ('150723', '150723', '鄂伦春自治旗', '150700', '1');
INSERT INTO `sys_area` VALUES ('150724', '150724', '鄂温克族自治旗', '150700', '1');
INSERT INTO `sys_area` VALUES ('150725', '150725', '陈巴尔虎旗', '150700', '1');
INSERT INTO `sys_area` VALUES ('150726', '150726', '新巴尔虎左旗', '150700', '1');
INSERT INTO `sys_area` VALUES ('150727', '150727', '新巴尔虎右旗', '150700', '1');
INSERT INTO `sys_area` VALUES ('150781', '150781', '满洲里市', '150700', '1');
INSERT INTO `sys_area` VALUES ('150782', '150782', '牙克石市', '150700', '1');
INSERT INTO `sys_area` VALUES ('150783', '150783', '扎兰屯市', '150700', '1');
INSERT INTO `sys_area` VALUES ('150784', '150784', '额尔古纳市', '150700', '1');
INSERT INTO `sys_area` VALUES ('150785', '150785', '根河市', '150700', '1');
INSERT INTO `sys_area` VALUES ('150800', '150800', '巴彦淖尔市', '150000', '1');
INSERT INTO `sys_area` VALUES ('150802', '150802', '临河区', '150800', '1');
INSERT INTO `sys_area` VALUES ('150821', '150821', '五原县', '150800', '1');
INSERT INTO `sys_area` VALUES ('150822', '150822', '磴口县', '150800', '1');
INSERT INTO `sys_area` VALUES ('150823', '150823', '乌拉特前旗', '150800', '1');
INSERT INTO `sys_area` VALUES ('150824', '150824', '乌拉特中旗', '150800', '1');
INSERT INTO `sys_area` VALUES ('150825', '150825', '乌拉特后旗', '150800', '1');
INSERT INTO `sys_area` VALUES ('150826', '150826', '杭锦后旗', '150800', '1');
INSERT INTO `sys_area` VALUES ('150900', '150900', '乌兰察布市', '150000', '1');
INSERT INTO `sys_area` VALUES ('150902', '150902', '集宁区', '150900', '1');
INSERT INTO `sys_area` VALUES ('150921', '150921', '卓资县', '150900', '1');
INSERT INTO `sys_area` VALUES ('150922', '150922', '化德县', '150900', '1');
INSERT INTO `sys_area` VALUES ('150923', '150923', '商都县', '150900', '1');
INSERT INTO `sys_area` VALUES ('150924', '150924', '兴和县', '150900', '1');
INSERT INTO `sys_area` VALUES ('150925', '150925', '凉城县', '150900', '1');
INSERT INTO `sys_area` VALUES ('150926', '150926', '察哈尔右翼前旗', '150900', '1');
INSERT INTO `sys_area` VALUES ('150927', '150927', '察哈尔右翼中旗', '150900', '1');
INSERT INTO `sys_area` VALUES ('150928', '150928', '察哈尔右翼后旗', '150900', '1');
INSERT INTO `sys_area` VALUES ('150929', '150929', '四子王旗', '150900', '1');
INSERT INTO `sys_area` VALUES ('150981', '150981', '丰镇市', '150900', '1');
INSERT INTO `sys_area` VALUES ('152200', '152200', '兴安盟', '150000', '1');
INSERT INTO `sys_area` VALUES ('152201', '152201', '乌兰浩特市', '152200', '1');
INSERT INTO `sys_area` VALUES ('152202', '152202', '阿尔山市', '152200', '1');
INSERT INTO `sys_area` VALUES ('152221', '152221', '科尔沁右翼前旗', '152200', '1');
INSERT INTO `sys_area` VALUES ('152222', '152222', '科尔沁右翼中旗', '152200', '1');
INSERT INTO `sys_area` VALUES ('152223', '152223', '扎赉特旗', '152200', '1');
INSERT INTO `sys_area` VALUES ('152224', '152224', '突泉县', '152200', '1');
INSERT INTO `sys_area` VALUES ('152500', '152500', '锡林郭勒盟', '150000', '1');
INSERT INTO `sys_area` VALUES ('152501', '152501', '二连浩特市', '152500', '1');
INSERT INTO `sys_area` VALUES ('152502', '152502', '锡林浩特市', '152500', '1');
INSERT INTO `sys_area` VALUES ('152522', '152522', '阿巴嘎旗', '152500', '1');
INSERT INTO `sys_area` VALUES ('152523', '152523', '苏尼特左旗', '152500', '1');
INSERT INTO `sys_area` VALUES ('152524', '152524', '苏尼特右旗', '152500', '1');
INSERT INTO `sys_area` VALUES ('152525', '152525', '东乌珠穆沁旗', '152500', '1');
INSERT INTO `sys_area` VALUES ('152526', '152526', '西乌珠穆沁旗', '152500', '1');
INSERT INTO `sys_area` VALUES ('152527', '152527', '太仆寺旗', '152500', '1');
INSERT INTO `sys_area` VALUES ('152528', '152528', '镶黄旗', '152500', '1');
INSERT INTO `sys_area` VALUES ('152529', '152529', '正镶白旗', '152500', '1');
INSERT INTO `sys_area` VALUES ('152530', '152530', '正蓝旗', '152500', '1');
INSERT INTO `sys_area` VALUES ('152531', '152531', '多伦县', '152500', '1');
INSERT INTO `sys_area` VALUES ('152900', '152900', '阿拉善盟', '150000', '1');
INSERT INTO `sys_area` VALUES ('152921', '152921', '阿拉善左旗', '152900', '1');
INSERT INTO `sys_area` VALUES ('152922', '152922', '阿拉善右旗', '152900', '1');
INSERT INTO `sys_area` VALUES ('152923', '152923', '额济纳旗', '152900', '1');
INSERT INTO `sys_area` VALUES ('210000', '210000', '辽宁省', '0', '1');
INSERT INTO `sys_area` VALUES ('210100', '210100', '沈阳市', '210000', '1');
INSERT INTO `sys_area` VALUES ('210102', '210102', '和平区', '210100', '1');
INSERT INTO `sys_area` VALUES ('210103', '210103', '沈河区', '210100', '1');
INSERT INTO `sys_area` VALUES ('210104', '210104', '大东区', '210100', '1');
INSERT INTO `sys_area` VALUES ('210105', '210105', '皇姑区', '210100', '1');
INSERT INTO `sys_area` VALUES ('210106', '210106', '铁西区', '210100', '1');
INSERT INTO `sys_area` VALUES ('210111', '210111', '苏家屯区', '210100', '1');
INSERT INTO `sys_area` VALUES ('210112', '210112', '东陵区', '210100', '1');
INSERT INTO `sys_area` VALUES ('210113', '210113', '沈北新区', '210100', '1');
INSERT INTO `sys_area` VALUES ('210114', '210114', '于洪区', '210100', '1');
INSERT INTO `sys_area` VALUES ('210122', '210122', '辽中县', '210100', '1');
INSERT INTO `sys_area` VALUES ('210123', '210123', '康平县', '210100', '1');
INSERT INTO `sys_area` VALUES ('210124', '210124', '法库县', '210100', '1');
INSERT INTO `sys_area` VALUES ('210181', '210181', '新民市', '210100', '1');
INSERT INTO `sys_area` VALUES ('210200', '210200', '大连市', '210000', '1');
INSERT INTO `sys_area` VALUES ('210202', '210202', '中山区', '210200', '1');
INSERT INTO `sys_area` VALUES ('210203', '210203', '西岗区', '210200', '1');
INSERT INTO `sys_area` VALUES ('210204', '210204', '沙河口区', '210200', '1');
INSERT INTO `sys_area` VALUES ('210211', '210211', '甘井子区', '210200', '1');
INSERT INTO `sys_area` VALUES ('210212', '210212', '旅顺口区', '210200', '1');
INSERT INTO `sys_area` VALUES ('210213', '210213', '金州区', '210200', '1');
INSERT INTO `sys_area` VALUES ('210224', '210224', '长海县', '210200', '1');
INSERT INTO `sys_area` VALUES ('210281', '210281', '瓦房店市', '210200', '1');
INSERT INTO `sys_area` VALUES ('210282', '210282', '普兰店市', '210200', '1');
INSERT INTO `sys_area` VALUES ('210283', '210283', '庄河市', '210200', '1');
INSERT INTO `sys_area` VALUES ('210284', '210284', '高新园区', '210200', '1');
INSERT INTO `sys_area` VALUES ('210285', '210285', '开发区', '210200', '1');
INSERT INTO `sys_area` VALUES ('210300', '210300', '鞍山市', '210000', '1');
INSERT INTO `sys_area` VALUES ('210302', '210302', '铁东区', '210300', '1');
INSERT INTO `sys_area` VALUES ('210303', '210303', '铁西区', '210300', '1');
INSERT INTO `sys_area` VALUES ('210304', '210304', '立山区', '210300', '1');
INSERT INTO `sys_area` VALUES ('210311', '210311', '千山区', '210300', '1');
INSERT INTO `sys_area` VALUES ('210321', '210321', '台安县', '210300', '1');
INSERT INTO `sys_area` VALUES ('210323', '210323', '岫岩满族自治县', '210300', '1');
INSERT INTO `sys_area` VALUES ('210381', '210381', '海城市', '210300', '1');
INSERT INTO `sys_area` VALUES ('210400', '210400', '抚顺市', '210000', '1');
INSERT INTO `sys_area` VALUES ('210402', '210402', '新抚区', '210400', '1');
INSERT INTO `sys_area` VALUES ('210403', '210403', '东洲区', '210400', '1');
INSERT INTO `sys_area` VALUES ('210404', '210404', '望花区', '210400', '1');
INSERT INTO `sys_area` VALUES ('210411', '210411', '顺城区', '210400', '1');
INSERT INTO `sys_area` VALUES ('210421', '210421', '抚顺县', '210400', '1');
INSERT INTO `sys_area` VALUES ('210422', '210422', '新宾满族自治县', '210400', '1');
INSERT INTO `sys_area` VALUES ('210423', '210423', '清原满族自治县', '210400', '1');
INSERT INTO `sys_area` VALUES ('210500', '210500', '本溪市', '210000', '1');
INSERT INTO `sys_area` VALUES ('210502', '210502', '平山区', '210500', '1');
INSERT INTO `sys_area` VALUES ('210503', '210503', '溪湖区', '210500', '1');
INSERT INTO `sys_area` VALUES ('210504', '210504', '明山区', '210500', '1');
INSERT INTO `sys_area` VALUES ('210505', '210505', '南芬区', '210500', '1');
INSERT INTO `sys_area` VALUES ('210521', '210521', '本溪满族自治县', '210500', '1');
INSERT INTO `sys_area` VALUES ('210522', '210522', '桓仁满族自治县', '210500', '1');
INSERT INTO `sys_area` VALUES ('210600', '210600', '丹东市', '210000', '1');
INSERT INTO `sys_area` VALUES ('210602', '210602', '元宝区', '210600', '1');
INSERT INTO `sys_area` VALUES ('210603', '210603', '振兴区', '210600', '1');
INSERT INTO `sys_area` VALUES ('210604', '210604', '振安区', '210600', '1');
INSERT INTO `sys_area` VALUES ('210624', '210624', '宽甸满族自治县', '210600', '1');
INSERT INTO `sys_area` VALUES ('210681', '210681', '东港市', '210600', '1');
INSERT INTO `sys_area` VALUES ('210682', '210682', '凤城市', '210600', '1');
INSERT INTO `sys_area` VALUES ('210700', '210700', '锦州市', '210000', '1');
INSERT INTO `sys_area` VALUES ('210702', '210702', '古塔区', '210700', '1');
INSERT INTO `sys_area` VALUES ('210703', '210703', '凌河区', '210700', '1');
INSERT INTO `sys_area` VALUES ('210711', '210711', '太和区', '210700', '1');
INSERT INTO `sys_area` VALUES ('210726', '210726', '黑山县', '210700', '1');
INSERT INTO `sys_area` VALUES ('210727', '210727', '义县', '210700', '1');
INSERT INTO `sys_area` VALUES ('210781', '210781', '凌海市', '210700', '1');
INSERT INTO `sys_area` VALUES ('210782', '210782', '北镇市', '210700', '1');
INSERT INTO `sys_area` VALUES ('210800', '210800', '营口市', '210000', '1');
INSERT INTO `sys_area` VALUES ('210802', '210802', '站前区', '210800', '1');
INSERT INTO `sys_area` VALUES ('210803', '210803', '西市区', '210800', '1');
INSERT INTO `sys_area` VALUES ('210804', '210804', '鲅鱼圈区', '210800', '1');
INSERT INTO `sys_area` VALUES ('210811', '210811', '老边区', '210800', '1');
INSERT INTO `sys_area` VALUES ('210881', '210881', '盖州市', '210800', '1');
INSERT INTO `sys_area` VALUES ('210882', '210882', '大石桥市', '210800', '1');
INSERT INTO `sys_area` VALUES ('210900', '210900', '阜新市', '210000', '1');
INSERT INTO `sys_area` VALUES ('210902', '210902', '海州区', '210900', '1');
INSERT INTO `sys_area` VALUES ('210903', '210903', '新邱区', '210900', '1');
INSERT INTO `sys_area` VALUES ('210904', '210904', '太平区', '210900', '1');
INSERT INTO `sys_area` VALUES ('210905', '210905', '清河门区', '210900', '1');
INSERT INTO `sys_area` VALUES ('210911', '210911', '细河区', '210900', '1');
INSERT INTO `sys_area` VALUES ('210921', '210921', '阜新蒙古族自治县', '210900', '1');
INSERT INTO `sys_area` VALUES ('210922', '210922', '彰武县', '210900', '1');
INSERT INTO `sys_area` VALUES ('211000', '211000', '辽阳市', '210000', '1');
INSERT INTO `sys_area` VALUES ('211002', '211002', '白塔区', '211000', '1');
INSERT INTO `sys_area` VALUES ('211003', '211003', '文圣区', '211000', '1');
INSERT INTO `sys_area` VALUES ('211004', '211004', '宏伟区', '211000', '1');
INSERT INTO `sys_area` VALUES ('211005', '211005', '弓长岭区', '211000', '1');
INSERT INTO `sys_area` VALUES ('211011', '211011', '太子河区', '211000', '1');
INSERT INTO `sys_area` VALUES ('211021', '211021', '辽阳县', '211000', '1');
INSERT INTO `sys_area` VALUES ('211081', '211081', '灯塔市', '211000', '1');
INSERT INTO `sys_area` VALUES ('211100', '211100', '盘锦市', '210000', '1');
INSERT INTO `sys_area` VALUES ('211102', '211102', '双台子区', '211100', '1');
INSERT INTO `sys_area` VALUES ('211103', '211103', '兴隆台区', '211100', '1');
INSERT INTO `sys_area` VALUES ('211121', '211121', '大洼县', '211100', '1');
INSERT INTO `sys_area` VALUES ('211122', '211122', '盘山县', '211100', '1');
INSERT INTO `sys_area` VALUES ('211200', '211200', '铁岭市', '210000', '1');
INSERT INTO `sys_area` VALUES ('211202', '211202', '银州区', '211200', '1');
INSERT INTO `sys_area` VALUES ('211204', '211204', '清河区', '211200', '1');
INSERT INTO `sys_area` VALUES ('211221', '211221', '铁岭县', '211200', '1');
INSERT INTO `sys_area` VALUES ('211223', '211223', '西丰县', '211200', '1');
INSERT INTO `sys_area` VALUES ('211224', '211224', '昌图县', '211200', '1');
INSERT INTO `sys_area` VALUES ('211281', '211281', '调兵山市', '211200', '1');
INSERT INTO `sys_area` VALUES ('211282', '211282', '开原市', '211200', '1');
INSERT INTO `sys_area` VALUES ('211300', '211300', '朝阳市', '210000', '1');
INSERT INTO `sys_area` VALUES ('211302', '211302', '双塔区', '211300', '1');
INSERT INTO `sys_area` VALUES ('211303', '211303', '龙城区', '211300', '1');
INSERT INTO `sys_area` VALUES ('211321', '211321', '朝阳县', '211300', '1');
INSERT INTO `sys_area` VALUES ('211322', '211322', '建平县', '211300', '1');
INSERT INTO `sys_area` VALUES ('211324', '211324', '喀喇沁左翼蒙古族自治县', '211300', '1');
INSERT INTO `sys_area` VALUES ('211381', '211381', '北票市', '211300', '1');
INSERT INTO `sys_area` VALUES ('211382', '211382', '凌源市', '211300', '1');
INSERT INTO `sys_area` VALUES ('211400', '211400', '葫芦岛市', '210000', '1');
INSERT INTO `sys_area` VALUES ('211402', '211402', '连山区', '211400', '1');
INSERT INTO `sys_area` VALUES ('211403', '211403', '龙港区', '211400', '1');
INSERT INTO `sys_area` VALUES ('211404', '211404', '南票区', '211400', '1');
INSERT INTO `sys_area` VALUES ('211421', '211421', '绥中县', '211400', '1');
INSERT INTO `sys_area` VALUES ('211422', '211422', '建昌县', '211400', '1');
INSERT INTO `sys_area` VALUES ('211481', '211481', '兴城市', '211400', '1');
INSERT INTO `sys_area` VALUES ('220000', '220000', '吉林省', '0', '1');
INSERT INTO `sys_area` VALUES ('220100', '220100', '长春市', '220000', '1');
INSERT INTO `sys_area` VALUES ('220102', '220102', '南关区', '220100', '1');
INSERT INTO `sys_area` VALUES ('220103', '220103', '宽城区', '220100', '1');
INSERT INTO `sys_area` VALUES ('220104', '220104', '朝阳区', '220100', '1');
INSERT INTO `sys_area` VALUES ('220105', '220105', '二道区', '220100', '1');
INSERT INTO `sys_area` VALUES ('220106', '220106', '绿园区', '220100', '1');
INSERT INTO `sys_area` VALUES ('220112', '220112', '双阳区', '220100', '1');
INSERT INTO `sys_area` VALUES ('220122', '220122', '农安县', '220100', '1');
INSERT INTO `sys_area` VALUES ('220181', '220181', '九台市', '220100', '1');
INSERT INTO `sys_area` VALUES ('220182', '220182', '榆树市', '220100', '1');
INSERT INTO `sys_area` VALUES ('220183', '220183', '德惠市', '220100', '1');
INSERT INTO `sys_area` VALUES ('220200', '220200', '吉林市', '220000', '1');
INSERT INTO `sys_area` VALUES ('220202', '220202', '昌邑区', '220200', '1');
INSERT INTO `sys_area` VALUES ('220203', '220203', '龙潭区', '220200', '1');
INSERT INTO `sys_area` VALUES ('220204', '220204', '船营区', '220200', '1');
INSERT INTO `sys_area` VALUES ('220211', '220211', '丰满区', '220200', '1');
INSERT INTO `sys_area` VALUES ('220221', '220221', '永吉县', '220200', '1');
INSERT INTO `sys_area` VALUES ('220281', '220281', '蛟河市', '220200', '1');
INSERT INTO `sys_area` VALUES ('220282', '220282', '桦甸市', '220200', '1');
INSERT INTO `sys_area` VALUES ('220283', '220283', '舒兰市', '220200', '1');
INSERT INTO `sys_area` VALUES ('220284', '220284', '磐石市', '220200', '1');
INSERT INTO `sys_area` VALUES ('220300', '220300', '四平市', '220000', '1');
INSERT INTO `sys_area` VALUES ('220302', '220302', '铁西区', '220300', '1');
INSERT INTO `sys_area` VALUES ('220303', '220303', '铁东区', '220300', '1');
INSERT INTO `sys_area` VALUES ('220322', '220322', '梨树县', '220300', '1');
INSERT INTO `sys_area` VALUES ('220323', '220323', '伊通满族自治县', '220300', '1');
INSERT INTO `sys_area` VALUES ('220381', '220381', '公主岭市', '220300', '1');
INSERT INTO `sys_area` VALUES ('220382', '220382', '双辽市', '220300', '1');
INSERT INTO `sys_area` VALUES ('220400', '220400', '辽源市', '220000', '1');
INSERT INTO `sys_area` VALUES ('220402', '220402', '龙山区', '220400', '1');
INSERT INTO `sys_area` VALUES ('220403', '220403', '西安区', '220400', '1');
INSERT INTO `sys_area` VALUES ('220421', '220421', '东丰县', '220400', '1');
INSERT INTO `sys_area` VALUES ('220422', '220422', '东辽县', '220400', '1');
INSERT INTO `sys_area` VALUES ('220500', '220500', '通化市', '220000', '1');
INSERT INTO `sys_area` VALUES ('220502', '220502', '东昌区', '220500', '1');
INSERT INTO `sys_area` VALUES ('220503', '220503', '二道江区', '220500', '1');
INSERT INTO `sys_area` VALUES ('220521', '220521', '通化县', '220500', '1');
INSERT INTO `sys_area` VALUES ('220523', '220523', '辉南县', '220500', '1');
INSERT INTO `sys_area` VALUES ('220524', '220524', '柳河县', '220500', '1');
INSERT INTO `sys_area` VALUES ('220581', '220581', '梅河口市', '220500', '1');
INSERT INTO `sys_area` VALUES ('220582', '220582', '集安市', '220500', '1');
INSERT INTO `sys_area` VALUES ('220600', '220600', '白山市', '220000', '1');
INSERT INTO `sys_area` VALUES ('220602', '220602', '八道江区', '220600', '1');
INSERT INTO `sys_area` VALUES ('220621', '220621', '抚松县', '220600', '1');
INSERT INTO `sys_area` VALUES ('220622', '220622', '靖宇县', '220600', '1');
INSERT INTO `sys_area` VALUES ('220623', '220623', '长白朝鲜族自治县', '220600', '1');
INSERT INTO `sys_area` VALUES ('220625', '220625', '江源区', '220600', '1');
INSERT INTO `sys_area` VALUES ('220681', '220681', '临江市', '220600', '1');
INSERT INTO `sys_area` VALUES ('220700', '220700', '松原市', '220000', '1');
INSERT INTO `sys_area` VALUES ('220702', '220702', '宁江区', '220700', '1');
INSERT INTO `sys_area` VALUES ('220721', '220721', '前郭尔罗斯蒙古族自治县', '220700', '1');
INSERT INTO `sys_area` VALUES ('220722', '220722', '长岭县', '220700', '1');
INSERT INTO `sys_area` VALUES ('220723', '220723', '乾安县', '220700', '1');
INSERT INTO `sys_area` VALUES ('220724', '220724', '扶余县', '220700', '1');
INSERT INTO `sys_area` VALUES ('220800', '220800', '白城市', '220000', '1');
INSERT INTO `sys_area` VALUES ('220802', '220802', '洮北区', '220800', '1');
INSERT INTO `sys_area` VALUES ('220821', '220821', '镇赉县', '220800', '1');
INSERT INTO `sys_area` VALUES ('220822', '220822', '通榆县', '220800', '1');
INSERT INTO `sys_area` VALUES ('220881', '220881', '洮南市', '220800', '1');
INSERT INTO `sys_area` VALUES ('220882', '220882', '大安市', '220800', '1');
INSERT INTO `sys_area` VALUES ('222400', '222400', '延边朝鲜族自治州', '220000', '1');
INSERT INTO `sys_area` VALUES ('222401', '222401', '延吉市', '222400', '1');
INSERT INTO `sys_area` VALUES ('222402', '222402', '图们市', '222400', '1');
INSERT INTO `sys_area` VALUES ('222403', '222403', '敦化市', '222400', '1');
INSERT INTO `sys_area` VALUES ('222404', '222404', '珲春市', '222400', '1');
INSERT INTO `sys_area` VALUES ('222405', '222405', '龙井市', '222400', '1');
INSERT INTO `sys_area` VALUES ('222406', '222406', '和龙市', '222400', '1');
INSERT INTO `sys_area` VALUES ('222424', '222424', '汪清县', '222400', '1');
INSERT INTO `sys_area` VALUES ('222426', '222426', '安图县', '222400', '1');
INSERT INTO `sys_area` VALUES ('230000', '230000', '黑龙江省', '0', '1');
INSERT INTO `sys_area` VALUES ('230100', '230100', '哈尔滨市', '230000', '1');
INSERT INTO `sys_area` VALUES ('230102', '230102', '道里区', '230100', '1');
INSERT INTO `sys_area` VALUES ('230103', '230103', '南岗区', '230100', '1');
INSERT INTO `sys_area` VALUES ('230104', '230104', '道外区', '230100', '1');
INSERT INTO `sys_area` VALUES ('230107', '230107', '动力区', '230100', '1');
INSERT INTO `sys_area` VALUES ('230108', '230108', '平房区', '230100', '1');
INSERT INTO `sys_area` VALUES ('230109', '230109', '松北区', '230100', '1');
INSERT INTO `sys_area` VALUES ('230110', '230110', '香坊区', '230100', '1');
INSERT INTO `sys_area` VALUES ('230111', '230111', '呼兰区', '230100', '1');
INSERT INTO `sys_area` VALUES ('230112', '230112', '阿城区', '230100', '1');
INSERT INTO `sys_area` VALUES ('230123', '230123', '依兰县', '230100', '1');
INSERT INTO `sys_area` VALUES ('230124', '230124', '方正县', '230100', '1');
INSERT INTO `sys_area` VALUES ('230125', '230125', '宾县', '230100', '1');
INSERT INTO `sys_area` VALUES ('230126', '230126', '巴彦县', '230100', '1');
INSERT INTO `sys_area` VALUES ('230127', '230127', '木兰县', '230100', '1');
INSERT INTO `sys_area` VALUES ('230128', '230128', '通河县', '230100', '1');
INSERT INTO `sys_area` VALUES ('230129', '230129', '延寿县', '230100', '1');
INSERT INTO `sys_area` VALUES ('230182', '230182', '双城市', '230100', '1');
INSERT INTO `sys_area` VALUES ('230183', '230183', '尚志市', '230100', '1');
INSERT INTO `sys_area` VALUES ('230184', '230184', '五常市', '230100', '1');
INSERT INTO `sys_area` VALUES ('230200', '230200', '齐齐哈尔市', '230000', '1');
INSERT INTO `sys_area` VALUES ('230202', '230202', '龙沙区', '230200', '1');
INSERT INTO `sys_area` VALUES ('230203', '230203', '建华区', '230200', '1');
INSERT INTO `sys_area` VALUES ('230204', '230204', '铁锋区', '230200', '1');
INSERT INTO `sys_area` VALUES ('230205', '230205', '昂昂溪区', '230200', '1');
INSERT INTO `sys_area` VALUES ('230206', '230206', '富拉尔基区', '230200', '1');
INSERT INTO `sys_area` VALUES ('230207', '230207', '碾子山区', '230200', '1');
INSERT INTO `sys_area` VALUES ('230208', '230208', '梅里斯达斡尔族区', '230200', '1');
INSERT INTO `sys_area` VALUES ('230221', '230221', '龙江县', '230200', '1');
INSERT INTO `sys_area` VALUES ('230223', '230223', '依安县', '230200', '1');
INSERT INTO `sys_area` VALUES ('230224', '230224', '泰来县', '230200', '1');
INSERT INTO `sys_area` VALUES ('230225', '230225', '甘南县', '230200', '1');
INSERT INTO `sys_area` VALUES ('230227', '230227', '富裕县', '230200', '1');
INSERT INTO `sys_area` VALUES ('230229', '230229', '克山县', '230200', '1');
INSERT INTO `sys_area` VALUES ('230230', '230230', '克东县', '230200', '1');
INSERT INTO `sys_area` VALUES ('230231', '230231', '拜泉县', '230200', '1');
INSERT INTO `sys_area` VALUES ('230281', '230281', '讷河市', '230200', '1');
INSERT INTO `sys_area` VALUES ('230300', '230300', '鸡西市', '230000', '1');
INSERT INTO `sys_area` VALUES ('230302', '230302', '鸡冠区', '230300', '1');
INSERT INTO `sys_area` VALUES ('230303', '230303', '恒山区', '230300', '1');
INSERT INTO `sys_area` VALUES ('230304', '230304', '滴道区', '230300', '1');
INSERT INTO `sys_area` VALUES ('230305', '230305', '梨树区', '230300', '1');
INSERT INTO `sys_area` VALUES ('230306', '230306', '城子河区', '230300', '1');
INSERT INTO `sys_area` VALUES ('230307', '230307', '麻山区', '230300', '1');
INSERT INTO `sys_area` VALUES ('230321', '230321', '鸡东县', '230300', '1');
INSERT INTO `sys_area` VALUES ('230381', '230381', '虎林市', '230300', '1');
INSERT INTO `sys_area` VALUES ('230382', '230382', '密山市', '230300', '1');
INSERT INTO `sys_area` VALUES ('230400', '230400', '鹤岗市', '230000', '1');
INSERT INTO `sys_area` VALUES ('230402', '230402', '向阳区', '230400', '1');
INSERT INTO `sys_area` VALUES ('230403', '230403', '工农区', '230400', '1');
INSERT INTO `sys_area` VALUES ('230404', '230404', '南山区', '230400', '1');
INSERT INTO `sys_area` VALUES ('230405', '230405', '兴安区', '230400', '1');
INSERT INTO `sys_area` VALUES ('230406', '230406', '东山区', '230400', '1');
INSERT INTO `sys_area` VALUES ('230407', '230407', '兴山区', '230400', '1');
INSERT INTO `sys_area` VALUES ('230421', '230421', '萝北县', '230400', '1');
INSERT INTO `sys_area` VALUES ('230422', '230422', '绥滨县', '230400', '1');
INSERT INTO `sys_area` VALUES ('230500', '230500', '双鸭山市', '230000', '1');
INSERT INTO `sys_area` VALUES ('230502', '230502', '尖山区', '230500', '1');
INSERT INTO `sys_area` VALUES ('230503', '230503', '岭东区', '230500', '1');
INSERT INTO `sys_area` VALUES ('230505', '230505', '四方台区', '230500', '1');
INSERT INTO `sys_area` VALUES ('230506', '230506', '宝山区', '230500', '1');
INSERT INTO `sys_area` VALUES ('230521', '230521', '集贤县', '230500', '1');
INSERT INTO `sys_area` VALUES ('230522', '230522', '友谊县', '230500', '1');
INSERT INTO `sys_area` VALUES ('230523', '230523', '宝清县', '230500', '1');
INSERT INTO `sys_area` VALUES ('230524', '230524', '饶河县', '230500', '1');
INSERT INTO `sys_area` VALUES ('230600', '230600', '大庆市', '230000', '1');
INSERT INTO `sys_area` VALUES ('230602', '230602', '萨尔图区', '230600', '1');
INSERT INTO `sys_area` VALUES ('230603', '230603', '龙凤区', '230600', '1');
INSERT INTO `sys_area` VALUES ('230604', '230604', '让胡路区', '230600', '1');
INSERT INTO `sys_area` VALUES ('230605', '230605', '红岗区', '230600', '1');
INSERT INTO `sys_area` VALUES ('230606', '230606', '大同区', '230600', '1');
INSERT INTO `sys_area` VALUES ('230621', '230621', '肇州县', '230600', '1');
INSERT INTO `sys_area` VALUES ('230622', '230622', '肇源县', '230600', '1');
INSERT INTO `sys_area` VALUES ('230623', '230623', '林甸县', '230600', '1');
INSERT INTO `sys_area` VALUES ('230624', '230624', '杜尔伯特蒙古族自治县', '230600', '1');
INSERT INTO `sys_area` VALUES ('230700', '230700', '伊春市', '230000', '1');
INSERT INTO `sys_area` VALUES ('230702', '230702', '伊春区', '230700', '1');
INSERT INTO `sys_area` VALUES ('230703', '230703', '南岔区', '230700', '1');
INSERT INTO `sys_area` VALUES ('230704', '230704', '友好区', '230700', '1');
INSERT INTO `sys_area` VALUES ('230705', '230705', '西林区', '230700', '1');
INSERT INTO `sys_area` VALUES ('230706', '230706', '翠峦区', '230700', '1');
INSERT INTO `sys_area` VALUES ('230707', '230707', '新青区', '230700', '1');
INSERT INTO `sys_area` VALUES ('230708', '230708', '美溪区', '230700', '1');
INSERT INTO `sys_area` VALUES ('230709', '230709', '金山屯区', '230700', '1');
INSERT INTO `sys_area` VALUES ('230710', '230710', '五营区', '230700', '1');
INSERT INTO `sys_area` VALUES ('230711', '230711', '乌马河区', '230700', '1');
INSERT INTO `sys_area` VALUES ('230712', '230712', '汤旺河区', '230700', '1');
INSERT INTO `sys_area` VALUES ('230713', '230713', '带岭区', '230700', '1');
INSERT INTO `sys_area` VALUES ('230714', '230714', '乌伊岭区', '230700', '1');
INSERT INTO `sys_area` VALUES ('230715', '230715', '红星区', '230700', '1');
INSERT INTO `sys_area` VALUES ('230716', '230716', '上甘岭区', '230700', '1');
INSERT INTO `sys_area` VALUES ('230722', '230722', '嘉荫县', '230700', '1');
INSERT INTO `sys_area` VALUES ('230781', '230781', '铁力市', '230700', '1');
INSERT INTO `sys_area` VALUES ('230800', '230800', '佳木斯市', '230000', '1');
INSERT INTO `sys_area` VALUES ('230802', '230802', '永红区', '230800', '1');
INSERT INTO `sys_area` VALUES ('230803', '230803', '向阳区', '230800', '1');
INSERT INTO `sys_area` VALUES ('230804', '230804', '前进区', '230800', '1');
INSERT INTO `sys_area` VALUES ('230805', '230805', '东风区', '230800', '1');
INSERT INTO `sys_area` VALUES ('230811', '230811', '郊区', '230800', '1');
INSERT INTO `sys_area` VALUES ('230822', '230822', '桦南县', '230800', '1');
INSERT INTO `sys_area` VALUES ('230826', '230826', '桦川县', '230800', '1');
INSERT INTO `sys_area` VALUES ('230828', '230828', '汤原县', '230800', '1');
INSERT INTO `sys_area` VALUES ('230833', '230833', '抚远县', '230800', '1');
INSERT INTO `sys_area` VALUES ('230881', '230881', '同江市', '230800', '1');
INSERT INTO `sys_area` VALUES ('230882', '230882', '富锦市', '230800', '1');
INSERT INTO `sys_area` VALUES ('230900', '230900', '七台河市', '230000', '1');
INSERT INTO `sys_area` VALUES ('230902', '230902', '新兴区', '230900', '1');
INSERT INTO `sys_area` VALUES ('230903', '230903', '桃山区', '230900', '1');
INSERT INTO `sys_area` VALUES ('230904', '230904', '茄子河区', '230900', '1');
INSERT INTO `sys_area` VALUES ('230921', '230921', '勃利县', '230900', '1');
INSERT INTO `sys_area` VALUES ('231000', '231000', '牡丹江市', '230000', '1');
INSERT INTO `sys_area` VALUES ('231002', '231002', '东安区', '231000', '1');
INSERT INTO `sys_area` VALUES ('231003', '231003', '阳明区', '231000', '1');
INSERT INTO `sys_area` VALUES ('231004', '231004', '爱民区', '231000', '1');
INSERT INTO `sys_area` VALUES ('231005', '231005', '西安区', '231000', '1');
INSERT INTO `sys_area` VALUES ('231024', '231024', '东宁县', '231000', '1');
INSERT INTO `sys_area` VALUES ('231025', '231025', '林口县', '231000', '1');
INSERT INTO `sys_area` VALUES ('231081', '231081', '绥芬河市', '231000', '1');
INSERT INTO `sys_area` VALUES ('231083', '231083', '海林市', '231000', '1');
INSERT INTO `sys_area` VALUES ('231084', '231084', '宁安市', '231000', '1');
INSERT INTO `sys_area` VALUES ('231085', '231085', '穆棱市', '231000', '1');
INSERT INTO `sys_area` VALUES ('231100', '231100', '黑河市', '230000', '1');
INSERT INTO `sys_area` VALUES ('231102', '231102', '爱辉区', '231100', '1');
INSERT INTO `sys_area` VALUES ('231121', '231121', '嫩江县', '231100', '1');
INSERT INTO `sys_area` VALUES ('231123', '231123', '逊克县', '231100', '1');
INSERT INTO `sys_area` VALUES ('231124', '231124', '孙吴县', '231100', '1');
INSERT INTO `sys_area` VALUES ('231181', '231181', '北安市', '231100', '1');
INSERT INTO `sys_area` VALUES ('231182', '231182', '五大连池市', '231100', '1');
INSERT INTO `sys_area` VALUES ('231200', '231200', '绥化市', '230000', '1');
INSERT INTO `sys_area` VALUES ('231202', '231202', '北林区', '231200', '1');
INSERT INTO `sys_area` VALUES ('231221', '231221', '望奎县', '231200', '1');
INSERT INTO `sys_area` VALUES ('231222', '231222', '兰西县', '231200', '1');
INSERT INTO `sys_area` VALUES ('231223', '231223', '青冈县', '231200', '1');
INSERT INTO `sys_area` VALUES ('231224', '231224', '庆安县', '231200', '1');
INSERT INTO `sys_area` VALUES ('231225', '231225', '明水县', '231200', '1');
INSERT INTO `sys_area` VALUES ('231226', '231226', '绥棱县', '231200', '1');
INSERT INTO `sys_area` VALUES ('231281', '231281', '安达市', '231200', '1');
INSERT INTO `sys_area` VALUES ('231282', '231282', '肇东市', '231200', '1');
INSERT INTO `sys_area` VALUES ('231283', '231283', '海伦市', '231200', '1');
INSERT INTO `sys_area` VALUES ('232700', '232700', '大兴安岭地区', '230000', '1');
INSERT INTO `sys_area` VALUES ('232721', '232721', '呼玛县', '232700', '1');
INSERT INTO `sys_area` VALUES ('232722', '232722', '塔河县', '232700', '1');
INSERT INTO `sys_area` VALUES ('232723', '232723', '漠河县', '232700', '1');
INSERT INTO `sys_area` VALUES ('310000', '310000', '上海市', '0', '1');
INSERT INTO `sys_area` VALUES ('310100', '310100', '上海市', '310000', '1');
INSERT INTO `sys_area` VALUES ('310101', '310101', '黄浦区', '310100', '1');
INSERT INTO `sys_area` VALUES ('310103', '310103', '卢湾区', '310100', '1');
INSERT INTO `sys_area` VALUES ('310104', '310104', '徐汇区', '310100', '1');
INSERT INTO `sys_area` VALUES ('310105', '310105', '长宁区', '310100', '1');
INSERT INTO `sys_area` VALUES ('310106', '310106', '静安区', '310100', '1');
INSERT INTO `sys_area` VALUES ('310107', '310107', '普陀区', '310100', '1');
INSERT INTO `sys_area` VALUES ('310108', '310108', '闸北区', '310100', '1');
INSERT INTO `sys_area` VALUES ('310109', '310109', '虹口区', '310100', '1');
INSERT INTO `sys_area` VALUES ('310110', '310110', '杨浦区', '310100', '1');
INSERT INTO `sys_area` VALUES ('310112', '310112', '闵行区', '310100', '1');
INSERT INTO `sys_area` VALUES ('310113', '310113', '宝山区', '310100', '1');
INSERT INTO `sys_area` VALUES ('310114', '310114', '嘉定区', '310100', '1');
INSERT INTO `sys_area` VALUES ('310115', '310115', '浦东新区', '310100', '1');
INSERT INTO `sys_area` VALUES ('310116', '310116', '金山区', '310100', '1');
INSERT INTO `sys_area` VALUES ('310117', '310117', '松江区', '310100', '1');
INSERT INTO `sys_area` VALUES ('310118', '310118', '青浦区', '310100', '1');
INSERT INTO `sys_area` VALUES ('310119', '310119', '南汇区', '310100', '1');
INSERT INTO `sys_area` VALUES ('310120', '310120', '奉贤区', '310100', '1');
INSERT INTO `sys_area` VALUES ('310230', '310230', '崇明县', '310100', '1');
INSERT INTO `sys_area` VALUES ('320000', '320000', '江苏省', '0', '1');
INSERT INTO `sys_area` VALUES ('320100', '320100', '南京市', '320000', '1');
INSERT INTO `sys_area` VALUES ('320102', '320102', '玄武区', '320100', '1');
INSERT INTO `sys_area` VALUES ('320103', '320103', '白下区', '320100', '1');
INSERT INTO `sys_area` VALUES ('320104', '320104', '秦淮区', '320100', '1');
INSERT INTO `sys_area` VALUES ('320105', '320105', '建邺区', '320100', '1');
INSERT INTO `sys_area` VALUES ('320106', '320106', '鼓楼区', '320100', '1');
INSERT INTO `sys_area` VALUES ('320107', '320107', '下关区', '320100', '1');
INSERT INTO `sys_area` VALUES ('320111', '320111', '浦口区', '320100', '1');
INSERT INTO `sys_area` VALUES ('320113', '320113', '栖霞区', '320100', '1');
INSERT INTO `sys_area` VALUES ('320114', '320114', '雨花台区', '320100', '1');
INSERT INTO `sys_area` VALUES ('320115', '320115', '江宁区', '320100', '1');
INSERT INTO `sys_area` VALUES ('320116', '320116', '六合区', '320100', '1');
INSERT INTO `sys_area` VALUES ('320124', '320124', '溧水县', '320100', '1');
INSERT INTO `sys_area` VALUES ('320125', '320125', '高淳县', '320100', '1');
INSERT INTO `sys_area` VALUES ('320200', '320200', '无锡市', '320000', '1');
INSERT INTO `sys_area` VALUES ('320202', '320202', '崇安区', '320200', '1');
INSERT INTO `sys_area` VALUES ('320203', '320203', '南长区', '320200', '1');
INSERT INTO `sys_area` VALUES ('320204', '320204', '北塘区', '320200', '1');
INSERT INTO `sys_area` VALUES ('320205', '320205', '锡山区', '320200', '1');
INSERT INTO `sys_area` VALUES ('320206', '320206', '惠山区', '320200', '1');
INSERT INTO `sys_area` VALUES ('320211', '320211', '滨湖区', '320200', '1');
INSERT INTO `sys_area` VALUES ('320281', '320281', '江阴市', '320200', '1');
INSERT INTO `sys_area` VALUES ('320282', '320282', '宜兴市', '320200', '1');
INSERT INTO `sys_area` VALUES ('320300', '320300', '徐州市', '320000', '1');
INSERT INTO `sys_area` VALUES ('320302', '320302', '鼓楼区', '320300', '1');
INSERT INTO `sys_area` VALUES ('320303', '320303', '云龙区', '320300', '1');
INSERT INTO `sys_area` VALUES ('320305', '320305', '贾汪区', '320300', '1');
INSERT INTO `sys_area` VALUES ('320311', '320311', '泉山区', '320300', '1');
INSERT INTO `sys_area` VALUES ('320312', '320312', '铜山区', '320300', '1');
INSERT INTO `sys_area` VALUES ('320321', '320321', '丰县', '320300', '1');
INSERT INTO `sys_area` VALUES ('320322', '320322', '沛县', '320300', '1');
INSERT INTO `sys_area` VALUES ('320324', '320324', '睢宁县', '320300', '1');
INSERT INTO `sys_area` VALUES ('320381', '320381', '新沂市', '320300', '1');
INSERT INTO `sys_area` VALUES ('320382', '320382', '邳州市', '320300', '1');
INSERT INTO `sys_area` VALUES ('320400', '320400', '常州市', '320000', '1');
INSERT INTO `sys_area` VALUES ('320402', '320402', '天宁区', '320400', '1');
INSERT INTO `sys_area` VALUES ('320404', '320404', '钟楼区', '320400', '1');
INSERT INTO `sys_area` VALUES ('320405', '320405', '戚墅堰区', '320400', '1');
INSERT INTO `sys_area` VALUES ('320411', '320411', '新北区', '320400', '1');
INSERT INTO `sys_area` VALUES ('320412', '320412', '武进区', '320400', '1');
INSERT INTO `sys_area` VALUES ('320481', '320481', '溧阳市', '320400', '1');
INSERT INTO `sys_area` VALUES ('320482', '320482', '金坛市', '320400', '1');
INSERT INTO `sys_area` VALUES ('320500', '320500', '苏州市', '320000', '1');
INSERT INTO `sys_area` VALUES ('320502', '320502', '沧浪区', '320500', '1');
INSERT INTO `sys_area` VALUES ('320503', '320503', '平江区', '320500', '1');
INSERT INTO `sys_area` VALUES ('320504', '320504', '金阊区', '320500', '1');
INSERT INTO `sys_area` VALUES ('320505', '320505', '虎丘区', '320500', '1');
INSERT INTO `sys_area` VALUES ('320506', '320506', '吴中区', '320500', '1');
INSERT INTO `sys_area` VALUES ('320507', '320507', '相城区', '320500', '1');
INSERT INTO `sys_area` VALUES ('320508', '320508', '工业园区', '320500', '1');
INSERT INTO `sys_area` VALUES ('320509', '320509', '姑苏区', '320500', '1');
INSERT INTO `sys_area` VALUES ('320581', '320581', '常熟市', '320500', '1');
INSERT INTO `sys_area` VALUES ('320582', '320582', '张家港市', '320500', '1');
INSERT INTO `sys_area` VALUES ('320583', '320583', '昆山市', '320500', '1');
INSERT INTO `sys_area` VALUES ('320584', '320584', '吴江市', '320500', '1');
INSERT INTO `sys_area` VALUES ('320585', '320585', '太仓市', '320500', '1');
INSERT INTO `sys_area` VALUES ('320600', '320600', '南通市', '320000', '1');
INSERT INTO `sys_area` VALUES ('320602', '320602', '崇川区', '320600', '1');
INSERT INTO `sys_area` VALUES ('320611', '320611', '港闸区', '320600', '1');
INSERT INTO `sys_area` VALUES ('320621', '320621', '海安县', '320600', '1');
INSERT INTO `sys_area` VALUES ('320623', '320623', '如东县', '320600', '1');
INSERT INTO `sys_area` VALUES ('320681', '320681', '启东市', '320600', '1');
INSERT INTO `sys_area` VALUES ('320682', '320682', '如皋市', '320600', '1');
INSERT INTO `sys_area` VALUES ('320683', '320683', '通州区', '320600', '1');
INSERT INTO `sys_area` VALUES ('320684', '320684', '海门市', '320600', '1');
INSERT INTO `sys_area` VALUES ('320700', '320700', '连云港市', '320000', '1');
INSERT INTO `sys_area` VALUES ('320703', '320703', '连云区', '320700', '1');
INSERT INTO `sys_area` VALUES ('320705', '320705', '新浦区', '320700', '1');
INSERT INTO `sys_area` VALUES ('320706', '320706', '海州区', '320700', '1');
INSERT INTO `sys_area` VALUES ('320721', '320721', '赣榆县', '320700', '1');
INSERT INTO `sys_area` VALUES ('320722', '320722', '东海县', '320700', '1');
INSERT INTO `sys_area` VALUES ('320723', '320723', '灌云县', '320700', '1');
INSERT INTO `sys_area` VALUES ('320724', '320724', '灌南县', '320700', '1');
INSERT INTO `sys_area` VALUES ('320800', '320800', '淮安市', '320000', '1');
INSERT INTO `sys_area` VALUES ('320802', '320802', '清河区', '320800', '1');
INSERT INTO `sys_area` VALUES ('320803', '320803', '楚州区', '320800', '1');
INSERT INTO `sys_area` VALUES ('320804', '320804', '淮阴区', '320800', '1');
INSERT INTO `sys_area` VALUES ('320811', '320811', '清浦区', '320800', '1');
INSERT INTO `sys_area` VALUES ('320826', '320826', '涟水县', '320800', '1');
INSERT INTO `sys_area` VALUES ('320829', '320829', '洪泽县', '320800', '1');
INSERT INTO `sys_area` VALUES ('320830', '320830', '盱眙县', '320800', '1');
INSERT INTO `sys_area` VALUES ('320831', '320831', '金湖县', '320800', '1');
INSERT INTO `sys_area` VALUES ('320900', '320900', '盐城市', '320000', '1');
INSERT INTO `sys_area` VALUES ('320902', '320902', '亭湖区', '320900', '1');
INSERT INTO `sys_area` VALUES ('320903', '320903', '盐都区', '320900', '1');
INSERT INTO `sys_area` VALUES ('320921', '320921', '响水县', '320900', '1');
INSERT INTO `sys_area` VALUES ('320922', '320922', '滨海县', '320900', '1');
INSERT INTO `sys_area` VALUES ('320923', '320923', '阜宁县', '320900', '1');
INSERT INTO `sys_area` VALUES ('320924', '320924', '射阳县', '320900', '1');
INSERT INTO `sys_area` VALUES ('320925', '320925', '建湖县', '320900', '1');
INSERT INTO `sys_area` VALUES ('320981', '320981', '东台市', '320900', '1');
INSERT INTO `sys_area` VALUES ('320982', '320982', '大丰市', '320900', '1');
INSERT INTO `sys_area` VALUES ('321000', '321000', '扬州市', '320000', '1');
INSERT INTO `sys_area` VALUES ('321002', '321002', '广陵区', '321000', '1');
INSERT INTO `sys_area` VALUES ('321003', '321003', '邗江区', '321000', '1');
INSERT INTO `sys_area` VALUES ('321012', '321012', '江都区', '321000', '1');
INSERT INTO `sys_area` VALUES ('321023', '321023', '宝应县', '321000', '1');
INSERT INTO `sys_area` VALUES ('321081', '321081', '仪征市', '321000', '1');
INSERT INTO `sys_area` VALUES ('321084', '321084', '高邮市', '321000', '1');
INSERT INTO `sys_area` VALUES ('321100', '321100', '镇江市', '320000', '1');
INSERT INTO `sys_area` VALUES ('321102', '321102', '京口区', '321100', '1');
INSERT INTO `sys_area` VALUES ('321111', '321111', '润州区', '321100', '1');
INSERT INTO `sys_area` VALUES ('321112', '321112', '丹徒区', '321100', '1');
INSERT INTO `sys_area` VALUES ('321181', '321181', '丹阳市', '321100', '1');
INSERT INTO `sys_area` VALUES ('321182', '321182', '扬中市', '321100', '1');
INSERT INTO `sys_area` VALUES ('321183', '321183', '句容市', '321100', '1');
INSERT INTO `sys_area` VALUES ('321200', '321200', '泰州市', '320000', '1');
INSERT INTO `sys_area` VALUES ('321202', '321202', '海陵区', '321200', '1');
INSERT INTO `sys_area` VALUES ('321203', '321203', '高港区', '321200', '1');
INSERT INTO `sys_area` VALUES ('321281', '321281', '兴化市', '321200', '1');
INSERT INTO `sys_area` VALUES ('321282', '321282', '靖江市', '321200', '1');
INSERT INTO `sys_area` VALUES ('321283', '321283', '泰兴市', '321200', '1');
INSERT INTO `sys_area` VALUES ('321284', '321284', '姜堰市', '321200', '1');
INSERT INTO `sys_area` VALUES ('321300', '321300', '宿迁市', '320000', '1');
INSERT INTO `sys_area` VALUES ('321302', '321302', '宿城区', '321300', '1');
INSERT INTO `sys_area` VALUES ('321311', '321311', '宿豫区', '321300', '1');
INSERT INTO `sys_area` VALUES ('321322', '321322', '沭阳县', '321300', '1');
INSERT INTO `sys_area` VALUES ('321323', '321323', '泗阳县', '321300', '1');
INSERT INTO `sys_area` VALUES ('321324', '321324', '泗洪县', '321300', '1');
INSERT INTO `sys_area` VALUES ('330000', '330000', '浙江省', '0', '1');
INSERT INTO `sys_area` VALUES ('330100', '330100', '杭州市', '330000', '1');
INSERT INTO `sys_area` VALUES ('330102', '330102', '上城区', '330100', '1');
INSERT INTO `sys_area` VALUES ('330103', '330103', '下城区', '330100', '1');
INSERT INTO `sys_area` VALUES ('330104', '330104', '江干区', '330100', '1');
INSERT INTO `sys_area` VALUES ('330105', '330105', '拱墅区', '330100', '1');
INSERT INTO `sys_area` VALUES ('330106', '330106', '西湖区', '330100', '1');
INSERT INTO `sys_area` VALUES ('330108', '330108', '滨江区', '330100', '1');
INSERT INTO `sys_area` VALUES ('330109', '330109', '萧山区', '330100', '1');
INSERT INTO `sys_area` VALUES ('330110', '330110', '余杭区', '330100', '1');
INSERT INTO `sys_area` VALUES ('330122', '330122', '桐庐县', '330100', '1');
INSERT INTO `sys_area` VALUES ('330127', '330127', '淳安县', '330100', '1');
INSERT INTO `sys_area` VALUES ('330182', '330182', '建德市', '330100', '1');
INSERT INTO `sys_area` VALUES ('330183', '330183', '富阳市', '330100', '1');
INSERT INTO `sys_area` VALUES ('330185', '330185', '临安市', '330100', '1');
INSERT INTO `sys_area` VALUES ('330200', '330200', '宁波市', '330000', '1');
INSERT INTO `sys_area` VALUES ('330203', '330203', '海曙区', '330200', '1');
INSERT INTO `sys_area` VALUES ('330204', '330204', '江东区', '330200', '1');
INSERT INTO `sys_area` VALUES ('330205', '330205', '江北区', '330200', '1');
INSERT INTO `sys_area` VALUES ('330206', '330206', '北仑区', '330200', '1');
INSERT INTO `sys_area` VALUES ('330211', '330211', '镇海区', '330200', '1');
INSERT INTO `sys_area` VALUES ('330212', '330212', '鄞州区', '330200', '1');
INSERT INTO `sys_area` VALUES ('330225', '330225', '象山县', '330200', '1');
INSERT INTO `sys_area` VALUES ('330226', '330226', '宁海县', '330200', '1');
INSERT INTO `sys_area` VALUES ('330281', '330281', '余姚市', '330200', '1');
INSERT INTO `sys_area` VALUES ('330282', '330282', '慈溪市', '330200', '1');
INSERT INTO `sys_area` VALUES ('330283', '330283', '奉化市', '330200', '1');
INSERT INTO `sys_area` VALUES ('330300', '330300', '温州市', '330000', '1');
INSERT INTO `sys_area` VALUES ('330302', '330302', '鹿城区', '330300', '1');
INSERT INTO `sys_area` VALUES ('330303', '330303', '龙湾区', '330300', '1');
INSERT INTO `sys_area` VALUES ('330304', '330304', '瓯海区', '330300', '1');
INSERT INTO `sys_area` VALUES ('330322', '330322', '洞头县', '330300', '1');
INSERT INTO `sys_area` VALUES ('330324', '330324', '永嘉县', '330300', '1');
INSERT INTO `sys_area` VALUES ('330326', '330326', '平阳县', '330300', '1');
INSERT INTO `sys_area` VALUES ('330327', '330327', '苍南县', '330300', '1');
INSERT INTO `sys_area` VALUES ('330328', '330328', '文成县', '330300', '1');
INSERT INTO `sys_area` VALUES ('330329', '330329', '泰顺县', '330300', '1');
INSERT INTO `sys_area` VALUES ('330381', '330381', '瑞安市', '330300', '1');
INSERT INTO `sys_area` VALUES ('330382', '330382', '乐清市', '330300', '1');
INSERT INTO `sys_area` VALUES ('330400', '330400', '嘉兴市', '330000', '1');
INSERT INTO `sys_area` VALUES ('330402', '330402', '南湖区', '330400', '1');
INSERT INTO `sys_area` VALUES ('330411', '330411', '秀洲区', '330400', '1');
INSERT INTO `sys_area` VALUES ('330421', '330421', '嘉善县', '330400', '1');
INSERT INTO `sys_area` VALUES ('330424', '330424', '海盐县', '330400', '1');
INSERT INTO `sys_area` VALUES ('330481', '330481', '海宁市', '330400', '1');
INSERT INTO `sys_area` VALUES ('330482', '330482', '平湖市', '330400', '1');
INSERT INTO `sys_area` VALUES ('330483', '330483', '桐乡市', '330400', '1');
INSERT INTO `sys_area` VALUES ('330500', '330500', '湖州市', '330000', '1');
INSERT INTO `sys_area` VALUES ('330502', '330502', '吴兴区', '330500', '1');
INSERT INTO `sys_area` VALUES ('330503', '330503', '南浔区', '330500', '1');
INSERT INTO `sys_area` VALUES ('330521', '330521', '德清县', '330500', '1');
INSERT INTO `sys_area` VALUES ('330522', '330522', '长兴县', '330500', '1');
INSERT INTO `sys_area` VALUES ('330523', '330523', '安吉县', '330500', '1');
INSERT INTO `sys_area` VALUES ('330600', '330600', '绍兴市', '330000', '1');
INSERT INTO `sys_area` VALUES ('330602', '330602', '越城区', '330600', '1');
INSERT INTO `sys_area` VALUES ('330621', '330621', '绍兴县', '330600', '1');
INSERT INTO `sys_area` VALUES ('330624', '330624', '新昌县', '330600', '1');
INSERT INTO `sys_area` VALUES ('330681', '330681', '诸暨市', '330600', '1');
INSERT INTO `sys_area` VALUES ('330682', '330682', '上虞市', '330600', '1');
INSERT INTO `sys_area` VALUES ('330683', '330683', '嵊州市', '330600', '1');
INSERT INTO `sys_area` VALUES ('330700', '330700', '金华市', '330000', '1');
INSERT INTO `sys_area` VALUES ('330702', '330702', '婺城区', '330700', '1');
INSERT INTO `sys_area` VALUES ('330703', '330703', '金东区', '330700', '1');
INSERT INTO `sys_area` VALUES ('330723', '330723', '武义县', '330700', '1');
INSERT INTO `sys_area` VALUES ('330726', '330726', '浦江县', '330700', '1');
INSERT INTO `sys_area` VALUES ('330727', '330727', '磐安县', '330700', '1');
INSERT INTO `sys_area` VALUES ('330781', '330781', '兰溪市', '330700', '1');
INSERT INTO `sys_area` VALUES ('330782', '330782', '义乌市', '330700', '1');
INSERT INTO `sys_area` VALUES ('330783', '330783', '东阳市', '330700', '1');
INSERT INTO `sys_area` VALUES ('330784', '330784', '永康市', '330700', '1');
INSERT INTO `sys_area` VALUES ('330800', '330800', '衢州市', '330000', '1');
INSERT INTO `sys_area` VALUES ('330802', '330802', '柯城区', '330800', '1');
INSERT INTO `sys_area` VALUES ('330803', '330803', '衢江区', '330800', '1');
INSERT INTO `sys_area` VALUES ('330822', '330822', '常山县', '330800', '1');
INSERT INTO `sys_area` VALUES ('330824', '330824', '开化县', '330800', '1');
INSERT INTO `sys_area` VALUES ('330825', '330825', '龙游县', '330800', '1');
INSERT INTO `sys_area` VALUES ('330881', '330881', '江山市', '330800', '1');
INSERT INTO `sys_area` VALUES ('330900', '330900', '舟山市', '330000', '1');
INSERT INTO `sys_area` VALUES ('330902', '330902', '定海区', '330900', '1');
INSERT INTO `sys_area` VALUES ('330903', '330903', '普陀区', '330900', '1');
INSERT INTO `sys_area` VALUES ('330921', '330921', '岱山县', '330900', '1');
INSERT INTO `sys_area` VALUES ('330922', '330922', '嵊泗县', '330900', '1');
INSERT INTO `sys_area` VALUES ('331000', '331000', '台州市', '330000', '1');
INSERT INTO `sys_area` VALUES ('331002', '331002', '椒江区', '331000', '1');
INSERT INTO `sys_area` VALUES ('331003', '331003', '黄岩区', '331000', '1');
INSERT INTO `sys_area` VALUES ('331004', '331004', '路桥区', '331000', '1');
INSERT INTO `sys_area` VALUES ('331021', '331021', '玉环县', '331000', '1');
INSERT INTO `sys_area` VALUES ('331022', '331022', '三门县', '331000', '1');
INSERT INTO `sys_area` VALUES ('331023', '331023', '天台县', '331000', '1');
INSERT INTO `sys_area` VALUES ('331024', '331024', '仙居县', '331000', '1');
INSERT INTO `sys_area` VALUES ('331081', '331081', '温岭市', '331000', '1');
INSERT INTO `sys_area` VALUES ('331082', '331082', '临海市', '331000', '1');
INSERT INTO `sys_area` VALUES ('331100', '331100', '丽水市', '330000', '1');
INSERT INTO `sys_area` VALUES ('331102', '331102', '莲都区', '331100', '1');
INSERT INTO `sys_area` VALUES ('331121', '331121', '青田县', '331100', '1');
INSERT INTO `sys_area` VALUES ('331122', '331122', '缙云县', '331100', '1');
INSERT INTO `sys_area` VALUES ('331123', '331123', '遂昌县', '331100', '1');
INSERT INTO `sys_area` VALUES ('331124', '331124', '松阳县', '331100', '1');
INSERT INTO `sys_area` VALUES ('331125', '331125', '云和县', '331100', '1');
INSERT INTO `sys_area` VALUES ('331126', '331126', '庆元县', '331100', '1');
INSERT INTO `sys_area` VALUES ('331127', '331127', '景宁畲族自治县', '331100', '1');
INSERT INTO `sys_area` VALUES ('331181', '331181', '龙泉市', '331100', '1');
INSERT INTO `sys_area` VALUES ('340000', '340000', '安徽省', '0', '1');
INSERT INTO `sys_area` VALUES ('340100', '340100', '合肥市', '340000', '1');
INSERT INTO `sys_area` VALUES ('340102', '340102', '瑶海区', '340100', '1');
INSERT INTO `sys_area` VALUES ('340103', '340103', '庐阳区', '340100', '1');
INSERT INTO `sys_area` VALUES ('340104', '340104', '蜀山区', '340100', '1');
INSERT INTO `sys_area` VALUES ('340111', '340111', '包河区', '340100', '1');
INSERT INTO `sys_area` VALUES ('340121', '340121', '长丰县', '340100', '1');
INSERT INTO `sys_area` VALUES ('340122', '340122', '肥东县', '340100', '1');
INSERT INTO `sys_area` VALUES ('340123', '340123', '肥西县', '340100', '1');
INSERT INTO `sys_area` VALUES ('340200', '340200', '芜湖市', '340000', '1');
INSERT INTO `sys_area` VALUES ('340202', '340202', '镜湖区', '340200', '1');
INSERT INTO `sys_area` VALUES ('340203', '340203', '弋江区', '340200', '1');
INSERT INTO `sys_area` VALUES ('340204', '340204', '新芜区', '340200', '1');
INSERT INTO `sys_area` VALUES ('340207', '340207', '鸠江区', '340200', '1');
INSERT INTO `sys_area` VALUES ('340208', '340208', '三山区', '340200', '1');
INSERT INTO `sys_area` VALUES ('340221', '340221', '芜湖县', '340200', '1');
INSERT INTO `sys_area` VALUES ('340222', '340222', '繁昌县', '340200', '1');
INSERT INTO `sys_area` VALUES ('340223', '340223', '南陵县', '340200', '1');
INSERT INTO `sys_area` VALUES ('340300', '340300', '蚌埠市', '340000', '1');
INSERT INTO `sys_area` VALUES ('340302', '340302', '龙子湖区', '340300', '1');
INSERT INTO `sys_area` VALUES ('340303', '340303', '蚌山区', '340300', '1');
INSERT INTO `sys_area` VALUES ('340304', '340304', '禹会区', '340300', '1');
INSERT INTO `sys_area` VALUES ('340311', '340311', '淮上区', '340300', '1');
INSERT INTO `sys_area` VALUES ('340321', '340321', '怀远县', '340300', '1');
INSERT INTO `sys_area` VALUES ('340322', '340322', '五河县', '340300', '1');
INSERT INTO `sys_area` VALUES ('340323', '340323', '固镇县', '340300', '1');
INSERT INTO `sys_area` VALUES ('340400', '340400', '淮南市', '340000', '1');
INSERT INTO `sys_area` VALUES ('340402', '340402', '大通区', '340400', '1');
INSERT INTO `sys_area` VALUES ('340403', '340403', '田家庵区', '340400', '1');
INSERT INTO `sys_area` VALUES ('340404', '340404', '谢家集区', '340400', '1');
INSERT INTO `sys_area` VALUES ('340405', '340405', '八公山区', '340400', '1');
INSERT INTO `sys_area` VALUES ('340406', '340406', '潘集区', '340400', '1');
INSERT INTO `sys_area` VALUES ('340421', '340421', '凤台县', '340400', '1');
INSERT INTO `sys_area` VALUES ('340500', '340500', '马鞍山市', '340000', '1');
INSERT INTO `sys_area` VALUES ('340502', '340502', '金家庄区', '340500', '1');
INSERT INTO `sys_area` VALUES ('340503', '340503', '花山区', '340500', '1');
INSERT INTO `sys_area` VALUES ('340504', '340504', '雨山区', '340500', '1');
INSERT INTO `sys_area` VALUES ('340521', '340521', '当涂县', '340500', '1');
INSERT INTO `sys_area` VALUES ('340600', '340600', '淮北市', '340000', '1');
INSERT INTO `sys_area` VALUES ('340602', '340602', '杜集区', '340600', '1');
INSERT INTO `sys_area` VALUES ('340603', '340603', '相山区', '340600', '1');
INSERT INTO `sys_area` VALUES ('340604', '340604', '烈山区', '340600', '1');
INSERT INTO `sys_area` VALUES ('340621', '340621', '濉溪县', '340600', '1');
INSERT INTO `sys_area` VALUES ('340700', '340700', '铜陵市', '340000', '1');
INSERT INTO `sys_area` VALUES ('340702', '340702', '铜官山区', '340700', '1');
INSERT INTO `sys_area` VALUES ('340703', '340703', '狮子山区', '340700', '1');
INSERT INTO `sys_area` VALUES ('340711', '340711', '郊区', '340700', '1');
INSERT INTO `sys_area` VALUES ('340721', '340721', '铜陵县', '340700', '1');
INSERT INTO `sys_area` VALUES ('340800', '340800', '安庆市', '340000', '1');
INSERT INTO `sys_area` VALUES ('340802', '340802', '迎江区', '340800', '1');
INSERT INTO `sys_area` VALUES ('340803', '340803', '大观区', '340800', '1');
INSERT INTO `sys_area` VALUES ('340811', '340811', '宜秀区', '340800', '1');
INSERT INTO `sys_area` VALUES ('340812', '340812', '郊区', '340800', '1');
INSERT INTO `sys_area` VALUES ('340822', '340822', '怀宁县', '340800', '1');
INSERT INTO `sys_area` VALUES ('340823', '340823', '枞阳县', '340800', '1');
INSERT INTO `sys_area` VALUES ('340824', '340824', '潜山县', '340800', '1');
INSERT INTO `sys_area` VALUES ('340825', '340825', '太湖县', '340800', '1');
INSERT INTO `sys_area` VALUES ('340826', '340826', '宿松县', '340800', '1');
INSERT INTO `sys_area` VALUES ('340827', '340827', '望江县', '340800', '1');
INSERT INTO `sys_area` VALUES ('340828', '340828', '岳西县', '340800', '1');
INSERT INTO `sys_area` VALUES ('340881', '340881', '桐城市', '340800', '1');
INSERT INTO `sys_area` VALUES ('341000', '341000', '黄山市', '340000', '1');
INSERT INTO `sys_area` VALUES ('341002', '341002', '屯溪区', '341000', '1');
INSERT INTO `sys_area` VALUES ('341003', '341003', '黄山区', '341000', '1');
INSERT INTO `sys_area` VALUES ('341004', '341004', '徽州区', '341000', '1');
INSERT INTO `sys_area` VALUES ('341021', '341021', '歙县', '341000', '1');
INSERT INTO `sys_area` VALUES ('341022', '341022', '休宁县', '341000', '1');
INSERT INTO `sys_area` VALUES ('341023', '341023', '黟县', '341000', '1');
INSERT INTO `sys_area` VALUES ('341024', '341024', '祁门县', '341000', '1');
INSERT INTO `sys_area` VALUES ('341100', '341100', '滁州市', '340000', '1');
INSERT INTO `sys_area` VALUES ('341102', '341102', '琅琊区', '341100', '1');
INSERT INTO `sys_area` VALUES ('341103', '341103', '南谯区', '341100', '1');
INSERT INTO `sys_area` VALUES ('341122', '341122', '来安县', '341100', '1');
INSERT INTO `sys_area` VALUES ('341124', '341124', '全椒县', '341100', '1');
INSERT INTO `sys_area` VALUES ('341125', '341125', '定远县', '341100', '1');
INSERT INTO `sys_area` VALUES ('341126', '341126', '凤阳县', '341100', '1');
INSERT INTO `sys_area` VALUES ('341181', '341181', '天长市', '341100', '1');
INSERT INTO `sys_area` VALUES ('341182', '341182', '明光市', '341100', '1');
INSERT INTO `sys_area` VALUES ('341200', '341200', '阜阳市', '340000', '1');
INSERT INTO `sys_area` VALUES ('341202', '341202', '颍州区', '341200', '1');
INSERT INTO `sys_area` VALUES ('341203', '341203', '颍东区', '341200', '1');
INSERT INTO `sys_area` VALUES ('341204', '341204', '颍泉区', '341200', '1');
INSERT INTO `sys_area` VALUES ('341221', '341221', '临泉县', '341200', '1');
INSERT INTO `sys_area` VALUES ('341222', '341222', '太和县', '341200', '1');
INSERT INTO `sys_area` VALUES ('341225', '341225', '阜南县', '341200', '1');
INSERT INTO `sys_area` VALUES ('341226', '341226', '颍上县', '341200', '1');
INSERT INTO `sys_area` VALUES ('341282', '341282', '界首市', '341200', '1');
INSERT INTO `sys_area` VALUES ('341300', '341300', '宿州市', '340000', '1');
INSERT INTO `sys_area` VALUES ('341302', '341302', '埇桥区', '341300', '1');
INSERT INTO `sys_area` VALUES ('341321', '341321', '砀山县', '341300', '1');
INSERT INTO `sys_area` VALUES ('341322', '341322', '萧县', '341300', '1');
INSERT INTO `sys_area` VALUES ('341323', '341323', '灵璧县', '341300', '1');
INSERT INTO `sys_area` VALUES ('341324', '341324', '泗县', '341300', '1');
INSERT INTO `sys_area` VALUES ('341400', '341400', '巢湖市', '340100', '1');
INSERT INTO `sys_area` VALUES ('341421', '341421', '庐江县', '340100', '1');
INSERT INTO `sys_area` VALUES ('341422', '341422', '无为县', '340200', '1');
INSERT INTO `sys_area` VALUES ('341423', '341423', '含山县', '340500', '1');
INSERT INTO `sys_area` VALUES ('341424', '341424', '和县', '340500', '1');
INSERT INTO `sys_area` VALUES ('341500', '341500', '六安市', '340000', '1');
INSERT INTO `sys_area` VALUES ('341502', '341502', '金安区', '341500', '1');
INSERT INTO `sys_area` VALUES ('341503', '341503', '裕安区', '341500', '1');
INSERT INTO `sys_area` VALUES ('341521', '341521', '寿县', '341500', '1');
INSERT INTO `sys_area` VALUES ('341522', '341522', '霍邱县', '341500', '1');
INSERT INTO `sys_area` VALUES ('341523', '341523', '舒城县', '341500', '1');
INSERT INTO `sys_area` VALUES ('341524', '341524', '金寨县', '341500', '1');
INSERT INTO `sys_area` VALUES ('341525', '341525', '霍山县', '341500', '1');
INSERT INTO `sys_area` VALUES ('341600', '341600', '亳州市', '340000', '1');
INSERT INTO `sys_area` VALUES ('341602', '341602', '谯城区', '341600', '1');
INSERT INTO `sys_area` VALUES ('341621', '341621', '涡阳县', '341600', '1');
INSERT INTO `sys_area` VALUES ('341622', '341622', '蒙城县', '341600', '1');
INSERT INTO `sys_area` VALUES ('341623', '341623', '利辛县', '341600', '1');
INSERT INTO `sys_area` VALUES ('341700', '341700', '池州市', '340000', '1');
INSERT INTO `sys_area` VALUES ('341702', '341702', '贵池区', '341700', '1');
INSERT INTO `sys_area` VALUES ('341721', '341721', '东至县', '341700', '1');
INSERT INTO `sys_area` VALUES ('341722', '341722', '石台县', '341700', '1');
INSERT INTO `sys_area` VALUES ('341723', '341723', '青阳县', '341700', '1');
INSERT INTO `sys_area` VALUES ('341800', '341800', '宣城市', '340000', '1');
INSERT INTO `sys_area` VALUES ('341802', '341802', '宣州区', '341800', '1');
INSERT INTO `sys_area` VALUES ('341821', '341821', '郎溪县', '341800', '1');
INSERT INTO `sys_area` VALUES ('341822', '341822', '广德县', '341800', '1');
INSERT INTO `sys_area` VALUES ('341823', '341823', '泾县', '341800', '1');
INSERT INTO `sys_area` VALUES ('341824', '341824', '绩溪县', '341800', '1');
INSERT INTO `sys_area` VALUES ('341825', '341825', '旌德县', '341800', '1');
INSERT INTO `sys_area` VALUES ('341881', '341881', '宁国市', '341800', '1');
INSERT INTO `sys_area` VALUES ('350000', '350000', '福建省', '0', '1');
INSERT INTO `sys_area` VALUES ('350100', '350100', '福州市', '350000', '1');
INSERT INTO `sys_area` VALUES ('350102', '350102', '鼓楼区', '350100', '1');
INSERT INTO `sys_area` VALUES ('350103', '350103', '台江区', '350100', '1');
INSERT INTO `sys_area` VALUES ('350104', '350104', '仓山区', '350100', '1');
INSERT INTO `sys_area` VALUES ('350105', '350105', '马尾区', '350100', '1');
INSERT INTO `sys_area` VALUES ('350111', '350111', '晋安区', '350100', '1');
INSERT INTO `sys_area` VALUES ('350121', '350121', '闽侯县', '350100', '1');
INSERT INTO `sys_area` VALUES ('350122', '350122', '连江县', '350100', '1');
INSERT INTO `sys_area` VALUES ('350123', '350123', '罗源县', '350100', '1');
INSERT INTO `sys_area` VALUES ('350124', '350124', '闽清县', '350100', '1');
INSERT INTO `sys_area` VALUES ('350125', '350125', '永泰县', '350100', '1');
INSERT INTO `sys_area` VALUES ('350128', '350128', '平潭县', '350100', '1');
INSERT INTO `sys_area` VALUES ('350181', '350181', '福清市', '350100', '1');
INSERT INTO `sys_area` VALUES ('350182', '350182', '长乐市', '350100', '1');
INSERT INTO `sys_area` VALUES ('350200', '350200', '厦门市', '350000', '1');
INSERT INTO `sys_area` VALUES ('350203', '350203', '思明区', '350200', '1');
INSERT INTO `sys_area` VALUES ('350205', '350205', '海沧区', '350200', '1');
INSERT INTO `sys_area` VALUES ('350206', '350206', '湖里区', '350200', '1');
INSERT INTO `sys_area` VALUES ('350211', '350211', '集美区', '350200', '1');
INSERT INTO `sys_area` VALUES ('350212', '350212', '同安区', '350200', '1');
INSERT INTO `sys_area` VALUES ('350213', '350213', '翔安区', '350200', '1');
INSERT INTO `sys_area` VALUES ('350300', '350300', '莆田市', '350000', '1');
INSERT INTO `sys_area` VALUES ('350302', '350302', '城厢区', '350300', '1');
INSERT INTO `sys_area` VALUES ('350303', '350303', '涵江区', '350300', '1');
INSERT INTO `sys_area` VALUES ('350304', '350304', '荔城区', '350300', '1');
INSERT INTO `sys_area` VALUES ('350305', '350305', '秀屿区', '350300', '1');
INSERT INTO `sys_area` VALUES ('350322', '350322', '仙游县', '350300', '1');
INSERT INTO `sys_area` VALUES ('350400', '350400', '三明市', '350000', '1');
INSERT INTO `sys_area` VALUES ('350402', '350402', '梅列区', '350400', '1');
INSERT INTO `sys_area` VALUES ('350403', '350403', '三元区', '350400', '1');
INSERT INTO `sys_area` VALUES ('350421', '350421', '明溪县', '350400', '1');
INSERT INTO `sys_area` VALUES ('350423', '350423', '清流县', '350400', '1');
INSERT INTO `sys_area` VALUES ('350424', '350424', '宁化县', '350400', '1');
INSERT INTO `sys_area` VALUES ('350425', '350425', '大田县', '350400', '1');
INSERT INTO `sys_area` VALUES ('350426', '350426', '尤溪县', '350400', '1');
INSERT INTO `sys_area` VALUES ('350427', '350427', '沙县', '350400', '1');
INSERT INTO `sys_area` VALUES ('350428', '350428', '将乐县', '350400', '1');
INSERT INTO `sys_area` VALUES ('350429', '350429', '泰宁县', '350400', '1');
INSERT INTO `sys_area` VALUES ('350430', '350430', '建宁县', '350400', '1');
INSERT INTO `sys_area` VALUES ('350481', '350481', '永安市', '350400', '1');
INSERT INTO `sys_area` VALUES ('350500', '350500', '泉州市', '350000', '1');
INSERT INTO `sys_area` VALUES ('350502', '350502', '鲤城区', '350500', '1');
INSERT INTO `sys_area` VALUES ('350503', '350503', '丰泽区', '350500', '1');
INSERT INTO `sys_area` VALUES ('350504', '350504', '洛江区', '350500', '1');
INSERT INTO `sys_area` VALUES ('350505', '350505', '泉港区', '350500', '1');
INSERT INTO `sys_area` VALUES ('350521', '350521', '惠安县', '350500', '1');
INSERT INTO `sys_area` VALUES ('350524', '350524', '安溪县', '350500', '1');
INSERT INTO `sys_area` VALUES ('350525', '350525', '永春县', '350500', '1');
INSERT INTO `sys_area` VALUES ('350526', '350526', '德化县', '350500', '1');
INSERT INTO `sys_area` VALUES ('350527', '350527', '金门县', '350500', '1');
INSERT INTO `sys_area` VALUES ('350581', '350581', '石狮市', '350500', '1');
INSERT INTO `sys_area` VALUES ('350582', '350582', '晋江市', '350500', '1');
INSERT INTO `sys_area` VALUES ('350583', '350583', '南安市', '350500', '1');
INSERT INTO `sys_area` VALUES ('350600', '350600', '漳州市', '350000', '1');
INSERT INTO `sys_area` VALUES ('350602', '350602', '芗城区', '350600', '1');
INSERT INTO `sys_area` VALUES ('350603', '350603', '龙文区', '350600', '1');
INSERT INTO `sys_area` VALUES ('350622', '350622', '云霄县', '350600', '1');
INSERT INTO `sys_area` VALUES ('350623', '350623', '漳浦县', '350600', '1');
INSERT INTO `sys_area` VALUES ('350624', '350624', '诏安县', '350600', '1');
INSERT INTO `sys_area` VALUES ('350625', '350625', '长泰县', '350600', '1');
INSERT INTO `sys_area` VALUES ('350626', '350626', '东山县', '350600', '1');
INSERT INTO `sys_area` VALUES ('350627', '350627', '南靖县', '350600', '1');
INSERT INTO `sys_area` VALUES ('350628', '350628', '平和县', '350600', '1');
INSERT INTO `sys_area` VALUES ('350629', '350629', '华安县', '350600', '1');
INSERT INTO `sys_area` VALUES ('350681', '350681', '龙海市', '350600', '1');
INSERT INTO `sys_area` VALUES ('350700', '350700', '南平市', '350000', '1');
INSERT INTO `sys_area` VALUES ('350702', '350702', '延平区', '350700', '1');
INSERT INTO `sys_area` VALUES ('350721', '350721', '顺昌县', '350700', '1');
INSERT INTO `sys_area` VALUES ('350722', '350722', '浦城县', '350700', '1');
INSERT INTO `sys_area` VALUES ('350723', '350723', '光泽县', '350700', '1');
INSERT INTO `sys_area` VALUES ('350724', '350724', '松溪县', '350700', '1');
INSERT INTO `sys_area` VALUES ('350725', '350725', '政和县', '350700', '1');
INSERT INTO `sys_area` VALUES ('350781', '350781', '邵武市', '350700', '1');
INSERT INTO `sys_area` VALUES ('350782', '350782', '武夷山市', '350700', '1');
INSERT INTO `sys_area` VALUES ('350783', '350783', '建瓯市', '350700', '1');
INSERT INTO `sys_area` VALUES ('350784', '350784', '建阳市', '350700', '1');
INSERT INTO `sys_area` VALUES ('350800', '350800', '龙岩市', '350000', '1');
INSERT INTO `sys_area` VALUES ('350802', '350802', '新罗区', '350800', '1');
INSERT INTO `sys_area` VALUES ('350821', '350821', '长汀县', '350800', '1');
INSERT INTO `sys_area` VALUES ('350822', '350822', '永定县', '350800', '1');
INSERT INTO `sys_area` VALUES ('350823', '350823', '上杭县', '350800', '1');
INSERT INTO `sys_area` VALUES ('350824', '350824', '武平县', '350800', '1');
INSERT INTO `sys_area` VALUES ('350825', '350825', '连城县', '350800', '1');
INSERT INTO `sys_area` VALUES ('350881', '350881', '漳平市', '350800', '1');
INSERT INTO `sys_area` VALUES ('350900', '350900', '宁德市', '350000', '1');
INSERT INTO `sys_area` VALUES ('350902', '350902', '蕉城区', '350900', '1');
INSERT INTO `sys_area` VALUES ('350921', '350921', '霞浦县', '350900', '1');
INSERT INTO `sys_area` VALUES ('350922', '350922', '古田县', '350900', '1');
INSERT INTO `sys_area` VALUES ('350923', '350923', '屏南县', '350900', '1');
INSERT INTO `sys_area` VALUES ('350924', '350924', '寿宁县', '350900', '1');
INSERT INTO `sys_area` VALUES ('350925', '350925', '周宁县', '350900', '1');
INSERT INTO `sys_area` VALUES ('350926', '350926', '柘荣县', '350900', '1');
INSERT INTO `sys_area` VALUES ('350981', '350981', '福安市', '350900', '1');
INSERT INTO `sys_area` VALUES ('350982', '350982', '福鼎市', '350900', '1');
INSERT INTO `sys_area` VALUES ('360000', '360000', '江西省', '0', '1');
INSERT INTO `sys_area` VALUES ('360100', '360100', '南昌市', '360000', '1');
INSERT INTO `sys_area` VALUES ('360102', '360102', '东湖区', '360100', '1');
INSERT INTO `sys_area` VALUES ('360103', '360103', '西湖区', '360100', '1');
INSERT INTO `sys_area` VALUES ('360104', '360104', '青云谱区', '360100', '1');
INSERT INTO `sys_area` VALUES ('360105', '360105', '湾里区', '360100', '1');
INSERT INTO `sys_area` VALUES ('360111', '360111', '青山湖区', '360100', '1');
INSERT INTO `sys_area` VALUES ('360121', '360121', '南昌县', '360100', '1');
INSERT INTO `sys_area` VALUES ('360122', '360122', '新建县', '360100', '1');
INSERT INTO `sys_area` VALUES ('360123', '360123', '安义县', '360100', '1');
INSERT INTO `sys_area` VALUES ('360124', '360124', '进贤县', '360100', '1');
INSERT INTO `sys_area` VALUES ('360200', '360200', '景德镇市', '360000', '1');
INSERT INTO `sys_area` VALUES ('360202', '360202', '昌江区', '360200', '1');
INSERT INTO `sys_area` VALUES ('360203', '360203', '珠山区', '360200', '1');
INSERT INTO `sys_area` VALUES ('360222', '360222', '浮梁县', '360200', '1');
INSERT INTO `sys_area` VALUES ('360281', '360281', '乐平市', '360200', '1');
INSERT INTO `sys_area` VALUES ('360300', '360300', '萍乡市', '360000', '1');
INSERT INTO `sys_area` VALUES ('360302', '360302', '安源区', '360300', '1');
INSERT INTO `sys_area` VALUES ('360313', '360313', '湘东区', '360300', '1');
INSERT INTO `sys_area` VALUES ('360321', '360321', '莲花县', '360300', '1');
INSERT INTO `sys_area` VALUES ('360322', '360322', '上栗县', '360300', '1');
INSERT INTO `sys_area` VALUES ('360323', '360323', '芦溪县', '360300', '1');
INSERT INTO `sys_area` VALUES ('360400', '360400', '九江市', '360000', '1');
INSERT INTO `sys_area` VALUES ('360402', '360402', '庐山区', '360400', '1');
INSERT INTO `sys_area` VALUES ('360403', '360403', '浔阳区', '360400', '1');
INSERT INTO `sys_area` VALUES ('360421', '360421', '九江县', '360400', '1');
INSERT INTO `sys_area` VALUES ('360423', '360423', '武宁县', '360400', '1');
INSERT INTO `sys_area` VALUES ('360424', '360424', '修水县', '360400', '1');
INSERT INTO `sys_area` VALUES ('360425', '360425', '永修县', '360400', '1');
INSERT INTO `sys_area` VALUES ('360426', '360426', '德安县', '360400', '1');
INSERT INTO `sys_area` VALUES ('360427', '360427', '星子县', '360400', '1');
INSERT INTO `sys_area` VALUES ('360428', '360428', '都昌县', '360400', '1');
INSERT INTO `sys_area` VALUES ('360429', '360429', '湖口县', '360400', '1');
INSERT INTO `sys_area` VALUES ('360430', '360430', '彭泽县', '360400', '1');
INSERT INTO `sys_area` VALUES ('360481', '360481', '瑞昌市', '360400', '1');
INSERT INTO `sys_area` VALUES ('360482', '360482', '共青城市', '360400', '1');
INSERT INTO `sys_area` VALUES ('360483', '360483', '经济技术开发区', '360400', '1');
INSERT INTO `sys_area` VALUES ('360500', '360500', '新余市', '360000', '1');
INSERT INTO `sys_area` VALUES ('360502', '360502', '渝水区', '360500', '1');
INSERT INTO `sys_area` VALUES ('360521', '360521', '分宜县', '360500', '1');
INSERT INTO `sys_area` VALUES ('360600', '360600', '鹰潭市', '360000', '1');
INSERT INTO `sys_area` VALUES ('360602', '360602', '月湖区', '360600', '1');
INSERT INTO `sys_area` VALUES ('360622', '360622', '余江县', '360600', '1');
INSERT INTO `sys_area` VALUES ('360681', '360681', '贵溪市', '360600', '1');
INSERT INTO `sys_area` VALUES ('360700', '360700', '赣州市', '360000', '1');
INSERT INTO `sys_area` VALUES ('360702', '360702', '章贡区', '360700', '1');
INSERT INTO `sys_area` VALUES ('360721', '360721', '赣县', '360700', '1');
INSERT INTO `sys_area` VALUES ('360722', '360722', '信丰县', '360700', '1');
INSERT INTO `sys_area` VALUES ('360723', '360723', '大余县', '360700', '1');
INSERT INTO `sys_area` VALUES ('360724', '360724', '上犹县', '360700', '1');
INSERT INTO `sys_area` VALUES ('360725', '360725', '崇义县', '360700', '1');
INSERT INTO `sys_area` VALUES ('360726', '360726', '安远县', '360700', '1');
INSERT INTO `sys_area` VALUES ('360727', '360727', '龙南县', '360700', '1');
INSERT INTO `sys_area` VALUES ('360728', '360728', '定南县', '360700', '1');
INSERT INTO `sys_area` VALUES ('360729', '360729', '全南县', '360700', '1');
INSERT INTO `sys_area` VALUES ('360730', '360730', '宁都县', '360700', '1');
INSERT INTO `sys_area` VALUES ('360731', '360731', '于都县', '360700', '1');
INSERT INTO `sys_area` VALUES ('360732', '360732', '兴国县', '360700', '1');
INSERT INTO `sys_area` VALUES ('360733', '360733', '会昌县', '360700', '1');
INSERT INTO `sys_area` VALUES ('360734', '360734', '寻乌县', '360700', '1');
INSERT INTO `sys_area` VALUES ('360735', '360735', '石城县', '360700', '1');
INSERT INTO `sys_area` VALUES ('360781', '360781', '瑞金市', '360700', '1');
INSERT INTO `sys_area` VALUES ('360782', '360782', '南康市', '360700', '1');
INSERT INTO `sys_area` VALUES ('360800', '360800', '吉安市', '360000', '1');
INSERT INTO `sys_area` VALUES ('360802', '360802', '吉州区', '360800', '1');
INSERT INTO `sys_area` VALUES ('360803', '360803', '青原区', '360800', '1');
INSERT INTO `sys_area` VALUES ('360821', '360821', '吉安县', '360800', '1');
INSERT INTO `sys_area` VALUES ('360822', '360822', '吉水县', '360800', '1');
INSERT INTO `sys_area` VALUES ('360823', '360823', '峡江县', '360800', '1');
INSERT INTO `sys_area` VALUES ('360824', '360824', '新干县', '360800', '1');
INSERT INTO `sys_area` VALUES ('360825', '360825', '永丰县', '360800', '1');
INSERT INTO `sys_area` VALUES ('360826', '360826', '泰和县', '360800', '1');
INSERT INTO `sys_area` VALUES ('360827', '360827', '遂川县', '360800', '1');
INSERT INTO `sys_area` VALUES ('360828', '360828', '万安县', '360800', '1');
INSERT INTO `sys_area` VALUES ('360829', '360829', '安福县', '360800', '1');
INSERT INTO `sys_area` VALUES ('360830', '360830', '永新县', '360800', '1');
INSERT INTO `sys_area` VALUES ('360881', '360881', '井冈山市', '360800', '1');
INSERT INTO `sys_area` VALUES ('360900', '360900', '宜春市', '360000', '1');
INSERT INTO `sys_area` VALUES ('360902', '360902', '袁州区', '360900', '1');
INSERT INTO `sys_area` VALUES ('360921', '360921', '奉新县', '360900', '1');
INSERT INTO `sys_area` VALUES ('360922', '360922', '万载县', '360900', '1');
INSERT INTO `sys_area` VALUES ('360923', '360923', '上高县', '360900', '1');
INSERT INTO `sys_area` VALUES ('360924', '360924', '宜丰县', '360900', '1');
INSERT INTO `sys_area` VALUES ('360925', '360925', '靖安县', '360900', '1');
INSERT INTO `sys_area` VALUES ('360926', '360926', '铜鼓县', '360900', '1');
INSERT INTO `sys_area` VALUES ('360981', '360981', '丰城市', '360900', '1');
INSERT INTO `sys_area` VALUES ('360982', '360982', '樟树市', '360900', '1');
INSERT INTO `sys_area` VALUES ('360983', '360983', '高安市', '360900', '1');
INSERT INTO `sys_area` VALUES ('361000', '361000', '抚州市', '360000', '1');
INSERT INTO `sys_area` VALUES ('361002', '361002', '临川区', '361000', '1');
INSERT INTO `sys_area` VALUES ('361021', '361021', '南城县', '361000', '1');
INSERT INTO `sys_area` VALUES ('361022', '361022', '黎川县', '361000', '1');
INSERT INTO `sys_area` VALUES ('361023', '361023', '南丰县', '361000', '1');
INSERT INTO `sys_area` VALUES ('361024', '361024', '崇仁县', '361000', '1');
INSERT INTO `sys_area` VALUES ('361025', '361025', '乐安县', '361000', '1');
INSERT INTO `sys_area` VALUES ('361026', '361026', '宜黄县', '361000', '1');
INSERT INTO `sys_area` VALUES ('361027', '361027', '金溪县', '361000', '1');
INSERT INTO `sys_area` VALUES ('361028', '361028', '资溪县', '361000', '1');
INSERT INTO `sys_area` VALUES ('361029', '361029', '东乡县', '361000', '1');
INSERT INTO `sys_area` VALUES ('361030', '361030', '广昌县', '361000', '1');
INSERT INTO `sys_area` VALUES ('361100', '361100', '上饶市', '360000', '1');
INSERT INTO `sys_area` VALUES ('361102', '361102', '信州区', '361100', '1');
INSERT INTO `sys_area` VALUES ('361121', '361121', '上饶县', '361100', '1');
INSERT INTO `sys_area` VALUES ('361122', '361122', '广丰县', '361100', '1');
INSERT INTO `sys_area` VALUES ('361123', '361123', '玉山县', '361100', '1');
INSERT INTO `sys_area` VALUES ('361124', '361124', '铅山县', '361100', '1');
INSERT INTO `sys_area` VALUES ('361125', '361125', '横峰县', '361100', '1');
INSERT INTO `sys_area` VALUES ('361126', '361126', '弋阳县', '361100', '1');
INSERT INTO `sys_area` VALUES ('361127', '361127', '余干县', '361100', '1');
INSERT INTO `sys_area` VALUES ('361128', '361128', '鄱阳县', '361100', '1');
INSERT INTO `sys_area` VALUES ('361129', '361129', '万年县', '361100', '1');
INSERT INTO `sys_area` VALUES ('361130', '361130', '婺源县', '361100', '1');
INSERT INTO `sys_area` VALUES ('361181', '361181', '德兴市', '361100', '1');
INSERT INTO `sys_area` VALUES ('370000', '370000', '山东省', '0', '1');
INSERT INTO `sys_area` VALUES ('370100', '370100', '济南市', '370000', '1');
INSERT INTO `sys_area` VALUES ('370102', '370102', '历下区', '370100', '1');
INSERT INTO `sys_area` VALUES ('370103', '370103', '市中区', '370100', '1');
INSERT INTO `sys_area` VALUES ('370104', '370104', '槐荫区', '370100', '1');
INSERT INTO `sys_area` VALUES ('370105', '370105', '天桥区', '370100', '1');
INSERT INTO `sys_area` VALUES ('370112', '370112', '历城区', '370100', '1');
INSERT INTO `sys_area` VALUES ('370113', '370113', '长清区', '370100', '1');
INSERT INTO `sys_area` VALUES ('370124', '370124', '平阴县', '370100', '1');
INSERT INTO `sys_area` VALUES ('370125', '370125', '济阳县', '370100', '1');
INSERT INTO `sys_area` VALUES ('370126', '370126', '商河县', '370100', '1');
INSERT INTO `sys_area` VALUES ('370181', '370181', '章丘市', '370100', '1');
INSERT INTO `sys_area` VALUES ('370200', '370200', '青岛市', '370000', '1');
INSERT INTO `sys_area` VALUES ('370202', '370202', '市南区', '370200', '1');
INSERT INTO `sys_area` VALUES ('370203', '370203', '市北区', '370200', '1');
INSERT INTO `sys_area` VALUES ('370205', '370205', '四方区', '370200', '1');
INSERT INTO `sys_area` VALUES ('370211', '370211', '黄岛区', '370200', '1');
INSERT INTO `sys_area` VALUES ('370212', '370212', '崂山区', '370200', '1');
INSERT INTO `sys_area` VALUES ('370213', '370213', '李沧区', '370200', '1');
INSERT INTO `sys_area` VALUES ('370214', '370214', '城阳区', '370200', '1');
INSERT INTO `sys_area` VALUES ('370281', '370281', '胶州市', '370200', '1');
INSERT INTO `sys_area` VALUES ('370282', '370282', '即墨市', '370200', '1');
INSERT INTO `sys_area` VALUES ('370283', '370283', '平度市', '370200', '1');
INSERT INTO `sys_area` VALUES ('370284', '370284', '胶南市', '370200', '1');
INSERT INTO `sys_area` VALUES ('370285', '370285', '莱西市', '370200', '1');
INSERT INTO `sys_area` VALUES ('370300', '370300', '淄博市', '370000', '1');
INSERT INTO `sys_area` VALUES ('370302', '370302', '淄川区', '370300', '1');
INSERT INTO `sys_area` VALUES ('370303', '370303', '张店区', '370300', '1');
INSERT INTO `sys_area` VALUES ('370304', '370304', '博山区', '370300', '1');
INSERT INTO `sys_area` VALUES ('370305', '370305', '临淄区', '370300', '1');
INSERT INTO `sys_area` VALUES ('370306', '370306', '周村区', '370300', '1');
INSERT INTO `sys_area` VALUES ('370321', '370321', '桓台县', '370300', '1');
INSERT INTO `sys_area` VALUES ('370322', '370322', '高青县', '370300', '1');
INSERT INTO `sys_area` VALUES ('370323', '370323', '沂源县', '370300', '1');
INSERT INTO `sys_area` VALUES ('370400', '370400', '枣庄市', '370000', '1');
INSERT INTO `sys_area` VALUES ('370402', '370402', '市中区', '370400', '1');
INSERT INTO `sys_area` VALUES ('370403', '370403', '薛城区', '370400', '1');
INSERT INTO `sys_area` VALUES ('370404', '370404', '峄城区', '370400', '1');
INSERT INTO `sys_area` VALUES ('370405', '370405', '台儿庄区', '370400', '1');
INSERT INTO `sys_area` VALUES ('370406', '370406', '山亭区', '370400', '1');
INSERT INTO `sys_area` VALUES ('370481', '370481', '滕州市', '370400', '1');
INSERT INTO `sys_area` VALUES ('370500', '370500', '东营市', '370000', '1');
INSERT INTO `sys_area` VALUES ('370502', '370502', '东营区', '370500', '1');
INSERT INTO `sys_area` VALUES ('370503', '370503', '河口区', '370500', '1');
INSERT INTO `sys_area` VALUES ('370521', '370521', '垦利县', '370500', '1');
INSERT INTO `sys_area` VALUES ('370522', '370522', '利津县', '370500', '1');
INSERT INTO `sys_area` VALUES ('370523', '370523', '广饶县', '370500', '1');
INSERT INTO `sys_area` VALUES ('370600', '370600', '烟台市', '370000', '1');
INSERT INTO `sys_area` VALUES ('370602', '370602', '芝罘区', '370600', '1');
INSERT INTO `sys_area` VALUES ('370611', '370611', '福山区', '370600', '1');
INSERT INTO `sys_area` VALUES ('370612', '370612', '牟平区', '370600', '1');
INSERT INTO `sys_area` VALUES ('370613', '370613', '莱山区', '370600', '1');
INSERT INTO `sys_area` VALUES ('370634', '370634', '长岛县', '370600', '1');
INSERT INTO `sys_area` VALUES ('370681', '370681', '龙口市', '370600', '1');
INSERT INTO `sys_area` VALUES ('370682', '370682', '莱阳市', '370600', '1');
INSERT INTO `sys_area` VALUES ('370683', '370683', '莱州市', '370600', '1');
INSERT INTO `sys_area` VALUES ('370684', '370684', '蓬莱市', '370600', '1');
INSERT INTO `sys_area` VALUES ('370685', '370685', '招远市', '370600', '1');
INSERT INTO `sys_area` VALUES ('370686', '370686', '栖霞市', '370600', '1');
INSERT INTO `sys_area` VALUES ('370687', '370687', '海阳市', '370600', '1');
INSERT INTO `sys_area` VALUES ('370700', '370700', '潍坊市', '370000', '1');
INSERT INTO `sys_area` VALUES ('370702', '370702', '潍城区', '370700', '1');
INSERT INTO `sys_area` VALUES ('370703', '370703', '寒亭区', '370700', '1');
INSERT INTO `sys_area` VALUES ('370704', '370704', '坊子区', '370700', '1');
INSERT INTO `sys_area` VALUES ('370705', '370705', '奎文区', '370700', '1');
INSERT INTO `sys_area` VALUES ('370724', '370724', '临朐县', '370700', '1');
INSERT INTO `sys_area` VALUES ('370725', '370725', '昌乐县', '370700', '1');
INSERT INTO `sys_area` VALUES ('370781', '370781', '青州市', '370700', '1');
INSERT INTO `sys_area` VALUES ('370782', '370782', '诸城市', '370700', '1');
INSERT INTO `sys_area` VALUES ('370783', '370783', '寿光市', '370700', '1');
INSERT INTO `sys_area` VALUES ('370784', '370784', '安丘市', '370700', '1');
INSERT INTO `sys_area` VALUES ('370785', '370785', '高密市', '370700', '1');
INSERT INTO `sys_area` VALUES ('370786', '370786', '昌邑市', '370700', '1');
INSERT INTO `sys_area` VALUES ('370800', '370800', '济宁市', '370000', '1');
INSERT INTO `sys_area` VALUES ('370802', '370802', '市中区', '370800', '1');
INSERT INTO `sys_area` VALUES ('370811', '370811', '任城区', '370800', '1');
INSERT INTO `sys_area` VALUES ('370826', '370826', '微山县', '370800', '1');
INSERT INTO `sys_area` VALUES ('370827', '370827', '鱼台县', '370800', '1');
INSERT INTO `sys_area` VALUES ('370828', '370828', '金乡县', '370800', '1');
INSERT INTO `sys_area` VALUES ('370829', '370829', '嘉祥县', '370800', '1');
INSERT INTO `sys_area` VALUES ('370830', '370830', '汶上县', '370800', '1');
INSERT INTO `sys_area` VALUES ('370831', '370831', '泗水县', '370800', '1');
INSERT INTO `sys_area` VALUES ('370832', '370832', '梁山县', '370800', '1');
INSERT INTO `sys_area` VALUES ('370881', '370881', '曲阜市', '370800', '1');
INSERT INTO `sys_area` VALUES ('370882', '370882', '兖州市', '370800', '1');
INSERT INTO `sys_area` VALUES ('370883', '370883', '邹城市', '370800', '1');
INSERT INTO `sys_area` VALUES ('370900', '370900', '泰安市', '370000', '1');
INSERT INTO `sys_area` VALUES ('370902', '370902', '泰山区', '370900', '1');
INSERT INTO `sys_area` VALUES ('370903', '370903', '岱岳区', '370900', '1');
INSERT INTO `sys_area` VALUES ('370921', '370921', '宁阳县', '370900', '1');
INSERT INTO `sys_area` VALUES ('370923', '370923', '东平县', '370900', '1');
INSERT INTO `sys_area` VALUES ('370982', '370982', '新泰市', '370900', '1');
INSERT INTO `sys_area` VALUES ('370983', '370983', '肥城市', '370900', '1');
INSERT INTO `sys_area` VALUES ('371000', '371000', '威海市', '370000', '1');
INSERT INTO `sys_area` VALUES ('371002', '371002', '环翠区', '371000', '1');
INSERT INTO `sys_area` VALUES ('371081', '371081', '文登市', '371000', '1');
INSERT INTO `sys_area` VALUES ('371082', '371082', '荣成市', '371000', '1');
INSERT INTO `sys_area` VALUES ('371083', '371083', '乳山市', '371000', '1');
INSERT INTO `sys_area` VALUES ('371100', '371100', '日照市', '370000', '1');
INSERT INTO `sys_area` VALUES ('371102', '371102', '东港区', '371100', '1');
INSERT INTO `sys_area` VALUES ('371103', '371103', '岚山区', '371100', '1');
INSERT INTO `sys_area` VALUES ('371121', '371121', '五莲县', '371100', '1');
INSERT INTO `sys_area` VALUES ('371122', '371122', '莒县', '371100', '1');
INSERT INTO `sys_area` VALUES ('371200', '371200', '莱芜市', '370000', '1');
INSERT INTO `sys_area` VALUES ('371202', '371202', '莱城区', '371200', '1');
INSERT INTO `sys_area` VALUES ('371203', '371203', '钢城区', '371200', '1');
INSERT INTO `sys_area` VALUES ('371300', '371300', '临沂市', '370000', '1');
INSERT INTO `sys_area` VALUES ('371302', '371302', '兰山区', '371300', '1');
INSERT INTO `sys_area` VALUES ('371311', '371311', '罗庄区', '371300', '1');
INSERT INTO `sys_area` VALUES ('371312', '371312', '河东区', '371300', '1');
INSERT INTO `sys_area` VALUES ('371321', '371321', '沂南县', '371300', '1');
INSERT INTO `sys_area` VALUES ('371322', '371322', '郯城县', '371300', '1');
INSERT INTO `sys_area` VALUES ('371323', '371323', '沂水县', '371300', '1');
INSERT INTO `sys_area` VALUES ('371324', '371324', '苍山县', '371300', '1');
INSERT INTO `sys_area` VALUES ('371325', '371325', '费县', '371300', '1');
INSERT INTO `sys_area` VALUES ('371326', '371326', '平邑县', '371300', '1');
INSERT INTO `sys_area` VALUES ('371327', '371327', '莒南县', '371300', '1');
INSERT INTO `sys_area` VALUES ('371328', '371328', '蒙阴县', '371300', '1');
INSERT INTO `sys_area` VALUES ('371329', '371329', '临沭县', '371300', '1');
INSERT INTO `sys_area` VALUES ('371400', '371400', '德州市', '370000', '1');
INSERT INTO `sys_area` VALUES ('371402', '371402', '德城区', '371400', '1');
INSERT INTO `sys_area` VALUES ('371421', '371421', '陵县', '371400', '1');
INSERT INTO `sys_area` VALUES ('371422', '371422', '宁津县', '371400', '1');
INSERT INTO `sys_area` VALUES ('371423', '371423', '庆云县', '371400', '1');
INSERT INTO `sys_area` VALUES ('371424', '371424', '临邑县', '371400', '1');
INSERT INTO `sys_area` VALUES ('371425', '371425', '齐河县', '371400', '1');
INSERT INTO `sys_area` VALUES ('371426', '371426', '平原县', '371400', '1');
INSERT INTO `sys_area` VALUES ('371427', '371427', '夏津县', '371400', '1');
INSERT INTO `sys_area` VALUES ('371428', '371428', '武城县', '371400', '1');
INSERT INTO `sys_area` VALUES ('371481', '371481', '乐陵市', '371400', '1');
INSERT INTO `sys_area` VALUES ('371482', '371482', '禹城市', '371400', '1');
INSERT INTO `sys_area` VALUES ('371500', '371500', '聊城市', '370000', '1');
INSERT INTO `sys_area` VALUES ('371502', '371502', '东昌府区', '371500', '1');
INSERT INTO `sys_area` VALUES ('371521', '371521', '阳谷县', '371500', '1');
INSERT INTO `sys_area` VALUES ('371522', '371522', '莘县', '371500', '1');
INSERT INTO `sys_area` VALUES ('371523', '371523', '茌平县', '371500', '1');
INSERT INTO `sys_area` VALUES ('371524', '371524', '东阿县', '371500', '1');
INSERT INTO `sys_area` VALUES ('371525', '371525', '冠县', '371500', '1');
INSERT INTO `sys_area` VALUES ('371526', '371526', '高唐县', '371500', '1');
INSERT INTO `sys_area` VALUES ('371581', '371581', '临清市', '371500', '1');
INSERT INTO `sys_area` VALUES ('371600', '371600', '滨州市', '370000', '1');
INSERT INTO `sys_area` VALUES ('371602', '371602', '滨城区', '371600', '1');
INSERT INTO `sys_area` VALUES ('371621', '371621', '惠民县', '371600', '1');
INSERT INTO `sys_area` VALUES ('371622', '371622', '阳信县', '371600', '1');
INSERT INTO `sys_area` VALUES ('371623', '371623', '无棣县', '371600', '1');
INSERT INTO `sys_area` VALUES ('371624', '371624', '沾化县', '371600', '1');
INSERT INTO `sys_area` VALUES ('371625', '371625', '博兴县', '371600', '1');
INSERT INTO `sys_area` VALUES ('371626', '371626', '邹平县', '371600', '1');
INSERT INTO `sys_area` VALUES ('371700', '371700', '菏泽市', '370000', '1');
INSERT INTO `sys_area` VALUES ('371702', '371702', '牡丹区', '371700', '1');
INSERT INTO `sys_area` VALUES ('371721', '371721', '曹县', '371700', '1');
INSERT INTO `sys_area` VALUES ('371722', '371722', '单县', '371700', '1');
INSERT INTO `sys_area` VALUES ('371723', '371723', '成武县', '371700', '1');
INSERT INTO `sys_area` VALUES ('371724', '371724', '巨野县', '371700', '1');
INSERT INTO `sys_area` VALUES ('371725', '371725', '郓城县', '371700', '1');
INSERT INTO `sys_area` VALUES ('371726', '371726', '鄄城县', '371700', '1');
INSERT INTO `sys_area` VALUES ('371727', '371727', '定陶县', '371700', '1');
INSERT INTO `sys_area` VALUES ('371728', '371728', '东明县', '371700', '1');
INSERT INTO `sys_area` VALUES ('410000', '410000', '河南省', '0', '1');
INSERT INTO `sys_area` VALUES ('410100', '410100', '郑州市', '410000', '1');
INSERT INTO `sys_area` VALUES ('410102', '410102', '中原区', '410100', '1');
INSERT INTO `sys_area` VALUES ('410103', '410103', '二七区', '410100', '1');
INSERT INTO `sys_area` VALUES ('410104', '410104', '管城回族区', '410100', '1');
INSERT INTO `sys_area` VALUES ('410105', '410105', '金水区', '410100', '1');
INSERT INTO `sys_area` VALUES ('410106', '410106', '上街区', '410100', '1');
INSERT INTO `sys_area` VALUES ('410108', '410108', '惠济区', '410100', '1');
INSERT INTO `sys_area` VALUES ('410122', '410122', '中牟县', '410100', '1');
INSERT INTO `sys_area` VALUES ('410181', '410181', '巩义市', '410100', '1');
INSERT INTO `sys_area` VALUES ('410182', '410182', '荥阳市', '410100', '1');
INSERT INTO `sys_area` VALUES ('410183', '410183', '新密市', '410100', '1');
INSERT INTO `sys_area` VALUES ('410184', '410184', '新郑市', '410100', '1');
INSERT INTO `sys_area` VALUES ('410185', '410185', '登封市', '410100', '1');
INSERT INTO `sys_area` VALUES ('410200', '410200', '开封市', '410000', '1');
INSERT INTO `sys_area` VALUES ('410202', '410202', '龙亭区', '410200', '1');
INSERT INTO `sys_area` VALUES ('410203', '410203', '顺河回族区', '410200', '1');
INSERT INTO `sys_area` VALUES ('410204', '410204', '鼓楼区', '410200', '1');
INSERT INTO `sys_area` VALUES ('410205', '410205', '禹王台区', '410200', '1');
INSERT INTO `sys_area` VALUES ('410211', '410211', '金明区', '410200', '1');
INSERT INTO `sys_area` VALUES ('410221', '410221', '杞县', '410200', '1');
INSERT INTO `sys_area` VALUES ('410222', '410222', '通许县', '410200', '1');
INSERT INTO `sys_area` VALUES ('410223', '410223', '尉氏县', '410200', '1');
INSERT INTO `sys_area` VALUES ('410224', '410224', '开封县', '410200', '1');
INSERT INTO `sys_area` VALUES ('410225', '410225', '兰考县', '410200', '1');
INSERT INTO `sys_area` VALUES ('410300', '410300', '洛阳市', '410000', '1');
INSERT INTO `sys_area` VALUES ('410302', '410302', '老城区', '410300', '1');
INSERT INTO `sys_area` VALUES ('410303', '410303', '西工区', '410300', '1');
INSERT INTO `sys_area` VALUES ('410304', '410304', '瀍河回族区', '410300', '1');
INSERT INTO `sys_area` VALUES ('410305', '410305', '涧西区', '410300', '1');
INSERT INTO `sys_area` VALUES ('410306', '410306', '吉利区', '410300', '1');
INSERT INTO `sys_area` VALUES ('410307', '410307', '洛龙区', '410300', '1');
INSERT INTO `sys_area` VALUES ('410322', '410322', '孟津县', '410300', '1');
INSERT INTO `sys_area` VALUES ('410323', '410323', '新安县', '410300', '1');
INSERT INTO `sys_area` VALUES ('410324', '410324', '栾川县', '410300', '1');
INSERT INTO `sys_area` VALUES ('410325', '410325', '嵩县', '410300', '1');
INSERT INTO `sys_area` VALUES ('410326', '410326', '汝阳县', '410300', '1');
INSERT INTO `sys_area` VALUES ('410327', '410327', '宜阳县', '410300', '1');
INSERT INTO `sys_area` VALUES ('410328', '410328', '洛宁县', '410300', '1');
INSERT INTO `sys_area` VALUES ('410329', '410329', '伊川县', '410300', '1');
INSERT INTO `sys_area` VALUES ('410381', '410381', '偃师市', '410300', '1');
INSERT INTO `sys_area` VALUES ('410400', '410400', '平顶山市', '410000', '1');
INSERT INTO `sys_area` VALUES ('410402', '410402', '新华区', '410400', '1');
INSERT INTO `sys_area` VALUES ('410403', '410403', '卫东区', '410400', '1');
INSERT INTO `sys_area` VALUES ('410404', '410404', '石龙区', '410400', '1');
INSERT INTO `sys_area` VALUES ('410411', '410411', '湛河区', '410400', '1');
INSERT INTO `sys_area` VALUES ('410421', '410421', '宝丰县', '410400', '1');
INSERT INTO `sys_area` VALUES ('410422', '410422', '叶县', '410400', '1');
INSERT INTO `sys_area` VALUES ('410423', '410423', '鲁山县', '410400', '1');
INSERT INTO `sys_area` VALUES ('410425', '410425', '郏县', '410400', '1');
INSERT INTO `sys_area` VALUES ('410481', '410481', '舞钢市', '410400', '1');
INSERT INTO `sys_area` VALUES ('410482', '410482', '汝州市', '410400', '1');
INSERT INTO `sys_area` VALUES ('410500', '410500', '安阳市', '410000', '1');
INSERT INTO `sys_area` VALUES ('410502', '410502', '文峰区', '410500', '1');
INSERT INTO `sys_area` VALUES ('410503', '410503', '北关区', '410500', '1');
INSERT INTO `sys_area` VALUES ('410505', '410505', '殷都区', '410500', '1');
INSERT INTO `sys_area` VALUES ('410506', '410506', '龙安区', '410500', '1');
INSERT INTO `sys_area` VALUES ('410522', '410522', '安阳县', '410500', '1');
INSERT INTO `sys_area` VALUES ('410523', '410523', '汤阴县', '410500', '1');
INSERT INTO `sys_area` VALUES ('410526', '410526', '滑县', '410500', '1');
INSERT INTO `sys_area` VALUES ('410527', '410527', '内黄县', '410500', '1');
INSERT INTO `sys_area` VALUES ('410581', '410581', '林州市', '410500', '1');
INSERT INTO `sys_area` VALUES ('410600', '410600', '鹤壁市', '410000', '1');
INSERT INTO `sys_area` VALUES ('410602', '410602', '鹤山区', '410600', '1');
INSERT INTO `sys_area` VALUES ('410603', '410603', '山城区', '410600', '1');
INSERT INTO `sys_area` VALUES ('410611', '410611', '淇滨区', '410600', '1');
INSERT INTO `sys_area` VALUES ('410621', '410621', '浚县', '410600', '1');
INSERT INTO `sys_area` VALUES ('410622', '410622', '淇县', '410600', '1');
INSERT INTO `sys_area` VALUES ('410700', '410700', '新乡市', '410000', '1');
INSERT INTO `sys_area` VALUES ('410702', '410702', '红旗区', '410700', '1');
INSERT INTO `sys_area` VALUES ('410703', '410703', '卫滨区', '410700', '1');
INSERT INTO `sys_area` VALUES ('410704', '410704', '凤泉区', '410700', '1');
INSERT INTO `sys_area` VALUES ('410711', '410711', '牧野区', '410700', '1');
INSERT INTO `sys_area` VALUES ('410721', '410721', '新乡县', '410700', '1');
INSERT INTO `sys_area` VALUES ('410724', '410724', '获嘉县', '410700', '1');
INSERT INTO `sys_area` VALUES ('410725', '410725', '原阳县', '410700', '1');
INSERT INTO `sys_area` VALUES ('410726', '410726', '延津县', '410700', '1');
INSERT INTO `sys_area` VALUES ('410727', '410727', '封丘县', '410700', '1');
INSERT INTO `sys_area` VALUES ('410728', '410728', '长垣县', '410700', '1');
INSERT INTO `sys_area` VALUES ('410781', '410781', '卫辉市', '410700', '1');
INSERT INTO `sys_area` VALUES ('410782', '410782', '辉县市', '410700', '1');
INSERT INTO `sys_area` VALUES ('410800', '410800', '焦作市', '410000', '1');
INSERT INTO `sys_area` VALUES ('410802', '410802', '解放区', '410800', '1');
INSERT INTO `sys_area` VALUES ('410803', '410803', '中站区', '410800', '1');
INSERT INTO `sys_area` VALUES ('410804', '410804', '马村区', '410800', '1');
INSERT INTO `sys_area` VALUES ('410811', '410811', '山阳区', '410800', '1');
INSERT INTO `sys_area` VALUES ('410821', '410821', '修武县', '410800', '1');
INSERT INTO `sys_area` VALUES ('410822', '410822', '博爱县', '410800', '1');
INSERT INTO `sys_area` VALUES ('410823', '410823', '武陟县', '410800', '1');
INSERT INTO `sys_area` VALUES ('410825', '410825', '温县', '410800', '1');
INSERT INTO `sys_area` VALUES ('410882', '410882', '沁阳市', '410800', '1');
INSERT INTO `sys_area` VALUES ('410883', '410883', '孟州市', '410800', '1');
INSERT INTO `sys_area` VALUES ('410900', '410900', '濮阳市', '410000', '1');
INSERT INTO `sys_area` VALUES ('410902', '410902', '华龙区', '410900', '1');
INSERT INTO `sys_area` VALUES ('410922', '410922', '清丰县', '410900', '1');
INSERT INTO `sys_area` VALUES ('410923', '410923', '南乐县', '410900', '1');
INSERT INTO `sys_area` VALUES ('410926', '410926', '范县', '410900', '1');
INSERT INTO `sys_area` VALUES ('410927', '410927', '台前县', '410900', '1');
INSERT INTO `sys_area` VALUES ('410928', '410928', '濮阳县', '410900', '1');
INSERT INTO `sys_area` VALUES ('411000', '411000', '许昌市', '410000', '1');
INSERT INTO `sys_area` VALUES ('411002', '411002', '魏都区', '411000', '1');
INSERT INTO `sys_area` VALUES ('411023', '411023', '许昌县', '411000', '1');
INSERT INTO `sys_area` VALUES ('411024', '411024', '鄢陵县', '411000', '1');
INSERT INTO `sys_area` VALUES ('411025', '411025', '襄城县', '411000', '1');
INSERT INTO `sys_area` VALUES ('411081', '411081', '禹州市', '411000', '1');
INSERT INTO `sys_area` VALUES ('411082', '411082', '长葛市', '411000', '1');
INSERT INTO `sys_area` VALUES ('411100', '411100', '漯河市', '410000', '1');
INSERT INTO `sys_area` VALUES ('411102', '411102', '源汇区', '411100', '1');
INSERT INTO `sys_area` VALUES ('411103', '411103', '郾城区', '411100', '1');
INSERT INTO `sys_area` VALUES ('411104', '411104', '召陵区', '411100', '1');
INSERT INTO `sys_area` VALUES ('411121', '411121', '舞阳县', '411100', '1');
INSERT INTO `sys_area` VALUES ('411122', '411122', '临颍县', '411100', '1');
INSERT INTO `sys_area` VALUES ('411200', '411200', '三门峡市', '410000', '1');
INSERT INTO `sys_area` VALUES ('411202', '411202', '湖滨区', '411200', '1');
INSERT INTO `sys_area` VALUES ('411221', '411221', '渑池县', '411200', '1');
INSERT INTO `sys_area` VALUES ('411222', '411222', '陕县', '411200', '1');
INSERT INTO `sys_area` VALUES ('411224', '411224', '卢氏县', '411200', '1');
INSERT INTO `sys_area` VALUES ('411281', '411281', '义马市', '411200', '1');
INSERT INTO `sys_area` VALUES ('411282', '411282', '灵宝市', '411200', '1');
INSERT INTO `sys_area` VALUES ('411300', '411300', '南阳市', '410000', '1');
INSERT INTO `sys_area` VALUES ('411302', '411302', '宛城区', '411300', '1');
INSERT INTO `sys_area` VALUES ('411303', '411303', '卧龙区', '411300', '1');
INSERT INTO `sys_area` VALUES ('411321', '411321', '南召县', '411300', '1');
INSERT INTO `sys_area` VALUES ('411322', '411322', '方城县', '411300', '1');
INSERT INTO `sys_area` VALUES ('411323', '411323', '西峡县', '411300', '1');
INSERT INTO `sys_area` VALUES ('411324', '411324', '镇平县', '411300', '1');
INSERT INTO `sys_area` VALUES ('411325', '411325', '内乡县', '411300', '1');
INSERT INTO `sys_area` VALUES ('411326', '411326', '淅川县', '411300', '1');
INSERT INTO `sys_area` VALUES ('411327', '411327', '社旗县', '411300', '1');
INSERT INTO `sys_area` VALUES ('411328', '411328', '唐河县', '411300', '1');
INSERT INTO `sys_area` VALUES ('411329', '411329', '新野县', '411300', '1');
INSERT INTO `sys_area` VALUES ('411330', '411330', '桐柏县', '411300', '1');
INSERT INTO `sys_area` VALUES ('411381', '411381', '邓州市', '411300', '1');
INSERT INTO `sys_area` VALUES ('411400', '411400', '商丘市', '410000', '1');
INSERT INTO `sys_area` VALUES ('411402', '411402', '梁园区', '411400', '1');
INSERT INTO `sys_area` VALUES ('411403', '411403', '睢阳区', '411400', '1');
INSERT INTO `sys_area` VALUES ('411421', '411421', '民权县', '411400', '1');
INSERT INTO `sys_area` VALUES ('411422', '411422', '睢县', '411400', '1');
INSERT INTO `sys_area` VALUES ('411423', '411423', '宁陵县', '411400', '1');
INSERT INTO `sys_area` VALUES ('411424', '411424', '柘城县', '411400', '1');
INSERT INTO `sys_area` VALUES ('411425', '411425', '虞城县', '411400', '1');
INSERT INTO `sys_area` VALUES ('411426', '411426', '夏邑县', '411400', '1');
INSERT INTO `sys_area` VALUES ('411481', '411481', '永城市', '411400', '1');
INSERT INTO `sys_area` VALUES ('411500', '411500', '信阳市', '410000', '1');
INSERT INTO `sys_area` VALUES ('411502', '411502', '浉河区', '411500', '1');
INSERT INTO `sys_area` VALUES ('411503', '411503', '平桥区', '411500', '1');
INSERT INTO `sys_area` VALUES ('411521', '411521', '罗山县', '411500', '1');
INSERT INTO `sys_area` VALUES ('411522', '411522', '光山县', '411500', '1');
INSERT INTO `sys_area` VALUES ('411523', '411523', '新县', '411500', '1');
INSERT INTO `sys_area` VALUES ('411524', '411524', '商城县', '411500', '1');
INSERT INTO `sys_area` VALUES ('411525', '411525', '固始县', '411500', '1');
INSERT INTO `sys_area` VALUES ('411526', '411526', '潢川县', '411500', '1');
INSERT INTO `sys_area` VALUES ('411527', '411527', '淮滨县', '411500', '1');
INSERT INTO `sys_area` VALUES ('411528', '411528', '息县', '411500', '1');
INSERT INTO `sys_area` VALUES ('411600', '411600', '周口市', '410000', '1');
INSERT INTO `sys_area` VALUES ('411602', '411602', '川汇区', '411600', '1');
INSERT INTO `sys_area` VALUES ('411621', '411621', '扶沟县', '411600', '1');
INSERT INTO `sys_area` VALUES ('411622', '411622', '西华县', '411600', '1');
INSERT INTO `sys_area` VALUES ('411623', '411623', '商水县', '411600', '1');
INSERT INTO `sys_area` VALUES ('411624', '411624', '沈丘县', '411600', '1');
INSERT INTO `sys_area` VALUES ('411625', '411625', '郸城县', '411600', '1');
INSERT INTO `sys_area` VALUES ('411626', '411626', '淮阳县', '411600', '1');
INSERT INTO `sys_area` VALUES ('411627', '411627', '太康县', '411600', '1');
INSERT INTO `sys_area` VALUES ('411628', '411628', '鹿邑县', '411600', '1');
INSERT INTO `sys_area` VALUES ('411681', '411681', '项城市', '411600', '1');
INSERT INTO `sys_area` VALUES ('411700', '411700', '驻马店市', '410000', '1');
INSERT INTO `sys_area` VALUES ('411702', '411702', '驿城区', '411700', '1');
INSERT INTO `sys_area` VALUES ('411721', '411721', '西平县', '411700', '1');
INSERT INTO `sys_area` VALUES ('411722', '411722', '上蔡县', '411700', '1');
INSERT INTO `sys_area` VALUES ('411723', '411723', '平舆县', '411700', '1');
INSERT INTO `sys_area` VALUES ('411724', '411724', '正阳县', '411700', '1');
INSERT INTO `sys_area` VALUES ('411725', '411725', '确山县', '411700', '1');
INSERT INTO `sys_area` VALUES ('411726', '411726', '泌阳县', '411700', '1');
INSERT INTO `sys_area` VALUES ('411727', '411727', '汝南县', '411700', '1');
INSERT INTO `sys_area` VALUES ('411728', '411728', '遂平县', '411700', '1');
INSERT INTO `sys_area` VALUES ('411729', '411729', '新蔡县', '411700', '1');
INSERT INTO `sys_area` VALUES ('419000', '419000', '省直辖县级行政区划', '410000', '1');
INSERT INTO `sys_area` VALUES ('419001', '419001', '济源市', '419000', '1');
INSERT INTO `sys_area` VALUES ('420000', '420000', '湖北省', '0', '1');
INSERT INTO `sys_area` VALUES ('420100', '420100', '武汉市', '420000', '1');
INSERT INTO `sys_area` VALUES ('420102', '420102', '江岸区', '420100', '1');
INSERT INTO `sys_area` VALUES ('420103', '420103', '江汉区', '420100', '1');
INSERT INTO `sys_area` VALUES ('420104', '420104', '硚口区', '420100', '1');
INSERT INTO `sys_area` VALUES ('420105', '420105', '汉阳区', '420100', '1');
INSERT INTO `sys_area` VALUES ('420106', '420106', '武昌区', '420100', '1');
INSERT INTO `sys_area` VALUES ('420107', '420107', '青山区', '420100', '1');
INSERT INTO `sys_area` VALUES ('420111', '420111', '洪山区', '420100', '1');
INSERT INTO `sys_area` VALUES ('420112', '420112', '东西湖区', '420100', '1');
INSERT INTO `sys_area` VALUES ('420113', '420113', '汉南区', '420100', '1');
INSERT INTO `sys_area` VALUES ('420114', '420114', '蔡甸区', '420100', '1');
INSERT INTO `sys_area` VALUES ('420115', '420115', '江夏区', '420100', '1');
INSERT INTO `sys_area` VALUES ('420116', '420116', '黄陂区', '420100', '1');
INSERT INTO `sys_area` VALUES ('420117', '420117', '新洲区', '420100', '1');
INSERT INTO `sys_area` VALUES ('420200', '420200', '黄石市', '420000', '1');
INSERT INTO `sys_area` VALUES ('420202', '420202', '黄石港区', '420200', '1');
INSERT INTO `sys_area` VALUES ('420203', '420203', '西塞山区', '420200', '1');
INSERT INTO `sys_area` VALUES ('420204', '420204', '下陆区', '420200', '1');
INSERT INTO `sys_area` VALUES ('420205', '420205', '铁山区', '420200', '1');
INSERT INTO `sys_area` VALUES ('420222', '420222', '阳新县', '420200', '1');
INSERT INTO `sys_area` VALUES ('420281', '420281', '大冶市', '420200', '1');
INSERT INTO `sys_area` VALUES ('420300', '420300', '十堰市', '420000', '1');
INSERT INTO `sys_area` VALUES ('420302', '420302', '茅箭区', '420300', '1');
INSERT INTO `sys_area` VALUES ('420303', '420303', '张湾区', '420300', '1');
INSERT INTO `sys_area` VALUES ('420321', '420321', '郧县', '420300', '1');
INSERT INTO `sys_area` VALUES ('420322', '420322', '郧西县', '420300', '1');
INSERT INTO `sys_area` VALUES ('420323', '420323', '竹山县', '420300', '1');
INSERT INTO `sys_area` VALUES ('420324', '420324', '竹溪县', '420300', '1');
INSERT INTO `sys_area` VALUES ('420325', '420325', '房县', '420300', '1');
INSERT INTO `sys_area` VALUES ('420381', '420381', '丹江口市', '420300', '1');
INSERT INTO `sys_area` VALUES ('420500', '420500', '宜昌市', '420000', '1');
INSERT INTO `sys_area` VALUES ('420502', '420502', '西陵区', '420500', '1');
INSERT INTO `sys_area` VALUES ('420503', '420503', '伍家岗区', '420500', '1');
INSERT INTO `sys_area` VALUES ('420504', '420504', '点军区', '420500', '1');
INSERT INTO `sys_area` VALUES ('420505', '420505', '猇亭区', '420500', '1');
INSERT INTO `sys_area` VALUES ('420506', '420506', '夷陵区', '420500', '1');
INSERT INTO `sys_area` VALUES ('420525', '420525', '远安县', '420500', '1');
INSERT INTO `sys_area` VALUES ('420526', '420526', '兴山县', '420500', '1');
INSERT INTO `sys_area` VALUES ('420527', '420527', '秭归县', '420500', '1');
INSERT INTO `sys_area` VALUES ('420528', '420528', '长阳土家族自治县', '420500', '1');
INSERT INTO `sys_area` VALUES ('420529', '420529', '五峰土家族自治县', '420500', '1');
INSERT INTO `sys_area` VALUES ('420581', '420581', '宜都市', '420500', '1');
INSERT INTO `sys_area` VALUES ('420582', '420582', '当阳市', '420500', '1');
INSERT INTO `sys_area` VALUES ('420583', '420583', '枝江市', '420500', '1');
INSERT INTO `sys_area` VALUES ('420600', '420600', '襄阳市', '420000', '1');
INSERT INTO `sys_area` VALUES ('420602', '420602', '襄城区', '420600', '1');
INSERT INTO `sys_area` VALUES ('420606', '420606', '樊城区', '420600', '1');
INSERT INTO `sys_area` VALUES ('420607', '420607', '襄州区', '420600', '1');
INSERT INTO `sys_area` VALUES ('420624', '420624', '南漳县', '420600', '1');
INSERT INTO `sys_area` VALUES ('420625', '420625', '谷城县', '420600', '1');
INSERT INTO `sys_area` VALUES ('420626', '420626', '保康县', '420600', '1');
INSERT INTO `sys_area` VALUES ('420682', '420682', '老河口市', '420600', '1');
INSERT INTO `sys_area` VALUES ('420683', '420683', '枣阳市', '420600', '1');
INSERT INTO `sys_area` VALUES ('420684', '420684', '宜城市', '420600', '1');
INSERT INTO `sys_area` VALUES ('420700', '420700', '鄂州市', '420000', '1');
INSERT INTO `sys_area` VALUES ('420702', '420702', '梁子湖区', '420700', '1');
INSERT INTO `sys_area` VALUES ('420703', '420703', '华容区', '420700', '1');
INSERT INTO `sys_area` VALUES ('420704', '420704', '鄂城区', '420700', '1');
INSERT INTO `sys_area` VALUES ('420800', '420800', '荆门市', '420000', '1');
INSERT INTO `sys_area` VALUES ('420802', '420802', '东宝区', '420800', '1');
INSERT INTO `sys_area` VALUES ('420804', '420804', '掇刀区', '420800', '1');
INSERT INTO `sys_area` VALUES ('420821', '420821', '京山县', '420800', '1');
INSERT INTO `sys_area` VALUES ('420822', '420822', '沙洋县', '420800', '1');
INSERT INTO `sys_area` VALUES ('420881', '420881', '钟祥市', '420800', '1');
INSERT INTO `sys_area` VALUES ('420900', '420900', '孝感市', '420000', '1');
INSERT INTO `sys_area` VALUES ('420902', '420902', '孝南区', '420900', '1');
INSERT INTO `sys_area` VALUES ('420921', '420921', '孝昌县', '420900', '1');
INSERT INTO `sys_area` VALUES ('420922', '420922', '大悟县', '420900', '1');
INSERT INTO `sys_area` VALUES ('420923', '420923', '云梦县', '420900', '1');
INSERT INTO `sys_area` VALUES ('420981', '420981', '应城市', '420900', '1');
INSERT INTO `sys_area` VALUES ('420982', '420982', '安陆市', '420900', '1');
INSERT INTO `sys_area` VALUES ('420984', '420984', '汉川市', '420900', '1');
INSERT INTO `sys_area` VALUES ('421000', '421000', '荆州市', '420000', '1');
INSERT INTO `sys_area` VALUES ('421002', '421002', '沙市区', '421000', '1');
INSERT INTO `sys_area` VALUES ('421003', '421003', '荆州区', '421000', '1');
INSERT INTO `sys_area` VALUES ('421022', '421022', '公安县', '421000', '1');
INSERT INTO `sys_area` VALUES ('421023', '421023', '监利县', '421000', '1');
INSERT INTO `sys_area` VALUES ('421024', '421024', '江陵县', '421000', '1');
INSERT INTO `sys_area` VALUES ('421081', '421081', '石首市', '421000', '1');
INSERT INTO `sys_area` VALUES ('421083', '421083', '洪湖市', '421000', '1');
INSERT INTO `sys_area` VALUES ('421087', '421087', '松滋市', '421000', '1');
INSERT INTO `sys_area` VALUES ('421100', '421100', '黄冈市', '420000', '1');
INSERT INTO `sys_area` VALUES ('421102', '421102', '黄州区', '421100', '1');
INSERT INTO `sys_area` VALUES ('421121', '421121', '团风县', '421100', '1');
INSERT INTO `sys_area` VALUES ('421122', '421122', '红安县', '421100', '1');
INSERT INTO `sys_area` VALUES ('421123', '421123', '罗田县', '421100', '1');
INSERT INTO `sys_area` VALUES ('421124', '421124', '英山县', '421100', '1');
INSERT INTO `sys_area` VALUES ('421125', '421125', '浠水县', '421100', '1');
INSERT INTO `sys_area` VALUES ('421126', '421126', '蕲春县', '421100', '1');
INSERT INTO `sys_area` VALUES ('421127', '421127', '黄梅县', '421100', '1');
INSERT INTO `sys_area` VALUES ('421181', '421181', '麻城市', '421100', '1');
INSERT INTO `sys_area` VALUES ('421182', '421182', '武穴市', '421100', '1');
INSERT INTO `sys_area` VALUES ('421200', '421200', '咸宁市', '420000', '1');
INSERT INTO `sys_area` VALUES ('421202', '421202', '咸安区', '421200', '1');
INSERT INTO `sys_area` VALUES ('421221', '421221', '嘉鱼县', '421200', '1');
INSERT INTO `sys_area` VALUES ('421222', '421222', '通城县', '421200', '1');
INSERT INTO `sys_area` VALUES ('421223', '421223', '崇阳县', '421200', '1');
INSERT INTO `sys_area` VALUES ('421224', '421224', '通山县', '421200', '1');
INSERT INTO `sys_area` VALUES ('421281', '421281', '赤壁市', '421200', '1');
INSERT INTO `sys_area` VALUES ('421300', '421300', '随州市', '420000', '1');
INSERT INTO `sys_area` VALUES ('421302', '421302', '曾都区', '421300', '1');
INSERT INTO `sys_area` VALUES ('421321', '421321', '随县', '421300', '1');
INSERT INTO `sys_area` VALUES ('421381', '421381', '广水市', '421300', '1');
INSERT INTO `sys_area` VALUES ('422800', '422800', '恩施土家族苗族自治州', '420000', '1');
INSERT INTO `sys_area` VALUES ('422801', '422801', '恩施市', '422800', '1');
INSERT INTO `sys_area` VALUES ('422802', '422802', '利川市', '422800', '1');
INSERT INTO `sys_area` VALUES ('422822', '422822', '建始县', '422800', '1');
INSERT INTO `sys_area` VALUES ('422823', '422823', '巴东县', '422800', '1');
INSERT INTO `sys_area` VALUES ('422825', '422825', '宣恩县', '422800', '1');
INSERT INTO `sys_area` VALUES ('422826', '422826', '咸丰县', '422800', '1');
INSERT INTO `sys_area` VALUES ('422827', '422827', '来凤县', '422800', '1');
INSERT INTO `sys_area` VALUES ('422828', '422828', '鹤峰县', '422800', '1');
INSERT INTO `sys_area` VALUES ('429000', '429000', '省直辖县级行政区划', '420000', '1');
INSERT INTO `sys_area` VALUES ('429004', '429004', '仙桃市', '429000', '1');
INSERT INTO `sys_area` VALUES ('429005', '429005', '潜江市', '429000', '1');
INSERT INTO `sys_area` VALUES ('429006', '429006', '天门市', '429000', '1');
INSERT INTO `sys_area` VALUES ('429021', '429021', '神农架林区', '429000', '1');
INSERT INTO `sys_area` VALUES ('430000', '430000', '湖南省', '0', '1');
INSERT INTO `sys_area` VALUES ('430100', '430100', '长沙市', '430000', '1');
INSERT INTO `sys_area` VALUES ('430102', '430102', '芙蓉区', '430100', '1');
INSERT INTO `sys_area` VALUES ('430103', '430103', '天心区', '430100', '1');
INSERT INTO `sys_area` VALUES ('430104', '430104', '岳麓区', '430100', '1');
INSERT INTO `sys_area` VALUES ('430105', '430105', '开福区', '430100', '1');
INSERT INTO `sys_area` VALUES ('430111', '430111', '雨花区', '430100', '1');
INSERT INTO `sys_area` VALUES ('430121', '430121', '长沙县', '430100', '1');
INSERT INTO `sys_area` VALUES ('430122', '430122', '望城区', '430100', '1');
INSERT INTO `sys_area` VALUES ('430124', '430124', '宁乡县', '430100', '1');
INSERT INTO `sys_area` VALUES ('430181', '430181', '浏阳市', '430100', '1');
INSERT INTO `sys_area` VALUES ('430200', '430200', '株洲市', '430000', '1');
INSERT INTO `sys_area` VALUES ('430202', '430202', '荷塘区', '430200', '1');
INSERT INTO `sys_area` VALUES ('430203', '430203', '芦淞区', '430200', '1');
INSERT INTO `sys_area` VALUES ('430204', '430204', '石峰区', '430200', '1');
INSERT INTO `sys_area` VALUES ('430211', '430211', '天元区', '430200', '1');
INSERT INTO `sys_area` VALUES ('430221', '430221', '株洲县', '430200', '1');
INSERT INTO `sys_area` VALUES ('430223', '430223', '攸县', '430200', '1');
INSERT INTO `sys_area` VALUES ('430224', '430224', '茶陵县', '430200', '1');
INSERT INTO `sys_area` VALUES ('430225', '430225', '炎陵县', '430200', '1');
INSERT INTO `sys_area` VALUES ('430281', '430281', '醴陵市', '430200', '1');
INSERT INTO `sys_area` VALUES ('430300', '430300', '湘潭市', '430000', '1');
INSERT INTO `sys_area` VALUES ('430302', '430302', '雨湖区', '430300', '1');
INSERT INTO `sys_area` VALUES ('430304', '430304', '岳塘区', '430300', '1');
INSERT INTO `sys_area` VALUES ('430321', '430321', '湘潭县', '430300', '1');
INSERT INTO `sys_area` VALUES ('430381', '430381', '湘乡市', '430300', '1');
INSERT INTO `sys_area` VALUES ('430382', '430382', '韶山市', '430300', '1');
INSERT INTO `sys_area` VALUES ('430400', '430400', '衡阳市', '430000', '1');
INSERT INTO `sys_area` VALUES ('430405', '430405', '珠晖区', '430400', '1');
INSERT INTO `sys_area` VALUES ('430406', '430406', '雁峰区', '430400', '1');
INSERT INTO `sys_area` VALUES ('430407', '430407', '石鼓区', '430400', '1');
INSERT INTO `sys_area` VALUES ('430408', '430408', '蒸湘区', '430400', '1');
INSERT INTO `sys_area` VALUES ('430412', '430412', '南岳区', '430400', '1');
INSERT INTO `sys_area` VALUES ('430421', '430421', '衡阳县', '430400', '1');
INSERT INTO `sys_area` VALUES ('430422', '430422', '衡南县', '430400', '1');
INSERT INTO `sys_area` VALUES ('430423', '430423', '衡山县', '430400', '1');
INSERT INTO `sys_area` VALUES ('430424', '430424', '衡东县', '430400', '1');
INSERT INTO `sys_area` VALUES ('430426', '430426', '祁东县', '430400', '1');
INSERT INTO `sys_area` VALUES ('430481', '430481', '耒阳市', '430400', '1');
INSERT INTO `sys_area` VALUES ('430482', '430482', '常宁市', '430400', '1');
INSERT INTO `sys_area` VALUES ('430500', '430500', '邵阳市', '430000', '1');
INSERT INTO `sys_area` VALUES ('430502', '430502', '双清区', '430500', '1');
INSERT INTO `sys_area` VALUES ('430503', '430503', '大祥区', '430500', '1');
INSERT INTO `sys_area` VALUES ('430511', '430511', '北塔区', '430500', '1');
INSERT INTO `sys_area` VALUES ('430521', '430521', '邵东县', '430500', '1');
INSERT INTO `sys_area` VALUES ('430522', '430522', '新邵县', '430500', '1');
INSERT INTO `sys_area` VALUES ('430523', '430523', '邵阳县', '430500', '1');
INSERT INTO `sys_area` VALUES ('430524', '430524', '隆回县', '430500', '1');
INSERT INTO `sys_area` VALUES ('430525', '430525', '洞口县', '430500', '1');
INSERT INTO `sys_area` VALUES ('430527', '430527', '绥宁县', '430500', '1');
INSERT INTO `sys_area` VALUES ('430528', '430528', '新宁县', '430500', '1');
INSERT INTO `sys_area` VALUES ('430529', '430529', '城步苗族自治县', '430500', '1');
INSERT INTO `sys_area` VALUES ('430581', '430581', '武冈市', '430500', '1');
INSERT INTO `sys_area` VALUES ('430600', '430600', '岳阳市', '430000', '1');
INSERT INTO `sys_area` VALUES ('430602', '430602', '岳阳楼区', '430600', '1');
INSERT INTO `sys_area` VALUES ('430603', '430603', '云溪区', '430600', '1');
INSERT INTO `sys_area` VALUES ('430611', '430611', '君山区', '430600', '1');
INSERT INTO `sys_area` VALUES ('430621', '430621', '岳阳县', '430600', '1');
INSERT INTO `sys_area` VALUES ('430623', '430623', '华容县', '430600', '1');
INSERT INTO `sys_area` VALUES ('430624', '430624', '湘阴县', '430600', '1');
INSERT INTO `sys_area` VALUES ('430626', '430626', '平江县', '430600', '1');
INSERT INTO `sys_area` VALUES ('430681', '430681', '汨罗市', '430600', '1');
INSERT INTO `sys_area` VALUES ('430682', '430682', '临湘市', '430600', '1');
INSERT INTO `sys_area` VALUES ('430700', '430700', '常德市', '430000', '1');
INSERT INTO `sys_area` VALUES ('430702', '430702', '武陵区', '430700', '1');
INSERT INTO `sys_area` VALUES ('430703', '430703', '鼎城区', '430700', '1');
INSERT INTO `sys_area` VALUES ('430721', '430721', '安乡县', '430700', '1');
INSERT INTO `sys_area` VALUES ('430722', '430722', '汉寿县', '430700', '1');
INSERT INTO `sys_area` VALUES ('430723', '430723', '澧县', '430700', '1');
INSERT INTO `sys_area` VALUES ('430724', '430724', '临澧县', '430700', '1');
INSERT INTO `sys_area` VALUES ('430725', '430725', '桃源县', '430700', '1');
INSERT INTO `sys_area` VALUES ('430726', '430726', '石门县', '430700', '1');
INSERT INTO `sys_area` VALUES ('430781', '430781', '津市市', '430700', '1');
INSERT INTO `sys_area` VALUES ('430800', '430800', '张家界市', '430000', '1');
INSERT INTO `sys_area` VALUES ('430802', '430802', '永定区', '430800', '1');
INSERT INTO `sys_area` VALUES ('430811', '430811', '武陵源区', '430800', '1');
INSERT INTO `sys_area` VALUES ('430821', '430821', '慈利县', '430800', '1');
INSERT INTO `sys_area` VALUES ('430822', '430822', '桑植县', '430800', '1');
INSERT INTO `sys_area` VALUES ('430900', '430900', '益阳市', '430000', '1');
INSERT INTO `sys_area` VALUES ('430902', '430902', '资阳区', '430900', '1');
INSERT INTO `sys_area` VALUES ('430903', '430903', '赫山区', '430900', '1');
INSERT INTO `sys_area` VALUES ('430921', '430921', '南县', '430900', '1');
INSERT INTO `sys_area` VALUES ('430922', '430922', '桃江县', '430900', '1');
INSERT INTO `sys_area` VALUES ('430923', '430923', '安化县', '430900', '1');
INSERT INTO `sys_area` VALUES ('430981', '430981', '沅江市', '430900', '1');
INSERT INTO `sys_area` VALUES ('431000', '431000', '郴州市', '430000', '1');
INSERT INTO `sys_area` VALUES ('431002', '431002', '北湖区', '431000', '1');
INSERT INTO `sys_area` VALUES ('431003', '431003', '苏仙区', '431000', '1');
INSERT INTO `sys_area` VALUES ('431021', '431021', '桂阳县', '431000', '1');
INSERT INTO `sys_area` VALUES ('431022', '431022', '宜章县', '431000', '1');
INSERT INTO `sys_area` VALUES ('431023', '431023', '永兴县', '431000', '1');
INSERT INTO `sys_area` VALUES ('431024', '431024', '嘉禾县', '431000', '1');
INSERT INTO `sys_area` VALUES ('431025', '431025', '临武县', '431000', '1');
INSERT INTO `sys_area` VALUES ('431026', '431026', '汝城县', '431000', '1');
INSERT INTO `sys_area` VALUES ('431027', '431027', '桂东县', '431000', '1');
INSERT INTO `sys_area` VALUES ('431028', '431028', '安仁县', '431000', '1');
INSERT INTO `sys_area` VALUES ('431081', '431081', '资兴市', '431000', '1');
INSERT INTO `sys_area` VALUES ('431100', '431100', '永州市', '430000', '1');
INSERT INTO `sys_area` VALUES ('431102', '431102', '零陵区', '431100', '1');
INSERT INTO `sys_area` VALUES ('431103', '431103', '冷水滩区', '431100', '1');
INSERT INTO `sys_area` VALUES ('431121', '431121', '祁阳县', '431100', '1');
INSERT INTO `sys_area` VALUES ('431122', '431122', '东安县', '431100', '1');
INSERT INTO `sys_area` VALUES ('431123', '431123', '双牌县', '431100', '1');
INSERT INTO `sys_area` VALUES ('431124', '431124', '道县', '431100', '1');
INSERT INTO `sys_area` VALUES ('431125', '431125', '江永县', '431100', '1');
INSERT INTO `sys_area` VALUES ('431126', '431126', '宁远县', '431100', '1');
INSERT INTO `sys_area` VALUES ('431127', '431127', '蓝山县', '431100', '1');
INSERT INTO `sys_area` VALUES ('431128', '431128', '新田县', '431100', '1');
INSERT INTO `sys_area` VALUES ('431129', '431129', '江华瑶族自治县', '431100', '1');
INSERT INTO `sys_area` VALUES ('431200', '431200', '怀化市', '430000', '1');
INSERT INTO `sys_area` VALUES ('431202', '431202', '鹤城区', '431200', '1');
INSERT INTO `sys_area` VALUES ('431221', '431221', '中方县', '431200', '1');
INSERT INTO `sys_area` VALUES ('431222', '431222', '沅陵县', '431200', '1');
INSERT INTO `sys_area` VALUES ('431223', '431223', '辰溪县', '431200', '1');
INSERT INTO `sys_area` VALUES ('431224', '431224', '溆浦县', '431200', '1');
INSERT INTO `sys_area` VALUES ('431225', '431225', '会同县', '431200', '1');
INSERT INTO `sys_area` VALUES ('431226', '431226', '麻阳苗族自治县', '431200', '1');
INSERT INTO `sys_area` VALUES ('431227', '431227', '新晃侗族自治县', '431200', '1');
INSERT INTO `sys_area` VALUES ('431228', '431228', '芷江侗族自治县', '431200', '1');
INSERT INTO `sys_area` VALUES ('431229', '431229', '靖州苗族侗族自治县', '431200', '1');
INSERT INTO `sys_area` VALUES ('431230', '431230', '通道侗族自治县', '431200', '1');
INSERT INTO `sys_area` VALUES ('431281', '431281', '洪江市', '431200', '1');
INSERT INTO `sys_area` VALUES ('431300', '431300', '娄底市', '430000', '1');
INSERT INTO `sys_area` VALUES ('431302', '431302', '娄星区', '431300', '1');
INSERT INTO `sys_area` VALUES ('431321', '431321', '双峰县', '431300', '1');
INSERT INTO `sys_area` VALUES ('431322', '431322', '新化县', '431300', '1');
INSERT INTO `sys_area` VALUES ('431381', '431381', '冷水江市', '431300', '1');
INSERT INTO `sys_area` VALUES ('431382', '431382', '涟源市', '431300', '1');
INSERT INTO `sys_area` VALUES ('433100', '433100', '湘西土家族苗族自治州', '430000', '1');
INSERT INTO `sys_area` VALUES ('433101', '433101', '吉首市', '433100', '1');
INSERT INTO `sys_area` VALUES ('433122', '433122', '泸溪县', '433100', '1');
INSERT INTO `sys_area` VALUES ('433123', '433123', '凤凰县', '433100', '1');
INSERT INTO `sys_area` VALUES ('433124', '433124', '花垣县', '433100', '1');
INSERT INTO `sys_area` VALUES ('433125', '433125', '保靖县', '433100', '1');
INSERT INTO `sys_area` VALUES ('433126', '433126', '古丈县', '433100', '1');
INSERT INTO `sys_area` VALUES ('433127', '433127', '永顺县', '433100', '1');
INSERT INTO `sys_area` VALUES ('433130', '433130', '龙山县', '433100', '1');
INSERT INTO `sys_area` VALUES ('440000', '440000', '广东省', '0', '1');
INSERT INTO `sys_area` VALUES ('440100', '440100', '广州市', '440000', '1');
INSERT INTO `sys_area` VALUES ('440102', '440102', '东山区', '440100', '1');
INSERT INTO `sys_area` VALUES ('440103', '440103', '荔湾区', '440100', '1');
INSERT INTO `sys_area` VALUES ('440104', '440104', '越秀区', '440100', '1');
INSERT INTO `sys_area` VALUES ('440105', '440105', '海珠区', '440100', '1');
INSERT INTO `sys_area` VALUES ('440106', '440106', '天河区', '440100', '1');
INSERT INTO `sys_area` VALUES ('440107', '440107', '芳村区', '440100', '1');
INSERT INTO `sys_area` VALUES ('440111', '440111', '白云区', '440100', '1');
INSERT INTO `sys_area` VALUES ('440112', '440112', '黄埔区', '440100', '1');
INSERT INTO `sys_area` VALUES ('440113', '440113', '番禺区', '440100', '1');
INSERT INTO `sys_area` VALUES ('440114', '440114', '花都区', '440100', '1');
INSERT INTO `sys_area` VALUES ('440115', '440115', '南沙区', '440100', '1');
INSERT INTO `sys_area` VALUES ('440116', '440116', '萝岗区', '440100', '1');
INSERT INTO `sys_area` VALUES ('440183', '440183', '增城市', '440100', '1');
INSERT INTO `sys_area` VALUES ('440184', '440184', '从化市', '440100', '1');
INSERT INTO `sys_area` VALUES ('440200', '440200', '韶关市', '440000', '1');
INSERT INTO `sys_area` VALUES ('440203', '440203', '武江区', '440200', '1');
INSERT INTO `sys_area` VALUES ('440204', '440204', '浈江区', '440200', '1');
INSERT INTO `sys_area` VALUES ('440205', '440205', '曲江区', '440200', '1');
INSERT INTO `sys_area` VALUES ('440222', '440222', '始兴县', '440200', '1');
INSERT INTO `sys_area` VALUES ('440224', '440224', '仁化县', '440200', '1');
INSERT INTO `sys_area` VALUES ('440229', '440229', '翁源县', '440200', '1');
INSERT INTO `sys_area` VALUES ('440232', '440232', '乳源瑶族自治县', '440200', '1');
INSERT INTO `sys_area` VALUES ('440233', '440233', '新丰县', '440200', '1');
INSERT INTO `sys_area` VALUES ('440281', '440281', '乐昌市', '440200', '1');
INSERT INTO `sys_area` VALUES ('440282', '440282', '南雄市', '440200', '1');
INSERT INTO `sys_area` VALUES ('440300', '440300', '深圳市', '440000', '1');
INSERT INTO `sys_area` VALUES ('440303', '440303', '罗湖区', '440300', '1');
INSERT INTO `sys_area` VALUES ('440304', '440304', '福田区', '440300', '1');
INSERT INTO `sys_area` VALUES ('440305', '440305', '南山区', '440300', '1');
INSERT INTO `sys_area` VALUES ('440306', '440306', '宝安区', '440300', '1');
INSERT INTO `sys_area` VALUES ('440307', '440307', '龙岗区', '440300', '1');
INSERT INTO `sys_area` VALUES ('440308', '440308', '盐田区', '440300', '1');
INSERT INTO `sys_area` VALUES ('440400', '440400', '珠海市', '440000', '1');
INSERT INTO `sys_area` VALUES ('440402', '440402', '香洲区', '440400', '1');
INSERT INTO `sys_area` VALUES ('440403', '440403', '斗门区', '440400', '1');
INSERT INTO `sys_area` VALUES ('440404', '440404', '金湾区', '440400', '1');
INSERT INTO `sys_area` VALUES ('440500', '440500', '汕头市', '440000', '1');
INSERT INTO `sys_area` VALUES ('440507', '440507', '龙湖区', '440500', '1');
INSERT INTO `sys_area` VALUES ('440511', '440511', '金平区', '440500', '1');
INSERT INTO `sys_area` VALUES ('440512', '440512', '濠江区', '440500', '1');
INSERT INTO `sys_area` VALUES ('440513', '440513', '潮阳区', '440500', '1');
INSERT INTO `sys_area` VALUES ('440514', '440514', '潮南区', '440500', '1');
INSERT INTO `sys_area` VALUES ('440515', '440515', '澄海区', '440500', '1');
INSERT INTO `sys_area` VALUES ('440523', '440523', '南澳县', '440500', '1');
INSERT INTO `sys_area` VALUES ('440600', '440600', '佛山市', '440000', '1');
INSERT INTO `sys_area` VALUES ('440604', '440604', '禅城区', '440600', '1');
INSERT INTO `sys_area` VALUES ('440605', '440605', '南海区', '440600', '1');
INSERT INTO `sys_area` VALUES ('440606', '440606', '顺德区', '440600', '1');
INSERT INTO `sys_area` VALUES ('440607', '440607', '三水区', '440600', '1');
INSERT INTO `sys_area` VALUES ('440608', '440608', '高明区', '440600', '1');
INSERT INTO `sys_area` VALUES ('440700', '440700', '江门市', '440000', '1');
INSERT INTO `sys_area` VALUES ('440703', '440703', '蓬江区', '440700', '1');
INSERT INTO `sys_area` VALUES ('440704', '440704', '江海区', '440700', '1');
INSERT INTO `sys_area` VALUES ('440705', '440705', '新会区', '440700', '1');
INSERT INTO `sys_area` VALUES ('440781', '440781', '台山市', '440700', '1');
INSERT INTO `sys_area` VALUES ('440783', '440783', '开平市', '440700', '1');
INSERT INTO `sys_area` VALUES ('440784', '440784', '鹤山市', '440700', '1');
INSERT INTO `sys_area` VALUES ('440785', '440785', '恩平市', '440700', '1');
INSERT INTO `sys_area` VALUES ('440800', '440800', '湛江市', '440000', '1');
INSERT INTO `sys_area` VALUES ('440802', '440802', '赤坎区', '440800', '1');
INSERT INTO `sys_area` VALUES ('440803', '440803', '霞山区', '440800', '1');
INSERT INTO `sys_area` VALUES ('440804', '440804', '坡头区', '440800', '1');
INSERT INTO `sys_area` VALUES ('440811', '440811', '麻章区', '440800', '1');
INSERT INTO `sys_area` VALUES ('440823', '440823', '遂溪县', '440800', '1');
INSERT INTO `sys_area` VALUES ('440825', '440825', '徐闻县', '440800', '1');
INSERT INTO `sys_area` VALUES ('440881', '440881', '廉江市', '440800', '1');
INSERT INTO `sys_area` VALUES ('440882', '440882', '雷州市', '440800', '1');
INSERT INTO `sys_area` VALUES ('440883', '440883', '吴川市', '440800', '1');
INSERT INTO `sys_area` VALUES ('440900', '440900', '茂名市', '440000', '1');
INSERT INTO `sys_area` VALUES ('440902', '440902', '茂南区', '440900', '1');
INSERT INTO `sys_area` VALUES ('440903', '440903', '茂港区', '440900', '1');
INSERT INTO `sys_area` VALUES ('440923', '440923', '电白县', '440900', '1');
INSERT INTO `sys_area` VALUES ('440981', '440981', '高州市', '440900', '1');
INSERT INTO `sys_area` VALUES ('440982', '440982', '化州市', '440900', '1');
INSERT INTO `sys_area` VALUES ('440983', '440983', '信宜市', '440900', '1');
INSERT INTO `sys_area` VALUES ('441200', '441200', '肇庆市', '440000', '1');
INSERT INTO `sys_area` VALUES ('441202', '441202', '端州区', '441200', '1');
INSERT INTO `sys_area` VALUES ('441203', '441203', '鼎湖区', '441200', '1');
INSERT INTO `sys_area` VALUES ('441223', '441223', '广宁县', '441200', '1');
INSERT INTO `sys_area` VALUES ('441224', '441224', '怀集县', '441200', '1');
INSERT INTO `sys_area` VALUES ('441225', '441225', '封开县', '441200', '1');
INSERT INTO `sys_area` VALUES ('441226', '441226', '德庆县', '441200', '1');
INSERT INTO `sys_area` VALUES ('441283', '441283', '高要市', '441200', '1');
INSERT INTO `sys_area` VALUES ('441284', '441284', '四会市', '441200', '1');
INSERT INTO `sys_area` VALUES ('441300', '441300', '惠州市', '440000', '1');
INSERT INTO `sys_area` VALUES ('441302', '441302', '惠城区', '441300', '1');
INSERT INTO `sys_area` VALUES ('441303', '441303', '惠阳区', '441300', '1');
INSERT INTO `sys_area` VALUES ('441322', '441322', '博罗县', '441300', '1');
INSERT INTO `sys_area` VALUES ('441323', '441323', '惠东县', '441300', '1');
INSERT INTO `sys_area` VALUES ('441324', '441324', '龙门县', '441300', '1');
INSERT INTO `sys_area` VALUES ('441400', '441400', '梅州市', '440000', '1');
INSERT INTO `sys_area` VALUES ('441402', '441402', '梅江区', '441400', '1');
INSERT INTO `sys_area` VALUES ('441421', '441421', '梅县', '441400', '1');
INSERT INTO `sys_area` VALUES ('441422', '441422', '大埔县', '441400', '1');
INSERT INTO `sys_area` VALUES ('441423', '441423', '丰顺县', '441400', '1');
INSERT INTO `sys_area` VALUES ('441424', '441424', '五华县', '441400', '1');
INSERT INTO `sys_area` VALUES ('441426', '441426', '平远县', '441400', '1');
INSERT INTO `sys_area` VALUES ('441427', '441427', '蕉岭县', '441400', '1');
INSERT INTO `sys_area` VALUES ('441481', '441481', '兴宁市', '441400', '1');
INSERT INTO `sys_area` VALUES ('441500', '441500', '汕尾市', '440000', '1');
INSERT INTO `sys_area` VALUES ('441502', '441502', '城区', '441500', '1');
INSERT INTO `sys_area` VALUES ('441521', '441521', '海丰县', '441500', '1');
INSERT INTO `sys_area` VALUES ('441523', '441523', '陆河县', '441500', '1');
INSERT INTO `sys_area` VALUES ('441581', '441581', '陆丰市', '441500', '1');
INSERT INTO `sys_area` VALUES ('441600', '441600', '河源市', '440000', '1');
INSERT INTO `sys_area` VALUES ('441602', '441602', '源城区', '441600', '1');
INSERT INTO `sys_area` VALUES ('441621', '441621', '紫金县', '441600', '1');
INSERT INTO `sys_area` VALUES ('441622', '441622', '龙川县', '441600', '1');
INSERT INTO `sys_area` VALUES ('441623', '441623', '连平县', '441600', '1');
INSERT INTO `sys_area` VALUES ('441624', '441624', '和平县', '441600', '1');
INSERT INTO `sys_area` VALUES ('441625', '441625', '东源县', '441600', '1');
INSERT INTO `sys_area` VALUES ('441700', '441700', '阳江市', '440000', '1');
INSERT INTO `sys_area` VALUES ('441702', '441702', '江城区', '441700', '1');
INSERT INTO `sys_area` VALUES ('441721', '441721', '阳西县', '441700', '1');
INSERT INTO `sys_area` VALUES ('441723', '441723', '阳东县', '441700', '1');
INSERT INTO `sys_area` VALUES ('441781', '441781', '阳春市', '441700', '1');
INSERT INTO `sys_area` VALUES ('441800', '441800', '清远市', '440000', '1');
INSERT INTO `sys_area` VALUES ('441802', '441802', '清城区', '441800', '1');
INSERT INTO `sys_area` VALUES ('441821', '441821', '佛冈县', '441800', '1');
INSERT INTO `sys_area` VALUES ('441823', '441823', '阳山县', '441800', '1');
INSERT INTO `sys_area` VALUES ('441825', '441825', '连山壮族瑶族自治县', '441800', '1');
INSERT INTO `sys_area` VALUES ('441826', '441826', '连南瑶族自治县', '441800', '1');
INSERT INTO `sys_area` VALUES ('441827', '441827', '清新县', '441800', '1');
INSERT INTO `sys_area` VALUES ('441881', '441881', '英德市', '441800', '1');
INSERT INTO `sys_area` VALUES ('441882', '441882', '连州市', '441800', '1');
INSERT INTO `sys_area` VALUES ('441900', '441900', '东莞市', '440000', '1');
INSERT INTO `sys_area` VALUES ('441901', '441901', '南城区', '441900', '1');
INSERT INTO `sys_area` VALUES ('441902', '441902', '茶山镇', '441900', '1');
INSERT INTO `sys_area` VALUES ('441903', '441903', '万江区', '441900', '1');
INSERT INTO `sys_area` VALUES ('441904', '441904', '石龙镇', '441900', '1');
INSERT INTO `sys_area` VALUES ('441905', '441905', '虎门镇', '441900', '1');
INSERT INTO `sys_area` VALUES ('441906', '441906', '中堂镇', '441900', '1');
INSERT INTO `sys_area` VALUES ('441907', '441907', '麻涌镇', '441900', '1');
INSERT INTO `sys_area` VALUES ('441908', '441908', '石碣镇', '441900', '1');
INSERT INTO `sys_area` VALUES ('441909', '441909', '高埗镇', '441900', '1');
INSERT INTO `sys_area` VALUES ('441910', '441910', '洪梅镇', '441900', '1');
INSERT INTO `sys_area` VALUES ('441911', '441911', '望牛墩镇', '441900', '1');
INSERT INTO `sys_area` VALUES ('441912', '441912', '道滘镇', '441900', '1');
INSERT INTO `sys_area` VALUES ('441913', '441913', '厚街镇', '441900', '1');
INSERT INTO `sys_area` VALUES ('441914', '441914', '沙田镇', '441900', '1');
INSERT INTO `sys_area` VALUES ('441915', '441915', '长安镇', '441900', '1');
INSERT INTO `sys_area` VALUES ('441916', '441916', '寮步镇', '441900', '1');
INSERT INTO `sys_area` VALUES ('441917', '441917', '大朗镇', '441900', '1');
INSERT INTO `sys_area` VALUES ('441918', '441918', '黄江镇', '441900', '1');
INSERT INTO `sys_area` VALUES ('441919', '441919', '大岭山镇', '441900', '1');
INSERT INTO `sys_area` VALUES ('441920', '441920', '凤岗镇', '441900', '1');
INSERT INTO `sys_area` VALUES ('441921', '441921', '塘厦镇', '441900', '1');
INSERT INTO `sys_area` VALUES ('441922', '441922', '谢岗镇', '441900', '1');
INSERT INTO `sys_area` VALUES ('441923', '441923', '清溪镇', '441900', '1');
INSERT INTO `sys_area` VALUES ('441924', '441924', '常平镇', '441900', '1');
INSERT INTO `sys_area` VALUES ('441925', '441925', '桥头镇', '441900', '1');
INSERT INTO `sys_area` VALUES ('441926', '441926', '横沥镇', '441900', '1');
INSERT INTO `sys_area` VALUES ('441927', '441927', '樟木头镇', '441900', '1');
INSERT INTO `sys_area` VALUES ('441928', '441928', '东坑镇', '441900', '1');
INSERT INTO `sys_area` VALUES ('441929', '441929', '企石镇', '441900', '1');
INSERT INTO `sys_area` VALUES ('441930', '441930', '石排镇', '441900', '1');
INSERT INTO `sys_area` VALUES ('441931', '441931', '莞城区', '441900', '1');
INSERT INTO `sys_area` VALUES ('441932', '441932', '东城区', '441900', '1');
INSERT INTO `sys_area` VALUES ('442000', '442000', '中山市', '440000', '1');
INSERT INTO `sys_area` VALUES ('442001', '442001', '南区', '442000', '1');
INSERT INTO `sys_area` VALUES ('442002', '442002', '石岐区', '442000', '1');
INSERT INTO `sys_area` VALUES ('442003', '442003', '中山火炬高技术产业开发区', '442000', '1');
INSERT INTO `sys_area` VALUES ('442004', '442004', '五桂山区', '442000', '1');
INSERT INTO `sys_area` VALUES ('442005', '442005', '南朗镇', '442000', '1');
INSERT INTO `sys_area` VALUES ('442006', '442006', '三乡镇', '442000', '1');
INSERT INTO `sys_area` VALUES ('442007', '442007', '民众镇', '442000', '1');
INSERT INTO `sys_area` VALUES ('442008', '442008', '神湾镇', '442000', '1');
INSERT INTO `sys_area` VALUES ('442009', '442009', '板芙镇', '442000', '1');
INSERT INTO `sys_area` VALUES ('442010', '442010', '大涌镇', '442000', '1');
INSERT INTO `sys_area` VALUES ('442011', '442011', '沙溪镇', '442000', '1');
INSERT INTO `sys_area` VALUES ('442012', '442012', '横栏镇', '442000', '1');
INSERT INTO `sys_area` VALUES ('442013', '442013', '古镇镇', '442000', '1');
INSERT INTO `sys_area` VALUES ('442014', '442014', '小榄镇', '442000', '1');
INSERT INTO `sys_area` VALUES ('442015', '442015', '东凤镇', '442000', '1');
INSERT INTO `sys_area` VALUES ('442016', '442016', '南头镇', '442000', '1');
INSERT INTO `sys_area` VALUES ('442017', '442017', '黄圃镇', '442000', '1');
INSERT INTO `sys_area` VALUES ('442018', '442018', '三角镇', '442000', '1');
INSERT INTO `sys_area` VALUES ('442019', '442019', '港口镇', '442000', '1');
INSERT INTO `sys_area` VALUES ('442020', '442020', '阜沙镇', '442000', '1');
INSERT INTO `sys_area` VALUES ('442021', '442021', '东升镇', '442000', '1');
INSERT INTO `sys_area` VALUES ('442022', '442022', '坦洲镇', '442000', '1');
INSERT INTO `sys_area` VALUES ('442023', '442023', '东区', '442000', '1');
INSERT INTO `sys_area` VALUES ('442024', '442024', '西区', '442000', '1');
INSERT INTO `sys_area` VALUES ('445100', '445100', '潮州市', '440000', '1');
INSERT INTO `sys_area` VALUES ('445102', '445102', '湘桥区', '445100', '1');
INSERT INTO `sys_area` VALUES ('445121', '445121', '潮安县', '445100', '1');
INSERT INTO `sys_area` VALUES ('445122', '445122', '饶平县', '445100', '1');
INSERT INTO `sys_area` VALUES ('445200', '445200', '揭阳市', '440000', '1');
INSERT INTO `sys_area` VALUES ('445202', '445202', '榕城区', '445200', '1');
INSERT INTO `sys_area` VALUES ('445221', '445221', '揭东县', '445200', '1');
INSERT INTO `sys_area` VALUES ('445222', '445222', '揭西县', '445200', '1');
INSERT INTO `sys_area` VALUES ('445224', '445224', '惠来县', '445200', '1');
INSERT INTO `sys_area` VALUES ('445281', '445281', '普宁市', '445200', '1');
INSERT INTO `sys_area` VALUES ('445300', '445300', '云浮市', '440000', '1');
INSERT INTO `sys_area` VALUES ('445302', '445302', '云城区', '445300', '1');
INSERT INTO `sys_area` VALUES ('445321', '445321', '新兴县', '445300', '1');
INSERT INTO `sys_area` VALUES ('445322', '445322', '郁南县', '445300', '1');
INSERT INTO `sys_area` VALUES ('445323', '445323', '云安县', '445300', '1');
INSERT INTO `sys_area` VALUES ('445381', '445381', '罗定市', '445300', '1');
INSERT INTO `sys_area` VALUES ('450000', '450000', '广西壮族自治区', '0', '1');
INSERT INTO `sys_area` VALUES ('450100', '450100', '南宁市', '450000', '1');
INSERT INTO `sys_area` VALUES ('450102', '450102', '兴宁区', '450100', '1');
INSERT INTO `sys_area` VALUES ('450103', '450103', '青秀区', '450100', '1');
INSERT INTO `sys_area` VALUES ('450105', '450105', '江南区', '450100', '1');
INSERT INTO `sys_area` VALUES ('450107', '450107', '西乡塘区', '450100', '1');
INSERT INTO `sys_area` VALUES ('450108', '450108', '良庆区', '450100', '1');
INSERT INTO `sys_area` VALUES ('450109', '450109', '邕宁区', '450100', '1');
INSERT INTO `sys_area` VALUES ('450122', '450122', '武鸣县', '450100', '1');
INSERT INTO `sys_area` VALUES ('450123', '450123', '隆安县', '450100', '1');
INSERT INTO `sys_area` VALUES ('450124', '450124', '马山县', '450100', '1');
INSERT INTO `sys_area` VALUES ('450125', '450125', '上林县', '450100', '1');
INSERT INTO `sys_area` VALUES ('450126', '450126', '宾阳县', '450100', '1');
INSERT INTO `sys_area` VALUES ('450127', '450127', '横县', '450100', '1');
INSERT INTO `sys_area` VALUES ('450200', '450200', '柳州市', '450000', '1');
INSERT INTO `sys_area` VALUES ('450202', '450202', '城中区', '450200', '1');
INSERT INTO `sys_area` VALUES ('450203', '450203', '鱼峰区', '450200', '1');
INSERT INTO `sys_area` VALUES ('450204', '450204', '柳南区', '450200', '1');
INSERT INTO `sys_area` VALUES ('450205', '450205', '柳北区', '450200', '1');
INSERT INTO `sys_area` VALUES ('450221', '450221', '柳江县', '450200', '1');
INSERT INTO `sys_area` VALUES ('450222', '450222', '柳城县', '450200', '1');
INSERT INTO `sys_area` VALUES ('450223', '450223', '鹿寨县', '450200', '1');
INSERT INTO `sys_area` VALUES ('450224', '450224', '融安县', '450200', '1');
INSERT INTO `sys_area` VALUES ('450225', '450225', '融水苗族自治县', '450200', '1');
INSERT INTO `sys_area` VALUES ('450226', '450226', '三江侗族自治县', '450200', '1');
INSERT INTO `sys_area` VALUES ('450300', '450300', '桂林市', '450000', '1');
INSERT INTO `sys_area` VALUES ('450302', '450302', '秀峰区', '450300', '1');
INSERT INTO `sys_area` VALUES ('450303', '450303', '叠彩区', '450300', '1');
INSERT INTO `sys_area` VALUES ('450304', '450304', '象山区', '450300', '1');
INSERT INTO `sys_area` VALUES ('450305', '450305', '七星区', '450300', '1');
INSERT INTO `sys_area` VALUES ('450311', '450311', '雁山区', '450300', '1');
INSERT INTO `sys_area` VALUES ('450321', '450321', '阳朔县', '450300', '1');
INSERT INTO `sys_area` VALUES ('450322', '450322', '临桂县', '450300', '1');
INSERT INTO `sys_area` VALUES ('450323', '450323', '灵川县', '450300', '1');
INSERT INTO `sys_area` VALUES ('450324', '450324', '全州县', '450300', '1');
INSERT INTO `sys_area` VALUES ('450325', '450325', '兴安县', '450300', '1');
INSERT INTO `sys_area` VALUES ('450326', '450326', '永福县', '450300', '1');
INSERT INTO `sys_area` VALUES ('450327', '450327', '灌阳县', '450300', '1');
INSERT INTO `sys_area` VALUES ('450328', '450328', '龙胜各族自治县', '450300', '1');
INSERT INTO `sys_area` VALUES ('450329', '450329', '资源县', '450300', '1');
INSERT INTO `sys_area` VALUES ('450330', '450330', '平乐县', '450300', '1');
INSERT INTO `sys_area` VALUES ('450331', '450331', '荔蒲县', '450300', '1');
INSERT INTO `sys_area` VALUES ('450332', '450332', '恭城瑶族自治县', '450300', '1');
INSERT INTO `sys_area` VALUES ('450400', '450400', '梧州市', '450000', '1');
INSERT INTO `sys_area` VALUES ('450403', '450403', '万秀区', '450400', '1');
INSERT INTO `sys_area` VALUES ('450404', '450404', '蝶山区', '450400', '1');
INSERT INTO `sys_area` VALUES ('450405', '450405', '长洲区', '450400', '1');
INSERT INTO `sys_area` VALUES ('450421', '450421', '苍梧县', '450400', '1');
INSERT INTO `sys_area` VALUES ('450422', '450422', '藤县', '450400', '1');
INSERT INTO `sys_area` VALUES ('450423', '450423', '蒙山县', '450400', '1');
INSERT INTO `sys_area` VALUES ('450481', '450481', '岑溪市', '450400', '1');
INSERT INTO `sys_area` VALUES ('450500', '450500', '北海市', '450000', '1');
INSERT INTO `sys_area` VALUES ('450502', '450502', '海城区', '450500', '1');
INSERT INTO `sys_area` VALUES ('450503', '450503', '银海区', '450500', '1');
INSERT INTO `sys_area` VALUES ('450512', '450512', '铁山港区', '450500', '1');
INSERT INTO `sys_area` VALUES ('450521', '450521', '合浦县', '450500', '1');
INSERT INTO `sys_area` VALUES ('450600', '450600', '防城港市', '450000', '1');
INSERT INTO `sys_area` VALUES ('450602', '450602', '港口区', '450600', '1');
INSERT INTO `sys_area` VALUES ('450603', '450603', '防城区', '450600', '1');
INSERT INTO `sys_area` VALUES ('450621', '450621', '上思县', '450600', '1');
INSERT INTO `sys_area` VALUES ('450681', '450681', '东兴市', '450600', '1');
INSERT INTO `sys_area` VALUES ('450700', '450700', '钦州市', '450000', '1');
INSERT INTO `sys_area` VALUES ('450702', '450702', '钦南区', '450700', '1');
INSERT INTO `sys_area` VALUES ('450703', '450703', '钦北区', '450700', '1');
INSERT INTO `sys_area` VALUES ('450721', '450721', '灵山县', '450700', '1');
INSERT INTO `sys_area` VALUES ('450722', '450722', '浦北县', '450700', '1');
INSERT INTO `sys_area` VALUES ('450800', '450800', '贵港市', '450000', '1');
INSERT INTO `sys_area` VALUES ('450802', '450802', '港北区', '450800', '1');
INSERT INTO `sys_area` VALUES ('450803', '450803', '港南区', '450800', '1');
INSERT INTO `sys_area` VALUES ('450804', '450804', '覃塘区', '450800', '1');
INSERT INTO `sys_area` VALUES ('450821', '450821', '平南县', '450800', '1');
INSERT INTO `sys_area` VALUES ('450881', '450881', '桂平市', '450800', '1');
INSERT INTO `sys_area` VALUES ('450900', '450900', '玉林市', '450000', '1');
INSERT INTO `sys_area` VALUES ('450902', '450902', '玉州区', '450900', '1');
INSERT INTO `sys_area` VALUES ('450921', '450921', '容县', '450900', '1');
INSERT INTO `sys_area` VALUES ('450922', '450922', '陆川县', '450900', '1');
INSERT INTO `sys_area` VALUES ('450923', '450923', '博白县', '450900', '1');
INSERT INTO `sys_area` VALUES ('450924', '450924', '兴业县', '450900', '1');
INSERT INTO `sys_area` VALUES ('450981', '450981', '北流市', '450900', '1');
INSERT INTO `sys_area` VALUES ('451000', '451000', '百色市', '450000', '1');
INSERT INTO `sys_area` VALUES ('451002', '451002', '右江区', '451000', '1');
INSERT INTO `sys_area` VALUES ('451021', '451021', '田阳县', '451000', '1');
INSERT INTO `sys_area` VALUES ('451022', '451022', '田东县', '451000', '1');
INSERT INTO `sys_area` VALUES ('451023', '451023', '平果县', '451000', '1');
INSERT INTO `sys_area` VALUES ('451024', '451024', '德保县', '451000', '1');
INSERT INTO `sys_area` VALUES ('451025', '451025', '靖西县', '451000', '1');
INSERT INTO `sys_area` VALUES ('451026', '451026', '那坡县', '451000', '1');
INSERT INTO `sys_area` VALUES ('451027', '451027', '凌云县', '451000', '1');
INSERT INTO `sys_area` VALUES ('451028', '451028', '乐业县', '451000', '1');
INSERT INTO `sys_area` VALUES ('451029', '451029', '田林县', '451000', '1');
INSERT INTO `sys_area` VALUES ('451030', '451030', '西林县', '451000', '1');
INSERT INTO `sys_area` VALUES ('451031', '451031', '隆林各族自治县', '451000', '1');
INSERT INTO `sys_area` VALUES ('451100', '451100', '贺州市', '450000', '1');
INSERT INTO `sys_area` VALUES ('451102', '451102', '八步区', '451100', '1');
INSERT INTO `sys_area` VALUES ('451121', '451121', '昭平县', '451100', '1');
INSERT INTO `sys_area` VALUES ('451122', '451122', '钟山县', '451100', '1');
INSERT INTO `sys_area` VALUES ('451123', '451123', '富川瑶族自治县', '451100', '1');
INSERT INTO `sys_area` VALUES ('451200', '451200', '河池市', '450000', '1');
INSERT INTO `sys_area` VALUES ('451202', '451202', '金城江区', '451200', '1');
INSERT INTO `sys_area` VALUES ('451221', '451221', '南丹县', '451200', '1');
INSERT INTO `sys_area` VALUES ('451222', '451222', '天峨县', '451200', '1');
INSERT INTO `sys_area` VALUES ('451223', '451223', '凤山县', '451200', '1');
INSERT INTO `sys_area` VALUES ('451224', '451224', '东兰县', '451200', '1');
INSERT INTO `sys_area` VALUES ('451225', '451225', '罗城仫佬族自治县', '451200', '1');
INSERT INTO `sys_area` VALUES ('451226', '451226', '环江毛南族自治县', '451200', '1');
INSERT INTO `sys_area` VALUES ('451227', '451227', '巴马瑶族自治县', '451200', '1');
INSERT INTO `sys_area` VALUES ('451228', '451228', '都安瑶族自治县', '451200', '1');
INSERT INTO `sys_area` VALUES ('451229', '451229', '大化瑶族自治县', '451200', '1');
INSERT INTO `sys_area` VALUES ('451281', '451281', '宜州市', '451200', '1');
INSERT INTO `sys_area` VALUES ('451300', '451300', '来宾市', '450000', '1');
INSERT INTO `sys_area` VALUES ('451302', '451302', '兴宾区', '451300', '1');
INSERT INTO `sys_area` VALUES ('451321', '451321', '忻城县', '451300', '1');
INSERT INTO `sys_area` VALUES ('451322', '451322', '象州县', '451300', '1');
INSERT INTO `sys_area` VALUES ('451323', '451323', '武宣县', '451300', '1');
INSERT INTO `sys_area` VALUES ('451324', '451324', '金秀瑶族自治县', '451300', '1');
INSERT INTO `sys_area` VALUES ('451381', '451381', '合山市', '451300', '1');
INSERT INTO `sys_area` VALUES ('451400', '451400', '崇左市', '450000', '1');
INSERT INTO `sys_area` VALUES ('451402', '451402', '江洲区', '451400', '1');
INSERT INTO `sys_area` VALUES ('451421', '451421', '扶绥县', '451400', '1');
INSERT INTO `sys_area` VALUES ('451422', '451422', '宁明县', '451400', '1');
INSERT INTO `sys_area` VALUES ('451423', '451423', '龙州县', '451400', '1');
INSERT INTO `sys_area` VALUES ('451424', '451424', '大新县', '451400', '1');
INSERT INTO `sys_area` VALUES ('451425', '451425', '天等县', '451400', '1');
INSERT INTO `sys_area` VALUES ('451481', '451481', '凭祥市', '451400', '1');
INSERT INTO `sys_area` VALUES ('460000', '460000', '海南省', '0', '1');
INSERT INTO `sys_area` VALUES ('460100', '460100', '海口市', '460000', '1');
INSERT INTO `sys_area` VALUES ('460105', '460105', '秀英区', '460100', '1');
INSERT INTO `sys_area` VALUES ('460106', '460106', '龙华区', '460100', '1');
INSERT INTO `sys_area` VALUES ('460107', '460107', '琼山区', '460100', '1');
INSERT INTO `sys_area` VALUES ('460108', '460108', '美兰区', '460100', '1');
INSERT INTO `sys_area` VALUES ('460200', '460200', '三亚市', '460000', '1');
INSERT INTO `sys_area` VALUES ('460202', '460202', '海棠湾镇', '460200', '1');
INSERT INTO `sys_area` VALUES ('460203', '460203', '吉阳镇', '460200', '1');
INSERT INTO `sys_area` VALUES ('460204', '460204', '凤凰镇', '460200', '1');
INSERT INTO `sys_area` VALUES ('460205', '460205', '国营农场', '460200', '1');
INSERT INTO `sys_area` VALUES ('460206', '460206', '天涯镇', '460200', '1');
INSERT INTO `sys_area` VALUES ('460207', '460207', '育才镇', '460200', '1');
INSERT INTO `sys_area` VALUES ('460208', '460208', '崖城镇', '460200', '1');
INSERT INTO `sys_area` VALUES ('460209', '460209', '河东区', '460200', '1');
INSERT INTO `sys_area` VALUES ('460210', '460210', '河西区', '460200', '1');
INSERT INTO `sys_area` VALUES ('460300', '460300', '三沙市', '460000', '1');
INSERT INTO `sys_area` VALUES ('460321', '460321', '西沙群岛', '469000', '1');
INSERT INTO `sys_area` VALUES ('460322', '460322', '南沙群岛', '469000', '1');
INSERT INTO `sys_area` VALUES ('460323', '460323', '中沙群岛的岛礁及其海域', '469000', '1');
INSERT INTO `sys_area` VALUES ('469000', '469000', '省直辖县级行政区划', '460000', '1');
INSERT INTO `sys_area` VALUES ('469001', '469001', '五指山市', '469000', '1');
INSERT INTO `sys_area` VALUES ('469002', '469002', '琼海市', '469000', '1');
INSERT INTO `sys_area` VALUES ('469003', '469003', '儋州市', '469000', '1');
INSERT INTO `sys_area` VALUES ('469005', '469005', '文昌市', '469000', '1');
INSERT INTO `sys_area` VALUES ('469006', '469006', '万宁市', '469000', '1');
INSERT INTO `sys_area` VALUES ('469007', '469007', '东方市', '469000', '1');
INSERT INTO `sys_area` VALUES ('469021', '469021', '定安县', '469000', '1');
INSERT INTO `sys_area` VALUES ('469022', '469022', '屯昌县', '469000', '1');
INSERT INTO `sys_area` VALUES ('469023', '469023', '澄迈县', '469000', '1');
INSERT INTO `sys_area` VALUES ('469024', '469024', '临高县', '469000', '1');
INSERT INTO `sys_area` VALUES ('469025', '469025', '白沙黎族自治县', '469000', '1');
INSERT INTO `sys_area` VALUES ('469026', '469026', '昌江黎族自治县', '469000', '1');
INSERT INTO `sys_area` VALUES ('469027', '469027', '乐东黎族自治县', '469000', '1');
INSERT INTO `sys_area` VALUES ('469028', '469028', '陵水黎族自治县', '469000', '1');
INSERT INTO `sys_area` VALUES ('469029', '469029', '保亭黎族苗族自治县', '469000', '1');
INSERT INTO `sys_area` VALUES ('469030', '469030', '琼中黎族苗族自治县', '469000', '1');
INSERT INTO `sys_area` VALUES ('500000', '500000', '重庆市', '0', '1');
INSERT INTO `sys_area` VALUES ('500100', '500100', '重庆市', '500000', '1');
INSERT INTO `sys_area` VALUES ('500101', '500101', '万州区', '500100', '1');
INSERT INTO `sys_area` VALUES ('500102', '500102', '涪陵区', '500100', '1');
INSERT INTO `sys_area` VALUES ('500103', '500103', '渝中区', '500100', '1');
INSERT INTO `sys_area` VALUES ('500104', '500104', '大渡口区', '500100', '1');
INSERT INTO `sys_area` VALUES ('500105', '500105', '江北区', '500100', '1');
INSERT INTO `sys_area` VALUES ('500106', '500106', '沙坪坝区', '500100', '1');
INSERT INTO `sys_area` VALUES ('500107', '500107', '九龙坡区', '500100', '1');
INSERT INTO `sys_area` VALUES ('500108', '500108', '南岸区', '500100', '1');
INSERT INTO `sys_area` VALUES ('500109', '500109', '北碚区', '500100', '1');
INSERT INTO `sys_area` VALUES ('500110', '500110', '綦江区', '500100', '1');
INSERT INTO `sys_area` VALUES ('500111', '500111', '大足区', '500100', '1');
INSERT INTO `sys_area` VALUES ('500112', '500112', '渝北区', '500100', '1');
INSERT INTO `sys_area` VALUES ('500113', '500113', '巴南区', '500100', '1');
INSERT INTO `sys_area` VALUES ('500114', '500114', '黔江区', '500100', '1');
INSERT INTO `sys_area` VALUES ('500115', '500115', '长寿区', '500100', '1');
INSERT INTO `sys_area` VALUES ('500116', '500116', '江津区', '500100', '1');
INSERT INTO `sys_area` VALUES ('500117', '500117', '合川区', '500100', '1');
INSERT INTO `sys_area` VALUES ('500118', '500118', '永川区', '500100', '1');
INSERT INTO `sys_area` VALUES ('500119', '500119', '南川区', '500100', '1');
INSERT INTO `sys_area` VALUES ('500223', '500223', '潼南县', '500100', '1');
INSERT INTO `sys_area` VALUES ('500224', '500224', '铜梁县', '500100', '1');
INSERT INTO `sys_area` VALUES ('500226', '500226', '荣昌县', '500100', '1');
INSERT INTO `sys_area` VALUES ('500227', '500227', '璧山县', '500100', '1');
INSERT INTO `sys_area` VALUES ('500228', '500228', '梁平县', '500100', '1');
INSERT INTO `sys_area` VALUES ('500229', '500229', '城口县', '500100', '1');
INSERT INTO `sys_area` VALUES ('500230', '500230', '丰都县', '500100', '1');
INSERT INTO `sys_area` VALUES ('500231', '500231', '垫江县', '500100', '1');
INSERT INTO `sys_area` VALUES ('500232', '500232', '武隆县', '500100', '1');
INSERT INTO `sys_area` VALUES ('500233', '500233', '忠县', '500100', '1');
INSERT INTO `sys_area` VALUES ('500234', '500234', '开县', '500100', '1');
INSERT INTO `sys_area` VALUES ('500235', '500235', '云阳县', '500100', '1');
INSERT INTO `sys_area` VALUES ('500236', '500236', '奉节县', '500100', '1');
INSERT INTO `sys_area` VALUES ('500237', '500237', '巫山县', '500100', '1');
INSERT INTO `sys_area` VALUES ('500238', '500238', '巫溪县', '500100', '1');
INSERT INTO `sys_area` VALUES ('500240', '500240', '石柱土家族自治县', '500100', '1');
INSERT INTO `sys_area` VALUES ('500241', '500241', '秀山土家族苗族自治县', '500100', '1');
INSERT INTO `sys_area` VALUES ('500242', '500242', '酉阳土家族苗族自治县', '500100', '1');
INSERT INTO `sys_area` VALUES ('500243', '500243', '彭水苗族土家族自治县', '500100', '1');
INSERT INTO `sys_area` VALUES ('510000', '510000', '四川省', '0', '1');
INSERT INTO `sys_area` VALUES ('510100', '510100', '成都市', '510000', '1');
INSERT INTO `sys_area` VALUES ('510104', '510104', '锦江区', '510100', '1');
INSERT INTO `sys_area` VALUES ('510105', '510105', '青羊区', '510100', '1');
INSERT INTO `sys_area` VALUES ('510106', '510106', '金牛区', '510100', '1');
INSERT INTO `sys_area` VALUES ('510107', '510107', '武侯区', '510100', '1');
INSERT INTO `sys_area` VALUES ('510108', '510108', '成华区', '510100', '1');
INSERT INTO `sys_area` VALUES ('510112', '510112', '龙泉驿区', '510100', '1');
INSERT INTO `sys_area` VALUES ('510113', '510113', '青白江区', '510100', '1');
INSERT INTO `sys_area` VALUES ('510114', '510114', '新都区', '510100', '1');
INSERT INTO `sys_area` VALUES ('510115', '510115', '温江区', '510100', '1');
INSERT INTO `sys_area` VALUES ('510121', '510121', '金堂县', '510100', '1');
INSERT INTO `sys_area` VALUES ('510122', '510122', '双流县', '510100', '1');
INSERT INTO `sys_area` VALUES ('510124', '510124', '郫县', '510100', '1');
INSERT INTO `sys_area` VALUES ('510129', '510129', '大邑县', '510100', '1');
INSERT INTO `sys_area` VALUES ('510131', '510131', '蒲江县', '510100', '1');
INSERT INTO `sys_area` VALUES ('510132', '510132', '新津县', '510100', '1');
INSERT INTO `sys_area` VALUES ('510181', '510181', '都江堰市', '510100', '1');
INSERT INTO `sys_area` VALUES ('510182', '510182', '彭州市', '510100', '1');
INSERT INTO `sys_area` VALUES ('510183', '510183', '邛崃市', '510100', '1');
INSERT INTO `sys_area` VALUES ('510184', '510184', '崇州市', '510100', '1');
INSERT INTO `sys_area` VALUES ('510300', '510300', '自贡市', '510000', '1');
INSERT INTO `sys_area` VALUES ('510302', '510302', '自流井区', '510300', '1');
INSERT INTO `sys_area` VALUES ('510303', '510303', '贡井区', '510300', '1');
INSERT INTO `sys_area` VALUES ('510304', '510304', '大安区', '510300', '1');
INSERT INTO `sys_area` VALUES ('510311', '510311', '沿滩区', '510300', '1');
INSERT INTO `sys_area` VALUES ('510321', '510321', '荣县', '510300', '1');
INSERT INTO `sys_area` VALUES ('510322', '510322', '富顺县', '510300', '1');
INSERT INTO `sys_area` VALUES ('510400', '510400', '攀枝花市', '510000', '1');
INSERT INTO `sys_area` VALUES ('510402', '510402', '东区', '510400', '1');
INSERT INTO `sys_area` VALUES ('510403', '510403', '西区', '510400', '1');
INSERT INTO `sys_area` VALUES ('510411', '510411', '仁和区', '510400', '1');
INSERT INTO `sys_area` VALUES ('510421', '510421', '米易县', '510400', '1');
INSERT INTO `sys_area` VALUES ('510422', '510422', '盐边县', '510400', '1');
INSERT INTO `sys_area` VALUES ('510500', '510500', '泸州市', '510000', '1');
INSERT INTO `sys_area` VALUES ('510502', '510502', '江阳区', '510500', '1');
INSERT INTO `sys_area` VALUES ('510503', '510503', '纳溪区', '510500', '1');
INSERT INTO `sys_area` VALUES ('510504', '510504', '龙马潭区', '510500', '1');
INSERT INTO `sys_area` VALUES ('510521', '510521', '泸县', '510500', '1');
INSERT INTO `sys_area` VALUES ('510522', '510522', '合江县', '510500', '1');
INSERT INTO `sys_area` VALUES ('510524', '510524', '叙永县', '510500', '1');
INSERT INTO `sys_area` VALUES ('510525', '510525', '古蔺县', '510500', '1');
INSERT INTO `sys_area` VALUES ('510600', '510600', '德阳市', '510000', '1');
INSERT INTO `sys_area` VALUES ('510603', '510603', '旌阳区', '510600', '1');
INSERT INTO `sys_area` VALUES ('510623', '510623', '中江县', '510600', '1');
INSERT INTO `sys_area` VALUES ('510626', '510626', '罗江县', '510600', '1');
INSERT INTO `sys_area` VALUES ('510681', '510681', '广汉市', '510600', '1');
INSERT INTO `sys_area` VALUES ('510682', '510682', '什邡市', '510600', '1');
INSERT INTO `sys_area` VALUES ('510683', '510683', '绵竹市', '510600', '1');
INSERT INTO `sys_area` VALUES ('510700', '510700', '绵阳市', '510000', '1');
INSERT INTO `sys_area` VALUES ('510703', '510703', '涪城区', '510700', '1');
INSERT INTO `sys_area` VALUES ('510704', '510704', '游仙区', '510700', '1');
INSERT INTO `sys_area` VALUES ('510722', '510722', '三台县', '510700', '1');
INSERT INTO `sys_area` VALUES ('510723', '510723', '盐亭县', '510700', '1');
INSERT INTO `sys_area` VALUES ('510724', '510724', '安县', '510700', '1');
INSERT INTO `sys_area` VALUES ('510725', '510725', '梓潼县', '510700', '1');
INSERT INTO `sys_area` VALUES ('510726', '510726', '北川羌族自治县', '510700', '1');
INSERT INTO `sys_area` VALUES ('510727', '510727', '平武县', '510700', '1');
INSERT INTO `sys_area` VALUES ('510781', '510781', '江油市', '510700', '1');
INSERT INTO `sys_area` VALUES ('510800', '510800', '广元市', '510000', '1');
INSERT INTO `sys_area` VALUES ('510802', '510802', '利州区', '510800', '1');
INSERT INTO `sys_area` VALUES ('510803', '510803', '市中区', '510800', '1');
INSERT INTO `sys_area` VALUES ('510811', '510811', '元坝区', '510800', '1');
INSERT INTO `sys_area` VALUES ('510812', '510812', '朝天区', '510800', '1');
INSERT INTO `sys_area` VALUES ('510821', '510821', '旺苍县', '510800', '1');
INSERT INTO `sys_area` VALUES ('510822', '510822', '青川县', '510800', '1');
INSERT INTO `sys_area` VALUES ('510823', '510823', '剑阁县', '510800', '1');
INSERT INTO `sys_area` VALUES ('510824', '510824', '苍溪县', '510800', '1');
INSERT INTO `sys_area` VALUES ('510900', '510900', '遂宁市', '510000', '1');
INSERT INTO `sys_area` VALUES ('510903', '510903', '船山区', '510900', '1');
INSERT INTO `sys_area` VALUES ('510904', '510904', '安居区', '510900', '1');
INSERT INTO `sys_area` VALUES ('510921', '510921', '蓬溪县', '510900', '1');
INSERT INTO `sys_area` VALUES ('510922', '510922', '射洪县', '510900', '1');
INSERT INTO `sys_area` VALUES ('510923', '510923', '大英县', '510900', '1');
INSERT INTO `sys_area` VALUES ('511000', '511000', '内江市', '510000', '1');
INSERT INTO `sys_area` VALUES ('511002', '511002', '市中区', '511000', '1');
INSERT INTO `sys_area` VALUES ('511011', '511011', '东兴区', '511000', '1');
INSERT INTO `sys_area` VALUES ('511024', '511024', '威远县', '511000', '1');
INSERT INTO `sys_area` VALUES ('511025', '511025', '资中县', '511000', '1');
INSERT INTO `sys_area` VALUES ('511028', '511028', '隆昌县', '511000', '1');
INSERT INTO `sys_area` VALUES ('511100', '511100', '乐山市', '510000', '1');
INSERT INTO `sys_area` VALUES ('511102', '511102', '市中区', '511100', '1');
INSERT INTO `sys_area` VALUES ('511111', '511111', '沙湾区', '511100', '1');
INSERT INTO `sys_area` VALUES ('511112', '511112', '五通桥区', '511100', '1');
INSERT INTO `sys_area` VALUES ('511113', '511113', '金口河区', '511100', '1');
INSERT INTO `sys_area` VALUES ('511123', '511123', '犍为县', '511100', '1');
INSERT INTO `sys_area` VALUES ('511124', '511124', '井研县', '511100', '1');
INSERT INTO `sys_area` VALUES ('511126', '511126', '夹江县', '511100', '1');
INSERT INTO `sys_area` VALUES ('511129', '511129', '沐川县', '511100', '1');
INSERT INTO `sys_area` VALUES ('511132', '511132', '峨边彝族自治县', '511100', '1');
INSERT INTO `sys_area` VALUES ('511133', '511133', '马边彝族自治县', '511100', '1');
INSERT INTO `sys_area` VALUES ('511181', '511181', '峨眉山市', '511100', '1');
INSERT INTO `sys_area` VALUES ('511300', '511300', '南充市', '510000', '1');
INSERT INTO `sys_area` VALUES ('511302', '511302', '顺庆区', '511300', '1');
INSERT INTO `sys_area` VALUES ('511303', '511303', '高坪区', '511300', '1');
INSERT INTO `sys_area` VALUES ('511304', '511304', '嘉陵区', '511300', '1');
INSERT INTO `sys_area` VALUES ('511321', '511321', '南部县', '511300', '1');
INSERT INTO `sys_area` VALUES ('511322', '511322', '营山县', '511300', '1');
INSERT INTO `sys_area` VALUES ('511323', '511323', '蓬安县', '511300', '1');
INSERT INTO `sys_area` VALUES ('511324', '511324', '仪陇县', '511300', '1');
INSERT INTO `sys_area` VALUES ('511325', '511325', '西充县', '511300', '1');
INSERT INTO `sys_area` VALUES ('511381', '511381', '阆中市', '511300', '1');
INSERT INTO `sys_area` VALUES ('511400', '511400', '眉山市', '510000', '1');
INSERT INTO `sys_area` VALUES ('511402', '511402', '东坡区', '511400', '1');
INSERT INTO `sys_area` VALUES ('511421', '511421', '仁寿县', '511400', '1');
INSERT INTO `sys_area` VALUES ('511422', '511422', '彭山县', '511400', '1');
INSERT INTO `sys_area` VALUES ('511423', '511423', '洪雅县', '511400', '1');
INSERT INTO `sys_area` VALUES ('511424', '511424', '丹棱县', '511400', '1');
INSERT INTO `sys_area` VALUES ('511425', '511425', '青神县', '511400', '1');
INSERT INTO `sys_area` VALUES ('511500', '511500', '宜宾市', '510000', '1');
INSERT INTO `sys_area` VALUES ('511502', '511502', '翠屏区', '511500', '1');
INSERT INTO `sys_area` VALUES ('511503', '511503', '南溪区', '511500', '1');
INSERT INTO `sys_area` VALUES ('511521', '511521', '宜宾县', '511500', '1');
INSERT INTO `sys_area` VALUES ('511523', '511523', '江安县', '511500', '1');
INSERT INTO `sys_area` VALUES ('511524', '511524', '长宁县', '511500', '1');
INSERT INTO `sys_area` VALUES ('511525', '511525', '高县', '511500', '1');
INSERT INTO `sys_area` VALUES ('511526', '511526', '珙县', '511500', '1');
INSERT INTO `sys_area` VALUES ('511527', '511527', '筠连县', '511500', '1');
INSERT INTO `sys_area` VALUES ('511528', '511528', '兴文县', '511500', '1');
INSERT INTO `sys_area` VALUES ('511529', '511529', '屏山县', '511500', '1');
INSERT INTO `sys_area` VALUES ('511600', '511600', '广安市', '510000', '1');
INSERT INTO `sys_area` VALUES ('511602', '511602', '广安区', '511600', '1');
INSERT INTO `sys_area` VALUES ('511621', '511621', '岳池县', '511600', '1');
INSERT INTO `sys_area` VALUES ('511622', '511622', '武胜县', '511600', '1');
INSERT INTO `sys_area` VALUES ('511623', '511623', '邻水县', '511600', '1');
INSERT INTO `sys_area` VALUES ('511681', '511681', '华蓥市', '511600', '1');
INSERT INTO `sys_area` VALUES ('511700', '511700', '达州市', '510000', '1');
INSERT INTO `sys_area` VALUES ('511702', '511702', '通川区', '511700', '1');
INSERT INTO `sys_area` VALUES ('511721', '511721', '达县', '511700', '1');
INSERT INTO `sys_area` VALUES ('511722', '511722', '宣汉县', '511700', '1');
INSERT INTO `sys_area` VALUES ('511723', '511723', '开江县', '511700', '1');
INSERT INTO `sys_area` VALUES ('511724', '511724', '大竹县', '511700', '1');
INSERT INTO `sys_area` VALUES ('511725', '511725', '渠县', '511700', '1');
INSERT INTO `sys_area` VALUES ('511781', '511781', '万源市', '511700', '1');
INSERT INTO `sys_area` VALUES ('511800', '511800', '雅安市', '510000', '1');
INSERT INTO `sys_area` VALUES ('511802', '511802', '雨城区', '511800', '1');
INSERT INTO `sys_area` VALUES ('511821', '511821', '名山县', '511800', '1');
INSERT INTO `sys_area` VALUES ('511822', '511822', '荥经县', '511800', '1');
INSERT INTO `sys_area` VALUES ('511823', '511823', '汉源县', '511800', '1');
INSERT INTO `sys_area` VALUES ('511824', '511824', '石棉县', '511800', '1');
INSERT INTO `sys_area` VALUES ('511825', '511825', '天全县', '511800', '1');
INSERT INTO `sys_area` VALUES ('511826', '511826', '芦山县', '511800', '1');
INSERT INTO `sys_area` VALUES ('511827', '511827', '宝兴县', '511800', '1');
INSERT INTO `sys_area` VALUES ('511900', '511900', '巴中市', '510000', '1');
INSERT INTO `sys_area` VALUES ('511902', '511902', '巴州区', '511900', '1');
INSERT INTO `sys_area` VALUES ('511921', '511921', '通江县', '511900', '1');
INSERT INTO `sys_area` VALUES ('511922', '511922', '南江县', '511900', '1');
INSERT INTO `sys_area` VALUES ('511923', '511923', '平昌县', '511900', '1');
INSERT INTO `sys_area` VALUES ('512000', '512000', '资阳市', '510000', '1');
INSERT INTO `sys_area` VALUES ('512002', '512002', '雁江区', '512000', '1');
INSERT INTO `sys_area` VALUES ('512021', '512021', '安岳县', '512000', '1');
INSERT INTO `sys_area` VALUES ('512022', '512022', '乐至县', '512000', '1');
INSERT INTO `sys_area` VALUES ('512081', '512081', '简阳市', '512000', '1');
INSERT INTO `sys_area` VALUES ('513200', '513200', '阿坝藏族羌族自治州', '510000', '1');
INSERT INTO `sys_area` VALUES ('513221', '513221', '汶川县', '513200', '1');
INSERT INTO `sys_area` VALUES ('513222', '513222', '理县', '513200', '1');
INSERT INTO `sys_area` VALUES ('513223', '513223', '茂县', '513200', '1');
INSERT INTO `sys_area` VALUES ('513224', '513224', '松潘县', '513200', '1');
INSERT INTO `sys_area` VALUES ('513225', '513225', '九寨沟县', '513200', '1');
INSERT INTO `sys_area` VALUES ('513226', '513226', '金川县', '513200', '1');
INSERT INTO `sys_area` VALUES ('513227', '513227', '小金县', '513200', '1');
INSERT INTO `sys_area` VALUES ('513228', '513228', '黑水县', '513200', '1');
INSERT INTO `sys_area` VALUES ('513229', '513229', '马尔康县', '513200', '1');
INSERT INTO `sys_area` VALUES ('513230', '513230', '壤塘县', '513200', '1');
INSERT INTO `sys_area` VALUES ('513231', '513231', '阿坝县', '513200', '1');
INSERT INTO `sys_area` VALUES ('513232', '513232', '若尔盖县', '513200', '1');
INSERT INTO `sys_area` VALUES ('513233', '513233', '红原县', '513200', '1');
INSERT INTO `sys_area` VALUES ('513300', '513300', '甘孜藏族自治州', '510000', '1');
INSERT INTO `sys_area` VALUES ('513321', '513321', '康定县', '513300', '1');
INSERT INTO `sys_area` VALUES ('513322', '513322', '泸定县', '513300', '1');
INSERT INTO `sys_area` VALUES ('513323', '513323', '丹巴县', '513300', '1');
INSERT INTO `sys_area` VALUES ('513324', '513324', '九龙县', '513300', '1');
INSERT INTO `sys_area` VALUES ('513325', '513325', '雅江县', '513300', '1');
INSERT INTO `sys_area` VALUES ('513326', '513326', '道孚县', '513300', '1');
INSERT INTO `sys_area` VALUES ('513327', '513327', '炉霍县', '513300', '1');
INSERT INTO `sys_area` VALUES ('513328', '513328', '甘孜县', '513300', '1');
INSERT INTO `sys_area` VALUES ('513329', '513329', '新龙县', '513300', '1');
INSERT INTO `sys_area` VALUES ('513330', '513330', '德格县', '513300', '1');
INSERT INTO `sys_area` VALUES ('513331', '513331', '白玉县', '513300', '1');
INSERT INTO `sys_area` VALUES ('513332', '513332', '石渠县', '513300', '1');
INSERT INTO `sys_area` VALUES ('513333', '513333', '色达县', '513300', '1');
INSERT INTO `sys_area` VALUES ('513334', '513334', '理塘县', '513300', '1');
INSERT INTO `sys_area` VALUES ('513335', '513335', '巴塘县', '513300', '1');
INSERT INTO `sys_area` VALUES ('513336', '513336', '乡城县', '513300', '1');
INSERT INTO `sys_area` VALUES ('513337', '513337', '稻城县', '513300', '1');
INSERT INTO `sys_area` VALUES ('513338', '513338', '得荣县', '513300', '1');
INSERT INTO `sys_area` VALUES ('513400', '513400', '凉山彝族自治州', '510000', '1');
INSERT INTO `sys_area` VALUES ('513401', '513401', '西昌市', '513400', '1');
INSERT INTO `sys_area` VALUES ('513422', '513422', '木里藏族自治县', '513400', '1');
INSERT INTO `sys_area` VALUES ('513423', '513423', '盐源县', '513400', '1');
INSERT INTO `sys_area` VALUES ('513424', '513424', '德昌县', '513400', '1');
INSERT INTO `sys_area` VALUES ('513425', '513425', '会理县', '513400', '1');
INSERT INTO `sys_area` VALUES ('513426', '513426', '会东县', '513400', '1');
INSERT INTO `sys_area` VALUES ('513427', '513427', '宁南县', '513400', '1');
INSERT INTO `sys_area` VALUES ('513428', '513428', '普格县', '513400', '1');
INSERT INTO `sys_area` VALUES ('513429', '513429', '布拖县', '513400', '1');
INSERT INTO `sys_area` VALUES ('513430', '513430', '金阳县', '513400', '1');
INSERT INTO `sys_area` VALUES ('513431', '513431', '昭觉县', '513400', '1');
INSERT INTO `sys_area` VALUES ('513432', '513432', '喜德县', '513400', '1');
INSERT INTO `sys_area` VALUES ('513433', '513433', '冕宁县', '513400', '1');
INSERT INTO `sys_area` VALUES ('513434', '513434', '越西县', '513400', '1');
INSERT INTO `sys_area` VALUES ('513435', '513435', '甘洛县', '513400', '1');
INSERT INTO `sys_area` VALUES ('513436', '513436', '美姑县', '513400', '1');
INSERT INTO `sys_area` VALUES ('513437', '513437', '雷波县', '513400', '1');
INSERT INTO `sys_area` VALUES ('520000', '520000', '贵州省', '0', '1');
INSERT INTO `sys_area` VALUES ('520100', '520100', '贵阳市', '520000', '1');
INSERT INTO `sys_area` VALUES ('520102', '520102', '南明区', '520100', '1');
INSERT INTO `sys_area` VALUES ('520103', '520103', '云岩区', '520100', '1');
INSERT INTO `sys_area` VALUES ('520111', '520111', '花溪区', '520100', '1');
INSERT INTO `sys_area` VALUES ('520112', '520112', '乌当区', '520100', '1');
INSERT INTO `sys_area` VALUES ('520113', '520113', '白云区', '520100', '1');
INSERT INTO `sys_area` VALUES ('520114', '520114', '小河区', '520100', '1');
INSERT INTO `sys_area` VALUES ('520115', '520115', '观山湖区', '520100', '1');
INSERT INTO `sys_area` VALUES ('520121', '520121', '开阳县', '520100', '1');
INSERT INTO `sys_area` VALUES ('520122', '520122', '息烽县', '520100', '1');
INSERT INTO `sys_area` VALUES ('520123', '520123', '修文县', '520100', '1');
INSERT INTO `sys_area` VALUES ('520181', '520181', '清镇市', '520100', '1');
INSERT INTO `sys_area` VALUES ('520182', '520182', '贵安新区', '520100', '1');
INSERT INTO `sys_area` VALUES ('520200', '520200', '六盘水市', '520000', '1');
INSERT INTO `sys_area` VALUES ('520201', '520201', '钟山区', '520200', '1');
INSERT INTO `sys_area` VALUES ('520203', '520203', '六枝特区', '520200', '1');
INSERT INTO `sys_area` VALUES ('520221', '520221', '水城县', '520200', '1');
INSERT INTO `sys_area` VALUES ('520222', '520222', '盘县', '520200', '1');
INSERT INTO `sys_area` VALUES ('520300', '520300', '遵义市', '520000', '1');
INSERT INTO `sys_area` VALUES ('520302', '520302', '红花岗区', '520300', '1');
INSERT INTO `sys_area` VALUES ('520303', '520303', '汇川区', '520300', '1');
INSERT INTO `sys_area` VALUES ('520321', '520321', '遵义县', '520300', '1');
INSERT INTO `sys_area` VALUES ('520322', '520322', '桐梓县', '520300', '1');
INSERT INTO `sys_area` VALUES ('520323', '520323', '绥阳县', '520300', '1');
INSERT INTO `sys_area` VALUES ('520324', '520324', '正安县', '520300', '1');
INSERT INTO `sys_area` VALUES ('520325', '520325', '道真仡佬族苗族自治县', '520300', '1');
INSERT INTO `sys_area` VALUES ('520326', '520326', '务川仡佬族苗族自治县', '520300', '1');
INSERT INTO `sys_area` VALUES ('520327', '520327', '凤冈县', '520300', '1');
INSERT INTO `sys_area` VALUES ('520328', '520328', '湄潭县', '520300', '1');
INSERT INTO `sys_area` VALUES ('520329', '520329', '余庆县', '520300', '1');
INSERT INTO `sys_area` VALUES ('520330', '520330', '习水县', '520300', '1');
INSERT INTO `sys_area` VALUES ('520381', '520381', '赤水市', '520300', '1');
INSERT INTO `sys_area` VALUES ('520382', '520382', '仁怀市', '520300', '1');
INSERT INTO `sys_area` VALUES ('520400', '520400', '安顺市', '520000', '1');
INSERT INTO `sys_area` VALUES ('520402', '520402', '西秀区', '520400', '1');
INSERT INTO `sys_area` VALUES ('520421', '520421', '平坝县', '520400', '1');
INSERT INTO `sys_area` VALUES ('520422', '520422', '普定县', '520400', '1');
INSERT INTO `sys_area` VALUES ('520423', '520423', '镇宁布依族苗族自治县', '520400', '1');
INSERT INTO `sys_area` VALUES ('520424', '520424', '关岭布依族苗族自治县', '520400', '1');
INSERT INTO `sys_area` VALUES ('520425', '520425', '紫云苗族布依族自治县', '520400', '1');
INSERT INTO `sys_area` VALUES ('520500', '520500', '毕节市', '520000', '1');
INSERT INTO `sys_area` VALUES ('520502', '520502', '七星关区', '520500', '1');
INSERT INTO `sys_area` VALUES ('520521', '520521', '大方县', '520500', '1');
INSERT INTO `sys_area` VALUES ('520522', '520522', '黔西县', '520500', '1');
INSERT INTO `sys_area` VALUES ('520523', '520523', '金沙县', '520500', '1');
INSERT INTO `sys_area` VALUES ('520524', '520524', '织金县', '520500', '1');
INSERT INTO `sys_area` VALUES ('520525', '520525', '纳雍县', '520500', '1');
INSERT INTO `sys_area` VALUES ('520526', '520526', '威宁彝族回族苗族自治县', '520500', '1');
INSERT INTO `sys_area` VALUES ('520527', '520527', '赫章县', '520500', '1');
INSERT INTO `sys_area` VALUES ('520600', '520600', '铜仁市', '520000', '1');
INSERT INTO `sys_area` VALUES ('520602', '520602', '碧江区', '520600', '1');
INSERT INTO `sys_area` VALUES ('520603', '520603', '万山区', '520600', '1');
INSERT INTO `sys_area` VALUES ('520621', '520621', '江口县', '520600', '1');
INSERT INTO `sys_area` VALUES ('520622', '520622', '玉屏侗族自治县', '520600', '1');
INSERT INTO `sys_area` VALUES ('520623', '520623', '石阡县', '520600', '1');
INSERT INTO `sys_area` VALUES ('520624', '520624', '思南县', '520600', '1');
INSERT INTO `sys_area` VALUES ('520625', '520625', '印江土家族苗族自治县', '520600', '1');
INSERT INTO `sys_area` VALUES ('520626', '520626', '德江县', '520600', '1');
INSERT INTO `sys_area` VALUES ('520627', '520627', '沿河土家族自治县', '520600', '1');
INSERT INTO `sys_area` VALUES ('520628', '520628', '松桃苗族自治县', '520600', '1');
INSERT INTO `sys_area` VALUES ('522300', '522300', '黔西南布依族苗族自治州', '520000', '1');
INSERT INTO `sys_area` VALUES ('522301', '522301', '兴义市', '522300', '1');
INSERT INTO `sys_area` VALUES ('522322', '522322', '兴仁县', '522300', '1');
INSERT INTO `sys_area` VALUES ('522323', '522323', '普安县', '522300', '1');
INSERT INTO `sys_area` VALUES ('522324', '522324', '晴隆县', '522300', '1');
INSERT INTO `sys_area` VALUES ('522325', '522325', '贞丰县', '522300', '1');
INSERT INTO `sys_area` VALUES ('522326', '522326', '望谟县', '522300', '1');
INSERT INTO `sys_area` VALUES ('522327', '522327', '册亨县', '522300', '1');
INSERT INTO `sys_area` VALUES ('522328', '522328', '安龙县', '522300', '1');
INSERT INTO `sys_area` VALUES ('522600', '522600', '黔东南苗族侗族自治州', '520000', '1');
INSERT INTO `sys_area` VALUES ('522601', '522601', '凯里市', '522600', '1');
INSERT INTO `sys_area` VALUES ('522622', '522622', '黄平县', '522600', '1');
INSERT INTO `sys_area` VALUES ('522623', '522623', '施秉县', '522600', '1');
INSERT INTO `sys_area` VALUES ('522624', '522624', '三穗县', '522600', '1');
INSERT INTO `sys_area` VALUES ('522625', '522625', '镇远县', '522600', '1');
INSERT INTO `sys_area` VALUES ('522626', '522626', '岑巩县', '522600', '1');
INSERT INTO `sys_area` VALUES ('522627', '522627', '天柱县', '522600', '1');
INSERT INTO `sys_area` VALUES ('522628', '522628', '锦屏县', '522600', '1');
INSERT INTO `sys_area` VALUES ('522629', '522629', '剑河县', '522600', '1');
INSERT INTO `sys_area` VALUES ('522630', '522630', '台江县', '522600', '1');
INSERT INTO `sys_area` VALUES ('522631', '522631', '黎平县', '522600', '1');
INSERT INTO `sys_area` VALUES ('522632', '522632', '榕江县', '522600', '1');
INSERT INTO `sys_area` VALUES ('522633', '522633', '从江县', '522600', '1');
INSERT INTO `sys_area` VALUES ('522634', '522634', '雷山县', '522600', '1');
INSERT INTO `sys_area` VALUES ('522635', '522635', '麻江县', '522600', '1');
INSERT INTO `sys_area` VALUES ('522636', '522636', '丹寨县', '522600', '1');
INSERT INTO `sys_area` VALUES ('522700', '522700', '黔南布依族苗族自治州', '520000', '1');
INSERT INTO `sys_area` VALUES ('522701', '522701', '都匀市', '522700', '1');
INSERT INTO `sys_area` VALUES ('522702', '522702', '福泉市', '522700', '1');
INSERT INTO `sys_area` VALUES ('522722', '522722', '荔波县', '522700', '1');
INSERT INTO `sys_area` VALUES ('522723', '522723', '贵定县', '522700', '1');
INSERT INTO `sys_area` VALUES ('522725', '522725', '瓮安县', '522700', '1');
INSERT INTO `sys_area` VALUES ('522726', '522726', '独山县', '522700', '1');
INSERT INTO `sys_area` VALUES ('522727', '522727', '平塘县', '522700', '1');
INSERT INTO `sys_area` VALUES ('522728', '522728', '罗甸县', '522700', '1');
INSERT INTO `sys_area` VALUES ('522729', '522729', '长顺县', '522700', '1');
INSERT INTO `sys_area` VALUES ('522730', '522730', '龙里县', '522700', '1');
INSERT INTO `sys_area` VALUES ('522731', '522731', '惠水县', '522700', '1');
INSERT INTO `sys_area` VALUES ('522732', '522732', '三都水族自治县', '522700', '1');
INSERT INTO `sys_area` VALUES ('530000', '530000', '云南省', '0', '1');
INSERT INTO `sys_area` VALUES ('530100', '530100', '昆明市', '530000', '1');
INSERT INTO `sys_area` VALUES ('530102', '530102', '五华区', '530100', '1');
INSERT INTO `sys_area` VALUES ('530103', '530103', '盘龙区', '530100', '1');
INSERT INTO `sys_area` VALUES ('530111', '530111', '官渡区', '530100', '1');
INSERT INTO `sys_area` VALUES ('530112', '530112', '西山区', '530100', '1');
INSERT INTO `sys_area` VALUES ('530113', '530113', '东川区', '530100', '1');
INSERT INTO `sys_area` VALUES ('530114', '530114', '呈贡区', '530100', '1');
INSERT INTO `sys_area` VALUES ('530122', '530122', '晋宁县', '530100', '1');
INSERT INTO `sys_area` VALUES ('530124', '530124', '富民县', '530100', '1');
INSERT INTO `sys_area` VALUES ('530125', '530125', '宜良县', '530100', '1');
INSERT INTO `sys_area` VALUES ('530126', '530126', '石林彝族自治县', '530100', '1');
INSERT INTO `sys_area` VALUES ('530127', '530127', '嵩明县', '530100', '1');
INSERT INTO `sys_area` VALUES ('530128', '530128', '禄劝彝族苗族自治县', '530100', '1');
INSERT INTO `sys_area` VALUES ('530129', '530129', '寻甸回族彝族自治县', '530100', '1');
INSERT INTO `sys_area` VALUES ('530181', '530181', '安宁市', '530100', '1');
INSERT INTO `sys_area` VALUES ('530300', '530300', '曲靖市', '530000', '1');
INSERT INTO `sys_area` VALUES ('530302', '530302', '麒麟区', '530300', '1');
INSERT INTO `sys_area` VALUES ('530321', '530321', '马龙县', '530300', '1');
INSERT INTO `sys_area` VALUES ('530322', '530322', '陆良县', '530300', '1');
INSERT INTO `sys_area` VALUES ('530323', '530323', '师宗县', '530300', '1');
INSERT INTO `sys_area` VALUES ('530324', '530324', '罗平县', '530300', '1');
INSERT INTO `sys_area` VALUES ('530325', '530325', '富源县', '530300', '1');
INSERT INTO `sys_area` VALUES ('530326', '530326', '会泽县', '530300', '1');
INSERT INTO `sys_area` VALUES ('530328', '530328', '沾益县', '530300', '1');
INSERT INTO `sys_area` VALUES ('530381', '530381', '宣威市', '530300', '1');
INSERT INTO `sys_area` VALUES ('530400', '530400', '玉溪市', '530000', '1');
INSERT INTO `sys_area` VALUES ('530402', '530402', '红塔区', '530400', '1');
INSERT INTO `sys_area` VALUES ('530421', '530421', '江川县', '530400', '1');
INSERT INTO `sys_area` VALUES ('530422', '530422', '澄江县', '530400', '1');
INSERT INTO `sys_area` VALUES ('530423', '530423', '通海县', '530400', '1');
INSERT INTO `sys_area` VALUES ('530424', '530424', '华宁县', '530400', '1');
INSERT INTO `sys_area` VALUES ('530425', '530425', '易门县', '530400', '1');
INSERT INTO `sys_area` VALUES ('530426', '530426', '峨山彝族自治县', '530400', '1');
INSERT INTO `sys_area` VALUES ('530427', '530427', '新平彝族傣族自治县', '530400', '1');
INSERT INTO `sys_area` VALUES ('530428', '530428', '元江哈尼族彝族傣族自治县', '530400', '1');
INSERT INTO `sys_area` VALUES ('530500', '530500', '保山市', '530000', '1');
INSERT INTO `sys_area` VALUES ('530502', '530502', '隆阳区', '530500', '1');
INSERT INTO `sys_area` VALUES ('530521', '530521', '施甸县', '530500', '1');
INSERT INTO `sys_area` VALUES ('530522', '530522', '腾冲县', '530500', '1');
INSERT INTO `sys_area` VALUES ('530523', '530523', '龙陵县', '530500', '1');
INSERT INTO `sys_area` VALUES ('530524', '530524', '昌宁县', '530500', '1');
INSERT INTO `sys_area` VALUES ('530600', '530600', '昭通市', '530000', '1');
INSERT INTO `sys_area` VALUES ('530602', '530602', '昭阳区', '530600', '1');
INSERT INTO `sys_area` VALUES ('530621', '530621', '鲁甸县', '530600', '1');
INSERT INTO `sys_area` VALUES ('530622', '530622', '巧家县', '530600', '1');
INSERT INTO `sys_area` VALUES ('530623', '530623', '盐津县', '530600', '1');
INSERT INTO `sys_area` VALUES ('530624', '530624', '大关县', '530600', '1');
INSERT INTO `sys_area` VALUES ('530625', '530625', '永善县', '530600', '1');
INSERT INTO `sys_area` VALUES ('530626', '530626', '绥江县', '530600', '1');
INSERT INTO `sys_area` VALUES ('530627', '530627', '镇雄县', '530600', '1');
INSERT INTO `sys_area` VALUES ('530628', '530628', '彝良县', '530600', '1');
INSERT INTO `sys_area` VALUES ('530629', '530629', '威信县', '530600', '1');
INSERT INTO `sys_area` VALUES ('530630', '530630', '水富县', '530600', '1');
INSERT INTO `sys_area` VALUES ('530700', '530700', '丽江市', '530000', '1');
INSERT INTO `sys_area` VALUES ('530702', '530702', '古城区', '530700', '1');
INSERT INTO `sys_area` VALUES ('530721', '530721', '玉龙纳西族自治县', '530700', '1');
INSERT INTO `sys_area` VALUES ('530722', '530722', '永胜县', '530700', '1');
INSERT INTO `sys_area` VALUES ('530723', '530723', '华坪县', '530700', '1');
INSERT INTO `sys_area` VALUES ('530724', '530724', '宁蒗彝族自治县', '530700', '1');
INSERT INTO `sys_area` VALUES ('530800', '530800', '普洱市', '530000', '1');
INSERT INTO `sys_area` VALUES ('530802', '530802', '思茅区', '530800', '1');
INSERT INTO `sys_area` VALUES ('530821', '530821', '宁洱哈尼族彝族自治县', '530800', '1');
INSERT INTO `sys_area` VALUES ('530822', '530822', '墨江哈尼族自治县', '530800', '1');
INSERT INTO `sys_area` VALUES ('530823', '530823', '景东彝族自治县', '530800', '1');
INSERT INTO `sys_area` VALUES ('530824', '530824', '景谷傣族彝族自治县', '530800', '1');
INSERT INTO `sys_area` VALUES ('530825', '530825', '镇沅彝族哈尼族拉祜族自治县', '530800', '1');
INSERT INTO `sys_area` VALUES ('530826', '530826', '江城哈尼族彝族自治县', '530800', '1');
INSERT INTO `sys_area` VALUES ('530827', '530827', '孟连傣族拉祜族佤族自治县', '530800', '1');
INSERT INTO `sys_area` VALUES ('530828', '530828', '澜沧拉祜族自治县', '530800', '1');
INSERT INTO `sys_area` VALUES ('530829', '530829', '西盟佤族自治县', '530800', '1');
INSERT INTO `sys_area` VALUES ('530900', '530900', '临沧市', '530000', '1');
INSERT INTO `sys_area` VALUES ('530902', '530902', '临翔区', '530900', '1');
INSERT INTO `sys_area` VALUES ('530921', '530921', '凤庆县', '530900', '1');
INSERT INTO `sys_area` VALUES ('530922', '530922', '云县', '530900', '1');
INSERT INTO `sys_area` VALUES ('530923', '530923', '永德县', '530900', '1');
INSERT INTO `sys_area` VALUES ('530924', '530924', '镇康县', '530900', '1');
INSERT INTO `sys_area` VALUES ('530925', '530925', '双江拉祜族佤族布朗族傣族自治县', '530900', '1');
INSERT INTO `sys_area` VALUES ('530926', '530926', '耿马傣族佤族自治县', '530900', '1');
INSERT INTO `sys_area` VALUES ('530927', '530927', '沧源佤族自治县', '530900', '1');
INSERT INTO `sys_area` VALUES ('532300', '532300', '楚雄彝族自治州', '530000', '1');
INSERT INTO `sys_area` VALUES ('532301', '532301', '楚雄市', '532300', '1');
INSERT INTO `sys_area` VALUES ('532322', '532322', '双柏县', '532300', '1');
INSERT INTO `sys_area` VALUES ('532323', '532323', '牟定县', '532300', '1');
INSERT INTO `sys_area` VALUES ('532324', '532324', '南华县', '532300', '1');
INSERT INTO `sys_area` VALUES ('532325', '532325', '姚安县', '532300', '1');
INSERT INTO `sys_area` VALUES ('532326', '532326', '大姚县', '532300', '1');
INSERT INTO `sys_area` VALUES ('532327', '532327', '永仁县', '532300', '1');
INSERT INTO `sys_area` VALUES ('532328', '532328', '元谋县', '532300', '1');
INSERT INTO `sys_area` VALUES ('532329', '532329', '武定县', '532300', '1');
INSERT INTO `sys_area` VALUES ('532331', '532331', '禄丰县', '532300', '1');
INSERT INTO `sys_area` VALUES ('532500', '532500', '红河哈尼族彝族自治州', '530000', '1');
INSERT INTO `sys_area` VALUES ('532501', '532501', '个旧市', '532500', '1');
INSERT INTO `sys_area` VALUES ('532502', '532502', '开远市', '532500', '1');
INSERT INTO `sys_area` VALUES ('532522', '532522', '蒙自市', '532500', '1');
INSERT INTO `sys_area` VALUES ('532523', '532523', '屏边苗族自治县', '532500', '1');
INSERT INTO `sys_area` VALUES ('532524', '532524', '建水县', '532500', '1');
INSERT INTO `sys_area` VALUES ('532525', '532525', '石屏县', '532500', '1');
INSERT INTO `sys_area` VALUES ('532526', '532526', '弥勒县', '532500', '1');
INSERT INTO `sys_area` VALUES ('532527', '532527', '泸西县', '532500', '1');
INSERT INTO `sys_area` VALUES ('532528', '532528', '元阳县', '532500', '1');
INSERT INTO `sys_area` VALUES ('532529', '532529', '红河县', '532500', '1');
INSERT INTO `sys_area` VALUES ('532530', '532530', '金平苗族瑶族傣族自治县', '532500', '1');
INSERT INTO `sys_area` VALUES ('532531', '532531', '绿春县', '532500', '1');
INSERT INTO `sys_area` VALUES ('532532', '532532', '河口瑶族自治县', '532500', '1');
INSERT INTO `sys_area` VALUES ('532600', '532600', '文山壮族苗族自治州', '530000', '1');
INSERT INTO `sys_area` VALUES ('532601', '532601', '文山市', '532600', '1');
INSERT INTO `sys_area` VALUES ('532622', '532622', '砚山县', '532600', '1');
INSERT INTO `sys_area` VALUES ('532623', '532623', '西畴县', '532600', '1');
INSERT INTO `sys_area` VALUES ('532624', '532624', '麻栗坡县', '532600', '1');
INSERT INTO `sys_area` VALUES ('532625', '532625', '马关县', '532600', '1');
INSERT INTO `sys_area` VALUES ('532626', '532626', '丘北县', '532600', '1');
INSERT INTO `sys_area` VALUES ('532627', '532627', '广南县', '532600', '1');
INSERT INTO `sys_area` VALUES ('532628', '532628', '富宁县', '532600', '1');
INSERT INTO `sys_area` VALUES ('532800', '532800', '西双版纳傣族自治州', '530000', '1');
INSERT INTO `sys_area` VALUES ('532801', '532801', '景洪市', '532800', '1');
INSERT INTO `sys_area` VALUES ('532822', '532822', '勐海县', '532800', '1');
INSERT INTO `sys_area` VALUES ('532823', '532823', '勐腊县', '532800', '1');
INSERT INTO `sys_area` VALUES ('532900', '532900', '大理白族自治州', '530000', '1');
INSERT INTO `sys_area` VALUES ('532901', '532901', '大理市', '532900', '1');
INSERT INTO `sys_area` VALUES ('532922', '532922', '漾濞彝族自治县', '532900', '1');
INSERT INTO `sys_area` VALUES ('532923', '532923', '祥云县', '532900', '1');
INSERT INTO `sys_area` VALUES ('532924', '532924', '宾川县', '532900', '1');
INSERT INTO `sys_area` VALUES ('532925', '532925', '弥渡县', '532900', '1');
INSERT INTO `sys_area` VALUES ('532926', '532926', '南涧彝族自治县', '532900', '1');
INSERT INTO `sys_area` VALUES ('532927', '532927', '巍山彝族回族自治县', '532900', '1');
INSERT INTO `sys_area` VALUES ('532928', '0', '中国', '-1', '0');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `param_key` varchar(50) DEFAULT NULL COMMENT 'key',
  `param_value` varchar(2000) DEFAULT NULL COMMENT 'value',
  `status` tinyint(4) DEFAULT '1' COMMENT '状态   0：隐藏   1：显示',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  UNIQUE KEY `param_key` (`param_key`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='系统配置信息表';

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES ('1', 'CLOUD_STORAGE_CONFIG_KEY', '{\"type\":2,\"qiniuDomain\":\"\",\"qiniuPrefix\":\"\",\"qiniuAccessKey\":\"\",\"qiniuSecretKey\":\"\",\"qiniuBucketName\":\"\",\"aliyunDomain\":\"http://snailhouse-test.oss-cn-beijing.aliyuncs.com\",\"aliyunPrefix\":\"fintech-media\",\"aliyunEndPoint\":\"oss-cn-beijing.aliyuncs.com\",\"aliyunAccessKeyId\":\"LTAImwXIEmJPP4aY\",\"aliyunAccessKeySecret\":\"sq1lF5CTke0TkstefI0OtoyKfbz17R\",\"aliyunBucketName\":\"snailhouse-test\",\"qcloudDomain\":\"\",\"qcloudPrefix\":\"\",\"qcloudSecretId\":\"\",\"qcloudSecretKey\":\"\",\"qcloudBucketName\":\"\"}', '0', '云存储配置信息');
INSERT INTO `sys_config` VALUES ('3', 'INTERFACE_LOG_TO_DB', 'NO', '1', '日志开关');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) DEFAULT NULL COMMENT '上级部门ID，一级部门为0',
  `name` varchar(50) DEFAULT NULL COMMENT '部门名称',
  `order_num` int(11) DEFAULT NULL COMMENT '排序',
  `del_flag` tinyint(4) DEFAULT '0' COMMENT '是否删除  -1：已删除  0：正常',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='部门管理';

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES ('1', '0', '捷越集团', '0', '0');
INSERT INTO `sys_dept` VALUES ('2', '1', '长沙分公司', '1', '0');
INSERT INTO `sys_dept` VALUES ('3', '1', '上海分公司', '2', '0');

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL COMMENT '字典名称',
  `type` varchar(100) NOT NULL COMMENT '字典类型',
  `code` varchar(100) NOT NULL COMMENT '字典码',
  `value` varchar(1000) NOT NULL COMMENT '字典值',
  `order_num` int(11) DEFAULT '0' COMMENT '排序',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `del_flag` tinyint(4) DEFAULT '0' COMMENT '删除标记  -1：已删除  0：正常',
  PRIMARY KEY (`id`),
  UNIQUE KEY `type` (`type`,`code`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COMMENT='数据字典表';

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
INSERT INTO `sys_dict` VALUES ('1', '性别', 'sex', '0', '女', '0', null, '0');
INSERT INTO `sys_dict` VALUES ('2', '性别', 'sex', '1', '男', '1', null, '0');
INSERT INTO `sys_dict` VALUES ('3', '性别', 'sex', '2', '未知', '3', null, '0');

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL COMMENT '用户名',
  `operation` varchar(50) DEFAULT NULL COMMENT '用户操作',
  `method` varchar(200) DEFAULT NULL COMMENT '请求方法',
  `params` varchar(5000) DEFAULT NULL COMMENT '请求参数',
  `time` bigint(20) NOT NULL COMMENT '执行时长(毫秒)',
  `ip` varchar(64) DEFAULT NULL COMMENT 'IP地址',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1223 DEFAULT CHARSET=utf8 COMMENT='系统日志';

-- ----------------------------
-- Records of sys_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父菜单ID，一级菜单为0',
  `name` varchar(50) DEFAULT NULL COMMENT '菜单名称',
  `url` varchar(200) DEFAULT NULL COMMENT '菜单URL',
  `perms` varchar(500) DEFAULT NULL COMMENT '授权(多个用逗号分隔，如：user:list,user:create)',
  `type` int(11) DEFAULT NULL COMMENT '类型   0：目录   1：菜单   2：按钮',
  `icon` varchar(50) DEFAULT NULL COMMENT '菜单图标',
  `order_num` int(11) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=219 DEFAULT CHARSET=utf8 COMMENT='菜单管理';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '0', '系统管理', null, null, '0', 'fa fa-cog', '9');
INSERT INTO `sys_menu` VALUES ('2', '1', '管理员管理', 'modules/sys/user.html', null, '1', 'fa fa-user', '1');
INSERT INTO `sys_menu` VALUES ('3', '1', '角色管理', 'modules/sys/role.html', null, '1', 'fa fa-user-secret', '2');
INSERT INTO `sys_menu` VALUES ('4', '1', '菜单管理', 'modules/sys/menu.html', null, '1', 'fa fa-th-list', '3');
INSERT INTO `sys_menu` VALUES ('5', '1', 'SQL监控', 'druid/sql.html', null, '1', 'fa fa-bug', '4');
INSERT INTO `sys_menu` VALUES ('6', '1', '定时任务', 'modules/job/schedule.html', null, '1', 'fa fa-tasks', '5');
INSERT INTO `sys_menu` VALUES ('7', '6', '查看', null, 'sys:schedule:list,sys:schedule:info', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('8', '6', '新增', null, 'sys:schedule:save', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('9', '6', '修改', null, 'sys:schedule:update', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('10', '6', '删除', null, 'sys:schedule:delete', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('11', '6', '暂停', null, 'sys:schedule:pause', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('12', '6', '恢复', null, 'sys:schedule:resume', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('13', '6', '立即执行', null, 'sys:schedule:run', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('14', '6', '日志列表', null, 'sys:schedule:log', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('15', '2', '查看', null, 'sys:user:list,sys:user:info', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('16', '2', '新增', null, 'sys:user:save,sys:role:select', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('17', '2', '修改', null, 'sys:user:update,sys:role:select', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('18', '2', '删除', null, 'sys:user:delete', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('19', '3', '查看', null, 'sys:role:list,sys:role:info', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('20', '3', '新增', null, 'sys:role:save,sys:menu:perms', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('21', '3', '修改', null, 'sys:role:update,sys:menu:perms', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('22', '3', '删除', null, 'sys:role:delete', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('23', '4', '查看', null, 'sys:menu:list,sys:menu:info', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('24', '4', '新增', null, 'sys:menu:save,sys:menu:select', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('25', '4', '修改', null, 'sys:menu:update,sys:menu:select', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('26', '4', '删除', null, 'sys:menu:delete', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('27', '1', '参数管理', 'modules/sys/config.html', 'sys:config:list,sys:config:info,sys:config:save,sys:config:update,sys:config:delete', '1', 'fa fa-sun-o', '6');
INSERT INTO `sys_menu` VALUES ('29', '1', '系统日志', 'modules/sys/log.html', 'sys:log:list', '1', 'fa fa-file-text-o', '7');
INSERT INTO `sys_menu` VALUES ('31', '1', '部门管理', 'modules/sys/dept.html', null, '1', 'fa fa-file-code-o', '1');
INSERT INTO `sys_menu` VALUES ('32', '31', '查看', null, 'sys:dept:list,sys:dept:info', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('33', '31', '新增', null, 'sys:dept:save,sys:dept:select', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('34', '31', '修改', null, 'sys:dept:update,sys:dept:select', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('35', '31', '删除', null, 'sys:dept:delete', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('36', '1', '字典管理', 'modules/sys/dict.html', null, '1', 'fa fa-bookmark-o', '6');
INSERT INTO `sys_menu` VALUES ('37', '36', '查看', null, 'sys:dict:list,sys:dict:info', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('38', '36', '新增', null, 'sys:dict:save', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('39', '36', '修改', null, 'sys:dict:update', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('40', '36', '删除', null, 'sys:dict:delete', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('43', '1', '代码生成', 'modules/generator/generator.html', null, '1', null, '9');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) DEFAULT NULL COMMENT '角色名称',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '部门ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='角色';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('3', '管理员', null, '1', '2018-11-01 10:53:51');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '部门ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8 COMMENT='角色与部门对应关系';

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES ('65', '3', '1');
INSERT INTO `sys_role_dept` VALUES ('67', '3', '2');
INSERT INTO `sys_role_dept` VALUES ('69', '3', '3');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `menu_id` bigint(20) DEFAULT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1285 DEFAULT CHARSET=utf8 COMMENT='角色与菜单对应关系';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('1081', '3', '1');
INSERT INTO `sys_role_menu` VALUES ('1083', '3', '2');
INSERT INTO `sys_role_menu` VALUES ('1085', '3', '15');
INSERT INTO `sys_role_menu` VALUES ('1087', '3', '16');
INSERT INTO `sys_role_menu` VALUES ('1089', '3', '17');
INSERT INTO `sys_role_menu` VALUES ('1091', '3', '18');
INSERT INTO `sys_role_menu` VALUES ('1093', '3', '3');
INSERT INTO `sys_role_menu` VALUES ('1095', '3', '19');
INSERT INTO `sys_role_menu` VALUES ('1097', '3', '20');
INSERT INTO `sys_role_menu` VALUES ('1099', '3', '21');
INSERT INTO `sys_role_menu` VALUES ('1101', '3', '22');
INSERT INTO `sys_role_menu` VALUES ('1103', '3', '4');
INSERT INTO `sys_role_menu` VALUES ('1105', '3', '23');
INSERT INTO `sys_role_menu` VALUES ('1107', '3', '24');
INSERT INTO `sys_role_menu` VALUES ('1109', '3', '25');
INSERT INTO `sys_role_menu` VALUES ('1111', '3', '26');
INSERT INTO `sys_role_menu` VALUES ('1113', '3', '5');
INSERT INTO `sys_role_menu` VALUES ('1115', '3', '6');
INSERT INTO `sys_role_menu` VALUES ('1117', '3', '7');
INSERT INTO `sys_role_menu` VALUES ('1119', '3', '8');
INSERT INTO `sys_role_menu` VALUES ('1121', '3', '9');
INSERT INTO `sys_role_menu` VALUES ('1123', '3', '10');
INSERT INTO `sys_role_menu` VALUES ('1125', '3', '11');
INSERT INTO `sys_role_menu` VALUES ('1127', '3', '12');
INSERT INTO `sys_role_menu` VALUES ('1129', '3', '13');
INSERT INTO `sys_role_menu` VALUES ('1131', '3', '14');
INSERT INTO `sys_role_menu` VALUES ('1133', '3', '27');
INSERT INTO `sys_role_menu` VALUES ('1135', '3', '29');
INSERT INTO `sys_role_menu` VALUES ('1139', '3', '31');
INSERT INTO `sys_role_menu` VALUES ('1141', '3', '32');
INSERT INTO `sys_role_menu` VALUES ('1143', '3', '33');
INSERT INTO `sys_role_menu` VALUES ('1145', '3', '34');
INSERT INTO `sys_role_menu` VALUES ('1147', '3', '35');
INSERT INTO `sys_role_menu` VALUES ('1149', '3', '36');
INSERT INTO `sys_role_menu` VALUES ('1151', '3', '37');
INSERT INTO `sys_role_menu` VALUES ('1153', '3', '38');
INSERT INTO `sys_role_menu` VALUES ('1155', '3', '39');
INSERT INTO `sys_role_menu` VALUES ('1157', '3', '40');
INSERT INTO `sys_role_menu` VALUES ('1159', '3', '43');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(100) DEFAULT NULL COMMENT '密码',
  `salt` varchar(20) DEFAULT NULL COMMENT '盐',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(100) DEFAULT NULL COMMENT '手机号',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态  0：禁用   1：正常',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '部门ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='系统用户';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'admin', 'e1153123d7d180ceeb820d577ff119876678732a68eef4e6ffc0b1f06a01f91b', 'YzcmCZNvbXocrsz9dm8e', 'root@jieyue.io', '13612345678', '1', '1', '2016-11-11 11:11:11');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='用户与角色对应关系';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('3', '1', '3');
