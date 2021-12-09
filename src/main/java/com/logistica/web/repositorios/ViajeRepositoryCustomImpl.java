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

import org.springframework.beans.factory.annotation.Autowired;

import com.logistica.web.entidades.Chofer;
import com.logistica.web.entidades.Empresa;
import com.logistica.web.entidades.Modelo;
import com.logistica.web.entidades.Remolque;
import com.logistica.web.entidades.TipoCarga;
import com.logistica.web.entidades.TipoRemolque;
import com.logistica.web.entidades.TipoVehiculo;
import com.logistica.web.entidades.Ubicacion;
import com.logistica.web.entidades.Vehiculo;
import com.logistica.web.entidades.Viaje;
import com.logistica.web.modelos.busqueda.BusquedaViajeModel;
import com.logistica.web.utiles.Fecha;
import org.springframework.stereotype.Repository;

@Repository
public class ViajeRepositoryCustomImpl implements ViajeRepositoryCustom {

    @PersistenceContext
    private EntityManager em;
    private final EmpresaRepository empresaRepository;

    @Autowired
    public ViajeRepositoryCustomImpl(EmpresaRepository empresaRepository) {
        this.empresaRepository = empresaRepository;
    }

    @Override
    public List<Viaje> buscarPorCriterios(BusquedaViajeModel viajeM, Empresa transporte) {

        CriteriaBuilder cb = em.getCriteriaBuilder();
        CriteriaQuery<Viaje> query = cb.createQuery(Viaje.class);
        Root<Viaje> viaje = query.from(Viaje.class);
        List<Predicate> predicates = new ArrayList<>();

        Join<Viaje, Chofer> chofer = viaje.join("chofer", JoinType.LEFT);
        Join<Viaje, Empresa> transportadora = viaje.join("transporte", JoinType.LEFT);
        Join<Viaje, Vehiculo> vehiculo = viaje.join("vehiculo", JoinType.LEFT);
        Join<Viaje, Remolque> remolque = viaje.join("remolque", JoinType.LEFT);

        if (viajeM.getTipoDeRemolque() != null && !viajeM.getTipoDeRemolque().isEmpty()) {
            Join<Remolque, TipoRemolque> tr = remolque.join("tipoRemolque", JoinType.LEFT);
            predicates.add(cb.like(tr.get("id"), viajeM.getTipoDeRemolque()));
        }

        if (viajeM.getTipoDeCamion() != null && !viajeM.getTipoDeCamion().isEmpty()) {
            Join<Vehiculo, TipoVehiculo> tv = vehiculo.join("tipoVehiculo", JoinType.LEFT);
            predicates.add(cb.like(tv.get("id"), viajeM.getTipoDeCamion()));
        }

        if (viajeM.getIdModelo() != null && !viajeM.getIdModelo().isEmpty()) {
            Join<Vehiculo, Modelo> modelo = vehiculo.join("modelo", JoinType.LEFT);
            predicates.add(cb.like(modelo.get("id"), viajeM.getIdModelo()));
        }

        if (viajeM.getChofer() != null && !viajeM.getChofer().isEmpty()) {
            String cadena = "%" + viajeM.getChofer() + "%";
            predicates.add(cb.like(chofer.get("nombre"), cadena));
            predicates.add(cb.like(chofer.get("apellido"), cadena));
        }

        if (viajeM.getOrigen() != null && !viajeM.getOrigen().isEmpty()) {
            Join<Viaje, Ubicacion> origen = viaje.join("ubicacionInicial", JoinType.LEFT);
            predicates.add(cb.like(origen.get("direccion"), "%" + viajeM.getOrigen() + "%"));
        }

        if (viajeM.getDestino() != null && !viajeM.getDestino().isEmpty()) {
            Join<Viaje, Ubicacion> destino = viaje.join("ubicacionFinal", JoinType.LEFT);
            predicates.add(cb.like(destino.get("direccion"), "%" + viajeM.getDestino() + "%"));
        }

        if (viajeM.getFechaDesde() != null && viajeM.getFechaHasta() != null && !viajeM.getFechaDesde().isEmpty() && !viajeM.getFechaHasta().isEmpty()) {
            Date d1 = Fecha.parseFechaGuiones(viajeM.getFechaDesde());
            Date d2 = Fecha.parseFechaGuiones(viajeM.getFechaHasta());
            predicates.add(cb.and(cb.greaterThanOrEqualTo(viaje.get("partidaCargaNegativa"), d1), cb.lessThanOrEqualTo(viaje.get("llegadaCargaNegativa"), d2)));
        } else if (viajeM.getFechaDesde() != null && !viajeM.getFechaDesde().isEmpty()) {
            Date d1 = Fecha.parseFechaGuiones(viajeM.getFechaDesde());
            predicates.add(cb.greaterThanOrEqualTo(viaje.get("partidaCargaNegativa"), d1));
        } else if (viajeM.getFechaHasta() != null && !viajeM.getFechaHasta().isEmpty()) {
            Date d2 = Fecha.parseFechaGuiones(viajeM.getFechaHasta());
            predicates.add(cb.lessThanOrEqualTo(viaje.get("llegadaCargaNegativa"), d2));
        }

        if (viajeM.getKms() != null && viajeM.getKms() > 0) {
            String kms = String.valueOf(viajeM.getKms());
            predicates.add(cb.like(viaje.get("kms"), kms));
        }

        if (viajeM.getTipoDeCarga() != null && !viajeM.getTipoDeCarga().isEmpty()) {

            List<TipoCarga> tipoCargasEntidad = new ArrayList<TipoCarga>();
            List<Remolque> remolquesConCargas;
            List<Vehiculo> vehiculoConCargas;
            List<Predicate> or = new ArrayList<>();
            predicates.add(cb.or(or.toArray(new Predicate[0])));
        }


        if (viajeM.getQ() != null && !viajeM.getQ().isEmpty()) {

            String q = "%" + viajeM.getQ() + "%";

            Join<Viaje, Ubicacion> ubicacion = viaje.join("ubicacionInicial", JoinType.LEFT);
            Predicate p1 = cb.like(ubicacion.get("direccion"), q);
            ubicacion = viaje.join("ubicacionFinal", JoinType.INNER);
            Predicate p2 = cb.like(ubicacion.get("direccion"), q);
            Predicate p3 = cb.like(chofer.get("nombre"), q);
            Predicate p4 = cb.like(chofer.get("apellido"), q);
            Predicate p5 = cb.like(transportadora.get("nombre"), q);
            Predicate p6 = cb.like(transportadora.get("nombre"), q);

            predicates.add(cb.or(p1, p2, p3, p4, p5, p6));

        }

        if (transporte != null) {
            predicates.add(cb.notEqual(viaje.get("transporte"), transporte));
        }

        predicates.add(cb.isNull(viaje.get("eliminado")));
        predicates.add(cb.isTrue(viaje.get("isCargaNegativa")));
        query.where(predicates.toArray(new Predicate[0])).orderBy(cb.desc(viaje.get("partidaCargaNegativa")));
        return em.createQuery(query).getResultList();

    }

