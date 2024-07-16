<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <title>Home</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/base.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/components.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/home.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/layout.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/sobre-nosotros.css">
</head>
<body>
  <!-- 
    Componente parcial jsp para incluir la barra superior.
    Value representa la posición de la opción iniciando de 0
  -->
  <jsp:include page="/WEB-INF/views/header.jsp">
      <jsp:param name="active" value="0" />
  </jsp:include>
  <main>
      <!-- Banner epico -->
      <section class="hero">
        <div class="logo">
          <img src="images/logo.png" alt="logo" />
          <h1>Supply Solutions</h1>
          <div class="login">
            <p>Interesado?</p>
            <a href="/login-cliente.jsp" class="btn btn-primary">
              Inicia Sesión
            </a>
          </div>
        </div>
      </section>

      <!-- Descripción de la empresa -->
      <section class="description">
        <h2>Quienes somos</h2>
        <div class="card description-item">
          <div class="description-item-content">
            <p>
              En Supply Solutions, nos dedicamos a ofrecer un servicio automotriz integral y de alta calidad,
              diseñado para satisfacer todas las necesidades de tu vehículo. Con más de [Número de años] años de
              experiencia en el sector, nuestro objetivo es garantizar la seguridad y el rendimiento óptimo de tu
              automóvil a través de soluciones eficientes y confiables.
            </p>
            <br>
            <strong>Contáctanos</strong>
            <p>
              Para más información o para agendar una cita, no dudes en contactarnos a través de [Teléfono] o [Email].
              También puedes visitarnos en Via España para un diagnóstico gratuito.
            </p>
          </div>
          <img src="/images/taller.jpeg" alt="taller" />
        </div>
      </section>

      <!-- Noticias -->
      <section class="news">
        <h2>Noticias</h2>
        <div class="news-links">
          <a href="https://alianzaautomotriz.com/talleres-de-agencias-la-formula-del-exito/" target="blank">
            <div class="card news-link">
              <div class="news-img" style="background-image: url('images/noticia1.jpeg')"></div>
              <div class="news-description">
                <h3>Talleres de agencias, la fórmula del éxito</h3>
                <p>
                  Capacitación, comunicación y rapidez son algunos de los elementos de los que algunas armadoras
                  se han valido para lograr contar con centros de servicio y talleres de mantenimiento con los más
                  altos niveles de satisfacción. Los resultados: clientes felices. 
                </p>
              </div>
            </div>
          </a>
          <a href="https://panama.casabat.com/noticias/El-Taller-para-autos-hibridos-y-electricos/" target="blank">
            <div class="card news-link">
              <div class="news-img" style="background-image: url('images/noticia2.jpg')"></div>
              <div class="news-description">
                <h3>El Taller para autos híbridos y eléctricos</h3>
                <p>
                  Apuntando hacia el cambio y las nuevas tecnologías, el mundo automotriz tiende a crecer
                  hacia el mercado de energías renovables como los autos híbridos y eléctricos. La Casa de
                  las Baterías no se queda atrás en este avance y desde ya está incluyendo en su modelo de
                  negocio la atención a este tipo de vehículos. 
                </p>
              </div>
            </div>
          </a>
          <a href="https://www.youtube.com/watch?v=XmcMvnORgmE" target="blank">
            <div class="card news-link">
              <div class="news-img" style="background-image: url('images/noticia3.jpg')"></div>
              <div class="news-description">
                <h3>El eVTOL X2 hizo su primer viaje público en Dubai</h3>
                <p>
                  El eVTOL X2 de la compañía XPeng realizó su vuelo de prueba de 90 minutos frente a decenas
                  de reporteros e invitados que acudieron a la presentación. El vehículo biplaza cero emisiones
                  marca el inicio de una nueva era de transporte moderno e inteligente. 
                </p>
              </div>
            </div>
          </a>
        </div>
      </section>
  </main>

  <!-- Componente parcial del footer -->
  <%@ include file="/WEB-INF/views/footer.jsp" %>
</body>
</html>
