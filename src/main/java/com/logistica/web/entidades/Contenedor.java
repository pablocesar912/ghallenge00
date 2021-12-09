package com.logistica.web.entidades;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.GenericGenerator;

import lombok.Data;

@Data
@Entity
public class Contenedor implements Serializable {
    private static final long serialVersionUID = -8891913900103657662L;
    @Id
    @GeneratedValue(generator = "uuid")
    @GenericGenerator(name = "uuid", strategy = "uuid2")
    private String id;
    private String descripcion;
    @OneToOne(cascade = {CascadeType.ALL})
    private Ubicacion ubicacionRetiro;
    @OneToOne(cascade = {CascadeType.ALL})
    private Ubicacion ubicacionEntrega;
    @OneToMany
    private List<Documentacion> documentacion;
    @Temporal(TemporalType.TIMESTAMP)
    private Date modificacion;
    @Temporal(TemporalType.TIMESTAMP)
    private Date eliminado;

}
