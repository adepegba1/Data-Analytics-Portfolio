-- This database allows the food company to manage its suppliers, products, customers, orders, employees, territories, and
-- product categories effectively, enabling streamlined operations and decision-making processes.
CREATE DATABASE superstore_database;
USE superstore_database;

-- 1. Retrieve the names and contact details of all customers.
SELECT *
FROM customers;

-- 2. List the products along with their corresponding suppliers' names. 
SELECT productid, productName, suppliername
FROM suppliers
JOIN products
USING (supplierid);

-- 3. Find out which customers placed orders on a specific date.
SELECT customerid, customername, productname, orderdate
FROM customers
JOIN orders
USING (customerid)
JOIN orderdetails
USING (orderid)
JOIN products
USING (productid);

-- 4. Display the total quantity of each product sold.
SELECT products.productid, productname, SUM(quantity) Total_Quantity
FROM products
JOIN orderdetails
USING(productid)
GROUP BY productname, products.productid;

-- 5. Show the order details including product names for a given customer.
SELECT orderdetailid, productname, customername, quantity
FROM customers
JOIN orders
USING (customerid)
JOIN orderdetails
USING (orderid)
JOIN products
USING (productid);

-- 6. Find the customers who have not placed any orders yet.
SELECT customerid, customername, contactname, phone
FROM customers
LEFT JOIN orders
USING (customerid)
WHERE orderid IS NULL;

-- 7. List the employees hired after 2020-04-01 date.
SELECT *
FROM employees
WHERE hiredate > '2020-04-01';

-- 8. Show the territories each employee is assigned to.
SELECT employeeid, firstname, territoryid, territoryname
FROM employees
JOIN employeeterritories
USING (employeeid)
JOIN territories
USING (territoryid);

-- 9. Find out which products belong to a specific category.
SELECT categoryname, productname
FROM categories
JOIN productcategories
USING (categoryid)
JOIN products
USING (productid)
ORDER BY categoryname;

-- 10. Display the total number of orders placed by each customer.
SELECT customerid, customername, COUNT(*) 'Total numbers of order'
FROM customers
JOIN orders
USING (customerid)
GROUP BY customerid, customername;

-- 11. List the orders along with the corresponding order details for a given customer.
SELECT orderid, productname, customername, quantity
FROM customers
JOIN orders
USING (customerid)
JOIN orderdetails
USING (orderid)
JOIN products
USING (productid);

-- 12. Find the average quantity of products ordered in each order.
SELECT orderid, AVG(quantity)
FROM orders
JOIN orderdetails
USING (orderid)
GROUP BY orderid;

-- 13. Show the products that have not been ordered yet.
SELECT productid, productname
FROM products
LEFT JOIN orderdetails
USING (productid)
WHERE orderid IS NULL;

-- 14. Display the categories along with the number of products in each category.
SELECT categoryid, categoryname, COUNT(categoryid) 'Number of Products'
FROM categories
JOIN productcategories
USING (categoryid)
JOIN products
USING (productid)
GROUP BY CategoryID, CategoryName;
