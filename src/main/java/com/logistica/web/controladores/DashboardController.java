package com.logistica.web.controladores;

import static com.logistica.web.utiles.Textos.USUARIO_LABEL;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.logistica.web.convertidores.ViajeConverter;
import com.logistica.web.entidades.Chofer;
import com.logistica.web.entidades.Empresa;
import com.logistica.web.entidades.Notificacion;
import com.logistica.web.entidades.Remolque;
import com.logistica.web.entidades.Usuario;
import com.logistica.web.entidades.Vehiculo;
import com.logistica.web.entidades.Viaje;
import com.logistica.web.modelos.OSModel;
import com.logistica.web.repositorios.NotificacionRepository;
import com.logistica.web.servicios.EmpresaService;
import com.logistica.web.servicios.NotificacionService;
import com.logistica.web.servicios.UsuarioService;
import com.logistica.web.servicios.ViajeService;
import java.util.Map;
import java.util.stream.Collectors;
import java.util.stream.IntStream;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.ui.Model;

@Controller
@RequestMapping("/dashboard")
public class DashboardController {

    private final UsuarioService usuarioService;
    private final ViajeService viajeService;
    private final NotificacionService notificacionService;

    @Autowired
    private NotificacionRepository notificacionRepository;

    @Autowired
    private ViajeConverter viajeConverter;

    private final Log log = LogFactory.getLog(DashboardController.class);
    private static final String DASHBOARD = "/dashboard";
    private static final String ALERTAS = "alertas";
    private static final String NOTIFICACIONES = "notificaciones";
    private static final String NUEVAS = "nuevas";

    @Autowired
    public DashboardController(EmpresaService empresaService, NotificacionService notificacionService, UsuarioService usuarioService, ViajeService viajeService) {
        this.viajeService = viajeService;
        this.usuarioService = usuarioService;
        this.notificacionService = notificacionService;

    }

    @GetMapping("/os")  //órdenes de servicio
    @ResponseBody
    public ResponseEntity<List<OSModel>> listarOrdenesDeServicio(HttpSession session) {

        Usuario usuario = (Usuario) session.getAttribute(USUARIO_LABEL);
        usuario = usuarioService.buscar(usuario.getId());
        Empresa e = usuario.getEmpresa();

        List<OSModel> viajes = viajeConverter.entidadesToOSModelos(viajeService.buscarOSPorTrasnporteId(e.getId()));

        return new ResponseEntity<>(viajes, HttpStatus.OK);
    }

    @GetMapping("/ot")  //órdenes de trabajo
    @ResponseBody
    public ResponseEntity<List<OSModel>> listarOrdenesDeTrabajo(HttpSession session) {

        Usuario usuario = (Usuario) session.getAttribute(USUARIO_LABEL);
        usuario = usuarioService.buscar(usuario.getId());
        Empresa e = usuario.getEmpresa();
        List<OSModel> viajes = viajeConverter.entidadesToOSModelos(viajeService.buscarOTPorTransporteIdActivos(e.getId()));

        return new ResponseEntity<>(viajes, HttpStatus.OK);
    }


    // paginador opción 1;
    @GetMapping("/flota")
    public ModelAndView dadorFlota(HttpSession session, Pageable pageable,
            @RequestParam(value = "change", required = false) boolean change,
            @RequestParam Map<String, Object> param) {

        ModelAndView modelo = new ModelAndView("flota-dashboard");

        Usuario usuario = (Usuario) session.getAttribute(USUARIO_LABEL);
        Empresa e = usuario.getEmpresa();

        List<Chofer> choferes = null;
        List<Vehiculo> vehiculos = null;
        List<Remolque> remolques = null;
        modelo.addObject(NOTIFICACIONES, notificacionService.buscarNotificacionesPorUsuario(usuario.getId()));
        modelo.addObject(ALERTAS, notificacionService.buscarAlertasPorUsuario(usuario.getId()));
        modelo.addObject(NUEVAS, notificacionService.countByNotificacionesNoLeidas(usuario.getId()) + notificacionService.countByAlertasNoLeidas(usuario.getId()));

        Integer page = Integer.valueOf(param.get("page").toString());
        if (page != null) {
            page = (Integer.valueOf(param.get("page").toString())-1);
        } else {
            page = 0;
        }
        
        PageRequest reqPage = PageRequest.of(page, 10);
        Page<Viaje> viajeOS = viajeService.buscarOSPorTrasnporteId(reqPage, e.getId());
        
        Integer totalPages = viajeOS.getTotalPages();
        if (totalPages > 0) {
            List<Integer> allPages = IntStream.rangeClosed(1, totalPages).boxed().collect(Collectors.toList());
            modelo.addObject("allPages", allPages);
        }
        
        modelo.addObject("page", viajeOS.getContent());
        modelo.addObject("next", (page+2));
        modelo.addObject("current", (page+1));
        modelo.addObject("previous", page);
  
        modelo.addObject("ot", viajeService.buscarOTPorTrasnporteId(pageable, e.getId()));
        modelo.addObject("titulo", "Módulo de Flota");
        modelo.addObject("vehiculos", vehiculos);
        modelo.addObject("remolques", remolques);
        modelo.addObject("choferes", choferes);

        return modelo;
    }

    @GetMapping("/notificaciones")
    public String notificaciones(HttpSession session, @RequestParam(value = "id", required = false) String id, RedirectAttributes flash) {
        Notificacion n = notificacionService.buscarNotificacionPorId(id);
        n.setVista(true);
        notificacionRepository.save(n);
        return "redirect:/" + n.getUrl();

    }

    // paginador opción 1;
    @GetMapping("/flota")
    public String paginador(@RequestParam Map<String, Object> param, Model modelo) {
        Integer page = Integer.valueOf(param.get("page").toString());
        if (page != null) {
            page = (Integer.valueOf(param.get("page").toString())-1);
        } else {
            page = 0;
        }
        
        PageRequest reqPage = PageRequest.of(page, 10);
        Page<Viaje> viajeOS = viajeService.listarActivos(reqPage);
        
        Integer totalPages = viajeOS.getTotalPages();
        if (totalPages > 0) {
            List<Integer> allPages = IntStream.rangeClosed(1, totalPages).boxed().collect(Collectors.toList());
            modelo.addAttribute("allPages", allPages);
        }
        
        modelo.addAttribute("list", viajeOS.getContent());
        modelo.addAttribute("prev", page);
        modelo.addAttribute("current", page+1);
        modelo.addAttribute("next", page+2);
        modelo.addAttribute("last", totalPages);
        
        return "flota-dashboard";
    }
}