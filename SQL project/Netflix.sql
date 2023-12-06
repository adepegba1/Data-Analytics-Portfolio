-- Below is ur SQL Project
-- Project Title:Netflix-Style Movie Rental and Subscription Service:
CREATE DATABASE Netflix;
USE Netflix;
-- Your task is to create a MySQL database for a movie rental and subscription service
-- like Netflix. The service has movies, subscribers,and movie rentals. 
-- Each movie has  details like movie ID, title, director, genre, and release year.
CREATE TABLE Movies(
MovieId INT PRIMARY KEY NOT NULL,
Title VARCHAR(100) NOT NULL,
Director Varchar(150) NOT NULL,
Genre VARCHAR(100) NOT NULL,
ReleaseYear VARCHAR(100) NOT NULL);
-- INSERTING VALUES INTO MOVIES TABLES
INSERT INTO Movies VALUES
(1,	'The Wait',	'Fiyin Gambo & Yemi Morafa', 'Thriller/Drama', 2021),
(2,	'Lionheart', 'Genevieve Nnaji',	'Comedy/Drama', 2018),
(3,	'The Black Book', 'Editi Effiong', 'Thriller', 2023),
(4,	'Brotherhood', 'Loukman Ali', 'Action',	2022),
(5,	'Passport', 'Dimeji Ajibola', 'Comedy',	2022),
(6,	'Sista', 'Biodun Stephen', 'Drama',	2022);

-- Subscribers have details like subscriber ID, name, email, subscription plan, and subscription date. 
CREATE TABLE Subscribers(
SubscriberId INT PRIMARY KEY NOT NULL,
Name VARCHAR(220) NOT NULL,
Email VARCHAR(225) NOT NULL,
SubscriptionPlan VARCHAR(100) NOT NULL,
SubscriptionDate DATE NOT NULL);
-- INSERTING VALUES INTO SUBSCRIBERS TABLES
INSERT INTO Subscribers VALUES
(1,	'Adewale Bunmi', 'Adewalebunmi@yahoomail.com', 'Standard with ads',	'2022-10-19'),
(2,	'James Okafor',	'Jamesokafor@rocketmail.com', 'Standard', '2022-08-12'),
(3,	'Taiwo Janet', 'Taiwojanet@outlook.com', 'Premium',	'2022-04-04'),
(4,	'Yusuf Jamiu', 'Yusufjamiu@rocketmail.com', 'Standard with ads', '2022-02-28'),
(5,	'Tunji Dolapo',	'Tunjidolapo@outlook.com', 'Standard',	'2021-07-30'),
(6,	'Shina Esther',	'Shinaesther@gmail.com', 'Premium',	'2021-10-25'),
(7,	'Boluwatife Dara', 'Boluwatifedara@yahoomail.com', 'Standard with ads',	'2021-03-12'),
(8, 'Temitope Ajayi', 'Temitopeajayi@rokcetmail.com', 'Standard', '2023-12-31'),
(9,	'Musatapha Ibrahim', 'Musataphaibrahim@outlook.com', 'Premium',	'2023-11-12');

-- Movie rentals include details such as rental ID, movie ID, subscriber ID, rental date, and return date.
CREATE TABLE MovieRentals(
RentalId INT PRIMARY KEY NOT NULL,
movieId INT, FOREIGN KEY (MovieId) REFERENCES Movies(MovieId),
SubscriberId INT, FOREIGN KEY (SubscriberId) REFERENCES Subscribers(SubscriberId),
RentalDate DATE NOT NULL, 
ReturnDate DATE NOT NULL);
-- INSERTING VALUES INTO MOVIERENTALS TABLES
INSERT INTO MovieRentals VALUES
(1000, 5, 7, '2022-11-03', '2022-12-03'),
(1001, 1, 9, '2021-08-01', '2202-10-25'),
(1002, 4, 5, '2022-05-18', '2022-06-23'),
(1003, 2, 3, '2019-10-19', '2019-11-15'),
(1004, 5, 4, '2023-01-15', '2023-03-21'),
(1005, 5, 2, '2023-04-11', '2023-05-17');
-- Your tasks include:
-- Designing the database schema for these entities.
-- Writing SQL queries for actions like:
-- Adding a new movie
INSERT INTO Movies VALUES
(7,	'Mother!', 'Darren Aronofsky', 'Horror/Mystery', 2017),
(8,	'Damsel', 'Juan Carlos Fresnadillo', 'Adventure/Action', 2024);
-- Subscribing a new user
INSERT INTO Subscribers VALUES
(10, 'Julien Badmus', 'Julienbadmus@gmail.com', 'Standard',	'2023-06-06'),
(11, 'Femi Adebayo', 'Femiadebayo@gmail.com', 'Standard with ads',	'2019-09-14'),
(12, 'Tochukwu JohnBosco', 'Tochukwujohnbosco@yahoomail.com', 'Premium',	'2018-01-17');
-- Renting a movie to a subscriber
INSERT INTO MovieRentals VALUES
(1006, 3, 1, '2023-09-12', '2023-12-11'),
(1007, 4, 6, '2022-11-10', '2022-12-09'),
(1008, 1, 9, '2021-03-20', '2021-07-29');
-- Constructing complex queries to generate reports like
-- Most rented movies
SELECT  Ren.movieId, Mov.Title, mov.Director, Mov.Genre, mov.ReleaseYear,
		COUNT(Ren.movieId) AS RentedTimes
FROM MovieRentals Ren
JOIN Movies Mov
ON Ren.movieId = Mov.MovieId
GROUP BY Ren.movieId, Mov.Title, mov.Director, Mov.Genre, mov.ReleaseYear
ORDER BY RentedTimes DESC;

-- Subscribers in year 2023
SELECT *
FROM Subscribers
WHERE SubscriptionDate LIKE '2023%';

-- Movies rented by a particular subscriberid 3
SELECT  Ren.SubscriberId, Sub.Name, Mov.MovieId, Mov.Title, 
		Mov.Director, Mov.Genre, Mov.ReleaseYear
FROM MovieRentals Ren
JOIN Subscribers Sub
ON Ren.SubscriberId = Sub.SubscriberId
JOIN Movies Mov
ON Ren.movieId = Mov.MovieId
WHERE Sub.SubscriberId =3;

-- Total rentals in year 2022.
SELECT YEAR(RentalDate) AS Year, COUNT(RentalId) AS TotalRent
FROM MovieRentals Ren
WHERE RentalDate LIKE '2022%'
GROUP BY YEAR(RentalDate);

-- Retrieve details of all gmail user from the database
SELECT *
FROM Subscribers
WHERE Email LIKE '%gmail%';

-- Retrieve details of subscribers that haven't borrow movies
SELECT *
FROM Subscribers Sub
LEFT JOIN MovieRentals Ren
ON Sub.SubscriberId = Ren.SubscriberId
WHERE RentalId IS NULL;
