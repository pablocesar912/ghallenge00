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
public class TipoDocumentacion implements Serializable {

    private static final long serialVersionUID = -4291801271584410308L;

    @Id
    @GeneratedValue(generator = "uuid")
    @GenericGenerator(name = "uuid", strategy = "uuid2")
    private String id;

    private String nombre;

    private Boolean obligatorioVehiculo;
    private Boolean obligatorioRemolque;
    private Boolean obligatorioChofer;
    
    @ManyToOne
    private Pais pais;
    
    @ManyToOne
    private Empresa empresa;
    
    private String descripcion;

    @Temporal(TemporalType.TIMESTAMP)
    private Date eliminado;

    @Temporal(TemporalType.TIMESTAMP)
    private Date modificacion;

}
