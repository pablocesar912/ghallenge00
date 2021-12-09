package com.logistica.web.entidades;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.GenericGenerator;

import lombok.Data;


@Entity
@Data
public class Usuario implements Serializable {

    private static final long serialVersionUID = -5408954174563706625L;
    @Id
    @GeneratedValue(generator = "uuid")
    @GenericGenerator(name = "uuid", strategy = "uuid2")
    private String id;
    private String mail;
    private String user;
    private String clave;
    private String nombre;
    private String apellido;
    private String telefono;
    private String identificador;
    private boolean identificadorVerificado;

    @Temporal(TemporalType.TIMESTAMP)
    private Date ultimoRecuperarClave;

    @ManyToOne
    private Pais pais;
    
    @ManyToOne
    private Empresa empresa;

    @OneToOne
    private Ubicacion ubicacion;

    @ManyToOne
    private Rol rol;

    @Temporal(TemporalType.TIMESTAMP)
    private Date eliminado;

    @Temporal(TemporalType.TIMESTAMP)
    private Date modificacion;
    
    private boolean foto;

}
