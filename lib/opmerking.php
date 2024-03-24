<?php

class Opmerking {
    private $connection;

    public function __construct($connection) {
        $this->connection = $connection;
    }

    public function getAllOpmerking($recept_id) {
        $sql = "SELECT * FROM opmerking WHERE id = $recept_id";
        $result = mysqli_query($this->connection, $sql);
        $opmerking_list = mysqli_fetch_all($result);
        return $opmerking_list;
    }
}