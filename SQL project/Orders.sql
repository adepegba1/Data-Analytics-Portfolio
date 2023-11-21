USE order_db;
-- RETRIEVEING ALL DATA
SELECT *
FROM revenue;

-- 1. FIRST SOLUTION FIND THE TOTAL REVENUE FOR THE PRODUCT 'CHOCOLATE CHIP' IN 2020
SELECT product, date, sum(revenue) AS 'Total Revenue'
FROM revenue
GROUP BY product, date
HAVING product = 'chocolate chip' AND (date >= '2020-01-01' AND date <= '2020-12-31')
ORDER BY date;

-- 1. SECOND SOLUTION FIND THE TOTAL REVENUE FOR THE PRODUCT 'CHOCOLATE CHIP' IN 2020
SELECT product, sum(revenue) AS 'Total Revenue'
FROM revenue
WHERE DATE BETWEEN '2020-01-01' AND '2020-12-31'
GROUP BY product
HAVING product = 'chocolate chip';

-- 2. LIST THE UNIQUE CUSTOMERS WHO PURCHASED 'CHOCOLATE CHIP'
SELECT product, customer_id, count(customer_id) AS 'Unique Customer'
FROM revenue
GROUP BY product, customer_id
HAVING product = 'chocolate chip'
ORDER BY count(customer_id) desc;

-- 3. FIRST SOLUTION FIND THE TOTAL COST INCURRED FOR 'SUGAR' SALES IN 2019
SELECT product, date, sum(cost) AS 'Total cost'
FROM revenue
GROUP BY product, date
HAVING product = 'sugar' AND (date >= '2019-01-01' AND date <= '2019-12-31')
ORDER BY date; 

-- 3. SECOND SOLUTION FIND THE TOTAL COST INCURRED FOR 'SUGAR' SALES IN 2019
SELECT product, sum(cost)
FROM revenue
WHERE DATE BETWEEN '2019-01-01' AND '2019-12-31'
GROUP BY product
HAVING product = 'sugar';

-- 4. RETRIEVE THE ORDER WITH THE HIGHEST REVENUE
SELECT *
FROM revenue
ORDER BY revenue desc
LIMIT 1;

-- 5. LIST THE CUSTOMER WHO MADE MORE THAN ONE PURCHASE OF 'CHOCOLATE CHIP'
SELECT *
FROM revenue
WHERE product = 'chocolate chip' and units_sold > 1;


-- 6. FIND THE PRODUCT WITH HIGHEST REVENUE
SELECT product, sum(revenue) AS 'Highest Revenue'
FROM revenue
GROUP BY product
ORDER BY sum(revenue) desc;
