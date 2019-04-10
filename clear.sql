/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50642
 Source Host           : 127.0.0.1:3306
 Source Schema         : clear

 Target Server Type    : MySQL
 Target Server Version : 50642
 File Encoding         : 65001

 Date: 10/04/2019 12:28:34
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tb_admin_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_admin_user`;
CREATE TABLE `tb_admin_user` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL DEFAULT '' COMMENT '管理员用户名',
  `password` varchar(50) NOT NULL DEFAULT '' COMMENT '管理员密码',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态 1 启用 0 禁用',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `last_login_time` datetime DEFAULT NULL COMMENT '最后登录时间',
  `last_login_ip` varchar(20) DEFAULT NULL COMMENT '最后登录IP',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='管理员表';

-- ----------------------------
-- Records of tb_admin_user
-- ----------------------------
BEGIN;
INSERT INTO `tb_admin_user` VALUES (1, 'admin', '7b79e788e94c1c41b6d4e1b1280c4bdb', 1, '2016-10-18 15:28:37', '2019-04-08 16:58:08', '127.0.0.1');
INSERT INTO `tb_admin_user` VALUES (2, 'kefu', '', 1, '2019-03-29 13:51:59', '2019-03-29 14:17:11', '127.0.0.1');
INSERT INTO `tb_admin_user` VALUES (3, 'wuji', '10ee313c3b9feb74a480ca6a74271419', 1, '2019-03-29 17:48:56', '2019-03-29 22:39:23', '127.0.0.1');
COMMIT;

-- ----------------------------
-- Table structure for tb_article
-- ----------------------------
DROP TABLE IF EXISTS `tb_article`;
CREATE TABLE `tb_article` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文章ID',
  `cid` smallint(5) unsigned NOT NULL COMMENT '分类ID',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '标题',
  `introduction` varchar(255) DEFAULT '' COMMENT '简介',
  `content` longtext COMMENT '内容',
  `author` varchar(20) DEFAULT '' COMMENT '作者',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态 0 待审核  1 审核',
  `reading` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '阅读量',
  `thumb` varchar(255) DEFAULT '' COMMENT '缩略图',
  `photo` text COMMENT '图集',
  `is_top` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否置顶  0 不置顶  1 置顶',
  `is_recommend` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否推荐  0 不推荐  1 推荐',
  `is_hot` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否热门 0=>否 , 1=> 是',
  `sort` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `publish_time` datetime NOT NULL COMMENT '发布时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='文章表';

-- ----------------------------
-- Records of tb_article
-- ----------------------------
BEGIN;
INSERT INTO `tb_article` VALUES (1, 3, '测试文章一', '', '<p>测试内容</p>', 'admin', 1, 0, '', NULL, 0, 1, 1, 0, '2017-04-11 14:10:10', '2017-04-11 14:09:45');
INSERT INTO `tb_article` VALUES (2, 5, '机器入库支持单台和批量入库', '', '<div class=\"pro-question-txt\" style=\"margin: 0px; padding: 20px 0px; border: 0px; outline: 0px; color: rgb(75, 75, 75); font-family: \"Microsoft YaHei\"; font-size: 12px; white-space: normal; background-color: rgb(255, 255, 255);\"><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; outline: 0px; color: rgb(51, 51, 51); font-size: 14px; line-height: 32px;\"><span style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 16px; line-height: 2; color: rgb(229, 51, 51);\"><strong style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px;\">一、单台手动入库</strong></span></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; outline: 0px; color: rgb(51, 51, 51); font-size: 14px; line-height: 32px;\"><span style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 16px; line-height: 2;\">“机具管理——进货入库”，输入机器编号，选择对应的品牌然后点击“添加”按钮，可以添加多条信息以后再点击左上角的“保存”</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; outline: 0px; color: rgb(51, 51, 51); font-size: 14px; line-height: 32px;\"><img src=\"https://www.fenrunbao.cn/kindeditor/attached/image/20180815/20180815203512_5018.png\" width=\"700\" height=\"218\" alt=\"\"/></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; outline: 0px; color: rgb(51, 51, 51); font-size: 14px; line-height: 32px;\"><span style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 16px; line-height: 2; color: rgb(229, 51, 51);\"><strong style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px;\">二、批量入库</strong></span></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; outline: 0px; color: rgb(51, 51, 51); font-size: 14px; line-height: 32px;\"><span style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 16px; line-height: 2;\">“机具管理——批量入库”，在线下载批量入库模板，将要入库的机器序列号整理入该文档，选择对应的品牌，然后上传导入该文档批量一次性入库。</span><span style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 16px; line-height: 2;\"></span></p></div><p class=\"kefu-tip\" style=\"margin-top: 0px; margin-bottom: 20px; padding: 0px 0px 0px 33px; border: 0px; outline: 0px; height: 34px; line-height: 34px; background-image: url(\"../images/icon-help.png\"); background-repeat: no-repeat; background-position: 9px -116px; font-size: 14px; color: rgb(51, 51, 51); font-family: \"Microsoft YaHei\"; white-space: normal; background-color: rgb(255, 255, 255);\">如果没有解决您的问题，请立即<a href=\"http://wpa.qq.com/msgrd?v=3&uin=290325827&site=qq&menu=yes\" target=\"_blank\" style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; text-decoration-line: none; color: rgb(255, 120, 82);\">联系客服</a>！</p><p><br/></p>', 'admin', 1, 0, '', NULL, 0, 0, 1, 0, '2019-04-08 09:27:07', '2019-04-08 09:23:48');
INSERT INTO `tb_article` VALUES (3, 9, '分润宝激活返现数据上传格式说明', '', '<p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; outline: 0px; color: rgb(51, 51, 51); font-size: 14px; font-family: \"><span style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 16px; line-height: 2;\">手动上传激活返现报表，主要修改两个地方:</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; outline: 0px; color: rgb(51, 51, 51); font-size: 14px; font-family: \"><span style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 16px; line-height: 2; color: rgb(229, 51, 51);\"><strong style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px;\">一、将文件保存为97-2003格式Excel，并命名为\"dd\";</strong></span></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; outline: 0px; color: rgb(51, 51, 51); font-size: 14px; font-family: \"><img src=\"https://www.fenrunbao.cn/kindeditor/attached/image/20180715/20180715110247_2925.jpg\" alt=\"\"/><span style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 16px; line-height: 2;\"></span></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; outline: 0px; color: rgb(51, 51, 51); font-size: 14px; font-family: \"><span style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 16px; line-height: 2; color: rgb(229, 51, 51);\"><strong style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px;\">2、将excel里面的工作簿名字改为“dd”</strong></span></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; outline: 0px; color: rgb(51, 51, 51); font-size: 14px; font-family: \"><img src=\"https://www.fenrunbao.cn/kindeditor/attached/image/20180715/20180715110520_5903.jpg\" alt=\"\"/></p><p><br/></p>', 'admin', 1, 0, '', NULL, 0, 0, 1, 0, '2019-04-08 09:38:06', '2019-04-08 09:37:49');
INSERT INTO `tb_article` VALUES (8, 6, '如何复制分享视频代码发布到分润宝手机端', '一、从通付官方后台下载商户信息数据； 二、将文档里面的工作表名称重命名为“dd”； 三、文档另存为97-2003版本格式为xls； 最后通过分润宝后台数据上传模块将数据上传并等待系统导入。', '<p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; outline: 0px; color: rgb(63, 63, 63); font-family: \"><span style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 16px; line-height: 2;\">1、在第三方视频网站找到需要分享的视频；</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; outline: 0px; color: rgb(63, 63, 63); font-family: \"><span style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 16px; line-height: 2;\">2、进入视频播放页面，从左下角的分享代码里面“复制分享通用代码”；</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; outline: 0px; color: rgb(63, 63, 63); font-family: \"><span style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 16px; line-height: 2;\">3、进入分润宝系统后台，将代码粘贴到编辑器代码里面；</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; outline: 0px; color: rgb(63, 63, 63);\"><span style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 16px; line-height: 2;\">4、加上自适应的代码设置：width=\"100%\"和height=\"100%\"</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; outline: 0px; color: rgb(63, 63, 63);\"><span style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 16px; line-height: 2;\"><iframe frameborder=\"0\" src=\"https://v.qq.com/txp/iframe/player.html?vid=x0567fh08an\" allowFullScreen=\"true\" width=\"100%\" height=\"500px\"></iframe></span></p>', 'admin', 1, 0, '', NULL, 0, 0, 0, 0, '2019-04-08 23:33:19', '2019-04-08 23:23:40');
INSERT INTO `tb_article` VALUES (4, 5, '机器已经入库为什么分润系统里面库存查询没数据', '', '<p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; outline: 0px; color: rgb(51, 51, 51); font-size: 14px; font-family: \"Microsoft YaHei\"; line-height: 32px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 16px; line-height: 2;\">机器入库分两种方式：</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; outline: 0px; color: rgb(51, 51, 51); font-size: 14px; font-family: \"Microsoft YaHei\"; line-height: 32px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 16px; line-height: 2; color: rgb(229, 51, 51);\"><strong style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px;\">一、手动输入机器编号批量入库，如下图所示输入完编号后点击“添加”，添加成功后点击左上角的“保存”按钮</strong></span></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; outline: 0px; color: rgb(51, 51, 51); font-size: 14px; font-family: \"Microsoft YaHei\"; line-height: 32px; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"https://www.fenrunbao.cn/kindeditor/attached/image/20171016/20171016135607_3624.png\" width=\"700\" height=\"408\" alt=\"\"/></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; outline: 0px; color: rgb(51, 51, 51); font-size: 14px; font-family: \"Microsoft YaHei\"; line-height: 32px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 16px; line-height: 2; color: rgb(229, 51, 51);\"><strong style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px;\">二、上传文档批量入库</strong></span></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; outline: 0px; color: rgb(51, 51, 51); font-size: 14px; font-family: \"Microsoft YaHei\"; line-height: 32px; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"https://www.fenrunbao.cn/kindeditor/attached/image/20171016/20171016135828_6198.jpg\" width=\"700\" height=\"426\" alt=\"\"/></p><p><br/></p>', 'admin', 1, 0, '', NULL, 0, 0, 1, 0, '2019-04-08 09:38:36', '2019-04-08 09:38:10');
INSERT INTO `tb_article` VALUES (5, 8, '星支付激活返现数据导入格式修改', '', '<p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; outline: 0px; color: rgb(51, 51, 51); font-size: 14px; font-family: \"Microsoft YaHei\"; line-height: 32px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 16px; line-height: 2;\"><strong style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px;\">一、从星支付官方后台下载激活返现激活报表；</strong></span></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; outline: 0px; color: rgb(51, 51, 51); font-size: 14px; font-family: \"Microsoft YaHei\"; line-height: 32px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 16px; line-height: 2;\"><strong style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px;\">二、将报表里面的工作表名字改为 dd</strong></span></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; outline: 0px; color: rgb(51, 51, 51); font-size: 14px; font-family: \"Microsoft YaHei\"; line-height: 32px; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"https://www.fenrunbao.cn/kindeditor/attached/image/20180820/20180820230843_5565.jpg\" alt=\"\"/></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; outline: 0px; color: rgb(51, 51, 51); font-size: 14px; font-family: \"Microsoft YaHei\"; line-height: 32px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 16px; line-height: 2;\"><strong style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px;\">三、</strong></span><span style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 16px; line-height: 2;\"><strong style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px;\">将报表另存为&nbsp;</strong></span><span style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 16px; line-height: 2;\"><strong style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px;\">dd.xls</strong></span></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; outline: 0px; color: rgb(51, 51, 51); font-size: 14px; font-family: \"Microsoft YaHei\"; line-height: 32px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px;\"><img src=\"https://www.fenrunbao.cn/kindeditor/attached/image/20180820/20180820230924_4728.jpg\" alt=\"\"/><span style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 16px; line-height: 2;\"></span></span></p><div><span style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px;\"><br/></span></div><p><br/></p>', 'admin', 1, 0, '', NULL, 0, 0, 1, 0, '2019-04-08 09:40:47', '2019-04-08 09:38:37');
INSERT INTO `tb_article` VALUES (6, 9, 'C#POST请求自定义body内容传输', '', '<p><span style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; color: rgb(75, 75, 75); font-family: \"Microsoft YaHei\"; background-color: rgb(255, 255, 255); line-height: 2;\">public static string SendMsg_Rpt(string body,string url)</span><br/><span style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; color: rgb(75, 75, 75); font-family: \"Microsoft YaHei\"; background-color: rgb(255, 255, 255); line-height: 2;\">&nbsp; &nbsp; {</span><br/><span style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; color: rgb(75, 75, 75); font-family: \"Microsoft YaHei\"; background-color: rgb(255, 255, 255); line-height: 2;\">&nbsp; &nbsp; &nbsp; &nbsp; string formUrl = url;</span><br/><span style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; color: rgb(75, 75, 75); font-family: \"Microsoft YaHei\"; background-color: rgb(255, 255, 255); line-height: 2;\">&nbsp; &nbsp; &nbsp; &nbsp; //注意提交的编码 这边是需要改变的 这边默认的是Default：系统当前编码</span><br/><span style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; color: rgb(75, 75, 75); font-family: \"Microsoft YaHei\"; background-color: rgb(255, 255, 255); line-height: 2;\">&nbsp; &nbsp; &nbsp; &nbsp; byte[] postData = System.Text.Encoding.UTF8.GetBytes(formUrl);</span><br/><span style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; color: rgb(75, 75, 75); font-family: \"Microsoft YaHei\"; background-color: rgb(255, 255, 255); line-height: 2;\">&nbsp; &nbsp; &nbsp; &nbsp; byte[] postData2 = System.Text.Encoding.UTF8.GetBytes(body);</span><br/><span style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; color: rgb(75, 75, 75); font-family: \"Microsoft YaHei\"; background-color: rgb(255, 255, 255); line-height: 2;\">&nbsp; &nbsp; &nbsp; &nbsp; // 设置提交的相关参数&nbsp;</span><br/><span style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; color: rgb(75, 75, 75); font-family: \"Microsoft YaHei\"; background-color: rgb(255, 255, 255); line-height: 2;\">&nbsp; &nbsp; &nbsp; &nbsp; System.Net.HttpWebRequest request = System.Net.WebRequest.Create(formUrl) as System.Net.HttpWebRequest;</span><br/><span style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; color: rgb(75, 75, 75); font-family: \"Microsoft YaHei\"; background-color: rgb(255, 255, 255); line-height: 2;\">&nbsp; &nbsp; &nbsp; &nbsp; System.Text.Encoding myEncoding = System.Text.Encoding.UTF8;</span><br/><span style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; color: rgb(75, 75, 75); font-family: \"Microsoft YaHei\"; background-color: rgb(255, 255, 255); line-height: 2;\">&nbsp; &nbsp; &nbsp; &nbsp; request.Method = \"POST\";</span><br/><span style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; color: rgb(75, 75, 75); font-family: \"Microsoft YaHei\"; background-color: rgb(255, 255, 255); line-height: 2;\">&nbsp; &nbsp; &nbsp; &nbsp; request.KeepAlive = false;</span><br/><span style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; color: rgb(75, 75, 75); font-family: \"Microsoft YaHei\"; background-color: rgb(255, 255, 255); line-height: 2;\">&nbsp; &nbsp; &nbsp; &nbsp; request.AllowAutoRedirect = true;</span><br/><span style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; color: rgb(75, 75, 75); font-family: \"Microsoft YaHei\"; font-size: 12px; background-color: rgb(255, 255, 255);\"></span><span style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; color: rgb(75, 75, 75); font-family: \"Microsoft YaHei\"; background-color: rgb(255, 255, 255); line-height: 2;\">request.Headers.Add(\"api-key\", \"avPmtgL1GbFh7KTE4LxlsFoAKcY=\");</span><br/><span style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; color: rgb(75, 75, 75); font-family: \"Microsoft YaHei\"; background-color: rgb(255, 255, 255); line-height: 2;\">&nbsp; &nbsp; &nbsp; &nbsp; request.ContentType = \"application/x-www-form-urlencoded\";</span><br/><span style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; color: rgb(75, 75, 75); font-family: \"Microsoft YaHei\"; background-color: rgb(255, 255, 255); line-height: 2;\">&nbsp; &nbsp; &nbsp; &nbsp; request.UserAgent = \"Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1; .NET CLR 2.0.50727; .NET CLR&nbsp; 3.0.04506.648; .NET CLR 3.5.21022; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729)\";</span><br/><span style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; color: rgb(75, 75, 75); font-family: \"Microsoft YaHei\"; background-color: rgb(255, 255, 255); line-height: 2;\">&nbsp; &nbsp; &nbsp; &nbsp; request.ContentLength = postData.Length;</span><br/><br/><span style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; color: rgb(75, 75, 75); font-family: \"Microsoft YaHei\"; background-color: rgb(255, 255, 255); line-height: 2;\">&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<span style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; color: rgb(229, 51, 51);\"><strong style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px;\">Stream outstream = null;</strong></span></span><br/></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; outline: 0px; color: rgb(51, 51, 51); font-size: 14px; font-family: \"Microsoft YaHei\"; line-height: 32px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 16px; line-height: 2; color: rgb(229, 51, 51);\"><strong style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px;\">&nbsp; &nbsp; &nbsp; &nbsp; outstream = request.GetRequestStream();</strong></span></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; outline: 0px; color: rgb(51, 51, 51); font-size: 14px; font-family: \"Microsoft YaHei\"; line-height: 32px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 16px;\"><span style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; color: rgb(229, 51, 51);\"><strong style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px;\">//</strong></span><span style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; color: rgb(229, 51, 51);\"><strong style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px;\">自定义body内容</strong></span><span style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; color: rgb(229, 51, 51);\"><strong style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px;\"></strong></span><span style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; color: rgb(229, 51, 51);\"><strong style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px;\">postData2</strong></span><span style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; color: rgb(229, 51, 51);\"><strong style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px;\"></strong></span></span></p><p><span style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; font-family: \"Microsoft YaHei\"; background-color: rgb(255, 255, 255); line-height: 2; color: rgb(229, 51, 51);\"><strong style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px;\">&nbsp; &nbsp; &nbsp; &nbsp; outstream.Write(postData2, 0, postData2.Length);</strong></span><br/><br/><span style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; color: rgb(75, 75, 75); font-family: \"Microsoft YaHei\"; background-color: rgb(255, 255, 255); line-height: 2;\">&nbsp; &nbsp; &nbsp; &nbsp; // 提交请求数据&nbsp;</span><br/><span style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; color: rgb(75, 75, 75); font-family: \"Microsoft YaHei\"; background-color: rgb(255, 255, 255); line-height: 2;\">&nbsp; &nbsp; &nbsp; &nbsp; System.IO.Stream outputStream = request.GetRequestStream();</span><br/><span style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; color: rgb(75, 75, 75); font-family: \"Microsoft YaHei\"; background-color: rgb(255, 255, 255); line-height: 2;\">&nbsp; &nbsp; &nbsp; &nbsp; outputStream.Write(postData, 0, postData.Length);</span><br/><span style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; color: rgb(75, 75, 75); font-family: \"Microsoft YaHei\"; background-color: rgb(255, 255, 255); line-height: 2;\">&nbsp; &nbsp; &nbsp; &nbsp; outputStream.Close();</span><br/><br/><span style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; color: rgb(75, 75, 75); font-family: \"Microsoft YaHei\"; background-color: rgb(255, 255, 255); line-height: 2;\">&nbsp; &nbsp; &nbsp; &nbsp; System.Net.HttpWebResponse response;</span><br/><span style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; color: rgb(75, 75, 75); font-family: \"Microsoft YaHei\"; background-color: rgb(255, 255, 255); line-height: 2;\">&nbsp; &nbsp; &nbsp; &nbsp; System.IO.Stream responseStream;</span><br/><span style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; color: rgb(75, 75, 75); font-family: \"Microsoft YaHei\"; background-color: rgb(255, 255, 255); line-height: 2;\">&nbsp; &nbsp; &nbsp; &nbsp; System.IO.StreamReader reader;</span><br/><span style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; color: rgb(75, 75, 75); font-family: \"Microsoft YaHei\"; background-color: rgb(255, 255, 255); line-height: 2;\">&nbsp; &nbsp; &nbsp; &nbsp; string srcString;</span><br/><span style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; color: rgb(75, 75, 75); font-family: \"Microsoft YaHei\"; background-color: rgb(255, 255, 255); line-height: 2;\">&nbsp; &nbsp; &nbsp; &nbsp; response = request.GetResponse() as System.Net.HttpWebResponse;</span><br/><span style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; color: rgb(75, 75, 75); font-family: \"Microsoft YaHei\"; background-color: rgb(255, 255, 255); line-height: 2;\">&nbsp; &nbsp; &nbsp; &nbsp; responseStream = response.GetResponseStream();</span><br/><span style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; color: rgb(75, 75, 75); font-family: \"Microsoft YaHei\"; background-color: rgb(255, 255, 255); line-height: 2;\">&nbsp; &nbsp; &nbsp; &nbsp; reader = new System.IO.StreamReader(responseStream, System.Text.Encoding.GetEncoding(\"UTF-8\"));</span><br/><span style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; color: rgb(75, 75, 75); font-family: \"Microsoft YaHei\"; background-color: rgb(255, 255, 255); line-height: 2;\">&nbsp; &nbsp; &nbsp; &nbsp; srcString = reader.ReadToEnd();</span><br/><span style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; color: rgb(75, 75, 75); font-family: \"Microsoft YaHei\"; background-color: rgb(255, 255, 255); line-height: 2;\">&nbsp; &nbsp; &nbsp; &nbsp; string result = srcString;&nbsp; &nbsp;//返回值赋值</span><br/><span style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; color: rgb(75, 75, 75); font-family: \"Microsoft YaHei\"; background-color: rgb(255, 255, 255); line-height: 2;\">&nbsp; &nbsp; &nbsp; &nbsp; reader.Close();</span><br/><span style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; color: rgb(75, 75, 75); font-family: \"Microsoft YaHei\"; background-color: rgb(255, 255, 255); line-height: 2;\">&nbsp; &nbsp; &nbsp; &nbsp; return result;</span><br/><span style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; color: rgb(75, 75, 75); font-family: \"Microsoft YaHei\"; background-color: rgb(255, 255, 255); line-height: 2;\">&nbsp; &nbsp; }</span></p><p><br/></p>', 'admin', 1, 0, '', NULL, 0, 0, 1, 0, '2019-04-08 09:41:33', '2019-04-08 09:41:15');
INSERT INTO `tb_article` VALUES (7, 3, '新会员注册短信验证码与默认等级设置', '', '<p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; outline: 0px; color: rgb(51, 51, 51); font-size: 14px; font-family: \"><span style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 16px; line-height: 2;\">1、为了方便用户控制是否启用会员注册手机短信动态码验证，分润宝后台增加了注册短信验证开关设置。</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; outline: 0px; color: rgb(51, 51, 51); font-size: 14px; font-family: \"><span style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 16px; line-height: 2;\">默认为“开启”，系统只有在开启的状态下新会员注册才需要填写正确的短信动态验证码。</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; outline: 0px; color: rgb(51, 51, 51); font-size: 14px; font-family: \"><span style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 16px; line-height: 2;\">“关闭”状态下，会员注册无需填写动态验证码。</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; outline: 0px; color: rgb(51, 51, 51); font-size: 14px; font-family: \"><span style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 16px; line-height: 2;\"><img src=\"https://www.fenrunbao.cn/kindeditor/attached/image/20180719/20180719213138_9600.jpg\" alt=\"\"/><br/></span></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; outline: 0px; color: rgb(51, 51, 51); font-size: 14px; font-family: \"><span style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 16px; line-height: 2;\">2、为了方便推广开展活动，增加了新会员注册“默认等级“设置，管理员可以在固定时间内开放新用户注册默认为指定级别会员。</span></p><p><br/></p>', 'admin', 1, 0, '', NULL, 0, 0, 1, 0, '2019-04-08 09:42:14', '2019-04-08 09:41:54');
INSERT INTO `tb_article` VALUES (10, 1, '代理商分润系统支持哪些品牌？', '', '<p>分润宝分润系统是为POS代理商量身制作的分润管理系统，支持市面上95%以上的支付公司系列产品的分润数据对接。交易数据实时对接，代理商自由定义下级不同品牌的结算价和分润比例，分润提现实时到账。</p>', 'admin', 1, 0, '', NULL, 0, 1, 0, 0, '2019-04-09 15:50:25', '2019-04-09 15:50:01');
INSERT INTO `tb_article` VALUES (11, 6, '如何复制分享视频代码发布到分润宝手机端', '一、从通付官方后台下载商户信息数据； 二、将文档里面的工作表名称重命名为“dd”； 三、文档另存为97-2003版本格式为xls； 最后通过分润宝后台数据上传模块将数据上传并等待系统导入。', '<p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; outline: 0px; color: rgb(63, 63, 63); font-family: \"Microsoft YaHei\"; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 16px; line-height: 2;\">1、在第三方视频网站找到需要分享的视频；</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; outline: 0px; color: rgb(63, 63, 63); font-family: \"Microsoft YaHei\"; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 16px; line-height: 2;\">2、进入视频播放页面，从左下角的分享代码里面“复制分享通用代码”；</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; outline: 0px; color: rgb(63, 63, 63); font-family: \"Microsoft YaHei\"; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 16px; line-height: 2;\">3、进入分润宝系统后台，将代码粘贴到编辑器代码里面；</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; outline: 0px; color: rgb(63, 63, 63); font-family: \"Microsoft YaHei\"; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 16px; line-height: 2;\">4、加上自适应的代码设置：width=\"100%\"和height=\"100%\"</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; outline: 0px; color: rgb(63, 63, 63); font-family: \"Microsoft YaHei\"; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 16px; line-height: 2;\"><iframe frameborder=\"0\" src=\"https://v.qq.com/txp/iframe/player.html?vid=x0567fh08an\" width=\"100%\" height=\"500px\"></iframe></span></p><p><br/></p>', 'admin', 1, 0, '', NULL, 0, 0, 0, 0, '2019-04-09 17:17:26', '2019-04-09 17:16:46');
COMMIT;

-- ----------------------------
-- Table structure for tb_auth_group
-- ----------------------------
DROP TABLE IF EXISTS `tb_auth_group`;
CREATE TABLE `tb_auth_group` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `title` char(100) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `rules` varchar(255) NOT NULL DEFAULT '' COMMENT '权限规则ID',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='权限组表';

-- ----------------------------
-- Records of tb_auth_group
-- ----------------------------
BEGIN;
INSERT INTO `tb_auth_group` VALUES (1, '超级管理组', 1, '1,2,3,73,74,5,6,7,8,9,10,11,12,39,40,41,42,43,14,13,20,21,22,23,24,15,25,26,27,28,29,30,16,17,44,45,46,47,48,18,49,50,51,52,53,19,31,32,33,34,35,36,37,54,55,58,59,60,61,62,56,63,64,65,66,67,57,68,69,70,71,72');
INSERT INTO `tb_auth_group` VALUES (2, '客服', 1, '1,2,3,73,74');
COMMIT;

-- ----------------------------
-- Table structure for tb_auth_group_access
-- ----------------------------
DROP TABLE IF EXISTS `tb_auth_group_access`;
CREATE TABLE `tb_auth_group_access` (
  `uid` mediumint(8) unsigned NOT NULL,
  `group_id` mediumint(8) unsigned NOT NULL,
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='权限组规则表';

-- ----------------------------
-- Records of tb_auth_group_access
-- ----------------------------
BEGIN;
INSERT INTO `tb_auth_group_access` VALUES (1, 1);
INSERT INTO `tb_auth_group_access` VALUES (2, 1);
INSERT INTO `tb_auth_group_access` VALUES (3, 2);
COMMIT;

-- ----------------------------
-- Table structure for tb_auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `tb_auth_rule`;
CREATE TABLE `tb_auth_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL DEFAULT '' COMMENT '规则名称',
  `title` varchar(20) NOT NULL,
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `pid` smallint(5) unsigned NOT NULL COMMENT '父级ID',
  `icon` varchar(50) DEFAULT '' COMMENT '图标',
  `sort` tinyint(4) unsigned NOT NULL COMMENT '排序',
  `condition` char(100) DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=82 DEFAULT CHARSET=utf8 COMMENT='规则表';

