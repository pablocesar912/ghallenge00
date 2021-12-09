package com.logistica.web.servicios;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.logistica.web.convertidores.EmpresaConverter;
import com.logistica.web.entidades.Configuracion;
import com.logistica.web.entidades.Empresa;
import com.logistica.web.modelos.EmpresaModel;
import com.logistica.web.repositorios.EmpresaRepository;

@Service
public class EmpresaService {


	@Autowired
	private EmpresaRepository empresaRepository;
	
	@Autowired
	private EmpresaConverter empresaConverter;



	public Page<Empresa> listarActivos(Pageable paginable, String q) {
		return empresaRepository.buscarActivos(paginable, "%" + q + "%");
	}

	public Page<Empresa> listarActivos(Pageable paginable) {
		return empresaRepository.buscarActivos(paginable);
	}

	public List<Empresa> listarActivos() {
		return empresaRepository.buscarActivos();
	}

	public List<EmpresaModel> listarActivosModel() {
		List<Empresa> empresaes = empresaRepository.buscarActivos();
		List<EmpresaModel> modelos = empresaConverter.entidadesToModelos(empresaes);
		return modelos;
	}

	public EmpresaModel buscar(String id) {
		Empresa empresa = empresaRepository.getOne(id);
		return empresaConverter.entidadToModelo(empresa);
	}

	public Empresa buscarEntidad(String id) {
		return empresaRepository.findById(id).orElse(null);
	}

	public List<Configuracion> buscarConfiguracionEmpresa(String id) {
		return empresaRepository.buscarConfiguracionEmpresa(id);
	}

}