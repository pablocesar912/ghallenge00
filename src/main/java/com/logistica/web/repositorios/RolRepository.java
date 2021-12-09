package com.logistica.web.repositorios;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.logistica.web.entidades.Rol;
import com.logistica.web.entidades.Usuario;

@Repository("rolRepository")
public interface RolRepository extends JpaRepository<Rol, String> {

    @Query("SELECT r FROM Rol r WHERE r.baja is null")
    public List<Rol> buscarTodos();
    
    @Query("SELECT r FROM Rol r WHERE r.baja is null and (r.nombre = 'Administrador' or r.nombre = 'Administrador Local')")
    public List<Rol> buscarAdmin();
    
    @Query("SELECT r FROM Rol r WHERE r.baja is null and (r.nombre = 'Administrador Local' or r.nombre = 'Chofer' or r.nombre = 'Invitado')")
    public List<Rol> buscarRolesPlataforma();
    
    @Query("SELECT r FROM Rol r WHERE r.creador = :creador AND r.baja is null")
    public List<Rol> buscarTodosPorIdCreador(@Param("creador") Usuario creador);
    
    @Query("SELECT r FROM Rol r WHERE r.empresa.id = :idEmpresa AND r.baja is null")
    public List<Rol> buscarTodosPorEmpresa(@Param("idEmpresa") String idEmpresa);
    
    @Query("SELECT r FROM Rol r WHERE r.id = :id AND r.baja is null")
    public Rol buscarPorId(@Param("id") String id);
    
    @Query("SELECT r FROM Rol r WHERE r.nombre = :nombre AND r.baja is null")
    public Rol buscarPorNombre(@Param("nombre") String nombre);
    
    @Query("SELECT r FROM Rol r WHERE r.baja is null")
    public Page<Rol> buscarTodos(Pageable pageable);
    
    @Query("SELECT r FROM Rol r WHERE r.baja is null AND r.nombre like :q")
    public Page<Rol> buscarTodos(Pageable pageable, @Param("q") String q);
    
    
}