<?php

	//include_once("config2.php");
	
	//$link = mysqli_connect($username, $password, $database);
	
	$link = mysqli_connect("localhost","wsrveimp","caseyuqi");
	
	if ($link){
		mysqli_select_db("wsrveimp_olloniego",$link);
	}
	
	$link->query("SET NAMES 'utf8'");
	
?>