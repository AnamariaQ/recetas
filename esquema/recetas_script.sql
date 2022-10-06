-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema recetas_usuarios
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `recetas_usuarios` ;

-- -----------------------------------------------------
-- Schema recetas_usuarios
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `recetas_usuarios` DEFAULT CHARACTER SET utf8 ;
USE `recetas_usuarios` ;

-- -----------------------------------------------------
-- Table `recetas_usuarios`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `recetas_usuarios`.`users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `password` VARCHAR(255) NULL,
  `created_at` DATETIME NULL DEFAULT NOW(),
  `updated_at` DATETIME NULL DEFAULT NOW(),
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `recetas_usuarios`.`recipes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `recetas_usuarios`.`recipes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `under` VARCHAR(45) NULL,
  `description` TEXT NULL,
  `instruction` TEXT NULL,
  `created_at` DATETIME NULL,
  `updated_at` DATETIME NULL DEFAULT NOW(),
  `recipescol` VARCHAR(45) NULL DEFAULT 'NOW()',
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_recipes_users_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_recipes_users`
    FOREIGN KEY (`user_id`)
    REFERENCES `recetas_usuarios`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
