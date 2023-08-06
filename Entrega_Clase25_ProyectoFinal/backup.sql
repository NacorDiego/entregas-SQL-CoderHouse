-- TABLAS

-- categorias
-- detalle_metodo_pago_venta
-- detalle_venta
-- empleados
-- log_categorias
-- log_productos
-- log_ventas
-- metodos_pago
-- producto_proveedor
-- productos
-- proveedores
-- subcategorias
-- ventas


-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: negocio_pesca
-- ------------------------------------------------------
-- Server version	8.0.33

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` VALUES (1,'Cañas de pescar'),(2,'Carretes de pesca'),(3,'Señuelos y cebos'),(4,'Anzuelos y accesorios'),(5,'Líneas de pesca'),(6,'Equipamiento de camping'),(7,'Tiendas de campaña'),(8,'Sacos de dormir'),(9,'Colchonetas y almohadas'),(10,'Utensilios de cocina para camping'),(11,'Iluminación y linternas'),(12,'Mochilas y bolsos de camping'),(13,'Botellas y recipientes para agua'),(14,'Herramientas y utensilios de supervivencia'),(15,'Ropa y calzado de outdoor');
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `detalle_metodo_pago_venta`
--

LOCK TABLES `detalle_metodo_pago_venta` WRITE;
/*!40000 ALTER TABLE `detalle_metodo_pago_venta` DISABLE KEYS */;
INSERT INTO `detalle_metodo_pago_venta` VALUES (1,1,1,180.99),(2,2,3,250.50),(3,3,2,200.00),(4,4,1,300.21),(5,5,3,15.00),(6,6,4,12.30),(7,7,1,35.60),(8,8,2,82.20),(9,9,2,46.20),(10,10,3,500.50),(11,11,4,40.50),(12,12,4,350.20),(13,13,3,280.80),(14,14,1,600.00),(15,15,2,500.00);
/*!40000 ALTER TABLE `detalle_metodo_pago_venta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `detalle_venta`
--

