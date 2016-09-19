	<?php
		include_once("clases/connectBD2.php");
		
		$resultado = mysqli_query($link,"SELECT *,TIMESTAMPDIFF(YEAR,fecha_nac,CURDATE()) AS edad from jugadores");
	    
	    $porteros = "<div class='row'>";
	    $defensas = "<div class='row'>";
	    $medios = "<div class='row'>";
	    $delanteros = "<div class='row'>";
		
		while($fila = mysqli_fetch_assoc($resultado)){
			
			if ($fila["posicion"]==portero) {
				$porteros .= "	<div class='col-md-3'>
									<div class='card card-profile'>
										<div class='card-avatar'>
											<a href='#pablo'>
												<img class='img' src='".$fila["foto"]."' />
											</a>
										</div>
	
										<div class='content'>
											<h4 class='card-title'>".$fila["dorsal"].". ".$fila["nombre"]." ".$fila["apellidos"]."</h4>
											<h6 class='category text-muted'>Edad: ".$fila["edad"]."</h6>
	
											<p class='card-description'></p>";
											
									if ($fila["facebook"] != "") {
										$porteros .= "<div class='footer'>
												<a href='".$fila["facebook"]."' target='_blank' class='btn btn-just-icon btn-facebook btn-round'><i class='fa fa-facebook'></i></a>
												<a href='#' target='_blank' class='btn btn-just-icon btn-mail btn-round'><i class='fa fa-mail'></i></a>
											</div>";
									}
									$porteros .= "</div>
											</div>
										</div>";
			}
			if ($fila["posicion"]==defensa) {
				$defensas .= "	<div class='col-md-3'>
									<div class='card card-profile'>
										<div class='card-avatar'>
											<a href='#pablo'>
												<img class='img' src='".$fila["foto"]."' />
											</a>
										</div>
	
										<div class='content'>
											<h4 class='card-title'>".$fila["dorsal"].". ".$fila["nombre"]." ".$fila["apellidos"]."</h4>
											<h6 class='category text-muted'>Edad: ".$fila["edad"]."</h6>
	
											<p class='card-description'></p>";
											if ($fila["facebook"] != "") {
										$defensas .= "<div class='footer'>
												<a href='".$fila["facebook"]."' target='_blank' class='btn btn-just-icon btn-facebook btn-round'><i class='fa fa-facebook'></i></a>
											</div>";
									}
									$defensas .= "
										</div>
									</div>
								</div>";
			}
			if ($fila["posicion"]==medio) {
				$medios .= "<div class='col-md-3'>
									<div class='card card-profile'>
										<div class='card-avatar'>
											<a href='#pablo'>
												<img class='img' src='".$fila["foto"]."' />
											</a>
										</div>
	
										<div class='content'>
											<h4 class='card-title'>".$fila["dorsal"].". ".$fila["nombre"]." ".$fila["apellidos"]."</h4>
											<h6 class='category text-muted'>Edad: ".$fila["edad"]."</h6>
	
											<p class='card-description'></p>";
											if ($fila["facebook"] != "") {
												$medios .= "<div class='footer'>
												<a href='".$fila["facebook"]."' target='_blank' class='btn btn-just-icon btn-facebook btn-round'><i class='fa fa-facebook'></i></a>
												</div>";
											} else {
												$medios .= "<div class='footer'>
												<a href='#' target='_blank' class='btn btn-just-icon btn-mail btn-round'><i class='fa fa-mail'></i></a>
												</div>";

											}
									$medios .= "
										</div>
									</div>
								</div>";
			}
			if ($fila["posicion"]==delantero) {
				$delanteros .= "<div class='col-md-3'>
									<div class='card card-profile'>
										<div class='card-avatar'>
											<a href='#pablo'>
												<img class='img' src='".$fila["foto"]."' />
											</a>
										</div>
	
										<div class='content'>
											<h4 class='card-title'>".$fila["dorsal"].". ".$fila["nombre"]." ".$fila["apellidos"]."</h4>
											<h6 class='category text-muted'>Edad: ".$fila["edad"]."</h6>
	
											<p class='card-description'></p>
											<div class='footer'>
												<a href='".$fila["facebook"]."' target='_blank' class='btn btn-just-icon btn-facebook btn-round'><i class='fa fa-facebook'></i></a>
											</div>
										</div>
									</div>
								</div>";
			}
			
		}
		$porteros .= '</div>';
		$defensas .= '</div>';
		$medios .= '</div>';
		$delanteros .= '</div>';

	?>
	
	
	<!doctype html>
	<html lang="es">
	<head>
		<?php include_once ("templates/head.php");?>
		<style>
			.page-header {
				min-height: 30vh !important;
				height: 27vh !important;
			}
		</style>
	</head>

	<body class="pricing">

		<?php include_once ("templates/nav.php");?>


		<div class="page-header header-filter" data-parallax="active" style="background-image: url('public/img/actualidad.jpg');">
		</div>
		
			
		<div class="main main-raised">
			<div class="container">
				<div class="section">
					<h3 class="title text-left">Porteros</h3>
					<br />
					<?php
						echo $porteros;
					?>
				</div>
			</div>
				
			<div class="pricing-5 section-gray" id="pricing-5">
				<div class="container">
					<h3 class="title text-left">Defensas</h3>
					<br />
					<?php
						echo $defensas;
					?>
				</div>
			</div>
			<div class="container">
				<div class="section">
					<h3 class="title text-left">Medios</h3>
					<br />
					<?php
						echo $medios;
					?>
				</div>
			</div>
			<div class="pricing-5 section-gray" id="pricing-5">
				<div class="container">
					<h3 class="title text-left">Delateros</h3>
					<br />
					<?php
						echo $delanteros;
					?>
				</div>
			</div>
		</div>

		<?php include_once ("templates/footer2.php");?>    
		   
		<?php include_once ("templates/scripts.php");?>
	</body>
		

	</html>
