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
  `Member_id` VARCHAR(20) NOT NULL,
  `Member_pw` VARCHAR(20) NOT NULL,
  `Member_name` VARCHAR(10) NOT NULL,
  `Member_phone` CHAR(11) NOT NULL DEFAULT 0,
  `Member_mail_id` CHAR(20) NOT NULL DEFAULT 0,
  `Member_mail_addr` CHAR(20) NOT NULL DEFAULT 0,
  `Member_regdate` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Member_group` CHAR(10) NOT NULL DEFAULT '1',
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
  `Board_title` VARCHAR(45) NOT NULL,
  `Board_content` TEXT(100) NULL,
  `Board_hit` INT NOT NULL DEFAULT 0,
  `Board_regdate` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Board_editdate` DATETIME NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `B_Member_id` INT NOT NULL,
  PRIMARY KEY (`Board_id`),
  INDEX `Member_id_idx` (`B_Member_id` ASC) VISIBLE,
  CONSTRAINT `Member_id`
    FOREIGN KEY (`B_Member_id`)
    REFERENCES `BicycleDB`.`Member` (`Member_uid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
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
  `File_editdate` DATETIME NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `F_Member_id` INT NOT NULL,
  PRIMARY KEY (`File_id`),
  INDEX `Member_id_idx` (`F_Member_id` ASC) VISIBLE,
  INDEX `Board_id_idx` (`F_Board_id` ASC) VISIBLE,
  CONSTRAINT `F_Member_id`
    FOREIGN KEY (`F_Member_id`)
    REFERENCES `BicycleDB`.`Member` (`Member_uid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `F_Board_id`
    FOREIGN KEY (`F_Board_id`)
    REFERENCES `BicycleDB`.`Board` (`Board_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BicycleDB`.`Comment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BicycleDB`.`Comment` (
  `Comment_id` INT NOT NULL AUTO_INCREMENT,
  `Comment_name` VARCHAR(50) NOT NULL,
  `Comment_content` TEXT(50) NOT NULL,
  `Comment_regdate` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Comment_editdate` DATETIME NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `C_Member_id` INT NOT NULL,
  `C_Board_id` INT NOT NULL,
  PRIMARY KEY (`Comment_id`),
  INDEX `Member_id_idx` (`C_Member_id` ASC) VISIBLE,
  INDEX `Board_id_idx` (`C_Board_id` ASC) VISIBLE,
  CONSTRAINT `C_Member_id`
    FOREIGN KEY (`C_Member_id`)
    REFERENCES `BicycleDB`.`Member` (`Member_uid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `C_Board_id`
    FOREIGN KEY (`C_Board_id`)
    REFERENCES `BicycleDB`.`Board` (`Board_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
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
  `Market_state` CHAR(10) NOT NULL DEFAULT '거래가능',
  PRIMARY KEY (`Market_id`),
  INDEX `Board_id_idx` (`M_Board_id` ASC) VISIBLE,
  CONSTRAINT `M_Board_id`
    FOREIGN KEY (`M_Board_id`)
    REFERENCES `BicycleDB`.`Board` (`Board_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BicycleDB`.`Challege`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BicycleDB`.`Challege` (
  `Challenge_id` INT NOT NULL AUTO_INCREMENT,
  `Ch_Member_id` INT NOT NULL,
  `Challenge_dist` INT NOT NULL DEFAULT 0,
  `Challenge_Contents` VARCHAR(30) NOT NULL,
  `Challenge_regdate` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `admin_approval` TINYINT NOT NULL DEFAULT 0,
  PRIMARY KEY (`Challenge_id`),
  INDEX `Member_id_idx` (`Ch_Member_id` ASC) VISIBLE,
  CONSTRAINT `Ch_Member_id`
    FOREIGN KEY (`Ch_Member_id`)
    REFERENCES `BicycleDB`.`Member` (`Member_uid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

USE `BicycleDB` ;

-- -----------------------------------------------------
-- Placeholder table for view `BicycleDB`.`BoardC`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BicycleDB`.`BoardC` (`B_Member_id` INT, `Member_id` INT, `Member_phone` INT, `Category_small` INT, `Board_id` INT, `Board_title` INT, `Board_content` INT, `Board_editdate` INT, `Market_name` INT, `Market_price` INT, `Market_addr` INT, `Market_id` INT);

-- -----------------------------------------------------
-- View `BicycleDB`.`BoardC`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `BicycleDB`.`BoardC`;
USE `BicycleDB`;
CREATE  OR REPLACE VIEW `BoardC` AS Select b.B_Member_id,a.Member_id, a.Member_phone,
b.Category_small,b.Board_id,b.Board_title,b.Board_content,b.Board_editdate,
c.Market_name,c.Market_price,Market_addr, c.Market_id
From Member AS a, Board AS b, Market_Board AS c
where b.Category_big like '중고거래' AND b.Board_id = c.M_Board_id AND a.Member_uid = b.B_Member_id;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `BicycleDB`.`Member`
-- -----------------------------------------------------
START TRANSACTION;
USE `BicycleDB`;
INSERT INTO `BicycleDB`.`Member` (`Member_uid`, `Member_id`, `Member_pw`, `Member_name`, `Member_phone`, `Member_mail_id`, `Member_mail_addr`, `Member_regdate`, `Member_group`, `Member_regcount`, `Member_comcount`, `Member_ch_dist`) VALUES (1, 'admin', '1234', '관리자', '01011111111', 'test', 'test.com', '2021-07-01 19:21:36', '5', 0, 0, 0);
INSERT INTO `BicycleDB`.`Member` (`Member_uid`, `Member_id`, `Member_pw`, `Member_name`, `Member_phone`, `Member_mail_id`, `Member_mail_addr`, `Member_regdate`, `Member_group`, `Member_regcount`, `Member_comcount`, `Member_ch_dist`) VALUES (2, 'red', '1234', '김빨강', '01012343333', 'red', 'test.com', '2021-07-10 10:20:36', '1', 0, 0, 0);
INSERT INTO `BicycleDB`.`Member` (`Member_uid`, `Member_id`, `Member_pw`, `Member_name`, `Member_phone`, `Member_mail_id`, `Member_mail_addr`, `Member_regdate`, `Member_group`, `Member_regcount`, `Member_comcount`, `Member_ch_dist`) VALUES (3, 'blue', '1234', '이파랑', '01011113333', 'blue', 'test.com', '2021-07-10 20:20:36', '2', 0, 0, 0);
INSERT INTO `BicycleDB`.`Member` (`Member_uid`, `Member_id`, `Member_pw`, `Member_name`, `Member_phone`, `Member_mail_id`, `Member_mail_addr`, `Member_regdate`, `Member_group`, `Member_regcount`, `Member_comcount`, `Member_ch_dist`) VALUES (4, 'black', '1234', '박검정', '01022223333', 'black', 'test.com', '2021-07-11 14:13:00', '3', 0, 0, 0);
INSERT INTO `BicycleDB`.`Member` (`Member_uid`, `Member_id`, `Member_pw`, `Member_name`, `Member_phone`, `Member_mail_id`, `Member_mail_addr`, `Member_regdate`, `Member_group`, `Member_regcount`, `Member_comcount`, `Member_ch_dist`) VALUES (5, 'white', '1234', '최하양', '01099998888', 'white', 'test.com', '2021-07-12 09:21:12', '4', 0, 0, 0);
INSERT INTO `BicycleDB`.`Member` (`Member_uid`, `Member_id`, `Member_pw`, `Member_name`, `Member_phone`, `Member_mail_id`, `Member_mail_addr`, `Member_regdate`, `Member_group`, `Member_regcount`, `Member_comcount`, `Member_ch_dist`) VALUES (6, 'orange', '1234', '한주황', '01022221111', 'orange', 'test.com', '2021-07-01 19:21:36', '1', 0, 0, 0);
INSERT INTO `BicycleDB`.`Member` (`Member_uid`, `Member_id`, `Member_pw`, `Member_name`, `Member_phone`, `Member_mail_id`, `Member_mail_addr`, `Member_regdate`, `Member_group`, `Member_regcount`, `Member_comcount`, `Member_ch_dist`) VALUES (7, 'pink', '1234', '김분홍', '01012343333', 'pink', 'test.com', '2021-07-10 10:20:36', '2', 0, 0, 0);
INSERT INTO `BicycleDB`.`Member` (`Member_uid`, `Member_id`, `Member_pw`, `Member_name`, `Member_phone`, `Member_mail_id`, `Member_mail_addr`, `Member_regdate`, `Member_group`, `Member_regcount`, `Member_comcount`, `Member_ch_dist`) VALUES (8, 'purple', '1234', '윤보라', '01011113333', 'purple', 'test.com', '2021-07-10 20:20:36', '3', 0, 0, 0);
INSERT INTO `BicycleDB`.`Member` (`Member_uid`, `Member_id`, `Member_pw`, `Member_name`, `Member_phone`, `Member_mail_id`, `Member_mail_addr`, `Member_regdate`, `Member_group`, `Member_regcount`, `Member_comcount`, `Member_ch_dist`) VALUES (9, 'green', '1234', '유초록', '01022223333', 'green', 'test.com', '2021-07-11 14:13:00', '4', 0, 0, 0);
INSERT INTO `BicycleDB`.`Member` (`Member_uid`, `Member_id`, `Member_pw`, `Member_name`, `Member_phone`, `Member_mail_id`, `Member_mail_addr`, `Member_regdate`, `Member_group`, `Member_regcount`, `Member_comcount`, `Member_ch_dist`) VALUES (10, 'kdragon', '1234', '신용권', '01099998888', 'kdragon', 'test.com', '2021-07-12 09:21:12', '1', 0, 0, 0);

COMMIT;

