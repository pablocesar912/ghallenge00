package com.logistica.web.servicios;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Logger;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.logistica.web.convertidores.ViajeConverter;
import com.logistica.web.entidades.Empresa;
import com.logistica.web.entidades.Viaje;
import com.logistica.web.modelos.ViajeModel;
import com.logistica.web.modelos.busqueda.BusquedaViajeModel;
import com.logistica.web.repositorios.ViajeRepository;
import com.logistica.web.utiles.Fecha;

@Service
public class ViajeService {

	@Autowired
	private ViajeRepository viajeRepository;
	@Autowired
	private ViajeConverter viajeConverter;

	private Logger log = Logger.getLogger(getClass().getSimpleName());

	public List<ViajeModel> listarActivos() {
		return viajeConverter.entidadesToModelos(viajeRepository.findByEliminadoNull());
	}

	public Page<Viaje> listarActivosCargaNegativa(Pageable page, String q, String fechaUno, String fechaDos) {
		Date uno = null;
		Date dos = null;
		if (fechaUno != null && !fechaUno.equals("")) {
			uno = Fecha.parseFecha(fechaUno);
		}
		if (fechaDos != null && !fechaDos.equals("")) {
			dos = Fecha.parseFecha(fechaDos);
		}
		if (q != null && !q.isEmpty()) {
			q = "%" + q + "%";
		}
		if ((q == null || q.isEmpty()) && uno == null && dos == null) {
			return viajeRepository.buscarActivosCargaNegativa(page);
		} else if ((q != null && !q.isEmpty()) && uno == null && dos == null) {
			return viajeRepository.busquedaQ(page, q);
		} else if ((q == null || q.isEmpty()) && uno != null && dos == null) {
			return viajeRepository.buscarFechaInicioEnAdelante(page, uno);
		} else if ((q == null || q.isEmpty()) && uno == null && dos != null) {
			return viajeRepository.buscarFechaFinalHaciaAtras(page, dos);
		} else if ((q == null || q.isEmpty()) && uno != null && dos != null) {
			return viajeRepository.buscarEntreFechasInicioYFinal(page, uno, dos);
		} else if ((q != null && !q.isEmpty()) && uno != null && dos != null) {
			return viajeRepository.busquedaQAndDate(page, q, uno, dos);
		}
		return null;
	}

	public Page<Viaje> listarActivosCargaNegativaYTransporteId(Pageable page, String q, String fechaUno, String fechaDos, String transportadorId) {
		Date uno = null;
		Date dos = null;
		if (fechaUno != null && !fechaUno.equals("")) {
			uno = Fecha.parseFecha(fechaUno);
		}
		if (fechaDos != null && !fechaDos.equals("")) {
			dos = Fecha.parseFecha(fechaDos);
		}
		if (q != null && !q.isEmpty()) {
			q = "%" + q + "%";
		}
		if ((q == null || q.isEmpty()) && uno == null && dos == null) {
			return viajeRepository.buscarActivosCargaNegativaPorTransporteId(page, transportadorId);
		} else if ((q != null && !q.isEmpty()) && uno == null && dos == null) {
			return viajeRepository.busquedaQAndTransporteId(page, q, transportadorId);
		} else if ((q == null || q.isEmpty()) && uno != null && dos == null) {
			return viajeRepository.buscarFechaInicioEnAdelanteAndTransporteId(page, uno, transportadorId);
		} else if ((q == null || q.isEmpty()) && uno == null && dos != null) {
			return viajeRepository.buscarFechaFinalHaciaAtrasAndTransporteId(page, dos, transportadorId);
		} else if ((q == null || q.isEmpty()) && uno != null && dos != null) {
			return viajeRepository.buscarEntreFechasInicioYFinalAndTransporteId(page, transportadorId, uno, dos);
		} else if ((q != null && !q.isEmpty()) && uno != null && dos != null) {
			return viajeRepository.busquedaQAndDateAndTransporteId(page, q, uno, dos, transportadorId);
		}
		return null;
	}

