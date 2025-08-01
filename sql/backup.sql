-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 02-08-2025 a las 00:06:10
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

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
  `img` text DEFAULT NULL,
  `tipo_actividadid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `columna`
--

CREATE TABLE `columna` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `color` varchar(20) DEFAULT NULL,
  `orden` int(11) DEFAULT NULL,
  `tablaid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `columna`
--

INSERT INTO `columna` (`id`, `nombre`, `color`, `orden`, `tablaid`) VALUES
(1, 'Dashboard', '#333F4F', 1, 1),
(2, 'Notas', '#d14900', 2, 1),
(3, 'CRUD CURSO_GRUPO_UNIDAD_NOTA', 'green', 3, 1),
(4, 'Modelos de matricula', '#000000', 4, 1),
(5, 'Mis cursos', '#bf8282', 8, 1),
(6, 'Crud actividad', '#000000', 9, 1),
(7, 'Horario', '#000000', 7, 1),
(8, 'Calendario', '#000000', 6, 1),
(9, 'Lista de Tablas', '#000000', 5, 1);

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
  `ciclo` int(11) DEFAULT NULL,
  `icono` text DEFAULT NULL,
  `color` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `curso`
--

INSERT INTO `curso` (`id`, `nombre`, `siglas`, `descripcion`, `creditos`, `ciclo`, `icono`, `color`) VALUES
(1, 'Desarrollo de Aplicaciones Web', 'DAW', NULL, 4, 6, NULL, '#00cc1f'),
(2, 'Desarrollo de Aplicaciones de Escritorio', 'DAE', NULL, 4, 6, NULL, '#006AF5'),
(3, 'Inteligencia Artificial', 'IA', NULL, 4, 6, NULL, '#ff6600'),
(4, 'Fe y Cultura', 'FC', NULL, 3, 6, NULL, '#ab03ff'),
(5, 'Investigación en Operaciones', 'INVOP', NULL, 3, 6, NULL, '#ebd900'),
(6, 'Sistemas Operativos', 'SO', NULL, 3, 6, NULL, '#f0000C'),
(7, 'Diseño Web', 'DW', NULL, 3, 5, NULL, '#00cc1f'),
(8, 'Base de Datos', 'BD', NULL, 4, 4, NULL, '#ebd900'),
(9, 'Antropologia Filosofica', 'ANTRO', NULL, 3, 4, NULL, '#ab03ff'),
(10, 'Ecuaciones Diferenciales y Métodos Númericos', 'ED', NULL, 4, 4, NULL, '#ff6600'),
(11, 'Comprensión De Textos Y Redacción Básica', 'CRB', NULL, 3, 1, NULL, '#ab03ff'),
(12, 'Desarrollo De Competencias Digitales', 'DCD', NULL, 2, 1, NULL, '#00cc1f'),
(13, 'Estrategias Para El Aprendizaje Autónomo', 'EST', NULL, 3, 1, NULL, '#00c3d7'),
(14, 'Introducción A La Ingeniería De Sistemas Y Computación', 'IISC', NULL, 3, 1, NULL, '#ebd900'),
(15, 'Matemática Básica', 'MB', NULL, 3, 1, NULL, '#ff6600'),
(16, 'Matemática Discreta', 'MD', NULL, 4, 1, NULL, '#006AF5'),
(17, 'Cálculo De Una Variable', 'CUV', NULL, 4, 2, NULL, '#ff6600'),
(18, 'Comprensión Y Redacción De Textos Académicos', 'CRTA', NULL, 3, 2, NULL, '#ab03ff'),
(19, 'Ecología Y Desarrollo Sostenible', 'ECOL', NULL, 3, 2, NULL, '#00c3d7'),
(20, 'Economía Y Realidad Nacional', 'ECON', NULL, 3, 2, NULL, '#ebd900'),
(21, 'Fundamentos De Programación', 'FPR', NULL, 3, 2, NULL, '#006AF5'),
(22, 'Teoría Y Procesos Organizacionales', 'TPO', NULL, 3, 2, NULL, '#00cc1f'),
(23, 'Análisis Y Especificación De Requisitos', 'AER', NULL, 3, 3, NULL, '#00cc1f'),
(24, 'Cálculo De Varias Variables', 'CVV', NULL, 4, 3, NULL, '#ff6600'),
(25, 'Contabilidad Y Finanzas', 'CONTA', NULL, 3, 3, NULL, '#ebd900'),
(26, 'Filosofía', 'FILO', NULL, 3, 3, NULL, '#ab03ff'),
(27, 'Física De Los Cuerpos Rígidos', 'FIS', NULL, 4, 3, NULL, '#f0000C'),
(28, 'Metodologías De Programación', 'MPR', NULL, 3, 3, NULL, '#006AF5'),
(29, 'Diseño De Software', 'DS', NULL, 3, 4, NULL, '#00cc1f'),
(30, 'Electricidad Y Magnetismo', 'EM', NULL, 4, 4, NULL, '#f0000C'),
(31, 'Estructura De Datos Y Algoritmos', 'EDA', NULL, 3, 4, NULL, '#006AF5'),
(32, 'Administración De Base De Datos', 'ABD', NULL, 3, 5, NULL, '#006AF5'),
(33, 'Arquitectura Y Organización De Computadoras', 'AOC', NULL, 4, 5, NULL, '#f0000C'),
(34, 'Estadística Y Probabilidades', 'EP', NULL, 3, 5, NULL, '#ff6600'),
(35, 'Ética', 'ETI', NULL, 3, 5, NULL, '#ab03ff'),
(36, 'Ingeniería De Procesos', 'IP', NULL, 3, 5, NULL, '#ebd900'),
(37, 'Teoría General De Sistemas', 'TGS', NULL, 2, 5, NULL, '#00c3d7'),
(38, 'Taller de Basket', 'BSKT', NULL, 1, NULL, NULL, 'darkgrey'),
(39, 'Desarrollo De Sistemas Inteligentes', 'DSI', NULL, 2, 7, NULL, '#ff6600'),
(40, 'Fundamentos Y Diseño De Redes De Datos', 'FDRD', NULL, 3, 7, NULL, '#f0000C'),
(41, 'Ingeniería Y Calidad De Software', 'ICS', NULL, 4, 7, NULL, '#006AF5'),
(42, 'Inteligencia De Negocios', 'IN', NULL, 3, 7, NULL, '#00c3d7'),
(43, 'Investigación En Ingeniería', 'IEI', NULL, 3, 7, NULL, '#ebd900'),
(44, 'Moral Católica', 'MC', NULL, 3, 7, NULL, '#ab03ff'),
(45, 'Sistemas Distribuidos', 'SD', NULL, 3, 7, NULL, '#00cc1f'),
(46, 'Configuración Y Administración De Redes De Datos', 'CARD', NULL, 4, 8, NULL, '#f0000C'),
(47, 'Desarrollo De Aplicaciones Móviles', 'DAM', NULL, 4, 8, NULL, '#00cc1f'),
(48, 'Doctrina Social De La Iglesia', 'DSI', NULL, 3, 8, NULL, '#ab03ff'),
(49, 'Gobierno Y Gestión De Tecnologías De Información', 'GGTI', NULL, 4, 8, NULL, '#006AF5'),
(50, 'Minería De Datos Y Big Data', 'MDBD', NULL, 3, 8, NULL, '#ff6600'),
(51, 'Proyecto De Investigación', 'PI', NULL, 3, 8, NULL, '#ebd900'),
(52, 'Configuración Y Administración De Servidores', 'X', NULL, 4, 9, NULL, '#f0000C'),
(53, 'Deontología Y Legislación Laboral E Informática', 'X', NULL, 2, 9, NULL, '#ab03ff'),
(54, 'Gestión De Riesgos Y Seguridad De La Información', 'X', NULL, 4, 9, NULL, '#00c3d7'),
(55, 'Gestión De Servicios De Tecnologías De Información', 'X', NULL, 4, 9, NULL, '#006AF5'),
(56, 'Negocios Electrónicos Y Marketing Digital', 'X', NULL, 4, 9, NULL, '#ff6600'),
(57, 'Seminario De Tesis I', 'X', NULL, 3, 9, NULL, '#ebd900'),
(58, 'Auditoría De Sistemas De Información', 'X', NULL, 4, 10, NULL, '#00c3d7'),
(59, 'Desarrollo De Video Juegos', 'X', NULL, 2, 10, NULL, '#00c3d7'),
(60, 'Emprendimiento De Base Tecnológica', 'X', NULL, 2, 10, NULL, '#ff6600'),
(61, 'Gestión De Proyectos De Sistemas De Información', 'X', NULL, 4, 10, NULL, '#006AF5'),
(62, 'Seguridad Informática', 'X', NULL, 3, 10, NULL, '#f0000C'),
(63, 'Seminario De Tesis II', 'X', NULL, 3, 10, NULL, '#ebd900'),
(64, 'Sistemas ERP', 'X', NULL, 2, 10, NULL, '#00c3d7'),
(65, 'Tópicos Avanzados En Desarrollo De Software', 'X', NULL, 3, 10, NULL, '#00cc1f');

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
(34, 'Jenny Patricia', 'Palacios Kuoc'),
(35, 'MARLON EUGENIO', 'VILCHEZ RIVAS'),
(36, 'MARIA YSABEL', 'ARANGURI GARCIA'),
(37, 'ALEXANDERS', 'VALQUI SIPIRAN'),
(38, 'Miguel Angel', 'Rojas Cerna'),
(39, 'Huilder Juanito', 'Mera Montenegro'),
(40, 'Jury Yesenia', 'Aquino Trujillo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `espacio`
--

CREATE TABLE `espacio` (
  `id` int(11) NOT NULL,
  `nombre` text DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `fecha_mod` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `espacio`
--

INSERT INTO `espacio` (`id`, `nombre`, `fecha`, `fecha_mod`) VALUES
(1, '1er espacio', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `etiqueta`
--

CREATE TABLE `etiqueta` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `color` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `etiqueta_tarea`
--

CREATE TABLE `etiqueta_tarea` (
  `etiquetaid` int(11) NOT NULL,
  `tareaid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fila`
--

CREATE TABLE `fila` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `color` varchar(20) DEFAULT NULL,
  `orden` int(11) DEFAULT NULL,
  `tablaid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `fila`
--

INSERT INTO `fila` (`id`, `nombre`, `color`, `orden`, `tablaid`) VALUES
(1, 'Flask', '#ff7e29', 1, 1),
(2, 'Diseño', '#36c1dd', 2, 1),
(3, 'BD', 'red', 4, 1),
(4, 'responsividad', '#a23939', 7, 1),
(5, 'usuario', '#000000', 5, 1),
(6, 'js', '#bb9e11', 3, 1),
(7, 'datos', '#249be5', 6, 1);

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
(1, 'G', 4, '2025-1', 44),
(2, 'B', 37, '2025-1', 39),
(3, 'A', 35, '2025-1', 41),
(4, 'A', 15, '2025-1', 40),
(5, 'B', 24, '2025-1', 42),
(6, 'B', 24, '2025-1', 45),
(7, 'B', 36, '2025-1', 43),
(9, 'A', 4, '2025-1', 44),
(10, 'C', 4, '2025-1', 44),
(11, 'A', 6, '2024-2', 3),
(12, 'A', 10, '2025-2', 46),
(13, 'B', 38, '2025-2', 46),
(14, 'C', 38, '2025-2', 46),
(15, 'A', 39, '2025-2', 47),
(16, 'B', 1, '2025-2', 47),
(17, 'D', 4, '2025-2', 48),
(18, 'L', 4, '2025-2', 48),
(19, 'M', 4, '2025-2', 48),
(20, 'N', 4, '2025-2', 48),
(21, 'A', 38, '2025-2', 49),
(22, 'A', 18, '2025-2', 50),
(23, 'B', 18, '2025-2', 50),
(24, 'A', 3, '2025-2', 51),
(25, 'B', 36, '2025-2', 51),
(26, 'C', 40, '2025-2', 51);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `horario_actividad`
--

CREATE TABLE `horario_actividad` (
  `id` int(11) NOT NULL,
  `nombre` text DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `dia` int(11) DEFAULT NULL,
  `h_ini` int(11) DEFAULT NULL,
  `min_ini` int(11) DEFAULT NULL,
  `h_fin` int(11) DEFAULT NULL,
  `min_fin` int(11) DEFAULT NULL,
  `fecha_ini` date DEFAULT NULL,
  `fecha_fin` date DEFAULT NULL,
  `actividadid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `horario_grupo`
--

CREATE TABLE `horario_grupo` (
  `id` int(11) NOT NULL,
  `nombre` text DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `dia` int(11) DEFAULT NULL,
  `h_ini` int(11) DEFAULT NULL,
  `min_ini` int(11) DEFAULT NULL,
  `h_fin` int(11) DEFAULT NULL,
  `min_fin` int(11) DEFAULT NULL,
  `fecha_ini` date DEFAULT NULL,
  `fecha_fin` date DEFAULT NULL,
  `grupoid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `horario_grupo`
--

INSERT INTO `horario_grupo` (`id`, `nombre`, `descripcion`, `dia`, `h_ini`, `min_ini`, `h_fin`, `min_fin`, `fecha_ini`, `fecha_fin`, `grupoid`) VALUES
(1, NULL, NULL, 1, 16, NULL, 19, NULL, NULL, NULL, 1),
(2, NULL, NULL, 4, 7, NULL, 10, NULL, NULL, NULL, 9),
(3, NULL, NULL, 6, 8, NULL, 11, NULL, NULL, NULL, 10),
(4, NULL, NULL, 2, 9, 0, 14, 0, NULL, NULL, 11),
(5, NULL, NULL, 6, 7, NULL, 11, NULL, NULL, NULL, 2),
(6, NULL, NULL, 4, 10, 0, 13, 0, NULL, NULL, 12),
(7, NULL, NULL, 3, 11, 0, 13, 0, NULL, NULL, 12),
(8, NULL, NULL, 1, 15, 0, 17, 0, NULL, NULL, 13),
(9, NULL, NULL, 3, 19, 0, 22, 0, NULL, NULL, 13),
(10, NULL, NULL, 1, 17, 0, 20, 0, NULL, NULL, 14),
(11, NULL, NULL, 3, 15, 0, 17, 0, NULL, NULL, 14),
(12, NULL, NULL, 3, 14, 0, 17, 0, NULL, NULL, 15),
(13, NULL, NULL, 4, 14, 0, 17, 0, NULL, NULL, 15),
(14, NULL, NULL, 4, 7, 0, 10, 0, NULL, NULL, 16),
(15, NULL, NULL, 6, 10, 0, 13, 0, NULL, NULL, 16),
(16, NULL, NULL, 5, 16, 0, 19, 0, NULL, NULL, 17),
(17, NULL, NULL, 1, 16, 0, 19, 0, NULL, NULL, 18),
(18, NULL, NULL, 6, 8, 0, 11, 0, NULL, NULL, 19),
(19, NULL, NULL, 4, 10, 0, 13, 0, NULL, NULL, 20),
(20, NULL, NULL, 3, 17, 0, 19, 0, NULL, NULL, 21),
(21, NULL, NULL, 5, 18, 0, 21, 0, NULL, NULL, 21),
(22, NULL, NULL, 1, 19, 0, 22, 0, NULL, NULL, 22),
(23, NULL, NULL, 5, 13, 0, 15, 0, NULL, NULL, 22),
(24, NULL, NULL, 5, 15, 0, 17, 0, NULL, NULL, 23),
(25, NULL, NULL, 6, 7, 0, 10, 0, NULL, NULL, 23),
(26, NULL, NULL, 2, 14, 0, 19, 0, NULL, NULL, 24),
(27, NULL, NULL, 2, 14, 0, 19, 0, NULL, NULL, 25),
(28, NULL, NULL, 2, 14, 0, 19, 0, NULL, NULL, 26);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lista`
--

CREATE TABLE `lista` (
  `id` int(11) NOT NULL,
  `nombre` text NOT NULL,
  `color` varchar(20) NOT NULL,
  `orden` int(11) DEFAULT NULL,
  `tableroid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lista_tarea`
--

CREATE TABLE `lista_tarea` (
  `listaid` int(11) NOT NULL,
  `tareaid` int(11) NOT NULL
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
(1, 'DSI 1 1', 30.00, 18.00, 1),
(2, 'DSI 1 2', 70.00, 20.00, 1),
(3, 'DSI 2 1', 30.00, 19.00, 2),
(4, 'DSI 2 2', 70.00, 19.00, 2),
(5, 'DSI 3 1', 30.00, 19.00, 3),
(6, 'DSI 3 2', 70.00, 20.00, 3),
(7, 'FDRD 1 1', 20.00, 17.00, 4),
(8, 'FDRD 1 2', 20.00, 16.50, 4),
(9, 'FDRD 1 3', 20.00, 18.00, 4),
(10, 'FDRD 1 4', 40.00, 11.50, 4),
(11, 'FDRD 2 1', 50.00, 6.00, 5),
(12, 'FDRD 2 2', 25.00, 17.00, 5),
(13, 'FDRD 2 3', 25.00, 18.00, 5),
(14, 'FDRD 3 1', 15.00, 17.00, 6),
(15, 'FDRD 3 2', 15.00, 15.00, 6),
(16, 'FDRD 3 3', 30.00, 16.00, 6),
(17, 'FDRD 3 4', 40.00, 11.50, 6),
(18, 'ICS 1 1', 40.00, 20.00, 7),
(19, 'ICS 1 2', 60.00, 18.00, 7),
(20, 'ICS 2 1', 10.00, 18.00, 8),
(21, 'ICS 2 2', 20.00, 19.00, 8),
(22, 'ICS 2 3', 20.00, 17.00, 8),
(23, 'ICS 3 1', 50.00, 19.00, 9),
(24, 'ICS 3 2', 50.00, 19.00, 9),
(25, 'ICS 4 1', 5.00, 20.00, 10),
(26, 'ICS 4 2', 5.00, 20.00, 10),
(27, 'ICS 4 3', 90.00, 20.00, 10),
(28, '', 100.00, 20.00, 11),
(29, '', 100.00, 14.00, 12),
(30, '', 100.00, 19.00, 13),
(31, '', 50.00, 18.00, 14),
(32, '', 50.00, 19.00, 14),
(33, '', 50.00, 14.00, 15),
(34, '', 50.00, 17.50, 15),
(35, '', 100.00, 15.25, 16),
(36, '', 12.50, 17.50, 19),
(37, '', 12.50, 14.00, 19),
(38, '', 25.00, 18.00, 19),
(39, '', 50.00, 18.00, 19),
(40, '', 25.00, 18.00, 20),
(41, '', 20.00, 18.00, 20),
(42, '', 30.00, 19.00, 20),
(43, '', 25.00, 19.00, 20),
(44, '', 40.00, 20.00, 17),
(45, '', 60.00, 20.00, 17),
(46, '', 40.00, 20.00, 18),
(47, '', 60.00, 20.00, 18),
(48, 'ICS 2 4', 50.00, 20.00, 8);

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
('2025-1', '2025-03-16 05:00:00', '2025-07-19 15:15:04', 0),
('2025-2', '2025-07-16 15:15:04', '2025-07-16 15:15:04', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tabla`
--

CREATE TABLE `tabla` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `color` varchar(20) NOT NULL DEFAULT '#FFFFFF',
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `espacioid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tabla`
--

INSERT INTO `tabla` (`id`, `nombre`, `color`, `fecha`, `espacioid`) VALUES
(1, '1ra tabla', '#FFFFFF', '2025-07-27 05:50:09', 1),
(2, 'Nueva tabla', '#FFFFFF', '2025-07-27 05:50:09', 1),
(3, 'Nueva tabla 2025-07-26', '#FFFFFF', '2025-07-27 05:50:09', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tabla_tarea`
--

CREATE TABLE `tabla_tarea` (
  `tareaid` int(11) NOT NULL,
  `filaid` int(11) NOT NULL,
  `columnaid` int(11) NOT NULL,
  `color` varchar(20) NOT NULL DEFAULT '#CCCCCC',
  `orden` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tabla_tarea`
--

INSERT INTO `tabla_tarea` (`tareaid`, `filaid`, `columnaid`, `color`, `orden`) VALUES
(1, 1, 1, '#CCCCCC', 0),
(2, 2, 2, '#CCCCCC', 0),
(3, 6, 2, '#CCCCCC', 0),
(4, 1, 1, '#CCCCCC', 0),
(5, 1, 4, '#CCCCCC', 0),
(6, 2, 4, '#CCCCCC', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tablero`
--

CREATE TABLE `tablero` (
  `id` int(11) NOT NULL,
  `nombre` text NOT NULL,
  `color` varchar(20) NOT NULL,
  `img` text DEFAULT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `espacioid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tarea`
--

CREATE TABLE `tarea` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `color` varchar(20) DEFAULT NULL,
  `orden` int(11) DEFAULT 0,
  `tareaid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tarea`
--

INSERT INTO `tarea` (`id`, `nombre`, `descripcion`, `color`, `orden`, `tareaid`) VALUES
(1, 'Notas', 'sfste', '#0082e6', 3, 13),
(2, 'aa', NULL, '#ff6600', 6, 8),
(3, 'mejorar fetch editar', NULL, '#0082e6', 0, 1),
(4, 'mejorar aspecto', NULL, '#0082e6', 1, 1),
(5, 'implementar paginas de matricula de grupo ya existentes', NULL, '#ff6600', 4, 8),
(6, 'aaa', NULL, '#ff6600', 3, 8),
(7, 'Tablas', NULL, '#fff700', 1, 13),
(8, 'Matriculas', NULL, '#ff6600', 2, 13),
(9, 'Arbol', NULL, '#24ff32', 0, 13),
(10, 'mejorar diseño de tareas', NULL, '#1df500', 0, 9),
(11, 'Test Padre', NULL, '#8000ff', 5, NULL),
(12, 'meter Agregar nueva tarea con modal por tarea', NULL, '#24ff8e', 0, 9),
(13, 'Paginas', NULL, '#59ff00', 0, 28),
(14, 'Menu Despegable', NULL, '#ff00ae', 2, 28),
(15, 'Base de datos', NULL, '#ffb67a', 3, 28),
(16, 'PAW', NULL, '#1abef4', 6, 28),
(17, 'Insertar en tabla tareas existentes', NULL, '#fff700', 0, 7),
(18, 'Test', NULL, NULL, 0, 11),
(19, 'Test', NULL, NULL, 0, 11),
(20, 'Test', NULL, NULL, 0, 11),
(21, 'Test', NULL, NULL, 0, 11),
(22, 'Test', NULL, NULL, 0, 11),
(23, 'Test', NULL, NULL, 0, 11),
(24, 'Test', NULL, NULL, 0, 32),
(25, 'Test', NULL, NULL, 0, 11),
(26, 'Test', NULL, NULL, 0, 11),
(27, 'Test', NULL, NULL, 0, 30),
(28, 'web academic', NULL, '#fff', 0, NULL),
(29, 'modulos', NULL, '#fff', 1, 30),
(30, 'Audit', NULL, '#fff', 2, NULL),
(31, 'DSI', NULL, '#fff', 3, NULL),
(32, 'NASA', NULL, '#fff', 4, NULL),
(33, 'Nueva tarea 2025-07-28 15:12:13', NULL, '#fff', 5, 31),
(34, 'mejorar diseño con iconos y colores', NULL, '#fb00ff', 1, 14),
(35, 'poner items generales', NULL, '#e100ff', 2, 14),
(36, 'Nueva tarea 2025-07-28 15:38:39', NULL, '#ff6600', 1, 8),
(37, 'Nueva tarea 2025-07-28 15:38:40', NULL, '#ff6600', 2, 8),
(38, 'agregar por tarea: descripcion, ascendencia de padres ,', NULL, '#0000ff', 6, 9),
(39, 'Agregar fila mejorado', NULL, '#fff700', 1, 7),
(40, 'Agregar columna mejorado', NULL, '#fff700', 2, 7),
(41, 'Mejorar aspecto general de todala tabla', NULL, '#fff700', 3, 7),
(42, 'Flask', NULL, '#ffffff', 1, 28),
(43, 'agregar Login', NULL, '#fff', 1, 42),
(44, 'incorporar habilitar login', NULL, '#fff', 2, 42);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_actividad`
--

CREATE TABLE `tipo_actividad` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `orden` int(11) NOT NULL,
  `usuarioid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipo_actividad`
--

INSERT INTO `tipo_actividad` (`id`, `nombre`, `orden`, `usuarioid`) VALUES
(1, 'Académica', 1, 1),
(2, 'Personal', 2, 1);

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
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKactividad293187` (`tipo_actividadid`);

--
-- Indices de la tabla `columna`
--
ALTER TABLE `columna`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKcolumna69016` (`tablaid`);

--
-- Indices de la tabla `curso`
--
ALTER TABLE `curso`
  ADD PRIMARY KEY (`id`);

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
-- Indices de la tabla `espacio`
--
ALTER TABLE `espacio`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `etiqueta`
--
ALTER TABLE `etiqueta`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `etiqueta_tarea`
--
ALTER TABLE `etiqueta_tarea`
  ADD PRIMARY KEY (`etiquetaid`,`tareaid`),
  ADD KEY `FKetiqueta_t859734` (`tareaid`);

--
-- Indices de la tabla `fila`
--
ALTER TABLE `fila`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKfila647965` (`tablaid`);

--
-- Indices de la tabla `grupo`
--
ALTER TABLE `grupo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKgrupo646143` (`cursoid`),
  ADD KEY `FKgrupo65739` (`semestrecodigo`),
  ADD KEY `FKgrupo55510` (`docenteid`);

--
-- Indices de la tabla `horario_actividad`
--
ALTER TABLE `horario_actividad`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKhorario_ac767522` (`actividadid`);

--
-- Indices de la tabla `horario_grupo`
--
ALTER TABLE `horario_grupo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKhorario_gr811018` (`grupoid`);

--
-- Indices de la tabla `lista`
--
ALTER TABLE `lista`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKlista417576` (`tableroid`);

--
-- Indices de la tabla `lista_tarea`
--
ALTER TABLE `lista_tarea`
  ADD PRIMARY KEY (`listaid`,`tareaid`),
  ADD KEY `FKlista_tare607978` (`tareaid`);

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
-- Indices de la tabla `tabla`
--
ALTER TABLE `tabla`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKtabla206047` (`espacioid`);

--
-- Indices de la tabla `tabla_tarea`
--
ALTER TABLE `tabla_tarea`
  ADD PRIMARY KEY (`tareaid`,`filaid`,`columnaid`),
  ADD KEY `FKtarea_tabl911769` (`columnaid`),
  ADD KEY `FKtarea_tabl939560` (`filaid`);

--
-- Indices de la tabla `tablero`
--
ALTER TABLE `tablero`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKtablero743529` (`espacioid`);

--
-- Indices de la tabla `tarea`
--
ALTER TABLE `tarea`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKtarea76973` (`tareaid`);

--
-- Indices de la tabla `tipo_actividad`
--
ALTER TABLE `tipo_actividad`
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT de la tabla `columna`
--
ALTER TABLE `columna`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `curso`
--
ALTER TABLE `curso`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

--
-- AUTO_INCREMENT de la tabla `docente`
--
ALTER TABLE `docente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT de la tabla `espacio`
--
ALTER TABLE `espacio`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `etiqueta`
--
ALTER TABLE `etiqueta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `fila`
--
ALTER TABLE `fila`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `grupo`
--
ALTER TABLE `grupo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT de la tabla `horario_actividad`
--
ALTER TABLE `horario_actividad`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `horario_grupo`
--
ALTER TABLE `horario_grupo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT de la tabla `lista`
--
ALTER TABLE `lista`
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT de la tabla `tabla`
--
ALTER TABLE `tabla`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tablero`
--
ALTER TABLE `tablero`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tarea`
--
ALTER TABLE `tarea`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT de la tabla `tipo_actividad`
--
ALTER TABLE `tipo_actividad`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
-- Filtros para la tabla `actividad`
--
ALTER TABLE `actividad`
  ADD CONSTRAINT `FKactividad293187` FOREIGN KEY (`tipo_actividadid`) REFERENCES `tipo_actividad` (`id`);

--
-- Filtros para la tabla `columna`
--
ALTER TABLE `columna`
  ADD CONSTRAINT `FKcolumna69016` FOREIGN KEY (`tablaid`) REFERENCES `tabla` (`id`);

--
-- Filtros para la tabla `detalle_matricula`
--
ALTER TABLE `detalle_matricula`
  ADD CONSTRAINT `FKdetalle_ma614462` FOREIGN KEY (`grupoid`) REFERENCES `grupo` (`id`),
  ADD CONSTRAINT `FKdetalle_ma708364` FOREIGN KEY (`matriculaid`) REFERENCES `matricula` (`id`);

--
-- Filtros para la tabla `etiqueta_tarea`
--
ALTER TABLE `etiqueta_tarea`
  ADD CONSTRAINT `FKetiqueta_t859734` FOREIGN KEY (`tareaid`) REFERENCES `tarea` (`id`),
  ADD CONSTRAINT `FKetiqueta_t930841` FOREIGN KEY (`etiquetaid`) REFERENCES `etiqueta` (`id`);

--
-- Filtros para la tabla `fila`
--
ALTER TABLE `fila`
  ADD CONSTRAINT `FKfila647965` FOREIGN KEY (`tablaid`) REFERENCES `tabla` (`id`);

--
-- Filtros para la tabla `grupo`
--
ALTER TABLE `grupo`
  ADD CONSTRAINT `FKgrupo55510` FOREIGN KEY (`docenteid`) REFERENCES `docente` (`id`),
  ADD CONSTRAINT `FKgrupo646143` FOREIGN KEY (`cursoid`) REFERENCES `curso` (`id`),
  ADD CONSTRAINT `FKgrupo65739` FOREIGN KEY (`semestrecodigo`) REFERENCES `semestre` (`codigo`);

--
-- Filtros para la tabla `horario_actividad`
--
ALTER TABLE `horario_actividad`
  ADD CONSTRAINT `FKhorario_ac767522` FOREIGN KEY (`actividadid`) REFERENCES `actividad` (`id`);

--
-- Filtros para la tabla `horario_grupo`
--
ALTER TABLE `horario_grupo`
  ADD CONSTRAINT `FKhorario_gr811018` FOREIGN KEY (`grupoid`) REFERENCES `grupo` (`id`);

--
-- Filtros para la tabla `lista`
--
ALTER TABLE `lista`
  ADD CONSTRAINT `FKlista417576` FOREIGN KEY (`tableroid`) REFERENCES `tablero` (`id`);

--
-- Filtros para la tabla `lista_tarea`
--
ALTER TABLE `lista_tarea`
  ADD CONSTRAINT `FKlista_tare607978` FOREIGN KEY (`tareaid`) REFERENCES `tarea` (`id`),
  ADD CONSTRAINT `FKlista_tare770015` FOREIGN KEY (`listaid`) REFERENCES `lista` (`id`);

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
-- Filtros para la tabla `tabla`
--
ALTER TABLE `tabla`
  ADD CONSTRAINT `FKtabla206047` FOREIGN KEY (`espacioid`) REFERENCES `espacio` (`id`);

--
-- Filtros para la tabla `tabla_tarea`
--
ALTER TABLE `tabla_tarea`
  ADD CONSTRAINT `FKtarea_tabl911769` FOREIGN KEY (`columnaid`) REFERENCES `columna` (`id`),
  ADD CONSTRAINT `FKtarea_tabl939560` FOREIGN KEY (`filaid`) REFERENCES `fila` (`id`),
  ADD CONSTRAINT `FKtarea_tabl96606` FOREIGN KEY (`tareaid`) REFERENCES `tarea` (`id`);

--
-- Filtros para la tabla `tablero`
--
ALTER TABLE `tablero`
  ADD CONSTRAINT `FKtablero743529` FOREIGN KEY (`espacioid`) REFERENCES `espacio` (`id`);

--
-- Filtros para la tabla `tarea`
--
ALTER TABLE `tarea`
  ADD CONSTRAINT `FKtarea76973` FOREIGN KEY (`tareaid`) REFERENCES `tarea` (`id`);

--
-- Filtros para la tabla `unidad`
--
ALTER TABLE `unidad`
  ADD CONSTRAINT `FKunidad83868` FOREIGN KEY (`grupoid`) REFERENCES `grupo` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
