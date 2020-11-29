<%-- 
    Document   : listar
    Created on : 29 nov. 2020, 10:53:12
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
        <form action="Almacen" method="GET">
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
                        <a href=${pageContext.request.contextPath}/Almacen?action=IrAgregar>Agregar</a>
                    </th>
                </tr>
            </thead>
            <c:forEach items="${vectorlista}" var="herramienta">
                <tr>
                    <td><c:out value="${herramienta.id}"/></td>
                    <td><c:out value="${herramienta.nombre}"/></td>
                    <td><c:out value="${herramienta.categoria}"/></td>
                    <td><c:out value="${herramienta.marca}"/></td>
                    <td><c:out value="${herramienta.tamano}"/></td>
                    <td><c:out value="${herramienta.unidades}"/></td>
                    <td>
                        <a href=${pageContext.request.contextPath}/Almacen?action=ObtenerUno&id=${herramienta.id}>Editar</a>
                        | 
                        <a href=${pageContext.request.contextPath}/Almacen?action=Eliminar&id=${herramienta.id}>Eliminar</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </body>
</html>
