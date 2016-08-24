/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50611
Source Host           : 127.0.0.1:3306
Source Database       : app_masters

Target Server Type    : MYSQL
Target Server Version : 50611
File Encoding         : 65001

Date: 2016-08-13 00:37:25
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tb_favorites
-- ----------------------------
DROP TABLE IF EXISTS `tb_favorites`;
CREATE TABLE `tb_favorites` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `itemid` bigint(20) DEFAULT NULL,
  `category` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `createdby` bigint(11) DEFAULT NULL,
  `createdon` bigint(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tb_favorites
-- ----------------------------
INSERT INTO `tb_favorites` VALUES ('35', '0', 'topic', '10000007', '1470995010');
INSERT INTO `tb_favorites` VALUES ('37', '26', 'news', '10000007', '1470995216');
INSERT INTO `tb_favorites` VALUES ('38', '104', 'topic', '10000007', '1470995272');

-- ----------------------------
-- Table structure for tb_feedbacks
-- ----------------------------
DROP TABLE IF EXISTS `tb_feedbacks`;
CREATE TABLE `tb_feedbacks` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `images` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `category` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `createdby` bigint(11) DEFAULT NULL,
  `createdon` bigint(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tb_feedbacks
-- ----------------------------

-- ----------------------------
-- Table structure for tb_news
-- ----------------------------
DROP TABLE IF EXISTS `tb_news`;
CREATE TABLE `tb_news` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `summary` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cover` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `source` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tags` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `readnum` int(11) DEFAULT NULL,
  `createdon` bigint(11) DEFAULT NULL,
  `createdby` bigint(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tb_news
-- ----------------------------
INSERT INTO `tb_news` VALUES ('1', '深冬还是迎春？全球风投交易数连续四季度下滑', '资本寒冬似乎在继续，今年第二季度全球风投交易数连续四个季度下滑，7月底，研究机构CB Insight和会计师事务所KPMG国际发布的一份全球创业投资情况报告如此显示。', 'https://pic.36krcnd.com/avatar/201608/05024929/htg0pb0f6edet33j.jpg!feature', 'http://36kr.com/p/5050635.html', '36氪', 'http://36kr.com/p/5050635.html', '投资|创业', '3400', '1432544975', '10000000');
INSERT INTO `tb_news` VALUES ('2', '收益不达预期，换帅能改变培生的命运吗？2', '据国外科技媒体 Edsurge 消息，日前出版巨头培生集团作出了换帅的动作：公司宣布，Kevin Capitani 将接替原来的 Don Kilburn 成为新一任的培生北美大区的总裁。', 'https://pic.36krcnd.com/avatar/201608/05031143/hx8qhufm9giyg5x0.jpg!feature', 'http://36kr.com/p/5050635.html', '36氪', 'http://36kr.com/p/5050635.html', '创业|出版业', '31642', '1432544975', '10000000');
INSERT INTO `tb_news` VALUES ('3', '收益不达预期，换帅能改变培生的命运吗？3', '据国外科技媒体 Edsurge 消息，日前出版巨头培生集团作出了换帅的动作：公司宣布，Kevin Capitani 将接替原来的 Don Kilburn 成为新一任的培生北美大区的总裁。', 'https://pic.36krcnd.com/avatar/201608/05031143/hx8qhufm9giyg5x0.jpg!feature', 'http://36kr.com/p/5050635.html', '36氪', 'http://36kr.com/p/5050635.html', '创业|出版业', '31642', '1432544975', '10000000');
INSERT INTO `tb_news` VALUES ('4', '收益不达预期，换帅能改变培生的命运吗？4', '据国外科技媒体 Edsurge 消息，日前出版巨头培生集团作出了换帅的动作：公司宣布，Kevin Capitani 将接替原来的 Don Kilburn 成为新一任的培生北美大区的总裁。', 'https://pic.36krcnd.com/avatar/201608/05031143/hx8qhufm9giyg5x0.jpg!feature', 'http://36kr.com/p/5050635.html', '36氪', 'http://36kr.com/p/5050635.html', '创业|出版业', '31642', '1432544975', '10000000');
INSERT INTO `tb_news` VALUES ('5', '收益不达预期，换帅能改变培生的命运吗？5', '据国外科技媒体 Edsurge 消息，日前出版巨头培生集团作出了换帅的动作：公司宣布，Kevin Capitani 将接替原来的 Don Kilburn 成为新一任的培生北美大区的总裁。', 'https://pic.36krcnd.com/avatar/201608/05031143/hx8qhufm9giyg5x0.jpg!feature', 'http://36kr.com/p/5050635.html', '36氪', 'http://36kr.com/p/5050635.html', '创业|出版业', '31642', '1432544975', '10000000');
INSERT INTO `tb_news` VALUES ('6', '收益不达预期，换帅能改变培生的命运吗？6', '据国外科技媒体 Edsurge 消息，日前出版巨头培生集团作出了换帅的动作：公司宣布，Kevin Capitani 将接替原来的 Don Kilburn 成为新一任的培生北美大区的总裁。', 'https://pic.36krcnd.com/avatar/201608/05031143/hx8qhufm9giyg5x0.jpg!feature', 'http://36kr.com/p/5050635.html', '36氪', 'http://36kr.com/p/5050635.html', '创业|出版业', '31642', '1432544975', '10000000');
INSERT INTO `tb_news` VALUES ('7', '收益不达预期，换帅能改变培生的命运吗？7', '据国外科技媒体 Edsurge 消息，日前出版巨头培生集团作出了换帅的动作：公司宣布，Kevin Capitani 将接替原来的 Don Kilburn 成为新一任的培生北美大区的总裁。', 'https://pic.36krcnd.com/avatar/201608/05031143/hx8qhufm9giyg5x0.jpg!feature', 'http://36kr.com/p/5050635.html', '36氪', 'http://36kr.com/p/5050635.html', '创业|出版业', '31642', '1432544975', '10000000');
INSERT INTO `tb_news` VALUES ('8', '收益不达预期，换帅能改变培生的命运吗？8', '据国外科技媒体 Edsurge 消息，日前出版巨头培生集团作出了换帅的动作：公司宣布，Kevin Capitani 将接替原来的 Don Kilburn 成为新一任的培生北美大区的总裁。', 'https://pic.36krcnd.com/avatar/201608/05031143/hx8qhufm9giyg5x0.jpg!feature', 'http://36kr.com/p/5050635.html', '36氪', 'http://36kr.com/p/5050635.html', '创业|出版业', '31642', '1432544975', '10000000');
INSERT INTO `tb_news` VALUES ('9', '收益不达预期，换帅能改变培生的命运吗？9', '据国外科技媒体 Edsurge 消息，日前出版巨头培生集团作出了换帅的动作：公司宣布，Kevin Capitani 将接替原来的 Don Kilburn 成为新一任的培生北美大区的总裁。', 'https://pic.36krcnd.com/avatar/201608/05031143/hx8qhufm9giyg5x0.jpg!feature', 'http://36kr.com/p/5050635.html', '36氪', 'http://36kr.com/p/5050635.html', '创业|出版业', '31642', '1432544975', '10000000');
INSERT INTO `tb_news` VALUES ('10', '收益不达预期，换帅能改变培生的命运吗？10', '据国外科技媒体 Edsurge 消息，日前出版巨头培生集团作出了换帅的动作：公司宣布，Kevin Capitani 将接替原来的 Don Kilburn 成为新一任的培生北美大区的总裁。', 'https://pic.36krcnd.com/avatar/201608/05031143/hx8qhufm9giyg5x0.jpg!feature', 'http://36kr.com/p/5050635.html', '36氪', 'http://36kr.com/p/5050635.html', '创业|出版业', '31642', '1432544975', '10000000');
INSERT INTO `tb_news` VALUES ('11', '收益不达预期，换帅能改变培生的命运吗？11', '据国外科技媒体 Edsurge 消息，日前出版巨头培生集团作出了换帅的动作：公司宣布，Kevin Capitani 将接替原来的 Don Kilburn 成为新一任的培生北美大区的总裁。', 'https://pic.36krcnd.com/avatar/201608/05031143/hx8qhufm9giyg5x0.jpg!feature', 'http://36kr.com/p/5050635.html', '36氪', 'http://36kr.com/p/5050635.html', '创业|出版业', '31642', '1432544975', '10000000');
INSERT INTO `tb_news` VALUES ('12', '收益不达预期，换帅能改变培生的命运吗？12', '据国外科技媒体 Edsurge 消息，日前出版巨头培生集团作出了换帅的动作：公司宣布，Kevin Capitani 将接替原来的 Don Kilburn 成为新一任的培生北美大区的总裁。', 'https://pic.36krcnd.com/avatar/201608/05031143/hx8qhufm9giyg5x0.jpg!feature', 'http://36kr.com/p/5050635.html', '36氪', 'http://36kr.com/p/5050635.html', '创业|出版业', '31642', '1432544975', '10000000');
INSERT INTO `tb_news` VALUES ('13', '收益不达预期，换帅能改变培生的命运吗？13', '据国外科技媒体 Edsurge 消息，日前出版巨头培生集团作出了换帅的动作：公司宣布，Kevin Capitani 将接替原来的 Don Kilburn 成为新一任的培生北美大区的总裁。', 'https://pic.36krcnd.com/avatar/201608/05031143/hx8qhufm9giyg5x0.jpg!feature', 'http://36kr.com/p/5050635.html', '36氪', 'http://36kr.com/p/5050635.html', '创业|出版业', '31642', '1432544975', '10000000');
INSERT INTO `tb_news` VALUES ('14', '收益不达预期，换帅能改变培生的命运吗？14', '据国外科技媒体 Edsurge 消息，日前出版巨头培生集团作出了换帅的动作：公司宣布，Kevin Capitani 将接替原来的 Don Kilburn 成为新一任的培生北美大区的总裁。', 'https://pic.36krcnd.com/avatar/201608/05031143/hx8qhufm9giyg5x0.jpg!feature', 'http://36kr.com/p/5050635.html', '36氪', 'http://36kr.com/p/5050635.html', '创业|出版业', '31642', '1432544975', '10000000');
INSERT INTO `tb_news` VALUES ('15', '收益不达预期，换帅能改变培生的命运吗？15', '据国外科技媒体 Edsurge 消息，日前出版巨头培生集团作出了换帅的动作：公司宣布，Kevin Capitani 将接替原来的 Don Kilburn 成为新一任的培生北美大区的总裁。', 'https://pic.36krcnd.com/avatar/201608/05031143/hx8qhufm9giyg5x0.jpg!feature', 'http://36kr.com/p/5050635.html', '36氪', 'http://36kr.com/p/5050635.html', '创业|出版业', '31642', '1432544975', '10000000');
INSERT INTO `tb_news` VALUES ('16', '收益不达预期，换帅能改变培生的命运吗？16', '据国外科技媒体 Edsurge 消息，日前出版巨头培生集团作出了换帅的动作：公司宣布，Kevin Capitani 将接替原来的 Don Kilburn 成为新一任的培生北美大区的总裁。', 'https://pic.36krcnd.com/avatar/201608/05031143/hx8qhufm9giyg5x0.jpg!feature', 'http://36kr.com/p/5050635.html', '36氪', 'http://36kr.com/p/5050635.html', '创业|出版业', '31642', '1432544975', '10000000');
INSERT INTO `tb_news` VALUES ('17', '收益不达预期，换帅能改变培生的命运吗？17', '据国外科技媒体 Edsurge 消息，日前出版巨头培生集团作出了换帅的动作：公司宣布，Kevin Capitani 将接替原来的 Don Kilburn 成为新一任的培生北美大区的总裁。', 'https://pic.36krcnd.com/avatar/201608/05031143/hx8qhufm9giyg5x0.jpg!feature', 'http://36kr.com/p/5050635.html', '36氪', 'http://36kr.com/p/5050635.html', '创业|出版业', '31642', '1432544975', '10000000');
INSERT INTO `tb_news` VALUES ('18', '收益不达预期，换帅能改变培生的命运吗？18', '据国外科技媒体 Edsurge 消息，日前出版巨头培生集团作出了换帅的动作：公司宣布，Kevin Capitani 将接替原来的 Don Kilburn 成为新一任的培生北美大区的总裁。', 'https://pic.36krcnd.com/avatar/201608/05031143/hx8qhufm9giyg5x0.jpg!feature', 'http://36kr.com/p/5050635.html', '36氪', 'http://36kr.com/p/5050635.html', '创业|出版业', '31642', '1432544975', '10000000');
INSERT INTO `tb_news` VALUES ('19', '收益不达预期，换帅能改变培生的命运吗？19', '据国外科技媒体 Edsurge 消息，日前出版巨头培生集团作出了换帅的动作：公司宣布，Kevin Capitani 将接替原来的 Don Kilburn 成为新一任的培生北美大区的总裁。', 'https://pic.36krcnd.com/avatar/201608/05031143/hx8qhufm9giyg5x0.jpg!feature', 'http://36kr.com/p/5050635.html', '36氪', 'http://36kr.com/p/5050635.html', '创业|出版业', '31642', '1432544975', '10000000');
INSERT INTO `tb_news` VALUES ('20', '收益不达预期，换帅能改变培生的命运吗？20', '据国外科技媒体 Edsurge 消息，日前出版巨头培生集团作出了换帅的动作：公司宣布，Kevin Capitani 将接替原来的 Don Kilburn 成为新一任的培生北美大区的总裁。', 'https://pic.36krcnd.com/avatar/201608/05031143/hx8qhufm9giyg5x0.jpg!feature', 'http://36kr.com/p/5050635.html', '36氪', 'http://36kr.com/p/5050635.html', '创业|出版业', '31642', '1432544975', '10000000');
INSERT INTO `tb_news` VALUES ('21', '收益不达预期，换帅能改变培生的命运吗？21', '据国外科技媒体 Edsurge 消息，日前出版巨头培生集团作出了换帅的动作：公司宣布，Kevin Capitani 将接替原来的 Don Kilburn 成为新一任的培生北美大区的总裁。', 'https://pic.36krcnd.com/avatar/201608/05031143/hx8qhufm9giyg5x0.jpg!feature', 'http://36kr.com/p/5050635.html', '36氪', 'http://36kr.com/p/5050635.html', '创业|出版业', '31642', '1432544975', '10000000');
INSERT INTO `tb_news` VALUES ('22', '收益不达预期，换帅能改变培生的命运吗？22', '据国外科技媒体 Edsurge 消息，日前出版巨头培生集团作出了换帅的动作：公司宣布，Kevin Capitani 将接替原来的 Don Kilburn 成为新一任的培生北美大区的总裁。', 'https://pic.36krcnd.com/avatar/201608/05031143/hx8qhufm9giyg5x0.jpg!feature', 'http://36kr.com/p/5050635.html', '36氪', 'http://36kr.com/p/5050635.html', '创业|出版业', '31642', '1432544975', '10000000');
INSERT INTO `tb_news` VALUES ('23', '收益不达预期，换帅能改变培生的命运吗？23', '据国外科技媒体 Edsurge 消息，日前出版巨头培生集团作出了换帅的动作：公司宣布，Kevin Capitani 将接替原来的 Don Kilburn 成为新一任的培生北美大区的总裁。', 'https://pic.36krcnd.com/avatar/201608/05031143/hx8qhufm9giyg5x0.jpg!feature', 'http://36kr.com/p/5050635.html', '36氪', 'http://36kr.com/p/5050635.html', '创业|出版业', '31642', '1432544975', '10000000');
INSERT INTO `tb_news` VALUES ('24', '收益不达预期，换帅能改变培生的命运吗？24', '据国外科技媒体 Edsurge 消息，日前出版巨头培生集团作出了换帅的动作：公司宣布，Kevin Capitani 将接替原来的 Don Kilburn 成为新一任的培生北美大区的总裁。', 'https://pic.36krcnd.com/avatar/201608/05031143/hx8qhufm9giyg5x0.jpg!feature', 'http://36kr.com/p/5050635.html', '36氪', 'http://36kr.com/p/5050635.html', '创业|出版业', '31642', '1432544975', '10000000');
INSERT INTO `tb_news` VALUES ('25', '收益不达预期，换帅能改变培生的命运吗？25', '据国外科技媒体 Edsurge 消息，日前出版巨头培生集团作出了换帅的动作：公司宣布，Kevin Capitani 将接替原来的 Don Kilburn 成为新一任的培生北美大区的总裁。', 'https://pic.36krcnd.com/avatar/201608/05031143/hx8qhufm9giyg5x0.jpg!feature', 'http://36kr.com/p/5050635.html', '36氪', 'http://36kr.com/p/5050635.html', '创业|出版业', '31642', '1432544975', '10000000');
INSERT INTO `tb_news` VALUES ('26', '收益不达预期，换帅能改变培生的命运吗？26', '据国外科技媒体 Edsurge 消息，日前出版巨头培生集团作出了换帅的动作：公司宣布，Kevin Capitani 将接替原来的 Don Kilburn 成为新一任的培生北美大区的总裁。', 'https://pic.36krcnd.com/avatar/201608/05031143/hx8qhufm9giyg5x0.jpg!feature', 'http://36kr.com/p/5050635.html', '36氪', 'http://36kr.com/p/5050635.html', '创业|出版业', '31642', '1432544975', '10000000');
INSERT INTO `tb_news` VALUES ('27', 'ssssssd', 'sfsdf', 'sdfsds', 'http://36kr.com/p/5050635.html', '36氪', 'http://36kr.com/p/5050635.html', '创业|出版业', '232', '1432544975', '10000000');
INSERT INTO `tb_news` VALUES ('28', 'ssssssd撒旦法撒旦法撒旦', 'sfsdf', 'sdfsds', 'http://36kr.com/p/5050635.html', '36氪', 'http://36kr.com/p/5050635.html', '创业|出版业', '232', '1432544975', '10000000');
INSERT INTO `tb_news` VALUES ('29', 'ssssssd撒旦法撒旦法撒旦法撒旦法撒东方闪电水电费', 'sfsdf', 'sdfsds', 'http://36kr.com/p/5050635.html', '36氪', 'http://36kr.com/p/5050635.html', '创业|出版业', '232', '1432544975', '10000000');

-- ----------------------------
-- Table structure for tb_replies
-- ----------------------------
DROP TABLE IF EXISTS `tb_replies`;
CREATE TABLE `tb_replies` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `topicid` bigint(11) DEFAULT NULL,
  `createdby` bigint(11) DEFAULT NULL,
  `createdon` bigint(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tb_replies
-- ----------------------------
INSERT INTO `tb_replies` VALUES ('24', '我', '0', '10000007', '1470994990');
INSERT INTO `tb_replies` VALUES ('25', '哈哈哈', '104', '10000007', '1470995044');
INSERT INTO `tb_replies` VALUES ('26', '呵呵好', '104', '10000007', '1470995051');
INSERT INTO `tb_replies` VALUES ('27', '清清浅浅', '104', '10000007', '1470995078');

-- ----------------------------
-- Table structure for tb_tags
-- ----------------------------
DROP TABLE IF EXISTS `tb_tags`;
CREATE TABLE `tb_tags` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `category` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `createdon` bigint(11) DEFAULT NULL,
  `createdby` bigint(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tb_tags
-- ----------------------------
INSERT INTO `tb_tags` VALUES ('78', '安全', null, null, null);
INSERT INTO `tb_tags` VALUES ('79', '大数据', null, null, null);
INSERT INTO `tb_tags` VALUES ('80', '区块链', null, null, null);
INSERT INTO `tb_tags` VALUES ('81', '去IOE', null, null, null);
INSERT INTO `tb_tags` VALUES ('82', 'DevOpt', null, null, null);
INSERT INTO `tb_tags` VALUES ('83', '数据库', null, null, null);

-- ----------------------------
-- Table structure for tb_topics
-- ----------------------------
DROP TABLE IF EXISTS `tb_topics`;
CREATE TABLE `tb_topics` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `images` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tags` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `replynum` int(11) DEFAULT NULL,
  `createdon` bigint(11) DEFAULT NULL,
  `createdby` bigint(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tb_topics
-- ----------------------------
INSERT INTO `tb_topics` VALUES ('104', '栗矢炙敌净义岳碗饶兼沙畦颜闰壕决晰橙尼锡', '餐匡巢燕施鲸虹崖狈卵痪发屏念蜜壁支汾撮伏鱼钟创班猴罕崩冀刹蕾坚喉阵傣溢虐磅堪瘩凸纬谜聚匀虞臂兜焕债友', 'images', '测试标签', '1243', '1470994915', '10000007');
INSERT INTO `tb_topics` VALUES ('105', '意峦尚胀尧吼户稀戈湾澡真辩截剁诚蕉臻信烦', '沥雄胚战竿萧佑疲生潘腥饰寓掌书惰程念推昌跃斑滞况恳秘突骄极骗夕吊盂疥铃疯诧倪号骗年蛊牙眺嘱怠旺导谨驾', 'images', '测试标签', '0', '1470997181', '10000007');

-- ----------------------------
-- Table structure for tb_users
-- ----------------------------
DROP TABLE IF EXISTS `tb_users`;
CREATE TABLE `tb_users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nickname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mobile` bigint(20) DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `truename` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slogan` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sex` int(1) DEFAULT NULL,
  `wechat` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `birthday` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `avatar` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tags` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `certification` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `vocation` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `experience` int(11) DEFAULT NULL,
  `devicetoken` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `registertime` bigint(20) DEFAULT NULL,
  `registerlati` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `registerlong` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `appversion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10000022 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tb_users
-- ----------------------------
INSERT INTO `tb_users` VALUES ('10000000', '张1', '1000000', '123', 'sdfs', null, null, null, null, null, null, 'resources/avatars/avatar_23.jpg', null, null, null, null, null, null, null, null, null);
INSERT INTO `tb_users` VALUES ('10000001', '阿斯达', '1000001', '123', 'ssssssdf', null, null, null, null, null, null, 'upload/avatar/14707479600131291210300.jpg', null, null, null, null, null, null, null, null, null);
INSERT INTO `tb_users` VALUES ('10000002', '实施', '1000002', '123', 'string', 'string', '0', 'string', 'string', 'string', 'string', 'resources/avatars/avatar_20.jpg', 'string', 'string', 'string', '0', 'string', '1470670476', 'string', 'string', 'string');
INSERT INTO `tb_users` VALUES ('10000003', '水电费', '1000003', '123', 'string', 'string', '0', 'string', 'string', 'string', 'string', 'resources/avatars/avatar_23.jpg', '安全,大数据,区块链', 'string', 'string', '0', 'string', '1470670511', 'string', 'string', 'string');
INSERT INTO `tb_users` VALUES ('10000004', '一天', '1000004', '123', 'string', 'string', '0', 'string', 'string', 'string', 'string', 'resources/avatars/avatar_12.jpg', 'string', 'string', 'string', '0', 'string', '1470670534', 'string', 'string', 'string');
INSERT INTO `tb_users` VALUES ('10000005', '热VC', '1000005', '123', 'string', 'string', '0', 'string', 'string', 'string', 'string', 'resources/avatars/avatar_20.jpg', 'string', 'string', 'string', '0', 'string', '1470670535', 'string', 'string', 'string');
INSERT INTO `tb_users` VALUES ('10000006', '就让他', '10000006', '123', 'string', 'string', '0', 'string', 'string', 'string', 'string', 'string', '安全,大数据,区块链', 'string', 'string', '0', 'string', '0', 'string', 'string', 'string');
INSERT INTO `tb_users` VALUES ('10000007', '新昵称', '1000007', '123', '1、呵呵', 'string', '0', 'string', 'string', 'string', 'string', 'upload/avatar/14709960903171291210300.png', '大数据', 'string', '你就你就能解决年纪', '10', 'string', '1470670536', 'string', 'string', 'string');
INSERT INTO `tb_users` VALUES ('10000008', '师德师风', '1000008', '123456', 'string', 'string', '0', 'string', 'string', 'string', 'string', 'resources/avatars/avatar_20.jpg', 'string', 'string', 'string', '0', 'string', '1470670536', 'string', 'string', 'string');
INSERT INTO `tb_users` VALUES ('10000009', '谁谁谁v', '1000009', '123', 'string', 'string', '0', 'string', 'string', 'string', 'string', 'resources/avatars/avatar_9.jpg', 'string', 'string', 'string', '0', 'string', '1470670536', 'string', 'string', 'string');
INSERT INTO `tb_users` VALUES ('10000010', 'u大概', '1000010', '123', 'string', 'string', '0', 'string', 'string', 'string', 'string', 'resources/avatars/avatar_4.jpg', 'string', 'string', 'string', '0', 'string', '1470670537', 'string', 'string', 'string');
INSERT INTO `tb_users` VALUES ('10000011', '东方国际', '1000011', '123', 'string', 'string', '0', 'string', 'string', 'string', 'string', 'resources/avatars/avatar_18.jpg', 'string', 'string', 'string', '0', 'string', '1470670537', 'string', 'string', 'string');
INSERT INTO `tb_users` VALUES ('10000012', '而二恶', '15300086234', '111111', 'string', 'string', '0', 'string', 'string', 'string', 'string', 'upload/avatar/14707482226491291210300.png', 'string', 'string', 'string', '0', 'string', '1470746199', 'string', 'string', 'string');
INSERT INTO `tb_users` VALUES ('10000014', null, null, '1', null, null, null, null, null, null, null, 'resources/avatars/avatar_12.jpg', null, null, null, null, null, '1470974896', null, null, null);
INSERT INTO `tb_users` VALUES ('10000015', null, null, '111111', null, null, null, null, null, null, null, 'resources/avatars/avatar_25.jpg', null, null, null, null, null, '1470997461', null, null, null);
INSERT INTO `tb_users` VALUES ('10000016', null, '15300086123', '111111', null, null, null, null, null, null, null, 'resources/avatars/avatar_4.jpg', null, null, null, null, null, '1470997533', null, null, null);
INSERT INTO `tb_users` VALUES ('10000017', null, '15300086321', '123', null, null, null, null, null, null, null, 'resources/avatars/avatar_23.jpg', null, null, null, null, null, '1470997723', null, null, null);
INSERT INTO `tb_users` VALUES ('10000018', null, '15300086000', '123', null, null, null, null, null, null, null, 'resources/avatars/avatar_9.jpg', null, null, null, null, null, '1470999421', null, null, null);
INSERT INTO `tb_users` VALUES ('10000019', null, '15300086234', '111', null, null, null, null, null, null, null, 'resources/avatars/avatar_1.jpg', null, null, null, null, null, '1470999626', null, null, null);
INSERT INTO `tb_users` VALUES ('10000020', null, '15300086212', '111', null, null, null, null, null, null, null, 'resources/avatars/avatar_11.jpg', null, null, null, null, null, '1470999693', null, null, null);
INSERT INTO `tb_users` VALUES ('10000021', null, '15300086234', '123', null, null, null, null, null, null, null, 'resources/avatars/avatar_2.jpg', null, null, null, null, null, '1470999818', null, null, null);
