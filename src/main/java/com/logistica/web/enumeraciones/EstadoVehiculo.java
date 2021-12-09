package com.logistica.web.enumeraciones;

public enum EstadoVehiculo {

	DISPONIBLE("Disponible"), REPARACION("En reparación"), EN_VIAJE("En viaje");

	private String texto;

	private EstadoVehiculo(String texto) {
		this.texto = texto;
	}

	public String getTexto() {
		return texto;
	}

}
