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

import lombok.Data;

@Data
@Entity
public class Activo implements Serializable {
	
    private static final long serialVersionUID = 8680136741369457332L;
    
    @Id
    @GeneratedValue(generator = "uuid")
    @GenericGenerator(name = "uuid", strategy = "uuid2")
    private String id;
    
    private String nombre;
    private String descripcion;
    private String tipoDeActivo;
    private String marca;
    private String modelo;
    private String anio;
    private String dominio;
    private String identificador;
    
    @ManyToOne
    private Empresa empresa;
    
    @Temporal(TemporalType.TIMESTAMP)
    private Date alta;
    
    @Temporal(TemporalType.TIMESTAMP)
    private Date modificacion;

    @Temporal(TemporalType.TIMESTAMP)
    private Date eliminado;

}
