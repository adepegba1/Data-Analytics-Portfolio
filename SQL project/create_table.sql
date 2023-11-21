-- CREATING A TABLE USING MYSQL 
CREATE DATABASE store_id;
USE store_id;

CREATE TABLE customer(
customer_id int primary key not null,
first_name varchar(45) not null,
city varchar(45) not null,
gender varchar(45) not null);

INSERT INTO customer values
(1, 'John', 'Lagos', 'Male'),
(2, 'Peter', 'Lagos', 'Male'),
(3, 'Mike', 'Ibadan', 'Male'),
(4, 'Kemi', 'Lagos', 'Female'),
(5, 'Tola', 'Lagos', 'Female'),
(6, 'Seun', 'Lagos', 'Female');

CREATE TABLE orders(
order_id int primary key not null,
price int not null,
quantity int not null,
discount float not null);

INSERT INTO orders values
(1, 100, 5, 3.2),
(2, 200, 5, 1.7),
(3, 200, 6, 1.8),
(4, 100, 3, 1.9),
(5, 200, 2, 1.0),
(6, 100, 1, 1.7);