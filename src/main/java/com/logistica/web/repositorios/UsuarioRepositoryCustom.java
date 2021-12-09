package com.logistica.web.repositorios;

import java.util.Date;
import java.util.List;

import com.logistica.web.entidades.Usuario;

public interface UsuarioRepositoryCustom {

	List<Usuario> buscarPorCriterios(Integer pedidos, Date fechaInicio, Date fechaFinal, Boolean admin, String q, String idPais,
			String idPropio);

//	@PersistenceContext
//	private EntityManager em;
//	
//	public List<UsuarioModelReporte> buscarPorCriteriosTransportador(Integer pedidosOfertas, String fechaInicio, String fechaFinal, Boolean admin, String q,String idPais, String idPropio){
//		
//		
//		String query = "SELECT COUNT(u.id), u.id, u.rol, u.mail, u.modificacion, u.cuit  "+ 
//				"FROM usuario u " + 
//				"LEFT JOIN transportador t ON (u.id = t.usuario_id) " +
//				"LEFT JOIN dador_de_carga d ON (u.id = d.usuario_id) "+
//				"LEFT JOIN pedido p ON (d.id = p.dador_id) "+
//				"WHERE "+ 
//				"(u.nombre LIKE '%:q%' OR u.telefono LIKE '%:q%' OR u.mail LIKE '%:q%' OR u.cuit LIKE '%:q%' OR t.razon_social LIKE '%:q%' OR d.razon_social LIKE '%:q%') "+
//				"AND (u.rol LIKE '%:admin%' OR u.rol LIKE '%:locadadm%') "+
//				"AND u.id NOT LIKE :idPropio AND t.eliminado IS NULL AND u.eliminado IS NULL "+
//				"GROUP BY u.id; "; 
//		
//		String administrador = "";
//		String administradorLocal = "";
//		if(admin != null && admin == true) {
//			administrador = "ADMINISTRADOR";
//			administradorLocal = "ADMINISTRADOR_LOCAL";
//		}
//		
//		if(pedidosOfertas == null || pedidosOfertas < 0) {
//			pedidosOfertas = 0;
//		}
//		
//		if(fechaInicio == null) {
//			fechaInicio = "";
//		}
//		
//		if(fechaFinal == null) {
//			fechaFinal = "";
//		}
//
//		if(q == null) {
//			q = "";
//		}
//		
//		
//		query = query.replace(":q", q)
//					 .replace(":idPropio", idPropio)
//					 .replace(":fechaInicio", fechaInicio)
//					 .replace(":fechaFinal", fechaFinal)
//					 .replace(":admin", administrador)
//					 .replace(":locadadm", administradorLocal)
//					 .replace(":cargasPublicadas", pedidosOfertas.toString()); 
//		
//		List<Object[]> usuarios  =  em.createNativeQuery(query).getResultList();
//		List<UsuarioModelReporte> reporte = new ArrayList<UsuarioModelReporte>();
//		
//		for (Object[] u : usuarios) {
//			u.getClass();
//			
//			UsuarioModelReporte usuario =  new UsuarioModelReporte();
//			BigInteger b1 = (BigInteger)u[0];
//			usuario.setPedidos(b1.intValue());
//			usuario.setId((String)u[1]);
//			usuario.setRol((String)u[2]);
//			usuario.setMail((String)u[3]);
//			usuario.setModificacion((Date)u[4]);
//			usuario.setCuit((String)u[5]);
//	//			usuario.setRazonSocialDador((String)u[6]);
//	//			usuario.setRazonSocialTransportador((String)u[7]);
//			reporte.add(usuario);
//		}
//		return reporte;
//	}


	


}
