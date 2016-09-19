-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-09-2016 a las 19:52:46
-- Versión del servidor: 5.5.49-0ubuntu0.14.04.1
-- Versión de PHP: 5.5.9-1ubuntu4.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `olloniego2`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `acta_partidos`
--

CREATE TABLE IF NOT EXISTS `acta_partidos` (
  `id_acta` int(3) NOT NULL AUTO_INCREMENT,
  `id_equipo_local` int(3) NOT NULL DEFAULT '0',
  `id_equipo_visitante` int(3) NOT NULL DEFAULT '0',
  `id_torneo` int(3) NOT NULL DEFAULT '0',
  `num_jornada` int(3) DEFAULT NULL,
  `gol_local` int(3) NOT NULL DEFAULT '0',
  `gol_visitante` int(3) NOT NULL DEFAULT '0',
  `fecha` date DEFAULT NULL,
  `arbitro` varchar(50) NOT NULL,
  `incidencias` varchar(500) DEFAULT NULL,
  `partido_jugado` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_acta`,`id_equipo_local`,`id_equipo_visitante`,`id_torneo`),
  KEY `id_equipo_local` (`id_equipo_local`),
  KEY `id_equipo_visitante` (`id_equipo_visitante`),
  KEY `id_torneo` (`id_torneo`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Volcado de datos para la tabla `acta_partidos`
--

INSERT INTO `acta_partidos` (`id_acta`, `id_equipo_local`, `id_equipo_visitante`, `id_torneo`, `num_jornada`, `gol_local`, `gol_visitante`, `fecha`, `arbitro`, `incidencias`, `partido_jugado`) VALUES
(1, 1, 2, 1, 1, 5, 1, '2015-09-26', '', NULL, 1),
(2, 6, 1, 1, 2, 0, 0, '2015-10-04', '', NULL, 0),
(3, 1, 14, 1, 3, 0, 0, '2015-10-17', '', NULL, 0),
(4, 13, 1, 1, 4, 0, 0, '2015-10-25', '', NULL, 0),
(5, 1, 5, 1, 5, 0, 0, '2015-11-07', '', NULL, 0),
(6, 1, 8, 1, 6, 0, 0, '2015-11-14', '', NULL, 0),
(7, 11, 1, 1, 7, 0, 0, '2015-11-22', '', NULL, 0),
(8, 1, 9, 1, 8, 0, 0, '2015-11-28', '', NULL, 0),
(9, 3, 1, 1, 9, 0, 0, '2015-12-12', '', NULL, 0),
(10, 1, 7, 1, 10, 0, 0, '2015-12-19', '', NULL, 0),
(11, 4, 1, 1, 11, 0, 0, '2016-01-16', '', NULL, 0),
(12, 1, 10, 1, 12, 0, 0, '2016-01-16', '', NULL, 0),
(13, 12, 1, 1, 13, 0, 0, '2016-01-23', '', NULL, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `convocatorias`
--

CREATE TABLE IF NOT EXISTS `convocatorias` (
  `id_acta` int(3) NOT NULL DEFAULT '0',
  `id_jugador` int(3) NOT NULL DEFAULT '0',
  `asistira` varchar(2) DEFAULT '',
  `titular` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id_acta`,`id_jugador`),
  KEY `id_jugador` (`id_jugador`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equipos`
--

CREATE TABLE IF NOT EXISTS `equipos` (
  `id_equipo` int(3) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(25) DEFAULT NULL,
  `sede` varchar(25) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `dia` varchar(20) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `hora` varchar(20) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id_equipo`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- Volcado de datos para la tabla `equipos`
--

INSERT INTO `equipos` (`id_equipo`, `nombre`, `sede`, `dia`, `hora`) VALUES
(1, 'Peña Olloniego F11', 'Riosa', 'Sabado', '16:00'),
(2, 'Principado A.F.', 'Turon', 'Domingos', '11:30'),
(3, 'Mancheste de Barro', 'Lieres', 'Sabado', '16:00'),
(4, 'Real Asturcon', 'Tuilla', 'Sabado', '16:00'),
(5, 'Veteranos del Grisu', 'Peña Villa (Riaño)', 'Sabado', '15:30'),
(6, 'Juventus de Trubia', 'San Claudio', 'Domingo', '10:00'),
(7, 'Electricidad Cueto', 'Lada', 'Domingo', '10:00'),
(8, 'Peluquerias Fran Club Mod', 'Ujo', 'Sabado', '18:00'),
(9, 'Cafe Van Gogh Vetusta', 'Mundial 82 (Mieres)', 'Domingo', '10:00'),
(10, 'Astures', 'La Ará (Riosa)', NULL, NULL),
(11, 'Cafe Roko''s', 'Morcin', 'Domingo', '11:00'),
(12, 'Corredoria Veteranos', 'Bobes-Siero', 'Sabado', '16:00'),
(13, 'Sidrería Pesebre', 'Los Llerones (Sama)', 'Sabado', '16:00'),
(14, 'Escolina-Metalasa', 'Tuilla', 'Domingo', '11:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equipos_temporada`
--

CREATE TABLE IF NOT EXISTS `equipos_temporada` (
  `id_equipo` int(3) NOT NULL DEFAULT '0',
  `id_torneo` int(3) NOT NULL DEFAULT '0',
  `goles_favor` int(3) DEFAULT '0',
  `goles_contra` int(3) DEFAULT '0',
  `tarj_rojas` int(3) DEFAULT '0',
  `tarj_amarillas` int(3) DEFAULT '0',
  `ptos_deportividad` int(3) DEFAULT '0',
  `part_ganados` int(3) DEFAULT '0',
  `part_perdidos` int(3) DEFAULT '0',
  `part_empatados` int(3) DEFAULT '0',
  PRIMARY KEY (`id_equipo`,`id_torneo`),
  KEY `id_torneo` (`id_torneo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `equipos_temporada`
--

INSERT INTO `equipos_temporada` (`id_equipo`, `id_torneo`, `goles_favor`, `goles_contra`, `tarj_rojas`, `tarj_amarillas`, `ptos_deportividad`, `part_ganados`, `part_perdidos`, `part_empatados`) VALUES
(1, 1, 0, 0, 0, 0, 0, 0, 0, 0),
(2, 1, 0, 0, 0, 0, 0, 0, 0, 0),
(3, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(6, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(7, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(8, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(9, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(10, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(11, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(12, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(13, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(14, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `goles`
--

CREATE TABLE IF NOT EXISTS `goles` (
  `id_acta` int(3) NOT NULL DEFAULT '0',
  `id_jugador` int(3) NOT NULL DEFAULT '0',
  `minuto` int(3) DEFAULT NULL,
  PRIMARY KEY (`id_acta`,`id_jugador`),
  KEY `id_jugador` (`id_jugador`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jugadores`
--

CREATE TABLE IF NOT EXISTS `jugadores` (
  `id_jugador` int(3) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) CHARACTER SET latin1 DEFAULT NULL,
  `apellidos` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `dorsal` int(3) NOT NULL,
  `posicion` varchar(20) CHARACTER SET latin1 NOT NULL,
  `fecha_nac` date DEFAULT NULL,
  `dni` varchar(10) CHARACTER SET latin1 DEFAULT NULL,
  `telefono` int(9) DEFAULT NULL,
  `facebook` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `correo` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `foto` varchar(50) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`id_jugador`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=26 ;

--
-- Volcado de datos para la tabla `jugadores`
--

INSERT INTO `jugadores` (`id_jugador`, `nombre`, `apellidos`, `dorsal`, `posicion`, `fecha_nac`, `dni`, `telefono`, `facebook`, `correo`, `foto`) VALUES
(1, 'Javier', 'Suarez', 1, 'portero', '1992-05-22', '71681895-A', 661394770, 'https://www.facebook.com/JavierSuarezLopez', NULL, 'public/img/caras/1 100x150.jpg'),
(2, 'Ruben A.', 'Alvarez', 2, 'delantero', '1979-08-30', '71645026-A', 676268288, 'https://www.facebook.com/ruben.alvarezvalera', NULL, 'public/img/caras/2 100x150.jpg'),
(3, 'Rodrigo', 'Maniega', 3, 'delantero', '1986-04-14', '71653449-P', 671934257, 'https://www.facebook.com/rodrigo.maniega', NULL, 'public/img/caras/3 100x150.jpg'),
(4, 'Aitor', 'Monroy', 4, 'defensa', '1988-04-22', '71666014-S', 680253752, 'https://www.facebook.com/aitor.monroy', NULL, 'public/img/caras/4 100x150.jpg'),
(5, 'Ignacio', 'Alonso', 5, 'defensa', '1986-05-04', '71656704-C', 616518661, 'https://www.facebook.com/nacho.alonsoalvarez.5', NULL, 'public/img/caras/5 100x150.jpg'),
(6, 'Gerar', 'Lopez', 6, 'defensa', '1980-05-20', '71768438-C', 658519740, 'https://www.facebook.com/gerardo.lopezestrada.7', NULL, 'public/img/caras/6 100x150.jpg'),
(7, 'Goyo', 'Diaz', 7, 'delantero', '1986-04-29', '71653240-Y', 659742435, 'https://www.facebook.com/profile.php?id=100008448131844', NULL, 'public/img/caras/7 100x150.jpg'),
(8, 'Berto', 'Suarez', 8, 'delantero', '1975-11-18', '09421189-K', 633088669, 'https://www.facebook.com/floriatu', NULL, 'public/img/caras/8 100x150.jpg'),
(9, 'Saul', 'Garcia', 9, 'defensa', '1989-06-16', '71774984-B', 633797899, 'https://www.facebook.com/saul.garciasanchez.96', NULL, 'public/img/caras/9 100x150.jpg'),
(10, 'Sergio', 'Quintanal', 10, 'delantero', '1988-10-08', '71661748-G', 676637032, 'https://www.facebook.com/sergio.quintanalquiros', NULL, 'public/img/caras/10 100x150.jpg'),
(11, 'Pedro', 'Perez', 11, 'delantero', '1988-03-25', '71663117-Q', 652845602, 'https://www.facebook.com/pedro.perezdeago', NULL, 'public/img/caras/11 100x150.jpg'),
(12, 'Ruben G.', 'Gonzalez', 12, 'defensa', '1979-04-12', '71644783-J', 647724626, 'https://www.facebook.com/ruben.gonzalezalvarez.77', NULL, 'public/img/caras/12 100x150.jpg'),
(13, 'Agus', 'Lorenzo', 13, 'defensa', '1985-09-13', '71657327-E', 675251706, 'https://www.facebook.com/agustin.lorenzoarias', NULL, 'public/img/caras/13 100x150.jpg'),
(14, 'Nacho', 'Gonzalez', 14, 'medio', '1984-05-29', '71649901-W', 687001332, 'https://www.facebook.com/nachin.rodriguezgarcia', NULL, 'public/img/caras/14 100x150.jpg'),
(15, 'Miguel', 'Del Barrio', 15, 'medio', '1983-02-02', '71639479-E', 657142913, 'https://www.facebook.com/delbarriogutierrez', NULL, 'public/img/caras/15 100x150.jpg'),
(16, 'Javier N.', 'Naves', 16, 'medio', '1994-07-07', '71681442-X', 635959402, 'https://www.facebook.com/javier.navesvazquez', NULL, 'public/img/caras/16 100x150.jpg'),
(17, 'Raul G.', 'Gonzalez', 17, 'medio', '1980-07-11', '71644784-Z', 647724627, NULL, NULL, 'public/img/caras/17 100x150.jpg'),
(18, 'Viti', 'Del Valle', 18, 'medio', '1984-09-22', '71643758-T', 669284808, 'https://www.facebook.com/viti.delvalle', NULL, 'public/img/caras/18 100x150.jpg'),
(19, 'Arturo', 'Villar', 19, 'medio', '1982-02-06', '45572000-F', 686113640, 'https://www.facebook.com/arturin.villar', NULL, 'public/img/caras/19 100x150.jpg'),
(20, 'Rober', 'Moriyón', 20, 'defensa', '1979-06-17', '53386595-F', 630061717, 'https://www.facebook.com/moriyonvilla', NULL, 'public/img/caras/20 100x150.jpg'),
(21, 'Pablo', 'Perez', 21, 'medio', '1978-06-15', '09429681-A', 616907946, NULL, NULL, 'public/img/caras/21 100x150.jpg'),
(22, 'Martin', 'Velasco', 22, 'defensa', '1974-04-09', '09421763-C', 617462234, 'https://www.facebook.com/mvelascocalvillo', NULL, 'public/img/caras/22 100x150.jpg'),
(23, 'Jose Luis', 'Carballo', 23, 'medio', '1970-05-17', '09384202-H', 620800494, 'https://www.facebook.com/profile.php?id=100009787158293', NULL, 'public/img/caras/23 100x150.jpg'),
(24, 'Raul P.', 'Perez', 24, 'medio', '1981-02-23', '71639590-H', 637351211, NULL, NULL, 'public/img/caras/24 100x150.jpg'),
(25, 'Ivan', 'Fernandez', 25, 'portero', '1974-12-03', '09420641-W', 620835465, 'https://www.facebook.com/ivan.fernandezfernandez.374', NULL, 'public/img/caras/25 100x150.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jugadores_temporada`
--

CREATE TABLE IF NOT EXISTS `jugadores_temporada` (
  `id_jugador` int(3) NOT NULL DEFAULT '0',
  `id_torneo` int(3) NOT NULL DEFAULT '0',
  `part_jugados` int(3) DEFAULT '0',
  `goles` int(3) DEFAULT '0',
  `amarillas` int(3) DEFAULT '0',
  `rojas` int(3) DEFAULT '0',
  `valoracion` int(5) DEFAULT '0',
  PRIMARY KEY (`id_jugador`,`id_torneo`),
  KEY `id_torneo` (`id_torneo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `jugadores_temporada`
--

INSERT INTO `jugadores_temporada` (`id_jugador`, `id_torneo`, `part_jugados`, `goles`, `amarillas`, `rojas`, `valoracion`) VALUES
(1, 1, 0, 0, 0, 0, 0),
(2, 1, 0, 0, 0, 0, 0),
(3, 1, 0, 0, 0, 0, 0),
(4, 1, 0, 0, 0, 0, 0),
(5, 1, 0, 0, 0, 0, 0),
(6, 1, 0, 0, 0, 0, 0),
(7, 1, 0, 0, 0, 0, 0),
(8, 1, 0, 0, 0, 0, 0),
(9, 1, 0, 0, 0, 0, 0),
(10, 1, 0, 0, 0, 0, 0),
(11, 1, 0, 0, 0, 0, 0),
(12, 1, 0, 0, 0, 0, 0),
(13, 1, 0, 0, 0, 0, 0),
(14, 1, 0, 0, 0, 0, 0),
(15, 1, 0, 0, 0, 0, 0),
(16, 1, 0, 0, 0, 0, 0),
(17, 1, 0, 0, 0, 0, 0),
(18, 1, 0, 0, 0, 0, 0),
(19, 1, 0, 0, 0, 0, 0),
(20, 1, 0, 0, 0, 0, 0),
(21, 1, 0, 0, 0, 0, 0),
(22, 1, 0, 0, 0, 0, 0),
(23, 1, 0, 0, 0, 0, 0),
(24, 1, 0, 0, 0, 0, 0),
(25, 1, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tarjetas`
--

CREATE TABLE IF NOT EXISTS `tarjetas` (
  `id_acta` int(3) NOT NULL DEFAULT '0',
  `id_jugador` int(3) NOT NULL DEFAULT '0',
  `minuto` int(3) DEFAULT NULL,
  `color` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id_acta`,`id_jugador`),
  KEY `id_jugador` (`id_jugador`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `torneo`
--

CREATE TABLE IF NOT EXISTS `torneo` (
  `id_torneo` int(3) NOT NULL AUTO_INCREMENT,
  `torneo` varchar(25) DEFAULT NULL,
  `temporada` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id_torneo`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `torneo`
--

INSERT INTO `torneo` (`id_torneo`, `torneo`, `temporada`) VALUES
(1, 'Primera División', '16/17'),
(2, 'Copa', '16/17');

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `acta_partidos`
--
ALTER TABLE `acta_partidos`
  ADD CONSTRAINT `acta_partidos_ibfk_1` FOREIGN KEY (`id_equipo_local`) REFERENCES `equipos` (`id_equipo`),
  ADD CONSTRAINT `acta_partidos_ibfk_2` FOREIGN KEY (`id_equipo_visitante`) REFERENCES `equipos` (`id_equipo`),
  ADD CONSTRAINT `acta_partidos_ibfk_3` FOREIGN KEY (`id_torneo`) REFERENCES `torneo` (`id_torneo`);

--
-- Filtros para la tabla `convocatorias`
--
ALTER TABLE `convocatorias`
  ADD CONSTRAINT `convocatorias_ibfk_1` FOREIGN KEY (`id_acta`) REFERENCES `acta_partidos` (`id_acta`),
  ADD CONSTRAINT `convocatorias_ibfk_2` FOREIGN KEY (`id_jugador`) REFERENCES `jugadores` (`id_jugador`);

--
-- Filtros para la tabla `equipos_temporada`
--
ALTER TABLE `equipos_temporada`
  ADD CONSTRAINT `equipos_temporada_ibfk_1` FOREIGN KEY (`id_equipo`) REFERENCES `equipos` (`id_equipo`),
  ADD CONSTRAINT `equipos_temporada_ibfk_2` FOREIGN KEY (`id_torneo`) REFERENCES `torneo` (`id_torneo`);

--
-- Filtros para la tabla `goles`
--
ALTER TABLE `goles`
  ADD CONSTRAINT `goles_ibfk_1` FOREIGN KEY (`id_acta`) REFERENCES `acta_partidos` (`id_acta`),
  ADD CONSTRAINT `goles_ibfk_2` FOREIGN KEY (`id_jugador`) REFERENCES `jugadores` (`id_jugador`);

--
-- Filtros para la tabla `jugadores_temporada`
--
ALTER TABLE `jugadores_temporada`
  ADD CONSTRAINT `jugadores_temporada_ibfk_1` FOREIGN KEY (`id_jugador`) REFERENCES `jugadores` (`id_jugador`),
  ADD CONSTRAINT `jugadores_temporada_ibfk_2` FOREIGN KEY (`id_torneo`) REFERENCES `torneo` (`id_torneo`);

--
-- Filtros para la tabla `tarjetas`
--
ALTER TABLE `tarjetas`
  ADD CONSTRAINT `tarjetas_ibfk_1` FOREIGN KEY (`id_acta`) REFERENCES `acta_partidos` (`id_acta`),
  ADD CONSTRAINT `tarjetas_ibfk_2` FOREIGN KEY (`id_jugador`) REFERENCES `jugadores` (`id_jugador`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
