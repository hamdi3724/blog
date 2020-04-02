<?php 
        //including the database connection file
    include_once("classes/Crud.php");

    $crud = new Crud();
    //getting id of the data from url
    $id = $crud->escape_string($_GET['id']);
    //fetching data 
    $query = "SELECT * FROM post WHERE id = $id ";
    $result = $crud->getData($query);

    $pageName = 'article.phtml';
    include 'layout.phtml';

?>