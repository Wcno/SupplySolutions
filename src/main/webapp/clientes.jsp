<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="ISO-8859-1">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="<%=request.getContextPath()%>/css/layout.css">
  <link rel="stylesheet" href="<%=request.getContextPath()%>/css/base.css">
  <link rel="stylesheet" href="<%=request.getContextPath()%>/css/components.css">
  <link rel="stylesheet" href="<%=request.getContextPath()%>/css/registro.css">
  
  <title>Registro de Cliente</title>
  
</head>
<body>
    <jsp:include page="/WEB-INF/views/header.jsp">
        <jsp:param name="active" value="2" />
    </jsp:include>

    <%
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String cedula = request.getParameter("cedula");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String telefono = request.getParameter("telefono");
        String ciudad = request.getParameter("ciudad");
        String id_provinciaStr = request.getParameter("id_provincia");

        if (nombre != null && apellido != null && cedula != null && email != null && password != null && telefono != null && ciudad != null && id_provinciaStr != null) {
            int id_provincia = Integer.parseInt(id_provinciaStr);

            String url = "jdbc:oracle:thin:@localhost:1521:xe";
            String dbuser = "taller";
            String dbpassword = "1234";

            try {
                Class.forName("oracle.jdbc.driver.OracleDriver");
                Connection dbconection = DriverManager.getConnection(url, dbuser, dbpassword);

                String sql = "INSERT INTO clientes (id_cliente, id_provincia, nombre, apellido, cedula, email, password, telefono, ciudad) " +
                             "VALUES (seq_clientes.NEXTVAL, ?, ?, ?, ?, ?, ?, ?, ?)";

                PreparedStatement pstmt = dbconection.prepareStatement(sql);
                pstmt.setInt(1, id_provincia);
                pstmt.setString(2, nombre);
                pstmt.setString(3, apellido);
                pstmt.setString(4, cedula);
                pstmt.setString(5, email);
                pstmt.setString(6, password);
                pstmt.setString(7, telefono);
                pstmt.setString(8, ciudad);

                int result = pstmt.executeUpdate();

                if (result > 0) {
                    response.sendRedirect("clientes.jsp?success=true");
                } else {
                    out.println("<h3>Error al registrar el cliente.</h3>");
                }

                pstmt.close();
                dbconection.close();
            } catch (Exception e) {
                e.printStackTrace();
                out.println("<h3>Error: " + e.getMessage() + "</h3>");
            }
        }
    %>

    <main>
      <div class="content">
      <div class="form-title"> 
          <h1>Registro de Clientes</h1>
         <p>Bienvenido al Taller Automotriz. Por favor, complete el formulario a continuación para registrarse como cliente. Esto nos permitirá brindarle un mejor servicio y mantener un historial detallado de su vehículo y las reparaciones realizadas.</p>
      </div>
        <%
          if ("true".equals(request.getParameter("success"))) {
        %>
        <div class="notification success">
          <div class="success-icon">
            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="0.5" stroke="currentColor">
              <path stroke-linecap="round" stroke-linejoin="round" d="M9 12.75 11.25 15 15 9.75M21 12a9 9 0 1 1-18 0 9 9 0 0 1 18 0Z" />
            </svg>
          </div>
          <p>Exito! El cliente fue registrado!</p>
          
        </div>
        <%
          }
        %>
        <section>
          <form class="form" method="post">
            <div class="form-fields card card-body">
              <div class="input-group form-group">
                <label for="nombre" class="label" id="nombre">Nombre</label>
                <input type="text" class="text-input" id="nombre" name="nombre" required />
              </div>
              <div class="input-group form-group">
                <label for="apellido" class="label" id="apellido">Apellido</label>
                <input type="text" class="text-input" id="apellido" name="apellido" required />
              </div>
              <div class="input-group form-group">
                <label for="cedula" class="label" id="cedula">Cédula</label>
                <input type="text" class="text-input" id="cedula" name="cedula" placeholder="8-1292-129" required />
              </div>
              <div class="input-group form-group">
                <label for="email" class="label" id="email">Email</label>
                <input type="email" class="text-input" id="email" name="email" required />
              </div>
               <div class="input-group form-group">
                <label for="ciudad" class="label" id="ciudad">Ciudad</label>
                <input type="text" class="text-input" id="ciudad" name="ciudad" required />
              </div>
             
              <div class="input-group form-group">
                <label for="telefono" class="label" id="telefono">Teléfono</label>
                <input type="text" class="text-input" id="telefono" placeholder="+507" name="telefono" required />
              </div>
              <div class="input-group form-group">
                <label for="password" class="label" id="password">Contraseña</label>
                <input type="password" class="text-input" id="password" name="password" required />
              </div>
              <div class="input-group form-group">
                <label for="id_provincia" class="label" id="id_provincia">Provincia</label>
                <select name="id_provincia" id="id_provincia" class="select-input" required>
                    <option value="">-- Seleccione --</option>
                    <option value="10001">Panamá</option>
                    <option value="10002">Coclé</option>
                    <option value="10003">Colón</option>
                    <option value="10004">Veraguas</option>
                    <option value="10005">Los Santos</option>
                    <option value="10006">Bocas del Toro</option>
                    <option value="10007">Chiriquí</option>
                    <option value="10008">Panamá Oeste</option>
                </select>
              </div>
            </div>
              <div class="form-footer">
              <button class="btn btn-primary" type="submit">
                Registrarse
              </button>
            </div>
          </form>
        </section>
      </div>
    </main>
    <%@ include file="/WEB-INF/views/footer.jsp" %>
</body>
</html>
