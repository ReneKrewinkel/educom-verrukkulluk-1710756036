<?php

class Ingredientregel {
    private $connection;

    public function __construct($connection) {
        $this->connection = $connection;
    }

    public function getAllIngredientregel($recept_id) {
        $sql = "SELECT * FROM ingredientregel WHERE recept_id = $recept_id";
        $result = mysqli_query($this->connection, $sql);
        $ingredientregel_list = mysqli_fetch_all($result);
        return $ingredientregel_list;
    }

    public function calcCalorien($recept_id) {
        $ingredientregel_list = $this->getAllIngredientregel($recept_id);
        $calorien = 0;
        foreach ($ingredientregel_list as $ingredientregel) {
            $sql = "SELECT * FROM ingredient WHERE id = $ingredientregel[2]";
            $result = mysqli_query($this->connection, $sql);
            $ingredient = mysqli_fetch_array($result);
            $calorien += ($ingredient[3] * ($ingredientregel[3]/$ingredient[5]));
        }
    }
}