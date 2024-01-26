/* 
Data Briefing
1.Date: The Date on which Sales has Done.(Day,Month,Year).
2.Customer_Age: Represents the age of the Customer who do purchases.
3.Age_Group : The Age Group of the customer belongs to.
4.Customer_gender: Gender of the Customer.
5.Country : The name of the country which customer belongs to.
6.State : The name of the state which customer belongs to.
7.Product_category : The category of the Sold product.
8.Sub_category : The sub_category of the product.
9.Order_qunatity: Quantity of the Orders done .
10.Unit_Cost: The unit cost of the each product.
11.Unit_Price : The unit Price of each product.
12.Profit : Net profit of the each Product.
cost : The total cost of the Order Qunatity of each Customer
14.Revenue: The total revenue of the each customer.
*/
CREATE DATABASE bike_sales;
USE bike_sales;
-- Analysing the Bike Sales Data:
-- how many country,state,product,product_Category
SELECT COUNT( DISTINCT country) Total_Country, COUNT(DISTINCT state) Total_state, COUNT(DISTINCT product) Total_product, COUNT(DISTINCT product_category) Total_product_category
FROM bike_sales;

-- What are the unique countries names
SELECT DISTINCT Country
FROM bike_sales;

-- What are the product category with names
SELECT DISTINCT product_category
FROM bike_sales;

-- Replace M to Male and F to Female
UPDATE bike_sales
SET customer_gender = REPLACE(customer_gender, 'F', 'Female')
WHERE customer_gender = 'F';
UPDATE bike_sales
SET customer_gender = REPLACE(customer_gender, 'M', 'Male')
WHERE customer_gender = 'M';

-- Age Distribution of Customers
SELECT DISTINCT age_group, COUNT(age_group)
FROM bike_sales
GROUP BY age_group;

-- Top 5 Most Profitable Year
SELECT Year, SUM(profit) "Profitable Year"
FROM bike_sales
GROUP BY Year
ORDER BY 2 DESC;

-- Top 5 Most Profitable Month
SELECT Month, SUM(profit) "Profitable Month"
FROM bike_sales
GROUP BY month
ORDER BY 2 DESC;

-- Gender Having most ordered
SELECT customer_gender, COUNT(customer_gender) "Most gender order"
FROM bike_sales
GROUP BY customer_gender
ORDER BY 2 DESC;

-- Country/State Having highest revenue
SELECT country, sum(revenue) "highest Revenue"
FROM bike_sales
GROUP BY country
ORDER BY 2 DESC;
SELECT state, sum(revenue) "highest Revenue"
FROM bike_sales
GROUP BY state
ORDER BY 2 DESC;


-- category/Sub-Category generates most profit.
SELECT Product_Category, SUM(profit) "Most Profit"
FROM bike_sales
GROUP BY Product_Category
ORDER BY 2 DESC;

-- Customer Age According to Country
SELECT country, age_group, COUNT(Customer_Age) 'Total Age group'
FROM bike_sales
GROUP BY country, Age_Group
ORDER BY country;

-- How many orders were made in Canada or France?
SELECT COUNT(Order_Quantity)
FROM bike_sales
WHERE country in('canada', 'france');

-- How many Bike Racks orders were made from Canada?
SELECT country, Sub_Category, COUNT(Sub_Category) 'Total'
FROM bike_sales
GROUP BY country, Sub_Category
HAVING country = 'canada' AND Sub_Category = 'Bike Racks'; 

-- Sales in Each State of France
SELECT state, COUNT(state) Total
FROM bike_sales
WHERE country = 'france'
GROUP BY state
ORDER BY total DESC;

-- How many sales were made per category?
SELECT sub_category, COUNT(sub_category) Total
FROM bike_sales
GROUP BY sub_Category
ORDER BY total DESC;

-- Increase the revenue by 10% to every sale made in France
select *, revenue + (revenue * 0.1) 'New Revenue'
FROM bike_sales
WHERE country = 'france';

-- Get the mean revenue of the sales group Adults (35-64) in United States
SELECT age_group, ROUND(AVG(revenue), 2) 'Average Revenue'
FROM bike_sales
WHERE country = 'United States'
GROUP BY Age_Group
HAVING Age_Group = 'Adults (35-64)';

-- Get the mean revenue of the Adults (35-64) sales group
SELECT age_group, ROUND(AVG(revenue), 2) 'Average Revenue'
FROM bike_sales
GROUP BY Age_Group
HAVING Age_Group = 'Adults (35-64)';

-- Get all the sales made in the state of Kentucky
SELECT *
FROM bike_sales
WHERE State = 'kentucky';

-- Modify all Unit_Price values adding 3% tax to them
SELECT *, unit_price + ROUND((unit_price * (3/100)), 2) 'tax Included'
FROM bike_sales;

-- Add and calculate a new Calculated_Revenue column
		-- Formula : Calculated_Revenue=Cost+Profit
SELECT *, cost+profit Calculated_revenue
FROM bike_sales;
-- Add and calculate a new Calculated_Cost column
		-- Formula: Calculated_Cost=Order_Quantity * Unit_Cost
SELECT *, order_quantity * unit_cost Calculated_cost
FROM bike_sales;

-- How many orders were made in May,June,July of 2016?
SELECT COUNT(*) Total_Orders
FROM bike_sales
WHERE month in ('may', 'june', 'july') and year = 2016;

-- How many orders were made in May of 2016?
SELECT COUNT(*) Total_Orders
FROM bike_sales
WHERE month = 'may' and year = 2016;

-- What is the mean Order_Quantity of orders with less than 10K in revenue?
SELECT AVG(order_quantity) 'Average order Quantity'
FROM bike_sales
WHERE revenue < 10000;
-- What is the mean Order_Quantity of orders with more than 10K in revenue?
SELECT AVG(order_quantity) 'Average order Quantity'
FROM bike_sales
WHERE revenue > 10000;
-- Get the sale with the highest revenue
SELECT *
FROM bike_sales
ORDER BY revenue DESC
LIMIT 1;
-- Get the top-5 sales with the highest revenue.
SELECT *
FROM bike_sales
ORDER BY revenue DESC
LIMIT 5;
-- How many sales with more than 500 in Revenue were made by men?
SELECT COUNT(*) total
FROM bike_sales
WHERE Revenue > 500 AND Customer_Gender = 'Male';
