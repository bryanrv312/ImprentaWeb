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
    insumos = [];
    	var cont=0;
    /****************************************************************/
    var miPopup;
    function popup(){ 
            miPopup = window.open("Buscar_Cotizacion.jsp","","width=700,height=700,scrollbars=yes"); 
    }
    function popup2(){ 
	   	miPopup = window.open("Buscar_Cliente.jsp","","width=700,height=700,scrollbars=yes"); 
	}
        
function eliminar(id_fila){

		$('#'+id_fila).remove();

		actualizar();
		reordenar();
	
	}



	function agregar(){


		var cod = document.getElementById("coda").value;
		var nom = document.getElementById("nom").value;
		var tal = document.getElementById ("tall").value;
		var pre = document.getElementById ("pre").value;
		var can = document.getElementById ("can").value;
		var esp = document.getElementById ("espe").value;
		cont++;
                var monto=(pre*can);
                
		var fila='<tr id="fila'+cont+'" onclick="seleccionar(this.id)"><th>'+cont+'</th><th><input type="text" style="border: 0;"name="cod" value="'+cod+'" autofocus readonly/>\n\
                            </th><th><input type="text" style="border: 0;" name="nom" value="'+nom+'" autofocus readonly/>\n\
                            </th><th><input type="text" style="border: 0;" name="tal" value="'+tal+'" autofocus readonly/></th><th><input type="text" \n\
                            class="pre" style="border: 0;" name="pre"  value="'+pre+'" autofocus readonly/></th><th><input type="text" class="can"\n\
                             style="border: 0;" name="can" id="can"  value="'+can+'" autofocus readonly/></th><td><input type="text" name="esss" id="esss" value="'+esp+'" autofocus readonly/></td><th><input type="text" class="monto" name="mon"\n\
                             id="mon" value="'+monto+'" autofocus readonly/></th></tr>';
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

			$(this).find('th').eq(0).text(num);
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

<%
    
    
String ccc = "";

String c = "";
String f = "";

String s = "";
String n = "";
String d = "";

String a1 = "";
String a2 = "";
String a3 = "";

   if(request.getParameter("cargar") != null){
       
       ccc=request.getParameter("cod_pe");
       
       c=request.getParameter("cod_co");
       f=request.getParameter("fec_co");
       
       s=request.getParameter("nom_c");
       n=request.getParameter("dni_c");
       d=request.getParameter("dir_c");
       
       a1=request.getParameter("sub_t");
       a2=request.getParameter("igv");
       a3=request.getParameter("total");
          
   }

%>
<body>
<form class="needs-validation " name="form2">  
    
    <h2 class="display-4 text-center py-5">Realizar pedido</h2>
    <div class="container">
        
        <div class="input-group mb-3">
          <div class="input-group-prepend">
            <span class="input-group-text" >Codigo Pedido: </span>
          </div>
          <input type="text" class="form-control" id="cod_pe" value="<%=ccc%>" name="cod_pe">
        </div>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-6">           
                    <div class="form-row">
                      <div class="col-md-12 mb-3">
                        <label for="nom_c">Cliente</label>
                        <input type="text" class="form-control" id="nom_c" name="nom_c" value="<%=s%>"  readonly>
                      </div>
                      <div class="col-md-12 mb-3">
                        <label for="dni">Documento</label>
                        <input type="text" class="form-control" id="dni_c" name="dni_c" value="<%=n%>" readonly>            
                      </div>
                      <div class="col-md-12 mb-3">
                        <label for="dir">Direccion</label>
                        
                        <input type="text" class="form-control" id="dir_c" name="dir_c" value="<%=d%>" readonly>
                        
                      </div>
                    </div>            
                    <input type="button" value="Buscar cliente" onclick="popup2()">
                
            </div>
            <div class="col-6">  
                    <div class="form-row">
                      <div class="col-md-12 mb-3">
                        <label for="cod_co">Codigo</label>
                        <input type="text" class="form-control" id="cod_co" name="cod_co" value="<%=c%>"  readonly>
                      </div>
                      <div class="col-md-12 mb-3">
                        <label for="fec_co">Fecha emision</label>
                        <input type="text" class="form-control" id="fec_co" name="fec_co" value="<%=f%>" readonly>
                      </div>
                    </div>
                    <input type="button" value="Buscar Cotizacion" onclick="popup()">
                    <button class="btn btn-success float-right rounded" name="cargar" type="submit">Cargar</button>
                     
            </div>
        </div>
    </div>
    
    
    

  
    
   
    
    <div class="container py-3">
        
        <h2 class="display-5 text-center py-5">Agregar Productos</h2>
        <div class="input-group mb-3">
            <div class="input-group-prepend">
              <select class="custom-select" id="opcion" name="opcion">
                <option value="1">Nombre</option>
                <option value="2">COD</option>
              </select>
            </div>
            <input type="text" class="form-control" name="formulario" id="formulario">
          </div>

    </div>
    <div class="container text-center">
            <div class="table-responsive">
                
                <table class="table text-center ">
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

			if (cod==='2' && codi.indexOf(texto) !== -1) {

                                 body.innerHTML += "<th><input type='text' id='coda' style='border: 0;' value='"+insumo.codi+"' autofocus readonly/></th><th ><input type='text' style='border: 0;' id='nom' value='"+insumo.nombre+"' autofocus readonly/></th><th ><input type='text' style='border: 0;' id='tall' value='"+insumo.talla+"' autofocus readonly/></th><th ><input type='text' style='border: 0;' id='pre'  value='"+insumo.precio+"' autofocus readonly/></th><th ><input type='text'  id='can' /></th><td ><textarea id='espe' rows='2' cols='10'></textarea></td><th><input type='button' onclick='agregar()' value='Agregar' ></th>";
                                                    
			}else if (cod==='1' && nombre.indexOf(texto) !== -1) {

                                body.innerHTML += "<th><input type='text' id='coda' style='border: 0;' value='"+insumo.codi+"' autofocus readonly/></th><th ><input type='text' style='border: 0;' id='nom' value='"+insumo.nombre+"' autofocus readonly/></th><th ><input type='text' style='border: 0;' id='tall' value='"+insumo.talla+"' autofocus readonly/></th><th ><input type='text' style='border: 0;' id='pre'  value='"+insumo.precio+"' autofocus readonly/></th><th ><input type='text'  id='can' /></th><td ><textarea id='espe' rows='2' cols='10'></textarea></td><th><input type='button' onclick='agregar()' value='Agregar' ></th>";

                                                    
			}
		

		}

	};

	formulario.addEventListener('keyup', filtrar);

	filtrar();
        
        temporizador.scheduleAtFixedRate(actualizar, 0, 1000*segundos);
        
        