-- ----------------------------
-- Records of tb_auth_rule
-- ----------------------------
BEGIN;
INSERT INTO `tb_auth_rule` VALUES (1, 'admin/System/default', '系统配置', 1, 1, 0, 'fa fa-gears', 0, '');
INSERT INTO `tb_auth_rule` VALUES (2, 'admin/System/siteConfig', '站点配置', 1, 1, 1, '', 0, '');
INSERT INTO `tb_auth_rule` VALUES (3, 'admin/System/updateSiteConfig', '更新配置', 1, 0, 1, '', 0, '');
INSERT INTO `tb_auth_rule` VALUES (5, 'admin/Menu/default', '菜单管理', 1, 1, 0, 'fa fa-bars', 0, '');
INSERT INTO `tb_auth_rule` VALUES (6, 'admin/Menu/index', '后台菜单', 1, 1, 5, '', 0, '');
INSERT INTO `tb_auth_rule` VALUES (7, 'admin/Menu/add', '添加菜单', 1, 0, 6, '', 0, '');
INSERT INTO `tb_auth_rule` VALUES (8, 'admin/Menu/save', '保存菜单', 1, 0, 6, '', 0, '');
INSERT INTO `tb_auth_rule` VALUES (9, 'admin/Menu/edit', '编辑菜单', 1, 0, 6, '', 0, '');
INSERT INTO `tb_auth_rule` VALUES (10, 'admin/Menu/update', '更新菜单', 1, 0, 6, '', 0, '');
INSERT INTO `tb_auth_rule` VALUES (11, 'admin/Menu/delete', '删除菜单', 1, 0, 6, '', 0, '');
INSERT INTO `tb_auth_rule` VALUES (12, 'admin/Nav/index', '导航管理', 1, 1, 5, '', 0, '');
INSERT INTO `tb_auth_rule` VALUES (13, 'admin/Category/index', '栏目管理', 1, 1, 14, 'fa fa-sitemap', 0, '');
INSERT INTO `tb_auth_rule` VALUES (14, 'admin/Content/default', '内容管理', 1, 1, 0, 'fa fa-file-text', 0, '');
INSERT INTO `tb_auth_rule` VALUES (15, 'admin/Article/index', '文章管理', 1, 1, 14, '', 0, '');
INSERT INTO `tb_auth_rule` VALUES (16, 'admin/User/default', '用户管理', 1, 1, 0, 'fa fa-users', 0, '');
INSERT INTO `tb_auth_rule` VALUES (17, 'admin/User/index', '普通用户', 1, 1, 16, '', 0, '');
INSERT INTO `tb_auth_rule` VALUES (18, 'admin/AdminUser/index', '管理员', 1, 1, 16, '', 0, '');
INSERT INTO `tb_auth_rule` VALUES (19, 'admin/AuthGroup/index', '权限组', 1, 1, 16, '', 0, '');
INSERT INTO `tb_auth_rule` VALUES (20, 'admin/Category/add', '添加栏目', 1, 0, 13, '', 0, '');
INSERT INTO `tb_auth_rule` VALUES (21, 'admin/Category/save', '保存栏目', 1, 0, 13, '', 0, '');
INSERT INTO `tb_auth_rule` VALUES (22, 'admin/Category/edit', '编辑栏目', 1, 0, 13, '', 0, '');
INSERT INTO `tb_auth_rule` VALUES (23, 'admin/Category/update', '更新栏目', 1, 0, 13, '', 0, '');
INSERT INTO `tb_auth_rule` VALUES (24, 'admin/Category/delete', '删除栏目', 1, 0, 13, '', 0, '');
INSERT INTO `tb_auth_rule` VALUES (25, 'admin/Article/add', '添加文章', 1, 0, 15, '', 0, '');
INSERT INTO `tb_auth_rule` VALUES (26, 'admin/Article/save', '保存文章', 1, 0, 15, '', 0, '');
INSERT INTO `tb_auth_rule` VALUES (27, 'admin/Article/edit', '编辑文章', 1, 0, 15, '', 0, '');
INSERT INTO `tb_auth_rule` VALUES (28, 'admin/Article/update', '更新文章', 1, 0, 15, '', 0, '');
INSERT INTO `tb_auth_rule` VALUES (29, 'admin/Article/delete', '删除文章', 1, 0, 15, '', 0, '');
INSERT INTO `tb_auth_rule` VALUES (30, 'admin/Article/toggle', '文章审核', 1, 0, 15, '', 0, '');
INSERT INTO `tb_auth_rule` VALUES (31, 'admin/AuthGroup/add', '添加权限组', 1, 0, 19, '', 0, '');
INSERT INTO `tb_auth_rule` VALUES (32, 'admin/AuthGroup/save', '保存权限组', 1, 0, 19, '', 0, '');
INSERT INTO `tb_auth_rule` VALUES (33, 'admin/AuthGroup/edit', '编辑权限组', 1, 0, 19, '', 0, '');
INSERT INTO `tb_auth_rule` VALUES (34, 'admin/AuthGroup/update', '更新权限组', 1, 0, 19, '', 0, '');
INSERT INTO `tb_auth_rule` VALUES (35, 'admin/AuthGroup/delete', '删除权限组', 1, 0, 19, '', 0, '');
INSERT INTO `tb_auth_rule` VALUES (36, 'admin/AuthGroup/auth', '授权', 1, 0, 19, '', 0, '');
INSERT INTO `tb_auth_rule` VALUES (37, 'admin/AuthGroup/updateAuthGroupRule', '更新权限组规则', 1, 0, 19, '', 0, '');
INSERT INTO `tb_auth_rule` VALUES (39, 'admin/Nav/add', '添加导航', 1, 0, 12, '', 0, '');
INSERT INTO `tb_auth_rule` VALUES (40, 'admin/Nav/save', '保存导航', 1, 0, 12, '', 0, '');
INSERT INTO `tb_auth_rule` VALUES (41, 'admin/Nav/edit', '编辑导航', 1, 0, 12, '', 0, '');
INSERT INTO `tb_auth_rule` VALUES (42, 'admin/Nav/update', '更新导航', 1, 0, 12, '', 0, '');
INSERT INTO `tb_auth_rule` VALUES (43, 'admin/Nav/delete', '删除导航', 1, 0, 12, '', 0, '');
INSERT INTO `tb_auth_rule` VALUES (44, 'admin/User/add', '添加用户', 1, 0, 17, '', 0, '');
INSERT INTO `tb_auth_rule` VALUES (45, 'admin/User/save', '保存用户', 1, 0, 17, '', 0, '');
INSERT INTO `tb_auth_rule` VALUES (46, 'admin/User/edit', '编辑用户', 1, 0, 17, '', 0, '');
INSERT INTO `tb_auth_rule` VALUES (47, 'admin/User/update', '更新用户', 1, 0, 17, '', 0, '');
INSERT INTO `tb_auth_rule` VALUES (48, 'admin/User/delete', '删除用户', 1, 0, 17, '', 0, '');
INSERT INTO `tb_auth_rule` VALUES (49, 'admin/AdminUser/add', '添加管理员', 1, 0, 18, '', 0, '');
INSERT INTO `tb_auth_rule` VALUES (50, 'admin/AdminUser/save', '保存管理员', 1, 0, 18, '', 0, '');
INSERT INTO `tb_auth_rule` VALUES (51, 'admin/AdminUser/edit', '编辑管理员', 1, 0, 18, '', 0, '');
INSERT INTO `tb_auth_rule` VALUES (52, 'admin/AdminUser/update', '更新管理员', 1, 0, 18, '', 0, '');
INSERT INTO `tb_auth_rule` VALUES (53, 'admin/AdminUser/delete', '删除管理员', 1, 0, 18, '', 0, '');
INSERT INTO `tb_auth_rule` VALUES (54, 'admin/Slide/default', '扩展管理', 1, 1, 0, 'fa fa-wrench', 0, '');
INSERT INTO `tb_auth_rule` VALUES (55, 'admin/SlideCategory/index', '轮播分类', 1, 1, 54, '', 0, '');
INSERT INTO `tb_auth_rule` VALUES (56, 'admin/Slide/index', '轮播图管理', 1, 1, 54, '', 0, '');
INSERT INTO `tb_auth_rule` VALUES (57, 'admin/Link/index', '友情链接', 1, 1, 54, 'fa fa-link', 0, '');
INSERT INTO `tb_auth_rule` VALUES (58, 'admin/SlideCategory/add', '添加分类', 1, 0, 55, '', 0, '');
INSERT INTO `tb_auth_rule` VALUES (59, 'admin/SlideCategory/save', '保存分类', 1, 0, 55, '', 0, '');
INSERT INTO `tb_auth_rule` VALUES (60, 'admin/SlideCategory/edit', '编辑分类', 1, 0, 55, '', 0, '');
INSERT INTO `tb_auth_rule` VALUES (61, 'admin/SlideCategory/update', '更新分类', 1, 0, 55, '', 0, '');
INSERT INTO `tb_auth_rule` VALUES (62, 'admin/SlideCategory/delete', '删除分类', 1, 0, 55, '', 0, '');
INSERT INTO `tb_auth_rule` VALUES (63, 'admin/Slide/add', '添加轮播', 1, 0, 56, '', 0, '');
INSERT INTO `tb_auth_rule` VALUES (64, 'admin/Slide/save', '保存轮播', 1, 0, 56, '', 0, '');
INSERT INTO `tb_auth_rule` VALUES (65, 'admin/Slide/edit', '编辑轮播', 1, 0, 56, '', 0, '');
INSERT INTO `tb_auth_rule` VALUES (66, 'admin/Slide/update', '更新轮播', 1, 0, 56, '', 0, '');
INSERT INTO `tb_auth_rule` VALUES (67, 'admin/Slide/delete', '删除轮播', 1, 0, 56, '', 0, '');
INSERT INTO `tb_auth_rule` VALUES (68, 'admin/Link/add', '添加链接', 1, 0, 57, '', 0, '');
INSERT INTO `tb_auth_rule` VALUES (69, 'admin/Link/save', '保存链接', 1, 0, 57, '', 0, '');
INSERT INTO `tb_auth_rule` VALUES (70, 'admin/Link/edit', '编辑链接', 1, 0, 57, '', 0, '');
INSERT INTO `tb_auth_rule` VALUES (71, 'admin/Link/update', '更新链接', 1, 0, 57, '', 0, '');
INSERT INTO `tb_auth_rule` VALUES (72, 'admin/Link/delete', '删除链接', 1, 0, 57, '', 0, '');
INSERT INTO `tb_auth_rule` VALUES (73, 'admin/ChangePassword/index', '修改密码', 1, 1, 1, '', 0, '');
INSERT INTO `tb_auth_rule` VALUES (74, 'admin/ChangePassword/updatePassword', '更新密码', 1, 0, 1, '', 0, '');
INSERT INTO `tb_auth_rule` VALUES (75, 'admin/product/default', '产品管理', 1, 1, 0, 'fa fa-home', 0, '');
INSERT INTO `tb_auth_rule` VALUES (76, 'admin/product/index', '产品列表', 1, 1, 75, '', 1, '');
INSERT INTO `tb_auth_rule` VALUES (77, 'admin/product/delete', '删除产品', 1, 0, 76, '', 0, '');
INSERT INTO `tb_auth_rule` VALUES (78, 'admin/product/add', '添加产品', 1, 0, 76, '', 0, '');
INSERT INTO `tb_auth_rule` VALUES (79, 'admin/product/save', '保存产品', 1, 0, 76, '', 0, '');
INSERT INTO `tb_auth_rule` VALUES (80, 'admin/product/edit', '编辑产品', 1, 0, 76, '', 0, '');
INSERT INTO `tb_auth_rule` VALUES (81, 'admin/product/update', '更新产品', 1, 0, 76, '', 0, '');
COMMIT;

