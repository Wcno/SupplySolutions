<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <title>Sobre Nosotros</title>
    <link rel="stylesheet" href="/css/base.css">
    <link rel="stylesheet" href="/css/layout.css">
    <link rel="stylesheet" href="/css/components.css">
    <link rel="stylesheet" href="/css/sobre-nosotros.css">
</head>
<body>
  <jsp:include page="/WEB-INF/views/header.jsp">
      <jsp:param name="active" value="1" />
  </jsp:include>
  <main>
    <section class="group">
      <h1>Soporte</h1> <!-- Asegura el título está en la parte superior -->
      <div class="members">
        <div class="card card-body member">
          <img src="images/JerryFoto.jpg" alt="Jeremiah">
          <div class="description">
            <h3>Jeremiah Kurmaty</h3>
            <p>Cédula: 8-1004-172</p>
            <p>Edad: 20 años</p>
            <p>Licenciatura en Ing. de Software</p>
            <p>
                Soy un desarrollador full stack especializado en php. Empece a aprender a desarrollar en primer
                añor de universidad aprendiendo tecnologías básicas de html, css y javascript. Posteriormente
                empece a profundizar en el backend y sus conceptos haciendo enfásis en la herramienta Laravel.
                Hoy en día estoy trabajando como desarrollar jr. en la empresa Vernovo S.A obteniendo experiencia
                y puliendo mis habilidades.
            </p>
          </div>
        </div>
        <div class="card card-body member">
          <img src="images/DanielFoto.jpeg" alt="Daniel">
          <div class="description">
            <h3>Daniel Maestre</h3>
            <p>Cédula: 8-1005-1509</p>
            <p>Edad: 20 años</p>
            <p>Licenciatura en Ing. de Software</p>
            <p>
               Mi experiencia como desarrollador comenzó un poco en la escuela con pequeños cursos de html y
               css, posteriormente al comenzar la universidad me comencé a introducir más en lo que es la
               programación trabajando en el backend utilizando C, C++, Java, python tanto en la universidad
               como realizando algunos cursos en linea 
            </p>
          </div>
        </div>
        <div class="card card-body member">
          <img src="images/wilfredo.jpeg" alt="Wilfredo">
          <div class="description">
            <h3>Wilfredo Cano</h3>
            <p>Cédula: 8-1003-721</p>
            <p>Edad: 20 años</p>
            <p>Licenciatura en Ing. de Software</p>
            <p>
               Tengo 2 años de experiencia en desarrollo de software, donde he trabajado con lenguajes
               de programación como Java, Python, C++, C, HTML/CSS y JavaScript, creando aplicaciones
               funcionales en proyectos personales y educativos, he tenido una curva de aprendizaje flexible,
               ya que me gusta probar diversas tecnologías, actualmente me encuentro aprendiendo ciberseguridad
               para así tener la capacidad y aptitudes para crear sistemas seguros para los usuarios,
               posteriormente me gustaría montar mi primera startup enfocada al desarrollo de software empresarial. 
            </p>
          </div>
        </div>
        <!-- Div vacio para ocupar una celda del grid y centrear el contenido -->
        <div></div>
        <div class="card card-body member">
          <img src="images/allan.jpeg" alt="Allan">
          <div class="description">
            <h3>Allan Vega</h3>
            <p>Cédula: 8-1001-2089</p>
            <p>Edad: 20 años</p>
            <p>Licenciatura en Ing. de Software</p>
            <p>
               Todo empezó a finales de 2021, cuando estaba incursionando en un curso de HTML/CSS en
               Khan Academy, en donde me llamó la atención las cosas increíbles que uno puede desarrollar
               en la web. Luego, en el 2022, me puse a aprender los fundamentos de  Java, como primer lenguaje
               de programación, después fueron más y más los lenguajes de programación aprendidos como C y
               JavaScript, así como también Frameworks como React y Tailwind CSS. Actualmente, me encuentro
               aprendiendo PHP junto a MySQL para poder desarrollar aplicaciones completas y posteriormente,
               crear mi propia empresa de Desarrollo de Software. 
            </p>
          </div>
        </div>
        <div class="card card-body member">
          <img src="images/reggie.jpeg" alt="reggie">
          <div class="description">
            <h3>Reggie Guevara</h3>
            <p>Cédula: 8-995-1393</p>
            <p>Edad: 21 años</p>
            <p>Licenciatura en Ing. de Software</p>
            <p>
               Empecé a programar a los 15 años, y a lo largo de estos años he aprendido varios lenguajes,
               incluyendo Java, C, JavaScript, Python (mi lenguaje principal) y algo de desarrollo web con
               HTML y CSS. Además, he adquirido experiencia en el mundo laboral a través de una pasantía en
               Jvlat en 2021, donde tuve mi primera oportunidad de interactuar con Python y una base de datos. 
            </p>
          </div>
        </div>
      </div>
    </section>
  </main>
  <%@ include file="/WEB-INF/views/footer.jsp" %>
</body>
</html>
