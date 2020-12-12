<%-- 
    Document   : EliminarArticulo
    Created on : 09-dic-2020, 20:27:55
    Author     : ricardo
--%>

<%@page import="ar.com.articulos.java.jdbc.ArticuloRepository"%>
<%@page import="ar.com.articulos.java.interfaces.I_ArticuloRepository"%>
<%@page import="ar.com.articulos.java.connectors.Conector"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Elimnar articulo</title>
        <style>
            body { background-color: lightgreen; }
            h1,h2 {color: slateblue;}
        </style>
    </head>
    <body>
        <!--Página donde se intenta eliminar un artículo.-->
        <h1>Resultado</h1>
        
        <%
            I_ArticuloRepository ar;
            try (Connection conexion = new Conector().getConnection()){
                int idIngresado = Integer.parseInt(request.getParameter("eliminarPorId"));
                ar = new ArticuloRepository(conexion);
                
                if (ar.getLikeValorEncontrado(idIngresado)) {
                    ar.delete(ar.getById(idIngresado));
                    out.println("<h2>Se eliminó el artículo con el id "+idIngresado+".</h2>");
                }else{
                    out.println("<h2>No se encotró el id ingresado..</h2>");
                }
                } catch (Exception e) {
                    out.println("<h2>No se pudo realizar la operación.</h2>");
                }
            
        %>
        
        <form action="PrincipalArticulos.jsp">
            <input type="submit" value="Volver"/>
        </form>
    </body>
</html>
