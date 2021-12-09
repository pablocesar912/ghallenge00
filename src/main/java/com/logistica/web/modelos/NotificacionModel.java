package com.logistica.web.modelos;

import java.util.Date;

import com.logistica.web.enumeraciones.TipoDeNotificacion;

import lombok.Data;

@Data
public class NotificacionModel {
	private String url;
	private String id;
	private String mensaje;
	private String emisor;
	private String idUsuario;
	private boolean vista;
	private String idEmpresa;
	private String nombreEmpresa;
	private TipoDeNotificacion tipo;
	private Date alta;

}

