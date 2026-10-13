CREATE DATABASE aadhar_db;

USE aadhar_db;

-- Constraints - rules nd regulations
-- not null - values should not be null
-- unique - values can not be duplication, can be null
-- primary key - combination of not null and unique
-- check - checks the condition 
-- default - gives the default values , if we not given any values
-- foreign key - it should be primary key in some other table , can be null and duplicate  



CREATE TABLE aadhar_details ( id CHAR(12) PRIMARY KEY, name VARCHAR(100) NOT NULL,age INT CHECK (age >= 18 AND age <= 100), 
    phone_number VARCHAR(15) UNIQUE,email VARCHAR(100) CHECK (email LIKE '%@gmail.com'),country VARCHAR(50) DEFAULT 'India' );
    
    
INSERT INTO aadhar_details VALUES (987654321012, 'SHARON', 21, '9870123456', 'sharon@gmail.com', 'India');
    

INSERT INTO aadhar_details(id, name, age, phone_number, email) 
VALUES (987654321013, 'JESSY', 18, '1234567890', 'jessy@gmail.com');
    
    
SET autocommit = 0;

INSERT INTO aadhar_details VALUES (987654321055, 'SHARON JESSY', 21, '1234578960', 'sharonjessy@gmail.com', 'India');

rollback;

commit;

SELECT * FROM aadhar_details;


CREATE TABLE adress_details (id INT PRIMARY KEY, house_name VARCHAR(50), city VARCHAR(25), aadhar_id CHAR(12),
FOREIGN KEY (aadhar_id) REFERENCES aadhar_details(id));

INSERT INTO adress_details VALUES (1, 'abc', 'Bengaluru', '987654321012');

INSERT INTO adress_details(id, house_name, city) VALUES (2, 'abc', 'Bengaluru');

SELECT * FROM adress_details;


-- TCL - transaction control language 
-- commit -- permanent save in db 

-- rollback  -- after doing change , dont want to save permanently in db
