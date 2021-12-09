package com.logistica.web.servicios.jwt;

import java.util.Date;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.joda.time.DateTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.auth0.jwt.JWT;
import com.auth0.jwt.JWTCreator;
import com.auth0.jwt.algorithms.Algorithm;
import com.auth0.jwt.exceptions.JWTCreationException;
import com.auth0.jwt.exceptions.JWTDecodeException;
import com.auth0.jwt.exceptions.JWTVerificationException;
import com.auth0.jwt.interfaces.DecodedJWT;
import com.auth0.jwt.interfaces.JWTVerifier;
import com.logistica.web.entidades.Usuario;
import com.logistica.web.errores.WebException;
import com.logistica.web.modelos.EmpresaModel;
import com.logistica.web.modelos.UsuarioModel;
import com.logistica.web.repositorios.UsuarioRepository;
import com.logistica.web.servicios.EmpresaService;
import com.logistica.web.servicios.RolService;

@Service
public class JWTService {

	private final UsuarioRepository usuarioRepository;
	private final EmpresaService empresaService;
	private final RolService rolService;

	private static final String SECRET = "d612a8Ae6F01DA33626a966445404a96BB9d11c029298826A6A43D8Cf8AAEa9b" + "33B8f64b7f1CAEc8F6C63C8200BD7F63e509E310F8E7B9E7AaD24d326B453456" + "2337BEF8F28524C9faed56d6b33Bb2ddf3E1415eaa372d8ED92e1f049cEE0B29" + "03671DD9D72A401Ad5172B885DB844fF6dB48ED07524F3220Dd73758Cb1ef1ce" + "9A14dEeb710269C36E858A03FcADe2D5a732955A2ED85dc968b27862B86b6791" + "5e7433Bc6bdC0F21db066a78693f43ab8E83D095f917F064f7E0d0d89586811F" + "A4C449cfFd61b4Bbdba3cd495A92BFb992728E5Ec962325DE2Cd9241A01243E0" + "146dc146c099A4fC84306aC8dcE3beCedB1355F9bcc8a9e056B1a3116B5c8952" + "197620998A30EAE588568e110e414D068bb5ae63B1A18Ef559274Eb0C5890468" + "F30F5D0Fa4DB29136fA767ceA0c84d5884198f7888AABC32cdA8337F80A84Be5";

	private static final Algorithm ALG = Algorithm.HMAC256(SECRET);
	private static final String ISS = "MovLogistica";
	private final Log log = LogFactory.getLog(JWTService.class);

	@Autowired
	public JWTService(UsuarioRepository usuarioRepository, EmpresaService empresaService,RolService rolService) {
		this.usuarioRepository = usuarioRepository;
		this.empresaService = empresaService;
		this.rolService = rolService;
	}

	public String crearToken(UsuarioModel model) {
		Usuario usuario = usuarioRepository.findByMailIgnoreCase(model.getMail());
		String token = null;

		try {
			checkPass(usuario, model);

			JWTCreator.Builder builder = JWT.create().withIssuer(ISS).withIssuedAt(new Date()).withExpiresAt(new DateTime().plusWeeks(1).toDate()).withClaim("id", usuario.getId()).withClaim("nombre", usuario.getNombre()).withClaim("rol", usuario.getRol().toString()).withClaim("mail", usuario.getMail()).withClaim("idPais", usuario.getPais().getId());
			EmpresaModel empresa = empresaService.buscar(usuario.getEmpresa().getId());
			if (rolService.getRolesEmpresa(empresa.getId()).contains(usuario.getRol())) {
				return builder.withClaim("idEmpresa", empresa.getId()).withClaim("nombreEmpresa", empresa.getNombre().concat(" ".concat(empresa.getRazonSocial()))).sign(ALG);
			}

			token = builder.sign(ALG);
		} catch (JWTCreationException e) {
			log.error(e);
		} catch (NullPointerException | WebException e) {
			if (e instanceof NullPointerException) {
				log.info("Usuario <" + model.getMail() + "> no encontrado");
			}
			if (e instanceof WebException) {
				log.info(e.getMessage());
			}
			return "Credenciales inválidas";
		}

		return token;
	}

	private void checkPass(Usuario usuario, UsuarioModel model) throws WebException {
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		if (!encoder.matches(model.getClave(), usuario.getClave())) {
			throw new WebException("Contraseña incorrecta");
		}
	}

	public boolean verificarToken(String token) {
		JWTVerifier verifier;
		try {
			verifier = JWT.require(ALG).withIssuer(ISS).build();
			verifier.verify(token);
		} catch (JWTVerificationException e) {
			log.error(e);
			return false;
		}
		return true;
	}

	public DecodedJWT decodificarToken(String token) {
		DecodedJWT jwt = null;
		try {
			jwt = JWT.decode(token);
		} catch (JWTDecodeException e) {
			System.out.println("error: " + e.getMessage());
		}
		return jwt;
	}

	public String crearTokenRecuperacionClave(String email) {
		Usuario usuario = usuarioRepository.findByMailIgnoreCase(email);
		usuario.setUltimoRecuperarClave(new Date());
		usuarioRepository.save(usuario);

		return JWT.create().withIssuer(ISS).withIssuedAt(new Date()).withExpiresAt(new DateTime().plusHours(1).toDate()).withClaim("email", email).sign(ALG);
	}

}
