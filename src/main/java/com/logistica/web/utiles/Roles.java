package com.logistica.web.utiles;

import static com.logistica.web.utiles.Textos.ADMINISTRADORLOCAL_LABEL;
import static com.logistica.web.utiles.Textos.ADMINISTRADORPAIS_LABEL;
import static com.logistica.web.utiles.Textos.ADMINISTRADOR_LABEL;
import static com.logistica.web.utiles.Textos.CHOFER_LABEL;
import static com.logistica.web.utiles.Textos.ROL_ACTUAL_LABEL;
import static com.logistica.web.utiles.Textos.USUARIO_LABEL;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import com.logistica.web.entidades.Rol;
import com.logistica.web.entidades.Usuario;
import com.logistica.web.errores.WebException;

public final class Roles {
	
	private Roles() {}

	public static String getRolActual(HttpSession session) throws WebException {
		Usuario user = (Usuario) session.getAttribute(USUARIO_LABEL);
		List<String> roles = getRoles(user);
		String rol = (String) session.getAttribute(ROL_ACTUAL_LABEL);

		if (rol == null) {
			session.setAttribute(ROL_ACTUAL_LABEL, defaultRol(user.getRol()));
			rol = defaultRol(user.getRol());
		}

		if (roles.contains(rol)) {
			return rol;
		} else {
			throw new WebException("Error: el rol actual de la sesión no está en la lista de roles.");
		}
	}
	
	private static List<String> getRoles(Usuario user) {
        List<String> roles = new ArrayList<>();
        
        switch (user.getRol().getNombre()) {
        	case "chofer":
        		roles.add(CHOFER_LABEL);
        		break;
        	case "Sin rol":
        		roles.add("invitado");
        		break;
            case "Administrador Local":
                roles.add(ADMINISTRADORLOCAL_LABEL);
                break;
            case "Administrador Pais":
                roles.add(ADMINISTRADORPAIS_LABEL);
                break;
            case "Administrador":
                roles.add(ADMINISTRADOR_LABEL);
                break;
            default:
                break;
        }

        return roles;
    }

	/**
	 * Da un valor por defecto al atributo "rolActual" de la sesión dependiendo de
	 * los roles que tenga el usuario logueado.
	 *
	 * @param rol Rol del usuario logueado
	 * @return un String con el valor del rol por defecto.
	 */
	public static String defaultRol(Rol rol) {
		String defaultRol;

		switch (rol.getNombre()) {
		case "Administrador":
			defaultRol = "admin";
			break;
		case "Sin rol":
			defaultRol = "invitado";
			break;
		case "Administrador Local":
			defaultRol = ADMINISTRADORLOCAL_LABEL;
			break;
		case "Administrador Pais":
			defaultRol = ADMINISTRADORPAIS_LABEL;
			break;
		case "Chofer":
			defaultRol= CHOFER_LABEL;
			break;
		default:
			defaultRol = "admin";
			break;
		}

		return defaultRol;
	}

}
