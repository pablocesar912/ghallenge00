package com.logistica.web.convertidores;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.logistica.web.errores.WebException;


public abstract class Convertidor<M extends Object, E extends Object> {
    public abstract E modeloToEntidad(M m) throws WebException;

    public abstract M entidadToModelo(E e);

    protected Log log;

    public Convertidor() {
        this.log = LogFactory.getLog(getClass());
    }

}
