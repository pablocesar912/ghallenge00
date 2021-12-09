package com.logistica.web.entidades;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.GenericGenerator;

import com.logistica.web.enumeraciones.ActividadPrincipal;

import lombok.Data;

@Data
@Entity
public class Empresa implements Serializable {
    private static final long serialVersionUID = -9095677322316842757L;
    @Id
    @GeneratedValue(generator = "uuid")
    @GenericGenerator(name = "uuid", strategy = "uuid2")
    private String id;
    private String nombre;
    private String razonSocial;
    private String identificadorFiscal;
    private boolean identificadorFiscalVerificado;
    private String responsable;
    private String sitioWeb;
    private String telefono;
    private String mail;
    private boolean foto;

    @OneToOne
    private Ubicacion ubicacion;
    
    @OneToMany
    private List<Coincidencia> coincidencias;
    
    @ManyToOne
    private Pais pais;
    
    @Enumerated(EnumType.STRING)
    private ActividadPrincipal actividadPrincipal;
    
    @ManyToMany
    private List<Cliente> clientes;
    
    @OneToMany
    private List<Favorito> favoritos;

    @Temporal(TemporalType.TIMESTAMP)
    private Date modificacion;
    
    @Temporal(TemporalType.TIMESTAMP)
    private Date alta;

    @Temporal(TemporalType.TIMESTAMP)
    private Date eliminado;
    
    public String toString() {
    	return "Empresa: " + id;
    }

}
