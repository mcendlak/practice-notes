<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <?php
        require 'Database.php';
        require 'functions.php';

        $dataBase = new Database("localhost", "3306", "blog", "root");
        $res = $dataBase->leftJoin("authors", "posts", "authors.id = posts.author_id", "authors.id, authors.lastname, posts.title");
        echo generateHtmlTable($res);

    ?>
</body>
</html>