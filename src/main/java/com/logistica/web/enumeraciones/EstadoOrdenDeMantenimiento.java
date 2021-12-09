package com.logistica.web.enumeraciones;

public enum EstadoOrdenDeMantenimiento {

	PENDIENTE("Pendiente"), 
	PLANIFICADO("Planificado"), 
	ENEJECUCION("En Ejecucion"), 
	FINALIZADO("Finalizado"),
	RECHAZADO("Rechazado");

	private String texto;

	private EstadoOrdenDeMantenimiento(String texto) {
		this.texto = texto;
	}

	public String getTexto() {
		return texto;
	}

}
