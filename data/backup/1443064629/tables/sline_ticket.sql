CREATE TABLE `sline_ticket` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `webid` int(2) unsigned DEFAULT NULL,
  `aid` int(11) unsigned DEFAULT NULL,
  `startcity` varchar(50) DEFAULT NULL COMMENT '起飞城市',
  `midcity` varchar(50) DEFAULT NULL COMMENT '中转城市',
  `overcity` varchar(50) DEFAULT NULL COMMENT '到达城市',
  `tickettype` int(1) unsigned DEFAULT NULL COMMENT '机票类型 1,单程,2联程,3往返',
  `taketime` varchar(255) DEFAULT NULL COMMENT '起飞时间',
  `arrivetime` varchar(255) DEFAULT NULL COMMENT '到达时间',
  `company` varchar(255) DEFAULT NULL COMMENT '航空公司',
  `planenum` varchar(255) DEFAULT NULL COMMENT '航班号',
  `flighttypeid` varchar(255) DEFAULT NULL COMMENT '机型id',
  `addtime` int(10) unsigned DEFAULT NULL,
  `modtime` int(10) unsigned DEFAULT NULL,
  `ismiddle` int(2) NOT NULL,
  `timerate` varchar(255) DEFAULT NULL COMMENT '准点率',
  `hasrepast` int(1) DEFAULT '0' COMMENT '是否有餐饮',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='票务表'