-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 2016-08-26 11:07:55
-- 服务器版本： 10.1.9-MariaDB
-- PHP Version: 5.6.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mall`
--

-- --------------------------------------------------------

--
-- 表的结构 `cs_admin`
--

CREATE TABLE IF NOT EXISTS `cs_admin` (
  `id` mediumint(5) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` char(32) NOT NULL,
  `roleid` mediumint(5) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=gbk;

--
-- 转存表中的数据 `cs_admin`
--

INSERT INTO `cs_admin` (`id`, `username`, `password`, `roleid`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', 1),
(13, 'guanliyuan', 'e10adc3949ba59abbe56e057f20f883e', 1),
(12, 'tp', 'e10adc3949ba59abbe56e057f20f883e', 8),
(11, 'tongpan', 'e10adc3949ba59abbe56e057f20f883e', 7);

-- --------------------------------------------------------

--
-- 表的结构 `cs_album`
--

CREATE TABLE IF NOT EXISTS `cs_album` (
  `id` int(11) UNSIGNED NOT NULL,
  `album_name` varchar(64) NOT NULL,
  `image_width` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `image_height` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `album_desc` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='图片资源分组';

--
-- 转存表中的数据 `cs_album`
--

INSERT INTO `cs_album` (`id`, `album_name`, `image_width`, `image_height`, `album_desc`) VALUES
(1, 'BannerAD', 600, 80, 'sdfsdf'),
(2, 'test002', 800, 600, 'sdf');

-- --------------------------------------------------------

--
-- 表的结构 `cs_article`
--

CREATE TABLE IF NOT EXISTS `cs_article` (
  `id` int(5) NOT NULL,
  `title` varchar(40) NOT NULL,
  `atype` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0:列表 1：车型 2：招聘',
  `rizu` mediumint(6) NOT NULL COMMENT '日租价格',
  `num` varchar(3) NOT NULL COMMENT '招聘人数',
  `author` varchar(20) NOT NULL,
  `pic` varchar(60) NOT NULL,
  `content` text NOT NULL,
  `keywords` varchar(60) NOT NULL,
  `des` varchar(255) NOT NULL,
  `rem` tinyint(1) NOT NULL DEFAULT '0',
  `cateid` mediumint(5) NOT NULL,
  `time` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=gbk;

--
-- 转存表中的数据 `cs_article`
--

INSERT INTO `cs_article` (`id`, `title`, `atype`, `rizu`, `num`, `author`, `pic`, `content`, `keywords`, `des`, `rem`, `cateid`, `time`) VALUES
(1, '1', 0, 0, '', '2', './Public/Uploads/2016-04-07/570650c43db3b.jpg', '&lt;p&gt;123456778&lt;br/&gt;&lt;/p&gt;', '3', '4', 1, 75, 1461511847),
(12, '测试新闻资讯1', 0, 0, '', '', '', '', '', '', 0, 69, 1461727928),
(13, '测试新闻资讯2', 0, 0, '', '', '', '&lt;p&gt;测试新闻资讯1测试新闻资讯1测试新闻资讯1测试新闻资讯1测试新闻资讯1测试新闻资讯1测试新闻资讯1测试新闻资讯1测试新闻资讯1测试新闻资讯1测试新闻资讯1测试新闻资讯1测试新闻资讯1测试新闻资讯1测试新闻资讯1测试新闻资讯1&lt;/p&gt;', '', '', 0, 69, 1461727944),
(7, '测试文章2', 1, 1000, '', '', '', '&lt;p&gt;测试文章2测试文章2测试文章2&lt;/p&gt;', '', '', 0, 68, 1461732611),
(8, '测试文章5', 0, 0, '', '', '', '', '', '', 0, 69, 1461511830),
(9, '测试文章6', 0, 0, '', '', './Public/Uploads/2016-05-03/5728bb5fc39d9.jpg', '&lt;p&gt;测试文章6测试文章6测试文章6测试文章6测试文章6测试文章6测试文章6测试文章6测试文章6测试文章6测试文章6测试文章6测试文章6测试文章6测试文章6测试文章6测试文章6&lt;/p&gt;', '', '', 0, 70, 1462287199),
(10, '车型展示1', 1, 100, '', '1', '', '&lt;p&gt;车型展示1车型展示1车型展示1&lt;br/&gt;&lt;/p&gt;', '2', '3', 1, 68, 1461909821),
(11, 'UI设计师1', 2, 0, '21', '', '', '&lt;p&gt;1、收集和分析用户界面需求；&lt;br/&gt;2、结合用户体验及技术可行性确定线框图；&lt;br/&gt;3、将线框图设计为平面效果图；&lt;br/&gt;4、跟踪开发和测试；&lt;br/&gt;5、根据数据分析，对页面进行优化。111&lt;/p&gt;', '', '', 0, 27, 1460435581),
(14, '测试新闻资讯3', 0, 0, '', '', '', '&lt;p&gt;测试新闻资讯1测试新闻资讯1测试新闻资讯1测试新闻资讯1&lt;/p&gt;', '', '', 0, 69, 1461727959),
(15, '测试车辆展示1', 0, 0, '', '', './Public/Uploads/2016-04-27/572043b5b427e.jpg', '&lt;p&gt;测试车辆展示1测试车辆展示1测试车辆展示1测试车辆展示1&lt;/p&gt;', '', '', 0, 68, 1461732277),
(16, '测试车辆展示2', 1, 100, '', '', './Public/Uploads/2016-04-27/5720440116c2c.jpg', '&lt;p&gt;测试车辆展示3测试车辆展示3测试车辆展示3测试车辆展示3测试车辆展示3测试车辆展示3测试车辆展示3测试车辆展示3测试车辆展示3&lt;/p&gt;', '', '', 0, 68, 1461732353),
(17, '测试车辆展示3', 1, 234, '', '', './Public/Uploads/2016-04-27/5720442390d32.jpg', '&lt;p&gt;测试车辆展示3测试车辆展示3测试车辆展示3测试车辆展示3测试车辆展示3测试车辆展示3&lt;/p&gt;', '', '', 1, 68, 1461732387),
(18, '测试荣誉1', 0, 0, '', '', './Public/Uploads/2016-04-28/5720e25f1d53e.jpg', '&lt;p&gt;测试荣誉1测试荣誉1测试荣誉1&lt;/p&gt;', '', '', 0, 80, 1461772895),
(19, '测试荣誉2', 0, 0, '', '', './Public/Uploads/2016-04-28/5720e284db8d7.jpg', '&lt;p&gt;测试荣誉2测试荣誉2测试荣誉2测试荣誉2测试荣誉2测试荣誉2&lt;/p&gt;', '', '', 0, 80, 1461772932),
(20, '荣誉3', 0, 0, '', '', './Public/Uploads/2016-04-28/5720e29cd839b.jpg', '&lt;p&gt;荣誉3荣誉3荣誉3荣誉3&lt;/p&gt;', '', '', 0, 80, 1461772956),
(21, '招聘设计师', 2, 0, '3', '', '', '', '', '01、收集和分析用户界面需求；&lt;br&gt;\r\n02、结合用户体验及技术可行性确定线框图；&lt;br&gt;\r\n03、将线框图设计为平面效果图；&lt;br&gt;\r\n04、跟踪开发和测试；&lt;br&gt;\r\n05、根据数据分析，对页面进行优化。&lt;br&gt;', 0, 85, 1461773834),
(22, 'php工程师', 2, 0, '10', '', '', '', '', '1、收集和分析用户界面需求1；\r\n2、结合用户体验及技术可行性确定线框图2；\r\n3、将线框图设计为平面效果图3；\r\n4、跟踪开发和测试4；\r\n5、根据数据分析，对页面进行优化5。', 0, 85, 1461773597),
(23, '招聘前端', 2, 0, '4', '', '', '', '', '1、收集和分析用户界面需求；\r\n2、结合用户体验及技术可行性确定线框图；\r\n3、将线框图设计为平面效果图；\r\n4、跟踪开发和测试；\r\n5、根据数据分析，对页面进行优化。', 0, 85, 1461773624),
(24, '费用说明测试文章1', 0, 0, '', '', '', '&lt;p&gt;费用说明测试文章1费用说明测试文章1&lt;/p&gt;', '', '', 0, 91, 1462463649),
(25, '费用说明测试文章2', 0, 0, '', '', '', '&lt;p&gt;费用说明测试文章2费用说明测试文章2费用说明测试文章2&lt;/p&gt;', '', '', 0, 91, 1462463677),
(26, '费用说明测试文章3', 0, 0, '', '', '', '&lt;p&gt;费用说明测试文章3费用说明测试文章3费用说明测试文章3费用说明测试文章3费用说明测试文章3费用说明测试文章3费用说明测试文章3费用说明测试文章3&lt;/p&gt;', '', '', 0, 91, 1462463699),
(27, '费用说明测试文章4', 0, 0, '', '', '', '&lt;p&gt;费用说明测试文章4费用说明测试文章4费用说明测试文章4费用说明测试文章4&lt;/p&gt;', '', '', 0, 91, 1462463716),
(28, '费用说明测试文章5', 0, 0, '', '', '', '&lt;p&gt;费用说明测试文章5费用说明测试文章5费用说明测试文章5费用说明测试文章5费用说明测试文章5费用说明测试文章5费用说明测试文章5费用说明测试文章5费用说明测试文章5费用说明测试文章5费用说明测试文章5费用说明测试文章5费用说明测试文章5费用说明测试文章5费用说明测试文章5&lt;/p&gt;', '', '', 0, 91, 1462463744),
(29, '费用说明测试文章6', 0, 0, '', '', '', '&lt;p&gt;费用说明测试文章6费用说明测试文章6费用说明测试文章6费用说明测试文章6费用说明测试文章6费用说明测试文章6费用说明测试文章6费用说明测试文章6费用说明测试文章6费用说明测试文章6费用说明测试文章6费用说明测试文章6&lt;/p&gt;', '', '', 0, 91, 1462463765),
(30, '费用说明测试文章7', 0, 0, '', '', '', '&lt;p&gt;费用说明测试文章7费用说明测试文章7费用说明测试文章7费用说明测试文章7费用说明测试文章7费用说明测试文章7费用说明测试文章7费用说明测试文章7费用说明测试文章7费用说明测试文章7费用说明测试文章7费用说明测试文章7费用说明测试文章7&lt;/p&gt;', '', '', 0, 91, 1462463783),
(31, '车辆展示1', 0, 0, '', '', './Public/Uploads/2016-05-06/572c25f280ede.jpg', '&lt;p&gt;车辆展示1车辆展示1车辆展示1车辆展示1车辆展示1&lt;/p&gt;', '', '', 0, 93, 1462511090),
(32, '车辆展示2', 0, 0, '', '', './Public/Uploads/2016-05-06/572c260d27369.jpg', '&lt;p&gt;车辆展示2车辆展示2车辆展示2车辆展示2&lt;/p&gt;', '', '', 0, 93, 1462511117),
(33, '车辆展示3', 0, 0, '', '', './Public/Uploads/2016-05-06/572c262a12607.jpg', '&lt;p&gt;车辆展示3车辆展示3&lt;/p&gt;', '', '', 0, 93, 1462511146),
(34, '车辆展示4', 0, 0, '', '', './Public/Uploads/2016-05-06/572c2644de5d6.jpg', '&lt;p&gt;车辆展示3车辆展示3车辆展示3&lt;/p&gt;', '', '', 0, 93, 1462511172),
(35, '车辆展示5', 0, 0, '', '', './Public/Uploads/2016-05-06/572c265c62ab5.jpg', '&lt;p&gt;车辆展示5车辆展示5车辆展示5车辆展示5车辆展示5&lt;/p&gt;', '', '', 0, 93, 1462511196);

-- --------------------------------------------------------

--
-- 表的结构 `cs_cate`
--

CREATE TABLE IF NOT EXISTS `cs_cate` (
  `id` mediumint(5) NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `type` tinyint(1) DEFAULT '1',
  `pc` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否是pc端栏目',
  `class` tinyint(1) NOT NULL DEFAULT '1' COMMENT '//栏目级别',
  `sort` mediumint(5) DEFAULT '50',
  `pic` varchar(255) DEFAULT NULL,
  `content` text NOT NULL,
  `keywords` varchar(60) DEFAULT NULL,
  `des` varchar(255) DEFAULT NULL,
  `parentid` mediumint(5) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=gbk;

--
-- 转存表中的数据 `cs_cate`
--

INSERT INTO `cs_cate` (`id`, `name`, `type`, `pc`, `class`, `sort`, `pic`, `content`, `keywords`, `des`, `parentid`) VALUES
(67, '关于我们', 2, 1, 1, 1, NULL, '&lt;p&gt;关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们&lt;/p&gt;&lt;p&gt;&lt;img alt=&quot;3235ac20f8f58f91831c93c0580e7a3a.jpg&quot; src=&quot;/ueditor/php/upload/image/20160428/1461858352351741.jpg&quot; title=&quot;1461858352351741.jpg&quot;/&gt;&lt;/p&gt;', '', '', 0),
(68, '车辆展示', 5, 1, 1, 2, NULL, '', '', '', 0),
(69, '新闻资讯', 1, 1, 1, 3, NULL, '', '', '', 0),
(70, '主要车型', 5, 1, 1, 4, NULL, '', '', '', 0),
(71, '热门车型', 5, 1, 2, 50, NULL, '', '', '', 68),
(72, '豪华车型', 5, 1, 2, 50, NULL, '', '', '', 68),
(73, '小车型', 5, 1, 2, 50, NULL, '', '', '', 68),
(74, '紧凑车型', 5, 1, 2, 50, NULL, '', '', '', 68),
(75, '大众', 5, 1, 3, 50, NULL, '', '', '', 71),
(76, '寒假班', 5, 1, 3, 50, NULL, '', '', '', 71),
(77, '宝马', 5, 1, 3, 50, NULL, '', '', '', 72),
(78, '奔驰', 5, 1, 3, 50, NULL, '', '', '', 72),
(79, '测试新闻', 1, 1, 2, 50, NULL, '', '', '', 69),
(80, '资质荣誉', 6, 1, 1, 5, NULL, '', '', '', 0),
(81, '测试新闻2', 1, 1, 2, 50, NULL, '', '', '', 69),
(82, '测试三级1', 1, 1, 3, 50, NULL, '', '', '', 79),
(83, '测试三级2', 1, 1, 3, 50, NULL, '', '', '', 79),
(84, '租车须知', 2, 1, 1, 6, NULL, '&lt;p&gt;租车须知租车须知租车须知租车须知租车须知租车须知&lt;/p&gt;', '', '', 0),
(85, '人才招聘', 4, 1, 1, 7, NULL, '', '', '', 0),
(86, '在线留言', 3, 1, 1, 8, NULL, '', '', '', 0),
(87, '联系我们', 2, 1, 1, 9, NULL, '&lt;p&gt;&lt;img src=&quot;http://api.map.baidu.com/staticimage?center=116.450111,39.927669&amp;zoom=13&amp;width=530&amp;height=340&amp;markers=116.450111,39.927669&quot; height=&quot;340&quot; width=&quot;530&quot;/&gt;&lt;/p&gt;', '', '', 0),
(88, '公司简介', 2, 0, 1, 10, NULL, '&lt;p&gt;关于我们关于我们关于我们&lt;/p&gt;', '', '', 0),
(89, '如何租车', 2, 0, 1, 11, NULL, '&lt;p&gt;如何租车如何租车如何租车如何租车如何租车如何租车如何租车如何租车如何租车如何租车如何租车如何租车如何租车如何租车如何租车如何租车如何租车如何租车如何租车如何租车如何租车如何租车如何租车如何租车如何租车如何租车如何租车如何租车如何租车如何租车如何租车&lt;/p&gt;', '', '', 0),
(90, '如何还车', 2, 0, 1, 12, NULL, '&lt;p&gt;如何还车如何还车如何还车如何还车如何还车如何还车如何还车如何还车如何还车如何还车如何还车如何还车如何还车如何还车如何还车&lt;/p&gt;', '', '', 0),
(91, '费用说明', 1, 0, 1, 13, NULL, '', '', '', 0),
(92, '优惠活动', 5, 0, 1, 14, NULL, '', '', '', 0),
(93, '展示车辆', 5, 0, 1, 15, NULL, '', '', '', 0),
(94, '车辆保养', 1, 0, 1, 16, NULL, '', '', '', 0),
(95, '联系方式', 2, 0, 1, 17, NULL, '&lt;p&gt;联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们&lt;/p&gt;', '', '', 0),
(96, '招聘人才', 2, 0, 1, 18, NULL, '&lt;p&gt;招聘招聘招聘招聘招聘招聘招聘招聘招聘招聘招聘招聘招聘招聘招聘&lt;/p&gt;', '', '', 0),
(97, '客户评价', 3, 0, 1, 19, NULL, '                                                                    ', '', '', 0);

-- --------------------------------------------------------

--
-- 表的结构 `cs_idc`
--

CREATE TABLE IF NOT EXISTS `cs_idc` (
  `id` int(11) NOT NULL,
  `album_id` int(11) DEFAULT NULL,
  `name` varchar(64) NOT NULL,
  `desc` text,
  `region` varchar(64) DEFAULT NULL,
  `zone` varchar(64) DEFAULT NULL,
  `location` varchar(128) DEFAULT NULL,
  `is_hot` tinyint(1) NOT NULL DEFAULT '1',
  `create_time` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `cs_idc`
--

INSERT INTO `cs_idc` (`id`, `album_id`, `name`, `desc`, `region`, `zone`, `location`, `is_hot`, `create_time`, `status`) VALUES
(1, 1, '香港', '', 'Asia', '香港', '香港', 1, 1471857664, 1),
(3, 1, '台湾', '', 'Asia', '台湾', '台湾', 1, 1471857664, 1),
(4, 1, '新加坡', '', 'Asia', '新加坡', '', 1, 1471857664, 1),
(5, 1, '马来西亚', '', 'Asia', '马来西亚', '', 0, 1471857664, 1),
(6, 1, '菲律宾', '', 'Asia', '菲律宾', '', 0, 1471857664, 1),
(7, 1, '越南', '', 'Asia', '越南', '', 0, 1471857664, 1),
(8, 1, '泰国', '', 'Asia', '泰国', '', 0, 1471857664, 1),
(9, 1, '柬埔寨', '', 'Asia', '柬埔寨', '', 0, 1471857664, 1),
(10, 1, '美国', '', 'Western', '美国', '', 1, 1471857664, 1),
(11, 1, '英国', '', 'Western', '英国', '', 0, 1471857664, 1),
(12, 1, '俄罗斯', '', 'Western', '俄罗斯', '', 0, 1471857664, 1),
(13, 1, '荷兰', '', 'Western', '荷兰', '', 0, 1471857664, 1),
(14, 1, '德国', '', 'Western', '德国', '', 0, 1471857664, 1);

-- --------------------------------------------------------

--
-- 表的结构 `cs_images`
--

CREATE TABLE IF NOT EXISTS `cs_images` (
  `id` int(11) UNSIGNED NOT NULL,
  `album_id` int(11) UNSIGNED NOT NULL,
  `title` varchar(64) DEFAULT NULL,
  `desc` varchar(255) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `size` int(11) UNSIGNED DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `relate_page` varchar(45) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='图片资源';

--
-- 转存表中的数据 `cs_images`
--

INSERT INTO `cs_images` (`id`, `album_id`, `title`, `desc`, `path`, `size`, `create_time`, `relate_page`) VALUES
(1, 2, 'banner1', '', '2016-08-22/57bac4005bee7.jpg', 610181, 1471857664, ''),
(2, 2, 'banner2', '', '2016-08-22/57bac415d5fca.jpg', 259815, 1471857685, ''),
(3, 2, 'banner3', '', '2016-08-22/57bac42985968.jpg', 424979, 1471922346, '');
-- --------------------------------------------------------

--
-- 表的结构 `cs_job`
--

CREATE TABLE IF NOT EXISTS `cs_job` (
  `id` int(5) NOT NULL,
  `title` varchar(30) NOT NULL,
  `name` varchar(30) NOT NULL,
  `sex` varchar(10) NOT NULL DEFAULT '男',
  `nation` varchar(30) NOT NULL COMMENT '民族',
  `age` varchar(15) NOT NULL COMMENT '生日',
  `marry` varchar(10) NOT NULL DEFAULT '未婚',
  `child` varchar(10) NOT NULL DEFAULT '无' COMMENT '有无子女',
  `bplace` varchar(20) NOT NULL COMMENT '籍贯',
  `address` varchar(100) NOT NULL COMMENT '户口所在地',
  `education` varchar(20) NOT NULL COMMENT '学历',
  `foreign` varchar(150) NOT NULL COMMENT '外语语种及程度',
  `mobile` varchar(15) NOT NULL,
  `email` varchar(20) NOT NULL,
  `idnums` varchar(30) NOT NULL COMMENT '身份证号',
  `address_now` varchar(255) NOT NULL COMMENT '住址',
  `slim` varchar(20) NOT NULL COMMENT '可到职日期',
  `content` text NOT NULL COMMENT '备注'
) ENGINE=MyISAM DEFAULT CHARSET=gbk;

--
-- 转存表中的数据 `cs_job`
--

INSERT INTO `cs_job` (`id`, `title`, `name`, `sex`, `nation`, `age`, `marry`, `child`, `bplace`, `address`, `education`, `foreign`, `mobile`, `email`, `idnums`, `address_now`, `slim`, `content`) VALUES
(1, '招聘前端', '中国', '男', '蒙古族', '', '未婚', '', '', '', '硕士', '', '', '', '', '', '随时', ''),
(5, 'php工程师', '童攀', '男', '蒙古族', '', '', '有', '北京市', '天津市', '博士', '', '13781652589', '', '', '', '随时', ''),
(6, 'php工程师', '童攀', '男', '汉族', '1990-03-06', '未婚', '有', '天津市', '北京市', '博士', '英语', '13781652457', 'tongpan@163.com', '411425199002259159', '北京朝阳区', '1周内', '这里是我的个人介绍\r\n这里是我的个人介绍\r\n这里是我的个人介绍\r\n这里是我的个人介绍这里是我的个人介绍');

-- --------------------------------------------------------

--
-- 表的结构 `cs_link`
--

CREATE TABLE IF NOT EXISTS `cs_link` (
  `id` smallint(5) NOT NULL,
  `title` varchar(30) NOT NULL,
  `url` varchar(60) NOT NULL,
  `des` varchar(255) NOT NULL,
  `sort` mediumint(5) NOT NULL DEFAULT '50'
) ENGINE=MyISAM DEFAULT CHARSET=gbk;

--
-- 转存表中的数据 `cs_link`
--

INSERT INTO `cs_link` (`id`, `title`, `url`, `des`, `sort`) VALUES
(5, '360', 'http://www.360.cn', 'http://www.baidu.com', 1),
(7, '百度', 'http://www.baidu.com', '', 2);

-- --------------------------------------------------------

--
-- 表的结构 `cs_message`
--

CREATE TABLE IF NOT EXISTS `cs_message` (
  `id` mediumint(5) NOT NULL,
  `nickname` varchar(20) NOT NULL,
  `telephone` varchar(15) NOT NULL,
  `email` varchar(20) NOT NULL,
  `content` text NOT NULL,
  `checked` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否通过审核',
  `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1pc端发布0移动端发布',
  `time` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=gbk;

--
-- 转存表中的数据 `cs_message`
--

INSERT INTO `cs_message` (`id`, `nickname`, `telephone`, `email`, `content`, `checked`, `type`, `time`) VALUES
(14, '手机留言', '', '', '手机留言手机留言手机留言手机留言手机留言手机留言', 1, 0, 0),
(15, '手机留言2', '', '', '手机留言2手机留言2手机留言2', 1, 0, 0),
(16, '手机留言3', '', '', '手机留言3手机留言3手机留言3手机留言3', 1, 0, 0),
(17, '新增留言测试', '', '', '新增留言测试新增留言测试新增留言测试', 1, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `cs_news`
--

CREATE TABLE IF NOT EXISTS `cs_news` (
  `id` int(5) NOT NULL,
  `title` varchar(40) NOT NULL,
  `summary` varchar(40) NOT NULL,
  `category` varchar(40) NOT NULL,
  `author` varchar(20) DEFAULT NULL,
  `imgUrl` varchar(100) DEFAULT NULL,
  `content` text NOT NULL,
  `keywords` varchar(60) DEFAULT NULL,
  `create_time` int(11) NOT NULL  
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `cs_privilege`
--

CREATE TABLE IF NOT EXISTS `cs_privilege` (
  `id` mediumint(5) NOT NULL,
  `pri_name` varchar(20) NOT NULL COMMENT '//权限名称',
  `mname` varchar(20) NOT NULL COMMENT '//模块名称',
  `cname` varchar(20) NOT NULL COMMENT '//控制器名称',
  `aname` varchar(20) NOT NULL COMMENT '//方法名称',
  `parentid` mediumint(5) NOT NULL DEFAULT '0' COMMENT '//上级权限的id'
) ENGINE=MyISAM DEFAULT CHARSET=gbk;

--
-- 转存表中的数据 `cs_privilege`
--

INSERT INTO `cs_privilege` (`id`, `pri_name`, `mname`, `cname`, `aname`, `parentid`) VALUES
(22, '文章添加', 'Admin', 'Article', 'add', 21),
(18, '栏目管理', 'Admin', 'Cate', 'lst', 17),
(19, '栏目添加', 'Admin', 'Cate', 'add', 18),
(20, '栏目删除', 'Admin', 'Cate', 'del', 18),
(17, '常用操作', 'admin', 'cycz', 'cycz', 0),
(21, '文章管理', 'Admin', 'Article', 'lst', 17),
(23, '文章修改', 'Admin', 'Article', 'edit', 21),
(24, '友情链接管理', 'Admin', 'Link', 'lst', 17),
(25, '友情链接添加', 'Admin', 'Link', 'add', 24),
(26, '友情链接删除', 'Admin', 'Link', 'del', 24),
(27, '友情链接批量删除', 'Admin', 'Link', 'bdel', 24),
(28, '栏目批量删除', 'Admin', 'Cate', 'bdel', 18),
(29, '文章批量删除', 'Admin', 'Article', 'bdel', 21),
(30, '系统管理', 'Admin', 'Admin', 'system', 0),
(31, '系统设置', 'Admin', 'System', 'lst', 30),
(32, '管理员管理', 'Admin', 'Admin', 'lst', 30),
(33, '管理员添加', 'Admin', 'Admin', 'add', 32),
(34, '管理员删除', 'Admin', 'Admin', 'del', 32),
(35, '管理员批量删除', 'Admin', 'Admin', 'bdel', 32),
(36, '管理员修改', 'Admin', 'Admin', 'edit', 32),
(37, '链接批量更新', 'Admin', 'Link', 'sortlink', 24);

-- --------------------------------------------------------

--
-- 表的结构 `cs_product`
--

CREATE TABLE IF NOT EXISTS `cs_product` (
  `id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `type` varchar(64) NOT NULL,
  `desc` varchar(255) DEFAULT NULL,
  `idc_id` int(11) NOT NULL,
  `ip` int(11) NOT NULL,
  `price_month` varchar(64) DEFAULT NULL,
  `price_year` varchar(64) DEFAULT NULL,
  `cpu` varchar(64) NOT NULL,
  `memory` varchar(64) NOT NULL,
  `disk` varchar(64) NOT NULL,
  `suitable` varchar(64) DEFAULT NULL,
  `bandwidth` varchar(64) DEFAULT NULL,
  `create_time` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `recommend` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `cs_product`
--

INSERT INTO `cs_product` (`id`, `name`, `type`, `desc`, `idc_id`, `ip`, `price_month`, `price_year`, `cpu`, `memory`, `disk`, `suitable`, `bandwidth`, `create_time`, `status`, `recommend`) VALUES
(1, '影云A型', 'vm', '', 1, 1, '170', NULL, '1 core', '1 GB', '30 GB', '网络游戏，大数据营销', '2 M', 1471922346, 1, 1),
(2, '影云S型', 'vm', '最抢手', 1, 1, '280', NULL, '2 core', '2 GB', '60 GB', '外贸网站，电商网站', '3 M', 1471922346, 1, 0),
(3, '影云X型', 'vm', '', 1, 1, '298', NULL, '4 core', '8 GB', '300 GB', '跨境金融，Saas服务', '5 M', 1471922346, 1, 0),
(4, '影云Y型', 'vm', '', 1, 1, '380', NULL, '8 core', '16 GB', '500GB', '手机游戏，移动APP', '5 M', 1471922346, 1, 0),
(5, '影云A型', 'vm', '', 3, 1, '170', NULL, '1 core', '1 GB', '30 GB', '网络游戏，大数据营销', '2 M', 1471922346, 1, 0),
(6, '影云S型', 'vm', '最抢手', 3, 1, '280', NULL, '2 core', '2 GB', '60 GB', '外贸网站，电商网站', '3 M', 1471922346, 1, 0),
(7, '影云X型', 'vm', '', 3, 1, '298', NULL, '4 core', '8 GB', '300 GB', '跨境金融，Saas服务', '5 M', 1471922346, 1, 1),
(8, '影云Y型', 'vm', '', 3, 1, '380', NULL, '8 core', '16 GB', '500GB', '手机游戏，移动APP', '5 M', 1471922346, 1, 0),
(9, '影云A型', 'vm', '', 4, 1, '170', NULL, '1 core', '1 GB', '30 GB', '网络游戏，大数据营销', '2 M', 1471922346, 1, 1),
(10, '影云S型', 'vm', '最抢手', 4, 1, '280', NULL, '2 core', '2 GB', '60 GB', '外贸网站，电商网站', '3 M', 1471922346, 1, 0),
(11, '影云X型', 'vm', '', 4, 1, '298', NULL, '4 core', '8 GB', '300 GB', '跨境金融，Saas服务', '5 M', 1471922346, 1, 0),
(12, '影云Y型', 'vm', '', 4, 1, '380', NULL, '8 core', '16 GB', '500GB', '手机游戏，移动APP', '5 M', 1471922346, 1, 0),
(13, '影云A型', 'vm', '', 5, 1, '170', NULL, '1 core', '1 GB', '30 GB', '网络游戏，大数据营销', '2 M', 1471922346, 1, 0),
(14, '影云S型', 'vm', '最抢手', 5, 1, '280', NULL, '2 core', '2 GB', '60 GB', '外贸网站，电商网站', '3 M', 1471922346, 1, 0),
(15, '影云X型', 'vm', '', 5, 1, '298', NULL, '4 core', '8 GB', '300 GB', '跨境金融，Saas服务', '5 M', 1471922346, 1, 0),
(16, '影云Y型', 'vm', '', 5, 1, '380', NULL, '8 core', '16 GB', '500GB', '手机游戏，移动APP', '5 M', 1471922346, 1, 0),
(17, '影云A型', 'vm', '', 6, 1, '170', NULL, '1 core', '1 GB', '30 GB', '网络游戏，大数据营销', '2 M', 1471922346, 1, 0),
(18, '影云S型', 'vm', '最抢手', 6, 1, '280', NULL, '2 core', '2 GB', '60 GB', '外贸网站，电商网站', '3 M', 1471922346, 1, 0),
(19, '影云X型', 'vm', '', 6, 1, '298', NULL, '4 core', '8 GB', '300 GB', '跨境金融，Saas服务', '5 M', 1471922346, 1, 0),
(20, '影云Y型', 'vm', '', 6, 1, '380', NULL, '8 core', '16 GB', '500GB', '手机游戏，移动APP', '5 M', 1471922346, 1, 0),
(21, '影云A型', 'vm', '', 7, 1, '170', NULL, '1 core', '1 GB', '30 GB', '网络游戏，大数据营销', '2 M', 1471922347, 1, 0),
(22, '影云S型', 'vm', '最抢手', 7, 1, '280', NULL, '2 core', '2 GB', '60 GB', '外贸网站，电商网站', '3 M', 1471922347, 1, 0),
(23, '影云X型', 'vm', '', 7, 1, '298', NULL, '4 core', '8 GB', '300 GB', '跨境金融，Saas服务', '5 M', 1471922347, 1, 0),
(24, '影云Y型', 'vm', '', 7, 1, '380', NULL, '8 core', '16 GB', '500GB', '手机游戏，移动APP', '5 M', 1471922347, 1, 0),
(25, '影云A型', 'vm', '', 8, 1, '170', NULL, '1 core', '1 GB', '30 GB', '网络游戏，大数据营销', '2 M', 1471922348, 1, 0),
(26, '影云S型', 'vm', '最抢手', 8, 1, '280', NULL, '2 core', '2 GB', '60 GB', '外贸网站，电商网站', '3 M', 1471922348, 1, 0),
(27, '影云X型', 'vm', '', 8, 1, '298', NULL, '4 core', '8 GB', '300 GB', '跨境金融，Saas服务', '5 M', 1471922348, 1, 0),
(28, '影云Y型', 'vm', '', 8, 1, '380', NULL, '8 core', '16 GB', '500GB', '手机游戏，移动APP', '5 M', 1471922348, 1, 0),
(29, '影云A型', 'vm', '', 9, 1, '170', NULL, '1 core', '1 GB', '30 GB', '网络游戏，大数据营销', '2 M', 1471922349, 1, 0),
(30, '影云S型', 'vm', '最抢手', 9, 1, '280', NULL, '2 core', '2 GB', '60 GB', '外贸网站，电商网站', '3 M', 1471922349, 1, 0),
(31, '影云X型', 'vm', '', 9, 1, '298', NULL, '4 core', '8 GB', '300 GB', '跨境金融，Saas服务', '5 M', 1471922349, 1, 0),
(32, '影云Y型', 'vm', '', 9, 1, '380', NULL, '8 core', '16 GB', '500GB', '手机游戏，移动APP', '5 M', 1471922349, 1, 0),
(33, '影云A型', 'vm', '', 10, 1, '170', NULL, '1 core', '1 GB', '30 GB', '网络游戏，大数据营销', '2 M', 1471922349, 1, 0),
(34, '影云S型', 'vm', '最抢手', 10, 1, '280', NULL, '2 core', '2 GB', '60 GB', '外贸网站，电商网站', '3 M', 1471922349, 1, 2),
(35, '影云X型', 'vm', '', 10, 1, '298', NULL, '4 core', '8 GB', '300 GB', '跨境金融，Saas服务', '5 M', 1471922349, 1, 0),
(36, '影云Y型', 'vm', '', 10, 1, '380', NULL, '8 core', '16 GB', '500GB', '手机游戏，移动APP', '5 M', 1471922349, 1, 0),
(37, '影云A型', 'vm', '', 11, 1, '170', NULL, '1 core', '1 GB', '30 GB', '网络游戏，大数据营销', '2 M', 1471922349, 1, 0),
(38, '影云S型', 'vm', '最抢手', 11, 1, '280', NULL, '2 core', '2 GB', '60 GB', '外贸网站，电商网站', '3 M', 1471922349, 1, 0),
(39, '影云X型', 'vm', '', 11, 1, '298', NULL, '4 core', '8 GB', '300 GB', '跨境金融，Saas服务', '5 M', 1471922349, 1, 0),
(40, '影云Y型', 'vm', '', 11, 1, '380', NULL, '8 core', '16 GB', '500GB', '手机游戏，移动APP', '5 M', 1471922349, 1, 0),
(41, '影云A型', 'vm', '', 12, 1, '170', NULL, '1 core', '1 GB', '30 GB', '网络游戏，大数据营销', '2 M', 1471922349, 1, 0),
(42, '影云S型', 'vm', '最抢手', 12, 1, '280', NULL, '2 core', '2 GB', '60 GB', '外贸网站，电商网站', '3 M', 1471922349, 1, 0),
(43, '影云X型', 'vm', '', 12, 1, '298', NULL, '4 core', '8 GB', '300 GB', '跨境金融，Saas服务', '5 M', 1471922349, 1, 0),
(44, '影云Y型', 'vm', '', 12, 1, '380', NULL, '8 core', '16 GB', '500GB', '手机游戏，移动APP', '5 M', 1471922349, 1, 0),
(45, '影云A型', 'vm', '', 13, 1, '170', NULL, '1 core', '1 GB', '30 GB', '网络游戏，大数据营销', '2 M', 1471922349, 1, 0),
(46, '影云S型', 'vm', '最抢手', 13, 1, '280', NULL, '2 core', '2 GB', '60 GB', '外贸网站，电商网站', '3 M', 1471922349, 1, 0),
(47, '影云X型', 'vm', '', 13, 1, '298', NULL, '4 core', '8 GB', '300 GB', '跨境金融，Saas服务', '5 M', 1471922349, 1, 0),
(48, '影云Y型', 'vm', '', 13, 1, '380', NULL, '8 core', '16 GB', '500GB', '手机游戏，移动APP', '5 M', 1471922349, 1, 0),
(49, '影云A型', 'vm', '', 14, 1, '170', NULL, '1 core', '1 GB', '30 GB', '网络游戏，大数据营销', '2 M', 1471922349, 1, 0),
(50, '影云S型', 'vm', '最抢手', 14, 1, '280', NULL, '2 core', '2 GB', '60 GB', '外贸网站，电商网站', '3 M', 1471922349, 1, 0),
(51, '影云X型', 'vm', '', 14, 1, '298', NULL, '4 core', '8 GB', '300 GB', '跨境金融，Saas服务', '5 M', 1471922349, 1, 0),
(52, '影云Y型', 'vm', '', 14, 1, '380', NULL, '8 core', '16 GB', '500GB', '手机游戏，移动APP', '5 M', 1471922349, 1, 0),

(53, '基础A型', 'host', NULL, 1, 2, '1539', NULL, '1 x E5520', '4GB DDR3', '500GB 企业级SATA', NULL, '3Mbps独享国际带宽', 0, 1, 1),
(54, '热门B型', 'host', '最抢手', 1, 2, '2099', NULL, '1 x E3-1220 v3', '8GB DDR3', '1  TB 企业级SATA', NULL, '5 Mbps独享国际带宽', 0, 1, 1),
(55, '超值C型', 'host', NULL, 1, 2, '1539', NULL, '1 x E5620', '8GB DDR3', '1 TB 企业级SATA', NULL, '10 Mbps独享国际带宽', 0, 1, 0),
(56, '商务D型', 'host', NULL, 1, 2, '2299', NULL, '2 x E5-2620 v3', '32GB DDR3', '2 x 2T 企业级SATA', NULL, '10Mbps独享国际带宽', 0, 1, 0),

(57, '基础A型', 'host', NULL, 4, 2, '1539', NULL, '1 x E5520', '4GB DDR3', '500GB 企业级SATA', NULL, '3Mbps独享国际带宽', 0, 1, 0),
(58, '热门B型', 'host', '最抢手', 4, 2, '2099', NULL, '1 x E3-1220 v3', '8GB DDR3', '1  TB 企业级SATA', NULL, '5 Mbps独享国际带宽', 0, 1, 1),
(59, '超值C型', 'host', NULL, 4, 2, '1539', NULL, '1 x E5620', '8GB DDR3', '1 TB 企业级SATA', NULL, '10 Mbps独享国际带宽', 0, 1, 0),
(60, '商务D型', 'host', NULL, 4, 2, '2299', NULL, '2 x E5-2620 v3', '32GB DDR3', '2 x 2T 企业级SATA', NULL, '10Mbps独享国际带宽', 0, 1, 0),

(61, '基础A型', 'host', NULL, 10, 2, '1539', NULL, '1 x E5520', '4GB DDR3', '500GB 企业级SATA', NULL, '3Mbps独享国际带宽', 0, 1, 0),
(62, '热门B型', 'host', '最抢手', 10, 2, '2099', NULL, '1 x E3-1220 v3', '8GB DDR3', '1  TB 企业级SATA', NULL, '5 Mbps独享国际带宽', 0, 1, 0),
(63, '超值C型', 'host', NULL, 10, 2, '1539', NULL, '1 x E5620', '8GB DDR3', '1 TB 企业级SATA', NULL, '10 Mbps独享国际带宽', 0, 1, 0),
(64, '商务D型', 'host', NULL, 10, 2, '2299', NULL, '2 x E5-2620 v3', '32GB DDR3', '2 x 2T 企业级SATA', NULL, '10Mbps独享国际带宽', 0, 1, 1);


-- --------------------------------------------------------

--
-- 表的结构 `cs_reply`
--

CREATE TABLE IF NOT EXISTS `cs_reply` (
  `id` int(5) NOT NULL,
  `content` varchar(255) NOT NULL,
  `mid` mediumint(5) NOT NULL,
  `time` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=gbk;

--
-- 转存表中的数据 `cs_reply`
--

INSERT INTO `cs_reply` (`id`, `content`, `mid`, `time`) VALUES
(19, '谢谢留言', 14, 1462526670),
(20, '测试回复', 15, 1462526716),
(18, '感谢您的支持', 14, 1462526659);

-- --------------------------------------------------------

--
-- 表的结构 `cs_role`
--

CREATE TABLE IF NOT EXISTS `cs_role` (
  `id` mediumint(5) NOT NULL,
  `rolename` varchar(20) NOT NULL,
  `pri_id_list` varchar(60) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=gbk;

--
-- 转存表中的数据 `cs_role`
--

INSERT INTO `cs_role` (`id`, `rolename`, `pri_id_list`) VALUES
(1, '超级管理员', '*'),
(6, '栏目管理员', '17,18,19,20'),
(7, '文章管理员', '17,21,22,23'),
(8, '友情链接管理员', '17,24,25,26,27,37'),
(9, '管理员', '17,18,19,20,21,22,23,24,25,26,27');

-- --------------------------------------------------------

--
-- 表的结构 `cs_sales`
--

CREATE TABLE IF NOT EXISTS `cs_sales` (
  `id` smallint(5) NOT NULL,
  `name` varchar(60) NOT NULL,
  `duty` varchar(60) NOT NULL,
  `qq` varchar(30) NOT NULL,
  `tel` varchar(20) NOT NULL,
  `sort` mediumint(5) NOT NULL DEFAULT '50'
) ENGINE=MyISAM DEFAULT CHARSET=gbk;

--
-- 转存表中的数据 `cs_sales`
--

INSERT INTO `cs_sales` (`id`, `name`, `duty`, `qq`, `tel`, `sort`) VALUES
(1, 'Martin', ' 商务合作', '136969203', '13188889999', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cs_admin`
--
ALTER TABLE `cs_admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cs_album`
--
ALTER TABLE `cs_album`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cs_article`
--
ALTER TABLE `cs_article`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cs_cate`
--
ALTER TABLE `cs_cate`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cs_idc`
--
ALTER TABLE `cs_idc`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cs_images`
--
ALTER TABLE `cs_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cs_job`
--
ALTER TABLE `cs_job`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cs_link`
--
ALTER TABLE `cs_link`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cs_message`
--
ALTER TABLE `cs_message`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cs_news`
--
ALTER TABLE `cs_news`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cs_privilege`
--
ALTER TABLE `cs_privilege`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cs_product`
--
ALTER TABLE `cs_product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cs_reply`
--
ALTER TABLE `cs_reply`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cs_role`
--
ALTER TABLE `cs_role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cs_sales`
--
ALTER TABLE `cs_sales`
  ADD PRIMARY KEY (`id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `cs_admin`
--
ALTER TABLE `cs_admin`
  MODIFY `id` mediumint(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- 使用表AUTO_INCREMENT `cs_album`
--
ALTER TABLE `cs_album`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- 使用表AUTO_INCREMENT `cs_article`
--
ALTER TABLE `cs_article`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;
--
-- 使用表AUTO_INCREMENT `cs_cate`
--
ALTER TABLE `cs_cate`
  MODIFY `id` mediumint(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=99;
--
-- 使用表AUTO_INCREMENT `cs_idc`
--
ALTER TABLE `cs_idc`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- 使用表AUTO_INCREMENT `cs_images`
--
ALTER TABLE `cs_images`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `cs_job`
--
ALTER TABLE `cs_job`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- 使用表AUTO_INCREMENT `cs_link`
--
ALTER TABLE `cs_link`
  MODIFY `id` smallint(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- 使用表AUTO_INCREMENT `cs_message`
--
ALTER TABLE `cs_message`
  MODIFY `id` mediumint(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- 使用表AUTO_INCREMENT `cs_news`
--
ALTER TABLE `cs_news`
  MODIFY `id` mediumint(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=0;
--
-- 使用表AUTO_INCREMENT `cs_privilege`
--
ALTER TABLE `cs_privilege`
  MODIFY `id` mediumint(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;
--
-- 使用表AUTO_INCREMENT `cs_product`
--
ALTER TABLE `cs_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- 使用表AUTO_INCREMENT `cs_reply`
--
ALTER TABLE `cs_reply`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- 使用表AUTO_INCREMENT `cs_role`
--
ALTER TABLE `cs_role`
  MODIFY `id` mediumint(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- 使用表AUTO_INCREMENT `cs_sales`
--
ALTER TABLE `cs_sales`
  MODIFY `id` smallint(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
