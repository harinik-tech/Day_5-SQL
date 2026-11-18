-- 1. INSERT sample records
INSERT INTO Branches (branch_name, branch_city) VALUES 
('MG Road Branch', 'Bengaluru'),
('Connaught Place', 'New Delhi');

INSERT INTO Relationship_Managers (rm_name, branch_id) VALUES 
('Rohan Sharma', 1),
('Priya Nair', 2);

INSERT INTO Customers (customer_name, address) VALUES 
('Aarav Patel', '12 Indiranagar, Bengaluru'),
('Sneha Verma', '45 Vasant Kunj, New Delhi'),
('Vikram Rao', '88 Koramangala, Bengaluru');

INSERT INTO Accounts (account_number, customer_id, branch_id, rm_id, account_type, balance, opened_date) VALUES 
('ACC1001', 1, 1, 1, 'Savings', 125000.50, '2026-09-15'),
('ACC1002', 2, 2, 2, 'Current', 450000.00, '2026-10-10'),
('ACC1003', 3, 1, 1, 'Fixed Deposit', 80000.00, '2026-06-01'),
('ACC2004', 1, 1, 1, 'Savings', 15000.00, '2026-11-01');

-- 2. UPDATE a record (e.g., deposit money into ACC1001)
UPDATE Accounts 
SET balance = balance + 25000.00 
WHERE account_number = 'ACC1001';

-- 3. DELETE a specific record
DELETE FROM Accounts 
WHERE account_number = 'ACC2004';

-- 4. SELECT query using AND, OR, IN, BETWEEN, and LIKE
-- Find Savings or Current accounts starting with 'ACC1', opened in the last quarter (Aug–Nov 2026), with balance > 1,00,000
SELECT 
    a.account_number,
    c.customer_name,
    a.account_type,
    a.balance,
    a.opened_date
FROM Accounts a
JOIN Customers c ON a.customer_id = c.customer_id
WHERE 
    a.account_type IN ('Savings', 'Current')
    AND a.opened_date BETWEEN '2026-08-18' AND '2026-11-18'
    AND (a.balance > 100000.00 OR c.address LIKE '%Bengaluru%')
    AND a.account_number LIKE 'ACC1%';