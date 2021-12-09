package com.logistica.web.enumeraciones;

public enum ActividadPrincipal {
	
	TRANSPORTADOR("Empresa de transporte"), DADOR("Dador de carga"), AUTONOMO("Transportista autónomo"),FORWARDER("Forwarder"),ADUANA("Despachante de Aduana"),OTRO("Otro");

	
	private String texto;
	
	private ActividadPrincipal(String texto) {
		this.texto = texto;
	}
	
	public String getTexto() {
		return texto;
	}
}
