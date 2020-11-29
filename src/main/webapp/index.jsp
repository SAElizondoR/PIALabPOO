<%-- 
    Document   : index
    Created on : 27 nov. 2020, 16:38:31
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <style type="text/css">
            table,td,th {
                border: 1px solid black;
            }
            table {
                border-collapse: collapse;
                width: 100%;
            }
            td {
                text-align: center;
            }
        </style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista de herramientas</title>
    </head>
    <body>
        <h1>Lista de herramientas</h1>
        <form action="" method="GET">
            <h2>
                Filtrar: <input type="text" id="filtro" name="filtro">
                <select name="tipofiltro" id="tipofiltro">
                    <option value="nombre"> Nombre </option>
                    <option value="categoria"> Categoría </option>
                    <option value="marca"> Marca </option>
                    <option value="dimesion"> Dimensión </option>
                    <option value="unidades"> Unidades </option>
                </select>
                <input type="submit" value="Filtrar" name="btnfiltro">
            </h2>
        </form>
        
        <table>
            <thead>
                <tr>
                    <th>Identificación</th>
                    <th>Nombre</th>
                    <th>Categoría</th>
                    <th>Marca</th>
                    <th>Dimensión</th>
                    <th>Unidades</th>
                    <th>
                        <form action="agregar.jsp">
                            <input type="submit" name="accion" value="Agregar">
                        </form>
                    </th>
                </tr>
            </thead>
            <c:forEach items="${lista}" var="herramienta">
                <tr>
                    <td>${herramienta.id}</td>
                    <td>${herramienta.nombre}</td>
                    <td>${herramienta.categoria}</td>
                    <td>${herramienta.marca}</td>
                    <td>${herramienta.dimension}</td>
                    <td>${herramienta.unidades}</td>
                </tr>
            </c:forEach>
        </table>
    </body>
</html>
