<?php

class Database {
    private $dsn;
    private $user;
    private $password;
    private $connection;

    public function __construct($host, $port, $dbname, $user, $password = null, $charset = 'utf8mb4') {
        $this->dsn = "mysql:host=$host;port=$port;dbname=$dbname;charset=$charset";
        $this->user = $user;
        $this->password = $password;

        $this->connect();
    }

    private function connect() {
        try {
            $this->connection = new PDO($this->dsn, $this->user, $this->password);
        } catch (PDOException $e) {
            die("Błąd połączenia z bazą danych: " . $e->getMessage() . "(" . $e->getCode() . ")");
        }
    }

    public function selectAll($table){
        return $this->select("*", $table);
    }

    public function select($query, $table, $where = []){
        $wherePart = [];
        $params = [];

        if (!empty($where)) {
            foreach ($where as $column => $value) {
                $wherePart[] = "$column = :$column";
                $params[":$column"] = $value;
            }
        }

        $sql = "SELECT $query FROM $table";
        if (!empty($wherePart)) {
            $sql .= " WHERE " . implode(' AND ', $wherePart);
        }

        try {
            $statement = $this->connection->prepare($sql);
            $statement->execute($params);
            return $statement->fetchAll(PDO::FETCH_ASSOC);
        } catch (PDOException $e) {
            throw new Exception("Błąd podczas wykonywania zapytania SELECT: " . $e->getMessage());
        }
    }

    public function leftJoin($table1, $table2, $on, $columns = "*") {
        $sql = "SELECT $columns FROM $table1 LEFT JOIN $table2 ON $on";
    
        try {
            $statement = $this->connection->prepare($sql);
            $statement->execute();
            return $statement->fetchAll(PDO::FETCH_ASSOC);
        } catch (PDOException $e) {
            throw new Exception("Błąd podczas wykonywania LEFT JOIN: " . $e->getMessage());
        }
    }

    public function alter($table, $alterQuery) {
        $sql = "ALTER TABLE $table $alterQuery";
        try {
            $this->connection->exec($sql);
            return true;
        } catch (PDOException $e) {
            throw new Exception("Błąd Database->alter: " . $e->getMessage());
        }
    }

    public function update($table, $data, $where) {
        $setPart = [];
        $params = [];

        foreach ($data as $column => $value) {
            $setPart[] = "$column = :$column";
            $params[":$column"] = $value;
        }

        $wherePart = [];
        foreach ($where as $column => $value) {
            $wherePart[] = "$column = :where_$column";
            $params[":where_$column"] = $value;
        }

        $sql = "UPDATE $table SET " . implode(', ', $setPart) . " WHERE " . implode(' AND ', $wherePart);
        
        try {
            $statement = $this->connection->prepare($sql);
            $statement->execute($params);
            return $statement->rowCount();
        } catch (PDOException $e) {
            throw new Exception("Błąd podczas aktualizacji: " . $e->getMessage());
        }
    }

    public function delete($table, $id){
        $sql = "DELETE FROM $table WHERE id = :id";
        try {
            $statement = $this->connection->prepare($sql);
            $statement->execute([':id' => $id]);
            return $statement->rowCount();
        } catch (PDOException $e) {
            throw new Exception("Błąd podczas usuwania: " . $e->getMessage());
        }
    }

}