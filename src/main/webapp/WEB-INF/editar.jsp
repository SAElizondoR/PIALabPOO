<%-- 
    Document   : editar
    Created on : 28 nov. 2020, 21:47:07
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar herramienta</title>
    </head>
    <body>
        <h1>Editar herramienta</h1>
        <form action=Editar>
            <table>
                <tr>
                    <td>Nombre: </td>
                    <td><input type="text" name="nombre" value=${herramienta.nombre}></td>
                </tr>
                <tr>
                    <td>Categoría: </td>
                    <td><input type="text" name="categoria" value=${herramienta.categoria}></td>
                </tr>
                <tr>
                    <td>Marca: </td>
                    <td><input type="text" name="nombre" value=${herramienta.marca}></td>
                </tr>
                <tr>
                    <td>Dimensión: </td>
                    <td><input type="text" name="dimension" value=${herramienta.tamano}></td>
                </tr>
                <tr>
                    <td>Unidades: </td>
                    <td><input type="text" name="unidades" value=${herramienta.unidades}></td>
                </tr>
                <tr>
                    <td><input type="submit" name="btnmodificar" value="Editar"></td>
                </tr>
            </table>
        </form>
    </body>
</html>
