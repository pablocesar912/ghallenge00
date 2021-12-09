package com.logistica.web.entidades;

import java.io.Serializable;
import java.util.Collections;
import java.util.Date;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

import org.hibernate.annotations.GenericGenerator;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.logistica.web.enumeraciones.EstadoViaje;

import lombok.Data;

@Data
@Entity
public class Viaje implements Serializable {
	private static final long serialVersionUID = 5280568346761005560L;
	@Id
	@GeneratedValue(generator = "uuid")
	@GenericGenerator(name = "uuid", strategy = "uuid2")
	private String id;

	@ManyToOne
	private Chofer chofer;

	@ManyToOne
	private Vehiculo vehiculo;
	
	@ManyToMany
	private List<Checklist> checklist;

	@ManyToOne
	private Remolque remolque;
	private Boolean isCargaNegativa;

	@Temporal(TemporalType.TIMESTAMP)
	private Date partidaCargaNegativa;

	@Temporal(TemporalType.TIMESTAMP)
	private Date llegadaCargaNegativa;
	
	@Temporal(TemporalType.TIMESTAMP)
	private Date partida;

	@Temporal(TemporalType.TIMESTAMP)
	private Date llegada;

	private String kms;

	@Enumerated(EnumType.STRING)
	private EstadoViaje estadoViaje;
	
	@ManyToOne
	private Ubicacion ubicacionInicial;
	
	@ManyToOne
	private Empresa transporte;
	
	@ManyToOne
	private Ubicacion ubicacionFinal;
	
	private Double presupuesto;

	@OneToOne
	private Pedido pedido;

	@JsonIgnore
	@OneToMany(mappedBy = "viaje")
	private List<Coincidencia> coincidencias;
	
	@Temporal(TemporalType.TIMESTAMP)
	private Date modificacion;
	
	@Temporal(TemporalType.TIMESTAMP)
	private Date eliminado;
	private boolean internacional;
	
	@OneToMany
	private List<WayPoint> camino;

	@Transient
	private String ruta;

	@Transient
	private String inicio;

	@Transient 
	private String fin;

	
	public String toString() {
		return "Viaje: " + id;
	}
	
	public String toPath() {
		if (ruta == null) {
			geodata();
		}

		return ruta;
	}
	
	private void geodata() {
		Collections.sort(camino);

		StringBuilder sb = new StringBuilder();
		for (int n = 0; n < camino.size(); n++) {
			WayPoint wp = camino.get(n);
			sb.append(wp.getLatitud()).append(",").append(wp.getLongitud());

			if (n < camino.size() - 1) {
				sb.append("|");
			}
		}

		ruta = sb.toString();

		if (!camino.isEmpty()) {
			WayPoint pi = camino.get(0);
			inicio = pi.getLatitud() + "," + pi.getLongitud();

			WayPoint pf = camino.get(camino.size() - 1);
			fin = pf.getLatitud() + "," + pf.getLongitud();
		} else if(ubicacionFinal != null && ubicacionInicial != null){
			inicio = ubicacionInicial.getLatitud() + "," + ubicacionInicial.getLongitud();
			fin = ubicacionFinal.getLatitud() + "," + ubicacionFinal.getLongitud();
		} else {
			inicio = "0,0";
			fin = "0,0";
		}
	}

	public String inicio() {
		if (inicio == null) {
			geodata();
		}
		return inicio;
	}

	public String fin() {
		if (fin == null) {
			geodata();
		}
		return fin;
	}
}
