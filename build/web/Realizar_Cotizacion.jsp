<%@page import="com.sun.java.swing.plaf.windows.resources.windows"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
	<title>Realizar cotizacion</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    
</head>

<body>
    
    
<script>
    insumos = [];
</script>
    <form class="needs-validation" novalidate>
    
    <h2 class="display-4 text-center py-5">Realizar Cotizacion</h2>
    
    <div class="container">
        
        <div class="input-group mb-3">
          <div class="input-group-prepend">
            <span class="input-group-text" >Codigo Cotizacion: </span>
          </div>
          <input type="text" class="form-control" id="cod_cot" name="cod_cot">
        </div>
        <div class="input-group mb-3">
            <div class="input-group-prepend">
              <select class="custom-select" id="opcion" name="opcion">
                <option value="1">Nombre</option>
              </select>
            </div>
            <input type="text" class="form-control" name="formulario" id="formulario">
          </div>

    </div>
    <div class="container text-center">
            <div class="table-responsive">
                
                <table class="table ">
                    <caption><b>Lista de Productos</b></caption>
                    <thead>
                        <tr class="bg-success">
                            <th scope="col">COD</th>
                            <th scope="col">Nombre</th>
                            <th scope="col">Talla</th>
                            <th scope="col">Precio</th>
                            <th scope="col">Cantidad</th>
                            <th scope="col">Especificaciones</th>
                            <th scope="col">Agregar</th>
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
                    rs = st.executeQuery("select * from insumo");
                    
                    while(rs.next()){

                        
                        %>

                <script>                                                                       	
                var nuevaLongitud = insumos.push({codi:"<%=rs.getString(1)%>",nombre:"<%=rs.getString(2)%>",talla:"<%=rs.getString(3)%>",precio:"<%=rs.getString(5)%>"});
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
                
		for(let insumo of insumos){

			let codi = insumo.codi.toUpperCase();
                        let nombre = insumo.nombre.toUpperCase();

			if (cod==='1' && nombre.indexOf(texto) !== -1) {

                                body.innerHTML += "<td ><input type='text' id='coda'\n\
                 style='border: 0;' value='"+insumo.codi+"' \n\
autofocus readonly/></td><td ><input type='text' style='border: 0;' id='nom'\n\
 value='"+insumo.nombre+"' autofocus readonly/></td><td ><input type='text'\n\
 style='border: 0;' id='tall' value='"+insumo.talla+"' autofocus readonly/></td>\n\
<td ><input type='text' style='border: 0;' id='pre'  value='"+insumo.precio+"' \n\
autofocus readonly/></td><td ><input type='text'  id='can' /></td><td ><textarea id='espe' rows='2' cols='10'></textarea></td><td><input type='button' onclick='agregar()' value='Agregar' ></td>";

                                                    
			}
		

		}

	};

	formulario.addEventListener('keyup', filtrar);

	filtrar();
        
        
        

</script>    

<div class="container text-center">
            <div class="table-responsive">
                
                <table class="table">
                    <caption><b>Detalle Cotización</b></caption>
                    <thead>
                        <tr class="bg-success">
                            <th scope="col">NUM</th>
                            <th scope="col">COD</th>
                            <th scope="col">Nombre</th>
                            <th scope="col">Talla</th>
                            <th scope="col">Precio</th>
                            <th scope="col">Especificaciones</th>
                            <th scope="col">Cantidad</th>
                            <th scope="col">Monto</th>
                        </tr>
                    </thead>
                    <tbody id="tab">
