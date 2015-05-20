-- phpMyAdmin SQL Dump
-- version 4.2.3deb1.trusty~ppa.1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 20-05-2015 a las 16:08:25
-- Versión del servidor: 5.5.43-0ubuntu0.14.04.1
-- Versión de PHP: 5.5.9-1ubuntu4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `sovec_db`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group`
--

CREATE TABLE IF NOT EXISTS `auth_group` (
`id` int(11) NOT NULL,
  `name` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
`id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_permission`
--

CREATE TABLE IF NOT EXISTS `auth_permission` (
`id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=34 ;

--
-- Volcado de datos para la tabla `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can add permission', 2, 'add_permission'),
(5, 'Can change permission', 2, 'change_permission'),
(6, 'Can delete permission', 2, 'delete_permission'),
(7, 'Can add group', 3, 'add_group'),
(8, 'Can change group', 3, 'change_group'),
(9, 'Can delete group', 3, 'delete_group'),
(10, 'Can add user', 4, 'add_user'),
(11, 'Can change user', 4, 'change_user'),
(12, 'Can delete user', 4, 'delete_user'),
(13, 'Can add content type', 5, 'add_contenttype'),
(14, 'Can change content type', 5, 'change_contenttype'),
(15, 'Can delete content type', 5, 'delete_contenttype'),
(16, 'Can add session', 6, 'add_session'),
(17, 'Can change session', 6, 'change_session'),
(18, 'Can delete session', 6, 'delete_session'),
(19, 'Can add pelicula', 7, 'add_pelicula'),
(20, 'Can change pelicula', 7, 'change_pelicula'),
(21, 'Can delete pelicula', 7, 'delete_pelicula'),
(22, 'Can add sala', 8, 'add_sala'),
(23, 'Can change sala', 8, 'change_sala'),
(24, 'Can delete sala', 8, 'delete_sala'),
(25, 'Can add asiento', 9, 'add_asiento'),
(26, 'Can change asiento', 9, 'change_asiento'),
(27, 'Can delete asiento', 9, 'delete_asiento'),
(28, 'Can add funcion', 10, 'add_funcion'),
(29, 'Can change funcion', 10, 'change_funcion'),
(30, 'Can delete funcion', 10, 'delete_funcion'),
(31, 'Can add reserva', 11, 'add_reserva'),
(32, 'Can change reserva', 11, 'change_reserva'),
(33, 'Can delete reserva', 11, 'delete_reserva');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user`
--

