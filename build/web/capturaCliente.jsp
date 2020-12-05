<%@page import="objetosNegocio.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%    
    if (session.getAttribute("elUsuario") == null) {
        response.sendRedirect("login.jsp");
    }

    String usuario = (String) session.getAttribute("elUsuario");
    String numCredencial = (String) session.getAttribute("numCredencial");
    Cliente cliente = (Cliente) session.getAttribute("cliente");
    String tareaSelec = (String) session.getAttribute("tarea");

    String tarea = "";

    if (tareaSelec.equals("agregarCliente")) {
        tarea = "Agregar Cliente";
    } else if (tareaSelec.equals("editarCliente")) {
        tarea = "Editar Cliente";
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
        <header><%=tarea%></header>
        <nav>
            <ul>
                <li><a href="control?tarea=listarClientes">Listar Clientes</a></li>
                <li><a href="control?tarea=agregarCliente">Agregar Clientes</a></li>
                <li><a href="control?tarea=editarCliente">Editar Clientes</a></li>
                <li><a href="control?tarea=eliminarCliente">Eliminar Clientes</a></li>
            </ul>
        </nav>
        <article>
            <form action=<%=tareaSelec%>>
                <input type="text" name="cred" placeholder="Num. Credencial" value=<%=numCredencial%> readonly="readonly" />
                <input type="text" name="nombre" placeholder="Nombre" <% if (cliente != null) out.print("value=" + cliente.getNombre()); %> />
                <input type="text" name="dir" placeholder="Dirección" <% if (cliente != null) out.print("value=" + cliente.getDireccion()); %> />
                <input type="text" name="tel" placeholder="Telefono" <% if (cliente != null) out.print("value=" + cliente.getTelefono()); %> />
                <input type="submit" value=<%=tarea%> />
            </form>
        </article>
        <footer>
            Derechos Reservados
        </footer>
    </body>
</html>
