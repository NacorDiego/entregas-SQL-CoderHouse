-- DROP SCHEMA NEGOCIO_PESCA;

CREATE SCHEMA NEGOCIO_PESCA;

USE NEGOCIO_PESCA;

CREATE TABLE EMPLEADOS(
	ID_EMPLEADO INT,
	NOMBRE_APELLIDO VARCHAR(50) NOT NULL,
	DIRECCION VARCHAR(250),
    TELEFONO INT NOT NULL,
    CORREO_ELECTRONICO VARCHAR(100),
    PRIMARY KEY (ID_EMPLEADO)
);

-- Error Code: 1064. You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'SCHEMA NEGOCIO_PESCA' at line 1


CREATE TABLE VENTAS(
	ID_VENTA INT,
	FECHA DATE NOT NULL,
	HORA TIME NOT NULL,
	ID_EMPLEADO INT,
	PRIMARY KEY(ID_VENTA),
	FOREIGN KEY (ID_EMPLEADO) REFERENCES EMPLEADOS(ID_EMPLEADO)
);

CREATE TABLE PROVEEDORES(
	ID_PROVEEDOR INT,
    NOMBRE_APELLIDO VARCHAR(100) NOT NULL,
    DIRECCION VARCHAR(250),
    TELEFONO INT NOT NULL,
    CORREO_ELECTRONICO VARCHAR(100),
    URL_LISTA_PRECIOS VARCHAR(80),
    PRIMARY KEY(ID_PROVEEDOR)
);

CREATE TABLE CATEGORIAS(
	ID_CATEGORIA INT,
    NOMBRE VARCHAR(50) NOT NULL,
    PRIMARY KEY(ID_CATEGORIA)
);

CREATE TABLE SUBCATEGORIAS(
	ID_SUBCATEGORIA INT,
    NOMBRE VARCHAR(50) NOT NULL,
    ID_CATEGORIA INT,
    PRIMARY KEY(ID_SUBCATEGORIA),
    FOREIGN KEY (ID_CATEGORIA) REFERENCES CATEGORIAS(ID_CATEGORIA)
);

CREATE TABLE PRODUCTOS(
	ID_PRODUCTO INT,
    NOMBRE VARCHAR(70) NOT NULL,
    DESCRIPCION VARCHAR(250),
    PRECIO_COSTO DECIMAL(8,2) NOT NULL,
    PRECIO_LISTA DECIMAL(8,2) NOT NULL,
    PRECIO_FINAL DECIMAL(8,2) NOT NULL,
    CANTIDAD_DISPONIBLE INT NOT NULL,
    ID_SUBCATEGORIA INT,
    PRIMARY KEY (ID_PRODUCTO),
    FOREIGN KEY (ID_SUBCATEGORIA) REFERENCES SUBCATEGORIAS(ID_SUBCATEGORIA)
);

CREATE TABLE METODOS_PAGO(
	ID_METODO_PAGO INT,
    NOMBRE VARCHAR(50) NOT NULL,
    PRIMARY KEY(ID_METODO_PAGO)
);

CREATE TABLE DETALLE_VENTA(
	ID_DETALLE_VENTA INT,
    ID_VENTA INT,
    ID_PRODUCTO INT,
    CANTIDAD INT NOT NULL,
    PRECIO_UNITARIO DECIMAL(8,2) NOT NULL,
    PRIMARY KEY (ID_DETALLE_VENTA),
    FOREIGN KEY (ID_VENTA) REFERENCES VENTAS(ID_VENTA),
    FOREIGN KEY (ID_PRODUCTO) REFERENCES PRODUCTOS(ID_PRODUCTO)
);

CREATE TABLE PRODUCTO_PROVEEDOR(
	ID_PRODUCTO_PROVEEDOR INT,
    ID_PRODUCTO INT,
    ID_PROVEEDOR INT,
    PRECIO_COMPRA DECIMAL(8,2) NOT NULL,
    PRIMARY KEY (ID_PRODUCTO_PROVEEDOR),
    FOREIGN KEY (ID_PRODUCTO) REFERENCES PRODUCTOS(ID_PRODUCTO),
    FOREIGN KEY (ID_PROVEEDOR) REFERENCES PROVEEDORES(ID_PROVEEDOR)
);

CREATE TABLE DETALLE_METODO_PAGO_VENTA(
	ID_DETALLE_METODO_PAGO_VENTA INT,
    ID_VENTA INT,
    ID_METODO_PAGO INT,
    MONTO_PAGADO DECIMAL(9,2) NOT NULL,
    PRIMARY KEY (ID_DETALLE_METODO_PAGO_VENTA),
    FOREIGN KEY (ID_VENTA) REFERENCES VENTAS(ID_VENTA),
    FOREIGN KEY (ID_METODO_PAGO) REFERENCES METODOS_PAGO(ID_METODO_PAGO)
);








