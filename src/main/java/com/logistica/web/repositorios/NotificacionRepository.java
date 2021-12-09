package com.logistica.web.repositorios;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.logistica.web.entidades.Notificacion;

@Repository("notificacionRepository")
public interface NotificacionRepository extends JpaRepository<Notificacion, String>{
	
	@Query("SELECT n FROM Notificacion n WHERE n.baja IS NULL AND n.id = :idNotificacion")
	public Notificacion buscarNotificacionPorId(@Param("idNotificacion") String idNotificacion);
	
	@Query("SELECT n FROM Notificacion n WHERE n.baja IS NULL AND n.usuario.id = :idUsuario and n.tipo in ('NUEVA_CARGA','NUEVA_COTIZACION','CAMBIO_ESTADO','NUEVO_ACUERDO','NUEVO_DOCUMENTO','AVISO_VENCIMIENTO_15','NUEVO_PEDIDO_FAVORITO','ACEPTACION_FAVORITO','VIAJE_FINALIZADO') ORDER BY n.alta DESC")
	public List<Notificacion> buscarNotificacionesPorUsuario(@Param("idUsuario") String idUsuario);
	
	@Query("SELECT COUNT(n) FROM Notificacion n WHERE n.baja IS NULL AND n.usuario.id = :idUsuario and n.vista = false and n.tipo in ('NUEVA_CARGA','NUEVA_COTIZACION','CAMBIO_ESTADO','NUEVO_ACUERDO','NUEVO_DOCUMENTO','AVISO_VENCIMIENTO_15','NUEVO_PEDIDO_FAVORITO','ACEPTACION_FAVORITO','VIAJE_FINALIZADO') ORDER BY n.alta DESC")
	public Integer countByNotificacionesNoLeidas(@Param("idUsuario") String idUsuario);
	
	@Query("SELECT COUNT(n) FROM Notificacion n WHERE n.baja IS NULL AND n.usuario.id = :idUsuario and n.vista = false and n.tipo in ('RECHAZO_CARGA','SOS','AVISO_VENCIMIENTO_1','AVISO_VENCIMIENTO_7') ORDER BY n.alta DESC")
	public Integer countByAlertasNoLeidas(@Param("idUsuario") String idUsuario);
	
	@Query("SELECT n FROM Notificacion n WHERE n.baja IS NULL AND n.usuario.id = :idUsuario and n.tipo in ('RECHAZO_CARGA','SOS','AVISO_VENCIMIENTO_1','AVISO_VENCIMIENTO_7') ORDER BY n.alta DESC")
	public List<Notificacion> buscarAlertasPorUsuario(@Param("idUsuario") String idUsuario);
	
	@Query("SELECT n FROM Notificacion n WHERE n.baja IS NULL AND n.empresa.id = :idEmpresa ORDER BY n.alta DESC")
	public List<Notificacion> buscarNotificacionesPorEmpresa(@Param("idEmpresa") String idEmpresa);

}
