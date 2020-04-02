<?php
//including the database connection file
include_once("classes/Crud.php");
include_once("classes/Validation.php");

$crud = new Crud();
$validation = new Validation();

if(isset($_POST['Submit'])) {	
	$name = $crud->escape_string($_POST['username']);
    $firstname = $crud->escape_string($_POST['firstname']);
    $lastname = $crud->escape_string($_POST['lastname']);
    $email = $crud->escape_string($_POST['email']);
    $password = $crud->escape_string($_POST['password']);
		
	$msg = $validation->check_empty($_POST, array('username','firstname','lastname', 'email','password'));
	$check_email = $validation->is_email_valid($_POST['email']);
	
	// checking empty fields
	if($msg != null) {
		echo $msg;		
		//link to the previous page
		echo "<br/><a href='javascript:self.history.back();'>Go Back</a>";
	}  elseif (!$check_email) {
		echo 'Please provide proper email.';
	}	
	else { 
		// if all the fields are filled (not empty) 
			
		//insert data to database	
		$result = $crud->execute("INSERT INTO users(username,firstname,lastname,email,password) VALUES('$name','$firstname','$lastname','$email','$password')");
		
		//display success message
		echo "<font color='green'>Data added successfully.";
		
	}
}

var_dump($POST);
$pageName='login.phtml';
include 'layout.phtml';