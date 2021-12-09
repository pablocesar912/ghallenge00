package com.logistica.web.servicios;

import static com.logistica.web.utiles.Roles.defaultRol;
import static com.logistica.web.utiles.Textos.EMPRESA_LABEL;
import static com.logistica.web.utiles.Textos.ID_EMPRESA_LABEL;
import static com.logistica.web.utiles.Textos.ID_PAIS_LABEL;
import static com.logistica.web.utiles.Textos.PERMISOS_LABEL;
import static com.logistica.web.utiles.Textos.ROL_ACTUAL_LABEL;
import static com.logistica.web.utiles.Textos.USUARIO_LABEL;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.logistica.web.convertidores.UsuarioConverter;
import com.logistica.web.entidades.Empresa;
import com.logistica.web.entidades.Permiso;
import com.logistica.web.entidades.Rol;
import com.logistica.web.entidades.Usuario;
import com.logistica.web.modelos.UsuarioModel;
import com.logistica.web.repositorios.EmpresaRepository;
import com.logistica.web.repositorios.UsuarioRepository;
import com.logistica.web.servicios.jwt.JWTService;

@Service("usuarioService")
public class UsuarioService implements UserDetailsService {

	private static final String EMPRESA_NAME = "empresaName";

	private static final String USER_NAME = "UserName";

	@Autowired
	@Qualifier("usuarioRepository")
	private UsuarioRepository usuarioRepository;

	@Autowired
	@Qualifier("usuarioConverter")
	private UsuarioConverter usuarioConverter;

	@Autowired
	private EmpresaRepository empresaRepository;

	@Autowired
	private RolService rolService;

	@Autowired
	private JWTService jwtService;

	private final Log log = LogFactory.getLog(UsuarioService.class);

	public List<Usuario> buscarPorRol(String rol) {
		return usuarioRepository.buscarPorRol(rol);
	}
	
	public List<Usuario> buscarPorRolYEmpresa(String rol,String idEmpresa) {
		return usuarioRepository.buscarPorRolYEmpresa(rol,idEmpresa);
	}
	

	public List<Usuario> buscarPorRoles(List<Rol> roles) {
		List<Usuario> usuarios = new ArrayList<>();

                roles.forEach((r) -> {
                    usuarios.addAll(usuarioRepository.buscarPorRolId(r.getId()));
            });

		return usuarios;
	}

	public Usuario buscar(String id) {
		return usuarioRepository.getOne(id);
	}

	public UsuarioModel buscarModel(String id) {
		return usuarioConverter.entidadToModelo(usuarioRepository.getOne(id));
	}

	public Page<Usuario> buscarTodos() {
		return usuarioRepository.listarActivos(null);
	}

	private String generarPassword(String userName) {
		Calendar calendar = Calendar.getInstance();
		Integer year = calendar.get(Calendar.YEAR);
		return new BCryptPasswordEncoder().encode(userName + year.toString());
	}

        @Override
	public UserDetails loadUserByUsername(String username) {

		Usuario usuario = buscarPorNombreUsuario(username);

		if (usuario != null) {
			ServletRequestAttributes attr = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
			HttpSession session = attr.getRequest().getSession(true); // true == allow create
			
			Empresa empresa = usuario.getEmpresa();

			session.setAttribute(USER_NAME, username);
			session.setAttribute(USUARIO_LABEL, usuario);
			session.setAttribute(ROL_ACTUAL_LABEL, defaultRol(usuario.getRol()));
			session.setAttribute(EMPRESA_NAME, null);
			
			if(!usuario.getRol().getPermisos().isEmpty()) {
				session.setAttribute(PERMISOS_LABEL, empresa);
			}

			if (usuario.getPais() != null) {
				session.setAttribute(ID_PAIS_LABEL, usuario.getPais().getId());
			}

			if (empresa != null) {
				session.setAttribute(EMPRESA_LABEL, empresa.getNombre());
				session.setAttribute(ID_EMPRESA_LABEL, empresa.getId());
				//session.setAttribute("configuracion", empresaRepository.buscarConfiguracionEmpresa(empresa.getId()));
			}
			
			System.out.println("USUARIO RETORNO: " + usuario);

			return transformar(usuario);
		} else {
			throw new UsernameNotFoundException("Nombre de usuario o contraseña incorrecta.");
		}

	}

	public String permisos(List<Permiso> permisos) {
		String permisosString  = "";
		for(Permiso p : permisos) {
			permisosString = p.getNombreAmigable() + ";";
		}
		return permisosString.substring(0, permisosString.length() - 1);
	}

	private User transformar(Usuario usuario) {
		
		
		List<GrantedAuthority> permisos = new ArrayList<>();
		if (usuario != null) {
			String rol = usuario.getRol().getNombre().toUpperCase().replace(" ", "_");
			GrantedAuthority permiso = new SimpleGrantedAuthority("ROLE_" + rol);
			permisos.add(permiso);

			User user = new User(usuario.getMail(), usuario.getClave(), usuario.getEliminado() == null, true, true, true, permisos);

			ServletRequestAttributes attr = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
			HttpSession session = attr.getRequest().getSession();

			session.setAttribute(USUARIO_LABEL, usuario);
			session.setAttribute("businesName", null);

			return user;
		} else {
			return null;
		}
	}

	public Page<Usuario> buscarTodos(Pageable paginable, String q) {
		if (q == null || q.isEmpty()) {
			return usuarioRepository.listarActivos(paginable);
		} else {
			List<Usuario> usuarios = usuarioRepository.listarActivosList(paginable, "%" + q + "%");

			return new PageImpl<>(usuarios, paginable, usuarios.size());
		}
	}

	public List<Usuario> buscarTodosList() {
		return usuarioRepository.listarActivosList();
	}
	
	public List<UsuarioModel> buscarTodosPorEmpresa(String id) {
		return usuarioConverter.entidadesToModelos(usuarioRepository.listarActivosPorEmpresaList(id));
	}

	public Page<Usuario> buscarTodosPorPais(Pageable paginable, String q, String idPais) {
		if (q == null || q.isEmpty()) {
			return usuarioRepository.listarActivosPorPais(paginable, idPais);
		} else {
			List<Usuario> usuarios = usuarioRepository.listarActivosPorPaisList(paginable, "%" + q + "%", idPais);
			return new PageImpl<>(usuarios, paginable, usuarios.size());

		}
	}

	public List<Usuario> buscarTodosPorPaisList(String idPais) {
		return usuarioRepository.listarActivosPorPaisList(idPais);
	}


	public Usuario blanquearPass(String id) {
		Usuario usuario = buscar(id);
		usuario.setClave(generarPassword(usuario.getMail()));
		usuario.setModificacion(new Date());
		return usuarioRepository.save(usuario);
	}

	public Usuario buscarPorEmail(String email) {
		return usuarioRepository.findByMailIgnoreCase(email);
	}

	public Usuario buscarPorNombreUsuario(String usuario) {
		return usuarioRepository.buscarPorUsuario(usuario);
	}

	public Usuario getFromToken(String token) {
		String id = jwtService.decodificarToken(token).getClaim("id").asString();
		return usuarioRepository.findById(id).orElse(null);
	}

	public UsuarioModel getFromPassRecoveryToken(String token) {
		String email = jwtService.decodificarToken(token).getClaim("email").asString();
		UsuarioModel model = new UsuarioModel();
		model.setId(usuarioRepository.findByMailIgnoreCase(email).getId());
		return model;
	}


}
