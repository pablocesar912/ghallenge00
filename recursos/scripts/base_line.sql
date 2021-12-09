-- Tabla Pais --
INSERT INTO mov.pais (`id`, `nombre`) VALUES ('1', 'Argentina');

-- Tabla Provincia --
INSERT INTO mov.provincia (`id`, `nombre`, `pais_id`) VALUES ('1', 'Buenos Aires', '1');
INSERT INTO mov.provincia (`id`, `nombre`, `pais_id`) VALUES ('2', 'Mendoza', '1');

-- Tabla Localidad --
INSERT INTO mov.localidad (`id`, `codigo_postal`, `nombre`, `provincia_id`) VALUES ('1', '1004', 'Palermo', '1');
INSERT INTO mov.localidad (`id`, `codigo_postal`, `nombre`, `provincia_id`) VALUES ('2', '5500', 'Mendoza', '2');

-- Tabla Rol --
INSERT INTO mov.rol (`id`, `alta`, `is_admin`, `nombre`) VALUES ('1', '2021-05-30 00:00:00', true, 'Administrador Local');
INSERT INTO mov.rol (`id`, `alta`, `is_admin`, `nombre`) VALUES ('2', '2021-05-30 00:00:00', true, 'Invitado');
INSERT INTO mov.rol (`id`, `alta`, `is_admin`, `nombre`) VALUES ('3', '2021-05-30 00:00:00', true, 'Chofer');

-- Tabla Permisos: --
INSERT INTO mov.permiso (`id`, `administrador`, `nombre`, `nombre_amigable`) VALUES ('1', true, 'configuracion', 'Configuracion');
INSERT INTO mov.permiso (`id`, `administrador`, `nombre`, `nombre_amigable`) VALUES ('2', true, 'ver_carga', 'Ver Carga');
INSERT INTO mov.permiso (`id`, `administrador`, `nombre`, `nombre_amigable`) VALUES ('3', true, 'editar_carga', 'Editar Carga');
INSERT INTO mov.permiso (`id`, `administrador`, `nombre`, `nombre_amigable`) VALUES ('4', true, 'eliminar_carga', 'Eliminar Carga');

-- Tabla Emrpesa --
INSERT INTO mov.empresa (`id`, `alta`, `foto`, `identificador_fiscal_verificado`, `mail`, `nombre`, `razon_social`, `responsable`, `sitio_web`, `telefono`, `pais_id`) VALUES ('1', '2021-10-18 14:44:15', false, false, 'empresa@admin', 'EmpresaAdmin', 'Empresa Admin', '111111', 'www.adminempresa.com', '1111111', '1');

-- Tabla Usuario --
-- Usuario Admin: User: admin@admin, Pass: 123456
INSERT INTO mov.usuario (`id`, `apellido`, `clave`, `foto`, `identificador_verificado`, `mail`, `nombre`, `telefono`, `user`, `empresa_id`, `pais_id`, `rol_id`) VALUES ('1', 'Admin', '$2a$10$7AzNfC4zELp6KY.HFob/3eJmUw/u4h0h38d0ROxce3lM.iHzYgE/i', false, false, 'admin@admin', 'Admin', '1111111111', 'user_admin', '1', '1', '1');
-- Usuario Admin: User: admin@admin, Pass: 123456
INSERT INTO mov.usuario (`id`, `apellido`, `clave`, `foto`, `identificador_verificado`, `mail`, `nombre`, `telefono`, `user`, `empresa_id`, `pais_id`, `rol_id`) VALUES ('2', 'Admin2', '$2a$10$7AzNfC4zELp6KY.HFob/3eJmUw/u4h0h38d0ROxce3lM.iHzYgE/i', false, false, 'admin2@admin', 'Admin2', '2222222222', 'user_admin2', '1', '1', '1');

