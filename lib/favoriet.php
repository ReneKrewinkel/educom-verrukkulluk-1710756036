<?php

class Favoriet {
    private $connection;

    public function __construct($connection) {
        $this->connection = $connection;
    }

    public function getAllFavoriet($persoon_id) {
        $sql = "SELECT FROM persoon WHERE id = $persoon_id";
        $result = mysqli_query($this->connection, $sql);
        $favoriet_list = mysqli_fetch_all($result);
        return $favoriet_list;
    }

    public function isFavoriet($persoon_id, $recept_id) {
        $subquery = "SELECT 1 FROM favoriet WHERE persoon_id = $persoon_id AND recept_id = $recept_id LIMIT 1";
        $query = "SELECT EXISTS($subquery) AS record_exists";

        $result = mysqli_query($this->connection, $query);
    
        if ($result) {
            $row = mysqli_fetch_assoc($result);
            return (bool) $row['record_exists'];
        } else {
            return null;
        }
    }
}