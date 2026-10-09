create database weather_db;

use weather_db;

create table weather_report(report_id int, city_name varchar(50), temperature_c int, main_condition enum('Sunny', 'Rainy', 'Cloudy', 'Snowy', 'Stormy'), hazard_alerts set('High Wind', 'Flood Warning', 'Extreme Heat', 'Heavy Rain', 'Dense Fog'), report_date date, is_severe boolean);

insert into weather_report (report_id, city_name, temperature_c, main_condition, hazard_alerts, report_date, is_severe)
values (1, 'Bengaluru', 24, 'Rainy', 'Heavy Rain,Dense Fog', '2024-10-08', false);


ALTER TABLE weather_report ADD  humidity INT, ADD  wind_speed INT, ADD  observation_time TIME;

-- describe 
DESC weather_report;

ALTER TABLE weather_report DROP  observation_time; 

ALTER TABLE weather_report MODIFY  temperature_c DECIMAL(5,2);

ALTER TABLE weather_report RENAME COLUMN city_name TO city, RENAME COLUMN humidity TO humidity_percent;

INSERT INTO weather_report VALUES(3, 'Chennai', 31.50, 'Sunny', 'Extreme Heat', '2024-10-09', FALSE, 65, 12);
INSERT INTO weather_report VALUES(4, 'Delhi', 34.00, 'Cloudy', 'Dense Fog','2024-10-09', FALSE, 55, 10);

INSERT INTO weather_report VALUES (5, 'Hyderabad', 28.50, 'Rainy', 'Heavy Rain', '2024-10-09', TRUE, 78, 20),
(6, 'Kochi', 26.00, 'Rainy', 'Heavy Rain,Dense Fog','2024-10-09', TRUE, 85, 25);

INSERT INTO weather_report (report_id, city, temperature_c, main_condition) VALUES(7, 'Mysuru', 25.00, 'Cloudy');
INSERT INTO weather_report(report_id, city, temperature_c, main_condition)VALUES(8, 'Pune', 27.00, 'Sunny');

INSERT INTO weather_report (report_id, city, temperature_c, main_condition) VALUES (9, 'Kolkata', 30.00, 'Rainy'), 
(10, 'Jaipur', 35.00, 'Sunny');

select * from weather_report;



CREATE TABLE weather_station (station_id INT,station_name VARCHAR(50),location_code CHAR(6),latitude DECIMAL(8,5),longitude DECIMAL(8,5),installation_date DATE,operating_time TIME,is_active BOOLEAN);

INSERT INTO weather_station VALUES (101, 'Bengaluru Central', 'BLR001', 12.97160, 77.59460,'2023-06-15', '08:30:00', TRUE);

INSERT INTO weather_station VALUES (102, 'Mumbai Central', 'MUM001', 19.07600, 72.87770, '2022-04-20', '09:00:00', TRUE);

-- Add 3 columns
ALTER TABLE weather_station ADD  country VARCHAR(30), ADD  altitude_m INT, ADD  station_status VARCHAR(20);

-- Drop 1 column
ALTER TABLE weather_station DROP  station_status;

-- Modify 1 column
ALTER TABLE weather_station MODIFY  station_name VARCHAR(80);

-- Rename 2 columns
ALTER TABLE weather_station RENAME COLUMN location_code TO station_code, RENAME COLUMN operating_time TO daily_start_time;


INSERT INTO weather_station VALUES (103, 'Chennai Central', 'CHE001', 13.08270, 80.27070,'2023-08-10', '08:00:00', TRUE, 'India', 6);

INSERT INTO weather_station VALUES(104, 'Delhi Central', 'DEL001', 28.61390, 77.20900,'2022-11-12', '07:30:00', TRUE, 'India', 216),
 (105, 'Hyderabad Central', 'HYD001', 17.38500, 78.48670, '2023-02-18', '08:15:00', TRUE, 'India', 542);

INSERT INTO weather_station
(station_id, station_name, station_code, country) VALUES (106, 'Mysuru Station', 'MYS001', 'India');

INSERT INTO weather_station(station_id, station_name, station_code, country)VALUES(107, 'Pune Central', 'PUN001', 'India'),
(108, 'Kochi Central', 'KOC001', 'India');

SELECT * FROM weather_station;



CREATE TABLE rainfall_data ( rainfall_id INT, city_name VARCHAR(50), rainfall_mm DECIMAL(7,2), rainfall_type ENUM('Light', 'Moderate', 'Heavy', 'Very Heavy'), recorded_date DATE,recorded_time TIME,remarks TEXT);

