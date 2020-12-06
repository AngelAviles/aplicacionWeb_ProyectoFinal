<%-- 
    Document   : bienvenido
    Created on : 15/11/2020, 02:07:19 PM
    Author     : angel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    if (session.getAttribute("elUsuario") == null) {
        response.sendRedirect("login.jsp");
    }
    
    String usuario = (String) session.getAttribute("elUsuario");
    String tarea = (String) session.getAttribute("tarea");
    String error = (String) session.getAttribute("error");
    session.removeAttribute("error");
    String dato = (String) session.getAttribute("dato");
    session.removeAttribute("dato");
    
    if (tarea.equals("agregarCliente")) {
        tarea = "Agregar Cliente";
    } else if (tarea.equals("editarCliente")) {
        tarea = "Editar Cliente";
    } else if (tarea.equals("eliminarCliente")) {
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
        <header>Bienvenido a mi aplicacion web</header>
        <nav>
            <ul>
                <li><a href="clientes.jsp">Clientes</a></li>
                <li><a href="">Videojuegos</a></li>
                <li><a href="">Rentas</a></li>
                <li><a href="">Inventario</a></li>
            </ul>
        </nav>
        <article>
            <h1><%=error%></h1>
            <p>Dato ingresado: <%=dato%></p>
        </article>
        <footer>
            Derechos reservados
        </footer>
    </body>
</html>
