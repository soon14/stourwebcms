CREATE TABLE `sline_line` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `webid` int(11) unsigned DEFAULT '1',
  `aid` int(11) unsigned DEFAULT NULL COMMENT '文章ID',
  `title` varchar(255) DEFAULT NULL,
  `wholesalel` varchar(255) DEFAULT NULL COMMENT '批发商联系方式',
  `seotitle` varchar(100) DEFAULT NULL COMMENT 'seo标题',
  `startcity` varchar(255) DEFAULT NULL COMMENT '出发城市',
  `overcity` varchar(255) DEFAULT NULL COMMENT '目的城市',
  `linedate` varchar(255) DEFAULT NULL COMMENT '出团日期',
  `price` int(11) DEFAULT NULL,
  `lineday` int(3) unsigned DEFAULT NULL COMMENT '线路天数',
  `linenight` int(5) DEFAULT NULL COMMENT '多少晚',
  `litpic` varchar(255) DEFAULT NULL,
  `linedoc` varchar(255) DEFAULT NULL COMMENT '线路行程word版地址',
  `tagword` varchar(255) DEFAULT NULL COMMENT 'tag词',
  `keyword` varchar(255) DEFAULT NULL COMMENT '关键词',
  `jieshao` longtext COMMENT '线路行程',
  `biaozhun` longtext COMMENT '服务标准',
  `beizu` longtext COMMENT '温鑫提示(备注)',
  `payment` longtext COMMENT '付款方式',
  `feeinclude` longtext COMMENT '费用包含',
  `features` longtext COMMENT '行程特色',
  `description` varchar(700) DEFAULT NULL COMMENT '描述',
  `shownum` int(11) DEFAULT '1' COMMENT '浏览次数',
  `seatleft` int(11) DEFAULT NULL COMMENT '空位数',
  `storeprice` int(11) DEFAULT NULL COMMENT '门市价',
  `transport` longtext COMMENT '交通方式',
  `linebefore` int(11) DEFAULT NULL COMMENT '提前报名天数',
  `addtime` int(10) unsigned DEFAULT NULL COMMENT '添加时间',
  `modtime` int(10) unsigned DEFAULT NULL COMMENT '更新时间',
  `reserved1` longtext COMMENT '线路内容自定义1',
  `reserved2` longtext COMMENT '线路内容自定义2',
  `reserved3` longtext COMMENT '线路内容自定义3',
  `color` varchar(255) DEFAULT NULL COMMENT '标题颜色',
  `childrule` varchar(255) NOT NULL DEFAULT '' COMMENT '小孩说明',
  `kindlist` varchar(255) DEFAULT NULL COMMENT '所属目的地',
  `themelist` varchar(255) DEFAULT NULL COMMENT '主题',
  `attrid` varchar(255) DEFAULT NULL COMMENT '主站属性',
  `satisfyscore` int(11) DEFAULT NULL COMMENT '满意度',
  `bookcount` int(11) unsigned DEFAULT NULL COMMENT '预订次数',
  `ishidden` int(3) DEFAULT '0',
  `isstyle` varchar(255) DEFAULT NULL,
  `sellpoint` varchar(255) DEFAULT NULL COMMENT '卖点',
  `piclist` text,
  `distance` int(6) DEFAULT NULL,
  `zijiaseat` varchar(255) DEFAULT NULL,
  `zijiaprice` varchar(255) DEFAULT NULL,
  `zijiacar` varchar(255) DEFAULT NULL COMMENT '车辆名称(类型)',
  `showrepast` int(1) DEFAULT '1' COMMENT '是否显示餐饮',
  `paytype` int(1) DEFAULT '1' COMMENT '支付方式',
  `templet` varchar(255) DEFAULT 'line_show.htm' COMMENT '使用模板',
  `iconlist` varchar(255) DEFAULT NULL,
  `supplierlist` varchar(255) DEFAULT NULL,
  `insuranceids` varchar(255) DEFAULT NULL COMMENT '保险id',
  `islinebefore` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `kindlist` (`kindlist`),
  KEY `searchkey` (`kindlist`(50),`attrid`(50)),
  KEY `lineday` (`lineday`),
  KEY `lineprice` (`price`),
  KEY `attrid` (`attrid`),
  KEY `IDX_AID` (`aid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT