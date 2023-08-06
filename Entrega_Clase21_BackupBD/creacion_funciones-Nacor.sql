-- CREACIÓN DE FUNCIONES

USE negocio_pesca;

-- Creación de una función que aplique el IVA a un producto en especifico que paso como parámetro
DROP FUNCTION IF EXISTS calcular_precio_con_IVA;

DELIMITER $$
CREATE FUNCTION calcular_precio_con_IVA (p_IVA decimal(4,2), p_id_prod int)
RETURNS decimal(8,2)
DETERMINISTIC
BEGIN
	DECLARE precio_producto decimal(8,2);
	DECLARE resultado decimal(8,2);
    
    -- Hago una que traiga el precio del producto mediante el ID ingresado como param
    SELECT PRECIO_FINAL INTO precio_producto
    FROM productos
    WHERE id_producto = p_id_prod;
    
    -- Calculo el resultado
    SET resultado = p_IVA * precio_producto;
    
    -- Retorno el resultado
    RETURN resultado;
END$$
DELIMITER ;

-- EJEMPLO: Llamar a la funcion "calcular_precio_con_IVA" para CUENTA DNI y el producto con id = 4.
SELECT calcular_precio_con_IVA(2,4);

-- Creación de una función que aplique verifique el medio de pago y aplique recargo si corresponde
DROP FUNCTION IF EXISTS aplicar_recargo_metodo_pago;

DELIMITER $$
CREATE FUNCTION aplicar_recargo_metodo_pago (p_id_medio_pago int, p_total_vendido decimal(9,2))
RETURNS decimal(9,2)
DETERMINISTIC
BEGIN
	DECLARE resultado decimal(9,2);
    
    -- Aplico el porcentaje según el metodo de pago
    CASE
		WHEN p_id_medio_pago = 1 THEN SET resultado = p_total_vendido * 1.12;
        WHEN p_id_medio_pago = 2 THEN SET resultado = p_total_vendido * 1.1;
        WHEN p_id_medio_pago = 3 THEN SET resultado = p_total_vendido * 1.2;
        WHEN p_id_medio_pago = 4 THEN SET resultado = p_total_vendido * 1.35;
        WHEN p_id_medio_pago = 5 THEN SET resultado = p_total_vendido;
		ELSE SET resultado = -1;
	END CASE;
    
    -- Retorno el resultado
    RETURN resultado;
END$$
DELIMITER ;

-- EJEMPLO: Llamar a la funcion aplicar_recargo_metodo_pago para TARJETA DE CREDITO y una venta de $1000.
SELECT aplicar_recargo_metodo_pago(4,1000);