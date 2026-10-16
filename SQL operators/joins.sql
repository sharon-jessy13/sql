USE ShoppingMallDB;

CREATE TABLE Customers (customer_id INT PRIMARY KEY,customer_name VARCHAR(100),city VARCHAR(50),phone VARCHAR(15));

INSERT INTO Customers VALUES (101, 'Sharon', 'Bengaluru', '9876543210'),
(102, 'Jessy', 'Mysuru', '9876543211'),
(103, 'Priya', 'Bengaluru', '9876543212'),
(104, 'John', 'Chennai', '9876543213'),
(105, 'Anu', 'Mysuru', '9876543214');

