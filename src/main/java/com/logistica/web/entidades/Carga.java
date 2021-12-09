package com.logistica.web.entidades;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.GenericGenerator;

import com.logistica.web.enumeraciones.EstadoCarga;

import lombok.Data;

@Data
@Entity
public class Carga implements Serializable {
    private static final long serialVersionUID = 2140785912567980419L;
   
    @Id
    @GeneratedValue(generator = "uuid")
    @GenericGenerator(name = "uuid", strategy = "uuid2")
    private String id;
    private String descripcion;
    
    @ManyToOne
    private UnidadMedida unidadMedida;
    private Double metrosCubicos;
    
    private Integer peso;
    private Integer cantidadCamiones;
    
    private Boolean conCustodia;
    private Boolean seguroCarga;
    private Boolean indivisible;
    private Boolean cargaCompleta;
    
    @Enumerated(EnumType.STRING)
    private EstadoCarga estado;                       
    
    @ManyToOne
    private TipoVehiculo tipoVehiculo;
    
    @ManyToOne
    private Cliente cliente;
    
    @ManyToOne
    private Ubicacion origen;
    
    @ManyToOne
    private Ubicacion destino;
    
    @ManyToMany(fetch = FetchType.LAZY)
    private List<Caracteristica> caracteristicas;
    
    @ManyToMany(fetch = FetchType.LAZY)
    private List<Accesorio> accesorios;
    
    @ManyToOne
    private TipoRemolque tipoRemolque;
    
    @ManyToMany(fetch = FetchType.LAZY)
    private List<TipoCarga> tipoCargas;
    
    @ManyToOne
    private TipoEmbalaje tipoEmbalaje;
    
    private String producto;

    @Temporal(TemporalType.TIMESTAMP)
    private Date modificacion;
    
    @Temporal(TemporalType.TIMESTAMP)
    private Date eliminado;

}
