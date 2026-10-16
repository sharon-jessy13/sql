USE ShoppingMallDB;

CREATE TABLE Orders ( order_id INT PRIMARY KEY, customer_id INT, product_id INT, quantity INT, order_date DATE,payment_method VARCHAR(30),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id), FOREIGN KEY (product_id) REFERENCES Products(product_id) );
    
INSERT INTO Orders VALUES (1001, 101, 1, 1, '2026-10-01', 'UPI'),
(1002, 102, 3, 2, '2026-10-02', 'Cash'),
(1003, 103, 2, 1, '2026-10-03', 'Card'),
(1004, 101, 5, 2, '2026-10-04', 'UPI'),
(1005, 104, 4, 1, '2026-10-05', 'Card'),
(1006, 105, 7, 3, '2026-10-06', 'Cash'),
(1007, 103, 6, 1, '2026-10-07', 'UPI'),
(1008, 102, 2, 2, '2026-10-08', 'Card'),
(1009, 101, 3, 1, '2026-10-09', 'Cash'),
(1010, 104, 8, 1, '2026-10-10', 'UPI');


-- Aggregate functions 

SELECT COUNT(*) FROM orders;

SELECT SUM(quantity) AS total_items_ordered FROM Orders;

SELECT AVG(quantity) AS average_quantity FROM Orders;

SELECT MIN(quantity) AS minimum_quantity FROM Orders;

SELECT MAX(quantity) AS maximum_quantity FROM Orders;

SELECT COUNT(DISTINCT customer_id) AS unique_customers FROM Orders;

-- string functions 

-- displays values in upper acse
SELECT UPPER(payment_method) FROM Orders;
SELECT ucase(payment_method) FROM Orders;
SELECT ucase(quantity) FROM Orders;

-- display values in lower case
SELECT LOWER(payment_method) FROM Orders;
SELECT LCASE(payment_method) FROM Orders;

-- display length 
SELECT payment_method, LENGTH(payment_method) FROM Orders;

SELECT CHAR_LENGTH(payment_method) FROM Orders;

-- concat the word and id numbers
SELECT CONCAT('Order ID: ', order_id) FROM Orders;

-- replace the values
SELECT REPLACE(payment_method, 'UPI', 'Online') FROM Orders;

-- reverse the values 
SELECT REVERSE(payment_method) FROM Orders;

-- display 2 char from left
SELECT LEFT(payment_method, 2) FROM Orders;

-- display 2 char from right
SELECT RIGHT(payment_method, 2) FROM Orders;


-- numeric functions

SELECT ABS(quantity - 5) FROM Orders;

-- decimal values 2 digits
SELECT ROUND(quantity, 2) FROM Orders;

-- displays the number greater than or equal to that number
SELECT CEIL(quantity / 3) FROM Orders;

-- reverse to ceil
SELECT FLOOR(quantity / 3) FROM Orders;

-- mod means it gives remainder
SELECT quantity, MOD(quantity, 2) FROM Orders;

-- power
SELECT POWER(quantity, 2) FROM Orders;

-- square root
SELECT SQRT(quantity) FROM Orders;


-- 1- positive -1 for negative 0  for zero
SELECT SIGN(quantity) FROM Orders;


-- date functions 

SELECT YEAR(order_date) FROM Orders;

SELECT MONTH(order_date) FROM Orders;
SELECT DAY(order_date) FROM Orders;
SELECT MONTHNAME(order_date) FROM Orders;
SELECT DAYNAME(order_date) FROM Orders;

-- last date of that month
SELECT LAST_DAY(order_date) FROM Orders;
SELECT DATE_FORMAT(order_date, '%d-%m-%Y') FROM Orders;

-- present / current date and time
SELECT NOW();

-- current / today's date
SELECT CURDATE();


SELECT * FROM Orders;