<%-- 
    Document   : editar
    Created on : 28-oct-2018, 16:32:43
    Author     : RAMIUS
--%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Menú</title><link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    
        <%--<link rel="stylesheet" type="text/css" href="../css/estilo.css">--%>
    </head>
    
    
    <style type="text/css">
        
    body{

    background-image: url(imagenes/fondo.jpg);
    background-repeat: no-repeat; 
    background-size: 100% 100%;
    background-attachment: fixed;
    width: 90%;
    margin: 20px auto;
    padding: 0;
    
    }
        
        
        
    </style>
    
    
    <body>
        <h1 ><FONT FACE="impact" SIZE=25 COLOR="skyblue" >Creaciones "Kleydi"</FONT></h1>
        
        
        <form action="">
            <table border="5" width="150" >
                
                <tr>
                    <td colspan="2" >
                        <a href="Realizar_Cotizacion.jsp" class="btn btn-success">Realizar Cotizacion</a>
                        <a href="Realizar_Pedido_Venta.jsp" class="btn btn-success">Realizar Pedido</a>
                        <a href="Realizar_Venta.jsp" class="btn btn-success">Realizar Venta</a> 
                    </td>                   
                </tr>
                
                <tr>
                 <th colspan="2"><a><img src="imagenes/bienvenido.png" width="1000" heigth="1000"/></a></th>
                </tr>
            </table>
        </form>
 
        
    </body>
</html>
