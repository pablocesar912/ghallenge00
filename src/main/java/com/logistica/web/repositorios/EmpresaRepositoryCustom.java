package com.logistica.web.repositorios;


import java.util.Date;
import java.util.List;

import com.logistica.web.entidades.Empresa;


public interface EmpresaRepositoryCustom {

	List<Empresa> buscarPorCriteriosParaUsuariosModel(Integer pedidos, Date fechaInicio, Date fechaFinal, Boolean admin, String q, String idPais,
			String idPropio);

}
