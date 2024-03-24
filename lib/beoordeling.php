<?php

class Beoordeling {
    private $connection;

    public function __construct($connection) {
        $this->connection = $connection;
    }
    
    public function calcSterren($recept_id) {
        $sql = "SELECT * FROM beoordeling WHERE recept_id = $recept_id";
        $result = mysqli_query($this->connection, $sql);
        $beoordeling_list = mysqli_fetch_object($result);
        $sterren = 0;
        foreach ($beoordeling_list as $beoordeling) {
            $sterren += $beoordeling[3];
        }
        return $sterren/count($beoordeling_list);
    }
}