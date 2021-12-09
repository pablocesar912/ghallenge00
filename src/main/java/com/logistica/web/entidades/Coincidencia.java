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
public class Coincidencia implements Serializable {
    private static final long serialVersionUID = 8118137275653132334L;
   
    @Id
    @GeneratedValue(generator = "uuid")
    @GenericGenerator(name = "uuid", strategy = "uuid2")
    private String id;

    @ManyToOne
    private Comision comision;

    @ManyToOne
    private Viaje viaje;

    @ManyToOne
    private Empresa transporte;

    @ManyToOne
    private Pedido pedido;

    private Double costo;
    private String detalle;
    private boolean aprobado;
    
    @Temporal(TemporalType.TIMESTAMP)
    private Date modificacion;

    @Temporal(TemporalType.TIMESTAMP)
    private Date eliminado;
}
