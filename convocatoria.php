<?php
    require_once("clases/connectBD.php");
    
    
    $name = $_POST["jugad"]; // El nombre del jugador
	$asistencia = $_POST["asiste"]; // Si asistira o no

    //************************************************************************************
    //Preparar la consulta para sacar en el select del Modal los nombres de los jugadores
    $consulta = "SELECT nombre from jugadores";
    $query = mysqli_query($link,$consulta);
    $drop_jugadores = "";
    // inicializamos el contador para los value dentro de las option y  lo ponemos a 1 para que coincida con el primer jugador en la bbdd
    $i = 1;
    while($fila = mysqli_fetch_assoc($query)){
        $drop_jugadores .= "<option value=".$i.">".$i.". ".$fila["nombre"]."</option>";
        $i++;
    }
    //************************************************************************************
    
    $consulta_acta = "SELECT acta_partidos.id_torneo, torneo.torneo, id_acta, num_jornada, equipo_local.sede, equipo_local.nombre AS local, equipo_visitante.nombre as visitante, fecha
                        FROM equipos AS equipo_local, equipos AS equipo_visitante, acta_partidos, torneo
                        WHERE equipo_local.id_equipo = id_equipo_local
                        AND equipo_visitante.id_equipo = id_equipo_visitante
                        AND partido_jugado = 
                        FALSE AND acta_partidos.id_torneo = torneo.id_torneo
                        ORDER BY fecha
                        LIMIT 0 , 1";
    $query_acta = mysqli_query($link,$consulta_acta);
    $fila_acta = mysqli_fetch_assoc($query_acta);
    $acta_partido = "<h6 class='category text-info'>".$fila_acta["torneo"]."</h6>
                        <h3 class='card-title'>".$fila_acta["local"]."</h3>
                        <h3 class='card-title'>vs</h3>
                        <h3 class='card-title'>".$fila_acta["visitante"]."</h3>
                        <p class='card-description'>
                            ".$fila_acta["sede"].", ".$fila_acta["fecha"]."
                        </p>
                    ";
     //************************************************************************************
    $acta_of = $fila_acta["id_acta"];
    if ($name != "") {
         mysqli_query($link,"
         INSERT INTO convocatorias(id_acta,id_jugador,asistira)
          VALUES ('$acta_of','$name','$asistencia') 
          ON DUPLICATE KEY UPDATE asistira = '$asistencia'
         ");
     }
    //************************************************************************************
    $consulta_conv_si = "SELECT nombre, asistira FROM jugadores, convocatorias WHERE jugadores.id_jugador = convocatorias.id_jugador AND asistira = 'SI'";
    $query_conv_si = mysqli_query($link,$consulta_conv_si);
    $drop_si = "";
    $cont_si = 0;
    while($fila_conv_si = mysqli_fetch_assoc($query_conv_si)){
            $drop_si .= "<p class='card-description'>
                           ".$fila_conv_si["nombre"]." 
                        </p>";
            $cont_si++;
    }
    //************************************************************************************
    $consulta_conv_no = "SELECT nombre, asistira FROM jugadores, convocatorias WHERE jugadores.id_jugador = convocatorias.id_jugador AND asistira = 'NO'";
    $query_conv_no = mysqli_query($link,$consulta_conv_no);
    $drop_no = "";
    $cont_no = 0;
    while($fila_conv_no = mysqli_fetch_assoc($query_conv_no)){
            $drop_no .= "<p class='card-description'>
                           ".$fila_conv_no["nombre"]." 
                        </p>";
            $cont_no++;
    }
    //************************************************************************************
?>

<!doctype html>
<html lang="es">

<head>
    <?php include_once ( "templates/head.php");?>
    
    @import url("http://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.5.4/bootstrap-select.min.css")
    <style>
        .page-header {
            min-height: 30vh !important;
            height: 27vh !important;
        }
    </style>
</head>

<body class="pricing">

    <?php include_once ( "templates/nav.php");?>


    <div class="page-header header-filter" data-parallax="active" style="background-image: url('public/img/convocatoria.jpg');">

    </div>


    <div class="main main-raised">
        <div class="container">
            <div class="section text-left">
                <h2 class="title">Convocatoria</h2>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="card card-raised card-background" style="background-image: url('public/img/Riosa.JPG')">
                        <div class="content">
                             <?php 
                                echo $acta_partido;
                            ?>
                            <!-- Modal -->
                            <button class="btn btn-raised btn-round btn-info" data-toggle="modal" data-target="#noticeModal">
                                Vienes?
                            </button>
                            <!-- Fin Modal -->
                        </div>
                        
                    </div>
                </div>

            </div>


            <div id="cards" class="cd-section">
                <div class="cards">
                    <div class="col-md-4">
                        <div class="card">
                            <div class="content content-success">
                                <h5 class="category-social">
	    						    <i class="fa fa-thumbs-o-up"></i> Vienen <?php echo $cont_si;?> Jugadores
	    						</h5>
                                <?php
                                    echo $drop_si;
                                ?>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="card">
                            <div class="content content-danger">
                                <h5 class="category-social">
	    									<i class="fa fa-thumbs-o-down"></i> No vienen <?php echo $cont_no;?> Jugadores
	    								</h5>
                                 <?php
                                    echo $drop_no;
                                ?>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="card">
                            <div class="content content-info">
                                <h5 class="category-social">
	    									<i class="fa fa-question-circle-o"></i> TechCrunch
	    								</h5>
                                <h4 class="card-title">
	    									<a href="#pablo">"Focus on Your Employees"</a>
	    								</h4>
                                <p class="card-description">
                                    Don't be scared of the truth because we need to restart the human foundation in truth And I love you like Kanye loves Kanye I love Rick Owens’ bed design but the back is...
                                </p>
                                <div class="footer text-center">
                                    <a href="#pablo" class="btn btn-white btn-round">Read Article</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
        <!-- notice modal -->
    <div class="modal fade" id="noticeModal" role="dialog">
        <div class="modal-dialog modal-notice">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <!-- @see. http://getbootstrap.com/javascript/#modals -->
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                    </button>
                    <h4 class="modal-title">¿Vienes al próximo partido?</h4>
                </div>
                <form action="convocatoria.php" method="POST">
                    <div class="modal-body">
                        <label for="name">Jugador:</label><br>
                        <select placeholder="Elegir Jugador" name="jugad">
                            <?php echo $drop_jugadores; ?>
                        </select><br>
                        <label for="name">Asistiras?</label><br>
                        <select name="asiste">
                            <option value="SI">SI</option>
                            <option value="NO">NO</option>
                        </select>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                        <button type="submit" class="btn btn-primary">Enviar</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <!-- notice modal -->
    
    <?php include_once ( "templates/footer2.php");?>
    <?php include_once ( "templates/scripts.php");?>
</body>


</html>