LOCK TABLES `detalle_venta` WRITE;
/*!40000 ALTER TABLE `detalle_venta` DISABLE KEYS */;
INSERT INTO `detalle_venta` VALUES (1,4,5,2,9.99),(2,3,8,1,24.99),(3,4,5,2,19.99),(4,4,6,4,129.99),(5,4,2,3,39.99),(6,4,11,1,59.99),(7,4,8,1,24.99),(8,4,13,4,24.99),(9,4,12,5,12.99),(10,4,7,1,39.99),(11,4,10,7,22.99),(12,4,11,2,59.99),(13,4,3,3,14.99),(14,4,1,1,49.99),(15,4,12,1,12.99);
/*!40000 ALTER TABLE `detalle_venta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `empleados`
--

LOCK TABLES `empleados` WRITE;
/*!40000 ALTER TABLE `empleados` DISABLE KEYS */;
INSERT INTO `empleados` VALUES (1,'Juan Carlos Pérez','50 nº 2000 entre 14 y 15','+54 9 221 3564625','juanperez@gmail.com'),(2,'María Alejandra García','20 nº 1500 entre 12 y 13','+54 9 221 7856432','maria.garcia@gmail.com'),(3,'Carlos Eduardo Rodríguez','35 nº 1800 entre 17 y 18','+54 9 221 1234567','carlosrodriguez@gmail.com'),(4,'Ana María López','80 nº 2200 entre 19 y 20','+54 9 221 9876543','anamlopez@gmail.com'),(5,'Javier Antonio Martínez','65 nº 2100 entre 16 y 17','+54 9 221 5678912','javiermartinez@gmail.com'),(6,'Laura Victoria Fernández','40 nº 1900 entre 13 y 14','+54 9 221 2345678','laurafernandez@gmail.com'),(7,'Alejandro José Sánchez','55 nº 2050 entre 15 y 16','+54 9 221 8765432','alejandrosanchez@gmail.com'),(8,'Paula Andrea Torres','30 nº 1700 entre 11 y 12','+54 9 221 3456789','paulatorres@gmail.com'),(9,'Andrés Felipe Ramírez','75 nº 2250 entre 18 y 19','+54 9 221 6543210','andresramirez@gmail.com'),(10,'Isabel Cristina González','90 nº 2400 entre 21 y 22','+54 9 221 7890123','isabelgonzalez@gmail.com'),(11,'Eduardo Alejandro Vargas','25 nº 1600 entre 10 y 11','+54 9 221 4321098','eduardovargas@gmail.com'),(12,'Sofía Isabel Morales','70 nº 2150 entre 16 y 17','+54 9 221 2109876','sofiamorales@gmail.com'),(13,'Pedro José Castro','45 nº 1950 entre 12 y 13','+54 9 221 8765432','pedrocastro@gmail.com'),(14,'Gabriela Patricia Herrera','60 nº 2050 entre 15 y 16','+54 9 221 3456789','gabrielaherrera@gmail.com'),(15,'Luisa María Ortega','85 nº 2300 entre 20 y 21','+54 9 221 6543210','luisaortega@gmail.com');
/*!40000 ALTER TABLE `empleados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `log_categorias`
--

LOCK TABLES `log_categorias` WRITE;
/*!40000 ALTER TABLE `log_categorias` DISABLE KEYS */;
/*!40000 ALTER TABLE `log_categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `log_productos`
--

LOCK TABLES `log_productos` WRITE;
/*!40000 ALTER TABLE `log_productos` DISABLE KEYS */;
INSERT INTO `log_productos` VALUES (1,'INSERT',0,'Tela de teflon','Saco de dormir ligero y compacto, perfecto para actividades al aire libre',29.99,39.99,35.99,12,7,'2023-06-29','17:01:17','root@localhost');
/*!40000 ALTER TABLE `log_productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `log_ventas`
--

LOCK TABLES `log_ventas` WRITE;
/*!40000 ALTER TABLE `log_ventas` DISABLE KEYS */;
/*!40000 ALTER TABLE `log_ventas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `metodos_pago`
--

LOCK TABLES `metodos_pago` WRITE;
/*!40000 ALTER TABLE `metodos_pago` DISABLE KEYS */;
INSERT INTO `metodos_pago` VALUES (1,'Mercado Pago'),(2,'Cuenta DNI'),(3,'Tarjeta de debito'),(4,'Tarjeta de crédito'),(5,'Efectivo');
/*!40000 ALTER TABLE `metodos_pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `producto_proveedor`
--

LOCK TABLES `producto_proveedor` WRITE;
/*!40000 ALTER TABLE `producto_proveedor` DISABLE KEYS */;
INSERT INTO `producto_proveedor` VALUES (1,5,1,9.99),(2,2,2,24.99),(3,3,3,19.99),(4,4,4,129.99),(5,6,5,39.99),(6,7,6,59.99),(7,9,7,24.99),(8,10,8,24.99),(9,1,9,12.99),(10,11,10,39.99),(11,12,11,22.99),(12,5,12,59.99),(13,8,13,14.99),(14,13,14,49.99),(15,14,15,12.99);
/*!40000 ALTER TABLE `producto_proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (1,'Caña de pescar telescópica','Caña de pescar de fibra de carbono telescópica, ideal para la pesca en ríos y lagos',35.50,49.99,45.99,10,1),(2,'Carrete de pesca spinning','Carrete de pesca para spinning con sistema de rodamiento suave y freno ajustable',25.99,39.99,34.99,15,2),(3,'Señuelo artificial crankbait','Señuelo de pesca artificial tipo crankbait, imita a un pez y atrae a los depredadores',8.75,14.99,12.99,20,3),(4,'Anzuelos de pesca triples','Anzuelos triples de alta calidad, ideales para la pesca con señuelos grandes',5.25,9.99,7.99,50,4),(5,'Línea de pesca trenzada','Línea de pesca trenzada resistente y de alto rendimiento, ideal para pesca en aguas saladas',12.99,19.99,16.99,30,5),(6,'Tienda de campaña familiar','Tienda de campaña espaciosa para toda la familia, resistente al agua y fácil de montar',89.99,129.99,119.99,5,6),(7,'Saco de dormir ligero','Saco de dormir ligero y compacto, perfecto para actividades al aire libre',29.99,39.99,35.99,12,7),(8,'Colchoneta inflable','Colchoneta inflable para camping, cómoda y fácil de transportar',18.50,24.99,21.99,25,8),(9,'Set de utensilios de cocina para camping','Set de utensilios de cocina compacto y resistente para actividades de camping',24.99,34.99,30.99,8,9),(10,'Linterna LED recargable','Linterna LED de alto brillo y larga duración, recargable mediante USB',14.99,22.99,19.99,18,10),(11,'Mochila impermeable de senderismo','Mochila impermeable con múltiples compartimentos y correas ajustables, ideal para senderismo',42.99,59.99,54.99,7,11),(12,'Botella de agua plegable','Botella de agua plegable y reutilizable, fácil de transportar en actividades al aire libre',7.99,12.99,10.99,40,12),(13,'Navaja multiusos','Navaja multiusos con múltiples herramientas, compacta y versátil',16.50,24.99,20.99,15,13),(14,'Camiseta de secado rápido','Camiseta de secado rápido para actividades al aire libre, transpirable y resistente al sol, ideal para actividades al aire libre',19.99,29.99,24.99,25,14),(15,'Bolsa estanca para camping','Bolsa estanca resistente al agua y duradera, perfecta para proteger tus pertenencias en entornos húmedos',12.99,19.99,16.99,20,15),(16,'Tela de teflon','Saco de dormir ligero y compacto, perfecto para actividades al aire libre',29.99,39.99,35.99,12,7);
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `proveedores`
--

LOCK TABLES `proveedores` WRITE;
/*!40000 ALTER TABLE `proveedores` DISABLE KEYS */;
INSERT INTO `proveedores` VALUES (1,'Juan Carlos Pérez','60 nº 1912 entre 13 y 14','+54 9 221 3548564','juancarlosperez@gmail.com','www.tiendapeces.com/lista_precios'),(2,'María Alejandra García','70 nº 2310 entre 15 y 16','+54 9 221 9876543','mariaalejandragarcia@gmail.com','www.pecesexpress.com/lista_precios'),(3,'Carlos Eduardo Rodríguez','80 nº 1234 entre 17 y 18','+54 9 221 8765432','carloseduardorodriguez@gmail.com','www.acuariolider.com/lista_precios'),(4,'Ana María López','90 nº 987 entre 19 y 20','+54 9 221 7654321','anamarialopez@gmail.com','www.pescaonline.com/lista_precios'),(5,'Javier Antonio Martínez','100 nº 5678 entre 21 y 22','+54 9 221 6543210','javierantoniomartinez@gmail.com','www.pescaprofesional.com/lista_precios'),(6,'Laura Victoria Fernández','110 nº 3456 entre 23 y 24','+54 9 221 5432109','lauravictoriafernandez@gmail.com','www.pecesfelicidad.com/lista_precios'),(7,'Alejandro José Sánchez','120 nº 7890 entre 25 y 26','+54 9 221 4321098','alejandrojosesanchez@gmail.com','www.artedepescar.com/lista_precios'),(8,'Paula Andrea Torres','130 nº 6543 entre 27 y 28','+54 9 221 3210987','paulaandreatorres@gmail.com','www.pecesmarinos.com/lista_precios'),(9,'Andrés Felipe Ramírez','140 nº 9876 entre 29 y 30','+54 9 221 2109876','andresfeliperamirez@gmail.com','www.pezestropicales.com/lista_precios'),(10,'Isabel Cristina González','150 nº 2345 entre 31 y 32','+54 9 221 1098765','isabelcristinagonzalez@gmail.com','www.tiendapescadores.com/lista_precios'),(11,'Eduardo Alejandro Vargas','160 nº 8765 entre 33 y 34','+54 9 221 0987654','eduardoalejandrovargas@gmail.com','www.pescaaventura.com/lista_precios'),(12,'Sofía Isabel Morales','170 nº 5432 entre 35 y 36','+54 9 221 9876543','sofiaisabelmorales@gmail.com','www.pescaextrema.com/lista_precios'),(13,'Gabriela Patricia Herrera','190 nº 4321 entre 39 y 40','+54 9 221 7654321','gabrielapatriciaherrera@gmail.com','www.pescaaventuraextrema.com/lista_precios'),(14,'Luisa María Ortega','200 nº 9876 entre 41 y 42','+54 9 221 6543210','luisamariaortega@gmail.com','www.pecesdelmundo.com/lista_precios'),(15,'Ricardo Andrés Gómez','210 nº 1234 entre 43 y 44','+54 9 221 5432109','ricardoandresgomez@gmail.com','www.pescaenaccion.com/lista_precios');
/*!40000 ALTER TABLE `proveedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `subcategorias`
--

LOCK TABLES `subcategorias` WRITE;
/*!40000 ALTER TABLE `subcategorias` DISABLE KEYS */;
INSERT INTO `subcategorias` VALUES (1,'Spinning',1),(2,'Baitcasting',1),(3,'Surfcasting',1),(4,'Spinning',2),(5,'Baitcasting',2),(6,'Arrastre',2),(7,'Señuelos artificiales',3),(8,'Cebos naturales',3),(9,'Anzuelos simples',4),(10,'Anzuelos triples',4),(11,'Accesorios de pesca',4),(12,'Afiladores de anzuelos',4),(13,'Variada',5),(14,'Pejerrey',5),(15,'Rio',5);
/*!40000 ALTER TABLE `subcategorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `ventas`
--

LOCK TABLES `ventas` WRITE;
/*!40000 ALTER TABLE `ventas` DISABLE KEYS */;
INSERT INTO `ventas` VALUES (1,'2023-06-01','10:00:00',14),(2,'2023-06-02','12:30:00',2),(3,'2023-06-03','15:45:00',3),(4,'2023-06-04','08:15:00',15),(5,'2023-06-05','14:20:00',1),(6,'2023-06-06','09:45:00',6),(7,'2023-06-07','11:10:00',7),(8,'2023-06-08','16:30:00',2),(9,'2023-06-09','13:25:00',3),(10,'2023-06-10','10:45:00',6),(11,'2023-06-11','14:00:00',8),(12,'2023-06-12','17:45:00',10),(13,'2023-06-13','09:20:00',12),(14,'2023-06-14','12:10:00',11),(15,'2023-06-15','15:50:00',4),(16,'2023-06-20','15:56:55',3);
/*!40000 ALTER TABLE `ventas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-07-10 22:51:29
