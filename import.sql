CREATE SEQUENCE seq_provincias START WITH 10001 INCREMENT BY 1;
CREATE SEQUENCE seq_clientes START WITH 10001 INCREMENT BY 1;
CREATE SEQUENCE seq_automoviles START WITH 10001 INCREMENT BY 1;
CREATE SEQUENCE seq_ordenes START WITH 10001 INCREMENT BY 1;
CREATE SEQUENCE seq_facturas START WITH 10001 INCREMENT BY 1;
CREATE SEQUENCE seq_servicios START WITH 10001 INCREMENT BY 1;
CREATE SEQUENCE seq_citas START WITH 10001 INCREMENT BY 1;
CREATE SEQUENCE seq_mecanicos START WITH 10001 INCREMENT BY 1;

CREATE TABLE provincias (
    id_provincia    NUMBER PRIMARY KEY,
    nombre          VARCHAR2(50) NOT NULL
);

CREATE TABLE clientes (
    id_cliente      NUMBER PRIMARY KEY,
    id_provincia    NUMBER NOT NULL,
    nombre          VARCHAR2(50) NOT NULL,
    apellido        VARCHAR2(50) NOT NULL,
    cedula          VARCHAR2(20) NOT NULL,
    email           VARCHAR2(100) NOT NULL,
    password        VARCHAR2(255) NOT NULL,
    telefono        VARCHAR2(20) NOT NULL,
    ciudad          VARCHAR2(50) NOT NULL,
    CONSTRAINT fk_cliente_provincia FOREIGN KEY (id_provincia) REFERENCES provincias(id_provincia)
);

CREATE TABLE automoviles (
    id_automovil    NUMBER PRIMARY KEY,
    id_cliente      NUMBER NOT NULL,
    modelo          VARCHAR2(50) NOT NULL,
    marca           VARCHAR2(50) NOT NULL,
    matricula       VARCHAR2(20) NOT NULL,
    color           VARCHAR2(20) NOT NULL,
    CONSTRAINT fk_automovil_cliente FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);

CREATE TABLE orden_trabajo (
    id_orden            NUMBER PRIMARY KEY,
    id_cliente          NUMBER NOT NULL,
    id_automovil        NUMBER NOT NULL,
    id_servicio         NUMBER NOT NULL,
    fecha_publicacion   DATE NOT NULL,
    fecha_fin           DATE,
    estado              VARCHAR2(50) NOT NULL,
    CONSTRAINT fk_orden_trabajo_cliente FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
    CONSTRAINT fk_orden_trabajo_automovil FOREIGN KEY (id_automovil) REFERENCES automoviles(id_automovil)
);

CREATE TABLE facturas (
    id_factura      NUMBER PRIMARY KEY,
    id_orden        NUMBER NOT NULL,
    id_cliente      NUMBER NOT NULL,
    fecha_emision   DATE NOT NULL,
    importe         NUMBER(10, 2) NOT NULL,
    impuesto        NUMBER(10, 2) NOT NULL,
    total           NUMBER(10, 2) NOT NULL,
    CONSTRAINT fk_factura_orden_trabajo FOREIGN KEY (id_orden) REFERENCES orden_trabajo(id_orden),
    CONSTRAINT fk_factura_cliente FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);

CREATE TABLE servicios (
    id_servicio     NUMBER PRIMARY KEY,
    descripcion     VARCHAR2(200) NOT NULL,
    costo           NUMBER(10, 2) NOT NULL
);

CREATE TABLE citas (
    id_cita             NUMBER PRIMARY KEY,
    id_cliente          NUMBER NOT NULL,
    fecha_solicitud     DATE NOT NULL,
    fecha_asignacion    DATE,
    CONSTRAINT fk_cita_cliente FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);

CREATE TABLE mecanicos (
    id_mecanico     NUMBER PRIMARY KEY,
    id_provincia    NUMBER NOT NULL,
    nombre          VARCHAR2(50) NOT NULL,
    apellido        VARCHAR2(50) NOT NULL,
    dpi             VARCHAR2(20) NOT NULL,
    email           VARCHAR2(100) NOT NULL,
    password        VARCHAR2(255) NOT NULL,
    telefono        VARCHAR2(20) NOT NULL,
    ciudad          VARCHAR2(50) NOT NULL,
    CONSTRAINT fk_mecanico_provincia FOREIGN KEY (id_provincia) REFERENCES provincias(id_provincia)
);

