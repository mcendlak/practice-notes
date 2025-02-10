<?php
require_once 'Database.php';

class PostController {
    private $pdo;
    private $perPage = 10;

    public function __construct(Database $database) {
        $this->pdo = $database->getConnection();
    }

    public function getPosts() {
        $page = isset($_GET['page']) ? (int)$_GET['page'] : 1;
        $offset = ($page - 1) * $this->perPage;

        $stmt = $this->pdo->prepare("SELECT * FROM posts LIMIT :limit OFFSET :offset");
        $stmt->bindValue(':limit', $this->perPage, PDO::PARAM_INT);
        $stmt->bindValue(':offset', $offset, PDO::PARAM_INT);
        $stmt->execute();

        $posts = $stmt->fetchAll(PDO::FETCH_ASSOC);

        header('Content-Type: application/json');
        echo json_encode($posts);
    }
}