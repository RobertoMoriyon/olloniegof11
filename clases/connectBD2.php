<?php

	include_once("config2.php");
	
	$link = mysqli_connect($username, $password, $database);
	
	$link->query("SET NAMES 'utf8'");
	
?>