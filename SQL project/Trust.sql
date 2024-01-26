CREATE DATABASE trust_db;
USE trust_db;

-- 1. LIST ALL PRODUCT IN ALPABETICAL ORDER BY CATEGORY NAME
SELECT Productid, Productname, supplierid, CategoryID, QuantityPerUnit,
		unitprice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued, CategoryName
FROM products
JOIN categories
USING(CategoryID)
ORDER BY 1;

-- 2. RETRIEVE THE TOTAL OF SALES IN 1997 CATEGORICAL I.E UNITPRICE * QUANTITY - DISCOUNT PRICE
SELECT  CategoryName,
		ROUND(SUM((ord.unitprice * ord.quantity) - (ord.unitprice * ord.quantity * discount)), 2) TotalSaleIn1997
FROM categories cat
JOIN products pro
USING(categoryid)
JOIN orderdetails ord
USING(productid)
JOIN orders
USING(orderid)
WHERE orderdate LIKE '1997%'
GROUP BY categoryname;

-- 3. RETRIEVE THE CUSTOMER (CONTACTNAME) AND SUPPLIERS (COMPANYNAME) BY CITY. SHOW RELATIONSHIP
SELECT contactname, city, 'customer' Relationship
FROM customers
UNION ALL
SELECT contactname, city, 'supplier' Relationship
FROM suppliers
ORDER BY 2;


-- 4. CREATE AN INVOICE FOR THE COMPANY
CREATE VIEW invoice AS
SELECT  ors.ShipName, ors.ShipAddress, ors.ShipCity, ors.ShipRegion, ors.ShipPostalCode, ors.ShipCountry, 
		cus.CustomerID, cus.CompanyName customername, cus.Address, cus.Region, cus.City, cus.PostalCode, cus.Country, 
        CONCAT(emp.firstName, ' ', emp.lastname) Salesperson, 
        ors.OrderID, ors.OrderDate, ors.RequiredDate, ors.ShippedDate, 
        sh.companyname shippername, 
        pro.ProductID, pro.ProductName, ors.Freight,
        ord.UnitPrice, ord.Quantity, ord.Discount, 
        ROUND((ord.unitprice * ord.quantity) - (ord.unitprice * ord.quantity * discount), 2) Extendedprice        
FROM orders ors
JOIN customers cus
USING(customerid)
JOIN employees emp
USING(employeeid)
JOIN shippers sh
USING(shipperid)
JOIN orderdetails ord
USING(orderid)
JOIN products pro
USING(productid)
ORDER BY pro.ProductID;

-- 5. CREATE ORDER DETAILS EXTENDED I.E UNITPRICE*QUANITY AND SUBSTRACT THE DISCOUNT
SELECT 	OrderID, ProductID, ProductName, ord.UnitPrice,Quantity, Discount,
		ROUND((ord.unitPrice * quantity) - (ord.unitPrice * quantity * discount), 2) ExtendedPrice
FROM orderdetails ord
JOIN products
USING(productid)
ORDER BY 7;

-- 6. RETRIEVE THE ORDER DETAILS SUBTOTAL OF EACH ORDERID
SELECT orderid, ROUND(SUM((unitPrice * quantity) - (unitPrice * quantity * discount)), 2) Subtotal
FROM orderdetails
JOIN orders
USING(orderid)
WHERE shippeddate IS NOT NULL
GROUP BY orderid;

-- 7. RETRIEVE THE CATEGORYNAME, PRODUCTNAME AND THE PRODUCTSALES FOR 1997
SELECT 	categoryname, productname,
		ROUND(SUM((ord.unitprice * ord.quantity) - (ord.unitprice * ord.quantity * discount)), 2) ProductSales
FROM products pro
JOIN categories
USING(categoryid)
JOIN orderdetails ord
USING (productid)
JOIN orders
USING(orderid)
WHERE orderdate LIKE '1997%'
GROUP BY CategoryName, ProductName
ORDER BY 3;

