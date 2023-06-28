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

-- Crear el trigger para los UPDATE
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

-- Crear el trigger para los UPDATE

DROP TRIGGER IF EXISTS log_update_productos;
CREATE TRIGGER log_update_productos
AFTER UPDATE ON productos
FOR EACH ROW
BEGIN
    -- Insertar en la tabla de log
    INSERT INTO log_productos (accion, id_producto, nombre, descripcion, precio_costo, precio_lista, precio_final, cantidad_disponible, id_subcategoria, fecha, hora, usuario)
    VALUES ('UPDATE', NEW.id_producto, NEW.nombre, NEW.descripcion, NEW.precio_costo, NEW.precio_lista, NEW.precio_final, NEW.cantidad_disponible, NEW.id_subcategoria, CURRENT_DATE(), CURRENT_TIME(), CURRENT_USER());
END //

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

