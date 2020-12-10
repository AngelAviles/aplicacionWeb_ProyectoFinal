<%@page import="objetosNegocio.Videojuego"%>
<%@page import="objetosNegocio.Cliente"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    if (session.getAttribute("elUsuario") == null) {
        response.sendRedirect("login.jsp");
    }

    String tareaSelec = (String) session.getAttribute("tarea");
    String tarea = "";
    if (tareaSelec.equals("agregarVideojuego")) {
        tarea = "Agregar Videojuego";
    } else if (tareaSelec.equals("eliminarVideojuego")) {
        tarea = "Eliminar Videojuego";
    }

    String usuario = (String) session.getAttribute("elUsuario");
    Videojuego videojuego = (Videojuego) session.getAttribute("videojuego");
    session.removeAttribute("videojuego");
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

        <nav>
            <ul>
                <fieldset>
                    <li><a href="control?tarea=listarVideojuegos" >Listar Videojuegos</a></li>
                    <li><a href="control?tarea=agregarVideojuego" >Agregar Videojuegos</a></li>
                    <li><a href="control?tarea=editarVideojuego" >Editar Videojuegos</a></li>
                    <li><a href="control?tarea=eliminarVideojuego">Eliminar Videojuegso</a></li>
                </fieldset>
            </ul>
        </nav>
        <article>
            <h1><% if (tareaSelec.equalsIgnoreCase("agregarVideojuego")) {
                    out.print("El videojuego ya existe");
                } else {
                    out.print(tarea);
                }%></h1>

            <p>La siguiente información, le pertenece al videojuego con el numero de catalogo <%=videojuego.getNumCatalogo()%>:</p>

            <table>
                <thead>
                <th>Numero Catalogo</th>
                <th>Titulo</th>
                <th>Genero</th>
                <th>Clasificacion</th>
                <th>Consola</th>
                <th>Fabricante</th>
                <th>Version</th>
                </thead>
                <%
                    out.print("<tr>"
                            + "<td>" + videojuego.getNumCatalogo() + "</td>"
                            + "<td>" + videojuego.getTitulo() + "</td>"
                            + "<td>" + videojuego.getGenero() + "</td>"
                            + "<td>" + videojuego.getClasificacion() + "</td>"
                            + "<td>" + videojuego.getConsola() + "</td>"
                            + "<td>" + videojuego.getFabricante() + "</td>"
                            + "<td>" + videojuego.getVersion() + "</td>"
                            + "<tr>"
                    );
                %>
            </table>  
            <%
                if (tareaSelec.equalsIgnoreCase("eliminarVideojuego")) {
                    session.setAttribute("videojuego", videojuego);
                    out.print("<p>¿Deseas eliminar este videojuego?</p>"
                            + "<form action=\"eliminarVideojuego\" >"
                            + "<input type=\"submit\" value=\"Eliminar Videojuego\" />"
                            + "</form>"
                    );
                }
            %>
        </article>

    </body>
</html>
