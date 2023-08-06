-- CREACION DE VISTAS (VIEWS)

-- Uso el esquema negocio_pesca
USE negocio_pesca;

-- Crea una vista que muestra la cantidad de ventas que hubo por día en el mes actual.

CREATE OR REPLACE VIEW VW_ventas_mes_actual as 
(
	SELECT fecha, count(id_venta) as cantidad_ventas
	FROM Ventas
	WHERE MONTH(fecha)=MONTH(CURDATE()) and YEAR(fecha)=YEAR(NOW()) 
	GROUP BY fecha
	ORDER BY fecha ASC
);

-- Crea una vista que muestra a la categoría y subcategoría que pertenece cada producto.

CREATE OR REPLACE VIEW VW_categoria_subcategoria_producto as
(
	SELECT p.nombre AS Producto, s.nombre AS Subcategoria, c.nombre AS Categoria 
	FROM productos AS p 
	INNER JOIN subcategorias AS s 
	ON p.id_subcategoria = s.id_subcategoria 
	INNER JOIN categorias AS c 
	ON s.id_categoria = c.id_categoria
);

-- Crea una vista que lista todos los productos comprados a cada proveedor.

CREATE OR REPLACE VIEW VW_productos_proveedor AS
(
	SELECT P.NOMBRE_APELLIDO AS Proveedor, PR.NOMBRE AS Producto
	FROM PROVEEDORES P
	JOIN PRODUCTO_PROVEEDOR PP ON P.ID_PROVEEDOR = PP.ID_PROVEEDOR
	JOIN PRODUCTOS PR ON PP.ID_PRODUCTO = PR.ID_PRODUCTO
);

-- Crea una vista que muestra la cantidad de productos proveidos por cada proveedor.

CREATE OR REPLACE VIEW VW_cantidad_productos_por_proveedor as
(
	SELECT PR.NOMBRE_APELLIDO AS Proveedor, COUNT(PP.ID_PRODUCTO) AS Cantidad_Productos
	FROM PROVEEDORES PR
	JOIN PRODUCTO_PROVEEDOR PP ON PR.ID_PROVEEDOR = PP.ID_PROVEEDOR
	GROUP BY PR.ID_PROVEEDOR, PR.NOMBRE_APELLIDO
);

-- Crea una vista que muestra la cantidad de ventas que hubo con cada medio de pago.

CREATE OR REPLACE VIEW VW_ventas_por_mediodepago as
(
	SELECT mp.nombre AS Medio_de_Pago, COUNT(mpv.ID_VENTA) as Cantidad_Ventas
    FROM metodos_pago mp
    JOIN detalle_metodo_pago_venta mpv ON mp.id_metodo_pago = mpv.id_metodo_pago
    GROUP BY mp.id_metodo_pago, mp.nombre
);

-- Crea una viste que muetra el ranking con los 3 empleados que mas vendieron (Si tienen la misma cantidad de ventas los ordena por id).

CREATE OR REPLACE VIEW VW_ranking_empleados_mas_ventas AS 
(
	SELECT e.ID_EMPLEADO, e.NOMBRE_APELLIDO, COUNT(v.ID_VENTA) AS total_ventas
	FROM EMPLEADOS e
	JOIN VENTAS v ON e.ID_EMPLEADO = v.ID_EMPLEADO
	GROUP BY e.ID_EMPLEADO
	ORDER BY total_ventas DESC
	LIMIT 3
);

-- Crea una vista que muestra los 5 productos con menos cantidad disponible (Si la cantidad es la misma los ordena por id).

CREATE OR REPLACE VIEW VW_productos_menos_disponibles AS
(
	SELECT ID_PRODUCTO, NOMBRE, CANTIDAD_DISPONIBLE
	FROM PRODUCTOS
	ORDER BY CANTIDAD_DISPONIBLE ASC
	LIMIT 5
);

-- Crea una vista que devuelve información de contacto de los proveedores.

CREATE OR REPLACE VIEW VW_info_proveedores AS
(
	SELECT ID_PROVEEDOR, CONCAT(NOMBRE_APELLIDO, ' - ', TELEFONO, ' - ', CORREO_ELECTRONICO) AS info_contacto
	FROM PROVEEDORES
);