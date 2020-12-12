package ar.com.articulos.java.connectors;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author ricardo
 */
//Clase que premite crear un objeto para conectarse a una base de datos.
public class Conector {

    //Atributos para establecer una conexión con mysql.
    private String driver = "com.mysql.cj.jdbc.Driver";
    private String server = "localhost";
    private String vendor = "mysql";
    private String user = "root";
    private String pass = "";
    private String port = "3306";
    private String base = "negocio";
    private String param = "?serverTimezone=UTC";
    private String url = "jdbc:" + vendor + "://" + server + ":" + port + "/" + base + param;
    private Connection conexion = null;

    /**
     * Método que obtiene o retorna una conexión a base de datos.
     * @return Conexión a base de datos.
     */
    public Connection getConnection() {
        try {
            if (this.conexion == null || this.conexion.isClosed()) {
               Class.forName(driver);
               conexion=DriverManager.getConnection(url, user, pass);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return conexion;
    }

}
