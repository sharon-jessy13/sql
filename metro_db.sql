CREATE DATABASE metro_db;

USE metro_db;


CREATE TABLE stations (station_id INT,station_name VARCHAR(60),station_code CHAR(5),city VARCHAR(50),state VARCHAR(50),country VARCHAR(30),
    station_type ENUM('Underground', 'Elevated', 'Ground'),facilities SET('Lift', 'Escalator', 'Parking', 'Toilet'),opened_date DATE );
    
INSERT INTO stations VALUES(1, 'Majestic', 'NAD01', 'Bengaluru','Karnataka', 'India', 'Underground', 'Lift,Escalator,Parking,Toilet', '2017-06-17');

INSERT INTO stations VALUES(2, 'Yeshwanthpur', 'YSP01', 'Bengaluru','Karnataka', 'India', 'Elevated','Lift,Escalator,Parking', '2014-01-01');



-- Add 3 columns
ALTER TABLE stations ADD  platform_count INT, ADD  daily_passengers INT, ADD  station_manager VARCHAR(60);

-- Drop 1 column
ALTER TABLE stations DROP station_manager;

-- Modify 1 column
ALTER TABLE stations MODIFY  station_name VARCHAR(100);

-- Rename 2 columns
ALTER TABLE stations RENAME COLUMN station_code TO station_identifier,
RENAME COLUMN opened_date TO inauguration_date;


INSERT INTO stations VALUES(3, 'Indiranagar', 'IND01', 'Bengaluru', 'Karnataka','India', 'Elevated', 'Lift,Escalator,Parking','2011-10-20', 2, 25000);

INSERT INTO stations VALUES (4, 'Cubbon Park', 'CUB01', 'Bengaluru', 'Karnataka', 'India', 'Underground', 'Lift,Escalator,Toilet', '2017-06-17', 2, 30000);

INSERT INTO stations VALUES (5, 'Banashankari', 'BAN01', 'Bengaluru', 'Karnataka','India', 'Elevated', 'Lift,Parking,Toilet','2017-06-17', 3, 22000),
(6, 'Peenya', 'PEN01', 'Bengaluru', 'Karnataka','India', 'Elevated', 'Escalator,Parking','2014-03-01', 2, 18000);

INSERT INTO stations (station_id, station_name, station_identifier, city, station_type) VALUES (7, 'Mysuru Road', 'MYS01', 'Bengaluru', 'Elevated');

INSERT INTO stations (station_id, station_name, station_identifier, city, station_type) VALUES (8, 'Jayanagar', 'JAY01', 'Bengaluru', 'Underground');


INSERT INTO stations(station_id, station_name, station_identifier, city, station_type)
VALUES(9, 'Trinity', 'TRI01', 'Bengaluru', 'Elevated'),(10, 'Halasuru', 'HAL01', 'Bengaluru', 'Underground');

SELECT * FROM stations;


CREATE TABLE metro_trains (train_id INT,train_number CHAR(6),line_name VARCHAR(50),manufacturer VARCHAR(50),capacity INT,speed_kmph DECIMAL(5,2),train_type ENUM('Regular', 'Express'),
    facilities SET('AC', 'WiFi', 'CCTV', 'Charging'),is_operational BOOLEAN);
    
INSERT INTO metro_trains VALUES(101, 'BLR001', 'Purple Line', 'BEML',1500, 80.00, 'Regular','AC,CCTV,Charging', TRUE);

INSERT INTO metro_trains VALUES (102, 'BLR002', 'Green Line', 'BEML',1400, 75.00, 'Regular','AC,CCTV,WiFi', TRUE);


-- Add 3 columns
ALTER TABLE metro_trains ADD  manufacture_year INT, ADD  maintenance_date DATE, ADD  depot_name VARCHAR(50);

-- Drop 1 column
ALTER TABLE metro_trains DROP  depot_name;

-- Modify 1 column
ALTER TABLE metro_trains MODIFY  manufacturer VARCHAR(80);

-- Rename 2 columns
ALTER TABLE metro_trains RENAME COLUMN speed_kmph TO maximum_speed_kmph,
RENAME COLUMN is_operational TO operational_status;


INSERT INTO metro_trains VALUES(103, 'BLR003', 'Purple Line', 'BEML', 1500, 80.00,'Regular', 'AC,CCTV,WiFi', TRUE, 2023, '2026-09-15');

INSERT INTO metro_trains VALUES (104, 'BLR004', 'Green Line', 'BEML', 1400, 75.00,  'Express', 'AC,WiFi,Charging', TRUE, 2024, '2026-08-20');


