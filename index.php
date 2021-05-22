<?php
require_once('helpers.php');

$is_auth = rand(0, 1);

$categories = ['Доски и лыжи', 'Крепления', 'Ботинки', 'Одежда', 'Инструменты', 'Разное'];

$user_name = 'Вадим';

$lots = [
    [
        'name' => '2014 Rossignol District Snowboard',
        'category' => 'Доски и лыжи',
        'price' => 10999,
        'URL picture' => 'img/lot-1.jpg',
        'auction_time' => '2021-05-29, 23:59:59'
    ],

    [
        'name' => 'DC Ply Mens 2016/2017 Snowboard',
        'category' => 'Доски и лыжи',
        'price' => 159999,
        'URL picture' => 'img/lot-2.jpg',
        'auction_time' => '2021-05-24, 23:59:59'
    ],

    [
        'name' => 'Крепления Union Contact Pro 2015 года размер L/XL',
        'category' => 'Крепления',
        'price' => 8000,
        'URL picture' => 'img/lot-3.jpg',
        'auction_time' => '2021-05-30, 23:59:59'
    ],

    [
        'name' => 'Ботинки для сноуборда DC Mutiny Charocal',
        'category' => 'Ботинки',
        'price' => 10999,
        'URL picture' => 'img/lot-4.jpg',
        'auction_time' => '2021-05-27, 23:59:59'
    ],

    [
        'name' => 'Куртка для сноуборда DC Mutiny Charocal',
        'category' => 'Одежда',
        'price' => 7500,
        'URL picture' => 'img/lot-5.jpg',
        'auction_time' => '2021-05-28, 23:59:59'
    ],

    [
        'name' => 'Маска Oakley Canopy',
        'category' => 'Разное',
        'price' => 5400,
        'URL picture' => 'img/lot-6.jpg',
        'auction_time' => '2021-05-22, 22:14:59'
    ]
];

function time_left($lots)
{
    $i = strtotime(date('Y-m-d H:i:s'));

    $time = abs(strtotime($lots['auction_time']) - $i);

    $hours = floor($time / 60 / 60);

    $minutes = ($time / 60) % 60;

    return [$hours, $minutes];
}

/**
 * @param int $price
 * @return string
 */
function format_price(int $price): string
{
    if ($price < 1000) {
        return $price . '₽';
    }
    return number_format($price, 0, ',', ' ') . '₽';
}

$title = 'Аукцион Yeticave';

$content = include_template('main.php', ['categories' => $categories, 'lots' => $lots]);

$template = include_template('layout.php', ['content' => $content, 'categories' => $categories, 'is_auth' => $is_auth, 'title' => $title]);

echo $template;


