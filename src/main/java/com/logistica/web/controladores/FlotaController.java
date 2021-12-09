package com.logistica.web.controladores;

import static com.logistica.web.utiles.Textos.USUARIO_LABEL;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.logistica.web.convertidores.ViajeConverter;
import com.logistica.web.entidades.Chofer;
import com.logistica.web.entidades.Empresa;
import com.logistica.web.entidades.Remolque;
import com.logistica.web.entidades.Usuario;
import com.logistica.web.entidades.Vehiculo;
import com.logistica.web.servicios.ViajeService;

@Controller
@PreAuthorize("hasAnyRole('ROLE_ADMINISTRADOR','ROLE_ADMINISTRADOR_LOCAL','ROLE_ADMINISTRADOR_PAIS')")
@RequestMapping("/flota")
public class FlotaController extends Controlador {

	@Autowired
	private ViajeService viajeService;
	
	@Autowired
	private ViajeConverter viajeConverter;

	@Autowired
	public FlotaController() {
		super("mov-trello-cargas2", "pedido-form");
	}


	@GetMapping("/flota")
	public ModelAndView flota(@RequestParam(value = "q", required = false) String q,
			@RequestParam(value = "t", required = false) String t, Pageable pageable, HttpSession session,
			@RequestParam(required = false) Long id, @RequestParam(required = false) String accion) {

		Usuario usuario = (Usuario) session.getAttribute(USUARIO_LABEL);
		Empresa e = usuario.getEmpresa();

		ModelAndView mav = new ModelAndView("flota-flota");

		List<Chofer> choferesOperativos = null;
		List<Chofer> choferesLicencia = null;
		List<Vehiculo> vehiculos = null;
		List<Remolque> remolques = null;

		mav.addObject("titulo", "Flota");
		mav.addObject("vehiculos", vehiculos);
		mav.addObject("remolques", remolques);
		mav.addObject("choferesOP", choferesOperativos);
		mav.addObject("choferesLI", choferesLicencia);

		return mav;
	}


}