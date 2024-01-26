CREATE DATABASE vet_clinic;
USE vet_clinic;
/*The clinic has a list of pets and record information such as petId, pet owner name, pet name, age, address, type of breed, weight, color and their sex.
 Appointments has petid, doctorid, date, diagnoses, cost of treatment, appiontmentid. 
 A vet doctor has a doctorlD, name, office number, telephone number, email and is either full-time or part-time. */


-- CREATING TABLE FOR PET
CREATE TABLE pets(
Pet_Id INT PRIMARY KEY AUTO_INCREMENT,
Pet_Owner_Name VARCHAR(100), 
Pet_Name VARCHAR(100),
Pet_Age_Months FLOAT,
Address VARCHAR(255),
Type_of_Breed VARCHAR(100) NOT NULL,
Weight_kg FLOAT,
Colour VARCHAR(100),
Sex VARCHAR(10));

-- INSERTING VALUES INTO PET TABLE
INSERT INTO pets(pet_owner_name, pet_name, pet_age_months, address, type_of_breed, weight_kg, colour, sex) VALUES
("John Smith", "Agumon", 10, "973 Gilbert Ferry Road Se, Attalla AL 35954", "Silkies", 15.3, "Red Copper", "Female"),
("Jennifer Orwell", "Gabumon", 15, "312 Palisades Blvd, Birmingham AL 35209", "Rhode Island Red", 12.2, "Black", "Male"),
("Bob", "Pikachu", 20, "555 Hubbard Ave-Suite 12, Pittsfield MA 1201", "Abyssinian", 40.3,  "Starshine", "Female"),
("Melody Pond", "Devimon", 96, "750 Academy Drive, Bessemer AL 35022", "American Shorthair", 20.1, "Seaside", "Male"),
("Dean Winchester", "Charmander",26, "701 Mcmeans Ave, Bay Minette AL 36507", "Scottish Fold", 25.7, "Sunshine", "Female"), 
("Jodie Whittaker", "Plantmon", 21, "300 Colony Place, Plymouth MA 2360", "Devon Rex", 22.5, "Red Copper", "Male"),
("Sam Smith", "Squirtle", 62, "1717 South College Street, Auburn AL 36830", "Rottweiler", 15.0, "Seaside", "Female"),
("Stewart Maya", "Angemon", 11, "301 Falls Blvd, Quincy MA 2169", "Beagle", 16.5, "Black", "Male"),
("Reyes Allison", "Boarmon", 36, "1600 Montclair Rd, Birmingham AL 35210","German Shepherd", 14.1, "Fireside", "Male"),
("Collins Kinsley", "Blossom", 98, "36 Paramount Drive, Raynham MA 2767", "Poodle", 10.3, "Brown", "Female"),
("Edwards Kennedy", "Ditto", 43, "910 Wolcott St, Waterbury CT 6705", "Bulldog", 43.2, "Mocha Brown","Male"),
("Cruz Aaliyah", "Tangerine", 82, "6265 Brockport Spencerport Rd, Brockport NY 14420", "Budgerigar", 22.7, "Sunshine", "Female"),
("Parker Genesis", "Butters", 17, "450 Highland Ave, Salem MA 1970", "African Gery Parrot", 35.4, "Fireside", "Female"),
("Diaz Caroline", "Checkers", 42, "5919 Trussville Crossings Pkwy, Birmingham AL 35235", "Conures", 6.6, "Black", "Male"),
("Turner Samantha", "Poochie",86, "155 Waterford Parkway No, Waterford CT 6385", "Hyacinth Macaw", 25.1,"Blue", "Female"),
("Evans Anna", "Truffle", 92, "4133 Veterans Memorial Drive, Batavia NY 14020", "Bulldog", 5.3, "Brown", "Female"),
("Phillips Lucy", "Chunk", 27, "1011 US Hwy 72 East, Athens AL 35611", "Poodle", 11.5, "Mocha Brown","Male"),
("Gomez Aurora", "Raisin", 56, "844 No Colony Road, Wallingford CT 6492", "German Shepherd", 36.8, "Seaside", "Female"),
("Roberts Bella", "Mister Pink", 28, "1105 Boston Road, Springfield MA 1119", "Beagle", 32.7, "Mocha Brown", "Male"),
("Carter Claire", "Praline", 93, "297 Grant Avenue, Auburn NY 13021", "Rottweiler", 24.9, "Brown", "Male"),
("Mitchell Violet", "Lolly", 73, "1450 No Brindlee Mtn Pkwy, Arab AL 35016", "Yorkshire Terrier", 16.4, "Red Copper", "Male"),
("Campbell Skylar", "Hopper", 16, "970 Torringford Street, Torrington CT 6790", "Dachshund", 15.6, "Seaside", "Female"),
("Rivera Audrey", "Barnum", 75, "100 Charlton Road, Sturbridge MA 1566", "Abyssinian", 6.5, "Sunshine", "Male"),
("Hall Paisley", "Flinch", 7, "5560 Mcclellan Blvd, Anniston AL 36206", "Scottish Fold", 25.3, "Fireside",  "Female"),
("Baker Ellie", "Nectar", 14, "555 East Main St, Orange MA 1364", "Bengal", 24.3, "Starshine", "Male"),
("Nelson Hazel", "Trixie", 20, "150 Barnum Avenue Cutoff, Stratford CT 6614", "American Shorthair", 33.7, "Black", "Female"),
("Adams Stella", "Stripe", 58, "101 Sanford Farm Shpg Center, Amsterdam NY 12010", "Birman", 18.1, "Red Copper", "Male"),
("Green Zoe", "Brownie", 34, "540 West Bypass, Andalusia AL 36420", "Devon Rex", 5.5, "Mocha Brown", "Male"),
("Flores Leah", "Pez", 60, "2055 Niagara Falls Blvd, Amherst NY 14228", "Budgerigar", 7.8, "Brown", "Female"),
("Hill Brooklyn", "Mentos",  79, "235 Queen St, Southington CT 6489", "African Gery Parrot", 44.3, "Starshine", "Male"),
("Nguyen Savannah", "Nappo", 51, "262 Swansea Mall Dr, Swansea MA 2777", "Conures", 28.4, "Fireside", "Female"),
("Torres Luna", "Crunch", 50, "13858 Rt 31 W, Albion NY 14411", "Hyacinth Macaw", 10.5, "Black", "Female"),
("Scott Natalie", "Kit Kat", 76, "180 North King Street, Northhampton MA 1060", "Cochin, Silkies", 35.5, "Mocha Brown", "Female"),
("Wright Eleanor", "Tango", 46, "2643 Hwy 280 West, Alexander City AL 35010", "Rhode Island Red", 21.6, "Seaside", "Male"),
("King Addison", "Pepper", 82, "465 Bridgeport Avenue, Shelton CT 6484", "Plymouth Rock", 27.4, "Sunshine", "Female"),
("Allen Lily", "Jabba", 83, "1972 Hwy 431, Boaz AL 35957", "Dachshund", 28.4, "Red Copper", "Male"),
("Young Hannah", "Wiggles", 92, "80 Town Line Rd, Rocky Hill CT 6067", "Devon Rex", 7.2, "Sunshine", "Female"),
("Walker Aubrey", "Dude",  40, "333 Main Street, Tewksbury MA 1876", "Yorkshire Terrier", 42.1, "Seaside", "Female"),
("Robinson Mila", "Scrappy", 7, "250 Rt 59, Airmont NY 10901", "Birman", 7.8, "Fireside",  "Male"),
("Lewis Zoey", "Baloo", 9, "630 Coonial Promenade Pkwy, Alabaster AL 35007", "Rottweiler", 19.1, "Brown", "Female"),
("Johnson Olivia", "Santa Paws", 4, "625 School Street, Putnam CT 6260", "Hyacinth Macaw", 9.1, "Black", "Male"),
("Thomas Ella", "Juniper", 24, "5399 W Genesse St, Camillus NY 13031", "American Shorthair", 31.4, "Mocha Brown", "Female"),
("Anderson Sofia", "Clever", 97, "550 Providence Hwy, Walpole MA 2081", "Beagle", 22.6, "Red Copper", "Male"),
("Wilson Avery", "Blinker", 35, "515 Sawmill Road, West Haven CT 6516", "Plymouth Rock", 44.0, "Sunshine", "Female"),
("Gonzalez Elizabeth", "Dirty Mary", 91, "10675 Hwy 5, Brent AL 35034", "Conures", 8.5, "Seaside", "Female"),
("Lopez Emily", "Lodi", 48, "352 Palmer Road, Ware MA 1082", "Bengal", 21.6, "Fireside", "Male"),
("Hernandez Harper", "Crusher", 36, "3191 County rd 10, Canandaigua NY 14424", "German Shepherd", 38.1, "Starshine", "Female"),
("Martinez Abigail", "Malibu", 13, "9248 Parkway East, Birmingham AL 35206", "Silkies", 40.8, "Sunshine", "Female"),
("Rodriguez Evelyn", "Madea", 21, "3005 Cranberry Hwy Rt 6 28, Wareham MA 2538", "African Gery Parrot", 7.6, "Seaside", "Male"),
("Davis Amelia", "Snapper", 13, "141 Washington Ave Extension, Albany NY 12205", "Scottish Fold", 8.8, "Fireside",  "Male"),
("Miller Charlotte", "Sanoma", 43, "655 Boston Post Rd, Old Saybrook CT 6475", "Poodle",  16.1, "Starshine", "Female"),
("Garcia Mia", "Daddario", 29, "1180 Fall River Avenue, Seekonk MA 2771", "Cochin", 43.9, "Brown", "Male"),
("Jones Sophia", "Little Bear", 75, "2473 Hackworth Road, Adamsville AL 35005", "Budgerigar", 10.8, "Black", "Female"),
("Brown Isabella", "Diva", 19, "30 Catskill, Catskill NY 12414", "Abyssinian", 9.9, "Mocha Brown", "Female"),
("Williams Ava", "Yum Yum", 44, "220 Salem Turnpike, Norwich CT 6360", "Bulldog", 16.7, "Red Copper", "Male");

