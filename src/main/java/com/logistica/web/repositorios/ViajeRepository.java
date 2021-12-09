package com.logistica.web.repositorios;

import java.util.Date;
import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.logistica.web.entidades.Viaje;

@Repository
public interface ViajeRepository extends JpaRepository<Viaje, String>, ViajeRepositoryCustom {

    List<Viaje> findByEliminadoNull();

    @Query("SELECT a from Viaje a WHERE a.eliminado IS NULL")
    Page<Viaje> buscarActivos(Pageable pageable);

    @Query("SELECT a from Viaje a WHERE a.eliminado IS NULL ORDER BY a.modificacion")
    List<Viaje> buscarActivos();
    
    @Query("SELECT a from Viaje a WHERE a.eliminado IS NULL and a.pedido.id = :pedidoId ORDER BY a.modificacion")
    Viaje buscarPorPedido(@Param("pedidoId")Long pedidoId);
    
    @Query("SELECT a from Viaje a WHERE a.eliminado IS NULL AND a.chofer.id LIKE :id and (a.estadoViaje != 'CANCELADO' AND a.estadoViaje != 'FINALIZADO') and a.ubicacionInicial != null and a.ubicacionFinal != null")
    Viaje buscarActivoPorChoferId(@Param("id")String id);
    
    @Query("SELECT a from Viaje a WHERE a.eliminado IS NULL AND a.isCargaNegativa = true ORDER BY a.modificacion")
    Page<Viaje> buscarActivosCargaNegativa(Pageable page);
    
    @Query("SELECT a from Viaje a WHERE a.eliminado IS NULL AND a.isCargaNegativa = true AND a.transporte.id LIKE :empresaId ORDER BY a.modificacion")
    Page<Viaje> buscarActivosCargaNegativaPorTransporteId(Pageable page, @Param("empresaId")String empresaId);
    
    @Query("SELECT a from Viaje a WHERE a.eliminado IS NULL AND a.transporte.id LIKE :empresaId and a.estadoViaje = 'PLANIFICADO' ORDER BY a.modificacion")
    Page<Viaje> buscarActivosPorTransporteId(Pageable page, @Param("empresaId")String empresaId);
    
    @Query("SELECT a from Viaje a WHERE a.eliminado IS NULL AND a.transporte.id LIKE :empresaId and a.estadoViaje = 'SIN_PLANIFICAR' ORDER BY a.modificacion")
    Page<Viaje> buscarOSPorTransporteId(Pageable page, @Param("empresaId")String empresaId);
    
    @Query("SELECT a from Viaje a WHERE a.eliminado IS NULL AND a.transporte.id LIKE :empresaId and a.estadoViaje = 'SIN_PLANIFICAR' ORDER BY a.modificacion")
    List<Viaje> buscarOSPorTransporteId(@Param("empresaId")String empresaId);
    
    @Query("SELECT a from Viaje a WHERE a.eliminado IS NULL AND a.transporte.id LIKE :empresaId ORDER BY a.modificacion")
    Page<Viaje> buscarOTPorTransporteId(Pageable page, @Param("empresaId")String empresaId);
    
    @Query("SELECT a from Viaje a WHERE a.eliminado IS NULL AND a.transporte.id LIKE :empresaId ORDER BY a.modificacion")
    List<Viaje> buscarOTPorTransporteId(@Param("empresaId")String empresaId);
    
    @Query("SELECT a from Viaje a WHERE a.eliminado IS NULL and a.estadoViaje != 'SIN_PLANIFICAR' and a.estadoViaje != 'FINALIZADO' and a.estadoViaje != 'CANCELADO' AND a.transporte.id LIKE :empresaId ORDER BY a.modificacion")
    List<Viaje> buscarOTPorTransporteIdActivos(@Param("empresaId")String empresaId);
    
    @Query("SELECT a from Viaje a WHERE a.eliminado IS NULL AND a.chofer.id LIKE :id and (a.estadoViaje != 'CANCELADO' AND a.estadoViaje != 'FINALIZADO') and a.ubicacionInicial != null and a.ubicacionFinal != null ORDER BY a.modificacion")
    Page<Viaje> buscarActivosPorChoferId(Pageable page, @Param("id")String id);
    
    @Query("SELECT a from Viaje a WHERE a.eliminado IS NULL AND a.chofer.id LIKE :id and a.estadoViaje = 'PLANIFICADO' and a.ubicacionInicial != null and a.ubicacionFinal != null ORDER BY a.modificacion")
    Page<Viaje> buscarProximosPorChoferId(Pageable page, @Param("id")String id);
    
