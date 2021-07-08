/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

CREATE DATABASE IF NOT EXISTS `yeticave` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `yeticave`;

CREATE TABLE IF NOT EXISTS `bets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `creation_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `user_id` int(11) NOT NULL,
  `lot_id` int(11) NOT NULL,
  `bet_size` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_bets_lots` (`lot_id`),
  KEY `FK_bets_users` (`user_id`),
  CONSTRAINT `FK_bets_lots` FOREIGN KEY (`lot_id`) REFERENCES `lots` (`id`),
  CONSTRAINT `FK_bets_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*!40000 ALTER TABLE `bets` DISABLE KEYS */;
INSERT INTO `bets` (`id`, `creation_time`, `user_id`, `lot_id`, `bet_size`) VALUES
	(1, '2021-07-10 12:30:00', 1, 1, 11500),
	(2, '2021-07-11 11:30:00', 2, 1, 11000);
/*!40000 ALTER TABLE `bets` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` (`id`, `name`) VALUES
	(1, 'Доски и лыжи'),
	(2, 'Крепления'),
	(3, 'Ботинки'),
	(4, 'Одежда'),
	(5, 'Инструменты'),
	(6, 'Разное');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `lots` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `description` text NOT NULL,
  `creation_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `start_price` int(11) NOT NULL,
  `end_time` datetime NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `image` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `FK_lots_categories` (`category_id`),
  KEY `name` (`name`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `FK_lots_categories` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  CONSTRAINT `FK_lots_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*!40000 ALTER TABLE `lots` DISABLE KEYS */;
INSERT INTO `lots` (`id`, `name`, `description`, `creation_time`, `start_price`, `end_time`, `category_id`, `user_id`, `image`) VALUES
	(1, '2014 Rossignol District Snowboard Green', 'Доска', '2021-07-02 00:00:00', 10999, '2021-07-22 23:59:59', 1, 1, '\'img/lot-1.img\''),
	(2, 'DC Ply Mens 2016/2017 Snowboard', 'Доска', '2021-07-02 00:00:00', 159999, '2021-07-15 23:59:59', 1, 2, '\'img/lot-2.img\''),
	(3, 'Крепления Union Contact Pro 2015 года размер L/XL', 'Крепление', '2021-07-02 00:00:00', 8000, '2021-07-11 23:59:59', 2, 3, '\'img/lot-3.img\''),
	(4, 'Ботинки для сноуборда DC Mutiny Charocal', 'Ботинки', '2021-07-01 00:00:00', 10999, '2021-07-15 23:59:59', 3, 1, '\'img/lot-4.img\''),
	(5, 'Куртка для сноуборда DC Mutiny Charocal', 'Куртка', '2021-07-01 00:00:00', 7500, '2021-07-12 23:59:59', 4, 2, '\'img/lot-5.img\''),
	(6, 'Маска Oakley Canopy', 'Маска', '2021-07-01 00:00:00', 5400, '2021-07-27 23:59:59', 6, 3, '\'img/lot-6.img\'');
/*!40000 ALTER TABLE `lots` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `contact_details` varchar(100) DEFAULT NULL,
  `creation_time` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `name`, `email`, `password`, `contact_details`, `creation_time`) VALUES
	(1, 'Иван', 'ivan@mail.ru', 'ivan123', 'проживаю в РБ', '2021-07-06 13:30:00'),
	(2, 'Петр', 'petr@mail.ru', 'petr123', 'проживаю в РБ', '2021-07-05 12:10:00'),
	(3, 'Максим', 'maxim@mail.ru', 'maxim123', 'проживаю в РБ', '2021-07-04 11:40:00');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
