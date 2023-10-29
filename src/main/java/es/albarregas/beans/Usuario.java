package es.albarregas.beans;

import java.io.Serializable;
import java.util.Date;

/**
 *
 * @author javier
 */
public class Usuario implements Serializable{

    private Integer id;
    private String nombre;
    private Date fecha;
    private String identificador;
    private document tipo;

    public enum document {
        DNI, NIE, PASAPORTE
    };

    public Usuario(int id, String nombre, Date fecha, String identificador, document tipo) {
        this.id = id;
        this.nombre = nombre;
        this.fecha = fecha;
        this.identificador = identificador;
    }
    
      public Usuario() {
    }
    

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public String getIdentificador() {
        return identificador;
    }

    public void setIdentificador(String identificador) {
        this.identificador = identificador;
    }

    public document getTipo() {
        return tipo;
    }

    public void setTipo(document tipo) {
        this.tipo = tipo;
    }

    

  
}
