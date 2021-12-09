package com.logistica.web.errores;

public class EventoRestException extends RuntimeException {
	private static final long serialVersionUID = 1L;
	
	public EventoRestException(String message) {
		super(message);
	}
	
	public EventoRestException() {
		super();
	}
}
