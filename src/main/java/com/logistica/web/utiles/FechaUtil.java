package com.logistica.web.utiles;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Locale;

import org.joda.time.DateTime;

public final class FechaUtil {
	public static SimpleDateFormat FECHA_GUIONES = new SimpleDateFormat("dd-MM-yyyy", Locale.forLanguageTag("es"));

	public static SimpleDateFormat FECHA = new SimpleDateFormat("dd/MM/yyyy", Locale.forLanguageTag("es"));
	public static SimpleDateFormat FECHA_HORA = new SimpleDateFormat("dd/MM/yyyy HH:mm", Locale.forLanguageTag("es"));
	public static SimpleDateFormat FECHA_CALENDAR = new SimpleDateFormat("yyyy-MM-dd", Locale.forLanguageTag("es"));

	public static SimpleDateFormat FECHA_HORA_ENCUESTA = new SimpleDateFormat("yyyy-MM-dd HH:mm", Locale.forLanguageTag("es"));
	public static SimpleDateFormat FECHA_DIA = new SimpleDateFormat("EEEE dd", Locale.forLanguageTag("es"));

	
	public static final int anios(int anio) {
		return new GregorianCalendar().get(Calendar.YEAR) - anio;
	}
	
	public static Date parseFechaGuiones(String f) {
		try {
			return FECHA_GUIONES.parse(f);
		} catch (ParseException e) {
			return null;
		}
	}
	
	public static String formatFechaGuiones(Date f) {
		try {
			return FECHA_GUIONES.format(f);
		} catch (Exception e) {
			return null;
		}
	}
	
	public static Date parseFecha(String f) {
		try {
			return FECHA.parse(f);
		} catch (ParseException e) {
			return null;
		}
	}

	public static Date parseHora(String f) {
		try {
			return FECHA_HORA.parse(f);
		} catch (ParseException e) {
			return null;
		}
	}
	
	public static Date parseHoraEncuesta(String f) {
		try {
			return FECHA_HORA_ENCUESTA.parse(f);
		} catch (ParseException e) {
			return null;
		}
	}

	public static String formatFecha(Date f) {
		try {
			return FECHA.format(f);
		} catch (Exception e) {
			return null;
		}
	}

	public static String formatHora(Date f) {
		try {
			return FECHA_HORA.format(f);
		} catch (Exception e) {
			return null;
		}
	}
	
	public static String formatHoraEncuesta(Date f) {
		try {
			return FECHA_HORA_ENCUESTA.format(f);
		} catch (Exception e) {
			return null;
		}
	}

	public static Date primerDiaAnio() {
		DateTime date = new DateTime().dayOfYear().withMinimumValue().withTimeAtStartOfDay();
		return date.toDate();
	}

	public static Date ultimoDiaAnio() {
		DateTime date = new DateTime().plusYears(1).dayOfYear().withMinimumValue().withTimeAtStartOfDay();
		return date.toDate();
	}
	
	public static String formatoLargo(Date fecha) {
		SimpleDateFormat formato = new SimpleDateFormat("dd 'de' MMMM 'de' yyyy", new Locale("es", "ES"));
		return formato.format(fecha);
	}
}
