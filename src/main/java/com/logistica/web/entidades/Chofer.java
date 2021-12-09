package com.logistica.web.entidades;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.GenericGenerator;

import com.logistica.web.enumeraciones.EstadoChofer;
import com.logistica.web.enumeraciones.TipoDocumento;

import lombok.Data;

@Data
@Entity
public class Chofer implements Serializable {
    private static final long serialVersionUID = -8645116754945685023L;
    @Id
    @GeneratedValue(generator = "uuid")
    @GenericGenerator(name = "uuid", strategy = "uuid2")
    private String id;
    private String nombre;
    private String apellido;

    @Enumerated(EnumType.ORDINAL)
    private TipoDocumento tipoDocumento;
    
    @Enumerated(EnumType.STRING)
    private EstadoChofer estadoChofer;
    
    @ManyToOne
    private Tracking ultima;

    private String documento;
    private String email;
    private String emailAdicional;
    private String telefono;
    private String telefonoAdicional;
    private Boolean estado;

    @OneToOne
    private Usuario usuario;

    @ManyToOne
    private Empresa empresa;
    
    @OneToMany
    private List<TipoCarga> tipoCarga;
    
    @Temporal(TemporalType.TIMESTAMP)
    private Date alta;

    @Temporal(TemporalType.TIMESTAMP)
    private Date modificacion;

    @Temporal(TemporalType.TIMESTAMP)
    private Date eliminado;
}
