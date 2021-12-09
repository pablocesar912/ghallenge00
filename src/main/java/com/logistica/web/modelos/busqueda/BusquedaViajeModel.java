package com.logistica.web.modelos.busqueda;

import java.util.ArrayList;
import java.util.List;

import com.logistica.web.enumeraciones.EstadoContraOferta;

import lombok.Data;

@Data
public class BusquedaViajeModel {

    private String tipoDeViaje;
    private List<String> tipoDeCarga = new ArrayList<>();
    private String tipoDeEmbalaje;
    private String tipoDeCamion;
    private String vehiculo;
    private String idModelo;
    private String chofer;
    private String tipoDeRemolque;
    private String producto;
    private String origen;
    private String destino;
    private String fechaDesde;
    private String fechaHasta;
    private String q;
    private Double valor;
    private Double kms;
    private EstadoContraOferta estado;

    @Override
    public String toString() {
        return "?tipoDeViaje=" + (tipoDeViaje != null ? tipoDeViaje : "")
                + "&tipoDeCarga=" + (tipoDeCarga != null ? tipoDeCarga : "")
                + "&tipoDeEmbalaje=" + (tipoDeEmbalaje != null ? tipoDeEmbalaje : "")
                + "&tipoDeCamion=" + (tipoDeCamion != null ? tipoDeCamion : "")
                + "&tipoDeRemolque=" + (tipoDeRemolque != null ? tipoDeRemolque : "")
                + "&origen=" + (origen != null ? origen : "")
                + "&destino=" + (destino != null ? destino : "")
                + "&fechaDesde=" + (producto != null ? producto : "")
                + "&producto=" + (fechaDesde != null ? fechaDesde : "")
                + "&fechaHasta=" + (fechaHasta != null ? fechaHasta : "")
                + "&q=" + (q != null ? q : "")
                + "&valor=" + (valor != null ? valor : "")
                + "&kms=" + (kms != null ? kms : "")
                + "&estado=" + (estado != null ? estado : "")
                + "&chofer=" + (chofer != null ? chofer : "")
                + "&vehiculo=" + (vehiculo != null ? vehiculo : "")
                + "&idModelo=" + (idModelo != null ? idModelo : "");
    }

}
