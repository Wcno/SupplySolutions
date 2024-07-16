<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.io.StringWriter, java.io.PrintWriter" %>

<!DOCTYPE html>
<html>
<head>
    <title>Órdenes de Trabajo</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/base.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/components.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/layout.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/orden_trabajo.css">
</head>
<body>
  <jsp:include page="/WEB-INF/views/header.jsp">
      <jsp:param name="active" value="6" />
  </jsp:include>
  <main>
    <h1>Órdenes de Trabajo</h1>
    <!-- Formulario para buscar órdenes de trabajo por ID -->
    <div class="div-content">
    <form method="GET">
      <div class="form-group">
        <input type="number" step="1" id="orden" name="orden" placeholder="Búsqueda por ID de Orden" value="<%= request.getParameter("orden") != null ? request.getParameter("orden") : "" %>">
      </div>
      <button class="btn btn-primary" type="submit">Buscar</button>
      <button class="btn btn-secondary" type="button" onclick="window.location.href='orden-trabajo.jsp'">Cancelar</button>
    </form>
    </div>
    
    <section class="card table-wrapper">
      <table class="table">
        <thead>
          <tr>
            <th>ID Orden</th>
            <th>Cliente</th>
            <th>Automóvil</th>
            <th>Descripción del Servicio</th>
            <th>Fecha Publicación</th>
            <th>Fecha Fin</th>
            <th>Estado</th>
          </tr>
        </thead>
        <tbody>
          <%
              String orden = request.getParameter("orden");
              Connection conn = null;
              PreparedStatement pstmt = null;
              ResultSet rs = null;
              try {
                  Class.forName("oracle.jdbc.driver.OracleDriver");
                  conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "taller", "1234");

                  String sql = "SELECT o.id_orden, c.nombre || ' ' || c.apellido AS nombre_cliente, a.marca || ' ' || a.modelo AS automovil, s.descripcion, o.fecha_publicacion, o.fecha_fin, o.estado " +
                               "FROM orden_trabajo o " +
                               "JOIN clientes c ON o.id_cliente = c.id_cliente " +
                               "JOIN automoviles a ON o.id_automovil = a.id_automovil " +
                               "JOIN servicios s ON o.id_servicio = s.id_servicio ";
                  if (orden != null && !orden.isEmpty()) {
                      sql += "WHERE o.id_orden = ? ";
                  }

                  pstmt = conn.prepareStatement(sql);
                  if (orden != null && !orden.isEmpty()) {
                      pstmt.setInt(1, Integer.parseInt(orden));
                  }

                  rs = pstmt.executeQuery();

                  if (!rs.isBeforeFirst()) {
                      %>
                      <tr>
                          <td colspan="7">
                            <div class="no-records">
                              No se encontraron órdenes de trabajo para el ID especificado.
                            </div>
                          </td>
                      </tr>
                      <%
                  } else {
                      while (rs.next()) {
          %>
          <tr>
            <td><%= rs.getInt("id_orden") %></td>
            <td><%= rs.getString("nombre_cliente") %></td>
            <td><%= rs.getString("automovil") %></td>
            <td><%= rs.getString("descripcion") %></td>
            <td><%= rs.getDate("fecha_publicacion") %></td>
            <td><%= rs.getDate("fecha_fin") %></td>
            <td><%= rs.getString("estado") %></td>
          </tr>
          <%
                      }
                  }
              } catch (Exception e) {
                  StringWriter sw = new StringWriter();
                  e.printStackTrace(new PrintWriter(sw));
                  out.println("<div>Error: " + sw.toString() + "</div>");
              } finally {
                  // Cierra los recursos
                  try { if (rs != null) rs.close(); } catch (SQLException e) { e.printStackTrace(); }
                  try { if (pstmt != null) pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
                  try { if (conn != null) conn.close(); } catch (SQLException e) { e.printStackTrace(); }
              }
          %>
        </tbody>
      </table>
    </section>
  </main>
  
  <!-- Incluye el footer -->
  <%@ include file="/WEB-INF/views/footer.jsp" %>
</body>
</html>
