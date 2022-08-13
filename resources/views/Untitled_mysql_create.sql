CREATE TABLE `User` (
	`id` INT(10) NOT NULL AUTO_INCREMENT,
	`first_name` VARCHAR(30) NOT NULL AUTO_INCREMENT,
	`last_name` VARCHAR(30) NOT NULL AUTO_INCREMENT,
	`ip` VARCHAR(30) NOT NULL AUTO_INCREMENT,
	`email` VARCHAR(50) NOT NULL AUTO_INCREMENT,
	`password` VARCHAR(100) NOT NULL AUTO_INCREMENT,
	`status` VARCHAR(10) NOT NULL AUTO_INCREMENT,
	`activation_code` VARCHAR(200) NOT NULL AUTO_INCREMENT,
	`forgot_code` VARCHAR(200) NOT NULL AUTO_INCREMENT,
	`forgot_code_sent_time` DATETIME(100) NOT NULL AUTO_INCREMENT,
	PRIMARY KEY (`id`)
);

CREATE TABLE `user_address` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`user_id` INT NOT NULL,
	`complete_address` VARCHAR(300) NOT NULL,
	`phone_number` VARCHAR(15) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `products` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`product_name` VARCHAR(300) NOT NULL,
	`product_slug` VARCHAR(350) NOT NULL,
	`category_id` INT NOT NULL,
	`subcategory_id` INT NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `categories` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`category_name` VARCHAR(100) NOT NULL,
	`category_icon` VARCHAR(225) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `subcategories` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`category_id` INT NOT NULL,
	`sub_category_name` VARCHAR(100) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `variations` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`variation_name` VARCHAR(50) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `variation_opitons` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`variation_id` INT NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `product_variations` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`product_id` INT NOT NULL,
	`variation_name` VARCHAR(100) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `product_variations_options` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`product_variation_id` INT NOT NULL,
	`variation_name` VARCHAR(255) NOT NULL,
	`variation_img` VARCHAR(200) NOT NULL,
	`sku` VARCHAR(100) NOT NULL,
	`price` FLOAT(10) NOT NULL,
	`product_stock_id` INT(10) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `product_stock` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`total_stock` INT NOT NULL,
	`unit_price` FLOAT NOT NULL,
	`total_price` FLOAT NOT NULL,
	PRIMARY KEY (`id`)
);

ALTER TABLE `user_address` ADD CONSTRAINT `user_address_fk0` FOREIGN KEY (`user_id`) REFERENCES `User`(`id`);

ALTER TABLE `products` ADD CONSTRAINT `products_fk0` FOREIGN KEY (`category_id`) REFERENCES `categories`(`id`);

ALTER TABLE `products` ADD CONSTRAINT `products_fk1` FOREIGN KEY (`subcategory_id`) REFERENCES `subcategories`(`id`);

ALTER TABLE `subcategories` ADD CONSTRAINT `subcategories_fk0` FOREIGN KEY (`category_id`) REFERENCES `categories`(`id`);

ALTER TABLE `variation_opitons` ADD CONSTRAINT `variation_opitons_fk0` FOREIGN KEY (`variation_id`) REFERENCES `variations`(`id`);

ALTER TABLE `product_variations` ADD CONSTRAINT `product_variations_fk0` FOREIGN KEY (`product_id`) REFERENCES `products`(`id`);

ALTER TABLE `product_variations_options` ADD CONSTRAINT `product_variations_options_fk0` FOREIGN KEY (`product_variation_id`) REFERENCES `product_variations`(`id`);

ALTER TABLE `product_variations_options` ADD CONSTRAINT `product_variations_options_fk1` FOREIGN KEY (`product_stock_id`) REFERENCES `product_stock`(`id`);











