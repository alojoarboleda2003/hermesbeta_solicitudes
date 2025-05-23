-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 11-05-2025 a las 01:32:44
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `hermesbeta`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aprendices_ficha`
--

CREATE TABLE `aprendices_ficha` (
  `id_aprendiz_ficha` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_ficha` int(11) NOT NULL,
  `fecha_asignacion` timestamp NULL DEFAULT current_timestamp(),
  `estado` enum('activo','inactivo','desertor','trasladado') DEFAULT 'activo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `aprendices_ficha`
--

INSERT INTO `aprendices_ficha` (`id_aprendiz_ficha`, `id_usuario`, `id_ficha`, `fecha_asignacion`, `estado`) VALUES
(2, 44, 5, '2025-04-04 17:32:43', 'activo'),
(3, 50, 4, '2025-04-04 17:32:43', 'activo'),
(4, 60, 10, '2025-04-04 17:32:43', 'activo'),
(5, 72, 11, '2025-04-13 17:11:36', 'activo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `categoria_id` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`categoria_id`, `nombre`) VALUES
(1, 'Portátiles'),
(2, 'Video'),
(3, 'Sonido'),
(4, 'Cables'),
(5, 'Control Remoto');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_prestamo`
--

CREATE TABLE `detalle_prestamo` (
  `cons_detalle` int(11) NOT NULL,
  `id_prestamo` int(11) NOT NULL,
  `equipo_id` int(11) NOT NULL,
  `estado` enum('Asignado','Devuelto') NOT NULL DEFAULT 'Asignado',
  `fecha_actualizacion` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `detalle_prestamo`
--

INSERT INTO `detalle_prestamo` (`cons_detalle`, `id_prestamo`, `equipo_id`, `estado`, `fecha_actualizacion`) VALUES
(2, 1, 1, 'Asignado', '2025-04-18 14:55:08'),
(3, 1, 2, 'Asignado', '2025-04-18 14:55:08'),
(4, 1, 6, 'Asignado', '2025-04-18 14:55:08'),
(5, 2, 4, 'Asignado', '2025-04-18 15:35:51'),
(6, 2, 7, 'Asignado', '2025-04-18 15:35:51'),
(7, 2, 11, 'Asignado', '2025-04-18 15:35:51'),
(8, 2, 27, 'Asignado', '2025-04-18 15:35:51'),
(11, 5, 5, 'Devuelto', '2025-04-18 15:42:48'),
(12, 5, 16, 'Devuelto', '2025-04-18 15:42:48'),
(15, 4, 31, 'Asignado', '2025-04-18 16:32:03'),
(16, 4, 42, 'Asignado', '2025-04-18 16:32:03');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equipos`
--

CREATE TABLE `equipos` (
  `equipo_id` int(11) NOT NULL,
  `numero_serie` varchar(100) NOT NULL,
  `etiqueta` varchar(50) DEFAULT NULL,
  `descripcion` varchar(100) NOT NULL,
  `fecha_entrada` timestamp NOT NULL DEFAULT current_timestamp(),
  `ubicacion_id` int(11) DEFAULT NULL,
  `categoria_id` int(11) DEFAULT 1,
  `cuentadante_id` int(11) DEFAULT NULL,
  `id_estado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `equipos`
--

INSERT INTO `equipos` (`equipo_id`, `numero_serie`, `etiqueta`, `descripcion`, `fecha_entrada`, `ubicacion_id`, `categoria_id`, `cuentadante_id`, `id_estado`) VALUES
(1, 'SN001', '9125001SN001', 'HP EliteBook 840', '2025-04-17 15:42:57', 1, 1, 50, 2),
(2, 'SN002', '9125001SN002', 'Dell XPS 13', '2025-04-17 15:42:57', 1, 1, 50, 2),
(3, 'SN003', '9125001SN003', 'Lenovo ThinkPad X1', '2025-04-17 15:42:57', 2, 1, 50, 5),
(4, 'SN004', '9125001SN004', 'MacBook Pro 16\"', '2025-04-17 15:42:57', 1, 1, 50, 3),
(5, 'SN005', '9125001SN005', 'Acer Swift 3', '2025-04-17 15:42:57', 2, 1, 50, 5),
(6, 'SN006', '9125002SN006', 'Cámara Sony AX53', '2025-04-17 15:43:57', 1, 2, 50, 2),
(7, 'SN007', '9125002SN007', 'Proyector Epson 4K', '2025-04-17 15:43:57', 2, 2, 50, 3),
(8, 'SN008', '9125002SN008', 'Trípode Manfrotto', '2025-04-17 15:43:57', 1, 2, 50, 5),
(9, 'SN009', '9125002SN009', 'Grabadora Panasonic', '2025-04-17 15:43:57', 2, 2, 50, 5),
(10, 'SN010', '9125002SN010', 'Lente Canon 24-70mm', '2025-04-17 15:43:57', 1, 2, 50, 5),
(11, 'SN011', '9125003SN011', 'Micrófono Shure SM58', '2025-04-17 15:43:57', 1, 3, 50, 3),
(12, 'SN012', '9125003SN012', 'Altavoz Bose S1 Pro', '2025-04-17 15:43:57', 2, 3, 50, 5),
(13, 'SN013', '9125003SN013', 'Mezcladora Yamaha MG10', '2025-04-17 15:43:57', 1, 3, 50, 5),
(14, 'SN014', '9125003SN014', 'Audífonos Sennheiser HD', '2025-04-17 15:43:57', 2, 3, 50, 5),
(15, 'SN015', '9125003SN015', 'Interface Audio Focusrite', '2025-04-17 15:43:57', 1, 3, 50, 5),
(16, 'SN016', '9125004SN016', 'HDMI 2.1 3m', '2025-04-17 15:43:57', 1, 4, 50, 5),
(17, 'SN017', '9125004SN017', 'USB-C a Ethernet', '2025-04-17 15:43:57', 2, 4, 50, 5),
(18, 'SN018', '9125004SN018', 'VGA 5m', '2025-04-17 15:43:57', 1, 4, 50, 5),
(19, 'SN019', '9125004SN019', 'DisplayPort 2m', '2025-04-17 15:43:57', 2, 4, 50, 5),
(20, 'SN020', '9125004SN020', 'Cable de Red CAT6', '2025-04-17 15:43:57', 1, 4, 50, 5),
(21, 'SN021', '9125005SN021', 'Control Universal Logitech', '2025-04-17 15:43:57', 1, 5, 50, 5),
(22, 'SN022', '9125005SN022', 'Control Sony TV', '2025-04-17 15:43:57', 2, 5, 50, 5),
(23, 'SN023', '9125005SN023', 'Control Samsung Smart', '2025-04-17 15:43:57', 1, 5, 50, 5),
(24, 'SN024', '9125005SN024', 'Control LG Magic', '2025-04-17 15:43:57', 2, 5, 50, 5),
(25, 'SN025', '9125005SN025', 'Control Philips HDMI', '2025-04-17 15:43:57', 1, 5, 50, 5),
(26, 'SN026', '9125001SN026', 'HP ProBook 450', '2025-04-17 15:43:57', 2, 1, 50, 5),
(27, 'SN027', '9125002SN027', 'Cámara Canon XA11', '2025-04-17 15:43:57', 1, 2, 50, 3),
(28, 'SN028', '9125003SN028', 'Micrófono Rode NT-USB', '2025-04-17 15:43:57', 2, 3, 50, 5),
(29, 'SN029', '9125004SN029', 'HDMI 1.4 5m', '2025-04-17 15:43:57', 1, 4, 50, 5),
(30, 'SN030', '9125005SN030', 'Control Panasonic TV', '2025-04-17 15:43:57', 2, 5, 50, 5),
(31, 'SN031', '9125001SN031', 'Dell Latitude 5420', '2025-04-17 15:46:40', 1, 1, 50, 3),
(32, 'SN032', '9125002SN032', 'Cámara Panasonic HC-X1500', '2025-04-17 15:46:40', 2, 2, 50, 5),
(33, 'SN033', '9125003SN033', 'Altavoz JBL EON 615', '2025-04-17 15:46:40', 1, 3, 50, 5),
(34, 'SN034', '9125004SN034', 'Cable USB 3.0 2m', '2025-04-17 15:46:40', 2, 4, 50, 5),
(35, 'SN035', '9125005SN035', 'Control Sony Blu-ray', '2025-04-17 15:46:40', 1, 5, 50, 5),
(36, 'SN036', '9125001SN036', 'MacBook Air M2', '2025-04-17 15:46:40', 2, 1, 50, 5),
(37, 'SN037', '9125002SN037', 'Trípode Gitzo GT3543', '2025-04-17 15:46:40', 1, 2, 50, 5),
(38, 'SN038', '9125003SN038', 'Micrófono Audio-Technica AT2020', '2025-04-17 15:46:40', 2, 3, 50, 5),
(39, 'SN039', '9125004SN039', 'Cable Optical Toslink 5m', '2025-04-17 15:46:40', 1, 4, 50, 5),
(40, 'SN040', '9125005SN040', 'Control LG Smart TV', '2025-04-17 15:46:40', 2, 5, 50, 5),
(41, 'SN041', '9125001SN041', 'Lenovo Yoga 920', '2025-04-17 15:46:40', 1, 1, 50, 5),
(42, 'SN042', '9125002SN042', 'Proyector BenQ HT3550', '2025-04-17 15:46:40', 2, 2, 50, 3),
(43, 'SN043', '9125003SN043', 'Interface Audio PreSonus 24c', '2025-04-17 15:46:40', 1, 3, 50, 5),
(44, 'SN044', '9125004SN044', 'Cable HDMI ARC 4m', '2025-04-17 15:46:40', 2, 4, 50, 5),
(45, 'SN045', '9125005SN045', 'Control Roku Ultra', '2025-04-17 15:46:40', 1, 5, 50, 5),
(46, 'SN046', '9125001SN046', 'Asus ZenBook 14', '2025-04-17 15:46:40', 2, 1, 50, 5),
(47, 'SN047', '9125002SN047', 'Grabadora Zoom H6', '2025-04-17 15:46:40', 1, 2, 50, 5),
(48, 'SN048', '9125003SN048', 'Audífonos Audio-Technica M50x', '2025-04-17 15:46:40', 2, 3, 50, 5),
(49, 'SN049', '9125004SN049', 'Cable VGA 3m con Conectores Dorados', '2025-04-17 15:46:40', 1, 4, 50, 5),
(50, 'SN050', '9125005SN050', 'Control Amazon Fire TV', '2025-04-17 15:46:40', 2, 5, 50, 5),
(51, 'SN051', '9125001SN051', 'Dell Latitude 5430', '2025-04-20 19:53:29', 1, 1, 55, 1),
(52, 'SN052', '9125001SN052', 'HP EliteBook 850 G8', '2025-04-20 19:53:29', 2, 1, 43, 1),
(53, 'SN053', '9125001SN053', 'Lenovo ThinkBook 14 G2', '2025-04-20 19:53:29', 1, 1, 57, 1),
(54, 'SN054', '9125001SN054', 'Asus VivoBook S14', '2025-04-20 19:53:29', 2, 1, 55, 1),
(55, 'SN055', '9125001SN055', 'Acer TravelMate P2', '2025-04-20 19:53:29', 1, 1, 43, 1),
(56, 'SN056', '9125001SN056', 'Microsoft Surface Laptop 5', '2025-04-20 19:53:29', 2, 1, 57, 1),
(57, 'SN057', '9125001SN057', 'Apple MacBook Pro M3', '2025-04-20 19:53:29', 1, 1, 55, 1),
(58, 'SN058', '9125001SN058', 'Samsung Galaxy Book3 Pro', '2025-04-20 19:53:29', 2, 1, 43, 1),
(59, 'SN059', '9125001SN059', 'LG Gram 17', '2025-04-20 19:53:29', 1, 1, 57, 1),
(60, 'SN060', '9125001SN060', 'Toshiba Dynabook Satellite Pro', '2025-04-20 19:53:29', 2, 1, 55, 1),
(61, 'SN061', '9125001SN061', 'MSI Modern 14 B11', '2025-04-20 19:53:29', 1, 1, 43, 1),
(62, 'SN062', '9125001SN062', 'Huawei MateBook D15', '2025-04-20 19:53:29', 2, 1, 57, 1),
(63, 'SN063', '9125001SN063', 'Chuwi HeroBook Pro', '2025-04-20 19:53:29', 1, 1, 55, 1),
(64, 'SN064', '9125001SN064', 'Gateway Ultra Slim Notebook', '2025-04-20 19:53:29', 2, 1, 43, 1),
(65, 'SN065', '9125001SN065', 'VAIO SX14', '2025-04-20 19:53:29', 1, 1, 57, 1),
(66, 'SN066', '9125001SN066', 'Alienware x14 R2', '2025-04-20 19:53:29', 2, 1, 55, 1),
(67, 'SN067', '9125001SN067', 'Razer Blade Stealth 13', '2025-04-20 19:53:29', 1, 1, 43, 1),
(68, 'SN068', '9125001SN068', 'Fujitsu Lifebook U7411', '2025-04-20 19:53:29', 2, 1, 57, 1),
(69, 'SN069', '9125001SN069', 'Panasonic Toughbook 55', '2025-04-20 19:53:29', 1, 1, 55, 1),
(70, 'SN070', '9125001SN070', 'HP Pavilion x360', '2025-04-20 19:53:29', 2, 1, 43, 1),
(71, 'SN071', '9125001SN071', 'Lenovo IdeaPad Flex 5', '2025-04-20 19:53:29', 1, 1, 57, 1),
(72, 'SN072', '9125001SN072', 'Dell XPS 13 Plus', '2025-04-20 19:53:29', 2, 1, 55, 1),
(73, 'SN073', '9125001SN073', 'Asus ROG Zephyrus G14', '2025-04-20 19:53:29', 1, 1, 43, 1),
(74, 'SN074', '9125001SN074', 'Acer Aspire 7', '2025-04-20 19:53:29', 2, 1, 57, 1),
(75, 'SN075', '9125001SN075', 'Samsung Notebook 9 Pro', '2025-04-20 19:53:29', 1, 1, 55, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estados`
--

CREATE TABLE `estados` (
  `id_estado` int(11) NOT NULL,
  `estado` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `estados`
--

INSERT INTO `estados` (`id_estado`, `estado`) VALUES
(1, 'Disponible'),
(2, 'Prestado'),
(3, 'Reservado'),
(4, 'Mantenimiento'),
(5, 'Almacén'),
(6, 'Formación');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fichas`
--

CREATE TABLE `fichas` (
  `id_ficha` int(11) NOT NULL,
  `codigo` varchar(50) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `id_sede` int(11) NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `fecha_creacion` timestamp NULL DEFAULT current_timestamp(),
  `estado` enum('activa','inactiva') DEFAULT 'activa'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `fichas`
--

INSERT INTO `fichas` (`id_ficha`, `codigo`, `descripcion`, `id_sede`, `fecha_inicio`, `fecha_fin`, `fecha_creacion`, `estado`) VALUES
(1, '1000001', 'Tecnología en Análisis y Desarrollo de Software', 1, '2024-01-15', '2024-12-15', '2025-03-24 23:26:50', 'inactiva'),
(2, '1000002', 'Técnico en Sistemas', 28, '2024-02-01', '2024-11-30', '2025-03-24 23:26:50', 'activa'),
(3, '1000003', 'Gestión Administrativa', 3, '2024-03-10', '2024-12-10', '2025-03-24 23:26:50', 'activa'),
(4, '1000004', 'Diseño e Integración de Multimedia', 27, '2024-04-05', '2025-03-05', '2025-03-24 23:26:50', 'activa'),
(5, '1000005', 'Producción Agropecuaria', 28, '2024-05-20', '2025-04-20', '2025-03-24 23:26:50', 'inactiva'),
(6, '1000006', 'Electricidad Industrial', 1, '2024-06-01', '2025-05-01', '2025-03-24 23:26:50', 'activa'),
(7, '1000007', 'Mecánica Automotriz', 2, '2024-07-15', '2025-06-15', '2025-03-24 23:26:50', 'activa'),
(8, '1000008', 'Contabilidad y Finanzas', 28, '2024-08-10', '2025-07-10', '2025-03-24 23:26:50', 'activa'),
(9, '1000009', 'Seguridad y Salud en el Trabajo', 27, '2024-09-05', '2025-08-05', '2025-03-24 23:26:50', 'inactiva'),
(10, '1000010', 'Redes y Telecomunicaciones', 28, '2024-10-20', '2025-09-20', '2025-03-24 23:26:50', 'activa'),
(11, '2847523', 'ADSO', 1, '2025-03-01', '2025-03-31', '2025-03-25 01:00:56', 'activa'),
(12, '1111', 'ADSO', 28, '2025-03-01', '2025-03-29', '2025-03-26 17:44:36', 'activa');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial_roles`
--

CREATE TABLE `historial_roles` (
  `id_historial` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_rol_anterior` int(11) DEFAULT NULL,
  `id_rol_nuevo` int(11) NOT NULL,
  `fecha_cambio` timestamp NULL DEFAULT current_timestamp(),
  `id_usuario_modificador` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modulos`
--

CREATE TABLE `modulos` (
  `id_modulo` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `fecha_creacion` timestamp NULL DEFAULT current_timestamp(),
  `estado` enum('activo','inactivo') DEFAULT 'activo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `modulos`
--

INSERT INTO `modulos` (`id_modulo`, `nombre`, `descripcion`, `fecha_creacion`, `estado`) VALUES
(1, 'Gestión de equipos', 'Módulo para administrar equipos tecnológicos', '2025-03-22 16:35:28', 'activo'),
(2, 'Gestión de solicitudes', 'Módulo para gestionar solicitudes y asignaciones de equipos', '2025-03-22 16:35:28', 'activo'),
(3, 'Devoluciones', 'Módulo para gestionar devoluciones de equipos', '2025-03-22 16:35:28', 'activo'),
(4, 'Salidas', 'Módulo para controlar salidas de equipos', '2025-03-22 16:35:28', 'activo'),
(5, 'Configuración', 'Módulo para configuración general del sistema', '2025-03-22 16:35:28', 'activo'),
(6, 'Autorizaciones', 'Módulo para la autorización de las solicitudes ', '2025-03-31 01:40:46', 'activo'),
(7, 'Fichas', 'Módulo para administrar las fichas', '2025-04-14 22:54:08', 'activo'),
(8, 'Sedes', 'Módulo para la administración de las sedes', '2025-04-16 17:00:23', 'activo'),
(9, 'Roles', 'Módulo para la administración de los roles del sistema', '2025-04-16 18:25:01', 'activo'),
(10, 'Módulos', 'Módulo para la administracion de los módulos del sistema (sólo administrador)', '2025-04-16 20:18:32', 'activo'),
(11, 'Permisos', 'Módulo para el control general de permisos a los roles del sistema', '2025-04-16 22:51:17', 'activo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permisos`
--

CREATE TABLE `permisos` (
  `id_permiso` int(11) NOT NULL,
  `id_modulo` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `fecha_creacion` timestamp NULL DEFAULT current_timestamp(),
  `estado` enum('activo','inactivo') DEFAULT 'activo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `permisos`
--

INSERT INTO `permisos` (`id_permiso`, `id_modulo`, `nombre`, `descripcion`, `fecha_creacion`, `estado`) VALUES
(1, 1, 'Registrar equipooooo', 'Crear nuevos equipos en el sistemas', '2025-03-22 16:35:28', 'activo'),
(2, 1, 'Consultar equipos', 'Consultar información de equipos', '2025-03-22 16:35:28', 'activo'),
(3, 1, 'Modificar equipos', 'Modificar información de equipos', '2025-03-22 16:35:28', 'activo'),
(4, 1, 'Inhabilitar equipos', 'Inhabilitar equipos', '2025-03-22 16:35:28', 'activo'),
(5, 1, 'Asignar equipos', 'Asignar equipos a cuentadantes', '2025-03-22 16:35:28', 'activo'),
(6, 1, 'Revisar equipos', 'Revisar el estado de los equipos', '2025-03-22 16:35:28', 'activo'),
(7, 2, 'Realizar solicitudes', 'Realizar solicitudes de préstamo', '2025-03-22 16:35:28', 'activo'),
(8, 2, 'Consultar equipos', 'Consultar información de equipos para solicitudes', '2025-03-22 16:35:28', 'activo'),
(9, 2, 'Cancelar solicitudes', 'Cancelar solicitudes', '2025-03-22 16:35:28', 'activo'),
(10, 2, 'Aprobar solicitudes', 'Aprobar solicitudes de préstamo', '2025-03-22 16:35:28', 'activo'),
(11, 2, 'Entregar equipos', 'Entregar equipos a los usuarios', '2025-03-22 16:35:28', 'activo'),
(12, 3, 'Recibir equipos', 'Registrar la devolución de equipos', '2025-03-22 16:35:28', 'activo'),
(13, 3, 'Consultar solicitudes', 'Consultar solicitudes relacionadas con devoluciones', '2025-03-22 16:35:28', 'activo'),
(14, 3, 'Revisar equipos', 'Revisar el estado de los equipos devueltos', '2025-03-22 16:35:28', 'activo'),
(15, 3, 'Actualizar estados', 'Actualizar el estado de los equipos', '2025-03-22 16:35:28', 'activo'),
(16, 4, 'Autorizar salidas', 'Autorizar salidas de equipos', '2025-03-22 16:35:28', 'activo'),
(17, 4, 'Verificar autorizaciones', 'Verificar autorizaciones de salida', '2025-03-22 16:35:28', 'activo'),
(18, 4, 'Consultar salidas', 'Consultar registros de salidas de equipos', '2025-03-22 16:35:28', 'activo'),
(19, 5, 'Configuraraciones ', 'Acceso a configuraciones del sistema', '2025-03-22 16:35:28', 'activo'),
(20, 5, 'Gestionar usuarios', 'Gestionar usuarios del sistema', '2025-03-22 16:35:28', 'activo'),
(21, 5, 'Gestionar roles', 'Gestionar roles y permisos', '2025-03-22 16:35:28', 'activo'),
(22, 7, 'Gestionar fichas', 'Gestionar las fichas del sistema', '2025-04-14 22:57:21', 'activo'),
(23, 8, 'Editar sedes', 'Realizar cambios en la información de las sedes', '2025-04-16 17:03:36', 'activo'),
(24, 8, 'Crear sedes', 'Crear nuevas sedes en el sistema', '2025-04-16 17:03:36', 'activo'),
(25, 8, 'Consultar sedes', 'Permite entrar a consultar las sedes del sistema', '2025-04-16 18:13:24', 'activo'),
(26, 9, 'Editar roles', 'Realizar cambios en la información de los roles del sistema', '2025-04-16 18:28:22', 'activo'),
(27, 9, 'Crear roles', 'Crear nuevos roles en el sistemas', '2025-04-16 18:28:22', 'activo'),
(28, 9, 'Consultar roles', 'Permite consultar los diferentes roles del sistema', '2025-04-16 18:28:22', 'activo'),
(29, 10, 'Gestión de módulos (solo administrador)', 'Este acceso implica código (no aparecera en permisos)', '2025-04-16 20:19:52', 'activo'),
(30, 11, 'Gestión de permisos', 'Permitir la gestión de los diferentes permisos asignados a los roles del sistema', '2025-04-16 22:56:43', 'activo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prestamos`
--

CREATE TABLE `prestamos` (
  `id_prestamo` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `tipo_prestamo` enum('Inmediato','Reservado') NOT NULL,
  `fecha_inicio` datetime NOT NULL,
  `fecha_fin` datetime NOT NULL,
  `estado_prestamo` enum('Prestado','Devuelto','Rechazado','Autorizado','Pendiente','Tramite') NOT NULL DEFAULT 'Prestado',
  `motivo` varchar(200) DEFAULT NULL,
  `fecha_solicitud` datetime DEFAULT current_timestamp(),
  `fecha_devolucion_real` datetime DEFAULT NULL,
  `prestamoscol` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `prestamos`
--

INSERT INTO `prestamos` (`id_prestamo`, `usuario_id`, `tipo_prestamo`, `fecha_inicio`, `fecha_fin`, `estado_prestamo`, `motivo`, `fecha_solicitud`, `fecha_devolucion_real`, `prestamoscol`) VALUES
(1, 72, 'Inmediato', '2025-04-18 09:00:00', '2025-04-18 17:00:00', 'Prestado', 'Clase de informática', '2025-04-18 14:50:08', NULL, NULL),
(2, 46, 'Reservado', '2025-04-22 08:00:00', '2025-04-24 18:00:00', 'Autorizado', 'Grabación de documental', '2025-04-18 15:35:27', NULL, NULL),
(4, 51, 'Reservado', '2025-05-05 10:00:00', '2025-05-07 16:00:00', 'Pendiente', 'Conferencia académica', '2025-04-18 15:39:20', NULL, NULL),
(5, 1, 'Inmediato', '2025-04-10 14:00:00', '2025-04-10 18:00:00', 'Devuelto', 'Reunión de trabajo', '2025-04-18 15:42:48', NULL, NULL),
(6, 1, 'Inmediato', '2025-04-10 14:00:00', '2025-04-10 18:00:00', 'Devuelto', 'Reunión de trabajo', '2025-04-18 15:43:07', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id_rol` int(11) NOT NULL,
  `nombre_rol` varchar(50) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `fecha_creacion` timestamp NULL DEFAULT current_timestamp(),
  `estado` enum('activo','inactivo') DEFAULT 'activo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id_rol`, `nombre_rol`, `descripcion`, `fecha_creacion`, `estado`) VALUES
(1, 'Líder TIC', 'Rol con acceso completo a todos los módulos y permisos', '2025-03-22 16:35:28', 'activo'),
(2, 'Mesa de ayuda', 'Rol con permisos limitados para atención de solicitudes', '2025-03-22 16:35:28', 'activo'),
(3, 'Almacén', 'Rol con permisos para gestionar equipos y solicitudes', '2025-03-22 16:35:28', 'activo'),
(4, 'Biblioteca', 'Rol con permisos para consultar equipos y gestionar solicitudes', '2025-03-22 16:35:28', 'activo'),
(5, 'Coordinación', 'Rol con permisos similares a adminBiblioteca', '2025-03-22 16:35:28', 'activo'),
(6, 'Aprendiz', 'Rol con permisos limitados para realizar solicitudes', '2025-03-22 16:35:28', 'activo'),
(7, 'Instructor', 'Rol con permisos para solicitudes y autorizar salidas', '2025-03-22 16:35:28', 'activo'),
(8, 'Vigilante', 'Rol con permisos para verificar autorizaciones', '2025-03-22 16:35:28', 'activo'),
(9, 'Administrador', 'Rol con acceso completo a todos los módulos y configuración', '2025-03-22 16:35:28', 'activo'),
(10, 'Auxiliar administrativo', 'permisos de coordinación pero limitados', '2025-03-29 18:46:36', 'activo'),
(11, 'auxiliar TIC', 'Dependiente de lider TIC', '2025-04-23 14:27:49', 'activo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol_permiso`
--

CREATE TABLE `rol_permiso` (
  `id_rol` int(11) NOT NULL,
  `id_permiso` int(11) NOT NULL,
  `fecha_asignacion` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `rol_permiso`
--

INSERT INTO `rol_permiso` (`id_rol`, `id_permiso`, `fecha_asignacion`) VALUES
(1, 1, '2025-04-16 20:26:02'),
(1, 2, '2025-04-16 20:26:02'),
(1, 3, '2025-04-16 20:26:02'),
(1, 4, '2025-04-16 20:26:02'),
(1, 5, '2025-04-16 20:26:02'),
(1, 6, '2025-04-16 20:26:02'),
(1, 7, '2025-04-16 20:26:02'),
(1, 8, '2025-04-16 20:26:02'),
(1, 9, '2025-04-16 20:26:02'),
(1, 10, '2025-04-16 20:26:02'),
(1, 11, '2025-04-16 20:26:02'),
(1, 12, '2025-04-16 20:26:02'),
(1, 13, '2025-04-16 20:26:02'),
(1, 14, '2025-04-16 20:26:02'),
(1, 15, '2025-04-16 20:26:02'),
(1, 16, '2025-04-16 20:26:02'),
(1, 17, '2025-04-16 20:26:02'),
(1, 18, '2025-04-16 20:26:02'),
(1, 19, '2025-04-16 20:26:02'),
(1, 20, '2025-04-16 20:26:02'),
(1, 21, '2025-04-16 20:26:02'),
(2, 2, '2025-04-16 18:15:44'),
(2, 6, '2025-04-16 18:15:44'),
(2, 12, '2025-04-16 18:15:44'),
(2, 14, '2025-04-16 18:15:44'),
(2, 15, '2025-04-16 18:15:44'),
(2, 25, '2025-04-16 18:15:44'),
(3, 1, '2025-03-22 16:35:28'),
(3, 2, '2025-03-22 16:35:28'),
(3, 3, '2025-03-22 16:35:28'),
(3, 4, '2025-03-22 16:35:28'),
(3, 5, '2025-03-22 16:35:28'),
(3, 7, '2025-03-22 16:35:28'),
(3, 8, '2025-03-22 16:35:28'),
(3, 9, '2025-03-22 16:35:28'),
(3, 10, '2025-03-22 16:35:28'),
(3, 11, '2025-03-22 16:35:28'),
(3, 12, '2025-03-22 16:35:28'),
(3, 13, '2025-03-22 16:35:28'),
(4, 2, '2025-03-22 16:35:28'),
(4, 7, '2025-03-22 16:35:28'),
(4, 8, '2025-03-22 16:35:28'),
(4, 9, '2025-03-22 16:35:28'),
(4, 10, '2025-03-22 16:35:28'),
(4, 11, '2025-03-22 16:35:28'),
(4, 12, '2025-03-22 16:35:28'),
(4, 13, '2025-03-22 16:35:28'),
(5, 2, '2025-03-22 16:35:28'),
(5, 7, '2025-03-22 16:35:28'),
(5, 8, '2025-03-22 16:35:28'),
(5, 9, '2025-03-22 16:35:28'),
(5, 10, '2025-03-22 16:35:28'),
(5, 11, '2025-03-22 16:35:28'),
(5, 12, '2025-03-22 16:35:28'),
(5, 13, '2025-03-22 16:35:28'),
(6, 7, '2025-03-22 16:35:28'),
(6, 8, '2025-03-22 16:35:28'),
(6, 9, '2025-03-22 16:35:28'),
(7, 7, '2025-03-22 16:35:28'),
(7, 8, '2025-03-22 16:35:28'),
(7, 9, '2025-03-22 16:35:28'),
(7, 16, '2025-03-22 16:35:28'),
(8, 17, '2025-04-23 14:25:43'),
(8, 18, '2025-04-23 14:25:43'),
(9, 1, '2025-04-21 20:17:57'),
(9, 2, '2025-04-21 20:17:57'),
(9, 3, '2025-04-21 20:17:57'),
(9, 4, '2025-04-21 20:17:57'),
(9, 5, '2025-04-21 20:17:57'),
(9, 6, '2025-04-21 20:17:57'),
(9, 7, '2025-04-21 20:17:57'),
(9, 8, '2025-04-21 20:17:57'),
(9, 9, '2025-04-21 20:17:57'),
(9, 10, '2025-04-21 20:17:57'),
(9, 11, '2025-04-21 20:17:57'),
(9, 12, '2025-04-21 20:17:57'),
(9, 13, '2025-04-21 20:17:57'),
(9, 14, '2025-04-21 20:17:57'),
(9, 15, '2025-04-21 20:17:57'),
(9, 16, '2025-04-21 20:17:57'),
(9, 17, '2025-04-21 20:17:57'),
(9, 18, '2025-04-21 20:17:57'),
(9, 19, '2025-04-21 20:17:57'),
(9, 20, '2025-04-21 20:17:57'),
(9, 21, '2025-04-21 20:17:57'),
(9, 22, '2025-04-21 20:17:57'),
(9, 23, '2025-04-21 20:17:57'),
(9, 24, '2025-04-21 20:17:57'),
(9, 25, '2025-04-21 20:17:57'),
(9, 26, '2025-04-21 20:17:57'),
(9, 27, '2025-04-21 20:17:57'),
(9, 28, '2025-04-21 20:17:57'),
(9, 29, '2025-04-21 20:17:57'),
(9, 30, '2025-04-21 20:17:57'),
(10, 18, '2025-04-13 21:51:43');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sedes`
--

CREATE TABLE `sedes` (
  `id_sede` int(11) NOT NULL,
  `nombre_sede` varchar(100) NOT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `fecha_creacion` timestamp NULL DEFAULT current_timestamp(),
  `estado` enum('activa','inactiva') DEFAULT 'activa'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `sedes`
--

INSERT INTO `sedes` (`id_sede`, `nombre_sede`, `direccion`, `descripcion`, `fecha_creacion`, `estado`) VALUES
(1, 'Sede Principal', 'Carrera 50 #10-25', 'Sede central con capacidad para 1000 aprendices', '2025-03-23 15:18:06', 'activa'),
(2, 'Sede Norte', 'Calle 80 #45-12', 'Sede especializada en tecnologías de la información', '2025-03-23 15:18:06', 'inactiva'),
(3, 'Sede Sur', 'Avenida 1 de Mayo #30-15', 'Sede con enfoque en áreas industriales', '2025-03-23 15:18:06', 'activa'),
(27, 'Sagrado', 'Cra 26 25', 'Horario de formacion en ambas jornadas', '2025-03-24 14:57:38', 'activa'),
(28, 'Bicentenario', 'CC Bicentenario Plazas', 'dos salones de 25 aprendices (202 y 205)', '2025-03-24 14:57:58', 'activa'),
(29, 'aa', 'aa', 'aa', '2025-04-04 20:56:06', 'activa');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ubicaciones`
--

CREATE TABLE `ubicaciones` (
  `ubicacion_id` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `id_sede` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ubicaciones`
--

INSERT INTO `ubicaciones` (`ubicacion_id`, `nombre`, `descripcion`, `id_sede`) VALUES
(1, 'Biblioteca Sagrado', 'Área de préstamo de equipos en el edificio de la biblioteca principal, piso 1', 27),
(2, 'Coordinacion Sagrado', 'Oficina de coordinación tecnológica del campus Sagrado Corazón', 27),
(3, 'Coordinacion Principal', 'Oficina central de gestión de equipos tecnológicos', 1),
(4, 'Almacen', 'Almacen principal', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `tipo_documento` varchar(5) NOT NULL,
  `numero_documento` varchar(30) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `correo_electronico` varchar(100) NOT NULL,
  `nombre_usuario` varchar(50) NOT NULL,
  `clave` varchar(255) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `genero` int(11) DEFAULT 3,
  `estado` enum('activo','inactivo') DEFAULT 'activo',
  `fecha_registro` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `tipo_documento`, `numero_documento`, `nombre`, `apellido`, `correo_electronico`, `nombre_usuario`, `clave`, `telefono`, `direccion`, `genero`, `estado`, `fecha_registro`) VALUES
(1, 'CC', '1', 'Admin', 'Sistema', 'admin@sistema.com', 'admin', 'clave123', NULL, NULL, 3, 'activo', '2025-03-22 16:35:28'),
(42, 'CC', '1023456789', 'Juan', 'Pérez', 'juan.perez@email.com', 'juanperez1', 'clave123', NULL, NULL, 3, 'activo', '2025-04-02 03:29:02'),
(43, 'TI', '1234567', 'María', 'Gómez', 'maria.gomez@email.com', 'mariagomez2', 'clave123', NULL, NULL, 3, 'activo', '2025-04-02 03:29:02'),
(44, 'CC', '1098765432', 'Carlos', 'López', 'carlos.lopez@email.com', 'carloslopez3', 'clave123', NULL, NULL, 3, 'inactivo', '2025-04-02 03:29:02'),
(45, 'TI', '7654321', 'Ana', 'Martínez', 'ana.martinez@email.com', 'anamartinez4', 'clave123', NULL, NULL, 3, 'activo', '2025-04-02 03:29:02'),
(46, 'CC', '1002345678', 'Pedro', 'Sánchez', 'pedro.sanchez@email.com', 'pedrosanchez5', 'clave123', NULL, NULL, 3, 'activo', '2025-04-02 03:29:02'),
(47, 'TI', '1122334', 'Laura', 'Fernández', 'laura.fernandez@email.com', 'laurafernandez6', 'clave123', NULL, NULL, 3, 'activo', '2025-04-02 03:29:02'),
(48, 'CC', '1034567890', 'Luis', 'Torres', 'luis.torres@email.com', 'luistorres7', 'clave123', NULL, NULL, 3, 'activo', '2025-04-02 03:29:02'),
(49, 'TI', '2233445', 'Sofía', 'Ramírez', 'sofia.ramirez@email.com', 'sofiaramirez8', 'clave123', NULL, NULL, 3, 'inactivo', '2025-04-02 03:29:02'),
(50, 'CC', '1045678901', 'Andrés', 'Vargas', 'andres.vargas@email.com', 'andresvargas9', 'clave123', NULL, NULL, 3, 'activo', '2025-04-02 03:29:02'),
(51, 'TI', '3344556', 'Elena', 'Hernández', 'elena.hernandez@email.com', 'elenahernandez10', 'clave123', NULL, NULL, 3, 'activo', '2025-04-02 03:29:02'),
(52, 'CC', '1056789012', 'Gabriel', 'Castro', 'gabriel.castro@email.com', 'gabrielcastro11', 'clave123', NULL, NULL, 3, 'activo', '2025-04-02 03:29:02'),
(53, 'TI', '4455667', 'Paula', 'Ortega', 'paula.ortega@email.com', 'paulaortega12', 'clave123', NULL, NULL, 3, 'activo', '2025-04-02 03:29:02'),
(54, 'CC', '1067890123', 'Ricardo', 'Molina', 'ricardo.molina@email.com', 'ricardomolina13', 'clave123', NULL, NULL, 3, 'activo', '2025-04-02 03:29:02'),
(55, 'TI', '5566778', 'Fernanda', 'Ruiz', 'fernanda.ruiz@email.com', 'fernandaruiz14', 'clave123', NULL, NULL, 3, 'activo', '2025-04-02 03:29:02'),
(56, 'CC', '1078901234', 'Hugo', 'Silva', 'hugo.silva@email.com', 'hugosilva15', 'clave123', NULL, NULL, 3, 'activo', '2025-04-02 03:29:02'),
(57, 'TI', '6677889', 'Isabel', 'Jiménez', 'isabel.jimenez@email.com', 'isabeljimenez16', 'clave123', NULL, NULL, 3, 'activo', '2025-04-02 03:29:02'),
(58, 'CC', '1089012345', 'José', 'Morales', 'jose.morales@email.com', 'josemorales17', 'clave123', NULL, NULL, 3, 'activo', '2025-04-02 03:29:02'),
(59, 'TI', '7788990', 'Natalia', 'Paredes', 'natalia.paredes@email.com', 'nataliaparedes18', 'clave123', NULL, NULL, 3, 'activo', '2025-04-02 03:29:02'),
(60, 'CC', '1090123456', 'Emilio', 'Guzmán', 'emilio.guzman@email.com', 'emilioguzman19', 'clave123', NULL, NULL, 3, 'activo', '2025-04-02 03:29:02'),
(61, 'TI', '8899001', 'Valeria', 'Díaz', 'valeria.diaz@email.com', 'valeriadiaz20', 'clave123', NULL, NULL, 3, 'activo', '2025-04-02 03:29:02'),
(71, 'CC', '75', 'German', 'Ramirez', 'test@example.us', '75', '75', '6019521325', 'calle 20 33a42', 2, 'activo', '2025-04-04 16:00:40'),
(72, 'CC', '1116', 'Alonso', 'Arboleda', 'teste@exemplo.us', '1116', '1116', '315', 'calle 20 33a42', 2, 'activo', '2025-04-04 16:16:32');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_rol`
--

CREATE TABLE `usuario_rol` (
  `id_usuario` int(11) NOT NULL,
  `id_rol` int(11) NOT NULL,
  `fecha_asignacion` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario_rol`
--

INSERT INTO `usuario_rol` (`id_usuario`, `id_rol`, `fecha_asignacion`) VALUES
(1, 9, '2025-03-22 16:35:28'),
(42, 2, '2025-04-04 17:26:54'),
(43, 5, '2025-04-04 17:26:54'),
(44, 6, '2025-04-04 17:26:54'),
(45, 8, '2025-04-04 17:26:54'),
(46, 9, '2025-04-04 17:26:54'),
(47, 7, '2025-04-04 17:26:54'),
(48, 10, '2025-04-04 17:26:54'),
(49, 8, '2025-04-04 17:26:54'),
(50, 3, '2025-04-04 17:26:54'),
(51, 9, '2025-04-04 17:26:54'),
(52, 2, '2025-04-04 17:26:54'),
(53, 1, '2025-04-04 17:26:54'),
(54, 8, '2025-04-04 17:26:54'),
(55, 4, '2025-04-04 17:26:54'),
(56, 8, '2025-04-04 17:26:54'),
(57, 5, '2025-04-04 17:26:54'),
(58, 9, '2025-04-04 17:26:54'),
(59, 10, '2025-04-04 17:26:54'),
(60, 6, '2025-04-04 17:26:54'),
(71, 7, '2025-04-04 16:00:40'),
(72, 6, '2025-04-04 16:16:32');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `aprendices_ficha`
--
ALTER TABLE `aprendices_ficha`
  ADD PRIMARY KEY (`id_aprendiz_ficha`),
  ADD UNIQUE KEY `unique_aprendiz_ficha` (`id_usuario`,`id_ficha`),
  ADD KEY `id_ficha` (`id_ficha`);

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`categoria_id`);

--
-- Indices de la tabla `detalle_prestamo`
--
ALTER TABLE `detalle_prestamo`
  ADD PRIMARY KEY (`cons_detalle`),
  ADD KEY `equipo_id` (`equipo_id`),
  ADD KEY `detalle_prestamo_ibfk_1` (`id_prestamo`);

--
-- Indices de la tabla `equipos`
--
ALTER TABLE `equipos`
  ADD PRIMARY KEY (`equipo_id`),
  ADD UNIQUE KEY `numero_serie` (`numero_serie`),
  ADD KEY `id_estado_idx` (`id_estado`),
  ADD KEY `ubicacion_id_idx` (`ubicacion_id`),
  ADD KEY `categoria_id_idx` (`categoria_id`),
  ADD KEY `cuentadante_id_idx` (`cuentadante_id`);

--
-- Indices de la tabla `estados`
--
ALTER TABLE `estados`
  ADD PRIMARY KEY (`id_estado`);

--
-- Indices de la tabla `fichas`
--
ALTER TABLE `fichas`
  ADD PRIMARY KEY (`id_ficha`),
  ADD UNIQUE KEY `codigo` (`codigo`),
  ADD KEY `id_sede` (`id_sede`);

--
-- Indices de la tabla `historial_roles`
--
ALTER TABLE `historial_roles`
  ADD PRIMARY KEY (`id_historial`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_rol_anterior` (`id_rol_anterior`),
  ADD KEY `id_rol_nuevo` (`id_rol_nuevo`),
  ADD KEY `id_usuario_modificador` (`id_usuario_modificador`);

--
-- Indices de la tabla `modulos`
--
ALTER TABLE `modulos`
  ADD PRIMARY KEY (`id_modulo`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `permisos`
--
ALTER TABLE `permisos`
  ADD PRIMARY KEY (`id_permiso`),
  ADD UNIQUE KEY `unique_permiso_modulo` (`id_modulo`,`nombre`);

--
-- Indices de la tabla `prestamos`
--
ALTER TABLE `prestamos`
  ADD PRIMARY KEY (`id_prestamo`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id_rol`),
  ADD UNIQUE KEY `nombre` (`nombre_rol`);

--
-- Indices de la tabla `rol_permiso`
--
ALTER TABLE `rol_permiso`
  ADD PRIMARY KEY (`id_rol`,`id_permiso`),
  ADD KEY `id_permiso` (`id_permiso`);

--
-- Indices de la tabla `sedes`
--
ALTER TABLE `sedes`
  ADD PRIMARY KEY (`id_sede`),
  ADD UNIQUE KEY `nombre_sede` (`nombre_sede`);

--
-- Indices de la tabla `ubicaciones`
--
ALTER TABLE `ubicaciones`
  ADD PRIMARY KEY (`ubicacion_id`),
  ADD KEY `id_sede` (`id_sede`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `nombre_usuario` (`nombre_usuario`),
  ADD UNIQUE KEY `numero_documento_UNIQUE` (`numero_documento`);

--
-- Indices de la tabla `usuario_rol`
--
ALTER TABLE `usuario_rol`
  ADD PRIMARY KEY (`id_usuario`),
  ADD KEY `id_rol` (`id_rol`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `aprendices_ficha`
--
ALTER TABLE `aprendices_ficha`
  MODIFY `id_aprendiz_ficha` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `categoria_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `detalle_prestamo`
--
ALTER TABLE `detalle_prestamo`
  MODIFY `cons_detalle` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `equipos`
--
ALTER TABLE `equipos`
  MODIFY `equipo_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT de la tabla `estados`
--
ALTER TABLE `estados`
  MODIFY `id_estado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `fichas`
--
ALTER TABLE `fichas`
  MODIFY `id_ficha` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `historial_roles`
--
ALTER TABLE `historial_roles`
  MODIFY `id_historial` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `modulos`
--
ALTER TABLE `modulos`
  MODIFY `id_modulo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `permisos`
--
ALTER TABLE `permisos`
  MODIFY `id_permiso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de la tabla `prestamos`
--
ALTER TABLE `prestamos`
  MODIFY `id_prestamo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id_rol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `sedes`
--
ALTER TABLE `sedes`
  MODIFY `id_sede` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de la tabla `ubicaciones`
--
ALTER TABLE `ubicaciones`
  MODIFY `ubicacion_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `aprendices_ficha`
--
ALTER TABLE `aprendices_ficha`
  ADD CONSTRAINT `aprendices_ficha_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`),
  ADD CONSTRAINT `aprendices_ficha_ibfk_2` FOREIGN KEY (`id_ficha`) REFERENCES `fichas` (`id_ficha`);

--
-- Filtros para la tabla `detalle_prestamo`
--
ALTER TABLE `detalle_prestamo`
  ADD CONSTRAINT `detalle_prestamo_ibfk_1` FOREIGN KEY (`id_prestamo`) REFERENCES `prestamos` (`id_prestamo`) ON DELETE CASCADE,
  ADD CONSTRAINT `detalle_prestamo_ibfk_2` FOREIGN KEY (`equipo_id`) REFERENCES `equipos` (`equipo_id`);

--
-- Filtros para la tabla `equipos`
--
ALTER TABLE `equipos`
  ADD CONSTRAINT `categoria_id` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`categoria_id`),
  ADD CONSTRAINT `cuentadante_id` FOREIGN KEY (`cuentadante_id`) REFERENCES `usuarios` (`id_usuario`),
  ADD CONSTRAINT `id_estado` FOREIGN KEY (`id_estado`) REFERENCES `estados` (`id_estado`),
  ADD CONSTRAINT `ubicacion_id` FOREIGN KEY (`ubicacion_id`) REFERENCES `ubicaciones` (`ubicacion_id`);

--
-- Filtros para la tabla `fichas`
--
ALTER TABLE `fichas`
  ADD CONSTRAINT `fichas_ibfk_1` FOREIGN KEY (`id_sede`) REFERENCES `sedes` (`id_sede`);

--
-- Filtros para la tabla `historial_roles`
--
ALTER TABLE `historial_roles`
  ADD CONSTRAINT `historial_roles_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`),
  ADD CONSTRAINT `historial_roles_ibfk_2` FOREIGN KEY (`id_rol_anterior`) REFERENCES `roles` (`id_rol`),
  ADD CONSTRAINT `historial_roles_ibfk_3` FOREIGN KEY (`id_rol_nuevo`) REFERENCES `roles` (`id_rol`),
  ADD CONSTRAINT `historial_roles_ibfk_4` FOREIGN KEY (`id_usuario_modificador`) REFERENCES `usuarios` (`id_usuario`);

--
-- Filtros para la tabla `permisos`
--
ALTER TABLE `permisos`
  ADD CONSTRAINT `permisos_ibfk_1` FOREIGN KEY (`id_modulo`) REFERENCES `modulos` (`id_modulo`);

--
-- Filtros para la tabla `prestamos`
--
ALTER TABLE `prestamos`
  ADD CONSTRAINT `prestamos_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id_usuario`);

--
-- Filtros para la tabla `rol_permiso`
--
ALTER TABLE `rol_permiso`
  ADD CONSTRAINT `rol_permiso_ibfk_1` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`id_rol`),
  ADD CONSTRAINT `rol_permiso_ibfk_2` FOREIGN KEY (`id_permiso`) REFERENCES `permisos` (`id_permiso`);

--
-- Filtros para la tabla `ubicaciones`
--
ALTER TABLE `ubicaciones`
  ADD CONSTRAINT `ubicaciones_ibfk_1` FOREIGN KEY (`id_sede`) REFERENCES `sedes` (`id_sede`);

--
-- Filtros para la tabla `usuario_rol`
--
ALTER TABLE `usuario_rol`
  ADD CONSTRAINT `usuario_rol_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`),
  ADD CONSTRAINT `usuario_rol_ibfk_2` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`id_rol`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
