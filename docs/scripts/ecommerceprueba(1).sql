-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 18-04-2024 a las 05:35:51
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `ecommerceprueba`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bitacora`
--

create DATABASE ecommercePrueba;

use ecommercePrueba;


CREATE TABLE `bitacora` (
  `bitacoracod` int(11) NOT NULL,
  `bitacorafch` datetime DEFAULT NULL,
  `bitprograma` varchar(255) DEFAULT NULL,
  `bitdescripcion` varchar(255) DEFAULT NULL,
  `bitobservacion` mediumtext DEFAULT NULL,
  `bitTipo` char(3) DEFAULT NULL,
  `bitusuario` bigint(18) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carretilla`
--

CREATE TABLE `carretilla` (
  `usercod` bigint(10) NOT NULL,
  `libroId` int(11) NOT NULL,
  `crrctd` int(5) NOT NULL,
  `crrprc` decimal(12,2) NOT NULL,
  `crrfching` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carretillaanon`
--

CREATE TABLE `carretillaanon` (
  `anoncod` varchar(128) NOT NULL,
  `libroId` int(11) NOT NULL,
  `crrctd` int(5) NOT NULL,
  `crrprc` decimal(12,2) NOT NULL,
  `crrfching` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `categoria_id` int(11) NOT NULL,
  `categoria_nombre` varchar(128) NOT NULL,
  `create_time` datetime DEFAULT current_timestamp(),
  `update_time` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`categoria_id`, `categoria_nombre`, `create_time`, `update_time`) VALUES
(1, 'Autoayuda', '2024-04-14 02:15:29', '2024-04-14 02:15:29');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `funciones`
--

CREATE TABLE `funciones` (
  `fncod` varchar(255) NOT NULL,
  `fndsc` varchar(255) DEFAULT NULL,
  `fnest` char(3) DEFAULT NULL,
  `fntyp` char(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `funciones`
--

INSERT INTO `funciones` (`fncod`, `fndsc`, `fnest`, `fntyp`) VALUES
('Controllers\\Checkout\\Catalogo', 'Controllers\\Checkout\\Catalogo', 'ACT', 'CTR'),
('Controllers\\Products\\CategoriesList', 'Controllers\\Products\\CategoriesList', 'ACT', 'CTR'),
('Controllers\\Products\\CategoryForm', 'Controllers\\Products\\CategoryForm', 'ACT', 'CTR'),
('Libros_Catalogo', 'Libros_Catalogo', 'ACT', 'MNU'),
('Libros_CatalogoP', 'Libros_CatalogoP', 'ACT', 'MNU'),
('Menu_CategoriesList', 'Menu_CategoriesList', 'ACT', 'MNU'),
('Menu_PaymentCheckout', 'Menu_PaymentCheckout', 'ACT', 'MNU');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `funciones_roles`
--

CREATE TABLE `funciones_roles` (
  `rolescod` varchar(128) NOT NULL,
  `fncod` varchar(255) NOT NULL,
  `fnrolest` char(3) DEFAULT NULL,
  `fnexp` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libros`
--

CREATE TABLE `libros` (
  `libroId` int(11) NOT NULL,
  `libroNombre` varchar(255) NOT NULL,
  `libroDescripcion` varchar(255) NOT NULL,
  `libroPrecio` decimal(10,2) NOT NULL,
  `libroImgUrl` varchar(255) NOT NULL,
  `libroStock` int(11) NOT NULL DEFAULT 0,
  `libroStatus` char(3) NOT NULL,
  `categoriaId` int(11) NOT NULL,
  `libroAutor` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `libros`
--

INSERT INTO `libros` (`libroId`, `libroNombre`, `libroDescripcion`, `libroPrecio`, `libroImgUrl`, `libroStock`, `libroStatus`, `categoriaId`, `libroAutor`) VALUES
(12, 'EL sutil arte de que te importe un carajo', 'Libro sobre autoayuda', 600.00, '236f45dd06101ed75dedb574c8a8e686.jpg', 30, 'ACT', 1, 'Mark Manson'),
(14, 'Aquiles en tiktok', 'AutoAyuda', 500.00, '5039cbbf56e7e19715348e4926355bb1.png', 20, 'ACT', 1, 'Eduardo Infante'),
(15, 'Bajo la misma estrella', 'Bajo la misma estrella', 300.00, 'caa1b5207d4c27d9873bfe5e834b506e.png', 20, 'ACT', 1, 'Marcela'),
(17, 'Deja de ser tu', 'Libro sobre autoayuda', 500.00, '582ec213acd22c2d1b6b22f8aadd3dd4.png', 20, 'ACT', 1, 'Joe Dizpensa');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ordenes`
--

CREATE TABLE `ordenes` (
  `orderId` varchar(255) NOT NULL,
  `usercod` bigint(20) DEFAULT NULL,
  `total` float DEFAULT NULL,
  `fechaOrden` datetime DEFAULT current_timestamp(),
  `estatus` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `ordenes`
--

INSERT INTO `ordenes` (`orderId`, `usercod`, `total`, `fechaOrden`, `estatus`) VALUES
('10867861AD8143609', 2, 1845, '2024-04-15 12:57:47', 'COMPLETED'),
('12001', 1, 120, '2024-04-15 00:00:00', NULL),
('27375078LB741713W', 1, 2675, '2024-04-15 00:00:00', 'COMPLETED'),
('2UB86520XJ671334J', 2, 1845, '2024-04-15 14:47:10', 'COMPLETED'),
('3ES99362EF746984M', 2, 1845, '2024-04-15 12:52:23', 'COMPLETED'),
('4XY93653R2140850A', 1, 1245, '2024-04-15 12:37:02', 'COMPLETED'),
('5', 1, 1845, '2024-04-15 00:00:00', 'COMPLETED'),
('6A577922TC5628223', 2, 1845, '2024-04-15 12:56:40', 'COMPLETED'),
('6NU45855310853345', 2, 3090, '2024-04-15 12:55:58', 'COMPLETED'),
('7VY44952Y1607114U', 1, 1230, '2024-04-15 15:13:00', 'COMPLETED'),
('7YU85393FN256853X', 2, 1845, '2024-04-15 21:16:51', 'COMPLETED'),
('93K51795VV4372241', 2, 1845, '2024-04-15 12:38:45', 'COMPLETED');

--
-- Disparadores `ordenes`
--
DELIMITER $$
CREATE TRIGGER `completedOrder` AFTER INSERT ON `ordenes` FOR EACH ROW BEGIN
    DELETE FROM carretilla WHERE usercod = NEW.usercod;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `rolescod` varchar(128) NOT NULL,
  `rolesdsc` varchar(45) DEFAULT NULL,
  `rolesest` char(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles_usuarios`
--

CREATE TABLE `roles_usuarios` (
  `usercod` bigint(10) NOT NULL,
  `rolescod` varchar(128) NOT NULL,
  `roleuserest` char(3) DEFAULT NULL,
  `roleuserfch` datetime DEFAULT NULL,
  `roleuserexp` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `usercod` bigint(10) NOT NULL,
  `useremail` varchar(80) DEFAULT NULL,
  `username` varchar(80) DEFAULT NULL,
  `userpswd` varchar(128) DEFAULT NULL,
  `userfching` datetime DEFAULT NULL,
  `userpswdest` char(3) DEFAULT NULL,
  `userpswdexp` datetime DEFAULT NULL,
  `userest` char(3) DEFAULT NULL,
  `useractcod` varchar(128) DEFAULT NULL,
  `userpswdchg` varchar(128) DEFAULT NULL,
  `usertipo` char(3) DEFAULT NULL COMMENT 'Tipo de Usuario, Normal, Consultor o Cliente'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`usercod`, `useremail`, `username`, `userpswd`, `userfching`, `userpswdest`, `userpswdexp`, `userest`, `useractcod`, `userpswdchg`, `usertipo`) VALUES
(1, 'josos@gmail.com', 'John Doe', '$2y$10$l4qSVC2bHqGwOSw45up8A.uTUOhYDgHzE1Zpx1CaNsnv8pAj3H2eC', '2024-04-14 00:39:28', 'ACT', '2024-07-13 00:00:00', 'ACT', 'ed9236eaefd0cf05920c9b24f02b1489341a2b011100ecae92d5e7bdce8ec6d5', '2024-04-14 00:39:28', 'PBL'),
(2, 'josos1@gmail.com', 'John Doe', '$2y$10$pHbTXTaPUjoUAR4ZpFd2.u500T9oV/S8VhPjKVyB4axND8gmBBeEG', '2024-04-15 12:33:16', 'ACT', '2024-07-14 00:00:00', 'ACT', '511429aca94758bf733cda1c8c682fce1874aa5cf9d0c97efc79375dc96af00a', '2024-04-15 12:33:16', 'PBL');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `bitacora`
--
ALTER TABLE `bitacora`
  ADD PRIMARY KEY (`bitacoracod`);

--
-- Indices de la tabla `carretilla`
--
ALTER TABLE `carretilla`
  ADD PRIMARY KEY (`usercod`,`libroId`),
  ADD KEY `librotId_idx` (`libroId`);

--
-- Indices de la tabla `carretillaanon`
--
ALTER TABLE `carretillaanon`
  ADD PRIMARY KEY (`anoncod`,`libroId`),
  ADD KEY `libroId_idx` (`libroId`);

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`categoria_id`);

--
-- Indices de la tabla `funciones`
--
ALTER TABLE `funciones`
  ADD PRIMARY KEY (`fncod`);

--
-- Indices de la tabla `funciones_roles`
--
ALTER TABLE `funciones_roles`
  ADD PRIMARY KEY (`rolescod`,`fncod`),
  ADD KEY `rol_funcion_key_idx` (`fncod`);

--
-- Indices de la tabla `libros`
--
ALTER TABLE `libros`
  ADD PRIMARY KEY (`libroId`),
  ADD KEY `categoriaId` (`categoriaId`);

--
-- Indices de la tabla `ordenes`
--
ALTER TABLE `ordenes`
  ADD PRIMARY KEY (`orderId`),
  ADD KEY `usercod___fk` (`usercod`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`rolescod`);

--
-- Indices de la tabla `roles_usuarios`
--
ALTER TABLE `roles_usuarios`
  ADD PRIMARY KEY (`usercod`,`rolescod`),
  ADD KEY `rol_usuario_key_idx` (`rolescod`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`usercod`),
  ADD UNIQUE KEY `useremail_UNIQUE` (`useremail`),
  ADD KEY `usertipo` (`usertipo`,`useremail`,`usercod`,`userest`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `bitacora`
--
ALTER TABLE `bitacora`
  MODIFY `bitacoracod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `categoria_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `libros`
--
ALTER TABLE `libros`
  MODIFY `libroId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `usercod` bigint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `carretilla`
--
ALTER TABLE `carretilla`
  ADD CONSTRAINT `carretilla_prd_key` FOREIGN KEY (`libroId`) REFERENCES `libros` (`libroId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `carretilla_user_key` FOREIGN KEY (`usercod`) REFERENCES `usuario` (`usercod`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `carretillaanon`
--
ALTER TABLE `carretillaanon`
  ADD CONSTRAINT `carretillaanon_prd_key` FOREIGN KEY (`libroId`) REFERENCES `libros` (`libroId`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `funciones_roles`
--
ALTER TABLE `funciones_roles`
  ADD CONSTRAINT `funcion_rol_key` FOREIGN KEY (`rolescod`) REFERENCES `roles` (`rolescod`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `rol_funcion_key` FOREIGN KEY (`fncod`) REFERENCES `funciones` (`fncod`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `libros`
--
ALTER TABLE `libros`
  ADD CONSTRAINT `libros_ibfk_1` FOREIGN KEY (`categoriaId`) REFERENCES `categorias` (`categoria_id`);

--
-- Filtros para la tabla `ordenes`
--
ALTER TABLE `ordenes`
  ADD CONSTRAINT `usercod___fk` FOREIGN KEY (`usercod`) REFERENCES `usuario` (`usercod`);

--
-- Filtros para la tabla `roles_usuarios`
--
ALTER TABLE `roles_usuarios`
  ADD CONSTRAINT `rol_usuario_key` FOREIGN KEY (`rolescod`) REFERENCES `roles` (`rolescod`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `usuario_rol_key` FOREIGN KEY (`usercod`) REFERENCES `usuario` (`usercod`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
