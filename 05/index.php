<?php
require '../common/Database.php';

$host = "localhost";
$port = "3306";
$dbname = "blog";
$user = "root";

$db = new Database($host, $port, $dbname, $user);

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $username = filter_input(INPUT_POST, 'username', FILTER_SANITIZE_SPECIAL_CHARS);
    $comment = filter_input(INPUT_POST, 'comment', FILTER_SANITIZE_SPECIAL_CHARS);

    if (!empty($username) && !empty($comment)) {
        $db->insert("comments", [
            "username" => $username,
            "comment" => $comment
        ]);
    }
}

$comments = $db->selectAll("comments");

function parseBBCode($text) {
    $text = htmlspecialchars($text);
    $text = nl2br($text);
    $text = preg_replace('/\[b\](.*?)\[\/b\]/i', '<strong>$1</strong>', $text);
    $text = preg_replace('/\[quote\](.*?)\[\/quote\]/is', '<blockquote>$1</blockquote>', $text);
    return $text;
}
?>

<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Komentarze z BBCode</title>
</head>
<body>
    <h2>Dodaj komentarz</h2>
    <form method="POST">
        <label>Użytkownik:</label><br>
        <input type="text" name="username" required><br>
        <label>Komentarz:</label><br>
        <textarea name="comment" required></textarea><br>
        <button type="submit">Dodaj</button>
    </form>

    <h2>Komentarze</h2>
    <?php foreach ($comments as $comment): ?>
        <p><strong><?= htmlspecialchars($comment['username']) ?>:</strong></p>
        <p><?= parseBBCode($comment['comment']) ?></p>
        <hr>
    <?php endforeach; ?>
</body>
</html>
