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

