package com.logistica.web.errores;

import org.springframework.http.HttpStatus;

public class WebErrorModel {
	private String error;
	private String descripcion;
	private HttpStatus httpStatus;
	
	public String getError() {
		return error;
	}

	public void setError(String error) {
		this.error = error;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public HttpStatus getHttpStatus() {
		return httpStatus;
	}

	public void setHttpStatus(HttpStatus httpStatus) {
		this.httpStatus = httpStatus;
	}
	
	
	public WebErrorModel(String error, String descripcion, HttpStatus httpStatus) {
		super();
		this.error = error;
		this.descripcion = descripcion;
		this.httpStatus = httpStatus;
	}

	public String toJson() {
		return "{\"error\" : \"" + error + "\", \"descripcion\" : \"" + descripcion + "\", \"httpStatus\" : \"" + httpStatus + "\"}";
	}
	
	
}
