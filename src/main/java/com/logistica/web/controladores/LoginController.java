package com.logistica.web.controladores;

import static com.logistica.web.utiles.Textos.ERROR;
import static com.logistica.web.utiles.Textos.LOGOUT_LABEL;
import static com.logistica.web.utiles.Textos.USUARIO_LABEL;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.logistica.web.entidades.Usuario;
import com.logistica.web.modelos.UsuarioModel;
import com.logistica.web.servicios.UsuarioService;

@Controller
public class LoginController {

	@Autowired
	@Qualifier("usuarioService")
	private UsuarioService usuarioService;

	private final Log log = LogFactory.getLog(LoginController.class);
	private static final String RECUPERAR = "recuperar-clave";

	@GetMapping("/index")
	public String index(Model model) {
		return "index";
	}

	@GetMapping("/login")
	public String login(Model model, @RequestParam(required = false) String error, @RequestParam(required = false) String logout, @RequestParam(value = "r", required = false) boolean r, @RequestParam(value = "ce", required = false) boolean ce) {
		if (error != null && error.equals("")) {
			error = "Nombre de usuario o contraseña incorrecta.";
		}
		if (r) {
			model.addAttribute("success", "Si hay un usuario registrado con ese correo, le llegará el correo" + " con instrucciones para la recuperación de la clave.");
		}
		if (ce) {
			model.addAttribute("success", "Clave cambiada correctamente, ya puedes iniciar sesión.");
		}
		model.addAttribute(ERROR, error);
		model.addAttribute(LOGOUT_LABEL, logout);

		return "login";
	}

	@GetMapping({ "/loginsuccess", "/" })
	public String logincheck(HttpSession session) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth == null) {
			return "redirect:/login";
		} else {
			Usuario usuario = (Usuario) session.getAttribute(USUARIO_LABEL);

			if (usuario == null) {
				return "redirect:/login";
			} else {
				return "redirect:/dashboard/flota";
			}
		}
	}

	@GetMapping(value = "/logout")
	public String logoutPage(HttpServletRequest request, HttpServletResponse response) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth != null) {
			new SecurityContextLogoutHandler().logout(request, response, auth);
		}
		return "redirect:/login?logout";
	}

	@GetMapping("/recuperar")
	public ModelAndView recuperarClave(ModelAndView mav) {
		mav.setViewName(RECUPERAR);
		return mav;
	}

	@GetMapping("/r/recuperar")
	public ModelAndView cambiarClave(@RequestParam("t") String token) {
		ModelAndView mav = new ModelAndView(RECUPERAR);
		UsuarioModel model = usuarioService.getFromPassRecoveryToken(token);
		mav.addObject(USUARIO_LABEL, model);
		return mav;
	}

}