    @Override
    public List<Viaje> buscarPorCriteriosPropios(BusquedaViajeModel viajeM, Empresa empresa) {

        CriteriaBuilder cb = em.getCriteriaBuilder();
        CriteriaQuery<Viaje> query = cb.createQuery(Viaje.class);
        Root<Viaje> viaje = query.from(Viaje.class);
        List<Predicate> predicates = new ArrayList<>();

        Join<Viaje, Chofer> chofer = viaje.join("chofer", JoinType.LEFT);
        Join<Viaje, Empresa> transporte = viaje.join("transporte", JoinType.LEFT);
        Join<Viaje, Vehiculo> vehiculo = viaje.join("vehiculo", JoinType.LEFT);
        Join<Viaje, Remolque> remolque = viaje.join("remolque", JoinType.LEFT);

        if (viajeM.getChofer() != null && !viajeM.getChofer().isEmpty()) {
            String cadena = "%" + viajeM.getChofer() + "%";
            predicates.add(cb.like(chofer.get("nombre"), cadena));
            predicates.add(cb.like(chofer.get("apellido"), cadena));
        }

        if (viajeM.getOrigen() != null && !viajeM.getOrigen().isEmpty()) {
            Join<Viaje, Ubicacion> origen = viaje.join("ubicacionInicial", JoinType.LEFT);
            predicates.add(cb.like(origen.get("direccion"), "%" + viajeM.getOrigen() + "%"));
        }

        if (viajeM.getDestino() != null && !viajeM.getDestino().isEmpty()) {
            Join<Viaje, Ubicacion> destino = viaje.join("ubicacionFinal", JoinType.LEFT);
            predicates.add(cb.like(destino.get("direccion"), "%" + viajeM.getDestino() + "%"));
        }

        if (viajeM.getFechaDesde() != null && viajeM.getFechaHasta() != null && !viajeM.getFechaDesde().isEmpty() && !viajeM.getFechaHasta().isEmpty()) {
            Date d1 = Fecha.parseFechaGuiones(viajeM.getFechaDesde());
            Date d2 = Fecha.parseFechaGuiones(viajeM.getFechaHasta());
            predicates.add(cb.and(cb.greaterThanOrEqualTo(viaje.get("partidaCargaNegativa"), d1), cb.lessThanOrEqualTo(viaje.get("llegadaCargaNegativa"), d2)));
        } else if (viajeM.getFechaDesde() != null && !viajeM.getFechaDesde().isEmpty()) {
            Date d1 = Fecha.parseFechaGuiones(viajeM.getFechaDesde());
            predicates.add(cb.greaterThanOrEqualTo(viaje.get("partidaCargaNegativa"), d1));
        } else if (viajeM.getFechaHasta() != null && !viajeM.getFechaHasta().isEmpty()) {
            Date d2 = Fecha.parseFechaGuiones(viajeM.getFechaHasta());
            predicates.add(cb.lessThanOrEqualTo(viaje.get("llegadaCargaNegativa"), d2));
        }

        if (viajeM.getKms() != null && viajeM.getKms() > 0) {
            String kms = String.valueOf(viajeM.getKms());
            predicates.add(cb.like(viaje.get("kms"), kms));
        }

        if (viajeM.getTipoDeCarga() != null && !viajeM.getTipoDeCarga().isEmpty()) {
            Join<Remolque, TipoCarga> tc = remolque.join("tipoCargas", JoinType.LEFT);
            Join<Vehiculo, TipoCarga> tcv = vehiculo.join("tipoCargas", JoinType.LEFT);
            for (String carga : viajeM.getTipoDeCarga()) {
                predicates.add(cb.like(tc.get("caracteristicas"), carga));
                predicates.add(cb.like(tcv.get("tipoCargas"), carga));
            }
        }

        if (viajeM.getVehiculo() != null && !viajeM.getVehiculo().isEmpty()) {
            predicates.add(cb.like(vehiculo.get("id"), viajeM.getVehiculo()));
        }


        if (viajeM.getQ() != null && !viajeM.getQ().isEmpty()) {

            String q = "%" + viajeM.getQ() + "%";

            Join<Viaje, Ubicacion> ubicacion = viaje.join("ubicacionInicial", JoinType.LEFT);
            Predicate p1 = cb.like(ubicacion.get("direccion"), q);
            ubicacion = viaje.join("ubicacionFinal", JoinType.LEFT);
            Predicate p2 = cb.like(ubicacion.get("direccion"), q);
            Predicate p3 = cb.like(chofer.get("nombre"), q);
            Predicate p4 = cb.like(chofer.get("apellido"), q);
            Predicate p5 = cb.like(transporte.get("nombre"), q);
            Predicate p6 = cb.like(transporte.get("nombre"), q);

            predicates.add(cb.or(p1, p2, p3, p4, p5, p6));

        }

        predicates.add(cb.isNull(viaje.get("eliminado")));
        predicates.add(cb.isTrue(viaje.get("isCargaNegativa")));

        predicates.add(cb.like(transporte.get("id"), empresa.getId()));
        query.where(predicates.toArray(new Predicate[0])).orderBy(cb.desc(viaje.get("partidaCargaNegativa")));
        return em.createQuery(query).getResultList();

    }

}
