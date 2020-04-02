<?php
//including the database connection file
include_once("classes/Crud.php");

$crud = new Crud();
//fetching data in descending order (lastest entry first)
$query = "SELECT * FROM post ORDER BY id DESC";
$result = $crud->getData($query);
include 'index.phtml';