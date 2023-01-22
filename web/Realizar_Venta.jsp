<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
	<title>Buscar formulario</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">


</head>


<body>
    <script>

    function popup2(){ 
	   	miPopup = window.open("Buscar_Pedido.jsp","","width=700,height=700,scrollbars=yes"); 
	}

</script>

    
    
    
    <div class="container">
        <h2 class="display-4 text-center py-4" >Realizar Venta</h2>
        <form name="form2">
          <div class="form-group">
            <label for="venta">Codigo de venta:</label>
            <input type="text" class="form-control" id="venta" name="venta" >
          </div>     
          <div class="form-group">
            <label for="codi">Pedido:</label>
            <input type="text" class="form-control" id="codi" name="codi" readonly>
          </div>
           <div class="form-group">
            <label for="fec">Fecha de Pedido:</label>
            <input type="text" class="form-control" id="fec" name="fec" readonly>
          </div>      
          <div class="form-group">
            <label for="sub_t">Sub total:</label>
            <input type="text" class="form-control" id="sub_t" name="sub_t" readonly>
          </div>
          <div class="form-group">
            <label for="igv">IGV:</label>
            <input type="text" class="form-control" id="igv" name="igv" readonly>
          </div>
           <div class="form-group">
            <label for="total">Total:</label>
            <input type="text" class="form-control" id="total" name="total" readonly>
          </div> 
                <input type="button" value="Buscar Pedido" onclick="popup2()">
                <button type="submit" name="Guardar" id="Guardar" class="btn btn-primary float-right">Realizar Venta</button>    
        </form>
        
        </div>
<%
                Connection cn=null;
                Statement st=null;
                ResultSet rs=null;
                
                String driver="com.mysql.jdbc.Driver";
                String url="jdbc:mysql://127.0.0.1:3306/imprenta_bd";
                String user="root";
                String pass="";
            if(request.getParameter("Guardar") != null){
                
                int cod = Integer.parseInt(request.getParameter("venta"));             
                int cod_2 = Integer.parseInt(request.getParameter("codi"));
                float sub = Float.parseFloat(request.getParameter("sub_t"));
                float igv = Float.parseFloat(request.getParameter("igv"));
                float tot = Float.parseFloat(request.getParameter("total"));    

                
                try{
                                

                    
                    
                    Class.forName(driver);
                    cn = DriverManager.getConnection(url,user,pass);
                    st = cn.createStatement();
                    st.executeUpdate("insert into venta values ("+cod+",'001',NOW(),"+sub+","+igv+","+tot+",'Emitida')");                   
          

                   
                    
                   
                    request.getRequestDispatcher("Menuprincipal.jsp").forward(request, response);
                    
                   
                }catch(ClassNotFoundException e){
                      System.out.print("Clase no encontrada");
                }
                
                 
            }
        %>

            

    </body>

<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

</html>


