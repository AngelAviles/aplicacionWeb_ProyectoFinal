<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    if (session.getAttribute("elUsuario") == null) {
        response.sendRedirect("login.jsp");
    }

    String usuario = (String) session.getAttribute("elUsuario");

    String tareaSelec = (String) session.getAttribute("tarea");
    String tarea = "";    

    if (tareaSelec.equals("agregarCliente")) {
        tarea = "Agregar Cliente";
    } else if (tareaSelec.equals("editarCliente")) {
        tarea = "Editar Cliente";
    } else if (tareaSelec.equals("eliminarCliente")) {
        tarea = "Eliminar Cliente";
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
                <li><a href="control?tarea=listarClientes">Listar Clientes</a></li>
                <li><a href="control?tarea=agregarCliente">Agregar Clientes</a></li>
                <li><a href="control?tarea=editarCliente">Editar Clientes</a></li>
                <li><a href="control?tarea=eliminarCliente">Eliminar Clientes</a></li>
            </ul>
        </nav>
        <article>
            <form action="obtenCliente">
                <input type="text" name="cred" placeholder="Num. Credencial" />

                <input type="submit" value="Comprobar" />
            </form>
        </article>
        <footer>
            <p>Derechos Reservados</p>
        </footer>
    </body>
</html>
