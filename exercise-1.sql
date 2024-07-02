CREATE DATABASE plumbing;

USE plumbing;

CREATE TABLE clients (
	id INT AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(50) NOT NULL, 
    email VARCHAR (50) NOT NULL, 
    phone_number VARCHAR(15) NOT NULL
);

CREATE TABLE plumbers (
	id INT AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(50) NOT NULL, 
    email VARCHAR (50) NOT NULL, 
    phone_number VARCHAR(15) NOT NULL
);

CREATE TABLE services (
	id INT AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(50) NOT NULL, 
    `description` VARCHAR (255) NOT NULL, 
    price DECIMAL(8,2) NOT NULL,
    client_id  INT, 
    plumber_id INT,
    FOREIGN KEY (client_id) REFERENCES clients(id),
    FOREIGN KEY (plumber_id) REFERENCES plumbers(id)
);

CREATE TABLE bills (
	id INT AUTO_INCREMENT PRIMARY KEY,
    client_id INT NOT NULL, 
    service_id INT NOT NULL, 
    plumber_id INT NOT NULL,
    discount_id INT,
    `date` DATE NOT NULL,
    total DECIMAL (8,2) NOT NULL,
    FOREIGN KEY (client_id) REFERENCES clients(id),
    FOREIGN KEY (service_id) REFERENCES services(id),
    FOREIGN KEY (plumber_id) REFERENCES plumbers(id)
);

CREATE TABLE discounts (
	id INT AUTO_INCREMENT PRIMARY KEY,
    bill_id INT NOT NULL,
    amount DECIMAL (8,2) NOT NULL,
    FOREIGN KEY (bill_id) REFERENCES bills(id)
);

CREATE TABLE payments (
	id INT AUTO_INCREMENT PRIMARY KEY, 
    bill_id INT NOT NULL,
    amount DECIMAL (8,2) NOT NULL,
    `date` DATE,
	FOREIGN KEY (bill_id) REFERENCES bills(id)
);

CREATE TABLE audits (
	id INT AUTO_INCREMENT PRIMARY KEY,
    board VARCHAR(50) NOT NULL,
    `action` VARCHAR (50) NOT NULL,
    `date` DATE
    
);


ALTER TABLE clients
ADD COLUMN address VARCHAR (255);

ALTER TABLE services
ADD COLUMN `date` DATE;

ALTER TABLE plumbers
ADD COLUMN address VARCHAR (255);

ALTER TABLE bills
ADD COLUMN address VARCHAR (255);

ALTER TABLE bills
ADD FOREIGN KEY (discount_id) REFERENCES discounts(id);
