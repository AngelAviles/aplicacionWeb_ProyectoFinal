<%@page import="objetosNegocio.ArticuloED"%>
<%@page import="objetosNegocio.Cliente"%>
<%@page import="objetosServicio.Fecha"%>
<%@page import="objetosServicio.Periodo"%>
<%@page import="objetosNegocio.Articulo"%>
<%@page import="objetosNegocio.Renta"%>
<%@page import="objetosNegocio.Videojuego"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    if (session.getAttribute("elUsuario") == null) {
        response.sendRedirect("login.jsp");
    }

    String usuario = (String) session.getAttribute("elUsuario");
    String tareaSelec = (String) session.getAttribute("tarea");

    String tarea = "";

    if (tareaSelec.equals("rentar")) {
        tarea = "Rentar";
    } else if (tareaSelec.equals("devolver")) {
        tarea = "Devolver";
    }
%>

<!DOCTYPE html>
<html>
    <head>

        <title><%=tarea%> - <%=usuario%></title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="estilos/estilos.css" rel="stylesheet" type="text/css"/>

    </head>
    <body>
        <header><a href="menu.jsp">Nuestra aplicacion web</a></header>
        <fieldset>
            <nav>
                <ul>
                    <fieldset>
                        <li><a href="control?tarea=rentar" >Rentar</a></li>
                        <li><a href="control?tarea=devolver" >Devolver</a></li>
                    </fieldset>
                </ul>
            </nav>
        </fieldset>
        <article>
            <h1>Seleccione un metodo de busqueda para encontrar una renta</h1>

            <form action="obtenRentas">

                <label for="cliente">Por num. Credencial: </label>
                <input id="cliente" type="text" name="cliente" />

                <label for="videojuego">Por num. Catalogo: </label>
                <input id="videojuego" type="text" name="videojuego" />

                <p>Por periodo: </p>

                <label for="desde">Desde: </label>
                <input type="date" id="desde" name="desde" >

                <label for="hasta">Hasta: </label>
                <input type="date" id="hasta" name="hasta" >

                <input type="submit" value=<%=tarea%> />
            </form>
        </article>

    </body>
</html>
