-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema BicycleDB
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema BicycleDB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `BicycleDB` DEFAULT CHARACTER SET utf8 ;
USE `BicycleDB` ;

-- -----------------------------------------------------
-- Table `BicycleDB`.`Member`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BicycleDB`.`Member` (
  `Member_uid` INT NOT NULL AUTO_INCREMENT,
  `Member_id` VARCHAR(10) NOT NULL UNIQUE,
  `Member_pw` VARCHAR(20) NOT NULL,
  `Member_name` VARCHAR(10) NOT NULL,
  `Member_phone` INT NOT NULL DEFAULT 0,
  `Member_mail_id` CHAR(20) NOT NULL DEFAULT 0,
  `Member_mail_addr` CHAR(20) NOT NULL DEFAULT 0,
  `Member_regdate` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Member_group` CHAR(10) NOT NULL DEFAULT 0,
  `Member_regcount` INT NOT NULL DEFAULT 0,
  `Member_comcount` INT NOT NULL DEFAULT 0,
  `Member_ch_dist` INT NOT NULL DEFAULT 0,
  PRIMARY KEY (`Member_uid`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BicycleDB`.`Board`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BicycleDB`.`Board` (
  `Board_id` INT NOT NULL AUTO_INCREMENT,
  `Category_big` VARCHAR(45) NOT NULL,
  `Category_small` VARCHAR(45) NOT NULL,
  `Board_writer` VARCHAR(10) NOT NULL,
  `Board_content` TEXT(100) NULL,
  `Board_hit` INT NOT NULL DEFAULT 0,
  `Board_regdate` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Board_editdate` DATETIME NULL,
  `B_Member_id` INT NOT NULL,
  `Board_title` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Board_id`),
  INDEX `Member_id_idx` (`B_Member_id` ASC) VISIBLE,
  CONSTRAINT `Member_id`
    FOREIGN KEY (`B_Member_id`)
    REFERENCES `BicycleDB`.`Member` (`Member_uid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BicycleDB`.`Add_File`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BicycleDB`.`Add_File` (
  `File_id` INT NOT NULL AUTO_INCREMENT,
  `File_name` VARCHAR(255) NOT NULL,
  `File_size` INT NOT NULL,
  `File_dir` VARCHAR(255) NOT NULL,
  `File_contenttype` VARCHAR(50) NOT NULL,
  `F_Board_id` INT NOT NULL,
  `File_regdate` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `File_editdate` DATETIME NULL,
  `F_Member_id` INT NOT NULL,
  PRIMARY KEY (`File_id`),
  INDEX `Member_id_idx` (`F_Member_id` ASC) VISIBLE,
  INDEX `Board_id_idx` (`F_Board_id` ASC) VISIBLE,
  CONSTRAINT `F_Member_id`
    FOREIGN KEY (`F_Member_id`)
    REFERENCES `BicycleDB`.`Member` (`Member_uid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `F_Board_id`
    FOREIGN KEY (`F_Board_id`)
    REFERENCES `BicycleDB`.`Board` (`Board_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BicycleDB`.`Comment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BicycleDB`.`Comment` (
  `Comment_id` INT NOT NULL AUTO_INCREMENT,
  `Comment_name` VARCHAR(50) NOT NULL,
  `Comment_content` TEXT(50) NOT NULL,
  `Comment_regdate` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Comment_editdate` DATETIME NULL,
  `C_Member_id` INT NOT NULL,
  `C_Board_id` INT NOT NULL,
  PRIMARY KEY (`Comment_id`),
  INDEX `Member_id_idx` (`C_Member_id` ASC) VISIBLE,
  INDEX `Board_id_idx` (`C_Board_id` ASC) VISIBLE,
  CONSTRAINT `C_Member_id`
    FOREIGN KEY (`C_Member_id`)
    REFERENCES `BicycleDB`.`Member` (`Member_uid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `C_Board_id`
    FOREIGN KEY (`C_Board_id`)
    REFERENCES `BicycleDB`.`Board` (`Board_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BicycleDB`.`Market_Board`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BicycleDB`.`Market_Board` (
  `Market_id` INT NOT NULL AUTO_INCREMENT,
  `M_Board_id` INT NOT NULL,
  `Market_name` CHAR(10) NOT NULL,
  `Market_price` INT NOT NULL,
  `Market_addr` CHAR(10) NOT NULL DEFAULT '-',
  PRIMARY KEY (`Market_id`),
  INDEX `Board_id_idx` (`M_Board_id` ASC) VISIBLE,
  CONSTRAINT `M_Board_id`
    FOREIGN KEY (`M_Board_id`)
    REFERENCES `BicycleDB`.`Board` (`Board_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BicycleDB`.`Challege`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BicycleDB`.`Challege` (
  `Challenge_id` INT NOT NULL AUTO_INCREMENT,
  `Ch_Member_id` INT NOT NULL,
  `Challenge_dist` INT NOT NULL DEFAULT 0,
  PRIMARY KEY (`Challenge_id`),
  INDEX `Member_id_idx` (`Ch_Member_id` ASC) VISIBLE,
  CONSTRAINT `Ch_Member_id`
    FOREIGN KEY (`Ch_Member_id`)
    REFERENCES `BicycleDB`.`Member` (`Member_uid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `BicycleDB` ;

-- -----------------------------------------------------
-- Placeholder table for view `BicycleDB`.`BoardC`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BicycleDB`.`BoardC` (`Member_id` INT, `Member_phone` INT, `Category_small` INT, `Board_id` INT, `Board_title` INT, `Board_content` INT, `Board_regdate` INT, `Market_name` INT, `Martket_price` INT, `Market_addr` INT);

-- -----------------------------------------------------
-- View `BicycleDB`.`BoardC`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `BicycleDB`.`BoardC`;
USE `BicycleDB`;
CREATE  OR REPLACE VIEW `BoardC` AS Select a.Member_id, a.Member_phone,
b.Category_small,b.Board_id,b.Board_title,b.Board_content,b.Board_regdate,
c.Market_name,c.Market_price,Market_addr
From Member AS a, Board AS b, Market_Board AS c
where b.Category_big like '중고거래';



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

create user 'bicycleDBAdmin'@'%' IDENTIFIED BY '1234';
grant all privileges on bicycledb.* to 'bicycleDBAdmin' with grant option;

/*  데이터 추가   */
use bicycledb;
select * from member;
insert into member (Member_id, Member_pw, Member_name) values ('admin', 1234, '관리자');
 

