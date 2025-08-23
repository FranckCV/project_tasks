-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 23-08-2025 a las 22:22:45
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
  `ancho` decimal(9,3) DEFAULT NULL,
  `tablaid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `columna`
--

INSERT INTO `columna` (`id`, `nombre`, `color`, `orden`, `ancho`, `tablaid`) VALUES
(3, 'Flask', '#022aca', 1, 0.000, 1),
(15, 'xd', '#302d43', 0, 0.000, 2),
(20, 'Diseño', '#1cb6ca', 11, 0.000, 1),
(21, 'JS', '#afbc01', 12, 0.000, 1),
(22, 'BD', '#f9811f', 13, 0.000, 1),
(23, 'Usuario', '#7d0ab2', 14, 0.000, 1),
(24, 'Responsividad', '#2ce26c', 15, 0.000, 1),
(28, 'Doctrina', '#7c33d7', 1, 0.000, 3),
(29, 'Redes', '#b31919', 3, 0.000, 3),
(30, 'Investigacion', '#e5c810', 2, 0.000, 3),
(31, 'NASA', '#50bcf2', 7, 0.000, 3),
(32, 'AUDIT', '#425276', 8, 0.000, 3),
(33, 'Gobierno', '#1f44ff', 4, 0.000, 3),
(34, 'Mineria', '#ff7e29', 6, 0.000, 3),
(35, 'Moviles', '#09ec23', 5, 0.000, 3),
(36, 'Otros', '#b5b5b5', 16, NULL, 1);

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
(65, 'Tópicos Avanzados En Desarrollo De Software', 'X', NULL, 3, 10, NULL, '#00cc1f'),
(74, 'FUTSAL', 'FUT', NULL, 1, NULL, NULL, 'darkgrey');

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
(1, 7),
(1, 58),
(2, 12),
(2, 16),
(2, 18),
(2, 21),
(2, 23),
(2, 26),
(5, 28),
(5, 29),
(5, 30),
(5, 31),
(5, 32),
(5, 33),
(6, 11),
(6, 27),
(6, 53),
(6, 54),
(6, 55),
(6, 56),
(6, 57),
(7, 46),
(7, 47),
(7, 48),
(7, 49),
(7, 50),
(7, 51),
(7, 52),
(8, 40),
(8, 41),
(8, 42),
(8, 43),
(8, 44),
(8, 45),
(9, 34),
(9, 35),
(9, 36),
(9, 37),
(9, 38),
(9, 39);

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
(0, '_DESCONOCIDO_', '_DESCONOCIDO_'),
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
(1, 'Grupo', '#07c048', 17, 1),
(2, 'Tareas', '#1189a2', 12, 1),
(3, 'Tabla', '#07c048', 10, 1),
(4, 'Calendario', '#1189a2', 14, 1),
(5, 'Tablas', '#1189a2', 9, 1),
(6, 'Horario', '#1189a2', 13, 1),
(7, 'Todos grupos', '#800ff0', 19, 1),
(8, 'AUDIT', '#208dbc', 2, 2),
(9, 'DSI', '#e61e1e', 3, 2),
(10, 'PRJ', '#272777', 1, 2),
(11, 'NASA', '#1f9eff', 4, 2),
(12, 'a', '#707070', 5, 2),
(13, '-GENERAL-', '#383838', 0, 1),
(14, 'Dashboard', '#001eff', 6, 1),
(15, 'Notas', '#1189a2', 7, 1),
(16, 'Editar perfil', '#ff5a36', 3, 1),
(17, 'Matricula', '#07c048', 16, 1),
(18, 'Docentes', '#800ff0', 22, 1),
(19, 'Grupos', '#1189a2', 18, 1),
(20, 'LUN', '#343187', 8, 3),
(21, 'MAR', '#343187', 9, 3),
(22, 'MIE', '#343187', 10, 3),
(23, 'Completo', '#1c1c1c', 1, 3),
(24, 'JUE', '#343187', 11, 3),
(25, 'VIE', '#fd7e08', 5, 3),
(26, 'SAB', '#343187', 13, 3),
(27, 'VIE', '#343187', 12, 3),
(28, 'Cambiar contraseña', '#ff5a36', 4, 1),
(29, 'SAB', '#fd7e08', 6, 3),
(30, 'Perfil', '#1189a2', 2, 1),
(31, 'Configuracion', '#1189a2', 5, 1),
(32, 'Todas notas', '#800ff0', 8, 1),
(33, 'Tarea', '#07c048', 11, 1),
(34, 'Matriculas', '#1189a2', 15, 1),
(35, 'Cursos', '#800ff0', 21, 1),
(36, 'Semestres', '#800ff0', 23, 1),
(37, 'Curso', '#07c048', 20, 1),
(38, 'Login', '#001eff', 1, 1),
(39, 'JUE', '#fd7e08', 4, 3),
(40, 'MIE', '#fd7e08', 3, 3),
(41, 'MAR', '#fd7e08', 2, 3),
(42, 'DOM', '#fd7e08', 7, 3);

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
(26, 'C', 40, '2025-2', 51),
(27, 'B', 2, '2024-2', 2),
(28, 'B', 0, '2022-2', 22),
(29, 'A', 0, '2022-2', 19),
(30, 'C', 18, '2022-2', 21),
(31, 'A', 0, '2022-2', 20),
(32, 'C', 9, '2022-2', 17),
(33, 'C', 28, '2022-2', 18),
(34, 'B', 1, '2023-1', 23),
(35, 'B', 2, '2023-1', 28),
(36, 'B', 0, '2023-1', 27),
(37, 'B', 32, '2023-1', 25),
(38, 'B', 17, '2023-1', 24),
(39, 'N', 11, '2023-1', 26),
(40, 'S', 16, '2023-2', 9),
(41, 'B', 10, '2023-2', 8),
(42, 'B', 12, '2023-2', 29),
(43, 'B', 15, '2023-2', 31),
(44, 'B', 13, '2023-2', 10),
(45, 'B', 0, '2023-2', 30),
(46, 'B', 24, '2024-1', 32),
(47, 'B', 8, '2024-1', 33),
(48, 'B', 25, '2024-1', 7),
(49, 'B', 21, '2024-1', 37),
(50, 'B', 0, '2024-1', 35),
(51, 'B', 0, '2024-1', 34),
(52, 'B', 0, '2024-1', 36),
(53, 'I', 4, '2024-2', 4),
(54, 'B', 5, '2024-2', 5),
(55, 'C', 34, '2024-2', 38),
(56, 'B', 3, '2024-2', 6),
(57, 'A', 1, '2024-2', 1),
(58, 'C', 0, '2025-1', 74);

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
  `dia` int(11) DEFAULT NULL,
  `h_ini` int(11) DEFAULT NULL,
  `min_ini` int(11) DEFAULT NULL,
  `h_fin` int(11) DEFAULT NULL,
  `min_fin` int(11) DEFAULT NULL,
  `grupoid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `horario_grupo`
