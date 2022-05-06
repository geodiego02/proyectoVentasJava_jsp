<%@page import="java.util.List"%>
<%@page import="Entidades.Departamento"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="javax.naming.InitialContext"%>
<%@page import="Modelo.ServicioLocal"%>
<%! ServicioLocal servicio;%>
<%
    //Comunicación con el servicio
    InitialContext ctx = new InitialContext();
    servicio = (ServicioLocal) ctx.lookup("java:global/ProyectoVentaDiego/Servicio!Modelo.ServicioLocal");
    
    List<Departamento> lista = servicio.getDepartamentos();
%>

<c:set var="lista" scope="page" value="<%=lista%>" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <title>Departamento</title>
    </head>
    <body>
        <%@include file="includes/menu.jsp" %>
        
        <br>
        <form action="Control" method="post">
            <div class="form-group col-sm-10">NUEVO DEPARTAMENTO</div>
            <div class="form-group col-sm-10">
                <label>Nombre: </label> <input type="text" name="nombre" required><br>
            </div>
            <button name="op" class="btn btn-primary" type="submit" value="adddep">Agregar</button>            
        </form>
        <br>
        <table class="table">
            <thead>
                <tr>
                    <th>Código</th>
                    <th>Descripción</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>                
                <c:forEach items="${lista}" var="c">
                    <tr>
                        <td>${c.codigodepartamento}</td>
                        <td>${c.nombre}</td>
                        <td>
                            <a href="Departamentomod.jsp?codigo=${c.codigodepartamento}" class="btn btn-default btn-xs">Editar</a>
                            <a href="Control?op=elimdep&codigo=${c.codigodepartamento}" class="btn btn-default btn-xs">Eliminar</a>
                        </td>                            
                    </tr>
                </c:forEach>
            </tbody>            
        </table>
    </body>
</html>