-- 8. RETRIEVE THE PRODUCT ABOVE THE AVERAGE UNIT PRICE
SELECT productid, productname, UnitPrice
FROM products
WHERE UnitPrice > ( SELECT AVG(UnitPrice) FROM products);

-- 9. RETRIEVE THE PRODUCTS BY CATEGORIES
SELECT categoryName, productName, quantityperunit, unitprice, discontinued
FROM products
JOIN categories
USING (categoryid);

-- 10. RETRIEVE THE FIRST QUARTER ORDERS BY CUSTOMERID, COMPANYNAME,CITY AND COUNTRY AND THE TOTAL SALES
SELECT customerid, companyname, city, country,
		ROUND(SUM((ord.unitprice * ord.quantity) - (ord.unitprice * ord.quantity * discount)), 2) TotalSales
FROM customers
JOIN orders
USING (customerid)
JOIN orderdetails ord 
USING(orderid)
WHERE quarter(orderdate) = 1
GROUP BY customerid, companyname, city, country
ORDER BY 4;

-- 11. RETRIEVE THE SALES OF PRODUCT BY CATEGORIESID, CATEGORYNAME AND PRODUCTNAME IN 1997
SELECT cat.categoryid, cat.categoryname, productname,
		ROUND(SUM((ord.unitprice * ord.quantity) - (ord.unitprice * ord.quantity * discount)), 2) ProductSales
FROM categories cat
JOIN products pro 
USING (categoryid)
JOIN orderdetails ord
USING(productid)
JOIN orders
USING(orderid)
WHERE orderdate LIKE '1997%'
GROUP BY cat.categoryid, cat.categoryname, productname
ORDER BY 3;

-- 12. RETRIEVE THE TOTAL FREIGHT FOR ALL THE PRODUCTNAME ORDER BY CATEGORYNAME 
SELECT productname, categoryname, sum(Freight)
FROM products
JOIN categories
USING(categoryid)
JOIN orderdetails
USING(productid)
JOIN orders
USING(orderid)
GROUP BY productname, categoryname;

-- 13. SUMMARY OF SALES BY QUARTERLY
SELECT YEAR(orderdate) Year, QUARTER(orderdate) Quarterly, 
		ROUND(SUM((unitPrice * quantity) - (unitPrice * quantity * discount)), 2) TotalSales
FROM orderdetails
JOIN orders
USING(orderid)
GROUP BY YEAR(orderdate), QUARTER(orderdate)
ORDER BY 1;

-- 14. SUMMARY OF SALES BY YEAR
SELECT YEAR(orderdate) Year,
		ROUND(SUM((unitPrice * quantity) - (unitPrice * quantity * discount)), 2) TotalSales
FROM orderdetails
JOIN orders
USING(orderid)
GROUP BY YEAR(orderdate)
ORDER BY 1;

-- 15. HOW MANY DAYS DOES IT TAKES FOR ORDER THAT ARE SEAFOOD TO BE SHIPPED
SELECT  OrderID, CustomerID, EmployeeID, OrderDate, ShippedDate, datediff(shippeddate, orderdate) DayOfDifferent, RequiredDate,ShipperID, 
		Freight, ShipName, ShipAddress, ShipCity, ShipRegion, ShipPostalCode, ShipCountry
FROM orders
-- WHERE datediff(shippeddate, orderdate) IS NOT NULL
ORDER BY DayOfDifferent;

-- 16. RETRIEVE THE CURRENT PRODUCT IN STOCK
SELECT *
FROM products
WHERE UnitsInStock > 0
ORDER BY UnitsInStock;

-- 17. RETRIEVE THE TOTAL OF ALL SHIPPED ORDER BY ORDERID AND SHIPPEDDATE
SELECT orderid, shippeddate, ROUND(SUM((unitPrice * quantity) - (unitPrice * quantity * discount)), 2) Subtotal
FROM orderdetails
JOIN orders
USING(orderid)
WHERE shippeddate IS NOT NULL
GROUP BY orderid, shippeddate;