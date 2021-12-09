package com.logistica.web.modelos;

import lombok.Data;

@Data
public class OSModel {

    private String id;
    private String idPedido;
    private String nroInterno;
    private String cliente;
    private String destino;
    private String fechaInicioEstimada;
    private String horaInicioEstimada;
    private String estado;

}