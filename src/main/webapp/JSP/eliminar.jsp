<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="/INC/metas.inc"%>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="<%= request.getContextPath() %>/CSS/estilo.css" rel="stylesheet" type="text/css">
        <title>Eliminar</title>
    </head>
    <body>
        <h2>Eliminar Atributo de Sesion</h2>
        <h3>¿Estás seguro que quieres eliminar el atributo de sesión?</h3>
        <form method="post" action= "<%=request.getContextPath() %>/ControlesDatos">
            <input class="botones" type="submit" value="Eliminar" name="button"/>
            <input class="botones" type="submit" value="Cancelar" name="button"/>
        </form>
    </body>
</html>
