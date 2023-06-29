-- CREACION DE TRIGGERS
USE negocio_pesca;

-- Verificar y crear la tabla log_ventas si no existe
CREATE TABLE IF NOT EXISTS log_ventas (
    id_log INT AUTO_INCREMENT PRIMARY KEY,
    accion VARCHAR(10),
    id_venta INT,
    fecha DATE,
    hora TIME,
    usuario VARCHAR(50)
);

-- Crear el trigger para los INSERT
DELIMITER //
DROP TRIGGER IF EXISTS log_insert_ventas;
CREATE TRIGGER log_insert_ventas
BEFORE INSERT ON ventas
FOR EACH ROW
BEGIN
    -- Insertar en la tabla de log
    INSERT INTO log_ventas (accion, id_venta, fecha, hora, usuario)
    VALUES ('INSERT', NEW.id_venta, NEW.fecha, NEW.hora, CURRENT_USER());
END //

-- Se prueba el Trigger al insertar
INSERT INTO VENTAS (FECHA,HORA,ID_EMPLEADO) VALUES ('2023-07-01', '08:50:00',2);
SELECT * FROM log_ventas;

-- Crear el trigger para los UPDATE
DELIMITER //
DROP TRIGGER IF EXISTS log_update_ventas;
CREATE TRIGGER log_update_ventas
AFTER UPDATE ON ventas
FOR EACH ROW
BEGIN
    -- Insertar en la tabla de log
    INSERT INTO log_ventas (accion, id_venta, fecha, hora, usuario)
    VALUES ('UPDATE', NEW.id_venta, NEW.fecha, NEW.hora, CURRENT_USER());
END //
DELIMITER ;

-- Se prueba el Trigger al update
UPDATE VENTAS SET ID_EMPLEADO = 2 WHERE ID_VENTA = 4;
SELECT * FROM log_ventas;

-- Verificar y crear la tabla log_productos si no existe
CREATE TABLE IF NOT EXISTS log_productos (
    id_log INT AUTO_INCREMENT PRIMARY KEY,
    accion VARCHAR(10),
    id_producto INT,
    nombre VARCHAR(70),
    descripcion VARCHAR(250),
    precio_costo DECIMAL(8,2),
    precio_lista DECIMAL(8,2),
    precio_final DECIMAL(8,2),
    cantidad_disponible INT,
    id_subcategoria INT,
    fecha DATE,
    hora TIME,
    usuario VARCHAR(50)
);

-- Crear el trigger para los INSERT
DELIMITER //

DROP TRIGGER IF EXISTS log_insert_productos;
CREATE TRIGGER log_insert_productos
BEFORE INSERT ON productos
FOR EACH ROW
BEGIN
    -- Insertar en la tabla de log
    INSERT INTO log_productos (accion, id_producto, nombre, descripcion, precio_costo, precio_lista, precio_final, cantidad_disponible, id_subcategoria, fecha, hora, usuario)
    VALUES ('INSERT', NEW.id_producto, NEW.nombre, NEW.descripcion, NEW.precio_costo, NEW.precio_lista, NEW.precio_final, NEW.cantidad_disponible, NEW.id_subcategoria, CURRENT_DATE(), CURRENT_TIME(), CURRENT_USER());
END //
DELIMITER ;

-- EJEMPLO: Ejecuto un INSERT en la tabla "productos", se ejecuta el trigger y luego visualizo los cambios en la tabla "log_productos".
INSERT INTO PRODUCTOS (NOMBRE,DESCRIPCION,PRECIO_COSTO,PRECIO_LISTA,PRECIO_FINAL,CANTIDAD_DISPONIBLE,ID_SUBCATEGORIA) 
VALUES ('Tela de teflon', 'Saco de dormir ligero y compacto, perfecto para actividades al aire libre', 29.99, 39.99, 35.99, 12, 7);
SELECT * FROM log_productos;

-- Crear el trigger para los UPDATE
DELIMITER //
DROP TRIGGER IF EXISTS log_update_productos;
CREATE TRIGGER log_update_productos
AFTER UPDATE ON productos
FOR EACH ROW
BEGIN
    -- Insertar en la tabla de log
    INSERT INTO log_productos (accion, id_producto, nombre, descripcion, precio_costo, precio_lista, precio_final, cantidad_disponible, id_subcategoria, fecha, hora, usuario)
    VALUES ('UPDATE', NEW.id_producto, NEW.nombre, NEW.descripcion, NEW.precio_costo, NEW.precio_lista, NEW.precio_final, NEW.cantidad_disponible, NEW.id_subcategoria, CURRENT_DATE(), CURRENT_TIME(), CURRENT_USER());
END //

-- Se prueba el Trigger al update
UPDATE PRODUCTOS SET CANTIDAD_DISPONIBLE = 5 WHERE ID_PRODUCTO = 6;
SELECT * FROM log_productos;

-- Crear el trigger para los DELETE

DROP TRIGGER IF EXISTS log_delete_productos;
CREATE TRIGGER log_delete_productos
BEFORE DELETE ON productos
FOR EACH ROW
BEGIN
    -- Insertar en la tabla de log
    INSERT INTO log_productos (accion, id_producto, nombre, descripcion, precio_costo, precio_lista, precio_final, cantidad_disponible, id_subcategoria, fecha, hora, usuario)
    VALUES ('DELETE', OLD.id_producto, OLD.nombre, OLD.descripcion, OLD.precio_costo, OLD.precio_lista, OLD.precio_final, OLD.cantidad_disponible, OLD.id_subcategoria, CURRENT_DATE(), CURRENT_TIME(), CURRENT_USER());
END //

DELIMITER ;

-- Se prueba el trigger delete.
DELETE FROM PRODUCTOS WHERE ID_PRODUCTO = 6;
SELECT * FROM log_productos;


-- Verificar y crear la tabla log_categorias si no existe
DROP TABLE IF EXISTS log_categorias;

CREATE TABLE IF NOT EXISTS log_categorias (
    id_log INT AUTO_INCREMENT PRIMARY KEY,
    accion VARCHAR(10),
    id_categoria INT,
    nombre_anterior VARCHAR(50),
    nombre_nuevo VARCHAR(50),
    fecha DATE,
    hora TIME,
    usuario VARCHAR(50)
);

-- Creo el TRIGGER para el UPDATE en la tabla "categorias" usando las clausulas "NEW" y "OLD".
DROP TRIGGER IF EXISTS log_update_categorias;

DELIMITER //
CREATE TRIGGER log_update_categorias
AFTER UPDATE ON CATEGORIAS
FOR EACH ROW
BEGIN
    -- Verificar si hubo cambios en la columna NOMBRE
    IF OLD.NOMBRE <> NEW.NOMBRE THEN
        -- Insertar en la tabla de log
        INSERT INTO log_categorias (accion, id_categoria, nombre_anterior, nombre_nuevo, fecha, hora, usuario)
        VALUES ('UPDATE', OLD.ID_CATEGORIA, OLD.NOMBRE, NEW.NOMBRE, CURRENT_DATE(), CURRENT_TIME(), CURRENT_USER());
    END IF;
END //
DELIMITER ;

-- Pruebo el trigger update
UPDATE CATEGORIAS SET NOMBRE = 'Plomadas' WHERE ID_CATEGORIA = 1;
SELECT * FROM log_categorias;