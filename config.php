<?php

    //Configuración del proyecto (puertos, usuarios, etc...)
   
	// Cambiar las variables según el entorno -- Pendiente

    $servername = getenv('IP');
    $username = getenv('C9_USER');
    $password = "";
    $database = "olloniego";
    $dbport = 3306;

?>