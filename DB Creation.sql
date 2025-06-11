DROP DATABASE IF EXISTS cardealership;
CREATE DATABASE cardealership;
USE cardealership;

CREATE TABLE vehicles (
	vin VARCHAR(10) NOT NULL PRIMARY KEY,
    year INT NOT NULL,
    make VARCHAR(50) NOT NULL,
    model VARCHAR(50) NOT NULL,
    color VARCHAR(20) NOT NULL,
    mileage INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL
);

CREATE TABLE dealerships (
    dealershipID INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    address VARCHAR(255) NOT NULL,
    phone VARCHAR(15) NOT NULL
);

CREATE TABLE inventory (
    dealershipID INT NOT NULL,
	vin VARCHAR(10) NOT NULL,
    PRIMARY KEY (dealershipID, vin),
    FOREIGN KEY (dealershipID) REFERENCES dealerships(dealershipID),
    FOREIGN KEY (vin) REFERENCES vehicles(vin)
);

CREATE TABLE salecontracts (
    contractID INT AUTO_INCREMENT PRIMARY KEY,
	vin VARCHAR(10) NOT NULL,
    dealershipID INT NOT NULL,
    saleDate DATE NOT NULL,
    customerName VARCHAR(250) NOT NULL,
    customerEmail VARCHAR(100) NOT NULL,
    salesTaxRate DECIMAL(4, 3) NOT NULL,
    recordingFee DECIMAL(10, 2) NOT NULL,
    processingFee DECIMAL(10, 2) NOT NULL,
    financed BOOLEAN NOT NULL,
    FOREIGN KEY (vin) REFERENCES vehicles(vin),
    FOREIGN KEY (dealershipID) REFERENCES dealerships(dealershipID)
);

CREATE TABLE leasecontracts (
    contractID INT AUTO_INCREMENT PRIMARY KEY,
    vin VARCHAR(10) NOT NULL,
    dealershipID INT NOT NULL,
    leaseDate DATE NOT NULL,
    customerName VARCHAR(250) NOT NULL,
    customerEmail VARCHAR(100) NOT NULL,
    leaseFee DECIMAL(10, 2) NOT NULL,
    totalPrice DECIMAL(10, 2) NOT NULL,
    monthlyPayment DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (vin) REFERENCES vehicles(vin),
    FOREIGN KEY (dealershipID) REFERENCES dealerships(dealershipID)
);

INSERT INTO vehicles (vin, year, make, model, color, mileage, price) VALUES
('1HGCM82633', 1995, 'Toyota', 'Camry', 'blue', 65486, 45999.99),
('JH4KA8260N', 2020, 'Honda', 'Civic', 'black', 34200, 17999.00),
('1N4AL11D75', 2018, 'Ford', 'Escape', 'white', 51230, 20450.50),
('WBA3A5C51F', 2017, 'Chevrolet', 'Malibu', 'red', 60120, 15795.00),
('5NPEB4AC1B', 2019, 'Nissan', 'Altima', 'gray', 28900, 18300.75),
('4T1BF1FK9H', 2021, 'Hyundai', 'Tucson', 'silver', 19400, 22000.00),
('2HGFG12877', 2016, 'Toyota', 'Camry', 'white', 84500, 14500.00),
('3FAHP0HA2A', 2015, 'Jeep', 'Cherokee', 'green', 73500, 16500.00),
('JTDKN3DU8A', 2022, 'Tesla', 'Model 3', 'black', 13200, 39999.99),
('KM8SR4HF2E', 2014, 'Subaru', 'Outback', 'blue', 91000, 12900.00),
('WVWBP7AN4D', 2013, 'Ford', 'Focus', 'gray', 105000, 8900.00),
('SALWR2VF2F', 2020, 'Kia', 'Sorento', 'white', 33000, 21500.00),
('1G1ZE5ST5H', 2021, 'Nissan', 'Altima', 'blue', 25000, 19999.00),
('3N1AB7AP4K', 2019, 'Mazda', 'CX-5', 'red', 44700, 22750.00);

INSERT INTO dealerships (name, address, phone) VALUES
('Downtown Motors', '123 Main St, Philadelphia, PA 19101', '215-555-1001'),
('Suburban Auto Mall', '456 Maple Ave, King of Prussia, PA 19406', '610-555-2002'),
('Cityline Imports', '789 Broad St, Philadelphia, PA 19102', '267-555-3003');

INSERT INTO inventory (dealershipID, vin) VALUES
(1, '1HGCM82633'),
(1, 'JH4KA8260N'),
(1, '1N4AL11D75'),
(2, 'WBA3A5C51F'),
(2, '5NPEB4AC1B'),
(2, '4T1BF1FK9H'),
(3, '2HGFG12877'),
(3, '3FAHP0HA2A'),
(3, 'JTDKN3DU8A'),
(1, 'KM8SR4HF2E'),
(2, 'WVWBP7AN4D'),
(3, 'SALWR2VF2F'),
(1, '1G1ZE5ST5H'),
(2, '3N1AB7AP4K');

INSERT INTO salecontracts (
    vin, dealershipID, saleDate, customerName, customerEmail,
    salesTaxRate, recordingFee, processingFee, financed
) VALUES
('1HGCM82633', 1, '2024-01-15', 'John Doe', 'johndoe@example.com', 0.072, 150.00, 299.99, TRUE),
('JH4KA8260N', 2, '2024-02-20', 'Jane Smith', 'janesmith@example.com', 0.072, 150.00, 299.99, FALSE),
('1N4AL11D75', 1, '2024-03-05', 'Michael Brown', 'mbrown@example.com', 0.072, 150.00, 299.99, TRUE),
('WBA3A5C51F', 3, '2024-03-18', 'Emily Johnson', 'ejohnson@example.com', 0.072, 150.00, 299.99, FALSE),
('5NPEB4AC1B', 2, '2024-04-10', 'David Lee', 'dlee@example.com', 0.072, 150.00, 299.99, TRUE);

INSERT INTO leasecontracts (
    vin, dealershipID, leaseDate, customerName, customerEmail,
    leaseFee, totalPrice, monthlyPayment
) VALUES
('4T1BF1FK9H', 1, '2024-01-10', 'Alice Green', 'alicegreen@example.com', 300.00, 12600.00, 350.00),
('2HGFG12877', 2, '2024-02-15', 'Bob White', 'bobwhite@example.com', 300.00, 9600.00, 400.00),
('3FAHP0HA2A', 3, '2024-03-01', 'Cathy Blue', 'cathyblue@example.com', 300.00, 15360.00, 320.00),
('JTDKN3DU8A', 1, '2024-03-20', 'Dan Black', 'danblack@example.com', 300.00, 14760.00, 410.00),
('KM8SR4HF2E', 2, '2024-04-05', 'Ella Brown', 'ellabrown@example.com', 300.00, 17400.00, 290.00),
('WVWBP7AN4D', 3, '2024-04-22', 'Frank Orange', 'frankorange@example.com', 300.00, 11880.00, 330.00),
('SALWR2VF2F', 1, '2024-05-10', 'Grace Silver', 'gracesilver@example.com', 300.00, 14880.00, 310.00),
('1G1ZE5ST5H', 2, '2024-05-25', 'Henry Violet', 'henryviolet@example.com', 300.00, 8880.00, 370.00),
('3N1AB7AP4K', 3, '2024-06-01', 'Ivy Gold', 'ivygold@example.com', 300.00, 10800.00, 300.00);

