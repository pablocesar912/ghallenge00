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
public class VehiculoRemolque implements Serializable {
    private static final long serialVersionUID = -8891913900103657662L;
    @Id
    @GeneratedValue(generator = "uuid")
    @GenericGenerator(name = "uuid", strategy = "uuid2")
    private String id;
    
    @ManyToOne
    private Vehiculo vehiculo;
    
    @ManyToOne
    private Remolque remolque;
    
    @ManyToOne
    private Empresa empresa;
    
    @Temporal(TemporalType.TIMESTAMP)
    private Date modificacion;
    
    @Temporal(TemporalType.TIMESTAMP)
    private Date eliminado;

}
