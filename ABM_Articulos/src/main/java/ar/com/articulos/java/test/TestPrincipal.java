package ar.com.articulos.java.test;

import ar.com.articulos.java.connectors.Conector;
import ar.com.articulos.java.entities.Articulo;
import ar.com.articulos.java.enumerators.Distribuidor;
import ar.com.articulos.java.enumerators.TipoArticulo;
import ar.com.articulos.java.interfaces.I_ArticuloRepository;
import ar.com.articulos.java.jdbc.ArticuloRepository;
import java.sql.Connection;

/**
 *
 * @author ricardo
 */
//Clase pricipal que testea los métodos para acceder a la base de datos para después
//ser usados en la creación de un proyecto web.
public class TestPrincipal {

    public static void main(String[] args) {
 
        try (Connection conn = new Conector().getConnection();) {
            I_ArticuloRepository ar = new ArticuloRepository(conn);

            /*
            //Alta de un articulo
            Articulo articulo = new Articulo("Secador baño",
                    Distribuidor.CapDistribuidor,
                    TipoArticulo.Limpieza,
                    130);
            
            System.out.println(articulo);
            
            ar.save(articulo);
            */
            
            /*
            //Eliminar un articulo
            ar.delete(ar.getById(1));
            */
            
            /*
            //Actualizar un articulo
            Articulo artAux = ar.getById(4);
            artAux.setNombre("Manaos Tónica");
            artAux.setDistribuidor(Distribuidor.MarquezDistribuidor);
            artAux.setPrecio(70);
            ar.update(artAux);
            */
            
            /*
            //Busqueda por filtro.
            ar.getLikeTipoArticulo(TipoArticulo.Lacteos).forEach(System.out::println);
            */
            
            /*
            //Select de los articulos.
            ar.getAll().forEach(System.out::println);
            */
            
            /*
            //Buscar por id
            if (ar.getLikeValorEncontrado(2)) {
                System.out.println("Hay un articulo con ese id.");
            }else{
                System.out.println("No se encontro coincidencia.");
            }
            */
            System.out.println("-----------------------------------");
            /*
            //Busqueda por filtro.
            ar.getLikeDistribuidor(Distribuidor.CapDistribuidor).forEach(System.out::println);
            */
        } catch (Exception e) {
            e.printStackTrace();
        }
        
    }
}
