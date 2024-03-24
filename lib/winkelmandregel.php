<?php

class Winkelmandregel {
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

    private function query_single_to_array($query) {
        $result = mysqli_query($this->connection, $query);
        $item = mysqli_fetch_array($result);
        return $item;
    }

    public function getAllWinkelmandRegel($winkelmand_id) {
        $sql = "SELECT * FROM winkelmandregel WHERE winkelmand_id = $winkelmand_id";
        return $this->query_all_to_array($sql);
    }

    public function calcPrijs($winkelmand_id){
        $total_prijs = 0;
        $sql = "SELECT * FROM winkelmandregel WHERE winkelmand_id = $winkelmand_id";
        $result = mysqli_query($this->connection, $sql);
        $winkelmandregel_list = mysqli_fetch_all($result);
        foreach ($winkelmandregel_list as $winkelmandregel) {
            $sql2 = "SELECT * FROM ingredient WHERE id = $winkelmandregel[1]";
            $ingredient = $this->query_single_to_array($sql2);
            $total_prijs += ($ingredient[4] * $winkelmandregel[3]);
        }
        return $total_prijs;
    }
}