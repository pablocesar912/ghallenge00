package com.logistica.web.entidades;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

import org.hibernate.annotations.GenericGenerator;
import org.hibernate.search.annotations.Field;
import org.hibernate.search.annotations.Store;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.Data;

@Data
@Entity
public class WayPoint implements Serializable, Comparable<WayPoint> {
    private static final long serialVersionUID = 5914814815869607956L;

    @Id
    @GeneratedValue(generator = "uuid")
    @GenericGenerator(name = "uuid", strategy = "uuid2")
    private String id;
        
    @Field(store = Store.YES)
    private Double latitud;

    @Field(store = Store.YES)
    private Double longitud;
    
    @JsonIgnore
    @ManyToOne(fetch = FetchType.LAZY)
    private Viaje viaje;
    
    private int orden;
    
    @Override
    public int compareTo(WayPoint o) {
    	return orden - o.getOrden();
    }
}
