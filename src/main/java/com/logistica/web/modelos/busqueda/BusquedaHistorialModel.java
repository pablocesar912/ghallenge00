package com.logistica.web.modelos.busqueda;

import com.logistica.web.enumeraciones.EstadoContraOferta;

import lombok.Data;

@Data
public class BusquedaHistorialModel {

    private Double valor;
    private EstadoContraOferta estado;
    private String comentario;
    private Long idPedido;
    private String modificacion;

    public BusquedaHistorialModel() {
        comentario = "";
        modificacion = "";
    }

    @Override
    public String toString() {
        return "?valor=" + (valor != null ? valor : "")
                + "&estado=" + (estado != null ? estado : "")
                + "&comentario=" + comentario
                + "&idPedido=" + (idPedido != null ? idPedido : "")
                + "&modificacion=" + modificacion;
    }
}
