<?php

class Recept {
    private $connection;

    public function __construct($connection) {
        $this->connection = $connection;
    }


    public function getAllRecept() {
        $sql = "SELECT * FROM recept";
        $result = mysqli_query($this->connection, $sql);
        $recept_list = mysqli_fetch_array($result);
        return $recept_list;
    }
    
    public function getRecept($recept_id) {
        $sql = "SELECT * FROM recept WHERE id = $recept_id";
        $result = mysqli_query($this->connection, $sql);
        $recept = mysqli_fetch_array($result);
        return $recept;
    }

}
