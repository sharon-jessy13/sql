CREATE DATABASE ShoppingMallDB;

USE ShoppingMallDB;

CREATE TABLE Products ( product_id INT PRIMARY KEY, product_name VARCHAR(100), category VARCHAR(50), brand VARCHAR(50),price DECIMAL(10,2),
    stock INT );
    
INSERT INTO Products VALUES (1, 'Laptop', 'Electronics', 'HP', 55000, 10),
(2, 'Smartphone', 'Electronics', 'Samsung', 30000, 25),
(3, 'Headphones', 'Accessories', 'Sony', 2500, 40),
(4, 'Smart TV', 'Electronics', 'LG', 45000, 8),
(5, 'Keyboard', 'Accessories', 'Logitech', 1500, 30),
(6, 'Refrigerator', 'Appliances', 'LG', 38000, 12),
(7, 'Mouse', 'Accessories', 'HP', 800, 50),
(8, 'Washing Machine', 'Appliances', 'Samsung', 28000, 15);

SELECT * FROM products;

-- no. of products in each category 
SELECT category, COUNT(category) FROM Products group by category;

-- display products having price > 250000
SELECT product_name, price FROM products  HAVING price > 25000;

-- group the category having avarge price > 20000
SELECT category, avg(price) FROM products GROUP BY category HAVING avg(price) > 20000;

-- order the product names by asecending order 
SELECT * FROM products ORDER BY product_name ASC;
-- Descending order
SELECT * FROM products ORDER BY product_name DESC;

-- order by price
SELECT * FROM products ORDER BY price ASC;

-- display the sum of stock > 15 in each category and order them in ascending order
SELECT category, SUM(stock) FROM  products GROUP BY category HAVING SUM(stock) > 15 ORDER BY SUM(stock) ASC;

