<%@page import="objetosNegocio.Cliente"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    if (session.getAttribute("elUsuario") == null) {
        response.sendRedirect("login.jsp");
    }

    String usuario = (String) session.getAttribute("elUsuario");
    Cliente cliente = (Cliente) session.getAttribute("cliente");
%>

<!DOCTYPE html>
<html>
    <head>
        <title>El cliente ya existe - <%=usuario%></title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="estilos/estilos.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <header>El cliente ya existe</header>
        <nav>
            <ul>
                <li><a href="control?tarea=listarClientes">Listar Clientes</a></li>
                <li><a href="control?tarea=agregarClientes">Agregar Clientes</a></li>
                <li><a href="control?tarea=editarClientes">Editar Clientes</a></li>
                <li><a href="control?tarea=eliminarClientes">Eliminar Clientes</a></li>
            </ul>
        </nav>
        <article>
            <h1>El cliente ya existe</h1>
            
            <p>La siguiente información, le pertenece al cliente con el numero de credencial <%=cliente.getNumCredencial()%>:</p>

            <table>
                <thead>
                <th>Credencial</th>
                <th>Nombre</th>
                <th>Telefono</th>
                <th>Direccion</th>
                </thead>
                <%
                    out.print("<tr>"
                            + "<td>" + cliente.getNumCredencial() + "</td>"
                            + "<td>" + cliente.getNombre() + "</td>"
                            + "<td>" + cliente.getTelefono() + "</td>"
                            + "<td>" + cliente.getDireccion() + "</td>"
                            + "<tr>"
                    );
                %>
            </table>           
        </article>
        <footer>
            Derechos Reservados
        </footer>
    </body>
</html>