INSERT INTO metro_trains VALUES (105, 'BLR005', 'Yellow Line', 'BEML', 1450, 78.00,'Regular', 'AC,CCTV,Charging', TRUE, 2025, '2026-09-01'),
(106, 'BLR006', 'Blue Line', 'BEML', 1600, 85.00, 'Express', 'AC,WiFi,CCTV,Charging', FALSE, 2025, '2026-07-10');


INSERT INTO metro_trains (train_id, train_number, line_name, manufacturer, capacity) VALUES (107, 'BLR007', 'Purple Line', 'BEML', 1500);

INSERT INTO metro_trains (train_id, train_number, line_name, manufacturer, capacity) VALUES (108, 'BLR008', 'Green Line', 'BEML', 1400);


INSERT INTO metro_trains (train_id, train_number, line_name, manufacturer, capacity) VALUES
(109, 'BLR009', 'Yellow Line', 'BEML', 1450), (110, 'BLR010', 'Blue Line', 'BEML', 1600);

SELECT * FROM metro_trains;



CREATE TABLE routes (route_id INT,route_name VARCHAR(100),starting_station VARCHAR(60),ending_station VARCHAR(60),distance_km DECIMAL(6,2),estimated_time TIME,
    line_color ENUM('Purple', 'Green', 'Yellow', 'Blue'),is_active BOOLEAN);
    

INSERT INTO routes VALUES (201, 'Purple Line Route','Whitefield', 'Challaghatta',25.70, '01:10:00', 'Purple', TRUE);

INSERT INTO routes VALUES (202, 'Green Line Route','Nagasandra', 'Silk Institute',30.40, '01:20:00', 'Green', TRUE);  



-- Add 3 columns
ALTER TABLE routes ADD  route_operator VARCHAR(50),
ADD  station_count INT,
ADD  route_description TEXT;

-- Drop 1 column
ALTER TABLE routes DROP  route_description;

-- Modify 1 column
ALTER TABLE routes MODIFY  route_name VARCHAR(150);

-- Rename 2 columns
ALTER TABLE routes
RENAME COLUMN distance_km TO route_distance_km,
RENAME COLUMN estimated_time TO journey_duration;



INSERT INTO routes VALUES (203, 'Yellow Line Route', 'Rashtreeya Vidyalaya Road','Bommasandra', 18.80, '00:45:00', 'Yellow', TRUE,'BMRCL', 16);

INSERT INTO routes VALUES (204, 'Blue Line Route', 'Central Silk Board', 'Kempegowda International Airport', 58.10, '01:30:00','Blue', TRUE, 'BMRCL', 30);


INSERT INTO routes VALUES(205, 'Purple Line Extension', 'Whitefield','Challaghatta', 25.70, '01:10:00', 'Purple', TRUE,'BMRCL', 22),
(206, 'Green Line Extension', 'Nagasandra','Silk Institute', 30.40, '01:20:00', 'Green', TRUE,'BMRCL', 30);


INSERT INTO routes (route_id, route_name, starting_station, ending_station,route_distance_km, line_color) VALUES (207, 'City Connector Route', 'Majestic', 'Indiranagar', 12.50, 'Purple');

INSERT INTO routes (route_id, route_name, starting_station, ending_station, route_distance_km, line_color) VALUES (208, 'Southern Connector Route', 'Jayanagar', 'Banashankari', 8.20, 'Green');


INSERT INTO routes(route_id, route_name, starting_station, ending_station,route_distance_km, line_color) VALUES (209, 'North Connector Route', 'Peenya', 'Yeshwanthpur',9.50, 'Green'), 
(210, 'Airport Connector Route', 'Hebbal', 'Airport',22.00, 'Blue');

SELECT * FROM routes;


  
CREATE TABLE passengers (passenger_id INT,passenger_name VARCHAR(50),gender CHAR(1),city VARCHAR(50),state VARCHAR(50),card_type ENUM('Regular', 'Student', 'Senior Citizen'),
    balance DECIMAL(8,2),registered_date DATE,is_active BOOLEAN);
    
INSERT INTO passengers VALUES (301, 'Sharon', 'F', 'Bengaluru', 'Karnataka', 'Student', 500.00,'2026-08-01', TRUE);

INSERT INTO passengers VALUES (302, 'Arun', 'M', 'Mysuru','Karnataka', 'Regular', 750.50, '2026-07-20', TRUE);


-- Add 3 columns
ALTER TABLE passengers ADD  age INT, ADD  emergency_contact VARCHAR(15), ADD  membership_level VARCHAR(30);

-- Drop 1 column
ALTER TABLE passengers DROP  membership_level;

-- Modify 1 column
ALTER TABLE passengers MODIFY  passenger_name VARCHAR(80);

