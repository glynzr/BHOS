-- MySQL CTE (Common Table Expression) -----------------------------------------------------------------------------

-- We use the classicmodels database as a MySQL sample database to help you work with MySQL quickly and effectively.
    -- customers: stores customer’s data.
    -- products: stores a list of scale model cars.
    -- productlines: stores a list of product lines.
    -- orders: stores sales orders placed by customers.
    -- orderdetails: stores sales order line items for every sales order.
    -- payments: stores payments made by customers based on their accounts.
    -- employees: stores employee information and the organization structure such as who reports to whom.
    -- offices: stores sales office data.

-- EXAMPLE 1 : 
WITH customers_in_usa AS (
    SELECT 
        customerName, state
    FROM
        customers
    WHERE
        country = 'USA'
) SELECT 
    customerName
 FROM
    customers_in_usa
 WHERE
    state = 'CA'
 ORDER BY customerName;

    -- First, define a CTE with the name customers_in_usa that stores the customer name and state of customers in the USA. 
    -- The defining query retrieves data from the customers table.
    -- Second, select the customers located in California from the CTE.


-- EXAMPLE 2 ----------------------------------------------------------------------------------------------------
-- The following example uses a CTE to retrieve the top 5 sales representatives based on their total sales in the 
-- year 2003. We’ll use the orders, orderdetails, and employees from the sample database

WITH topsales2003 AS (
    SELECT 
        salesRepEmployeeNumber employeeNumber,
        SUM(quantityOrdered * priceEach) sales
    FROM
        orders
            INNER JOIN
        orderdetails USING (orderNumber)
            INNER JOIN
        customers USING (customerNumber)
    WHERE
        YEAR(shippedDate) = 2003
        AND status = 'Shipped'
    GROUP BY salesRepEmployeeNumber
    ORDER BY sales DESC
    LIMIT 5
)
SELECT 
    employeeNumber, 
    firstName, 
    lastName, 
    sales
FROM
    employees
        JOIN
    topsales2003 USING (employeeNumber);


-- EXAMPLE 3 ----------------------------------------------------------------------------------------------------
-- Using multiple CTEs ------------------------------------------------------------------------------------------
-- We’ll use the customers and employees from the sample database:
-- The following example uses multiple CTEs to map the customers with their respective sales representatives

WITH salesrep AS (
    SELECT 
        employeeNumber,
        CONCAT(firstName, ' ', lastName) AS salesrepName
    FROM
        employees
    WHERE
        jobTitle = 'Sales Rep'
),
customer_salesrep AS (
    SELECT 
        customerName, salesrepName
    FROM
        customers
            INNER JOIN
        salesrep ON employeeNumber = salesrepEmployeeNumber
)
SELECT 
    *
FROM
    customer_salesrep
ORDER BY customerName;


-- EXAMPLE 4 ----------------------------------------------------------------------------------------------------
-- Joining two CTEs example -------------------------------------------------------------------------------------
-- We’ll use the offices and employees tables from the sample database
-- The following example is creating two CTEs and joining them to get the Sales Representatives located in the USA, 
-- including their office information

WITH e AS (
  SELECT 
    * 
  FROM 
    employees 
  WHERE 
    jobTitle = 'Sales Rep'
), 
o AS (
  SELECT 
    * 
  FROM 
    offices 
  WHERE 
    country = 'USA'
) 
SELECT 
  firstName, 
  lastName, 
  city, 
  state, 
  postalCode 
FROM 
  e 
  INNER JOIN o USING (officeCode);


-- EXAMPLE 5 ----------------------------------------------------------------------------------------------------
-- get sum of orders by each customer
-- number of orders by each customer
-- also define list of products with productName

-- SEPARATE SUBQUERY IS OK, WORKING!!! -----------------------
SELECT orderNumber, 
    GROUP_CONCAT(productName) AS allProducts, 
    sum(priceEach * quantityOrdered) AS sumofOrders, 
    count(orderNumber) AS countOrders
