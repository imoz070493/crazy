-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: perusi_crazy
-- ------------------------------------------------------
-- Server version	5.7.17-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `articulo`
--

DROP TABLE IF EXISTS `articulo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `articulo` (
  `idarticulo` int(11) NOT NULL AUTO_INCREMENT,
  `idcategoria` int(11) NOT NULL,
  `unidad_medida` int(11) DEFAULT NULL,
  `codigo` varchar(50) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `nombre` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `stock` int(11) NOT NULL,
  `descripcion` varchar(512) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `imagen` varchar(50) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `estado` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  PRIMARY KEY (`idarticulo`),
  KEY `fk_articulo_categoria_idx` (`idcategoria`),
  CONSTRAINT `fk_articulo_categoria` FOREIGN KEY (`idcategoria`) REFERENCES `categoria` (`idcategoria`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2146 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articulo`
--

LOCK TABLES `articulo` WRITE;
/*!40000 ALTER TABLE `articulo` DISABLE KEYS */;
INSERT INTO `articulo` VALUES (2104,5,19,'CORO-01','CORONA LITRO',100,'CORONA LITRO',NULL,'Activo'),(2105,5,19,'CORO-02','CORONA',100,'CORONA',NULL,'Activo'),(2106,5,19,'CERVE-01','CERVEZA CRISTAL',100,'CERVEZA CRISTAL',NULL,'Activo'),(2107,5,19,'CERVE-02',' CERVEZA CUSQUEÑA',100,'CERVEZA CUSQUEÑA',NULL,'Activo'),(2108,5,19,'CERVE-03','CERVEZA C. TRIGO',100,'CERVEZA C. TRIGO',NULL,'Activo'),(2109,5,19,'CERVE','CERVEZA PILSEN',100,'CERVEZA PILSEN',NULL,'Activo'),(2110,5,19,'CERVE','CERVEZA C. NEGRA',100,'CERVEZA C. NEGRA',NULL,'Activo'),(2111,5,19,'RON','RON JARRAS',100,'RON JARRAS',NULL,'Activo'),(2112,5,19,'PISCO','PISCO 750',50,'PISCO 750',NULL,'Activo'),(2113,5,19,'PISCO','PISCO JARRA',100,'PICO JARRA',NULL,'Activo'),(2114,1,19,'CIGARRO','CIGARRO HAMILTON',100,'CIGARRO HAMILTON',NULL,'Activo'),(2115,5,19,'CIGARRO','CIGARRO LUCKY',100,'CIGARRO LUCKY',NULL,'Activo'),(2116,5,19,'AGUA','H20',100,'H20',NULL,'Activo'),(2117,5,19,'GASEO','GASEOSAS',100,'GASEOSAS',NULL,'Activo'),(2118,5,19,'APLETON','APLETON',100,'APLETON',NULL,'Activo'),(2119,5,19,'BACARDI','BACARDI RUBIO',100,'BACARDI RUBIO',NULL,'Activo'),(2120,5,19,'BAILEYS','BAILEYS',100,'BAILEYS',NULL,'Activo'),(2121,5,19,'RED','RED BULL',100,'RED BULL',NULL,'Activo'),(2122,5,19,'VODKA','VODKA RUSSKAYA',100,'VODKA RUSSKAYA',NULL,'Activo'),(2123,5,19,'WISKY','WISKY ROJO',100,'WISKY ROJO',NULL,'Activo'),(2124,5,19,'WISKY','WISKY NEGRO',100,'WISKY NEGRO',NULL,'Activo'),(2125,5,19,'WISKY','WISKY CHIVAS',100,'WISKY CHIVAS',NULL,'Activo'),(2126,5,19,'WISKY','WISKY BALLANTIES',100,'WISKY BALLANTIES',NULL,'Activo'),(2127,5,19,'WISKY','WISKY JACK DANIEL',100,'WISKY JACK DANIEL',NULL,'Activo'),(2128,5,19,'WISKY','WISKY OLD TIMES',100,'WISKY OLD TIMES',NULL,'Activo'),(2129,5,19,'FLOR','FLOR DE CAÑA',100,'FLOR DE CAÑA',NULL,'Activo'),(2130,5,19,'HABANA','HABANA CLUB',100,'HABANA CLUB',NULL,'Activo'),(2131,5,19,'RON','RON BLANCO',100,'RON BLANCO',NULL,'Activo'),(2132,5,19,'BACARDI','BACARDI LIMON',100,'BACARDI LIMON',NULL,'Activo'),(2133,5,19,'RON','RON BARCELO',100,'RON BARCELO',NULL,'Activo'),(2134,5,19,'TEQUILA','TEQUILA',100,'TEQUILA',NULL,'Activo'),(2135,5,19,'DOUBLE','DOUBLE BLACK',100,'DOUBLE BLACK',NULL,'Activo'),(2136,5,19,'COCACOLA','COCACOLA',100,'COCACOLA',NULL,'Activo'),(2137,5,19,'DOS','DOS GALLOS',100,'DOS GALLOS',NULL,'Activo'),(2138,5,19,'EVEREST','EVEREST',100,'EVEREST',NULL,'Activo'),(2139,5,19,'JAGUER','JAGUER',100,'JAGUER',NULL,'Activo'),(2140,5,19,'VODKA','VODKA ABSOLUT',100,'VODKA ABSOLUT',NULL,'Activo'),(2141,5,19,'VODKA','VODKA SKY',100,'VODKA SKY',NULL,'Activo'),(2142,5,19,'HIT','HIT',100,'HIT',NULL,'Activo'),(2143,1,19,'EVEREST','EVEREST 2L',100,'EVEREST',NULL,'Activo'),(2144,5,19,'GUARANA','GUARANA 1L',100,'GUARANA 1L',NULL,'Activo'),(2145,5,19,'CORONA','CORONA GRANDE',100,'CORONA GRANDE',NULL,'Activo');
/*!40000 ALTER TABLE `articulo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categoria` (
  `idcategoria` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `descripcion` varchar(256) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `condicion` tinyint(1) NOT NULL,
  PRIMARY KEY (`idcategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'Computo','Computo',1),(2,'Utiles','Utiles',1),(3,'Limpieza','Articulos de Limpieza',1),(4,'Medicina','Articulos medicinales',1),(5,'Liquidos','Liquidos',1),(6,'Comida','productos de comida',1),(7,'Vestimenta','Articulos de Vestimenta',1),(8,'Servicios','Servicios',0),(9,'Accesorios de Sonido 2','Todos los Accesorios 2',0),(10,'Servicios2','',0),(11,'Accesorios de Sonido Nuevo','Todos los accesorios de sonido',0),(12,'Frenos','Frenos de auto',1),(13,'Categoria 3','Categoria 3',1),(14,'suministros','suministros de impresión',1);
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `config`
--

DROP TABLE IF EXISTS `config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ruc` varchar(12) COLLATE utf8_spanish2_ci NOT NULL,
  `razon_social` varchar(300) COLLATE utf8_spanish2_ci NOT NULL,
  `nombre_comercial` varchar(300) COLLATE utf8_spanish2_ci NOT NULL,
  `direccion` varchar(300) COLLATE utf8_spanish2_ci NOT NULL,
  `departamento` varchar(300) COLLATE utf8_spanish2_ci NOT NULL,
  `provincia` varchar(300) COLLATE utf8_spanish2_ci NOT NULL,
  `distrito` varchar(300) COLLATE utf8_spanish2_ci NOT NULL,
  `codpais` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `ubigeo` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `telefono` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `correo` varchar(300) COLLATE utf8_spanish2_ci NOT NULL,
  `usuario` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `clave` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `firma` varchar(200) COLLATE utf8_spanish2_ci NOT NULL,
  `tipo` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `estado` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config`
--

LOCK TABLES `config` WRITE;
/*!40000 ALTER TABLE `config` DISABLE KEYS */;
INSERT INTO `config` VALUES (1,'20564091571','KREAZZY EIRL','KREAZZY','AV. LOS INCAS NRO. SN','Apurimac','Andahuaylas','Andahuaylas','PE','030301','988116060','clinicacavero@gmail.com','CAVERO12','Cavero2019','','3',1),(2,'20100066603','CREVPERU S.A.','CREV PERU COMERCIAL','PSJ HUAMPANI','LIMA2','LIMA','CHACLACAYO','PE','070104','991441592','webmaster@crevperu.com','MODDATOS','moddatos','--','1',0);
/*!40000 ALTER TABLE `config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_ingreso`
--

DROP TABLE IF EXISTS `detalle_ingreso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detalle_ingreso` (
  `iddetalle_ingreso` int(11) NOT NULL AUTO_INCREMENT,
  `idingreso` int(11) NOT NULL,
  `idarticulo` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio_compra` decimal(11,2) NOT NULL,
  `precio_venta` decimal(11,2) NOT NULL,
  `stockTemporal` int(11) DEFAULT NULL,
  PRIMARY KEY (`iddetalle_ingreso`),
  KEY `fk_detalle_ingreso_articulo_idx` (`idarticulo`),
  KEY `fk_ingreso_idx` (`idingreso`),
  CONSTRAINT `fk_detalle_ingreso_articulo` FOREIGN KEY (`idarticulo`) REFERENCES `articulo` (`idarticulo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ingreso` FOREIGN KEY (`idingreso`) REFERENCES `ingreso` (`idingreso`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_ingreso`
--

LOCK TABLES `detalle_ingreso` WRITE;
/*!40000 ALTER TABLE `detalle_ingreso` DISABLE KEYS */;
INSERT INTO `detalle_ingreso` VALUES (36,28,2104,100,50.00,70.00,100),(37,28,2105,100,60.00,80.00,100),(38,28,2106,100,50.00,70.00,100),(39,28,2107,100,70.00,90.00,100),(40,28,2108,100,80.00,100.00,100),(41,28,2109,100,80.00,100.00,100),(42,28,2110,100,80.00,100.00,100),(43,28,2111,100,80.00,100.00,100),(44,28,2112,50,70.00,90.00,50),(45,28,2113,100,40.00,60.00,100),(46,28,2114,100,1.00,2.00,100),(47,28,2115,100,1.00,2.00,100),(48,28,2116,100,2.00,3.00,100),(49,28,2117,100,4.00,6.00,100),(50,28,2118,100,40.00,60.00,100),(51,28,2119,100,50.00,70.00,100),(52,28,2120,100,50.00,70.00,100),(53,28,2121,100,50.00,80.00,100),(54,28,2122,100,40.00,60.00,100),(55,28,2123,100,80.00,100.00,100),(56,28,2124,100,50.00,70.00,100),(57,28,2125,100,40.00,60.00,100),(58,28,2126,100,40.00,30.00,100),(59,28,2127,100,50.00,80.00,100),(60,28,2128,100,40.00,30.00,100),(61,28,2129,100,50.00,30.00,100),(62,28,2130,100,40.00,60.00,100),(63,28,2131,100,40.00,60.00,100),(64,28,2132,100,50.00,60.00,100),(65,28,2133,100,50.00,70.00,100),(66,28,2134,100,30.00,50.00,100),(67,28,2135,100,30.00,50.00,100),(68,28,2136,100,2.00,10.00,100),(69,28,2137,100,50.00,30.00,100),(70,28,2138,100,50.00,70.00,100),(71,28,2139,100,40.00,70.00,100),(72,28,2140,100,50.00,60.00,100),(73,28,2141,100,50.00,80.00,100),(74,28,2142,100,40.00,50.00,100),(75,28,2143,100,50.00,80.00,100),(76,28,2144,100,50.00,70.00,100),(77,28,2145,100,50.00,70.00,100);
/*!40000 ALTER TABLE `detalle_ingreso` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER tr_updStockIngreso AFTER INSERT ON detalle_ingreso
	FOR EACH ROW BEGIN
		UPDATE articulo SET stock = stock + NEW.cantidad
        WHERE articulo.idarticulo = NEW.idarticulo;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `detalle_venta`
--

DROP TABLE IF EXISTS `detalle_venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detalle_venta` (
  `iddetalle_venta` int(11) NOT NULL AUTO_INCREMENT,
  `idventa` int(11) NOT NULL,
  `idarticulo` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio_venta` decimal(11,2) NOT NULL,
  `descuento` decimal(11,2) NOT NULL,
  `stockTemporal` int(11) DEFAULT NULL,
  PRIMARY KEY (`iddetalle_venta`),
  KEY `fk_detalle_venta_articulo_idx` (`idarticulo`),
  KEY `fk_detalle_venta_idx` (`idventa`),
  CONSTRAINT `fk_detalle_venta` FOREIGN KEY (`idventa`) REFERENCES `venta` (`idventa`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_detalle_venta_articulo` FOREIGN KEY (`idarticulo`) REFERENCES `articulo` (`idarticulo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=748 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_venta`
--

LOCK TABLES `detalle_venta` WRITE;
/*!40000 ALTER TABLE `detalle_venta` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalle_venta` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER tr_updStockVenta AFTER INSERT ON detalle_venta
	FOR EACH ROW BEGIN
		UPDATE articulo SET stock = stock - NEW.cantidad
        WHERE articulo.idarticulo = NEW.idarticulo;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `ingreso`
--

DROP TABLE IF EXISTS `ingreso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ingreso` (
  `idingreso` int(11) NOT NULL AUTO_INCREMENT,
  `idproveedor` int(11) NOT NULL,
  `tipo_comprobante` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `serie_comprobante` varchar(7) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `num_comprobante` varchar(10) COLLATE utf8_spanish2_ci NOT NULL,
  `total_compra` decimal(11,2) NOT NULL,
  `fecha_hora` datetime NOT NULL,
  `impuesto` decimal(4,2) NOT NULL,
  `estado` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  PRIMARY KEY (`idingreso`),
  KEY `fk_ingreso_persona_idx` (`idproveedor`),
  CONSTRAINT `fk_ingreso_persona` FOREIGN KEY (`idproveedor`) REFERENCES `persona` (`idpersona`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingreso`
--

LOCK TABLES `ingreso` WRITE;
/*!40000 ALTER TABLE `ingreso` DISABLE KEYS */;
INSERT INTO `ingreso` VALUES (28,2,'Boleta','B001','001',188500.00,'2019-12-14 10:39:51',18.00,'A');
/*!40000 ALTER TABLE `ingreso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marca`
--

DROP TABLE IF EXISTS `marca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `marca` (
  `idmarca` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `descripcion` varchar(256) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `condicion` tinyint(1) NOT NULL,
  PRIMARY KEY (`idmarca`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marca`
--

LOCK TABLES `marca` WRITE;
/*!40000 ALTER TABLE `marca` DISABLE KEYS */;
INSERT INTO `marca` VALUES (1,'Generico','Generico',1),(2,'Toshiba','Toshiba',1),(3,'Frenosa','Marca de frenos',1),(4,'Marca 3','Marca 3',1);
/*!40000 ALTER TABLE `marca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES ('2014_10_12_000000_create_users_table',1),('2014_10_12_100000_create_password_resets_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY `password_resets_email_index` (`email`),
  KEY `password_resets_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
INSERT INTO `password_resets` VALUES ('michael@gmail.com','db3850ad97b510c48dafdb9b286d841370e20c38f042b11789e111730249e376','2019-01-31 20:11:06');
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permiso`
--

DROP TABLE IF EXISTS `permiso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permiso` (
  `idpermiso` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `codigo` int(11) DEFAULT NULL,
  `idrol` int(11) DEFAULT NULL,
  PRIMARY KEY (`idpermiso`),
  KEY `fk_idrol_idx` (`idrol`),
  CONSTRAINT `fk_idrol` FOREIGN KEY (`idrol`) REFERENCES `rol` (`idrol`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permiso`
--

LOCK TABLES `permiso` WRITE;
/*!40000 ALTER TABLE `permiso` DISABLE KEYS */;
INSERT INTO `permiso` VALUES (1,'almacen',1,1),(2,'compras ',2,1),(3,'ventas ',3,1),(4,'acceso ',4,1),(5,'facturacion electronica ',5,1),(6,'reportes ',6,1),(7,'configuracion ',7,1),(8,'ayuda ',8,1),(9,'acerca de  ',9,1),(10,'almacen ',1,2),(11,'compras ',2,2),(12,'ventas ',3,2),(13,'facturacion electronica ',5,2);
/*!40000 ALTER TABLE `permiso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persona`
--

DROP TABLE IF EXISTS `persona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `persona` (
  `idpersona` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_persona` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `nombre` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `razon_social` varchar(100) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `tipo_documento` varchar(20) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `num_documento` varchar(15) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `direccion` varchar(70) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `telefono` varchar(15) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `email` varchar(50) COLLATE utf8_spanish2_ci DEFAULT NULL,
  PRIMARY KEY (`idpersona`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persona`
--

LOCK TABLES `persona` WRITE;
/*!40000 ALTER TABLE `persona` DISABLE KEYS */;
INSERT INTO `persona` VALUES (1,'Cliente','ADEA',NULL,'02','20527005745','AV. PERU NRO. 363- ANDAHUAYLAS','','gquintana@adea.org.pe'),(2,'Proveedor','Juan Perez',NULL,'DNI','87568765',NULL,NULL,NULL),(3,'Cliente','Jose Martinez',NULL,'01','78432143','Lima 51','','jose@gmail.com'),(4,'Proveedor','Soluciones Innovadoras Peru SAC',NULL,'RUC','20600','Lima','782913',''),(5,'Proveedor','Innovadores Andahuaylas',NULL,'RUC','20561717181','Andahuaylas','',''),(6,'Proveedor','Valentina Quispe',NULL,'RUC','10729144386','Jr Andahuaylas','988674768','imoz070493@gmail.com'),(7,'Cliente','GABRIELA MERINO QUISPE',NULL,'01','45817948','Andahuaylas','987654321',''),(8,'Cliente','ndjkasn',NULL,'01','432423423','ndjkasn','47346',''),(9,'Cliente','dklas',NULL,'01','7482734','mfdlkds','578934','jfdklasj@njkfds.com'),(10,'Cliente','mfklds',NULL,'01','975348','dmkals','798432','mdlks@nfkjds.com'),(11,'Cliente','Estela Zarabia Saccaco',NULL,'01','31157397','Jr Ayacucho 135','9876543321','estela@gmail.com'),(12,'Cliente','Deysi Arias Yolanda',NULL,'01','87654321','Talavera','987654321',''),(13,'Cliente','IRVING MICHAEL ORTEGA ZARABIA',NULL,'01','72914438','Jr Ayacucho 135','988674768','imoz070493@gmail.com'),(14,'Cliente','EQUIPOS-SERVICIOS DE SEGURIDAD Y COMPUTO ESERSEC S.A.C. - ESERSEC S.A.C.',NULL,'02','20563817161','JR. CONSTITUCION NRO. 564 (A MEDIA CUADRA DEL MUNICIPIO)','',''),(15,'Cliente','DENNISE GLORIA MENDOZA VENEGAS',NULL,'01','45050484','','','mychy_7@hotmail.com'),(16,'Cliente','CLINICA CAVERO EIRL',NULL,'02','20564091571','AV. LOS INCAS NRO. SN (FRENTE BCO.DE LA NACION PARQUE SINCHI AN)','988674768','mychy_7@hotmail.com'),(19,'Cliente','ROSARIO CAVERO TOMAYLLA',NULL,'01','31480280','Andahuaylas','',''),(20,'Cliente','NELY MENDOZA OCHOA',NULL,'01','40980918','','',''),(21,'Cliente','CONCEPCION CCENTE OLARTE',NULL,'01','09851894','','','');
/*!40000 ALTER TABLE `persona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resumen`
--

DROP TABLE IF EXISTS `resumen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resumen` (
  `idresumen` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` int(11) DEFAULT NULL,
  `codigo` varchar(10) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `serie` varchar(100) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `numero` varchar(100) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  `hash` varchar(300) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `hash_cdr` varchar(300) CHARACTER SET utf8 DEFAULT NULL,
  `mensaje` varchar(300) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `ticket` varchar(200) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `fecha_documento` date DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  PRIMARY KEY (`idresumen`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resumen`
--

LOCK TABLES `resumen` WRITE;
/*!40000 ALTER TABLE `resumen` DISABLE KEYS */;
INSERT INTO `resumen` VALUES (60,0,'RC','20190504','1',2,'7qHfg7Off+2e1uBPNDaIAt/122Q=','CyDHEEuGgOiNhDT/0Jmpj2LiuYqPRYMTcyg/w8cT57JMghlW9apo3mrEfBoyl1+vSCou1j7r/6Ji1ICQHgoOrw==','El Resumen diario RC-20190504-1, ha sido aceptado','1556980358889','2019-05-04','2019-05-04'),(61,0,'RC','20190514','1',2,'CFGSsN1zIwcm6PC3Drf9dVPp4Ow=','hSX50YuEpumjHd8NKCPubjhCqzmH7E7VUONNYFwpWM/mctEiw9XsU0zvBf5hPZFPTxwhyNS06opASGPKbBL/5w==','El Resumen diario RC-20190514-1, ha sido aceptado','1557871339855','2019-05-14','2019-05-14'),(62,0,'RC','20190801','1',2,'jZPauWJZOcKteFDv0BB35A5/SAM=','4B1VjtU3nSct9V6Vtf7gQWnCu1QBJ/7HCJLSKGz5LPlt8Ojgmzfp0WjEvAFpHiBPKj07m6dzLDGqvWqS0pQaDQ==','El Resumen diario RC-20190801-1, ha sido aceptado','1564690432030','2019-07-25','2019-08-01'),(63,0,'RC','20190801','2',2,'R6N3R9GhgYnJTdO+R08yMcJJd6M=','vX3Ag7Fu3s3XYLEmJ7OZib9FskydM6UmQo/q26liwWVsMR8pYAtBLZCyaUfqRFIpUGa4p7j1rglCUeeTIAKgFA==','El Resumen diario RC-20190801-2, ha sido aceptado','1564691090024','2019-07-25','2019-08-01'),(64,0,'RC','20190801','3',2,'ggYXti/hUpRYsjy+vhgIsfTFKtg=','Dy0eyrwXou0kEwHdyJ1xeW0bdAtFZaFSscwHJQM8+xTqUX1vOsw37dY3CPfDf3rdJMV3z+D7mfpjsMmypIAnTw==','El Resumen diario RC-20190801-3, ha sido aceptado','1564691471529','2019-07-25','2019-08-01'),(65,0,'RC','20190801','4',2,'McC6+OsCz9n8SkttXLCWF0pdaBM=','+6j0QzjaOIA0Dn1INStlubsAheBpaxWTYlzblx27qs42YHXuhbh/SF8rqelwppLA9XFSMOaJs1riDoXJJDoPDA==','El Resumen diario RC-20190801-4, ha sido aceptado','1564694393530','2019-08-01','2019-08-01'),(66,0,'RC','20190801','5',2,'yGIYOxudEylM5MeoLvfBqh5CZng=','aGkS75q89oVr9/O+PylhHkirHdQO6SRNDjcBPXJ0LdzMJECLo95PVNJPIeeI4cSP49D/ScKJJ1ME05GGvbImKg==','El Resumen diario RC-20190801-5, ha sido aceptado','1564694688254','2019-07-25','2019-08-01'),(67,0,'RC','20190801','6',2,'yGIYOxudEylM5MeoLvfBqh5CZng=','aGkS75q89oVr9/O+PylhHkirHdQO6SRNDjcBPXJ0LdzMJECLo95PVNJPIeeI4cSP49D/ScKJJ1ME05GGvbImKg==','El Resumen diario RC-20190801-5, ha sido aceptado','1564694688254','2019-07-25','2019-08-01');
/*!40000 ALTER TABLE `resumen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol`
--

DROP TABLE IF EXISTS `rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rol` (
  `idrol` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) COLLATE utf8_spanish2_ci DEFAULT NULL,
  PRIMARY KEY (`idrol`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol`
--

LOCK TABLES `rol` WRITE;
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
INSERT INTO `rol` VALUES (1,'administrador'),(2,'responsable');
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tabla1`
--

DROP TABLE IF EXISTS `tabla1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tabla1` (
  `idtabla1` int(11) NOT NULL AUTO_INCREMENT,
  `column1` varchar(45) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `column2` varchar(45) COLLATE utf8_spanish2_ci DEFAULT NULL,
  PRIMARY KEY (`idtabla1`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tabla1`
--

LOCK TABLES `tabla1` WRITE;
/*!40000 ALTER TABLE `tabla1` DISABLE KEYS */;
INSERT INTO `tabla1` VALUES (1,'valor1','valor1.1'),(2,'valor2','valor2.2');
/*!40000 ALTER TABLE `tabla1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unidad_medida`
--

DROP TABLE IF EXISTS `unidad_medida`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unidad_medida` (
  `idunidad_medida` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(300) COLLATE utf8_spanish2_ci NOT NULL,
  `codigo` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `cont` text COLLATE utf8_spanish2_ci NOT NULL,
  PRIMARY KEY (`idunidad_medida`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unidad_medida`
--

LOCK TABLES `unidad_medida` WRITE;
/*!40000 ALTER TABLE `unidad_medida` DISABLE KEYS */;
INSERT INTO `unidad_medida` VALUES (1,'BALDE','BJ',''),(2,'BOLSA','BG',''),(3,'BOTELLAS','BO',''),(4,'CAJA','BX',''),(5,'CARTONES','CT',''),(6,'CILINDRO','CY',''),(7,'CONOS','CJ',''),(8,'GRAMO','GRM',''),(9,'JUEGO','SET',''),(10,'KILOGRAMO','KGM',''),(11,'KILOMETRO','KTM',''),(12,'KIT','KT',''),(13,'LATAS','CA',''),(14,'LIBRAS','LBR',''),(15,'LITRO','LTR',''),(16,'METRO','MTR',''),(17,'MILLARES','MLL',''),(18,'MILLON DE UNIDADES','UM',''),(19,'UNIDAD (BIENES)','NIU',''),(20,'UNIDAD (SERVICIOS)','ZZ','');
/*!40000 ALTER TABLE `unidad_medida` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `idrol` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (3,'Irving Ortega','imoz070493@gmail.com','$2y$10$NJbQ4hWE69RWBFBV7KVVu.ibpRYg2i8BO/dBu6vpuPuUQVxw6qpza','l9X7IhTO0t7ya2bwTiYxj1uVru7fe2nUrugpXNXvDJu49lk56ChcttBtylXz','2018-09-11 03:23:20','2019-12-14 15:07:43',1),(4,'Irving Ortega','irving@gmail.com','$2y$10$a/OcFIvRhIpXECgMaWmth.VitY1Bukz1RQ2r8J0iJYnePymE3/.f.','VYJaMIY7OZyxDfmmfIFVShjcp1oU2h2I8lgQB1rz78iSOn8JuLazbkgqd99a','2019-01-31 20:13:57','2019-01-31 20:15:27',2),(5,'Gabriela Merino','gabi@gmail.com','$2y$10$5Gw9Yl6fGwmwF6ms96UsBu4QMj5qqbEiU1CGJ/.qytCkVJamgeze.','LdD3f977824kyXN4VIBQJMMlySfJ75r3TIejnBdSE4j4FmorPfIsau1wGIW6','2019-01-31 20:21:56','2019-01-31 20:37:53',2);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venta`
--

DROP TABLE IF EXISTS `venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `venta` (
  `idventa` int(11) NOT NULL AUTO_INCREMENT,
  `idcliente` int(11) NOT NULL,
  `tipo_comprobante` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `docmodifica_tipo` varchar(10) CHARACTER SET utf8 DEFAULT NULL,
  `docmodifica` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `modifica_motivo` varchar(10) CHARACTER SET utf8 DEFAULT NULL,
  `modifica_motivod` varchar(300) CHARACTER SET utf8 DEFAULT NULL,
  `serie_comprobante` varchar(7) COLLATE utf8_spanish2_ci NOT NULL,
  `num_comprobante` varchar(10) COLLATE utf8_spanish2_ci NOT NULL,
  `fecha_hora` datetime NOT NULL,
  `impuesto` decimal(4,2) NOT NULL,
  `total_venta` decimal(11,2) NOT NULL,
  `moneda` varchar(20) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `estado` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `response_code` varchar(45) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `descripcion_code` varchar(45) COLLATE utf8_spanish2_ci DEFAULT NULL,
  PRIMARY KEY (`idventa`),
  KEY `fk_venta_cliente_idx` (`idcliente`),
  CONSTRAINT `fk_venta_cliente` FOREIGN KEY (`idcliente`) REFERENCES `persona` (`idpersona`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=625 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venta`
--

LOCK TABLES `venta` WRITE;
/*!40000 ALTER TABLE `venta` DISABLE KEYS */;
/*!40000 ALTER TABLE `venta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'perusi_crazy'
--
/*!50003 DROP PROCEDURE IF EXISTS `paKardex` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `paKardex`(
	IN  peIdArticulo VARCHAR(11))
BEGIN
	SELECT concat("Ventas") as tipo,v.tipo_comprobante, v.serie_comprobante, v.num_comprobante, v.fecha_hora, dt.cantidad, dt.stockTemporal
	FROM venta as v
	inner join detalle_venta dt ON v.idventa = dt.idventa
	inner join articulo a ON dt.idarticulo = a.idarticulo
	where a.idarticulo = peIdArticulo
	union
	SELECT concat("Compra") as tipo,i.tipo_comprobante, i.serie_comprobante, i.num_comprobante, i.fecha_hora, di.cantidad, di.stockTemporal
	FROM ingreso as i
	inner join detalle_ingreso di ON i.idingreso = di.idingreso
	inner join articulo a ON di.idarticulo = a.idarticulo
	where a.idarticulo = peIdArticulo
	order by fecha_hora  desc;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-12-14 10:40:55