-- ----------------------------
-- Table structure for tb_category
-- ----------------------------
DROP TABLE IF EXISTS `tb_category`;
CREATE TABLE `tb_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `name` varchar(50) NOT NULL COMMENT '分类名称',
  `alias` varchar(50) DEFAULT '' COMMENT '导航别名',
  `content` longtext COMMENT '分类内容',
  `thumb` varchar(255) DEFAULT '' COMMENT '缩略图',
  `icon` varchar(20) DEFAULT '' COMMENT '分类图标',
  `list_template` varchar(50) DEFAULT '' COMMENT '分类列表模板',
  `detail_template` varchar(50) DEFAULT '' COMMENT '分类详情模板',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '分类类型  1  列表  2 单页',
  `sort` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID',
  `path` varchar(255) DEFAULT '' COMMENT '路径',
  `create_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COMMENT='分类表';

-- ----------------------------
-- Records of tb_category
-- ----------------------------
BEGIN;
INSERT INTO `tb_category` VALUES (1, '常见问题', '', '', '/public/uploads/20190404/b14af2d5db360b5f9fa9f2385c35bdec.png', '', '', '', 1, 0, 0, '0,', '2016-12-22 18:22:24');
INSERT INTO `tb_category` VALUES (6, '视频讲解', '', '', '/public/uploads/20190404/6d92aa51ff72e793c2bc1436458e2f15.png', '', '', '', 1, 0, 0, '0,', '2019-04-04 23:21:00');
INSERT INTO `tb_category` VALUES (3, '代理商管理', '', '', '', '', '', 'article_details.html', 1, 0, 1, '0,1,', '2019-04-04 17:44:15');
INSERT INTO `tb_category` VALUES (4, '分润设置', '', '', '', '', '', '', 1, 0, 1, '0,1,', '2019-04-04 17:45:55');
INSERT INTO `tb_category` VALUES (5, '机具管理', '', '', '', '', '', '', 1, 0, 1, '0,1,', '2019-04-04 17:46:26');
INSERT INTO `tb_category` VALUES (7, '操作手册', '', '', '/public/uploads/20190404/613a50c13042c3553d7a462ef1fe0e3f.png', '', '', '', 1, 0, 0, '0,', '2019-04-04 23:21:47');
INSERT INTO `tb_category` VALUES (8, '数据上传', '', '', '', '', '', '', 1, 0, 1, '0,1,', '2019-04-08 09:37:44');
INSERT INTO `tb_category` VALUES (9, '技术文档', '', '', '', '', '', '', 1, 0, 1, '0,1,', '2019-04-08 09:41:11');
INSERT INTO `tb_category` VALUES (10, '分润宝介绍', '什么是分润宝？', '<div class=\"page-wrapper\" style=\"white-space: normal; box-sizing: border-box; -webkit-tap-highlight-color: transparent; text-size-adjust: none; -webkit-font-smoothing: antialiased; position: relative; outline: 0px;\"><div class=\"page-inner\" style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; text-size-adjust: none; -webkit-font-smoothing: antialiased; position: relative; max-width: 800px; margin: 0px auto; padding: 20px 15px 40px;\"><section><ul class=\" list-paddingleft-2\" style=\"margin-bottom: 0.85em; width: 611.797px; padding: 0px 0px 0px 2em; box-sizing: border-box; -webkit-tap-highlight-color: transparent; text-size-adjust: none; -webkit-font-smoothing: antialiased; font-size: inherit;\"><li><p>分润宝是一个软件系统品牌商标。</p></li><li><p>一款专注于计算代理商分润的软件系统。</p></li><li><p>分润宝品牌创立于2014年6月。</p></li><li><p>隶属于厦门鸿鑫正网络科技有限公司。</p></li></ul><p class=\"line\" style=\"margin-top: 0px; margin-bottom: 0.85em; box-sizing: border-box; -webkit-tap-highlight-color: transparent; text-size-adjust: none; -webkit-font-smoothing: antialiased; font-size: inherit; orphans: 3; widows: 3;\">分润宝是一款为各行业经销商打造的智慧分润综合管理软件，该软件支持微信公众号、APP双渠道接入。 分润宝系统提供了代理商管理、分润管理、商城采购、客户服务等智慧分润管理完整解决方案，在提升财务计算分润时效性的同时，更为代理商提供全新的运营盈利模式。</p><p class=\"line\" style=\"margin-top: 0px; margin-bottom: 0.85em; box-sizing: border-box; -webkit-tap-highlight-color: transparent; text-size-adjust: none; -webkit-font-smoothing: antialiased; font-size: inherit; orphans: 3; widows: 3;\">分润宝作为一种新型的经销商发展业务模式，以利润分配为核心，将各环节的利润分配设置的 更公平公正人性化，充分利用移动互联网、云计算和物联网等新一代信息技术，改变传统分润计算管理流程，把经销商与商户都带到一个现代化、智能化的消费赚钱环境当中去。分润宝系统不仅是一款协助代理商、经销商计算分润的软件系统，分润宝将努力给各行业经销商提供更多关于消费赚钱的新型运营模式。</p><h2 style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; text-size-adjust: none; -webkit-font-smoothing: antialiased; font-family: inherit; line-height: 1.1; color: inherit; margin-top: 1.275em; margin-bottom: 0.85em; font-size: 1.75em; orphans: 3; widows: 3; break-after: avoid;\">分润宝系列产品</h2><ul class=\" list-paddingleft-2\" style=\"margin-bottom: 0.85em; width: 611.797px; padding: 0px 0px 0px 2em; box-sizing: border-box; -webkit-tap-highlight-color: transparent; text-size-adjust: none; -webkit-font-smoothing: antialiased; font-size: inherit;\"><li><p>代理商分润日结返现日结管理系统。</p></li><li><p>合伙人联盟式分润管理系统(综合版分润管理系统)。</p></li><li><p>网申办卡贷款推广管理系统。</p></li><li><p>积分兑换管理系统。</p></li><li><p>流量卡充值分润管理系统。</p></li><li><p>代收代付业务管理系统。</p></li></ul><h2 style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; text-size-adjust: none; -webkit-font-smoothing: antialiased; font-family: inherit; line-height: 1.1; color: inherit; margin-top: 1.275em; margin-bottom: 0.85em; font-size: 1.75em; orphans: 3; widows: 3; break-after: avoid;\">分润宝认证</h2><p class=\"line\" style=\"margin-top: 0px; margin-bottom: 0.85em; box-sizing: border-box; -webkit-tap-highlight-color: transparent; text-size-adjust: none; -webkit-font-smoothing: antialiased; font-size: inherit; orphans: 3; widows: 3;\"><img src=\"http://project.com/public/uploads/images/20190409/1554788484200702.jpg\" alt=\"\"/></p><h2 style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; text-size-adjust: none; -webkit-font-smoothing: antialiased; font-family: inherit; line-height: 1.1; color: inherit; margin-top: 1.275em; margin-bottom: 0.85em; font-size: 1.75em; orphans: 3; widows: 3; break-after: avoid;\">关注以下演示了解更多</h2><p class=\"line\" style=\"margin-top: 0px; margin-bottom: 0.85em; box-sizing: border-box; -webkit-tap-highlight-color: transparent; text-size-adjust: none; -webkit-font-smoothing: antialiased; font-size: inherit; orphans: 3; widows: 3;\">官网网站：<a href=\"https://www.fenrunbao.cn/\" target=\"_blank\" style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; text-size-adjust: none; -webkit-font-smoothing: antialiased; text-decoration-line: none; background-image: initial; background-position: 0px 0px; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; color: rgb(65, 131, 196); font-size: inherit;\">https://www.fenrunbao.cn</a></p><p class=\"line\" style=\"margin-top: 0px; margin-bottom: 0.85em; box-sizing: border-box; -webkit-tap-highlight-color: transparent; text-size-adjust: none; -webkit-font-smoothing: antialiased; font-size: inherit; orphans: 3; widows: 3;\">客服 QQ：<a href=\"http://wpa.qq.com/msgrd?v=3&uin=290325827&site=qq&menu=yes\" target=\"_blank\" style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; text-size-adjust: none; -webkit-font-smoothing: antialiased; text-decoration-line: none; background-image: initial; background-position: 0px 0px; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; color: rgb(65, 131, 196); font-size: inherit;\">290325827</a></p><p class=\"line\" style=\"margin-top: 0px; margin-bottom: 0.85em; box-sizing: border-box; -webkit-tap-highlight-color: transparent; text-size-adjust: none; -webkit-font-smoothing: antialiased; font-size: inherit; orphans: 3; widows: 3;\">客服电话：0592-5519259</p><p class=\"line\" style=\"margin-top: 0px; box-sizing: border-box; -webkit-tap-highlight-color: transparent; text-size-adjust: none; -webkit-font-smoothing: antialiased; font-size: inherit; orphans: 3; widows: 3; margin-bottom: 0px !important;\"><img src=\"http://project.com/public/uploads/images/20190409/1554788484297699.jpg\" alt=\"分润宝微信公众号二维码\"/>&nbsp;&nbsp;&nbsp;<img src=\"http://project.com/public/uploads/images/20190409/1554788484958430.jpg\" alt=\"分润宝客服微信\"/></p></section></div></div><div class=\"banquan\" style=\"white-space: normal; box-sizing: border-box; -webkit-tap-highlight-color: transparent; text-size-adjust: none; -webkit-font-smoothing: antialiased; text-align: center; padding: 25px; color: rgb(160, 160, 160);\">© 2010-2019 分润宝 厦门鸿鑫正网络科技有限公司版权所有&nbsp;<a href=\"http://www.miitbeian.gov.cn/\" target=\"_blank\" style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; text-size-adjust: none; -webkit-font-smoothing: antialiased; color: rgb(35, 82, 124); outline: 0px;\">闽ICP备11004153号-6</a></div><p><br/></p>', '', '', '', '', 2, 0, 7, '0,7,', '2019-04-09 10:36:00');
INSERT INTO `tb_category` VALUES (11, '如何开始', '', '', '', '', '', '', 2, 998, 7, '0,7,', '2019-04-09 10:36:13');
INSERT INTO `tb_category` VALUES (12, '代理商管理', '', '', '', '', '', '', 1, 997, 7, '0,7,', '2019-04-09 10:36:26');
INSERT INTO `tb_category` VALUES (13, '分润设置', '', '', '', '', '', '', 1, 996, 7, '0,7,', '2019-04-09 10:36:34');
INSERT INTO `tb_category` VALUES (14, '产品管理', '', '', '', '', '', '', 1, 995, 7, '0,7,', '2019-04-09 10:37:25');
INSERT INTO `tb_category` VALUES (15, '新增代理商/注册推广', '', '', '', '', '', '', 2, 0, 12, '0,7,12,', '2019-04-09 10:38:06');
INSERT INTO `tb_category` VALUES (16, '代理商忘记登录密码怎么办', '', '', '', '', '', '', 2, 0, 12, '0,7,12,', '2019-04-09 10:38:17');
INSERT INTO `tb_category` VALUES (17, '实名认证申请/审核', '', '', '', '', '', '', 1, 0, 12, '0,7,12,', '2019-04-09 10:38:28');
INSERT INTO `tb_category` VALUES (18, '代理商修改结算银行卡信息', '', '', '', '', '', '', 1, 0, 12, '0,7,12,', '2019-04-09 10:38:39');
INSERT INTO `tb_category` VALUES (19, '投诉/建议/留言管理', '', '', '', '', '', '', 2, 0, 12, '0,7,12,', '2019-04-09 10:38:51');
INSERT INTO `tb_category` VALUES (20, '激活返现政策设置', '', '', '', '', '', '', 1, 0, 13, '0,7,13,', '2019-04-09 10:39:15');
INSERT INTO `tb_category` VALUES (21, '推广佣金设置', '', '', '', '', '', '', 1, 0, 13, '0,7,13,', '2019-04-09 10:39:26');
INSERT INTO `tb_category` VALUES (22, '等级设置', '', '', '', '', '', '', 1, 0, 13, '0,7,13,', '2019-04-09 10:39:35');
INSERT INTO `tb_category` VALUES (23, '分润阶梯设置', '', '', '', '', '', '', 1, 0, 13, '0,7,13,', '2019-04-09 10:39:42');
INSERT INTO `tb_category` VALUES (24, '如何上架发布新产品', '', '', '', '', '', '', 1, 0, 14, '0,7,14,', '2019-04-09 10:39:56');
INSERT INTO `tb_category` VALUES (25, '产品分销佣金设置', '', '', '', '', '', '', 1, 0, 13, '0,7,13,', '2019-04-09 10:40:01');
INSERT INTO `tb_category` VALUES (26, '绑定提醒设置', '', '', '', '', '', '', 2, 1000, 7, '0,7,', '2019-04-09 11:29:26');
INSERT INTO `tb_category` VALUES (27, '关于我们', '', '<div class=\"y_info\" style=\"white-space: normal; margin: 0px; padding: 0px; border: 0px; outline: 0px;\"><div class=\"y_header\" style=\"margin: 0px auto; padding: 0px; border: 0px; outline: 0px; text-align: center; width: 1200px;\"><h3 style=\"margin: 0px; padding: 20px 0px 0px; border: 0px; outline: 0px; font-size: 30px; font-weight: normal; line-height: 85px;\">我们是谁？</h3><p style=\"margin: 0px auto; padding: 0px; border: 0px; outline: 0px; font-size: 18px; color: rgb(148, 142, 148); line-height: 30px;\">分润宝属于厦门鸿鑫正网络科技有限公司旗下品牌，公司位于厦门。</p><p style=\"margin: 0px auto; padding: 0px; border: 0px; outline: 0px; font-size: 18px; color: rgb(148, 142, 148); line-height: 30px;\">分润宝专注为服务商、代理商、经销商等渠道提供产品销售分润计算发放一站式解决方案，</p><p style=\"margin: 0px auto; padding: 0px; border: 0px; outline: 0px; font-size: 18px; color: rgb(148, 142, 148); line-height: 30px;\">产品集合了会员管理、产品管理、订单管理、交易管理、分润管理，<br/>系统的展现形式包括公众号、小程序、APP、PC网站。</p><h3 style=\"margin: 0px; padding: 20px 0px 0px; border: 0px; outline: 0px; font-size: 30px; font-weight: normal; line-height: 85px;\">品牌介绍</h3><p style=\"margin: 0px auto; padding: 0px; border: 0px; outline: 0px; font-size: 18px; color: rgb(148, 142, 148); line-height: 30px;\">分润宝属于厦门鸿鑫正网络科技有限公司旗下品牌，</p><p style=\"margin: 0px auto; padding: 0px; border: 0px; outline: 0px; font-size: 18px; color: rgb(148, 142, 148); line-height: 30px;\">专注为服务商、代理商、经销商等渠道提供：会员管理、产品管理、订单管理、售后管理、<br/>客户管理、交易管理、分润管理等分润系统一站式解决方案，</p><p style=\"margin: 0px auto; padding: 0px; border: 0px; outline: 0px; font-size: 18px; color: rgb(148, 142, 148); line-height: 30px;\">系统的展现形式包括公众号、小程序、APP、PC网站。</p><h3 style=\"margin: 0px; padding: 20px 0px 0px; border: 0px; outline: 0px; font-size: 30px; font-weight: normal; line-height: 85px;\">品牌产品</h3><p style=\"margin: 0px auto; padding: 0px; border: 0px; outline: 0px; font-size: 18px; color: rgb(148, 142, 148); line-height: 30px;\">自主研发系列产品：代理商日结分润系统，分润宝分销商城，企业标准化定制系统。</p><h3 style=\"margin: 0px; padding: 20px 0px 0px; border: 0px; outline: 0px; font-size: 30px; font-weight: normal; line-height: 85px;\">品牌服务</h3><p style=\"margin: 0px auto; padding: 0px; border: 0px; outline: 0px; font-size: 18px; color: rgb(148, 142, 148); line-height: 30px;\">人员管理：包括代理商、会员、商户信息管理等。</p><p style=\"margin: 0px auto; padding: 0px; border: 0px; outline: 0px; font-size: 18px; color: rgb(148, 142, 148); line-height: 30px;\">产品管理：包括商城产品、机具等。</p><p style=\"margin: 0px auto; padding: 0px; border: 0px; outline: 0px; font-size: 18px; color: rgb(148, 142, 148); line-height: 30px;\">仓储管理：包括仓库、出入库、库存查询等。</p><p style=\"margin: 0px auto; padding: 0px; border: 0px; outline: 0px; font-size: 18px; color: rgb(148, 142, 148); line-height: 30px;\">数据管理：包括交易、分润等。</p><p style=\"margin: 0px auto; padding: 0px; border: 0px; outline: 0px; font-size: 18px; color: rgb(148, 142, 148); line-height: 30px;\">其他版块：机具划拨、等级设置、分润设置等。</p><p style=\"margin: 0px auto; padding: 0px; border: 0px; outline: 0px; font-size: 18px; color: rgb(148, 142, 148); line-height: 30px;\"><br/></p><h3 style=\"margin: 0px; padding: 20px 0px 0px; border: 0px; outline: 0px; font-size: 30px; font-weight: normal; line-height: 85px;\">品牌发展</h3><p style=\"margin: 0px auto; padding: 0px; border: 0px; outline: 0px; font-size: 18px; color: rgb(148, 142, 148); line-height: 30px;\">2010年06月22日，厦门鸿鑫正网络科技有限公司成立；</p><p style=\"margin: 0px auto; padding: 0px; border: 0px; outline: 0px; font-size: 18px; color: rgb(148, 142, 148); line-height: 30px;\">2016年02月27日，分润宝软件著作权申请通过；</p><p style=\"margin: 0px auto; padding: 0px; border: 0px; outline: 0px; font-size: 18px; color: rgb(148, 142, 148); line-height: 30px;\">2016年02月21日，分润宝商标注册成功通过；</p><h3 style=\"margin: 0px; padding: 20px 0px 0px; border: 0px; outline: 0px; font-size: 30px; font-weight: normal; line-height: 85px;\">品牌地址</h3><p style=\"margin: 0px auto; padding: 0px; border: 0px; outline: 0px; font-size: 18px; color: rgb(148, 142, 148); line-height: 30px;\">厦门市湖里区塘边社420号2206</p></div><div class=\"y_body\" style=\"margin: 0px; padding: 60px 0px 45px; border: 0px; outline: 0px; text-align: center;\"><img src=\"http://project.com/public/uploads/images/20190409/1554794187938165.jpg\"/></div></div><div class=\"y_unit\" style=\"white-space: normal; margin: 0px; padding: 0px 0px 75px; border: 0px; outline: 0px; background: rgb(248, 248, 249);\"><div class=\"y_header y_header2\" style=\"margin: 0px auto; padding: 30px 0px 55px; border: 0px; outline: 0px; text-align: center; width: 1200px;\"><h3 style=\"margin: 0px; padding: 20px 0px 0px; border: 0px; outline: 0px; font-size: 30px; font-weight: normal; line-height: 85px;\">为各行业代理商提供分润系统服务支持</h3><p style=\"margin: 0px auto; padding: 0px; border: 0px; outline: 0px; font-size: 18px; color: rgb(148, 142, 148); line-height: 30px;\">代理商分润系统，激活返现系统，网申办卡系统，积分兑换系统，分销裂变分润系统，应收账款管理系统，商家联盟积分系统</p></div><div class=\"y_body clearfix\" style=\"margin: 0px auto; padding: 0px; border: 0px; outline: 0px; background: rgb(255, 255, 255); box-shadow: rgb(153, 153, 153) 1px 2px 20px; height: 430px; width: 1200px;\"><div class=\"y_left fl\" style=\"margin: 0px; padding: 80px 0px 0px 55px; border: 0px; outline: 0px; float: left; width: 420px;\"><div class=\"hr\" style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; height: 2px; width: 85px; background: rgb(190, 194, 196);\"></div><h2 style=\"margin: 0px; padding: 0px 0px 17px; border: 0px; outline: 0px; font-size: 26px; line-height: 70px;\">大势所趋，顺势而为！</h2><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 18px; color: rgb(180, 181, 181); line-height: 42px;\">公司经过多年发展，软件业务涉及多个行业</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 18px; color: rgb(180, 181, 181); line-height: 42px;\">已经形成完善的产品链，在行业内销售额持续领先</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 18px; color: rgb(180, 181, 181); line-height: 42px;\">提供行业内领先成熟的解决方案和完善的售后服务</p></div><div class=\"y_right fr\" style=\"margin: 0px; padding: 60px 50px 0px 0px; border: 0px; outline: 0px; float: right; width: 630px;\"><ul class=\"clearfix list-paddingleft-2\" style=\"list-style-type: none;\"><li><p><a href=\"http://project.com/index/about/index.html#\" style=\"margin: 0px; padding: 0px; border: 1px solid rgb(226, 226, 226); outline: 0px; text-decoration-line: none; color: rgb(85, 85, 85); display: block;\"><img src=\"http://project.com/public/uploads/images/20190409/1554794187582845.jpg\"/></a></p></li><li><p><a href=\"http://project.com/index/about/index.html#\" style=\"margin: 0px; padding: 0px; border: 1px solid rgb(226, 226, 226); outline: 0px; text-decoration-line: none; color: rgb(85, 85, 85); display: block;\"><img src=\"http://project.com/public/uploads/images/20190409/1554794187803573.jpg\"/></a></p></li><li><p><a href=\"http://project.com/index/about/index.html#\" style=\"margin: 0px; padding: 0px; border: 1px solid rgb(226, 226, 226); outline: 0px; text-decoration-line: none; color: rgb(85, 85, 85); display: block;\"><img src=\"http://project.com/public/uploads/images/20190409/1554794188293633.jpg\"/></a></p></li><li><p><a href=\"http://project.com/index/about/index.html#\" style=\"margin: 0px; padding: 0px; border: 1px solid rgb(226, 226, 226); outline: 0px; text-decoration-line: none; color: rgb(85, 85, 85); display: block;\"><img src=\"http://project.com/public/uploads/images/20190409/1554794188460017.jpg\"/></a></p></li><li><p><a href=\"http://project.com/index/about/index.html#\" style=\"margin: 0px; padding: 0px; border: 1px solid rgb(226, 226, 226); outline: 0px; text-decoration-line: none; color: rgb(85, 85, 85); display: block;\"><img src=\"http://project.com/public/uploads/images/20190409/1554794188400172.jpg\"/></a></p></li><li><p><a href=\"http://project.com/index/about/index.html#\" style=\"margin: 0px; padding: 0px; border: 1px solid rgb(226, 226, 226); outline: 0px; text-decoration-line: none; color: rgb(85, 85, 85); display: block;\"><img src=\"http://project.com/public/uploads/images/20190409/1554794188929001.jpg\"/></a></p></li><li><p><a href=\"http://project.com/index/about/index.html#\" style=\"margin: 0px; padding: 0px; border: 1px solid rgb(226, 226, 226); outline: 0px; text-decoration-line: none; color: rgb(85, 85, 85); display: block;\"><img src=\"http://project.com/public/uploads/images/20190409/1554794189709533.jpg\"/></a></p></li><li><p><a href=\"http://project.com/index/about/index.html#\" style=\"margin: 0px; padding: 0px; border: 1px solid rgb(226, 226, 226); outline: 0px; text-decoration-line: none; color: rgb(85, 85, 85); display: block;\"><img src=\"http://project.com/public/uploads/images/20190409/1554794189448748.jpg\"/></a></p></li><li><p><a href=\"http://project.com/index/about/index.html#\" style=\"margin: 0px; padding: 0px; border: 1px solid rgb(226, 226, 226); outline: 0px; text-decoration-line: none; color: rgb(85, 85, 85); display: block;\"><img src=\"http://project.com/public/uploads/images/20190409/1554794189512967.jpg\"/></a></p></li><li><p><a href=\"http://project.com/index/about/index.html#\" style=\"margin: 0px; padding: 0px; border: 1px solid rgb(226, 226, 226); outline: 0px; text-decoration-line: none; color: rgb(85, 85, 85); display: block;\"><img src=\"http://project.com/public/uploads/images/20190409/1554794189827366.jpg\"/></a></p></li><li><p><a href=\"http://project.com/index/about/index.html#\" style=\"margin: 0px; padding: 0px; border: 1px solid rgb(226, 226, 226); outline: 0px; text-decoration-line: none; color: rgb(85, 85, 85); display: block;\"><img src=\"http://project.com/public/uploads/images/20190409/1554794190451977.jpg\"/></a></p></li><li><p><a href=\"http://project.com/index/about/index.html#\" style=\"margin: 0px; padding: 0px; border: 1px solid rgb(226, 226, 226); outline: 0px; text-decoration-line: none; color: rgb(85, 85, 85); display: block;\"><img src=\"http://project.com/public/uploads/images/20190409/1554794190919853.jpg\"/></a></p></li></ul></div></div></div><div class=\"y_advantage y_content\" style=\"white-space: normal; margin: 0px auto; padding: 0px 0px 60px; border: 0px; outline: 0px; width: 1200px;\"><div class=\"y_head\" style=\"margin: 0px; padding: 0px 0px 35px; border: 0px; outline: 0px; font-size: 30px; text-align: center; line-height: 145px;\">为什么选择我们</div><ul class=\"clearfix list-paddingleft-2\" style=\"list-style-type: none;\"><li><div class=\"hr\" style=\"margin: 0px auto; padding: 0px; border: 0px; outline: 0px; width: 50px; height: 8px; background: rgb(255, 68, 78);\"></div><p><img src=\"http://project.com/public/uploads/images/20190409/1554794190631635.png\"/></p><h3 style=\"margin: 0px; padding: 10px 0px 0px; border: 0px; outline: 0px; font-size: 28px; line-height: 60px;\">行业优势</h3><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px 30px; border: 0px; outline: 0px; color: rgb(180, 181, 181); line-height: 30px;\">公司立足软件行业多年，成熟的产品与团队，获得市场高度认可</p></li><li><div class=\"hr\" style=\"margin: 0px auto; padding: 0px; border: 0px; outline: 0px; width: 50px; height: 8px; background: rgb(0, 147, 255);\"></div><p><img src=\"http://project.com/public/uploads/images/20190409/1554794190893463.png\"/></p><h3 style=\"margin: 0px; padding: 10px 0px 0px; border: 0px; outline: 0px; font-size: 28px; line-height: 60px;\">产品优势</h3><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px 30px; border: 0px; outline: 0px; color: rgb(180, 181, 181); line-height: 30px;\">整合信息渠道，线上线下结合，颠覆传统分润模式，成本更低，效率更高</p></li><li><div class=\"hr\" style=\"margin: 0px auto; padding: 0px; border: 0px; outline: 0px; width: 50px; height: 8px; background: rgb(1, 195, 170);\"></div><p><img src=\"http://project.com/public/uploads/images/20190409/1554794190118915.png\"/></p><h3 style=\"margin: 0px; padding: 10px 0px 0px; border: 0px; outline: 0px; font-size: 28px; line-height: 60px;\">渠道优势</h3><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px 30px; border: 0px; outline: 0px; color: rgb(180, 181, 181); line-height: 30px;\">全方位建立城市重点渠道及优质运营体系，本地化、覆盖广、更专业</p></li><li><div class=\"hr\" style=\"margin: 0px auto; padding: 0px; border: 0px; outline: 0px; width: 50px; height: 8px; background: rgb(253, 194, 0);\"></div><p><img src=\"http://project.com/public/uploads/images/20190409/1554794191955240.png\"/></p><h3 style=\"margin: 0px; padding: 10px 0px 0px; border: 0px; outline: 0px; font-size: 28px; line-height: 60px;\">服务优势</h3><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px 30px; border: 0px; outline: 0px; color: rgb(180, 181, 181); line-height: 30px;\">VIP客户售前支持，一对一服务体系，7*24小时服务体系，服务有口皆碑</p></li></ul></div><div class=\"y_condition\" style=\"white-space: normal; margin: 0px; padding: 0px; border: 0px; outline: 0px; background: rgb(248, 248, 249);\"><div class=\"y_content\" style=\"margin: 0px auto; padding: 0px; border: 0px; outline: 0px; width: 1200px; color: rgb(75, 75, 75); font-family: \"><div class=\"y_head\" style=\"margin: 0px; padding: 0px 0px 35px; border: 0px; outline: 0px; font-size: 30px; color: rgb(0, 0, 0); text-align: center; line-height: 145px;\"><h2 class=\"y_head2\" style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 30px; font-weight: normal;\">成为分润宝代理商您需要具备哪些条件</h2></div><ul class=\"clearfix list-paddingleft-2\" style=\"list-style-type: none;\"><li><p><img src=\"http://project.com/public/uploads/images/20190409/1554794191514616.png\"/></p><h5 style=\"margin: 0px; padding: 20px 0px 0px; border: 0px; outline: 0px; font-size: 16px; font-weight: normal; color: rgb(0, 0, 0); line-height: 30px;\">01</h5><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px 30px; border: 0px; outline: 0px; color: rgb(180, 181, 181); line-height: 30px;\">具有行业经验与企业客户资源</p></li><li><p><img src=\"http://project.com/public/uploads/images/20190409/1554794191303885.png\"/></p><h5 style=\"margin: 0px; padding: 20px 0px 0px; border: 0px; outline: 0px; font-size: 16px; font-weight: normal; color: rgb(0, 0, 0); line-height: 30px;\">02</h5><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px 30px; border: 0px; outline: 0px; color: rgb(180, 181, 181); line-height: 30px;\">有专业的销售团队与拓展市场的能力</p></li><li><p><img src=\"http://project.com/public/uploads/images/20190409/1554794191955273.png\"/></p><h5 style=\"margin: 0px; padding: 20px 0px 0px; border: 0px; outline: 0px; font-size: 16px; font-weight: normal; color: rgb(0, 0, 0); line-height: 30px;\">03</h5><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px 30px; border: 0px; outline: 0px; color: rgb(180, 181, 181); line-height: 30px;\">极强的市场敏感度，了解行业所需</p></li></ul></div><div class=\"y_btnBox\" style=\"margin: 0px; padding: 50px 0px 0px; border: 0px; outline: 0px; height: 110px; background: rgb(255, 255, 255); color: rgb(75, 75, 75); font-family: \"></div></div><p><br/></p>', '', '', '', '', 2, 99, 0, '0,', '2019-04-09 15:16:58');
COMMIT;

