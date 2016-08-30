-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 2016-08-30 03:31:12
-- 服务器版本： 10.1.9-MariaDB
-- PHP Version: 5.6.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mall2`
--

-- --------------------------------------------------------

--
-- 表的结构 `cs_admin`
--

CREATE TABLE `cs_admin` (
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

CREATE TABLE `cs_album` (
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

CREATE TABLE `cs_article` (
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

CREATE TABLE `cs_cate` (
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

CREATE TABLE `cs_idc` (
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

CREATE TABLE `cs_images` (
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

CREATE TABLE `cs_job` (
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

CREATE TABLE `cs_link` (
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

CREATE TABLE `cs_message` (
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

CREATE TABLE `cs_news` (
  `id` mediumint(5) NOT NULL,
  `title` varchar(40) NOT NULL,
  `summary` varchar(40) NOT NULL,
  `category` varchar(40) NOT NULL,
  `author` varchar(20) DEFAULT NULL,
  `imgurl` varchar(100) DEFAULT NULL,
  `content` text NOT NULL,
  `keywords` varchar(60) DEFAULT NULL,
  `create_time` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `cs_news`
--

INSERT INTO `cs_news` (`id`, `title`, `summary`, `category`, `author`, `imgurl`, `content`, `keywords`, `create_time`) VALUES
(2, '租用托管香港服务器之外的第三种选择', '租用香港服务器和托管香港服务器有好有坏，托管服务器能更加容易得到优质的带宽但是前', 'news', 'rmbcloud', 'News/2016-08-29/57c41f7e9fd13.jpg', '&lt;p&gt;租用香港服务器和托管香港服务器有好有坏，托管服务器能更加容易得到优质的带宽但是前期成本会比较高而且不太 安全，租用服务器会很难知道服务器硬件的优劣，同理不太安全且对服务器的控制权比较小，难道就没有第三个选项可以选择吗？当然是有的，除了租用和托管外， 可以直接购买香港云服务器。购买香港云服务器的优点之一是便宜，同时部署时间短，可即时使用，其二是高弹性和扩展性，扩容十分方便，其三则是内置操作台， 购买者可以通过操作台集中统一管理自己的云服务器，完全拥有超级管理员操作系统权限。缺点在于客户会担心其安全问题，不过这种担心，也算得上是服务器界普 遍的担心问题了。&lt;/p&gt;&lt;p&gt;影速科技专门提供海外的云服务器，当然也包括优质的香港云服务器，服务器硬件配置皆采用大品牌，数据中心也是T3/T4级别型，全面的运维服务，简单易控制的操作台，给使用者完全的控制权。如果不想选择租用或者托管香港服务器，何不采用第三种选择，购买影速科技的云服务器呢？影速科技提供免费试用期，无需任何花费就可先行体验云服务器的性能，去官网申请即可。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '水电费', 1472470910),
(3, '台湾云服务器or香港云服务器，选谁？', '云服务器上的多选择性也包含了云节点这一方面——台湾节点、美国节点、菲律宾节点、俄', 'news', 'rmbcloud', 'News/2016-08-29/57c41fd83e6eb.jpg', '&lt;p&gt;云服务器上的多选择性也包含了云节点这一方面——台湾节点、美国节点、菲律宾节点、俄罗斯节点、香港节点、北 京节点等等遍布全球的选择。在拥有云服务器的共同优势下，地点的选择似乎变得有些困难，那么，在拥有相同优势下的台湾和香港两个节点该怎么选呢？有三个因 素影响其选择。&lt;/p&gt;&lt;p&gt;台湾云服务器和香港云服务器除了云服务器上共有的优势，由于地区平和的网络环境，也不需要备案这一环节。那么，影响企业购买香港节点还是台湾节点的首要因素是企业的客户群体在哪里。如果购买者有一个明显的客户群体地点上的明确目标，那么在节点的选择上则无需考虑太多。&lt;/p&gt;&lt;p&gt;如 果购买者没有地点上的限制，只需要无备案和方便访问国外网站的话，那么选择台湾云服务器或者香港云服务器就会有一个延迟和价格上的比较。如果需要考虑延迟 的话，就有一个地理位置上的比较，购买者需要考虑所在地区离香港近还是距离台湾近的问题，这个没法统一来说；从价格上来考虑，由于资源上的多寡问题，香港 的云服务器回比台湾的云服务器稍微便宜一点，因此最终来看，是需要购买者的最终情况来决定的。&lt;/p&gt;&lt;p&gt;如果购买者在选择上有太大困扰的话，售后全面细致的影速科技对每一个客户都会给出价格最合理的节点选择以及配置方案。欢迎各位的咨询。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '台湾云服务器 香港云服务器', 1472471000),
(4, '海外云主机防攻击三部曲', '在数据中心这块，出现的种种问题诸如停电、硬件损坏等这方面故障，并没有太多繁杂的话', 'news', 'rmbcloud', 'News/2016-08-29/57c4201b0c9de.png', '&lt;p&gt;在数据中心这块，出现的种种问题诸如停电、硬件损坏等这方面故障，并没有太多繁杂的话题，而在云安全这一块却 永远都有扯不清的议论点，安全和不安全这个问题更是其中恒久不变的讨论话题。云安全肯定是有的，但是百分之百的安全又一定是言过其实的说法。云服务器的安 全能达到让人放心的程度，这一点的确定，让影速科技一一道来。&lt;/p&gt;&lt;p&gt;第一点，从常规标准来说，云主机是有自身防护系统的。机房出口的大带宽能够防御流量攻击，云平台和机房配备高规格防火墙能抵御恶意攻击，服务器本身的安全策略、修改端口以及设置白名单等等也能充分保证云服务器的安全。&lt;/p&gt;&lt;p&gt;当然，除了自身能防护攻击外，运维方面也是有防护攻击的措施的，这就是第二点。服务器维护建议，服务器操作补丁的更新，配置iptable防火墙，灾备方案、提供阻止入侵方案等既对客户的数据起到一个保护作用，也在云服务器上起到一个增强作用。&lt;/p&gt;&lt;p&gt;第三点则是人工售后的运维，如果网络攻击较小的话，影速科技本身的监控系统可以自动检测并进行异常流量清洗；如果网络攻击过大，技术人员会进行黑洞处理，从而保障服务器安全。&lt;/p&gt;&lt;p&gt;以上重重云安全措施能给客户最放心的保障，同时影速科技也建议客户自己安装防护软件以及封闭不常用的端口。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '海外云主机', 1472471067),
(5, '云负载均衡知多少', '云负载均衡作为云主机专门衍生出来的服务，其流量均衡、自动切换功能更加提高云主机的', 'company', 'rmbcloud', 'News/2016-08-29/57c4204851909.jpg', '&lt;p&gt;云负载均衡作为云主机专门衍生出来的服务，其流量均衡、自动切换功能更加提高云主机的稳定运行。之所以这样 说，是因为云负载均衡能有效解决数据流量过大、网络负荷过重的问题，从而整合资源，避免峰值；而它的自动切换功能则能在数据中心出现断电、宕机等突发状况 快速切换到完好的云主机上，从而保证其正常运转，因此，云负载均衡确能使得云主机更加稳固。&lt;/p&gt;&lt;p&gt;以上是云负载均衡的优点。接下来谈谈云负载均衡的分类方法。&lt;/p&gt;&lt;p&gt;目 前从不同方面来讲，云负载均衡有几种分类方法。一种分类方法将云负载均衡分为四类，即软件负载均衡、硬件负载均衡、本地负载均衡和全局负载均衡。另一种分 类方法则是以功能为依据的细致分法，将云负载均衡分为了循环负载均衡、性能负载均衡和故障转移负载均衡等等。而其它的分类方法也是从云负载均衡不同方面来 进行划分的，其核心内容并未改变，笔者就不在此一一详述。&lt;/p&gt;&lt;p&gt;从 云负载均衡的优点和分类就可以看出，云负载均衡在云计算这一块地位卓然。云负载均衡服务实现多台主机应用程序流量的自动分配，从而实现故障自动切换，提高 资源利用率以及业务可用性。这一服务影速科技在提供云主机的同时也会一同给出。热备切换结合分布式架构，保证了云负载均衡的高可用性，给客户一个更可靠的 云主机。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '云负载均衡', 1472471112),
(6, '跨境金融需要这样的云服务器', '跨境支付，顾名思义，指的是两个或者两个以上国家或者地区之间因国 际贸易、国际投资', 'company', 'rmbcloud', 'News/2016-08-29/57c420f8394a5.jpg', '&lt;p&gt;跨境支付是跨境金融中占比重较大的一部分。跨境支付，顾名思义，指的是两个或者两个以上国家或者地区之间因国 际贸易、国际投资及其他方面所发生的国际间债权债务，借助一定的结算工具和支付系统实现的资金跨国和跨地区转移的行为。现如今，随着越来越多的人走出国 门，跨境金融的需求也变得越来越多元化，如跨境电商、出国留学、海外旅游、移民投资、国际物流等等。而这些金融贸易、跨境支付交易等互联网行业离不开服务 器的支撑。&lt;/p&gt;&lt;p&gt;对许多跨境金融公司来说，云服务器是一个不错的选择。那么，跨境金融需要怎样的云服务器呢？&lt;/p&gt;&lt;p&gt;第 一，云节点上的选择。跨境金融是在两个或者两个以上地区或者国家之间展开的经济行为，因此云服务器在节点的选择上就应该考虑到顾客群体所在地。选择一个节 点多的云服务器提供商，尤其是海外的云服务器提供商，不仅能给金融公司更多的选择，更能为后期拓展金融业务大开方便之门，还能在进击海外市场上占领先机， 算得上是一举三得。&lt;/p&gt;&lt;p&gt;第二，安全上的注意。跨境 金融中，最重要的应该是数据安全方面，因此在云服务器的选择上，就应该更注重云安全。一般来讲，一个像影速科技这样好的云服务器服务商会给出三个大方向上 的安全防护措施。首先是在硬件的配置上，除了机房有防火墙之外，服务器本身应该设置白名单和安全策略，另外就是磁盘阵列做Raid设置，行业标准规定的三重备份；其次是在软件方面，防火墙的设置、在线实时监控装备、端口的修改等等则是你与服务商之间的协调了；最后则是运维上的管理。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '跨境金融', 1472471288),
(7, '海外云服务器与国内云服务器差别盘点', '对于互联网企业来说，决定选用海外云服务器还是国内云服务器无非是跟着企业市场战略来', 'company', 'rmbcloud', 'News/2016-08-29/57c4212ab414a.jpg', '&lt;p&gt;对于互联网企业来说，决定选用海外云服务器还是国内云服务器无非是跟着企业市场战略来走的，互联网企业通常会 将顾客群体和市场拓展范围视为重要考虑因素。通常情况下，互联网企业找云服务器提供商进行咨询时就已经确定好节点的选择，但小编今天还是要在这里说一说海 外云服务器与国内云服务器的差别，好让互联网企业在选择云服务器上有一个更好的了解。当然，这些差别不是配置、带宽、机房等方面的差别，而是从概念上来 讲，两者的不同。&lt;/p&gt;&lt;p&gt;首先，是需不需要备案上的差别。这个差别与网站是否能快速上架之间有着重要的联系。因网络政策的不同，互联网企业使用国内云服务器建站需要进行备案才能合法上线，而使用国外云服务器则不需要备案。当然，互联网企业在国内也可以不进行备案的，但是后果嘛，就只能自己负责了。&lt;/p&gt;&lt;p&gt;其 次，是云服务器线路选择上的差别。想必很多使用国内云服务器的企业都会有一个线路选择上的烦恼，到底是选择单线、双线还是多线呢？这是一个不得不纠结的问 题。而纵观国外的云服务器，则无须在线路上纠结过多。这是国内外网络环境上的不同造成的。在国内，线路有电信和网通之间的不同，因此会有此一纠结点。&lt;/p&gt;&lt;p&gt;最后，是访问地域范围上的差别。这是国内外网络安全策略上的不同造成的。国内服务器只能访问内陆地域，而国外服务器没有访问上的地域限制。&lt;/p&gt;&lt;p&gt;尽管国内外云服务器有以上差别，但是却没有孰优孰劣的分法，从选择上也是以企业需求为先。怎么选择，也可以咨询专门提供云服务器的影速科技，从而为客户提供最合适的选择方案。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '海外云服务器 国内云服务器', 1472471338),
(8, '云服务器多节点有什么好处？', '很多云服务器提供商都要特别表示一下他们的云节点如何如何多，有些甚至宣称遍布世界各', 'internet', 'rmbcloud', 'News/2016-08-29/57c4215ab74d8.png', '&lt;p&gt;很多云服务器提供商都要特别表示一下他们的云节点如何如何多，有些甚至宣称遍布世界各地。节点的建立也是需要 雄厚的资本的，遍布各地可以说是一种夸张式的说法，但是遍布主干带宽资源是可以做到的。为什么大多数云服务器提供商都要表示云节点多？云节点多有什么好 处。下面影速科技的小编告诉你一二。&lt;/p&gt;&lt;p&gt;云节点多 的好处之一是可以体现资源的丰富性，同时能有更多的选择性。资源的丰富代表着服务商的实力，节点多也能给互联网企业更多选择的余地，同时能为互联网后期网 站迁移到其他节点或者开拓其他节点大开方便之门。其好处之二是随时随地获取所需的资源，也能使互联网企业所需要的安全性以及速度更有保障。&lt;/p&gt;&lt;p&gt;影速科技专为互联网企业提供海外云服务器，节点遍及各国主干带宽资源，诸如香港、台湾、马来西亚、越南、菲律宾、美国、俄罗斯、荷兰、德国、英国等等地区云节点。其云节点优质可靠，能给互联网企业最好的选择。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '云服务器多节点', 1472471386),
(9, '为什么越来越多的外贸企业选择美国服务器？', '中国从事外贸出口的企业各行各业非常之多，但在与我们沟通洽谈服务器租用，海外云主机', 'internet', 'rmbcloud', 'News/2016-08-29/57c421bb30989.jpg', '&lt;p&gt;中国从事外贸出口的企业各行各业非常之多，但在与我们沟通洽谈服务器租用，海外云主机业务中发现，超过一半以上选择&lt;strong&gt;美国服务器&lt;/strong&gt;或&lt;strong&gt;美国云主机&lt;/strong&gt;，这是为什么呢？&lt;a href=&quot;http://www.yingsoo.com/&quot;&gt;影速科技&lt;/a&gt;帮您答疑解惑，我们先来看一组数据。&lt;/p&gt;&lt;p style=&quot;text-indent:37px&quot;&gt;据中国海关统计，2014年，中国对美国出口3960亿美元，同比增长6.4%，占同期中国货物出口总额&lt;strong&gt;16.9%&lt;/strong&gt;&lt;strong&gt;，&lt;/strong&gt;产品涉及汽车、机械、初级金属、电脑、电子产品，服装等各个行业&lt;strong&gt;。&lt;/strong&gt;中国仍是美国第二大贸易伙伴、第三大出口市场和第一大进口来源地。据中国商务部统计，截至2014年底，中国企业在美累计各类投资超过385亿美元，美已成为中国对外直接投资的第三大目的地。&lt;/p&gt;&lt;p style=&quot;text-indent:37px&quot;&gt;由此不难看出，首先是市场边贸驱动。&lt;/p&gt;&lt;p style=&quot;text-indent:37px&quot;&gt;我 们再来看美国的IDC和互联网环境。美国是互联网的发展地，全球数据中心，世界上顶尖的数据机房几乎全在美国，比如谷歌爱荷华州数据中心，美国国家超级计 算应用中心（NCSA），DFT数据中心，SuperNAP数据中心等。直连世界各地。美国依托于本身的文化基础，对互联网的政策和法律都非常规范健全， 保留了高度的自由灵活度，只需遵循当地法律法规即可。没有中国政府规定要求的备案，接入审批，ICP备案经营许可等。&lt;/p&gt;&lt;p style=&quot;text-indent:37px&quot;&gt;这里还要提到一点是，美国的互联网出口冠绝全球，只要有需求，可任意扩容到10M，100M，1000M，10G的独享带宽，而且价格也很划算。&lt;/p&gt;&lt;p style=&quot;text-indent:37px&quot;&gt;最 后谈一谈美国服务器的租用市场环境。要租用一台美国服务器或者开通一台美国云主机很简单，几乎不用等待，数分钟内服务器的帐号密码就可以到你邮箱账户了， 以后只需按月及时付款即可。这均取决于完备的服务器网络供应环境和市场竞争环境，其实是服务器在需求确定之前已经早早的放置在数据中心，运维人员只需一个 命令开机即可。影速科技美国云主机为自主平台，高配置稳定集群服务器，15分钟内即可交付客户使用。&lt;/p&gt;&lt;p style=&quot;text-indent:37px&quot;&gt;综上所述，巨大的外贸市场需求，顶尖的互联网基础设施，丰富的网络带宽出口及IP资源，快速的服务器租用响应和售后服务，决定了美国服务器必然成为外贸企业的首选。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '美国服务器', 1472471483),
(10, '美国服务器VS美国云主机VS美国虚拟空间', '美国是世界上服务器租用托管，云计算平台，虚拟空间最成熟健全的市场，所以可选择的服', 'internet', 'rmbcloud', 'News/2016-08-29/57c421f8e40a1.jpg', '&lt;p&gt;美国是世界上服务器租用托管，云计算平台，虚拟空间最成熟健全的市场，所以可选择的服务商很多，不通的服务商可能侧重点不同，客户要依据自身的情况和需求来决定是使用独立服务器，云主机还是虚拟空间。现在我们一起来看看三者的对比：&lt;/p&gt;&lt;p&gt;一看定义&lt;/p&gt;&lt;p&gt;1，美国服务器，美国独立服务器是指整台服务器资源只有一个用户享有，而不会有其他用户使用的服务器。服务器一般采用服务器租用或服务器托管的形式放置于机房中。&lt;/p&gt;&lt;p&gt;2， 美国云主机，从字面上解释就是像云一样的服务器。这里的云是指成千上万台服务器及相关硬件资源的集成。云主机就是一个水龙头，需要多大的水，就可以调节多 大的水量，云主机最大的特点就是按需、弹性计算，配置可升可降。云主机因为是基于成千上万的服务器上的云平台，即使个别服务器有坏损，也不会影响到云平台 的正常运行，不会影响到云主机的正常运行，所以，云主机几乎是百分百稳定的，除非平台下的所有服务器都出了问题&lt;/p&gt;&lt;p&gt;3，美国虚拟主机 ，也叫VPS，全称叫Virtual&amp;nbsp;Private&amp;nbsp;Server 虚拟专用服务器。从字面上看就可以知道，VPS属于虚拟机，只是技术比一般的虚拟机成熟。一台服务器可以逻辑上划分出多个VPS主机，如果VPS主机占用资源比较大，是会连累同物理机上的其他VPS主机的，所以一般的VPS提供服务商不会允许VPS主机跑占用资源的应用。&lt;/p&gt;&lt;p&gt;二看趋势，&lt;/p&gt;&lt;p style=&quot;text-indent:40px&quot;&gt;无论是国内IDC行业还是国际IDC行业，现在的市场环境大致可看到未来独立服务器，云主机与VPS的趋势：&lt;strong&gt;云主机是大趋势，VPS将成为历史，独立服务器仍有不可或缺&lt;/strong&gt;。从国内外互联网巨头亚马逊，阿里巴巴，微软，Google，oracle近几年纷纷定义自己的云计算产品，斥巨资打造云服务平台也可看出行业发展端倪。&lt;/p&gt;&lt;p&gt;三看对比，&lt;/p&gt;&lt;p&gt;云主机与VPS的区别： 1、从技术方面来讲：云主机使用了云计算技术，而云计算技术，整合了计算、网络、存储等各种软件和硬件技术。对于VPS来讲，它只是单纯的使用了虚拟化软件技术，相对于云计算技术的高标准来讲还是比较落后的； 2、从安全性方面来讲：云主机具有天然防ARP攻击和MAC欺骗，快照备份，数据永久不丢失。而VPS则不具有这方面的功能； 3、从可靠性来讲：云主机是基于服务器集群的，因此硬件冗余度较高，故障率低；而VPS则相对来说硬件冗余较少，故障率较高； 4、从灵活性方面来讲：用户可以在线实时增加自己的配置，可扩展空间较大；而VPS则有这方面的局限性； 5、从性能的角度来看：云主机是同等配置独立服务器计算能力的4倍，可满足高性能计算的要求；而VPS的计算能力只是独立服务器的一部分；从隔离性方面来看：云主机则采用硬件隔离，彼此之间完全不影响；而VPS则采用的是软件隔离，相互之间影响较大。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '美国服务器  美国云主机 美国虚拟空间', 1472471544);

-- --------------------------------------------------------

--
-- 表的结构 `cs_privilege`
--

CREATE TABLE `cs_privilege` (
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

CREATE TABLE `cs_product` (
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

CREATE TABLE `cs_reply` (
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

CREATE TABLE `cs_role` (
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

CREATE TABLE `cs_sales` (
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- 使用表AUTO_INCREMENT `cs_images`
--
ALTER TABLE `cs_images`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
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
  MODIFY `id` mediumint(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- 使用表AUTO_INCREMENT `cs_privilege`
--
ALTER TABLE `cs_privilege`
  MODIFY `id` mediumint(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;
--
-- 使用表AUTO_INCREMENT `cs_product`
--
ALTER TABLE `cs_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;
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
