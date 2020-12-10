<%@page import="objetosNegocio.Renta"%>
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

    if (tareaSelec.equals("rentar")) {
        tarea = "Rentar";
    } else if (tareaSelec.equals("devolver")) {
        tarea = "Devolver";
    }

    String usuario = (String) session.getAttribute("elUsuario");
    List listaRentas = (List) session.getAttribute("listaRentas");
    session.removeAttribute("listaRentas");
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

                    <li><a href="control?tarea=rentar" >Rentar</a></li>
                    <li><a href="control?tarea=devolver" >Devolver</a></li>
                </fieldset>
            </ul>
        </nav>
        <article>
            <h1>Rentas Encontradas</h1>

            <table>
                <thead>
                <th>Num. Credencial</th>
                <th>Num. Catalogo</th>
                <th>Fecha de renta</th>
                <th>Dias de renta</th>
                <th>ACCION</th>
                </thead>
                <%
                    for (int i = 0; i < listaRentas.size(); i++) {
                        Renta r = (Renta) listaRentas.get(i);
                %>
                <tr>
                    <td><%=r.getCliente().getNumCredencial()%></td>
                    <td><%=r.getArticulo().getNumCatalogo()%></td>
                    <td><%=r.getFechaRenta().toDateString()%></td>
                    <td><%=r.getTiempoRenta()%></td>
                    <td>
                        <form action="devolver">
                            <input type="hidden" name="cliente" value=<%=r.getCliente().getNumCredencial()%>>
                            <input type="hidden" name="articulo" value=<%=r.getArticulo().getNumCatalogo()%>>
                            <input type="hidden" name="fecha" value=<%=r.getFechaRenta().toDateString()%>>
                            <input type="hidden" name="tiempoRenta" value=<%=r.getTiempoRenta()%>>
                            <input type="submit" name="submit" value="Devolver">
                        </form>
                    </td>
                <tr>
                    <%
                        }
                    %>
            </table>           
        </article>

    </body>
</html>
