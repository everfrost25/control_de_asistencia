-- ============================================================
-- Respaldo de Base de Datos
-- ============================================================

SET FOREIGN_KEY_CHECKS = 0;
SET SQL_MODE = 'NO_AUTO_VALUE_ON_ZERO';
SET NAMES utf8mb4;

-- ------------------------------------------------------------
-- Table: `configuracion`
-- ------------------------------------------------------------
DROP TABLE IF EXISTS `configuracion`;
CREATE TABLE `configuracion` (
  `clave` varchar(50) NOT NULL,
  `valor` text NOT NULL,
  PRIMARY KEY (`clave`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `configuracion` (`clave`, `valor`) VALUES
('regla_inasistencia', '30'),
('regla_riesgo', '20');

-- ------------------------------------------------------------
-- Table: `periodos_academicos`
-- ------------------------------------------------------------
DROP TABLE IF EXISTS `periodos_academicos`;
CREATE TABLE `periodos_academicos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `estado` enum('Activo','Cerrado') DEFAULT 'Activo',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `periodos_academicos` (`id`, `nombre`, `fecha_inicio`, `fecha_fin`, `estado`) VALUES
('1', '2026-I', '2026-03-01', '2026-07-31', 'Activo'),
('2', '2025-II', '2025-08-01', '2025-12-31', 'Cerrado');

-- ------------------------------------------------------------
-- Table: `programas`
-- ------------------------------------------------------------
DROP TABLE IF EXISTS `programas`;
CREATE TABLE `programas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(10) NOT NULL,
  `nombre` varchar(180) NOT NULL,
  `estado` enum('Activo','Inactivo') NOT NULL DEFAULT 'Activo',
  PRIMARY KEY (`id`),
  UNIQUE KEY `codigo` (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `programas` (`id`, `codigo`, `nombre`, `estado`) VALUES
('1', 'DSI', 'Desarrollo de Sistemas de Información', 'Activo'),
('2', 'CON', 'Contabilidad', 'Activo'),
('3', 'ENF', 'Enfermería Técnica', 'Activo');

-- ------------------------------------------------------------
-- Table: `respaldos`
-- ------------------------------------------------------------
DROP TABLE IF EXISTS `respaldos`;
CREATE TABLE `respaldos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` varchar(160) NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `tamanio` varchar(40) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `respaldos` (`id`, `usuario`, `fecha`, `hora`, `tamanio`) VALUES
('1', 'Admin Principal', '2026-07-21', '15:25:00', '20.5 KB');

-- ------------------------------------------------------------
-- Table: `usuarios`
-- ------------------------------------------------------------
DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(160) NOT NULL,
  `usuario` varchar(60) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `rol` enum('admin','docente','estudiante') NOT NULL,
  `estado` enum('Activo','Inactivo') NOT NULL DEFAULT 'Activo',
  `correo` varchar(160) NOT NULL,
  `telefono` varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `usuario` (`usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `usuarios` (`id`, `nombre`, `usuario`, `password_hash`, `rol`, `estado`, `correo`) VALUES
('1', 'Camila Laura Gil Navarro', 'admin', '$2y$10$t2Quf7g8BdaAV4leI5BCmuzWF4zp2TCPDFzvjyS7wv8jHllSPdp5S', 'admin', 'Activo', 'admin@institucion.edu.pe'),
('2', 'Lucía Camila Blanco Ramos', 'docente', '$2y$10$ACHYfkreOtxT7uBX/mN7QOeAfD4nZdSsjBnbxYQTSp3lBmfWE/x66', 'docente', 'Activo', 'docente@institucion.edu.pe'),
('3', 'Manuel Andrés Moreno Martínez', 'estudiante', '$2y$10$vQ1e9PCvLvOkTinw7btoWupFx.5YSjOyE/9ws3AUVGQHqsuy6JXWa', 'estudiante', 'Activo', 'estudiante@institucion.edu.pe'),
('9', 'Miguel Alejandro Muñoz Gómez', 'estudiante2', '$2y$10$MxiqjRRc30vqkO2V.nsFX.UiwLITXn5vdVxpzt1QM7PT18ql/geOi', 'estudiante', 'Activo', 'estudiante2@institucion.edu.pe'),
('10', 'Daniel Fernando Gutiérrez Ramos', 'estudiante3', '$2y$10$MxiqjRRc30vqkO2V.nsFX.UiwLITXn5vdVxpzt1QM7PT18ql/geOi', 'estudiante', 'Activo', 'estudiante3@institucion.edu.pe'),
('11', 'Juan Víctor Alonso Ramírez', 'estudiante4', '$2y$10$MxiqjRRc30vqkO2V.nsFX.UiwLITXn5vdVxpzt1QM7PT18ql/geOi', 'estudiante', 'Activo', 'estudiante4@institucion.edu.pe'),
('12', 'Camila Laura Jiménez Martínez', 'estudiante5', '$2y$10$MxiqjRRc30vqkO2V.nsFX.UiwLITXn5vdVxpzt1QM7PT18ql/geOi', 'estudiante', 'Activo', 'estudiante5@institucion.edu.pe'),
('13', 'Roberto Diego Díaz Domínguez', 'estudiante6', '$2y$10$MxiqjRRc30vqkO2V.nsFX.UiwLITXn5vdVxpzt1QM7PT18ql/geOi', 'estudiante', 'Activo', 'estudiante6@institucion.edu.pe'),
('14', 'Camila Rosa García Alonso', 'estudiante7', '$2y$10$MxiqjRRc30vqkO2V.nsFX.UiwLITXn5vdVxpzt1QM7PT18ql/geOi', 'estudiante', 'Activo', 'estudiante7@institucion.edu.pe'),
('15', 'Ana Claudia Sánchez García', 'estudiante8', '$2y$10$MxiqjRRc30vqkO2V.nsFX.UiwLITXn5vdVxpzt1QM7PT18ql/geOi', 'estudiante', 'Activo', 'estudiante8@institucion.edu.pe'),
('16', 'Marta Patricia Ramírez Díaz', 'estudiante9', '$2y$10$MxiqjRRc30vqkO2V.nsFX.UiwLITXn5vdVxpzt1QM7PT18ql/geOi', 'estudiante', 'Activo', 'estudiante9@institucion.edu.pe'),
('17', 'Andrés Fernando Navarro Álvarez', 'estudiante10', '$2y$10$MxiqjRRc30vqkO2V.nsFX.UiwLITXn5vdVxpzt1QM7PT18ql/geOi', 'estudiante', 'Activo', 'estudiante10@institucion.edu.pe'),
('18', 'Alejandro Fernando Romero Ruiz', 'estudiante11', '$2y$10$MxiqjRRc30vqkO2V.nsFX.UiwLITXn5vdVxpzt1QM7PT18ql/geOi', 'estudiante', 'Activo', 'estudiante11@institucion.edu.pe'),
('19', 'Sofía Paula Muñoz Ruiz', 'estudiante12', '$2y$10$MxiqjRRc30vqkO2V.nsFX.UiwLITXn5vdVxpzt1QM7PT18ql/geOi', 'estudiante', 'Activo', 'estudiante12@institucion.edu.pe'),
('20', 'Daniela María Pérez Alonso', 'estudiante13', '$2y$10$MxiqjRRc30vqkO2V.nsFX.UiwLITXn5vdVxpzt1QM7PT18ql/geOi', 'estudiante', 'Activo', 'estudiante13@institucion.edu.pe'),
('21', 'Paula Claudia Serrano Gil', 'estudiante14', '$2y$10$MxiqjRRc30vqkO2V.nsFX.UiwLITXn5vdVxpzt1QM7PT18ql/geOi', 'estudiante', 'Activo', 'estudiante14@institucion.edu.pe'),
('22', 'Laura Claudia Ramos Pérez', 'estudiante15', '$2y$10$MxiqjRRc30vqkO2V.nsFX.UiwLITXn5vdVxpzt1QM7PT18ql/geOi', 'estudiante', 'Activo', 'estudiante15@institucion.edu.pe'),
('23', 'Diego José Molina Ramos', 'estudiante16', '$2y$10$MxiqjRRc30vqkO2V.nsFX.UiwLITXn5vdVxpzt1QM7PT18ql/geOi', 'estudiante', 'Activo', 'estudiante16@institucion.edu.pe'),
('24', 'Camila María Alonso Muñoz', 'estudiante17', '$2y$10$MxiqjRRc30vqkO2V.nsFX.UiwLITXn5vdVxpzt1QM7PT18ql/geOi', 'estudiante', 'Activo', 'estudiante17@institucion.edu.pe'),
('25', 'Miguel Luis Molina Serrano', 'estudiante18', '$2y$10$MxiqjRRc30vqkO2V.nsFX.UiwLITXn5vdVxpzt1QM7PT18ql/geOi', 'estudiante', 'Activo', 'estudiante18@institucion.edu.pe'),
('26', 'David Andrés Ramos Vázquez', 'estudiante19', '$2y$10$MxiqjRRc30vqkO2V.nsFX.UiwLITXn5vdVxpzt1QM7PT18ql/geOi', 'estudiante', 'Activo', 'estudiante19@institucion.edu.pe'),
('27', 'Juan David Jiménez Gil', 'estudiante20', '$2y$10$MxiqjRRc30vqkO2V.nsFX.UiwLITXn5vdVxpzt1QM7PT18ql/geOi', 'estudiante', 'Activo', 'estudiante20@institucion.edu.pe'),
('28', 'Roberto Andrés Díaz López', 'estudiante21', '$2y$10$MxiqjRRc30vqkO2V.nsFX.UiwLITXn5vdVxpzt1QM7PT18ql/geOi', 'estudiante', 'Activo', 'estudiante21@institucion.edu.pe'),
('29', 'Andrés Roberto Muñoz Jiménez', 'estudiante22', '$2y$10$MxiqjRRc30vqkO2V.nsFX.UiwLITXn5vdVxpzt1QM7PT18ql/geOi', 'estudiante', 'Activo', 'estudiante22@institucion.edu.pe'),
('30', 'Luis José Navarro García', 'estudiante23', '$2y$10$MxiqjRRc30vqkO2V.nsFX.UiwLITXn5vdVxpzt1QM7PT18ql/geOi', 'estudiante', 'Activo', 'estudiante23@institucion.edu.pe'),
('31', 'Carlos Manuel Hernández Muñoz', 'estudiante24', '$2y$10$MxiqjRRc30vqkO2V.nsFX.UiwLITXn5vdVxpzt1QM7PT18ql/geOi', 'estudiante', 'Activo', 'estudiante24@institucion.edu.pe'),
('32', 'María Camila Hernández Domínguez', 'estudiante25', '$2y$10$MxiqjRRc30vqkO2V.nsFX.UiwLITXn5vdVxpzt1QM7PT18ql/geOi', 'estudiante', 'Activo', 'estudiante25@institucion.edu.pe'),
('33', 'Víctor Fernando Muñoz Fernández', 'estudiante26', '$2y$10$MxiqjRRc30vqkO2V.nsFX.UiwLITXn5vdVxpzt1QM7PT18ql/geOi', 'estudiante', 'Activo', 'estudiante26@institucion.edu.pe'),
('34', 'Manuel Juan Romero Serrano', 'docente002', '$2y$10$XOcRcceB/hDMgoYHdxhPK.3/C.eenjndjbRsy6OxH59T7s0Ho/jlC', 'docente', 'Activo', 'docente002@institucion.edu.pe'),
('35', 'Roberto Miguel Gutiérrez Martín', 'docente003', '$2y$10$XOcRcceB/hDMgoYHdxhPK.3/C.eenjndjbRsy6OxH59T7s0Ho/jlC', 'docente', 'Activo', 'docente003@institucion.edu.pe'),
('36', 'Carlos Andrés Díaz Blanco', 'docente004', '$2y$10$XOcRcceB/hDMgoYHdxhPK.3/C.eenjndjbRsy6OxH59T7s0Ho/jlC', 'docente', 'Activo', 'docente004@institucion.edu.pe'),
('37', 'Daniel Luis Vázquez Ramos', 'docente005', '$2y$10$XOcRcceB/hDMgoYHdxhPK.3/C.eenjndjbRsy6OxH59T7s0Ho/jlC', 'docente', 'Activo', 'docente005@institucion.edu.pe'),
('38', 'Daniel Luis Vázquez Navarro', 'docente006', '$2y$10$XOcRcceB/hDMgoYHdxhPK.3/C.eenjndjbRsy6OxH59T7s0Ho/jlC', 'docente', 'Activo', 'docente006@institucion.edu.pe'),
('39', 'Sofía Camila Gil Hernández', 'docente007', '$2y$10$XOcRcceB/hDMgoYHdxhPK.3/C.eenjndjbRsy6OxH59T7s0Ho/jlC', 'docente', 'Activo', 'docente007@institucion.edu.pe'),
('40', 'Paula Valeria Martín Álvarez', 'docente008', '$2y$10$XOcRcceB/hDMgoYHdxhPK.3/C.eenjndjbRsy6OxH59T7s0Ho/jlC', 'docente', 'Activo', 'docente008@institucion.edu.pe'),
('41', 'Valeria Camila Ruiz López', 'docente009', '$2y$10$XOcRcceB/hDMgoYHdxhPK.3/C.eenjndjbRsy6OxH59T7s0Ho/jlC', 'docente', 'Activo', 'docente009@institucion.edu.pe'),
('42', 'Juan Miguel Gil García', 'docente010', '$2y$10$XOcRcceB/hDMgoYHdxhPK.3/C.eenjndjbRsy6OxH59T7s0Ho/jlC', 'docente', 'Activo', 'docente010@institucion.edu.pe'),
('43', 'José Fernando Blanco Gómez', 'docente011', '$2y$10$XOcRcceB/hDMgoYHdxhPK.3/C.eenjndjbRsy6OxH59T7s0Ho/jlC', 'docente', 'Activo', 'docente011@institucion.edu.pe'),
('44', 'Patricia Elena López Romero', 'docente012', '$2y$10$XOcRcceB/hDMgoYHdxhPK.3/C.eenjndjbRsy6OxH59T7s0Ho/jlC', 'docente', 'Activo', 'docente012@institucion.edu.pe'),
('45', 'Alejandro José Domínguez Blanco', 'docente013', '$2y$10$XOcRcceB/hDMgoYHdxhPK.3/C.eenjndjbRsy6OxH59T7s0Ho/jlC', 'docente', 'Activo', 'docente013@institucion.edu.pe'),
('46', 'Ana Valeria Vázquez Hernández', 'docente014', '$2y$10$XOcRcceB/hDMgoYHdxhPK.3/C.eenjndjbRsy6OxH59T7s0Ho/jlC', 'docente', 'Activo', 'docente014@institucion.edu.pe'),
('47', 'Elena Patricia Rodríguez Domínguez', 'docente015', '$2y$10$XOcRcceB/hDMgoYHdxhPK.3/C.eenjndjbRsy6OxH59T7s0Ho/jlC', 'docente', 'Activo', 'docente015@institucion.edu.pe'),
('48', 'Alejandro Carlos Hernández Jiménez', 'docente016', '$2y$10$XOcRcceB/hDMgoYHdxhPK.3/C.eenjndjbRsy6OxH59T7s0Ho/jlC', 'docente', 'Activo', 'docente016@institucion.edu.pe'),
('49', 'Alejandro Jorge Martínez Díaz', 'docente017', '$2y$10$XOcRcceB/hDMgoYHdxhPK.3/C.eenjndjbRsy6OxH59T7s0Ho/jlC', 'docente', 'Activo', 'docente017@institucion.edu.pe'),
('50', 'Sofía Marta García Álvarez', 'docente018', '$2y$10$XOcRcceB/hDMgoYHdxhPK.3/C.eenjndjbRsy6OxH59T7s0Ho/jlC', 'docente', 'Activo', 'docente018@institucion.edu.pe'),
('51', 'Marta Lucía Gil Serrano', 'docente019', '$2y$10$XOcRcceB/hDMgoYHdxhPK.3/C.eenjndjbRsy6OxH59T7s0Ho/jlC', 'docente', 'Activo', 'docente019@institucion.edu.pe');

INSERT INTO `usuarios` (`id`, `nombre`, `usuario`, `password_hash`, `rol`, `estado`, `correo`, `telefono`) VALUES
('52', 'Samuel', 'samuel', '$2y$10$AZxrtL5lbnn8LH9AaOM4HeWFu74HCO4duL015C2lKA5QMf7GJ47a2', 'admin', 'Activo', 'samuel@institucion.edu.pe', '977193094'),
('53', 'Sugey', 'sugey', '$2y$10$QCzvqm2V/vlWNMGqsWgVBefaqn66FVROuTDrX5zbDIShklKNtEcXC', 'admin', 'Activo', 'sugey@institucion.edu.pe', '940039287'),
('54', 'Andre', 'andre', '$2y$10$6BAu1T5UfyfUl60yUa/.vOV1y2DobZRp3mcxeIFTm8Sz/3nwS67sK', 'admin', 'Activo', 'andre@institucion.edu.pe', '946591675'),
('55', 'Benjamin', 'benjamin', '$2y$10$8M97nIl3fEjS9ft8N65mder7U3DrfmmrJ62j09OH0dpoD7Xmsi5D2', 'admin', 'Activo', 'benjamin@institucion.edu.pe', '906802835'),
('56', 'Luis', 'luis', '$2y$10$wwLg9tC.dYv/gN9WiwtnbO4qnrBsyS8gn2aAjV8dlLgu1LBVs2.oe', 'docente', 'Activo', 'luis@institucion.edu.pe', '990912614');
-- ------------------------------------------------------------
-- Table: `modulos_formativos`
-- ------------------------------------------------------------
DROP TABLE IF EXISTS `modulos_formativos`;
CREATE TABLE `modulos_formativos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `programa_id` int(11) NOT NULL,
  `numero` int(11) NOT NULL,
  `nombre` varchar(220) NOT NULL,
  `estado` enum('Activo','Inactivo') NOT NULL DEFAULT 'Activo',
  PRIMARY KEY (`id`),
  KEY `programa_id` (`programa_id`),
  CONSTRAINT `modulos_formativos_ibfk_1` FOREIGN KEY (`programa_id`) REFERENCES `programas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `modulos_formativos` (`id`, `programa_id`, `numero`, `nombre`, `estado`) VALUES
('1', '1', '1', 'Módulo I - Desarrollo de Software y Gestión de Base de Datos', 'Activo'),
('2', '1', '2', 'Módulo II - Desarrollo de Soluciones y Aplicaciones', 'Activo'),
('3', '1', '3', 'Módulo III - Integración y Sistemas Empresariales', 'Activo'),
('4', '2', '1', 'Módulo I - Asistencia Contable', 'Activo'),
('5', '2', '2', 'Módulo II - Análisis Contable', 'Activo'),
('6', '2', '3', 'Módulo III - Gestión Financiera', 'Activo'),
('7', '3', '1', 'Módulo I - Promoción de la Salud', 'Activo'),
('8', '3', '2', 'Módulo II - Asistencia Hospitalaria', 'Activo'),
('9', '3', '3', 'Módulo III - Cuidados Especializados', 'Activo');

-- ------------------------------------------------------------
-- Table: `periodos_curriculares`
-- ------------------------------------------------------------
DROP TABLE IF EXISTS `periodos_curriculares`;
CREATE TABLE `periodos_curriculares` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `modulo_id` int(11) NOT NULL,
  `nombre` varchar(40) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `modulo_id` (`modulo_id`),
  CONSTRAINT `periodos_curriculares_ibfk_1` FOREIGN KEY (`modulo_id`) REFERENCES `modulos_formativos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `periodos_curriculares` (`id`, `modulo_id`, `nombre`) VALUES
('1', '1', 'I'),
('2', '1', 'II'),
('3', '2', 'III'),
('4', '2', 'IV'),
('5', '3', 'V'),
('6', '3', 'VI'),
('7', '4', 'I'),
('8', '4', 'II'),
('9', '5', 'III'),
('10', '5', 'IV'),
('11', '6', 'V'),
('12', '6', 'VI'),
('13', '7', 'I'),
('14', '7', 'II'),
('15', '8', 'III'),
('16', '8', 'IV'),
('17', '9', 'V'),
('18', '9', 'VI');

-- ------------------------------------------------------------
-- Table: `unidades_didacticas`
-- ------------------------------------------------------------
DROP TABLE IF EXISTS `unidades_didacticas`;
CREATE TABLE `unidades_didacticas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `periodo_curricular_id` int(11) NOT NULL,
  `nombre` varchar(180) NOT NULL,
  `estado` enum('Activo','Inactivo') NOT NULL DEFAULT 'Activo',
  PRIMARY KEY (`id`),
  KEY `periodo_curricular_id` (`periodo_curricular_id`),
  CONSTRAINT `unidades_didacticas_ibfk_1` FOREIGN KEY (`periodo_curricular_id`) REFERENCES `periodos_curriculares` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `unidades_didacticas` (`id`, `periodo_curricular_id`, `nombre`, `estado`) VALUES
('1', '1', 'Fundamentos de Programación', 'Activo'),
('2', '1', 'Arquitectura de Entornos Web', 'Activo'),
('3', '1', 'Interfaz Gráfica de Usuario', 'Activo'),
('4', '1', 'Tecnologías de Información y Comunicación', 'Activo'),
('5', '1', 'Mantenimiento de Equipos de Cómputo', 'Activo'),
('6', '2', 'Estructura de Datos y Programación Orientada a Objetos', 'Activo'),
('7', '2', 'Desarrollo de Entornos Web', 'Activo'),
('8', '2', 'Prototipos Web y Móviles', 'Activo'),
('9', '2', 'Sistemas de Información', 'Activo'),
('10', '2', 'Reparación de Equipos de Cómputo', 'Activo'),
('11', '3', 'Lenguaje de Programación Visual', 'Activo'),
('12', '3', 'Programación Web', 'Activo'),
('13', '3', 'Base de Datos', 'Activo'),
('14', '3', 'Análisis y Diseño de Sistemas', 'Activo'),
('15', '3', 'Diseño de Redes de Comunicación', 'Activo'),
('16', '4', 'Programación Distribuida', 'Activo'),
('17', '4', 'Aplicaciones Web', 'Activo'),
('18', '4', 'Administración de Base de Datos', 'Activo'),
('19', '4', 'Seguridad de la Información', 'Activo'),
('20', '4', 'Configuración de Redes de Comunicación', 'Activo'),
('21', '5', 'Diseño de Aplicaciones Móviles', 'Activo'),
('22', '5', 'Desarrollo de Soluciones Web', 'Activo'),
('23', '5', 'Desarrollo de Proyecto TI', 'Activo'),
('24', '5', 'Calidad de Software', 'Activo'),
('25', '5', 'Marketing Digital', 'Activo'),
('26', '6', 'Desarrollo de Aplicaciones Móviles', 'Activo'),
('27', '6', 'Integración de Sistemas Empresariales', 'Activo'),
('28', '6', 'Desarrollo de Sistemas de Información', 'Activo'),
('29', '6', 'Sistema de Gestión de Contenidos', 'Activo'),
('30', '7', 'Principios Contables', 'Activo'),
('31', '7', 'Documentación Comercial y Contable', 'Activo'),
('32', '7', 'Legislación Tributaria', 'Activo'),
('33', '7', 'Registro de Libros Principales', 'Activo'),
('34', '8', 'Administración General', 'Activo'),
('35', '8', 'Legislación Mercantil y Societaria', 'Activo'),
('36', '8', 'Legislación Laboral', 'Activo'),
('37', '8', 'Registro de Libros Auxiliares', 'Activo'),
('38', '8', 'Planeamiento Estratégico', 'Activo'),
('39', '9', 'Calculo Financiero', 'Activo'),
('40', '9', 'Tributación y Tratamiento Contable', 'Activo'),
('41', '9', 'Contabilidad de Sociedades Mercantiles', 'Activo'),
('42', '9', 'Sistemas Administrativos del Sector Público', 'Activo'),
('43', '9', 'Técnica Presupuestal', 'Activo'),
('44', '10', 'Supervisión de Operadores Contables', 'Activo'),
('45', '10', 'Contabilidad de Costos', 'Activo'),
('46', '10', 'Contabilidad Gubernamental', 'Activo'),
('47', '10', 'Aplicativos Informáticos Contables', 'Activo'),
('48', '10', 'Planeamiento y Control Financiero', 'Activo'),
('49', '11', 'Formulación de Estados Financieros', 'Activo'),
('50', '11', 'Contabilidad de Entidades Financieras', 'Activo'),
('51', '11', 'Procesos de Auditoria', 'Activo'),
('52', '11', 'Análisis Estadístico Contable', 'Activo'),
('53', '11', 'Gestión Financiera', 'Activo'),
('54', '12', 'Finanzas Empresariales', 'Activo'),
('55', '12', 'Auditoria Tributaria', 'Activo'),
('56', '12', 'Análisis e Interpretación de los Estados Financieros', 'Activo'),
('57', '12', 'Formulación y Evaluación de Proyectos', 'Activo'),
('58', '13', 'Anatomía y Fisiología Humana', 'Activo'),
('59', '13', 'Primeros Auxilios', 'Activo'),
('60', '13', 'Epidemiología', 'Activo'),
('61', '13', 'Educación para la Salud', 'Activo'),
('62', '13', 'Salud en Desastres Naturales', 'Activo'),
('63', '14', 'Salud Comunitaria', 'Activo'),
('64', '14', 'Inmunizaciones', 'Activo'),
('65', '14', 'Salud Pública', 'Activo'),
('66', '14', 'Matemática Aplicada a la salud', 'Activo'),
('67', '14', 'Salud Ocupacional', 'Activo'),
('68', '15', 'Documentación en Salud', 'Activo'),
('69', '15', 'Bioseguridad en Salud', 'Activo'),
('70', '15', 'Básica Hospitalaria', 'Activo'),
('71', '15', 'Patología', 'Activo'),
('72', '16', 'Muestras Biológicas', 'Activo'),
('73', '16', 'Procedimientos Invasivos y no Invasivos', 'Activo'),
('74', '16', 'Nutrición y Dietas', 'Activo'),
('75', '16', 'Administración de Medicamentos', 'Activo'),
('76', '17', 'Salud Materna', 'Activo'),
('77', '17', 'Salud Mental', 'Activo'),
('78', '17', 'Médico Quirúrgico', 'Activo'),
('79', '17', 'Adulto Mayor', 'Activo'),
('80', '18', 'Salud del Niño y Adolescente', 'Activo'),
('81', '18', 'Medicina Alternativa', 'Activo'),
('82', '18', 'Fisioterapia y Rehabilitación', 'Activo'),
('83', '18', 'Salud Bucal', 'Activo');

-- ------------------------------------------------------------
-- Table: `docentes`
-- ------------------------------------------------------------
DROP TABLE IF EXISTS `docentes`;
CREATE TABLE `docentes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(30) NOT NULL,
  `nombres` varchar(160) NOT NULL,
  `dni` varchar(20) NOT NULL,
  `correo` varchar(160) NOT NULL,
  `programa_id` int(11) DEFAULT NULL,
  `unidad_didactica_id` int(11) DEFAULT NULL,
  `seccion` varchar(20) NOT NULL,
  `usuario` varchar(60) NOT NULL,
  `estado` enum('Activo','Inactivo') NOT NULL DEFAULT 'Activo',
  PRIMARY KEY (`id`),
  UNIQUE KEY `codigo` (`codigo`),
  KEY `fk_docentes_programa` (`programa_id`),
  KEY `fk_docentes_unidad` (`unidad_didactica_id`),
  CONSTRAINT `fk_docentes_programa` FOREIGN KEY (`programa_id`) REFERENCES `programas` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_docentes_unidad` FOREIGN KEY (`unidad_didactica_id`) REFERENCES `unidades_didacticas` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `docentes` (`id`, `codigo`, `nombres`, `dni`, `correo`, `programa_id`, `unidad_didactica_id`, `seccion`, `usuario`, `estado`) VALUES
('1', 'DOC-001', 'Lucía Camila Blanco Ramos', '24584986', 'docente@institucion.edu.pe', '1', '1', 'A', 'docente', 'Activo'),
('7', 'DOC-002', 'Manuel Juan Romero Serrano', '35399296', 'docente002@institucion.edu.pe', '1', '1', 'A', 'docente002', 'Activo'),
('8', 'DOC-003', 'Roberto Miguel Gutiérrez Martín', '88976726', 'docente003@institucion.edu.pe', '1', '1', 'A', 'docente003', 'Activo'),
('9', 'DOC-004', 'Carlos Andrés Díaz Blanco', '87954318', 'docente004@institucion.edu.pe', '1', '2', 'A', 'docente004', 'Activo'),
('10', 'DOC-005', 'Daniel Luis Vázquez Ramos', '42268841', 'docente005@institucion.edu.pe', '1', '2', 'A', 'docente005', 'Activo'),
('11', 'DOC-006', 'Daniel Luis Vázquez Navarro', '40229680', 'docente006@institucion.edu.pe', '1', '3', 'A', 'docente006', 'Activo'),
('12', 'DOC-007', 'Sofía Camila Gil Hernández', '75952267', 'docente007@institucion.edu.pe', '1', '3', 'A', 'docente007', 'Activo'),
('13', 'DOC-008', 'Paula Valeria Martín Álvarez', '38828230', 'docente008@institucion.edu.pe', '2', '30', 'A', 'docente008', 'Activo'),
('14', 'DOC-009', 'Valeria Camila Ruiz López', '16565604', 'docente009@institucion.edu.pe', '2', '30', 'A', 'docente009', 'Activo'),
('15', 'DOC-010', 'Juan Miguel Gil García', '20825641', 'docente010@institucion.edu.pe', '2', '31', 'A', 'docente010', 'Activo'),
('16', 'DOC-011', 'José Fernando Blanco Gómez', '94127643', 'docente011@institucion.edu.pe', '2', '31', 'A', 'docente011', 'Activo'),
('17', 'DOC-012', 'Patricia Elena López Romero', '37563597', 'docente012@institucion.edu.pe', '2', '32', 'A', 'docente012', 'Activo'),
('18', 'DOC-013', 'Alejandro José Domínguez Blanco', '52685177', 'docente013@institucion.edu.pe', '2', '32', 'A', 'docente013', 'Activo'),
('19', 'DOC-014', 'Ana Valeria Vázquez Hernández', '58884550', 'docente014@institucion.edu.pe', '3', '58', 'A', 'docente014', 'Activo'),
('20', 'DOC-015', 'Elena Patricia Rodríguez Domínguez', '59916864', 'docente015@institucion.edu.pe', '3', '58', 'A', 'docente015', 'Activo'),
('21', 'DOC-016', 'Alejandro Carlos Hernández Jiménez', '76336080', 'docente016@institucion.edu.pe', '3', '59', 'A', 'docente016', 'Activo'),
('22', 'DOC-017', 'Alejandro Jorge Martínez Díaz', '22464949', 'docente017@institucion.edu.pe', '3', '59', 'A', 'docente017', 'Activo'),
('23', 'DOC-018', 'Sofía Marta García Álvarez', '70936390', 'docente018@institucion.edu.pe', '3', '60', 'A', 'docente018', 'Activo'),
('24', 'DOC-019', 'Marta Lucía Gil Serrano', '16053054', 'docente019@institucion.edu.pe', '3', '60', 'A', 'docente019', 'Activo');

-- ------------------------------------------------------------
-- Table: `estudiantes`
-- ------------------------------------------------------------
DROP TABLE IF EXISTS `estudiantes`;
CREATE TABLE `estudiantes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(30) NOT NULL,
  `dni` varchar(20) NOT NULL,
  `nombres` varchar(160) NOT NULL,
  `programa_id` int(11) DEFAULT NULL,
  `periodo_curricular_id` int(11) DEFAULT NULL,
  `unidad_didactica_id` int(11) DEFAULT NULL,
  `seccion` varchar(10) NOT NULL,
  `total_sesiones` int(11) NOT NULL DEFAULT 0,
  `inasistencias` int(11) NOT NULL DEFAULT 0,
  `estado` enum('Activo','En riesgo','Inhabilitado') NOT NULL DEFAULT 'Activo',
  PRIMARY KEY (`id`),
  UNIQUE KEY `codigo` (`codigo`),
  KEY `fk_estudiantes_programa` (`programa_id`),
  KEY `fk_estudiantes_periodo` (`periodo_curricular_id`),
  KEY `fk_estudiantes_unidad` (`unidad_didactica_id`),
  KEY `idx_estudiantes_programa` (`programa_id`,`periodo_curricular_id`),
  CONSTRAINT `fk_estudiantes_periodo` FOREIGN KEY (`periodo_curricular_id`) REFERENCES `periodos_curriculares` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_estudiantes_programa` FOREIGN KEY (`programa_id`) REFERENCES `programas` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_estudiantes_unidad` FOREIGN KEY (`unidad_didactica_id`) REFERENCES `unidades_didacticas` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `estudiantes` (`id`, `codigo`, `dni`, `nombres`, `programa_id`, `periodo_curricular_id`, `unidad_didactica_id`, `seccion`, `total_sesiones`, `inasistencias`, `estado`) VALUES
('1', 'EST-001', '77564676', 'Manuel Andrés Moreno Martínez', '1', '1', '1', 'A', '10', '1', 'Activo'),
('2', 'EST-002', '71540483', 'Miguel Alejandro Muñoz Gómez', '1', '1', '1', 'A', '10', '1', 'Activo'),
('3', 'EST-003', '29710119', 'Daniel Fernando Gutiérrez Ramos', '1', '1', '1', 'A', '10', '1', 'Activo'),
('4', 'EST-004', '42065644', 'Juan Víctor Alonso Ramírez', '1', '1', '1', 'A', '10', '2', 'En riesgo'),
('5', 'EST-005', '51394257', 'Camila Laura Jiménez Martínez', '1', '1', '1', 'A', '10', '2', 'En riesgo'),
('6', 'EST-006', '94235650', 'Roberto Diego Díaz Domínguez', '1', '1', '1', 'A', '10', '1', 'Activo'),
('7', 'EST-007', '61449265', 'Camila Rosa García Alonso', '1', '1', '1', 'A', '10', '0', 'Activo'),
('8', 'EST-008', '86161043', 'Ana Claudia Sánchez García', '1', '1', '1', 'A', '10', '2', 'En riesgo'),
('9', 'EST-009', '86390228', 'Marta Patricia Ramírez Díaz', '1', '1', '1', 'A', '10', '1', 'Activo'),
('10', 'EST-010', '60128704', 'Andrés Fernando Navarro Álvarez', '1', '1', '1', 'A', '10', '0', 'Activo'),
('11', 'EST-011', '20508535', 'Alejandro Fernando Romero Ruiz', '1', '1', '1', 'A', '10', '2', 'En riesgo'),
('12', 'EST-012', '25707902', 'Sofía Paula Muñoz Ruiz', '1', '1', '1', 'A', '10', '1', 'Activo'),
('13', 'EST-013', '39675464', 'Daniela María Pérez Alonso', '1', '1', '1', 'A', '10', '2', 'En riesgo'),
('14', 'EST-014', '86294876', 'Paula Claudia Serrano Gil', '1', '1', '1', 'A', '10', '0', 'Activo'),
('15', 'EST-015', '48994548', 'Laura Claudia Ramos Pérez', '1', '1', '1', 'A', '10', '1', 'Activo'),
('16', 'EST-016', '79443425', 'Diego José Molina Ramos', '1', '1', '1', 'A', '10', '1', 'Activo'),
('17', 'EST-017', '70609539', 'Camila María Alonso Muñoz', '1', '1', '1', 'A', '10', '1', 'Activo'),
('18', 'EST-018', '67104637', 'Miguel Luis Molina Serrano', '1', '1', '1', 'A', '10', '1', 'Activo'),
('19', 'EST-019', '76184221', 'David Andrés Ramos Vázquez', '1', '1', '1', 'A', '10', '0', 'Activo'),
('20', 'EST-020', '99612128', 'Juan David Jiménez Gil', '1', '1', '1', 'A', '10', '1', 'Activo'),
('21', 'EST-021', '50736421', 'Roberto Andrés Díaz López', '1', '1', '1', 'A', '10', '2', 'En riesgo'),
('22', 'EST-022', '66145368', 'Andrés Roberto Muñoz Jiménez', '1', '1', '1', 'A', '10', '1', 'Activo'),
('23', 'EST-023', '91163053', 'Luis José Navarro García', '1', '1', '1', 'A', '10', '0', 'Activo'),
('24', 'EST-024', '32635459', 'Carlos Manuel Hernández Muñoz', '1', '1', '1', 'A', '10', '3', 'Inhabilitado'),
('25', 'EST-025', '96320624', 'María Camila Hernández Domínguez', '1', '1', '1', 'A', '10', '1', 'Activo'),
('26', 'EST-026', '28922781', 'Víctor Fernando Muñoz Fernández', '1', '1', '1', 'A', '10', '2', 'En riesgo');

-- ------------------------------------------------------------
-- Table: `sesiones`
-- ------------------------------------------------------------
DROP TABLE IF EXISTS `sesiones`;
CREATE TABLE `sesiones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `programa_id` int(11) DEFAULT NULL,
  `unidad_didactica_id` int(11) DEFAULT NULL,
  `seccion` varchar(20) NOT NULL,
  `docente_id` int(11) DEFAULT NULL,
  `periodo` varchar(20) NOT NULL DEFAULT '2026-I',
  `estado` enum('Pendiente','Registrada','Cerrada') NOT NULL DEFAULT 'Pendiente',
  PRIMARY KEY (`id`),
  KEY `fk_sesiones_docente` (`docente_id`),
  KEY `fk_sesiones_programa` (`programa_id`),
  KEY `fk_sesiones_unidad` (`unidad_didactica_id`),
  KEY `idx_sesiones_fecha_hora` (`fecha`,`hora`),
  CONSTRAINT `fk_sesiones_docente` FOREIGN KEY (`docente_id`) REFERENCES `docentes` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_sesiones_programa` FOREIGN KEY (`programa_id`) REFERENCES `programas` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_sesiones_unidad` FOREIGN KEY (`unidad_didactica_id`) REFERENCES `unidades_didacticas` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `sesiones` (`id`, `fecha`, `hora`, `programa_id`, `unidad_didactica_id`, `seccion`, `docente_id`, `periodo`, `estado`) VALUES
('1', '2026-07-16', '08:00:00', '1', '1', 'A', '1', '2026-I', 'Cerrada'),
('2', '2026-07-17', '08:00:00', '1', '1', 'A', '1', '2026-I', 'Cerrada'),
('3', '2026-07-18', '08:00:00', '1', '1', 'A', '1', '2026-I', 'Cerrada'),
('4', '2026-07-19', '08:00:00', '1', '1', 'A', '1', '2026-I', 'Cerrada'),
('5', '2026-07-20', '08:00:00', '1', '1', 'A', '1', '2026-I', 'Cerrada'),
('6', '2026-07-21', '08:00:00', '1', '1', 'A', '1', '2026-I', 'Cerrada'),
('7', '2026-07-22', '08:00:00', '1', '1', 'A', '1', '2026-I', 'Cerrada'),
('8', '2026-07-23', '08:00:00', '1', '1', 'A', '1', '2026-I', 'Cerrada'),
('9', '2026-07-24', '08:00:00', '1', '1', 'A', '1', '2026-I', 'Cerrada'),
('10', '2026-07-25', '08:00:00', '1', '1', 'A', '1', '2026-I', 'Cerrada');

-- ------------------------------------------------------------
-- Table: `asistencia_docentes`
-- ------------------------------------------------------------
DROP TABLE IF EXISTS `asistencia_docentes`;
CREATE TABLE `asistencia_docentes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `docente_id` int(11) NOT NULL,
  `sesion_id` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `hora_ingreso` time NOT NULL,
  `estado` enum('Presente','Inasistente','Tardanza','Justificado') NOT NULL,
  `registrado_por` varchar(160) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_asistencia_docente_sesion` (`docente_id`,`sesion_id`),
  KEY `docente_id` (`docente_id`),
  KEY `sesion_id` (`sesion_id`),
  CONSTRAINT `asistencia_docentes_ibfk_1` FOREIGN KEY (`docente_id`) REFERENCES `docentes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `asistencia_docentes_ibfk_2` FOREIGN KEY (`sesion_id`) REFERENCES `sesiones` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `asistencia_docentes` (`id`, `docente_id`, `sesion_id`, `fecha`, `hora_ingreso`, `estado`, `registrado_por`, `created_at`) VALUES
('1', '1', '1', '2026-07-16', '08:00:00', 'Presente', 'admin', '2026-07-26 09:36:57'),
('2', '1', '2', '2026-07-17', '08:00:00', 'Presente', 'admin', '2026-07-26 09:36:57'),
('3', '1', '3', '2026-07-18', '08:00:00', 'Presente', 'admin', '2026-07-26 09:36:57'),
('4', '1', '4', '2026-07-19', '08:00:00', 'Presente', 'admin', '2026-07-26 09:36:57'),
('5', '1', '5', '2026-07-20', '08:00:00', 'Presente', 'admin', '2026-07-26 09:36:57'),
('6', '1', '6', '2026-07-21', '08:00:00', 'Presente', 'admin', '2026-07-26 09:36:57'),
('7', '1', '7', '2026-07-22', '08:00:00', 'Presente', 'admin', '2026-07-26 09:36:57'),
('8', '1', '8', '2026-07-23', '08:00:00', 'Presente', 'admin', '2026-07-26 09:36:57'),
('9', '1', '9', '2026-07-24', '08:00:00', 'Presente', 'admin', '2026-07-26 09:36:57'),
('10', '1', '10', '2026-07-25', '08:00:00', 'Presente', 'admin', '2026-07-26 09:36:57');

-- ------------------------------------------------------------
-- Table: `asistencias`
-- ------------------------------------------------------------
DROP TABLE IF EXISTS `asistencias`;
CREATE TABLE `asistencias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `estudiante_id` int(11) NOT NULL,
  `sesion_id` int(11) NOT NULL,
  `estado` enum('Presente','Inasistente','Tardanza','Justificado') NOT NULL,
  `observacion` varchar(255) DEFAULT NULL,
  `registrado_por` varchar(160) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_asistencia_estudiante_sesion` (`estudiante_id`,`sesion_id`),
  KEY `sesion_id` (`sesion_id`),
  KEY `idx_asistencias_estudiante_estado` (`estudiante_id`,`estado`),
  CONSTRAINT `asistencias_ibfk_1` FOREIGN KEY (`estudiante_id`) REFERENCES `estudiantes` (`id`),
  CONSTRAINT `asistencias_ibfk_2` FOREIGN KEY (`sesion_id`) REFERENCES `sesiones` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=261 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `asistencias` (`id`, `estudiante_id`, `sesion_id`, `estado`, `observacion`, `registrado_por`, `created_at`) VALUES
('1', '1', '1', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('2', '2', '1', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('3', '3', '1', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('4', '4', '1', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('5', '5', '1', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('6', '6', '1', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('7', '7', '1', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('8', '8', '1', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('9', '9', '1', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('10', '10', '1', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('11', '11', '1', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('12', '12', '1', 'Tardanza', NULL, 'docente', '2026-07-26 09:36:57'),
('13', '13', '1', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('14', '14', '1', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('15', '15', '1', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('16', '16', '1', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('17', '17', '1', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('18', '18', '1', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('19', '19', '1', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('20', '20', '1', 'Inasistente', NULL, 'docente', '2026-07-26 09:36:57'),
('21', '21', '1', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('22', '22', '1', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('23', '23', '1', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('24', '24', '1', 'Justificado', NULL, 'docente', '2026-07-26 09:36:57'),
('25', '25', '1', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('26', '26', '1', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('27', '1', '2', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('28', '2', '2', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('29', '3', '2', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('30', '4', '2', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('31', '5', '2', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('32', '6', '2', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('33', '7', '2', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('34', '8', '2', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('35', '9', '2', 'Tardanza', NULL, 'docente', '2026-07-26 09:36:57'),
('36', '10', '2', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('37', '11', '2', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('38', '12', '2', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('39', '13', '2', 'Justificado', NULL, 'docente', '2026-07-26 09:36:57'),
('40', '14', '2', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('41', '15', '2', 'Inasistente', NULL, 'docente', '2026-07-26 09:36:57'),
('42', '16', '2', 'Justificado', NULL, 'docente', '2026-07-26 09:36:57'),
('43', '17', '2', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('44', '18', '2', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('45', '19', '2', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('46', '20', '2', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('47', '21', '2', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('48', '22', '2', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('49', '23', '2', 'Tardanza', NULL, 'docente', '2026-07-26 09:36:57'),
('50', '24', '2', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('51', '25', '2', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('52', '26', '2', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('53', '1', '3', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('54', '2', '3', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('55', '3', '3', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('56', '4', '3', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('57', '5', '3', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('58', '6', '3', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('59', '7', '3', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('60', '8', '3', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('61', '9', '3', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('62', '10', '3', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('63', '11', '3', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('64', '12', '3', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('65', '13', '3', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('66', '14', '3', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('67', '15', '3', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('68', '16', '3', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('69', '17', '3', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('70', '18', '3', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('71', '19', '3', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('72', '20', '3', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('73', '21', '3', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('74', '22', '3', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('75', '23', '3', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('76', '24', '3', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('77', '25', '3', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('78', '26', '3', 'Tardanza', NULL, 'docente', '2026-07-26 09:36:57'),
('79', '1', '4', 'Inasistente', NULL, 'docente', '2026-07-26 09:36:57'),
('80', '2', '4', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('81', '3', '4', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('82', '4', '4', 'Inasistente', NULL, 'docente', '2026-07-26 09:36:57'),
('83', '5', '4', 'Tardanza', NULL, 'docente', '2026-07-26 09:36:57'),
('84', '6', '4', 'Inasistente', NULL, 'docente', '2026-07-26 09:36:57'),
('85', '7', '4', 'Tardanza', NULL, 'docente', '2026-07-26 09:36:57'),
('86', '8', '4', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('87', '9', '4', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('88', '10', '4', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('89', '11', '4', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('90', '12', '4', 'Tardanza', NULL, 'docente', '2026-07-26 09:36:57'),
('91', '13', '4', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('92', '14', '4', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('93', '15', '4', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('94', '16', '4', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('95', '17', '4', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('96', '18', '4', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('97', '19', '4', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('98', '20', '4', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('99', '21', '4', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('100', '22', '4', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('101', '23', '4', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('102', '24', '4', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('103', '25', '4', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('104', '26', '4', 'Inasistente', NULL, 'docente', '2026-07-26 09:36:57'),
('105', '1', '5', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('106', '2', '5', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('107', '3', '5', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('108', '4', '5', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('109', '5', '5', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('110', '6', '5', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('111', '7', '5', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('112', '8', '5', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('113', '9', '5', 'Justificado', NULL, 'docente', '2026-07-26 09:36:57'),
('114', '10', '5', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('115', '11', '5', 'Justificado', NULL, 'docente', '2026-07-26 09:36:57'),
('116', '12', '5', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('117', '13', '5', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('118', '14', '5', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('119', '15', '5', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('120', '16', '5', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('121', '17', '5', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('122', '18', '5', 'Justificado', NULL, 'docente', '2026-07-26 09:36:57'),
('123', '19', '5', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('124', '20', '5', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('125', '21', '5', 'Inasistente', NULL, 'docente', '2026-07-26 09:36:57'),
('126', '22', '5', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('127', '23', '5', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('128', '24', '5', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('129', '25', '5', 'Inasistente', NULL, 'docente', '2026-07-26 09:36:57'),
('130', '26', '5', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('131', '1', '6', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('132', '2', '6', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('133', '3', '6', 'Tardanza', NULL, 'docente', '2026-07-26 09:36:57'),
('134', '4', '6', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('135', '5', '6', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('136', '6', '6', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('137', '7', '6', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('138', '8', '6', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('139', '9', '6', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('140', '10', '6', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('141', '11', '6', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('142', '12', '6', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('143', '13', '6', 'Justificado', NULL, 'docente', '2026-07-26 09:36:57'),
('144', '14', '6', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('145', '15', '6', 'Tardanza', NULL, 'docente', '2026-07-26 09:36:57'),
('146', '16', '6', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('147', '17', '6', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('148', '18', '6', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('149', '19', '6', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('150', '20', '6', 'Tardanza', NULL, 'docente', '2026-07-26 09:36:57'),
('151', '21', '6', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('152', '22', '6', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('153', '23', '6', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('154', '24', '6', 'Tardanza', NULL, 'docente', '2026-07-26 09:36:57'),
('155', '25', '6', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('156', '26', '6', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('157', '1', '7', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('158', '2', '7', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('159', '3', '7', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('160', '4', '7', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('161', '5', '7', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('162', '6', '7', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('163', '7', '7', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('164', '8', '7', 'Inasistente', NULL, 'docente', '2026-07-26 09:36:57'),
('165', '9', '7', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('166', '10', '7', 'Tardanza', NULL, 'docente', '2026-07-26 09:36:57'),
('167', '11', '7', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('168', '12', '7', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('169', '13', '7', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('170', '14', '7', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('171', '15', '7', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('172', '16', '7', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('173', '17', '7', 'Tardanza', NULL, 'docente', '2026-07-26 09:36:57'),
('174', '18', '7', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('175', '19', '7', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('176', '20', '7', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('177', '21', '7', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('178', '22', '7', 'Justificado', NULL, 'docente', '2026-07-26 09:36:57'),
('179', '23', '7', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('180', '24', '7', 'Inasistente', NULL, 'docente', '2026-07-26 09:36:57'),
('181', '25', '7', 'Tardanza', NULL, 'docente', '2026-07-26 09:36:57'),
('182', '26', '7', 'Inasistente', NULL, 'docente', '2026-07-26 09:36:57'),
('183', '1', '8', 'Tardanza', NULL, 'docente', '2026-07-26 09:36:57'),
('184', '2', '8', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('185', '3', '8', 'Tardanza', NULL, 'docente', '2026-07-26 09:36:57'),
('186', '4', '8', 'Tardanza', NULL, 'docente', '2026-07-26 09:36:57'),
('187', '5', '8', 'Inasistente', NULL, 'docente', '2026-07-26 09:36:57'),
('188', '6', '8', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('189', '7', '8', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('190', '8', '8', 'Inasistente', NULL, 'docente', '2026-07-26 09:36:57'),
('191', '9', '8', 'Tardanza', NULL, 'docente', '2026-07-26 09:36:57'),
('192', '10', '8', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('193', '11', '8', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('194', '12', '8', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('195', '13', '8', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('196', '14', '8', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('197', '15', '8', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('198', '16', '8', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('199', '17', '8', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('200', '18', '8', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('201', '19', '8', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('202', '20', '8', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('203', '21', '8', 'Justificado', NULL, 'docente', '2026-07-26 09:36:57'),
('204', '22', '8', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('205', '23', '8', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('206', '24', '8', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('207', '25', '8', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('208', '26', '8', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('209', '1', '9', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('210', '2', '9', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('211', '3', '9', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('212', '4', '9', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('213', '5', '9', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('214', '6', '9', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('215', '7', '9', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('216', '8', '9', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('217', '9', '9', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('218', '10', '9', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('219', '11', '9', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('220', '12', '9', 'Justificado', NULL, 'docente', '2026-07-26 09:36:57'),
('221', '13', '9', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('222', '14', '9', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('223', '15', '9', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('224', '16', '9', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('225', '17', '9', 'Inasistente', NULL, 'docente', '2026-07-26 09:36:57'),
('226', '18', '9', 'Tardanza', NULL, 'docente', '2026-07-26 09:36:57'),
('227', '19', '9', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('228', '20', '9', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('229', '21', '9', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('230', '22', '9', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('231', '23', '9', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('232', '24', '9', 'Justificado', NULL, 'docente', '2026-07-26 09:36:57'),
('233', '25', '9', 'Tardanza', NULL, 'docente', '2026-07-26 09:36:57'),
('234', '26', '9', 'Tardanza', NULL, 'docente', '2026-07-26 09:36:57'),
('235', '1', '10', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('236', '2', '10', 'Inasistente', NULL, 'docente', '2026-07-26 09:36:57'),
('237', '3', '10', 'Inasistente', NULL, 'docente', '2026-07-26 09:36:57'),
('238', '4', '10', 'Inasistente', NULL, 'docente', '2026-07-26 09:36:57'),
('239', '5', '10', 'Justificado', NULL, 'docente', '2026-07-26 09:36:57'),
('240', '6', '10', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('241', '7', '10', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('242', '8', '10', 'Tardanza', NULL, 'docente', '2026-07-26 09:36:57'),
('243', '9', '10', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('244', '10', '10', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('245', '11', '10', 'Inasistente', NULL, 'docente', '2026-07-26 09:36:57'),
('246', '12', '10', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('247', '13', '10', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('248', '14', '10', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('249', '15', '10', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('250', '16', '10', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('251', '17', '10', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('252', '18', '10', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('253', '19', '10', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('254', '20', '10', 'Tardanza', NULL, 'docente', '2026-07-26 09:36:57'),
('255', '21', '10', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('256', '22', '10', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('257', '23', '10', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('258', '24', '10', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('259', '25', '10', 'Presente', NULL, 'docente', '2026-07-26 09:36:57'),
('260', '26', '10', 'Presente', NULL, 'docente', '2026-07-26 09:36:57');

-- ------------------------------------------------------------
-- Table: `auditoria`
-- ------------------------------------------------------------
DROP TABLE IF EXISTS `auditoria`;
CREATE TABLE `auditoria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) NOT NULL,
  `modulo` varchar(100) NOT NULL,
  `accion` varchar(50) NOT NULL,
  `detalles` text DEFAULT NULL,
  `fecha_hora` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `usuario_id` (`usuario_id`),
  CONSTRAINT `auditoria_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ------------------------------------------------------------
-- Table: `auditoria_asistencias`
-- ------------------------------------------------------------
DROP TABLE IF EXISTS `auditoria_asistencias`;
CREATE TABLE `auditoria_asistencias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `asistencia_id` int(11) NOT NULL,
  `estudiante_id` int(11) NOT NULL,
  `sesion_id` int(11) NOT NULL,
  `estado_anterior` enum('Presente','Inasistente','Tardanza','Justificado') NOT NULL,
  `estado_nuevo` enum('Presente','Inasistente','Tardanza','Justificado') NOT NULL,
  `modificado_por` varchar(160) NOT NULL,
  `motivo_cambio` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `asistencia_id` (`asistencia_id`),
  KEY `estudiante_id` (`estudiante_id`),
  KEY `sesion_id` (`sesion_id`),
  CONSTRAINT `auditoria_asistencias_ibfk_1` FOREIGN KEY (`asistencia_id`) REFERENCES `asistencias` (`id`) ON DELETE CASCADE,
  CONSTRAINT `auditoria_asistencias_ibfk_2` FOREIGN KEY (`estudiante_id`) REFERENCES `estudiantes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `auditoria_asistencias_ibfk_3` FOREIGN KEY (`sesion_id`) REFERENCES `sesiones` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ------------------------------------------------------------
-- Table: `horarios`
-- ------------------------------------------------------------
DROP TABLE IF EXISTS `horarios`;
CREATE TABLE `horarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `programa_id` int(11) NOT NULL,
  `unidad_didactica_id` int(11) NOT NULL,
  `docente_id` int(11) NOT NULL,
  `seccion` varchar(2) NOT NULL,
  `dia_semana` enum('Lunes','Martes','Miercoles','Jueves','Viernes','Sabado','Domingo') NOT NULL,
  `hora_inicio` time NOT NULL,
  `hora_fin` time NOT NULL,
  PRIMARY KEY (`id`),
  KEY `programa_id` (`programa_id`),
  KEY `unidad_didactica_id` (`unidad_didactica_id`),
  KEY `docente_id` (`docente_id`),
  CONSTRAINT `horarios_ibfk_1` FOREIGN KEY (`programa_id`) REFERENCES `programas` (`id`) ON DELETE CASCADE,
  CONSTRAINT `horarios_ibfk_2` FOREIGN KEY (`unidad_didactica_id`) REFERENCES `unidades_didacticas` (`id`) ON DELETE CASCADE,
  CONSTRAINT `horarios_ibfk_3` FOREIGN KEY (`docente_id`) REFERENCES `docentes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


SET FOREIGN_KEY_CHECKS = 1;
