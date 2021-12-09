package com.logistica.web.modelos;

import java.util.ArrayList;
import java.util.List;

import com.logistica.web.entidades.WayPoint;
import com.logistica.web.enumeraciones.EstadoViaje;

import lombok.Data;

@Data
public class ViajeModel {

    private String id;
    private String idChofer;
    private String idVehiculo;
    private String idRemolque;
    private String fechaCarga;
    private String horaCarga;
    
    private String fechaDescarga;
    private String horaDescarga;
    
    private String llegada;
    private String partida;
    
    private String kms;
    private String idUbicacionInicial;
    private String idUbicacionFinal;
    private Double presupuesto;
    private Long idPedido;
    private Boolean isCargaNegativa;
    private EstadoViaje estadoViaje;
    
    private List<String> idChecklist = new ArrayList<>();
    
    private List<String> steps = new ArrayList<>();
    private List<WayPoint> wayPoints;
    private String points;

}