-- ----------------------------
-- Table structure for tb_link
-- ----------------------------
DROP TABLE IF EXISTS `tb_link`;
CREATE TABLE `tb_link` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '链接名称',
  `link` varchar(255) DEFAULT '' COMMENT '链接地址',
  `image` varchar(255) DEFAULT '' COMMENT '链接图片',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态 1 显示  2 隐藏',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='友情链接表';

-- ----------------------------
-- Table structure for tb_nav
-- ----------------------------
DROP TABLE IF EXISTS `tb_nav`;
CREATE TABLE `tb_nav` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL COMMENT '父ID',
  `name` varchar(20) NOT NULL COMMENT '导航名称',
  `alias` varchar(20) DEFAULT '' COMMENT '导航别称',
  `link` varchar(255) DEFAULT '' COMMENT '导航链接',
  `icon` varchar(255) DEFAULT '' COMMENT '导航图标',
  `target` varchar(10) DEFAULT '' COMMENT '打开方式',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态  0 隐藏  1 显示',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='导航表';

-- ----------------------------
-- Records of tb_nav
-- ----------------------------
BEGIN;
INSERT INTO `tb_nav` VALUES (1, 0, '网站首页', '', '/index/index/index', '', '_self', 1, 0);
INSERT INTO `tb_nav` VALUES (2, 0, '常见问题', '', '/index/question/index', '', '_self', 1, 0);
INSERT INTO `tb_nav` VALUES (4, 0, '视频讲解', '', '/index/video/index', '', '_self', 1, 0);
INSERT INTO `tb_nav` VALUES (5, 0, '操作手册', '', '/index/manual/index', '', '_self', 1, 0);
INSERT INTO `tb_nav` VALUES (6, 0, '关于我们', '', '/index/about/index', '', '_self', 1, 0);
INSERT INTO `tb_nav` VALUES (7, 0, '联系方式', '', '/index/contact/index', '', '_self', 1, 0);
COMMIT;

