-- 1. Add 'kyc_status' column to Customers
ALTER TABLE Customers 
ADD COLUMN kyc_status ENUM('Verified', 'Pending', 'Rejected') NOT NULL DEFAULT 'Pending';

-- 2. Rename a table
ALTER TABLE Relationship_Managers 
RENAME TO Branch_Managers;

-- 3. Drop a CHECK constraint from Accounts
ALTER TABLE Accounts 
DROP CHECK chk_balance;