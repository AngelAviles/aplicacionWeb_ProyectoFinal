<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    if (session.getAttribute("elUsuario") == null) {
        response.sendRedirect("login.jsp");
    }
    
    String usuario = (String) session.getAttribute("elUsuario");
    String numCredencial = (String) session.getAttribute("numCredencial");
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
                <li><a href="control?tarea=agregarClientes">Agregar Clientes</a></li>
                <li><a href="control?tarea=editarClientes">Editar Clientes</a></li>
                <li><a href="control?tarea=eliminarClientes">Eliminar Clientes</a></li>
            </ul>
        </nav>
        <article>
            <form action="agregarCliente">
                <input type="text" name="cred" placeholder="Num. Credencial" value=<%=numCredencial%> readonly="readonly"/>
                <input type="text" name="nombre" placeholder="Nombre" />
                <input type="text" name="dir" placeholder="Dirección" />
                <input type="text" name="tel" placeholder="Telefono" />
                <input type="submit" value="Agregar Cliente" />
            </form>
        </article>
        <footer>
            Derechos Reservados
        </footer>
    </body>
</html>
