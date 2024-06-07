-- FOREIGN KEY CONSTRAINTS --------------------------------------------------------
-- DATABASE SPORT(tables: clubs, members) -----------------------------------------
CREATE TABLE clubs(
clubID INT(2) auto_increment primary key,
clubName VARCHAR(60),
region VARCHAR(60)
);

CREATE TABLE members(
memberID INT(3) auto_increment primary key,
name VARCHAR(40),
surname VARCHAR(40),
clubID INT(2)
);

INSERT INTO clubs(clubName, region)
VALUES
('Dinamo', 'Baku'),
('Shahdag', 'Qusar'),
('Araz', 'Nakhchivan'),
('Zengazur', 'Zengazur'),
('Kapaz', 'Ganja'),
('Shirvan', 'Salyan');


INSERT INTO members(name, surname, clubID)
VALUES
('Turan', 'Quliyev', 1),
('Aydin', 'Huseyn', 1),
('Ceyran', 'Mammadli', 3),
('Madina', 'Aliyeva', 2),
('Turan', 'Mammadli', 3),
('Boran', 'Tufan', 4);

-- SET DEFAULT RESTRICTION -----------------------------------------------------------
ALTER TABLE members
ADD CONSTRAINT MK_1 FOREIGN KEY (clubID)
REFERENCES clubs(clubID);

-- prove default restriction!
DELETE FROM clubs
WHERE clubID = 1;

ALTER TABLE members
DROP FOREIGN KEY MK_1;

-- SET NULL RESTRICTION -------------------------------------------------------------
ALTER TABLE members
ADD CONSTRAINT MK_55 FOREIGN KEY (clubID)
REFERENCES clubs(clubID)
ON UPDATE CASCADE ON DELETE SET NULL;

-- delete from parent table (clubID = 2)
DELETE FROM clubs
WHERE clubID = 2;

-- ON UPDATE CASCADE ON DELETE CASCADE ---------------------------------------------- 
ALTER TABLE members
ADD CONSTRAINT MK_66 FOREIGN KEY (clubID)
REFERENCES clubs(clubID)
ON UPDATE CASCADE ON DELETE CASCADE;

-- prove the result
DELETE FROM clubs
WHERE clubID = 1;
--------------------------------------------------------------------------------------
-- DATABASE BANK(tables: customer, account, depositor) -------------------------------
create database bank;
use bank;

create table customer(
    customer_id INT auto_increment primary key, 
    customer_name VARCHAR(80),
    street VARCHAR(80),
    city VARCHAR(80)
);

create table account(
    account_number VARCHAR(30) primary key, 
    balance INT
);

create table depositor(
    customer_id INT, 
    account_number VARCHAR(30)
);

INSERT INTO customer(customer_name, street, city)
VALUES
('Johnson', '12 Alma Street', 'Palo Alto'),
('Smith', '4 North Street', 'Rye'),
('Hayes', '3 Main Street', 'Harrison'),
('Turner', '123 Putnam Avenue', 'Stamford'),
('Jones', '100 Main Street', 'Harrison'),
('Lindsay', '175 Park Avenue', 'Pittsfield'),
('Smith', '72 North Street', 'Rye');

INSERT INTO account(account_number, balance)
VALUES
('A-101', 500),
('A-215', 700),
('A-102', 400),
('A-305', 350),
('A-201', 900),
('A-217', 750),
('A-222', 700);

INSERT INTO depositor(customer_id, account_number)
VALUES
(1, 'A-101'),
(1, 'A-102'),
(7, 'A-215'),
(3, 'A-102'),
(4, 'A-305'),
(5, 'A-217'),
(6, 'A-222');

-- FOREIGN KEY RESTRICTIONS ---------------------------------------------------
-- 1: ON UPDATE RESTRICT ON DELETE RESTRICT
ALTER TABLE depositor
ADD CONSTRAINT depo_account_01 FOREIGN KEY (account_number)
REFERENCES account(account_number)
ON UPDATE RESTRICT ON DELETE RESTRICT;

ALTER TABLE depositor
ADD CONSTRAINT depo_customer_01 FOREIGN KEY (customer_id)
REFERENCES customer(customer_id)
ON UPDATE RESTRICT ON DELETE RESTRICT;

-- to test: delete something from parent tables: `customer` and `account`

-- 2: ON UPDATE CASCADE ON DELETE SET NULL
ALTER TABLE depositor DROP CONSTRAINT depo_account_01;
ALTER TABLE depositor DROP CONSTRAINT depo_customer_01;

ALTER TABLE depositor
ADD CONSTRAINT depo_account_01 FOREIGN KEY (account_number)
REFERENCES account(account_number)
ON UPDATE CASCADE ON DELETE SET NULL;

ALTER TABLE depositor
ADD CONSTRAINT depo_customer_01 FOREIGN KEY (customer_id)
REFERENCES customer(customer_id)
ON UPDATE CASCADE ON DELETE SET NULL;

-- CLASSROOM ASSIGNMENT: QUERIES --------------------------------------------------------------
-- 1: Display: group by: `city`, get all customer names in one line comma seperated
SELECT GROUP_CONCAT(customer_name), customer_city FROM customers 
GROUP BY customer_city;

-- 2: Display: customer_name, street, city, `all accounts comma seperated`, group by `customer`
SELECT customers.customer_name, customers.customer_street, customers.customer_city,
GROUP_CONCAT(depositors.account_number) AS account_number
FROM customers INNER JOIN depositors
ON customers.customer_id = depositors.customer_id 
GROUP BY depositors.customer_id;

-- 3: Display: customer_name, street, city, count(account), sum(balance), group by `customer`
SELECT customers.customer_name, customers.customer_street, customers.customer_city,
COUNT(depositors.account_number) AS count_accounts, SUM(accounts.balance) AS sum_accounts
FROM customers 
INNER JOIN depositors INNER JOIN accounts
ON customers.customer_id = depositors.customer_id 
AND depositors.account_number = accounts.account_number
GROUP BY depositors.customer_id;