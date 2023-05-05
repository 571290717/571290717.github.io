/*
SQLyog Community v13.1.1 (32 bit)
MySQL - 5.7.26 : Database - osdb
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`osdb` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `osdb`;

/*Table structure for table `category` */

DROP TABLE IF EXISTS `category`;

CREATE TABLE `category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '菜品分类id',
  `shop_id` int(11) DEFAULT NULL COMMENT '店铺id',
  `name` varchar(50) DEFAULT NULL COMMENT '分类名称',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态：1正常 9删除',
  `create_at` datetime DEFAULT NULL COMMENT '添加时间',
  `update_at` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

/*Data for the table `category` */

insert  into `category`(`id`,`shop_id`,`name`,`status`,`create_at`,`update_at`) values 
(1,1,'双拼套餐',1,'2020-07-25 10:20:30','2020-07-25 10:20:30'),
(2,1,'盖饭',1,'2020-07-25 10:20:30','2020-07-25 10:20:30'),
(3,1,'小菜',1,'2020-07-25 10:20:30','2020-07-25 10:20:30'),
(4,1,'汤/饮料',1,'2020-07-25 10:20:30','2020-07-25 10:20:30'),
(5,2,'双拼套餐',1,'2020-07-25 10:20:30','2020-07-25 10:20:30'),
(6,2,'盖饭',1,'2020-07-25 10:20:30','2020-07-25 10:20:30'),
(7,2,'小菜',1,'2020-07-25 10:20:30','2020-07-25 10:20:30'),
(8,2,'汤/饮料',1,'2020-07-25 10:20:30','2020-07-25 10:20:30'),
(9,3,'盖饭',1,'2020-07-25 10:20:30','2020-07-25 10:20:30'),
(10,3,'双拼套餐',1,'2020-07-25 10:20:30','2020-07-25 10:20:30'),
(11,4,'小炒',1,'2020-07-25 10:20:30','2020-07-25 10:20:30');

/*Table structure for table `django_migrations` */

DROP TABLE IF EXISTS `django_migrations`;

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `django_migrations` */

/*Table structure for table `django_session` */

DROP TABLE IF EXISTS `django_session`;

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `django_session` */

/*Table structure for table `member` */

DROP TABLE IF EXISTS `member`;

CREATE TABLE `member` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '会员表id',
  `nickname` varchar(50) DEFAULT NULL COMMENT '昵称',
  `avatar` varchar(255) DEFAULT NULL COMMENT '头像',
  `mobile` varchar(50) DEFAULT NULL COMMENT '电话',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态:1正常/2禁用/9删除',
  `create_at` datetime DEFAULT NULL COMMENT '添加时间',
  `update_at` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

/*Data for the table `member` */

insert  into `member`(`id`,`nickname`,`avatar`,`mobile`,`status`,`create_at`,`update_at`) values 
(1,'lixiaofeng','moren.png','11234567899',9,'2020-07-25 10:20:30','2020-07-25 10:20:30'),
(2,'jack','moren.png','12345678965',1,'2020-07-25 10:20:30','2020-07-25 10:20:30'),
(3,'wo879','moren.png','13456789522',1,'2020-07-25 10:20:30','2020-07-25 10:20:30'),
(4,'mt100','moren.png','13567895563',1,'2020-07-25 10:20:30','2020-07-25 10:20:30'),
(5,'顾客','moren.png','12345678901',1,'2020-07-25 10:20:30','2020-07-25 10:20:30'),
(6,'顾客','moren.png','12345678902',1,'2020-07-25 10:20:30','2020-07-25 10:20:30'),
(7,'顾客','moren.png','12345678903',1,'2020-07-25 10:20:30','2020-07-25 10:20:30'),
(8,'顾客','moren.png','12345678904',1,'2020-07-25 10:20:30','2020-07-25 10:20:30'),
(9,'顾客','moren.png','12345678905',1,'2020-07-25 10:20:30','2020-07-25 10:20:30'),
(10,'顾客','moren.png','12345678906',1,'2020-07-25 10:20:30','2020-07-25 10:20:30'),
(11,'顾客','moren.png','12345678909',1,'2020-07-25 10:20:30','2020-07-25 10:20:30'),
(12,'顾客','moren.png','18642805564',1,'2020-07-25 10:20:30','2020-07-25 10:20:30'),
(13,'顾客','moren.png','13116051729',1,'2020-07-25 10:20:30','2020-07-25 10:20:30'),
(14,'顾客','moren.png','13161485799',1,'2020-07-25 10:20:30','2020-07-25 10:20:30'),
(15,'顾客','moren.png','11234567888',1,'2020-07-25 10:20:30','2020-07-25 10:20:30'),
(16,'顾客','moren.png','19919940344',1,'2020-07-25 10:20:30','2020-07-25 10:20:30');

/*Table structure for table `migrations` */

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `migrations` */

/*Table structure for table `order_detail` */

DROP TABLE IF EXISTS `order_detail`;

CREATE TABLE `order_detail` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '订单详情id',
  `order_id` int(10) unsigned DEFAULT NULL COMMENT '订单id',
  `product_id` int(10) unsigned DEFAULT NULL COMMENT '菜品id',
  `product_name` varchar(50) DEFAULT NULL COMMENT '菜品名称',
  `price` double(6,2) unsigned DEFAULT NULL COMMENT '单价',
  `quantity` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '数量',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态:1正常/9删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='订单详情信息表';

/*Data for the table `order_detail` */

insert  into `order_detail`(`id`,`order_id`,`product_id`,`product_name`,`price`,`quantity`,`status`) values 
(1,4,1,'红烧肉+狮子头+饮料',25.00,1,1),
(2,4,2,'红烧肉+番茄鸡蛋',22.00,1,1),
(3,4,7,'肥牛饭',19.00,1,1),
(4,5,1,'红烧肉+狮子头+饮料',25.00,1,1),
(5,6,3,'梅菜扣肉+番茄鸡蛋',22.00,1,1),
(6,6,12,'单份香辣笋干烧肉',15.00,1,1),
(7,6,13,'番茄蛋花汤',4.00,1,1),
(8,7,2,'红烧肉+番茄鸡蛋',22.00,1,1),
(9,7,6,'木须肉饭',16.00,2,1),
(10,7,14,'王老吉',6.00,1,1),
(11,7,11,'菜心',6.00,1,1),
(12,8,2,'红烧肉+番茄鸡蛋',22.00,1,1),
(13,8,5,'梅菜扣肉饭',19.00,1,1),
(14,9,1,'红烧肉+狮子头+饮料',25.00,1,1),
(15,9,13,'番茄蛋花汤',4.00,1,1),
(16,10,1,'红烧肉+狮子头+饮料',25.00,1,1),
(17,10,2,'红烧肉+番茄鸡蛋',22.00,1,1),
(18,11,1,'红烧肉+狮子头+饮料',25.00,1,1),
(19,11,2,'红烧肉+番茄鸡蛋',22.00,2,1),
(20,11,12,'单份香辣笋干烧肉',15.00,1,1),
(21,11,13,'番茄蛋花汤',4.00,1,1),
(22,12,1,'红烧肉+狮子头+饮料',25.00,1,1),
(23,12,6,'木须肉饭',16.00,2,1),
(24,12,13,'番茄蛋花汤',4.00,1,1),
(25,13,1,'红烧肉+狮子头+饮料',25.00,2,1),
(26,13,6,'木须肉饭',16.00,1,1),
(27,13,9,'单个肉丸子',4.00,2,1),
(28,13,14,'王老吉',6.00,1,1),
(29,14,1,'红烧肉+狮子头+饮料',25.00,5,1),
(30,14,2,'红烧肉+番茄鸡蛋',22.00,7,1),
(31,14,6,'木须肉饭',16.00,1,1),
(32,15,14,'王老吉',6.00,2,1),
(33,15,9,'木须肉',12.00,1,1),
(34,15,3,'梅菜扣肉+番茄鸡蛋',22.00,1,1),
(35,15,6,'木须肉饭',16.00,1,1);

/*Table structure for table `orders` */

DROP TABLE IF EXISTS `orders`;

CREATE TABLE `orders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '订单表id',
  `shop_id` int(10) unsigned DEFAULT NULL COMMENT '店铺id号',
  `member_id` int(10) unsigned DEFAULT NULL COMMENT '会员id',
  `user_id` int(10) unsigned DEFAULT NULL COMMENT '操作员id',
  `money` double(8,2) DEFAULT NULL COMMENT '金额',
  `status` tinyint(3) unsigned DEFAULT NULL COMMENT '订单状态:1过行中/2无效/3已完成',
  `payment_status` tinyint(3) unsigned DEFAULT NULL COMMENT '支付状态:1未支付/2已支付/3已退款',
  `create_at` datetime DEFAULT NULL COMMENT '添加时间',
  `update_at` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