</script>    

<div class="container text-center">
            <div class="table-responsive">
                
                <table class="table text-center">
                    <caption><b>Detalle Pedido</b></caption>
                    <thead>
                        <tr class="bg-success">
                            <th scope="col">NUM</th>
                            <th scope="col">COD</th>
                            <th scope="col">Nombre</th>
                            <th scope="col">Talla</th>
                            <th scope="col">Precio</th>
                            <th scope="col">Cantidad</th>
                            <th scope="col">Especificaciones</th>
                            <th scope="col">Monto</th>
                        </tr>
                    </thead>
                    <tbody id="tab">
 <%
     
            if(request.getParameter("cod_co") != null){
                
                String cod = request.getParameter("cod_co");
                    
            
                try{
              
                     Class.forName(driver);
                    cn = DriverManager.getConnection(url,user,pass);
                    st = cn.createStatement();
                    rs = st.executeQuery("select idinsumo, nombre, talla, precio, cantidad, especificaciones, monto from det_cot_ins natural join insumo where idcotizacion='"+cod+"'");
                    

                    while(rs.next()){
                                out.println("<script>cont++</script>");
                                out.println("<tr id='fila<script>document.write(cont)</script>' onclick='seleccionar(this.id)' class='table-light'>");
                                out.println("<th><script>document.write(cont)</script></th>");
                                
                                out.println("<th><input type='text' style='border: 0;' name='cod' value='"+rs.getString(1)+"' autofocus readonly/></th>");
                                out.println("<th>"+rs.getString(2)+"</th>");
                                out.println("<th>"+rs.getString(3)+"</th>");
                                out.println("<th>"+rs.getString(4)+"</th>");
                                out.println("<th><input type='text' style='border: 0;' name='can' value='"+rs.getString(5)+"' autofocus readonly/></th>");
                                out.println("<th><input type='text' style='border: 0;' name='esss' id='esss' value='"+rs.getString(6)+"' autofocus readonly/></th>");
                                out.println("<th><input type='text' class='monto' name='mon' id='nom' value='"+rs.getString(7)+"' autofocus readonl/></th>");     
                                 out.println("<th><script>actualizar();reordenar();</script></th>");
                                out.println("</tr>");
                                
                            }
                   
                   
                }catch(ClassNotFoundException e){
                      System.out.print("Clase no encontrada");
                }
                
                 
            }
        %>                       
                        
                        
                        
                        
              
