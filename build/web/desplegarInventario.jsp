<%@page import="objetosNegocio.ArticuloED"%>
<%@page import="objetosNegocio.Cliente"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    if (session.getAttribute("elUsuario") == null) {
        response.sendRedirect("login.jsp");
    }

    String tareaSelec = (String) session.getAttribute("tarea");

    String tarea = "";

    if (tareaSelec.equals("inventariar")) {
        tarea = "Inventariar";
    } else if (tareaSelec.equals("desinventariar")) {
        tarea = "Desinventariar";
    }

    String usuario = (String) session.getAttribute("elUsuario");
    List listaInventario = (List) session.getAttribute("listaInventario");
    session.removeAttribute("listaInventario");
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
                    <li><a href="control?tarea=inventariar" >Inventariar</a></li>
                    <li><a href="control?tarea=desinventariar" >Desinventariar</a></li>
                </fieldset>
            </ul>
        </nav>
        <article>
            <h1>Inventario</h1>

            <table>
                <thead>
                <th>Num. Catalogo</th>
                <th>En existencia</th>
                <th>Disponibles</th>
                </thead>
                <%
                    for (int i = 0; i < listaInventario.size(); i++) {
                        ArticuloED a = (ArticuloED) listaInventario.get(i);
                        out.print("<tr>"
                                + "<td>" + a.getArticulo().getNumCatalogo() + "</td>"
                                + "<td>" + a.getExistencia() + "</td>"
                                + "<td>" + a.getDisponibilidad() + "</td>"
                                + "<tr>"
                        );
                    }
                %>
            </table>           
        </article>

    </body>
</html>
