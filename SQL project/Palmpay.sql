USE palmpay_db;
-- 1 RETRIEVE ALL ACCOUNTS WITH THIER RESPECTIVE CUSTOMERS AND BRANCH INFORMATION
SELECT c.customer_id, first_name, last_name, account_type, branch_name
FROM customers c 
INNER JOIN accounts a
ON c.customer_id = a.customer_id
INNER JOIN branches b
ON a.branch_id = b.branch_id;

-- 2. FIND ALL TRANSACTIONS FOR 'Checking' ACCOUNT TYPE INCLUDING ACCOUNT AND CUSTOMER DETAILS
SELECT c.customer_id, first_name, account_type, balance, transaction_type, amount
FROM customers c
INNER JOIN accounts
USING (customer_id)
INNER JOIN transactions
USING (account_id)
WHERE account_type = 'Checking';

-- 3. LIST ALL LOANS WITH CUSTOMER AND BRANCH DETAILS 
SELECT loan_id, c.customer_id, first_name, loan_amount, interest_rate, loan_date, branch_name
FROM loans l
INNER JOIN customers c
USING (customer_id)
INNER JOIN branches
USING (branch_id);

-- 4. GET ALL CREDIT CARDS WITH THEIR ASSOCIATED CUSTOMER DETAILS
SELECT card_id, c.customer_id, first_name,card_number, card_type, expiration_date
FROM customers c
INNER JOIN creditcards
USING (customer_id);

-- 5. FIND ALL ACCOUNTS AND THEIR ASSOCIATED LOANS
SELECT account_id, c.customer_id, account_type, balance, loan_amount
FROM customers c
INNER JOIN accounts
USING (customer_id)
INNER JOIN loans
USING (customer_id);

-- 6. RETRIEVE ALL TRANSACTIONS FOR A SPECIFIC BRANCH, INCLUDING BRANCH AND ACCOUNT DETAILS
SELECT branch_id, branch_name, account_type, balance, creation_date
FROM accounts
INNER JOIN branches
USING (branch_id)
WHERE branch_name = 'North Branch';

-- 7. LIST ALL CUSTOMERS WITH THEIR 'CHECKING' AND 'SAVING' ACCOUNTS
SELECT account_type, c.customer_id, first_name, last_name, balance
FROM customers c
INNER JOIN accounts
USING (customer_id)
WHERE account_type IN ('Checking','Savings');

-- 8. GET ALL CREDIT CARD TRANSACTIONS ALONG WITH CARD AND CUSTOMER DETAILS
SELECT card_id, transaction_id, first_name, transaction_type, amount
FROM customers
INNER JOIN creditcards
USING (customer_id)
INNER JOIN accounts
USING (customer_id)
INNER JOIN transactions
USING (account_id);

-- 9. FIND CUSTOMERS WITH LOANS AND THEIR CREDIT CARD DETAILS
SELECT first_name, loan_amount, card_number
FROM customers
INNER JOIN creditcards
USING (customer_id)
INNER JOIN loans
USING (customer_id);

-- 10. LIST ALL BRANCHES AND THE NUMBER OF ACCOUNT AND LOANS ASSOCIATED WITH EACH BRANCH
SELECT branch_name, COUNT(L.branch_id) 'Number Of Loan'
FROM branches b
LEFT JOIN loans l
USING (branch_id)
GROUP BY branch_name;

SELECT branch_name, COUNT(a.branch_id) 'Number  Of Account'
FROM branches b
LEFT JOIN accounts a
USING (branch_id)
GROUP BY branch_name;