-- CREATING TABLE FOR VET DOCTOR
CREATE TABLE Vet_Doctor(
Doctor_id INT PRIMARY KEY AUTO_INCREMENT,
Doctor_Name VARCHAR(150),
Office_Number INT, 
Telephone_Number VARCHAR(100),
Email VARCHAR(255),
Time_employees VARCHAR(100));

-- INSERTING VALUES INTO VET_DOCTOR
INSERT INTO vet_doctor(Doctor_name, Office_Number, Telephone_number, email, time_employees) VALUES
("William Tatcher", 204, "+1-418-543-8090", "Williamtatcher@gmail.com", "Full Time"),
("Maisy Smith", 206, "+1-587-530-2271", "Maisysmith@hotmail.com", "Part Time"),
("Stephanie Mendez", 203, "+1-404-724-1937", "Stephaniemendez@yahoo.com", "Full Time"),
("Jack Harkness", 202, "+1-443-307-1473", "Jackharkness@outlook.com", "Full Time"),
("Taylor Madison", 200, "+1-329-420-1792", "Taylormadison@gmail.com", "Part Time"),
("Moore Scarlett", 205, "+1-770-212-6011", "Moorescarlett@outlook.com", "Full Time"),
("Jackson Victoria", 204, "+1-473-522-7496", "Jacksonvictoria@hotmail.com", "Full Time"),
("Martin Aria", 200, "+1-477-962-3907", "Martinaria@yahoo.com", "Part Time"),
("Lee Grace", 203, "+1-478-797-3175", "Leegrace@rocketmail.com", "Full Time"),
("Perez Chloe", 202, "+1-948-914-6246", "Perezchloe@outlook.com", "Part Time"),
("Thompson Camila", 205, "+1-268-763-5180", "Thompsoncamila@yahoo.com", "Full Time"),
("White Penelope", 202, "+1-369-441-8619", "Whitepenelope@gmail.com", "Full Time"),
("Harris Riley", 201, "+1-501-926-2756", "Harrisriley@rocektmail.com", "Part Time"),
("Sanchez Layla", 200, "+1-223-919-0967", "Sanchezlayla@hotmail.com", "Full Time"),
("Clark Lillian", 203, "+1-328-857-2537", "Clarklillian@outlook.com", "Full Time"),
("Ramirez Nora", 204, "+1-636-613-5429", "Ramireznora@hotmail.com", "Part Time");