CREATE TABLE IF NOT EXISTS `auth_user` (
`id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) DEFAULT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Volcado de datos para la tabla `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(2, 'pbkdf2_sha256$20000$fhVDLmkkvErB$aG4BTtfD1Z0SBWITkVI1lW2wO8CEXa8RtSAQyR3L+wQ=', '2015-05-20 19:01:14', 1, 'administrador1', 'administrador1', '', 'administrador1@admin.cl', 1, 1, '2015-05-20 18:14:23'),
(3, 'pbkdf2_sha256$20000$6thlcawbonBJ$POP05D0QNN9o88dkylTxLQ23eU7WK+i/fzPY+qTd1Qg=', '2015-05-20 18:17:19', 1, 'administrador2', 'administrador2', '', 'administrador2@admin.cl', 1, 1, '2015-05-20 18:17:19'),
(4, 'pbkdf2_sha256$20000$IkjtTkiqqP4V$4j9EzzKIcHWsOTsxJ2QUVTMDa3vyD5liNJzJY244hHY=', '2015-05-20 19:06:51', 0, 'usuario1', 'usuario1', '', 'usuario1@usuario1.cl', 0, 1, '2015-05-20 18:46:14'),
(5, 'pbkdf2_sha256$20000$Q9ZpODnianqO$m/huVhT0dkfkmUI0b251ambPaCRRVxNM9yyw3/isr9I=', '2015-05-20 18:47:01', 0, 'usuario2', 'usuario2', '', 'usuario2@usuario2.cl', 0, 1, '2015-05-20 18:47:01');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_groups`
--

CREATE TABLE IF NOT EXISTS `auth_user_groups` (
`id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_user_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
`id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_admin_log`
--

CREATE TABLE IF NOT EXISTS `django_admin_log` (
`id` int(11) NOT NULL,
  `action_time` datetime NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=17 ;

--
-- Volcado de datos para la tabla `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2015-05-20 18:48:29', '1', 'Sala 1', 1, '', 8, 2),
(2, '2015-05-20 18:48:32', '2', 'Sala 2', 1, '', 8, 2),
(3, '2015-05-20 18:48:35', '3', 'Sala 3', 1, '', 8, 2),
(4, '2015-05-20 18:51:50', '1', 'Rapido y furioso 7', 1, '', 7, 2),
(5, '2015-05-20 18:52:06', '1', 'Rapido y furioso 7', 2, 'Modificado/a duracion.', 7, 2),
(6, '2015-05-20 18:53:30', '2', 'Jurassic world', 1, '', 7, 2),
(7, '2015-05-20 18:54:46', '3', 'Mad Max: furia en el camino', 1, '', 7, 2),
(8, '2015-05-20 18:56:31', '4', 'Los indestructibles 3', 1, '', 7, 2),
(9, '2015-05-20 19:02:14', '1', 'Rapido y furioso 7, sala 1, inicio: 02-06-2015, 10:00', 1, '', 10, 2),
(10, '2015-05-20 19:02:37', '2', 'Rapido y furioso 7, sala 2, inicio: 02-06-2015, 10:00', 1, '', 10, 2),
(11, '2015-05-20 19:03:07', '3', 'Jurassic world, sala 3, inicio: 02-06-2015, 12:00', 1, '', 10, 2),
(12, '2015-05-20 19:03:24', '4', 'Jurassic world, sala 1, inicio: 02-06-2015, 12:00', 1, '', 10, 2),
(13, '2015-05-20 19:03:49', '5', 'Mad Max: furia en el camino, sala 2, inicio: 02-06-2015, 14:00', 1, '', 10, 2),
(14, '2015-05-20 19:04:19', '6', 'Mad Max: furia en el camino, sala 3, inicio: 02-06-2015, 14:00', 1, '', 10, 2),
(15, '2015-05-20 19:04:47', '7', 'Los indestructibles 3, sala 1, inicio: 02-06-2015, 17:00', 1, '', 10, 2),
(16, '2015-05-20 19:05:06', '8', 'Los indestructibles 3, sala 2, inicio: 02-06-2015, 17:00', 1, '', 10, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_content_type`
--

CREATE TABLE IF NOT EXISTS `django_content_type` (
`id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Volcado de datos para la tabla `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session'),
(9, 'venta_entradas', 'asiento'),
(10, 'venta_entradas', 'funcion'),
(7, 'venta_entradas', 'pelicula'),
(11, 'venta_entradas', 'reserva'),
(8, 'venta_entradas', 'sala');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_migrations`
--

CREATE TABLE IF NOT EXISTS `django_migrations` (
`id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=20 ;

--
-- Volcado de datos para la tabla `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2015-05-19 20:25:50'),
(2, 'auth', '0001_initial', '2015-05-19 20:25:52'),
(3, 'admin', '0001_initial', '2015-05-19 20:25:52'),
(4, 'contenttypes', '0002_remove_content_type_name', '2015-05-19 20:25:52'),
(5, 'auth', '0002_alter_permission_name_max_length', '2015-05-19 20:25:53'),
(6, 'auth', '0003_alter_user_email_max_length', '2015-05-19 20:25:53'),
(7, 'auth', '0004_alter_user_username_opts', '2015-05-19 20:25:53'),
(8, 'auth', '0005_alter_user_last_login_null', '2015-05-19 20:25:53'),
(9, 'auth', '0006_require_contenttypes_0002', '2015-05-19 20:25:53'),
(10, 'sessions', '0001_initial', '2015-05-19 20:25:53'),
(11, 'venta_entradas', '0001_initial', '2015-05-19 20:25:56'),
(12, 'venta_entradas', '0002_auto_20150508_1838', '2015-05-19 20:25:56'),
(13, 'venta_entradas', '0003_auto_20150508_1917', '2015-05-19 20:25:56'),
(14, 'venta_entradas', '0004_auto_20150508_2021', '2015-05-19 20:25:57'),
(15, 'venta_entradas', '0005_auto_20150509_1630', '2015-05-19 20:25:57'),
(16, 'venta_entradas', '0006_auto_20150510_0000', '2015-05-19 20:25:58'),
(17, 'venta_entradas', '0007_auto_20150510_0004', '2015-05-19 20:25:58'),
(18, 'venta_entradas', '0008_pelicula_poster', '2015-05-19 20:25:58'),
(19, 'venta_entradas', '0009_auto_20150517_1811', '2015-05-19 20:25:59');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_session`
--

CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('rd2x8c8fcwqtqk4t6sk1y6p40hzl15i0', 'NGY5OWQxMDc2Y2QzZjJhM2U4Zjc1MDhmMWUwOThmY2UxODg2YmNlODp7Il9hdXRoX3VzZXJfaGFzaCI6IjU2NzdlMjVhNjViNjJkNTJjYWU0Y2JhNmI0MmM4YTcwMWE0NzA5YWMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI0In0=', '2015-06-03 19:06:51');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta_entradas_asiento`
--

CREATE TABLE IF NOT EXISTS `venta_entradas_asiento` (
`idAsiento` int(11) NOT NULL,
  `numero` int(11) NOT NULL,
  `idSala_id` int(11) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=325 ;

--
-- Volcado de datos para la tabla `venta_entradas_asiento`
--

INSERT INTO `venta_entradas_asiento` (`idAsiento`, `numero`, `idSala_id`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 1),
(4, 4, 1),
(5, 5, 1),
(6, 6, 1),
(7, 7, 1),
(8, 8, 1),
(9, 9, 1),
(10, 10, 1),
(11, 11, 1),
(12, 12, 1),
(13, 13, 1),
(14, 14, 1),
(15, 15, 1),
(16, 16, 1),
(17, 17, 1),
(18, 18, 1),
(19, 19, 1),
(20, 20, 1),
(21, 21, 1),
(22, 22, 1),
(23, 23, 1),
(24, 24, 1),
(25, 25, 1),
(26, 26, 1),
(27, 27, 1),
(28, 28, 1),
(29, 29, 1),
(30, 30, 1),
(31, 31, 1),
(32, 32, 1),
(33, 33, 1),
(34, 34, 1),
(35, 35, 1),
(36, 36, 1),
(37, 37, 1),
(38, 38, 1),
(39, 39, 1),
(40, 40, 1),
(41, 41, 1),
(42, 42, 1),
(43, 43, 1),
(44, 44, 1),
(45, 45, 1),
(46, 46, 1),
(47, 47, 1),
(48, 48, 1),
(49, 49, 1),
(50, 50, 1),
(51, 51, 1),
(52, 52, 1),
(53, 53, 1),
(54, 54, 1),
(55, 55, 1),
(56, 56, 1),
(57, 57, 1),
(58, 58, 1),
(59, 59, 1),
(60, 60, 1),
(61, 61, 1),
(62, 62, 1),
(63, 63, 1),
(64, 64, 1),
(65, 65, 1),
(66, 66, 1),
(67, 67, 1),
(68, 68, 1),
(69, 69, 1),
(70, 70, 1),
(71, 71, 1),
(72, 72, 1),
(73, 73, 1),
(74, 74, 1),
(75, 75, 1),
(76, 76, 1),
(77, 77, 1),
(78, 78, 1),
(79, 79, 1),
(80, 80, 1),
(81, 81, 1),
(82, 82, 1),
(83, 83, 1),
(84, 84, 1),
(85, 85, 1),
(86, 86, 1),
(87, 87, 1),
(88, 88, 1),
(89, 89, 1),
(90, 90, 1),
(91, 91, 1),
(92, 92, 1),
(93, 93, 1),
(94, 94, 1),
(95, 95, 1),
(96, 96, 1),
(97, 97, 1),
(98, 98, 1),
(99, 99, 1),
(100, 100, 1),
(101, 101, 1),
(102, 102, 1),
(103, 103, 1),
(104, 104, 1),
(105, 105, 1),
(106, 106, 1),
(107, 107, 1),
(108, 108, 1),
(109, 1, 2),
(110, 2, 2),
(111, 3, 2),
(112, 4, 2),
(113, 5, 2),
(114, 6, 2),
(115, 7, 2),
(116, 8, 2),
(117, 9, 2),
(118, 10, 2),
(119, 11, 2),
(120, 12, 2),
(121, 13, 2),
(122, 14, 2),
(123, 15, 2),
(124, 16, 2),
(125, 17, 2),
(126, 18, 2),
(127, 19, 2),
(128, 20, 2),
(129, 21, 2),
(130, 22, 2),
(131, 23, 2),
(132, 24, 2),
(133, 25, 2),
(134, 26, 2),
(135, 27, 2),
(136, 28, 2),
(137, 29, 2),
(138, 30, 2),
(139, 31, 2),
(140, 32, 2),
(141, 33, 2),
(142, 34, 2),
(143, 35, 2),
(144, 36, 2),
(145, 37, 2),
(146, 38, 2),
(147, 39, 2),
(148, 40, 2),
(149, 41, 2),
(150, 42, 2),
(151, 43, 2),
(152, 44, 2),
(153, 45, 2),
(154, 46, 2),
(155, 47, 2),
(156, 48, 2),
(157, 49, 2),
(158, 50, 2),
(159, 51, 2),
(160, 52, 2),
(161, 53, 2),
(162, 54, 2),
(163, 55, 2),
(164, 56, 2),
(165, 57, 2),
(166, 58, 2),
(167, 59, 2),
(168, 60, 2),
(169, 61, 2),
(170, 62, 2),
(171, 63, 2),
(172, 64, 2),
(173, 65, 2),
(174, 66, 2),
(175, 67, 2),
(176, 68, 2),
(177, 69, 2),
(178, 70, 2),
(179, 71, 2),
(180, 72, 2),
(181, 73, 2),
(182, 74, 2),
(183, 75, 2),
(184, 76, 2),
(185, 77, 2),
(186, 78, 2),
(187, 79, 2),
(188, 80, 2),
(189, 81, 2),
(190, 82, 2),
(191, 83, 2),
(192, 84, 2),
(193, 85, 2),
(194, 86, 2),
(195, 87, 2),
(196, 88, 2),
(197, 89, 2),
(198, 90, 2),
(199, 91, 2),
(200, 92, 2),
(201, 93, 2),
(202, 94, 2),
(203, 95, 2),
(204, 96, 2),
(205, 97, 2),
(206, 98, 2),
(207, 99, 2),
(208, 100, 2),
(209, 101, 2),
(210, 102, 2),
(211, 103, 2),
(212, 104, 2),
(213, 105, 2),
(214, 106, 2),
(215, 107, 2),
(216, 108, 2),
(217, 1, 3),
(218, 2, 3),
(219, 3, 3),
(220, 4, 3),
(221, 5, 3),
(222, 6, 3),
(223, 7, 3),
(224, 8, 3),
(225, 9, 3),
(226, 10, 3),
(227, 11, 3),
(228, 12, 3),
(229, 13, 3),
(230, 14, 3),
(231, 15, 3),
(232, 16, 3),
(233, 17, 3),
(234, 18, 3),
(235, 19, 3),
(236, 20, 3),
(237, 21, 3),
(238, 22, 3),
(239, 23, 3),
(240, 24, 3),
(241, 25, 3),
(242, 26, 3),
(243, 27, 3),
(244, 28, 3),
(245, 29, 3),
(246, 30, 3),
(247, 31, 3),
(248, 32, 3),
(249, 33, 3),
(250, 34, 3),
(251, 35, 3),
(252, 36, 3),
(253, 37, 3),
(254, 38, 3),
(255, 39, 3),
(256, 40, 3),
(257, 41, 3),
(258, 42, 3),
(259, 43, 3),
(260, 44, 3),
(261, 45, 3),
(262, 46, 3),
(263, 47, 3),
(264, 48, 3),
(265, 49, 3),
(266, 50, 3),
(267, 51, 3),
(268, 52, 3),
(269, 53, 3),
(270, 54, 3),
(271, 55, 3),
(272, 56, 3),
(273, 57, 3),
(274, 58, 3),
(275, 59, 3),
(276, 60, 3),
(277, 61, 3),
(278, 62, 3),
(279, 63, 3),
(280, 64, 3),
(281, 65, 3),
(282, 66, 3),
(283, 67, 3),
(284, 68, 3),
(285, 69, 3),
(286, 70, 3),
(287, 71, 3),
(288, 72, 3),
(289, 73, 3),
(290, 74, 3),
(291, 75, 3),
(292, 76, 3),
(293, 77, 3),
(294, 78, 3),
(295, 79, 3),
(296, 80, 3),
(297, 81, 3),
(298, 82, 3),
(299, 83, 3),
(300, 84, 3),
(301, 85, 3),
(302, 86, 3),
(303, 87, 3),
(304, 88, 3),
(305, 89, 3),
(306, 90, 3),
(307, 91, 3),
(308, 92, 3),
(309, 93, 3),
(310, 94, 3),
(311, 95, 3),
(312, 96, 3),
(313, 97, 3),
(314, 98, 3),
(315, 99, 3),
(316, 100, 3),
(317, 101, 3),
(318, 102, 3),
(319, 103, 3),
(320, 104, 3),
(321, 105, 3),
(322, 106, 3),
(323, 107, 3),
(324, 108, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta_entradas_funcion`
--

CREATE TABLE IF NOT EXISTS `venta_entradas_funcion` (
`idFuncion` int(11) NOT NULL,
  `hora_inicio` datetime NOT NULL,
  `idPelicula_id` int(11) NOT NULL,
  `sala_id` int(11) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Volcado de datos para la tabla `venta_entradas_funcion`
--

INSERT INTO `venta_entradas_funcion` (`idFuncion`, `hora_inicio`, `idPelicula_id`, `sala_id`) VALUES
(1, '2015-06-02 13:00:00', 1, 1),
(2, '2015-06-02 13:00:00', 1, 2),
(3, '2015-06-02 15:00:00', 2, 3),
(4, '2015-06-02 15:00:00', 2, 1),
(5, '2015-06-02 17:00:00', 3, 2),
(6, '2015-06-02 17:00:00', 3, 3),
(7, '2015-06-02 20:00:00', 4, 1),
(8, '2015-06-02 20:00:00', 4, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta_entradas_pelicula`
--

CREATE TABLE IF NOT EXISTS `venta_entradas_pelicula` (
`idPelicula` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` varchar(1000) NOT NULL,
  `duracion` bigint(20) DEFAULT NULL,
  `poster` varchar(100) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `venta_entradas_pelicula`
--

INSERT INTO `venta_entradas_pelicula` (`idPelicula`, `nombre`, `descripcion`, `duracion`, `poster`) VALUES
(1, 'Rapido y furioso 7', 'Continuando con las hazañas globales de la imparable franquicia basada en la velocidad, Vin Diesel, Paul Walker y Dwayne Johnson encabezan FAST & FURIOUS 7. James Wan dirige esta nueva entrega de la tremendamente exitosa saga a la que regresan los actores Michelle Rodriguez, Jordana Brewster, Tyrese Gibson, Chris “Ludacris” Bridges, Elsa Pataky y Lucas Black. Neal H. Moritz, Vin Diesel y Michael Fottrell vuelven a unirse para producir la película a partir de un guión de Chris Morgan.', 5400000000, 'images/fast-and-furious-7_ad6oEOZ.jpg'),
(2, 'Jurassic world', 'Veintidós años después de lo ocurrido en Jurassic Park, la isla Nublar ha sido transformada en un parque temático, Jurassic Wold, con versiones domesticadas de algunos de los dinosaurios más conocidos. Cuando todo parece ir a la perfección y ser el negocio del siglo, un nuevo dinosaurio de especie todavía desconocida y que es mucho más inteligente de lo que se pensaba, comienza a causar estragos entre los habitantes del Parque.', 7000000000, 'images/jurassic-world_nOsX67q.jpg'),
(3, 'Mad Max: furia en el camino', 'Del director George Miller, fundador del género post apocalíptico y la mente maestra detrás de la legendaria franquicia de “Mad Max”, llega “Mad Max: Furia en el Camino”, un regreso al mundo del Guerrero del Camino. Así, Max Rockatansky, acosado por su pasado, buscará una nueva forma de sobrevivencia uniéndose a la emperatriz Furiosa, en un mundo que colapsa a cada segundo y está lleno de locura y desazón. Con las actuaciones de la ganadora del Oscar, Charlize Theron (Monster), Tom Hardy (El Origen) y a Nicholas Hoult (X-Men: días del futuro pasado).', 7801000000, 'images/mad-max-fury-road.jpg'),
(4, 'Los indestructibles 3', 'Los indestructibles están de regreso! Barney, Christmas y el resto del equipo deberán enfrentarse con el malvado Conrad, quién años atrás fue uno de los fundadores de Los indestructibles. Conrad se convirtió con el tiempo en un rudo traficante de armas a quién Barney creyó haber asesinado. Ahora en su inesperado regreso Conrad tiene un solo objetivo: destruir a los indestructibles de una vez por todas.', 6600000000, 'images/the-expendables-3.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta_entradas_reserva`
--

CREATE TABLE IF NOT EXISTS `venta_entradas_reserva` (
`idReserva` int(11) NOT NULL,
  `idAsiento_id` int(11) NOT NULL,
  `idFuncion_id` int(11) NOT NULL,
  `idUsuario_asigna_id` int(11) NOT NULL,
  `idUsuario_asiste_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta_entradas_sala`
--

CREATE TABLE IF NOT EXISTS `venta_entradas_sala` (
`idSala` int(11) NOT NULL,
  `numero` int(11) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `venta_entradas_sala`
--

INSERT INTO `venta_entradas_sala` (`idSala`, `numero`) VALUES
(1, 1),
(2, 2),
(3, 3);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `auth_group`
--
ALTER TABLE `auth_group`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `name` (`name`);

--
-- Indices de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `group_id` (`group_id`,`permission_id`), ADD KEY `auth_group__permission_id_1f49ccbbdc69d2fc_fk_auth_permission_id` (`permission_id`);

--
-- Indices de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `content_type_id` (`content_type_id`,`codename`);

--
-- Indices de la tabla `auth_user`
--
ALTER TABLE `auth_user`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `username` (`username`);

--
-- Indices de la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `user_id` (`user_id`,`group_id`), ADD KEY `auth_user_groups_group_id_33ac548dcf5f8e37_fk_auth_group_id` (`group_id`);

--
-- Indices de la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `user_id` (`user_id`,`permission_id`), ADD KEY `auth_user_u_permission_id_384b62483d7071f0_fk_auth_permission_id` (`permission_id`);

--
-- Indices de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
 ADD PRIMARY KEY (`id`), ADD KEY `djang_content_type_id_697914295151027a_fk_django_content_type_id` (`content_type_id`), ADD KEY `django_admin_log_user_id_52fdd58701c5f563_fk_auth_user_id` (`user_id`);

--
-- Indices de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `django_content_type_app_label_45f3b1d93ec8c61c_uniq` (`app_label`,`model`);

--
-- Indices de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `django_session`
--
ALTER TABLE `django_session`
 ADD PRIMARY KEY (`session_key`), ADD KEY `django_session_de54fa62` (`expire_date`);

--
-- Indices de la tabla `venta_entradas_asiento`
--
ALTER TABLE `venta_entradas_asiento`
 ADD PRIMARY KEY (`idAsiento`), ADD UNIQUE KEY `venta_entradas_asiento_idSala_id_79da8586dfacf974_uniq` (`idSala_id`,`numero`), ADD KEY `venta_entradas_asiento_e4de94e4` (`idSala_id`);

--
-- Indices de la tabla `venta_entradas_funcion`
--
ALTER TABLE `venta_entradas_funcion`
 ADD PRIMARY KEY (`idFuncion`), ADD KEY `venta_entradas_funcion_9b151a44` (`idPelicula_id`), ADD KEY `venta_entradas_funcion_cc2cf539` (`sala_id`);

--
-- Indices de la tabla `venta_entradas_pelicula`
--
ALTER TABLE `venta_entradas_pelicula`
 ADD PRIMARY KEY (`idPelicula`);

--
-- Indices de la tabla `venta_entradas_reserva`
--
ALTER TABLE `venta_entradas_reserva`
 ADD PRIMARY KEY (`idReserva`), ADD UNIQUE KEY `venta_entradas_reserva_idFuncion_id_fbd79b1ca5ead11_uniq` (`idFuncion_id`,`idAsiento_id`), ADD KEY `D03d0d88fbedc88e033d237eab7cd381` (`idAsiento_id`), ADD KEY `venta_entra_idUsuario_asigna_id_3df78d5dce74dd3d_fk_auth_user_id` (`idUsuario_asigna_id`), ADD KEY `venta_entra_idUsuario_asiste_id_54300a325e015fcb_fk_auth_user_id` (`idUsuario_asiste_id`);

--
-- Indices de la tabla `venta_entradas_sala`
--
ALTER TABLE `venta_entradas_sala`
 ADD PRIMARY KEY (`idSala`), ADD UNIQUE KEY `venta_entradas_sala_numero_1f69bcd4cc3e4acd_uniq` (`numero`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `auth_group`
--
ALTER TABLE `auth_group`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=34;
--
-- AUTO_INCREMENT de la tabla `auth_user`
--
ALTER TABLE `auth_user`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT de la tabla `venta_entradas_asiento`
--
ALTER TABLE `venta_entradas_asiento`
MODIFY `idAsiento` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=325;
--
-- AUTO_INCREMENT de la tabla `venta_entradas_funcion`
--
ALTER TABLE `venta_entradas_funcion`
MODIFY `idFuncion` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT de la tabla `venta_entradas_pelicula`
--
ALTER TABLE `venta_entradas_pelicula`
MODIFY `idPelicula` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `venta_entradas_reserva`
--
ALTER TABLE `venta_entradas_reserva`
MODIFY `idReserva` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `venta_entradas_sala`
--
ALTER TABLE `venta_entradas_sala`
MODIFY `idSala` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
ADD CONSTRAINT `auth_group_permission_group_id_689710a9a73b7457_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
ADD CONSTRAINT `auth_group__permission_id_1f49ccbbdc69d2fc_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`);

--
-- Filtros para la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
ADD CONSTRAINT `auth__content_type_id_508cf46651277a81_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Filtros para la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
ADD CONSTRAINT `auth_user_groups_group_id_33ac548dcf5f8e37_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
ADD CONSTRAINT `auth_user_groups_user_id_4b5ed4ffdb8fd9b0_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
ADD CONSTRAINT `auth_user_user_permissi_user_id_7f0938558328534a_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
ADD CONSTRAINT `auth_user_u_permission_id_384b62483d7071f0_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`);

--
-- Filtros para la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
ADD CONSTRAINT `django_admin_log_user_id_52fdd58701c5f563_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
ADD CONSTRAINT `djang_content_type_id_697914295151027a_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Filtros para la tabla `venta_entradas_asiento`
--
ALTER TABLE `venta_entradas_asiento`
ADD CONSTRAINT `venta_e_idSala_id_18eea71395395245_fk_venta_entradas_sala_idSala` FOREIGN KEY (`idSala_id`) REFERENCES `venta_entradas_sala` (`idSala`);

--
-- Filtros para la tabla `venta_entradas_funcion`
--
ALTER TABLE `venta_entradas_funcion`
ADD CONSTRAINT `e4b2affdb30b029f1e8cc3606a31ec5c` FOREIGN KEY (`idPelicula_id`) REFERENCES `venta_entradas_pelicula` (`idPelicula`),
ADD CONSTRAINT `venta_ent_sala_id_610edf8ffbe59a37_fk_venta_entradas_sala_idSala` FOREIGN KEY (`sala_id`) REFERENCES `venta_entradas_sala` (`idSala`);

--
-- Filtros para la tabla `venta_entradas_reserva`
--
ALTER TABLE `venta_entradas_reserva`
ADD CONSTRAINT `D03d0d88fbedc88e033d237eab7cd381` FOREIGN KEY (`idAsiento_id`) REFERENCES `venta_entradas_asiento` (`idAsiento`),
ADD CONSTRAINT `f65183c6c0c196dcf113fdcfa310d424` FOREIGN KEY (`idFuncion_id`) REFERENCES `venta_entradas_funcion` (`idFuncion`),
ADD CONSTRAINT `venta_entra_idUsuario_asigna_id_3df78d5dce74dd3d_fk_auth_user_id` FOREIGN KEY (`idUsuario_asigna_id`) REFERENCES `auth_user` (`id`),
ADD CONSTRAINT `venta_entra_idUsuario_asiste_id_54300a325e015fcb_fk_auth_user_id` FOREIGN KEY (`idUsuario_asiste_id`) REFERENCES `auth_user` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
