<?php

	include_once("config.php");
	
	$link = mysqli_connect($servername, $username, $password, $database, $dbport);
	
	$link->query("SET NAMES 'utf8'");
	
	/*
	 * Nombre: consulta
	 * Objetivo: Sirve para realizar consultas, hace un fetch_assoc interno y hace un callback con los datos
	 * Parametros: query_sql (String tipo consulta SQL) y cb (funcion a ejecutar con un parametro con los datos de la query) - Opcional
	*/

	function consulta($query_sql){
		
		echo $query_sql;
		//Aqui viene el query
		$resultado = mysqli_query($link,$query_sql);
		
		return $resultado;
	}

?>