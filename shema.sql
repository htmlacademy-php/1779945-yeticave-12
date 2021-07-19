

CREATE DATABASE IF NOT EXISTS `yeticave` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `yeticave`;

CREATE TABLE IF NOT EXISTS `users` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `name` varchar(100) NOT NULL,
    `email` varchar(100) NOT NULL,
    `password` varchar(100) NOT NULL,
    `contact_details` varchar(100) DEFAULT NULL,
    `creation_time` datetime DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    UNIQUE KEY `email` (`email`)
    ) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `categories` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `name` varchar(100) NOT NULL,
    PRIMARY KEY (`id`)
    ) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

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
    ) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;






