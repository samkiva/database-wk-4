-- Week 4: Advanced SQL Queries and Aggregations
-- Author: samkiva
-- Database: salesdb

-- Select your working database
USE salesdb;

-- Create tables if they don't exist
CREATE TABLE IF NOT EXISTS payments (
    paymentDate DATE,
    amount DECIMAL(10,2),
    checkNumber VARCHAR(20)
);

CREATE TABLE IF NOT EXISTS customers (
    customerName VARCHAR(100),
    country VARCHAR(50),
    creditLimit DECIMAL(10,2)
);

CREATE TABLE IF NOT EXISTS orderdetails (
    productCode VARCHAR(20),
    quantityOrdered INT,
    priceEach DECIMAL(10,2)
);

-- Insert sample data
INSERT INTO payments VALUES
('2025-08-01', 1500.00, 'CHK001'),
('2025-08-01', 2000.00, 'CHK002'),
('2025-08-02', 1750.00, 'CHK003'),
('2025-08-03', 2200.00, 'CHK004'),
('2025-08-04', 1800.00, 'CHK005');

INSERT INTO customers VALUES
('Amina Mwangi', 'Kenya', 5000.00),
('Brian Otieno', 'Kenya', 7000.00),
('Cynthia Kariuki', 'Uganda', 6500.00),
('Amina Mwangi', 'Kenya', 5500.00);

INSERT INTO orderdetails VALUES
('PZ001', 10, 12.50),
('PZ002', 5, 15.00),
('PZ001', 8, 12.50),
('PZ003', 12, 10.00),
('PZ002', 7, 15.00);

-- Question 1: Total payment amount by date (latest first, top 5)
SELECT paymentDate, SUM(amount) AS total_amount
FROM payments
GROUP BY paymentDate
ORDER BY paymentDate DESC
LIMIT 5;

-- Question 2: Average credit limit per customer
SELECT customerName, country, AVG(creditLimit) AS avg_credit_limit
FROM customers
GROUP BY customerName, country;

-- Question 3: Total price of products ordered
SELECT productCode, SUM(quantityOrdered * priceEach) AS total_price
FROM orderdetails
GROUP BY productCode;

-- Question 4: Highest payment amount per check number
SELECT checkNumber, MAX(amount) AS highest_amount
FROM payments
GROUP BY checkNumber;