<script> 




	

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
                        <input type="text" class="form-control" id="sub_t"  name="sub_t" value="<%=a1%>"  readonly>          
                      </div>
                      
                      <div class="col-md-4 mb-3">
                        <label for="igv">IGV:</label>
                        <input type="text" class="form-control" id="igv" name="igv"  value="<%=a2%>" readonly>            
                      </div>
                      
                      <div class="col-md-4 mb-6">
                      
                        <label for="total">TOTAL:</label>
                        <input type="text" class="form-control" id="total" name="total" value="<%=a3%>" readonly>     
                      </div>

                    </div>
                    
                        <button class="btn btn-success float-right rounded" name="Guardar" type="submit">Guardar</button>
                    
                   
                </div>
                              
            </div>
        </div>

 </form>
<%
            if(request.getParameter("Guardar") != null){
                
                int cod = Integer.parseInt(request.getParameter("cod_pe"));
                
                int cod_2 = Integer.parseInt(request.getParameter("dni_c"));
                String[] cod_3 = request.getParameterValues("cod");
                int idc = 0 ;
                String[] can = request.getParameterValues("can");
                String[] mo = request.getParameterValues("mon");
                float sub = Float.parseFloat(request.getParameter("sub_t"));
                float igv = Float.parseFloat(request.getParameter("igv"));
                float tot = Float.parseFloat(request.getParameter("total"));  
                String[] es = request.getParameterValues("esss");  

                
                try{
                                
                   
                    Class.forName(driver);
                    cn = DriverManager.getConnection(url,user,pass);
                    st = cn.createStatement();
                    rs = st.executeQuery("select idcliente from cliente where num_doc='"+cod_2+"'");
                    
                    if(rs.next()){
                        
                        idc=Integer.parseInt(rs.getString(1));
                    

                        
                    
                    
                    Class.forName(driver);
                    cn = DriverManager.getConnection(url,user,pass);
                    st = cn.createStatement();
                    st.executeUpdate("insert into pedido values ("+cod+","+idc+",NOW(),"+sub+","+igv+","+tot+",'Terminado')");                   
          
                    for (int i=0;i<cod_3.length;i++) {
                        

                    cn = DriverManager.getConnection(url,user,pass);
                    st = cn.createStatement();
                    st.executeUpdate("insert into det_ped_ins values ("+cod+" ,"+cod_3[i]+",'"+es[i]+"',"+can[i]+","+mo[i]+")");
                            
                    }
                   
                    
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


