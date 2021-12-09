package com.logistica.web.errores;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

@ResponseStatus(HttpStatus.BAD_REQUEST)
public class PeticionIncorrectaException extends RuntimeException {
	
	private static final long serialVersionUID = 1L;
	
	public PeticionIncorrectaException(String message) {
		super(message);
	}
	
	public PeticionIncorrectaException() {
		super();
	}

}
