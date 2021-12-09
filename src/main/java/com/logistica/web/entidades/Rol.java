package com.logistica.web.entidades;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

import org.hibernate.annotations.GenericGenerator;

import com.logistica.web.utiles.JSONBuilder;

import lombok.Data;

@Entity
@Data
public class Rol implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(generator = "uuid")
	@GenericGenerator(name = "uuid", strategy = "uuid2")
	private String id;
	
	private String nombre;
	
	private boolean isAdmin;
	
	@ManyToMany(fetch = FetchType.EAGER)
	private List<Permiso> permisos;
	
	@ManyToOne
	private Empresa empresa;

	@Temporal(TemporalType.TIMESTAMP)
	private Date alta;

	@Temporal(TemporalType.TIMESTAMP)
	private Date modificacion;

	@Temporal(TemporalType.TIMESTAMP)
	private Date baja;
	
	@ManyToOne(fetch = FetchType.LAZY)
	private Usuario creador;
	
	@Transient
	private String permisosJson;
	
	public String getPermisosJson() {
		JSONBuilder json = new JSONBuilder();
		json.initArray();
		for (Permiso permiso : permisos) {
			
			JSONBuilder jsonPermiso = new JSONBuilder();
			jsonPermiso.initEntity();
			
			jsonPermiso.add("id", permiso.getId());
			jsonPermiso.add("nombre", permiso.getNombre());
			jsonPermiso.add("nombreAmigable", permiso.getNombreAmigable());
			jsonPermiso.add("administrador", permiso.getAdministrador());
			
			jsonPermiso.endEntity();
			json.add(jsonPermiso);
		}
		json.endArray();
		return json.toJSON();
	}
	
}