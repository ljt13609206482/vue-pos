-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 2018-01-21 12:56:25
-- 服务器版本： 10.1.26-MariaDB
-- PHP Version: 7.1.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pos`
--

-- --------------------------------------------------------

--
-- 表的结构 `product_type`
--

CREATE Database pos;
USE pos;


CREATE TABLE `product_type` (
  `tid` int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `product_name` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--插入数据
INSERT INTO `product_type`(`tid`, `product_name`) VALUES
(null,"汉堡"),
(null,"小食"),
(null,"饮料"),
(null,"套餐")
-- --------------------------------------------------------

--
-- 表的结构 `product`
--

CREATE TABLE `product` (
  `pid` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `family_id` int(11) DEFAULT NULL,
  `product_name` varchar(128) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `pic` varchar(128) DEFAULT NULL,
  `is_onsale` ENUM('1','0') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
--插入数据
INSERT INTO `product`(`pid`, `family_id`, `product_name`, `price`, `pic`, `is_onsale`) VALUES
(null,1,'美西沙拉皇堡',27,'pos-img/hamburgers/hb1.jpg',1),
(null,1,'复古烟熏鸡堡',24,'pos-img/hamburgers/hb2.jpg',1),
(null,1,'天椒皇堡',22,'pos-img/hamburgers/hb3.jpg',1),
(null,1,'双层皇堡',31,'pos-img/hamburgers/hb4.jpg',1),
(null,1,'意式荤劲十足很牛堡',30,'pos-img/hamburgers/hb5.jpg',1),
(null,1,'意式荤劲十足超牛堡',38,'pos-img/hamburgers/hb6.jpg',1),
(null,1,'意式荤劲十足爆牛堡',46,'pos-img/hamburgers/hb7.jpg',1),
(null,1,'三层皇堡',40,'pos-img/hamburgers/hb8.jpg',1),
(null,2,'霸王鸡盒',33,'pos-img/snacks/xs1.jpg',1),
(null,2,'王道川蜀鸡翅',11,'pos-img/snacks/xs2.jpg',1),
(null,2,'王道椒香鸡腿',11,'pos-img/snacks/xs3.jpg',1),
(null,2,'芝士肉酱薯霸王',16,'pos-img/snacks/xs4.jpg',1),
(null,2,'薯霸王',11,'pos-img/snacks/xs5.jpg',1),
(null,2,'嫩香鸡块',9,'pos-img/snacks/xs6.jpg',1),
(null,2,'洋葱圈',10,'pos-img/snacks/xs7.jpg',1),
(null,2,'火烤鸡腿色拉',15,'pos-img/snacks/xs8.jpg',1),
(null,3,'热咖啡',10,'pos-img/drinks/yl1.jpg',1),
(null,3,'印度金芒果气泡饮',11,'pos-img/drinks/yl2.jpg',1),
(null,3,'臻选冰豆浆',8,'pos-img/drinks/yl3.jpg',1),
(null,3,'港式奶茶',10,'pos-img/drinks/yl4.jpg',1),
(null,4,'美式脆鸡堡套餐',19,'pos-img/drinks/tc1.jpg',1),
(null,4,'薯你风情套餐',15,'pos-img/drinks/tc2.jpg',1),
(null,4,'双层藤椒脆鸡堡套餐',27,'pos-img/drinks/tc3.jpg',1),
(null,4,'小皇堡套餐',26,'pos-img/drinks/tc4.jpg',1)

-- --------------------------------------------------------

--
-- 表的结构 `orderList`
--

CREATE TABLE `orderList` (
  `oid` int(11) NOT NULL PRIMARY key AUTO_INCREMENT,
  `order_time` TIMESTAMP(14) NOT NULL,
  `status` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `order_detail`
--

CREATE TABLE `order_detail` (
  `did` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `count` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `member`
--

CREATE TABLE `member` (
  `mid` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `uname` varchar(32) DEFAULT NULL,
  `phone` varchar(16) DEFAULT NULL,
  `avatar` varchar(128) DEFAULT NULL,
  `gender` int(11) DEFAULT NULL,
  `integral` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



