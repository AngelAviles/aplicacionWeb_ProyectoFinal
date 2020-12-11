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
        <title>Menu de Invantario - <%=usuario%></title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="estilos/estilos.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <header><a href="menu.jsp">Nuestra aplicacion web</a></header>
        <nav>
            <ul>
                <fieldset>
                    <li><a href="control?tarea=inventariar" >Inventariar</a></li>
                    <li><a href="control?tarea=desinventariar" >Desinventariar</a></li>
                </fieldset>
            </ul>
        </nav>
        <article>
            <h1>Menu de Inventario</h1>
            <p>Seleccione una opción de menu para administrar el inventario.</p>
        </article>

    </body>
</html>
