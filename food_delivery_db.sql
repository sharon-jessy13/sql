CREATE DATABASE food_delivery_db;

USE food_delivery_db;


CREATE TABLE Customers (id INT PRIMARY KEY,customer_name VARCHAR(50) NOT NULL,phone VARCHAR(15) UNIQUE, address text );

INSERT INTO Customers VALUES (1, 'Sharon', '9876500001', 'K R Puram, Bengaluru'), (2, 'Jessy', '9876500002', 'Whitefield,Bengaluru'); 

-- update all rows
UPDATE Customers SET customer_name = 'SHARON JESSY';

-- update particular row
UPDATE Customers SET customer_name = 'SHARA' where id = 2;

-- Delele all values 
DELETE from Customers;

-- delete particular value

DELETE from Customers where id = 2;

SET autocommit = 0;

INSERT INTO Customers VALUES (3, 'Akhil', '9876500004', 'Chennai');

INSERT INTO Customers VALUES (4, 'Sneha', '9876500005', 'Hyderabad');

UPDATE Customers SET address = 'Pune' WHERE customer_id = 1;

DELETE FROM Customers WHERE customer_id = 3;

rollback;

commit;

CREATE TABLE Customer_Orders (order_id INT PRIMARY KEY,customer_id INT,order_date DATE,total_amount DECIMAL(10,2),payment_status VARCHAR(20),
    FOREIGN KEY (customer_id) REFERENCES Customers(id));

    
INSERT INTO Customer_Orders VALUES (1001, 1, '2026-10-14', 450.00, 'Paid'), (1002, 2, '2026-10-14', 299.00, 'Pending');



CREATE TABLE Restaurants (id INT PRIMARY KEY,restaurant_name VARCHAR(100) NOT NULL,platform VARCHAR(20),location VARCHAR(100));

INSERT INTO Restaurants VALUES (101, 'Empire Restaurant', 'Swiggy', 'Bengaluru'), (102, 'Pizza House', 'Zomato', 'Bengaluru');

UPDATE Restaurants SET restaurant_name = 'Nandana palace';

UPDATE Restaurants SET restaurant_name = 'meghana foods' where id = 2;

DELETE from Restaurants;

DELETE from Restaurants where id = 102;

SET autocommit = 0;

INSERT INTO Restaurants VALUES (103, 'Dosa Corner', 'Zomato', 'Bengaluru');

INSERT INTO Restaurants VALUES (104, 'Food Palace', 'Swiggy', 'Mysuru');

UPDATE Restaurants SET location = 'Hubli' WHERE restaurant_id = 102;

DELETE FROM Restaurants WHERE restaurant_id = 103;

ROLLBACK;

COMMIT;

CREATE TABLE Restaurant_Menu ( item_id INT PRIMARY KEY,restaurant_id INT,item_name VARCHAR(100) NOT NULL,price DECIMAL(8,2), category VARCHAR(30),
    FOREIGN KEY (restaurant_id)REFERENCES Restaurants(id));

INSERT INTO Restaurant_Menu VALUES (501, 101, 'Chicken Biryani', 250.00, 'Main Course'), (502, 102, 'Margherita Pizza', 299.00, 'Pizza');





CREATE TABLE Delivery_Partners (id INT PRIMARY KEY,delivery_name VARCHAR(50) NOT NULL,phone VARCHAR(15) UNIQUE,vehicle_number VARCHAR(20));

INSERT INTO Delivery_Partners VALUES (201, 'Arun', '9876510001', 'KA01AB1234'), (202, 'Kiran', '9876510002', 'KA09CD5678');

SET autocommit = 0;

UPDATE Delivery_Partners SET delivery_name = 'abc';

UPDATE Delivery_Partners SET delivery_name = 'xyz' where id = 201;

DELETE from Delivery_Partners;

DELETE from Delivery_Partners where id = 202;

ROLLBACK;

COMMIT;

CREATE TABLE Delivery_Tracking ( tracking_id INT PRIMARY KEY, delivery_id INT,order_id INT,delivery_status VARCHAR(30),estimated_minutes INT,
    FOREIGN KEY (delivery_id) REFERENCES Delivery_Partners(id));
    
INSERT INTO Delivery_Tracking VALUES (9001, 201, 1001, 'Delivered', 30), (9002, 202, 1002, 'On the way', 15);
