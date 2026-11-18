-- Setup a test table
CREATE TABLE Test_Accounts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    holder_name VARCHAR(50)
);

INSERT INTO Test_Accounts (holder_name) VALUES ('Alice'), ('Bob');

-- 1. DELETE (DML - Data Manipulation Language)
START TRANSACTION;
DELETE FROM Test_Accounts;
-- Effect: Removes rows one by one. AUTO_INCREMENT counter is NOT reset (next insert will be id = 3).
ROLLBACK; 
-- Result: 'Alice' and 'Bob' are restored because DELETE is transactional.

-- 2. TRUNCATE (DDL - Data Definition Language)
START TRANSACTION;
TRUNCATE TABLE Test_Accounts;
-- Effect: Deallocates data pages and resets AUTO_INCREMENT counter back to 1.
ROLLBACK; 
-- Result: Implicit commit occurs in MySQL; data CANNOT be rolled back.

-- 3. DROP (DDL - Data Definition Language)
DROP TABLE Test_Accounts;
-- Effect: Deletes both the data and the table structure/metadata completely. Cannot be rolled back.