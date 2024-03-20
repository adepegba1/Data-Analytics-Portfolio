-- Project Title: Sales Data Management System
-- Description:
-- This project involves creating a MySQL database for a Sales Data Management System. 
-- The system should store information about sales transactions, customers, products, and sales representatives. 
CREATE DATABASE sales_data_management_system;
USE sales_data_management_system;

-- sales transaction includes details such as transaction ID, transaction date, customer ID, product ID, Representative_id and quantity sold.
CREATE TABLE sales_transaction(
Transaction_id INT PRIMARY KEY NOT NULL,
Transaction_date DATE NOT NULL,
Customer_id INT, FOREIGN KEY(customer_id) REFERENCES customers(customer_id) ON DELETE SET NULL,
Product_id INT, FOREIGN KEY(product_id) REFERENCES products(product_id) ON DELETE SET NULL,
Representative_id INT, FOREIGN KEY(Representative_id) REFERENCES Sales_representative(Representative_id) ON DELETE SET NULL,  
Quantity_sold INT);

-- Customer information comprises customer ID, name, email, and address
CREATE TABLE Customers(
Customer_id INT PRIMARY KEY NOT NULL,
Customer_name VARCHAR(255) NOT NULL,
Email VARCHAR(255),
Address VARCHAR(255));

-- Product details include product ID, name, category, and price
CREATE TABLE Products(
Product_id INT PRIMARY KEY NOT NULL,
Product_name VARCHAR(255) NOT NULL,
Category VARCHAR(255),
Price FLOAT NOT NULL);

-- Sales representatives have details like representative ID, name, and contact information.
CREATE TABLE Sales_representative(
Representative_id INT PRIMARY KEY NOT NULL,
Name VARCHAR (255) NOT NULL,
Contact_information VARCHAR(20));

-- INSERTING VALUES INTO THE DATABASE TABLES 
-- INSERTING VALUES INTO SALES_TRANSACTION
INSERT INTO sales_transaction VALUES
(568086, '2023-06-20', 006, 1005, 501, 20),
(512415, '2023-06-30', 003, 1001, 500, 10),
(956161, '2023-06-05', 006, 1005, 502, 5),
(820260, '2023-07-02', 004, 1003, 500, 15),
(827305, '2023-07-15', 001, 1001, 500, 17),
(743033, '2023-08-12', 003, 1001, 501, 8),
(832058, '2023-09-17', 006, 1005, 501, 45),
(876149, '2023-08-01', 002, 1005, 501, 12),
(874529, '2023-09-27', 001, 1003, 502, 6),
(635237, '2023-06-22', 004, 1003, 500, 23),
(262808, '2023-10-10', 006, 1005, 501, 100);

-- INSERTING VALUES INTO CUSTOMERS TABLE
INSERT INTO customers VALUES
(001, 'Miller Smith', 'millersmith001@gmail.com', '1420 Us 231 South, Troy AL 36081'),
(002, 'Davis Johnson', 'davisjohnson002@yahoo.com', '1501 Skyland Blvd E, Tuscaloosa AL 35405'),
(003, 'Rodriguez Williams', 'rodriguezwilliams@rocketmail.com', '3501 20th Av, Valley AL 36854'),
(004, 'Martinez Brown', 'martinezbrown@gmail.com', '1300 Montgomery Highway, Vestavia Hills AL 35216'),
(005, 'Hernandez Jones', 'hernandezjones@yahoo.com', '4538 Us Hwy 231, Wetumpka AL 36092'),
(006, 'Lopez Garcia', 'lopezgarcia@rocketmail.com', '2575 Us Hwy 43, Winfield AL 35594');

-- INSERTING VALUES INTO PRODUCTS TABLE 
INSERT INTO products VALUES
(1001, 'Global Deluxe High-Back Manager\'s Chair', 'Furniture', 203.04),
(1002, 'Southworth 25% Cotton Granite Paper & Envelopes', 'Office Supplies', 3.54),
(1003, 'AT&T 841000 Phone', 'Technology', 51.75),
(1004, 'Dixon Ticonderoga Core-Lock Colored Pencils', 'Office Supplies', 6.10),
(1005, 'Enermax Aurora Lite Keyboard', 'Technology', 43.76);

-- INSERTING VALUES INTO SALES_REPRESENTATIVE TABLE
INSERT INTO sales_representative VALUES
(500, 'Carol Adams', '+2347030205412'),
(501, 'Cynthia Delaney', '+905551469512'),
(502, 'Jasper Cacioppo', '+62882214559532');

-- Write SQL queries to perform the following actions:
-- a. Adding a new sales transaction to the system.
INSERT INTO sales_transaction VALUES
(123553, '2023-10-10', 007, 1003, 502, 45),
(719698, '2023-10-10', 007, 1004, 502, 56),
(516912, '2023-10-10', 007, 1005, 502, 76);

-- b. Updating the product associated with a sales transaction by adding total_amount and create a view as invoice
CREATE VIEW invoice AS 
SELECT transaction_id, transaction_date, customer_id, products.product_id, representative_id, quantity_sold,
		quantity_sold * price total_amount
FROM products
JOIN sales_transaction
ON products.product_id = sales_transaction.product_id;

-- c. Recording customer details for a sales transaction.
INSERT INTO customers VALUES
(007, 'John Bob Martins', 'johnbobmartins@outlook.com', '1300 Gilmer Ave, Tallassee AL 36078');
-- d. Finding the total number of sales transactions for each product category.
SELECT category, COUNT(*) 'Number of Sales'
FROM products
JOIN sales_transaction st
ON products.product_id = st.product_id
GROUP BY category
ORDER BY 2 DESC;

-- e. Retrieving the names of customers who made purchases in the month of June.
SELECT customer_name, transaction_date
FROM customers
JOIN sales_transaction st 
ON customers.customer_id = st.customer_id
WHERE transaction_date LIKE '%-06-%';

-- f. Calculating the average transaction amount for 'Jasper Cacioppo' sales representative.
SELECT name, AVG(total_amount)
FROM sales_representative sr
JOIN invoice
ON sr.representative_id = invoice.representative_id
GROUP BY name
having name = 'Jasper Cacioppo';

-- h. Retrieve the customer that purchase highest product
SELECT customer_name, SUM(Quantity_sold) 'Highest Purchase Customer'
FROM customers
JOIN sales_transaction st
ON st.customer_id = customers.customer_id
GROUP BY customer_name
ORDER BY 2 DESC
LIMIT 1;

-- i. Who is the sales representative that sold highest quantity
SELECT name Sale_Rep, SUM(Quantity_sold) 'Highest Sold Representative'
FROM sales_representative sr
JOIN sales_transaction st
ON st.representative_id = sr.representative_id
GROUP BY name
ORDER BY 2 DESC
LIMIT 1;

-- j. Which product should be discontinued due to low or no sales
SELECT products.product_id, product_name
FROM products
LEFT JOIN sales_transaction st
ON products.product_id = st.product_id
WHERE quantity_sold IS NULL;

-- K. Get the full details in sales_transaction. i.e names not id and create a view for it 
CREATE VIEW full_info AS
SELECT transaction_id, transaction_date, customer_name, product_name, category Product_category, name sales_rep, quantity_sold, total_amount
FROM invoice 
JOIN customers
USING (customer_id)
JOIN products
USING(product_id)
JOIN sales_representative
USING(representative_id);

