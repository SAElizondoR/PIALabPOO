<%-- 
    Document   : agregar
    Created on : 28 nov. 2020, 20:47:39
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro de herramienta</title>
    </head>
    <body>
        <h1>Registro de herramienta</h1>
        <form action="Almacen">
            <table>
                <tr>
                    <td>Nombre:</td>
                    <td><input type="text" name="nombre"></td>
                </tr>
                <tr>
                    <td>Categoría:</td>
                    <td><input type="text" name="categoria"></td>
                </tr>
                <tr>
                    <td>Marca:</td>
                    <td><input type="text" name="marca"></td>
                </tr>
                <tr>
                    <td>Dimensión:</td>
                    <td><input type="text" name="dimension"></td>
                </tr>
                <tr>
                    <td>Unidades:</td>
                    <td><input type="text" name="unidades"></td>
                </tr>
                <tr>
                    <td colspan="2"><input type="submit" value="Agregar" name="btnagregar"></td>
                </tr>
            </table>
        </form>
    </body>
</html>
