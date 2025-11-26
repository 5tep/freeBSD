#!/usr/local/bin/php
<?php

$config = parse_ini_file(dirname(__FILE__) . "/config");

// Подключение через mysqli
$mysqli = new mysqli($config['host'], $config['username'], $config['password'], $config['database']);

if ($mysqli->connect_error) {
    die('Connect Error (' . $mysqli->connect_errno . ') ' . $mysqli->connect_error);
}

$data_q = 'SELECT `ip` FROM `users` WHERE `Cash` < -`Credit`';
$result = $mysqli->query($data_q);

if ($result) {
    while ($row = $result->fetch_assoc()) {
        shell_exec("/sbin/pfctl -q -t block_users -T add " . escapeshellarg($row['ip']));
    }
    $result->free();
}

$mysqli->close();
?>
