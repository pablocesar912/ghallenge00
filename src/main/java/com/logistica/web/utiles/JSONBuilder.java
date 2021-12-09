package com.logistica.web.utiles;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;

public class JSONBuilder {
    private StringBuilder json;
   
    public JSONBuilder() {
        this.json = new StringBuilder();
    }
    
    public JSONBuilder addEntity(String propiedad, String entidad){
        next();
        json.append("\"").append(propiedad).append("\"").append(":").append(entidad);
        return this;
    }
   
    public JSONBuilder add(JSONBuilder jb){
        next();
        json.append(jb.toString());
        return this;
    }
   
    public JSONBuilder add(String propiedad, JSONBuilder jb){
        next();
        json.append("\"").append(propiedad).append("\"").append(":").append(jb.toString());
        return this;
    }
   
    public JSONBuilder add(String propiedad, Date fecha){
        next();
        String valor = new SimpleDateFormat("dd/mm/yyyy").format(fecha);
        return add(propiedad, valor);
    }
   
    public JSONBuilder add(String propiedad, Boolean valor){
        next();
        json.append("\"").append(propiedad).append("\"").append(":").append(valor);
        return this;
    }
    
    public JSONBuilder add(HashMap<String, String> mapa){
    	for(String key : mapa.keySet()){
	        next();
	        json.append("\"").append(key).append("\"").append(":").append(mapa.get(key));
    	}
    	return this;
    }
    
    public JSONBuilder addToArray(Iterator<String> it, int size){
    	
    	String arreglo = "";
		
		for(int n = 0; it.hasNext(); n++){
			String categoria = it.next();
			arreglo += "\"" + categoria + "\"";
			if(n < size - 1){
				arreglo += ",";
			}
		}
	
        json.append(arreglo);
        return this;
    }
    
    public JSONBuilder addArrayValue(String valor){
    	if(valor == null){
    		valor = "";
    	}
    	json.append("\"").append(valor).append("\"");
    	return this;
    }
   
    public JSONBuilder add(String propiedad, Number valor){
        next();
        json.append("\"").append(propiedad).append("\"").append(":").append(valor);
        return this;
    }
   
    public JSONBuilder add(String propiedad, String valor){
        next();
        if(valor == null){
            valor = "";
        }
        valor = valor.replaceAll("'", "&#39;").replaceAll("\"", "&#39;&#39;").replaceAll("\n", "");
        json.append("\"").append(propiedad).append("\"").append(":").append("\"").append(valor).append("\"");
        return this;
    }
   
    public JSONBuilder comilla(){
        json.append("\"");
        return this;
    }
   
    public JSONBuilder initArray(){
        json.append("[");
        return this;
    }
    
    public JSONBuilder addToArray(String valor) {
    	next();
    	json.append(valor);
    	return this;
    }
    
    public JSONBuilder addArray(String valor){
    	json.append(valor);
    	return this;
    }
    
    public JSONBuilder addToArray(Long valor) {
    	next();
    	json.append(valor);
    	return this;
    }
    
    public JSONBuilder addToArray(Double valor) {
    	next();
    	json.append(valor);
    	return this;
    }
   
    public JSONBuilder endArray(){
    	if(json.toString().endsWith(",")){
    		json.delete(json.length() - 1, json.length());
    	}
        json.append("]");
        return this;
    }
   
    public JSONBuilder initEntity(){
        json.append("{");
        return this;
    }
   
    public JSONBuilder endEntity(){
        json.append("}");
        return this;
    }
   
    public JSONBuilder next(){
        if(json.length() > 1){
            json.append(",");
        }
        return this;
    }
   
    public String toJSON(){
        return json.toString();
    }
   
    @Override
    public String toString() {
        return toJSON();
    }
    
//    
//    private final Charset UTF8_CHARSET = Charset.forName("UTF-8");
//
//    private String decodeUTF8(byte[] bytes) {
//        return new String(bytes, UTF8_CHARSET);
//    }
//
//    byte[] encodeUTF8(String string) {
//        return string.getBytes(UTF8_CHARSET);
//    }
   
}