-- Which sales person hasnt make any sales in the company
SELECT DISTINCT salesperson
FROM people
LEFT JOIN sales
ON people.SPID = sales.SPID
WHERE PID IS NULL;

-- Print details of shipments (sales) where amounts are > 2,000 and boxes are <100?
SELECT *
FROM sales
WHERE amount > 2000 AND Boxes < 100;

-- How many shipments (sales) each of the sales persons had in the month of January 2022?
SELECT salesperson, COUNT(*) 'Number of Sales'
FROM sales
INNER JOIN people
ON sales.SPID = people.SPID
WHERE saledate LIKE '2022-01-__'
GROUP BY salesperson
ORDER BY 2 DESC;

-- Which product sells more boxes? Milk Bars or Eclairs?
SELECT product, SUM(boxes) 'Total boxes'
FROM products
INNER JOIN sales
ON sales.PID = products.PID
GROUP BY product
HAVING product = 'Eclairs' OR product = 'Milk Bars'
ORDER BY 2 DESC;

-- Which product sold more boxes in the first 7 days of February 2022? Milk Bars or Eclairs?
SELECT product, SUM(boxes) 'Total boxes'
FROM products
INNER JOIN sales
ON sales.PID = products.PID
WHERE saledate BETWEEN '2022-02-01' AND '2022-02-07'
GROUP BY product
HAVING product = 'Eclairs' OR product = 'Milk Bars'
ORDER BY 2 DESC;

-- Which shipments had under 100 customers & under 100 boxes? Did any of them occur on Wednesday?
SELECT *, 
CASE WHEN WEEKDAY(saledate) = 2 THEN 'Wednesday Shipment'
ELSE '' END AS 'Days shipment'
FROM sales
WHERE Customers < 100 AND Boxes < 100;

-- What are the names of salespersons who had at least one shipment (sale) in the first 7 days of January 2022?
SELECT salesperson, COUNT(sales.spid) 'Number of Sales'
FROM people 
INNER JOIN sales
ON sales.SPID = people.SPID
WHERE saledate BETWEEN '2022-01-01' AND '2022-01-07'
GROUP BY salesperson
HAVING COUNT(sales.SPID) > 1
ORDER BY 2 DESC;

-- Which salespersons did not make any shipments in the first 7 days of January 2022?
SELECT Salesperson 
FROM people
WHERE salesperson NOT IN(
							SELECT DISTINCT salesperson
							FROM people
							JOIN sales
							ON sales.SPID = people.SPID
							WHERE saledate BETWEEN '2022-01-01' AND '2022-01-07'
						);

-- How many times we shipped more than 1,000 boxes in each month?
WITH  sales1 AS ( SELECT *, monthname(saledate) months
FROM sales)
SELECT year(saledate) Years, Months, COUNT(months) 'Total Number'
FROM  sales1
WHERE boxes > 1000
GROUP BY months, years
ORDER BY years;

-- Did we ship at least one box of ‘After Nines’ to ‘New Zealand’ on all the months?
WITH sales1 AS (SELECT *, monthname(saledate) months
FROM sales)
SELECT year(saledate) Years, Months, Product, Geo, COUNT(boxes)
FROM sales1
INNER JOIN geo
ON geo.GeoID = sales1.GeoID
INNER JOIN products
ON products.PID = sales1.PID
WHERE product = 'After Nines' AND geo = 'New Zealand'
GROUP BY months, product, geo, years
HAVING COUNT(boxes) >= 1
ORDER BY years, months;

-- India or Australia? Who buys more chocolate boxes on a monthly basis?
SELECT year(saledate) Years, month(saledate) Months,
SUM(CASE WHEN g.geo= 'India' = 1 THEN boxes ELSE 0 END) 'India Boxes',
SUM(CASE WHEN g.geo= 'Australia' = 1 THEN boxes ELSE 0 END) 'Australia Boxes'
FROM sales s
JOIN geo g 
ON g.GeoID=s.GeoID
GROUP BY years, months
ORDER BY years, months;
