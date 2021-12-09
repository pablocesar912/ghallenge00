package com.logistica.web.entidades;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.logistica.web.enumeraciones.EstadoPedido;
import com.logistica.web.enumeraciones.TipoDeViaje;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(onlyExplicitlyIncluded = true)
@Entity
public class Pedido implements Serializable {
    private static final long serialVersionUID = 1743959293203607986L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @EqualsAndHashCode.Include
    private Long id;
    
    @Enumerated(EnumType.STRING)
    private TipoDeViaje tipoDeViaje;
    
    @Enumerated(EnumType.STRING)
    private TipoDeViaje tipoInternacional;

    @ManyToOne
    private Moneda moneda;
    
    @ManyToOne
    private CondicionPago condicionPago;
    
    @Enumerated(EnumType.STRING)
    private EstadoPedido estadoPedido;
    
    @OneToOne(cascade = CascadeType.ALL)
    private Carga carga;
    
    @OneToOne(cascade = CascadeType.ALL)
    private PeriodoDeCarga periodoDeCarga;
    
    @OneToOne(cascade = CascadeType.ALL)
    private PeriodoDeCarga periodoDeDescarga;
    
    @OneToMany(fetch = FetchType.LAZY)
    private List<Requisito> requisitos;
    
    @ManyToOne
    private Ubicacion ubicacionDesde;
    
    @ManyToOne
    private Ubicacion ubicacionHasta;
    
    @ManyToOne
    private Contenedor contenedor;
    
    @ManyToOne
    private Usuario dadorUsuario;
    
    @ManyToOne
    private Empresa dador;
    
    @OneToMany(mappedBy = "pedido", fetch = FetchType.LAZY)
    private List<Coincidencia> coincidencias;
    
    @Temporal(TemporalType.TIMESTAMP)
    private Date modificacion;
    
    @Temporal(TemporalType.TIMESTAMP)
    private Date eliminado;

    private Boolean isGrupo;
    
    private String kmTotales;
    private Boolean recibirOfertas;
    private Double valor;
    private Boolean pagaAlTransportista;
    private Boolean asignadoATransportador;
    private Boolean finalizado;

    private String descripcion;
    private String nroInterno;

    
    public String toString() {
    	return "Pedido: "+ id;
    }
}
