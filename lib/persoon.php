<?php

class Persoon {

    private $connection;

    public function __construct($connection) {
        $this->connection = $connection;
    }

    public function getPersoon($persoon_id){
        $sql = "SELECT * FROM persoon WHERE id = $persoon_id";
        $result = mysqli_query($this->connection, $sql);
        $user = mysqli_fetch_array($result);
        return $user;
    }
}