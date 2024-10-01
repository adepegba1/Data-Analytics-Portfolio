create database Palmpay_DB;
use Palmpay_DB;
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    date_of_birth DATE,
    address VARCHAR(100),
    phone_number VARCHAR(20),
    email VARCHAR(50)
);

CREATE TABLE Branches (
    branch_id INT PRIMARY KEY,
    branch_name VARCHAR(50),
    branch_address VARCHAR(100),
    branch_phone VARCHAR(20)
);

CREATE TABLE Employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    position VARCHAR(50),
    branch_id INT,
    FOREIGN KEY (branch_id) REFERENCES Branches(branch_id)
);

CREATE TABLE Accounts (
    account_id INT PRIMARY KEY,
    customer_id INT,
    branch_id INT,
    account_type VARCHAR(20),
    balance DECIMAL(15, 2),
    creation_date DATE,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (branch_id) REFERENCES Branches(branch_id)
);

CREATE TABLE Transactions (
    transaction_id INT PRIMARY KEY,
    account_id INT,
    transaction_date DATE,
    transaction_type VARCHAR(20),
    amount DECIMAL(15, 2),
    FOREIGN KEY (account_id) REFERENCES Accounts(account_id)
);

CREATE TABLE Loans (
    loan_id INT PRIMARY KEY,
    customer_id INT,
    branch_id INT,
    loan_amount DECIMAL(15, 2),
    interest_rate DECIMAL(5, 2),
    loan_date DATE,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (branch_id) REFERENCES Branches(branch_id)
);

CREATE TABLE CreditCards (
    card_id INT PRIMARY KEY,
    customer_id INT,
    card_number VARCHAR(16),
    card_type VARCHAR(20),
    expiration_date DATE,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);



-- Insert data into Customers
INSERT INTO Customers (customer_id, first_name, last_name, date_of_birth, address, phone_number, email) VALUES
(1, 'John', 'Doe', '1985-01-15', '123 Elm St', '555-1234', 'john.doe@gmail.com'),
(2, 'Jane', 'Smith', '1990-02-20', '456 Oak St', '555-5678', 'jane.smith@gmail.com'),
(3, 'Emily', 'Johnson', '1982-03-25', '789 Pine St', '555-8765', 'emily.johnson@gmail.com'),
(4, 'Michael', 'Brown', '1975-04-30', '101 Maple St', '555-2345', 'michael.brown@gmail.com'),
(5, 'Sarah', 'Davis', '1988-05-18', '202 Birch St', '555-3456', 'sarah.davis@gmail.com'),
(6, 'David', 'Wilson', '1983-06-22', '303 Cedar St', '555-4567', 'david.wilson@gmail.com'),
(7, 'Laura', 'Taylor', '1992-07-09', '404 Walnut St', '555-5679', 'laura.taylor@gmail.com'),
(8, 'James', 'Anderson', '1980-08-14', '505 Chestnut St', '555-6789', 'james.anderson@gmail.com'),
(9, 'Jessica', 'Thomas', '1986-09-23', '606 Spruce St', '555-7890', 'jessica.thomas@gmail.com'),
(10, 'Robert', 'Martinez', '1995-10-01', '707 Fir St', '555-8901', 'robert.martinez@gmail.com'),
(11, 'Karen', 'Garcia', '1978-11-17', '808 Aspen St', '555-9012', 'karen.garcia@gmail.com'),
(12, 'Brian', 'Rodriguez', '1987-12-05', '909 Pine St', '555-0123', 'brian.rodriguez@gmail.com'),
(13, 'Megan', 'Lee', '1991-01-28', '1010 Maple St', '555-1235', 'megan.lee@gmail.com'),
(14, 'William', 'White', '1984-02-19', '1111 Oak St', '555-2346', 'william.white@gmail.com'),
(15, 'Amy', 'Harris', '1989-03-09', '1212 Elm St', '555-3457', 'amy.harris@gmail.com'),
(16, 'Christopher', 'Clark', '1986-04-22', '1313 Cedar St', '555-4568', 'christopher.clark@gmail.com'),
(17, 'Nancy', 'Lewis', '1993-05-12', '1414 Birch St', '555-5670', 'nancy.lewis@gmail.com'),
(18, 'Daniel', 'Walker', '1979-06-30', '1515 Chestnut St', '555-6780', 'daniel.walker@gmail.com'),
(19, 'Olivia', 'Hall', '1994-07-16', '1616 Spruce St', '555-7891', 'olivia.hall@gmail.com'),
(20, 'Ethan', 'Allen', '1981-08-25', '1717 Fir St', '555-8902', 'ethan.allen@gmail.com');


