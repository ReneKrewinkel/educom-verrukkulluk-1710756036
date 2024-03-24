<?php
require_once("lib/database.php");
require_once("lib/persoon.php");
require_once("lib/favoriet.php");

/// INIT
$db = new database();

$persoon = new Persoon($db->getConnection());
$favoriet = new Favoriet($db->getConnection());

if ($favoriet->isFavoriet(4,1)){
    echo "success";
}
else {
    echo "fail";
}
echo "<br/>";