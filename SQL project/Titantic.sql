/*
Variable | Definition | Key
survival | Survival | 0 = No, 1 = Yes
pclass | Ticket class | 1 = 1st, 2 = 2nd, 3 = 3rd
sex | Sex | Male or Female
Age | Age in years 
sibsp | # of siblings / spouses aboard the in Titanic 
parch | # of parents / children aboard the in Titanic 
ticket | Ticket number 
fare | Passenger fare 
cabin | Cabin number 
embarked | Port of Embarkation | C = Cherbourg, Q = Queenstown, S = Southampton

Variable Notes:
pclass: A proxy for socio-economic status (SES)1st = Upper, 2nd = Middle, 3rd = Lower
sibsp: The dataset defines family relations in this way...
Sibling = brother, sister, stepbrother, stepsister
Spouse = husband, wife (mistresses and fiancés were ignored)
parch: The dataset defines family relations in this way...
Parent = mother, father
Child = daughter, son, stepdaughter, stepson. Some children travelled only with a nanny, therefore parch=0 for them.
*/
CREATE DATABASE titanic;
USE titanic;

-- HOW MANY PEOPLE SURVIVE THE TITANIC SHIP CRASH
SELECT COUNT(*) People_survived
FROM train
WHERE Survived = 1;

-- WHAT THE TOTAL NUMBER OF MALE AND FEMALE ON THE SHIP
SELECT sex Gender, COUNT(sex) Number_Gender
FROM train
GROUP BY sex;

-- WHAT IS THE TOTAL OF THE FARE FOR THE SHIP
SELECT ROUND(SUM(fare), 2) Total_Fare
FROM train;

-- IS THERE ANYONE THAT DIDNT PAY TO ENTER THE SHIP
SELECT *
FROM train
WHERE Fare IS NULL;

-- HOW MANY PEOPLE DIE IN THE SHIP CRASH
SELECT COUNT(*) Total_Death
FROM train
WHERE Survived = 0;

-- WHAT WAS THE SURVIVAL RATE OF MALES IN THE THIRD PASSENGER CLASS
SELECT COUNT(sex) Total_Males, COUNT(sex) * 100 / (SELECT COUNT(sex) FROM train WHERE Survived = 1 AND Pclass = 3) "Percentage Rate Males Survived In 3rd Class Passenger"
FROM train
WHERE Survived = 1 AND Pclass = 3 AND sex = "male";

-- WHAT WAS THE SURVIVAL RATE FOR WOMEN AND CHILDREN
SELECT COUNT(sex) FemaleOrChildren, COUNT(sex) * 100 / (SELECT COUNT(sex) FROM train) "Percentage Rate Female Or Children"
FROM train
WHERE Survived = 1 AND (sex = "Female" OR Age < 18);

-- DISPLAY NAME, SEX, AGE, PASSENGERID, FARE OF PASSENGER WHO PAID ARE GREATER THAN OR EQUAL TO  THE MAXIMUM FARE 
SELECT name, sex, passengerid, fare
FROM train
WHERE fare >= (SELECT MAX(fare) FROM train);

-- RETRIEVE THE NAME, FARE DETAILS OF PASSENGERS WHO PAID FARE GREATER THAN AVERAGE FARE
SELECT name, fare
FROM train
WHERE fare > (SELECT AVG(fare) FROM train);

-- WHAT IS THE MAXIMUM AGE OF THE PEOPLE THAT SURVIVE
SELECT *
FROM train
WHERE age = (SELECT MAX(age) FROM train);

-- Find the total number of survivors from the 3rd PClass 
SELECT pclass, COUNT(survived) Total_survived
FROM train
WHERE Survived = 1
GROUP BY pclass
HAVING pclass = 3;

-- Find the total number of male who died in the accident 
SELECT sex, COUNT(sex) total
FROM train
WHERE Survived = 0
GROUP BY sex
HAVING sex = "male";

-- Find the total number of the survivor who embarked the ship from "Southampton"
SELECT Embarked, COUNT(Embarked) Total_Survivor
FROM train
WHERE Survived = 1
GROUP BY Embarked
HAVING Embarked = "S";

-- Print the total number of cells having missing values in the Age column.
SELECT COUNT(*) total_null_age
FROM train
WHERE age IS NULL;

-- Print the sum of the passengerid of age cells with missing values.
SELECT sum(passengerid) Total
FROM train
WHERE age IS NULL;

/* Derive a new column called “AdultOrChild” having categorical values as “Adult” or “Child” derived from Age column 
Hint: A person having Age >=18 is an “Adult” and the one having Age < 18 is a “Child”. and if age is null, the new colunm show display null */
SELECT *, 
CASE
	WHEN age < 18 THEN "Child"
    WHEN age IS NULL THEN NULL
    ELSE "Adult"
END AS AdultOrChild
FROM train;

-- Find its relation with the “Survived” Column and print the total number of survivors
SELECT 
CASE
	WHEN age < 18 THEN "Child"
    WHEN age IS NULL THEN NULL
    ELSE "Adult"
END AS AdultOrChild, COUNT(Survived) Total_survived
FROM train
WHERE Survived = 1
GROUP BY adultorchild;
