<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    if (session.getAttribute("elUsuario") == null) {
        response.sendRedirect("login.jsp");
    }

    String usuario = (String) session.getAttribute("elUsuario");
%>

<!DOCTYPE html>
<html>
    <head>
        <title>Menu de Rentas - <%=usuario%></title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="estilos/estilos.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <header><a href="menu.jsp">Nuestra aplicacion web</a></header>
        <nav>
            <ul>
                <fieldset>
                    <li><a href="control?tarea=rentar" >Rentar</a></li>
                    <li><a href="control?tarea=devolver" >Devolver</a></li>
                </fieldset>
            </ul>
        </nav>
        <article>
            <h1>Menu de Rentas</h1>
            <p>Seleccione una opción de menu para administrar las rentas.</p>
        </article>

    </body>
</html>
