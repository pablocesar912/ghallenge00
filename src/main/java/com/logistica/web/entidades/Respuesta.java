package com.logistica.web.entidades;

import java.util.Date;

import javax.persistence.Basic;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.GenericGenerator;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.Data;

@Data
@Entity
public class Respuesta {

	@Id
	@GeneratedValue(generator = "uuid")
	@GenericGenerator(name = "uuid", strategy = "uuid2")
	private String id;
	
	@Lob
	@JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
	@Basic(fetch = FetchType.LAZY)
	private  byte[] file;
	
	private String contentType;

	private String texto;
	
	private String aclaracion;
	
	private boolean detalle;
	
	@Temporal(TemporalType.TIMESTAMP)
	private Date fecha;

	@Temporal(TemporalType.TIMESTAMP)
	private Date baja;

	@ManyToOne
	private Pregunta pregunta;

	@ManyToOne
	private Encuesta encuesta;

}