-- CREATEING TABLE FOR APPOINTMENT 
CREATE TABLE appointments(
appointment_id INT PRIMARY KEY AUTO_INCREMENT,
Pet_Id INT, FOREIGN KEY (pet_id) REFERENCES pets(pet_Id),
Doctor_id INT, FOREIGN KEY (doctor_id) REFERENCES Vet_Doctor(doctor_id),
Cost_of_Appointment FLOAT,
Diagnoses VARCHAR(100),
Date DATE); 
-- INSERTING VALUES INTO APPOINTMENT TABLE
INSERT INTO appointments(pet_id, Doctor_id, Cost_of_appointment, diagnoses, Date) VALUES
(53,  12, 39.83, "Canine Parvovirus", "2022-08-21"),
(49,  6, 70.52, "Heartworms", "2022-08-25"),
(13,  3, 145.61, "Distemper", "2023-09-24"),
(54,  11, 36.20, "Dental", "2022-10-26"), 
(27,  4, 51.14, "Canine Parvovirus", "2022-10-21"),
(47,  5, 81.18, "Socialisation", "2022-06-22"),
(53,  12, 37.94, "Heartworms", "2023-04-27"),
(44,  11, 44.94, "Socialisation", "2022-09-29"),
(27,  13, 68.28, "Dental", "2023-08-28"),
(26, 9, 161.70, "Canine Parvovirus", "2022-08-13"),
(53, 3, 124.64, "Heartworms", "2023-10-25"),
(47,  9, 160.72,  "Distemper", "2023-10-04"),
(38,  8, 85.13, "Dental", "2023-04-18"),
(5,  3, 143.31, "Socialisation", "2023-05-10"),
(12, 11, 120.70, "Socialisation","2023-12-01"),    
(30,  3, 83.90, "Canine Parvovirus", "2023-04-03"),
(8, 7,  139.57, "Dental", "2022-07-03"),
(51, 4, 126.82, "Socialisation", "2023-03-04"),
(49,  14, 148.65, "Distemper", "2022-07-22"),
(9,  2,  83.62, "Socialisation", "2023-11-02"),
(4, 10, 77.15, "Heartworms", "2023-03-22"),
(52,  6, 41.71, "Dental", "2023-06-09"), 
(16, 6, 177.41,  "Socialisation", "2023-08-07"),
(42,  10, 111.08, "Canine Parvovirus", "2023-06-09"), 
(1,  7, 175.64, "Dental", "2022-12-25"),
(52, 10, 79.24, "Socialisation", "2023-11-15"),
(13, 13, 164.86, "Distemper", "2023-05-21"),
(29, 11, 37.30, "Heartworms", "2022-10-27"),
(44, 2, 150.73, "Dental", "2023-11-02"),
(37,  9, 75.45, "Canine Parvovirus", "2023-01-12"),
(55, 12, 70.36, "Distemper", "2022-07-26"),
(30,  11, 61.42, "Dental", "2023-10-11"),
(51,  2, 82.06, "Socialisation", "2022-10-29"),
(16,  4, 124.45,"Heartworms", "2023-11-13"),
(43, 3, 155.88, "Socialisation", "2022-06-05"),
(29, 14, 46.91, "Heartworms", "2023-08-29"),
(26, 13, 75.66, "Dental", "2022-06-16"),
(46, 8, 171.29, "Distemper", "2023-09-20"),
(43, 15, 23.64, "Canine Parvovirus", "2023-07-25");

