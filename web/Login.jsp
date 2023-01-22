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
        <title>Menú</title>
        <%--<link rel="stylesheet" type="text/css" href="../css/estilo.css">--%>
    </head>
    
    
    <style type="text/css">
        
    body{

    background-image: url(imagenes/foondo3.jpg);
    background-repeat: no-repeat; 
    background-size: 100% 100%;
    background-attachment: fixed;
    width: 90%;
    margin: 20px auto;
    padding: 0;
    
    }
        
        
        
    </style>
    
    
    <body>
        <h1 style="" ALIGN=CENTER ><FONT FACE="impact" SIZE=35 COLOR="white" >Creaciones "Kleydi"</FONT></h1>
      <form action="">
            <table border="5" width="300" bgcolor="white" ALIGN=CENTER >
                
                <tr>
                   
                         <td COLOR="white" >Usuario</td>
                    <td ALIGN=CENTER ><input type="text" name="txtUsuario" ></td>
                    </tr>
                <tr>
                     <td COLOR="white" >Contraseña</td>
                    <td ALIGN=CENTER><input type="password" name="txtContrasena"></td>
                </tr>
                <tr>
                    <td colspan="3" >
                         <input type="submit" name="btning" value="Ingresar">
                          <input type="submit" name="btnaleo" value="Salir">
                    </td>
                        
                </tr>
                         
               
            </table>
        </form>
        
        <%
           if(request.getParameter("btning") != null){
                
                String usr = request.getParameter("txtUsuario");
                String con = request.getParameter("txtContrasena");
     
            
                Connection cn=null;
                Statement st=null;
                ResultSet rs=null;
                try{
                    String driver="com.mysql.jdbc.Driver";
                    String url="jdbc:mysql://127.0.0.1:3306/imprenta_bd";
                    String user="root";
                    String pass="";
                    
                    Class.forName(driver);
                    cn = DriverManager.getConnection(url,user,pass);
                    st = cn.createStatement();
                    rs = st.executeQuery("select * from usuario where idusuario = '"+usr+"' and password = '"+con+"'");
                    
                    if(rs.next()){
                        response.sendRedirect("Menuprincipal.jsp");
                    }
                    
                }catch(ClassNotFoundException e){
                    e.getMessage();
                    
                }
          }
                
                
        %>
        
    </body>
</html>
