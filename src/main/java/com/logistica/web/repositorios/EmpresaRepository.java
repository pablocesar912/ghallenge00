package com.logistica.web.repositorios;


import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.logistica.web.entidades.Configuracion;
import com.logistica.web.entidades.Empresa;


@Repository
public interface EmpresaRepository extends JpaRepository<Empresa, String>,EmpresaRepositoryCustom {

    @Query("SELECT a from Empresa a WHERE a.eliminado IS NULL")
    public Page<Empresa> buscarActivos(Pageable pageable);
    
    @Query("SELECT a from Empresa a WHERE a.id = :id")
    public Empresa buscarPorId(@Param("id") String id);

    @Query("SELECT a from Empresa a WHERE a.eliminado IS NULL ORDER BY a.nombre")
    public List<Empresa> buscarActivos();
    
    public List<Empresa> findByRazonSocial(String razonSocial);

    @Query("SELECT a from Empresa a WHERE a.eliminado IS NOT NULL")
    public Page<Empresa> buscarEliminados(Pageable pageable);

    @Query("SELECT a from Empresa a")
    public Page<Empresa> buscarTodos(Pageable pageable);

    @Query("SELECT a from Empresa a WHERE a.eliminado IS NULL AND (a.nombre LIKE :nombre)")
    public Page<Empresa> buscarActivos(Pageable pageable, @Param("nombre") String nombre);

    @Query("SELECT a from Empresa a WHERE a.eliminado IS NULL AND a.nombre = :nombre")
    public List<Empresa> buscarEmpresaPorNombre(@Param("nombre") String nombre);
    
    @Query("SELECT c from Configuracion c WHERE c.empresa.id = :id")
    public List<Configuracion> buscarConfiguracionEmpresa(@Param("id") String id);

}

