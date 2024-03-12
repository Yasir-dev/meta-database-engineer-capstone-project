CREATE SCHEMA IF NOT EXISTS `little_lemon_db` DEFAULT CHARACTER SET utf8 ;
USE `little_lemon_db` ;

CREATE TABLE `OrderDeliveryStatus`(
    `DeliveryID` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `Status` VARCHAR(255) NOT NULL,
    `Date` DATE NOT NULL,
    `OrderID` INT NOT NULL,
    `StaffID` INT NOT NULL
);

CREATE TABLE `Bookings`(
    `BookingID` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `CustomerID` INT NOT NULL,
    `TableNumber` INT NOT NULL,
    `Date` DATE NOT NULL
);

CREATE TABLE `Staff`(
    `StaffID` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `RoleID` INT NOT NULL,
    `Salary` DECIMAL(8, 2) NOT NULL,
    `FirstName` VARCHAR(255) NOT NULL,
    `LastName` VARCHAR(255) NOT NULL
);

CREATE TABLE `Orders`(
    `OrderID` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `Date` DATE NOT NULL,
    `Quantity` INT NOT NULL,
    `TotalCost` DECIMAL(8, 2) NOT NULL,
    `CustomerID` INT NOT NULL,
    `BookingID` INT NOT NULL,
    `MenuID` INT NOT NULL
);

CREATE TABLE `Customers`(
    `CustomerID` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `FirstName` VARCHAR(255) NOT NULL,
    `LastName` VARCHAR(255) NOT NULL,
    `Email` VARCHAR(255) NOT NULL,
    `PhoneNumber` VARCHAR(255) NOT NULL,
    `Address` VARCHAR(255) NOT NULL,
    `Country` VARCHAR(255) NOT NULL,
    `City` VARCHAR(255) NOT NULL
);

CREATE TABLE `Role`(
    `RoleID` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `Role` VARCHAR(255) NOT NULL
);

CREATE TABLE `Menu`(
    `MenuID` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `OrderID` INT NOT NULL,
    `Name` VARCHAR(255) NOT NULL,
    `Cuisine` VARCHAR(255) NOT NULL,
    `ItemID` INT NOT NULL
);

CREATE TABLE `MenuItem`(
    `ItemID` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `Name` VARCHAR(255) NOT NULL,
    `Type` VARCHAR(255) NOT NULL,
    `Price` DECIMAL(8, 2) NOT NULL
);

ALTER TABLE
    `OrderDeliveryStatus` ADD CONSTRAINT `orderdeliverystatus_staffid_foreign` FOREIGN KEY(`StaffID`) REFERENCES `Staff`(`StaffID`);
ALTER TABLE
    `Orders` ADD CONSTRAINT `orders_customerid_foreign` FOREIGN KEY(`CustomerID`) REFERENCES `Customers`(`CustomerID`);
ALTER TABLE
    `Bookings` ADD CONSTRAINT `bookings_customerid_foreign` FOREIGN KEY(`CustomerID`) REFERENCES `Customers`(`CustomerID`);
ALTER TABLE
    `Menu` ADD CONSTRAINT `menu_itemid_foreign` FOREIGN KEY(`ItemID`) REFERENCES `MenuItem`(`ItemID`);
ALTER TABLE
    `Staff` ADD CONSTRAINT `staff_roleid_foreign` FOREIGN KEY(`RoleID`) REFERENCES `Role`(`RoleID`);
ALTER TABLE
    `Menu` ADD CONSTRAINT `menu_orderid_foreign` FOREIGN KEY(`OrderID`) REFERENCES `Orders`(`MenuID`);