-- Insert data into Branches
INSERT INTO Branches (branch_id, branch_name, branch_address, branch_phone) VALUES
(1, 'Main Branch', '100 Main St', '555-1000'),
(2, 'North Branch', '200 North St', '555-2000'),
(3, 'South Branch', '300 South St', '555-3000'),
(4, 'East Branch', '400 East St', '555-4000'),
(5, 'West Branch', '500 West St', '555-5000'),
(6, 'Central Branch', '600 Central St', '555-6000'),
(7, 'Suburban Branch', '700 Suburban St', '555-7000'),
(8, 'Downtown Branch', '800 Downtown St', '555-8000'),
(9, 'Airport Branch', '900 Airport St', '555-9000'),
(10, 'Mall Branch', '1000 Mall St', '555-0101'),
(11, 'Park Branch', '1100 Park St', '555-0202'),
(12, 'Harbor Branch', '1200 Harbor St', '555-0303'),
(13, 'University Branch', '1300 University St', '555-0404'),
(14, 'City Center Branch', '1400 City Center St', '555-0505'),
(15, 'River Branch', '1500 River St', '555-0606'),
(16, 'Mountain Branch', '1600 Mountain St', '555-0707'),
(17, 'Valley Branch', '1700 Valley St', '555-0808'),
(18, 'Historic Branch', '1800 Historic St', '555-0909'),
(19, 'Residential Branch', '1900 Residential St', '555-1010'),
(20, 'Corporate Branch', '2000 Corporate St', '555-1111');

-- Insert data into Employees
INSERT INTO Employees (employee_id, first_name, last_name, position, branch_id) VALUES
(1, 'Alice', 'Williams', 'Manager', 1),
(2, 'Bob', 'Brown', 'Teller', 1),
(3, 'Charlie', 'Davis', 'Loan Officer', 2),
(4, 'Diana', 'Wilson', 'Branch Manager', 3),
(5, 'Evan', 'Martinez', 'Teller', 4),
(6, 'Fiona', 'Anderson', 'Customer Service', 5),
(7, 'George', 'Thomas', 'Financial Advisor', 6),
(8, 'Hannah', 'Lee', 'Operations', 7),
(9, 'Ian', 'Garcia', 'Loan Officer', 8),
(10, 'Jasmine', 'Clark', 'Manager', 9),
(11, 'Kevin', 'Walker', 'Teller', 10),
(12, 'Lily', 'Harris', 'Customer Service', 11),
(13, 'Mike', 'Allen', 'Branch Manager', 12),
(14, 'Nina', 'Hall', 'Financial Advisor', 13),
(15, 'Owen', 'Lewis', 'Loan Officer', 14),
(16, 'Paula', 'White', 'Operations', 15),
(17, 'Quinn', 'Rodriguez', 'Teller', 16),
(18, 'Ryan', 'Johnson', 'Manager', 17),
(19, 'Sophia', 'Brown', 'Customer Service', 18),
(20, 'Thomas', 'Smith', 'Branch Manager', 19);

-- Insert data into Accounts
INSERT INTO Accounts (account_id, customer_id, branch_id, account_type, balance, creation_date) VALUES
(1, 1, 1, 'Checking', 5000.00, '2023-01-01'),
(2, 2, 1, 'Savings', 15000.00, '2023-02-01'),
(3, 3, 2, 'Checking', 2000.00, '2023-03-01'),
(4, 4, 2, 'Savings', 3000.00, '2023-04-01'),
(5, 5, 3, 'Checking', 4000.00, '2023-05-01'),
(6, 6, 3, 'Savings', 2500.00, '2023-06-01'),
(7, 7, 4, 'Checking', 6000.00, '2023-07-01'),
(8, 8, 4, 'Savings', 3500.00, '2023-08-01'),
(9, 9, 5, 'Checking', 7000.00, '2023-09-01'),
(10, 10, 5, 'Savings', 4500.00, '2023-10-01'),
(11, 11, 6, 'Checking', 8000.00, '2023-11-01'),
(12, 12, 6, 'Savings', 5500.00, '2023-12-01'),
(13, 13, 7, 'Checking', 9000.00, '2024-01-01'),
(14, 14, 7, 'Savings', 6500.00, '2024-02-01'),
(15, 15, 8, 'Checking', 10000.00, '2024-03-01'),
(16, 16, 8, 'Savings', 7000.00, '2024-04-01'),
(17, 17, 9, 'Checking', 11000.00, '2024-05-01'),
(18, 18, 9, 'Savings', 7500.00, '2024-06-01'),
(19, 19, 10, 'Checking', 12000.00, '2024-07-01'),
(20, 20, 10, 'Savings', 8000.00, '2024-08-01');

