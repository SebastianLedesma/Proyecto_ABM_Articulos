/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ar.com.articulos.java.jdbc;

import ar.com.articulos.java.entities.Articulo;
import ar.com.articulos.java.enumerators.Distribuidor;
import ar.com.articulos.java.enumerators.TipoArticulo;
import ar.com.articulos.java.interfaces.I_ArticuloRepository;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

/**
 *
 * @author ricardo
 */
//Clase que implementa la interface I_ArticuloRepository para trabajar con los artículos.
public class ArticuloRepository implements I_ArticuloRepository {

    //Atributo
    private Connection conexion;

    /**
     * Constructor de instancia para instanciar la clase.
     * @param conexion Conexión a la base de datos.
     */
    public ArticuloRepository(Connection conexion) {
        this.conexion = conexion;
    }

    /**
     * Método que guarda un artículo en la base de datos.
     * @param articulo Artículo a guardar.
     */
    @Override
    public void save(Articulo articulo) {
        try (PreparedStatement ps = this.conexion.prepareStatement(
                "insert into articulos (nombre,distribuidor,tipo,precio) values (?,?,?,?)",
                PreparedStatement.RETURN_GENERATED_KEYS)) {
            ps.setString(1, articulo.getNombre());
            ps.setString(2, articulo.getDistribuidor().toString());
            ps.setString(3, articulo.getTipoArticulo().toString());
            ps.setDouble(4, articulo.getPrecio());
            ps.execute();

            ResultSet rs = ps.getGeneratedKeys();
            if (rs.next()) {
                articulo.setId(rs.getInt(1));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * Método que actualiza los datos de un artículo en la base de datos.
     * @param articulo Artículo con los datos actualizados.
     */
    @Override
    public void update(Articulo articulo) {
        if (articulo != null) {
            try (PreparedStatement ps=this.conexion.prepareStatement(
                    "update articulos set nombre = ?, distribuidor = ?, tipo= ?,precio=? where id = ?")){
                ps.setString(1, articulo.getNombre());
                ps.setString(2, articulo.getDistribuidor().toString());
                ps.setString(3, articulo.getTipoArticulo().toString());
                ps.setDouble(4, articulo.getPrecio());
                ps.setInt(5, articulo.getId());
                ps.execute();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    /**
     * Método que elimina un artículo con la base de datos.
     * @param articulo Artículo a eliminar.
     */
    @Override
    public void delete(Articulo articulo) {
        if (articulo != null) {
            try (PreparedStatement ps = this.conexion.prepareStatement("delete from articulos where id = ?")) {
                ps.setInt(1, articulo.getId());
                ps.execute();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    /**
     * Método que retorna un lista de artículos obtenida de los registros de la base de datos.
     * @return Lista de artículos obtenida de la base de datos.
     */
    @Override
    public List<Articulo> getAll() {
        List<Articulo> lista = new ArrayList();
        try (ResultSet rs = this.conexion.createStatement().executeQuery("select * from articulos")) {
            while (rs.next()) {
                lista.add(new Articulo(
                        rs.getInt("id"),
                        rs.getString("nombre"),
                        Distribuidor.valueOf(rs.getString("distribuidor")),
                        TipoArticulo.valueOf(rs.getString("tipo")),
                        rs.getDouble("precio"))
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return lista;
    }

    /**
     * Método que retorna un artículo según el id buscado.
     * @param id Id del artículo buscado.
     * @return Artículo que tiene el id buscado. Si no hay coincidencia retornará un nuevo artículo.
     */
    @Override
    public Articulo getById(int id) {
        return this.getAll().stream().filter(item->item.getId() == id).findFirst().orElse(new Articulo());
    }

    /**
     * Método que retorna una lista de artículos según el tipo de artículo.
     * @param tipo Tipo de artículo a buscar.
     * @return Lista de artículos que son del tipo de artículo buscado.
     */
    @Override
    public List<Articulo> getLikeTipoArticulo(TipoArticulo tipo) {
        return this.getAll().
                    stream().
                    filter(item->item.getTipoArticulo().toString().equals(tipo.toString())).
                    collect(Collectors.toList());
    }

    /**
     * Método que retorna un lista de artículos según el distribuidor.
     * @param distribuidor Distribuidor a buscar.
     * @return Lista de artículos que coinciden con el distribudor buscado.
     */
    @Override
    public List<Articulo> getLikeDistribuidor(Distribuidor distribuidor) {
        return this.getAll().
                    stream().
                    filter(item->item.getDistribuidor().equals(distribuidor)).
                    collect(Collectors.toList());
    }

    /**
     * Método que evalua si un artículo esta en la base de datos según id.
     * @param id Id del artículo a buscar.
     * @return True si se encontró un artículo con el id buscado o false si no hubo coincidencia.
     */
    @Override
    public boolean getLikeValorEncontrado(int id) {
        return this.getAll().stream().anyMatch(item->item.getId() == id);
    }

}
