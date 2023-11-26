CREATE DATABASE Loan_ability;
USE loan_ability;
SELECT * FROM loan;
-- Retrieve the total number of gender in the dataset order by each
SELECT gender, COUNT(gender)
FROM loan 
GROUP BY gender;

-- How many years will it take customer that borrowed above 512450 and credit histroy is 1 assuming each month is 30 days order by loan_amount descending
SELECT gender, education, self_employed, loan_amount, ROUND((days / 30), 2) AS years, credit_history
FROM loan
WHERE loan_amount > 512450 AND credit_history = 1
ORDER BY 4 DESC; 

-- How many graduate live in the Semiurban area and married is Yes
SELECT area, education, married, count(area) AS Total_married_graudate
FROM loan 
WHERE education = 'graduate' AND area = 'semiurban' AND married = 'yes'
GROUP BY area, education, married;

-- How much did the maximum dependents applicant_income earn and married is no
SELECT *
FROM loan
WHERE dependents = (SELECT MAX(dependents) FROM loan) AND married = 'no'
ORDER BY applicant_income DESC;

-- Retrieve the total value for each credit history
SELECT credit_history, COUNT(credit_history)
FROM loan 
GROUP BY credit_history;

-- What is the lowest days and how much did the coapplicant earn
SELECT *
FROM loan
WHERE days = (SELECT MIN(days) FROM loan);

-- How many not graduate have successful repay back the loan
SELECT education, COUNT(status) AS Repay_Successful
FROM loan
WHERE education = 'not graduate' AND Status = 'y'
GROUP BY education;

-- What is the total loan amount in the dataset
SELECT SUM(loan_amount) AS Total_Loan_Amount
FROM loan;

-- What is the percentage rate of the status of loan in the dataset
SELECT status, count(status) AS staus_count, 
		ROUND(COUNT(status) * 100 / (SELECT COUNT(*) FROM loan), 2) AS Percentage_rate
FROM loan
GROUP BY status;

-- What customer has credit_history 0 and repay the loan order by dependents descending
SELECT *
FROM loan
WHERE Credit_History = 0 AND status = 'y'
ORDER BY Dependents DESC;

