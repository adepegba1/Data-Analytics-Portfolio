CREATE DATABASE supermarketdb;
USE supermarketdb;

-- create product table -- productId, product_name, brand, UoM
CREATE TABLE products(
Product_id INT PRIMARY KEY NOT NULL,
Product_name VARCHAR(100) NOT NULL,
Brand VARCHAR(100) NOT NULL,
UoM VARCHAR(50) NOT NULL);
INSERT INTO products VALUES
(100, 'llly Ground 250 Gr', 'illy', 'Kg'),
(200, 'Viktory Ground 500 Gr', 'Viktory', 'Kg'),
(300, 'San Pellegrino Sparkling 500 Ml', 'Water', 'Bottle'),
(400, 'Mango Puree Sorbetto', 'Ice Cream', 'Kg'); 
-- Create a sale table -- salesId, product_id, customer_name, location, salesperson, customer_type, date, quantity, value_in_rupiah
CREATE TABLE sales(
Sales_id INT PRIMARY KEY NOT NULL,
Product_id INT, FOREIGN KEY(product_id) REFERENCES products(product_id) ON DELETE SET NULL,
Customer_Name VARCHAR(100) NOT NULL,
Location VARCHAR(50) NOT NULL,
SalesPerson VARCHAR(25) NOT NULL,
Customer_Type VARCHAR(20) NOT NULL,
Date Date NOT NULL,
Quantity INT NOT NULL,
Value_In_Rupiah BIGINT NOT NULL);
INSERT INTO sales VALUES
(1, 100, 'Holiday Inn', 'Bandung', 'Gates', 'Hotel','2019-10-01', 25, 50000000),
(2, 200, 'Mckinsey', 'Jakarta', 'Kristi', 'Corporate', '2019-11-01', 300, 35000000),
(3, 300, 'Ritz Caelton', 'Jakarta', 'Oprah', 'Hotel', '2019-12-1', 40, 65000000),
(4, 100, 'McD', 'Makassar', 'Mark', 'Restaurant', '2018-10-01', 60, 85000000),
(5, 200, 'Sate Senayan', 'Bali', 'Mercy', 'Restaurant', '2018-11-01', 220, 29000000),
(6, 300, 'Hypermart', 'Medan', 'Frans', 'Retail', '2018-12-01', 20, 22000000),
(7, 100, 'Holiday Inn', 'Jakarta', 'Gates', 'Hotel', '2016-10-01', 29, 58000000),
(8, 200, 'McD', 'Jakarta', 'Mark', 'Restaurant', '2016-11-01', 100, 200000000),
(9, 300, 'Sate Senayan', 'Jakarta', 'Mercy', 'Restaurant', '2016-12-01', 150, 19000000),
(10, 100, 'Grand Hayat', 'Jakarta', 'Merry', 'Hotel', '2017-10-01', 33, 58000000),
(11, 200, 'Microsoft', 'Jakarta', 'Kristi', 'Corporate', '2017-11-01', 22, 40000000),
(12, 300, 'Google', 'Jakarta', 'William', 'Corporate', '2017-12-01', 150, 18000000);

-- Retrieve Sales report where value is greater or equal to IDR 30.000.000 and ranked from big to small-value.
SELECT *
FROM Sales 
WHERE Value_In_Rupiah >= 30000000
ORDER BY Value_In_Rupiah DESC;

-- Retrieve CustomerName, CustomerType,Date, and Value from Sales table and sort by Date (new==>old)
SELECT customer_name, customer_type, Date, Value_In_Rupiah
FROM Sales
ORDER BY 3 DESC;

-- Rename column name Customer_Type become Channel from the above question
SELECT customer_name, customer_type AS Channel, Date, Value_In_Rupiah
FROM sales
ORDER BY 3 DESC;

-- A salesperson named Kristi asked me to only include sales from 2017 to 2019, sorted by value (from big to small)
SELECT *
FROM sales 
WHERE date BETWEEN '2017-01-01' AND '2019-12-31' AND SalesPerson = 'Kristi'
ORDER BY 9 DESC;

-- Retrieve the details of the all Products regardless of whether those products have made sales or not.
SELECT *
FROM products pro
LEFT JOIN sales sal
ON pro.product_id = sal.product_id;

-- Retrieve the total quantity, total sales and price sold for each product in the database that i have made
SELECT  product_Name, SUM(quantity) AS Total_Quantity, SUM(Value_In_Rupiah) AS Total_Sales,
		ROUND(SUM(Value_In_Rupiah) / SUM(Quantity), 2) AS Unit_price
FROM products
LEFT JOIN sales
ON products.product_id = Sales.product_id
GROUP BY product_Name;

-- Retrieve the big contributor based on Customer Type
SELECT customer_type, SUM(Value_In_Rupiah)
FROM sales
GROUP BY customer_type
ORDER BY 2 DESC;

-- Retrieve products that have been sold
SELECT DISTINCT product_name
FROM products
INNER JOIN sales 
ON products.product_id = sales.product_id;

-- Retrive the yearly sales 
SELECT year(date)AS Year, SUM(Value_In_Rupiah) AS Total_Sale
FROM sales
GROUP BY year;
