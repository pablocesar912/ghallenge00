package com.logistica.web.convertidores;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.logistica.web.entidades.Empresa;
import com.logistica.web.modelos.EmpresaModel;
import com.logistica.web.repositorios.EmpresaRepository;

@Component
public class EmpresaConverter extends Convertidor<EmpresaModel, Empresa> {

    private final EmpresaRepository empresaRepository;

    @Autowired
    public EmpresaConverter(EmpresaRepository empresaRepository) {
        this.empresaRepository = empresaRepository;
    }

    public EmpresaModel entidadToModelo(Empresa empresa) {
        EmpresaModel model = new EmpresaModel();

        try {
            BeanUtils.copyProperties(empresa, model);
            if (empresa.getPais() != null) {
                model.setIdPais(empresa.getPais().getId());
            }
        } catch (Exception e) {
            log.error("Error al convertir la entidad en el modelo de empresa", e);
        }

        return model;
    }

    public Empresa modeloToEntidad(EmpresaModel model) {
        Empresa empresa = new Empresa();

        if (model.getId() != null && !model.getId().isEmpty()) {
            empresa = empresaRepository.getOne(model.getId());
        }

        try {
            BeanUtils.copyProperties(model, empresa);

        } catch (Exception e) {
            log.error("Error al convertir el modelo de empresa en entidad", e);
        }

        return empresa;
    }
    
    public Empresa modeloToEntidadSinUbicacion(EmpresaModel model) {
        Empresa empresa = new Empresa();

        if (model.getId() != null && !model.getId().isEmpty()) {
            empresa = empresaRepository.getOne(model.getId());
        }

        try {
            BeanUtils.copyProperties(model, empresa);

        } catch (Exception e) {
            log.error("Error al convertir el modelo de empresa en entidad", e);
        }

        return empresa;
    }

    public List<EmpresaModel> entidadesToModelos(List<Empresa> empresas) {
        List<EmpresaModel> model = new ArrayList<>();

        for (Empresa empresa : empresas) {
            model.add(entidadToModelo(empresa));
        }

        return model;
    }


} 