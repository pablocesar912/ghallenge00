package com.logistica.web.enumeraciones;

public enum TipoDeOrdenDeMantenimiento {
	
	INTERNA ("Interna"), EXTERNA("Externa");

	
	private String texto;
	
	private TipoDeOrdenDeMantenimiento(String texto) {
		this.texto = texto;
	}
	
	public String getTexto() {
		return texto;
	}
}
