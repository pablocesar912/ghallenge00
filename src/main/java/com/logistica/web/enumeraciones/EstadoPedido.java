
package com.logistica.web.enumeraciones;

public enum EstadoPedido {
	
	PUBLICADA("Publicada"),ASIGNADO("Asignada"),SIN_ASIGNAR("Sin Asignar"),OFERTADA("Ofertada"),ACORDADA("Acordada"),EN_PREPARACION("En Preparación"), LISTA_PARA_CARGAR("Listo para cargar"), CARGANDO("Cargando"), EN_VIAJE("En viaje"), DESCARGADO("Descargado"), FINALIZADO("Finalizado"), VENCIDO("Vencido");
	
	private String texto;
	
	private EstadoPedido(String texto) {
		this.texto = texto;
	}
	
	public String getTexto() {
		return texto;
	}

}
