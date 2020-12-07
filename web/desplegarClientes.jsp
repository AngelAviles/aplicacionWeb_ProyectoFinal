<%@page import="objetosNegocio.Cliente"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    if (session.getAttribute("elUsuario") == null) {
        response.sendRedirect("login.jsp");
    }

    String usuario = (String) session.getAttribute("elUsuario");
    List lista = (List) session.getAttribute("listaClientes");
    session.removeAttribute("listaClientes");
%>

<!DOCTYPE html>
<html>
    <head>
        <title>Listado de Clientes - <%=usuario%></title>
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
            <h1>Lista de clientes</h1>

            <table>
                <thead>
                <th>Credencial</th>
                <th>Nombre</th>
                <th>Telefono</th>
                <th>Direccion</th>
                </thead>
                <%
                    for (int i = 0; i < lista.size(); i++) {
                        Cliente c = (Cliente) lista.get(i);
                        out.print("<tr>"
                                + "<td>" + c.getNumCredencial() + "</td>"
                                + "<td>" + c.getNombre() + "</td>"
                                + "<td>" + c.getTelefono() + "</td>"
                                + "<td>" + c.getDireccion() + "</td>"
                                + "<tr>"
                        );
                    }

                %>
            </table>           
        </article>
        <footer>
            <p>Derechos Reservados</p>
        </footer>
    </body>
</html>
