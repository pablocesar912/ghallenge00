package com.logistica.web.modelos;

import com.logistica.web.entidades.Rol;
import com.logistica.web.enumeraciones.ActividadPrincipal;

import lombok.Data;

@Data
public class UsuarioModel {
    private String id;
    private String nombre;
    private String apellido;
    private String user;
    private String clave;
    private String clave1;
    private String clave2;
    private String telefono;
    private String identificador;

    private String mail;
    private String descripcion;
    private String idPais;
    private String idUbicacion;
    private String idEmpresa;
    private Rol rol;
    private ActividadPrincipal actividad;
    
    private boolean foto;
}
