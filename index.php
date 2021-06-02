<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

require_once('helpers.php');

$is_auth = rand(0, 1);

$categories = ['Доски и лыжи', 'Крепления', 'Ботинки', 'Одежда', 'Инструменты', 'Разное'];

$user_name = 'Вадим';

$lots = [
    [
        'name' => '2014 Rossignol District Snowboard',
        'category' => 'Доски и лыжи',
        'price' => 10999,
        'URL image' => 'img/lot-1.jpg',
        'auction_time' => '2021-06-22'
    ],

    [
        'name' => 'DC Ply Mens 2016/2017 Snowboard',
        'category' => 'Доски и лыжи',
        'price' => 159999,
        'URL image' => 'img/lot-2.jpg',
        'auction_time' => '2021-06-15'
    ],

    [
        'name' => 'Крепления Union Contact Pro 2015 года размер L/XL',
        'category' => 'Крепления',
        'price' => 8000,
        'URL image' => 'img/lot-3.jpg',
        'auction_time' => '2021-06-11'
    ],

    [
        'name' => 'Ботинки для сноуборда DC Mutiny Charocal',
        'category' => 'Ботинки',
        'price' => 10999,
        'URL image' => 'img/lot-4.jpg',
        'auction_time' => '2021-06-01'
    ],

    [
        'name' => 'Куртка для сноуборда DC Mutiny Charocal',
        'category' => 'Одежда',
        'price' => 7500,
        'URL image' => 'img/lot-5.jpg',
        'auction_time' => '2021-06-05'
    ],

    [
        'name' => 'Маска Oakley Canopy',
        'category' => 'Разное',
        'price' => 5400,
        'URL image' => 'img/lot-6.jpg',
        'auction_time' => '2021-06-27'
    ]
];


/**
 * Функция подсчитывает оставшееся время на покупку снаряжения
 * @param string $date_time дата в виде строки
 * @return int[] выводит количество часов и минут до окончания лота
 */
function time_left(string $date_time) :array
{
    $present_time = time();

    $time = (strtotime($date_time) - $present_time);
    if ($time <= 0) {
        return [0, 0];
    }

    $hours = floor($time / 3600);

    $minutes = floor($time / 60) % 60;

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


