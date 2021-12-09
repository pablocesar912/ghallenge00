package com.logistica.web.entidades;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.GenericGenerator;

import com.logistica.web.enumeraciones.EstadoVehiculo;

import lombok.Data;

@Data
@Entity
public class Vehiculo implements Serializable {
    private static final long serialVersionUID = -8891913900103657662L;
    @Id
    @GeneratedValue(generator = "uuid")
    @GenericGenerator(name = "uuid", strategy = "uuid2")
    private String id;

    @ManyToOne
    private TipoVehiculo tipoVehiculo;

    @ManyToOne
    private Modelo modelo;

    private String dominio;
    private String anioFabricacion;
    private boolean rastreoSatelital;
    private boolean sensores;
    private boolean estado;
    
    @Enumerated(EnumType.STRING)
    private EstadoVehiculo estadoVehiculo;

    @ManyToOne
    private Empresa empresa;
    
    @Temporal(TemporalType.TIMESTAMP)
    private Date alta;
    
    @Temporal(TemporalType.TIMESTAMP)
    private Date modificacion;

    @Temporal(TemporalType.TIMESTAMP)
    private Date eliminado;

    public String toString() {
        return "Vehiculo: " + id;
    }

}