-- Tabla Configuracion --
-- Plantillas --
INSERT INTO mov.configuracion (`id`, `activo`, `grupo`, `nombre`, `nombre_amigable`, `plantilla`, `empresa_id`, `usuario_id`) VALUES ('1', false, 'carga', 'numero_interno_carga_incremental', 'Numero Interno Carga Incremental', true, null, null);
INSERT INTO mov.configuracion (`id`, `activo`, `grupo`, `nombre`, `nombre_amigable`, `plantilla`, `empresa_id`, `usuario_id`) VALUES ('2', false, 'carga', 'numero_interno_carga_aleatorio', 'Numero Interno Carga Aleatorio', true, null, null);
INSERT INTO mov.configuracion (`id`, `activo`, `grupo`, `nombre`, `nombre_amigable`, `plantilla`, `empresa_id`, `usuario_id`) VALUES ('3', false, 'orden_trabajo', 'numero_de_orden_de_trabajo_incremental', 'Numero de Orden de Trabajo Incremental', true, null, null);
INSERT INTO mov.configuracion (`id`, `activo`, `grupo`, `nombre`, `nombre_amigable`, `plantilla`, `empresa_id`, `usuario_id`) VALUES ('4', false, 'orden_trabajo', 'numero_de_orden_de_trabajo_aleatorio', 'Numero de Orden de Trabajo Aleatorio', true, null, null);
INSERT INTO mov.configuracion (`id`, `activo`, `grupo`, `nombre`, `nombre_amigable`, `plantilla`, `empresa_id`, `usuario_id`) VALUES ('5', false, 'orden_servicio', 'numero_de_orden_de_servicio_incremental', 'Numero de Orden de Servicio Incremental', true, null, null);
INSERT INTO mov.configuracion (`id`, `activo`, `grupo`, `nombre`, `nombre_amigable`, `plantilla`, `empresa_id`, `usuario_id`) VALUES ('6', false, 'orden_servicio', 'numero_de_orden_de_servicio_aleatorio', 'Numero de Orden de Servicio Aleatorio', true, null, null);

INSERT INTO mov.configuracion (`id`, `activo`, `grupo`, `nombre`, `nombre_amigable`, `plantilla`, `empresa_id`, `usuario_id`) VALUES ('7', false, 'notificacion', 'nueva_carga', 'Nueva Carga', true, null, null);
INSERT INTO mov.configuracion (`id`, `activo`, `grupo`, `nombre`, `nombre_amigable`, `plantilla`, `empresa_id`, `usuario_id`) VALUES ('8', false, 'notificacion', 'cambio_de_estado_de_carga', 'Cambio de Estado de Carga', true, null, null);
INSERT INTO mov.configuracion (`id`, `activo`, `grupo`, `nombre`, `nombre_amigable`, `plantilla`, `empresa_id`, `usuario_id`) VALUES ('9', false, 'notificacion', 'carga_rechazada', 'Carga Rechazada', true, null, null);
INSERT INTO mov.configuracion (`id`, `activo`, `grupo`, `nombre`, `nombre_amigable`, `plantilla`, `empresa_id`, `usuario_id`) VALUES ('10', false, 'notificacion','nuevo_acuerdo_por_carga', 'Nuevo Acuerdo por Carga',  true, null, null);
INSERT INTO mov.configuracion (`id`, `activo`, `grupo`, `nombre`, `nombre_amigable`, `plantilla`, `empresa_id`, `usuario_id`) VALUES ('11', false, 'notificacion', 'vencimiento', 'Vencimiento', true, null, null);
INSERT INTO mov.configuracion (`id`, `activo`, `grupo`, `nombre`, `nombre_amigable`, `plantilla`, `empresa_id`, `usuario_id`) VALUES ('12', false, 'notificacion', 'vencimiento_7', 'Vencimiento en 7 dias', true, null, null);
INSERT INTO mov.configuracion (`id`, `activo`, `grupo`, `nombre`, `nombre_amigable`, `plantilla`, `empresa_id`, `usuario_id`) VALUES ('13', false, 'notificacion', 'vencimiento_15', 'Vencimiento en 15 dias', true, null, null);
INSERT INTO mov.configuracion (`id`, `activo`, `grupo`, `nombre`, `nombre_amigable`, `plantilla`, `empresa_id`, `usuario_id`) VALUES ('14', false, 'notificacion', 'emergencia', 'Emergencia', true, null, null);
INSERT INTO mov.configuracion (`id`, `activo`, `grupo`, `nombre`, `nombre_amigable`, `plantilla`, `empresa_id`, `usuario_id`) VALUES ('15', false, 'notificacion', 'viaje_finalizado', 'Viaje Finalizado', true, null, null);
INSERT INTO mov.configuracion (`id`, `activo`, `grupo`, `nombre`, `nombre_amigable`, `plantilla`, `empresa_id`, `usuario_id`) VALUES ('16', false, 'notificacion', 'nueva_cotizacion', 'Nueva Cotizacion', true, null, null);
INSERT INTO mov.configuracion (`id`, `activo`, `grupo`, `nombre`, `nombre_amigable`, `plantilla`, `empresa_id`, `usuario_id`) VALUES ('17', false, 'notificacion', 'nuevo_documento', 'Nuevo Documento', true, null, null);
INSERT INTO mov.configuracion (`id`, `activo`, `grupo`, `nombre`, `nombre_amigable`, `plantilla`, `empresa_id`, `usuario_id`) VALUES ('18', false, 'notificacion', 'nueva_solicitud_favorito', 'Nueva Solicitud de Favorito', true, null, null);
INSERT INTO mov.configuracion (`id`, `activo`, `grupo`, `nombre`, `nombre_amigable`, `plantilla`, `empresa_id`, `usuario_id`) VALUES ('19', false, 'notificacion', 'aceptacion_de_solicitud_de_favorito', 'Aceptacion de Solicitud de Favorito', true, null, null);

