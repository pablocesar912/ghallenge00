package com.logistica.web.modelos.busqueda;

import java.util.ArrayList;
import java.util.List;

import lombok.Data;

@Data
public class BusquedaVehiculoModel {

    private String marca;
    private String modelo;
    private String tipoVehiculo;
    private String anio;
    private String query;
    private Boolean sensores;
    private Boolean rastreo;
    private List<String> idsTipoCarga;

    public BusquedaVehiculoModel() {
        idsTipoCarga = new ArrayList<>();
    }

}
