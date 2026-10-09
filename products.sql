create database e_commerce;

use e_commerce;

create table products(product_id int, name varchar(50),model_id int, price double,brand varchar(50),category enum("Electronics","Appliances","Accessories"), manufacture_date date, is_available boolean, features set('Wireless', 'Bluetooth', 'Waterproof', 'Touchscreen') )


INSERT INTO products (product_id, name, model_id, price, brand,category, manufacture_date, is_available, features)
VALUES (1, 'mobile',3567 , 25000.00, 'Samsung','Electronics', '2026-10-07', true,'Touchscreen,Bluetooth' );

insert into products values(2, 'AirPods Pro', 4567, 24999.99, 'Apple','Accessories', '2026-08-15', TRUE, 'Wireless,Bluetooth');


alter table products add  color varchar(20), add  stock INT, add warranty_years decimal(3,1);

alter table products drop color;

alter table products modify stock decimal(10,2);

ALTER TABLE products RENAME COLUMN name TO product_name, RENAME COLUMN brand TO brand_name;


-- dml operations
INSERT INTO products VALUES(6, 'Smart Watch', 8901, 8999.99, 'Samsung','Accessories', '2026-09-15', TRUE,'Wireless,Bluetooth,Touchscreen', 50, 2.0);

INSERT INTO products VALUES (7, 'Laptop', 4567, 65000.00, 'Dell','Electronics', '2026-08-10', TRUE,'Bluetooth,Touchscreen', 25, 1.5) , (8, 'Washing Machine', 6789, 32000.00, 'LG','Appliances', '2026-07-20', TRUE,'Waterproof', 15, 3.0);
INSERT INTO products (product_id, product_name, price, brand_name) VALUES(10, 'Tablet', 35000.00, 'Samsung'), (11, 'Keyboard', 2499.99, 'Logitech');
INSERT INTO products(product_id, product_name, price, brand_name)VALUES(12, 'Monitor', 18000.00, 'Dell');
INSERT INTO products(product_id, product_name, price, brand_name)VALUES(13, 'Speaker', 5999.99, 'JBL');

select * from products;



create table customers (customer_id int,name varchar(50),gender char(1),email varchar(100),phone bigint,date_of_birth DATE,registration_time datetime,is_active boolean);

insert into customers values(101, 'Sharon', 'F', 'sharon@gmail.com','9876543210', '2003-05-15','2026-10-08 10:30:00', false);

insert into customers values(102, 'Rahul', 'M', 'rahul@gmail.com','9876501234', '2002-08-20','2026-10-08 11:15:00', true);
ALTER TABLE customers ADD  city VARCHAR(50), ADD  country VARCHAR(30),ADD  loyalty_points INT;

-- Drop 1 column
ALTER TABLE customers DROP  loyalty_points;

-- Modify 1 column datatype/size
ALTER TABLE customers MODIFY  phone VARCHAR(20);

-- Rename 2 columns
ALTER TABLE customers RENAME COLUMN name TO customer_name, RENAME COLUMN registration_time TO registered_at;

INSERT INTO customers VALUES(106, 'Kiran', 'M', 'kiran@gmail.com', '9876501111','2002-04-12', '2026-10-09 09:00:00', TRUE,'Bengaluru', 'India');

INSERT INTO customers VALUES(107, 'Meera', 'F', 'meera@gmail.com', '9876502222', '2003-07-18', '2026-10-09 09:30:00', TRUE,'Mysuru', 'India');

INSERT INTO customers VALUES (108, 'Vijay', 'M', 'vijay@gmail.com', '9876503333', '2001-02-10', '2026-10-09 10:00:00', TRUE, 'Mangaluru', 'India'),
(109, 'Divya', 'F', 'divya@gmail.com', '9876504444','2004-09-20', '2026-10-09 10:30:00', FALSE,'Hubballi', 'India');

INSERT INTO customers (customer_id, customer_name, email, city, country)VALUES(110, 'Ajay', 'ajay@gmail.com', 'Bengaluru', 'India');

