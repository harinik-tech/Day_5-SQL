CREATE DATABASE IF NOT EXISTS bank_branch_db;
USE bank_branch_db;

-- 1. Branches Table
CREATE TABLE Branches (
    branch_id INT AUTO_INCREMENT PRIMARY KEY,
    branch_name VARCHAR(100) NOT NULL,
    branch_city VARCHAR(100) NOT NULL
);

-- 2. Relationship Managers Table
CREATE TABLE Relationship_Managers (
    rm_id INT AUTO_INCREMENT PRIMARY KEY,
    rm_name VARCHAR(100) NOT NULL,
    branch_id INT NOT NULL,
    CONSTRAINT fk_rm_branch FOREIGN KEY (branch_id) REFERENCES Branches(branch_id)
);

-- 3. Customers Table
CREATE TABLE Customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    address VARCHAR(255) NOT NULL
);

-- 4. Accounts Table
CREATE TABLE Accounts (
    account_id INT AUTO_INCREMENT PRIMARY KEY,
    account_number VARCHAR(20) NOT NULL UNIQUE,
    customer_id INT NOT NULL,
    branch_id INT NOT NULL,
    rm_id INT NOT NULL,
    account_type VARCHAR(20) NOT NULL,
    balance DECIMAL(15, 2) NOT NULL DEFAULT 0.00,
    opened_date DATE NOT NULL,
    CONSTRAINT chk_balance CHECK (balance >= 0),
    CONSTRAINT chk_account_type CHECK (account_type IN ('Savings', 'Current', 'Fixed Deposit')),
    CONSTRAINT fk_acc_customer FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    CONSTRAINT fk_acc_branch FOREIGN KEY (branch_id) REFERENCES Branches(branch_id),
    CONSTRAINT fk_acc_rm FOREIGN KEY (rm_id) REFERENCES Relationship_Managers(rm_id)
);