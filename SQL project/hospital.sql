-- CREATE DATABASE FOR HOSPITAL
CREATE DATABASE hospital_db;
USE hospital_db;

-- CREATE DOCTOR TABLE -- DOCTOR_ID, NAME, SPECIALITY
CREATE TABLE doctor_table(
doctor_id int PRIMARY KEY NOT NULL,
name VARCHAR(45) NOT NULL,
speciality VARCHAR(45) NOT NULL);

INSERT INTO doctor_table VALUES
(1, 'Tomi', 'gneacologist'),
(2, 'Tosin', 'Doctor'),
(3, 'Yinka', 'Denist'),
(4, 'Mike', 'Surgeon'),
(5, 'Blessing', 'Pediatrisian'),
(6, 'Victor', 'Surgeon');



-- CREATE PATIENT TABLE -- PATIENT_ID, NAME, AGE, DOCTOR-ID
CREATE TABLE patient_table(
patient_id int PRIMARY KEY NOT NULL,
name VARCHAR(45) NOT NULL,
age int NOT NULL,
doctor_id int, FOREIGN KEY (doctor_id) REFERENCES doctor_table(doctor_id));


INSERT INTO patient_table VALUES
(1, 'Bimbo', 34, 1),
(2, 'Quadri', 23, 2),
(3, 'John', 34, 6),
(4, 'Tola', 25, 4),
(5, 'Seun', 34, 3);

-- CREATE APPOINTMENT TABLE -- APPOINTMENT_ID, PATIENT-ID, DOCTOR_ID, APPOINTMENT DATE
CREATE TABLE appointment_table(
appointment_id int PRIMARY KEY NOT NULL,
patient_id int, FOREIGN KEY (patient_id) REFERENCES patient_table(patient_id),
doctor_id int, FOREIGN KEY (doctor_id) REFERENCES doctor_table(doctor_id),
appointment_date DATETIME NOT NULL);

INSERT INTO appointment_table VALUES
(1, 1, 1, '2023-04-01 17:45:50'),
(2, 2, 3, '2023-04-11 15:29:50'),
(3, 5, 2, '2023-03-21 14:34:59'),
(4, 2, 4, '2023-03-21 08:23:55'),
(5, 5, 1, '2023-07-12 23:59:59'),
(6, 3, 4, '2023-04-09 02:19:10');

-- INSERTING MORE VALUES INTO THE TABLE
INSERT INTO patient_table VALUES
(6, 'David', 29, 5),
(7, 'Temi', 25, 2);

-- RENAMING THE COLUMN IN THE TABLE
ALTER TABLE patient_table
RENAME COLUMN name TO first_name;

-- RENAMING A COLUMN FROM THE TABLE
ALTER TABLE appointment_table
RENAME COLUMN appointment_date TO DateTime;

/* ADDING A NEW COLUMN TO THE TABLE
ALTER TABLE appointment_table
ADD DateTime datetime
AFTER doctor_id;

DELETING A TABLE
ALTER TABLE patient_table
DROP COLUMN patient_id */

-- CHANGING THE DATA TYPE IN THE TABLE
ALTER TABLE doctor_table
MODIFY name VARCHAR(30) NOT NULL;

-- INSERTING VALUES TO THE NEW COLUMN
UPDATE appointment_table
SET Datetime = '2012-12-12 12:12:12'
WHERE patient_id = 6;

-- JOINING OF TABLE
-- RETRIEVE THE NAME OF PATIENT, AGE THAT HAS APPOINTMENT WITH DOCTOR YINKA, HIS SPECIALITY AND APPOINTMENT DATE
SELECT first_name, age, name, speciality, datetime
FROM appointment_table
JOIN patient_table
ON appointment_table.patient_id = patient_table.patient_id
JOIN doctor_table
ON appointment_table.doctor_id = doctor_table.doctor_id
WHERE name = 'Yinka';

-- RETRIEVE THE DATE PATIENT 'QUADRI' WILL RECEIEVE HIS NEXT APPOINTMENT WITH WHICH DOCTOR AND SPECIALITY
SELECT first_name, datetime, name, speciality
FROM doctor_table
JOIN patient_table
ON doctor_table.doctor_id = patient_table.doctor_id
JOIN appointment_table
ON appointment_table.patient_id = patient_table.patient_id
WHERE first_name = 'quadri'
ORDER BY datetime;

-- RETRIEVE ALL THE DOCTOR THAT HAS APPOINTMENT NEXT AND WITH WHICH PATIENT NAME
SELECT doctor_table.doctor_id, name, datetime, first_name
FROM appointment_table
JOIN doctor_table
ON appointment_table.doctor_id = doctor_table.doctor_id
JOIN patient_table
ON appointment_table.patient_id = patient_table.patient_id
ORDER BY datetime;

-- WHICH DOCTOR DOES NOT HAVE APPOINTMENT 
SELECT appointment_id, doctor_table.doctor_id, doctor_table.name, speciality
FROM doctor_table
LEFT JOIN appointment_table
ON doctor_table.doctor_id = appointment_table.doctor_id
WHERE appointment_id IS NULL;
