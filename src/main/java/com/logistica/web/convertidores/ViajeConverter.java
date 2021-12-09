package com.logistica.web.convertidores;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.logistica.web.entidades.Checklist;
import com.logistica.web.entidades.Viaje;
import com.logistica.web.enumeraciones.EstadoViaje;
import com.logistica.web.modelos.OSModel;
import com.logistica.web.modelos.ViajeModel;
import com.logistica.web.repositorios.EmpresaRepository;
import com.logistica.web.repositorios.ViajeRepository;

@Component
public class ViajeConverter extends Convertidor<ViajeModel, Viaje> {

	private static final String ERROR = "Error al convertir el modelo viaje a entidad";

	@Autowired
    private ViajeRepository viajeRepository;
	
	@Autowired
	private EmpresaRepository empresaRepository;
    
    public Viaje modeloToEntidad(ViajeModel model) {
        Viaje viaje = new Viaje();

        if (model.getId() != null && !model.getId().isEmpty()) {
            viaje = viajeRepository.getOne(model.getId());
        }

        try {
            BeanUtils.copyProperties(model, viaje);
        } catch (Exception e) {
            log.error(ERROR, e);
        }

        if (viaje.getEstadoViaje() == null) {
            viaje.setEstadoViaje(EstadoViaje.ESPERA_CARGA);
        }

        if (viaje.getPedido() != null) {
            viaje.setUbicacionInicial(viaje.getPedido().getUbicacionDesde());
            viaje.setUbicacionFinal(viaje.getPedido().getUbicacionHasta());
        }
        
        if (model.getPartida() != null) {
        	try {
        		Date partida = new SimpleDateFormat("yyyy-MM-dd hh:mm").parse(model.getPartida().replace("T", " "));
        		viaje.setPartida(partida);
        	}catch (Exception e) {
				System.out.println(e);			}
           
        }

        return viaje;
    }
    
    public Viaje modeloToEntidadDador(ViajeModel model) {
        Viaje viaje = new Viaje();        

        if (model.getId() != null && !model.getId().isEmpty()) {
            viaje = viajeRepository.getOne(model.getId());
        }

        try {
            BeanUtils.copyProperties(model, viaje);
        } catch (Exception e) {
            log.error(ERROR, e);
        }

        if (viaje.getEstadoViaje() == null) {
            viaje.setEstadoViaje(EstadoViaje.ESPERA_CARGA);
        }

        return viaje;
    }

    public ViajeModel entidadToModelo(Viaje viaje) {
        ViajeModel model = new ViajeModel();

        try {
            BeanUtils.copyProperties(viaje, model);
            
            if (viaje.getPedido() != null) {
                model.setIdPedido(viaje.getPedido().getId());
                model.setFechaCarga(viaje.getPedido().getPeriodoDeCarga().getInicio());
                model.setHoraCarga(viaje.getPedido().getPeriodoDeCarga().getHoraInicio());
                model.setFechaDescarga(viaje.getPedido().getPeriodoDeDescarga().getInicio());
                model.setHoraDescarga(viaje.getPedido().getPeriodoDeDescarga().getHoraInicio());
            }
            
            if (viaje.getChecklist() != null) {
    			List<String> idChecklists = new ArrayList<>();
    			for (Checklist c : viaje.getChecklist()) {
    				String idChecklist = c.getId();
    				idChecklists.add(idChecklist);
    			}
    			model.setIdChecklist(idChecklists);
    		}
            if (viaje.getUbicacionInicial() != null) {
                model.setIdUbicacionInicial(viaje.getUbicacionInicial().getId());
            }
            if (viaje.getUbicacionFinal() != null) {
                model.setIdUbicacionFinal(viaje.getUbicacionFinal().getId());
            }
            if(viaje.getPresupuesto() == null) {
            	model.setPresupuesto(0.0);
            }
            if(viaje.getPartida() != null) {
            	final SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
            	model.setPartida(sdf.format(viaje.getPartida()).replace(" ","T"));
            }
            
        } catch (Exception e) {
            log.error("Error al convertir la entidad en el modelo de viaje", e);
        }

        return model;
    }

    public OSModel entidadToOSModelo(Viaje viaje) {
        OSModel model = new OSModel();

        try {
            model.setId(viaje.getId());
            model.setEstado(viaje.getEstadoViaje().getTexto());
            
            if (viaje.getPedido() != null) {
                
                model.setFechaInicioEstimada(viaje.getPedido().getPeriodoDeCarga().getInicio());
                model.setHoraInicioEstimada(viaje.getPedido().getPeriodoDeCarga().getHoraInicio());
                if(viaje.getPedido().getCarga().getCliente() != null) {
                	model.setCliente(viaje.getPedido().getCarga().getCliente().getNombre());
                }else {
                	model.setCliente("Sin informar");
                }
                model.setIdPedido(viaje.getPedido().getId().toString());
                if(!viaje.getPedido().getNroInterno().isEmpty()) {
                	model.setNroInterno(viaje.getPedido().getNroInterno());
                }
            }
            if (viaje.getUbicacionInicial() != null) {
                model.setDestino(viaje.getUbicacionInicial().getDireccion());
            }
            
        } catch (Exception e) {
            log.error("Error al convertir la entidad en el modelo de viaje", e);
        }

        return model;
    }

    
    public List<ViajeModel> entidadesToModelos(List<Viaje> viajes) {
        List<ViajeModel> models = new ArrayList<>();

        for (Viaje v :
                viajes) {
            models.add(entidadToModelo(v));
        }

        return models;
    }
    
    public List<OSModel> entidadesToOSModelos(List<Viaje> viajes) {
        List<OSModel> models = new ArrayList<>();

        for (Viaje v :
                viajes) {
            models.add(entidadToOSModelo(v));
        }

        return models;
    }

}
