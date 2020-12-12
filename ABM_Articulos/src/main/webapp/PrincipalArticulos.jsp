<%-- 
    Document   : PrincipalArticulos
    Created on : 08-dic-2020, 23:56:59
    Author     : ricardo
--%>

<%@page import="ar.com.articulos.java.entities.Articulo"%>
<%@page import="java.sql.Connection"%>
<%@page import="ar.com.articulos.java.connectors.Conector"%>
<%@page import="ar.com.articulos.java.jdbc.ArticuloRepository"%>
<%@page import="ar.com.articulos.java.interfaces.I_ArticuloRepository"%>
<%@page import="ar.com.articulos.java.enumerators.Distribuidor"%>
<%@page import="ar.com.articulos.java.enumerators.TipoArticulo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% Connection conexion = new Conector().getConnection(); %>
<% I_ArticuloRepository ar = new ArticuloRepository(conexion); %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Articulos</title>
        <style>
            form {margin-top: 10px;}
            body {background-color: lightgreen; }
            h1 {color: slateblue; }
        </style>
    </head>
    <body>
        <!--Página desde donde se puede dar de alta un artículo,eliminar,actualizar y filtrar por atributos.-->
        <h1>Artículos</h1>

        <form action="AltaArticulo.jsp" method="post">
            <table>
                <tr>
                    <td>Nombre:</td>
                    <td><input type="text" name="nombre" required autofocus /></td>
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
                <tr><td><input type="reset" value="Limpiar"/></td>
                    <td><input type="submit" value="Guardar"/></td></tr>
            </table>
        </form>


        <form action="DistribuidorArticulo.jsp">
            Buscar por distribuidor:
            <select name="distribuidorElegido">
                <%for (Distribuidor d : Distribuidor.values()) {
                        out.println("<option value=" + d + ">" + d + "</option>");
                    }
                %>
            </select>
            <input type="submit" value="Buscar"/>
        </form>

        <form action="TipoArticulo.jsp">
            Buscar por tipo de artículo:
            <select name="tipoElegido">
                <%for (TipoArticulo d : TipoArticulo.values()) {
                        out.println("<option value=" + d + ">" + d + "</option>");
                    }
                %>
            </select>
            <input type="submit" value="Buscar"/>
        </form>

        <form action="EliminarArticulo.jsp">
            Eliminar por id:
            <input type="number" min="1" max="10000" name="eliminarPorId" />
            <input type="submit" value="Eliminar"/>
        </form>

        <form action="ActualizarArticulo.jsp">
            Actualizar por id:
            <!--<input type="number" min="1" max="10000" name="actualizarPorId"/>-->
            <input type="submit" value="Actualizar"/>
        </form>


        <form>
            <table style="width: 700px; margin-left: auto; margin-right: auto; background-color: white; border-style: solid; border-color: black; text-align: center;" >
                <tr>
                    <th>ID</th>
                    <th>NOMBRE</th>
                    <th>DISTRIBUIDOR</th>
                    <th>TIPO DE ARTICULO</th>
                    <th>PRECIO</th>
                </tr>

                <%
                    for (Articulo item : ar.getAll()) {
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
    </body>
</html>