/*Data for the table `orders` */

insert  into `orders`(`id`,`shop_id`,`member_id`,`user_id`,`money`,`status`,`payment_status`,`create_at`,`update_at`) values 
(4,1,0,1,66.00,3,2,'2020-07-25 10:20:30','2020-07-25 10:20:30'),
(5,1,0,1,25.00,3,2,'2020-07-25 10:20:30','2020-07-25 10:20:30'),
(6,1,0,3,41.00,3,2,'2020-07-25 10:20:30','2020-07-25 10:20:30'),
(7,1,0,1,66.00,3,2,'2020-07-25 10:20:30','2020-07-25 10:20:30'),
(8,1,0,1,41.00,1,2,'2020-07-25 10:20:30','2020-07-25 10:20:30'),
(9,1,0,1,29.00,2,2,'2020-07-25 10:20:30','2020-07-25 10:20:30'),
(10,1,0,1,47.00,1,2,'2020-07-25 10:20:30','2020-07-25 10:20:30'),
(11,1,0,1,88.00,3,2,'2020-07-25 10:20:30','2020-07-25 10:20:30'),
(12,1,0,1,61.00,3,2,'2020-07-25 10:20:30','2020-07-25 10:20:30'),
(13,1,0,1,80.00,3,2,'2020-07-25 10:20:30','2020-07-25 10:20:30'),
(14,1,0,2,295.00,2,2,'2020-07-25 10:20:30','2020-07-25 10:20:30'),
(15,1,0,2,62.00,1,2,'2020-07-25 10:20:30','2020-07-25 10:20:30');

