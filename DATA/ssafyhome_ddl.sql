-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema ssafyhome
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema ssafyhome
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ssafyhome` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `ssafyhome` ;

-- -----------------------------------------------------
-- Table `ssafyhome`.`board`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ssafyhome`.`board` (
  `board_id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(100) NOT NULL,
  `contents` VARCHAR(10000) NULL DEFAULT NULL,
  `user_id` VARCHAR(20) NULL DEFAULT NULL,
  `time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `viewCnt` INT NOT NULL DEFAULT '0',
  PRIMARY KEY (`board_id`),
  INDEX `board_ibfk_1` (`user_id` ASC) VISIBLE,
  CONSTRAINT `board_ibfk_1`
    FOREIGN KEY (`user_id`)
    REFERENCES `ssafyhome`.`members` (`user_id`)
    ON DELETE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

-- -----------------------------------------------------
-- Table `ssafyhome`.`comment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ssafyhome`.`comment` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `content` VARCHAR(2000) NULL DEFAULT NULL,
  `board_id` INT NULL DEFAULT NULL,
  `user_id` VARCHAR(20) NULL DEFAULT NULL,
  `time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  CONSTRAINT `comment_ibfk_1`
    FOREIGN KEY (`user_id`)
    REFERENCES `ssafyhome`.`members` (`user_id`)
    ON DELETE CASCADE,
    CONSTRAINT `comment_ibfk_2`
    FOREIGN KEY (`board_id`)
    REFERENCES `ssafyhome`.`board` (`board_id`)
    ON DELETE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `ssafyhome`.`sigungucode`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ssafyhome`.`sigungucode` (
  `dongCode` VARCHAR(10) PRIMARY KEY,
  `sidoName` VARCHAR(30) NULL DEFAULT NULL,
  `gugunName` VARCHAR(30) NULL DEFAULT NULL,
  `dongName` VARCHAR(30) NULL DEFAULT NULL,
  `lat` VARCHAR(30) NULL DEFAULT NULL,
  `lng` VARCHAR(30) NULL DEFAULT NULL)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `ssafyhome`.`houseinfo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ssafyhome`.`houseinfo` (
  `aptCode` BIGINT NOT NULL,
  `buildYear` INT NULL DEFAULT NULL,
  `roadName` VARCHAR(40) NULL DEFAULT NULL,
  `roadNameBonbun` VARCHAR(5) NULL DEFAULT NULL,
  `roadNameBubun` VARCHAR(5) NULL DEFAULT NULL,
  `roadNameSeq` VARCHAR(2) NULL DEFAULT NULL,
  `roadNameBasementCode` VARCHAR(1) NULL DEFAULT NULL,
  `roadNameCode` VARCHAR(7) NULL DEFAULT NULL,
  `dong` VARCHAR(40) NULL DEFAULT NULL,
  `bonbun` VARCHAR(4) NULL DEFAULT NULL,
  `bubun` VARCHAR(4) NULL DEFAULT NULL,
  `sigunguCode` VARCHAR(5) NULL DEFAULT NULL,
  `eubmyundongCode` VARCHAR(5) NULL DEFAULT NULL,
  `dongCode` VARCHAR(10) NULL DEFAULT NULL,
  `landCode` VARCHAR(1) NULL DEFAULT NULL,
  `apartmentName` VARCHAR(40) NULL DEFAULT NULL,
  `jibun` VARCHAR(10) NULL DEFAULT NULL,
  `lng` VARCHAR(30) NULL DEFAULT NULL,
  `lat` VARCHAR(30) NULL DEFAULT NULL,
  PRIMARY KEY (`aptCode`),
  UNIQUE INDEX `UNIQUE` (`buildYear` ASC, `apartmentName` ASC, `jibun` ASC, `sigunguCode` ASC, `eubmyundongCode` ASC) INVISIBLE,
  INDEX `dongCode_idx` (`dongCode` ASC) VISIBLE,
  CONSTRAINT `dongCode`
    FOREIGN KEY (`dongCode`)
    REFERENCES `ssafyhome`.`sigungucode` (`dongCode`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `ssafyhome`.`home_likes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ssafyhome`.`home_likes` (
  `like_id` INT NOT NULL AUTO_INCREMENT,
  `user_id` VARCHAR(20) NOT NULL,
  `aptCode` BIGINT NOT NULL,
  PRIMARY KEY (`like_id`),
  INDEX `home_likes_ibfk_1` (`user_id` ASC) VISIBLE,
  INDEX `home_likes_ibfk_2_idx` (`aptCode` ASC) VISIBLE,
  CONSTRAINT `home_likes_ibfk_1`
    FOREIGN KEY (`user_id`)
    REFERENCES `ssafyhome`.`members` (`user_id`)
    ON DELETE CASCADE,
  CONSTRAINT `home_likes_ibfk_2`
    FOREIGN KEY (`aptCode`)
    REFERENCES `ssafyhome`.`houseinfo` (`aptCode`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `ssafyhome`.`housedeal`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ssafyhome`.`housedeal` (
  `no` BIGINT NOT NULL,
  `dealAmount` VARCHAR(20) NULL DEFAULT NULL,
  `dealYear` INT NULL DEFAULT NULL,
  `dealMonth` INT NULL DEFAULT NULL,
  `dealDay` INT NULL DEFAULT NULL,
  `area` VARCHAR(20) NULL DEFAULT NULL,
  `floor` VARCHAR(4) NULL DEFAULT NULL,
  `cancelDealType` VARCHAR(1) NULL DEFAULT NULL,
  `aptCode` BIGINT NULL DEFAULT NULL,
  PRIMARY KEY (`no`),
  INDEX `housedeal_aptCode_houseinfo_aptCode_fk_idx` (`aptCode` ASC) VISIBLE,
  CONSTRAINT `housedeal_aptCode_houseinfo_aptCode_fk`
    FOREIGN KEY (`aptCode`)
    REFERENCES `ssafyhome`.`houseinfo` (`aptCode`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `ssafyhome`.`notices`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ssafyhome`.`notices` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(100) NOT NULL,
  `contents` VARCHAR(10000) NULL DEFAULT NULL,
  `reg_id` VARCHAR(20) NOT NULL,
  `reg_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  INDEX `notices_ibfk_1` (`reg_id` ASC) VISIBLE,
  CONSTRAINT `notices_ibfk_1`
    FOREIGN KEY (`reg_id`)
    REFERENCES `ssafyhome`.`members` (`user_id`)
    ON DELETE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `ssafyhome`.`school`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ssafyhome`.`school` (
  `school_id` VARCHAR(20) NOT NULL,
  `school_name` VARCHAR(50) NULL DEFAULT NULL,
  `school_level` VARCHAR(5) NULL DEFAULT NULL,
  `est_date` VARCHAR(10) NULL DEFAULT NULL,
  `est_type` VARCHAR(5) NULL DEFAULT NULL,
  `main_or_branch` VARCHAR(5) NULL DEFAULT NULL,
  `status` VARCHAR(5) NULL DEFAULT NULL,
  `jibun_address` VARCHAR(100) NULL DEFAULT NULL,
  `road_address` VARCHAR(100) NULL DEFAULT NULL,
  `edu_office_code` VARCHAR(30) NULL DEFAULT NULL,
  `edu_office_name` VARCHAR(30) NULL DEFAULT NULL,
  `latitude` VARCHAR(20) NULL DEFAULT NULL,
  `longitude` VARCHAR(20) NULL DEFAULT NULL,
  PRIMARY KEY (`school_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

-- -----------------------------------------------------
-- Table `ssafyhome`.`files`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ssafyhome`.`files` (
  `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `file_name` VARCHAR(100) NULL,
  `path` VARCHAR(100) NULL
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

-- -----------------------------------------------------
-- Table `ssafyhome`.`members`
-- -----------------------------------------------------
SET foreign_key_checks = 0;
DROP TABLE IF EXISTS `members`;
SET foreign_key_checks = 1;
CREATE TABLE IF NOT EXISTS `ssafyhome`.`members` (
  `user_id` VARCHAR(20) NOT NULL,
  `user_password` VARCHAR(300) NOT NULL,
  `user_email` VARCHAR(45) NULL DEFAULT NULL,
  `user_name` VARCHAR(20) NOT NULL,
  `user_mobile` VARCHAR(11) NOT NULL,
  `user_address` VARCHAR(50) NOT NULL,
  `join_date` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `role` VARCHAR(10) DEFAULT 'user',
  `token` VARCHAR(1000) NULL DEFAULT NULL,
    `reset_token` VARCHAR(1000) NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `ssafyhome`.`review`;

-- -----------------------------------------------------
-- Table `ssafyhome`.`review`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `ssafyhome`.`review` (
  `reviewCode` int AUTO_INCREMENT PRIMARY KEY,
  `aptCode` BIGINT NOT NULL,
  `reviewText` varchar(1000) not NULL,
  `user_id` varchar(30) not null,
  `time` datetime default current_timestamp,
  CONSTRAINT `aptCode`
    FOREIGN KEY (`aptCode`)
    REFERENCES `ssafyhome`.`houseinfo` (`aptCode`),
CONSTRAINT `user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `ssafyhome`.`members` (`user_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