-- ----------------------------
-- Table structure for tb_product
-- ----------------------------
DROP TABLE IF EXISTS `tb_product`;
CREATE TABLE `tb_product` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `img` varchar(255) DEFAULT NULL COMMENT '缩略图',
  `url` varchar(255) DEFAULT NULL COMMENT '跳转地址',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `cate_id` int(11) DEFAULT NULL COMMENT '分类id',
  `sort` tinyint(3) DEFAULT '0' COMMENT '排序',
  `status` tinyint(3) DEFAULT '1' COMMENT '状态',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of tb_product
-- ----------------------------
BEGIN;
INSERT INTO `tb_product` VALUES (1, '日结分润系统', '/public/uploads/20190404/76432f61f516b6a7d180226da236cc9d.png', NULL, '分润宝代理商日结分润系统主要包括代理商管理，交易数据管理，结算成本、分润比例、激活返现设置，代理商在线申请提现实时到账。', NULL, 0, 1, NULL, 1554369676);
INSERT INTO `tb_product` VALUES (2, '激活返现管理系统', '/public/uploads/20190404/cdfd0648989b07b7be14634aaf93d296.png', NULL, '激活返现管理系统主要给代理商提供一个快速发展商户在线支付押金领取机器，激活达标自助申请返现的平台。', NULL, 0, 1, 1554369762, 1554369762);
INSERT INTO `tb_product` VALUES (3, '信用卡积分兑换管理系统', '/public/uploads/20190404/4b9dd8dea029f52601d967b5c0936f29.png', NULL, '信用卡积分兑换平台主要是一个多等级发展会员，针对不同等级会员实现不同积分兑换价格的一个综合性平台。', NULL, 0, 1, 1554369785, 1554369785);
INSERT INTO `tb_product` VALUES (4, '财务/仓储管理系统', '/public/uploads/20190404/31726971eadcce44c3c9d908b19a7060.png', NULL, '主要用于公司下级代理的对账记账核对管理，各品牌的出入库管理。方便下级代理商的对账，历史账目清晰可查，统计汇总备份永久可查。', NULL, 0, 1, 1554369815, 1554369815);
INSERT INTO `tb_product` VALUES (5, '合伙人分销裂变分润系统', '/public/uploads/20190404/7c0774bd18164931c62e6e67112c0046.png', NULL, '合伙人模式分润系统是在传统代理商模式的驱动下顺势而生的一个创新型代理商分销裂变分润系统，在分享经济的时代实现人人是代理，消费赚钱的模式。', NULL, 0, 1, 1554369843, 1554369843);
INSERT INTO `tb_product` VALUES (6, '网申信用卡推广系统', '/public/uploads/20190404/d692ffd7e3fbcb8dc2c258c0bbdfbd82.png', NULL, '信用卡网上推广平台主要是结合信用卡渠道链接发展的一个综合性办卡平台，给有需要办理信用卡的人员提供一个简单便捷的办卡平台。', NULL, 0, 1, 1554369869, 1554369869);
INSERT INTO `tb_product` VALUES (7, '会员收银记账系统', '/public/uploads/20190404/da145c0cfc628d97324aac99a1375476.png', NULL, '记账系统用户角色分为团队和代理商以及会员，主要用于管理会员每天的收入支出的账目明细和代理统计汇总使用的一个账目管理平台。', NULL, 0, 1, 1554369892, 1554369892);
INSERT INTO `tb_product` VALUES (8, '积分消费商家联盟平台', '/public/uploads/20190404/7ea92d76527d2a6d9e9086e44e400374.png', NULL, '积分兑换系统主要为了给商户创建一个粘性更高的积分兑换系统，让每个商户刷卡交易都能给自己带来对应的积分并在线兑换礼品的商家联盟平台。', NULL, 0, 1, 1554369923, 1554369923);
INSERT INTO `tb_product` VALUES (9, '物业管理系统', '/public/uploads/20190404/9ffcf2418157ea0774b5063a6f029e01.png', NULL, '分润宝物业管理系统主要应用于小区物业管理，收费管理，报修维护管理，小区业主交流平台维护，出租房房租收费管理。', NULL, 0, 1, 1554369945, 1554369945);
COMMIT;