    @Query("SELECT a from Viaje a WHERE a.eliminado IS NULL AND a.chofer.id LIKE :id and a.estadoViaje = 'FINALIZADO' and a.ubicacionInicial != null and a.ubicacionFinal != null ORDER BY a.modificacion")
    Page<Viaje> buscarFinalizadosPorChoferId(Pageable page, @Param("id")String id);
    
    @Query("SELECT a from Viaje a WHERE a.eliminado IS NULL AND a.isCargaNegativa = true AND a.transporte.id NOT LIKE :empresaId ORDER BY a.modificacion")
    Page<Viaje> buscarActivosCargaNegativaPorTransporteIdNotLike(Pageable page, @Param("empresaId")String empresaId);
    
    @Query("SELECT a from Viaje a WHERE a.eliminado IS NULL AND a.isCargaNegativa = true ORDER BY a.modificacion")
    List<Viaje> buscarActivosCargaNegativaList();
    
    @Query("SELECT a from Viaje a WHERE a.eliminado IS NULL AND (a.vehiculo.id LIKE :id)")
    List<Viaje> buscarViajesDeVehiculoList(@Param("id")String id);
    
    @Query("SELECT a from Viaje a WHERE a.eliminado IS NULL AND (a.remolque.id LIKE :id)")
    List<Viaje> buscarViajesDeRemolqueList(@Param("id")String id);
    
    @Query("SELECT a from Viaje a WHERE a.eliminado IS NULL AND a.isCargaNegativa = true AND (a.vehiculo.modelo.nombre LIKE :q OR a.remolque.tipoRemolque.nombre LIKE :q OR a.ubicacionInicial.direccion LIKE :q OR a.ubicacionFinal.direccion LIKE :q)")
    Page<Viaje> busquedaQ(Pageable pageable,@Param("q")String q);
    
    @Query("SELECT a from Viaje a WHERE a.eliminado IS NULL AND a.isCargaNegativa = true AND a.transporte.id LIKE :empresaId AND (a.vehiculo.modelo.nombre LIKE :q OR a.remolque.tipoRemolque.nombre LIKE :q OR a.ubicacionInicial.direccion LIKE :q OR a.ubicacionFinal.direccion LIKE :q)")
    Page<Viaje> busquedaQAndTransporteId(Pageable pageable,@Param("q")String q,@Param("empresaId")String empresaId);
    
    @Query("SELECT a from Viaje a WHERE a.eliminado IS NULL AND a.isCargaNegativa = true AND a.transporte.id NOT LIKE :empresaId AND (a.vehiculo.modelo.nombre LIKE :q OR a.remolque.tipoRemolque.nombre LIKE :q OR a.ubicacionInicial.direccion LIKE :q OR a.ubicacionFinal.direccion LIKE :q)")
    Page<Viaje> busquedaQAndTransporteIdNotLike(Pageable pageable,@Param("q")String q,@Param("empresaId")String empresaId);
    
    @Query("SELECT a from Viaje a WHERE a.eliminado IS NULL AND a.isCargaNegativa = true AND (a.vehiculo.modelo.nombre LIKE :q OR a.remolque.tipoRemolque.nombre LIKE :q OR a.ubicacionInicial.direccion LIKE :q OR a.ubicacionFinal.direccion LIKE :q) AND (a.partidaCargaNegativa >= :first) AND (a.llegadaCargaNegativa <= :second)")
    Page<Viaje> busquedaQAndDate(Pageable pageable, @Param("q")String q, @Param("first") Date first, @Param("second") Date second);
    
    @Query("SELECT a from Viaje a WHERE a.eliminado IS NULL AND a.isCargaNegativa = true AND a.transporte.id LIKE :empresaId AND (a.vehiculo.modelo.nombre LIKE :q OR a.remolque.tipoRemolque.nombre LIKE :q OR a.ubicacionInicial.direccion LIKE :q OR a.ubicacionFinal.direccion LIKE :q) AND (a.partidaCargaNegativa >= :first) AND (a.llegadaCargaNegativa <= :second)")
    Page<Viaje> busquedaQAndDateAndTransporteId(Pageable pageable, @Param("q")String q, @Param("first") Date first, @Param("second") Date second, @Param("empresaId")String empresaId);
    
