<?php

class Recept_property {
    private $connection;

    public function __construct($connection) {
        $this->connection = $connection;
    }
    
    public function getKeuken($keuken_id) {
        $sql = "SELECT * FROM recept_property WHERE id = '$keuken_id'";
        $result = mysqli_query($this->connection, $sql);
        $keuken = mysqli_fetch_array($result);
        return $keuken;}
    
    public function getType($type_id) {
        $sql = "SELECT * FROM recept_property WHERE id = '$type_id'";
        $result = mysqli_query($this->connection, $sql);
        $keuken = mysqli_fetch_array($result);
        return $keuken;}
}