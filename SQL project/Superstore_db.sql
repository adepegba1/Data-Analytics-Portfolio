create database Superstore_Database;
use superstore_Database;


CREATE TABLE Suppliers (
    SupplierID INT PRIMARY KEY,
    SupplierName VARCHAR(255) NOT NULL,
    ContactName VARCHAR(255),
    Phone VARCHAR(15)
);

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(255) NOT NULL,
    SupplierID INT,
    FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID)
);

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(255) NOT NULL,
    ContactName VARCHAR(255),
    Phone VARCHAR(15)
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(255),
    LastName VARCHAR(255),
    BirthDate DATE,
    HireDate DATE
);

CREATE TABLE Territories (
    TerritoryID INT PRIMARY KEY,
    TerritoryName VARCHAR(255)
);

CREATE TABLE EmployeeTerritories (
    EmployeeID INT,
    TerritoryID INT,
    PRIMARY KEY (EmployeeID, TerritoryID),
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID),
    FOREIGN KEY (TerritoryID) REFERENCES Territories(TerritoryID)
);

CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(255)
);

CREATE TABLE ProductCategories (
    ProductID INT,
    CategoryID INT,
    PRIMARY KEY (ProductID, CategoryID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);



-- Insert values into the Suppliers table
INSERT INTO Suppliers (SupplierID, SupplierName, ContactName, Phone)
VALUES 
    (1, 'Tech Supplies Co.', 'John Smith', '555-1234'),
    (2, 'Globe Importers', 'Emily Johnson', '555-5678'),
    (3, 'Quality Goods Inc.', 'Michael Brown', '555-9012'),
    (4, 'Global Electronics', 'Jennifer Lee', '555-3456'),
    (5, 'United Distributors', 'David Wilson', '555-7890'),
    (6, 'Apex Suppliers', 'Sarah Davis', '555-2345'),
    (7, 'Star Enterprises', 'Matthew Taylor', '555-6789'),
    (8, 'Prime Merchants', 'Jessica Martinez', '555-4321'),
    (9, 'Innovative Products', 'Daniel Anderson', '555-8765'),
    (10, 'Bright Solutions', 'Laura Thompson', '555-2109');

-- Insert values into the Products table
INSERT INTO Products (ProductID, ProductName, SupplierID)
VALUES 
    (1, 'Laptop', 1),
    (2, 'Smartphone', 2),
    (3, 'Headphones', 3),
    (4, 'TV', 4),
    (5, 'Tablet', 5),
    (6, 'Printer', 6),
    (7, 'Camera', 7),
    (8, 'Monitor', 8),
    (9, 'Router', 9),
    (10, 'Keyboard', 10);

-- Insert values into the Customers table
INSERT INTO Customers (CustomerID, CustomerName, ContactName, Phone)
VALUES 
    (1, 'ABC Corporation', 'Mark Johnson', '555-1111'),
    (2, 'XYZ Inc.', 'Emily Smith', '555-2222'),
    (3, 'Acme Company', 'Michael Brown', '555-3333'),
    (4, 'Tech Enterprises', 'Jennifer Lee', '555-4444'),
    (5, 'Global Solutions', 'David Wilson', '555-5555'),
    (6, 'Dynamic Innovations', 'Sarah Davis', '555-6666'),
    (7, 'Visionary Industries', 'Matthew Taylor', '555-7777'),
    (8, 'Eagle Enterprises', 'Jessica Martinez', '555-8888'),
    (9, 'NexGen Technologies', 'Daniel Anderson', '555-9999'),
    (10, 'Infinite Solutions', 'Laura Thompson', '555-0000');

-- Insert values into the Orders table
INSERT INTO Orders (OrderID, CustomerID, OrderDate)
VALUES 
    (1, 1, '2024-04-01'),
    (2, 2, '2024-04-02'),
    (3, 3, '2024-04-03'),
    (4, 4, '2024-04-04'),
    (5, 5, '2024-04-05'),
    (6, 6, '2024-04-06'),
    (7, 7, '2024-04-07'),
    (8, 8, '2024-04-08'),
    (9, 9, '2024-04-09'),
    (10, 10, '2024-04-10');

-- Insert values into the OrderDetails table
INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Quantity)
VALUES 
    (1, 1, 1, 5),
    (2, 2, 2, 10),
    (3, 3, 3, 7),
    (4, 4, 4, 3),
    (5, 5, 5, 6),
    (6, 6, 6, 8),
    (7, 7, 7, 4),
    (8, 8, 8, 2),
    (9, 9, 9, 9),
    (10, 10, 10, 5);

-- Insert values into the Employees table
INSERT INTO Employees (EmployeeID, FirstName, LastName, BirthDate, HireDate)
VALUES 
    (1, 'John', 'Doe', '1985-05-10', '2020-01-01'),
    (2, 'Emily', 'Smith', '1990-09-15', '2020-02-01'),
    (3, 'Michael', 'Brown', '1988-07-20', '2020-03-01'),
    (4, 'Jennifer', 'Lee', '1983-02-28', '2020-04-01'),
    (5, 'David', 'Wilson', '1987-11-05', '2020-05-01'),
    (6, 'Sarah', 'Davis', '1992-03-22', '2020-06-01'),
    (7, 'Matthew', 'Taylor', '1989-08-18', '2020-07-01'),
    (8, 'Jessica', 'Martinez', '1986-04-14', '2020-08-01'),
    (9, 'Daniel', 'Anderson', '1991-01-30', '2020-09-01'),
    (10, 'Laura', 'Thompson', '1994-06-17', '2020-10-01');

-- Insert values into the Territories table
INSERT INTO Territories (TerritoryID, TerritoryName)
VALUES 
    (1, 'East Region'),
    (2, 'West Region'),
    (3, 'North Region'),
    (4, 'South Region'),
    (5, 'Central Region'),
    (6, 'Coastal Region'),
    (7, 'Mountain Region'),
    (8, 'Island Region'),
    (9, 'Border Region'),
    (10, 'Valley Region');

-- Insert values into the EmployeeTerritories table
INSERT INTO EmployeeTerritories (EmployeeID, TerritoryID)
VALUES 
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5),
    (6, 6),
    (7, 7),
    (8, 8),
    (9, 9),
    (10, 10);

-- Insert values into the Categories table
INSERT INTO Categories (CategoryID, CategoryName)
VALUES 
    (1, 'Electronics'),
    (2, 'Office Supplies'),
    (3, 'Furniture'),
    (4, 'Appliances'),
    (5, 'Clothing'),
    (6, 'Toys'),
    (7, 'Books'),
    (8, 'Sports Equipment'),
    (9, 'Health & Beauty'),
    (10, 'Home Decor');

-- Insert values into the ProductCategories table
INSERT INTO ProductCategories (ProductID, CategoryID)
VALUES 
    (1, 1),
    (2, 1),
    (3, 1),
    (4, 1),
    (5, 1),
    (6, 2),
    (7, 2),
    (8, 2),
    (9, 3),
    (10, 3);