--

INSERT INTO `horario_grupo` (`id`, `nombre`, `dia`, `h_ini`, `min_ini`, `h_fin`, `min_fin`, `grupoid`) VALUES
(1, NULL, 1, 16, NULL, 19, NULL, 1),
(2, NULL, 4, 7, NULL, 10, NULL, 9),
(3, NULL, 6, 8, NULL, 11, NULL, 10),
(4, NULL, 2, 9, 0, 14, 0, 11),
(5, NULL, 6, 7, NULL, 11, NULL, 2),
(6, NULL, 4, 10, 0, 13, 0, 12),
(7, NULL, 3, 11, 0, 13, 0, 12),
(8, NULL, 1, 15, 0, 17, 0, 13),
(9, NULL, 3, 19, 0, 22, 0, 13),
(10, NULL, 1, 17, 0, 20, 0, 14),
(11, NULL, 3, 15, 0, 17, 0, 14),
(12, NULL, 3, 14, 0, 17, 0, 15),
(13, NULL, 4, 14, 0, 17, 0, 15),
(14, NULL, 4, 7, 0, 10, 0, 16),
(15, NULL, 6, 10, 0, 13, 0, 16),
(16, NULL, 5, 16, 0, 19, 0, 17),
(17, NULL, 1, 16, 0, 19, 0, 18),
(18, NULL, 6, 8, 0, 11, 0, 19),
(19, NULL, 4, 10, 0, 13, 0, 20),
(20, NULL, 3, 17, 0, 19, 0, 21),
(21, NULL, 5, 18, 0, 21, 0, 21),
(22, NULL, 1, 19, 0, 22, 0, 22),
(23, NULL, 5, 13, 0, 15, 0, 22),
(24, NULL, 5, 15, 0, 17, 0, 23),
(25, NULL, 6, 7, 0, 10, 0, 23),
(26, NULL, 2, 14, 0, 19, 0, 24),
(27, NULL, 2, 14, 0, 19, 0, 25),
(28, NULL, 2, 14, 0, 19, 0, 26),
(29, NULL, 5, 7, NULL, 10, NULL, 6),
(30, NULL, 4, 10, NULL, 12, NULL, 6),
(31, NULL, 3, 7, NULL, 10, NULL, 4),
(32, NULL, 2, 9, NULL, 11, NULL, 4),
(33, NULL, 2, 11, NULL, 14, NULL, 3),
(34, NULL, 4, 7, NULL, 10, NULL, 3),
(35, NULL, 5, 10, NULL, 13, NULL, 5),
(36, NULL, 6, 11, NULL, 13, NULL, 5),
(37, NULL, 4, 14, NULL, 19, NULL, 7),
(38, NULL, 2, 20, NULL, 22, NULL, 27),
(39, NULL, 4, 15, NULL, 19, NULL, 27),
(40, NULL, 1, 16, 0, 19, 0, 28),
(41, NULL, 5, 17, 0, 19, 0, 28),
(42, NULL, 1, 7, 0, 9, 0, 29),
(43, NULL, 2, 11, 0, 13, 0, 29),
(44, NULL, 1, 10, 0, 12, 0, 30),
(45, NULL, 2, 16, 0, 19, 0, 30),
(46, NULL, 2, 7, 0, 9, 0, 31),
(47, NULL, 4, 7, 0, 9, 0, 31),
(48, NULL, 3, 14, 0, 17, 0, 32),
(49, NULL, 4, 13, 0, 16, 0, 32),
(50, NULL, 3, 17, 0, 19, 0, 33),
(51, NULL, 4, 16, 0, 19, 0, 33),
(52, NULL, 4, 7, 0, 9, 0, 34),
(53, NULL, 5, 7, 0, 10, 0, 34),
(54, NULL, 2, 10, 0, 13, 0, 35),
(55, NULL, 3, 7, 0, 9, 0, 35),
(56, NULL, 3, 10, 0, 13, 0, 36),
(57, NULL, 4, 9, 0, 11, 0, 36),
(58, NULL, 1, 8, 0, 11, 0, 37),
(59, NULL, 2, 8, 0, 10, 0, 37),
(60, NULL, 2, 14, 0, 17, 0, 38),
(61, NULL, 5, 10, 0, 13, 0, 38),
(62, NULL, 4, 16, 0, 19, 0, 39),
(63, NULL, 5, 10, 0, 13, 0, 40),
(64, NULL, 1, 10, 0, 13, 0, 41),
(65, NULL, 5, 15, 0, 17, 0, 41),
(66, NULL, 1, 8, 0, 10, 0, 42),
(67, NULL, 3, 8, 0, 11, 0, 42),
(68, NULL, 3, 11, 0, 13, 0, 43),
(69, NULL, 4, 16, 0, 19, 0, 43),
(70, NULL, 2, 13, 0, 16, 0, 44),
(71, NULL, 5, 17, 0, 20, 0, 44),
(72, NULL, 2, 16, 0, 18, 0, 45),
(73, NULL, 6, 10, 0, 13, 0, 45),
(74, NULL, 5, 10, 0, 12, 0, 46),
(75, NULL, 6, 10, NULL, 13, NULL, 46),
(76, NULL, 1, 7, 0, 10, 0, 47),
(77, NULL, 3, 11, 0, 13, 0, 47),
(78, NULL, 4, 10, 0, 12, 0, 48),
(79, NULL, 5, 7, 0, 10, 0, 48),
(80, NULL, 4, 7, 0, 10, 0, 49),
(81, NULL, 1, 10, 0, 13, 0, 50),
(82, NULL, 2, 7, 0, 10, 0, 51),
(83, NULL, 3, 9, 0, 11, 0, 51),
(84, NULL, 2, 10, 0, 12, 0, 52),
(85, NULL, 3, 7, 0, 9, 0, 52),
(86, NULL, 2, 16, 0, 19, 0, 53),
(87, NULL, 3, 15, 0, 18, 0, 54),
(88, NULL, 5, 13, 0, 15, 0, 54),
(89, NULL, 4, 9, 0, 11, 0, 55),
(90, NULL, 4, 13, 0, 15, 0, 56),
(91, NULL, 5, 15, 0, 18, 0, 56),
(92, NULL, 3, 18, 0, 21, 0, 57),
(93, NULL, 5, 18, 0, 21, 0, 57),
(94, NULL, 3, 15, 0, 17, 0, 58);

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
(1, 'Modelo 1', 1, 1, '2025-07-17 14:05:10', '2025-1', 1),
(2, 'Modelo 2025-1 2025-08-09 00:06:02', 0, 0, '2025-08-09 05:06:02', '2025-2', 1),
(3, 'Modelo 2025-2 2025-08-09 18:32:00', 0, 0, '2025-08-09 23:32:05', '2025-2', 1),
(4, 'Modelo 2022-1 2025-08-09 18:35:32', 0, 0, '2025-08-09 23:35:32', '2022-1', 1),
(5, 'Modelo 2022-2 2025-08-09 18:35:34', 0, 0, '2025-08-09 23:35:34', '2022-2', 1),
(6, 'Modelo 2024-2 2025-08-09 18:35:37', 0, 0, '2025-08-09 23:35:37', '2024-2', 1),
(7, 'Modelo 2024-1 2025-08-09 18:35:40', 0, 0, '2025-08-09 23:35:40', '2024-1', 1),
(8, 'Modelo 2023-2 2025-08-09 18:35:43', 0, 0, '2025-08-09 23:35:43', '2023-2', 1),
(9, 'Modelo 2023-1 2025-08-09 18:35:45', 0, 0, '2025-08-09 23:35:45', '2023-1', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nota`
--

CREATE TABLE `nota` (
  `id` int(11) NOT NULL,
  `nombre` text DEFAULT NULL,
  `porcentaje` decimal(5,2) NOT NULL,
  `nro` int(11) DEFAULT NULL,
  `unidadid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `nota`
--

INSERT INTO `nota` (`id`, `nombre`, `porcentaje`, `nro`, `unidadid`) VALUES
(1, 'DSI 1 1', 30.00, NULL, 1),
(2, 'DSI 1 2', 70.00, NULL, 1),
(3, 'DSI 2 1', 30.00, NULL, 2),
(4, 'DSI 2 2', 70.00, NULL, 2),
(5, 'DSI 3 1', 30.00, NULL, 3),
(6, 'DSI 3 2', 70.00, NULL, 3),
(7, 'FDRD 1 1', 20.00, NULL, 4),
(8, 'FDRD 1 2', 20.00, NULL, 4),
(9, 'FDRD 1 3', 20.00, NULL, 4),
(10, 'FDRD 1 4', 40.00, NULL, 4),
(11, 'FDRD 2 1', 50.00, NULL, 5),
(12, 'FDRD 2 2', 25.00, NULL, 5),
(13, 'FDRD 2 3', 25.00, NULL, 5),
(14, 'FDRD 3 1', 15.00, NULL, 6),
(15, 'FDRD 3 2', 15.00, NULL, 6),
(16, 'FDRD 3 3', 30.00, NULL, 6),
(17, 'FDRD 3 4', 40.00, NULL, 6),
(18, 'ICS 1 1', 40.00, NULL, 7),
(19, 'ICS 1 2', 60.00, NULL, 7),
(20, 'ICS 2 1', 10.00, NULL, 8),
(21, 'ICS 2 2', 20.00, NULL, 8),
(22, 'ICS 2 3', 20.00, NULL, 8),
(23, 'ICS 3 1', 50.00, NULL, 9),
(24, 'ICS 3 2', 50.00, NULL, 9),
(25, 'ICS 4 1', 5.00, NULL, 10),
(26, 'ICS 4 2', 5.00, NULL, 10),
(27, 'ICS 4 3', 90.00, NULL, 10),
(28, '', 100.00, NULL, 11),
(29, '', 100.00, NULL, 12),
(30, '', 100.00, NULL, 13),
(31, '', 50.00, NULL, 14),
(32, '', 50.00, NULL, 14),
(33, '', 50.00, NULL, 15),
(34, '', 50.00, NULL, 15),
(35, '', 100.00, NULL, 16),
(36, '', 12.50, NULL, 19),
(37, '', 12.50, NULL, 19),
(38, '', 25.00, NULL, 19),
(39, '', 50.00, NULL, 19),
(40, '', 25.00, NULL, 20),
(41, '', 20.00, NULL, 20),
(42, '', 30.00, NULL, 20),
(43, '', 25.00, NULL, 20),
(44, '', 40.00, NULL, 17),
(45, '', 60.00, NULL, 17),
(46, '', 40.00, NULL, 18),
(47, '', 60.00, NULL, 18),
(48, 'ICS 2 4', 50.00, NULL, 8);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paleta`
--

CREATE TABLE `paleta` (
  `id` int(11) NOT NULL,
  `color1` varchar(30) DEFAULT NULL,
  `color2` varchar(30) DEFAULT NULL,
  `color3` varchar(30) DEFAULT NULL,
  `color4` varchar(30) DEFAULT NULL,
  `color5` varchar(30) DEFAULT NULL,
  `colorbg1` varchar(30) DEFAULT NULL,
  `colorbg2` varchar(30) DEFAULT NULL,
  `colorbg3` varchar(30) DEFAULT NULL,
  `estado` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `paleta`
--

INSERT INTO `paleta` (`id`, `color1`, `color2`, `color3`, `color4`, `color5`, `colorbg1`, `colorbg2`, `colorbg3`, `estado`) VALUES
(1, '#161a2c', '#8d22ff', '#00ddff', '#222a3f', '#18ff84', '#13182c', '#0f0f23', '#1c2537', 0),
(2, '#161a2c', '#6422ff', '#31ccff', '#ff7045', '#18ff3e', '#2d2d2d', '#151515', '#121212', 0),
(3, '#161a2c', '#6422ff', '#ff5b7c', '#ff7045', '#18ff3e', '#0b2230', ' #000103', ' #183f58', 0),
(4, '#161a2c', '#6422ff', '#00ADB5', '#ff7045', '#18ff3e', '#111722', NULL, NULL, 0),
(5, '#161a2c', '#6422ff', '#294cff', '#ff531f', '#18ff3e', '#23242e', '#151515', '#121212', 0),
(7, '#161a2c', '#6422ff', '#31ccff', '#ff7045', '#18ff3e', '#1a1a1a', '#262626', '#121212', 0),
(8, '#161a2c', '#6422ff', '#ff144f', '#ff7045', '#18ff3e', '#1a1a1a', '#262626', '#121212', 1);

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
-- Estructura de tabla para la tabla `sistema`
--

CREATE TABLE `sistema` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `semestre_actual` char(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tabla`
--

CREATE TABLE `tabla` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `color` varchar(20) NOT NULL DEFAULT '#FFFFFF',
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `ver` tinyint(1) DEFAULT NULL,
  `estado` tinyint(1) DEFAULT NULL,
  `espacioid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tabla`
--

INSERT INTO `tabla` (`id`, `nombre`, `color`, `fecha`, `ver`, `estado`, `espacioid`) VALUES
(1, 'Gestion PRJ', '#FFFFFF', '2025-07-27 05:50:09', 0, NULL, 1),
(2, 'Pendientes', '#FFFFFF', '2025-07-27 05:50:09', 1, NULL, 1),
(3, 'TAREAS', '#FFFFFF', '2025-07-27 05:50:09', 0, NULL, 1);

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
(1, 14, 24, '#994628', 2),
(2, 1, 20, '#9a8d6e', 2),
(3, 15, 21, '#CCCCCC', 0),
(4, 15, 20, '#994628', 1),
(5, 17, 22, '#622222', 1),
(6, 13, 21, '#465289', 2),
(53, 12, 15, '#275e75', 17),
(54, 12, 15, '#275e75', 2),
(55, 12, 15, '#CCCCCC', 1),
(56, 12, 15, '#CCCCCC', 1),
(57, 12, 15, '#8a2626', 1),
(58, 12, 15, '#CCCCCC', 3),
(59, 12, 15, '#689fb6', 3),
(60, 12, 15, '#359a91', 17),
(61, 15, 24, '#465289', 1),
(62, 3, 20, '#CCCCCC', 3),
(63, 8, 15, '#25c4ae', 0),
(64, 8, 15, '#25c4ae', 0),
(65, 9, 15, '#888c5f', 0),
(66, 9, 15, '#888c5f', 0),
(67, 12, 15, '#28918b', 1),
(68, 10, 15, '#28918b', 0),
(69, 3, 3, '#b75080', 0),
(70, 3, 21, '#aa8880', 2),
(71, 13, 3, '#b72980', 3),
(72, 3, 20, '#5f84ce', 1),
(73, 3, 20, '#aa8880', 3),
(74, 3, 20, '#aa8880', 4),
(75, 3, 20, '#aa8880', 5),
(76, 3, 3, '#b75080', 2),
(77, 1, 3, '#b75080', 1),
(78, 12, 15, '#1fdb7d', 8),
(79, 1, 3, '#2146b5', 1),
(80, 14, 20, '#c20000', 1),
(81, 6, 22, '#94e302', 4),
(82, 13, 20, '#729f01', 5),
(83, 3, 21, '#caa902', 1),
(84, 3, 21, '#5289ee', 4),
(85, 1, 21, '#320606', 2),
(86, 14, 22, '#348096', 2),
(87, 3, 22, '#994627', 0),
(88, 13, 3, '#b74f7f', 5),
(89, 6, 20, '#ff5300', 1),
(90, 3, 21, '#8a6b0a', 8),
(91, 6, 3, '#9a8d6e', 8),
(92, 14, 20, '#204d41', 1),
(93, 8, 15, '#1ee9cf', 0),
(94, 8, 15, '#1ee9cf', 0),
(95, 12, 15, '#5e2772', 17),
(96, 12, 15, '#35916f', 9),
(97, 3, 20, '#da5a5a', 3),
(98, 3, 20, '#da5a5a', 3),
(99, 3, 21, '#a2ada8', 9),
(100, 13, 20, '#1e8cc5', 1),
(101, 38, 3, '#1b6451', 2),
(102, 5, 24, '#321575', 1),
(103, 13, 21, '#2f8738', 2),
(104, 3, 21, '#3e987b', 10),
(105, 18, 20, '#98c7cd', 1),
(106, 19, 3, '#98c7cd', 2),
(107, 2, 21, '#47cf84', 1),
(108, 13, 3, '#064479', 5),
(109, 20, 28, '#71928b', 1),
(110, 21, 30, '#f27c15', 1),
(111, 21, 30, '#f27c15', 1),
(112, 21, 30, '#f27c15', 6),
(113, 21, 30, '#f27c15', 6),
(114, 3, 22, '#94595e', 0),
(115, 3, 22, '#94595e', 0),
(116, 29, 35, '#3b417e', 2),
(117, 21, 30, '#293ac3', 1),
(118, 29, 35, '#38876b', 3),
(119, 22, 29, '#732550', 1),
(120, 31, 21, '#1b93a7', 2),
(121, 31, 20, '#1b93a7', 1),
(122, 31, 20, '#1b93a7', 2),
(123, 22, 33, '#293ac3', 2),
(124, 5, 20, '#1b93a7', 2),
(125, 30, 3, '#0959b6', 2),
(126, 16, 3, '#804280', 2),
(127, 28, 3, '#804280', 2),
(128, 32, 3, '#411cdd', 2),
(129, 33, 20, '#16ae7a', 2),
(130, 2, 20, '#1b93a7', 2),
(131, 4, 3, '#0959b6', 2),
(132, 17, 20, '#16ae7a', 2),
(133, 7, 3, '#411cdd', 2),
(134, 37, 20, '#16ae7a', 2),
(135, 35, 3, '#411cdd', 2),
(136, 34, 20, '#411cdd', 1),
(137, 36, 3, '#411cdd', 1),
(138, 3, 21, '#5ec124', 11),
(139, 3, 20, '#16ae7a', 6),
(140, 3, 20, '#16ae7a', 7),
(141, 3, 20, '#16ae7a', 8),
(142, 3, 20, '#16ae7a', 9),
(143, 3, 20, '#16ae7a', 10),
(144, 3, 20, '#16ae7a', 11),
(145, 21, 34, '#995758', 2),
(146, 21, 34, '#995758', 3),
(147, 22, 34, '#995758', 2),
(148, 24, 34, '#995758', 2),
(149, 42, 34, '#da996f', 2),
(150, 23, 35, '#83b515', 2);

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
  `completo` tinyint(1) DEFAULT 0,
  `tareaid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tarea`
--

INSERT INTO `tarea` (`id`, `nombre`, `descripcion`, `color`, `orden`, `completo`, `tareaid`) VALUES
(1, 'Adaptar para celular', 'sfste', '#0b5e9d', 3, 0, 13),
(2, 'formulario dinamico para varias unidades y notas por unidad', NULL, '#ff6600', 6, 0, 1),
(3, 'mejorar fetch editar', NULL, '#003d6b', 0, 0, 1),
(4, 'mejorar aspecto', NULL, '#005494', 1, 0, 1),
(5, 'implementar paginas de matricula de grupo ya existentes', NULL, '#ff6600', 4, 1, 1),
(6, 'mejorar funcion update_color para estilos personalizados', NULL, '#ff6600', 3, 1, 1),
(7, 'Tablas', NULL, '#fff700', 0, 0, 13),
(8, 'Grupos', NULL, '#ff6600', 2, 0, 13),
(9, 'Tareas', NULL, '#24ff32', 3, 0, 13),
(10, 'mejorar diseño de tareas', NULL, '#1df500', 0, 0, 9),
(11, 'Test Padre', NULL, '#ba75ff', 5, 0, NULL),
(12, 'meter Agregar nueva tarea (pensar metodopractico)', NULL, '#00700d', 0, 0, 9),
(13, 'Paginas', NULL, '#59ff00', 0, 0, 28),
(14, 'Menu Despegable', NULL, '#ff52c8', 2, 0, 28),
(15, 'Base de datos', NULL, '#ffb67a', 3, 0, 28),
(16, 'PAW', NULL, '#1abef4', 6, 0, 28),
(17, 'Insertar en tabla tareas existentes', NULL, '#fff700', 1, 0, 7),
(18, 'Test', NULL, NULL, 0, 0, 11),
(19, 'Test', NULL, NULL, 0, 0, 11),
(20, 'Test', NULL, NULL, 0, 0, 11),
(21, 'Test', NULL, NULL, 0, 0, 11),
(22, 'Test', NULL, NULL, 0, 0, 11),
(23, 'Test', NULL, NULL, 0, 0, 11),
(24, 'Test', NULL, NULL, 0, 0, 32),
(25, 'Test', NULL, NULL, 0, 0, 11),
(26, 'Test', NULL, NULL, 0, 0, 11),
(27, 'Test', NULL, NULL, 0, 0, 30),
(28, 'web academic', NULL, '#fff', 0, 0, NULL),
(29, 'modulos', NULL, '#fff', 1, 0, 30),
(30, 'Audit', NULL, '#fff', 2, 0, NULL),
(31, 'DSI', NULL, '#fff', 3, 0, NULL),
(32, 'NASA', NULL, '#fff', 4, 0, NULL),
(33, 'Nueva tarea 2025-07-28 15:12:13', NULL, '#fff', 5, 0, 31),
(34, 'mejorar diseño con iconos y colores', NULL, '#fc57ff', 1, 0, 14),
(35, 'poner items generales', NULL, '#f07aff', 2, 0, 14),
(36, 'Nueva tarea 2025-07-28 15:38:39', NULL, '#ff6600', 1, 0, 1),
(37, 'hacer form para guardar matriculas', NULL, '#ff6600', 0, 0, 8),
(38, 'agregar por tarea: descripcion, ascendencia de padres , etc', NULL, '#29ff54', 6, 0, 9),
(39, 'Agregar fila mejorado', NULL, '#fff700', 1, 0, 7),
(40, 'Agregar columna mejorado', NULL, '#fff700', 2, 0, 7),
(41, 'Mejorar aspecto general de todala tabla', NULL, '#fff700', 3, 0, 7),
(42, 'Flask', NULL, '#ffffff', 1, 0, 28),
(43, 'agregar Login', NULL, '#fff', 1, 0, 42),
(44, 'incorporar habilitar login', NULL, '#fff', 2, 0, 42),
(45, 'somos los primeros en dar examen', NULL, '#c20000', NULL, 0, 20),
(46, 'Tarea', NULL, '#59ff00', 1, 0, 13),
(47, 'Calendario', NULL, '#59ff00', 5, 0, 13),
(48, 'Horario', NULL, '#59ff00', 6, 0, 13),
(49, 'Nueva tarea', NULL, '#fff', 0, 0, NULL),
(50, 'Nueva tarea', NULL, '#fff', 0, 0, NULL),
(51, 'Nueva tarea', NULL, '#fff', 0, 0, NULL),
(52, 'Nueva tarea', NULL, '#fff', 0, 0, NULL),
(53, 'comprar audifonos', NULL, '#fff', 0, 0, NULL),
(54, 'Nueva tarea', NULL, '#fff', 0, 0, NULL),
(55, 'Nueva tarea', NULL, '#fff', 0, 0, NULL),
(56, 'Nueva tarea', NULL, '#fff', 0, 0, NULL),
(57, 'Nueva tarea', NULL, '#fff', 0, 0, NULL),
(58, 'Nueva tarea', NULL, '#fff', 0, 0, NULL),
(59, 'Nueva tarea', NULL, '#ffffff66', 0, 0, NULL),
(60, 'gaa', NULL, '#ffffff66', 0, 0, NULL),
(61, 'Adaptar para celular', NULL, '#ffffff33', 0, 0, NULL),
(62, 'diseño de botones', NULL, '#ffffff33', 0, 0, NULL),
(63, 'Logo en empresa', NULL, '#ffffff33', 0, 0, NULL),
(64, 'logo de empresa para Selección de empresas', NULL, '#ffffff33', 0, 0, NULL),
(65, 'Formulario para agregar camaras o quitar camaras', NULL, '#ffffff33', 0, 0, NULL),
(66, 'mejorar form de registro de persona', NULL, '#ffffff33', 0, 0, NULL),
(67, 'mejorar pagina de tabla', NULL, '#ffffff33', 0, 0, NULL),
(68, 'Revisar correcciones multiples', NULL, '#ffffff33', 0, 0, NULL),
(69, 'funciones para mover filas', NULL, '#ffffff33', 0, 1, NULL),
(70, 'crear js para mover entre celda', NULL, '#ffffff33', 0, 1, NULL),
(71, 'implementar logout', NULL, '#ffffff33', 0, 0, NULL),
(72, 'mejorar aspecto de cabeceras de filas y columnas', NULL, '#ffffff33', 0, 0, NULL),
(73, 'cambiar color de columna', NULL, '#ffffff33', 0, 1, NULL),
(74, 'cambiar color de fila', NULL, '#ffffff33', 0, 1, 7),
(75, 'cambiar color de tarea', NULL, '#ffffff33', 0, 1, NULL),
(76, 'API Tachar tareas completas', NULL, '#ffffff33', 0, 1, 7),
(77, 'api para Crud', NULL, '#ffffff33', 0, 0, NULL),
(78, 'Nueva_tarea', NULL, '#ffffff33', 0, 0, NULL),
(79, 'func agregar unidades y notas', NULL, '#ffffff33', 0, 0, NULL),
(80, 'replantear si graficos de barras de notas es con css o js', NULL, '#ffffff33', 0, 0, NULL),
(81, 'agregar datos actuales', NULL, '#ffffff66', 0, 0, NULL),
(82, 'replantear paleta de colores', NULL, '#ffffff33', 0, 1, NULL),
(83, 'implementar desplazamiento de columnas', NULL, '#ffffff33', 0, 0, NULL),
(84, 'manejar ancho de columnas', NULL, '#5289ee', 0, 0, NULL),
(85, 'manejar porcentaje exacto de varias unidades', NULL, '#1ba06e', 0, 0, NULL),
(86, 'Corroborar que fechas de semestres esté correcta', NULL, '#348096', 0, 0, NULL),
(87, 'Incorporar ancho de columna', NULL, '#994627', 0, 1, NULL),
(88, 'Subir todo a PAW', NULL, '#b74f7f', 0, 1, NULL),
(89, 'Implementar paginas anteriores', NULL, '#ff5300', 0, 0, NULL),
(90, 'agregar fila sin recargar', NULL, '#8a6b0a', 0, 0, NULL),
(91, 'Implementar enlaces anteriores', NULL, '#9a8d6e', 0, 0, NULL),
(92, 'mostrar actividad pendiente mas proxima', NULL, '#0a450a', 0, 0, NULL),
(93, 'columna bd para tipo de método', NULL, '#1ee9cf', 0, 0, NULL),
(94, 'botón Exportar pendientes en dashboard Averify', NULL, '#1ee9cf', 0, 0, 7),
(95, 'Nueva_tarea', NULL, '#5e2772', 0, 0, NULL),
(96, 'Nueva_tarea', NULL, '#35916f', 0, 0, NULL),
(97, 'mantener fijo cabeceras de columa', NULL, '#da5a5a', 0, 1, NULL),
(98, 'mantener fijo cabeceras de fila', NULL, '#da5a5a', 0, 1, NULL),
(99, 'agregar columna sin recargar', NULL, '#a2ada8', 0, 0, NULL),
(100, 'agregar opciones de usuario', NULL, '#1e8cc5', 0, 1, NULL),
(101, 'implementar login real', NULL, '#1b6451', 0, 0, NULL),
(102, 'celular: cambiar tamaño de letra', NULL, '#321575', 0, 0, NULL),
(103, 'mejorar funcion update_name para que alto y ancho se mantengan', NULL, '#2f8738', 0, 1, NULL),
(104, 'implementar desplazamiento de filas', NULL, '#3e987b', 0, 0, NULL),
(105, 'mejorar aspecto', NULL, '#98c7cd', 0, 0, NULL),
(106, 'Permitir agregar varios grupos por curso', NULL, '#98c7cd', 0, 0, NULL),
(107, 'Agregar tareas sin reiniciar la pagina', NULL, '#47cf84', 0, 0, NULL),
(108, 'Agregar Dashboard en Menu', NULL, '#064479', 0, 1, NULL),
(109, 'Definir nombre del grupo', NULL, '#71928b', 0, 0, NULL),
(110, 'Introduccion', NULL, '#f27c15', 0, 0, NULL),
(111, 'Antecedentes', NULL, '#f27c15', 0, 0, NULL),
(112, 'Objetivos', NULL, '#f27c15', 0, 0, NULL),
(113, 'Bases Teoricas', NULL, '#f27c15', 0, 0, NULL),
(114, 'Agregar estado a Tarea Hecha', NULL, '#94595e', 0, 1, NULL),
(115, 'Agregar modo a tabla si desea que se vean las tareas hechas', NULL, '#94595e', 0, 1, NULL),
(116, 'Instalar Android Studio', NULL, '#3b417e', 0, 1, NULL),
(117, 'Cuadro excel final segun el verdadero tema de tesis', NULL, '#293ac3', 0, 0, NULL),
(118, 'Crear grupo de 5', NULL, '#38876b', 0, 0, NULL),
(119, 'practicar subneteo', NULL, '#732550', 0, 0, NULL),
(120, 'cambio de colores en  el iframe', NULL, '#1b93a7', 0, 0, NULL),
(121, 'mejorar formulario', NULL, '#1b93a7', 0, 0, NULL),
(122, 'mejorar aspecto en general', NULL, '#1b93a7', 0, 0, NULL),
(123, 'Traer ya informacion de la empresa segun plantilla', NULL, '#293ac3', 0, 0, NULL),
(124, 'Mejorar aspecto de items tablas', NULL, '#1b93a7', 0, 0, NULL),
(125, 'Implementar pagina', NULL, '#0959b6', 0, 0, NULL),
(126, 'Implementar pagina', NULL, '#804280', 0, 0, NULL),
(127, 'Implementar pagina', NULL, '#804280', 0, 0, NULL),
(128, 'Implementar pagina', NULL, '#411cdd', 0, 0, NULL),
(129, 'Mejorar aspecto de descripcion y sub arbol de tareas', NULL, '#16ae7a', 0, 0, NULL),
(130, 'Incluir boton de despliegue de sub arboles', NULL, '#1b93a7', 0, 0, NULL),
(131, 'Implementar pagina', NULL, '#0959b6', 0, 0, NULL),
(132, 'Mejorar aspecto de lista de grupos', NULL, '#16ae7a', 0, 0, NULL),
(133, 'Implementar pagina', NULL, '#411cdd', 0, 0, NULL),
(134, 'Revisar que contenido posee', NULL, '#16ae7a', 0, 0, NULL),
(135, 'Implementar pagina', NULL, '#411cdd', 0, 0, NULL),
(136, 'Mejorar aspecto items matricula', NULL, '#411cdd', 0, 0, NULL),
(137, 'Implementar pagina', NULL, '#411cdd', 0, 0, NULL),
(138, 'agregar tarea sin reiniciar la pagina', NULL, '#5ec124', 0, 0, NULL),
(139, 'Boton eliminar - FIla', NULL, '#16ae7a', 0, 0, NULL),
(140, 'Boton Color - FIla', NULL, '#16ae7a', 0, 0, NULL),
(141, 'Boton Drag - FIla', NULL, '#16ae7a', 0, 0, NULL),
(142, 'Boton eliminar - Columna', NULL, '#16ae7a', 0, 0, NULL),
(143, 'Boton Color - Columna', NULL, '#16ae7a', 0, 0, NULL),
(144, 'Boton Drag - Columna', NULL, '#16ae7a', 0, 0, NULL),
(145, 'Responder a foro de Debate', NULL, '#995758', 0, 0, NULL),
(146, 'Contrargumentar a un compañero', NULL, '#995758', 0, 0, NULL),
(147, 'Contrargumentar a un compañero', NULL, '#995758', 0, 0, NULL),
(148, 'Contrargumentar a un compañero', NULL, '#995758', 0, 0, NULL),
(149, 'Mapa Mental', NULL, '#da996f', 0, 0, NULL),
(150, 'Nueva_tarea', NULL, '#83b515', 0, 0, NULL);

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
  `nro` int(11) DEFAULT NULL,
  `grupoid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `unidad`
--

INSERT INTO `unidad` (`id`, `nombre`, `porcentaje`, `nro`, `grupoid`) VALUES
(1, 'Desarrolla un sistema inteligente mediante el uso de la lógica difusa y en relación a un problema complejo propuesto.', 35.00, NULL, 2),
(2, 'Desarrolla un sistema inteligente mediante el uso de algoritmos genéticos y en relación a un problema complejo propuesto.', 30.00, NULL, 2),
(3, 'DSI 3', 35.00, NULL, 2),
(4, 'FDRD 1', 30.00, NULL, 4),
(5, 'FDRD 2', 30.00, NULL, 4),
(6, 'FDRD 3', 40.00, NULL, 4),
(7, 'ICS 1', 15.00, NULL, 3),
(8, 'ICS 2', 15.00, NULL, 3),
(9, 'ICS 3', 10.00, NULL, 3),
(10, 'ICS 4', 60.00, NULL, 3),
(11, 'IN 1', 10.00, NULL, 5),
(12, 'IN 2', 20.00, NULL, 5),
(13, 'IN 3', 35.00, NULL, 5),
(14, 'IN 4', 35.00, NULL, 5),
(15, 'IEI 1', 40.00, NULL, 7),
(16, 'IEI 2', 60.00, NULL, 7),
(17, 'MC 1', 50.00, NULL, 1),
(18, 'MC 2', 50.00, NULL, 1),
(19, 'SD 1', 40.00, NULL, 6),
(20, 'SD 2', 60.00, NULL, 6);

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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_nota`
--

CREATE TABLE `usuario_nota` (
  `usuarioid` int(11) NOT NULL,
  `notaid` int(11) NOT NULL,
  `valor` decimal(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario_nota`
--

INSERT INTO `usuario_nota` (`usuarioid`, `notaid`, `valor`) VALUES
(1, 1, 18.00),
(1, 2, 20.00),
(1, 3, 19.00),
(1, 4, 19.00),
(1, 5, 19.00),
(1, 6, 20.00),
(1, 7, 17.00),
(1, 8, 16.50),
(1, 9, 18.00),
(1, 10, 11.50),
(1, 11, 6.00),
(1, 12, 17.00),
(1, 13, 18.00),
(1, 14, 17.00),
(1, 15, 15.00),
(1, 16, 16.00),
(1, 17, 11.50),
(1, 18, 20.00),
(1, 19, 18.00),
(1, 20, 18.00),
(1, 21, 19.00),
(1, 22, 17.00),
(1, 23, 19.00),
(1, 24, 19.00),
(1, 25, 20.00),
(1, 26, 20.00),
(1, 27, 20.00),
(1, 28, 20.00),
(1, 29, 14.00),
(1, 30, 19.00),
(1, 31, 18.00),
(1, 32, 19.00),
(1, 33, 14.00),
(1, 34, 17.50),
(1, 35, 15.25),
(1, 36, 17.50),
(1, 37, 14.00),
(1, 38, 18.00),
(1, 39, 18.00),
(1, 40, 18.00),
(1, 41, 18.00),
(1, 42, 19.00),
(1, 43, 19.00),
(1, 44, 20.00),
(1, 45, 20.00),
(1, 46, 20.00),
(1, 47, 20.00),
(1, 48, 20.00);

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
-- Indices de la tabla `paleta`
--
ALTER TABLE `paleta`
  ADD PRIMARY KEY (`id`);

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
-- Indices de la tabla `sistema`
--
ALTER TABLE `sistema`
  ADD PRIMARY KEY (`id`);

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
-- Indices de la tabla `usuario_nota`
--
ALTER TABLE `usuario_nota`
  ADD PRIMARY KEY (`usuarioid`,`notaid`),
  ADD KEY `FKusuario_no696390` (`notaid`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT de la tabla `curso`
--
ALTER TABLE `curso`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

--
-- AUTO_INCREMENT de la tabla `docente`
--
ALTER TABLE `docente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT de la tabla `grupo`
--
ALTER TABLE `grupo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT de la tabla `horario_actividad`
--
ALTER TABLE `horario_actividad`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `horario_grupo`
--
ALTER TABLE `horario_grupo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=95;

--
-- AUTO_INCREMENT de la tabla `lista`
--
ALTER TABLE `lista`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `matricula`
--
ALTER TABLE `matricula`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `nota`
--
ALTER TABLE `nota`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT de la tabla `paleta`
--
ALTER TABLE `paleta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `sistema`
--
ALTER TABLE `sistema`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=151;

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

--
-- Filtros para la tabla `usuario_nota`
--
ALTER TABLE `usuario_nota`
  ADD CONSTRAINT `FKusuario_no696390` FOREIGN KEY (`notaid`) REFERENCES `nota` (`id`),
  ADD CONSTRAINT `FKusuario_no984737` FOREIGN KEY (`usuarioid`) REFERENCES `usuario` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