CREATE TABLE asignaciones (
    id_orden        NUMBER NOT NULL,
    id_mecanico     NUMBER NOT NULL,
    fecha_asignacion DATE NOT NULL,
    PRIMARY KEY (id_orden, id_mecanico),
    CONSTRAINT fk_asignacion_orden_trabajo FOREIGN KEY (id_orden) REFERENCES orden_trabajo(id_orden),
    CONSTRAINT fk_asignacion_mecanico FOREIGN KEY (id_mecanico) REFERENCES mecanicos(id_mecanico)
);






INSERT INTO provincias (id_provincia, nombre) VALUES (seq_provincias.NEXTVAL, 'Bocas del Toro');
INSERT INTO provincias (id_provincia, nombre) VALUES (seq_provincias.NEXTVAL, 'Coclé');
INSERT INTO provincias (id_provincia, nombre) VALUES (seq_provincias.NEXTVAL, 'Colón');
INSERT INTO provincias (id_provincia, nombre) VALUES (seq_provincias.NEXTVAL, 'Chiriquí');
INSERT INTO provincias (id_provincia, nombre) VALUES (seq_provincias.NEXTVAL, 'Darién');
INSERT INTO provincias (id_provincia, nombre) VALUES (seq_provincias.NEXTVAL, 'Herrera');
INSERT INTO provincias (id_provincia, nombre) VALUES (seq_provincias.NEXTVAL, 'Los Santos');
INSERT INTO provincias (id_provincia, nombre) VALUES (seq_provincias.NEXTVAL, 'Panamá');
INSERT INTO provincias (id_provincia, nombre) VALUES (seq_provincias.NEXTVAL, 'Veraguas');
INSERT INTO provincias (id_provincia, nombre) VALUES (seq_provincias.NEXTVAL, 'Panamá Oeste');

INSERT INTO servicios (id_servicio, descripcion, costo) VALUES (seq_servicios.NEXTVAL, 'Cambio de Aceite', 50.00);
INSERT INTO servicios (id_servicio, descripcion, costo) VALUES (seq_servicios.NEXTVAL, 'Alineación y Balanceo', 75.00);
INSERT INTO servicios (id_servicio, descripcion, costo) VALUES (seq_servicios.NEXTVAL, 'Revisión de Frenos', 100.00);

INSERT INTO clientes (id_cliente, id_provincia, nombre, apellido, cedula, email, password, telefono, ciudad) VALUES (seq_clientes.NEXTVAL, 10001, 'Carlos', 'Perez', '8-1922-123', 'carlos.perez@example.com', 'password1', '6555-2555', 'Ciudad de Panama');
INSERT INTO clientes (id_cliente, id_provincia, nombre, apellido, cedula, email, password, telefono, ciudad) VALUES (seq_clientes.NEXTVAL, 10001, 'Maria', 'Gonzalez', '8-1293-122', 'maria.gonzalez@example.com', 'password2', '6141-2074', 'Colón');
INSERT INTO clientes (id_cliente, id_provincia, nombre, apellido, cedula, email, password, telefono, ciudad) VALUES (seq_clientes.NEXTVAL, 10001, 'Juan', 'Rodriguez', '8-1293-123', 'juan.rodriguez@example.com', 'password3', '6000-9878', 'David');
INSERT INTO clientes (id_cliente, id_provincia, nombre, apellido, cedula, email, password, telefono, ciudad) VALUES (seq_clientes.NEXTVAL, 10004, 'Ana', 'Lopez', '8-9382-948', 'ana.lopez@example.com', 'password4', '6147-0041', 'Penonomé');
INSERT INTO clientes (id_cliente, id_provincia, nombre, apellido, cedula, email, password, telefono, ciudad) VALUES (seq_clientes.NEXTVAL, 10001, 'Pedro', 'Martinez', '3-1838-182', 'pedro.martinez@example.com', 'password5', '6712-7432', 'La Chorrera');

