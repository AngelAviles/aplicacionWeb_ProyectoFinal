<%@page import="objetosNegocio.Articulo"%>
<%@page import="objetosNegocio.ArticuloED"%>
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
    String tareaSelec = (String) session.getAttribute("tarea");

    String tarea = "";

    if (tareaSelec.equalsIgnoreCase("inventariar")) {
        tarea = "Inventariar";
    } else if (tareaSelec.equalsIgnoreCase("desinventariar")) {
        tarea = "Desinventariar";
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
                    <li><a href="control?tarea=inventariar" >Inventariar</a></li>
                    <li><a href="control?tarea=desinventariar" >Desinventariar</a></li>
                </fieldset>
            </ul>
        </nav>
        <article>
            <h1><%=tarea%></h1>

            <form action="<%=tareaSelec%>" <% if (tareaSelec.equalsIgnoreCase("desinventariar")) {%>  onsubmit="return validar()" <% }%>>
                <label for="videojuego">Escoge un videojuego para <%=tareaSelec%>:</label>
                <select id="videojuego" name="videojuego" required>
                    <%
                        for (int i = 0; i < listaVideojuegos.size(); i++) {
                            ArticuloED v = null;

                            if (tareaSelec.equalsIgnoreCase("inventariar")) {
                                v = new ArticuloED((Videojuego) listaVideojuegos.get(i));
                            } else if (tareaSelec.equalsIgnoreCase("desinventariar")) {
                                v = (ArticuloED) listaVideojuegos.get(i);
                            }

                            out.print("<option value=\"" + v.getArticulo().getNumCatalogo() + "\" >" + v.getArticulo().getNumCatalogo() + " (" + v.getArticulo().getTitulo() + ")" + "</option>");
                        }
                    %>
                </select>
                <%
                    if (tareaSelec.equalsIgnoreCase("desinventariar")) {
                        for (int i = 0; i < listaVideojuegos.size(); i++) {
                            ArticuloED v = null;

                            v = (ArticuloED) listaVideojuegos.get(i);

                            out.print("<input type=\"hidden\" id=\"" + v.getArticulo().getNumCatalogo() + "\" value=" + v.getDisponibilidad() + ">");
                        }
                    }
                %>

                <label for="cantidad">Ingrese la cantidad ha <%=tareaSelec%>: </label>
                <input id="cantidad" type="number" name="cantidad" value="0" step="1" requiered>

                <input type="submit" value="<%=tarea%>" />
            </form>
        </article>
        <script src="validacionDesinventariar.js"></script>
    </body>
</html>
