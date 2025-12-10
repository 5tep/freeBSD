<?php

$config = parse_ini_file(__DIR__ . '/config');

// Создаём подключение один раз
$loginDB = new mysqli(
    $config['host'],
    $config['username'],
    $config['password'],
    $config['database']
);

// Проверяем ошибки подключения
if ($loginDB->connect_error) {
    error_log("MySQL connection failed: " . $loginDB->connect_error);
    die("Database connection failed");
}

// Устанавливаем кодировку (рекомендуется)
$loginDB->set_charset('utf8');

// Универсальные функции (теперь без global и дублирования)

function DB_query($query) {
    global $loginDB;
    $result = $loginDB->query($query);
    if (!$result) {
        error_log("Query failed: " . $loginDB->error . " | Query: " . $query);
    }
    return $result;
}

function DB_real_escape_string($string) {
    global $loginDB;
    return $loginDB->real_escape_string($string);
}

function DB_fetch_array($result) {
    if ($result instanceof mysqli_result) {
        return $result->fetch_assoc();
    }
    return null;
}
