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
        <title>Agregar Cliente - <%=usuario%></title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="estilos/estilos.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <header>Agregar Cliente</header>
        <nav>
            <ul>
                <li><a href="control?tarea=listarClientes">Listar Clientes</a></li>
                <li><a href="control?tarea=agregarClientes">Agregar Clientes</a></li>
                <li><a href="control?tarea=editarClientes">Editar Clientes</a></li>
                <li><a href="control?tarea=eliminarClientes">Eliminar Clientes</a></li>
            </ul>
        </nav>
        <article>
            <form action="obtenCliente">
                <input type="text" name="cred" placeholder="Num. Credencial" />
                
                <input type="submit" value="Comprobar" />
            </form>
        </article>
        <footer>
            Derechos Reservados
        </footer>
    </body>
</html>
