<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.io.StringWriter, java.io.PrintWriter" %>

<!DOCTYPE html>
<html>
<head>
    <title>Facturas</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/base.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/components.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/layout.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/facturas.css">
</head>
<body>
  <jsp:include page="/WEB-INF/views/header.jsp">
      <jsp:param name="active" value="5" />
  </jsp:include>
  <main>
    <h1>Facturas</h1>
    <!-- Formulario para buscar facturas por cliente (nombre o apellido) -->
    <div class="div-content">
    <form method="GET">
      <div class="form-group">
        <input type="text" id="cliente" name="cliente" placeholder="Búsqueda por cliente" value="<%= request.getParameter("cliente") != null ? request.getParameter("cliente") : "" %>">
      </div>
      
      <button class="btn btn-primary" type="submit">Buscar</button>
      <button class="btn btn-secondary" type="button" onclick="window.location.href='facturas.jsp'">Cancelar</button>
    </form>
    </div>
    
    <section class="card table-wrapper">
      <table class="table">
        <thead>
          <tr>
            <th>ID Factura</th>
            <th>ID Orden</th>
            <th>Cliente</th>
            <th>Fecha Emisión</th>
            <th>Importe</th>
            <th>Impuesto</th>
            <th>Total</th>
          </tr>
        </thead>
        <tbody>
          <%
              String cliente = request.getParameter("cliente");
              Connection conn = null;
              PreparedStatement pstmt = null;
              ResultSet rs = null;
              try {
                  Class.forName("oracle.jdbc.driver.OracleDriver");
                  conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "taller", "1234");


                  String sql = "SELECT f.id_factura, f.id_orden, c.nombre || ' ' || c.apellido AS nombre_cliente, f.fecha_emision, f.importe, f.impuesto, f.total " +
                               "FROM facturas f " +
                               "JOIN clientes c ON f.id_cliente = c.id_cliente ";
                  if (cliente != null && !cliente.isEmpty()) {
                      sql += "WHERE LOWER(c.nombre || ' ' || c.apellido) LIKE LOWER(?) ";
                  }

                  pstmt = conn.prepareStatement(sql);
                  if (cliente != null && !cliente.isEmpty()) {
                      pstmt.setString(1, "%" + cliente + "%");
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
            <td><%= rs.getInt("id_factura") %></td>
            <td><%= rs.getInt("id_orden") %></td>
            <td><%= rs.getString("nombre_cliente") %></td>
            <td><%= rs.getDate("fecha_emision") %></td>
            <td><%= rs.getDouble("importe") %></td>
            <td><%= rs.getDouble("impuesto") %></td>
            <td><%= rs.getDouble("total") %></td>
          </tr>
          <%
                      }
                  }
              } catch (Exception e) {
                  StringWriter sw = new StringWriter();
                  PrintWriter pw = new PrintWriter(sw);
                  e.printStackTrace(pw);
                  out.println("<div>Error: " + sw.toString() + "</div>");
              } finally {
                  // Cierra los recursos
                  try { if (rs != null) rs.close(); } catch (SQLException e) { e.printStackTrace(new PrintWriter(new StringWriter())); }
                  try { if (pstmt != null) pstmt.close(); } catch (SQLException e) { e.printStackTrace(new PrintWriter(new StringWriter())); }
                  try { if (conn != null) conn.close(); } catch (SQLException e) { e.printStackTrace(new PrintWriter(new StringWriter())); }
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
