CREATE DATABASE hotel_booking_db;

USE hotel_booking_db;

CREATE TABLE hotels (hotel_id INT,hotel_name VARCHAR(100),city VARCHAR(50),state VARCHAR(50),country VARCHAR(30),rating DECIMAL(2,1),hotel_type ENUM('Budget', 'Business', 'Luxury', 'Resort'),
    facilities SET('WiFi', 'Pool', 'Gym', 'Parking', 'Spa'),established_date DATE);
    
    
INSERT INTO hotels VALUES(1, 'Bengaluru Grand Hotel', 'Bengaluru','Karnataka', 'India', 4.5,'Luxury', 'WiFi,Pool,Gym,Parking,Spa', '2015-06-10');

INSERT INTO hotels VALUES (2, 'Karnataka Comfort Inn', 'Mysuru','Karnataka', 'India', 4.0,'Business', 'WiFi,Parking,Gym', '2018-03-15');

ALTER TABLE hotels ADD  contact_number VARCHAR(15),ADD  check_in_time TIME,ADD  is_verified BOOLEAN;

ALTER TABLE hotels DROP  is_verified;

ALTER TABLE hotels MODIFY  hotel_name VARCHAR(150);

ALTER TABLE hotels RENAME COLUMN city TO hotel_city, RENAME COLUMN state TO hotel_state;

DESC hotels;

INSERT INTO hotels VALUES(3, 'Mysuru Palace Hotel', 'Mysuru','Karnataka', 'India', 4.2, 'Luxury', 'WiFi,Pool,Parking', '2020-05-15', '9876543210', TRUE);

INSERT INTO hotels VALUES(4, 'Coorg Nature Resort', 'Madikeri','Karnataka', 'India', 4.7, 'Resort', 'WiFi,Pool,Spa,Parking','2019-08-20', '9876543211', TRUE);

INSERT INTO hotels VALUES(5, 'Ocean View Hotel', 'Mangaluru','Karnataka', 'India', 4.3, 'Business', 'WiFi,Parking','2021-03-10', '9876543212', TRUE),
(6, 'Green Valley Resort', 'Chikkamagaluru', 'Karnataka', 'India', 4.6,'Resort', 'WiFi,Spa,Parking', '2018-11-25', '9876543213', TRUE);

INSERT INTO hotels(hotel_id, hotel_name, hotel_city, rating)VALUES(7, 'Bengaluru City Inn', 'Bengaluru', 3.8);

INSERT INTO hotels(hotel_id, hotel_name, hotel_city, rating)VALUES(8, 'Mangaluru Beach Hotel', 'Mangaluru', 4.3);

INSERT INTO hotels(hotel_id, hotel_name, hotel_city, rating)VALUES(9, 'Hubballi Residency', 'Hubballi', 4.0),
(10, 'Belagavi Palace', 'Belagavi', 4.1);

SELECT * FROM hotels;



CREATE TABLE rooms (room_id INT,hotel_id INT,room_number CHAR(5),room_type ENUM('Single', 'Double', 'Deluxe', 'Suite'),price_per_night DECIMAL(10,2),
    floor_number INT,facilities SET('AC', 'TV', 'WiFi', 'Mini Bar', 'Balcony'),is_available BOOLEAN);
    
INSERT INTO rooms VALUES (101, 1, 'A101', 'Deluxe', 5500.00, 1,'AC,TV,WiFi,Balcony', TRUE);

INSERT INTO rooms VALUES (102, 1, 'A205', 'Suite', 9000.00, 2,'AC,TV,WiFi,Mini Bar,Balcony', TRUE);


-- Add 3 columns 
ALTER TABLE rooms ADD room_view VARCHAR(30), ADD  maintenance_cost DECIMAL(8,2),ADD  room_description VARCHAR(100);

-- Drop 1 column
ALTER TABLE rooms DROP  room_description;
 
-- Modify 1 column
ALTER TABLE rooms MODIFY  room_number VARCHAR(10);

-- Rename 2 columns
ALTER TABLE rooms RENAME COLUMN price_per_night TO nightly_price,
RENAME COLUMN is_available TO availability_status;


INSERT INTO rooms VALUES (103, 1, 'A301', 'Double', 4000.00, 3, 'AC,TV,WiFi', TRUE, 'City View', 500.00);

INSERT INTO rooms VALUES (104, 2, 'B401', 'Suite', 10000.00, 4, 'AC,TV,WiFi,Mini Bar,Balcony', TRUE, 'Garden View', 900.00);


INSERT INTO rooms VALUES (105, 1, 'A105', 'Single', 2500.00, 1,'AC,TV', TRUE, 'Street View', 300.00),
(106, 2, 'B202', 'Deluxe', 6000.00, 2,'AC,TV,WiFi,Balcony', FALSE, 'Pool View', 600.00);

