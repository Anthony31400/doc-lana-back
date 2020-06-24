-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema doclana_db
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema doclana_db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `doclana_db` DEFAULT CHARACTER SET utf8 ;
USE `doclana_db` ;

-- -----------------------------------------------------
-- Table `doclana_db`.`Patient`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `doclana_db`.`Patient` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(128) NULL,
  `prenom` VARCHAR(128) NULL,
  `email` VARCHAR(128) NULL,
  `telephone` VARCHAR(45) NULL,
  `adresse` VARCHAR(256) NULL,
  `code_postal` VARCHAR(5) NULL,
  `ville` VARCHAR(128) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `doclana_db`.`Medecin`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `doclana_db`.`Medecin` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(128) NULL,
  `prenom` VARCHAR(128) NULL,
  `specialite` VARCHAR(128) NULL,
  `adresse` VARCHAR(256) NULL,
  `code_postal` INT(5) NULL,
  `ville` VARCHAR(128) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `doclana_db`.`Medicament`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `doclana_db`.`Medicament` (
  `id` INT NOT NULL,
  `nom` VARCHAR(256) NULL,
  `forme` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `doclana_db`.`Traitement`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `doclana_db`.`Traitement` (
  `id` INT NOT NULL,
  `nom` VARCHAR(126) NULL,
  `date` VARCHAR(45) NULL,
  `Patient_id` INT NOT NULL,
  PRIMARY KEY (`id`, `Patient_id`),
  INDEX `fk_Traitement_Patient1_idx` (`Patient_id` ASC),
  CONSTRAINT `fk_Traitement_Patient1`
    FOREIGN KEY (`Patient_id`)
    REFERENCES `doclana_db`.`Patient` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `doclana_db`.`Fiche_medicament`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `doclana_db`.`Fiche_medicament` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `prise` MEDIUMTEXT NULL,
  `duree` MEDIUMTEXT NULL,
  `posologie` LONGTEXT NULL,
  `contre_indication` LONGTEXT NULL,
  `dosage` MEDIUMTEXT NULL,
  `type` TINYTEXT NULL,
  `Traitement_id` INT NOT NULL,
  `Traitement_Patient_id` INT NOT NULL,
  `Medicament_id` INT NOT NULL,
  PRIMARY KEY (`id`, `Traitement_id`, `Traitement_Patient_id`, `Medicament_id`),
  INDEX `fk_Fiche_medicament_Traitement1_idx` (`Traitement_id` ASC, `Traitement_Patient_id` ASC),
  INDEX `fk_Fiche_medicament_Medicament1_idx` (`Medicament_id` ASC),
  CONSTRAINT `fk_Fiche_medicament_Traitement1`
    FOREIGN KEY (`Traitement_id` , `Traitement_Patient_id`)
    REFERENCES `doclana_db`.`Traitement` (`id` , `Patient_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Fiche_medicament_Medicament1`
    FOREIGN KEY (`Medicament_id`)
    REFERENCES `doclana_db`.`Medicament` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `doclana_db`.`Message`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `doclana_db`.`Message` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `titre` VARCHAR(126) NULL,
  `date` VARCHAR(45) NULL,
  `contenu` LONGTEXT NULL,
  `destinataire` VARCHAR(45) NULL,
  `Patient_id` INT NULL,
  `Medecin_id` INT NULL,
  PRIMARY KEY (`id`, `Patient_id`, `Medecin_id`),
  INDEX `fk_Message_Patient1_idx` (`Patient_id` ASC),
  INDEX `fk_Message_Medecin1_idx` (`Medecin_id` ASC),
  CONSTRAINT `fk_Message_Patient1`
    FOREIGN KEY (`Patient_id`)
    REFERENCES `doclana_db`.`Patient` (`id`)
    ON DELETE SET NULL
    ON UPDATE SET NULL,
  CONSTRAINT `fk_Message_Medecin1`
    FOREIGN KEY (`Medecin_id`)
    REFERENCES `doclana_db`.`Medecin` (`id`)
    ON DELETE SET NULL
    ON UPDATE SET NULL)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `doclana_db`.`Maladie`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `doclana_db`.`Maladie` (
  `id` INT NOT NULL,
  `nom` VARCHAR(126) NULL,
  `type` VARCHAR(45) NULL,
  `dangerosite` TINYTEXT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `doclana_db`.`Patient_Medecin`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `doclana_db`.`Patient_Medecin` (
  `Patient_id` INT NOT NULL,
  `Medecin_id` INT NOT NULL,
  PRIMARY KEY (`Patient_id`, `Medecin_id`),
  INDEX `fk_Patient_has_Medecin_Patient_idx` (`Patient_id` ASC),
  INDEX `fk_Patient_has_Medecin_Medecin1_idx` (`Medecin_id` ASC),
  CONSTRAINT `fk_Patient_has_Medecin_Patient`
    FOREIGN KEY (`Patient_id`)
    REFERENCES `doclana_db`.`Patient` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Patient_has_Medecin_Medecin1`
    FOREIGN KEY (`Medecin_id`)
    REFERENCES `doclana_db`.`Medecin` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `doclana_db`.`Patient_has_Maladie`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `doclana_db`.`Patient_has_Maladie` (
  `Patient_id` INT NOT NULL,
  `Maladie_id` INT NOT NULL,
  PRIMARY KEY (`Patient_id`, `Maladie_id`),
  INDEX `fk_Patient_has_Maladie_Maladie1_idx` (`Maladie_id` ASC),
  INDEX `fk_Patient_has_Maladie_Patient1_idx` (`Patient_id` ASC),
  CONSTRAINT `fk_Patient_has_Maladie_Patient1`
    FOREIGN KEY (`Patient_id`)
    REFERENCES `doclana_db`.`Patient` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Patient_has_Maladie_Maladie1`
    FOREIGN KEY (`Maladie_id`)
    REFERENCES `doclana_db`.`Maladie` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
