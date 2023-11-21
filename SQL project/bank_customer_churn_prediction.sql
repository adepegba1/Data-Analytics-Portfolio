USE bank_db;
-- Retrieve the table
SELECT *
FROM bank;

-- how many customers are in the dataset
SELECT count(customer_id)
FROM bank;

-- how many customers are male and female
SELECT gender, count(*)
FROM bank
GROUP BY gender;

-- what is the average credit score of customer in france
SELECT country, avg(credit_score)
FROM bank
WHERE country = 'france';

-- what is the total number of customers in each  country
SELECT country, count(country) -- OR count(*)
FROM bank 
GROUP BY country;

-- What's the total estimated salary for customers in spain who are not chun
SELECT country, churn,  sum(estimated_salary)
FROM bank
GROUP BY country, churn
HAVING country = 'spain' and churn = 0;