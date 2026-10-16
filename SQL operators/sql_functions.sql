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

