-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema bancoAula7
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema bancoAula7
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `bancoAula7` DEFAULT CHARACTER SET utf8 ;
USE `bancoAula7` ;

-- -----------------------------------------------------
-- Table `bancoAula7`.`Endereço`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bancoAula7`.`Endereço` (
  `id` INT NOT NULL,
  `bairro` VARCHAR(45) NULL,
  `estado` VARCHAR(10) NULL,
  `pais` VARCHAR(10) NULL,
  `rua` VARCHAR(45) NULL,
  `numero` INT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bancoAula7`.`Clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bancoAula7`.`Clientes` (
  `cpf` VARCHAR(12) NOT NULL,
  `nome` VARCHAR(45) NULL,
  `telefone` INT NULL,
  `idade` INT NULL,
  `dataNascimento` VARCHAR(10) NULL,
  `Endereço_id` INT NOT NULL,
  PRIMARY KEY (`cpf`),
  INDEX `fk_Clientes_Endereço_idx` (`Endereço_id` ASC) VISIBLE,
  CONSTRAINT `fk_Clientes_Endereço`
    FOREIGN KEY (`Endereço_id`)
    REFERENCES `bancoAula7`.`Endereço` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bancoAula7`.`Aparelho`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bancoAula7`.`Aparelho` (
  `codigoIdentificação` VARCHAR(10) NOT NULL,
  `modelo` VARCHAR(45) NULL,
  `anoDeFabricação` INT NULL,
  `memoriaRam` VARCHAR(5) NULL,
  `memoria` VARCHAR(5) NULL,
  `preço` FLOAT NULL,
  `Clientes_cpf` VARCHAR(12) NOT NULL,
  PRIMARY KEY (`codigoIdentificação`),
  INDEX `fk_Aparelho_Clientes1_idx` (`Clientes_cpf` ASC) VISIBLE,
  CONSTRAINT `fk_Aparelho_Clientes1`
    FOREIGN KEY (`Clientes_cpf`)
    REFERENCES `bancoAula7`.`Clientes` (`cpf`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bancoAula7`.`App`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bancoAula7`.`App` (
  `identificador` INT NOT NULL,
  `nome` VARCHAR(45) NULL,
  `função` VARCHAR(45) NULL,
  PRIMARY KEY (`identificador`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bancoAula7`.`Aparelho_has_App`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bancoAula7`.`Aparelho_has_App` (
  `Aparelho_codigoIdentificação` VARCHAR(10) NOT NULL,
  `App_identificador` INT NOT NULL,
  `versãoBaixada` VARCHAR(45) NULL,
  `horarioDownload` VARCHAR(10) NULL,
  PRIMARY KEY (`Aparelho_codigoIdentificação`, `App_identificador`),
  INDEX `fk_Aparelho_has_App_App1_idx` (`App_identificador` ASC) VISIBLE,
  INDEX `fk_Aparelho_has_App_Aparelho1_idx` (`Aparelho_codigoIdentificação` ASC) VISIBLE,
  CONSTRAINT `fk_Aparelho_has_App_Aparelho1`
    FOREIGN KEY (`Aparelho_codigoIdentificação`)
    REFERENCES `bancoAula7`.`Aparelho` (`codigoIdentificação`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Aparelho_has_App_App1`
    FOREIGN KEY (`App_identificador`)
    REFERENCES `bancoAula7`.`App` (`identificador`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bancoAula7`.`Aparelho_has_Aparelho`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bancoAula7`.`Aparelho_has_Aparelho` (
  `Aparelho_codigoIdentificação` VARCHAR(10) NOT NULL,
  `Aparelho_codigoIdentificação1` VARCHAR(10) NOT NULL,
  `conexão` VARCHAR(10) NULL,
  PRIMARY KEY (`Aparelho_codigoIdentificação`, `Aparelho_codigoIdentificação1`),
  INDEX `fk_Aparelho_has_Aparelho_Aparelho2_idx` (`Aparelho_codigoIdentificação1` ASC) VISIBLE,
  INDEX `fk_Aparelho_has_Aparelho_Aparelho1_idx` (`Aparelho_codigoIdentificação` ASC) VISIBLE,
  CONSTRAINT `fk_Aparelho_has_Aparelho_Aparelho1`
    FOREIGN KEY (`Aparelho_codigoIdentificação`)
    REFERENCES `bancoAula7`.`Aparelho` (`codigoIdentificação`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Aparelho_has_Aparelho_Aparelho2`
    FOREIGN KEY (`Aparelho_codigoIdentificação1`)
    REFERENCES `bancoAula7`.`Aparelho` (`codigoIdentificação`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
