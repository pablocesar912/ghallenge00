package com.logistica.web.entidades;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import lombok.Data;

@Data
@Entity
public class Documentacion implements Serializable {

    private static final long serialVersionUID = -185466543879822589L;

    @Id
    private String id;
    
    private String titulo;
    private String descripcion;

    @ElementCollection
    private List<String> archivos = new ArrayList<>();

    @ManyToOne
    private TipoDocumentacion tipoDocumentacion;
    
    @ManyToOne
    private Chofer chofer;
    
    @ManyToOne
    private Vehiculo vehiculo;
    
    @ManyToOne
    private Remolque remolque;
    
    @ManyToOne
    private Usuario usuario;
    
    @ManyToOne
    private Viaje viaje;

    @Temporal(TemporalType.TIMESTAMP)
    private Date vencimiento;
    
    @Temporal(TemporalType.TIMESTAMP)
    private Date modificacion;
    
    @Temporal(TemporalType.TIMESTAMP)
    private Date eliminado;

}
