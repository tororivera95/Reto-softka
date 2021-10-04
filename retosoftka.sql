-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 04-10-2021 a las 20:17:51
-- Versión del servidor: 10.4.20-MariaDB
-- Versión de PHP: 8.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `retosoftka`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `acumulado`
--

CREATE TABLE `acumulado` (
  `id` int(11) NOT NULL COMMENT 'id del acumulado',
  `id_jugador` int(11) NOT NULL COMMENT 'id del participante',
  `id_premio` int(11) NOT NULL COMMENT 'id del premio a ganar'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `acumulado`
--

INSERT INTO `acumulado` (`id`, `id_jugador`, `id_premio`) VALUES
(1, 123, 5),
(2, 12344, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `id` int(11) NOT NULL COMMENT 'id Categoria',
  `nombre` varchar(50) COLLATE utf8_spanish_ci NOT NULL COMMENT 'nombre de la categoria'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`id`, `nombre`) VALUES
(1, 'Ciencia'),
(2, 'Cultura Colombiana'),
(3, 'Deporte '),
(4, 'Matematicas'),
(5, 'Historia Mundial');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dificultad`
--

CREATE TABLE `dificultad` (
  `id` int(11) NOT NULL COMMENT 'id dificultad',
  `dificultad` varchar(15) COLLATE utf8_spanish_ci NOT NULL COMMENT 'dificultad de las preguntas'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `dificultad`
--

INSERT INTO `dificultad` (`id`, `dificultad`) VALUES
(1, 'Muy Facil'),
(2, 'Facil'),
(3, 'Medio'),
(4, 'Duro'),
(5, 'Leyenda');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `juego`
--

CREATE TABLE `juego` (
  `id` int(11) NOT NULL COMMENT 'id del juego',
  `fecha` date NOT NULL COMMENT 'fecha del juego',
  `idJugador` int(11) NOT NULL COMMENT 'id del jugador',
  `idDificultad` int(11) NOT NULL COMMENT 'id dificultad',
  `idPremio` int(11) NOT NULL COMMENT 'id Premios'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `juego`
--

INSERT INTO `juego` (`id`, `fecha`, `idJugador`, `idDificultad`, `idPremio`) VALUES
(1, '2021-10-01', 123, 5, 5),
(5, '2021-10-04', 12344, 5, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `participantes`
--

CREATE TABLE `participantes` (
  `id` int(11) NOT NULL COMMENT 'id del participante con el cual se va a identificar',
  `nombre` varchar(20) COLLATE utf8_spanish_ci NOT NULL COMMENT 'nombre del participante',
  `apellido` varchar(20) COLLATE utf8_spanish_ci NOT NULL COMMENT 'apellido del participante',
  `edad` int(3) NOT NULL COMMENT 'edad del participante',
  `gano` char(2) COLLATE utf8_spanish_ci NOT NULL COMMENT 'Si - Participo y gano\r\nNo - Participo y perdio\r\nNA - sin participar'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `participantes`
--

INSERT INTO `participantes` (`id`, `nombre`, `apellido`, `edad`, `gano`) VALUES
(123, 'Pedrito', 'Jaramillo', 54, 'SI'),
(12344, 'Federico', 'Florez', 20, 'SI'),
(12345, 'Javier', 'Lopez', 25, 'NA'),
(54321, 'Laura', 'Ocampo', 45, 'NA'),
(67890, 'Pedro', 'Gonzales', 56, 'NA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `preguntas`
--

CREATE TABLE `preguntas` (
  `id` int(11) NOT NULL COMMENT 'id preguntas',
  `pregunta` varchar(100) COLLATE utf8_spanish_ci NOT NULL COMMENT 'pregunta',
  `idCategoria` int(11) NOT NULL COMMENT 'id categoria',
  `idDificultad` int(11) NOT NULL COMMENT 'id Dificultad'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `preguntas`
--

INSERT INTO `preguntas` (`id`, `pregunta`, `idCategoria`, `idDificultad`) VALUES
(1, '¿Cómo se llama el componente mínimo que forma a los seres vivos?', 1, 1),
(2, '¿Cuál es la moneda de Colombia? ', 2, 1),
(3, '¿Quien es James Rodriguez?', 3, 1),
(4, '¿El resultado de la siguiente operacion es?\r\n(2+2)*5', 4, 1),
(5, '¿Quién fue el primer Presidente de Estados Unidos?', 5, 1),
(6, 'La información genética en las células se localiza', 1, 2),
(7, '¿Con qué océanos limita Colombia?', 2, 2),
(8, '¿En que año el Once Caldas de Manizales gano la Copa Libertadores?', 3, 2),
(9, '¿A cuánto equivale π?', 4, 2),
(10, '¿En qué año se disolvió la Unión Soviética?', 5, 2),
(11, 'Al descendiente del cruce de un asno y una yegua se le conoce como', 1, 3),
(12, '¿Qué colombiano escribió la famosa novela romántica María?', 2, 3),
(13, '¿Qué jugador de fútbol ha ganado más copas del mundo?', 3, 3),
(14, '¿Qué formula es esta?\r\nS = PI x R²', 4, 3),
(15, '¿Qué científico es considerado el Padre de la Bomba Atómica?', 5, 3),
(16, '¿Cuál es el nombre de la sustancia que le da a la piel y al cabello su pigmentación?', 1, 4),
(17, '¿Quién lideró la rebelión de esclavos en Cartagena en 1599?', 2, 5),
(18, '¿Quién es el jugador de las grandes ligas con el mayor número de jonrones en la historia?', 3, 4),
(19, 'Seis obreros enlosan 1200 metros cuadrados de suelo en cuatro días. ¿Cuántos metros cuadrados enlosa', 4, 4),
(20, '¿Qué civilización prehispánica adoró al dios Kukulkán?', 5, 4),
(21, 'Cuanto mide la Tierra?', 1, 5),
(22, '¿Quién fue el primer medallista olímpico colombiano?', 2, 5),
(23, '¿Con qué equipo jugó las finales de la NBA Jason Kidd en los años 2002 y 2003?', 3, 5),
(24, '¿Cuánto es la cuarta parte de la tercera parte?', 4, 5),
(25, '¿A través de qué río africano se alzó el antiguo Egipto?', 5, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `premios`
--

CREATE TABLE `premios` (
  `id` int(11) NOT NULL COMMENT 'id Premios',
  `valorPremio` int(10) NOT NULL COMMENT 'valor premio'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `premios`
--

INSERT INTO `premios` (`id`, `valorPremio`) VALUES
(1, 100000),
(2, 300000),
(3, 800000),
(4, 5000000),
(5, 10000000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `respuestas`
--

CREATE TABLE `respuestas` (
  `id` int(11) NOT NULL COMMENT 'id respuestas',
  `respuesta` varchar(300) COLLATE utf8_spanish_ci NOT NULL COMMENT 'respuestas',
  `idPreguntas` int(11) NOT NULL COMMENT 'id preguntas',
  `valido` varchar(1) COLLATE utf8_spanish_ci NOT NULL COMMENT 'S - respuesta correcta\r\nN - respuesta incorrecta'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `respuestas`
--

INSERT INTO `respuestas` (`id`, `respuesta`, `idPreguntas`, `valido`) VALUES
(1, 'Tejido', 1, 'N'),
(2, 'Particulas', 1, 'N'),
(3, 'Celulas', 1, 'S'),
(4, 'Bellos', 1, 'N'),
(5, 'Peso Colombia', 2, 'S'),
(6, 'Euro', 2, 'N'),
(7, 'Dolar', 2, 'N'),
(8, 'Bolivar', 2, 'N'),
(9, 'Un bebedor', 3, 'N'),
(10, 'Un deportista', 3, 'S'),
(11, 'Corredor de caballos', 3, 'N'),
(12, 'Un Pony', 3, 'N'),
(13, '20', 4, 'S'),
(14, '12', 4, 'N'),
(15, '19', 4, 'N'),
(16, '10', 4, 'N'),
(17, 'George Washington', 5, 'S'),
(18, 'Andrew Jackson', 5, 'N'),
(19, 'Thomas Jefferson', 5, 'N'),
(20, 'Abraham Lincoln', 5, 'N'),
(21, 'En la membrana', 6, 'N'),
(22, 'El Nucleo', 6, 'S'),
(23, 'En el citoplasma', 6, 'N'),
(24, 'Ninguna de las anteriores', 6, 'N'),
(25, 'Con el Pacífico y el Atlántico a través del Mar Caribe.', 7, 'S'),
(26, 'Con el Pacífico y el Atlántico.', 7, 'N'),
(27, 'Con el Pacífico y el Atlántico nordico.', 7, 'N'),
(28, 'Con el Pacífico y el Atlántico a través del canal de Panama.', 7, 'N'),
(29, '2014', 8, 'N'),
(30, '2006', 8, 'N'),
(31, '2005', 8, 'N'),
(32, '2004', 8, 'S'),
(33, '3,151592', 9, 'N'),
(34, '3,141592', 9, 'S'),
(35, '3,161592', 9, 'N'),
(36, '3,141416', 9, 'N'),
(37, '1989', 10, 'N'),
(38, '1987', 10, 'N'),
(39, '1990', 10, 'N'),
(40, '1991', 10, 'S'),
(41, 'Burro', 11, 'N'),
(42, 'Yegua', 11, 'N'),
(43, 'Asno', 11, 'N'),
(44, 'Mulo', 11, 'S'),
(45, 'Jorge Isaacs', 12, 'S'),
(46, 'Gabriel Garcia Marquez', 12, 'N'),
(47, 'Laura Restrepo', 12, 'N'),
(48, 'Héctor Abad Faciolince', 12, 'N'),
(49, 'Maradona', 13, 'N'),
(50, 'Bebeto', 13, 'N'),
(51, 'Pele', 13, 'S'),
(52, 'Laudrup', 13, 'N'),
(53, 'Diametro del circulo', 14, 'N'),
(54, 'Superficie de un circulo', 14, 'S'),
(55, 'Volumen de un cilindro', 14, 'N'),
(56, 'Superficie del paralelogramo', 14, 'N'),
(57, 'Jonas Salk', 15, 'N'),
(58, 'Albert Einstein', 15, 'N'),
(59, 'Robert Oppenheimer', 15, 'S'),
(60, 'Leó Szilárd', 15, 'N'),
(61, 'Melanina', 16, 'S'),
(62, 'Melanocitos', 16, 'N'),
(63, 'hipotálamo', 16, 'N'),
(64, 'hipófisis', 16, 'N'),
(65, 'Simon Bolivar', 17, 'N'),
(66, 'Benkos Biohó.', 17, 'S'),
(67, 'Alonso de Ojeda', 17, 'N'),
(68, 'Vasco Núñez de Balboa', 17, 'N'),
(69, 'Derek Jeter', 18, 'N'),
(70, 'Álex Rodríguez', 18, 'N'),
(71, 'George Brett', 18, 'N'),
(72, 'Barry Bonds', 18, 'S'),
(73, 'Si trabajan 12 obreros, 5 dias haran 2800 metros cuadrados', 19, 'N'),
(74, 'Si trabajan 12 obreros, 5 dias haran 2980 metros cuadrados', 19, 'N'),
(75, 'Si trabajan 12 obreros, 5 dias haran 3000 metros cuadrados', 19, 'S'),
(76, 'Si trabajan 12 obreros, 5 dias haran 3050 metros cuadrados', 19, 'N'),
(77, 'Incas', 20, 'N'),
(78, 'Griegos', 20, 'N'),
(79, 'Mayas', 20, 'S'),
(80, 'Inuit', 20, 'N'),
(81, '6,371 km', 21, 'S'),
(82, '6,372 km', 21, 'N'),
(83, '6,370 km', 21, 'N'),
(84, '6,300 km', 21, 'N'),
(85, 'Anthony Zambrano', 22, 'N'),
(86, 'Fritz Hoffmann', 22, 'N'),
(87, 'Justin Gatlin', 22, 'N'),
(88, 'Helmut Bellingrodt', 22, 'S'),
(89, 'New Jersey Nets.', 23, 'S'),
(90, 'Boston Celtics', 23, 'N'),
(91, 'Atlanta Hawks', 23, 'N'),
(92, 'Sacramento Kings', 23, 'N'),
(93, 'Un doceavo', 24, 'S'),
(94, 'Un septimo', 24, 'N'),
(95, '3/4 partes', 24, 'N'),
(96, '4/6 partes', 24, 'N'),
(97, 'Amazonas', 25, 'N'),
(98, 'Tigris', 25, 'N'),
(99, 'Éufrates', 25, 'N'),
(100, 'Nilo', 25, 'S');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `acumulado`
--
ALTER TABLE `acumulado`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rLlavePrimaria-Acumulado-Participante` (`id_jugador`),
  ADD KEY `rLlavePrimaria-Acumulado-Premios` (`id_premio`);

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `dificultad`
--
ALTER TABLE `dificultad`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `juego`
--
ALTER TABLE `juego`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rLlavePrimaria-Juego-Participante` (`idJugador`),
  ADD KEY `rLlavePrimaria-Juego-Dificultad` (`idDificultad`),
  ADD KEY `rLlaverPrimariaJuego-Premio` (`idPremio`);

--
-- Indices de la tabla `participantes`
--
ALTER TABLE `participantes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `preguntas`
--
ALTER TABLE `preguntas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rLlavePrimaria-Preguntas-Categoria` (`idCategoria`),
  ADD KEY `rLlavePrimaria-Preguntas-Dificultad` (`idDificultad`);

--
-- Indices de la tabla `premios`
--
ALTER TABLE `premios`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `respuestas`
--
ALTER TABLE `respuestas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rLlavePrimaria-Respuestas-Preguntas` (`idPreguntas`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `acumulado`
--
ALTER TABLE `acumulado`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id del acumulado', AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `juego`
--
ALTER TABLE `juego`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id del juego', AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `respuestas`
--
ALTER TABLE `respuestas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id respuestas', AUTO_INCREMENT=101;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `acumulado`
--
ALTER TABLE `acumulado`
  ADD CONSTRAINT `rLlavePrimaria-Acumulado-Participante` FOREIGN KEY (`id_jugador`) REFERENCES `participantes` (`id`),
  ADD CONSTRAINT `rLlavePrimaria-Acumulado-Premios` FOREIGN KEY (`id_premio`) REFERENCES `premios` (`id`);

--
-- Filtros para la tabla `juego`
--
ALTER TABLE `juego`
  ADD CONSTRAINT `rLlavePrimaria-Juego-Dificultad` FOREIGN KEY (`idDificultad`) REFERENCES `dificultad` (`id`),
  ADD CONSTRAINT `rLlavePrimaria-Juego-Participante` FOREIGN KEY (`idJugador`) REFERENCES `participantes` (`id`),
  ADD CONSTRAINT `rLlaverPrimariaJuego-Premio` FOREIGN KEY (`idPremio`) REFERENCES `premios` (`id`);

--
-- Filtros para la tabla `preguntas`
--
ALTER TABLE `preguntas`
  ADD CONSTRAINT `rLlavePrimaria-Preguntas-Categoria` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`id`),
  ADD CONSTRAINT `rLlavePrimaria-Preguntas-Dificultad` FOREIGN KEY (`idDificultad`) REFERENCES `dificultad` (`id`);

--
-- Filtros para la tabla `respuestas`
--
ALTER TABLE `respuestas`
  ADD CONSTRAINT `rLlavePrimaria-Respuestas-Preguntas` FOREIGN KEY (`idPreguntas`) REFERENCES `preguntas` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
