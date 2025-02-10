<?php

require '../common/Database.php';
require 'PostController.php';

try {
    $dataBase = new Database("localhost", "3306", "blog", user: "root");
    $controller = new PostController($dataBase);
    $controller->getPosts();
} catch (PDOException $e) {
    echo "Database error: " . $e->getMessage();
}