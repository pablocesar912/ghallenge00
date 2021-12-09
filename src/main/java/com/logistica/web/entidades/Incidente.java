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
public class Incidente implements Serializable {

private static final long serialVersionUID = 8680136741369457332L;
    
    @Id
    @GeneratedValue(generator = "uuid")
    @GenericGenerator(name = "uuid", strategy = "uuid2")
    private String id;
    
    private String identificador;
    private String descripcion;
    private String tipo;
    private String estado;
    private String prioridad;
    
    @ManyToOne
    private Vehiculo vehiculo;
    @ManyToOne
    private Remolque remolque;
    @ManyToOne
    private Activo activo;
    @ManyToOne
    private Empresa empresa;
    
    @Temporal(TemporalType.TIMESTAMP)
    private Date alta;
    
    @Temporal(TemporalType.TIMESTAMP)
    private Date modificacion;

    @Temporal(TemporalType.TIMESTAMP)
    private Date eliminado;
    
}
