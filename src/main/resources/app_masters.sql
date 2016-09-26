/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50611
Source Host           : localhost:3306
Source Database       : app_masters

Target Server Type    : MYSQL
Target Server Version : 50611
File Encoding         : 65001

Date: 2016-09-20 02:49:56
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
INSERT INTO `tb_ads` VALUES ('1', 'http://a5.mzstatic.com/us/r30/Purple30/v4/9d/c6/a6/9dc6a608-7d7b-a650-0d55-2c2b6375a83a/screen696x696.jpeg', 'https://www.baidu.com', '测试广告等你来点', '10', '1', null, null);

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
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of tb_favorites
-- ----------------------------
INSERT INTO `tb_favorites` VALUES ('60', '149', 'topic', '10000012', '1473218508');
INSERT INTO `tb_favorites` VALUES ('61', '147', 'topic', '10000012', '1473320044');
INSERT INTO `tb_favorites` VALUES ('62', '1', 'news', '10000012', '1473393440');
INSERT INTO `tb_favorites` VALUES ('63', '1', 'news', '10000029', '1473665595');

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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=188 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of tb_topics
-- ----------------------------
INSERT INTO `tb_topics` VALUES ('145', 'New. Question!', 'High', 'upload/topic/14731548384061291210300.png', '标签', '0', '1473154838', '10000012');
INSERT INTO `tb_topics` VALUES ('146', 'Two pictures', 'Two pictures', 'upload/topic/14731548705471291210300.png,upload/topic/14731548705531291210300.png', '标签', '5', '1473154870', '10000012');
INSERT INTO `tb_topics` VALUES ('147', 'Three pictures', '33333', 'upload/topic/14731549228861291210300.png,upload/topic/14731549228911291210300.png,upload/topic/14731549228951291210300.png', '标签', '3', '1473154922', '10000012');
INSERT INTO `tb_topics` VALUES ('148', 'No picture', 'NO', null, '标签', '2', '1473154956', '10000012');
INSERT INTO `tb_topics` VALUES ('149', 'Picture', 'Picture ', 'upload/topic/14731550204411291210300.png', '标签', '2', '1473155020', '10000012');
INSERT INTO `tb_topics` VALUES ('150', 'Topic ', 'Topic', null, '标签', '2', '1473155208', '10000012');
INSERT INTO `tb_topics` VALUES ('151', 'four pictures', 'Four', 'upload/topic/14732141945471291210300.png,upload/topic/14732141945551291210300.png,upload/topic/14732141949121291210300.png,upload/topic/14732141949221291210300.png', '标签', '4', '1473214194', '10000012');
INSERT INTO `tb_topics` VALUES ('152', '问题是不是很多人生哲理的话', '这样就要来源的士都江堰水利工程和他一起来吧？我是有点不过你是一定的话。我们的心里只有我一个人在一起了。我们都会被迫取消了关注我吧。我是一个人的确很久没有关系。我们都市全部的话。我是', null, '标签', '6', '1473215117', '10000012');
INSERT INTO `tb_topics` VALUES ('153', '玩儿的话可以理解为什么有人会说', '我们的话可以理解为什么有人会说我们的话可以理解为什么有人会说我们的话可以理解为什么有人会说我们的话可以理解为什么有人会说', 'upload/topic/14732151978011291210300.png', '标签', '6', '1473215197', '10000012');
INSERT INTO `tb_topics` VALUES ('154', '3张飒飒是否健康', '啊是大是大非', 'upload/topic/14734054112971291210300.png,upload/topic/14734054113041291210300.png,upload/topic/14734054113061291210300.png', '标签', '0', '1473405411', '10000012');
INSERT INTO `tb_topics` VALUES ('155', '四张图片的', '啊飒飒说的', 'upload/topic/14734055967541291210300.png,upload/topic/14734055967651291210300.png,upload/topic/14734055967701291210300.png,upload/topic/14734055967951291210300.png,upload/topic/14734055971311291210300.png', '标签', '0', '1473405597', '10000012');
INSERT INTO `tb_topics` VALUES ('156', '5张啊大煞风景', '阿道夫是撒地方', 'upload/topic/14734056431871291210300.png,upload/topic/14734056431901291210300.png,upload/topic/14734056431921291210300.png,upload/topic/14734056431951291210300.png,upload/topic/14734056431981291210300.png', '标签', '0', '1473405643', '10000012');
INSERT INTO `tb_topics` VALUES ('157', '3333333', '', 'upload/topic/14734070531461291210300.png,upload/topic/14734070531501291210300.png,upload/topic/14734070531531291210300.png', '标签', '0', '1473407053', '10000012');
INSERT INTO `tb_topics` VALUES ('158', '两张图片啊', '', 'upload/topic/14734071247771291210300.png,upload/topic/14734071247901291210300.png', '标签', '0', '1473407124', '10000012');
INSERT INTO `tb_topics` VALUES ('159', '三张图屁似的', '撒旦', 'upload/topic/14734071698361291210300.png,upload/topic/14734071698391291210300.png,upload/topic/14734071698411291210300.png,upload/topic/14734071698461291210300.png', '标签', '0', '1473407169', '10000012');
INSERT INTO `tb_topics` VALUES ('160', '查查阿斯顿发生的', '阿斯顿发', 'upload/topic/14734117953231291210300.png', '标签', '0', '1473411795', '10000012');
INSERT INTO `tb_topics` VALUES ('161', '我们在这里的一切都是你是', '我们在这里我要做', 'upload/topic/14734131781591291210300.png,upload/topic/14734131781621291210300.png,upload/topic/14734131781651291210300.png,upload/topic/14734131781671291210300.png,upload/topic/14734131781711291210300.png,upload/topic/14734131781741291210300.png', '标签', '0', '1473413178', '10000012');
INSERT INTO `tb_topics` VALUES ('162', '我们限制上传六张照片', '企鹅万人', 'upload/topic/14734141885081291210300.png,upload/topic/14734141885121291210300.png,upload/topic/14734141885151291210300.png,upload/topic/14734141885191291210300.png,upload/topic/14734141885231291210300.png,upload/topic/14734141885281291210300.png', '标签', '0', '1473414188', '10000012');
INSERT INTO `tb_topics` VALUES ('163', '五张照片试试', '五张照片', 'upload/topic/14734142916251291210300.png,upload/topic/14734142916281291210300.png,upload/topic/14734142916311291210300.png,upload/topic/14734142916341291210300.png,upload/topic/14734142916361291210300.png', '标签', '0', '1473414291', '10000012');
INSERT INTO `tb_topics` VALUES ('164', '晚上吃什么', '纯纯粹粹次', 'upload/topic/14734157775861291210300.png,upload/topic/14734157775891291210300.png,upload/topic/14734157775931291210300.png,upload/topic/14734157775971291210300.png,upload/topic/14734157776011291210300.png,upload/topic/14734157776051291210300.png', '标签', '0', '1473415777', '10000012');
INSERT INTO `tb_topics` VALUES ('165', null, null, 'http://od8rh27zr.bkt.clouddn.com/ommasters/topic_14734368338861291210300.png', null, '0', '1473436836', '666666');
INSERT INTO `tb_topics` VALUES ('166', null, null, 'http://od8rh27zr.bkt.clouddn.com/topic_14734372138621291210300.jpg', null, '0', '1473437214', '666666');
INSERT INTO `tb_topics` VALUES ('167', '中午饭吃什么', '我们', 'http://od8rh27zr.bkt.clouddn.com/topic_14736510414711291210300.png,http://od8rh27zr.bkt.clouddn.com/topic_14736510429381291210300.png', '标签', '0', '1473651044', '666666');
INSERT INTO `tb_topics` VALUES ('168', '回复地方就会反复个', '韩国风复古', null, '标签', '0', '1473651136', '666666');
INSERT INTO `tb_topics` VALUES ('169', '就会很久很久很久', '呵呵', 'http://od8rh27zr.bkt.clouddn.com/topic_14736512528061291210300.png', '标签', '0', '1473651253', '666666');
INSERT INTO `tb_topics` VALUES ('170', '将韩国风复古很高很高', '看过就好', null, '标签', '0', '1473651305', '10000012');
INSERT INTO `tb_topics` VALUES ('171', '规范化复古风格', '结果', 'http://od8rh27zr.bkt.clouddn.com/topic_14736513234131291210300.png', '标签', '0', '1473651327', '10000012');
INSERT INTO `tb_topics` VALUES ('172', '哈利波特七本书，第一个字可以组成一句话，猜猜是什么？', '哈哈哈哈哈哈哈', 'http://od8rh27zr.bkt.clouddn.com/topic_14736523270001291210300.png,http://od8rh27zr.bkt.clouddn.com/topic_14736523304931291210300.png', '标签', '0', '1473652331', '10000012');
INSERT INTO `tb_topics` VALUES ('173', 'The only thing ', 'I love ', 'http://od8rh27zr.bkt.clouddn.com/topic_14736542428241291210300.png,http://od8rh27zr.bkt.clouddn.com/topic_14736542445721291210300.png,http://od8rh27zr.bkt.clouddn.com/topic_14736542463741291210300.png,http://od8rh27zr.bkt.clouddn.com/topic_14736542489851291210300.png,http://od8rh27zr.bkt.clouddn.com/topic_14736542513801291210300.png', '标签', '0', '1473654254', '10000012');
INSERT INTO `tb_topics` VALUES ('174', 'The only ', 'The first ', 'http://od8rh27zr.bkt.clouddn.com/topic_14736544211981291210300.png,http://od8rh27zr.bkt.clouddn.com/topic_14736544231651291210300.png', '标签', '0', '1473654426', '10000012');
INSERT INTO `tb_topics` VALUES ('175', '标题提要长常常常常常常常常吃成才才才才 长长长长长长长长长长长长长长长长长长长长长长长长长长长长长', '够长了啊', 'http://od8rh27zr.bkt.clouddn.com/topic_14736557152841291210300.png,http://od8rh27zr.bkt.clouddn.com/topic_14736557158411291210300.png', '标签', '1', '1473655717', '10000012');
INSERT INTO `tb_topics` VALUES ('176', '止盈止，我们的话可以理解为什么有人会有一个人生闷气，我们的话可以理解为什么有人会有一个人生闷气，我', '我们', null, '标签', '0', '1473661494', '10000012');
INSERT INTO `tb_topics` VALUES ('177', '你说啥，傻傻的', '阿斯顿看见复活节卡上的回复看见阿斯顿发话就快拉上地方哈卢萨卡绝代风华拉萨的饭卡结束地方哈说看见的浪费阿斯顿发生的佛教健身卡的回复', null, '标签', '1', '1473661796', '10000012');
INSERT INTO `tb_topics` VALUES ('178', '这个事压缩之后上传的图片', '试试效果', 'http://od8rh27zr.bkt.clouddn.com/topic_14736621803471291210300.png,http://od8rh27zr.bkt.clouddn.com/topic_14736621814171291210300.png,http://od8rh27zr.bkt.clouddn.com/topic_14736621826691291210300.png,http://od8rh27zr.bkt.clouddn.com/topic_14736621839471291210300.png,http://od8rh27zr.bkt.clouddn.com/topic_14736621850081291210300.png,http://od8rh27zr.bkt.clouddn.com/topic_14736621851791291210300.png', '标签', '2', '1473662185', '10000012');
INSERT INTO `tb_topics` VALUES ('179', '把少男少女你说你呢对不对宝宝的时候都不是你废话都好好的别随随便便说sjjsjdnnd！', '少男少女会打扮打扮打扮淑女你说你懂不懂', 'http://od8rh27zr.bkt.clouddn.com/topic_14736643656201291210300.png', '标签', '1', '1473664366', '10000012');
INSERT INTO `tb_topics` VALUES ('180', '我只是来测试一下', '啊这是什么意思', 'http://od8rh27zr.bkt.clouddn.com/topic_14736651733451291210300.png,http://od8rh27zr.bkt.clouddn.com/topic_14736651746251291210300.png,http://od8rh27zr.bkt.clouddn.com/topic_14736651756861291210300.png', '标签', '2', '1473665176', '10000029');
INSERT INTO `tb_topics` VALUES ('181', '不回家吃饭啦让', '', 'http://od8rh27zr.bkt.clouddn.com/topic_14741882637421291210300.png', '标签', '0', '1474188268', '10000029');
INSERT INTO `tb_topics` VALUES ('182', '都不想念那些将错就错解决的不对劲', '', 'http://od8rh27zr.bkt.clouddn.com/topic_14741883645251291210300.png', '标签', '0', '1474188376', '10000029');
INSERT INTO `tb_topics` VALUES ('183', '解决拍照后上传编辑后的图片', '试试', 'http://od8rh27zr.bkt.clouddn.com/topic_14741889669751291210300.png', '标签', '0', '1474188967', '10000012');
INSERT INTO `tb_topics` VALUES ('184', '长图长图长图', '', 'http://od8rh27zr.bkt.clouddn.com/topic_14741924202461291210300.png', '标签', '0', '1474192421', '10000012');
INSERT INTO `tb_topics` VALUES ('185', '我们一起吃饭', '', 'http://od8rh27zr.bkt.clouddn.com/topic_14741934852871291210300.png,http://od8rh27zr.bkt.clouddn.com/topic_14741934856741291210300.png,http://od8rh27zr.bkt.clouddn.com/topic_14741934861281291210300.png', '标签', '0', '1474193487', '10000012');
INSERT INTO `tb_topics` VALUES ('186', '测试长图的', '', 'http://od8rh27zr.bkt.clouddn.com/topic_14742700475671291210300.png', '标签', '0', '1474270049', '10000012');
INSERT INTO `tb_topics` VALUES ('187', '我们在这个', '你', 'http://od8rh27zr.bkt.clouddn.com/topic_14742789368431291210300.png,http://od8rh27zr.bkt.clouddn.com/topic_14742789372621291210300.png,http://od8rh27zr.bkt.clouddn.com/topic_14742789376151291210300.png,http://od8rh27zr.bkt.clouddn.com/topic_14742789380301291210300.png,http://od8rh27zr.bkt.clouddn.com/topic_14742789385731291210300.png,http://od8rh27zr.bkt.clouddn.com/topic_14742789387321291210300.png', '标签', '0', '1474278939', '10000012');

