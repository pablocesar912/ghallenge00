package com.logistica.web.servicios;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.logistica.web.entidades.Rol;
import com.logistica.web.entidades.Usuario;
import com.logistica.web.errores.EventoRestException;
import com.logistica.web.errores.WebException;
import com.logistica.web.repositorios.RolRepository;

@Service("rolService")
public class RolService {

	@Autowired
	private RolRepository rolRepository;

	public List<Rol> listarRol() {
		return rolRepository.findAll();
	}

	public List<Rol> buscarTodos() {
		return rolRepository.buscarTodos();
	}
	
	public List<Rol> buscarAdmin() {
		return rolRepository.buscarAdmin();
	}

	public List<Rol> buscarTodosPorIdCreador(Usuario creador) {
		return rolRepository.buscarTodosPorIdCreador(creador);
	}
	
	public List<Rol> getRolesEmpresa(String idEmpresa) {
		List<Rol> roles = rolRepository.buscarTodosPorEmpresa(idEmpresa);
        return roles;
    }
	
	public List<Rol> buscarTodosPorEmpresa(String idEmpresa) {
		List<Rol> roles = rolRepository.buscarTodosPorEmpresa(idEmpresa);
		List<Rol> rolesAdmin = rolRepository.buscarRolesPlataforma();
		roles.addAll(rolesAdmin);
		return roles;
	}

	public Rol buscarPorId(String id) {
		return rolRepository.buscarPorId(id);
	}

	public Rol buscarPorNombre(String nombre) {
		return rolRepository.buscarPorNombre(nombre);
	}

	public Page<Rol> buscarTodos(Pageable paginable, String q) {
		if (q == null || q.isEmpty()) {
			return rolRepository.buscarTodos(paginable);
		} else {
			return rolRepository.buscarTodos(paginable, "%" + q + "%");
		}
	}

	private void validarRol(Rol entidad) throws WebException {
		if (isStringNull(entidad.getNombre())) {
			throw new WebException("El nombre no puede estar vacio.");
		}
/*
		if (entidad.getPermisos().size() < 1) {
			throw new WebException("Debe seleccionar al menos un permiso.");
		}*/
	}

	public Rol eliminar(String id) {
		Rol rol = buscarPorId(id);
		if (rol == null) {
			throw new EventoRestException("El rol que trata eliminar no se encuentra en la base de datos");
		}
		rol.setBaja(new Date());
		rolRepository.save(rol);
		return rol;
	}
	
	public Boolean isStringNull(String valor) {
		return valor == null || valor.isEmpty() || valor.equals("");
	}

}