/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50611
Source Host           : localhost:3306
Source Database       : app_masters

Target Server Type    : MYSQL
Target Server Version : 50611
File Encoding         : 65001

Date: 2016-10-10 20:26:13
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `tb_ads`
-- ----------------------------
DROP TABLE IF EXISTS `tb_ads`;
CREATE TABLE `tb_ads` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `imageurl` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '广告图片地址',
  `redirecturl` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirectnum` int(9) DEFAULT NULL,
  `position` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createdon` bigint(20) DEFAULT NULL,
  `createdby` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of tb_ads
-- ----------------------------
INSERT INTO `tb_ads` VALUES ('1', 'http://od8rh27zr.bkt.clouddn.com/topic_14734389459111291210300.png', 'https://www.baidu.com', '测试广告等你来点', '18', '1', null, null);

-- ----------------------------
-- Table structure for `tb_certifications`
-- ----------------------------
DROP TABLE IF EXISTS `tb_certifications`;
CREATE TABLE `tb_certifications` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `number` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `images` varchar(2000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createdon` bigint(20) DEFAULT NULL,
  `createdby` bigint(11) DEFAULT NULL,
  `verifiedon` bigint(20) DEFAULT NULL,
  `verifiedby` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of tb_certifications
-- ----------------------------
INSERT INTO `tb_certifications` VALUES ('37', '思科CCIE认证', 'person', '10086', null, 'upload/certification/person/cert_14750570217231291210300.png', '1475057023', '10000012', '1', null);
INSERT INTO `tb_certifications` VALUES ('40', 'Feeds', 'person', '111212', null, 'certification/upload/person/cert', '1476007061', '10000027', null, null);
INSERT INTO `tb_certifications` VALUES ('41', 'T5trt1', 'person', '12133323', null, 'certification/upload/person/cert', '1476007134', '10000027', null, null);

-- ----------------------------
-- Table structure for `tb_favorites`
-- ----------------------------
DROP TABLE IF EXISTS `tb_favorites`;
CREATE TABLE `tb_favorites` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `itemid` bigint(20) DEFAULT NULL,
  `category` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `createdby` bigint(11) DEFAULT NULL,
  `createdon` bigint(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of tb_favorites
-- ----------------------------
INSERT INTO `tb_favorites` VALUES ('82', '4', 'news', '10000012', '1476012878');
INSERT INTO `tb_favorites` VALUES ('83', '5', 'news', '10000012', '1476013130');
INSERT INTO `tb_favorites` VALUES ('85', '1', 'news', '10000012', '1476082319');
INSERT INTO `tb_favorites` VALUES ('87', '192', 'topic', '10000012', '1476082773');

-- ----------------------------
-- Table structure for `tb_feedbacks`
-- ----------------------------
DROP TABLE IF EXISTS `tb_feedbacks`;
CREATE TABLE `tb_feedbacks` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `images` varchar(2000) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `category` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `createdby` bigint(11) DEFAULT NULL,
  `createdon` bigint(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of tb_feedbacks
-- ----------------------------
INSERT INTO `tb_feedbacks` VALUES ('3', '12313123123', 'upload/feedback/14715968872691291210300.png,upload/feedback/14715968872701291210300.png', null, null, null);
INSERT INTO `tb_feedbacks` VALUES ('4', '123', 'upload/feedback/14715970108281291210300.png', null, null, null);
INSERT INTO `tb_feedbacks` VALUES ('5', '123213123', 'upload/feedback/14715970815231291210300.png', null, null, null);
INSERT INTO `tb_feedbacks` VALUES ('6', '却2', 'upload/feedback/14715971416061291210300.png', null, null, null);
INSERT INTO `tb_feedbacks` VALUES ('7', '312312', 'upload/feedback/14715971817971291210300.png', null, null, null);
INSERT INTO `tb_feedbacks` VALUES ('8', '13', 'upload/feedback/14715972309401291210300.png', null, null, null);
INSERT INTO `tb_feedbacks` VALUES ('9', '尺寸长还问我', null, null, '10000027', '1473664505');
INSERT INTO `tb_feedbacks` VALUES ('10', '尺寸长还问我', null, null, '10000027', '1473664505');
INSERT INTO `tb_feedbacks` VALUES ('11', null, 'upload/temp14751317195101291210300.png', null, null, '1475131725');
INSERT INTO `tb_feedbacks` VALUES ('12', null, 'upload/temp14751317607441291210300.png', null, null, '1475131763');
INSERT INTO `tb_feedbacks` VALUES ('13', null, '1476425601539.png', null, null, '1475134399');
INSERT INTO `tb_feedbacks` VALUES ('14', null, '1476427155249.png', null, null, '1475135944');
INSERT INTO `tb_feedbacks` VALUES ('15', null, '1476427184297.png', null, null, '1475135974');
INSERT INTO `tb_feedbacks` VALUES ('16', null, 'upload/temp/14751362643471291210300.png', null, null, '1475136264');
INSERT INTO `tb_feedbacks` VALUES ('17', null, '1476428690214.png', null, null, '1475137479');
INSERT INTO `tb_feedbacks` VALUES ('18', null, '1476429191451.png', null, null, '1475137981');
INSERT INTO `tb_feedbacks` VALUES ('19', null, '/upload/temp14751385774201291210300.png', null, null, '1475138628');
INSERT INTO `tb_feedbacks` VALUES ('20', null, '1476430253319.png', null, null, '1475139047');
INSERT INTO `tb_feedbacks` VALUES ('21', null, '/upload/temp14751392959741291210300.png', null, null, '1475139299');
INSERT INTO `tb_feedbacks` VALUES ('22', null, '/upload/temp/14751398550131291210300.png', null, null, '1475139859');
INSERT INTO `tb_feedbacks` VALUES ('23', null, '/upload/temp/14751399778811291210300.png', null, null, '1475139980');
INSERT INTO `tb_feedbacks` VALUES ('24', null, '/upload/temp/14751400548511291210300.png', null, null, '1475140057');
INSERT INTO `tb_feedbacks` VALUES ('25', '我们在这里我要', 'http://od8rh27zr.bkt.clouddn.com/feedback_14751422143711291210300.png,http://od8rh27zr.bkt.clouddn.com/feedback_14751422170621291210300.png', null, '10000012', '1475142217');
INSERT INTO `tb_feedbacks` VALUES ('26', '我们在这里我要', 'http://od8rh27zr.bkt.clouddn.com/feedback_14751422145891291210300.png,http://od8rh27zr.bkt.clouddn.com/feedback_14751422177001291210300.png', null, '10000012', '1475142218');
INSERT INTO `tb_feedbacks` VALUES ('27', null, '/upload/feedback/14751444520061291210300.png', null, null, '1475144452');
INSERT INTO `tb_feedbacks` VALUES ('28', null, '/upload/feedback/14751510867431291210300.png', null, null, '1475151086');
INSERT INTO `tb_feedbacks` VALUES ('29', null, '/upload/feedback/14751511043681291210300.png', null, null, '1475151104');
INSERT INTO `tb_feedbacks` VALUES ('30', null, '/upload/feedback/14751511106781291210300.png', null, null, '1475151110');
INSERT INTO `tb_feedbacks` VALUES ('31', null, '/upload/feedback/14751511108771291210300.png', null, null, '1475151110');
INSERT INTO `tb_feedbacks` VALUES ('32', null, '/upload/feedback/14751511110691291210300.png', null, null, '1475151111');
INSERT INTO `tb_feedbacks` VALUES ('33', null, '/upload/feedback/14751511112851291210300.png', null, null, '1475151111');
INSERT INTO `tb_feedbacks` VALUES ('34', null, '/upload/feedback/14751511115001291210300.png', null, null, '1475151111');
INSERT INTO `tb_feedbacks` VALUES ('35', null, '/upload/feedback/14751511117211291210300.png', null, null, '1475151111');
INSERT INTO `tb_feedbacks` VALUES ('36', null, 'upload/feedback/14751701932451291210300.png', null, null, '1475170193');
INSERT INTO `tb_feedbacks` VALUES ('37', null, 'upload/feedback/14751702998921291210300.png', null, null, '1475170299');
INSERT INTO `tb_feedbacks` VALUES ('38', null, 'upload/feedback/14751705164111291210300.png', null, null, '1475170516');
INSERT INTO `tb_feedbacks` VALUES ('39', null, 'upload/feedback/14751705914631291210300.png', null, null, '1475170591');
INSERT INTO `tb_feedbacks` VALUES ('40', null, 'upload/feedback/14751706225831291210300.png', null, null, '1475170622');
INSERT INTO `tb_feedbacks` VALUES ('41', null, '1476494112232.png', null, null, '1475202901');
INSERT INTO `tb_feedbacks` VALUES ('42', '放 v 和家家户户哼哼唧唧', 'http://oeaspf0zi.bkt.clouddn.com/feedback_14752114941031291210300.png', null, '10000027', '1475211496');

-- ----------------------------
-- Table structure for `tb_news`
-- ----------------------------
DROP TABLE IF EXISTS `tb_news`;
CREATE TABLE `tb_news` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `summary` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `cover` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `source` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `tags` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `readnum` int(11) DEFAULT NULL,
  `createdon` bigint(11) DEFAULT NULL,
  `createdby` bigint(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of tb_news
-- ----------------------------
INSERT INTO `tb_news` VALUES ('1', '解雇数十人重心转向软件，硬件重臣回归没能挽救苹果汽车，“泰坦”坠落', '解雇数十人重心转向软件，硬件重臣回归没能挽救苹果汽车，“泰坦”坠落', 'https://imgs.bipush.com/article/cover/201502/10/114135990219.jpg?imageView2/1/w/300/h/300/imageMogr2/strip/interlace/1/quality/85/format/jpg', 'https://www.huxiu.com/article/163553.html', '虎嗅', 'https://www.huxiu.com/article/163553.html', '投资|创业', '3400', '1432544975', '10000000');
INSERT INTO `tb_news` VALUES ('2', 'AirPods是苹果布局物联网的新棋子，这个观点你同意吗？', 'AirPods是苹果布局物联网的新棋子，这个观点你同意吗？', 'https://imgs.bipush.com/article/cover/201609/12/111424232632.jpg?imageView2/1/w/300/h/300/imageMogr2/strip/interlace/1/quality/85/format/jpg', 'https://www.huxiu.com/article/163539.html?f=retweeted', '虎嗅', 'https://www.huxiu.com/article/163539.html?f=retweeted', '创业|出版业', '31642', '1432544975', '10000000');
INSERT INTO `tb_news` VALUES ('3', '支付宝效仿微信对提现进行收费，原因应该不止对冲成本那么简单', '支付宝效仿微信对提现进行收费，原因应该不止对冲成本那么简单', 'https://imgs.bipush.com/article/cover/201608/12/160900546628.jpg?imageView2/1/w/300/h/300/imageMogr2/strip/interlace/1/quality/85/format/jpg', 'https://www.huxiu.com/article/163568.html', '虎嗅', 'https://www.huxiu.com/article/163568.html', '创业|出版业', '31642', '1432544975', '10000000');
INSERT INTO `tb_news` VALUES ('4', '如何防治通信网络诈骗？与运营商相比，公安部门为何更愿意和互联网公司合作', '如何防治通信网络诈骗？与运营商相比，公安部门为何更愿意和互联网公司合作', 'https://imgs.bipush.com/article/cover/201609/12/112712497894.jpg?imageView2/1/w/300/h/300/imageMogr2/strip/interlace/1/quality/85/format/jpg', 'https://www.huxiu.com/article/163536.html', '虎嗅', 'https://www.huxiu.com/article/163536.html', '创业|出版业', '31642', '1432544975', '10000000');
INSERT INTO `tb_news` VALUES ('5', '特斯拉Autopilot系统升级，雷达得到“重用”，但马斯克表示不保证永远零事故', '特斯拉Autopilot系统升级，雷达得到“重用”，但马斯克表示不保证永远零事故', 'https://imgs.bipush.com/article/cover/201607/27/091302249334.jpg?imageView2/1/w/300/h/300/imageMogr2/strip/interlace/1/quality/85/format/jpg', 'https://www.huxiu.com/article/163530.html', '虎嗅', 'https://www.huxiu.com/article/163530.html', '创业|出版业', '31642', '1432544975', '10000000');
INSERT INTO `tb_news` VALUES ('6', '马太效应失效了！想要年入千万你可能只需要10万粉丝，为什么？', '马太效应失效了！想要年入千万你可能只需要10万粉丝，为什么？', 'https://imgs.bipush.com/article/cover/201609/10/093400596438.png?imageView2/1/w/300/h/300/imageMogr2/strip/interlace/1/quality/85/format/jpg', 'https://www.huxiu.com/article/163382.html', '虎嗅', 'https://www.huxiu.com/article/163382.html', '创业|出版业', '31642', '1432544975', '10000000');
INSERT INTO `tb_news` VALUES ('7', '【快问】趣医网李志——融资3亿多，为什么医生平台是伪命题，得医院才得天下？', '【快问】趣医网李志——融资3亿多，为什么医生平台是伪命题，得医院才得天下？', 'https://imgs.bipush.com/article/cover/201609/09/080202348227.jpg?imageView2/1/w/300/h/300/imageMogr2/strip/interlace/1/quality/85/format/jpg', 'https://www.huxiu.com/article/163271.html', '虎嗅', 'https://www.huxiu.com/article/163271.html', '创业|出版业', '31642', '1432544975', '10000000');
INSERT INTO `tb_news` VALUES ('8', '【快问】多米游陈超——想要租得起一天一万块的海外别墅，得先制定一个小目标', '【快问】多米游陈超——想要租得起一天一万块的海外别墅，得先制定一个小目标', 'https://imgs.bipush.com/article/cover/201609/08/163505406327.jpg?imageView2/1/w/300/h/300/imageMogr2/strip/interlace/1/quality/85/format/jpg', 'https://www.huxiu.com/article/163199.html', '虎嗅', 'https://www.huxiu.com/article/163199.html', '创业|出版业', '31642', '1432544975', '10000000');
INSERT INTO `tb_news` VALUES ('9', '分食5万亿体育市场，万达、阿里重金布局，创业公司变现路在哪儿？', '分食5万亿体育市场，万达、阿里重金布局，创业公司变现路在哪儿？', 'https://imgs.bipush.com/article/cover/201607/28/120141195950.jpg?imageView2/1/w/300/h/300/imageMogr2/strip/interlace/1/quality/85/format/jpg', 'https://www.huxiu.com/article/163084.html', '虎嗅', 'https://www.huxiu.com/article/163084.html', '创业|出版业', '31642', '1432544975', '10000000');
INSERT INTO `tb_news` VALUES ('10', '【快问】便宜车王雷——上线两个月成交2.7亿，做汽车供应链金融为什么没坏账？', '【快问】便宜车王雷——上线两个月成交2.7亿，做汽车供应链金融为什么没坏账？', 'https://imgs.bipush.com/article/cover/201608/30/171241477130.jpg?imageView2/1/w/300/h/300/imageMogr2/strip/interlace/1/quality/85/format/jpg', 'https://www.huxiu.com/article/163098.html', '虎嗅', 'https://www.huxiu.com/article/163098.html', '创业|出版业', '31642', '1432544975', '10000000');
INSERT INTO `tb_news` VALUES ('11', '宠物版“分答”，萌爪医生如何标准化服务铲屎官？', '宠物版“分答”，萌爪医生如何标准化服务铲屎官？', 'https://imgs.bipush.com/article/cover/201609/07/192848256762.jpg?imageView2/1/w/300/h/300/imageMogr2/strip/interlace/1/quality/85/format/jpg', 'https://www.huxiu.com/article/162924.html', '虎嗅', 'https://www.huxiu.com/article/162924.html', '创业|出版业', '31642', '1432544975', '10000000');
INSERT INTO `tb_news` VALUES ('12', '【快问】新片场尹兴良——88年理工男能孵化出下一个“Papi酱”吗？', '【快问】新片场尹兴良——88年理工男能孵化出下一个“Papi酱”吗？', 'https://imgs.bipush.com/article/cover/201609/06/000134077527.jpg?imageView2/1/w/300/h/300/imageMogr2/strip/interlace/1/quality/85/format/jpg', 'https://www.huxiu.com/article/162787.html', '虎嗅', 'https://www.huxiu.com/article/162787.html', '创业|出版业', '31642', '1432544975', '10000000');
INSERT INTO `tb_news` VALUES ('13', '【快问】玩加赛事赵品奇——数据都公开了，你们要怎么赚钱？', '【快问】玩加赛事赵品奇——数据都公开了，你们要怎么赚钱？', 'https://imgs.bipush.com/article/cover/201604/22/083602420962.jpg?imageView2/1/w/300/h/300/imageMogr2/strip/interlace/1/quality/85/format/jpg', 'https://www.huxiu.com/article/162770.html', '虎嗅', 'https://www.huxiu.com/article/162770.html', '创业|出版业', '31642', '1432544975', '10000000');
INSERT INTO `tb_news` VALUES ('14', '一文总结Keep教科书般的运营策略：怎样让用户帮你推广？', '一文总结Keep教科书般的运营策略：怎样让用户帮你推广？', 'https://imgs.bipush.com/article/cover/201609/04/163532952262.jpg?imageView2/1/w/300/h/300/imageMogr2/strip/interlace/1/quality/85/format/jpg', 'https://www.huxiu.com/article/162628.html', '虎嗅', 'https://www.huxiu.com/article/162628.html', '创业|出版业', '31642', '1432544975', '10000000');
INSERT INTO `tb_news` VALUES ('15', '冯大辉与丁香园的期权之争大结局，谁赢谁输？已有阿里、搜房前例', '冯大辉与丁香园的期权之争大结局，谁赢谁输？已有阿里、搜房前例', 'https://imgs.bipush.com/article/cover/201608/30/123730370256.jpg?imageView2/1/w/300/h/300/imageMogr2/strip/interlace/1/quality/85/format/jpg', 'https://www.huxiu.com/article/162592.html', '虎嗅', 'https://www.huxiu.com/article/162592.html', '创业|出版业', '31642', '1432544975', '10000000');
INSERT INTO `tb_news` VALUES ('16', '朱啸虎说：只投年轻人（比如3年前的程维、4年前的张旭豪），不考虑70后', '朱啸虎说：只投年轻人（比如3年前的程维、4年前的张旭豪），不考虑70后', 'https://imgs.bipush.com/article/cover/201609/02/210951182647.jpg?imageView2/1/w/300/h/300/imageMogr2/strip/interlace/1/quality/85/format/jpg', 'https://www.huxiu.com/article/162546.html', '虎嗅', 'https://www.huxiu.com/article/162546.html', '创业|出版业', '31642', '1432544975', '10000000');
INSERT INTO `tb_news` VALUES ('17', '【快问】17互助高竞——上线2个月，用户45万，凭什么估值翻三倍？', '【快问】17互助高竞——上线2个月，用户45万，凭什么估值翻三倍？', 'https://imgs.bipush.com/article/cover/201609/02/173141838886.jpg?imageView2/1/w/300/h/300/imageMogr2/strip/interlace/1/quality/85/format/jpg', 'https://www.huxiu.com/article/162527.html', '虎嗅', 'https://www.huxiu.com/article/162527.html', '创业|出版业', '31642', '1432544975', '10000000');
INSERT INTO `tb_news` VALUES ('18', '纯银V宣布创业项目“氢气球”失败，已准备好再创业但不会碰旅行了', '纯银V宣布创业项目“氢气球”失败，已准备好再创业但不会碰旅行了', 'https://imgs.bipush.com/article/cover/201609/02/135508879307.jpg?imageView2/1/w/300/h/300/imageMogr2/strip/interlace/1/quality/85/format/jpg', 'https://www.huxiu.com/article/162458.html', '虎嗅', 'https://www.huxiu.com/article/162458.html', '创业|出版业', '31642', '1432544975', '10000000');
INSERT INTO `tb_news` VALUES ('19', '国务院：支持保险机构跟国企设立或参股创投企业', '国务院：支持保险机构跟国企设立或参股创投企业', 'https://imgs.bipush.com/article/cover/201609/01/210313240929.jpg?imageView2/1/w/300/h/300/imageMogr2/strip/interlace/1/quality/85/format/jpg', 'https://www.huxiu.com/article/162380.html', '虎嗅', 'https://www.huxiu.com/article/162380.html', '创业|出版业', '31642', '1432544975', '10000000');
INSERT INTO `tb_news` VALUES ('20', '【快问】美术宝甘凌——用户量是行业老二的近十倍，新进者还有机会吗？', '【快问】美术宝甘凌——用户量是行业老二的近十倍，新进者还有机会吗？', 'https://imgs.bipush.com/article/cover/201609/01/202537300431.jpg?imageView2/1/w/300/h/300/imageMogr2/strip/interlace/1/quality/85/format/jpg', 'https://www.huxiu.com/article/162376.html', '虎嗅', 'https://www.huxiu.com/article/162376.html', '创业|出版业', '31642', '1432544975', '10000000');
INSERT INTO `tb_news` VALUES ('21', '【快问】易途 8邓元法——三个月融两轮超2亿，是准备开始烧钱了吗？', '【快问】易途 8邓元法——三个月融两轮超2亿，是准备开始烧钱了吗？', 'https://imgs.bipush.com/article/cover/201608/31/204454029304.jpg?imageView2/1/w/300/h/300/imageMogr2/strip/interlace/1/quality/85/format/jpg', 'https://www.huxiu.com/article/162233.html', '虎嗅', 'https://www.huxiu.com/article/162233.html', '创业|出版业', '31642', '1432544975', '10000000');
INSERT INTO `tb_news` VALUES ('22', '咕咚、动动、光猪圈…体育创业谁是清流？谁是泥石流？', '咕咚、动动、光猪圈…体育创业谁是清流？谁是泥石流？', 'https://imgs.bipush.com/article/cover/201608/31/212744682999.jpg?imageView2/1/w/300/h/300/imageMogr2/strip/interlace/1/quality/85/format/jpg', 'https://www.huxiu.com/article/162220.html', '虎嗅', 'https://www.huxiu.com/article/162220.html', '创业|出版业', '31642', '1432544975', '10000000');
INSERT INTO `tb_news` VALUES ('23', '创业公司如何突破重围？', '创业公司如何突破重围？', 'https://imgs.bipush.com/article/cover/201412/18/212342419853.jpg?imageView2/1/w/300/h/300/imageMogr2/strip/interlace/1/quality/85/format/jpg', 'https://www.huxiu.com/article/162092.html', '虎嗅', 'https://www.huxiu.com/article/162092.html', '创业|出版业', '31642', '1432544975', '10000000');
INSERT INTO `tb_news` VALUES ('24', '五步走，绕开电商创业的供应链大坑', '五步走，绕开电商创业的供应链大坑', 'https://imgs.bipush.com/article/cover/201608/30/214531607517.jpeg?imageView2/1/w/300/h/300/imageMogr2/strip/interlace/1/quality/85/format/jpg', 'https://www.huxiu.com/article/161957.html', '虎嗅', 'https://www.huxiu.com/article/161957.html', '创业|出版业', '31642', '1432544975', '10000000');
INSERT INTO `tb_news` VALUES ('25', '给你讲个笑话，我是创业公司的投资人', '给你讲个笑话，我是创业公司的投资人', 'https://imgs.bipush.com//article/cover/201607/24/102824660978.jpg?imageView2/1/w/300/h/300/imageMogr2/strip/interlace/1/quality/85/format/jpg', 'https://www.huxiu.com/article/162055.html', '虎嗅', 'https://www.huxiu.com/article/162055.html', '创业|出版业', '31642', '1432544975', '10000000');
INSERT INTO `tb_news` VALUES ('26', '无辜的孩子用身体戳破了“验收合格证明”的一纸谎言，创业一年多，他就是要跟毒跑道一直死磕', '无辜的孩子用身体戳破了“验收合格证明”的一纸谎言，创业一年多，他就是要跟毒跑道一直死磕', 'https://imgs.bipush.com/article/cover/201608/30/112445769182.jpg?imageView2/1/w/300/h/300/imageMogr2/strip/interlace/1/quality/85/format/jpg', 'https://www.huxiu.com/article/161965.html', '虎嗅', 'https://www.huxiu.com/article/161965.html', '创业|出版业', '31642', '1432544975', '10000000');
INSERT INTO `tb_news` VALUES ('27', '【快问】猎上网辛小蝶——公布了企业黑名单，有人恐吓你吗？', '【快问】猎上网辛小蝶——公布了企业黑名单，有人恐吓你吗？', 'https://imgs.bipush.com/article/cover/201608/29/190302299354.jpg?imageView2/1/w/300/h/300/imageMogr2/strip/interlace/1/quality/85/format/jpg', 'https://www.huxiu.com/article/161915.html', '虎嗅', 'https://www.huxiu.com/article/161915.html', '创业|出版业', '232', '1432544975', '10000000');
INSERT INTO `tb_news` VALUES ('28', '“美柚才露馅，蜻蜓立上头”，资本寒冬里，互联网公司更爱“造假”？', '“美柚才露馅，蜻蜓立上头”，资本寒冬里，互联网公司更爱“造假”？', 'https://imgs.bipush.com/article/cover/201608/30/090406184008.png?imageView2/1/w/300/h/300/imageMogr2/strip/interlace/1/quality/85/format/jpg', 'https://www.huxiu.com/article/161944.html', '虎嗅', 'https://www.huxiu.com/article/161944.html', '创业|出版业', '232', '1432544975', '10000000');
INSERT INTO `tb_news` VALUES ('29', '【快问】吉因加易鑫——未来能给每个人定制癌症肿瘤特效药吗？', '【快问】吉因加易鑫——未来能给每个人定制癌症肿瘤特效药吗？', 'https://imgs.bipush.com/article/cover/201608/29/183820751641.jpg?imageView2/1/w/300/h/300/imageMogr2/strip/interlace/1/quality/85/format/jpg', 'https://www.huxiu.com/article/161904.html', '虎嗅', 'https://www.huxiu.com/article/161904.html', '创业|出版业', '232', '1432544975', '10000000');
INSERT INTO `tb_news` VALUES ('30', '投资人也不容易，你们不要忽悠他', '投资人也不容易，你们不要忽悠他', 'https://imgs.bipush.com/article/cover/201608/29/181241151107.png?imageView2/1/w/300/h/300/imageMogr2/strip/interlace/1/quality/85/format/jpg', 'https://www.huxiu.com/article/161902.html', '虎嗅', 'https://www.huxiu.com/article/161902.html', '创业|出版业', '232', '1432544975', '10000000');

-- ----------------------------
-- Table structure for `tb_replies`
-- ----------------------------
DROP TABLE IF EXISTS `tb_replies`;
CREATE TABLE `tb_replies` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `topicid` bigint(11) DEFAULT NULL,
  `createdby` bigint(11) DEFAULT NULL,
  `createdon` bigint(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of tb_replies
-- ----------------------------
INSERT INTO `tb_replies` VALUES ('9', '人人人人人', '178', '10000012', '1473663305');
INSERT INTO `tb_replies` VALUES ('10', '收拾收拾⬆️', '177', '10000012', '1473663355');
INSERT INTO `tb_replies` VALUES ('11', '上半年在男尊女卑保暖男女B宣布准备准备洗白白雄心勃勃？是并行不悖絮絮不休吧你能百战百胜吧……是不变资本！这是你吧。你咋不信你不是都不是。', '179', '10000012', '1473664420');
INSERT INTO `tb_replies` VALUES ('12', '刚回家后发现我的微博已经开了', '178', '10000027', '1473664766');
INSERT INTO `tb_replies` VALUES ('13', '比那些年那些那些年才能你猜你猜你猜你的你呢对那些浓浓淡淡百般刁难东南西北不咸不淡那些年相比是你内心你承诺', '175', '10000027', '1473664971');
INSERT INTO `tb_replies` VALUES ('14', '好玩儿呀', '180', '10000029', '1473665222');
INSERT INTO `tb_replies` VALUES ('15', 'Huuyuhhihijkjkkkj ', '180', '10000027', '1473845369');
INSERT INTO `tb_replies` VALUES ('16', '雨后部分', '187', '10000012', '1475123830');
INSERT INTO `tb_replies` VALUES ('17', 'Vbmvffjk', '187', '10000027', '1475149549');
INSERT INTO `tb_replies` VALUES ('18', '谁给个红包 vv 成都风味太好了，这么晚u风复古', '188', '10000027', '1475213898');
INSERT INTO `tb_replies` VALUES ('19', '仿佛回到了原点', '188', '10000012', '1475216616');
INSERT INTO `tb_replies` VALUES ('20', 'Qrwe', '191', '10000012', '1475920010');
INSERT INTO `tb_replies` VALUES ('21', '12345678', '187', '10000012', '1475995265');
INSERT INTO `tb_replies` VALUES ('22', '123456yui', '187', '10000012', '1475995400');
INSERT INTO `tb_replies` VALUES ('23', '12345678', '191', '10000012', '1475995596');
INSERT INTO `tb_replies` VALUES ('24', 'Query ', '191', '10000012', '1475995613');
INSERT INTO `tb_replies` VALUES ('25', '11111', '191', '10000012', '1475995627');
INSERT INTO `tb_replies` VALUES ('26', '1234', '190', '10000012', '1475995847');
INSERT INTO `tb_replies` VALUES ('27', '1234567890', '190', '10000012', '1475995852');
INSERT INTO `tb_replies` VALUES ('28', 'Qwertyuio', '190', '10000012', '1475995856');
INSERT INTO `tb_replies` VALUES ('29', '123456', '190', '10000012', '1475995869');
INSERT INTO `tb_replies` VALUES ('30', '123123123123', '190', '10000012', '1475995876');
INSERT INTO `tb_replies` VALUES ('31', '123', '190', '10000012', '1475995903');
INSERT INTO `tb_replies` VALUES ('32', 'Ssssdfsfdsfdf', '180', '10000027', '1475997098');
INSERT INTO `tb_replies` VALUES ('33', 'Ddddd1222222345678987654324567890987654345678908765434567890987654678998765467898545678909876545678', '192', '10000027', '1475997557');
INSERT INTO `tb_replies` VALUES ('34', '1234567', '192', '10000012', '1476001140');
INSERT INTO `tb_replies` VALUES ('35', '9999898', '187', '10000027', '1476006872');
INSERT INTO `tb_replies` VALUES ('36', 'Daddy\'s dads ', '187', '10000027', '1476006887');
INSERT INTO `tb_replies` VALUES ('37', 'Lllllllll', '183', '10000027', '1476008924');
INSERT INTO `tb_replies` VALUES ('38', '长时间', '186', '10000012', '1476087050');
INSERT INTO `tb_replies` VALUES ('39', '你是个', '186', '10000012', '1476087145');
INSERT INTO `tb_replies` VALUES ('40', '我', '184', '10000012', '1476087224');
INSERT INTO `tb_replies` VALUES ('41', '我们自己也', '184', '10000012', '1476088020');
INSERT INTO `tb_replies` VALUES ('42', '我的心都碎了心的人都有一', '192', '10000012', '1476088064');
INSERT INTO `tb_replies` VALUES ('43', '在一起时', '189', '10000012', '1476088185');
INSERT INTO `tb_replies` VALUES ('44', '在家呢！长', '186', '10000012', '1476088208');
INSERT INTO `tb_replies` VALUES ('45', '在一起吧、个小', '188', '10000012', '1476092743');
INSERT INTO `tb_replies` VALUES ('46', '个性路线', '193', '10000012', '1476093717');

-- ----------------------------
-- Table structure for `tb_tags`
-- ----------------------------
DROP TABLE IF EXISTS `tb_tags`;
CREATE TABLE `tb_tags` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `category` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `createdon` bigint(11) DEFAULT NULL,
  `createdby` bigint(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Table structure for `tb_topics`
-- ----------------------------
DROP TABLE IF EXISTS `tb_topics`;
CREATE TABLE `tb_topics` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `images` varchar(2000) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `tags` varchar(2000) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `replynum` int(11) DEFAULT NULL,
  `createdon` bigint(11) DEFAULT NULL,
  `createdby` bigint(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=194 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of tb_topics
-- ----------------------------
INSERT INTO `tb_topics` VALUES ('178', '这个事压缩之后上传的图片', '试试效果', 'http://od8rh27zr.bkt.clouddn.com/topic_14736621803471291210300.png,http://od8rh27zr.bkt.clouddn.com/topic_14736621814171291210300.png,http://od8rh27zr.bkt.clouddn.com/topic_14736621826691291210300.png,http://od8rh27zr.bkt.clouddn.com/topic_14736621839471291210300.png,http://od8rh27zr.bkt.clouddn.com/topic_14736621850081291210300.png,http://od8rh27zr.bkt.clouddn.com/topic_14736621851791291210300.png', '你呀', '2', '1473662185', '10000012');
INSERT INTO `tb_topics` VALUES ('179', '把少男少女你说你呢对不对宝宝的时候都不是你废话都好好的别随随便便说sjjsjdnnd！', '少男少女会打扮打扮打扮淑女你说你懂不懂', 'http://od8rh27zr.bkt.clouddn.com/topic_14736643656201291210300.png', '标签', '1', '1473664366', '10000012');
INSERT INTO `tb_topics` VALUES ('180', '我只是来测试一下', '啊这是什么意思', 'http://od8rh27zr.bkt.clouddn.com/topic_14736651733451291210300.png,http://od8rh27zr.bkt.clouddn.com/topic_14736651746251291210300.png,http://od8rh27zr.bkt.clouddn.com/topic_14736651756861291210300.png', '标签', '3', '1473665176', '10000029');
INSERT INTO `tb_topics` VALUES ('181', '不回家吃饭啦让', '', 'http://od8rh27zr.bkt.clouddn.com/topic_14741882637421291210300.png', '标签', '0', '1474188268', '10000029');
INSERT INTO `tb_topics` VALUES ('182', '都不想念那些将错就错解决的不对劲', '', 'http://od8rh27zr.bkt.clouddn.com/topic_14741883645251291210300.png', '标签', '0', '1474188376', '10000029');
INSERT INTO `tb_topics` VALUES ('183', '解决拍照后上传编辑后的图片', '试试', 'http://od8rh27zr.bkt.clouddn.com/topic_14741889669751291210300.png', '标签', '1', '1474188967', '10000012');
INSERT INTO `tb_topics` VALUES ('184', '长图长图长图', '你阿斯顿发斯蒂芬', 'http://od8rh27zr.bkt.clouddn.com/topic_14741924202461291210300.png', '标签', '2', '1474192421', '10000012');
INSERT INTO `tb_topics` VALUES ('185', '我们一起吃饭', '你好啊少男', 'http://od8rh27zr.bkt.clouddn.com/topic_14741934852871291210300.png,http://od8rh27zr.bkt.clouddn.com/topic_14741934856741291210300.png,http://od8rh27zr.bkt.clouddn.com/topic_14741934861281291210300.png', '标签', '0', '1474193487', '10000012');
INSERT INTO `tb_topics` VALUES ('186', '测试长图的', '', 'http://od8rh27zr.bkt.clouddn.com/topic_14742700475671291210300.png', '标签', '3', '1474270049', '10000012');
INSERT INTO `tb_topics` VALUES ('187', '我们在这个', '你', 'http://od8rh27zr.bkt.clouddn.com/topic_14742789368431291210300.png,http://od8rh27zr.bkt.clouddn.com/topic_14742789372621291210300.png,http://od8rh27zr.bkt.clouddn.com/topic_14742789376151291210300.png,http://od8rh27zr.bkt.clouddn.com/topic_14742789380301291210300.png,http://od8rh27zr.bkt.clouddn.com/topic_14742789385731291210300.png,http://od8rh27zr.bkt.clouddn.com/topic_14742789387321291210300.png', '标签', '6', '1474278939', '10000012');
INSERT INTO `tb_topics` VALUES ('188', '如同一个沟沟壑壑黄金季节发广告广告恍恍惚惚和红红火火恍恍惚惚法国刚刚好何懿个何厚铧', '如同一个沟沟壑壑黄金季节发广告广告恍恍惚惚和红红火火恍恍惚惚法国刚刚好何懿个何厚铧红红火火恍恍惚惚个哈哈如同一个沟沟壑壑黄金季节发广告广告恍恍惚惚和红红火火恍恍惚惚法国刚刚好何懿个如同一个沟沟壑壑黄金季节发广告广告恍恍惚惚和红红火火恍恍惚惚法国刚刚好何懿个何厚铧红红火火恍恍惚惚个哈哈何厚铧红红火火恍恍惚惚个哈哈', 'http://od8rh27zr.bkt.clouddn.com/topic_14752137385641291210300.png,http://od8rh27zr.bkt.clouddn.com/topic_14752137406741291210300.png,http://od8rh27zr.bkt.clouddn.com/topic_14752137411211291210300.png', '标签', '3', '1475213741', '10000027');
INSERT INTO `tb_topics` VALUES ('189', '上传长途旅行', '', 'http://od8rh27zr.bkt.clouddn.com/topic_14752276385901291210300.png', '标签', '1', '1475227644', '10000012');
INSERT INTO `tb_topics` VALUES ('190', 'Qwerqwer啊啊你', '', null, '标签', '6', '1475915318', '10000012');
INSERT INTO `tb_topics` VALUES ('191', 'Asdfa你df ', '', null, '少男', '4', '1475919887', '10000012');
INSERT INTO `tb_topics` VALUES ('192', 'Adidas你daddy\'s', 'Adds staffs', 'http://od8rh27zr.bkt.clouddn.com/topic_14759970602581291210300.png', '你好', '3', '1475997060', '10000027');
INSERT INTO `tb_topics` VALUES ('193', '非法拘禁！', '你是个什么东西可以依赖', null, '标签', '1', '1476093695', '10000012');

-- ----------------------------
-- Table structure for `tb_users`
-- ----------------------------
DROP TABLE IF EXISTS `tb_users`;
CREATE TABLE `tb_users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nickname` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `mobile` bigint(20) DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `realname` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `slogan` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `sex` int(1) DEFAULT NULL,
  `wechat` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `birthday` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `tags` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `authimages` varchar(2000) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `idnumber` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vocation` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `experience` int(11) DEFAULT NULL,
  `devicetoken` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `registertime` bigint(20) DEFAULT NULL,
  `registerlati` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `registerlong` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `appversion` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `verifiedon` bigint(13) DEFAULT NULL,
  `verifiedby` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10000030 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of tb_users
-- ----------------------------
INSERT INTO `tb_users` VALUES ('10000000', '张1', '1000000', '123', 'sdfs', null, null, null, null, null, null, 'resources/avatars/avatar_23.jpg', null, null, null, '', null, null, null, null, null, null, null, null, null);
INSERT INTO `tb_users` VALUES ('10000001', '阿斯达', '1000001', '123', 'ssssssdf', null, null, null, null, null, null, 'upload/avatar/14707479600131291210300.jpg', null, null, null, '', null, null, null, null, null, null, null, null, null);
INSERT INTO `tb_users` VALUES ('10000002', '实施', '1000002', '123', 'string', 'string', '0', 'string', 'string', 'string', 'string', 'resources/avatars/avatar_20.jpg', 'string', 'string', null, '', '0', 'string', '1470670476', 'string', 'string', 'string', null, null, null);
INSERT INTO `tb_users` VALUES ('10000003', '水电费', '1000003', '123', 'string', 'string', '0', 'string', 'string', 'string', 'string', 'resources/avatars/avatar_23.jpg', '安全,大数据,区块链', 'string', null, '', '0', 'string', '1470670511', 'string', 'string', 'string', null, null, null);
INSERT INTO `tb_users` VALUES ('10000004', '一天', '1000004', '123', 'string', 'string', '0', 'string', 'string', 'string', 'string', 'resources/avatars/avatar_12.jpg', 'string', 'string', null, '', '0', 'string', '1470670534', 'string', 'string', 'string', null, null, null);
INSERT INTO `tb_users` VALUES ('10000005', '热VC', '1000005', '123', 'string', 'string', '0', 'string', 'string', 'string', 'string', 'resources/avatars/avatar_20.jpg', 'string', 'string', null, '', '0', 'string', '1470670535', 'string', 'string', 'string', null, null, null);
INSERT INTO `tb_users` VALUES ('10000006', '就让他', '10000006', '123', 'string', 'string', '0', 'string', 'string', 'string', 'string', 'string', '安全,大数据,区块链', '微软专家', null, '', '0', 'string', '0', 'string', 'string', 'string', null, null, null);
INSERT INTO `tb_users` VALUES ('10000007', 'AAA', '1000007', '123', '呵呵', 'string', '0', 'string', 'string', 'string', 'string', 'upload/avatar/14714172009991291210300.png', '区块链', 'CCNA、CCNP', null, '数据库专家', '7', 'string', '1470670536', 'string', 'string', 'string', null, null, null);
INSERT INTO `tb_users` VALUES ('10000008', '师德师风', '1000008', '123456', 'string', 'string', '0', 'string', 'string', 'string', 'string', 'resources/avatars/avatar_20.jpg', 'string', 'string', null, '', '0', 'string', '1470670536', 'string', 'string', 'string', null, null, null);
INSERT INTO `tb_users` VALUES ('10000009', '谁谁谁v', '1000009', '123', 'string', 'string', '0', 'string', 'string', 'string', 'string', 'resources/avatars/avatar_9.jpg', 'string', 'string', null, '', '0', 'string', '1470670536', 'string', 'string', 'string', null, null, null);
INSERT INTO `tb_users` VALUES ('10000010', 'u大概', '1000010', '123', 'string', 'string', '0', 'string', 'string', 'string', 'string', 'resources/avatars/avatar_4.jpg', 'string', 'string', null, '', '0', 'string', '1470670537', 'string', 'string', 'string', null, null, null);
INSERT INTO `tb_users` VALUES ('10000011', '东方国际', '1000011', '123', 'string', 'string', '0', 'string', 'string', 'string', 'string', 'resources/avatars/avatar_18.jpg', 'string', 'string', null, '', '0', 'string', '1470670537', 'string', 'string', 'string', null, null, null);
INSERT INTO `tb_users` VALUES ('10000012', '我是马云', '15300086234', '111111', '123', 'string', '0', 'string', 'string', 'string', 'string', 'http://od8rh27zr.bkt.clouddn.com/avatar_14759211647941291210300.png', '安全,去IOE,区块链', 'http://oeaspf0zi.bkt.clouddn.com/10000012_person_front_14760079700661291210300.png,http://oeaspf0zi.bkt.clouddn.com/10000012_person_reverse_14760079775771291210300.png,http://oeaspf0zi.bkt.clouddn.com/10000012_person_handing_14760079843591291210300.png', '130433199303153530', '阿里巴巴创始人', '3', 'string', '1470746199', 'string', 'string', 'string', null, null, null);
INSERT INTO `tb_users` VALUES ('10000014', '嚓鱼', '13888888888', '111', null, null, null, null, null, null, null, 'upload/avatar/14718411933811291210300.png', '大数据,区块链,去IOE,DevOpt', null, null, '助理教练', '10', null, '1470974896', null, null, null, null, null, null);
INSERT INTO `tb_users` VALUES ('10000015', '未设置昵称', '13800000000', '111111', null, null, null, null, null, null, null, 'resources/avatars/avatar_25.jpg', '未设置', null, null, '', '1', null, '1470997461', null, null, null, null, null, null);
INSERT INTO `tb_users` VALUES ('10000016', '未设置昵称', '15300086123', '111111', null, null, null, null, null, null, null, 'resources/avatars/avatar_4.jpg', '未设置', null, null, '', '1', null, '1470997533', null, null, null, null, null, null);
INSERT INTO `tb_users` VALUES ('10000017', '未设置昵称', '15300086321', '123', null, null, null, null, null, null, null, 'resources/avatars/avatar_23.jpg', '未设置', null, null, '', '1', null, '1470997723', null, null, null, null, null, null);
INSERT INTO `tb_users` VALUES ('10000022', '未设置昵称', '15300086789', '123456', null, null, null, null, null, null, null, 'resources/avatars/avatar_26.jpg', '未设置', null, null, '', '1', null, '1471251048', null, null, null, null, null, null);
INSERT INTO `tb_users` VALUES ('10000023', '未设置昵称', '15300087777', '123', null, null, null, null, null, null, null, 'resources/avatars/avatar_4.jpg', '未设置', null, null, '', '1', null, '1471256039', null, null, null, null, null, null);
INSERT INTO `tb_users` VALUES ('10000024', '未设置昵称', '15300009872', '123', null, null, null, null, null, null, null, 'resources/avatars/avatar_4.jpg', '未设置', null, null, '', '1', null, '1471256761', null, null, null, null, null, null);
INSERT INTO `tb_users` VALUES ('10000025', '未设置昵称', '13788888888', '111', null, null, null, null, null, null, null, 'resources/avatars/avatar_6.jpg', '未设置', null, null, '', '1', null, '1471839390', null, null, null, null, null, null);
INSERT INTO `tb_users` VALUES ('10000026', '未设置昵称', '13785017990', '1', null, null, null, null, null, null, null, 'resources/avatars/avatar_6.jpg', '未设置', null, null, '', '1', null, '1471850513', null, null, null, null, null, null);
INSERT INTO `tb_users` VALUES ('10000027', '信任', '17710919923', '123456', '123', '未设置', null, '未设置', '未设置', '未设置', '未设置', 'http://od8rh27zr.bkt.clouddn.com/avatar_14751495294871291210300.png', '去IOE,大数据,DevOpt', 'certification/upload/person/front,certification/upload/person/reverse,certification/upload/person/handing', '15212319831015279X', 'Eeeee', '3', null, '1471850716', null, null, null, null, null, null);
INSERT INTO `tb_users` VALUES ('10000028', '未设置昵称', '15101186029', '123456', null, null, null, null, null, null, null, 'resources/avatars/avatar_23.jpg', '未设置', null, null, '', '1', null, '1471850784', null, null, null, null, null, null);
INSERT INTO `tb_users` VALUES ('10000029', '好人郝', '17310466497', '123456', null, '估身价，据标签（我的身价）', null, null, null, null, null, 'upload/avatar/14736650924081291210300.png', '未设置', null, null, '', '3', null, '1471850979', null, null, null, null, null, null);

-- ----------------------------
-- Table structure for `tb_versions`
-- ----------------------------
DROP TABLE IF EXISTS `tb_versions`;
CREATE TABLE `tb_versions` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `version` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `isforced` int(11) DEFAULT NULL,
  `updateurl` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createdon` bigint(20) DEFAULT NULL,
  `createdby` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of tb_versions
-- ----------------------------
INSERT INTO `tb_versions` VALUES ('1', '100', '添加了某某功能', '1', 'https://itunes.apple.com/cn/app/yun-wei/id1100577123?mt=8', null, null);
