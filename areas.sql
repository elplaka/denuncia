-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 05-05-2022 a las 00:32:28
-- Versión del servidor: 10.4.22-MariaDB
-- Versión de PHP: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `sed`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `areas`
--

CREATE TABLE `areas` (
  `cve_area` int(10) UNSIGNED NOT NULL,
  `area` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `areas`
--

INSERT INTO `areas` (`cve_area`, `area`, `created_at`, `updated_at`) VALUES
(1, 'CENTRO DE ARTES Y OFICIOS', '2022-04-14 17:02:34', '2022-04-14 17:02:34'),
(2, 'DESARROLLO SOCIAL', '2022-04-14 17:02:50', '2022-04-14 17:02:50'),
(3, 'DEPORTES', '2022-04-14 17:03:03', '2022-04-14 17:03:03'),
(4, 'PRESIDENCIA', '2022-04-14 17:03:15', '2022-04-14 17:03:15'),
(5, 'OBRAS PÚBLICAS', '2022-04-14 17:03:26', '2022-04-14 17:03:26'),
(6, 'SERVICIOS PÚBLICOS', '2022-04-14 17:01:52', '2022-04-14 17:01:52'),
(7, 'SEGURIDAD PÚBLICA', '2022-04-26 01:17:09', '2022-04-26 01:17:09'),
(8, 'SECRETARÍA DEL AYUNTAMIENTO', '2022-04-26 01:16:11', '2022-04-26 01:16:11'),
(9, 'OFICIALÍA MAYOR', '2022-04-26 01:17:53', '2022-04-26 01:17:53'),
(10, 'DESARROLLO RURAL', '2022-04-26 01:18:29', '2022-04-26 01:18:29'),
(11, 'TRANSPARENCIA Y ACCESO A LA INF.', '2022-04-26 01:19:06', '2022-04-26 01:19:06'),
(12, 'ECOLOGÍA', '2022-04-26 01:20:16', '2022-04-26 01:20:16'),
(13, 'EDUCACIÓN', '2022-04-26 01:21:06', '2022-04-26 01:21:06'),
(14, 'COMMUJER', '2022-04-26 01:21:29', '2022-04-26 01:21:29'),
(15, 'SÍNDICO PROCURADOR', '2022-04-26 01:22:29', '2022-04-26 01:22:29'),
(16, 'ÓRGANO INTERNO DE CONTROL', '2022-04-26 01:22:44', '2022-04-26 01:22:44'),
(17, 'TESORERÍA', '2022-04-26 01:23:09', '2022-04-26 01:23:09'),
(18, 'ARCHIVO Y CRÓNICA', '2022-04-26 01:24:09', '2022-04-26 01:24:09'),
(19, 'DESARROLLO ECONÓMICO', '2022-04-26 01:24:54', '2022-04-26 01:24:54'),
(20, 'REGIDORES', '2022-04-26 01:25:54', '2022-04-26 01:25:54'),
(21, 'COMUNICACIÓN SOCIAL', '2022-04-26 01:26:19', '2022-04-26 01:26:19'),
(22, 'TURISMO', '2022-04-26 01:27:32', '2022-04-26 01:27:32'),
(23, 'RECURSOS HUMANOS', '2022-04-26 01:28:28', '2022-04-26 01:28:28'),
(24, 'JUVENTUD', '2022-04-26 01:29:33', '2022-04-26 01:29:33'),
(25, 'TECNOLOGÍAS DE LA INFORMACIÓN', '2022-04-26 01:29:47', '2022-04-26 01:29:47');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `areas`
--
ALTER TABLE `areas`
  ADD PRIMARY KEY (`cve_area`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `areas`
--
ALTER TABLE `areas`
  MODIFY `cve_area` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;