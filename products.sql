create database e_commerce;

use e_commerce;

create table products(product_id int, name varchar(50),model_id int, price double,brand varchar(50),category enum("Electronics","Appliances","Accessories"), manufacture_date date, is_available boolean, features set('Wireless', 'Bluetooth', 'Waterproof', 'Touchscreen') )


INSERT INTO products (product_id, name, model_id, price, brand,category, manufacture_date, is_available, features)
VALUES (1, 'mobile',123 , 25000.00, 'Samsung','Electronics', '2026-10-07', true,'Touchscreen,Bluetooth' );

select * from products;
