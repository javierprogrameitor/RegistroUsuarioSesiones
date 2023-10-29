<%--
Primera vista 'Crear el registro
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="es.albarregas.beans.Usuario"%>
<%
    Usuario usu = (Usuario) request.getSession().getAttribute("USU");
    String fecha = "";
      
    if(usu != null){    
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    fecha = sdf.format(usu.getFecha());
    }

%>

<!DOCTYPE html>
<html>
    <head>
        <%@include file="/INC/metas.inc"%>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="<%= request.getContextPath()%>/CSS/estilo.css" rel="stylesheet" type="text/css">
        <title>Pagina de Crear</title>
    </head>
    <body>
        <h2><%= request.getSession().getAttribute("USU") != null ? "Modificar Atributo de Sesión" : "Crear Atributo de Sesión"%></h2>
        <h3>Todos los campos son necesarios para crear un usuario</h3>

        <form method="post" action= "<%=request.getContextPath()%>/ControlesDatos">
            <label for="id">Id: </label>
            <input type=number name="id" value="<%= request.getSession().getAttribute("USU") != null ? usu.getId() : ""%>">
            <br>
            <label for="nombre">Nombre: </label>
            <input type="text" name="nombre" id="nombre" value="<%= request.getSession().getAttribute("USU") != null ? usu.getNombre() : ""%>"     >
            <br>
            <label for="fecha">Fecha: </label>
            <input type="date" name="fecha" id="fecha" value="<%= request.getSession().getAttribute("USU") != null ? fecha : ""%>">
            <br>
            <label for="tipo">Tipo: </label>
            <select name="tipo">
                <option value="DNI" <%= Usuario.document.DNI %> >DNI</option>
                <option value="NIF" <%= Usuario.document.NIE %>>NIF</option>
                <option value="PASAPORTE" <%= Usuario.document.PASAPORTE %>>PASAPORTE</option>
            </select>
            <br>
            <label for="num">Número: </label>
            <input type="text" name="num" id="num" value="<%= request.getSession().getAttribute("USU") != null ? usu.getIdentificador() : ""%>">
            <br>
            <input class="botones" type="submit" name="button" value="<%= request.getSession().getAttribute("USU") != null ? "Modificar" : "Crear"%>">
            <input class = "botones" type="submit" value="Cancelar" name="button"/>
        </form>


    </body>
</html>
