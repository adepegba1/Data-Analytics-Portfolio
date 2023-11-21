-- using the HR Analytics do this 
CREATE DATABASE hr;
USE hr;
SELECT *
FROM hr_analytics;

-- 1. Find the total number of employees in the dataset.
SELECT count(empid) AS total_number
FROM hr_analytics;

-- 2. Retrieve the details of employees who have 'Yes' in the 'Attrition' column
SELECT *
FROM hr_analytics
WHERE attrition = 'Yes';

-- 3. Get the average age of employees in the dataset
SELECT avg(age) AS average_age
FROM hr_analytics;

-- 4. List the distinct job roles available in the dataset
SELECT distinct(jobrole)
FROM hr_analytics;

-- 5. Find the highest monthly income among the employees
SELECT *
FROM hr_analytics
ORDER BY monthlyIncome desc
LIMIT 1;

-- 6. Retrieve the details of employees who work in the 'Sales' department.
SELECT *
FROM hr_analytics
WHERE department = 'sales';

-- 7. List the distinct education fields among the employees.
SELECT distinct(educationfield)
FROM hr_analytics;

-- 8. Find the average years of experience (TotalWorkingYears) of employees
SELECT avg(totalworkingyears)
FROM hr_analytics;

-- 9. Retrieve the details of employees with a monthly income greater than 2000.
SELECT *
FROM hr_analytics
WHERE monthlyincome > 2000
ORDER BY monthlyincome DESC;

-- 10. Count the number of employees in each 'SalarySlab'
SELECT  salaryslab, count(salaryslab) AS number_salaryslab
FROM hr_analytics
GROUP BY salaryslab;

-- 11. Find the highest daily rate among employees with 'Yes' in 'OverTime'.
SELECT *
FROM hr_analytics
WHERE overtime = 'Yes'
ORDER BY dailyrate DESC;

-- 12. Retrieve the details of employees who have 'High' EnvironmentSatisfaction.
SELECT *
FROM hr_analytics
ORDER BY environmentsatisfaction DESC;

-- 13. Find the employee with the highest JobLevel.
SELECT *
FROM hr_analytics
ORDER BY joblevel DESC;

-- 14.Retrieve the details of employees who are 'Single' in 'MaritalStatus' and Yes in 'OverTime'.
SELECT *
FROM hr_analytics
WHERE maritalstatus = 'single' AND
		overtime = 'yes';
        
-- 15. Find the average distance from home for employees in the 'Research & Development' department
SELECT avg(distancefromhome)
FROM hr_analytics
WHERE department = 'Research & Development';

-- 16. Find the total number of male and female employees in the dataset.
SELECT gender, count(gender)
FROM hr_analytics
GROUP BY gender;

-- 17. Retrieve the details of employees with 'Single' marital status and a 'High' JobSatisfaction level
SELECT *
FROM hr_analytics
WHERE maritalstatus = 'single'
ORDER BY jobsatisfaction DESC;

-- 18. Find the average YearsSinceLastPromotion for employees with 'Travel_Rarely'.
SELECT avg(yearssincelastpromotion)
FROM hr_analytics
WHERE businesstravel = 'travel_rarely';

-- 19. Write an SQL query to find the details of employers where attrition is yes and having 5+ yrs of experience in between the age group of 26-35 

select *
from HR_Analytics
where Attrition = 'yes' and TotalWorkingYears >=5 and AgeGroup = '26-35';

-- 20. Fetch the details of the employees having maximum and minimum salary working in different departments who received less than 13% salary hike.

select department, PercentSalaryHike, max(monthlyincome) as max, min(monthlyincome) as min
from HR_Analytics
group by Department, PercentSalaryHike
having PercentSalaryHike < 13;

-- 3.calculate the average monthly income of all the employees who worked more than 3yrs who's education background is medical.
select avg(monthlyincome)
from HR_Analytics
where EducationField = 'medical' and TotalWorkingYears > 3;

-- 4. Identify the total no of male and female employees under attrition is yes and whose marital status is married and haven't received promotion in the last 2 years.
select gender, count(gender)
from HR_Analytics
where Attrition = 'yes' and MaritalStatus = 'married' and YearsSinceLastPromotion = 2
group by gender;

-- 5. Employee with max performance rating but no promotion for 4yrs and above 
select *
from HR_Analytics
where PerformanceRating = (select max(performancerating) from HR_Analytics) 
and YearsSinceLastPromotion >= 4;

-- 6. Employee who has max and min percentage salary hike.
select * 
from HR_Analytics
where percentsalaryhike = (select  min(percentsalaryhike) from HR_Analytics) or
	  percentsalaryhike = (select  max(percentsalaryhike) from HR_Analytics)
 order by PercentSalaryHike desc;

-- 7.Employee working overtime but given min salary hike and are  more than 5year's with company and attrition is 'yes'.
select *
from HR_Analytics
where overtime = 'yes' and YearsAtCompany >= 5 and 
		Attrition = 'yes' and 
		percentsalaryhike = (select min(percentsalaryhike) from HR_Analytics);