<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%
    boolean error = false;
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    String msg = "";
    
 	  // Debugging output
    // out.println("Email: " + email + "<br>");
    // out.println("Password: " + password + "<br>");

    
    if ("POST".equalsIgnoreCase(request.getMethod())) {
      try {
          // Cargar el controlador de Oracle
          Class.forName("oracle.jdbc.driver.OracleDriver");
          
          // Conexión a la base de datos utilizando el nombre del servicio
          Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "taller", "1234");
          
          // Preparar y ejecutar la consulta
          PreparedStatement ps = conn.prepareStatement("SELECT * FROM mecanicos WHERE email=? AND password=?");
          ps.setString(1, email);
          ps.setString(2, password);
          
          
          //Ejecutamos consulta y obtenemos un resulSet
          ResultSet resultados = ps.executeQuery();
          
          // Debugging output
          // out.println("Query executed<br>");

          //Recorremos el ResultSet para ver si NO esta vacio.
          if(resultados.next())
            response.sendRedirect("home.jsp");
          else
            error = true;
          
          // Cerrar la conexión
          ps.close();
          conn.close();
      } catch (Exception e) {
          out.print(e);
      }
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Supply Solutions</title>
    <link rel="stylesheet" href="css/base.css" />
    <link rel="stylesheet" href="css/components.css" />
    <link rel="stylesheet" href="css/login.css">
	
</head>

<body>  
    <div class="div_container">
      <section class="logo_container">
        <a href="#">
          <img
            src="images/logo.png"
            alt="Descripción de la imagen"
            class="img_mecanico"
          />
        </a>
      </section>

      <section class="iniciar-sesion-container">
        <h2 class="bienvenido">Bienvenido!</h2>
        <form method="post">
          <div class="fields">
            <div class="form-group">
              <label for="email">Email</label>
              <input type="text" name="email" placeholder="Usuario@gmail.com" />
              <%if (error) {%>
              <span class="error">Uufff...estan mal tus credenciales</span>
              <%}%>
            </div>
            <div class="form-group">
              <label for="password">Contraseña</label>
              <input type="password" name="password" placeholder="Contraseña" />
            </div>
          </div>
          <div>
            <p class="forgot-password"><a href="#">Olvidé mi contraseña</a></p>
            <button class="btn btn-primary">Iniciar Sesión</button>
          </div>
          <div>
            <p class="register-link">
              ¿Eres un cliente? <a href="login-cliente.jsp">Inicia Sesión Aquí</a>
            </p>
            <p class="register-link">
              ¿Aún no estás registrado? <a href="#">Regístrate</a>
            </p>
          </div>
        </form>
      </section>
    </div>
</body>
</html>
