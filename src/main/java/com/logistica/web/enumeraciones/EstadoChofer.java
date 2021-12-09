package com.logistica.web.enumeraciones;

public enum EstadoChofer {

    LICENCIA("licencia"), OPERATIVO("operativo");

    private String texto;

    private EstadoChofer(String texto) {
        this.texto = texto;
    }

    public String getTexto() {
        return texto;
    }

}