	public Page<Viaje> listarActivosCargaNegativaYNotLikeTransporteId(Pageable page, String q, String fechaUno, String fechaDos, String transportadorId) {
		Date uno = null;
		Date dos = null;
		if (fechaUno != null && !fechaUno.equals("")) {
			uno = Fecha.parseFecha(fechaUno);
		}
		if (fechaDos != null && !fechaDos.equals("")) {
			dos = Fecha.parseFecha(fechaDos);
		}
		if (q != null && !q.isEmpty()) {
			q = "%" + q + "%";
		}
		if ((q == null || q.isEmpty()) && uno == null && dos == null) {
			return viajeRepository.buscarActivosCargaNegativaPorTransporteIdNotLike(page, transportadorId);
		} else if ((q != null && !q.isEmpty()) && uno == null && dos == null) {
			return viajeRepository.busquedaQAndTransporteIdNotLike(page, q, transportadorId);
		} else if ((q == null || q.isEmpty()) && uno != null && dos == null) {
			return viajeRepository.buscarFechaInicioEnAdelanteAndTransporteIdNotLike(page, uno, transportadorId);
		} else if ((q == null || q.isEmpty()) && uno == null && dos != null) {
			return viajeRepository.buscarFechaFinalHaciaAtrasAndTransporteIdNotLike(page, dos, transportadorId);
		} else if ((q == null || q.isEmpty()) && uno != null && dos != null) {
			return viajeRepository.buscarEntreFechasInicioYFinalAndTransporteIdNotLike(page, transportadorId, uno, dos);
		} else if ((q != null && !q.isEmpty()) && uno != null && dos != null) {
			return viajeRepository.busquedaQAndDateAndTransporteIdNotLike(page, q, uno, dos, transportadorId);
		}
		return null;
	}

	public Viaje porIdEntidad(String id) {
		return viajeRepository.findById(id).orElse(null);
	}

	public Viaje buscarPorPedido(Long id) {
		return viajeRepository.buscarPorPedido(id);
	}

	public ViajeModel porIdModel(String id) {
		return viajeConverter.entidadToModelo(viajeRepository.findById(id).orElse(null));
	}

	public Page<Viaje> listarActivos(Pageable pageable) {
		return viajeRepository.buscarActivos(pageable);
	}

	public List<Viaje> buscarPorTransporte(Empresa transportador) {
		return new ArrayList<>();
	}

	public Page<Viaje> buscarPorCriterios(Pageable page, BusquedaViajeModel viaje, Empresa t) {
		List<Viaje> viajes = viajeRepository.buscarPorCriterios(viaje, t);
		return new PageImpl<>(viajes, page, viajes.size());
	}

	public Page<Viaje> buscarPorCriteriosPropios(Pageable page, BusquedaViajeModel viaje, Empresa t) {
		List<Viaje> viajes = viajeRepository.buscarPorCriteriosPropios(viaje, t);
		return new PageImpl<>(viajes, page, viajes.size());
	}

	public Page<Viaje> buscarPorTrasnporteId(Pageable page, String t) {
		return viajeRepository.buscarActivosPorTransporteId(page, t);
	}
	
	public Page<Viaje> buscarOSPorTrasnporteId(Pageable page, String t) {
		return viajeRepository.buscarOSPorTransporteId(page, t);
	}
	
	public List<Viaje> buscarOSPorTrasnporteId(String t) {
		return viajeRepository.buscarOSPorTransporteId(t);
	}
	
	public Page<Viaje> buscarOTPorTrasnporteId(Pageable page, String t) {
		return viajeRepository.buscarOTPorTransporteId(page, t);
	}
	
	public List<Viaje> buscarOTPorTransporteId(String t) {
		return viajeRepository.buscarOTPorTransporteId(t);
	}
	
	public List<Viaje> buscarOTPorTransporteIdActivos(String t) {
		return viajeRepository.buscarOTPorTransporteIdActivos(t);
	}

	public Page<Viaje> buscarPorChoferId(Pageable page, String t) {
		return viajeRepository.buscarActivosPorChoferId(page, t);
	}

	public Page<Viaje> buscarProximosPorChoferId(Pageable page, String t) {
		return viajeRepository.buscarProximosPorChoferId(page, t);
	}

	public Page<Viaje> buscarFinalizadosPorChoferId(Pageable page, String t) {
		return viajeRepository.buscarFinalizadosPorChoferId(page, t);
	}

}
