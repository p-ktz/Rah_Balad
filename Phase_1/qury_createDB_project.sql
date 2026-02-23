-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema travel_tickets_DB
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema travel_tickets_DB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `travel_tickets_DB` DEFAULT CHARACTER SET utf8 ;
USE `travel_tickets_DB` ;

-- -----------------------------------------------------
-- Table `travel_tickets_DB`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `travel_tickets_DB`.`users` (
  `user_id` INT NOT NULL,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `registeration_date` DATETIME NOT NULL,
  `account_status` VARCHAR(45) NULL DEFAULT 'active',
  `user_role` VARCHAR(45) NULL DEFAULT 'norrmal user',
  `user_profile_picture` BLOB NULL DEFAULT NULL,
  `address` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE INDEX `user_id_UNIQUE` (`user_id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `travel_tickets_DB`.`travel_status`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `travel_tickets_DB`.`travel_status` (
  `travel_status_code` TINYINT NOT NULL,
  `status` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`travel_status_code`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `travel_tickets_DB`.`travel_class`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `travel_tickets_DB`.`travel_class` (
  `travel_class_code` TINYINT NOT NULL,
  `class_type` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`travel_class_code`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `travel_tickets_DB`.`vehicle`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `travel_tickets_DB`.`vehicle` (
  `vehicle_id` INT NOT NULL,
  `capacity` SMALLINT NOT NULL,
  PRIMARY KEY (`vehicle_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `travel_tickets_DB`.`travel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `travel_tickets_DB`.`travel` (
  `travel_id` INT NOT NULL,
  `vehicle_id` INT NOT NULL,
  `price` DOUBLE NOT NULL,
  `remaining_capacity` SMALLINT NOT NULL,
  `round_trip` INT NULL DEFAULT NULL,
  `transportation_company_id` INT NULL DEFAULT NULL,
  `travel_class` TINYINT NOT NULL,
  `travel_status` TINYINT NOT NULL,
  PRIMARY KEY (`travel_id`),
  INDEX `fk_travel_travel_status1_idx` (`travel_status` ASC) VISIBLE,
  INDEX `fk_travel_travel_class1_idx` (`travel_class` ASC) VISIBLE,
  INDEX `fk_travel_travel1_idx` (`round_trip` ASC) VISIBLE,
  INDEX `fk_travel_vehicle1_idx` (`vehicle_id` ASC) VISIBLE,
  CONSTRAINT `fk_travel_travel_status1`
    FOREIGN KEY (`travel_status`)
    REFERENCES `travel_tickets_DB`.`travel_status` (`travel_status_code`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_travel_travel_class1`
    FOREIGN KEY (`travel_class`)
    REFERENCES `travel_tickets_DB`.`travel_class` (`travel_class_code`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_travel_travel1`
    FOREIGN KEY (`round_trip`)
    REFERENCES `travel_tickets_DB`.`travel` (`travel_id`)
    ON DELETE SET NULL
    ON UPDATE RESTRICT,
  CONSTRAINT `fk_travel_vehicle1`
    FOREIGN KEY (`vehicle_id`)
    REFERENCES `travel_tickets_DB`.`vehicle` (`vehicle_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `travel_tickets_DB`.`travel_route_and_date`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `travel_tickets_DB`.`travel_route_and_date` (
  `travel_id` INT NOT NULL,
  `location_status` TINYINT NOT NULL,
  `location_name` VARCHAR(45) NOT NULL,
  `date` DATETIME NOT NULL,
  INDEX `fk_travel_route_and_date_travel1_idx` (`travel_id` ASC) VISIBLE,
  PRIMARY KEY (`travel_id`),
  CONSTRAINT `fk_travel_route_and_date_travel1`
    FOREIGN KEY (`travel_id`)
    REFERENCES `travel_tickets_DB`.`travel` (`travel_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `travel_tickets_DB`.`train`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `travel_tickets_DB`.`train` (
  `vehicle_id` INT NOT NULL,
  `number_of_stars` TINYINT NOT NULL,
  `number_of_compartment` TINYINT NOT NULL,
  `number_of_empty_compartment` TINYINT NOT NULL,
  INDEX `fk_train_vehicle1_idx` (`vehicle_id` ASC) VISIBLE,
  PRIMARY KEY (`vehicle_id`),
  CONSTRAINT `fk_train_vehicle1`
    FOREIGN KEY (`vehicle_id`)
    REFERENCES `travel_tickets_DB`.`vehicle` (`vehicle_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `travel_tickets_DB`.`flight_class`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `travel_tickets_DB`.`flight_class` (
  `flight_class_code` TINYINT NOT NULL,
  `class_type` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`flight_class_code`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `travel_tickets_DB`.`flight`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `travel_tickets_DB`.`flight` (
  `vehicle_id` INT NOT NULL,
  `airline_name` VARCHAR(45) NOT NULL,
  `flight_nember` INT NOT NULL,
  `flight_class` TINYINT NOT NULL,
  INDEX `fk_flight_flight_class1_idx` (`flight_class` ASC) VISIBLE,
  INDEX `fk_flight_vehicle1_idx` (`vehicle_id` ASC) VISIBLE,
  PRIMARY KEY (`vehicle_id`),
  CONSTRAINT `fk_flight_flight_class1`
    FOREIGN KEY (`flight_class`)
    REFERENCES `travel_tickets_DB`.`flight_class` (`flight_class_code`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_flight_vehicle1`
    FOREIGN KEY (`vehicle_id`)
    REFERENCES `travel_tickets_DB`.`vehicle` (`vehicle_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `travel_tickets_DB`.`bus_class`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `travel_tickets_DB`.`bus_class` (
  `bus_class_code` TINYINT NOT NULL,
  `class_type` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`bus_class_code`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `travel_tickets_DB`.`bus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `travel_tickets_DB`.`bus` (
  `vehicle_id` INT NOT NULL,
  `bus_company_name` VARCHAR(45) NULL DEFAULT NULL,
  `bus_class` TINYINT NOT NULL,
  `seats_on_left` TINYINT NOT NULL,
  `seats_on_right` TINYINT NOT NULL,
  INDEX `fk_bus_bus_class1_idx` (`bus_class` ASC) VISIBLE,
  INDEX `fk_bus_vehicle1_idx` (`vehicle_id` ASC) VISIBLE,
  PRIMARY KEY (`vehicle_id`),
  CONSTRAINT `fk_bus_bus_class1`
    FOREIGN KEY (`bus_class`)
    REFERENCES `travel_tickets_DB`.`bus_class` (`bus_class_code`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_bus_vehicle1`
    FOREIGN KEY (`vehicle_id`)
    REFERENCES `travel_tickets_DB`.`vehicle` (`vehicle_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `travel_tickets_DB`.`train_facilities`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `travel_tickets_DB`.`train_facilities` (
  `vehicle_id` INT NOT NULL,
  `sleeper_compartment` TINYINT NOT NULL,
  `reception` TINYINT NOT NULL,
  `internet` TINYINT NOT NULL,
  `air_conditioning` TINYINT NOT NULL,
  `more` JSON NULL DEFAULT NULL,
  INDEX `fk_train_facilities_train1_idx` (`vehicle_id` ASC) VISIBLE,
  PRIMARY KEY (`vehicle_id`),
  CONSTRAINT `fk_train_facilities_train1`
    FOREIGN KEY (`vehicle_id`)
    REFERENCES `travel_tickets_DB`.`train` (`vehicle_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `travel_tickets_DB`.`flight_facilities`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `travel_tickets_DB`.`flight_facilities` (
  `vehicle_id` INT NOT NULL,
  `reception` TINYINT NOT NULL,
  `internet` TINYINT NOT NULL,
  `bed_chair` TINYINT NOT NULL,
  `more` JSON NULL DEFAULT NULL,
  INDEX `fk_flight_facilities_flight1_idx` (`vehicle_id` ASC) VISIBLE,
  PRIMARY KEY (`vehicle_id`),
  CONSTRAINT `fk_flight_facilities_flight1`
    FOREIGN KEY (`vehicle_id`)
    REFERENCES `travel_tickets_DB`.`flight` (`vehicle_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `travel_tickets_DB`.`bus_facilities`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `travel_tickets_DB`.`bus_facilities` (
  `vehicle_id` INT NOT NULL,
  `personal_monitor` TINYINT NOT NULL,
  `reception` TINYINT NOT NULL,
  `internet` TINYINT NOT NULL,
  `air_conditioning` TINYINT NOT NULL,
  `more` JSON NULL DEFAULT NULL,
  INDEX `fk_bus_facilities_bus1_idx` (`vehicle_id` ASC) VISIBLE,
  PRIMARY KEY (`vehicle_id`),
  CONSTRAINT `fk_bus_facilities_bus1`
    FOREIGN KEY (`vehicle_id`)
    REFERENCES `travel_tickets_DB`.`bus` (`vehicle_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `travel_tickets_DB`.`admin`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `travel_tickets_DB`.`admin` (
  `user_id` INT NOT NULL,
  INDEX `fk_admin_users_idx` (`user_id` ASC) VISIBLE,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `fk_admin_users`
    FOREIGN KEY (`user_id`)
    REFERENCES `travel_tickets_DB`.`users` (`user_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `travel_tickets_DB`.`Report_categorie`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `travel_tickets_DB`.`Report_categorie` (
  `report_categorie_code` TINYINT NOT NULL,
  `categorie` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`report_categorie_code`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `travel_tickets_DB`.`Perceeding_status`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `travel_tickets_DB`.`Perceeding_status` (
  `perceeding_status_code` TINYINT NOT NULL,
  `status` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`perceeding_status_code`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `travel_tickets_DB`.`reports`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `travel_tickets_DB`.`reports` (
  `reports_id` INT NOT NULL,
  `user_id_that_reported` INT NOT NULL,
  `user_resevation_id` INT NULL DEFAULT NULL,
  `report_categorie_code` TINYINT NULL DEFAULT NULL,
  `perceeding_status_code` TINYINT NOT NULL,
  `report_text` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`reports_id`),
  INDEX `fk_reports_users1_idx` (`user_id_that_reported` ASC) VISIBLE,
  INDEX `fk_reports_Report_categorie1_idx` (`report_categorie_code` ASC) VISIBLE,
  INDEX `fk_reports_Perceeding_status1_idx` (`perceeding_status_code` ASC) VISIBLE,
  CONSTRAINT `fk_reports_users1`
    FOREIGN KEY (`user_id_that_reported`)
    REFERENCES `travel_tickets_DB`.`users` (`user_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_reports_Report_categorie1`
    FOREIGN KEY (`report_categorie_code`)
    REFERENCES `travel_tickets_DB`.`Report_categorie` (`report_categorie_code`)
    ON DELETE SET NULL
    ON UPDATE CASCADE,
  CONSTRAINT `fk_reports_Perceeding_status1`
    FOREIGN KEY (`perceeding_status_code`)
    REFERENCES `travel_tickets_DB`.`Perceeding_status` (`perceeding_status_code`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `travel_tickets_DB`.`reservation_status`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `travel_tickets_DB`.`reservation_status` (
  `reservation_status_code` TINYINT NOT NULL,
  `status` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`reservation_status_code`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `travel_tickets_DB`.`reservations`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `travel_tickets_DB`.`reservations` (
  `reservation_id` INT NOT NULL,
  `travel_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `seat_number` SMALLINT NOT NULL,
  `reservation_status` TINYINT NOT NULL,
  `resercation_date` DATETIME NOT NULL,
  `expiration_date` DATETIME NOT NULL,
  `percentage_discount` TINYINT NULL DEFAULT 0,
  PRIMARY KEY (`reservation_id`),
  INDEX `fk_reservations_reservation_status1_idx` (`reservation_status` ASC) VISIBLE,
  INDEX `fk_reservations_users1_idx` (`user_id` ASC) VISIBLE,
  INDEX `fk_reservations_travel1_idx` (`travel_id` ASC) VISIBLE,
  CONSTRAINT `fk_reservations_reservation_status1`
    FOREIGN KEY (`reservation_status`)
    REFERENCES `travel_tickets_DB`.`reservation_status` (`reservation_status_code`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_reservations_users1`
    FOREIGN KEY (`user_id`)
    REFERENCES `travel_tickets_DB`.`users` (`user_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_reservations_travel1`
    FOREIGN KEY (`travel_id`)
    REFERENCES `travel_tickets_DB`.`travel` (`travel_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `travel_tickets_DB`.`Get_checked`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `travel_tickets_DB`.`Get_checked` (
  `reservation_id` INT NOT NULL,
  `users_admin_id` INT NOT NULL,
  `statuse` VARCHAR(45) NULL DEFAULT 'accept',
  PRIMARY KEY (`reservation_id`, `users_admin_id`),
  INDEX `fk_Get_checked_admin1_idx` (`users_admin_id` ASC) VISIBLE,
  INDEX `fk_Get_checked_reservations1_idx` (`reservation_id` ASC) VISIBLE,
  CONSTRAINT `fk_Get_checked_admin1`
    FOREIGN KEY (`users_admin_id`)
    REFERENCES `travel_tickets_DB`.`admin` (`user_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Get_checked_reservations1`
    FOREIGN KEY (`reservation_id`)
    REFERENCES `travel_tickets_DB`.`reservations` (`reservation_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `travel_tickets_DB`.`errors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `travel_tickets_DB`.`errors` (
  `error_code` INT NOT NULL,
  `comment` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`error_code`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `travel_tickets_DB`.`canceled`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `travel_tickets_DB`.`canceled` (
  `reservation_id` INT NOT NULL,
  `canceled_date` DATETIME NOT NULL,
  INDEX `fk_canceled_reservations1_idx` (`reservation_id` ASC) VISIBLE,
  PRIMARY KEY (`reservation_id`),
  CONSTRAINT `fk_canceled_reservations1`
    FOREIGN KEY (`reservation_id`)
    REFERENCES `travel_tickets_DB`.`reservations` (`reservation_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `travel_tickets_DB`.`payment_status`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `travel_tickets_DB`.`payment_status` (
  `payment_status_code` TINYINT NOT NULL,
  `status` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`payment_status_code`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `travel_tickets_DB`.`payments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `travel_tickets_DB`.`payments` (
  `reservation_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `payment_status` TINYINT NOT NULL,
  `travel_id` INT NOT NULL,
  INDEX `fk_payments_payment_status1_idx` (`payment_status` ASC) VISIBLE,
  INDEX `fk_payments_reservations1_idx` (`reservation_id` ASC) VISIBLE,
  PRIMARY KEY (`reservation_id`),
  INDEX `fk_payments_users1_idx` (`user_id` ASC) VISIBLE,
  INDEX `fk_payments_travel1_idx` (`travel_id` ASC) VISIBLE,
  CONSTRAINT `fk_payments_payment_status1`
    FOREIGN KEY (`payment_status`)
    REFERENCES `travel_tickets_DB`.`payment_status` (`payment_status_code`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_payments_reservations1`
    FOREIGN KEY (`reservation_id`)
    REFERENCES `travel_tickets_DB`.`reservations` (`reservation_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_payments_users1`
    FOREIGN KEY (`user_id`)
    REFERENCES `travel_tickets_DB`.`users` (`user_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_payments_travel1`
    FOREIGN KEY (`travel_id`)
    REFERENCES `travel_tickets_DB`.`travel` (`travel_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `travel_tickets_DB`.`transaction_method`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `travel_tickets_DB`.`transaction_method` (
  `peyment_method_code` TINYINT NOT NULL,
  `method_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`peyment_method_code`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `travel_tickets_DB`.`peyments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `travel_tickets_DB`.`peyments` (
  `reservation_id` INT NOT NULL,
  `payment_id` INT NOT NULL,
  `peyment_method` TINYINT NOT NULL,
  `amount_paid` DOUBLE NOT NULL,
  `date` DATETIME NOT NULL,
  PRIMARY KEY (`reservation_id`, `payment_id`),
  INDEX `fk_peyments_transaction_method1_idx` (`peyment_method` ASC) VISIBLE,
  INDEX `fk_peyments_payments1_idx` (`reservation_id` ASC) VISIBLE,
  CONSTRAINT `fk_peyments_transaction_method1`
    FOREIGN KEY (`peyment_method`)
    REFERENCES `travel_tickets_DB`.`transaction_method` (`peyment_method_code`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_peyments_payments1`
    FOREIGN KEY (`reservation_id`)
    REFERENCES `travel_tickets_DB`.`payments` (`reservation_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `travel_tickets_DB`.`peyment_refund`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `travel_tickets_DB`.`peyment_refund` (
  `reservation_id` INT NOT NULL,
  `refund_method` TINYINT NOT NULL,
  `amount_refunded` DOUBLE NOT NULL,
  `date` DATETIME NOT NULL,
  INDEX `fk_peyment_refund_transaction_method1_idx` (`refund_method` ASC) VISIBLE,
  INDEX `fk_peyment_refund_payments1_idx` (`reservation_id` ASC) VISIBLE,
  PRIMARY KEY (`reservation_id`),
  CONSTRAINT `fk_peyment_refund_transaction_method1`
    FOREIGN KEY (`refund_method`)
    REFERENCES `travel_tickets_DB`.`transaction_method` (`peyment_method_code`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_peyment_refund_payments1`
    FOREIGN KEY (`reservation_id`)
    REFERENCES `travel_tickets_DB`.`payments` (`reservation_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `travel_tickets_DB`.`ohone_number`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `travel_tickets_DB`.`ohone_number` (
  `user_id` INT NOT NULL,
  `phone_number` BIGINT NOT NULL,
  PRIMARY KEY (`phone_number`, `user_id`),
  INDEX `fk_ohone_number_users1_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_ohone_number_users1`
    FOREIGN KEY (`user_id`)
    REFERENCES `travel_tickets_DB`.`users` (`user_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

USE `travel_tickets_DB` ;

-- -----------------------------------------------------
-- Placeholder table for view `travel_tickets_DB`.`view1`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `travel_tickets_DB`.`view1` (`id` INT);

-- -----------------------------------------------------
-- View `travel_tickets_DB`.`view1`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `travel_tickets_DB`.`view1`;
USE `travel_tickets_DB`;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
