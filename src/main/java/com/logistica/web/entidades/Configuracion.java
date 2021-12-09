package com.logistica.web.entidades;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToOne;

import org.hibernate.annotations.GenericGenerator;

import lombok.Data;

@Data
@Entity
public class Configuracion implements Serializable {

	private static final long serialVersionUID = -9095677322316842757L;
    @Id
    @GeneratedValue(generator = "uuid")
    @GenericGenerator(name = "uuid", strategy = "uuid2")
    private String id;
    private String grupo;
    private String nombre;
    private String nombre_amigable;
    private boolean activo;
    
    @OneToOne
    private Empresa empresa;
    
    @OneToOne
    private Usuario usuario;
    
    private boolean plantilla;
}
