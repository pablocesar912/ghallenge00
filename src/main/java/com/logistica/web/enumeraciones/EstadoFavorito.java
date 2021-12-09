
package com.logistica.web.enumeraciones;

public enum EstadoFavorito {
	
	PENDIENTE("Pendiente"),ACTIVO("Activo"),CANCELADO("Cancelado");
	
	private String texto;
	
	private EstadoFavorito(String texto) {
		this.texto = texto;
	}
	
	public String getTexto() {
		return texto;
	}

}