-- ----------------------------
-- Table structure for `tb_users`
-- ----------------------------
DROP TABLE IF EXISTS `tb_users`;
CREATE TABLE `tb_users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nickname` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `mobile` bigint(20) DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `truename` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `slogan` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `sex` int(1) DEFAULT NULL,
  `wechat` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `birthday` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `tags` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `certification` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `vocation` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `experience` int(11) DEFAULT NULL,
  `devicetoken` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `registertime` bigint(20) DEFAULT NULL,
  `registerlati` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `registerlong` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `appversion` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10000030 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of tb_users
-- ----------------------------
INSERT INTO `tb_users` VALUES ('10000000', '张1', '1000000', '123', 'sdfs', null, null, null, null, null, null, 'resources/avatars/avatar_23.jpg', null, null, '', null, null, null, null, null, null);
INSERT INTO `tb_users` VALUES ('10000001', '阿斯达', '1000001', '123', 'ssssssdf', null, null, null, null, null, null, 'upload/avatar/14707479600131291210300.jpg', null, null, '', null, null, null, null, null, null);
INSERT INTO `tb_users` VALUES ('10000002', '实施', '1000002', '123', 'string', 'string', '0', 'string', 'string', 'string', 'string', 'resources/avatars/avatar_20.jpg', 'string', 'string', '', '0', 'string', '1470670476', 'string', 'string', 'string');
INSERT INTO `tb_users` VALUES ('10000003', '水电费', '1000003', '123', 'string', 'string', '0', 'string', 'string', 'string', 'string', 'resources/avatars/avatar_23.jpg', '安全,大数据,区块链', 'string', '', '0', 'string', '1470670511', 'string', 'string', 'string');
INSERT INTO `tb_users` VALUES ('10000004', '一天', '1000004', '123', 'string', 'string', '0', 'string', 'string', 'string', 'string', 'resources/avatars/avatar_12.jpg', 'string', 'string', '', '0', 'string', '1470670534', 'string', 'string', 'string');
INSERT INTO `tb_users` VALUES ('10000005', '热VC', '1000005', '123', 'string', 'string', '0', 'string', 'string', 'string', 'string', 'resources/avatars/avatar_20.jpg', 'string', 'string', '', '0', 'string', '1470670535', 'string', 'string', 'string');
INSERT INTO `tb_users` VALUES ('10000006', '就让他', '10000006', '123', 'string', 'string', '0', 'string', 'string', 'string', 'string', 'string', '安全,大数据,区块链', '微软专家', '', '0', 'string', '0', 'string', 'string', 'string');
INSERT INTO `tb_users` VALUES ('10000007', 'AAA', '1000007', '123', '1、呵呵', 'string', '0', 'string', 'string', 'string', 'string', 'upload/avatar/14714172009991291210300.png', '区块链', 'CCNA、CCNP', '数据库专家', '7', 'string', '1470670536', 'string', 'string', 'string');
INSERT INTO `tb_users` VALUES ('10000008', '师德师风', '1000008', '123456', 'string', 'string', '0', 'string', 'string', 'string', 'string', 'resources/avatars/avatar_20.jpg', 'string', 'string', '', '0', 'string', '1470670536', 'string', 'string', 'string');
INSERT INTO `tb_users` VALUES ('10000009', '谁谁谁v', '1000009', '123', 'string', 'string', '0', 'string', 'string', 'string', 'string', 'resources/avatars/avatar_9.jpg', 'string', 'string', '', '0', 'string', '1470670536', 'string', 'string', 'string');
INSERT INTO `tb_users` VALUES ('10000010', 'u大概', '1000010', '123', 'string', 'string', '0', 'string', 'string', 'string', 'string', 'resources/avatars/avatar_4.jpg', 'string', 'string', '', '0', 'string', '1470670537', 'string', 'string', 'string');
INSERT INTO `tb_users` VALUES ('10000011', '东方国际', '1000011', '123', 'string', 'string', '0', 'string', 'string', 'string', 'string', 'resources/avatars/avatar_18.jpg', 'string', 'string', '', '0', 'string', '1470670537', 'string', 'string', 'string');
INSERT INTO `tb_users` VALUES ('10000012', '我是马云', '15300086234', '111111', 'string', 'string', '0', 'string', 'string', 'string', 'string', 'upload/avatar/14736536296271291210300.png', '区块链,DevOpt', '', '阿里巴巴创始人', '3', 'string', '1470746199', 'string', 'string', 'string');
INSERT INTO `tb_users` VALUES ('10000014', '嚓鱼', '13888888888', '111', null, null, null, null, null, null, null, 'upload/avatar/14718411933811291210300.png', '大数据,区块链,去IOE,DevOpt', null, '助理教练', '10', null, '1470974896', null, null, null);
INSERT INTO `tb_users` VALUES ('10000015', '未设置昵称', '13800000000', '111111', null, null, null, null, null, null, null, 'resources/avatars/avatar_25.jpg', '未设置', null, '', '1', null, '1470997461', null, null, null);
INSERT INTO `tb_users` VALUES ('10000016', '未设置昵称', '15300086123', '111111', null, null, null, null, null, null, null, 'resources/avatars/avatar_4.jpg', '未设置', null, '', '1', null, '1470997533', null, null, null);
INSERT INTO `tb_users` VALUES ('10000017', '未设置昵称', '15300086321', '123', null, null, null, null, null, null, null, 'resources/avatars/avatar_23.jpg', '未设置', null, '', '1', null, '1470997723', null, null, null);
INSERT INTO `tb_users` VALUES ('10000022', '未设置昵称', '15300086789', '123456', null, null, null, null, null, null, null, 'resources/avatars/avatar_26.jpg', '未设置', null, '', '1', null, '1471251048', null, null, null);
INSERT INTO `tb_users` VALUES ('10000023', '未设置昵称', '15300087777', '123', null, null, null, null, null, null, null, 'resources/avatars/avatar_4.jpg', '未设置', null, '', '1', null, '1471256039', null, null, null);
INSERT INTO `tb_users` VALUES ('10000024', '未设置昵称', '15300009872', '123', null, null, null, null, null, null, null, 'resources/avatars/avatar_4.jpg', '未设置', null, '', '1', null, '1471256761', null, null, null);
INSERT INTO `tb_users` VALUES ('10000025', '未设置昵称', '13788888888', '111', null, null, null, null, null, null, null, 'resources/avatars/avatar_6.jpg', '未设置', null, '', '1', null, '1471839390', null, null, null);
INSERT INTO `tb_users` VALUES ('10000026', '未设置昵称', '13785017990', '1', null, null, null, null, null, null, null, 'resources/avatars/avatar_6.jpg', '未设置', null, '', '1', null, '1471850513', null, null, null);
INSERT INTO `tb_users` VALUES ('10000027', '你好请问', '17710919923', '123456', '未设置', '未设置', null, '未设置', '未设置', '未设置', '未设置', 'resources/avatars/avatar_1.jpg', '未设置', '', '', '1', null, '1471850716', null, null, null);
INSERT INTO `tb_users` VALUES ('10000028', '未设置昵称', '15101186029', '123456', null, null, null, null, null, null, null, 'resources/avatars/avatar_23.jpg', '未设置', null, '', '1', null, '1471850784', null, null, null);
INSERT INTO `tb_users` VALUES ('10000029', '好人郝', '17310466497', '123456', null, null, null, null, null, null, null, 'upload/avatar/14736650924081291210300.png', '未设置', null, '', '3', null, '1471850979', null, null, null);

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
INSERT INTO `tb_versions` VALUES ('1', '222', '添加了某某功能', '0', 'https://itunes.apple.com/cn/app/yun-wei/id1100577123?mt=8', null, null);
