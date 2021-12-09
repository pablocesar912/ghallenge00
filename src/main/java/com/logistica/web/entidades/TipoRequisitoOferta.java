package com.logistica.web.entidades;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.GenericGenerator;

import com.logistica.web.enumeraciones.TipoDeViaje;

import lombok.Data;

@Data
@Entity
public class TipoRequisitoOferta implements Serializable {

	private static final long serialVersionUID = 7575479503985572259L;

	@Id
	@GeneratedValue(generator = "uuid")
	@GenericGenerator(name = "uuid", strategy = "uuid2")
	private String id;
	private String nombre;
	private String descripcion;
	private Boolean obligatorioPedido;
	private Boolean obligatorioOferta;
	@Temporal(TemporalType.TIMESTAMP)
	private Date modificacion;
	@Temporal(TemporalType.TIMESTAMP)
	private Date eliminado;
	@ManyToOne
	private Pais pais;
	private TipoDeViaje tipoDeViaje;
}
