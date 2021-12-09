package com.logistica.web.entidades;


import java.io.Serializable;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.GenericGenerator;

import lombok.Data;

@Data
@Entity
public class PeriodoDeCarga implements Serializable {

    private static final long serialVersionUID = 2365992523898453280L;

    @Id
    @GeneratedValue(generator = "uuid")
    @GenericGenerator(name = "uuid", strategy = "uuid2")
    private String id;
    //	 @Temporal(TemporalType.TIMESTAMP)
    private String inicio;
    //	 @Temporal(TemporalType.TIMESTAMP)
    private String finalizacion;
    private String horaInicio;
    private String horaFinalizacion;
    private Boolean cargaNocturna;
    private String descripcion;


    @Temporal(TemporalType.TIMESTAMP)
    private Date modificacion;
    @Temporal(TemporalType.TIMESTAMP)
    private Date eliminado;


}
