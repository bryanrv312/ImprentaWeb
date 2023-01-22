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

<script>
    
    clientes = [];
    
    
    function envia(dni, nom, dir){ 
        
   	opener.document.form2.dni_c.value = dni; 
   	opener.document.form2.nom_c.value = nom;
   	opener.document.form2.dir_c.value = dir;
   	close();
} 
</script>


<body>
    
    
    <h2 class="display-4 text-center py-5">Buscar Cliente</h2>
    
    <div class="container">
        
        <div class="input-group mb-3">
            <div class="input-group-prepend">
              <select class="custom-select" id="opcion" name="opcion">
                <option value="1">Nombre</option>
                <option value="2">DNI</option>
              </select>
            </div>
            <input type="text" class="form-control" name="formulario" id="formulario">
          </div>

    </div>
    <div class="container text-center">
            <div class="table-responsive">
                
                <table class="table table-bordered table-hover">
                    <caption><b>Lista de Clientes</b></caption>
                    <thead>
                        <tr class="bg-success">
                            <th scope="col">DNI</th>
                            <th scope="col">Nombre</th>
                            <th scope="col">Direccion</th>
                            <th scope="col">Celular</th>
                            <th scope="col">Acciones</th>
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
                    rs = st.executeQuery("select * from cliente");
                    
                    while(rs.next()){

                        
                        %>

                <script>                                                                       	
                var nuevaLongitud = clientes.push({dni:"<%=rs.getString(4)%>",nombre:"<%=rs.getString(2)%>",direccion:"<%=rs.getString(5)%>",celular:"<%=rs.getString(6)%>"});
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
                
                var cod = document.getElementById("opcion").value;
                
		for(let cliente of clientes){

			let dni = cliente.dni.toUpperCase();
                        let nombre = cliente.nombre.toUpperCase();

			if (cod==='2' && dni.indexOf(texto) !== -1) {
                            
                                body.innerHTML += "<td>" +cliente.dni+"</td>\n\
                                <td>" +cliente.nombre+"</td><td>" +cliente.direccion+"</td>\n\
                                <td>" +cliente.celular+"</td><td><input type='button' value='Aceptar' onclick='envia(\""+cliente.dni+"\",\""+cliente.nombre+"\",\""+cliente.direccion+"\");'></td>";

                                                    
			}else if (cod==='1' && nombre.indexOf(texto) !== -1) {

                                body.innerHTML += "<td>" +cliente.dni+"</td><td>" +cliente.nombre+"</td>\n\
                <td>" +cliente.direccion+"</td><td>" +cliente.celular+"</td><td><input type='button' value='Aceptar' onclick='envia(\""+cliente.dni+"\",\""+cliente.nombre+"\",\""+cliente.direccion+"\");'></td>";

                                                    
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