-- Asignadas a Empresa y Usuario Admin
INSERT INTO mov.configuracion (`id`, `activo`, `grupo`, `nombre`, `nombre_amigable`, `plantilla`, `empresa_id`, `usuario_id`) VALUES ('20', false, 'carga', 'numero_interno_carga_incremental', 'Numero Interno Carga Incremental', false, '1', null);
INSERT INTO mov.configuracion (`id`, `activo`, `grupo`, `nombre`, `nombre_amigable`, `plantilla`, `empresa_id`, `usuario_id`) VALUES ('21', true, 'carga', 'numero_interno_carga_aleatorio', 'Numero Interno Carga Aleatorio', false, '1', null);
INSERT INTO mov.configuracion (`id`, `activo`, `grupo`, `nombre`, `nombre_amigable`, `plantilla`, `empresa_id`, `usuario_id`) VALUES ('22', false, 'orden_trabajo', 'numero_de_orden_de_trabajo_incremental', 'Numero de Orden de Trabajo Incremental', false, '1', null);
INSERT INTO mov.configuracion (`id`, `activo`, `grupo`, `nombre`, `nombre_amigable`, `plantilla`, `empresa_id`, `usuario_id`) VALUES ('23', true, 'orden_trabajo', 'numero_de_orden_de_trabajo_aleatorio', 'Numero de Orden de Trabajo Aleatorio', false, '1', null);
INSERT INTO mov.configuracion (`id`, `activo`, `grupo`, `nombre`, `nombre_amigable`, `plantilla`, `empresa_id`, `usuario_id`) VALUES ('24', false, 'orden_servicio', 'numero_de_orden_de_servicio_incremental', 'Numero de Orden de Servicio Incremental', false, '1', null);
INSERT INTO mov.configuracion (`id`, `activo`, `grupo`, `nombre`, `nombre_amigable`, `plantilla`, `empresa_id`, `usuario_id`) VALUES ('25', true, 'orden_servicio', 'numero_de_orden_de_servicio_aleatorio', 'Numero de Orden de Servicio Aleatorio', false, '1', null);

