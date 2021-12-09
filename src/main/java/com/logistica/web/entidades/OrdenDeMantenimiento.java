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
public class OrdenDeMantenimiento implements Serializable {
    private static final long serialVersionUID = -8760420452725226605L;

    @Id
    @GeneratedValue(generator = "uuid")
    @GenericGenerator(name = "uuid", strategy = "uuid2")
    private String id;
    
    private String nroOrden;

    @Temporal(TemporalType.TIMESTAMP)
    private Date fecha;
    @Temporal(TemporalType.TIMESTAMP)
    private Date fechaInicioEstimada;
    @Temporal(TemporalType.TIMESTAMP)
    private Date fechaInicioReal;
    @Temporal(TemporalType.TIMESTAMP)
    private Date fechaFinEstimada;
    @Temporal(TemporalType.TIMESTAMP)
    private Date fechaFinReal;
    @ManyToOne
    private Vehiculo vehiculo;
    @ManyToOne
    private Remolque remolque;
    @ManyToOne
    private Empresa empresa;
    private String tipoOM;
    private String pedido;
    private int plazo;
    private String aprobadoPor;
    private String pedidaPor;
    private String detalle;
    private int kmIngreso;
    private String estado;
    private int kmRegistrados;
    
    @Temporal(TemporalType.TIMESTAMP)
    private Date modificacion;
    @Temporal(TemporalType.TIMESTAMP)
    private Date eliminado;
    
    @ManyToOne
	private Usuario eliminador;
    
    private String motivo;

}
