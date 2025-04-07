-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 30-03-2025 a las 18:52:37
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

--
-- Base de datos: `bd_proyecto`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contexto`
--

CREATE TABLE `contexto` (
  `id` int(11) NOT NULL,
  `nombre` varchar(150) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `color` varchar(50) DEFAULT NULL,
  `icono` varchar(150) DEFAULT NULL,
  `img` longblob DEFAULT NULL,
  `letras` varchar(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `contexto`
--

INSERT INTO `contexto` (`id`, `nombre`, `descripcion`, `color`, `icono`, `img`, `letras`) VALUES
(1, 'DESARROLLO DE SISTEMAS INTELIGENTES', NULL, '#d1751877', NULL, NULL, 'DSI'),
(2, 'FUNDAMENTOS Y DISEÑO DE REDES DE DATOS', NULL, '#ff2f2f77', NULL, NULL, 'FDR'),
(3, 'INGENIERÍA Y CALIDAD DE SOFTWARE', NULL, '#2fa8ff77', NULL, NULL, 'ICS'),
(4, 'INTELIGENCIA DE NEGOCIOS', NULL, '#467291b8', NULL, NULL, 'IN'),
(5, 'INVESTIGACION EN INGENIERÍA', NULL, '#ffff2180', NULL, NULL, 'IEI'),
(6, 'MORAL CATOLICA', NULL, '#8a19cc77', NULL, NULL, 'MC'),
(7, 'SISTEMAS DISTRIBUIDOS', NULL, '#19a01777', NULL, NULL, 'SD'),
(8, 'FUTSAL', NULL, '#00000077', NULL, NULL, 'FUT'),
(9, 'INGLÉS B1', NULL, '#fe2cb363', NULL, NULL, 'ING'),
(10, 'AUDIT', NULL, '#00008b77', NULL, NULL, 'AUD'),
(17, 'PROYECTO', NULL, '#8700fc', NULL, NULL, 'PRJCT');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `curso`
--

CREATE TABLE `curso` (
  `id` int(11) NOT NULL,
  `nombre` text NOT NULL,
  `creditos` int(11) NOT NULL,
  `ciclo` int(11) NOT NULL,
  `color` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `curso`
--

INSERT INTO `curso` (`id`, `nombre`, `creditos`, `ciclo`, `color`) VALUES
(1, 'DESARROLLO DE SISTEMAS INTELIGENTES', 2, 7, '#d16500'),
(2, 'FUNDAMENTOS Y DISEÑO DE REDES DE DATOS', 3, 7, '#ff2f2f'),
(3, 'INGENIERÍA Y CALIDAD DE SOFTWARE', 4, 7, '#27a5ff'),
(4, 'INTELIGENCIA DE NEGOCIOS', 3, 7, '#46759d'),
(5, 'INVESTIGACIÓN EN INGENIERÍA', 3, 7, '#ffcf01'),
(6, 'MORAL CATÓLICA', 3, 7, '#8a19cc'),
(7, 'SISTEMAS DISTRIBUIDOS', 3, 7, '#19a017');

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
  `contextoid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `horario`
--

