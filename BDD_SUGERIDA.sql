-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema core
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema core
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `core` DEFAULT CHARACTER SET utf8 ;
USE `core` ;

-- -----------------------------------------------------
-- Table `core`.`aspel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `core`.`aspel` (
  `idProducto` INT NOT NULL AUTO_INCREMENT,
  `CVE_ART` VARCHAR(20) NOT NULL COMMENT 'Clave del articulo',
  `DESCR` VARCHAR(40) NULL DEFAULT NULL COMMENT 'Descripción',
  `EXIST` DOUBLE NULL DEFAULT NULL COMMENT 'Existencias {0.0 ..}',
  `LIN_PROD` VARCHAR(5) NULL DEFAULT NULL COMMENT 'Clave de línea',
  `UNI_MED` VARCHAR(10) NULL DEFAULT NULL COMMENT 'Unidad de entrada',
  `NUM_MON` INT(11) NULL DEFAULT NULL COMMENT 'Clave de moneda',
  `FCH_ULTCOM` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP() ON UPDATE CURRENT_TIMESTAMP() COMMENT 'Fecha de última compra',
  `ULT_COSTO` DOUBLE NULL DEFAULT NULL COMMENT 'Último costo {0.0 ..}',
  `CVE_IMAGEN` VARCHAR(16) NULL DEFAULT NULL COMMENT 'Nombre de la imagen',
  `UUID` VARCHAR(50) NULL DEFAULT NULL COMMENT 'ID para sincronización con SAE Movil',
  `CVE_UNIDAD` VARCHAR(4) NULL DEFAULT NULL COMMENT 'Clave de la unidad SAT',
  `CVE_ALT` VARCHAR(45) NULL COMMENT 'Clave alterna SKU',
  `CAMPLIB3` VARCHAR(100) NULL,
  `CAMPLIB4` VARCHAR(100) NULL,
  `CAMPLIB5` VARCHAR(100) NULL,
  `PRECIO6` VARCHAR(100) NULL,
  `CAMPO_LIBRE7` VARCHAR(100) NULL,
  `CAMPO_LIBRE8` VARCHAR(100) NULL,
  PRIMARY KEY (`idProducto`),
  UNIQUE INDEX `idProducto_UNIQUE` (`idProducto` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `core`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `core`.`usuario` (
  `idUsuario` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(50) NOT NULL COMMENT 'Nombre de usuario del sistema',
  `apellidos` VARCHAR(45) NOT NULL COMMENT 'Apellidos del usuario',
  `email` VARCHAR(255) NOT NULL COMMENT 'Email del usuario (preferentemente empresarial)',
  `password` VARCHAR(255) NOT NULL COMMENT 'Contraseña del usuario',
  `activo` TINYINT(4) NOT NULL DEFAULT 0 COMMENT 'Status del usuario (Activo o Archivado)',
  `creado` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP() COMMENT 'Fecha de creación del usuario',
  PRIMARY KEY (`idUsuario`),
  UNIQUE INDEX `idUsuario_UNIQUE` (`idUsuario` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = '	';


-- -----------------------------------------------------
-- Table `core`.`ordenesDeCompra`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `core`.`ordenesDeCompra` (
  `idOrdenesDeCompra` INT NOT NULL AUTO_INCREMENT,
  `folio_en_tienda` VARCHAR(45) NOT NULL COMMENT 'folio de nota en tienda',
  `productos` JSON NULL,
  `fecha` VARCHAR(30) NULL,
  `total` DOUBLE NULL,
  `link_orden` TEXT NOT NULL COMMENT 'Link directo a la orden',
  `monto` DOUBLE NOT NULL,
  `cantidad` INT NOT NULL,
  `descripcion_corta` VARCHAR(50) NOT NULL,
  `registrada` TINYINT NULL DEFAULT 0 COMMENT '¿Venta registrada en ASPEL? [0]: Si   [1]: No',
  `ventas_registardas_idVentasRegistradas` INT NOT NULL,
  PRIMARY KEY (`idOrdenesDeCompra`, `ventas_registardas_idVentasRegistradas`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `core`.`notificicaciones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `core`.`notificicaciones` (
  `idNotificicaciones` INT NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(40) NOT NULL,
  `descripcion` VARCHAR(60) NOT NULL,
  `tiempo` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(),
  `ordenesDeCompra_idordenesDeCompra` INT NOT NULL,
  PRIMARY KEY (`idNotificicaciones`),
  UNIQUE INDEX `idNotificicaciones_UNIQUE` (`idNotificicaciones` ASC) VISIBLE,
  INDEX `fk_notificicaciones_ordenesDeCompra1_idx` (`ordenesDeCompra_idordenesDeCompra` ASC) VISIBLE,
  CONSTRAINT `fk_notificicaciones_ordenesDeCompra1`
    FOREIGN KEY (`ordenesDeCompra_idordenesDeCompra`)
    REFERENCES `core`.`ordenesDeCompra` (`idOrdenesDeCompra`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `core`.`productos_publicados`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `core`.`productos_publicados` (
  `idProductoPublicado` INT NOT NULL AUTO_INCREMENT,
  `CVE_ART` VARCHAR(20) NOT NULL COMMENT 'Clave del articulo',
  `DESCR` VARCHAR(40) NULL DEFAULT NULL COMMENT 'Descripción',
  `EXIST` DOUBLE NULL DEFAULT NULL COMMENT 'Existencias {0.0 ..}',
  `LIN_PROD` VARCHAR(5) NULL DEFAULT NULL COMMENT 'Clave de línea',
  `UNI_MED` VARCHAR(10) NULL DEFAULT NULL COMMENT 'Unidad de entrada',
  `NUM_MON` INT(11) NULL DEFAULT NULL COMMENT 'Clave de moneda',
  `FCH_ULTCOM` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP() ON UPDATE CURRENT_TIMESTAMP() COMMENT 'Fecha de última compra',
  `ULT_COSTO` DOUBLE NULL DEFAULT NULL COMMENT 'Último costo {0.0 ..}',
  `CVE_IMAGEN` VARCHAR(16) NULL DEFAULT NULL COMMENT 'Nombre de la imagen',
  `UUID` VARCHAR(50) NULL DEFAULT NULL COMMENT 'ID para sincronización con SAE Movil',
  `CVE_UNIDAD` VARCHAR(4) NULL DEFAULT NULL COMMENT 'Clave de la unidad SAT',
  `CVE_ALT` VARCHAR(45) NULL COMMENT 'Clave alterna SKU',
  `CAMP_LIBRE1` VARCHAR(100) NULL,
  `CAMP_LIBRE2` VARCHAR(100) NULL,
  `CAMP_LIBRE3` VARCHAR(100) NULL,
  `CAMP_LIBRE4` VARCHAR(100) NULL,
  `CAMP_LIBRE5` VARCHAR(100) NULL,
  `CAMP_LIBRE6` VARCHAR(100) NULL,
  `CAMP_LIBRE7` VARCHAR(100) NULL,
  `PRECIO_VTA` DOUBLE NOT NULL COMMENT 'Precio de venta en SAP',
  `PRECIO_VTA_ML` DOUBLE NOT NULL COMMENT 'Precio de venta en mercado libre',
  `PRECIO_VTA_AMZ` DOUBLE NOT NULL COMMENT 'Precio de venta en AMAZON',
  `PRECIO_VTA_WWC` DOUBLE NOT NULL COMMENT 'Precio venta WooCommerce',
  `P_ML` TINYINT NULL DEFAULT 0 COMMENT 'Publicado en mercado libre? [0]: Si   [1]: No',
  `P_AMZ` TINYINT NULL DEFAULT 0 COMMENT 'Publicado en Amazon? [0]: Si   [1]: No',
  `P_WC` TINYINT NULL DEFAULT 0 COMMENT 'Publicado en wooCommerce? [0]: Si   [1]: No',
  `DESC_LARGA` TEXT NULL,
  `STATUS` VARCHAR(1) NULL DEFAULT NULL COMMENT 'Estatus [A/B] .: A=Activo, B=Baja',
  `COSTO_PROM` DOUBLE NULL DEFAULT NULL COMMENT 'Costo promedio {0.0 ..}',
  `STOCK_MIN` DOUBLE NULL DEFAULT NULL COMMENT 'Stock mínimo {0.0 .. }',
  `STOCK_MAX` DOUBLE NULL DEFAULT NULL COMMENT 'Stock máximo {0.0 ..}',
  `FCH_ULTVTA` DATETIME NOT NULL COMMENT 'Fecha de última venta',
  `TIPO_ELE` VARCHAR(1) NULL DEFAULT NULL COMMENT 'Tipo de elemento [P/K/G/S] .: P=Producto, K=Kits, G=Grupo, S=Servicio',
  `PESO` DOUBLE NULL DEFAULT NULL COMMENT 'Peso {0.0 ..}',
  `VOLUMEN` DOUBLE NULL DEFAULT NULL COMMENT 'Volumen {0.0..}',
  `BLK_CST_EXT` VARCHAR(1) NULL DEFAULT NULL COMMENT 'Bloqueado por costos-existencias. [S/N] .: S=Si, N=No',
  `LINK_A_TIENDA` TEXT NULL COMMENT 'URL de del producto en tienda',
  `F_CREACION` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP() COMMENT 'Fecha creación de la publicación',
  PRIMARY KEY (`idProductoPublicado`),
  UNIQUE INDEX `idProducto_UNIQUE` (`idProductoPublicado` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
