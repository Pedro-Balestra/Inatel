-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`conta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`conta` (
  `idconta` INT NOT NULL,
  `usuario` VARCHAR(45) NOT NULL,
  `senha` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idconta`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`pessoa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`pessoa` (
  `idpessoa` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `idade` INT NULL,
  `altura` INT NULL,
  `celular` VARCHAR(45) NULL,
  `conta_idconta` INT NOT NULL,
  PRIMARY KEY (`idpessoa`),
  INDEX `fk_pessoa_conta_idx` (`conta_idconta` ASC) VISIBLE,
  CONSTRAINT `fk_pessoa_conta`
    FOREIGN KEY (`conta_idconta`)
    REFERENCES `mydb`.`conta` (`idconta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`pessoa_has_pessoa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`pessoa_has_pessoa` (
  `pessoa_idpessoa` INT NOT NULL,
  `pessoa_idpessoa1` INT NOT NULL,
  PRIMARY KEY (`pessoa_idpessoa`, `pessoa_idpessoa1`),
  INDEX `fk_pessoa_has_pessoa_pessoa2_idx` (`pessoa_idpessoa1` ASC) VISIBLE,
  INDEX `fk_pessoa_has_pessoa_pessoa1_idx` (`pessoa_idpessoa` ASC) VISIBLE,
  CONSTRAINT `fk_pessoa_has_pessoa_pessoa1`
    FOREIGN KEY (`pessoa_idpessoa`)
    REFERENCES `mydb`.`pessoa` (`idpessoa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pessoa_has_pessoa_pessoa2`
    FOREIGN KEY (`pessoa_idpessoa1`)
    REFERENCES `mydb`.`pessoa` (`idpessoa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
