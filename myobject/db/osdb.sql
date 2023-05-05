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

/*Table structure for table `django_migrations` */

DROP TABLE IF EXISTS `django_migrations`;

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `django_session` */

DROP TABLE IF EXISTS `django_session`;

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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

/*Table structure for table `migrations` */

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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


insert  into `user`(`id`,`username`,`nickname`,`password_hash`,`password_salt`,`status`,`create_at`,`update_at`) values (1,'zhangsan','张三','1e191d851b3b49a248f4ea62f6b06410','123456',6,'2020-07-28 18:18:18','2020-07-29 08:06:55');
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
