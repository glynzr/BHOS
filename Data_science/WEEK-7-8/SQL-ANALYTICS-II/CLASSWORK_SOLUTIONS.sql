-- CLASS EXERCISES ----------------------------------------------------------------------------------------

-- We use the classicmodels database as a MySQL sample database to help you work with MySQL quickly and effectively.
    -- customers: stores customer’s data.
    -- products: stores a list of scale model cars.
    -- productlines: stores a list of product lines.
    -- orders: stores sales orders placed by customers.
    -- orderdetails: stores sales order line items for every sales order.
    -- payments: stores payments made by customers based on their accounts.
    -- employees: stores employee information and the organization structure such as who reports to whom.
    -- offices: stores sales office data.

-- EXERCISE 1-2 : CTE EXERCISES ---------------------------------------------------------------------------
/*
EXERCISE 1 :
Use the customers and employees from the sample database.
• The following exercise should use multiple CTEs to map the customers with their respective sales
representatives;
• Create Temporary Table from combining 2 CTE’s by select statement
*/

create temporary table temp_table1 as
with cte1 as (
  select 
    customerNumber, 
    customerName, 
    salesRepEmployeeNumber 
  from 
    customers
),
cte2 as (
  select 
    employeeNumber, 
    concat(firstName, ' ', lastName) as employeeName 
  from 
    employees
)
select cte1.customerNumber, cte1.customerName, cte2.employeeName
from cte1 join cte2
on cte1.salesRepEmployeeNumber = cte2.employeeNumber; 

/*
EXERCISE 2 :
• Create Temporary Table by selecting (partition by) each productCode displaying with MIN price of
product, MAX price of product;
• Use select statement to display results by grouping productCode with MIN price and MAX price of
products
• Use select statement to select results from both Temporary Table and Permanent Table :
productCode, productName, MIN price and MAX price
*/

create temporary table temp_table2 as
select 
  distinct productCode, 
  min(priceEach) over (partition by productCode) as minPrice,
  max(priceEach) over (partition by productCode) as maxPrice,
  orderNumber
from
orderdetails;

select group_concat(productCode, ' (', minPrice,',',maxPrice,')'), orderNumber
from temp_table2 group by orderNumber;

select 
  distinct temp_table2.productCode, 
  products.productName, 
  temp_table2.minPrice, 
  temp_table2.maxPrice
from
products join temp_table2 
on products.productCode = temp_table2.productCode;


-- EXERCISE 1-5 : TEMPORARY TABLE EXERCISES ---------------------------------------------------------------
-- 1. get sum of orders by each product code(name)
with cte as (
  select productCode,
  sum(quantityOrdered)
  from orderdetails group by productCode
) select * from cte;

-- 2. By each productLine to find count of products
with cte as (
  select productLine, count(productCode)
  from products group by productLine
) select * from cte;

-- 3. By each productCode to find min price of product, max price of product! (use window functions)
with cte as (
  select distinct products.productCode,
  min(priceEach) over (partition by productCode) as minPrice,
  max(priceEach) over (partition by productCode) as maxPrice
  from products join orderdetails
  on products.productCode = orderdetails.productCode
) select * from cte;

-- 4. By each productCode to display RANK and DENSE_RANK (use window functions)
with cte as (
  select products.productCode,
  rank() over (partition by productCode order by priceEach),
  dense_rank() over (partition by productCode order by priceEach)
  from products join orderdetails
  on products.productCode = orderdetails.productCode
) select * from cte;

-- 5. By each productLine to display RANK of buyPrice, MIN and MAX of buyPrices as well.
with cte as (
  select productLine,
  rank() over (partition by productLine order by buyPrice),
  min(buyPrice) over (partition by productLine),
  max(buyPrice) over (partition by productLine)
  from products
) select * from cte;

