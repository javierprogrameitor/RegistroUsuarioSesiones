<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <html lang="es">
        <head>
            <%@include file="/INC/metas.inc"%>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <link href="<%= request.getContextPath()%>/CSS/estilo.css" rel="stylesheet" type="text/css">
            <title>Menu</title>
        </head>
        <body>
            <h2>Registro de Usuario con Sesiones</h2>
            <div>
                <form action="<%=request.getContextPath()%>/Controlador" method="post">
                    <button type="submit" <%= request.getSession().getAttribute("USU") != null ? "disabled" : ""%> name="button" value="Crear">CREAR</button>
                    <button type="submit" <%= request.getSession().getAttribute("USU") != null ? "disabled" : ""%> name="button" value="Modificar">MODIFICAR</button>
                    <button type="submit" <%= request.getSession().getAttribute("USU") == null ? "disabled" : ""%> name="button" value="Visualizar">VISUALIZAR</button>
                    <button type="submit" <%= request.getSession().getAttribute("USU") == null ? "disabled" : ""%> name="button" value="Eliminar">ELIMINAR</button>
            </div>
    </body>
</html>


