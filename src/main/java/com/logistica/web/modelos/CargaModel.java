package com.logistica.web.modelos;

import com.logistica.web.enumeraciones.EstadoCarga;

import lombok.Data;

@Data
public class CargaModel {

    private String id;
    private String descripcion;
    private Boolean cargaCompleta;
    private Integer peso;
    private String idUnidadMedida;
    private String nombreUnidadMedida;
    private Double metrosCubicos;
    private Integer cantidadCamiones;
    private Boolean conCustodia;
    private Boolean seguroCarga;
    private Boolean indivisible;
    private EstadoCarga estado;
    private String producto;
    private String idTipoEmbalaje;
    private String idTipoRemolque;
    private String idTipoVehiculo;
	private String idCliente;
	private String nombreCliente;
	private String razonSocialCliente;

}
