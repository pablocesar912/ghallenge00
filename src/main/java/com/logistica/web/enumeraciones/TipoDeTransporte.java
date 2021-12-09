package com.logistica.web.enumeraciones;

public enum TipoDeTransporte {

	VEHICULO("vehiculo"), REMOLQUE("remolque");

	private String texto;

	private TipoDeTransporte(String texto) {
		this.texto = texto;
	}

	public String getTexto() {
		return texto;
	}
}
