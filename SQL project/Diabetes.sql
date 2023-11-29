CREATE DATABASE diabetes_db;
USE diabetes_db;

-- 1. how many patient are in the dataset
SELECT count(*) AS tottal_patient
FROM diabetes;

-- 2. retrieve the top 5 patient with high blood pressure
SELECT *
FROM diabetes 
ORDER BY bloodpressure DESC
LIMIT 5;

-- 3. what are the distinct age in the dataset
SELECT age, count(age) AS frequency_of_age
FROM diabetes
GROUP BY age;

-- 4. what retrieve the highest insulin
SELECT *
FROM diabetes 
ORDER BY insulin DESC
LIMIT 1;

-- 5. retrieve patient with pregancies of 0 and less than 40 years old in descending order by skinthickness
SELECT *
FROM diabetes 
WHERE Pregnancies = 0 AND age < 40
ORDER BY skinthickness DESC;
 
-- 6. what is the average age in  the dataset
SELECT ROUND(AVG(age), 2) AS average_age
FROM diabetes;

-- 7. Retrieve the patient with glucose more than 137, skinthickness less than 35 and outcome is 1 in descending order by glucose
SELECT *
FROM diabetes 
WHERE glucose > 137 AND skinthickness < 35 AND outcome = 1
ORDER BY glucose DESC;

-- 8. what are the values of each outcome in the dataset
SELECT outcome, COUNT(outcome) AS frequency_outcome
FROM diabetes 
GROUP BY outcome;

-- 9. which pregancies months have the highest outcome 1
SELECT Pregnancies, COUNT(Pregnancies) AS highest_outcome, outcome
FROM diabetes
WHERE outcome = 1
GROUP BY Pregnancies, outcome
ORDER BY highest_outcome DESC
LIMIT 1;

-- 10. what the max pregancies months.
SELECT MAX(Pregnancies) AS max_Pregnancies
FROM diabetes;

-- 11. Retrive the lowest glucose in the dataset order by age in descening order
SELECT *
FROM diabetes
WHERE glucose = (SELECT min(Glucose) FROM diabetes)
ORDER BY age DESC;
