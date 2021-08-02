

<?php

$mysql = new mysqli ("127.0.0.1", "root", "root", "yeticave");
$mysql->query("SET NAMES 'utf8'");
if ($mysql->connect_error) {
    echo 'Error Number: ' . $mysql->connect_errno . '<br>';
    echo 'Error: ' . $mysql->connect_error;
}


$result = $mysql->query("SELECT * FROM `lots`");
$result_lots = $result->fetch_all(MYSQLI_ASSOC);


$result_c = $mysql->query("SELECT * FROM `categories`");
$result_categories = $result_c->fetch_all(MYSQLI_ASSOC);



$mysql->close();
?>
