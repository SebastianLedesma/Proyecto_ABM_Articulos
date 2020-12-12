<%-- 
    Document   : ActualizarArticulo
    Created on : 09-dic-2020, 21:52:10
    Author     : ricardo
--%>

<%@page import="ar.com.articulos.java.enumerators.Distribuidor"%>
<%@page import="ar.com.articulos.java.enumerators.TipoArticulo"%>
<%@page import="ar.com.articulos.java.entities.Articulo"%>
<%@page import="ar.com.articulos.java.jdbc.ArticuloRepository"%>
<%@page import="ar.com.articulos.java.connectors.Conector"%>
<%@page import="java.sql.Connection"%>
<%@page import="ar.com.articulos.java.interfaces.I_ArticuloRepository"%>
<% Connection conexion = new Conector().getConnection(); %>
<% I_ArticuloRepository ar = new ArticuloRepository(conexion); %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Actualizar articulo</title>
        <style>
            body { background-color: lightgreen; }
            h1,h2 {color: slateblue;}
        </style>
    </head>
    <body>
    <!--Página que permite actualizar un registro de la base de datos. Se ingresan los datos a reemplazar.-->
        <h1>Resultado</h1>
        <form action="ArticuloActualizado.jsp" method="post">
            <table>
                <table>
                    <tr>
                        <td>Id:</td>
                        <td><input type="number" name="idActualizar" min="1" max="10000" autofocus /></td>
                    </tr>
                    <tr>
                        <td>Nombre:</td>
                        <td><input type="text" name="nombre" required/></td>
                    </tr>

                    <tr>
                        <td>Tipo de artículo:</td>
                        <td>
                            <select name="tipoArticulo">
                                <%for (TipoArticulo d : TipoArticulo.values()) {
                                        out.println("<option value=" + d + ">" + d + "</option>");
                                    }
                                %>
                            </select>
                        <td/>
                    </tr>

                    <tr>
                        <td>Distribuidor:</td>
                        <td>
                            <select name="distribuidor">
                                <%for (Distribuidor d : Distribuidor.values()) {
                                        out.println("<option value=" + d + ">" + d + "</option>");
                                    }
                                %>
                            </select>
                        <td/> 
                    </tr>

                    <tr>
                        <td>Precio:</td>
                        <td><input type="number" min="1" max="10000" name="precio" required/></td>
                    </tr>
                    <tr><td><input type="reset" value="Limpiar"/></td></tr>
                    <tr><td><input type="submit" value="Actualizar"/></td></tr>
                </table>
        </form>
        <form action="PrincipalArticulos.jsp">
            <input type="submit" value="Volver"/>
        </form>

    </body>
</html>
