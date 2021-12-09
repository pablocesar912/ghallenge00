package com.logistica.web.enumeraciones;

public enum EstadoCarga {
	
	SIN_ASIGNAR("sin_asignar"), PROXIMA("proxima"), EN_ESPERA("en_espera");

	
	private String texto;
	
	private EstadoCarga(String texto) {
		this.texto = texto;
	}
	
	public String getTexto() {
		return texto;
	}
}