INSERT INTO rooms(room_id, hotel_id, room_number, room_type, nightly_price) VALUES(107, 1, 'A501', 'Deluxe', 6500.00);

INSERT INTO rooms(room_id, hotel_id, room_number, room_type, nightly_price) VALUES(108, 2, 'B303', 'Double', 4200.00);


INSERT INTO rooms (room_id, hotel_id, room_number, room_type, nightly_price)
VALUES (109, 1, 'A601', 'Suite', 9500.00), (110, 2, 'B505', 'Single', 2800.00);

SELECT * FROM rooms;


CREATE TABLE guests (guest_id INT,guest_name VARCHAR(60),gender CHAR(1),email VARCHAR(100),phone BIGINT,city VARCHAR(50),country VARCHAR(30),registered_at DATETIME,
is_active BOOLEAN);

INSERT INTO guests VALUES(201, 'Sharon Jessy', 'F','sharon@gmail.com', 9876543210,'Bengaluru', 'India','2026-10-08 09:30:00', TRUE);

INSERT INTO guests VALUES (202, 'Rahul Kumar', 'M','rahul@gmail.com', 9876501234, 'Mysuru', 'India','2026-10-08 10:15:00', TRUE);


-- Add 3 columns
ALTER TABLE guests ADD  date_of_birth DATE, ADD  membership_type VARCHAR(30),ADD  loyalty_points INT;

-- Drop 1 column
ALTER TABLE guests DROP  membership_type;

-- Modify 1 column
ALTER TABLE guests MODIFY  phone VARCHAR(15);

-- Rename 2 columns
ALTER TABLE guests RENAME COLUMN guest_name TO full_name,
RENAME COLUMN registered_at TO registration_time;


INSERT INTO guests VALUES (203, 'Ananya Rao', 'F', 'ananya@gmail.com', '9876543211','Chennai', 'India', '2026-10-09 09:00:00', TRUE, '2002-05-12');

INSERT INTO guests VALUES(204, 'Vikram Singh', 'M', 'vikram@gmail.com', '9876543212','Hyderabad', 'India', '2026-10-09 09:30:00', TRUE, '2000-11-20');


INSERT INTO guests VALUES(205, 'Priya Nair', 'F', 'priya@gmail.com', '9876543213','Kochi', 'India', '2026-10-09 10:00:00', TRUE, '2001-07-15'),
(206, 'Arjun Kumar', 'M', 'arjun@gmail.com', '9876543214','Pune', 'India', '2026-10-09 10:30:00', FALSE, '1999-02-25');


INSERT INTO guests (guest_id, full_name, email, phone, city, country)VALUES (207, 'Meera Shah', 'meera@gmail.com', '9876543215','Mumbai', 'India');

INSERT INTO guests (guest_id, full_name, email, phone, city, country)VALUES (208, 'Kiran Das', 'kiran@gmail.com', '9876543216', 'Delhi', 'India');


INSERT INTO guests (guest_id, full_name, email, phone, city, country) VALUES (209, 'Rohan Patil', 'rohan@gmail.com', '9876543217', 'Nagpur', 'India'),
(210, 'Divya Shetty', 'divya@gmail.com', '9876543218','Mangaluru', 'India');

SELECT * FROM guests;


CREATE TABLE restaurants (restaurant_id INT,restaurant_name VARCHAR(100),hotel_name VARCHAR(100),cuisine ENUM('Indian', 'Chinese', 'Italian', 'Continental'),seating_capacity INT,
    average_price DECIMAL(8,2),opening_time TIME,closing_time TIME,features SET('AC', 'Buffet', 'Outdoor Seating', 'Live Music'),is_open BOOLEAN);


INSERT INTO restaurants VALUES(301, 'Spice Garden', 'Bengaluru Grand Hotel','Indian', 120, 850.00,'07:00:00', '23:00:00', 'AC,Buffet,Outdoor Seating', TRUE);

INSERT INTO restaurants VALUES(302, 'Royal Kitchen', 'Karnataka Comfort Inn','Chinese', 80, 650.00,'11:00:00', '22:30:00','AC,Outdoor Seating', TRUE);


-- Add 3 columns
ALTER TABLE restaurants ADD  outdoor_area BOOLEAN, ADD  delivery_available BOOLEAN, ADD  manager_name VARCHAR(60);

-- Drop 1 column
ALTER TABLE restaurants DROP  manager_name;

-- Modify 1 column
ALTER TABLE restaurants MODIFY  restaurant_name VARCHAR(120);

-- Rename 2 columns
ALTER TABLE restaurants
RENAME COLUMN average_price TO avg_price,
RENAME COLUMN is_open TO currently_open;


