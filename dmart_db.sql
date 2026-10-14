CREATE DATABASE dmart_db;

USE dmart_db;

CREATE TABLE customer_info (id INT PRIMARY KEY, name VARCHAR(50), phone_num BIGINT, age INT, city VARCHAR(25), email VARCHAR(100)) ;

INSERT INTO customer_info VALUES (1, 'Sharon', 9876543210, 22, 'Bengaluru', 'sharon@gmail.com'),
(2, 'Jessy', 9876543211, 28, 'Mysuru', 'Jessy@gmail.com'),
(3, 'Arun', 9876543212, 32, 'Chennai', 'arun@gmail.com'),
(4, 'Sneha', 9876543213, 22, 'Bengaluru', 'sneha@gmail.com'),
(5, 'Kiran', 9876543214, 35, 'Hyderabad', 'kiran@gmail.com'),
(6, 'Divya', 9876543215, 27, 'Mysuru', 'divya@gmail.com'),
(7, 'Vijay', 9876543216, 30, 'Hubballi', 'vijay@gmail.com'),
(8, 'Ananya', 9876543217, 24, 'Bengaluru', 'ananya@gmail.com'),
(9, 'Manoj', 9876543218, 40, 'Chennai', 'manoj@gmail.com'),
(10, 'Meera', 9876543219, 29, 'Hubballi', 'meera@gmail.com');


-- DQL operations
-- using * - select all columns
SELECT * FROM customer_info;

-- selecting particular columns
SELECT id, name FROM customer_info;
SELECT name, phone_num FROM customer_info;
SELECT city FROM customer_info;
SELECT id,name,email FROM customer_info;

-- distinct elements
SELECT DISTINCT city FROM customer_info;

-- arthemetic operator
SELECT * FROM  customer_info where id > 5;
SELECT * FROM  customer_info where NOT id > 5;

SELECT * FROM customer_info WHERE age = 35;
SELECT * FROM customer_info WHERE NOT age = 35;

SELECT * FROM customer_info WHERE id != 6;
SELECT * FROM customer_info WHERE NOT id != 6;

SELECT * FROM customer_info WHERE age >= 25;
SELECT * FROM customer_info WHERE NOT age >= 25;

SELECT * FROM customer_info WHERE age <= 20;
SELECT * FROM customer_info WHERE NOT age <= 20;

-- logical operator 

SELECT * FROM customer_info WHERE city = 'Bengaluru' OR city = 'Mysore';
SELECT * FROM customer_info WHERE id = 10 OR id = 6;

SELECT * FROM customer_info WHERE city = 'Hubbali' AND id = 10;
SELECT * FROM customer_info WHERE name = 'vijay' AND age = 30;

SELECT * FROM customer_info WHERE NOT name = 'sharon';
SELECT * FROM customer_info where NOT city = 'Chennai';


-- SQL Operators - in, is, between, 
SELECT * FROM customer_info WHERE city in ('Bengaluru','Mysuru','Hyderabad');




CREATE TABLE product_info (id INT PRIMARY KEY, product_name VARCHAR(50), price DOUBLE, quantity INT, manf_date DATE, exp_date DATE);

INSERT INTO product_info VALUES (1, 'Rice', 1800.00, 10, '2026-01-10', '2027-01-10'),
(2, 'Wheat Flour', 220.00, 40, '2026-02-15', '2026-08-15'),
(3, 'Sunflower Oil', 160.00, 60, '2026-03-01', '2027-03-01'),
(4, 'Sugar 1kg', 48.00, 100, '2026-04-05', '2027-04-05'),
(5, 'Salt 1kg', 25.00, 80, '2026-01-20', '2028-01-20'),
(6, 'Milk Powder', 280.00, 30, '2026-05-10', '2027-05-10'),
(7, 'Biscuits', 30.00, 120, '2026-06-01', '2026-12-01'),
(8, 'Coffee Powder', 180.00, 45, '2026-02-20', '2027-02-20'),
(9, 'Shampoo', 150.00, 35, '2026-03-15', '2028-03-15'),
(10, 'Toothpaste', 95.00, 70, '2026-04-25', '2027-10-25');

SELECT * FROM product_info;