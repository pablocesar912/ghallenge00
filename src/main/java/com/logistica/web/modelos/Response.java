package com.logistica.web.modelos;

import org.springframework.http.HttpStatus;

public class Response {
	private String message;
	private String content;
	private HttpStatus status;
	
	public Response() {
		super();
	}
	
	public Response(String message, String content, HttpStatus status) {
		super();
		this.message = message;
		this.content = content;
		this.status = status;
	}

	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public HttpStatus getStatus() {
		return status;
	}
	public void setStatus(HttpStatus status) {
		this.status = status;
	}
}
