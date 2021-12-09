package com.logistica.web.enumeraciones;

public enum TipoDocumento {

    DNI("DNI"), CNI("CNI"), CI("CI"), PASAPORTE("Pasaporte"), OTRO("Documento");

    
    private String texto;
	
	private TipoDocumento(String texto) {
		this.texto = texto;
	}
	
	public String getTexto() {
		return texto;
	}
}
