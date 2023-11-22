-- creating a database
CREATE DATABASE sales_db;
USE sales_db;

-- 1. Retrieve the total revenue for the month of January.
select month, sum(revenue) as revenue_january
from sales
where month = 'jan'
group by month;

-- 2. Find the number of orders placed by customer Cust D
select customername, count(customername) as number_of_orders
from sales 
where customername = 'cust d'
group by customername;

-- 3. What is the highest unit price for any product in the dataset?
select productname, max(unitprice) as max_unit_price 
from sales 
group by productname;

-- 4. Retrieve the total quantity of 'dried pears' sold in February.
select productname, sum(quantity) as total_quantity
from sales 
where month = 'feb'
group by productname
having ProductName = 'dried pears';

-- 5. Find the average shipping fee for orders paid by Credit Card
select paymenttype, round(avg(shippingfee), 2) as avg_shipping_fee
from sales 
group by PaymentType
having PaymentType = 'credit card';

-- 6. List the unique shipper names in the dataset.
select distinct shippername 
from sales;

-- 7. Retrieve the top 5 products with the highest revenue
select productname, max(revenue) as max_revenue
from sales
group by ProductName
order by max_revenue desc
limit 5;

-- 8. How many orders were shipped by 'Shipping Company A' in March
select shippername, count(shippername) as number_of_shippment
from sales 
where month = 'mar'
group by ShipperName
having ShipperName = 'Shipping Company A';

-- 9. Find the total revenue for each quarter.
select quarter, round(sum(revenue), 2) as total_revenue
from sales 
group by quarter;

-- 10. Find the total revenue for each payment type in January.
select paymenttype, round(sum(revenue), 2) as total_revenue_jan
from sales
where month = 'jan'
group by PaymentType;

-- 11. Calculate the total revenue for each region in the dataset.
select region, round(sum(revenue), 2) as total_revenue
from sales
group by Region;
