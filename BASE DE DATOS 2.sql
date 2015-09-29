-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 29-09-2015 a las 21:25:01
-- Versión del servidor: 5.6.21
-- Versión de PHP: 5.5.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `servicio`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registry`
--

CREATE TABLE IF NOT EXISTS `registry` (
`id` int(10) unsigned NOT NULL,
  `cause` text NOT NULL,
  `period_begin` datetime NOT NULL,
  `period_end` datetime DEFAULT NULL,
  `recuperation` text,
  `type_registry_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `registry`
--

INSERT INTO `registry` (`id`, `cause`, `period_begin`, `period_end`, `recuperation`, `type_registry_id`, `user_id`) VALUES
(1, 'sdf', '2015-08-05 12:00:00', NULL, 'dsa', 1, 1),
(2, 'dfas', '2015-09-24 04:08:00', NULL, 'adf', 1, 1),
(3, 'ffafda', '2015-09-24 04:09:00', NULL, 'bas', 1, 1),
(4, 'blabla', '2015-08-13 12:08:00', NULL, '', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `type_registry`
--

CREATE TABLE IF NOT EXISTS `type_registry` (
`id` int(10) unsigned NOT NULL,
  `name` varchar(45) NOT NULL,
  `description` varchar(175) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `type_registry`
--

INSERT INTO `type_registry` (`id`, `name`, `description`) VALUES
(1, 'Justificante', 'Tipo de registro para realizar justificaciones');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE IF NOT EXISTS `user` (
`id` int(10) unsigned NOT NULL,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `username` varchar(45) NOT NULL,
  `password_hash` varchar(128) NOT NULL,
  `auth_key` varchar(128) DEFAULT NULL,
  `access_token` varchar(128) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`id`, `first_name`, `last_name`, `email`, `username`, `password_hash`, `auth_key`, `access_token`) VALUES
(1, 'Alfonso', 'de Alba', 'alfonso@blabla.com', 'Alf', '$2y$13$BNuZIqxyAOWZY3STYlS7lesuX3GzeG3ZwiQldpGJrO.UNzKbV/fom', NULL, NULL),
(2, 'Rodrigo', 'Esparza', 'rodrigo.esparza@uady.com', 'Rod', '$2y$13$3guVhoN4eOG0.0hxFcXpfedRFNwhRdAqeA4RRZDmuVN9AYW.4aemG', 'c4SN0qIEPpV-5FR6Qz8xojj6kEySMSix', 'CcZMZZDdUa5Hd99CO82SlQdZ8dNa-AUb'),
(3, 'admin', 'admin', 'admin@example.org', 'admin', '$2y$13$ye3I0YNVKnRSUDsGxxqh6u0IXODiyOrK4fFL/bJLbIzgHR5DRJNIC', 'xVORdWd_SzC_WksuGduQomyEsCdmiG-R', 'ARIGuL7JYjl7cpPTjb5qhJ61d-d_rkv2'),
(4, 'pp', 'pp', 'pp@pp.com', 'pepe', '$2y$13$W5WOIGNcJbX4mP2F.zGX4eveehLneUl0jv/WMPCV1ANPXrrzmKZX2', 'VnrzP5QzL09h4FpTFmNgfj0ywkh4GoJW', 'FO-iZcCKypGUruExsuMJFTlvJ8fQWOGC');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `registry`
--
ALTER TABLE `registry`
 ADD PRIMARY KEY (`id`), ADD KEY `fk_registry_type_registry1_idx` (`type_registry_id`), ADD KEY `fk_registry_user1_idx` (`user_id`);

--
-- Indices de la tabla `type_registry`
--
ALTER TABLE `type_registry`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `idTypeRegistry_UNIQUE` (`id`), ADD UNIQUE KEY `type_registry_description_UNIQUE` (`description`);

--
-- Indices de la tabla `user`
--
ALTER TABLE `user`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `Email_UNIQUE` (`email`), ADD UNIQUE KEY `UserName_UNIQUE` (`username`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `registry`
--
ALTER TABLE `registry`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `type_registry`
--
ALTER TABLE `type_registry`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `user`
--
ALTER TABLE `user`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `registry`
--
ALTER TABLE `registry`
ADD CONSTRAINT `fk_registry_type_registry1` FOREIGN KEY (`type_registry_id`) REFERENCES `type_registry` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_registry_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
