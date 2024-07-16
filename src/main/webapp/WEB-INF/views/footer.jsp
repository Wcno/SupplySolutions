<!--
  Esta página esta diseñada para reutilizar el header y permitir que los cambios sean sencillos
  y consistentes a través de las páginas
-->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
  String[] labels = {"Home", "Sobre Nosotros", "Clientes", "Vehículos", "Mecánicos", "Facturas", "Ordenes", "Historial"};
  String[] links = {"/home.jsp", "/sobre-nosotros.jsp", "/clientes.jsp", "vehiculos.jsp", "/mecanicos.jsp", "/facturas.jsp", "/orden-trabajo.jsp", "reparaciones.jsp"};
%>

<footer class="bottombar">
  <section class="menu">
      <%
        String active =  request.getParameter("active");
        for (int i = 0; i < links.length; i++) { 
      %>
        <a class='menu-link' href="<%= links[i] %>">
          <%= labels[i] %>
        </a>
      <%
        }
      %>
  </section>
  <section class="info">
    <div class="left">
      <p class="copywrite">© 2024 Supply Solutions. Todos los derechos reservados.</p>
    </div>
    <div class="right">
      <a class="logout" href="/login-cliente.jsp">
        <span>Salir</span>
        <div class="icon">
          <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><path d="M377.9 105.9L500.7 228.7c7.2 7.2 11.3 17.1 11.3 27.3s-4.1 20.1-11.3 27.3L377.9 406.1c-6.4 6.4-15 9.9-24 9.9c-18.7 0-33.9-15.2-33.9-33.9l0-62.1-128 0c-17.7 0-32-14.3-32-32l0-64c0-17.7 14.3-32 32-32l128 0 0-62.1c0-18.7 15.2-33.9 33.9-33.9c9 0 17.6 3.6 24 9.9zM160 96L96 96c-17.7 0-32 14.3-32 32l0 256c0 17.7 14.3 32 32 32l64 0c17.7 0 32 14.3 32 32s-14.3 32-32 32l-64 0c-53 0-96-43-96-96L0 128C0 75 43 32 96 32l64 0c17.7 0 32 14.3 32 32s-14.3 32-32 32z"/></svg>
        </div>
      </a>
    </div>
  </section>
</footer>
