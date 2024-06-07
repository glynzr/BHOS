# TASK-6 ----------------------------------------------------------------------------
# -----------------------------------------------------------------------------------

# ----------------------------------------------------------------------------------- 
CREATE TABLE stores(
store_id BIGINT PRIMARY KEY AUTO_INCREMENT,
store_name VARCHAR(50)
);
INSERT INTO stores (store_name) VALUES ('Philadelphia');
INSERT INTO stores (store_name) VALUES ('Galloway');


# ----------------------------------------------------------------------------------- 
CREATE TABLE products(
product_id BIGINT PRIMARY KEY AUTO_INCREMENT,
product_name VARCHAR(40),
cost_price DOUBLE,
retail_price DOUBLE,
availability VARCHAR(5)
);
INSERT INTO products (product_name, cost_price, retail_price, availability) 
VALUES 
('WIRELESS MOUSE', '18.23', '30.25','ALL'),
('8 MP CAMERA', '60.40', '85.40','ALL'),
('SMART WATCH', '189.60', '225.30','LOCAL');


# CRATING TABLES FOR TRIGGERS -------------------------------------------------------

/* CREATE TABLE products_to_stores(
ref_id BIGINT PRIMARY KEY AUTO_INCREMENT,
product_id BIGINT,
store_id BIGINT
); */

/* CREATE TABLE archived_products(
product_id BIGINT PRIMARY KEY ,
product_name VARCHAR(40),
cost_price DOUBLE,
retail_price DOUBLE,
availability VARCHAR(5)
); */

/* CREATE TABLE products_price_history(
product_id BIGINT PRIMARY KEY AUTO_INCREMENT,
price_date DATETIME,
retail_price DOUBLE
); */


# TAKS-1:
/* BEFORE INSERT trigger: The trigger will make sure that the retail price 
of a product is greater than the cost price whenever items are inserted 
into the products table. Otherwise, the database user will get an error. */

# TAKS-2:
/* BEFORE UPDATE trigger: This trigger will prevent database users from editing 
a product name once a product has been inserted into the database. */

# TAKS-3:
/* BEFORE DELETE trigger: Prevent users from deleting specific records from a table
where availability='ALL' */

# TAKS-4:
/* AFTER UPDATE trigger: To keep track of price changes in our store over time. */