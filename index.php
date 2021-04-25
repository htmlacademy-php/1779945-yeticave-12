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
        'URL картинка' => 'img/lot-1.jpg'
    ],

    [
        'Название' => 'DC Ply Mens 2016/2017 Snowboard',
        'Категория' => 'Доски и лыжи',
        'Цена' => 159999,
        'URL картинка' => 'img/lot-2.jpg'
    ],

    [
        'Название' => 'Крепления Union Contact Pro 2015 года размер L/XL',
        'Категория' => 'Крепления',
        'Цена' => 8000,
        'URL картинка' => 'img/lot-3.jpg'
    ],

    [
        'Название' => 'Ботинки для сноуборда DC Mutiny Charocal',
        'Категория' => 'Ботинки',
        'Цена' => 10999,
        'URL картинка' => 'img/lot-4.jpg'
    ],

    [
        'Название' => 'Куртка для сноуборда DC Mutiny Charocal',
        'Категория' => 'Одежда',
        'Цена' => 7500,
        'URL картинка' => 'img/lot-5.jpg'
    ],

    [
        'Название' => 'Маска Oakley Canopy',
        'Категория' => 'Разное',
        'Цена' => 5400,
        'URL картинка' => 'img/lot-6.jpg'
    ]
];
?>


<?php
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

?>

<?php $title = 'Аукцион Yeticave'; ?>

<?php
$content = include_template('main.php', ['categories' => $categories, 'lots' => $lots]); ?>

<?php
$template = include_template('layout.php', ['content' => $content, 'categories' => $categories, 'is_auth' => $is_auth, 'title' => $title]);

echo $template;
?>