INSERT INTO mov.configuracion (`id`, `activo`, `grupo`, `nombre`, `nombre_amigable`, `plantilla`, `empresa_id`, `usuario_id`) VALUES ('26', false, 'notificacion', 'nueva_carga', 'Nueva Carga', false, '1', '1');
INSERT INTO mov.configuracion (`id`, `activo`, `grupo`, `nombre`, `nombre_amigable`, `plantilla`, `empresa_id`, `usuario_id`) VALUES ('27', false, 'notificacion', 'cambio_de_estado_de_carga', 'Cambio de Estado de Carga', false, '1', '1');
INSERT INTO mov.configuracion (`id`, `activo`, `grupo`, `nombre`, `nombre_amigable`, `plantilla`, `empresa_id`, `usuario_id`) VALUES ('28', false, 'notificacion', 'carga_rechazada', 'Carga Rechazada', false, '1', '1');
INSERT INTO mov.configuracion (`id`, `activo`, `grupo`, `nombre`, `nombre_amigable`, `plantilla`, `empresa_id`, `usuario_id`) VALUES ('29', false, 'notificacion', 'nuevo_acuerdo_por_carga', 'Nuevo Acuerdo por Carga', false, '1', '1');
INSERT INTO mov.configuracion (`id`, `activo`, `grupo`, `nombre`, `nombre_amigable`, `plantilla`, `empresa_id`, `usuario_id`) VALUES ('30', false, 'notificacion', 'vencimiento', 'Vencimiento', false, '1', '1');
INSERT INTO mov.configuracion (`id`, `activo`, `grupo`, `nombre`, `nombre_amigable`, `plantilla`, `empresa_id`, `usuario_id`) VALUES ('31', false, 'notificacion', 'vencimiento_7', 'Vencimiento en 7 dias', false, '1', '1');
INSERT INTO mov.configuracion (`id`, `activo`, `grupo`, `nombre`, `nombre_amigable`, `plantilla`, `empresa_id`, `usuario_id`) VALUES ('32', false, 'notificacion', 'vencimiento_15', 'Vencimiento en 15 dias', false, '1', '1');
INSERT INTO mov.configuracion (`id`, `activo`, `grupo`, `nombre`, `nombre_amigable`, `plantilla`, `empresa_id`, `usuario_id`) VALUES ('33', false, 'notificacion', 'emergencia', 'Emergencia', false, '1', '1');
INSERT INTO mov.configuracion (`id`, `activo`, `grupo`, `nombre`, `nombre_amigable`, `plantilla`, `empresa_id`, `usuario_id`) VALUES ('34', false, 'notificacion', 'viaje_finalizado', 'Viaje Finalizado', false, '1', '1');
INSERT INTO mov.configuracion (`id`, `activo`, `grupo`, `nombre`, `nombre_amigable`, `plantilla`, `empresa_id`, `usuario_id`) VALUES ('35', false, 'notificacion', 'nueva_cotizacion', 'Nueva Cotizacion', false, '1', '1');
INSERT INTO mov.configuracion (`id`, `activo`, `grupo`, `nombre`, `nombre_amigable`, `plantilla`, `empresa_id`, `usuario_id`) VALUES ('36', false, 'notificacion', 'nuevo_documento', 'Nuevo Documento', false, '1', '1');
INSERT INTO mov.configuracion (`id`, `activo`, `grupo`, `nombre`, `nombre_amigable`, `plantilla`, `empresa_id`, `usuario_id`) VALUES ('37', false, 'notificacion', 'nueva_solicitud_favorito', 'Nueva Solicitud de Favorito', false, '1', '1');
INSERT INTO mov.configuracion (`id`, `activo`, `grupo`, `nombre`, `nombre_amigable`, `plantilla`, `empresa_id`, `usuario_id`) VALUES ('38', false, 'notificacion', 'aceptacion_de_solicitud_de_favorito', 'Aceptacion de Solicitud de Favorito', false, '1', '1');

-- Tabla Marca --
INSERT INTO mov.marca (`id`, `nombre`, `pais_id`) VALUES ('1', 'Scania', '1');

-- Tabla Modelo --
INSERT INTO mov.modelo (`id`, `descripcion`, `nombre`, `marca_id`) VALUES ('1', 'Scania 116 TopLine', '116 TopLine', '1');

-- Tabla Tipo Vehiculo --
INSERT INTO mov.tipo_vehiculo (`id`, `descripcion`, `nombre`) VALUES ('1', 'Semi doble eje', 'Semi - Doble');

-- Tabla Tipo Remolque --
INSERT INTO mov.tipo_remolque (`id`, `nombre`, `pais_id`) VALUES ('1', 'Remolque Encarpado', '1');