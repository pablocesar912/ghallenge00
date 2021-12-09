package com.logistica.web.modelos;

import java.util.List;

import com.logistica.web.enumeraciones.ActividadPrincipal;

import lombok.Data;

@Data
public class EmpresaModel {
    private String id;
    private String nombre;
    private String idUbicacion;
    private List<String> idCoincidencias;
    private List<String> idClientes;
    private List<String> idFavoritos;
    private String razonSocial;
    private String responsable;
    private String sitioWeb;
    private String telefono;
    private String identificadorFiscal;
    private boolean identificadorFiscalVerificado;
    private String mail;
    private String idPais;
    private ActividadPrincipal actividadPrincipal;
	private boolean foto;
    

}