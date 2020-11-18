<%-- 
    Document   : login
    Created on : 15/11/2020, 12:57:42 PM
    Author     : angel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="estilos/estilos.css" rel="stylesheet" type="text/css"/>
        <title>Login - Aplicacion web</title>
    </head>
    <body>
        <header>Login</header>
        <form action="logear" >
            <label for="usuario">Ingrese usuario: </label>
            <input type="text" name="usuario" id="usuario" required>

            <label for="usuario">Ingrese password: </label>
            <input type="password" name="contra" id="contra" required>
            <input type="submit" value="Login" />
        </form>
    </body>
    <footer>
        Derechos reservados
    </footer>
</html>
