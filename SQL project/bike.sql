CREATE DATABASE bikers;
USE bikers;
-- 1. How many male and female can purchase a bike
SELECT gender, COUNT(gender) as PurchasedBikeYES
FROM bike
WHERE PurchasedBike = 'yes'
GROUP BY gender;

-- 2. What is the highest income of single in the dataset
SELECT *
FROM bike 
WHERE MaritalStatus = 'Single'
ORDER BY income DESC
LIMIT 1;

-- 3. Retrieve the total number of single and married in the dataset
SELECT MaritalStatus, COUNT(MaritalStatus) AS MaritalStatusTotal
FROM bike
GROUP BY MaritalStatus;

-- 4. Does the commute distance affect the purchase of bike
SELECT CommuteDistance, purchasedbike, COUNT(CommuteDistance) AS affect_of_distance
FROM bike
GROUP BY CommuteDistance, purchasedbike
ORDER BY commutedistance;

-- 5. How many people that live in North America, partial college and clerical purchase bike
SELECT region, education, occupation, COUNT(purchasedbike) AS PurchaseBikeYES
FROM bike
WHERE PurchasedBike = 'Yes'
GROUP BY region, education, occupation
HAVING region = 'North America' AND education = 'Partial College' AND occupation = 'clerical';

-- 6. Did people that have car purchase more bike in the 
SELECT cars, COUNT(cars)AS purchasedbikeYES
FROM bike
WHERE PurchasedBike = 'Yes'
GROUP BY cars
ORDER BY cars DESC;

-- 7. What are the distinct age and which age has the highest population
SELECT age, COUNT(age) AS NumberOfAge
FROM bike
GROUP BY age
ORDER BY NumberOfAge DESC;

-- 8. Does anyone that earn less than 40,000 will be able to purchase a bike order by income in descending 
SELECT *
FROM bike
WHERE Income < 40000 AND purchasedbike = 'Yes'
ORDER BY income DESC;

-- 9. What is the percentage rate of people that purchase bike and did not
SELECT Purchasedbike, COUNT(purchasedBike),
ROUND(COUNT(purchasedbike) * 100 / (SELECT COUNT(purchasedbike) FROM bike), 2) AS PercentageRate
FROM bike 
GROUP BY purchasedbike;

-- 10. Will Skilled manual purchase more bike than professional
SELECT Occupation, COUNT(occupation) AS TotalYes
FROM bike
WHERE purchasedbike = 'Yes'
GROUP BY occupation
HAVING occupation = 'Skilled Manual' OR occupation = 'Professional';

-- 11. Which martial Status has more home from the dataset
SELECT MaritalStatus, COUNT(homeOwner) as HomeOwnerYes
FROM bike 
WHERE homeowner = 'Yes'
GROUP BY MaritalStatus;

-- 12. Which education background and what age should be our target to sell bike to?
SELECT Education, age, COUNT(Purchasedbike) AS PurchasedBikeYes
FROM bike
WHERE purchasedbike = 'yes'
GROUP BY Education, Age
ORDER BY PurchasedBikeYes DESC, education, Age
LIMIT 5;

-- 13. Which region has the highest age and they purchase bike
SELECT Region, MAX(age) AS MaxAgePurchasedBikeYes
FROM bike
WHERE purchasedbike = 'Yes'
GROUP BY region;

-- 14. What is the highest and lowest income of each occupation from the dataset
SELECT Occupation, MAX(income)AS MaximumIncome, MIN(income) AS MinimumIncome
FROM bike
GROUP BY occupation;

-- 15. Which region has the highest single and purchase more bike
SELECT Region, COUNT(purchasedBike) AS PurchasedBikeYes
FROM bike 
WHERE Purchasedbike = 'Yes' AND MaritalStatus = 'Single'
GROUP BY Region
ORDER BY PurchasedBikeYes DESC;

-- 16. Retrieve the martial status that are single and have given birth. List the number of each children by each gender
SELECT Gender, children, COUNT(children) AS TotalSingle
FROM bike
WHERE MaritalStatus = 'Single' AND Children > 0
GROUP BY gender, children
ORDER BY children DESC;

-- 17. How many customers are in the dataset
SELECT COUNT(*) AS TotalCustomer
FROM bike;
 
-- 18. What is the average income per region and only show region where average income is less than 50,000
SELECT Region,  AVG(income) AS AverageIncomePerRegion
FROM bike
GROUP BY region
HAVING AVG(Income) < 50000;

-- 19. What is the total sum of the income
SELECT SUM(income)
FROM bike;

-- 20. Retrieve the total number of customer that have home, how many cars, and either purchased bike or not?
SELECT homeowner, cars, purchasedbike, COUNT(purchasedbike) AS purchasedbikeTotal
FROM BIKE
GROUP BY homeowner, cars, purchasedbike
HAVING homeowner = 'Yes'
ORDER BY Cars;