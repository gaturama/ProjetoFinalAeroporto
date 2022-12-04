-- MySQL Script generated by MySQL Workbench
-- Wed Nov 23 21:52:36 2022
-- Model: New Model    Version: 1.0
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
-- Table `mydb`.`Companhia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Companhia` (
  `id` INT NOT NULL,
  `nome` VARCHAR(255) NOT NULL,
  `cnpj` VARCHAR(14) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Aviao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Aviao` (
  `id` INT NOT NULL,
  `marca` VARCHAR(255) NOT NULL,
  `modelo` VARCHAR(255) NULL,
  `prefixo` VARCHAR(3) NULL,
  `capacidade` INT NULL,
  `id_companhia` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Aviao_Companhia1_idx` (`id_companhia` ASC),
  CONSTRAINT `fk_Aviao_Companhia1`
    FOREIGN KEY (`id_companhia`)
    REFERENCES `mydb`.`Companhia` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Hangar`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Hangar` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `local` VARCHAR(255) NOT NULL,
  `id_aviao` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Hangar_Aviao_idx` (`id_aviao` ASC),
  CONSTRAINT `fk_Hangar_Aviao`
    FOREIGN KEY (`id_aviao`)
    REFERENCES `mydb`.`Aviao` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`helicoptero`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`helicoptero` (
  `id` INT NOT NULL,
  `marca` VARCHAR(255) NOT NULL,
  `modelo` VARCHAR(255) NOT NULL,
  `cor` VARCHAR(255) NOT NULL,
  `capacidade` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Pista`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Pista` (
  `id` INT NOT NULL,
  `numero` VARCHAR(225) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Jato`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Jato` (
  `id` INT NOT NULL,
  `marca` VARCHAR(255) NOT NULL,
  `modelo` VARCHAR(255) NOT NULL,
  `cor` VARCHAR(255) NOT NULL,
  `velocidade` INT 
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Voo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Voo` (
  `id` INT NOT NULL,
  `numero` VARCHAR(255) NOT NULL,
  `data` VARCHAR(8) NOT NULL,
  `hora` VARCHAR(4) NOT NULL,
  `origem` VARCHAR(3) NOT NULL,
  `destino` VARCHAR(3) NOT NULL,
  `piloto` VARCHAR(255) NOT NULL,
  `copiloto` VARCHAR(255) NOT NULL,
  `observacao` VARCHAR(255) NOT NULL,
  `id_aviao` INT NOT NULL,
  `id_pista` INT NOT NULL,
  `id_jato` INT NOT NULL,
  `id_helicoptero` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Voo_Aviao1_idx` (`id_aviao` ASC),
  INDEX `fk_Voo_Pista1_idx` (`id_aviao` ASC),
  INDEX `fk_Voo_Jato1_idx` (`id_jato` ASC),
  INDEX `fk_Voo_helicoptero1_idx` (`id_helicoptero` ASC),
  CONSTRAINT `fk_Voo_Aviao1`
    FOREIGN KEY (`id_aviao`)
    REFERENCES `mydb`.`Aviao` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Voo_Pista1`
    FOREIGN KEY (`id_aviao`)
    REFERENCES `mydb`.`Pista` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Voo_Jato1`
    FOREIGN KEY (`id_jato`)
    REFERENCES `mydb`.`Jato` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Voo_helicoptero1`
    FOREIGN KEY (`id_helicoptero`)
    REFERENCES `mydb`.`helicoptero` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

INSERT INTO `mydb`.`Companhia`(id,nome,cnpj) VALUES (1, 'AeroParque', '78924615379'),
(2, 'Golazinho', '46898725410'),
(3, 'Voa', '89541032521'),
(4, 'AeroSpace' '22015433645'),
(5, 'Latinha' '78091426501');

INSERT INTO `mydb`.`Aviao`(id,marca,modelo,prefixo,capacidade,id_companhia) VALUES (1,'Volkswagen', 'Boing 778', 'PR', 'Quinhentas pessoas', 1),
(2,'Hyundai', 'Boing 640', 'PPC1010', 'Setessentas pessoas' 2),
(3,'Chevrolet', 'Boing 521', 'PMV2501', 'Duzentas pessoas' 3),
(4,'Ford', 'Boing 980', 'PNK1410', 'Quatrossentas pessoas' 4),
(5,'Fiat', 'Boing 210', 'PCZ3652', 'Trezentas pessoas' 5);

INSERT INTO `mydb`.`Hangar`(local,id_aviao) VALUES ('Hangar um', 3),
('Hangar dois', 5),
('Hangar três', 1),
('Hangar quatro', 2),
('Hangar cinco', 4);

INSERT INTO `mydb`.`Helicoptero`(id,marca,modelo,cor,capacidade,velocidade) VALUES (1,'Fiat', 'H202', 'Verde', 'Dez pessoas'),
(2,'Renault', 'H202', 'Preto', 'Oito pessoas', '3000km/h'),
(3,'BMW', 'H202', 'Azul', 'Cinco pessoas', '5000km/h'),
(4,'Ford', 'H202', 'Amarelo', 'Sete pessoas', '4500km/h'),
(5,'Chery', 'H202', 'Branco', 'Seis pessoas', '2000km/h');

INSERT INTO `mydb`.`Pista`(id,numero) VALUES (1,'L10'), (2,'L11'), (3,'L12'), (4,'13'), (5,'14');

INSERT INTO `mydb`.`Jato`(id,marca,modelo,cor) VALUES (1,'Ford', 'Falcon 5Z', 'Branco'),
(2,'Mercedez', 'Dragon 7T', 'Preto'),
(3,'Chevrolet', 'Lion G1', 'Azul'),
(4,'BMW', 'Gurila 10P', 'Amarelo'),
(5,'Lexus', 'Tiger 11TZ', 'Verde');

INSERT INTO `mydb`.`Voo`(id,numero,data,hora,origem,destino,piloto,copiloto,observacao,id_aviao,id_pista,id_jato,id_helicoptero)
VALUES (1,'AAA123456', '2010-12-18', '08:30', 'Minas Gerais', 'São Paulo', 'Jorge', 'Vardi', 'Viagem chuvosa', 4, 2, 3, )