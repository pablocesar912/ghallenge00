package com.logistica.web.convertidores;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.logistica.web.entidades.Notificacion;
import com.logistica.web.entidades.Usuario;
import com.logistica.web.modelos.NotificacionModel;
import com.logistica.web.servicios.EmpresaService;
import com.logistica.web.servicios.NotificacionService;
import com.logistica.web.servicios.UsuarioService;


@Component
public class NotificacionConverter extends Convertidor<NotificacionModel, Notificacion>{

	@Autowired
	private NotificacionService notificacionService;
	
	@Autowired
	private UsuarioService usuarioService;
	
	@Autowired
	private EmpresaService empresaService;
	
	public Notificacion modeloToEntidad(NotificacionModel modelo) {
		Notificacion notificacion = new Notificacion();
		if (modelo.getId() != null && !modelo.getId().isEmpty()) {
			notificacion = notificacionService.buscarNotificacionPorId(modelo.getId());
		}
		try {
			BeanUtils.copyProperties(modelo, notificacion);
			Usuario usuario = usuarioService.buscar(modelo.getIdUsuario());
			notificacion.setUsuario(usuario);
			if(modelo.getIdEmpresa() != null && !modelo.getIdEmpresa().isEmpty()) {
				notificacion.setEmpresa(empresaService.buscarEntidad(modelo.getIdEmpresa()));
			}
			
		} catch (Exception e) {
			log.error("Error al convertir el modelo de notificacion en entidad", e);
		}
		return notificacion;
	}
	
	public NotificacionModel entidadToModelo(Notificacion notificacion) {
		NotificacionModel modelo = new NotificacionModel();
		try {
		    BeanUtils.copyProperties(notificacion, modelo);
		    
		    if(notificacion.getUsuario() != null) {
		    	modelo.setIdUsuario(notificacion.getUsuario().getId());
		    	modelo.setEmisor(notificacion.getUsuario().getApellido() + " " + notificacion.getUsuario().getNombre());
		    }
		    
		} catch (Exception e) {
		    log.error("Error al convertir la entidad en el modelo de notificacion", e);
		}
		return modelo;
    }

    public List<NotificacionModel> entidadesToModelos(List<Notificacion> notificacions) {
		List<NotificacionModel> modelos = new ArrayList<>();
		for (Notificacion notificacion : notificacions) {
		    modelos.add(entidadToModelo(notificacion));
		}
		return modelos;
    }

    public List<Notificacion> modelosEntidades(List<NotificacionModel> mNotificacions) {
		List<Notificacion> entidades = new ArrayList<>();
		for (NotificacionModel mNotificacion: mNotificacions) {
		    entidades.add(modeloToEntidad(mNotificacion));
		}
		return entidades;
    }
}
