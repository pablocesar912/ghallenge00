package com.logistica.web.enumeraciones;

public enum TipoDeNotificacion {

	NUEVA_CARGA("Nueva carga"),
	NUEVA_COTIZACION("Nueva cotización"),
	CAMBIO_ESTADO("Cambio de estado de carga"),
	NUEVO_ACUERDO("Nuevo acuerdo por carga"),
	NUEVO_DOCUMENTO("Nuevo documento"),
	AVISO_VENCIMIENTO_15("Vencimiento en 15 días"),
	AVISO_VENCIMIENTO_7("Vencimiento en 7 días"),
	AVISO_VENCIMIENTO_1("Vencimiento"),
	NUEVO_PEDIDO_FAVORITO("Nueva solicitud de Favorito"),
	ACEPTACION_FAVORITO("Aceptación de solicitud de Favorito"),
	VIAJE_FINALIZADO("Viaje finalizado"),
	RECHAZO_CARGA("Carga rechazada"),
	SOS("Emergencia");
	

	private String texto;

	private TipoDeNotificacion(String texto) {
		this.texto = texto;
	}

	public String getTexto() {
		return texto;
	}
}
