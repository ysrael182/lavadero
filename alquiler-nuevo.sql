-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: db
-- Generation Time: Mar 24, 2023 at 01:42 AM
-- Server version: 8.0.32
-- PHP Version: 8.1.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `alquiler`
--

-- --------------------------------------------------------

--
-- Table structure for table `alquiler`
--

CREATE TABLE `alquiler` (
  `id` int NOT NULL,
  `id_cliente` int NOT NULL,
  `id_vehiculo` int NOT NULL,
  `num_dias` int NOT NULL,
  `precio_dia` decimal(10,2) NOT NULL,
  `abono` decimal(10,2) NOT NULL,
  `fecha_prestamo` date NOT NULL,
  `hora` time NOT NULL,
  `fecha_devolucion` date NOT NULL,
  `id_doc` int NOT NULL,
  `observacion` text,
  `estado` int NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `alquiler`
--

INSERT INTO `alquiler` (`id`, `id_cliente`, `id_vehiculo`, `num_dias`, `precio_dia`, `abono`, `fecha_prestamo`, `hora`, `fecha_devolucion`, `id_doc`, `observacion`, `estado`) VALUES
(1, 1, 1, 2, 20.00, 10.00, '2021-11-22', '16:32:26', '2021-11-24', 1, '', 0),
(2, 3, 2, 3, 50.00, 60.00, '2021-11-22', '16:44:31', '2021-11-25', 2, '', 1),
(3, 3, 3, 10, 10.00, 10.00, '2023-03-08', '21:32:18', '2023-03-24', 1, NULL, 1),
(4, 3, 3, 10, 2.00, 10.00, '2023-02-01', '21:33:55', '2023-02-02', 1, 'das', 1);

-- --------------------------------------------------------

--
-- Table structure for table `clientes`
--

CREATE TABLE `clientes` (
  `id` int NOT NULL,
  `dni` varchar(10) DEFAULT NULL,
  `nombre` varchar(100) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `direccion` text NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `estado` int NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `clientes`
--

INSERT INTO `clientes` (`id`, `dni`, `nombre`, `telefono`, `direccion`, `fecha`, `estado`) VALUES
(1, '978798789', 'ANGEL SIFUENTES', '97899789', 'LIMA', '2021-11-12 14:51:14', 1),
(2, '123456789', 'VIDA INFORMATICO', '798461378', 'LIMA - PERÚ', '2021-11-12 14:51:05', 1),
(3, '1234567', 'CLIENTE DE PRUEBA', '925491523', 'PERU', '2021-11-22 21:41:44', 1);

-- --------------------------------------------------------

--
-- Table structure for table `configuracion`
--

CREATE TABLE `configuracion` (
  `id` int NOT NULL,
  `ruc` varchar(20) NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `direccion` varchar(200) NOT NULL,
  `mensaje` text NOT NULL,
  `logo` varchar(10) NOT NULL,
  `moneda` int NOT NULL,
  `impuesto` int NOT NULL,
  `cant_factura` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `configuracion`
--

INSERT INTO `configuracion` (`id`, `ruc`, `nombre`, `telefono`, `correo`, `direccion`, `mensaje`, `logo`, `moneda`, `impuesto`, `cant_factura`) VALUES
(1, '12345678910', 'Vida Informático', '963852147', 'admin@angelsifuentes.com', 'LIMA PERU', 'GRACIAS POR SU PREFERENCIA', 'logo.png', 1, 18, 1000);

-- --------------------------------------------------------

--
-- Table structure for table `documentos`
--

CREATE TABLE `documentos` (
  `id` int NOT NULL,
  `documento` varchar(20) NOT NULL,
  `estado` int NOT NULL DEFAULT '1',
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `documentos`
--

INSERT INTO `documentos` (`id`, `documento`, `estado`, `fecha`) VALUES
(1, 'DNI', 1, '2021-11-11 16:43:11'),
(2, 'PASAPORTE', 1, '2021-11-12 14:02:04');

-- --------------------------------------------------------

--
-- Table structure for table `marcas`
--

CREATE TABLE `marcas` (
  `id` int NOT NULL,
  `marca` varchar(50) NOT NULL,
  `estado` int NOT NULL DEFAULT '1',
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `marcas`
--

INSERT INTO `marcas` (`id`, `marca`, `estado`, `fecha`) VALUES
(1, 'FERRARI', 1, '2021-11-11 18:45:57'),
(2, 'HONDA', 1, '2021-11-11 18:46:06'),
(3, 'NISAN', 1, '2021-11-11 18:46:19'),
(4, 'TOYOTA', 1, '2021-11-11 18:46:28'),
(5, 'VOLVO', 1, '2021-11-11 18:46:38'),
(6, 'SUZUKI', 1, '2021-11-11 18:46:53'),
(7, 'MORGAN', 1, '2021-11-11 18:47:22'),
(8, 'TESLA', 1, '2021-11-11 18:47:30');

-- --------------------------------------------------------

--
-- Table structure for table `moneda`
--

CREATE TABLE `moneda` (
  `id` int NOT NULL,
  `simbolo` varchar(10) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `estado` int NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `moneda`
--

INSERT INTO `moneda` (`id`, `simbolo`, `nombre`, `fecha`, `estado`) VALUES
(1, 'PEN', 'NUEVO SOLES', '2021-10-22 16:06:22', 1);

-- --------------------------------------------------------

--
-- Table structure for table `rol`
--

CREATE TABLE `rol` (
  `rolId` int NOT NULL,
  `nombre` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `rol`
--

INSERT INTO `rol` (`rolId`, `nombre`) VALUES
(1, 'ADMIN'),
(2, 'USER');

-- --------------------------------------------------------

--
-- Table structure for table `tipos`
--

CREATE TABLE `tipos` (
  `id` int NOT NULL,
  `tipo` varchar(50) NOT NULL,
  `estado` int NOT NULL DEFAULT '1',
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tipos`
--

INSERT INTO `tipos` (`id`, `tipo`, `estado`, `fecha`) VALUES
(1, 'CAMIONETA', 1, '2021-11-11 14:44:50'),
(2, 'MINI BAN', 1, '2021-11-11 14:46:20'),
(3, 'MOTOCICLETA', 1, '2021-11-11 18:48:32'),
(4, 'MOTO CARRO', 1, '2021-11-11 18:48:55'),
(5, 'TURISMO', 1, '2021-11-11 18:49:13'),
(6, 'CAMION', 1, '2021-11-11 18:49:21'),
(7, 'Furgón', 1, '2021-11-11 18:49:54');

-- --------------------------------------------------------

--
-- Table structure for table `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int NOT NULL,
  `usuario` varchar(20) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) DEFAULT NULL,
  `correo` varchar(80) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `perfil` varchar(50) NOT NULL DEFAULT 'avatar.svg',
  `clave` varchar(100) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `estado` int NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `usuarios`
--

INSERT INTO `usuarios` (`id`, `usuario`, `nombre`, `apellido`, `correo`, `telefono`, `direccion`, `perfil`, `clave`, `fecha`, `estado`) VALUES
(1, 'ADMIN', 'VIDA INFORMÁTICO', 'SITIO WEB DE EDUCACIÓN', 'admin@angelsifuentes.com', '925491523', 'HUARI - ANCASH', '20211110144339.jpg', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', '2021-11-10 19:43:39', 1),
(2, 'ADMIN2', 'ANGEL SIFUENTES', '', 'angel@gmail.com', '797987897', '', 'avatar.svg', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', '2023-03-23 23:30:51', 1),
(12, 'admin5', 'admin5', NULL, 'admin5@test.com', '4556', NULL, 'avatar.svg', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', '2023-03-24 00:39:36', 0);

-- --------------------------------------------------------

--
-- Table structure for table `usuario_rol`
--

CREATE TABLE `usuario_rol` (
  `id` int NOT NULL,
  `usuarioId` int NOT NULL,
  `rolId` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `usuario_rol`
--

INSERT INTO `usuario_rol` (`id`, `usuarioId`, `rolId`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 12, 1);

-- --------------------------------------------------------

--
-- Table structure for table `vehiculos`
--

CREATE TABLE `vehiculos` (
  `id` int NOT NULL,
  `placa` varchar(50) NOT NULL,
  `id_marca` int NOT NULL,
  `id_tipo` int NOT NULL,
  `modelo` varchar(50) NOT NULL,
  `foto` varchar(50) NOT NULL,
  `estado` int NOT NULL DEFAULT '1',
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `vehiculos`
--

INSERT INTO `vehiculos` (`id`, `placa`, `id_marca`, `id_tipo`, `modelo`, `foto`, `estado`, `fecha`) VALUES
(1, '79798987', 1, 1, 'X-47', '20211111102853.jpg', 1, '2021-11-22 21:34:40'),
(2, '7987798', 2, 4, '46564CFR', 'default.png', 2, '2021-11-22 21:44:58'),
(3, '78979', 4, 5, 'KI78', 'default.png', 1, '2021-11-22 21:32:18');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `alquiler`
--
ALTER TABLE `alquiler`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_cliente` (`id_cliente`),
  ADD KEY `id_vehiculo` (`id_vehiculo`),
  ADD KEY `id_doc` (`id_doc`);

--
-- Indexes for table `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `configuracion`
--
ALTER TABLE `configuracion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `moneda` (`moneda`);

--
-- Indexes for table `documentos`
--
ALTER TABLE `documentos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `marcas`
--
ALTER TABLE `marcas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `moneda`
--
ALTER TABLE `moneda`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`rolId`);

--
-- Indexes for table `tipos`
--
ALTER TABLE `tipos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `usuario_rol`
--
ALTER TABLE `usuario_rol`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_UsuarioId` (`usuarioId`),
  ADD KEY `FK_RolId` (`rolId`);

--
-- Indexes for table `vehiculos`
--
ALTER TABLE `vehiculos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_marca` (`id_marca`),
  ADD KEY `id_tipo` (`id_tipo`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `alquiler`
--
ALTER TABLE `alquiler`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `configuracion`
--
ALTER TABLE `configuracion`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `documentos`
--
ALTER TABLE `documentos`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `marcas`
--
ALTER TABLE `marcas`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `moneda`
--
ALTER TABLE `moneda`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tipos`
--
ALTER TABLE `tipos`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `usuario_rol`
--
ALTER TABLE `usuario_rol`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `vehiculos`
--
ALTER TABLE `vehiculos`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `alquiler`
--
ALTER TABLE `alquiler`
  ADD CONSTRAINT `alquiler_ibfk_1` FOREIGN KEY (`id_vehiculo`) REFERENCES `vehiculos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `alquiler_ibfk_2` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `alquiler_ibfk_3` FOREIGN KEY (`id_doc`) REFERENCES `documentos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `configuracion`
--
ALTER TABLE `configuracion`
  ADD CONSTRAINT `configuracion_ibfk_1` FOREIGN KEY (`moneda`) REFERENCES `moneda` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `usuario_rol`
--
ALTER TABLE `usuario_rol`
  ADD CONSTRAINT `FK_RolId` FOREIGN KEY (`rolId`) REFERENCES `rol` (`rolId`),
  ADD CONSTRAINT `FK_UsuarioId` FOREIGN KEY (`usuarioId`) REFERENCES `usuarios` (`id`);

--
-- Constraints for table `vehiculos`
--
ALTER TABLE `vehiculos`
  ADD CONSTRAINT `vehiculos_ibfk_1` FOREIGN KEY (`id_tipo`) REFERENCES `tipos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `vehiculos_ibfk_2` FOREIGN KEY (`id_marca`) REFERENCES `marcas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
