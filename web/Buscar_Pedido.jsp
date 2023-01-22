<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
	<title>Buscar Cotizacion</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    
</head>

<script>
    clientes = [];
    
        function envia(cod, fecp,sub,igvv,tot){ 
        
   	opener.document.form2.codi.value = cod; 
   	opener.document.form2.fec.value = fecp;
        opener.document.form2.sub_t.value = sub; 
   	opener.document.form2.igv.value = igvv;
   	opener.document.form2.total.value = tot;
   	close();
    } 
</script>
<body>
    
    
    <h2 class="display-4 text-center py-5">Buscar Pedido</h2>
    
    <div class="container">
        
        <div class="input-group mb-3">
            <div class="input-group-prepend">
              <select class="custom-select" id="opcion" name="opcion">
                <option value="1">Cod</option>
              </select>
            </div>
            <input type="text" class="form-control" name="formulario" id="formulario">
          </div>

    </div>
    <div class="container text-center">
            <div class="table-responsive">
                
                <table class="table table-bordered table-hover">
                    <caption><b>Lista de Pedidos</b></caption>
                    <thead>
                        <tr class="bg-success">
                            <th scope="col">ID</th>
                            <th scope="col">FECHA</th>
                            <th scope="col">Sub_Total</th>
                            <th scope="col">IGV</th>
                            <th scope="col">TOTAL</th>
                            <th scope="col">Accion</th>
                        </tr>
                    </thead>
                    <tbody id="body">
       
                    </tbody>
                    
                  </table>
                    
            </div>       
        </div>

  
<%
    
                Connection cn=null;
                Statement st=null;
                ResultSet rs=null;
                
                String driver="com.mysql.jdbc.Driver";
                String url="jdbc:mysql://127.0.0.1:3306/imprenta_bd";
                String user="root";
                String pass="";
                try{
                    
                    
                    Class.forName(driver);
                    cn = DriverManager.getConnection(url,user,pass);
                    st = cn.createStatement();
                    rs = st.executeQuery("select idpedido, fec_emi,sub_t, igv, total from pedido");
                    
                    while(rs.next()){

                        
                        %>

                <script>                                                                       	
                var nuevaLongitud = clientes.push({idco:"<%=rs.getString(1)%>",fec:"<%=rs.getString(2)%>",sub:"<%=rs.getString(3)%>",igv:"<%=rs.getString(4)%>",to:"<%=rs.getString(5)%>"});
                </script>    

   <%
                    }
                        cn.close();
                        st.close();
                        rs.close();
                }catch(ClassNotFoundException e){
                    e.getMessage();
                }
    %>  
       
     
    
 <script>
	

	const filtrar = ()=>{


                body.innerHTML = '';

		const texto = formulario.value.toUpperCase();
                
                
		for(let cliente of clientes){

                        let id = cliente.idco.toUpperCase();

			if ( id.indexOf(texto) !== -1) {

                                body.innerHTML += "<td>" +cliente.idco+"</td><td>" +cliente.fec+"</td><td>" +cliente.sub+"</td><td>" +cliente.igv+"</td><td>" +cliente.to+"</td><td><input type='button' value='Aceptar' onclick='envia(\""+cliente.idco+"\",\""+cliente.fec+"\",\""+cliente.sub+"\",\""+cliente.igv+"\",\""+cliente.to+"\");'></td>";

                                                    
			}
		

		}

	};

	formulario.addEventListener('keyup', filtrar);

	filtrar();
        
        
        

</script>    

            
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
</body>
</html>


