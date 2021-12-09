package com.logistica.web.repositorios;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.logistica.web.entidades.Usuario;

@Repository
public interface UsuarioRepository extends JpaRepository<Usuario, String>, UsuarioRepositoryCustom {

    @Query("select a from Usuario a WHERE a.eliminado IS NULL")
    Page<Usuario> listarActivos(Pageable pageable);

    @Query("select a from Usuario a WHERE a.eliminado IS NULL")
    List<Usuario> listarActivosList();
    
    @Query("select a from Usuario a WHERE a.eliminado IS NULL and a.empresa.id = :id")
    List<Usuario> listarActivosPorEmpresaList(@Param("id") String id);

    @Query("select a from Usuario a WHERE a.eliminado IS NULL AND (a.mail LIKE :q OR a.telefono LIKE :q OR a.telefono LIKE :q OR a.identificador LIKE :q)")
    Page<Usuario> listarActivos(Pageable pageable, @Param("q") String q);

    @Query("select a from Usuario a WHERE a.eliminado IS NULL AND (a.empresa.razonSocial like :q OR a.empresa.nombre LIKE :q or a.mail LIKE :q OR a.telefono LIKE :q OR a.identificador LIKE :q)")
    List<Usuario> listarActivosList(Pageable pageable, @Param("q") String q);

    @Query("select a from Usuario a WHERE a.eliminado IS NULL AND (a.pais.id LIKE :idPais)")
    Page<Usuario> listarActivosPorPais(Pageable pageable, @Param("idPais") String idPais);

    @Query("select a from Usuario a WHERE a.eliminado IS NULL AND (a.pais.id LIKE :idPais)")
    List<Usuario> listarActivosPorPaisList(@Param("idPais") String idPais);

    @Query("select a from Usuario a WHERE a.eliminado IS NULL AND (a.mail LIKE :q) AND (a.pais.id LIKE :idPais)")
    Page<Usuario> listarActivosPorPais(Pageable pageable, @Param("q") String q, @Param("idPais") String idPais);

    @Query("select a from Usuario a WHERE a.eliminado IS NULL AND (a.empresa.nombre like :q OR a.empresa.razonSocial LIKE :q OR a.mail LIKE :q OR a.identificador LIKE :q) AND (a.pais.id LIKE :idPais)")
    List<Usuario> listarActivosPorPaisList(Pageable pageable, @Param("q") String q, @Param("idPais") String idPais);

    @Query("select a from Usuario a WHERE a.eliminado IS NULL AND a.id = :id")
    Usuario buscarPorId(@Param("id") String id);

    @Query("select a from Usuario a WHERE a.eliminado IS NULL AND a.user = :usuario OR a.mail = :usuario")
    Usuario buscarPorUsuario(@Param("usuario") String usuario);
    
    @Query("select a from Usuario a WHERE a.eliminado IS NULL AND a.rol.nombre = :rol")
    List<Usuario> buscarPorRol(@Param("rol") String rol);
    
    @Query("select a from Usuario a WHERE a.eliminado IS NULL AND a.rol.nombre = :rol and a.empresa.id = :idEmpresa")
    List<Usuario> buscarPorRolYEmpresa(@Param("rol") String rol,@Param("idEmpresa") String idEmpresa);
    
    @Query("select a from Usuario a WHERE a.eliminado IS NULL AND a.rol.id = :rol")
    List<Usuario> buscarPorRolId(@Param("rol") String rol);
    
    Usuario findByMailIgnoreCase(String mail);
    Usuario findByTelefono(String telefono);

}
