CREATE DATABASE student_performance;
USE student_performance;
-- 1. How many student have completed the test preparation course
SELECT TestPreparationCourse, COUNT(TestPreparationCourse) AS NumberStudents
FROM students
GROUP BY TestPreparationCourse
HAVING TestPreparationCourse = 'Completed';

-- 2. How many male and female in the dataset
SELECT Gender, COUNT(gender) AS NumberGender
FROM students
GROUP BY Gender;

-- 3. Retrieve the details of who lunch is free/reduced and did not pass Test Preparation Course 
SELECT *
FROM Students
WHERE lunch = 'free/reduced' AND TestPreparationCourse = 'none';

-- 4. Retrieve the details of student that pass if 75 is the pass mark for each course
SELECT *
FROM students
WHERE mathscore > 75 AND readingscore > 75 AND writingscore > 75;

-- 5. How many student are in each race
SELECT Race, COUNT(race) AS TotalRace
FROM students
GROUP BY race
ORDER BY race;
 
-- 6. Retrieve the details of students that pass Math more than Reading if pass mark is 70
SELECT *
FROM students
WHERE Mathscore > 70 AND readingscore < 70;

-- 7. What is the average score of each course
SELECT  AVG(mathscore) AS AvgMathScore, 
		AVG(readingScore) AS AvgReadingScore,
        AVG(writingScore) AS AvgWritingScore
FROM students;

-- 8. Which parent level of education has the highest student
SELECT ParentalLevelOfEducation, COUNT(ParentalLevelOfEducation) AS NumberofParent
FROM students
GROUP BY ParentalLevelOfEducation
ORDER BY NumberofParent DESC;

-- 9. Retrieve the gender of the female followed by the male in the dataset
SELECT *
FROM students
ORDER BY gender;

-- 10. Which student has the first name that ends with 'n' and last name that start with 'h'
SELECT *
FROM students
WHERE firstname LIKE '%E' AND lastName LIKE 'H%';

-- 11. Retrieve the details of student that will rewrite the 3 courses if failed mark is below 50
SELECT *
FROM students
WHERE mathscore < 50 AND readingscore < 50 AND writingscore < 50;

-- 12. Retrieve the details of student that score at least 100 in any subject group by gender
SELECT gender, count(gender)
FROM students
WHERE mathscore = 100 OR readingscore = 100 OR writingscore = 100
GROUP BY gender;