<script> 




	function eliminar(id_fila){

		$('#'+id_fila).remove();

		actualizar();
		reordenar();
	
	}


	var cont=0;
	function agregar(){


		var cod = document.getElementById("coda").value;
		var nom = document.getElementById("nom").value;
		var tal = document.getElementById ("tall").value;
		var pre = document.getElementById ("pre").value;
		var can = document.getElementById ("can").value;
		var esp = document.getElementById ("espe").value;
		cont++;
                var monto=(pre*can);
                
		var fila='<tr id="fila'+cont+'" onclick="seleccionar(this.id)"><td>'+cont+'</td><td><input type="text" style="border: 0;" \n\
                            name="cod" value="'+cod+'" autofocus readonly/>\n\
                            </td><td><input type="text" style="border: 0;" name="nom" value="'+nom+'" autofocus readonly/>\n\
                            </td><td><input type="text" style="border: 0;" name="tal" value="'+tal+'" autofocus readonly/></td><td><input type="text" \n\
                            class="pre" style="border: 0;" name="pre" \n\
                             value="'+pre+'" autofocus readonly/></td><td><input type="text" name="esss" id="esss" value="'+esp+'" autofocus readonly/></td><td><input type="text" class="can" style="border: 0;" name="can" id="can"  value="'+can+'" autofocus readonly/></td><td><input type="text" class="monto" name="mon"\n\
                             id="mon" value="'+monto+'" autofocus readonly/></td></tr>';
		$('#tab').append(fila);
                
                actualizar();
		reordenar();
		
	}


	var id_fila_selected;
	function seleccionar(id_fila){

		if ($('#'+id_fila).hasClass('seleccionada')){

			$('#'+id_fila).removeClass('seleccionada');

		}else{

			$('#'+id_fila).addClass('seleccionada');
		}

		id_fila_selected=id_fila;

	}


	function reordenar(){

		var num=1;
		$('#tab tr').each(function(){

			$(this).find('td').eq(0).text(num);
			num++;

		});

	}


	function actualizar(){

		var sub_t=0;
		var igv=0;
		var total=0;
		var array = document.getElementsByClassName('monto');
		
		for(var i=0; i<array.length; i++){

			var value = parseFloat(array[i].value);
			sub_t += value;
		}


		sub_t = sub_t.toFixed(2);
		igv  = (sub_t * 0.19);
		total=(parseFloat(sub_t) + igv);

		$("#sub_t").val(sub_t);
		$("#igv").val(igv);
		$("#total").val(total);

	}

</script> 
                    </tbody>
                    
                  </table>
                <input type="button" onclick="eliminar(id_fila_selected)" value="Eliminar">
            </div>       
        </div>

<div class="container py-5">
            
            <div class="col-12 main-section">
                
                <div class="modal-content">
                                   
                    

                    <div class="form-row">
                      <div class="col-md-4 mb-3">
                        <label for="sub_t">Subtotal:</label>
                        <input type="text" class="form-control"  id="sub_t" name="sub_t" readonly>            
                      </div>
                      
                      <div class="col-md-4 mb-3">
                        <label for="igv">IGV:</label>
                        <input type="text" class="form-control" id="igv" name="igv" readonly>            
                      </div>
                      
                      <div class="col-md-4 mb-6">
                      
                        <label for="total">TOTAL:</label>
                        <input type="text" class="form-control" id="total" name="total" readonly>     
                      </div>

                    </div>
                    
                        <button class="btn btn-success float-right rounded" name="Guardar" type="submit">Guardar</button>
                    
                   
                </div>
                              
            </div>
        </div>

 </form>
<%
            if(request.getParameter("Guardar") != null){
                
                int cod = Integer.parseInt(request.getParameter("cod_cot"));
                String[] cod_2 = request.getParameterValues("cod");
                String[] can = request.getParameterValues("can");
                String[] mo = request.getParameterValues("mon");
                String[] es = request.getParameterValues("esss");
                float sub = Float.parseFloat(request.getParameter("sub_t"));
                float igv = Float.parseFloat(request.getParameter("igv"));
                float tot = Float.parseFloat(request.getParameter("total"));    

                
                try{
              
                    
                    Class.forName(driver);
                    cn = DriverManager.getConnection(url,user,pass);
                    st = cn.createStatement();
                    st.executeUpdate("insert into cotizacion(idcotizacion,fec_emi,sub_tot,igv,total) values ("+cod+",NOW(),"+sub+","+igv+","+tot+")");                   
          
                    for (int i=0;i<cod_2.length;i++) {
                    
                    cn = DriverManager.getConnection(url,user,pass);
                    st = cn.createStatement();
                    st.executeUpdate("insert into det_cot_ins values ("+cod+" ,"+cod_2[i]+",'"+es[i]+"',"+can[i]+","+mo[i]+")");
                            
                    }
                   
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


