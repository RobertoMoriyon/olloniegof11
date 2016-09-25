<?php

	include_once("config/config.php");
	
	$link = mysqli_connect($servername, $username, $password, $database, $dbport);
	
	$link->query("SET NAMES 'utf8'");
	
?>