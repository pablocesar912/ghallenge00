package com.logistica.web.entidades;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.GenericGenerator;

import lombok.Data;

@Data
@Entity
public class Area {

	@Id
	@GeneratedValue(generator = "uuid")
	@GenericGenerator(name = "uuid", strategy = "uuid2")
	private String id;
	private String nombre;
	private Integer orden;

	private boolean areaVisible;

	@ManyToOne
	private ModeloEncuesta modeloEncuesta;

	@Temporal(TemporalType.TIMESTAMP)
	private Date alta;
	@Temporal(TemporalType.TIMESTAMP)
	private Date baja;
	@Temporal(TemporalType.TIMESTAMP)
	private Date modificacion;

	public Area() {

	}

	public Area(String id, String nombre, Date alta, Date baja, Date modificacion, boolean areaVisible) {
		super();
		this.id = id;
		this.nombre = nombre;
		this.alta = alta;
		this.baja = baja;
		this.modificacion = modificacion;
		this.areaVisible = areaVisible;

	}

}