INSERT INTO `horario` (`id`, `titulo`, `descripcion`, `dia`, `h_ini`, `min_ini`, `h_fin`, `min_fin`, `fecha_ini`, `fecha_fin`, `contextoid`) VALUES
(1, NULL, NULL, 6, 7, 0, 11, 0, '2025-03-17', '2025-07-05', 1),
(2, NULL, NULL, 2, 9, 0, 11, 0, '2025-03-17', '2025-07-05', 2),
(3, NULL, NULL, 3, 7, 0, 10, 0, '2025-03-17', '2025-07-05', 2),
(4, NULL, NULL, 2, 11, 0, 14, 0, '2025-03-17', '2025-07-05', 3),
(5, NULL, NULL, 4, 7, 0, 10, 0, '2025-03-17', '2025-07-05', 3),
(6, NULL, NULL, 5, 10, 0, 13, 0, '2025-03-17', '2025-07-05', 4),
(7, NULL, NULL, 6, 11, 0, 13, 0, '2025-03-17', '2025-07-05', 4),
(8, NULL, NULL, 4, 14, 0, 19, 0, '2025-03-17', '2025-07-05', 5),
(9, NULL, NULL, 1, 16, 0, 19, 0, '2025-03-17', '2025-07-05', 6),
(10, NULL, NULL, 4, 10, 0, 12, 0, '2025-03-17', '2025-07-05', 7),
(11, NULL, NULL, 5, 7, 0, 10, 0, '2025-03-17', '2025-07-05', 7),
(12, NULL, NULL, 3, 15, 0, 17, 0, '2025-03-17', '2025-07-05', 8),
(13, NULL, NULL, 2, 19, 0, 21, 0, '2025-03-17', '2025-07-05', 9),
(14, NULL, NULL, 4, 19, 0, 21, 0, '2025-03-17', '2025-07-05', 9),
(15, NULL, NULL, 1, 21, 0, 22, 0, '2025-03-17', '2025-07-05', 10),
(16, NULL, NULL, 3, 10, 0, 12, 0, '2025-03-17', '2025-07-05', 10),
(18, 'Bordes de tabla', NULL, 6, 0, 0, 2, 0, '2025-03-21', '2025-03-21', 10),
(19, 'Comprar Audifonos', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(20, 'Descargar Invincible', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(21, NULL, NULL, 6, 16, 0, 18, 0, '2025-03-17', '2025-07-05', 17),
(22, NULL, NULL, 1, 8, 0, 12, 0, '2025-03-17', '2025-07-05', 17);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nota`
--

CREATE TABLE `nota` (
  `id` int(11) NOT NULL,
  `nombre` text DEFAULT NULL,
  `porcentaje` decimal(5,2) NOT NULL,
  `valor` decimal(5,2) NOT NULL,
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
(5, 'DSI 3 1', 30.00, 20.00, 3),
(6, 'DSI 3 2', 70.00, 20.00, 3),
(7, 'FDRD 1 1', 20.00, 20.00, 4),
(8, 'FDRD 1 2', 20.00, 20.00, 4),
(9, 'FDRD 1 3', 20.00, 20.00, 4),
(10, 'FDRD 1 4', 40.00, 20.00, 4),
(11, 'FDRD 2 1', 50.00, 20.00, 5),
(12, 'FDRD 2 2', 25.00, 20.00, 5),
(13, 'FDRD 2 3', 25.00, 20.00, 5),
(14, 'FDRD 3 1', 15.00, 0.00, 6),
(15, 'FDRD 3 2', 15.00, 0.00, 6),
(16, 'FDRD 3 3', 30.00, 0.00, 6),
(17, 'FDRD 3 4', 40.00, 0.00, 6),
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
(29, '', 100.00, 20.00, 12),
(30, '', 100.00, 0.00, 13),
(31, '', 50.00, 0.00, 14),
(32, '', 50.00, 0.00, 14),
(33, '', 50.00, 0.00, 15),
(34, '', 50.00, 0.00, 15),
(35, '', 100.00, 3.30, 16),
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
-- Estructura de tabla para la tabla `unidad`
--

CREATE TABLE `unidad` (
  `id` int(11) NOT NULL,
  `nombre` text DEFAULT NULL,
  `porcentaje` decimal(5,2) NOT NULL,
  `cursoid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `unidad`
--

INSERT INTO `unidad` (`id`, `nombre`, `porcentaje`, `cursoid`) VALUES
(1, 'DSI 1', 35.00, 1),
(2, 'DSI 2', 30.00, 1),
(3, 'DSI 3', 35.00, 1),
(4, 'FDRD 1', 30.00, 2),
(5, 'FDRD 2', 30.00, 2),
(6, 'FDRD 3', 40.00, 2),
(7, 'ICS 1', 15.00, 3),
(8, 'ICS 2', 15.00, 3),
(9, 'ICS 3', 10.00, 3),
(10, 'ICS 4', 60.00, 3),
(11, 'IN 1', 10.00, 4),
(12, 'IN 2', 20.00, 4),
(13, 'IN 3', 35.00, 4),
(14, 'IN 4', 35.00, 4),
(15, 'IEI 1', 40.00, 5),
(16, 'IEI 2', 60.00, 5),
(17, 'MC 1', 50.00, 6),
(18, 'MC 2', 50.00, 6),
(19, 'SD 1', 40.00, 7),
(20, 'SD 2', 60.00, 7);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `contexto`
--
ALTER TABLE `contexto`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `curso`
--
ALTER TABLE `curso`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `horario`
--
ALTER TABLE `horario`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKhorario716731` (`contextoid`);

--
-- Indices de la tabla `nota`
--
ALTER TABLE `nota`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKnota214246` (`unidadid`);

--
-- Indices de la tabla `unidad`
--
ALTER TABLE `unidad`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKunidad468290` (`cursoid`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `contexto`
--
ALTER TABLE `contexto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `curso`
--
ALTER TABLE `curso`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `horario`
--
ALTER TABLE `horario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de la tabla `nota`
--
ALTER TABLE `nota`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT de la tabla `unidad`
--
ALTER TABLE `unidad`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=235;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `horario`
--
ALTER TABLE `horario`
  ADD CONSTRAINT `FKhorario716731` FOREIGN KEY (`contextoid`) REFERENCES `contexto` (`id`);

--
-- Filtros para la tabla `nota`
--
ALTER TABLE `nota`
  ADD CONSTRAINT `FKnota214246` FOREIGN KEY (`unidadid`) REFERENCES `unidad` (`id`);

--
-- Filtros para la tabla `unidad`
--
ALTER TABLE `unidad`
  ADD CONSTRAINT `FKunidad468290` FOREIGN KEY (`cursoid`) REFERENCES `curso` (`id`);
COMMIT;
