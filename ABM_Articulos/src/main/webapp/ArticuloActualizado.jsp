<%-- 
    Document   : ArticuloActualizado
    Created on : 10-dic-2020, 23:08:55
    Author     : ricardo
--%>

<%@page import="ar.com.articulos.java.enumerators.Distribuidor"%>
<%@page import="ar.com.articulos.java.enumerators.TipoArticulo"%>
<%@page import="ar.com.articulos.java.entities.Articulo"%>
<%@page import="ar.com.articulos.java.jdbc.ArticuloRepository"%>
<%@page import="ar.com.articulos.java.interfaces.I_ArticuloRepository"%>
<%@page import="ar.com.articulos.java.connectors.Conector"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Articulo actualizado</title>
        <style>
            body { background-color: lightgreen; }
            h1,h2 {color: slateblue;}
        </style>
    </head>
    <body>
        <!--Página donde se intenta actualizar los datos del artículo ingresado en la página ActualizarArticulo.jsp.-->
        <h1>Resultado</h1>

        <%
            I_ArticuloRepository ar;
            try (Connection conexion = new Conector().getConnection()) {
                ar = new ArticuloRepository(conexion);
                
                if (ar.getLikeValorEncontrado(Integer.parseInt(request.getParameter("idActualizar")))) {
                    
                    Articulo artAuxiliar = ar.getById(Integer.parseInt(request.getParameter("idActualizar")));
                    artAuxiliar.setNombre(request.getParameter("nombre"));
                    artAuxiliar.setTipoArticulo(TipoArticulo.valueOf(request.getParameter("tipoArticulo")));
                    artAuxiliar.setDistribuidor(Distribuidor.valueOf(request.getParameter("distribuidor")));
                    artAuxiliar.setPrecio(Double.parseDouble(request.getParameter("precio")));
                    ar.update(artAuxiliar);

                    out.println("<h2>Se actualizo el articulo con el id " + artAuxiliar.getId() + "</h2>");
                }else{
                    out.println("<h2>El id ingresado no se encontro.</h2>");
                }
            } catch (Exception e) {
                out.println("<h2>No se pudo realiar la operación.</h2>");
            }
        %>

        <form action="PrincipalArticulos.jsp">
            <input type="submit" value="Volver"/>
        </form>
    </body>
</html>
