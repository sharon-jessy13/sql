create database library_db;

use library_db;

create table library_books (book_id int, isbn bigint, title varchar(100), language_code char(3), genre enum('Fiction', 'Non-Fiction', 'Science', 'History', 'Biography'), features set('Hardcover', 'Illustrated', 'Audiobook', 'E-Book', 'Signed Copy'), publish_date date, added_at datetime, is_borrowed boolean);

insert into library_books (book_id, isbn, title, language_code, genre, features, publish_date, added_at, is_borrowed)
value (2, 9788173711466, 'Wings of Fire', 'ENG', 'Biography', 'Audiobook,E-Book', '1999-01-01', '2024-01-15 11:30:00', true);

select * from library_books;
