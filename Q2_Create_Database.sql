-- MySQL Script

-- -----------------------------------------------------
-- Schema pizzaria
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `pizzaria`;

CREATE SCHEMA IF NOT EXISTS `pizzaria` DEFAULT CHARACTER SET utf8;
USE `pizzaria`;

-- -----------------------------------------------------
-- Table `pizzaria`.`customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzaria`.`customers` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(60) CHARACTER SET 'utf8' COLLATE 'utf8_general_ci' NULL,
  `phone_number` VARCHAR(15) CHARACTER SET 'utf8' COLLATE 'utf8_general_ci' NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pizzaria`.`items`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzaria`.`items` (
  `id` INT NOT NULL,
  `name` VARCHAR(60) CHARACTER SET 'utf8' COLLATE 'utf8_general_ci' NULL,
  `price` DECIMAL(5,2) NULL DEFAULT 0.0,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pizzaria`.`orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzaria`.`orders` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `customer_id` INT NOT NULL,
  `order_date` DATETIME NOT NULL,
  PRIMARY KEY (`id`, `customer_id`),
  CONSTRAINT `fk_orders_customer_id`
    FOREIGN KEY (`customer_id`)
    REFERENCES `pizzaria`.`customers` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE INDEX `fk_orders_customers_idx` ON `pizzaria`.`orders` (`customer_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `pizzaria`.`orders_items`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzaria`.`orders_items` (
  `order_id` INT NOT NULL,
  `item_id` INT NOT NULL,
  `quantity` INT NULL DEFAULT 1,
  PRIMARY KEY (`order_id`, `item_id`),
  CONSTRAINT `fk_orders_items_order_id`
    FOREIGN KEY (`order_id`)
    REFERENCES `pizzaria`.`orders` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_orders_items_item_id`
    FOREIGN KEY (`item_id`)
    REFERENCES `pizzaria`.`items` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE INDEX `fk_orders_items_items_idx` ON `pizzaria`.`orders_items` (`item_id` ASC) VISIBLE;

CREATE INDEX `fk_orders_items_orders_idx` ON `pizzaria`.`orders_items` (`order_id` ASC) VISIBLE;
