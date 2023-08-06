-- CREACIÓN DE PROCEDIMIENTOS
USE negocio_pesca;

-- Creo un procedimiento que ordene los campos de la tabla ingresada como parametro
DROP PROCEDURE IF EXISTS sp_ordenarTabla;
DELIMITER $$
CREATE PROCEDURE sp_ordenarTabla (IN tabla VARCHAR(100), IN campo_ordenamiento VARCHAR(100), IN tipo_orden VARCHAR(11))
BEGIN
    DECLARE ordenamiento VARCHAR(10);

    -- Establecer el tipo de ordenamiento
    IF tipo_orden = 'ascendente' THEN
        SET ordenamiento = 'ASC';
    ELSEIF tipo_orden = 'descendente' THEN
        SET ordenamiento = 'DESC';
    ELSE
        -- Tipo de ordenamiento inválido, se asigna ascendente por defecto
        SET ordenamiento = 'ASC';
    END IF;

    -- Consulta para ordenar la tabla
    SET @sql = CONCAT('SELECT * FROM ', tabla, ' ORDER BY ', campo_ordenamiento, ' ', ordenamiento);

    -- Realizo una consulta dinámica con la query generada anteriormente
    PREPARE stmt FROM @sql;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
END$$
DELIMITER ;

CALL sp_ordenarTabla('productos','nombre','DESCENDENTE');

-- Creo un procedimiento que inserta campos en la tabla
DROP PROCEDURE IF EXISTS sp_insertar_venta;
DELIMITER $$
CREATE PROCEDURE sp_insertar_venta (IN p_fecha DATE, IN p_hora TIME, IN p_id_empleado INT)
BEGIN
    INSERT INTO ventas (FECHA, HORA, ID_EMPLEADO) VALUES (p_fecha, p_hora, p_id_empleado);
END$$
DELIMITER ;

CALL sp_insertar_venta('2023-06-20','15:56:55',3);

-- Creo un procedimiento que devuelve en un param de salida, el total de las ventas de un empleado.
DROP PROCEDURE IF EXISTS sp_ventas_de_empleado;
DELIMITER $$
CREATE PROCEDURE sp_ventas_de_empleado(IN p_id_empleado INT, OUT p_total_ventas INT)
BEGIN
    SELECT COUNT(*) INTO p_total_ventas FROM ventas WHERE ID_EMPLEADO = p_id_empleado;
END$$
DELIMITER ;

-- Declaro una variable de sesión, que estará disponible hasta que termine la conexión.
SET @total_ventas = 0;

CALL sp_ventas_de_empleado(3, @total_ventas);

-- Consulto el valor de la variable de sesión.
SELECT @total_ventas;