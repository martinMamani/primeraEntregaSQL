-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema DBAlmacen
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema DBAlmacen
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `DBAlmacen` DEFAULT CHARACTER SET utf8 ;
USE `DBAlmacen` ;

-- -----------------------------------------------------
-- Table `DBAlmacen`.`Almacen`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DBAlmacen`.`Almacen` (
  `idAlmacen` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `propietario` VARCHAR(45) NOT NULL,
  `domicilio` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`idAlmacen`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DBAlmacen`.`Producto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DBAlmacen`.`Producto` (
  `idProducto` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `descripcion` VARCHAR(100) NOT NULL,
  `peso` VARCHAR(45) NULL,
  `marca` VARCHAR(45) NOT NULL,
  `precio` FLOAT NOT NULL,
  PRIMARY KEY (`idProducto`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DBAlmacen`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DBAlmacen`.`Cliente` (
  `idCliente` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido` VARCHAR(45) NOT NULL,
  `dni` VARCHAR(8) NOT NULL,
  `domicilio` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idCliente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DBAlmacen`.`Distribuidor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DBAlmacen`.`Distribuidor` (
  `idDistribuidor` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `domicilio` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`idDistribuidor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DBAlmacen`.`Empleado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DBAlmacen`.`Empleado` (
  `idEmpleado` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido` VARCHAR(45) NOT NULL,
  `dni` VARCHAR(8) NOT NULL,
  `domicilio` VARCHAR(100) NOT NULL,
  `salario` FLOAT NOT NULL,
  `puesto` VARCHAR(45) NOT NULL,
  `idAlmacen` INT NOT NULL,
  PRIMARY KEY (`idEmpleado`),
  INDEX `idAlmacen_idx` (`idAlmacen` ASC) VISIBLE,
  CONSTRAINT `idAlmacen`
    FOREIGN KEY (`idAlmacen`)
    REFERENCES `DBAlmacen`.`Almacen` (`idAlmacen`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DBAlmacen`.`OrdenDeCompra`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DBAlmacen`.`OrdenDeCompra` (
  `idOrdenDeCompra` INT NOT NULL AUTO_INCREMENT,
  `idCliente` INT NOT NULL,
  `idProducto` INT NOT NULL,
  PRIMARY KEY (`idOrdenDeCompra`),
  INDEX `idCliente_idx` (`idCliente` ASC) VISIBLE,
  INDEX `idProducto_idx` (`idProducto` ASC) VISIBLE,
  CONSTRAINT `idCliente`
    FOREIGN KEY (`idCliente`)
    REFERENCES `DBAlmacen`.`Cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idProducto`
    FOREIGN KEY (`idProducto`)
    REFERENCES `DBAlmacen`.`Producto` (`idProducto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DBAlmacen`.`Proveedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DBAlmacen`.`Proveedor` (
  `idProveedor` INT NOT NULL AUTO_INCREMENT,
  `idAlmacen` INT NOT NULL,
  `idDistribuidor` INT NOT NULL,
  PRIMARY KEY (`idProveedor`),
  INDEX `id_Almacen_idx` (`idAlmacen` ASC) VISIBLE,
  INDEX `id_Distribuidor_idx` (`idDistribuidor` ASC) VISIBLE,
  CONSTRAINT `id_Almacen`
    FOREIGN KEY (`idAlmacen`)
    REFERENCES `DBAlmacen`.`Almacen` (`idAlmacen`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_Distribuidor`
    FOREIGN KEY (`idDistribuidor`)
    REFERENCES `DBAlmacen`.`Distribuidor` (`idDistribuidor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DBAlmacen`.`Categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DBAlmacen`.`Categoria` (
  `idCategoria` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `tipo` VARCHAR(45) NOT NULL,
  `idProducto` INT NOT NULL,
  PRIMARY KEY (`idCategoria`),
  INDEX `id_producto_idx` (`idProducto` ASC) VISIBLE,
  CONSTRAINT `id_producto`
    FOREIGN KEY (`idProducto`)
    REFERENCES `DBAlmacen`.`Producto` (`idProducto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
