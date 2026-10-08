create database weather_db;

use weather_db;

create table weather_report(report_id int, city_name varchar(50), temperature_c int, main_condition enum('Sunny', 'Rainy', 'Cloudy', 'Snowy', 'Stormy'), hazard_alerts set('High Wind', 'Flood Warning', 'Extreme Heat', 'Heavy Rain', 'Dense Fog'), report_date date, is_severe boolean);

insert into weather_report (report_id, city_name, temperature_c, main_condition, hazard_alerts, report_date, is_severe)
values (1, 'Bengaluru', 24, 'Rainy', 'Heavy Rain,Dense Fog', '2024-10-08', false);

select * from weather_report;