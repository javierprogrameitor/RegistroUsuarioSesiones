<%@page import="java.text.SimpleDateFormat"%>
<%@page import="es.albarregas.beans.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    Usuario usu = (Usuario) request.getSession().getAttribute("USU");

    SimpleDateFormat sf = new SimpleDateFormat("dd/MM/yyyy");
    String fecha = sf.format(usu.getFecha());
%>

<!DOCTYPE html>
<html>
     <head>
        <%@include file="/INC/metas.inc"%>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="<%= request.getContextPath() %>/CSS/estilo.css" rel="stylesheet" type="text/css">
        <title>Visualizar</title>
    </head>
    <body>
        <h2>Visualizar Atributo de Sesión</h2>
        <table>
            <tr>
                <td>Id: </td>
                <td><%= usu.getId() %></td>
            </tr>
            <tr>
                <td>Nombre: </td>
                <td><%= usu.getNombre() %></td>
            </tr>
            <tr>
                <td>Fecha: </td>
                <td><%= fecha %></td>
            </tr>
            <tr>
                <td>Tipo de identificación: </td>
                <td><%= usu.getIdentificador() %></td>
            </tr>
            <tr>
                <td>Identificación: </td>
                <td><%= usu.getTipo() %></td>
            </tr>
        </table>
        <form method="post" action= "<%=request.getContextPath() %>/ControlesDatos">
            <input class = "botones" type="submit" value="Cancelar" name="button"/>
        </form>
    </body>
</html>
