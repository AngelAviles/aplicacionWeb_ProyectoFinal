<%@page import="objetosNegocio.ArticuloED"%>
<%@page import="objetosNegocio.Renta"%>
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

    List listaRentas = (List) session.getAttribute("videojuegoRentas");
    session.removeAttribute("videojuegoRentas");

    ArticuloED articulo = (ArticuloED) session.getAttribute("articulo");
    session.removeAttribute("articulo");
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
                    <li><a href="control?tarea=listarVideojuegos"  >Listar Videojuegos</a></li>
                    <li><a href="control?tarea=listarVideojuegosGenero"  >Listar Videojuegos por Genero</a></li>
                    <li><a href="control?tarea=agregarVideojuego"  >Agregar Videojuegos</a></li>
                    <li><a href="control?tarea=editarVideojuego" >Editar Videojuegos</a></li>
                    <li><a href="control?tarea=eliminarVideojuego" >Eliminar Videojuegos</a></li>
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

                    if (listaRentas.size() == 0 && articulo == null) {
                        session.setAttribute("videojuego", videojuego);
                        out.print("<p>¿Deseas eliminar este videojuego?</p>"
                                + "<form action=\"eliminarVideojuego\" >"
                                + "<input type=\"submit\" value=\"Eliminar Videojuego\" />"
                                + "</form>"
                        );
                    } else { %>

            <p>NO SE PUEDE ELIMINAR ESTE VIDEOJUEGO PORQUE ESTA EN UNA RENTA O EN EL INVENTARIO</p>
            <%
                if (listaRentas.size() != 0) {

            %>
            <h1>Rentas Encontradas</h1>

            <table>
                <thead>
                <th>Num. Credencial</th>
                <th>Num. Catalogo</th>
                <th>Fecha de renta</th>
                <th>Dias de renta</th>
                </thead>
                <%                    for (int i = 0; i < listaRentas.size(); i++) {
                        Renta r = (Renta) listaRentas.get(i);
                %>
                <tr>
                    <td><%=r.getCliente().getNumCredencial()%></td>
                    <td><%=r.getArticulo().getNumCatalogo()%></td>
                    <td><%=r.getFechaRenta().toDateString()%></td>
                    <td><%=r.getTiempoRenta()%></td>
                </tr>            
                <%
                        }
                    }
                %>
            </table>
            <% }
                if (articulo != null) {
            %>
            <h1>Inventario del videojuego</h1>

            <table>
                <thead>
                <th>Num. Catalogo</th>
                <th>En existencia</th>
                <th>Disponibles</th>
                </thead>
                <%
                    out.print("<tr>"
                            + "<td>" + articulo.getArticulo().getNumCatalogo() + "</td>"
                            + "<td>" + articulo.getExistencia() + "</td>"
                            + "<td>" + articulo.getDisponibilidad() + "</td>"
                            + "</tr>"
                    );
                %>
            </table>           
            <%
                    }
                }
            %>

        </article>

    </body>
</html>
