/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ar.com.articulos.java.entities;

import ar.com.articulos.java.enumerators.Distribuidor;
import ar.com.articulos.java.enumerators.TipoArticulo;

/**
 *
 * @author ricardo
 */
//Clase que representa a la tabla articulos de la base de datos negocio.
public class Articulo {
    //Atributos
    private int id;
    private String nombre;
    private Distribuidor distribuidor;
    private TipoArticulo tipoArticulo;
    private double precio;

    //Constructor por defecto
    public Articulo() {
    }

    /**
     * Constructor de instancia de la clase Articulo.
     * @param nombre Nombre del artículo.
     * @param distribuidor Distribuidor del artículo disponible.
     * @param tipoArticulo Tipo de artículo disponible.
     * @param precio Precio de venta del artículo.
     */
    public Articulo(String nombre, Distribuidor distribuidor,TipoArticulo tipoArticulo, double precio) {
        this.nombre = nombre;
        this.distribuidor=distribuidor;
        this.tipoArticulo = tipoArticulo;
        this.precio = precio;
    }
    
    /**
     * Sobrecarga del constructor de instancia de la clase Articulo.
     * @param id Id asignado al producto una vez insertado en la base de datos.
     * @param nombre Nombre del artículo.
     * @param distribuidor Distribuidor del artículo disponible.
     * @param tipoArticulo Tipo de artículo disponible.
     * @param precio Precio de venta del artículo.
     */
     public Articulo(int id, String nombre, Distribuidor distribuidor,TipoArticulo tipoArticulo, double precio) {
       this(nombre,distribuidor,tipoArticulo,precio);
       this.id=id;
    }

    //Getters y setters de todos los ar
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Distribuidor getDistribuidor() {
        return distribuidor;
    }

    public void setDistribuidor(Distribuidor distribuidor) {
        this.distribuidor = distribuidor;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public TipoArticulo getTipoArticulo() {
        return tipoArticulo;
    }

    public void setTipoArticulo(TipoArticulo tipoArticulo) {
        this.tipoArticulo = tipoArticulo;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    /**
     * Sobreescritura del toString que retorna el estado del artículo.
     * @return Cadena de caracteres con los valores de los atributos del artículo.
     */
    @Override
    public String toString() {
        return "Articulo{" + "id=" + id + ", distribuidor=" + distribuidor + ", nombre=" + nombre + ", tipoArticulo=" + tipoArticulo + ", precio=" + precio + '}';
    }
    
}
