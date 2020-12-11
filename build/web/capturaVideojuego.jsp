<%@page import="objetosNegocio.Videojuego"%>
<%@page import="objetosNegocio.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    if (session.getAttribute("elUsuario") == null) {
        response.sendRedirect("login.jsp");
    }

    String usuario = (String) session.getAttribute("elUsuario");
    String numCatalogo = (String) session.getAttribute("numCatalogo");
    session.removeAttribute("numCatalogo");
    Videojuego videojuego = (Videojuego) session.getAttribute("videojuego");
    session.removeAttribute("videojuego");
    String tareaSelec = (String) session.getAttribute("tarea");

    String tarea = "";

    if (tareaSelec.equals("agregarVideojuego")) {
        tarea = "Agregar Videojuego";
    } else if (tareaSelec.equals("editarVideojuego")) {
        tarea = "Editar Videojuego";
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
                    <li><a href="control?tarea=listarVideojuegos"  >Listar Videojuegos</a></li>
                    <li><a href="control?tarea=listarVideojuegosGenero"  >Listar Videojuegos por Genero</a></li>
                    <li><a href="control?tarea=agregarVideojuego"  >Agregar Videojuegos</a></li>
                    <li><a href="control?tarea=editarVideojuego" >Editar Videojuegos</a></li>
                    <li><a href="control?tarea=eliminarVideojuego" >Eliminar Videojuegos</a></li>
                </fieldset>
            </ul>
        </nav>
        <article>
            <h1><%=tarea%></h1>

            <form action=<%=tareaSelec%>>
                <input type="text" name="numCatalogo" placeholder="Num. Catalogo" value=<%=numCatalogo%> readonly="readonly" required/>
                <input type="text" name="titulo" placeholder="Titulo" <% if (videojuego != null) {
                        out.print("value=" + videojuego.getTitulo());
                    } %> required/>
                <input type="text" name="genero" placeholder="Genero" <% if (videojuego != null) {
                        out.print("value=" + videojuego.getGenero());
                    } %> required/>
                <input type="text" name="clasificacion" placeholder="Clasificacion" <% if (videojuego != null) {
                        out.print("value=" + videojuego.getClasificacion());
                    } %> required/>
                <input type="text" name="consola" placeholder="Consola" <% if (videojuego != null) {
                        out.print("value=" + videojuego.getConsola());
                    } %> required/>
                <input type="text" name="fabricante" placeholder="Fabricante" <% if (videojuego != null) {
                        out.print("value=" + videojuego.getFabricante());
                    } %> required/>
                <input type="number" name="version" placeholder="Version" <% if (videojuego != null) {
                        out.print("value=" + videojuego.getVersion());
                    }%> required/>
                <input type="submit" value=<%=tarea%> />
            </form>
        </article>

    </body>
</html>
