create database student_db;

use student_db;

create table students (student_id int, registration_no varchar(50), student_name varchar(100), grade_level char(2), stream enum('Science', 'Commerce', 'Arts', 'Engineering', 'Medical'), clubs set('Sports', 'Music', 'Drama', 'Robotics', 'Debate'), enrollment_date date, last_updated datetime, is_graduated boolean);


INSERT INTO students (student_id, registration_no, student_name, grade_level, stream, clubs, enrollment_date, last_updated, is_graduated)
VALUES (1, '1CD22IS154', 'Sharon Jessy', 'BE', 'Engineering', 'Sports,Robotics', '2022-12-12', '2026-05-18 10:15:00', false);

select * from students;