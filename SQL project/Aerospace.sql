/* Create a database for the new company called AeroSpace. This comapny want to start business in airline
from one country to the other. The database should store the following:
Customers: PassportNumber, First Name, Last Name, Gender, Age, Nationality
Employee:EmployeeID, First Name,	Last Name, Gender, Age, Hire Date
Salary:EmployeID, Job title, Amount
Flight: FlightID, PlaneId, Airport Country Name, Departure Date, Arrival Country Name, PassportNumber, EmployeeID, StatusId, DurationsInMinutes
Status: StatusId, Status Name
Plane: PlaneID, PlaneName, PlaneStatus
Accounting: Flight_fare, salary, flightId, profit/loss */

CREATE DATABASE aerospace;
USE aerospace;  

 -- create table for Plane details include planeID, PlaneName, PlaneStatus
 CREATE TABLE Plane(
 PlaneID INT PRIMARY KEY NOT NULL,
 PlaneName VARCHAR(150) NOT NULL,
 PlaneStatus VARCHAR(100) NOT NULL);

-- creating Table for customers details include PassportNumber, First Name, Last Name, Gender, Age, Nationality
CREATE TABLE Customers(
PassportNumber VARCHAR(50) PRIMARY KEY NOT NULL,
First_name VARCHAR(50),
Last_name VARCHAR(50),
Gender VARCHAR(10),
Age INT,
Nationality VARCHAR(70) NOT NULL);

-- creating table for Employee details include EmployeeID,	First Name,	Last Name, Gender, Age, Hire Date 
 CREATE TABLE Employees(
 EmployeeId Int PRIMARY KEY NOT NULL AUTO_INCREMENT,
 First_name VARCHAR(50),
 Last_name VARCHAR(50),
 Gender VARCHAR(10),
 Age INT,
 HireDate DATE NOT NULL);
 -- altering the auto increment to start with 2221
 ALTER TABLE employees
 AUTO_INCREMENT = 2221;
 
 -- creating table for Salary details include EmployeID, Job title, Amount
 CREATE TABLE Salaries(
 EmployeeId INT, FOREIGN KEY (employeeId) REFERENCES Employees(EmployeeId),
 JobTitle VARCHAR(100) NOT NULL,
 Amount INT );
 
  -- create table for Status details include statusId, Status Name
 CREATE TABLE Status(
 StatusId INT PRIMARY KEY NOT NULL,
 StatusName VARCHAR(25) NOT NULL);
 
 -- creating table for Flight details include flightID, PlaneId, Airport Country Name, Departure Date, Arrival Country Name, PassportNumber, EmployeeID, StatusId,  DurationsInMinutes
 CREATE TABLE Flights(
 FlightId INT PRIMARY KEY NOT NULL,
 PlaneId INT, FOREIGN KEY (PlaneId) REFERENCES Plane(PlaneId),
 AirportCountryName VARCHAR(100) NOT NULL,
 DepartureDate DATE NOT NULL,
 ArrivalCountryName VARCHAR(100) NOT NULL,
 PassportNumber VARCHAR(50), FOREIGN KEY (passportNumber) REFERENCES Customers(passportNumber),
 EmployeeId INT, FOREIGN KEY (EmployeeId) REFERENCES Employees(EmployeeId),
 StatusID INT, FOREIGN KEY (StatusId) REFERENCES Status(statusID),
 DurationsInMinutes INT NOT NULL);

  -- Creating table for Accounting details include flight_fare, salary, flightId, profit/loss
 CREATE TABLE Accounting(
 FlightId INT, FOREIGN KEY (FlightId) REFERENCES Flights(FlightId),
 FlightFare DECIMAL NOT NULL,
 TotalSalary INT, 
 ProfitOrLoss DECIMAL);
 
 -- INSERTING VALUES INTO ALL THE TABLE 
 -- PLANE
 INSERT INTO plane VALUES
 (1, 'AirBus A380', 'Execellent'),
 (2, 'Boeing 747-400', 'Good'),
 (3, 'Lockheed C-5 Galaxy', 'Need Repair'),
 (4, 'Douglas', 'Damaged'),
 (5, 'Cessna 172', 'Borrowed');
 
 -- CUSTOMERS
 INSERT INTO customers VALUES