-- ----------------------------
-- Table structure for tb_slide
-- ----------------------------
DROP TABLE IF EXISTS `tb_slide`;
CREATE TABLE `tb_slide` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cid` int(10) unsigned NOT NULL COMMENT '分类ID',
  `name` varchar(50) NOT NULL COMMENT '轮播图名称',
  `description` varchar(255) DEFAULT '' COMMENT '说明',
  `link` varchar(255) DEFAULT '' COMMENT '链接',
  `target` varchar(10) DEFAULT '' COMMENT '打开方式',
  `image` varchar(255) DEFAULT '' COMMENT '轮播图片',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态  1 显示  0  隐藏',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='轮播图表';

-- ----------------------------
-- Records of tb_slide
-- ----------------------------
BEGIN;
INSERT INTO `tb_slide` VALUES (1, 1, '第一张', '', '', '_self', '/public/uploads/20190410/5fb0c9c9ec2ecdbf9c791c0c1e904111.jpg', 1, 0);
INSERT INTO `tb_slide` VALUES (2, 1, '第二张', '', '', '_self', '/public/uploads/20190404/cf953177029299e6cbcb44b9e66699ff.jpg', 1, 0);
INSERT INTO `tb_slide` VALUES (3, 1, '第三张', '', '', '_self', '/public/uploads/20190404/808eddec0bd73ef1aa4754504635c14e.jpg', 1, 0);
INSERT INTO `tb_slide` VALUES (4, 2, '常见问题', '', '', '_self', '/public/uploads/20190404/b94b7bee8d5f67eb4b10fd9eff3cea86.jpg', 1, 0);
INSERT INTO `tb_slide` VALUES (5, 3, '视频讲解', '', '', '_self', '/public/uploads/20190408/cb514e4450ceab67eef4283e0d49229d.jpg', 1, 0);
INSERT INTO `tb_slide` VALUES (6, 4, '关于我们', '', '', '_self', '/public/uploads/20190409/61578508e516cd64d4203e4c935536bd.jpg', 1, 0);
INSERT INTO `tb_slide` VALUES (7, 5, '联系我们', '', '', '_self', '/public/uploads/20190409/f226834c90ddc888f819a31249cfe8b7.png', 1, 0);
COMMIT;

-- ----------------------------
-- Table structure for tb_slide_category
-- ----------------------------
DROP TABLE IF EXISTS `tb_slide_category`;
CREATE TABLE `tb_slide_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '轮播图分类',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='轮播图分类表';

