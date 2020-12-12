<%-- 
    Document   : TipoArticulo
    Created on : 09-dic-2020, 19:52:43
    Author     : ricardo
--%>

<%@page import="java.util.List"%>
<%@page import="ar.com.articulos.java.enumerators.TipoArticulo"%>
<%@page import="ar.com.articulos.java.entities.Articulo"%>
<%@page import="java.sql.Connection"%>
<%@page import="ar.com.articulos.java.jdbc.ArticuloRepository"%>
<%@page import="ar.com.articulos.java.interfaces.I_ArticuloRepository"%>
<%@page import="ar.com.articulos.java.connectors.Conector"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% Connection conexion = new Conector().getConnection(); %>
<% I_ArticuloRepository ar = new ArticuloRepository(conexion); %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Buscar por tipo de articulo</title>
        <style>
            form {margin-top: 10px;}
            body {background-color: lightgreen; }
            h1 {color: slateblue; }
        </style>
    </head>
    <body>
        <h1>Resultado de búsqueda</h1>
        <form>
            <table style="width: 600px; margin-left: auto; margin-right: auto; background-color: white; border-style: solid; border-color: black; text-align: center;">
                <tr>
                    <th>ID</th>
                    <th>NOMBRE</th>
                    <th>DISTRIBUIDOR</th>
                    <th>TIPO DE ARTICULO</th>
                    <th>PRECIO</th>
                </tr>

                <%
                    TipoArticulo tipo = TipoArticulo.valueOf(request.getParameter("tipoElegido"));
                    List<Articulo> listaPorTipo = ar.getLikeTipoArticulo(tipo);
                    for (Articulo item : listaPorTipo) {
                        out.println("<tr>");
                        out.print("<td>" + item.getId() + "</td>");
                        out.print("<td>" + item.getNombre() + "</td>");
                        out.print("<td>" + item.getDistribuidor() + "</td>");
                        out.print("<td>" + item.getTipoArticulo() + "</td>");
                        out.print("<td>" + item.getPrecio() + "</td>");
                        out.println("</tr>");
                    }
                %>
            </table>
        </form>
        <form action="PrincipalArticulos.jsp">
            <input type="submit" value="Volver"/>
        </form>
    </body>
</html>
