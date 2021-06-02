<?php
$lots = [
    [
        'name' => '2014 Rossignol District Snowboard',
        'category' => 'Доски и лыжи',
        'price' => 10999,
        'URL image' => 'img/lot-1.jpg',
        'auction_time' => '2021-06-02'
    ],
];

function time_left(string $date_time) :array
{
    $present_time = time();
    $date_time = '2021-06-02';
    $time = (strtotime($date_time) - $present_time);
    if ($time <= 0) {
        return [0, 0];
    }

    $hours = floor($time / 3600);

    $minutes = floor($time / 60) % 60;

    return [$hours, $minutes];
}




?>