    @Query("SELECT a from Viaje a WHERE a.eliminado IS NULL AND a.isCargaNegativa = true AND a.transporte.id NOT LIKE :empresaId AND (a.vehiculo.modelo.nombre LIKE :q OR a.remolque.tipoRemolque.nombre LIKE :q OR a.ubicacionInicial.direccion LIKE :q OR a.ubicacionFinal.direccion LIKE :q) AND (a.partidaCargaNegativa >= :first) AND (a.llegadaCargaNegativa <= :second)")
    Page<Viaje> busquedaQAndDateAndTransporteIdNotLike(Pageable pageable, @Param("q")String q, @Param("first") Date first, @Param("second") Date second, @Param("empresaId")String empresaId);
    
    @Query("SELECT a from Viaje a WHERE a.eliminado IS NULL AND a.isCargaNegativa = true AND (a.partidaCargaNegativa >= :first) AND (a.llegadaCargaNegativa <= :second)")
    Page<Viaje> buscarEntreFechasInicioYFinal(Pageable paginable,@Param("first") Date first,@Param("second") Date second);
   
    @Query("SELECT a from Viaje a WHERE a.eliminado IS NULL AND a.isCargaNegativa = true AND a.transporte.id LIKE :empresaId AND (a.partidaCargaNegativa >= :first) AND (a.llegadaCargaNegativa <= :second)")
    Page<Viaje> buscarEntreFechasInicioYFinalAndTransporteId(Pageable paginable, @Param("empresaId")String empresaId ,@Param("first") Date first,@Param("second") Date second);
    
    @Query("SELECT a from Viaje a WHERE a.eliminado IS NULL AND a.isCargaNegativa = true AND a.transporte.id NOT LIKE :empresaId AND (a.partidaCargaNegativa >= :first) AND (a.llegadaCargaNegativa <= :second)")
    Page<Viaje> buscarEntreFechasInicioYFinalAndTransporteIdNotLike(Pageable paginable, @Param("empresaId")String empresaId ,@Param("first") Date first,@Param("second") Date second);
    
    @Query("SELECT a from Viaje a WHERE a.eliminado IS NULL AND a.isCargaNegativa = true AND (a.partidaCargaNegativa >= :first)")
    Page<Viaje> buscarFechaInicioEnAdelante(Pageable paginable,@Param("first") Date first);
    
    @Query("SELECT a from Viaje a WHERE a.eliminado IS NULL AND a.transporte.id LIKE :empresaId AND a.isCargaNegativa = true AND (a.partidaCargaNegativa >= :first)")
    Page<Viaje> buscarFechaInicioEnAdelanteAndTransporteId(Pageable paginable,@Param("first") Date first, @Param("empresaId")String empresaId);
    
    @Query("SELECT a from Viaje a WHERE a.eliminado IS NULL AND a.transporte.id NOT LIKE :empresaId AND a.isCargaNegativa = true AND (a.partidaCargaNegativa >= :first)")
    Page<Viaje> buscarFechaInicioEnAdelanteAndTransporteIdNotLike(Pageable paginable,@Param("first") Date first, @Param("empresaId")String empresaId);
    
    @Query("SELECT a from Viaje a WHERE a.eliminado IS NULL AND a.isCargaNegativa = true AND (a.llegadaCargaNegativa <= :second)")
    Page<Viaje> buscarFechaFinalHaciaAtras(Pageable paginable,@Param("second") Date second);
    
    @Query("SELECT a from Viaje a WHERE a.eliminado IS NULL AND a.isCargaNegativa = true  AND a.transporte.id LIKE :empresaId AND (a.llegadaCargaNegativa <= :second)")
    Page<Viaje> buscarFechaFinalHaciaAtrasAndTransporteId(Pageable paginable,@Param("second") Date second, @Param("empresaId")String empresaId);
    
    @Query("SELECT a from Viaje a WHERE a.eliminado IS NULL AND a.isCargaNegativa = true  AND a.transporte.id NOT LIKE :empresaId AND (a.llegadaCargaNegativa <= :second)")
    Page<Viaje> buscarFechaFinalHaciaAtrasAndTransporteIdNotLike(Pageable paginable,@Param("second") Date second, @Param("empresaId")String empresaId);
    
    @Query("SELECT a from Viaje a WHERE a.eliminado IS NULL AND a.pedido.carga.id = :cargaId")
    Viaje buscarPorCarga(@Param("cargaId") String cargaId);
    
    @Query("SELECT a from Viaje a WHERE a.id = :id")
    Viaje buscarPorId(@Param("id") String id);

}
