<%-- 
    Document   : AltaArticulo
    Created on : 09-dic-2020, 20:07:25
    Author     : ricardo
--%>

<%@page import="ar.com.articulos.java.jdbc.ArticuloRepository"%>
<%@page import="ar.com.articulos.java.interfaces.I_ArticuloRepository"%>
<%@page import="ar.com.articulos.java.entities.Articulo"%>
<%@page import="ar.com.articulos.java.enumerators.Distribuidor"%>
<%@page import="ar.com.articulos.java.enumerators.TipoArticulo"%>
<%@page import="ar.com.articulos.java.connectors.Conector"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% Connection conexion = new Conector().getConnection(); %>
<% I_ArticuloRepository ar = new ArticuloRepository(conexion); %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alta de articulo</title>
        <style>
            body { background-color: lightgreen; }
            h1,h2{ color: slateblue;}
        </style>
    </head>
    <body>
        <!--Página donde se intenta dar de alta un artículo en la base de datos.-->
        <h1>Resultado</h1>
        <%
            try {
                String nombre = request.getParameter("nombre");
                TipoArticulo tp = TipoArticulo.valueOf(request.getParameter("tipoArticulo"));
                Distribuidor dt = Distribuidor.valueOf(request.getParameter("distribuidor"));
                double precio = Double.parseDouble(request.getParameter("precio"));

                if (nombre != null && precio != 0) {
                    Articulo art = new Articulo(nombre, dt, tp, precio);
                    ar.save(art);
                    out.println("<h2>Se guardo el articulo con el id " + art.getId() + "</h2>");
                } else {
                    out.println("<h2>Debe ingresar datos.</h2>");
                }
            } catch (Exception e) {
                out.println("<h2>Los datos ingresados son incorrectos.</h2>");
            }
        %>
        
        <form action="PrincipalArticulos.jsp">
            <input type="submit" value="Volver"/>
        </form>
    </body>
</html>
