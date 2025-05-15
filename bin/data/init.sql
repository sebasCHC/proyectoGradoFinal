-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: proyectogrado
-- ------------------------------------------------------
-- Server version	9.2.0

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
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `id_cliente` int NOT NULL AUTO_INCREMENT,
  `nombre_cliente` varchar(45) NOT NULL,
  `telefono` int DEFAULT NULL,
  `direccion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_venta`
--

DROP TABLE IF EXISTS `detalle_venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_venta` (
  `id_producto` int NOT NULL,
  `id_venta` int NOT NULL,
  `cantidad` int NOT NULL,
  `importe` decimal(12,2) NOT NULL,
  PRIMARY KEY (`id_producto`,`id_venta`),
  KEY `detalle_venta_ibfk_2_idx` (`id_venta`),
  CONSTRAINT `detalle_venta_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`),
  CONSTRAINT `detalle_venta_ibfk_2` FOREIGN KEY (`id_venta`) REFERENCES `ventas` (`id_venta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_venta`
--

LOCK TABLES `detalle_venta` WRITE;
/*!40000 ALTER TABLE `detalle_venta` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalle_venta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entrada_producto`
--

DROP TABLE IF EXISTS `entrada_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entrada_producto` (
  `id_producto` int NOT NULL,
  `id_proveedor` int NOT NULL,
  `fecha_entrada` date NOT NULL,
  `cantidad_entrada` int NOT NULL,
  `monto` decimal(16,2) DEFAULT NULL,
  PRIMARY KEY (`id_producto`,`id_proveedor`),
  KEY `id_proveedor` (`id_proveedor`) /*!80000 INVISIBLE */,
  KEY `entrada_producto_ibfk_1_idx` (`id_producto`),
  CONSTRAINT `entrada_producto_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`),
  CONSTRAINT `entrada_producto_ibfk_2` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedores` (`id_proveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entrada_producto`
--

LOCK TABLES `entrada_producto` WRITE;
/*!40000 ALTER TABLE `entrada_producto` DISABLE KEYS */;
INSERT INTO `entrada_producto` VALUES (8,7,'2020-12-24',99,NULL),(9,8,'2025-05-15',500,NULL),(10,9,'2025-05-22',900,NULL),(11,10,'2025-05-25',500,NULL),(12,11,'2025-05-13',600,150.00),(13,12,'2025-05-19',10,1000.99),(14,13,'2025-05-16',512,500.00),(15,14,'2025-05-09',501,0.00),(16,15,'2025-05-09',501,9.99),(17,16,'2025-05-05',20,0.00),(18,17,'2025-05-05',20,1000.00),(19,18,'2025-05-05',20,1000.00),(20,19,'2025-05-05',20,1000.00),(21,20,'2025-05-24',11,1122.00),(22,21,'2025-05-08',123,111.00),(23,22,'2025-05-17',122,0.00),(24,23,'2025-05-17',122,1122.00),(25,24,'2025-05-05',200,0.00),(26,25,'2029-05-15',10,200.00);
/*!40000 ALTER TABLE `entrada_producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `id_producto` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  `cantidad` int NOT NULL,
  `valor_unitario` decimal(10,2) NOT NULL,
  `valor_total` decimal(16,2) DEFAULT NULL,
  PRIMARY KEY (`id_producto`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (1,'manzana','',22,3.00,NULL),(2,'manzana','hola amigo',1,3.00,NULL),(3,'mangos','nolose',122,7.00,NULL),(4,'pera','muchas peras',121,2.00,NULL),(5,'banana','amarillas',123,12.00,NULL),(6,'naranjas','grandes',12,1.00,NULL),(7,'mangos','verdes',9,1.00,NULL),(8,'mangos','verdes',1,1.00,NULL),(9,'uvas','muy grandes',0,1.00,NULL),(10,'peras','Son un monton de peras que me encontre y las ',900,2.00,NULL),(11,'bananas','muy amarillas',500,3.00,1495.00),(12,'maracuyá','pequeñas',600,0.00,270.00),(13,'cerezas','lo que sea',10,1.99,19.90),(14,'legumbres','demasiado pequeñas',512,1.99,1018.88),(15,'tacos','',501,2.93,1467.93),(16,'tacos','',501,2.93,1467.93),(17,'pera','',20,9.99,199.80),(18,'pera','asdasddasd',20,9.99,199.80),(19,'pera','asdasddasd',20,9.99,199.80),(20,'pera','asdasddasd',20,9.99,199.80),(21,'asdd','asdas',11,11.00,121.00),(22,'asds','asdad',123,11.00,1353.00),(23,'qewe','',122,123.00,15006.00),(24,'qewe','asdas',122,123.00,15006.00),(25,'mangosPrueba','',200,0.00,0.00),(26,'mangosPrueba2','mangos naranjas',10,1.99,19.90);
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedores`
--

DROP TABLE IF EXISTS `proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedores` (
  `id_proveedor` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `telefono` int DEFAULT NULL,
  `direccion` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id_proveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedores`
--

LOCK TABLES `proveedores` WRITE;
/*!40000 ALTER TABLE `proveedores` DISABLE KEYS */;
INSERT INTO `proveedores` VALUES (1,'miguel',NULL,NULL),(2,'Jose',NULL,NULL),(3,'perasSA',NULL,NULL),(4,'Jose',NULL,NULL),(5,'naranjasSA',NULL,NULL),(6,'mangosSA',NULL,NULL),(7,'mangosSA',NULL,NULL),(8,'UverosMiguel',NULL,NULL),(9,'perasSA',NULL,NULL),(10,'Canarias',NULL,NULL),(11,'Amazon',NULL,NULL),(12,'Jaime',NULL,NULL),(13,'legumbreSA',123456789,'Calle Narnia 10, Alcorcon, 28989, Madrid'),(14,'taquero',0,''),(15,'taquero',1234564,''),(16,'san josé',0,''),(17,'san josé',0,''),(18,'san josé',6664533,''),(19,'san josé',6664533,'pepito 11123'),(20,'asda',1213,'asdaas'),(21,'asd',21231,'sadasd'),(22,'asdsad',0,''),(23,'asdsad',213123,'asdas'),(24,'javier',0,''),(25,'merca madrid       ',0,'cesur');
/*!40000 ALTER TABLE `proveedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubicaciones`
--

DROP TABLE IF EXISTS `ubicaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ubicaciones` (
  `id_ubicacion` int NOT NULL AUTO_INCREMENT,
  `id_producto` int NOT NULL,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`id_ubicacion`),
  KEY `ubicacions_idfk1_idx` (`id_producto`),
  CONSTRAINT `ubicaciones_idfk1` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubicaciones`
--

LOCK TABLES `ubicaciones` WRITE;
/*!40000 ALTER TABLE `ubicaciones` DISABLE KEYS */;
INSERT INTO `ubicaciones` VALUES (1,2,'litera'),(2,3,'Estante A4'),(3,4,'almacen'),(4,5,'Almacen'),(5,6,'Dormitorio'),(6,8,'Almacen B'),(7,9,'nevera A4'),(8,10,'nevera de peras'),(9,11,'planta A, nevera B'),(10,12,'nevara A9'),(11,13,'nevera'),(12,14,'no lo sé '),(13,15,'nevera'),(14,16,'nevera'),(15,17,'palet 12'),(16,18,'palet 12'),(17,19,'palet 12'),(18,20,'palet 12'),(19,21,'sdad'),(20,22,'asdas'),(21,23,'asdasd'),(22,24,'asdasd'),(23,25,'nevera'),(24,26,'armario');
/*!40000 ALTER TABLE `ubicaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario_producto`
--

DROP TABLE IF EXISTS `usuario_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario_producto` (
  `id_usuario` int NOT NULL,
  `id_producto` int NOT NULL,
  `fecha_manipulacion` datetime NOT NULL,
  PRIMARY KEY (`id_usuario`,`id_producto`),
  KEY `id_producto` (`id_producto`),
  CONSTRAINT `usuario_producto_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`),
  CONSTRAINT `usuario_producto_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_producto`
--

LOCK TABLES `usuario_producto` WRITE;
/*!40000 ALTER TABLE `usuario_producto` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario_producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `usuario` varchar(16) NOT NULL,
  `contrasenha` varchar(16) NOT NULL,
  `empresa` varchar(30) NOT NULL,
  `palabra_secreta` varchar(10) NOT NULL,
  PRIMARY KEY (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'sebas','12345','proyectoEjemplo','proyecto'),(2,'luigi','luigi','',''),(3,'Jaime','Jaime','JaimeJR',''),(4,'javi','javi123','',''),(20,'asd','asd','asd',''),(21,'asds','jejeje','','fruta'),(22,'usuarioPrueba','prueba','PruebaGrandeEmpresaCon30Caract','prueba');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ventas`
--

DROP TABLE IF EXISTS `ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ventas` (
  `id_venta` int NOT NULL AUTO_INCREMENT,
  `id_cliente` int NOT NULL,
  `fecha_venta` datetime NOT NULL,
  PRIMARY KEY (`id_venta`),
  KEY `ventas_ibfk_1` (`id_cliente`),
  CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventas`
--

LOCK TABLES `ventas` WRITE;
/*!40000 ALTER TABLE `ventas` DISABLE KEYS */;
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

-- Dump completed on 2025-05-15 23:20:41
