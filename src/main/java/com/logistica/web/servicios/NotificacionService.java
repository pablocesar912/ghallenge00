package com.logistica.web.servicios;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.logistica.web.convertidores.NotificacionConverter;
import com.logistica.web.entidades.Notificacion;
import com.logistica.web.modelos.NotificacionModel;
import com.logistica.web.repositorios.NotificacionRepository;

@Service("notificacionService")
public class NotificacionService {

	@Autowired
	private NotificacionConverter notificacionConverter;
	
	@Autowired
	private NotificacionRepository notificacionRepository;
	
	
	public Notificacion buscarNotificacionPorId(String idNotificacion) {
		return notificacionRepository.buscarNotificacionPorId(idNotificacion);
	}
	
	public List<NotificacionModel> buscarNotificacionesPorUsuario(String idUsuario){
		return notificacionConverter.entidadesToModelos(notificacionRepository.buscarNotificacionesPorUsuario(idUsuario));
	}
	public List<NotificacionModel> buscarAlertasPorUsuario(String idUsuario){
		return notificacionConverter.entidadesToModelos(notificacionRepository.buscarAlertasPorUsuario(idUsuario));
	}
	
	public Integer countByNotificacionesNoLeidas(String idUsuario){
		return notificacionRepository.countByNotificacionesNoLeidas(idUsuario);
	}
	public Integer countByAlertasNoLeidas(String idUsuario){
		return notificacionRepository.countByAlertasNoLeidas(idUsuario);
	}
}
