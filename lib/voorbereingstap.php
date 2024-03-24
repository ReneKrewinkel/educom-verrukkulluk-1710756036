<?php

class Voorbereidingstap {
    private $connection;

    public function __construct($connection) {
        $this->connection = $connection;
    }

    public function getAllVoorbereidingstap($recept_id) {
        $sql = "SELECT * FROM recept WHERE id = $recept_id";
        $result = mysqli_query($this->connection, $sql);
        $voorbereidingsap_list = mysqli_fetch_all($result);
        return $voorbereidingsap_list;
    }
}