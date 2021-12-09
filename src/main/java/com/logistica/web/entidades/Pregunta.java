package com.logistica.web.entidades;

import java.util.Date;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.GenericGenerator;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.logistica.web.enumeraciones.TipoPregunta;

import lombok.Data;

@Data
@Entity
public class Pregunta {

	@Id
	@GeneratedValue(generator = "uuid")
	@GenericGenerator(name = "uuid", strategy = "uuid2")
	private String id;
		
	@Temporal(TemporalType.TIMESTAMP)
	private Date alta;

	@Temporal(TemporalType.TIMESTAMP)
	private Date baja;
	
	@Lob
	@JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
	@Basic(fetch = FetchType.LAZY)
	private  byte[] file;
	
	@Temporal(TemporalType.TIMESTAMP)
	private Date modificacion;

    private String titulo;

    private boolean obligatoria;

    private Integer orden;
    
    private Boolean aceptaArchivos;
    
    @ManyToOne
    private Area area;

    @Enumerated(EnumType.STRING)
    private TipoPregunta tipo;
    
    @Column(length=5000)
    private String respuestas;
}
