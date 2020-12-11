<%@page import="objetosNegocio.Videojuego"%>
<%@page import="objetosNegocio.Cliente"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    if (session.getAttribute("elUsuario") == null) {
        response.sendRedirect("login.jsp");
    }

    String usuario = (String) session.getAttribute("elUsuario");
    List lista = (List) session.getAttribute("listaVideojuegos");
    session.removeAttribute("listaVideojuegos");
%>

<!DOCTYPE html>
<html>
    <head>

        <title>Listado de Videojuegos - <%=usuario%></title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="estilos/estilos.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <header><a href="menu.jsp">Nuestra aplicacion web</a></header>
        <nav>
            <ul>
                <fieldset>
                    <li><a href="control?tarea=listarVideojuegos"  >Listar Videojuegos</a></li>
                    <li><a href="control?tarea=listarVideojuegosGenero"  >Listar Videojuegos por Genero</a></li>
                    <li><a href="control?tarea=agregarVideojuego"  >Agregar Videojuegos</a></li>
                    <li><a href="control?tarea=editarVideojuego" >Editar Videojuegos</a></li>
                    <li><a href="control?tarea=eliminarVideojuego" >Eliminar Videojuegos</a></li>
                </fieldset>
            </ul>
        </nav>
        <article>
            <h1>Lista de Videojuegos</h1>

            <table>
                <thead>
                <th>Num Catalogo</th>
                <th>Titulo</th>
                <th>Genero</th>
                <th>Clasificacion</th>
                <th>Consola</th>
                <th>Fabricante</th>
                <th>Version</th>
                </thead>
                <%
                    for (int i = 0; i < lista.size(); i++) {
                        Videojuego v = (Videojuego) lista.get(i);
                        out.print("<tr>"
                                + "<td>" + v.getNumCatalogo() + "</td>"
                                + "<td>" + v.getTitulo() + "</td>"
                                + "<td>" + v.getGenero() + "</td>"
                                + "<td>" + v.getClasificacion() + "</td>"
                                + "<td>" + v.getConsola() + "</td>"
                                + "<td>" + v.getFabricante() + "</td>"
                                + "<td>" + v.getVersion() + "</td>"
                                + "<tr>"
                        );
                    }

                %>
            </table>           
        </article>

    </body>
</html>
