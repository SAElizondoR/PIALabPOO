<%-- 
    Document   : buscar
    Created on : 6 dic. 2020, 11:32:15
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Buscar herramientas</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i">
    <link rel="stylesheet" href="assets/fonts/fontawesome-all.min.css">
    <link rel="stylesheet" href="assets/fonts/font-awesome.min.css">
    <link rel="stylesheet" href="assets/fonts/ionicons.min.css">
    <link rel="stylesheet" href="assets/fonts/line-awesome.min.css">
    <link rel="stylesheet" href="assets/fonts/fontawesome5-overrides.min.css">
    <link rel="stylesheet" href="assets/css/Login-Form-Clean.css">
</head>

<body id="page-top">
    <div id="wrapper">
        <nav class="navbar navbar-dark align-items-start sidebar sidebar-dark accordion bg-gradient-primary p-0" style="background: rgb(24,22,22);">
            <div class="container-fluid d-flex flex-column p-0">
                <a class="navbar-brand d-flex justify-content-center align-items-center sidebar-brand m-0" href="#">
                    <div class="sidebar-brand-icon rotate-n-15"><i class="fas fa-toolbox"></i></div>
                    <div class="sidebar-brand-text mx-3"><span>toolbox</span></div>
                </a>
                <hr class="sidebar-divider my-0">
                <ul class="nav navbar-nav text-light" id="accordionSidebar">
                    <li class="nav-item"><a class="nav-link active" href="index.jsp"><i class="fas fa-tachometer-alt"></i><span>Índice</span></a></li>
                    <li class="nav-item"><a class="nav-link" href=${pageContext.request.contextPath}/Almacen?accion=IrBuscar><i class="fa fa-search"></i><span>Buscar</span></a></li>
                    <li class="nav-item"><a class="nav-link" href=${pageContext.request.contextPath}/Almacen?accion=IrAgregar><i class="fa fa-angle-double-down"></i><span>Agregar herramientas</span></a></li>
                </ul>
                <div class="text-center d-none d-md-inline"><button class="btn rounded-circle border-0" id="sidebarToggle" type="button"></button></div>
            </div>
        </nav>
        <div class="d-flex flex-column" id="content-wrapper">
            <div id="content">
                <nav class="navbar navbar-light navbar-expand bg-white shadow mb-4 topbar static-top">
                    <div class="container-fluid"><button class="btn btn-link d-md-none rounded-circle mr-3" id="sidebarToggleTop" type="button"><i class="fas fa-bars"></i></button>
                        <form class="form-inline d-none d-sm-inline-block mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
                            <div class="input-group">
                                <div class="input-group-append"><button class="btn btn-primary py-0" type="button"></button></div>
                            </div>
                        </form>
                        <ul class="nav navbar-nav flex-nowrap ml-auto">
                            <li class="nav-item dropdown d-sm-none no-arrow"><a class="dropdown-toggle nav-link" data-toggle="dropdown" aria-expanded="false" href="#"><i class="fas fa-search"></i></a>
                                <div class="dropdown-menu dropdown-menu-right p-3 animated--grow-in" aria-labelledby="searchDropdown">
                                    <form class="form-inline mr-auto navbar-search w-100">
                                        <div class="input-group"><input class="bg-light form-control border-0 small" type="text" placeholder="Search for ...">
                                            <div class="input-group-append"><button class="btn btn-primary py-0" type="button"><i class="fas fa-search"></i></button></div>
                                        </div>
                                    </form>
                                </div>
                            </li>
                            <li class="nav-item dropdown no-arrow mx-1"></li>
                            <li class="nav-item dropdown no-arrow mx-1">
                                <div class="shadow dropdown-list dropdown-menu dropdown-menu-right" aria-labelledby="alertsDropdown"></div>
                            </li>
                            <div class="d-none d-sm-block topbar-divider"></div>
                            <li class="nav-item dropdown no-arrow"></li>
                        </ul>
                    </div>
                </nav>
                <div class="container-fluid">
                    <div class="row">
                        <div class="col"><span style="font-size: 50px;"><strong>Buscar herramientas&nbsp; &nbsp;</strong></span><i class="fa fa-search" style="font-size: 56px;"></i></div>
                    </div>
                    <div class="card shadow">
                        <div class="card-header py-3"><span style="font-size: 20px;"><strong>Filtrar por: &nbsp;</strong></span>
                            <form action="Almacen" method="GET">
                                <input type="text" id="filtro" name="filtro">
                                <select name="tipofiltro" id="tipofiltro" style="font-family: Nunito, sans-serif;color: rgb(133,135,150);border-color: rgb(133,135,150);">
                                    <option value="nombre"> Nombre </option>
                                    <option value="categoria"> Categoría </option>
                                    <option value="marca"> Marca </option>
                                    <option value="dimesion"> Dimensión </option>
                                    <option value="unidades"> Unidades </option>
                                </select>
                                <input type="submit" value="Filtrar" name="btnfiltro">
                            </form>
                        </div>
                        <div
                            class="card-body">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="text-md-right dataTables_filter" id="dataTable_filter"></div><span><strong>Estás buscando por: &nbsp; &nbsp;</strong></span><span></span><span>${tipofiltro}</span><span></span><span></span></div>
                            </div>
                            <div class="table-responsive table mt-2" id="dataTable" role="grid" aria-describedby="dataTable_info">
                                <table class="table my-0" id="dataTable">
                                    <thead>
                                        <tr>
                                            <th>Id</th>
                                            <th>Nombre</th>
                                            <th>Categoría</th>
                                            <th>Marca</th>
                                            <th>Dimensión</th>
                                            <th>Unidades</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${vectorlista}" var="herramienta">
                                            <tr>
                                                <td><c:out value="${herramienta.id}"/></td>
                                                <td><c:out value="${herramienta.nombre}"/></td>
                                                <td><c:out value="${herramienta.categoria}"/></td>
                                                <td><c:out value="${herramienta.marca}"/></td>
                                                <td><c:out value="${herramienta.tamano}"/></td>
                                                <td><c:out value="${herramienta.unidades}"/></td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                    <tfoot>
                                        <tr>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                    </tfoot>
                                </table>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <nav class="d-lg-flex justify-content-lg-end dataTables_paginate paging_simple_numbers">
                                        <ul class="pagination"></ul>
                                    </nav>
                                </div>
                            </div>
                    </div>
                </div>
            </div>
        </div>
        <footer class="bg-white sticky-footer">
            <div class="container my-auto">
                <div class="text-center my-auto copyright"><span>Página diseñada por David Lázaro, Héctor Márquez &amp; Sergio Elizondo</span></div>
            </div>
        </footer>
    </div><a class="border rounded d-inline scroll-to-top" href="#page-top"><i class="fas fa-angle-up"></i></a></div>
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.js"></script>
    <script src="assets/js/theme.js"></script>
</body>

</html>