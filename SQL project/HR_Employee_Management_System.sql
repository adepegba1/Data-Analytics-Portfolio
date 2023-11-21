-- THE FIRST PROJECT IN MYSQL
-- Project Title: HR Employee Management System
-- Your task is to create a MySQL database for an HR Employee Management System. 
-- The system should store employee details, department information, and salary data.  
-- Your tasks include:
-- Designing the database schema for these entities.
create database hr_db;
use hr_db;
-- CREATE DEPARTMENT TABLE
-- Departments have details like department ID and department name. 
CREATE TABLE department(
Department_id int primary key  auto_increment,
Department_name varchar(100) not null);
-- INSERTING VALUES INTO DEPARTMENT TABLE
INSERT INTO department (department_name) VALUES
('Research & Development'),
('Sales'),
('Human Resources'),
('Marketing'),
('Finance');
-- CREATE EMPLOYEE TABLE
-- Each employee has details like employee ID, name, date of birth, department ID, and hire date.
CREATE TABLE employee(
Employee_id int primary key auto_increment,
Name varchar(100) not null,
DateOfBirth Date ,
Department_id int, foreign key (department_id) references department(department_id),
Hire_date Date);
ALTER TABLE employee
auto_increment = 1000;
-- INSERTING VALUES INTO EMPLOYEE TABLE
INSERT INTO employee (name, DateofBirth, Department_id, hire_date) VALUES 
('Babara MacCaffrey','1986-03-28',2,'2020-01-05'),
('Ines Brushfield','1986-04-13',4,'2020-01-05'),
('Freddi Boagey','1985-02-07',1,'2020-01-05'),
('Ambur Roseburgh','1974-04-14',3,'2020-01-05'),
('Clemmie Betchley','1973-11-07',5,'2020-01-05'),
('Elka Twiddell','1991-09-04',2,'2020-04-01'),
('Ilene Dowson','1964-08-30',1,'2020-05-07'),
('Thacher Naseby','1993-07-17',5,'2020-06-20'),
('Romola Rumgay','1992-05-23',3,'2020-10-25'),
('Levy Mynett','1969-10-13',4,'2020-11-30'),
('David Ayo','1991-01-20',1,'2023-11-11');
-- CREATE TABLE SALARY
-- Salary data includes employee ID, salary amount, and the date the salary was recorded.
CREATE TABLE salary(
Employee_id int, foreign key(employee_id) references employee(employee_id),
SalaryAmount int,
PaidDate Date);
-- INSERTING VALUES INTO SALARY TABLE
INSERT INTO salary VALUES
(1000,45000,'2020-02-05'),
(1001,40000,'2020-02-05'),
(1002,35000,'2020-02-05'),
(1003,30000,'2020-02-05'),
(1004,25000,'2020-02-05'),
(1005,50000,'2020-05-01'),
(1006,55000,'2020-06-07'),
(1007,60000,'2020-07-20'),
(1008,65000,'2020-11-25'),
(1009,70000,'2020-12-30'),
(1010,67000,'2023-11-11');

-- Writing SQL queries to perform the following actions:
-- a. Adding a new employee to the system.
USE hr_db;
INSERT INTO employee (name, Dateofbirth, department_id, hire_date) values
('David Fela', '1989-01-20', 5, current_date());
-- b. Updating an employee's department.
UPDATE employee
SET department_id = 4
WHERE employee_id = 1011;
-- c. Recording salary details for an employee.
INSERT INTO salary (employee_id, salaryAmount) values
(1011, 67000);
-- d. Finding the total number of employees in each department.
SELECT d.department_id, d.department_name, count(e.department_id)
FROM employee e
JOIN department d
ON d.Department_id = e.department_id
GROUP BY d.Department_id;
-- e. Retrieving the names of employees who joined in a specific year.
SELECT *
FROM employee
WHERE Hire_date like '2023%';

-- f. Calculating the average salary for a given department.
SELECT d.department_name, avg(salaryamount)
FROM department d
JOIN employee e
ON d.department_id = e.department_id
JOIN salary s
ON s.employee_id = e.employee_id
GROUP BY d.Department_name;

