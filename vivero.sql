-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 25-06-2024 a las 03:40:09
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `vivero`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `accesorios`
--

CREATE TABLE `accesorios` (
  `id_accesorio` int(11) NOT NULL,
  `precio` decimal(10,0) NOT NULL,
  `unidades_stock` int(11) NOT NULL,
  `id_zona` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes_vip`
--

CREATE TABLE `clientes_vip` (
  `id_cliente` int(11) NOT NULL,
  `nombre` text NOT NULL,
  `apellido` text NOT NULL,
  `dni` int(11) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `direccion` varchar(20) NOT NULL,
  `fecha_incorporacion` datetime NOT NULL,
  `pedidos_realizados` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `decoraciones`
--

CREATE TABLE `decoraciones` (
  `id_decoracion` int(11) NOT NULL,
  `precio` decimal(10,0) NOT NULL,
  `unidades_stock` int(11) NOT NULL,
  `id_zona` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalles_pedidos`
--

CREATE TABLE `detalles_pedidos` (
  `id_pedido` int(11) NOT NULL,
  `precio_porte` decimal(10,0) NOT NULL,
  `fecha_realizacion` datetime NOT NULL,
  `unidades` int(11) NOT NULL,
  `descuento` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE `empleados` (
  `id_empleado` int(11) NOT NULL,
  `nombre` text NOT NULL,
  `apellido` text NOT NULL,
  `telefono` int(11) NOT NULL,
  `direccion` varchar(20) NOT NULL,
  `dni_empleado` int(11) NOT NULL,
  `turno_inicio` datetime NOT NULL,
  `turno_fin` datetime NOT NULL,
  `id_vivero` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial_empleados`
--

CREATE TABLE `historial_empleados` (
  `id_historial` int(11) NOT NULL,
  `id_empleado` int(11) NOT NULL,
  `id_zona` int(11) NOT NULL,
  `fecha_inicio` datetime NOT NULL,
  `fecha_fin` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `id_pedido` int(11) NOT NULL,
  `id_codigo_producto` int(11) NOT NULL,
  `id_empleado` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `id_vivero` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `plantas`
--

CREATE TABLE `plantas` (
  `id_planta` int(11) NOT NULL,
  `descrip_cuidado` varchar(255) NOT NULL,
  `id_zona` int(11) NOT NULL,
  `precio` decimal(10,0) NOT NULL,
  `unidades_stock` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id_codigo_producto` int(11) NOT NULL,
  `id_planta` int(11) NOT NULL,
  `id_accesorio` int(11) NOT NULL,
  `id_decoracion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `viveros`
--

CREATE TABLE `viveros` (
  `id_vivero` int(11) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `direccion` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `zonas`
--

CREATE TABLE `zonas` (
  `id_zona` int(11) NOT NULL,
  `id_vivero` int(11) NOT NULL,
  `nombre_zona` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `accesorios`
--
ALTER TABLE `accesorios`
  ADD PRIMARY KEY (`id_accesorio`),
  ADD KEY `accesorios_id_zona_zonas_id_zona` (`id_zona`);

--
-- Indices de la tabla `clientes_vip`
--
ALTER TABLE `clientes_vip`
  ADD PRIMARY KEY (`id_cliente`);

--
-- Indices de la tabla `decoraciones`
--
ALTER TABLE `decoraciones`
  ADD PRIMARY KEY (`id_decoracion`),
  ADD KEY `decoraciones_id_zona_zonas_id_zona` (`id_zona`);

--
-- Indices de la tabla `detalles_pedidos`
--
ALTER TABLE `detalles_pedidos`
  ADD PRIMARY KEY (`id_pedido`);

--
-- Indices de la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`id_empleado`),
  ADD KEY `empleados_id_vivero_viveros_id_vivero` (`id_vivero`);

--
-- Indices de la tabla `historial_empleados`
--
ALTER TABLE `historial_empleados`
  ADD PRIMARY KEY (`id_historial`),
  ADD KEY `historial_empleados_id_empleado_empleados_id_empleado` (`id_empleado`),
  ADD KEY `historial_empleados_id_zona_zonas_id_zona` (`id_zona`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD KEY `pedidos_id_pedido_detalles_pedidos_id_pedido` (`id_pedido`),
  ADD KEY `pedidos_id_codigo_producto_productos_id_codigo_producto` (`id_codigo_producto`),
  ADD KEY `pedidos_id_empleado_empleados_id_empleado` (`id_empleado`),
  ADD KEY `pedidos_id_cliente_clientes_vip_id_cliente` (`id_cliente`),
  ADD KEY `pedidos_id_vivero_viveros_id_vivero` (`id_vivero`);

--
-- Indices de la tabla `plantas`
--
ALTER TABLE `plantas`
  ADD PRIMARY KEY (`id_planta`),
  ADD KEY `plantas_id_zona_zonas_id_zona` (`id_zona`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id_codigo_producto`),
  ADD KEY `productos_id_planta_plantas_id_planta` (`id_planta`),
  ADD KEY `productos_id_accesorio_accesorios_id_accesorio` (`id_accesorio`),
  ADD KEY `productos_id_decoracion_decoraciones_id_decoracion` (`id_decoracion`);

--
-- Indices de la tabla `viveros`
--
ALTER TABLE `viveros`
  ADD PRIMARY KEY (`id_vivero`);

--
-- Indices de la tabla `zonas`
--
ALTER TABLE `zonas`
  ADD PRIMARY KEY (`id_zona`),
  ADD KEY `zonas_id_vivero_viveros_id_vivero` (`id_vivero`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `accesorios`
--
ALTER TABLE `accesorios`
  ADD CONSTRAINT `accesorios_id_zona_zonas_id_zona` FOREIGN KEY (`id_zona`) REFERENCES `zonas` (`id_zona`);

--
-- Filtros para la tabla `decoraciones`
--
ALTER TABLE `decoraciones`
  ADD CONSTRAINT `decoraciones_id_zona_zonas_id_zona` FOREIGN KEY (`id_zona`) REFERENCES `zonas` (`id_zona`);

--
-- Filtros para la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD CONSTRAINT `empleados_id_vivero_viveros_id_vivero` FOREIGN KEY (`id_vivero`) REFERENCES `viveros` (`id_vivero`);

--
-- Filtros para la tabla `historial_empleados`
--
ALTER TABLE `historial_empleados`
  ADD CONSTRAINT `historial_empleados_id_empleado_empleados_id_empleado` FOREIGN KEY (`id_empleado`) REFERENCES `empleados` (`id_empleado`),
  ADD CONSTRAINT `historial_empleados_id_zona_zonas_id_zona` FOREIGN KEY (`id_zona`) REFERENCES `zonas` (`id_zona`);

--
-- Filtros para la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `pedidos_id_cliente_clientes_vip_id_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `clientes_vip` (`id_cliente`),
  ADD CONSTRAINT `pedidos_id_codigo_producto_productos_id_codigo_producto` FOREIGN KEY (`id_codigo_producto`) REFERENCES `productos` (`id_codigo_producto`),
  ADD CONSTRAINT `pedidos_id_empleado_empleados_id_empleado` FOREIGN KEY (`id_empleado`) REFERENCES `empleados` (`id_empleado`),
  ADD CONSTRAINT `pedidos_id_pedido_detalles_pedidos_id_pedido` FOREIGN KEY (`id_pedido`) REFERENCES `detalles_pedidos` (`id_pedido`),
  ADD CONSTRAINT `pedidos_id_vivero_viveros_id_vivero` FOREIGN KEY (`id_vivero`) REFERENCES `viveros` (`id_vivero`);

--
-- Filtros para la tabla `plantas`
--
ALTER TABLE `plantas`
  ADD CONSTRAINT `plantas_id_zona_zonas_id_zona` FOREIGN KEY (`id_zona`) REFERENCES `zonas` (`id_zona`);

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_id_accesorio_accesorios_id_accesorio` FOREIGN KEY (`id_accesorio`) REFERENCES `accesorios` (`id_accesorio`),
  ADD CONSTRAINT `productos_id_decoracion_decoraciones_id_decoracion` FOREIGN KEY (`id_decoracion`) REFERENCES `decoraciones` (`id_decoracion`),
  ADD CONSTRAINT `productos_id_planta_plantas_id_planta` FOREIGN KEY (`id_planta`) REFERENCES `plantas` (`id_planta`);

--
-- Filtros para la tabla `zonas`
--
ALTER TABLE `zonas`
  ADD CONSTRAINT `zonas_id_vivero_viveros_id_vivero` FOREIGN KEY (`id_vivero`) REFERENCES `viveros` (`id_vivero`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
