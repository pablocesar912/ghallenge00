package com.logistica.web.entidades;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToOne;

import org.hibernate.annotations.GenericGenerator;

import com.logistica.web.enumeraciones.EstadoVehiculo;

import lombok.Data;

@Data
@Entity
public class ReporteVehiculo implements Serializable {
    private static final long serialVersionUID = -8891913900103657662L;
    @Id
    @GeneratedValue(generator = "uuid")
    @GenericGenerator(name = "uuid", strategy = "uuid2")
    private String id;

    @Enumerated(EnumType.STRING)
    private EstadoVehiculo estado;

    private int kilometros;

    private String documentacion;
    @OneToOne
    private Vehiculo vehiculo;


}
