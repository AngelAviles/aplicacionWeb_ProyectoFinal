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
        <title>Menu de Clientes - <%=usuario%></title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="estilos/estilos.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <header>Menu de Clientes</header>
        <nav>
            <ul>
                <li><a href="control?tarea=listarClientes">Listar Clientes</a></li>
                <li><a href="control?tarea=agregarCliente">Agregar Clientes</a></li>
                <li><a href="control?tarea=editarCliente">Editar Clientes</a></li>
                <li><a href="control?tarea=eliminarCliente">Eliminar Clientes</a></li>
            </ul>
        </nav>
        <article>
            <h1>Contenido Principal</h1>
            Seleccione una opción de menu para administrar los clientes.
        </article>
        <footer>
            Derechos Reservados
        </footer>
    </body>
</html>
