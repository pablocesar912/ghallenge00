package com.logistica.web.convertidores;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

import com.logistica.web.entidades.Usuario;
import com.logistica.web.modelos.UsuarioModel;
import com.logistica.web.repositorios.EmpresaRepository;
import com.logistica.web.repositorios.UsuarioRepository;

@Component("usuarioConverter")
public class UsuarioConverter extends Convertidor<UsuarioModel, Usuario> {

    @Autowired
    @Qualifier("usuarioRepository")
    private UsuarioRepository usuarioRepository;
    
    @Autowired
    private EmpresaRepository empresaRepository;
    
    public UsuarioModel entidadToModelo(Usuario usuario) {
        UsuarioModel model = new UsuarioModel();
        try {
            BeanUtils.copyProperties(usuario, model);
            if (usuario.getUbicacion() != null) {
                model.setIdUbicacion(usuario.getUbicacion().getId());
            }
            if (usuario.getPais() != null) {
                model.setIdPais(usuario.getPais().getId());
            }
            if (usuario.getEmpresa() != null) {
                model.setIdEmpresa(usuario.getEmpresa().getId());
            }

        } catch (Exception e) {
            log.error("Error al convertir la entidad en el modelo del usuario", e);
        }
        return model;
    }
    
    public Usuario modeloToEntidad(UsuarioModel model) {
        Usuario usuario = new Usuario();
        boolean x = false;
        String pass = "";
        if (model.getId() != null && !model.getId().isEmpty()) {
            usuario = usuarioRepository.getOne(model.getId());
            if (usuario.getClave() != null) {
                pass = usuario.getClave();
                x = true;
            }
        }
//		String clave = usuario.getClave();

        try {
            BeanUtils.copyProperties(model, usuario);
        } catch (Exception e) {
            log.error("Error al convertir el modelo del usuario en entidad", e);
        }

        if (x) {
            model.setClave(pass);
        }

        if (model.getIdEmpresa() != null) {
            usuario.setEmpresa(empresaRepository.getOne(model.getIdEmpresa()));
        }

//		usuario.setClave(clave);
        return usuario;
    }
    

    public List<UsuarioModel> entidadesToModelos(List<Usuario> usuarios) {
        List<UsuarioModel> model = new ArrayList<>();
        for (Usuario usuario : usuarios) {
            model.add(entidadToModelo(usuario));
        }
        return model;
    }
    
}
