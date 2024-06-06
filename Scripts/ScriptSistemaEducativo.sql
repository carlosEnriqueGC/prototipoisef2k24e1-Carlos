
CREATE DATABASE siu;
USE siu;
-- -----------------------------------------------------
-- Table `educativo`.`Alumnos`
-- -----------------------------------------------------
CREATE TABLE alumnos
 (
  carnet_alumno VARCHAR(15),
  nombre_alumno VARCHAR(45),
  direccion_alumno VARCHAR(45),
  telefono_alumno VARCHAR(45),
  email_alumno VARCHAR(20),
  estatus_alumno VARCHAR(1),
  PRIMARY KEY (carnet_alumno)
) ENGINE = InnoDB DEFAULT CHARSET=latin1;

-- -----------------------------------------------------
-- Table `educativo`.`Maestros`
-- -----------------------------------------------------
CREATE TABLE maestros
(
  codigo_maestro VARCHAR(5),
  nombre_maestro VARCHAR(45),
  direccion_maestro VARCHAR(45),
  telefono_maetro VARCHAR(45),
  email_maestro VARCHAR(20),
  estatus_maestro VARCHAR(1),
  PRIMARY KEY (codigo_maestro)
 ) ENGINE = InnoDB DEFAULT CHARSET=latin1;
-- -----------------------------------------------------
-- Table `educativo`.`Facultades`
-- -----------------------------------------------------
CREATE TABLE facultades
(
  codigo_facultad VARCHAR(5),
  nombre_facultad VARCHAR(45),
  estatus_facultad VARCHAR(1),
  PRIMARY KEY (codigo_facultad)
) ENGINE = InnoDB DEFAULT CHARSET=latin1;
-- -----------------------------------------------------
-- Table `educativo`.`Carreras`
-- -----------------------------------------------------
CREATE TABLE carreras
(
  codigo_carrera VARCHAR(5),
  nombre_carrera VARCHAR(45),
  codigo_facultad VARCHAR(5),
  estatus_carrera VARCHAR(1),
  PRIMARY KEY (codigo_carrera),
  FOREIGN KEY (codigo_facultad) REFERENCES facultades(codigo_facultad)
) ENGINE = InnoDB DEFAULT CHARSET=latin1;
-- -----------------------------------------------------
-- Table `educativo`.`Cursos`
-- -----------------------------------------------------
CREATE TABLE cursos
(
  codigo_curso VARCHAR(5),
  nombre_curso VARCHAR(45),
  estatus_curso VARCHAR(1),
  PRIMARY KEY (codigo_curso)
 ) ENGINE = InnoDB DEFAULT CHARSET=latin1;
-- -----------------------------------------------------
-- Table `educativo`.`Secciones`
-- -----------------------------------------------------
CREATE TABLE secciones
(
  codigo_seccion VARCHAR(5),
  nombre_seccion VARCHAR(45),
  estatus_seccion VARCHAR(1),
  PRIMARY KEY (codigo_seccion)
 ) ENGINE = InnoDB DEFAULT CHARSET=latin1;
