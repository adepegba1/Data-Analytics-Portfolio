-- The task involves analyzing a dataset containing retail sales transactions for electronic products.
CREATE DATABASE retail_sales;
USE retail_sales;
-- 1. Retrieve the total number of orders placed.
SELECT COUNT(*) 'Total Order Placed'
FROM retails;

-- 2. Calculate the total revenue generated from all orders.
SELECT ROUND(SUM(sales), 2) Revenue
FROM retails;

-- 3. List the top 10 best-selling products.
SELECT product, COUNT(product) 'Best_Selling'
FROM retails
GROUP BY product
ORDER BY 2 DESC
LIMIT 10;

-- 4. Find the total quantity of each product sold.
SELECT product, SUM(QuantityOrdered) TotalQuantityOrdered
FROM retails
GROUP BY product
ORDER BY TotalQuantityOrdered DESC;

-- 5. List all orders placed in December Month.
SELECT *
FROM retails
WHERE orderdate LIKE '%-12-%';

-- 6. Identify the city with the highest total sales revenue. 
SELECT city, SUM(sales - priceeach) salesRevenue
FROM retails
GROUP BY city
ORDER BY salesRevenue DESC;

-- 7. Find the average quantity of products ordered per order.
SELECT product, AVG(quantityordered) AvgQuantityOrdered
FROM retails
GROUP BY product;

-- 8. Identify the peak hours for order placement.
SELECT hour, COUNT(hour) Peak_Hours
FROM retails
GROUP BY hour
ORDER BY peak_hours DESC;

-- 9. Find the total number of orders placed in each month.
SELECT monthname(orderdate) Months, count(*) NumberofOrderPlaced
FROM retails
GROUP BY monthname(orderdate)
ORDER BY NumberofOrderPlaced DESC;