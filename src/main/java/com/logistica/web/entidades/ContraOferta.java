package com.logistica.web.entidades;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.GenericGenerator;

import com.logistica.web.enumeraciones.EstadoContraOferta;
import com.logistica.web.enumeraciones.EstadoNotificacion;

import lombok.Data;


@Data
@Entity
public class ContraOferta implements Serializable {

    private static final long serialVersionUID = 881280540260000190L;

    @Id
    @GeneratedValue(generator = "uuid")
    @GenericGenerator(name = "uuid", strategy = "uuid2")
    private String id;
    private Boolean seguroCarga;
    private Boolean incluyeBajadaAPiso;
    private Boolean aduana;
    private Boolean carteleriaCargaPeligrosa;
    private Boolean incluyeIva;
    private Double valor;
    private Integer diasLibres;
    private String comentarios;
    private Boolean isFinal;

    @Enumerated(EnumType.STRING)
    private EstadoContraOferta estado;
    
    private EstadoNotificacion notificacion;

    @ManyToMany
    private List<TipoRequisitoOferta> requisitosDeOferta = new ArrayList<>();

    @ManyToOne
    private Pedido pedido;

    @ManyToOne
    private Empresa transporte;
    
    @ManyToOne
    private Empresa dador;

    @ManyToOne
    private Usuario creador;

    @ManyToOne
    private Vehiculo vehiculo;

    @ManyToOne
    private Remolque remolque;

    @Temporal(TemporalType.TIMESTAMP)
    private Date eliminado;

    @Temporal(TemporalType.TIMESTAMP)
    private Date modificacion;

}
