package com.logistica.web.enumeraciones;

public enum EstadoViaje {

	SIN_PLANIFICAR("Sin planificar"),
	PLANIFICADO("Planificado"),
	INICIADO("Iniciado"), 
	PROXIMO_ORIGEN("Próximo a origen"), 
	ESPERA_CARGA("Esperando carga"), 
	CARGANDO("Cargando"), 
	EN_VIAJE("En viaje"), 
	PROXIMO_DESTINO("Próximo a destino"), 
	ESPERA_DESCARGA("Esperando descarga"), 
	DESCARGANDO("Descargando"), 
	FINALIZADO("Finalizado"), 
	RECHAZO_ENTREGA("Rechazado"), 
	CANCELADO("Cancelado"), 
	DEMORADO("Demorado");
	
	private String texto;

	private EstadoViaje(String texto) {
		this.texto = texto;
	}

	public String getTexto() {
		return texto;
	}

}
