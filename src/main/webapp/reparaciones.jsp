<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
  <title>Reparaciones</title>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/base.css">
  <link rel="stylesheet" href="<%=request.getContextPath()%>/css/components.css">
  <link rel="stylesheet" href="<%=request.getContextPath()%>/css/reparaciones.css">
  <link rel="stylesheet" href="<%=request.getContextPath()%>/css/layout.css">
</head>
<body>
  <jsp:include page="/WEB-INF/views/header.jsp">
      <jsp:param name="active" value="7" />
  </jsp:include>
    <main>
      <!-- Acerca de la pagina -->
      <h1>Historial de reparaciones</h1>
      
      <div class="busqueda-principal">
        <!--  Bloque busqueda de matricula -->
        <form action="reparaciones.jsp" method = "POST">
          <div class="form-group">
              <div class="cont-barra-busqueda">
                  <svg class="icono-busqueda" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><!--!Font Awesome Free 6.5.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.--><path d="M416 208c0 45.9-14.9 88.3-40 122.7L502.6 457.4c12.5 12.5 12.5 32.8 0 45.3s-32.8 12.5-45.3 0L330.7 376c-34.4 25.2-76.8 40-122.7 40C93.1 416 0 322.9 0 208S93.1 0 208 0S416 93.1 416 208zM208 352a144 144 0 1 0 0-288 144 144 0 1 0 0 288z"/></svg>
                  <input
                    class="barra-busqueda"
                    type="text"
                    name="busqueda-matricula"
                    id="busqueda-matricula"
                    placeholder="Escribir matrícula"
                  />
                </div>
                <input type="submit" value="Buscar" class="btn btn-primary"/>         
            </div>
        </form>

        <form action="reparaciones.jsp" method="POST">
          <!-- Campo oculto que tiene el valor de true, para restablecer los valores de la tabla -->
          <input type="hidden" name="restablecer" value="true">

          <!-- Botón para enviar el formulario -->
          <input type="submit" value="Cancelar" class="btn-restablecer btn btn-secondary"/>         
        </form>
      </div>

      <div class="card card-body filtros-contenedor">
        <!--  Bloque filtros -->
        <div class="filtro-row">
        <p class="tag-filtros">Filtrar por:</p>
        <form action="reparaciones.jsp" method="post">
          <div class="barra-filtros">            
            <!-- Filtro cliente -->
            <div class="form-group">	
              <select name="filtro-cliente">
                <option hidden disabled selected>Cliente</option>
                <%
                    try {
                      //Consulta que trae el nombre de todos los clientes de la BD
                        String query = "SELECT nombre || ' ' || apellido AS nombre_completo FROM clientes ORDER by nombre ASC";
                        
                        // Cargar el controlador 
                        Class.forName("oracle.jdbc.driver.OracleDriver");
                        
                        // Conexión a la base de datos 
                        Connection conexionBD = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "taller", "1234");
                        
                        Statement instruccion = conexionBD.createStatement();
                        
                        ResultSet resultado = instruccion.executeQuery(query);
            
                        //si existen registros, se ejecuta
                        while(resultado.next()) {
                          String nombreCompleto = resultado.getString("nombre_completo");
                           
                %>
                <option value="<%=nombreCompleto %>"><%=nombreCompleto %></option>            
                <%
                    }
                  } catch (Exception e) {
                      out.println(e);
                  }
                %>		
              </select>
            </div>     
	   			
            <!-- Filtro automovil -->
            <div class="form-group">	
              <select name="filtro-automovil">
                <option hidden disabled selected>Automovil</option>
                <%
                    try {
                      //Consulta que trae el nombre de todos los automoviles de la BD
                      String query = "SELECT DISTINCT marca FROM automoviles ORDER BY marca ASC";
                      
                      // Cargar el controlador
                      Class.forName("oracle.jdbc.driver.OracleDriver");
                      
                      // Conexión a la base de datos 
                      Connection conexionBD = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "taller", "1234");
                      
                      Statement instruccion = conexionBD.createStatement();
                      
                      ResultSet resultado = instruccion.executeQuery(query);
          
                      //si existen registro se ejecutan
                      while(resultado.next()) {
                        String marca = resultado.getString("marca");
                %>
                <option value="<%=marca %>"><%=marca %></option>            
                <%
                        }

                    } catch (Exception e) {
                        out.println(e);
                    }
                 %>		
              </select>
            </div>
	   			
            <!-- Filtro mecanico -->
            <div class="form-group">
              <select name="filtro-mecanico">
                <option hidden disabled selected>Mecánico</option>
                <%
                    try {
                      //Consulta que trae el nombre de todos los mecanicos de la BD
                      String query = "SELECT nombre || ' ' || apellido AS nombre_completo FROM mecanicos ORDER BY nombre ASC";
                      
                      // Cargar el controlador
                      Class.forName("oracle.jdbc.driver.OracleDriver");
                      
                      // Conexión a la base de datos
                      Connection conexionBD = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "taller", "1234");
                      
                      Statement instruccion = conexionBD.createStatement();
                      
                      ResultSet resultado = instruccion.executeQuery(query);
          
                      //Si existen registros se ejecutan
                      while(resultado.next()) {
                        String nombreCompleto = resultado.getString("nombre_completo");
                %>
                <option value="<%=nombreCompleto %>"><%=nombreCompleto %></option>            
                <%
                    }

                  } catch (Exception e) {
                      out.println(e);
                  }
                %>		
              </select>
            </div>

              <!-- Filtros fechas inicio-fin -->
              <div class="form-group">
                <input name="fecha-inicio" id="fechaInicio" class="fecha-input" type = "text" placeholder="Fecha inicio" onfocus="(this.type='date')" />
                <input name="fecha-fin" id="fechaFin" class="fecha-input" type = "text" placeholder="Fecha fin" onfocus="(this.type='date')" />
              </div>
              <input type="submit" value="Filtrar" class="btn btn-primary"/>
            </div>
          </form>
        </div>

        <div>
          <!-- Bloque ordenamiento -->
          <p class="tag-filtros">Ordenar por:</p>
          <form action="reparaciones.jsp" method="POST">
            <div class="barra-ordenamiento">
              <div class="form-group">
                <select name="orden-categoria">
                  <option hidden disabled selected>Categoría</option>
                  <option value="c.nombre">Cliente</option> 
                  <option value="a.marca">Automóvil</option>
                  <option value="m.nombre">Mecánico</option>
                  <option value="ot.fecha_fin">Fecha reparación</option>
                </select>
              </div>
              
              <div class="form-group">
                <select name="orden-forma">
                  <option hidden disabled selected>Forma</option>
                  <option value="asc">Ascendente</option>
                  <option value="desc">Descendente</option>
                </select>			
              </div>
              <input type="submit" value="Ordenar" class="btn btn-primary"/>
            </div>
          </form>
        </div>
      </div>



            <div class="table-card" style="overflow-x:auto; margin:30px 0">
                <table class="table">
                  <thead>
                    <tr>
                      <th>Cédula del cliente</th>
                      <th>Nombre del cliente</th>
                      <th>Matrícula del automóvil</th>
                      <th>Modelo del automóvil</th>
                      <th>Cédula del mecánico encargado</th>
                      <th>Nombre del mecánico encargado</th>
                      <th>Descripción</th>
                      <th>Fecha de reparación</th>
                      <th>Costo del servicio</th>
                    </tr>
                  </thead>
                  <tbody>
                <%
                String busquedaMatricula = request.getParameter("busqueda-matricula");
                String filtroCliente = request.getParameter("filtro-cliente");
                String filtroAutomovil = request.getParameter("filtro-automovil");
                String filtroMecanico = request.getParameter("filtro-mecanico");
                String fechaInicio = request.getParameter("fecha-inicio");
                String fechaFin = request.getParameter("fecha-fin");
				String ordenCategoria = request.getParameter("orden-categoria");
				String ordenForma = request.getParameter("orden-forma");
				String restablecerTabla = request.getParameter("restablecer");
				
                
                try {
                	//vista de sql, que se almacenará en la tabla de historial de reparaciones
                	String query = "SELECT "
                	        + "c.cedula AS cedula_cliente, "
                	        + "c.nombre || ' ' || c.apellido AS nombre_cliente, "
                	        + "a.matricula, "
                	        + "a.marca || '-' || a.modelo AS modelo_carro, "
                	        + "m.dpi AS cedula_mecanico, "
                	        + "m.nombre || ' ' || m.apellido AS nombre_mecanico, "
                	        + "s.descripcion, "
                	        + "TO_CHAR(ot.fecha_fin, 'Month DD, YYYY', 'NLS_DATE_LANGUAGE=SPANISH') AS fecha_fin, "
                	        + "f.total "
                	        + "FROM orden_trabajo ot "
                	        + "INNER JOIN clientes c ON ot.id_cliente = c.id_cliente "
                	        + "INNER JOIN automoviles a ON ot.id_automovil = a.id_automovil "
                	        + "INNER JOIN asignaciones asig ON ot.id_orden = asig.id_orden "
                	        + "INNER JOIN mecanicos m ON asig.id_mecanico = m.id_mecanico "
                	        + "INNER JOIN servicios s ON ot.id_servicio = s.id_servicio "
                	        + "INNER JOIN facturas f ON ot.id_orden = f.id_orden";
                   
                        
                    	                    	
                        //Determina si existe o no condiciones en la consulta
                        boolean condicionesAgregadas = false;
                        //Determina si el registro existe
                        boolean isRegistro = false;
                        
                        if (busquedaMatricula != null && !busquedaMatricula.isEmpty()) {
                            busquedaMatricula = busquedaMatricula.toUpperCase();
                        	query += " WHERE a.matricula = '" + busquedaMatricula + "'";
                            condicionesAgregadas = true;
                        }
                        
                        if (filtroCliente != null && !filtroCliente.isEmpty()) {
                            if (condicionesAgregadas) {
                                query += " AND c.nombre || ' ' || c.apellido = '" + filtroCliente + "'";
                            } else {
                                query += " WHERE c.nombre || ' ' || c.apellido = '" + filtroCliente + "'";
                                condicionesAgregadas = true;
                            }
                        }
                        
                        if (filtroAutomovil != null && !filtroAutomovil.isEmpty()) {
                            if (condicionesAgregadas) {
                                query += " AND a.marca = '" + filtroAutomovil + "'";
                            } else {
                                query += " WHERE a.marca = '" + filtroAutomovil + "'";
                                condicionesAgregadas = true;
                            }
                        }
                        
                        if (filtroMecanico != null && !filtroMecanico.isEmpty()) {
                            if (condicionesAgregadas) {
                                query += " AND m.nombre || ' ' || m.apellido = '" + filtroMecanico + "'";
                            } else {
                                query += " WHERE m.nombre || ' ' || m.apellido = '" + filtroMecanico + "'";
                                condicionesAgregadas = true;
                            }
                        }

                        if (fechaInicio != null && !fechaInicio.isEmpty() && fechaFin != null && !fechaFin.isEmpty()) {
                            if (condicionesAgregadas) {
                                query += " AND ot.fecha_fin BETWEEN TO_DATE('" + fechaInicio + "', 'YYYY-MM-DD') AND TO_DATE('" + fechaFin + "', 'YYYY-MM-DD')";
                            } else {
                                query += " WHERE ot.fecha_fin BETWEEN TO_DATE('" + fechaInicio + "', 'YYYY-MM-DD') AND TO_DATE('" + fechaFin + "', 'YYYY-MM-DD')";
                                condicionesAgregadas = true;
                            }
                        }
                        
                        // Agrega el ordenamiento si es necesario
                        if (ordenCategoria != null && !ordenCategoria.isEmpty() && ordenForma != null && !ordenForma.isEmpty()) {
                            query += " ORDER BY " + ordenCategoria + " " + ordenForma;
                        }
                        

                        
                        // Cargar el controlador
                        Class.forName("oracle.jdbc.driver.OracleDriver");
                        
                        // Conexión a la base de datos 
                        Connection conexionBD = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "taller", "1234");
                        
                        Statement instruccion = conexionBD.createStatement();
                        
                        ResultSet resultado = instruccion.executeQuery(query);

                        while(resultado.next()) {
                        	String cedulaCliente = resultado.getString("cedula_cliente");
                        	String nombreCliente = resultado.getString("nombre_cliente");
                        	String matricula = resultado.getString("matricula");
                        	String modeloCarro = resultado.getString("modelo_carro");
                        	String cedulaMecanico = resultado.getString("cedula_mecanico");
                        	String nombreMecanico = resultado.getString("nombre_mecanico");                        
                        	String descripcion = resultado.getString("descripcion");
                        	String fecha = resultado.getString("fecha_fin");
                        	String montoTotal = resultado.getString("total");
                        	double montoTotalDouble = Double.parseDouble(montoTotal);
                        	String montoTotalFormateado = String.format("%.2f", montoTotalDouble);
                        	isRegistro = true;                           
                %>
					<tr>
						<td><%=cedulaCliente %></td>
						<td><%=nombreCliente %></td>
						<td><%=matricula %></td>
						<td><%=modeloCarro %></td>
						<td><%=cedulaMecanico %></td>
						<td><%=nombreMecanico %></td>
						<td><%=descripcion %></td>
						<td><%=fecha %></td>
						<td>$<%=montoTotalFormateado %></td>
					</tr>
                <%
               }                
                if(!isRegistro){
                	%>
                	<tr>
                		<td colspan="5">No hay registros disponibles</td>
                	</tr>
                	<%
                }

                        resultado.close();
                        instruccion.close();
                        conexionBD.close();
                    } catch (Exception e) {
                        out.println(e);
                    }
                %>
					
                  </tbody>
                </table>
              </div>
              
      		
              
              






        

        


            </main>
  <%@ include file="/WEB-INF/views/footer.jsp" %>
  
  <script>



  

  </script>
</body>
</html>
