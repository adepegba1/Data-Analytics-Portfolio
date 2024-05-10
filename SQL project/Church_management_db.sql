-- Design a relational database schema to manage church-related information. 
DROP DATABASE IF EXISTS church_db;
CREATE DATABASE church_db;
USE church_db;
-- The schema includes Members table with attributes: member_id, first_name, last_name, address, and phone number. 
CREATE TABLE Members(
Member_id INT PRIMARY KEY NOT NULL,
First_name VARCHAR(50),
Last_name VARCHAR(50),
Address VARCHAR(255),
Phone_number BIGINT(11));

-- inserting values into member tables
INSERT INTO members VALUES
(2001, 'John', 'Bukola', 'Ikotun-Egbe', 08109995310),
(3001, 'Gbemisola', 'Idowu', 'Jankeade Gate', 09023101143),
(0012, 'Taiwo', 'Nifemi', 'Ota Sango', 07010002133),
(2030, 'Kehinde', 'Henry', 'Surulere', 08023125412),
(3040, 'Solomon', 'Johnson', 'Ikeja', 07023437686);

-- Additionally, there is an Events table with attributes: event_id, event_name, event_date, and event_location. 
CREATE TABLE Events(
Event_id INT PRIMARY KEY NOT NULL,
Event_name VARCHAR(255),
Event_date DATE,
Event_location VARCHAR(255));

-- inserting values into events table
INSERT INTO events VALUES
(2000, 'Deliverance', '2023-04-12', 'Jos'),
(2022, 'Fasting and Praying', '2022-03-12', 'Akure'),
(2010, 'Quartely Program', '2023-06-17', 'Lagos'),
(2040, 'Youth Vigil', '2022-10-20', 'Ibadan'),
(2023, 'Youth Rally', '2020-08-11', 'Ilesha');

-- The schema also features an Attendees table with attributes: attendee_id, member_id an event_id. 
CREATE TABLE Attendees(
Attendee_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
Member_id INT, FOREIGN KEY (member_id) REFERENCES members(member_id) ON DELETE SET NULL,
Event_id INT, FOREIGN KEY (event_id) REFERENCES events(event_id) ON DELETE SET NULL);

-- Inserting values into attendees Table
INSERT INTO attendees(member_id, event_id) VALUES
(2001, 2000),
(3001, 2000),
(2030, 2000),
(3040, 2022),
(2001, 2022),
(2030, 2022),
(3001, 2010),
(3040, 2010),
(3001, 2010),
(2001, 2040),
(3040, 2040),
(2030, 2040),
(2001, 2023),
(3001, 2023),
(3040, 2023);
 
-- Furthermore, there is a Ministries table including attributes: ministry_id, ministry name, and ministry leader 
CREATE TABLE Ministries(
Ministry_id INT PRIMARY KEY NOT NULL,
Ministry_name VARCHAR(255),
Ministry_leader VARCHAR(255));

-- inserting values into ministries table
INSERT INTO ministries VALUES
(6001, 'C.A.C', 'Apostle Ayodele Babalola'),
(3020, 'Daystar Christian Centre', 'Pastor Sam Adeyemi'),
(4000, 'Mountain Of Fire Miracle Ministry', 'Pastor Daniel Olukoya'),
(3000, 'Redeemed Christian Church Of God', 'Pastor Enoch Adeboye'),
(2171, 'Deeper Life Bible Church', 'Pastor Kumuyi');

-- Lastly, there is a Donations table with attributes: donation_id, member_id, amount, and donation date.
CREATE TABLE Donations(
donation_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
Member_id INT, FOREIGN KEY (member_id) REFERENCES members(member_id) ON DELETE SET NULL,
Amount FLOAT,
Donation_date DATE NOT NULL);

-- inserting values into donation table
INSERT INTO donations (member_id, amount, donation_date) VALUES
(0012, 543.45, '2020-03-01'),
(2030, 1000.50, '2022-05-17'),
(0012, 5000, '2022-10-15'),
(3040, 300, '2022-12-13'),
(12, 7000, '2023-01-03');