-- -----------------------------------------------------
-- Table `educativo`.`Sedes`
-- -----------------------------------------------------
CREATE TABLE sedes
(
  codigo_sede VARCHAR(5),
  nombre_sede VARCHAR(45),
  estatus_sede VARCHAR(1),
  PRIMARY KEY (codigo_sede)
) ENGINE = InnoDB DEFAULT CHARSET=latin1;
-- -----------------------------------------------------
-- Table `educativo`.`Aulas`
-- -----------------------------------------------------
CREATE TABLE aulas
(
  codigo_aula VARCHAR(5),
  nombre_aula VARCHAR(45),
  estatus_aula VARCHAR(1),
  PRIMARY KEY (codigo_aula)
) ENGINE = InnoDB DEFAULT CHARSET=latin1;
CREATE TABLE jornadas
(
	codigo_jornada VARCHAR(5),
    nombre_jornada VARCHAR(45),
    estatus_jornada VARCHAR(1),
    PRIMARY KEY (codigo_jornada)
) ENGINE=INNODB DEFAULT CHARSET=latin1;
-- -----------------------------------------------------
-- Table `educativo`.`Asignacion_cursos_alumnos`
-- -----------------------------------------------------
CREATE TABLE asignacioncursosalumnos
(
  codigo_carrera VARCHAR(5),
  codigo_sede VARCHAR(5),
  codigo_jornada VARCHAR(5),
  codigo_seccion VARCHAR(5),
  codigo_aula VARCHAR(5),
  codigo_curso VARCHAR(5),
  carnet_alumno VARCHAR(15),
  nota_asignacioncursoalumnos FLOAT(10,2), 
  PRIMARY KEY (codigo_carrera, codigo_sede, codigo_jornada, codigo_seccion, codigo_aula, codigo_curso, carnet_alumno),
  FOREIGN KEY (codigo_carrera) REFERENCES carreras(codigo_carrera),
  FOREIGN KEY (codigo_sede) REFERENCES sedes(codigo_sede),
  FOREIGN KEY (codigo_jornada) REFERENCES jornadas(codigo_jornada),
  FOREIGN KEY (codigo_seccion) REFERENCES secciones(codigo_seccion),
  FOREIGN KEY (codigo_aula) REFERENCES aulas(codigo_aula),
  FOREIGN KEY (codigo_curso) REFERENCES cursos(codigo_curso),
  FOREIGN KEY (carnet_alumno) REFERENCES alumnos(carnet_alumno)
  ) ENGINE = InnoDB DEFAULT CHARSET=latin1;
-- -----------------------------------------------------
-- Table `educativo`.`Asignacion_cursos_maestros`
-- -----------------------------------------------------
CREATE TABLE asignacioncursosmastros
(
  codigo_carrera VARCHAR(5),
  codigo_sede VARCHAR(5),
  codigo_jornada VARCHAR(5),
  codigo_seccion VARCHAR(5),
  codigo_aula VARCHAR(5),
  codigo_curso VARCHAR(5),
  codigo_maestro VARCHAR(5),
  PRIMARY KEY (codigo_carrera, codigo_sede, codigo_jornada, codigo_seccion, codigo_aula, codigo_curso),
  FOREIGN KEY (codigo_carrera) REFERENCES carreras(codigo_carrera),
  FOREIGN KEY (codigo_sede) REFERENCES sedes(codigo_sede),
  FOREIGN KEY (codigo_jornada) REFERENCES jornadas(codigo_jornada),
  FOREIGN KEY (codigo_seccion) REFERENCES secciones(codigo_seccion),
  FOREIGN KEY (codigo_aula) REFERENCES aulas(codigo_aula),
  FOREIGN KEY (codigo_curso) REFERENCES cursos(codigo_curso),
  FOREIGN KEY (codigo_maestro) REFERENCES maestros(codigo_maestro)
  ) ENGINE = InnoDB DEFAULT CHARSET=latin1;

-- Insertar datos en la tabla maestros
INSERT INTO maestros (codigo_maestro, nombre_maestro, direccion_maestro, telefono_maetro, email_maestro, estatus_maestro)
VALUES ('1', 'Juan Perez', 'Av. Siempre Viva 123', '555-1234', 'juan@example.com', 'A');

INSERT INTO maestros (codigo_maestro, nombre_maestro, direccion_maestro, telefono_maetro, email_maestro, estatus_maestro)
VALUES ('2', 'Maria Lopez', 'Calle Falsa 456', '555-5678', 'maria@example.com', 'A');

-- Insertar datos en la tabla facultades
INSERT INTO facultades (codigo_facultad, nombre_facultad, estatus_facultad)
VALUES ('1', 'Ingeniería', 'A');

INSERT INTO facultades (codigo_facultad, nombre_facultad, estatus_facultad)
VALUES ('2', 'Ciencias Sociales', 'A');

-- Insertar datos en la tabla carreras
INSERT INTO carreras (codigo_carrera, nombre_carrera, codigo_facultad, estatus_carrera)
VALUES ('1', 'Ingeniería de Sistemas', '1', 'A');

INSERT INTO carreras (codigo_carrera, nombre_carrera, codigo_facultad, estatus_carrera)
VALUES ('2', 'Psicología', '2', 'A');

