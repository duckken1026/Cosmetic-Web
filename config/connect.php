<?php
session_start();

define('SITEURL', 'http://localhost/Cosmetic-Web/');
define("LOCALHOST", "localhost");
define('DB_USERNAME', 'root');
define('DB_PASSWORD', '');
define('DB_NAME', 'cosmetic2');

$conn = mysqli_connect(LOCALHOST, DB_USERNAME, DB_PASSWORD) or die(mysqli_error($link,));
$db_select = mysqli_select_db($conn, DB_NAME) or die(mysqli_error($link,));

$ip_add = $_SERVER['REMOTE_ADDR'];
// echo "The user's IP address is - " . $ip_add;
