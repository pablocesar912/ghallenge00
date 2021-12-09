package com.logistica.web.modelos;

import java.util.List;

import com.logistica.web.enumeraciones.EstadoPedido;
import com.logistica.web.enumeraciones.TipoDeViaje;

import lombok.Data;

@Data
public class PedidoModel {

    private Long id;
    private String descripcion;
    private String nroInterno;
    private TipoDeViaje tipoDeViaje;
    private TipoDeViaje tipoInternacional;
    private EstadoPedido estadoPedido;
    private String idCarga;
    private CargaModel carga;
    private String idPeriodoDeCarga;
    private String idPeriodoDeDescarga;
    private String inicio;
    private String fin;
    private List<String> idRequisitos;
    private String idUbicacionDesde;
    private String idUbicacionHasta;
    private Boolean isGrupo;
    private String kmTotales;
    private Boolean recibirOfertas;
    private String moneda;
    private String monedaSimbolo;
    private String condicionPago;
    private Double valor;
    private Boolean pagaAlTransportista;
    private Boolean asignadoATransportador;
    private Boolean finalizado;
    private String idContenedor;
    private String idDadorUsuario;
    private String idDador;
    private List<String> idCoincidencias;

}