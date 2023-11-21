CREATE DATABASE hos_db;
USE hos_db;
-- CREATE TABLE FACILITIES --FACILITIES_ID, NAME, LOCATION
CREATE TABLE facilities(
facilities_id int PRIMARY KEY NOT NULL,
name VARCHAR(50) NOT NULL,
location VARCHAR(100) NOT NULL);
-- INSERTING VALUES INTO FACILITIES TABLE
INSERT INTO facilities VALUE
(1, 'General Hospital',	'Ikotun'),
(2, 'Health Centre', 'Ikotun'),
(3,	'Primary Health Care', 'Ikotun'),
(4, 'Clinic', 'Ikotun'),
(5,	'Maternity Centre', 'Ikotun');
-- CREATE TABLE PATIENT -- PATIENT_ID, NAME, AGE,FACILITIES_ID
CREATE TABLE patient(
patient_id int PRIMARY KEY NOT NULL,
name VARCHAR(100) NOT NULL,
age int NOT NULL,
facilities_id int, FOREIGN KEY (facilities_id) references facilities(facilities_id));
-- INSERTING VALUES INTO PATIENT TABLE
INSERT INTO patient VALUES
(1,	'Mike',	27,	1),
(2,	'John',	28,	5),
(3,	'Semi',	29,	2),
(4,	'Tomi',	30,	3),
(5,	'David', 31, 4),
(6,	'Tola',	32,	1),
(7,	'Seun',	33,	5);
-- CREATE DOCTOR TABLE -- DOCTOR_ID, NAME
CREATE TABLE doctor(
doctor_id int PRIMARY KEY NOT NULL,
name VARCHAR(50) NOT NULL);
-- INSERTING VALUES INTO DOCTOR TABLE
INSERT INTO doctor VALUES
(1, 'Comfort'),
(2, 'Peter'),
(3, 'Josh'),
(4, 'Yemi'),
(5, 'Josh'),
(6, 'Princess');
-- CREATE APPOINTMENT TABLE -- APPOINTMENT_ID, PATIENT_ID, DOCTOR_ID, DATE
CREATE TABLE appointment(
appointment_id int PRIMARY KEY NOT NULL,
patient_id int, FOREIGN KEY (patient_id) references patient(patient_id),
doctor_id int, FOREIGN KEY (doctor_id) references doctor(doctor_id),
date date not null);
 -- INSERTING VALUES INTO APPOINTMENT TABLE
 INSERT INTO appointment VALUES
 (1, 1, 1, '2023-01-01'),
(2, 1, 1, '2023-01-02'),
(3, 2, 2, '2023-01-03'),
(4, 3, 2, '2023-01-04'),
(5,	7, 3, '2023-01-05'),
(6,	6, 4, '2023-01-06'),
(7,	5, 4, '2023-01-07'),
(8, 1, 4, '2023-01-08'),
(9,	2, 2, '2023-01-09'),
(10,3, 3, '2023-01-10');

-- CREATE TABLE MEDICATION -- MEDICATION_ID, NAME
CREATE TABLE medication(
medication_id int PRIMARY KEY NOT NULL,
name VARCHAR(50) NOT NULL);
-- INSERTING VALUES INTO MEDICATION TABLE
INSERT INTO medication VALUES
(1,	'Paracemtol'),
(2,	'Dagar'),
(3,	'Trans'),
(4,	'Becol'),
(5,	'Vitamin C');
-- CREATE TABLE PRESCRIPTION --PRESCRIPTION_ID, PATIENT_ID, MEDICATION_ID
CREATE TABLE prescription(
prescription_id int PRIMARY KEY NOT NULL,
patient_id int, FOREIGN KEY (patient_id) references patient(patient_id),
medication_id int, FOREIGN KEY (medication_id) references medication(medication_id));
-- INSERTING VALUES INTO PRESCRIPTION TABLE
INSERT INTO prescription VALUES
(1,	1,	1),
(2,	2,	2),
(3,	3,	5),
(4,	1,	4),
(5,	4,	2),
(6, 5,	3);

	-- QUESTIONS
	-- 1.RETRIEVE PATIENT INFORMATION WITH FACILITY NAME
SELECT patient_id, p.name as patient_name, age, f.name as facilities_name
FROM patient p
JOIN facilities f
ON p.facilities_id = f.facilities_id;

	-- 2. LIST ALL THE APPOINTMENT  WITH PATIENT NAME AND DOCTOR NAME
SELECT appointment_id, p.name AS patient_name, d.name AS doctor_name, date
FROM  appointment a
JOIN patient p 
ON a.patient_id = p.patient_id
JOIN doctor d
ON a.doctor_id = d.doctor_id;

	-- 3. FIND THE PATIENT WHO ARE PRESCRIPED ON PARACEMTOL MEDICATION
SELECT p.patient_id, p.name AS patient_name, age, m.name AS medication_name
FROM patient p 
JOIN prescription pr
ON p.patient_id = pr.patient_id
JOIN medication m
ON m.medication_id = pr.medication_id
WHERE m.name = 'paracemtol';

	-- 4. COUNT THE NUMBER OF APPOINTMENT FOR EACH DOCTOR
SELECT d.doctor_id, d.name AS doctor_name, count(a.doctor_id) AS number_of_Appointment
FROM doctor d
JOIN appointment a
ON d.doctor_id = a.doctor_id
GROUP BY d.doctor_id;

	-- 5. LIST DOCTOR WHO HAVE NO APPOINTMENT
SELECT a.appointment_id, d.doctor_id, d.name, date
FROM doctor d
LEFT JOIN appointment a
ON d.doctor_id = a.doctor_id
WHERE a.doctor_id IS NULL;