INSERT INTO customers(customer_id, customer_name, email, city, country)VALUES(111, 'Nisha', 'nisha@gmail.com', 'Mysuru', 'India');

INSERT INTO customers(customer_id, customer_name, email, city, country)VALUES(112, 'Ravi', 'ravi@gmail.com', 'Belagavi', 'India'),
(113, 'Pooja', 'pooja@gmail.com', 'Shivamogga', 'India');

select * from customers;




create table orders (order_id int,customer_id int,order_date date,order_time time,order_status ENUM('Pending', 'Shipped', 'Delivered', 'Cancelled'),total_amount decimal(10,2),tracking_code char(10),description text);

insert into orders values(5001, 101, '2026-10-08', '10:45:30','Delivered', 75000.00, 'TRK100001A','Mobile phone order');

insert into orders values(5002, 102, '2026-10-08', '11:30:15','Shipped', 24999.99, 'TRK100002B','Wireless earbuds order');

ALTER TABLE orders
ADD COLUMN shipping_address VARCHAR(100),
ADD COLUMN discount DECIMAL(6,2),
ADD COLUMN delivery_time TIME;

-- Drop 1 column
ALTER TABLE orders
DROP COLUMN delivery_time;

-- Modify 1 column
ALTER TABLE orders
MODIFY COLUMN tracking_code CHAR(15);

-- Rename 2 columns
ALTER TABLE orders
RENAME COLUMN order_date TO purchased_date,
RENAME COLUMN description TO order_description;

-- Check structure
DESC orders;

INSERT INTO orders VALUES (5006, 106, '2026-10-09', '11:00:00','Pending', 8999.99, 'TRK100006A','Smart watch order', 'Bengaluru, Karnataka', 200.00);

INSERT INTO orders VALUES(5007, 107, '2026-10-09', '11:30:00', 'Shipped', 35000.00, 'TRK100007B', 'Tablet order', 'Mysuru, Karnataka', 500.00);

INSERT INTO orders VALUES(5008, 108, '2026-10-09', '12:00:00', 'Delivered', 4999.99, 'TRK100008C', 'Headphones order', 'Mangaluru, Karnataka', 100.00),
(5009, 109, '2026-10-09', '12:30:00', 'Pending', 1599.00, 'TRK100009D', 'Keyboard order', 'Hubballi, Karnataka', 50.00);

INSERT INTO orders(order_id, customer_id, order_status, total_amount, shipping_address)VALUES(5010, 110, 'Pending', 12000.00, 'Bengaluru, Karnataka');

INSERT INTO orders(order_id, customer_id, order_status, total_amount, shipping_address)VALUES(5011, 111, 'Shipped', 22000.00, 'Mysuru, Karnataka');

INSERT INTO orders(order_id, customer_id, order_status, total_amount, shipping_address)
VALUES(5012, 112, 'Pending', 4500.00, 'Belagavi, Karnataka'),(5013, 113, 'Delivered', 8500.00, 'Shivamogga, Karnataka');

select * from orders;




create table payments (payment_id int,order_id int,payment_method enum('UPI', 'Card', 'NetBanking', 'COD'),amount double,
    transaction_id char(12),payment_date date,payment_time time,payment_status enum('Success', 'Pending', 'Failed', 'Refunded'));

insert into payments value (9001, 5001, 'UPI', 75000.00,'TXN00000001A', '2026-10-08', '10:50:20', 'Success');

insert into payments value(9002, 5002, 'Card', 24999.99,'TXN00000002B', '2026-10-08', '11:35:10', 'Success');


-- Add 3 columns
ALTER TABLE payments
ADD COLUMN currency CHAR(3),
ADD COLUMN gateway VARCHAR(30),
ADD COLUMN refunded_amount DECIMAL(10,2);

-- Drop 1 column
ALTER TABLE payments
DROP COLUMN gateway;

-- Modify 1 column
ALTER TABLE payments
MODIFY COLUMN transaction_id CHAR(16);

-- Rename 2 columns
ALTER TABLE payments
RENAME COLUMN payment_date TO paid_date,
RENAME COLUMN amount TO payment_amount;

-- Check structure
DESC payments;

