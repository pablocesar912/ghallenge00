package com.logistica.web.enumeraciones;

import java.util.Arrays;
import java.util.List;

public enum Rol {

    ADMINISTRADOR, DADOR_CARGA, DADOR_FLOTA, DADOR_RED, TRANSPORTADOR, AMBAS, ADMIN_DADOR, ADMIN_TRANSPORTADOR,
    ADMIN_AMBAS, ADMINISTRADOR_LOCAL, CHOFER, INVITADO, SIN_ROL;

    public static List<Rol> getRolesTransportador() {
        return Arrays.asList(ADMIN_TRANSPORTADOR, ADMIN_AMBAS, TRANSPORTADOR, AMBAS, DADOR_FLOTA);
    }

    public static List<Rol> getRolesDador() {
        return Arrays.asList(ADMIN_DADOR, ADMIN_AMBAS, DADOR_CARGA, AMBAS, DADOR_RED, DADOR_FLOTA);
    }

    public static List<Rol> getRolesParaRegistro() {
        return Arrays.asList(DADOR_CARGA, TRANSPORTADOR, AMBAS, DADOR_RED, DADOR_FLOTA);
    }

}