/* Write an SQL statement that lists the pet id, pet name, pet age showing the columns as "ID", "Name" and "Age". 
Their names should be those starting with letters A to M. Sort the results by the pet id in descending order. */ 
SELECT  pet_id ID, pet_name Name, FLOOR((pet_age_months / 12)) Years, 
		FLOOR(((pet_age_months / 12) - FLOOR((pet_age_months / 12))) * 12) Months
FROM pets
WHERE pet_name REGEXP '^[A-M]'
-- WHERE pet_name BETWEEN 'A' AND 'M'
ORDER BY pet_id DESC;

/* Write an SQL statement that shows the most overworked part-time vet doctor, i.e., any vet with 3 or more appointments for pet clinics, 
listing details such as id, name and office number. */
SELECT doctor_id ID, doctor_name Name, office_number "Office Number"
FROM vet_doctor
JOIN appointments
USING (doctor_id)
WHERE Time_employees = "Part Time"
GROUP BY doctor_id, doctor_name, office_number
HAVING COUNT(doctor_id) >= 3;

/* Write an SQL query that lists pet details with 2 or more appointments between 2nd Jan 2023 and 26th Sep 2023. 
The columns should include pet id, name and a count of the number of appointments. */
SELECT pet_id, pet_name, COUNT(app.pet_id) "Number of Appointments"
FROM pets 
JOIN appointments app
USING(pet_id)
WHERE Date BETWEEN ("2023-01-02") AND ("2023-09-26")
GROUP BY pet_id, pet_name
HAVING COUNT(app.pet_id) >= 2;

/* Write an SQL query that finds pet id, name and cost of appointments, 
such that the cost of the appointment is less than the average appointment cost of appointments */
SELECT pet_id, Pet_name, Cost_of_Appointment
FROM pets
JOIN appointments app
USING(pet_id)
WHERE Cost_of_Appointment < ( SELECT AVG(Cost_of_Appointment) FROM appointments);
/* Write an SQL statement that lists a doctor id, status, the total number of appointments he/she has handled, 
the pet involved (id, name) and the dates these took place. The query should only show cases whose diagnoses 
involved "socialisation" or "dental" work and where the appointment date was at least 4 weeks ago. */
SELECT doctor_id, time_employees Status, COUNT(doctor_id) "Number of Appointments", pet_id, pet_name
FROM vet_doctor
JOIN appointments app
USING(doctor_id)
JOIN pets
USING(pet_id)
WHERE Diagnoses IN ('Dental', 'Socialisation')
GROUP BY doctor_id, Time_employees, pet_id, pet_name;

/* Write an SQL query that finds pet ids with no appointments or diagnoses so far. */
SELECT pet_id, pet_name
FROM pets
LEFT JOIN appointments app
USING(pet_id)
WHERE app.pet_id IS NULL;








 

