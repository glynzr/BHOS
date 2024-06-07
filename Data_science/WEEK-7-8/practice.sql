-- Get number of orders by each customer
WITH num_order as (
    SELECT customers.customerNumber,customers.customerName,orders.orderNumber
from customers left join orders using(customerNumber)
)
select customerNumber,customerName,count(orderNumber) from num_order group by customerNumber;


-- Get sum of orders by each customer
WITH sum_order as (
    select customers.customerNumber,customers.customerName,orders.orderNumber,orderdetails.productCode,(orderdetails.quantityOrdered*orderdetails.priceEach) as `productprice`
from customers left join orders using(customerNumber) left join orderdetails using(orderNumber)
)
select customerNumber,customerName,orderNumber,sum(productprice)
from sum_order group by orderNumber,customerNumber;

-- List of all products with productName (inline, comma separated)
with product as (
    select * from products
)
select productCode,productName from product;


-- By each productCode(name) to find SUM of orders
WITH product_sum as(
   select products.productCode,products.productName,orderdetails.orderNumber,
   (orderdetails.quantityOrdered*orderdetails.priceEach) as `price`
from products left join orderdetails using(productCode) 
)
select productCode,productName,sum(price)
from product_sum group by productCode;

-- By each productLine to find COUNT of products
WITH prline as (
select productlines.productLine,products.productCode,products.productName
from productlines left join products using(productLine)
)
select productLine,count(productCode) from prline
group by productLine;



-- By each orderNumber to find MIN price of product, MAX price of product!(use window functions)
with price_product as (
    select orderNumber,productCode,(orderdetails.quantityOrdered*orderdetails.priceEach) as `productprice`
    from orderdetails
)
select *,
first_value(productprice) over (partition by orderNumber order by productprice ) as `min_price`,
first_value(productprice) over (partition by orderNumber order by productprice desc ) as `max_price`
from price_product;


-- EXERCISE 1 :
-- Use the customers and employees from the sample database.
-- • The following exercise should use multiple CTEs to map the customers with their respective sales
-- representatives;
-- • Create Temporary Table from combining 2 CTE’s by select statement
create temporary table ce as 
WITH c as (
    select customerNumber,customerName,salesRepEmployeeNumber
    from customers
),
e as (
    select employeeNumber,concat(firstName,' ',lastName) as `employee_name`
    from employees
)

select c.customerNumber,c.customerName,c.salesRepEmployeeNumber,e.employee_name
from c left join e on c.salesRepEmployeeNumber=e.employeeNumber;


-- EXERCISE 2 :
-- • Create Temporary Table by selecting (partition by) each orderNumber displaying with MIN price of
-- order, MAX price of order;
-- • Use select statement to display results by grouping orderNumber with MIN price of order and MAX
-- price of orders;
-- • Use select statement to select results from both Temporary Table and Permanent Table :
-- oredrNumber, productName, MIN price and MAX price
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