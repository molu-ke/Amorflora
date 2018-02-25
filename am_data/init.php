<?php
header('Content-Type: application/json;charset=UTF-8');
header('Access-Control-Allow-Origin:https://www.molu.ink');
header('Access-Control-Allow-Credentials:true');

$db_host = $_ENV['MYSQL_HOST'];
$db_user = $_ENV['MYSQL_USERNAME'];
$db_password = $_ENV['MYSQL_PASSWORD'];
$db_database = $_ENV['MYSQL_DBNAME'];
$db_port = 	$_ENV['MYSQL_PORT'];
$db_charset = 'UTF8';

$conn = mysqli_connect($db_host, $db_user, $db_password, $db_database, $db_port);
mysqli_query($conn, "SET NAMES $db_charset");