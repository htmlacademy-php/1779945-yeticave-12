<?php
require_once('helpers.php');

$is_auth = rand(0, 1);

$categories = ['Доски и лыжи', 'Крепления', 'Ботинки', 'Одежда', 'Инструменты', 'Разное'];

$user_name = 'Вадим';

$lots = [
    [
        'Название' => '2014 Rossignol District Snowboard',
        'Категория' => 'Доски и лыжи',
        'Цена' => 10999,
        'URL картинка' => 'img/lot-1.jpg',
        $ny_date = strtotime("2021-05-29")
    ],

    [
        'Название' => 'DC Ply Mens 2016/2017 Snowboard',
        'Категория' => 'Доски и лыжи',
        'Цена' => 159999,
        'URL картинка' => 'img/lot-2.jpg',
        $ny_date = strtotime("2021-05-25")
    ],

    [
        'Название' => 'Крепления Union Contact Pro 2015 года размер L/XL',
        'Категория' => 'Крепления',
        'Цена' => 8000,
        'URL картинка' => 'img/lot-3.jpg',
        $ny_date = strtotime("2021-05-22")
    ],

    [
        'Название' => 'Ботинки для сноуборда DC Mutiny Charocal',
        'Категория' => 'Ботинки',
        'Цена' => 10999,
        'URL картинка' => 'img/lot-4.jpg',
        $ny_date = strtotime("2021-05-21")
    ],

    [
        'Название' => 'Куртка для сноуборда DC Mutiny Charocal',
        'Категория' => 'Одежда',
        'Цена' => 7500,
        'URL картинка' => 'img/lot-5.jpg',
        $ny_date = strtotime("2021-05-28")
    ],

    [
        'Название' => 'Маска Oakley Canopy',
        'Категория' => 'Разное',
        'Цена' => 5400,
        'URL картинка' => 'img/lot-6.jpg',
        $ny_date = strtotime("2021-05-26")
    ]
];




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


