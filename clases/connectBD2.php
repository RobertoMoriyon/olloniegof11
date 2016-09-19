<?php

	$link = mysql_connect("localhost","wsrveimp","caseyuqi");
	
	if ($link){
		mysql_select_db("wsrveimp_olloniego",$link);
	}

	$link->query("SET NAMES 'utf8'");
	
?>