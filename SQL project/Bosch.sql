-- CREATE DATABASE bosch;
USE bosch;
-- 1. WHICH PRODUCT CATEGORY HAS THE HIGHEST AVERAGE PROFIT MARGIN?
SELECT product_category, ROUND(AVG(profit_margin),2) 'Average Profit Margin'
FROM bosch
GROUP BY product_category
ORDER BY 2 DESC
LIMIT 1;

-- 2. WHAT IS THE TOTAL DEMAND FORECAST FOR PRODUCTS IN THE ASIA-PACIFIC REGION? 
SELECT region, SUM(demand_forecast) 'Sum demand forecast'
FROM bosch
GROUP BY region
HAVING region = 'Asia-Pacific';

-- 3. WHICH REF=GION HAS THE LOWEST AVERAGE CURRENT PRICE FOR PRODUCT?
SELECT Region, ROUND(AVG(current_price),2) 'Average Current Price'
FROM bosch
GROUP BY region
ORDER BY 2
LIMIT 1;

-- 4. HOW DOES THE AVERAGE INVENTORY LEVEL COMPARE BETWEEN PRODUCTS WITH 'IMPROVED' AND 'UNCHANGED' OPTIMIZATION RESULTS?
SELECT optimization_result, ROUND(AVG(inventory_level),2) 'Average Inventory Level'
FROM bosch
GROUP BY optimization_result
HAVING optimization_result IN ('Improved','Unchanged');

-- 5. WHAT IS THE AVERAGE MANUFACTURING COST FOR CONSUMER GOODS IN NORTH AMERICA?
SELECT product_category, region, ROUND(AVG(manufacturing_cost),2) 'Average Manufacturing Cost'
FROM bosch
GROUP BY product_category, region
HAVING product_category = 'Consumer Goods' AND region = 'North America';

-- 6. LIST THE TOP 5 PRODUCTS WITH THE HIGHEST PROFIT MARGIN
SELECT product_category, ROUND(SUM(profit_margin),2) 'Highest Profit Margin'
FROM bosch
GROUP BY product_category
ORDER BY 2 DESC
LIMIT 5;

-- 7. WHAT IS THE AVERAGE SUPPLY CHAIN COST FOR PRODUCTS IN THE AUTOMOTIVE CATEGORY?
SELECT product_category, ROUND(AVG(supply_chain_cost),2) 'Average Supply Chain Cost'
FROM bosch
GROUP BY product_category
HAVING product_category = 'Automotive';

-- 8. WHICH PRODUCT HAS THE HIGHEST DEMAND FORECAST IN THE SOUTH AMERICA REGION
SELECT product_category, SUM(demand_forecast) 'Highest Demand Forecast'
FROM bosch
WHERE region = 'South America'
GROUP BY 1
ORDER BY 2 DESC
LIMIT 1;

-- 9. COMPARE THE AVERAGE PROFIT MARGIN OF PRODUCTS WITH 'IMPROVED' VERSUS 'UNCHANGED' OPTIMIZATION RESULTS ACROSS ALL CATEGORIED
SELECT product_category, optimization_result, ROUND(AVG(profit_margin),2) 'Average Profit Margin'
FROM bosch
GROUP BY product_category, optimization_result
ORDER BY product_category;

-- 10. WHAT IS THE TOTAL INVENTORY LEVEL FOR PRODUCTS WITH NEGATIVE PROFIT MARGIN? 
SELECT product_category, SUM(inventory_level) 'Total Inventory Level'
FROM bosch
WHERE profit_margin < 0
GROUP BY 1