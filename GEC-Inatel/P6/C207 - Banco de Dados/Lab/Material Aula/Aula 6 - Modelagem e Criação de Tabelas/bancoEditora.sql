-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema bancoAula6
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema bancoAula6
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `bancoAula6` DEFAULT CHARACTER SET utf8 ;
USE `bancoAula6` ;

-- -----------------------------------------------------
-- Table `bancoAula6`.`Pessoa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bancoAula6`.`Pessoa` (
  `cpf` VARCHAR(15) NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `idade` INT NULL,
  `altura` FLOAT NULL,
  PRIMARY KEY (`cpf`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bancoAula6`.`Editora`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bancoAula6`.`Editora` (
  `idEditora` INT auto_increment NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `contato` VARCHAR(45) NOT NULL,
  `endereco` VARCHAR(150) NOT NULL,
  PRIMARY KEY (`idEditora`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bancoAula6`.`Autor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bancoAula6`.`Autor` (
  `cpf` VARCHAR(15) NOT NULL,
  `nomeReal` VARCHAR(45),
  `nomeFalso` VARCHAR(45) NOT NULL,
  `endereco` VARCHAR(150) NULL,
  `Editora_idEditora` INT,
  PRIMARY KEY (`cpf`),
  INDEX `fk_Autor_Editora1_idx` (`Editora_idEditora` ASC) VISIBLE,
  CONSTRAINT `fk_Autor_Editora1`
    FOREIGN KEY (`Editora_idEditora`)
    REFERENCES `bancoAula6`.`Editora` (`idEditora`)
    ON DELETE set null
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bancoAula6`.`Livro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bancoAula6`.`Livro` (
  `idLivro` INT auto_increment NOT NULL,
  `titulo` VARCHAR(100) NOT NULL,
  `numPaginas` INT NOT NULL,
  `Autor_cpf` INT NOT NULL,
  PRIMARY KEY (`idLivro`),
  INDEX `fk_Livro_Autor1_idx` (`Autor_cpf` ASC) VISIBLE,
  CONSTRAINT `fk_Livro_Autor1`
    FOREIGN KEY (`Autor_cpf`)
    REFERENCES `bancoAula6`.`Autor` (`cpf`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bancoAula6`.`Dono`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bancoAula6`.`Dono` (
  `cpf` VARCHAR(15) NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `Editora_idEditora` INT NOT NULL,
  PRIMARY KEY (`cpf`),
  INDEX `fk_Dono_Editora1_idx` (`Editora_idEditora` ASC) VISIBLE,
  CONSTRAINT `fk_Dono_Editora1`
    FOREIGN KEY (`Editora_idEditora`)
    REFERENCES `bancoAula6`.`Editora` (`idEditora`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bancoAula6`.`PodeLer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bancoAula6`.`PodeLer` (
  `Livro_idLivro` INT NOT NULL,
  `Pessoa_cpf` VARCHAR(15) NOT NULL,
  `ano` INT NULL,
  `gostou` TINYINT NULL,
  PRIMARY KEY (`Livro_idLivro`, `Pessoa_cpf`),
  INDEX `fk_Livro_has_Pessoa_Pessoa1_idx` (`Pessoa_cpf` ASC) VISIBLE,
  INDEX `fk_Livro_has_Pessoa_Livro1_idx` (`Livro_idLivro` ASC) VISIBLE,
  CONSTRAINT `fk_Livro_has_Pessoa_Livro1`
    FOREIGN KEY (`Livro_idLivro`)
    REFERENCES `bancoAula6`.`Livro` (`idLivro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Livro_has_Pessoa_Pessoa1`
    FOREIGN KEY (`Pessoa_cpf`)
    REFERENCES `bancoAula6`.`Pessoa` (`cpf`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