INSERT INTO mecanicos (id_mecanico, id_provincia, nombre, apellido, dpi, email, password, telefono, ciudad) VALUES (seq_mecanicos.NEXTVAL, 10001, 'Carlos', 'Perez', '8-1922-123', 'carlos.perez1@example.com', 'password1', '123456789', 'Ciudad de Panama');

INSERT INTO automoviles (id_automovil, id_cliente, modelo, marca, matricula, color) VALUES (seq_automoviles.NEXTVAL, 10001, 'Corolla', 'Toyota', 'ABC123', 'Rojo');
INSERT INTO automoviles (id_automovil, id_cliente, modelo, marca, matricula, color) VALUES (seq_automoviles.NEXTVAL, 10001, 'Civic', 'Honda', 'DEF456', 'Azul');
INSERT INTO automoviles (id_automovil, id_cliente, modelo, marca, matricula, color) VALUES (seq_automoviles.NEXTVAL, 10001, 'Mazda3', 'Mazda', 'GHI789', 'Negro');
INSERT INTO automoviles (id_automovil, id_cliente, modelo, marca, matricula, color) VALUES (seq_automoviles.NEXTVAL, 10002, 'Altima', 'Nissan', 'JKL012', 'Blanco');
INSERT INTO automoviles (id_automovil, id_cliente, modelo, marca, matricula, color) VALUES (seq_automoviles.NEXTVAL, 10002, 'Focus', 'Ford', 'MNO345', 'Gris');
INSERT INTO automoviles (id_automovil, id_cliente, modelo, marca, matricula, color) VALUES (seq_automoviles.NEXTVAL, 10003, 'Sentra', 'Nissan', 'PQR678', 'Verde');
INSERT INTO automoviles (id_automovil, id_cliente, modelo, marca, matricula, color) VALUES (seq_automoviles.NEXTVAL, 10003, 'Camry', 'Toyota', 'STU901', 'Plateado');
INSERT INTO automoviles (id_automovil, id_cliente, modelo, marca, matricula, color) VALUES (seq_automoviles.NEXTVAL, 10004, 'Accord', 'Honda', 'VWX234', 'Amarillo');
INSERT INTO automoviles (id_automovil, id_cliente, modelo, marca, matricula, color) VALUES (seq_automoviles.NEXTVAL, 10004, '3 Series', 'BMW', 'YZA567', 'Rojo');
INSERT INTO automoviles (id_automovil, id_cliente, modelo, marca, matricula, color) VALUES (seq_automoviles.NEXTVAL, 10005, 'A4', 'Audi', 'BCD890', 'Azul');

