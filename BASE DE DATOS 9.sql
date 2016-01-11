-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 11-01-2016 a las 16:40:06
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
-- Estructura de tabla para la tabla `auth_assignment`
--

CREATE TABLE IF NOT EXISTS `auth_assignment` (
  `item_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `auth_assignment`
--

INSERT INTO `auth_assignment` (`item_name`, `user_id`, `created_at`) VALUES
('Administrator', '1', 1446123328),
('Administrator', '3', 1447875716),
('Dirección General', '8', 1450217329),
('Empleado', '6', 1450217257),
('Secretaria Administrativa', '7', 1450217320);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_item`
--

CREATE TABLE IF NOT EXISTS `auth_item` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `type` int(11) NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `rule_name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` text COLLATE utf8_unicode_ci,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `auth_item`
--

INSERT INTO `auth_item` (`name`, `type`, `description`, `rule_name`, `data`, `created_at`, `updated_at`) VALUES
('Administrator', 1, 'Administrador del sistema', NULL, NULL, 1446123328, 1448620821),
('CreateRegistries', 2, 'The user can create and post registries', NULL, NULL, 1448997303, 1448997917),
('Dirección General', 1, 'Dirección General', NULL, NULL, 1448620931, 1448620931),
('Empleado', 1, 'Empleado común.', NULL, NULL, 1448620957, 1448620957),
('RegisterComitions', 2, 'The user can register the comitions from any user.', NULL, NULL, 1448998308, 1448998308),
('RegisterDisabilities', 2, 'The user can register the request of a disabilitie from any user.', NULL, NULL, 1448998058, 1448998058),
('RegisterEconomicDays', 2, 'The user can register the request of an economic day from any user.', NULL, NULL, 1448997736, 1448997736),
('Secretaria Administrativa', 1, 'Secretaria Admin', NULL, NULL, 1447875856, 1447875856),
('ViewComitionsOfAllUsers', 2, 'The user can see the comitions of all users of the system.', NULL, NULL, 1448998253, 1448998253),
('ViewDisabilitiesOfAllUsers', 2, 'The user can see the disabilities of all users of the system.', NULL, NULL, 1448997972, 1448997972),
('ViewEconomicDaysOfAllUsers', 2, 'The user can see the economic days of all users of the system.', NULL, NULL, 1448997607, 1448998002),
('ViewOwnRegistries', 2, 'The user can see his own registries.', NULL, NULL, 1448995825, 1448997886);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_item_child`
--

CREATE TABLE IF NOT EXISTS `auth_item_child` (
  `parent` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `child` varchar(64) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `auth_item_child`
--

INSERT INTO `auth_item_child` (`parent`, `child`) VALUES
('Empleado', 'CreateRegistries'),
('Administrator', 'Dirección General'),
('Administrator', 'Empleado'),
('Dirección General', 'Empleado'),
('Secretaria Administrativa', 'Empleado'),
('Secretaria Administrativa', 'RegisterComitions'),
('Dirección General', 'RegisterDisabilities'),
('Dirección General', 'RegisterEconomicDays'),
('Administrator', 'Secretaria Administrativa'),
('Secretaria Administrativa', 'ViewComitionsOfAllUsers'),
('Dirección General', 'ViewDisabilitiesOfAllUsers'),
('Dirección General', 'ViewEconomicDaysOfAllUsers'),
('Empleado', 'ViewOwnRegistries');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_rule`
--

CREATE TABLE IF NOT EXISTS `auth_rule` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `data` text COLLATE utf8_unicode_ci,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migration`
--

CREATE TABLE IF NOT EXISTS `migration` (
  `version` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `apply_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `migration`
--

INSERT INTO `migration` (`version`, `apply_time`) VALUES
('m000000_000000_base', 1444586517),
('m140506_102106_rbac_init', 1444586523);

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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `registry`
--

INSERT INTO `registry` (`id`, `cause`, `period_begin`, `period_end`, `recuperation`, `type_registry_id`, `user_id`) VALUES
(1, 'sdf', '2015-08-05 12:00:00', NULL, 'dsa', 1, 1),
(2, 'dfas', '2015-09-24 04:08:00', NULL, 'adf', 1, 1),
(3, 'ffafda', '2015-09-24 04:09:00', NULL, 'bas', 1, 1),
(4, 'blabla', '2015-08-13 12:08:00', NULL, '', 1, 4),
(5, 'baf', '2015-12-16 00:00:00', '2015-12-18 00:00:00', 'saf', 1, 1),
(6, 'Bla Bla bl', '2015-12-17 00:00:00', '2015-12-19 00:00:00', 'Bla bla bla', 1, 1),
(7, 'blabla', '2015-12-17 00:00:00', '2015-12-19 00:00:00', '', 2, 2),
(8, 'vvcxzv', '2015-12-10 00:00:00', '2015-12-18 00:00:00', 'cvzx', 2, 4),
(9, 'bdzf', '2016-01-30 12:00:00', '2016-02-01 12:00:00', 'asdf', 2, 3),
(10, 'Alf', '2015-12-17 00:00:00', '2015-12-20 00:00:00', 'sfa', 1, 6),
(11, 'asdfas', '2015-12-17 00:00:00', '2015-12-19 00:00:00', 'asdf', 2, 4),
(12, 'vsdf', '2015-12-16 00:00:00', '2015-12-19 00:00:00', 'saf', 3, 4),
(13, 'dsfa', '2015-12-17 00:00:00', '2015-12-19 00:00:00', 'fsda', 1, 6),
(14, 'ffsaf', '2015-12-26 00:00:00', '2015-12-27 00:00:00', 'afsda', 4, 5),
(15, 'asdf', '2015-12-09 00:00:00', '2015-12-19 00:00:00', 'asdf', 2, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `type_registry`
--

CREATE TABLE IF NOT EXISTS `type_registry` (
`id` int(10) unsigned NOT NULL,
  `name` varchar(45) NOT NULL,
  `description` varchar(175) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `type_registry`
--

INSERT INTO `type_registry` (`id`, `name`, `description`) VALUES
(1, 'Justificante', 'Tipo de registro para realizar justificaciones'),
(2, 'Dias economicos', 'Dias economicos'),
(3, 'Incapacidades', 'Dias que no es capaz de trabajar'),
(4, 'Comisión', 'Tiempo de descanso por comision');

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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`id`, `first_name`, `last_name`, `email`, `username`, `password_hash`, `auth_key`, `access_token`) VALUES
(1, 'Alfonso', 'de Alba', 'alfonso@blabla.com', 'Alf', '$2y$13$BNuZIqxyAOWZY3STYlS7lesuX3GzeG3ZwiQldpGJrO.UNzKbV/fom', NULL, NULL),
(2, 'Rodrigo', 'Esparza', 'rodrigo.esparza@uady.com', 'Rod', '$2y$13$3guVhoN4eOG0.0hxFcXpfedRFNwhRdAqeA4RRZDmuVN9AYW.4aemG', 'c4SN0qIEPpV-5FR6Qz8xojj6kEySMSix', 'CcZMZZDdUa5Hd99CO82SlQdZ8dNa-AUb'),
(3, 'admin', 'admin', 'admin@example.org', 'admin', '$2y$13$ye3I0YNVKnRSUDsGxxqh6u0IXODiyOrK4fFL/bJLbIzgHR5DRJNIC', 'xVORdWd_SzC_WksuGduQomyEsCdmiG-R', 'ARIGuL7JYjl7cpPTjb5qhJ61d-d_rkv2'),
(4, 'pp', 'pp', 'pp@pp.com', 'pepe', '$2y$13$W5WOIGNcJbX4mP2F.zGX4eveehLneUl0jv/WMPCV1ANPXrrzmKZX2', 'VnrzP5QzL09h4FpTFmNgfj0ywkh4GoJW', 'FO-iZcCKypGUruExsuMJFTlvJ8fQWOGC'),
(5, 'Alvaro Humberto', 'Ortega Pacheco', 'ejemplo@hotmail.com', 'alvarohumberto', '$2y$13$fDeqCLAqbwonU60s9eJ.Ju5w1eztxxScrp59vcZZEbWNiPNZK2ehi', 'ryxSTJJVabxvNM5oBTvTBA8OCxbZFRm0', 'cJ0tmCxHNl2qkKVOuBsVUjMLDHKc1TVJ'),
(6, 'Empleado', 'Empleado', 'empleado@empleado.com', 'Empleado', '$2y$13$X9K.dAGI9s7B3NL.IFNkTO7hbfLs9QYOP4wjjE.Rpml04Y/gAiWL2', 'M8ixklNKDx-am3OCrK1rJvEBkwEe5hy9', 'lYfh5xSJx211AaNcwiCszVJYOvSCUKDK'),
(7, 'Secretaria', 'Administrativa', 'Secretaria@administrativa.com', 'Secretaria', '$2y$13$UuuNMtdMQca7PNFU2IdM5.LFKusAG3zWv.nUccTAhbI0iunwYjqzS', '0hz2Y5s86BpE4gxMOL4NVqBMD7ykFS-y', 'dYzGHefkevNt2yIzpIee5iegXCp2-fFa'),
(8, 'Dirección', 'Administrativa', 'Direccion@Academica.com', 'Direccion', '$2y$13$8X0vsihX8tSvsytAFcTcbebtpwi1m1KwoTASBgdCsMyJids4BFTLy', '6XV_ZL6yP0p2nBAtV6PYAmtbkIAVaaJ3', 'unuarDHrfGIh_pOrOcgQG39XBPol1wzu');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `auth_assignment`
--
ALTER TABLE `auth_assignment`
 ADD PRIMARY KEY (`item_name`,`user_id`);

--
-- Indices de la tabla `auth_item`
--
ALTER TABLE `auth_item`
 ADD PRIMARY KEY (`name`), ADD KEY `rule_name` (`rule_name`), ADD KEY `idx-auth_item-type` (`type`);

--
-- Indices de la tabla `auth_item_child`
--
ALTER TABLE `auth_item_child`
 ADD PRIMARY KEY (`parent`,`child`), ADD KEY `child` (`child`);

--
-- Indices de la tabla `auth_rule`
--
ALTER TABLE `auth_rule`
 ADD PRIMARY KEY (`name`);

--
-- Indices de la tabla `migration`
--
ALTER TABLE `migration`
 ADD PRIMARY KEY (`version`);

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
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT de la tabla `type_registry`
--
ALTER TABLE `type_registry`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `user`
--
ALTER TABLE `user`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `auth_assignment`
--
ALTER TABLE `auth_assignment`
ADD CONSTRAINT `auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `auth_item`
--
ALTER TABLE `auth_item`
ADD CONSTRAINT `auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `auth_item_child`
--
ALTER TABLE `auth_item_child`
ADD CONSTRAINT `auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `registry`
--
ALTER TABLE `registry`
ADD CONSTRAINT `fk_registry_type_registry1` FOREIGN KEY (`type_registry_id`) REFERENCES `type_registry` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_registry_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
