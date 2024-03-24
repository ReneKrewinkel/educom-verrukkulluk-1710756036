<?php

class Winkelmand {
    private $connection;

    public function __construct($connection) {
        $this->connection = $connection;
    }

    // helper function to query one item
    private function query_single_to_array($query) {
        $result = mysqli_query($this->connection, $query);
        $item = mysqli_fetch_array($result);
        return $item;
    }

    // helper function to query multiple items
    private function query_all_to_array($query) {
        $result = mysqli_query($this->connection, $query);
        $list = mysqli_fetch_object($result);
        return $list;
    }

    public function getWinkelmand($winkelmand_id) {
        $sql = "SELECT * FROM winkelmand WHERE id = $winkelmand_id";
        return $this->query_single_to_array($sql);
    }



}