('J5010856', 'Edithe', 'Leggis', 'Female', 62, 'Japan'),
('N6743872', 'Elwood', 'Catt', 'Male', 62, 'Nicaragua'),
('R3342633', 'Darby', 'Felgate', 'Male', 67, 'Russia'),
('C9978493', 'Dominica', 'Pyle', 'Female', 71, 'China'),
('C9982072', 'Bay', 'Pencost', 'Male', 21, 'China'),
('B2039630', 'Lora', 'Durbann',	'Female', 55, 'Brazil'),
('I1011940', 'Rand', 'Bram', 'Male', 73,	'Ivory Coast'),
('V6326470', 'Perceval', 'Dallosso', 'Male', 36, 'Vietnam'),
('PT5529447', 'Aleda', 'Pigram', 'Female',	35,	'Palestinian Territory'),
('T3175035', 'Burlie', 'Schustl', 'Male', 13, 'Thailand'),
('T4329278', 'Porty', 'Jori', 'Male', 39, 'Tunisia'),
('R3390106', 'Briant', 'De La Haye', 'Male', 71,	'Russia'),
('S4919631', 'Kalie', 'Scoble',	'Female', 47,	'Sweden'),
('R3358109', 'Catriona', 'Beaument', 'Female',	77,	'Russia'),
('C9953524', 'Amberly', 'Handling',	'Female', 32, 'China'),
('C9922064', 'Dyna', 'De\'Vere - Hunt', 'Female', 22, 'China'),
('C8212874', 'Janella', 'Hardaker', 'Female', 28,	'Colombia'),
('G2139783', 'Alvin', 'Wenzel', 'Male',	12,	'Greece'),
('P7815461', 'Jerrine', 'Peeters', 'Female', 87, 'Philippines');

-- EMPLOYEES
INSERT INTO employees (First_name, Last_name, gender, age, hireDate) VALUES
('Alister',	'Sartin', 'Male',	40, '2022-01-05'),
('Leisha',	'Kiley', 'Female',	29, '2022-03-01'),
('Tamqrah',	'Cade',	'Female',	26, '2022-05-15'),
('Ephraim',	'Yantsurev', 'Male',	39, '2023-08-18'),
('Freddie',	'Landrean',	'Female',	27, '2022-09-18'),
('Morganne', 'Ockenden', 'Female',	27, '2022-11-30'),
('Jessa',	'Bauldrey',	'Female',	26, '2023-02-05'),
('Rosalie',	'Waldock',	'Male',	35, '2023-12-01'),
('Clary',	'Tribbeck',	'Female',	24, '2023-04-15'),
('Olimpia',	'Arstall',	'Female', 25, '2023-06-02'),
('Che',	'Pressland', 'Male',	37, '2022-07-02'),
('Hadria',	'Vacher', 'Female',	35, '2023-10-30');

-- SALARIES
INSERT INTO salaries VALUES
(2221, 'Pilot', 9000),
(2222, 'Senior Cabin Crew', 8500),
(2223, 'Cabin Crew', 5500),
(2224, 'Pilot', 9000),
(2225, 'Cabin Crew', 7250),
(2226, 'Cabin Crew', 7500),
(2227, 'Cabin Crew', 5000),
(2228, 'Co-Pilot', 8000),
(2229, 'Cabin Crew', 5000),
(2230, 'Cabin Crew', 7000),
(2231, 'Co-Pilot', 8000),
(2232, 'Senior Cabin Crew', 8500);

-- STATUS
INSERT INTO Status VALUES
(6, 'On Time'),
(7, 'Cancelled'),
(8, 'Delayed');

-- FLIGHTS
INSERT INTO flights VALUES
(001, 1, 'United States', '2020-08-01', 'United Kingdom', 'C8212874', 2221, 6, 552),
(002, 1, 'United States', '2020-08-01', 'United Kingdom', 'B2039630', NULL, 6, 552),
(003, 1, 'United States', '2020-08-01', 'United Kingdom', 'C9922064', NULL, 6, 552),
(004, 1, 'United States', '2020-08-01', 'United Kingdom', 'C9953524', 2222, 6, 552),
(005, 1, 'United States', '2020-08-01', 'United Kingdom', 'C9978493', 2223, 6,  552),
(006, 1, 'United States', '2020-08-01', 'United Kingdom', 'C9982072', 2231, 6, 552),
(007, 2, 'Canada', '2024-02-01', 'France', 'I1011940', 2224, 7, 483),
(008, 2, 'Canada', '2024-02-01', 'France', 'J5010856', 2228, 7, 483),
(009, 2, 'Canada', '2024-02-01', 'France', 'P7815461', 2232, 7, 483),
(010, 2, 'Canada', '2024-02-01', 'France', 'V6326470', 2230, 7, 483),
(011, 2, 'Canada', '2024-02-01', 'France', 'R3390106', 2229, 7, 483),
(012, 2, 'Canada', '2024-02-01', 'France', 'S4919631', 2227, 7, 483),
(013, 3, 'Italy', '2024-04-20', 'Mexico', 'R3358109', 2225, 8, 805),
(014, 3, 'Italy', '2024-04-20', 'Mexico', 'R3358109', 2226, 8, 805);

-- ACCOUNTING
INSERT INTO accounting VALUES
(001, 14904, 9000, NULL),
(002, 5520, NULL, 5520),
(003, 5520, NULL, NULL),
(004, 7617.6, 8500, NULL),
(005, 6624, 5500, NULL),
(006, 11040, 8000, NULL),
(007, 9660, 9000, NULL),
(008, 8694, 8000, NULL),
(009, 12075, 8500, NULL),
(010, 9177, 7000, NULL),
(011, 3864, 5000, NULL),
(012, 7728, 5000, NULL),
(013, 8050, 7250, NULL),
(014, 7647.5, 7500, NULL);

					-- QUESTIONS
