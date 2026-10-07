create database hr_db;

use hr_db;

create table employees (employee_id INT, tax_id BIGINT, full_name VARCHAR(100), dept_code CHAR(3), department ENUM('Engineering', 'Marketing', 'Finance', 'Human Resources', 'Sales'), skills SET('SQL', 'Python', 'Management', 'Communication', 'Design'), hire_date DATE, last_login DATETIME, is_full_time BOOLEAN);

insert into employees (employee_id, tax_id, full_name, dept_code, department, skills, hire_date, last_login, is_full_time)
values (1, 98765432101, 'Sarah Connor', 'ENG', 'Engineering', 'SQL,Python,Management', '2023-01-15', '2024-02-10 08:30:00', true);

select * from employees