FROM orderdetails
INNER JOIN products USING(`productCode`)
GROUP BY `orderNumber`;

-- SOLUTION WITH CTE 
WITH orderSum AS (
        SELECT orderNumber, productCode,
        GROUP_CONCAT(productName) AS allProducts, 
        SUM(priceEach * quantityOrdered) AS sumofOrders, 
        COUNT(orderNumber) AS countOrders
    FROM orderdetails
    INNER JOIN products USING(`productCode`)
    GROUP BY `orderNumber`
)
SELECT orderNumber,
    allProducts,
    sumofOrders
FROM orderSum
INNER JOIN orders USING(`orderNumber`);

-- TASKS ----------------------------------------------------------------------------------------
-- get sum of orders by each product code(name)
-- By each productLine to find count of products
-- By each productCode to find min price of product, max price of product! (use window functions)
-- By each productCode to display RANK and DENSE_RANK (use window functions)
-- By each productLine to display RANK of buyPrice, MIN and MAX of buyPrices as well.



-------------------------------------------------------------------------------------------------
-- MySQL TEMPORARY TABLES -----------------------------------------------------------------------

-- EXAMPLE 1 ------------------------------------------------------------------------------------
-- First, create a new temporary table called credits that stores customers’ credits:
CREATE TEMPORARY TABLE credits(
  customerNumber INT PRIMARY KEY, 
  creditLimit DEC(10, 2)
);

-- Then, insert rows from the customers table into the temporary table credits:
INSERT INTO credits(customerNumber, creditLimit)
SELECT 
  customerNumber, 
  creditLimit 
FROM 
  customers 
WHERE 
  creditLimit > 0;


-- EXAMPLE 2 ------------------------------------------------------------------------------------
-- CASE 2 : Creating a temporary table whose structure is based on a query example:
-- The following example creates a temporary table that stores the top 10 customers by revenue. 
-- The structure of the temporary table is derived from a SELECT statement:

CREATE TEMPORARY TABLE top_customers
SELECT p.customerNumber, 
       c.customerName, 
       ROUND(SUM(p.amount),2) sales
FROM payments p
INNER JOIN customers c ON c.customerNumber = p.customerNumber
GROUP BY p.customerNumber
ORDER BY sales DESC
LIMIT 10;

-- Now, you can query data from the top_customers temporary table like querying from a permanent table:
SELECT 
    customerNumber, 
    customerName, 
    sales
FROM
    top_customers
ORDER BY sales;

-- Checking if a temporary table exists
-- However, you can create a stored procedure that checks if a temporary table exists or not as follows:
DELIMITER //
CREATE PROCEDURE check_table_exists(table_name VARCHAR(100)) 
BEGIN
    DECLARE CONTINUE HANDLER FOR SQLSTATE '42S02' SET @err = 1;
    SET @err = 0;
    SET @table_name = table_name;
    SET @sql_query = CONCAT('SELECT 1 FROM ',@table_name);
    PREPARE stmt1 FROM @sql_query;
    IF (@err = 1) THEN
        SET @table_exists = 0;
    ELSE
        SET @table_exists = 1;
        DEALLOCATE PREPARE stmt1;
    END IF;
END //
DELIMITER ;

-- In this procedure, we try to select data from a temporary table. If the temporary table exists, the @table_exists variable is set to 1, otherwise, it is set to 0.
-- This statement calls the check_table_exists stored procedure to check if the temporary table credits exists:
CALL check_table_exists('credits');
SELECT @table_exists;

-- TEMPORARY TABLE EXERCISES ---------------------------------------------------------------------------
-- EXERCISE 1:

create TEMPORARY table temp_table_2 as 
with cte1 as (
    select customerNumber, customerName, salesRepEmployeeNumber
    from customers
),
cte2 as (
    SELECT employeeNumber,
    concat(firstName, ' ', lastName) as EmployeeName
    from employees
) 
select customerNumber, customerName, EmployeeName
from cte1 join cte2
on cte1.salesRepEmployeeNumber = cte2.employeeNumber;

select * from temp_table_2;