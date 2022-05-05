CREATE TABLE IF NOT EXISTS `admins` (
  `ckey` varchar(255) NOT NULL,
  `rank` int(1) NOT NULL,
  PRIMARY KEY  (`ckey`)
);

CREATE TABLE `karma` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `spendername` TEXT NOT NULL ,
  `spenderkey` TEXT NOT NULL ,
  `receivername` TEXT NOT NULL ,
  `receiverkey` TEXT NOT NULL ,
  `receiverrole` TEXT NOT NULL ,
  `receiverspecial` TEXT NOT NULL ,
  `isnegative` TINYINT(1) NOT NULL ,
  `spenderip` TEXT NOT NULL ,
  `time` DATETIME NOT NULL ,
  PRIMARY KEY (`id`)
) DEFAULT CHARSET=latin1;

CREATE TABLE `karmatotals` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `byondkey` TEXT NOT NULL ,
  `karma` INT(11) NOT NULL ,
  PRIMARY KEY (`id`)
) DEFAULT CHARSET=latin1;

CREATE TABLE `library` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `author` TEXT NOT NULL ,
  `title` TEXT NOT NULL ,
  `content` TEXT NOT NULL ,
  `category` TEXT NOT NULL ,
  PRIMARY KEY (`id`)
) DEFAULT CHARSET=latin1;

CREATE TABLE `erro_feedback` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `time` int(11) NOT NULL,
  `round_id` int(8) NOT NULL,
  `var_name` varchar(32) NOT NULL,
  `var_value` int(16) DEFAULT NULL,
  `details` text,
  PRIMARY KEY (`id`)
) DEFAULT CHARSET=latin1;