INSERT INTO rainfall_data VALUES (201, 'Bengaluru', 45.75, 'Heavy', '2024-10-08', '14:30:00','Heavy rainfall reported in several areas');

INSERT INTO rainfall_data VALUES (202, 'Chennai', 18.50, 'Moderate', '2024-10-08', '16:15:00', 'Moderate rainfall during evening');

-- Add 3 columns
ALTER TABLE rainfall_data ADD  station_code CHAR(6), ADD  data_source VARCHAR(40), ADD  reviewer_name VARCHAR(50);

-- Drop 1 column
ALTER TABLE rainfall_data DROP  reviewer_name;

-- Modify 1 column
ALTER TABLE rainfall_data MODIFY  rainfall_mm DECIMAL(8,2);

-- Rename 2 columns
ALTER TABLE rainfall_data RENAME COLUMN city_name TO location_name, RENAME COLUMN recorded_time TO observation_time;


INSERT INTO rainfall_data VALUES (203, 'Mysuru', 32.75, 'Moderate', '2024-10-09','13:20:00', 'Steady rainfall recorded', 'MYS001', 'Weather Station');

INSERT INTO rainfall_data VALUES (204, 'Hyderabad', 62.40, 'Heavy', '2024-10-09','15:10:00', 'Heavy rain in several locations', 'HYD001', 'Rain Gauge'),
(205, 'Delhi', 8.25, 'Light', '2024-10-09','16:45:00', 'Light rainfall reported', 'DEL001', 'Weather Station');

INSERT INTO rainfall_data (rainfall_id, location_name, rainfall_mm, rainfall_type, station_code) VALUES (206, 'Pune', 21.50, 'Moderate', 'PUN001');

INSERT INTO rainfall_data (rainfall_id, location_name, rainfall_mm, rainfall_type, station_code) VALUES (207, 'Kochi', 75.25, 'Very Heavy', 'KOC001'),
(208, 'Chennai', 12.50, 'Light', 'CHE001');


SELECT * FROM rainfall_data;



CREATE TABLE weather_forecast (forecast_id INT, city_name VARCHAR(50),forecast_date DATE,expected_temperature DECIMAL(5,2),weather_condition ENUM('Sunny', 'Rainy', 'Cloudy', 'Snowy', 'Stormy'),
    expected_wind_speed INT,forecast_time DATETIME,alerts SET('High Wind', 'Flood Warning', 'Extreme Heat', 'Heavy Rain', 'Dense Fog'));
    
INSERT INTO weather_forecast VALUES (301, 'Bengaluru', '2024-10-09', 23.50, 'Rainy', 18, '2024-10-08 18:30:00', 'Heavy Rain,Dense Fog');

INSERT INTO weather_forecast VALUES (302, 'Delhi', '2024-10-09', 31.00, 'Sunny', 12, '2024-10-08 19:00:00', 'Extreme Heat');

-- Add 3 columns
ALTER TABLE weather_forecast ADD   humidity_percent INT, ADD  visibility_km DECIMAL(5,2), ADD  forecast_source VARCHAR(40);

-- Drop 1 column
ALTER TABLE weather_forecast DROP  forecast_source;

-- Modify 1 column
ALTER TABLE weather_forecast MODIFY  expected_wind_speed DECIMAL(5,2);

-- Rename 2 columns
ALTER TABLE weather_forecast RENAME COLUMN city_name TO location_name, RENAME COLUMN forecast_time TO generated_at;



CREATE TABLE weather_alert ( alert_id INT,city_name VARCHAR(50),alert_type ENUM('Flood', 'Storm', 'Heat Wave', 'Heavy Rain', 'Strong Wind'),alert_level ENUM('Low', 'Medium', 'High', 'Critical'),
    message VARCHAR(150),issued_date DATE,issued_at TIMESTAMP,is_active BOOLEAN );
    
INSERT INTO weather_alert VALUES (401, 'Bengaluru', 'Heavy Rain', 'High','Heavy rain expected in the next few hours','2024-10-08', '2024-10-08 15:30:00', TRUE);

INSERT INTO weather_alerts VALUES (402, 'Hyderabad', 'Strong Wind', 'Medium','Strong winds expected during evening','2024-10-08', '2024-10-08 16:00:00', TRUE);

