<%@page import="objetosNegocio.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    if (session.getAttribute("elUsuario") == null) {
        response.sendRedirect("login.jsp");
    }

    String usuario = (String) session.getAttribute("elUsuario");
    String numCredencial = (String) session.getAttribute("numCredencial");
    session.removeAttribute("numCredencial");
    Cliente cliente = (Cliente) session.getAttribute("cliente");
    session.removeAttribute("cliente");
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
        <header><a href="menu.jsp">Nuestra aplicacion web</a></header>
        <nav>
            <ul>
                <fieldset>
                    <li><a href="control?tarea=listarClientes" >Listar Clientes</a></li>
                    <li><a href="control?tarea=agregarCliente" >Agregar Clientes</a></li>
                    <li><a href="control?tarea=editarCliente" >Editar Clientes</a></li>
                    <li><a href="control?tarea=eliminarCliente" >Eliminar Clientes</a></li>
                </fieldset>
            </ul>
        </nav>
        <article>
            <h1><%=tarea%></h1>

            <form action=<%=tareaSelec%>>
                <input type="text" name="cred" placeholder="Num. Credencial" value=<%=numCredencial%> readonly="readonly" requiered/>
                <input type="text" name="nombre" placeholder="Nombre" <% if (cliente != null) {
                        out.print("value=" + cliente.getNombre());
                    } %> requiered/>
                <input type="text" name="dir" placeholder="Dirección" <% if (cliente != null) {
                        out.print("value=" + cliente.getDireccion());
                    } %> requiered/>
                <input type="text" name="tel" placeholder="Telefono" <% if (cliente != null) {
                        out.print("value=" + cliente.getTelefono());
                    }%> requiered/>
                <input type="submit" value=<%=tarea%> />
            </form>
        </article>

    </body>
</html>