/*Table structure for table `payment` */

DROP TABLE IF EXISTS `payment`;

CREATE TABLE `payment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '支付表id',
  `order_id` int(10) unsigned DEFAULT NULL COMMENT '订单id',
  `member_id` int(10) unsigned DEFAULT NULL COMMENT '会员id',
  `money` double(8,2) unsigned DEFAULT NULL COMMENT '支付金额',
  `type` tinyint(3) unsigned DEFAULT NULL COMMENT '付款方式：1会员付款/2收银收款',
  `bank` tinyint(3) unsigned DEFAULT NULL COMMENT '收款银行渠道:1微信/2余额/3现金/4支付宝',
  `status` tinyint(3) unsigned DEFAULT NULL COMMENT '支付状态:1未支付/2已支付/3已退款',
  `create_at` datetime DEFAULT NULL COMMENT '添加时间',
  `update_at` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

/*Data for the table `payment` */

insert  into `payment`(`id`,`order_id`,`member_id`,`money`,`type`,`bank`,`status`,`create_at`,`update_at`) values 
(2,4,0,66.00,2,3,2,'2020-07-25 10:20:30','2020-07-25 10:20:30'),
(3,5,0,25.00,2,3,2,'2020-07-25 10:20:30','2020-07-25 10:20:30'),
(4,6,0,41.00,2,3,2,'2020-07-25 10:20:30','2020-07-25 10:20:30'),
(5,7,0,66.00,2,3,2,'2020-07-25 10:20:30','2020-07-25 10:20:30'),
(6,8,0,41.00,2,3,2,'2020-07-25 10:20:30','2020-07-25 10:20:30'),
(7,9,0,29.00,2,1,2,'2020-07-25 10:20:30','2020-07-25 10:20:30'),
(8,10,0,47.00,2,3,2,'2020-07-25 10:20:30','2020-07-25 10:20:30'),
(9,11,0,88.00,2,3,2,'2020-07-25 10:20:30','2020-07-25 10:20:30'),
(10,12,0,61.00,2,3,2,'2020-07-25 10:20:30','2020-07-25 10:20:30'),
(11,13,0,80.00,2,3,2,'2020-07-25 10:20:30','2020-07-25 10:20:30'),
(12,14,0,295.00,2,4,2,'2020-07-25 10:20:30','2020-07-25 10:20:30'),
(13,15,0,62.00,2,3,2,'2020-07-25 10:20:30','2020-07-25 10:20:30');

/*Table structure for table `product` */

DROP TABLE IF EXISTS `product`;

CREATE TABLE `product` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '菜品id',
  `shop_id` int(11) DEFAULT NULL COMMENT '店铺id',
  `category_id` int(11) DEFAULT NULL COMMENT '菜品分类id',
  `cover_pic` varchar(50) DEFAULT NULL COMMENT '菜品图片',
  `name` varchar(50) DEFAULT NULL COMMENT '菜品名称',
  `price` double(6,2) DEFAULT NULL COMMENT '单价',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态：1:正常  2:停售  9:删除',
  `create_at` datetime DEFAULT NULL COMMENT '添加时间',
  `update_at` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

/*Data for the table `product` */

insert  into `product`(`id`,`shop_id`,`category_id`,`cover_pic`,`name`,`price`,`status`,`create_at`,`update_at`) values 
(1,1,1,'1536657620.5485704.jpg','红烧肉+狮子头+饮料',25.00,1,'2020-07-11 09:20:20','2020-07-25 10:20:30'),
(2,1,1,'1536658352.9341557.jpg','红烧肉+番茄鸡蛋',22.00,1,'2020-07-11 09:32:32','2020-07-25 10:20:30'),
(3,1,1,'1536658415.6838002.jpg','梅菜扣肉+番茄鸡蛋',22.00,1,'2020-07-11 09:33:35','2020-07-25 10:20:30'),
(4,1,1,'1536658574.2847373.jpg','肥牛+番茄鸡蛋',22.00,1,'2020-07-11 09:36:14','2020-07-25 10:20:30'),
(5,1,2,'1536658659.0446993.jpg','梅菜扣肉饭',19.00,1,'2020-07-11 09:37:39','2020-07-25 10:20:30'),
(6,1,2,'1536658824.3976505.jpg','木须肉饭',16.00,1,'2020-07-11 09:40:24','2020-07-25 10:20:30'),
(7,1,2,'1536658863.6732855.jpg','肥牛饭',19.00,1,'2020-07-11 09:41:03','2020-07-25 10:20:30'),
(8,1,2,'1536658960.3954134.jpg','无骨咖喱鸡饭',18.00,1,'2020-07-11 09:42:40','2020-07-25 10:20:30'),
(9,1,3,'1536659114.0440235.jpg','木须肉',12.00,1,'2020-07-11 09:44:25','2020-07-25 10:20:30'),
(10,1,3,'1536659065.7972637.jpg','番茄鸡蛋',4.00,1,'2020-07-11 09:45:14','2020-07-25 10:20:30'),
(11,1,3,'1536659197.7231221.jpg','青菜',4.00,1,'2020-07-11 09:46:37','2020-07-25 10:20:30'),
(12,1,3,'1536659253.8842716.jpg','单份香辣笋干烧肉',15.00,1,'2020-07-11 09:47:33','2020-07-25 10:20:30'),
(13,1,4,'1536659311.8699493.jpg','番茄蛋花汤',4.00,1,'2020-07-11 09:48:31','2020-07-25 10:20:30'),
(14,1,4,'1536659364.7892513.jpg','王老吉',6.00,1,'2020-07-11 09:49:24','2020-07-25 10:20:30'),
(15,1,4,'1536659563.3897648.jpg','果粒橙',5.00,1,'2020-07-11 09:52:43','2020-07-25 10:20:30'),
(16,1,4,'1536659605.5561771.jpg','矿泉水',3.00,1,'2020-07-11 09:53:25','2020-07-25 10:20:30'),
(17,1,4,'1536659688.4856157.jpg','乌梅汁',4.00,1,'2020-07-11 09:54:48','2020-07-25 10:20:30'),
(18,2,7,'1536659065.7972636.jpg','番茄鸡蛋',4.00,1,'2020-07-04 06:17:18','2020-07-25 10:20:30'),
(19,3,10,'1536658666.8341557.jpg','红烧肉+西红柿鸡蛋',24.00,1,'2020-07-06 08:46:28','2020-07-25 07:34:07');

/*Table structure for table `shop` */

DROP TABLE IF EXISTS `shop`;

CREATE TABLE `shop` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '店铺id',
  `name` varchar(255) NOT NULL COMMENT '店铺名称',
  `cover_pic` varchar(255) DEFAULT NULL COMMENT '封面图片',
  `banner_pic` varchar(255) DEFAULT NULL COMMENT '图标Logo',
  `address` varchar(255) DEFAULT NULL COMMENT '店铺地址',
  `phone` varchar(255) DEFAULT NULL COMMENT '联系电话',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态：1:正常 2:暂停 9:删除',
  `create_at` datetime DEFAULT NULL COMMENT '添加时间',
  `update_at` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `shop` */

insert  into `shop`(`id`,`name`,`cover_pic`,`banner_pic`,`address`,`phone`,`status`,`create_at`,`update_at`) values 
(1,'田老师红烧肉-朝阳将台路店','12341234.jpg','lg.jpg','北京市朝阳区将台乡东八间房村西临8号','12345678905',1,'2020-07-20 10:12:34','2020-07-24 12:34:56'),
(2,'田老师红烧肉-海淀区上地店','57892456.jpg','lg.jpg','北京市海定区上地三街嘉华大厦A座10号','13456789209',1,'2020-07-21 12:23:45','2020-07-22 20:42:16'),
(3,'田老师红烧肉-西城玉渊潭店','23454567.jpg','lg.jpg','北京市宣武区玉渊潭南路东123号','12345677654',2,'2020-07-24 08:20:32','2020-07-25 06:06:07');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '员工账号id',
  `username` varchar(50) DEFAULT NULL COMMENT '员工账号',
  `nickname` varchar(50) DEFAULT NULL COMMENT '昵称',
  `password_hash` varchar(100) DEFAULT NULL COMMENT '密码',
  `password_salt` varchar(50) DEFAULT NULL COMMENT '密码干扰值',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态:1正常/2禁用/9删除',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `update_at` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`id`,`username`,`nickname`,`password_hash`,`password_salt`,`status`,`create_at`,`update_at`) values 
(1,'zhangsan','张三','1e191d851b3b49a248f4ea62f6b06410','123456',6,'2020-07-08 18:18:18','2020-07-22 08:06:55'),
(2,'lisi','李四','1e191d851b3b49a248f4ea62f6b06410','123456',1,'2020-07-18 08:08:18','2020-07-22 16:21:18'),
(3,'xiaoli','小李子','c8a7ca8b274f29cf2c1147a8e0f685a4','639776',6,'2020-07-07 07:53:57','2020-07-08 20:18:18'),
(4,'zhangwuji','张无忌','cbb748964d243e38f032b78886db824c','437809',9,'2020-02-18 09:06:54','2020-01-14 03:36:25'),
(5,'zhaomin','赵敏','27c744b428b997675c4383e7eae974c3','486570',2,'2020-02-18 09:07:40','2020-02-18 09:07:40'),
(6,'cuihua','翠花','b5a7379148116549de083f5076233bef','810418',2,'2020-02-18 09:08:35','2020-03-08 20:18:09'),
(7,'zhangle','张乐','7177bd35ad232f0830fe5c10dcc24b1c','350013',2,'2020-02-19 06:11:16','2020-02-19 12:33:19'),
(8,'uu01','小优','a0811c52452216c63e52da04337e9216','268818',1,'2020-01-03 10:27:04','2020-01-03 10:27:04'),
(9,'uu02','小优2','56322ead3e2371636ac2395c8399297f','112245',1,'2020-01-03 10:37:37','2020-01-03 10:37:37'),
(10,'uu03','小优3','8e7d0c4077c73ad60c23367625d4346f','238764',1,'2020-01-03 11:24:48','2020-01-03 11:24:48'),
(11,'uu04','小优4','5eec167b09ea13497843274969460d67','642960',1,'2020-01-03 11:27:00','2020-01-03 11:27:00'),
(12,'uu123','小优','5c2e9f69b05413b806dc6951b0f86e51','102905',1,'2020-01-13 23:51:01','2020-01-13 23:51:01'),
(13,'uu666','小优3','99e89e8245d9f6f0628b5a59299bd9f7','673778',1,'2020-01-13 23:52:13','2020-01-13 23:52:13'),
(14,'mm','小美','05775bb481d11f0648b158cd40a7929c','627985',1,'2020-01-14 01:25:57','2020-01-14 01:25:57');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
