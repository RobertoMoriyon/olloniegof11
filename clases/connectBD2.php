<?php

	include_once("Config/config2.php");
	
	$link = mysqli_connect($servername, $username, $password, $database, $dbport);
	
	$link->query("SET NAMES 'utf8'");
	
?>