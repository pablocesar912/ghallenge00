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
import org.hibernate.search.annotations.Indexed;
import org.hibernate.search.annotations.Latitude;
import org.hibernate.search.annotations.Longitude;
import org.hibernate.search.annotations.Spatial;

import lombok.Data;
import lombok.ToString;

@Data
@ToString(onlyExplicitlyIncluded = true)
@Entity
@Indexed
@Spatial
public class Ubicacion implements Serializable {
    private static final long serialVersionUID = -6044435567656820601L;

    @Id
    @GeneratedValue(generator = "uuid")
    @GenericGenerator(name = "uuid", strategy = "uuid2")
    @ToString.Include
    private String id;
    @ToString.Include(name = "dir")
    private String direccion;
    private String descripcion;
    @Latitude
    @ToString.Include
    private Double latitud;
    @Longitude
    @ToString.Include
    private Double longitud;
    private String codigoPostal;
    private Boolean isMasterPoint;
    @ManyToOne
    private Pais pais;

    @Temporal(TemporalType.TIMESTAMP)
    private Date eliminado;
    @Temporal(TemporalType.TIMESTAMP)
    private Date modificacion;
    
    private String referencia;

}
