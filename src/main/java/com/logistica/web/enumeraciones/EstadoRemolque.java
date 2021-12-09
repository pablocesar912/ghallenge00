package com.logistica.web.enumeraciones;

public enum EstadoRemolque {

	DISPONIBLE("disponible"), REPARACION("reparacion");

	private String texto;

	private EstadoRemolque(String texto) {
		this.texto = texto;
	}

	public String getTexto() {
		return texto;
	}

}
