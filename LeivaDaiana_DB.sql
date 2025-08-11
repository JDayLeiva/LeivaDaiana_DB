CREATE DATABASE  IF NOT EXISTS `mercury_solutions_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `mercury_solutions_db`;
-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: mercury_solutions_db
-- ------------------------------------------------------
-- Server version	8.0.41

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
-- Table structure for table `accidentes_laborales`
--

DROP TABLE IF EXISTS `accidentes_laborales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accidentes_laborales` (
  `accidente_id` int NOT NULL AUTO_INCREMENT,
  `empleado_id` int NOT NULL,
  `fecha_accidente` date NOT NULL,
  `descripcion` text COLLATE utf8mb4_unicode_ci,
  `gravedad` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lugar` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dias_incapacidad` int DEFAULT '0',
  `diagnostico_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`accidente_id`),
  KEY `empleado_id` (`empleado_id`),
  KEY `diagnostico_id` (`diagnostico_id`),
  CONSTRAINT `accidentes_laborales_ibfk_1` FOREIGN KEY (`empleado_id`) REFERENCES `empleados` (`empleado_id`),
  CONSTRAINT `accidentes_laborales_ibfk_2` FOREIGN KEY (`diagnostico_id`) REFERENCES `diagnosticos` (`diagnostico_id`),
  CONSTRAINT `accidentes_laborales_chk_1` CHECK ((`gravedad` in (_utf8mb4'LEVE',_utf8mb4'MODERADA',_utf8mb4'GRAVE',_utf8mb4'CRÍTICA'))),
  CONSTRAINT `accidentes_laborales_chk_2` CHECK ((`dias_incapacidad` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accidentes_laborales`
--

LOCK TABLES `accidentes_laborales` WRITE;
/*!40000 ALTER TABLE `accidentes_laborales` DISABLE KEYS */;
/*!40000 ALTER TABLE `accidentes_laborales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `almacenes`
--

DROP TABLE IF EXISTS `almacenes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `almacenes` (
  `almacen_id` int NOT NULL AUTO_INCREMENT,
  `sucursal_id` int DEFAULT NULL,
  `nombre` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `direccion_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`almacen_id`),
  KEY `sucursal_id` (`sucursal_id`),
  KEY `direccion_id` (`direccion_id`),
  CONSTRAINT `almacenes_ibfk_1` FOREIGN KEY (`sucursal_id`) REFERENCES `sucursales` (`sucursal_id`),
  CONSTRAINT `almacenes_ibfk_2` FOREIGN KEY (`direccion_id`) REFERENCES `direcciones` (`direccion_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `almacenes`
--

LOCK TABLES `almacenes` WRITE;
/*!40000 ALTER TABLE `almacenes` DISABLE KEYS */;
INSERT INTO `almacenes` VALUES (1,1,'Depósito Central',1,'2025-07-31 22:54:52','2025-07-31 22:54:52');
/*!40000 ALTER TABLE `almacenes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria_productos`
--

DROP TABLE IF EXISTS `categoria_productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria_productos` (
  `categoria_id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`categoria_id`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria_productos`
--

LOCK TABLES `categoria_productos` WRITE;
/*!40000 ALTER TABLE `categoria_productos` DISABLE KEYS */;
INSERT INTO `categoria_productos` VALUES (1,'Tuberías','Tuberías de diversos materiales','2025-07-31 22:54:30','2025-07-31 22:54:30'),(2,'Adhesivos','Pegamentos industriales','2025-07-31 22:54:30','2025-07-31 22:54:30');
/*!40000 ALTER TABLE `categoria_productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ciudades`
--

DROP TABLE IF EXISTS `ciudades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ciudades` (
  `ciudad_id` int NOT NULL AUTO_INCREMENT,
  `provincia_id` int NOT NULL,
  `nombre` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ciudad_id`),
  UNIQUE KEY `uk_ciudad_provincia` (`nombre`,`provincia_id`),
  KEY `provincia_id` (`provincia_id`),
  CONSTRAINT `ciudades_ibfk_1` FOREIGN KEY (`provincia_id`) REFERENCES `provincias` (`provincia_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ciudades`
--

LOCK TABLES `ciudades` WRITE;
/*!40000 ALTER TABLE `ciudades` DISABLE KEYS */;
INSERT INTO `ciudades` VALUES (1,1,'S.M. de Tucumán','2025-07-31 22:21:44','2025-07-31 22:21:44'),(2,1,'Yerba Buena','2025-07-31 22:21:44','2025-07-31 22:21:44'),(3,2,'CABA','2025-07-31 22:21:44','2025-07-31 22:21:44');
/*!40000 ALTER TABLE `ciudades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `cliente_id` int NOT NULL AUTO_INCREMENT,
  `razon_social` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cuit` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telefono` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `direccion_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`cliente_id`),
  KEY `direccion_id` (`direccion_id`),
  CONSTRAINT `clientes_ibfk_1` FOREIGN KEY (`direccion_id`) REFERENCES `direcciones` (`direccion_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'Construcciones del Norte SA','30-12345678-9','info@construnorte.com','381-4567890',1,'2025-07-31 22:54:42','2025-07-31 22:54:42');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `codigos_postales`
--

DROP TABLE IF EXISTS `codigos_postales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `codigos_postales` (
  `codigo_postal_id` int NOT NULL AUTO_INCREMENT,
  `ciudad_id` int NOT NULL,
  `codigo` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`codigo_postal_id`),
  UNIQUE KEY `uk_codigo_ciudad` (`codigo`,`ciudad_id`),
  KEY `ciudad_id` (`ciudad_id`),
  CONSTRAINT `codigos_postales_ibfk_1` FOREIGN KEY (`ciudad_id`) REFERENCES `ciudades` (`ciudad_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `codigos_postales`
--

LOCK TABLES `codigos_postales` WRITE;
/*!40000 ALTER TABLE `codigos_postales` DISABLE KEYS */;
INSERT INTO `codigos_postales` VALUES (1,1,'4000','2025-07-31 22:21:55','2025-07-31 22:21:55'),(2,2,'4107','2025-07-31 22:21:55','2025-07-31 22:21:55'),(3,3,'1001','2025-07-31 22:21:55','2025-07-31 22:21:55');
/*!40000 ALTER TABLE `codigos_postales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conceptos`
--

DROP TABLE IF EXISTS `conceptos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conceptos` (
  `concepto_id` int NOT NULL AUTO_INCREMENT,
  `codigo` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nombre` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `naturaleza` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `formula` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`concepto_id`),
  CONSTRAINT `conceptos_chk_1` CHECK ((`naturaleza` in (_utf8mb4'HABER',_utf8mb4'DESCUENTO',_utf8mb4'APORTE')))
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conceptos`
--

LOCK TABLES `conceptos` WRITE;
/*!40000 ALTER TABLE `conceptos` DISABLE KEYS */;
INSERT INTO `conceptos` VALUES (1,'001','Sueldo Básico','HABER',NULL,'2025-07-31 23:26:45','2025-07-31 23:26:45'),(2,'002','Jubilación','DESCUENTO','BASICO * 0.11','2025-07-31 23:26:45','2025-07-31 23:26:45');
/*!40000 ALTER TABLE `conceptos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cotizacion_orden`
--

DROP TABLE IF EXISTS `cotizacion_orden`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cotizacion_orden` (
  `cotizacion_id` int NOT NULL,
  `orden_compra_id` int NOT NULL,
  `ganadora` tinyint(1) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`cotizacion_id`,`orden_compra_id`),
  KEY `orden_compra_id` (`orden_compra_id`),
  CONSTRAINT `cotizacion_orden_ibfk_1` FOREIGN KEY (`cotizacion_id`) REFERENCES `cotizaciones` (`cotizacion_id`),
  CONSTRAINT `cotizacion_orden_ibfk_2` FOREIGN KEY (`orden_compra_id`) REFERENCES `orden_compras` (`orden_compra_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cotizacion_orden`
--

LOCK TABLES `cotizacion_orden` WRITE;
/*!40000 ALTER TABLE `cotizacion_orden` DISABLE KEYS */;
/*!40000 ALTER TABLE `cotizacion_orden` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cotizaciones`
--

DROP TABLE IF EXISTS `cotizaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cotizaciones` (
  `cotizacion_id` int NOT NULL AUTO_INCREMENT,
  `cliente_id` int DEFAULT NULL,
  `empleado_id` int DEFAULT NULL,
  `fecha_cotizacion` date NOT NULL,
  `validez_hasta` date DEFAULT NULL,
  `estado` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT 'PENDIENTE',
  `precio_total` decimal(12,2) DEFAULT NULL,
  `condicion_pago` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`cotizacion_id`),
  KEY `cliente_id` (`cliente_id`),
  KEY `empleado_id` (`empleado_id`),
  CONSTRAINT `cotizaciones_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`cliente_id`),
  CONSTRAINT `cotizaciones_ibfk_2` FOREIGN KEY (`empleado_id`) REFERENCES `empleados` (`empleado_id`),
  CONSTRAINT `cotizaciones_chk_1` CHECK ((`estado` in (_utf8mb4'PENDIENTE',_utf8mb4'APROBADA',_utf8mb4'RECHAZADA',_utf8mb4'VENCIDA'))),
  CONSTRAINT `cotizaciones_chk_2` CHECK ((`precio_total` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cotizaciones`
--

LOCK TABLES `cotizaciones` WRITE;
/*!40000 ALTER TABLE `cotizaciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `cotizaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cursos`
--

DROP TABLE IF EXISTS `cursos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cursos` (
  `curso_id` int NOT NULL AUTO_INCREMENT,
  `codigo` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nombre` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` text COLLATE utf8mb4_unicode_ci,
  `horas_totales` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`curso_id`),
  CONSTRAINT `cursos_chk_1` CHECK ((`horas_totales` > 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cursos`
--

LOCK TABLES `cursos` WRITE;
/*!40000 ALTER TABLE `cursos` DISABLE KEYS */;
/*!40000 ALTER TABLE `cursos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departamentos`
--

DROP TABLE IF EXISTS `departamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departamentos` (
  `departamento_id` int NOT NULL AUTO_INCREMENT,
  `sucursal_id` int DEFAULT NULL,
  `tipo_departamento_id` int DEFAULT NULL,
  `nombre` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`departamento_id`),
  KEY `sucursal_id` (`sucursal_id`),
  KEY `tipo_departamento_id` (`tipo_departamento_id`),
  CONSTRAINT `departamentos_ibfk_1` FOREIGN KEY (`sucursal_id`) REFERENCES `sucursales` (`sucursal_id`),
  CONSTRAINT `departamentos_ibfk_2` FOREIGN KEY (`tipo_departamento_id`) REFERENCES `tipo_departamentos` (`tipo_departamento_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departamentos`
--

LOCK TABLES `departamentos` WRITE;
/*!40000 ALTER TABLE `departamentos` DISABLE KEYS */;
INSERT INTO `departamentos` VALUES (1,1,1,'Ventas Centro','2025-07-31 22:52:49','2025-07-31 22:52:49'),(2,1,2,'Compras Centro','2025-07-31 22:52:49','2025-07-31 22:52:49'),(3,2,3,'Tesorería YB','2025-07-31 22:52:49','2025-07-31 22:52:49');
/*!40000 ALTER TABLE `departamentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_cotizaciones`
--

DROP TABLE IF EXISTS `detalle_cotizaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_cotizaciones` (
  `detalle_cotizacion_id` int NOT NULL AUTO_INCREMENT,
  `cotizacion_id` int NOT NULL,
  `producto_id` int NOT NULL,
  `cantidad` decimal(10,2) NOT NULL,
  `precio_unitario` decimal(10,2) NOT NULL,
  `total_linea` decimal(12,2) GENERATED ALWAYS AS ((`cantidad` * `precio_unitario`)) STORED,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`detalle_cotizacion_id`),
  KEY `cotizacion_id` (`cotizacion_id`),
  KEY `producto_id` (`producto_id`),
  CONSTRAINT `detalle_cotizaciones_ibfk_1` FOREIGN KEY (`cotizacion_id`) REFERENCES `cotizaciones` (`cotizacion_id`),
  CONSTRAINT `detalle_cotizaciones_ibfk_2` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`producto_id`),
  CONSTRAINT `detalle_cotizaciones_chk_1` CHECK ((`cantidad` > 0)),
  CONSTRAINT `detalle_cotizaciones_chk_2` CHECK ((`precio_unitario` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_cotizaciones`
--

LOCK TABLES `detalle_cotizaciones` WRITE;
/*!40000 ALTER TABLE `detalle_cotizaciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalle_cotizaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_facturas`
--

DROP TABLE IF EXISTS `detalle_facturas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_facturas` (
  `detalle_factura_id` int NOT NULL AUTO_INCREMENT,
  `factura_id` int NOT NULL,
  `producto_id` int NOT NULL,
  `cantidad` decimal(10,2) NOT NULL,
  `precio_unitario` decimal(10,2) NOT NULL,
  `descuento` decimal(5,2) DEFAULT '0.00',
  `impuesto` decimal(5,2) DEFAULT '0.00',
  `total_linea` decimal(12,2) GENERATED ALWAYS AS ((((`cantidad` * `precio_unitario`) * (1 - (`descuento` / 100))) * (1 + (`impuesto` / 100)))) STORED,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`detalle_factura_id`),
  KEY `factura_id` (`factura_id`),
  KEY `producto_id` (`producto_id`),
  CONSTRAINT `detalle_facturas_ibfk_1` FOREIGN KEY (`factura_id`) REFERENCES `facturas` (`factura_id`),
  CONSTRAINT `detalle_facturas_ibfk_2` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`producto_id`),
  CONSTRAINT `detalle_facturas_chk_1` CHECK ((`cantidad` > 0)),
  CONSTRAINT `detalle_facturas_chk_2` CHECK ((`precio_unitario` >= 0)),
  CONSTRAINT `detalle_facturas_chk_3` CHECK ((`descuento` between 0 and 100)),
  CONSTRAINT `detalle_facturas_chk_4` CHECK ((`impuesto` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_facturas`
--

LOCK TABLES `detalle_facturas` WRITE;
/*!40000 ALTER TABLE `detalle_facturas` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalle_facturas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_facturas_compras`
--

DROP TABLE IF EXISTS `detalle_facturas_compras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_facturas_compras` (
  `detalle_factura_compra_id` int NOT NULL AUTO_INCREMENT,
  `factura_compra_id` int NOT NULL,
  `producto_id` int NOT NULL,
  `cantidad` decimal(10,2) NOT NULL,
  `precio_unitario` decimal(10,2) NOT NULL,
  `total_linea` decimal(12,2) GENERATED ALWAYS AS ((`cantidad` * `precio_unitario`)) STORED,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`detalle_factura_compra_id`),
  KEY `factura_compra_id` (`factura_compra_id`),
  KEY `producto_id` (`producto_id`),
  CONSTRAINT `detalle_facturas_compras_ibfk_1` FOREIGN KEY (`factura_compra_id`) REFERENCES `facturas_compras` (`factura_compra_id`),
  CONSTRAINT `detalle_facturas_compras_ibfk_2` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`producto_id`),
  CONSTRAINT `detalle_facturas_compras_chk_1` CHECK ((`cantidad` > 0)),
  CONSTRAINT `detalle_facturas_compras_chk_2` CHECK ((`precio_unitario` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_facturas_compras`
--

LOCK TABLES `detalle_facturas_compras` WRITE;
/*!40000 ALTER TABLE `detalle_facturas_compras` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalle_facturas_compras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_orden_compras`
--

DROP TABLE IF EXISTS `detalle_orden_compras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_orden_compras` (
  `detalle_orden_id` int NOT NULL AUTO_INCREMENT,
  `orden_compra_id` int NOT NULL,
  `producto_id` int NOT NULL,
  `cantidad` decimal(10,2) NOT NULL,
  `precio_unitario` decimal(10,2) NOT NULL,
  `total_linea` decimal(12,2) GENERATED ALWAYS AS ((`cantidad` * `precio_unitario`)) STORED,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`detalle_orden_id`),
  KEY `orden_compra_id` (`orden_compra_id`),
  KEY `producto_id` (`producto_id`),
  CONSTRAINT `detalle_orden_compras_ibfk_1` FOREIGN KEY (`orden_compra_id`) REFERENCES `orden_compras` (`orden_compra_id`),
  CONSTRAINT `detalle_orden_compras_ibfk_2` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`producto_id`),
  CONSTRAINT `detalle_orden_compras_chk_1` CHECK ((`cantidad` > 0)),
  CONSTRAINT `detalle_orden_compras_chk_2` CHECK ((`precio_unitario` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_orden_compras`
--

LOCK TABLES `detalle_orden_compras` WRITE;
/*!40000 ALTER TABLE `detalle_orden_compras` DISABLE KEYS */;
INSERT INTO `detalle_orden_compras` (`detalle_orden_id`, `orden_compra_id`, `producto_id`, `cantidad`, `precio_unitario`, `created_at`, `updated_at`) VALUES (13,3,1,20.00,800.00,'2025-07-31 23:26:00','2025-07-31 23:26:00'),(14,4,2,10.00,900.00,'2025-07-31 23:26:00','2025-07-31 23:26:00');
/*!40000 ALTER TABLE `detalle_orden_compras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_recibos`
--

DROP TABLE IF EXISTS `detalle_recibos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_recibos` (
  `detalle_recibo_id` int NOT NULL AUTO_INCREMENT,
  `recibo_id` int NOT NULL,
  `factura_id` int NOT NULL,
  `monto_cancelado` decimal(12,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`detalle_recibo_id`),
  KEY `recibo_id` (`recibo_id`),
  KEY `factura_id` (`factura_id`),
  CONSTRAINT `detalle_recibos_ibfk_1` FOREIGN KEY (`recibo_id`) REFERENCES `recibos` (`recibo_id`),
  CONSTRAINT `detalle_recibos_ibfk_2` FOREIGN KEY (`factura_id`) REFERENCES `facturas` (`factura_id`),
  CONSTRAINT `detalle_recibos_chk_1` CHECK ((`monto_cancelado` > 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_recibos`
--

LOCK TABLES `detalle_recibos` WRITE;
/*!40000 ALTER TABLE `detalle_recibos` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalle_recibos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_remitos`
--

DROP TABLE IF EXISTS `detalle_remitos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_remitos` (
  `detalle_remito_id` int NOT NULL AUTO_INCREMENT,
  `remito_id` int NOT NULL,
  `producto_id` int NOT NULL,
  `cantidad` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`detalle_remito_id`),
  KEY `remito_id` (`remito_id`),
  KEY `producto_id` (`producto_id`),
  CONSTRAINT `detalle_remitos_ibfk_1` FOREIGN KEY (`remito_id`) REFERENCES `remitos` (`remito_id`),
  CONSTRAINT `detalle_remitos_ibfk_2` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`producto_id`),
  CONSTRAINT `detalle_remitos_chk_1` CHECK ((`cantidad` > 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_remitos`
--

LOCK TABLES `detalle_remitos` WRITE;
/*!40000 ALTER TABLE `detalle_remitos` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalle_remitos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_remitos_clientes`
--

DROP TABLE IF EXISTS `detalle_remitos_clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_remitos_clientes` (
  `detalle_remito_cliente_id` int NOT NULL AUTO_INCREMENT,
  `remito_cliente_id` int NOT NULL,
  `producto_id` int NOT NULL,
  `cantidad` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`detalle_remito_cliente_id`),
  KEY `remito_cliente_id` (`remito_cliente_id`),
  KEY `producto_id` (`producto_id`),
  CONSTRAINT `detalle_remitos_clientes_ibfk_1` FOREIGN KEY (`remito_cliente_id`) REFERENCES `remitos_clientes` (`remito_cliente_id`),
  CONSTRAINT `detalle_remitos_clientes_ibfk_2` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`producto_id`),
  CONSTRAINT `detalle_remitos_clientes_chk_1` CHECK ((`cantidad` > 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_remitos_clientes`
--

LOCK TABLES `detalle_remitos_clientes` WRITE;
/*!40000 ALTER TABLE `detalle_remitos_clientes` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalle_remitos_clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalles_liquidaciones`
--

DROP TABLE IF EXISTS `detalles_liquidaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalles_liquidaciones` (
  `detalle_liquidacion_id` int NOT NULL AUTO_INCREMENT,
  `liquidacion_id` int NOT NULL,
  `concepto_id` int NOT NULL,
  `cantidad` decimal(10,2) NOT NULL,
  `monto_unitario` decimal(10,2) NOT NULL,
  `monto_total` decimal(12,2) GENERATED ALWAYS AS ((`cantidad` * `monto_unitario`)) STORED,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`detalle_liquidacion_id`),
  KEY `liquidacion_id` (`liquidacion_id`),
  KEY `concepto_id` (`concepto_id`),
  CONSTRAINT `detalles_liquidaciones_ibfk_1` FOREIGN KEY (`liquidacion_id`) REFERENCES `liquidaciones_sueldo` (`liquidacion_id`),
  CONSTRAINT `detalles_liquidaciones_ibfk_2` FOREIGN KEY (`concepto_id`) REFERENCES `conceptos` (`concepto_id`),
  CONSTRAINT `detalles_liquidaciones_chk_1` CHECK ((`cantidad` >= 0)),
  CONSTRAINT `detalles_liquidaciones_chk_2` CHECK ((`monto_unitario` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalles_liquidaciones`
--

LOCK TABLES `detalles_liquidaciones` WRITE;
/*!40000 ALTER TABLE `detalles_liquidaciones` DISABLE KEYS */;
INSERT INTO `detalles_liquidaciones` (`detalle_liquidacion_id`, `liquidacion_id`, `concepto_id`, `cantidad`, `monto_unitario`, `created_at`, `updated_at`) VALUES (5,3,1,1.00,150000.00,'2025-07-31 23:30:02','2025-07-31 23:30:02'),(6,4,2,1.00,16500.00,'2025-07-31 23:30:02','2025-07-31 23:30:02');
/*!40000 ALTER TABLE `detalles_liquidaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `diagnosticos`
--

DROP TABLE IF EXISTS `diagnosticos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `diagnosticos` (
  `diagnostico_id` int NOT NULL AUTO_INCREMENT,
  `codigo` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `descripcion` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`diagnostico_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diagnosticos`
--

LOCK TABLES `diagnosticos` WRITE;
/*!40000 ALTER TABLE `diagnosticos` DISABLE KEYS */;
/*!40000 ALTER TABLE `diagnosticos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `direcciones`
--

DROP TABLE IF EXISTS `direcciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `direcciones` (
  `direccion_id` int NOT NULL AUTO_INCREMENT,
  `calle` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `numero` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `piso` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `depto` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ciudad_id` int NOT NULL,
  `provincia_id` int NOT NULL,
  `pais_id` int NOT NULL,
  `codigo_postal_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`direccion_id`),
  KEY `ciudad_id` (`ciudad_id`),
  KEY `provincia_id` (`provincia_id`),
  KEY `pais_id` (`pais_id`),
  KEY `codigo_postal_id` (`codigo_postal_id`),
  CONSTRAINT `direcciones_ibfk_1` FOREIGN KEY (`ciudad_id`) REFERENCES `ciudades` (`ciudad_id`),
  CONSTRAINT `direcciones_ibfk_2` FOREIGN KEY (`provincia_id`) REFERENCES `provincias` (`provincia_id`),
  CONSTRAINT `direcciones_ibfk_3` FOREIGN KEY (`pais_id`) REFERENCES `paises` (`pais_id`),
  CONSTRAINT `direcciones_ibfk_4` FOREIGN KEY (`codigo_postal_id`) REFERENCES `codigos_postales` (`codigo_postal_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `direcciones`
--

LOCK TABLES `direcciones` WRITE;
/*!40000 ALTER TABLE `direcciones` DISABLE KEYS */;
INSERT INTO `direcciones` VALUES (1,'San Martín','500',NULL,NULL,1,1,1,1,'2025-07-31 22:21:59','2025-07-31 22:21:59'),(2,'Aconquija','1200',NULL,NULL,2,1,1,2,'2025-07-31 22:21:59','2025-07-31 22:21:59'),(3,'Corrientes','800',NULL,NULL,3,2,1,3,'2025-07-31 22:21:59','2025-07-31 22:21:59');
/*!40000 ALTER TABLE `direcciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleado_curso`
--

DROP TABLE IF EXISTS `empleado_curso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleado_curso` (
  `empleado_id` int NOT NULL,
  `curso_id` int NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date DEFAULT NULL,
  `resultado` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`empleado_id`,`curso_id`,`fecha_inicio`),
  KEY `curso_id` (`curso_id`),
  CONSTRAINT `empleado_curso_ibfk_1` FOREIGN KEY (`empleado_id`) REFERENCES `empleados` (`empleado_id`),
  CONSTRAINT `empleado_curso_ibfk_2` FOREIGN KEY (`curso_id`) REFERENCES `cursos` (`curso_id`),
  CONSTRAINT `empleado_curso_chk_1` CHECK (((`fecha_fin` is null) or (`fecha_fin` >= `fecha_inicio`)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleado_curso`
--

LOCK TABLES `empleado_curso` WRITE;
/*!40000 ALTER TABLE `empleado_curso` DISABLE KEYS */;
/*!40000 ALTER TABLE `empleado_curso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleado_departamento_historial`
--

DROP TABLE IF EXISTS `empleado_departamento_historial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleado_departamento_historial` (
  `empleado_id` int NOT NULL,
  `departamento_id` int NOT NULL,
  `fecha_desde` date NOT NULL,
  `fecha_hasta` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`empleado_id`,`departamento_id`,`fecha_desde`),
  KEY `departamento_id` (`departamento_id`),
  CONSTRAINT `empleado_departamento_historial_ibfk_1` FOREIGN KEY (`empleado_id`) REFERENCES `empleados` (`empleado_id`),
  CONSTRAINT `empleado_departamento_historial_ibfk_2` FOREIGN KEY (`departamento_id`) REFERENCES `departamentos` (`departamento_id`),
  CONSTRAINT `empleado_departamento_historial_chk_1` CHECK (((`fecha_hasta` is null) or (`fecha_hasta` >= `fecha_desde`)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleado_departamento_historial`
--

LOCK TABLES `empleado_departamento_historial` WRITE;
/*!40000 ALTER TABLE `empleado_departamento_historial` DISABLE KEYS */;
/*!40000 ALTER TABLE `empleado_departamento_historial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleados`
--

DROP TABLE IF EXISTS `empleados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleados` (
  `empleado_id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `apellido` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dni` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cuil` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `fecha_alta` date DEFAULT NULL,
  `email` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telefono` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tipo_empleado_id` int DEFAULT NULL,
  `departamento_id` int DEFAULT NULL,
  `sucursal_id` int DEFAULT NULL,
  `direccion_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`empleado_id`),
  UNIQUE KEY `dni` (`dni`),
  UNIQUE KEY `cuil` (`cuil`),
  KEY `tipo_empleado_id` (`tipo_empleado_id`),
  KEY `departamento_id` (`departamento_id`),
  KEY `direccion_id` (`direccion_id`),
  KEY `idx_empleados_dni` (`dni`),
  KEY `idx_empleados_fecha_alta` (`fecha_alta`),
  KEY `idx_empleados_provincia_ciudad` (`sucursal_id`,`departamento_id`),
  CONSTRAINT `empleados_ibfk_1` FOREIGN KEY (`tipo_empleado_id`) REFERENCES `tipo_empleados` (`tipo_empleado_id`),
  CONSTRAINT `empleados_ibfk_2` FOREIGN KEY (`departamento_id`) REFERENCES `departamentos` (`departamento_id`),
  CONSTRAINT `empleados_ibfk_3` FOREIGN KEY (`sucursal_id`) REFERENCES `sucursales` (`sucursal_id`),
  CONSTRAINT `empleados_ibfk_4` FOREIGN KEY (`direccion_id`) REFERENCES `direcciones` (`direccion_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleados`
--

LOCK TABLES `empleados` WRITE;
/*!40000 ALTER TABLE `empleados` DISABLE KEYS */;
INSERT INTO `empleados` VALUES (7,'Juan','Pérez','23156789','20-23156789-5','1980-05-15','2022-01-15','juan.perez@mercury.com',NULL,1,1,1,1,'2025-07-31 22:53:22','2025-07-31 22:53:22'),(8,'María','González','20732589','27-20732589-8','1975-08-20','2021-03-10','maria.gonzalez@mercury.com',NULL,2,2,1,2,'2025-07-31 22:53:22','2025-07-31 22:53:22'),(9,'Carlos','Pérez','33444555','20-33444555-4','1988-03-22','2022-05-10','carlos@example.com','381556677',1,1,1,1,'2025-07-31 23:11:11','2025-07-31 23:11:11');
/*!40000 ALTER TABLE `empleados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facturas`
--

DROP TABLE IF EXISTS `facturas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `facturas` (
  `factura_id` int NOT NULL AUTO_INCREMENT,
  `cliente_id` int DEFAULT NULL,
  `empleado_id` int DEFAULT NULL,
  `sucursal_id` int DEFAULT NULL,
  `fecha_factura` date NOT NULL,
  `tipo_factura` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `numero_factura` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `estado` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT 'EMITIDA',
  `total` decimal(12,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`factura_id`),
  KEY `empleado_id` (`empleado_id`),
  KEY `sucursal_id` (`sucursal_id`),
  KEY `idx_facturas_fecha` (`fecha_factura`),
  KEY `idx_facturas_cliente_fecha` (`cliente_id`,`fecha_factura`),
  CONSTRAINT `facturas_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`cliente_id`),
  CONSTRAINT `facturas_ibfk_2` FOREIGN KEY (`empleado_id`) REFERENCES `empleados` (`empleado_id`),
  CONSTRAINT `facturas_ibfk_3` FOREIGN KEY (`sucursal_id`) REFERENCES `sucursales` (`sucursal_id`),
  CONSTRAINT `facturas_chk_1` CHECK ((`tipo_factura` in (_utf8mb4'A',_utf8mb4'B',_utf8mb4'C'))),
  CONSTRAINT `facturas_chk_2` CHECK ((`estado` in (_utf8mb4'EMITIDA',_utf8mb4'PAGADA',_utf8mb4'ANULADA'))),
  CONSTRAINT `facturas_chk_3` CHECK ((`total` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facturas`
--

LOCK TABLES `facturas` WRITE;
/*!40000 ALTER TABLE `facturas` DISABLE KEYS */;
/*!40000 ALTER TABLE `facturas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facturas_compras`
--

DROP TABLE IF EXISTS `facturas_compras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `facturas_compras` (
  `factura_compra_id` int NOT NULL AUTO_INCREMENT,
  `orden_compra_id` int DEFAULT NULL,
  `proveedor_id` int DEFAULT NULL,
  `fecha_factura` date NOT NULL,
  `tipo_factura` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `numero_factura` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total` decimal(12,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`factura_compra_id`),
  KEY `orden_compra_id` (`orden_compra_id`),
  KEY `proveedor_id` (`proveedor_id`),
  CONSTRAINT `facturas_compras_ibfk_1` FOREIGN KEY (`orden_compra_id`) REFERENCES `orden_compras` (`orden_compra_id`),
  CONSTRAINT `facturas_compras_ibfk_2` FOREIGN KEY (`proveedor_id`) REFERENCES `proveedores` (`proveedor_id`),
  CONSTRAINT `facturas_compras_chk_1` CHECK ((`tipo_factura` in (_utf8mb4'A',_utf8mb4'B',_utf8mb4'C'))),
  CONSTRAINT `facturas_compras_chk_2` CHECK ((`total` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facturas_compras`
--

LOCK TABLES `facturas_compras` WRITE;
/*!40000 ALTER TABLE `facturas_compras` DISABLE KEYS */;
/*!40000 ALTER TABLE `facturas_compras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grupo_familiares`
--

DROP TABLE IF EXISTS `grupo_familiares`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grupo_familiares` (
  `grupo_familiar_id` int NOT NULL AUTO_INCREMENT,
  `empleado_id` int NOT NULL,
  `descripcion` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`grupo_familiar_id`),
  KEY `empleado_id` (`empleado_id`),
  CONSTRAINT `grupo_familiares_ibfk_1` FOREIGN KEY (`empleado_id`) REFERENCES `empleados` (`empleado_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grupo_familiares`
--

LOCK TABLES `grupo_familiares` WRITE;
/*!40000 ALTER TABLE `grupo_familiares` DISABLE KEYS */;
/*!40000 ALTER TABLE `grupo_familiares` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grupo_familiares_personas`
--

DROP TABLE IF EXISTS `grupo_familiares_personas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grupo_familiares_personas` (
  `grupo_familiar_id` int NOT NULL,
  `persona_id` int NOT NULL,
  `parentesco` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`grupo_familiar_id`,`persona_id`),
  KEY `persona_id` (`persona_id`),
  CONSTRAINT `grupo_familiares_personas_ibfk_1` FOREIGN KEY (`grupo_familiar_id`) REFERENCES `grupo_familiares` (`grupo_familiar_id`),
  CONSTRAINT `grupo_familiares_personas_ibfk_2` FOREIGN KEY (`persona_id`) REFERENCES `personas` (`persona_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grupo_familiares_personas`
--

LOCK TABLES `grupo_familiares_personas` WRITE;
/*!40000 ALTER TABLE `grupo_familiares_personas` DISABLE KEYS */;
/*!40000 ALTER TABLE `grupo_familiares_personas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `liquidaciones_sueldo`
--

DROP TABLE IF EXISTS `liquidaciones_sueldo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `liquidaciones_sueldo` (
  `liquidacion_id` int NOT NULL AUTO_INCREMENT,
  `empleado_id` int NOT NULL,
  `codigo` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `periodo` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha_pago` date NOT NULL,
  `total_bruto` decimal(12,2) DEFAULT NULL,
  `total_deducciones` decimal(12,2) DEFAULT NULL,
  `total_neto` decimal(12,2) DEFAULT NULL,
  `observaciones` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`liquidacion_id`),
  UNIQUE KEY `uk_empleado_periodo` (`empleado_id`,`periodo`),
  KEY `idx_liquidaciones_periodo` (`periodo`),
  CONSTRAINT `liquidaciones_sueldo_ibfk_1` FOREIGN KEY (`empleado_id`) REFERENCES `empleados` (`empleado_id`),
  CONSTRAINT `liquidaciones_sueldo_chk_1` CHECK ((`total_bruto` >= 0)),
  CONSTRAINT `liquidaciones_sueldo_chk_2` CHECK ((`total_deducciones` >= 0)),
  CONSTRAINT `liquidaciones_sueldo_chk_3` CHECK ((`total_neto` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `liquidaciones_sueldo`
--

LOCK TABLES `liquidaciones_sueldo` WRITE;
/*!40000 ALTER TABLE `liquidaciones_sueldo` DISABLE KEYS */;
INSERT INTO `liquidaciones_sueldo` VALUES (3,7,'2023-01','2023-01','2023-01-31',180000.00,45000.00,135000.00,NULL,'2025-07-31 23:26:39','2025-07-31 23:26:39'),(4,8,'2023-01','2023-01','2023-01-31',200000.00,50000.00,150000.00,NULL,'2025-07-31 23:26:39','2025-07-31 23:26:39');
/*!40000 ALTER TABLE `liquidaciones_sueldo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medios_pagos`
--

DROP TABLE IF EXISTS `medios_pagos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medios_pagos` (
  `medio_pago_id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`medio_pago_id`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medios_pagos`
--

LOCK TABLES `medios_pagos` WRITE;
/*!40000 ALTER TABLE `medios_pagos` DISABLE KEYS */;
/*!40000 ALTER TABLE `medios_pagos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orden_compras`
--

DROP TABLE IF EXISTS `orden_compras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orden_compras` (
  `orden_compra_id` int NOT NULL AUTO_INCREMENT,
  `proveedor_id` int DEFAULT NULL,
  `empleado_id` int DEFAULT NULL,
  `sucursal_id` int DEFAULT NULL,
  `departamento_id` int DEFAULT NULL,
  `fecha_orden` date NOT NULL,
  `estado` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT 'PENDIENTE',
  `total` decimal(12,2) DEFAULT NULL,
  `condicion_pago` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`orden_compra_id`),
  KEY `proveedor_id` (`proveedor_id`),
  KEY `empleado_id` (`empleado_id`),
  KEY `sucursal_id` (`sucursal_id`),
  KEY `departamento_id` (`departamento_id`),
  KEY `idx_orden_compras_fecha` (`fecha_orden`),
  CONSTRAINT `orden_compras_ibfk_1` FOREIGN KEY (`proveedor_id`) REFERENCES `proveedores` (`proveedor_id`),
  CONSTRAINT `orden_compras_ibfk_2` FOREIGN KEY (`empleado_id`) REFERENCES `empleados` (`empleado_id`),
  CONSTRAINT `orden_compras_ibfk_3` FOREIGN KEY (`sucursal_id`) REFERENCES `sucursales` (`sucursal_id`),
  CONSTRAINT `orden_compras_ibfk_4` FOREIGN KEY (`departamento_id`) REFERENCES `departamentos` (`departamento_id`),
  CONSTRAINT `orden_compras_chk_1` CHECK ((`estado` in (_utf8mb4'PENDIENTE',_utf8mb4'CONFIRMADA',_utf8mb4'PARCIALMENTE_RECIBIDA',_utf8mb4'RECIBIDA',_utf8mb4'CANCELADA'))),
  CONSTRAINT `orden_compras_chk_2` CHECK ((`total` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orden_compras`
--

LOCK TABLES `orden_compras` WRITE;
/*!40000 ALTER TABLE `orden_compras` DISABLE KEYS */;
INSERT INTO `orden_compras` VALUES (3,1,7,1,2,'2024-01-15','CONFIRMADA',25000.00,'e-cheq 30 días','2025-07-31 23:11:59','2025-07-31 23:11:59'),(4,1,8,1,2,'2024-01-15','CONFIRMADA',25000.00,'e-cheq 30 días','2025-07-31 23:20:44','2025-07-31 23:20:44');
/*!40000 ALTER TABLE `orden_compras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagos`
--

DROP TABLE IF EXISTS `pagos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pagos` (
  `pago_id` int NOT NULL AUTO_INCREMENT,
  `recibo_id` int NOT NULL,
  `medio_pago_id` int NOT NULL,
  `fecha_pago` date NOT NULL,
  `monto` decimal(12,2) NOT NULL,
  `detalles` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`pago_id`),
  KEY `recibo_id` (`recibo_id`),
  KEY `medio_pago_id` (`medio_pago_id`),
  CONSTRAINT `pagos_ibfk_1` FOREIGN KEY (`recibo_id`) REFERENCES `recibos` (`recibo_id`),
  CONSTRAINT `pagos_ibfk_2` FOREIGN KEY (`medio_pago_id`) REFERENCES `medios_pagos` (`medio_pago_id`),
  CONSTRAINT `pagos_chk_1` CHECK ((`monto` > 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagos`
--

LOCK TABLES `pagos` WRITE;
/*!40000 ALTER TABLE `pagos` DISABLE KEYS */;
/*!40000 ALTER TABLE `pagos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paises`
--

DROP TABLE IF EXISTS `paises`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paises` (
  `pais_id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`pais_id`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paises`
--

LOCK TABLES `paises` WRITE;
/*!40000 ALTER TABLE `paises` DISABLE KEYS */;
INSERT INTO `paises` VALUES (1,'Argentina','2025-07-31 22:18:39','2025-07-31 22:18:39'),(2,'Brasil','2025-07-31 22:20:09','2025-07-31 22:20:09'),(3,'Chile','2025-07-31 22:20:09','2025-07-31 22:20:09');
/*!40000 ALTER TABLE `paises` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parametros_medicos`
--

DROP TABLE IF EXISTS `parametros_medicos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `parametros_medicos` (
  `parametro_id` int NOT NULL AUTO_INCREMENT,
  `revision_id` int NOT NULL,
  `nombre` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `valor` decimal(10,2) DEFAULT NULL,
  `unidad` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`parametro_id`),
  KEY `revision_id` (`revision_id`),
  CONSTRAINT `parametros_medicos_ibfk_1` FOREIGN KEY (`revision_id`) REFERENCES `revisiones_medicas` (`revision_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parametros_medicos`
--

LOCK TABLES `parametros_medicos` WRITE;
/*!40000 ALTER TABLE `parametros_medicos` DISABLE KEYS */;
/*!40000 ALTER TABLE `parametros_medicos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personas`
--

DROP TABLE IF EXISTS `personas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personas` (
  `persona_id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `apellido` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dni` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `sexo` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telefono` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `direccion_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`persona_id`),
  KEY `direccion_id` (`direccion_id`),
  CONSTRAINT `personas_ibfk_1` FOREIGN KEY (`direccion_id`) REFERENCES `direcciones` (`direccion_id`),
  CONSTRAINT `personas_chk_1` CHECK ((`sexo` in (_utf8mb4'M',_utf8mb4'F',_utf8mb4'X')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personas`
--

LOCK TABLES `personas` WRITE;
/*!40000 ALTER TABLE `personas` DISABLE KEYS */;
/*!40000 ALTER TABLE `personas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto_proveedor`
--

DROP TABLE IF EXISTS `producto_proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto_proveedor` (
  `producto_id` int NOT NULL,
  `proveedor_id` int NOT NULL,
  `precio_compra` decimal(10,2) DEFAULT NULL,
  `fecha_alta` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`producto_id`,`proveedor_id`),
  KEY `proveedor_id` (`proveedor_id`),
  CONSTRAINT `producto_proveedor_ibfk_1` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`producto_id`),
  CONSTRAINT `producto_proveedor_ibfk_2` FOREIGN KEY (`proveedor_id`) REFERENCES `proveedores` (`proveedor_id`),
  CONSTRAINT `producto_proveedor_chk_1` CHECK ((`precio_compra` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto_proveedor`
--

LOCK TABLES `producto_proveedor` WRITE;
/*!40000 ALTER TABLE `producto_proveedor` DISABLE KEYS */;
/*!40000 ALTER TABLE `producto_proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `producto_id` int NOT NULL AUTO_INCREMENT,
  `rubro_id` int DEFAULT NULL,
  `categoria_id` int DEFAULT NULL,
  `nombre` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` text COLLATE utf8mb4_unicode_ci,
  `unidad_medida` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `codigo_barra` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `precio_unitario` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`producto_id`),
  KEY `rubro_id` (`rubro_id`),
  KEY `categoria_id` (`categoria_id`),
  KEY `idx_productos_codigo_barra` (`codigo_barra`),
  CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`rubro_id`) REFERENCES `rubros` (`rubro_id`),
  CONSTRAINT `productos_ibfk_2` FOREIGN KEY (`categoria_id`) REFERENCES `categoria_productos` (`categoria_id`),
  CONSTRAINT `productos_chk_1` CHECK ((`precio_unitario` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (1,1,1,'Caño PVC 110mm','Caño PVC para desagües','metro','7790001234567',850.00,'2025-07-31 22:54:36','2025-07-31 22:54:36'),(2,2,2,'Cemento Portland','Cemento común tipo portland','bolsa','7790002345678',1200.00,'2025-07-31 22:54:36','2025-07-31 22:54:36');
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedores`
--

DROP TABLE IF EXISTS `proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedores` (
  `proveedor_id` int NOT NULL AUTO_INCREMENT,
  `razon_social` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cuit` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telefono` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `direccion_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`proveedor_id`),
  KEY `direccion_id` (`direccion_id`),
  CONSTRAINT `proveedores_ibfk_1` FOREIGN KEY (`direccion_id`) REFERENCES `direcciones` (`direccion_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedores`
--

LOCK TABLES `proveedores` WRITE;
/*!40000 ALTER TABLE `proveedores` DISABLE KEYS */;
INSERT INTO `proveedores` VALUES (1,'Distribuidora Tucumana SRL','30-87654321-6','ventas@disttuc.com','381-7654321',2,'2025-07-31 22:54:47','2025-07-31 22:54:47');
/*!40000 ALTER TABLE `proveedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provincias`
--

DROP TABLE IF EXISTS `provincias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `provincias` (
  `provincia_id` int NOT NULL AUTO_INCREMENT,
  `pais_id` int NOT NULL,
  `nombre` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`provincia_id`),
  UNIQUE KEY `uk_provincia_pais` (`nombre`,`pais_id`),
  KEY `pais_id` (`pais_id`),
  CONSTRAINT `provincias_ibfk_1` FOREIGN KEY (`pais_id`) REFERENCES `paises` (`pais_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provincias`
--

LOCK TABLES `provincias` WRITE;
/*!40000 ALTER TABLE `provincias` DISABLE KEYS */;
INSERT INTO `provincias` VALUES (1,1,'Tucumán','2025-07-31 22:20:35','2025-07-31 22:20:35'),(2,1,'Buenos Aires','2025-07-31 22:20:35','2025-07-31 22:20:35'),(3,1,'Córdoba','2025-07-31 22:20:35','2025-07-31 22:20:35');
/*!40000 ALTER TABLE `provincias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rankings`
--

DROP TABLE IF EXISTS `rankings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rankings` (
  `rubro_id` int NOT NULL,
  `proveedor_id` int NOT NULL,
  `ranking` int DEFAULT NULL,
  `fecha_ranking` date DEFAULT NULL,
  `comentarios` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`rubro_id`,`proveedor_id`),
  KEY `proveedor_id` (`proveedor_id`),
  CONSTRAINT `rankings_ibfk_1` FOREIGN KEY (`rubro_id`) REFERENCES `rubros` (`rubro_id`),
  CONSTRAINT `rankings_ibfk_2` FOREIGN KEY (`proveedor_id`) REFERENCES `proveedores` (`proveedor_id`),
  CONSTRAINT `rankings_chk_1` CHECK ((`ranking` between 1 and 10))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rankings`
--

LOCK TABLES `rankings` WRITE;
/*!40000 ALTER TABLE `rankings` DISABLE KEYS */;
/*!40000 ALTER TABLE `rankings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recibos`
--

DROP TABLE IF EXISTS `recibos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recibos` (
  `recibo_id` int NOT NULL AUTO_INCREMENT,
  `cliente_id` int DEFAULT NULL,
  `empleado_id` int DEFAULT NULL,
  `fecha_recibo` date NOT NULL,
  `total` decimal(12,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`recibo_id`),
  KEY `cliente_id` (`cliente_id`),
  KEY `empleado_id` (`empleado_id`),
  CONSTRAINT `recibos_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`cliente_id`),
  CONSTRAINT `recibos_ibfk_2` FOREIGN KEY (`empleado_id`) REFERENCES `empleados` (`empleado_id`),
  CONSTRAINT `recibos_chk_1` CHECK ((`total` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recibos`
--

LOCK TABLES `recibos` WRITE;
/*!40000 ALTER TABLE `recibos` DISABLE KEYS */;
/*!40000 ALTER TABLE `recibos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `remitos`
--

DROP TABLE IF EXISTS `remitos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `remitos` (
  `remito_id` int NOT NULL AUTO_INCREMENT,
  `proveedor_id` int DEFAULT NULL,
  `sucursal_id` int DEFAULT NULL,
  `orden_compra_id` int DEFAULT NULL,
  `fecha_remito` date NOT NULL,
  `estado` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT 'RECIBIDO',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`remito_id`),
  KEY `proveedor_id` (`proveedor_id`),
  KEY `sucursal_id` (`sucursal_id`),
  KEY `orden_compra_id` (`orden_compra_id`),
  CONSTRAINT `remitos_ibfk_1` FOREIGN KEY (`proveedor_id`) REFERENCES `proveedores` (`proveedor_id`),
  CONSTRAINT `remitos_ibfk_2` FOREIGN KEY (`sucursal_id`) REFERENCES `sucursales` (`sucursal_id`),
  CONSTRAINT `remitos_ibfk_3` FOREIGN KEY (`orden_compra_id`) REFERENCES `orden_compras` (`orden_compra_id`),
  CONSTRAINT `remitos_chk_1` CHECK ((`estado` in (_utf8mb4'RECIBIDO',_utf8mb4'PROCESADO',_utf8mb4'DEVUELTO')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `remitos`
--

LOCK TABLES `remitos` WRITE;
/*!40000 ALTER TABLE `remitos` DISABLE KEYS */;
/*!40000 ALTER TABLE `remitos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `remitos_clientes`
--

DROP TABLE IF EXISTS `remitos_clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `remitos_clientes` (
  `remito_cliente_id` int NOT NULL AUTO_INCREMENT,
  `factura_id` int DEFAULT NULL,
  `cliente_id` int DEFAULT NULL,
  `fecha_remito` date NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`remito_cliente_id`),
  KEY `factura_id` (`factura_id`),
  KEY `cliente_id` (`cliente_id`),
  CONSTRAINT `remitos_clientes_ibfk_1` FOREIGN KEY (`factura_id`) REFERENCES `facturas` (`factura_id`),
  CONSTRAINT `remitos_clientes_ibfk_2` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`cliente_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `remitos_clientes`
--

LOCK TABLES `remitos_clientes` WRITE;
/*!40000 ALTER TABLE `remitos_clientes` DISABLE KEYS */;
/*!40000 ALTER TABLE `remitos_clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `revisiones_medicas`
--

DROP TABLE IF EXISTS `revisiones_medicas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `revisiones_medicas` (
  `revision_id` int NOT NULL AUTO_INCREMENT,
  `empleado_id` int NOT NULL,
  `fecha_revision` date NOT NULL,
  `observaciones` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`revision_id`),
  KEY `empleado_id` (`empleado_id`),
  CONSTRAINT `revisiones_medicas_ibfk_1` FOREIGN KEY (`empleado_id`) REFERENCES `empleados` (`empleado_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `revisiones_medicas`
--

LOCK TABLES `revisiones_medicas` WRITE;
/*!40000 ALTER TABLE `revisiones_medicas` DISABLE KEYS */;
/*!40000 ALTER TABLE `revisiones_medicas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rubros`
--

DROP TABLE IF EXISTS `rubros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rubros` (
  `rubro_id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`rubro_id`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rubros`
--

LOCK TABLES `rubros` WRITE;
/*!40000 ALTER TABLE `rubros` DISABLE KEYS */;
INSERT INTO `rubros` VALUES (1,'Caños para agua','Tuberías y accesorios para agua','2025-07-31 22:54:25','2025-07-31 22:54:25'),(2,'Cementos','Cementos y morteros','2025-07-31 22:54:25','2025-07-31 22:54:25'),(3,'Electricidad','Materiales eléctricos','2025-07-31 22:54:25','2025-07-31 22:54:25');
/*!40000 ALTER TABLE `rubros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stocks`
--

DROP TABLE IF EXISTS `stocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stocks` (
  `stock_id` int NOT NULL AUTO_INCREMENT,
  `producto_id` int NOT NULL,
  `almacen_id` int NOT NULL,
  `cantidad` decimal(10,2) DEFAULT '0.00',
  `stock_minimo` decimal(10,2) DEFAULT '0.00',
  `stock_maximo` decimal(10,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`stock_id`),
  UNIQUE KEY `uk_producto_almacen` (`producto_id`,`almacen_id`),
  KEY `almacen_id` (`almacen_id`),
  KEY `idx_stocks_cantidad` (`cantidad`),
  KEY `idx_stocks_producto_almacen` (`producto_id`,`almacen_id`),
  CONSTRAINT `stocks_ibfk_1` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`producto_id`),
  CONSTRAINT `stocks_ibfk_2` FOREIGN KEY (`almacen_id`) REFERENCES `almacenes` (`almacen_id`),
  CONSTRAINT `stocks_chk_1` CHECK ((`cantidad` >= 0)),
  CONSTRAINT `stocks_chk_2` CHECK ((`stock_minimo` >= 0)),
  CONSTRAINT `stocks_chk_3` CHECK (((`stock_maximo` is null) or (`stock_maximo` >= `stock_minimo`)))
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stocks`
--

LOCK TABLES `stocks` WRITE;
/*!40000 ALTER TABLE `stocks` DISABLE KEYS */;
INSERT INTO `stocks` VALUES (1,1,1,1500.00,100.00,2000.00,'2025-07-31 22:54:56','2025-07-31 22:54:56'),(2,2,1,800.00,50.00,1000.00,'2025-07-31 22:54:56','2025-07-31 22:54:56');
/*!40000 ALTER TABLE `stocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sucursales`
--

DROP TABLE IF EXISTS `sucursales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sucursales` (
  `sucursal_id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `direccion_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`sucursal_id`),
  UNIQUE KEY `nombre` (`nombre`),
  KEY `direccion_id` (`direccion_id`),
  CONSTRAINT `sucursales_ibfk_1` FOREIGN KEY (`direccion_id`) REFERENCES `direcciones` (`direccion_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sucursales`
--

LOCK TABLES `sucursales` WRITE;
/*!40000 ALTER TABLE `sucursales` DISABLE KEYS */;
INSERT INTO `sucursales` VALUES (1,'CENTRO',1,'2025-07-31 22:22:12','2025-07-31 22:22:12'),(2,'YERBA BUENA',2,'2025-07-31 22:22:12','2025-07-31 22:22:12');
/*!40000 ALTER TABLE `sucursales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_departamentos`
--

DROP TABLE IF EXISTS `tipo_departamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_departamentos` (
  `tipo_departamento_id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`tipo_departamento_id`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_departamentos`
--

LOCK TABLES `tipo_departamentos` WRITE;
/*!40000 ALTER TABLE `tipo_departamentos` DISABLE KEYS */;
INSERT INTO `tipo_departamentos` VALUES (1,'VENTAS','Departamento de Ventas','2025-07-31 22:22:05','2025-07-31 22:22:05'),(2,'COMPRAS','Departamento de Compras','2025-07-31 22:22:05','2025-07-31 22:22:05'),(3,'TESORERIA','Departamento de Tesorería','2025-07-31 22:22:05','2025-07-31 22:22:05');
/*!40000 ALTER TABLE `tipo_departamentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_empleados`
--

DROP TABLE IF EXISTS `tipo_empleados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_empleados` (
  `tipo_empleado_id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`tipo_empleado_id`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_empleados`
--

LOCK TABLES `tipo_empleados` WRITE;
/*!40000 ALTER TABLE `tipo_empleados` DISABLE KEYS */;
INSERT INTO `tipo_empleados` VALUES (1,'VENDEDOR','Empleado de ventas','2025-07-31 22:22:32','2025-07-31 22:22:32'),(2,'COMPRADOR','Empleado de compras','2025-07-31 22:22:32','2025-07-31 22:22:32'),(3,'Administrativo',NULL,'2025-07-31 22:28:41','2025-07-31 22:28:41');
/*!40000 ALTER TABLE `tipo_empleados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tratamientos`
--

DROP TABLE IF EXISTS `tratamientos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tratamientos` (
  `tratamiento_id` int NOT NULL AUTO_INCREMENT,
  `diagnostico_id` int DEFAULT NULL,
  `empleado_id` int DEFAULT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `fecha_fin` date DEFAULT NULL,
  `descripcion` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`tratamiento_id`),
  KEY `diagnostico_id` (`diagnostico_id`),
  KEY `empleado_id` (`empleado_id`),
  CONSTRAINT `tratamientos_ibfk_1` FOREIGN KEY (`diagnostico_id`) REFERENCES `diagnosticos` (`diagnostico_id`),
  CONSTRAINT `tratamientos_ibfk_2` FOREIGN KEY (`empleado_id`) REFERENCES `empleados` (`empleado_id`),
  CONSTRAINT `tratamientos_chk_1` CHECK (((`fecha_fin` is null) or (`fecha_fin` >= `fecha_inicio`)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tratamientos`
--

LOCK TABLES `tratamientos` WRITE;
/*!40000 ALTER TABLE `tratamientos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tratamientos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vista_accidentes`
--

DROP TABLE IF EXISTS `vista_accidentes`;
/*!50001 DROP VIEW IF EXISTS `vista_accidentes`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_accidentes` AS SELECT 
 1 AS `accidente_id`,
 1 AS `legajo`,
 1 AS `nomape`,
 1 AS `fecha_accidente`,
 1 AS `descripcion`,
 1 AS `gravedad`,
 1 AS `lugar`,
 1 AS `dias_incapacidad`,
 1 AS `codigo_diagnostico`,
 1 AS `diagnostico`,
 1 AS `sucursal`,
 1 AS `departamento`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_articulos_stock_alto`
--

DROP TABLE IF EXISTS `vista_articulos_stock_alto`;
/*!50001 DROP VIEW IF EXISTS `vista_articulos_stock_alto`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_articulos_stock_alto` AS SELECT 
 1 AS `CODIGO`,
 1 AS `DESCRIPCION_ARTICULO`,
 1 AS `NOMBRE_DEPOSITO`,
 1 AS `DOMICILIO_DEPOSITO`,
 1 AS `STOCK`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_cantidad_total_articulos_vendidos`
--

DROP TABLE IF EXISTS `vista_cantidad_total_articulos_vendidos`;
/*!50001 DROP VIEW IF EXISTS `vista_cantidad_total_articulos_vendidos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_cantidad_total_articulos_vendidos` AS SELECT 
 1 AS `codigo_barra`,
 1 AS `producto`,
 1 AS `cantidad_total_vendida`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_clientes_sucursal_yerba_buena`
--

DROP TABLE IF EXISTS `vista_clientes_sucursal_yerba_buena`;
/*!50001 DROP VIEW IF EXISTS `vista_clientes_sucursal_yerba_buena`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_clientes_sucursal_yerba_buena` AS SELECT 
 1 AS `cuit`,
 1 AS `razon_social`,
 1 AS `email`,
 1 AS `sucursal`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_clientes_tucuman_agua`
--

DROP TABLE IF EXISTS `vista_clientes_tucuman_agua`;
/*!50001 DROP VIEW IF EXISTS `vista_clientes_tucuman_agua`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_clientes_tucuman_agua` AS SELECT 
 1 AS `CUIT`,
 1 AS `RAZSOC`,
 1 AS `DIRECCION`,
 1 AS `TELEFONO`,
 1 AS `MAIL`,
 1 AS `CREDITO`,
 1 AS `RANKING`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_consulta_26`
--

DROP TABLE IF EXISTS `vista_consulta_26`;
/*!50001 DROP VIEW IF EXISTS `vista_consulta_26`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_consulta_26` AS SELECT 
 1 AS `departamento_id`,
 1 AS `total_comprado`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_consulta_27`
--

DROP TABLE IF EXISTS `vista_consulta_27`;
/*!50001 DROP VIEW IF EXISTS `vista_consulta_27`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_consulta_27` AS SELECT 
 1 AS `orden_compra_id`,
 1 AS `estado`,
 1 AS `fecha_orden`,
 1 AS `total`,
 1 AS `proveedor_id`,
 1 AS `empleado_id`,
 1 AS `sucursal_id`,
 1 AS `departamento_id`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_consulta_28`
--

DROP TABLE IF EXISTS `vista_consulta_28`;
/*!50001 DROP VIEW IF EXISTS `vista_consulta_28`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_consulta_28` AS SELECT 
 1 AS `producto_id`,
 1 AS `producto`,
 1 AS `cantidad_solicitada`,
 1 AS `cantidad_recepcionada`,
 1 AS `saldo_pendiente`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_consulta_29`
--

DROP TABLE IF EXISTS `vista_consulta_29`;
/*!50001 DROP VIEW IF EXISTS `vista_consulta_29`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_consulta_29` AS SELECT 
 1 AS `orden_compra_id`,
 1 AS `fecha_orden`,
 1 AS `estado`,
 1 AS `total`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_consulta_30`
--

DROP TABLE IF EXISTS `vista_consulta_30`;
/*!50001 DROP VIEW IF EXISTS `vista_consulta_30`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_consulta_30` AS SELECT 
 1 AS `fecha_remito`,
 1 AS `remito_id`,
 1 AS `producto_id`,
 1 AS `producto`,
 1 AS `cantidad_ingresada`,
 1 AS `porcentaje_acumulado`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_consulta_31`
--

DROP TABLE IF EXISTS `vista_consulta_31`;
/*!50001 DROP VIEW IF EXISTS `vista_consulta_31`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_consulta_31` AS SELECT 
 1 AS `cotizacion_id`,
 1 AS `producto_id`,
 1 AS `producto`,
 1 AS `precio_cotizado`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_consulta_32`
--

DROP TABLE IF EXISTS `vista_consulta_32`;
/*!50001 DROP VIEW IF EXISTS `vista_consulta_32`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_consulta_32` AS SELECT 
 1 AS `proveedor_id`,
 1 AS `razon_social`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_consulta_33`
--

DROP TABLE IF EXISTS `vista_consulta_33`;
/*!50001 DROP VIEW IF EXISTS `vista_consulta_33`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_consulta_33` AS SELECT 
 1 AS `precio_promedio_total`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_consulta_34`
--

DROP TABLE IF EXISTS `vista_consulta_34`;
/*!50001 DROP VIEW IF EXISTS `vista_consulta_34`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_consulta_34` AS SELECT 
 1 AS `proveedor_id`,
 1 AS `razon_social`,
 1 AS `precio_minimo`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_consulta_35`
--

DROP TABLE IF EXISTS `vista_consulta_35`;
/*!50001 DROP VIEW IF EXISTS `vista_consulta_35`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_consulta_35` AS SELECT 
 1 AS `orden_compra_id`,
 1 AS `estado`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_consulta_36`
--

DROP TABLE IF EXISTS `vista_consulta_36`;
/*!50001 DROP VIEW IF EXISTS `vista_consulta_36`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_consulta_36` AS SELECT 
 1 AS `cotizacion_id`,
 1 AS `fecha_cotizacion`,
 1 AS `precio_total`,
 1 AS `condicion_pago`,
 1 AS `estado`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_consulta_37`
--

DROP TABLE IF EXISTS `vista_consulta_37`;
/*!50001 DROP VIEW IF EXISTS `vista_consulta_37`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_consulta_37` AS SELECT 
 1 AS `orden_compra_id`,
 1 AS `estado`,
 1 AS `condicion_pago`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_consuta_28`
--

DROP TABLE IF EXISTS `vista_consuta_28`;
/*!50001 DROP VIEW IF EXISTS `vista_consuta_28`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_consuta_28` AS SELECT 
 1 AS `producto_id`,
 1 AS `producto`,
 1 AS `cantidad_solicitada`,
 1 AS `cantidad_recepcionada`,
 1 AS `saldo_pendiente`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_cursos_sector_tesoreria`
--

DROP TABLE IF EXISTS `vista_cursos_sector_tesoreria`;
/*!50001 DROP VIEW IF EXISTS `vista_cursos_sector_tesoreria`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_cursos_sector_tesoreria` AS SELECT 
 1 AS `empleado_id`,
 1 AS `nomape`,
 1 AS `sector`,
 1 AS `curso`,
 1 AS `codigo`,
 1 AS `fecha_inicio`,
 1 AS `fecha_fin`,
 1 AS `resultado`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_empleados_ventas_tucuman`
--

DROP TABLE IF EXISTS `vista_empleados_ventas_tucuman`;
/*!50001 DROP VIEW IF EXISTS `vista_empleados_ventas_tucuman`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_empleados_ventas_tucuman` AS SELECT 
 1 AS `CUIL`,
 1 AS `NOMAPE`,
 1 AS `DIRECC`,
 1 AS `TELEFONO`,
 1 AS `EMAIL`,
 1 AS `DEPARTAMENTO`,
 1 AS `FECHA_ALTA`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_entregas_por_factura`
--

DROP TABLE IF EXISTS `vista_entregas_por_factura`;
/*!50001 DROP VIEW IF EXISTS `vista_entregas_por_factura`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_entregas_por_factura` AS SELECT 
 1 AS `remito_cliente_id`,
 1 AS `numero_factura`,
 1 AS `fecha_entrega`,
 1 AS `producto_id`,
 1 AS `producto_descripcion`,
 1 AS `cantidad`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_facturas_compras_mayor_150k`
--

DROP TABLE IF EXISTS `vista_facturas_compras_mayor_150k`;
/*!50001 DROP VIEW IF EXISTS `vista_facturas_compras_mayor_150k`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_facturas_compras_mayor_150k` AS SELECT 
 1 AS `NRO_FACTURA`,
 1 AS `FECHA_COMPRA`,
 1 AS `BRUTO_TOTAL`,
 1 AS `NETO_TOTAL`,
 1 AS `IVA`,
 1 AS `CANT_COMPRADA`,
 1 AS `PRECIO_UNITARIO`,
 1 AS `DESCRIPCION_PRODUCTO`,
 1 AS `RAZON_SOCIAL_PROVEEDOR`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_facturas_mayores_150000`
--

DROP TABLE IF EXISTS `vista_facturas_mayores_150000`;
/*!50001 DROP VIEW IF EXISTS `vista_facturas_mayores_150000`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_facturas_mayores_150000` AS SELECT 
 1 AS `NRO_FACTURA`,
 1 AS `FECHA_DE_COMPRA`,
 1 AS `BRUTO_TOTAL`,
 1 AS `NETO_TOTAL`,
 1 AS `IVA`,
 1 AS `CANTIDAD`,
 1 AS `PRECIO_UNITARIO`,
 1 AS `DESCRIPCION`,
 1 AS `RAZON_SOCIAL_PROVEEDOR`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_facturas_tarjeta_visa`
--

DROP TABLE IF EXISTS `vista_facturas_tarjeta_visa`;
/*!50001 DROP VIEW IF EXISTS `vista_facturas_tarjeta_visa`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_facturas_tarjeta_visa` AS SELECT 
 1 AS `numero_factura`,
 1 AS `fecha_factura`,
 1 AS `total`,
 1 AS `medio_pago`,
 1 AS `razon_social`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_grupo_familiar_23156789`
--

DROP TABLE IF EXISTS `vista_grupo_familiar_23156789`;
/*!50001 DROP VIEW IF EXISTS `vista_grupo_familiar_23156789`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_grupo_familiar_23156789` AS SELECT 
 1 AS `dni_empleado`,
 1 AS `nombre_empleado`,
 1 AS `apellido_empleado`,
 1 AS `descripcion_grupo_familiar`,
 1 AS `nombre_persona`,
 1 AS `apellido_persona`,
 1 AS `dni_persona`,
 1 AS `parentesco`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_historial_sectores_20732589`
--

DROP TABLE IF EXISTS `vista_historial_sectores_20732589`;
/*!50001 DROP VIEW IF EXISTS `vista_historial_sectores_20732589`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_historial_sectores_20732589` AS SELECT 
 1 AS `legajo`,
 1 AS `nomape`,
 1 AS `sector`,
 1 AS `fecha_ingreso`,
 1 AS `fecha_baja`,
 1 AS `estado_actual`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_libro_haberes_2023_01`
--

DROP TABLE IF EXISTS `vista_libro_haberes_2023_01`;
/*!50001 DROP VIEW IF EXISTS `vista_libro_haberes_2023_01`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_libro_haberes_2023_01` AS SELECT 
 1 AS `liquidacion_id`,
 1 AS `codigo_liquidacion`,
 1 AS `periodo`,
 1 AS `fecha_pago`,
 1 AS `nombre`,
 1 AS `apellido`,
 1 AS `cuil`,
 1 AS `concepto`,
 1 AS `naturaleza`,
 1 AS `cantidad`,
 1 AS `monto_unitario`,
 1 AS `monto_total`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_promedio_peso_empleado`
--

DROP TABLE IF EXISTS `vista_promedio_peso_empleado`;
/*!50001 DROP VIEW IF EXISTS `vista_promedio_peso_empleado`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_promedio_peso_empleado` AS SELECT 
 1 AS `legajo`,
 1 AS `nomape`,
 1 AS `edad`,
 1 AS `peso_promedio_kg`,
 1 AS `cantidad_mediciones`,
 1 AS `primera_medicion`,
 1 AS `ultima_medicion`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_promedio_ventas_cuatrimestre`
--

DROP TABLE IF EXISTS `vista_promedio_ventas_cuatrimestre`;
/*!50001 DROP VIEW IF EXISTS `vista_promedio_ventas_cuatrimestre`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_promedio_ventas_cuatrimestre` AS SELECT 
 1 AS `sucursal`,
 1 AS `precio_promedio_ventas`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_proveedores_tucuman_canos`
--

DROP TABLE IF EXISTS `vista_proveedores_tucuman_canos`;
/*!50001 DROP VIEW IF EXISTS `vista_proveedores_tucuman_canos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_proveedores_tucuman_canos` AS SELECT 
 1 AS `cuit`,
 1 AS `razon_social`,
 1 AS `calle`,
 1 AS `numero`,
 1 AS `provincia`,
 1 AS `telefono`,
 1 AS `email`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_ranking_ventas_empleados_ultimo_anio`
--

DROP TABLE IF EXISTS `vista_ranking_ventas_empleados_ultimo_anio`;
/*!50001 DROP VIEW IF EXISTS `vista_ranking_ventas_empleados_ultimo_anio`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_ranking_ventas_empleados_ultimo_anio` AS SELECT 
 1 AS `legajo`,
 1 AS `nomape`,
 1 AS `edad`,
 1 AS `monto_ventas`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_recibo_sueldo_23156789_2023_01`
--

DROP TABLE IF EXISTS `vista_recibo_sueldo_23156789_2023_01`;
/*!50001 DROP VIEW IF EXISTS `vista_recibo_sueldo_23156789_2023_01`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_recibo_sueldo_23156789_2023_01` AS SELECT 
 1 AS `nombre`,
 1 AS `apellido`,
 1 AS `cuil`,
 1 AS `codigo_liquidacion`,
 1 AS `periodo`,
 1 AS `fecha_pago`,
 1 AS `concepto`,
 1 AS `naturaleza`,
 1 AS `cantidad`,
 1 AS `monto_unitario`,
 1 AS `monto_total`,
 1 AS `total_bruto`,
 1 AS `total_deducciones`,
 1 AS `total_neto`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_revision_medica`
--

DROP TABLE IF EXISTS `vista_revision_medica`;
/*!50001 DROP VIEW IF EXISTS `vista_revision_medica`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_revision_medica` AS SELECT 
 1 AS `legajo`,
 1 AS `nomape`,
 1 AS `revision_id`,
 1 AS `fecha_revision`,
 1 AS `observaciones`,
 1 AS `parametro`,
 1 AS `valor`,
 1 AS `unidad`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_stock_alto_rubros`
--

DROP TABLE IF EXISTS `vista_stock_alto_rubros`;
/*!50001 DROP VIEW IF EXISTS `vista_stock_alto_rubros`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_stock_alto_rubros` AS SELECT 
 1 AS `CODIGO`,
 1 AS `DESCRIPCION_ARTICULO`,
 1 AS `NOMBRE_DEPOSITO`,
 1 AS `DOMICILIO_DEPOSITO`,
 1 AS `STOCK_SEGURIDAD`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_stock_existente_deposito1`
--

DROP TABLE IF EXISTS `vista_stock_existente_deposito1`;
/*!50001 DROP VIEW IF EXISTS `vista_stock_existente_deposito1`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_stock_existente_deposito1` AS SELECT 
 1 AS `stock_id`,
 1 AS `producto`,
 1 AS `cantidad`,
 1 AS `stock_minimo`,
 1 AS `stock_maximo`,
 1 AS `almacen`,
 1 AS `sucursal`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_valoracion_stocks`
--

DROP TABLE IF EXISTS `vista_valoracion_stocks`;
/*!50001 DROP VIEW IF EXISTS `vista_valoracion_stocks`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_valoracion_stocks` AS SELECT 
 1 AS `CODIGO`,
 1 AS `DESCRIPCION_ARTICULO`,
 1 AS `STOCK`,
 1 AS `NOMBRE_DEPOSITO`,
 1 AS `COSTO_UNITARIO`,
 1 AS `VALORACION`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_ventas_sucursal_centro_trimestre`
--

DROP TABLE IF EXISTS `vista_ventas_sucursal_centro_trimestre`;
/*!50001 DROP VIEW IF EXISTS `vista_ventas_sucursal_centro_trimestre`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_ventas_sucursal_centro_trimestre` AS SELECT 
 1 AS `sucursal`,
 1 AS `monto_total_ventas`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vista_accidentes`
--

/*!50001 DROP VIEW IF EXISTS `vista_accidentes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_accidentes` AS select `al`.`accidente_id` AS `accidente_id`,`e`.`empleado_id` AS `legajo`,concat(`e`.`apellido`,', ',`e`.`nombre`) AS `nomape`,`al`.`fecha_accidente` AS `fecha_accidente`,`al`.`descripcion` AS `descripcion`,`al`.`gravedad` AS `gravedad`,`al`.`lugar` AS `lugar`,`al`.`dias_incapacidad` AS `dias_incapacidad`,`diag`.`codigo` AS `codigo_diagnostico`,`diag`.`descripcion` AS `diagnostico`,`s`.`nombre` AS `sucursal`,`d`.`nombre` AS `departamento` from ((((`accidentes_laborales` `al` join `empleados` `e` on((`al`.`empleado_id` = `e`.`empleado_id`))) left join `diagnosticos` `diag` on((`al`.`diagnostico_id` = `diag`.`diagnostico_id`))) join `sucursales` `s` on((`e`.`sucursal_id` = `s`.`sucursal_id`))) join `departamentos` `d` on((`e`.`departamento_id` = `d`.`departamento_id`))) where (`al`.`fecha_accidente` >= (curdate() - interval 1 year)) order by `al`.`fecha_accidente` desc,`al`.`gravedad` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_articulos_stock_alto`
--

/*!50001 DROP VIEW IF EXISTS `vista_articulos_stock_alto`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_articulos_stock_alto` AS select `p`.`codigo_barra` AS `CODIGO`,`p`.`nombre` AS `DESCRIPCION_ARTICULO`,`a`.`nombre` AS `NOMBRE_DEPOSITO`,concat(`d`.`calle`,' ',`d`.`numero`,ifnull(concat(' Piso ',`d`.`piso`),''),ifnull(concat(' Depto ',`d`.`depto`),'')) AS `DOMICILIO_DEPOSITO`,`s`.`cantidad` AS `STOCK` from ((((`stocks` `s` join `productos` `p` on((`s`.`producto_id` = `p`.`producto_id`))) join `almacenes` `a` on((`s`.`almacen_id` = `a`.`almacen_id`))) join `direcciones` `d` on((`a`.`direccion_id` = `d`.`direccion_id`))) join `rubros` `r` on((`p`.`rubro_id` = `r`.`rubro_id`))) where ((`s`.`cantidad` > 1000) and (`r`.`nombre` in ('cementos','pegamentos','electricidad'))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_cantidad_total_articulos_vendidos`
--

/*!50001 DROP VIEW IF EXISTS `vista_cantidad_total_articulos_vendidos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_cantidad_total_articulos_vendidos` AS select `p`.`codigo_barra` AS `codigo_barra`,`p`.`nombre` AS `producto`,sum(`df`.`cantidad`) AS `cantidad_total_vendida` from ((`detalle_facturas` `df` join `productos` `p` on((`df`.`producto_id` = `p`.`producto_id`))) join `facturas` `f` on((`df`.`factura_id` = `f`.`factura_id`))) where (`f`.`tipo_factura` like 'VENTA%') group by `p`.`codigo_barra`,`p`.`nombre` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_clientes_sucursal_yerba_buena`
--

/*!50001 DROP VIEW IF EXISTS `vista_clientes_sucursal_yerba_buena`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_clientes_sucursal_yerba_buena` AS select distinct `c`.`cuit` AS `cuit`,`c`.`razon_social` AS `razon_social`,`c`.`email` AS `email`,`s`.`nombre` AS `sucursal` from ((`facturas` `f` join `clientes` `c` on((`f`.`cliente_id` = `c`.`cliente_id`))) join `sucursales` `s` on((`f`.`sucursal_id` = `s`.`sucursal_id`))) where (lower(`s`.`nombre`) = 'yerba buena') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_clientes_tucuman_agua`
--

/*!50001 DROP VIEW IF EXISTS `vista_clientes_tucuman_agua`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_clientes_tucuman_agua` AS select `c`.`cuit` AS `CUIT`,`c`.`razon_social` AS `RAZSOC`,concat(`d`.`calle`,' ',`d`.`numero`,ifnull(concat(' Piso ',`d`.`piso`),''),ifnull(concat(' Depto ',`d`.`depto`),'')) AS `DIRECCION`,`c`.`telefono` AS `TELEFONO`,`c`.`email` AS `MAIL`,NULL AS `CREDITO`,`rnk`.`ranking` AS `RANKING` from (((((`clientes` `c` join `direcciones` `d` on((`c`.`direccion_id` = `d`.`direccion_id`))) join `ciudades` `ciu` on((`d`.`ciudad_id` = `ciu`.`ciudad_id`))) join `provincias` `p` on((`d`.`provincia_id` = `p`.`provincia_id`))) join `rankings` `rnk` on((`rnk`.`proveedor_id` = `c`.`cliente_id`))) join `rubros` `ru` on((`rnk`.`rubro_id` = `ru`.`rubro_id`))) where ((`c`.`created_at` > '2021-01-01') and (`p`.`nombre` = 'Tucumán') and (`ciu`.`nombre` = 'S.M. de Tucumán') and (`ru`.`nombre` = 'Caños para agua')) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_consulta_26`
--

/*!50001 DROP VIEW IF EXISTS `vista_consulta_26`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_consulta_26` AS select `oc`.`departamento_id` AS `departamento_id`,sum(`oc`.`total`) AS `total_comprado` from `orden_compras` `oc` where ((`oc`.`fecha_orden` between '2024-01-01' and '2024-12-31') and (`oc`.`estado` in ('CONFIRMADA','PARCIALMENTE_RECIBIDA','RECIBIDA'))) group by `oc`.`departamento_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_consulta_27`
--

/*!50001 DROP VIEW IF EXISTS `vista_consulta_27`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_consulta_27` AS select `orden_compras`.`orden_compra_id` AS `orden_compra_id`,`orden_compras`.`estado` AS `estado`,`orden_compras`.`fecha_orden` AS `fecha_orden`,`orden_compras`.`total` AS `total`,`orden_compras`.`proveedor_id` AS `proveedor_id`,`orden_compras`.`empleado_id` AS `empleado_id`,`orden_compras`.`sucursal_id` AS `sucursal_id`,`orden_compras`.`departamento_id` AS `departamento_id` from `orden_compras` where (`orden_compras`.`estado` not in ('RECIBIDA','CANCELADA')) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_consulta_28`
--

/*!50001 DROP VIEW IF EXISTS `vista_consulta_28`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_consulta_28` AS select `doc`.`producto_id` AS `producto_id`,`p`.`nombre` AS `producto`,`doc`.`cantidad` AS `cantidad_solicitada`,ifnull(sum(`dr`.`cantidad`),0) AS `cantidad_recepcionada`,(`doc`.`cantidad` - ifnull(sum(`dr`.`cantidad`),0)) AS `saldo_pendiente` from (((`detalle_orden_compras` `doc` left join `detalle_remitos` `dr` on((`doc`.`producto_id` = `dr`.`producto_id`))) left join `remitos` `r` on(((`dr`.`remito_id` = `r`.`remito_id`) and (`r`.`orden_compra_id` = `doc`.`orden_compra_id`)))) join `productos` `p` on((`doc`.`producto_id` = `p`.`producto_id`))) where (`doc`.`orden_compra_id` = 123) group by `doc`.`producto_id`,`doc`.`cantidad`,`p`.`nombre` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_consulta_29`
--

/*!50001 DROP VIEW IF EXISTS `vista_consulta_29`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_consulta_29` AS select `orden_compras`.`orden_compra_id` AS `orden_compra_id`,`orden_compras`.`fecha_orden` AS `fecha_orden`,`orden_compras`.`estado` AS `estado`,`orden_compras`.`total` AS `total` from `orden_compras` where (`orden_compras`.`estado` = 'PENDIENTE') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_consulta_30`
--

/*!50001 DROP VIEW IF EXISTS `vista_consulta_30`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_consulta_30` AS select `r`.`fecha_remito` AS `fecha_remito`,`r`.`remito_id` AS `remito_id`,`p`.`producto_id` AS `producto_id`,`p`.`nombre` AS `producto`,sum(`dr`.`cantidad`) AS `cantidad_ingresada`,round(((sum(`dr`.`cantidad`) / `doc`.`cantidad`) * 100),2) AS `porcentaje_acumulado` from (((`detalle_remitos` `dr` join `remitos` `r` on((`dr`.`remito_id` = `r`.`remito_id`))) join `detalle_orden_compras` `doc` on(((`doc`.`producto_id` = `dr`.`producto_id`) and (`doc`.`orden_compra_id` = `r`.`orden_compra_id`)))) join `productos` `p` on((`p`.`producto_id` = `dr`.`producto_id`))) where (`r`.`orden_compra_id` = 123) group by `r`.`fecha_remito`,`r`.`remito_id`,`p`.`producto_id`,`p`.`nombre`,`doc`.`cantidad` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_consulta_31`
--

/*!50001 DROP VIEW IF EXISTS `vista_consulta_31`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_consulta_31` AS select `c`.`cotizacion_id` AS `cotizacion_id`,`dc`.`producto_id` AS `producto_id`,`p`.`nombre` AS `producto`,`dc`.`precio_unitario` AS `precio_cotizado` from (((`cotizacion_orden` `co` join `cotizaciones` `c` on((`co`.`cotizacion_id` = `c`.`cotizacion_id`))) join `detalle_cotizaciones` `dc` on((`c`.`cotizacion_id` = `dc`.`cotizacion_id`))) join `productos` `p` on((`dc`.`producto_id` = `p`.`producto_id`))) where (`co`.`orden_compra_id` = 123) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_consulta_32`
--

/*!50001 DROP VIEW IF EXISTS `vista_consulta_32`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_consulta_32` AS select distinct `pr`.`proveedor_id` AS `proveedor_id`,`pr`.`razon_social` AS `razon_social` from ((((`cotizacion_orden` `co` join `cotizaciones` `c` on((`co`.`cotizacion_id` = `c`.`cotizacion_id`))) join `detalle_cotizaciones` `dc` on((`c`.`cotizacion_id` = `dc`.`cotizacion_id`))) join `producto_proveedor` `pp` on((`dc`.`producto_id` = `pp`.`producto_id`))) join `proveedores` `pr` on((`pp`.`proveedor_id` = `pr`.`proveedor_id`))) where (`co`.`orden_compra_id` = 123) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_consulta_33`
--

/*!50001 DROP VIEW IF EXISTS `vista_consulta_33`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_consulta_33` AS select round(avg(`dc`.`precio_unitario`),2) AS `precio_promedio_total` from ((`cotizacion_orden` `co` join `cotizaciones` `c` on((`co`.`cotizacion_id` = `c`.`cotizacion_id`))) join `detalle_cotizaciones` `dc` on((`c`.`cotizacion_id` = `dc`.`cotizacion_id`))) where (`co`.`orden_compra_id` = 123) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_consulta_34`
--

/*!50001 DROP VIEW IF EXISTS `vista_consulta_34`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_consulta_34` AS select `pr`.`proveedor_id` AS `proveedor_id`,`pr`.`razon_social` AS `razon_social`,min(`dc`.`precio_unitario`) AS `precio_minimo` from ((((`cotizacion_orden` `co` join `cotizaciones` `c` on((`co`.`cotizacion_id` = `c`.`cotizacion_id`))) join `detalle_cotizaciones` `dc` on((`c`.`cotizacion_id` = `dc`.`cotizacion_id`))) join `producto_proveedor` `pp` on((`dc`.`producto_id` = `pp`.`producto_id`))) join `proveedores` `pr` on((`pp`.`proveedor_id` = `pr`.`proveedor_id`))) where (`co`.`orden_compra_id` = 123) group by `pr`.`proveedor_id`,`pr`.`razon_social` order by `precio_minimo` limit 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_consulta_35`
--

/*!50001 DROP VIEW IF EXISTS `vista_consulta_35`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_consulta_35` AS select `orden_compras`.`orden_compra_id` AS `orden_compra_id`,`orden_compras`.`estado` AS `estado` from `orden_compras` where (`orden_compras`.`orden_compra_id` = 123) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_consulta_36`
--

/*!50001 DROP VIEW IF EXISTS `vista_consulta_36`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_consulta_36` AS select `c`.`cotizacion_id` AS `cotizacion_id`,`c`.`fecha_cotizacion` AS `fecha_cotizacion`,`c`.`precio_total` AS `precio_total`,`c`.`condicion_pago` AS `condicion_pago`,`c`.`estado` AS `estado` from (`cotizaciones` `c` join `cotizacion_orden` `co` on((`c`.`cotizacion_id` = `co`.`cotizacion_id`))) where ((`co`.`orden_compra_id` = 123) and (`c`.`estado` = 'SELECCIONADA')) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_consulta_37`
--

/*!50001 DROP VIEW IF EXISTS `vista_consulta_37`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_consulta_37` AS select `orden_compras`.`orden_compra_id` AS `orden_compra_id`,`orden_compras`.`estado` AS `estado`,`orden_compras`.`condicion_pago` AS `condicion_pago` from `orden_compras` where (`orden_compras`.`condicion_pago` = 'e-cheq') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_consuta_28`
--

/*!50001 DROP VIEW IF EXISTS `vista_consuta_28`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_consuta_28` AS select `doc`.`producto_id` AS `producto_id`,`p`.`nombre` AS `producto`,`doc`.`cantidad` AS `cantidad_solicitada`,ifnull(sum(`dr`.`cantidad`),0) AS `cantidad_recepcionada`,(`doc`.`cantidad` - ifnull(sum(`dr`.`cantidad`),0)) AS `saldo_pendiente` from (((`detalle_orden_compras` `doc` left join `detalle_remitos` `dr` on((`doc`.`producto_id` = `dr`.`producto_id`))) left join `remitos` `r` on(((`dr`.`remito_id` = `r`.`remito_id`) and (`r`.`orden_compra_id` = `doc`.`orden_compra_id`)))) join `productos` `p` on((`doc`.`producto_id` = `p`.`producto_id`))) where (`doc`.`orden_compra_id` = 123) group by `doc`.`producto_id`,`doc`.`cantidad`,`p`.`nombre` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_cursos_sector_tesoreria`
--

/*!50001 DROP VIEW IF EXISTS `vista_cursos_sector_tesoreria`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_cursos_sector_tesoreria` AS select `e`.`empleado_id` AS `empleado_id`,concat(`e`.`nombre`,' ',`e`.`apellido`) AS `nomape`,`d`.`nombre` AS `sector`,`c`.`nombre` AS `curso`,`c`.`codigo` AS `codigo`,`ec`.`fecha_inicio` AS `fecha_inicio`,`ec`.`fecha_fin` AS `fecha_fin`,`ec`.`resultado` AS `resultado` from (((`empleados` `e` join `departamentos` `d` on((`e`.`departamento_id` = `d`.`departamento_id`))) join `empleado_curso` `ec` on((`e`.`empleado_id` = `ec`.`empleado_id`))) join `cursos` `c` on((`ec`.`curso_id` = `c`.`curso_id`))) where ((`d`.`nombre` = 'TESORERIA') and (year(`ec`.`fecha_inicio`) = (year(curdate()) - 1))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_empleados_ventas_tucuman`
--

/*!50001 DROP VIEW IF EXISTS `vista_empleados_ventas_tucuman`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_empleados_ventas_tucuman` AS select `e`.`cuil` AS `CUIL`,concat(`e`.`nombre`,' ',`e`.`apellido`) AS `NOMAPE`,concat(`d`.`calle`,' ',`d`.`numero`,ifnull(concat(' Piso ',`d`.`piso`),''),ifnull(concat(' Depto ',`d`.`depto`),'')) AS `DIRECC`,`e`.`telefono` AS `TELEFONO`,`e`.`email` AS `EMAIL`,`dept`.`nombre` AS `DEPARTAMENTO`,`e`.`fecha_alta` AS `FECHA_ALTA` from ((((`empleados` `e` join `direcciones` `d` on((`e`.`direccion_id` = `d`.`direccion_id`))) join `ciudades` `c` on((`d`.`ciudad_id` = `c`.`ciudad_id`))) join `provincias` `p` on((`d`.`provincia_id` = `p`.`provincia_id`))) join `departamentos` `dept` on((`e`.`departamento_id` = `dept`.`departamento_id`))) where ((`e`.`fecha_alta` > '2021-01-01') and (`p`.`nombre` = 'Tucumán') and (`c`.`nombre` = 'S.M. de Tucumán') and (`dept`.`nombre` = 'VENTAS')) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_entregas_por_factura`
--

/*!50001 DROP VIEW IF EXISTS `vista_entregas_por_factura`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_entregas_por_factura` AS select `rc`.`remito_cliente_id` AS `remito_cliente_id`,`f`.`numero_factura` AS `numero_factura`,`rc`.`fecha_remito` AS `fecha_entrega`,`drc`.`producto_id` AS `producto_id`,`p`.`descripcion` AS `producto_descripcion`,`drc`.`cantidad` AS `cantidad` from (((`remitos_clientes` `rc` join `detalle_remitos_clientes` `drc` on((`rc`.`remito_cliente_id` = `drc`.`remito_cliente_id`))) join `productos` `p` on((`drc`.`producto_id` = `p`.`producto_id`))) join `facturas` `f` on((`rc`.`factura_id` = `f`.`factura_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_facturas_compras_mayor_150k`
--

/*!50001 DROP VIEW IF EXISTS `vista_facturas_compras_mayor_150k`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_facturas_compras_mayor_150k` AS select `fc`.`numero_factura` AS `NRO_FACTURA`,`fc`.`fecha_factura` AS `FECHA_COMPRA`,`fc`.`total` AS `BRUTO_TOTAL`,(`fc`.`total` - (`fc`.`total` / 1.21)) AS `NETO_TOTAL`,round((`fc`.`total` * 0.21),2) AS `IVA`,`dfc`.`cantidad` AS `CANT_COMPRADA`,`dfc`.`precio_unitario` AS `PRECIO_UNITARIO`,`p`.`nombre` AS `DESCRIPCION_PRODUCTO`,`prov`.`razon_social` AS `RAZON_SOCIAL_PROVEEDOR` from (((`facturas_compras` `fc` join `detalle_facturas_compras` `dfc` on((`fc`.`factura_compra_id` = `dfc`.`factura_compra_id`))) join `productos` `p` on((`dfc`.`producto_id` = `p`.`producto_id`))) join `proveedores` `prov` on((`fc`.`proveedor_id` = `prov`.`proveedor_id`))) where (`fc`.`total` > 150000) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_facturas_mayores_150000`
--

/*!50001 DROP VIEW IF EXISTS `vista_facturas_mayores_150000`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_facturas_mayores_150000` AS select `fc`.`numero_factura` AS `NRO_FACTURA`,`fc`.`fecha_factura` AS `FECHA_DE_COMPRA`,`fc`.`total` AS `BRUTO_TOTAL`,`fc`.`total` AS `NETO_TOTAL`,round((`fc`.`total` * 0.21),2) AS `IVA`,`dfc`.`cantidad` AS `CANTIDAD`,`dfc`.`precio_unitario` AS `PRECIO_UNITARIO`,`p`.`nombre` AS `DESCRIPCION`,`prov`.`razon_social` AS `RAZON_SOCIAL_PROVEEDOR` from (((`facturas_compras` `fc` join `detalle_facturas_compras` `dfc` on((`fc`.`factura_compra_id` = `dfc`.`factura_compra_id`))) join `productos` `p` on((`dfc`.`producto_id` = `p`.`producto_id`))) join `proveedores` `prov` on((`fc`.`proveedor_id` = `prov`.`proveedor_id`))) where (`fc`.`total` > 150000) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_facturas_tarjeta_visa`
--

/*!50001 DROP VIEW IF EXISTS `vista_facturas_tarjeta_visa`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_facturas_tarjeta_visa` AS select `f`.`numero_factura` AS `numero_factura`,`f`.`fecha_factura` AS `fecha_factura`,`f`.`total` AS `total`,`mp`.`nombre` AS `medio_pago`,`c`.`razon_social` AS `razon_social` from (((((`facturas` `f` join `detalle_recibos` `dr` on((`f`.`factura_id` = `dr`.`factura_id`))) join `recibos` `r` on((`dr`.`recibo_id` = `r`.`recibo_id`))) join `pagos` `p` on((`r`.`recibo_id` = `p`.`recibo_id`))) join `medios_pagos` `mp` on((`p`.`medio_pago_id` = `mp`.`medio_pago_id`))) join `clientes` `c` on((`f`.`cliente_id` = `c`.`cliente_id`))) where (`mp`.`nombre` = 'Tarjeta de crédito Visa') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_grupo_familiar_23156789`
--

/*!50001 DROP VIEW IF EXISTS `vista_grupo_familiar_23156789`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_grupo_familiar_23156789` AS select `e`.`dni` AS `dni_empleado`,`e`.`nombre` AS `nombre_empleado`,`e`.`apellido` AS `apellido_empleado`,`gf`.`descripcion` AS `descripcion_grupo_familiar`,`p`.`nombre` AS `nombre_persona`,`p`.`apellido` AS `apellido_persona`,`p`.`dni` AS `dni_persona`,`gfp`.`parentesco` AS `parentesco` from (((`empleados` `e` join `grupo_familiares` `gf` on((`e`.`empleado_id` = `gf`.`empleado_id`))) join `grupo_familiares_personas` `gfp` on((`gf`.`grupo_familiar_id` = `gfp`.`grupo_familiar_id`))) join `personas` `p` on((`gfp`.`persona_id` = `p`.`persona_id`))) where (`e`.`dni` = '23156789') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_historial_sectores_20732589`
--

/*!50001 DROP VIEW IF EXISTS `vista_historial_sectores_20732589`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_historial_sectores_20732589` AS select `e`.`empleado_id` AS `legajo`,concat(`e`.`nombre`,' ',`e`.`apellido`) AS `nomape`,`d`.`nombre` AS `sector`,`h`.`fecha_desde` AS `fecha_ingreso`,`h`.`fecha_hasta` AS `fecha_baja`,(case when (`h`.`fecha_hasta` is null) then 'ACTUAL' else '' end) AS `estado_actual` from ((`empleados` `e` join `empleado_departamento_historial` `h` on((`e`.`empleado_id` = `h`.`empleado_id`))) join `departamentos` `d` on((`h`.`departamento_id` = `d`.`departamento_id`))) where (`e`.`dni` = '20732589') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_libro_haberes_2023_01`
--

/*!50001 DROP VIEW IF EXISTS `vista_libro_haberes_2023_01`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_libro_haberes_2023_01` AS select `l`.`liquidacion_id` AS `liquidacion_id`,`l`.`codigo` AS `codigo_liquidacion`,`l`.`periodo` AS `periodo`,`l`.`fecha_pago` AS `fecha_pago`,`e`.`nombre` AS `nombre`,`e`.`apellido` AS `apellido`,`e`.`cuil` AS `cuil`,`c`.`nombre` AS `concepto`,`c`.`naturaleza` AS `naturaleza`,`dl`.`cantidad` AS `cantidad`,`dl`.`monto_unitario` AS `monto_unitario`,`dl`.`monto_total` AS `monto_total` from (((`liquidaciones_sueldo` `l` join `empleados` `e` on((`l`.`empleado_id` = `e`.`empleado_id`))) join `detalles_liquidaciones` `dl` on((`l`.`liquidacion_id` = `dl`.`liquidacion_id`))) join `conceptos` `c` on((`dl`.`concepto_id` = `c`.`concepto_id`))) where (`l`.`periodo` = '2023-01') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_promedio_peso_empleado`
--

/*!50001 DROP VIEW IF EXISTS `vista_promedio_peso_empleado`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_promedio_peso_empleado` AS select `e`.`empleado_id` AS `legajo`,concat(`e`.`apellido`,', ',`e`.`nombre`) AS `nomape`,timestampdiff(YEAR,`e`.`fecha_nacimiento`,curdate()) AS `edad`,round(avg(`pm`.`valor`),2) AS `peso_promedio_kg`,count(`pm`.`valor`) AS `cantidad_mediciones`,min(`rm`.`fecha_revision`) AS `primera_medicion`,max(`rm`.`fecha_revision`) AS `ultima_medicion` from ((`empleados` `e` join `revisiones_medicas` `rm` on((`e`.`empleado_id` = `rm`.`empleado_id`))) join `parametros_medicos` `pm` on((`rm`.`revision_id` = `pm`.`revision_id`))) where ((`e`.`dni` = '20732589') and (upper(`pm`.`nombre`) like '%PESO%') and (`rm`.`fecha_revision` >= (curdate() - interval 3 year))) group by `e`.`empleado_id`,`e`.`nombre`,`e`.`apellido`,`e`.`fecha_nacimiento` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_promedio_ventas_cuatrimestre`
--

/*!50001 DROP VIEW IF EXISTS `vista_promedio_ventas_cuatrimestre`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_promedio_ventas_cuatrimestre` AS select `s`.`nombre` AS `sucursal`,round(avg(`f`.`total`),2) AS `precio_promedio_ventas` from (`facturas` `f` join `sucursales` `s` on((`f`.`sucursal_id` = `s`.`sucursal_id`))) where ((upper(`s`.`nombre`) in ('CENTRO','YERBA BUENA')) and (month(`f`.`fecha_factura`) between 5 and 8)) group by `s`.`sucursal_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_proveedores_tucuman_canos`
--

/*!50001 DROP VIEW IF EXISTS `vista_proveedores_tucuman_canos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_proveedores_tucuman_canos` AS select `p`.`cuit` AS `cuit`,`p`.`razon_social` AS `razon_social`,`d`.`calle` AS `calle`,`d`.`numero` AS `numero`,`prov`.`nombre` AS `provincia`,`p`.`telefono` AS `telefono`,`p`.`email` AS `email` from (((`proveedores` `p` join `direcciones` `d` on((`p`.`direccion_id` = `d`.`direccion_id`))) join `provincias` `prov` on((`d`.`provincia_id` = `prov`.`provincia_id`))) join `ciudades` `ciu` on((`d`.`ciudad_id` = `ciu`.`ciudad_id`))) where ((`prov`.`nombre` = 'Tucumán') and (`ciu`.`nombre` = 'S.M. de Tucumán') and (`p`.`created_at` > '2021-01-01')) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_ranking_ventas_empleados_ultimo_anio`
--

/*!50001 DROP VIEW IF EXISTS `vista_ranking_ventas_empleados_ultimo_anio`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_ranking_ventas_empleados_ultimo_anio` AS select `e`.`empleado_id` AS `legajo`,concat(`e`.`nombre`,' ',`e`.`apellido`) AS `nomape`,timestampdiff(YEAR,`e`.`fecha_nacimiento`,curdate()) AS `edad`,round(sum(`f`.`total`),2) AS `monto_ventas` from (`empleados` `e` join `facturas` `f` on((`e`.`empleado_id` = `f`.`empleado_id`))) where (`f`.`fecha_factura` >= (curdate() - interval 1 year)) group by `e`.`empleado_id` order by `monto_ventas` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_recibo_sueldo_23156789_2023_01`
--

/*!50001 DROP VIEW IF EXISTS `vista_recibo_sueldo_23156789_2023_01`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_recibo_sueldo_23156789_2023_01` AS select `e`.`nombre` AS `nombre`,`e`.`apellido` AS `apellido`,`e`.`cuil` AS `cuil`,`l`.`codigo` AS `codigo_liquidacion`,`l`.`periodo` AS `periodo`,`l`.`fecha_pago` AS `fecha_pago`,`c`.`nombre` AS `concepto`,`c`.`naturaleza` AS `naturaleza`,`dl`.`cantidad` AS `cantidad`,`dl`.`monto_unitario` AS `monto_unitario`,`dl`.`monto_total` AS `monto_total`,`l`.`total_bruto` AS `total_bruto`,`l`.`total_deducciones` AS `total_deducciones`,`l`.`total_neto` AS `total_neto` from (((`empleados` `e` join `liquidaciones_sueldo` `l` on((`e`.`empleado_id` = `l`.`empleado_id`))) join `detalles_liquidaciones` `dl` on((`l`.`liquidacion_id` = `dl`.`liquidacion_id`))) join `conceptos` `c` on((`dl`.`concepto_id` = `c`.`concepto_id`))) where ((`e`.`dni` = '23156789') and (`l`.`periodo` = '2023-01')) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_revision_medica`
--

/*!50001 DROP VIEW IF EXISTS `vista_revision_medica`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_revision_medica` AS select `e`.`empleado_id` AS `legajo`,concat(`e`.`apellido`,', ',`e`.`nombre`) AS `nomape`,`rm`.`revision_id` AS `revision_id`,`rm`.`fecha_revision` AS `fecha_revision`,`rm`.`observaciones` AS `observaciones`,`pm`.`nombre` AS `parametro`,`pm`.`valor` AS `valor`,`pm`.`unidad` AS `unidad` from ((`empleados` `e` join `revisiones_medicas` `rm` on((`e`.`empleado_id` = `rm`.`empleado_id`))) left join `parametros_medicos` `pm` on((`rm`.`revision_id` = `pm`.`revision_id`))) where ((`e`.`dni` = '23156789') and (`rm`.`fecha_revision` = (select max(`rm2`.`fecha_revision`) from `revisiones_medicas` `rm2` where (`rm2`.`empleado_id` = `e`.`empleado_id`)))) order by `pm`.`nombre` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_stock_alto_rubros`
--

/*!50001 DROP VIEW IF EXISTS `vista_stock_alto_rubros`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_stock_alto_rubros` AS select `p`.`codigo_barra` AS `CODIGO`,`p`.`nombre` AS `DESCRIPCION_ARTICULO`,`a`.`nombre` AS `NOMBRE_DEPOSITO`,concat(`d`.`calle`,' ',`d`.`numero`) AS `DOMICILIO_DEPOSITO`,`s`.`stock_minimo` AS `STOCK_SEGURIDAD` from ((((`stocks` `s` join `productos` `p` on((`s`.`producto_id` = `p`.`producto_id`))) join `almacenes` `a` on((`s`.`almacen_id` = `a`.`almacen_id`))) join `direcciones` `d` on((`a`.`direccion_id` = `d`.`direccion_id`))) join `rubros` `r` on((`p`.`rubro_id` = `r`.`rubro_id`))) where ((`s`.`cantidad` > 1000) and (`r`.`nombre` in ('cementos','pegamentos','electricidad'))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_stock_existente_deposito1`
--

/*!50001 DROP VIEW IF EXISTS `vista_stock_existente_deposito1`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_stock_existente_deposito1` AS select `s`.`stock_id` AS `stock_id`,`p`.`nombre` AS `producto`,`s`.`cantidad` AS `cantidad`,`s`.`stock_minimo` AS `stock_minimo`,`s`.`stock_maximo` AS `stock_maximo`,`a`.`nombre` AS `almacen`,`suc`.`nombre` AS `sucursal` from (((`stocks` `s` join `productos` `p` on((`s`.`producto_id` = `p`.`producto_id`))) join `almacenes` `a` on((`s`.`almacen_id` = `a`.`almacen_id`))) join `sucursales` `suc` on((`a`.`sucursal_id` = `suc`.`sucursal_id`))) where ((`a`.`almacen_id` = 1) and (`s`.`cantidad` > 0)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_valoracion_stocks`
--

/*!50001 DROP VIEW IF EXISTS `vista_valoracion_stocks`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_valoracion_stocks` AS select `p`.`codigo_barra` AS `CODIGO`,`p`.`nombre` AS `DESCRIPCION_ARTICULO`,`s`.`cantidad` AS `STOCK`,`a`.`nombre` AS `NOMBRE_DEPOSITO`,`pp`.`precio_compra` AS `COSTO_UNITARIO`,(`s`.`cantidad` * `pp`.`precio_compra`) AS `VALORACION` from (((`stocks` `s` join `productos` `p` on((`s`.`producto_id` = `p`.`producto_id`))) join `almacenes` `a` on((`s`.`almacen_id` = `a`.`almacen_id`))) join `producto_proveedor` `pp` on((`p`.`producto_id` = `pp`.`producto_id`))) where (`p`.`codigo_barra` between '0001' and '1100') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_ventas_sucursal_centro_trimestre`
--

/*!50001 DROP VIEW IF EXISTS `vista_ventas_sucursal_centro_trimestre`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_ventas_sucursal_centro_trimestre` AS select `s`.`nombre` AS `sucursal`,sum(`f`.`total`) AS `monto_total_ventas` from (`facturas` `f` join `sucursales` `s` on((`f`.`sucursal_id` = `s`.`sucursal_id`))) where ((`s`.`nombre` = 'CENTRO') and (`f`.`fecha_factura` >= (curdate() - interval 3 month))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-08-04 21:10:51
