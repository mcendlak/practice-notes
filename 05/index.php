<?php
require '../common/Database.php';

function bbcodeToHtml($text) {
    $text = htmlspecialchars($text, ENT_QUOTES, 'UTF-8');
    $text = preg_replace('/\[b\](.*?)\[\/b\]/i', '<strong>$1</strong>', $text);
    $text = preg_replace('/\[quote\](.*?)\[\/quote\]/is', '<blockquote>$1</blockquote>', $text);
    return nl2br($text);
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $username = filter_input(INPUT_POST, 'username', FILTER_SANITIZE_SPECIAL_CHARS);
    $comment = filter_input(INPUT_POST, 'comment', FILTER_SANITIZE_SPECIAL_CHARS);
    
    if ($username && $comment) {
        $pdo = new PDO($dsn, $db_user, $db_pass, [PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION]);
        $stmt = $pdo->prepare("INSERT INTO comments (username, comment) VALUES (:username, :comment)");
        $stmt->execute(['username' => $username, 'comment' => $comment]);
    }
}

$pdo = new PDO($dsn, $db_user, $db_pass, [PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION]);
$comments = $pdo->query("SELECT * FROM comments ORDER BY created_at DESC")->fetchAll(PDO::FETCH_ASSOC);
?>

<!DOCTYPE html>
<html>
<head>
    <title>Komentarze</title>
</head>
<body>
    <form method="post">
        <label>Nick: <input type="text" name="username" required></label><br>
        <label>Komentarz:<br>
            <textarea name="comment" required></textarea>
        </label><br>
        <button type="submit">Dodaj komentarz</button>
    </form>
    
    <h2>Komentarze</h2>
    <?php foreach ($comments as $comment): ?>
        <p><strong><?= htmlspecialchars($comment['username']) ?></strong> napisał:</p>
        <p><?= bbcodeToHtml($comment['comment']) ?></p>
        <hr>
    <?php endforeach; ?>
</body>
</html>
