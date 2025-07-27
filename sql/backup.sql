-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 18-07-2025 a las 08:37:21
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

--
-- Base de datos: `bd_academic`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `actividad`
--

CREATE TABLE `actividad` (
  `id` int(11) NOT NULL,
  `nombre` varchar(150) DEFAULT NULL,
  `siglas` varchar(5) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `color` varchar(20) DEFAULT NULL,
  `icono` text DEFAULT NULL,
  `img` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `color`
--

CREATE TABLE `color` (
  `id` int(11) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `valor` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `color`
--

INSERT INTO `color` (`id`, `nombre`, `valor`) VALUES
(1, 'rojo', '#f0000C'),
(2, 'azul', '#006AF5'),
(3, 'verde', '#00B336'),
(4, 'amarillo', 'yellow'),
(5, 'naranja', '#ff6600'),
(6, 'morado', '#8C00ff'),
(7, 'Extra', '#53dae8'),
(8, 'pa taller', 'darkgrey'),
(9, 'prueba', '#ff1ad5'),
(10, 'aa', '#00ced1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `curso`
--

CREATE TABLE `curso` (
  `id` int(11) NOT NULL,
  `nombre` text NOT NULL,
  `siglas` varchar(5) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `creditos` int(11) NOT NULL,
  `ciclo` int(11) NOT NULL,
  `icono` text DEFAULT NULL,
  `colorid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `curso`
--

INSERT INTO `curso` (`id`, `nombre`, `siglas`, `descripcion`, `creditos`, `ciclo`, `icono`, `colorid`) VALUES
(1, 'Desarrollo de Aplicaciones Web', 'DAW', NULL, 4, 6, NULL, 3),
(2, 'Desarrollo de Aplicaciones de Escritorio', 'DAE', NULL, 4, 6, NULL, 2),
(3, 'Inteligencia Artificial', 'IA', NULL, 4, 6, NULL, 5),
(4, 'Fe y Cultura', 'FC', NULL, 3, 6, NULL, 6),
(5, 'Investigación en Operaciones', 'INVOP', NULL, 3, 6, NULL, 4),
(6, 'Sistemas Operativos', 'SO', NULL, 3, 6, NULL, 1),
(7, 'Diseño Web', 'DW', NULL, 3, 5, NULL, 3),
(8, 'Base de Datos', 'BD', NULL, 4, 4, NULL, 4),
(9, 'Antropologia Filosofica', 'ANTRO', NULL, 3, 4, NULL, 6),
(10, 'Ecuaciones Diferenciales y Métodos Númericos', 'ED', NULL, 4, 4, NULL, 5),
(11, 'Comprensión De Textos Y Redacción Básica', 'CRB', NULL, 3, 1, NULL, 6),
(12, 'Desarrollo De Competencias Digitales', 'DCD', NULL, 2, 1, NULL, 3),
(13, 'Estrategias Para El Aprendizaje Autónomo', 'EST', NULL, 3, 1, NULL, 7),
(14, 'Introducción A La Ingeniería De Sistemas Y Computación', 'IISC', NULL, 3, 1, NULL, 4),
(15, 'Matemática Básica', 'MB', NULL, 3, 1, NULL, 5),
(16, 'Matemática Discreta', 'MD', NULL, 4, 1, NULL, 2),
(17, 'Cálculo De Una Variable', 'CUV', NULL, 4, 2, NULL, 5),
(18, 'Comprensión Y Redacción De Textos Académicos', 'CRTA', NULL, 3, 2, NULL, 6),
(19, 'Ecología Y Desarrollo Sostenible', 'ECOL', NULL, 3, 2, NULL, 7),
(20, 'Economía Y Realidad Nacional', 'ECON', NULL, 3, 2, NULL, 4),
(21, 'Fundamentos De Programación', 'FPR', NULL, 3, 2, NULL, 2),
(22, 'Teoría Y Procesos Organizacionales', 'TPO', NULL, 3, 2, NULL, 3),
(23, 'Análisis Y Especificación De Requisitos', 'AER', NULL, 3, 3, NULL, 3),
(24, 'Cálculo De Varias Variables', 'CVV', NULL, 4, 3, NULL, 5),
(25, 'Contabilidad Y Finanzas', 'CONTA', NULL, 3, 3, NULL, 4),
(26, 'Filosofía', 'FILO', NULL, 3, 3, NULL, 6),
(27, 'Física De Los Cuerpos Rígidos', 'FIS', NULL, 4, 3, NULL, 1),
(28, 'Metodologías De Programación', 'MPR', NULL, 3, 3, NULL, 2),
(29, 'Diseño De Software', 'DS', NULL, 3, 4, NULL, 3),
(30, 'Electricidad Y Magnetismo', 'EM', NULL, 4, 4, NULL, 1),
(31, 'Estructura De Datos Y Algoritmos', 'EDA', NULL, 3, 4, NULL, 2),
(32, 'Administración De Base De Datos', 'ABD', NULL, 3, 5, NULL, 2),
(33, 'Arquitectura Y Organización De Computadoras', 'AOC', NULL, 4, 5, NULL, 1),
(34, 'Estadística Y Probabilidades', 'EP', NULL, 3, 5, NULL, 5),
(35, 'Ética', 'ETI', NULL, 3, 5, NULL, 6),
(36, 'Ingeniería De Procesos', 'IP', NULL, 3, 5, NULL, 4),
(37, 'Teoría General De Sistemas', 'TGS', NULL, 2, 5, NULL, 7),
(38, 'Taller de Basket', 'BSKT', NULL, 1, 0, NULL, 8),
(39, 'Desarrollo De Sistemas Inteligentes', 'DSI', NULL, 2, 7, NULL, 5),
(40, 'Fundamentos Y Diseño De Redes De Datos', 'FDRD', NULL, 3, 7, NULL, 1),
(41, 'Ingeniería Y Calidad De Software', 'ICS', NULL, 4, 7, NULL, 2),
(42, 'Inteligencia De Negocios', 'IN', NULL, 3, 7, NULL, 7),
(43, 'Investigación En Ingeniería', 'IEI', NULL, 3, 7, NULL, 4),
(44, 'Moral Católica', 'MC', NULL, 3, 7, NULL, 6),
(45, 'Sistemas Distribuidos', 'SD', NULL, 3, 7, NULL, 3),
(46, 'Configuración Y Administración De Redes De Datos', 'CARD', NULL, 4, 8, NULL, 1),
(47, 'Desarrollo De Aplicaciones Móviles', 'DAM', NULL, 4, 8, NULL, 3),
(48, 'Doctrina Social De La Iglesia', 'DSI', NULL, 3, 8, NULL, 6),
(49, 'Gobierno Y Gestión De Tecnologías De Información', 'GGTI', NULL, 4, 8, NULL, 2),
(50, 'Minería De Datos Y Big Data', 'MDBD', NULL, 3, 8, NULL, 5),
(51, 'Proyecto De Investigación', 'PI', NULL, 3, 8, NULL, 4),
(52, 'Configuración Y Administración De Servidores', 'X', NULL, 4, 9, NULL, 1),
(53, 'Deontología Y Legislación Laboral E Informática', 'X', NULL, 2, 9, NULL, 6),
(54, 'Gestión De Riesgos Y Seguridad De La Información', 'X', NULL, 4, 9, NULL, 7),
(55, 'Gestión De Servicios De Tecnologías De Información', 'X', NULL, 4, 9, NULL, 2),
(56, 'Negocios Electrónicos Y Marketing Digital', 'X', NULL, 4, 9, NULL, 5),
(57, 'Seminario De Tesis I', 'X', NULL, 3, 9, NULL, 4),
(58, 'Auditoría De Sistemas De Información', 'X', NULL, 4, 10, NULL, 7),
(59, 'Desarrollo De Video Juegos', 'X', NULL, 2, 10, NULL, 7),
(60, 'Emprendimiento De Base Tecnológica', 'X', NULL, 2, 10, NULL, 5),
(61, 'Gestión De Proyectos De Sistemas De Información', 'X', NULL, 4, 10, NULL, 2),
(62, 'Seguridad Informática', 'X', NULL, 3, 10, NULL, 1),
(63, 'Seminario De Tesis II', 'X', NULL, 3, 10, NULL, 4),
(64, 'Sistemas ERP', 'X', NULL, 2, 10, NULL, 7),
(65, 'Tópicos Avanzados En Desarrollo De Software', 'X', NULL, 3, 10, NULL, 3),
(73, '', '', NULL, 0, 0, NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_matricula`
--

CREATE TABLE `detalle_matricula` (
  `matriculaid` int(11) NOT NULL,
  `grupoid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `detalle_matricula`
--

INSERT INTO `detalle_matricula` (`matriculaid`, `grupoid`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(1, 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `docente`
--

CREATE TABLE `docente` (
  `id` int(11) NOT NULL,
  `nombres` varchar(255) NOT NULL,
  `apellidos` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `docente`
--

INSERT INTO `docente` (`id`, `nombres`, `apellidos`) VALUES
(1, 'Junior Eugenio', 'Cachay Maco'),
(2, 'Roger Ernesto', 'Alarcon Garcia'),
(3, 'Karla Cecilia', 'Reyes Burgos'),
(4, 'Alicia Lizet', 'Niño Effio'),
(5, 'Absalon', 'Rivasplata Sanchez'),
(6, 'Edwar Glorimer', 'Lujan Segura'),
(7, 'Julio Cesar', 'Moreno Descalzi'),
(8, 'Luis Augusto', 'Zuñe Bispo'),
(9, 'Alexander Omar', 'Cruzado Quiroz'),
(10, 'Gregorio Manuel', 'Leon Tenorio'),
(11, 'Marco Antonio', 'Alberca Balarezo'),
(12, 'Consuelo Invonne', 'Del Castillo Castro'),
(13, 'Yesabella Katherine', 'Brenis Delgado'),
(14, 'Jose Fortunato', 'Zuloaga Cachay'),
(15, 'Jessie Leila', 'Bravo Jaico'),
(16, 'Maria Lourdes', 'Redondo Redondo'),
(17, 'Rony Rafael', 'Garcia Apestegui'),
(18, 'Mariana', 'Chavarry Chankay'),
(19, 'Doris Liliana', 'Moscol Mogollon'),
(20, 'Javier Alejandro', 'Huaman Angulo'),
(21, 'William Alfredo', 'Noblecilla Vinces'),
(22, 'Nancy Emilia', 'Estela Salazar'),
(23, 'Miguel Angel', 'Diaz Espino'),
(24, 'Segundo José', 'Castillo Zumarán'),
(25, 'Ernesto Ludwin', 'Nicho Cordova'),
(26, 'Claudia Emperatriz', 'Rodriguez Ortiz'),
(27, 'David Ysrael', 'Gonzales Lopez'),
(28, 'Fernando Pavel', 'Diaz Chero'),
(29, 'Martha Elizabeth', 'Chavez Alarcon'),
(30, 'Luis Orlando', 'Morante Adrianzen'),
(31, 'Luis', 'Saavedra Carrasco'),
(32, 'Karhy Estela', 'Cipriano Urtecho de Yong'),
(33, 'Jose Fernando', 'Quiroz Vidarte'),
(34, 'Jenny Patricia', 'Palacios Kuoc');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grupo`
--

CREATE TABLE `grupo` (
  `id` int(11) NOT NULL,
  `nombre` char(1) NOT NULL,
  `docenteid` int(11) NOT NULL,
  `semestrecodigo` char(6) NOT NULL,
  `cursoid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `grupo`
--

INSERT INTO `grupo` (`id`, `nombre`, `docenteid`, `semestrecodigo`, `cursoid`) VALUES
(1, 'G', 1, '2025-1', 44),
(2, 'B', 1, '2025-1', 39),
(3, 'A', 1, '2025-1', 41),
(4, 'A', 1, '2025-1', 40),
(5, 'B', 1, '2025-1', 42),
(6, 'B', 1, '2025-1', 45),
(7, 'B', 1, '2025-1', 43);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `horario`
--

CREATE TABLE `horario` (
  `id` int(11) NOT NULL,
  `titulo` text DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `dia` int(11) DEFAULT NULL,
  `h_ini` int(11) DEFAULT NULL,
  `min_ini` int(11) DEFAULT NULL,
  `h_fin` int(11) DEFAULT NULL,
  `min_fin` int(11) DEFAULT NULL,
  `fecha_ini` date DEFAULT NULL,
  `fecha_fin` date DEFAULT NULL,
  `contextoid` int(11) DEFAULT NULL,
  `grupoid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `matricula`
--

CREATE TABLE `matricula` (
  `id` int(11) NOT NULL,
  `nombre` text NOT NULL,
  `estado` tinyint(1) DEFAULT NULL,
  `seleccionado` tinyint(1) NOT NULL DEFAULT 0,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `semestrecodigo` char(6) NOT NULL,
  `usuarioid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `matricula`
--

INSERT INTO `matricula` (`id`, `nombre`, `estado`, `seleccionado`, `fecha`, `semestrecodigo`, `usuarioid`) VALUES
(1, 'Modelo 1', 1, 1, '2025-07-17 14:05:10', '2025-1', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nota`
--

CREATE TABLE `nota` (
  `id` int(11) NOT NULL,
  `nombre` text DEFAULT NULL,
  `porcentaje` decimal(5,2) NOT NULL,
  `valor` decimal(5,2) DEFAULT NULL,
  `unidadid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `nota`
--

INSERT INTO `nota` (`id`, `nombre`, `porcentaje`, `valor`, `unidadid`) VALUES
(1, 'DSI 1 1', 30.00, 0.00, 1),
(2, 'DSI 1 2', 70.00, 0.00, 1),
(3, 'DSI 2 1', 30.00, 0.00, 2),
(4, 'DSI 2 2', 70.00, 0.00, 2),
(5, 'DSI 3 1', 30.00, 0.00, 3),
(6, 'DSI 3 2', 70.00, 0.00, 3),
(7, 'FDRD 1 1', 20.00, 0.00, 4),
(8, 'FDRD 1 2', 20.00, 10.00, 4),
(9, 'FDRD 1 3', 20.00, 0.00, 4),
(10, 'FDRD 1 4', 40.00, 0.00, 4),
(11, 'FDRD 2 1', 50.00, 0.00, 5),
(12, 'FDRD 2 2', 25.00, 0.00, 5),
(13, 'FDRD 2 3', 25.00, 0.00, 5),
(14, 'FDRD 3 1', 15.00, 0.00, 6),
(15, 'FDRD 3 2', 15.00, 0.00, 6),
(16, 'FDRD 3 3', 30.00, 0.00, 6),
(17, 'FDRD 3 4', 40.00, 20.00, 6),
(18, 'ICS 1 1', 40.00, 0.00, 7),
(19, 'ICS 1 2', 60.00, 0.00, 7),
(20, 'ICS 2 1', 10.00, 0.00, 8),
(21, 'ICS 2 2', 20.00, 0.00, 8),
(22, 'ICS 2 3', 50.00, 0.00, 8),
(23, 'ICS 3 1', 50.00, 0.00, 9),
(24, 'ICS 3 2', 50.00, 0.00, 9),
(25, 'ICS 4 1', 5.00, 0.00, 10),
(26, 'ICS 4 2', 5.00, 0.00, 10),
(27, 'ICS 4 3', 90.00, 0.00, 10),
(28, '', 100.00, 0.00, 11),
(29, '', 100.00, 0.00, 12),
(30, '', 100.00, 0.00, 13),
(31, '', 50.00, 0.00, 14),
(32, '', 50.00, 0.00, 14),
(33, '', 50.00, 0.00, 15),
(34, '', 50.00, 0.00, 15),
(35, '', 100.00, 0.00, 16),
(36, '', 12.50, 0.00, 19),
(37, '', 12.50, 0.00, 19),
(38, '', 25.00, 0.00, 19),
(39, '', 50.00, 0.00, 19),
(40, '', 25.00, 0.00, 20),
(41, '', 20.00, 0.00, 20),
(42, '', 30.00, 0.00, 20),
(43, '', 25.00, 0.00, 20),
(44, '', 40.00, 0.00, 17),
(45, '', 60.00, 0.00, 17),
(46, '', 40.00, 0.00, 18),
(47, '', 60.00, 0.00, 18);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prerrequisito`
--

CREATE TABLE `prerrequisito` (
  `cursoid` int(11) NOT NULL,
  `cursoid_pre` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `prerrequisito`
--

INSERT INTO `prerrequisito` (`cursoid`, `cursoid_pre`) VALUES
(1, 7),
(1, 32),
(2, 32),
(3, 34),
(4, 35),
(5, 34),
(6, 33),
(7, 29),
(8, 23),
(8, 25),
(9, 26),
(10, 24),
(17, 15),
(18, 11),
(19, 13),
(20, 14),
(21, 15),
(21, 16),
(22, 12),
(23, 22),
(24, 17),
(25, 20),
(26, 18),
(27, 17),
(28, 21),
(29, 23),
(30, 27),
(31, 28),
(32, 8),
(32, 31),
(33, 30),
(34, 10),
(35, 9),
(36, 29),
(37, 9),
(39, 3),
(40, 6),
(41, 2),
(42, 32),
(43, 5),
(44, 4),
(45, 1),
(46, 40),
(47, 45),
(48, 44),
(49, 41),
(50, 39),
(50, 42),
(51, 43),
(52, 46),
(53, 48),
(54, 49),
(55, 49),
(56, 50),
(57, 47),
(57, 51),
(58, 54),
(59, 47),
(60, 56),
(61, 55),
(62, 52),
(63, 57),
(64, 47),
(65, 57);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `semestre`
--

CREATE TABLE `semestre` (
  `codigo` char(6) NOT NULL,
  `f_inicio` timestamp NOT NULL DEFAULT current_timestamp(),
  `f_fin` timestamp NOT NULL DEFAULT current_timestamp(),
  `activo` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `semestre`
--

INSERT INTO `semestre` (`codigo`, `f_inicio`, `f_fin`, `activo`) VALUES
('2022-1', '2025-07-16 15:15:04', '2025-07-16 15:15:04', 0),
('2022-2', '2025-07-16 15:15:04', '2025-07-16 15:15:04', 0),
('2023-1', '2025-07-16 15:15:04', '2025-07-16 15:15:04', 0),
('2023-2', '2025-07-16 15:15:04', '2025-07-16 15:15:04', 0),
('2024-1', '2025-07-16 15:15:04', '2025-07-16 15:15:04', 0),
('2024-2', '2025-07-16 15:15:04', '2025-07-16 15:15:04', 0),
('2025-1', '2025-03-16 05:00:00', '2025-07-19 15:15:04', 1),
('2025-2', '2025-07-16 15:15:04', '2025-07-16 15:15:04', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `unidad`
--

CREATE TABLE `unidad` (
  `id` int(11) NOT NULL,
  `nombre` text DEFAULT NULL,
  `porcentaje` decimal(5,2) NOT NULL,
  `grupoid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `unidad`
--

INSERT INTO `unidad` (`id`, `nombre`, `porcentaje`, `grupoid`) VALUES
(1, 'DSI 1', 35.00, 2),
(2, 'DSI 2', 30.00, 2),
(3, 'DSI 3', 35.00, 2),
(4, 'FDRD 1', 30.00, 4),
(5, 'FDRD 2', 30.00, 4),
(6, 'FDRD 3', 40.00, 4),
(7, 'ICS 1', 15.00, 3),
(8, 'ICS 2', 15.00, 3),
(9, 'ICS 3', 10.00, 3),
(10, 'ICS 4', 60.00, 3),
(11, 'IN 1', 10.00, 5),
(12, 'IN 2', 20.00, 5),
(13, 'IN 3', 35.00, 5),
(14, 'IN 4', 35.00, 5),
(15, 'IEI 1', 40.00, 7),
(16, 'IEI 2', 60.00, 7),
(17, 'MC 1', 50.00, 1),
(18, 'MC 2', 50.00, 1),
(19, 'SD 1', 40.00, 6),
(20, 'SD 2', 60.00, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `nombre` varchar(250) NOT NULL,
  `username` varchar(250) NOT NULL,
  `password` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `nombre`, `username`, `password`) VALUES
(1, 'yo', 'yo', '123456');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `actividad`
--
ALTER TABLE `actividad`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `color`
--
ALTER TABLE `color`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `curso`
--
ALTER TABLE `curso`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKcurso421515` (`colorid`);

--
-- Indices de la tabla `detalle_matricula`
--
ALTER TABLE `detalle_matricula`
  ADD PRIMARY KEY (`matriculaid`,`grupoid`),
  ADD KEY `FKdetalle_ma614462` (`grupoid`);

--
-- Indices de la tabla `docente`
--
ALTER TABLE `docente`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `grupo`
--
ALTER TABLE `grupo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKgrupo646143` (`cursoid`),
  ADD KEY `FKgrupo65739` (`semestrecodigo`),
  ADD KEY `FKgrupo55510` (`docenteid`);

--
-- Indices de la tabla `horario`
--
ALTER TABLE `horario`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKhorario682240` (`grupoid`),
  ADD KEY `FKhorario645468` (`contextoid`);

--
-- Indices de la tabla `matricula`
--
ALTER TABLE `matricula`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKmatricula214145` (`usuarioid`),
  ADD KEY `FKmatricula699956` (`semestrecodigo`);

--
-- Indices de la tabla `nota`
--
ALTER TABLE `nota`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKnota214246` (`unidadid`);

--
-- Indices de la tabla `prerrequisito`
--
ALTER TABLE `prerrequisito`
  ADD PRIMARY KEY (`cursoid`,`cursoid_pre`),
  ADD KEY `FKprerrequis207825` (`cursoid_pre`);

--
-- Indices de la tabla `semestre`
--
ALTER TABLE `semestre`
  ADD PRIMARY KEY (`codigo`);

--
-- Indices de la tabla `unidad`
--
ALTER TABLE `unidad`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKunidad83868` (`grupoid`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `actividad`
--
ALTER TABLE `actividad`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `color`
--
ALTER TABLE `color`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `curso`
--
ALTER TABLE `curso`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

--
-- AUTO_INCREMENT de la tabla `docente`
--
ALTER TABLE `docente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT de la tabla `grupo`
--
ALTER TABLE `grupo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `horario`
--
ALTER TABLE `horario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `matricula`
--
ALTER TABLE `matricula`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `nota`
--
ALTER TABLE `nota`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT de la tabla `unidad`
--
ALTER TABLE `unidad`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `curso`
--
ALTER TABLE `curso`
  ADD CONSTRAINT `FKcurso421515` FOREIGN KEY (`colorid`) REFERENCES `color` (`id`);

--
-- Filtros para la tabla `detalle_matricula`
--
ALTER TABLE `detalle_matricula`
  ADD CONSTRAINT `FKdetalle_ma614462` FOREIGN KEY (`grupoid`) REFERENCES `grupo` (`id`),
  ADD CONSTRAINT `FKdetalle_ma708364` FOREIGN KEY (`matriculaid`) REFERENCES `matricula` (`id`);

--
-- Filtros para la tabla `grupo`
--
ALTER TABLE `grupo`
  ADD CONSTRAINT `FKgrupo55510` FOREIGN KEY (`docenteid`) REFERENCES `docente` (`id`),
  ADD CONSTRAINT `FKgrupo646143` FOREIGN KEY (`cursoid`) REFERENCES `curso` (`id`),
  ADD CONSTRAINT `FKgrupo65739` FOREIGN KEY (`semestrecodigo`) REFERENCES `semestre` (`codigo`);

--
-- Filtros para la tabla `horario`
--
ALTER TABLE `horario`
  ADD CONSTRAINT `FKhorario645468` FOREIGN KEY (`contextoid`) REFERENCES `actividad` (`id`),
  ADD CONSTRAINT `FKhorario682240` FOREIGN KEY (`grupoid`) REFERENCES `grupo` (`id`);

--
-- Filtros para la tabla `matricula`
--
ALTER TABLE `matricula`
  ADD CONSTRAINT `FKmatricula214145` FOREIGN KEY (`usuarioid`) REFERENCES `usuario` (`id`),
  ADD CONSTRAINT `FKmatricula699956` FOREIGN KEY (`semestrecodigo`) REFERENCES `semestre` (`codigo`);

--
-- Filtros para la tabla `nota`
--
ALTER TABLE `nota`
  ADD CONSTRAINT `FKnota214246` FOREIGN KEY (`unidadid`) REFERENCES `unidad` (`id`);

--
-- Filtros para la tabla `prerrequisito`
--
ALTER TABLE `prerrequisito`
  ADD CONSTRAINT `FKprerrequis207825` FOREIGN KEY (`cursoid_pre`) REFERENCES `curso` (`id`),
  ADD CONSTRAINT `FKprerrequis374739` FOREIGN KEY (`cursoid`) REFERENCES `curso` (`id`);

--
-- Filtros para la tabla `unidad`
--
ALTER TABLE `unidad`
  ADD CONSTRAINT `FKunidad83868` FOREIGN KEY (`grupoid`) REFERENCES `grupo` (`id`);
COMMIT;
