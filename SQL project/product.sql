CREATE DATABASE product_db;
USE product_db;
-- CREATE TABLE CUSTOMERS -- CUSTOMER_ID, FIRST_NAME, LAST_NAME
CREATE TABLE customers(
customer_id int PRIMARY KEY NOT NULL,
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50) NOT NULL);
-- INSERTING VALUES INTO CUSTOMERS TABLE
INSERT INTO customers VALUES
(1,	'Tosin', 'Tola'),
(2,	'Mike',	'Yemi'),
(3,	'Kunle', 'Rhoda'),
(4,	'Shola', 'Philip'),
(5,	'Bimbo', 'Seun'),
(6,	'Tunde', 'Olaifa'),
(7,	'Yusuf', 'Olawale'),
(8,	'Kazzem', 'Ibrahim');

-- CREATE TABLE ORDERS -- ORDER_ID, CUSTOMER_ID, QUANTITY, ORDER_DATE
CREATE TABLE orders(
order_id int PRIMARY KEY NOT NULL,
customer_id int, FOREIGN KEY (customer_id) references customers(customer_id),
order_date DATE NOT NULL);
-- INSERTING VALUES INTO ORDERS TABLE
INSERT INTO orders VALUES
(1, 2, '2020-04-02'),
(2, 4, '2021-01-10'),
(3, 2, '2022-11-15'),
(4, 6, '2023-09-25'),
(5, 8, '2019-07-08'),
(6, 2, '2018-03-04');

-- CREATE TABLE VENDORS -- VENDOR_ID, VENDOR_NAME
CREATE TABLE vendors(
vendor_id int PRIMARY KEY NOT NULL,
vendor_name VARCHAR(100) NOT NULL);
-- INSERTING VALUES INTO VENDORS
INSERT INTO vendors VALUES
(150, 'Victory Warri'),
(160, 'John Lagos'),
(170, 'Omokaro Asaba'),
(180, 'Chinelo Abuja'),
(190, 'Ken Lagos');

-- CREATE TABLE PRODUCTS -- PRODUCT_ID, PRODUCT_NAME, VENDOR_ID, PRICE, ORDER_ID
CREATE TABLE products(
product_id int PRIMARY KEY NOT NULL,
product_name VARCHAR(100) NOT NULL,
vendor_id int, FOREIGN KEY(vendor_id) references vendors(vendor_id),
price FLOAT NOT NULL,
order_id int, FOREIGN KEY (order_id) references orders(order_id));
-- INSERTING VALUES INTO PRODUCTS 
INSERT INTO products VALUES
(1,	'Chocolate Chip', 190, 4.5,	2),
(2,	'Ice Cream', 150, 10.5, 3),
(3,	'Berries', 170,	15.5, 5),
(4,	'Orange Juice',	180, 14.5, 2),
(5,	'Cookies', 160,	25.5, 1);

-- CREATE TABLE ORDER_DETAILS -- ORDER_DETAILS_ID, ORDER_ID, PRODUCT_ID, QUANTITY
CREATE TABLE order_details(
order_details_id int PRIMARY KEY NOT NULL,
order_id int, FOREIGN KEY (order_id) references orders(order_id),
product_id int, FOREIGN KEY (product_id) references products(product_id),
quantity int);
-- INSERTING VALUES INTO ORDER_DETAILS 
INSERT INTO order_details VALUES
(1, 3,	2,	5),
(2,	1,	4,	8),
(3,	2,	5,	12),
(4,	6,	2,	10),
(5,	4,	1,	15),
(6,	5,	3,	25);

-- CREATE TABLE SUPPLIERS -- SUPPLIER_ID, SUPPLIER_NAME
CREATE TABLE suppliers(
supplier_id int PRIMARY KEY NOT NULL,
supplier_name VARCHAR(100) NOT NULL);
-- INSERTING VALUES INTO SUPPLIERS
INSERT INTO suppliers VALUES
(1,	'China Warehouse'),
(2,	'Turkey Shop'),
(3,	'United Kingdom'),
(4,	'United State'),
(5,	'Canada'),
(6,	'Spain');

-- CREATE TABLE PRODUCT_SUPPLIERS -- PRODUCT_ID, SUPPLIER_ID
CREATE TABLE product_suppliers(
product_id int, FOREIGN KEY (product_id) references products(product_id),
supplier_id int, FOREIGN KEY (supplier_id) references suppliers(supplier_id));
-- INSERTING VALUES INTO PRODUCT_SUPPLIERS
INSERT INTO product_suppliers VALUES 
(5,	1),
(2,	2),
(1,	3),
(2,	4),
(4,	5),
(3,	6);

-- 1.RETRIEVE A LIST OF ALL PRODUCTS WITH THEIR VENDOR NAMES
SELECT product_name, vendor_name
FROM products
JOIN vendors
ON products.vendor_id = vendors.vendor_id;

-- 2.LIST ALL PRODUCTS ORDERED ON A SPECIFIC DATE
SELECT product_name, order_date
FROM products
JOIN orders
ON products.order_id = orders.order_id
WHERE order_date like '____-__-15';

-- 3.FIND THE TOTAL SALES REVENUE FOR EACH VENDOR
SELECT vendor_name, product_name, sum(price)
FROM vendors
JOIN products
ON vendors.vendor_id = products.vendor_id
GROUP BY product_name, vendor_name
ORDER BY sum(price) desc;

-- 4.LIST THE PRODUCTS WITH THEIR PRICES AND THE TOTAL REVENUE GENERATED FOR EACH
SELECT product_name, price, (quantity * price) AS 'Revenue'
FROM orders
JOIN order_details
ON order_details.order_id = orders.order_id
JOIN products
ON products.product_id = order_details.product_id
ORDER BY revenue DESC;

-- 5.RETRIEVE A LIST OF ALL CUSTOMERS WHO HAVENT PLACED ANY ORDERS(no customer)
SELECT *
FROM customers
LEFT JOIN orders
ON customers.customer_id = orders.customer_id
WHERE order_id IS NULL;