-- Insertar datos en la tabla secciones
INSERT INTO secciones (codigo_seccion, nombre_seccion, estatus_seccion)
VALUES ('1', 'Sección A', 'A');

INSERT INTO secciones (codigo_seccion, nombre_seccion, estatus_seccion)
VALUES ('2', 'Sección B', 'A');

-- Insertar datos en la tabla sedes
INSERT INTO sedes (codigo_sede, nombre_sede, estatus_sede)
VALUES ('1', 'Sede Central', 'A');

INSERT INTO sedes (codigo_sede, nombre_sede, estatus_sede)
VALUES ('2', 'Sede Norte', 'A');

-- Insertar datos en la tabla aulas
INSERT INTO aulas (codigo_aula, nombre_aula, estatus_aula)
VALUES ('1', 'Aula 101', 'A');

INSERT INTO aulas (codigo_aula, nombre_aula, estatus_aula)
VALUES ('2', 'Aula 102', 'A');

-- Insertar datos en la tabla jornadas
INSERT INTO jornadas (codigo_jornada, nombre_jornada, estatus_jornada)
VALUES ('1', 'Matutina', 'A');

INSERT INTO jornadas (codigo_jornada, nombre_jornada, estatus_jornada)
VALUES ('2', 'Verpertina', 'A');

-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/