-- Rename 2 columns
ALTER TABLE passengers RENAME COLUMN balance TO wallet_balance,
RENAME COLUMN registered_date TO registration_date;


INSERT INTO passengers VALUES (303, 'Priya Sharma', 'F', 'Chennai', 'Tamil Nadu', 'Student', 650.00, '2026-08-15', TRUE, 21, '9876543211');

INSERT INTO passengers VALUES (304, 'Rahul Verma', 'M', 'Hyderabad', 'Telangana','Regular', 850.50, '2026-08-20', TRUE, 28, '9876543212');


INSERT INTO passengers VALUES (305, 'Ananya Rao', 'F', 'Mysuru', 'Karnataka','Student', 400.00, '2026-09-01', TRUE, 22, '9876543213'),
(306, 'Vikram Singh', 'M', 'Pune', 'Maharashtra', 'Senior Citizen', 900.00, '2026-09-05', TRUE, 65, '9876543214');


INSERT INTO passengers (passenger_id, passenger_name, gender, city, card_type, wallet_balance) VALUES (307, 'Meera Nair', 'F', 'Kochi', 'Regular', 550.00);

INSERT INTO passengers (passenger_id, passenger_name, gender, city, card_type, wallet_balance) VALUES (308, 'Arjun Das', 'M', 'Delhi', 'Student', 300.00);


INSERT INTO passengers (passenger_id, passenger_name, gender, city, card_type, wallet_balance) VALUES (309, 'Kiran Kumar', 'M', 'Bengaluru', 'Regular', 700.00),
(310, 'Divya Shetty', 'F', 'Mangaluru', 'Student', 450.00);

SELECT * FROM passengers;

    
 CREATE TABLE metro_trips (trip_id INT,passenger_id INT,boarding_station VARCHAR(60),destination_station VARCHAR(60),travel_date DATE,boarding_time TIME,fare DECIMAL(6,2),
    payment_method ENUM('Cash', 'UPI', 'Card', 'Metro Card'),status ENUM('Completed', 'Cancelled', 'In Progress'));  
    
    
INSERT INTO metro_trips VALUES(401, 301, 'Majestic', 'Whitefield', '2026-10-08', '09:15:00', 45.00, 'Metro Card', 'Completed');

INSERT INTO metro_trips VALUES (402, 302, 'Yeshwanthpur', 'Majestic','2026-10-08', '10:30:00', 30.00,'UPI', 'Completed');


-- Add 3 columns
ALTER TABLE metro_trips ADD  ticket_number CHAR(12), ADD  travel_mode VARCHAR(30), ADD  trip_notes VARCHAR(100);

-- Drop 1 column
ALTER TABLE metro_trips DROP  trip_notes;

-- Modify 1 column
ALTER TABLE metro_trips MODIFY fare DECIMAL(8,2);

-- Rename 2 columns
ALTER TABLE metro_trips
RENAME COLUMN boarding_station TO origin_station,
RENAME COLUMN destination_station TO destination_station_name;


INSERT INTO metro_trips VALUES (403, 303, 'Majestic', 'Indiranagar', '2026-10-09','09:00:00', 35.00, 'Metro Card', 'Completed','TKT000000403', 'Metro');

INSERT INTO metro_trips VALUES (404, 304, 'Yeshwanthpur', 'Majestic', '2026-10-09', '10:15:00', 30.00, 'UPI', 'Completed','TKT000000404', 'Metro');


INSERT INTO metro_trips VALUES (405, 305, 'Banashankari', 'Majestic', '2026-10-10','08:30:00', 40.00, 'Card', 'Completed','TKT000000405', 'Metro'),
(406, 306, 'Peenya', 'Yeshwanthpur', '2026-10-10', '11:00:00', 25.00, 'Cash', 'Cancelled','TKT000000406', 'Metro');


INSERT INTO metro_trips (trip_id, passenger_id, origin_station, destination_station_name, fare, payment_method, status) VALUES (407, 307, 'Majestic', 'Cubbon Park', 20.00,'UPI', 'Completed');

INSERT INTO metro_trips (trip_id, passenger_id, origin_station, destination_station_name, fare, payment_method, status) VALUES (408, 308, 'Indiranagar', 'Trinity', 25.00,'Card', 'In Progress');


INSERT INTO metro_trips (trip_id, passenger_id, origin_station, destination_station_name, fare, payment_method, status)
VALUES (409, 309, 'Majestic', 'Mysuru Road', 35.00, 'Metro Card', 'Completed'),(410, 310, 'Cubbon Park', 'Trinity', 20.00, 'Cash', 'Completed');


SELECT * FROM metro_trips;

    
    
    
    
    