-- this is data retrival
USE store;
SELECT *
FROM customers;

-- Retrieving a specific data from the data
SELECT customer_id, first_name, city, points
FROM customers;

-- sorting the table in ascending order
SELECT customer_id, first_name, city, points
FROM customers
ORDER BY points;

-- sorting the table in descending order
SELECT customer_id, first_name, city, points
FROM customers
ORDER BY points desc;

-- Retrieve customer who live in chicago
SELECT *
FROM customers
WHERE city = 'chicago';

-- Retrieve customer who live in chicago, orlando, hampton
SELECT *
FROM customers
WHERE city in ('chicago', 'orlando', 'hampton');

-- Aggregate Function min, max, count, count distinct, sum, avg

-- retrieve minimum points
SELECT min(points) as minimum_points
FROM customers;

-- retrieve maximum point
SELECT max(points) as Maximum_points
FROM customers;

-- retrieve the count in point
SELECT count(points) as Count
FROM customers;

-- Retrieve the average number
SELECT avg(points) as Average
FROM customers;

-- Retrieve the sum of the point
SELECT sum(points) as Sum
FROM customers;

-- Retrieve the distinct points
SELECT count(distinct points) as distinct_points
FROM customers;

-- which customers are born in the year 1986
select *
from customers
where birth_date LIKE '1986%';

-- which customer doesnt have phone number in the records
select *
from customers
where phone IS NULL;

-- calculate the total amount of each product that is been procces in the company.
select o.order_id, p.name, oi.quantity, oi.unit_price, oi.quantity * oi.unit_price as total_amount, os.name
from products p
join  order_items oi
on p.product_id = oi.product_id
join orders o
on o.order_id = oi.order_id
join order_statuses os
on o.status = os.order_status_id
where os.order_status_id = 1;

-- what is the total amount of all the goods shipped
select os.name, sum(oi.quantity * oi.unit_price) as Total_amount
from products p
join  order_items oi
on p.product_id = oi.product_id
join orders o
on o.order_id = oi.order_id
join order_statuses os
on o.status = os.order_status_id
where os.order_status_id = 2
group by os.name;

-- how much did the company generate in the year 2017
select os.name, sum(oi.quantity * oi.unit_price) as Total_Revenue
from shippers sh
join orders o 
on sh.shipper_id = o.shipper_id
join order_statuses os
on os.order_status_id = o.status
join order_items oi
on oi.order_id = o.order_id 
where (shipped_date between '2017-01-01' and '2017-12-31') and
	 os.order_status_id = 2
group by os.name;

-- what the total cost of goods in the company and how many quantity remains
select sum(quantity_in_stock) as total_quantity_in_stock, sum(quantity_in_stock * unit_price) as total_cost
from products;

-- JOINING THE CUSTOMERS TABLES WITH ORDERS TABLE
USE store;
SELECT *
FROM customers
JOIN orders
ON customers.customer_id = orders.customer_id;

-- RETRIEVE THE CUSTOMER FIRST_NAME THAT PLACED ORDER AND THEIR ORDERS DATE
SELECT orders.customer_id, first_name, order_date
FROM customers
JOIN orders
ON customers.customer_id = orders.customer_id;

-- RETRIEVE THE CUSTOMER NAME AND THE PRODUCT THEY PURCHASE 
SELECT customers.first_name, products.name
FROM customers
JOIN orders
ON customers.customer_id = orders.customer_id
JOIN order_items
ON orders.order_id = order_items.order_id
JOIN products
ON order_items.product_id = products.product_id;

-- RETRIEVE THE CUSTOMER FIRST_NAME, THEIR ORDER DATE, THE QUANTITY OF PRODUCT THEY PURCHASE AND THE SHIPPER NAME FOR THE PRODUCT
SELECT first_name, order_date, quantity, shippers.name
FROM customers
JOIN orders
ON customers.customer_id = orders.customer_id
JOIN order_items
ON orders.order_id = order_items.order_id
JOIN products
ON order_items.product_id = products.product_id
JOIN shippers
ON orders.shipper_id = shippers.shipper_id;

-- RETRIEVE THE PRODUCT THAT HAS BEEN SHIPPED
SELECT products.name, order_statuses.name
FROM customers
JOIN orders
ON customers.customer_id = orders.customer_id
JOIN order_items
ON orders.order_id = order_items.order_id
JOIN products
ON order_items.product_id = products.product_id
JOIN shippers
ON orders.shipper_id = shippers.shipper_id
JOIN order_statuses
ON order_statuses.order_status_id = orders.status;

-- RETRIEVE THE CUSTOMER FIRST_NAME THAT PLACED ORDER WHOSE GOODS HAVE BEEN SHIPPED AND THE SHIPPED DATE
SELECT first_name, products.name, shipped_date, order_statuses.name
FROM customers
JOIN orders
ON customers.customer_id = orders.customer_id
JOIN order_items
ON orders.order_id = order_items.order_id
JOIN order_statuses
ON order_statuses.order_status_id = orders.status
JOIN products
ON order_items.product_id = products.product_id
WHERE order_statuses.order_status_id = 2;