INSERT INTO payments VALUES(9006, 5006, 'UPI', 8999.99, 'TXN00000006A', '2026-10-09', '11:05:00', 'Success', 'INR', 0.00);

INSERT INTO payments VALUES(9007, 5007, 'Card', 35000.00, 'TXN00000007B', '2026-10-09', '11:35:00', 'Success', 'INR', 0.00);

INSERT INTO payments VALUES(9008, 5008, 'UPI', 4999.99, 'TXN00000008C', '2026-10-09', '12:05:00', 'Success', 'INR', 0.00),
(9009, 5009, 'COD', 1599.00, 'TXN00000009D','2026-10-09', '12:35:00', 'Pending', 'INR', 0.00);

INSERT INTO payments(payment_id, order_id, payment_method, payment_amount, payment_status, currency) VALUES(9010, 5010, 'UPI', 12000.00, 'Success', 'INR');

INSERT INTO payments(payment_id, order_id, payment_method, payment_amount, payment_status, currency)VALUES(9011, 5011, 'Card', 22000.00, 'Pending', 'INR');


INSERT INTO payments(payment_id, order_id, payment_method, payment_amount, payment_status, currency)VALUES(9012, 5012, 'NetBanking', 4500.00, 'Success', 'INR'),
(9013, 5013, 'UPI', 8500.00, 'Success', 'INR');

select * from payments;






create table employees (employee_id int,employee_name varchar(50),gender char(1),salary double,joining_date date,joining_time time,
    employee_type enum('Full-Time', 'Part-Time', 'Intern'),skills set('Java', 'C#', 'SQL', 'React', 'Python'),about_employee text );

insert into employees values(1, 'Arun', 'M', 45000.00, '2025-06-10','09:00:00', 'Full-Time','Java,SQL','Backend developer');

insert into employees values(2, 'Sneha', 'F', 55000.00, '2025-07-15','09:30:00', 'Full-Time','C#,SQL,React','Full stack developer');

-- Add 3 columns
ALTER TABLE employees
ADD COLUMN department VARCHAR(40),
ADD COLUMN work_location VARCHAR(50),
ADD COLUMN bonus DECIMAL(8,2);

-- Drop 1 column
ALTER TABLE employees
DROP COLUMN work_location;

-- Modify 1 column
ALTER TABLE employees
MODIFY COLUMN employee_name VARCHAR(80);

-- Rename 2 columns
ALTER TABLE employees
RENAME COLUMN joining_date TO hire_date,
RENAME COLUMN about_employee TO employee_description;

-- Check structure
DESC employees;

INSERT INTO employees VALUES(6, 'Kiran', 'M', 48000.00, '2026-02-10','09:00:00', 'Full-Time', 'C#,SQL','Backend developer for product APIs','Engineering', 5000.00);

INSERT INTO employees VALUES(7, 'Meera', 'F', 35000.00, '2026-04-15', '09:30:00', 'Intern', 'React,SQL', 'Frontend developer for the online store','Development', 2000.00);

INSERT INTO employees VALUES (8, 'Vijay', 'M', 60000.00, '2025-08-01', '08:45:00', 'Full-Time', 'Java,SQL,Python','Developer maintaining order processing','Engineering', 7500.00),
(9, 'Divya', 'F', 42000.00, '2026-01-20','10:00:00', 'Part-Time', 'React,SQL','Developer maintaining product pages','Development', 3000.00);

INSERT INTO employees(employee_id, employee_name, salary, employee_type, skills, department)VALUES(10, 'Ajay', 40000.00, 'Full-Time', 'C#,SQL', 'Engineering');

INSERT INTO employees(employee_id, employee_name, salary, employee_type, skills, department)VALUES(11, 'Nisha', 30000.00, 'Intern', 'Python,SQL', 'Analytics');

INSERT INTO employees(employee_id, employee_name, salary, employee_type, skills, department)VALUES(12, 'Ravi', 52000.00, 'Full-Time', 'Java,SQL', 'Engineering'),
(13, 'Pooja', 38000.00, 'Part-Time', 'React,SQL', 'Development');

select * from employees;