-- ----------------------------
-- Records of tb_slide_category
-- ----------------------------
BEGIN;
INSERT INTO `tb_slide_category` VALUES (1, '首页轮播');
INSERT INTO `tb_slide_category` VALUES (2, '常见问题');
INSERT INTO `tb_slide_category` VALUES (3, '视频讲解');
INSERT INTO `tb_slide_category` VALUES (4, '关于我们');
INSERT INTO `tb_slide_category` VALUES (5, '联系我们');
COMMIT;

-- ----------------------------
-- Table structure for tb_system
-- ----------------------------
DROP TABLE IF EXISTS `tb_system`;
CREATE TABLE `tb_system` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '配置项名称',
  `value` text NOT NULL COMMENT '配置项值',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='系统配置表';

-- ----------------------------
-- Records of tb_system
-- ----------------------------
BEGIN;
INSERT INTO `tb_system` VALUES (2, 'site_config', 'a:13:{s:10:\"site_title\";s:109:\"分润宝产品大全_代理商分润系统_激活返现系统_分销裂变系统_信用卡积分兑换系统\";s:16:\"site_description\";s:117:\"分润宝，专注各种代理商分润系统开发！完美兼容各支付公司产品代理商分润结算模式。\";s:4:\"logo\";s:61:\"/public/uploads/20190410/f9d87463217cde6eb71ab3ab4c39159e.png\";s:4:\"icon\";s:61:\"/public/uploads/20190410/6674f3a8a3b667878da5b90f4ab6595c.png\";s:5:\"phone\";s:12:\"0592-5519259\";s:2:\"qq\";s:9:\"782341287\";s:6:\"wechat\";s:61:\"/public/uploads/20190410/56844cb2e5e618d4330528cc8c8b94c6.jpg\";s:11:\"seo_keyword\";s:116:\"分润宝,代理商分润系统,激活返现系统,分销裂变系统,信用卡积分兑换系统,网申办卡系统\";s:15:\"seo_description\";s:138:\"分润宝主要研发基于代理商分润系统的集刷卡分润，激活达标返现，网申办卡分润等综合性分润管理系统\";s:7:\"company\";s:39:\"厦门鸿鑫正网络科技有限公司\";s:7:\"address\";s:37:\"厦门市湖里区塘边社420号2206\";s:14:\"site_copyright\";s:62:\"Copyright © 2010-2019 厦门鸿鑫正网络科技有限公司\";s:8:\"site_icp\";s:22:\"闽ICP备11004153号-6\";}');
COMMIT;

-- ----------------------------
-- Table structure for tb_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(50) NOT NULL COMMENT '密码',
  `mobile` varchar(11) DEFAULT '' COMMENT '手机',
  `email` varchar(50) DEFAULT '' COMMENT '邮箱',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '用户状态  1 正常  2 禁止',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `last_login_time` datetime DEFAULT NULL COMMENT '最后登陆时间',
  `last_login_ip` varchar(50) DEFAULT '' COMMENT '最后登录IP',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户表';

SET FOREIGN_KEY_CHECKS = 1;
