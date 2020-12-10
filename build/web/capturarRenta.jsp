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
    List listaVideojuegos = (List) session.getAttribute("listaVideojuegos");
    session.removeAttribute("listaVideojuegos");
    List listaClientes = (List) session.getAttribute("listaClientes");
    session.removeAttribute("listaClientes");
    String tareaSelec = (String) session.getAttribute("tarea");

    String tarea = "";

    if (tareaSelec.equals("rentar")) {
        tarea = "Rentar";
    } else if (tareaSelec.equals("rentar")) {
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
        <nav>
            <ul>
                <fieldset>
                    <li><a href="control?tarea=rentar" >Rentar</a></li>
                    <li><a href="control?tarea=devolver" >Devolver</a></li>
                </fieldset>
            </ul>
        </nav>
        <article>
            <h1><%=tarea%></h1>

            <form action=<%=tareaSelec%>>

                <label for="cliente">Escoge un cliente que va a <%=tareaSelec%>: </label>
                <select id="cliente" name="cliente" required>
                    <%
                        for (int i = 0; i < listaClientes.size(); i++) {
                            Cliente c = (Cliente) listaClientes.get(i);
                            out.print("<option value=\"" + c.getNumCredencial() + "\">" + c.toString() + "</option>");
                        }
                    %>
                </select>

                <label for="videojuego">Escoge un videojuego para <%=tareaSelec%>: </label>
                <select id="videojuego" name="videojuego" required>
                    <%
                        for (int i = 0; i < listaVideojuegos.size(); i++) {
                            ArticuloED v = (ArticuloED) listaVideojuegos.get(i);
                            out.print("<option value=\"" + v.getArticulo().getNumCatalogo() + "\">" + v.toString() + "</option>");
                        }
                    %>
                </select>

                <label for="fecha">Fecha de renta: </label>
                <input type="date" id="fecha" name="fechaRenta"requiered>

                <label for="dias">Ingrese la cantidad de dias de renta: </label>
                <input id="dias" type="number" name="dias" value="0" step="1" requiered>

                <input type="submit" value=<%=tarea%> />
            </form>
        </article>

    </body>
</html>
