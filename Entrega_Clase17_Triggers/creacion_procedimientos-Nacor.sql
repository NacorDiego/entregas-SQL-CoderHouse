-- CREACIÓN DE PROCEDIMIENTOS
USE negocio_pesca;

-- Creo un procedimiento que ordene los campos de la tabla ingresada como parametro
DROP PROCEDURE IF EXISTS sp_ordenarTabla;
DELIMITER $$
CREATE PROCEDURE sp_ordenarTabla (IN tabla VARCHAR(100), IN campo_ordenamiento VARCHAR(100), IN tipo_orden VARCHAR(10))
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

-- Creo un procedimiento que inserta campos en la tabla
DROP PROCEDURE IF EXISTS sp_insertar_empleado;
DELIMITER $$
CREATE PROCEDURE sp_insertar_empleado (IN p_fecha DATE, IN p_hora TIME, IN p_id_empleado INT)
BEGIN
    INSERT INTO ventas (FECHA, HORA, ID_EMPLEADO) VALUES (p_fecha, p_hora, p_id_empleado);
END$$
DELIMITER ;