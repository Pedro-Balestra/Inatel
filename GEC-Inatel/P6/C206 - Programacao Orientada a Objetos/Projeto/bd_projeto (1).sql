DROP DATABASE IF EXISTS RE4;
CREATE DATABASE RE4;
USE RE4;

-- -----------------------------------------------------
-- Criando Tabela "Merchant"
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS Merchant(
   idMerchant INT NOT NULL,
   items INT NOT NULL,
   PRIMARY KEY (`idMerchant`)
);

-- -----------------------------------------------------
-- Criando Tabela "Player"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Player (
  idPlayer INT NOT NULL,
  namePlayer VARCHAR(45) NOT NULL,
  life DOUBLE NOT NULL,
  pasetas DOUBLE NOT NULL,
  inventory INT NOT NULL,
  Merchant_idMerchant INT NOT NULL,
  PRIMARY KEY (idPlayer),
  CONSTRAINT fk_Player_Merchant1
    FOREIGN KEY (Merchant_idMerchant)
    REFERENCES Merchant (idMerchant)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Criando Tabela "Item"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Item(
  idItem INT NOT NULL,
  valueItem DOUBLE NOT NULL,
  typeItem VARCHAR(45) NOT NULL,
  nameItem VARCHAR(45) NOT NULL,
  idMerchant INT NOT NULL,
  PRIMARY KEY (idItem),
  CONSTRAINT fk_Item_Merchant1
    FOREIGN KEY (idMerchant)
    REFERENCES Merchant (idMerchant)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Criando Tabela "Treasure"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Treasure (
  idTreasures INT NOT NULL,
  nameTreasure VARCHAR(45) NOT NULL,
  valueTreasure DOUBLE NOT NULL,
  idItem INT NOT NULL,
  PRIMARY KEY (idTreasures),
  CONSTRAINT fk_Treasures_Item1
    FOREIGN KEY (idItem)
    REFERENCES Item (idItem)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- -----------------------------------------------------
-- Criando Tabela "Heal"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Heal` (
  `idHeal` INT NOT NULL,
  `type` VARCHAR(45) NOT NULL,
  `effect` VARCHAR(45) NOT NULL,
  `Item_idItem` INT NOT NULL,
  PRIMARY KEY (`idHeal`),
  INDEX `fk_Heal_Item1_idx` (`Item_idItem` ASC) VISIBLE,
  CONSTRAINT `fk_Heal_Item1`
    FOREIGN KEY (`Item_idItem`)
    REFERENCES `mydb`.`Item` (`idItem`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)



-- -----------------------------------------------------
-- Criando Tabela "Granade"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Granade` (
  `idGranade` INT NOT NULL,
  `tyoe` VARCHAR(45) NOT NULL,
  `range` DOUBLE NOT NULL,
  `explosion_power` DOUBLE NOT NULL,
  `color` VARCHAR(15) NOT NULL,
  `Item_idItem` INT NOT NULL,
  PRIMARY KEY (`idGranade`),
  INDEX `fk_Granade_Item_idx` (`Item_idItem` ASC) VISIBLE,
  CONSTRAINT `fk_Granade_Item`
    FOREIGN KEY (`Item_idItem`)
    REFERENCES `mydb`.`Item` (`idItem`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)



-- -----------------------------------------------------
-- Criando Tabela "Ammo"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Ammo` (
  `idAmmo` INT NOT NULL,
  `type` VARCHAR(45) NOT NULL,
  `quantity` INT NOT NULL,
  PRIMARY KEY (`idAmmo`))



-- -----------------------------------------------------
-- Criando Tabela "Gun"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Gun` (
  `idGun` INT NOT NULL,
  `fire_power` DOUBLE NOT NULL,
  `firing_speed` DOUBLE NOT NULL,
  `reload_speed` DOUBLE NOT NULL,
  `capacity` INT NOT NULL,
  `range` INT NOT NULL,
  `explosion` TINYINT NOT NULL,
  `Guncol` VARCHAR(45) NOT NULL,
  `Item_idItem` INT NOT NULL,
  `Ammo_idAmmo` INT NOT NULL,
  PRIMARY KEY (`idGun`),
  INDEX `fk_Gun_Item1_idx` (`Item_idItem` ASC) VISIBLE,
  INDEX `fk_Gun_Ammo1_idx` (`Ammo_idAmmo` ASC) VISIBLE,
  CONSTRAINT `fk_Gun_Item1`
    FOREIGN KEY (`Item_idItem`)
    REFERENCES `mydb`.`Item` (`idItem`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Gun_Ammo1`
    FOREIGN KEY (`Ammo_idAmmo`)
    REFERENCES `mydb`.`Ammo` (`idAmmo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)


-- -----------------------------------------------------
-- Criando Tabela "Belong"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Belong` (
  `Player_idPlayer` INT NOT NULL,
  `Item_idItem` INT NOT NULL,
  PRIMARY KEY (`Player_idPlayer`, `Item_idItem`),
  CONSTRAINT `fk_Player_has_Item_Player1`
    FOREIGN KEY (`Player_idPlayer`)
    REFERENCES `mydb`.`Player` (`idPlayer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Player_has_Item_Item1`
    FOREIGN KEY (`Item_idItem`)
    REFERENCES `mydb`.`Item` (`idItem`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)


