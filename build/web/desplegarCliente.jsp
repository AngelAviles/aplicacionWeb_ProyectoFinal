<%@page import="objetosNegocio.Renta"%>
<%@page import="objetosNegocio.Cliente"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    if (session.getAttribute("elUsuario") == null) {
        response.sendRedirect("login.jsp");
    }

    String tareaSelec = (String) session.getAttribute("tarea");
    String tarea = "";
    if (tareaSelec.equals("agregarCliente")) {
        tarea = "Agregar Cliente";
    } else if (tareaSelec.equals("eliminarCliente")) {
        tarea = "Eliminar Cliente";
    }

    String usuario = (String) session.getAttribute("elUsuario");
    Cliente cliente = (Cliente) session.getAttribute("cliente");
    session.removeAttribute("cliente");
    List listaRentas = (List) session.getAttribute("listaRentas");
    session.removeAttribute("listaRentas");
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
            <h1><% if (tareaSelec.equalsIgnoreCase("agregarCliente")) {
                    out.print("El cliente ya existe");
                } else {
                    out.print(tarea);
                }%></h1>

            <p>La siguiente información, le pertenece al cliente con el numero de credencial <%=cliente.getNumCredencial()%>:</p>

            <table>
                <thead>
                <th>Credencial</th>
                <th>Nombre</th>
                <th>Direccion</th>
                <th>Telefono</th>
                </thead>
                <%
                    out.print("<tr>"
                            + "<td>" + cliente.getNumCredencial() + "</td>"
                            + "<td>" + cliente.getNombre() + "</td>"
                            + "<td>" + cliente.getDireccion() + "</td>"
                            + "<td>" + cliente.getTelefono() + "</td>"
                            + "<tr>"
                    );
                %>
            </table>  
            <%
                if (tareaSelec.equalsIgnoreCase("eliminarCliente")) {

                    if (listaRentas.size() == 0) {
                        session.setAttribute("cliente", cliente);
                        out.print("<p>¿Deseas eliminar a este cliente?</p>"
                                + "<form action=\"eliminarCliente\" >"
                                + "<input type=\"submit\" value=\"Eliminar Cliente\" />"
                                + "</form>"
                        );
                    } else { %>
            <p>NO SE PUEDE ELIMINAR ESTE CLIENTE PORQUE TIENE UNA RENTA</p>

            <h1>Rentas Encontradas</h1>

            <table>
                <thead>
                <th>Num. Credencial</th>
                <th>Num. Catalogo</th>
                <th>Fecha de renta</th>
                <th>Dias de renta</th>
                </thead>
                <%
                    for (int i = 0; i < listaRentas.size(); i++) {
                        Renta r = (Renta) listaRentas.get(i);
                %>
                <tr>
                    <td><%=r.getCliente().getNumCredencial()%></td>
                    <td><%=r.getArticulo().getNumCatalogo()%></td>
                    <td><%=r.getFechaRenta().toDateString()%></td>
                    <td><%=r.getTiempoRenta()%></td>
                </tr>

                <%
                    }
                %>
            </table>
            <%
                    }
                }

            %>
        </article>

    </body>
</html>