-- Calculate the total profitOrLoss for the company in each flightid
-- Making the null values to be zero first
UPDATE accounting
SET totalsalary = 0
WHERE flightId = 2;
UPDATE accounting
SET profitOrloss = flightfare - totalsalary;

-- Inserting into Customers Tables
INSERT INTO customers VALUES
('T4574058', 'Daniel', 'Suart',	'Male', 71, 'Thailand'),
('S7683596', 'Shep',	'MacKenney',	'Male', 10, 'Serbia'),
('L2770602', 'Robby', 'Hovy',	'Male', 29, 'Laos'),
('B5596339', 'Othilia', 'Coneron',	'Female',	11,	'Brazil'); 

-- Inserting into Flights Table
INSERT INTO flights VALUES
(015, 3, 'Italy', '2024-04-20', 'Mexico', 'C9953524', NULL, 8, 805),
(016, 3, 'Italy', '2024-04-20', 'Mexico', 'S7683596', NULL, 8, 805);

/* Due to inflation, there will be an increment in the staff salary: pilot 12%, Co-pilot 8%, 
senior cabin crew 10% and cabin crew 6% 
using case statememt to know how much will the new salary be */
SELECT *, 
CASE 
	WHEN jobtitle = 'pilot' THEN ROUND(amount + (amount * (12/100)), 2)
    WHEN jobtitle = 'co-pilot' THEN ROUND(amount + (amount * (8/100)), 2)
    WHEN jobtitle = 'senior cabin crew' THEN ROUND(amount + (amount * (10/100)), 2)
    ELSE ROUND(amount + (amount * (6/100)), 2) END AS NewIncrementAmount 
FROM salaries;

-- Retrive the details of customers and flight that is on time
SELECT  Cust.PassportNumber, Cust.First_name, Cust.Last_name, Cust.Gender,
		Cust.Age, Cust.Nationality, Sta.StatusName
FROM customers Cust 
JOIN flights Fli 
ON Cust.PassportNumber = Fli.PassportNumber
JOIN status Sta
ON Sta.StatusId = Fli.StatusID
WHERE Sta.StatusName = 'On Time';

-- Which staff havent worked with the company since they have been employed
SELECT  Emp.EmployeeId, Emp.First_name, Emp.Last_name, Emp.Gender, Emp.Age,
		Emp.HireDate, Fli.EmployeeId
FROM employees Emp 
LEFT JOIN flights Fli  
ON Emp.EmployeeId = Fli.EmployeeId
WHERE Fli.EmployeeId IS NULL;

-- Add those staff to flightid 13 and 14
UPDATE flights
SET employeeid = 2226
WHERE flightid = 14;

-- calculate the total income generated from cancelled flight
SELECT Sta.StatusName, SUM(ProfitOrLoss) AS SumProfitOrLoss
FROM flights Fli 
JOIN Status Sta 
ON Fli.StatusID = Sta.StatusId
JOIN accounting Acc
ON Fli.FlightId = Acc.FlightId
GROUP BY Sta.StatusName
HAVING Sta.Statusname = 'cancelled';

-- Retrieve the highest age staff from each jobtitle
SELECT Sal.Jobtitle, MAX(age) AS MaxAgeByJobtitle
FROM employees Emp
JOIN salaries Sal
ON Emp.EmployeeId = Sal.EmployeeId
GROUP BY Sal.Jobtitle;

-- The plane that was borrowed has been return back in excellent state
UPDATE plane
SET planestatus = 'Excellent'
WHERE planeid = 5;

-- Change the planeID from 3 to 5 in the flights records
UPDATE flights
SET planeId = 5
WHERE AirportCountryName = 'Italy';

-- Remove the damaged plane from the data base
DELETE FROM plane
WHERE planeId = 4;

-- How many male and female are staff in the company
SELECT Gender, COUNT(gender) AS TotalGender
FROM employees
GROUP BY Gender; 
-- Add an internship person to the database without payment
INSERT INTO employees (first_name, last_name, gender, age, hiredate) VALUES
('Arielle',	'Hoggin', 'Female',	19, current_date()),
('Edmon', 'Southern', 'Male', 20, current_date());

-- What is the rate charged per flight (flightfare/DurationsInMinutes)
SELECT  FlightFare, DurationsInMinutes, 
		ROUND((flightfare/DurationsInMinutes), 2) AS Rate 
FROM flights Fli 
JOIN accounting Acc 
ON Fli.FlightId = Acc.FlightId;

-- Which customers havent transact business with the company
SELECT Cus.PassportNumber, First_name, Last_name, Gender, Age, Nationality
FROM Customers Cus 
LEFT JOIN flights Fli
ON Cus.PassportNumber = Fli.PassportNumber
WHERE FlightId IS NULL;

-- Who is the oldest and youngest customers
SELECT *
FROM customers
WHERE   age = (SELECT MAX(age) FROM customers) OR 
		age = (SELECT MIN(age) FROM customers);
-- Use uppercase for statusName
SELECT StatusName, UPPER(StatusName) AS Uppercase
FROM Status;