INSERT INTO orden_trabajo (id_orden, id_cliente, id_automovil, id_servicio, fecha_publicacion, fecha_fin, estado) VALUES (seq_ordenes.NEXTVAL, 10001, 10001, 10001, TO_DATE('2024-01-01', 'YYYY-MM-DD'), TO_DATE('2024-01-05', 'YYYY-MM-DD'), 'Completado');
INSERT INTO orden_trabajo (id_orden, id_cliente, id_automovil, id_servicio, fecha_publicacion, fecha_fin, estado) VALUES (seq_ordenes.NEXTVAL, 10002, 10004, 10002, TO_DATE('2024-02-01', 'YYYY-MM-DD'), TO_DATE('2024-02-05', 'YYYY-MM-DD'), 'Completado');
INSERT INTO orden_trabajo (id_orden, id_cliente, id_automovil, id_servicio, fecha_publicacion, fecha_fin, estado) VALUES (seq_ordenes.NEXTVAL, 10003, 10006, 10003, TO_DATE('2024-03-01', 'YYYY-MM-DD'), TO_DATE('2024-03-05', 'YYYY-MM-DD'), 'Completado');
INSERT INTO orden_trabajo (id_orden, id_cliente, id_automovil, id_servicio, fecha_publicacion, fecha_fin, estado) VALUES (seq_ordenes.NEXTVAL, 10004, 10002, 10001, TO_DATE('2024-04-01', 'YYYY-MM-DD'), TO_DATE('2024-04-05', 'YYYY-MM-DD'), 'Completado');
INSERT INTO orden_trabajo (id_orden, id_cliente, id_automovil, id_servicio, fecha_publicacion, fecha_fin, estado) VALUES (seq_ordenes.NEXTVAL, 10005, 10010, 10002, TO_DATE('2024-05-01', 'YYYY-MM-DD'), TO_DATE('2024-05-05', 'YYYY-MM-DD'), 'Completado');
INSERT INTO orden_trabajo (id_orden, id_cliente, id_automovil, id_servicio, fecha_publicacion, fecha_fin, estado) VALUES (seq_ordenes.NEXTVAL, 10003, 10007, 10003, TO_DATE('2024-06-01', 'YYYY-MM-DD'), TO_DATE('2024-06-05', 'YYYY-MM-DD'), 'Completado');
INSERT INTO orden_trabajo (id_orden, id_cliente, id_automovil, id_servicio, fecha_publicacion, fecha_fin, estado) VALUES (seq_ordenes.NEXTVAL, 10004, 10009, 10001, TO_DATE('2024-07-01', 'YYYY-MM-DD'), TO_DATE('2024-07-05', 'YYYY-MM-DD'), 'Completado');
INSERT INTO orden_trabajo (id_orden, id_cliente, id_automovil, id_servicio, fecha_publicacion, fecha_fin, estado) VALUES (seq_ordenes.NEXTVAL, 10002, 10005, 10002, TO_DATE('2024-08-01', 'YYYY-MM-DD'), TO_DATE('2024-08-05', 'YYYY-MM-DD'), 'Completado');

INSERT INTO citas (id_cita, id_cliente, fecha_solicitud, fecha_asignacion) VALUES (seq_citas.NEXTVAL, 10001, TO_DATE('2024-01-10', 'YYYY-MM-DD'), TO_DATE('2024-01-15', 'YYYY-MM-DD'));
INSERT INTO citas (id_cita, id_cliente, fecha_solicitud, fecha_asignacion) VALUES (seq_citas.NEXTVAL, 10002, TO_DATE('2024-02-10', 'YYYY-MM-DD'), TO_DATE('2024-02-15', 'YYYY-MM-DD'));
INSERT INTO citas (id_cita, id_cliente, fecha_solicitud, fecha_asignacion) VALUES (seq_citas.NEXTVAL, 10003, TO_DATE('2024-03-10', 'YYYY-MM-DD'), TO_DATE('2024-03-15', 'YYYY-MM-DD'));
INSERT INTO citas (id_cita, id_cliente, fecha_solicitud, fecha_asignacion) VALUES (seq_citas.NEXTVAL, 10004, TO_DATE('2024-04-10', 'YYYY-MM-DD'), TO_DATE('2024-04-15', 'YYYY-MM-DD'));
INSERT INTO citas (id_cita, id_cliente, fecha_solicitud, fecha_asignacion) VALUES (seq_citas.NEXTVAL, 10005, TO_DATE('2024-05-10', 'YYYY-MM-DD'), TO_DATE('2024-05-15', 'YYYY-MM-DD'));

