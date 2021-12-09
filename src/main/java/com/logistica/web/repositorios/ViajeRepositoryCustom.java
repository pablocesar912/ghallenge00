package com.logistica.web.repositorios;

import java.util.List;

import com.logistica.web.entidades.Empresa;
import com.logistica.web.entidades.Viaje;
import com.logistica.web.modelos.busqueda.BusquedaViajeModel;


public interface ViajeRepositoryCustom {

	List<Viaje> buscarPorCriterios(BusquedaViajeModel viajeM, Empresa transporte);

	List<Viaje> buscarPorCriteriosPropios(BusquedaViajeModel viajeM, Empresa transporte);

}
