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

import com.logistica.web.enumeraciones.TipoDeNotificacion;

import lombok.Data;

@Data
@Entity
public class Notificacion implements Serializable {
    private static final long serialVersionUID = -8891913900103657662L;
    @Id
    @GeneratedValue(generator = "uuid")
    @GenericGenerator(name = "uuid", strategy = "uuid2")
    private String id;

    private String mensaje;
    private String url;
    private boolean vista;
    
    @ManyToOne
    private Usuario usuario;
    
    @Enumerated(EnumType.STRING)
    private TipoDeNotificacion tipo;

    @ManyToOne
    private Empresa empresa;
    
    @Temporal(TemporalType.TIMESTAMP)
    private Date alta;
    @Temporal(TemporalType.TIMESTAMP)
    private Date baja;

    public String toString() {
        return "Notificación: " + id;
    }

}
