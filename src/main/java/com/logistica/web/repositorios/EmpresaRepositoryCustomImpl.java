package com.logistica.web.repositorios;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Join;
import javax.persistence.criteria.JoinType;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import com.logistica.web.entidades.Empresa;
import com.logistica.web.entidades.Pais;
import com.logistica.web.entidades.Usuario;
import org.springframework.stereotype.Repository;

@Repository
public class EmpresaRepositoryCustomImpl implements EmpresaRepositoryCustom {
	
	@PersistenceContext
	private EntityManager em;
	
	@Override
	public List<Empresa> buscarPorCriteriosParaUsuariosModel(Integer pedidos, Date fechaInicio, Date fechaFinal, Boolean admin, String q, String idPais, String idPropio){
		CriteriaBuilder cb = em.getCriteriaBuilder();
		CriteriaQuery<Empresa> query = cb.createQuery(Empresa.class);
		Root<Empresa> dador = query.from(Empresa.class);
		List<Predicate> predicates = new ArrayList<>();
		Join<Empresa,Usuario> usuario = dador.join("usuario", JoinType.INNER);
		
		predicates.add(cb.equal(dador.get("usuario").get("id"), usuario.get("id")));
		
		if(q != null && !q.isEmpty()) {
			
			q = "%"+q+"%";
			Predicate p1 = cb.like(usuario.get("nombre"), q);
			Predicate p2 = cb.like(usuario.get("mail"), q);
			Predicate p3 = cb.like(usuario.get("cuit"), q);
			Predicate p4 = cb.like(usuario.get("telefono"), q);
			predicates.add(cb.or(p1,p2,p3,p4));
			
		}
		
		if(fechaInicio != null && fechaFinal != null) {
			predicates.add(cb.between(usuario.get("modificacion"), fechaInicio, fechaFinal));
		}else if (fechaInicio != null) {
			predicates.add(cb.equal(usuario.get("modificacion"), fechaInicio));
		}else if (fechaFinal != null) {
			predicates.add(cb.equal(usuario.get("modificacion"), fechaFinal));
		}
		
		if(idPais != null && !idPais.isEmpty()) {
			Join<Usuario, Pais> pais = usuario.join("pais", JoinType.INNER);
			predicates.add(cb.like(pais.get("id"), idPais));
		}
		
		predicates.add(cb.notLike(usuario.get("id"), idPropio));
		predicates.add(cb.isNull(usuario.get("eliminado")));
		predicates.add(cb.isNull(dador.get("eliminado")));
		query.where(predicates.toArray(new Predicate[0]));
		query.distinct(true);
		return em.createQuery(query).getResultList();
		
	}
	

	
	
	

}
