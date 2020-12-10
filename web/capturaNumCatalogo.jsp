<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    if (session.getAttribute("elUsuario") == null) {
        response.sendRedirect("login.jsp");
    }

    String usuario = (String) session.getAttribute("elUsuario");

    String tareaSelec = (String) session.getAttribute("tarea");
    String tarea = "";

    if (tareaSelec.equals("agregarVideojuego")) {
        tarea = "Agregar Videojuego";

    } else if (tareaSelec.equals("editarVideojuego")) {
        tarea = "Editar Videojuego";

    } else if (tareaSelec.equals("eliminarVideojuego")) {
        tarea = "Eliminar Videojuego";
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
                    <li><a href="control?tarea=listarVideojuegos" >Listar Videojuegos</a></li>
                    <li><a href="control?tarea=agregarVideojuego" >Agregar Videojuegos</a></li>
                    <li><a href="control?tarea=editarVideojuego" >Editar Videojuegos</a></li>
                    <li><a href="control?tarea=eliminarVideojuego" >Eliminar Videojuegos</a></li>
                </fieldset>
            </ul>
        </nav>
        <article>
            <h1><%=tarea%></h1>

            <form action="obtenVideojuego">
                <input type="text" name="numCatalogo" placeholder="Num. Catalogo" required/>

                <input type="submit" value="Comprobar" />
            </form>
        </article>

    </body>
</html>
