package ar.com.articulos.java.interfaces;

import ar.com.articulos.java.entities.Articulo;
import ar.com.articulos.java.enumerators.Distribuidor;
import ar.com.articulos.java.enumerators.TipoArticulo;
import java.util.List;

/**
 *
 * @author ricardo
 */
//Interface donde se indican las reglas a seguir para lograr la persistenciade datos.
public interface I_ArticuloRepository {
    
    /**
     * Método para guardar un artículo.
     * @param articulo Objeto de tipo Articulo a guardar.
     */
    void save(Articulo articulo);
    
    /**
     * Método para actualizar un artículo.
     * @param articulo Articulo a guardar con sus atributos actualizados.
     */
    void update(Articulo articulo);
    
    /**
     * Método para eliminar un artículo.
     * @param ariculo Artículo a eliminar.
     */
    void delete(Articulo ariculo);
    
    /**
     * Método que retorna una lista de Artículos.
     * @return Lista de objetos obtenida de una fuente de datos.
     */
    List<Articulo> getAll();
    
    /**
     * Método que retorna un artículo según el id.
     * @param id Id del artículo a obtener.
     * @return Artículo que concide con el id buscado.
     */
    Articulo getById(int id);
    
    /**
     * Método que retorna una lista de Artículos según el tipo de artículo.
     * @param tipo Valor del eunmerado TipoArticulo a buscar.
     * @return Lista con los artículos que coinciden con el tipo de artículo buscado.
     */
    List<Articulo> getLikeTipoArticulo(TipoArticulo tipo);
    
    /**
     * Método que busca por distribiudor.
     * @param distribuidor Valor a filtrar.
     * @return Lista con los artículos que son distribuidos por el valor buscado.
     */
    List<Articulo> getLikeDistribuidor(Distribuidor distribuidor);
    
    /**
     * Método que responde hay un artículo con el nro de id buscado.
     * @param id Valor de id a buscar.
     * @return True si se encontró un objeto con el valor de id buscado o false si no hubo coincidencia.
     */
    boolean getLikeValorEncontrado(int id);
}