CREATE TABLE `tbl_aplicaciones` (
  `pk_id_aplicacion` int(11) NOT NULL,
  `nombre_aplicacion` varchar(50) NOT NULL,
  `descripcion_aplicacion` varchar(150) NOT NULL,
  `estado_aplicacion` tinyint(4) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_asignacionesperfilsusuario`
--

CREATE TABLE `tbl_asignacionesperfilsusuario` (
  `fk_id_usuario` int(11) NOT NULL,
  `fk_id_perfil` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_asignacionmoduloaplicacion`
--

CREATE TABLE `tbl_asignacionmoduloaplicacion` (
  `fk_id_modulos` int(11) NOT NULL,
  `fk_id_aplicacion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_bitacoradeeventos`
--

CREATE TABLE `tbl_bitacoradeeventos` (
  `pk_id_bitacora` int(11) NOT NULL,
  `fk_id_usuario` int(11) NOT NULL,
  `fk_id_aplicacion` int(11) NOT NULL,
  `fecha_bitacora` date NOT NULL,
  `hora_bitacora` time NOT NULL,
  `host_bitacora` varchar(45) NOT NULL,
  `ip_bitacora` varchar(100) NOT NULL,
  `accion_bitacora` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_modulos`
--

CREATE TABLE `tbl_modulos` (
  `pk_id_modulos` int(11) NOT NULL,
  `nombre_modulo` varchar(50) NOT NULL,
  `descripcion_modulo` varchar(150) NOT NULL,
  `estado_modulo` tinyint(4) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_perfiles`
--

CREATE TABLE `tbl_perfiles` (
  `pk_id_perfil` int(11) NOT NULL,
  `nombre_perfil` varchar(50) NOT NULL,
  `descripcion_perfil` varchar(150) NOT NULL,
  `estado_perfil` tinyint(4) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_permisosaplicacionesusuario`
--

CREATE TABLE `tbl_permisosaplicacionesusuario` (
  `fk_id_aplicacion` int(11) NOT NULL,
  `fk_id_usuario` int(11) NOT NULL,
  `guardar_permiso` tinyint(1) DEFAULT 0,
  `modificar_permiso` tinyint(1) DEFAULT 0,
  `eliminar_permiso` tinyint(1) DEFAULT 0,
  `buscar_permiso` tinyint(1) DEFAULT 0,
  `imprimir_permiso` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_permisosaplicacionperfil`
--

CREATE TABLE `tbl_permisosaplicacionperfil` (
  `fk_id_perfil` int(11) NOT NULL,
  `fk_id_aplicacion` int(11) NOT NULL,
  `guardar_permiso` tinyint(1) DEFAULT 0,
  `modificar_permiso` tinyint(1) DEFAULT 0,
  `eliminar_permiso` tinyint(1) DEFAULT 0,
  `buscar_permiso` tinyint(1) DEFAULT 0,
  `imprimir_permiso` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_usuarios`
--

CREATE TABLE `tbl_usuarios` (
  `pk_id_usuario` int(11) NOT NULL,
  `nombre_usuario` varchar(50) NOT NULL,
  `apellido_usuario` varchar(50) NOT NULL,
  `username_usuario` varchar(20) NOT NULL,
  `password_usuario` varchar(100) NOT NULL,
  `email_usuario` varchar(50) NOT NULL,
  `estado_usuario` tinyint(4) NOT NULL DEFAULT 0,
  `pregunta` varchar(50) NOT NULL,
  `respuesta` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_aplicacionusuario`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_aplicacionusuario` (
`Aplicacion` int(11)
,`ID` int(11)
,`Usuario` varchar(50)
,`Insertar` tinyint(1)
,`Editar` tinyint(1)
,`Eliminar` tinyint(1)
,`Buscar` tinyint(1)
,`Reporte` tinyint(1)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_aplicacion_perfil`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_aplicacion_perfil` (
`ID` int(11)
,`Perfil` varchar(50)
,`Aplicacion` int(11)
,`Insertar` tinyint(1)
,`Modificar` tinyint(1)
,`Eliminar` tinyint(1)
,`Buscar` tinyint(1)
,`Reporte` tinyint(1)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_modulo_aplicacion`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_modulo_aplicacion` (
`ID` int(11)
,`Modulo` varchar(50)
,`Aplicacion` int(11)
,`Nombre` varchar(50)
,`Descripcion` varchar(150)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_perfil_usuario`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_perfil_usuario` (
`ID` int(11)
,`Usuario` varchar(50)
,`nickName` varchar(20)
,`perfil` int(11)
,`Nombre` varchar(50)
);

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_aplicacionusuario`
--
DROP TABLE IF EXISTS `vista_aplicacionusuario`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_aplicacionusuario`  AS SELECT `b`.`fk_id_aplicacion` AS `Aplicacion`, `b`.`fk_id_usuario` AS `ID`, `a`.`nombre_usuario` AS `Usuario`, `b`.`guardar_permiso` AS `Insertar`, `b`.`modificar_permiso` AS `Editar`, `b`.`eliminar_permiso` AS `Eliminar`, `b`.`buscar_permiso` AS `Buscar`, `b`.`imprimir_permiso` AS `Reporte` FROM (`tbl_permisosaplicacionesusuario` `b` join `tbl_usuarios` `a` on(`a`.`pk_id_usuario` = `b`.`fk_id_usuario`)) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_aplicacion_perfil`
--
DROP TABLE IF EXISTS `vista_aplicacion_perfil`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_aplicacion_perfil`  AS SELECT `b`.`fk_id_perfil` AS `ID`, `a`.`nombre_perfil` AS `Perfil`, `b`.`fk_id_aplicacion` AS `Aplicacion`, `b`.`guardar_permiso` AS `Insertar`, `b`.`modificar_permiso` AS `Modificar`, `b`.`eliminar_permiso` AS `Eliminar`, `b`.`buscar_permiso` AS `Buscar`, `b`.`imprimir_permiso` AS `Reporte` FROM (`tbl_permisosaplicacionperfil` `b` join `tbl_perfiles` `a` on(`a`.`pk_id_perfil` = `b`.`fk_id_perfil`)) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_modulo_aplicacion`
--
DROP TABLE IF EXISTS `vista_modulo_aplicacion`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_modulo_aplicacion`  AS SELECT `b`.`fk_id_modulos` AS `ID`, `a`.`nombre_modulo` AS `Modulo`, `b`.`fk_id_aplicacion` AS `Aplicacion`, `c`.`nombre_aplicacion` AS `Nombre`, `c`.`descripcion_aplicacion` AS `Descripcion` FROM ((`tbl_asignacionmoduloaplicacion` `b` join `tbl_modulos` `a` on(`a`.`pk_id_modulos` = `b`.`fk_id_modulos`)) join `tbl_aplicaciones` `c` on(`c`.`pk_id_aplicacion` = `b`.`fk_id_aplicacion`)) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_perfil_usuario`
--
DROP TABLE IF EXISTS `vista_perfil_usuario`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_perfil_usuario`  AS SELECT `b`.`fk_id_usuario` AS `ID`, `a`.`nombre_usuario` AS `Usuario`, `a`.`username_usuario` AS `nickName`, `b`.`fk_id_perfil` AS `perfil`, `c`.`nombre_perfil` AS `Nombre` FROM ((`tbl_asignacionesperfilsusuario` `b` join `tbl_usuarios` `a` on(`a`.`pk_id_usuario` = `b`.`fk_id_usuario`)) join `tbl_perfiles` `c` on(`c`.`pk_id_perfil` = `b`.`fk_id_perfil`)) ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tbl_aplicaciones`
--
ALTER TABLE `tbl_aplicaciones`
  ADD PRIMARY KEY (`pk_id_aplicacion`);

--
-- Indices de la tabla `tbl_asignacionesperfilsusuario`
--
ALTER TABLE `tbl_asignacionesperfilsusuario`
  ADD PRIMARY KEY (`fk_id_usuario`,`fk_id_perfil`),
  ADD KEY `fk_id_perfil` (`fk_id_perfil`);

--
-- Indices de la tabla `tbl_asignacionmoduloaplicacion`
--
ALTER TABLE `tbl_asignacionmoduloaplicacion`
  ADD PRIMARY KEY (`fk_id_modulos`,`fk_id_aplicacion`),
  ADD KEY `fk_id_aplicacion` (`fk_id_aplicacion`);

--
-- Indices de la tabla `tbl_bitacoradeeventos`
--
ALTER TABLE `tbl_bitacoradeeventos`
  ADD PRIMARY KEY (`pk_id_bitacora`),
  ADD KEY `fk_id_usuario` (`fk_id_usuario`),
  ADD KEY `fk_id_aplicacion` (`fk_id_aplicacion`);

--
-- Indices de la tabla `tbl_modulos`
--
ALTER TABLE `tbl_modulos`
  ADD PRIMARY KEY (`pk_id_modulos`);

--
-- Indices de la tabla `tbl_perfiles`
--
ALTER TABLE `tbl_perfiles`
  ADD PRIMARY KEY (`pk_id_perfil`);

--
-- Indices de la tabla `tbl_permisosaplicacionesusuario`
--
ALTER TABLE `tbl_permisosaplicacionesusuario`
  ADD PRIMARY KEY (`fk_id_aplicacion`,`fk_id_usuario`),
  ADD KEY `fk_id_usuario` (`fk_id_usuario`);

--
-- Indices de la tabla `tbl_permisosaplicacionperfil`
--
ALTER TABLE `tbl_permisosaplicacionperfil`
  ADD PRIMARY KEY (`fk_id_perfil`,`fk_id_aplicacion`),
  ADD KEY `fk_id_aplicacion` (`fk_id_aplicacion`);

--
-- Indices de la tabla `tbl_usuarios`
--
ALTER TABLE `tbl_usuarios`
  ADD PRIMARY KEY (`pk_id_usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tbl_bitacoradeeventos`
--
ALTER TABLE `tbl_bitacoradeeventos`
  MODIFY `pk_id_bitacora` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tbl_perfiles`
--
ALTER TABLE `tbl_perfiles`
  MODIFY `pk_id_perfil` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tbl_usuarios`
--
ALTER TABLE `tbl_usuarios`
  MODIFY `pk_id_usuario` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tbl_asignacionesperfilsusuario`
--
ALTER TABLE `tbl_asignacionesperfilsusuario`
  ADD CONSTRAINT `tbl_asignacionesperfilsusuario_ibfk_1` FOREIGN KEY (`fk_id_usuario`) REFERENCES `tbl_usuarios` (`pk_id_usuario`),
  ADD CONSTRAINT `tbl_asignacionesperfilsusuario_ibfk_2` FOREIGN KEY (`fk_id_perfil`) REFERENCES `tbl_perfiles` (`pk_id_perfil`);

--
-- Filtros para la tabla `tbl_asignacionmoduloaplicacion`
--
ALTER TABLE `tbl_asignacionmoduloaplicacion`
  ADD CONSTRAINT `tbl_asignacionmoduloaplicacion_ibfk_1` FOREIGN KEY (`fk_id_modulos`) REFERENCES `tbl_modulos` (`pk_id_modulos`),
  ADD CONSTRAINT `tbl_asignacionmoduloaplicacion_ibfk_2` FOREIGN KEY (`fk_id_aplicacion`) REFERENCES `tbl_aplicaciones` (`pk_id_aplicacion`);

--
-- Filtros para la tabla `tbl_bitacoradeeventos`
--
ALTER TABLE `tbl_bitacoradeeventos`
  ADD CONSTRAINT `tbl_bitacoradeeventos_ibfk_1` FOREIGN KEY (`fk_id_usuario`) REFERENCES `tbl_usuarios` (`pk_id_usuario`),
  ADD CONSTRAINT `tbl_bitacoradeeventos_ibfk_2` FOREIGN KEY (`fk_id_aplicacion`) REFERENCES `tbl_aplicaciones` (`pk_id_aplicacion`);

--
-- Filtros para la tabla `tbl_permisosaplicacionesusuario`
--
ALTER TABLE `tbl_permisosaplicacionesusuario`
  ADD CONSTRAINT `tbl_permisosaplicacionesusuario_ibfk_1` FOREIGN KEY (`fk_id_aplicacion`) REFERENCES `tbl_aplicaciones` (`pk_id_aplicacion`),
  ADD CONSTRAINT `tbl_permisosaplicacionesusuario_ibfk_2` FOREIGN KEY (`fk_id_usuario`) REFERENCES `tbl_usuarios` (`pk_id_usuario`);

--
-- Filtros para la tabla `tbl_permisosaplicacionperfil`
--
ALTER TABLE `tbl_permisosaplicacionperfil`
  ADD CONSTRAINT `tbl_permisosaplicacionperfil_ibfk_1` FOREIGN KEY (`fk_id_aplicacion`) REFERENCES `tbl_aplicaciones` (`pk_id_aplicacion`),
  ADD CONSTRAINT `tbl_permisosaplicacionperfil_ibfk_2` FOREIGN KEY (`fk_id_perfil`) REFERENCES `tbl_perfiles` (`pk_id_perfil`);
COMMIT;


--
-- INSERTS SEGURIDAD
--
INSERT INTO `tbl_modulos` VALUES
('1000', 'SEGURIDAD', 'Seguridad', 1)
;

-- -----APLICACIONES
INSERT INTO `tbl_aplicaciones` VALUES
('1', 'Menu', 'Ingreso Login', '1'),
('999', 'Cerrar Sesion', 'Cerrar Sesion', '1'),
('1000', 'MDI SEGURIDAD', 'PARA SEGURIDAD', '1'),
('1001', 'Mant. Usuario', 'PARA SEGURIDAD', '1'),
('1002', 'Mant. Aplicación', 'PARA SEGURIDAD', '1'),
('1003', 'Mant. Modulo', 'PARA SEGURIDAD', '1'),
('1004', 'Mant. Perfil', 'PARA SEGURIDAD', '1'),
('1101', 'Asign. Modulo Aplicacion', 'PARA SEGURIDAD', '1'),
('1102', 'Asign. Aplicacion Perfil', 'PARA SEGURIDAD', '1'),
('1103', 'Asign. Perfil Usuario', 'PARA SEGURIDAD', '1'),
('1201', 'Pcs. Cambio Contraseña', 'PARA SEGURIDAD', '1'),
('1301', 'Pcs. BITACORA', 'PARA SEGURIDAD', '1')
;

-- -----USUARIOS
INSERT INTO `tbl_usuarios` VALUES
('1', 'admin', 'admin', 'admin', 'HO0aGo4nM94=', 'esduardo@gmail.com', '1', 'COLOR FAVORITO', 'X9yc1/l1b2A=')
;

-- -----PERFILES
INSERT INTO `tbl_perfiles` VALUES
('1', 'ADMINISTRADOR', 'contiene todos los permisos del programa', 1),
('2', 'SEGURIDAD', 'contiene todos los permisos de seguridad', 1)
;

-- -----ASIGNACIÓNES MODULO A APLICACION
INSERT INTO `tbl_asignacionmoduloaplicacion` VALUES
('1000', '1000'),
('1000', '1001'),
('1000', '1002'),
('1000', '1003'),
('1000', '1004'),
('1000', '1102'),
('1000', '1103'),
('1000', '1201'),
('1000', '1301')
;

-- -----PERMISOS DE APLICACIONES A PERFILES
INSERT INTO `tbl_permisosAplicacionPerfil` VALUES
('1', '1000', '1', '1', '1', '1', '1'),
('1', '1001', '1', '1', '1', '1', '1'),
('1', '1002', '1', '1', '1', '1', '1'),
('1', '1003', '1', '1', '1', '1', '1'),
('1', '1004', '1', '1', '1', '1', '1'),
('1', '1101', '1', '1', '1', '1', '1'),
('1', '1102', '1', '1', '1', '1', '1'),
('1', '1103', '1', '1', '1', '1', '1'),
('1', '1201', '1', '1', '1', '1', '1'),
('1', '1301', '1', '1', '1', '1', '1')
;

-- -----ASIGNACIÓN DE PERFIL A USUARIO
INSERT INTO `tbl_asignacionesPerfilsUsuario` VALUES
('1', '1')
; 

-- -----INSERTS SEGURIDAD MODULO
INSERT INTO tbl_modulos VALUES
('9000', 'MDI ESCOLAR', 'MDI', 1)
;
 
-- -----APLICACIONES
INSERT INTO tbl_aplicaciones VALUES
('9000', 'MDI ESCOLAR', 'PARA MDI', '1'),
('9001', 'Mantenimiento ALUMNO', 'PARA MDI', '1'),
('9002', 'Mantenimiento CURSO', 'PARA MDI', '1'),
('9003', 'Proceso ASIGNACION CURSO Y ALUMNO', 'PARA MDI', '1')
;
 
-- -----ASIGNACIÓNES MODULO A APLICACION
INSERT INTO tbl_asignacionmoduloaplicacion VALUES
('9000', '9000'),
('9000', '9001'),
('9000', '9002'),
('9000', '9003')
;
 
-- -----PERMISOS DE APLICACIONES A PERFILES
INSERT INTO tbl_permisosAplicacionPerfil VALUES
('1', '9000', '1', '1', '1', '1', '1'),
('1', '9001', '1', '1', '1', '1', '1'),
('1', '9002', '1', '1', '1', '1', '1'),
('1', '9003', '1', '1', '1', '1', '1')
;

--
-- Table structure for table `tbl_estados`
--

DROP TABLE IF EXISTS `tbl_estados`;
CREATE TABLE `tbl_estados` (
  `pk_id_estado` int NOT NULL AUTO_INCREMENT,
  `est_info_estado` varchar(50),
  `est_num_estado` int DEFAULT NULL,
  PRIMARY KEY (`pk_id_estado`)
);

--
-- Dumping data for table `tbl_estados`
--

LOCK TABLES `tbl_estados` WRITE;
INSERT INTO `tbl_estados` VALUES (1,'Activo',1),(2,'Eliminado',2),(3,'Modificado',3);
UNLOCK TABLES;

--
-- Table structure for table `tbl_reportes`
--

DROP TABLE IF EXISTS `tbl_reportes`;
CREATE TABLE `tbl_reportes` (
  `pk_id_reporte` int NOT NULL AUTO_INCREMENT,
  `rep_correlativo` int DEFAULT NULL,
  `rep_nombre` varchar(50),
  `fk_estado` int DEFAULT NULL,
  `rep_fecha` datetime DEFAULT NULL,
  `rep_archivo` varchar(120),
  `rep_fechaMod` datetime DEFAULT NULL,
  PRIMARY KEY (`pk_id_reporte`),
  UNIQUE KEY `rep_correlativo` (`rep_correlativo`),
  KEY `fk_estado` (`fk_estado`),
  CONSTRAINT `tbl_reportes_ibfk_1` FOREIGN KEY (`fk_estado`) REFERENCES `tbl_estados` (`pk_id_estado`)
);


/*NO EJECUTAR DE UN SOLOOOO */;
UPDATE tbl_reportes
SET rep_archivo = ''
WHERE id = 1;





