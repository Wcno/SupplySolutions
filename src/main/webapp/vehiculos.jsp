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
  
  <title>Registro de Vehículo</title>
</head>
<body>
    <jsp:include page="/WEB-INF/views/header.jsp">
        <jsp:param name="active" value="3" />
    </jsp:include>

    <%
        String id_clienteStr = request.getParameter("id_cliente");
        String modelo = request.getParameter("modelo");
        String marca = request.getParameter("marca");
        String matricula = request.getParameter("matricula");
        String color = request.getParameter("color");

        if (id_clienteStr != null && modelo != null && marca != null && matricula != null && color != null) {
            int id_cliente = Integer.parseInt(id_clienteStr);

            String url = "jdbc:oracle:thin:@localhost:1521:xe";
            String dbuser = "taller";
            String dbpassword = "1234";

            try {
                Class.forName("oracle.jdbc.driver.OracleDriver");
                Connection dbconection = DriverManager.getConnection(url, dbuser, dbpassword);

                String sql = "INSERT INTO automoviles (id_automovil, id_cliente, modelo, marca, matricula, color) " +
                             "VALUES (seq_automoviles.NEXTVAL, ?, ?, ?, ?, ?)";

                PreparedStatement pstmt = dbconection.prepareStatement(sql);
                pstmt.setInt(1, id_cliente);
                pstmt.setString(2, modelo);
                pstmt.setString(3, marca);
                pstmt.setString(4, matricula);
                pstmt.setString(5, color);

                int result = pstmt.executeUpdate();

                if (result > 0) {
                    response.sendRedirect("vehiculos.jsp?success=true");
                } else {
                    out.println("<h3>Error al registrar el vehículo.</h3>");
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
          <h1>Registro de Vehículo</h1>
          <p>Por favor, complete el formulario a continuación para registrar su vehículo en nuestro taller automotriz. Esto nos permitirá brindar un mejor servicio y mantener un historial detallado de las reparaciones realizadas.</p>
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
          <p>¡Éxito! El vehículo fue registrado.</p>
        </div>
        <%
          }
        %>
        <section>
          <form class="form" method="post">
            <div class="form-fields card card-body">
              <div class="input-group form-group">
                <label for="id_cliente" class="label" id="id_cliente">Cliente</label>
                <select name="id_cliente" id="id_cliente" class="select-input" required>
                  <option value="">-- Seleccione --</option>
                  <%
                      String url = "jdbc:oracle:thin:@localhost:1521:xe";
                      String dbuser = "taller";
                      String dbpassword = "1234";

                      Class.forName("oracle.jdbc.driver.OracleDriver");
                      Connection dbconection = DriverManager.getConnection(url, dbuser, dbpassword);
                      Statement state = dbconection.createStatement();

                      String sql = "SELECT id_cliente, nombre, apellido FROM clientes";
                      ResultSet clientes = state.executeQuery(sql);
                      while (clientes.next()) {
                          int id_cliente = clientes.getInt("id_cliente");
                          String nombre_cliente = clientes.getString("nombre") + " " + clientes.getString("apellido");
                  %>
                  <option value="<%= id_cliente %>"><%= nombre_cliente %></option>
                  <%
                      }
                      clientes.close();
                      state.close();
                      dbconection.close();
                  %>
                </select>
              </div>
              <div class="input-group form-group">
                <label for="modelo" class="label" id="modelo">Modelo</label>
                <input type="text" class="text-input" id="modelo" name="modelo" required />
              </div>
              <div class="input-group form-group">
                <label for="marca" class="label" id="marca">Marca</label>
                <input type="text" class="text-input" id="marca" name="marca" required />
              </div>
              <div class="input-group form-group">
                <label for="matricula" class="label" id="matricula">Matrícula</label>
                <input type="text" class="text-input" id="matricula" name="matricula" required />
              </div>
              <div class="input-group form-group">
                <label for="color" class="label" id="color">Color</label>
                <input type="text" class="text-input" id="color" name="color" required />
              </div>
            </div>
               <div class="form-footer">
              <button class="btn btn-primary" type="submit">
                Registrar
              </button>
            </div>
           
          </form>
        </section>
      </div>
    </main>
    <%@ include file="/WEB-INF/views/footer.jsp" %>
</body>
</html>
