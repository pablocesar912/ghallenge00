package com.logistica.web.entidades;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.GenericGenerator;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.logistica.web.enumeraciones.EstadoViaje;

import lombok.Data;

@Data
@Entity
public class ViajePersonal implements Serializable {
	private static final long serialVersionUID = 5280568346761005560L;
	@Id
	@GeneratedValue(generator = "uuid")
	@GenericGenerator(name = "uuid", strategy = "uuid2")
	private String id;
	private String detalle;
	private String kms;
	private boolean internacional;

	@ManyToOne
	private Chofer chofer;
	@ManyToOne
	private Vehiculo vehiculo;
	@ManyToOne
	private Remolque remolque;
	
	@ElementCollection(targetClass = String.class)
	private List<String> nuevoOrdenIds;
	@Temporal(TemporalType.TIMESTAMP)
	private Date fechaInicio;

	@Temporal(TemporalType.TIMESTAMP)
	private Date fechaFinal;
	
	@Enumerated(EnumType.STRING)
	private EstadoViaje estadoViaje;
	
	@ManyToOne
	private Empresa transportador;
	
	@JsonIgnore
	@OneToMany
	private List<Coincidencia> coincidencias;
	
	@Temporal(TemporalType.TIMESTAMP)
	private Date modificacion;
	
	@Temporal(TemporalType.TIMESTAMP)
	private Date eliminado;

}
