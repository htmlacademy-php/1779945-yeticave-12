USE `yeticave`;

INSERT INTO `lots` (`id`, `name`, `description`, `creation_time`, `start_price`, `end_time`, `category_id`, `user_id`, `image`) VALUES
(1, '2014 Rossignol District Snowboard Green', 'Доска', '2021-07-02 00:00:00', 10999, '2021-07-22 23:59:59', 1, 1, '\'img/lot-1.img\''),
(2, 'DC Ply Mens 2016/2017 Snowboard', 'Доска', '2021-07-02 00:00:00', 159999, '2021-07-15 23:59:59', 1, 2, '\'img/lot-2.img\''),
(3, 'Крепления Union Contact Pro 2015 года размер L/XL', 'Крепление', '2021-07-02 00:00:00', 8000, '2021-07-11 23:59:59', 2, 3, '\'img/lot-3.img\''),
(4, 'Ботинки для сноуборда DC Mutiny Charocal', 'Ботинки', '2021-07-01 00:00:00', 10999, '2021-07-15 23:59:59', 3, 1, '\'img/lot-4.img\''),
(5, 'Куртка для сноуборда DC Mutiny Charocal', 'Куртка', '2021-07-01 00:00:00', 7500, '2021-07-12 23:59:59', 4, 2, '\'img/lot-5.img\''),
(6, 'Маска Oakley Canopy', 'Маска', '2021-07-01 00:00:00', 5400, '2021-07-27 23:59:59', 6, 3, '\'img/lot-6.img\'');

INSERT INTO `users` (`id`, `name`, `email`, `password`, `contact_details`, `creation_time`) VALUES
(1, 'Иван', 'ivan@mail.ru', 'ivan123', 'проживаю в РБ', '2021-07-06 13:30:00'),
(2, 'Петр', 'petr@mail.ru', 'petr123', 'проживаю в РБ', '2021-07-05 12:10:00'),
(3, 'Максим', 'maxim@mail.ru', 'maxim123', 'проживаю в РБ', '2021-07-04 11:40:00');

INSERT INTO `categories` (`id`, `name`) VALUES
(1, 'Доски и лыжи'),
(2, 'Крепления'),
(3, 'Ботинки'),
(4, 'Одежда'),
(5, 'Инструменты'),
(6, 'Разное');

INSERT INTO `bets` (`id`, `creation_time`, `user_id`, `lot_id`, `bet_size`) VALUES
(1, '2021-07-19 12:30:00', 1, 1, 11500),
(2, '2021-07-18 11:30:00', 2, 1, 11000);

SELECT * FROM categories;

SELECT lots.id, lots.name, lots.start_price, lots.image, MAX(bets.bet_size), categories.name
FROM lots JOIN categories
ON lots.category_id = categories.id
JOIN bets
ON bets.lot_id = lots.id
GROUP BY (lots.id);

SELECT lots.id, lots.name, categories.name
FROM lots JOIN categories
ON categories.id = lots.category_id
WHERE lots.id = 2;

UPDATE lots
SET name = '2014 Rossignol District Snowboard Green'
WHERE id = 1;

SELECT bets.id, bets.user_id, bets.creation_time, bets.bet_size
FROM bets
JOIN lots ON bets.lot_id = lots.id
WHERE lots.id = 1
ORDER BY bet_size ASC;
