INSERT INTO restaurants VALUE(303, 'Coastal Spice', 'Ocean View Hotel', 'Indian',100, 750.00, '07:30:00', '22:30:00','AC,Buffet', TRUE, TRUE, TRUE);

INSERT INTO restaurants VALUES(304, 'Dragon Palace', 'City Comfort Hotel', 'Chinese',70, 600.00, '11:00:00', '22:00:00','AC,Live Music', TRUE, FALSE, TRUE);


INSERT INTO restaurants VALUES(305, 'Bella Italia', 'Grand Residency', 'Italian', 60, 950.00, '12:00:00', '23:00:00','AC,Outdoor Seating', TRUE, TRUE, FALSE),
(306, 'Garden Feast', 'Green Valley Resort', 'Continental', 90, 800.00, '08:00:00', '22:00:00', 'Buffet,Outdoor Seating,Live Music', TRUE, TRUE, TRUE);


INSERT INTO restaurants (restaurant_id, restaurant_name, cuisine, avg_price) VALUES(307, 'Spice Corner', 'Indian', 500.00);

INSERT INTO restaurants (restaurant_id, restaurant_name, cuisine, avg_price) VALUES(308, 'Noodle House', 'Chinese', 550.00);


INSERT INTO restaurants (restaurant_id, restaurant_name, cuisine, avg_price) VALUES(309, 'Pasta Garden', 'Italian', 900.00),
(310, 'Sunrise Cafe', 'Continental', 450.00);

SELECT * FROM restaurants;



CREATE TABLE bookings (booking_id INT,guest_id INT,hotel_name VARCHAR(100),room_type ENUM('Single', 'Double', 'Deluxe', 'Suite'),check_in DATE,check_out DATE,
    guests_count INT,total_amount DECIMAL(10,2),booking_status ENUM('Confirmed', 'Pending', 'Cancelled', 'Completed'),booked_at TIMESTAMP);
    
    
INSERT INTO bookings VALUES(401, 201, 'Bengaluru Grand Hotel','Deluxe', '2026-10-10', '2026-10-12', 2, 11000.00,'Confirmed','2026-10-08 11:30:00');

INSERT INTO bookings VALUES (402, 202, 'Karnataka Comfort Inn', 'Double','2026-10-15', '2026-10-17',2, 7000.00,'Pending', '2026-10-08 12:15:00');

-- Add 3 columns
ALTER TABLE bookings ADD  special_requests VARCHAR(150), ADD  payment_method VARCHAR(30), ADD  discount_amount DECIMAL(8,2);

-- Drop 1 column
ALTER TABLE bookings DROP  payment_method;

-- Modify 1 column
ALTER TABLE bookings MODIFY  total_amount DECIMAL(12,2);

-- Rename 2 columns
ALTER TABLE bookings RENAME COLUMN hotel_name TO booked_hotel_name,
RENAME COLUMN booked_at TO booking_timestamp;


INSERT INTO bookings VALUES(403, 203, 'Ocean View Hotel', 'Deluxe', '2026-10-20', '2026-10-22', 2, 12000.00, 'Confirmed', '2026-10-13 09:00:00','Late check-in requested', 500.00);

INSERT INTO bookings VALUES(404, 204, 'Green Valley Resort', 'Suite', '2026-10-22', '2026-10-25', 3, 27000.00,'Pending', '2026-10-13 09:30:00','Garden-facing room preferred', 1000.00);


INSERT INTO bookings VALUES(405, 205, 'Grand Residency', 'Double', '2026-10-25', '2026-10-27', 2, 8000.00, 'Confirmed', '2026-10-13 10:00:00', 'Extra pillows required', 300.00),
(406, 206, 'City Comfort Hotel', 'Single','2026-10-28', '2026-10-29', 1, 2500.00,'Pending', '2026-10-13 10:30:00','Non-smoking room requested', 0.00);


INSERT INTO bookings(booking_id, guest_id, booked_hotel_name, room_type, check_in, check_out, guests_count, total_amount)
VALUES (407, 207, 'Bengaluru Grand Hotel', 'Deluxe', '2026-11-01', '2026-11-03', 2, 11000.00);

INSERT INTO bookings (booking_id, guest_id, booked_hotel_name, room_type,check_in, check_out, guests_count, total_amount)
VALUES (408, 208, 'Karnataka Comfort Inn', 'Double','2026-11-05', '2026-11-07', 2, 7000.00);


INSERT INTO bookings(booking_id, guest_id, booked_hotel_name, room_type,check_in, check_out, guests_count, total_amount)
VALUES (409, 209, 'Ocean View Hotel', 'Suite', '2026-11-10', '2026-11-12', 3, 18000.00),
(410, 210, 'Green Valley Resort', 'Single','2026-11-15', '2026-11-16', 1, 3000.00);


SELECT * FROM bookings;