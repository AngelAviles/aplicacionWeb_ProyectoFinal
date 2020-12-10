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

    if (tareaSelec.equals("inventarear")) {
        tarea = "Inventarear";
    } else if (tareaSelec.equals("desinventarear")) {
        tarea = "Desinventarear";
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
                    <li><a href="control?tarea=inventarear" >Inventarear</a></li>
                    <li><a href="control?tarea=desinventarear" >Desinventarear</a></li>
                </fieldset>
            </ul>
        </nav>
        <article>
            <h1><%=tarea%></h1>

            <form action=<%=tareaSelec%>>
                <label for="videojuego">Escoge un videojuego para <%=tareaSelec%>:</label>
                <select id="videojuego" name="videojuego" required>
                    <%
                        for (int i = 0; i < listaVideojuegos.size(); i++) {
                            Videojuego v = (Videojuego) listaVideojuegos.get(i);
                            out.print("<option value=\"" + v.getNumCatalogo() + "\">" + v.toString() + "</option>");
                        }
                    %>
                </select>

                <label for="cantidad">Ingrese la cantidad ha <%=tareaSelec%>: </label>
                <input id="cantidad" type="number" name="cantidad" value="0" step="1" requiered>

                <input type="submit" value=<%=tarea%> />
            </form>
        </article>

    </body>
</html>