-- Insert data into Transactions
INSERT INTO Transactions (transaction_id, account_id, transaction_date, transaction_type, amount) VALUES
(1, 1, '2023-05-01', 'Deposit', 1000.00),
(2, 1, '2023-06-01', 'Withdrawal', 500.00),
(3, 2, '2023-07-01', 'Deposit', 2000.00),
(4, 3, '2023-08-01', 'Withdrawal', 300.00),
(5, 4, '2023-09-01', 'Deposit', 1500.00),
(6, 5, '2023-10-01', 'Withdrawal', 400.00),
(7, 6, '2023-11-01', 'Deposit', 2500.00),
(8, 7, '2023-12-01', 'Withdrawal', 600.00),
(9, 8, '2024-01-01', 'Deposit', 3000.00),
(10, 9, '2024-02-01', 'Withdrawal', 700.00),
(11, 10, '2024-03-01', 'Deposit', 3500.00),
(12, 11, '2024-04-01', 'Withdrawal', 800.00),
(13, 12, '2024-05-01', 'Deposit', 4000.00),
(14, 13, '2024-06-01', 'Withdrawal', 900.00),
(15, 14, '2024-07-01', 'Deposit', 4500.00),
(16, 15, '2024-08-01', 'Withdrawal', 1000.00),
(17, 16, '2024-09-01', 'Deposit', 5000.00),
(18, 17, '2024-10-01', 'Withdrawal', 1100.00),
(19, 18, '2024-11-01', 'Deposit', 5500.00),
(20, 19, '2024-12-01', 'Withdrawal', 1200.00);

-- Insert data into Loans
INSERT INTO Loans (loan_id, customer_id, branch_id, loan_amount, interest_rate, loan_date) VALUES
(1, 1, 1, 10000.00, 5.00, '2023-01-01'),
(2, 2, 1, 15000.00, 4.50, '2023-02-01'),
(3, 3, 2, 20000.00, 6.00, '2023-03-01'),
(4, 4, 2, 25000.00, 5.50, '2023-04-01'),
(5, 5, 3, 30000.00, 4.75, '2023-05-01'),
(6, 6, 3, 35000.00, 5.25, '2023-06-01'),
(7, 7, 4, 40000.00, 4.90, '2023-07-01'),
(8, 8, 4, 45000.00, 5.10, '2023-08-01'),
(9, 9, 5, 50000.00, 5.00, '2023-09-01'),
(10, 10, 5, 55000.00, 4.80, '2023-10-01'),
(11, 11, 6, 60000.00, 5.20, '2023-11-01'),
(12, 12, 6, 65000.00, 4.90, '2023-12-01'),
(13, 13, 7, 70000.00, 5.30, '2024-01-01'),
(14, 14, 7, 75000.00, 5.00, '2024-02-01'),
(15, 15, 8, 80000.00, 4.75, '2024-03-01'),
(16, 16, 8, 85000.00, 5.10, '2024-04-01'),
(17, 17, 9, 90000.00, 5.40, '2024-05-01'),
(18, 18, 9, 95000.00, 5.25, '2024-06-01'),
(19, 19, 10, 100000.00, 5.10, '2024-07-01'),
(20, 20, 10, 105000.00, 5.00, '2024-08-01');

-- Insert data into CreditCards
INSERT INTO CreditCards (card_id, customer_id, card_number, card_type, expiration_date) VALUES
(1, 1, '4111111111111111', 'Visa', '2025-01-01'),
(2, 2, '5111111111111111', 'MasterCard', '2025-02-01'),
(3, 3, '6111111111111111', 'Amex', '2025-03-01'),
(4, 4, '7111111111111111', 'Discover', '2025-04-01'),
(5, 5, '8111111111111111', 'Visa', '2025-05-01'),
(6, 6, '9111111111111111', 'MasterCard', '2025-06-01'),
(7, 7, '1211111111111111', 'Amex', '2025-07-01'),
(8, 8, '2211111111111111', 'Discover', '2025-08-01'),
(9, 9, '3311111111111111', 'Visa', '2025-09-01'),
(10, 10, '4411111111111111', 'MasterCard', '2025-10-01'),
(11, 11, '5511111111111111', 'Amex', '2025-11-01'),
(12, 12, '6611111111111111', 'Discover', '2025-12-01'),
(13, 13, '7711111111111111', 'Visa', '2026-01-01'),
(14, 14, '8811111111111111', 'MasterCard', '2026-02-01'),
(15, 15, '9911111111111111', 'Amex', '2026-03-01'),
(16, 16, '1011111111111111', 'Discover', '2026-04-01'),
(17, 17, '1111111111111111', 'Visa', '2026-05-01'),
(18, 18, '1211111111111112', 'MasterCard', '2026-06-01'),
(19, 19, '1311111111111113', 'Amex', '2026-07-01'),
(20, 20, '1411111111111114', 'Discover', '2026-08-01');


