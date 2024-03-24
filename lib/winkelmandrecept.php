<?php

class Winkelmandrecept {
    private $connection;

    public function __construct($connection) {
        $this->connection = $connection;
    }

    // helper function to query multiple items
    private function query_all_to_array($query) {
        $result = mysqli_query($this->connection, $query);
        $list = mysqli_fetch_object($result);
        return $list;
    }
    
    public function getAllWinkelmandRecept($winkelmand_id) {
        $sql = "SELECT * FROM winkelmandrecept WHERE winkelmand_id = $winkelmand_id";
        return $this->query_all_to_array($sql);
    }
}