INSERT INTO facturas (id_factura, id_orden, id_cliente, fecha_emision, importe, impuesto, total) VALUES (seq_facturas.NEXTVAL, 10001, 10001, TO_DATE('2024-01-06', 'YYYY-MM-DD'), 100.00, 7.00, 107.00);
INSERT INTO facturas (id_factura, id_orden, id_cliente, fecha_emision, importe, impuesto, total) VALUES (seq_facturas.NEXTVAL, 10002, 10002, TO_DATE('2024-02-06', 'YYYY-MM-DD'), 200.00, 14.00, 214.00);
INSERT INTO facturas (id_factura, id_orden, id_cliente, fecha_emision, importe, impuesto, total) VALUES (seq_facturas.NEXTVAL, 10003, 10003, TO_DATE('2024-03-06', 'YYYY-MM-DD'), 120.50, 8.44, 128.94);
INSERT INTO facturas (id_factura, id_orden, id_cliente, fecha_emision, importe, impuesto, total) VALUES (seq_facturas.NEXTVAL, 10004, 10004, TO_DATE('2024-04-06', 'YYYY-MM-DD'), 150.75, 10.55, 161.30);
INSERT INTO facturas (id_factura, id_orden, id_cliente, fecha_emision, importe, impuesto, total) VALUES (seq_facturas.NEXTVAL, 10005, 10003, TO_DATE('2024-05-06', 'YYYY-MM-DD'), 300.00, 21.00, 321.00);
INSERT INTO facturas (id_factura, id_orden, id_cliente, fecha_emision, importe, impuesto, total) VALUES (seq_facturas.NEXTVAL, 10006, 10001, TO_DATE('2024-01-06', 'YYYY-MM-DD'), 140.00, 9.80, 149.80);



INSERT INTO mecanicos (id_mecanico, id_provincia, nombre, apellido, dpi, email, password, telefono, ciudad) 
VALUES (seq_mecanicos.NEXTVAL, 10001, 'Carlos', 'Martinez', '8-456-21', 'carlos.martinez@example.com', 'password1', '6501-1245', 'Ciudad de Panama');

INSERT INTO mecanicos (id_mecanico, id_provincia, nombre, apellido, dpi, email, password, telefono, ciudad) 
VALUES (seq_mecanicos.NEXTVAL, 10002, 'Luis', 'Gomez', '4-15-220', 'luis.gomez@example.com', 'password2', '6987-1456', 'Colón');

INSERT INTO mecanicos (id_mecanico, id_provincia, nombre, apellido, dpi, email, password, telefono, ciudad) 
VALUES (seq_mecanicos.NEXTVAL, 10003, 'Ana', 'Lopez', '8-1002-2020', 'ana.lopez@example.com', 'password3', '6523-4156', 'David');

INSERT INTO mecanicos (id_mecanico, id_provincia, nombre, apellido, dpi, email, password, telefono, ciudad) 
VALUES (seq_mecanicos.NEXTVAL, 10004, 'Maria', 'Fernandez', '8-1000-2001', 'maria.fernandez@example.com', 'password4', '6488-4139', 'Penonomé');

INSERT INTO mecanicos (id_mecanico, id_provincia, nombre, apellido, dpi, email, password, telefono, ciudad) 
VALUES (seq_mecanicos.NEXTVAL, 10005, 'Jose', 'Rodriguez', '8-1001-1545', 'jose.rodriguez@example.com', 'password5', '6174-8932', 'La Chorrera');

INSERT INTO mecanicos (id_mecanico, id_provincia, nombre, apellido, dpi, email, password, telefono, ciudad) 
VALUES (seq_mecanicos.NEXTVAL, 10005, 'Juan', 'Castillo', '8-1001-1099', 'juan.castillo@example.com', 'password6', '6111-6523', 'Palmar');


INSERT INTO asignaciones (id_orden, id_mecanico, fecha_asignacion) VALUES(10001, 10001, TO_DATE('2023-01-18', 'YYYY-MM-DD'));
INSERT INTO asignaciones (id_orden, id_mecanico, fecha_asignacion) VALUES(10002, 10002, TO_DATE('2023-01-19', 'YYYY-MM-DD'));
INSERT INTO asignaciones (id_orden, id_mecanico, fecha_asignacion) VALUES(10003, 10003, TO_DATE('2023-01-20', 'YYYY-MM-DD'));
INSERT INTO asignaciones (id_orden, id_mecanico, fecha_asignacion) VALUES(10004, 10004, TO_DATE('2023-01-21', 'YYYY-MM-DD'));
INSERT INTO asignaciones (id_orden, id_mecanico, fecha_asignacion) VALUES(10005, 10005, TO_DATE('2023-01-21', 'YYYY-MM-DD'));
INSERT INTO asignaciones (id_orden, id_mecanico, fecha_asignacion) VALUES(10006, 10006, TO_DATE('2023-01-21', 'YYYY-MM-DD'));