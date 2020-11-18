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
%>

<!DOCTYPE html>
<html>
    <head>
        <title>Menu principal - <%=usuario%></title>
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
            <h1>Contenido Principal</h1>
            Ocurrio un error... favor de verificar...
        </article>
        <footer>
            Derechos reservados
        </footer>
    </body>
</html>
